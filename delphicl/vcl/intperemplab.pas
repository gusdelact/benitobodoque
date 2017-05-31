Unit IntPerEmpLab;
//------------------------------------------------------------------------------
//  Catálogo de Empresa en que Labora
//  Realizó  : Carlos Adrian Mejía Ledón
//  Fecha    : Enero 2004
//  Modificó : Luis Alberto Hernández Mackan (Dic 2009)
//  Empresa  : Grupo Financiero Interacciones.
//------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, UnGene, IntLDiActEco,
  Menus,
  IntDom           { Domicilios };

type
  TPerEmpLab= class;

  TWPerEmpLab=Class(TForm)
    InterForma1             : TInterForma;
    lbID_EMP_LABORA: TLabel;
    iedID_EMP_LABORA: TInterEdit;
    lbNOMBRE_PERSONA: TLabel;
    edNOMBRE: TEdit;
    sbSiti: TSpeedButton;
    edGiro: TEdit;
    lblTelefono: TLabel;
    edTelefono: TEdit;
    lblActividadEconomica: TLabel;
    Label6: TLabel;
    edIdDomicilio: TEdit;
    sbDomicilio: TSpeedButton;
    edCalleNumero: TEdit;
    PopupDestinoRec: TPopupMenu;
    CatalogoDestinoRec: TMenuItem;
    LimpiarDestinoRec: TMenuItem;
    PopupOrigenRec: TPopupMenu;
    CatalogoOrigenRec: TMenuItem;
    LimpiarOrigenRec: TMenuItem;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    { Eventos de InterForma }
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    { Validaciones }
    procedure InterForma1Preview(Sender: TObject);
    procedure sbSitiClick(Sender: TObject);
    procedure edCalleNumeroContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure edIdDomicilioContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure sbDomicilioClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TPerEmpLab;
    procedure HabilitaPopUpMenu;
  end;

  TPerEmpLab= class(TInterFrame)
    private
    protected
    public
      ID_EMP_LABORA            : TInterCampo;
      NOMBRE                   : TInterCampo;
      TELEF_OFICINA            : TInterCampo;
      CVE_ACTIV_ECON           : TInterCampo;
      ID_DOMICILIO             : TInterCampo;
      Siti                     : TLdiActEco;
      Domicilio                : TDomicilio;

      function    InternalBusca : Boolean; override;
      function    InternalPost : Boolean; override;
      constructor Create( AOwner : TComponent ); override;
      destructor  Destroy; override;
      function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      Procedure  DataBaseChange; override;
    published
  end;

implementation
{$R *.DFM}

//**************************************************************//
//                      CLASE TPerEmpLab                        //
//**************************************************************//

constructor TPerEmpLab.Create( AOwner : TComponent );
begin
  Inherited;
  ID_EMP_LABORA                := CreaCampo('ID_EMP_LABORA',ftInteger,tsNinguno,tsNuevo,True);
  ID_EMP_LABORA.Caption        := 'Empresa';
  NOMBRE                       := CreaCampo('NOMBRE',ftString,tsNinguno,tsNinguno,True);
  NOMBRE.Caption               := 'Nombre';
  NOMBRE.IsRequiered           :=True;
  TELEF_OFICINA                := CreaCampo('TELEF_OFICINA',ftString,tsNinguno,tsNinguno,True);
  TELEF_OFICINA.Caption        := 'Telefono';
  CVE_ACTIV_ECON               := CreaCampo('CVE_ACTIV_ECON',ftString,tsNinguno,tsNinguno,True);
  CVE_ACTIV_ECON.Caption       := 'Giro';
  ID_DOMICILIO                 := CreaCampo('ID_DOMICILIO',ftFloat,tsModifica+tsNuevo,tsConsulta,True);
  ID_DOMICILIO.IsRequiered     := True;
  ID_DOMICILIO.Caption         := 'Domicilio';

  Siti := TLdiActEco.Create(Self);
  Siti.CVE_ACTIV_ECON.MasterField := 'CVE_ACTIV_ECON';
  Siti.MasterSource := Self;

  Domicilio := TDomicilio.Create(Self);
  Domicilio.MasterSource := Self;
  Domicilio.FieldByName('ID_DOMICILIO').MasterField := 'ID_DOMICILIO';

  FKeyFields.Add('ID_EMP_LABORA');
  TableName := 'PER_EMP_LABORA';
  UseQuery := True;
  HelpFile := 'IntPerEmpLab.Hlp';
  ShowMenuReporte:=True;
end;

procedure TPerEmpLab.DataBaseChange;
begin
  inherited;
  Siti.GetParams(self);
end;

destructor TPerEmpLab.Destroy;
begin
  if Siti <> nil then Siti.Free;
  if Domicilio <> nil then Domicilio.Free; Domicilio:=nil;
  inherited;
end;

function TPerEmpLab.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
  W : TWPerEmpLab;
