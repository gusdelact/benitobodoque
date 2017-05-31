// Sistema         : Clase de CrGeFiBuro
// Fecha de Inicio : 25/02/2013
// Función forma   : Clase de CrGeFiBuro
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : CARLOS A PINACHO MIRANDA
// Comentarios     :
  Unit IntCrGeFiBuro;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, DBCtrls, ScktComp, Menus
,UnPrGenCapt
,IdIcmpClient
,WinSock
;


const
  cPuerto = 1999;

Type
 TCrGeFiBuro= class; 

  TWCrGeFiBuro=Class(TForm)
    InterForma1             : TInterForma;
    dsProcesos: TDataSource;
    qryProcesos: TQuery;
    qryProcesosVALOR: TStringField;
    CteSocket: TClientSocket;
    pnlMain1: TPanel;
    mmLog: TMemo;
    pnlMain: TPanel;
    Label1: TLabel;
    btnProcesa: TBitBtn;
    btnConfigura: TBitBtn;
    pnlConf: TPanel;
    lblServer: TLabel;
    edtServer: TEdit;
    lblInterfases: TLabel;
    dbListInterfase: TDBLookupListBox;
    qryProcesosDESC_PARAM: TStringField;
    qryProcesosDESC_PARAM_B: TStringField;
    cbxProcesos: TDBLookupComboBox;
    btnNueva: TBitBtn;
    btnElimina: TBitBtn;
    mmppLog: TPopupMenu;
    Guardar1: TMenuItem;
    sdb: TSaveDialog;
    lblProcesando: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btnConfiguraClick(Sender: TObject);
    procedure edtServerChange(Sender: TObject);
    procedure edtServerExit(Sender: TObject);
    procedure btnNuevaClick(Sender: TObject);
    procedure cbxProcesosCloseUp(Sender: TObject);
    procedure btnEliminaClick(Sender: TObject);
    procedure btnProcesaClick(Sender: TObject);
    procedure Guardar1Click(Sender: TObject);
    procedure CteSocketConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure CteSocketDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure CteSocketRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure cbxProcesosClick(Sender: TObject);
    procedure edtServerEnter(Sender: TObject);
    procedure tmProcesandoTimer(Sender: TObject);

    private
    { Private declarations }
      vB_ParametrosOK,
      vB_Configurando,
      vB_IpValida, vExisteServerConf : Boolean;
      vInterval, vNumInterfases : Integer;
      vgServerOld : String;
      tmProcesando : TTimer;
      vBProcesoTerminado : Boolean;

      function fExisteParametros : Boolean;
      procedure pSetParametroServer(aParametro, aValor : String);
      procedure pSetSocket( aServer : String );
      procedure pLog( aMensaje : String );
      function fConectaServer( var aConectaServer : String ) : Boolean;
      procedure pActivaControles;
      //function Ping(Addr: PCHAR; Rep: integer = 3): boolean;
    public
    { Public declarations } 
    Objeto : TCrGeFiBuro;
end; 
 TCrGeFiBuro= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override; 
        function    Reporte:Boolean; override; 
      published 
      end;


implementation
//Uses  ;

{$R *.DFM}


constructor TCrGeFiBuro.Create( AOwner : TComponent ); 
begin Inherited; 

      StpName  := ' '; 
      UseQuery := False; 
      HelpFile := 'IntCrGeFiBuro.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrGeFiBuro.Destroy;
begin inherited;
end;


function TCrGeFiBuro.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrGeFiBuro;
begin
   W:=TWCrGeFiBuro.Create(Self);
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


