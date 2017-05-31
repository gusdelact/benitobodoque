unit IntCrRegenHistoCred;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, InterFor, IntFrm, Db, DBTables,

  //Unidades adicionales
  IntCrCredito;

type
  TCrRegHist = class;

  TWCrRegHist = class(TForm)
    InterForma1: TInterForma;
    Label1: TLabel;
    edID_Credito: TEdit;
    sbBusca: TSpeedButton;
    edDesc_Credito: TEdit;
    Fecha: TLabel;
    dpFecha: TDateTimePicker;
    btnRegenera: TBitBtn;
    QAcreditado: TQuery;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sbBuscaClick(Sender: TObject);
    procedure edID_CreditoChange(Sender: TObject);
    procedure edID_CreditoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRegeneraClick(Sender: TObject);
  private
    { Private declarations }
    procedure GetName;
  public
    { Public declarations }
    Objeto : TCrRegHist;
  end;

  TCrRegHist = class(TInterFrame)
  private
  protected
  public
    { Public declarations }
    Credito   : TCrCredito;
    constructor Create (AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure   DataBaseChange; override;
    function    ShowWindow (FormaTipo: TFormaTipo): integer; override;
  published
  end;

var
  WCrRegHist: TWCrRegHist;

implementation

{$R *.DFM}

constructor TCrRegHist.Create (AOwner: TComponent);
begin
  inherited;
  ShowMenuReporte := False;

  {$WARNINGS OFF}
  Credito := TCrCredito.Create(Self);
  {$WARNINGS ON}
  Credito.MasterSource                          :=Self;
  Credito.FieldByName('ID_CREDITO').MasterField := 'ID_CREDITO';
end;

destructor TCrRegHist.Destroy;
begin
   if Credito <> nil then
      Credito.free;
   inherited;
end;

function    TCrRegHist.ShowWindow (FormaTipo: TFormaTipo): integer;
var
  W: TWCrRegHist;
begin
   W := TWCrRegHist.Create(Self);
   try
     W.Objeto                    := Self;
     W.InterForma1.InterFrame    := Self;
     W.InterForma1.FormaTipo     := ftConsulta;
     W.InterForma1.ShowGrid      := False;
     W.InterForma1.ShowNavigator := False;
     W.InterForma1.Funcion       := FInterFun;
     W.InterForma1.ShowModal;
     ShowWindow                  := W.InterForma1.ModalResult;
   finally
     W.Free;
   end;
end;

procedure TCrRegHist.DataBaseChange;
begin
  Credito.GetParams(self);
end;

procedure TWCrRegHist.FormShow(Sender: TObject);
begin
  //Utiliza la fecha del cierre del día anterior
  dpFecha.Date                      := Objeto.Apli.DameFechaEmpresa - 1;

  //Asociación del crédito con las interformas
  Objeto.Credito.ID_CREDITO.Control := edID_CREDITO;
  Objeto.Credito.BuscaWhereString   := 'PKGCRACTUALIZA.STPOBTEMPCTTO(CR_CREDITO.ID_CONTRATO)= ' + IntToStr(Objeto.Apli.IdEmpresa);
  Objeto.Credito.FilterString       := Objeto.Credito.BuscaWhereString;

  //Al inicio está inhabilitado el botón
  btnRegenera.Enabled := False;
end;

procedure TWCrRegHist.FormDestroy(Sender: TObject);
begin
  Objeto.Credito.ID_CREDITO.Control := nil;
end;

procedure TWCrRegHist.sbBuscaClick(Sender: TObject);
begin
  Objeto.Credito.Busca;
end;

procedure TWCrRegHist.GetName;
var
  n, e: integer;
begin
  edDesc_Credito.Text := '';
  btnRegenera.Enabled := False;

  if edID_Credito.Text = '' then exit;
  Val (edID_Credito.Text, n, e);

  if e = 0 then
  begin
    QAcreditado.Close;
    QAcreditado.DatabaseName := Objeto.Apli.DataBaseName;
    QAcreditado.SessionName  := Objeto.Apli.SessionName;
    QAcreditado.ParamByName ('IDCredito').AsInteger := n;
    QAcreditado.Open;

    if not QAcreditado.Eof then
    begin
      edDesc_Credito.Text := QAcreditado.FieldByName ('Nombre').AsString;
      btnRegenera.Enabled := True;
    end;
  end;
end;

procedure TWCrRegHist.edID_CreditoChange(Sender: TObject);
begin
  GetName;
end;

procedure TWCrRegHist.edID_CreditoExit(Sender: TObject);
begin
  GetName;
end;

procedure TWCrRegHist.FormCreate(Sender: TObject);
begin
  //Alineacion de TEdit a la derecha, junto con BiDiMode dbRightToLeft
  SysLocale.MiddleEast := True;
end;

procedure TWCrRegHist.btnRegeneraClick(Sender: TObject);
var
  SP: TStoredProc;
begin
  SP := TStoredProc.Create (Self);
  try
    SP.DatabaseName   := Objeto.Apli.DataBaseName;
    SP.SessionName    := Objeto.Apli.SessionName;
    SP.StoredProcName := 'PKGCRCONSOLIDADO.STPREGENHISTCRED';

    SP.Params.Clear;
    SP.Params.CreateParam (ftDate,    'peFPivote',        ptInput);
    SP.Params.CreateParam (ftInteger, 'peIdCredito',      ptInput);
    SP.Params.CreateParam (ftString,  'peBCommit',        ptInput);
    SP.Params.CreateParam (ftString,  'peBProcesoDiario', ptInput);
    SP.Params.CreateParam (ftString,  'peBRegenOnDemand', ptInput);
    SP.Params.CreateParam (ftInteger, 'psResultado',      ptOutput);
    SP.Params.CreateParam (ftString,  'psTxResultado',    ptOutput);

    SP.ParamByName ('peFPivote').AsDateTime      := dpFecha.Date;
    SP.ParamByName ('peIdCredito').AsInteger     := StrToInt (edID_Credito.Text);
    SP.ParamByName ('peBCommit').AsString        := 'V';
    SP.ParamByName ('peBProcesoDiario').AsString := 'V';
    SP.ParamByName ('peBRegenOnDemand').AsString := 'V';
    SP.ExecProc;

    if SP.ParamByName ('psResultado').AsInteger = 0 then
      MessageDlg ('Proceso de regeneración exitosa', mtInformation, [mbOk], 0)
    else
      MessageDlg (Format ('El proceso de regeneración presentó errores. Favor de comunicarse con sistemas. [%s]', [SP.ParamByName ('psTxResultado').AsString]),
                  mtError, [mbOk], 0);

  finally
    SP.Free;
  end;
end;

end.
