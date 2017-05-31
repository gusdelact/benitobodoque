 // Sistema         : Clase de CrGenBCL
 // FECHA de Inicio : 14/10/2010
 // Función forma   : Clase de CrGenBCL
 // Desarrollo por  : Copy AND Paste.
 // Diseñado por    :
 // Comentarios     : Modificado por Lucia Vallejo 12012012 Para agregar la opción que genera el BC LAYOUT mensual.
unit IntCrGenBCL;

INTERFACE

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm, DB, DBTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun, ComCtrls, IntDtPk, IntParamCre, Grids, Aligrid,
  Menus
  ,IntCrGeFiBuro {CAPM}
  ;


TYPE
  TCrGenBCL = CLASS;

  TWCrGenBCL = CLASS(TForm)
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
    panel: TPanel;
    lbFInicio:        TLabel;
    sdArchivoSalidaPF: TSaveDialog;
    dtFInicio:        TDateTimePicker;
    lbFFin:           TLabel;
    dtFFin:           TDateTimePicker;
    sdArchivoSalidaH: TSaveDialog;
    sdArchivoSalidaPM: TSaveDialog;
    pAniBar:          TPanel;
    bbResapaldaBC_LAYOUT: TBitBtn;
    bbRestauraBC_LAYOUT: TBitBtn;
    rdgTipoBCL: TRadioGroup;
    imgSemanal: TImage;
    imgMensual: TImage;
    bbGenBC_LAYOUT: TBitBtn;
    btnEnvio: TBitBtn;
    PROCEDURE FormShow(Sender: TObject);
    PROCEDURE FormClose(Sender: TObject; var Action: TCloseAction);
    PROCEDURE FormDestroy(Sender: TObject);
    PROCEDURE bbGenBC_LAYOUTClick(Sender: TObject);
    PROCEDURE bbGenBC_LAYOUT_MensClick(Sender: TObject);
    PROCEDURE bbResapaldaBC_LAYOUTClick(Sender: TObject);
    PROCEDURE bbRestauraBC_LAYOUTClick(Sender: TObject);
    PROCEDURE rdgTipoBCLClick(Sender: TObject);
    PROCEDURE dtFFinChange(Sender: TObject);
    PROCEDURE GeneraBCLClick(Sender: TObject);
    PROCEDURE dtFFinCloseUp(Sender: TObject);
    PROCEDURE dtFFinExit(Sender: TObject);
    PROCEDURE dtFFinUserInput(Sender: TObject; const UserString: String;
      var DateAndTime: TDateTime; var AllowChange: BOOLEAN);
    procedure btnEnvioClick(Sender: TObject); {CAPM}
  PRIVATE
    { PRIVATE declarations }
  PUBLIC
    { PUBLIC declarations }
    PACKAGE: string; //Para fechas valor
    Objeto:  TCrGenBCL;
  END;

  TCrGenBCL = CLASS(TInterFrame)
  PRIVATE
  PROTECTED
    //  PROCEDURE Notification( AComponent : TComponent; Operation : TOperation); override;
  PUBLIC
    { PUBLIC declarations }
    ParamCre: TParamCre;
    FUNCTION InternalBusca: BOOLEAN; override;
    constructor CREATE(AOwner: TComponent); override;
    destructor Destroy; override;
    FUNCTION ShowWindow(FormaTipo: TFormaTipo): INTEGER; override;

  published
  END;

  //Clase para la barra de progreso
  TAniBarThread = CLASS(TThread)
  PRIVATE
    { PRIVATE declarations }
    FWnd:       HWND;
    FPaintRect: TRect;
    FbkColor, FfgColor: TColor;
    FInterval:  INTEGER;
  PROTECTED
    PROCEDURE EXECUTE; override;
  PUBLIC
    constructor CREATE(paintsurface: TWinControl; {Control a pintar }
      paintrect: TRect;          { area }
      bkColor, barcolor: TColor; { colores}
      INTERVAL: INTEGER);        { intervalo entre REFRESH}
  END;

implementation
//Uses RepMon;

{$R *.DFM}

FUNCTION LAST_DAY(d: TDateTime): TDateTime;
var
  YEAR, MONTH, DAY: word;
BEGIN
  DecodeDate (d, YEAR, MONTH, DAY);

  IF MONTH = 12 THEN
  BEGIN
    Inc  (YEAR);
    MONTH := 1;
  END
  ELSE
    Inc (MONTH);

  result := EncodeDate (YEAR, MONTH, 1) - 1;
END;


{* Definición de las clases para la barra de progreso
 *}
constructor TAniBarThread.CREATE(paintsurface: TWinControl;
  paintrect: TRect; bkColor, barcolor: TColor; INTERVAL: INTEGER);
