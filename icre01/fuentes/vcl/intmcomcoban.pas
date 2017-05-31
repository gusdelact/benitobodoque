// Sistema         : ICre01
// Fecha de Inicio : 04/09/2006
// Función forma   : Clase de IntMComCobAn
// Desarrollo por  : Intercase JMML
// Diseñado por    : Intercase JMML
// Comentarios     :

Unit IntMComCobAn;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,InterEdit,

IntParamCre,      //Parámetros Crédito
IntMon,           //Moneda
IntCrAcredit,     //Acreditado
IntCrCredito,     //Disposición
IntEmpre,         //Empresa
IntUnNeg,         //Unidad Negocio/Suc
IntCrProduct,     //Producto de crédito
IntCrCatComi
;

Type
 TMComCobAn= class;

  TwMComCobAn=Class(TForm)
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
    edACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    ilACREDITADO: TInterLinkit;
    cbxAcreditado: TCheckBox;
    Label5: TLabel;
    edDisposicion: TEdit;
    btDisposicion: TBitBtn;
    ilDisposicion: TInterLinkit;
    edNomDisposicion: TEdit;
    cbxDisposicion: TCheckBox;
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
    cbxComision: TCheckBox;
    ilCOMISION: TInterLinkit;
    cbxProducto: TCheckBox;
    Label6: TLabel;
    edCVE_PRODUCTO_CRE: TEdit;
    btPRODUCTO_CRE: TBitBtn;
    edDESC_PRODUCTO_CRE: TEdit;
    ilPRODUCTO_CRE: TInterLinkit;
    lbCVE_MONEDA: TLabel;
    edCVE_MONEDA: TEdit;
    btCVE_MONEDA: TBitBtn;
    edDESC_MONEDA: TEdit;
    cbxMoneda: TCheckBox;
    ilMONEDA: TInterLinkit;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    edFCierre: TEdit;
    dtpFCierre: TInterDateTimePicker;
    Label1: TLabel;
    edFDevenga: TEdit;
    InterDateTimePicker1: TInterDateTimePicker;
    Label7: TLabel;
    sbExcel: TSpeedButton;
    edNbrArch: TEdit;
    SaveDialog1: TSaveDialog;
    cbxArchivo: TCheckBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure cbxAcreditadoClick(Sender: TObject);
    procedure btDisposicionClick(Sender: TObject);
    procedure cbxDisposicionClick(Sender: TObject);
    procedure ilDisposicionCapture(Sender: TObject; var Show: Boolean);
    procedure ilDisposicionEjecuta(Sender: TObject);
    procedure bbEmpresaClick(Sender: TObject);
    procedure BBSucursalClick(Sender: TObject);
    procedure ilEmpresaEjecuta(Sender: TObject);
    procedure ILSucursalEjecuta(Sender: TObject);
    procedure CBSucursalClick(Sender: TObject);
    procedure btPRODUCTO_CREClick(Sender: TObject);
    procedure ilPRODUCTO_CREEjecuta(Sender: TObject);
    procedure cbxProductoClick(Sender: TObject);
    procedure btCVE_COMISIONClick(Sender: TObject);
    procedure ilCOMISIONEjecuta(Sender: TObject);
    procedure ilPRODUCTO_GPOCapture(Sender: TObject; var Show: Boolean);
    procedure ilPRODUCTO_CRECapture(Sender: TObject; var Show: Boolean);
    procedure ilCOMISIONCapture(Sender: TObject; var Show: Boolean);
    procedure btCVE_MONEDAClick(Sender: TObject);
    procedure ilMONEDACapture(Sender: TObject; var Show: Boolean);
    procedure ilMONEDAEjecuta(Sender: TObject);
    procedure cbxMonedaClick(Sender: TObject);
    procedure cbxComisionClick(Sender: TObject);
    procedure edFCierreExit(Sender: TObject);
    procedure edFCierreChange(Sender: TObject);
    procedure sbExcelClick(Sender: TObject);
    procedure cbxArchivoClick(Sender: TObject);
    procedure edNbrArchChange(Sender: TObject);
    private
    { Private declarations }
     procedure EnableCheckBox(var CheckBox : TCheckBox);
     procedure ImprimeReporte(bPreview : Boolean);
     Procedure AsignaEmpresaSuc;
     procedure VerificaFechaCtrls(pedFecha: TEdit; pdtpFecha: TDateTimePicker);
    public
    { Public declarations }
    Objeto : TMComCobAn;
    end;


 TMComCobAn= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        Moneda                  : TMoneda;
        CrCredito               : TCrCredito;
        ParamCre                : TParamCre;
        Acreditado              : TCrAcredit;
        UnidadNegocio           : TUnNegocio;
        Empresa                 : TEmpresa;
        Producto                : TCrProduct;
        Comision                : TCrCatComi;

        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;

