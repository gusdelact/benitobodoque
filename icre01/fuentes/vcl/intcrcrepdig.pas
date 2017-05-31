unit InTCrCRepDig;
// PdfLib_TLB
// Valida conexion FTP
interface

uses
  Windows,  Messages,  SysUtils, Classes,  Graphics,  Controls,  Forms,
  Dialogs,  InterFor,  Buttons,  StdCtrls, ComCtrls,  IntDtPk,   IntFrm,
  ExtCtrls, UnSQL2,    Psock,    NMFtp,    ShellApi,  FileCtrl,  ZipTypes,
  Unzip,    DB,        IntParamCre,        //IntcrAcrobat,
  //
  IntGenCre
  ;

type
  TCrCRepDig = Class;

  TWCrCRepDig = class(TForm)
    InterForma1: TInterForma;
    FTPInter9: TNMFTP;
    PDirect: TPanel;
    lbDir: TListBox;
    Label3: TLabel;
    Button2: TButton;
    cbMes: TComboBox;
    Label4: TLabel;
    cbAnio: TComboBox;
    Label5: TLabel;
    rgTipoArchivo: TRadioGroup;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    Ltemp: TListBox;
    Label9: TLabel;
    edFECHA: TEdit;
    dtpFecha: TInterDateTimePicker;
    procedure DirectorioAnioMes;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FTPInter9ListItem(Listing: String);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbAnioChange(Sender: TObject);
    procedure cbMesChange(Sender: TObject);
    procedure rgTipoArchivoClick(Sender: TObject);
    procedure edFECHAChange(Sender: TObject);
    procedure cbMesClick(Sender: TObject);
    procedure cbAnioClick(Sender: TObject);
  private
    //<LOLS 11 ABR 2006. ABRE LA CONEXION AL SERVIDOR FTP>
    function  AbreConexion : Boolean;
    //</LOLS>
  public
    { Public declarations }
    Objeto : TCrCRepDig;
  end;

  TCrCRepDig = class(TInterFrame)
  private
  protected
  public
    ROOTDIR        : TInterCampo;
    CURPATH        : TInterCampo;
    //VisAcrobat     : TInterAcro;
    ParamCre       : TParamCre;
    constructor    Create( AOwner : TComponent ); override;
    destructor     Destroy; override;
    function       ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
  published
  end;



var  
  cNomArchivoPDF    : String;
  cNomArchivoUNZIP  : String;
  cNomPathTemp      : String;
  cMascaraUnzip     : String;
  Count             : longint;
  BytesExtracted    : longint;
  CompressedSize    : longint;
  UnzippedSize      : longint;

  tmp1, sffecha:string;

implementation
{$R *.DFM}


//******************************************************UNZIP
Function TmpDir : AnsiString;
var p : array [ 0 .. 259 ] of char;
Begin
  if GetTempPath( sizeof(p), p) > 0
  then Result := StrPas(p)
  else Result := 'c:\temp\';
End;
//
procedure Report ( Retcode : longint; R : pReportRec ); stdcall;
var pct : Byte;
    R1  : Real;
begin
  WITH r^ DO BEGIN
  CASE Status of
    file_starting  :
    begin
      Application.ProcessMessages;
      //Form1.Panel1.Caption := StrPas(FileName);
    end;

    file_completed :
    begin
      Application.ProcessMessages;
      //Form1.Panel1.Caption := '';
    end;

    file_unzipping :
    if Retcode > 0 then
    begin
      Inc ( BytesExtracted, Retcode);
      R1 := ( BytesExtracted / UnzippedSize ) * 100;
      Pct := Round ( R1 );
      Application.ProcessMessages;
      Application.ProcessMessages;
    end;
    unzip_completed :
    begin
      Application.ProcessMessages;
    end;
 END {case}
 END;

end; {report}
//
PROCEDURE Report2 ( Retcode : longint;R : pReportRec ); STDCALL;
Var
s:String;
BEGIN
   WITH r^ DO begin
        if Status <> unzip_completed then begin
           s := strpas ( filename );
           cNomArchivoPDF := s;
        end;
   end;
