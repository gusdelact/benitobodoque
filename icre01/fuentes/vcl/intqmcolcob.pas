// Sistema         : Clase de QMColCob
// Fecha de Inicio : 27/11/2008
// Función forma   : Clase de QMColCob
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Manuel Romero Ibarra
// Comentarios     :
Unit IntQMColCob;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,


IntPers,          //PERSONA
IntMPers,         //PromotorAsoc
IntParamCre,      //Parametrico
IntGenCre,        //General de crédito
IntQColCob,       //Reporte
IntCrProduct,     //Producto de crédito
IntMon,           //Moneda
IntMProdGpo,      //Grupo Producto
IntMInstDesc,     //Entidad Descontadora
IntCrPre          //Presupuesto

;

Type
 TQMColCob= class; 

  TWQMColCob=Class(TForm)
    InterForma1             : TInterForma;
    lbLiqF_INICIO: TLabel;
    edF_INICIO: TEdit;
    dtpF_INICIO: TInterDateTimePicker;
    Label3: TLabel;
    edF_FINAL: TEdit;
    dtpF_FINAL: TInterDateTimePicker;
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
    lbCVE_PRODUCTO_CRE: TLabel;
    edCVE_PRODUCTO_CRE: TEdit;
    btPRODUCTO: TBitBtn;
    edDESC_PRODUCTO1: TEdit;
    chbxProducto: TCheckBox;
    Label5: TLabel;
    edCVE_PRODUCTO_GPO: TEdit;
    btCVE_PRODUCTO_GPO: TBitBtn;
    edNOM_CVE_PRODUCTO_GPO: TEdit;
    cbxCVE_PRODUCTO_GPO: TCheckBox;
    lbCVE_MONEDA: TLabel;
    edCVE_MONEDA: TEdit;
    btCVE_MONEDA: TBitBtn;
    edDESC_MONEDA: TEdit;
    chbxMoneda: TCheckBox;
    rgDescDoc: TRadioGroup;
    cdEntDesc: TCheckBox;
    edCVE_FND_ENT_DES: TEdit;
    btCVE_FND_ENT_DES: TBitBtn;
    edNOM_FND_ENT_DES: TEdit;
    Label1: TLabel;
    ilPRODUCTO: TInterLinkit;
    ilMONEDA: TInterLinkit;
    ilCVE_PRODUCTO_GPO: TInterLinkit;
    ilCVE_FND_ENT_DES: TInterLinkit;
    Label6: TLabel;
    sbExcel: TSpeedButton;
    edNbrArch: TEdit;
    SaveDialog1: TSaveDialog;
    cbxArchivo: TCheckBox;
    rgAgrupacion: TRadioGroup;
    lbID_PROMOTOR: TLabel;
    Label7: TLabel;
    edID_PROMOTOR: TEdit;
    edID_PROM: TEdit;
    btPROMOTOR: TBitBtn;
    btPROM_ADMON: TBitBtn;
    edNOM_PROMOTOR: TEdit;
    edNOM_PROM: TEdit;
    chbxPromotor: TCheckBox;
    chbxPromAmon: TCheckBox;
    ilPROMOTOR: TInterLinkit;
    ilPromAdmon: TInterLinkit;
    lbID_ACREDITADO: TLabel;
    edID_ACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edSECTOR_CORP: TEdit;
    edDESC_ACREDITADO: TEdit;
    cbpersona: TCheckBox;
    ilPERSONA: TInterLinkit;
    rdPromotor: TRadioGroup;
    Label2: TLabel;
    edCVE_PRESUPUESTO: TEdit;
    bbPRESUPUESTO: TBitBtn;
    edDESC_PRESUPUESTO: TEdit;
    cbPRESUPUESTO: TCheckBox;
    ilPRESUPUESTO: TInterLinkit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1Imprimir(Sender: TObject);
    procedure InterForma1Preview(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btPRODUCTOClick(Sender: TObject);
    procedure btCVE_MONEDAClick(Sender: TObject);
    procedure btCVE_PRODUCTO_GPOClick(Sender: TObject);
    procedure btCVE_FND_ENT_DESClick(Sender: TObject);
    procedure chbxProductoClick(Sender: TObject);
    procedure chbxMonedaClick(Sender: TObject);
    procedure cbxCVE_PRODUCTO_GPOClick(Sender: TObject);
    procedure cdEntDescClick(Sender: TObject);
    procedure ilPRODUCTOCapture(Sender: TObject; var Show: Boolean);
    procedure ilMONEDACapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_PRODUCTO_GPOCapture(Sender: TObject;
      var Show: Boolean);
    procedure ilCVE_FND_ENT_DESCapture(Sender: TObject; var Show: Boolean);
    procedure ilPRODUCTOEjecuta(Sender: TObject);
    procedure ilMONEDAEjecuta(Sender: TObject);
    procedure ilCVE_PRODUCTO_GPOEjecuta(Sender: TObject);
    procedure ilCVE_FND_ENT_DESEjecuta(Sender: TObject);
    procedure cbxArchivoClick(Sender: TObject);
    procedure sbExcelClick(Sender: TObject);
    procedure edNbrArchChange(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure ilPERSONAEjecuta(Sender: TObject);
    procedure cbpersonaClick(Sender: TObject);
    procedure btPROMOTORClick(Sender: TObject);
    procedure ilPERSONACapture(Sender: TObject; var Show: Boolean);
    procedure ilPROMOTORCapture(Sender: TObject; var Show: Boolean);
    procedure ilPromAdmonCapture(Sender: TObject; var Show: Boolean);
    procedure ilPROMOTOREjecuta(Sender: TObject);
    procedure chbxPromotorClick(Sender: TObject);
    procedure btPROM_ADMONClick(Sender: TObject);
    procedure ilPromAdmonEjecuta(Sender: TObject);
    procedure chbxPromAmonClick(Sender: TObject);
    procedure rdPromotorClick(Sender: TObject);
    procedure bbPRESUPUESTOClick(Sender: TObject);
    procedure ilPRESUPUESTOCapture(Sender: TObject; var Show: Boolean);
    procedure ilPRESUPUESTOEjecuta(Sender: TObject);
    procedure cbPRESUPUESTOClick(Sender: TObject);
    private 
    { Private declarations } 
    public
    { Public declarations }
    Objeto : TQMColCob;


end;
 TQMColCob= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ParamCre                 : TParamCre;
        Producto                 : TCrProduct;
        Moneda                   : TMoneda;
        GpoProd                  : TMProdGpo;
        MInstDesc                : TMInstDesc;
        Persona                  : TPersona;
        Promotor                 : TMPersona; //Promotor Responsable
        PromotorAdmon            : TMPersona; //Promotor Admon
        Presupuesto              : TCrPre; //Presupuesto


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


constructor TQMColCob.Create( AOwner : TComponent );
begin Inherited;

      Producto :=  TCrProduct.Create(Self);
      Producto.MasterSource:=Self;
      Producto.FieldByName('CVE_PRODUCTO_CRE').MasterField      :='CVE_PRODUCTO_CRE';

      Moneda := TMoneda.Create(Self);
      Moneda.MasterSource:=Self;
      Moneda.FieldByName('CVE_MONEDA').MasterField:='CVE_MONEDA';

      GpoProd:= TMProdGpo.Create(Self);
      GpoProd.MasterSource:=Self;
      GpoProd.FieldByName('CVE_PRODUCTO_GPO').MasterField:='CVE_PRODUCTO_GPO';

      MInstDesc := TMInstDesc.Create(Self);
      MInstDesc.MasterSource:=Self;
      MInstDesc.FieldByName('CVE_FND_ENT_DES').MasterField:='CVE_FND_ENT_DES';

      Persona := TPersona.Create(Self);
      Persona.MasterSource:=Self;
      Persona.FieldByName('ID_PERSONA').MasterField:='ID_ACREDITADO';

      Promotor := TMPersona.Create(Self);
      Promotor.FilterBy := fbTMPersonaEmpleado;
      Promotor.MasterSource := Self;
      Promotor.FieldByName('ID_PERSONA').MasterField := 'ID_PROMOTOR';
      Promotor.BuscaWhereString := 'SIT_EMPLEADO = ''AC''';

      PromotorAdmon := TMPersona.Create(Self);
      PromotorAdmon.FilterBy := fbTMPersonaEmpleado;
      PromotorAdmon.MasterSource := Self;
      PromotorAdmon.FieldByName('ID_PERSONA').MasterField := 'ID_PROMOTOR';


      Presupuesto := TCrPre.Create(Self);
      Presupuesto.MasterSource := Self;
      Presupuesto.FieldByName('CVE_PRESUPUESTO').MasterField := 'CVE_PRESUPUESTO';


      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntQMColCob.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TQMColCob.Destroy;
begin
   if Producto <> nil then
      Producto.Free;
   if Moneda <> nil then
      Moneda.Free;
   If GpoProd <> Nil Then
      GpoProd.Free;
   If MInstDesc <> Nil Then
      MInstDesc.Free;
   if Persona <> nil then
      Persona.free;
   if Promotor <> nil then
      Promotor.Free;
   if PromotorAdmon <> nil then
      PromotorAdmon.Free;
   if Presupuesto <> nil then
      Presupuesto.Free;
   inherited;
end;


function TQMColCob.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWQMColCob;
begin
   W:=TWQMColCob.Create(Self);
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


Function TQMColCob.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('IQmcolco.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

function TQMColCob.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA QMColCob********************)
(*                                                                              *)
(*  FORMA DE QMColCob                                                            *)
(*                                                                              *)
(***********************************************FORMA QMColCob********************)

procedure TWQMColCob.FormShow(Sender: TObject);
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

      Objeto.Moneda.Cve_Moneda.Control := edCVE_MONEDA;
      Objeto.Moneda.Desc_Moneda.Control := edDESC_MONEDA;
      Objeto.Moneda.GetParams(Objeto);
      edDESC_MONEDA.Hint := Objeto.Moneda.Desc_Moneda.AsString;
      edDESC_MONEDA.ShowHint := True;

      Objeto.GpoProd.CVE_PRODUCTO_GPO.Control:= edCVE_PRODUCTO_GPO;
      Objeto.GpoProd.DESC_C_PROD_GPO.Control:= edNOM_CVE_PRODUCTO_GPO;
      Objeto.GpoProd.GetParams(Objeto);

      Objeto.MInstDesc.CVE_FND_ENT_DES.Control := edCVE_FND_ENT_DES;
      Objeto.MInstDesc.DESC_ENT_DES.Control    := edNOM_FND_ENT_DES;
      Objeto.MInstDesc.GetParams(Objeto);

      Objeto.Persona.Id_Persona.Control := edID_ACREDITADO;
      Objeto.Persona.Nombre.Control := edDESC_ACREDITADO;
      Objeto.Persona.Cve_Tipo_Sector.Control := edSECTOR_CORP;
      Objeto.Persona.GetParams(Objeto);

      Objeto.Promotor.ID_Persona.Control :=edID_PROMOTOR;
      Objeto.Promotor.Nombre.Control :=edNOM_PROMOTOR;
      Objeto.Promotor.GetParams(Objeto);

      Objeto.PromotorAdmon.ID_Persona.Control :=edID_PROM;
      Objeto.PromotorAdmon.Nombre.Control :=edNOM_PROM;
      Objeto.PromotorAdmon.GetParams(Objeto);

      Objeto.Presupuesto.CVE_PRESUPUESTO.Control := edCVE_PRESUPUESTO;
      objeto.Presupuesto.DESC_PRESUPUESTO.Control := edDESC_PRESUPUESTO;
      objeto.Presupuesto.GetParams(Objeto);

      dtpF_INICIO.DateTime:= Objeto.Apli.DameFechaEmpresa;
      edF_INICIO.text:=FormatDateTime('dd/mm/yyyy',dtpF_INICIO.DateTime);
      dtpF_FINAL.DateTime:= Objeto.Apli.DameFechaEmpresa;
      edF_FINAL.text:=FormatDateTime('dd/mm/yyyy',dtpF_FINAL.DateTime);

end;

procedure TWQMColCob.FormDestroy(Sender: TObject);
begin
      Objeto.Producto.CVE_PRODUCTO_CRE.Control := nil;
      Objeto.Producto.DESC_C_PRODUCTO.Control := nil;

      Objeto.Moneda.Cve_Moneda.Control := nil;
      Objeto.Moneda.Desc_Moneda.Control := nil;

      Objeto.GpoProd.CVE_PRODUCTO_GPO.Control := nil;
      Objeto.GpoProd.DESC_C_PROD_GPO.Control := nil;

      Objeto.MInstDesc.CVE_FND_ENT_DES.Control := nil;
      Objeto.MInstDesc.DESC_ENT_DES.Control    := nil;

      Objeto.Persona.Id_Persona.Control := nil;
      Objeto.Persona.Nombre.Control := nil;
      Objeto.Persona.Cve_Tipo_Sector.Control := nil;

      Objeto.Promotor.Nombre.Control :=nil;
      Objeto.Promotor.Id_Persona.Control :=nil;

      Objeto.PromotorAdmon.Nombre.Control :=nil;
      Objeto.PromotorAdmon.Id_Persona.Control :=nil;

      Objeto.Presupuesto.CVE_PRESUPUESTO.Control := nil;
      objeto.Presupuesto.DESC_PRESUPUESTO.Control := nil;
end;


procedure TWQMColCob.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWQMColCob.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWQMColCob.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWQMColCob.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


procedure TWQMColCob.InterForma1Imprimir(Sender: TObject);
begin
          RepInfCobCol(  edF_INICIO.Text      , edF_FINAL.Text,
                         objeto.Producto.CVE_PRODUCTO_CRE.AsString,Objeto.Moneda.Cve_Moneda.AsString,
                         Objeto.GpoProd.CVE_PRODUCTO_GPO.AsString,
                         Objeto.MInstDesc.CVE_FND_ENT_DES.AsString, Objeto.MInstDesc.DESC_ENT_DES.AsString,
                         Objeto.Persona.Id_Persona.AsString, Objeto.Persona.Nombre.AsString,
                         Objeto.Promotor.ID_Persona.AsString, Objeto.Promotor.Nombre.AsString,
                         Objeto.PromotorAdmon.ID_Persona.AsString, Objeto.PromotorAdmon.Nombre.AsString,
                         Objeto.Presupuesto.CVE_PRESUPUESTO.AsString,
                         edNbrArch.Text       ,
                         rgDescDoc.ItemIndex  ,   rgAgrupacion.ItemIndex  ,   rdPromotor.ItemIndex  ,
                         Objeto.Apli          ,
                         false);
end;

procedure TWQMColCob.InterForma1Preview(Sender: TObject);
begin
          RepInfCobCol(  edF_INICIO.Text      , edF_FINAL.Text,
                         objeto.Producto.CVE_PRODUCTO_CRE.AsString,Objeto.Moneda.Cve_Moneda.AsString,
                         Objeto.GpoProd.CVE_PRODUCTO_GPO.AsString,
                         Objeto.MInstDesc.CVE_FND_ENT_DES.AsString, Objeto.MInstDesc.DESC_ENT_DES.AsString,
                         Objeto.Persona.Id_Persona.AsString, Objeto.Persona.Nombre.AsString,
                         Objeto.Promotor.ID_Persona.AsString, Objeto.Promotor.Nombre.AsString,
                         Objeto.PromotorAdmon.ID_Persona.AsString, Objeto.PromotorAdmon.Nombre.AsString,
                         Objeto.Presupuesto.CVE_PRESUPUESTO.AsString,
                         edNbrArch.Text       ,
                         rgDescDoc.ItemIndex  ,   rgAgrupacion.ItemIndex  ,   rdPromotor.ItemIndex  ,
                         Objeto.Apli          ,
                         true);
end;

procedure TWQMColCob.btPRODUCTOClick(Sender: TObject);
begin
    Objeto.Producto.ShowAll := True;
    if Objeto.Producto.Busca Then Begin
        chbxProducto.Checked:= True;
        chbxProducto.Enabled:= True;
        InterForma1.NextTab(edCVE_PRODUCTO_CRE);
    end;

end;

procedure TWQMColCob.btCVE_MONEDAClick(Sender: TObject);
begin
   Objeto.Moneda.ShowAll := True;
   if Objeto.Moneda.Busca then Begin
        chbxMoneda.Checked:= True;
        chbxMoneda.Enabled:= True;
        InterForma1.NextTab(edCVE_MONEDA);
   End;

end;

procedure TWQMColCob.btCVE_PRODUCTO_GPOClick(Sender: TObject);
begin
   Objeto.GpoProd.ShowAll := True;
   If Objeto.GpoProd.Busca Then Begin
        cbxCVE_PRODUCTO_GPO.Checked:= True;
        cbxCVE_PRODUCTO_GPO.Enabled:= True;
        InterForma1.NextTab(edCVE_PRODUCTO_GPO);
   End;

end;

procedure TWQMColCob.btCVE_FND_ENT_DESClick(Sender: TObject);
begin
   Objeto.MInstDesc.ShowAll := True;
   If Objeto.MInstDesc.Busca Then Begin
        cdEntDesc.Checked:= True;
        cdEntDesc.Enabled:= True;
        InterForma1.NextTab(btCVE_FND_ENT_DES);
   End;
end;

procedure TWQMColCob.chbxProductoClick(Sender: TObject);
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

procedure TWQMColCob.chbxMonedaClick(Sender: TObject);
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

procedure TWQMColCob.cbxCVE_PRODUCTO_GPOClick(Sender: TObject);
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

procedure TWQMColCob.cdEntDescClick(Sender: TObject);
begin
   If not cdEntDesc.Checked Then Begin
      Objeto.MInstDesc.Active:=False;
      cdEntDesc.Checked:=False;
      cdEntDesc.Enabled:=False;
   End Else Begin
      cdEntDesc.Checked:=True;
      cdEntDesc.Enabled:=True;
   End;
end;

procedure TWQMColCob.ilPRODUCTOCapture(Sender: TObject; var Show: Boolean);
begin
     Show := True;
end;

procedure TWQMColCob.ilMONEDACapture(Sender: TObject; var Show: Boolean);
begin
     Show := True;
end;

procedure TWQMColCob.ilCVE_PRODUCTO_GPOCapture(Sender: TObject;
  var Show: Boolean);
begin
     Show := True;
end;

procedure TWQMColCob.ilCVE_FND_ENT_DESCapture(Sender: TObject;
  var Show: Boolean);
begin
     Show := True;
end;

procedure TWQMColCob.ilPRODUCTOEjecuta(Sender: TObject);
begin
    If Objeto.Producto.FindKey([ilPRODUCTO.Buffer])Then Begin
        chbxProducto.Checked:=True;
        chbxProducto.Enabled:=True;
        InterForma1.NextTab(edCVE_PRODUCTO_CRE);
    End;
end;

procedure TWQMColCob.ilMONEDAEjecuta(Sender: TObject);
begin
    If Objeto.Moneda.FindKey([ilMONEDA.Buffer]) Then Begin
        chbxMoneda.Checked:=True;
        chbxMoneda.Enabled:=True;
        InterForma1.NextTab(edCVE_MONEDA);
    End;
end;

procedure TWQMColCob.ilCVE_PRODUCTO_GPOEjecuta(Sender: TObject);
begin
   If Objeto.GpoProd.FindKey([ilCVE_PRODUCTO_GPO.Buffer]) Then Begin
        cbxCVE_PRODUCTO_GPO.Checked:= True;
        cbxCVE_PRODUCTO_GPO.Enabled:= True;
        InterForma1.NextTab(edCVE_PRODUCTO_GPO);
   End;
end;

procedure TWQMColCob.ilCVE_FND_ENT_DESEjecuta(Sender: TObject);
begin
   If Objeto.MInstDesc.FindKey([ilCVE_FND_ENT_DES.Buffer]) Then
   begin
        cdEntDesc.Checked:= True;
        cdEntDesc.Enabled:= True;
        InterForma1.NextTab(btCVE_FND_ENT_DES);
   end;
end;

procedure TWQMColCob.cbxArchivoClick(Sender: TObject);
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

procedure TWQMColCob.sbExcelClick(Sender: TObject);
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

procedure TWQMColCob.edNbrArchChange(Sender: TObject);
begin
    If Trim(edNbrArch.Text)<>'' Then Begin
        cbxArchivo.Checked:=True;
        cbxArchivo.Enabled:=True;
    End Else Begin
        cbxArchivo.Checked:=False;
        cbxArchivo.Enabled:=False;
    End;
end;

procedure TWQMColCob.btACREDITADOClick(Sender: TObject);
begin
     Objeto.Persona.ShowAll := True;
     if Objeto.Persona.Busca then
     begin
          cbpersona.Checked:= True;
          cbpersona.Enabled:= True;
          InterForma1.NextTab(edID_ACREDITADO);
     end;
end;

procedure TWQMColCob.ilPERSONAEjecuta(Sender: TObject);
Begin
     With Objeto Do
     Begin
          If Persona.FindKey([ilPersona.Buffer]) Then
          Begin
               cbpersona.Checked:= True;
               cbpersona.Enabled:= True;
               InterForma1.NextTab(edID_ACREDITADO);
          End;
    End;
end;


procedure TWQMColCob.cbpersonaClick(Sender: TObject);
begin
    If not cbpersona.Checked Then Begin
        Objeto.Persona.Active:=False;
        cbpersona.Checked:=False;
        cbpersona.Enabled:=False;
    End Else Begin
        cbpersona.Checked:=True;
        cbpersona.Enabled:=True;
    End;
end;

procedure TWQMColCob.btPROMOTORClick(Sender: TObject);
begin
    Objeto.Promotor.ShowAll := True;
    If ((Objeto.Promotor.Busca) or (Objeto.Promotor.Active)) Then Begin
        chbxPromotor.Checked:=True;
        chbxPromotor.Enabled:=True;
        rdPromotor.ItemIndex := 0;
        InterForma1.NextTab(edID_PROMOTOR);
    End;
end;

procedure TWQMColCob.ilPERSONACapture(Sender: TObject; var Show: Boolean);
begin
   Show:=True;
end;

procedure TWQMColCob.ilPROMOTORCapture(Sender: TObject; var Show: Boolean);
begin
   Show:=True;
end;

procedure TWQMColCob.ilPromAdmonCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TWQMColCob.ilPROMOTOREjecuta(Sender: TObject);
begin
    If Objeto.Promotor.FindKey([ilPROMOTOR.Buffer]) Then Begin
        chbxPromotor.Checked:=True;
        chbxPromotor.Enabled:=True;
        rdPromotor.ItemIndex := 0;
        InterForma1.NextTab(edID_PROMOTOR);
    End;
end;

procedure TWQMColCob.chbxPromotorClick(Sender: TObject);
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

procedure TWQMColCob.btPROM_ADMONClick(Sender: TObject);
begin
    Objeto.PromotorAdmon.ShowAll := True;
    If ((Objeto.PromotorAdmon.Busca) or (Objeto.PromotorAdmon.Active)) Then Begin
        chbxPromAmon.Checked:=True;
        chbxPromAmon.Enabled:=True;
        rdPromotor.ItemIndex := 0;
        InterForma1.NextTab(edID_PROM);
    End;
end;

procedure TWQMColCob.ilPromAdmonEjecuta(Sender: TObject);
begin
    If Objeto.PromotorAdmon.FindKey([ilPromAdmon.Buffer]) Then Begin
        chbxPromAmon.Checked:=True;
        chbxPromAmon.Enabled:=True;
        rdPromotor.ItemIndex := 0;
        InterForma1.NextTab(edID_PROM);
    End;
end;

procedure TWQMColCob.chbxPromAmonClick(Sender: TObject);
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

procedure TWQMColCob.rdPromotorClick(Sender: TObject);
begin
     if ((rdPromotor.ItemIndex > 0) and ((chbxPromotor.Checked) or (chbxPromAmon.Checked))) then
          rdPromotor.ItemIndex := 0;
     //end if;
end;

procedure TWQMColCob.bbPRESUPUESTOClick(Sender: TObject);
begin
    Objeto.Presupuesto.ShowAll := True;
    If ((Objeto.Presupuesto.Busca) or (Objeto.Presupuesto.Active)) Then Begin
        cbPRESUPUESTO.Checked:=True;
        cbPRESUPUESTO.Enabled:=True;
        rgAgrupacion.ItemIndex := 1;
        InterForma1.NextTab(edCVE_PRESUPUESTO);
    End;
end;

procedure TWQMColCob.ilPRESUPUESTOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TWQMColCob.ilPRESUPUESTOEjecuta(Sender: TObject);
begin
    If Objeto.Presupuesto.FindKey([ilPRESUPUESTO.Buffer]) Then Begin
        cbPRESUPUESTO.Checked:=True;
        cbPRESUPUESTO.Enabled:=True;
        rgAgrupacion.ItemIndex := 1;
        InterForma1.NextTab(edCVE_PRESUPUESTO);
    End;
end;

procedure TWQMColCob.cbPRESUPUESTOClick(Sender: TObject);
begin
    If not cbPRESUPUESTO.Checked Then Begin
        Objeto.Presupuesto.Active:=False;
        cbPRESUPUESTO.Checked:=False;
        cbPRESUPUESTO.Enabled:=False;
    End Else Begin
        cbPRESUPUESTO.Checked:=True;
        cbPRESUPUESTO.Enabled:=True;
    End;
end;

end.