implementation
{$R *.DFM}
Uses
    IntMQrComCobAn;      //Reporte de Comisiones Cobradas por Anticipado

constructor TMComCobAn.Create( AOwner : TComponent );
begin Inherited;
      Moneda := TMoneda.Create(Self);
      Moneda.MasterSource := Self;

      CrCredito := TCrCredito.Create(Self);
      CrCredito.MasterSource := Self;

      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource := Self;

      Empresa := TEmpresa.Create(Self);
      UnidadNegocio := TUnNegocio.Create(Self);

      Producto := TCrProduct.Create(Self);
      Producto.MasterSource := Self;

      Comision := TCrCatComi.Create(Self);
      Comision.MasterSource := Self;

      StpName  := ' ';
      UseQuery := False;
      HelpFile := '';
      ShowMenuReporte:=True;
end;

Destructor TMComCobAn.Destroy;
begin
   If Moneda <> Nil Then
      Moneda.Free;
   If CrCredito <> Nil Then
      CrCredito.Free;
   If Acreditado <> Nil Then
      Acreditado.Free;
   If Empresa <> Nil Then
      Empresa.free;
   If UnidadNegocio <> Nil Then
      UnidadNegocio.Free;
   If Producto <> Nil Then
      Producto.Free;
   If Comision <> Nil Then
      Comision.Free;
   inherited;
end;

function TMComCobAn.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMComCobAn;
begin
   W:=TwMComCobAn.Create(Self);
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
procedure TwMComCobAn.AsignaEmpresaSuc;
begin
    Objeto.Empresa.FindKey([IntToStr(objeto.Apli.IdEmpresa)]);

    If  Objeto.UnidadNegocio.FindKey([objeto.ParamCre.IDENTIDAD.AsString]) Then
        CBSucursal.Checked := True;

    EdIdEmpresa.Enabled := objeto.ParamCre.B_MULTIEMPRESA.AsString = 'V';
    bbEmpresa.Enabled := objeto.ParamCre.B_MULTIEMPRESA.AsString = 'V';

    EdIDSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
    BBSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
    CBSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
end;

