// Sistema         : Clase de Segmentos
// Fecha de Inicio : Noviembre de 1997
// Función forma   : Clase de Segmento
// Desarrollo por  : Victor Martinez, Alberto Ramirez, Julio Ruiloba
// Comentarios     : Modificación para req. PMO160211 relacionar la discrecionalidad y el sub-servicio de inversión
//                   Sergio Rojas Hernández abr/2016 rohs4279

unit IntSbTipCte;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun, IntSbSerFin, IntRepSubServFin;

type

  TTipCte= Class;
  TWTipCte= class(TForm)
    InterForma1       : TInterForma;
    lbICveSemento     : TLabel;
    edCveTipCte       : TEdit;
    lbDescSegmento    : TLabel;
    edDescTipCte      : TEdit;
    GroupBox1         : TGroupBox;
    GroupBox2         : TGroupBox;
    Label1            : TLabel;
    edFAlta           : TEdit;
    Label2            : TLabel;
    edCveUsuAlta      : TEdit;
    Label3            : TLabel;
    edFModifica       : TEdit;
    edCveUsuModif     : TEdit;
    Label4            : TLabel;
    rgSitTipCte       : TRadioGroup;
    Label5            : TLabel;
    edSerFin          : TEdit;
    SpeedButton1      : TSpeedButton;
    lbcveDisc         : TLabel;
    cbCveDiscrecional : TComboBox;
    bbBitacora        : TBitBtn;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure rgSitTipCteClick(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure bbBitacoraClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Objeto : TTipCte;
  end;

  TTipCte  = class(TInterFrame)
  private
  protected
  public
    { Public declarations }
    CVE_TIP_CTE,
    DESC_TIP_CTE,
    CVE_SERVICIO_FIN,
    SIT_TIP_CTE,
    F_ALTA,
    F_MODIFICACION,
    CVE_USUARIO_MODIF,
    CVE_USUARIO_ALTA,
    CVE_DISCRECIONAL  : TInterCampo;                                           //rohs4279 abr/2016 req. PMO160211

    SerFin : TSerFin;

    Function InternalBusca : Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor Destroy; override;
    Function ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
  published
  end;

implementation

{$R *.DFM}

constructor TTipCte.Create( AOwner : TComponent );
begin
  Inherited;
    CVE_TIP_CTE           := CreaCampo('CVE_TIP_CTE',      ftString, tsNinguno, tsNinguno, True);
    CVE_TIP_CTE.Size      := 6;
    DESC_TIP_CTE          := CreaCampo('DESC_TIP_CTE',     ftString, tsNinguno, tsNinguno, True);
    DESC_TIP_CTE.Size     := 100;
    SIT_TIP_CTE           := CreaCampo('SIT_TIP_CTE',      ftString, tsNinguno, tsNinguno, True);
    With SIT_TIP_CTE do Begin
      Size     := 2;
      UseCombo := True;
      ComboDatos.Add('AC');
      ComboLista.Add('0');
      ComboDatos.Add('CA');
      ComboLista.Add('1');
    end;
    CVE_SERVICIO_FIN      := CreaCampo('CVE_SERVICIO_FIN', ftString, tsNinguno, tsNinguno, True);
    CVE_SERVICIO_FIN.Size := 6;
    F_ALTA                := CreaCampo('FH_ALTA',          ftDate,   tsNinguno, tsNinguno, True);
    F_MODIFICACION        := CreaCampo('FH_MODIFICA',      ftDate,   tsNinguno, tsNinguno, True);
    CVE_USUARIO_MODIF     := CreaCampo('CVE_USUARIO_MODI', ftString, tsNinguno, tsNinguno, True);
    CVE_USUARIO_ALTA      := CreaCampo('CVE_USUARIO_ALTA', ftString, tsNinguno, tsNinguno, True);
    CVE_DISCRECIONAL      := CreaCampo('CVE_DISCRECIONAL', ftString, tsNinguno, tsNinguno, True); //rohs4279 abr/2016 req. PMO160211
    with CVE_DISCRECIONAL do begin
      Size     := 4;
      UseCombo := True;
      ComboLista.Add('DISCRECIONAL');
      ComboDatos.Add('DIS');
      ComboLista.Add('NO DISCRECIONAL');
      ComboDatos.Add('NDIS');
    end;

    SerFin              := TSerFin.Create(Self);
    SerFin.MasterSource := Self;
    SerFin.FieldByName('CVE_SERVICIO_FIN').MasterField := 'CVE_SERVICIO_FIN';

    FActive         := False;
    FKeyFields.Add('CVE_TIP_CTE');
    TableName       := 'SB_TIPO_CLIENTE';
    UseQuery        := True;
    ShowMenuReporte := True;
    IsCorp          := True;
end;

destructor TTipCte.Destroy;
begin
  inherited;
end;

Function TTipCte.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWTipCte;

begin
  W := TWTipCte.Create(Self);
  try
    W.Objeto                    := Self;
    W.InterForma1.InterFrame    := Self;
    W.InterForma1.FormaTipo     := FormaTipo;
    W.InterForma1.ShowGrid      := False;
    W.InterForma1.ShowNavigator := False;
    W.InterForma1.Funcion       := FInterFun;
    W.InterForma1.ShowModal;
    ShowWindow                  := W.InterForma1.ModalResult;
  finally
    W.Free;
  end;
end;

Function TTipCte.InternalBusca:Boolean;
Var T : TInterFindit;

begin
  InternalBusca := False;
  T             := CreaBuscador('IntTipCte.it','S,S,S');
  try
    if Active then
      T.Param(0,CVE_TIP_CTE.AsString);
    if T.Execute then
      InternalBusca := FindKey([T.DameCampo(0)]);
  finally
    T.Free;
  end;
end;

procedure TWTipCte.FormShow(Sender: TObject);
begin
  Objeto.CVE_TIP_CTE.Control              := edCveTipCte;
  Objeto.DESC_TIP_CTE.Control             := edDescTipCte;
  Objeto.SIT_TIP_CTE.Control              := rgSitTipCte;
  Objeto.F_ALTA.Control                   := edFAlta;
  Objeto.F_MODIFICACION.Control           := edFModifica;
  Objeto.CVE_USUARIO_ALTA.Control         := edCveUsuAlta;
  Objeto.CVE_USUARIO_MODIF.Control        := edCveUsuModif;
  Objeto.SerFin.DESC_SERVICIO_FIN.Control := edSerFin;
  Objeto.CVE_DISCRECIONAL.Control         := cbCveDiscrecional;                //rohs4279 abr/2016 req. PMO160211
end;

procedure TWTipCte.FormDestroy(Sender: TObject);
begin
  Objeto.CVE_TIP_CTE.Control              := nil;
  Objeto.DESC_TIP_CTE.Control             := nil;
  Objeto.SIT_TIP_CTE.Control              := nil;
  Objeto.F_ALTA.Control                   := nil;
  Objeto.F_MODIFICACION.Control           := nil;
  Objeto.CVE_USUARIO_ALTA.Control         := nil;
  Objeto.CVE_USUARIO_MODIF.Control        := nil;
  Objeto.SerFin.DESC_SERVICIO_FIN.Control := nil;
  Objeto.CVE_DISCRECIONAL.Control         := nil;                              //rohs4279 abr/2016 req. PMO160211
end;

procedure TWTipCte.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TWTipCte.InterForma1DespuesNuevo(Sender: TObject);
begin
  rgSiTTipCte.ItemIndex := 0;
  edFAlta.Text          := DateToStr(Objeto.Apli.DameFechaEmpresa);
  edCveUsuAlta.text     := Objeto.Apli.Usuario;
end;

procedure TWTipCte.InterForma1DespuesModificar(Sender: TObject);
begin
  edFModifica.Text   := DateToStr(Objeto.Apli.DameFechaEmpresa);
  edCveUsuModif.text := Objeto.Apli.Usuario;
end;

procedure TWTipCte.SpeedButton1Click(Sender: TObject);
begin
  Objeto.SerFin.Busca;
end;

procedure TWTipCte.rgSitTipCteClick(Sender: TObject);                          //rohs4279 abr/2016 req. PMO160201
begin
  if (rgSitTipCte.ItemIndex = 0) and (Objeto.CVE_SERVICIO_FIN.AsString <> Emptystr) then begin
    lbcvedisc.Visible         := True;
    cbCveDiscrecional.Visible := True;
  end
  else begin
    lbcveDisc.Visible           := False;
    cbCveDiscrecional.Visible   := False;
    cbCveDiscrecional.ItemIndex := -1;
  end;
end;

procedure TWTipCte.InterForma1Buscar(Sender: TObject);
begin
  Objeto.InternalBusca;
  rgSitTipCteClick(self);
end;

procedure TWTipCte.bbBitacoraClick(Sender: TObject);
Var RepSubServFin : TRepSSF;

begin
  RepSubServFin := TRepSSF.Create(Nil);
  Try
    RepSubServFin.GetParams(Objeto);
    RepSubServFin.pCve_Medio := 'CORP';
    RepSubServFin.pCve_Aplic := 'CORP';
    RepSubServFin.pCve_Grupo := 'CAT_SUBSERVFIN';
    RepSubServFin.Catalogo;
  Finally
    RepSubServFin.Free;
  end;
end;

end.



