// Sistema         : Clase de CRE_TIPO_CLASIF
// Fecha de Inicio : 6/05/1998
// Función forma   : Clase de CRE_TIPO_CLASIF
// Diseñado por    : Benjamin Hernandez Delsordo

Unit IntCrCls;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind, UnSQL2, InterFun, ComCtrls, IntDtPk, RepCrCls;

Type
 TCrCls= class;

  TWCrCls=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_TIPO_CLASIF : TLabel;
    edCVE_TIPO_CLASIF : TEdit;
    lbDESC_TIPO_CLASIF : TLabel;
    edDESC_TIPO_CLASIF : TEdit;
    lbCVE_TIPO_PRIN : TLabel;
    edCVE_TIPO_PRIN : TEdit;
    sbCVE_TIPO_PRIN: TSpeedButton;
    edCVE_INSTITUCION: TEdit;
    bbReporte: TBitBtn;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure sbCVE_TIPO_PRINClick(Sender: TObject);
    procedure bbReporteClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrCls;
    procedure Impresion(Preview: Boolean);
end;
 TCrCls= class(TInterFrame)
      private
        FCVE_INSTITUCION          : char;
        procedure SetCVE_INSTITUCION (Value: char);
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_TIPO_CLASIF          : TInterCampo;
        DESC_TIPO_CLASIF         : TInterCampo;
        CVE_TIPO_PRIN            : TInterCampo;
        CVE_INSTITUCION          : TInterCampo;
        DESC_PADRE               : TIntercampo;

        function    InternalBusca : Boolean; override;
        function    InternalLocaliza:Boolean; override;
        procedure   Append; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
        property    Institucion: char read FCVE_INSTITUCION write SetCVE_INSTITUCION default 'C';
      published
      end;



implementation

{$R *.DFM}


constructor TCrCls.Create( AOwner : TComponent );
begin Inherited;
      CVE_TIPO_CLASIF :=CreaCampo('CVE_TIPO_CLASIF',ftString,tsNinguno,tsNinguno,True);
        CVE_TIPO_CLASIF .Size:=6;
                CVE_TIPO_CLASIF.Caption:='Clave de Tipo Clasif';
      DESC_TIPO_CLASIF :=CreaCampo('DESC_TIPO_CLASIF',ftString,tsNinguno,tsNinguno,True);
                DESC_TIPO_CLASIF.Caption:='Descripción Tipo Clasif';
      CVE_INSTITUCION :=CreaCampo('CVE_INSTITUCION',ftString,tsNinguno,tsNinguno,True);
        CVE_INSTITUCION .Size:=1;
                CVE_INSTITUCION.Caption:='Clave de Institucion';
      CVE_TIPO_PRIN :=CreaCampo('CVE_TIPO_PRIN',ftString,tsNinguno,tsNinguno,True);
        CVE_TIPO_PRIN .Size:=6;
                CVE_TIPO_PRIN.Caption:='Clave de Tipo Prin';
      DESC_PADRE := CreaCampo('DESC_PADRE',ftString,tsNinguno,tsNinguno,False);

      FKeyFields.Add('CVE_TIPO_CLASIF');
      TableName := 'CRE_TIPO_CLASIF';
      UseQuery := True;
      HelpFile := 'IntCrCls.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrCls.Destroy;
begin inherited;
end;

procedure TCrCls.SetCVE_INSTITUCION(Value : char);
begin
  if FCVE_INSTITUCION <> value then
    begin
      FCVE_INSTITUCION := value;
    end;
end;


function TCrCls.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCls;
begin
   W:=TWCrCls.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      if (W.Objeto.FCVE_INSTITUCION = 'C') then
        W.Caption := 'Clasificación CNBV'
      else
        W.Caption := 'Clasificación SHCP';
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


Function TCrCls.InternalBusca:Boolean;
var T:TInterFindit;
begin
  InternalBusca := False;
  if (FCVE_INSTITUCION = 'C') then
    T := CreaBuscador('IntCrClC.it','S,S')
