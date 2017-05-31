// Sistema         : Clase de CR_CONCEPTO
// Fecha de Inicio : 03/06/2003
// Función forma   : Clase de CR_CONCEPTO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : 
// Comentarios     :
Unit IntCrConcept;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,

//Unidades Adicionales
IntParamCre;

Type
 TCrConcept= class; 

  TWCrConcepto=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_CONCEPTO : TLabel; 
    edCVE_CONCEPTO : TEdit;
    lbDESC_C_CONCEPTO : TLabel;
    edDESC_C_CONCEPTO : TEdit;
    lbDESC_L_CONCEPTO : TLabel; 
    edDESC_L_CONCEPTO : TEdit;
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
    procedure edCVE_CONCEPTOExit(Sender: TObject);
    procedure edDESC_C_CONCEPTOExit(Sender: TObject);
    procedure edDESC_L_CONCEPTOExit(Sender: TObject);
    Procedure MuestraHints;
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    private 
    { Private declarations }
    public 
    { Public declarations } 
    Objeto : TCrConcept;
end; 
 TCrConcept= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_CONCEPTO             : TInterCampo;
        DESC_C_CONCEPTO          : TInterCampo;
        DESC_L_CONCEPTO          : TInterCampo;

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


constructor TCrConcept.Create( AOwner : TComponent );
begin Inherited;
      CVE_CONCEPTO :=CreaCampo('CVE_CONCEPTO',ftString,tsNinguno,tsNinguno,True);
                CVE_CONCEPTO.Caption:='Clave Concepto';
      DESC_C_CONCEPTO :=CreaCampo('DESC_C_CONCEPTO',ftString,tsNinguno,tsNinguno,True);
                DESC_C_CONCEPTO.Caption:='Descripción Corta';
      DESC_L_CONCEPTO :=CreaCampo('DESC_L_CONCEPTO',ftString,tsNinguno,tsNinguno,True);
                DESC_L_CONCEPTO.Caption:='Descripción Larga';
      FKeyFields.Add('CVE_CONCEPTO');

      TableName := 'CR_CONCEPTO';
      UseQuery := True;
      HelpFile := 'IntCrConcept.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrConcept.Destroy;
begin inherited;
end;


function TCrConcept.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrConcepto;
begin
   W:=TWCrConcepto.Create(Self);
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


Function TCrConcept.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrConce.it','S');
      Try if Active then begin T.Param(0,CVE_CONCEPTO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA CR_CONCEPTO********************)
(*                                                                              *)
(*  FORMA DE CR_CONCEPTO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_CONCEPTO********************)

procedure TWCrConcepto.FormShow(Sender: TObject);
begin
      //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_CONCEPTO.Control:=edCVE_CONCEPTO;
      Objeto.DESC_C_CONCEPTO.Control:=edDESC_C_CONCEPTO;
      Objeto.DESC_L_CONCEPTO.Control:=edDESC_L_CONCEPTO;
end;

procedure TWCrConcepto.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_CONCEPTO.Control:=nil;
      Objeto.DESC_C_CONCEPTO.Control:=nil;
      Objeto.DESC_L_CONCEPTO.Control:=nil;
   //Objeto
end;

procedure TWCrConcepto.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrConcepto.InterForma1DespuesNuevo(Sender: TObject);
begin
   MuestraHints;
   edCVE_CONCEPTO.SetFocus;
end;

procedure TWCrConcepto.InterForma1DespuesModificar(Sender: TObject);
begin edDESC_C_CONCEPTO.SetFocus;
end;

procedure TWCrConcepto.edCVE_CONCEPTOExit(Sender: TObject);
var  VLSalida  :  boolean;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      Objeto.CVE_CONCEPTO.GetFromControl;
      if Objeto.CVE_CONCEPTO.AsString = '' then
      Begin
         ShowMessage('Favor de Indicar la Clave del Concepto');
         VlSalida   := False;
      end; //end if
      InterForma1.ValidaExit(edCVE_CONCEPTO,VLSalida,'',True);
   end;
end;

procedure TWCrConcepto.edDESC_C_CONCEPTOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edDESC_C_CONCEPTO,True,'',True);
end;

procedure TWCrConcepto.edDESC_L_CONCEPTOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edDESC_C_CONCEPTO,true,'',True);
end;

Procedure TWCrConcepto.MuestraHints;
Begin
      edDESC_C_CONCEPTO.Hint := Objeto.DESC_C_CONCEPTO.AsString;
      edDESC_C_CONCEPTO.ShowHint := True;
      edDESC_L_CONCEPTO.Hint := Objeto.DESC_L_CONCEPTO.AsString;
      edDESC_L_CONCEPTO.ShowHint := True;
End;

procedure TWCrConcepto.InterForma1Buscar(Sender: TObject);
begin
 if Objeto.Busca then
    MuestraHints;
 //end if
end;

procedure TWCrConcepto.InterForma1DespuesAceptar(Sender: TObject);
begin
   MuestraHints;
end;

procedure TWCrConcepto.InterForma1AntesAceptar(Sender: TObject;
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
