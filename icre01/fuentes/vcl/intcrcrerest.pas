 // Sistema         : Clase de CrCreRest
 // Fecha de Inicio : 23/11/2009
 // Función forma   : Clase de CrCreRest
 // Desarrollo por  : MACV. Class Maker.
 // Diseñado por    : HEGC. Claudia Hernandez Gonzalez
 // Comentarios     : Consulta de Plazo Residual
unit IntCrCreRest;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm, DB, DBTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntParamCre,
  IntCrAcredit, IntCrCredito, IntFind, UnSQL2, InterFun, ComCtrls, IntDtPk,
  IntSGCtrl, IntGenCre, Grids, DBGrids, ComObj,
  IntXls, Spin;

type
  TCrCreRest = class;

  TWCrCreRest = class(TForm)
    InterForma1:     TInterForma;
    qryCreditosRestringidos: TQuery;
    dsCredRest: TDataSource;
    sdCredRest: TSaveDialog;
    Panel1: TPanel;
    bbCredRest: TBitBtn;
    Label3: TLabel;
    dtpFechaCierre: TDateTimePicker;
    dbgCredRest: TDBGrid;
    Label4: TLabel;
    edArchivoCredRest: TEdit;
    ProgressBar1: TProgressBar;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    bArchivoCredRest: TButton;
    bbGenArchivoCredRest: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure HabilitaControlesCredRest(pebHabilita: boolean);
    function GeneraArchivoExceCredRest(peFileName: string): boolean;
    procedure bbCredRestClick(Sender: TObject);
    procedure bbGenArchivoCredRestClick(Sender: TObject);
    procedure bArchivoCredRestClick(Sender: TObject);
  private
    procedure MuestraDatosCredRest(pAnio, PMes: string);
    { Private declarations }
  public
    { Public declarations }
    Objeto: TCrCreRest;
  end;

  TCrCreRest = class(TInterFrame)
  private
  protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
  public
    { Public declarations }
    F_CIERRE: TInterCampo;

    ParamCre:   TParamCre;
    CrCredito:  TCrCredito;
    Acreditado: TCrAcredit;

    function InternalBusca: boolean; override;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function ShowWindow(FormaTipo: TFormaTipo): integer; override;
    function Reporte: boolean; override;
  published
  end;



implementation

{$R *.DFM}


constructor TCrCreRest.Create(AOwner: TComponent);
begin
  inherited;
  StpName  := ' ';
  UseQuery := False;
  HelpFile := 'IntCrCreRest.Hlp';
  ShowMenuReporte := True;
end;

destructor TCrCreRest.Destroy;
begin
  inherited;
end;


function TCrCreRest.ShowWindow(FormaTipo: TFormaTipo): integer;
var
  W: TWCrCreRest;
begin
  W := TWCrCreRest.Create(Self);
  try
    W.Objeto := Self;
    W.InterForma1.InterFrame := Self;
    W.InterForma1.FormaTipo := ftConsulta; //FIJA EL TIPO DE FORMA
    W.InterForma1.ShowGrid := False;
    W.InterForma1.ShowNavigator := False;
    W.InterForma1.Funcion := FInterFun;
    W.InterForma1.ShowModal;
    ShowWindow := W.InterForma1.ModalResult;
  finally
    W.Free;
  end;
end;


function TCrCreRest.InternalBusca: boolean;
var
  T: TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('ICrCreRestit', '');
  try
    if Active then
    begin
    end;
    if T.Execute then
      InternalBusca := FindKey([]);
  finally
    T.Free;
  end;
end;

function TCrCreRest.Reporte: boolean;
begin //Execute_Reporte();
end;


procedure TWCrCreRest.FormShow(Sender: TObject);
begin
  with Objeto do
  begin
    lbDempresa.Caption := ParamCre.EMPRESA.AsString;
    lbDfecha.Caption  := ParamCre.FECHA.AsString;
    lbDUsuario.Caption := ParamCre.USUARIO.AsString;
    lbDPerfil.Caption := ParamCre.PERFIL.AsString;
  end;
  dtpFechaCierre.DateTime := DameFinMes(Objeto.Apli.DameFechaEmpresaDia('D000'));
