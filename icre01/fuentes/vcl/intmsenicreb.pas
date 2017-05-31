// Sistema         : Clase de TMReAuCred
// Fecha de Inicio : 01/10/2003
// Función forma   : Clase de TMReAuCred
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMSenicreb;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,

//Unidades Adicionales
IntParamCre,
IntCrSectEco,   //Sector Económico
IntMon,         //Divisa
IntCrAcredit,   //Acreditado
IntCrRePaCnb,   //Localidad
IntCrSen,       //Actividad
IntMQrSenicreb, //Reporte
Intempre,       //Empresa
IntUnNeg        //Sucursal
;

Type
 TMSenicreb= class;

  TwMSenicreb=Class(TForm)
    InterForma1             : TInterForma;
    lbAplica: TLabel;
    lbCVE_MONEDA: TLabel;
    edCVE_MONEDA: TEdit;
    ilMONEDA: TInterLinkit;
    btCVE_MONEDA: TBitBtn;
    edDESC_MONEDA: TEdit;
    lbID_PROMOTOR: TLabel;
    edSECTOR_ECO: TEdit;
    btSECTOR_ECO: TBitBtn;
    ilSECTOR: TInterLinkit;
    edDESC_SEC_ECO: TEdit;
    Label7: TLabel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    chbxMoneda: TCheckBox;
    chbxSECTOR_ECO: TCheckBox;
    chbxACTIVIDAD: TCheckBox;
    edDESC_ACTIVIDAD: TEdit;
    btACTIVIDAD: TBitBtn;
    edACTIVIDAD: TInterEdit;
    ilACTIVIDAD: TInterLinkit;
    lbCVE_PRODUCTO_CRE: TLabel;
    Label1: TLabel;
    edLOCALIDAD: TEdit;
    btLOCALIDAD: TBitBtn;
    edDESC_LOCALIDAD: TEdit;
    edACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    ilLOCALIDAD: TInterLinkit;
    ilACREDITADO: TInterLinkit;
    chbxAcreditado: TCheckBox;
    chbxLOCALIDAD: TCheckBox;
    gbControl: TGroupBox;
    Label4: TLabel;
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
    Label2: TLabel;
    dtpF_DIA: TInterDateTimePicker;
    edFECHA_DIA: TEdit;
    SaveDialog1: TSaveDialog;
    Label8: TLabel;
    sbExcel: TSpeedButton;
    edNbrArch: TEdit;
    cbxArchivo: TCheckBox;
    rgTIP_CLIENTE: TRadioGroup;
    rgPER_JURIDICA: TRadioGroup;
    lbCVE_TIPO_SECTOR: TLabel;
    cbCVE_TIPO_CTA: TComboBox;
    cbTipCuenta: TCheckBox;
    cbResumen: TCheckBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure btCVE_MONEDAClick(Sender: TObject);
    procedure ilMONEDACapture(Sender: TObject; var Show: Boolean);
    procedure ilMONEDAEjecuta(Sender: TObject);
    procedure edCVE_MONEDAExit(Sender: TObject);
    procedure chbxMonedaClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure chbxAcreditadoClick(Sender: TObject);
    procedure edACREDITADOExit(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure bbEmpresaClick(Sender: TObject);
    procedure BBSucursalClick(Sender: TObject);
    procedure CBSucursalClick(Sender: TObject);
    procedure ilEmpresaEjecuta(Sender: TObject);
    procedure ILSucursalEjecuta(Sender: TObject);
    procedure btSECTOR_ECOClick(Sender: TObject);
    procedure ilSECTOREjecuta(Sender: TObject);
    procedure btLOCALIDADClick(Sender: TObject);
    procedure ilLOCALIDADEjecuta(Sender: TObject);
    procedure btACTIVIDADClick(Sender: TObject);
    procedure ilACTIVIDADEjecuta(Sender: TObject);
    procedure cbxArchivoClick(Sender: TObject);
    procedure edNbrArchChange(Sender: TObject);
    procedure sbExcelClick(Sender: TObject);
    procedure chbxLOCALIDADClick(Sender: TObject);
    procedure chbxACTIVIDADClick(Sender: TObject);
    procedure cbTipCuentaClick(Sender: TObject);
    procedure chbxSECTOR_ECOClick(Sender: TObject);
    private
    { Private declarations }
       Procedure ImprimirReporte(bPreview:Boolean);
       Procedure AsignaEmpresaSuc;
       Function  ListaTipCta:String;
    public
    { Public declarations }
    Objeto : TMSenicreb;
end;
 TMSenicreb= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
       public
        { Public declarations }

        ParamCre                 : TParamCre;
        SectorEco                : TCrSectEco;
        Moneda                   : TMoneda;
        Acreditado               : TCrAcredit;
        LocalCNBV                : TCrRePaCnb;
        Senicreb                 : TCrSen;
        Empresa                  : TEmpresa;
        UnidadNegocio            : TUnNegocio;

        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation

{$R *.DFM}


constructor TMSenicreb.Create( AOwner : TComponent );
begin Inherited;

      Moneda := TMoneda.Create(Self);
      Moneda.MasterSource:=Self;

      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource := Self;

      SectorEco := TCrSectEco.Create(Self);
      SectorEco.MasterSource:=Self;

      LocalCNBV := TCrRePaCnb.Create(Self);
      LocalCNBV.MasterSource:= Self;

      Senicreb := TCrSen.Create(Self);
      Senicreb.MasterSource:=Self;

      Empresa := TEmpresa.Create(Self);
      UnidadNegocio := TUnNegocio.Create(Self);

      UseQuery := False;
      HelpFile := 'InTMReAuCred.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMSenicreb.Destroy;
begin
   if Moneda <> nil then
      Moneda.Free;
   if Acreditado <> nil then
      Acreditado.Free;
   if SectorEco <> nil then
      SectorEco.Free;
   if LocalCNBV <> nil then
      LocalCNBV.free;
   if Senicreb <> nil then
      Senicreb.Free;
   if Empresa <> nil then
      Empresa.free;
   if UnidadNegocio <> nil then
      UnidadNegocio.Free;
   inherited;
end;


function TMSenicreb.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMSenicreb;
begin
   W:=TwMSenicreb.Create(Self);
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


(***********************************************FORMA NINGUNO********************)
(*                                                                              *)
(*  FORMA DE NINGUNO                                                            *)
(*                                                                              *)
(***********************************************FORMA NINGUNO********************)
procedure TwMSenicreb.AsignaEmpresaSuc;
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

procedure TwMSenicreb.FormShow(Sender: TObject);
begin
      //PINTA DATOS DEL PANEL INFERIOR
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      dtpF_DIA.DateTime:= Objeto.Apli.DameFechaEmpresaDia('D000')-1;
      edFECHA_DIA.text:=FormatDateTime('dd/mm/yyyy',dtpF_DIA.DateTime);

      Objeto.Acreditado.ID_ACREDITADO.Control := edACREDITADO;
      Objeto.Acreditado.Persona.Nombre.Control := edNOMBRE_ACRED;
      Objeto.GetParams(Objeto);
      edNOMBRE_ACRED.Hint := Objeto.Acreditado.Persona.Nombre.AsString;
      edNOMBRE_ACRED.ShowHint := True;

      Objeto.Moneda.Cve_Moneda.Control := edCVE_MONEDA;
      Objeto.Moneda.Desc_Moneda.Control := edDESC_MONEDA;
      Objeto.Moneda.GetParams(Objeto);
      edDESC_MONEDA.Hint := Objeto.Moneda.Desc_Moneda.AsString;
      edDESC_MONEDA.ShowHint := True;

      Objeto.SectorEco.CVE_SECTOR_ECO.Control := edSECTOR_ECO;
      Objeto.SectorEco.DESC_SECTOR_ECO.Control := edSECTOR_ECO;
      Objeto.SectorEco.GetParams(Objeto);
      edDESC_SEC_ECO.Hint := Objeto.SectorEco.DESC_SECTOR_ECO.AsString;
      edDESC_SEC_ECO.ShowHint := True;

      Objeto.LocalCNBV.CVE_LOCAL_CNBV.Control := edLOCALIDAD;
      Objeto.LocalCNBV.DESC_LOCAL_CNBV.Control := edDESC_LOCALIDAD;
      Objeto.LocalCNBV.GetParams(Objeto);
      edDESC_LOCALIDAD.Hint := Objeto.LocalCNBV.DESC_LOCAL_CNBV.AsString;
      edDESC_LOCALIDAD.ShowHint := True;

      Objeto.Senicreb.CVE_SENICREB.Control := edACTIVIDAD;
      Objeto.Senicreb.DESC_SENICREB.Control := edDESC_ACTIVIDAD;
      Objeto.Senicreb.GetParams(Objeto);
      edDESC_ACTIVIDAD.Hint := Objeto.Senicreb.DESC_SENICREB.AsString;
      edDESC_ACTIVIDAD.ShowHint := True;

      Objeto.Empresa.ID_Empresa.Control := EdIdEmpresa;
      Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
      Objeto.Empresa.GetParams(Objeto);

      Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
      Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
      Objeto.UnidadNegocio.GetParams(Objeto);
      AsignaEmpresaSuc;
      ListaTipCta;

end;

procedure TwMSenicreb.FormDestroy(Sender: TObject);
begin
      Objeto.Acreditado.ID_ACREDITADO.Control := nil;
      Objeto.Acreditado.Persona.Nombre.Control := nil;
      Objeto.Moneda.Cve_Moneda.Control := nil;
      Objeto.Moneda.Desc_Moneda.Control := nil;
      Objeto.SectorEco.CVE_SECTOR_ECO.Control := nil;
      Objeto.SectorEco.DESC_SECTOR_ECO.Control := nil;
      Objeto.LocalCNBV.CVE_LOCAL_CNBV.Control := nil;
      Objeto.LocalCNBV.DESC_LOCAL_CNBV.Control := nil;
      Objeto.Senicreb.CVE_SENICREB.Control := nil;
      Objeto.Senicreb.DESC_SENICREB.Control := nil;
      Objeto.Empresa.ID_Empresa.Control := Nil;
      Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
      Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
      Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
end;

procedure TwMSenicreb.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMSenicreb.btCVE_MONEDAClick(Sender: TObject);
begin
   Objeto.Moneda.ShowAll := True;
   if Objeto.Moneda.Busca then Begin
        chbxMoneda.Checked:= True;
        chbxMoneda.Enabled:= True;
        InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TwMSenicreb.ilMONEDACapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TwMSenicreb.ilMONEDAEjecuta(Sender: TObject);
begin
    If Objeto.Moneda.FindKey([ilMONEDA.Buffer]) Then Begin
        chbxMoneda.Checked:=True;
        chbxMoneda.Enabled:=True;
        InterForma1.NextTab(edCVE_MONEDA);
    End;
end;

procedure TwMSenicreb.edCVE_MONEDAExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edCVE_MONEDA,True,'',True);
end;

