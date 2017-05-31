// *****************************************************************************
// Sistema         : CAPTACION
// Fecha de Inicio : 21/02/2012
// Función forma   : Procesos y funciones generales para CAPTACIÓN
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Carlos Pinacho
// Comentarios     :
// *****************************************************************************
unit UnPrGenCapt;    { CAPM FEB-2012 BASE_HIST }

interface

uses
  dbtables
  ,IntSlPrIPAB
  ,sysutils
  ,Dialogs
  ,InterApl
  ,IntFrm
  ,dbgrids
  ,controls
  ,Messages
  //----------
  ,db
  ,classes
  ,comctrls
  ,Forms
  ,stdctrls
  ,extctrls
  ,buttons
  ,ADODB
  ,ComObj
  ,IdMessage
  ,IdSMTP

  ;

  type TCaptura = (tcEdit, tcMemo, tcCombo, tcRButon);
  type TDato = (tdString, tdInteger, tdFloat);
  type TAlineacion = (taIzquierda, taDerecha);


const
  strConexion = 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' +
  '%s;Extended Properties=Excel 8.0;' +
  'Persist Security Info=False';

   strConexion2007 = 'Provider=Microsoft.ACE.OLEDB.12.0;Data Source=' +
  '%s;Extended Properties=Excel 12.0;' + 'Persist Security Info=False';

  cSqlParamCorreo  = 'SELECT * FROM DV_PARAM_ALERTA WHERE CVE_ALERTA = ''AVISFVBO'' ';

  function fObtenFolioProceso(aApli : TInterApli) : Integer;
  procedure pAplicaFolProceso(var aQuery : TQuery; aFolProceso : Integer );
  { VALIDA CORREO ELECTRONICO }
  function fCorreoValido(aEmail: String): Boolean;

  procedure pEnviaCorreoCapt(aCorreos, aSubject, aBody : String; aApli : TInterApli  );

  { OBTIENE PARAMETROS DE DV_PARAM }
  function fObtenDvParam( aCveGrupo, aCveParam : String;
                          var aValor : String; var aSitParam : String; aApli : TInterApli ) : Boolean;

  { CARGA ARCHIVO EXCEL }
  function fCargaArchivoExcel( var aDataSet : TADODataSet; var aRutaArchivo : String; aProgressBar : TProgressBar ) : Boolean; overload;
  function fCargaArchivoExcel( var aDataSet : TADODataSet; var aRutaArchivo : String; aProgressBar : TProgressBar;
                aDisplayAlerts : Boolean ) :  Boolean; overload;

  function fFormatoTexto(aNomArchivo, aHojaSelect : String ) : String;
  //function fCargaArchivo(aNomArchivo : String; var aDataSet : TADODataSet; var vMensaje : String) : Boolean;

  { CAPTURA DATO PERSONALIZADO }
  function fCapturaDato(aOwner: TComponent; atCaptura : TCaptura; aTipoDato : TDato; aPregunta, aTextDefault : String;
  aReadOnly : Boolean): String; overload;
  function fCapturaDato(aOwner: TComponent; atCaptura : TCaptura; aTipoDato : TDato; aPregunta, aTextDefault : String;
  aReadOnly, aCancel  : Boolean): String; overload;

  function fSetLayout( aTexto : String; aAlineacion : TAlineacion; aCharRelleno : String; aLargo : Integer) : String;

VAR
  FDisplayAlerts : Boolean;
  FFormatTexto  : Boolean;
type
 { ********** CLASE PARA SELECCIONAR LA HOJA EXCEL ***************************}
  TListaHojasForm = class(TForm)
    Lista : TListBox;
    Panel : TPanel;
    btnAceptar,
    btnCancelar : TSpeedButton;

    procedure btnAceptarClick(Sender : TObject) ;
    procedure btnCancelarClick(Sender : TObject) ;
    private
    protected
      procedure CargaDatos;
    public
      vListaF : TStringList;
      constructor CreateLista(aOwner : TComponent; var aLista : TStringList); overload;
      procedure FormShow(Sender: TObject);
      destructor Destroy; override;
    published

  end;

