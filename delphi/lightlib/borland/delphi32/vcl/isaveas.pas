unit Isaveas;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls;

{$I LLI.INC}

type
    TDlgSaveAs = class(TForm)
        FileName:          TButton;
        Ok:                TButton;
        Cancel:            TButton;
        DisplayFileName:   TEdit;
        ImageFileFormat:   TGroupBox;
        ID_BMP_UNCOMP:     TRadioButton;
        ID_PCX_RLE:        TRadioButton;
        ID_TIF_UNCOMP:     TRadioButton;
        ID_TIF_LZW:        TRadioButton;
        ID_TIF_PACKED:     TRadioButton;
        ID_TIF_HUFFMAN:    TRadioButton;
        ID_TIF_CCITT3:     TRadioButton;
        ID_TIF_CCITT4:     TRadioButton;
        ID_GIF:            TRadioButton;
        ID_JPEG:           TRadioButton;
        ID_TARGA: TRadioButton;
        ID_PING: TRadioButton;
        procedure CancelClick(Sender: TObject);
        procedure OkClick(Sender: TObject);
        procedure FileNameClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    private
        { Private declarations }
    public
        { Public declarations }
        TheFileName :           TFileName;
        lValidFileNameFormat :  Boolean;
        nFileFormat :           LongInt;
        nCompress :             LongInt;

    end;

var
    DlgSaveAs : TDlgSaveAs;
    OldHelpFile : String;

implementation

{$R *.DFM}

{******************************************************************************}

procedure TDlgSaveAs.CancelClick(Sender: TObject);
begin
    lValidFileNameFormat := FALSE;
    ModalResult := -1
end;

{******************************************************************************}

procedure TDlgSaveAs.OkClick(Sender: TObject);
begin

    lValidFileNameFormat := True;

    if ( ID_BMP_UNCOMP.Checked ) then
    begin
        nFileFormat := LLI_DISK_BMP;
        nCompress   := LLI_DISK_COMPRESS_NIL;
 {       if ( Pos('.BMP', DisplayFileName.Text) > 0 ) then
            lValidFileNameFormat := True;}
    end
    else if ( ID_PCX_RLE.Checked ) then
    begin
        nFileFormat := LLI_DISK_PCX;
        nCompress   := LLI_DISK_COMPRESS_RLE;
{        if ( Pos('.PCX', DisplayFileName.Text) > 0 ) then
            lValidFileNameFormat := True;}
    end
    else if ( ID_TIF_UNCOMP.Checked ) then
    begin
        nFileFormat := LLI_DISK_TIF;
        nCompress   := LLI_DISK_COMPRESS_NIL;
{        if ( Pos('.TIF', DisplayFileName.Text) > 0 ) then
            lValidFileNameFormat := True;}
    end
    else if ( ID_TIF_LZW.Checked ) then
    begin
        nFileFormat := LLI_DISK_TIF;
        nCompress   := LLI_DISK_COMPRESS_LZW;
{        if ( Pos('.TIF', DisplayFileName.Text) > 0 ) then
            lValidFileNameFormat := True;}
    end
	 else if ( ID_TIF_PACKED.Checked ) then
    begin
        nFileFormat := LLI_DISK_TIF;
        nCompress   := LLI_DISK_COMPRESS_PCKBIT;
{        if ( Pos('.TIF', DisplayFileName.Text) > 0 ) then
            lValidFileNameFormat := True;}
    end
    else if ( ID_TIF_HUFFMAN.Checked ) then
    begin
        nFileFormat := LLI_DISK_TIF;
        nCompress   := LLI_DISK_COMPRESS_CCITT1D;
{        if ( Pos('.TIF', DisplayFileName.Text) > 0 ) then
            lValidFileNameFormat := True;}
    end
    else if ( ID_TIF_CCITT3.Checked ) then
    begin
        nFileFormat := LLI_DISK_TIF;
        nCompress   := LLI_DISK_COMPRESS_CCITTG3;
{        if ( Pos('.TIF', DisplayFileName.Text) > 0 ) then
            lValidFileNameFormat := True;}
    end
    else if ( ID_TIF_CCITT4.Checked ) then
    begin
        nFileFormat := LLI_DISK_TIF;
        nCompress   := LLI_DISK_COMPRESS_CCITTG4;
{        if ( Pos('.TIF', DisplayFileName.Text) > 0 ) then
            lValidFileNameFormat := True;}
    end
    else if ( ID_GIF.Checked ) then
    begin
        nFileFormat := LLI_DISK_GIF;
        nCompress   := LLI_DISK_COMPRESS_LZW;
 {       if ( Pos('.GIF', DisplayFileName.Text) > 0 ) then
            lValidFileNameFormat := True;}
    end;
    if ( ID_JPEG.Checked ) then
    begin
        nFileFormat := LLI_DISK_JPG;
        nCompress   := LLI_DISK_COMPRESS_LZW;
{        if ( Pos('.JPG', DisplayFileName.Text) > 0 ) then
            lValidFileNameFormat := True;}
    end;
    if ( ID_TARGA.Checked ) then
    begin
        nFileFormat := LLI_DISK_TGA;
        nCompress   := LLI_DISK_COMPRESS_NIL;
{        if ( Pos('.TGA', DisplayFileName.Text) > 0 ) then
            lValidFileNameFormat := True;}
    end;
    if ( ID_PING.Checked ) then
    begin
        nFileFormat := LLI_DISK_PNG;
        nCompress   := LLI_DISK_COMPRESS_NIL;
{        if ( Pos('.PNG', DisplayFileName.Text) > 0 ) then
            lValidFileNameFormat := True;}
    end;

    if not ( lValidFileNameFormat ) then
    begin
        Application.MessageBox('Invalid File Name. Extension has to match format',
                               'Save As Error', MB_OK );
        Ok.Enabled := FALSE;
    end
    else
    begin
        TheFileName := DisplayFileName.Text;
        close; { the dialog }
    end;
end;

{******************************************************************************}

procedure TDlgSaveAs.FileNameClick(Sender: TObject);
Var
   oDialog  : TSaveDialog;
begin
   oDialog := TSaveDialog.Create( self );
   oDialog.Filter := 'TIF files (*.TIF)|*.TIF|' +
                     'Bitmap files (*.BMP)|*.BMP|' +
                     'PCX files (*.PCX)|*.PCX|' +
                     'JPEG files (*.JPG)|*.JPG|' +
                     'Targa files (*.TGA)|*.TGA|' +
                     'PNG files (*.PNG)|*.PNG|' +
                     'GIF files (*.GIF)|*.GIF';
   if oDialog.Execute then
   begin
      TheFileName := oDialog.FileName ;
      Ok.Enabled := TRUE;
      DisplayFileName.Text := TheFileName ;
   end
   else
      DisplayFileName.Text := TheFileName ;

end;

{******************************************************************************}

procedure TDlgSaveAs.FormCreate(Sender: TObject);
begin
    OldHelpFile := Application.HelpFile;
    Application.HelpFile := 'LLIUSER.HLP';
end;

procedure TDlgSaveAs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Application.HelpFile := OldHelpFile;
end;

end.
