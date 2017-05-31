// Sistema         : Clase de MRCoCaMor
// Fecha de Inicio : 12/04/2012
// Función forma   : Clase de MRCoCaMo
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Juan Francisco Ortega Flores
// Comentarios     :
Unit IntMrcocamor;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,

IntParamCre, InterEdit,


IntCrAcredit,     //Acreditado
IntCrCredito,     //Disposición
IntCrProduct,     //Producto de crédito
IntCrCto,         //Contrato - Autorizacion
Intempre,         //Empresa
IntUnNeg,         //Unidad Negocio/Suc
IntMQrCaMor,      // REPORTE
IntLinkit
;

Type
 TMrcocamor= class;

  TWMrcocamor=Class(TForm)
    InterForma1             : TInterForma;
    edF_CORTEIni: TEdit;
    dtpF_CORTEIni: TInterDateTimePicker;
    lbF_CORTEFin: TLabel;
    edF_CORTEFin: TEdit;
    dtpF_CORTEFin: TInterDateTimePicker;
    edCVE_PRODUCTO_CRE: TEdit;
    btPRODUCTO: TBitBtn;
    edDESC_PRODUCTO1: TEdit;
    chbxProducto: TCheckBox;
    edID_CESION: TEdit;
    btID_CESION: TBitBtn;
    edCESION: TEdit;
    chbxCESION: TCheckBox;
    edACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    chbxAcreditado: TCheckBox;
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
    Label5: TLabel;
    sbExcel: TSpeedButton;
    edNbrArch: TEdit;
    SaveDialog1: TSaveDialog;
    cbxArchivo: TCheckBox;
    edID_CONTRATO: TInterEdit;
    btCONTRATO: TBitBtn;
    edCVE_PRODUCTO: TEdit;
    edDESC_PRODUCTO: TEdit;
    chbxAutorizacion: TCheckBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    ilIDCONTRATO: TInterLinkit;
    ilPRODUCTO: TInterLinkit;
    ilCesion: TInterLinkit;
    ilACREDITADO: TInterLinkit;
    ilEmpresa: TInterLinkit;
    ILSucursal: TInterLinkit;
    RadioGroup1: TRadioGroup;
    RbComis: TRadioButton;
    RbCast: TRadioButton;
    RbMor: TRadioButton;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure ilIDCONTRATOCapture(Sender: TObject; var Show: Boolean);
    procedure ilIDCONTRATOEjecuta(Sender: TObject);
    procedure ilPRODUCTOCapture(Sender: TObject; var Show: Boolean);
    procedure ilPRODUCTOEjecuta(Sender: TObject);
    procedure ilCesionCapture(Sender: TObject; var Show: Boolean);
    procedure ilCesionEjecuta(Sender: TObject);
    procedure ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure bbEmpresaClick(Sender: TObject);
    procedure BBSucursalClick(Sender: TObject);
    procedure ilEmpresaEjecuta(Sender: TObject);
    procedure ILSucursalEjecuta(Sender: TObject);
    procedure CBSucursalClick(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure btID_CESIONClick(Sender: TObject);
    procedure btPRODUCTOClick(Sender: TObject);
    procedure btCONTRATOClick(Sender: TObject);
    procedure chbxAcreditadoClick(Sender: TObject);
    procedure chbxCESIONClick(Sender: TObject);
    procedure chbxProductoClick(Sender: TObject);
    procedure chbxAutorizacionClick(Sender: TObject);
    procedure sbExcelClick(Sender: TObject);
    procedure cbxArchivoClick(Sender: TObject);
    procedure ImprimeReporte(bPreview: Boolean);
    procedure edNbrArchChange(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);

    private
    { Private declarations }
    Procedure AsignaEmpresaSuc;

    public 
    { Public declarations } 
    Objeto : TMrcocamor;
end; 
 TMrcocamor= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }

