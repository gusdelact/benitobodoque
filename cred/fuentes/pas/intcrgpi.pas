// Sistema         : Clase de TCrGpI
// Fecha de Inicio : 11/05/2001
// Función forma   : Clase de TCrGpI
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Juan Carlos Sanchez Reyes
// Comentarios     :
Unit IntCrGpI;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit;

Type
 TCrGpI= class;

  TWCrGpI=Class(TForm)
    InterForma1             : TInterForma;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Label4: TLabel;
    edPct: TInterEdit;
    edImporte: TInterEdit;
    Label5: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrGpI;
end; 
 TCrGpI= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_GPO_INGRESO          : TInterCampo;
        ANIO_CARTERA             : TInterCampo;
        MES_CARTERA              : TInterCampo;
        DESC_CARTERA             : TInterCampo;
        IMP_PROM_DIARIO          : TInterCampo;
        PCT_MARGEN               : TInterCampo;

        function    InternalBusca : Boolean; override;
        function    InternalLocaliza :boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrGpI.Create( AOwner : TComponent );
begin Inherited;
   CVE_GPO_INGRESO := CreaCampo('CVE_GPO_INGRESO',ftString,tsNinguno,tsNinguno,True);
      with CVE_GPO_INGRESO do
      begin
        Size := 6;
        Caption:='Clave de Grupo Ingreso';
        UseCombo:=True;
        ComboLista.Add('COMISIONES');               ComboDatos.Add('CVE007');
        ComboLista.Add('CONSTRUCCION');             ComboDatos.Add('CVE001');
        ComboLista.Add('DESCUENTO DE DOCUMENTOS');  ComboDatos.Add('CVE003');
        ComboLista.Add('GOBIERNO');                 ComboDatos.Add('CVE004');
        ComboLista.Add('INFRAESTRUCTURA');          ComboDatos.Add('CVE002');
        ComboLista.Add('PROCAMPO');                 ComboDatos.Add('CVE005');
        ComboLista.Add('OTROS');                    ComboDatos.Add('CVE006');
      end;
   ANIO_CARTERA := CreaCampo('ANIO_CARTERA',ftFloat,tsNinguno,tsNinguno,True);
      with ANIO_CARTERA do
      begin
        Size := 4;
        Caption:='Año de Grupo Ingreso';
        UseCombo:=True;
        ComboLista.Add('2002');                 ComboDatos.Add('2002');
        ComboLista.Add('2003');                 ComboDatos.Add('2003');
        ComboLista.Add('2004');                 ComboDatos.Add('2004');
        ComboLista.Add('2005');                 ComboDatos.Add('2005');
        ComboLista.Add('2006');                 ComboDatos.Add('2006');
        ComboLista.Add('2007');                 ComboDatos.Add('2007');
        ComboLista.Add('2008');                 ComboDatos.Add('2008');
        ComboLista.Add('2009');                 ComboDatos.Add('2009');
        ComboLista.Add('2010');                 ComboDatos.Add('2010');
      end;
      DESC_CARTERA :=CreaCampo('DESC_CARTERA',ftString,tsNinguno,tsNinguno,True);
                DESC_CARTERA.Caption:='Descripción Grupo Ingreso';
      IMP_PROM_DIARIO :=CreaCampo('IMP_PROM_DIARIO',ftFloat,tsNinguno,tsNinguno,True);
                IMP_PROM_DIARIO.Caption:='Promedio Diario';
      PCT_MARGEN :=CreaCampo('PCT_MARGEN',ftFloat,tsNinguno,tsNinguno,True);
                PCT_MARGEN.Caption:='Porcentaje Margen';

   MES_CARTERA := CreaCampo('MES_CARTERA',ftFloat,tsNinguno,tsNinguno,True);
      with MES_CARTERA do
      begin
        Size := 2;
        UseCombo:=True;
        ComboLista.Add('Enero');       ComboDatos.Add('1');
        ComboLista.Add('Febrero');     ComboDatos.Add('2');
        ComboLista.Add('Marzo');       ComboDatos.Add('3');
        ComboLista.Add('Abril');       ComboDatos.Add('4');
        ComboLista.Add('Mayo');        ComboDatos.Add('5');
        ComboLista.Add('Junio');       ComboDatos.Add('6');
        ComboLista.Add('Julio');       ComboDatos.Add('7');
        ComboLista.Add('Agosto');      ComboDatos.Add('8');
        ComboLista.Add('Septiembre');  ComboDatos.Add('9');
        ComboLista.Add('Octubre');     ComboDatos.Add('10');
        ComboLista.Add('Noviembre');   ComboDatos.Add('11');
        ComboLista.Add('Diciembre');   ComboDatos.Add('12');
      end;

      FKeyFields.Add('CVE_GPO_INGRESO');
      FKeyFields.Add('ANIO_CARTERA');
      FKeyFields.Add('MES_CARTERA');

      TableName := 'CRE_GPO_INGRESO';
      UseQuery := True;
      HelpFile := 'IntCrGpI.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrGpI.Destroy;
begin inherited;
end;


function TCrGpI.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrGpI;
begin
   W:=TWCrGpI.Create(Self);
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


Function TCrGpI.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrGpI.it','S,F,F');
      Try if Active then begin T.Param(0,CVE_GPO_INGRESO.AsString);
                               T.Param(1,ANIO_CARTERA.AsString);
                               T.Param(2,MES_CARTERA.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2)]);
      finally  T.Free;
      end;
end;

function TCrGpI.InternalLocaliza : boolean;
begin
  Result := True;
end;

function TCrGpI.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA TCrGpI********************)
(*                                                                              *)
(*  FORMA DE TCrGpI                                                            *)
(*                                                                              *)
(***********************************************FORMA TCrGpI********************)

procedure TWCrGpI.FormShow(Sender: TObject);
begin
  Objeto.CVE_GPO_INGRESO.Control:=ComboBox1;
  Objeto.ANIO_CARTERA.Control:=ComboBox2;
  Objeto.MES_CARTERA.Control:=ComboBox3;
  Objeto.IMP_PROM_DIARIO.Control:=edImporte;
  Objeto.PCT_MARGEN.Control:=edPct;
end;

procedure TWCrGpI.FormDestroy(Sender: TObject);
begin
  Objeto.CVE_GPO_INGRESO.Control:=nil;
  Objeto.ANIO_CARTERA.Control:=nil;
  Objeto.MES_CARTERA.Control:=nil;
  Objeto.IMP_PROM_DIARIO.Control:=nil;
  Objeto.PCT_MARGEN.Control:=nil;
end;

procedure TWCrGpI.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrGpI.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
  Objeto.DESC_CARTERA.AsString := ComboBox1.Items[ComboBox1.itemindex];
end;


end.
