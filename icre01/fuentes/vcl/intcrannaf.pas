 // Sistema         : Clase de CrAnNaf
 // Fecha de Inicio : 05/08/2009
 // Función forma   : Clase de CrAnNaf
 // Desarrollo por  : MACV. Class Maker.
 // Diseñado por    : Manuel Romero Ibarra
 // Comentarios     :
unit IntCrannaf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm, DB, DBTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun, ComCtrls, IntDtPk, ComObj, IntXls,
  // Unidades Adicionales
  IntParamCre, Grids, DBGrids,
  COMMCTRL;

type
  TCrannaf = class;

  TWCrannaf = class(TForm)
    InterForma1:      TInterForma;
    PnDatos:          TPanel;
    lbEmpresa:        TLabel;
    lbUsuario:        TLabel;
    lbFecha:          TLabel;
    lbPerfil:         TLabel;
    lbDUsuario:       TLabel;
    lbDPerfil:        TLabel;
    lbDFecha:         TLabel;
    lbDEmpresa:       TLabel;
    lbFechaComplementaria: TLabel;
    dtpF_CIERRE:      TDateTimePicker;
    btMuestraDatos:   TBitBtn;
    DBGrid1:          TDBGrid;
    Label1:           TLabel;
    edFileNameXLS:    TEdit;
    btnSaveFileName:  TButton;
    btnGeneraArchivo: TButton;
    ProgressBar:      TProgressBar;
    rdAnexo:          TRadioGroup;
    btGeneraDatos:    TBitBtn;
    QryAnexo:         TQuery;
    dsrcAnexo:        TDataSource;
    SaveDialog:       TSaveDialog;
    bbConsultaAnexo9: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btMuestraDatosClick(Sender: TObject);
    procedure btGeneraDatosClick(Sender: TObject);
    procedure btnGeneraArchivoClick(Sender: TObject);
    procedure btnSaveFileNameClick(Sender: TObject);
    procedure bbConsultaAnexo9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Objeto: TCrannaf;

    function GeneraAnexo: boolean;

    procedure ConsultaAnexo8;
    procedure ConsultaAnexo9;

    function GenExcelAnexo8(peFileName: string): boolean;
    function GenExcelAnexo9(peFileName: string): boolean;

    procedure HabilitaControles(pebHabilita: boolean);

    // </ RABA > OCT 2011
    // SE AGREGA FUNCION PARA REVISAR SI EXISTE INFORMACIÓN DEL CIERRE
    function BuscaInformacion:boolean;
    // < RABA />
  end;

  TCrannaf = class(TInterFrame)
  private
  protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
  public
    { Public declarations }

    ParamCre: TParamCre;


    function InternalBusca: boolean; override;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function ShowWindow(FormaTipo: TFormaTipo): integer; override;
    function Reporte: boolean; override;

  published
  end;



implementation

uses
  IntCRAnNa89;

{$R *.DFM}


constructor TCrannaf.Create(AOwner: TComponent);
begin
  inherited;

  StpName  := ' ';
  UseQuery := False;
  HelpFile := 'IntCrannaf.Hlp';
  ShowMenuReporte := True;
end;

destructor TCrannaf.Destroy;
begin
  inherited;
end;


function TCrannaf.ShowWindow(FormaTipo: TFormaTipo): integer;
var
  W: TWCrannaf;
begin
  W := TWCrannaf.Create(Self);
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


function TCrannaf.InternalBusca: boolean;
var
  T: TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('ICrannaf.it', '');
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

function TCrannaf.Reporte: boolean;
begin //Execute_Reporte(); 
end;


 (***********************************************FORMA CrAnNaf********************)
 (*                                                                              *)
 (*  FORMA DE CrAnNaf                                                            *)
 (*                                                                              *)
 (***********************************************FORMA CrAnNaf********************)

procedure TWCrannaf.FormShow(Sender: TObject);
var
  fecha: string;
begin
  with Objeto do
  begin
    lbDempresa.Caption := ParamCre.EMPRESA.AsString;
    lbDfecha.Caption  := ParamCre.FECHA.AsString;
    lbDUsuario.Caption := ParamCre.USUARIO.AsString;
    lbDPerfil.Caption := ParamCre.PERFIL.AsString;

    DateTime_SetFormat(dtpF_CIERRE.Handle, PChar('MMMM,yyyy'));
    dtpF_CIERRE.DateTime := IncMonth(Date,-1);
  end;