END; {Report2}
//
//*******************************************************UNZIP




constructor TCrCRepDig.Create( AOwner : TComponent );
begin
  inherited
  Create(AOwner);
  //
  ROOTDIR  := CreaCampo( 'ROOTDIR',  ftString,   tsNinguno, tsNinguno,  False );
  CURPATH  := CreaCampo( 'CURPATH',  ftString,   tsNinguno, tsNinguno,  False );
   //
   HelpFile := 'InTCrCRepDig.hlp';
   ShowMenuReporte := True;

end;

destructor TCrCRepDig.Destroy;
begin
  inherited;
end;

function TCrCRepDig.ShowWindow(FormaTipo:TFormaTipo):Integer;
var Win : TWCrCRepDig;
begin
  Win := TWCrCRepDig.Create(Self);
  try
     Win.InterForma1.InterFrame:= Self;
     Win.Objeto:= Self;
     Win.InterForma1.FormaTipo := ftImprimir;
     Win.InterForma1.ShowGrid := False;
     Win.InterForma1.ShowNavigator := False;
     Win.InterForma1.Funcion := FInterFun;
     Win.InterForma1.ShowModal;
     ShowWindow := Win.InterForma1.ModalResult;
  finally
     Win.Free;
  end;
end;

//<LOLS 11 ABR 2006. ABRE LA CONEXION AL SERVIDOR FTP>
function TWCrCRepDig.AbreConexion: Boolean;
begin
  Result := False;
  // Si no esta conectado abre la conexion
  if not FtpInter9.Connected then
  begin
    FtpInter9.Connect;
    FtpInter9.Mode(MODE_IMAGE);
    Result := True;
  end else begin
    FtpInter9.DoCommand('PWD');
    Result := True;
  end;
  //
  //
  if FtpInter9.Connected then
  Begin
    Objeto.CURPATH.AsString := Objeto.ROOTDIR.AsString +  ObtSendTo( DateToStr(
             EncodeDate( StrToInt( cbAnio.Text ),  cbMes.itemindex + 1, 1 ) ) );
    FtpInter9.ChangeDir( Objeto.CURPATH.AsString );
  End;
  //
end;
//</LOLS>

//
procedure TWCrCRepDig.DirectorioAnioMes;
Begin
  try
    lbDir.Items.Clear;
    Ltemp.Clear;
    //<LOLS 11 ABR 2006. ABRE CONEXION AL SERVIDOR FTP>
    if AbreConexion then
    Begin
      FTPInter9.NList;
      //
      lbDir.Itemindex := 0;
      if lbDir.CanFocus then lbDir.SetFocus;
    End;
    {
    // Si no esta conectado abre la conexion
    if not FtpInter9.Connected then
    begin
       FtpInter9.Connect;
       FtpInter9.Mode(MODE_IMAGE);
    end;
    //
    Objeto.CURPATH.AsString := Objeto.ROOTDIR.AsString +  ObtSendTo( DateToStr(
             EncodeDate( StrToInt( cbAnio.Text ),  cbMes.itemindex + 1, 1 ) ) );
    FtpInter9.ChangeDir( Objeto.CURPATH.AsString );
    //
    try
      FTPInter9.NList;
    except
      lbDir.Sorted    := True;
      lbDir.Update;
      lbDir.Itemindex := 0;
      lbDir.SetFocus;
    end;
    }
    //</LOLS>
    //
  except
    lbDir.Items.Clear;
  end;
End;

procedure TWCrCRepDig.FormCreate(Sender: TObject);
begin
    Count   := 0;
    BytesExtracted := 0;
    CompressedSize := 0;
    UnzippedSize   := 0;
end;

procedure TWCrCRepDig.FormShow(Sender: TObject);
var anio : Integer;
    Year, Month, Day : Word;