var
  vHojaMas12 : String;
  vgListaComboCap : TStringList;
  
  //procedure CapturaRueda(var Message: TMessage{; var aDBGrid : TDBGrid});
implementation

uses DvCapDato;

{******************************************************************************************************
*******************************************************************************************************}
//procedure CapturaRueda(var Message: TMessage{; var aDBGrid : TDBGrid});
//var
//   Cuanto : integer;
//begin
//   //Para -> WheelMous
//   if (Message.Msg = WM_MOUSEWHEEL) then
//   begin
//     Cuanto:=HIWORD(Message.WParam);
//     Cuanto:=Cuanto div 120;
//   {  aDBGrid.DataSource.DataSet.MoveBy(-Cuanto); }
//
//   end
//   else
//  { CapturaRuedaControl(aDBGrid).WndProc(Message); }
//end;

{**********************************************************************************************************************
 *********************************************************************************************************************}
function fSetLayout( aTexto : String; aAlineacion : TAlineacion; aCharRelleno : String; aLargo : Integer) : String;
var
  vResult : String;
  vIndex : Integer;
begin

  vResult := Copy(aTexto, 1, aLargo);
  for vIndex := 1 to ((aLargo - Length(aTexto)))  do
  begin
    case aAlineacion of
     taDerecha   : vResult := aCharRelleno + vResult;
     taIzquierda : vResult := vResult + aCharRelleno;
    end;

  end;
  fSetLayout := vResult;
end;
{******************************************************************************************************
*******************************************************************************************************}
procedure pEnviaCorreoCapt(aCorreos, aSubject, aBody : String; aApli : TInterApli);
function NextItem( var Item : string): String;
  begin
    if StrScan( PChar( Item ), ',' ) <> nil then
    begin
      Result := Copy( Item, 1, pos( ',',  Item ) - 1 );
      Item   := Copy( Item, pos( ',',  Item ) + 1, length(Item) );
    end else
    begin
     Result := Item;
     Item   := '';
    end;
    Result := Trim( Result );
  end;
var
  SMTP: TIdSMTP;
  MAIL: TIdMessage;
  MailHost,
  MailUser,
  MailPass,
  MailFromName,
//  MailSubject,
  MailMail,
  MailsAlerta,
  DestAdd, vE_MAIL{, vBody} : String;
  DestinatarioIndex : Integer;
  //qryCorreo : TQuery;
  //vObs, vPerfil : String;
  qryParamametros : TQuery;

begin
//  if aTipoReg <> trProc then
//  begin
//IF 1=2 THEN
//BEGIN
    SMTP := TIdSMTP.Create(nil);
    MAIL := TIdMessage.Create(nil);
    DestinatarioIndex := 0;
//    qryCorreo := TQuery.Create(NIL);
//    qryCorreo.DatabaseName := aApli.DataBaseName; //Objeto.Apli.DataBaseName;
//    qryCorreo.SessionName  := aApli.SessionName;// Objeto.Apli.SessionName;
    qryParamametros := TQuery.Create(nil);
    try
      try

      
      qryParamametros.DatabaseName := aApli.DataBaseName;
      qryParamametros.SessionName := aApli.SessionName;
      qryParamametros.SQL.Text := cSqlParamCorreo;
      qryParamametros.Close;
      qryParamametros.Open;
      if not qryParamametros.IsEmpty then
      begin
         vE_MAIL      := qryParamametros.FieldByName('FROM_ADDRESS').AsString;;
         MailHost     := qryParamametros.FieldByName('IP_HOST').AsString;
         MailUser     := vE_MAIL;
         MailMail     := vE_MAIL;
         MailPass     := '';
         MailFromName := qryParamametros.FieldByName('FROM_NAME').AsString;
      end
      else
      begin
        ShowMessage('No hay parametros configurados.');
        Exit;
      end;
      except
      on E: Exception do
        ShowMessage('Error al cargar los parametros de configuración para el envio de correos.'
        +E.Message);
      end;