Function TCrGeFiBuro.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('IGefibur.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TCrGeFiBuro.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CrGeFiBuro********************)
(*                                                                              *)
(*  FORMA DE CrGeFiBuro                                                            *)
(*                                                                              *)
(***********************************************FORMA CrGeFiBuro********************)



procedure TWCrGeFiBuro.FormShow(Sender: TObject);
begin

  tmProcesando := TTimer.Create(Self);
  tmProcesando.Interval := 500;
  tmProcesando.OnTimer := tmProcesandoTimer;
  vInterval := 0;
  qryProcesos.DatabaseName := Objeto.DataBaseName;
  qryProcesos.SessionName := Objeto.SessionName;
  vB_Configurando := False;
  vB_IpValida := False;
  if fExisteParametros then
  begin
    qryProcesos.Open;
//    if not fConectaServer(vRespConexion) then
//         pLog('No se pudo conectar con el servidor. '+#10+#13+vRespConexion);
  end;


end;

procedure TWCrGeFiBuro.FormDestroy(Sender: TObject);
begin
   //Objeto
end;

procedure TWCrGeFiBuro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CteSocket.Socket.Close;
  Action := caFree;
end;

procedure TWCrGeFiBuro.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrGeFiBuro.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrGeFiBuro.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;

function TWCrGeFiBuro.fConectaServer( var aConectaServer : String ) : Boolean;
begin
  if not CteSocket.Active then
  begin
    try

      CteSocket.Active := False;
      CteSocket.Active := True;
      Sleep(1000);
      Result := True;
    except
      on E: Exception do
      begin
        aConectaServer := E.Message;
        pLog(aConectaServer);
        Result := False;
      end;
    end;
  end else Result := True;
end;
{**********************************************************************************************************************
 *********************************************************************************************************************}
function TWCrGeFiBuro.fExisteParametros: Boolean;
  function  fObtenParametro(aCveParam: String; var aParametro : String) : Boolean;
  var
    qryParam : TQuery;
  begin
    qryParam := TQuery.Create(nil);
    qryParam.DatabaseName := Objeto.DataBaseName;
    qryParam.SessionName := Objeto.SessionName;
    qryParam.SQL.Text := Format('SELECT VALOR_PARAMETRO AS VALOR FROM BC_PARAM_BURO '+
                                'WHERE ID_EMPRESA= ''%s'' ', [aCveParam]);
    try
      try
        qryParam.Open;
        if aCveParam = '10002' then
          vNumInterfases := qryParam.RecordCount;

      except
        Result := False;
      end;
    finally
      Result := not qryParam.IsEmpty;
      aParametro := qryParam.FieldByName('VALOR').AsString;
      qryParam.Close;
      qryParam.Free;
    end;
  end;
var
  vParametro : String;
begin
  vB_ParametrosOK := False;
  
  if fObtenParametro('10001', vParametro) then
  begin
    vExisteServerConf := True;
    pSetSocket(vParametro);
    edtServer.Text := vParametro;

    if fObtenParametro('10002', vParametro) then
    begin
      vB_ParametrosOK := True;
    end
    else
      MessageDlg('No existe interfase configurada.', mtWarning, [mbOK], 0);
  end
  else
  begin
    vExisteServerConf := False;
    MessageDlg('No se encuentra el servidor configurado.', mtWarning, [mbOK], 0);
  end;

end;
{**********************************************************************************************************************
 *********************************************************************************************************************}
procedure TWCrGeFiBuro.btnConfiguraClick(Sender: TObject);
const
  cWithAdd = 250;
var
  i : Integer;
  vControlMemo : TComponent;
begin {CAPM ACL-NOV2011}

  vB_Configurando := not vB_Configurando;
  if vB_Configurando then
     i := (cWithAdd * 1)
  else
    i := (cWithAdd * -1);

  InterForma1.F.Width := InterForma1.F.Width + i;
  InterForma1.F.gbApli.Width := InterForma1.F.gbApli.Width + i;
  pnlConf.Parent.Parent.Width := pnlConf.Parent.Parent.Width + i;
  Self.Width := Self.Width + i;
  pnlConf.Width := pnlConf.Width - 10;
end;
{**********************************************************************************************************************
 *********************************************************************************************************************}
procedure TWCrGeFiBuro.edtServerChange(Sender: TObject);
  function IsValidIP(S: String): Boolean;
    function NextItem( var Item : string): String;
    begin
      if StrScan( PChar( Item ), '.' ) <> nil then
      begin
        Result := Copy( Item, 1, pos( '.',  Item ) - 1 );
        Item   := Copy( Item, pos( '.',  Item ) + 1, length(Item) );
      end else
      begin
       Result := Item;
       Item   := '';
      end;
      Result := Trim( Result );
    end;
  var
    Strings : TStringList;
    vCadena : String;
  begin
    Result := false;
    vCadena := S;
    Strings := TStringList.Create;
    repeat
      Strings.Add(NextItem( S ));
    until S = '';


    if (Strings.Count = 4) and (Copy(vCadena, Length(vCadena), 1) <> '.' ) then
    begin
        repeat
          Result := (StrToIntDef(Strings[0], -1) in [0..255]);
          Strings.Delete(0);
        until (Strings.Count = 0) or not Result;
    end;
    Strings.Free;
  end;
begin
  if IsValidIP(TEdit(Sender).Text) then
  begin
    edtServer.Color := $00D2FFD2;
    vB_IpValida := True;
  end
  else
  begin
    vB_IpValida := False;
    edtServer.Color := $008080FF;
  end;
end;
{**********************************************************************************************************************
 *********************************************************************************************************************}
procedure TWCrGeFiBuro.edtServerExit(Sender: TObject);
begin
  if (vgServerOld <> TEdit(Sender).Text) then
  begin
    if vB_IpValida then
      pSetParametroServer('SERVER', TEdit(Sender).Text)
    else
      MessageDlg('Servidor inválido', mtWarning, [mbOK], 0);
  end;
end;
{**********************************************************************************************************************
 *********************************************************************************************************************}
procedure TWCrGeFiBuro.pSetParametroServer(aParametro, aValor: String);
var
  qrySetParam : TQuery;
  vCommit : Boolean;
begin
  qrySetParam := TQuery.Create(nil);
  qrySetParam.DatabaseName := Objeto.DataBaseName;
  qrySetParam.SessionName := Objeto.SessionName;
  vCommit := False;
  if not Objeto.Apli.DataBase.InTransaction then
    Objeto.Apli.DataBase.StartTransaction;
  if vExisteServerConf then
  begin
    qrySetParam.SQL.Text := Format('UPDATE BC_PARAM_BURO SET VALOR_PARAMETRO = %s'+
                                   '  WHERE ID_EMPRESA = ''10001'''+
                                   '  AND CVE_PARAMETRO = %s ',
                                   [QuotedStr(aValor), QuotedStr(aParametro)]);
  end
  else
  begin
    qrySetParam.SQL.Text := Format('Insert into BC_PARAM_BURO '+
                                          '((ID_EMPRESA, CVE_PARAMETRO, VALOR_PARAMETRO, DESCRIPCION) '+
                                     ' VALUES (''10001'', %s, %s, ''SERVIDOR DE REPORTES DE BURO DE CREDITO'') ',
                                     [QuotedStr(aParametro), QuotedStr(aValor), QuotedStr(Objeto.DameUsuario)])
  end;
  try
    try
      qrySetParam.ExecSQL;
      vCommit := True;
      pSetSocket(aValor);
    except
      on E: Exception do
      begin
        Objeto.Apli.DataBase.Rollback;
        MessageDlg('Error al actualizar servidor: '+E.Message, mtWarning, [mbOK], 0);
      end;
    end;

  finally
    if vCommit then
      Objeto.Apli.DataBase.Commit;

    qrySetParam.Close;
    qrySetParam.Free;
  end;


end;
{**********************************************************************************************************************
 *********************************************************************************************************************}
procedure TWCrGeFiBuro.btnNuevaClick(Sender: TObject);
  function fInserta(aNombre, aDescripcion : String) : Boolean;
  var
    qryInsParam : TQuery;
    vCommit : Boolean;
  begin
    Result := False;
    qryInsParam := TQuery.Create(nil);
    qryInsParam.DatabaseName := Objeto.DataBaseName;
    qryInsParam.SessionName := Objeto.SessionName;
    vCommit := False;
    if not Objeto.Apli.DataBase.InTransaction then
      Objeto.Apli.DataBase.StartTransaction;

      qryInsParam.SQL.Text := Format('INSERT INTO BC_PARAM_BURO '+
                                       '(ID_EMPRESA, VALOR_PARAMETRO, DESCRIPCION, CVE_PARAMETRO) '+
                                       ' VALUES (''10002'', %s, %s, %s ) ',
                                       [QuotedStr(aNombre), QuotedStr(aDescripcion), QuotedStr( IntToStr(vNumInterfases+1)  )]);

    try
      try
        qryInsParam.ExecSQL;
        vCommit := True;
        Inc(vNumInterfases);
        Result := True;
      except
        on E: Exception do
        begin
          Objeto.Apli.DataBase.Rollback;
          MessageDlg('Error al actualizar servidor: '+E.Message, mtWarning, [mbOK], 0);
        end;
      end;

    finally
      if vCommit then
        Objeto.Apli.DataBase.Commit;

      qryInsParam.Close;
      qryInsParam.Free;
    end;

  end;
var
  vNombreScript,
  vDescripcion : String;
  vContinua : Boolean;
begin
  vNombreScript := fCapturaDato(Self, tcEdit, tdString,  'Nombre del Script en servidor        .',
                                '', False, True);
  vContinua := vNombreScript <> 'X1X';
  if vContinua then
  begin
    vDescripcion := fCapturaDato(Self, tcEdit, tdString, 'Descripción                                          .',
                                '', False, True);
    vContinua := vDescripcion <> 'X1X';
    if vContinua then
      if fInserta(vNombreScript, vDescripcion) then
      begin
        qryProcesos.Close;
        qryProcesos.Open;

      end;
  end;
end;
{**********************************************************************************************************************
 *********************************************************************************************************************}
procedure TWCrGeFiBuro.cbxProcesosCloseUp(Sender: TObject);
begin

//  btnProcesa.Enabled := (not qryProcesos.IsEmpty)
//                        and (cbxProcesos.Text <> '');

end;
{**********************************************************************************************************************
 *********************************************************************************************************************}
procedure TWCrGeFiBuro.pSetSocket(aServer: String);
var
  vRespConexion : String;
begin
  CteSocket.Active := False;
  CteSocket.Host := aServer;
  CteSocket.Address := aServer;
  CteSocket.Port := cPuerto;
  if vB_IpValida then
  begin
    //if ping(edtServer.Text) then
    begin
      if not fConectaServer(vRespConexion) then
           pLog('No se pudo conectar con el servicio. '+#10+#13+vRespConexion);
    end
//    else
//      MessageDlg('No se encuentra el servidor: '+edtServer.Text, mtWarning, [mbOK], 0);
  end;
end;

procedure TWCrGeFiBuro.btnEliminaClick(Sender: TObject);
  function fEliminaInterfase(aInserfase : String) : Boolean;
    function fSetSecuencia : Boolean;
    var
      qrySecuencia : TQuery;
      vSecuencia : Integer;
    begin
      Result := False;
      qrySecuencia := TQuery.Create(nil);
      qrySecuencia.DatabaseName := Objeto.DataBaseName;
      qrySecuencia.SessionName := Objeto.SessionName;
      qrySecuencia.SQL.Text := 'SELECT VALOR_PARAMETRO AS VALOR, CVE_PARAMETRO AS SECUENCIA FROM BC_PARAM_BURO '+
                               'WHERE ID_EMPRESA = ''10002'' '+
                               'ORDER BY SECUENCIA';
      qrySecuencia.Open;
      if not qrySecuencia.IsEmpty then
      begin
        vSecuencia := 1;
        qrySecuencia.First;
        while not qrySecuencia.Eof do
        begin

          RunSQL(Format('UPDATE BC_PARAM_BURO SET CVE_PARAMETRO = %s  '+
                        'WHERE ID_EMPRESA = ''10002'' '+
                        ' AND VALOR_PARAMETRO = %s AND CVE_PARAMETRO = %s ',
                        [IntToStr(vSecuencia),
                         QuotedStr(qrySecuencia.FieldByName('VALOR').AsString),
                         qrySecuencia.FieldByName('SECUENCIA').AsString]),
                         Objeto.DataBaseName, Objeto.SessionName, False);

          Inc(vSecuencia);
          qrySecuencia.Next;
        end;
        Result := True;


      end
      else
      begin
        Result := True;
      end;
      qrySecuencia.Close;
      qrySecuencia.Free;
    end;
  var
    qryDelParam : TQuery;
    vCommit : Boolean;
  begin
    Result := False;
    qryDelParam := TQuery.Create(nil);
    qryDelParam.DatabaseName := Objeto.DataBaseName;
    qryDelParam.SessionName := Objeto.SessionName;

    vCommit := False;
    if not Objeto.Apli.DataBase.InTransaction then
      Objeto.Apli.DataBase.StartTransaction;

      qryDelParam.SQL.Text := Format('DELETE BC_PARAM_BURO '+
                                   ' WHERE ID_EMPRESA = ''10002'' '+
                                   '  AND VALOR_PARAMETRO = %s ',
                                   [QuotedStr(aInserfase)]);

    try
      try
        qryDelParam.ExecSQL;
        if fSetSecuencia then
        begin
          vCommit := True;
          Dec(vNumInterfases);
          Result := True;
        end;

      except
        on E: Exception do
        begin
          Objeto.Apli.DataBase.Rollback;
          MessageDlg('Error al eliminar interfase: '+E.Message, mtWarning, [mbOK], 0);
        end;
      end;

    finally
      if vCommit then
        Objeto.Apli.DataBase.Commit
      else
        Objeto.Apli.DataBase.Rollback;

      qryDelParam.Close;
      qryDelParam.Free;
    end;



  end;
begin
  if (MessageDlg('¿Eliminar Interfase seleccionada?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    if fEliminaInterfase(dbListInterfase.KeyValue) then
    begin
      qryProcesos.Close;
      qryProcesos.Open;
    end;

end;
{**********************************************************************************************************************
 *********************************************************************************************************************}
procedure TWCrGeFiBuro.btnProcesaClick(Sender: TObject);
  function fProcesa( aInterfase : String) : Boolean;
    function fSendCommand( aCommand : String; var aResultado : String ) : Boolean;
    var
      vResultInt : Integer;
      vRespConexion : String;
    begin
      try

        if not CteSocket.Active then
          fConectaServer(vRespConexion);

        CteSocket.Socket.SendText(aCommand);
        pLog('- Inicia proceso -');
        Result := True;
      except
        on E: Exception do
        begin
          aResultado := E.Message;
          pLog(aResultado);
          Result := False;
        end;
      end;


    end;
  var
    vRespuestaServer : String;
  begin
    Result := False;

//    if fConectaServer(vRespuestaServer) then
//    begin
      if not fSendCommand(aInterfase, vRespuestaServer) then
        MessageDlg('No se pudo comunicar con el servicio.'+#10+#13+vRespuestaServer, mtWarning, [mbOK], 0);
//    end
//    else
//      pLog('No se pudo conectar con el servicio.');//+#10+#13+vRespuestaServer, mtWarning, [mbOK], 0);

  end;
begin
  InterForma1.CanCloseForm := False;
  tmProcesando.Enabled := True;
  btnProcesa.Enabled := False;
  lblProcesando.Visible := True;
  cbxProcesos.Enabled := False;
  if vB_Configurando then
    btnConfigura.Click;
  btnConfigura.Enabled := False;
  vBProcesoTerminado := False;
  if fProcesa(cbxProcesos.KeyValue) then

end;
{**********************************************************************************************************************
 *********************************************************************************************************************}
procedure TWCrGeFiBuro.pLog(aMensaje: String);
begin
  mmLog.Lines.Add('['+FormatDateTime('DDMM:HH:NN:SS', Now)+'] '+ aMensaje);
end;
{**********************************************************************************************************************
 *********************************************************************************************************************}
procedure TWCrGeFiBuro.Guardar1Click(Sender: TObject);
begin
  if sdb.Execute then
    mmLog.Lines.SaveToFile(sdb.FileName);
end;
{**********************************************************************************************************************
 *********************************************************************************************************************}
procedure TWCrGeFiBuro.CteSocketConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  pLog('Conexión.');
  btnProcesa.Enabled := True;
end;
{**********************************************************************************************************************
 *********************************************************************************************************************}
procedure TWCrGeFiBuro.CteSocketDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  pActivaControles;
  pLog('Desconexión.');
  btnProcesa.Enabled := False;   
end;
{**********************************************************************************************************************
 *********************************************************************************************************************}
procedure TWCrGeFiBuro.CteSocketRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  vReceiveText : String;
begin
  Application.ProcessMessages;
  vReceiveText := Socket.ReceiveText;


  if (Pos('-OKA-', vReceiveText) > 0) then
  begin
    vBProcesoTerminado := True;
    vReceiveText := StringReplace(vReceiveText, '-OKA-', '', [rfReplaceAll]);
  end;

  pLog(vReceiveText);
  if vBProcesoTerminado then
  begin
  
    pLog('- Procesado -');
    pActivaControles;
  end;
end;
{**********************************************************************************************************************
 *********************************************************************************************************************}
procedure TWCrGeFiBuro.cbxProcesosClick(Sender: TObject);
var
  vRespConexion : String;
begin
  if vExisteServerConf and not CteSocket.Active then
  begin
    if not fConectaServer(vRespConexion) then
         pLog('No se pudo conectar con el servidor. '+#10+#13+
               vRespConexion);
  end;
end;
{**********************************************************************************************************************
 *********************************************************************************************************************}
procedure TWCrGeFiBuro.edtServerEnter(Sender: TObject);
begin
  vgServerOld := TEdit(Sender).Text;
end;
{**********************************************************************************************************************
 *********************************************************************************************************************}
procedure TWCrGeFiBuro.tmProcesandoTimer(Sender: TObject);
begin
  case vInterval of
   1 : lblProcesando.Caption := 'Procesando';
   2 : lblProcesando.Caption := 'Procesando.';
   3 : lblProcesando.Caption := 'Procesando..';
   4 : begin
         lblProcesando.Caption := 'Procesando...';
         vInterval := 0;
       end;
  end;
  Inc(vInterval);
end;
{**********************************************************************************************************************
 *********************************************************************************************************************}
procedure TWCrGeFiBuro.pActivaControles;
begin
  InterForma1.CanCloseForm := True;
  btnProcesa.Enabled := True; //--(vReceiveText = 'OKA')--//
  tmProcesando.Enabled := False;
  lblProcesando.Visible := False;
  cbxProcesos.Enabled := True;
  btnConfigura.Enabled := True;
end;
{**********************************************************************************************************************
 *********************************************************************************************************************}

end.
