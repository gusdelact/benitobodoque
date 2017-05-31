// Sistema         : Clase de CR_AFECTACION
// Fecha de Inicio : 03/06/2003
// Función forma   : Clase de CR_AFECTACION
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCrAfectac;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,

//Unidades Adicionales
IntParamCre;

Type
 TCrAfectac= class;

  TWCrAfectacion=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_AFECTACION : TLabel; 
    edCVE_AFECTACION : TEdit;
    lbDESC_AFECTACION : TLabel; 
    edDESC_AFECTACION : TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edCVE_AFECTACIONExit(Sender: TObject);
    procedure edDESC_AFECTACIONExit(Sender: TObject);
    Procedure MuestraHints;
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrAfectac;
end; 
 TCrAfectac= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        CVE_AFECTACION           : TInterCampo;
        DESC_AFECTACION          : TInterCampo;

        ParamCre                 : TParamCre;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation
{$R *.DFM}


constructor TCrAfectac.Create( AOwner : TComponent );
begin Inherited; 
      CVE_AFECTACION :=CreaCampo('CVE_AFECTACION',ftString,tsNinguno,tsNinguno,True);
                CVE_AFECTACION.Caption:='Clave Afectación';
      DESC_AFECTACION :=CreaCampo('DESC_AFECTACION',ftString,tsNinguno,tsNinguno,True);
                DESC_AFECTACION.Caption:='Descripción';
      FKeyFields.Add('CVE_AFECTACION');

      TableName := 'CR_AFECTACION'; 
      UseQuery := True; 
      HelpFile := 'IntCrAfectac.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrAfectac.Destroy;
begin inherited;
end;


function TCrAfectac.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrAfectacion;
begin
   W:=TWCrAfectacion.Create(Self);
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


Function TCrAfectac.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrAfect.it','S');
      Try if Active then begin T.Param(0,CVE_AFECTACION.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

(***********************************************FORMA CR_AFECTACION********************)
(*                                                                              *)
(*  FORMA DE CR_AFECTACION                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_AFECTACION********************)

procedure TWCrAfectacion.FormShow(Sender: TObject);
begin
      //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_AFECTACION.Control:=edCVE_AFECTACION;
      Objeto.DESC_AFECTACION.Control:=edDESC_AFECTACION;
end;

procedure TWCrAfectacion.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_AFECTACION.Control:=nil;
      Objeto.DESC_AFECTACION.Control:=nil;
   //Objeto
end;

procedure TWCrAfectacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrAfectacion.InterForma1DespuesNuevo(Sender: TObject);
begin
   MuestraHints;
   edCVE_AFECTACION.SetFocus;
end;

procedure TWCrAfectacion.InterForma1DespuesModificar(Sender: TObject);
begin edDESC_AFECTACION.SetFocus;
end;

procedure TWCrAfectacion.edCVE_AFECTACIONExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMsg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      VLMsg     := '';
      Objeto.CVE_AFECTACION.GetFromControl;
      if Objeto.CVE_AFECTACION.AsString = '' then
         VlSalida   := False;
      //end if
      InterForma1.ValidaExit(edCVE_AFECTACION,VLSalida,VLMsg,True);
   end;
end;

procedure TWCrAfectacion.edDESC_AFECTACIONExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edDESC_AFECTACION,True,'',True);
end;

Procedure TWCrAfectacion.MuestraHints;
Begin
      edDESC_AFECTACION.Hint := Objeto.DESC_AFECTACION.AsString;
      edDESC_AFECTACION.ShowHint := True;
End;

procedure TWCrAfectacion.InterForma1Buscar(Sender: TObject);
begin
 if Objeto.Busca then
    MuestraHints;
 //end if
end;

procedure TWCrAfectacion.InterForma1DespuesAceptar(Sender: TObject);
begin
    MuestraHints;
end;

procedure TWCrAfectacion.InterForma1AntesAceptar(Sender: TObject;
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

end.