//         vObs := '';
//         if Length(aObservacion) > 0 then
//           vObs  := '[ Observación: %s ]';
//          case aTipoReg of
//            trAut : begin
//
//
//
//
//
//                      vBody := Format(cCuerpoMail,[cCuerpoMailAut,
//                                                    aFolio,
//                                                    //qrySolicitudes.FieldByName('MEDIO_DISP').AsString,
//                                                    Format(vObs,[aObservacion]),
//                                                    aDetalles,//
//                                                    aUsuario]);
//
//                      MailSubject  := cMailSubjectAut;
//                      vPerfil := ' ''CA'' ';
//                    end;
//
//            trObs : begin
//                      vBody := Format(cCuerpoMail,[cCuerpoMailObs,
//
//                                                    aFolio,
//                                                    Format(vObs,[aObservacion]),
//                                                    aDetalles,//
//                                                    aUsuario]);
//                      MailSubject := cMailSubjectObs ;
//                      vPerfil := ' ''CA'', ''AU'' ';
//                    end;
//            trAutoFin : begin
//
//                      vBody := Format(cCuerpoMail,[cCuerpoMailAutoFin,
//
//                                                    aFolio,
//                                                    Format(vObs,[aObservacion]),
//                                                    aDetalles,//
//                                                    aUsuario]);
//                      MailSubject := cMailSubjectAutoFin ;
//                      vPerfil := ' ''CA'', ''AU'' ';
//                    end;
//            trCan : begin
//                       vBody := Format(cCuerpoMail,[cCuerpoMailCancela,
//
//                                                    aFolio,
//                                                    Format(vObs,[aObservacion]),
//                                                    aDetalles,//
//                                                    aUsuario]);
//                      MailSubject := cMailSubjectCancela ;
//                      vPerfil := ' ''CA'' ';
//                    end;
//             trProcSi :
//                    begin
//                      vBody := Format(cCuerpoMail,[cCuerpoMailProcSi,
//
//                                                    aFolio,
//                                                    Format(vObs,[aObservacion]),
//                                                    aDetalles,//
//                                                    aUsuario]);
//                      MailSubject := cMailSubjectProcSi ;
//                      vPerfil := ' ''CA'' ';
//                    end;
//            trProcNo :
//                    begin
//                      vBody := Format(cCuerpoMail,[cCuerpoMailProcNo,
//
//                                                    aFolio,
//                                                    Format(vObs,[aObservacion]),
//                                                    aDetalles,//
//                                                    aUsuario]);
//                      MailSubject := cMailSubjectProcNo ;
//                      vPerfil := ' ''CA'', ''AU'' ';
//                    end;
//              trSol :
//                    begin
//
//
////
////        vpMedio,
////    vpSucursal,
////    vpCveUsuarioSol : String;
////    vpNumSolic : Integer;
//
//
//                      vBody := Format(cCuerpoMailSol2,[ cCuerpoMailSol,
//                                                        aFolio,
//                                                        vpMedio,
//                                                        vpNumSolic,
//                                                        vpEntidad,
//                                                        vpCveUsuarioSol,
//                                                        aDetalles,
//                                                        Format(vObs,[aObservacion])
//                                                        ]);
//                      MailSubject := cMailSubjectSol ;
//                      vPerfil := ' ''AU'' ';
//                    end;
//
//
//          end;
    except
      on E: Exception do
        ShowMessage('Error al cargar los parametros de configuración para el envio de correos.'
        +E.Message);
    end;
    with SMTP do
    begin
     Port := 25;
     Host := MailHost;
     Username := MailUser;
     Password := MailPass;
     AuthenticationType := atNone;// atLogin;
    end;

//    qryCorreo.Close;
//    qryCorreo.SQL.Text := Format(cSqlMailFrom,[cMedioDis, aUsuario, vPerfil]);

//    with qryCorreo do
    begin
//      try

//        MailsAlerta := '';
        //Open;
        //First;
        //FetchAll;
//        while not Eof do
//        begin
//        MailsAlerta := MailsAlerta + FieldByName('E_MAIL').AsString+',';
//        Next;
//        end;
//        MailsAlerta := Copy(MailsAlerta,1,Length(MailsAlerta)-1);
          MailsAlerta := aCorreos;
