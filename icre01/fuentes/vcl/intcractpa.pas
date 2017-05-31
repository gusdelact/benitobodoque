// Sistema         : Clase de CR_CONC
// Fecha de Inicio : 09/11/2009
// Función forma   : Clase de CR_CONC
// Desarrollo por  : Copy and Paste.
// Diseñado por    :
// Comentarios     :
Unit IntCrActPa;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntParamCre, Grids, Aligrid,
Menus, Excel97, OleServer;

const

cHRepBuro = 1; //Último renglón del encabezado del reporte de E-Bureau
cHRepCartera = 10; //Último renglón del encabezado del reporte del conciliador

Type
  TCrActPa= class;

  TWCrActPa=Class(TForm)
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
    Panel1: TPanel;
    bbGenReporte: TBitBtn;
    lbArchivoSalida: TLabel;
    edArchivoSalidaPF: TEdit;
    lbFInicio: TLabel;
    sbArchivoSalidaPF: TSpeedButton;
    sdArchivoSalidaPF: TSaveDialog;
    dtFInicio: TDateTimePicker;
    lbFFin: TLabel;
    dtFFin: TDateTimePicker;
    cbPersonasFisicas: TCheckBox;
    cbHipotecarios: TCheckBox;
    edArchivoSalidaH: TEdit;
    sbArchivoSalidaH: TSpeedButton;
    sdArchivoSalidaH: TSaveDialog;
    cbPersonasMorales: TCheckBox;
    edArchivoSalidaPM: TEdit;
    sbArchivoSalidaPM: TSpeedButton;
    sdArchivoSalidaPM: TSaveDialog;
    pAniBar: TPanel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure sbArchivoSalidaPFClick(Sender: TObject);
    procedure sbArchivoSalidaHClick(Sender: TObject);
    procedure sbArchivoSalidaPMClick(Sender: TObject);
    procedure bbGenReporteClick(Sender: TObject);
    procedure cbPersonasFisicasClick(Sender: TObject);
    procedure cbHipotecariosClick(Sender: TObject);
    procedure cbPersonasMoralesClick(Sender: TObject);
    procedure dtFFinChange(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    package: String; //Para fechas valor
    Objeto : TCrActPa;
    cve_PF, cve_H, cve_PM : String;
    procedure GeneraReportePF(Nombre:String; vlQry:TQuery; cveUsuario:String);
    procedure GeneraReportePM(Nombre:String; cveUsuario:String);
  end;
  TCrActPa= class(TInterFrame)
    private
    protected
  //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
    public
      { Public declarations }
      ParamCre                 : TParamCre;
      function    InternalBusca : Boolean; override;
      constructor Create( AOwner : TComponent ); override;
      destructor  Destroy; override;
      function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

    published
  end;

  //Clase para la barra de progreso
  TAniBarThread = class(TThread)
    private
      { private declarations }
      FWnd: HWND;
      FPaintRect: TRect;
      FbkColor, FfgColor: TColor;
      FInterval: integer;
    protected
      procedure Execute; override;
    public
      constructor Create(paintsurface : TWinControl; {Control a pintar }
        paintrect : TRect;          { area }
        bkColor, barcolor : TColor; { colores}
        interval : integer);        { intervalo entre refresh}
  end;
  
implementation
//Uses RepMon;

{$R *.DFM}

{* Definición de las clases para la barra de progreso
 *}
constructor TAniBarThread.Create(paintsurface : TWinControl;
  paintrect : TRect; bkColor, barcolor : TColor; interval : integer); 
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
  image : TBitmap; 
  DC : HDC; 
  left, right : integer; 
  increment : integer; 
  imagerect : TRect; 
  state : (incRight, incLeft, decLeft, decRight);
begin 
  Image := TBitmap.Create; 
  try 
    with Image do  
    begin 
      Width := FPaintRect.Right - FPaintRect.Left; 
      Height := FPaintRect.Bottom - FPaintRect.Top;
      imagerect := Rect(0, 0, Width, Height); 
    end; { with } 
    left := 0; 
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



constructor TCrActPa.Create( AOwner : TComponent );
begin Inherited;
      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'InTCrActPa.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrActPa.Destroy;
begin inherited;
end;


function TCrActPa.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrActPa;
begin
   W:=TWCrActPa.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftConsulta;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrActPa.InternalBusca:Boolean;
begin InternalBusca := False;
end;

(***********************************************FORMA CR_CONC********************)
(*                                                                              *)
(*  FORMA DE CR_CONC                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_CONC********************)

procedure TWCrActPa.FormShow(Sender: TObject);
var
     vlQry : TQuery;
begin
  With Objeto Do
  Begin
    //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
    lbDempresa.Caption := ParamCre.EMPRESA.AsString;
    lbDfecha.Caption   := ParamCre.FECHA.AsString;
    lbDUsuario.Caption := ParamCre.USUARIO.AsString;
    lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

    {* Despliega la última fecha de inicio utilizada
     *}
    vlQry := GetSqlQueryNoNil( 'select to_date(desc_clave,''YYYYMMDD'') as fecha from BC_CON_CAT_DATA where cve_con_gpo_cat = ''CAT_CONC_BURO'' and cve_clave = ''RPFINI''',
                             Apli.DataBaseName,Apli.SessionName,True);
    If Assigned(vlQry) Then
      dtFInicio.Date := vlQry.FieldByName('fecha').AsDateTime
    else
      dtFInicio.Date := Date;

    {* Despliega la última fecha de fin utilizada
     *}
    vlQry := GetSqlQueryNoNil( 'select to_date(desc_clave,''YYYYMMDD'') as fecha from BC_CON_CAT_DATA where cve_con_gpo_cat = ''CAT_CONC_BURO'' and cve_clave = ''RPFFIN''',
                             Apli.DataBaseName,Apli.SessionName,True);
    If Assigned(vlQry) Then
      dtFFin.Date := vlQry.FieldByName('fecha').AsDateTime
    else
      dtFFin.Date := Date;

    {* Define el nombre de los reportes
     *}
    //Consulta para el nombre del reporte para personas físicas
    vlQry := GetSqlQueryNoNil( 'select desc_clave from BC_CON_CAT_DATA where cve_con_gpo_cat = ''CAT_CONC_BURO'' and cve_clave = ''MCPF''',
                             Apli.DataBaseName,Apli.SessionName,True);
    If Assigned(vlQry) Then
    begin
      cve_PF := vlQry.FieldByName('desc_clave').AsString;
      edArchivoSalidaPF.text := cve_PF + '_' + FormatDateTime('ddmmyyyy', dtFFin.Date) + '.ext'
    end
    else
      edArchivoSalidaPF.text := '';

    sdArchivoSalidaPF.FileName := edArchivoSalidaPF.text;

    //Extrae el nombre del reporte para hipotecarios
    vlQry := GetSqlQueryNoNil( 'select desc_clave from BC_CON_CAT_DATA where cve_con_gpo_cat = ''CAT_CONC_BURO'' and cve_clave = ''MCH''',
                             Apli.DataBaseName,Apli.SessionName,True);
    If Assigned(vlQry) Then
    begin
      cve_H := vlQry.FieldByName('desc_clave').AsString;
      edArchivoSalidaH.text := cve_H + '_' + FormatDateTime('ddmmyyyy', dtFFin.Date) + '.ext'
    end
    else
      edArchivoSalidaH.text := '';

    sdArchivoSalidaH.FileName := edArchivoSalidaH.text;

    //Extrae el nombre del reporte para personas morales
    vlQry := GetSqlQueryNoNil( 'select desc_clave from BC_CON_CAT_DATA where cve_con_gpo_cat = ''CAT_CONC_BURO'' and cve_clave = ''MCPM''',
                             Apli.DataBaseName,Apli.SessionName,True);
    If Assigned(vlQry) Then
    begin
      cve_PM := vlQry.FieldByName('desc_clave').AsString;
      edArchivoSalidaPM.text := cve_PM + '_' + FormatDateTime('ddmmyyyy', dtFFin.Date) + '.ext'
    end
    else
      edArchivoSalidaPM.text := '';

    sdArchivoSalidaPM.FileName := edArchivoSalidaPM.text;

  End;
end;

procedure TWCrActPa.FormDestroy(Sender: TObject);
begin
   //Objeto
end;

procedure TWCrActPa.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrActPa.InterForma1DespuesNuevo(Sender: TObject);
begin
   edArchivoSalidaPF.SetFocus;
end;

procedure TWCrActPa.InterForma1DespuesModificar(Sender: TObject);
begin edArchivoSalidaPF.SetFocus;
end;

procedure TWCrActPa.sbArchivoSalidaPFClick(Sender: TObject);
begin
  sdArchivoSalidaPF.FileName := cve_PF + '_' + FormatDateTime('ddmmyyyy', dtFFin.Date) + '.ext';
  If sdArchivoSalidaPF.Execute then
  begin
    edArchivoSalidaPF.Text := sdArchivoSalidaPF.FileName;
    if FileExists(sdArchivoSalidaPF.FileName) then
    begin
      if MessageDlg('Reporte existente. ¿Desea sobreescribirlo?',
         mtConfirmation, [mbYes, mbNo], 0) <> mrYes
      then edArchivoSalidaPF.Text := '';
    end;
  end
  else
    edArchivoSalidaPF.Text := '';
end;

procedure TWCrActPa.sbArchivoSalidaHClick(Sender: TObject);
begin
  sdArchivoSalidaH.FileName := cve_H + '_' + FormatDateTime('ddmmyyyy', dtFFin.Date) + '.ext';
  If sdArchivoSalidaH.Execute then
  begin
    edArchivoSalidaH.Text := sdArchivoSalidaH.FileName;
    if FileExists(sdArchivoSalidaH.FileName) then
    begin
      if MessageDlg('Reporte existente. ¿Desea sobreescribirlo?',
         mtConfirmation, [mbYes, mbNo], 0) <> mrYes
      then edArchivoSalidaH.Text := '';
    end;
  end
  else
    edArchivoSalidaH.Text := '';
end;



procedure TWCrActPa.sbArchivoSalidaPMClick(Sender: TObject);
begin
  sdArchivoSalidaPM.FileName := cve_PM + '_' + FormatDateTime('ddmmyyyy', dtFFin.Date) + '.ext';
  If sdArchivoSalidaPM.Execute then
  begin
    edArchivoSalidaPM.Text := sdArchivoSalidaPM.FileName;
    if FileExists(sdArchivoSalidaPM.FileName) then
    begin
      if MessageDlg('Reporte existente. ¿Desea sobreescribirlo?',
         mtConfirmation, [mbYes, mbNo], 0) <> mrYes
      then edArchivoSalidaPM.Text := '';
    end;
  end
  else
    edArchivoSalidaPF.Text := '';
end;

procedure TWCrActPa.GeneraReportePM(Nombre:String; cveUsuario:String);
var
  sdoActual : Real;
begin
end;

procedure TWCrActPa.GeneraReportePF(Nombre:String; vlQry:TQuery; cveUsuario:String);
var
  txtFile : TextFile;
  text, eol : String;
  sdoActual : Real;
  sdoVencido : Real;
  nRegs : Integer;
begin
  AssignFile(txtFile, Nombre);
  ReWrite(txtFile);
  eol := '|**|';
  //Linea de inicio
  text := 'BOF|' + cveUsuario + '|' +FormatDateTime('ddmmyyyy', dtFFin.Date) + eol;
  WriteLn(txtFile, text);
  if Assigned(vlQry) then
  begin
    nRegs := 0;
    sdoActual := 0;
    sdoVencido := 0;
    while not vlQry.Eof do
    begin
      sdoActual := sdoActual + vlQry.FieldByName('SALDO_ACTUAL').AsFloat;
      sdoVencido := sdoVencido + vlQry.FieldByName('SALDO_VENCIDO').AsFloat;
      nRegs := nRegs + 1;
      text :=
           vlQry.FieldByName('NUMERO_CUENTA').AsString + '|' +
           vlQry.FieldByName('TIPO_RESPONSABILIDAD').AsString + '|' +
           vlQry.FieldByName('TIPO_CREDITO').AsString + '|' +
           vlQry.FieldByName('TIPO_CONTRATO').AsString + '|' +
           vlQry.FieldByName('CLAVE_MONEDA').AsString + '|' +
           vlQry.FieldByName('NUMERO_PAGOS').AsString + '|' +
           vlQry.FieldByName('CLAVE_FRECUENCIA_PAGOS').AsString + '|' +
           vlQry.FieldByName('MONTO_A_PAGAR').AsString + '|' +
           vlQry.FieldByName('FECHA_APERTURA').AsString + '|' +
           vlQry.FieldByName('FECHA_ULTIMO_PAGO').AsString + '|' +
           vlQry.FieldByName('FECHA_ULTIMA_COMPRA').AsString + '|' +
           vlQry.FieldByName('FECHA_LIQUIDACION').AsString + '|' +
           FormatDateTime('ddmmyyyy', dtFFin.Date) + '|' +
           vlQry.FieldByName('CREDITO_MAXIMO').AsString + '|' +
           vlQry.FieldByName('SALDO_ACTUAL').AsString + '|' +
           vlQry.FieldByName('LIMITE_CREDITO').AsString + '|' +
           vlQry.FieldByName('SALDO_VENCIDO').AsString + '|' +
           vlQry.FieldByName('PAGOS_VENCIDOS').AsString + '|' +
           vlQry.FieldByName('CVE_FORMA_PAGO').AsString + '|' +
           vlQry.FieldByName('CLAVE_OBSERVACION').AsString + eol;
      WriteLn(txtFile, text);
      vlQry.Next;
    end;
    vlQry.Close;
    vlQry.Free;
  end;
  text := 'EOF|' + IntToStr(nRegs) + '|' + FloatToStr(sdoActual) + '|' + FloatToStr(sdoVencido) + eol;
  WriteLn(txtFile, text);
  CloseFile(txtFile);
end;

procedure TWCrActPa.bbGenReporteClick(Sender: TObject);
var
  //Para la inserción a la base de datos
  vlSQL    : String;
  vlSQL_0    : String;

  //Para el proceso
  vlStp : TStoredProc;
  vlQry : TQuery;

  PPResultado: String;
  fechaIni : TDateTime;
  fechaFin : TDateTime;
  credito   : String;

  cveUsuario : String;

  //Para la barra de progreso
  ani : TAniBarThread;
  r : TRect;

begin

  //Verifica que existe al menos un reporte seleccionado
  if Not (cbPersonasFisicas.checked or cbPersonasMorales.checked or cbHipotecarios.checked ) then
  begin
    ShowMessage('Debe seleccionar al menos un tipo de reporte');
    exit;
  end;

  if ((edArchivoSalidaPF.Text = '') and cbPersonasFisicas.checked) or
     ((edArchivoSalidaH.Text = '') and cbHipotecarios.checked) or
     ((edArchivoSalidaPM.Text = '') and cbPersonasMorales.checked) then
  begin
    ShowMessage('Debe definir los nombres de los reportes');
    Exit;
  end;

  {* Inicia las variables para actualizar el medidor
   *}
  r := pAniBar.ClientRect;
  InflateRect(r, - pAniBar.BevelWidth, - pAniBar.BevelWidth);
  ani := TAniBarThread.Create(pAniBar, r, pAniBar.color, clBlue, 100);
  bbGenReporte.Enabled := False;


  //Define los parámetros básicos para el llamado
  vlStp := TStoredProc.Create(Self);
  vlStp.DatabaseName:= Objeto.Apli.DatabaseName;
  vlStp.SessionName:= Objeto.Apli.SessionName;

  try
    try
      fechaIni := dtFInicio.Date;
      fechaFin := dtFFin.Date;

      {*
       * Identifica los créditos modificados en el periodo
       *}
        vlSQL :=  //** Disposiciones modificadas en el periodo sin utilizar fecha valor
                  //TRANSACCION
                  // Modificaciones de transacciones para ICRE
                  'select id_credito as credito from ( ' + //** DEBUG
                  'select ''TRANS'' as tipo, trans.id_credito, max(f_operacion) f_valor ' +
                  'from cr_transaccion trans, ' +
                  'cr_credito cred ' +
                  'where ' +
                  'trans.id_credito = cred.id_credito ' +
                  'and cred.b_envia_bnc = ''V'' ' +
                  'and cve_operacion in (''PAGOIN'', ''PAGOCP'', ''PAGCAP'') ' +
                  'and sit_transaccion = ''AC'' ' +
                  'and id_trans_cancela is NULL ' +
                  'and f_operacion <= ' + SQLFecha(fechaFin) + ' ' +
                  'and f_operacion >= ' + SQLFecha(fechaIni) + ' ' +
                  'group by trans.id_credito ' +
                  'union ' +
                  // Modificaciones de transacciones para CRED
                  'select ''TRANS'', trans.id_credito, max(f_liquidacion) as f_valor from ' +
                  'cre_transaccion trans, ' +
                  'cre_credito cred ' +
                  'where ' +
                  'trans.id_credito = cred.id_credito ' +
                  'and b_envia_bnc = ''V''  ' +
                  'and trans.sit_transaccion = ''AC''  ' +
                  'and trans.cve_operacion in (''CPECAP'', ''CPINTP'') ' +
                  'and f_liquidacion <= ' + SQLFecha(fechaFin) + ' ' +
                  'and f_liquidacion >= ' + SQLFecha(fechaIni) + ' ' +
                  'group by trans.id_credito ' +
                  'union ' +

                  // Modificaciones de transacciones para ICRE utilizando cre_capital
                  'select ''TRANS'', cap.id_credito, max(f_pago) as f_valor from ' +
                  'cr_capital cap, ' +
                  'cr_credito cred ' +
                  'where ' +
                  'cap.id_credito = cred.id_credito ' +
                  'and b_envia_bnc = ''V'' ' +
                  'and f_pago <= ' + SQLFecha(fechaFin) + ' ' +
                  'and f_pago >= ' + SQLFecha(fechaIni) + ' ' +
                  'group by cap.id_credito ' +
                  'union ' +
                  // Modificaciones de transacciones para ICRE utilizando cre_interes
                  'select ''TRANS'', cap.id_credito, max(f_pago) as f_valor from ' +
                  'cr_interes cap, ' +
                  'cr_credito cred ' +
                  'where ' +
                  'cap.id_credito = cred.id_credito ' +
                  'and b_envia_bnc = ''V'' ' +
                  'and f_pago <= ' + SQLFecha(fechaFin) + ' ' +
                  'and f_pago >= ' + SQLFecha(fechaIni) + ' ' +
                  'group by cap.id_credito ' +
                  'union ' +
                  // Modificaciones de transacciones para CRED utilizando cre_capital
                  'select ''TRANS'', cap.id_credito, max(f_pago) as f_valor from ' +
                  'cre_capital cap, ' +
                  'cre_credito cred ' +
                  'where ' +
                  'cap.id_credito = cred.id_credito ' +
                  'and b_envia_bnc = ''V'' ' +
                  'and f_pago <= ' + SQLFecha(fechaFin) + ' ' +
                  'and f_pago >= ' + SQLFecha(fechaIni) + ' ' +
                  'group by cap.id_credito ' +
                  'union ' +
                  // Modificaciones de transacciones para CRED utilizando cre_interes
                  'select ''TRANS'', cap.id_credito, max(f_pago) as f_valor from ' +
                  'cre_interes cap, ' +
                  'cre_credito cred ' +
                  'where ' +
                  'cap.id_credito = cred.id_credito ' +
                  'and b_envia_bnc = ''V'' ' +
                  'and f_pago <= ' + SQLFecha(fechaFin) + ' ' +
                  'and f_pago >= ' + SQLFecha(fechaIni) + ' ' +
                  'group by cap.id_credito ' +
                  'union ' +
                  
                  //LIQUIDACION
                  // Disposiciones liguidadas para ICRE
                  'select   ''LIQ''as tipo, cred.id_credito, credtr.f_valor as f_valor ' +
                  'from     cr_credito cred, ' +
                  '				 (select id_credito, max (f_valor) as f_valor from ( ' +
                  '						select   id_credito, ' +
                  '						max (f_valor_pago) as f_valor ' +
                  '						from     cr_interes ' +
                  '						group by id_credito ' +
                  '						union ' +
                  '						select   id_credito, ' +
                  '						max (f_valor_pago) as f_valor ' +
                  '						from     cr_capital ' +
                  '						group by id_credito ' +
                  '				   ) ' +
                  '					 group by id_credito ' +
                  '         ) credtr ' +
                  'where    cred.id_credito = credtr.id_credito ' +
                  'and			 b_envia_bnc = ''V'' ' +
                  'and      sit_credito = ''LQ'' ' +
                  'and 		 cred.f_liquidacion is not null ' +
                  'and 		 credtr.f_valor <= ' + SQLFecha(fechaFin) + ' ' +
                  'and 		 credtr.f_valor >= ' + SQLFecha(fechaIni) + ' ' +
                  'union ' +
                  // Disposiciones liguidadas para CRED
                  'select   ''LIQ''as tipo, cred.id_credito, credtr.f_valor as f_valor ' +
                  'from     cre_credito cred, ' +
                  '				 (select id_credito, max (f_valor) as f_valor from ( ' +
                  '						select   id_credito, ' +
                  '						max (f_pago) as f_valor ' +
                  '						from     cre_interes ' +
                  '						group by id_credito ' +
                  '						union ' +
                  '						select   id_credito, ' +
                  '						max (f_pago) as f_valor ' +
                  '						from     cre_capital ' +
                  '						group by id_credito ' +
                  '						) ' +
                  '						group by id_credito ' +
                  '         ) credtr ' +
                  'where    cred.id_credito = credtr.id_credito ' +
                  'and			 b_envia_bnc = ''V'' ' +
                  'and      sit_credito = ''LQ'' ' +
                  'and 		 cred.f_liq_bnc is not null ' +
                  'and 		 credtr.f_valor <= ' + SQLFecha(fechaFin) + ' ' +
                  'and 		 credtr.f_valor >= ' + SQLFecha(fechaIni) + ' ' +
                  ')';

      vlQry := GetSQLQueryNoNil(vlSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );

      //Inserta los créditos en la tabla temporal BC_CREDFVAL
      if Assigned(vlQry) then
      begin

        //Elimina la información de la tabla con los créditos fecha valor
        vlSQL := ' delete from BC_CREDFVAL ';
        RunSQL (vlSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True);

        while not vlQry.Eof do
        begin
          credito :=  vlQry.FieldByName('credito').asString;

          vlSQL := ' insert into BC_CREDFVAL (id_credito) ' +
                   ' values (' + credito + ')';
          RunSQL (vlSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True);
          vlQry.Next;
        end;
      end;

      {* Ejecuta el proceso que genera la tabla BC_LAYOUT para estos créditos
       *}
      vlStp := TStoredProc.Create(Self);
      With vlStp Do
      Begin
        vlStp.DatabaseName:= Objeto.Apli.DatabaseName;
        vlStp.SessionName:= Objeto.Apli.SessionName;
        package := 'PKGBUROCFA_FVAL';
        vlStp.StoredProcName:= package + '.STP_RECARGA_BC_LAYOUT';

        Params.Clear;
        Params.CreateParam( ftInteger, 'V_ANIO_MES',     ptInput);
        Params.CreateParam( ftDate,    'V_FECHA_INI',    ptInput);
        Params.CreateParam( ftDate,    'V_FECHA_FIN',    ptInput);
        Params.CreateParam( ftInteger, 'P_CANTIDAD',     ptOutput);
        Params.CreateParam( ftInteger, 'P_RESULTADO',    ptOutput);
        Params.CreateParam( ftString,  'P_TX_RESULTADO', ptOutput);

        Prepare;
        ParamByName('V_ANIO_MES').AsInteger        := StrToInt(FormatDateTime('yyyymm', dtFFin.Date));
        ParamByName('V_FECHA_INI').AsDate          := dtFInicio.Date;
        ParamByName('V_FECHA_FIN').AsDate          := dtFFin.Date;

        ExecProc;

        If (ParamByName('P_RESULTADO').AsInteger <> 0) then
        begin
           PPResultado := 'Error No ' + ParamByName('P_TX_RESULTADO').AsString;
           Raise Exception.Create(PPResultado);
        end;

      end; //with

      {* Genera el reporte utilizando BC_LAYOUT como repositorio
       *}


      //Reporte para persona físicas
      if cbPersonasFisicas.checked then
      begin
        // -> Si existe la clave para personas físicas genera el reporte
        vlQry := GetSqlQueryNoNil( 'select DESC_CLAVE as clave_usuario from BC_CON_CAT_DATA WHERE CVE_CON_GPO_CAT = ''CAT_CONC_BURO'' and CVE_CLAVE = ''MCPF''',
                             Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
        If Assigned(vlQry) Then
        begin
          //Extrae la clave de usuario y la agrega a la consulta
          cveUsuario := vlQry.FieldByName('clave_usuario').asString;
          vlQry.Close;
          vlQry.Free;
          
          //Consulta genérica para persona físicas
          vlSQL_0 :=  ' select	lout.NUMERO_CUENTA, ' +         				//1 Número de cuenta
                '	lout.TIPO_RESPONSABILIDAD,' +                //2 Tipo de responsabilidad
                '	lout.TIPO_CREDITO, ' +                       //3 Tipo de cuenta
                '	lout.TIPO_CONTRATO, ' +                      //4 Tipo de contrato
                '	lout.CLAVE_MONEDA, ' +                       //5 Tipo de moneda
                '	lout.NUMERO_PAGOS, ' +                       //6 Número de pagos
                '	lout.CLAVE_FRECUENCIA_PAGOS as CLAVE_FRECUENCIA_PAGOS, ' +         //7 Frecuencia de pago
                '	round(lout.MONTO_A_PAGAR) as MONTO_A_PAGAR, ' +                      //8 Monto a pagar
                '	nvl(to_char(lout.FECHA_APERTURA,''ddmmyyyy''),'''') as FECHA_APERTURA, ' +                     //9 Fecha de Apertura del crédito
                '	nvl(to_char(lout.FECHA_ULTIMO_PAGO,''ddmmyyyy''),'''') as FECHA_ULTIMO_PAGO, ' +                  //10 Fecha de último pago
                '	nvl(to_char(lout.FECHA_ULTIMA_COMPRA,''ddmmyyyy''),'''') as FECHA_ULTIMA_COMPRA, ' +                //11 Fecha de última compra
                '	nvl(to_char(lout.FECHA_LIQUIDACION,''ddmmyyyy''),'''') as FECHA_LIQUIDACION, ' +                  //12 Fecha de liquidación
                '	round(lout.CREDITO_MAXIMO) as CREDITO_MAXIMO, ' +                     //14 Crédito máximo
                '	round(lout.SALDO_ACTUAL) as SALDO_ACTUAL, ' +                       //15 Saldo actual
                '	round(lout.LIMITE_CREDITO) as LIMITE_CREDITO, ' +                     //16 Límite de crédito
                '	round(lout.SALDO_VENCIDO) as SALDO_VENCIDO, ' +                      //17 Saldo vencido
                '	lout.PAGOS_VENCIDOS, ' +                     //18 Número de pagos con atraso
                ' fp.forma_pago as cve_forma_pago, ' +         //19 Forma de pago
                '	lout.CLAVE_OBSERVACION, ' +                   //20 Clave de observación
                '	lout.TIPO_CLIENTE, ' +                   //para extraer el tipo de reporte
                '	lout.TIPO_CONTRATO ' +                   //para extraer el tipo de reporte
                ' from bc_layout lout, ' +
                ' (select id_credito, ' +
                '         PKGBUROCFA.FUN_FORMA_PAGO_ICRE ( ' +
                '                 id_credito, ' +
                '                 ' + SQLFecha(dtFInicio.Date)  + ', ' +
                '                 ' + SQLFecha(dtFFin.Date) +
                '               ) as forma_pago ' +
                '        from   cr_credito, ' +
                '               dual ' +
                '        union ' +
                '        select id_credito, ' +
                '               PKGBUROCFA.FUN_FORMA_PAGO_INTERCRED ( ' +
                '                 id_credito, ' +
                '                 ' + SQLFecha(dtFInicio.Date) + ', ' +
                '                 ' + SQLFecha(dtFFin.Date) +
                '               ) as forma_pago ' +
                '        from   cre_credito, ' +
                '               dual) fp ';

          //Completa la consulta agregando la base de datos y la clave de usuario
          vlSQL := vlSQL_0 +
                'where  trim (lout.numero_cuenta) = to_char (fp.id_credito) ' +
                'and tipo_cliente = ''3'' and tipo_contrato = ''PL'' ';
          vlQry := GetSQLQueryNoNil( vlSQL,
                                     Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
          //Genera el reporte
          GeneraReportePF(edArchivoSalidaPF.Text, vlQry, cveUsuario);
        end
        else
          ShowMessage('No existe clave asignada en el catálogo para personas físicas');
        // <--


      end;

      //Reporte para hipotecarios
      if cbHipotecarios.checked then
      begin
        // -> Si existe la clave para hipotecarios genera el reporte
        vlQry := GetSqlQueryNoNil( 'select DESC_CLAVE as clave_usuario from BC_CON_CAT_DATA WHERE CVE_CON_GPO_CAT = ''CAT_CONC_BURO'' and CVE_CLAVE = ''MCH''',
                             Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
        If Assigned(vlQry) Then
        begin
          //Extrae la clave de usuario y la agrega a la consulta
          cveUsuario := vlQry.FieldByName('clave_usuario').asString;
          vlQry.Close;
          vlQry.Free;

          vlSQL_0 :=  ' select	lout.NUMERO_CUENTA, ' +         				//1 Número de cuenta
                '	lout.TIPO_RESPONSABILIDAD,' +                //2 Tipo de responsabilidad
                '	lout.TIPO_CREDITO, ' +                       //3 Tipo de cuenta
                '	lout.TIPO_CONTRATO, ' +                      //4 Tipo de contrato
                '	lout.CLAVE_MONEDA, ' +                       //5 Tipo de moneda
                '	lout.NUMERO_PAGOS, ' +                       //6 Número de pagos
                '	lout.CLAVE_FRECUENCIA_PAGOS as CLAVE_FRECUENCIA_PAGOS, ' +         //7 Frecuencia de pago
                '	round(lout.MONTO_A_PAGAR) as MONTO_A_PAGAR, ' +                      //8 Monto a pagar
                '	nvl(to_char(lout.FECHA_APERTURA,''ddmmyyyy''),'''') as FECHA_APERTURA, ' +                     //9 Fecha de Apertura del crédito
                '	nvl(to_char(lout.FECHA_ULTIMO_PAGO,''ddmmyyyy''),'''') as FECHA_ULTIMO_PAGO, ' +                  //10 Fecha de último pago
                '	nvl(to_char(lout.FECHA_ULTIMA_COMPRA,''ddmmyyyy''),'''') as FECHA_ULTIMA_COMPRA, ' +                //11 Fecha de última compra
                '	nvl(to_char(lout.FECHA_LIQUIDACION,''ddmmyyyy''),'''') as FECHA_LIQUIDACION, ' +                  //12 Fecha de liquidación
                '	round(lout.CREDITO_MAXIMO) as CREDITO_MAXIMO, ' +                     //14 Crédito máximo
                '	round(lout.SALDO_ACTUAL) as SALDO_ACTUAL, ' +                       //15 Saldo actual
                '	round(lout.LIMITE_CREDITO) as LIMITE_CREDITO, ' +                     //16 Límite de crédito
                '	round(lout.SALDO_VENCIDO) as SALDO_VENCIDO, ' +                      //17 Saldo vencido
                '	lout.PAGOS_VENCIDOS, ' +                     //18 Número de pagos con atraso
                ' fp.forma_pago as cve_forma_pago, ' +         //19 Forma de pago
                '	lout.CLAVE_OBSERVACION, ' +                   //20 Clave de observación
                '	lout.TIPO_CLIENTE, ' +                   //para extraer el tipo de reporte
                '	lout.TIPO_CONTRATO ' +                   //para extraer el tipo de reporte
                ' from bc_layout lout, ' +
                ' (select id_credito, ' +
                '         PKGBUROCFA.FUN_FORMA_PAGO_ICRE ( ' +
                '                 id_credito, ' +
                '                 ' + SQLFecha(dtFInicio.Date)  + ', ' +
                '                 ' + SQLFecha(dtFFin.Date) +
                '               ) as forma_pago ' +
                '        from   cr_credito, ' +
                '               dual ' +
                '        union ' +
                '        select id_credito, ' +
                '               PKGBUROCFA.FUN_FORMA_PAGO_INTERCRED ( ' +
                '                 id_credito, ' +
                '                 ' + SQLFecha(dtFInicio.Date) + ', ' +
                '                 ' + SQLFecha(dtFFin.Date) +
                '               ) as forma_pago ' +
                '        from   cre_credito, ' +
                '               dual) fp ';

          //Completa la consulta agregando la base de datos y la clave de usuario
          vlSQL := vlSQL_0 +
                'where  trim (lout.numero_cuenta) = to_char (fp.id_credito) ' +
                'and tipo_cliente = ''3'' and tipo_contrato = ''RE'' ';
          vlQry := GetSQLQueryNoNil( vlSQL,
                                     Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
          //Genera el reporte
          GeneraReportePF(edArchivoSalidaH.Text, vlQry, cveUsuario);
        end
        else
          ShowMessage('No existe clave asignada en el catálogo para hipotecarios');
        // <--

      end;

      //Reporte para personas morales
      if cbPersonasMorales.checked then
      begin
        // -> Si existe la clave para personas morales genera el reporte
        vlQry := GetSqlQueryNoNil( 'select DESC_CLAVE as clave_usuario from BC_CON_CAT_DATA WHERE CVE_CON_GPO_CAT = ''CAT_CONC_BURO'' and CVE_CLAVE = ''MCPM''',
                             Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
        If Assigned(vlQry) Then
        begin
          //Extrae la clave de usuario
          cveUsuario := vlQry.FieldByName('clave_usuario').asString;
          vlQry.Close;
          vlQry.Free;

          vlSQL_0 :=  ' select	lout.NUMERO_CUENTA, ' +         				//1 Número de cuenta
                '	lout.TIPO_RESPONSABILIDAD,' +                //2 Tipo de responsabilidad
                '	lout.TIPO_CREDITO, ' +                       //3 Tipo de cuenta
                '	lout.TIPO_CONTRATO, ' +                      //4 Tipo de contrato
                '	lout.CLAVE_MONEDA, ' +                       //5 Tipo de moneda
                '	lout.NUMERO_PAGOS, ' +                       //6 Número de pagos
                '	lout.CLAVE_FRECUENCIA_PAGOS_NUM as CLAVE_FRECUENCIA_PAGOS, ' +         //7 Frecuencia de pago
                '	round(lout.MONTO_A_PAGAR) as MONTO_A_PAGAR, ' +                      //8 Monto a pagar
                '	nvl(to_char(lout.FECHA_APERTURA,''ddmmyyyy''),'''') as FECHA_APERTURA, ' +                     //9 Fecha de Apertura del crédito
                '	nvl(to_char(lout.FECHA_ULTIMO_PAGO,''ddmmyyyy''),'''') as FECHA_ULTIMO_PAGO, ' +                  //10 Fecha de último pago
                '	nvl(to_char(lout.FECHA_ULTIMA_COMPRA,''ddmmyyyy''),'''') as FECHA_ULTIMA_COMPRA, ' +                //11 Fecha de última compra
                '	nvl(to_char(lout.FECHA_LIQUIDACION,''ddmmyyyy''),'''') as FECHA_LIQUIDACION, ' +                  //12 Fecha de liquidación
                '	round(lout.CREDITO_MAXIMO) as CREDITO_MAXIMO, ' +                     //14 Crédito máximo
                '	round(lout.SALDO_ACTUAL) as SALDO_ACTUAL, ' +                       //15 Saldo actual
                '	round(lout.LIMITE_CREDITO) as LIMITE_CREDITO, ' +                     //16 Límite de crédito
                '	round(lout.SALDO_VENCIDO) as SALDO_VENCIDO, ' +                      //17 Saldo vencido
                '	lout.PAGOS_VENCIDOS, ' +                     //18 Número de pagos con atraso
                ' decode(fp.forma_pago, ''96'', ''9'',fp.forma_pago) as cve_forma_pago, ' +         //19 Forma de pago
                '	lout.CLAVE_OBSERVACION, ' +                   //20 Clave de observación
                '	lout.TIPO_CLIENTE, ' +                   //para extraer el tipo de reporte
                '	lout.TIPO_CONTRATO ' +                   //para extraer el tipo de reporte
                ' from bc_layout lout, ' +
                ' (select id_credito, ' +
                '         PKGBUROCFA.FUN_FORMA_PAGO_ICRE ( ' +
                '                 id_credito, ' +
                '                 ' + SQLFecha(dtFInicio.Date)  + ', ' +
                '                 ' + SQLFecha(dtFFin.Date) +
                '               ) as forma_pago ' +
                '        from   cr_credito, ' +
                '               dual ' +
                '        union ' +
                '        select id_credito, ' +
                '               PKGBUROCFA.FUN_FORMA_PAGO_INTERCRED ( ' +
                '                 id_credito, ' +
                '                 ' + SQLFecha(dtFInicio.Date) + ', ' +
                '                 ' + SQLFecha(dtFFin.Date) +
                '               ) as forma_pago ' +
                '        from   cre_credito, ' +
                '               dual) fp ';


          //Completa la consulta agregando la base de datos
          vlSQL := vlSQL_0 +
                'where  trim (lout.numero_cuenta) = to_char (fp.id_credito) ' +
                'and (tipo_cliente = ''1'' or tipo_cliente = ''2'') ';
          vlQry := GetSQLQueryNoNil( vlSQL,
                                     Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
          //Genera el reporte
          GeneraReportePF(edArchivoSalidaPM.Text, vlQry, cveUsuario);

        end
        else
          ShowMessage('No existe clave asignada en el catálogo para personas físicas');
        // <--
      end;

    finally
      //detiene la barra de progreso
      bbGenReporte.Enabled := true;
      ani.Terminate;
      If Assigned(vlStp) Then
        vlStp.Free;

    end;

    MessageDlg('Tabla generada correctamente', mtInformation, [mbOk], 0 );

    //Guarda las fechas del periodo utilizado si no hubo errores
    RunSQL( 'update BC_CON_CAT_DATA set desc_clave = TO_CHAR('+SQLFecha(dtFInicio.Date)+',''YYYYMMDD'') ' +
            'where cve_con_gpo_cat = ''CAT_CONC_BURO'' and cve_clave = ''RPFINI'''
           , Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);

    RunSQL( 'update BC_CON_CAT_DATA set desc_clave = TO_CHAR('+SQLFecha(dtFFin.Date)+',''YYYYMMDD'') ' +
            'where cve_con_gpo_cat = ''CAT_CONC_BURO'' and cve_clave = ''RPFFIN'''
           , Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
  except
    on e : exception do
    Begin
      MessageDlg('No se generó el reporte debido a un error.' + e.Message, mtError, [mbOk], 0 );
    End;
  end;

end;

procedure TWCrActPa.cbPersonasFisicasClick(Sender: TObject);
begin
  edArchivoSalidaPF.Enabled := not edArchivoSalidaPF.Enabled;
  sbArchivoSalidaPF.Enabled := not sbArchivoSalidaPF.Enabled;
end;

procedure TWCrActPa.cbHipotecariosClick(Sender: TObject);
begin
  edArchivoSalidaH.Enabled := not edArchivoSalidaH.Enabled;
  sbArchivoSalidaH.Enabled := not sbArchivoSalidaH.Enabled;
end;

procedure TWCrActPa.cbPersonasMoralesClick(Sender: TObject);
begin
  edArchivoSalidaPM.Enabled := not edArchivoSalidaPM.Enabled;
  sbArchivoSalidaPM.Enabled := not sbArchivoSalidaPM.Enabled;
end;

procedure TWCrActPa.dtFFinChange(Sender: TObject);
begin
  edArchivoSalidaPF.text := cve_PF + '_' + FormatDateTime('ddmmyyyy', dtFFin.Date) + '.ext';
  edArchivoSalidaH.text := cve_H + '_' + FormatDateTime('ddmmyyyy', dtFFin.Date) + '.ext';
  edArchivoSalidaPM.text := cve_PM + '_' + FormatDateTime('ddmmyyyy', dtFFin.Date) + '.ext';
end;

end.