//        CAMPO1                   : TInterCampo;
        ParamCre    : TParamCre;

        ContratoCre : TCrCto;     // Contrato Crédito
        Acreditado  : TCrAcredit; // Acreditado
        Credito     : TCrCredito; // Disposición
        Producto    : TCrProduct; // Producto de Credito
        Empresa     : TEmpresa;   // Empresa
        UnidadNegocio : TUnNegocio; //Sucursal        

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


constructor TMrcocamor.Create( AOwner : TComponent ); 
begin Inherited;

      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource := Self;

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
      Credito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

      Producto :=  TCrProduct.Create(Self);
      Producto.MasterSource:=Self;
      Producto.FieldByName('CVE_PRODUCTO_CRE').MasterField:='CVE_PRODUCTO_CRE';

      ContratoCre := TCrCto.Create(Self);
      ContratoCre.MasterSource:=Self;
      ContratoCre.FieldByName('ID_CONTRATO').MasterField:='ID_CONTRATO';
      ContratoCre.FieldByName('FOL_CONTRATO').MasterField:='FOL_CONTRATO';

      // Empresa
      Empresa := TEmpresa.Create(Self);
      // Sucursal
      UnidadNegocio := TUnNegocio.Create(Self);

      StpName  := ' '; 
      UseQuery := False; 
      HelpFile := 'IntMrcocamor.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMrcocamor.Destroy;
begin

   if Empresa <> nil then
      Empresa.free;
   if UnidadNegocio <> nil then
      UnidadNegocio.Free;
   if Producto <> nil then
      Producto.Free;
   If Acreditado <> Nil Then
      Acreditado.Free;
   If Credito <> Nil Then
      Credito.Free;
   if ContratoCre <> nil then
      ContratoCre.Free;

inherited;
end;


function TMrcocamor.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMrcocamor;
begin
   W:=TWMrcocamor.Create(Self);
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


