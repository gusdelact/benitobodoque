// Sistema         : Clase de CR_REL_LIQ_MON
// Fecha de Inicio : 26/04/2003
// Función forma   : Clase de CR_REL_LIQ_MON
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrReLiMn;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
//UNIDADES ADICIONALES

IntParamCre,
IntCrLiqDis,
IntMon, IntLinkit, IntGenCre;

Type
 TCrReLiMn= class; 

  TWCrRelLiqMn=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_LIQUIDACION : TLabel; 
    edCVE_LIQUIDACION : TEdit;
    lbCVE_MONEDA : TLabel; 
    edCVE_MONEDA : TEdit;
    lbCVE_LIQ_CHQRA : TLabel;
    rgCVE_LIQ_CHQRA : TRadioGroup;
    btMONEDA: TBitBtn;
    edDESC_MONEDA: TEdit;
    edDESC_LIQUIDA: TEdit;
    BitBtn1: TBitBtn;
    MsgPanel: TPanel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    ilLIQUIDA: TInterLinkit;
    ilMONEDA: TInterLinkit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ilLIQUIDAEjecuta(Sender: TObject);
    procedure edCVE_LIQUIDACIONExit(Sender: TObject);
    procedure btMONEDAClick(Sender: TObject);
    procedure ilMONEDAEjecuta(Sender: TObject);
    procedure edCVE_MONEDAExit(Sender: TObject);
    procedure ilLIQUIDACapture(Sender: TObject; var Show: Boolean);
    procedure ilMONEDACapture(Sender: TObject; var Show: Boolean);
    procedure rgCVE_LIQ_CHQRAExit(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrReLiMn;
end; 
 TCrReLiMn= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        CVE_LIQUIDACION          : TInterCampo;
        CVE_MONEDA               : TInterCampo;
        CVE_LIQ_CHQRA            : TInterCampo;

        //Clases Adicionales
        ParamCre                 : TParamCre;
        Liquida                  : TCrLiqDis;
        Moneda                   : TMoneda;

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


constructor TCrReLiMn.Create( AOwner : TComponent );
begin Inherited;
      CVE_LIQUIDACION :=CreaCampo('CVE_LIQUIDACION',ftString,tsNinguno,tsNinguno,True);
                CVE_LIQUIDACION.Caption:='Medio Liquidación';
      CVE_MONEDA :=CreaCampo('CVE_MONEDA',ftFloat,tsNinguno,tsNinguno,True);
                CVE_MONEDA.Caption:='Moneda';
      CVE_LIQ_CHQRA :=CreaCampo('CVE_LIQ_CHQRA',ftString,tsNinguno,tsNinguno,True);
         With CVE_LIQ_CHQRA do
          begin Size:=2;
                UseCombo:=True;
                ComboLista.Add('0');    ComboDatos.Add('LP');
                ComboLista.Add('1');    ComboDatos.Add('LD');
          end;
                CVE_LIQ_CHQRA.Caption:='Chequera Correspondiente';

      FKeyFields.Add('CVE_LIQUIDACION');
      FKeyFields.Add('CVE_MONEDA');
      FKeyFields.Add('CVE_LIQ_CHQRA');

      TableName := 'CR_REL_LIQ_MON';
      UseQuery := True;
      HelpFile := 'IntCrReLiMn.Hlp';
      ShowMenuReporte:=True;

      Liquida := TCrLiqDis.Create(Self);
      Liquida.MasterSource:=Self;
      Liquida.FieldByName('CVE_LIQUIDACION').MasterField:='CVE_LIQUIDACION';

      Moneda := TMoneda.Create(Self);
      Moneda.MasterSource:=Self;
      Moneda.FieldByName('CVE_MONEDA').MasterField:='CVE_MONEDA';
end;

Destructor TCrReLiMn.Destroy;
begin
      if Liquida <> nil then
         Liquida.free;
      //end if

      if Moneda<> nil then
         Moneda.free;
      //end if

      inherited;
end;


function TCrReLiMn.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrRelLiqMn;
begin
   W:=TWCrRelLiqMn.Create(Self);
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


Function TCrReLiMn.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrRLMn.it','S,F,S');
      Try if Active then begin T.Param(0,CVE_LIQUIDACION.AsString);
                               T.Param(1,CVE_MONEDA.AsString);
                               T.Param(2,CVE_LIQ_CHQRA.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2)]);
      finally  T.Free;
      end;
end;