begin
  lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
  lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;
  //

  DecodeDate(Objeto.Apli.DameFechaEmpresa, Year, Month, Day );
  //
  CbAnio.Clear;
  for anio := Year - 3  to Year do
    CbAnio.items.Add( inttoStr(anio) );
  CbAnio.Itemindex := CbAnio.Items.count - 1;
  //
  cbMes.ItemIndex  := 0;
  //
  FTPInter9.Host     := obtValorGpoCve( 'CONFRH', 'FTPSERVER', Objeto.Apli );
  FTPInter9.UserID   := obtValorGpoCve( 'CONFRH', 'USERNAME',  Objeto.Apli );
  FTPInter9.Password := HexToStr( obtValorGpoCve( 'CONFRH', 'PASSWORD',  Objeto.Apli ) );
  //
  Objeto.ROOTDIR.AsString := obtValorGpoCve( 'CONFRH', 'ROOTDIR', Objeto.Apli );
end;

procedure TWCrCRepDig.FormDestroy(Sender: TObject);
begin
  if FTPInter9.Connected then
    FTPInter9.Disconnect;
  //
end;
//
procedure TWCrCRepDig.FTPInter9ListItem(Listing: String);
var sExt : String;
    sfecha, sarchivo, sextension, arch1, vlnummes :string;
    bsalir, bfecha : boolean;
    i, vlinianio:integer;
begin
  if rgTipoArchivo.ItemIndex = 0 then sExt := '.ZIP'
  else if rgTipoArchivo.ItemIndex = 1 then sExt := '.PRN';

  if UpperCase( ExtractFileExt( Listing ) ) = sExt then
  begin
     sextension := Copy(Listing, length(Listing)-3, 4);

     i:=cbMes.ItemIndex + 1;
     if i >= 10 then
       vlnummes:=IntToStr(i)
     else
       vlnummes:='0'+IntToStr(i);

     vlinianio:= Pos(vlnummes+'_'+cbAnio.Text, Listing);

     if (vlinianio > 0) then
     begin
        sfecha     := Copy(Listing, vlinianio-3, 10);
        sarchivo   := Copy(Listing, 1, vlinianio-5);
     end;
     arch1:=sfecha+'_'+sarchivo+sextension;

     bsalir:=false;
     i:=0;
     while (i <= lbdir.Items.Count-1) and (bsalir = false)  do
     begin
        if arch1 > Ltemp.Items.Strings[i] then bsalir:=true
        else
        inc(i);
     end;

     sffecha:='';
     bfecha:=false;
     if (Trim(edFECHA.Text)<>'') then
     begin
        tmp1:=edFECHA.Text;
        sffecha:=tmp1[1]+tmp1[2]+'_'+tmp1[4]+tmp1[5]+'_'+tmp1[7]+tmp1[8]+tmp1[9]+tmp1[10];

        if (sfecha=sffecha) then bfecha:=true;
     end;

     if (bfecha) or (Trim(edFECHA.Text)='') then
     begin
        //lbdir.Items.Add(Listing);
        Ltemp.Items.Insert(i,arch1);
        lbdir.Items.Insert(i,Listing);
     end;  
  end;//
end;
//
procedure TWCrCRepDig.cbAnioChange(Sender: TObject);
begin
  DirectorioAnioMes;
end;
//
procedure TWCrCRepDig.cbMesChange(Sender: TObject);
begin
  DirectorioAnioMes;
end;
//
procedure TWCrCRepDig.rgTipoArchivoClick(Sender: TObject);
begin
  DirectorioAnioMes;
end;
//
procedure TWCrCRepDig.Button2Click(Sender: TObject);
var s, d, ss : ShortString;
    Count2   : Integer;
    //
    sLocalFile   : String;
    sRemoteFile  : String;
    sAcrobatFile : String;
    //