procedure TwMSenicreb.chbxMonedaClick(Sender: TObject);
begin
    If not chbxMoneda.Checked Then Begin
        Objeto.Moneda.Active:=False;
        chbxMoneda.Checked:= False;
        chbxMoneda.Enabled:= False;
    End Else Begin
        chbxMoneda.Checked:= True;
        chbxMoneda.Enabled:= True;
    End;
end;

procedure TwMSenicreb.InterForma1BtnPreviewClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMSENICREB_IMPRI',True,True) then
      ImprimirReporte(True);
end;

procedure TwMSenicreb.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TwMSenicreb.ilACREDITADOEjecuta(Sender: TObject);
begin
    If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
    End;
end;

procedure TwMSenicreb.btACREDITADOClick(Sender: TObject);
begin
   Objeto.Acreditado.ShowAll := True;
   If Objeto.Acreditado.Busca Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
   End;
end;

procedure TwMSenicreb.chbxAcreditadoClick(Sender: TObject);
begin
    If not chbxAcreditado.Checked Then Begin
        Objeto.Acreditado.Active:=False;
        chbxAcreditado.Checked:=False;
        chbxAcreditado.Enabled:=False;
    End Else Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
    End;
end;

procedure TwMSenicreb.edACREDITADOExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edACREDITADO,True,'',True);
end;

