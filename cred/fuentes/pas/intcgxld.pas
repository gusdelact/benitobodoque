unit IntCgXLd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type

  TCgBaseXLSLoader = class(TComponent)
  private
    FList : TList;
    FFileName: string;
    FExcelVariant: variant;
    FListErrores: TList;
    procedure SetFileName(const Value: string);
    procedure SetExcelVariant(const Value: variant);
  public
    property List : TList read FList write FList;
    property ListErrores : TList read FListErrores write FListErrores;
    property FileName : string read FFileName write SetFileName;
    property ExcelVariant : variant read FExcelVariant write SetExcelVariant;
    procedure CargaArchivoXLS; virtual; abstract;
    procedure DescargaArchivo;
    procedure MuestraHojadeErrores;
    procedure InsertaErroresenArchivo; virtual; abstract;
    procedure OpenWorkBook(S :string; pVisible : boolean);
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;


implementation

uses
  IntCgMsg, ComObj;

{ TCgBaseXLSLoader }

constructor TCgBaseXLSLoader.Create;
begin
  inherited;
  FList := TList.Create;
  FListErrores := TList.Create;
end;

procedure TCgBaseXLSLoader.DescargaArchivo;
var
  V : variant;
begin
  if not varisempty(FExcelVariant) then
  begin
    V := FExcelVariant;
    V.Workbooks[1].Saved := True;
    V.Workbooks[1].Close;
    V.Quit;
    VarClear(FExcelVariant);
  end;
end;

destructor TCgBaseXLSLoader.Destroy;
begin
  FList.Free;
  FListErrores.Free;
  inherited;
end;

procedure TCgBaseXLSLoader.MuestraHojadeErrores;
var
  vlV : variant;
begin
  vlV := ExcelVariant;
  vlV.Sheets['Datos con Errores'].Visible := True;
  vlV.Sheets['Datos con Errores'].Select;
  vlV.Cells.Select;
  vlV.Selection.ClearContents;
  vlV.Sheets['Datos de Carga'].Select;
  vlV.Rows['1:1'].Select;
  vlV.Selection.Copy;
  vlV.Sheets['Datos con Errores'].Select;
  vlV.Rows['1:1'].Select;
  vlV.ActiveSheet.Paste;
  vlV.Range['J1'].Select;
  vlV.Application.CutCopyMode := False;
  vlV.ActiveCell.FormulaR1C1 := 'Errores';
  vlV.Range['A1:J1'].Select;
end;

procedure TCgBaseXLSLoader.OpenWorkBook(S: string; pVisible : boolean);
begin
  FFileName := S;
  if pVisible then
  begin
    try
      FExcelVariant := CreateOleObject('Excel.Application');
      FExcelVariant.Visible := True;

      FExcelVariant.Workbooks.Open(FFileName);
      VarClear(FExcelVariant);
    except
      on E : Exception do
      begin
        ShowMessage('Error al inicializar Microsoft Excel');
      end;
    end;
  end
  else
  begin
    try
      FExcelVariant := GetActiveOleObject('Excel.Application');
    except
      on E : Exception do
      begin
        try
          FExcelVariant := CreateOleObject('Excel.Application');
        except
          on E : Exception do
          begin
            ShowMessage('Error al inicializar Microsoft Excel');
          end;
        end;
      end;
    end;
    FExcelVariant.Visible := False;
    FExcelVariant.Workbooks.Open(FFileName);
  end;
end;

procedure TCgBaseXLSLoader.SetExcelVariant(const Value: variant);
begin
  FExcelVariant := Value;
end;

procedure TCgBaseXLSLoader.SetFileName(const Value: string);
begin
  FFileName := Value;
  ShowCgMsg('Leyendo archivo de carga');
end;


end.
