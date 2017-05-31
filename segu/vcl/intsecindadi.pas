// Sistema         : Clase de SECU_IND_ADICION
// Fecha de Inicio : 24/08/1998
// Función forma   : Clase de SECU_IND_ADICION
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Alejandro Villalobos Bahena
// Comentarios     :
Unit IntSecIndAdi;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntSecuIndic , IntSecuAplic,
  IntLinkit;

Type
 TSecIndAdi= class;

  TWSecuIndAdicion=Class(TForm)
    InterForma1 : TInterForma;
    lbCVE_APLICACION : TLabel;
    edCVE_APLICACION : TEdit;
    lbCVE_IND_ADIC : TLabel;
    edCVE_IND_ADIC : TEdit;
    edDESC_IND_ADIC : TEdit;
    sbIndicador: TSpeedButton;
    edAplica: TEdit;
    lkIndicador: TInterLinkit;
    edNomIndicador: TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure sbIndicadorClick(Sender: TObject);
    procedure lkIndicadorEjecuta(Sender: TObject);
    procedure lkIndicadorCapture(Sender: TObject; var Show: Boolean);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure InterForma1Imprimir(Sender: TObject);
    procedure InterForma1Preview(Sender: TObject);
    private
    public
    Objeto : TSecIndAdi;
  end;

  TSecIndAdi= class(TInterFrame)
    private
    protected
    public
      CVE_APLICACION : TInterCampo;
      CVE_IND_ADIC   : TInterCampo;
      Indicador      : TSecuIndic; // Link to SECU_INDICADOR TABLE
      SecuAplic      : TInterFrame;
      function    InternalBusca : Boolean; override;
      constructor Create( AOwner : TComponent ); override;
      destructor  Destroy; override;
      function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      function    Reporte:Boolean; override;
      Procedure   PrintReporte(Preview:Boolean; TodosLosRegistros:Boolean); override;
      procedure   Preview(Sender:TObject; eObjeto:TInterFrame; eTodosLosRegistros:Boolean; ePreview:Boolean);
      procedure   Imprime(Sender:TObject; eObjeto:TInterFrame; eTodosLosRegistros:Boolean; ePreview:Boolean);
    published
    end;

implementation

uses RepSecIndAdi, IntSelect;

{$R *.DFM}

constructor TSecIndAdi.Create( AOwner : TComponent );
begin
  Inherited;
  CVE_APLICACION := CreaCampo('CVE_APLICACION',ftString,tsNinguno,tsNinguno,True);
  CVE_APLICACION.Size := 6;
  CVE_APLICACION.Caption := 'Clave de Aplicacion';
  CVE_IND_ADIC := CreaCampo('CVE_IND_ADIC',ftString,tsNinguno,tsNinguno,True);
  CVE_IND_ADIC.Size := 4;
  CVE_IND_ADIC.Caption := 'Clave de Indicador  Adicional';
  FKeyFields.Add('CVE_APLICACION');
  FKeyFields.Add('CVE_IND_ADIC');
  TableName := 'SECU_IND_ADICION';
  UseQuery  := True;
  HelpFile  := 'IntSecIndAdi.Hlp';
  ShowMenuReporte:=True;
  SecuAplic := nil;
  Indicador := TSecuIndic.Create(Self);
  Indicador.MasterSource:=Self;
  Indicador.Cve_Ind_Adic.MasterField:='CVE_IND_ADIC';
end;

Destructor TSecIndAdi.Destroy;
begin
  if Indicador<>nil then
     Indicador.Free; Indicador:=nil;
  inherited;
end;

function TSecIndAdi.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWSecuIndAdicion;
begin
   W:=TWSecuIndAdicion.Create(Self);
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

Function TSecIndAdi.InternalBusca:Boolean;
Var
  T:TInterFindit;
begin
  InternalBusca := False;
  if SecuAplic<> nil then
     BuscaWhereString:='SECU_IND_ADICION.CVE_APLICACION ='+
  SecuAplic.FieldByName('CVE_APLICACION').AsSql;
  T := CreaBuscador('ISeInAd.it','S,S');
  Try
    if Active then begin
       T.Param(0,CVE_APLICACION.AsString);
       T.Param(1,CVE_IND_ADIC.AsString);
    end;
    if T.Execute then
       InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
  finally
    T.Free;
  end;
end;

function TSecIndAdi.Reporte:Boolean;
var
  App: TSecuAplic;