end;

procedure TWCrannaf.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TWCrannaf.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrannaf.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrannaf.btMuestraDatosClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRANNAF_MUEST',True,True) then
   begin
      if rdAnexo.ItemIndex = 0 then
        ConsultaAnexo8
      else if rdAnexo.ItemIndex = 1 then
        ConsultaAnexo9;
      //end if
   end;
end;

procedure TWCrannaf.btGeneraDatosClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRANNAF_GENERA',True,True) then
   begin
      If BuscaInformacion = False then
      begin
        if rdAnexo.ItemIndex = 0 then
        begin
          GeneraAnexo;
          ConsultaAnexo8;
        end
        else if rdAnexo.ItemIndex = 1 then
        begin
          GeneraAnexo;
          ConsultaAnexo9;
        end;
      end
      else
        ShowMessage('Ya existe información cargada.');
   end;
end;

procedure TWCrannaf.btnGeneraArchivoClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRANNAF_GENARC',True,True) then
   begin
      if not QryAnexo.Active then
      begin
        MessageDlg('No hay información para guardar del Año Mes ' + FormatDateTime('YYYYMM', dtpF_CIERRE.DateTime),
          mtWarning, [mbOK], 0);
        Exit;
      end
      else if (Trim(ExtractFileName(edFileNameXLS.Text)) = '') then
      begin
        MessageDlg('Debe de indicar primero el nombre del archivo en donde desea guardar la información.',
          mtWarning, [mbOK], 0);
        Exit;
      end
      else if (LowerCase(Trim(ExtractFileExt(edFileNameXLS.Text))) <> '.xls') then
      begin
        edFileNameXLS.Text := edFileNameXLS.Text + '.xls';
      end;

      HabilitaControles(False);
      if rdAnexo.ItemIndex = 0 then
        GenExcelAnexo8(edFileNameXLS.Text)
      else if rdAnexo.ItemIndex = 1 then
        GenExcelAnexo9(edFileNameXLS.Text);
      //end if
      HabilitaControles(True);
   end;
end;

function TWCrannaf.GeneraAnexo: boolean;
var
  STPObtCredito: TStoredProc;
begin
  STPObtCredito := TStoredProc.Create(Self);
  try
    with STPObtCredito do
    begin
      STPObtCredito.DatabaseName := Objeto.Apli.DatabaseName;
      STPObtCredito.SessionName  := Objeto.Apli.SessionName;
      STPObtCredito.StoredProcName := 'PKGCRRGLNAFIN.STPCARGAANEXO89';

      // Se crean los parametros del StoreProcedure
      Params.Clear;
      Params.CreateParam(ftFloat, 'PEID_EMPRESA', ptInput);
      Params.CreateParam(ftString, 'PEANIO_MES', ptInput);
      // </ RABA > OCT 2011 SE AGREGA PARAMETRO DE ENTRADA EN EL PAQUETE PARA REALIZAR EL COMMIT
      Params.CreateParam(ftString, 'PEBCOMMIT', ptInput);
      // < RABA />
      Params.CreateParam(ftFloat, 'PSRESULTADO', ptOutput);
      Params.CreateParam(ftString, 'PSTXRESULTADO', ptOutput);

      ParamByName('PEID_EMPRESA').AsInteger := Objeto.Apli.IdEmpresa;
      ParamByName('PEANIO_MES').AsInteger := StrToInt(FormatDateTime('YYYYMM', IncMonth(dtpF_CIERRE.DateTime,-1)));
      // </ RABA > OCT 2011 SE AGREGA PARAMETRO DE ENTRADA EN EL PAQUETE PARA REALIZAR EL COMMIT
      ParamByName('PEBCOMMIT').AsString := 'V';
      // < RABA />

      ExecProc;

      //SI CARGA MANDA EL CREDITO Y Y LA SITUACION DEL MISMO
      if ParamByName('PSResultado').AsInteger = 0 then
      begin
        ShowMessage('Generación Exitosa');
      end
      else // SI NO REALIZA LA CARGA MANDA ERRORES
      begin
        ShowMessage('Generación, Error [ ' + ParamByName('psRESULTADO').AsString + '] ' + ParamByName('psTxResultado').AsString);
      end;
      UnPrepare;
    end;
  finally
    STPObtCredito.Free;
  end;