BEGIN
  inherited CREATE(TRUE);
  FWnd := paintsurface.Handle;
  FPaintRect := paintrect;
  FbkColor := bkColor;
  FfgColor := barColor;
  FInterval := INTERVAL;
  FreeOnterminate := TRUE;
  RESUME;
END; { TAniBarThread.CREATE }

PROCEDURE TAniBarThread.EXECUTE;
var
  image: TBitmap;
  DC: HDC;
  LEFT, RIGHT: INTEGER;
  INCREMENT: INTEGER;
  imagerect: TRect;
  state: (incRight, incLeft, decLeft, decRight);
BEGIN
  Image := TBitmap.CREATE;
  try
    WITH Image DO
    BEGIN
      Width  := FPaintRect.RIGHT - FPaintRect.LEFT;
      Height := FPaintRect.Bottom - FPaintRect.Top;
      imagerect := Rect(0, 0, Width, Height);
    END; { WITH }
    LEFT  := 0;
    RIGHT := 0;
    INCREMENT := imagerect.RIGHT div 50;
    state := Low(State);
    WHILE NOT Terminated DO
    BEGIN
      WITH Image.Canvas DO
      BEGIN
        Brush.Color := FbkColor;
        FillRect(imagerect);
        CASE state OF
          incRight:
          BEGIN
            Inc(RIGHT, INCREMENT);
            IF RIGHT > imagerect.RIGHT THEN
            BEGIN
              RIGHT := imagerect.RIGHT;
              Inc(state);
            END; { IF }
          END; { CASE incRight }
          incLeft:
          BEGIN
            Inc(LEFT, INCREMENT);
            IF LEFT >= RIGHT THEN
            BEGIN
              LEFT := RIGHT;
              Inc(state);
            END; { IF }
          END; { CASE incLeft }
          decLeft:
          BEGIN
            DEC(LEFT, INCREMENT);
            IF LEFT <= 0 THEN
            BEGIN
              LEFT := 0;
              Inc(state);
            END; { IF }
          END; { CASE decLeft }
          decRight:
          BEGIN
            DEC(RIGHT, INCREMENT);
            IF RIGHT <= 0 THEN
            BEGIN
              RIGHT := 0;
              state := incRight;
            END; { IF }
          END; { CASE decLeft }
        END; { CASE }
        Brush.Color := FfgColor;
        FillRect(Rect(LEFT, imagerect.top, RIGHT, imagerect.bottom));
      END; { WITH }
      DC := GetDC(FWnd);
      IF DC <> 0 THEN
        try
          BitBlt(DC,
            FPaintRect.LEFT,
            FPaintRect.Top,
            imagerect.RIGHT,
            imagerect.bottom,
            Image.Canvas.handle,
            0, 0,
            SRCCOPY);
        finally
          ReleaseDC(FWnd, DC);
        END;
      Sleep(FInterval);
      Application.ProcessMessages;
    END; { WHILE }
  finally
    Image.Free;
  END;
  InvalidateRect(FWnd, nil, TRUE);
END; { TAniBarThread.EXECUTE }



constructor TCrGenBCL.CREATE(AOwner: TComponent);
BEGIN
  inherited;
  StpName  := ' ';
  UseQuery := FALSE;
  HelpFile := 'InTCrGenBCL.Hlp';
  ShowMenuReporte := TRUE;
END;

destructor TCrGenBCL.Destroy;
BEGIN
  inherited;
END;


FUNCTION TCrGenBCL.ShowWindow(FormaTipo: TFormaTipo): INTEGER;
var
  W: TWCrGenBCL;
BEGIN
  W := TWCrGenBCL.CREATE(Self);
  try
    W.Objeto := Self;
    W.InterForma1.InterFrame := Self;
    W.InterForma1.FormaTipo := ftConsulta;
    W.InterForma1.ShowGrid := FALSE;
    W.InterForma1.ShowNavigator := FALSE;
    W.InterForma1.ShowModal;
    ShowWindow := W.InterForma1.ModalResult;
  finally
    W.Free;
  END;
END;


FUNCTION TCrGenBCL.InternalBusca: BOOLEAN;
BEGIN
  InternalBusca := FALSE;
END;

 (***********************************************FORMA CrGenBCL********************)
 (*                                                                              *)
 (*  FORMA DE CrGenBCL                                                            *)
 (*                                                                              *)
 (***********************************************FORMA CrGenBCL********************)

PROCEDURE TWCrGenBCL.FormShow(Sender: TObject);
var
  vlQry: TQuery;
