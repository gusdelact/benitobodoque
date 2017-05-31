
unit IntCrRevGar;

interface

uses
  Windows,   Messages,   SysUtils,    Classes,   Graphics,   Controls,  Forms,
  Dialogs,   DB,         DbTables,    Mask,      StdCtrls,   Buttons,   ExtCtrls,

  // USES ADICIONALES
  IntCrCredito,
  IntCrAcredit,     // Acreditado
  IntGenCre,
  InterFor,  IntFrm,     IntFind,     UnSQL2,    InterFun, IntSGCtrl, IntParamCre,
  IntLinkit, ComCtrls, IntDtPk, Grids, ImgList,
  Aligrid, InterEdit;

type

  TCrRevGar  = Class;

  TWCrRevGar = class(TForm)
    InterForma1 : TInterForma;
    Label25: TLabel;
    edID_CREDITO: TEdit;
    edDESC_CREDITO: TEdit;
    BBBusca: TBitBtn;
    MErrores: TMemo;
    BBReversar: TBitBtn;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    ilCREDITO: TInterLinkit;
    cbCredito: TCheckBox;
    Panel1: TPanel;
    lbSEL: TLabel;
    lbDiposicion: TLabel;
    lbImporte: TLabel;
    lbFolGpo: TLabel;
    lbFolio: TLabel;
    Label2: TLabel;
    edACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    ilACREDITADO: TInterLinkit;
    edNOMBRE_ACRED: TEdit;
    cbAcreditado: TCheckBox;
    btCredito: TBitBtn;
    strgrdCanc: TStringGrid;
    ImageList: TImageList;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    LtotRev: TLabel;
    Letotrev: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    LtotRec: TLabel;
    Label10: TLabel;
    LtotResc: TLabel;
    Label12: TLabel;
    LtotApli: TLabel;
    Label14: TLabel;
    Shape2: TShape;
    Shape1: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    edTOT_RESCATAR: TInterEdit;
    Shape7: TShape;
    Shape8: TShape;
    Label4: TLabel;
    Ltransac: TListBox;
    Rtrev: TRadioGroup;
    Shape9: TShape;
    Label11: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Shape10: TShape;
    Shape11: TShape;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    lbLiqF_FINAL: TLabel;
    edF_VALOR: TEdit;
    dtpF_VALOR: TInterDateTimePicker;
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure BBBuscaClick(Sender: TObject);
    procedure BBReversarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ilCREDITOEjecuta(Sender: TObject);
    procedure cbCreditoClick(Sender: TObject);
    procedure btCreditoClick(Sender: TObject);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure cbAcreditadoClick(Sender: TObject);
    procedure strgrdCancMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure strgrdCancDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure edTOT_RESCATARExit(Sender: TObject);

  private
    procedure LimpiaMemo;
    procedure AddLine( peLinea : string );
    procedure Recalcula_Montos;
    procedure BuscaDatos;
    procedure InvertCheck(StrinGrid : TStringGrid; nCol, nRow : Integer);
    Function QuitaComas(PPCadena : String):String;
  public
    Objeto : TCrRevGar;
    procedure ConfGrid( SGrid : TStringGrid );
    procedure AgregaElemento(var  vlError : String;
                             peCveOperacion, peIdCredito, peIdDocumento, peCveComision,
                             peIdCesion, peIdPeriodo, peIdSolicitud, peIdDetSolicitud: string;
                             peImpNeto, peImpBru, peImpIva, peImpMor, peIvaMor:currency
                            );
    procedure ProcesaDev(var  vlError : String);

  end;

  TCrRevGar = class(TInterFrame)

  private

  protected

  public
    ParamCre  : TParamCre;
    Acreditado: TCrAcredit;
    Credito   : TCrCredito;
  private

  public
    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    procedure   DataBaseChange; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    Procedure   AsignaCred( peIdCredito: String; Sender: TInterLinkit);
    procedure   LimpiaTabla(var  vlError : String);

  published
  end;

const
   CO_COL_CHECK         = 0;
   CO_COL_IDCREDITO     = CO_COL_CHECK + 1;
   CO_COL_IDPERIODO     = CO_COL_IDCREDITO + 1;
   CO_COL_CVECOMISION   = CO_COL_IDPERIODO + 1;
   CO_COL_CONCEPTO      = CO_COL_CVECOMISION + 1;

   CO_COL_CVE_OPER_APL  = CO_COL_CONCEPTO + 1;
   CO_COL_FECHA_APL     = CO_COL_CVE_OPER_APL  + 1;
   CO_COL_IMP_NETO_APL  = CO_COL_FECHA_APL + 1;

   CO_COL_CVE_OPER_REC  = CO_COL_IMP_NETO_APL + 1;
   CO_COL_FECHA_REC     = CO_COL_CVE_OPER_REC  + 1;
   CO_COL_IMP_NETO_RECU = CO_COL_FECHA_REC + 1;

   CO_COL_CVE_OPER_RESC = CO_COL_IMP_NETO_RECU + 1;
   CO_COL_FECHA_RESC    = CO_COL_CVE_OPER_RESC  + 1;
   CO_COL_IMP_NETO_RESC = CO_COL_FECHA_RESC + 1;

   CO_COL_IMP_NETO_REV  = CO_COL_IMP_NETO_RESC + 1;

   CO_COL_IDCESION      = CO_COL_IMP_NETO_REV + 1;
   CO_COL_IDDOCTO       = CO_COL_IDCESION + 1;
   CO_COL_IDSOLICITUD       = CO_COL_IDDOCTO + 1;
   CO_COL_IDDDETSOLICITUD   = CO_COL_IDSOLICITUD + 1;
   CO_COL_F_OPERACION   = CO_COL_IDDDETSOLICITUD + 1;
   CO_COL_IDTRANSACCION = CO_COL_F_OPERACION + 1;


   CO_CHECKED   = 'V';
   CO_UNCHECKED = 'F';
   CO_NOTCHECK  = '-';


  coCRLF      = #13#10;
  coGridCheck = 'SI' + #30 + '>C';
  coMsgResult = 'Resultado: %10.0f Mensaje : %s';
  coErrCanc   = 'Ocurrió un error al cancelar el folio de grupo %s.' +
                coCRLF + '¿Desea continuar?.';
  coSQLRevGar =
      'SELECT           '       + coCRLF +
      '       CT.F_OPERACION,      '       + coCRLF +
      '       CT.F_VALOR,          '       + coCRLF +
      '       CT.ID_TRANSACCION,   '       + coCRLF +
      '       CT.ID_CREDITO,       '       + coCRLF +
      '       CDT.IMP_CONCEPTO IMP_NETO, ' + coCRLF +
      '       CDT.CVE_CONCEPTO ,         ' + coCRLF +
      '       CT.ID_GRUPO_TRANSAC, '       + coCRLF +
      '       CT.ID_CESION,        '       + coCRLF +
      '       CT.ID_PERIODO,       '       + coCRLF +
      '       CT.CVE_COMISION,     '       + coCRLF +
      '       CT.ID_DOCUMENTO,     '       + coCRLF +
      '       CT.CVE_OPERACION,     '       + coCRLF +
      '       CXT.ID_SOLICITUD,     '       + coCRLF +
      '       CXT.ID_DET_SOLICITUD     '       + coCRLF +
      'FROM   CR_OPERACION CO,  CR_TRANSACCION CT,   CR_DET_TRANSAC CDT, CR_XTRANSACCION CXT, ' + coCRLF +
      '       CR_CONCEPTO  CON, CR_REL_OPE_CON CROC, CR_CREDITO   CR,  '   + coCRLF +
      '       CR_CONTRATO    L, CONTRATO CTTO,        ' + coCRLF +
      '       (SELECT DISTINCT CVE_OPERACION '          + coCRLF +
      '        FROM   CR_CVE_OPERACION '                + coCRLF +
      '        WHERE  CVE_PARAMETRO IN (              ' + coCRLF +
      '                                  ''PGCNGF'', ''PGINGF'', ''PGFNGF'', ''PGCPGF'', ' + coCRLF +  //APLICACIONES DE FEGA
      '                                  ''PGCNGP'', ''PGINGP'', ''PGFNGP'', ''PGCPGP'' ' + coCRLF +  //APLICACIONES DE PYME
      '                                )' + coCRLF +
      '       ) CVES ' + coCRLF +
      'WHERE  1=1'       + coCRLF +
      '  @@CONDICION_ID_CREDITO@@                '               + coCRLF +
      '  @@CONDICION_ID_TITULAR@@                '               + coCRLF +
      '  @@CONDICION_ID_EMPRESA@@                '               + coCRLF +
      '  AND  CT.SIT_TRANSACCION = ''AC''             '          + coCRLF +
      '  AND  CROC.B_EDO_CTA     = ''V''              '          + coCRLF +
      '  AND  CO.CVE_OPERACION   = CVES.CVE_OPERACION '          + coCRLF +
      '  AND  CO.CVE_OPERACION   = CT.CVE_OPERACION  '           + coCRLF +
      '  AND  CT.ID_TRANS_CANCELA  IS NULL ' + coCRLF +
      '  AND  CDT.ID_TRANSACCION = CT.ID_TRANSACCION ' + coCRLF +
      '  AND  CXT.ID_TRANSACCION = CT.ID_TRANSACCION ' + coCRLF +
      '  AND  CDT.CVE_OPERACION  = CT.CVE_OPERACION  ' + coCRLF +
      '  AND  CON.CVE_CONCEPTO   = CDT.CVE_CONCEPTO  ' + coCRLF +
      '  AND  CROC.CVE_OPERACION = CDT.CVE_OPERACION ' + coCRLF +
      '  AND  CROC.CVE_CONCEPTO  = CDT.CVE_CONCEPTO  ' + coCRLF +
      '  AND  CR.ID_CREDITO      = CT.ID_CREDITO   ' + coCRLF +
      '  AND  L.ID_CONTRATO      = CR.ID_CONTRATO  ' + coCRLF +
      '  AND  L.FOL_CONTRATO     = CR.FOL_CONTRATO ' + coCRLF +
      '  AND  CTTO.ID_CONTRATO   = CR.ID_CONTRATO  ' + coCRLF +
      'ORDER BY CT.ID_CREDITO, CT.ID_TRANSACCION ASC';

  coFmtCurr    =  '###,###,###,###,###,##0.00';

