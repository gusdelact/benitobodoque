// Sistema         : Clase de TMCtrlPre
// Fecha de Inicio : 27/02/2012
// Función forma   : Clase de TMCtrlPre
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Fernando Jimenez Rivera
// Comentarios     :
Unit IntMCtrlPre;    
interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,

//Unidades Adicionales
IntParamCre,
IntCrProduct,     //Producto de crédito
IntCrAcredit,     //Acreditado
IntCrCto,         // Linea/Contrato
IntCrCredito,     //Disposición
IntMQrCtrlPre,    //Reporte
IntMProdGpo, CheckLst      //Grupo de Producto
;

Type
 TMCtrlPre= class;

  TwMCtrlPre=Class(TForm)
    InterForma1             : TInterForma;
    lbAplica: TLabel;
    rgSitPrem: TRadioGroup;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    Label1: TLabel;
    edACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    ilACREDITADO: TInterLinkit;
    chbxAcreditado: TCheckBox;
    Label2: TLabel;
    chbxCESION: TCheckBox;
    edCESION: TEdit;
    btID_CESION: TBitBtn;
    edID_CESION: TEdit;
    ilCesion: TInterLinkit;
    sbExcel: TSpeedButton;
    Label6: TLabel;
    edNbrArch: TEdit;
    cbxArchivo: TCheckBox;
    SaveDialog1: TSaveDialog;
    Label9: TLabel;
    cbxCVE_PRODUCTO_GPO: TCheckBox;
    GBRango: TGroupBox;
    lbLiqF_INICIO: TLabel;
    edF_INICIO: TEdit;
    dtpF_INICIO: TInterDateTimePicker;
    Label3: TLabel;
    edF_FINAL: TEdit;
    dtpF_FINAL: TInterDateTimePicker;
    dtpFECHA: TInterDateTimePicker;
    edFECHA: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    edID_CONTRATO: TEdit;
    btnCONTRATO: TBitBtn;
    edDESC_C_PRODUCTO: TEdit;
    ilCONTRATO: TInterLinkit;
    chbxContrato: TCheckBox;
    ChBxFechas: TCheckBox;
    ChBxDetalle: TCheckBox;
    cbCveGpoProd: TCheckListBox;
    cbGpoProducto: TCheckListBox;
    RGSitCred: TRadioGroup;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    edF_INICIO_PREM: TEdit;
    dtpF_INICIO_PREM: TInterDateTimePicker;
    edF_FINAL_PREM: TEdit;
    dtpF_FINAL_PREM: TInterDateTimePicker;
    ChBxFechas_PREM: TCheckBox;
    ChBxTransCancel: TCheckBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure chbxAcreditadoClick(Sender: TObject);
    procedure edACREDITADOExit(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure edID_CESIONChange(Sender: TObject);
    procedure edID_CESIONExit(Sender: TObject);
    procedure btID_CESIONClick(Sender: TObject);
    procedure chbxCESIONClick(Sender: TObject);
    procedure ilCesionCapture(Sender: TObject; var Show: Boolean);
    procedure ilCesionEjecuta(Sender: TObject);
    procedure sbExcelClick(Sender: TObject);
    procedure edNbrArchChange(Sender: TObject);
    procedure cbxArchivoClick(Sender: TObject);
    procedure edID_CONTRATOExit(Sender: TObject);
    procedure btnCONTRATOClick(Sender: TObject);
    procedure ilCONTRATOCapture(Sender: TObject; var Show: Boolean);
    procedure ilCONTRATOEjecuta(Sender: TObject);
    procedure chbxContratoClick(Sender: TObject);
    procedure ChBxFechasClick(Sender: TObject);
    procedure btACREDITADOExit(Sender: TObject);
    procedure btnCONTRATOExit(Sender: TObject);
    procedure btID_CESIONExit(Sender: TObject);
    procedure cbxCVE_PRODUCTO_GPOClick(Sender: TObject);
    procedure cbGpoProductoClick(Sender: TObject);
    procedure edF_INICIOChange(Sender: TObject);
    procedure ChBxFechas_PREMClick(Sender: TObject);
    procedure edF_INICIO_PREMChange(Sender: TObject);
    private
    { Private declarations }
       Procedure ImprimeReporte(bPreview:Boolean);
       Procedure CambiaControl;
    public
    { Public declarations }
    Objeto : TMCtrlPre;
    VlIndexGpoProd : Integer;
end;
 TMCtrlPre= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
       public
        { Public declarations }
        Acreditado               : TCrAcredit;
        ContratoCre              : TCrCto;
        Credito                  : TCrCredito;//Disposición
        ParamCre                 : TParamCre;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

implementation
//Uses RepMon;

{$R *.DFM}


constructor TMCtrlPre.Create( AOwner : TComponent );
begin Inherited;
      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource := Self;

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
      Credito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

      ContratoCre := TCrCto.Create(Self);
      ContratoCre.MasterSource:=Self;
      ContratoCre.FieldByName('ID_CONTRATO').MasterField:='ID_CONTRATO';

      UseQuery := False;
      HelpFile := 'InTMCtrlPre.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMCtrlPre.Destroy;
begin
   If Acreditado <> Nil Then
      Acreditado.Free;
   If ContratoCre <> Nil then
      ContratoCre.Free;
   If Credito <> Nil Then
      Credito.Free;
   inherited;
end;


function TMCtrlPre.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMCtrlPre;
begin
   W:=TwMCtrlPre.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftImprimir; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TMCtrlPre.InternalBusca:Boolean;
begin InternalBusca := False;

end;

function TMCtrlPre.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA NINGUNO********************)
(*                                                                              *)
(*  FORMA DE NINGUNO                                                            *)
(*                                                                              *)
(***********************************************FORMA NINGUNO********************)

