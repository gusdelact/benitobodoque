unit IntCrReAcBu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, DBTables, StdCtrls, Buttons, InterApl,

IntGenCre  // Unidad Generica de ICRE

;

type
  TFCrReAcBu = class(TForm)
    dbgSelecionar: TDBGrid;
    Query: TQuery;
    DataSource: TDataSource;
    QueryID_CONTRATO: TFloatField;
    QueryFOL_CONTRATO: TFloatField;
    QueryID_TITULAR: TFloatField;
    QueryCVE_PRODUCTO_CRE: TStringField;
    QueryDESC_C_PRODUCTO: TStringField;
    QueryIMP_AUTORIZADO: TFloatField;
    QueryNOMB_CONTRATO: TStringField;
    QueryCVE_MONEDA: TFloatField;
    QueryCVE_FND_ENT_DES: TStringField;
    QueryCVE_EMISOR_EXT: TStringField;
    btnAceptar: TBitBtn;
    btnCancela: TBitBtn;
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelaClick(Sender: TObject);
    procedure dbgSelecionarDblClick(Sender: TObject);
  private
    { Private declarations }
    vgID_CONTRATO      : Integer;
    vgFOL_CONTRATO     : Integer;
    vgNOMB_CONTRATO    : String;
    vgCVE_FND_ENT_DES  : String;
    vgCVE_EMISOR_EXT   : String;
  public
    { Public declarations }
    Function ArmaQuery(peID_TITULAR, peCVE_MONEDA : Integer): String;
  end;

var
  FCrReAcBu: TFCrReAcBu;

function BuscaAutorizacionCADENAS(peApli : TInterApli; peID_TITULAR, peCVE_MONEDA : Integer;
                                  var psID_CONTRATO : Integer; var psFOL_CONTRATO : Integer;
                                  var psNOMB_CONTRATO : String; var psCVE_FND_ENT_DES : String; var psCVE_EMISOR_EXT : String
                                 ) : Boolean;

implementation

{$R *.DFM}

function BuscaAutorizacionCADENAS(peApli : TInterApli; peID_TITULAR, peCVE_MONEDA : Integer;
                                  var psID_CONTRATO : Integer; var psFOL_CONTRATO : Integer;
                                  var psNOMB_CONTRATO : String; var psCVE_FND_ENT_DES : String; var psCVE_EMISOR_EXT : String
                                 ) : Boolean;
var vlFCrReAcBu : TFCrReAcBu;
begin
  Result := False;
  vlFCrReAcBu := TFCrReAcBu.Create(Nil);
  With (vlFCrReAcBu) Do
    Try
      Query.DatabaseName := peApli.DatabaseName;
      Query.SessionName := peApli.SessionName;
      Query.SQL.Clear;
      Query.SQL.Add(ArmaQuery(peID_TITULAR, peCVE_MONEDA));
      Query.Open;

      If (ShowModal = mrYes) Then
        Begin
        psID_CONTRATO     := vgID_CONTRATO;
        psFOL_CONTRATO    := vgFOL_CONTRATO;
        psNOMB_CONTRATO   := vgNOMB_CONTRATO;
        psCVE_FND_ENT_DES := vgCVE_FND_ENT_DES;
        psCVE_EMISOR_EXT  := vgCVE_EMISOR_EXT;
        Result := True;
        End;

    Finally
      Query.Close;
      vlFCrReAcBu.Free;
    End;
end;