end;

procedure TWCrCreRest.FormDestroy(Sender: TObject);
begin
  //Objeto
end;

procedure TWCrCreRest.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryCreditosRestringidos.Close;
  Action := caFree;

end;




procedure TWCrCreRest.MuestraDatosCredRest(pAnio, PMes: string);
var
  vlQry: TQuery;
  sSQL, vlFiltro: string;

  qyQuery: TQuery;
  sSQLDia: string;
begin
  vlFiltro := '';

  sSQL := '  ';

  //Saldos al Corte
  sSQL :=
    ' select   * ' +coCRLF+
    ' from     (select   ''PESOS'' as moneda, ' +coCRLF+
    '                    ccac.cve_cat_minimo as catalogominimo, ' +coCRLF+
    '                    sum (ccas.imp_cap_vig) as SaldoVigente, ' +coCRLF+
    '                    sum (ccas.imp_cap_imp) as SaldoImpagado, ' +coCRLF+
    '                    sum (ccas.imp_cap_vdo_ex + ccas.imp_cap_vdo_ne) as SaldoVencido, ' +coCRLF+
    '                    sum (ccas.imp_int_vig) as InteresVigente, ' +coCRLF+
    '                    sum (ccas.imp_int_imp) as InteresImpagado, ' +coCRLF+
    '                    sum (ccas.imp_int_vdo_ex) as InteresVencido, ' +coCRLF+
    '                    sum (nvl(ccas.imp_int_cob_ant,0) ) as IntPagxAnt ' +coCRLF+
    '           from     cr_con_adeu_cltv ccac, ' +coCRLF+
    ' 									 cr_con_adeudo_sdo ccas, ' +coCRLF+
    ' 									 cr_credito cc, ' +coCRLF+
    ' 									 cr_producto cp ' +coCRLF+
    '           where    ccas.id_credito = ccac.id_credito ' +coCRLF+
    ' 					and			 ccas.id_credito = cc.id_credito ' +coCRLF+
    ' 					and			 ccac.cve_producto_cre = cp.cve_producto_cre ' +coCRLF+
    ' 					and			 cp.cve_tipo_cartera = ''BANCAR'' ' +coCRLF+
    ' 					and			 ccac.id_reg_vigente = 1 ' +coCRLF+
    ' 					and			 ccac.cve_moneda = 484 ' +coCRLF+
    ' 					and			 cc.f_restringido is not null ' +coCRLF+
    ' 					and			 cc.f_restringido <= ' + SQLFecha(dtpFechaCierre.Date) +coCRLF+
    ' 					and			 ccas.f_cierre = ' + SQLFecha(dtpFechaCierre.Date) +coCRLF+
    '           group by cve_cat_minimo ' +coCRLF+
    '           union all ' +coCRLF+
    '           select   ''DOLARES'' as moneda, ' +coCRLF+
    '                    ccac.cve_cat_minimo as catalogominimo, ' +coCRLF+
    '                    sum (ccas.imp_cap_vig) as SaldoVigente, ' +coCRLF+
    '                    sum (ccas.imp_cap_imp) as SaldoImpagado, ' +coCRLF+
    '                    sum (ccas.imp_cap_vdo_ex + ccas.imp_cap_vdo_ne) as SaldoVencido, ' +coCRLF+
    '                    sum (ccas.imp_int_vig) as InteresVigente, ' +coCRLF+
    '                    sum (ccas.imp_int_imp) as InteresImpagado, ' +coCRLF+
    '                    sum (ccas.imp_int_vdo_ex) as InteresVencido, ' +coCRLF+
    '                    sum (ccas.imp_int_cob_ant ) as IntPagxAnt ' +coCRLF+
    '           from     cr_con_adeu_cltv ccac, ' +coCRLF+
    ' 									 cr_con_adeudo_sdo ccas, ' +coCRLF+
    ' 									 cr_credito cc, ' +coCRLF+
    ' 									 cr_producto cp ' +coCRLF+
    '           where    ccas.id_credito = ccac.id_credito ' +coCRLF+
    ' 					and			 ccas.id_credito = cc.id_credito ' +coCRLF+
    ' 					and			 ccac.cve_producto_cre = cp.cve_producto_cre ' +coCRLF+
    ' 					and			 cp.cve_tipo_cartera = ''BANCAR'' ' +coCRLF+
    ' 					and			 ccac.id_reg_vigente = 1 ' +coCRLF+
    ' 					and			 ccac.cve_moneda = 840 ' +coCRLF+
    ' 					and			 cc.f_restringido is not null ' +coCRLF+
    ' 					and			 cc.f_restringido <= ' + SQLFecha(dtpFechaCierre.Date) +coCRLF+
    ' 					and			 ccas.f_cierre = ' + SQLFecha(dtpFechaCierre.Date) +coCRLF+
    '           group by cve_cat_minimo ' +coCRLF+
    '           ) ' +coCRLF+
    ' order by moneda, ' +coCRLF+
    '          catalogominimo ';

  if qryCreditosRestringidos.Active then
    qryCreditosRestringidos.Close;
  with qryCreditosRestringidos do
    try
      SQL.Clear;
      SQL.Add(sSQL);

      SQL.SaveToFile('c:\CreditosRestringidos.txt');

      DatabaseName := Objeto.Apli.DatabaseName;
      SessionName  := Objeto.Apli.SessionName;
      Open;
    finally
    end;