end;

procedure TWCrannaf.ConsultaAnexo8;
var
  VlPerido: string;
  VLSQL: string;
begin
  if QryAnexo.Active then
    QryAnexo.Close;

    VlPerido := FormatDateTime('YYYYMM', IncMonth(dtpF_CIERRE.DateTime,-1));


  VLSQL :=
    ' SELECT  ID_INTER_FINAN, ' +
    ' ID_CRED_NAFIN, ' +
    ' RFC_ACREDITADO, ' +
    ' IMP_SDO_INS_FM, ' +
    ' to_char(F_DISPOSICION, ''dd/mm/yyyy'') F_DISPOSICION, ' +
    ' to_char(F_ULT_VENC, ''dd/mm/yyyy'') F_ULT_VENC, ' +
    ' CVE_VIGENTE, ' +
    ' CVE_VENCIDA, ' +
    ' CVE_CADUCA, ' +
    ' CVE_CANCELADA, ' +
    ' CVE_ALTA, ' +
    ' CVE_MONEDA_NAF, ' +
    ' PCT_GARANTIA, ' +
    ' CVE_TIPO_CREDITO ' +
    ' FROM CR_NAFIN_ANEXO ' +
    ' WHERE ID_EMPRESA = ' + IntToStr(Objeto.Apli.IdEmpresa) +
    ' AND   ANIO_MES = ' + VlPerido +
    ' AND   IMP_HONRADO = 0 ';

  with QryAnexo do
    try
      SQL.Clear;
      SQL.Add(VLSQL);

      DatabaseName := Objeto.Apli.DatabaseName;
      SessionName  := Objeto.Apli.SessionName;
      Open;
    finally
    end;
end;

procedure TWCrannaf.ConsultaAnexo9;
var
  VlPerido: string;
  VLSQL: string;
begin
  if QryAnexo.Active then
    QryAnexo.Close;

  VlPerido := FormatDateTime('YYYYMM', IncMonth(dtpF_CIERRE.DateTime,-1));


  VLSQL :=
    ' SELECT  ID_INTER_FINAN, ' + ' ID_CRED_NAFIN, ' + ' RFC_ACREDITADO, ' + ' CVE_MONEDA_NAF, ' +
    ' IMP_HONRADO, ' + ' IMP_RECUPERADO, ' + ' SIT_GARANTIA, ' + ' IMP_HONRADO - IMP_RECUPERADO AS POR_RECUPERAR ' +
    ' FROM CR_NAFIN_ANEXO ' + ' WHERE ID_EMPRESA = ' + IntToStr(Objeto.Apli.IdEmpresa) + ' AND   ANIO_MES = ' + VlPerido + ' AND   IMP_HONRADO > 0 ';

  with QryAnexo do
    try
      SQL.Clear;
      SQL.Add(VLSQL);

      DatabaseName := Objeto.Apli.DatabaseName;
      SessionName  := Objeto.Apli.SessionName;
      Open;
    finally
    end;
end;


function TWCrannaf.GenExcelAnexo8(peFileName: string): boolean;
var
  vlRange: variant;
  vlCol, vlRow: integer;
  vgExcelApp: olevariant;
  vlColumnRange: variant;
  Format: OleVariant;
