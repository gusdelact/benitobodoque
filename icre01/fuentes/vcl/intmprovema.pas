// Sistema         : Clase de MProVeMa
// Fecha de Inicio : 10/08/2009
// Función forma   : Clase de MProVeMa           
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Manuel Romero Ibarra
// Comentarios     :


{              
*************************************************************
*********************REGISTRO DE CAMBIOS*********************

HERJA 26.08.2010
Juan Aaron Hernandez Rodriguez
1. Se modifica Reporte para la funcionalidad Mostrar Impagados sin tomar en cuenta Amortizaciones de Capital
2. Se agrega la opcion de Grupo Producto

*************************************************************
}

Unit IntMprovema;

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
IntQProVeMa,      //Reporte
IntParamCre, IntLinkit
;

Type
 TMprovema= class; 

  TWMprovema=Class(TForm)
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
    lbID_PROMOTOR: TLabel;
    edID_PROMOTOR: TEdit;
    btPROMOTOR: TBitBtn;
    edNOM_PROMOTOR: TEdit;
    chbxPromotor: TCheckBox;
    Label7: TLabel;
    edID_PROM: TEdit;
    btPROM_ADMON: TBitBtn;
    edNOM_PROM: TEdit;
    chbxPromAmon: TCheckBox;
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
    ilPROMOTOR: TInterLinkit;
    ilPromAdmon: TInterLinkit;
    ilCesion: TInterLinkit;
    ilCVE_PRODUCTO_GPO: TInterLinkit;
    Label5: TLabel;
    sbExcel: TSpeedButton;
    edNbrArch: TEdit;
    cbxArchivo: TCheckBox;
    SaveDialog1: TSaveDialog;
    cbB_VENC: TCheckBox;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btPRODUCTOClick(Sender: TObject);
    procedure btCVE_MONEDAClick(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure btPROMOTORClick(Sender: TObject);
    procedure btPROM_ADMONClick(Sender: TObject);
    procedure btID_CESIONClick(Sender: TObject);
    procedure btCVE_PRODUCTO_GPOClick(Sender: TObject);
    procedure ilPRODUCTOEjecuta(Sender: TObject);
    procedure ilMONEDAEjecuta(Sender: TObject);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure ilPROMOTORCapture(Sender: TObject; var Show: Boolean);
    procedure ilPromAdmonEjecuta(Sender: TObject);
    procedure ilCesionEjecuta(Sender: TObject);
    procedure ilCVE_PRODUCTO_GPOEjecuta(Sender: TObject);
    procedure ilPRODUCTOCapture(Sender: TObject; var Show: Boolean);
    procedure ilMONEDACapture(Sender: TObject; var Show: Boolean);
    procedure ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure ilPROMOTOREjecuta(Sender: TObject);
    procedure ilPromAdmonCapture(Sender: TObject; var Show: Boolean);
    procedure ilCesionCapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_PRODUCTO_GPOCapture(Sender: TObject;
      var Show: Boolean);
    procedure chbxProductoClick(Sender: TObject);
    procedure chbxMonedaClick(Sender: TObject);
    procedure chbxAcreditadoClick(Sender: TObject);
    procedure chbxPromotorClick(Sender: TObject);
    procedure chbxPromAmonClick(Sender: TObject);
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
    Objeto : TMprovema;
end;
 TMprovema= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public

        Producto                 : TCrProduct;
        Moneda                   : TMoneda;
        Acreditado               : TCrAcredit;
        Promotor                 : TEmpleado; //Promotor Responsable
        PromotorAdmon            : TEmpleado; //Promotor Admon
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


constructor TMprovema.Create( AOwner : TComponent ); 
begin Inherited; 

      Producto :=  TCrProduct.Create(Self);
      Producto.MasterSource:=Self;
      Producto.FieldByName('CVE_PRODUCTO_CRE').MasterField      :='CVE_PRODUCTO_CRE';

      Moneda := TMoneda.Create(Self);
      Moneda.MasterSource:=Self;
      Moneda.FieldByName('CVE_MONEDA').MasterField:='CVE_MONEDA';

      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource := Self;

      Promotor := TEmpleado.Create(Self);
      Promotor.FilterBy := fbTMPersonaEmpleado;
      Promotor.MasterSource := Self;
      Promotor.FieldByName('ID_PERSONA').MasterField := 'ID_PROMOTOR';
      Promotor.BuscaWhereString := 'SIT_EMPLEADO = ''AC''';

      PromotorAdmon := TEmpleado.Create(Self);
      PromotorAdmon.FilterBy := fbTMPersonaEmpleado;
      PromotorAdmon.MasterSource := Self;
      PromotorAdmon.FieldByName('ID_PERSONA').MasterField := 'ID_PROMOTOR';
      PromotorAdmon.BuscaWhereString := 'SIT_EMPLEADO = ''AC''';

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
      Credito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';


      GpoProd:= TMProdGpo.Create(Self);
      GpoProd.MasterSource:=Self;
      GpoProd.FieldByName('CVE_PRODUCTO_GPO').MasterField:='CVE_PRODUCTO_GPO';



      StpName  := ' '; 
      UseQuery := False; 
      HelpFile := 'IntMprovema.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMprovema.Destroy;
begin
   if Producto <> nil then
      Producto.Free;
   if Moneda <> nil then
      Moneda.Free;
   if Acreditado <> nil then
      Acreditado.Free;
   if Promotor <> nil then
      Promotor.Free;
   if PromotorAdmon <> nil then
      PromotorAdmon.Free;
   if Credito <> nil then
      Credito.Free;
   If GpoProd <> Nil Then
      GpoProd.Free;
     inherited;
end;


function TMprovema.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMprovema;
begin
   W:=TWMprovema.Create(Self);
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


Function TMprovema.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('IMprovem.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TMprovema.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA MProVeMa********************)
(*                                                                              *)
(*  FORMA DE MProVeMa                                                            *)
(*                                                                              *)
(***********************************************FORMA MProVeMa********************)

procedure TWMprovema.FormShow(Sender: TObject);
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

      Objeto.Promotor.ID_Persona.Control :=edID_PROMOTOR;
      Objeto.Promotor.Persona.Nombre.Control :=edNOM_PROMOTOR;
      Objeto.Promotor.GetParams(Objeto);
      edNOM_PROMOTOR.Hint := Objeto.Promotor.Persona.Nombre.AsString;
      edNOM_PROMOTOR.ShowHint := True;

      Objeto.PromotorAdmon.ID_Persona.Control :=edID_PROM;
      Objeto.PromotorAdmon.Persona.Nombre.Control :=edNOM_PROM;
      Objeto.PromotorAdmon.GetParams(Objeto);
      edNOM_PROM.Hint := Objeto.PromotorAdmon.Persona.Nombre.AsString;
      edNOM_PROM.ShowHint := True;

      Objeto.Credito.ID_CREDITO.Control := edID_CESION;
      Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := edCESION;
      Objeto.Credito.GetParams(Objeto);
      edCESION.Hint := Objeto.Credito.ContratoCre.Contrato.TITNombre.AsString;
      edCESION.ShowHint := True;


      Objeto.GpoProd.CVE_PRODUCTO_GPO.Control:= edCVE_PRODUCTO_GPO;
      Objeto.GpoProd.DESC_C_PROD_GPO.Control:= edNOM_CVE_PRODUCTO_GPO;
      Objeto.GpoProd.GetParams(Objeto);

end;

procedure TWMprovema.FormDestroy(Sender: TObject);
begin
    Objeto.Producto.DESC_C_PRODUCTO.Control := nil;
    Objeto.Acreditado.ID_ACREDITADO.Control := nil;
    Objeto.Acreditado.Persona.Nombre.Control := nil;
    Objeto.Moneda.Cve_Moneda.Control := nil;
    Objeto.Moneda.Desc_Moneda.Control := nil;
    Objeto.Promotor.Persona.Nombre.Control :=nil;
    Objeto.Promotor.Id_Persona.Control :=nil;
    Objeto.PromotorAdmon.Persona.Nombre.Control :=nil;
    Objeto.PromotorAdmon.Id_Persona.Control :=nil;
    Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := nil;
    Objeto.Credito.ID_CREDITO.Control := nil;
    Objeto.GpoProd.CVE_PRODUCTO_GPO.Control:= nil;
    Objeto.GpoProd.DESC_C_PROD_GPO.Control:= nil;

end;

procedure TWMprovema.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWMprovema.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWMprovema.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWMprovema.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWMprovema.btPRODUCTOClick(Sender: TObject);
begin
    Objeto.Producto.ShowAll := True;
    if Objeto.Producto.Busca Then Begin
        chbxProducto.Checked:= True;
        chbxProducto.Enabled:= True;
        InterForma1.NextTab(edCVE_PRODUCTO_CRE);
    end;
end;

procedure TWMprovema.btCVE_MONEDAClick(Sender: TObject);
begin
   Objeto.Moneda.ShowAll := True;
   if Objeto.Moneda.Busca then Begin
        chbxMoneda.Checked:= True;
        chbxMoneda.Enabled:= True;
        InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TWMprovema.btACREDITADOClick(Sender: TObject);
begin
   Objeto.Acreditado.ShowAll := True;
   If Objeto.Acreditado.Busca Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
   End;
end;

procedure TWMprovema.btPROMOTORClick(Sender: TObject);
begin
    Objeto.Promotor.ShowAll := True;
    If Objeto.Promotor.Busca Then Begin
        chbxPromotor.Checked:=True;
        chbxPromotor.Enabled:=True;
        InterForma1.NextTab(edID_PROMOTOR);
    End;
end;

procedure TWMprovema.btPROM_ADMONClick(Sender: TObject);
begin
    Objeto.PromotorAdmon.ShowAll := True;
    If Objeto.PromotorAdmon.Busca Then Begin
        chbxPromAmon.Checked:=True;
        chbxPromAmon.Enabled:=True;
        InterForma1.NextTab(edID_PROM);
    End;
end;

procedure TWMprovema.btID_CESIONClick(Sender: TObject);
begin
   Objeto.Credito.ShowAll := True;
   if Objeto.Credito.Busca then begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
        InterForma1.NextTab(edID_CESION);
   End;
end;

procedure TWMprovema.btCVE_PRODUCTO_GPOClick(Sender: TObject);
begin
   Objeto.GpoProd.ShowAll := True;
   If Objeto.GpoProd.Busca Then Begin
      cbxCVE_PRODUCTO_GPO.Checked:=True;
      cbxCVE_PRODUCTO_GPO.Enabled:=True;
      InterForma1.NextTab(edCVE_PRODUCTO_GPO);
   End;
end;

procedure TWMprovema.ilPRODUCTOEjecuta(Sender: TObject);
begin
    If Objeto.Producto.FindKey([ilPRODUCTO.Buffer])Then Begin
        chbxProducto.Checked:=True;
        chbxProducto.Enabled:=True;
        InterForma1.NextTab(edCVE_PRODUCTO_CRE);
    End;
end;

procedure TWMprovema.ilMONEDAEjecuta(Sender: TObject);
begin
    If Objeto.Moneda.FindKey([ilMONEDA.Buffer]) Then Begin
        chbxMoneda.Checked:=True;
        chbxMoneda.Enabled:=True;
        InterForma1.NextTab(edCVE_MONEDA);
    End;
end;

procedure TWMprovema.ilACREDITADOEjecuta(Sender: TObject);
begin
    If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
    End;
end;

procedure TWMprovema.ilPROMOTORCapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;

end;

procedure TWMprovema.ilPromAdmonEjecuta(Sender: TObject);
begin
    If Objeto.PromotorAdmon.FindKey([ilPromAdmon.Buffer]) Then Begin
        chbxPromAmon.Checked:=True;
        chbxPromAmon.Enabled:=True;
        InterForma1.NextTab(edID_PROM);
    End;
end;

procedure TWMprovema.ilCesionEjecuta(Sender: TObject);
begin
    If Objeto.Credito.FindKey([ilCesion.Buffer]) Then Begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
        InterForma1.NextTab(edID_CESION);
    End;
end;

procedure TWMprovema.ilCVE_PRODUCTO_GPOEjecuta(Sender: TObject);
begin
   If Objeto.GpoProd.FindKey([ilCVE_PRODUCTO_GPO.Buffer]) Then Begin
      InterForma1.NextTab(edCVE_PRODUCTO_GPO);
   End;
end;

procedure TWMprovema.ilPRODUCTOCapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TWMprovema.ilMONEDACapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TWMprovema.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TWMprovema.ilPROMOTOREjecuta(Sender: TObject);
begin
    If Objeto.Promotor.FindKey([ilPROMOTOR.Buffer]) Then Begin
        chbxPromotor.Checked:=True;
        chbxPromotor.Enabled:=True;
        InterForma1.NextTab(edID_PROMOTOR);
    End;
end;

procedure TWMprovema.ilPromAdmonCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TWMprovema.ilCesionCapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TWMprovema.ilCVE_PRODUCTO_GPOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TWMprovema.chbxProductoClick(Sender: TObject);
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

procedure TWMprovema.chbxMonedaClick(Sender: TObject);
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

procedure TWMprovema.chbxAcreditadoClick(Sender: TObject);
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

procedure TWMprovema.chbxPromotorClick(Sender: TObject);
begin
    If not chbxPromotor.Checked Then Begin
        Objeto.Promotor.Active:=False;
        chbxPromotor.Checked:=False;
        chbxPromotor.Enabled:=False;
    End Else Begin
        chbxPromotor.Checked:=True;
        chbxPromotor.Enabled:=True;
    End;
end;

procedure TWMprovema.chbxPromAmonClick(Sender: TObject);
begin
    If not chbxPromAmon.Checked Then Begin
        Objeto.PromotorAdmon.Active:=False;
        chbxPromAmon.Checked:=False;
        chbxPromAmon.Enabled:=False;
    End Else Begin
        chbxPromAmon.Checked:=True;
        chbxPromAmon.Enabled:=True;
    End;
end;

procedure TWMprovema.chbxCESIONClick(Sender: TObject);
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

procedure TWMprovema.cbxCVE_PRODUCTO_GPOClick(Sender: TObject);
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

procedure TWMprovema.InterForma1BtnPreviewClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMPROVEMA_PREVI',True,True) then
         RepProgVenMa(edF_Vencimiento.Text  , edCVE_PRODUCTO_CRE.Text,
                      edCVE_MONEDA.Text     , edACREDITADO.Text  ,
                      edID_PROMOTOR.Text    , edID_PROM.Text     , edID_CESION.Text,
                      edCVE_PRODUCTO_GPO.Text,  edNbrArch.Text,
                      Objeto.Apli           , TRUE,
                      cbB_VENC.Checked  //HERJA 25.08.2010
                      );
end;

procedure TWMprovema.InterForma1BtnImprimirClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMPROVEMA_IMPRI',True,True) then
         RepProgVenMa(edF_Vencimiento.Text  , edCVE_PRODUCTO_CRE.Text,
                      edCVE_MONEDA.Text     , edACREDITADO.Text  ,
                      edID_PROMOTOR.Text    , edID_PROM.Text     , edID_CESION.Text,
                      edCVE_PRODUCTO_GPO.Text,  edNbrArch.Text,
                      Objeto.Apli           , FALSE,
                      cbB_VENC.Checked  //HERJA 25.08.2010
                      );
end;

procedure TWMprovema.sbExcelClick(Sender: TObject);
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

procedure TWMprovema.cbxArchivoClick(Sender: TObject);
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
