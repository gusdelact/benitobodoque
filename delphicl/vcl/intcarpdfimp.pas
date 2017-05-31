// Sistema         : Clase de Carga de PDF para Emisoras de Soc Inv
// Fecha de Inicio : 28-jun-2011
// Función forma   : Clase
// Desarrollo por  : JCSR
// Comentarios     :
unit IntCarPdfImp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm, DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, Grids, DBGrids,
  CheckLst, ShellAPI, FileCtrl;

Type
  TNodo = Class(TPersistent)
            Public
	      Emisora      : String;
              Serie : String;
              Tipo_valor : String;
              F_carga : TDate;
              pdf : TBlobField;

   	      Constructor Create; Virtual;
	      Destructor Destroy; override;
          end;


  TCarPdfImp = Class;
  TWCarPdfImp= class(TForm)
    qSiPdf: TQuery;
    DataSource1: TDataSource;
    InterForma1: TInterForma;
    ListView1: TListView;
    GroupBox1: TGroupBox;
    edDirectorio: TEdit;
    DriveComboBox1: TDriveComboBox;
    DirectoryListBox1: TDirectoryListBox;
    qPersona: TQuery;
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure DirectoryListBox1Change(Sender: TObject);

  private
     { Private declarations }
  public
    { Public declarations }
    Objeto : TCarPdfImp;
  end;

  TCarPdfImp = class(TInterFrame)
  private
  protected
  public
    { Public declarations }
    id_persona : Integer;

    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

  published
  end;

implementation

{$R *.DFM}

Constructor TNodo.Create;
begin Inherited;
end;

Destructor TNodo.Destroy;
begin
  Inherited;
end;

constructor TCarPdfImp.Create( AOwner : TComponent );
begin
 Inherited;
end;

destructor TCarPdfImp.Destroy;
begin
   inherited;
end;

function TCarPdfImp.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCarPdfImp;
begin
   W:=TWCarPdfImp.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.FormaTipo       := FormaTipo;
      W.InterForma1.ShowGrid        := False;
      W.InterForma1.ShowNavigator   := False;
      W.InterForma1.Funcion         := FInterFun;
      W.InterForma1.ShowBtnNuevo := False;
      W.InterForma1.ShowBtnModificar := False;
      W.InterForma1.ShowBtnImprimir := True;
      W.InterForma1.ShowBtnEliminar := False;
      W.InterForma1.ShowBtnBuscar := False;
      W.InterForma1.ShowBtnAyuda := False;
      W.InterForma1.ShowBtnCancelar := False;
      W.InterForma1.ShowBtnAceptar := False;

      W.InterForma1.ShowModal;

      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

procedure TWCarPdfImp.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCarPdfImp.FormShow(Sender: TObject);
Var
   NEmisora : TNodo;
   i : integer;
   vStrPersonalidad : String;
begin
  qPersona.DatabaseName := Objeto.DataBaseName;
  qPersona.SessionName  := Objeto.SessionName;
  qPersona.SQL.Clear;
  qPersona.SQL.Add('SELECT * FROM PERSONA ');
  qPersona.SQL.Add('WHERE ID_PERSONA = ' + IntToStr(Objeto.id_persona));
  qPersona.open;

  if qPersona.fieldbyName('CVE_PER_JURIDICA').AsString = 'PM' then
    vStrPersonalidad := ' IN (' + Chr(39) + qPersona.fieldbyName('CVE_PER_JURIDICA').AsString + Chr(39) + ',' +
                        Chr(39) + 'NC' + Chr(39) + ')'
  else
      vStrPersonalidad := ' = ' + Chr(39) + qPersona.fieldbyName('CVE_PER_JURIDICA').AsString + Chr(39);

  qSiPdf.DatabaseName := Objeto.DataBaseName;
  qSiPdf.SessionName  := Objeto.SessionName;
  qSiPdf.SQL.Clear;
  qSiPdf.SQL.Add('SELECT P.EMISORA, P.SERIE, P.TIPO_VALOR, P.F_CARGA, P.PDF ');
  qSiPdf.SQL.Add('FROM  SI_CARGA_PDF P, ');
  qSiPdf.SQL.Add('      (SELECT EMISORA, SERIE, TIPO_VALOR FROM SI_TIPOADQSI ');
  qSiPdf.SQL.Add('       WHERE ID_TIPO_ADQUIR ' + vStrPersonalidad + ' GROUP BY EMISORA, SERIE, TIPO_VALOR) A  ');
  qSiPdf.SQL.Add('WHERE P.EMISORA = A.EMISORA ');
  qSiPdf.SQL.Add('      AND P.SERIE = A.SERIE ');
  qSiPdf.SQL.Add('      AND P.TIPO_VALOR = A.TIPO_VALOR ');
  qSiPdf.SQL.Add(' ORDER BY P.EMISORA, P.SERIE ');

  qSiPdf.Open;
  i := 0;

   While (Not qSiPdf.Eof) do
   Begin
     NEmisora := TNodo.Create;
     NEmisora.Emisora := qSiPdf.fieldbyName('EMISORA').AsString;
     NEmisora.Serie := qSiPdf.fieldbyName('SERIE').AsString;
     NEmisora.Tipo_valor := qSiPdf.fieldbyName('TIPO_VALOR').AsString;
     NEmisora.F_carga := qSiPdf.fieldbyName('F_CARGA').AsDateTime;
     NEmisora.pdf := TBlobField(qSiPdf.fieldbyName('PDF'));

     ListView1.Items.Add;
     ListView1.Items.Item[i].Caption := NEmisora.Emisora;
     ListView1.Items.Item[i].Checked := True;
     ListView1.Items.Item[i].Data := NEmisora;
     ListView1.Items.Item[i].SubItems.Add(NEmisora.Serie);
     ListView1.Items.Item[i].SubItems.Add(NEmisora.Tipo_valor);
     ListView1.Items.Item[i].SubItems.Add(FormatDateTime('DD/MM/YYYY',NEmisora.F_carga));
     inc(i);

     qSiPdf.Next;
   end;
   qSiPdf.Active := False;
   qPersona.Active := False;