procedure TwMSenicreb.InterForma1BtnImprimirClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMSENICREB_IMPRI',True,True) then
     ImprimirReporte(False);
end;

Procedure TwMSenicreb.ImprimirReporte(bPreview:Boolean);
Var
    sTipCte, sPerJur:String;
    iTipCte, iPerJur :Integer;
begin
   iTipCte := rgTIP_CLIENTE.ItemIndex;
   iPerJur := rgPER_JURIDICA.ItemIndex;
   case iTipCte of
        0: sTipCte := '0';
        1: sTipCte := '1';
        2: sTipCte := '';
   end;

   case iPerJur of
        0: sPerJur := 'PM';
        1: sPerJur := 'PF';
        2: sPerJur := '';
   end;

   RepSenicreb( edSECTOR_ECO.Text, edCVE_MONEDA.Text, edACREDITADO.Text, edLOCALIDAD.Text,
                edACTIVIDAD.Text, cbCVE_TIPO_CTA.Text, sTipCte, sPerJur,
                EdIdEmpresa.Text   , EdIDSucursal.Text, edNbrArch.Text,
                StrToDateTime(edFECHA_DIA.Text), cbResumen.Checked, Objeto.Apli, bPreview );
    If Trim(edNbrArch.Text)<>'' Then Begin
       If bGenArch Then
         ShowMessage('El Archivo '+ Trim(edNbrArch.Text)+' se generó correctamente')
       Else
         ShowMessage('No se generó el Archivo')
    End;