procedure TwMCtrlPre.FormShow(Sender: TObject);
var qyQuery: TQuery;
    sSQL: String;
begin
      //PINTA DATOS DEL PANEL INFERIOR
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      dtpFECHA.DateTime:= Objeto.Apli.DameFechaEmpresa;
      edFECHA.text:=FormatDateTime('dd/mm/yyyy',dtpFECHA.DateTime);

      Objeto.Acreditado.ID_ACREDITADO.Control := edACREDITADO;
      Objeto.Acreditado.Persona.Nombre.Control := edNOMBRE_ACRED;
      Objeto.GetParams(Objeto);
      edNOMBRE_ACRED.Hint := Objeto.Acreditado.Persona.Nombre.AsString;
      edNOMBRE_ACRED.ShowHint := True;

      Objeto.ContratoCre.ID_CONTRATO.Control := edID_CONTRATO ;
      Objeto.ContratoCre.Producto.DESC_C_PRODUCTO.Control:= edDESC_C_PRODUCTO ;
      Objeto.GetParams(Objeto);
      edDESC_C_PRODUCTO.Hint := Objeto.ContratoCre.Producto.DESC_C_PRODUCTO.AsString ;
      edDESC_C_PRODUCTO.ShowHint := True ;

      Objeto.Credito.ID_CREDITO.Control := edID_CESION;
      Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := edCESION;
      Objeto.Credito.GetParams(Objeto);
      edCESION.Hint := Objeto.Credito.ContratoCre.Contrato.TITNombre.AsString;
      edCESION.ShowHint := True;

      sSQL := ' SELECT CVE_PRODUCTO_GPO, CVE_PRODUCTO_GPO || '' - '' || DESC_L_PROD_GPO AS CVE_PRO_GPO_DES FROM CR_PRODUCTO_GPO '+
              ' WHERE CVE_PRODUCTO_GPO IN (SELECT CR_PRODUCTO.CVE_PRODUCTO_GPO FROM CR_PRODUCTO WHERE B_CONSULTA_DOC = ''F'' '+
              ' AND SIT_PRODUCTO = ''AC'' AND ID_EMPRESA = ' + IntToStr(Objeto.Apli.IdEmpresa) +') '+
              ' ORDER BY CVE_PRODUCTO_GPO ';
      qyQuery:= GetSQLQuery(sSQL, Objeto.DataBaseName, Objeto.SessionName, False);
      Try
         If qyQuery <> Nil Then
         begin
           While not(qyQuery.Eof) do
              begin
                 VlIndexGpoProd := cbGpoProducto.Items.Add(qyQuery.FieldByName('CVE_PRO_GPO_DES').AsString);
                 cbCveGpoProd.Items.Add(qyQuery.FieldByName('CVE_PRODUCTO_GPO').AsString);
                 qyQuery.Next;
              end;
         end;
      Finally
         qyQuery.Free;
      End;
end;

procedure TwMCtrlPre.FormDestroy(Sender: TObject);
begin
    Objeto.Acreditado.ID_ACREDITADO.Control := nil;
    Objeto.Acreditado.Persona.Nombre.Control := nil;
    Objeto.ContratoCre.Producto.DESC_C_PRODUCTO.Control := nil;
    Objeto.ContratoCre.ID_CONTRATO.Control := nil;
    Objeto.Credito.ID_CREDITO.Control := nil;
    Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := nil ;
end;

procedure TwMCtrlPre.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMCtrlPre.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TwMCtrlPre.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWNinguno.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


