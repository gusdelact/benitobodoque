 // Sistema         : Clase de SdoAgrMas
 // Fecha de Inicio : 14/10/2010
 // Función forma   : Clase de SdoAgrMas
 // Desarrollo por  : Copy and Paste.
 // Diseñado por    :
unit IntSdoAgrMas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm, DB, DBTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun, ComCtrls, IntDtPk, IntParamCre, Grids, Aligrid,
  Menus, DBGrids, Excel97, FileCtrl, OleServer, IntSGCtrl;


type
  TSdoAgrMas = class;

  TWSdoAgrMas = class(TForm)
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
    qSaldos: TQuery;
    ExcelWorksheetO: TExcelWorksheet;
    ExcelWorkbookO: TExcelWorkbook;
    ExcelApplicationO: TExcelApplication;
    btnGeneraBloque: TBitBtn;
    Label1: TLabel;
    dstot: TDataSource;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    qDetalle: TQuery;
    qDetalleREFERENCIA: TFloatField;
    qDetalleFLIQUIDACION: TDateTimeField;
    qDetalleCVEOPERACION: TStringField;
    qDetalleDESCOPERACION: TStringField;
    qDetalleIMPORTE: TFloatField;
    qDetalleTX_REFERENCIA: TStringField;
    qDetalleSDO_DISPONIBLE: TFloatField;
    qDetalleNATURALEZA: TStringField;
    dsdet: TDataSource;
    QueryTot: TQuery;
    QueryTotID_CONTRATO: TFloatField;
    QueryTotNOMBRE: TStringField;
    QueryTotID_CREDITO: TFloatField;
    lbArchivoEntrada: TLabel;
    sbArchivoEntrada: TSpeedButton;
    directorio: TEdit;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    chbFilCred: TCheckBox;
    edIdCreditoIni: TEdit;
    edIdCreditoFin: TEdit;
    bbFiltrar: TBitBtn;
    PageControl1: TPageControl;
    Chequera: TTabSheet;
    DBGrid2: TDBGrid;
    Saldos: TTabSheet;
    sgSaldos: TSGCtrl;
    chbMultiSelect: TCheckBox;
    btnGeneraUno: TBitBtn;
    pAniBar: TPanel;
    BitBtn1: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    function EliminaCar(pDato: string): string;
    procedure btnGeneraBloqueClick(Sender: TObject);
    procedure sbArchivoEntradaClick(Sender: TObject);
    procedure bbFiltrarClick(Sender: TObject);
    procedure chbFilCredClick(Sender: TObject);
    procedure btnGeneraUnoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    package: string; //Para fechas valor
    Objeto:  TSdoAgrMas;
    uno : Boolean;
    excel : Boolean;
  end;

  TSdoAgrMas = class(TInterFrame)
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

  published
  end;

//Clase para la barra de progreso
  TAniBarThread = class(TThread)
  private
    { private declarations }
    FWnd:       HWND;
    FPaintRect: TRect;
    FbkColor, FfgColor: TColor;
    FInterval:  integer;
  protected
    procedure Execute; override;
  public
    constructor Create(paintsurface: TWinControl; {Control a pintar }
      paintrect: TRect;          { area }
      bkColor, barcolor: TColor; { colores}
      interval: integer);        { intervalo entre refresh}
  end;

implementation
//Uses RepMon;

{$R *.DFM}

{* Definición de las clases para la barra de progreso
 *}
constructor TAniBarThread.Create(paintsurface: TWinControl;
  paintrect: TRect; bkColor, barcolor: TColor; interval: integer);
begin
  inherited Create(True);
  FWnd := paintsurface.Handle;
  FPaintRect := paintrect;
  FbkColor := bkColor;
  FfgColor := barColor;
  FInterval := interval;
  FreeOnterminate := True;
  Resume;
end; { TAniBarThread.Create }

procedure TAniBarThread.Execute;
var
  image: TBitmap;
  DC: HDC;
  left, right: integer;
  increment: integer;
  imagerect: TRect;
  state: (incRight, incLeft, decLeft, decRight);
begin
  Image := TBitmap.Create;
  try
    with Image do
    begin
      Width  := FPaintRect.Right - FPaintRect.Left;
      Height := FPaintRect.Bottom - FPaintRect.Top;
      imagerect := Rect(0, 0, Width, Height);
    end; { with }
    left  := 0;
    right := 0;
    increment := imagerect.right div 50;
    state := Low(State);
    while not Terminated do
    begin
      with Image.Canvas do
      begin
        Brush.Color := FbkColor;
        FillRect(imagerect);
        case state of
          incRight:
          begin
            Inc(right, increment);
            if right > imagerect.right then
            begin
              right := imagerect.right;
              Inc(state);
            end; { if }
          end; { case incRight }
          incLeft:
          begin
            Inc(left, increment);
            if left >= right then
            begin
              left := right;
              Inc(state);
            end; { if }
          end; { case incLeft }
          decLeft:
          begin
            Dec(left, increment);
            if left <= 0 then
            begin
              left := 0;
              Inc(state);
            end; { if }
          end; { case decLeft }
          decRight:
          begin
            Dec(right, increment);
            if right <= 0 then
            begin
              right := 0;
              state := incRight;
            end; { if }
          end; { case decLeft }
        end; { case }
        Brush.Color := FfgColor;
        FillRect(Rect(left, imagerect.top, right, imagerect.bottom));
      end; { with }
      DC := GetDC(FWnd);
      if DC <> 0 then
        try
          BitBlt(DC,
            FPaintRect.Left,
            FPaintRect.Top,
            imagerect.right,
            imagerect.bottom,
            Image.Canvas.handle,
            0, 0,
            SRCCOPY);
        finally
          ReleaseDC(FWnd, DC);
        end;
      Sleep(FInterval);
      Application.ProcessMessages;
    end; { while }
  finally
    Image.Free;
  end;
  InvalidateRect(FWnd, nil, True);
