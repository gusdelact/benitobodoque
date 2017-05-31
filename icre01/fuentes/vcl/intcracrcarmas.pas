unit IntCrAcrCarMas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBTables, Db, Grids, Aligrid, DBGrids, StdCtrls, Buttons, jpeg,
  Menus, ImgList, comObj;

type
  RecField = record
    Column:   string;
    Desc:     string;
    DataType: string;
  end;

  ListFields = array of RecField;

  TFormCarMas = class(TForm)
    gbCargaDatos: TGroupBox;
    Label40: TLabel;
    labTitulo: TLabel;
    IcoExcel: TImage;
    ImgCheck: TImage;
    LabCheck: TLabel;
    ImgReload: TImage;
    LabReload: TLabel;
    edArchivoExcel: TEdit;
    bBuscarArchivo: TBitBtn;
    btCargaExcel: TBitBtn;
    DBGrid: TDBGrid;
    SagDatos: TStringAlignGrid;
    btCancelar: TBitBtn;
    dsEstados: TDataSource;
    spAgrega_Detalle: TStoredProc;
    qValidaEstadosMun: TQuery;
    QActualMetodologia: TQuery;
    pmCarga: TPopupMenu;
    CargadearchivoExcel1: TMenuItem;
    ImageList: TImageList;
    OpenXLS: TOpenDialog;
    btSalir: TBitBtn;
    Log: TMemo;
    btnGenerarEstructura: TBitBtn;
    rgCampos: TRadioGroup;
    SaveXLS: TSaveDialog;
    procedure bBuscarArchivoClick(Sender: TObject);
    procedure btCargaExcelClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure CargadearchivoExcel1Click(Sender: TObject);
    procedure SagDatosDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure btSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnGenerarEstructuraClick(Sender: TObject);
  private
    { Private declarations }
    Fields: ListFields;
    Tabla, Campos: string;
    procedure CargaDBGrid;
    procedure AbrirXLS (FileName: string);
  public
    { Public declarations }
    DatabaseName, SessionName, Metodologia, Usuario : String;
  end;

var
  FormCarMas: TFormCarMas;

implementation

{$R *.DFM}

function TryStrToInt (S: string; var n: integer): boolean;
var
  e: integer;
begin
  Val (s, n, e);

  result := e = 0;
end;

function InRange (v, li, ls: integer): boolean;
begin
  result := (v >= li) and (v <= ls);
end;

function IsValidDate(const S: string): boolean;
var
  y, m, d: Integer;
