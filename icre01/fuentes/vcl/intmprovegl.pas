// Sistema         : Clase de MProVeGl
// Fecha de Inicio : 27/10/2011
// Función forma   : Clase de MProVeGl
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Juan Francisco Ortega Flores
// Comentarios     :


Unit IntMProVeGl;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,

IntGenCre,
IntCrProduct,     //Producto de crédito
IntMon,           //Moneda
IntCrAcredit,     //Acreditado
IntMPers,         //PromotorAsoc
IntCrCredito,     //Disposición
IntMProdGpo,      //GrupoProducto
IntCrCto,         //Contrato
IntEmple,         //Empleado
IntQProVeGl,      //Reporte
IntParamCre, IntLinkit, InterEdit
;

Type
 TMProVeGl= class; 

  TWMProVeGl=Class(TForm)
    InterForma1  : TInterForma;
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
    SaveDialog1: TSaveDialog;
    dtpF_Vencimiento: TInterDateTimePicker;
    cbxArchivo: TCheckBox;
    lbLinea: TLabel;
    edID_Contrato: TInterEdit;
    btCONTRATO: TBitBtn;
    edNomAcreditadoContrato: TEdit;
    cbxID_CONTRATO: TCheckBox;
    ilID_CONTRATO: TInterLinkit;
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
    procedure btCONTRATOClick(Sender: TObject);
    procedure ilID_CONTRATOCapture(Sender: TObject; var Show: Boolean);
    procedure cbxID_CONTRATOClick(Sender: TObject);
    private

    procedure ImprimeReporte(bPreview : Boolean; grOpcion : TGenRepOption);
    { Private declarations } 
    public 
    { Public declarations }
    Objeto : TMProVeGl;
end;
 TMProVeGl= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public

        Producto                 : TCrProduct;
        Moneda                   : TMoneda;
        Acreditado               : TCrAcredit;
        Promotor                 : TEmpleado;   //Promotor Responsable
        PromotorAdmon            : TEmpleado;   //Promotor Admon
        Credito                  : TCrCredito;  //Disposición
        ParamCre                 : TParamCre;
        GpoProd                  : TMProdGpo;
        Contrato                 : TCrCto;      //Contrato


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


constructor TMProVeGl.Create( AOwner : TComponent ); 
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

      Contrato:= TCrCto.Create(Self);
      Contrato.MasterSource:=Self;
      Contrato.FieldByName('ID_CONTRATO').MasterField:='ID_CONTRATO';


      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntMProVeGl.Hlp';
      ShowMenuReporte := True;
end;

Destructor TMProVeGl.Destroy;
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
   If Contrato <> Nil Then
      Contrato.Free;

     inherited;
end;


function TMProVeGl.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMProVeGl;
begin
   W:=TWMProVeGl.Create(Self);
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


