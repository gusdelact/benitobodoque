// Sistema         : Clase de CR_PORTAFOLIO
// Fecha de Inicio : 31/03/2012
// Función forma   : Clase de CR_PORTAFOLIO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Julio's Cesar Ruiz Castro
// Comentarios     :
Unit IntCrPortafo;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntParamCre, IntLinkit,
    IntCrRegion,        // Catálogo de regiones - Tiene relacion con el Contrato
    IntCrMercObj,       // Catálogo de mercado al que esta dirigido el contrato
    IntCrMeObDe         // Catálogo de Sub Mercado Objetivo
;

Type
 TCrPortafo= class; 

  TWCrPortafolio=Class(TForm)
    InterForma1             : TInterForma; 
    lbID_CONTRATO : TLabel; 
    edID_CONTRATO : TEdit;
    lbCVE_MERCADO : TLabel; 
    edCVE_MERCADO : TEdit;
    lbID_SUB_MERC : TLabel; 
    edID_SUB_MERC : TEdit;
    lbID_REGION : TLabel; 
    edID_REGION : TEdit;
    lbFH_ALTA : TLabel;
    dtpFH_ALTA : TInterDateTimePicker; 
    edFH_ALTA : TEdit;
    lbCVE_USU_ALTA : TLabel; 
    edCVE_USU_ALTA : TEdit;
    lbFH_MODIFICA : TLabel; 
    dtpFH_MODIFICA : TInterDateTimePicker; 
    edFH_MODIFICA : TEdit;
    lbCVE_USU_MODIFICA : TLabel; 
    edCVE_USU_MODIFICA : TEdit;
    rgSIT_PORTAFOLIO: TRadioGroup;
    btCVE_MERCADO: TBitBtn;
    btID_SUB_MERC: TBitBtn;
    BitBtn2: TBitBtn;
    edDESC_MERCADO: TEdit;
    edDESC_SUB_MERC: TEdit;
    edDESCRIPCION: TEdit;
    ilkID_REGION: TInterLinkit;
    ilkCVE_MERCADO: TInterLinkit;
    ilkID_SUB_MERC: TInterLinkit;
    lblID_CONTRATO: TLabel;
    cbCVE_FUENTE_PAGO: TComboBox;
    Label1: TLabel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure btCVE_MERCADOClick(Sender: TObject);
    procedure btID_SUB_MERCClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ilkCVE_MERCADOCapture(Sender: TObject; var Show: Boolean);
    procedure ilkID_SUB_MERCCapture(Sender: TObject; var Show: Boolean);
    procedure ilkID_REGIONCapture(Sender: TObject; var Show: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure InterForma1BtnBuscarClick(Sender: TObject);
    private 
    { Private declarations } 
    public 
    { Public declarations }


    Objeto : TCrPortafo;
end; 
 TCrPortafo= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        ParamCre                 : TParamCre;

        ID_CONTRATO              : TInterCampo;
        CVE_MERCADO              : TInterCampo;
        ID_SUB_MERC              : TInterCampo;
        ID_REGION                : TInterCampo;
        FH_ALTA                  : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        FH_MODIFICA              : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        SIT_PORTAFOLIO           : TInterCampo;
        CVE_FUENTE_PAGO          : TInterCampo;

        CrRegion                 : TCrRegion;
        CrMercObj                : TCrMercObj;
        CrMeObDe                 : TCrMeObDe;

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


constructor TCrPortafo.Create( AOwner : TComponent );
begin Inherited;
      ID_CONTRATO :=CreaCampo('ID_CONTRATO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CONTRATO.Caption:='Número de Contrato';
      CVE_MERCADO :=CreaCampo('CVE_MERCADO',ftString,tsNinguno,tsNinguno,True);
                CVE_MERCADO.Caption:='Clave de Mercado';
      ID_SUB_MERC :=CreaCampo('ID_SUB_MERC',ftFloat,tsNinguno,tsNinguno,True);
                ID_SUB_MERC.Caption:='Clave de Sub Merc';
      ID_REGION :=CreaCampo('ID_REGION',ftFloat,tsNinguno,tsNinguno,True);
                ID_REGION.Caption:='Número de Region';
      FH_ALTA :=CreaCampo('FH_ALTA',ftDate,tsNinguno,tsNinguno,True);
                FH_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      FH_MODIFICA :=CreaCampo('FH_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                FH_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      SIT_PORTAFOLIO :=CreaCampo('SIT_PORTAFOLIO',ftString,tsNinguno,tsNinguno,True);
      With SIT_PORTAFOLIO do
      begin Size:=2;
        UseCombo:=True;
        ComboLista.Add('0');    ComboDatos.Add('AC');
        ComboLista.Add('1');    ComboDatos.Add('CA');
      end;
      CVE_FUENTE_PAGO := CreaCampo( 'CVE_FUENTE_PAGO',  ftString,  tsNinguno, tsNinguno, True );
      With CVE_FUENTE_PAGO do begin
        Size:=2;
        UseCombo:=True;
        ComboLista.Add('PPS');    ComboDatos.Add('01'); // Disminuir monto
        ComboLista.Add('Cesión de derechos');      ComboDatos.Add('02'); // Acortar plazo
        ComboLista.Add('Flujo Proyecto');    ComboDatos.Add('03'); // Disminuir monto
        ComboLista.Add('No Aplica');      ComboDatos.Add('04'); // Acortar plazo
        ComboLista.Add('Otros');      ComboDatos.Add('05'); // Acortar plazo
      end;

      FKeyFields.Add('ID_CONTRATO');

      TableName := 'CR_PORTAFOLIO';
      UseQuery := True;
      HelpFile := 'IntCrPortafo.Hlp';
      ShowMenuReporte:=True;

      CrRegion := TCrRegion.Create(Self);
      CrRegion.MasterSource := Self;
      CrRegion.FieldByName('ID_REGION').MasterField := 'ID_REGION';

      CrMercObj := TCrMercObj.Create(Self);
      CrMercObj.MasterSource := Self;
      CrMercObj.FieldByName('CVE_MERCADO').MasterField := 'CVE_MERCADO';

      CrMeObDe := TCrMeObDe.Create(Self);
      CrMeObDe.MasterSource := Self;
      CrMeObDe.FieldByName('CVE_MERCADO').MasterField := 'CVE_MERCADO';

end;

Destructor TCrPortafo.Destroy;
begin
  if CrRegion <> nil then
     CrRegion.Free;
  if CrMercObj <> nil then
     CrMercObj.Free;
  if CrMeObDe <> nil then
     CrMeObDe.Free;

inherited;
end;


function TCrPortafo.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrPortafolio;
begin
   W:=TWCrPortafolio.Create(Self);
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


Function TCrPortafo.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrPorta.it','F');
      Try if Active then begin T.Param(0,ID_CONTRATO.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

function TCrPortafo.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CR_PORTAFOLIO********************)
(*                                                                              *)
(*  FORMA DE CR_PORTAFOLIO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_PORTAFOLIO********************)

procedure TWCrPortafolio.FormShow(Sender: TObject);
begin
      Objeto.ID_CONTRATO.Control:=edID_CONTRATO;
      Objeto.CVE_MERCADO.Control:=edCVE_MERCADO;
      Objeto.ID_SUB_MERC.Control:=edID_SUB_MERC;
      Objeto.ID_REGION.Control:=edID_REGION;
      Objeto.FH_ALTA.Control:=edFH_ALTA;
      Objeto.CVE_USU_ALTA.Control:=edCVE_USU_ALTA;
      Objeto.FH_MODIFICA.Control:=edFH_MODIFICA;
      Objeto.CVE_USU_MODIFICA.Control:=edCVE_USU_MODIFICA;
      Objeto.SIT_PORTAFOLIO.Control:=rgSIT_PORTAFOLIO;
      Objeto.CVE_FUENTE_PAGO.Control:=cbCVE_FUENTE_PAGO;

      Objeto.CrRegion.ID_REGION.Control := edID_REGION;
      Objeto.CrRegion.DESC_REGION.Control := edDESCRIPCION;
      Objeto.CrRegion.GetParams(Objeto);

      Objeto.CrMercObj.CVE_MERCADO.Control := edCVE_MERCADO;
      Objeto.CrMercObj.DESC_MERCADO.Control := edDESC_MERCADO;
      Objeto.CrMercObj.GetParams(Objeto);

      Objeto.CrMeObDe.FindKey([Objeto.CrMercObj.CVE_MERCADO.AsString, Objeto.ID_SUB_MERC.AsString]);
      Objeto.CrMeObDe.ID_SUB_MERC.Control := edID_SUB_MERC;
      Objeto.CrMeObDe.DESC_SUB_MERC.Control := edDESC_SUB_MERC;
      Objeto.CrMeObDe.GetParams(Objeto);

end;

procedure TWCrPortafolio.FormDestroy(Sender: TObject);
begin
      Objeto.ID_CONTRATO.Control:=nil;
      Objeto.CVE_MERCADO.Control:=nil;
      Objeto.ID_SUB_MERC.Control:=nil;
      Objeto.ID_REGION.Control:=nil;
      Objeto.FH_ALTA.Control:=nil;
      Objeto.CVE_USU_ALTA.Control:=nil;
      Objeto.FH_MODIFICA.Control:=nil;
      Objeto.CVE_USU_MODIFICA.Control:=nil;
      Objeto.SIT_PORTAFOLIO.Control:=nil;
      Objeto.CVE_FUENTE_PAGO.Control := nil;
   //Objeto
end;

procedure TWCrPortafolio.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrPortafolio.InterForma1DespuesNuevo(Sender: TObject);
begin//<<Control>>.SetFocus;
  rgSIT_PORTAFOLIO.ItemIndex := 0;
end;

procedure TWCrPortafolio.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrPortafolio.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


procedure TWCrPortafolio.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   with Objeto do
   begin
      if IsNewData then
      begin
         if MessageDlg('¿Desea almacenar los datos capturados?',
            mtConfirmation,[mbYes, mbNo], 0) = mrYes then
         begin
            ID_CONTRATO.AsString := trim(lblID_CONTRATO.Caption);
            CVE_USU_ALTA.AsString := DameUsuario;
            FH_ALTA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
            Realizado := True;
         end else
            Realizado := False;
      end else
      begin
         if MessageDlg('¿Desea guardar los datos modificados?',
              mtConfirmation,[mbYes, mbNo], 0) = mrYes then
         begin
            CVE_USU_MODIFICA.AsString := DameUsuario;
            FH_MODIFICA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
            Realizado := True;
         end else
            Realizado := False;
      end
   end;

end;

procedure TWCrPortafolio.btCVE_MERCADOClick(Sender: TObject);
begin
    Objeto.CrMercObj.ShowAll := True;
    if Objeto.CrMercObj.Busca then
       InterForma1.NextTab(edCVE_MERCADO);
end;

procedure TWCrPortafolio.btID_SUB_MERCClick(Sender: TObject);
begin
    Objeto.CrMeObDe.BuscaWhereString:= ' CR_MERCADO_OBJ_DET.CVE_MERCADO = ' + QuotedStr( Objeto.CVE_MERCADO.AsString );
    Objeto.CrMeObDe.FilterString := Objeto.CrMeObDe.BuscaWhereString;

    if Objeto.CrMeObDe.Busca then
       InterForma1.NextTab(edID_SUB_MERC);
end;

procedure TWCrPortafolio.BitBtn2Click(Sender: TObject);
begin
    Objeto.CrRegion.ShowAll := True;
    if Objeto.CrRegion.Busca then
       InterForma1.NextTab(edID_REGION);
end;

procedure TWCrPortafolio.ilkCVE_MERCADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit);
end;

procedure TWCrPortafolio.ilkID_SUB_MERCCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit);
end;

procedure TWCrPortafolio.ilkID_REGIONCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit);
end;

procedure TWCrPortafolio.FormActivate(Sender: TObject);
begin
  // Esto lo hacemos por que por alguna razon no me permite la pantalla
  //  asignar el nuero de contrato heredado de la pantalla de Contrato.
  //  Solo es efecto visual
  edID_CONTRATO.Visible := false;
  lblID_CONTRATO.Caption := Objeto.ID_CONTRATO.AsString;

  // Los registros nuevos se manejan desde "intCrCto"
  InterForma1.BtnNuevo.Enabled := false;
  InterForma1.BtnNuevo.Visible := false;
end;

procedure TWCrPortafolio.InterForma1BtnBuscarClick(Sender: TObject);
begin
  // Los datos del contrato "Objeto.ID_CONTRATO.AsString" lo pasamos desde que llamamos a forma
  //  desde el intCrCto "CrPortafo.ID_CONTRATO.AsString := Objeto.ID_CONTRATO.AsString;"
  Objeto.BuscaWhereString:= ' CR_PORTAFOLIO.ID_CONTRATO = ' + QuotedStr( Objeto.ID_CONTRATO.AsString );
  Objeto.FilterString := Objeto.BuscaWhereString;

  if Objeto.Busca then
     InterForma1.NextTab(edID_CONTRATO);
end;

end.
