// Sistema         : Clase de TMContVenc
// Fecha de Inicio : 03/08/2003
// Función forma   : Clase de TMContVenc
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
// Modificaciones  : 23 10 2004 Importe de  pago histórico
Unit IntMContVenc;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,

//Unidades Adicionales
IntMon,           //Moneda
IntGenCre,
IntParamCre,
IntMQrContVenc,   //Reporte
IntMProdGpo,
IntCrCatMini,     //Catálogo Minimo
Intempre,         //Empresa
IntUnNeg,         //Unidad Negocio/Suc
IntMInstDesc
;

Type
 TMContVenc= class;

  TwMContVenc=Class(TForm)
    InterForma1             : TInterForma;
    lbAplica: TLabel;
    lbCVE_MONEDA: TLabel;
    edCVE_MONEDA: TEdit;
    ilMONEDA: TInterLinkit;
    btCVE_MONEDA: TBitBtn;
    edDESC_MONEDA: TEdit;
    rgSituacion: TRadioGroup;
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
    dtpF_Vencimiento: TInterDateTimePicker;
    edF_Vencimiento: TEdit;
    lbLiqF_INICIO: TLabel;
    rgOrden: TRadioGroup;
    chbxF_Ven: TCheckBox;
    sbExcel: TSpeedButton;
    Label5: TLabel;
    edNbrArch: TEdit;
    cbxArchivo: TCheckBox;
    SaveDialog1: TSaveDialog;
    gbControl: TGroupBox;
    Label6: TLabel;
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
    Label8: TLabel;
    edCVE_PRODUCTO_GPO: TEdit;
    btCVE_PRODUCTO_GPO: TBitBtn;
    edNOM_CVE_PRODUCTO_GPO: TEdit;
    cbxCVE_PRODUCTO_GPO: TCheckBox;
    ilCVE_PRODUCTO_GPO: TInterLinkit;
    CVE_CAT_MIN: TLabel;
    edCVE_CAT_MINIMO: TEdit;
    btCVE_CAT_MINIMO: TBitBtn;
    edDESC_CAT_MINIMO: TEdit;
    ilOperadoPor: TInterLinkit;
    chbxCatMin: TCheckBox;
    cbxF_Prog: TCheckBox;
    InterDateTimePicker1: TInterDateTimePicker;
    edF_PROG_PAGO: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edOPERADO: TEdit;
    BitBtn1: TBitBtn;
    edDescOperado: TEdit;
    cbxOPERADO: TCheckBox;
    ilCAT_MIN: TInterLinkit;
    cbxBANCO: TCheckBox;
    cbxCompactar: TCheckBox;
    rgReporte: TRadioGroup;
    cbOrdPromAdmon: TCheckBox;
    Label32: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure btCVE_MONEDAClick(Sender: TObject);
    procedure ilMONEDAEjecuta(Sender: TObject);
    procedure edCVE_MONEDAExit(Sender: TObject);
    procedure chbxMonedaClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure edF_VencimientoChange(Sender: TObject);
    procedure chbxF_VenClick(Sender: TObject);
    procedure sbExcelClick(Sender: TObject);
    procedure edNbrArchChange(Sender: TObject);
    procedure cbxArchivoClick(Sender: TObject);
    procedure bbEmpresaClick(Sender: TObject);
    procedure BBSucursalClick(Sender: TObject);
    procedure CBSucursalClick(Sender: TObject);
    procedure ilEmpresaEjecuta(Sender: TObject);
    procedure ILSucursalEjecuta(Sender: TObject);
    procedure btCVE_PRODUCTO_GPOClick(Sender: TObject);
    procedure ilCVE_PRODUCTO_GPOEjecuta(Sender: TObject);
    procedure cbxCVE_PRODUCTO_GPOClick(Sender: TObject);
    procedure btCVE_CAT_MINIMOClick(Sender: TObject);
    procedure ilOperadoPorEjecuta(Sender: TObject);
    procedure chbxCatMinClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure cbxOPERADOClick(Sender: TObject);
    procedure ilCAT_MINEjecuta(Sender: TObject);
    procedure cbxBANCOClick(Sender: TObject);
    procedure cbxF_ProgClick(Sender: TObject);
    procedure edF_PROG_PAGOChange(Sender: TObject);
    private
    { Private declarations }

       //<LOLS 17ENE2006. DIGITALIZACION DE REPORTES>
       Procedure ImprimeReporte(bPreview:Boolean; grOpcion  : TGenRepOption );
       //Procedure ImprimeReporte(bPreview:Boolean);
       //</LOLS>
       Procedure AsignaEmpresaSuc;
       Procedure CambiaControl;
    public
    { Public declarations }
    Objeto : TMContVenc;