procedure TwMComCobAn.FormShow(Sender: TObject);
begin
    lbDempresa.Caption := Objeto.ParamCre.EMPRESA.AsString;
    lbDfecha.Caption   := Objeto.ParamCre.FECHA.AsString;
    lbDUsuario.Caption := Objeto.ParamCre.USUARIO.AsString;
    lbDPerfil.Caption  := Objeto.ParamCre.PERFIL.AsString;

    Objeto.Moneda.Cve_Moneda.Control := edCVE_MONEDA;
    Objeto.Moneda.Desc_Moneda.Control := edDESC_MONEDA;
    Objeto.Moneda.GetParams(Objeto);

    Objeto.CrCredito.ID_CREDITO.Control := edDisposicion;
    Objeto.CrCredito.ContratoCre.Producto.DESC_C_PRODUCTO.Control := edNomDisposicion;
    Objeto.CrCredito.GetParams(Objeto);

    Objeto.Acreditado.ID_ACREDITADO.Control := edACREDITADO;
    Objeto.Acreditado.Persona.Nombre.Control := edNOMBRE_ACRED;
    Objeto.Acreditado.GetParams(Objeto);

    Objeto.Producto.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO_CRE;
    Objeto.Producto.DESC_L_PRODUCTO.Control := edDESC_PRODUCTO_CRE;
    Objeto.Producto.GetParams(Objeto);

    Objeto.Comision.CVE_COMISION.Control := edCVE_COMISION;
    Objeto.Comision.DESC_COMISION.Control := edDESC_COMISION;
    Objeto.Comision.GetParams(Objeto);

    Objeto.Empresa.ID_Empresa.Control := edIdEmpresa;
    Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
    Objeto.Empresa.GetParams(Objeto);

    Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
    Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
    Objeto.UnidadNegocio.GetParams(Objeto);

    AsignaEmpresaSuc;

    edFCierre.Text := FormatDateTime('DD/MM/YYYY',Objeto.Apli.DameFechaEmpresa);
    dtpFCierre.DateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
end;

procedure TwMComCobAn.FormDestroy(Sender: TObject);
begin
    Objeto.Moneda.Cve_Moneda.Control := Nil;
    Objeto.Moneda.Desc_Moneda.Control := Nil;
    Objeto.CrCredito.ID_CREDITO.Control := Nil;
    Objeto.CrCredito.ContratoCre.Producto.DESC_C_PRODUCTO.Control := Nil;
    Objeto.Acreditado.ID_ACREDITADO.Control := Nil;
    Objeto.Acreditado.Persona.Nombre.Control := Nil;
    Objeto.Producto.CVE_PRODUCTO_CRE.Control := Nil;
    Objeto.Producto.DESC_L_PRODUCTO.Control := Nil;
    Objeto.Comision.CVE_COMISION.Control := Nil;
    Objeto.Comision.DESC_COMISION.Control := Nil;
    Objeto.Empresa.ID_Empresa.Control := Nil;
    Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;
    Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
    Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;
end;

procedure TwMComCobAn.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMComCobAn.EnableCheckBox(var CheckBox : TCheckBox);
begin
    If Not CheckBox.Checked Then Begin
        CheckBox.Checked:=False;
        CheckBox.Enabled:=False;
    End Else Begin
        CheckBox.Checked:=True;
        CheckBox.Enabled:=True;
    End;
end;

procedure TwMComCobAn.ImprimeReporte(bPreview : Boolean);
begin
    Objeto.GetFromControl;

 if StrToDate(edFDevenga.Text) > StrToDate(edFCierre.Text) then
    begin
    ShowMessage(' ATENCIÓN: La Fecha Devengación NO puede ser mayor a la Fecha Cierre.');
    end
    else
    begin

      RepComCobAnt( Objeto.Moneda.Cve_Moneda.AsString,
                    Objeto.Producto.CVE_PRODUCTO_CRE.AsString,
                    Objeto.CrCredito.ID_CREDITO.AsString,
                    Objeto.Comision.CVE_COMISION.AsString,
                    Objeto.Acreditado.ID_ACREDITADO.AsString,
                    Objeto.Empresa.ID_Empresa.AsString,
                    edFCierre.Text,
                    edFDevenga.Text, // se agrega parámetro de Fecha Inicio Devengación JFOF 27/11/2012
                    edNbrArch.Text,  // se agrega parámetro para salida a Excel
                    Objeto.Apli, bPreview);

           if Trim(edNbrArch.Text) <> '' then
            begin
               if  bGenArch then
                 ShowMessage('     ¡ Archivo Generado !')
               else
                 ShowMessage('     ¡ No se generó el Archivo !')
            end;
    end;

End;

procedure TwMComCobAn.InterForma1BtnImprimirClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMCOMCOBAN_IMPRI',True,True) then
    ImprimeReporte(False);
end;

procedure TwMComCobAn.InterForma1BtnPreviewClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMCOMCOBAN_PREVI',True,True) then
    ImprimeReporte(True);
