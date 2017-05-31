//------------------------------------------------------------------------------
// Función    : Acuse de Recibo (Cancelación de Contrato)
// Desarrollo : Cesar Zamora Ramirez
// Fecha      : 18 de Febrero del 2015
//------------------------------------------------------------------------------
Unit IntAcuseRecibo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm, DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntFind,
  UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, IntLinkit, QuickRpt, RichEdit,
  NMsmtp, Printers, ComObj, Menus, unRpAcuseRec, IntSbParamIcb, IntEMaiPers,
  IntCtoCanBitEnvio, UnFunProcICB;

Type
  TAcuseRec = Class;
  
  TWAcuseRec = Class(TForm)
    InterForma: TInterForma;
    gbEmail: TGroupBox;
    sbNuePara: TSpeedButton;
    sbEliPara: TSpeedButton;
    lvPara: TListView;
    lDe: TLabel;
    lAsunto: TLabel;
    eAsunto: TEdit;
    Label1: TLabel;
    mMensaje: TMemo;
    sbParametros: TSpeedButton;
    eDe: TEdit;
    gbInfoGen: TGroupBox;
    lFH_Cancelado: TLabel;
    ieFH_Cancelado: TInterEdit;
    lCveUsrCancelado: TLabel;
    ieCveUsrCancelado: TInterEdit;
    lIdContrato: TLabel;
    ieIdContrato: TInterEdit;
    lIdCancelado: TLabel;
    ieIdCancelado: TInterEdit;
    lPara: TLabel;
    sbBitEnvio: TSpeedButton;
    bSeparador: TBevel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterFormaPreview(Sender: TObject);
    procedure InterFormaImprimir(Sender: TObject);
    procedure sbParametrosClick(Sender: TObject);
    procedure sbNueParaClick(Sender: TObject);
    procedure sbEliParaClick(Sender: TObject);
    procedure sbBitEnvioClick(Sender: TObject);
    procedure InterFormaAyuda(Sender: TObject);
    private
      { Private declarations }
      QRAcuseRecibo : TRpAcuseRec;
    public
      { Public declarations }
      Objeto : TAcuseRec;
      procedure InicializaValores;
      function  Guardar(pPath : String) : Boolean;                                               // Guarda acuse de recibo en formato PDF
      procedure EnviaEmail;                                                                      // Envia por Email acuse de recibo en formato PDF
      procedure Formato(pIdCancelacion : String; pIdContrato : String; pCveTipContrato : String; // Configura formato de richedit en Acuse de recibo
                        pFCancelacion  : String; pFAltaCto   : String; pNomTitular     : String; pNomEmpresa   : String);
      procedure Imprimir(pEnviarAImpresora : Boolean);                                           // Imprime acuse de recibo
    end;

  TAcuseRec = class(TInterFrame)
    private
      { Private declarations }
    protected
      { Protected declarations }
      vmMensaje : TMemo;
      vPrevio   : Boolean;
    public
      { Public declarations }
      Id_Cancelado      : TInterCampo;
      Id_Contrato       : TInterCampo;
      Cve_Usr_Cancelado : TInterCampo;
      Fh_Cancelado      : TInterCampo;

      De      : TSbParIcb;
      Para    : TEmaiPers;
      Asunto  : TSbParIcb;
      Mensaje : TSbParIcb;

      procedure   DataBaseChange;
      constructor Create(AOwner : TComponent); override;
      destructor  Destroy; override;
      function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      procedure   AfterLocalizaMensaje(Sender: TObject);
    published
      { Published declarations }
      property pmMensaje : TMemo   read vmMensaje write vmMensaje;
      property pPrevio   : Boolean read vPrevio   write vPrevio;
    end;
var
  reAcuseRecibo : TRichEdit;
implementation
  {$R *.DFM}

