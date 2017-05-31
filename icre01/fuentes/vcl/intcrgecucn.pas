// Sistema         : Clase de CR_GEN_CUOTA_CN
// Fecha de Inicio : 05/07/2006
// Función forma   : Clase de CR_GEN_CUOTA_CN
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Sergio Eduardo Lopez Lopez
// Comentarios     :
Unit IntCrGeCuCn;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, IntSGCtrl, Menus,
//
IntParamCre,   // Parámetro
IntCrAcredit,  // Acreditado
IntCrCto,      // Contrato
IntCrCredito,  // Disposición
IntCrCoCuAc,   // Comisiones x plan de pago
IntCrCatComi   // Comisiones
;

Type
  TCrGeCuCn      = class;

  TWCrGenCuotaCn = Class(TForm)
    InterForma1             : TInterForma;
    Label22: TLabel;
    lbIMP_CREDITO: TLabel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    edF_VENCIMIENTO: TEdit;
    dtF_VENCIMIENTO: TInterDateTimePicker;
    btACEPTA: TBitBtn;
    btCANCELA: TBitBtn;
    edIMP_COMISION: TInterEdit;
    Label6: TLabel;
    lbTOT_PER_COM: TLabel;
    SGClBusMovNoAut: TSGCtrl;
    btVALIDA_TABLA: TBitBtn;
    PopupMenu1: TPopupMenu;
    AgregarPeriodo1: TMenuItem;
    BorrarPeriodo1: TMenuItem;
    ModificarMonto1: TMenuItem;
    lbFiltro: TLabel;
    edDESC_ACCESORIO: TEdit;
    edID_ACCESORIO: TEdit;
    lbCVE_COMISION: TLabel;
    edCVE_COMISION: TEdit;
    edDESC_COMISION: TEdit;
    edIMP_IVA: TInterEdit;
    Label4: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure btACEPTAClick(Sender: TObject);
    procedure AgregarPeriodo1Click(Sender: TObject);
    procedure ModificarMonto1Click(Sender: TObject);
    procedure BorrarPeriodo1Click(Sender: TObject);
    procedure btCANCELAClick(Sender: TObject);
    procedure btVALIDA_TABLAClick(Sender: TObject);
    procedure edIMP_COMISIONExit(Sender: TObject);
    procedure edF_VENCIMIENTOExit(Sender: TObject);
    procedure dtF_VENCIMIENTOExit(Sender: TObject);
  private
    Procedure ReQueryCuotas;
    procedure OnOffControles( Bandera : Boolean );
    Function  ValidaFechaVencto : Boolean;
    Function  AsignaIVA : Double;
    // RABA FEB 2012 PPP
    Procedure AgregaPerAuto;
    //
  private
    ModoForma : TModo;
    IsFertig  : Boolean;
  public
    Objeto    : TCrGeCuCn;
  end;
  //
  
  TCrGeCuCn= class(TInterFrame)
  private
        function    getSQLQuery( peMetodo : Integer )     : String;
        function    stpAltaComCuota( peMetodo : Integer ) : Boolean;
        function    stpAutorizaPlan : Boolean;
        function    stpCalculaIVA  ( Importe  : Double  ) : Double;
  protected
  public
        ID_ACCESORIO             : TInterCampo;
        FOL_ACCESORIO            : TInterCampo;
        CVE_ACCESORIO            : TInterCampo;
        CVE_COMISION             : TInterCampo;

        NUM_PERIODO              : TInterCampo;
        IMP_COMISION             : TInterCampo;
        IVA_COMISION             : TInterCampo;
        F_VENCIMIENTO            : TInterCampo;
        //
        ParamCre                 : TParamCre;
        Acreditado               : TCrAcredit;
        Contrato                 : TCrCto;
        Comision                 : TCrCatComi;
        Credito                  : TCrCredito;
        CrCoCuAc                 : TCrCoCuAc;

        vgImporteCom : Double;
        //
        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
  published
  end;



implementation
uses IntGenCre;
//Uses RepMon;

{$R *.DFM}