Function TMProVeGl.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('IMprovem.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TMProVeGl.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA MProVeGl********************)
(*                                                                              *)
(*  FORMA DE MProVeGl                                                            *)
(*                                                                              *)
(***********************************************FORMA MProVeGl********************)

procedure TWMProVeGl.FormShow(Sender: TObject);
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

      edF_Vencimiento.Text:= DatetoStr(Objeto.Apli.DameFechaEmpresa);

      Objeto.Contrato.ID_CONTRATO.Control := edID_Contrato;
      Objeto.Contrato.Contrato.TITNombre.Control := edNomAcreditadoContrato;


end;

procedure TWMProVeGl.FormDestroy(Sender: TObject);
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
    Objeto.Contrato.ID_CONTRATO.Control := nil;


end;

procedure TWMProVeGl.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWMProVeGl.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWMProVeGl.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWMProVeGl.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWMProVeGl.btPRODUCTOClick(Sender: TObject);
begin
    Objeto.Producto.ShowAll := True;
    if Objeto.Producto.Busca Then Begin
        chbxProducto.Checked:= True;
        chbxProducto.Enabled:= True;
        InterForma1.NextTab(edCVE_PRODUCTO_CRE);
    end;
end;

procedure TWMProVeGl.btCVE_MONEDAClick(Sender: TObject);
begin
   Objeto.Moneda.ShowAll := True;
   if Objeto.Moneda.Busca then Begin
        chbxMoneda.Checked:= True;
        chbxMoneda.Enabled:= True;
        InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TWMProVeGl.btACREDITADOClick(Sender: TObject);
begin
   Objeto.Acreditado.ShowAll := True;
   If Objeto.Acreditado.Busca Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
   End;
end;

procedure TWMProVeGl.btPROMOTORClick(Sender: TObject);
begin
    Objeto.Promotor.ShowAll := True;
    If Objeto.Promotor.Busca Then Begin
        chbxPromotor.Checked:=True;
        chbxPromotor.Enabled:=True;
        InterForma1.NextTab(edID_PROMOTOR);
    End;
end;

procedure TWMProVeGl.btPROM_ADMONClick(Sender: TObject);
begin
    Objeto.PromotorAdmon.ShowAll := True;
    If Objeto.PromotorAdmon.Busca Then Begin
        chbxPromAmon.Checked:=True;
        chbxPromAmon.Enabled:=True;
        InterForma1.NextTab(edID_PROM);
    End;
end;

procedure TWMProVeGl.btID_CESIONClick(Sender: TObject);
begin
   Objeto.Credito.ShowAll := True;
   if Objeto.Credito.Busca then begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
        InterForma1.NextTab(edID_CESION);
   End;
end;

procedure TWMProVeGl.btCVE_PRODUCTO_GPOClick(Sender: TObject);
begin
   Objeto.GpoProd.ShowAll := True;
   If Objeto.GpoProd.Busca Then Begin
      cbxCVE_PRODUCTO_GPO.Checked:=True;
      cbxCVE_PRODUCTO_GPO.Enabled:=True;
      InterForma1.NextTab(edCVE_PRODUCTO_GPO);
   End;
end;

procedure TWMProVeGl.btCONTRATOClick(Sender: TObject);
begin
   Objeto.Contrato.ShowAll := True;
   if Objeto.Contrato.Busca then
   begin
      cbxID_CONTRATO.Checked:=True;
      cbxID_CONTRATO.Enabled:=True;
//      edID_ContratoExit(self);
      InterForma1.NextTab(btCONTRATO);
   end;
end;

procedure TWMProVeGl.ilPRODUCTOEjecuta(Sender: TObject);
begin
    If Objeto.Producto.FindKey([ilPRODUCTO.Buffer])Then Begin
        chbxProducto.Checked:=True;
        chbxProducto.Enabled:=True;
        InterForma1.NextTab(edCVE_PRODUCTO_CRE);
    End;
end;

procedure TWMProVeGl.ilMONEDAEjecuta(Sender: TObject);
begin
    If Objeto.Moneda.FindKey([ilMONEDA.Buffer]) Then Begin
        chbxMoneda.Checked:=True;
        chbxMoneda.Enabled:=True;
        InterForma1.NextTab(edCVE_MONEDA);
    End;
end;

procedure TWMProVeGl.ilACREDITADOEjecuta(Sender: TObject);
begin
    If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
    End;
end;

procedure TWMProVeGl.ilPROMOTORCapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;

end;

procedure TWMProVeGl.ilPromAdmonEjecuta(Sender: TObject);
begin
    If Objeto.PromotorAdmon.FindKey([ilPromAdmon.Buffer]) Then Begin
        chbxPromAmon.Checked:=True;
        chbxPromAmon.Enabled:=True;
        InterForma1.NextTab(edID_PROM);
    End;
end;

procedure TWMProVeGl.ilCesionEjecuta(Sender: TObject);
begin
    If Objeto.Credito.FindKey([ilCesion.Buffer]) Then Begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
        InterForma1.NextTab(edID_CESION);
    End;
end;

procedure TWMProVeGl.ilCVE_PRODUCTO_GPOEjecuta(Sender: TObject);
begin
   If Objeto.GpoProd.FindKey([ilCVE_PRODUCTO_GPO.Buffer]) Then Begin
      InterForma1.NextTab(edCVE_PRODUCTO_GPO);
   End;
end;

procedure TWMProVeGl.ilPRODUCTOCapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TWMProVeGl.ilMONEDACapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TWMProVeGl.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TWMProVeGl.ilPROMOTOREjecuta(Sender: TObject);
begin
    If Objeto.Promotor.FindKey([ilPROMOTOR.Buffer]) Then Begin
        chbxPromotor.Checked:=True;
        chbxPromotor.Enabled:=True;
        InterForma1.NextTab(edID_PROMOTOR);
    End;
end;

procedure TWMProVeGl.ilPromAdmonCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TWMProVeGl.ilCesionCapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TWMProVeGl.ilCVE_PRODUCTO_GPOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TWMProVeGl.chbxProductoClick(Sender: TObject);
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

procedure TWMProVeGl.chbxMonedaClick(Sender: TObject);
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

procedure TWMProVeGl.chbxAcreditadoClick(Sender: TObject);
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

procedure TWMProVeGl.chbxPromotorClick(Sender: TObject);
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

procedure TWMProVeGl.chbxPromAmonClick(Sender: TObject);
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

procedure TWMProVeGl.chbxCESIONClick(Sender: TObject);
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

procedure TWMProVeGl.cbxCVE_PRODUCTO_GPOClick(Sender: TObject);
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

procedure TWMProVeGl.cbxID_CONTRATOClick(Sender: TObject);
begin
    If not cbxID_CONTRATO.Checked Then Begin
        edNomAcreditadoContrato.Text:= '';
        cbxID_CONTRATO.Checked:=False;
        cbxID_CONTRATO.Enabled:=False;
    End Else Begin
        cbxID_CONTRATO.Checked:=True;
        cbxID_CONTRATO.Enabled:=True;
    End;
end;

procedure TWMProVeGl.cbxArchivoClick(Sender: TObject);
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


procedure TWMProVeGl.InterForma1BtnPreviewClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMPROVEGL_PREVI',True,True) then
        ImprimeReporte(True, grPreview); //grDigitaliza  
end;

procedure TWMProVeGl.InterForma1BtnImprimirClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMPROVEGL_IMPRI',True,True) then
        ImprimeReporte(False, grPrint);
end;

procedure TWMProVeGl.sbExcelClick(Sender: TObject);
var sExt:String;
begin
  If SaveDialog1.Execute Then Begin
      sExt:= copy(SaveDialog1.FileName,Length(SaveDialog1.FileName)-3,Length(SaveDialog1.FileName));
      If  UpperCase(sExt)= '.PRN' Then
        begin
          edNbrArch.Text := SaveDialog1.FileName;
          cbxArchivo.Checked := True;
          cbxArchivo.Enabled := True;
        end
      Else
        begin
          edNbrArch.Text := SaveDialog1.FileName + '.prn';
          cbxArchivo.Checked := True;
          cbxArchivo.Enabled := True;
        end;
  End Else
    edNbrArch.Text := '';
end;


procedure TWMProVeGl.ilID_CONTRATOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;


procedure TWMProVeGl.ImprimeReporte(bPreview: Boolean;
  grOpcion: TGenRepOption);
begin
 RepProgVenGl(edF_Vencimiento.Text  , edCVE_PRODUCTO_CRE.Text,
                      edCVE_MONEDA.Text     , edACREDITADO.Text  ,
                      edID_PROMOTOR.Text    , edID_PROM.Text     , edID_CESION.Text,
                      edCVE_PRODUCTO_GPO.Text, edID_Contrato.Text,  edNbrArch.Text,
                      Objeto.Apli  , grOpcion, ''
              );
end;

end.