constructor TAcuseRec.Create(AOwner : TComponent);
begin
   Inherited;

   Id_Cancelado      := CreaCampo('ID_CANCELADO',      ftInteger, tsNinguno, tsNinguno, True);
   Id_Contrato       := CreaCampo('ID_CONTRATO',       ftInteger, tsNinguno, tsNinguno, True);
   Cve_Usr_Cancelado := CreaCampo('CVE_USR_CANCELADO', ftString,  tsNinguno, tsNinguno, True);
   Fh_Cancelado      := CreaCampo('FH_CANCELADO',      ftString,  tsNinguno, tsNinguno, True);

   De                      := TSbParIcb.Create(Self);
   De.MasterSource         := Self;
   Para                    := TEmaiPers.Create(Self);
   Para.MasterSource       := Self;
   Asunto                  := TSbParIcb.Create(Self);
   Asunto.MasterSource     := Self;
   Mensaje                 := TSbParIcb.Create(Self);
   Mensaje.MasterSource    := Self;
   Mensaje.OnAfterLocaliza := AfterLocalizaMensaje;

   TableName := 'CONTRATO_CAN';
   FKeyFields.Add('ID_CANCELADO');
   FKeyFields.Add('ID_CONTRATO');

   UseQuery        := True;
   ShowMenuReporte := True;
end;

destructor TAcuseRec.Destroy;
begin
   inherited;
end;

procedure TAcuseRec.DataBaseChange;
begin
   inherited;
   De.GetParams(Self);
   Para.GetParams(Self);
   Asunto.GetParams(Self);
   Mensaje.GetParams(Self);
end;

function TAcuseRec.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TWAcuseRec;
begin
   W := TWAcuseRec.Create(Self);
   try
      W.Objeto                   := Self;
      W.InterForma.InterFrame    := Self;
      W.InterForma.FormaTipo     := ftImprimir;
      W.InterForma.ShowGrid      := False;
      W.InterForma.ShowNavigator := False;
      W.InterForma.Funcion       := FInterFun;
      W.QRAcuseRecibo            := TRpAcuseRec.Create(self);
      pmMensaje                  := W.mMensaje;
      W.InterForma.ShowModal;
      ShowWindow                 := W.InterForma.ModalResult;
   finally
      if W.QRAcuseRecibo <> nil then FreeAndNil(W.QRAcuseRecibo);
      W.Free;
   end;
end;

procedure TWAcuseRec.InicializaValores;
var
   Qry : TQuery;
begin
   with Objeto do
   begin
      De.FindKey([33, 3]);                                                      // De
      try                                                                       // Para
         lvPara.Items.Clear;
         Qry := GetSqlQuery('select * '
                           + ' from ( '
                                 + ' select nvl(per.e_mail, ema.e_mail) as e_mail '
                                   + ' from contrato                cto '
                                        + ' left join persona       per on per.id_persona = cto.id_titular '
                                        + ' left join email_persona ema on ema.id_persona = cto.id_titular '
                                  + ' where cto.id_contrato = ' + Id_Contrato.AsSQL
                                  + ' union '                                       // A peticion de Sandra Barrera y Rafael Hernandez.
                                  + 'select nvl(per.e_mail, ema.e_mail) as e_mail ' // Si el Titular del Cto es PM, considerar el email del 1er representante legal registrado
                                   + ' from (select cte.id_persona, '
                                                + ' dense_rank() over (order by cte.fh_modificacion, nvl(cte.num_cotitular,0)) as id_registro '
                                           + ' from contrato                cto '
                                                + ' inner join persona_moral pm on pm.id_persona   = cto.id_titular '
                                                + ' inner join contratante  cte on cte.id_contrato = cto.id_contrato '
                                          + ' where cte.id_contrato     = ' + Id_Contrato.AsSQL
                                            + ' and cte.cve_contratante = ''C004'''
                                         + ' ) rep '
                                         + ' left join persona       per on per.id_persona = rep.id_persona '
                                         + ' left join email_persona ema on ema.id_persona = rep.id_persona '
                                  + ' where rep.id_registro = 1 '
                                + ' ) '
                          + ' where e_mail is not null',
                            Apli.DataBaseName, Apli.SessionName, False);
         if Qry <> nil then
            while not Qry.eof do
            begin
               AgregaFilaLvw(lvPara, [trim(Qry.FieldByName('E_MAIL').AsString)]);
               Qry.next;
            end;
      finally
         if Qry <> nil then
            Qry.Free;
      end;
      Asunto.FindKey([33, 4]);                                                  // Asunto
      AfterLocalizaMensaje(Self);                                               // Mensaje
   end;
