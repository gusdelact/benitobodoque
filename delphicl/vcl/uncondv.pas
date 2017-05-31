unit UnConDV;
//------------------------------------------------------------------------------
//* Sistema     : Sistema de Depósitos a la Vista
//* Descripción : Constantes y funciones comunes en el sistema.
//* Fecha       : Junio de 1999
//* Desarrollo  : Marcos Zárate Castro.
//------------------------------------------------------------------------------

interface
Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterApl, UnSQL2, Printers,
  IntFrm, intLiqDVBloq, UnGene, UnConInv;

Const
    cNoProcesado=         'NP';     //No procesado
    cAutorizado =         'AU';     //Autorizado
    cCancelado  =         'CA';     //Cancelado
    cCancEfec   =         'CE';     //Cancelado autorizado
    cVerdad     =         'V';      //Verdadero
    cFalso      =         'F';      //Falso
    cActivo     =         'AC';     //Situación Activo
    cBloqueado  =         'BL';     //Situación Bloqueado
    cEmpBanco   =         2;        //Empresa Banco
    cEmpBancoDls=         11;       //Empresa Banco Dólares
    cEmpifs     =         5;        //Empresa Interfinancial
    cPesos      =         484;      //Moneda Pesos
    cUdis       =         800;      //Moneda Udis
    cDolares    =         840;      //Moneda dólares
    cCDVIBco    =         'CDVI';   //Tipo de contrato D. Vista Banco
    cCDVIfs     =         'IDVI';   //Tipo de co ntrato D. Vista Interfinancial
    cCDVIBDl    =         'BDVI';   //Tipo de contrato D. Vista Banco Dólares
    cCtaIFSDef  =         '62908-25588';
    cBcoIFSDef  =         '22325';
    cCtaBDLDef  =         '62905-27154';
    cBcoBDLDef  =         '22325';
    cViaIFSDef  =         'TERCER';   //Default es Bofa terceros
    cViaBDLDef  =         'BOFA';
    cViaBCODef  =         'SPEUA';
    cExcNoLiquida=        'NOLIQU';  // No liquida (Retira dinero) del contrato
    cExcIniMov  =         'INIDPV';
    cExcDpv     =         'DPVIST';
    cDecrementa =         'D';
    cExcRepChq  =         'DPCTPR';
    cCptoChq    =         'RPCHQBCO';
    cIdCtoIniMov=         '0';
    cTCtoInv    =         'INPA';
    cTCtoDV     =         'CAHO';
    cTCtoEJE    =         'DVSD';
    cClaveSecr  =         '1MPOS1BL';
    cDEFECT     =         'DEFSUC';
    cREFECT     =         'REFSUC';
    cDEFSUA     =         'DEFSUA';
    cREFSUA     =         'REFSUA';
    cDEFCTR     =         'DEFECT';
    cREFCTR     =         'RPFICV';


    cDEFSCA     =         'DEFSCA';  //Cancelación Depósito Inversión
    cDEFACA     =         'DEFACA';  //Cancelación Depósito Ahorro
    cREFACA     =         'REFACA'; //Cancelación Retiro Inversión
    cREFSCA     =         'REFSCA'; //Cancelación Retiro Ahorro


function GenEspacios(pNumEspac: Integer):String;

function LiqBloqueada(pObjeto:TInterFrame): Boolean;

function EsContraCuenta(pContrato:TInterframe): Boolean;

function CtoBloqRet(pLiquidac:TInterframe): Boolean;

function SitCto(pContrato : String; pApli : TInterApli ): String;

function funAplFecha(pApli : TInterApli):Boolean;

procedure  BuscaFecIniMov(Var pFecha : TDateTime; Var pFechaFin : TDateTime;  pApli : TInterApli);

function ObtenDatosSucu(pApli : TInterApli; peUsuario : String; Var pSucursal : String; Var pDescSucu : String; Var pCaja : String; Var pFechaSucu: TDateTime; Var pEntidad :String; Var pDescEntid : String; Var pEmpresa :String; Var pNomEmpr:String; Var pNomUsu : String; Var NomSuc : String):Boolean;