procedure TwMCtrlPre.InterForma1BtnPreviewClick(Sender: TObject);
begin
if Objeto.ValidaAccesoEsp('TMCTRLPRE_PREV',True,True) then // JFOF 13/03/2013 FUNCION DE SEGURIDADES
   ImprimeReporte(True);
end;

procedure TwMCtrlPre.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TwMCtrlPre.ilACREDITADOEjecuta(Sender: TObject);
begin
    If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
    End;
end;

procedure TwMCtrlPre.btACREDITADOClick(Sender: TObject);
var Cadena : String ;
begin
   Cadena:= ' SELECT DISTINCT CONTRATO.ID_TITULAR  '+
            ' FROM CONTRATO , CR_CREDITO , CR_PPO_PREMIO  '+
            ' WHERE CONTRATO.ID_CONTRATO = CR_CREDITO.ID_CONTRATO AND CR_CREDITO.ID_CREDITO = CR_PPO_PREMIO.ID_CREDITO ';
   Objeto.Acreditado.Persona.BuscaWhereString:= ' PERSONA.ID_PERSONA IN ('+Cadena+') ' ;
   Objeto.Acreditado.Persona.FilterString := Objeto.Acreditado.Persona.BuscaWhereString ;
   Objeto.Acreditado.ShowAll := True;
   If Objeto.Acreditado.Busca Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
   End;
end;

procedure TwMCtrlPre.chbxAcreditadoClick(Sender: TObject);
begin
    If not chbxAcreditado.Checked Then Begin
        Objeto.Acreditado.Active:=False;
        chbxAcreditado.Checked:=False;
        chbxAcreditado.Enabled:=False;
        Objeto.ContratoCre.BuscaWhereString := '';
        Objeto.ContratoCre.FilterString := '';
    End Else Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
    End;
end;

procedure TwMCtrlPre.edACREDITADOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edACREDITADO,True,'',True);
end;


Procedure TwMCtrlPre.ImprimeReporte(bPreview:Boolean);
Var
    sSitPrem, sSitCred, sGpoProd, FechaBuscaSaldos:String;
    VlIndex: Integer;
    VlPrimero: Boolean;
begin
    case rgSitPrem.ItemIndex of
        0: sSitPrem:='AC';  //Activos
        1: sSitPrem:='CA';  //Cancelados
        2: sSitPrem:='LQ';  //Liquidado
        3: sSitPrem:='';   // Todos
    end;

    case rgSitCred.ItemIndex of
        0: sSitCred:=' = ''AC'' ';  //Autorizados
        1: sSitCred:=' = ''LQ'' ' ;  //Liquidados
        2: sSitCred:=' <> ''CA'' ';  //Todos, menos los cancelados
    end;

    for VlIndex := 0 to VlIndexGpoProd do
    begin
       CBCveGpoProd.Checked[VlIndex] := cbGpoProducto.Checked[VlIndex];
    end;

    sGpoProd:= '(''A''';
    for VlIndex := 0 to VlIndexGpoProd do
    begin
      if cbCveGpoProd.Checked[VlIndex] then
         sGpoProd := sGpoProd + ', '+''''+cbCveGpoProd.Items.Strings[VlIndex]+''''
    end;
    sGpoProd:= sGpoProd + ')';

    If sGpoProd = '(''A'')' then
       sGpoProd := '';

    If dtpFECHA.Date = Objeto.Apli.DameFechaEmpresa  then
       FechaBuscaSaldos:= DateToStr(dtpFECHA.Date - 1 )
    Else
       FechaBuscaSaldos := DateToStr(dtpFECHA.Date) ;

    { Procedimiento de reporte. Se activara una vez definido el mismo}
    RepControlPremios( edF_INICIO.Text,
                       edF_FINAL.Text,
                       edFECHA.Text,
                       FechaBuscaSaldos,
                       edACREDITADO.Text,
                       edID_CONTRATO.Text,
                       edID_CESION.Text ,
                       sSitPrem,
                       sSitCred,
                       edNbrArch.Text,
                       sGpoProd,
                       edF_INICIO_PREM.Text,
                       edF_FINAL_PREM.Text,
                       Objeto.Apli,
                       bPreview,
                       ChBxDetalle.Checked,
                       ChBxTransCancel.Checked);

    If Trim(edNbrArch.Text)<>'' Then Begin
       If bGenArch Then
         ShowMessage('El Archivo '+ Trim(edNbrArch.Text)+' se generó correctamente')
       Else
         ShowMessage('No se generó el Archivo')
    End;
