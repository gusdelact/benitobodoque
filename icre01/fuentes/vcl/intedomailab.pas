// Sistema         : Clase de EdoMailAB
// Fecha de Inicio : 19/01/2012
// Función forma   : Clase de EdoMailAB
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Juan Francisco Ortega Flores
// Comentarios     : Envío de Mails de Estados de Cuenta ABCD
Unit IntEdomailab;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, NMsmtp, Psock, NMFtp, IntParamCre,

IntGenCre, Grids, ImgList, IntCrActPa,Aligrid, Gauges,

IntCrCesion,
IntCtoPanel,
IntCrDocto,
IntCrCredito,     //Disposición
IntCrAcredit,     //Acreditado
IntLinkit, QuickRpt, Qrctrls;


Const
   coCRLF    = #13#10;
   CO_COL_CHECK    = 0;
   CO_COL_IDCRED   = CO_COL_CHECK + 1;
   CO_COL_ACREDIT  = CO_COL_IDCRED + 1;
   CO_COL_EMAIL    = CO_COL_ACREDIT + 1;
   CO_COL_STDIG    = CO_COL_EMAIL + 1;
   CO_COL_STMAIL   = CO_COL_STDIG + 1;

   CO_CHECKED   = 'V';
   CO_UNCHECKED = 'F';
   CO_NOTCHECK  = '-';      


