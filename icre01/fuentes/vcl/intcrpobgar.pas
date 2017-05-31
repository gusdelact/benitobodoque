 // Sistema         : CrPobGar
 // Fecha de Inicio : 09/11/2009
 // Función forma   : CrPobGar
 // Desarrollo por  : Copy and Paste.
 // Diseñado por    :
 // Comentarios     : Módulo que importa un archivo excel y con la información
 //                   de este actualiza la tabla de disposición CR_AM_DISPF
unit IntCrPobGar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm, DB, DBTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun, ComCtrls, IntDtPk, IntParamCre, Grids, Aligrid,
  Menus, Excel97, OleServer, IntCrActPa, Gauges, IntSGCtrl;


type
  TCrPobGar = class;

  TWCrPobGar = class(TForm)
    InterForma1:      TInterForma;
    ExcelWorkbookI:   TExcelWorkbook;
    ExcelWorksheetI:  TExcelWorksheet;
    ExcelApplicationI: TExcelApplication;
    Panel1:           TPanel;
    lbArchivoEntrada: TLabel;
    edArchivoEntrada: TEdit;
    sbArchivoEntrada: TSpeedButton;
    bbImportar:       TBitBtn;
    pAniBar:          TPanel;
    Label3:           TLabel;
    sgNoEncontrados: TSGCtrl;
    MsgPanel: TPanel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    Label5: TLabel;
    odArchivoEntrada: TOpenDialog;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure sbArchivoEntradaClick(Sender: TObject);
    procedure bbImportarClick(Sender: TObject);
    procedure edArchivoEntradaExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    package:  string; //Para fechas valor
    Objeto:   TCrPobGar;
    idSesion: string;

  end;

  TCrPobGar = class(TInterFrame)
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

implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrPobGar.Create(AOwner: TComponent);
begin
  inherited;
  StpName  := ' ';
  UseQuery := False;
  HelpFile := 'IntCrPobGar.Hlp';
  ShowMenuReporte := True;
end;

destructor TCrPobGar.Destroy;
begin
  inherited;
end;


function TCrPobGar.ShowWindow(FormaTipo: TFormaTipo): integer;
var
  W: TWCrPobGar;
begin
  W := TWCrPobGar.Create(Self);
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


function TCrPobGar.InternalBusca: boolean;
begin
  InternalBusca := False;
end;

 (***********************************************FORMA CR_CONC********************)
 (*                                                                              *)
 (*  FORMA DE CR_CONC                                                            *)
 (*                                                                              *)
 (***********************************************FORMA CR_CONC********************)

procedure TWCrPobGar.FormShow(Sender: TObject);
begin
  with Objeto do
  begin
    //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
    lbDempresa.Caption := ParamCre.EMPRESA.AsString;
    lbDfecha.Caption  := ParamCre.FECHA.AsString;
    lbDUsuario.Caption := ParamCre.USUARIO.AsString;
    lbDPerfil.Caption := ParamCre.PERFIL.AsString;
  end;
  Interforma1.MsgPanel := MsgPanel;
end;

procedure TWCrPobGar.FormDestroy(Sender: TObject);
begin
  //Borra la información de la tabla temporal si se generó una
end;

procedure TWCrPobGar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TWCrPobGar.InterForma1DespuesNuevo(Sender: TObject);
begin
  edArchivoEntrada.SetFocus;
end;

procedure TWCrPobGar.InterForma1DespuesModificar(Sender: TObject);
begin
  edArchivoEntrada.SetFocus;
end;

procedure TWCrPobGar.sbArchivoEntradaClick(Sender: TObject);
var
  correcto: boolean;
begin
  correcto := False;
  while not correcto and odArchivoEntrada.Execute do
  begin
    edArchivoEntrada.Text := odArchivoEntrada.FileName;
    if FileExists(odArchivoEntrada.FileName) then
      correcto := True
    else
    begin
      edArchivoEntrada.Text := '';
      ShowMessage('Reporte inexistente. Por favor seleccione un reporte existente');
    end;
  end;
end;


procedure TWCrPobGar.bbImportarClick(Sender: TObject);
var
  LCID: integer;
  fila: integer;
  filasg: integer;
  //Variables del reporte
  num_control_fira : String;
  ID_Credito_FIRA_normal  : String;
  status  : String;
  ID_credito_garantia_FIRA : String;
  ID_persona : String;
  ID_persona_FIRA : String;
  Importe_garantia : String;
  Monto_Recuperado : String;
  Saldo_garantia_FIRA_por_recuperar : String;
  Fecha_pago_garantia : String;
  Resultado_dictamen_FIRA : String;
  Cobertura_Nominal : String;
  Cobertura_Efectiva : String;

  valida: String;

  //Para la inserción a la base de datos
  vlSQL: string;
  vlQry : TQuery;
  vgQry : TQuery;

  //Para la barra de progreso
  ani: TAniBarThread;
  r: TRect;