end; { TAniBarThread.Execute }


constructor TSdoAgrMas.Create(AOwner: TComponent);
begin
  inherited;
  StpName  := ' ';
  UseQuery := False;
  HelpFile := 'InTSdoAgrMas.Hlp';
  ShowMenuReporte := True;
end;

destructor TSdoAgrMas.Destroy;
begin
  inherited;
end;


function TSdoAgrMas.ShowWindow(FormaTipo: TFormaTipo): integer;
var
  W: TWSdoAgrMas;
begin
  W := TWSdoAgrMas.Create(Self);
  try
    W.Objeto := Self;
    W.InterForma1.InterFrame := Self;
    W.InterForma1.FormaTipo := ftConsulta;
    W.InterForma1.ShowGrid := False;
    W.InterForma1.ShowNavigator := False;
    W.InterForma1.ShowModal;
    ShowWindow := W.InterForma1.ModalResult;
  finally
    W.Free;
  end;
end;


function TSdoAgrMas.InternalBusca: boolean;
begin
  InternalBusca := False;
end;

 (***********************************************FORMA SdoAgrMas********************)
 (*                                                                              *)
 (*  FORMA DE SdoAgrMas                                                            *)
 (*                                                                              *)
 (***********************************************FORMA SdoAgrMas********************)

procedure TWSdoAgrMas.FormShow(Sender: TObject);
var
  vlQry: TQuery;
begin
  with Objeto do
  begin
    //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
    lbDempresa.Caption := ParamCre.EMPRESA.AsString;
    lbDfecha.Caption  := ParamCre.FECHA.AsString;
    lbDUsuario.Caption := ParamCre.USUARIO.AsString;
    lbDPerfil.Caption := ParamCre.PERFIL.AsString;


    //Conecta los db's
    queryTot.Active := false;
    qDetalle.Active := false;
    qSaldos.Active := false;

    queryTot.DatabaseName := Apli.DatabaseName;
    queryTot.SessionName := Apli.SessionName;
    qDetalle.DatabaseName := Apli.DatabaseName;
    qDetalle.SessionName := Apli.SessionName;
    qSaldos.DatabaseName  := Apli.DatabaseName;
    qSaldos.SessionName  := Apli.SessionName;

    queryTot.Active;
    qDetalle.Active;

    queryTot.Open;
    qDetalle.Open;

  end;

  uno := false;
  excel := true;
end;

procedure TWSdoAgrMas.FormDestroy(Sender: TObject);
begin
  //Objeto
end;

procedure TWSdoAgrMas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

function TWSdoAgrMas.EliminaCar(pDato: string): string;
var
  i: integer;
  Nvo, cara: string;

begin
  Nvo := '';
  for i := 1 to length(pdato) do
  begin
    if copy(pdato, i, 1) <> ',' then
      Nvo := Nvo + copy(pdato, i, 1)
    else
      Nvo := Nvo + ' ';
  end;
  EliminaCar := Nvo;

end;

procedure TWSdoAgrMas.btnGeneraBloqueClick(Sender: TObject);
type
  columnas  = 1..100;
  sColumnas = set of columnas;
var
  vlArchivo: TextFile;
  vlCadena, vlNomArch: string;
  vlRow, vlCol: integer;
  LCID: integer;
  i: integer;
  formulas: sColumnas;
  Format : String;
  nCreditos : Integer;
  continue : Boolean;
  formula : String;
  //Para la barra de progreso
  ani: TAniBarThread;
  r: TRect;
