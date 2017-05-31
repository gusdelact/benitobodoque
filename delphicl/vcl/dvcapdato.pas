unit DvCapDato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls
  ,UnPrGenCapt
  ;

//type TCaptura = (tcEdit, tcMemo);
//type TDato = (tdString, tdInteger, tdFloat);

type
  TfrmDvCApDato = class(TForm)
    pnlMain: TPanel;
    btnButton: TPanel;
    btnAceptar: TBitBtn;
    lblSolicitaDato: TStaticText;
    mmCaptura: TMemo;
    edtCaptura: TEdit;
    cbCaptura: TComboBox;
    btnCancela: TBitBtn;
    procedure btnAceptarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCapturaKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnCancelaClick(Sender: TObject);
  private
    { Private declarations }
    vgtCaptura : TCaptura;
    vgtDato :  TDato;
    procedure pAceptar;
    procedure MoveCaret(Memo: TMemo; Row, Col: Integer);
  public
    { Public declarations }
    //vgListaCombo : TStringList;
    vgDatoCapturado : String;
    vBOk, vBSoloLectura : Boolean;
    constructor Create(aOwner: TComponent; aTCapura : TCaptura; aTipoDato : TDato; aPregunta : String; aReadOnly : Boolean); 
    overload;
//    constructor Create(aOwner: TComponent; aTCapura : TCaptura; aTipoDato : TDato; aPregunta : String; aReadOnly, aCancel
//     : Boolean);
//    overload;

  end;

implementation

{$R *.DFM}



{ TForm1 }
{******************************************************************************************************
*******************************************************************************************************}
//constructor TfrmDvCApDato.Create(aOwner: TComponent; aTCapura: TCaptura;
//  aTipoDato: TDato; aPregunta: String; aReadOnly, aCancel: Boolean);
//begin
////  btnCancela.Visible := aCancel;
////  TfrmDvCApDato(Self).Create(aOwner, aTCapura, aTipoDato, aPregunta, aReadOnly);
//end;
{**********************************************************************************************************************
 *********************************************************************************************************************}
constructor TfrmDvCApDato.Create(aOwner: TComponent; aTCapura: TCaptura; aTipoDato : TDato;
  aPregunta: String; aReadOnly : Boolean);
begin
  Inherited Create(aOwner);
  lblSolicitaDato.Caption := aPregunta;
  vgtCaptura := aTCapura;
  vgtDato := aTipoDato;
  vBOk := False;
  vBSoloLectura := aReadOnly;
  case aTCapura of
    tcEdit :  begin
                Height := 133;
                Width  := lblSolicitaDato.Width + 21;
                if lblSolicitaDato.Width < 190 then
                  Width := 190;
                mmCaptura.Visible := False;
                edtCaptura.Visible := True;
                cbCaptura.Visible := False;
                edtCaptura.TabOrder := 0;
                edtCaptura.ReadOnly := vBSoloLectura;
              end;
    tcMemo :  begin
                Height := 230;
                if lblSolicitaDato.Width <= 450 then
                  Width  := 450
                else
                  Width := lblSolicitaDato.Width + 21;

                mmCaptura.Visible := True;
                edtCaptura.Visible := False;
                cbCaptura.Visible := False;
                mmCaptura.TabOrder := 0;
                mmCaptura.ReadOnly := vBSoloLectura;

              end;
    tcCombo :  begin
                Height := 133;
                Width  := lblSolicitaDato.Width + 21;
                if lblSolicitaDato.Width < 400 then
                  Width := 400;
                mmCaptura.Visible := False;
                edtCaptura.Visible := False;
                cbCaptura.Visible := True;

                cbCaptura.TabOrder := 0;

                cbCaptura.Items := vgListaComboCap;


              end;

  end;
  vBOk := False;
end;
{******************************************************************************************************
*******************************************************************************************************}
procedure TfrmDvCApDato.btnAceptarClick(Sender: TObject);
begin
  pAceptar;
end;
{******************************************************************************************************
*******************************************************************************************************}
procedure TfrmDvCApDato.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if not vBOk  then
    vgDatoCapturado := '';
end;
{******************************************************************************************************
*******************************************************************************************************}
procedure TfrmDvCApDato.edtCapturaKeyPress(Sender: TObject; var Key: Char);
begin
  case vgtDato of
   tdInteger :
   begin
    if (not ( StrScan('0123456789',Key) <> nil )) and (Key <> #8 ) and (Key <> #13) then
      Abort;
   end;
   tdFloat :
   begin
    if (Pos('.', edtCaptura.Text) > 0) and (Key = '.')  then
      Abort;
    if (not ( StrScan('0123456789.',Key) <> nil )) and (Key <> #8 ) and (Key <> #13) then
      Abort;
    if (Pos('.', edtCaptura.Text) > 0) and (Key = '.')  then
      Abort;
   end;
  end;

  if Key = #13 then
    pAceptar;
end;
{******************************************************************************************************
*******************************************************************************************************}
procedure TfrmDvCApDato.FormShow(Sender: TObject);
begin
  mmCaptura.Text := vgDatoCapturado;
  MoveCaret(mmCaptura, 10, 10);
  edtCaptura.Text := vgDatoCapturado;
end;
{******************************************************************************************************
*******************************************************************************************************}
procedure TfrmDvCApDato.pAceptar;
begin
case vgtCaptura of
    tcEdit  : vgDatoCapturado := edtCaptura.Text;
    tcMemo  : vgDatoCapturado := mmCaptura.Text;
    tcCombo : vgDatoCapturado := cbCaptura.Text;
  end;
  vBOk := (vgDatoCapturado <> '') or (vBSoloLectura);
  Close;
end;
{******************************************************************************************************
*******************************************************************************************************}
procedure TfrmDvCApDato.MoveCaret(Memo: TMemo; Row, Col: Integer);
var
  LineIndex: Integer;
  LineLength: Integer;

begin
  LineIndex := Memo.Perform(EM_LINEINDEX, Row, 0);

  if LineIndex = -1 then
    Memo.SelStart := Length(Memo.Text)
  else
  begin
    LineLength := Memo.Perform(EM_LINELENGTH, LineIndex, 0);
    if Col > LineLength then Col := LineLength;

    Memo.Perform(EM_SETSEL, LineIndex + Col, LineIndex + Col)
  end;

  Memo.Perform(EM_SCROLLCARET, 0, 0);
end;

procedure TfrmDvCApDato.btnCancelaClick(Sender: TObject);
begin
  vBOk := True;
  vgDatoCapturado := 'X1X';
  Close;
end;



end.