begin
  Result := False;
  ProgressBar.Min := 0;
  ProgressBar.Position := 0;

  if not QryAnexo.Active then
    Exit;

  vgExcelApp := CreateOleObject('Excel.Application');
  vgExcelApp.Workbooks.Add;
  try
    //----------------------------------
    // INICIA EL LLENADO DE DATOS HACIA
    // EL ARCHIVO DE EXCEL
    vlRow := 2;
    QryAnexo.Last;
    ProgressBar.Max := QryAnexo.RecordCount;
    QryAnexo.First;
    Format := '@';
    vgExcelApp.Workbooks[1].WorkSheets[1].Range['E1', 'E1'].EntireColumn.NumberFormat := Format;
    vgExcelApp.Workbooks[1].WorkSheets[1].Range['F1', 'F1'].EntireColumn.NumberFormat := Format;
    for vlCol := 0 to QryAnexo.FieldCount - 1 do
    begin
      vgExcelApp.Cells[1, vlCol + 1].Value := QryAnexo.fields[vlCol].FullName;
    end;

    QryAnexo.First;

    while not QryAnexo.EOF do
    begin
      vgExcelApp.Cells[vlRow, ColumnXlS('A')].Value := QryAnexo.FieldByName('ID_INTER_FINAN').AsInteger;
      vgExcelApp.Cells[vlRow, ColumnXlS('B')].Value := QryAnexo.FieldByName('ID_CRED_NAFIN').AsInteger;
      vgExcelApp.Cells[vlRow, ColumnXlS('C')].Value := QryAnexo.FieldByName('RFC_ACREDITADO').AsString;
      vgExcelApp.Cells[vlRow, ColumnXlS('D')].Value := QryAnexo.FieldByName('IMP_SDO_INS_FM').AsFloat;
      vgExcelApp.Cells[vlRow, ColumnXlS('E')].Value := QryAnexo.FieldByName('F_DISPOSICION').AsString;
      vgExcelApp.Cells[vlRow, ColumnXlS('F')].Value := QryAnexo.FieldByName('F_ULT_VENC').AsString;
      vgExcelApp.Cells[vlRow, ColumnXlS('G')].Value := QryAnexo.FieldByName('CVE_VIGENTE').AsString;
      vgExcelApp.Cells[vlRow, ColumnXlS('H')].Value := QryAnexo.FieldByName('CVE_VENCIDA').AsString;
      vgExcelApp.Cells[vlRow, ColumnXlS('I')].Value := QryAnexo.FieldByName('CVE_CADUCA').AsString;
      vgExcelApp.Cells[vlRow, ColumnXlS('J')].Value := QryAnexo.FieldByName('CVE_CANCELADA').AsString;
      vgExcelApp.Cells[vlRow, ColumnXlS('K')].Value := QryAnexo.FieldByName('CVE_ALTA').AsString;
      vgExcelApp.Cells[vlRow, ColumnXlS('L')].Value := QryAnexo.FieldByName('CVE_MONEDA_NAF').AsString;
      vgExcelApp.Cells[vlRow, ColumnXlS('M')].Value := QryAnexo.FieldByName('PCT_GARANTIA').AsString;
      vgExcelApp.Cells[vlRow, ColumnXlS('N')].Value := QryAnexo.FieldByName('CVE_TIPO_CREDITO').AsString;


      Application.ProcessMessages;
      ProgressBar.Position := vlRow;
      Inc(vlRow);
      QryAnexo.Next;
    end;

    // ShowMessage(Format('Excel Version %s: ', [vgExcelApp.Version]));

    // Colocación de colores de columnas
    vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['D1:D' + IntToStr(vlRow - 1)];
    vlRange.NumberFormat := '#,##0.00';
      {
      For vlCol := 1 To 40 Do
      Begin
           vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range[IntToColumnXlS(vlCol)+'1:'+IntToColumnXlS(vlCol)+'1'];
           vlRange.WrapText := True;
      End;
      }
  finally
    HabilitaControles(True);
    vgExcelApp.ActiveWorkBook.SaveAs(peFileName);
    CloseExcelFile(vgExcelApp);
    ProgressBar.Position := 0;
    Result := True;
  end;
end;

function TWCrannaf.GenExcelAnexo9(peFileName: string): boolean;
var
  vlRange: variant;
  vlCol, vlRow: integer;
  vgExcelApp: olevariant;
  vlColumnRange: variant;