Function TMrcocamor.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('IMrcocam.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TMrcocamor.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA MRCoCaMor********************)
(*                                                                              *)
(*  FORMA DE MRCoCaMor                                                            *)
(*                                                                              *)
(***********************************************FORMA MRCoCaMor********************)

procedure TWMrcocamor.FormShow(Sender: TObject);
begin
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;


      //ACREDITADO
      Objeto.Acreditado.ID_ACREDITADO.Control := edACREDITADO;
      Objeto.Acreditado.Persona.Nombre.Control := edNOMBRE_ACRED;
      Objeto.Acreditado.GetParams(Objeto);
      edNOMBRE_ACRED.Hint := Objeto.Acreditado.Persona.Nombre.AsString;
      edNOMBRE_ACRED.ShowHint := True;

      //CESION
      Objeto.Credito.ID_CREDITO.Control := edID_CESION;
      Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := edCESION;
      Objeto.Credito.GetParams(Objeto);
      edCESION.Hint := Objeto.Credito.ContratoCre.Contrato.TITNombre.AsString;
      edCESION.ShowHint := True;

      //PRODUCTO DE CREDITO
      Objeto.Producto.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO_CRE;
      Objeto.Producto.DESC_C_PRODUCTO.Control := edDESC_PRODUCTO1;
      Objeto.Producto.GetParams(Objeto);
      edDESC_PRODUCTO1.Hint := Objeto.Producto.DESC_C_PRODUCTO.AsString;
      edDESC_PRODUCTO1.ShowHint := True;

      //CONTRATO
      Objeto.ContratoCre.ID_CONTRATO.Control := edID_CONTRATO;
      Objeto.ContratoCre.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO;
      Objeto.ContratoCre.Producto.DESC_C_PRODUCTO.Control :=edDESC_PRODUCTO;
      edDESC_PRODUCTO.Hint := Objeto.ContratoCre.Producto.DESC_C_PRODUCTO.AsString;
      edDESC_PRODUCTO.ShowHint := True;

      //EMPRESA
      Objeto.Empresa.ID_Empresa.Control := EdIdEmpresa;
      Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
      Objeto.Empresa.GetParams(Objeto);

      //SUCURSAL
      Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
      Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
      Objeto.UnidadNegocio.GetParams(Objeto);

      AsignaEmpresaSuc;

end;

procedure TWMrcocamor.FormDestroy(Sender: TObject);
begin

     Objeto.Acreditado.ID_ACREDITADO.Control := nil;
     Objeto.Acreditado.Persona.Nombre.Control := nil;

     Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := nil;
     Objeto.Credito.ID_CREDITO.Control := nil;

     Objeto.Producto.CVE_PRODUCTO_CRE.Control := nil;
     Objeto.Producto.DESC_C_PRODUCTO.Control := nil;

     Objeto.ContratoCre.ID_CONTRATO.Control := nil;
     Objeto.ContratoCre.CVE_PRODUCTO_CRE.Control :=nil;
     Objeto.ContratoCre.Producto.DESC_C_PRODUCTO.Control :=nil;

     Objeto.Empresa.ID_Empresa.Control := Nil;
     Objeto.Empresa.PersonaMoral.Nombre.Control := Nil;

     Objeto.UnidadNegocio.Id_Entidad.Control := Nil;
     Objeto.UnidadNegocio.Desc_Entidad.Control := Nil;

end;

procedure TWMrcocamor.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWMrcocamor.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWMrcocamor.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWMrcocamor.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWMrcocamor.ilIDCONTRATOCapture(Sender: TObject;
  var Show: Boolean);
begin
    Show := True;
end;

procedure TWMrcocamor.ilIDCONTRATOEjecuta(Sender: TObject);
begin
   If Objeto.ContratoCre.FindKey([ilIDCONTRATO.Buffer,'1']) Then Begin
      chbxAutorizacion.Checked:=True;
      chbxAutorizacion.Enabled:=True;
      InterForma1.NextTab(edID_CONTRATO);
   End;
end;

procedure TWMrcocamor.ilPRODUCTOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TWMrcocamor.ilPRODUCTOEjecuta(Sender: TObject);
begin
    If Objeto.Producto.FindKey([ilPRODUCTO.Buffer])Then Begin
       chbxProducto.Checked:=True;
       chbxProducto.Enabled:=True;
       InterForma1.NextTab(edCVE_PRODUCTO_CRE);
    End;
end;

procedure TWMrcocamor.ilCesionCapture(Sender: TObject; var Show: Boolean);
begin
   Show:=True;
end;

procedure TWMrcocamor.ilCesionEjecuta(Sender: TObject);
begin
    If  Objeto.Credito.FindKey([ilCesion.Buffer]) Then Begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
        InterForma1.NextTab(edID_CESION);
    End;
end;

procedure TWMrcocamor.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TWMrcocamor.ilACREDITADOEjecuta(Sender: TObject);
begin
    If  Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
    End;
end;

(*********************************************************************************)
(*   Bloque para implementar el campo de captura :   EMPRESA                     *)
(*********************************************************************************)

procedure TWMrcocamor.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TWMrcocamor.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;


(*********************************************************************************)
(*   Bloque para implementar el campo de captura :   SUCURSAL                    *)
(*********************************************************************************)

procedure TWMrcocamor.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TWMrcocamor.ILSucursalEjecuta(Sender: TObject);
begin
   If  Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;

end;

procedure TWMrcocamor.CBSucursalClick(Sender: TObject);
begin
    If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;



procedure TWMrcocamor.AsignaEmpresaSuc;
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

procedure TWMrcocamor.btACREDITADOClick(Sender: TObject);
begin
   Objeto.Acreditado.ShowAll := True;
   If Objeto.Acreditado.Busca Then
   Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
   End;
end;

procedure TWMrcocamor.btID_CESIONClick(Sender: TObject);
begin
   Objeto.Credito.ShowAll := True;
   if Objeto.Credito.Busca then
   begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
        InterForma1.NextTab(edID_CESION);
   End;
end;

procedure TWMrcocamor.btPRODUCTOClick(Sender: TObject);
begin
    Objeto.Producto.ShowAll := True;
    if Objeto.Producto.Busca Then
    Begin
        chbxProducto.Checked:= True;
        chbxProducto.Enabled:= True;
        InterForma1.NextTab(edCVE_PRODUCTO_CRE);
    end;
end;

procedure TWMrcocamor.btCONTRATOClick(Sender: TObject);
begin
   Objeto.ContratoCre.ShowAll := True;
   If Objeto.ContratoCre.Busca Then
   Begin
        chbxAutorizacion.Checked:=True;
        chbxAutorizacion.Enabled:=True;
       InterForma1.NextTab(btCONTRATO);
   End;
end;

procedure TWMrcocamor.chbxAcreditadoClick(Sender: TObject);
begin
    If not chbxAcreditado.Checked Then Begin
        Objeto.Acreditado.Active:=False;
        chbxAcreditado.Checked:=False;
        chbxAcreditado.Enabled:=False;
        edACREDITADO.Text:='';
        edNOMBRE_ACRED.Text:='';
    End Else Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
    End;
end;

procedure TWMrcocamor.chbxCESIONClick(Sender: TObject);
begin
    If not chbxCESION.Checked Then Begin
        Objeto.Credito.Active:=False;
        chbxCESION.Checked:=False;
        chbxCESION.Enabled:=False;
        edID_CESION.Text:='';
        edCESION.Text:='';

    End Else Begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
    End;
end;

procedure TWMrcocamor.chbxProductoClick(Sender: TObject);
begin
    If not chbxProducto.Checked Then Begin
        Objeto.Producto.Active:=False;
        chbxProducto.Checked:=False;
        chbxProducto.Enabled:=False;
        edCVE_PRODUCTO_CRE.Text:='';
        edDESC_PRODUCTO1.Text:='';
    End Else Begin
        chbxProducto.Checked:=True;
        chbxProducto.Enabled:=True;
    End;
end;

procedure TWMrcocamor.chbxAutorizacionClick(Sender: TObject);
begin
    If not chbxAutorizacion.Checked Then Begin
        Objeto.ContratoCre.Active:=False;
        chbxAutorizacion.Checked:=False;
        chbxAutorizacion.Enabled:=False;
    End Else Begin
        chbxAutorizacion.Checked:=True;
        chbxAutorizacion.Enabled:=True;
    End;
end;

procedure TWMrcocamor.sbExcelClick(Sender: TObject);
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

procedure TWMrcocamor.cbxArchivoClick(Sender: TObject);
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

procedure TWMrcocamor.ImprimeReporte(bPreview: Boolean);
var tiprep : String;
begin

    if RbComis.Checked then
       tiprep := 'CMS';

    if RbCast.Checked then
       tiprep := 'CAS';

    if RbMor.Checked then
       tiprep := 'MOR';


    if (Trim(edF_CORTEIni.Text)= '') or (Trim(edF_CORTEFin.Text)= '') then
       ShowMessage('    Favor de Validar Fechas')
    else
    begin
         RepCocamor( edF_CORTEIni.Text, edF_CORTEFin.Text , edACREDITADO.Text,
                   edID_CESION.Text, edCVE_PRODUCTO_CRE.Text, edID_CONTRATO.Text,
                   EdIdEmpresa.Text, EdIDSucursal.Text, edNbrArch.Text, tiprep,
                   bPreview        , Objeto.Apli        );




         if Trim(edNbrArch.Text)<>'' then
         begin
            if  bGenArch then
              ShowMessage('    El Archivo se generó correctamente')
            else
              ShowMessage('    No se generó el Archivo')
         end;
    end;
end;

procedure TWMrcocamor.edNbrArchChange(Sender: TObject);
begin
   If Trim(edNbrArch.Text)<>'' Then Begin
        cbxArchivo.Checked := True;
        cbxArchivo.Enabled := True;
    End Else Begin
        cbxArchivo.Checked := False;
        cbxArchivo.Enabled := False;
    End;
end;

procedure TWMrcocamor.InterForma1BtnImprimirClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMRCOCAMOR_IMPRI',True,True) then
      ImprimeReporte(False);
end;

procedure TWMrcocamor.InterForma1BtnPreviewClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMRCOCAMOR_PREVI',True,True) then
      ImprimeReporte(True);
end;

end.