end;

procedure TWCrCreRest.HabilitaControlesCredRest(pebHabilita: boolean);
begin
  dtpFechaCierre.Enabled := pebHabilita;
  bbCredRest.Enabled := pebHabilita;
  dsCredRest.Enabled := pebHabilita;
  edArchivoCredRest.Enabled := pebHabilita;
  bArchivoCredRest.Enabled := pebHabilita;
  bbGenArchivoCredRest.Enabled := pebHabilita;
end;

function TWCrCreRest.GeneraArchivoExceCredRest(peFileName: string): boolean;
var
  vlRange:  variant;
  vlCol, vlRow: integer;
  vlExcelApp: olevariant;
  vlColumnRange: variant;
  VLSalida: boolean;
begin

  Result := False;
  ProgressBar1.Min := 0;
  ProgressBar1.Position := 0;
  VLSalida := False;

  if not qryCreditosRestringidos.Active then
    Exit;

  vlExcelApp := CreateOleObject('Excel.Application');
  try
    vlExcelApp.Workbooks.Add;
    //----------------------------------
    // INICIA COLOCACIÓN DE ENCABEZADOS
    vlRow := 1;

    // Coloca el tipo de fuente a 8     y los titulos de las columnas
    vlColumnRange := vlExcelApp.Workbooks[1].WorkSheets[1].Columns;
    for vlCol := 0 to dbgCredRest.DataSource.DataSet.FieldCount - 1 do
    begin
      vlColumnRange.Columns[vlCol + 1].Font.Size := 8;
      vlExcelApp.Cells[1, vlCol + 1].Value :=
        dbgCredRest.DataSource.DataSet.fields[vlCol].FullName;
    end;

    //----------------------------------
    // INICIA EL LLENADO DE DATOS HACIA
    // EL ARCHIVO DE EXCEL
    ProgressBar1.Max := dbgCredRest.DataSource.DataSet.RecordCount;
    dbgCredRest.DataSource.DataSet.First;

    vlRow := 2;
    while not dbgCredRest.DataSource.DataSet.EOF do
    begin
      for vlCol := 0 to dbgCredRest.DataSource.DataSet.FieldCount - 1 do
      begin
        vlExcelApp.Cells[vlRow, vlCol + 1].Value :=
          dbgCredRest.datasource.dataset.fields[vlcol].AsString;
        Application.ProcessMessages;
      end;
      Application.ProcessMessages;
      Inc(vlRow);
      ProgressBar1.Position := vlRow;
      dbgCredRest.DataSource.DataSet.Next;
    end;

    VLSalida := True;

    //-----------------------------------------------
    //         INICIA FORMATOS DE CELDAS
    //-----------------------------------------------



    // Modifica el tamaño de la fuente
    vlColumnRange := vlExcelApp.Workbooks[1].WorkSheets[1].Columns;
    for vlCol := 1 to dbgCredRest.DataSource.DataSet.FieldCount - 1 do
    begin
      vlColumnRange.Columns[vlCol].Font.Size := 8;
    end;

    // Colocación de colores de banda de titulos
    vlRange := vlExcelApp.Workbooks[1].WorkSheets[1].Range['A1:' +
      IntToColumnXlS(vlCol) + '1'];
    vlRange.Font.FontStyle := 'Bold';
    vlRange.Font.Color := clWhite;
    vlRange.Columns.Interior.ColorIndex := 1; // Negro
    vlRange.WrapText := True;


    for vlCol := 1 to dbgCredRest.DataSource.DataSet.FieldCount - 1 do
    begin
      vlRange := vlExcelApp.Workbooks[1].WorkSheets[1].Range[
        IntToColumnXlS(vlCol) + '1:' + IntToColumnXlS(vlCol) + '1'];
      vlRange.WrapText := True;
    end;

    vlRange := vlExcelApp.Workbooks[1].WorkSheets[1].Range['B1:B'+IntToStr(vlRow-1)];
    vlRange.NumberFormat := '0';
    vlRange := vlExcelApp.Workbooks[1].WorkSheets[1].Range['C1:I'+IntToStr(vlRow-1)];
    vlRange.NumberFormat := '#,##0.00';


  finally
    HabilitaControlesCredRest(True);
    vlExcelApp.ActiveWorkBook.SaveAs(peFileName);
    if CloseExcelFile(vlExcelApp) then
      ShowMessage('Archivo Generado')
    else
      ShowMessage('Archio no generado');
  end;

  GeneraArchivoExceCredRest := VLSalida;
