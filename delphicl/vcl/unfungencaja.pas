{
 Sistema: Clases Corporativas
 Fecha de Inicio: 18-Abr-07
 Función forma: Biblioteca de Funciones Generales
 Desarrollo por: Yadira Roque
}
//ROUY4095 18abr07   Se indentifica Usuario en Ventanilla y se validan Operaciones en Efectivo por 3000 USD

unit UnFunGenCaja;

interface

uses DB, DbTables, InterApl, Sysutils, Dialogs, UnSQL2;

TYPE

TRecValidarPLD = record
                  bValidarPLD: Boolean;
                  sBAutorizada: String;
                  sBInsCjPldVal: String;
                  iCodResp:    Integer;
                  sTxtResp:    String;
                end;

//ROUY4095 10abr07  Se indentifica Usuario en Ventanilla y se validan Operaciones en Efectivo por 3000 USD
Function ValidaUsuVentanilla(IdContrato : Integer;     ImporteOper : Double;    DesMoneda : String;
                             FechaOp    : TDateTime;   ClienteBI   : Integer;   pApli     : TInterApli ) : String;



//ZACM000 11JUN07-IDE Se indentifica Usuario en Ventanilla y se validan Operaciones en Efectivo de Cheques de Caja.
Function ValidaUsuVentanillaCC(IdContrato : Integer;     ImporteOper : Double;    DesMoneda : String;
                               FechaOp    : TDateTime;   ClienteBI   : Integer;   pApli     : TInterApli ) : String;


function ValidarPLD(pIdTransaccion: Integer; pIdSucursal: Integer; pTcOperacion: Double; pTipoValida: Integer; pApli: TInterApli): TRecValidarPLD;
function ObtSitCjPldValida(pIdOperacion, pIdTransGpo, pTipoOp: Integer; pApli: TInterApli): String;
function ActTransCjPldVal(pIdOperacion, pTipoOp, pIdTransGpo: Integer; pApli: TInterApli): Boolean;

//ROUY4095 10abr07
Const
  CMonedaUSD  = 840;
  CMonedaPeso = 484;

  coCheqCaj   = 1;
  coDepEfect  = 2;
  coCheqSBC   = 3;
  coCheqProp  = 4;
  coCheqImp   = 5;
  coCheqTC    = 6;
  coCheqAseg  = 7;

implementation

uses
IntUsuvent; //ROUY4095 10abr07

//ROUY4095 10abr07  Se indentifica Usuario en Ventanilla y se validan Operaciones en Efectivo por 3000 USD
Function ValidaUsuVentanilla(IdContrato : Integer;     ImporteOper : Double;    DesMoneda : String;
                             FechaOp    : TDateTime;   ClienteBI   : Integer;   pApli     : TInterApli ) : String;
var
  vlTipoCambio    : Double;
  Usuvent         : TUsuvent;
  vlDesUsuario    : String;
  QAux            : TQuery;
  spObtTipoCambio : TStoredProc;
begin
  try
    //Se obtiene la Clave Moneda Contrato
    //Las Monedas utilizadas en Efectivo son USD y Peso Mexicano
    QAux := TQuery.Create(nil);
    QAux.DatabaseName := pApli.DataBaseName;
    QAux.SessionName  := pApli.SessionName;

    QAux.Sql.Text :=   ' SELECT Cve_Moneda '
                         + ' FROM Moneda '
                         + ' WHERE '
                         + ' Desc_moneda = ' + #39 + DesMoneda + #39;
    QAux.Open;

    vlTipoCambio := 1;

    if ( QAux.FieldByName('CVE_MONEDA').AsInteger = CMonedaPeso ) then
    begin

      //Se obtiene el Tipo de Cambio a la Fecha de Op
      spObtTipoCambio := TStoredProc.Create(nil);
      spObtTipoCambio.DatabaseName   := pApli.DataBaseName;
      spObtTipoCambio.SessionName    := pApli.SessionName;
      spObtTipoCambio.StoredProcName := 'PKGCORPO.OBTTIPOCAMBIO';

      spObtTipoCambio.Params.Clear;
      spObtTipoCambio.Params.CreateParam(ftDate, 'Pfecha', ptInput);
      spObtTipoCambio.Params.CreateParam(ftFloat, 'Pcve_moneda', ptInput);
      spObtTipoCambio.Params.CreateParam(ftString, 'PBUltimoCapt', ptInput);
      spObtTipoCambio.Params.CreateParam(ftFloat, 'RESULT', ptResult);
      spObtTipoCambio.Params.ParamByName('Pfecha').AsDate         := FechaOp;
      spObtTipoCambio.Params.ParamByName('Pcve_moneda').AsFloat   := CMonedaUSD;
      spObtTipoCambio.Params.ParamByName('PBUltimoCapt').AsString := 'V';
      spObtTipoCambio.ExecProc;

      vlTipoCambio := spObtTipoCambio.Params.ParamByName('RESULT').AsFloat;

      spObtTipoCambio.Destroy;
    end;

    //Recupera el límite mínimo de USD para Usu Ventanilla en Efectivo - 01 Cve HC En tabla de parametros
    QAux.Close;
    QAux.Sql.Text :=   ' SELECT IMP_MINIMO_DLLS '
                         + ' FROM LDIN_PARAMETRO '
                         + ' WHERE '
                         + ' ID_PARAMETRO = ' + #39 + '01' + #39;
    QAux.Open;


    if (( ImporteOper / vlTipoCambio ) >= QAux.FieldByName('IMP_MINIMO_DLLS').AsFloat ) then
    begin
      //Recuperamos el No de Cliente
      QAux.Close;
      QAux.Sql.Text :=   ' SELECT ID_TITULAR '
                           + ' FROM CONTRATO '
                           + ' WHERE '
                           + ' ID_CONTRATO  = ' + IntToStr(IdContrato);
      QAux.Open;

      //Antes de Insertar El Deposito se solicita Datos Usuario Ventanilla
      Usuvent           := TUsuvent.Create(nil);
      Usuvent.Apli      := pApli;
      Usuvent.rgUsuario := ClienteBI;
      Usuvent.IdTitular := QAux.FieldByName('ID_TITULAR').AsInteger;

      if ( Usuvent.ShowUsuEvent(vlDesUsuario) = 0 ) then
      begin
         showMessage('Recuerde que es obligatorio proporcionar la información adicional del Usuario en Ventanilla para guardar la Operación.');
         Usuvent.Destroy;
         Abort;
      end;

      Usuvent.Destroy;
    end;

    ValidaUsuVentanilla :=  vlDesUsuario;
  finally
    QAux.Destroy;
  end;
