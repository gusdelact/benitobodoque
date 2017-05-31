// Sistema         :
// Fecha de Inicio :
// Función forma   :
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMCrCobCom;

interface
                         
uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,InterEdit,

IntParamCre,      //Parámetros Crédito
IntPers,     //Acreditado
IntQrCobCom,      //Reporte  : Comisiones Cobradas
IntMQrCtrlConc,   // AARJ 14 julio 2010, se agregó el siguiente Reporte : Control de Conceptos
                  // ver cambios en: ImprimeReporte
                  // Este reporte puede generar archivos en excel por lo que se implementaron cambios
                  // en sbExcelClick
Intempre,         //Empresa
IntUnNeg,         //Unidad Negocio/Suc
IntCrCatComi, CheckLst
;


Type
 TMCrCobCom= class;

  TwMCrCobCom=Class(TForm)
    InterForma1             : TInterForma;
    lbAplica: TLabel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    Label2: TLabel;
    edID_ACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    ilACREDITADO: TInterLinkit;
    chbxAcreditado: TCheckBox;
    GroupBox1: TGroupBox;
    gbControl: TGroupBox;
    Label8: TLabel;
    lbICveRequisito: TLabel;
    EdIDSucursal: TEdit;
    BBSucursal: TBitBtn;
    EdDescSucursal: TEdit;
    CBSucursal: TCheckBox;
    EdIdEmpresa: TEdit;
    bbEmpresa: TBitBtn;
    edNombreEmpresa: TEdit;
    ilEmpresa: TInterLinkit;
    ILSucursal: TInterLinkit;
    edCVE_COMISION: TEdit;
    btCVE_COMISION: TBitBtn;
    Label3: TLabel;
    edDESC_COMISION: TEdit;
    cbxCOMISION: TCheckBox;
    ilCOMISION: TInterLinkit;
    lbLiqF_INICIO: TLabel;
    edF_Ini: TEdit;
    dtpF_Ini: TInterDateTimePicker;
    Label1: TLabel;
    edF_Fin: TEdit;
    dtpF_Fin: TInterDateTimePicker;
    chbxFVencimiento: TCheckBox;
    rgSituacion: TRadioGroup;
    cbxCUOTA_FEGA: TCheckBox;
    SaveDialog1: TSaveDialog;
    Label7: TLabel;
    sbExcel: TSpeedButton;
    edNbrArch: TEdit;
    cbxArchivo: TCheckBox;
    cbRESUMEN: TCheckBox;
    Label6: TLabel;
    btCVE_PRODUCTO_CRE: TBitBtn;
    edCVE_PRODUCTO_CRE: TEdit;
    Label10: TLabel;
    btGpoProd: TBitBtn;
    edGpoProd: TEdit;
    edDESC_PRODUCTO_CRE: TEdit;
    edNomGpoProd: TEdit;
    cbPRODUCTO_CRE: TCheckBox;
    chbxGpoProd: TCheckBox;
    Label5: TLabel;
    btID_CREDITO: TBitBtn;
    edID_CREDITO: TEdit;
    edDESC_ID_CREDITO: TEdit;
    cbID_CREDITO: TCheckBox;
    cbPRODUCTO: TCheckBox;
    cbSUCURSALES: TCheckBox;
    rgTipoReporte: TRadioGroup;
    Rinfmost: TRadioGroup;
    CBCVE_COM: TCheckListBox;
    CBDESC_COM: TCheckListBox;
    cbxDifComis: TCheckBox;
    Label4: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure chbxAcreditadoClick(Sender: TObject);
    procedure bbEmpresaClick(Sender: TObject);
    procedure BBSucursalClick(Sender: TObject);
    procedure ilEmpresaEjecuta(Sender: TObject);
    procedure ILSucursalEjecuta(Sender: TObject);
    procedure CBSucursalClick(Sender: TObject);
    procedure chbxFVencimientoClick(Sender: TObject);
    procedure btCVE_COMISIONClick(Sender: TObject);
    procedure ilCOMISIONEjecuta(Sender: TObject);
    procedure cbxCOMISIONClick(Sender: TObject);
    procedure ilCOMISIONCapture(Sender: TObject; var Show: Boolean);
    procedure sbExcelClick(Sender: TObject);
    procedure cbxArchivoClick(Sender: TObject);
    procedure btCVE_PRODUCTO_CREClick(Sender: TObject);
    procedure btGpoProdClick(Sender: TObject);
    procedure btID_CREDITOClick(Sender: TObject);
    procedure cbPRODUCTO_CREClick(Sender: TObject);
    procedure chbxGpoProdClick(Sender: TObject);
    procedure cbID_CREDITOClick(Sender: TObject);
    procedure CBDESC_COMClick(Sender: TObject);
    procedure cbxDifComisClick(Sender: TObject);
    private
    { Private declarations }
     procedure EnableCheckBox(var CheckBox : TCheckBox);
     procedure ImprimeReporte(bPreview : Boolean);
     Procedure AsignaEmpresaSuc;
    public
    { Public declarations }
    Objeto : TMCrCobCom;
    VlIndexProd : Integer; 
    end;

 TMCrCobCom= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }

        ID_ACREDITADO           : TInterCampo;
        CVE_PRODUCTO_CRE        : TInterCampo;
        DESC_PRODUCTO           : TInterCampo;
        CVE_PRODUCTO_GPO        : TInterCampo;
        DESC_PRODUCTO_GPO       : TInterCampo;
        ID_CREDITO              : TInterCampo;
        NOMBRE_ACRED            : TInterCampo;

        ParamCre                : TParamCre;
        Acreditado              : TPersona;
        UnidadNegocio           : TUnNegocio;
        Empresa                 : TEmpresa;
        Comision                : TCrCatComi;

        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;

