// Sistema         : Clase de CR_PARAM_FACT
// Fecha de Inicio : 09/06/2004
// Función forma   : Clase de CR_PARAM_FACT
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMSolFact;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, IntDtPk, StdCtrls, Buttons, Grids, Aligrid,
  IntFrm,DB, DbTables, Mask, InterFor,  IntFind,UnSQL2, InterFun,
  IntLinkit, IntGenCre, IntParamCre, IntCrCto, IntCtoPanel,
  InterEdit, IntCrCredito, IntCrAcredit, IntSGCtrl, Ungene,
  IntMDispSieb, Menus;

Type
  TMSolFact = Class;
  TwMSolFact = Class(TForm)
    rgSITUACION: TRadioGroup;
    Label7: TLabel;
    edID_ACREDITADO: TEdit;
    btID_ACREDITADO: TBitBtn;
    edNOM_ACREDITADO: TEdit;
    cbxID_ACREDITADO: TCheckBox;
    Label10: TLabel;
    Label11: TLabel;
    edID_CREDITO: TEdit;
    btID_CREDITO: TBitBtn;
    edNOM_CREDITO: TEdit;
    cbxID_CREDITO: TCheckBox;
    cbxID_CONTRATO: TCheckBox;
    edNOM_CONTRATO: TEdit;
    btID_CONTRATO: TBitBtn;
    edID_CONTRATO: TEdit;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    edF_RECEPCION_INI: TEdit;
    dtpF_RECEPCION_INI: TInterDateTimePicker;
    edF_RECEPCION_FIN: TEdit;
    dtpF_RECEPCION_FIN: TInterDateTimePicker;
    cbxF_RECEPCION: TCheckBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    edF_FACTURACION_INI: TEdit;
    dtpF_FACTURACION_INI: TInterDateTimePicker;
    edF_FACTURACION_FIN: TEdit;
    dtpF_FACTURACION_FIN: TInterDateTimePicker;
    cbxF_FACTURACION: TCheckBox;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    edF_LIQ_CLIENTE_INI: TEdit;
    dtpF_LIQ_CLIENTE_INI: TInterDateTimePicker;
    edF_LIQ_CLIENTE_FIN: TEdit;
    dtpF_LIQ_CLIENTE_FIN: TInterDateTimePicker;
    cbxF_LIQ_CLIENTE: TCheckBox;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    btBusca: TBitBtn;
    Shape3: TShape;
    Label8: TLabel;
    Shape1: TShape;
    Label9: TLabel;
    Shape2: TShape;
    Shape4: TShape;
    Label13: TLabel;
    Shape5: TShape;
    Label14: TLabel;
    Shape6: TShape;
    Label15: TLabel;
    Shape8: TShape;
    Label17: TLabel;
    Label12: TLabel;
    Shape7: TShape;
    Label16: TLabel;
    Merrores: TMemo;
    Shape9: TShape;
    Label18: TLabel;
    rgModoFact: TRadioGroup;
    btFACTURAR: TBitBtn;
    btDEVOLVER: TBitBtn;
    Shape10: TShape;
    Label19: TLabel;
    InterForma1: TInterForma;
    ilID_ACREDITADO: TInterLinkit;
    ilID_CONTRATO: TInterLinkit;
    ilID_CREDITO: TInterLinkit;
    sgcDATA: TSGCtrl;
    pmSIEBAN: TPopupMenu;
    DisposicinSIEBAN1: TMenuItem;
    Shape11: TShape;
    Label20: TLabel;
    Procedure FormShow(Sender: TObject);
    Procedure FormDestroy(Sender: TObject);
    Procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure InterForma1Buscar(Sender: TObject);
    Procedure cbxID_ACREDITADOClick(Sender: TObject);
    Procedure btID_ACREDITADOClick(Sender: TObject);
    Procedure ilID_ACREDITADOEjecuta(Sender: TObject);
    Procedure ilID_ACREDITADOCapture(Sender: TObject; var Show: Boolean);
    Procedure btID_CONTRATOClick(Sender: TObject);
    Procedure ilID_CONTRATOEjecuta(Sender: TObject);
    Procedure ilID_CONTRATOCapture(Sender: TObject; var Show: Boolean);
    Procedure cbxID_CONTRATOClick(Sender: TObject);
    Procedure ilID_CREDITOCapture(Sender: TObject; var Show: Boolean);
    Procedure ilID_CREDITOEjecuta(Sender: TObject);
    Procedure cbxID_CREDITOClick(Sender: TObject);
    Procedure btID_CREDITOClick(Sender: TObject);
    Procedure cbxF_RECEPCIONClick(Sender: TObject);
    Procedure edF_RECEPCION_INIChange(Sender: TObject);
    Procedure edF_RECEPCION_FINChange(Sender: TObject);
    Procedure cbxF_FACTURACIONClick(Sender: TObject);
    Procedure edF_FACTURACION_INIChange(Sender: TObject);
    Procedure edF_FACTURACION_FINChange(Sender: TObject);
    Procedure edF_LIQ_CLIENTE_INIChange(Sender: TObject);
    Procedure edF_LIQ_CLIENTE_FINChange(Sender: TObject);
    Procedure cbxF_LIQ_CLIENTEClick(Sender: TObject);
    Procedure btBuscaClick(Sender: TObject);
    Procedure sgcDATACalcRow(Sendet: TObject; DataSet: TDataSet;
      CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
    Procedure sgcDATADblClick(Sender: TObject);
    Procedure InterForma1DespuesShow(Sender: TObject);
    Procedure btFACTURARClick(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure btDEVOLVERClick(Sender: TObject);
    Procedure DisposicinSIEBAN1Click(Sender: TObject);
    procedure rgSITUACIONClick(Sender: TObject);
  Private
    { Private declarations }
        slSolCred: TStrings;
        Function  CadenaSql : String;
        Procedure MuestraDatos;
        Function Facturar(dContrato,dCredito,dImpNeto,dImpIVA : Double):Double;
        Function SolFact(dContrato,dCredito,dImpNeto,dImpIVA : Double):Double;
        Function ObtenIva(dContrato, dCredito, dMonto : Double):Double;
        Function CountSelecSinFact(sgcData : TSGCtrl; vlCol : String) : Integer;
        Function CountSelecDev(sgcData : TSGCtrl; vlCol : String) : Integer;
        Procedure GrabaID(dFactura:Double);
  Public
    { Public declarations }
      Objeto : TMSolFact;
  End;

 TMSolFact= Class(TInterFrame)
      Private
      Protected
      Public
        vgCredito        : String;
        { Public declarations }

        ParamCre                 : TParamCre;
        Disposicion              : TCrCredito;
        Acreditado               : TCrAcredit;
        Autorizacion             : TCrCto;
        DisposicionPaso          : TCrCredito;

        Function    InternalBusca : Boolean; Override;
        Constructor Create( AOwner : TComponent ); Override;
        Destructor  Destroy; Override;
        Function    ShowWindow(FormaTipo : TFormaTipo) : Integer; Override;
        Function    Reporte:Boolean; Override;
      Published
      End;

Implementation
{$R *.DFM}
Constructor TMSolFact.Create( AOwner : TComponent );
Begin Inherited;
   Disposicion := TCrCredito.Create(Self);
   Disposicion.MasterSource := Self;

   DisposicionPaso:=  TCrCredito.Create(Self);
   DisposicionPaso.MasterSource := Self;

   Acreditado := TCrAcredit.Create(Self);
   Acreditado.MasterSource := Self;

   Autorizacion := TCrCto.Create(Self);
   Autorizacion.MasterSource := Self;
End;


Destructor TMSolFact.Destroy;
Begin
   If Acreditado <> Nil Then
      Acreditado.Free;
   If Autorizacion <> Nil Then
      Autorizacion.Free;
   If Disposicion <> Nil Then
      Disposicion.Free;
   If DisposicionPaso <> Nil Then
      DisposicionPaso.Free;
   Inherited;
End;

Function TMSolFact.ShowWindow(FormaTipo:TFormaTipo):Integer;
Var W : TWMSolFact;
Begin
   W:=TWMSolFact.Create(Self);
   Try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftImprimir; //FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   Finally
      W.Free;
   End;
End;

Function TMSolFact.InternalBusca:Boolean;
Begin
End;

Function TMSolFact.Reporte:Boolean;
Begin
   Result := False;
End;


(***********************************************FORMA CR_PARAM_FACT********************)
(*                                                                              *)
(*  FORMA DE CR_PARAM_FACT                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_PARAM_FACT********************)

Function TwMSolFact.CadenaSql : String;
Var
   sSQL : String;
Begin
   sSQL :='';
   sSQL :=  ' SELECT CRE.ID_CONTRATO, '+
            '        CONTRATO.ID_TITULAR, '+
            '        PERSONA.NOMBRE TITULAR, '+
            '        CRE.ID_CREDITO, '+
            '        DISP.PCT_COMPARTIR PCT_COMP, '+
            '        DISP.IMP_SIEBAN, '+
            '        '' '' FACTURA, '+
            '        '' '' DEVUELVE, '+
            '        CRE.ID_CRED_EXTERNO NUM_FIRA, '+
            '        DECODE(DET.CVE_TIPO_COMPART,''IN'',0,''FI'',1,2) ORDEN, '+
            '        DECODE(DET.CVE_TIPO_COMPART,''IN'',''Inicio'',''FI'',''Final'','''') MOMENTO, '+
            '        DET.PCT_COMPARTIR PCT_SIEBAN_F, '+
            '        DET.IMP_COMPARTIR IMP_SIEBAN_F, '+
            '        FACT.F_PAGO F_RECEPCION, '+
            '        NVL(DISP.ID_FACTURA,0) FOLIO, '+
            '        FACT.NUM_FACTURA, '+
            '        DET.F_LIQ_CLIENTE F_DEVOLUCION, '+
            '        DET.SIT_DET_DISP_SIE SITUACION, '+
            '        CRE.SIT_CREDITO, '+
            '        DISP.ID_SOLICITUD, '+
            '        DISP.SIT_REL_DISP_SIE, '+
            '        DISP.F_ALTA, '+
            '        (DISP.PCT_COMPARTIR * DISP.IMP_SIEBAN /100)TOTAL_COMP '+
            '   FROM CR_CREDITO CRE, CR_REL_CTO_SIEB CTO, '+
            '        CR_REL_DISP_SIEB DISP, CR_DET_DISP_SIEB DET, CONTRATO , PERSONA, CF_FACTURA@CONT FACT '+
            '  WHERE CRE.ID_CONTRATO = CTO.ID_CONTRATO '+
            '    AND CRE.ID_CREDITO = DISP.ID_CREDITO '+
            '    AND DISP.ID_SOLICITUD = DET.ID_SOLICITUD '+
            '    AND CRE.ID_CONTRATO = CONTRATO.ID_CONTRATO '+
            '    AND CONTRATO.ID_TITULAR = PERSONA.ID_PERSONA '+
            '    AND DISP.SIT_REL_DISP_SIE <>''CA'''+
            '    AND CTO.SIT_REL_CTO_SIE =''AC'''+
            '    AND DET.SIT_DET_DISP_SIE <> ''CA'''+
            '    AND DISP.ID_FACTURA = FACT.ID_FACTURA(+)';

   If Trim(edID_ACREDITADO.Text)<>'' Then
      sSQL:= sSQL + ' AND CONTRATO.ID_TITULAR ='+ Trim(edID_ACREDITADO.Text);

   If Trim(edID_CONTRATO.Text)<>'' Then
      sSQL:= sSQL + ' AND CRE.ID_CONTRATO ='+ Trim(edID_CONTRATO.Text);

   If Trim(edID_CREDITO.Text)<>'' Then
      sSQL:= sSQL + ' AND CRE.ID_CREDITO ='+ Trim(edID_CREDITO.Text);

   If (Trim(edF_RECEPCION_INI.Text) <>'')And (Trim(edF_RECEPCION_FIN.Text) <>'') Then
      sSQL:= sSQL + ' AND DISP.F_FACTURACION BETWEEN TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(edF_RECEPCION_INI.Text))+
      ''',''DD/MM/YYYY'')  AND TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(edF_RECEPCION_FIN.Text))+
      ''',''DD/MM/YYYY'')';

   If (Trim(edF_FACTURACION_INI.Text) <>'')And (Trim(edF_FACTURACION_FIN.Text) <>'') Then
      sSQL:= sSQL + ' AND FACT.F_PAGO BETWEEN TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(edF_FACTURACION_INI.Text))+
      ''',''DD/MM/YYYY'')  AND TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(edF_FACTURACION_FIN.Text))+
      ''',''DD/MM/YYYY'')';

   If (Trim(edF_LIQ_CLIENTE_INI.Text) <>'')And (Trim(edF_LIQ_CLIENTE_FIN.Text) <>'') Then
      sSQL:= sSQL + ' AND DET.F_LIQ_CLIENTE BETWEEN TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(edF_LIQ_CLIENTE_INI.Text))+
      ''',''DD/MM/YYYY'')  AND TO_DATE('''+ FormatDateTime('DD/MM/YYYY',StrToDate(edF_LIQ_CLIENTE_FIN.Text))+
      ''',''DD/MM/YYYY'')';

   If rgSITUACION.ItemIndex=0 Then //No facturados
      sSQL:= sSQL + ' AND DET.SIT_DET_DISP_SIE = ''AC''';
   If rgSITUACION.ItemIndex=1 Then //Facturados no devueltos
      sSQL:= sSQL + ' AND DET.SIT_DET_DISP_SIE = ''FA''';
   If rgSITUACION.ItemIndex=2 Then //Facturados devueltos
      sSQL:= sSQL + ' AND DET.SIT_DET_DISP_SIE =''DV''';

   sSQL:= sSQL + ' ORDER BY PERSONA.NOMBRE , CRE.ID_CREDITO, DECODE(DET.CVE_TIPO_COMPART,''IN'',0,''FI'',1,2)';

   CadenaSql := sSQL;
