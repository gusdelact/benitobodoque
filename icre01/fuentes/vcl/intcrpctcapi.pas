// Sistema         : Clase de CR_PCT_CAPITALIZ
// Fecha de Inicio : 14/07/2003
// Función forma   : Clase de CR_PCT_CAPITALIZ
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrPctCapi;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit,

//Unidades Adicionales
IntParamCre
;

Type
 TCrPctCapi= class; 

  TWCrPctCapitaliz=Class(TForm)
    InterForma1             : TInterForma; 
    lbPCT_CAPITALIZA : TLabel;
    lbDESC_CAPITALIZA : TLabel; 
    edDESC_CAPITALIZA : TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    edPCT_CAPITALIZA: TInterEdit;
    Label1: TLabel;
    Label2: TLabel;
    edCVE_GPO_CAPITALIZ: TEdit;
    MsgPanel: TPanel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edPCT_CAPITALIZAExit(Sender: TObject);
    procedure edDESC_CAPITALIZAExit(Sender: TObject);
    Procedure MuestraHints;
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure edCVE_GPO_CAPITALIZExit(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrPctCapi;
end;
 TCrPctCapi= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_GPO_CAPITALIZ        : TInterCampo;
        PCT_CAPITALIZA           : TInterCampo;
        DESC_CAPITALIZA          : TInterCampo;

        //Clases Adicionales
        ParamCre                 : TParamCre;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrPctCapi.Create( AOwner : TComponent );
begin Inherited;
      CVE_GPO_CAPITALIZ :=CreaCampo('CVE_GPO_CAPITALIZ',ftString,tsNinguno,tsNinguno,True);
                CVE_GPO_CAPITALIZ.Caption:='Grupo de Capitalización';
      PCT_CAPITALIZA :=CreaCampo('PCT_CAPITALIZA',ftFloat,tsNinguno,tsNinguno,True);
                PCT_CAPITALIZA.Caption:='Porcentaje';
      DESC_CAPITALIZA :=CreaCampo('DESC_CAPITALIZA',ftString,tsNinguno,tsNinguno,True);
                DESC_CAPITALIZA.Caption:='Descripción';
      FKeyFields.Add('CVE_GPO_CAPITALIZ');

      TableName := 'CR_PCT_CAPITALIZ';
      UseQuery := True;
      HelpFile := 'IntCrPctCapi.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrPctCapi.Destroy;
begin inherited;
end;


function TCrPctCapi.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrPctCapitaliz;
begin
   W:=TWCrPctCapitaliz.Create(Self);
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


Function TCrPctCapi.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrPcCa.it','S');
      Try if Active then begin T.Param(0,CVE_GPO_CAPITALIZ.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;


(***********************************************FORMA CR_PCT_CAPITALIZ********************)
(*                                                                              *)
(*  FORMA DE CR_PCT_CAPITALIZ                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_PCT_CAPITALIZ********************)

procedure TWCrPctCapitaliz.FormShow(Sender: TObject);
begin
      //Pinta los datos del panel inferior
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_GPO_CAPITALIZ.Control:=edCVE_GPO_CAPITALIZ;
      Objeto.PCT_CAPITALIZA.Control:=edPCT_CAPITALIZA;
      Objeto.DESC_CAPITALIZA.Control:=edDESC_CAPITALIZA;

      Interforma1.MsgPanel := MsgPanel;
end;

procedure TWCrPctCapitaliz.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_GPO_CAPITALIZ.Control:=nil;
      Objeto.PCT_CAPITALIZA.Control:=nil;
      Objeto.DESC_CAPITALIZA.Control:=nil;
   //Objeto
end;

procedure TWCrPctCapitaliz.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrPctCapitaliz.InterForma1DespuesNuevo(Sender: TObject);
begin
   MuestraHints;
   edCVE_GPO_CAPITALIZ.SetFocus;
end;

procedure TWCrPctCapitaliz.InterForma1DespuesModificar(Sender: TObject);
begin edPCT_CAPITALIZA.SetFocus;
end;

procedure TWCrPctCapitaliz.edPCT_CAPITALIZAExit(Sender: TObject);
var  vlSalida   :  boolean;
     vlMsg      : String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlSalida := True;
      vlMsg := '';
      Objeto.PCT_CAPITALIZA.GetFromControl;
      if Objeto.PCT_CAPITALIZA.AsFloat < 0 then
      Begin
         vlSalida  := False;
         vlMsg:= 'El % de capitalización no puede ser menor a 0';
      end;
      InterForma1.ValidaExit(edPCT_CAPITALIZA,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrPctCapitaliz.edDESC_CAPITALIZAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edDESC_CAPITALIZA,True,'',True);
end;

Procedure TWCrPctCapitaliz.MuestraHints;
Begin
      edDESC_CAPITALIZA.Hint := Objeto.DESC_CAPITALIZA.AsString;
      edDESC_CAPITALIZA.ShowHint := True;
End;

procedure TWCrPctCapitaliz.InterForma1Buscar(Sender: TObject);
begin
 if Objeto.Busca then
    MuestraHints;
 //end if
end;

procedure TWCrPctCapitaliz.InterForma1DespuesAceptar(Sender: TObject);
begin
    MuestraHints;
end;

procedure TWCrPctCapitaliz.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   //nuevo
   if IsNewData then
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
      if MessageDlg('¿Desea guardar los datos modificados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           Realizado := True;
      end
      else Realizado := False;
   end
end;

procedure TWCrPctCapitaliz.edCVE_GPO_CAPITALIZExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     : String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlSalida := True;
      vlMsg := '';
      Objeto.CVE_GPO_CAPITALIZ.GetFromControl;
      if Objeto.CVE_GPO_CAPITALIZ.AsString = '' then
      Begin
         vlSalida  := False;
         vlMsg := ('Favor de introducir la clave del grupo de capitalización');
      end;
      InterForma1.ValidaExit(edCVE_GPO_CAPITALIZ,vlSalida,vlMsg,True);
   end;
end;

end.