implementation
{$R *.DFM}

constructor TMCrCobCom.Create( AOwner : TComponent );
begin Inherited;
   ID_ACREDITADO    :=CreaCampo('ID_ACREDITADO',ftInteger,tsNinguno,tsNinguno,False);
   CVE_PRODUCTO_CRE :=CreaCampo('CVE_PRODUCTO_CRE',ftString,tsNinguno,tsNinguno,False);
   DESC_PRODUCTO    :=CreaCampo('DESC_PRODUCTO',ftString,tsNinguno,tsNinguno,False);
   CVE_PRODUCTO_GPO :=CreaCampo('CVE_PRODUCTO_GPO',ftString,tsNinguno,tsNinguno,False);
   DESC_PRODUCTO_GPO:=CreaCampo('DESC_PRODUCTO_GPO',ftString,tsNinguno,tsNinguno,False);
   ID_CREDITO       :=CreaCampo('ID_CREDITO',ftInteger,tsNinguno,tsNinguno,False);
   NOMBRE_ACRED     :=CreaCampo('ACREDITADO',ftString,tsNinguno,tsNinguno,False);


      Acreditado := TPersona.Create(Self);
      Acreditado.MasterSource := Self;

      Empresa := TEmpresa.Create(Self);
      UnidadNegocio := TUnNegocio.Create(Self);

      Comision := TCrCatComi.Create(Self);
      Comision.MasterSource := Self;


      StpName  := ' ';
      UseQuery := False;
      HelpFile := '';
      ShowMenuReporte:=True;
end;

Destructor TMCrCobCom.Destroy;
begin

   if Acreditado <> nil then
      Acreditado.Free;
   //end if;
   if Empresa <> nil then
      Empresa.free;
   //end if;
   if UnidadNegocio <> nil then
      UnidadNegocio.Free;
   if Comision <> nil then
      Comision.MasterSource := Self;
   //end if;
   inherited;
end;


function TMCrCobCom.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMCrCobCom;
begin
   W:=TwMCrCobCom.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


