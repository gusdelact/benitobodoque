// Sistema         : Clase de CrConfMor
// Fecha de Inicio : 09/03/2010
// Función forma   : Clase de CrConfMor
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : 
// Comentarios     :
Unit IntCrConfMor;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,
IntTasIndFin, InterEdit ; // TASA REFERENCIA;

Type
 TCrConfMor= class; 

  TWCrConfMor=Class(TForm)
    InterForma1: TInterForma;
    rgCVE_CALCULO_M: TRadioGroup;
    lbCVE_TASA_REFER: TLabel;
    btTASA_REFER_M: TBitBtn;
    edDESC_TASA_REFER_M: TEdit;
    ilTASA_REFER_M: TInterLinkit;
    cbOPERADOR_STASA_M: TEdit;
    lbOPERADOR_STASA: TLabel;
    Label9: TLabel;
    edSOBRETASA_M: TInterEdit;
    MsgPanel: TPanel;
    edCVE_TASA_REFER_M: TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure rgCVE_CALCULO_MExit(Sender: TObject);
    procedure btTASA_REFER_MClick(Sender: TObject);
    procedure ilTASA_REFER_MCapture(Sender: TObject; var Show: Boolean);
    procedure ilTASA_REFER_MEjecuta(Sender: TObject);
    procedure edCVE_TASA_REFER_MExit(Sender: TObject);
    procedure btTASA_REFER_MExit(Sender: TObject);
    procedure rgCVE_CALCULO_MClick(Sender: TObject);
    procedure cbOPERADOR_STASA_MExit(Sender: TObject);
    procedure edSOBRETASA_MExit(Sender: TObject);
    procedure edSOBRETASAExit(Sender: TObject);
    procedure cbOPERADOR_STASA_MKeyPress(Sender: TObject; var Key: Char);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrConfMor;
end;
 TCrConfMor= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        vgIdCredito              : Integer;
        ID_CREDITO               : TInterCampo;
        CVE_CALCULO_M            : TInterCampo;
        CVE_TASA_REFER_M         : TInterCampo;
        OPERADOR_STASA_M         : TInterCampo;
        SOBRETASA_M              : TInterCampo;

        TasaRefer_M                : TTasIndFin;

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