begin
  App:= TSecuAplic.Create(Self);
  App.Apli:=Apli;
  try
     App.FindKey([SecuAplic.FieldbyName('CVE_APLICACION').AsString]);
     Seleccionar(App,'Impresión Indicadores Para Aplicación',App.FieldByName('CVE_APLICACION'),App.FieldByName('NOM_APLICACION'),
     nil,'Clave','Nombre','',nil,Imprime,Preview);
  finally
     App.Free;
  end;
end;

procedure TSecIndAdi.Preview(Sender:TObject; eObjeto:TInterFrame; eTodosLosRegistros:Boolean; ePreview:Boolean);
begin
  Execute_RepSecInAdi(ePreview, eObjeto, eTodosLosRegistros);
end;

procedure TSecIndAdi.Imprime(Sender:TObject; eObjeto:TInterFrame; eTodosLosRegistros:Boolean; ePreview:Boolean);
begin
  Execute_RepSecInAdi(ePreview, eObjeto, eTodosLosRegistros);
end;

Procedure TSecIndAdi.PrintReporte(Preview:Boolean; TodosLosRegistros:Boolean);
begin
  Execute_RepSecInAdi(Preview,Self,TodosLosRegistros);
end;

(***********************************************FORMA SECU_IND_ADICION********************)
(*                                                                              *)
(*  FORMA DE SECU_IND_ADICION                                                            *)
(*                                                                              *)
(***********************************************FORMA SECU_IND_ADICION********************)

procedure TWSecuIndAdicion.FormShow(Sender: TObject);
begin
  Objeto.CVE_IND_ADIC.Control:=edCVE_IND_ADIC;
  Objeto.Indicador.DESC_IND_ADIC.Control:=edNomIndicador;
  Objeto.Indicador.MasterSourceEditControl:=sbIndicador;
  edCVE_IND_ADIC.PopupMenu:=Objeto.Indicador.PopMenu;
  edDESC_IND_ADIC.PopupMenu:=Objeto.Indicador.PopMenu;
  if objeto.SecuAplic <> nil then begin
     Objeto.SecuAplic.FieldByName('NOM_APLICACION').Control:=Self.edAplica;
     Objeto.SecuAplic.FieldByName('CVE_APLICACION').Control:=edCVE_APLICACION;
  end;
end;

procedure TWSecuIndAdicion.FormDestroy(Sender: TObject);
begin
  Objeto.CVE_IND_ADIC.Control:=nil;
  Objeto.Indicador.DESC_IND_ADIC.Control:=nil;
  Objeto.Indicador.MasterSourceEditControl:=nil;
  if objeto.SecuAplic <> nil then begin
     Objeto.SecuAplic.FieldByName('NOM_APLICACION').Control:=nil;
     Objeto.SecuAplic.FieldByName('CVE_APLICACION').Control:=nil;
  end;
end;

procedure TWSecuIndAdicion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TWSecuIndAdicion.InterForma1DespuesNuevo(Sender: TObject);
begin
  if Objeto.SecuAplic <> nil then begin
     Objeto.CVE_APLICACION.AsString:=Objeto.SecuAplic.FieldByName('CVE_APLICACION').AsString;
  end;
  edCVE_IND_ADIC.SetFocus;
end;

procedure TWSecuIndAdicion.sbIndicadorClick(Sender: TObject);
begin
  Objeto.Indicador.Busca;
end;


procedure TWSecuIndAdicion.lkIndicadorEjecuta(Sender: TObject);
begin
  if InterForma1.CanEdit then begin
     Objeto.Indicador.FindKey([lkIndicador.Buffer])
  end
  else begin
     if Objeto.SecuAplic<> nil then
        Objeto.Findkey([Objeto.SecuAplic.FieldByName('CVE_APLICACION').AsString,lkIndicador.Buffer]);
  end;
end;

procedure TWSecuIndAdicion.lkIndicadorCapture(Sender: TObject;
var
  Show: Boolean);
begin
  Show := (not InterForma1.CanEdit) or (  (InterForma1.CanEdit) and (InterForma1.IsNewData) )
end;

procedure TWSecuIndAdicion.InterForma1DespuesShow(Sender: TObject);
begin
  if InterForma1.FormaTipo=ftGrid then
     edCVE_IND_ADIC.SetFocus;
end;

procedure TWSecuIndAdicion.InterForma1Imprimir(Sender: TObject);
begin
  Objeto.Reporte;
end;

procedure TWSecuIndAdicion.InterForma1Preview(Sender: TObject);
begin
  Objeto.Reporte;
end;

end.
