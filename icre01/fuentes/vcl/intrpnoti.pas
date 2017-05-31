unit IntRpNoti;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, IntGenCre, U_InterCustomStar, U_InterDigDoc,
  Printers;

type
  TFRpNoti = class(TForm)
    qFRpNoti: TQuickRep;
    qrDetail: TQRBand;
    InterDigDoc1: TInterDigDoc;
    QRImgInteracciones: TQRImage;
    QRRichText1: TQRRichText;
    procedure qFRpNotiBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure FillDataToMemo(str : String);
  end;

var
  FRpNoti: TFRpNoti;

function Correccion(str : String) : String;

implementation

{$R *.DFM}

function Correccion(str : String) : String;
begin
 str := ReplaceAllStr(str,#10#10,'<enter><enter>');
 str := ReplaceAllStr(str,#13#10,'<enter>');
 str := ReplaceAllStr(str,#13,'<enter>');
 str := ReplaceChar(str,#10,'<enter>');
 str := ReplaceAllStr(str,'<enter>',#13#10);
 Result := str;
end;

procedure TFRpNoti.FillDataToMemo(str : String);
var strTemp, strTemp2 : String;
    I, nPos, nPosSpace, nWidth : Integer;

begin
 nWidth := qrDetail.Width;
 QRRichText1.Lines.Clear;
 str := Correccion(str);

 While (str <> '') Do
  Begin
  nPos := Pos(#13,str);
  strTemp := Copy(str,1,nPos-1);

  // Si la línea es bastante larga para ser presentada, entonces lo genera en otra línea
  strTemp2 := '';
  Canvas.Font :=  QRRichText1.Font;
  If Canvas.TextWidth(strTemp) > nWidth Then
   Begin
    nPosSpace := 0;
    For I := 1 To Length(strTemp) Do
     Begin
     strTemp2 := strTemp2 + strTemp[I];
     If (strTemp[I] = #32) Then // Obtiene el último espacio
      nPosSpace := I;
     If Canvas.TextWidth(strTemp2) > nWidth Then
      Begin
      If (nPosSpace = 0) Then nPos := I
      Else nPos := nPosSpace;
      strTemp := Copy(str,1,nPos-1);
      nPos := nPos-1;
      Break;
      End;
     End;
   End;
  QRRichText1.Lines.Add(strTemp);
  str := Copy(str,nPos+2,Length(str));
  End;
end;

procedure TFRpNoti.qFRpNotiBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
 If qFRpNoti.Page.Orientation = poLandscape Then
    Begin
    QRImgInteracciones.Left := 782;
    QRRichText1.Size.Height := 173.30208333;
    QRRichText1.Size.Left   := 0.79375;
    QRRichText1.Size.Top    := 16.66875;
    QRRichText1.Size.Width  := 256.64583333;
    End
 Else
    Begin
    QRImgInteracciones.Left := 542;
    QRRichText1.Size.Height := 231.0;
    QRRichText1.Size.Left   := 0.3;
    QRRichText1.Size.Top    := 16.4;
    QRRichText1.Size.Width  := 194.8;
    End;
end;

end.