//    BuscaWhereString := 'CVE_INSTITUCION = ''C'' AND CVE_TIPO_PRIN IS NOT NULL'
  else
    T := CreaBuscador('IntCrClH.it','S,S');
//    BuscaWhereString := 'CVE_INSTITUCION = ''H''';
    try
      if Active then
        begin
          T.Param(0,CVE_TIPO_CLASIF.AsString);
        end;
      if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
    finally  T.Free;
    end;
end;

function TCrCls.Reporte:Boolean;
begin //Execute_Reporte();
end;

procedure TCrCls.Append;
begin
  inherited;
  if FCVE_INSTITUCION = 'C' then
    CVE_INSTITUCION.AsString := 'C'
  else
    CVE_INSTITUCION.AsString := 'H';
end;

function TCrCls.InternalLocaliza:Boolean;
var T:TQuery;
    s: String;
begin
  InternalLocaliza:=False;
  T := GetSQLQuery('SELECT CVE_TIPO_CLASIF, DESC_TIPO_CLASIF ' +
                   'FROM CRE_TIPO_CLASIF ' +
                   'WHERE CVE_TIPO_CLASIF = ' + #39 + CVE_TIPO_PRIN.AsString + #39
                   ,DataBaseName,SessionName,True);
  try
    if T <> nil then
      begin
        DESC_PADRE.AsString := T.FieldByName('DESC_TIPO_CLASIF').AsString;
      end
    else
      begin
        DESC_PADRE.AsString := '';
      end;
  finally
    if T <> nil then T.Free;
  end;
  InternalLocaliza:=True;
end;



(***********************************************FORMA CRE_TIPO_CLASIF********************)
(*                                                                              *)
(*  FORMA DE CRE_TIPO_CLASIF                                                            *)
(*                                                                              *)
(***********************************************FORMA CRE_TIPO_CLASIF********************)

procedure TWCrCls.FormShow(Sender: TObject);
begin
      Objeto.CVE_TIPO_CLASIF.Control:=edCVE_TIPO_CLASIF;
      Objeto.DESC_TIPO_CLASIF.Control:=edDESC_TIPO_CLASIF;
      Objeto.CVE_INSTITUCION.Control:=edCVE_INSTITUCION;
      Objeto.DESC_PADRE.Control:=edCVE_TIPO_PRIN;
end;

procedure TWCrCls.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_TIPO_CLASIF.Control:=nil;
      Objeto.DESC_TIPO_CLASIF.Control:=nil;
      Objeto.CVE_INSTITUCION.Control:=nil;
      Objeto.DESC_PADRE.Control:=nil;
   //Objeto
end;

procedure TWCrCls.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrCls.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrCls.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrClsf.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


procedure TWCrCls.sbCVE_TIPO_PRINClick(Sender: TObject);
var T:TInterFindit;
begin
      T := Objeto.CreaBuscador('IntCrCls.it','S,S');
      try
        T.Param(0,Objeto.CVE_TIPO_PRIN.asString);
        T.Param(1,Objeto.DESC_PADRE.asString);
        if (Objeto.Institucion = 'C') then
          T.WhereString := 'CRE_TIPO_CLASIF.CVE_INSTITUCION = ''C'''
        else
          T.WhereString := 'CRE_TIPO_CLASIF.CVE_INSTITUCION = ''H''';
        if T.Execute then
          begin Objeto.CVE_TIPO_PRIN.AsString := T.DameCampo(0);
                Objeto.DESC_PADRE.AsString := T.DameCampo(1);
                 end;
      finally T.Free;
      end;
end;


procedure TWCrCls.Impresion(Preview: Boolean);
var
  vlCNBV : boolean;
begin
  vlCNBV := Objeto.FCVE_INSTITUCION = 'C';
  ExecRepCrCls(Objeto, Preview, vlCNBV);
end;

procedure TWCrCls.bbReporteClick(Sender: TObject);
begin
  Impresion(True);
end;

end.