end;

procedure TWCarPdfImp.InterForma1BtnImprimirClick(Sender: TObject);
  function EjecutarYEsperar( sPrograma: String; Visibilidad: Integer ): Integer;
  var  sAplicacion: array[0..512] of char;
    DirectorioActual: array[0..255] of char;
    DirectorioTrabajo: String;
    InformacionInicial: TStartupInfo;
    InformacionProceso: TProcessInformation;
    iResultado, iCodigoSalida: DWord;
  begin
    StrPCopy( sAplicacion, sPrograma );
    GetDir( 0, DirectorioTrabajo );
    StrPCopy( DirectorioActual, DirectorioTrabajo );
    FillChar( InformacionInicial, Sizeof( InformacionInicial ), #0 );
    InformacionInicial.cb := Sizeof( InformacionInicial );
    InformacionInicial.dwFlags := STARTF_USESHOWWINDOW;
    InformacionInicial.wShowWindow := Visibilidad;
    CreateProcess( nil, sAplicacion, nil, nil, False,CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS,                 nil, nil, InformacionInicial, InformacionProceso );

    repeat    iCodigoSalida := WaitForSingleObject( InformacionProceso.hProcess, 1000 );
      Application.ProcessMessages;
    until ( iCodigoSalida <> WAIT_TIMEOUT );

    GetExitCodeProcess( InformacionProceso.hProcess, iResultado );
    MessageBeep( 0 );
    CloseHandle( InformacionProceso.hProcess );
    Result := iResultado;
  end;

Var
  NEmisora : TNodo;
  i : integer;
  Tpdf : TTable;
  PathArchivo : String;
begin
  if (DirectoryListBox1.Directory = '') then
  begin
    ShowMessage('No ha seleccionado un directorio temporal');
    exit;
  end;

  Tpdf := TTable.Create(Self);
  Tpdf.DatabaseName := Objeto.DataBaseName;
  Tpdf.SessionName  := Objeto.SessionName;
  Tpdf.TableName    := 'SI_CARGA_PDF';
  Tpdf.Active       := True;

  NEmisora := TNodo.Create;

  for i := 0 to ListView1.Items.Count-1 do
  begin
    if ListView1.Items.Item[i].Checked then
    begin
      NEmisora := ListView1.Items.Item[i].Data;

      Try
        if Tpdf.Locate('SERIE;EMISORA;TIPO_VALOR',
                     VarArrayOf([NEmisora.SERIE, NEmisora.EMISORA, NEmisora.TIPO_VALOR]),
                     [loCaseInsensitive]) then
        begin
           PathArchivo := DirectoryListBox1.Directory +  '\' +
                          NEmisora.EMISORA +
                          NEmisora.SERIE + '.pdf';
           if FileExists(PathArchivo) then
             DeleteFile(PathArchivo);

           if EjecutarYEsperar('java -jar c:\temp\DownloadFile.jar "C:\temp" ' +
                                NEmisora.EMISORA + ' ' + NEmisora.SERIE + ' ' +
                                NEmisora.TIPO_VALOR, SW_HIDE ) <> 0 then
             ShowMessage('Impresión no terminada correctamente ' +
                          NEmisora.EMISORA + ' ' + NEmisora.SERIE + ' ' +
                                NEmisora.TIPO_VALOR);


{           TBlobField(Tpdf.FieldByName('PDF')).SaveToFile(PathArchivo);
           ShellExecute(Self.Handle, 'print', PChar(PathArchivo),
                                                nil, nil, SW_HIDE);}
         end
         else begin
            ShowMessage('No existe información de esa Emisora');
         end;
      Finally

      end;
     end;     { if }
  end; { for }
  Tpdf.Free;
 // NEmisora.Free;
end;


procedure TWCarPdfImp.DirectoryListBox1Change(Sender: TObject);
begin
  edDirectorio.Text := DirectoryListBox1.Directory;
end;

end.