BEGIN
  WITH Objeto DO
  BEGIN
    //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
    lbDempresa.Caption := ParamCre.EMPRESA.AsString;
    lbDfecha.Caption  := ParamCre.FECHA.AsString;
    lbDUsuario.Caption := ParamCre.USUARIO.AsString;
    lbDPerfil.Caption := ParamCre.PERFIL.AsString;

    {* Despliega la última FECHA de inicio utilizada
     *}
    vlQry := GetSqlQueryNoNil(
      'select to_date(desc_clave,''YYYYMMDD'') as fecha from BC_CON_CAT_DATA where cve_con_gpo_cat = ''CAT_CONC_BURO'' and cve_clave = ''RPFINI''',
      Apli.DataBaseName, Apli.SessionName, TRUE);
    IF Assigned(vlQry) THEN
      dtFInicio.DATE := vlQry.FieldByName('fecha').AsDateTime
    ELSE
      dtFInicio.DATE := DATE;

    {* Despliega la última FECHA de fin utilizada
     *}
    vlQry := GetSqlQueryNoNil(
      'select to_date(desc_clave,''YYYYMMDD'') as fecha from BC_CON_CAT_DATA where cve_con_gpo_cat = ''CAT_CONC_BURO'' and cve_clave = ''RPFFIN''',
      Apli.DataBaseName, Apli.SessionName, TRUE);
    IF Assigned(vlQry) THEN
      dtFFin.DATE := vlQry.FieldByName('fecha').AsDateTime
    ELSE
      dtFFin.DATE := DATE;
  END;
END;

PROCEDURE TWCrGenBCL.FormDestroy(Sender: TObject);
BEGIN
  //Objeto
END;

PROCEDURE TWCrGenBCL.FormClose(Sender: TObject; var Action: TCloseAction);
BEGIN
  Action := caFree;
END;

PROCEDURE TWCrGenBCL.bbGenBC_LAYOUTClick(Sender: TObject);
var
  //Para la inserción a la base de datos
  vlSQL: string;

  //Para el PROCESO
  vlStp: TStoredProc;
  vlQry: TQuery;

  PPResultado: string;
  fechaIni: TDateTime;
  fechaFin: TDateTime;
  credito:  string;

  //Para la barra de progreso
  ani: TAniBarThread;
  r: TRect;

BEGIN

  {* Inicia las variables para actualizar el medidor
   *}
  r := pAniBar.ClientRect;
  InflateRect(r, -pAniBar.BevelWidth, -pAniBar.BevelWidth);
  ani := TAniBarThread.CREATE(pAniBar, r, pAniBar.color, clBlue, 100);
  bbGenBC_LAYOUT.Enabled := FALSE;


  //Define los parámetros básicos para el llamado
  vlStp := TStoredProc.CREATE(Self);
  vlStp.DatabaseName := Objeto.Apli.DatabaseName;
  vlStp.SessionName := Objeto.Apli.SessionName;

  try
    try
      fechaIni := dtFInicio.DATE;
      fechaFin := dtFFin.DATE;

      {*
       * Identifica los créditos modificados en el periodo
       *}

     {
      vlSQL :=  //** Disposiciones modificadas en el periodo
        // Modificaciones de transacciones para ICRE utilizando cr_capital
        'select ''ICRE'', cap.id_credito, max(f_pago) as f_valor from ' +
        'cr_capital cap, ' + 'cr_credito cred ' +
        'where ' + 'cap.id_credito = cred.id_credito ' +
        'and b_envia_bnc = ''V'' ' + 'and f_pago <= ' +
        SQLFecha(fechaFin) + ' ' + 'and f_pago >= ' +
        SQLFecha(fechaIni) + ' ' + 'group by cap.id_credito ' +
        'union ' +
        // Modificaciones de transacciones para ICRE utilizando cr_interes
        'select ''ICRE'', cap.id_credito, max(f_pago) as f_valor from ' +
        'cr_interes cap, ' + 'cr_credito cred ' +
        'where ' + 'cap.id_credito = cred.id_credito ' +
        'and b_envia_bnc = ''V'' ' + 'and f_pago <= ' +
        SQLFecha(fechaFin) + ' ' + 'and f_pago >= ' +
        SQLFecha(fechaIni) + ' ' + 'group by cap.id_credito ' +
        'union ' +
        // Modificaciones de transacciones para CRED utilizando cre_capital
        'select ''CRED'', cap.id_credito, max(f_pago) as f_valor from ' +
        'cre_capital cap, ' + 'cre_credito cred ' +
        'where ' + 'cap.id_credito = cred.id_credito ' +
        'and b_envia_bnc = ''V'' ' + 'and f_pago <= ' +
        SQLFecha(fechaFin) + ' ' + 'and f_pago >= ' +
        SQLFecha(fechaIni) + ' ' + 'group by cap.id_credito ' +
        'union ' +
        // Modificaciones de transacciones para CRED utilizando cre_interes
        'select ''CRED'', cap.id_credito, max(f_pago) as f_valor from ' +
        'cre_interes cap, ' + 'cre_credito cred ' +
        'where ' + 'cap.id_credito = cred.id_credito ' +
        'and b_envia_bnc = ''V'' ' + 'and f_pago <= ' +
        SQLFecha(fechaFin) + ' ' + 'and f_pago >= ' +
        SQLFecha(fechaIni) + ' ' + 'group by cap.id_credito ';
      }

      vlSQL :=  //** Disposiciones modificadas en el periodo