end;

procedure TWAcuseRec.FormShow(Sender: TObject);
begin
   with Objeto do
   begin
      Id_Cancelado.Control        := ieIdCancelado;
      Id_Contrato.Control         := ieIdContrato;
      Cve_Usr_Cancelado.Control   := ieCveUsrCancelado;
      Fh_Cancelado.Control        := ieFH_Cancelado;
      De.VALUE_PARAM.Control      := eDe;
      De.ShowMenuCatalogo         := False;
      De.ShowMenuReporte          := False;
      De.ShowMenuClear            := True;
      eDe.PopupMenu               := De.PopMenu;
      Asunto.VALUE_PARAM.Control  := eAsunto;
      Asunto.ShowMenuCatalogo     := False;
      Asunto.ShowMenuReporte      := False;
      Asunto.ShowMenuClear        := True;
      eAsunto.PopupMenu           := Asunto.PopMenu;
      Mensaje.VALUE_PARAM.Control := mMensaje;
      Mensaje.ShowMenuCatalogo    := False;
      Mensaje.ShowMenuReporte     := False;
      Mensaje.ShowMenuClear       := True;
      mMensaje.PopupMenu          := Mensaje.PopMenu;
      QRAcuseRecibo.qReporte.Close;
      QRAcuseRecibo.qReporte.DatabaseName := Apli.DataBaseName;
      QRAcuseRecibo.qReporte.SessionName  := Apli.SessionName;
   end;
   InterForma.BtnPreview.Caption   := 'Guardar';
   InterForma.BtnPreview.ShowHint  := True;
   InterForma.BtnPreview.Hint      := 'Guarda Acuse de Recibo';
   InterForma.BtnImprimir.ShowHint := True;
   InterForma.BtnImprimir.Hint     := 'Imprime Acuse de Recibo';
   InterForma.BtnAyuda.Caption     := 'Email';
   InterForma.BtnAyuda.ShowHint    := True;
   InterForma.BtnAyuda.Hint        := 'Envia Acuse de Recibo por Email';
   InicializaValores;
   if Objeto.pPrevio then          Imprimir(False);
end;

procedure TWAcuseRec.FormDestroy(Sender: TObject);
begin
   with Objeto do
   begin
      Id_Cancelado.Control        := nil;
      Id_Contrato.Control         := nil;
      Cve_Usr_Cancelado.Control   := nil;
      Fh_Cancelado.Control        := nil;
      De.VALUE_PARAM.Control      := nil;
      Asunto.VALUE_PARAM.Control  := nil;
      Mensaje.VALUE_PARAM.Control := nil;
   end; 
end;

procedure TWAcuseRec.sbNueParaClick(Sender: TObject);
var
   n      : Integer;
   vEmail : String;