function funValidaFHabil(pApli : TInterApli):Boolean;

//Valida si un tipo de contrato es de depósitos a la vista
function EsProdDVista(pApli : TInterApli; pCveTipCto: String): Boolean;

//Obten saldo de D. Vista. Mzarate. 21-feb-2004.
function BuscaSdo(pID_CONTRATO : Double;
                  Var pDescProc: String;
                  Var pSaldo   : Double;
                  pApli        : TInterapli):Boolean;


function ObtenSucursal(pApli : TInterApli; peUsuario : String; Var pSucursal : String):Boolean;


implementation

function GenEspacios(pNumEspac:Integer):String;
Var vlcadena : String;
    i        : Integer;
begin vlcadena :='';
      GenEspacios:=vlcadena;
      for i:=1 to pNumEspac do vlcadena:=vlcadena + ' ';
      GenEspacios:=vlcadena;
end;

function LiqBloqueada(pObjeto:TInterFrame): Boolean;
Var qConsulta : TQuery;
    vlSQL     : String;
begin //Si el usuario tiene una excepción, se salta la validación de No Bloqueo
      vlSQL:='SELECT Cve_Oper_acc From Secu_Oper_Acc ' +
             ' WHERE Cve_Funcion = ''' + pObjeto.Apli.LastFuncion + '''' +
             '   and Cve_Usuario = ''' + pObjeto.Apli.Usuario + '''' +
             '   and Cve_Oper_Acc = ''NB''';
      if GetSql(vlSQL,pObjeto.Apli.DataBaseName, pObjeto.Apli.SessionName, False) then
      begin
        LiqBloqueada:=False;
        Exit;
      end;

      LiqBloqueada:=False;
      qConsulta := TQuery.Create(Nil);
      try  qConsulta.Databasename:=pObjeto.databasename;
           qConsulta.SessionName :=pObjeto.SessionName;
           qConsulta.SQL.Text:='SELECT Count(*) as Cuenta FROM DV_PARAMETRO ' +
                               ' WHERE B_CAP_SOLIC_LIQ =''F'' AND ID_PARAMETRO = ''00''';
           qConsulta.Open;
           if qConsulta.FieldByName('CUENTA').AsInteger > 0
           then begin
                  MuestraLiqDVBloq;
                  LiqBloqueada:=True;
                end
           else begin
                  LiqBloqueada:=False;
                end;
      finally
         if qConsulta <> nil then qConsulta.free;
      end;
end;

function EsContraCuenta(pContrato:TInterframe): Boolean;
Var qConsulta : TQuery;
    vlSQL     : String;
    vlEntidad : Double;
begin EsContraCuenta:=False;
      //Obtiene la entidad
      vlEntidad:=ObtenEntidad(pContrato);
      qConsulta := TQuery.Create(Nil);
      try  qConsulta.Databasename:=pContrato.databasename;
           qConsulta.SessionName :=pContrato.SessionName;
           qConsulta.SQL.Text:=' SELECT Count(*) As Cuenta ' +
                               '  FROM DV_OPER_CTRACTA ' +
                               ' WHERE ID_CONTR_CTRACTA = ' + pContrato.FieldByName('ID_CONTRATO').AsString + ' AND ' +
                               '       ID_ENTIDAD       = ' + FloatToStr(vlEntidad);
           qConsulta.Open;
           EsContraCuenta:=(qConsulta.FieldByName('CUENTA').AsInteger > 0);
      finally
         if qConsulta <> nil then qConsulta.free;
      end;
end;

function CtoBloqRet(pLiquidac:TInterframe): Boolean;
Var qConsulta : TQuery;
    vlSQL     : String;