End;

Procedure TwMSolFact.MuestraDatos;
Var
   vlQry : TQuery;
   sSQL :String;
   i:Integer;
   dFolio : Double;
Begin
   sSQL:= CadenaSql;
   If Trim(sSQL) <> '' Then Begin
      vlQry := GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
      Try
         If vlQry <> Nil Then Begin

            Objeto.vgCredito := '';

            vlQry.FieldByName('ID_CONTRATO').Visible := False;
            vlQry.FieldByName('ID_TITULAR').Visible := False;
            vlQry.FieldByName('TITULAR').Visible := False;
            vlQry.FieldByName('ID_CREDITO').Visible := False;
            vlQry.FieldByName('PCT_COMP').Visible := False;
            vlQry.FieldByName('IMP_SIEBAN').Visible := False;
            vlQry.FieldByName('ORDEN').Visible := False;
            vlQry.FieldByName('SIT_CREDITO').Visible := False;
            vlQry.FieldByName('ID_SOLICITUD').Visible := False;
            vlQry.FieldByName('SIT_REL_DISP_SIE').Visible := False;
            vlQry.FieldByName('F_ALTA').Visible := False;
            vlQry.FieldByName('TOTAL_COMP').Visible := False;

            vlQry.FieldByName('FACTURA').DisplayLabel  := 'FACTURA' + #30 +'>C';
            vlQry.FieldByName('DEVUELVE').DisplayLabel := 'DEVUELVE' + #30 +'>C';
            vlQry.FieldByName('NUM_FIRA').DisplayLabel  := 'NUM_FIRA' + #30 +'>C';
            vlQry.FieldByName('MOMENTO').DisplayLabel:= 'MOMENTO' + #30 +'>C';
            vlQry.FieldByName('PCT_SIEBAN_F').DisplayLabel  := 'PCT_SIEBAN_F' + #30 +'>C';
            vlQry.FieldByName('IMP_SIEBAN_F').DisplayLabel  := 'IMP_SIEBAN_F' + #30 +'>C';
            vlQry.FieldByName('F_RECEPCION').DisplayLabel  := 'F_RECEPCION' + #30 +'>C';
            vlQry.FieldByName('FOLIO').DisplayLabel  := 'FOLIO' + #30 +'>C';
            vlQry.FieldByName('NUM_FACTURA').DisplayLabel  := 'NUM_FACTURA' + #30 +'>C';
            vlQry.FieldByName('F_DEVOLUCION').DisplayLabel  := 'F_DEVOLUCION' + #30 +'>C';
            vlQry.FieldByName('SITUACION').DisplayLabel  := 'SITUACION' + #30 +'>C';

            vlQry.FieldByName('FACTURA').DisplayWidth  := 4;
            vlQry.FieldByName('DEVUELVE').DisplayWidth := 4;
            vlQry.FieldByName('NUM_FIRA').DisplayWidth  := 12;
            vlQry.FieldByName('MOMENTO').DisplayWidth:= 12;
            vlQry.FieldByName('PCT_SIEBAN_F').DisplayWidth  := 12;
            vlQry.FieldByName('IMP_SIEBAN_F').DisplayWidth  := 12;
            vlQry.FieldByName('F_RECEPCION').DisplayWidth  := 11;
            vlQry.FieldByName('FOLIO').DisplayWidth  := 11;
            vlQry.FieldByName('NUM_FACTURA').DisplayWidth  := 11;
            vlQry.FieldByName('F_DEVOLUCION').DisplayWidth  := 11;
            vlQry.FieldByName('SITUACION').DisplayWidth  := 4;

            sgcDATA.SG.Canvas.Font.Size := 5;
            TNumericField(vlQry.FieldByName('IMP_SIEBAN_F')).DisplayFormat := '###,###,###,###,###,###,##0.00';
            TNumericField(vlQry.FieldByName('PCT_SIEBAN_F')).DisplayFormat := '###,###,###,##0.0000';

            sgcDATA.AddQry( vlQry, True,True,-1,-1,-1,False);
            sgcDATA.ColumnByName('FACTURA').IsCheck := True;
            sgcDATA.ColumnByName('DEVUELVE').IsCheck := True;
         End Else Begin
           sgcDATA.Clear('NO SE ENCONTRARON DATOS'#30'>C');
         End;
      Finally
         If vlQry <> Nil Then
            vlQry.free;
      End;
   End;
   For i:=0 To sgcDATA.SG.RowCount Do Begin //FACTURADOS
      If (sgcDATA.CellStr['SITUACION',i]='FA')or
         (sgcDATA.CellStr['SITUACION',i]='DV')Then
         sgcDATA.CellStr['FACTURA',i] := 'SI' + #30 + '>C'
      Else
         sgcDATA.CellStr['FACTURA',i] := '';
   End;
   For i:=0 To sgcDATA.SG.RowCount Do Begin //DEVUELTOS
      If sgcDATA.CellStr['SITUACION',i]='DV' Then
         sgcDATA.CellStr['DEVUELVE',i] := 'SI' + #30 + '>C'
      Else
         sgcDATA.CellStr['DEVUELVE',i] := '';
   End;

End;

Procedure TwMSolFact.FormShow(SEnder: TObject);
Begin
   lbDEmpresa.Caption := Objeto.ParamCre.EMPRESA.AsString;
   lbDFecha.Caption   := Objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := Objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := Objeto.ParamCre.PERFIL.AsString;

   InterForma1.BtnImprimir.Visible:= False;
   InterForma1.BtnPreview.Visible:= False;

   Objeto.Disposicion.ID_CREDITO.Control := edID_CREDITO;
   Objeto.Disposicion.ContratoCre.Contrato.TITNombre.Control:= edNOM_CREDITO;
   Objeto.Disposicion.GetParams(Objeto);
   edNOM_CREDITO.Hint := Objeto.Disposicion.ContratoCre.Contrato.TITNombre.AsString;
   edNOM_CREDITO.ShowHint := True;

   Objeto.Acreditado.ID_ACREDITADO.Control := edID_ACREDITADO;
   Objeto.Acreditado.Persona.Nombre.Control := edNOM_ACREDITADO;
   Objeto.Acreditado.GetParams(Objeto);
   edNOM_ACREDITADO.Hint := Objeto.Acreditado.Persona.Nombre.AsString;
   edNOM_ACREDITADO.ShowHint := True;

   Objeto.Autorizacion.ID_CONTRATO.Control :=edID_CONTRATO;
   Objeto.Autorizacion.Producto.DESC_C_PRODUCTO.Control := edNOM_CONTRATO;
   Objeto.Autorizacion.GetParams(Objeto);
   edNOM_CONTRATO.Hint := Objeto.Autorizacion.Producto.DESC_C_PRODUCTO.AsString;
   edNOM_CONTRATO.ShowHint := True;

End;

Procedure TwMSolFact.FormDestroy(SEnder: TObject);
Begin
   Objeto.Disposicion.ID_CREDITO.Control := Nil;
   Objeto.Disposicion.ContratoCre.Contrato.TITNombre.Control:= Nil;
   Objeto.Acreditado.ID_ACREDITADO.Control := Nil;
   Objeto.Acreditado.Persona.Nombre.Control := Nil;
   Objeto.Autorizacion.ID_CONTRATO.Control :=Nil;
   Objeto.Autorizacion.Producto.DESC_C_PRODUCTO.Control := Nil;
   slSolCred.Free;
End;

Procedure TwMSolFact.FormClose(SEnder: TObject; Var Action: TCloseAction);
Begin
   Action := caFree;
End;

Procedure TwMSolFact.InterForma1Buscar(SEnder: TObject);
Begin
   If Objeto.Busca Then Begin
   End;
End;

Procedure TwMSolFact.cbxID_ACREDITADOClick(SEnder: TObject);
Begin
   If Not cbxID_ACREDITADO.Checked Then Begin
      Objeto.Acreditado.Active:=False;
      cbxID_ACREDITADO.Checked:=False;
      cbxID_ACREDITADO.Enabled:=False;
   End Else Begin
      cbxID_ACREDITADO.Checked:=True;
      cbxID_ACREDITADO.Enabled:=True;
   End;
End;

Procedure TwMSolFact.btID_ACREDITADOClick(SEnder: TObject);
Begin
   Objeto.Acreditado.ShowAll := True;
   If Objeto.Acreditado.Busca Then Begin
      cbxID_ACREDITADO.Checked:=True;
      cbxID_ACREDITADO.Enabled:=True;
      InterForma1.NextTab(edID_ACREDITADO);
   End;
End;

Procedure TwMSolFact.ilID_ACREDITADOEjecuta(SEnder: TObject);
Begin
   If Objeto.Acreditado.FindKey([ilID_ACREDITADO.Buffer]) Then Begin
      cbxID_ACREDITADO.Checked:=True;
      cbxID_ACREDITADO.Enabled:=True;
      InterForma1.NextTab(edID_ACREDITADO);
   End;
End;

Procedure TwMSolFact.ilID_ACREDITADOCapture(SEnder: TObject;
  Var Show: Boolean);
Begin
   Show:=True;
End;

Procedure TwMSolFact.btID_CONTRATOClick(SEnder: TObject);
Begin
   Objeto.Autorizacion.ShowAll := True;
   If Objeto.Autorizacion.Busca Then Begin
      If Objeto.Acreditado.FindKey([Objeto.Autorizacion.Acreditado.ID_ACREDITADO.AsString])Then Begin
         cbxID_ACREDITADO.Checked:=True;
         cbxID_ACREDITADO.Enabled:=True;
      End;
      cbxID_CONTRATO.Checked:=True;
      cbxID_CONTRATO.Enabled:=True;
      InterForma1.NextTab(edID_CONTRATO);
   End;
End;

Procedure TwMSolFact.ilID_CONTRATOEjecuta(SEnder: TObject);
Begin
   If Objeto.Autorizacion.FindKey([ilID_CONTRATO.Buffer,'1']) Then Begin
      If Objeto.Acreditado.FindKey([Objeto.Autorizacion.Acreditado.ID_ACREDITADO.AsString])Then Begin
         cbxID_ACREDITADO.Checked:=True;
         cbxID_ACREDITADO.Enabled:=True;
      End;
      cbxID_CONTRATO.Checked:=True;
      cbxID_CONTRATO.Enabled:=True;
      InterForma1.NextTab(edID_CONTRATO);
   End;
End;

Procedure TwMSolFact.ilID_CONTRATOCapture(SEnder: TObject;
  Var Show: Boolean);
Begin
   Show:=True;
End;

Procedure TwMSolFact.cbxID_CONTRATOClick(SEnder: TObject);
Begin
   If Not cbxID_CONTRATO.Checked Then Begin
      Objeto.Autorizacion.Active:=False;
      cbxID_CONTRATO.Checked:=False;
      cbxID_CONTRATO.Enabled:=False;
   End Else Begin
      Objeto.Autorizacion.Active:=True;   
      cbxID_CONTRATO.Checked:=True;
      cbxID_CONTRATO.Enabled:=True;
   End;
End;

Procedure TwMSolFact.ilID_CREDITOCapture(SEnder: TObject;
  Var Show: Boolean);
Begin
   Show:=True;
End;

Procedure TwMSolFact.ilID_CREDITOEjecuta(SEnder: TObject);
Begin
   If Objeto.Disposicion.FindKey([ilID_CREDITO.Buffer]) Then Begin
      cbxID_CREDITO.Checked:=True;
      cbxID_CREDITO.Enabled:=True;
      If Objeto.Autorizacion.FindKey([Objeto.Disposicion.ID_CONTRATO.AsString,'1'])Then Begin
         cbxID_CONTRATO.Checked:=True;
         cbxID_CONTRATO.Enabled:=True;
         If Objeto.Acreditado.FindKey([Objeto.Disposicion.ContratoCre.Contrato.ID_Titular.AsString])Then Begin
            cbxID_ACREDITADO.Checked:=True;
            cbxID_ACREDITADO.Enabled:=True;
         End;
      End;
      InterForma1.NextTab(edID_CREDITO);
   End;
End;

Procedure TwMSolFact.cbxID_CREDITOClick(SEnder: TObject);
Begin
   If not cbxID_CREDITO.Checked Then Begin
      Objeto.Disposicion.Active:=False;
      cbxID_CREDITO.Checked:=False;
      cbxID_CREDITO.Enabled:=False;
   End Else Begin
      Objeto.Disposicion.Active:=True;   
      cbxID_CREDITO.Checked:=True;
      cbxID_CREDITO.Enabled:=True;
   End;
End;

Procedure TwMSolFact.btID_CREDITOClick(SEnder: TObject);
Begin
   Objeto.Disposicion.ShowAll := True;
   If Objeto.Disposicion.Busca Then Begin
      cbxID_CREDITO.Checked:=True;
      cbxID_CREDITO.Enabled:=True;
      If Objeto.Autorizacion.FindKey([Objeto.Disposicion.ID_CONTRATO.AsString,'1'])Then Begin
         cbxID_CONTRATO.Checked:=True;
         cbxID_CONTRATO.Enabled:=True;
         If Objeto.Acreditado.FindKey([Objeto.Disposicion.ContratoCre.Contrato.ID_Titular.AsString])Then Begin
            cbxID_ACREDITADO.Checked:=True;
            cbxID_ACREDITADO.Enabled:=True;
         End;
      End;
      InterForma1.NextTab(edID_CREDITO);
   End;
End;

Procedure TwMSolFact.cbxF_RECEPCIONClick(SEnder: TObject);
Begin
   If not cbxF_RECEPCION.Checked Then Begin
      edF_RECEPCION_INI.Text:='';
      edF_RECEPCION_FIN.Text:='';
      cbxF_RECEPCION.Checked:=False;
      cbxF_RECEPCION.Enabled:=False;
   End;
End;

Procedure TwMSolFact.edF_RECEPCION_INIChange(SEnder: TObject);
Begin
   If Trim(edF_RECEPCION_INI.Text)<>'' Then Begin
      cbxF_RECEPCION.Checked:=True;
      cbxF_RECEPCION.Enabled:=True;
   End Else If Trim(edF_RECEPCION_FIN.Text)='' Then Begin
      cbxF_RECEPCION.Checked:=False;
      cbxF_RECEPCION.Enabled:=False;
   End;
End;

Procedure TwMSolFact.edF_RECEPCION_FINChange(SEnder: TObject);
Begin
   If Trim(edF_RECEPCION_FIN.Text)<>'' Then Begin
      cbxF_RECEPCION.Checked:=True;
      cbxF_RECEPCION.Enabled:=True;
   End Else If Trim(edF_RECEPCION_INI.Text)='' Then Begin
      cbxF_RECEPCION.Checked:=False;
      cbxF_RECEPCION.Enabled:=False;
   End;
End;

Procedure TwMSolFact.cbxF_FACTURACIONClick(SEnder: TObject);
Begin
   If not cbxF_FACTURACION.Checked Then Begin
      edF_FACTURACION_INI.Text:='';
      edF_FACTURACION_FIN.Text:='';
      cbxF_FACTURACION.Checked:=False;
      cbxF_FACTURACION.Enabled:=False;
   End;
End;

Procedure TwMSolFact.edF_FACTURACION_INIChange(SEnder: TObject);
Begin
   If Trim(edF_FACTURACION_INI.Text)<>'' Then Begin
      cbxF_FACTURACION.Checked:=True;
      cbxF_FACTURACION.Enabled:=True;
   End Else If Trim(edF_FACTURACION_FIN.Text)='' Then Begin
      cbxF_FACTURACION.Checked:=False;
      cbxF_FACTURACION.Enabled:=False;
   End;
End;

Procedure TwMSolFact.edF_FACTURACION_FINChange(SEnder: TObject);
Begin
   If Trim(edF_FACTURACION_FIN.Text)<>'' Then Begin
      cbxF_FACTURACION.Checked:=True;
      cbxF_FACTURACION.Enabled:=True;
   End Else If Trim(edF_FACTURACION_INI.Text)='' Then Begin
      cbxF_FACTURACION.Checked:=False;
      cbxF_FACTURACION.Enabled:=False;
   End;
End;

Procedure TwMSolFact.edF_LIQ_CLIENTE_INIChange(SEnder: TObject);
Begin
   If Trim(edF_LIQ_CLIENTE_INI.Text)<>'' Then Begin
      cbxF_LIQ_CLIENTE.Checked:=True;
      cbxF_LIQ_CLIENTE.Enabled:=True;
   End Else If Trim(edF_LIQ_CLIENTE_FIN.Text)='' Then Begin
      cbxF_LIQ_CLIENTE.Checked:=False;
      cbxF_LIQ_CLIENTE.Enabled:=False;
   End;
End;

Procedure TwMSolFact.edF_LIQ_CLIENTE_FINChange(SEnder: TObject);
Begin
   If Trim(edF_LIQ_CLIENTE_FIN.Text)<>'' Then Begin
      cbxF_LIQ_CLIENTE.Checked:=True;
      cbxF_LIQ_CLIENTE.Enabled:=True;
   End Else If Trim(edF_LIQ_CLIENTE_INI.Text)='' Then Begin
      cbxF_LIQ_CLIENTE.Checked:=False;
      cbxF_LIQ_CLIENTE.Enabled:=False;
   End;
End;

Procedure TwMSolFact.cbxF_LIQ_CLIENTEClick(SEnder: TObject);
Begin
   If not cbxF_LIQ_CLIENTE.Checked Then Begin
      edF_LIQ_CLIENTE_INI.Text:='';
      edF_LIQ_CLIENTE_FIN.Text:='';
      cbxF_LIQ_CLIENTE.Checked:=False;
      cbxF_LIQ_CLIENTE.Enabled:=False;
   End;
End;

Procedure TwMSolFact.btBuscaClick(SEnder: TObject);
Begin
   MuestraDatos;
End;

Procedure TwMSolFact.sgcDATACalcRow(SEndet: TObject; DataSet: TDataSet;
  CurrRow: Integer; RowCaso: TRowCaso; Var ShowRow: Boolean);
Begin
   If RowCaso = rcRowBegin Then Begin
      If Objeto.vgCredito <> DataSet.FieldByName('ID_CREDITO').AsString Then Begin
         Objeto.vgCredito := DataSet.FieldByName('ID_CREDITO').AsString;
         sgcDATA.AddTitle(DataSet.FieldByName('TITULAR').AsString, tcCenter);
         sgcDATA.AddTitle( 'Disposición : '+ DataSet.FieldByName('ID_CREDITO').AsString +
                           ',  Importe SIEBAN : '+ FormatFloat(Copy(kFtMoney,2,100),DataSet.FieldByName('IMP_SIEBAN').AsFloat) +
                           ',  %Total a compartir : '+ FormatFloat('###,###,##0.0000',DataSet.FieldByName('PCT_COMP').AsFloat) +
                           ',  Importe a compartir : '+ FormatFloat(Copy(kFtMoney,2,100),DataSet.FieldByName('TOTAL_COMP').AsFloat) ,
                           tcRight);
      End;
   End;
End;

Procedure TwMSolFact.sgcDATADblClick(SEnder: TObject);
Var
   Y : integer;
   Year, Month, Day, YearEmp, MonthEmp, DayEmp: Word;
   sSQL: String;
   qyQuery: TQuery;
   dFLiq, dFMAnt, dFHoy: TDateTime;
   Procedure MarcaFact(iRen: Integer);
   Begin
     If sgcDATA.CellStr['FACTURA',iRen] = 'SI' + #30 + '>C' Then Begin
        sgcDATA.CellStr['FACTURA',iRen]:= '';
     End Else Begin
        sgcDATA.CellStr['FACTURA',iRen]:= 'SI' + #30 + '>C';
     End;
   End;
   Procedure MarcaDev(iRen: Integer);
   Begin
     If sgcDATA.CellStr['DEVUELVE',iRen] = 'SI' + #30 + '>C' Then Begin
        sgcDATA.CellStr['DEVUELVE',iRen]:= '';
     End Else Begin
        sgcDATA.CellStr['DEVUELVE',iRen]:= 'SI' + #30 + '>C';
     End;
   End;
Begin
   Y := sgcDATA.SG.Row;
   If sgcDATA.SG.Selection.Left = 15 Then Begin
      If  sgcDATA.CellStr['SITUACION',Y] = 'AC'  Then Begin //NO FACTURADO
         MarcaFact(Y);
         If  sgcDATA.CellStr['ORDEN',Y] = '0'  Then
           MarcaFact(Y+1)
         Else
           MarcaFact(Y-1);

      End Else Begin
         If sgcDATA.CellStr['SITUACION',Y] = 'CA'  Then
            ShowMessage('El estímulo está cancelado')
         Else
            ShowMessage('El estímulo ya ha sido facturado');
      End;
   End Else If sgcDATA.SG.Selection.Left = 16  Then Begin
      If  sgcDATA.CellStr['SITUACION',Y] = 'FA'  Then Begin  // FACTURADO
         If  Trim(sgcDATA.CellStr['F_RECEPCION',Y]) <> ''  Then Begin  // LIQUIDADO POR FIRA
            If  sgcDATA.CellStr['ORDEN',Y] = '0'  Then Begin
               If (sgcDATA.CellStr['SITUACION',Y] <> 'DV') Then
                  If  (sgcDATA.CellStr['SIT_CREDITO',Y] = 'AC')or
                      (sgcDATA.CellStr['SIT_CREDITO',Y] = 'LQ')Then  //DISPOSICIÓN ACTIVA o LIQUIDADA
                     MarcaDev(Y)
                  Else
                     ShowMessage('La disposición debe estar autorizada');
            End Else Begin
               If (sgcDATA.CellStr['SITUACION',Y] <> 'DV') Then   Begin
                  sSQL:= 'SELECT SIT_DET_DISP_SIE FROM CR_DET_DISP_SIEB '+
                         ' WHERE ID_SOLICITUD='+ sgcDATA.CellStr['ID_SOLICITUD',Y]+
                         '   AND CVE_TIPO_COMPART=''IN''';
                  qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
                  If qyQuery <> Nil Then Begin
                     If qyQuery.FieldByName('SIT_DET_DISP_SIE').AsString = 'DV' Then Begin
                        If  sgcDATA.CellStr['SIT_CREDITO',Y] = 'LQ'  Then
                           MarcaDev(Y)
                        Else
                           ShowMessage('La disposición debe estar liquidada');
                     End Else
                        ShowMessage('Debe ser devuelto el importe inicial');
                     qyQuery.Free;
                  End;
               End;
            End;
         End Else Begin
            ShowMessage('El estímulo no ha sido liquidado por FIRA');
         End;
      End Else Begin
         ShowMessage('El estímulo no ha sido facturado');
      End;
   End;
End;

Procedure TwMSolFact.InterForma1DespuesShow(SEnder: TObject);
Begin
   edID_ACREDITADO.SetFocus;
End;

Procedure TwMSolFact.btFACTURARClick(SEnder: TObject);
Var
   nRow       : Integer;
   dImpSIEBAN, dContrato, dCredito, dImpIVA, dIVA, dNeto,
   dPctIVA, dIdFactura: Double;
Begin
   If CountSelecSinFact(sgcDATA,'FACTURA') > 0 Then Begin
      dImpSIEBAN:= 0;
      dImpIVA:=0;
      slSolCred.Clear;
      Merrores.Clear;
      If MessageDlg('¿Está seguro de Facturar ' +IntToStr(CountSelecSinFact(sgcDATA,'FACTURA')) + ' Estímulo(s)',
                     mtConfirmation, [mbYes, mbNo], 0) = mrYes Then Begin
         AddLine(MErrores,'====================================================');
         AddLine(MErrores,'***         INICIA PROCESO DE FACTURACIÓN        ***');
         AddLine(MErrores,'Hora inicio:' + TimeToStr(Time));

         If rgModoFact.ItemIndex = 0 Then Begin
            For nRow := 1 To sgcDATA.SG.RowCount - 1 Do Begin
               If (sgcDATA.CellStr['FACTURA',nRow] = 'SI' + #30 + '>C')And
                  (sgcDATA.CellStr['ORDEN',nRow] = '0') And
                  (sgcDATA.CellStr['FOLIO',nRow] = '0')Then Begin
                  Try
                     dContrato := StrToFloat(sgcDATA.CellStr['ID_CONTRATO',nRow]);
                     dCredito := StrToFloat(sgcDATA.CellStr['ID_CREDITO',nRow]);
                     dPctIVA:= ObtenIva(dContrato, dCredito, StrToFloat(sgcDATA.CellStr['IMP_SIEBAN',nRow]));
                     //dIVA := (dPctIVA/100)*StrToFloat(sgcDATA.CellStr['IMP_SIEBAN',nRow]);
                     dIVA := (dPctIVA/(100+dPctIVA))*StrToFloat(sgcDATA.CellStr['IMP_SIEBAN',nRow]);
                     dNeto := StrToFloat(sgcDATA.CellStr['IMP_SIEBAN',nRow]) - dIVA;
                     dImpSIEBAN := dImpSIEBAN + dNeto;
                     dImpIVA:= dImpIVA + dIVA;
                     slSolCred.Add(sgcDATA.CellStr['ID_SOLICITUD',nRow]+'='+sgcDATA.CellStr['ID_CREDITO',nRow]);
                  Except
                     dImpSIEBAN := dImpSIEBAN;
                     dImpIVA:= dImpIVA;
                  End;
               End;
            End;
            dIdFactura:= SolFact(dContrato,dCredito,dImpSIEBAN,dImpIVA);
            GrabaID(dIdFactura);
         End Else If rgModoFact.ItemIndex = 1 Then Begin
            For nRow := 1 To sgcDATA.SG.RowCount - 1 Do Begin
               If (sgcDATA.CellStr['FACTURA',nRow] = 'SI' + #30 + '>C')And
                  (sgcDATA.CellStr['ORDEN',nRow] = '0') And
                  (sgcDATA.CellStr['FOLIO',nRow] = '0')Then Begin
                  Try
                     dContrato := StrToFloat(sgcDATA.CellStr['ID_CONTRATO',nRow]);
                     dCredito := StrToFloat(sgcDATA.CellStr['ID_CREDITO',nRow]);
                     dPctIVA:= ObtenIva(dContrato, dCredito, StrToFloat(sgcDATA.CellStr['IMP_SIEBAN',nRow]));
                     //dIVA := (dPctIVA/100)*StrToFloat(sgcDATA.CellStr['IMP_SIEBAN',nRow]);
                     dIVA := (dPctIVA/(100+dPctIVA))*StrToFloat(sgcDATA.CellStr['IMP_SIEBAN',nRow]);
                     dNeto := StrToFloat(sgcDATA.CellStr['IMP_SIEBAN',nRow]) - dIVA;
                     dImpSIEBAN := dNeto;
                     dImpIVA:= dIVA;
                     slSolCred.Add(sgcDATA.CellStr['ID_SOLICITUD',nRow]+'='+sgcDATA.CellStr['ID_CREDITO',nRow]);
                  Except
                     dImpSIEBAN := dImpSIEBAN;
                     dImpIVA:= dImpIVA ;
                  End;
                  dIdFactura:= SolFact(dContrato,dCredito,dImpSIEBAN,dImpIVA);
                  GrabaID(dIdFactura);
               End;
            End;
         End;
         AddLine(MErrores,'Hora fin:' + TimeToStr(Time));
         AddLine(MErrores,'***        TERMINA PROCESO DE FACTURACIÓN        ***');
         AddLine(MErrores,'====================================================');
         MuestraDatos;
      End;
   End Else
      ShowMessage('Seleccione el o los registros a facturar');
End;

Function TwMSolFact.Facturar(dContrato,dCredito,dImpNeto,dImpIVA : Double):Double;
Var
   STPFacturar   : TStoredProc;
   vlError, sSQL : String;
   qyQuery : TQuery;
Begin
   sSQL:=' SELECT * FROM CR_PARAM_FACT WHERE CVE_PARAM_FACT =''CSIEBA''';
   qyQuery := GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName,False);
   If qyQuery <> Nil Then Begin

      STPFacturar := TStoredProc.Create(Self);
      Try
         With STPFacturar Do Begin
            STPFacturar.DatabaseName:= Objeto.Apli.DatabaseName;
            STPFacturar.SessionName:= Objeto.Apli.SessionName;
            STPFacturar.StoredProcName:='PKGFACTURA.STPINSFACTURA';
            Params.Clear;
            Params.CreateParam(ftFloat,'PE_ID_CLIENTE',ptInput);
            Params.CreateParam(ftFloat,'PE_ID_AREA_FACT',ptInput);
            Params.CreateParam(ftFloat,'PE_IMP_FACTURA',ptInput);
            Params.CreateParam(ftFloat,'PE_IMP_IVA_FACT',ptInput);
            Params.CreateParam(ftString,'PE_CVE_OPERACION',ptInput);
            Params.CreateParam(ftString,'PE_TX_FACTURA',ptInput);
            Params.CreateParam(ftString,'PE_TX_REFERENCIA',ptInput);
            Params.CreateParam(ftDateTime,'PE_F_ALTA',ptInput);
            Params.CreateParam(ftDateTime,'PE_F_PROG_PAGO',ptInput);
            Params.CreateParam(ftString,'PE_CVE_USUAR_ALTA',ptInput);
            Params.CreateParam(ftString,'PE_DESC_FISCAL',ptInput);
            Params.CreateParam(ftString,'PE_B_COMMIT',ptInput);
            Params.CreateParam(ftFloat,'PS_ID_FACTURA',ptOutput);
            Params.CreateParam(ftFloat,'PS_COD_RESP',ptOutput);
            Params.CreateParam(ftString,'PS_DESC_PROCESO',ptOutput);


            ParamByName('PE_ID_CLIENTE').AsFloat := qyQuery.FieldByName('ID_CLIENTE').AsFloat;
            ParamByName('PE_ID_AREA_FACT').AsFloat := qyQuery.FieldByName('ID_AREA_FACT').AsFloat;
            ParamByName('PE_IMP_FACTURA').AsFloat := dImpNeto;
            ParamByName('PE_IMP_IVA_FACT').AsFloat := dImpIVA;
            ParamByName('PE_CVE_OPERACION').AsString := qyQuery.FieldByName('CVE_OPERACION').AsString;
            ParamByName('PE_TX_FACTURA').AsString := qyQuery.FieldByName('TX_FACTURA').AsString;
            ParamByName('PE_TX_REFERENCIA').AsString := qyQuery.FieldByName('TX_REFERENCIA').AsString;
            ParamByName('PE_F_ALTA').AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
            ParamByName('PE_F_PROG_PAGO').AsDateTime := Objeto.Apli.DameFechaEmpresaDia('FMAN');
            ParamByName('PE_CVE_USUAR_ALTA').AsString := Objeto.Apli.Usuario;
            ParamByName('PE_DESC_FISCAL').AsString := qyQuery.FieldByName('DESC_FISCAL').AsString;
            ParamByName('PE_B_COMMIT').AsString := 'V';
            ExecProc;

            If (STPFacturar.ParamByName('PS_COD_RESP').AsInteger <>0) Then Begin
               Facturar:=0;
               vlError := 'PROBLEMAS AL OBTENER LA FACTURA: '+ STPFacturar.ParamByName('PS_DESC_PROCESO').AsString +
                          ' : '+  IntToStr(STPFacturar.ParamByName('PS_COD_RESP').AsInteger);
               AddLine(MErrores,vlError);
            End Else Begin
               Facturar:= STPFacturar.ParamByName('PS_ID_FACTURA').AsFloat;
            End;
         End;
      Finally
         STPFacturar.Free;
      End;
   End;
End;

Function TwMSolFact.SolFact(dContrato,dCredito,dImpNeto,dImpIVA : Double):Double;
Var
   STPFacturar   : TStoredProc;
   vlError, sSQL : String;
   qyQuery : TQuery;
Begin
   STPFacturar := TStoredProc.Create(Self);
   Try
      With STPFacturar Do Begin
         STPFacturar.DatabaseName:= Objeto.Apli.DatabaseName;
         STPFacturar.SessionName:= Objeto.Apli.SessionName;
         STPFacturar.StoredProcName:='PKGCRDOCUMENTACION.STPSOLFACTURA';
         Params.Clear;
         Params.CreateParam(ftFloat,'PE_ID_CONTRATO',ptInput);
         Params.CreateParam(ftFloat,'PE_ID_CREDITO',ptInput);
         Params.CreateParam(ftFloat,'PE_IMP_SIEBAN',ptInput);
         Params.CreateParam(ftFloat,'PE_IMP_IVA',ptInput);
         Params.CreateParam(ftDateTime,'PE_F_ALTA',ptInput);
         Params.CreateParam(ftString,'PE_CVE_USUARIO',ptInput);
         Params.CreateParam(ftFloat,'PE_ID_EMPRESA',ptInput);
         Params.CreateParam(ftFloat,'PS_ID_FACTURA',ptOutput);
         Params.CreateParam(ftFloat,'PS_RESULTADO',ptOutput);
         Params.CreateParam(ftString,'PS_TX_RESULTADO',ptOutput);


         ParamByName('PE_ID_CONTRATO').AsFloat := dContrato;
         ParamByName('PE_ID_CREDITO').AsFloat := dCredito;
         ParamByName('PE_IMP_SIEBAN').AsFloat := dImpNeto;
         ParamByName('PE_IMP_IVA').AsFloat := dImpIVA;
         ParamByName('PE_F_ALTA').AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
         ParamByName('PE_CVE_USUARIO').AsString := Objeto.Apli.Usuario;
         ParamByName('PE_ID_EMPRESA').AsFloat := Objeto.Apli.IdEmpresa;
         ExecProc;

         If (STPFacturar.ParamByName('PS_RESULTADO').AsInteger <>0) Then Begin
            SolFact:=0;
            vlError := 'PROBLEMAS AL OBTENER LA FACTURA: '+ STPFacturar.ParamByName('PS_TX_RESULTADO').AsString +
                       ' : '+  IntToStr(STPFacturar.ParamByName('PS_RESULTADO').AsInteger);
            AddLine(MErrores,vlError);
         End Else Begin
            SolFact:= STPFacturar.ParamByName('PS_ID_FACTURA').AsFloat;
         End;
      End;
   Finally
      STPFacturar.Free;
   End;
End;

Function TwMSolFact.ObtenIva(dContrato, dCredito, dMonto : Double):Double;
Var
   STP_IVA : TStoredProc;
   vlError : String;
Begin
   STP_IVA := TStoredProc.Create(Self);
   Try
      With STP_IVA Do Begin
         STP_IVA.DatabaseName:= Objeto.Apli.DatabaseName;
         STP_IVA.SessionName:= Objeto.Apli.SessionName;
         STP_IVA.StoredProcName:='PKGCRCOMUN.STPOBTENPCTIVA';
         Params.Clear;
         Params.CreateParam(ftFloat,'PEIDCONTRATO',ptInput);
         Params.CreateParam(ftFloat,'PEIDCREDITO',ptInput);
         Params.CreateParam(ftFloat,'PEMONTO',ptInput);
         Params.CreateParam(ftFloat,'PSPCTIVA',ptOutput);
         Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
         Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);

         ParamByName('PEIDCONTRATO').AsFloat := dContrato;
         ParamByName('PEIDCREDITO').AsFloat := dCredito;
         ParamByName('PEMONTO').AsFloat := dMonto;
         ExecProc;

         If (STP_IVA.ParamByName('PSRESULTADO').AsInteger <>0) Then Begin
            ObtenIva := 0;
            vlError := 'PROBLEMAS AL OBTENER EL PORCENTAJE DE IVA: '+ STP_IVA.ParamByName('PSTXRESULTADO').AsString +
                       ' : '+  IntToStr(STP_IVA.ParamByName('PSRESULTADO').AsInteger);
            AddLine(MErrores,vlError);
         End Else Begin
            ObtenIva := STP_IVA.ParamByName('PSPCTIVA').AsFloat;
         End;
      End;
   Finally
      STP_IVA.Free;
   End;
End;
Function TwMSolFact.CountSelecSinFact(sgcData : TSGCtrl; vlCol : String) : Integer;
Var count  : Integer;
    nRow   : Integer;
Begin
   count := 0;
   For nRow := 0 To sgcDATA.SG.RowCount - 1 Do
      If (sgcDATA.CellStr[vlCol,nRow] = 'SI' + #30 + '>C')And
         (sgcDATA.CellStr['FOLIO',nRow] = '0')And
         (sgcDATA.CellStr['ORDEN',nRow] = '0')Then
         count := count + 1;
   CountSelecSinFact := count;
End;

Function TwMSolFact.CountSelecDev(sgcData : TSGCtrl; vlCol : String) : Integer;
Var count  : Integer;
    nRow   : Integer;
Begin
   count := 0;
   For nRow := 0 To sgcDATA.SG.RowCount - 1 Do
      If (sgcDATA.CellStr[vlCol,nRow] = 'SI' + #30 + '>C')And
         (sgcDATA.CellStr['FOLIO',nRow] <> '0')And
         (sgcDATA.CellStr['SITUACION',nRow] <> 'DV')Then
         count := count + 1;
   CountSelecDev := count;
End;

Procedure TwMSolFact.FormCreate(SEnder: TObject);
Begin
   slSolCred := TStringList.Create;
End;

Procedure TwMSolFact.GrabaID(dFactura:Double);
Var
   sSQL : String;
   iReg : Integer;
   STP_CambiaSit : TStoredProc;
   vlError : String;
Begin
   If dFactura <> 0 Then
      For iReg := 0 To slSolCred.Count -1 Do Begin
         STP_CambiaSit := TStoredProc.Create(Self);
         Try
            With STP_CambiaSit Do Begin
               STP_CambiaSit.DatabaseName:= Objeto.Apli.DataBaseName;
               STP_CambiaSit.SessionName:= Objeto.Apli.SessionName;
               STP_CambiaSit.StoredProcName:='PKGCRDOCUMENTACION.STP_CAMBIASIT_SIEB';
               Params.Clear;
               Params.CreateParam(ftFloat,'PE_ID_SOLICITUD',ptInput);
               Params.CreateParam(ftFloat,'PE_ID_CREDITO',ptInput);
               Params.CreateParam(ftFloat,'PE_ID_FACTURA',ptInput);
               Params.CreateParam(ftDateTime,'PE_FECHA',ptInput);
               Params.CreateParam(ftString,'PE_SITUACION',ptInput);
               Params.CreateParam(ftString,'PE_TIPO',ptInput);
               Params.CreateParam(ftFloat,'PS_RESULTADO',ptOutput);
               Params.CreateParam(ftString,'PS_TX_RESULTADO',ptOutput);

               ParamByName('PE_ID_SOLICITUD').AsFloat := StrToFloat(slSolCred.Names[iReg]);
               ParamByName('PE_ID_CREDITO').AsFloat := StrToFloat(slSolCred.Values[slSolCred.Names[iReg]]);
               ParamByName('PE_ID_FACTURA').AsFloat := dFactura;
               ParamByName('PE_FECHA').AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
               ParamByName('PE_SITUACION').AsString := 'FA';
               ParamByName('PE_TIPO').AsString := '';

               ExecProc;

               If (STP_CambiaSit.ParamByName('PS_RESULTADO').AsInteger <>0) Then Begin
                  vlError := 'PROBLEMAS AL CAMBIAR DE SITUACIÓN : '+ STP_CambiaSit.ParamByName('PS_TX_RESULTADO').AsString +
                             ' : '+  IntToStr(STP_CambiaSit.ParamByName('PS_RESULTADO').AsInteger);
                  AddLine(MErrores,vlError);
               End;
            End;
         Finally
            STP_CambiaSit.Free;
         End;
      End;
End;

Procedure TwMSolFact.btDEVOLVERClick(SEnder: TObject);
Var
   nRow : Integer;
   sSQL : String;
   STP_CambiaSit : TStoredProc;
   vlError : String;
Begin
   If CountSelecDev(sgcDATA,'DEVUELVE') > 0 Then Begin
      Merrores.Clear;
      If MessageDlg('¿Está seguro de la Devolución de ' +IntToStr(CountSelecDev(sgcDATA,'DEVUELVE')) + ' Disposición(es)',
                     mtConfirmation, [mbYes, mbNo], 0) = mrYes Then Begin
         AddLine(MErrores,'====================================================');
         AddLine(MErrores,'***         INICIA PROCESO DE DEVOLUCIÓN         ***');
         AddLine(MErrores,'Hora inicio:' + TimeToStr(Time));

         For nRow := 1 To sgcDATA.SG.RowCount - 1 Do Begin
            If (sgcDATA.CellStr['DEVUELVE',nRow] = 'SI' + #30 + '>C')and
               (sgcDATA.CellStr['SITUACION',nRow] = 'DV')  Then Begin
               ShowMessage('El estímulo Ya ha sido devuelto');
            End Else Begin
               If (sgcDATA.CellStr['DEVUELVE',nRow] = 'SI' + #30 + '>C')and
                  (sgcDATA.CellStr['SITUACION',nRow] = 'FA')Then Begin

                  STP_CambiaSit := TStoredProc.Create(Self);
                  Try
                     With STP_CambiaSit Do Begin
                        STP_CambiaSit.DatabaseName:= Objeto.Apli.DataBaseName;
                        STP_CambiaSit.SessionName:= Objeto.Apli.SessionName;
                        STP_CambiaSit.StoredProcName:='PKGCRDOCUMENTACION.STP_CAMBIASIT_SIEB';
                        Params.Clear;
                        Params.CreateParam(ftFloat,'PE_ID_SOLICITUD',ptInput);
                        Params.CreateParam(ftFloat,'PE_ID_CREDITO',ptInput);
                        Params.CreateParam(ftFloat,'PE_ID_FACTURA',ptInput);
                        Params.CreateParam(ftDateTime,'PE_FECHA',ptInput);
                        Params.CreateParam(ftString,'PE_SITUACION',ptInput);
                        Params.CreateParam(ftString,'PE_TIPO',ptInput);
                        Params.CreateParam(ftFloat,'PS_RESULTADO',ptOutput);
                        Params.CreateParam(ftString,'PS_TX_RESULTADO',ptOutput);

                        ParamByName('PE_ID_SOLICITUD').AsFloat := StrToFloat(sgcDATA.CellStr['ID_SOLICITUD',nRow]);
                        ParamByName('PE_ID_CREDITO').AsFloat := StrToFloat(sgcDATA.CellStr['ID_CREDITO',nRow]);
                        ParamByName('PE_ID_FACTURA').AsFloat := 0;
                        ParamByName('PE_FECHA').AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
                        ParamByName('PE_SITUACION').AsString := 'DV';
                        If (sgcDATA.CellStr['ORDEN',nRow] = '0') Then
                           ParamByName('PE_TIPO').AsString := 'IN'
                        Else
                           ParamByName('PE_TIPO').AsString := 'FI';

                        ExecProc;

                        If (STP_CambiaSit.ParamByName('PS_RESULTADO').AsInteger <>0) Then Begin
                           vlError := 'PROBLEMAS AL CAMBIAR DE SITUACIÓN : '+ STP_CambiaSit.ParamByName('PS_TX_RESULTADO').AsString +
                                      ' : '+  IntToStr(STP_CambiaSit.ParamByName('PS_RESULTADO').AsInteger);
                           AddLine(MErrores,vlError);
                        End;
                     End;
                  Finally
                     STP_CambiaSit.Free;
                  End;
               End;
            End;
         End;
         AddLine(MErrores,'Hora fin:' + TimeToStr(Time));
         AddLine(MErrores,'***        TERMINA PROCESO DE DEVOLUCIÓN         ***');
         AddLine(MErrores,'====================================================');
         MuestraDatos;
      End;
   End Else
      ShowMessage('Seleccione el o los registros a devolver');
End;

Procedure TwMSolFact.DisposicinSIEBAN1Click(SEnder: TObject);
Var
   MDispSieb : TMDispSieb;
Begin
   If Trim(sgcDATA.CellStr['ID_CREDITO',sgcDATA.SG.Row])<>'' Then Begin
      If Objeto.DisposicionPaso.FindKey([sgcDATA.CellStr['ID_CREDITO',sgcDATA.SG.Row]])Then Begin
         MDispSieb := TMDispSieb.Create(self);
         Try
            MDispSieb.Apli :=Objeto.Apli;
            MDispSieb.ParamCre:=Objeto.ParamCre;
            MDispSieb.Disposicion := Objeto.DisposicionPaso;
            MDispSieb.FindKey([sgcDATA.CellStr['ID_SOLICITUD',sgcDATA.SG.Row],
                               sgcDATA.CellStr['ID_CREDITO',sgcDATA.SG.Row]]);
            MDispSieb.Catalogo;
         Finally
            MDispSieb.Free;
         End;
         MuestraDatos;
      End;
   End;
End;

procedure TwMSolFact.rgSITUACIONClick(Sender: TObject);
begin
   MuestraDatos;
end;

End.