constructor TCrConfMor.Create( AOwner : TComponent );
begin Inherited;
      ID_CREDITO :=CreaCampo('ID_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CREDITO.Caption:='Número de Credito';
     CVE_CALCULO_M:=CreaCampo('CVE_CALCULO_M',ftString,tsNinguno,tsNinguno,True);
     With CVE_CALCULO_M do
     Begin  Size := 2;
            UseCombo := True;
            ComboLista.Add('0'); ComboDatos.Add('PA');
            ComboLista.Add('1'); ComboDatos.Add('');
     end;
      CVE_CALCULO_M.Caption:='Clave Tipo Calculo de Moras';

      CVE_TASA_REFER_M :=CreaCampo('CVE_TASA_REFER_M',ftString,tsNinguno,tsNinguno,True);
      CVE_TASA_REFER_M.Caption:='Tasa de Referencia Moras';

      OPERADOR_STASA_M :=CreaCampo('OPERADOR_STASA_M',ftString,tsNinguno,tsNinguno,True);
                OPERADOR_STASA_M.Caption:='Operador Stasa M';
      SOBRETASA_M :=CreaCampo('SOBRETASA_M',ftFloat,tsNinguno,tsNinguno,True);
                SOBRETASA_M.Caption:='Sobretasa M';

      TasaRefer_M := TTasIndFin.Create(Self);
      TasaRefer_M.MasterSource:=Self;
      TasaRefer_M.FieldByName('CVE_TASA_INDICAD').MasterField:='CVE_TASA_REFER_M';
      TasaRefer_M.BuscaWhereString := 'TASA_INDIC_FINAN.B_TASA_CREDITO =' + #39 + 'V'+ #39;
      TasaRefer_M.FilterString := TasaRefer_M.BuscaWhereString;


      FKeyFields.Add('ID_CREDITO');
      TableName := 'CR_CREDITO';
      UseQuery := True;
      HelpFile := 'IntCrConfMor.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrConfMor.Destroy;
begin inherited;
end;


function TCrConfMor.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrConfMor;
begin
   W:=TWCrConfMor.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowBtnNuevo := False;
      W.InterForma1.ShowBtnEliminar := False;
      W.InterForma1.ShowBtnModificar :=true;
      W.InterForma1.ShowBtnBuscar := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      w.Objeto.FindKey([vgIdCredito]);
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;

   finally
      W.Free;
   end;
end;


Function TCrConfMor.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := True;
{
      T := CreaBuscador('ICrConfMor.it','F');
      Try if Active then begin T.Param(0,ID_CREDITO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
        end;
      }
      InternalBusca := FindKey([vgIdCredito]);

end;

function TCrConfMor.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA CrConfMor********************)
(*                                                                              *)
(*  FORMA DE CrConfMor                                                            *)
(*                                                                              *)
(***********************************************FORMA CrConfMor********************)

procedure TWCrConfMor.FormShow(Sender: TObject);
begin

      Objeto.CVE_CALCULO_M.Control := rgCVE_CALCULO_M;
      Objeto.CVE_TASA_REFER_M.Control:=edCVE_TASA_REFER_M;
      Objeto.TasaRefer_M.DESC_TASA_INDIC.Control := edDESC_TASA_REFER_M;
      Objeto.TasaRefer_M.GetParams(Objeto);
      Objeto.OPERADOR_STASA_M.Control:=cbOPERADOR_STASA_M;
      Objeto.SOBRETASA_M.Control:=edSOBRETASA_M;
      if Objeto.CVE_CALCULO_M.IsNull
      then
      Begin
         Objeto.CVE_TASA_REFER_M.Control.Enabled:=false;
         Objeto.OPERADOR_STASA_M.Control.Enabled:=false;
         Objeto.SOBRETASA_M.Control.Enabled:=false;
         btTasa_Refer_M.Enabled:=false;
      End;

end;

procedure TWCrConfMor.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_CALCULO_M.Control:=nil;
      Objeto.CVE_TASA_REFER_M.Control:=nil;
      Objeto.OPERADOR_STASA_M.Control:=nil;
      Objeto.SOBRETASA_M.Control:=nil;
   //Objeto
end;

procedure TWCrConfMor.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrConfMor.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrConfMor.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrConfMor.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCrConfMor.rgCVE_CALCULO_MExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgCVE_CALCULO_M,True,'',True);
   if  rgCve_CALCULO_M.ItemIndex =1
   then
   Begin
     cbOPERADOR_STASA_M.Clear;
     edSOBRETASA_M.Clear;
     edCVE_TASA_REFER_M.Clear;
     cbOPERADOR_STASA_M.enabled:=false;
     edSOBRETASA_M.Enabled:=false;
     edCVE_TASA_REFER_M.Enabled:=false;
     btTASA_REFER_M.Enabled:=false;
   End
   else
   Begin
     cbOPERADOR_STASA_M.enabled:=true;
     edSOBRETASA_M.Enabled:=true;
     edCVE_TASA_REFER_M.Enabled:=true;
     btTASA_REFER_M.Enabled:=true;
   End
   {
   if  rgCve_CALCULO_M.ItemIndex =1
   then
   Begin
     cbOPERADOR_STASA_M.Clear;
     edSOBRETASA_M.Clear;
  //   Objeto.SOBRETASA_M.GetFromControl;
     edCVE_TASA_REFER_M.Clear;
  //n   Objeto.CVE_TASA_REFER_M.GetFromControl;
   End;
   }
end;

procedure TWCrConfMor.btTASA_REFER_MClick(Sender: TObject);
begin
  Objeto.TasaRefer_M.ShowAll := True;
   if Objeto.TasaRefer_M.Busca then
   Begin
      edDESC_TASA_REFER_M.Hint := Objeto.TasaRefer_M.DESC_TASA_INDIC.AsString;
      edDESC_TASA_REFER_M.ShowHint := True;
      InterForma1.NextTab(edCVE_TASA_REFER_M);
   end;
end;

procedure TWCrConfMor.ilTASA_REFER_MCapture(Sender: TObject;
  var Show: Boolean);
begin
Show := True;
end;

procedure TWCrConfMor.ilTASA_REFER_MEjecuta(Sender: TObject);
begin
 if Objeto.TasaRefer_M.FindKey([ilTASA_REFER_M.Buffer]) then
       InterForma1.NextTab(edCVE_TASA_REFER_M);
   //end if
end;

procedure TWCrConfMor.edCVE_TASA_REFER_MExit(Sender: TObject);
var vlSalida : Boolean;
    vlMsg    : String;
