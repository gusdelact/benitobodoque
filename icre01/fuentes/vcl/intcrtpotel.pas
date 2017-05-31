// Sistema         : Clase de CR_TIPO_TELEFONO
// Fecha de Inicio : 24/01/2012
// Función forma   : Clase de CR_TIPO_TELEFONO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Fernando Jimenez Rivera.
// Fecha           : Enero 2012
// Comentarios     :
Unit IntCrTpoTel;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,

IntParamCre, InterEdit;

Type
 TCrTpoTel= class;

  TWCrTpoTel=Class(TForm)
    InterForma1             : TInterForma;
    lbID_TIPO_TELEFONO: TLabel;
    edID_TIPO_TELEFONO: TEdit;
    lbTIPO_TELEFONO: TLabel;
    edTIPO_TELEFONO: TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    Label1: TLabel;
    edCVE_NAFIN_TIPO_TELEFONO: TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edID_TIPO_TELEFONOExit(Sender: TObject);
    procedure edTIPO_TELEFONOExit(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure edCVE_NAFIN_TIPO_TELEFONOExit(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrTpoTel;
end;
 TCrTpoTel= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ID_TIPO_TELEFONO         : TInterCampo;
        CVE_NAFIN_TIPO_TELEFONO  : TInterCampo;
        TIPO_TELEFONO            : TInterCampo;
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


constructor TCrTpoTel.Create( AOwner : TComponent );
begin Inherited;
      ID_TIPO_TELEFONO:=CreaCampo('ID_TIPO_TELEFONO',ftInteger,tsNinguno,tsNinguno,True);
                ID_TIPO_TELEFONO.Caption:='Clave Tipo de Telefono';
      CVE_NAFIN_TIPO_TELEFONO:=CreaCampo('CVE_NAFIN_TIPO_TELEFONO', ftInteger, tsNinguno, tsNinguno, True) ;
                CVE_NAFIN_TIPO_TELEFONO.Caption:= 'Clave Descriptiva NAFIN';
      TIPO_TELEFONO:=CreaCampo('TIPO_TELEFONO',ftString,tsNinguno,tsNinguno,True);
                TIPO_TELEFONO.Caption:='Descripción';
      FKeyFields.Add('ID_TIPO_TELEFONO');

      TableName := 'CR_TIPO_TELEFONO';
      UseQuery := True; 
      HelpFile := 'IntCrTipTel.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrTpoTel.Destroy;
begin inherited;
end;


function TCrTpoTel.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrTpoTel;
begin
   W:=TWCrTpoTel.Create(Self);
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


Function TCrTpoTel.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrTpoTel.it','S');
      Try if Active then begin T.Param(0,ID_TIPO_TELEFONO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA CR_TIPO_TELEFONO********************)
(*                                                                                       *)
(*  FORMA DE CR_TIPO_TELEFONO                                                            *)
(*                                                                                       *)
(***********************************************FORMA CR_TIPO_TELEFONO********************)

procedure TWCrTpoTel.FormShow(Sender: TObject);
begin
      //Datos del panel de la parte inferior de la forma
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.ID_TIPO_TELEFONO.Control:=edID_TIPO_TELEFONO;
      Objeto.CVE_NAFIN_TIPO_TELEFONO.Control:=edCVE_NAFIN_TIPO_TELEFONO;
      Objeto.TIPO_TELEFONO.Control:=edTIPO_TELEFONO;
end;

procedure TWCrTpoTel.FormDestroy(Sender: TObject);
begin
      Objeto.ID_TIPO_TELEFONO.Control:=nil;
      Objeto.CVE_NAFIN_TIPO_TELEFONO.Control:=nil;
      Objeto.TIPO_TELEFONO.Control:=nil;
end;

procedure TWCrTpoTel.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrTpoTel.InterForma1DespuesNuevo(Sender: TObject);
var SQLText: String ;
    id: integer ;
begin
   //SQLText:= 'SELECT SEQ_CR_TIPO_TELEFONO.NextVal AS NUEVO FROM DUAL ' ;
   SQLText:= 'SELECT NVL(MAX(ID_TIPO_TELEFONO), -1) + 1 AS NUEVO FROM CR_TIPO_TELEFONO ';
   GetSQLInt(SQLText, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'NUEVO', id, False) ;
   Objeto.ID_TIPO_TELEFONO.AsInteger:= id;

   edCVE_NAFIN_TIPO_TELEFONO.SetFocus;
end;

procedure TWCrTpoTel.InterForma1DespuesModificar(Sender: TObject);
begin edTIPO_TELEFONO.SetFocus;
end;

procedure TWCrTpoTel.edID_TIPO_TELEFONOExit(Sender: TObject);
var vlMsg    : String;
    vlSalida : Boolean;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMsg    := '';
      vlSalida := True;
      Objeto.ID_TIPO_TELEFONO.GetFromControl;
      if Objeto.ID_TIPO_TELEFONO.AsString = '' then
      Begin
         vlMsg := 'Favor de indicar la clave de Tipo de Telefono';
         vlSalida := False;
      end;
      InterForma1.ValidaExit(edID_TIPO_TELEFONO,vlSalida,vlMsg,True);
   end
end;

procedure TWCrTpoTel.edTIPO_TELEFONOExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edTIPO_TELEFONO,True,'',True);
end;

procedure TWCrTpoTel.InterForma1AntesAceptar(Sender: TObject;
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

procedure TWCrTpoTel.edCVE_NAFIN_TIPO_TELEFONOExit(Sender: TObject);
var vlMsg    : String;
    vlSalida : Boolean;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMsg    := '';
      vlSalida := True;
      Objeto.CVE_NAFIN_TIPO_TELEFONO.GetFromControl;
      if Objeto.CVE_NAFIN_TIPO_TELEFONO.AsString = '' then
      Begin
         vlMsg := 'Favor de indicar Clave NAFIN de Tipo de Telefono';
         vlSalida := False;
      end;
      InterForma1.ValidaExit(edCVE_NAFIN_TIPO_TELEFONO,vlSalida,vlMsg,True);
   end
end;

end.