begin

  formulas := [1,2,3,4,5,6,7,8,16,30,31,32,33,34,35,36,37,38,39,40,41,42,45,46,47,48,49];

  if (directorio.text = '') then
  begin
    ShowMessage('Debe seleccionar una ruta para los documentos');
    exit;
  end;

  if (DBGrid1.SelectedRows.Count = 0) and (chbMultiSelect.Checked)  then
  begin
    ShowMessage('Debe seleccionar al menos una disposición');
    exit;
  end;

  if not chbMultiSelect.Checked then
    queryTot.First;

  continue := true;
  i := 0;
  while continue do
  //for i := 0 to DBGrid1.SelectedRows.Count - 1 do
  begin
    if chbMultiSelect.Checked then
    begin
      DBGrid1.DataSource.DataSet.GotoBookmark(Pointer(DBGrid1.SelectedRows.Items[i]));
      inc(i);
    end;

    vlNomArch := directorio.Text + '\DV_' + queryTot.FieldByName('ID_CONTRATO').AsString + '_' + queryTot.FieldByName('ID_CREDITO').AsString + '.CSV';
    AssignFile(vlArchivo, vlNomArch);
    Rewrite(vlArchivo);

    qDetalle.First;
    vlCadena := 'CHEQUERA : ' + queryTot.FieldByName('ID_CONTRATO').AsString + ' NOMBRE  : ' + queryTot.FieldByName(
      'NOMBRE').AsString + ' CREDITO : ' + queryTot.FieldByName('ID_CREDITO').AsString +
      ' FECHA DE GENERACION ' + FORMATDATETIME('DD/MM/YYYY HH:NN:SS', NOW);
    vlCadena := vlCadena + ', ';
    vlCadena := vlCadena + ', ';
    vlCadena := vlCadena + ', ';
    vlCadena := vlCadena + ', ';
    vlCadena := vlCadena + ', ';
    vlCadena := vlCadena + ', ';
    vlCadena := vlCadena + ', ';
    Writeln(vlArchivo, vlCadena);
    vlCadena := 'REFERENCIA';
    vlCadena := vlCadena + ',FLIQUIDACION';
    vlCadena := vlCadena + ',CVEOPERACION';
    vlCadena := vlCadena + ',DESCOPERACION';
    vlCadena := vlCadena + ',IMPORTE';
    vlCadena := vlCadena + ',TX_REFERENCIA';
    vlCadena := vlCadena + ',SDO_DISPONIBLE';
    vlCadena := vlCadena + ',AFECTA_SDO';
    Writeln(vlArchivo, vlCadena);
    while not qDetalle.EOF do
    begin
      vlCadena := qDetalle.FieldByName('REFERENCIA').AsString;
      vlCadena := vlCadena + ',' + qDetalle.FieldByName('FLIQUIDACION').AsString;
      vlCadena := vlCadena + ',' + qDetalle.FieldByName('CVEOPERACION').AsString;
      vlCadena := vlCadena + ',' + EliminaCar(qDetalle.FieldByName('DESCOPERACION').AsString);
      vlCadena := vlCadena + ',' + qDetalle.FieldByName('IMPORTE').AsString;
      vlCadena := vlCadena + ',' + EliminaCar(qDetalle.FieldByName('TX_REFERENCIA').AsString);
      vlCadena := vlCadena + ',' + qDetalle.FieldByName('SDO_DISPONIBLE').AsString;
      vlCadena := vlCadena + ',' + qDetalle.FieldByName('NATURALEZA').AsString;

      Writeln(vlArchivo, vlCadena);
      qDetalle.Next;
    end;
    CloseFile(vlArchivo);

    vlCadena :=
      ' select   to_char (ccas.f_cierre, ''dd/mm/yyyy'') as f_cierre, ' +
      '          ''=AL'' || to_char (rownum + 1) as "Saldo Insoluto", ' +
      '          ''=AF'' || to_char (rownum + 1) || ''-AU'' || to_char (rownum + 1) as "Refinanciamiento", ' +
      '          ''=AH'' || to_char (rownum + 1) as "Interés Vigente", ' +
      '          ''=AO'' || to_char (rownum + 1) as "Capital Vencido", ' +
      '          ''=AQ'' || to_char (rownum + 1) as "Mora Capital", ' +
      '          ''=AV'' || to_char (rownum + 1) as "Adeudo Refinanciamiento", ' +
      '          ''=AX'' || to_char (rownum + 1) as "Mora Refinanciamiento", ' +
      '          ''=AK'' || to_char (rownum + 1) as "Adeudo Interés", ' +
      '          nvl (trans.capital, 0) + nvl (trans.reccapitalgar, 0) as "Capital Cobrado", ' +
      '          nvl (trans.interes, 0) as "Interés Cobrado", ' +
      '          nvl (trans.finadic, 0) + nvl (trans.recfinadicgar, 0) as "Fin. Adic. Cobrado", ' +
      '          nvl (trans.comision, 0) as "Cuota Fega Cobrada", ' +
      '          nvl (trans.moracapital, 0) + nvl (trans.condmoracapital, 0) as "Capital Mora", ' +
      '          nvl (trans.morafinadic, 0) + nvl (trans.condmorafinadic, 0) as "Fin Adic Mora", ' +
      '          nvl (trans.moracomision, 0) as "Cuota Fega Mora", ' +
      '          ''=SUM(R'' || to_char (rownum + 1) || '':X'' || to_char (rownum + 1) || '')'' as "Total Garantia", ' +
      '          nvl (trans.capitalgar, 0) as "Pago de Capital con Garantía", ' +
      '          nvl (trans.moracapitalgar, 0) as "Mora Capital con Garantía", ' +
      '          nvl (trans.interesgar, 0) as "Pago de Interés con Garantía", ' +
      '          nvl (trans.finadicgar, 0) as "Pago de Fin Adic con Garantía", ' +
      '          nvl (trans.morafinadicgar, 0) as "Mora de Fin Adic con Garantía", ' +
      '          nvl (trans.comisiongar, 0) + nvl (trans.ivacomisiongar, 0) as "Pago de Comisión con Garantía", ' +
      '          nvl (trans.moracomisiongar, 0) as "Mora Comisión con Garantía", ' +
      '          to_char (cc.f_prog_pago, ''dd/mm/yyyy'') as "Fecha Prog Pago Capital", ' +
      '          nvl (cc.imp_capital, 0) as "Capital Por pagar", ' +
      '          to_char (cf.f_prog_pago, ''dd/mm/yyyy'') as "Fecha Prog Pago Fin Adic", ' +
      '          nvl (cf.imp_finan_adic, 0) as "Fin Adic por Pagar", ' +
      '          nvl (ci.imp_interes, 0) as "Interes por Pagar", ' +
      '          nvl (trans.interesfa, 0) as "Interés por RefAd", ' +
      '          decode (rownum, 1, to_char (cre.imp_credito), ''=AE'' || to_char (rownum) || ''-Z'' || to_char (rownum + 1) ) as "Saldo Insoluto", ' +
      '          decode (rownum, 1, ''0'', ''=AF'' || to_char (rownum) || ''+AD'' || to_char (rownum + 1) ) as "Finan Adic", ' +
      '          decode ( ' +
      '            rownum, ' +
      '            1, ''=ROUND('' || cre.tasa_credito || ''*AE2/36000,2)'', ' +
      '            ''=ROUND('' || cre.tasa_credito || ''*(AE'' || to_char (rownum + 1) || ''+AF'' || to_char (rownum + 1) || ''-AU'' || to_char (rownum + 1) || '')/36000,2)'') as "Interés Dia", ' +
      '          decode (rownum, 1, ''=AG2'', ''=AH'' || to_char (rownum) || ''+AG'' || to_char (rownum + 1) || ''-AC'' || to_char (rownum + 1) ) as "Interés", ' +
      '          decode ( ' +
      '            rownum, ' +
      '            1, ''=AD'' || to_char (rownum + 1) || ''+K'' || to_char (rownum + 1), ' +
      '            ''=AI'' || to_char (rownum) || ''+AD'' || to_char (rownum + 1) || ''+K'' || to_char (rownum + 1) ) as "Interés Pagado Total", ' +
      '          decode (rownum, 1, ''0'', ''=AC'' || to_char (rownum + 1) || ''+AJ'' || to_char (rownum) ) as "Interés por Pagar Total", ' +
      '          ''=IF(AJ'' || to_char (rownum + 1) || ''-AI'' || to_char (rownum + 1) || ''<0,0,AJ'' || to_char (rownum + 1) || ''-AI'' || to_char (rownum + 1) || '')'' as "Interés Vencido", ' +
      '          ''='' || to_char (cre.imp_credito) || ''-AM'' || to_char (rownum + 1) as "Saldo vig_imp", ' +
      '          decode (rownum, 1, ''0'', ''=AM'' || to_char (rownum) || ''+J'' || to_char (rownum + 1) ) as "Capital Pagado", ' +
      '          decode (rownum, 1, ''0'', ''=AN'' || to_char (rownum) || ''+Z'' || to_char (rownum + 1) ) as "Capital por Pagar", ' +
      '          ''=IF(AN'' || to_char (rownum + 1) || ''-AM'' || to_char (rownum + 1) || ''>0,AN'' || to_char (rownum + 1) || ''-AM'' || to_char (rownum + 1) || '',0)'' as "Capital Impagado", ' +
      '          ''=IF('' || cre.tasa_credito || ''*2*AO'' || to_char (rownum + 1) || ''/36000>0,'' || cre.tasa_credito || ''*2*AO'' || to_char (rownum + 1) || ''/36000,0)'' ' +
      '                                                                                                                                                          as "Capital Impagado Mora", ' +
      '          decode (rownum, 1, ''0'', ''=AQ'' || to_char (rownum) || ''+AP'' || to_char (rownum + 1) || ''-N'' || to_char (rownum + 1) ) as "Impagado Mora Total", ' +
      '          ''0'' as "Conceptos Total", ' +
      '          ''0'' as "Conceptos Impagado", ' +
      '          decode (rownum, 1, ''0'', ''=AT'' || to_char (rownum) || ''+L'' || to_char (rownum + 1) ) as "Refinanciamiento Pagado", ' +
      '          decode (rownum, 1, ''0'', ''=IF(AA'' || to_char (rownum + 1) || ''<>0,AU'' || to_char (rownum) || ''+AB'' || to_char (rownum + 1) || '',AU'' || to_char (rownum) || '')'') ' +
      '                                                                                                                                                     as "Refinanciamiento por Pagar", ' +
      '          ''=AU'' || to_char (rownum + 1) || ''-AT'' || to_char (rownum + 1) as "Refinanciamiento Impagado", ' +
      '          ''=AV'' || to_char (rownum + 1) || ''*2*'' || cre.tasa_credito || ''/36000-O'' || to_char (rownum + 1) as "Refinanciamiento Mora", ' +
      '          decode (rownum, 1, ''=AW2'', ''=AX'' || to_char (rownum) || ''+AW'' || to_char (rownum + 1) ) "Refinanciamiento Mora Total", ' +
      '          nvl (imp_cap_vig, 0) as imp_cap_vig, ' +
      '          nvl (imp_cap_imp, 0) as imp_cap_imp, ' +
      '          nvl (imp_cap_vdo_ex, 0) as imp_cap_vdo_ex, ' +
      '          nvl (imp_cap_vdo_ne, 0) as imp_cap_vdo_ne, ' +
      '          nvl (imp_int_vig, 0) as imp_int_vig, ' +
      '          nvl (imp_int_imp, 0) as imp_int_imp, ' +
      '          nvl (imp_int_vdo_ex, 0) as imp_int_vdo_ex, ' +
      '          nvl (imp_int_vdo_ne, 0) as imp_int_vdo_ne, ' +
      '          nvl (imp_ctas_ord, 0) as imp_ctas_ord, ' +
      '          nvl (imp_concep_cob, 0) as imp_concep_cob, ' +
      '          nvl (imp_concep_vig, 0) as imp_concep_vig, ' +
      '          nvl (imp_concep_imp, 0) as imp_concep_imp, ' +
      '          nvl (imp_mor_cp, 0) as imp_mor_cp, ' +
      '          nvl (imp_mor_fn, 0) as imp_mor_fn, ' +
      '          nvl (imp_mor_in, 0) as imp_mor_in, ' +
      '          nvl (imp_mor_cn, 0) as imp_mor_cn, ' +
      '          nvl (imp_resp_tot, 0) as imp_resp_tot, ' +
      '          nvl (pct_cub_credito, 0) as pct_cub_credito, ' +
      '          nvl (imp_autorizado, 0) as imp_autorizado, ' +
      '          nvl (imp_amortiza, 0) as imp_amortiza, ' +
      '          nvl (imp_int_x_cob, 0) as imp_int_x_cob, ' +
      '          nvl (pct_gtia_fnd, 0) as pct_gtia_fnd, ' +
      '          nvl (imp_capitaliza, 0) as imp_capitaliza, ' +
      '          nvl (imp_preven_cub, 0) as imp_preven_cub, ' +
      '          nvl (imp_preven_exp, 0) as imp_preven_exp, ' +
      '          nvl (pct_garantiza, 0) as pct_garantiza, ' +
      '          nvl (imp_garantia, 0) as imp_garantia, ' +
      '          nvl (imp_spm_cap_vig, 0) as imp_spm_cap_vig, ' +
      '          nvl (imp_spm_cap_imp, 0) as imp_spm_cap_imp, ' +
      '          nvl (imp_spm_cap_vdo, 0) as imp_spm_cap_vdo, ' +
      '          nvl (imp_comision_c, 0) as imp_comision_c, ' +
      '          nvl (imp_comision_aper, 0) as imp_comision_aper, ' +
      '          nvl (imp_interes_dev, 0) as imp_interes_dev, ' +
      '          nvl (imp_bonificacion, 0) as imp_bonificacion, ' +
      '          nvl (imp_quitas, 0) as imp_quitas, ' +
      '          nvl (imp_condonacion, 0) as imp_condonacion, ' +
      '          nvl (imp_descuentos, 0) as imp_descuentos, ' +
      '          nvl (imp_adjudicado, 0) as imp_adjudicado, ' +
      '          nvl (imp_castigo, 0) as imp_castigo, ' +
      '          nvl (imp_vta_cartera, 0) as imp_vta_cartera, ' +
      '          nvl (imp_burs_cartera, 0), ' +
      '          nvl (imp_cap_vig_vp, 0), ' +
      '          nvl (imp_cap_imp_vp, 0), ' +
      '          nvl (imp_cap_vdo_ex_vp, 0), ' +
      '          nvl (imp_cap_vdo_ne_vp, 0), ' +
      '          nvl (imp_int_vig_vp, 0), ' +
      '          nvl (imp_int_imp_vp, 0), ' +
      '          nvl (imp_int_vdo_ex_vp, 0), ' +
      '          nvl (imp_int_vdo_ne_vp, 0), ' +
      '          nvl (imp_ctas_ord_vp, 0), ' +
      '          nvl (imp_concep_cob_vp, 0), ' +
      '          nvl (imp_concep_vig_vp, 0), ' +
      '          nvl (imp_concep_imp_vp, 0), ' +
      '          nvl (imp_mor_cp_vp, 0), ' +
      '          nvl (imp_mor_fn_vp, 0), ' +
      '          nvl (imp_mor_in_vp, 0), ' +
      '          nvl (imp_mor_cn_vp, 0), ' +
      '          nvl (imp_resp_tot_vp, 0), ' +
      '          nvl (imp_autorizado_vp, 0), ' +
      '          nvl (imp_amortiza_vp, 0), ' +
      '          nvl (imp_int_x_cob_vp, 0), ' +
      '          nvl (pct_gtia_fnd_vp, 0), ' +
      '          nvl (imp_capitaliza_vp, 0), ' +
      '          nvl (imp_preven_cub_vp, 0), ' +
      '          nvl (imp_preven_exp_vp, 0), ' +
      '          nvl (imp_garantia_vp, 0), ' +
      '          nvl (imp_spm_cap_vig_vp, 0), ' +
      '          nvl (imp_spm_cap_imp_vp, 0), ' +
      '          nvl (imp_spm_cap_vdo_vp, 0), ' +
      '          nvl (imp_comision_c_vp, 0), ' +
      '          nvl (imp_comision_aper_vp, 0), ' +
      '          nvl (imp_interes_dev_vp, 0), ' +
      '          nvl (imp_bonificacion_vp, 0), ' +
      '          nvl (imp_quitas_vp, 0), ' +
      '          nvl (imp_condonacion_vp, 0), ' +
      '          nvl (imp_descuentos_vp, 0), ' +
      '          nvl (imp_adjudicado_vp, 0), ' +
      '          nvl (imp_castigo_vp, 0), ' +
      '          nvl (imp_vta_cartera_vp, 0), ' +
      '          nvl (imp_burs_cartera_vp, 0), ' +
      '          nvl (imp_int_cob_ant, 0) ' +
      ' from     cr_con_adeudo_sdo ccas, ' +
      '          cr_histo_cred chc, ' +
      '          cr_credito cre, ' +
      '          cr_capital cc, ' +
      '          cr_finan_adic cf, ' +
      '          cr_interes ci, ' +
      '          (select   id_credito, ' +
      '                    f_operacion, ' +
      '                    sum (capital) as capital, ' +
      '                    sum (moracapital) as moracapital, ' +
      '                    sum (finadic) as finadic, ' +
      '                    sum (morafinadic) as morafinadic, ' +
      '                    sum (comision) as comision, ' +
      '                    sum (moracomision) as moracomision, ' +
      '                    sum (interes) as interes, ' +
      '                    sum (interesfa) as interesfa, ' +
      '                    sum (capitalgar) as capitalgar, ' +
      '                    sum (moracapitalgar) as moracapitalgar, ' +
      '                    sum (interesgar) as interesgar, ' +
      '                    sum (finadicgar) as finadicgar, ' +
      '                    sum (morafinadicgar) as morafinadicgar, ' +
      '                    sum (comisiongar) as comisiongar, ' +
      '                    sum (ivacomisiongar) as ivacomisiongar, ' +
      '                    sum (moracomisiongar) as moracomisiongar, ' +
      '                    sum (recfinadicgar) as recfinadicgar, ' +
      '                    sum (reccapitalgar) as reccapitalgar, ' +
      '                    sum (condmoracapital) as condmoracapital, ' +
      '                    sum (condmorafinadic) as condmorafinadic ' +
      '           from     (select id_credito, ' +
      '                            f_operacion, ' +
      '                            case ' +
      '                              when saldos.cve_operacion = ''PAGOCP'' and saldos.cve_concepto = ''IMPBRU'' then saldos.importe ' +
      '                            end as capital, ' +
      '                            case ' +
      '                              when saldos.cve_operacion = ''PAGOCP'' and saldos.cve_concepto = ''IMPMOR'' then saldos.importe ' +
      '                            end as moracapital, ' +
      '                            case ' +
      '                              when saldos.cve_operacion = ''PAGOFN'' and saldos.cve_concepto = ''IMPBRU'' then saldos.importe ' +
      '                            end as finadic, ' +
      '                            case ' +
      '                              when saldos.cve_operacion = ''PAGOFN'' and saldos.cve_concepto = ''IMPMOR'' then saldos.importe ' +
      '                            end as morafinadic, ' +
      '                            case ' +
      '                              when saldos.cve_operacion = ''PAGOCN'' and saldos.cve_concepto = ''IMPBRU'' then saldos.importe ' +
      '                            end as comision, ' +
      '                            case ' +
      '                              when saldos.cve_operacion = ''PAGOCN'' and saldos.cve_concepto = ''IMPMOR'' then saldos.importe ' +
      '                            end as moracomision, ' +
      '                            case ' +
      '                              when saldos.cve_operacion = ''PAGOCN'' and saldos.cve_concepto = ''IMPIVA'' then saldos.importe ' +
      '                            end as ivacomision, ' +
      '                            case ' +
      '                              when saldos.cve_operacion = ''PAGOIN'' and saldos.cve_concepto = ''IMPBRU'' then saldos.importe ' +
      '                            end as interes, ' +
      '                            case ' +
      '                              when saldos.cve_operacion = ''PAINFA'' and saldos.cve_concepto = ''IMPBRU'' then saldos.importe ' +
      '                            end as interesfa, ' +
      '                            case ' +
      '                              when saldos.cve_operacion = ''PGFNGF'' and saldos.cve_concepto = ''IMPBRU'' then saldos.importe ' +
      '                            end as finadicgar, ' +
      '                            case ' +
      '                              when saldos.cve_operacion = ''PGFNGF'' and saldos.cve_concepto = ''IMPMOR'' then saldos.importe ' +
      '                            end as morafinadicgar, ' +
      '                            case ' +
      '                              when saldos.cve_operacion = ''PGCPGF'' and saldos.cve_concepto = ''IMPBRU'' then saldos.importe ' +
      '                            end as capitalgar, ' +
      '                            case ' +
      '                              when saldos.cve_operacion = ''PGCPGF'' and saldos.cve_concepto = ''IMPMOR'' then saldos.importe ' +
      '                            end as moracapitalgar, ' +
      '                            case ' +
      '                              when saldos.cve_operacion = ''PGCNGF'' and saldos.cve_concepto = ''IMPBRU'' then saldos.importe ' +
      '                            end as comisiongar, ' +
      '                            case ' +
      '                              when saldos.cve_operacion = ''PGCNGF'' and saldos.cve_concepto = ''IMPMOR'' then saldos.importe ' +
      '                            end as moracomisiongar, ' +
      '                            case ' +
      '                              when saldos.cve_operacion = ''PGCNGF'' and saldos.cve_concepto = ''IMPIVA'' then saldos.importe ' +
      '                            end as ivacomisiongar, ' +
      '                            case ' +
      '                              when saldos.cve_operacion = ''PGINGF'' and saldos.cve_concepto = ''IMPBRU'' then saldos.importe ' +
      '                            end as interesgar, ' +
      '                            case ' +
      '                              when saldos.cve_operacion = ''RCFNGF'' and saldos.cve_concepto = ''IMPBRU'' then saldos.importe ' +
      '                            end as recfinadicgar, ' +
      '                            case ' +
      '                              when saldos.cve_operacion = ''RCCPGF'' and saldos.cve_concepto = ''IMPBRU'' then saldos.importe ' +
      '                            end as reccapitalgar, ' +
      '                            case ' +
      '                              when saldos.cve_operacion = ''CMORFN'' and saldos.cve_concepto = ''IMPMOR'' then saldos.importe ' +
      '                            end as condmorafinadic, ' +
      '                            case ' +
      '                              when saldos.cve_operacion = ''CMORCP'' and saldos.cve_concepto = ''IMPMOR'' then saldos.importe ' +
      '                            end as condmoracapital ' +
      '                     from   (select   id_credito, ' +
      '                                      ct.f_valor as f_operacion, ' +
      '                                      det.cve_operacion, ' +
      '                                      det.cve_concepto, ' +
      '                                      sum (det.imp_concepto) as importe ' +
      '                             from     cr_transaccion ct, ' +
      '                                      cr_det_transac det ' +
      '                             where    det.id_transaccion = ct.id_transaccion and ct.sit_transaccion = ''AC'' ' +
      '                             group by id_credito, ' +
      '                                      ct.f_valor, ' +
      '                                      det.cve_operacion, ' +
      '                                      det.cve_concepto) saldos) ' +
      '           group by id_credito, ' +
      '                    f_operacion) trans ' +
      ' where    ccas.id_credito = cre.id_credito ' +
      ' and      ccas.id_credito = cc.id_credito(+) ' +
      ' and      ccas.f_cierre = cc.f_prog_pago(+) ' +
      ' and      ccas.id_credito = cf.id_credito(+) ' +
      ' and      ccas.f_cierre = cf.f_prog_pago(+) ' +
      ' and      ccas.id_credito = ci.id_credito(+) ' +
      ' and      ccas.f_cierre = ci.f_prog_pago(+) ' +
      ' and      ccas.id_credito = chc.id_credito ' +
      ' and      ccas.f_cierre = chc.f_cierre ' +
      ' and      ccas.id_credito = ' +  queryTot.FieldByName('ID_CREDITO').asString +
      ' and      ccas.id_credito = trans.id_credito(+) ' +
      ' and      ccas.f_cierre = trans.f_operacion(+) ' +
