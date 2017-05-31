// Sistema         : Clase de CR_ATRIBUTO
// Fecha de Inicio : 16/05/2003
// Función forma   : Clase de CR_ATRIBUTO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Rocio Berenice MuÑoz Rios
// Comentarios     :
Unit IntCrAtribut;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,

//Clases Adicionales
IntParamCre;

Type
 TCrAtribut= class;

  TWCrAtributo=Class(TForm)
    InterForma1             : TInterForma;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    lbCVE_ATRIBUTO: TLabel;
    edCVE_ATRIBUTO: TEdit;
    lbDESC_ATRIBUTO: TLabel;
    edDESC_ATRIBUTO: TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edCVE_ATRIBUTOExit(Sender: TObject);
    procedure edDESC_ATRIBUTOExit(Sender: TObject);
    Procedure MuestraHints;
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrAtribut;
end;
 TCrAtribut= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        CVE_ATRIBUTO             : TInterCampo;
        DESC_ATRIBUTO            : TInterCampo;
        ParamCre                  : TParamCre;
        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;

implementation

{$R *.DFM}


constructor TCrAtribut.Create( AOwner : TComponent );
begin Inherited;
      CVE_ATRIBUTO :=CreaCampo('CVE_ATRIBUTO',ftString,tsNinguno,tsNinguno,True);
                CVE_ATRIBUTO.Caption:='Clave del Atributo';
      DESC_ATRIBUTO :=CreaCampo('DESC_ATRIBUTO',ftString,tsNinguno,tsNinguno,True);
                DESC_ATRIBUTO.Caption:='Descripción';
      FKeyFields.Add('CVE_ATRIBUTO');

      TableName := 'CR_ATRIBUTO';
      UseQuery := True;
      HelpFile := 'IntCrAtribut.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrAtribut.Destroy;
begin inherited;
end;


function TCrAtribut.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrAtributo;
begin
   W:=TWCrAtributo.Create(Self);
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

Function TCrAtribut.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrAtrib.it','S');
      Try if Active then begin T.Param(0,CVE_ATRIBUTO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA CR_ATRIBUTO********************)
(*                                                                              *)
(*  FORMA DE CR_ATRIBUTO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_ATRIBUTO********************)

procedure TWCrAtributo.FormShow(Sender: TObject);
begin
      //Datos del panel de la parte inferior de la forma
     lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
     lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
     lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
     lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

     Objeto.CVE_ATRIBUTO.Control:=edCVE_ATRIBUTO;
     Objeto.DESC_ATRIBUTO.Control:=edDESC_ATRIBUTO;
end;

procedure TWCrAtributo.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_ATRIBUTO.Control:=nil;
      Objeto.DESC_ATRIBUTO.Control:=nil;
   //Objeto
end;

procedure TWCrAtributo.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrAtributo.InterForma1DespuesNuevo(Sender: TObject);
begin
   MuestraHints;
   edCVE_ATRIBUTO.SetFocus;
end;

procedure TWCrAtributo.InterForma1DespuesModificar(Sender: TObject);
begin edDESC_ATRIBUTO.SetFocus;
end;

procedure TWCrAtributo.edCVE_ATRIBUTOExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMsg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
      begin
         VLMsg     := '';
         Objeto.CVE_ATRIBUTO.GetFromControl;
         if Objeto.CVE_ATRIBUTO.AsString = '' then
         Begin
//            ShowMessage('Favor de Indicar la Clave del Atributo');
            VlSalida   := False;
         end; //end if
         InterForma1.ValidaExit(edCVE_ATRIBUTO,VLSalida,VLMsg,True);
      end;
end;

procedure TWCrAtributo.edDESC_ATRIBUTOExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edDESC_ATRIBUTO,True,'',True);
end;

Procedure TWCrAtributo.MuestraHints;
Begin
      edDESC_ATRIBUTO.Hint := Objeto.DESC_ATRIBUTO.AsString;
      edDESC_ATRIBUTO.ShowHint := True;
End;

procedure TWCrAtributo.InterForma1Buscar(Sender: TObject);
begin
 if Objeto.Busca then
    MuestraHints;
 //end if
end;

procedure TWCrAtributo.InterForma1DespuesAceptar(Sender: TObject);
begin
   MuestraHints;
end;

procedure TWCrAtributo.InterForma1AntesAceptar(Sender: TObject;
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

end.