end;

procedure TwMComCobAn.btACREDITADOClick(Sender: TObject);
begin
    Objeto.Acreditado.ShowAll := True;

    If Objeto.Acreditado.Busca Then Begin
        cbxAcreditado.Checked:= True;
        cbxAcreditado.Enabled:= True;
        InterForma1.NextTab(edACREDITADO);
    End;
end;

procedure TwMComCobAn.ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
begin
    Show:= True;
end;

procedure TwMComCobAn.ilACREDITADOEjecuta(Sender: TObject);
begin
    If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
        cbxAcreditado.Checked:=True;
        cbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
    End;
end;

procedure TwMComCobAn.cbxAcreditadoClick(Sender: TObject);
begin
    EnableCheckBox(cbxAcreditado);
    Objeto.Acreditado.Active := cbxAcreditado.Checked;
end;

procedure TwMComCobAn.btDisposicionClick(Sender: TObject);
begin
    Objeto.CrCredito.ShowAll := True;

    If Objeto.CrCredito.Busca Then Begin
        cbxDisposicion.Checked:=True;
        cbxDisposicion.Enabled:=True;
        InterForma1.NextTab(edDisposicion);
    End;
end;

procedure TwMComCobAn.cbxDisposicionClick(Sender: TObject);
begin
    EnableCheckBox(cbxDisposicion);
    Objeto.CrCredito.Active := cbxDisposicion.Checked;
end;

procedure TwMComCobAn.ilDisposicionCapture(Sender: TObject; var Show: Boolean);
begin
    Show:= True;
end;

procedure TwMComCobAn.ilDisposicionEjecuta(Sender: TObject);
begin
    If Objeto.CrCredito.FindKey([ilDisposicion.Buffer]) Then Begin
        cbxDisposicion.Checked:=True;
        cbxDisposicion.Enabled:=True;
        InterForma1.NextTab(edDisposicion);
    End;
end;

procedure TwMComCobAn.bbEmpresaClick(Sender: TObject);
begin
    Objeto.Empresa.ShowAll := True;
    Objeto.Empresa.Busca;
end;

procedure TwMComCobAn.BBSucursalClick(Sender: TObject);
begin
    If Objeto.UnidadNegocio.Busca Then
        CBSucursal.Checked := True;
end;

procedure TwMComCobAn.ilEmpresaEjecuta(Sender: TObject);
begin
    Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TwMComCobAn.ILSucursalEjecuta(Sender: TObject);
begin
    If Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then
        CBSucursal.Checked := True;
end;

procedure TwMComCobAn.CBSucursalClick(Sender: TObject);
begin
    If Not(CBSucursal.Checked) Then Begin
        EdIDSucursal.Clear;
        EdDescSucursal.Clear;
        Objeto.UnidadNegocio.Active := False;
        CBSucursal.Checked := False;
    End;
end;

procedure TwMComCobAn.btPRODUCTO_CREClick(Sender: TObject);
begin
    Objeto.Producto.ShowAll := True;

    If Objeto.Producto.Busca Then Begin
        cbxProducto.Checked:=True;
        cbxProducto.Enabled:=True;
        InterForma1.NextTab(edCVE_PRODUCTO_CRE);
    End;
end;

procedure TwMComCobAn.ilPRODUCTO_CREEjecuta(Sender: TObject);
begin
    If Objeto.Producto.FindKey([ilPRODUCTO_CRE.Buffer]) Then Begin
        cbxProducto.Checked:=True;
        cbxProducto.Enabled:=True;
        InterForma1.NextTab(edCVE_PRODUCTO_CRE);
    End;
end;

procedure TwMComCobAn.cbxProductoClick(Sender: TObject);
begin
    EnableCheckBox(cbxProducto);
    Objeto.Producto.Active := cbxProducto.Checked;
end;