begin
   if Objeto.ValidaAccesoEsp('TCRCREPDIG_REPOR',True,True) then
   begin
      if ( lbDir.ItemIndex < 0 ) or ( lbDir.Items[ lbDir.ItemIndex ] = '' ) then
      //  if lbDir.Items[ lbDir.ItemIndex ] = '' then       // LOLS 11 ABR 2006
      Begin
        ShowMessage('Favor de seleccionar un archivo');
        Exit;
      End;
      //
      sLocalFile  := TmpDir + lbDir.Items[ lbDir.ItemIndex ];
      sRemoteFile := lbDir.Items[ lbDir.ItemIndex ];
      //
      //<LOLS 11 ANR 2006. VALIDA QUE LA CONEXION AUN ESTE DISPONIBLE>
      if AbreConexion then
      Begin
      //</LOLS>
          //
          FTPInter9.Download( sRemoteFile, sLocalFile );
          //
          if UpperCase( ExtractFileExt( sLocalFile ) ) = '.ZIP' then
          Begin
            cNomArchivoUNZIP := sLocalFile;
            cNomPathTemp  := ExtractFilePath(sLocalFile);
            cMascaraUnzip := '*.*';

            CompressedSize := 0;
            BytesExtracted := 0;
            s := cNomArchivoUNZIP + #0;
            d := cNomPathTemp + #0;
            ss:= cMascaraUnzip + #0;
            UnzippedSize := UnzipSize(@s[1], CompressedSize);
            Count2 := ViewZip(@s[1], '*.*', Report2);
            Count := FileUnzip( @s[1], @d[1], @ss[1], Report, nil);

            //
            sAcrobatFile := TmpDir + cNomArchivoPDF;
            {
            Objeto.VisAcrobat:=TInterAcro.Create(Self);
            Objeto.VisAcrobat.GetParams(Objeto);
            Objeto.VisAcrobat.ARCHIVO_ACROBAT.ASString  :=  TmpDir + cNomArchivoPDF;
            Objeto.VisAcrobat.ARCHIVO_ACROBAT_SIN_PATH.ASString := cNomArchivoPDF;
            Objeto.VisAcrobat.Catalogo;

            if Objeto.VisAcrobat <> nil then Objeto.VisAcrobat.Free;
            }
            ShellExecute(Handle, 'open', 'acrord32.exe', pchar(sAcrobatFile), nil, SW_SHOW  );

            {
            DeleteFile( cNomArchivoUNZIP  );
            DeleteFile( sAcrobatFile      );
            }

          End else if UpperCase( ExtractFileExt( sLocalFile ) ) = '.PRN' then
          Begin
            //--
            //
            ShellExecute(Handle, 'open', 'excel', pchar(sLocalFile), nil, SW_SHOW  );
            //
          End Else
            ShowMessage( 'Formato de archivo desconocido.' );
          //
          //
      //<LOLS 11 ANR 2006. VALIDA QUE LA CONEXION AUN ESTE DISPONIBLE>
      End;
      //</LOLS>
   end;
end;

procedure TWCrCRepDig.edFECHAChange(Sender: TObject);
var vlmes:integer;
    vlsmes:string;
begin
   if (Trim(edFECHA.Text)<>'') then
   begin
      tmp1:=edFECHA.Text;
      vlsmes:= tmp1[4]+tmp1[5];
      vlmes:=StrToInt(vlsmes);

      tmp1:=cbMes.Items.Strings[vlmes -1 ];
      cbMes.ItemIndex:= cbMes.Items.IndexOf(tmp1);

      tmp1:=edFECHA.Text;      
      tmp1:=tmp1[7]+tmp1[8]+tmp1[9]+tmp1[10];
      cbAnio.ItemIndex:= cbAnio.Items.IndexOf(tmp1);
   end;

   if (rgTipoArchivo.ItemIndex<>-1) and (Trim(edFECHA.Text)<>'') then
   begin
      DirectorioAnioMes;
   end;
end;

procedure TWCrCRepDig.cbMesClick(Sender: TObject);
begin
  edFECHA.Text:='';
end;

procedure TWCrCRepDig.cbAnioClick(Sender: TObject);
begin
  edFECHA.Text:='';
end;

end.
