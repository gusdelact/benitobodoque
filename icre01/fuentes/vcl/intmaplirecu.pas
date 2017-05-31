// Sistema         : Clase de MProVeMa
// Fecha de Inicio : 10/08/2009
// Función forma   : Clase de MProVeMa           
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Manuel Romero Ibarra
// Comentarios     :      
                 

Unit IntMApliRecu;

interface
                   
uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,

IntCrProduct,     //Producto de crédito
IntMon,           //Moneda
IntCrAcredit,     //Acreditado
IntMPers,         //PromotorAsoc
IntCrCredito,     //Disposición
IntMProdGpo,      //GrupoProducto
IntEmple,         //Empleado
IntQrAplicRecu2,  //Reporte
IntParamCre, IntLinkit
;

Type
 TMApliRecu= class;

  TWMApliRecu=Class(TForm)
    InterForma1             : TInterForma;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    lbLiqF_INICIO: TLabel;
    edF_Vencimiento: TEdit;
    dtpF_Vencimiento: TInterDateTimePicker;
    lbCVE_PRODUCTO_CRE: TLabel;
    edCVE_PRODUCTO_CRE: TEdit;
    btPRODUCTO: TBitBtn;
    edDESC_PRODUCTO1: TEdit;
    lbAplica: TLabel;
    chbxProducto: TCheckBox;
    Label1: TLabel;
    edACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    chbxAcreditado: TCheckBox;
    Label2: TLabel;
    edID_CESION: TEdit;
    btID_CESION: TBitBtn;
    edCESION: TEdit;
    chbxCESION: TCheckBox;
    Label8: TLabel;
    edCVE_PRODUCTO_GPO: TEdit;
    btCVE_PRODUCTO_GPO: TBitBtn;
    edNOM_CVE_PRODUCTO_GPO: TEdit;
    cbxCVE_PRODUCTO_GPO: TCheckBox;
    lbCVE_MONEDA: TLabel;
    edCVE_MONEDA: TEdit;
    btCVE_MONEDA: TBitBtn;
    edDESC_MONEDA: TEdit;
    chbxMoneda: TCheckBox;
    ilPRODUCTO: TInterLinkit;
    ilMONEDA: TInterLinkit;
    ilACREDITADO: TInterLinkit;
    ilCesion: TInterLinkit;
    ilCVE_PRODUCTO_GPO: TInterLinkit;
    Label5: TLabel;
    sbExcel: TSpeedButton;
    edNbrArch: TEdit;
    cbxArchivo: TCheckBox;
    SaveDialog1: TSaveDialog;
    gbGarantia: TRadioGroup;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btPRODUCTOClick(Sender: TObject);
    procedure btCVE_MONEDAClick(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure btID_CESIONClick(Sender: TObject);
    procedure btCVE_PRODUCTO_GPOClick(Sender: TObject);
    procedure ilPRODUCTOEjecuta(Sender: TObject);
    procedure ilMONEDAEjecuta(Sender: TObject);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure ilCesionEjecuta(Sender: TObject);
    procedure ilCVE_PRODUCTO_GPOEjecuta(Sender: TObject);
    procedure ilPRODUCTOCapture(Sender: TObject; var Show: Boolean);
    procedure ilMONEDACapture(Sender: TObject; var Show: Boolean);
    procedure ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure ilCesionCapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_PRODUCTO_GPOCapture(Sender: TObject;
      var Show: Boolean);
    procedure chbxProductoClick(Sender: TObject);
    procedure chbxMonedaClick(Sender: TObject);
    procedure chbxAcreditadoClick(Sender: TObject);
    procedure chbxCESIONClick(Sender: TObject);
    procedure cbxCVE_PRODUCTO_GPOClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure sbExcelClick(Sender: TObject);
    procedure cbxArchivoClick(Sender: TObject);
    private 
    { Private declarations } 
    public 
    { Public declarations }
    Objeto : TMApliRecu;
end;
 TMApliRecu= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public

        Producto                 : TCrProduct;
        Moneda                   : TMoneda;
        Acreditado               : TCrAcredit;
        Credito                  : TCrCredito;//Disposición
        ParamCre                 : TParamCre;
        GpoProd                  : TMProdGpo;


        { Public declarations } 
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


constructor TMApliRecu.Create( AOwner : TComponent ); 
begin Inherited; 

      Producto :=  TCrProduct.Create(Self);
      Producto.MasterSource:=Self;
      Producto.FieldByName('CVE_PRODUCTO_CRE').MasterField      :='CVE_PRODUCTO_CRE';

      Moneda := TMoneda.Create(Self);
      Moneda.MasterSource:=Self;
      Moneda.FieldByName('CVE_MONEDA').MasterField:='CVE_MONEDA';

      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource := Self;

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
      Credito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

      GpoProd:= TMProdGpo.Create(Self);
      GpoProd.MasterSource:=Self;
      GpoProd.FieldByName('CVE_PRODUCTO_GPO').MasterField:='CVE_PRODUCTO_GPO';

      StpName  := ' '; 
      UseQuery := False; 
      HelpFile := 'IntMApliRecu.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMApliRecu.Destroy;
begin
   if Producto <> nil then
      Producto.Free;
   if Moneda <> nil then
      Moneda.Free;
   if Acreditado <> nil then
      Acreditado.Free;
   if Credito <> nil then
      Credito.Free;
   If GpoProd <> Nil Then
      GpoProd.Free;
     inherited;
end;


function TMApliRecu.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMApliRecu;
begin
   W:=TWMApliRecu.Create(Self);
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


Function TMApliRecu.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('MApliRecu.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TMApliRecu.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA MProVeMa********************)
(*                                                                              *)
(*  FORMA DE MProVeMa                                                            *)
(*                                                                              *)
(***********************************************FORMA MProVeMa********************)

procedure TWMApliRecu.FormShow(Sender: TObject);
begin
      //PINTA DATOS DEL PANEL INFERIOR
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.Producto.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO_CRE;
      Objeto.Producto.DESC_C_PRODUCTO.Control := edDESC_PRODUCTO1;
      Objeto.Producto.GetParams(Objeto);
      edDESC_PRODUCTO1.Hint := Objeto.Producto.DESC_C_PRODUCTO.AsString;
      edDESC_PRODUCTO1.ShowHint := True;

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

      Objeto.Credito.ID_CREDITO.Control := edID_CESION;
      Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := edCESION;
      Objeto.Credito.GetParams(Objeto);
      edCESION.Hint := Objeto.Credito.ContratoCre.Contrato.TITNombre.AsString;
      edCESION.ShowHint := True;

      Objeto.GpoProd.CVE_PRODUCTO_GPO.Control:= edCVE_PRODUCTO_GPO;
      Objeto.GpoProd.DESC_C_PROD_GPO.Control:= edNOM_CVE_PRODUCTO_GPO;
      Objeto.GpoProd.GetParams(Objeto);

      dtpF_Vencimiento.DateTime:= Objeto.Apli.DameFechaEmpresa;
      edF_Vencimiento.text:=FormatDateTime('dd/mm/yyyy',dtpF_Vencimiento.DateTime);
 end;

procedure TWMApliRecu.FormDestroy(Sender: TObject);
begin
    Objeto.Producto.DESC_C_PRODUCTO.Control := nil;
    Objeto.Acreditado.ID_ACREDITADO.Control := nil;
    Objeto.Acreditado.Persona.Nombre.Control := nil;
    Objeto.Moneda.Cve_Moneda.Control := nil;
    Objeto.Moneda.Desc_Moneda.Control := nil;
    Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := nil;
    Objeto.Credito.ID_CREDITO.Control := nil;
    Objeto.GpoProd.CVE_PRODUCTO_GPO.Control:= nil;
    Objeto.GpoProd.DESC_C_PROD_GPO.Control:= nil;
end;

procedure TWMApliRecu.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWMApliRecu.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWMApliRecu.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWMApliRecu.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWMApliRecu.btPRODUCTOClick(Sender: TObject);
begin
    Objeto.Producto.ShowAll := True;
    if Objeto.Producto.Busca Then Begin
        chbxProducto.Checked:= True;
        chbxProducto.Enabled:= True;
        InterForma1.NextTab(edCVE_PRODUCTO_CRE);
    end;
end;

procedure TWMApliRecu.btCVE_MONEDAClick(Sender: TObject);
begin
   Objeto.Moneda.ShowAll := True;
   if Objeto.Moneda.Busca then Begin
        chbxMoneda.Checked:= True;
        chbxMoneda.Enabled:= True;
        InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TWMApliRecu.btACREDITADOClick(Sender: TObject);
begin
   Objeto.Acreditado.ShowAll := True;
   If Objeto.Acreditado.Busca Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
   End;
end;

procedure TWMApliRecu.btID_CESIONClick(Sender: TObject);
begin
   Objeto.Credito.ShowAll := True;
   if Objeto.Credito.Busca then begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
        InterForma1.NextTab(edID_CESION);
   End;
end;

procedure TWMApliRecu.btCVE_PRODUCTO_GPOClick(Sender: TObject);
begin
   Objeto.GpoProd.ShowAll := True;
   If Objeto.GpoProd.Busca Then Begin
      cbxCVE_PRODUCTO_GPO.Checked:=True;
      cbxCVE_PRODUCTO_GPO.Enabled:=True;
      InterForma1.NextTab(edCVE_PRODUCTO_GPO);
   End;
end;

procedure TWMApliRecu.ilPRODUCTOEjecuta(Sender: TObject);
begin
    If Objeto.Producto.FindKey([ilPRODUCTO.Buffer])Then Begin
        chbxProducto.Checked:=True;
        chbxProducto.Enabled:=True;
        InterForma1.NextTab(edCVE_PRODUCTO_CRE);
    End;
end;

procedure TWMApliRecu.ilMONEDAEjecuta(Sender: TObject);
begin
    If Objeto.Moneda.FindKey([ilMONEDA.Buffer]) Then Begin
        chbxMoneda.Checked:=True;
        chbxMoneda.Enabled:=True;
        InterForma1.NextTab(edCVE_MONEDA);
    End;
end;

procedure TWMApliRecu.ilACREDITADOEjecuta(Sender: TObject);
begin
    If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
    End;
end;

procedure TWMApliRecu.ilCesionEjecuta(Sender: TObject);
begin
    If Objeto.Credito.FindKey([ilCesion.Buffer]) Then Begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
        InterForma1.NextTab(edID_CESION);
    End;
end;

procedure TWMApliRecu.ilCVE_PRODUCTO_GPOEjecuta(Sender: TObject);
begin
   If Objeto.GpoProd.FindKey([ilCVE_PRODUCTO_GPO.Buffer]) Then Begin
      InterForma1.NextTab(edCVE_PRODUCTO_GPO);
   End;
end;

procedure TWMApliRecu.ilPRODUCTOCapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TWMApliRecu.ilMONEDACapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TWMApliRecu.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TWMApliRecu.ilCesionCapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TWMApliRecu.ilCVE_PRODUCTO_GPOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TWMApliRecu.chbxProductoClick(Sender: TObject);
begin
    If not chbxProducto.Checked Then Begin
        Objeto.Producto.Active:=False;
        chbxProducto.Checked:=False;
        chbxProducto.Enabled:=False;
    End Else Begin
        chbxProducto.Checked:=True;
        chbxProducto.Enabled:=True;
    End;
end;

procedure TWMApliRecu.chbxMonedaClick(Sender: TObject);
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

procedure TWMApliRecu.chbxAcreditadoClick(Sender: TObject);
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
                  
procedure TWMApliRecu.chbxCESIONClick(Sender: TObject);
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

procedure TWMApliRecu.cbxCVE_PRODUCTO_GPOClick(Sender: TObject);
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

procedure TWMApliRecu.InterForma1BtnPreviewClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMAPLIRECU_PREVI',True,True) then
   begin
         RepAplicRecu(edF_Vencimiento.Text  , edCVE_PRODUCTO_CRE.Text,
                      edCVE_MONEDA.Text     , edACREDITADO.Text  ,
                      edID_CESION.Text,
                      edCVE_PRODUCTO_GPO.Text,  edNbrArch.Text,
                      gbGarantia.ItemIndex,
                      Objeto.Apli           , TRUE
                      );
   end;
end;

procedure TWMApliRecu.InterForma1BtnImprimirClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMAPLIRECU_IMPRI',True,True) then
   begin
         RepAplicRecu(edF_Vencimiento.Text  , edCVE_PRODUCTO_CRE.Text,
                      edCVE_MONEDA.Text     , edACREDITADO.Text  ,
                      edID_CESION.Text,
                      edCVE_PRODUCTO_GPO.Text,  edNbrArch.Text,
                      gbGarantia.ItemIndex,
                      Objeto.Apli           , FALSE
                      );
   end;
end;

procedure TWMApliRecu.sbExcelClick(Sender: TObject);
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

procedure TWMApliRecu.cbxArchivoClick(Sender: TObject);
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

end.