begin
  Result := False;
  ProgressBar.Min := 0;
  ProgressBar.Position := 0;

  if not QryAnexo.Active then
    Exit;

  vgExcelApp := CreateOleObject('Excel.Application');
  vgExcelApp.Workbooks.Add;
  try
    //----------------------------------
    // INICIA EL LLENADO DE DATOS HACIA
    // EL ARCHIVO DE EXCEL
    vlRow := 2;
    QryAnexo.Last;
    ProgressBar.Max := QryAnexo.RecordCount;
    QryAnexo.First;

    for vlCol := 0 to QryAnexo.FieldCount - 1 do
    begin
      vgExcelApp.Cells[1, vlCol + 1].Value := QryAnexo.fields[vlCol].FullName;
    end;

    QryAnexo.First;
    QryAnexo.SQL.SaveToFile('c:\temp\QryAnexoB.sql');

    while not QryAnexo.EOF do
    begin
      vgExcelApp.Cells[vlRow, ColumnXlS('A')].Value := QryAnexo.FieldByName('ID_INTER_FINAN').AsInteger;
      vgExcelApp.Cells[vlRow, ColumnXlS('B')].Value := QryAnexo.FieldByName('ID_CRED_NAFIN').AsInteger;
      vgExcelApp.Cells[vlRow, ColumnXlS('C')].Value := QryAnexo.FieldByName('RFC_ACREDITADO').AsString;
      vgExcelApp.Cells[vlRow, ColumnXlS('D')].Value := QryAnexo.FieldByName('CVE_MONEDA_NAF').AsString;
      vgExcelApp.Cells[vlRow, ColumnXlS('E')].Value := QryAnexo.FieldByName('IMP_HONRADO').AsFloat;
      vgExcelApp.Cells[vlRow, ColumnXlS('F')].Value := QryAnexo.FieldByName('IMP_RECUPERADO').AsFloat;
      vgExcelApp.Cells[vlRow, ColumnXlS('G')].Value := QryAnexo.FieldByName('SIT_GARANTIA').AsString;
      vgExcelApp.Cells[vlRow, ColumnXlS('H')].Value := QryAnexo.FieldByName('POR_RECUPERAR').AsFloat;
      Application.ProcessMessages;
      ProgressBar.Position := vlRow;
      Inc(vlRow);
      QryAnexo.Next;
    end;

    // ShowMessage(Format('Excel Version %s: ', [vgExcelApp.Version]));

    // Colocación de colores de columnas
    vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['E1:E' + IntToStr(vlRow - 1)];
    vlRange.NumberFormat := '#,##0.00';

    vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['F1:F' + IntToStr(vlRow - 1)];
    vlRange.NumberFormat := '#,##0.00';

    vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range['H1:H' + IntToStr(vlRow - 1)];
    vlRange.NumberFormat := '#,##0.00';
      {
      For vlCol := 1 To 40 Do
      Begin
           vlRange := vgExcelApp.Workbooks[1].WorkSheets[1].Range[IntToColumnXlS(vlCol)+'1:'+IntToColumnXlS(vlCol)+'1'];
           vlRange.WrapText := True;
      End;
      }
  finally
    HabilitaControles(True);
    vgExcelApp.ActiveWorkBook.SaveAs(peFileName);
    CloseExcelFile(vgExcelApp);
    ProgressBar.Position := 0;
    Result := True;
  end;
end;


procedure TWCrannaf.btnSaveFileNameClick(Sender: TObject);
begin
  if SaveDialog.Execute then
    edFileNameXLS.Text := SaveDialog.FileName;
end;

procedure TWCrannaf.HabilitaControles(pebHabilita: boolean);
begin
  dtpF_CIERRE.Enabled := pebHabilita;
  btMuestraDatos.Enabled := pebHabilita;
  btGeneraDatos.Enabled := pebHabilita;
  rdAnexo.Enabled := pebHabilita;
  edFileNameXLS.Enabled := pebHabilita;
  btnSaveFileName.Enabled := pebHabilita;
  btnGeneraArchivo.Enabled := pebHabilita;
end;


procedure TWCrannaf.bbConsultaAnexo9Click(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRANNAF_ANEX9',True,True) then
   begin
      if not QryAnexo.Active then
      begin
        MessageDlg('No hay información para guardar del Año Mes ' + FormatDateTime('YYYYMM', dtpF_CIERRE.DateTime),
          mtWarning, [mbOK], 0);
        Exit;
      end
      else
      begin
        GenAnexo9Naf(FormatDateTime('YYYYMM', IncMonth(dtpF_CIERRE.DateTime,-1)), '484',
          Objeto.Apli,
          True);
      end;
   end;
end;

function TWCrannaf.BuscaInformacion: boolean;
var
  VLSQL : string;
  vlQry : TQuery;
begin
  vlSql := 'SELECT COUNT(*) AS HAYINFORMACION ' +
           'FROM CR_NAFIN_ANEXO ' +
           'WHERE ANIO_MES = ' +
           FormatDateTime('YYYYMM', IncMonth(dtpF_CIERRE.DateTime,-1));
  vlQry := GetSQLQuery(vlSql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );

  If Assigned(vlQry) Then
  begin
     If vlQry.FieldByName('HAYINFORMACION').AsInteger > 0 Then
        Result := True
     else
        Result := False;
  end
  else
    Result := False;
end;

end.