//      ' and      rownum < 5 ' +
      ' order by ccas.f_cierre ';

    {* Inicia las variables para actualizar el medidor
     *}
    r := pAniBar.ClientRect;
    InflateRect(r, -pAniBar.BevelWidth, -pAniBar.BevelWidth);
    ani := TAniBarThread.Create(pAniBar, r, pAniBar.color, clBlue, 100);

    qSaldos.Close;
    qSaldos.SQL.Clear;
    qSaldos.SQL.Add(vlCadena);
    qSaldos.SQL.SaveToFile('c:\temp\saldos.sql');
    qSaldos.Open;

    sgSaldos.AddQry(qSaldos,True,True,40,40,40,True);


    if not qDetalle.Active then
      qDetalle.Active := True;


    if not uno then
    begin
      //Genera archivo excel
      if excel then
      begin
        //Saldos del crédito
        vlNomArch := directorio.Text + '\SDO_' + queryTot.FieldByName('ID_CREDITO').AsString + '.xls';
        // Abre el archivo
        ExcelApplicationO.Connect;

        try
          ExcelWorkbookO.ConnectTo(ExcelApplicationO.Workbooks.add('C:\temp\saldos.xlt', 0));
        except
          on E: Exception do
            ExcelWorkbookO.ConnectTo(ExcelApplicationO.Workbooks.Add(EmptyParam, 0));
        end;

        LCID := GetUserDefaultLCID;
        ExcelWorksheetO.ConnectTo(ExcelApplicationO.ActiveSheet as _Worksheet);
        // Hace a Excel invisible
        ExcelApplicationO.Visible[LCID] := False;
        ExcelApplicationO.DisplayAlerts[LCID] := False;

        //Guarda con el nombre definido la plantilla en formate de excel
        ExcelWorkbookO.SaveAs(vlNomArch,
          Null,
          Null,
          Null,
          False,
          False,
          xlNoChange,
          xlUserResolution,
          False,
          Null,
          Null,
          0
          );


        Format := '@';
        ExcelWorksheetO.Range['A1', 'A1'].EntireColumn.NumberFormat := Format;

        //Escribe el nombre de los encabezados
        qSaldos.First;
        for vlCol := 0 to qSaldos.FieldCount - 1 do
        begin
          ExcelWorksheetO.Cells.Item[1, vlCol + 1].Value := qSaldos.fields[vlCol].FullName;
        end;


        qSaldos.First;
        vlRow := 2;
        while not qSaldos.EOF do
        begin
          //for vlCol := 0 to qSaldos.FieldCount - 1 do
          for vlCol := 0 to 50 do
          begin
            if not (vlCol in formulas) then
              ExcelWorksheetO.Cells.Item[vlRow, vlCol + 1].Value := qSaldos.fields[vlcol].AsString
            else
            begin
              if qSaldos.fields[vlcol].AsString = '0' then
                ExcelWorksheetO.Cells.Item[vlRow, vlCol + 1].Value := qSaldos.fields[vlcol].AsString
              else
              begin
                formula := qSaldos.fields[vlcol].AsString;
                {
                if vlCol = 16 then
                  formula := StringReplace(formula, 'SUMA','SUM',[rfReplaceAll]);
                if (vlCol = 36) or (vlCol = 40) or (vlCol = 41) or (vlCol = 46) then
                  formula := StringReplace(formula, 'SI','IF',[rfReplaceAll]);
                if vlCol = 32 then
                  formula := StringReplace(formula, 'REDONDEAR','ROUND',[rfReplaceAll]);
                }
                ExcelWorksheetO.Cells.Item[vlRow, vlCol + 1].Formula := formula;
              end;
            end;
          end;
          Application.ProcessMessages;
          Inc(vlRow);
          qSaldos.Next;
        end;

        ExcelWorkbookO.Save;
        ExcelApplicationO.Visible[LCID] := True;
        ExcelWorksheetO.Disconnect;
        ExcelWorkbookO.Disconnect;
        ExcelApplicationO.Disconnect;
        ExcelApplicationO.Quit;
      end
      //Genera archivo CSV
      else
      begin
        vlNomArch := directorio.Text + '\SDO_' + queryTot.FieldByName('ID_CREDITO').AsString + '.csv';
        AssignFile(vlArchivo, vlNomArch);
        Rewrite(vlArchivo);

        vlCadena := '';

        //Escribe el nombre de los encabezados
        qSaldos.First;
        for vlCol := 0 to qSaldos.FieldCount - 1 do
        begin
          vlCadena := vlCadena + '"' + qSaldos.fields[vlCol].FullName + '",';
        end;
        Writeln(vlArchivo, vlCadena);

        qSaldos.First;

        while not qSaldos.EOF do
        begin
          vlCadena := '';
          for vlCol := 0 to 50 do
          begin
              vlCadena := vlCadena + '"' + qSaldos.fields[vlcol].AsString + '",';
          end;
          vlCadena := vlCadena + '""';
          Writeln(vlArchivo, vlCadena);
          qSaldos.Next;
        end;

        CloseFile(vlArchivo);
      end;

    end;
    if chbMultiSelect.Checked then
    begin
      if i > DBGrid1.SelectedRows.Count - 1 then
        continue := false;
    end
    else
    begin
      queryTot.next;
      if queryTot.Eof then
        continue := false;
    end;
  if uno then
    break;  
  end;
  excel := true;
  ani.Terminate;
  uno := false;