End;
procedure TwMSenicreb.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TwMSenicreb.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMSenicreb.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

procedure TwMSenicreb.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TwMSenicreb.ILSucursalEjecuta(Sender: TObject);
begin
   If  Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMSenicreb.btSECTOR_ECOClick(Sender: TObject);
begin
    Objeto.SectorEco.ShowAll := True;
    if Objeto.SectorEco.Busca then
    Begin
        chbxSECTOR_ECO.Checked:=True;
        chbxSECTOR_ECO.Enabled:=True;
        InterForma1.NextTab(edSECTOR_ECO);
    end;
end;

procedure TwMSenicreb.ilSECTOREjecuta(Sender: TObject);
begin
   if Objeto.SectorEco.FindKey([ilSECTOR.Buffer])then
       InterForma1.NextTab(edSECTOR_ECO);
   //end if
end;

procedure TwMSenicreb.btLOCALIDADClick(Sender: TObject);
begin
   Objeto.LocalCNBV.ShowAll := True;
   if Objeto.LocalCNBV.Busca then
   Begin
      chbxLOCALIDAD.Checked:=True;
      chbxLOCALIDAD.Enabled:=True;
      InterForma1.NextTab(edLOCALIDAD);
   end;
end;

procedure TwMSenicreb.ilLOCALIDADEjecuta(Sender: TObject);
begin
 if Objeto.LocalCNBV.FindKey([ilLOCALIDAD.Buffer]) then
   InterForma1.NextTab(edLOCALIDAD);
end;

procedure TwMSenicreb.btACTIVIDADClick(Sender: TObject);
begin
   Objeto.Senicreb.ShowAll := True;
   if Objeto.Senicreb.Busca then
   Begin
      chbxACTIVIDAD.Checked:=True;
      chbxACTIVIDAD.Enabled:=True;
      InterForma1.NextTab(edACTIVIDAD);
   end;

end;