'SELECT id_credito ' +
 'FROM  ( '          +
    'SELECT DISTINCT(id_credito) AS id_credito ' +
     'FROM  ( ' +
        // Modificaciones de transacciones para ICRE utilizando cr_capital
		// 'select ''ICRE'', cap.id_credito, max(f_pago) as f_valor from ' +  --Reemplazado por: Lucia Vallejo 30-Sept-2011
        'select ''ICRE'', cap.id_credito, max(nvl(f_valor_pago, f_pago)) as f_valor from ' +
        'cr_capital cap, ' + 'cr_credito cred ' +
        'where ' + 'cap.id_credito = cred.id_credito ' +
		//'and b_envia_bnc = ''V'' ' + 'and f_pago <= ' +  --Reemplazado por: Lucia Vallejo 30-Sept-2011
        'and b_envia_bnc = ''V'' ' + 'and nvl(f_valor_pago, f_pago) <= ' +
		//SQLFecha(fechaFin) + ' ' + 'and f_pago >= ' +   --Reemplazado por: Lucia Vallejo 30-Sept-2011
        SQLFecha(fechaFin) + ' ' +   'and nvl(f_valor_pago, f_pago) >= ' +
        SQLFecha(fechaIni) + ' ' + 'group by cap.id_credito ' +
        'union ' +
        // Modificaciones de transacciones para ICRE utilizando cr_interes
		//'select ''ICRE'', cap.id_credito, max(f_pago) as f_valor from ' +  --Reemplazado por: Lucia Vallejo 30-Sept-2011
        'select ''ICRE'', cap.id_credito, max(nvl(f_valor_pago, f_pago)) as f_valor from ' +
        'cr_interes cap, ' + 'cr_credito cred ' +
        'where ' + 'cap.id_credito = cred.id_credito ' +
		//'and b_envia_bnc = ''V'' ' + 'and f_pago <= ' +  --Reemplazado por: Lucia Vallejo 30-Sept-2011
        //SQLFecha(fechaFin) + ' ' + 'and f_pago >= ' +  --Reemplazado por: Lucia Vallejo 30-Sept-2011
        'and b_envia_bnc = ''V'' ' + 'and nvl(f_valor_pago, f_pago) <= ' +
        SQLFecha(fechaFin) + ' ' +   'and nvl(f_valor_pago, f_pago) >= ' +
        SQLFecha(fechaIni) + ' ' + 'group by cap.id_credito ' +
        ' ) ' +
        'union ' +
    'SELECT DISTINCT(id_credito) AS id_credito ' +
     'FROM  ( ' +
        // Modificaciones de transacciones para CRED utilizando cre_capital
        'select ''CRED'', cap.id_credito, max(f_pago) as f_valor from ' +
        'cre_capital cap, ' + 'cre_credito cred ' +
        'where ' + 'cap.id_credito = cred.id_credito ' +
        'and b_envia_bnc = ''V'' ' + 'and f_pago <= ' +
        SQLFecha(fechaFin) + ' ' + 'and f_pago >= ' +
        SQLFecha(fechaIni) + ' ' + 'group by cap.id_credito ' +
        'union ' +
        // Modificaciones de transacciones para CRED utilizando cre_interes
        'select ''CRED'', cap.id_credito, max(f_pago) as f_valor from ' +
        'cre_interes cap, ' + 'cre_credito cred ' +
        'where ' + 'cap.id_credito = cred.id_credito ' +
        'and b_envia_bnc = ''V'' ' + 'and f_pago <= ' +
        SQLFecha(fechaFin) + ' ' + 'and f_pago >= ' +
        SQLFecha(fechaIni) + ' ' + 'group by cap.id_credito ' +
	') ' +
        ') ' +
        ' ORDER BY id_credito ' ;

        vlQry := GetSQLQueryNoNil(vlSQL, Objeto.Apli.DataBaseName,
        Objeto.Apli.SessionName, True);

      //Inserta los créditos en la tabla temporal BC_TMP_BCL
      if Assigned(vlQry) then
      begin

        //Elimina la información de la tabla con los créditos fecha valor
        vlSQL := ' delete from BC_TMP_BCL ';
        RunSQL(vlSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True);

        while not vlQry.EOF do
        begin
          credito := vlQry.FieldByName('id_credito').AsString;

          vlSQL := ' insert into BC_TMP_BCL (id_credito) ' +
            ' values (' + credito + ')';
          RunSQL(vlSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True);
          vlQry.Next;
        end;
      end;

      {* Ejecuta el proceso que genera la tabla BC_LAYOUT para estos créditos
       *}
      vlStp := TStoredProc.Create(Self);
      with vlStp do
      begin
        vlStp.DatabaseName := Objeto.Apli.DatabaseName;
        vlStp.SessionName := Objeto.Apli.SessionName;

        vlStp.StoredProcName := 'PKGBUROAP.STP_RECARGA_BC_LAYOUT';

        Params.Clear;
        Params.CreateParam(ftInteger, 'V_ANIO_MES', ptInput);
        Params.CreateParam(ftDate, 'V_FECHA_INI', ptInput);
        Params.CreateParam(ftDate, 'V_FECHA_FIN', ptInput);
        Params.CreateParam(ftInteger, 'P_CANTIDAD', ptOutput);
        Params.CreateParam(ftInteger, 'P_RESULTADO', ptOutput);
        Params.CreateParam(ftString, 'P_TX_RESULTADO', ptOutput);

        Prepare;
        ParamByName('V_ANIO_MES').AsInteger :=
          StrToInt(FormatDateTime('yyyymm', dtFFin.Date));
        ParamByName('V_FECHA_INI').AsDate := dtFInicio.Date;
        ParamByName('V_FECHA_FIN').AsDate := dtFFin.Date;

        ExecProc;

        if (ParamByName('P_RESULTADO').AsInteger <> 0) then
        begin
          PPResultado := 'Error No ' + ParamByName('P_TX_RESULTADO').AsString;
          raise Exception.Create(PPResultado);
        end;

        {Este proceso ahora se realiza desde el paquete PKGBUROAP a través del procedimiento STP_COPIAR_BC_LAYOUT
         ya que no es recomendable hacerlo desde Delphi}
        //Copia la tabla a PPORTAL
        {vlSQL := ' delete from BC_LAYOUT@OPNPORTAL ';
        RunSQL(vlSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True);
        vlSQL := ' insert into BC_LAYOUT@OPNPORTAL (select * from BC_LAYOUT) ';
        RunSQL(vlSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True);}

      end; //with

    finally
      //detiene la barra de progreso
      bbGenBC_LAYOUT.Enabled := True;
      ani.Terminate;
      if Assigned(vlStp) then
        vlStp.Free;

    end;

    MessageDlg('Tabla generada correctamente', mtInformation, [mbOK], 0);

    //Guarda las fechas del periodo utilizado si no hubo errores
    RunSQL('update BC_CON_CAT_DATA set desc_clave = TO_CHAR(' + SQLFecha(
      dtFInicio.Date) + ',''YYYYMMDD'') ' +
      'where cve_con_gpo_cat = ''CAT_CONC_BURO'' and cve_clave = ''RPFINI'''
      , Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);

    RunSQL('update BC_CON_CAT_DATA set desc_clave = TO_CHAR(' + SQLFecha(
      dtFFin.Date) + ',''YYYYMMDD'') ' +
      'where cve_con_gpo_cat = ''CAT_CONC_BURO'' and cve_clave = ''RPFFIN'''
      , Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
  except
    on e: Exception do
    begin
      MessageDlg('No se generó la tabla debido a un error.' +
        e.Message, mtError, [mbOK], 0);
    end;
  end;

end;


PROCEDURE TWCrGenBCL.bbGenBC_LAYOUT_MensClick(Sender: TObject);
var
  //Para la inserción a la base de datos
  //vlSQL: string;

  //Para el PROCESO
  vlStp: TStoredProc;
  vlQry: TQuery;

  PPResultado: string;
  //fechaIni: TDateTime;
  //fechaFin: TDateTime;
  fechaIni: String;
  fechaFin: String;
  mesInicio: Integer;
  mesFin:    Integer;
  //credito:  string;

  //Para la barra de progreso
  ani: TAniBarThread;
  r: TRect;

BEGIN

  //Valida que se haya seleccionado un rango de un sólo mes
  mesInicio := StrToInt(FormatDateTime ('mm', dtFInicio.DATE));
  mesFin    := StrToInt(FormatDateTime ('mm', dtFFin.DATE));

  If mesInicio <> mesFin Then
  begin
      ShowMessage('La Fecha de Inicio y Fecha Fin NO corresponden al mismo mes');
      exit;
  end;

  fechaIni := ('01/'+FormatDateTime('mm/yyyy', dtFFin.DATE));
  //fechaFin := SQLFecha(StrToDate('01/'+FormatDateTime('mm/yy', dtFCierre.DATE)));}

  {* Inicia las variables para actualizar el medidor
   *}
  r := pAniBar.ClientRect;
  InflateRect(r, -pAniBar.BevelWidth, -pAniBar.BevelWidth);
  ani := TAniBarThread.CREATE(pAniBar, r, pAniBar.color, clBlue, 100);
  bbGenBC_LAYOUT.Enabled := FALSE;


  //Define los parámetros básicos para el llamado
  vlStp := TStoredProc.CREATE(Self);
  vlStp.DatabaseName := Objeto.Apli.DatabaseName;
  vlStp.SessionName := Objeto.Apli.SessionName;

  vlQry := TQuery.Create(Self);
  vlQry.DatabaseName := Objeto.Apli.DatabaseName;
  vlStp.SessionName := Objeto.Apli.SessionName;

  try
    try

      {* Ejecuta el proceso que genera la tabla BC_LAYOUT Mensual
       *}
      vlStp := TStoredProc.Create(Self);
      with vlStp do
      begin
        vlStp.DatabaseName := Objeto.Apli.DatabaseName;
        vlStp.SessionName := Objeto.Apli.SessionName;

        vlStp.StoredProcName := 'PKGBURO.STP_RECARGA_BC_LAYOUT';

        Params.Clear;
        Params.CreateParam(ftInteger, 'V_ANIO_MES', ptInput);
        Params.CreateParam(ftDate, 'V_FECHA_INI', ptInput);
        Params.CreateParam(ftDate, 'V_FECHA_FIN', ptInput);
        Params.CreateParam(ftInteger, 'P_CANTIDAD', ptOutput);
        Params.CreateParam(ftInteger, 'P_RESULTADO', ptOutput);
        Params.CreateParam(ftString, 'P_TX_RESULTADO', ptOutput);

        Prepare;
        ParamByName('V_ANIO_MES').AsInteger := StrToInt(FormatDateTime('yyyymm', dtFFin.Date));
        ParamByName('V_FECHA_INI').AsDate := dtFInicio.Date;
        ParamByName('V_FECHA_FIN').AsDate := dtFFin.Date;

        ExecProc;

        if (ParamByName('P_RESULTADO').AsInteger <> 0) then
        begin
          PPResultado := 'Error No ' + ParamByName('P_TX_RESULTADO').AsString;
          raise Exception.Create(PPResultado);
        end;

      end; //with

      vlQry.Close;
      vlQry.SQL.Clear;
      vlqRY.SQL.Add('COMMIT');
      vlQry.ExecSQL;


    finally
      //detiene la barra de progreso
      bbGenBC_LAYOUT.Enabled := True;
      ani.Terminate;
      if Assigned(vlStp) then
        vlStp.Free;

      if Assigned(vlQry) then
        vlQry.Free;

    end;

    MessageDlg('Tabla generada correctamente', mtInformation, [mbOK], 0);

  except
    on e: Exception do
    begin
      MessageDlg('No se generó la tabla debido a un error.' +
        e.Message, mtError, [mbOK], 0);
    end;
  end;

END;

procedure TWCrGenBCL.bbResapaldaBC_LAYOUTClick(Sender: TObject);
var
    vlQry : TQuery;
begin
   if Objeto.ValidaAccesoEsp('TCRGENBCL_RSPLAY',True,True) then
   begin
            try
               vlQry := TQuery.Create(Self);
               vlQry.DatabaseName  := Objeto.Apli.DataBaseName;
               vlQry.SessionName   := Objeto.Apli.SessionName;

               //Elimina la información de la tabla respaldo
               vlQry.close;
               vlQry.SQL.Text:= ' delete from BC_LAYOUT_BAK ';
               vlQry.ExecSQL;

               //Crea el respaldo
               //Modificado para validar los datos insertados en la tabla BC_LAYOUT_BAK - 22/08/2011 - CLVA
               vlQry.close;
               vlQry.SQL.Text:=
                         ' Insert Into BC_LAYOUT_BAK (NUMERO_CUENTA, UID_CUS, RFC, PRIMER_NOMBRE, SEGUNDO_NOMBRE, APELLIDO_PATERNO, APELLIDO_MATERNO, APELLIDO_ADICIONAL, ' +  #13 +
                         '   FECHA_NACIMIENTO, SEXO, ESTADO_CIVIL, NAT, ECON_ACT, TIPO_CLIENTE, INDICADOR_DEFUNCION, FECHA_DEFUNCION, PAIS, ESTADO,'                        +  #13 +
                         '   NOM_CIT, DELEGACION_MUNICIPIO, COLONIA_POBLACION, NUMERO_EXTERIOR, CODIGO_POSTAL, NUMERO_TELEFONO, EXTENSION_TELEFONICA, '                     +  #13 +
                         '   TIPO_DOMICILIO, TIPO_RESPONSABILIDAD, TIPO_CONTRATO, TIPO_CREDITO, CLAVE_MONEDA, FECHA_APERTURA, FECHA_REESTRUCTURA, NUMERO_PAGOS, '           +  #13 +
                         '   EXPERIENCIAS_CREDITICIAS, CLAVE_FRECUENCIA_PAGOS, CLAVE_FRECUENCIA_PAGOS_NUM, LIMITE_CREDITO, CREDITO_MAXIMO, SALDO_INICIAL, '                 +  #13 +
                         '   SALDO_ACTUAL, SALDO_VENCIDO, PAGOS_VENCIDOS, DIAS_VENCIDO, MONTO_A_PAGAR, PLAZO, IMPORTE_AVALUO, GARANTIA, IMPORTE_PAGO, '                     +  #13 +
                         '   PAGO_EFECTIVO, SALDO_QUITA, SALDO_DACION, QUEBRANTO, FECHA_ULTIMO_PAGO, FECHA_ULTIMA_COMPRA, FECHA_QUEBRANTO, FECHA_LIQUIDACION, '             +  #13 +
                         '   FECHA_CIERRE, CLAVE_OBSERVACION, CALIFICACION_CARTERA, CUENTA_CONTABLE, NUMERO_CONTRATO_ANTERIOR, NOMBRE_OTORGANTE_ANTERIOR, '                 +  #13 +
                         '   CLAVE_OTORGANTE_ANTERIOR, NUMERO_CUENTA_ANTERIOR, BLOQUEO, FECHA_PRIMER_INCUM, CLAVE_CONSOLIDA_EM, SALDO_INSOLUTO, MONTO_ULTIMO_PAGO, '        +  #13 + {FJR 13.06.2013 monto último pago}
                         '   TIPO_CARTERA) '        +  #13 + {FJR 20.09.2013 tipo cartera (CN, VC)}
                         ' Select NUMERO_CUENTA, UID_CUS, RFC, PRIMER_NOMBRE, SEGUNDO_NOMBRE, APELLIDO_PATERNO, APELLIDO_MATERNO, APELLIDO_ADICIONAL, '                     +  #13 +
                         '   FECHA_NACIMIENTO, SEXO, ESTADO_CIVIL, NAT, ECON_ACT, TIPO_CLIENTE, INDICADOR_DEFUNCION, FECHA_DEFUNCION, PAIS, ESTADO, '                       +  #13 +
                         '   NOM_CIT, DELEGACION_MUNICIPIO, COLONIA_POBLACION, NUMERO_EXTERIOR, '                                                                           +  #13 +
                         '   CODIGO_POSTAL, NUMERO_TELEFONO, EXTENSION_TELEFONICA, '                                                                                        +  #13 +
                         '   TIPO_DOMICILIO, TIPO_RESPONSABILIDAD, TIPO_CONTRATO, TIPO_CREDITO, CLAVE_MONEDA, FECHA_APERTURA, FECHA_REESTRUCTURA, NUMERO_PAGOS, '           +  #13 +
                         '   EXPERIENCIAS_CREDITICIAS, CLAVE_FRECUENCIA_PAGOS, CLAVE_FRECUENCIA_PAGOS_NUM, LIMITE_CREDITO, CREDITO_MAXIMO, SALDO_INICIAL, '                 +  #13 +
                         '   SALDO_ACTUAL, SALDO_VENCIDO, PAGOS_VENCIDOS, DIAS_VENCIDO, MONTO_A_PAGAR, PLAZO, IMPORTE_AVALUO, GARANTIA, IMPORTE_PAGO, '                     +  #13 +
                         '   PAGO_EFECTIVO, SALDO_QUITA, SALDO_DACION, QUEBRANTO, FECHA_ULTIMO_PAGO, FECHA_ULTIMA_COMPRA, FECHA_QUEBRANTO, FECHA_LIQUIDACION, '             +  #13 +
                         '   FECHA_CIERRE, CLAVE_OBSERVACION, CALIFICACION_CARTERA, CUENTA_CONTABLE, NUMERO_CONTRATO_ANTERIOR, NOMBRE_OTORGANTE_ANTERIOR, '                 +  #13 +
                         '   CLAVE_OTORGANTE_ANTERIOR, NUMERO_CUENTA_ANTERIOR, BLOQUEO, FECHA_PRIMER_INCUM, CLAVE_CONSOLIDA_EM, SALDO_INSOLUTO, MONTO_ULTIMO_PAGO, '        +  #13 + {FJR 13.06.2013 monto último pago}
                         '   TIPO_CARTERA ' + #13 + {FJR 20.09.2013 tipo cartera (CN, VC)}
                         ' From SYN_BC_LAYOUT_OPNPORTAL ';
               vlQry.ExecSQL;

            finally
               vlQry.close;
            end;

            vlQry.Destroy;
            ShowMessage('Finaliza Proceso Actualiza Repositorio Temporal Interno Binter (Respalda en PCORP).' ) ;
   end;
end;


procedure TWCrGenBCL.bbRestauraBC_LAYOUTClick(Sender: TObject);
var
    vlQry : TQuery;
begin
   if Objeto.ValidaAccesoEsp('TCRGENBCL_RSTLAY',True,True) then
   begin
            try
               vlQry := TQuery.Create(Self);
               vlQry.DatabaseName  := Objeto.Apli.DataBaseName;
               vlQry.SessionName   := Objeto.Apli.SessionName;

               //Elimina la información de la tabla respaldo
               vlQry.close;
               vlQry.SQL.Text:=  ' delete from SYN_BC_LAYOUT_OPNPORTAL ';
               vlQry.ExecSQL;

               //Crea el respaldo
               //Modificado para validar los datos insertados en la tabla BC_LAYOUT_BAK - 22/08/2011 - CLVA
               vlQry.close;
               vlQry.SQL.Text:=
                     ' insert into SYN_BC_LAYOUT_OPNPORTAL (select * from BC_LAYOUT_BAK) ';
               vlQry.ExecSQL;

            finally
               vlQry.close;
            end;

            vlQry.Destroy;
            ShowMessage('Finaliza Proceso Restaura información en Repositorio Carga Original Binter para eBureau (Restaura en PPORTAL).' ) ;
   end;
end;

procedure TWCrGenBCL.rdgTipoBCLClick(Sender: TObject);
begin
    If rdgTipoBCL.ItemIndex = 1 Then
    begin
        dtFInicio.Enabled      := False;
        dtFInicio.Date         := StrToDate('01/' + FormatDateTime('mm/yy', dtFFin.DATE));
           dtFFin.Date         := Last_Day(dtFFin.DATE);
        bbGenBC_LAYOUT.Caption := 'Genera BC LAYOUT Mensual';
        bbGenBC_LAYOUT.Glyph.Assign(imgMensual.Picture);
    end
    Else
    begin
        dtFInicio.Enabled      := True;
        bbGenBC_LAYOUT.Caption := 'Genera BC LAYOUT Semanal';
        bbGenBC_LAYOUT.Glyph.Assign(imgSemanal.Picture);
    end;

end;


procedure TWCrGenBCL.dtFFinChange(Sender: TObject);
begin
    If rdgTipoBCL.ItemIndex = 1 Then
    begin
        dtFInicio.Date := StrToDate('01/'+FormatDateTime('mm/yy', dtFFin.DATE));
           dtFFin.Date := Last_Day(dtFFin.DATE);
    end;
end;


procedure TWCrGenBCL.GeneraBCLClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRGENBCL_GENLAY',True,True) then
   begin
     If rdgTipoBCL.ItemIndex = 0 Then
        bbGenBC_LAYOUTClick(Sender)
     Else
        bbGenBC_LAYOUT_MensClick(Sender);
   end;
end;

procedure TWCrGenBCL.dtFFinCloseUp(Sender: TObject);
begin
    If rdgTipoBCL.ItemIndex = 1 Then
    begin
        dtFInicio.Date := StrToDate('01/'+FormatDateTime('mm/yy', dtFFin.DATE));
           dtFFin.Date := Last_Day(dtFFin.DATE);
    end;
end;

procedure TWCrGenBCL.dtFFinExit(Sender: TObject);
begin
    If rdgTipoBCL.ItemIndex = 1 Then
    begin
        dtFInicio.Date := StrToDate('01/'+FormatDateTime('mm/yy', dtFFin.DATE));
           dtFFin.Date := Last_Day(dtFFin.DATE);
    end;
end;

procedure TWCrGenBCL.dtFFinUserInput(Sender: TObject;
  const UserString: String; var DateAndTime: TDateTime;
  var AllowChange: Boolean);
begin
    If rdgTipoBCL.ItemIndex = 1 Then
    begin
        dtFInicio.Date := StrToDate('01/'+FormatDateTime('mm/yy', dtFFin.DATE));
           dtFFin.Date := Last_Day(dtFFin.DATE);
    end;
end;
{**********************************************************************************************************************
 *********************************************************************************************************************}
procedure TWCrGenBCL.btnEnvioClick(Sender: TObject);
var  {CAPM}
  frmCrGeFiBuro : TCrGeFiBuro;
begin
  frmCrGeFiBuro := TCrGeFiBuro.Create(Self);
  frmCrGeFiBuro.Apli := Objeto.Apli;
  try
    frmCrGeFiBuro.ShowWindow(ftConsulta);
  finally
    frmCrGeFiBuro.Free;
  end;

end;
{**********************************************************************************************************************
 *********************************************************************************************************************}
end.