end;
 TMContVenc= class(TInterFrame)
      private
      protected
       public
        { Public declarations }
        Moneda                   : TMoneda;
        ParamCre                 : TParamCre;
        UnidadNegocio            : TUnNegocio;
        CatMin                   : TCrCatMini;
        Empresa                  : TEmpresa;
        GpoProd                  : TMProdGpo;
        IDescontadora            : TMInstDesc;

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


constructor TMContVenc.Create( AOwner : TComponent );
begin Inherited;

      Moneda := TMoneda.Create(Self);
      Moneda.MasterSource:=Self;
      Moneda.FieldByName('CVE_MONEDA').MasterField:='CVE_MONEDA';

      Empresa := TEmpresa.Create(Self);
      UnidadNegocio := TUnNegocio.Create(Self);

      GpoProd:= TMProdGpo.Create(Self);
      GpoProd.MasterSource:=Self;
      GpoProd.FieldByName('CVE_PRODUCTO_GPO').MasterField:='CVE_PRODUCTO_GPO';

      CatMin := TCrCatMini.Create(Self);
      CatMin.MasterSource := Self;

      IDescontadora := TMInstDesc.Create(Self);
      IDescontadora.MasterSource := Self;

      UseQuery := False;
      HelpFile := 'InTMContVenc.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMContVenc.Destroy;
begin
   if Moneda <> nil then
      Moneda.Free;
   if Empresa <> nil then
      Empresa.free;
   if UnidadNegocio <> nil then
      UnidadNegocio.Free;
   If GpoProd <> Nil Then
      GpoProd.Free;
   if CatMin <> nil then
      CatMin.Free;
   if IDescontadora <> nil then
      IDescontadora.Free;
   inherited;
end;


function TMContVenc.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMContVenc;
begin
   W:=TwMContVenc.Create(Self);
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


Function TMContVenc.InternalBusca:Boolean;
begin InternalBusca := False;

end;

function TMContVenc.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA NINGUNO********************)
(*                                                                              *)
(*  FORMA DE NINGUNO                                                            *)
(*                                                                              *)
(***********************************************FORMA NINGUNO********************)
procedure TwMContVenc.AsignaEmpresaSuc;
begin
   Objeto.Empresa.FindKey([IntToStr(objeto.Apli.IdEmpresa)]);
   If  Objeto.UnidadNegocio.FindKey([objeto.ParamCre.IDENTIDAD.AsString]) Then Begin
      CBSucursal.Checked := True;
   End;
   EdIdEmpresa.Enabled := objeto.ParamCre.B_MULTIEMPRESA.AsString = 'V';
   bbEmpresa.Enabled := objeto.ParamCre.B_MULTIEMPRESA.AsString = 'V';
   EdIDSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
   BBSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
   CBSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
end;

procedure TwMContVenc.FormShow(Sender: TObject);
begin
   //PINTA DATOS DEL PANEL INFERIOR
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   Objeto.Moneda.Cve_Moneda.Control := edCVE_MONEDA;
   Objeto.Moneda.Desc_Moneda.Control := edDESC_MONEDA;
   Objeto.Moneda.GetParams(Objeto);
   edDESC_MONEDA.Hint := Objeto.Moneda.Desc_Moneda.AsString;
   edDESC_MONEDA.ShowHint := True;

   Objeto.Empresa.ID_Empresa.Control := EdIdEmpresa;
   Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
   Objeto.Empresa.GetParams(Objeto);

   Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
   Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
   Objeto.UnidadNegocio.GetParams(Objeto);

   Objeto.GpoProd.CVE_PRODUCTO_GPO.Control:= edCVE_PRODUCTO_GPO;
   Objeto.GpoProd.DESC_C_PROD_GPO.Control:= edNOM_CVE_PRODUCTO_GPO;
   Objeto.GpoProd.GetParams(Objeto);

   Objeto.IDescontadora.CVE_FND_ENT_DES.Control:= edOPERADO;
   Objeto.IDescontadora.DESC_ENT_DES.Control:= edDescOperado;
   Objeto.IDescontadora.GetParams(Objeto);

   Objeto.CatMin.CVE_CAT_MINIMO.Control :=edCVE_CAT_MINIMO;
   Objeto.CatMin.DESC_CAT_MINIMO.Control :=edDESC_CAT_MINIMO;
   Objeto.CatMin.GetParams(Objeto);
   edDESC_CAT_MINIMO.Hint := Objeto.CatMin.DESC_CAT_MINIMO.AsString;
   edDESC_CAT_MINIMO.ShowHint := True;
   AsignaEmpresaSuc;

   rgSituacion.ItemIndex:= 0;
   rgOrden.ItemIndex:= 1;
   cbxCompactar.Checked:= True;
