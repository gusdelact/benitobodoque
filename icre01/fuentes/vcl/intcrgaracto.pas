// Sistema         : Clase de CR_GARAN_CTO
// Fecha de Inicio : 30/09/2010
// Función forma   : Clase de CR_GARAN_CTO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : 
// Comentarios     :
Unit IntCrGaraCto;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
IntMTipoGar, //TIPO DE GARANTIA
IntParamCre,  //parametros,
IntMon,           //Moneda
IntCtto, InterEdit, IntLinkit          //Autorización
;

Type
 TCrGaraCto= class; 

  TWCrGaranCto=Class(TForm)
    InterForma1             : TInterForma;
    GroupBox1: TGroupBox;
    lbF_CIERRE: TLabel;
    dtpF_CIERRE: TInterDateTimePicker;
    edF_CIERRE: TEdit;
    lbID_CONTRATO: TLabel;
    edID_CONTRATO: TEdit;
    lbCVE_MONEDA: TLabel;
    edCVE_MONEDA: TEdit;
    lbID_CONTRATO_OTORG: TLabel;
    lbCVE_MONEDA_OTORG: TLabel;
    edCVE_MONEDA_OTORG: TEdit;
    GroupBox2: TGroupBox;
    lbDESC_GARANTIA: TLabel;
    edDESC_GARANTIA: TEdit;
    lbSEGURO: TLabel;
    lbBURSATILIDAD: TLabel;
    lbIMP_GARANTIA: TLabel;
    lbIMP_GARANTIA_VP: TLabel;
    rgSIT_GARAN_CTO: TRadioGroup;
    lbF_AVALUO: TLabel;
    edF_AVALUO: TEdit;
    lbLUGAR_PREF_BAN: TLabel;
    dtpF_AVALUO: TInterDateTimePicker;
    lbID_TIPO_GAR: TLabel;
    edID_TIPO_GAR: TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    GroupBox3: TGroupBox;
    lbF_ALTA: TLabel;
    edF_ALTA: TEdit;
    Label1: TLabel;
    edCVE_USU_ALTA: TEdit;
    edFH_MODIFICA: TEdit;
    edCVE_USU_MODIFICA: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    btID_CONTRATO: TBitBtn;
    btCVE_TIPO_GAR: TBitBtn;
    edNOM_CVE_TIPO_GAR: TEdit;
    edSEGURO: TInterEdit;
    edBURSATILIDAD: TInterEdit;
    edLUGAR_PREF_BAN: TInterEdit;
    edIMP_GARANTIA: TInterEdit;
    edIMP_GARANTIA_VP: TInterEdit;
    btCVE_MONEDA: TBitBtn;
    edID_CONTRATO_OTORG: TInterEdit;
    ilID_CONTRATO: TInterLinkit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure btID_CONTRATOClick(Sender: TObject);
    procedure btCVE_TIPO_GARClick(Sender: TObject);
    procedure btCVE_MONEDAClick(Sender: TObject);
    procedure ilID_CONTRATOEjecuta(Sender: TObject);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrGaraCto;
end; 
 TCrGaraCto= class(TInterFrame) 
      private 
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        F_CIERRE                 : TInterCampo;
        F_ALTA                   : TInterCampo;
        ID_TIPO_GAR              : TInterCampo;
        ID_CONTRATO              : TInterCampo;
        CVE_MONEDA               : TInterCampo;
        ID_CONTRATO_OTORG        : TInterCampo;
        CVE_MONEDA_OTORG         : TInterCampo;
        F_AVALUO                 : TInterCampo;
        LUGAR_PREF_BAN           : TInterCampo;
        DESC_GARANTIA            : TInterCampo;
        SEGURO                   : TInterCampo;
        BURSATILIDAD             : TInterCampo;
        IMP_GARANTIA             : TInterCampo;
        IMP_GARANTIA_VP          : TInterCampo;
        SIT_GARAN_CTO            : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        FH_MODIFICA              : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        Cto                      : TContrato;
        MTipoGar            : TMTipoGar;
        ParamCre                 : TParamCre;
        Moneda                  : TMoneda;
        Moneda_Otorg            : TMoneda;
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