end;

procedure TWSdoAgrMas.sbArchivoEntradaClick(Sender: TObject);
var
  Dir: String;
begin
  if SelectDirectory('Seleccione un directorio', 'Ruta', Dir) then
    directorio.Text := Dir;
end;

procedure TWSdoAgrMas.bbFiltrarClick(Sender: TObject);
begin
  queryTot.close;
  qDetalle.close;
  queryTot.Filtered:=false;
  qDetalle.Filtered:=false;

  if chbFilCred.Checked then
  begin
    queryTot.Filtered:=true;
    queryTot.Filter:='ID_CREDITO >= ' + edIdCreditoIni.TEXT + ' and ID_CREDITO <='+ edIdCreditoFin.TEXT;
  end;
  queryTot.OPEN;
  qDetalle.OPEN;
end;

procedure TWSdoAgrMas.chbFilCredClick(Sender: TObject);
begin
  if chbFilCred.Checked then
  begin
    queryTot.close;
    qDetalle.close;
    queryTot.Filtered:=true;

    queryTot.Filter:='ID_CREDITO >= ' + edIdCreditoIni.TEXT + ' and ID_CREDITO <='+ edIdCreditoFin.TEXT;

    queryTot.OPEN;
    qDetalle.OPEN;
  end
  else
  begin
    queryTot.close;
    qDetalle.close;
    queryTot.Filtered:=false;

    queryTot.OPEN;
    qDetalle.OPEN;
  end;
end;

procedure TWSdoAgrMas.btnGeneraUnoClick(Sender: TObject);
begin
  uno := true;
  btnGeneraBloqueClick(nil);
end;

procedure TWSdoAgrMas.BitBtn1Click(Sender: TObject);
begin
  excel := false;
  btnGeneraBloqueClick(nil);
end;


end.
