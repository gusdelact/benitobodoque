// Sistema         : Clase de CR_CONC
// FECHA de Inicio : 09/11/2009
// Función forma   : Clase de CR_CONC
// Desarrollo por  : Copy AND Paste.
// Diseñado por    :
// Comentarios     :
Unit IntCrConc;

INTERFACE

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntParamCre, Grids, Aligrid,
Menus, Excel97, OleServer, IntCrActPa, Gauges, IntSGCtrl;

const

cHRepBuro = 1; //Último renglón del encabezado del reporte de E-Bureau
cHRepCartera = 10; //Último renglón del encabezado del reporte del conciliador

//Optimización del Conciliador --Lucia Vallejo 02-Ene-2012
OrdA           = Ord ('A');
xlWindows      = 2;
xlDelimited    = 1;
xlDoubleQuote  = 1;
xlPasteValues  = -4163;
xlNone         = -4142;
xlPasteFormats = -4122;

TYPE
 TCrConc= CLASS;

  TWCrConc=CLASS(TForm)
    InterForma1             : TInterForma;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    sdArchivoSalida: TSaveDialog;
    ExcelWorkbookI: TExcelWorkbook;
    ExcelWorksheetI: TExcelWorksheet;
    ExcelApplicationI: TExcelApplication;
    ExcelApplicationO: TExcelApplication;
    ExcelWorksheetO: TExcelWorksheet;
    ExcelWorkbookO: TExcelWorkbook;
    odArchivoEntrada: TOpenDialog;
    PageControl1: TPageControl;
    OpenDialog1: TOpenDialog;
    OpenDialog2: TOpenDialog;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    lbArchivoEntrada: TLabel;
    edArchivoEntrada: TEdit;
    sbArchivoEntrada: TSpeedButton;
    lbFCierre: TLabel;
    dtFCierre: TDateTimePicker;
    lbArchivoSalida: TLabel;
    edArchivoSalida: TEdit;
    sbArchivoSalida: TSpeedButton;
    cbFVal: TCheckBox;
    bbConciliar: TBitBtn;
    pAniBar: TPanel;
    buroSGDatos: TSGCtrl;
    bActInfo: TButton;
    carteraSGDATOS: TSGCtrl;
    Label1: TLabel;
    Label2: TLabel;
    PROCEDURE FormShow(Sender : TObject);
    PROCEDURE FormClose(Sender : TObject; var Action : TCloseAction);
    PROCEDURE FormDestroy(Sender : TObject);
    PROCEDURE InterForma1DespuesNuevo(Sender: TObject);
    PROCEDURE InterForma1DespuesModificar(Sender: TObject);
    PROCEDURE sbArchivoEntradaClick(Sender: TObject);
    PROCEDURE sbArchivoSalidaClick(Sender: TObject);
    PROCEDURE bbConciliarClick(Sender: TObject);
    PROCEDURE edArchivoSalidaExit(Sender: TObject);
    PROCEDURE edArchivoEntradaExit(Sender: TObject);
    PROCEDURE bActInfoClick(Sender: TObject);
    PRIVATE
    { PRIVATE declarations }
        PROCEDURE GeneraXLS (ArchivoASCII, Plantilla, ArchivoXLS, RangoDatos, RangoResumen: string; num_reg, num_acre, fila: INTEGER);
    PUBLIC
    { PUBLIC declarations }
    PACKAGE: String; //Para fechas valor
    Objeto : TCrConc;
    idSesion  : String;

END;
 TCrConc= CLASS(TInterFrame)
      PRIVATE
      PROTECTED
    //  PROCEDURE Notification( AComponent : TComponent; Operation : TOperation); override;
      PUBLIC
        { PUBLIC declarations }

        ParamCre                 : TParamCre;
        FUNCTION    InternalBusca : BOOLEAN; override;
        constructor CREATE( AOwner : TComponent ); override;
        destructor  Destroy; override;
        FUNCTION    ShowWindow(FormaTipo : TFormaTipo) : INTEGER; override;
      published
      END;

implementation
//Uses RepMon;
uses ComObj; //Optimización del Conciliador --Lucia Vallejo 02-Ene-2012

{$R *.DFM}

FUNCTION ObtenerValor (Campo: TField): String;
var StrStream: TStringStream;
BEGIN
    //Se verifica si el campo lo CONSIDERó como NORMAL
    IF NOT (Campo IS TBlobField) THEN
       //Accede al valor de la manera tradicional
       result := Campo.AsString
    ELSE
    BEGIN
    //En caso de ser BLOB asigna el contenido al stream como INTERMEDIARIO

        //Crea el stream
        StrStream := TStringStream.CREATE ('');

        try
          //Salva el contenido del BLOB en el stream
          (Campo AS TBlobField).SaveToStream (StrStream);

          //Se ubica al inicio del stream
          //StrStream.Position := 0;

          //Obtiene el contenido del stream en la variable
          result := StrStream.DataString;
        finally
          StrStream.Free;
        END;
    END;
END;

constructor TCrConc.CREATE( AOwner : TComponent );
BEGIN Inherited;
      StpName  := ' ';
      UseQuery := FALSE;
      HelpFile := 'IntCrConc.Hlp';
      ShowMenuReporte:=TRUE;
END;

Destructor TCrConc.Destroy;
BEGIN inherited;
END;