begin CtoBloqRet:=False;
      qConsulta := TQuery.Create(Nil);
      try  qConsulta.Databasename:=pLiquidac.databasename;
           qConsulta.SessionName :=pLiquidac.SessionName;
           qConsulta.SQL.Text:=' SELECT * ' +
                               '  FROM EXCEPCION_CTE' +
                               ' WHERE ID_CONTRATO   =   ' + pLiquidac.FieldByName('ID_CONTRATO_DV').AsString + ' AND ' +
                               '       CVE_TIP_EXCEP = ''' + cExcNoLiquida + '''';
           qConsulta.Open;
           if qConsulta.RecordCount > 0 then
           begin
              if qConsulta.FieldByName('SIT_EXCEPCION').AsString = cActivo then
              begin
                 if (qConsulta.FieldByName('F_FIN').AsString = '') or
                    (qConsulta.FieldByName('F_FIN').AsDateTime >= pLiquidac.Apli.DameFechaEmpresa)
                 then begin
                       CtoBloqRet:=True;
                       MessageDlg('El contrato está bloqueado para realizar este tipo de operación',mtError,[mbOK],0);
                      end;
              end;
           end;
      finally
         if qConsulta <> nil then
         begin
             qConsulta.Close;
             qConsulta.free;
         end;
      end;
end;


function SitCto(pContrato : String; pApli : TInterApli ): String;
Var qConsulta : TQuery;
begin SitCto:='ER';
      qConsulta := TQuery.Create(Nil);
      try  qConsulta.Databasename:=pApli.databasename;
           qConsulta.SessionName :=pApli.SessionName;
           qConsulta.SQL.Text:=' SELECT sit_contrato ' +
                               '  FROM CONTRATO' +
                               ' WHERE ID_CONTRATO   =   ' + pContrato;
           qConsulta.Open;
           if qConsulta.RecordCount > 0
           then SitCto:= qConsulta.FieldByName('SIT_CONTRATO').AsString;
           qConsulta.Close;

      finally
         if qConsulta <> nil then qConsulta.free;
      end;
end;

function funAplFecha(pApli : TInterApli):Boolean;
Var qConsulta : TQuery;
var qUsuario  : String;
begin
      qUsuario:= pApli.Usuario;
      qConsulta := TQuery.Create(Nil);
      try  qConsulta.Databasename:=pApli.databasename;
           qConsulta.SessionName :=pApli.SessionName;
           qConsulta.SQL.Text:=' SELECT count(*) as CUENTA' +
                               '  FROM EXCEPCION_CTE' +
                               ' WHERE '+
                               '      CVE_USUAR_ALTA = ''' + Papli.Usuario   + '''  AND ' +
                               '      CVE_TIP_EXCEP  = ''' + cExcIniMov + '''';
           qConsulta.Open;
           funAplFecha:=(qConsulta.FieldByName('CUENTA').AsInteger <> 0);

      finally
         if qConsulta <> nil then
         begin
             qConsulta.Close;
             qConsulta.free;
         end;
      end;
end;

procedure  BuscaFecIniMov(Var pFecha : TDateTime; Var pFechaFin : TDateTime;  pApli : TInterApli);
Var qConsulta : TQuery;
begin

      qConsulta := TQuery.Create(Nil);
      try  qConsulta.Databasename:=pApli.databasename;
           qConsulta.SessionName :=pApli.SessionName;
           qConsulta.SQL.Text:=' SELECT F_REFERENCIA - 60  AS F_INICIO, F_REFERENCIA AS F_FIN ' +
                               '  FROM FECHA_EMPRESA ' +
                               ' WHERE    '+
                               '       ID_EMPRESA = ' + inttostr(cEmpBanco) +
                               '   AND CVE_DIA_LIQUIDA = ''D000'' ';
           qConsulta.Open;
           if qConsulta.RecordCount = 0
           then Raise EInterFrame.Create('No se encuentra parámetro Cod. 997765')
           else begin
                  pFecha    := qConsulta.FieldByName('F_INICIO').AsDateTime;
                  pFechaFin := qConsulta.FieldByName('F_FIN').AsDateTime;
                end;

      finally
         if qConsulta <> nil then
         begin
             qConsulta.Close;
             qConsulta.free;
         end;
      end;
end;


function ObtenDatosSucu(pApli : TInterApli; peUsuario : String; Var pSucursal : String; Var pDescSucu : String; Var pCaja : String; Var pFechaSucu: TDateTime; Var pEntidad :String; Var pDescEntid : String; Var pEmpresa :String; Var pNomEmpr:String; Var pNomUsu : String; Var NomSuc : String):Boolean;
Var vlSucursal : String;
    qConsulta  : TQuery;
begin
      ObtenDatosSucu:=False;
      qConsulta  := TQuery.Create(nil);
      try
         qConsulta.DatabaseName:=pApli.DataBaseName;
         qConsulta.SessionName :=pApli.SessionName;
         qConsulta.sql.text:='SELECT * FROM CJ_CAJA WHERE CVE_USUARIO=''' + peUsuario + '''';
         if trimRight(pSucursal) <> ''
         then qConsulta.sql.text:=qConsulta.sql.text + ' and ID_SUCURSAL = ' + pSucursal;

         qConsulta.open;
         if qConsulta.isempty
         then begin
                 qConsulta.free;
                 MessageDlg('El usuario no tiene una Caja registrada',mtError,[mbOK],0);
                 exit;
              end
         else begin
            pSucursal:=qConsulta.FieldByName('ID_SUCURSAL').AsString;
            pCaja    :=qConsulta.FieldByName('ID_CAJA').AsString;
            pEmpresa :=qConsulta.FieldByName('ID_EMPRESA').AsString;
            pNomEmpr :=DLOOKUP(pAPli.Databasename,pAPli.SessionName,'NOMBRE','PERSONA','ID_PERSONA =' + pEmpresa);
            pNomUsu  :=PAPLI.UsuarioNombre;

         end;
      finally
         qConsulta.free;
      end;

      //Busca la fecha
      qConsulta  := TQuery.Create(nil);
      try
         qConsulta.DatabaseName:=pApli.DataBaseName;
         qConsulta.SessionName :=pApli.SessionName;
         qConsulta.sql.text:='SELECT * FROM CJ_SUCURSAL WHERE ID_SUCURSAL=' + pSucursal ;
         qConsulta.open;
         if qConsulta.isempty
         then begin
                qConsulta.free;
                MessageDlg('LA SUCURSAL NO EXISTE ',mtError,[mbOK],0);
                exit;
              end
         else begin
                pFechaSucu :=qConsulta.FieldByNAme('F_OPERACION').AsDateTime;
                pEntidad   :=qConsulta.FieldByNAme('ID_ENTIDAD').AsString;
                pDescEntid :=DLOOKUP(pAPli.Databasename,pAPli.SessionName,'DESC_ENTIDAD','UNIDAD_NEGOCIO','ID_ENTIDAD =' + pEntidad);
                pDescSucu  :=qConsulta.FieldByNAme('NOM_SUCURSAL').AsString;
         end;
      finally
         qConsulta.free;
      end;
      ObtenDatosSucu:=true;
end;


function funValidaFHabil(pApli : TInterApli):Boolean;
Var vlBValFec  : String;
    qConsulta  : TQuery;
begin
      funValidaFHabil:=False;
      qConsulta  := TQuery.Create(nil);
      try
         qConsulta.DatabaseName:=pApli.DataBaseName;
         qConsulta.SessionName :=pApli.SessionName;
         qConsulta.sql.text:='SELECT B_VAL_F_INHABIL FROM EMPRESA WHERE ID_EMPRESA =' + InttoStr(pApli.IdEmpresa);
         qConsulta.open;
         if qConsulta.isempty
         then begin
                 qConsulta.free;
                 MessageDlg('No se localizó la empresa solicitada ' ,mtError,[mbOK],0);
                 exit;
              end
         else begin
                if qConsulta.FieldByName('B_VAL_F_INHABIL').AsString = 'V'
                then funValidaFHabil:=True
                else funValidaFHabil:=False;
         end;
      finally
         qConsulta.free;
      end;

end;

//Valida si un tipo de contrato es de depósitos a la vista
function EsProdDVista(pApli : TInterApli; pCveTipCto: String): Boolean;
Var qConsulta : TQuery;
    vlSQL     : String;
begin EsProdDVista:=False;
      qConsulta := TQuery.Create(Nil);
      try  qConsulta.Databasename:=pApli.databasename;
           qConsulta.SessionName :=pApli.SessionName;
           qConsulta.SQL.Text:=' select PRO.CVE_TIP_CONTRATO ' +
                               '  from dv_producto DVP, producto pro ' +
                               '  where pro.cve_producto = dvp.cve_producto ' +
                               '    and pro.cve_tip_contrato = ''' + pCveTipCto + ''' ';
           qConsulta.Open;
           if qConsulta.RecordCount > 0
           then EsProdDVista:=True;
      finally
         if qConsulta <> nil then
         begin
             qConsulta.Close;
             qConsulta.free;
         end;
      end;
end;

//Obten saldo de D. Vista. Mzarate. 21-feb-2004.
function BuscaSdo(pID_CONTRATO : Double;
                  Var pDescProc: String;
                  Var pSaldo   : Double;
                  pApli        : TInterapli):Boolean;
Var Sp      : tStoredProc;
    CodResp : Double;
    Descproc: String;
begin
    BuscaSdo:=False;
    sp:=TStoredProc.Create(Nil);
    try
       sp.DatabaseName:=pApli.DataBaseName;
       sp.SessionName :=pApli.SessionName;
       sp.StoredProcName:='PKGDPVISTASERV.SPTOBTIENESALDO';
       sp.Params.CreateParam(ftFloat, 'PE_IDCONTRATO',  ptInput);
       sp.Params.CreateParam(ftString,'PE_CVEDIALIQ',   ptInput);
       sp.Params.CreateParam(ftFloat, 'PS_SALDO',       ptOutput);
       sp.Params.CreateParam(ftFloat, 'PSRESULTADO',   ptOutput);
       sp.Params.CreateParam(ftString, 'PSTXRESULTADO',ptOutput);

       //Asigna los valores de entrada
       sp.Params.ParamByName('PE_IDCONTRATO').AsFloat:=pID_CONTRATO;
       sp.Params.ParamByName('PE_CVEDIALIQ').AsString:='D000';

       //Prepara y ejecuta el stored procedure
       sp.ExecProc;

       //Obtiene el resultado de la ejecución del stored procedure
       CodResp  :=sp.parambyname('PSRESULTADO').AsFloat;
       Descproc :=sp.parambyname('PSTXRESULTADO').AsString;
       BuscaSdo:=(CodResp=0);
       pDescProc:=Descproc;
       if CodResp <> 0
       then begin
              MessageDlg(Descproc,mtError,[mbOK],0);
            end
       else begin
              pSaldo:=sp.parambyname('PS_SALDO').AsFloat;
            end;
    finally sp.free;
    end;
end;

//MZarate. 05-jul-05
function ObtenSucursal(pApli : TInterApli; peUsuario : String; Var pSucursal : String):Boolean;
Var
    qConsulta  : TQuery;
begin
      ObtenSucursal:=False;
      qConsulta  := TQuery.Create(nil);
      try
         qConsulta.DatabaseName:=pApli.DataBaseName;
         qConsulta.SessionName :=pApli.SessionName;
         qConsulta.sql.text:='SELECT * FROM CJ_CAJA WHERE CVE_USUARIO=''' + peUsuario + '''';
         qConsulta.open;
         if qConsulta.isempty
         then begin
                 qConsulta.free;
                 MessageDlg('El usuario no tiene una Caja registrada',mtError,[mbOK],0);
                 exit;
              end
         else begin
            if qConsulta.RecordCount > 1 then
            begin
               pSucursal:=Inputbox( 'Usted tiene acceso a más de una sucursal','Ingrese la sucursal:',qConsulta.FieldByName('ID_SUCURSAL').AsString);
               ObtenSucursal:=True;
            end
            else
            begin
               pSucursal:=qConsulta.FieldByName('ID_SUCURSAL').AsString;
               ObtenSucursal:=True;
            end;
         end;
      finally
         qConsulta.free;
      end;
end;



end.