begin
  W:=TWPerEmpLab.Create(Self);
  try
    W.Objeto:= Self;
    W.InterForma1.InterFrame:= Self;
    W.InterForma1.FormaTipo := FormaTipo;
    W.InterForma1.ShowGrid := False;
    W.InterForma1.ShowNavigator := False;
    W.InterForma1.Funcion := FInterFun;
    W.InterForma1.ShowBtnAyuda := False;
    W.InterForma1.ShowBtnPreview := True;
    W.InterForma1.ShowModal;
    ShowWindow := W.InterForma1.ModalResult;
  finally
    W.Free;
  end;
end;

function TPerEmpLab.InternalBusca:Boolean;
var
  T:TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('IPerEmpLab.it','I');
  try
    if Active then
    begin
      T.Param(0,ID_EMP_LABORA.AsString);
    end;
    if T.Execute then
      InternalBusca := FindKey([T.DameCampo(0)]);
  finally
    T.Free;
  end;
end;

function TPerEmpLab.InternalPost : Boolean;
var
  Query : TQuery;
begin
  InternalPost := False;
  if Self.Modo = moAppend then
  begin
    Query := TQuery.Create(Nil);
    try
      Query.DatabaseName := Apli.DataBaseName;
      Query.SQL.Add('SELECT SQ01_PER_EMP_LABORA.NEXTVAL AS NEXTVAL FROM DUAL');
      Query.Close;
      Query.Open;
      if not Query.IsEmpty then
      begin
        ID_EMP_LABORA.AsInteger := Query.FieldByName('NEXTVAL').AsInteger;
        InternalPost            := inherited InternalPost;
      end
      else
      begin
        MessageBeep(0);
        InterMsg(tmError,'',0,'Error al obtener el folio para el alta del registro...');
      end;
      Query.Close;
    finally
      Query.Free;
    end;
  end
  else
    InternalPost := inherited InternalPost;
end;

//**************************************************************//
//                     CLASE TWPerEmpLab                        //
//**************************************************************//

procedure TWPerEmpLab.FormShow(Sender: TObject);
begin
  Objeto.ID_EMP_LABORA.Control              := iedID_EMP_LABORA;
  Objeto.NOMBRE.Control                     := edNOMBRE;
  Objeto.TELEF_OFICINA.Control              := edTelefono;
  Objeto.Siti.DESC_ACTIV_ECON.Control       := edGiro;
  Objeto.Siti.MasterSourceEditControl       := sbSiti;
  edGiro.PopupMenu                          := Objeto.Siti.PopMenu;
  InterForma1.F.btNuevo.SetFocus; 
  objeto.Domicilio.IdDomicilio.Control      := edIdDomicilio;                   
  objeto.Domicilio.MasterSourceEditControl  := sbDomicilio;
  edIdDomicilio.PopupMenu                   := objeto.Domicilio.PopMenu;
  objeto.Domicilio.CalleNumero.Control      := edCalleNumero;
  edCalleNumero.PopupMenu                   := objeto.Domicilio.PopMenu;

end;

procedure TWPerEmpLab.FormDestroy(Sender: TObject);
begin
  Objeto.ID_EMP_LABORA.Control                := nil;
  Objeto.NOMBRE.Control                       := nil;
Objeto.TELEF_OFICINA.Control                  := nil;
  Objeto.Siti.DESC_ACTIV_ECON.Control := nil;
  Objeto.Siti.MasterSourceEditControl := nil;
end;

procedure TWPerEmpLab.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

//**************************************************************//
//                   Botones de Interforma                      //
//**************************************************************//

//---- Bóton Preview ----//
procedure TWPerEmpLab.InterForma1Preview(Sender: TObject);
begin
  //EXECUTE_RP_PerEmpLab(Objeto.Apli,'Ver');
end;

//**************************************************************//
//                   Eventos de Interforma                      //
//**************************************************************//

//---- Después de Nuevo ----//
procedure TWPerEmpLab.InterForma1DespuesNuevo(Sender: TObject);
begin
  edNOMBRE.SetFocus;
end;

//---- Después de Modificar ----//
procedure TWPerEmpLab.InterForma1DespuesModificar(Sender: TObject);
begin
  edNOMBRE.SetFocus;
end;

procedure TWPerEmpLab.sbSitiClick(Sender: TObject);
begin
  Objeto.Siti.Busca;
end;

procedure TWPerEmpLab.edCalleNumeroContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
      HabilitaPopUpMenu;
end;

procedure TWPerEmpLab.HabilitaPopUpMenu;
begin
  PopupDestinoRec.AutoPopup := InterForma1.BtnAceptar.Enabled;
  PopupOrigenRec.AutoPopup  := InterForma1.BtnAceptar.Enabled;
end;

procedure TWPerEmpLab.edIdDomicilioContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
HabilitaPopUpMenu
end;

procedure TWPerEmpLab.sbDomicilioClick(Sender: TObject);
begin
 objeto.Domicilio.Busca;
end;

end.