end;


//ZACM000 11JUN07-IDE Se indentifica Usuario en Ventanilla y se validan Operaciones en Efectivo de Cheques de Caja.
Function ValidaUsuVentanillaCC(IdContrato : Integer;     ImporteOper : Double;    DesMoneda : String;
                               FechaOp    : TDateTime;   ClienteBI   : Integer;   pApli     : TInterApli ) : String;
var
  Usuvent         : TUsuvent;
  vlDesUsuario    : String;
  QAux            : TQuery;
begin
  QAux := TQuery.Create(nil);
  try
      //Recuperamos el No de Cliente

      QAux.DatabaseName := pApli.DataBaseName;
      QAux.SessionName  := pApli.SessionName;
      QAux.Sql.Text :=   ' SELECT ID_TITULAR '
                           + ' FROM CONTRATO '
                           + ' WHERE '
                           + ' ID_CONTRATO  = ' + IntToStr(IdContrato);
      QAux.Open;

      //Antes de Insertar El Deposito se solicita Datos Usuario Ventanilla
      Usuvent           := TUsuvent.Create(nil);
      Usuvent.Apli      := pApli;
      Usuvent.rgUsuario := ClienteBI;
      Usuvent.IdTitular := QAux.FieldByName('ID_TITULAR').AsInteger;

      if ( Usuvent.ShowUsuEvent(vlDesUsuario) = 0 ) then
      begin
         showMessage('Recuerde que es obligatorio proporcionar la información adicional del Usuario en Ventanilla para guardar la Operación.');
         Usuvent.Destroy;
         Abort;
      end;

      Usuvent.Destroy;

    ValidaUsuVentanillaCC :=  vlDesUsuario;
  finally
    QAux.Destroy;
  end;
end;

//
// Validación PLD
//
function ValidarPLD(pIdTransaccion: Integer; pIdSucursal: Integer; pTcOperacion: Double; pTipoValida: Integer; pApli: TInterApli): TRecValidarPLD;
var
  stpValidarPLD: TStoredProc;
  vlIdEmpresa:   Integer;
  vlCveUsrReg:   String;
  vlTcOperacion: Double;
  vlFOperacion:  TDateTime;