function TCrReLiMn.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA CR_REL_LIQ_MON********************)
(*                                                                              *)
(*  FORMA DE CR_REL_LIQ_MON                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_REL_LIQ_MON********************)

procedure TWCrRelLiqMn.FormShow(Sender: TObject);
begin
      //Pinta los datos del panel inferior
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_LIQUIDACION.Control:=edCVE_LIQUIDACION;
      Objeto.CVE_MONEDA.Control:=edCVE_MONEDA;
      Objeto.CVE_LIQ_CHQRA.Control:=rgCVE_LIQ_CHQRA;

      Objeto.Liquida.DESC_LIQUIDACION.Control := edDESC_LIQUIDA;
      Objeto.Liquida.GetFromControl;

      Objeto.Moneda.Desc_Moneda.Control := edDESC_MONEDA;
      Objeto.Moneda.GetFromControl;
      
      Interforma1.MsgPanel := MsgPanel;
end;

procedure TWCrRelLiqMn.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_LIQUIDACION.Control:=nil;
      Objeto.CVE_MONEDA.Control:=nil;
      Objeto.CVE_LIQ_CHQRA.Control:=nil;
      Objeto.Liquida.DESC_LIQUIDACION.Control := nil;
      Objeto.Moneda.Desc_Moneda.Control := nil;
end;

procedure TWCrRelLiqMn.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrRelLiqMn.InterForma1DespuesNuevo(Sender: TObject);
begin edCVE_LIQUIDACION.SetFocus;
end;

procedure TWCrRelLiqMn.InterForma1DespuesModificar(Sender: TObject);
begin rgCVE_LIQ_CHQRA.SetFocus;
end;

procedure TWCrRelLiqMn.BitBtn1Click(Sender: TObject);
begin
   Objeto.Liquida.ShowAll := True;
   if Objeto.Liquida.Busca then
      InterForma1.NextTab(edCVE_LIQUIDACION);
   //end if
end;

procedure TWCrRelLiqMn.ilLIQUIDAEjecuta(Sender: TObject);
begin
   if Objeto.Liquida.FindKey([ilLIQUIDA.Buffer]) then
      InterForma1.NextTab(edCVE_LIQUIDACION);
   //end if
end;

procedure TWCrRelLiqMn.edCVE_LIQUIDACIONExit(Sender: TObject);
var  vlSalida   :  boolean;
     vlMsg      :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlSalida := True;
      Objeto.CVE_LIQUIDACION.GetFromControl;
      if Objeto.CVE_LIQUIDACION.AsString = CNULL then
       Begin
            vlSalida := False;
            vlMsg := 'Favor de indicar la clave de liquidación';
       end;
      InterForma1.ValidaExit(edCVE_LIQUIDACION,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrRelLiqMn.btMONEDAClick(Sender: TObject);
begin
   Objeto.Moneda.ShowAll := True;
   if Objeto.Moneda.Busca then
      InterForma1.NextTab(edCVE_MONEDA);
   //end if
end;

procedure TWCrRelLiqMn.ilMONEDAEjecuta(Sender: TObject);
begin
   if Objeto.Moneda.FindKey([ilMONEDA.Buffer]) then
      InterForma1.NextTab(edCVE_MONEDA);
   //end if
end;

procedure TWCrRelLiqMn.edCVE_MONEDAExit(Sender: TObject);
var  vlSalida   :  boolean;
     vlMsg      :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlSalida := True;
      Objeto.CVE_MONEDA.GetFromControl;
      if Objeto.CVE_MONEDA.AsString = CNULL then
       Begin
            vlSalida := False;
            vlMsg := 'Favor de indicar la moneda';
       end;
      InterForma1.ValidaExit(edCVE_MONEDA,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrRelLiqMn.ilLIQUIDACapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrRelLiqMn.ilMONEDACapture(Sender: TObject; var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrRelLiqMn.rgCVE_LIQ_CHQRAExit(Sender: TObject);
begin
      InterForma1.ValidaExit(rgCVE_LIQ_CHQRA,True,CNULL,True);
end;

procedure TWCrRelLiqMn.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   if IsNewData then    //nuevo
   Begin
      if MessageDlg('¿Desea almacenar los datos capturados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           Realizado := True;
      end
      else Realizado := False;
   end
   else
   Begin
      if MessageDlg('¿Desea guradar los datos modificados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           Realizado := True;
      end
      else Realizado := False;
   end
   // end if
end;

end.