constructor TCrGeCuCn.Create( AOwner : TComponent );
begin
      Inherited;
      ID_ACCESORIO  := CreaCampo('ID_ACCESORIO',   ftFloat,  tsNinguno, tsNinguno, True);
      FOL_ACCESORIO := CreaCampo('FOL_ACCESORIO',  ftFloat,  tsNinguno, tsNinguno, True);
      CVE_ACCESORIO := CreaCampo('CVE_ACCESORIO',  ftString, tsNinguno, tsNinguno, True);
      CVE_COMISION  := CreaCampo('CVE_COMISION',   ftString, tsNinguno, tsNinguno, True);
      NUM_PERIODO   := CreaCampo('NUM_PERIODO',    ftFloat,  tsNinguno, tsNinguno, True);

      IMP_COMISION  := CreaCampo('IMP_COMISION',   ftFloat,  tsNinguno, tsNinguno, True);
      IVA_COMISION  := CreaCampo('IVA_COMISION',   ftFloat,  tsNinguno, tsNinguno, True);
      F_VENCIMIENTO := CreaCampo('F_VENCIMIENTO',  ftDate,   tsNinguno, tsNinguno, True);
      //
      ID_ACCESORIO.Caption  := 'Número de Accesorio';
      FOL_ACCESORIO.Caption := 'Fol Accesorio';
      CVE_ACCESORIO.Caption := 'Clave de Accesorio';
      CVE_COMISION.Caption  := 'Clave de Comision';
      NUM_PERIODO.Caption   := 'Número de período';
      IMP_COMISION.Caption  := 'Importe de Comision';
      IVA_COMISION.Caption  := 'IVA de Comision';
      F_VENCIMIENTO.Caption := 'Clave de Comision';
      //
      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource := Self;
      Contrato   := TCrCto.Create(Self);
      Contrato.MasterSource   := Self;
      Comision   := TCrCatComi.Create(Self);
      Comision.MasterSource   := Self;
      Credito    := TCrCredito.Create(Self);
      Credito.MasterSource    := Self;
      CrCoCuAc   := TCrCoCuAc.Create(Self);
      CrCoCuAc.MasterSource  := Self;
      //
      StpName  := ' '; 
      UseQuery := False;
      HelpFile := 'IntCrGeCuCn.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrGeCuCn.Destroy;
begin
      if Acreditado <> nil then Acreditado.Free;
      if Contrato   <> nil then Contrato.Free;
      if Comision   <> nil then Comision.Free;
      if Credito    <> nil then Credito.Free;
      if CrCoCuAc   <> nil then CrCoCuAc.Free;
      //
      Inherited;
end;


function TCrGeCuCn.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrGenCuotaCn;
begin
   W:=TWCrGenCuotaCn.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftConsulta; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrGeCuCn.InternalBusca:Boolean;
var  T : TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('ICrGeCC.it','');
  Try
    if Active then begin end;
    if T.Execute then InternalBusca := FindKey([]);
  finally
    T.Free;
  end;
end;

function TCrGeCuCn.Reporte:Boolean;
begin //Execute_Reporte();
end;

function TCrGeCuCn.getSQLQuery( peMetodo : Integer ): String;
begin
  if peMetodo = 1 then
    Result := 'SELECT   F_VENCIMIENTO,'                 + coCRLF +
              '         F_PROG_PAGO,'                   + coCRLF +
              '         NUM_PERIODO,'                   + coCRLF +
              '         PLAZO,'                         + coCRLF +
              '         IMP_CUOTA,'                     + coCRLF +
              '         IMP_IVA,'                       + coCRLF +
              '         SIT_COM_CUOTA'                  + coCRLF +
              'FROM     CR_COM_CUOTA_ACC'               + coCRLF +
              'WHERE    ID_ACCESORIO  = ' + ID_ACCESORIO.AsString           + coCRLF +
              '  AND    FOL_ACCESORIO = ' + FOL_ACCESORIO.AsString          + coCRLF +
              '  AND    CVE_ACCESORIO = ' + SQLStr( CVE_ACCESORIO.AsString) + coCRLF +
              '  AND    CVE_COMISION  = ' + SQLStr( CVE_COMISION.AsString)
  else if peMetodo = 2 then
    Result := 'SELECT   COUNT(*) VECES'                 + coCRLF +
              'FROM     CR_COM_CUOTA_ACC'               + coCRLF +
              'WHERE    ID_ACCESORIO  = ' + ID_ACCESORIO.AsString           + coCRLF +
              '  AND    FOL_ACCESORIO = ' + FOL_ACCESORIO.AsString          + coCRLF +
              '  AND    CVE_ACCESORIO = ' + SQLStr( CVE_ACCESORIO.AsString) + coCRLF +
              '  AND    CVE_COMISION  = ' + SQLStr( CVE_COMISION.AsString)  + coCRLF +
              '  AND    SIT_COM_CUOTA = ''AU'' ';
  ;
end;

function TCrGeCuCn.stpCalculaIVA( Importe : Double ): Double;
//var stpCalcIVA : TStoredProc;
var sSql : String;
    rPct : Real;
