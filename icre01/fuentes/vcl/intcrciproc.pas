// Sistema         : Clase de CR_OPERACION
// Fecha de Inicio :
// Función forma   : Clase de CR_OPERACION
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCrCiProc;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,

//Unidades Adicionales
IntParamCre;

Type
 TCrCiProc= class;

  TwCrCiProc=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_OPERACION : TLabel;
    edFechApli: TEdit;
    lbDESC_L_OPERACION : TLabel;
    edSubHect: TEdit;
    rgSituacion: TRadioGroup;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    tpFechApli: TInterDateTimePicker;
    Label1: TLabel;
    edFonCont: TEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrCiProc;
end;
 TCrCiProc= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        F_APLICACION             : TInterCampo;
        SUBSIDIO_HECT            : TInterCampo;
        FONDO_CONTINGEN          : TInterCampo;
        SIT_CICLO                : TInterCampo;

        ParamCre                 : TParamCre;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;

implementation

{$R *.DFM}


constructor TCrCiProc.Create( AOwner : TComponent );
begin Inherited;
      F_APLICACION :=CreaCampo('F_APLICACION',ftDate,tsNinguno,tsNinguno,True);
                F_APLICACION.Caption:='Fecha de aplicación';
      SUBSIDIO_HECT :=CreaCampo('SUBSIDIO_HECT',ftFloat,tsNinguno,tsNinguno,True);
                SUBSIDIO_HECT.Caption:='Subsidio por Hectárea';
      FONDO_CONTINGEN :=CreaCampo('FONDO_CONTINGEN',ftFloat,tsNinguno,tsNinguno,True);
                FONDO_CONTINGEN.Caption:='Fondo Contingencia';
      SIT_CICLO :=CreaCampo('SIT_CICLO',ftString,tsNinguno,tsNinguno,True);
          with SIT_CICLO do
          begin Size:=2;
                UseCombo:=True;
                ComboLista.Add('0'); ComboDatos.Add('AC');
                ComboLista.Add('1'); ComboDatos.Add('IN');
          end;
                SIT_CICLO.Caption:='Situación de Ciclo';

      FKeyFields.Add('F_APLICACION');

      TableName := 'CR_CICLOS_PROCAM';
      UseQuery := True;
      HelpFile := '';
      ShowMenuReporte:=True;
end;

Destructor TCrCiProc.Destroy;
begin inherited;
end;


function TCrCiProc.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwCrCiProc;
begin
   W:=TwCrCiProc.Create(Self);
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

Function TCrCiProc.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('CRCIPROC.IT','S');
      Try if Active then begin T.Param(0,F_APLICACION.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA CR_OPERACION********************)
(*                                                                              *)
(*  FORMA DE CR_OPERACION                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_OPERACION********************)

procedure TwCrCiProc.FormShow(Sender: TObject);
begin
      //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.F_APLICACION.Control:=edFechApli;
      Objeto.SUBSIDIO_HECT.Control:= edSubHect;
      Objeto.FONDO_CONTINGEN.Control:=edFonCont;
      Objeto.SIT_CICLO.Control:=rgSituacion;
end;

procedure TwCrCiProc.FormDestroy(Sender: TObject);
begin
      Objeto.F_APLICACION.Control:=NIL;
      Objeto.SUBSIDIO_HECT.Control:= NIL;
      Objeto.FONDO_CONTINGEN.Control:=NIL;
      Objeto.SIT_CICLO.Control:=NIL;
end;

procedure TwCrCiProc.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwCrCiProc.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.F_APLICACION.AsDateTime := Objeto.Apli.DameFechaEmpresa;
   rgSituacion.ItemIndex := 0;
   edSubHect.SetFocus;
end;

procedure TwCrCiProc.InterForma1DespuesModificar(Sender: TObject);
begin
   edSubHect.SetFocus;
end;

procedure TwCrCiProc.InterForma1AntesAceptar(Sender: TObject;
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