end;

procedure TwMContVenc.FormDestroy(Sender: TObject);
begin
   Objeto.Moneda.Cve_Moneda.Control := nil;
   Objeto.Moneda.Desc_Moneda.Control := nil;
   Objeto.Empresa.ID_Empresa.Control := nil;
   Objeto.Empresa.PersonaMoral.Nombre.Control := nil;
   Objeto.UnidadNegocio.Id_Entidad.Control := nil;
   Objeto.UnidadNegocio.Desc_Entidad.Control := nil;
   Objeto.GpoProd.CVE_PRODUCTO_GPO.Control:= nil;
   Objeto.GpoProd.DESC_C_PROD_GPO.Control:= nil;
   Objeto.IDescontadora.CVE_FND_ENT_DES.Control:= nil;
   Objeto.IDescontadora.DESC_ENT_DES.Control:= nil;
   Objeto.CatMin.CVE_CAT_MINIMO.Control :=nil;
   Objeto.CatMin.DESC_CAT_MINIMO.Control :=nil;
End;

procedure TwMContVenc.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMContVenc.btCVE_MONEDAClick(Sender: TObject);
begin
   Objeto.Moneda.ShowAll := True;
   if Objeto.Moneda.Busca then Begin
        chbxMoneda.Checked:= True;
        chbxMoneda.Enabled:= True;
        InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TwMContVenc.ilMONEDAEjecuta(Sender: TObject);
begin
    If Objeto.Moneda.FindKey([ilMONEDA.Buffer]) Then Begin
        chbxMoneda.Checked:=True;
        chbxMoneda.Enabled:=True;
        InterForma1.NextTab(edCVE_MONEDA);
    End;
end;

procedure TwMContVenc.edCVE_MONEDAExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edCVE_MONEDA,True,'',True);
end;

procedure TwMContVenc.chbxMonedaClick(Sender: TObject);
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

procedure TwMContVenc.InterForma1BtnPreviewClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMCONTVENC_PREVI',True,True) then
   begin
      //<LOLS 17ENE2006. DIGITALIZACION DE REPORTES>
      ImprimeReporte(True, grPreview );
      //ImprimeReporte(True);
      //</LOLS>
   end;
end;

//<LOLS 17ENE2006. DIGITALIZACION DE REPORTES>
Procedure TwMContVenc.ImprimeReporte(bPreview:Boolean; grOpcion  : TGenRepOption );
//Procedure TwMContVenc.ImprimeReporte(bPreview:Boolean);
//</LOLS>
Var
    sSituacion,sOrden,sTipoProd,sGpoProd:String;
    iSit, iDescDoc: Integer; bSector, bFinSemana: Boolean;
