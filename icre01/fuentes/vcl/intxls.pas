unit IntXls;

interface

uses Messages, SysUtils, Dialogs, ComObj;

const
  // SheetType
  xlChart = -4109;
  xlWorksheet = -4167;
  // WBATemplate
  xlWBATWorksheet = -4167;
  xlWBATChart = -4109;
  // Page Setup
  xlPortrait = 1;
  xlLandscape = 2;
  xlPaperA4 = 9;
  // Format Cells
  xlBottom = -4107;
  xlLeft = -4131;
  xlRight = -4152;
  xlTop = -4160;
  // Text Alignment
  xlHAlignCenter = -4108;
  xlVAlignCenter = -4108;
  // Cell Borders
  xlThick = 4;
  xlThin = 2;

function ColumnXlS(pestrCol : String) : Integer;
function IntToColumnXlS(penCol : Integer) : String;
// procedure Delay1(ms :  Longword);

function OpenExcelFile(strFileName : String; var peExcelApp : OleVariant) : Boolean;
function CreateNewExcelFile(psNewSheetName : String; var peExcelApp : OleVariant) : Boolean;
function CloseExcelFile(peExcelApp : OleVariant) : Boolean;

function GetLastRow(peExcelApp : OleVariant; peColumn : Integer): Integer;

implementation

function OpenExcelFile(strFileName : String; var peExcelApp : OleVariant) : Boolean;
begin
  Result := False;
  If Not FileExists(strFileName) Then
   MessageDlg('No se encontró el archivo "'+strFileName+'"', mtError, [mbOk], 0);
  Try
    peExcelApp := GetActiveOleObject('Excel.Application');
  Except
    Try
      // If no instance of Word is running, try to Create a new Excel Object
      peExcelApp := CreateOleObject('Excel.Application');
    Except
      MessageDlg('No se encontro Excel ó Excel no se encuentra instalado? ', mtError, [mbOk], 0);
      Exit;
    End;
  End;
  // Open a Existing Workbook
  peExcelApp.Workbooks.Open(strFileName);
  Result := True;
end;

function CreateNewExcelFile(psNewSheetName : String; var peExcelApp : OleVariant) : Boolean;
begin
  Result := False;
  Try
    peExcelApp := GetActiveOleObject('Excel.Application');
  Except
    Try
      // If no instance of Word is running, try to Create a new Excel Object
      peExcelApp := CreateOleObject('Excel.Application');
    Except
      MessageDlg('No se encontro Excel ó Excel no se encuentra instalado? ', mtError, [mbOk], 0);
      Exit;
    End;
  End;
  // Agrega una nueva hoja de Cálculo
  peExcelApp.Workbooks.Add(xlWBatWorkSheet);
  // Rename the active Sheet
  peExcelApp.ActiveSheet.Name := psNewSheetName;
  // Rename
  peExcelApp.Workbooks[1].WorkSheets[1].Name := psNewSheetName;
  Result := True;
end;

function CloseExcelFile(peExcelApp : OleVariant) : Boolean;
begin
  Result := False;
  // Quit Excel
  if not VarIsEmpty(peExcelApp) then
  begin
   Try
    peExcelApp.DisplayAlerts := False;  // Discard unsaved files....
    peExcelApp.Quit;
    Result := True;
   Except
    MessageDlg('Problemas al Cerrar la Aplicación de Excel', mtError, [mbOk], 0);
   End;
  end;
end;

function GetLastRow(peExcelApp : OleVariant; peColumn : Integer): Integer;
const
  xlUp = 3;
begin
  Result := peExcelApp.Range[Char(96 + peColumn) + IntToStr(65536)].end[xlUp].Rows.Row;
end;

function ColumnXlS(pestrCol : String) : Integer;
const XLS_COL = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
var I, J, vlnCol : Integer;
begin
 I := 1; vlnCol := 0; pestrCol := UpperCase(pestrCol);
 For J := Length(pestrCol) DownTo 1 Do
  Begin
  vlnCol := vlnCol + (Pos(pestrCol[J],XLS_COL) * I);
  If (I = 1) Then
    I := Length(XLS_COL);
  End;
 Result := vlnCol;
end;

function IntToColumnXlS(penCol : Integer) : String;
const XLS_COL = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
var I, vlValor1, vlValor2 : Integer;
    vlStr : String;
begin
   I := penCol; vlStr := '';
   vlValor1 := I Div 27;
   If vlValor1 = 0 Then
     Begin
     vlValor2 := I Mod 27; If vlValor2 > 0 Then vlStr := vlStr + XLS_COL[vlValor2];
     End
   Else
     Begin
     vlValor2 := (I - (vlValor1 * 27)) + (vlValor1); If vlValor2 > 0 Then vlStr := vlStr + XLS_COL[vlValor1] + XLS_COL[vlValor2];
     End;
  Result := vlStr;
end;

{
procedure Delay1(ms :  Longword);
var
  TheTime : Longword;
begin
  TheTime := GetTickCount + ms;
 While GetTickCount < TheTime do
   Application.ProcessMessages;
end;
}

end.
