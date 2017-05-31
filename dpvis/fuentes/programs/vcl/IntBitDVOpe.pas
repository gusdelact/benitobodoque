// Sistema         : Clase IntUsuEmail
// Fecha de Inicio : 22/06/2016
// Función forma   : Pantalla Consulta Bitacora de Operacion
// Desarrollo por  :
// Diseñado por    :
// Comentarios     :

unit IntBitDVOpe;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, UnSQL2,
  InterFor, IntFrm, IntWFind, IntFind, ExtCtrls, StdCtrls, InterEdit, Buttons, DB, DBTables,
  Grids, DBGrids, UnGene, IntSGCtrl, printers;

type
  TBitDVOpe = class;

  TwBitDVOperacion = class(TForm)
    Interforma     : TInterForma;
    Panel1         : TPanel;
    plCatalogos    : TPanel;

    qryBitDVOperacion : TQuery;
    dsBitDVOperacion  : TDataSource;

    edFolioIni  : TEdit;
    edFolioFin  : TEdit;
    edClave     : TEdit;

    lblFolio    : TLabel;
    lblClave    : TLabel;

    qryBitDVOperacionBIT_FOLIO         : TFloatField;
    qryBitDVOperacionBIT_REGISTRO      : TStringField;
    qryBitDVOperacionCVE_OPERACION     : TStringField;
    qryBitDVOperacionDESC_INST_MON     : TStringField;
    qryBitDVOperacionSIT_OPERACION     : TStringField;
    qryBitDVOperacionBIT_CVE_USUARIO   : TStringField;
    qryBitDVOperacionBIT_FACTUALIZA    : TDateTimeField;
    qryBitDVOperacionBIT_OBSERVACIONES : TStringField;
    sbClave: TSpeedButton;
    T: TSGCtrl;


    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sbCatalogoClick(Sender: TObject);
    procedure InterformaDespuesShow(Sender: TObject);
    procedure InterformaBtnBuscarClick(Sender: TObject);
    procedure sbClaveClick(Sender: TObject);
    procedure edFolioIniChange(Sender: TObject);
    procedure edFolioIniKeyPress(Sender: TObject; var Key: Char);
    procedure edFolioFinKeyPress(Sender: TObject; var Key: Char);
    procedure edClaveKeyPress(Sender: TObject; var Key: Char);
    procedure LlenaSGA;

  private
    { Private declarations }
  public
    { Public declarations }
    Objeto :  TBitDVOpe;

end;

  TBitDVOpe = class(TInterFrame)
    private
    protected
    public
      { Public declarations }
      FOLIOINI           : TInterCampo;
      FOLIOFIN           : TInterCampo;
      CVE_OPERACION      : TInterCampo;

      constructor Create(AOwner: TComponent); override;
      destructor  Destroy; override;
      function    ShowWindow(FormaTipo: TFormaTipo): Integer; override;

  end;

var
  wBitDVOperacion : TwBitDVOperacion;

implementation

{$R *.DFM}

constructor TBitDVOpe.Create( AOwner : TComponent );
begin
  Inherited;

    FOLIOINI       := CreaCampo('FOLIOINI',      ftInteger, tsNinguno,tsNinguno,False);
    FOLIOFIN       := CreaCampo('FOLIOFIN',      ftInteger, tsNinguno,tsNinguno,False);
    CVE_OPERACION  := CreaCampo('CVE_OPERACION', ftString,  tsNinguno,tsNinguno,False);

    FKeyFields.Add('BIT_FOLIO');
    FKeyFields.Add('BIT_REGISTRO');
    FKeyFields.Add('CVE_OPERACION');

    TableName       := 'DV_OPERACION_BIT';

    UseQuery        := True;
    FindItSql       := True;
    UseLink         := True;

end;


Destructor TBitDVOpe.Destroy;
begin
  inherited;
end;


function TBitDVOpe.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TwBitDVOperacion;
begin
   W := TwBitDVOperacion.Create(Self);
   try
      W.Objeto                   := Self;
      W.Interforma.InterFrame    := Self;
      W.Interforma.FormaTipo     := ftGrid;
      W.Interforma.ShowGrid      := False;
      W.Interforma.ShowNavigator := False;
      W.Interforma.Funcion       := FInterFun;
      W.Interforma.ShowModal;
      ShowWindow                 := W.Interforma.ModalResult;
   finally
      W.Free;
   end;
end;


procedure TwBitDVOperacion.FormShow(Sender: TObject);
begin

   Objeto.FOLIOINI.Control      := edFolioIni;
   Objeto.FOLIOFIN.Control      := edFolioFin;
   Objeto.CVE_OPERACION.Control := edClave;

   qryBitDVOperacion.DatabaseName       := Objeto.Apli.DataBaseName;
   qryBitDVOperacion.SessionName        := Objeto.Apli.SessionName;
end;


procedure TwBitDVOperacion.FormDestroy(Sender: TObject);
begin
  qryBitDVOperacion.Close;

  If Objeto.FOLIOINI.Control       <> nil Then Objeto.FOLIOINI.Control      := nil;
  If Objeto.FOLIOFIN.Control       <> nil Then Objeto.FOLIOFIN.Control      := nil;
  If Objeto.CVE_OPERACION.Control  <> nil Then Objeto.CVE_OPERACION.Control := nil;

end;


procedure TwBitDVOperacion.InterformaDespuesShow(Sender: TObject);
begin
   //Interforma.BtnBuscar.Visible := False;
   Interforma.BtnAyuda.Visible  := False;
  qryBitDVOperacion.ParamByName('PFOLIOINI').AsString     := '0';
  qryBitDVOperacion.ParamByName('PFOLIOFIN').AsString     := '0';
  qryBitDVOperacion.ParamByName('PCVEOPERACION').AsString := '';
  qryBitDVOperacion.Open;
  LlenaSGA;