begin
   try
      vEmail := '';
      if MessageDlg('El email se encuentra registrado en GFI', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
      begin
         if Objeto.Para.Busca then
            vEmail := Trim(Objeto.Para.E_MAIL.AsString);
      end
      else
         InputQuery('Email Externo', 'Ingrese el dato', vEmail);
      if trim(vEmail) <> '' then
      begin
         for n := 0 to lvPara.Items.Count-1 do
         begin
            if trim(lvPara.Items[n].Caption) = trim(vEmail) then
               raise EInterFrame.Create('El email ya existe en el dato Para');
         end;
         AgregaFilaLvw(lvPara, [trim(vEmail)]);
      end;
   except
      on e: EInterFrame do
         MessageDlg(e.Message, mtInformation, [mbOK], 0);
   end;
end;

procedure TWAcuseRec.sbEliParaClick(Sender: TObject);
begin
   try
      if lvPara.Items.Count = 0 then
         exit;
      if lvPara.SelCount = 0 then
      begin
         lvPara.SetFocus;
         raise EInterFrame.Create('Seleccione un email en el dato Para');
      end;
      lvPara.Selected.Delete;
   except
      on e: EInterFrame do
         MessageDlg(e.Message, mtInformation, [mbOK], 0);
   end;
end;

procedure TWAcuseRec.sbParametrosClick(Sender: TObject);
var
   Parametros : TSbParIcb;
begin
   Parametros := TSbParIcb.Create(self);
   Parametros.GetParams(Objeto);
   Parametros.setParametros([33], [], True, False, True, False, True);
   Parametros.Catalogo;
   InicializaValores;
end;

procedure TWAcuseRec.sbBitEnvioClick(Sender: TObject);
var
   BitEnvio : TBitEnvCto;
begin
   BitEnvio := TBitEnvCto.Create(self);
   BitEnvio.GetParams(Objeto);
   BitEnvio.Catalogo;
end;

procedure TAcuseRec.AfterLocalizaMensaje(Sender: TObject);
var
   Qry : TQuery;
begin
   if pmMensaje <> nil then
      try
         pmMensaje.Lines.Clear;
         Qry := GetSqlQuery('select replace(replace(replace(pkgFunProcIcb.getParametroICB(33,5), ''@Contrato'', cto.id_contrato), '
                                                                                              + '''@Titular'', tit.nombre), '
                                                                                              + '''@Folio'', ' + trim(Id_Cancelado.AsString)
                                        + ') as mensaje '
                          + '  from contrato           cto '
                                + ' inner join persona tit on tit.id_persona = cto.id_titular '
                          + ' where cto.id_contrato = ' + Id_Contrato.AsSQL,
                            Apli.DataBaseName, Apli.SessionName, False);
         if Qry <> nil then
            pmMensaje.Lines.Add(trim(Qry.FieldByName('MENSAJE').AsString));
      finally
         if Qry <> nil then
            Qry.Free;
      end;
end;

procedure JustificarRichEdit(RichEdit : TRichEdit; AllText : Boolean);
const
   TO_ADVANCEDTYPOGRAPHY   = $1;
   EM_SETTYPOGRAPHYOPTIONS = (WM_USER + 202);
   EM_GETTYPOGRAPHYOPTIONS = (WM_USER + 203);
var
   ParaFormat : TParaFormat2;
   SelStart, SelLength : Integer;
begin
   FillChar(ParaFormat, SizeOf(ParaFormat), 0);
   ParaFormat.cbSize := SizeOf(ParaFormat);
   if SendMessage(RichEdit.handle, EM_SETTYPOGRAPHYOPTIONS, TO_ADVANCEDTYPOGRAPHY, TO_ADVANCEDTYPOGRAPHY) = 1 then
   begin
      SelStart                    := RichEdit.SelStart;
      SelLength                   := RichEdit.SelLength;
      if AllText then             RichEdit.SelectAll;
      ParaFormat.dwMask           := PFM_ALIGNMENT + PFM_LINESPACING;
      ParaFormat.wAlignment       := PFA_JUSTIFY;
      ParaFormat.bLineSpacingRule := 1; // Espacio entre lineas
      SendMessage(RichEdit.handle, EM_SETPARAFORMAT, 0, LongInt(@ParaFormat));
      RichEdit.SelStart           := SelStart;
      RichEdit.SelLength          := SelLength;
   end;
end;

function FormatoFecha(Fecha : String; Formato : String) : String;
var
   vDias  : String;
   vMes   : String;
   vAnio  : String;
   vFecha : String;
begin
   vDias := copy(Fecha, 1, 2);
   vMes  := copy(Fecha, 4, 2);
   vAnio := copy(Fecha, 7, 4);
   if trim(Formato) = 'corto' then
   begin
      if trim(vMes) = '01' then   vMes := 'Ene';
      if trim(vMes) = '02' then   vMes := 'Feb';
      if trim(vMes) = '03' then   vMes := 'Mar';
      if trim(vMes) = '04' then   vMes := 'Abr';
      if trim(vMes) = '05' then   vMes := 'May';
      if trim(vMes) = '06' then   vMes := 'Jun';
      if trim(vMes) = '07' then   vMes := 'Jul';
      if trim(vMes) = '08' then   vMes := 'Ago';
      if trim(vMes) = '09' then   vMes := 'Sep';
      if trim(vMes) = '10' then   vMes := 'Oct';
      if trim(vMes) = '11' then   vMes := 'Nov';
      if trim(vMes) = '12' then   vMes := 'Dic';
      vFecha := vDias + '-' + vMes + '-' + vAnio;
   end;
   if trim(Formato) = 'largo' then
   begin
      if trim(vMes) = '01' then   vMes := 'Enero';
      if trim(vMes) = '02' then   vMes := 'Febrero';
      if trim(vMes) = '03' then   vMes := 'Marzo';
      if trim(vMes) = '04' then   vMes := 'Abril';
      if trim(vMes) = '05' then   vMes := 'Mayo';
      if trim(vMes) = '06' then   vMes := 'Junio';
      if trim(vMes) = '07' then   vMes := 'Julio';
      if trim(vMes) = '08' then   vMes := 'Agosto';
      if trim(vMes) = '09' then   vMes := 'Septiembre';
      if trim(vMes) = '10' then   vMes := 'Octubre';
      if trim(vMes) = '11' then   vMes := 'Noviembre';
      if trim(vMes) = '12' then   vMes := 'Diciembre';
      vFecha := vDias + ' de ' + vMes + ' de ' + vAnio;
   end;
   result := vFecha;
end;

procedure TWAcuseRec.Formato(pIdCancelacion : String; pIdContrato : String; pCveTipContrato : String; pFCancelacion : String; pFAltaCto : String; pNomTitular : String; pNomEmpresa : String);
begin
   reAcuseRecibo := TRichEdit.Create(nil);
   with reAcuseRecibo do
   begin
      Font.Name := TFontName('Calibri');
      Font.Size := 12;
      Visible   := False;
      Parent    := Self;

      Text      := 'De acuerdo a su solicitud presentada el día ' + trim(pFCancelacion) + ', hago de su '
                 + 'conocimiento que a partir del día ' + trim(pFCancelacion) + ', el contrato de prestación '
                 + 'de servicios número ' + trim(pIdContrato) + ' a nombre de ' + trim(pNomTitular) + ', '
                 + 'celebrado el día ' + trim(pFAltaCto);
      if trim(pCveTipContrato) <> 'INET' then // A solicitud de Sandra Barrera y Rafael Hernandez, los ctos INET no muestran el nombre de la empresa
         Text   := Text + ' con ' + trim(pNomEmpresa);
      Text      := Text + ' queda cancelado definitivamente con el Número de Folio ' + trim(pIdCancelacion) + '.';

      SelStart  := pos(pIdCancelacion+'.', Text)-1;
      SelLength := length(pIdCancelacion);
      SelAttributes.Style := [fsUnderline];
      //------------------------------------------------------------------------
      SelStart  := pos(pIdContrato, Text)-1;
      SelLength := length(pIdContrato);
      SelAttributes.Style := [fsUnderline];
      //------------------------------------------------------------------------
      SelStart  := pos(pFCancelacion, Text)-1;
      SelLength := length(pFCancelacion);
      SelAttributes.Style := [fsUnderline];
      //------------------------------------------------------------------------
      SelStart  := 102;
      SelLength := length(pFCancelacion);
      SelAttributes.Style := [fsUnderline];
      //------------------------------------------------------------------------
      SelStart  := pos(pFAltaCto, Text)-1;
      SelLength := length(pFAltaCto);
      SelAttributes.Style := [fsUnderline];
      //------------------------------------------------------------------------
      SelStart  := pos(pNomTitular, Text)-1;
      SelLength := length(pNomTitular);
      SelAttributes.Style := [fsUnderline];
      //------------------------------------------------------------------------
      SelStart  := pos(pNomEmpresa, Text)-1;
      SelLength := length(pNomEmpresa);
      SelAttributes.Style := [fsUnderline];

      JustificarRichEdit(reAcuseRecibo, True);
      QRAcuseRecibo.QRRichText.ParentRichEdit := reAcuseRecibo;
   end;
end;

procedure TWAcuseRec.Imprimir(pEnviarAImpresora : Boolean);
var
   vQry : String;
begin
   vQry := 'select can.id_cancelado, can.id_contrato, can.cve_usr_cancelado, trunc(can.fh_cancelado) as f_cancelado, '
               + ' trim(initcap(cd.desc_poblacion)) || '', '' || trim(initcap(edo.desc_poblacion)) || '' a '' || ' + QuotedStr(FormatoFecha(DateToStr(now), 'largo')) + ' as f_reporte, '
               + ' cto.cve_tip_contrato, '
               + ' cto.f_alta as f_alta, '
               + ' tit.nombre as nom_titular, '
               + ' emp.nombre as nom_empresa '
         + '  from contrato_can              can '
               + ' inner join contrato       cto on cto.id_contrato   = can.id_contrato '
               + ' inner join persona        tit on tit.id_persona    = cto.id_titular '
               + ' inner join persona        emp on emp.id_persona    = cto.id_empresa '
               + ' inner join unidad_negocio uni on uni.id_entidad    = cto.id_entidad '
               + ' inner join poblacion      cd  on cd.cve_poblacion  = uni.cve_poblacion '
               + ' inner join poblacion      edo on edo.cve_poblacion = cd.cve_poblac_ubic '
         + ' where can.id_cancelado = ' + trim(ieIdCancelado.Text)
         + '   and can.id_contrato  = ' + trim(ieIdContrato.Text);
   try
      with QRAcuseRecibo do
      begin
         qReporte.Close;
         qReporte.SQL.Clear;
         qReporte.SQL.Text := vQry;
         qReporte.Open;
         if qReporte.IsEmpty then
            MessageDlg('No existe informacion para ser presentada...', mtInformation, [mbYes], 0)
         else
         begin
            Formato(trim(qReporte.FieldByName('ID_CANCELADO').AsString),
                    trim(qReporte.FieldByName('ID_CONTRATO').AsString),
                    trim(qReporte.FieldByName('CVE_TIP_CONTRATO').AsString),
                    trim(qReporte.FieldByName('F_CANCELADO').AsString),
                    trim(qReporte.FieldByName('F_ALTA').AsString),
                    trim(qReporte.FieldByName('NOM_TITULAR').AsString),
                    trim(qReporte.FieldByName('NOM_EMPRESA').AsString));
            if pEnviarAImpresora then Print
            else                      Preview;
         end;
      end;
   except
      MessageDlg('Error al generar el Reporte', mtError, [mbYes], 0);
   end;
end;

function TWAcuseRec.Guardar(pPath : String) : Boolean;
var
   PrinterIndex    : Integer;
   OldPrinterIndex : Integer;
   PdfCreator      : OleVariant;
begin
   PrinterIndex := Printer.Printers.IndexOf(getParametroICB(Objeto, 33, 7));
   if PrinterIndex <> -1 then
   begin
      OldPrinterIndex      := Printer.PrinterIndex;
      Printer.PrinterIndex := PrinterIndex;
      PdfCreator           := CreateOLEOBject(getParametroICB(Objeto, 33, 8));
      try
         PdfCreator.cStart();
         PdfCreator.cOption('UseAutosave')          := 1;
         PdfCreator.cOption('UseAutosaveDirectory') := 1;
         PdfCreator.cOption('AutosaveDirectory')    := ExtractFileDir(pPath);   // Directorio de archivo
         PdfCreator.cOption('AutosaveFilename')     := ExtractFileName(pPath);  // Nombre de archivo
         PdfCreator.cOption('AutosaveFormat')       := 0;                       // Formato PDF

         if FileExists(pPath) then
            DeleteFile(pPath);

         QRAcuseRecibo.PrinterSettings.PrinterIndex := PrinterIndex;
         Imprimir(True);
         sleep(2*1000); // 2 segundos, para asegurar la generacion del archivo

         if not FileExists(pPath) then
            MessageDlg('No fue posible generar el archivo pdf', mtInformation, [mbOk], 0);
      finally
         Printer.PrinterIndex                       := OldPrinterIndex;
         QRAcuseRecibo.PrinterSettings.PrinterIndex := OldPrinterIndex;
         PdfCreator.cClose;
      end;
      result := (FileExists(pPath));
   end;
end;

procedure TWAcuseRec.EnviaEmail;
var
   smtp : TNMSMTP;
   n    : Integer;
begin
   try
      try
         if trim(eDe.Text) = '' then
            raise EInterFrame.Create('Ingrese informacion en el campo De');
         if lvPara.Items.Count = 0 then
            raise EInterFrame.Create('Ingrese informacion en la lista Para');
         if trim(eAsunto.Text) = '' then
            raise EInterFrame.Create('Ingrese informacion en el campo Asunto');
         if trim(mMensaje.text) = '' then
            raise EInterFrame.Create('Ingrese informacion en el campo Mensaje');
         if Guardar(getParametroICB(Objeto, 33, 6)) then                        // Archivo Adjunto
         begin
            smtp      := TNMSMTP.Create(nil);
            smtp.Host := getParametroICB(Objeto, 33, 1);                        // Host
            smtp.Port := StrToInt(getParametroICB(Objeto, 33, 2));              // Puerto
            smtp.Connect;
            smtp.PostMessage.FromAddress := trim(eDe.Text);                     // De
            for n := 0 to lvPara.Items.Count-1 do                               // Para
               smtp.PostMessage.ToAddress.Add(trim(lvPara.Items[n].Caption));
            smtp.PostMessage.Subject   := trim(eAsunto.Text);                   // Asunto
            smtp.PostMessage.Body.Text := trim(mMensaje.text);                  // Mensaje
            smtp.SubType               := mtPlain;
            smtp.Charset               := 'ISO-8859-1';                         // Codificacion que considera caracteres especiales
            smtp.PostMessage.Attachments.Add(getParametroICB(Objeto, 33, 6));   // Archivo Adjunto
            smtp.SendMail;

            // Bitacora de Envio
            RunSQL('insert into contrato_can_envio(id_envio, id_cancelado, id_contrato, cve_usr_envio, fh_envio) '
                 + 'values(sq_contrato_can_envio.nextval, ' + trim(Objeto.Id_Cancelado.AsString) + ', ' + trim(Objeto.Id_Contrato.AsString) + ', ' + QuotedStr(Objeto.DameUsuario) + ', sysdate)',
                   Objeto.DataBaseName, Objeto.SessionName, True);

            MessageDlg('El acuse de recibo fue enviado correctamente', mtInformation, [mbOk], 0);
         end;
      except
         on e: Exception do
            MessageDlg('Error al enviar acuse de recibo' + chr(13) + e.Message, mtInformation, [mbOK], 0);
      end;
   finally
      if smtp.Connected then smtp.Disconnect;
      if smtp <> nil    then FreeAndNil(smtp);
   end;
end;

procedure TWAcuseRec.InterFormaPreview(Sender: TObject);
var
   saveDialog : TSaveDialog;
begin
   try
      saveDialog := TSaveDialog.Create(self);
      with saveDialog do
      begin
         Title       := 'Guardar';
         InitialDir  := 'C:\';
         Filter      := 'Archivo PDF|*.pdf';
         DefaultExt  := 'pdf';
         FilterIndex := 1;
         if Execute then
         begin
            if trim(FileName) <> '' then
               if Guardar(trim(FileName)) then
                  MessageDlg('El acuse de recibo se guardo correctamente', mtInformation, [mbOk], 0);
         end;
      end;
   finally
      if saveDialog <> nil then
         FreeAndNil(saveDialog);
   end;
end;

procedure TWAcuseRec.InterFormaImprimir(Sender: TObject);
begin
   Imprimir(True);
end;

procedure TWAcuseRec.InterFormaAyuda(Sender: TObject);
begin
   EnviaEmail;
end;

procedure TWAcuseRec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;  
end.