(***********************************************FORMA ********************)
(*                                                                              *)
(*  FORMA
(*                                                                              *)
(***********************************************FORMA ********************)
procedure TwMCrCobCom.AsignaEmpresaSuc;
begin
    Objeto.Empresa.FindKey([IntToStr(objeto.Apli.IdEmpresa)]);
    if  Objeto.UnidadNegocio.FindKey([objeto.ParamCre.IDENTIDAD.AsString]) then
    begin
         CBSucursal.Checked := True;
    end;
    EdIdEmpresa.Enabled := objeto.ParamCre.B_MULTIEMPRESA.AsString = 'V';
    bbEmpresa.Enabled := objeto.ParamCre.B_MULTIEMPRESA.AsString = 'V';

    EdIDSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
    BBSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
    CBSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';

end;

procedure TwMCrCobCom.FormShow(Sender: TObject);
Var qyQuery : TQuery;
    sSQL    : String;
begin
   With Objeto Do Begin
      lbDempresa.Caption := ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := ParamCre.FECHA.AsString;
      lbDUsuario.Caption := ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

   Objeto.ID_ACREDITADO.Control    :=edID_ACREDITADO;
   Objeto.CVE_PRODUCTO_CRE.Control :=edCVE_PRODUCTO_CRE;
   Objeto.DESC_PRODUCTO.Control    :=edDESC_PRODUCTO_CRE;
   Objeto.CVE_PRODUCTO_GPO.Control :=edGpoProd;
   Objeto.DESC_PRODUCTO_GPO.Control:=edNomGpoProd;
   Objeto.ID_CREDITO.Control       := edID_CREDITO;
   Objeto.NOMBRE_ACRED.Control       := edDESC_ID_CREDITO;

      Acreditado.Id_Persona.Control := edID_ACREDITADO;
      Acreditado.Nombre.Control := edNOMBRE_ACRED;
      GetParams(Objeto);
      edNOMBRE_ACRED.Hint := Acreditado.Nombre.AsString;
      edNOMBRE_ACRED.ShowHint := True;

      Comision.CVE_COMISION.Control := edCVE_COMISION;
      Comision.DESC_COMISION.Control := edDESC_COMISION;
      Comision.GetParams(Objeto);
   End;
   Objeto.Empresa.ID_Empresa.Control := EdIdEmpresa;
   Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
   Objeto.Empresa.GetParams(Objeto);

   Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
   Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
   Objeto.UnidadNegocio.GetParams(Objeto);

   AsignaEmpresaSuc;

   //HERJA SE INTEGRA LA OPCION PARA QUE SELECCIONE DIFERENTES COMISIONES 03.12.2010
   VlIndexProd := 0;
   sSQL := 'SELECT CVE_COMISION, CVE_COMISION || '' - '' || DESC_COMISION AS CVE_COMIS FROM CR_CAT_COMISION WHERE SIT_CAT_COMISION = ''AC'' ORDER BY CVE_COMISION';
   qyQuery:= GetSQLQuery(sSQL, Objeto.DataBaseName, Objeto.SessionName, False);
   try
      If qyQuery <> Nil Then
      Begin
           while not(qyQuery.Eof)  do
           begin
                VlIndexProd := CBDESC_COM.Items.Add(qyQuery.FieldByName('CVE_COMIS').AsString);
                               CBCVE_COM.Items.Add(qyQuery.FieldByName('CVE_COMISION').AsString);
                qyQuery.Next;
           end;
      end;
   finally
         qyQuery.Free;
   end;
   //FIN HERJA

end;

procedure TwMCrCobCom.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
   Objeto.ID_ACREDITADO.Control    :=nil;
   Objeto.CVE_PRODUCTO_CRE.Control :=nil;
   Objeto.DESC_PRODUCTO.Control    :=nil;
   Objeto.CVE_PRODUCTO_GPO.Control :=nil;
   Objeto.DESC_PRODUCTO_GPO.Control:=nil;
   Objeto.ID_CREDITO.Control       := nil;
   Objeto.NOMBRE_ACRED.Control       := nil;


      Acreditado.Id_Persona.Control := nil;
      Acreditado.Nombre.Control := nil;
      Comision.CVE_COMISION.Control := nil;
      Comision.DESC_COMISION.Control := nil;
   End;
   Objeto.Empresa.ID_Empresa.Control := Nil;
   Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
   Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
   Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
end;

procedure TwMCrCobCom.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMCrCobCom.EnableCheckBox(var CheckBox : TCheckBox);
begin
    If Not CheckBox.Checked Then Begin
        CheckBox.Checked:=False;
        CheckBox.Enabled:=False;
    End Else Begin
        CheckBox.Checked:=True;
        CheckBox.Enabled:=True;
    End;
end;

procedure TwMCrCobCom.ImprimeReporte(bPreview : Boolean);
Var
   sSituacion: String;
   VlProducto : String;
   VLPrimero  : Boolean;
   VlIndex : integer;
   sComsiones : String;
begin
   If rgSituacion.ItemIndex = 0 Then
      sSituacion := ''
   Else If rgSituacion.ItemIndex = 1 Then
      sSituacion := 'AC'
   Else If rgSituacion.ItemIndex = 2 Then
      sSituacion := 'PA'
   Else If rgSituacion.ItemIndex = 3 Then
      sSituacion := 'LQ'
   Else If rgSituacion.ItemIndex = 4 Then
      sSituacion := 'IM'
   Else If rgSituacion.ItemIndex = 5 Then
      sSituacion := 'CA';

   if Rinfmost.ItemIndex=-1 then Rinfmost.ItemIndex:=2;

   //HERJA SE INTEGRA LA OPCION PARA QUE SELECCIONE DIFERENTES COMISIONES 03.12.2010
   sComsiones:='';
   if cbxDifComis.Checked then
   begin
      VLPrimero := True;
      for VlIndex := 0 to VlIndexProd do
      begin
         CBCVE_COM.Checked[VlIndex] := CBDESC_COM.Checked[VlIndex];
      end;
      VlProducto := '';
      for VlIndex := 0 to VlIndexProd do
      begin
         if CBCVE_COM.Checked[VlIndex] then
         begin
            if not(VLPrimero) then
               VlProducto := VlProducto + ''','+''''+CBCVE_COM.Items.Strings[VlIndex]
            else
            begin
               VlProducto := CBCVE_COM.Items.Strings[VlIndex];
               VLPrimero := False;
            end;
         end;
      end;
      sComsiones:= VlProducto;
   end;
      
   if cbxCOMISION.Checked = true then sComsiones:= edCVE_COMISION.Text;
   //FIN HERJA

   if rgTipoReporte.ItemIndex = 0 then
     begin
       RepCobComision( edF_Ini.Text,                edF_Fin.Text,           edGpoProd.Text,
                       edCVE_PRODUCTO_CRE.Text,     edID_ACREDITADO.Text,   edID_CREDITO.Text,
//                       edCVE_COMISION.Text,         sSituacion,             EdIdEmpresa.Text,
                       sComsiones,         sSituacion,             EdIdEmpresa.Text,
                       EdIDSucursal.Text,           bPreview,               cbxCUOTA_FEGA.Checked ,
                       cbRESUMEN.Checked ,          cbPRODUCTO.Checked ,    cbSUCURSALES.Checked ,
                       Rinfmost.ItemIndex ,          Objeto.Apli,        edNbrArch.text);
     end
   else
     begin
        RepCtrlConceptos( edF_Ini.Text,          edF_Fin.Text,
                          edGpoProd.Text,        edCVE_PRODUCTO_CRE.Text,
                          edID_ACREDITADO.Text,  edID_CREDITO.Text,
//                          edCVE_COMISION.Text,   sSituacion,
                          sComsiones,   sSituacion,
                          EdIdEmpresa.Text,      EdIDSucursal.Text,
                          edNbrArch.text ,       Rinfmost.ItemIndex ,
                          bPreview,              Objeto.Apli );
     end;

    If Trim(edNbrArch.Text)<>'' Then Begin
       If bGenArch Then
         ShowMessage('El Archivo '+ Trim(edNbrArch.Text)+' se generó correctamente')
       Else
         ShowMessage('No se generó el Archivo')
    End;
End;

procedure TwMCrCobCom.InterForma1BtnImprimirClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMCRCOBCOM_IMPRI',True,True) then
   begin
      ImprimeReporte(False);
   end;
end;

procedure TwMCrCobCom.InterForma1BtnPreviewClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMCRCOBCOM_PREVI',True,True) then
   begin
      ImprimeReporte(True);
   end;
end;

procedure TwMCrCobCom.btACREDITADOClick(Sender: TObject);
begin
   With Objeto Do Begin
      Acreditado.ShowAll := True;
      If Acreditado.Busca Then Begin
         chbxAcreditado.Checked:= True;
         chbxAcreditado.Enabled:= True;
         InterForma1.NextTab(edID_ACREDITADO);
      End;
   End;
end;

procedure TwMCrCobCom.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:= True;
end;

procedure TwMCrCobCom.ilACREDITADOEjecuta(Sender: TObject);
begin
   If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
      chbxAcreditado.Checked:=True;
      chbxAcreditado.Enabled:=True;
      InterForma1.NextTab(edID_ACREDITADO);
   End;
end;

procedure TwMCrCobCom.chbxAcreditadoClick(Sender: TObject);
begin
   EnableCheckBox(chbxAcreditado);
   Objeto.Acreditado.Active := chbxAcreditado.Checked;
end;

procedure TwMCrCobCom.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TwMCrCobCom.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMCrCobCom.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TwMCrCobCom.ILSucursalEjecuta(Sender: TObject);
begin
   If  Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMCrCobCom.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

procedure TwMCrCobCom.chbxFVencimientoClick(Sender: TObject);
begin
   if chbxFVencimiento.Checked then Begin
      dtpF_Ini.DateTime:= Objeto.Apli.DameFechaEmpresa;
      dtpF_Fin.DateTime:= Objeto.Apli.DameFechaEmpresa;
      edF_Ini.text:=FormatDateTime('dd/mm/yyyy',dtpF_Ini.DateTime);
      edF_Fin.text:=FormatDateTime('dd/mm/yyyy',dtpF_Fin.DateTime);
      edF_Ini.Enabled:= True;
      edF_Fin.Enabled:= True;
      edF_Ini.Color:= clWindow;
      edF_Fin.Color:= clWindow;
      dtpF_Ini.Enabled:= True;
      dtpF_Fin.Enabled:= True;
   end
   else Begin
      edF_Ini.text:='';
      edF_Fin.text:='';
      edF_Ini.Enabled:= False;
      edF_Fin.Enabled:= False;
      edF_Ini.Color:= clBtnFace;
      edF_Fin.Color:= clBtnFace;
      dtpF_Ini.Enabled:= False;
      dtpF_Fin.Enabled:= False;
   end;
end;

procedure TwMCrCobCom.btCVE_COMISIONClick(Sender: TObject);
begin
   Objeto.Comision.ShowAll := True;
   If Objeto.Comision.Busca Then Begin
      cbxCOMISION.Checked:=True;
      cbxCOMISION.Enabled:=True;
      InterForma1.NextTab(edCVE_COMISION);
   End;
end;

procedure TwMCrCobCom.ilCOMISIONEjecuta(Sender: TObject);
begin
   If Objeto.Comision.FindKey([ilCOMISION]) Then Begin
      cbxCOMISION.Checked:=True;
      cbxCOMISION.Enabled:=True;
      InterForma1.NextTab(edCVE_COMISION);
   End;
end;

procedure TwMCrCobCom.cbxCOMISIONClick(Sender: TObject);
begin
   EnableCheckBox(cbxCOMISION);
   Objeto.Comision.Active := cbxCOMISION.Checked;
   cbxDifComis.Checked:=false;
end;

procedure TwMCrCobCom.ilCOMISIONCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:= True;
end;

procedure TwMCrCobCom.sbExcelClick(Sender: TObject);
 var sExt:String;
begin
  {EMH Salida a Excel}

  if rgTipoReporte.ItemIndex = 0 then
  begin

    If SaveDialog1.Execute Then Begin


      sExt:= copy(SaveDialog1.FileName,Length(SaveDialog1.FileName)-3,Length(SaveDialog1.FileName));
      If UpperCase(sExt)= '.PRN' Then
        edNbrArch.Text := SaveDialog1.FileName
      Else
        edNbrArch.Text := SaveDialog1.FileName + '.prn';


    End Else
      edNbrArch.Text := '';
  end
  else
  begin
    SaveDialog1.DefaultExt := 'xls';
    SaveDialog1.Filter := '*.xls|*.xls';

    If SaveDialog1.Execute Then Begin
      sExt:= copy(SaveDialog1.FileName,Length(SaveDialog1.FileName)-3,Length(SaveDialog1.FileName));
      If UpperCase(sExt)= '.XLS' Then
        edNbrArch.Text := SaveDialog1.FileName
      Else
        edNbrArch.Text := SaveDialog1.FileName + '.xls';
    End Else
      edNbrArch.Text := '';

  end;
end;

procedure TwMCrCobCom.cbxArchivoClick(Sender: TObject);
begin
  if not cbxArchivo.Checked then
  begin
    edNbrArch.Text := '';
  end;

end;

procedure TwMCrCobCom.btCVE_PRODUCTO_CREClick(Sender: TObject);
Var T : TInterFindit;
begin
  With Objeto Do
    Begin
      T := CreaBuscador('IPRODCR.IT','I');
      Try
        If T.Execute Then
           Begin
             CVE_PRODUCTO_CRE.AsString := T.DameCampo(0);
             DESC_PRODUCTO.AsString := T.DameCampo(1);
             cbPRODUCTO_CRE.Checked := True;
           End;
      Finally
        T.Free;
      End;
    End;
end;

procedure TwMCrCobCom.btGpoProdClick(Sender: TObject);
Var T : TInterFindit;
begin
  With Objeto Do
    Begin
      T := CreaBuscador('IPRODGPO.IT','I');
      Try
        If T.Execute Then
           Begin
             CVE_PRODUCTO_GPO.AsString := T.DameCampo(0);
             DESC_PRODUCTO_GPO.AsString := T.DameCampo(1);
             chbxGpoProd.Checked := True;
           End;
      Finally
        T.Free;
      End;
    End;
end;

procedure TwMCrCobCom.btID_CREDITOClick(Sender: TObject);
Var T : TInterFindit;
begin
  With Objeto Do
    Begin
      T := CreaBuscador('ICRDIMCR.IT','I');
      Try
        If T.Execute Then
           Begin
             ID_CREDITO.AsString := T.DameCampo(0);
             NOMBRE_ACRED.AsString := T.DameCampo(1);
             cbID_CREDITO.Checked := True;
           End;
      Finally
        T.Free;
      End;
    End;
end;

procedure TwMCrCobCom.cbPRODUCTO_CREClick(Sender: TObject);
begin
   EnableCheckBox(cbPRODUCTO_CRE);
   edCVE_PRODUCTO_CRE.Enabled := cbPRODUCTO_CRE.Checked;

   IF NOT (edCVE_PRODUCTO_CRE.Enabled ) then Begin
      edCVE_PRODUCTO_CRE.Text := '';
      edDESC_PRODUCTO_CRE.Text := '';
   End;
end;

procedure TwMCrCobCom.chbxGpoProdClick(Sender: TObject);
begin
   EnableCheckBox(chbxGpoProd);
   edGpoProd.Enabled := chbxGpoProd.Checked;

   IF NOT (edGpoProd.Enabled ) then Begin
      edGpoProd.Text := '';
      edNomGpoProd.Text := '';
   End;
end;

procedure TwMCrCobCom.cbID_CREDITOClick(Sender: TObject);
begin
   EnableCheckBox(cbID_CREDITO);
   edID_CREDITO.Enabled := cbID_CREDITO.Checked;

   IF NOT (edID_CREDITO.Enabled ) then Begin
      edID_CREDITO.Text := '';
      edDESC_ID_CREDITO.Text := '';
   End;
end;

procedure TwMCrCobCom.CBDESC_COMClick(Sender: TObject);
var VlIndex: Integer;
begin
{   for VlIndex := 0 to VlIndexProd do
   begin
      CBDESC_COM.Checked[VlIndex] :=  CBDESC_COM.Checked[VlIndex];
   end;}
end;

procedure TwMCrCobCom.cbxDifComisClick(Sender: TObject);
var VlIndex: Integer;
begin
//   EnableCheckBox(cbxDifComis);

   iF cbxDifComis.Checked=false then
   begin
      for VlIndex := 0 to VlIndexProd do
      begin
         CBCVE_COM.Checked[VlIndex] :=false;
         CBDESC_COM.Checked[VlIndex]:=false;
      end;
      CBCVE_COM.Enabled:=false;
      CBDESC_COM.Enabled:=false;
   end;

   iF cbxDifComis.Checked=true then
   begin
      CBCVE_COM.Enabled:=true;
      CBDESC_COM.Enabled:=true;

      cbxCOMISION.Checked:=false;
   end;
end;

end.