end;


procedure TwBitDVOperacion.sbCatalogoClick(Sender: TObject);
var
   T: TInterFindit;
begin
  T := Objeto.CreaBuscador('PLDCATALOGO','F');
  Try
    If T.Execute Then Begin
      edClave.Text    := t.DameCampo(0);
    end;
  finally
    T.Free;
  end;
end;


procedure TwBitDVOperacion.InterformaBtnBuscarClick(Sender: TObject);
begin
  qryBitDVOperacion.Close;
  qryBitDVOperacion.ParamByName('PFOLIOINI').AsString     := edFolioIni.Text;
  qryBitDVOperacion.ParamByName('PFOLIOFIN').AsString     := edFolioFin.Text;
  qryBitDVOperacion.ParamByName('PCVEOPERACION').AsString := edClave.Text;
  qryBitDVOperacion.Open;
  LlenaSGA;
end;

procedure TwBitDVOperacion.sbClaveClick(Sender: TObject);
var
   T: TInterFindit;
begin
  T := Objeto.CreaBuscador('IDVOPERAC.IT','F');
  Try
    If T.Execute Then Begin
      edClave.Text    := t.DameCampo(0);
    end;
  finally
    T.Free;
  end;
end;

procedure TwBitDVOperacion.edFolioIniChange(Sender: TObject);
VAR
   X : STRING;
begin
   X := 'S';
end;

procedure TwBitDVOperacion.edFolioIniKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Not (Key in ['1','2','3','4','5','6','7','8','9','0',#8]) Then
     InterMsg(tmInformacion,'',0,'Sólo Números ...');
end;

procedure TwBitDVOperacion.edFolioFinKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Not (Key in ['1','2','3','4','5','6','7','8','9','0',#8]) Then
     InterMsg(tmInformacion,'',0,'Sólo Números ...');
end;

procedure TwBitDVOperacion.edClaveKeyPress(Sender: TObject; var Key: Char);
begin
  If Not (Key in ['0'..'9',#8,'a'..'z','ñ','A'..'Z','Ñ',#32,#81]) Then
     InterMsg(tmInformacion,'',0,'Sólo Letras Mayusculas y Números ...');
end;


procedure TwBitDVOperacion.LlenaSGA;
begin

 try
  try
  T.Titulo1:='Bitacora de Claves de Operación';
  T.Titulo2:='Depósitos a la Vista';
  T.NomReporte:='';
  T.ColCount:=8;
  T.BeginGrid; //Inicializa el Grid. Open Archivo.

  T.SetPrintCol(kNoPrint); // El Siguiente Renglon no se imprime en el Reporte.
  T.AddTitle(T.Titulo1,tcCenter);
  T.SetPrintCol(kNoPrint); // El Siguiente Renglon no se imprime en el Reporte.
  T.AddTitle(T.Titulo2,tcCenter);
  T.PageOrientation := polandscape;

  T.LeftCol:=0; //
  T.Columnas[ 0  ].SetInfo('COL0'   ,'SIN'                    , 35    , tcright,  '' , False) ;
  T.Columnas[ 1  ].SetInfo('COL0'   ,'Folio'                  , 35    , tcright,  '' , True ) ;
  T.Columnas[ 2  ].SetInfo('COL1'   ,'Registro'+#30'>C'       , 65    , tcLeft,   '' , True ) ;
  T.Columnas[ 3  ].SetInfo('COL2'   ,'Cve Operacion'+#30'>C'  , 70    , tcLeft,   '' , True ) ;
  T.Columnas[ 4  ].SetInfo('COL3'   ,'Inst. Monetario'+#30'>C', 90    , tcLeft,   '' , True ) ;
  T.Columnas[ 5  ].SetInfo('COL4'   ,'Estatus'+#30'>C'        , 55    , tcLeft,   '' , true ) ;
  T.Columnas[ 6  ].SetInfo('COL5'   ,'Cve Usuario'+#30'>C'    , 80    , tcLeft,   '' , True ) ;
  T.Columnas[ 7  ].SetInfo('COL6'   ,'Fecha Actualiza'+#30'>C', 140   , tcLeft,   '' , True ) ;
  T.Columnas[ 8  ].SetInfo('COL7'   ,'Referencia'+#30'>C'     , 300   , tcLeft,   '' , True ) ;
  T.SetActualHeight(32);
  T.SetPrintCol(kPrintHeader);
  T.NextRow;
  T.EndCaption;
  qryBitDVOperacion.First;
  while not qryBitDVOperacion.Eof do begin
    T.AddHeader(['0',
               qryBitDVOperacion.fieldbyname('BIT_FOLIO').AsString,
               qryBitDVOperacion.fieldbyname('BIT_REGISTRO').AsString,
               qryBitDVOperacion.fieldbyname('CVE_OPERACION').AsString,
               qryBitDVOperacion.fieldbyname('DESC_INST_MON').AsString,
               qryBitDVOperacion.fieldbyname('SIT_OPERACION').AsString,
               qryBitDVOperacion.fieldbyname('BIT_CVE_USUARIO').AsString,
               qryBitDVOperacion.fieldbyname('BIT_FACTUALIZA').AsString,
               qryBitDVOperacion.fieldbyname('BIT_OBSERVACIONES').AsString],-1,clblack);
    qryBitDVOperacion.Next;
  end; // end while
  finally
     qryBitDVOperacion.Close;
  end;
 except
  on e: exception do showmessage(e.message);
 end;
end;

end.