//      except
//        on E: Exception do
//          ShowMessage('Error al cargar correo(s) de alerta en el procedimiento: [ EnviaCorreo ] ['+SQL.Text+']'+E.Message);
//      end;

      with MAIL do
      begin
        if MailsAlerta <> '' then
        begin
          repeat
              Recipients.Add;
              DestAdd := NextItem( MailsAlerta );
              Recipients[DestinatarioIndex].Name := DestAdd;
              Recipients[DestinatarioIndex].Address := DestAdd;
              Inc(DestinatarioIndex);
          until MailsAlerta = '';
          From.Name    := MailFromName;
          From.Address := MailMail;
          Subject      := aSubject;
          Body.Text := aBody;

          try
            try
             SMTP.Connect(30000); 
             SMTP.Send(MAIL);
            except
              on E: Exception do
              begin
                Showmessage('Error al enviar correo. Mensaje:'+E.Message)
              end;
            end;
          finally
           if SMTP.Connected then
             SMTP.Disconnect;
           MAIL.Free;
           SMTP.Free;
           qryParamametros.Free;
          end;
        end
        else
        begin
          Showmessage('No hay correos configurados');
        end;
      end;
    end;
end;
{**********************************************************************************************************************
 *********************************************************************************************************************}
function fObtenFolioProceso(aApli : TInterApli) : Integer;
var
  vFrmSelectorProc : TSlPrIPAB;
  vResult : Integer;
begin
  vResult := -1;
  try
    try
      vFrmSelectorProc := TSlPrIPAB.Create(nil);
      vFrmSelectorProc.Apli := aApli;
      vFrmSelectorProc.Catalogo;
      vResult :=  vFrmSelectorProc.vSelFolProceso;
    except
      on E: Exception do
        MessageDlg(E.Message, mtWarning, [mbOK], 0);
    end;
  finally
    vFrmSelectorProc.Free;
  end;
 Result := vResult;
end;
{******************************************************************************************************
*******************************************************************************************************}
procedure pAplicaFolProceso(var aQuery : TQuery; aFolProceso : Integer );
var
  vIdxParam : Integer;

begin
  for vIdxParam := 0 to (aQuery.Params.Count - 1) do
    if aQuery.Params[vIdxParam].Name = 'FOL_PROCESO' then
       aQuery.Params[vIdxParam].Value := aFolProceso;
end;
{******************************************************************************************************
*******************************************************************************************************}
function fCorreoValido(aEmail: String): Boolean;
  function Checa(CONST s: String): boolean;
    var i: Integer;
    begin
      Result:= False;
      for i:= 1 to Length(s) do
        if not (s[i] in ['a'..'z','A'..'Z','0'..'9','_','-','.']) then
          Exit;
          Result:= true;
    end;
var
  i,len: Integer;
  namePart, serverPart: String;
begin
  Result:= False;
  i:= Pos('@', aEmail);
  if (i=0) or (Pos('..',aEmail) > 0) then
    Exit;
  namePart:= Copy(aEmail, 1, i - 1);
  serverPart:= Copy(aEmail,i+1,Length(aEmail)); 
  len:=Length(serverPart); 
  if (len<4) or
     (Pos('.',serverPart)=0) or
     (serverPart[1]='.') or
     (serverPart[len]='.') or
     (serverPart[len-1]='.') then
    Exit;
  Result:= Checa(namePart) and Checa(serverPart);
end;
{******************************************************************************************************
*******************************************************************************************************}

{ OBTIENE PARAMETROS DE DV_PARAM }
function fObtenDvParam( aCveGrupo, aCveParam : String;
                        var aValor : String; var aSitParam : String; aApli : TInterApli ) : Boolean;
const
  cSqlCons = ' SELECT VALOR, SIT_PARAMETRO FROM DV_PARAM '+
             ' WHERE CVE_GRUPO = ''%s'' AND CVE_PARAM = ''%s'' ';
var
  qryDvParam : TQuery;
