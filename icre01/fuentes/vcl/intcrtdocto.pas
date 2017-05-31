// Sistema         : Clase de CR_TIPO_DOCTO
// Fecha de Inicio : 30/06/2003
// Función forma   : Clase de CR_TIPO_DOCTO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCrTDocto;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,

//Unidades Adicionales
IntParamCre, InterEdit;

Type
 TCrTDocto= class;

  TWCrTDocto=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_DOCUMENTO : TLabel; 
    edCVE_DOCUMENTO : TEdit;
    lbDESC_DOCUMENTO : TLabel; 
    edDESC_DOCUMENTO : TEdit;
    lbTASA_AFORO : TLabel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    edTASA_AFORO: TInterEdit;
    edDIAS_PAGO: TInterEdit;
    lbDIAS_PAGO: TLabel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edCVE_DOCUMENTOExit(Sender: TObject);
    procedure edDESC_DOCUMENTOExit(Sender: TObject);
    procedure edTASA_AFOROExit(Sender: TObject);
    Procedure MuestraHints;
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrTDocto;
end; 
 TCrTDocto= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        CVE_DOCUMENTO            : TInterCampo;
        DESC_DOCUMENTO           : TInterCampo;
        TASA_AFORO               : TInterCampo;
        DIAS_PAGO                : TInterCampo; // 03/01/2013 JFOF
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


constructor TCrTDocto.Create( AOwner : TComponent );
begin Inherited;
      CVE_DOCUMENTO :=CreaCampo('CVE_DOCUMENTO',ftString,tsNinguno,tsNinguno,True);
                CVE_DOCUMENTO.Caption:='Tipo de Documento';
      DESC_DOCUMENTO :=CreaCampo('DESC_DOCUMENTO',ftString,tsNinguno,tsNinguno,True);
                DESC_DOCUMENTO.Caption:='Descripción';
      TASA_AFORO :=CreaCampo('TASA_AFORO',ftFloat,tsNinguno,tsNinguno,True);
                TASA_AFORO.Caption:='Tasa Aforo';
      DIAS_PAGO :=CreaCampo('DIAS_PAGO',ftInteger,tsNinguno,tsNinguno,True); // 03/01/2013 JFOF
                DIAS_PAGO.Caption:='Días de Pago';

      FKeyFields.Add('CVE_DOCUMENTO');

      TableName := 'CR_TIPO_DOCTO';
      UseQuery := True;
      HelpFile := 'IntCrTDocto.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrTDocto.Destroy;
begin inherited;
end;


function TCrTDocto.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrTDocto;
begin
   W:=TWCrTDocto.Create(Self);
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

Function TCrTDocto.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;      
      T := CreaBuscador('ICrTDoct.it','S');
      Try if Active then begin T.Param(0,CVE_DOCUMENTO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA CR_TIPO_DOCTO********************)
(*                                                                              *)
(*  FORMA DE CR_TIPO_DOCTO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_TIPO_DOCTO********************)

procedure TWCrTDocto.FormShow(Sender: TObject);
begin
      // Pinta datos del panel
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_DOCUMENTO.Control:=edCVE_DOCUMENTO;
      Objeto.DESC_DOCUMENTO.Control:=edDESC_DOCUMENTO;
      Objeto.TASA_AFORO.Control:=edTASA_AFORO;
      Objeto.DIAS_PAGO.Control:=edDIAS_PAGO;   // 03/01/2013 JFOF

end;

procedure TWCrTDocto.FormDestroy(Sender: TObject);
begin
   Objeto.CVE_DOCUMENTO.Control:=nil;
   Objeto.DESC_DOCUMENTO.Control:=nil;
   Objeto.TASA_AFORO.Control:=nil;
   Objeto.DIAS_PAGO.Control:=nil;   // 03/01/2013 JFOF

   //Objeto
end;

procedure TWCrTDocto.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrTDocto.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.TASA_AFORO.AsFloat := 0;
   edCVE_DOCUMENTO.SetFocus;
   MuestraHints;
end;

procedure TWCrTDocto.InterForma1DespuesModificar(Sender: TObject);
begin edDESC_DOCUMENTO.SetFocus;
end;

procedure TWCrTDocto.edCVE_DOCUMENTOExit(Sender: TObject);
Var    vlSalida    : Boolean;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      Objeto.CVE_DOCUMENTO.GetFromControl;
      if Objeto.CVE_DOCUMENTO.AsString = '' then
         vlSalida := False;
      //end if
      InterForma1.ValidaExit(edCVE_DOCUMENTO,vlSalida,'',True);
   end;
end;

procedure TWCrTDocto.edDESC_DOCUMENTOExit(Sender: TObject);
begin
     InterForma1.ValidaExit(edDESC_DOCUMENTO,True,'',True);
end;

procedure TWCrTDocto.edTASA_AFOROExit(Sender: TObject);
var vlsalida : Boolean;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      vlSalida := True;
      Objeto.TASA_AFORO.GetFromControl;
      if Objeto.TASA_AFORO.AsString = '' then
         Objeto.TASA_AFORO.AsFloat := 0
      else if Objeto.TASA_AFORO.AsFloat < 0 then
      Begin
         vlSalida := False;
         ShowMessage('El % Aforado no puede ser nagativo');
      end;
      InterForma1.ValidaExit(edTASA_AFORO,vlSalida,'',True);
   end;
end;

Procedure TWCrTDocto.MuestraHints;
Begin
      edDESC_DOCUMENTO.Hint := Objeto.DESC_DOCUMENTO.AsString;
      edDESC_DOCUMENTO.ShowHint := True;
End;

procedure TWCrTDocto.InterForma1Buscar(Sender: TObject);
begin
 if Objeto.Busca then
    MuestraHints;
 //end if
end;

procedure TWCrTDocto.InterForma1DespuesAceptar(Sender: TObject);
begin
    MuestraHints;
end;

procedure TWCrTDocto.InterForma1AntesAceptar(Sender: TObject;
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