procedure TwMSenicreb.ilACTIVIDADEjecuta(Sender: TObject);
begin
   if Objeto.Senicreb.FindKey([ilACTIVIDAD.Buffer]) then
      InterForma1.NextTab(edACTIVIDAD);
   //end if
end;

procedure TwMSenicreb.cbxArchivoClick(Sender: TObject);
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

procedure TwMSenicreb.edNbrArchChange(Sender: TObject);
begin
    If Trim(edNbrArch.Text)<>'' Then Begin
        cbxArchivo.Checked:=True;
        cbxArchivo.Enabled:=True;
    End Else Begin
        cbxArchivo.Checked:=False;
        cbxArchivo.Enabled:=False;
    End;
end;

procedure TwMSenicreb.sbExcelClick(Sender: TObject);
var sExt:String;
begin
  If SaveDialog1.Execute Then Begin
      sExt:= copy(SaveDialog1.FileName,Length(SaveDialog1.FileName)-3,Length(SaveDialog1.FileName));
      If  UpperCase(sExt)= '.PRN' Then
         edNbrArch.Text := SaveDialog1.FileName
      Else
         edNbrArch.Text := SaveDialog1.FileName + '.prn';      
  End Else
    edNbrArch.Text := '';
end;

procedure TwMSenicreb.chbxLOCALIDADClick(Sender: TObject);
begin
    If not chbxLOCALIDAD.Checked Then Begin
        Objeto.LocalCNBV.Active:=False;
        chbxLOCALIDAD.Checked:=False;
        chbxLOCALIDAD.Enabled:=False;
    End Else Begin
        chbxLOCALIDAD.Checked:=True;
        chbxLOCALIDAD.Enabled:=True;
    End;
end;

procedure TwMSenicreb.chbxACTIVIDADClick(Sender: TObject);
begin
    If not chbxACTIVIDAD.Checked Then Begin
        Objeto.LocalCNBV.Active:=False;
        chbxACTIVIDAD.Checked:=False;
        chbxACTIVIDAD.Enabled:=False;
    End Else Begin
        chbxACTIVIDAD.Checked:=True;
        chbxACTIVIDAD.Enabled:=True;
    End;
end;

function TwMSenicreb.ListaTipCta: String;
Var Q       : TQuery;
    vlSql   : String;
Begin
   cbCVE_TIPO_CTA.Items.Clear;
   Q := TQuery.Create(Self);
   Try
       Q.SessionName := Objeto.SessionName;
       Q.DataBaseName := Objeto.DataBaseName;
       Q.SQL.Clear;
       Q.SQL.Add(' SELECT DISTINCT CVE_TIPO_CRED_BC ' +
                 ' FROM CR_TIP_CRED_BC ' +
                 ' ORDER BY CVE_TIPO_CRED_BC ');
       Q.Open;

       While Not Q.Eof Do
         Begin
            cbCVE_TIPO_CTA.Items.Add(Q.FieldByName('CVE_TIPO_CRED_BC').AsString);
            Q.Next;
         End;
   Finally
     If Assigned(Q) Then
      Begin
         Q.Close;
         Q.Free;
      End;
   End;
end;

procedure TwMSenicreb.cbTipCuentaClick(Sender: TObject);
begin
    If not cbTipCuenta.Checked Then Begin
        cbCVE_TIPO_CTA.Text := '';
        cbCVE_TIPO_CTA.Enabled := False;
    End Else Begin
        cbTipCuenta.Checked:=True;
        cbTipCuenta.Enabled:=True;
        cbCVE_TIPO_CTA.Enabled := True;
    End;
end;

procedure TwMSenicreb.chbxSECTOR_ECOClick(Sender: TObject);
begin
    If not chbxSECTOR_ECO.Checked Then Begin
        Objeto.SectorEco.Active:=False;
        chbxSECTOR_ECO.Checked:= False;
        chbxSECTOR_ECO.Enabled:= False;
    End Else Begin
        chbxSECTOR_ECO.Checked:= True;
        chbxSECTOR_ECO.Enabled:= True;
    End;
end;

end.