var nRow : word;
    vlError : String;

    vlIMP_TOTAL_APLI, vlIMP_TOTAL_RECU, vlIMP_TOTAL_RESC: Currency;
    cont1, RegTot : word;
    vlCVE_RECU, vlTIPO_GTIA, vlTIPO_DEV : String;
    vlCountMov, vlCountEnc : word;
    vlb_enc:boolean;    

implementation
{$R *.DFM}

constructor TCrRevGar.Create( AOwner : TComponent );
begin
  Inherited Create( AOwner );
  {$WARNINGS OFF}
  Credito := TCrCredito.Create(Self);
  {$WARNINGS ON}
  Credito.MasterSource:=Self;
  Credito.FieldByName('ID_CREDITO').MasterField := 'ID_CREDITO';
  //
  {$WARNINGS OFF}
  Acreditado := TCrAcredit.Create(Self);
  {$WARNINGS ON}
  Acreditado.MasterSource := Self;
end;

destructor TCrRevGar.Destroy;
begin
   if Credito <> nil then
      Credito.free;
   //end if;
   if Acreditado <> nil then
      Acreditado.free;
   //end if;
   inherited;
end;

Procedure TCrRevGar.DataBaseChange;
begin
  Credito.GetParams(self);
  Acreditado.GetParams(self);
end;


function TCrRevGar.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrRevGar;
begin
   W := TWCrRevGar.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.FormaTipo := ftConsulta;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

//ASIGNA CONTROL DE BUSCADOR
procedure TCrRevGar.AsignaCred(peIdCredito: String; Sender: TInterLinkit);
begin
   Sender.Buffer := peIdCredito;
   Sender.OnEjecuta(Sender);
end;

procedure TCrRevGar.LimpiaTabla( var  vlError : String );
var  STPLimpTab  : TStoredProc;
Begin
  vlError := '';
  STPLimpTab := TStoredProc.Create(Nil);
  try
    with STPLimpTab do
    begin
      DatabaseName:= Apli.DatabaseName;
      SessionName:= Apli.SessionName;
      StoredProcName:= 'PKGCRCOBRANZA.STPLIMPIATABLAREC';
      // Se crean los parametros del StoreProcedure
      Params.Clear;
      Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
      Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
      //
      ExecProc;
      if (ParamByName('PSResultado').AsInteger <> 0) then
      begin
        vlError := 'Problemas al limpiar tabla: '          + coCRLF +
                   'Código : ' + ParamByName('psResultado').AsString   + coCRLF +
                   'Mensaje: ' + ParamByName('psTxResultado').AsString;
      end;
    end;
  finally
    STPLimpTab.Free;
  end;
end;

(***********************************FORMA TEMPLATE*****************************)
(*                                                                            *)
(*                                                                            *)
(*                                                                            *)
(*                                  FORMA TEMPLATE                            *)
(*                                                                            *)
(*                                                                            *)
(*                                                                            *)
(***********************************FORMA TEMPLATE*****************************)

procedure TWCrRevGar.AgregaElemento(var  vlError : String;
                                    peCveOperacion, peIdCredito, peIdDocumento, peCveComision,
                                    peIdCesion, peIdPeriodo, peIdSolicitud, peIdDetSolicitud: string;
                                    peImpNeto, peImpBru, peImpIva, peImpMor, peIvaMor:currency
                                  );
var  STPAddElemento : TStoredProc;
Begin
   STPAddElemento := TStoredProc.Create(Nil);
   vlError := '';
   try
      with STPAddElemento do
      begin
        DatabaseName:= Objeto.Apli.DatabaseName;
        SessionName:= Objeto.Apli.SessionName;
        StoredProcName:= 'PKGCRCOBRANZA.STPAGREGAELEMENTO_RESC'; //    coPaquete     = 'PKGCRCOBRANZA';
        // Se crean los parametros del StoreProcedure
        Params.Clear;
        Params.CreateParam(ftString,  'peCveOperacion',   ptInput );
        Params.CreateParam(ftString,  'peIdCredito',      ptInput );
        Params.CreateParam(ftString,  'peIdPeriodo',      ptInput );
        Params.CreateParam(ftString,  'peIdCesion',       ptInput );
        Params.CreateParam(ftString,  'peIdDocumento',    ptInput );
        Params.CreateParam(ftString,  'peCveComision',    ptInput );
        Params.CreateParam(ftFloat,   'peImpNeto',        ptInput );
        Params.CreateParam(ftFloat,   'peImpBru',         ptInput );
        Params.CreateParam(ftFloat,   'peImpIva',         ptInput );
        Params.CreateParam(ftFloat,   'peImpMor',         ptInput );
        Params.CreateParam(ftFloat,   'peIvaMor',         ptInput );
        Params.CreateParam(ftDate,    'peFOperacion',     ptInput );
        Params.CreateParam(ftDate,    'peFValor',         ptInput );
        Params.CreateParam(ftString,  'peCveUsuAlta',     ptInput );
        Params.CreateParam(ftString,  'peIdSolicitud',    ptInput );
        Params.CreateParam(ftString,  'peIdDetSolicitud', ptInput );
        //VARIABLES DE SALIDA
        Params.CreateParam(ftFloat,   'psResultado',    ptOutput );
        Params.CreateParam(ftString,  'psTxResultado',  ptOutput );
        //
        ParamByName('peCveOperacion').AsString    := peCveOperacion;
        ParamByName('peIdCredito').AsString       := peIdCredito;
        ParamByName('peIdPeriodo').AsString      := peIdPeriodo;
        ParamByName('peIdCesion').AsString        := peIdCesion;
        ParamByName('peIdDocumento').AsString     := peIdDocumento;
        ParamByName('peCveComision').AsString     := peCveComision;
        ParamByName('peImpNeto').AsFloat          := peImpNeto;
        ParamByName('peImpBru').AsFloat           := peImpBru;
        ParamByName('peImpIVa').AsFloat           := peImpIva;
        ParamByName('peImpMor').AsFloat           := peImpMor;
        ParamByName('peIvaMor').AsFloat           := peIvaMor;
        ParamByName('peFOperacion').AsDate        := Objeto.Apli.DameFechaEmpresa;
        ParamByName('peFValor').AsDate            := StrToDate(edF_VALOR.text);//Objeto.Apli.DameFechaEmpresa;
        ParamByName('peCveUsuAlta').AsString      := Objeto.Apli.Usuario;
        ParamByName('peIdSolicitud').AsString     := peIdSolicitud;
        ParamByName('peIdDetSolicitud').AsString  := peIdDetSolicitud;

        ExecProc;
        if ( ParamByName('psResultado').AsInteger <> 0 ) then
        begin
           vlError := 'Problemas al agregar datos : '                      + coCRLF +
                      'Código : ' + ParamByName('psRESULTADO').AsString    + coCRLF +
                      'Mensaje: ' + ParamByName('psTxResultado').AsString;
        end;
      end;
   finally
     STPAddElemento.Free;
   end;