constructor TCrGaraCto.Create( AOwner : TComponent );
begin Inherited; 
      F_CIERRE :=CreaCampo('F_CIERRE',ftDate,tsNinguno,tsNinguno,True);
                F_CIERRE.Caption:='Fecha Cierre';
      F_ALTA :=CreaCampo('FH_ALTA',ftDateTime,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      ID_TIPO_GAR :=CreaCampo('ID_TIPO_GAR',ftFloat,tsNinguno,tsNinguno,True);
                ID_TIPO_GAR.Caption:='Número de Tipo Gar';
      ID_CONTRATO :=CreaCampo('ID_CONTRATO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CONTRATO.Caption:='Número de Contrato';
      CVE_MONEDA :=CreaCampo('CVE_MONEDA',ftFloat,tsNinguno,tsNinguno,True);
                CVE_MONEDA.Caption:='Clave de Moneda';
      ID_CONTRATO_OTORG :=CreaCampo('ID_CONTRATO_OTORG',ftFloat,tsNinguno,tsNinguno,True);
                ID_CONTRATO_OTORG.Caption:='Número de Contrato Otorg';
      CVE_MONEDA_OTORG :=CreaCampo('CVE_MONEDA_OTORG',ftFloat,tsNinguno,tsNinguno,True);
                CVE_MONEDA_OTORG.Caption:='Clave de Moneda Otorg';
      F_AVALUO :=CreaCampo('F_AVALUO',ftDate,tsNinguno,tsNinguno,True);
                F_AVALUO.Caption:='Fecha Avaluo';
      LUGAR_PREF_BAN :=CreaCampo('LUGAR_PREF_BAN',ftFloat,tsNinguno,tsNinguno,True);
                LUGAR_PREF_BAN.Caption:='Lugar Pref Ban';
      DESC_GARANTIA :=CreaCampo('DESC_GARANTIA',ftString,tsNinguno,tsNinguno,True);
                DESC_GARANTIA.Caption:='Descripción Garantia';
      SEGURO :=CreaCampo('SEGURO',ftFloat,tsNinguno,tsNinguno,True);
                SEGURO.Caption:='Seguro';
      BURSATILIDAD :=CreaCampo('BURSATILIDAD',ftFloat,tsNinguno,tsNinguno,True);
                BURSATILIDAD.Caption:='Bursatilidad';
      IMP_GARANTIA :=CreaCampo('IMP_GARANTIA',ftFloat,tsNinguno,tsNinguno,True);
                IMP_GARANTIA.Caption:='Imp Garantia';
      IMP_GARANTIA_VP :=CreaCampo('IMP_GARANTIA_VP',ftFloat,tsNinguno,tsNinguno,True);
                IMP_GARANTIA_VP.Caption:='Imp Garantia Vp';
      SIT_GARAN_CTO :=CreaCampo('SIT_GARAN_CTO',ftString,tsNinguno,tsNinguno,True);
                SIT_GARAN_CTO.Caption:='Situación Garan Cto';
   With SIT_GARAN_CTO do begin
      Size:=2;
      UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add('AC');
      ComboLista.Add('1'); ComboDatos.Add('IN');
   end;
      SIT_GARAN_CTO.NoCompare:= True;

       FH_MODIFICA :=CreaCampo('FH_MODIFICA',ftDateTime,tsNinguno,tsNinguno,True);
                FH_MODIFICA.Caption:='Fecha modificacion';

      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Usuario Alta';

      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Usuario modificacion';


      Moneda := TMoneda.Create(Self);
      Moneda.MasterSource:=Self;

      Moneda_Otorg := TMoneda.Create(Self);
      Moneda_Otorg.MasterSource:=Self;

      Cto := TContrato.Create(Self);
      Cto.MasterSource := Self;
      Cto.FieldByName('ID_CONTRATO').MasterField      :='ID_CONTRATO';

      MTipoGar := TMTipoGar.Create(Self);
      MTipoGar.MasterSource := Self;
      MTipoGar.FieldByName('CVE_TIPO_GAR').MasterField := 'ID_TIPO_GAR';


      FKeyFields.Add('F_CIERRE');
      FKeyFields.Add('ID_TIPO_GAR');
      FKeyFields.Add('ID_CONTRATO');


      TableName := 'CR_GARAN_CTO'; 
      UseQuery := True; 
      HelpFile := 'IntCrGaraCto.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrGaraCto.Destroy;
begin


  If Moneda <> Nil Then
      Moneda.Free;
  If Moneda_Otorg <> Nil Then
      Moneda_Otorg.Free;
   If Cto <> Nil Then
      Cto.Free;
   If MTipoGar <> Nil Then
     MTipoGar.Free;
     inherited;
end;


function TCrGaraCto.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrGaranCto;
begin
   W:=TWCrGaranCto.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrGaraCto.InternalBusca:Boolean;
Var T:TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('ICrGaCt.it','S,S,S');
   Try
      if Active then begin
         T.Param(0,F_CIERRE.AsString);
         T.Param(1,ID_TIPO_GAR.AsString);
         T.Param(2,ID_CONTRATO.AsString);
      end;
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2)]);
   finally
      T.Free;
   end;