Type
  TEdomailab = Class;

  TWEdomailab = Class(TForm)

    InterForma1 : TInterForma;
    lbCAMPO1 : TLabel;
    edCAMPO1 : TEdit;
    GBAutorizacion: TGroupBox;
    Shape6: TShape;
    Shape7: TShape;
    Label14: TLabel;
    Shape5: TShape;
    Label13: TLabel;
    strgrdMail: TStringGrid;
    GBLectura: TGroupBox;
    Label16: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Tregleidos_tot: TEdit;
    Tregenviado: TEdit;
    Tregnoenviado: TEdit;
    MemoMessages: TMemo;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label5: TLabel;
    edFemisio: TEdit;
    Shape1: TShape;
    Label3: TLabel;
    Memo1: TQRMemo;
    Memo2: TQRMemo;
    NMFTP1: TNMFTP;
    NMSMTP1: TNMSMTP;
    LeerEdosCta: TBitBtn;
    pAniBar: TPanel;
    Bemail: TButton;
    Label6: TLabel;
    Label1: TLabel;
    Shape2: TShape;
    Label7: TLabel;
    ImageList: TImageList;
    CBtodos: TCheckBox;
    InterLinkit1: TInterLinkit;
    edID_CESION: TEdit;
    btID_CESION: TBitBtn;
    edCESION: TEdit;
    ilCesion: TInterLinkit;
    chbxCESION: TCheckBox;
    Label8: TLabel;
    edACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    Label9: TLabel;
    chbxAcreditado: TCheckBox;
    ilACREDITADO: TInterLinkit;
    Label10: TLabel;
    Edit1: TEdit;
    InterDateTimePicker1: TInterDateTimePicker;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure LeerEdosCtaClick(Sender: TObject);
    procedure ConfGrid( SGrid : TStringGrid );
    procedure strgrdMailDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure NMFTP1Failure(var Handled: Boolean; Trans_Type: TCmdType);
    procedure BemailClick(Sender: TObject);
    procedure NMFTP1Success(Trans_Type: TCmdType);
    procedure InvertCheck(StrinGrid : TStringGrid; nCol, nRow : Integer);
    procedure strgrdMailMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CBtodosClick(Sender: TObject);
    procedure btID_CESIONClick(Sender: TObject);
    procedure ilCesionCapture(Sender: TObject; var Show: Boolean);
    procedure chbxCESIONClick(Sender: TObject);
    procedure ilCesionEjecuta(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure chbxAcreditadoClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    private
    { Private declarations }
{    function ValidaGrid(
               vlFILA,
               vlCREDITO,
               vlACREDITADO : string
              ) : Boolean;
 }
    function AbreConexion( pCURPATH: String): Boolean;

    public
    { Public declarations }
    Objeto : TEdomailab;


end;
 TEdomailab= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ParamCre    : TParamCre;
        CAMPO1      : TInterCampo;
        Credito     : TCrCredito;  //Disposición
        Acreditado  : TCrAcredit;  //Acreditado

        function    InternalBusca : Boolean; override; 
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override; 
        function    Reporte:Boolean; override; 
      published
      end;
var

     nRow   : word;
     cregtot, cregenv, cregnoenv: integer;
     EdoMailAb: TEdoMailAb;
     sFileName  : String;
     vlcredGlob : STRING;
     vlrowglob  : word;
     sAcrobatFile : String;
     sDirMail : String;
     TmpDir : String;
     Query1 : TQuery;
     vlsql  : String;
     vlvalidamail : sTRING;
     vlfinmesant:string;

implementation
//Uses RepMon;

{$R *.DFM}


constructor TEdomailab.Create( AOwner : TComponent );
begin Inherited;
      CAMPO1 :=CreaCampo('CAMPO1',ftString,tsNinguno,tsNinguno,False);
                CAMPO1.Caption:='Campo1';
                CAMPO1.Parametro:='CAMPO1';

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'TEdomailab.Hlp';
      ShowMenuReporte:=True;

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
      Credito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource := Self;



end;

Destructor TEdomailab.Destroy;
begin
   if Credito <> nil then
      Credito.Free;

   if Acreditado <> nil then
      Acreditado.Free;

inherited;
end;


function TEdomailab.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWEdomailab;
begin
   W:=TWEdomailab.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
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


Function TEdomailab.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('IEdomail.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;


function TEdomailab.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA EdoMailAB********************)
(*                                                                              *)
(*  FORMA DE EdoMailAB                                                            *)
(*                                                                              *)
(***********************************************FORMA EdoMailAB********************)

function TWEdomailab.AbreConexion( pCURPATH: String): Boolean;
  begin
    Result := False;
    // Si no esta conectado abre la conexion
    if not NMFTP1.Connected then

    begin
      NMFTP1.Connect;
      NMFTP1.Mode(MODE_IMAGE);
      Result := True;
    end else begin
      NMFTP1.DoCommand('PWD');
      Result := True;
    end;
    //
    //
    if NMFTP1.Connected then
    Begin
      NMFTP1.ChangeDir(pCURPATH);
    End;
    //
end;



procedure TWEdomailab.FormShow(Sender: TObject);
begin
      Objeto.CAMPO1.Control:=edCAMPO1;
//      edFemisio.Text:= DateToStr(Objeto.Apli.DameFechaEmpresa);

      Objeto.Credito.ID_CREDITO.Control := edID_CESION;
      Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := edCESION;
      Objeto.Credito.GetParams(Objeto);
      edCESION.Hint := Objeto.Credito.ContratoCre.Contrato.TITNombre.AsString;
      edCESION.ShowHint := True;

      Objeto.Acreditado.ID_ACREDITADO.Control := edACREDITADO;
      Objeto.Acreditado.Persona.Nombre.Control := edNOMBRE_ACRED;
      Objeto.GetParams(Objeto);
      edNOMBRE_ACRED.Hint := Objeto.Acreditado.Persona.Nombre.AsString;
      edNOMBRE_ACRED.ShowHint := True;


end;

procedure TWEdomailab.FormDestroy(Sender: TObject);
begin
      Objeto.CAMPO1.Control:=nil;
      Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := nil;
      Objeto.Credito.ID_CREDITO.Control := nil;

      Objeto.Acreditado.ID_ACREDITADO.Control := nil;
      Objeto.Acreditado.Persona.Nombre.Control := nil;

   //Objeto
end;

procedure TWEdomailab.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWEdomailab.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWEdomailab.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWEdomailab.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte;
//end;


procedure TWEdomailab.LeerEdosCtaClick(Sender: TObject);
var
  LCID   : integer;
  fila   : integer;
  valida : String;


  //Para la barra de progreso
  ani: TAniBarThread;
  r: TRect;
  vlsobretasa, vltasadescu  : currency;
  vlMesg:string;

  bResult : Boolean;
  vlmesant:string;

begin
   if Objeto.ValidaAccesoEsp('TEDOMAILAB_LEEEC',True,True) then
   begin
      MemoMessages.Clear;
      ClearGrid(strgrdMail,0);
      ConfGrid(strgrdMail);
      nRow := 0;
      cregtot := 0;
      cregenv := 0;
      cregnoenv := 0;

  //    vlsql := 'SELECT TO_CHAR(ADD_MONTHS(TO_DATE('''+edFemisio.Text+''',''DD/MM/YYYY''),-1),''DD/MM/YYYY'') "FECHA" FROM DUAL';
  //    GetSqlStr(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'FECHA', vlmesant, False);
  //
  //    vlsql := 'SELECT LAST_DAY(TO_DATE('''+vlmesant+''',''DD/MM/YYYY'')) "FECHA" FROM DUAL';
  //    GetSqlStr(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'FECHA', vlfinmesant, False);


         vlfinmesant := edFemisio.Text;

   vlsql :=  ' SELECT CC.id_credito, per.nombre, per.e_mail ' + coCRLF +
             '        ,CEC.F_CORTE ' + coCRLF +
             '   FROM cr_credito cc, contrato cto, persona per ' + coCRLF +
             '        ,CR_EC_CREDITO CEC ' + coCRLF +
             '  WHERE 1 = 1 ' + coCRLF +
             '    AND cc.sit_credito = ''AC'' ' + coCRLF +
             '    AND cc.id_contrato IN ( ' + coCRLF +
             '           SELECT id_contrato ' + coCRLF +
             '             FROM cr_contrato ' + coCRLF +
             '            WHERE 1 = 1 ' + coCRLF +
             '              AND cve_producto_cre IN (SELECT cve_clave ' + coCRLF +
             '                                         FROM cr_con_cat_data ' + coCRLF +
             '                                        WHERE cve_con_gpo_cat = ''CAT_PROD_ABCD'')) ' + coCRLF +
             '    AND cc.b_genera_edocta = ''V'' ' + coCRLF +
             '    AND cto.id_contrato = cc.id_contrato ' + coCRLF +
             '    AND cto.id_titular = per.id_persona ' + coCRLF +
              //
             '   AND CEC.ID_CREDITO = cc.ID_CREDITO ' + coCRLF +
             '   AND CEC.F_CORTE = TO_DATE('''+edFemisio.Text+''',''DD/MM/YYYY'') ' + coCRLF; //vlfinmesant

            If (edID_CESION.Text <>'') Then
            vlsql := vlsql + ' AND CC.ID_CREDITO = '+ edID_CESION.Text  +  coCRLF;

            If (edACREDITADO.Text <>'') Then
            vlsql := vlsql + ' AND PER.NOMBRE = '''+ edNOMBRE_ACRED.Text+ '''' + coCRLF;

            vlsql := vlsql+ ' ORDER BY cc.ID_CREDITO';

          Query1 := GetSQLQuery(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );

        if Query1 = nil then
           begin
           ShowMessage('  ¡ No se encontró documento con el filtro indicado!');
           end
        else
        begin

        {* Inicia las variables para actualizar el medidor *}
        r := pAniBar.ClientRect;
        InflateRect(r, -pAniBar.BevelWidth, -pAniBar.BevelWidth);
        ani := TAniBarThread.Create(pAniBar, r, pAniBar.color, clLime, 100);
        LeerEdosCta.Enabled := False;
        Application.ProcessMessages;
        LCID := GetUserDefaultLCID;
        //Si el campo con el nombre del reporte está vacio lee la información de
        //de la base de datos y utiliza el reporte
    fila := 1;
     try
      while not Query1.EOF do
        begin
           try
            with strgrdMail do  begin

             Cells[CO_COL_IDCRED, nRow] := Query1.FieldByName('ID_CREDITO').AsString;
             Cells[CO_COL_ACREDIT, nRow]:= Query1.FieldByName('NOMBRE').AsString;
             Cells[CO_COL_EMAIL, nRow]  := Query1.FieldByName('E_MAIL').AsString;

             if Cells[CO_COL_EMAIL, nRow] = ''
               then
                begin
                Cells[CO_COL_STMAIL, nRow] := 'S/C';
                Cells[CO_COL_CHECK, nRow]  := CO_UNCHECKED;
                end
                else begin
                Cells[CO_COL_CHECK, nRow]  := CO_CHECKED;
                end;
                Cells[CO_COL_STDIG, nRow]  := 'OK';

           end;

           finally

           end;
           Query1.Next;
           nRow:=nRow+1;
           cregtot := cregtot+1;
           inc(fila);

           strgrdMail.RowCount   := fila-2;
           Tregleidos_tot.Text   := IntToStr(cregtot);

        end;
        Query1.Close;

       finally
         if Query1 <> nil then
            LeerEdosCta.Enabled := True;
            ani.Terminate;
            Query1.free;
            CBtodos.Checked := true
       end;
     end;
   end;
End;



procedure TWEdomailab.ConfGrid(SGrid: TStringGrid);
begin
 With SGrid Do
   Begin
      ColCount := 6;

      RowHeights[0] := DefaultRowHeight;
      RowCount := 1;

      ColWidths[CO_COL_CHECK]   := 27;
      ColWidths[CO_COL_IDCRED]  := 58;
      ColWidths[CO_COL_ACREDIT] := 218;
      ColWidths[CO_COL_EMAIL]   := 127;
      ColWidths[CO_COL_STDIG]   := 43;
      ColWidths[CO_COL_STMAIL]  := 43;

    End;
end;

procedure TWEdomailab.strgrdMailDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var str : String;
    Bmp : TBitmap;
    sTexto: String;           // Texto que va a imprimir en la celda actual
    Alineacion: TAlignment;   // Alineación que le vamos a dar al texto
    iAnchoTexto: Integer;     // Ancho del texto a imprimir en pixels
begin
 If (Sender Is TStringGrid) Then
  With (Sender As TStringGrid) Do
   Begin
      If (gdSelected In State) Then Canvas.Brush.Color := clWhite;

      Canvas.Font.Color := clGreen;

      str := Cells[CO_COL_STMAIL,ARow];
       If (str = 'S/C') Then
      begin
         Canvas.Font.Color := clSilver;
         Canvas.Font.Style := [fsBold];
      end
      ELSE 
      begin
         Canvas.Font.Color := clgreen;
         Canvas.Font.Style := [fsBold];
      end;
      Canvas.TextRect(Rect,Rect.Left,Rect.Top,Cells[ACol, ARow]);

      if    (ACol = CO_COL_CHECK) or(ACol = CO_COL_EMAIL) or(ACol = CO_COL_STDIG) or
            (ACol = CO_COL_STMAIL) then
         Alineacion := taCenter;

      if    (ACol = CO_COL_IDCRED) or(ACol = CO_COL_ACREDIT) then
         Alineacion := taLeftJustify;

      sTexto := Cells[ACol,ARow];
      Canvas.FillRect( Rect );
      iAnchoTexto := Canvas.TextWidth( sTexto );

      case Alineacion of
        taLeftJustify:  Canvas.TextOut( Rect.Left + 5, Rect.Top + 2, sTexto );
        taCenter:       Canvas.TextOut( Rect.Left + ( ( Rect.Right - Rect.Left ) - iAnchoTexto ) div 2, Rect.Top + 2, sTexto );
        taRightJustify: Canvas.TextOut( Rect.Right - iAnchoTexto - 2, Rect.Top + 2, sTexto );
      end;


      If (ACol = CO_COL_CHECK) Then
      Begin
         Bmp := TBitmap.Create;
         If (Cells[CO_COL_CHECK,ARow] = CO_CHECKED) Then ImageList.GetBitmap(1,Bmp)
         Else ImageList.GetBitmap(0,Bmp);
         Canvas.Draw(Rect.Left,Rect.Top,Bmp);
         Bmp.FreeImage;
         Bmp.Free;
      End;

  End;
end;

procedure TWEdomailab.BemailClick(Sender: TObject);
var cont1, RegTot  : word;
    vlMesg : String;
    Berror:boolean;
    Directorio : String;
    sRemoteFile : String;
    sLocalFile : String;
    vlcesion : String;
    vlmmyy : String;
    vlsend : String;
    vlbodymail : String;

begin
   if Objeto.ValidaAccesoEsp('TEDOMAILAB_ENVML',True,True) then
   begin
       cregenv := 0;
       cregnoenv  :=0;

       Berror:=false;

       vlMesg := '¿ Está seguro de ENVIAR los Estados de Cuenta marcados ?';
       if MessageDlg(vlMesg, mtConfirmation,[mbYes, mbNo], 0) = mrYes then
       Begin


    //      ClearGrid(strgrdMail,0);
    //      ConfGr
          TmpDir := obtValorGpoCve( 'EDOCTA', 'TMPDIR',   Objeto.Apli); // 'C:\tmp\';
          NMFTP1.Host     := obtValorGpoCve( 'CONFRH', 'FTPSERVER', Objeto.Apli );
          NMFTP1.UserID   := obtValorGpoCve( 'CONFRH', 'USERNAME',  Objeto.Apli );
          NMFTP1.Password := HexToStr( obtValorGpoCve( 'CONFRH', 'PASSWORD',  Objeto.Apli ) );
          vlsend := vlfinmesant[7]+vlfinmesant[8]+vlfinmesant[9]+vlfinmesant[10]+'/'+vlfinmesant[4]+vlfinmesant[5];
          Directorio := obtValorGpoCve( 'EDOCTA', 'ROOTDIR',   Objeto.Apli)+ vlsend; //vlsend se utiliza '2012/01' para las pruebas en desarrollo
          if AbreConexion(Directorio) then
             begin
             cont1  := 0;
             RegTot := strgrdMail.RowCount;
             while (cont1 <= RegTot) do
               begin

             if strgrdMail.Cells[CO_COL_CHECK, cont1] = CO_CHECKED  then
               begin
                vlcesion := strgrdMail.Cells[CO_COL_IDCRED, cont1];
                sRemoteFile := 'EDOCTA_' +vlfinmesant[4]+vlfinmesant[5]+'_'+vlfinmesant[7]+vlfinmesant[8]+vlfinmesant[9]+vlfinmesant[10]+'__'+ vlcesion;
                sDirMail := strgrdMail.Cells[CO_COL_EMAIL, cont1];
                sLocalFile := TmpDir+sRemoteFile;
                vlrowglob := cont1;
                // BAJAR DE FTP
                NMFTP1.Download(sRemoteFile, sLocalFile);
                // TERMINA DESCARGA FP
                  //ENVIO DE MAIL
                  if sDirMail <> '' then
                      begin
                        sAcrobatFile := TmpDir + sRemoteFile;
                         if sAcrobatFile <> '' then
                          Begin
                            if RenameFile(sAcrobatFile, ChangeFileExt(sAcrobatFile,'.pdf')) then
                            Begin
                              sAcrobatFile := ChangeFileExt(sAcrobatFile,'.pdf');
                              Memo1.Lines.Clear;
                              Memo2.Lines.Clear;
                              Memo1.Lines.Add(sDirMail);
                              NMSMTP1.Host := obtValorGpoCve('EDOCTA', 'HOST', Objeto.Apli);
                              NMSMTP1.Port := StrToInt(obtValorGpoCve('EDOCTA', 'PORT', Objeto.Apli));
                              NMSMTP1.Connect;
                              NMSMTP1.PostMessage.ToAddress.Assign(Memo1.Lines);
                              NMSMTP1.PostMessage.FromAddress := obtValorGpoCve('EDOCTA', 'MAIL_SEND', Objeto.Apli);
                              NMSMTP1.PostMessage.FromName := obtValorGpoCve('EDOCTA', 'FROM_NAME', Objeto.Apli);
                              NMSMTP1.PostMessage.Subject := obtValorGpoCve('EDOCTA', 'SUBJECT', Objeto.Apli);
                              NMSMTP1.PostMessage.date := FormatDateTime('dd/mm/yyyy hh:nn am/pm', Now);
                              NMSMTP1.PostMessage.Body.Text := obtValorGpoCve('EDOCTA', 'BODY1', Objeto.Apli)+strgrdMail.Cells[CO_COL_ACREDIT, cont1]+coCRLF+coCRLF+obtValorGpoCve('EDOCTA', 'BODY2', Objeto.Apli)+obtValorGpoCve('EDOCTA', 'BODY3', Objeto.Apli)+strgrdMail.Cells[CO_COL_IDCRED, cont1]+coCRLF+coCRLF+obtValorGpoCve('EDOCTA', 'BODY4', Objeto.Apli)+obtValorGpoCve('EDOCTA', 'BODY5', Objeto.Apli)+obtValorGpoCve('EDOCTA', 'BODY6', Objeto.Apli)+coCRLF+coCRLF+coCRLF+coCRLF+coCRLF+obtValorGpoCve('EDOCTA', 'BODY7', Objeto.Apli)+coCRLF+obtValorGpoCve('EDOCTA', 'BODY8', Objeto.Apli)+coCRLF+obtValorGpoCve('EDOCTA', 'BODY9', Objeto.Apli)+coCRLF+obtValorGpoCve('EDOCTA', 'BODY0', Objeto.Apli);
                              NMSMTP1.PostMessage.Attachments.Clear;
                              NMSMTP1.PostMessage.Attachments.Add(sAcrobatFile);
                              NMSMTP1.SubType := mtHTML;
                              NMSMTP1.SendMail;
                              NMSMTP1.Disconnect;
                              cregenv := cregenv + 1;
                              Tregenviado.Text := IntToStr(cregenv);

                            end;
                         end;
                      end;
                      cont1 := cont1+1;
                   If FileExists(sAcrobatFile)  Then
                     begin
                      DeleteFile(sAcrobatFile)
                     end;
                     sAcrobatFile := '';

               end
               else
               cont1 := cont1+1;
               end
             end;
         end
      else
       begin
             Berror:=true;
             ShowMessage('  ¡ No es posible conectar al Servidor de Documentos Digitalizados !');
             cregnoenv := cregnoenv+1;
             Tregnoenviado.Text  := IntToStr(cregnoenv);
       end;
       if not Berror then ShowMessage('   ¡ Proceso Concluido con Exito !');
   end;
end;


procedure TWEdomailab.NMFTP1Failure(var Handled: Boolean;
  Trans_Type: TCmdType);
begin
   case Trans_Type of
     cmdChangeDir: MemoMessages.Lines.Add('ChangeDir failed');
     cmdMakeDir: MemoMessages.Lines.Add('MakeDir failed');
     cmdDelete: MemoMessages.Lines.Add('Delete failed');
     cmdRemoveDir: MemoMessages.Lines.Add('RemoveDir failed');
     cmdList: MemoMessages.Lines.Add('List failed');
     cmdRename: MemoMessages.Lines.Add('Rename failed');
     cmdUpRestore: MemoMessages.Lines.Add('UploadRestore failed');
     cmdDownRestore: MemoMessages.Lines.Add('DownloadRestore failed');

     //
     cmdDownload: MemoMessages.Lines.Add('No se encontro el Estado de Cuenta del Credito: '+vlcredGlob);

//     cmdUpload: MemoMessages.Lines.Add('Upload failed');
     cmdAppend: MemoMessages.Lines.Add('UploadAppend failed');
     cmdReInit: MemoMessages.Lines.Add('Reinitialize failed');
     cmdAllocate: MemoMessages.Lines.Add('Allocate failed');
     cmdNList: MemoMessages.Lines.Add('NList failed');
     cmdDoCommand: MemoMessages.Lines.Add('DoCommand failed');
     cmdCurrentDir: MemoMessages.Lines.Add('CurrentDir failed');
   end;

end;

procedure TWEdomailab.NMFTP1Success(Trans_Type: TCmdType);
begin
   case Trans_Type of
    { cmdList:
       begin
         for I := 0 to (StringGrid1.ColCount - 1) do

           StringGrid1.Cols[I].Clear;
         StringGrid1.RowCount := NMFTP1.FTPDirectoryList.name.Count;
         StringGrid1.ColCount := 4;
         StringGrid1.Cells[0, 0] := 'Filename';
         StringGrid1.Cells[1, 0] := 'File Size';
         StringGrid1.Cells[2, 0] := 'Modified Date';
         StringGrid1.Cells[3, 0] := 'Attributes';
         for I := 0 to (NMFTP1.FTPDirectoryList.name.Count - 1) do
           with NMFTP1.FTPDirectoryList do
             begin
               StringGrid1.Cells[0, I+1] := name[I];

               StringGrid1.Cells[1, I+1] := Size[I];
               StringGrid1.Cells[2, I+1] := ModifDate[I];
               StringGrid1.Cells[3, I+1] := Attribute[I];
             end;
       end;
     cmdChangeDir:
       begin
         Memo1.Lines.Add('ChangeDir successful');
         NMFTP1.List;
       end;       }

     cmdMakeDir: MemoMessages.Lines.Add('MakeDir successful');

     cmdRemoveDir: MemoMessages.Lines.Add('RemoveDir successful');
     cmdDelete: MemoMessages.Lines.Add('Delete successful');
     cmdRename: MemoMessages.Lines.Add('Rename successful');

     cmdReInit: MemoMessages.Lines.Add('Reinitialize successful');
     cmdCurrentDir: MemoMessages.Lines.Add('CurrentDir successful');

     cmdDownload:begin
                    strgrdMail.Cells[CO_COL_STDIG, vlrowglob]:= 'OK';
                    MemoMessages.Lines.Add('Estado de Cuenta Digitalizado del Credito '+vlcredGlob+' .........OK');
                 end;
   end;
end;

procedure TWEdomailab.InvertCheck(StrinGrid: TStringGrid; nCol,
  nRow: Integer);
begin
 With (StrinGrid) Do
  If (Cells[nCol, nRow] <>  CO_NOTCHECK) Then
   Begin
     If (Cells[nCol, nRow]  = CO_CHECKED) Then
         Cells[nCol, nRow] := CO_UNCHECKED
     Else
         Cells[nCol, nRow] := CO_CHECKED;
   End;
end;

procedure TWEdomailab.strgrdMailMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var nCol, nRow : Integer;
begin
   strgrdMail.MouseToCell(X, Y, nCol, nRow);
   if nCol = CO_COL_CHECK then
   begin
       if strgrdMail.Cells[CO_COL_STMAIL, nRow] <> 'S/C' then
         InvertCheck(strgrdMail, CO_COL_CHECK, nRow);
   end;
end;


procedure TWEdomailab.CBtodosClick(Sender: TObject);
var vlRow  : Integer;
begin
   for vlRow := 0 to (strgrdMail.RowCount-1) do
   begin
      if (CBtodos.Checked = true) and (strgrdMail.Cells[CO_COL_STMAIL, vlRow] <> 'S/C' ) then // Marcar todos
      begin
         if strgrdMail.Cells[CO_COL_CHECK, vlRow]  = CO_UNCHECKED  then
            strgrdMail.Cells[CO_COL_CHECK, vlRow] := CO_CHECKED;
      end;

      if CBtodos.Checked = false then // Desmarcar todos
      begin
         if strgrdMail.Cells[CO_COL_CHECK, vlRow]  = CO_CHECKED  then
            strgrdMail.Cells[CO_COL_CHECK, vlRow] := CO_UNCHECKED;
      end;

//     InvertCheck(strgrdMail, CO_COL_CHECK, strgrdMail.RowCount); //nrow
   end;
end;


procedure TWEdomailab.btID_CESIONClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TEDOMAILAB_DISPO',True,True) then
   begin
       Objeto.Credito.ShowAll := True;
       if Objeto.Credito.Busca then begin
            chbxCESION.Checked:=True;
            chbxCESION.Enabled:=True;
            InterForma1.NextTab(edID_CESION);
       End;
   end;
end;

procedure TWEdomailab.ilCesionCapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TWEdomailab.chbxCESIONClick(Sender: TObject);
begin
    If not chbxCESION.Checked Then Begin
        Objeto.Credito.Active:=False;
        chbxCESION.Checked:=False;
        chbxCESION.Enabled:=False;
    End Else Begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
    End;
end;


procedure TWEdomailab.chbxAcreditadoClick(Sender: TObject);
begin
    If not chbxAcreditado.Checked Then Begin
        Objeto.Acreditado.Active:=False;
        chbxAcreditado.Checked:=False;
        chbxAcreditado.Enabled:=False;
    End Else Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
    End;
end;

procedure TWEdomailab.ilCesionEjecuta(Sender: TObject);
begin
    If Objeto.Credito.FindKey([ilCesion.Buffer]) Then Begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
        InterForma1.NextTab(edID_CESION);
    End;
end;

procedure TWEdomailab.btACREDITADOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TEDOMAILAB_ACRED',True,True) then
   begin
       Objeto.Acreditado.ShowAll := True;
       If Objeto.Acreditado.Busca Then Begin
            chbxAcreditado.Checked:=True;
            chbxAcreditado.Enabled:=True;
            InterForma1.NextTab(edACREDITADO);
       End;
   end;
end;

procedure TWEdomailab.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TWEdomailab.ilACREDITADOEjecuta(Sender: TObject);
begin
    If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
    End;
end;


procedure TWEdomailab.Edit1Change(Sender: TObject);
var
  vlsql1, vlfinmesant : String;
begin
   vlsql := 'SELECT LAST_DAY(TO_DATE('''+Edit1.Text+''',''DD/MM/YYYY'')) "FECHA" FROM DUAL';
    GetSqlStr(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'FECHA', vlfinmesant, False);

    edFemisio.Text := vlfinmesant;

end;

end.