end;

procedure TWCrCreRest.bbCredRestClick(Sender: TObject);
var
  sanio, smes: string;
begin
  DateTimeToString(sanio, 'yyyy', DameFinMes(dtpFechaCierre.DateTime));
  DateTimeToString(smes, 'MM', DameFinMes(dtpFechaCierre.DateTime));
  MuestraDatosCredRest(sanio, smes);
end;

procedure TWCrCreRest.bbGenArchivoCredRestClick(Sender: TObject);
begin
  if not qryCreditosRestringidos.Active then
  begin
    MessageDlg('No existe información del  ' +
      FormatDateTime('DD/MM/YYYY', dtpFechaCierre.DateTime),
      mtWarning, [mbOK], 0);
    Exit;
  end
  else if (Trim(ExtractFileName(edArchivoCredRest.Text)) = '') then
  begin
    MessageDlg('Debe de indicar primero el nombre del archivo en donde desea guardar la información.',
      mtWarning, [mbOK], 0);
    Exit;
  end
  else if (LowerCase(Trim(ExtractFileExt(edArchivoCredRest.Text))) <> '.xls') then
  begin
    edArchivoCredRest.Text := edArchivoCredRest.Text + '.xls';
  end;

  HabilitaControlesCredRest(False);
  try
    GeneraArchivoExceCredRest(edArchivoCredRest.Text);
  except
    ShowMessage('Proceso concluido');
  end;
  HabilitaControlesCredRest(True);
end;

procedure TWCrCreRest.bArchivoCredRestClick(Sender: TObject);
begin
  If sdCredRest.Execute Then
    edArchivoCredRest.Text := sdCredRest.FileName;
end;

end.