begin
  FillChar(rPct, sizeof(rPct), #0 );
  sSql := 'SELECT PKGCRCOMUN.STPPCTIVA PCT_IVA FROM DUAL';
  GetSQLFloat( sSql, Apli.DataBaseName, Apli.SessionName, 'PCT_IVA', rPct, False );
  Result := rPct;
  //
  {
  stpCalcIVA := TStoredProc.Create(nil);
  try
    //
    with stpCalcIVA do
    begin
      DatabaseName := Apli.DatabaseName;
      SessionName  := Apli.SessionName;
      StoredProcName:= 'PKGIMPUESTO.CALCULAIVA';
      // Se crean los parametros del StoreProcedure
      Params.Clear;
      //
      Params.CreateParam(ftFloat,  'peIdContrato',     ptInput  );
      Params.CreateParam(ftFloat,  'peIdEmpresa',      ptInput  );
      Params.CreateParam(ftString, 'pesCveResidencia', ptInputOutput );
      Params.CreateParam(ftFloat,  'peMonto',          ptInput  );
      Params.CreateParam(ftFloat,  'psMontoIVA',       ptOutput );
      Params.CreateParam(ftFloat,  'psPctIva',         ptOutput );
      Params.CreateParam(ftString, 'psAplicoIVA',      ptOutput );
      Params.CreateParam(ftFloat,  'psReturn',         ptOutput );
      //
      ParamByName('peIdEmpresa' ).AsInteger := Apli.IdEmpresa;
      ParamByName('peMonto').AsFloat        := Importe;
      ParamByName('peIdContrato').Clear;
      ParamByName('pesCveResidencia').Clear;
      ExecProc;
      if ParamByName('psReturn').AsInteger = 0 then
      begin
        Result := ParamByName('psMontoIVA').AsFloat;
      end else begin
        MessageDlg('Error al calcular el importe de IVA: ' + ParamByName('psReturn').AsString,
                    mtWarning, [mbOk], 0 );
      end;
    end;
  finally
    stpCalcIVA.Free;
  end;
  }
  //
End;


function TCrGeCuCn.stpAltaComCuota( peMetodo : Integer ) : Boolean;
var  stpAltaCuota  : TStoredProc;
begin
  Result := False;
  stpAltaCuota := TStoredProc.Create(nil);
  try
    //
    with stpAltaCuota do
    begin
      DatabaseName := Apli.DatabaseName;
      SessionName  := Apli.SessionName;
      StoredProcName:= 'PKGCRCOMISIONES.STPPLANPAGOCOM';
      // Se crean los parametros del StoreProcedure
      Params.Clear;
      Params.CreateParam(ftFloat,  'PEIDEMPRESA',      ptInput  );
      Params.CreateParam(ftFloat,  'PEID_ACCESORIO',   ptInput  );
      Params.CreateParam(ftFloat,  'PEFOL_ACCESORIO',  ptInput  );
      Params.CreateParam(ftString, 'PECVE_ACCESORIO',  ptInput  );
      Params.CreateParam(ftString, 'PECVE_COMISION',   ptInput  );
      Params.CreateParam(ftFloat,  'PENUM_PERIODO',    ptInput  );
      Params.CreateParam(ftDate,   'PEF_VENCIMIENTO',  ptInput  );
      Params.CreateParam(ftFloat,  'PEIMP_CUOTA',      ptInput  );
      Params.CreateParam(ftFloat,  'PEIMP_IVA',        ptInput  );
      Params.CreateParam(ftFloat,  'PEMETODO',         ptInput  );
      Params.CreateParam(ftString, 'PEBCOMMIT',        ptInput  );
      Params.CreateParam(ftFloat,  'PSRESULTADO',      ptOutput );
      Params.CreateParam(ftString, 'PSTXRESULTADO',    ptOutput );
      //
      ParamByName('PEIDEMPRESA'     ).AsInteger := Apli.IdEmpresa;
      ParamByName('PEID_ACCESORIO'  ).AsInteger := ID_ACCESORIO.AsInteger;
      ParamByName('PEFOL_ACCESORIO' ).AsInteger := FOL_ACCESORIO.AsInteger;
      ParamByName('PECVE_ACCESORIO' ).AsString  := CVE_ACCESORIO.AsString;
      ParamByName('PECVE_COMISION'  ).AsString  := CVE_COMISION.AsString;
      ParamByName('PENUM_PERIODO'   ).AsInteger := NUM_PERIODO.AsInteger;
      ParamByName('PEF_VENCIMIENTO' ).AsDate    := F_VENCIMIENTO.AsDateTime;
      ParamByName('PEIMP_CUOTA'     ).AsFloat   := IMP_COMISION.AsFloat;
      ParamByName('PEIMP_IVA'       ).AsFloat   := IVA_COMISION.AsFloat;
      ParamByName('PEMETODO'        ).AsInteger := peMetodo;
      ParamByName('PEBCOMMIT'       ).AsString  := 'V';
      //
      ExecProc;
      //
      if ( ParamByName('PSRESULTADO').AsInteger <> 0 ) then
      Begin
        MessageDlg('Problemas al registrar el período de comisión: '   + coCRLF +
                   'Código : ' + ParamByName('PSRESULTADO').AsString   + coCRLF +
                   'Mensaje: ' + ParamByName('PSTXRESULTADO').AsString,
                   mtWarning, [mbOk], 0 );
      End else
        Result := True;
      //
    end;
    //
  finally
    stpAltaCuota.Free;
  end;
end;
//
function TCrGeCuCn.stpAutorizaPlan: Boolean;
var  stpAutoriza  : TStoredProc;
begin
  Result := False;
  stpAutoriza := TStoredProc.Create(nil);
  try
    //
    with stpAutoriza do
    begin
      DatabaseName := Apli.DatabaseName;
      SessionName  := Apli.SessionName;
      StoredProcName:= 'PKGCRCOMISIONES.STPAUTPLANPAGO';
      // Se crean los parametros del StoreProcedure
      Params.Clear;
      Params.CreateParam(ftFloat,  'PEIDEMPRESA',      ptInput  );
      Params.CreateParam(ftFloat,  'PEID_ACCESORIO',   ptInput  );
      Params.CreateParam(ftFloat,  'PEFOL_ACCESORIO',  ptInput  );
      Params.CreateParam(ftString, 'PECVE_ACCESORIO',  ptInput  );
      Params.CreateParam(ftString, 'PECVE_COMISION',   ptInput  );
      Params.CreateParam(ftString, 'PEBCOMMIT',        ptInput  );
      Params.CreateParam(ftFloat,  'PSRESULTADO',      ptOutput );
      Params.CreateParam(ftString, 'PSTXRESULTADO',    ptOutput );
      //
      ParamByName('PEIDEMPRESA'     ).AsInteger := Apli.IdEmpresa;
      ParamByName('PEID_ACCESORIO'  ).AsInteger := ID_ACCESORIO.AsInteger;
      ParamByName('PEFOL_ACCESORIO' ).AsInteger := FOL_ACCESORIO.AsInteger;
      ParamByName('PECVE_ACCESORIO' ).AsString  := CVE_ACCESORIO.AsString;
      ParamByName('PECVE_COMISION'  ).AsString  := CVE_COMISION.AsString;
      ParamByName('PEBCOMMIT'       ).AsString  := 'V';
      //
      ExecProc;
      //
      if ( ParamByName('PSRESULTADO').AsInteger <> 0 ) then
      Begin
        MessageDlg('Problemas al autorizar el plan de comisión: '   + coCRLF +
                   'Código : ' + ParamByName('PSRESULTADO').AsString   + coCRLF +
                   'Mensaje: ' + ParamByName('PSTXRESULTADO').AsString,
                   mtWarning, [mbOk], 0 );
      End else
        Result := True;
      //
    end;
    //
  finally
    stpAutoriza.Free;
  end;
end;
(***********************************************FORMA CR_GEN_CUOTA_CN********************)
(*                                                                              *)
(*  FORMA DE CR_GEN_CUOTA_CN                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_GEN_CUOTA_CN********************)

procedure TWCrGenCuotaCn.ReQueryCuotas;
var Q : TQuery;
    I : Integer;
begin
     Q :=  GetSQLQuery(Objeto.getSQLQuery(1), Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True);
     try
          if Q <> nil then
          begin
               //COLUMNAS OCULTAS
               //ASIGNACION DE ETIQUETAS
               Q.FieldByName('F_VENCIMIENTO').DisplayLabel  := 'F. Vencimiento.'       + #30 +'>C';
               Q.FieldByName('F_PROG_PAGO').DisplayLabel    := 'F. Programada de Pago' + #30 +'>C';
               Q.FieldByName('NUM_PERIODO').DisplayLabel    := 'No. Período'           + #30 +'>C';
               Q.FieldByName('PLAZO').DisplayLabel          := 'Plazo'                 + #30 +'>C';
               Q.FieldByName('IMP_CUOTA').DisplayLabel      := 'Importe'               + #30 +'>C';
               Q.FieldByName('IMP_IVA').DisplayLabel        := 'IVA'                   + #30 +'>C';
               Q.FieldByName('SIT_COM_CUOTA').DisplayLabel  := 'Situación'             + #30 +'>C';
               //ASIGNACION DE MASCARAS DE EDICION
               TDateField(Q.FieldByName('F_VENCIMIENTO')).DisplayFormat := 'DD/MM/YYYY';
               TDateField(Q.FieldByName('F_PROG_PAGO')).DisplayFormat   := 'DD/MM/YYYY';
               TNumericField(Q.FieldByName('IMP_CUOTA')).DisplayFormat  := '###,###,###,##0.00';
               TNumericField(Q.FieldByName('IMP_IVA')).DisplayFormat    := '###,###,###,##0.00';
               //ASIGNACION DE LONGITUD DE COLUMNAS
               Q.FieldByName('F_VENCIMIENTO').DisplayWidth  := 22;
               Q.FieldByName('F_PROG_PAGO').DisplayWidth    := 22;
               Q.FieldByName('NUM_PERIODO').DisplayWidth    := 12;
               Q.FieldByName('PLAZO').DisplayWidth          := 08;
               Q.FieldByName('IMP_CUOTA').DisplayWidth      := 22;
               Q.FieldByName('IMP_IVA').DisplayWidth        := 18;
               Q.FieldByName('SIT_COM_CUOTA').DisplayWidth  := 10;
               //
               if Objeto.CVE_ACCESORIO.AsString = C_ACCESORIO_ACREDITADO then
                 SGClBusMovNoAut.Titulo1 := 'Acreditado '   + Objeto.ID_ACCESORIO.AsString
               else if Objeto.CVE_ACCESORIO.AsString = C_ACCESORIO_AUTORIZACION then
                 SGClBusMovNoAut.Titulo1 := 'Autorización ' + Objeto.ID_ACCESORIO.AsString
               else if Objeto.CVE_ACCESORIO.AsString = C_ACCESORIO_DISPOSICION then
                 SGClBusMovNoAut.Titulo1 := 'Disposición '  + Objeto.ID_ACCESORIO.AsString
               ;
               //
               GetSQLInt( Objeto.getSQLQuery(2), Objeto.Apli.DataBaseName, Objeto.Apli.SessionName,
                          'VECES', I, False );
               IsFertig := ( I > 0 );
               AgregarPeriodo1.Enabled := not IsFertig;
               BorrarPeriodo1.Enabled  := not IsFertig;
               ModificarMonto1.Enabled := not IsFertig;
               btVALIDA_TABLA.Enabled  := not IsFertig;
               //
               SGClBusMovNoAut.addQry(Q,True,True,-1,-1,-1,True);
          end
          else
          begin
            // RABA FEB 2012
            // SI NO EXISTEN COUTAS DEFINIDAS Y LA COMISIÓN ESTA CONFIGURADA PARA BLOQUEAR SALDO
            // Y TIENE PREMIO POR PAGO PUNTUAL ENTONCES SE INSERTA EL PRIMER REGISTRO CON LA FECHA
            // DE VENCIMIENTO COMO EL SIGUIENTE DIA HABIL A LA FECHA DE OPERACIÓN DE LA DISPOSICIÓN
            If (Objeto.Comision.B_COMIS_PREM.AsString = 'V') and (Objeto.Comision.B_BLOQ_SALDO.AsString = 'V') then
            begin
               AgregaPerAuto;
            end
            else
              SGClBusMovNoAut.Clear('NO EXISTEN CUOTAS DEFINIDAS'#30'>C');
          end;
     finally
          if Q <> nil then
             Q.free;
          //end if
     end;
end;


procedure TWCrGenCuotaCn.OnOffControles( Bandera : Boolean );
begin
  edF_VENCIMIENTO.Enabled  := Bandera;
  dtF_VENCIMIENTO.Enabled  := Bandera;
  edIMP_COMISION.Enabled   := Bandera;
  btACEPTA.Enabled         := Bandera;
  btCANCELA.Enabled        := Bandera;
  btVALIDA_TABLA.Enabled   := NOT Bandera;
  AgregarPeriodo1.Enabled  := NOT Bandera;
  BorrarPeriodo1.Enabled   := NOT Bandera;
  ModificarMonto1.Enabled  := NOT Bandera;
end;


function TWCrGenCuotaCn.ValidaFechaVencto: Boolean;
begin
  Result := True;
  //
  if Objeto.CVE_ACCESORIO.AsString = C_ACCESORIO_ACREDITADO then
  begin
    if Objeto.F_VENCIMIENTO.AsDateTime < Objeto.Acreditado.F_AUTORIZACION.AsDateTime then
    begin
      MessageDlg( 'La fecha de vencimiento es menor a la fecha de autorización del acreditado',
                  mtWarning, [ mbOk ], 0 );
      Result := False;
    end;
  end else if Objeto.CVE_ACCESORIO.AsString = C_ACCESORIO_AUTORIZACION then
  begin
    if ( Objeto.F_VENCIMIENTO.AsDateTime < Objeto.Contrato.F_AUT_COMITE.AsDateTime ) OR
       ( Objeto.F_VENCIMIENTO.AsDateTime > Objeto.Contrato.F_VENCIMIENTO.AsDateTime ) then
    begin
      MessageDlg( 'La fecha de vencimiento esta fuera del rango de fechas de la autorización' +
                    coCRLF + 'Fecha Inicio: ' + Objeto.Contrato.F_AUT_COMITE.AsString  + coCRLF +
                    'Fecha Vencimiento: '     + Objeto.Contrato.F_VENCIMIENTO.AsString, mtWarning,
                    [ mbOk ], 0 );
      Result := False;
    end;
  end else if Objeto.CVE_ACCESORIO.AsString = C_ACCESORIO_DISPOSICION then
  begin
    if ( Objeto.F_VENCIMIENTO.AsDateTime < Objeto.Credito.F_INICIO.AsDateTime ) OR
       ( Objeto.F_VENCIMIENTO.AsDateTime > Objeto.Credito.F_VENCIMIENTO.AsDateTime ) then
    begin
      MessageDlg( 'La fecha de vencimiento esta fuera del rango de fechas de la disposición' +
                  coCRLF + 'Fecha Inicio: ' + Objeto.Contrato.F_AUT_COMITE.AsString  + coCRLF +
                  'Fecha Vencimiento: '     + Objeto.Contrato.F_VENCIMIENTO.AsString, mtWarning,
                  [ mbOk ], 0 );
      Result := False;
    end;
  end else
      Result := False;
  //
end;


function TWCrGenCuotaCn.AsignaIVA: Double;
const coSQL = 'SELECT PKGCRCOMUN.STPOBTPCTIVA( %d, NULL, %s ) PCT_IVA FROM DUAL';
var vlPctIVA   : Real;
    IdContrato : Integer;
begin
  Result := 0;
  if Objeto.Comision.B_APLICA_IVA.AsString = 'V' then
  begin
    vlPctIVA := 0;
    //
    if ( Objeto.CVE_ACCESORIO.AsString = C_ACCESORIO_AUTORIZACION ) or
       ( Objeto.CVE_ACCESORIO.AsString = C_ACCESORIO_DISPOSICION  ) then
    begin
      if ( Objeto.CVE_ACCESORIO.AsString = C_ACCESORIO_AUTORIZACION ) then
        IdContrato := Objeto.Contrato.ID_CONTRATO.AsInteger
      else
        IdContrato := Objeto.Credito.ID_CONTRATO.AsInteger;
      //
      GetSQLFloat(Format( coSQL, [ IdContrato, Objeto.IMP_COMISION.AsString ] ),
                  Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'PCT_IVA',
                  vlPctIVA,   False );
      //
      Result := Objeto.IMP_COMISION.AsFloat * ( vlPctIVA / 100 );
    end else if Objeto.CVE_ACCESORIO.AsString = C_ACCESORIO_ACREDITADO then
    begin
      Result := Objeto.stpCalculaIVA( Objeto.IMP_COMISION.AsFloat );
    end;
  end;
end;



procedure TWCrGenCuotaCn.FormShow(Sender: TObject);
begin
  //PINTA DATOS DEL PANEL INFERIOR
  lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
  lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

  Objeto.F_VENCIMIENTO.Control := edF_VENCIMIENTO;
  Objeto.IMP_COMISION.Control  := edIMP_COMISION;
  Objeto.IVA_COMISION.Control  := edIMP_IVA;

  Objeto.Comision.FindKey( [ Objeto.CVE_COMISION.AsString ] );
  Objeto.Comision.CVE_COMISION.Control  := edCVE_COMISION;
  Objeto.Comision.DESC_COMISION.Control := edDESC_COMISION;
  if Objeto.CVE_ACCESORIO.AsString = C_ACCESORIO_ACREDITADO then
  begin
    Objeto.Acreditado.FindKey([ Objeto.ID_ACCESORIO.AsString ]);
    Objeto.Acreditado.ID_ACREDITADO.Control  := edID_ACCESORIO;
    Objeto.Acreditado.Persona.Nombre.Control := edDESC_ACCESORIO;
    lbFiltro.Caption := 'Acreditado';
  end else if Objeto.CVE_ACCESORIO.AsString = C_ACCESORIO_AUTORIZACION then
  begin
    Objeto.Contrato.FindKey([ Objeto.ID_ACCESORIO.AsString, Objeto.FOL_ACCESORIO.AsString ]);
    Objeto.Contrato.ID_CONTRATO.Control        := edID_ACCESORIO;
    Objeto.Contrato.Contrato.TITNombre.Control := edDESC_ACCESORIO;
    lbFiltro.Caption := 'Autorización';
  end else if Objeto.CVE_ACCESORIO.AsString = C_ACCESORIO_DISPOSICION then
  begin
    Objeto.Credito.FindKey([ Objeto.ID_ACCESORIO.AsString ]);
    Objeto.Credito.ID_CREDITO.Control        := edID_ACCESORIO;
    Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := edDESC_ACCESORIO;
    lbFiltro.Caption := 'Disposición';
  end;
  //
  ModoForma := moBrowse;
  OnOffControles(False);
  ReQueryCuotas;
end;

procedure TWCrGenCuotaCn.FormDestroy(Sender: TObject);
begin
  Objeto.F_VENCIMIENTO.Control := NIL;
  Objeto.IMP_COMISION.Control  := NIL;
  Objeto.IVA_COMISION.Control  := NIL;
  //
  Objeto.Comision.CVE_COMISION.Control  := NIL;
  Objeto.Comision.DESC_COMISION.Control := NIL;
  if Objeto.CVE_ACCESORIO.AsString = C_ACCESORIO_ACREDITADO then
  begin
    Objeto.Acreditado.ID_ACREDITADO.Control  := NIL;
    Objeto.Acreditado.Persona.Nombre.Control := NIL;
  end else if Objeto.CVE_ACCESORIO.AsString = C_ACCESORIO_AUTORIZACION then
  begin
    Objeto.Contrato.ID_CONTRATO.Control        := NIL;
    Objeto.Contrato.Contrato.TITNombre.Control := NIL;
  end else if Objeto.CVE_ACCESORIO.AsString = C_ACCESORIO_DISPOSICION then
  begin
    Objeto.Credito.ID_CREDITO.Control        := NIL;
    Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := NIL;
  end;
end;


procedure TWCrGenCuotaCn.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TWCrGenCuotaCn.AgregarPeriodo1Click(Sender: TObject);
begin
  ModoForma := moAppend;
  OnOffControles(True);
  //
  Objeto.NUM_PERIODO.AsInteger    := 0;
//  Objeto.F_VENCIMIENTO.AsDateTime := Objeto.Apli.DameFechaEmpresa;
//  Objeto.F_VENCIMIENTO.AsDateTime := FechaHabil(Objeto.Apli.DameFechaEmpresa, Objeto.Apli);
  Objeto.F_VENCIMIENTO.AsDateTime := FechaHabil(StrToDate('20/04/2012'), Objeto.Apli);
  Objeto.IMP_COMISION.AsFloat     := 0;
  Objeto.IVA_COMISION.AsFloat     := 0;
  //
  if edF_VENCIMIENTO.CanFocus then
     edF_VENCIMIENTO.SetFocus;
  //
end;

procedure TWCrGenCuotaCn.ModificarMonto1Click(Sender: TObject);
begin
  if Objeto.CrCoCuAc.FindKey([ Objeto.ID_ACCESORIO.AsString,  Objeto.FOL_ACCESORIO.AsString,
                               Objeto.CVE_ACCESORIO.AsString, Objeto.CVE_COMISION.AsString,
                               SGClBusMovNoAut.CellStr['NUM_PERIODO', SGClBusMovNoAut.SG.Row ]
                             ]) then
  begin
    Objeto.NUM_PERIODO.AsInteger  := Objeto.CrCoCuAc.NUM_PERIODO.AsInteger;
    Objeto.F_VENCIMIENTO.AsString := Objeto.CrCoCuAc.F_VENCIMIENTO.AsString;
    Objeto.IMP_COMISION.AsFloat   := Objeto.CrCoCuAc.IMP_CUOTA.AsFloat;
    Objeto.IVA_COMISION.AsFloat   := Objeto.CrCoCuAc.IMP_IVA.AsFloat;
    Objeto.CrCoCuAc.Active        := False;
    //
    ModoForma     := moEdit;
    OnOffControles(True);
    //
    if edF_VENCIMIENTO.CanFocus then
       edF_VENCIMIENTO.SetFocus;
    //
  end;
end;

procedure TWCrGenCuotaCn.BorrarPeriodo1Click(Sender: TObject);
begin
  if Objeto.CrCoCuAc.FindKey([ Objeto.ID_ACCESORIO.AsString,  Objeto.FOL_ACCESORIO.AsString,
                               Objeto.CVE_ACCESORIO.AsString, Objeto.CVE_COMISION.AsString,
                               SGClBusMovNoAut.CellStr['NUM_PERIODO', SGClBusMovNoAut.SG.Row ]
                             ]) then
  begin
    if MessageDlg( '¿Está seguro de borrar el período de comisión?', mtConfirmation,
                   [mbYes, mbNo], 0 ) = mrYes then
    begin
      ModoForma     := moDelete;
      Objeto.NUM_PERIODO.AsInteger  := Objeto.CrCoCuAc.NUM_PERIODO.AsInteger;
      Objeto.CrCoCuAc.Active        := False;
      Objeto.stpAltaComCuota( 3 );
      ReQueryCuotas;
    end;
  end;
end;
//
procedure TWCrGenCuotaCn.btVALIDA_TABLAClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRGECUCN_AUTOR',True,True) then
   begin
      Objeto.stpAutorizaPlan;
      ReQueryCuotas;
   end;
end;

//
procedure TWCrGenCuotaCn.edIMP_COMISIONExit(Sender: TObject);
begin
  Objeto.IMP_COMISION.GetFromControl;
  //
  if Objeto.Comision.B_APLICA_IVA.AsString = 'V' then
  begin
    Objeto.IVA_COMISION.AsFloat := AsignaIVA;
  end else
    Objeto.IVA_COMISION.AsFloat := 0;
  //
  InterForma1.ValidaExit(edIMP_COMISION,True, '', True);
end;
//
procedure TWCrGenCuotaCn.btACEPTAClick(Sender: TObject);
var BProceso : Boolean;
begin
   if Objeto.ValidaAccesoEsp('TCRGECUCN_ACEPTA',True,True) then
   begin
      BProceso := True;
      Objeto.F_VENCIMIENTO.GetFromControl;
      Objeto.IMP_COMISION.GetFromControl;
      Objeto.IVA_COMISION.GetFromControl;
      //
      if ( ModoForma = moAppend ) or ( ModoForma = moEdit ) then
      Begin
        //
        if Objeto.IMP_COMISION.AsFloat <= 0 then
        Begin
          MessageDlg( 'Favor de indicar el importe de la comisión', mtWarning, [ mbOk ], 0 );
          BProceso := False;
        End;
        //
        if BProceso then
           BProceso := ValidaFechaVencto;
        //
        if BProceso then
        begin
          if ( ModoForma = moAppend ) then
            BProceso := Objeto.stpAltaComCuota( 1 )
          else if ( ModoForma = moEdit ) then
            BProceso := Objeto.stpAltaComCuota( 2 )
          //
        end;
        //
      End;
      //
      if BProceso then
      begin
        ModoForma := moBrowse;
        OnOffControles(False);
        ReQueryCuotas;
      end;
      //
   end;
end;



procedure TWCrGenCuotaCn.btCANCELAClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRGECUCN_CANC',True,True) then
   begin
      ModoForma := moBrowse;
      OnOffControles(False);
      ReQueryCuotas;
   end;
end;

procedure TWCrGenCuotaCn.AgregaPerAuto;
var
  BProceso : Boolean;
begin
  BProceso := True;
  Objeto.NUM_PERIODO.AsInteger := 0;
  Objeto.F_VENCIMIENTO.AsDateTime := FechaHabil(objeto.Apli.DameFechaEmpresa, objeto.apli);
//  Objeto.F_VENCIMIENTO.AsDateTime := FechaHabil(objeto.credito.F_INICIO.AsDateTime, objeto.apli);
  Objeto.IMP_COMISION.AsFloat := Objeto.vgImporteCom;

  if Objeto.Comision.B_APLICA_IVA.AsString = 'V' then
  begin
    Objeto.IVA_COMISION.AsFloat := AsignaIVA;
  end else
    Objeto.IVA_COMISION.AsFloat := 0;

  BProceso := Objeto.stpAltaComCuota( 1 );

  if BProceso then
  begin
    ModoForma := moBrowse;
    OnOffControles(False);
    ReQueryCuotas;
  end;
end;

procedure TWCrGenCuotaCn.edF_VENCIMIENTOExit(Sender: TObject);
begin
  Objeto.F_VENCIMIENTO.GetFromControl;
  if Objeto.F_VENCIMIENTO.AsDateTime < Objeto.Apli.DameFechaEmpresa + 1 then
  begin
    ShowMessage('La fecha de vencimiento debe ser mayor al día de hoy.');
    Objeto.F_VENCIMIENTO.AsDateTime := Objeto.Apli.DameFechaEmpresa + 1;
    edF_VENCIMIENTO.SetFocus;
  end;
end;

procedure TWCrGenCuotaCn.dtF_VENCIMIENTOExit(Sender: TObject);
begin
  if dtF_VENCIMIENTO.DateTime < Objeto.Apli.DameFechaEmpresa + 1 then
  begin
    ShowMessage('La fecha de vencimiento debe ser mayor al día de hoy.');
    Objeto.F_VENCIMIENTO.AsDateTime := Objeto.Apli.DameFechaEmpresa + 1;
    edF_VENCIMIENTO.SetFocus;
  end;
end;

end.