end;

function TCrGaraCto.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CR_GARAN_CTO********************)
(*                                                                              *)
(*  FORMA DE CR_GARAN_CTO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_GARAN_CTO********************)

procedure TWCrGaranCto.FormShow(Sender: TObject);
begin
      Objeto.F_CIERRE.Control:=edF_CIERRE;
      Objeto.F_ALTA.Control:=edF_ALTA;
      Objeto.ID_TIPO_GAR.Control:=edID_TIPO_GAR;
      Objeto.ID_CONTRATO.Control:=edID_CONTRATO;

      Objeto.ID_CONTRATO_OTORG.Control:=edID_CONTRATO_OTORG;
      Objeto.CVE_MONEDA_OTORG.Control:=edCVE_MONEDA_OTORG;
      Objeto.F_AVALUO.Control:=edF_AVALUO;
      Objeto.LUGAR_PREF_BAN.Control:=edLUGAR_PREF_BAN;
      Objeto.DESC_GARANTIA.Control:=edDESC_GARANTIA;
      Objeto.SEGURO.Control:=edSEGURO;
      Objeto.BURSATILIDAD.Control:=edBURSATILIDAD;
      Objeto.IMP_GARANTIA.Control:=edIMP_GARANTIA;
      Objeto.IMP_GARANTIA_VP.Control:=edIMP_GARANTIA_VP;
      Objeto.SIT_GARAN_CTO.Control:=rgSIT_GARAN_CTO;
      Objeto.CVE_USU_ALTA.Control :=edCVE_USU_ALTA;
      Objeto.FH_MODIFICA.Control := edFH_MODIFICA;
      Objeto.CVE_USU_MODIFICA.Control := edCVE_USU_MODIFICA;

      Objeto.Cto.ID_CONTRATO.Control := edID_CONTRATO;
      Objeto.Cto.CVE_MONEDA.Control:=edCVE_MONEDA;


      Objeto.MTipoGar.ID_TIPO_GAR.Control  := edID_TIPO_GAR;
      Objeto.MTipoGar.DESC_TIPO_GAR.Control := edNOM_CVE_TIPO_GAR;

       Objeto.Moneda.Cve_Moneda.Control := edCVE_MONEDA;

       Objeto.Moneda_Otorg.Cve_Moneda.Control := edCVE_MONEDA_OTORG;
end;

procedure TWCrGaranCto.FormDestroy(Sender: TObject);
begin
      Objeto.F_CIERRE.Control:=nil;
      Objeto.F_ALTA.Control:=nil;
      Objeto.ID_TIPO_GAR.Control:=nil;
      Objeto.ID_CONTRATO.Control:=nil;
      Objeto.ID_CONTRATO_OTORG.Control:=nil;
      Objeto.CVE_MONEDA_OTORG.Control:=nil;
      Objeto.F_AVALUO.Control:=nil;
      Objeto.LUGAR_PREF_BAN.Control:=nil;
      Objeto.DESC_GARANTIA.Control:=nil;
      Objeto.SEGURO.Control:=nil;
      Objeto.BURSATILIDAD.Control:=nil;
      Objeto.IMP_GARANTIA.Control:=nil;
      Objeto.IMP_GARANTIA_VP.Control:=nil;
      Objeto.SIT_GARAN_CTO.Control:=nil;
      Objeto.CVE_USU_ALTA.Control :=nil;
      Objeto.FH_MODIFICA.Control := nil;
      Objeto.CVE_USU_MODIFICA.Control := nil;
   //Objeto
end;

procedure TWCrGaranCto.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrGaranCto.InterForma1DespuesNuevo(Sender: TObject);
begin