End;
procedure TwMCtrlPre.InterForma1BtnImprimirClick(Sender: TObject);
begin
if Objeto.ValidaAccesoEsp('TMCTRLPRE_IMPR',True,True) then // JFOF 13/03/2013 FUNCION DE SEGURIDADES
   ImprimeReporte(False);
end;

procedure TwMCtrlPre.edID_CESIONChange(Sender: TObject);
begin
    If Trim(edID_CESION.Text)<>'' Then Begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
    End Else Begin
        chbxCESION.Checked:=False;
        chbxCESION.Enabled:=False;
    End;
end;

procedure TwMCtrlPre.edID_CESIONExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edID_CESION,True,'',True);
end;

procedure TwMCtrlPre.btID_CESIONClick(Sender: TObject);
var Cadena: String ;
begin
   Cadena:= ' SELECT DISTINCT CR_CREDITO.ID_CONTRATO  '+
            ' FROM CONTRATO , CR_CREDITO , CR_PPO_PREMIO  '+
            ' WHERE CONTRATO.ID_CONTRATO = CR_CREDITO.ID_CONTRATO AND CR_CREDITO.ID_CREDITO = CR_PPO_PREMIO.ID_CREDITO ';
   If chbxACREDITADO.Checked then
      begin
         Cadena := Cadena + ' AND CONTRATO.ID_TITULAR = '+Objeto.Acreditado.ID_ACREDITADO.AsString+' ' ;
      end ;

   If chbxContrato.Checked then
      begin
         Cadena := Cadena + ' AND CR_CREDITO.ID_CONTRATO = '+Objeto.ContratoCre.ID_CONTRATO.AsString+' ' ;
      end ;

   Objeto.Credito.BuscaWhereString:= ' CR_CREDITO.ID_CONTRATO IN ( '+Cadena+') ' ;
   Objeto.Credito.FilterString:= Objeto.Credito.BuscaWhereString ;
   Objeto.Credito.ShowAll := True;
   if Objeto.Credito.Busca then begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
        InterForma1.NextTab(edID_CESION);
   End;
end;

procedure TwMCtrlPre.chbxCESIONClick(Sender: TObject);
begin
    If not chbxCESION.Checked Then Begin
        Objeto.Credito.Active:=False;
        chbxCESION.Checked:=False;
        chbxCESION.Enabled:=False;
    End Else Begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
    End;
end;

procedure TwMCtrlPre.ilCesionCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMCtrlPre.ilCesionEjecuta(Sender: TObject);
begin
    If Objeto.Credito.FindKey([ilCesion.Buffer]) Then Begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
        InterForma1.NextTab(edID_CESION);
    End;
end;


procedure TwMCtrlPre.sbExcelClick(Sender: TObject);
var sExt:String;
begin
  If SaveDialog1.Execute Then Begin
     sExt:= copy(SaveDialog1.FileName,Length(SaveDialog1.FileName)-3,Length(SaveDialog1.FileName));
     If UpperCase(sExt)= '.PRN' Then
        edNbrArch.Text := SaveDialog1.FileName
     Else
        edNbrArch.Text := SaveDialog1.FileName + '.prn';
  End
  Else
     edNbrArch.Text := '';
end;

procedure TwMCtrlPre.edNbrArchChange(Sender: TObject);
begin
    If Trim(edNbrArch.Text)<>'' Then Begin
        cbxArchivo.Checked:=True;
        cbxArchivo.Enabled:=True;
    End Else Begin
        cbxArchivo.Checked:=False;
        cbxArchivo.Enabled:=False;
    End;
end;

procedure TwMCtrlPre.cbxArchivoClick(Sender: TObject);
begin
    If not cbxArchivo.Checked Then Begin
        edNbrArch.Text:= '';
        cbxArchivo.Checked:=False;
        cbxArchivo.Enabled:=False;
    End Else Begin
        cbxArchivo.Checked:=True;
        cbxArchivo.Enabled:=True;
    End;
end;

Procedure TwMCtrlPre.CambiaControl;
Begin
   cbxCVE_PRODUCTO_GPO.Checked:=True;
   cbxCVE_PRODUCTO_GPO.Enabled:=True;
End;

procedure TwMCtrlPre.edID_CONTRATOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edID_CONTRATO, True, '', True) ;
end;

