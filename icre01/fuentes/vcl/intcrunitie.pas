// Sistema         : Clase de CR_UNIDAD_TIEMPO
// Fecha de Inicio : 02/06/2004
// Función forma   : Clase de CR_UNIDAD_TIEMPO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrUniTie;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,

IntParamCre, InterEdit;

Type
 TCrUniTie= class; 

  TWCrUnidadTiempo=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_UNIDAD_TIEMP : TLabel; 
    edCVE_UNIDAD_TIEMP : TEdit;
    lbDESCRIPCION : TLabel; 
    edDESCRIPCION : TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    edNUM_DIAS: TInterEdit;
    Label1: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edCVE_UNIDAD_TIEMPExit(Sender: TObject);
    procedure edDESCRIPCIONExit(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure edNUM_DIASExit(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrUniTie;
end;
 TCrUniTie= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_UNIDAD_TIEMP         : TInterCampo;
        DESCRIPCION              : TInterCampo;
        NUM_DIAS                 : TInterCampo;
        //Clases Adiconales
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


constructor TCrUniTie.Create( AOwner : TComponent ); 
begin Inherited;
      CVE_UNIDAD_TIEMP :=CreaCampo('CVE_UNIDAD_TIEMP',ftString,tsNinguno,tsNinguno,True);
                CVE_UNIDAD_TIEMP.Caption:='Clave Unidad de Tiempo';
      DESCRIPCION :=CreaCampo('DESCRIPCION',ftString,tsNinguno,tsNinguno,True);
                DESCRIPCION.Caption:='Descripción';
      NUM_DIAS :=CreaCampo('NUM_DIAS',ftFloat,tsNinguno,tsNinguno,True);
                NUM_DIAS.Caption:='NUM_DIAS';
      FKeyFields.Add('CVE_UNIDAD_TIEMP');

      TableName := 'CR_UNIDAD_TIEMPO';
      UseQuery := True; 
      HelpFile := 'IntCrUniTie.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrUniTie.Destroy;
begin inherited;
end;


function TCrUniTie.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrUnidadTiempo;
begin
   W:=TWCrUnidadTiempo.Create(Self);
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


Function TCrUniTie.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrUnTi.it','S');
      Try if Active then begin T.Param(0,CVE_UNIDAD_TIEMP.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

(***********************************************FORMA CR_UNIDAD_TIEMPO********************)
(*                                                                              *)
(*  FORMA DE CR_UNIDAD_TIEMPO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_UNIDAD_TIEMPO********************)

procedure TWCrUnidadTiempo.FormShow(Sender: TObject);
begin
      //Datos del panel de la parte inferior de la forma
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_UNIDAD_TIEMP.Control:=edCVE_UNIDAD_TIEMP;
      Objeto.DESCRIPCION.Control:=edDESCRIPCION;
      Objeto.NUM_DIAS.Control:=edNUM_DIAS;
end;

procedure TWCrUnidadTiempo.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_UNIDAD_TIEMP.Control:=nil;
      Objeto.DESCRIPCION.Control:=nil;
      Objeto.NUM_DIAS.Control:=nil;
end;

procedure TWCrUnidadTiempo.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrUnidadTiempo.InterForma1DespuesNuevo(Sender: TObject);
begin edCVE_UNIDAD_TIEMP.SetFocus;
end;

procedure TWCrUnidadTiempo.InterForma1DespuesModificar(Sender: TObject);
begin edDESCRIPCION.SetFocus;
end;

procedure TWCrUnidadTiempo.edCVE_UNIDAD_TIEMPExit(Sender: TObject);
var vlMsg    : String;
    vlSalida : Boolean;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMsg    := '';
      vlSalida := True;
      Objeto.CVE_UNIDAD_TIEMP.GetFromControl;
      if Objeto.CVE_UNIDAD_TIEMP.AsString = '' then
      Begin
         vlMsg := 'Favor de indicar la clave de unidad de tiempo';
         vlSalida := False;
      end;
      InterForma1.ValidaExit(edCVE_UNIDAD_TIEMP,vlSalida,vlMsg,True);
   end
end;

procedure TWCrUnidadTiempo.edDESCRIPCIONExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edDESCRIPCION,True,'',True);
end;

procedure TWCrUnidadTiempo.InterForma1AntesAceptar(Sender: TObject;
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
   // end if
end;

procedure TWCrUnidadTiempo.edNUM_DIASExit(Sender: TObject);
var vlMsg    : String;
    vlSalida : Boolean;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMsg    := '';
      vlSalida := True;
      Objeto.NUM_DIAS.GetFromControl;
      if Objeto.NUM_DIAS.AsFloat <= 0 then
      Begin
         vlMsg := 'Indique el número de días equivalente a la unidad de tiempo';
         vlSalida := False;
      end;
      InterForma1.ValidaExit(edNUM_DIAS,vlSalida,vlMsg,True);
   end
end;

end.
