// Sistema         : Clase de CR_AGRUPACION
// Fecha de Inicio : 16/05/2003
// Función forma   : Clase de CR_AGRUPACION
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Rocio Berenice MuÑoz Rios
// Comentarios     :
Unit IntCrAgrupac;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,

//Clases Adicionales
IntParamCre;

Type
 TCrAgrupac= class; 

  TWCrAgrupacion=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_AGRUPACION : TLabel; 
    edCVE_AGRUPACION : TEdit;
    lbDESC_AGRUPACION : TLabel; 
    edDESC_AGRUPACION : TEdit;
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
    procedure edCVE_AGRUPACIONExit(Sender: TObject);
    procedure edDESC_AGRUPACIONExit(Sender: TObject);
    Procedure MuestraHints;
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    private
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrAgrupac;
end; 
 TCrAgrupac= class(TInterFrame) 
      private 
      protected
      public
        { Public declarations }
        CVE_AGRUPACION           : TInterCampo;
        DESC_AGRUPACION          : TInterCampo;

        ParamCre                  : TParamCre;
        
        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation

{$R *.DFM}


constructor TCrAgrupac.Create( AOwner : TComponent ); 
begin Inherited; 
      CVE_AGRUPACION :=CreaCampo('CVE_AGRUPACION',ftString,tsNinguno,tsNinguno,True);
                CVE_AGRUPACION.Caption:='Agrupación';
      DESC_AGRUPACION :=CreaCampo('DESC_AGRUPACION',ftString,tsNinguno,tsNinguno,True);
                DESC_AGRUPACION.Caption:='Descripción';
      FKeyFields.Add('CVE_AGRUPACION');

      TableName := 'CR_AGRUPACION';
      UseQuery := True; 
      HelpFile := 'IntCrAgrupac.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrAgrupac.Destroy;
begin inherited;
end;


function TCrAgrupac.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrAgrupacion;
begin
   W:=TWCrAgrupacion.Create(Self);
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

Function TCrAgrupac.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrAgrup.it','S');
      Try if Active then begin T.Param(0,CVE_AGRUPACION.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

(***********************************************FORMA CR_AGRUPACION********************)
(*                                                                              *)
(*  FORMA DE CR_AGRUPACION                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_AGRUPACION********************)

procedure TWCrAgrupacion.FormShow(Sender: TObject);
begin
      //Datos del panel de la parte inferior de la forma
     lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
     lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
     lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
     lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

     Objeto.CVE_AGRUPACION.Control:=edCVE_AGRUPACION;
     Objeto.DESC_AGRUPACION.Control:=edDESC_AGRUPACION;
end;

procedure TWCrAgrupacion.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_AGRUPACION.Control:=nil;
      Objeto.DESC_AGRUPACION.Control:=nil;
   //Objeto
end;

procedure TWCrAgrupacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrAgrupacion.InterForma1DespuesNuevo(Sender: TObject);
begin
   MuestraHints;
   edCVE_AGRUPACION.SetFocus;
end;

procedure TWCrAgrupacion.InterForma1DespuesModificar(Sender: TObject);
begin edDESC_AGRUPACION.SetFocus;
end;

procedure TWCrAgrupacion.edCVE_AGRUPACIONExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMsg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
      begin
         VLMsg     := '';
         Objeto.CVE_AGRUPACION.GetFromControl;
         if Objeto.CVE_AGRUPACION.AsString = '' then
         Begin
//            ShowMessage('Favor de Indicar la Clave de la Agrupación');
            VlSalida   := False;
         end; //end if
         InterForma1.ValidaExit(edCVE_AGRUPACION,VLSalida,VLMsg,True);
      end;
end;

procedure TWCrAgrupacion.edDESC_AGRUPACIONExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edDESC_AGRUPACION,True,'',True);
end;

Procedure TWCrAgrupacion.MuestraHints;
Begin
      edDESC_AGRUPACION.Hint := Objeto.DESC_AGRUPACION.AsString;
      edDESC_AGRUPACION.ShowHint := True;
End;

procedure TWCrAgrupacion.InterForma1Buscar(Sender: TObject);
begin
 if Objeto.Busca then
    MuestraHints;
 //end if
end;

procedure TWCrAgrupacion.InterForma1DespuesAceptar(Sender: TObject);
begin
   MuestraHints;
end;

procedure TWCrAgrupacion.InterForma1AntesAceptar(Sender: TObject;
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