procedure TwMCtrlPre.btnCONTRATOClick(Sender: TObject);
var Cadena: String ;
begin
   Cadena:= ' SELECT DISTINCT CONTRATO.ID_CONTRATO  '+
            ' FROM CONTRATO , CR_CREDITO , CR_PPO_PREMIO  '+
            ' WHERE CONTRATO.ID_CONTRATO = CR_CREDITO.ID_CONTRATO AND CR_CREDITO.ID_CREDITO = CR_PPO_PREMIO.ID_CREDITO ';
   If chbxACREDITADO.Checked then
      begin
         Cadena := Cadena + ' AND CONTRATO.ID_TITULAR = '+Objeto.Acreditado.ID_ACREDITADO.AsString+' ' ;
      end ;
   Objeto.ContratoCre.BuscaWhereString := ' CR_CONTRATO.ID_CONTRATO IN ('+Cadena+') ';
   Objeto.ContratoCre.FilterString:= Objeto.ContratoCre.BuscaWhereString ;
   Objeto.ContratoCre.ShowAll := True;
   if Objeto.ContratoCre.Busca then begin
        chbxContrato.Checked:=True;
        chbxContrato.Enabled:=True;
        InterForma1.NextTab(edID_CONTRATO);
   End;
end;

procedure TwMCtrlPre.ilCONTRATOCapture(Sender: TObject; var Show: Boolean);
begin
   Show := True ;
end;

procedure TwMCtrlPre.ilCONTRATOEjecuta(Sender: TObject);
begin
    If Objeto.ContratoCre.FindKey([ilCONTRATO.Buffer,1]) Then Begin
        chbxContrato.Checked:=True;
        chbxContrato.Enabled:=True;
        InterForma1.NextTab(edID_CONTRATO);
    End;
end;

procedure TwMCtrlPre.chbxContratoClick(Sender: TObject);
begin
    If not chbxContrato.Checked Then Begin
        Objeto.ContratoCre.Active:=False;
        chbxContrato.Checked:=False;
        chbxContrato.Enabled:=False;
        Objeto.Credito.BuscaWhereString := '';
        Objeto.Credito.FilterString := '';
    End Else Begin
        chbxContrato.Checked:=True;
        chbxContrato.Enabled:=True;
    End;

end;

procedure TwMCtrlPre.ChBxFechasClick(Sender: TObject);
begin
   if not(ChBxFechas.Checked) then
      begin
         edF_INICIO.Text := '' ;
         edF_FINAL.Text := '' ;
      end ;
   ChBxFechas.Enabled := ChBxFechas.Checked;
end;

procedure TwMCtrlPre.btACREDITADOExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edACREDITADO,True,'',True);
end;

procedure TwMCtrlPre.btnCONTRATOExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edID_CONTRATO,True,'',True);
end;

procedure TwMCtrlPre.btID_CESIONExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edID_CESION,True,'',True);
end;

procedure TwMCtrlPre.cbxCVE_PRODUCTO_GPOClick(Sender: TObject);
var VlIndex: Integer;
begin
   if not (cbxCVE_PRODUCTO_GPO.Checked) then
      begin
        for VlIndex := 0 to VlIndexGpoProd do
           begin
             cbGpoProducto.Checked[VlIndex] :=  cbxCVE_PRODUCTO_GPO.Checked;
           end ;
       cbxCVE_PRODUCTO_GPO.Enabled := cbxCVE_PRODUCTO_GPO.Checked;
      end;
end;

procedure TwMCtrlPre.cbGpoProductoClick(Sender: TObject);
var VlIndex, c: Integer;
begin
  c:= 0;
  for VlIndex := 0 to VlIndexGpoProd do
  begin
      if cbGpoProducto.Checked[VlIndex] = true then
         Inc(c);
  end ;
  cbxCVE_PRODUCTO_GPO.Enabled := (c>=1);
  cbxCVE_PRODUCTO_GPO.Checked := cbxCVE_PRODUCTO_GPO.Enabled;
end;

procedure TwMCtrlPre.edF_INICIOChange(Sender: TObject);
begin
   ChBxFechas.Checked:=  (edF_INICIO.Text<> '') and (edF_FINAL.Text <> '');
   ChBxFechas.Enabled:= ChBxFechas.Checked;
end;

procedure TwMCtrlPre.ChBxFechas_PREMClick(Sender: TObject);
begin
   if not(ChBxFechas_PREM.Checked) then
      begin
         edF_INICIO_PREM.Text := '' ;
         edF_FINAL_PREM.Text := '' ;
      end ;
   ChBxFechas_PREM.Enabled := ChBxFechas_PREM.Checked;

end;

procedure TwMCtrlPre.edF_INICIO_PREMChange(Sender: TObject);
begin
   ChBxFechas_PREM.Checked:=  (edF_INICIO_PREM.Text<> '') and (edF_FINAL_PREM.Text <> '');
   ChBxFechas_PREM.Enabled:= ChBxFechas_PREM.Checked;

end;

end.