begin
  if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
     Objeto.CVE_TASA_REFER_M.GetFromControl;
     InterForma1.ValidaExit(edCVE_TASA_REFER_M,True,'',True);
   end;
{

   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
     vlSalida := True;
     vlMsg := '';
     Objeto.CVE_TASA_REFER_M.GetFromControl;
     if (Objeto.CVE_TASA_REFER_M.AsString = '') and (rgCVE_CALCULO_M.itemindex = 0) then
     Begin
        vlSalida := False;
        vlMsg := 'Favor de Indicar la Tasa de Referencia';
     end;
//     vgSTant := Objeto.SOBRETASA.AsFloat;
     InterForma1.ValidaExit(edCVE_TASA_REFER_M,vlSalida,vlMsg,True);
   end;
   }
end;


procedure TWCrConfMor.btTASA_REFER_MExit(Sender: TObject);
var vlSalida : Boolean;
    vlMsg    : String;
begin
{  if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
     Objeto.CVE_TASA_REFER_M.GetFromControl;
     InterForma1.ValidaExit(edCVE_TASA_REFER_M,True,'',True);
   end;}
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
     vlSalida := True;
     vlMsg := '';
//     Objeto.CVE_TASA_REFER_M.GetFromControl;
//     Objeto.SOBRETASA_M.GetFromControl;
     if (Objeto.CVE_TASA_REFER_M.AsString = '') and (rgCVE_CALCULO_M.itemindex = 0) then
     Begin
        vlSalida := False;
        vlMsg := 'Favor de Indicar la Tasa de Referencia';
     end;
//     vgSTant := Objeto.SOBRETASA.AsFloat;
     InterForma1.ValidaExit(edCVE_TASA_REFER_M,vlSalida,vlMsg,True);
   end;


end;

procedure TWCrConfMor.rgCVE_CALCULO_MClick(Sender: TObject);
begin
   if  rgCve_CALCULO_M.ItemIndex =1
   then
   Begin
     cbOPERADOR_STASA_M.Clear;
     edSOBRETASA_M.Clear;
     edCVE_TASA_REFER_M.Clear;
     cbOPERADOR_STASA_M.enabled:=false;
     edSOBRETASA_M.Enabled:=false;
     edCVE_TASA_REFER_M.Enabled:=false;
     btTASA_REFER_M.Enabled:=false;
   End
   else
   Begin
     cbOPERADOR_STASA_M.enabled:=true;
     edSOBRETASA_M.Enabled:=true;
     edCVE_TASA_REFER_M.Enabled:=true;
     btTASA_REFER_M.Enabled:=true;
   End
end;

procedure TWCrConfMor.cbOPERADOR_STASA_MExit(Sender: TObject);
var vlSalida : Boolean;
    vlMesg    : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
     vlMesg   := '';
     vlSalida := True;
     Objeto.OPERADOR_STASA_M.GetFromControl;
     if (Objeto.OPERADOR_STASA_M.AsString = '') AND ( rgCVE_CALCULO_M.ItemIndex=0) then
     Begin
        vlSalida := False;
        vlMesg := 'Indique el Operador de la Sobretasa';
     end;
     InterForma1.ValidaExit(cbOPERADOR_STASA_M,vlSalida,vlMesg,True);
   end;
end;

procedure TWCrConfMor.edSOBRETASA_MExit(Sender: TObject);
var     vlSalida        : Boolean;
        VlMsg           : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
     vlMsg   := '';
     vlSalida := True;
     Objeto.SOBRETASA_M.GetFromControl;
     Objeto.CVE_TASA_REFER_M.GetFromControl;
     InterForma1.ValidaExit(edSOBRETASA_M,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrConfMor.edSOBRETASAExit(Sender: TObject);
var     vlSalida        : Boolean;
        VlMsg           : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
     vlMsg   := '';
     vlSalida := True;
     Objeto.SOBRETASA_M.GetFromControl;
     Objeto.CVE_TASA_REFER_M.GetFromControl;
     if (Objeto.SOBRETASA_M.AsString = '') and (rgCve_calculo_m.ItemIndex=0) then
     Begin
        vlSalida := False;
        vlMsg := 'Indique de favor la Sobretasa';
     end;
     InterForma1.ValidaExit(edSOBRETASA_M,vlSalida,vlMsg,True);
   end;
end;



procedure TWCrConfMor.cbOPERADOR_STASA_MKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Not((key=Char(42)) or (key=Char(43)) or (key=Char(45)) or (key=Char(47)) or (key=Char(8)) or (key=Char(13)))  then
     begin
          Key:=Char(0);
          InterForma1.ShowMsgPanel('Solo se permiten + , - , / , * ');
     end;
end;

end.
