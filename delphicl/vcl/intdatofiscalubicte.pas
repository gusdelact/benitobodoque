//------------------------------------------------------------------------------
// Función    : Datos Fiscales de Ubicacion o Residencia en Contratantes
// Desarrollo : Cesar Zamora Ramirez
// Fecha      : 20 de Noviembre del 2014
//------------------------------------------------------------------------------
Unit IntDatoFiscalUbiCte;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm, DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntFind,
  UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, IntLinkit, UnFunProcICB;

Type
  TDatFisUbiCte = Class;              
  TWDatFisUbiCte = Class(TForm)
    InterForma1 : TInterForma;
    lvDatFisUbiCte: TListView;
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormShow(Sender: TObject);
    private
      { Private declarations }
    public
      { Public declarations }
      Objeto : TDatFisUbiCte;
    end;

  TDatFisUbiCte = class(TInterFrame)
    private
      { Private declarations }
      vIdContrato     : Integer;
      vlvDatFisUbiCte : TListView;
    protected
      { Protected declarations }
    public
      { Public declarations }
      constructor Create( AOwner : TComponent ); override;
      destructor  Destroy; override;
      function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    published
      { Published declarations }
      property pIdContrato     : Integer   read vIdContrato     write vIdContrato;
      property plvDatFisUbiCte : TListView read vlvDatFisUbiCte write vlvDatFisUbiCte;
    end;
implementation
{$R *.DFM}

constructor TDatFisUbiCte.Create( AOwner : TComponent );
begin
   Inherited;
   UseQuery        := True;
   ShowMenuReporte := True;
end;

destructor TDatFisUbiCte.Destroy;
begin
   inherited;
end;

function TDatFisUbiCte.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWDatFisUbiCte;

begin
  W := TWDatFisUbiCte.Create(Self);
  try
    W.Objeto                      := Self;
    W.InterForma1.InterFrame      := Self;
    W.InterForma1.FormaTipo       := ftImprimir;
    W.InterForma1.ShowBtnAyuda    := False;
    W.InterForma1.ShowGrid        := False;
    W.InterForma1.ShowNavigator   := False;
    W.InterForma1.ShowBtnPreview  := False;
    W.InterForma1.ShowBtnImprimir := False;
    W.InterForma1.Funcion         := FInterFun;
    plvDatFisUbiCte               := W.lvDatFisUbiCte;
    W.InterForma1.ShowModal;
    ShowWindow                    := W.InterForma1.ModalResult;
  finally
    W.Free;
  end;
end;

procedure TWDatFisUbiCte.FormShow(Sender: TObject);
var
   Qry : TQuery;
begin
   try
      with Objeto do
      begin
         plvDatFisUbiCte.Items.Clear;
         Qry := GetSQLQuery('SELECT * FROM TABLE(PkgCorporativo.getContratoNoIdFiscal('
                            + IntToStr(pIdContrato) + '))',
                            Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);

         if Qry <> nil then
            while not Qry.eof do
            begin
               AgregaFilaLvw(plvDatFisUbiCte, [IntToStr(Qry.FieldByName('ID_PERSONA').AsInteger),
                                               Trim(Qry.FieldByName('DESC_CONTRATANTE').AsString),
                                               Trim(Qry.FieldByName('NOM_PERSONA').AsString),
                                               Trim(Qry.FieldByName('DESC_PAIS').AsString),
                                               Trim(Qry.FieldByName('TIPO_ID_FISCAL').AsString),
                                               Trim(Qry.FieldByName('REQUERIDO').AsString)]);
               Qry.next;
            end;
      end;
   finally
      if Qry <> nil then
         FreeAndNil(Qry);
   end;
end;

procedure TWDatFisUbiCte.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;   
end.