begin
    sGpoProd:= Trim(edCVE_PRODUCTO_GPO.Text);
    bFinSemana:= False;
    bSector:= True;
    iSit:=rgSituacion.ItemIndex;
    Case iSit Of
        0: sSituacion:='IM';  //Impagada
        1: sSituacion:='VE';  //Vencida Exigible
        2: sSituacion:='IV';  //Impagada + Vencida Exigible
        3: Begin
           //<LOLS 20ENE2006. DIGITALIZACION DE REPORTES>
           sSituacion:='IV';    //Indistinta
           //sSituacion:='IM';    //Indistinta
           //</LOLS>
           bFinSemana:= True;
           End;
    End;
    iSit:=rgOrden.ItemIndex;
    Case iSit Of
        0: sOrden:='C'; //Crédito
        1: sOrden:='A'; //Acreditado
    End;

    If (Trim(edF_Vencimiento.Text)='')and(Trim(edF_PROG_PAGO.Text)='')Then
       ShowMessage('Debe indica una fecha de referencia')
    Else If  (rgSituacion.ItemIndex = 3)and (Trim(edF_PROG_PAGO.Text)='') Then Begin
        ShowMessage('Debe indica una fecha de programada de pago')
    End Else Begin

       RepVencimientos( edF_Vencimiento.Text, edF_PROG_PAGO.Text, edCVE_MONEDA.Text,
                   sSituacion, sOrden,
                   'C', // 'O' operativo, 'C' cierre
                   'A', //'A' acumulado, 'D' al día
                   edNbrArch.Text, EdIdEmpresa.Text, EdIDSucursal.Text,
                   sGpoProd, edOPERADO.Text, edCVE_CAT_MINIMO.Text, bSector, bFinSemana,
{roim 26/12/2005 Se agraga Grupo por Promotor Administrador}
//                   cbxBANCO.Checked, cbxCompactar.Checked, rgReporte.ItemIndex, Objeto.Apli, bPreview);
                   cbxBANCO.Checked, cbOrdPromAdmon.Checked, cbxCompactar.Checked, rgReporte.ItemIndex, Objeto.Apli, bPreview
                   //<LOLS 17ENE2006. DIGITALIZACION DE REPORTES>
                   , grOpcion, ''
                   //</LOLS>
                   );
{/roim}
       If Trim(edNbrArch.Text)<>'' Then Begin
          If bGenArch Then
            ShowMessage('El Archivo '+ Trim(edNbrArch.Text)+' se generó correctamente')
          Else
            ShowMessage('No se generó el Archivo')
       End;
    End;
end;
procedure TwMContVenc.InterForma1BtnImprimirClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMCONTVENC_IMPRI',True,True) then
   begin
      //<LOLS 17ENE2006. DIGITALIZACION DE REPORTES>
      ImprimeReporte( False, grPrint );
      //ImprimeReporte(False);
      //<LOLS 17ENE2006. DIGITALIZACION DE REPORTES>
   end;
end;

procedure TwMContVenc.edF_VencimientoChange(Sender: TObject);
begin
    If Trim(edF_Vencimiento.Text)<>'' Then Begin
        chbxF_Ven.Checked:=True;
        chbxF_Ven.Enabled:=True;
    End Else Begin
        chbxF_Ven.Checked:=False;
        chbxF_Ven.Enabled:=False;
    End;
end;

procedure TwMContVenc.chbxF_VenClick(Sender: TObject);
begin
    If not chbxF_Ven.Checked Then Begin
        edF_Vencimiento.Text:='';
        chbxF_Ven.Checked:=False;
        chbxF_Ven.Enabled:=False;
    End;
end;

procedure TwMContVenc.sbExcelClick(Sender: TObject);
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

procedure TwMContVenc.edNbrArchChange(Sender: TObject);
begin
    If Trim(edNbrArch.Text)<>'' Then Begin
        cbxArchivo.Checked:=True;
        cbxArchivo.Enabled:=True;
    End Else Begin
        cbxArchivo.Checked:=False;
        cbxArchivo.Enabled:=False;
    End;
end;

procedure TwMContVenc.cbxArchivoClick(Sender: TObject);
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

procedure TwMContVenc.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TwMContVenc.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMContVenc.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

procedure TwMContVenc.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TwMContVenc.ILSucursalEjecuta(Sender: TObject);
begin
   If  Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMContVenc.btCVE_PRODUCTO_GPOClick(Sender: TObject);
begin
   Objeto.GpoProd.ShowAll := True;
   If Objeto.GpoProd.Busca Then Begin
      CambiaControl;
      InterForma1.NextTab(edCVE_PRODUCTO_GPO);
   End;
end;

procedure TwMContVenc.ilCVE_PRODUCTO_GPOEjecuta(Sender: TObject);
begin
   If Objeto.GpoProd.FindKey([ilCVE_PRODUCTO_GPO.Buffer]) Then Begin
      CambiaControl;
      InterForma1.NextTab(edCVE_PRODUCTO_GPO);
   End;
end;