procedure TwMComCobAn.btCVE_COMISIONClick(Sender: TObject);
begin
    Objeto.Comision.ShowAll := True;

    If Objeto.Comision.Busca Then Begin
        cbxCOMISION.Checked:=True;
        cbxCOMISION.Enabled:=True;
        InterForma1.NextTab(edCVE_COMISION);
    End;
end;

procedure TwMComCobAn.ilCOMISIONEjecuta(Sender: TObject);
begin
    If Objeto.Comision.FindKey([ilCOMISION.Buffer]) Then Begin
        cbxCOMISION.Checked:=True;
        cbxCOMISION.Enabled:=True;
        InterForma1.NextTab(edCVE_COMISION);
    End;
end;

procedure TwMComCobAn.ilPRODUCTO_GPOCapture(Sender: TObject; var Show: Boolean);
begin
    Show:= True;
end;

procedure TwMComCobAn.ilPRODUCTO_CRECapture(Sender: TObject; var Show: Boolean);
begin
    Show:= True;
end;

procedure TwMComCobAn.ilCOMISIONCapture(Sender: TObject; var Show: Boolean);
begin
    Show:= True;
end;

procedure TwMComCobAn.btCVE_MONEDAClick(Sender: TObject);
begin
    Objeto.Moneda.ShowAll := True;

    If Objeto.Moneda.Busca Then begin
        cbxMoneda.Checked:=True;
        cbxMoneda.Enabled:=True;
        InterForma1.NextTab(edCVE_MONEDA);
    End;
end;

procedure TwMComCobAn.ilMONEDACapture(Sender: TObject; var Show: Boolean);
begin
    Show := True;
end;

procedure TwMComCobAn.ilMONEDAEjecuta(Sender: TObject);
begin
    If Objeto.Moneda.FindKey([ilMONEDA.Buffer]) Then Begin
        cbxMoneda.Checked:=True;
        cbxMoneda.Enabled:=True;
        InterForma1.NextTab(edCVE_MONEDA);
    End;
end;

procedure TwMComCobAn.cbxMonedaClick(Sender: TObject);
begin
    EnableCheckBox(cbxMoneda);
    Objeto.Moneda.Active := cbxMoneda.Checked;
end;

procedure TwMComCobAn.cbxComisionClick(Sender: TObject);
begin
    EnableCheckBox(cbxComision);
    Objeto.Comision.Active := cbxComision.Checked;
end;

procedure TwMComCobAn.VerificaFechaCtrls(pedFecha: TEdit; pdtpFecha: TDateTimePicker);
begin
     Try
        If Trim(pedFecha.Text) <> '' Then
            pdtpFecha.Date := StrToDate(pedFecha.Text)
        Else Begin
            pedFecha.Text := FormatDateTime('DD/MM/YYYY',Objeto.Apli.DameFechaEmpresa);
            pdtpFecha.Date := StrToDate(pedFecha.Text);
        End;
     Except
        pedFecha.Text := FormatDateTime('DD/MM/YYYY',Objeto.Apli.DameFechaEmpresa);
        pdtpFecha.Date := StrToDate(pedFecha.Text);
     End;
end;

procedure TwMComCobAn.edFCierreExit(Sender: TObject);
begin
    VerificaFechaCtrls(edFCierre, dtpFCierre);
end;

procedure TwMComCobAn.edFCierreChange(Sender: TObject);
var
  vlsql1, vlfirstday : String;
begin
   vlsql1 := 'SELECT TRUNC(ADD_MONTHS(TO_DATE('''+edFCierre.Text+''',''dd/mm/yyyy''), 0), ''MM'') "FECHA" FROM DUAL';
    GetSqlStr(vlsql1, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'FECHA', vlfirstday, False);
    edFDevenga.Text := vlfirstday;
end;

procedure TwMComCobAn.sbExcelClick(Sender: TObject);
var sExt : String;
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

procedure TwMComCobAn.cbxArchivoClick(Sender: TObject);
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

procedure TwMComCobAn.edNbrArchChange(Sender: TObject);
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