edCVE_MONEDA_OTORG.Enabled  := false;
edCVE_MONEDA.Enabled        := false;
edIMP_GARANTIA_VP.Enabled   := false;
edID_CONTRATO_OTORG.Enabled   := false;

edID_CONTRATO_OTORG.Color   := clBtnFace;
edCVE_MONEDA_OTORG.Color    := clBtnFace;
edCVE_MONEDA.Color          := clBtnFace;
edIMP_GARANTIA_VP.Color    := clBtnFace;
rgSIT_GARAN_CTO.ItemIndex   := 0;

end;

procedure TWCrGaranCto.InterForma1DespuesModificar(Sender: TObject);
begin

edF_CIERRE.Enabled          := false;
dtpF_CIERRE.Enabled         := false;
edID_CONTRATO.Enabled       := false;
edID_CONTRATO_OTORG.Enabled := false;
edCVE_MONEDA_OTORG.Enabled  := false;
edCVE_MONEDA.Enabled        := false;
edIMP_GARANTIA_VP.Enabled   := false;

btID_CONTRATO.Enabled        := false;

edF_CIERRE.Color            := clBtnFace;
edID_CONTRATO.Color         := clBtnFace;
edID_CONTRATO_OTORG.Color   := clBtnFace;
edCVE_MONEDA_OTORG.Color    := clBtnFace;
edCVE_MONEDA.Color          := clBtnFace;
edIMP_GARANTIA_VP.Color     := clBtnFace;
edID_TIPO_GAR.SetFocus;

 if objeto.CVE_MONEDA_OTORG.AsInteger = -1  then // si es -1 significa que no localizó la moneda de la garantia en el proceso de gestion
        btCVE_MONEDA.Enabled        := true
 else
        btCVE_MONEDA.Enabled        := false;
end;

//procedure TWCrGaranCto.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCrGaranCto.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin

   With Objeto Do Begin
      if IsNewData then Begin
         if edID_CONTRATO.Text = '' then
         Begin
            Realizado := False;
            ShowMessage('Se Requiere el Número de la Línea');
            exit;
         End;

         if edID_TIPO_GAR.Text = '' then
         Begin
            Realizado := False;
            ShowMessage('Se Requiere el Tipo de Garantía');
            exit;
         End;

         if edF_CIERRE.Text = '' then
         Begin
            Realizado := False;
            ShowMessage('Se Requiere la fecha de Cierre');
            exit;
         End;
         if edCVE_MONEDA_OTORG.Text = '' then
         Begin
            Realizado := False;
            ShowMessage('Se Requiere la moneda de la garantía');
            exit;
         End;

         if MessageDlg('¿Desea almacenar los datos capturados?',
            mtConfirmation,[mbYes, mbNo], 0) = mrYes then Begin
            CVE_USU_ALTA.AsString := DameUsuario;
            F_ALTA.AsDateTime     := Now;

            Realizado := True;
         end else
            Realizado := False;
      end else Begin
         if MessageDlg('¿Desea guardar los datos modificados?',
              mtConfirmation,[mbYes, mbNo], 0) = mrYes then Begin
            CVE_USU_MODIFICA.AsString := DameUsuario;
            FH_MODIFICA.AsDateTime    := Now;
            Realizado := True;
         end else
            Realizado := False;
      end
   End;
end;

procedure TWCrGaranCto.btID_CONTRATOClick(Sender: TObject);
begin
   Objeto.Cto.ShowAll := True;
   If Objeto.Cto.Busca Then Begin
      InterForma1.NextTab(edID_CONTRATO);
   End;
end;

procedure TWCrGaranCto.btCVE_TIPO_GARClick(Sender: TObject);
begin
   Objeto.MTipoGar.ShowAll := True;
   If Objeto.MTipoGar.Busca Then Begin
      InterForma1.NextTab(edID_TIPO_GAR);
   End;
end;

procedure TWCrGaranCto.btCVE_MONEDAClick(Sender: TObject);
begin
   Objeto.Moneda_Otorg.ShowAll := True;
   Objeto.Moneda_Otorg.Busca

end;

procedure TWCrGaranCto.ilID_CONTRATOEjecuta(Sender: TObject);
begin
   If Objeto.Cto.FindKey([ilID_CONTRATO.Buffer])Then Begin 
      InterForma1.NextTab(edID_CONTRATO);
   End;
end;

end.