FUNCTION TCrConc.ShowWindow(FormaTipo:TFormaTipo):INTEGER;
var W : TWCrConc;
BEGIN
   W:=TWCrConc.CREATE(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftConsulta;
      W.InterForma1.ShowGrid := FALSE;
      W.InterForma1.ShowNavigator := FALSE;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   END;
END;


FUNCTION TCrConc.InternalBusca:BOOLEAN;
BEGIN InternalBusca := FALSE;
END;

(***********************************************FORMA CR_CONC********************)
(*                                                                              *)
(*  FORMA DE CR_CONC                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_CONC********************)

PROCEDURE TWCrConc.FormShow(Sender: TObject);
var
     vlQry : TQuery;
BEGIN
  WITH Objeto DO
  BEGIN
    //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
    lbDempresa.Caption := ParamCre.EMPRESA.AsString;
    lbDfecha.Caption   := ParamCre.FECHA.AsString;
    lbDUsuario.Caption := ParamCre.USUARIO.AsString;
    lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

    //Despliega la última FECHA de cierre utilizada
    vlQry := GetSqlQueryNoNil( 'select to_date(desc_clave,''YYYYMMDD'') as fecha from BC_CON_CAT_DATA where cve_con_gpo_cat = ''CAT_CONC_BURO'' and cve_clave = ''FECHA''',
                             Apli.DataBaseName,Apli.SessionName,TRUE);
    IF Assigned(vlQry) THEN
      dtFCierre.DATE := vlQry.FieldByName('fecha').AsDateTime
    ELSE
      dtFCierre.DATE := DATE;
  END;

  idSesion := '-1';

END;

PROCEDURE TWCrConc.FormDestroy(Sender: TObject);
BEGIN
  //Borra la información de la TABLA TEMPORAL si se generó una
  IF idSesion <> '-1' THEN
    RunSQL( 'delete from BC_CON_SDO_B_TMP where id_sesion = '+idSesion
           , Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, FALSE);
END;

PROCEDURE TWCrConc.FormClose(Sender: TObject; var Action: TCloseAction);
BEGIN Action := caFree;
END;

PROCEDURE TWCrConc.InterForma1DespuesNuevo(Sender: TObject);
BEGIN
   edArchivoEntrada.SetFocus;
END;

PROCEDURE TWCrConc.InterForma1DespuesModificar(Sender: TObject);
BEGIN edArchivoEntrada.SetFocus;
END;

PROCEDURE TWCrConc.sbArchivoEntradaClick(Sender: TObject);
var correcto : BOOLEAN;
BEGIN
  correcto := FALSE;
  WHILE NOT correcto AND odArchivoEntrada.EXECUTE DO
  BEGIN
    edArchivoEntrada.Text := odArchivoEntrada.FileName;
    IF FileExists(odArchivoEntrada.FileName)
    THEN
      correcto := TRUE
    ELSE
    BEGIN
      edArchivoEntrada.Text := '';
      ShowMessage('Reporte inexistente. Por favor seleccione un reporte existente');
    END;
  END;
END;

PROCEDURE TWCrConc.sbArchivoSalidaClick(Sender: TObject);
BEGIN
  IF sdArchivoSalida.EXECUTE THEN
  BEGIN
    edArchivoSalida.Text := sdArchivoSalida.FileName;
    IF FileExists(sdArchivoSalida.FileName) THEN
    BEGIN
      IF MessageDlg('Reporte existente. ¿Desea sobreescribirlo?',
         mtConfirmation, [mbYes, mbNo], 0) <> mrYes
      THEN edArchivoSalida.Text := '';
    END;
  END
  ELSE
    edArchivoSalida.Text := '';
END;

PROCEDURE TWCrConc.bbConciliarClick(Sender: TObject);
var
  LCID : INTEGER;
  fila : INTEGER;
  plantilla : String;
  //Variables del reporte de Buró
  credito : String;
  acreditado, nombre, paterno, materno : String;
  importe_credito : REAL;
  importe_credito_cartera : REAL;
  importe_credito_dif : REAL;
  saldo_actual_buro : REAL;
  saldo_impagado_buro : REAL;
  saldo_con_gar : REAL;
  garantias : REAL;
  saldo_actual_cartera : REAL;
  saldo_impagado_cartera : REAL;
  saldo_actual_dif : REAL;
  saldo_impagado_dif : REAL;
  TIPO_CONTRATO,
  tipo_cliente,
  status_registro,
  clave_observacion : String;
  descripcion : String;
  valida : INTEGER;
  mes, anho : String;
  saldo_actual_bc : REAL;
  saldo_vencido_bc : REAL;
  saldo_comparar : REAL;
  imp_int_con : REAL;
  imp_int_bc : REAL;

  //Para el conteo
  num_reg : INTEGER;
  num_acre : INTEGER;

  //Para la lista de todos los créditos de cartera
  lCredCart : TList;

  //Para la inserción a la base de datos
  vlSQL    : String;

  //Para el PROCESO
  vlStp : TStoredProc;
  vlQry : TQuery;

  //Para la barra de progreso
  ani : TAniBarThread;
  r : TRect;

  //Para indicar en el reporte si hay diferencias en Saldos
  mensaje        : String;
  mensaje2       : String;
  mensaje3       : String;
  banDiferencias : BOOLEAN;
  banFactoraje   : BOOLEAN;
  cve_orig       : String;
  cve_agrupacion : String;
  f_tras_ven     : String;
  cve_producto   : String;
  plazo          : INTEGER;
  contieneFact   : INTEGER;
  cve_frec_pagos : INTEGER;

  //Para optimización del Conciliador
  F : TextFile;
  lineaActual : String;
  path_file : String;

BEGIN

  //IF (edArchivoEntrada.Text = '') OR (edArchivoSalida.Text = '') THEN //MAGV 20100109
  IF edArchivoSalida.Text = '' THEN
  BEGIN
    ShowMessage('Debe definir al menos el nombre del reporte de salida');
    EXIT;
  END;

  {* Inicia las variables para actualizar el medidor
   *}
  r := pAniBar.ClientRect;
  InflateRect(r, - pAniBar.BevelWidth, - pAniBar.BevelWidth);
  ani := TAniBarThread.CREATE(pAniBar, r, pAniBar.color, clBlue, 100);
  bbConciliar.Enabled := FALSE;
  Application.ProcessMessages;

  //Define los parámetros básicos para el llamado
  vlStp := TStoredProc.CREATE(Self);
  vlStp.DatabaseName:= Objeto.Apli.DatabaseName;
  vlStp.SessionName:= Objeto.Apli.SessionName;

  LCID := GetUserDefaultLCID;
  //Si el campo con el nombre del reporte está vacio lee la información de
  //de la base de datos y utiliza el reporte
  IF edArchivoEntrada.text <> '' THEN
  BEGIN
    {* Instrucciones para el archivo excel de entrada
     *}
    ExcelApplicationI.CONNECT;
    // Hace a Excel invisible
    ExcelApplicationI.Visible[LCID] := FALSE;
    ExcelApplicationI.DisplayAlerts[LCID] := FALSE;

    // Abre el archivo
    ExcelApplicationI.Workbooks.OPEN(edArchivoEntrada.Text,
                         EmptyParam, //UpdateLinks: OleVariant
                         EmptyParam, //ReadOnly: OleVariant
                         EmptyParam, //Format: OleVariant
                         EmptyParam, //PASSWORD: OleVariant
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
    ExcelWorksheetI.ConnectTo(ExcelApplicationI.ActiveSheet AS _Worksheet);
  END;

  {* Instrucciones para el archivo excel de salida
   *}
  //Extre el nombre y ubicación de la plantilla
  vlQry := GetSqlQueryNoNil( ' select desc_clave from BC_CON_CAT_DATA where cve_con_gpo_cat = ''CAT_CONC_BURO'' and cve_clave = ''RUTA''',
                             Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,TRUE);

  IF Assigned(vlQry) THEN
    plantilla := vlQry.FieldByName('desc_clave').AsString;

  {Por optimización 30-Ene-2012 Lucia Vallejo
  // Abre el archivo
  ExcelApplicationO.CONNECT;
  //Si existe la plantilla la utiliza
  try
    ExcelWorkbookO.ConnectTo(ExcelApplicationO.Workbooks.ADD(plantilla,0));
  EXCEPT
  ON E: EXCEPTION DO
    ExcelWorkbookO.ConnectTo(ExcelApplicationO.Workbooks.ADD(EmptyParam, 0));
  END;


  ExcelWorksheetO.ConnectTo(ExcelApplicationO.ActiveSheet AS _Worksheet);
  // Hace a Excel invisible
  ExcelApplicationO.Visible[LCID] := FALSE;
  ExcelApplicationO.DisplayAlerts[LCID] := FALSE;

  //Guarda con el nombre definido la plantilla en formate de excel
  ExcelWorkbookO.SaveAs(edArchivoSalida.Text,
                            NULL,
                            NULL,
                            NULL,
                            FALSE,
                            FALSE,
                            xlNoChange,
                            xlUserResolution,
                            FALSE,
                            NULL,
                            NULL,
                            0
                            );
  Por optimización 30-Ene-2012 Lucia Vallejo}
  
  //Crea el archivo ASCII donde se descargarán los datos de los créditos
  path_file := 'C:\Temp\DATOS_CONCILIADOR.txt';
  AssignFile (F, path_file);
  REWRITE (F);
  
  //Extrae la información y la inserta en una TABLA
  fila := 1;
  try
    {* Extrae la información del reporte e-Bureau en excel
     *}
    try
      //Genera el nombre de una TABLA TEMPORAL
      Randomize;
      idSesion := IntToStr(RANDOM(10000));

      //Si el campo con el nombre del reporte está vacio lee la información de
      //de la base de datos
      IF edArchivoEntrada.text = '' THEN
      BEGIN

        //Copia la información de las tablas de buró a la TABLA concentradora
        vlSQL := ' insert into BC_CON_SDO_B_TMP (id_credito, imp_credito, imp_vig_buro, imp_imp_buro, nombre_acreditado,cve_observacion, id_sesion) ' +
                 ' select buro.* ' +
                 '   from ( ' +
                 '         select buro.numero_cuenta, buro.saldo_inicial, buro.saldo_actual, buro.saldo_vencido, nombre_acreditado, buro.clave_observacion, ' + idSesion + ' as sesion ' +
                 '           from ( select numero_cuenta, ' +
                 '                         saldo_inicial, ' +
                 '                         saldo_actual, ' +
                 '                         saldo_vencido, ' +
                 '                         clave_observacion ' +
                 '                    from bc_acc_e_x_dat@opnportal ' +
                 '                   where fecha_reporte = ' + SQLFecha(dtFCierre.DATE) +
                 '                ) buro, ' +
                 '                ( select id_credito, ' +
                 '                         per.nombre as nombre_acreditado ' +
                 '                    from ( select id_credito, ' +
                 '                                  id_contrato ' +
                 '                             from cr_credito ' +
                 '                            union ' +
                 '                           select id_credito, ' +
                 '                                  id_contrato ' +
                 '                             from cre_credito ) creds, ' +
                 '                         persona per, ' +
                 '                         contrato con ' +
                 '                   where creds.id_contrato = con.id_contrato and con.id_titular = per.id_persona ) credacre ' +
                 '  where buro.numero_cuenta = credacre.id_credito(+) ' +
                 '  ) buro ' +
                 '  left outer join cr_credito  cre on buro.numero_cuenta   = cre.id_credito ' +
                 '  left outer join cr_contrato con on cre.id_contrato      = con.id_contrato ' +
                 '  left outer join cr_producto pro on con.cve_producto_cre = pro.cve_producto_cre ' +
                 ' where cre.id_contrato is null ' +
                 '    or not (   (con.cve_producto_cre like ''PPI%'' OR con.cve_producto_cre LIKE ''%PPI'') ' +
	             '            and pro.cve_tipo_cred_bc = 1606)' ;

        RunSQL(vlSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, FALSE);

        vlSQL := ' insert into BC_CON_SDO_B_TMP (id_credito, imp_credito, imp_vig_buro, imp_imp_buro, nombre_acreditado, cve_observacion, id_sesion) ' +
                 ' select buro.* ' +
                 '   from ( ' +
                 '         select buro.numero_cuenta, buro.credito_maximo, buro.saldo_actual, buro.saldo_vencido, nombre_acreditado, buro.clave_observacion, ' + idSesion + ' as sesion ' +
                 '           from ( select numero_cuenta, ' +
                 '                         credito_maximo, ' +
                 '                         saldo_actual, ' +
                 '                         saldo_vencido, ' +
                 '                         clave_observacion ' +
                 '                    from bc_acc_p_x_dat@opnportal ' +
                 '                   where fecha_reporte = ' + SQLFecha(dtFCierre.DATE) +
                 '                ) buro, ' +
                 '                ( select id_credito, ' +
                 '                         per.nombre as nombre_acreditado ' +
                 '                    from ( select id_credito, ' +
                 '                                  id_contrato ' +
                 '                             from cr_credito ' +
                 '                            union ' +
                 '                           select id_credito, ' +
                 '                                  id_contrato ' +
                 '                             from cre_credito ) creds, ' +
                 '                persona per, ' +
                 '                contrato con ' +
                 '          where creds.id_contrato = con.id_contrato and con.id_titular = per.id_persona ) credacre ' +
                 '  where buro.numero_cuenta = credacre.id_credito(+) ' +
                 '  ) buro ' +
                 '  left outer join cr_credito  cre on buro.numero_cuenta   = cre.id_credito ' +
                 '  left outer join cr_contrato con on cre.id_contrato      = con.id_contrato ' +
                 '  left outer join cr_producto pro on con.cve_producto_cre = pro.cve_producto_cre ' +
                 ' where cre.id_contrato is null ' +
                 '    or not (   (con.cve_producto_cre like ''PPI%'' OR con.cve_producto_cre LIKE ''%PPI'') ' +
	             '            and pro.cve_tipo_cred_bc = 1606)' ;

        RunSQL(vlSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, FALSE);

      END //IF edArchivoEntrada campo del reporte vacio
      ELSE
      BEGIN
        //Si el campo con el nombre NO está vacio utiliza el reporte
        //Para cada rengón con información
        valida := ExcelWorksheetI.Cells.Item[cHRepBuro+fila,'A']; //Crédito
        WHILE (valida <> 0) DO
        BEGIN

          // Extrae la información del reporte de e-Bureau
          credito := ExcelWorksheetI.Cells.Item[cHRepBuro+fila,'A'];

          nombre := ExcelWorksheetI.Cells.Item[cHRepBuro+fila,'E'];
          paterno := ExcelWorksheetI.Cells.Item[cHRepBuro+fila,'F'];
          materno := ExcelWorksheetI.Cells.Item[cHRepBuro+fila,'G'];
          acreditado := nombre + ' ' + paterno + ' ' + materno;
          importe_credito := ExcelWorksheetI.Cells.Item[cHRepBuro+fila,'AV'];
          saldo_actual_buro := ExcelWorksheetI.Cells.Item[cHRepBuro+fila,'BA'];
          saldo_impagado_buro := ExcelWorksheetI.Cells.Item[cHRepBuro+fila,'BB'];
          TIPO_CONTRATO := ExcelWorksheetI.Cells.Item[cHRepBuro+fila,'AE'];
          tipo_cliente := ExcelWorksheetI.Cells.Item[cHRepBuro+fila,'BS'];
          status_registro := ExcelWorksheetI.Cells.Item[cHRepBuro+fila,'CR'];
          clave_observacion := ExcelWorksheetI.Cells.Item[cHRepBuro+fila,'BO'];


          vlSQL := ' insert into BC_CON_SDO_B_TMP (id_credito, nombre_acreditado, imp_credito, imp_vig_buro, imp_imp_buro, cve_observacion, tipo_contrato, tipo_cliente, cve_status_reg, id_sesion) ' +
                   ' values (' +
                   credito + ', ' +
                   '''' + acreditado + ''', ' +
                   FloatToStr(importe_credito) + ', ' +
                   FloatToStr(saldo_actual_buro) + ', ' +
                   FloatToStr(saldo_impagado_buro) + ', ' +
                   '''' + clave_observacion + ''', ' +
                   '''' + TIPO_CONTRATO + ''', ' +
                   '''' + tipo_cliente + ''', ' +
                   '''' + status_registro + ''', ' +
                   '''' + idSesion + ''') ';


          RunSQL (vlSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, TRUE);

          fila := fila + 1;
          valida := ExcelWorksheetI.Cells.Item[cHRepBuro+fila,'A']; //Crédito
        END;
      END; //ELSE edArchivoEntrada campo del reporte NO vacio

      //Carga los créditos que estan en cartera que NO estan en buró
      //independientemente del método de carga original
      vlSQL := ' insert into BC_CON_SDO_B_TMP ( id_credito, nombre_acreditado,id_sesion ) ' +
               ' select creditos.* ' +
               '   from ( ' +
               '         select resta.id_credito, ' +
               '                nombre as nombre_acreditado, ' +
               '                ' + idSesion + ' as sesion ' +
               '           from ( select conso.id_credito ' +
               '                    from ( select distinct ( id_credito ) ' +
               '                             from cr_con_adeudo_sdo ' +
               '                            where f_cierre between ' + SQLFecha(StrToDate('01/'+FormatDateTime('mm/yy', dtFCierre.DATE))) + ' and ' + SQLFecha(dtFCierre.DATE) + ' ) conso, ' +
               '                         ( select id_credito, ' +
               '                                  b_envia_bnc ' +
               '                             from cr_credito ' +
               '                            where b_envia_bnc = ''V'' ' +
               '                            union ' +
               '                           select id_credito, ' +
               '                                  b_envia_bnc ' +
               '                             from cre_credito ' +
               '                            where b_envia_bnc = ''V'' ) cred ' +
               '                   where cred.id_credito = conso.id_credito ' +
               '                   minus ' +
               '                ( select to_number ( numero_cuenta ) as id_credito ' +
               '                    from bc_acc_p_x_dat@opnportal ' +
               '                   where fecha_reporte = ' + SQLFecha(dtFCierre.DATE) +
               '                   union ' +
               '                  select to_number ( numero_cuenta ) as id_credito ' +
               '                    from bc_acc_e_x_dat@opnportal ' +
               '                   where fecha_reporte = ' + SQLFecha(dtFCierre.DATE) + ' ) ) resta, ' +
               '                ( select id_credito, ' +
               '                         nombre ' +
               '                    from ( select id_credito, ' +
               '                                  id_contrato ' +
               '                             from cr_credito ' +
               '                            union ' +
               '                           select id_credito, ' +
               '                                  id_contrato ' +
               '                             from cre_credito ) creds, ' +
               '                         persona per, ' +
               '                         contrato con ' +
               '                   where creds.id_contrato = con.id_contrato and con.id_titular = per.id_persona ) crednom ' +
               '          where  resta.id_credito = crednom.id_credito(+) ' +
               '          ) creditos ' +
               '  left outer join cr_credito  cre on creditos.id_credito = cre.id_credito ' +
               '  left outer join cr_contrato con on cre.id_contrato      = con.id_contrato ' +
               '  left outer join cr_producto pro on con.cve_producto_cre = pro.cve_producto_cre ' +
               ' where cre.id_contrato is null ' +
               '    or not (   (con.cve_producto_cre like ''PPI%'' OR con.cve_producto_cre LIKE ''%PPI'') ' +
               '            and pro.cve_tipo_cred_bc = 1606)' ;


      RunSQL(vlSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, FALSE);

      //Ejecuta el procedimiento que calcula los valores a conciliar
      //Define los parámetros para el llamado
      { //Utiliza el nuevo paquete
      IF NOT cbFVal.Checked THEN
        PACKAGE := 'PKGBUROCFA'
      ELSE
        PACKAGE := 'PKGBUROCFA_FVAL';
      }
      PACKAGE := 'PKGBUROCONSO';
      vlStp.StoredProcName:= PACKAGE + '.STP_BURO_CONC_T';
      WITH vlStp DO
      BEGIN

        Params.CLEAR;
        Params.CreateParam( ftString,  'peSesion',       ptInput);
        Params.CreateParam( ftDate,    'peF_CIERRE',     ptInput);
        Params.CreateParam( ftFloat,   'psRESULTADO',    ptOutput);
        Params.CreateParam( ftString,  'psTX_RESULTADO', ptOutput);

        PREPARE;

        ParamByName('peF_CIERRE').AsDate := dtFCierre.DATE;
        ParamByName('peSesion').AsString := idSesion;
        ExecProc;
      END;

      {Por optimización 30-Ene-2012 Lucia Vallejo
      mes := 'DESCONOCIDO';
      anho := '0';
      //Mes que se utiliza en el encabezado
      vlQry := GetSqlQueryNoNil( 'select to_char ( ' + SQLFecha(dtFCierre.DATE) + ', ''MONTH'', ''NLS_DATE_LANGUAGE=SPANISH'') as mes , ' +
                                 'to_char ( ' + SQLFecha(dtFCierre.DATE) + ', ''YYYY'') as anho from dual'
                                 ,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,TRUE);
      IF Assigned(vlQry) THEN
      BEGIN
        mes := vlQry.FieldByName('MES').AsString;
        anho := vlQry.FieldByName('ANHO').AsString;
      END;
      Por optimización 30-Ene-2012 Lucia Vallejo}

      //Formato del encabezado
      {
      ExcelWorksheetO.RANGE['A3','A3'].HorizontalAlignment :=  xlCenter
      WITH ExcelWorksheetO.RANGE['A3','A3'].Font DO
      BEGIN
        SIZE := 14;
        FontStyle := 'Bold';
        NAME := 'Calibri';
      END;
      }
      {Por optimización 30-Ene-2012 Lucia Vallejo
      ExcelWorksheetO.Cells.Item[3,'A'] := 'CIFRAS CORRESPONDIENTES AL MES DE ' + mes + ' DE ' + anho;

      //Encabezados de las columnas ocultas
      ExcelWorksheetO.Cells.Item[10,'P'] := 'Tipo Contrato';
      ExcelWorksheetO.Cells.Item[10,'Q'] := 'Tipo Cliente';
      ExcelWorksheetO.Cells.Item[10,'R'] := 'Status Registro';

      //WITH ExcelWorksheetO.RANGE['P10','R10'].Font DO
      WITH ExcelWorksheetO.RANGE['P10','Y10'].Font DO
      BEGIN
        SIZE := 9;
        FontStyle := 'Bold';
        NAME := 'Calibri';
      END;
      Por optimización 30-Ene-2012 Lucia Vallejo}
       
      //Modificado por: Lucia Vallejo 15-Dic-2011
      //Se tuvo que hacer la separación de la información del campo DESC_CLAVE debido a que marcaba error de BLOB
      vlSQL := ' select   bc.*, ' +
               '          cat.desc_clave1, ' +
               '          cat.desc_clave2, ' +
               '          cred.imp_dispuesto as importe_credito_cartera, ' +
               '          BCL.NUMERO_CUENTA, ' +
               '          BCL.SALDO_ACTUAL, ' +
               '          BCL.SALDO_VENCIDO, ' +
               '          BCL.CVE_ORIGEN_INFO, ' +
               '          BCL.IMP_INT_IMP, ' +
               '          BCL.IMP_INTERES, ' +
               '          BCL.CVE_AGRUPACION, ' +
               '          BCL.F_TRASPASO_VEN, ' +
               '          BCL.F_TRASPASO_VENC, ' +
               '          BCL.CVE_PRODUCTO_CRE, ' +
               '          BCL.PLAZO, ' +
               '          BCL.CLAVE_FRECUENCIA_PAGOS_NUM ' +
               ' from     BC_CON_SDO_B_TMP bc, ' +
               '          ( select cve_clave, ' +
               '                   SUBSTR (desc_clave, 1, 100) desc_clave1, ' +
               '                   SUBSTR (desc_clave, 101, 100) desc_clave2 ' +
               '           from   bc_con_cat_data ' +
               '           where  cve_con_gpo_cat = ''CAT_CVE_OBS'' ) cat, ' +
               '          ( select id_credito, ' +
               '                   cre.imp_credito as imp_dispuesto ' +
               '           from   cr_credito cre, ' +
               '                  cr_contrato con ' +
               '           where  cre.id_contrato = con.id_contrato ' +
               '           union ' +
               '           select id_credito, ' +
               '                  cre.imp_credito as imp_dispuesto ' +
               '           from   cre_credito cre, ' +
               '                  cre_contrato con ' +
               '           where  cre.id_contrato = con.id_contrato ) cred, ' +
               '          (SELECT BC.NUMERO_CUENTA, ' +
               '                  BC.SALDO_ACTUAL, ' +
               '                  BC.SALDO_VENCIDO, ' +
               '                  BC.PLAZO, ' +
               '                  BC.CLAVE_FRECUENCIA_PAGOS_NUM, ' +
               '                  CCAC.Cve_Origen_Info, ' +
               '                  CCAS.Imp_Int_Imp, ' +
               '                  CRINT.IMP_INTERES, ' +
               '                  CRC.CVE_AGRUPACION, ' +
               '                  CPD.F_TRASPASO_VEN, ' +
               '		          CHC.F_TRASPASO_VENC, ' +
               '                  CCTO.CVE_PRODUCTO_CRE ' +
               '             FROM SYN_BC_LAYOUT_OPNPORTAL      BC ' +
               '             LEFT OUTER JOIN CR_CON_ADEU_CLTV  CCAC  ON (BC.Numero_Cuenta    = CCAC.ID_Credito AND ' +
               '                                                         CCAC.ID_Reg_Vigente = 1) ' +
               '             LEFT OUTER JOIN CR_CON_ADEUDO_SDO CCAS  ON (BC.Numero_Cuenta    = CCAS.ID_Credito AND ' +
               '                                                         CCAS.F_Cierre       = ' + SQLFecha(dtFCierre.DATE) + ') ' +
               '             LEFT OUTER JOIN CRE_PROV_DIARIA   CPD   ON (BC.Numero_Cuenta    = CPD.ID_CREDITO  AND ' +
               '                                                         CPD.F_Provision     = ' + SQLFecha(dtFCierre.DATE) + ') ' +
               '             LEFT OUTER JOIN CR_HISTO_CRED     CHC   ON (BC.Numero_Cuenta    = CHC.ID_CREDITO  AND ' +
               '                                                         CHC.F_CIERRE        = ' + SQLFecha(dtFCierre.DATE) + ') ' +
               '             LEFT OUTER JOIN CR_REG_CARTERA    CRC   ON (CCAC.Cve_Cat_Minimo = CRC.Cve_Cat_Minimo) ' +
               '             LEFT OUTER JOIN (SELECT CRE.ID_CREDITO, ' +
	       	   '				     	             CTO.CVE_PRODUCTO_CRE ' +
  	       	   '								FROM SYN_BC_LAYOUT_OPNPORTAL BCL ' +
  	       	   '								JOIN CR_CREDITO  CRE ON BCL.NUMERO_CUENTA = CRE.ID_CREDITO ' +
  	       	   '								JOIN CR_CONTRATO CTO ON CRE.ID_CONTRATO   = CTO.ID_CONTRATO ' +
	       	   '			                 )  CCTO ON CCTO.ID_CREDITO = BC.NUMERO_CUENTA ' +
               '             LEFT OUTER JOIN (SELECT ID_CREDITO, ' +
               '                                     SUM ((IMP_INTERES_PER - IMP_PAGADO - IMP_BENEF_BCO - IMP_BENEF_GOB) + (IMP_IVA - IMP_IVA_PAGADO)) IMP_INTERES ' +
               '                                FROM CRE_INTERES CRINT ' +
               '                               WHERE EXISTS (SELECT NUMERO_CUENTA ' +
               '                                               FROM SYN_BC_LAYOUT_OPNPORTAL ' +
               '                                              WHERE NUMERO_CUENTA = CRINT.ID_CREDITO) ' +
               '                                 AND F_PROG_PAGO <= ' + SQLFecha(dtFCierre.DATE) + ' ' +
               '                                 AND IMP_INTERES_PER - IMP_PAGADO - IMP_BENEF_BCO - IMP_BENEF_GOB > 0 ' +
               '                                 AND SIT_INTERES = ''IM''' +
               '                               GROUP BY ID_CREDITO ' +
               '                              )                CRINT ON (CCAC.Cve_Origen_Info IS NOT NULL AND ' +
               '                                                         CCAC.Cve_Origen_Info = ''C''       AND ' +
               '                                                           BC.Numero_Cuenta   = CRINT.ID_CREDITO) ' +
               '            GROUP BY BC.NUMERO_CUENTA, BC.SALDO_ACTUAL, BC.SALDO_VENCIDO, BC.PLAZO, BC.CLAVE_FRECUENCIA_PAGOS_NUM, BC.CCAC.Cve_Origen_Info, ' +
               '                     CCAS.Imp_Int_Imp, CRINT.IMP_INTERES, CRC.CVE_AGRUPACION, CPD.F_TRASPASO_VEN, CHC.F_TRASPASO_VENC, CCTO.CVE_PRODUCTO_CRE ' +
               '          ) BCL' +
               ' where    trim ( bc.cve_observacion ) = cat.cve_clave(+) and bc.id_credito = cred.id_credito(+) AND BC.ID_CREDITO = BCL.NUMERO_CUENTA (+)' +
               ' and      id_sesion = ' + idSesion +
               ' order by bc.id_credito ';

      vlQry := GetSqlQueryNoNil( vlSQL,
                                 Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,TRUE);

      IF Assigned(vlQry) THEN
      BEGIN
        fila := 2;
        //Agregado por: 24-Oct-2011 Lucia Vallejo
        vlQry.LAST;
        vlQry.FIRST;
        //
        WHILE NOT vlQry.Eof DO
        BEGIN
          //Inicialización de variables
          mensaje          := '';
          mensaje2         := '';
          banFactoraje     := FALSE;
          saldo_actual_bc  := 0;
          saldo_vencido_bc := 0;
          imp_int_con      := 0;
          imp_int_bc       := 0;
          plazo            := 0;

          credito                 := vlQry.FieldByName('ID_CREDITO').AsString;
          acreditado              := vlQry.FieldByName('NOMBRE_ACREDITADO').AsString;
          importe_credito_cartera := vlQry.FieldByName('IMPORTE_CREDITO_CARTERA').AsFloat;
          importe_credito         := vlQry.FieldByName('IMP_CREDITO').AsFloat;
          saldo_actual_buro       := vlQry.FieldByName('IMP_VIG_BURO').AsFloat;
          saldo_impagado_buro     := ROUND(vlQry.FieldByName('IMP_IMP_BURO').AsFloat);
          saldo_con_gar           := vlQry.FieldByName('IMP_CON_GAR').AsFloat;
          saldo_actual_cartera    := vlQry.FieldByName('IMP_VIG_CARTERA').AsFloat;
          garantias               := saldo_actual_cartera - saldo_con_gar;
          saldo_impagado_cartera  := {ROUND}(vlQry.FieldByName('IMP_IMP_CARTERA').AsFloat);
          // ...calculos extra
          importe_credito_dif     := ROUND(importe_credito_cartera) - ROUND(importe_credito);
          saldo_actual_dif        := ROUND(saldo_actual_cartera) - ROUND(saldo_actual_buro);
          saldo_impagado_dif      := ROUND(saldo_impagado_cartera) - ROUND(saldo_impagado_buro);
          clave_observacion       := vlQry.FieldByName('cve_observacion').AsString;
          //Se tuvo que hacer la separación de la información del campo DESC_CLAVE debido a que marcaba error de BLOB  20-Oct-2011 Lucia Vallejo
          descripcion             := (vlQry.FieldByName('desc_clave1').AsString + vlQry.FieldByName('desc_clave2').AsString);
          //columnas ocultas
          TIPO_CONTRATO           := vlQry.FieldByName('TIPO_CONTRATO').AsString;
          tipo_cliente            := vlQry.FieldByName('TIPO_CLIENTE').AsString;
          status_registro         := vlQry.FieldByName('CVE_STATUS_REG').AsString;

          //BLOQUE DE CODIGO AGREGADO PARA INDICAR EN EL REPORTE QUE CREDITOS PRESENTAN DIFERENCIAS (Lucia Vallejo 19-Oct-2011)
          //Información del BC_LAYOUT
          saldo_actual_bc         := vlQry.FieldByName('SALDO_ACTUAL').AsFloat;
          saldo_vencido_bc        := vlQry.FieldByName('SALDO_VENCIDO').AsFloat;
          imp_int_con             := vlQry.FieldByName('IMP_INT_IMP').AsFloat;
          imp_int_bc              := vlQry.FieldByName('IMP_INTERES').AsFloat;
          cve_orig                := vlQry.FieldByName('CVE_ORIGEN_INFO').AsString;
          cve_producto            := vlQry.FieldByName('CVE_PRODUCTO_CRE').AsString;
          plazo                   := vlQry.FieldByName('PLAZO').AsInteger;
          cve_frec_pagos          := vlQry.FieldByName('CLAVE_FRECUENCIA_PAGOS_NUM').AsInteger;

          contieneFact            := Pos('FAC', cve_producto);

          IF cve_orig = 'I' THEN
             f_tras_ven           := vlQry.FieldByName('F_TRASPASO_VENC').AsString
          ELSE IF cve_orig = 'C' THEN
             f_tras_ven           := vlQry.FieldByName('F_TRASPASO_VEN').AsString
          ELSE
             f_tras_ven           := '';

          saldo_comparar := saldo_actual_bc + saldo_impagado_cartera;

          IF NOT (vlQry.FieldByName ('NUMERO_CUENTA').IsNull) THEN
          BEGIN
              IF (saldo_actual_bc <> saldo_actual_cartera) AND (saldo_vencido_bc <> saldo_impagado_cartera) THEN
               BEGIN
                  mensaje := 'Hay diferencia en el Saldo Actual y Saldo Vencido';
                  banDiferencias := TRUE;
                  IF ABS (saldo_comparar - saldo_actual_cartera) < 0.01 THEN
                      mensaje := 'La suma del Saldo Actual de BCL más el Saldo Vencido del Conciliador, es igual al Saldo Actual del Conciliador. Hay diferencia en el Saldo Vencido'
               END
              ELSE IF (saldo_actual_bc <> saldo_actual_cartera) THEN
               BEGIN
                  mensaje := 'Hay diferencia en el Saldo Actual';
                  banDiferencias := TRUE;
                  IF ABS (saldo_comparar - saldo_actual_cartera) < 0.01 THEN
                   BEGIN
                      mensaje := 'La suma del Saldo Actual de BCL más el Saldo Vencido del Conciliador, es igual al Saldo Actual del Conciliador';
                      banDiferencias := FALSE;
                   END;
               END
              ELSE IF (saldo_vencido_bc <> saldo_impagado_cartera) THEN
               BEGIN
                     mensaje := 'Hay diferencia en el Saldo Vencido';
                     banDiferencias := TRUE;
               END
              ELSE
                     mensaje := 'No se encontraron diferencias en los Saldos'
          END
          ELSE
             mensaje := 'No se encontró el crédito en BC_LAYOUT';


          IF (cve_orig = 'C') AND (vlQry.FieldByName('F_TRASPASO_VEN').IsNull) AND (imp_int_con <> imp_int_bc) THEN
              mensaje2 := 'Hay diferencia entre el Importe de Interés Impagado del Consolidado (' + FloatToStr(imp_int_con) + ') y de CRE_INTERES (' + FloatToStr(imp_int_bc) + '). ';

          IF (contieneFact <> 0) AND (plazo >= 370) AND (cve_frec_pagos = 0) THEN
           BEGIN
              mensaje2     := mensaje2 + 'El Crédito es de Factoraje y tiene un Plazo de ' + FloatToStr(plazo) + '.';
              banFactoraje := TRUE;
           END;

          //FIN DE BLOQUE

          {Por optimización 30-Ene-2012 Lucia Vallejo
          // Escribe la información al reporte de conciliación
          ExcelWorksheetO.RANGE['A'+IntToStr(cHRepCartera+fila),'A'+IntToStr(cHRepCartera+fila)].EntireRow.INSERT(EmptyParam);
          ExcelWorksheetO.Cells.Item[cHRepCartera+fila,'A']  := credito;
          ExcelWorksheetO.Cells.Item[cHRepCartera+fila,'B']  := acreditado;
          ExcelWorksheetO.Cells.Item[cHRepCartera+fila,'C']  := importe_credito_cartera;
          ExcelWorksheetO.Cells.Item[cHRepCartera+fila,'D']  := importe_credito;
          ExcelWorksheetO.Cells.Item[cHRepCartera+fila,'E']  := importe_credito_dif;
          ExcelWorksheetO.Cells.Item[cHRepCartera+fila,'F']  := saldo_con_gar;
          ExcelWorksheetO.Cells.Item[cHRepCartera+fila,'G']  := garantias;
          ExcelWorksheetO.Cells.Item[cHRepCartera+fila,'H']  := saldo_actual_cartera;
          ExcelWorksheetO.Cells.Item[cHRepCartera+fila,'I']  := saldo_actual_buro;
          ExcelWorksheetO.Cells.Item[cHRepCartera+fila,'J']  := saldo_actual_dif;
          ExcelWorksheetO.Cells.Item[cHRepCartera+fila,'K']  := saldo_impagado_cartera;
          ExcelWorksheetO.Cells.Item[cHRepCartera+fila,'L']  := saldo_impagado_buro;
          ExcelWorksheetO.Cells.Item[cHRepCartera+fila,'M']  := saldo_impagado_dif;
          ExcelWorksheetO.Cells.Item[cHRepCartera+fila,'N']  := clave_observacion;
          ExcelWorksheetO.Cells.Item[cHRepCartera+fila,'O']  := descripcion;
          ExcelWorksheetO.Cells.Item[cHRepCartera+fila,'P']  := TIPO_CONTRATO;
          ExcelWorksheetO.Cells.Item[cHRepCartera+fila,'Q']  := tipo_cliente;
          ExcelWorksheetO.Cells.Item[cHRepCartera+fila,'R']  := status_registro;
          //Agregado por: Lucia Vallejo 12-Oct-2011
          ExcelWorksheetO.Cells.Item[cHRepCartera+fila,'S']  := saldo_actual_bc;
          ExcelWorksheetO.Cells.Item[cHRepCartera+fila,'T']  := saldo_vencido_bc;
          ExcelWorksheetO.Cells.Item[cHRepCartera+fila,'U']  := mensaje;
          ExcelWorksheetO.Cells.Item[cHRepCartera+fila,'V']  := mensaje2;
          ExcelWorksheetO.Cells.Item[cHRepCartera+fila,'W']  := cve_orig;
          ExcelWorksheetO.Cells.Item[cHRepCartera+fila,'X']  := vlQry.FieldByName('CVE_AGRUPACION').AsString;
          ExcelWorksheetO.Cells.Item[cHRepCartera+fila,'Y']  := f_tras_ven;
          IF banFactoraje THEN
           BEGIN
             ExcelWorksheetO.Cells.Item[cHRepCartera+fila,'Z']  := 'X';
             ExcelWorksheetO.Cells.Item[cHRepCartera+fila,'AA'] := plazo;
           END;
          Por optimización 30-Ene-2012 Lucia Vallejo}

          //Carga los datos de los créditos en el archivo ASCII
          //Si el crédito tiene problema de Factoraje, el crédito se insertará con ciertos datos
          IF banFactoraje THEN
            BEGIN
              WriteLn (F, credito                             + CHR(9) +
                          acreditado                          + CHR(9) +
                          FloatToStr(importe_credito_cartera) + CHR(9) +
                          FloatToStr(importe_credito)         + CHR(9) +
                          FloatToStr(importe_credito_dif)     + CHR(9) +
                          FloatToStr(saldo_con_gar)           + CHR(9) +
                          FloatToStr(garantias)               + CHR(9) +
                          FloatToStr(saldo_actual_cartera)    + CHR(9) +
                          FloatToStr(saldo_actual_buro)       + CHR(9) +
                          FloatToStr(saldo_actual_dif)        + CHR(9) +
                          FloatToStr(saldo_impagado_cartera)  + CHR(9) +
                          FloatToStr(saldo_impagado_buro)     + CHR(9) +
                          FloatToStr(saldo_impagado_dif)      + CHR(9) +
                          clave_observacion                   + CHR(9) +
                          descripcion                         + CHR(9) +
                          TIPO_CONTRATO                       + CHR(9) +
                          tipo_cliente                        + CHR(9) +
                          status_registro                     + CHR(9) +
                          FloatToStr(saldo_actual_bc)         + CHR(9) +
                          FloatToStr(saldo_vencido_bc)        + CHR(9) +
                          mensaje                             + CHR(9) +
                          mensaje2                            + CHR(9) +
                          cve_orig                            + CHR(9) +
                          cve_agrupacion                      + CHR(9) +
                          f_tras_ven                          + CHR(9) +
                          'X'                                 + CHR(9) +
                          IntToStr(plazo)
                       );
            END
          ELSE
            BEGIN
              WriteLn (F, credito                             + CHR(9) +
                          acreditado                          + CHR(9) +
                          FloatToStr(importe_credito_cartera) + CHR(9) +
                          FloatToStr(importe_credito)         + CHR(9) +
                          FloatToStr(importe_credito_dif)     + CHR(9) +
                          FloatToStr(saldo_con_gar)           + CHR(9) +
                          FloatToStr(garantias)               + CHR(9) +
                          FloatToStr(saldo_actual_cartera)    + CHR(9) +
                          FloatToStr(saldo_actual_buro)       + CHR(9) +
                          FloatToStr(saldo_actual_dif)        + CHR(9) +
                          FloatToStr(saldo_impagado_cartera)  + CHR(9) +
                          FloatToStr(saldo_impagado_buro)     + CHR(9) +
                          FloatToStr(saldo_impagado_dif)      + CHR(9) +
                          clave_observacion                   + CHR(9) +
                          descripcion                         + CHR(9) +
                          TIPO_CONTRATO                       + CHR(9) +
                          tipo_cliente                        + CHR(9) +
                          status_registro                     + CHR(9) +
                          FloatToStr(saldo_actual_bc)         + CHR(9) +
                          FloatToStr(saldo_vencido_bc)        + CHR(9) +
                          mensaje                             + CHR(9) +
                          mensaje2                            + CHR(9) +
                          cve_orig                            + CHR(9) +
                          cve_agrupacion                      + CHR(9) +
                          f_tras_ven
                       );
            END;

          fila := fila + 1;
          vlQry.NEXT;
        END;
      END;

      //Escribe el total de créditos
      vlQry := GetSqlQueryNoNil( ' select count(*) as num_reg from BC_CON_SDO_B_TMP where id_sesion = ' + idSesion,
                             Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,TRUE);
      IF Assigned(vlQry) THEN
        num_reg := vlQry.FieldByName('num_reg').AsInteger;
      //ExcelWorksheetO.Cells.Item[cHRepCartera+fila+3,'A'] := 'REGISTROS: '+IntToStr(num_reg);  Comentado por: Lucia Vallejo Para optimización del Conciliador

      //Escribe el total de créditos
      vlQry := GetSqlQueryNoNil( ' select count(distinct(nombre_acreditado)) as num_acre from BC_CON_SDO_B_TMP where id_sesion = ' + idSesion,
                             Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,TRUE);
      IF Assigned(vlQry) THEN
        num_acre := vlQry.FieldByName('num_acre').AsInteger;
      //ExcelWorksheetO.Cells.Item[cHRepCartera+fila+4,'A'] := 'ACREDITADOS: '+IntToStr(num_acre);  Comentado por: Lucia Vallejo Para optimización del Conciliador

      {Por optimización 30-Ene-2012 Lucia Vallejo
      //Oculta las columnas para filtrar
      ExcelWorksheetO.RANGE['P1','R1'].EntireColumn.Hidden := TRUE;

      //Guarda la FECHA de cierre utilizada
      RunSQL( 'update BC_CON_CAT_DATA set desc_clave = TO_CHAR('+SQLFecha(dtFCierre.DATE)+',''YYYYMMDD'') ' +
              'where cve_con_gpo_cat = ''CAT_CONC_BURO'' and cve_clave = ''FECHA'''
             , Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, FALSE);

      ExcelWorkbookO.Save;
      Por optimización 30-Ene-2012 Lucia Vallejo}
      
      //Abre la platilla de excel y carga la información de los créditos del archivo ASCII
      GeneraXLS (path_file,
                 plantilla,
                 edArchivoSalida.Text,
                 'A11:AA13',
                 'A14:AA18',
                 num_reg,
                 num_acre,
                 fila);
       
      //Elimina el archivo ASCII
      IF FileExists (path_file) THEN
       BEGIN
         CloseFile (F);
         DeleteFile (path_file);
       END;

    finally
      //detiene la barra de progreso
      bbConciliar.Enabled := TRUE;
      ani.TERMINATE;
      //Si el campo con el nombre del reporte está vacio lee la información de
      //de la base de datos y utiliza el reporte
      IF edArchivoEntrada.text <> '' THEN
      BEGIN
        ExcelApplicationI.Visible[LCID] := FALSE;
        ExcelWorksheetI.DISCONNECT;
        ExcelWorkbookI.DISCONNECT;
        ExcelApplicationI.DISCONNECT;
      END;

      {
      ExcelWorksheetO.DISCONNECT;
      ExcelWorkbookO.DISCONNECT;
      ExcelApplicationO.DISCONNECT;

      ExcelApplicationI.Quit;
      ExcelWorksheetI.Destroy;
      ExcelWorkbookI.Destroy;

      ExcelApplicationI := nil;
      ExcelWorksheetI := nil;
      ExcelWorkbookI := nil;

      ExcelApplicationO.Quit;
      ExcelWorksheetO.Destroy;
      ExcelWorkbookO.Destroy;

      ExcelApplicationO := nil;
      ExcelWorksheetO := nil;
      ExcelWorkbookO := nil;
      }

    END;

    //Si NO existe error notifica al USUARIO que se generó el reporte
    //MessageDlg('Reporte generado correctamente', mtInformation, [mbOk], 0 );

    //Si NO existe error hace visible la aplicación de Excel
    //ExcelApplicationO.Visible[LCID] := TRUE;   Comentado por: Lucia Vallejo Para optimización del Conciliador

  EXCEPT
    ON e : EXCEPTION DO
    BEGIN
      MessageDlg('No se generó el reporte debido a un error.' + IntToStr(Fila) + ' ' + credito  + '. '+e.Message, mtError, [mbOk], 0 );
    END;
  END;

END;

PROCEDURE TWCrConc.edArchivoSalidaExit(Sender: TObject);
var vlMesg : String;
    vlSalida : BOOLEAN;
BEGIN
vlMesg := 'Debe definir el nombre del reporte';
IF (edArchivoSalida.Text = '') THEN
  vlSalida := FALSE;
InterForma1.ValidaExit(edArchivoSalida,vlSalida,vlMesg,TRUE);
END;

PROCEDURE TWCrConc.edArchivoEntradaExit(Sender: TObject);
var vlMesg : String;
    vlSalida : BOOLEAN;
BEGIN
vlMesg := 'Debe definir el nombre del reporte';
IF (edArchivoEntrada.Text = '') THEN
  vlSalida := FALSE;
InterForma1.ValidaExit(edArchivoEntrada,vlSalida,vlMesg,TRUE);

END;

PROCEDURE TWCrConc.bActInfoClick(Sender: TObject);
var
  vgQryRepBuro : TQuery;
  vgQryRepCartera : TQuery;
  vlStrSQL    : String;
BEGIN
  //Calcula las diferencias entre listas de disposiciones
  vlStrSQL :=  //Cartera - Buró
               //' select distinct(id_credito) from cr_con_adeudo_sdo ' +
               //' where	 f_cierre between ' + SQLFecha(StrToDate('01/'+FormatDateTime('mm/yy', dtFCierre.DATE))) + ' and ' + SQLFecha(dtFCierre.DATE) +
               ' select conso.id_credito ' +
               ' from   ( select distinct ( id_credito ) ' +
               '         from            cr_con_adeudo_sdo ' +
               '         where           f_cierre between ' + SQLFecha(StrToDate('01/'+FormatDateTime('mm/yy', dtFCierre.DATE))) + ' and ' + SQLFecha(dtFCierre.DATE) + ' ) conso, ' +
               '         ( select id_credito, ' +
               '                  b_envia_bnc ' +
               '          from   cr_credito ' +
               '          where  b_envia_bnc = ''V'' ' +
               '          union ' +
               '          select id_credito, ' +
               '                 b_envia_bnc ' +
               '          from   cre_credito ' +
               '          where  b_envia_bnc = ''V'' ) cred ' +
               '         where  cred.id_credito = conso.id_credito ' +
               ' minus ' +
               ' ( ' +
               ' select to_number(numero_cuenta) as id_credito ' +
               ' from   bc_acc_p_x_dat@opnportal ' +
               ' where  fecha_reporte = ' + SQLFecha(dtFCierre.DATE) +
               ' union ' +
               ' select to_number(numero_cuenta) as id_credito ' +
               ' from   bc_acc_e_x_dat@opnportal ' +
               ' where  fecha_reporte = ' + SQLFecha(dtFCierre.DATE) +
               ' ) ' +
               ' order by id_credito';
  vgQryRepCartera  := GetSQLQueryNoNil(vlStrSQL, Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, TRUE);

  vgQryRepCartera.FieldByName('ID_CREDITO').DisplayLabel := 'Numero de disposición';
  vgQryRepCartera.FieldByName('ID_CREDITO').DisplayWidth := 20;
  carteraSGDatos.AddQry(vgQryRepCartera,TRUE,TRUE,20,20,20,TRUE);

  vlStrSQL :=  //Buró - Cartera
               ' ( ' +
               ' select to_number(numero_cuenta) as id_credito ' +
               ' from   bc_acc_p_x_dat@opnportal ' +
               ' where  fecha_reporte = ' + SQLFecha(dtFCierre.DATE) +
               ' union ' +
               ' select to_number(numero_cuenta) as id_credito ' +
               ' from   bc_acc_e_x_dat@opnportal ' +
               ' where  fecha_reporte = ' + SQLFecha(dtFCierre.DATE) +
               ' ) ' +
               ' minus ' +
               //' select distinct(id_credito) from cr_con_adeudo_sdo ' +
               //' where	 f_cierre between ' + SQLFecha(StrToDate('01/'+FormatDateTime('mm/yy', dtFCierre.DATE))) + ' and ' + SQLFecha(dtFCierre.DATE) +
               ' select conso.id_credito ' +
               ' from   ( select distinct ( id_credito ) ' +
               '         from            cr_con_adeudo_sdo ' +
               '         where           f_cierre between ' + SQLFecha(StrToDate('01/'+FormatDateTime('mm/yy', dtFCierre.DATE))) + ' and ' + SQLFecha(dtFCierre.DATE) + ' ) conso, ' +
               '         ( select id_credito, ' +
               '                  b_envia_bnc ' +
               '          from   cr_credito ' +
               '          where  b_envia_bnc = ''V'' ' +
               '          union ' +
               '          select id_credito, ' +
               '                 b_envia_bnc ' +
               '          from   cre_credito ' +
               '          where  b_envia_bnc = ''V'' ) cred ' +
               '         where  cred.id_credito = conso.id_credito ' +
               ' order by id_credito ';

  vgQryRepBuro  := GetSQLQueryNoNil(vlStrSQL, Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, TRUE);

  vgQryRepBuro.FieldByName('ID_CREDITO').DisplayLabel := 'Numero de disposición';
  vgQryRepBuro.FieldByName('ID_CREDITO').DisplayWidth := 20;
  buroSGDatos.AddQry(vgQryRepBuro,TRUE,TRUE,20,20,20,TRUE);
END;


FUNCTION ColNameToColNumber (ACol: string): INTEGER;
BEGIN
  result := 0;
  IF LENGTH (ACol) = 1 THEN
    result := Ord (ACol [1]) - OrdA + 1
  ELSE IF LENGTH (ACol) = 2 THEN
    result := ((Ord (ACol [1]) - OrdA + 1) * 26) + (Ord (ACol [2]) - OrdA + 1);
END;


FUNCTION ColNumberToColName (ACol: INTEGER): string;
var
  s: string;
BEGIN
  s := CHR (OrdA - 1 + ((ACol - 1) div 26)) + CHR (OrdA + (((ACol - 1) MOD 26)));
  IF ACol <= 26 THEN
    DELETE (s, 1, 1);
  result := s;
END;


FUNCTION CellName (ACol, ARow: INTEGER): string;
BEGIN
  result := ColNumberToColName (ACol) + IntToStr (ARow);
END;


PROCEDURE ExtractColRowFromName (Cell: string; var ACol, ARow: INTEGER);
var
  Col, ROW: string;
BEGIN
  Cell := UpperCase (Cell);
  WHILE (LENGTH (Cell) > 0) AND (Cell [1] IN ['A'..'Z']) DO
  BEGIN
    Col := Col + Cell [1];
    DELETE (Cell, 1, 1);
  END;
  ROW := Cell;
  ACol := ColNameToColNumber (Col);
  ARow := StrToInt (ROW);
END;


PROCEDURE ExtractInfoFromName (Cell: string; var Sheet: string; var ACol, ARow: INTEGER);
BEGIN
  Sheet := Copy (Cell, 1, Pos ('!', Cell) - 1);
  DELETE (Cell, 1, LENGTH (Sheet) + 1);
  ExtractColRowFromName (Cell, ACol, ARow);
END;


PROCEDURE ExtractRange (s: string; var Sheet: string; var c1, r1, c2, r2: INTEGER);
BEGIN
  Sheet := Copy (s, 1, Pos ('!', s) - 1);

  IF Sheet <> '' THEN
    DELETE (s, 1, LENGTH (Sheet) + 1);

  IF Pos (':', s) > 0 THEN
  BEGIN
    ExtractColRowFromName (Copy (s, 1, Pos (':', s) - 1), c1, r1);
    DELETE (s, 1, Pos (':', s));
    ExtractColRowFromName (s, c2, r2);
  END
  ELSE
  BEGIN
    ExtractColRowFromName (s, c1, r1);
    c2 := c1;
    r2 := r1;
  END;
END;


PROCEDURE TWCrConc.GeneraXLS (ArchivoASCII, Plantilla, ArchivoXLS, RangoDatos, RangoResumen: string; num_reg, num_acre, fila: INTEGER);
var
  XLApp, XLSheet1, XLSheet2,
  RANGE: Variant;
  S, RangeOrig, RangeDest: String;
  ROWS, Cols: INTEGER;
  DCol1, DRow1, DCol2, DRow2,            //Variables para el rango de la zona de datos en la plantilla
  RCol1, RRow1, RCol2, RRow2: INTEGER;   //Variables para el rango de la zona de resumen en la plantilla
  vlQry : TQuery;
  mes, anho : String;

BEGIN
  //Determina los renglones y columnas de los rangos a partir de los parámetros
  ExtractRange (RangoDatos,   s, DCol1, DRow1, DCol2, DRow2);
  ExtractRange (RangoResumen, s, RCol1, RRow1, RCol2, RRow2);
         
  //Crea la aplicación
  XLApp := CreateOleObject('Excel.Application');
  try
    //Oculta la aplicación e inhabilita las alertas
    XLApp.Visible       := FALSE;
    XLApp.DisplayAlerts := FALSE;
              
    //Abre la plantilla
    XLApp.Workbooks.OPEN (Plantilla);
         
    //Abre el archivo separado por tabuladores
    XLApp.Workbooks.OpenText(ArchivoASCII,
                             xlWindows, EmptyParam,
                             xlDelimited, xlDoubleQuote,
                             EmptyParam, TRUE, EmptyParam, EmptyParam,
                             EmptyParam, EmptyParam, EmptyParam, EmptyParam,
                             EmptyParam, EmptyParam, EmptyParam, VarArrayCreate ([1, 1], varVariant));
     
    //Asigna variables para facilitar el acceso
    XLSheet1 := XLApp.Workbooks [1].Worksheets [1];
    XLSheet2 := XLApp.Workbooks [2].Worksheets [1];
    RANGE    := XLSheet2.UsedRange;
    ROWS     := RANGE.ROWS.COUNT;
    Cols     := RANGE.COLUMNS.COUNT;
    
    //Encabezado
    mes := 'DESCONOCIDO';
    anho := '0';

    //Mes que se utiliza en el encabezado
    vlQry := GetSqlQueryNoNil( 'select trim (to_char ( ' + SQLFecha(dtFCierre.DATE) + ', ''MONTH'', ''NLS_DATE_LANGUAGE=SPANISH'')) as mes , ' +
                               'to_char ( ' + SQLFecha(dtFCierre.DATE) + ', ''YYYY'') as anho from dual'
                               ,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,TRUE);

    IF Assigned(vlQry) THEN
    BEGIN
      mes := vlQry.FieldByName('MES').AsString;
      anho := vlQry.FieldByName('ANHO').AsString;
    END;

    XLSheet1.Cells.Item[3,'A'] := 'CIFRAS CORRESPONDIENTES AL MES DE ' + mes + ' DE ' + anho;

    //Encabezados de las columnas ocultas
    XLSheet1.Cells.Item[10,'P'] := 'Tipo Contrato';
    XLSheet1.Cells.Item[10,'Q'] := 'Tipo Cliente';
    XLSheet1.Cells.Item[10,'R'] := 'Status Registro';
    //Formato de encabezados de las columnas ocultas
    XLSheet1.RANGE['P10','Y10'].Font.SIZE := 9;
    XLSheet1.RANGE['P10','Y10'].Font.FontStyle := 'Bold';
    XLSheet1.RANGE['P10','Y10'].Font.NAME := 'Calibri';

    //Mueve el pie del reporte, lo desplaza los renglones necesarios para que pueda copiarse la información dentro
    XLSheet1.ACTIVATE;
    RangeOrig := CellName (RCol1, RRow1 - 1)        + ':' + CellName (RCol2, RRow2);
    RangeDest := CellName (RCol1, ROWS + RRow1 + 2) + ':' + CellName (RCol2, ROWS + RRow1 + 3);
    XLSheet1.RANGE [RangeOrig].Copy (XLSheet1.RANGE [RangeDest]);
    XLSheet1.RANGE [RangeOrig].DELETE;
    
    //Copia la información del archivo en ASCII a la hoja con la plantilla
    XLSheet2.ACTIVATE;
    RANGE.Copy;
    RangeOrig :=  CellName (DCol1, DRow1) + ':' + CellName (DCol1 - 1 + Cols, DRow1 - 1 + ROWS);
    XLSheet1.ACTIVATE;
    XLSheet1.RANGE [RangeOrig].SELECT;
    XLSheet1.RANGE [RangeOrig].PasteSpecial (xlPasteValues);
    XLApp.Application.CutCopyMode := FALSE;
    
    //Copia el formato del segundo renglón de la zona de datos al resto de los renglones
    RangeOrig := CellName (DCol1, DRow1 + 1) + ':' + CellName (DCol2, DRow1 + 1);
    RANGE     := XLSheet1.RANGE [RangeOrig];
    RANGE.SELECT;
    RANGE.Copy;

    RangeDest := CellName (DCol1, DRow1 + 1) + ':' + CellName (DCol2, DRow1 + ROWS - 2);
    XLSheet1.RANGE [RangeDest].SELECT;
    XLSheet1.RANGE [RangeDest].PasteSpecial (xlPasteFormats);
    XLApp.Application.CutCopyMode := FALSE;
    
    //Escribe el total de créditos
    //XLSheet1.Cells.Item[cHRepCartera+fila+3,'A'] := 'REGISTROS: ' + IntToStr(num_reg);
    XLSheet1.Cells.Item[cHRepCartera+fila,'A'] := 'REGISTROS: ' + IntToStr(num_reg);

    //Escribe el total de créditos
    XLSheet1.Cells.Item[cHRepCartera+fila+1,'A'] := 'ACREDITADOS: '+IntToStr(num_acre);

    //Oculta las columnas para filtrar
    XLSheet1.RANGE['P1','R1'].EntireColumn.Hidden := TRUE;
    
    //Cierra el archivo ASCII
    XLApp.Workbooks [2].CLOSE;
    
    //Salva el archivo FINAL en Excel
    XLApp.Workbooks[1].SaveAs (ArchivoXLS)

  finally
    
    RANGE    := Unassigned;
    XLSheet1 := Unassigned;
    XLSheet2 := Unassigned;
    XLApp.Visible := TRUE;
  END;
END;

END.