begin
  qryDvParam := TQuery.Create(nil);
  qryDvParam.DatabaseName := aApli.DataBaseName;
  qryDvParam.SessionName  := aApli.SessionName;
  qryDvParam.SQL.Text     := Format(cSqlCons,[aCveGrupo, aCveParam]);
  try
    qryDvParam.Open;
    Result := (not qryDvParam.IsEmpty);
    if Result then
    begin
      aValor := qryDvParam.FieldByName('VALOR').AsString;
      aSitParam := qryDvParam.FieldByName('SIT_PARAMETRO').AsString;
    end;
  finally
    qryDvParam.Free;
  end;
end;
{******************************************************************************************************
*******************************************************************************************************}

function fCargaArchivoExcel( var aDataSet : TADODataSet; var aRutaArchivo : String; aProgressBar : TProgressBar;
                aDisplayAlerts : Boolean ) :  Boolean;
begin
  FDisplayAlerts := aDisplayAlerts;
  Result := fCargaArchivoExcel( aDataSet, aRutaArchivo, aProgressBar );
  FDisplayAlerts := True;
end;
{**********************************************************************************************************************
 *********************************************************************************************************************}
function fCargaArchivoExcel( var aDataSet : TADODataSet; var aRutaArchivo : String; aProgressBar : TProgressBar ) : Boolean;
var
  OpenDlgMas : TOpenDialog;
  vArchivoList : TStringList;
  vgNomArchMas,
  vgMensage,
  vExt : String;
  pbBarraProgreso : TProgressBar;
