// Sistema         : Clase de CR_CALCULO_INT
// Fecha de Inicio : 05/06/2003
// Función forma   : Clase de CR_CALCULO_INT
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : 
// Comentarios     :
Unit IntCrCalcInt;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,

//Unidades Adicionales
IntParamCre;

Type
 TCrCalcInt= class;

  TWCrCalculoInt=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_CALCULO_INT : TLabel; 
    edCVE_CALCULO_INT : TEdit;
    lbDESC_CALCULO : TLabel; 
    edDESC_CALCULO : TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    chB_INT_DIASIG: TCheckBox;
    chB_INTERES_MOR: TCheckBox;
    chB_INTERES_ORD: TCheckBox;
    chB_RECALC_CTAS: TCheckBox;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edCVE_CALCULO_INTExit(Sender: TObject);
    procedure edDESC_CALCULOExit(Sender: TObject);
    Procedure MuestraHints;
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure chB_INT_DIASIGExit(Sender: TObject);
    procedure chB_INTERES_MORExit(Sender: TObject);
    procedure chB_INTERES_ORDExit(Sender: TObject);
    procedure chB_RECALC_CTASExit(Sender: TObject);

    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrCalcInt;
end;
 TCrCalcInt= class(TInterFrame) 
      private
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        CVE_CALCULO_INT          : TInterCampo;
        DESC_CALCULO             : TInterCampo;

        B_INTERES_MOR            : TInterCampo; //HERJA SEPTIEMBRE 2013
        B_INTERES_ORD            : TInterCampo; //HERJA SEPTIEMBRE 2013
        B_INT_DIASIG             : TInterCampo; //HERJA SEPTIEMBRE 2013
        B_RECALC_CTAS            : TInterCampo; //RABA JUL 2014

        ParamCre                 : TParamCre;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

      published
      end;



implementation

{$R *.DFM}


constructor TCrCalcInt.Create( AOwner : TComponent );
begin Inherited;
      CVE_CALCULO_INT :=CreaCampo('CVE_CALCULO_INT',ftString,tsNinguno,tsNinguno,True);
                CVE_CALCULO_INT.Caption:='Tipo de Cálculo de Interés';
      DESC_CALCULO :=CreaCampo('DESC_CALCULO',ftString,tsNinguno,tsNinguno,True);
                DESC_CALCULO.Caption:='Descripción';

      //HERJA SEPTIEMBRE 2013
      B_INTERES_MOR:= CreaCampo('B_INTERES_MOR', ftString, tsNinguno, tsNinguno, True);
      B_INTERES_MOR.Caption:= 'Interes Moratorio';
      B_INTERES_ORD:= CreaCampo('B_INTERES_ORD', ftString, tsNinguno, tsNinguno, True);
      B_INTERES_ORD.Caption:= 'Interes Ordinario';
      B_INT_DIASIG:= CreaCampo('B_INT_DIASIG', ftString, tsNinguno, tsNinguno, True);
      B_INT_DIASIG.Caption:= 'Calculo de Interes Dia Siguiente';

      B_RECALC_CTAS := CreaCampo('B_RECALC_CTAS', ftString, tsNinguno, tsNinguno, True);  // RABA JUL 2014
      B_RECALC_CTAS.Caption:= 'Recalcula tramos en cambio de tasa';                       // RABA JUL 2014

      FKeyFields.Add('CVE_CALCULO_INT');

      TableName := 'CR_CALCULO_INT';
      UseQuery := True;
      HelpFile := 'IntCrCalcInt.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrCalcInt.Destroy;
begin inherited;
end;


function TCrCalcInt.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCalculoInt;
begin
   W:=TWCrCalculoInt.Create(Self);
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


Function TCrCalcInt.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrCaIn.it','S');
      Try if Active then begin T.Param(0,CVE_CALCULO_INT.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA CR_CALCULO_INT********************)
(*                                                                              *)
(*  FORMA DE CR_CALCULO_INT                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_CALCULO_INT********************)

procedure TWCrCalculoInt.FormShow(Sender: TObject);
begin
      //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_CALCULO_INT.Control:=edCVE_CALCULO_INT;
      Objeto.DESC_CALCULO.Control:=edDESC_CALCULO;

      Objeto.B_INTERES_MOR.Control:=chB_INTERES_MOR;  //HERJA SEPTIEMBRE 2013
      Objeto.B_INTERES_ORD.Control:=chB_INTERES_ORD;  //HERJA SEPTIEMBRE 2013
      Objeto.B_INT_DIASIG.Control:=chB_INT_DIASIG;  //HERJA SEPTIEMBRE 2013

      Objeto.B_RECALC_CTAS.Control := chB_RECALC_CTAS;   // RABA JUL 2014
end;

procedure TWCrCalculoInt.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_CALCULO_INT.Control:=nil;
      Objeto.DESC_CALCULO.Control:=nil;

      Objeto.B_INTERES_MOR.Control:=nil;   //HERJA SEPTIEMBRE 2013
      Objeto.B_INTERES_ORD.Control:=nil;   //HERJA SEPTIEMBRE 2013
      Objeto.B_INT_DIASIG.Control:=nil;   //HERJA SEPTIEMBRE 2013

      Objeto.B_RECALC_CTAS.Control:=nil;  //RABA JUL 2014
   //Objeto
end;

procedure TWCrCalculoInt.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrCalculoInt.InterForma1DespuesNuevo(Sender: TObject);
begin
    MuestraHints;
    edCVE_CALCULO_INT.SetFocus;
end;

procedure TWCrCalculoInt.InterForma1DespuesModificar(Sender: TObject);
begin edDESC_CALCULO.SetFocus;
end;

procedure TWCrCalculoInt.edCVE_CALCULO_INTExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMsg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
      begin
         VLMsg     := '';
         Objeto.CVE_CALCULO_INT.GetFromControl;
         if Objeto.CVE_CALCULO_INT.AsString = '' then
         Begin
//            ShowMessage('Favor de Indicar la Clave del Tipo de Calculo de Interés');
            VlSalida   := False;
         end; //end if
         InterForma1.ValidaExit(edCVE_CALCULO_INT,VLSalida,VLMsg,True);
      end;
end;

procedure TWCrCalculoInt.edDESC_CALCULOExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edDESC_CALCULO,True,'',True);
end;

Procedure TWCrCalculoInt.MuestraHints;
Begin
      edDESC_CALCULO.Hint := Objeto.DESC_CALCULO.AsString;
      edDESC_CALCULO.ShowHint := True;
End;

procedure TWCrCalculoInt.InterForma1Buscar(Sender: TObject);
begin
 if Objeto.Busca then
    MuestraHints;
 //end if
end;

procedure TWCrCalculoInt.InterForma1DespuesAceptar(Sender: TObject);
begin
    MuestraHints;
end;

procedure TWCrCalculoInt.InterForma1AntesAceptar(Sender: TObject;
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

procedure TWCrCalculoInt.chB_INT_DIASIGExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_INT_DIASIG,True,'',True);
end;

procedure TWCrCalculoInt.chB_INTERES_MORExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_INTERES_MOR,True,'',True);
end;

procedure TWCrCalculoInt.chB_INTERES_ORDExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_INTERES_ORD,True,'',True);
end;

procedure TWCrCalculoInt.chB_RECALC_CTASExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_RECALC_CTAS,True,'',True);
end;

end.