const
  DAYS_OF_MONTH: array[1..12] of integer = (31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
begin
  result := false;
  if length(S) <> 10 then Exit;

  if (S[3] <> '/') or (S[6] <> '/') then Exit;

  if not TryStrToInt(Copy(S, 7, 4), y) then Exit;
  if not TryStrToInt(Copy(S, 4, 2), m) then Exit;
  if not InRange(m, 1, 12) then Exit;
  if not TryStrToInt(Copy(S, 1, 2), d) then Exit;
  if not InRange(d, 1, DAYS_OF_MONTH[m]) then Exit;
  if (not IsLeapYear(y)) and (m = 2) and (d = 29) then Exit;
  result := true;
end;

function StringToDate (s: string): TDateTime;
var
  Day, Month, Year: word;
begin
  Day    := StrToInt (Copy (s, 1, 2));
  Month  := StrToInt (Copy (s, 4, 2));
  Year   := StrToInt (Copy (s, 7, 5));
  result := EncodeDate (Year, Month, Day);
end;

procedure TFormCarMas.FormShow(Sender: TObject);
begin
  //Anexo 18-A (Metodologia = 6) se maneja igual que Anexo 18 (Metodología 3)
  if Metodologia = '6' then
    Metodologia := '3';

  CargaDBGrid;
  DbGrid.Refresh;
end;

procedure TFormCarMas.btSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFormCarMas.AbrirXLS (FileName: string);
var
  XLApp, Range, Sheet: Variant;
  r, c, Rows, Cols: integer;
  Query: TQuery;
begin
  edArchivoExcel.Text := FileName;

  //Crea un objeto de Excel y abre el archivo
  XLApp  := CreateOleObject('Excel.Application');
  try
    XLApp.WorkBooks.Open(FileName);

    //Determina el número total de registros que vienen en el archivo Excel
    Range := XLApp.WorkBooks[1].Worksheets[1].UsedRange;
    Sheet := XLApp.WorkBooks[1].Worksheets[1];
    Rows  := Range.Rows.Count;
    Cols  := Range.Columns.Count;

    //Determina el tamaño del Grid que se presenta
    sagDatos.RowCount := Rows;
    sagDatos.ColCount := Cols + 1;
    SagDatos.Visible  := False;

   //Recorre el archivo en excel para insertar los datos en el Grid
   for r := 1 to Rows do
     for c := 1 to Cols do
       sagDatos.Cells [c, r - 1] := Sheet.Cells [r, c];

   Query := TQuery.Create (Self);
   try
      Query.Close;
      Query.DatabaseName := DatabaseName;
      Query.SessionName  := SessionName;
      Query.SQL.Clear;
      Query.SQL.Add ('Select Count (*) Existe');
      Query.SQL.Add ('  From ' + Tabla);
      Query.SQL.Add (' Where ID_Acreditado = :ID_Acreditado');

      for r := 1 to Rows do
      begin
        Query.Close;
        Query.ParamByName ('ID_Acreditado').AsString := sagDatos.Cells [1, r];
        Query.Open;

        if Query.FieldByName ('Existe').AsInteger > 0 then
        begin
          SagDatos.ColorCell [1, r] := clInactiveCaption;
          SagDatos.Cells     [0, r] := '1';
        end;
      end;
   finally
     Query.Free;
   end;

  finally
    XLApp.Quit;

    //Desasignar las variables del Archivo Excel
    XLApp := Unassigned;
    Range := Unassigned;
    Sheet := Unassigned;

    btCargaExcel.Enabled := True;
    btCancelar.Enabled   := True;
    DbGrid.Visible       := False;
    SagDatos.Visible     := True;
    LabTitulo.Caption    := 'Datos del Archivo Excel';
    IcoExcel.Visible     := True;
    ImgCheck.Visible     := True;
    ImgReload.Visible    := True;
    LabCheck.Visible     := True;
    LabReload.Visible   := True;
  end;
end;

procedure TFormCarMas.bBuscarArchivoClick(Sender: TObject);
begin
  if OpenXLS.Execute then
  begin
    Cursor := crHourGlass;
    try
      AbrirXLS (OpenXLS.FileName);
      Cursor := crDefault;
    finally
      Cursor := crDefault;
    end;
  end;
end;

procedure TFormCarMas.SagDatosDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  Bmp: TBitmap;
begin
  with (Sender As TStringAlignGrid) Do
  begin
    //Iconos par ver de que tipo es la transaccion
    if (ACol = 0) and (ARow > 0) then
    begin
      Bmp := TBitmap.Create;
      if Assigned(Bmp) then
      begin
        // Determina la imagen a utilizar
        if  Cells [0, ARow] = '1' then
          ImageList.GetBitmap (Ord (1), Bmp)
        else
          ImageList.GetBitmap (Ord (0), Bmp);

        Canvas.FillRect(Classes.Rect (Rect.Left - 2, Rect.Top - 2, Rect.Right + 2, Rect.Bottom + 2));
        Bmp.Transparent := True;
        Canvas.Draw (Rect.Left + ((Rect.Right - Rect.Left - Bmp.Width) div 2), Rect.Top, Bmp);
        Canvas.Brush.Color := Color;
        Bmp.FreeImage;
        Bmp.Free;
      end;
    end;
  end;
end;

procedure TFormCarMas.CargaDBGrid;
var
  Query: TQuery;
begin
  Tabla  := '';
  Campos := '';

  QActualMetodologia.Close;
  QActualMetodologia.DatabaseName := DatabaseName;
  QActualMetodologia.SessionName  := SessionName;

  spAgrega_Detalle.Close;
  spAgrega_Detalle.DatabaseName   := DatabaseName;
  spAgrega_Detalle.SessionName    := SessionName;
  spAgrega_Detalle.StoredProcName := '';

  Query := TQuery.Create (Self);
  try
    Query.DatabaseName := DatabaseName;
    Query.SessionName  := SessionName;

    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add ('Select Tabla_Vigente, Paquete, Proc_Alta');
    Query.SQL.Add ('  From CR_Per_Metodologias');
    Query.SQL.Add (' Where Cve_Metodologia = :CveMet');
    Query.ParamByName ('CveMet').AsString := Metodologia;
    Query.Open;

    if Query.Eof then exit;
    Tabla                           := Query.FieldByName ('Tabla_Vigente').AsString;
    spAgrega_Detalle.StoredProcName := 'SISTEMAS.' + Query.FieldByName ('Paquete').AsString + '.' + Query.FieldByName ('Proc_Alta').AsString;

    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add ('Select VM.Variable, Upper (Var.Tipo_Dato) Tipo_Dato, Desc_Variable');
    Query.SQL.Add ('  From CR_Per_Vars_X_Met    VM');
    Query.SQL.Add ('  Join CR_Per_Variables_Met Var On VM.Variable = Var.Variable');
    Query.SQL.Add (' Where VM.Cve_Metodologia = :CveMet');
    Query.SQL.Add (' Order By VM.Orden');
    Query.ParamByName ('CveMet').AsString := Metodologia;
    Query.Open;

    Campos := '';
    SetLength (Fields, 0);

    while not Query.Eof do
    begin
      SetLength (Fields, Length (Fields) + 1);
      Fields [Length (Fields) - 1].Column   := Query.FieldByName ('Variable').AsString;
      Fields [Length (Fields) - 1].DataType := Query.FieldByName ('Tipo_Dato').AsString;
      Fields [Length (Fields) - 1].Desc     := Query.FieldByName ('Desc_Variable').AsString;

      Campos := Campos + Query.FieldByName ('Variable').AsString + ', ';

      Query.Next;
    end;

    if Campos = '' then exit;
    Delete (Campos, Length (Campos) - 1, 2);

    QActualMetodologia.Close;
    QActualMetodologia.SQL.Clear;
    QActualMetodologia.SQL.Add ('Select ' + Campos);
    QActualMetodologia.SQL.Add ('  From ' + Tabla);
    QActualMetodologia.SQL.Add (' Order By 1');
    QActualMetodologia.Open;
  finally
    Query.Free;
  end;
end;

procedure TFormCarMas.btCancelarClick(Sender: TObject);
begin
  SagDatos.Visible  := False;
  IcoExcel.Visible  := False;
  LabTitulo.Caption := 'Información Vigente';
  SagDatos.Refresh;
  FormShow(Self);
  DbGrid.Visible       := True;
  edArchivoExcel.Text  := '';
  ImgCheck.Visible     := False;
  ImgReload.Visible    := False;
  LabCheck.Visible     := False;
  LabReload.Visible    := False;
  btCargaExcel.Enabled := False;
  btCancelar.Enabled   := False;
end;

procedure TFormCarMas.CargadearchivoExcel1Click(Sender: TObject);
begin
  bBuscarArchivoClick(Self);
end;

procedure TFormCarMas.btCargaExcelClick(Sender: TObject);
var
  r, c: integer;
  Campo: string;
  Errores: boolean;
begin
  if (Length (Fields) = 0) or (spAgrega_Detalle.StoredProcName = '') or
     (spAgrega_Detalle.DatabaseName = '') or (spAgrega_Detalle.SessionName = '') then exit;

  Log.Clear;
  Errores := False;

  for r := 1 to sagDatos.RowCount - 1 do
  begin
    spAgrega_Detalle.Close;
    spAgrega_Detalle.Params.Clear;

    spAgrega_Detalle.Params.CreateParam(ftString,  'peCve_Usu_Alta',    ptInput);
    spAgrega_Detalle.Params.CreateParam(ftDate,    'peF_Vigente_Desde', ptInput);

    spAgrega_Detalle.ParamByName ('peCve_Usu_Alta').AsString := Usuario;
    spAgrega_Detalle.ParamByName ('peF_Vigente_Desde').Clear;

    for c := 1 to sagDatos.ColCount - 1 do
    begin
      Campo := 'pe' + Fields [c - 1].Column;

      if      Fields [c - 1].DataType = 'DATE' then
      begin
        spAgrega_Detalle.Params.CreateParam(ftDate, Campo, ptInput);
        if sagDatos.Cells [c, r] <> '' then
          spAgrega_Detalle.ParamByName (Campo).AsDate := StringToDate (sagDatos.Cells [c, r]);
      end
      else if Fields [c - 1].DataType = 'FLOAT' then
      begin
        spAgrega_Detalle.Params.CreateParam(ftFloat, Campo, ptInput);
        if sagDatos.Cells [c, r] <> '' then
          spAgrega_Detalle.ParamByName (Campo).AsString := sagDatos.Cells [c, r];
      end
      else if Fields [c - 1].DataType = 'INTEGER' then
      begin
        spAgrega_Detalle.Params.CreateParam(ftInteger, Campo, ptInput);
        if sagDatos.Cells [c, r] <> '' then
          spAgrega_Detalle.ParamByName (Campo).AsString := sagDatos.Cells [c, r];
      end;
    end;
    spAgrega_Detalle.Params.CreateParam(ftInteger, 'psError',    ptOutput);
    spAgrega_Detalle.Params.CreateParam(ftString,  'psMsgError', ptOutput);

    spAgrega_Detalle.Prepare;
    spAgrega_Detalle.ExecProc;

    if spAgrega_Detalle.ParamByName ('psError').AsInteger <> 0 then
    begin
      Errores := True;

      Log.Lines.Add ('---------------------------------------------------------------');
      Log.Lines.Add (spAgrega_Detalle.ParamByName ('psMsgError').AsString);
      Log.Lines.Add ('');
    end;
  end;

  if Errores then
    MessageDlg ('La información presentó errores para guardarse en base de datos. Favor de contactar al departamento de sistemas.', mtError, [mbOk], 0)
  else
  begin
    Log.Lines.Add ('---------------------------------------------------------------');
    Log.Lines.Add ('Proceso concluido');
    Log.Lines.Add ('');

    MessageDlg ('Información salvada exitosamente!', mtInformation, [mbOk], 0);

    SagDatos.Visible     := False;
    IcoExcel.Visible     := False;
    btCargaExcel.Enabled := False;
    btCancelar.Enabled   := False;
    edArchivoExcel.Text  := '';
    LabTitulo.Caption    := 'Información Vigente';
    DbGrid.Visible       := True;

    CargaDBGrid;
    DbGrid.Refresh;
  end;

 ImgCheck.Visible  := False;
 ImgReload.Visible := False;
 LabCheck.Visible  := False;
 LabReload.Visible := False;
end;

procedure TFormCarMas.FormCreate(Sender: TObject);
begin
  SetLength (Fields, 0);
end;

procedure TFormCarMas.FormDestroy(Sender: TObject);
begin
  Finalize (Fields);
end;

procedure TFormCarMas.btnGenerarEstructuraClick(Sender: TObject);
const
  xlWBatWorkSheet       = -4167;

var
  XLApp, XLSheet: Variant;
  i: integer;
begin
  if SaveXLS.Execute then
  begin
    XLApp := CreateOleObject('Excel.Application');
    try
      Cursor              := crHourGlass;
      XLApp.Visible       := False;
      XLApp.DisplayAlerts := False;
      XLApp.Workbooks.Add(xlWBatWorkSheet);

      XLSheet := XLApp.Workbooks[1].WorkSheets[1];
      for i := 0 to Length (Fields) - 1 do
      begin
        if rgCampos.ItemIndex = 0 then
          XLSheet.Cells [1, i + 1].Formula := Fields [i].Column
        else
          XLSheet.Cells [1, i + 1].Formula := Fields [i].Desc;
      end;
      XLSheet.Columns.Autofit;
    finally
      Cursor := crArrow;
      XLApp.Workbooks[1].SaveAs (SaveXLS.FileName);
      if MessageDlg ('Exportación exitosa. Deseas abrir el archivo?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        XLApp.Visible := True
      else
        XLApp.Quit;

      XLSheet  := Unassigned;
      XLApp    := Unassigned;
    end;
  end;
end;

end.