function fCargaArchivo(aNomArchivo : String; var aDataSet : TADODataSet; var vMensaje : String; aExtExcel : String) : Boolean;
var
  HojaSeleccionada,
  vArchivo : String;
  //vConexionXLS: TADOConnection;
  vListaHojasSel : TStringList;
{##############################################################################}
  function fSeleccionaHoja(Lista: TStringList): String;
  begin
    // Funcion que muestra pantalla con las hojas existentes en el archivo xls
     with TListaHojasForm.CreateLista(nil, Lista) do
     try
       ShowModal;
       Result := vHojaMas12;
     finally
       Free;
     end;

  end;
{##############################################################################}

// Carga hojas del libro y las guarda en ListaHojas : TStringList
  function HojasExcel(Archivo: String) : TStringList;
  var
    Excel: OleVariant;
    Libro: OleVariant;
    I: Integer;
    ListaHojas : TStringList ;
  begin
    Excel := CreateOleObject('Excel.Application');
    Excel.DisplayAlerts := FDisplayAlerts; {FEB-2013}
    //Excel.interactive := False; { HAY QUE HACER PRUEBAS CON ESTO }
    Libro := Excel.WorkBooks.Open(Archivo);
    ListaHojas := TStringList.Create;
    try
      for I := 1 to Libro.Worksheets.Count do
        ListaHojas.Add(Libro.Worksheets.Item[i].Name);
    finally
      Result := ListaHojas;
      Libro.Close;
    end;
  end;
{##############################################################################}

begin
  Result := True;
  try
    //vConexionXLS := TADOConnection.Create(nil);
    //vConexionXLS.LoginPrompt := False;
    //vConexionXLS.Close;
    //aDataSet.Close;
    vArchivo := aNomArchivo;
    vListaHojasSel := TStringList.Create;
    // Obtiene lista de hojas
    vListaHojasSel := HojasExcel(vArchivo);
    HojaSeleccionada := '';
    // Funcion que muestra pantalla con las hojas del archivo xls
    // para que el usuario seleccione en cual se encuentran los RFC's
    HojaSeleccionada := fSeleccionaHoja(vListaHojasSel);

    if not (HojaSeleccionada = '') then
    begin
      if FFormatTexto then
         vArchivo := fFormatoTexto(vArchivo, HojaSeleccionada);

      aDataSet.CommandText := HojaSeleccionada;
      //aDataSet.Connection := vConexionXLS;
      //vConexionXLS.ConnectionString := Format( strConexion, [vArchivo]);

      if aExtExcel = '.XLS' then
        aDataSet.ConnectionString := Format( strConexion, [vArchivo])
      else
        aDataSet.ConnectionString := Format( strConexion2007, [vArchivo]);
      //aDataSet.lo
      try
        //vConexionXLS.Open;
        aDataSet.Open;
        //ShowMessage(IntToStr(aDataSet.RecordCount));
      except
        on e:Exception do
        begin
          ShowMessage( 'Error: ' + e.message );
          Result := False;
        end;
      end;
    end
    else
      Result := False;
  finally
   // vConexionXLS.Free;
  end;

end;  
begin
  try
    Result := True;
    OpenDlgMas := TOpenDialog.Create(nil);
    OpenDlgMas.Filter := 'Libro de Excel 97-2010 (*.xls;*.xlsx)|*.xls;*.xlsx';
    OpenDlgMas.DefaultExt := 'xls';
    OpenDlgMas.FilterIndex := 1;
    OpenDlgMas.InitialDir := 'C:\';

    if OpenDlgMas.Execute then
    begin
      vgNomArchMas := ExtractFileName(OpenDlgMas.FileName);
      vExt := ExtractFileExt(OpenDlgMas.FileName);
      if ( UpperCase(vExt) = '.XLS') or ( UpperCase(vExt) = '.XLSX') then
      begin

        //memLog.Items.Add('Cargando Archivo...');
        aDataSet.Close;
        aDataSet.CommandType := cmdTableDirect;
        aDataSet.StoreDefs := True;
        if not fCargaArchivo(OpenDlgMas.FileName, aDataSet, vgMensage, UpperCase(vExt)) then
        begin
          MessageDlg('No es posible cargar el archivo.'+#13+#10+
                      vgMensage, mtWarning, [mbOK], 0);
          Result := False;
        end
        else
        begin
          //memLog.Items.Add('Archivo Cargado.'+#9+' Registros: '+IntToStr(vDataSetXLS.RecordCount));
          aRutaArchivo :=  OpenDlgMas.FileName;
          if aProgressBar = nil then
          begin
            pbBarraProgreso := TProgressBar.Create(nil);
          end
          else
            pbBarraProgreso := aProgressBar;

          pbBarraProgreso.Max := aDataSet.RecordCount;
          pbBarraProgreso.Position := 0;
        end;

       //memLog.ItemIndex := memLog.Items.Count - 1;
     end
     else
     begin
       MessageDlg('Se espera hoja de cálculo Excel.', mtWarning, [mbOK], 0);
       Result := False;
     end;
    end
    else
      Result := False;
  finally
    OpenDlgMas.Free;
  end;

end;
{******************************************************************************************************
*******************************************************************************************************}

{******************************************************************************************************
*******************************************************************************************************}
{ TListaHojasForm }

procedure TListaHojasForm.btnAceptarClick(Sender: TObject);
begin
  //TWMasExIPAB(Self.Owner).
  vHojaMas12 := Lista.Items.Strings[Lista.ItemIndex]+'$';
  Close
end;

procedure TListaHojasForm.btnCancelarClick(Sender: TObject);
begin
  //TWMasExIPAB(Self.Owner).
  vHojaMas12 := '';
  Close;
end;

procedure TListaHojasForm.CargaDatos;
var
  i : Integer;
begin
  for i := 0 to vListaF.Count - 1 do
    Lista.Items.Add(vListaF.Strings[i]);
end;

constructor TListaHojasForm.CreateLista(aOwner: TComponent;
  var aLista: TStringList);
begin
  inherited
  CreateNew(aOwner);
  vListaF := TStringList.Create;
  vListaF := aLista;
  GlobalNameSpace.BeginWrite;
  try
    if (ClassType <> TListaHojasForm) and
      not (csDesigning in ComponentState) then
    begin
      if not InitInheritedComponent(Self, TListaHojasForm) then
        raise Exception.Create('Error al mostrar Lista de hojas');
      if OldCreateOrder and Assigned(OnCreate) then
        OnCreate(Self);
    end;
  finally
    GlobalNameSpace.EndWrite;
  end;
  Position := poDesktopCenter;
  Height := 200;
  Width := 300;
  Caption := 'Seleccione donde se encuentran los Datos';
  BorderStyle := bsDialog;
  OnShow := FormShow;

  Panel := TPanel.Create(Self);
  Panel.Parent := Self;
  Panel.BevelOuter := bvNone;
  Panel.BevelInner := bvNone;
  Panel.Height := 50;
  Panel.Align := alBottom;

  btnAceptar := TSpeedButton.Create(Panel);
  btnCancelar  := TSpeedButton.Create(Panel);

  //btnAceptar.Glyph := TWMasExIPAB(aOwner).InterForma1.BtnAceptar.Glyph;
  //btnCancelar.Glyph := TWMasExIPAB(aOwner).InterForma1.BtnCancelar.Glyph;

  btnAceptar.Parent := Panel;
  btnCancelar.Parent  := Panel;

  btnAceptar.Left := Panel.Width - 112;
  btnAceptar.Top := 12;
  btnCancelar.Left := Panel.Width - 212;
  btnCancelar.Top := 12;

  btnAceptar.Width := 100;
  btnAceptar.Height := 30;
  btnCancelar.Width := 100;
  btnCancelar.Height := 30;

  btnAceptar.Caption := 'Cargar';
  btnCancelar.Caption := 'Cancelar';

  btnAceptar.Anchors:= [akRight,akBottom];
  btnCancelar.Anchors:= [akRight,akBottom];

  btnAceptar.OnClick := btnAceptarClick;
  btnCancelar.OnClick := btnCancelarClick;

  Lista := TListBox.Create(Self);
  Lista.Parent := Self;
  Lista.Align := alClient;
  Lista.OnDblClick := btnAceptarClick;
  CargaDatos;
end;
{******************************************************************************************************
*******************************************************************************************************}
destructor TListaHojasForm.Destroy;
begin
  btnAceptar.Free;
  btnCancelar.Free;
  Panel.Free;
  Lista.Free;
  vListaF.Free;
  inherited;
end;
{******************************************************************************************************
*******************************************************************************************************}
procedure TListaHojasForm.FormShow(Sender: TObject);
begin
  Lista.ItemIndex := 0;
end;
{******************************************************************************************************
*******************************************************************************************************}

{   CAPTURA DATO PERSONALIZADO V.01     }
function fCapturaDato(aOwner: TComponent; atCaptura : TCaptura; aTipoDato : TDato; aPregunta, aTextDefault : String; aReadOnly : Boolean): String;
var
  frmCapturaDato : TfrmDvCApDato;
begin
  try
    frmCapturaDato := TfrmDvCApDato.Create(aOwner, atCaptura, aTipoDato,  aPregunta, aReadOnly);
    //if atCaptura = tcCombo then
     // frmCapturaDato.vgListaCombo := vgListaComboCap;

    repeat
      frmCapturaDato.vgDatoCapturado := aTextDefault;
      frmCapturaDato.ShowModal;
    until frmCapturaDato.vBOk {and (Length(Trim(frmCapturaDato.vgDatoCapturado)) > 5 )};
    Result := frmCapturaDato.vgDatoCapturado;
  finally
    frmCapturaDato.Free;
  end;

end;
function fCapturaDato(aOwner: TComponent; atCaptura : TCaptura; aTipoDato : TDato; aPregunta, aTextDefault : String; aReadOnly
  , aCancel  : Boolean): String;
var
  frmCapturaDato : TfrmDvCApDato;
begin
  try
    frmCapturaDato := TfrmDvCApDato.Create(aOwner, atCaptura, aTipoDato,  aPregunta, aReadOnly{, aCancel});
    repeat
      frmCapturaDato.vgDatoCapturado := aTextDefault;
      frmCapturaDato.btnCancela.Visible := aCancel;
      frmCapturaDato.ShowModal;
    until frmCapturaDato.vBOk {and (Length(Trim(frmCapturaDato.vgDatoCapturado)) > 5 )};
    Result := frmCapturaDato.vgDatoCapturado;
  finally
    frmCapturaDato.Free;
  end;
end;
{******************************************************************************************************
*******************************************************************************************************}
function fFormatoTexto(aNomArchivo, aHojaSelect : String ) : String;
begin




//
end;
{**********************************************************************************************************************
 *********************************************************************************************************************}
end.

