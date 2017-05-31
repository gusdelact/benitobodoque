{$A+,B-,C+,D+,E-,F-,G+,H+,I-,J+,K-,L+,M-,N+,O+,P+,Q+,R-,S-,T-,U-,V+,W-,X+,Y-,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
// Sistema         : Clase de CrCarFinq
// Fecha de Inicio : 13/07/2011
// Función forma   : Clase de CrCarFinq
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : 
// Comentarios     :
Unit IntCrCarFinq;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, Grids,
IntSGCtrl, IntLinkit, ImgList, Spin,

IntGenCre,
IntParamCre,    // Parametros
IntCrCto,       // Contrato
IntEmple,       // Empleado - Apoderado
IntCrCredito,   // Disposición
IntCrAcredit,   // Acreditado
IntMQrCarFinq   // Carta
;    

Const
  coCRLF           = #13#10;
  // para grid de cartas 1, 2 y 3
  CO_COL_CHECK     = 0;
  CO_COL_IDCREDITO = CO_COL_CHECK + 1;
  CO_COL_F_INICIO  = CO_COL_IDCREDITO + 1;
  CO_COL_IMP_DISP  = CO_COL_F_INICIO + 1;
  CO_COL_ADE_TOT   = CO_COL_IMP_DISP + 1;
  CO_COL_IMP_INT   = CO_COL_ADE_TOT + 1;
  CO_COL_IMP_PREPG = CO_COL_IMP_INT + 1;
  CO_COL_ADE_TOT_V = CO_COL_IMP_PREPG + 1;
  CO_COL_IMP_INT_V = CO_COL_ADE_TOT_V + 1;
  CO_COL_TOT_VDO   = CO_COL_IMP_INT_V + 1;

  // para grid de carta 4
  CO_COL_CONTRA   = 0;
  CO_COL_ID_CRE   = CO_COL_CONTRA + 1;
  CO_COL_F_INI    = CO_COL_ID_CRE + 1;
  CO_COL_IMP_CRED = CO_COL_F_INI + 1;
  CO_COL_SIT_CRED = CO_COL_IMP_CRED + 1;


  CO_CHECKED   = 'V';
  CO_UNCHECKED = 'F';
  CO_NOTCHECK  = '-';
Type
 TCrCarFinq= class; 

  TWCrCarFinq=Class(TForm)
    InterForma1             : TInterForma;
    GroupBox1: TGroupBox;
    Label9: TLabel;
    edF_Emision: TEdit;
    dtpF_Emision: TInterDateTimePicker;
    Label1: TLabel;
    edF_InicioInfo: TEdit;
    dtpF_InicioInfo: TInterDateTimePicker;
    Label2: TLabel;
    rgTipoFormato: TRadioGroup;
    rgAtencionDe: TRadioGroup;
    gbPersonalizar: TGroupBox;
    Label3: TLabel;
    edNombrePersonalizado: TEdit;
    Label4: TLabel;
    edPuestoPersonalizado: TEdit;
    GroupBox4: TGroupBox;
    iedID_Persona1: TInterEdit;
    btPersona1: TBitBtn;
    edNombrePersona1: TEdit;
    iedID_Persona2: TInterEdit;
    btPersona2: TBitBtn;
    edNombrePersona2: TEdit;
    edPuestoPersona1: TEdit;
    edPuestoPersona2: TEdit;
    chPersona1: TCheckBox;
    chPersona2: TCheckBox;
    GroupBox5: TGroupBox;
    MemoPiePagina: TMemo;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    ilID_CONTRATO: TInterLinkit;
    edF_FinInfo: TEdit;
    dtpF_FinInfo: TInterDateTimePicker;
    ilID_CREDITO: TInterLinkit;
    ilID_Persona1: TInterLinkit;
    ilID_Persona2: TInterLinkit;
    ImageList: TImageList;
    edTituloPersona1: TEdit;
    edTituloPersona2: TEdit;
    GroupBox2: TGroupBox;
    SpinEdit_Copias: TSpinEdit;
    Label6: TLabel;
    pnCreditoLinea: TPanel;
    gbBusqueda: TGroupBox;
    lbLinea: TLabel;
    lbCredito: TLabel;
    iedID_Contrato: TInterEdit;
    btCONTRATO: TBitBtn;
    edNomAcreditadoContrato: TEdit;
    iedID_Credito: TInterEdit;
    btCredito: TBitBtn;
    edNomAcreditadoCredito: TEdit;
    gbCreditosLinea: TGroupBox;
    ShTitulo9: TShape;
    ShTitulo6: TShape;
    ShTitulo3: TShape;
    ShTitulo4: TShape;
    ShTitulo1: TShape;
    ShTitulo2: TShape;
    lblEtiquetaTit2: TLabel;
    ShTitulo5: TShape;
    lblEtiquetaTit6: TLabel;
    lblEtiquetaTit1: TLabel;
    lblEtiquetaTit4: TLabel;
    lblEtiquetaTit3: TLabel;
    lblEtiquetaTit5: TLabel;
    lblEtiquetaTit10: TLabel;
    ShTitulo7: TShape;
    ShTitulo8: TShape;
    lblEtiquetaTit8: TLabel;
    lblEtiquetaTit9: TLabel;
    strgrdCreditos: TStringGrid;
    btnSeleccionar: TButton;
    GroupBox6: TGroupBox;
    chLinea: TCheckBox;
    chImpagado: TCheckBox;
    chConIntereses: TCheckBox;
    pnAcreditado: TPanel;
    GroupBox3: TGroupBox;
    GroupBox7: TGroupBox;
    Shape3: TShape;
    Shape4: TShape;
    Shape6: TShape;
    Label10: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    strgrdCreditosAcAcreditado: TStringGrid;
    Label7: TLabel;
    edACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edSECTOR_CORP: TEdit;
    edNOMBRE_ACRED: TEdit;
    Shape1: TShape;
    Label5: TLabel;
    ilACREDITADO: TInterLinkit;
    Referencia: TLabel;
    Shape2: TShape;
    Label8: TLabel;
    ied_Referencia: TInterEdit;
    lblEtiquetaTit7a: TLabel;
    lblEtiquetaTit7b: TLabel;
    ShTitulo10: TShape;
    chPrePagoCap: TCheckBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edF_EmisionEnter(Sender: TObject);
    procedure ilID_CREDITOEjecuta(Sender: TObject);
    procedure ilID_CONTRATOEjecuta(Sender: TObject);
    procedure btCONTRATOClick(Sender: TObject);
    procedure btCreditoClick(Sender: TObject);
    procedure iedID_CreditoExit(Sender: TObject);
    procedure iedID_ContratoExit(Sender: TObject);

    procedure rgAtencionDeClick(Sender: TObject);
    procedure strgrdCreditosDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure strgrdCreditosMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ilID_Persona1Ejecuta(Sender: TObject);
    procedure ilID_Persona2Ejecuta(Sender: TObject);
    procedure btPersona1Click(Sender: TObject);
    procedure btPersona2Click(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure btnSeleccionarClick(Sender: TObject);
    procedure rgTipoFormatoClick(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure edF_FinInfoExit(Sender: TObject);
    procedure edF_FinInfoChange(Sender: TObject);
    procedure dtpF_FinInfoExit(Sender: TObject);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure edACREDITADOExit(Sender: TObject);
    procedure strgrdCreditosAcAcreditadoDrawCell(Sender: TObject; ACol,
      ARow: Integer; Rect: TRect; State: TGridDrawState);
    private
    { Private declarations }
        Procedure ImprimeReporte(bPreview:Boolean);
    public
    { Public declarations }
    Objeto : TCrCarFinq;
    vgImpAutoLinea : String;
    Procedure HabilitaTipoBusqueda(bHabilita:Boolean);
    Procedure MuestraTitulos(bHabilita:Boolean);
    Procedure ObtenAdeudos(IdCredito:Integer; var psImpAdeudo, psImpInteres,
               psImpAdeudoVdo, psImpInteresVdo, psImpPrepagoCP : Double);
    procedure ConfGrid( SGrid : TStringGrid );
    procedure MuestraDatos;
    procedure MuestraDatosAcreditado;
    Procedure InsertaBitacora;
    function  QuitaComas(PPCadena : String):String;
    function  BuscaCastigoXCredito(peIdCredito:String):String;
end; 
 TCrCarFinq= class(TInterFrame)
      private
        fCurrentDate   : TDate;
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public
        { Public declarations }
        ParamCre    : TParamCre;
        Credito     : TCrCredito;//Disposición
        Contrato    : TCrCto;    //Contrato Crédito
        Apoderado1  : TEmpleado; //Apoderado
        Apoderado2  : TEmpleado;
        Acreditado  : TCrAcredit; //Acreditado


        F_EMISION   : TInterCampo;
        F_INI_INFO  : TInterCampo;
        F_FIN_INFO  : TInterCampo;
        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override; 
        function    Reporte:Boolean; override;
        procedure   setCurrentDate( Sender: TInterCampo );
        function    getCurrentDate: TDate;

      published 
      end;
      
implementation
//Uses RepMon;

{$R *.DFM}

constructor TCrCarFinq.Create( AOwner : TComponent );
begin Inherited; 
      F_EMISION  :=CreaCampo('F_EMISION',ftDate,tsNinguno,tsNinguno,False);
                 F_EMISION.Caption:='Fecha de emisión';
      F_INI_INFO :=CreaCampo('F_INI_INFO',ftDate,tsNinguno,tsNinguno,False);
                 F_INI_INFO.Caption:='Fecha de emisión';
      F_FIN_INFO :=CreaCampo('F_FIN_INFO',ftDate,tsNinguno,tsNinguno,False);
                 F_FIN_INFO.Caption :='Fecha de emisión';

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
      Credito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

      Contrato := TCrCto.Create(Self);
      Contrato.MasterSource:=Self;

      Apoderado1 := TEmpleado.Create(Self);
      Apoderado1.MasterSource:=Self;
      Apoderado2 := TEmpleado.Create(Self);
      Apoderado2.MasterSource:=Self;

      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource := Self;

      StpName  := ' ';
      UseQuery := False; 
      HelpFile := 'IntCrCarFinq.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrCarFinq.Destroy;
begin
  F_EMISION.Free;
  F_INI_INFO.Free;
  F_FIN_INFO.Free;

  If Credito <> nil then
     Credito.Free;
  If Contrato <> nil then
     Contrato.Free;
  If Apoderado1 <> nil then
     Apoderado1.Free;
  If Apoderado2 <> nil then
     Apoderado2.Free;
  If Acreditado <> nil then
     Acreditado.Free;

  inherited;
end;


function TCrCarFinq.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCarFinq;
begin
   W:=TWCrCarFinq.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftImprimir; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.ShowBtnImprimir := True;
      W.InterForma1.ShowBtnPreview  := True;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrCarFinq.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrcarfi.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TCrCarFinq.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CrCarFinq********************)
(*                                                                              *)
(*  FORMA DE CrCarFinq                                                            *)
(*                                                                              *)
(***********************************************FORMA CrCarFinq********************)

procedure TWCrCarFinq.FormShow(Sender: TObject);
begin
  lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
  lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

  Objeto.F_EMISION.Control := edF_Emision;
  Objeto.F_INI_INFO.Control := edF_InicioInfo;
  Objeto.F_FIN_INFO.Control := edF_FinInfo;

  Objeto.F_EMISION.AsDateTime := Objeto.Apli.DameFechaEmpresa;
  Objeto.F_INI_INFO.AsDateTime := Objeto.Apli.DameFechaEmpresa-30;
  Objeto.F_FIN_INFO.AsDateTime := Objeto.Apli.DameFechaEmpresa;

  dtpF_Emision.DateTime := Objeto.Apli.DameFechaEmpresa;
  dtpF_InicioInfo.DateTime := Objeto.Apli.DameFechaEmpresa;
  dtpF_FinInfo.DateTime := Objeto.Apli.DameFechaEmpresa;

  Objeto.Credito.ID_CREDITO.Control   := iedID_Credito;
  Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := edNomAcreditadoCredito;

  Objeto.Contrato.ID_CONTRATO.Control := iedID_Contrato;
  Objeto.Contrato.Contrato.TITNombre.Control := edNomAcreditadoContrato;

  Objeto.Apoderado1.Id_Persona.Control := iedID_Persona1;
  Objeto.Apoderado1.Persona.Nombre.Control := edNombrePersona1;
  Objeto.Apoderado1.FilterString := '(SIT_EMPLEADO = ''AC'')';
  Objeto.Apoderado1.BuscaWhereString := Objeto.Apoderado1.FilterString;
  Objeto.Apoderado1.FindKey([9413,'1']);
  InterForma1.NextTab(iedID_Persona1);
  edTituloPersona1.Text := 'C.P.';

  Objeto.Apoderado2.Id_Persona.Control := iedID_Persona2;
  Objeto.Apoderado2.Persona.Nombre.Control := edNombrePersona2;
  Objeto.Apoderado2.FilterString := '(SIT_EMPLEADO = ''AC'')';
  Objeto.Apoderado2.BuscaWhereString := Objeto.Apoderado2.FilterString;
  Objeto.Apoderado2.FindKey([107,'1']);
  InterForma1.NextTab(iedID_Persona2);
  edTituloPersona2.Text := 'LIC.';

  Objeto.Acreditado.ID_ACREDITADO.Control := edACREDITADO;
  Objeto.Acreditado.Persona.Nombre.Control := edNOMBRE_ACRED;
  Objeto.Acreditado.Persona.Cve_Tipo_Sector.Control := edSECTOR_CORP;

  ConfGrid(strgrdCreditos);

  edF_Emision.SetFocus;
end;

procedure TWCrCarFinq.FormDestroy(Sender: TObject);
begin
  Objeto.F_EMISION.Control := nil;
  Objeto.F_INI_INFO.Control := nil;
  Objeto.F_FIN_INFO.Control := nil;

  Objeto.Contrato.ID_CONTRATO.Control := nil;
  Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := nil;

  Objeto.Credito.ID_CREDITO.Control   := nil;
  Objeto.Contrato.Contrato.TITNombre.Control := nil;

  Objeto.Acreditado.ID_ACREDITADO.Control := nil;
  Objeto.Acreditado.Persona.Nombre.Control := nil;
  Objeto.Acreditado.Persona.Cve_Tipo_Sector.Control := nil;

end;

procedure TWCrCarFinq.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrCarFinq.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrCarFinq.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrCarFinq.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCrCarFinq.edF_EmisionEnter(Sender: TObject);
begin
//  Objeto.setCurrentDate(Objeto.F_INICIO);
end;

procedure TWCrCarFinq.ilID_CREDITOEjecuta(Sender: TObject);
begin
   If Objeto.Contrato.Active then
   begin
     Objeto.Contrato.Active := False;
     Objeto.Credito.Active := False;
     ClearGrid(strgrdCreditos,0);
     ConfGrid(strgrdCreditos);
   end;
   if Objeto.Credito.FindKey([ilID_CREDITO.Buffer,'1']) then
   begin
      InterForma1.NextTab(iedID_Credito);
      Objeto.Contrato.FindKey([objeto.Credito.ID_CONTRATO.AsInteger, '1']);
      InterForma1.NextTab(iedID_Contrato);
   End;
end;

procedure TWCrCarFinq.ilID_CONTRATOEjecuta(Sender: TObject);
begin
   If Objeto.Contrato.Active then
   begin
     Objeto.Contrato.Active := False;
     Objeto.Credito.Active := False;
     ClearGrid(strgrdCreditos,0);
     ConfGrid(strgrdCreditos);
   end;
   if Objeto.Contrato.FindKey([ilID_CONTRATO.Buffer,'1']) then
   begin
      InterForma1.NextTab(iedID_Contrato);
   End;
end;

procedure TWCrCarFinq.btCONTRATOClick(Sender: TObject);
begin
   Objeto.Contrato.ShowAll := True;
   if Objeto.Contrato.Busca then
   begin
      iedID_ContratoExit(Self);
      InterForma1.NextTab(btCONTRATO);
   end;
end;

procedure TWCrCarFinq.btCreditoClick(Sender: TObject);
begin
   Objeto.Credito.ShowAll := True;
   if Objeto.Credito.Busca then
   begin
      InterForma1.NextTab(btCredito);
      Objeto.Contrato.FindKey([objeto.Credito.ID_CONTRATO.AsInteger, '1']);
      InterForma1.NextTab(iedID_Contrato);
   end;
end;

procedure TWCrCarFinq.iedID_CreditoExit(Sender: TObject);
begin
  InterForma1.NextTab(btCredito);
end;

procedure TWCrCarFinq.iedID_ContratoExit(Sender: TObject);
begin
   if iedID_Contrato.Text <> '' then
      MuestraDatos;

  InterForma1.NextTab(btCONTRATO);
end;

procedure TWCrCarFinq.HabilitaTipoBusqueda(bHabilita: Boolean);
begin
  edF_Emision.Enabled     := bHabilita;
  dtpF_Emision.Enabled    := bHabilita;

  edF_InicioInfo.Enabled  := bHabilita;
  edF_FinInfo.Enabled     := bHabilita;
  dtpF_InicioInfo.Enabled := bHabilita;
  dtpF_FinInfo.Enabled    := bHabilita;
end;

procedure TWCrCarFinq.rgAtencionDeClick(Sender: TObject);
begin
  if rgAtencionDe.ItemIndex = 0 then
     begin
       gbPersonalizar.Visible := False;
       edNombrePersonalizado.Text := '';
       edPuestoPersonalizado.Text := '';
     end
  else
     begin
       gbPersonalizar.Visible := True;
     end;
end;

procedure TWCrCarFinq.ConfGrid(SGrid: TStringGrid);
begin
   With SGrid Do
   Begin
      Case rgTipoFormato.ItemIndex of
      0 : begin
            ColCount := 5;
            ColWidths[CO_COL_CHECK] := 33;
            ColWidths[CO_COL_IDCREDITO] := 43;
            ColWidths[CO_COL_F_INICIO] := 65;
            ColWidths[CO_COL_IMP_DISP] := 85;
            ColWidths[CO_COL_ADE_TOT] := 85;
            MuestraTitulos(False);
          end;
      1,2:begin
            ColCount := 10;
            ColWidths[CO_COL_CHECK] := 33;
            ColWidths[CO_COL_IDCREDITO] := 43;
            ColWidths[CO_COL_F_INICIO] := 65;
            ColWidths[CO_COL_IMP_DISP] := 85;
            ColWidths[CO_COL_ADE_TOT] := 85;
            ColWidths[CO_COL_IMP_INT] := 85;
            ColWidths[CO_COL_IMP_PREPG] := 85;
            ColWidths[CO_COL_ADE_TOT_V] := 85;
            ColWidths[CO_COL_IMP_INT_V] := 85;
            ColWidths[CO_COL_TOT_VDO] := 85;
            MuestraTitulos(True);
          end;
      3: begin
            ColCount := 5;
            ColWidths[CO_COL_CONTRA] := 85;
            ColWidths[CO_COL_ID_CRE] := 43;
            ColWidths[CO_COL_F_INI] := 66;
            ColWidths[CO_COL_IMP_CRED] := 85;
            ColWidths[CO_COL_SIT_CRED] := 52;
         end;
      end;

      RowHeights[0] := DefaultRowHeight;
      RowCount := 1;
    End;
end;

procedure TWCrCarFinq.MuestraDatos;
var
  vlstrSQLCred : String;
  vlQryCred    : TQuery;
  nRow         : Integer;
  vlImpInteres : Double;
  vlImpAdeudo  : Double;
  vlImpInteresVdo : Double;
  vlImpAdeudoVdo  : Double;
  vlImpVencido : Double;
  vlImpPrepagoCP : Double;
begin
  Objeto.F_FIN_INFO.GetFromControl;
  ClearGrid(strgrdCreditos,0);
  ConfGrid(strgrdCreditos);
  vlstrSQLCred := 'SELECT '+coCRLF+
                  'CRC.ID_CREDITO, '+coCRLF+
                  'CRC.IMP_CREDITO, '+coCRLF+
                  'CRC.SDO_INSOLUTO, '+coCRLF+
                  'CRC.SDO_VIG_TOTAL, '+coCRLF+
                  'CRC.F_INICIO, '+coCRLF+
                  'CRC.F_VENCIMIENTO, '+coCRLF+
                  'CRC.IMP_CAPITAL_VDO + CRC.IMP_INTERES_VDO + CRC.IMP_COMISION_VDO + IMP_IVA_INT_VDO AS IMP_VDO, '+coCRLF+
                  'CO.IMP_AUTORIZADO '+coCRLF+
                  'FROM   CR_CREDITO CRC, CR_CONTRATO CO '+coCRLF+
                  'WHERE CO.ID_CONTRATO = CRC.ID_CONTRATO '+coCRLF+
                  'AND CRC.ID_CONTRATO = '+objeto.Contrato.ID_CONTRATO.AsString +coCRLF;
  case rgTipoFormato.ItemIndex of
  0: begin
       vlstrSQLCred := vlstrSQLCred + ' AND  CRC.SIT_CREDITO = ''LQ'''+coCRLF;
       vlstrSQLCred := vlstrSQLCred + ' AND F_LIQUIDACION BETWEEN TO_DATE('''+ edF_InicioInfo.Text +''',''DD/MM/YYYY'') '+coCRLF+
                                      ' AND TO_DATE('''+ edF_FinInfo.Text + ''',''DD/MM/YYYY'') '+coCRLF;
     end;
  1: begin
       vlstrSQLCred := vlstrSQLCred + ' AND  CRC.SIT_CREDITO = ''AC'''+coCRLF;
     end;
  2: begin
       vlstrSQLCred := vlstrSQLCred + ' AND  CRC.SIT_CREDITO IN(''AC'',''LQ'') '+coCRLF;
       vlstrSQLCred := vlstrSQLCred + ' AND  CRC.F_INICIO <= TO_DATE('''+ edF_FinInfo.Text + ''',''DD/MM/YYYY'') ' +coCRLF;
     end;
  end;

  vlQryCred := GetSQLQuery(vlstrSQLCred, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
  If Assigned(vlQryCred) Then
     With vlQryCred Do
     Begin
         nRow := 0;
         vgImpAutoLinea := Format(CFORMAT_DINERO,[FieldByName('IMP_AUTORIZADO').AsFloat]);
         While Not Eof Do
         Begin
           case rgTipoFormato.ItemIndex of
           0: begin
                vlImpAdeudo     := 0;
                vlImpInteres    := 0;
                vlImpAdeudoVdo  := 0;
                vlImpInteresVdo := 0;
                vlImpVencido    := 0;
                MuestraTitulos(False);
              end;
           1: begin
                ObtenAdeudos(FieldByName('ID_CREDITO').AsInteger, vlImpAdeudo, vlImpInteres, vlImpAdeudoVdo, vlImpInteresVdo, vlImpPrepagoCP);
                vlImpVencido := vlImpAdeudoVdo + vlImpInteresVdo;
                MuestraTitulos(True);
              end;
           2: begin
                ObtenAdeudos(FieldByName('ID_CREDITO').AsInteger, vlImpAdeudo, vlImpInteres, vlImpAdeudoVdo, vlImpInteresVdo, vlImpPrepagoCP);
                vlImpVencido := vlImpAdeudoVdo + vlImpInteresVdo;
                MuestraTitulos(True);
              end;
           end;
           if (objeto.Credito.ID_CREDITO.AsInteger <> null) or (objeto.Credito.ID_CREDITO.AsInteger > 0) then
               if ((objeto.Credito.ID_CREDITO.AsInteger = FieldByName('ID_CREDITO').AsInteger) and (vlImpVencido = 0)) or
                  ((objeto.Credito.ID_CREDITO.AsInteger = FieldByName('ID_CREDITO').AsInteger) and (rgTipoFormato.ItemIndex <> 1)) then
                  strgrdCreditos.Cells[CO_COL_CHECK,nRow]     := CO_CHECKED
               else
                  strgrdCreditos.Cells[CO_COL_CHECK,nRow]     := CO_UNCHECKED
           else
             strgrdCreditos.Cells[CO_COL_CHECK,nRow]     := CO_UNCHECKED;
           strgrdCreditos.Cells[CO_COL_IDCREDITO,nRow] := FieldByName('ID_CREDITO').AsString;
           strgrdCreditos.Cells[CO_COL_F_INICIO,nRow]  := FieldByName('F_INICIO').AsString;
           strgrdCreditos.Cells[CO_COL_IMP_DISP,nRow]  := Format(CFORMAT_DINERO,[FieldByName('IMP_CREDITO').AsFloat]);
           case rgTipoFormato.ItemIndex of
           0: begin
               strgrdCreditos.Cells[CO_COL_ADE_TOT,nRow] := BuscaCastigoXCredito(FieldByName('ID_CREDITO').AsString);
//               strgrdCreditos.Cells[CO_COL_IMP_INT,nRow] := '0.00';
//               strgrdCreditos.Cells[CO_COL_ADE_TOT_V,nRow] := '0.00';
//               strgrdCreditos.Cells[CO_COL_IMP_INT_V,nRow] := '0.00';
//               strgrdCreditos.Cells[CO_COL_TOT_VDO,nRow] := '0.00';
              end;
           1: begin
                strgrdCreditos.Cells[CO_COL_ADE_TOT,nRow] := Format(CFORMAT_DINERO,[vlImpAdeudo]);
                strgrdCreditos.Cells[CO_COL_IMP_INT,nRow] := Format(CFORMAT_DINERO,[vlImpInteres]);
                strgrdCreditos.Cells[CO_COL_IMP_PREPG,nRow] := Format(CFORMAT_DINERO,[vlImpPrepagoCP]);
                strgrdCreditos.Cells[CO_COL_ADE_TOT_V,nRow] := Format(CFORMAT_DINERO,[vlImpAdeudoVdo]);
                strgrdCreditos.Cells[CO_COL_IMP_INT_V,nRow] := Format(CFORMAT_DINERO,[vlImpInteresVdo]);
                strgrdCreditos.Cells[CO_COL_TOT_VDO,nRow] := Format(CFORMAT_DINERO,[vlImpVencido]);
              end;
           2: begin
                strgrdCreditos.Cells[CO_COL_ADE_TOT,nRow] := Format(CFORMAT_DINERO,[vlImpAdeudo]);
                strgrdCreditos.Cells[CO_COL_IMP_INT,nRow] := Format(CFORMAT_DINERO,[vlImpInteres]);
                strgrdCreditos.Cells[CO_COL_IMP_PREPG,nRow] := Format(CFORMAT_DINERO,[vlImpPrepagoCP]);
                strgrdCreditos.Cells[CO_COL_ADE_TOT_V,nRow] := Format(CFORMAT_DINERO,[vlImpAdeudoVdo]);
                strgrdCreditos.Cells[CO_COL_IMP_INT_V,nRow] := Format(CFORMAT_DINERO,[vlImpInteresVdo]);
                strgrdCreditos.Cells[CO_COL_TOT_VDO,nRow] := Format(CFORMAT_DINERO,[vlImpVencido]);
              end;
           end;

           Inc(nRow);
           Next;
         End;
         If (nRow = 0) Then
         begin
           strgrdCreditos.RowCount := 1;
         end
         Else strgrdCreditos.RowCount := nRow;

         Close;
         Free;
         btnSeleccionar.Caption := 'Todos';
     End;
end;

procedure TWCrCarFinq.strgrdCreditosDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
    Bmp : TBitmap;            // Imagen para COL_CHECK
    sTexto: String;           // Texto que va a imprimir en la celda actual
    Alineacion: TAlignment;   // Alineación que le vamos a dar al texto
    iAnchoTexto: Integer;     // Ancho del texto a imprimir en pixels
begin
 If (Sender Is TStringGrid) Then
  With (Sender As TStringGrid) Do
   Begin
     If (gdSelected In State) Then Canvas.Brush.Color := clWhite;

     Canvas.Font.Color := clBlack;
     If (rgTipoFormato.ItemIndex = 1) and(trim(Cells[CO_COL_TOT_VDO,ARow]) <> '0.00') then
     begin
        Canvas.Font.Color := clRed;
     end;

     Canvas.TextRect(Rect,Rect.Left,Rect.Top,Cells[ACol, ARow]);

     if (ACol = CO_COL_F_INICIO) then
        Alineacion := taCenter;

     if (ACol = CO_COL_IMP_DISP)or(ACol = CO_COL_IMP_INT)or(ACol = CO_COL_TOT_VDO) or
        (ACol = CO_COL_IMP_INT_V)or(ACol = CO_COL_ADE_TOT_V) then
        Alineacion := taRightJustify;

     If (ACol = CO_COL_ADE_TOT) then
        If rgTipoFormato.ItemIndex = 0 then
        begin
          Alineacion := taLeftJustify;
          Canvas.Font.Color := clRed;
          Canvas.Font.Style := [fsBold];
        end
        else
        begin
          Alineacion := taRightJustify;
          Canvas.Font.Style := [];

          If (rgTipoFormato.ItemIndex = 1) and (trim(Cells[CO_COL_TOT_VDO,ARow]) <> '0.00') then
             Canvas.Font.Color := clred
          else
             Canvas.Font.Color := clBlack;
        end;

     if (ACol = CO_COL_IDCREDITO) then
        Alineacion := taLeftJustify;

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

procedure TWCrCarFinq.strgrdCreditosMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  nCol, nRow : Integer;
  bSeleccionar : Boolean;
begin
   strgrdCreditos.MouseToCell(X, Y, nCol, nRow);
   if nCol = CO_COL_CHECK then
      With (strgrdCreditos) Do
      Begin
        case rgTipoFormato.ItemIndex of
         0: begin
              If (Cells[CO_COL_CHECK, nRow] <>  CO_NOTCHECK) Then
                  If (Cells[CO_COL_CHECK, nRow] = CO_CHECKED) Then
                     Cells[CO_COL_CHECK, nRow] := CO_UNCHECKED
                  Else
                  begin
                     If (trim(strgrdCreditos.Cells[CO_COL_ADE_TOT,nRow]) <> '') then
                     begin
                        If MessageDlg('¿Esta seguro de genear la carta finiquito del crédito ' +
                                       trim(strgrdCreditos.Cells[CO_COL_IDCREDITO,nRow]) + chr(13) + 'aunque se haya liquidado por ' +
                                       trim(strgrdCreditos.Cells[CO_COL_ADE_TOT,nRow]) + '?',
                                       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                           Cells[CO_COL_CHECK, nRow] := CO_CHECKED
                        else
                           Cells[CO_COL_CHECK, nRow] := CO_UNCHECKED;
                     end
                     else
                       Cells[CO_COL_CHECK, nRow] := CO_CHECKED;
                  end;
            end;
         1: Begin
              If (trim(strgrdCreditos.Cells[CO_COL_TOT_VDO,nRow]) = '0.00') then
              begin
                 If (Cells[CO_COL_CHECK, nRow] <>  CO_NOTCHECK) Then
                 Begin
                    If (Cells[CO_COL_CHECK, nRow] = CO_CHECKED) Then
                       Cells[CO_COL_CHECK, nRow] := CO_UNCHECKED
                    Else
                       Cells[CO_COL_CHECK, nRow] := CO_CHECKED;
                 End;
              end
              else
                ShowMessage('Este crédito no puede ser seleccionado porque no esta al corriente al día de hoy.');
            End;
         2: Begin
               If (Cells[CO_COL_CHECK, nRow] <>  CO_NOTCHECK) Then
                  If (Cells[CO_COL_CHECK, nRow] = CO_CHECKED) Then
                     Cells[CO_COL_CHECK, nRow] := CO_UNCHECKED
                  Else
                     Cells[CO_COL_CHECK, nRow] := CO_CHECKED;
            End;
        End; // del Case
      End; // del with (strgrdCreditos)
end;

procedure TWCrCarFinq.ilID_Persona1Ejecuta(Sender: TObject);
begin
   if Objeto.Apoderado1.FindKey([ilID_Persona1.Buffer,'1']) then
   begin
      edTituloPersona1.Text := '';
      InterForma1.NextTab(iedID_Persona1);
   End;
end;

procedure TWCrCarFinq.ilID_Persona2Ejecuta(Sender: TObject);
begin
   if Objeto.Apoderado2.FindKey([ilID_Persona2.Buffer,'1']) then
   begin
      edTituloPersona2.Text := '';
      InterForma1.NextTab(iedID_Persona2);
   End;

end;

procedure TWCrCarFinq.btPersona1Click(Sender: TObject);
begin
   Objeto.Apoderado1.ShowAll := True;
   if Objeto.Apoderado1.Busca then
   begin
      edTituloPersona1.Text := '';
      InterForma1.NextTab(btPersona1);
   end;
end;

procedure TWCrCarFinq.btPersona2Click(Sender: TObject);
begin
   Objeto.Apoderado2.ShowAll := True;
   if Objeto.Apoderado2.Busca then
   begin
      edTituloPersona2.Text := '';
      InterForma1.NextTab(btPersona2);
   end;
end;

procedure TWCrCarFinq.ImprimeReporte(bPreview: Boolean);
var
  nRows  : Integer;
  nSelec : Integer;
  nCartas: Integer;
  ndiez  : Integer;
  i      : Integer;
  sFormato, sAtencion : String;
  vlContinua  : Boolean;
  vlFirma1, vlFirma2, vlPuestoFirma1, vlPuestoFirma2 :String;
  sQryDatos : String;
  vlImporte : Double;
  vlInteres : Double;
begin
  vlContinua := True;
  Objeto.F_EMISION.GetFromControl;
  Objeto.F_INI_INFO.GetFromControl;
  Objeto.F_FIN_INFO.GetFromControl;
  // se define valores para el tipo de formato a imprimir
  case rgTipoFormato.ItemIndex of
    0: sFormato := '1';
    1: sFormato := '2';
    2: sFormato := '3';
    3: sFormato := '4';
  end;
  // se definen valores para tipo de atención
  case rgAtencionDe.ItemIndex of
    0: sAtencion := 'A';
    1: sAtencion := 'P';
  end;
  // se valida que si el tipo de atención es personalizada, entonces debe
  // tener Nombre y puesto
  If rgAtencionDe.ItemIndex = 1 then
  begin
    If edNombrePersonalizado.text = '' then
    begin
       ShowMessage('No se ha indicado el nombre de la Personalizacion.');
       vlContinua := False;
    end;
  end;
  // se obtienen número de créditos seleccionados
  nSelec := 0;
  If rgTipoFormato.ItemIndex = 3 then
  begin
    nSelec := strgrdCreditosAcAcreditado.RowCount - 1;
    if nSelec > 0 then
    begin
      ShowMessage('No se puede generar carta de no adeudo para el acreditado ya que hay créditos activos.');
      vlContinua := False
    end;
  end
  else
  begin
    for nRows := 0 to strgrdCreditos.RowCount - 1 do
    begin
      if strgrdCreditos.Cells[CO_COL_CHECK, nRows] = CO_CHECKED then
         Inc(nSelec);
    end; //del FOR nRows
    If nSelec = 0 then
    begin
       ShowMessage('No se ha seleccionado ningún crédito.');
       vlContinua := False;
    end;
  end;

  // si la carta es de no adeudo por acreditado se valida que exista texto en el campo de referencia
  if rgTipoFormato.ItemIndex = 3 then
     if trim(ied_Referencia.Text) = '' then
     begin
        ShowMessage('No se ha especificado referencia para la carta de No Adeudo por Acreditado.');
        vlContinua := False;
     end;

  // se valida que por lo menos exista una firma de apoderado seleccionada
  If (not chPersona1.Checked) and (not chPersona2.Checked) then
  begin
     ShowMessage('No se ha seleccionado ningúna firma.');
     vlContinua := False
  end;

  If chPersona1.Checked then
  begin
    vlFirma1 := edTituloPersona1.Text + ' ' + edNombrePersona1.Text;
    vlPuestoFirma1 := edPuestoPersona1.Text;
  end
  else
  begin
    vlFirma1 := '';
    vlPuestoFirma1 := '';
  end;

  If chPersona2.Checked then
  begin
    vlFirma2 := edTituloPersona2.Text + ' ' + edNombrePersona2.Text;
    vlPuestoFirma2 := edPuestoPersona2.Text;
  end
  else
  begin
    vlFirma2 := '';
    vlPuestoFirma2 := '';
  end;

  If vlContinua then
  begin
     // se obtiene el número de cartas
     if rgTipoFormato.ItemIndex = 3 then
        nCartas := 1
     else
     begin
       nCartas := nSelec div 10;
       If (nSelec mod 10 > 0) then
          Inc(nCartas);
     end;

     if MessageDlg('Se imprimiran ' + IntToStr(ncartas) + ' ¿Desea continuar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
       nRows := 0;
       If rgTipoFormato.ItemIndex <> 3 then
           For i := 1 to nCartas do
           begin
             nDiez := 0;
             sQryDatos := '';
             // se arma lista de los 10 créditos seleccionados para la carta i
             While (nDiez < 10) and (nRows <= strgrdCreditos.RowCount - 1) do
             begin
               if strgrdCreditos.Cells[CO_COL_CHECK, nRows] = CO_CHECKED then
               begin
                  If rgTipoFormato.ItemIndex = 0 then
                  begin
                    vlImporte := 0;
                    vlInteres := 0;
                  end
                  else
                  begin
                    vlImporte := StrToFloat(quitacomas(trim(strgrdCreditos.Cells[CO_COL_ADE_TOT, nRows])));
                    vlInteres := StrToFloat(quitacomas(trim(strgrdCreditos.Cells[CO_COL_IMP_INT, nRows])));
                    // se suma el importe de vencidos
                    if chImpagado.Checked then
                    begin
                      vlImporte := vlImporte +
                                   StrToFloat(quitacomas(trim(strgrdCreditos.Cells[CO_COL_ADE_TOT_V, nRows])));
                      vlInteres := vlInteres +
                                   StrToFloat(quitacomas(trim(strgrdCreditos.Cells[CO_COL_IMP_INT_V, nRows])));
                    end;
                    // se agrega importe de pre pago de capital  01 SEP 2011
                    if chPrePagoCap.Checked then
                    begin
                      vlImporte := vlImporte +
                                   StrToFloat(quitacomas(trim(strgrdCreditos.Cells[CO_COL_IMP_PREPG, nRows])));
                    end;
                  end;
                  if nDiez > 0 then
                     sQryDatos := sQryDatos + 'UNION ' + coCRLF;

                  sQryDatos := sQryDatos + 'SELECT ' +
                               '''' + trim(strgrdCreditos.Cells[CO_COL_IDCREDITO, nRows]) + ''' AS ID_CREDITO, ' +
                               '''' + trim(strgrdCreditos.Cells[CO_COL_F_INICIO, nRows])  + ''' AS F_INICIO, ' +
                               '''$ ' + trim(strgrdCreditos.Cells[CO_COL_IMP_DISP, nRows])  + ''' AS IMP_DISPUESTO, ' +
                               '''$ ' + trim(Format(CFORMAT_DINERO,[vlImporte])) + ''' AS IMP_ADEUDO, ' +
                               '''$ ' + trim(Format(CFORMAT_DINERO,[vlInteres])) + ''' AS IMP_INTERES ' +
                               ' FROM DUAL ' + coCRLF;

                  Inc(nDiez);
               end;
               Inc(nRows)
             end; // del While


             ReporteCartaFiniquito( sFormato,
                                    FormatDateTime('dd/mm/yyyy',Objeto.F_EMISION.AsDateTime),
                                    FormatDateTime('dd/mm/yyyy',Objeto.F_FIN_INFO.AsDateTime),
                                    sAtencion,
                                    edNombrePersonalizado.Text,
                                    edPuestoPersonalizado.Text,
                                    vlFirma1,
                                    vlFirma2,
                                    vlPuestoFirma1,
                                    vlPuestoFirma2,
                                    Objeto.Contrato.ID_CONTRATO.AsString,
                                    vgImpAutoLinea,
                                    sQryDatos,
                                    '',
                                    MemoPiePagina.Lines,
                                    chLinea.Checked,
                                    chConIntereses.Checked,
                                    SpinEdit_Copias.Value,
                                    Objeto.Apli,
                                    bPreview );
           end // del For
       else
       begin
         ReporteCartaFiniquito( sFormato,
                                FormatDateTime('dd/mm/yyyy',Objeto.F_EMISION.AsDateTime),
                                FormatDateTime('dd/mm/yyyy',Objeto.F_FIN_INFO.AsDateTime),
                                sAtencion,
                                edNombrePersonalizado.Text,
                                edPuestoPersonalizado.Text,
                                vlFirma1,
                                vlFirma2,
                                vlPuestoFirma1,
                                vlPuestoFirma2,
                                objeto.Acreditado.ID_ACREDITADO.AsString,
                                '',
                                '',
                                trim(ied_Referencia.Text),
                                MemoPiePagina.Lines,
                                False,
                                False,
                                SpinEdit_Copias.Value,
                                Objeto.Apli,
                                bPreview );
       end;
       // después de imprimir las cartas se insertan en la bitácora.
       InsertaBitacora;
     end;  // del If MessagerDlg
  end; // del If vlContinua
end;

procedure TWCrCarFinq.InterForma1BtnPreviewClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCARFINQ_PREVI',True,True) then
      ImprimeReporte(True);
end;

function TCrCarFinq.getCurrentDate: TDate;
begin
  Result := fCurrentDate;
end;

procedure TCrCarFinq.setCurrentDate(Sender: TInterCampo);
begin
  fCurrentDate := Sender.AsDateTime;
end;

procedure TWCrCarFinq.btnSeleccionarClick(Sender: TObject);
var
  nRows : Integer;
begin
  If btnSeleccionar.Caption = 'Todos' then
  begin
     for nRows := 0 to strgrdCreditos.RowCount - 1 do
     begin
       If rgTipoFormato.ItemIndex = 0 then
       begin
         If (trim(strgrdCreditos.Cells[CO_COL_ADE_TOT,nRows]) = '') then
             strgrdCreditos.Cells[CO_COL_CHECK, nRows] := CO_CHECKED;
       end
       else
         If (trim(strgrdCreditos.Cells[CO_COL_TOT_VDO,nRows]) = '0.00') or (rgTipoFormato.ItemIndex = 2) then
            strgrdCreditos.Cells[CO_COL_CHECK,nRows] := CO_CHECKED;
     end;
     btnSeleccionar.Caption := 'Ninguno';
  end
  else
  begin
     for nRows := 0 to strgrdCreditos.RowCount - 1 do
     begin
       strgrdCreditos.Cells[CO_COL_CHECK,nRows] := CO_UNCHECKED;
     end;
     btnSeleccionar.Caption := 'Todos';
  end;

end;

procedure TWCrCarFinq.rgTipoFormatoClick(Sender: TObject);
begin
  case rgTipoFormato.ItemIndex of
  0: begin
       pnCreditoLinea.Visible := True;
       pnAcreditado.Visible   := False;
       HabilitaTipoBusqueda(True);
       chConIntereses.Visible := False;
       chImpagado.Visible := False;
       chPrePagoCap.Visible := False;
       ClearGrid(strgrdCreditos,0);
       ConfGrid(strgrdCreditos);
     end;
  1: begin
       pnCreditoLinea.Visible := True;
       pnAcreditado.Visible   := False;
       Objeto.F_EMISION.AsDateTime := Objeto.Apli.DameFechaEmpresa;
       Objeto.F_INI_INFO.AsDateTime := Objeto.Apli.DameFechaEmpresa;
       Objeto.F_FIN_INFO.AsDateTime := Objeto.Apli.DameFechaEmpresa;
       dtpF_Emision.DateTime := Objeto.Apli.DameFechaEmpresa;
       HabilitaTipoBusqueda(False);
       chConIntereses.Visible := False;
       chImpagado.Visible := False;
       chPrePagoCap.Visible := False;
       ClearGrid(strgrdCreditos,0);
       ConfGrid(strgrdCreditos);
     end;
  2: begin
       pnCreditoLinea.Visible := True;
       pnAcreditado.Visible   := False;
       HabilitaTipoBusqueda(True);
       chConIntereses.Visible := True;
       chImpagado.Visible := True;
       chPrePagoCap.Visible := True;
       ClearGrid(strgrdCreditos,0);
       ConfGrid(strgrdCreditos);
     end;
  3: begin
       pnCreditoLinea.Visible := False;
       pnAcreditado.Visible   := True;
       Objeto.F_EMISION.AsDateTime := Objeto.Apli.DameFechaEmpresa;
       Objeto.F_INI_INFO.AsDateTime := Objeto.Apli.DameFechaEmpresa;
       Objeto.F_FIN_INFO.AsDateTime := Objeto.Apli.DameFechaEmpresa;
       dtpF_Emision.DateTime := Objeto.Apli.DameFechaEmpresa;
       HabilitaTipoBusqueda(False);
       ClearGrid(strgrdCreditosAcAcreditado,0);
       ConfGrid(strgrdCreditosAcAcreditado);
     end;
  end;

//  If Objeto.Contrato.Active then iedID_ContratoExit(self);
  If Objeto.Contrato.Active then
  begin
    Objeto.Contrato.Active := False;
    Objeto.Credito.Active := False;
  end;

  If Objeto.Acreditado.Active then
     Objeto.Acreditado.Active := False;

end;

procedure TWCrCarFinq.InsertaBitacora;
var
   STPAltaCarta : TStoredProc;
   STPAltaDetCarta : TStoredProc;
   sFormato, sAtencion : String;
   iPersonaF1, iPersonaF2 :Integer;
   vlIDCarta : Integer;
   nRows     : Integer;
   vlContinua : boolean;
begin
  vlContinua := True;
  // se obtienen datos
  // se define valores para el tipo de formato
  case rgTipoFormato.ItemIndex of
    0: sFormato := 'LIQ';
    1: sFormato := 'SAD';
    2: sFormato := 'ADE';
    3: sFormato := 'NAD';
  end;
  // se definen valores para tipo de atención
  case rgAtencionDe.ItemIndex of
    0: sAtencion := 'A QUIEN CORRESPONDA';
    1: sAtencion := edNombrePersonalizado.Text;
  end;
  // se definen valores para las firmas
  if chPersona1.Checked then
     iPersonaF1 := Objeto.Apoderado1.Id_Persona.AsInteger
  else
     iPersonaF1 := 0;

  if chPersona2.Checked then
     iPersonaF2 := Objeto.Apoderado2.Id_Persona.AsInteger
  else
     iPersonaF2 := 0;

  objeto.F_EMISION.GetFromControl;
  Objeto.F_INI_INFO.GetFromControl;
  Objeto.F_FIN_INFO.GetFromControl;

  STPAltaCarta := TStoredProc.Create(Self);
  try
     with STPAltaCarta do
     begin
        STPAltaCarta.DatabaseName:= Objeto.Apli.DatabaseName;
        STPAltaCarta.SessionName:= Objeto.Apli.SessionName;
        STPAltaCarta.StoredProcName:='PKGCRCREDITO.STPALTACARTA';
        // Se crean los parametros del StoreProcedure
        Params.Clear;
        Params.CreateParam(ftString,  'PECVETIPOFORMATO', ptInput);
        Params.CreateParam(ftDateTime,'PEFELABORACION',   ptInput);
        Params.CreateParam(ftDateTime,'PEFINIINFO',       ptInput);
        Params.CreateParam(ftDateTime,'PEFFININFO',       ptInput);
        Params.CreateParam(ftString,  'PEATENCIONA',      ptInput);
        Params.CreateParam(ftString,  'PEPUESTOATENCIONA',ptInput);
        Params.CreateParam(ftInteger, 'PEIDPERSONAF1',    ptInput);
        Params.CreateParam(ftInteger, 'PEIDPERSONAF2',    ptInput);
        Params.CreateParam(ftString,  'PECVEUSUALTA',     ptInput);
        Params.CreateParam(ftString,  'PEIDTITULAR',      ptInput);
        Params.CreateParam(ftString,  'PEBCOMMIT',        ptInput);
        Params.CreateParam(ftInteger, 'PSIDCARTA',        ptOutput);
        Params.CreateParam(ftInteger, 'PSRESULTADO',      ptOutput);
        Params.CreateParam(ftString,  'PSTXRESULTADO',    ptOutput);
        // Se asignan parámetros
        ParamByName('peCveTipoFormato').AsString  := sFormato;
        ParamByName('peFElaboracion').AsDateTime  := Objeto.F_EMISION.AsDateTime;
        ParamByName('peFIniInfo').AsDateTime      := Objeto.F_INI_INFO.AsDateTime;
        ParamByName('peFFinInfo').AsDateTime      := Objeto.F_FIN_INFO.AsDateTime;
        ParamByName('peAtencionA').AsString       := sAtencion;
        ParamByName('pePuestoAtencionA').AsString := edPuestoPersonalizado.Text;
        ParamByName('peIdPersonaF1').AsInteger    := iPersonaF1;
        ParamByName('peIdPersonaF2').AsInteger    := iPersonaF2;
        ParamByName('peCveUsuAlta').AsString      := Objeto.Apli.Usuario;
        If rgTipoFormato.ItemIndex <> 3 then
           ParamByName('peIdTitular').AsInteger   := Objeto.Contrato.Contrato.ID_Titular.AsInteger
        else
           ParamByName('peIdTitular').AsInteger   := Objeto.Acreditado.ID_ACREDITADO.AsInteger;
        ParamByName('peBCommit').AsString         := 'V';

        ExecProc;

        If ParamByName('psResultado').AsInteger = 0 then
        begin
           vlIDCarta := ParamByName('psIdCarta').AsInteger;
        end
        else
        begin
          vlContinua := False;
          ShowMessage('Inserción en Bitácora, Error [ ' +
                      ParamByName('psRESULTADO').AsString + '] ' +
                      ParamByName('psTxResultado').AsString);
        end;
        UnPrepare;
     end;
  finally
     STPAltaCarta.Free;
  end;

  If (vlContinua) and (rgTipoFormato.ItemIndex <> 3)  then
  begin
    STPAltaDetCarta := TStoredProc.Create(Self);
    try
       with STPAltaDetCarta do
       begin
          STPAltaDetCarta.DatabaseName:= Objeto.Apli.DatabaseName;
          STPAltaDetCarta.SessionName:= Objeto.Apli.SessionName;
          STPAltaDetCarta.StoredProcName:='PKGCRCREDITO.STPALTADETCARTA';
          // Se crean los parametros del StoreProcedure
          Params.Clear;
          Params.CreateParam(ftInteger,'PEIDCARTA',    ptInput);
          Params.CreateParam(ftInteger,'PEIDCREDITO',  ptInput);
          Params.CreateParam(ftString, 'PEBCOMMIT',    ptInput);
          Params.CreateParam(ftInteger,'PSRESULTADO',  ptOutput);
          Params.CreateParam(ftString, 'PSTXRESULTADO',ptOutput);
       end;

       nRows := 0;
       While (nRows <= strgrdCreditos.RowCount - 1) and (vlContinua) do
       begin
         if strgrdCreditos.Cells[CO_COL_CHECK, nRows] = CO_CHECKED then
           with STPAltaDetCarta do
           begin
             // Se asignan parámetros
             ParamByName('peIdCarta').AsInteger   := vlIDCarta;
             ParamByName('peIdCredito').AsInteger := StrToInt(trim(strgrdCreditos.Cells[CO_COL_IDCREDITO, nRows]));
             ParamByName('peBCommit').AsString    := 'V';

             ExecProc;

             If ParamByName('psResultado').AsInteger <> 0 then
             begin
               vlContinua := False;
               ShowMessage('Inserción detalle de Bitácora, Error [ ' +
                           ParamByName('psRESULTADO').AsString + '] ' +
                           ParamByName('psTxResultado').AsString);
             end;
           end;
         Inc(nRows);
       end; // del for i
       STPAltaDetCarta.UnPrepare;
    finally
      STPAltaDetCarta.Free;
    end;
  end;  // del if vlContinua
end;

procedure TWCrCarFinq.ObtenAdeudos(IdCredito: Integer; var psImpAdeudo,
  psImpInteres, psImpAdeudoVdo, psImpInteresVdo, psImpPrepagoCP : Double);
var
  STPAdeudoCredito : TStoredProc;
begin
  Objeto.F_FIN_INFO.GetFromControl;
  STPAdeudoCredito := TStoredProc.Create(Self);
  try
     with STPAdeudoCredito do
     begin
        STPAdeudoCredito.DatabaseName:= Objeto.Apli.DatabaseName;
        STPAdeudoCredito.SessionName:= Objeto.Apli.SessionName;
        STPAdeudoCredito.StoredProcName:='PKGCRCREDITO.STPADEUDOCREDITO';
        // Se crean los parametros del StoreProcedure
        Params.Clear;
        Params.CreateParam(ftInteger, 'PEIDCREDITO',   ptInput);
        Params.CreateParam(ftString,  'PEFECHACIERRE', ptInput);
        Params.CreateParam(ftFloat,   'PSADEUDO',      ptOutput);
        Params.CreateParam(ftFloat,   'PSINTERES',     ptOutput);
        Params.CreateParam(ftFloat,   'PSADEUDOVDO',      ptOutput);
        Params.CreateParam(ftFloat,   'PSINTERESVDO',     ptOutput);
        Params.CreateParam(ftFloat,   'PSPREPAGOSCAPITAL',     ptOutput);
        Params.CreateParam(ftInteger, 'PSRESULTADO',   ptOutput);
        Params.CreateParam(ftString,  'PSTXRESULTADO', ptOutput);

        // Se asignan parámetros
        ParamByName('peIdCredito').AsInteger  := IdCredito;
        ParamByName('peFechaCierre').AsString := FormatDateTime('dd/mm/yyyy',Objeto.F_FIN_INFO.AsDateTime);

        ExecProc;

        If ParamByName('psResultado').AsInteger = 0 then
        begin
           psImpAdeudo  := ParamByName('psAdeudo').AsFloat;
           psImpInteres := ParamByName('psInteres').AsFloat;
           psImpAdeudoVdo  := ParamByName('psAdeudoVdo').AsFloat;
           psImpInteresVdo := ParamByName('psInteresVdo').AsFloat;
           psImpPrepagoCP  := ParamByName('psPrePAgosCapital').AsFloat;
        end
        else
        begin
          ShowMessage('Adeudo de crédito ' + IntToStr(IdCredito) + ', Error [ ' +
                      ParamByName('psRESULTADO').AsString + '] ' +
                      ParamByName('psTxResultado').AsString);
        end;
        UnPrepare;
     end;
  finally
     STPAdeudoCredito.Free;
  end;


end;

procedure TWCrCarFinq.InterForma1BtnImprimirClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCARFINQ_IMPRI',True,True) then
      ImprimeReporte(False);
end;

procedure TWCrCarFinq.edF_FinInfoExit(Sender: TObject);
begin
  Objeto.F_FIN_INFO.GetFromControl;
  Objeto.F_INI_INFO.GetFromControl;

  if objeto.F_INI_INFO.AsDateTime > objeto.F_FIN_INFO.AsDateTime then
     objeto.F_INI_INFO.AsDateTime := objeto.F_FIN_INFO.AsDateTime - 30;

  If Objeto.Contrato.Active then
  begin
    Objeto.Contrato.Active := False;
    Objeto.Credito.Active := False;
    ClearGrid(strgrdCreditos,0);
    ConfGrid(strgrdCreditos);
  end;
end;

function TWCrCarFinq.QuitaComas(PPCadena: String): String;
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

procedure TWCrCarFinq.edF_FinInfoChange(Sender: TObject);
begin
  Objeto.F_FIN_INFO.GetFromControl;

  if objeto.F_INI_INFO.AsDateTime > objeto.F_FIN_INFO.AsDateTime then
     objeto.F_INI_INFO.AsDateTime := objeto.F_FIN_INFO.AsDateTime - 30;

end;

procedure TWCrCarFinq.dtpF_FinInfoExit(Sender: TObject);
begin
   edF_FinInfoExit(Self);
   InterForma1.NextTab(edF_FinInfo);
end;

function TWCrCarFinq.BuscaCastigoXCredito(peIdCredito: String): String;
var
  vlSql : String;
  qCastigoCredito :TQuery;

begin
  Result := '';

  vlSql := ' select (case when cve_operacion in (''QUEBCP'',''QUEBIN'',''QUEBCN'',''QUEBFN'') then ''Quebranto'' ' + coCRLF +
           '  when cve_operacion in (''QUITCP'',''QUITIN'',''QUITCN'',''QUITFN'') then ''Quita'' ' + coCRLF +
           '  when cve_operacion in (''CASTCP'',''CASTIN'',''CASTCN'',''CASTFN'') then ''Castigo'' end) Tipo, ' + coCRLF +
           ' count(*) haycastigo ' + coCRLF +
           'from cr_transaccion ' + coCRLF +
           'where cve_operacion in (''QUEBCP'',''QUEBIN'',''QUEBCN'',''QUEBFN'',''QUITCP'',''QUITIN'',''QUITCN'', ' + coCRLF +
           ' ''QUITFN'',''CASTCP'',''CASTIN'',''CASTCN'',''CASTFN'') ' + coCRLF +
           '  and sit_transaccion = ''AC'' ' + coCRLF +
           '  and id_trans_cancela is null ' + coCRLF +
           '  and id_credito = ' + peIdCredito + coCRLF +
           'group by (case when cve_operacion in (''QUEBCP'',''QUEBIN'',''QUEBCN'',''QUEBFN'') then ''Quebranto'' '+ coCRLF +
           '  when cve_operacion in (''QUITCP'',''QUITIN'',''QUITCN'',''QUITFN'') then ''Quita'' ' + coCRLF +
           '  when cve_operacion in (''CASTCP'',''CASTIN'',''CASTCN'',''CASTFN'') then ''Castigo'' end) ' + coCRLF;

  qCastigoCredito := GetSQLQuery(vlSql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );

  If Assigned(qCastigoCredito) Then
     With qCastigoCredito Do
     Begin
       if qCastigoCredito.RecordCount > 0 then
          result := FieldByName('TIPO').AsString
       else
          result := '';
       close;
     end;

  if qCastigoCredito <> nil then qCastigoCredito.Free;
end;

procedure TWCrCarFinq.MuestraTitulos(bHabilita: Boolean);
Begin
  ShTitulo6.Visible := bHabilita;
  ShTitulo7.Visible := bHabilita;
  ShTitulo8.Visible := bHabilita;
  ShTitulo9.Visible := bHabilita;
  ShTitulo10.Visible := bHabilita;

  lblEtiquetaTit6.Visible := bHabilita;
  lblEtiquetaTit7a.Visible := bHabilita;
  lblEtiquetaTit7b.Visible := bHabilita;
  lblEtiquetaTit8.Visible := bHabilita;
  lblEtiquetaTit9.Visible := bHabilita;
  lblEtiquetaTit10.Visible := bHabilita;  

  if bHabilita then
     lblEtiquetaTit5.Caption := 'Imp. Capital'
  else
     lblEtiquetaTit5.Caption := 'Evento Liquida';
end;

procedure TWCrCarFinq.ilACREDITADOEjecuta(Sender: TObject);
begin
   if Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) then
      InterForma1.NextTab(edACREDITADO);
end;

procedure TWCrCarFinq.btACREDITADOClick(Sender: TObject);
begin
   Objeto.Acreditado.ShowAll := True;
   if Objeto.Acreditado.Busca then
   begin
      edACREDITADOExit(self);
      InterForma1.NextTab(edACREDITADO);
   end;

end;

procedure TWCrCarFinq.MuestraDatosAcreditado;
var
  vlstrSQLCred : String;
  vlQryCred    : TQuery;
  nRow         : Integer;
begin
  ClearGrid(strgrdCreditosAcAcreditado,0);
  ConfGrid(strgrdCreditosAcAcreditado);
  vlstrSQLCred := 'select c.id_contrato, c.id_titular, cre.id_credito, ' + coCRLF +
                  '       cre.f_inicio, cre.imp_credito, cre.sit_credito ' + coCRLF +
                  'from contrato c, cr_contrato crc, cr_credito cre ' + coCRLF +
                  'where crc.ID_CONTRATO = c.id_contrato ' + coCRLF +
                  '  and crc.ID_CONTRATO = cre.ID_CONTRATO ' + coCRLF +
                  '  and c.id_titular = ' + Objeto.Acreditado.ID_ACREDITADO.AsString + coCRLF +
                  '  and cre.sit_credito = ''AC'' ' + coCRLF;
  vlQryCred := GetSQLQuery(vlstrSQLCred, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
  If Assigned(vlQryCred) Then
     With vlQryCred Do
     Begin
         nRow := 0;
         While Not Eof Do
         Begin
           strgrdCreditosAcAcreditado.Cells[CO_COL_CONTRA,nRow]   := FieldByName('ID_CONTRATO').AsString;
           strgrdCreditosAcAcreditado.Cells[CO_COL_ID_CRE,nRow]   := FieldByName('ID_CREDITO').AsString;
           strgrdCreditosAcAcreditado.Cells[CO_COL_F_INI,nRow]    := FieldByName('F_INICIO').AsString;
           strgrdCreditosAcAcreditado.Cells[CO_COL_IMP_CRED,nRow] := Format(CFORMAT_DINERO,[FieldByName('IMP_CREDITO').AsFloat]);
           strgrdCreditosAcAcreditado.Cells[CO_COL_SIT_CRED,nRow] := FieldByName('SIT_CREDITO').AsString;
           Inc(nRow);
           Next;
         end;
         If (nRow = 0) Then
         begin
           strgrdCreditosAcAcreditado.RowCount := 1;
         end
         Else strgrdCreditosAcAcreditado.RowCount := nRow;

         Close;
         Free;
     end;
end;

procedure TWCrCarFinq.edACREDITADOExit(Sender: TObject);
begin
  if edACREDITADO.Text <> '' then
      MuestraDatosAcreditado;

  InterForma1.NextTab(btACREDITADO);
end;

procedure TWCrCarFinq.strgrdCreditosAcAcreditadoDrawCell(Sender: TObject;
  ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  sTexto: String;           // Texto que va a imprimir en la celda actual
  Alineacion: TAlignment;   // Alineación que le vamos a dar al texto
  iAnchoTexto: Integer;     // Ancho del texto a imprimir en pixels
begin
 If (Sender Is TStringGrid) Then
  With (Sender As TStringGrid) Do
   Begin
     If (gdSelected In State) Then Canvas.Brush.Color := clWhite;

     Canvas.Font.Color := clBlack;
     Canvas.TextRect(Rect,Rect.Left,Rect.Top,Cells[ACol, ARow]);

     if (ACol = CO_COL_F_INI) or (ACol = CO_COL_SIT_CRED) then
        Alineacion := taCenter;

     if (ACol = CO_COL_CONTRA) or (ACol = CO_COL_ID_CRE) then
        Alineacion := taLeftJustify;

     if (ACol = CO_COL_IMP_CRED) then
        Alineacion := taRightJustify;

     sTexto := Cells[ACol,ARow];
     Canvas.FillRect( Rect );
     iAnchoTexto := Canvas.TextWidth( sTexto );

     case Alineacion of
       taLeftJustify:  Canvas.TextOut( Rect.Left + 5, Rect.Top + 2, sTexto );
       taCenter:       Canvas.TextOut( Rect.Left + ( ( Rect.Right - Rect.Left ) - iAnchoTexto ) div 2, Rect.Top + 2, sTexto );
       taRightJustify: Canvas.TextOut( Rect.Right - iAnchoTexto - 2, Rect.Top + 2, sTexto );
     end;
   end;
end;

end.