end;


procedure TWCrRevGar.ProcesaDev(var  vlError : String);
var  STPProcesaDev : TStoredProc;
Begin
   STPProcesaDev := TStoredProc.Create(Nil);
   vlError := '';
   try
      with STPProcesaDev do
      begin
        DatabaseName:= Objeto.Apli.DatabaseName;
        SessionName:= Objeto.Apli.SessionName;
        StoredProcName:= 'PKGCRCOBRANZA.STPTRANSAC_DEVGTIA'; //    coPaquete     = 'PKGCRCOBRANZA';
        // Se crean los parametros del StoreProcedure
        Params.Clear;
        Params.CreateParam(ftfloat,  'PEIMP_RESCATE',   ptInput );
        Params.CreateParam(ftString, 'PETIPO_GTIA',     ptInput );
        Params.CreateParam(ftString, 'PETIPO_DEV',      ptInput );
        Params.CreateParam(ftString, 'PEBCOMMIT',       ptInput );
        //VARIABLES DE SALIDA
        Params.CreateParam(ftFloat,   'psResultado',    ptOutput );
        Params.CreateParam(ftString,  'psTxResultado',  ptOutput );
        //
        ParamByName('PEIMP_RESCATE').AsFloat  := StrToFloat(edTOT_RESCATAR.Text);
        ParamByName('PETIPO_GTIA').AsString   := vlTIPO_GTIA;
        ParamByName('PETIPO_DEV').AsString    := vlTIPO_DEV;
        ParamByName('PEBCOMMIT').AsString     := 'V';

        ExecProc;
        if ( ParamByName('psResultado').AsInteger <> 0 ) then
        begin
           vlError := 'Problemas al procesar datos : '                      + coCRLF +
                      'Código : ' + ParamByName('psRESULTADO').AsString    + coCRLF +
                      'Mensaje: ' + ParamByName('psTxResultado').AsString;
        end;
      end;
   finally
     STPProcesaDev.Free;
   end;
end;


procedure TWCrRevGar.ConfGrid( SGrid : TStringGrid );
begin
 With SGrid Do
   Begin
      ColCount := 21;

      RowHeights[0] := DefaultRowHeight;
      RowCount := 1;

      ColWidths[CO_COL_CHECK] := 18;
      ColWidths[CO_COL_IDTRANSACCION] := 0;
      ColWidths[CO_COL_IDCREDITO] := 55;
      ColWidths[CO_COL_IDCESION] := 0;
      ColWidths[CO_COL_IDDOCTO] := 0;
      ColWidths[CO_COL_IDPERIODO] := 25;
      ColWidths[CO_COL_CVECOMISION] := 55;
      ColWidths[CO_COL_F_OPERACION] := 0;
      ColWidths[CO_COL_CONCEPTO] := 60;

      ColWidths[CO_COL_CVE_OPER_APL] := 65;
      ColWidths[CO_COL_FECHA_APL] := 65;
      ColWidths[CO_COL_IMP_NETO_APL] := 90;

      ColWidths[CO_COL_CVE_OPER_REC] := 65;
      ColWidths[CO_COL_FECHA_REC] := 65;
      ColWidths[CO_COL_IMP_NETO_RECU] := 90;

      ColWidths[CO_COL_CVE_OPER_RESC] := 65;
      ColWidths[CO_COL_FECHA_RESC] := 65;
      ColWidths[CO_COL_IMP_NETO_RESC] := 90;

      ColWidths[CO_COL_IMP_NETO_REV] := 100;
      ColWidths[CO_COL_IDSOLICITUD] := 0;
      ColWidths[CO_COL_IDDDETSOLICITUD] := 0;
    End;
end;

procedure TWCrRevGar.InvertCheck(StrinGrid : TStringGrid; nCol, nRow : Integer);
begin
 With (StrinGrid) Do
  If (Cells[nCol, nRow] <>  CO_NOTCHECK) Then
   Begin
     If (Cells[nCol, nRow] = CO_CHECKED) Then
        Cells[nCol, nRow] := CO_UNCHECKED
     Else
        Cells[nCol, nRow] := CO_CHECKED;
   End;
end;


procedure TWCrRevGar.FormShow(Sender: TObject);
begin
  lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
  lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

  dtpF_VALOR.DateTime:= Objeto.Apli.DameFechaEmpresa;
  edF_VALOR.text:=FormatDateTime('dd/mm/yyyy',dtpF_VALOR.DateTime);

  Objeto.Acreditado.ID_ACREDITADO.Control := edACREDITADO;
  Objeto.Acreditado.Persona.Nombre.Control := edNOMBRE_ACRED;

  Objeto.Credito.ID_CREDITO.Control := edID_CREDITO;
  Objeto.Credito.ContratoCre.Contrato.TITNombre.Control:= edDESC_CREDITO;
  //
  Objeto.Credito.BuscaWhereString  := 'PKGCRACTUALIZA.STPOBTEMPCTTO(CR_CREDITO.ID_CONTRATO)= ' +  // LOLS 08 SEP 2005
                                      IntToStr(Objeto.Apli.IdEmpresa);                            // LOLS 08 SEP 200
  Objeto.Credito.FilterString      := Objeto.Credito.BuscaWhereString;
  //
  //SI SE ACCESA DE OTRA PANTALLA CON EL NÚMERO DE CREDITO
  if Objeto.Credito.ID_CREDITO.AsString <> '' then
      Objeto.AsignaCred( Objeto.Credito.ID_CREDITO.AsString,  ilCREDITO);
  //

end;

procedure TWCrRevGar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TWCrRevGar.FormDestroy(Sender: TObject);
begin
  Objeto.Acreditado.ID_ACREDITADO.Control := nil;
  Objeto.Acreditado.Persona.Nombre.Control := nil;
  Objeto.Credito.ID_CREDITO.Control := nil;
  Objeto.Credito.ContratoCre.Contrato.TITNombre.Control:= nil;
end;

//LIMPIA EL MEMO DE MENSAJES
procedure TWCrRevGar.LimpiaMemo;
begin
  MErrores.Lines.Clear;
end;

//AGREGA UNA LINEA AL MEMO DE MENSAJES
procedure TWCrRevGar.AddLine(peLinea: string);
begin
  MErrores.Lines.Add(peLinea);
end;

//QUITA COMAS DE LAS CANTIDADES
Function TWCrRevGar.QuitaComas(PPCadena : String):String;
var
   vlIndex, vlTotal : Integer;
   vlCar,vlRenglon: String;
begin
   vlTotal:= Length (Trim(PPCadena));
   vlRenglon:='';

   for vlIndex := 1 to vlTotal do
   begin
      vlCar:= Copy(PPCadena, vlIndex, 1);
      if  vlCar <> ',' then vlRenglon:=vlRenglon+vlCar;
   end;
   QuitaComas:=vlRenglon;
end;


procedure TWCrRevGar.Recalcula_Montos;
var  cont:word;
     vlmontotot, vltemp : currency;
begin
   if Trim(edTOT_RESCATAR.Text) <> '' then
   begin

      if StrToFloat(QuitaComas(edTOT_RESCATAR.Text)) <= StrToFloat(QuitaComas(LtotRev.Caption)) then
      begin

         vlmontotot:=StrToFloat(QuitaComas(edTOT_RESCATAR.Text));

         cont:=0;
         while (cont <= Ltransac.Items.Count-1) or (vlmontotot>0) do
         begin
            vltemp:= StrToFloat(QuitaComas(strgrdCanc.Cells[CO_COL_IMP_NETO_APL,  cont]))
                   - StrToFloat(QuitaComas(strgrdCanc.Cells[CO_COL_IMP_NETO_RECU, cont]))
                   - StrToFloat(QuitaComas(strgrdCanc.Cells[CO_COL_IMP_NETO_RESC, cont]));

            if  vlmontotot >= vltemp then //cubre el monto total
            begin
               vlmontotot:= vlmontotot - vltemp;
               strgrdCanc.Cells[CO_COL_IMP_NETO_REV, cont]:= FormatFloat('###,###,##0.00',vltemp);
            end
            else
            begin
               strgrdCanc.Cells[CO_COL_IMP_NETO_REV, cont]:= FormatFloat('###,###,##0.00',vlmontotot);
               vlmontotot:= 0;
            end;

            cont:=cont+1;
         end;
      end
      else
      begin
         ShowMessage('El Importe Confirmado es Mayor al Total Calculado');
         edTOT_RESCATAR.Text := LtotRev.Caption;
      end;
    end;
end;

