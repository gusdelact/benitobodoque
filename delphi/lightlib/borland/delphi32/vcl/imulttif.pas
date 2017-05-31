unit Imulttif;

{$define DataAware}

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,
  StdCtrls, lli, SysUtils, ExtCtrls, llo;

type
  TMultiImageDialog = class(TForm)
    OKBtn: TBitBtn;
    CancelBtn: TBitBtn;
    HelpBtn: TBitBtn;
    cbImages: TComboBox;
    ImageWindow1: TImageWindow;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    Bevel1: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ltWidth: TLabel;
    ltHeight: TLabel;
    ltMemory: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ltBits: TLabel;
    ltColors: TLabel;
    procedure cbImagesChange(Sender: TObject);
  private
    { Private declarations }
    FFileName : String;
    FImageIndex : Longint;
    procedure ShowInfo;
  public
    { Public declarations }
    procedure Init( FileName: String; ImageIndex : Longint );
  end;

var
  MultiImageDialog: TMultiImageDialog;
  IsDown     : Boolean;
  OldX, OldY : Integer;
  OldSx, OldsY : Integer;

implementation


procedure TMultiImageDialog.Init( FileName: String; ImageIndex : Longint );
var
    i: Longint;
begin
    FFileName := FileName;
    FImageIndex := ImageIndex;

    for i := 0 to FImageIndex-1 do
    begin
        cbImages.Items.Add( 'Tiff Image Page ' + IntToStr(i+1) );
    end;
    cbImages.ItemIndex := 0;
    ImageWindow1.ImageInWindow.LoadFile( FFileName, 0,{$ifdef DataAware} nil, {$endif} cbImages.ItemIndex );
    ImageWindow1.FitStyle := fsBest;
    ShowInfo;
    OldX := 0;
    OldY := 0;
    IsDown := False;
end;

procedure TMultiImageDialog.ShowInfo;
begin
    ltWidth.Caption     := IntToStr( ImageWindow1.ImageInWindow.DisWidth );
    ltHeight.Caption    := IntToStr( ImageWindow1.ImageInWindow.DisHeight );
    ltColors.Caption    := FloatToStrF(ImageWindow1.ImageInWindow.Colors, ffNumber, 15, 0 );
{    ltDensity.Caption   := IntToStr( ImageWindow1.ImageInWindow.Density );}
    ltBits.Caption      := IntToStr( ImageWindow1.ImageInWindow.Bits );
    ltMemory.Caption    := IntToStr( Round( ImageWindow1.ImageInWindow.DisWidth*
                                                     ImageWindow1.ImageInWindow.DisHeight*
                                                     ImageWindow1.ImageInWindow.Bits/8 ) );
end;

{$R *.DFM}

procedure TMultiImageDialog.cbImagesChange(Sender: TObject);
begin
    ImageWindow1.ImageInWindow.LoadFile( FFileName, 0{$ifdef DataAware}, nil {$endif}, cbImages.ItemIndex );
    ImageWindow1.FitStyle := fsBest;
    ShowInfo;
end;

end.