begin
  stpValidarPLD := tStoredProc.Create(nil);
  stpValidarPLD.DatabaseName := pApli.DataBaseName;
  stpValidarPLD.SessionName  := pApli.SessionName;
  try
    stpValidarPLD.Params.Clear;
    stpValidarPLD.StoredProcName := 'PKGCAJA.STPVALIDARPLD';

    stpValidarPLD.Params.CreateParam(ftFloat, 'peID_EMPRESA', ptInput);
    stpValidarPLD.Params.CreateParam(ftFloat, 'peID_OPERACION', ptInput);
    stpValidarPLD.Params.CreateParam(ftFloat, 'peID_TRANSACCION', ptInput);
    stpValidarPLD.Params.CreateParam(ftFloat, 'peID_SUCURSAL', ptInput);
    stpValidarPLD.Params.CreateParam(ftString, 'peCVE_USR_REG', ptInput);
    stpValidarPLD.Params.CreateParam(ftFloat, 'peTC_OPERACION', ptInput);
    stpValidarPLD.Params.CreateParam(ftDateTime, 'peF_OPERACION', ptInput);
    stpValidarPLD.Params.CreateParam(ftFloat, 'peTipoValida', ptInput);
    stpValidarPLD.Params.CreateParam(ftString, 'psBAutorizada', ptOutput);
    stpValidarPLD.Params.CreateParam(ftString, 'psBInsCjPldVal', ptOutput);
    stpValidarPLD.Params.CreateParam(ftFloat, 'psCodResp', ptOutput);
    stpValidarPLD.Params.CreateParam(ftString, 'psDescResp', ptOutput);

    // Id Empresa
    vlIdEmpresa := pApli.IdEmpresa;

    // Usuario Registrado (Usuario Ventanilla)
    vlCveUsrReg := pApli.Usuario;

    // Tipo de Cambio
    vlTcOperacion := pTcOperacion;

    // Fecha Operacion
    vlFOperacion := pApli.DameFechaEmpresaDia('D000');

    stpValidarPLD.ParamByName('peID_EMPRESA').AsFloat := vlIdEmpresa;
    stpValidarPLD.ParamByName('peID_OPERACION').AsFloat := pIdTransaccion;
    stpValidarPLD.ParamByName('peID_TRANSACCION').AsFloat := pIdTransaccion;
    stpValidarPLD.ParamByName('peID_SUCURSAL').AsFloat := pIdSucursal;
    stpValidarPLD.ParamByName('peCVE_USR_REG').AsString := vlCveUsrReg;
    stpValidarPLD.ParamByName('peTC_OPERACION').AsFloat := pTcOperacion;
    stpValidarPLD.ParamByName('peF_OPERACION').AsDateTime := vlFOperacion;
    stpValidarPLD.ParamByName('peTipoValida').AsFloat := pTipoValida;

    stpValidarPLD.ExecProc;

    If (stpValidarPLD.ParamByName('psCodResp').AsFloat <> 0 )Then
      begin
          ValidarPLD.bValidarPLD  := False;
          ValidarPLD.sBAutorizada  := stpValidarPLD.ParamByName('psBAutorizada').AsString;
          ValidarPLD.sBInsCjPldVal  := stpValidarPLD.ParamByName('psBInsCjPldVal').AsString;
          ValidarPLD.iCodResp     := stpValidarPLD.ParamByName('psCodResp').AsInteger;
          ValidarPLD.sTxtResp     := stpValidarPLD.ParamByName('psDescResp').AsString;
      end
    else
    begin
          ValidarPLD.bValidarPLD  := True;
          ValidarPLD.sBAutorizada  := stpValidarPLD.ParamByName('psBAutorizada').AsString;
          ValidarPLD.sBInsCjPldVal  := stpValidarPLD.ParamByName('psBInsCjPldVal').AsString;
          ValidarPLD.iCodResp     := stpValidarPLD.ParamByName('psCodResp').AsInteger;
          ValidarPLD.sTxtResp     := stpValidarPLD.ParamByName('psDescResp').AsString;;
    end;

  Finally
    If stpValidarPLD <> Nil Then
      stpValidarPLD.Free;
  End;

end;

//
// Recupera la Situacion de una Validacion PLD
//
function ObtSitCjPldValida(pIdOperacion, pIdTransGpo, pTipoOp: Integer; pApli: TInterApli): String;
var
   sSQL:        String;
   sIdTransGpo: String;
   qyQuery:     TQuery;
begin

    if (pIdTransGpo > 0) then
      sIdTransGpo := '  AND id_trans_gpo = ' + IntToStr(pIdTransGpo);

    sSQL :=  'SELECT cve_situacion ' +
             '  FROM cj_pld_valida ' +
             ' WHERE id_operacion = ' + IntToStr(pIdOperacion) +
             sIdTransGpo +
             '   AND tipo_op = ' + IntToStr(pTipoOp);

    qyQuery:= GetSQLQuery(sSQL, pApli.DataBaseName, pApli.SessionName, False);

    If qyQuery<>Nil Then Begin
      ObtSitCjPldValida := qyQuery.FieldByName('cve_situacion').AsString;
      qyQuery.Free;
    End
    else
      ObtSitCjPldValida := '';
end;

//
// Actualizar el Id Grupo Transaccion de una Validacion PLD
//
function ActTransCjPldVal(pIdOperacion, pTipoOp, pIdTransGpo: Integer; pApli: TInterApli): Boolean;
var
   sSQL:        String;
   qyQuery:     TQuery;
begin

    sSQL := 'UPDATE cj_pld_valida ' +
            '   SET id_trans_gpo = ' + IntToStr(pIdTransGpo) +
            ' WHERE id_operacion = ' + IntToStr(pIdOperacion) +
            '   AND tipo_op = ' + IntToStr(pTipoOp);

    if RunSQL(sSQL, pApli.DataBaseName, pApli.SessionName, False) then
      ActTransCjPldVal := True
    else
      ActTransCjPldVal := False;

end;

end.