//HACE UNA BUSQUEDA DE LOS DATOS
procedure TWCrRevGar.BuscaDatos;
var vlQry : TQuery;
    vlSQLCad : String;
    vlCndCred : String;
    vlCndAcre : String;

    vlDIF, vlTempImp : Currency;
begin
   vlCndCred := '';
   vlCndAcre := '';
   vlIMP_TOTAL_APLI:= 0;
   vlIMP_TOTAL_RECU:= 0;
   vlIMP_TOTAL_RESC:= 0;

   LtotRev.Caption := '0.00';
   LtotRec.Caption := '0.00';
   LtotResc.Caption := '0.00';
   LtotApli.Caption := '0.00';

   Ltransac.Clear;
   Rtrev.Enabled:=true;
   Rtrev.ItemIndex:=0;

   {
   //REVISA SI YA HUBO MOVIMIENTOS POR RESCATE Y DE SER ASI BLOQUEA EL RADIOBUTTON
   vlSQLCad :='SELECT COUNT(*) AS NCOUNT FROM CR_TRANSACCION ';

   if Trim(edID_CREDITO.Text)<>'' then
      vlSQLCad:= vlSQLCad + ' WHERE ID_CREDITO = ' +edID_CREDITO.Text;

   if Trim(edACREDITADO.Text)<>'' then
      vlSQLCad:= vlSQLCad + ' WHERE ID_CREDITO IN (SELECT ID_CREDITO FROM CR_CREDITO WHERE ID_CONTRATO IN (SELECT ID_CONTRATO FROM CONTRATO WHERE ID_TITULAR='+edACREDITADO.Text+') AND SIT_CREDITO=''AC'')    ' ;

    vlSQLCad:= vlSQLCad +
              '   AND CVE_OPERACION IN (''RTCPGF'', ''RTINGF'', ''RTFNGF'', ''RTCNGF'', ''RTCPGP'', ''RTINGP'', ''RTFNGP'', ''RTCNGP'' ) '+
              '   AND SIT_TRANSACCION=''AC'' '+
              '   AND ID_TRANS_CANCELA IS NULL ';

    vlQry := GetSQLQuery(vlSQLCad,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );

    try
      if vlQry <> nil then
      begin
         if vlQry.FieldByName('NCOUNT').asInteger > 0 then
         begin
            Rtrev.ItemIndex:=0;
            Rtrev.Enabled:=false;
         end;
      end;
    finally
        if vlQry <> nil then vlQry.free;
    end;

   //REVISA SI YA HUBO MOVIMIENTOS POR DEVOLUCION X REESTRUCTURA Y DE SER ASI BLOQUEA EL RADIOBUTTON
   vlSQLCad :='SELECT COUNT(*) AS NCOUNT FROM CR_TRANSACCION ';

   if Trim(edID_CREDITO.Text)<>'' then
      vlSQLCad:= vlSQLCad + ' WHERE ID_CREDITO = ' +edID_CREDITO.Text;

   if Trim(edACREDITADO.Text)<>'' then
      vlSQLCad:= vlSQLCad + ' WHERE ID_CREDITO IN (SELECT ID_CREDITO FROM CR_CREDITO WHERE ID_CONTRATO IN (SELECT ID_CONTRATO FROM CONTRATO WHERE ID_TITULAR='+edACREDITADO.Text+') AND SIT_CREDITO=''AC'')    ' ;

    vlSQLCad:= vlSQLCad +
              '   AND CVE_OPERACION IN (''RSCPGF'', ''RSINGF'', ''RSFNGF'', ''RSCNGF'', ''RSCPGP'', ''RSINGP'', ''RSFNGP'', ''RSCNGP'' ) '+
              '   AND SIT_TRANSACCION=''AC'' '+
              '   AND ID_TRANS_CANCELA IS NULL ';

    vlQry := GetSQLQuery(vlSQLCad,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );

    try
      if vlQry <> nil then
      begin
         if vlQry.FieldByName('NCOUNT').asInteger > 0 then
         begin
            Rtrev.ItemIndex:=1;
            Rtrev.Enabled:=false;
         end;
      end;
    finally
        if vlQry <> nil then vlQry.free;
    end;


   //REVISA SI YA HUBO MOVIMIENTOS POR INCOBRABILIDAD Y DE SER ASI BLOQUEA EL RADIOBUTTON
   vlSQLCad :='SELECT COUNT(*) AS NCOUNT FROM CR_TRANSACCION ';

   if Trim(edID_CREDITO.Text)<>'' then
      vlSQLCad:= vlSQLCad + ' WHERE ID_CREDITO = ' +edID_CREDITO.Text;

   if Trim(edACREDITADO.Text)<>'' then
      vlSQLCad:= vlSQLCad + ' WHERE ID_CREDITO IN (SELECT ID_CREDITO FROM CR_CREDITO WHERE ID_CONTRATO IN (SELECT ID_CONTRATO FROM CONTRATO WHERE ID_TITULAR='+edACREDITADO.Text+') AND SIT_CREDITO=''AC'')    ' ;

    vlSQLCad:= vlSQLCad +
              '   AND CVE_OPERACION IN (''INCPGF'', ''ININGF'', ''INFNGF'', ''INCNGF'', ''INCPGP'', ''ININGP'', ''INFNGP'', ''INCNGP'' ) '+
              '   AND SIT_TRANSACCION=''AC'' '+
              '   AND ID_TRANS_CANCELA IS NULL ';

    vlQry := GetSQLQuery(vlSQLCad,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );

    try
      if vlQry <> nil then
      begin
         if vlQry.FieldByName('NCOUNT').asInteger > 0 then
         begin
            Rtrev.ItemIndex:=2;
            Rtrev.Enabled:=false;
         end;
      end;
    finally
        if vlQry <> nil then vlQry.free;
    end;
    }
   if Objeto.Credito.Active then
     vlCndCred := '  AND  CT.ID_CREDITO  = ' + Objeto.Credito.ID_CREDITO.AsString;
   if Objeto.Acreditado.Active then
     vlCndAcre := '  AND  CTTO.ID_TITULAR = ' + Objeto.Acreditado.ID_ACREDITADO.AsString;

   vlSQLCad := StringReplace( coSQLRevGar, '@@CONDICION_ID_CREDITO@@',
                              vlCndCred, [ rfReplaceAll, rfIgnoreCase ] );
   vlSQLCad := StringReplace( vlSQLCad, '@@CONDICION_ID_TITULAR@@',
                              vlCndAcre, [ rfReplaceAll, rfIgnoreCase ] );
   vlSQLCad := StringReplace( vlSQLCad, '@@CONDICION_ID_EMPRESA@@',
                              ' AND  CTTO.ID_EMPRESA = ' + IntToStr(Objeto.Apli.IdEmpresa),
                              [ rfReplaceAll, rfIgnoreCase ] );

    vlQry := GetSQLQuery(vlSQLCad,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );

    try
        ClearGrid(strgrdCanc,0);
        ConfGrid(strgrdCanc);
        nRow := 0;
        vlCountMov:=1;

        if vlQry <> nil then
        begin
        while not vlQry.Eof do
        begin

           RegTot:=strgrdCanc.RowCount;
           cont1:=0;
           vlb_enc:=false;
           vlCountEnc:=0;
           while (cont1 <= RegTot-1)and(vlb_enc=false) do
           begin
              if (strgrdCanc.Cells[CO_COL_IDCREDITO, cont1]    = vlQry.FieldByName('ID_CREDITO').asString)    and
                 (strgrdCanc.Cells[CO_COL_CVE_OPER_APL, cont1] = vlQry.FieldByName('CVE_OPERACION').asString) and
                 (strgrdCanc.Cells[CO_COL_CONCEPTO, cont1]     = vlQry.FieldByName('CVE_CONCEPTO').asString)  and
                 (strgrdCanc.Cells[CO_COL_IDPERIODO, cont1]    = vlQry.FieldByName('ID_PERIODO').asString)    and
                 (strgrdCanc.Cells[CO_COL_CVECOMISION, cont1]  = vlQry.FieldByName('CVE_COMISION').asString)  and
                 //
                 (strgrdCanc.Cells[CO_COL_IDSOLICITUD, cont1]      = vlQry.FieldByName('ID_SOLICITUD').asString)  and
                 (strgrdCanc.Cells[CO_COL_IDDDETSOLICITUD, cont1]  = vlQry.FieldByName('ID_DET_SOLICITUD').asString)    then
              begin
                 vlb_enc:=true;
                 vlCountEnc:=cont1;
              end;
              cont1:=cont1+1;
           end;

           if Ltransac.Items.IndexOf(IntToStr(vlCountMov)) = -1 then Ltransac.Items.Add(IntToStr(vlCountMov));

           if vlb_enc=false then //NO ENCONTRO COINCIDENCIAS, INSERTA REGISTRO NUEVO
           begin
              strgrdCanc.Cells[CO_COL_IDTRANSACCION, nRow] := IntToStr(vlCountMov);
              vlCountMov:=vlCountMov+1;

              strgrdCanc.Cells[CO_COL_IDCREDITO, nRow] := vlQry.FieldByName('ID_CREDITO').asString;
              strgrdCanc.Cells[CO_COL_IDCESION, nRow] := vlQry.FieldByName('ID_CESION').asString;
              strgrdCanc.Cells[CO_COL_IDDOCTO, nRow] := vlQry.FieldByName('ID_DOCUMENTO').asString;
              strgrdCanc.Cells[CO_COL_IDPERIODO, nRow] := vlQry.FieldByName('ID_PERIODO').asString;
              strgrdCanc.Cells[CO_COL_CVECOMISION, nRow] := vlQry.FieldByName('CVE_COMISION').asString;

              strgrdCanc.Cells[CO_COL_F_OPERACION, nRow] := vlQry.FieldByName('F_OPERACION').asString;
              strgrdCanc.Cells[CO_COL_CONCEPTO, nRow] := vlQry.FieldByName('CVE_CONCEPTO').asString;

              strgrdCanc.Cells[CO_COL_CVE_OPER_APL, nRow] := vlQry.FieldByName('CVE_OPERACION').asString;
              strgrdCanc.Cells[CO_COL_IMP_NETO_APL, nRow] := FormatFloat('###,###,##0.00',vlQry.FieldByName('IMP_NETO').asFloat);
              strgrdCanc.Cells[CO_COL_CVE_OPER_REC, nRow] := ' ';
              strgrdCanc.Cells[CO_COL_IMP_NETO_RECU, nRow] := FormatFloat('###,###,##0.00',0);
              strgrdCanc.Cells[CO_COL_IMP_NETO_REV, nRow] := FormatFloat('###,###,##0.00',0);

              strgrdCanc.Cells[CO_COL_FECHA_APL, nRow] := vlQry.FieldByName('F_VALOR').asString;
              strgrdCanc.Cells[CO_COL_FECHA_REC, nRow] := ' ';
              strgrdCanc.Cells[CO_COL_FECHA_RESC, nRow] := ' ';

              strgrdCanc.Cells[CO_COL_IDSOLICITUD, nRow] := vlQry.FieldByName('ID_SOLICITUD').asString;
              strgrdCanc.Cells[CO_COL_IDDDETSOLICITUD, nRow] := vlQry.FieldByName('ID_DET_SOLICITUD').asString;

              strgrdCanc.Cells[CO_COL_CHECK, nRow] := CO_CHECKED;

              vlIMP_TOTAL_APLI:= vlIMP_TOTAL_APLI + vlQry.FieldByName('IMP_NETO').asFloat;

              vlDIF:= vlQry.FieldByName('IMP_NETO').asFloat;

              strgrdCanc.Cells[CO_COL_IMP_NETO_REV, nRow] := FormatFloat('###,###,##0.00',vlDIF);

              strgrdCanc.Cells[CO_COL_CVE_OPER_REC, nRow] :='-';
              strgrdCanc.Cells[CO_COL_IMP_NETO_RECU, nRow] := '0.00';

              strgrdCanc.Cells[CO_COL_CVE_OPER_RESC, nRow] := '-';
              strgrdCanc.Cells[CO_COL_IMP_NETO_RESC, nRow] := '0.00';

              Inc(nRow);
           end;

           if vlb_enc=true then //ENCONTRO COINCIDENCIAS, INCREMENTA IMPORTES
           begin
              vlTempImp:= StrToFloat(QuitaComas(strgrdCanc.Cells[CO_COL_IMP_NETO_APL,  vlCountEnc])) ;

              strgrdCanc.Cells[CO_COL_IMP_NETO_APL, vlCountEnc] :=  FormatFloat('###,###,##0.00', vlTempImp + vlQry.FieldByName('IMP_NETO').asFloat);

              vlIMP_TOTAL_APLI:= vlIMP_TOTAL_APLI + vlQry.FieldByName('IMP_NETO').asFloat;

              vlDIF:= StrToFloat(QuitaComas(strgrdCanc.Cells[CO_COL_IMP_NETO_APL,  vlCountEnc])) ;

              strgrdCanc.Cells[CO_COL_IMP_NETO_REV, vlCountEnc] := FormatFloat('###,###,##0.00',vlDIF);
           end;

           vlQry.Next;
        end;
        end;
    finally
        if vlQry <> nil then vlQry.free;
    end;
    strgrdCanc. RowCount := nRow;

    RegTot:=strgrdCanc.RowCount;
    cont1:=0;

   //BUSCA LAS RECUPERACIONES
    while (cont1 <= RegTot-1) do
    begin
       vlCVE_RECU:='';
       if (Trim(strgrdCanc.Cells[CO_COL_CVE_OPER_APL, cont1])='PGCPGF') then vlCVE_RECU :='RCCPGF';
       if (Trim(strgrdCanc.Cells[CO_COL_CVE_OPER_APL, cont1])='PGINGF') then vlCVE_RECU :='RCINGF';
       if (Trim(strgrdCanc.Cells[CO_COL_CVE_OPER_APL, cont1])='PGFNGF') then vlCVE_RECU :='RCFNGF';
       if (Trim(strgrdCanc.Cells[CO_COL_CVE_OPER_APL, cont1])='PGCNGF') then vlCVE_RECU :='RCCNGF';

       if (Trim(strgrdCanc.Cells[CO_COL_CVE_OPER_APL, cont1])='PGCPGP') then vlCVE_RECU :='RCCPGP';
       if (Trim(strgrdCanc.Cells[CO_COL_CVE_OPER_APL, cont1])='PGINGP') then vlCVE_RECU :='RCINGP';
       if (Trim(strgrdCanc.Cells[CO_COL_CVE_OPER_APL, cont1])='PGFNGP') then vlCVE_RECU :='RCFNGP';
       if (Trim(strgrdCanc.Cells[CO_COL_CVE_OPER_APL, cont1])='PGCNGP') then vlCVE_RECU :='RCCNGP';

       vlSQLCad := 'SELECT NVL(SUM(CDT.IMP_CONCEPTO),0) AS IMP_CONCEPTO, MAX(CT.F_VALOR) AS F_VALOR ' + coCRLF +
                   '  FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CXT ' + coCRLF +
                   ' WHERE CT.ID_CREDITO = ' + strgrdCanc.Cells[CO_COL_IDCREDITO, cont1] + coCRLF +
                   ' AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION '+ coCRLF +
                   ' AND CXT.ID_TRANSACCION = CT.ID_TRANSACCION '+ coCRLF +
                   ' AND CXT.ID_SOLICITUD = ' + strgrdCanc.Cells[CO_COL_IDSOLICITUD, cont1]+ coCRLF +
                   ' AND CXT.ID_DET_SOLICITUD = ' + strgrdCanc.Cells[CO_COL_IDDDETSOLICITUD, cont1]+ coCRLF +
                   ' AND CDT.CVE_OPERACION = CT.CVE_OPERACION '+ coCRLF ;

       if Trim(strgrdCanc.Cells[CO_COL_IDCESION, cont1]) <> '' then
          vlSQLCad:= vlSQLCad + '   AND CT.ID_CESION = '  + strgrdCanc.Cells[CO_COL_IDCESION, cont1] + coCRLF;

       if Trim(strgrdCanc.Cells[CO_COL_IDDOCTO, cont1]) <> '' then
          vlSQLCad:= vlSQLCad + '   AND CT.ID_DOCUMENTO = ''' + strgrdCanc.Cells[CO_COL_IDDOCTO, cont1] +''''+ coCRLF;

       if Trim(strgrdCanc.Cells[CO_COL_CVECOMISION, cont1]) <> '' then
           vlSQLCad:= vlSQLCad + '   AND CT.CVE_COMISION = ''' + strgrdCanc.Cells[CO_COL_CVECOMISION, cont1] +''''+ coCRLF;

       vlSQLCad:= vlSQLCad +
                   '   AND CT.ID_PERIODO = ' + strgrdCanc.Cells[CO_COL_IDPERIODO, cont1] + coCRLF +
                   '   AND CT.CVE_OPERACION = '''+vlCVE_RECU+''' ' + coCRLF +
                   '   AND CT.SIT_TRANSACCION = ''AC'' ' + coCRLF +
                   '   AND CDT.CVE_CONCEPTO IN ('''+strgrdCanc.Cells[CO_COL_CONCEPTO, cont1]+''') ' + coCRLF +
                   '   AND CT.ID_TRANS_CANCELA IS NULL ';

       if Trim(vlCVE_RECU)<>'' then
       begin
          vlQry := GetSQLQuery(vlSQLCad,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );

          try
            if vlQry <> nil then
            begin
               strgrdCanc.Cells[CO_COL_CVE_OPER_REC, cont1] := vlCVE_RECU;
               strgrdCanc.Cells[CO_COL_FECHA_REC, cont1] := vlQry.FieldByName('F_VALOR').asString;
               strgrdCanc.Cells[CO_COL_IMP_NETO_RECU, cont1] := FormatFloat('###,###,##0.00',vlQry.FieldByName('IMP_CONCEPTO').asFloat);

               strgrdCanc.Cells[CO_COL_CVE_OPER_RESC, cont1] := '-';
               strgrdCanc.Cells[CO_COL_FECHA_RESC, cont1] := ' ';
               strgrdCanc.Cells[CO_COL_IMP_NETO_RESC, cont1] := '0.00';

               vlIMP_TOTAL_RECU:= vlIMP_TOTAL_RECU + StrToFloat(QuitaComas(strgrdCanc.Cells[CO_COL_IMP_NETO_RECU, cont1]));

               vlDIF:= StrToFloat(QuitaComas(strgrdCanc.Cells[CO_COL_IMP_NETO_APL,  cont1]))
                     - StrToFloat(QuitaComas(strgrdCanc.Cells[CO_COL_IMP_NETO_RECU, cont1]))
                     ;

               strgrdCanc.Cells[CO_COL_IMP_NETO_REV, cont1] := FormatFloat('###,###,##0.00',vlDIF);
            end;

          finally
            if vlQry <> nil then vlQry.free;
          end;
       end;

       cont1:=cont1+1;
    end;

    RegTot:=strgrdCanc.RowCount;
    cont1:=0;

    //BUSCA LAS REVERSAS POR RESCATE REALIZADAS
    while (cont1 <= RegTot-1) do
    begin
       vlCVE_RECU:='';

       if (Trim(strgrdCanc.Cells[CO_COL_CVE_OPER_APL, cont1])='PGCPGF') then vlCVE_RECU :=' ''RTCPGF'' , ''RSCPGF'', ''INCPGF'' ';
       if (Trim(strgrdCanc.Cells[CO_COL_CVE_OPER_APL, cont1])='PGINGF') then vlCVE_RECU :=' ''RTINGF'' , ''RSINGF'', ''ININGF'' ';
       if (Trim(strgrdCanc.Cells[CO_COL_CVE_OPER_APL, cont1])='PGFNGF') then vlCVE_RECU :=' ''RTFNGF'' , ''RSFNGF'', ''INFNGF'' ';
       if (Trim(strgrdCanc.Cells[CO_COL_CVE_OPER_APL, cont1])='PGCNGF') then vlCVE_RECU :=' ''RTCNGF'' , ''RSCNGF'', ''INCNGF'' ';

       if (Trim(strgrdCanc.Cells[CO_COL_CVE_OPER_APL, cont1])='PGCPGP') then vlCVE_RECU :=' ''RTCPGP'' , ''RSCPGP'', ''INCPGP'' ';
       if (Trim(strgrdCanc.Cells[CO_COL_CVE_OPER_APL, cont1])='PGINGP') then vlCVE_RECU :=' ''RTINGP'' , ''RSINGP'', ''ININGP'' ';
       if (Trim(strgrdCanc.Cells[CO_COL_CVE_OPER_APL, cont1])='PGFNGP') then vlCVE_RECU :=' ''RTFNGP'' , ''RSFNGP'', ''INFNGP'' ';
       if (Trim(strgrdCanc.Cells[CO_COL_CVE_OPER_APL, cont1])='PGCNGP') then vlCVE_RECU :=' ''RTCNGP'' , ''RSCNGP'', ''INCNGP'' ';


       vlSQLCad := 'SELECT CT.CVE_OPERACION, CT.F_VALOR, NVL(SUM(CDT.IMP_CONCEPTO),0) AS IMP_CONCEPTO '+ coCRLF +
                   '  FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT, CR_XTRANSACCION CXT ' + coCRLF +
                   ' WHERE CT.ID_CREDITO = ' + strgrdCanc.Cells[CO_COL_IDCREDITO, cont1] + coCRLF +
                   ' AND CDT.ID_TRANSACCION = CT.ID_TRANSACCION '+ coCRLF +
                   ' AND CXT.ID_TRANSACCION = CT.ID_TRANSACCION '+ coCRLF +
                   ' AND CXT.ID_SOLICITUD = ' + strgrdCanc.Cells[CO_COL_IDSOLICITUD, cont1]+ coCRLF +
                   ' AND CXT.ID_DET_SOLICITUD = ' + strgrdCanc.Cells[CO_COL_IDDDETSOLICITUD, cont1]+ coCRLF +
                   ' AND CDT.CVE_OPERACION = CT.CVE_OPERACION '+ coCRLF ;

       if Trim(strgrdCanc.Cells[CO_COL_IDCESION, cont1]) <> '' then
          vlSQLCad:= vlSQLCad + '   AND CT.ID_CESION = '  + strgrdCanc.Cells[CO_COL_IDCESION, cont1] + coCRLF;

       if Trim(strgrdCanc.Cells[CO_COL_IDDOCTO, cont1]) <> '' then
          vlSQLCad:= vlSQLCad + '   AND CT.ID_DOCUMENTO = ''' + strgrdCanc.Cells[CO_COL_IDDOCTO, cont1] +''''+ coCRLF;

       if Trim(strgrdCanc.Cells[CO_COL_CVECOMISION, cont1]) <> '' then
           vlSQLCad:= vlSQLCad + '   AND CT.CVE_COMISION = ''' + strgrdCanc.Cells[CO_COL_CVECOMISION, cont1] +''''+ coCRLF;

       vlSQLCad:= vlSQLCad +
                   '   AND CT.ID_PERIODO = ' + strgrdCanc.Cells[CO_COL_IDPERIODO, cont1] + coCRLF +
                   '   AND CT.CVE_OPERACION IN ('+vlCVE_RECU+') ' + coCRLF +
                   '   AND CT.SIT_TRANSACCION = ''AC'' ' + coCRLF +
                   '   AND CDT.CVE_CONCEPTO IN ('''+strgrdCanc.Cells[CO_COL_CONCEPTO, cont1]+''') ' + coCRLF +
                   '   AND CT.ID_TRANS_CANCELA IS NULL ' + coCRLF +
                   '   GROUP BY CT.CVE_OPERACION, CT.F_VALOR ';

       if Trim(vlCVE_RECU)<>'' then
       begin
          vlQry := GetSQLQuery(vlSQLCad,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );

          try
            if vlQry <> nil then
            begin
               strgrdCanc.Cells[CO_COL_CVE_OPER_RESC, cont1] := vlQry.FieldByName('CVE_OPERACION').asString;
               strgrdCanc.Cells[CO_COL_FECHA_RESC, cont1] := vlQry.FieldByName('F_VALOR').asString;
               strgrdCanc.Cells[CO_COL_IMP_NETO_RESC, cont1] := FormatFloat('###,###,##0.00',vlQry.FieldByName('IMP_CONCEPTO').asFloat);

               vlIMP_TOTAL_RESC:= vlIMP_TOTAL_RESC + StrToFloat(QuitaComas(strgrdCanc.Cells[CO_COL_IMP_NETO_RESC, cont1]));

               vlDIF:= StrToFloat(QuitaComas(strgrdCanc.Cells[CO_COL_IMP_NETO_APL,  cont1]))
                     - StrToFloat(QuitaComas(strgrdCanc.Cells[CO_COL_IMP_NETO_RECU, cont1]))
                     - StrToFloat(QuitaComas(strgrdCanc.Cells[CO_COL_IMP_NETO_RESC, cont1]))
                     ;

               strgrdCanc.Cells[CO_COL_IMP_NETO_REV, cont1] := FormatFloat('###,###,##0.00',vlDIF);
            end;

          finally
            if vlQry <> nil then vlQry.free;
          end;
       end;

       cont1:=cont1+1;
    end;


    LtotApli.Caption := FormatFloat('###,###,##0.00',(vlIMP_TOTAL_APLI));
    LtotRec.Caption := FormatFloat('###,###,##0.00',(vlIMP_TOTAL_RECU));
    LtotResc.Caption := FormatFloat('###,###,##0.00',(vlIMP_TOTAL_RESC));

    LtotRev.Caption:=FormatFloat('###,###,##0.00',(vlIMP_TOTAL_APLI - vlIMP_TOTAL_RECU - vlIMP_TOTAL_RESC));
    edTOT_RESCATAR.Text:=LtotRev.Caption;

end;

procedure TWCrRevGar.ilACREDITADOEjecuta(Sender: TObject);
begin
  if Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) then
  begin
    cbCredito.Checked := False;
    cbAcreditado.Checked := True;
    BBBuscaClick(BBBusca);
  end;
end;

procedure TWCrRevGar.btACREDITADOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRREVGAR_ACRED',True,True) then
   begin
      if Objeto.Acreditado.Busca then
      begin
        cbAcreditado.Checked := True;
        BBBuscaClick(BBBusca);
      end;
   end;
end;


procedure TWCrRevGar.cbAcreditadoClick(Sender: TObject);
begin
  if cbAcreditado.Checked and Objeto.Acreditado.Active = False then
   cbAcreditado.Checked := False;

  if not cbAcreditado.Checked then
  begin
    Objeto.Acreditado.Active := false;
    edACREDITADO.Text:='';
    edNOMBRE_ACRED.Text:='';
  end;

  if cbAcreditado.Checked then edTOT_RESCATAR.Enabled:=false
  else
     edTOT_RESCATAR.Enabled:=true;
end;


procedure TWCrRevGar.ilCREDITOEjecuta(Sender: TObject);
begin
  if Objeto.Credito.FindKey([ilCREDITO.Buffer]) then
  begin
    cbAcreditado.Checked := False;
    cbCredito.Checked := True;
    BBBuscaClick(BBBusca);
  end;
end;


procedure TWCrRevGar.btCreditoClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRREVGAR_DISP',True,True) then
   begin
      if Objeto.Credito.Busca then
      begin
        cbCredito.Checked := True;
        BBBuscaClick(BBBusca);
      end;
   end;
end;

procedure TWCrRevGar.cbCreditoClick(Sender: TObject);
begin
  if cbCredito.Checked and Objeto.Credito.Active = False then
   cbCredito.Checked := False;

  if not cbCredito.Checked then
  begin
    Objeto.Credito.Active := false;
    edID_CREDITO.Text:='';
    edDESC_CREDITO.Text:='';
  end;

  if cbCredito.Checked then edTOT_RESCATAR.Enabled:=true
  else
     edTOT_RESCATAR.Enabled:=false;
end;


//BUSCA DATOS
procedure TWCrRevGar.BBBuscaClick(Sender: TObject);
var vlclave : String;
begin
//JFOF VALIDA USUARIO 12/10/2011
    vlclave :='09';
// if ValidaUsuario(Objeto.Apli,vlclave) then begin
   if Objeto.ValidaAccesoEsp('TCRREVGAR_BUSCAR',True,True) then
   begin
      //JFOF VALIDA USUARIO 12/10/2011
      LimpiaMemo;
      BuscaDatos;
   end;
{ else
 begin
 ShowMessage('    No tiene suficientes permisos para esta Acción');
 end;}

end;

//CANCELA LAS OPERACIONES
procedure TWCrRevGar.BBReversarClick(Sender: TObject);
var vlResult   : Integer;
    vlTxResult, vlmov : String;
    vlImpRev, vlImpNeto, vlImpBru, vlImpIva, vlImpMor, vlIvaMor, vlImpTemp : Currency;
    cont2, vlnumreg:word;
    vlidcredito, vlcesion, vldocto, vlperiodo, vlcvecomision, vlidsolicitud, vliddetsolicitud:string;
    vlclave : String;
begin
//JFOF VALIDA USUARIO 12/10/2011
     vlclave := '10';
//  if ValidaUsuario(Objeto.Apli,vlclave)then
   if Objeto.ValidaAccesoEsp('TCRREVGAR_APLICA',True,True) then
//JFOF VALIDA USUARIO 12/10/2011  
   begin
     Recalcula_Montos;
     if Rtrev.ItemIndex=0 then vlmov:='el RESCATE';
     if Rtrev.ItemIndex=1 then vlmov:='la DEVOLUCION X REESTRUCTURA';
     if Rtrev.ItemIndex=2 then vlmov:='el Mov. de INCOBRABILIDAD';

    try
      if MessageDlg('Estás seguro de realizar '+vlmov+' por el Importe Seleccionado',
           mtConfirmation, [mbYes, mbNo], 0 ) = mrYes then
      begin
         if StrToFloat(QuitaComas(edTOT_RESCATAR.Text))<=0 then
         begin
            ShowMessage('El Importe es Menor o Igual a CERO');
            Exit;
         end;

         if StrToFloat(QuitaComas(edTOT_RESCATAR.Text)) > StrToFloat(QuitaComas(LtotRev.Caption)) then
         begin
            ShowMessage('El Importe es Mayor al Calculado');
            Exit;
         end;

         Objeto.LimpiaTabla(vlError);

         RegTot:=strgrdCanc.RowCount; 
         cont2:=0;
         vlnumreg:=0;
         vlImpRev:=StrToFloat(QuitaComas(edTOT_RESCATAR.Text));

         while cont2 <= Ltransac.Items.Count-1 do
         begin
            vlImpNeto:=0;
            vlImpBru:=0;
            vlImpIva:=0;
            vlImpMor:=0;
            vlIvaMor:=0;
            cont1:=0;
            vlCVE_RECU:='';

            while (cont1 <= RegTot-1) do
            begin
               if Trim(strgrdCanc.Cells[CO_COL_IDTRANSACCION, cont1]) = Ltransac.Items.Strings[cont2] then
               begin
                  if vlImpRev >= StrToFloat(QuitaComas(strgrdCanc.Cells[CO_COL_IMP_NETO_REV, cont1])) then
                     vlImpTemp:= StrToFloat(QuitaComas(strgrdCanc.Cells[CO_COL_IMP_NETO_REV, cont1]))
                  else
                     vlImpTemp:= vlImpRev;

                  if Trim(strgrdCanc.Cells[CO_COL_CONCEPTO, cont1]) = 'IMPBRU' then  vlImpBru:= vlImpBru + vlImpTemp;
                  if Trim(strgrdCanc.Cells[CO_COL_CONCEPTO, cont1]) = 'IMPIVA' then  vlImpIva:= vlImpIva + vlImpTemp;
                  if Trim(strgrdCanc.Cells[CO_COL_CONCEPTO, cont1]) = 'IMPMOR' then  vlImpMor:= vlImpMor + vlImpTemp;
                  if Trim(strgrdCanc.Cells[CO_COL_CONCEPTO, cont1]) = 'IVAMOR' then  vlIvaMor:= vlIvaMor + vlImpTemp;

                  vlImpRev:= vlImpRev - vlImpTemp;

                  if Rtrev.ItemIndex = 0 then
                  begin
                     if (Trim(strgrdCanc.Cells[CO_COL_CVE_OPER_APL, cont1])='PGCPGF') then vlCVE_RECU :='RTCPGF';
                     if (Trim(strgrdCanc.Cells[CO_COL_CVE_OPER_APL, cont1])='PGINGF') then vlCVE_RECU :='RTINGF';
                     if (Trim(strgrdCanc.Cells[CO_COL_CVE_OPER_APL, cont1])='PGFNGF') then vlCVE_RECU :='RTFNGF';
                     if (Trim(strgrdCanc.Cells[CO_COL_CVE_OPER_APL, cont1])='PGCNGF') then vlCVE_RECU :='RTCNGF';

                     if (Trim(strgrdCanc.Cells[CO_COL_CVE_OPER_APL, cont1])='PGCPGP') then vlCVE_RECU :='RTCPGP';
                     if (Trim(strgrdCanc.Cells[CO_COL_CVE_OPER_APL, cont1])='PGINGP') then vlCVE_RECU :='RTINGP';
                     if (Trim(strgrdCanc.Cells[CO_COL_CVE_OPER_APL, cont1])='PGFNGP') then vlCVE_RECU :='RTFNGP';
                     if (Trim(strgrdCanc.Cells[CO_COL_CVE_OPER_APL, cont1])='PGCNGP') then vlCVE_RECU :='RTCNGP';
                  end;

                  if Rtrev.ItemIndex = 1 then
                  begin
                     if (Trim(strgrdCanc.Cells[CO_COL_CVE_OPER_APL, cont1])='PGCPGF') then vlCVE_RECU :='RSCPGF';
                     if (Trim(strgrdCanc.Cells[CO_COL_CVE_OPER_APL, cont1])='PGINGF') then vlCVE_RECU :='RSINGF';
                     if (Trim(strgrdCanc.Cells[CO_COL_CVE_OPER_APL, cont1])='PGFNGF') then vlCVE_RECU :='RSFNGF';
                     if (Trim(strgrdCanc.Cells[CO_COL_CVE_OPER_APL, cont1])='PGCNGF') then vlCVE_RECU :='RSCNGF';

                     if (Trim(strgrdCanc.Cells[CO_COL_CVE_OPER_APL, cont1])='PGCPGP') then vlCVE_RECU :='RSCPGP';
                     if (Trim(strgrdCanc.Cells[CO_COL_CVE_OPER_APL, cont1])='PGINGP') then vlCVE_RECU :='RSINGP';
                     if (Trim(strgrdCanc.Cells[CO_COL_CVE_OPER_APL, cont1])='PGFNGP') then vlCVE_RECU :='RSFNGP';
                     if (Trim(strgrdCanc.Cells[CO_COL_CVE_OPER_APL, cont1])='PGCNGP') then vlCVE_RECU :='RSCNGP';
                  end;

                  if Rtrev.ItemIndex = 2 then
                  begin
                     if (Trim(strgrdCanc.Cells[CO_COL_CVE_OPER_APL, cont1])='PGCPGF') then vlCVE_RECU :='INCPGF';
                     if (Trim(strgrdCanc.Cells[CO_COL_CVE_OPER_APL, cont1])='PGINGF') then vlCVE_RECU :='ININGF';
                     if (Trim(strgrdCanc.Cells[CO_COL_CVE_OPER_APL, cont1])='PGFNGF') then vlCVE_RECU :='INFNGF';
                     if (Trim(strgrdCanc.Cells[CO_COL_CVE_OPER_APL, cont1])='PGCNGF') then vlCVE_RECU :='INCNGF';

                     if (Trim(strgrdCanc.Cells[CO_COL_CVE_OPER_APL, cont1])='PGCPGP') then vlCVE_RECU :='INCPGP';
                     if (Trim(strgrdCanc.Cells[CO_COL_CVE_OPER_APL, cont1])='PGINGP') then vlCVE_RECU :='ININGP';
                     if (Trim(strgrdCanc.Cells[CO_COL_CVE_OPER_APL, cont1])='PGFNGP') then vlCVE_RECU :='INFNGP';
                     if (Trim(strgrdCanc.Cells[CO_COL_CVE_OPER_APL, cont1])='PGCNGP') then vlCVE_RECU :='INCNGP';
                  end;

                  vlidcredito      := Trim(strgrdCanc.Cells[CO_COL_IDCREDITO, cont1]);
                  vlcesion         := Trim(strgrdCanc.Cells[CO_COL_IDCESION, cont1]);
                  vldocto          := Trim(strgrdCanc.Cells[CO_COL_IDDOCTO, cont1]);
                  vlcvecomision    := Trim(strgrdCanc.Cells[CO_COL_CVECOMISION, cont1]);
                  vlperiodo        := Trim(strgrdCanc.Cells[CO_COL_IDPERIODO, cont1]);
                  vlidsolicitud    := Trim(strgrdCanc.Cells[CO_COL_IDSOLICITUD, cont1]);
                  vliddetsolicitud := Trim(strgrdCanc.Cells[CO_COL_IDDDETSOLICITUD, cont1]);

               end;
               cont1:=cont1+1;
            end;

            vlImpNeto := vlImpBru + vlImpIva + vlImpMor + vlIvaMor;

            if (vlImpNeto > 0) and (vlCVE_RECU<>'') then
            begin
               AgregaElemento(vlError,
                              vlCVE_RECU, vlidcredito, vldocto, vlcvecomision,
                              vlcesion, vlperiodo, vlidsolicitud, vliddetsolicitud,
                              vlImpNeto, vlImpBru, vlImpIva, vlImpMor, vlIvaMor
                             );
               if vlError<>'' then
               begin
                  ShowMessage(vlError);
                  exit;
               end;

               vlnumreg:=vlnumreg+1;
            end;
            cont2:=cont2+1; 
         end;

         if (vlnumreg>0) then
         begin
            if Rtrev.ItemIndex = 0 then vlTIPO_DEV:='RT';
            if Rtrev.ItemIndex = 1 then vlTIPO_DEV:='RS';
            if Rtrev.ItemIndex = 2 then vlTIPO_DEV:='IN';          

            if (vlCVE_RECU<>'') then
            begin
               vlCVE_RECU:= Copy(vlCVE_RECU, 5, 2);

               if (vlCVE_RECU='GF') then vlTIPO_GTIA:='FR';
               if (vlCVE_RECU='GP') then vlTIPO_GTIA:='PY';
            end;

            ProcesaDev(vlError);
            if vlError<>'' then
            begin
               ShowMessage(vlError);
               Exit;
            end;
            ShowMessage('El proceso ha concluido');
         end;

         BuscaDatos;
         dtpF_VALOR.DateTime:= Objeto.Apli.DameFechaEmpresa;
         edF_VALOR.text:=FormatDateTime('dd/mm/yyyy',dtpF_VALOR.DateTime);
      end;//ends_if;
    except
      on e : Exception do
        ShowMessage( e.Message );
    end;
    BBReversar.Enabled := True;
  end;
  {else begin
  ShowMessage('    No tiene suficientes permisos para esta Acción');
  end;}
end;


procedure TWCrRevGar.strgrdCancMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var nCol, nRow : Integer;
begin
   strgrdCanc.MouseToCell(X, Y, nCol, nRow);
 {  if nCol = CO_COL_CHECK then
      InvertCheck(strgrdCanc, CO_COL_CHECK, nRow);}
end;


procedure TWCrRevGar.strgrdCancDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var str : String;
    Bmp : TBitmap;
    sTexto: String;           // Texto que va a imprimir en la celda actual
    Alineacion: TAlignment;   // Alineación que le vamos a dar al texto
    iAnchoTexto: Integer;     // Ancho del texto a imprimir en pixels
begin
 If (Sender Is TStringGrid) Then
  With (Sender As TStringGrid) Do
   Begin

      If (gdSelected In State) Then Canvas.Brush.Color := clWhite;

      Canvas.Font.Color := clBlack;

      if (ACol = CO_COL_IDCREDITO)or(ACol = CO_COL_CHECK)or(ACol = CO_COL_F_OPERACION)or(ACol = CO_COL_CONCEPTO)or
         //(ACol = CO_COL_IDTRANSACCION)or(ACol = CO_COL_IDCESION)or(ACol = CO_COL_IDDOCTO)or
         (ACol = CO_COL_IDPERIODO)or
         (ACol = CO_COL_CVECOMISION)or(ACol = CO_COL_CVE_OPER_APL)or(ACol = CO_COL_CVE_OPER_REC)or(ACol = CO_COL_CVE_OPER_RESC) then
         Alineacion := taCenter;

      if (ACol = CO_COL_IMP_NETO_APL)or(ACol = CO_COL_IMP_NETO_RECU)or(ACol = CO_COL_IMP_NETO_REV)or(ACol = CO_COL_IMP_NETO_RESC) then
         Alineacion := taRightJustify;

    {  if (ACol = CO_COL_SITPROCESO)or(ACol = CO_COL_SITCRE) then
         Alineacion := taLeftJustify;
     }

      sTexto := Cells[ACol,ARow];
      Canvas.FillRect( Rect );
      iAnchoTexto := Canvas.TextWidth( sTexto );

      case Alineacion of
        taLeftJustify:  Canvas.TextOut( Rect.Left + 5, Rect.Top + 2, sTexto );
        taCenter:       Canvas.TextOut( Rect.Left + ( ( Rect.Right - Rect.Left ) - iAnchoTexto ) div 2, Rect.Top + 2, sTexto );
        taRightJustify: Canvas.TextOut( Rect.Right - iAnchoTexto - 2, Rect.Top + 2, sTexto );
      end;

      If (ACol = CO_COL_CHECK) Then
      Begin
         Bmp := TBitmap.Create;
         If (Cells[CO_COL_CHECK,ARow] = CO_CHECKED) Then ImageList.GetBitmap(1,Bmp)
         Else ImageList.GetBitmap(0,Bmp);
         Canvas.Draw(Rect.Left,Rect.Top,Bmp);
         Bmp.FreeImage;
         Bmp.Free;
      End;
  End;

end;

procedure TWCrRevGar.edTOT_RESCATARExit(Sender: TObject);
begin
   Recalcula_Montos;
end;

end.
