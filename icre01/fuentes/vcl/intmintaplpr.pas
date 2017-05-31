// Sistema         : Clase de MIntAplPr
// Fecha de Inicio : 06/03/2013
// Función forma   : Clase de MIntAplPr
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Juan F. Ortega FLores
// Comentarios     :
Unit IntMintaplpr;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
IntParamCre, IntLinkit, CheckLst,
IntCrAcredit,     //Acreditado
IntCrCredito,     //Disposición
IntCrCto,         //Linea/Contrato
IntMProdGpo,      //Gpo_Producto
IntMQrIntAplp,    //REPORTE
IntMQrIntAplC     //REPORTE s/columna  Faltante de Comis
;

Type
 TMintaplpr= class; 

  TWMintaplpr=Class(TForm)
    InterForma1             : TInterForma;
    lbAplica: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    sbExcel: TSpeedButton;
    Label6: TLabel;
    Label9: TLabel;
    Label4: TLabel;
    Label5: TLabel;
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
    edACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    chbxAcreditado: TCheckBox;
    chbxCESION: TCheckBox;
    edCESION: TEdit;
    btID_CESION: TBitBtn;
    edID_CESION: TEdit;
    edNbrArch: TEdit;
    cbxArchivo: TCheckBox;
    cbxCVE_PRODUCTO_GPO: TCheckBox;
    dtpFECHA: TInterDateTimePicker;
    edFECHA: TEdit;
    edID_CONTRATO: TEdit;
    btnCONTRATO: TBitBtn;
    edDESC_C_PRODUCTO: TEdit;
    chbxContrato: TCheckBox;
    cbCveGpoProd: TCheckListBox;
    cbGpoProducto: TCheckListBox;
    RGSitCred: TRadioGroup;
    ilACREDITADO: TInterLinkit;
    ilCesion: TInterLinkit;
    SaveDialog1: TSaveDialog;
    ilCONTRATO: TInterLinkit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure btnCONTRATOClick(Sender: TObject);
    procedure btID_CESIONClick(Sender: TObject);
    procedure ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure ilCONTRATOCapture(Sender: TObject; var Show: Boolean);
    procedure ilCONTRATOEjecuta(Sender: TObject);
    procedure ilCesionCapture(Sender: TObject; var Show: Boolean);
    procedure ilCesionEjecuta(Sender: TObject);
    procedure cbGpoProductoClick(Sender: TObject);
    procedure cbxCVE_PRODUCTO_GPOClick(Sender: TObject);
    procedure chbxAcreditadoClick(Sender: TObject);
    procedure chbxContratoClick(Sender: TObject);
    procedure chbxCESIONClick(Sender: TObject);
    procedure sbExcelClick(Sender: TObject);
    procedure cbxArchivoClick(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure edNbrArchChange(Sender: TObject);
    private
      Procedure ImprimeReporte(bPreview:Boolean); 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TMintaplpr;
    VlIndexGpoProd : Integer;    
end; 
 TMintaplpr= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
//        CAMPO1                   : TInterCampo;
        ParamCre          : TParamCre;
        Acreditado        : TCrAcredit;
        Credito           : TCrCredito;
        ContratoCre       : TCrCto;
        CVE_TIPO_REP      : TinterCampo;

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


constructor TMintaplpr.Create( AOwner : TComponent ); 
begin Inherited; 
      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource := Self;

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
      Credito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

      ContratoCre := TCrCto.Create(Self);
      ContratoCre.MasterSource:=Self;
      ContratoCre.FieldByName('ID_CONTRATO').MasterField:='ID_CONTRATO';

      CVE_TIPO_REP:=CreaCampo('CVE_TIPO_REP', ftString, tsNinguno, tsNinguno, True);
      CVE_TIPO_REP.Caption:= 'Tipo Reporte';


      StpName  := ' '; 
      UseQuery := False; 
      HelpFile := 'IntMintaplpr.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMintaplpr.Destroy;
begin
   If Acreditado <> Nil Then
      Acreditado.Free;
   If ContratoCre <> Nil then
      ContratoCre.Free;
   If Credito <> Nil Then
      Credito.Free;
inherited;
end;


function TMintaplpr.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMintaplpr;
begin
   W:=TWMintaplpr.Create(Self);
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


Function TMintaplpr.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('IMintapl.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TMintaplpr.Reporte:Boolean;
begin //Execute_Reporte(); 
end;


(***********************************************FORMA MIntAplPr********************)
(*                                                                              *)
(*  FORMA DE MIntAplPr                                                            *)
(*                                                                              *)
(***********************************************FORMA MIntAplPr********************)

procedure TWMintaplpr.FormShow(Sender: TObject);
var qyQuery: TQuery;
    sSQL: String;
begin
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

procedure TWMintaplpr.FormDestroy(Sender: TObject);
begin
    Objeto.Acreditado.ID_ACREDITADO.Control := nil;
    Objeto.Acreditado.Persona.Nombre.Control := nil;

    Objeto.ContratoCre.Producto.DESC_C_PRODUCTO.Control := nil;
    Objeto.ContratoCre.ID_CONTRATO.Control := nil;

    Objeto.Credito.ID_CREDITO.Control := nil;
    Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := nil ;
end;

procedure TWMintaplpr.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWMintaplpr.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWMintaplpr.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWMintaplpr.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWMintaplpr.btACREDITADOClick(Sender: TObject);
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

procedure TWMintaplpr.btnCONTRATOClick(Sender: TObject);
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

procedure TWMintaplpr.btID_CESIONClick(Sender: TObject);
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

procedure TWMintaplpr.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TWMintaplpr.ilACREDITADOEjecuta(Sender: TObject);
begin
    If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
    End;
end;

procedure TWMintaplpr.ilCONTRATOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True ;
end;

procedure TWMintaplpr.ilCONTRATOEjecuta(Sender: TObject);
begin
    If Objeto.ContratoCre.FindKey([ilCONTRATO.Buffer,1]) Then Begin
        chbxContrato.Checked:=True;
        chbxContrato.Enabled:=True;
        InterForma1.NextTab(edID_CONTRATO);
    End;
end;

procedure TWMintaplpr.ilCesionCapture(Sender: TObject; var Show: Boolean);
begin
   Show:=True;
end;

procedure TWMintaplpr.ilCesionEjecuta(Sender: TObject);
begin
    If Objeto.Credito.FindKey([ilCesion.Buffer]) Then Begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
        InterForma1.NextTab(edID_CESION);
    End;
end;

procedure TWMintaplpr.cbGpoProductoClick(Sender: TObject);
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

procedure TWMintaplpr.cbxCVE_PRODUCTO_GPOClick(Sender: TObject);
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

procedure TWMintaplpr.chbxAcreditadoClick(Sender: TObject);
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

procedure TWMintaplpr.chbxContratoClick(Sender: TObject);
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

procedure TWMintaplpr.cbxArchivoClick(Sender: TObject);
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

procedure TWMintaplpr.chbxCESIONClick(Sender: TObject);
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

procedure TWMintaplpr.sbExcelClick(Sender: TObject);
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

procedure TWMintaplpr.ImprimeReporte(bPreview: Boolean);
Var
    sSitPrem, sSitCred, sGpoProd:String;
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

    if Objeto.CVE_TIPO_REP.AsString = 'SC' then

    begin
    RepIntAplpr( edFECHA.Text,
                 sGpoProd,
                 edACREDITADO.Text,
                 edID_CONTRATO.Text,
                 edID_CESION.Text ,
                 sSitPrem,
                 sSitCred,
                 edNbrArch.Text,
                 Objeto.Apli,
                 bPreview);
    end
    else
    RepIntAplCc( edFECHA.Text,
                 sGpoProd,
                 edACREDITADO.Text,
                 edID_CONTRATO.Text,
                 edID_CESION.Text ,
                 sSitPrem,
                 sSitCred,
                 edNbrArch.Text,
                 Objeto.Apli,
                 bPreview);



    If Trim(edNbrArch.Text)<>'' Then Begin
       If bGenArch Then
         ShowMessage('El Archivo '+ Trim(edNbrArch.Text)+' se generó correctamente')
       Else
         ShowMessage('No se generó el Archivo')
    end;
end;

procedure TWMintaplpr.InterForma1BtnImprimirClick(Sender: TObject);
begin
if Objeto.ValidaAccesoEsp('TMINTAPLPR_IMPR',True,True) then // JFOF 13/03/2013 FUNCION DE SEGURIDADES
   ImprimeReporte(False);
end;

procedure TWMintaplpr.InterForma1BtnPreviewClick(Sender: TObject);
begin
if Objeto.ValidaAccesoEsp('TMINTAPLPR_PREV',True,True) then // JFOF 13/03/2013 FUNCION DE SEGURIDADES
   ImprimeReporte(True);
end;

procedure TWMintaplpr.edNbrArchChange(Sender: TObject);
begin
   If Trim(edNbrArch.Text)<>'' Then Begin
        cbxArchivo.Checked := True;
        cbxArchivo.Enabled := True;
    End Else Begin
        cbxArchivo.Checked := False;
        cbxArchivo.Enabled := False;
    End;
end;

end.