begin
  if edArchivoEntrada.Text = '' then
    Exit;

  {* Inicia las variables para actualizar el medidor
   *}
  r := pAniBar.ClientRect;
  InflateRect(r, -pAniBar.BevelWidth, -pAniBar.BevelWidth);
  ani := TAniBarThread.Create(pAniBar, r, pAniBar.color, clBlue, 100);
  bbImportar.Enabled := False;
  Application.ProcessMessages;


  LCID := GetUserDefaultLCID;
  //Si el campo con el nombre del reporte está vacio lee la información de
  //de la base de datos y utiliza el reporte
  if edArchivoEntrada.Text <> '' then
  begin
    {* Instrucciones para el archivo excel de entrada
     *}
    ExcelApplicationI.Connect;
    // Hace a Excel invisible
    ExcelApplicationI.Visible[LCID] := False;
    ExcelApplicationI.DisplayAlerts[LCID] := False;

    // Abre el archivo
    ExcelApplicationI.Workbooks.Open(edArchivoEntrada.Text,
      EmptyParam, //UpdateLinks: OleVariant
      EmptyParam, //ReadOnly: OleVariant
      EmptyParam, //Format: OleVariant
      EmptyParam, //Password: OleVariant
      EmptyParam, //WriteResPassword: OleVariant
      EmptyParam, //IgnoreReadOnlyRecommended: OleVariant
      EmptyParam, //Orign: OleVariant
      EmptyParam, //Delimiter: OleVariant
      EmptyParam, //Editable: OleVariant
      EmptyParam, //Notify: OleVariant
      EmptyParam, //Converter: OleVariant
      EmptyParam, //AddToMru: OleVariant
      LCID
      );
    ExcelWorkbookI.ConnectTo(ExcelApplicationI.ActiveWorkbook);
    ExcelWorksheetI.ConnectTo(ExcelApplicationI.ActiveSheet as _Worksheet);
  end;

  //Establece valores de la tabla
  sgNoEncontrados.SG.ColCount := 4;
  sgNoEncontrados.SG.RowCount := 1;
  sgNoEncontrados.SG.Cells[3,0] := 'Número de control FIRA';
  vlSQL := 'select sysdate as "Número control FIRA" from dual';
  vgQry  := GetSQLQueryNoNil(vlSQL, Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, True);
  sgNoEncontrados.AddQry(vgQry,True,True,-1,-1,-1,True);

  {* Extrae la información del archivo Excel
   *}
  fila := 2;
  filasg := 1;
  try
    try
      //Para cada renglón con información
      //Actualiza todos los saldos de las garantías activas a cero
      vlSQL :=
        ' update CR_AM_DISPF set IMP_REC_GAR_FIRA = 0' +
        ' where B_GAR_VIGENTE = ''V''';
      RunSQL(vlSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True);

      valida := ExcelWorksheetI.Cells.Item[fila, 'K']; //Crédito
      while (valida <> '') do
      begin
        // Extrae la información del reporte del SIIOF
        num_control_fira := ExcelWorksheetI.Cells.Item[fila, 'C'];


        ID_credito_garantia_FIRA := ExcelWorksheetI.Cells.Item[fila, 'A'];
        status := ExcelWorksheetI.Cells.Item[fila, 'B'];
        ID_Credito_FIRA_normal := ExcelWorksheetI.Cells.Item[fila, 'D'];
        ID_persona_FIRA := ExcelWorksheetI.Cells.Item[fila, 'L'];
        Importe_garantia := ExcelWorksheetI.Cells.Item[fila, 'AD'];
        Monto_Recuperado := ExcelWorksheetI.Cells.Item[fila, 'AE'];
        Saldo_garantia_FIRA_por_recuperar := ExcelWorksheetI.Cells.Item[fila, 'AF'];
        Fecha_pago_garantia := ExcelWorksheetI.Cells.Item[fila, 'AH'];
        Resultado_dictamen_FIRA := ExcelWorksheetI.Cells.Item[fila, 'AO'];
        Cobertura_Nominal := ExcelWorksheetI.Cells.Item[fila, 'AS'];
        Cobertura_Efectiva := ExcelWorksheetI.Cells.Item[fila, 'AT'];

        if trim(Cobertura_Nominal) = '' then
          Cobertura_Nominal := '0';
        if trim(Cobertura_Efectiva) = '' then
          Cobertura_Efectiva := '0';

        //Actualiza dependiendo del valor de status
        if ((status = 'VI') or (status = 'RE')) then
        begin
          try
          //if num_control_fira = '1/037/010100/300928/08' then
          //  ID_persona := '0';

          //Actualiza todas las garantías de acuerdo al contenido del archivo
          vlSQL :=
            ' update CR_AM_DISPF set ' +
            ' ID_CRED_FIRA_GAR = ' + ID_credito_garantia_FIRA + ', ' +
            ' STATUS = ''' + status + ''', ' +
            ' ID_CRED_FIRA_N = ' + ID_Credito_FIRA_normal + ', ' +
            ' IMP_GAR_FIRA = ' + Importe_garantia + ', ' +
            ' IMP_MNTO_REC = ' + Monto_Recuperado + ', ' +
            ' IMP_REC_GAR_FIRA = ' + Saldo_garantia_FIRA_por_recuperar + ', ' +
            ' F_PAGO_GAR_FIRA = ' + SQLFecha(StrToDate(Fecha_pago_garantia)) + ', ' +
            ' RES_DICT = ''' + Resultado_dictamen_FIRA + ''', ' +
            ' PCT_COB_NOM = ' + Cobertura_Nominal + ', ' +
            ' PCT_COB_EFEC = ' + Cobertura_Efectiva + ', ' +
            ' B_GAR_VIGENTE = ''V'' ' +
            ' where NUM_CONTROL_FIRA = ''' + num_control_fira + '''';
          RunSQL(vlSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True);

          //Actualiza persona
          vlSQL :=
            ' select disp.id_credito, con.id_titular ' +
            ' from	 cr_am_dispf disp, ' +
            ' 			 cr_credito	 cre, ' +
            ' 			 contrato		 con ' +
            ' where	 disp.id_credito = cre.id_credito ' +
            ' and		 cre.id_contrato = con.id_contrato ' +
            ' and    disp.num_control_fira = ''' + num_control_fira + ''' ';
          GetSQLStr(vlSQL, objeto.Apli.DataBaseName, objeto.Apli.SessionName, 'id_titular', ID_persona, False);

          if id_persona <> '' then
          begin
            vlSQL :=
              ' update cr_am_persf ' +
              ' set    id_pers_fira = ' + ID_persona_FIRA +
              ' where  id_persona = ' + ID_persona;
            RunSQL(vlSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True);
          end;
          except
            on e: Exception do
            begin
              MessageDlg('Posible error en la linea. ' +
                           IntToStr(Fila) + ' - ' + num_control_fira, mtError, [mbOK], 0);
            end;

          end;

          //Verifica si el crédito existe
          vlSQL :=
            ' select count(num_control_fira) as num ' +
            ' from	 cr_am_dispf ' +
            ' where	 num_control_fira = ''' + num_control_fira + '''';
          vlQry := GetSQLQueryNoNil(vlSQL, objeto.Apli.DataBaseName, objeto.Apli.SessionName, False );

          if Assigned(vlQry) then
          begin
            try
            if vlQry.FieldByName('num').AsInteger = 0 then
            begin
              sgNoEncontrados.SG.Cells[3,filasg] := num_control_fira;
              inc(filasg);
            end;
            finally vlQry.Free;
            end;
          end;
        end;

        inc(fila);
        valida := ExcelWorksheetI.Cells.Item[fila, 'A']; //Crédito
      end;
      sgNoEncontrados.SG.RowCount := filasg;
      sgNoEncontrados.ColCount := 1;
      sgNoEncontrados.MaxRow := filasg+1;


    finally
      //detiene la barra de progreso
      bbImportar.Enabled := True;
      ani.Terminate;

      ExcelApplicationI.Visible[LCID] := True;
      ExcelWorksheetI.Disconnect;
      ExcelWorkbookI.Disconnect;
      ExcelApplicationI.Disconnect;

    end;

    //Si no existe error notifica al usuario que se generó el reporte
    //MessageDlg('Reporte generado correctamente', mtInformation, [mbOk], 0 );

  except
    on e: Exception do
    begin
      MessageDlg('No se importó completo el archivo.' +
        IntToStr(Fila) + e.Message, mtError, [mbOK], 0);
    end;
  end;

end;


procedure TWCrPobGar.edArchivoEntradaExit(Sender: TObject);
var
  vlMesg: string;
  vlSalida: boolean;
begin
  vlMesg := 'Debe definir el nombre del archivo';
  if (edArchivoEntrada.Text = '') then
    vlSalida := False;
  InterForma1.ValidaExit(edArchivoEntrada, vlSalida, vlMesg, True);

end;


end.
