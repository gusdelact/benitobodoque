// Sistema         : Clase de CRPLAZORES
// Fecha de Inicio : 06/11/2009
// Función forma   : Clase de CRPLAZORES
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Roberto Andres Silva Tello
// Comentarios     :
Unit IntCrplazoresi;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,InterApl;

Type
 TCrplaresc= class;

  TWCrplazores=Class(TForm)
    InterForma1             : TInterForma;
    lbCAMPO1 : TLabel; 
    dtpCAMPO1 : TInterDateTimePicker; 
    edCAMPO1 : TEdit;
    edFecha: TEdit;
    dtpFecha: TDateTimePicker;
    btnVisualizar: TButton;
    btnImprimir: TButton;
    cbxPasivo: TCheckBox;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure dtpFechaChange(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    private 
    { Private declarations } 
    public
    { Public declarations }
    Parametro:String;
    Objeto : TCrplaresc;
end; 
 TCrplaresc= class(TInterFrame)
      private
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        CAMPO1                   : TInterCampo;
        function    InternalBusca : Boolean; override; 
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override; 
        function    Reporte:Boolean; override; 
      published 
      end;



implementation

Uses qrCrPlazoRe;

{$R *.DFM}


constructor TCrplaresc.Create( AOwner : TComponent );
begin Inherited; 
      CAMPO1 :=CreaCampo('CAMPO1',ftDate,tsNinguno,tsNinguno,False);
                CAMPO1.Caption:='cmFecha';
                CAMPO1.Parametro:='CAMPO1';

      StpName  := ' '; 
      UseQuery := False; 
      HelpFile := 'IntCrplazore.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrplaresc.Destroy;
begin inherited;
end;


function TCrplaresc.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrplazores;
begin
   W:=TWCrplazores.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftConsulta; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrplaresc.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrplazo.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TCrplaresc.Reporte:Boolean;
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CRPLAZORES********************)
(*                                                                              *)
(*  FORMA DE CRPLAZORES                                                            *)
(*                                                                              *)
(***********************************************FORMA CRPLAZORES********************)

procedure TWCrplazores.FormShow(Sender: TObject);
begin
      Objeto.CAMPO1.Control:=edCAMPO1;
end;

procedure TWCrplazores.FormDestroy(Sender: TObject);
begin
      Objeto.CAMPO1.Control:=nil;
   //Objeto
end;

procedure TWCrplazores.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrplazores.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrplazores.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrplazores.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte;
//end;


procedure TWCrplazores.dtpFechaChange(Sender: TObject);
Var
        Y,M,D:Word;
        Mes:String;
        Mesto:Integer;
begin
DecodeDate(dtpFecha.DateTime,Y,M,D);
IF M = 1 THEN  Mes:='ENERO' ELSE IF M = 2 THEN  Mes:='FEBRERO' ELSE IF M = 3 THEN  Mes:='MARZO' ELSE IF M = 4 THEN  Mes:='ABRIL'
ELSE IF M = 5 THEN  Mes:='MAYO' ELSE IF M = 6 THEN  Mes:='JUNIO' ELSE IF M = 7 THEN  Mes:='JULIO' ELSE IF M = 8 THEN  Mes:='AGOSTO'
ELSE IF M = 9 THEN  Mes:='SEPTIEMBRE' ELSE IF M = 10 THEN  Mes:='OCTUBRE' ELSE IF M = 11 THEN  Mes:='NOVIEMBRE'
ELSE IF M = 12 THEN  Mes:='DICIEMBRE';
edFecha.Text := Mes + ' ' + inttostr(Y);
Mesto:= length(inttostr(M));
If Mesto = 2 Then
Parametro:=inttostr(Y) + inttostr(M)
Else
Parametro:=inttostr(Y)+ '0' + inttostr(M);
end;

// Imprime Reporte
procedure TWCrplazores.btnVisualizarClick(Sender: TObject);
var Forma : TqrCrPlazoRes;
pAPli     : TInterApli;
begin
IF edFecha.Text <> '' Then
BEGIN
        Forma := TqrCrPlazoRes.Create(self);
        Try
         Forma.QRLabel2.Caption:= edFecha.Text;
         Forma.QRLabel38.Caption:= edFecha.Text;
         Forma.qrPlazoRes.Close;
         Forma.qrPlazoRes.Params[0].AsInteger:= strtoint(Parametro);
         Forma.qrAgrupa.Close;
         Forma.qrAgrupa.Params[0].AsInteger:=strtoint(Parametro);

         IF cbxPasivo.Checked = False Then
          Begin
           Forma.qrPlazoRes.Open;
           Forma.Preview;
          End
         ELSE
          Begin
           Forma.qrAgrupa.Open;
           Forma.QuickRep1.Preview;
          End;

         Forma.qrPlazoRes.Close;
        Except
        end;
         Forma.free;
END
ELSE
showmessage('Elija la fecha');
end;

procedure TWCrplazores.btnImprimirClick(Sender: TObject);
var Forma : TqrCrPlazoRes;
pAPli     : TInterApli;
begin
IF edFecha.Text <> '' Then
BEGIN
        Forma := TqrCrPlazoRes.Create(self);
        Try
         Forma.QRLabel2.Caption:= edFecha.Text;
         Forma.QRLabel38.Caption:= edFecha.Text;
         Forma.qrPlazoRes.Close;
         Forma.qrPlazoRes.Params[0].AsInteger:= strtoint(Parametro);
         Forma.qrAgrupa.Close;
         Forma.qrAgrupa.Params[0].AsInteger:=strtoint(Parametro);

         IF cbxPasivo.Checked = False Then
          Begin
           Forma.qrPlazoRes.Open;
           Forma.Print;
          End
         ELSE
          Begin
           Forma.qrAgrupa.Open;
           Forma.QuickRep1.Print;
          End;

         Forma.qrPlazoRes.Close;
        Except
        end;
         Forma.free;
END
ELSE
showmessage('Elija la fecha');
end;

end.