procedure TwMContVenc.cbxCVE_PRODUCTO_GPOClick(Sender: TObject);
begin
   If not cbxCVE_PRODUCTO_GPO.Checked Then Begin
      Objeto.GpoProd.Active:=False;
      cbxCVE_PRODUCTO_GPO.Checked:=False;
      cbxCVE_PRODUCTO_GPO.Enabled:=False;
   End Else Begin
      cbxCVE_PRODUCTO_GPO.Checked:=True;
      cbxCVE_PRODUCTO_GPO.Enabled:=True;
   End;
end;
Procedure TwMContVenc.CambiaControl;
Begin
   cbxCVE_PRODUCTO_GPO.Checked:=True;
   cbxCVE_PRODUCTO_GPO.Enabled:=True;
End;

procedure TwMContVenc.btCVE_CAT_MINIMOClick(Sender: TObject);
begin
    Objeto.CatMin.ShowAll := True;
    If Objeto.CatMin.Busca Then Begin
        chbxCatMin.Checked:=True;
        chbxCatMin.Enabled:=True;
        InterForma1.NextTab(edCVE_CAT_MINIMO);
    End;
end;

procedure TwMContVenc.ilOperadoPorEjecuta(Sender: TObject);
begin
    Objeto.IDescontadora.BuscaWhereString := ' B_CONTABILIZA =''V'' ';
    Objeto.IDescontadora.FilterString := Objeto.IDescontadora.BuscaWhereString;
    If Objeto.IDescontadora.FindKey([ilOperadoPor.Buffer]) Then Begin
        cbxBANCO.Checked:=False;
        cbxOPERADO.Checked:=True;
        cbxOPERADO.Enabled:=True;
        InterForma1.NextTab(edOPERADO);
    End;
end;

procedure TwMContVenc.chbxCatMinClick(Sender: TObject);
begin
    If not chbxCatMin.Checked Then Begin
        Objeto.CatMin.Active:=False;
        chbxCatMin.Checked:=False;
        chbxCatMin.Enabled:=False;
    End Else Begin
        chbxCatMin.Checked:=True;
        chbxCatMin.Enabled:=True;
    End;
end;

procedure TwMContVenc.BitBtn1Click(Sender: TObject);
begin
    Objeto.IDescontadora.BuscaWhereString := ' B_CONTABILIZA =''V'' ';
    Objeto.IDescontadora.FilterString := Objeto.IDescontadora.BuscaWhereString;
    Objeto.IDescontadora.ShowAll := True;
    If Objeto.IDescontadora.Busca Then Begin
        cbxBANCO.Checked:=False;
        cbxOPERADO.Checked:=True;
        cbxOPERADO.Enabled:=True;
        InterForma1.NextTab(edOPERADO);
    End;
end;

procedure TwMContVenc.cbxOPERADOClick(Sender: TObject);
begin
    If not cbxOPERADO.Checked Then Begin
        Objeto.IDescontadora.Active:=False;
        cbxOPERADO.Checked:=False;
        cbxOPERADO.Enabled:=False;
    End Else Begin
        cbxOPERADO.Checked:=True;
        cbxOPERADO.Enabled:=True;
    End;
end;

procedure TwMContVenc.ilCAT_MINEjecuta(Sender: TObject);
begin
    If Objeto.CatMin.FindKey([ilCAT_MIN.Buffer]) Then Begin
        chbxCatMin.Checked:=True;
        chbxCatMin.Enabled:=True;
        InterForma1.NextTab(edCVE_CAT_MINIMO);
    End;
end;

procedure TwMContVenc.cbxBANCOClick(Sender: TObject);
begin
    If cbxOPERADO.Checked Then
        cbxOPERADO.Checked:=False;
end;

procedure TwMContVenc.cbxF_ProgClick(Sender: TObject);
begin
    If not cbxF_Prog.Checked Then Begin
        edF_PROG_PAGO.Text:='';
        cbxF_Prog.Checked:=False;
        cbxF_Prog.Enabled:=False;
    End;
end;

procedure TwMContVenc.edF_PROG_PAGOChange(Sender: TObject);
begin
    If Trim(edF_PROG_PAGO.Text)<>'' Then Begin
        cbxF_Prog.Checked:=True;
        cbxF_Prog.Enabled:=True;
    End Else Begin
        cbxF_Prog.Checked:=False;
        cbxF_Prog.Enabled:=False;
    End;
end;

end.