function TFCrReAcBu.ArmaQuery(peID_TITULAR, peCVE_MONEDA : Integer): String;
var vlstrSQL : String;
begin
  vlstrSQL := ' SELECT CTO.ID_CONTRATO,'+coCRLF+
              '        CO.FOL_CONTRATO,'+coCRLF+
              '        CTO.ID_TITULAR,'+coCRLF+
              '        CO.CVE_PRODUCTO_CRE,'+coCRLF+
              '        CP.DESC_C_PRODUCTO,'+coCRLF+
              '        CO.IMP_AUTORIZADO,'+coCRLF+
              '        CTO.NOMB_CONTRATO,'+coCRLF+
              '        CO.CVE_MONEDA,'+coCRLF+
              '        null AS CVE_FND_ENT_DES,'+coCRLF+
              '        null AS CVE_EMISOR_EXT'+coCRLF+
              ' FROM CR_PRODUCTO CP,'+coCRLF+
              '      CR_CONTRATO CO,'+coCRLF+
              '      CONTRATO CTO'+coCRLF+
              ' WHERE CTO.ID_TITULAR = '+IntToStr(peID_TITULAR)+coCRLF+
              '   AND CTO.CVE_MONEDA = '+IntToStr(peCVE_MONEDA)+coCRLF+
              '   AND CO.ID_CONTRATO = CTO.ID_CONTRATO'+coCRLF+
              '   AND CO.CVE_PRODUCTO_CRE = CP.CVE_PRODUCTO_CRE'+coCRLF+
              'UNION'+coCRLF+
              ' SELECT CTO.ID_CONTRATO,'+coCRLF+
              '        CO.FOL_CONTRATO,'+coCRLF+
              '        CTO.ID_TITULAR,'+coCRLF+
              '        CO.CVE_PRODUCTO_CRE,'+coCRLF+
              '        CP.DESC_C_PRODUCTO,'+coCRLF+
              '        CO.IMP_AUTORIZADO,'+coCRLF+
              '        CTO.NOMB_CONTRATO,'+coCRLF+
              '        CO.CVE_MONEDA,'+coCRLF+
              '        CE.CVE_FND_ENT_DES,'+coCRLF+
              '        CE.CVE_EMISOR_EXT'+coCRLF+
              '  FROM CR_REL_EMI_CTO CREC,'+coCRLF+
              '       CONTRATO CTO,'+coCRLF+
              '       CR_CONTRATO CO,'+coCRLF+
              '       CR_PRODUCTO CP,'+coCRLF+
              '       CR_EMISOR CE'+coCRLF+
              ' WHERE CREC.ID_EMISOR = '+IntToStr(peID_TITULAR)+coCRLF+
              '    AND CTO.CVE_MONEDA = '+IntToStr(peCVE_MONEDA)+coCRLF+              
              '    AND CTO.ID_CONTRATO = CREC.ID_CONTRATO_REL'+coCRLF+
              '    AND CO.ID_CONTRATO = CTO.ID_CONTRATO'+coCRLF+
              '    AND CP.CVE_PRODUCTO_CRE = CO.CVE_PRODUCTO_CRE'+coCRLF+
              '    AND CE.ID_ACREDITADO = CTO.ID_TITULAR'+coCRLF+
              ' ORDER BY NOMB_CONTRATO, ID_CONTRATO';
  Result := vlstrSQL;
end;

procedure TFCrReAcBu.btnAceptarClick(Sender: TObject);
begin
  With Query Do
   Begin
   vgID_CONTRATO     := FieldByName('ID_CONTRATO').AsInteger;
   vgFOL_CONTRATO    := FieldByName('FOL_CONTRATO').AsInteger;
   vgNOMB_CONTRATO   := FieldByName('NOMB_CONTRATO').AsString;
   vgCVE_FND_ENT_DES := FieldByName('CVE_FND_ENT_DES').AsString;
   vgCVE_EMISOR_EXT  := FieldByName('CVE_EMISOR_EXT').AsString;
   End;
end;

procedure TFCrReAcBu.btnCancelaClick(Sender: TObject);
begin
   vgID_CONTRATO     := 0;
   vgFOL_CONTRATO    := 0;
   vgNOMB_CONTRATO   := ' ';
   vgCVE_FND_ENT_DES := ' ';
   vgCVE_EMISOR_EXT  := ' ';
end;

procedure TFCrReAcBu.dbgSelecionarDblClick(Sender: TObject);
begin
   btnAceptarClick(Self);
   ModalResult := mrYes;
end;

end.
