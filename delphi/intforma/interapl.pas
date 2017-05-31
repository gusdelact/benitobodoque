unit InterApl;
//-------------------------------------------------------------
// Sistema         :   InterApl
// Date            :   Julio de 1997
// Fecha de Inicio :   A Julio de 1997
// Función forma   :   Control de Aplicaciones/Usuarios
// Desarrollo por  :   Víctor Martínez Castro
// Modificado      :   Fernando Ramírez Mercado
// Comentarios     :   Aplicacion Seguridades Nivel 2
// Actualizado al  :   07 Septiembre
//15 agosto 2000 ooll753
// ------------------------------------------------------------
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dbTables, DB, StdCtrls, extCtrls, Menus, ComCtrls, UnSubGen,
  dbctrls, IntFecha, Buttons, IniFiles;

Type
    TOnMenuClick= Procedure (Sender : TObject; Var NomFuncion:String) of Object;

Const Nada='';
      WM_DESPUES_START=WM_USER+1;
      vgApliSaveError:Boolean=False;

type
  TInterApli= class(TComponent)
  private
    FApli:String;
    FUsuario:String;
    FUsuarioNombre:String;
    FUsuarioID:LongInt;
    FNomPerfil:String;
    FCvePerfil:LongInt;
    FIndicador:String;
    FIdEmpresa:LongInt;
    FDataBaseName:String;
    FSessionName:String;
    FSeguDataBaseName:String;
    FSeguSessionName:String;
    FErrorDataBaseName:String;
    FErrorSessionName:String;
    FVersion:String;
    FVersionFecha:String;
    FVersionEmpresa:String;
    FVersionInfo:String;
    FVersionLogo:String;
    FVersionImagen:string;
    FOnMenuClick:TOnMenuClick;
    FDataBase:TDataBase;
    FSeguDataBase:TDataBase;
    FErrorDataBase:TDataBase;
    FPantallaLogo:String;

    FAliasName:String;
    FImagen:TPicture;
    FIma:TImage;
    FNomIndicador:String;
    FFEcha:TFecha;

    FFilter:TStrings;
    FFiltered:Boolean;

    FTreePanel:TPanel;

    FPostErrorMessage:String;
    FOnPostError:TNotifyEvent;

    FNotificador:TInterNotificador;
  protected
   Procedure SetApli(S:String);
   procedure Notification( AComponent : TComponent; Operation : TOperation ); override;
   Procedure SetDataBase(T:TDataBase);
   Function  GetDataBaseName:string;
   Procedure SetSeguDataBase(T:TDataBase);
   Function  GetSeguDataBase:TDataBase;

   Procedure SetErrorDataBase(T:TDataBase);
   Function  GetErrorDataBase:TDataBase;
   Procedure SetFilter(Value : TStrings);

  public
    Q1:TQuery;
    Q2:TQuery;
    Q3:TQuery;
    MainForm:TForm;
    MsgError:String;
    LastFechaHora : TDateTime;
    PanelMenu    :TPanel;
    PanelFuncion :TPanel;
    PanelFavorito:TPanel;
    PanelImagen  :TPanel;
    PanelTools   :TPanel;
    StatusBar    :TStatusBar;
    Scroll       :TScrollBox;
    LabelFuncion :TLabel;
    LabelPerfilIndicador:TPanel;
    FavoritoDefH : Integer;
    Welcome      :String;
    LabelWelcome :TLabel;
    TreeMenu     :TTreeView;
    TreeFuncion  :TTreeView;
    TreeFavorito :TTreeView;
    ApliNomFuncion:String;
    Active:Boolean;
    Timer:TTimer;
    NomAplicacion:String;
    ClasePerfil:Integer;
    LastFuncion:String;
    CtoHeader:TBaseInterFrame;

    ShowMenus : Boolean;

    CaptionIndicador:String;
    CaptionSelPerfil:String;

    constructor Create( AOwner : TComponent ); override;
    destructor Destroy; override;
    Procedure MenuClick(Sender:TObject);
    Procedure LogOn;
    Procedure PrintSetup;

    Procedure ShowWelcome;
    Property Usuario:String read FUsuario Write FUsuario;
    Property UsuarioID:LongInt read FUsuarioID Write FUsuarioID;
    Property UsuarioNombre:String read FUsuarioNombre Write FUsuarioNombre;
    Property NomPerfil:String read FNomPerfil Write FNomPerfil;
    Property CvePerfil:Integer read FCvePerfil Write FCvePerfil;
    Property Indicador:String read FIndicador Write FIndicador;
    Property IdEmpresa:LongInt read FIdEmpresa Write FIdEmpresa;
    Property NomIndicador:String Read FNomIndicador Write FNomIndicador;
    Procedure CargaImagen(IEmpresa:LongInt);
    Property  Fecha:TFecha Read FFEcha Write FFecha;
    Function  DameFechaEmpresaDia(Cve_Dia:String):TDateTime;
    Function  DameFechaEmpresa:TDateTime;
    Property  SeguDataBaseName:String read FSeguDataBaseName Write FSeguDataBaseName;
    Property  SeguSessionName:String read FSeguSessionName Write FSeguSessionName;
    Property  ErrorDataBaseName:String read FErrorDataBaseName Write FErrorDataBaseName;
    Property  ErrorSessionName:String read FErrorSessionName Write FErrorSessionName;
    Procedure StartSinMenu(eUsuario:String; eEmpresa,ePerfil,eClasePerfil:Integer; eIndicador:String);
    Procedure ApplyFilter;
    Function  IsProd:Boolean;
    Function  GetAlias(Caso:Integer):String;

    Property  Notificador:TInterNotificador Read FNotificador  Write FNotificador;
    Procedure LogOnAuto(sUsuario,sPassword,sNomUsuario:String; sUsuarioID:Integer;
                                ePerfil , eClasePerfil, eID_Empresa :Integer;
                                eIndicAdd, eNom_Perfil,eNomIndicAdd:String);
   Property PostErrorMessage:String Read FPostErrorMessage Write FPostErrorMessage;
   Property OnPostError:TNotifyEvent Read FOnPostError Write FOnPostError;
   Function getDbUser(pAlias : String):String;
   Function getDbPass(pAlias : String):String;
  published
    Procedure InitFechaOracle;
    Procedure InitUsuarioOracle;
    Procedure Start(Form:TForm);
    Procedure OpenDB;
    Procedure OpenFavorito;
    Procedure CreaMenus;
    procedure MenuChange(Sender: TObject; Node: TTreeNode);
    Procedure CargaFuncion(Clave:String);
    Procedure CargaFavorito;
    Procedure MenuRun(Sender:TObject; Funcion:String);
    procedure MenuClose(Sender: TObject);
    procedure MenuSugiere(Sender: TObject);
    Property  Apli :String read FApli Write SetApli;
    Property  DataBaseName:String read GetDataBaseName;
    Property  SessionName:String read FSessionName Write FSessionName;

    Property  SeguDataBase:TDataBase Read GetSeguDataBase Write SetSeguDataBase;
    Property  ErrorDataBase:TDataBase Read GetErrorDataBase Write SetErrorDataBase;
    Property  DataBase:TDataBase Read FDataBase Write SetDataBase;
    Property  OnMenuClick:TOnMenuClick Read FOnMenuClick Write FOnMenuClick;

    Property  Version:String Read FVersion Write FVersion;
    Property  VersionFecha:String Read FVersionFecha Write FVersionFecha;
    Property  VersionEmpresa:String Read FVersionEmpresa Write FVersionEmpresa;
    Property  VersionInfo:String Read FVersionInfo Write FVersionInfo;
    Property  VersionLogo:String Read FVersionLogo Write FVersionLogo;
    Property  PantallaLogo:String Read FPantallaLogo Write FPantallaLogo;

    Property  VersionImagen:String Read FVersionImagen Write FVersionImagen;

    procedure FuncionChange(Sender: TObject; Node: TTreeNode);
    procedure FuncionDblClick(Sender: TObject);
    Procedure FavoritoDblClick(Sender: TObject);
    procedure FormaKeyPress(Sender: TObject; var Key: Char);
    procedure FuncionDragOver(Sender, Source: TObject; X,
              Y: Integer; State: TDragState; var Accept: Boolean);
    procedure FuncionDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure FavoritoDragOver(Sender, Source: TObject; X,
              Y: Integer; State: TDragState; var Accept: Boolean);
    procedure FavoritoDragDrop(Sender, Source: TObject; X, Y: Integer);
    Procedure ErrorGeneral(Sender:TObject; E:Exception);
    Procedure ActivaApli(Sender:TObject);
    Procedure ReLogOn;
    Procedure MuestraAbout;
    function  SysDateTime:TDateTime;
    Procedure OnTimer(Sender:TObject);

    Procedure CreateFormObjects(Form:TForm);
    Procedure CallApli(NombreAplicacion:String; eApli:TInterApli);
    Procedure CreaItems;
    Property  Filter:TStrings Read FFilter Write SetFilter;
    Property  Filtered:Boolean Read FFiltered Write FFiltered default False;
    Procedure DespuesStart;
    Procedure ShowQuest;
    Procedure SaveConfig(Section,Entry:String; Value:String);
    Function  LoadConfig(Section,Entry:String; ValueDef:String):String;

end;

Type
  TNodoFun=Class
    Clave :String;
    Nombre:String;
    Desc  :String;
  end;

//Function DBConecta(Base:TDataBase; Alias:String):Boolean;
Function DBConecta(Base:TDataBase; Alias:String; pSilent: Boolean = False):Boolean;
Function DBConectaPoD(Base:TDataBase; Alias:String):Boolean;
Function BuscaValor(Base:TDataBase; Parametro:String):String;
Function DameHorario(S:String):TDateTime;
Function GetSysDateTime(DataBaseName,SessionName:String):TDateTime;

procedure Register;

implementation

{$R *.DCR}

Uses IntPass, IntSPerf, UnSQL2,IntAbout, IntStart,
UnGene, InterFun, InterErr, InterQuest, IntHead;

Function DameHorario(S:String):TDateTime;
var
  Hor,Min,Seg,Err:Integer;
begin
  DameHorario:=0;
  if S='' then exit;
  Val(Copy(S,1,2),Hor,Err); if Err<>0 then Hor:=0;
  Val(Copy(S,3,2),Min,Err); if Err<>0 then Min:=0;
  Val(Copy(S,5,2),Seg,Err); if Err<>0 then Seg:=0;
  if Seg>59 then begin Seg:=Seg-60; Min:=Min+1; end;
  if Min>59 then begin Min:=Min-60; Hor:=Hor+1; end;
  if Hor>23 then Hor:=0;
  DameHorario:=EncodeTime(Hor,Min,Seg,0);
end;

Function getDataBaseConfig(pAlias: String; var pNombre, pUsuario, pPassword: String): Boolean;
Var
  ini: TIniFile;
  conexion: TStrings;
Begin
{  Función para leer la configuración de conexión para las bases de datos
   - Archivo de configuracion .ini "DBConfig.ini"
   - Se busca solamente en la misma ruta donde este ejecutandose el exe
   - Seccion de configuracion de una base:
          [ALIAS]
          name=SID
          user=USER
          password=PASSWORD

     Ejemplo:
          [MCAP]
          name=RMCAP
          user=admiprod
          password=pruebas
}
  getDataBaseConfig:= False;
  Try
    ini:= TIniFile.Create(ExtractFilePath(Application.EXEName) + 'DBCONFIG.INI');
    Try
        pNombre:= ini.ReadString(pAlias, 'name', '');
        if pNombre <> '' Then
        Begin
          pUsuario:= ini.ReadString(pAlias, 'user', '');
          pPassword:= ini.ReadString(pAlias, 'password', '');
          getDataBaseConfig:= true;
        end;
    Finally
        ini.Free;
    end;
  Except
    //on E: Exception do ShowMessage('Error.. ' + e.message);
  end;
end;
     
//Function DBConecta(Base:TDataBase; Alias:String):Boolean;
Function DBConecta(Base:TDataBase; Alias:String; pSilent: Boolean = False):Boolean;
var
  vlNombre, P, Us, Pa, prefijo: String;
  vlConfigArchivo: Boolean;
Begin
  DBConecta:=False;
  IniciaSistema(-1,'Iniciando Comunicación con la Base de Datos');

  Try
    Alias:= UpperCase(Alias);

    { Identifica si el alias está configurado en el archivo DbConfig.ini }
    vlConfigArchivo:= getDataBaseConfig(Alias, vlNombre, us, pa);

    If vlConfigArchivo then
    Begin
      If  MessageDlg('Conexión a base de datos por configuración de archivo' + chr(VK_RETURN) +
                     '¿Esta seguro de establecer la conexión ' + Alias + ' a la base ' + vlNombre + ' con el usuario ' + us,
                     mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
        { Conexion por archivo de configuración }
        IniciaSistema(-1, 'Iniciando Comunicación con la Base de Datos... ' + chr(VK_RETURN) + 'Base [' + vlNombre + ']   Usuario [' + us + ']');
        vlNombre:= 'SERVER NAME='+vlNombre;
        Us:= 'USER NAME=' + us;
        Pa:= 'PASSWORD=' + pa;
      end
      Else vlConfigArchivo:= False;
    end;

{
    If getDataBaseConfig(Alias, vlNombre, us, pa) Then
    Begin
        IniciaSistema(-1, 'Iniciando Comunicación con la Base de Datos... ' + chr(VK_RETURN) + 'Base [' + vlNombre + ']   Usuario [' + us + ']');
        vlNombre:= 'SERVER NAME='+vlNombre;
        Us:= 'USER NAME=' + us;
        Pa:= 'PASSWORD=' + pa;
    end
    Else
}
    If Not vlConfigArchivo then
    Begin
        { Conexion por prefijo y alias de la base de datos }
        P:= ParamStr(1);
        prefijo:= Copy(UpperCase(P), 1, 1);

        { Identificacion del usuario de la conexion a base de datos }
//        If (prefijo = 'P') or (prefijo = 'Q') {or (prefijo = 'T')} Then  //para que corra en TC comentar el prefijo rohs4279
        If (prefijo = 'P') or (prefijo = 'Q') or (prefijo = 'T') Then
        Begin
           { Usuarios de Produccion, Quality y Testing }
           Us:='USER NAME=SISTEMAS';
           Pa:='PASSWORD=DEVELOP';
        end
        Else
        Begin
           Us:='USER NAME=SISTEMAS';
           Pa:='PASSWORD=DESARROLLO';

           // Conexion default cuando no se asigna prefijo... C para ambiente de desarrollo ICB
           If prefijo = '' Then P:= 'C';
        end;

        { Identificación del servidor de base de datos }
        vlNombre:= 'SERVER NAME='+P+Alias;

        { Mensaje a pantalla para identificar el ambiente }
        If (prefijo = 'P') Then
           IniciaSistema(-1, 'Iniciando Comunicación con la Base de Datos')
        Else If (prefijo = 'Q') Then
           IniciaSistema(-1, 'AMBIENTE DE QUALITY !!!  Iniciando Comunicación con la Base de Datos')
        Else If (prefijo = 'T') Then
           IniciaSistema(-1, 'AMBIENTE DE TESTING !!!  Iniciando Comunicación con la Base de Datos')
        Else If (prefijo = 'A') Then
           IniciaSistema(-1, 'AMBIENTE DE DESARROLLO AISA [' + Alias + ']... Iniciando Comunicación con la Base de Datos')
        Else If (prefijo = 'B') Then
           IniciaSistema(-1, 'AMBIENTE DE DESARROLLO BINTER [' + Alias + ']... Iniciando Comunicación con la Base de Datos')
        Else If (prefijo = 'C') Then
           IniciaSistema(-1, 'AMBIENTE DE DESARROLLO ICB [' + Alias + ']... Iniciando Comunicación con la Base de Datos')
        Else
          IniciaSistema(-1, 'AMBIENTE DE DESARROLLO [' + P + Alias + ']... Iniciando Comunicación con la Base de Datos');
    end;

    Base.Connected:= False;
    Base.Params.Clear;
    Base.Params.Add(vlNombre);
    Base.Params.Add('LANGDRIVER=DBWINWE0');
    Base.Params.Add(Us);
    Base.Params.Add(Pa);
    Base.Connected:=True;
    DBConecta:=True;

  Finally
    If pSilent Then
        IniciaSistema(101,'Iniciando Comunicación con la Base de Datos')
    else
        IniciaSistema(-1, 'Iniciando Comunicación con la Base de Datos');
  end;
end;

Function DBConectaPoD(Base:TDataBase; Alias:String):Boolean;
var
  vlNombre, P, Us, Pa, prefijo: String;
  vlConfigArchivo: Boolean;
Begin
  DBConectaPoD:= False;
  IniciaSistema(-1,'Iniciando Comunicación con la Base de Datos');

  Try
    Alias:= UpperCase(Alias);

    { Identifica si el alias está configurado en el archivo DbConfig.ini }
    vlConfigArchivo:= getDataBaseConfig(Alias, vlNombre, us, pa);

    If vlConfigArchivo then
    Begin
      If  MessageDlg('Conexión a base de datos por configuración de archivo... ' + chr(VK_RETURN) +
                     '¿Esta seguro de establecer la conexión ' + Alias + ' a la base ' + vlNombre + ' con el usuario ' + us,
                     mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
        { Conexion por archivo de configuración }
        IniciaSistema(-1, 'Iniciando Comunicación con la Base de Datos... ' + chr(VK_RETURN) + 'Base [' + vlNombre + ']   Usuario [' + us + ']');
        vlNombre:= 'SERVER NAME='+vlNombre;
        Us:= 'USER NAME=' + us;
        Pa:= 'PASSWORD=' + pa;
      end
      Else vlConfigArchivo:= False;
    end;

    If Not vlConfigArchivo then
    Begin
        { Conexion por prefijo y alias de la base de datos }
        P:= ParamStr(1);
        prefijo:= Copy(UpperCase(P), 1, 1);

        { Identificacion del usuario de la conexion a base de datos }
        If (prefijo = 'P') or (prefijo = 'Q') or (prefijo = 'T') Then
        Begin
           { Usuarios de Produccion, Quality y Testing }
           Us:='USER NAME=SISTEMAS';
           Pa:='PASSWORD=DEVELOP';
        end
        Else
        Begin
           Us:='USER NAME=SISTEMAS';
           Pa:='PASSWORD=DESARROLLO';

          // Conexion default cuando no se asigna prefijo reconocido... C para ambiente de desarrollo ICB
          If not (
                    (prefijo = 'P') or   { Produccion }
                    (prefijo = 'Q') or   { Quality }
                    (prefijo = 'T') or   { Test }
                    (prefijo = 'A') or   { Desarrollo - AISA }
                    (prefijo = 'B') or   { Desarrollo - Banco }
                    (prefijo = 'C')      { Desarrollo - ICB }
                  ) then
            P:= 'C';
        end;

        { Identificación del servidor de base de datos }
        vlNombre:= 'SERVER NAME='+P+Alias;

        { Mensaje a pantalla para identificar el ambiente }
        If (prefijo = 'P') Then
           IniciaSistema(-1, 'Iniciando Comunicación con la Base de Datos')
        Else If (prefijo = 'Q') Then
           IniciaSistema(-1, 'AMBIENTE DE QUALITY !!!  Iniciando Comunicación con la Base de Datos')
        Else If (prefijo = 'T') Then
           IniciaSistema(-1, 'AMBIENTE DE TESTING !!!  Iniciando Comunicación con la Base de Datos')
        Else If (prefijo = 'A') Then
           IniciaSistema(-1, 'AMBIENTE DE DESARROLLO AISA [' + Alias + ']... Iniciando Comunicación con la Base de Datos')
        Else If (prefijo = 'B') Then
           IniciaSistema(-1, 'AMBIENTE DE DESARROLLO BINTER [' + Alias + ']... Iniciando Comunicación con la Base de Datos')
        Else If (prefijo = 'C') Then
           IniciaSistema(-1, 'AMBIENTE DE DESARROLLO ICB [' + Alias + ']... Iniciando Comunicación con la Base de Datos')
        Else
          IniciaSistema(-1, 'AMBIENTE DE DESARROLLO [' + P + Alias + ']... Iniciando Comunicación con la Base de Datos');
    end;

    Base.Connected:= False;
    Base.Params.Clear;
    //Base.Params.Add('SERVER NAME='+P+Alias);
    Base.Params.Add(vlNombre);
    Base.Params.Add('LANGDRIVER=DBWINWE0');
    Base.Params.Add(Us);
    Base.Params.Add(Pa);
    Base.Connected:=True;
    DBConectaPoD:=True;

  Finally
    IniciaSistema(-1, 'Iniciando Comunicación con la Base de Datos');
  end;
end;

{
Function DBConecta(Base:TDataBase; Alias:String):Boolean;
var
  P, Us,Pa:String;
begin
  DBConecta:=False;
  IniciaSistema(-1,'Iniciando Comunicación con la Base de Datos');
  Try
    Alias := UpperCase(Alias);
    P := ParamStr(1);
    if(Length(Trim(P)) >= 1)and((P = 'P')or(Copy(P,1,1)='P'))then begin
       Us:='USER NAME=SISTEMAS';
       Pa:='PASSWORD=DEVELOP';
    end
    else begin
       Us:='USER NAME=SISTEMAS';
       Pa:='PASSWORD=DESARROLLO';
       if(Trim(P)='')or(P='T') then
         P := 'D';
       if Alias = 'HIST' THEN
          P := 'D';  
       IniciaSistema(-1,'AMBIENTE DE PRUEBAS !!!  Iniciando Comunicación con la Base de Datos');
    end;
    Base.Connected:=False;
    Base.Params.Clear;
    Base.Params.Add('SERVER NAME='+P+Alias);
    Base.Params.Add('LANGDRIVER=DBWINWE0');
    Base.Params.Add(Us);
    Base.Params.Add(Pa);
    Base.Connected:=True;
    DBConecta:=True;
  Finally
    IniciaSistema(-1,'Iniciando Comunicación con la Base de Datos');
  end;
end;

Function DBConectaPoD(Base:TDataBase; Alias:String):Boolean;
var
  Us,Pa:String;
  P:String;
begin
  DBConectaPoD:=False;
  IniciaSistema(-1,'Iniciando Comunicación con la Base de Datos');
  Try
  Alias:=UpperCase(Alias);
  P:=ParamStr(1);
  if(Length(Trim(P))>=1)and((P = 'P')or(Copy(P,1,1) = 'P')) then begin
     Us:='USER NAME=SISTEMAS';
     Pa:='PASSWORD=DEVELOP';
  end
  else begin
     if(Trim(P) = '')or(P = 'T')then
       P := 'D';
     IniciaSistema(-1,'AMBIENTE DE PRUEBAS !!!  Iniciando Comunicación con la Base de Datos');
     Us:='USER NAME=SISTEMAS';
     Pa:='PASSWORD=DESARROLLO';
  end;
  Base.Connected:=False;
  Base.Params.Clear;
  Base.Params.Add('SERVER NAME='+P+Alias);
  Base.Params.Add('LANGDRIVER=DBWINWE0');
  Base.Params.Add(Us);
  Base.Params.Add(Pa);
  Base.Connected:=True;
  DBConectaPoD:=True;
  Finally
    IniciaSistema(-1,'Iniciando Comunicación con la Base de Datos');
  end;
end;
}

procedure Register;
begin RegisterComponents('Inter', [TInterApli]);
end;


Procedure TInterApli.SaveConfig(Section,Entry:String; Value:String);
var IniFile:TIniFile;
begin IniFile:=TIniFile.Create('INTER_'+Apli+'.INI');
      Try IniFile.WriteString(Section+'_'+USUARIO,Entry,Value);
      Finally IniFile.Free;
      end;
end;

Function TInterApli.LoadConfig(Section,Entry:String; ValueDef:String):String;
var IniFile:TIniFile;
begin IniFile:=TIniFile.Create('INTER_'+Apli+'.INI');
      Try Result:=IniFile.ReadString(Section+'_'+USUARIO,Entry,ValueDef);
      Finally IniFile.Free;
      end;
end;


Function  TInterApli.IsProd:Boolean;
var P:String;
begin P:=ParamStr(1);
      if P='P'
         then IsProd:=True
         else IsProd:=FalsE;
end;

Function TInterApli.GetAlias(Caso:Integer):String;
begin GetAlias:='';
      Case Caso of
      0:BuscaValor(DataBase,'DATABASE');
      1:BuscaValor(SeguDataBase,'DATABASE');
      2:BuscaValor(ErrorDataBase,'DATABASE');
      end;
end;

Procedure TInterApli.ShowQuest;
var Forma:TWInterQuest;
    STP:TStoredProc;
begin Application.CreateForm(TWInterQuest,Forma);
      Try Forma.Edit1.Text:=UsuarioNombre;
          if Forma.ShowModal=mrOK
          then begin
                   STP:=TStoredProc.Create(Self);
                   Try STP.StoredProcName:='STPINSEBITACORA';
                       Try
                       STP.DataBaseName:=ErrorDataBaseName;
                       STP.SessionName:=ErrorSessionName;
                       STP.Prepare;
                       STP.ParamByName('PCVE_PROCESO').AsString:='COMENTARIO';
                       if Trim(Forma.Edit1.Text)<>''
                       then STP.ParamByName('PCVE_USUAR_MODIF').AsString:=Usuario
                       else STP.ParamByName('PCVE_USUAR_MODIF').AsString:='MACV991';
                       STP.ParamByName('PF_PROCESO').Clear; //AsDateTime:=Now;
                       STP.ParamByName('pH_INICIO').Clear; //AsInteger:=0;
                       STP.ParamByName('pH_FINAL').Clear; //AsInteger:=0;
                       STP.ParamByName('PGPO_BITACORA').AsInteger:=-1;
                       STP.ParamByName('PID_CONTRATO').AsInteger:=0;
                       STP.ParamByName('pID_ERROR_ORACLE').AsInteger:=0;
                       STP.ParamByName('pNUM_HOJAS').AsInteger:=0;
                       STP.ParamByName('pSIT_PROCESO').AsString:='PP';
                       STP.ParamByName('pTX_CIFRAS').AsString:='';
                       STP.ParamByName('pCVE_APLICACION').AsString:=Apli;
                       STP.ParamByName('pCVE_FUNCION').AsString:=LastFuncion;
                       STP.ParamByName('pTX_COMENTARIO').AsString:='Suscribe:'+Forma.Edit1.Text+#13+#10+Forma.Memo1.Text;
                       STP.ParamByName('pTX_SOLUCION').AsString:='';
                       STP.ParamByName('pBCOMMIT').AsString:='V';
                       Try
                           STP.ExecProc;
                       Except
                             On E:Exception do
                                begin ShowMessage('Imposible Enviar su Sugerencia. Por Favor Trate mas Tarde.'+#13+#10+E.Message);
                                end;
                       end;
                       if STP.ParamByName('pCODRESP').AsInteger<>0
                       then begin ShowMessage('Imposible Enviar su Sugerencia. Por Favor Trate mas Tarde.');
                            end;
                     Except On E:Exception do
                            begin ShowMessage('Imposible Enviar su Sugerencia. Por Favor Trate mas Tarde.'+#13+#10+E.Message);
                            end;
                     end;
                   Finally STP.Free;
                   end;
               end;
      Finally Forma.Free;
      end;
end;

Procedure TInterApli.DespuesStart; //(Var Msg:TMessage);
var s:string;
    i:Integer;
begin for i:=4 to ParamCount do
      begin if Pos('RUN@',ParamStr(i))=1
            then begin S:=Copy(ParamStr(i),5,Length(ParamStr(i)));
                       MenuRun(Self,S);
                       S:='CLOSE';
                       MenuRun(Self,S);
                 end;
      end;
      MenuRun(Self,'AFTERSTART');
end;

Function  TInterApli.GetSeguDataBase:TDataBase;
begin if FSeguDataBase=nil
      then GetSeguDataBase:=FDataBase
      else GetSeguDataBase:=FSeguDataBase;
end;

Function  TInterApli.GetErrorDataBase:TDataBase;
begin if (FErrorDataBase=nil)
      then begin if FSeguDataBase=nil
                 then GetErrorDataBase:=FDataBase
                 else GetErrorDataBase:=FSeguDataBase;
           end
      else GetErrorDataBase:=FErrorDataBase;
end;

Function  TInterApli.DameFechaEmpresaDia(Cve_Dia:String):TDateTime;
begin Try
      Fecha.DataBaseName:=SeguDataBaseName;
      Fecha.SessionName:=SeguSessionName;
      Fecha.IdEmpresa:=IdEmpresa;
      DameFechaEmpresaDia:=Fecha.DiaLiquidacionTabla(CVE_Dia);
      Except DameFechaEmpresaDia:=0;
      end;
end;

Function  TInterApli.DameFechaEmpresa:TDateTime;
begin
  DameFechaEmpresa:=DameFechaEmpresaDia('D000');
end;

Procedure TInterApli.SetApli(S:String);
begin
  FApli:=UpperCase(S);
end;

Function BuscaValor(Base:TDataBase; Parametro:String):String;
var i,p,k:Integer; s:String;
begin for i:=0 to Base.Params.Count-1 do
      begin S:=UpperCase(Base.Params.Strings[i]);
            p:=pos(Parametro,S);
            if p>0 then
            begin k:=pos('=',S);
                  if k>p then BuscaValor:=Copy(S,k+1,Length(S));
                  exit;
            end;
      end;
      BuscaValor:='';
end;

Procedure TInterApli.SetDataBase(T:TDataBase);
begin
  FDataBase:=T;
  if T<>Nil then begin
     FDataBaseName:=FDataBase.DataBaseName;
     FSessionName:=FDataBase.SessionName;
     if(FSeguDataBaseName='')then begin
        FSeguDataBaseName:=FDataBase.DataBaseName;
        FSeguSessionName:=FDataBase.SessionName;
     end;
     if(FErrorDataBaseName='')then begin
        FErrorDataBaseName:=FDataBase.DataBaseName;
        FErrorSessionName:=FDataBase.SessionName;
     end;
     FFEcha.DataBaseName:=FSeguDataBaseName;
     FFEcha.SessionName:=FSeguSessionName;
     if FAliasName='' then begin
        FAliasName:=BuscaValor(FDataBase,'SERVER NAME');
     end
     else
        FAliasName:=FDataBase.AliasName;
  end
end;

Procedure TInterApli.SetSeguDataBase(T:TDataBase);
begin
  FSeguDataBase:=T;
  if T<>Nil then begin
     FSeguDataBaseName := FSeguDataBase.DataBaseName;
     FSeguSessionName  := FSeguDataBase.SessionName;
     FFEcha.DataBaseName:=FSeguDataBaseName;
     FFEcha.SessionName:=FSeguSessionName;
  end
end;

Procedure TInterApli.SetErrorDataBase(T:TDataBase);
begin
  FErrorDataBase:=T;
  if T<>Nil then begin
     FErrorDataBaseName := FErrorDataBase.DataBaseName;
     FErrorSessionName  := FErrorDataBase.SessionName;
  end
end;

function TInterApli.GetDataBaseName:String;
begin
  GetDataBaseName:=FDataBaseName;
end;

Procedure TInterapli.InitFechaOracle;
begin
  RunSQL('ALTER SESSION SET NLS_DATE_FORMAT='''+toFecha+'''',SeguDataBaseName,SeguSessionName,True);
end;

Procedure TInterapli.InitUsuarioOracle;
begin RunSQL('BEGIN DBMS_APPLICATION_INFO.SET_CLIENT_INFO('+#39+#30+Apli+#30+FUsuario+#30+IntToStr(FCvePerfil)+#30+FIndicador+#30+IntToStr(FIdEmpresa)+#30+IntToStr(ClasePerfil)+#30+#39+');  END;'
      ,SeguDataBaseName,SeguSessionName,True);
end;

procedure TInterApli.Notification( AComponent : TComponent; Operation : TOperation);
begin
  inherited Notification( AComponent, Operation );
  if ( Operation = opRemove ) and ( AComponent = FDataBase) then FDataBase:= nil;
  if ( Operation = opRemove ) and ( AComponent = FSeguDataBase) then FSeguDataBase:= nil;
  if ( Operation = opRemove ) and ( AComponent = FErrorDataBase) then FErrorDataBase:= nil;
end;

procedure TInterApli.SetFilter(Value : TStrings);
begin
  FFilter.Assign(Value);
end;

constructor TInterApli.Create( AOwner : TComponent );
begin
  inherited Create( AOwner );
  FSeguDataBase:=nil;
  FSeguDataBaseName:='';
  FSeguSessionName:='';
  FErrorDataBase:=nil;
  FErrorDataBaseName:='';
  FErrorSessionName:='';
  FSessionName:='';
  FIma:=Nil;
  FImagen:=TPicture.Create;
  Version:='Version 2.0';
  VersionFecha:='Febrero 2004';
  VersionEmpresa:='Interacciones Casa de Bolsa S.A  de C.V';
  VersionInfo:='Sistema General';
  VersionImagen:='';
  VersionLogo:='';
  Apli:='';
  Active:=False;
  Q1:=Nil;
  Q2:=Nil;
  Q3:=Nil;
  MainForm:=Nil;
  StatusBar:=Nil;
  Scroll:=nil;
  Application.OnException:=ErrorGeneral;
  ShortDateFormat:='dd/mm/yyyy';
  Timer:=TTimer.Create(Self);
  Timer.Interval:=10000;
  Timer.Enabled:=False;
  Timer.OnTimer:=OnTimer;
  FFecha:=TFecha.Create(Self);
  ClasePerfil:=-1;
  FFilter:=TStringList.Create;
  Filtered:=False;
  CtoHeader:=nil;
  FavoritoDefH:=100;
  FTreePanel:=nil;
  ShowMenus:=True;
  FNotificador:=TInterNotificador.Create;
  LastFechaHora :=0;
  CaptionIndicador:='Indicador';
  CaptionSelPerfil:='Seleccionar Perfil de Acceso';
end;

destructor TInterApli.Destroy;
begin
  if FNotificador<>nil then FNotificador.Free; FNotificador:=nil;
  if FFilter<>nil then FFilter.Free; FFilter:=nil;
  if FFEcha<>nil then FFecha.Free; FFEcha:=nil;
  if FImagen<>nil then FImagen.Free; FImagen:=nil;
  if Timer<>nil then Timer.Free; Timer:=nil;
  if Q1<>Nil then Q1.Free; Q1:=nil;
  if Q2<>Nil then Q2.Free; Q2:=nil;
  if Q3<>Nil then Q3.Free; Q3:=nil;
  inherited Destroy;
end;

Procedure TInterApli.OpenDB;
var
  fi : Integer;
  fS : String;
begin
  if Q1=Nil then
     Q1:=TQuery.Create(Nil) else Q1.Close;
  Q1.DataBaseName:=SeguDataBaseName;
  Q1.SessionName:=SeguSessionName;
  Q1.SQL.Clear;

  Q1.SQL.ADD('SELECT SECU_MENU_GPO_FUN.NUM_POSICION AS FUN, ');
  Q1.SQL.ADD(' SECU_MENU_GPO_FUN.ID_GPO_MENU AS ID_GPO, ');
  Q1.SQL.ADD(' SECU_MENU_GPO_FUN.B_BLOQUEADO AS  B_GPO, ');
  Q1.SQL.ADD(' SECU_MENU_GPO_FUN.CVE_FUNCION, ');

  Q1.SQL.ADD(' SECU_FUNCION.CVE_FUNCION AS ID_FUN, ');
  Q1.SQL.ADD(' SECU_FUNCION.NOM_FUNCION, ');
  Q1.SQL.ADD(' SECU_FUNCION.TX_DESC_FUNCION, ');
  Q1.SQL.ADD(' SECU_FUNCION.B_BLOQUEADO AS B_CVEFUN, ');

  Q1.SQL.ADD(' SECU_MENU_GPO.TX_DESC_GPO_MENU, ');
  Q1.SQL.ADD(' SECU_MENU_GPO.NUM_POSICION AS GPO, ');
  Q1.SQL.ADD(' SECU_MENU_GPO_FUN.CVE_FUNCION, ');
  Q1.SQL.ADD(' SECU_MENU_GPO.B_BLOQUEADO AS B_FUN, ');

  Q1.SQL.ADD(' SECU_MENU.CVE_MENU, ');
  Q1.SQL.ADD(' SECU_MENU.TX_DESC_MENU, ');
  Q1.SQL.ADD(' SECU_MENU.B_BLOQUEADO AS B_MENU, ');
  Q1.SQL.ADD(' SECU_MENU.NOM_MENU, ');
  Q1.SQL.ADD(' SECU_MENU.NUM_POSICION AS MENU ');

  //AGREGADOS aDICIONALES
  Q1.SQL.ADD('FROM SECU_MENU_GPO_FUN, ');
  Q1.SQL.ADD('SECU_MENU_GPO, ');
  Q1.SQL.ADD('SECU_MENU, ');
  if Filtered then begin
     Q1.SQL.ADD('SECU_FUNC_FILTRO, ');
  end;

  Q1.SQL.ADD('SECU_FUNCION,SECU_FUN_AUT_GPO ');
  Q1.SQL.ADD('WHERE (SECU_MENU_GPO_FUN.CVE_APLICACION='+#39+Apli+#39+') AND ');
  if Filtered then begin
     Q1.SQL.ADD(' (SECU_MENU_GPO_FUN.CVE_FUNCION=SECU_FUNC_FILTRO.CVE_FUNCION ) AND ');
     Q1.SQL.ADD(' (SECU_MENU_GPO_FUN.CVE_APLICACION=SECU_FUNC_FILTRO.CVE_APLICACION ) AND ');
     fs:='';
     for fi:=0 to FFilter.Count-1 do begin
         if FFilter[fi]<>'' then begin
            if fs<>'' then
               fs:=fs+' OR (SECU_FUNC_FILTRO.CVE_FILTRO='''+FFilter[fi]+''')'
            else
               fs:='(SECU_FUNC_FILTRO.CVE_FILTRO='''+FFilter[fi]+''')';
            end;
     end;
     if fs<>'' then begin
        fs:=' ('+fs+') AND ';
        Q1.SQL.ADD(fs);
     end;
  end;

  Q1.SQL.ADD('(SECU_MENU_GPO.CVE_APLICACION=SECU_MENU_GPO_FUN.CVE_APLICACION) AND ');
  Q1.SQL.ADD('(SECU_MENU_GPO.CVE_MENU=SECU_MENU_GPO_FUN.CVE_MENU) AND ');
  Q1.SQL.ADD('(SECU_MENU_GPO.ID_GPO_MENU=SECU_MENU_GPO_FUN.ID_GPO_MENU) AND ');

  Q1.SQL.ADD('(SECU_MENU.CVE_APLICACION=SECU_MENU_GPO_FUN.CVE_APLICACION) AND ');
  Q1.SQL.ADD('(SECU_MENU.CVE_MENU=SECU_MENU_GPO_FUN.CVE_MENU) AND ');
  Q1.SQL.ADD('(SECU_FUNCION.CVE_FUNCION=SECU_MENU_GPO_FUN.CVE_FUNCION)AND  ');

  //Agegados Adicionales para Verificar o Quitar Accesos.
  Q1.SQL.ADD('(SECU_FUN_AUT_GPO.CVE_APLICACION=SECU_MENU_GPO_FUN.CVE_APLICACION) AND ');
  Q1.SQL.ADD('(SECU_FUN_AUT_GPO.ID_GPO_ACCESO='+IntToStr(CvePerfil)+') AND ');
  Q1.SQL.ADD('(SECU_FUN_AUT_GPO.CVE_FUNCION=SECU_FUNCION.CVE_FUNCION) AND ');
  Q1.SQL.ADD('(SECU_FUN_AUT_GPO.B_BLOQUEADO=''F'') AND ' );
  Q1.SQL.ADD('(SECU_FUN_AUT_GPO.B_ACC_CONS=''V'') AND ');
  Q1.SQL.ADD('(SECU_MENU.B_BLOQUEADO=''F'') AND ');
  Q1.SQL.ADD('(SECU_MENU_GPO.B_BLOQUEADO=''F'') AND ');
  Q1.SQL.ADD('(SECU_MENU_GPO_FUN.B_BLOQUEADO=''F'') ');
  Q1.SQL.ADD('ORDER BY MENU,GPO,ID_GPO,FUN,ID_FUN ');
  Q1.Open;
end;

Procedure TInterApli.OpenFavorito;
var fi:Integer;
    fs:String;
begin if Q3=Nil then Q3:=TQuery.Create(Nil) else Q3.Close;
      Q3.DataBaseName:=SeguDataBaseName;
      Q3.SessionName:=SeguSessionName;
      Q3.SQL.Clear;

      Q3.SQL.ADD(' SELECT  ');

      Q3.SQL.ADD(' SECU_FUNCION.CVE_FUNCION,');
      Q3.SQL.ADD(' SECU_FUNCION.NOM_FUNCION, ');
      Q3.SQL.ADD(' SECU_FUNCION.TX_DESC_FUNCION ');

      Q3.SQL.ADD('FROM  ');
      Q3.SQL.ADD('SECU_FUNCION, ');
      if Filtered then
      begin Q3.SQL.ADD('SECU_FUNC_FILTRO, ');
      end;
      Q3.SQL.ADD('SECU_USR_DEF  ');
      Q3.SQL.ADD('WHERE (SECU_USR_DEF.CVE_APLICACION='+#39+Apli+#39+') ');
      Q3.SQL.ADD(' and (SECU_USR_DEF.ID_EMPRESA='+IntToStr(IDEMPRESA)+')');
      Q3.SQL.ADD(' and (SECU_USR_DEF.CVE_USUARIO='+#39+usuario+#39+') ');
      Q3.SQL.ADD(' and (SECU_USR_DEF.CVE_IND_ADIC='+#39+Indicador+#39+') ');
      Q3.SQL.ADD(' and (SECU_USR_DEF.ID_GPO_ACCESO='+IntToStr(cvePerfil)+') ');
      Q3.SQL.ADD('and (SECU_FUNCION.CVE_FUNCION=SECU_USR_DEF.CVE_FUNCION) ');

      if Filtered then
      begin Q3.SQL.ADD('AND (SECU_USR_DEF.CVE_FUNCION=SECU_FUNC_FILTRO.CVE_FUNCION ) ');
            Q3.SQL.ADD('AND (SECU_USR_DEF.CVE_APLICACION=SECU_FUNC_FILTRO.CVE_APLICACION ) ');
            fs:='';
            for fi:=0 to FFilter.Count-1 do
            begin if FFilter[fi]<>'' then
                  begin if fs<>''
                        then fs:=fs+' OR (SECU_FUNC_FILTRO.CVE_FILTRO='''+FFilter[fi]+''')'
                        else fs:='(SECU_FUNC_FILTRO.CVE_FILTRO='''+FFilter[fi]+''')';
                  end;
            end;
            if fs<>'' then begin fs:=' AND ('+fs+') ';
                                 Q3.SQL.ADD(fs);
                           end;
      end;
      Q3.SQL.ADD('ORDER BY NOM_FUNCION');

      Q3.Open;
end;

Procedure TInterApli.CreaMenus;
var Menu:TMainMenu;
    MenuPadre:TMenuItem;
    MenuHijo:TMenuItem;
    AcMenu:string;
    NomMenuPadre:String;
    PrimeraVez:Boolean;
    Posi:Integer;
    Tn:TTreeNode;
    NodoSel:TTreeNode;
    NodoFun:TNodoFun;
    Gpo:string;

Procedure CargaPrimerMenu;
begin if (MenuPadre=nil) then
      begin MenuPadre:=TMenuItem.Create(MainForm);
            MenuPadre.Caption:='Aplicación';
            NomMenuPadre:='Aplicación';
            MenuPadre.Hint:='Aplicación';
            Menu.Items.Add(MenuPadre);
            AcMenu:='Aplicación';
      end;

      if (AcMenu<>'')and(PrimeraVez)and(MenuPadre<>nil) then
         begin if Posi<>0 then
                              begin MenuHijo:=TMenuItem.Create(MainForm);
                                    MenuHijo.Caption:='-';
                                    MenuHijo.Hint:='';
                                    MenuPadre.Add(MenuHijo);
                              end;

                              MenuHijo:=TMenuItem.Create(MainForm);
                              MenuHijo.Caption:='Enviar Sugerencias al Administrador de Sistemas.';
                              MenuHijo.Hint:='QUEST';
                              MenuHijo.OnClick:=MenuClick;
                              MenuPadre.Add(MenuHijo);

                              MenuHijo:=TMenuItem.Create(MainForm);
                              MenuHijo.Caption:='-';
                              MenuHijo.Hint:='';
                              MenuHijo.OnClick:=MenuClick;
                              MenuPadre.Add(MenuHijo);

                              MenuHijo:=TMenuItem.Create(MainForm);
                              MenuHijo.Caption:='Configurar Impresora';
                              MenuHijo.Hint:='PRINT_SETUP';
                              MenuHijo.OnClick:=MenuClick;
                              MenuPadre.Add(MenuHijo);

                              MenuHijo:=TMenuItem.Create(MainForm);
                              MenuHijo.Caption:='-';
                              MenuHijo.Hint:='';
                              MenuHijo.OnClick:=MenuClick;
                              MenuPadre.Add(MenuHijo);

                              MenuHijo:=TMenuItem.Create(MainForm);
                              MenuHijo.Caption:='Reiniciar con otro Usuario/Perfil';
                              MenuHijo.Hint:='START';
                              MenuHijo.OnClick:=MenuClick;
                              MenuPadre.Add(MenuHijo);

                              MenuHijo:=TMenuItem.Create(MainForm);
                              MenuHijo.Caption:='-';
                              MenuHijo.Hint:='';
                              MenuPadre.Add(MenuHijo);

                              MenuHijo:=TMenuItem.Create(MainForm);
                              MenuHijo.Caption:='Salir del Sistema';
                              MenuHijo.Hint:='CLOSE';
                              MenuHijo.OnClick:=MenuClick;
                              MenuPadre.Add(MenuHijo);

         end;
end;

begin Menu:=TMainMenu.Create(MainForm);
      Try
      AcMenu:='';
      Posi:=0;
      NomMenuPadre:='';
      PrimeraVez:=True;
      MenuPadre:=Nil;
      NodoSel:=Nil;
      TreeFuncion.OnChange:=nil;
      TreeMenu.OnChange:=nil;

      TreeMenu.Items.Clear;
      TreeFuncion.Items.Clear;
      TreeFavorito.Items.Clear;

      Try

      if Q1=nil then exit;
      Q1.First;
      if Not Q1.EOF then Gpo:=Q1.FieldByName('ID_GPO').AsString else Gpo:='';
      While Not Q1.EOF do
      begin if AcMenu<>Q1.FieldByName('CVE_MENU').AsString then
               begin CargaPrimerMenu;

                     MenuPadre:=TMenuItem.Create(MainForm);
                     MenuPadre.Caption:=Q1.FieldByName('NOM_MENU').AsString;
                     NomMenuPadre:=MenuPadre.Caption;
                     MenuPadre.Hint:=Q1.FieldByName('CVE_MENU').AsString;
                     Menu.Items.Add(MenuPadre);

                     NodoFun:=TnodoFun.Create;
                     NodoFun.Clave:=Q1.FieldByName('CVE_MENU').AsString;
                     NodoFun.Nombre:=Q1.FieldByName('NOM_MENU').AsString;
                     NodoFun.Desc:=Q1.FieldByName('TX_DESC_MENU').AsString;

                     Gpo:=Q1.FieldByName('ID_GPO').AsString;

                     Tn:=TreeMenu.Items.AddChildObject(Nil,NodoFun.Desc, NodoFun);
                     if NodoSel=Nil then NodoSel:=Tn;


                     if AcMenu<>'' then PrimeraVez:=False;
                     AcMenu:=MenuPadre.Hint;
                     Posi:=0;
               end;
            if MenuPadre<>nil then
               begin if Gpo<>Q1.FieldByName('ID_GPO').AsString
                        then begin MenuHijo:=TMenuItem.Create(MainForm);
                                   MenuHijo.Caption:='-';
                                   MenuHijo.Hint:='';
                                   MenuPadre.Add(MenuHijo);
                             end;
                     Gpo:=Q1.FieldByName('ID_GPO').AsString;
                     MenuHijo:=TMenuItem.Create(MainForm);
                     MenuHijo.Caption:=Q1.FieldByName('NOM_FUNCION').AsString;
                     MenuHijo.Hint:=Q1.FieldByName('CVE_MENU').AsString+'|'+Q1.FieldByName('CVE_FUNCION').AsString;
                     MenuHijo.OnClick:=MenuClick;
                     MenuPadre.Add(MenuHijo);
                     Inc(Posi);
               end;
         Q1.Next;
      end;
      CargaPrimerMenu;
         begin if (NomMenuPadre<>'Ayuda')and(MenuPadre<>nil) then
               begin MenuPadre:=TMenuItem.Create(MainForm);
                     MenuPadre.Caption:='Ayuda';
                     MenuPadre.Hint:='';
                     Menu.Items.Add(MenuPadre);
               end;

               MenuHijo:=TMenuItem.Create(MainForm);
               MenuHijo.Caption:='Acerca de ..';
               MenuHijo.Hint:='ABOUT';
               MenuHijo.OnClick:=MenuClick;
               MenuPadre.Add(MenuHijo);

         end;
      Finally TreeFuncion.OnChange:=FuncionChange;
              TreeMenu.OnChange:=MenuChange;
              if NodoSel<>Nil then TreeMenu.Selected:=NodoSel;
      end;

      Finally MainForm.Menu:=Menu;
      end;
end;

Procedure TInterApli.CreaItems;
var AcMenu:string;
    NomMenuPadre:String;
    Tn:TTreeNode;
    NodoSel:TTreeNode;
    NodoFun:TNodoFun;
    Gpo:string;

begin AcMenu:='';
      NomMenuPadre:='';
      NodoSel:=Nil;
      TreeFuncion.OnChange:=nil;
      TreeMenu.OnChange:=nil;
      Try
      TreeMenu.Items.Clear;
      TreeFuncion.Items.Clear;
      TreeFavorito.Items.Clear;
      if Q1=nil then exit;
      Q1.First;
      if Not Q1.EOF then Gpo:=Q1.FieldByName('ID_GPO').AsString else Gpo:='';
      While Not Q1.EOF do
      begin if AcMenu<>Q1.FieldByName('CVE_MENU').AsString then
               begin NodoFun:=TnodoFun.Create;
                     NodoFun.Clave:=Q1.FieldByName('CVE_MENU').AsString;
                     NodoFun.Nombre:=Q1.FieldByName('NOM_MENU').AsString;
                     NodoFun.Desc:=Q1.FieldByName('TX_DESC_MENU').AsString;
                     Gpo:=Q1.FieldByName('ID_GPO').AsString;
                     Tn:=TreeMenu.Items.AddChildObject(Nil,NodoFun.Desc, NodoFun);
                     if NodoSel=Nil then NodoSel:=Tn;
                     AcMenu:=Q1.FieldByName('CVE_MENU').AsString;
               end;
         Q1.Next;
      end;

      Finally TreeFuncion.OnChange:=FuncionChange;
              TreeMenu.OnChange:=MenuChange;
              if NodoSel<>Nil then TreeMenu.Selected:=NodoSel;
      end;
end;

Procedure TInterApli.ReLogOn;
begin
  MenuRun(nil,'ENDAPLI');
  LogOn;
  CreaMenus;
  CargaFavorito;
  if TreeFuncion.Focused then TreeFuncion.SetFocus;
  ActivaApli(nil);
  OnTimer(nil);
  ShowWelcome;
  MenuRun(nil,'STARTAPLI');
  OnTimer(nil);
end;

Procedure TInterApli.CargaImagen(IEmpresa:LongInt);
var T:TQuery;
    Ima:TDBImage;
    ds:TDataSource;
begin T:=GetSQLQuery('SELECT IM_LOGO_EMPRESA FROM EMPRESA WHERE ID_EMPRESA='+IntToStr(IEmpresa),
                     SeguDataBaseName,SeguSessionName,False);
      if T<>nil then
      begin ds:=TDataSource.Create(self);
            Ima:=TDBImage.Create(self);
         Try
            ds.DataSet:=T;
            Ima:=TDBImage.Create(self);
            Ima.DataField:='IM_LOGO_EMPRESA';
            Ima.DataSource:=ds;
            FImagen.Assign(Ima.Picture);
            if FIma<>nil then FIma.Picture.Assign(Ima.Picture);
         Finally
            Ima.Free;
            ds.Free;
            T.Free;
         end;
      end;
end;

Procedure TInterApli.LogOn;
var sUsuario,sPassword,sNomUsuario:String;
    sUsuarioID:LongInt;
    ePerfil,eID_Empresa:Integer;
    eNomIndicAdd,S,eIndicAdd,eNom_Perfil:String;
    QSec:TQuery;

begin if MainForm=nil then begin PostMessage(MainForm.Handle,WM_CLOSE,0,0); Exit; Active:=False; end;
      //Determina el Usuario que Accesa.
      if Not ExecutefoPass(sUsuario,sPassword,sNomUsuario, sUsuarioID,SeguDataBaseName,SeguSessionName,Self) then begin
         PostMessage(MainForm.Handle,WM_CLOSE,0,0);
         Active:=False;
         Exit;
       end;
      //Determina el Perfil para el Usuario.
       if Not ExecutefoSPerfilEx( sUsuario,  Apli,
                               ePerfil ,  eID_Empresa,
                               eIndicAdd, eNom_Perfil,
                               eNomIndicAdd,
                               SeguDataBaseName
                               ,SeguSessionName
                               ,CaptionIndicador
                               ,CaptionSelPerfil
                               )
        then begin InterMsg(tmMal,'',0,'Usted no tiene acceso a este Sistema.');
                   PostMessage(MainForm.Handle,WM_CLOSE,0,0);
                   Active:=False;
                   Exit;
             end;
      ClasePerfil:=-1;
      QSec:=GetSqlQuery('SELECT ID_GPO_ACCESO FROM SECU_USR_APL_GPO WHERE '+
                      '(CVE_APLICACION=''CLASE'') AND (CVE_USUARIO='''+sUsuario+''') AND '+
                      '(ID_EMPRESA='+IntToStr(eID_EMPRESA)+') AND (CVE_IND_ADIC='''+eIndicAdd+''')',
                      SeguDataBaseName,SeguSessionName,False);

      if QSec<>nil then
      begin ClasePerfil:=QSec.FieldByName('ID_GPO_ACCESO').AsInteger;
            QSec.Free;
      end;
      FUsuarioNombre:=sNomUsuario;
      FUsuarioID:=sUsuarioID;
      FUsuario:=sUsuario;
      FNomPerfil:=eNom_Perfil;
      FCvePerfil:=ePerfil;
      FIndicador:=eIndicAdd;
      FIdEmpresa:=eID_Empresa;
      FNomIndicador:=eNomIndicAdd;
      LabelPerfilIndicador.Caption:=' ['+BonitoStr(NomPerfil)+'] '+BonitoStr(NomIndicador)+'    [Usuario]  '+BonitoStr(FUsuarioNombre);
      CargaImagen(eID_Empresa);
      Active:=True;
      OpenDB;
      GetSQLStr('SELECT TX_WELCOME FROM SECU_APLICACION WHERE RTRIM(CVE_APLICACION)='+#39+APLI+#39,
      SeguDataBaseName,SeguSessionName,'TX_WELCOME',S,False);
      Welcome:=S;
      InitUsuarioOracle;
end;

Procedure TInterApli.LogOnAuto(sUsuario,sPassword,sNomUsuario:String; sUsuarioID:Integer;
                               ePerfil , eClasePerfil, eID_Empresa :Integer;
                               eIndicAdd, eNom_Perfil,eNomIndicAdd:String);

Var QSec:TQuery;
    S:String;
begin if MainForm=nil then begin PostMessage(MainForm.Handle,WM_CLOSE,0,0); Exit; Active:=False; end;
      MenuRun(nil,'ENDAPLI');
      ClasePerfil:=eClasePerfil;
      FUsuarioNombre:=sNomUsuario;
      FUsuarioID:=sUsuarioID;
      FUsuario:=sUsuario;
      FNomPerfil:=eNom_Perfil;
      FCvePerfil:=ePerfil;
      FIndicador:=eIndicAdd;
      FIdEmpresa:=eID_Empresa;
      FNomIndicador:=eNomIndicAdd;
      LabelPerfilIndicador.Caption:=' ['+BonitoStr(NomPerfil)+'] '+BonitoStr(NomIndicador)+'    [Usuario]  '+BonitoStr(FUsuarioNombre);
      CargaImagen(eID_Empresa);
      Active:=True;
      OpenDB;
      GetSQLStr('SELECT TX_WELCOME FROM SECU_APLICACION WHERE RTRIM(CVE_APLICACION)='+#39+APLI+#39,
      SeguDataBaseName,SeguSessionName,'TX_WELCOME',S,False);
      Welcome:=S;
      InitUsuarioOracle;

      CreaMenus;
      CargaFavorito;
      if TreeFuncion.Focused then TreeFuncion.SetFocus;
      ActivaApli(nil);
      OnTimer(nil);
      ShowWelcome;
      MenuRun(nil,'STARTAPLI');
      OnTimer(nil);
end;

Procedure TInterApli.StartSinMenu(eUsuario:String; eEmpresa,ePerfil,eClasePerfil:Integer; eIndicador:String);
begin if Usuario='' then FUsuario:=ObtenUsuario;
      FCvePerfil:=ePerfil;
      FIndicador:=eIndicador;
      FIdEmpresa:=eEmpresa;
      ClasePerfil:=eClasePerfil;
      Active:=True;
end;


Procedure TInterApli.CallApli(NombreAplicacion:String; eApli:TInterApli);
var s:string;
begin Apli:=NombreAplicacion;
      FUsuario:=eApli.FUsuario;
      FNomPerfil:=eApli.FNomPerfil;
      FCvePerfil:=eApli.FCvePerfil;
      FIndicador:=eApli.FIndicador;
      FIdEmpresa:=eApli.FIdEmpresa;
      Active:=eApli.Active;
      NomAplicacion:=S;
      if Apli='' then
      begin TreeFuncion.Items.Clear;
            TreeMenu.Items.Clear;
            TreeFavorito.Items.Clear;
            exit;
      end;
      OpenDB;
      GetSQLStr('SELECT TX_WELCOME FROM SECU_APLICACION WHERE RTRIM(CVE_APLICACION)='+#39+APLI+#39,
      SeguDataBaseName,SeguSessionName,'TX_WELCOME',S,False);
      Welcome:=S;
      S:='';
      GetSQLStr('SELECT NOM_APLICACION FROM SECU_APLICACION WHERE RTRIM(CVE_APLICACION)='+#39+APLI+#39,
                SeguDataBaseName,SeguSessionName,'NOM_APLICACION',S,False);
      if S='' then S:='Imposible Localizar la Aplicación'+Apli;
      Application.Title:=S;
      CreaItems;
      if TreeFuncion.Focused then TreeFuncion.SetFocus;
      ActivaApli(nil);
      ShowWelcome;
      MenuRun(nil,'STARTAPLI');
      OnTimer(nil);
end;


Procedure TInterApli.ApplyFilter;
begin Active:=True;
      OpenDB;
      CreaMenus;
      CargaFavorito;
      if TreeFuncion.Focused then TreeFuncion.SetFocus;
      TreeMenu.Refresh;
      TreeFuncion.Refresh;
      TreeFavorito.Refresh;
end;

Procedure TInterApli.CreateFormObjects(Form:TForm);
var PP,P3,P2,P1:TPanel;
    Boton1:TBitBtn;
    StP:TStatusPanel;
    Im:TImageList;
    spl:TSplitter;
    BmpH:THandle;
    Bmp:TBitMap;
    Ima:TImage;
begin if Form=Nil then
         begin InterMsg(tmMal,'',0,'Debe Asignar una Forma a la Aplicación');
               exit;
         end;
      MainForm:=Form;
      MainForm.OnActivate:=ActivaApli;
      NomAplicacion:='';
      MainForm.KeyPreview:=True;
      MainForm.OnKeyPress:=FormaKeyPress;
    //StatusBar
    StatusBar:=TStatusBar.Create(MainForm);
    StatusBar.Parent:=MainForm;
    StatusBar.ShowHint:=True;
    StatusBar.SetBounds(0,1100,100,19);
    Stp:=StatusBar.Panels.Add;
    Stp.WidTh:=70;
    Stp.Alignment:=taCenter;
    stp.Text:='MMMMMMM';
    Stp:=StatusBar.Panels.Add;
    Stp.WidTh:=110;
    Stp.Alignment:=taCenter;
    stp.Text:='01/12/1997 10:50';
    Stp:=StatusBar.Panels.Add;
    Stp.WidTh:=60;
    Stp.Alignment:=taCenter;
    stp.Text:='<ALIAS>';
    Stp:=StatusBar.Panels.Add;
    Stp.WidTh:=50;
    stp.Text:='<ESTADO>';
    Stp.Alignment:=taCenter;
    Stp:=StatusBar.Panels.Add;
    Stp.WidTh:=100;
    Stp.Alignment:=taLeftJustify;
    stp.Text:='<AYUDA>';
    //Panel de Tool Bar.
    PanelTools:=Tpanel.Create(MainForm);
    PanelTools.Parent:=MainForm;
    PanelTools.Align:=alBottom;
    PanelTools.SetBounds(0,MainForm.ClientHeight-25,100,24);
    PanelTools.Caption:='';

    P1:=Tpanel.Create(MainForm);
    P1.Parent:=PanelTools;
    P1.BevelOuter:=bvNone;
    P1.BevelInner:=bvNone;
    P1.Align:=alRight;
    P1.SetBounds(0,0,84*2,24);
    P1.Caption:='';


    LabelPerfilIndicador:=TPanel.Create(MainForm);
    LabelPerfilIndicador.Parent:=PanelTools;
    LabelPerfilIndicador.BevelOuter:=bvNone;
    LabelPerfilIndicador.BevelInner:=bvNone;
    LabelPerfilIndicador.Align:=alClient;
    LabelPerfilIndicador.AlignMent :=taLeftJustify;
    LabelPerfilIndicador.SetBounds(0,0,350,16);
    LabelPerfilIndicador.Caption:=' ['+BonitoStr(NomPerfil)+'] '+BonitoStr(NomIndicador)+'    [Usuario]  '+BonitoStr(FUsuarioNombre);


    Boton1:=TBitBtn.Create(MainForm);
    Boton1.Parent:=P1;
    Boton1.SetBounds(2,2,80,20);
    Boton1.Caption:='Sugerir';
    Boton1.OnClick:=MenuSugiere;
    Boton1.ShowHint:=True;
    Boton1.Hint:='Enviar Sugerencias al Administrador de Sistemas.';
    CargaImg(Boton1,tsbSugerencias);


    Boton1:=TBitBtn.Create(MainForm);
    Boton1.Parent:=P1;
    Boton1.SetBounds(84,2,80,20);
    Boton1.Caption:='Salir';
    Boton1.OnClick:=MenuClose;
    CargaImg(Boton1,tsbSalir);


    PanelImagen:=Tpanel.Create(MainForm);
    PanelImagen.Parent:=MainForm;
    PanelImagen.Align:=alTop;
    PanelImagen.BevelOuter:=bvNone;
    PanelImagen.BevelInner:=bvRaised;
    PanelImagen.SetBounds(0,0,100,64);
    PanelImagen.Caption:='';
    PanelImagen.Visible:=False;

    PP:=Tpanel.Create(MainForm);
    PP.Parent:=PanelImagen;
    PP.Align:=alLeft;
    PP.BevelOuter:=bvNone;
    PP.BevelInner:=bvNone;
    PP.SetBounds(0,0,190+4,64);
    PP.Caption:='';

    FIma:=TImage.Create(MainForm);
    FIma.Parent:=PP; //PanelImagen;
    FIma.Align:=alNone;
    FIma.SetBounds(2,2,190,60);
    if FIma<>nil then FIma.Picture.Assign(FImagen);

    P1:=Tpanel.Create(MainForm);
    P1.Parent:=PanelImagen;
    P1.BevelOuter:=bvNone;
    P1.BevelInner:=bvNone;
    P1.Align:=alRight;
    P1.SetBounds(0,0,204,60);
    P1.Caption:='';

    Scroll:=TScrollBox.Create(MainForm);
    Scroll.Parent:=P1;
    Scroll.Color:=clAmarillito;
    Scroll.SetBounds(2,2,200,60);
    Scroll.AutoScroll:=True;

    LabelWelcome:=TLabel.Create(MainForm);
    LabelWelcome.Parent:=Scroll;
    LabelWelcome.SetBounds(2,2,200-18,60);
    LabelWelcome.Caption:='Bienvenido!!!';
    LabelWelcome.WordWrap:=True;
    LabelWelcome.AutoSize:=True;

    P1:=Tpanel.Create(MainForm);
    P1.Parent:=MainForm;
    P1.Align:=alLeft;
    P1.Caption:='';
    P1.BevelOuter:=bvNone;
    P1.SetBounds(0,0,200,16);
    if ShowMenus=False then P1.Visible:=False;

        PanelMenu:=Tpanel.Create(MainForm);
        PanelMenu.Parent:=P1;
        PanelMenu.Align:=alTop;
        PanelMenu.Caption:='Menu';
        PanelMenu.BevelOuter:=bvNone;
        PanelMenu.BevelInner:=bvLowered;
        PanelMenu.SetBounds(0,0,200,16);


        Im:=TImageList.Create(MainForm);

        BMPH:=LoadBitmap(HInstance,'FLECHAROJA');
        BMP:=TBitMap.Create;
        BMP.Handle:=BMPH;
        Im.Add(BMP,Nil);

        BMPH:=LoadBitmap(HInstance,'FLECHAAZUL');
        BMP:=TBitMap.Create;
        BMP.Handle:=BMPH;
        Im.Add(BMP,Nil);

        BMPH:=LoadBitmap(HInstance,'SEPARADOR');
        BMP:=TBitMap.Create;
        BMP.Handle:=BMPH;
        Im.Add(BMP,Nil);



        TreeMenu:=TTreeView.Create(MainForm);
        TreeMenu.Parent:=P1;
        TreeMenu.Align:=alClient;
        TreeMenu.SetBounds(0,0,200,16);
        TreeMenu.Images:=Im;
        TreeMenu.ShowRoot:=False;
        TreeMenu.ShowLines:=False;
        TreeMenu.HideSelection:=False;
        TreeMenu.ReadOnly:=True;

    spl:=TSplitter.Create(MainForm);
    spl.Parent:=MainForm;
    spl.Align:=alLeft;
    spl.SetBounds(210,0,4,4);
    if ShowMenus=False then spl.Visible:=False;

    P1:=Tpanel.Create(MainForm);
    P1.Parent:=MainForm;
    P1.Align:=alClient;
    P1.Caption:='';
    P1.BevelOuter:=bvNone;
    P1.SetBounds(0,0,200,16);
    if ShowMenus=False then P1.Visible:=False;

        P2:=Tpanel.Create(MainForm);
        P2.Parent:=P1;
        P2.Align:=alBottom;
        P2.Caption:='';
        P2.BevelOuter:=bvNone;
        P2.SetBounds(0,200,200,FavoritoDefH);

        spl:=TSplitter.Create(MainForm);
        spl.Parent:=P1;
        spl.Align:=alBottom;
        spl.Cursor:=crVSplit;
        spl.SetBounds(0,150,4,4);

        P3:=Tpanel.Create(MainForm);
        P3.Parent:=P1;
        P3.Align:=alClient;
        P3.Caption:='';
        P3.BevelOuter:=bvNone;
        P3.SetBounds(0,0,100,100);

        PanelFuncion:=Tpanel.Create(MainForm);
        PanelFuncion.Parent:=P3;
        PanelFuncion.Align:=alTop;
        PanelFuncion.BevelInner:=bvLowered;
        PanelFuncion.BevelOuter:=bvNone;
        PanelFuncion.Caption:='Funciones';
        PanelFuncion.SetBounds(0,0,200,16);

        TreeFuncion:=TTreeView.Create(MainForm);
        TreeFuncion.Parent:=P3;
        TreeFuncion.Align:=alClient;
        TreeFuncion.SetBounds(0,0,200,16);
        TreeFuncion.Images:=Im;
        TreeFuncion.ShowRoot:=False;
        TreeFuncion.ShowLines:=False;
        TreeFuncion.HideSelection:=False;
        TreeFuncion.ReadOnly:=True;
        Treefuncion.DragMode:=dmAutomatic;
        Treefuncion.OnDragOver:=FuncionDragOver;
        Treefuncion.OnDragDrop:=FuncionDragDrop;

        PanelFavorito:=Tpanel.Create(MainForm);
        PanelFavorito.Parent:=P2;
        PanelFavorito.Align:=alTop;
        PanelFavorito.BevelOuter:=bvNone;
        PanelFavorito.BevelInner:=bvLowered;
        PanelFavorito.Caption:='Acceso Rápido/Preferencias';
        PanelFavorito.SetBounds(0,0,200,16);

        TreeFavorito:=TTreeView.Create(MainForm);
        TreeFavorito.Parent:=P2;
        TreeFavorito.Align:=alClient;
        TreeFavorito.SetBounds(0,0,200,16);
        TreeFavorito.Images:=Im;
        TreeFavorito.ShowRoot:=False;
        TreeFavorito.ShowLines:=False;
        TreeFavorito.HideSelection:=False;
        TreeFavorito.ReadOnly:=True;
        TreeFavorito.DragMode:=dmAutomatic;
        TreeFavorito.OnDragOver:=FavoritoDragOver;
        TreeFavorito.OnDragDrop:=FavoritoDragDrop;

    CreaMenus;
    TreeMenu.OnChange:=MenuChange;
    TreeFuncion.OnChange:=FuncionChange;
    TreeFuncion.OnDblClick:=FuncionDblClick;
    TreeFavorito.OnDblClick:=FavoritoDblClick;

    TreeMenu.Parent.TabOrder:=0;
    TreeFuncion.Parent.Parent.TabOrder:=1;
    Boton1.Parent.TabOrder:=2;
    TreeFuncion.Parent.TabOrder:=0;
    TreeFavorito.Parent.TabOrder:=1;
    Boton1.Parent.TabOrder:=2;
    if TreeFuncion.Focused then TreeFuncion.SetFocus;
    ActivaApli(nil);
    ShowWelcome;
    Timer.Enabled:=True;
    MenuRun(nil,'STARTAPLI');
    OnTimer(nil);
end;

Procedure TInterApli.Start(Form:TForm);
var PP,P3,P2,P1:TPanel;
    Boton1:TButton;
    StP:TStatusPanel;
    Im:TImageList;
    spl:TSplitter;
    BmpH:THandle;
    Bmp:TBitMap;
    S:String;
begin InitFechaOracle;
      if Form=Nil then
         begin InterMsg(tmMal,'',0,'Debe Asignar una Forma a la Aplicación');
               exit;
         end;
      MainForm:=Form;
      MainForm.OnActivate:=ActivaApli;
    //Asigna como el Nombre del Sistema.
    S:='';
    GetSQLStr('SELECT NOM_APLICACION FROM SECU_APLICACION WHERE RTRIM(CVE_APLICACION)='+#39+APLI+#39,
              SeguDataBaseName,SeguSessionName,'NOM_APLICACION',S,False);
    if S='' then S:='Imposible Localizar la Aplicación'+Apli;
    Application.Title:=S;
    NomAplicacion:=S;
    LogOn;
    MainForm.Caption:=S;

    MainForm.KeyPreview:=True;
    MainForm.OnKeyPress:=FormaKeyPress;

    //StatusBar
    StatusBar:=TStatusBar.Create(MainForm);
    StatusBar.Parent:=MainForm;
    StatusBar.ShowHint:=True;
    StatusBar.SetBounds(0,1100,100,19);
    Stp:=StatusBar.Panels.Add;
    Stp.WidTh:=70;
    Stp.Alignment:=taCenter;
    stp.Text:='MMMMMMM';
    Stp:=StatusBar.Panels.Add;
    Stp.WidTh:=110;
    Stp.Alignment:=taCenter;
    stp.Text:='01/12/1997 10:50';
    Stp:=StatusBar.Panels.Add;
    Stp.WidTh:=60;
    Stp.Alignment:=taCenter;
    stp.Text:='<ALIAS>';
    Stp:=StatusBar.Panels.Add;
    Stp.WidTh:=50;
    stp.Text:='<ESTADO>';
    Stp.Alignment:=taCenter;
    Stp:=StatusBar.Panels.Add;
    Stp.WidTh:=100;
    Stp.Alignment:=taLeftJustify;
    stp.Text:='<AYUDA>';

    //Panel de Tool Bar.
    PanelTools:=Tpanel.Create(MainForm);
    PanelTools.Parent:=MainForm;
    PanelTools.Align:=alBottom;
    PanelTools.SetBounds(0,MainForm.ClientHeight-25,100,24);
    PanelTools.Caption:='';

    P1:=Tpanel.Create(MainForm);
    P1.Parent:=PanelTools;
    P1.BevelOuter:=bvNone;
    P1.BevelInner:=bvNone;
    P1.Align:=alRight;
    P1.SetBounds(0,0,84*2,24);
    P1.Caption:='';

    LabelPerfilIndicador:=TPanel.Create(MainForm);
    LabelPerfilIndicador.Parent:=PanelTools;
    LabelPerfilIndicador.BevelOuter:=bvNone;
    LabelPerfilIndicador.BevelInner:=bvNone;
    LabelPerfilIndicador.Align:=alClient;
    LabelPerfilIndicador.AlignMent :=taLeftJustify;
    LabelPerfilIndicador.SetBounds(0,0,350,16);
    LabelPerfilIndicador.Caption:=' ['+BonitoStrEx(NomPerfil)+'] '+BonitoStrEx(NomIndicador)+'    [Usuario]  '+BonitoStrEx(FUsuarioNombre);

    Boton1:=TBitBtn.Create(MainForm);
    Boton1.Parent:=P1;
    Boton1.SetBounds(2,2,80,20);
    Boton1.Caption:='Sugerir';
    Boton1.OnClick:=MenuSugiere;
    Boton1.ShowHint:=True;
    Boton1.Hint:='Enviar Sugerencias al Administrador de Sistemas.';

    CargaImg(Boton1,tsbSugerencias);

    Boton1:=TBitBtn.Create(MainForm);
    Boton1.Parent:=P1;
    Boton1.SetBounds(84,2,80,20);
    Boton1.Caption:='Salir';
    Boton1.OnClick:=MenuClose;
    CargaImg(Boton1,tsbSalir);


    PanelImagen:=Tpanel.Create(MainForm);
    PanelImagen.Parent:=MainForm;
    PanelImagen.Align:=alTop;
    PanelImagen.BevelOuter:=bvNone;
    PanelImagen.BevelInner:=bvRaised;
    PanelImagen.SetBounds(0,0,100,64);
    PanelImagen.Caption:='';


    PP:=Tpanel.Create(MainForm);
    PP.Parent:=PanelImagen;
    PP.Align:=alLeft;
    PP.BevelOuter:=bvNone;
    PP.BevelInner:=bvNone;
    PP.SetBounds(0,0,190+4,64);
    PP.Caption:='';

    FIma:=TImage.Create(MainForm);
    FIma.Parent:=PP; //alNone;
    FIma.Align:=alNone; //None;
    FIma.SetBounds(2,2,190,60);
    if FIma<>nil then FIma.Picture.Assign(FImagen);

    P1:=Tpanel.Create(MainForm);
    P1.Parent:=PanelImagen;
    P1.BevelOuter:=bvNone;
    P1.BevelInner:=bvNone;
    P1.Align:=alRight;
    P1.SetBounds(0,0,204,60);
    P1.Caption:='';

    Scroll:=TScrollBox.Create(MainForm);
    Scroll.Parent:=P1;
    Scroll.Color:=clAmarillito;
    Scroll.SetBounds(2,2,200,60);
    Scroll.AutoScroll:=True;

    LabelWelcome:=TLabel.Create(MainForm);
    LabelWelcome.Parent:=Scroll;
    LabelWelcome.SetBounds(2,2,200-18,60);
    LabelWelcome.Caption:='Bienvenido!!!';
    LabelWelcome.WordWrap:=True;
    LabelWelcome.AutoSize:=True;

    P1:=Tpanel.Create(MainForm);
    P1.Parent:=MainForm;
    P1.Align:=alLeft;
    P1.Caption:='';
    P1.BevelOuter:=bvNone;
    P1.SetBounds(0,0,200,16);
    if ShowMenus=False then P1.Visible:=False;

        PanelMenu:=Tpanel.Create(MainForm);
        PanelMenu.Parent:=P1;
        PanelMenu.Align:=alTop;
        PanelMenu.Caption:='Menu';
        PanelMenu.BevelOuter:=bvNone;
        PanelMenu.BevelInner:=bvLowered;
        PanelMenu.SetBounds(0,0,200,16);




        Im:=TImageList.Create(MainForm);

        BMPH:=LoadBitmap(HInstance,'FLECHAROJA');
        BMP:=TBitMap.Create;
        BMP.Handle:=BMPH;
        Im.Add(BMP,Nil);

        BMPH:=LoadBitmap(HInstance,'FLECHAAZUL');
        BMP:=TBitMap.Create;
        BMP.Handle:=BMPH;
        Im.Add(BMP,Nil);

        BMPH:=LoadBitmap(HInstance,'SEPARADOR');
        BMP:=TBitMap.Create;
        BMP.Handle:=BMPH;
        Im.Add(BMP,Nil);



        TreeMenu:=TTreeView.Create(MainForm);
        TreeMenu.Parent:=P1;
        TreeMenu.Align:=alClient;
        TreeMenu.SetBounds(0,0,200,16);
        TreeMenu.Images:=Im;
        TreeMenu.ShowRoot:=False;
        TreeMenu.ShowLines:=False;
        TreeMenu.HideSelection:=False;
        TreeMenu.ReadOnly:=True;

    spl:=TSplitter.Create(MainForm);
    spl.Parent:=MainForm;
    spl.Align:=alLeft;
    spl.SetBounds(210,0,4,4);
    if ShowMenus=False then spl.Visible:=False;

    P1:=Tpanel.Create(MainForm);
    P1.Parent:=MainForm;
    P1.Align:=alClient;
    P1.Caption:='';
    P1.BevelOuter:=bvNone;
    P1.SetBounds(0,0,200,16);
    if ShowMenus=False then P1.Visible:=False;
    P2:=Tpanel.Create(MainForm);
    P2.Parent:=P1;
    P2.Align:=alBottom;
    P2.Caption:='';
    P2.BevelOuter:=bvNone;
    P2.SetBounds(0,200,200,FavoritoDefH);

    spl:=TSplitter.Create(MainForm);
    spl.Parent:=P1;
    spl.Align:=alBottom;
    spl.Cursor:=crVSplit;
    spl.SetBounds(0,150,4,4);

    P3:=Tpanel.Create(MainForm);
    P3.Parent:=P1;
    P3.Align:=alClient;
    P3.Caption:='';
    P3.BevelOuter:=bvNone;
    P3.SetBounds(0,0,100,100);

    PanelFuncion:=Tpanel.Create(MainForm);
    PanelFuncion.Parent:=P3;
    PanelFuncion.Align:=alTop;
    PanelFuncion.BevelInner:=bvLowered;
    PanelFuncion.BevelOuter:=bvNone;
    PanelFuncion.Caption:='Funciones';
    PanelFuncion.SetBounds(0,0,200,16);

    TreeFuncion:=TTreeView.Create(MainForm);
    TreeFuncion.Parent:=P3;
    TreeFuncion.Align:=alClient;
    TreeFuncion.SetBounds(0,0,200,16);
    TreeFuncion.Images:=Im;
    TreeFuncion.ShowRoot:=False;
    TreeFuncion.ShowLines:=False;
    TreeFuncion.HideSelection:=False;
    TreeFuncion.ReadOnly:=True;
    Treefuncion.DragMode:=dmAutomatic;
    Treefuncion.OnDragOver:=FuncionDragOver;
    Treefuncion.OnDragDrop:=FuncionDragDrop;

    PanelFavorito:=Tpanel.Create(MainForm);
    PanelFavorito.Parent:=P2;
    PanelFavorito.Align:=alTop;
    PanelFavorito.BevelOuter:=bvNone;
    PanelFavorito.BevelInner:=bvLowered;
    PanelFavorito.Caption:='Acceso Rápido/Preferencias';
    PanelFavorito.SetBounds(0,0,200,16);

    TreeFavorito:=TTreeView.Create(MainForm);
    TreeFavorito.Parent:=P2;
    TreeFavorito.Align:=alClient;
    TreeFavorito.SetBounds(0,0,200,16);
    TreeFavorito.Images:=Im;
    TreeFavorito.ShowRoot:=False;
    TreeFavorito.ShowLines:=False;
    TreeFavorito.HideSelection:=False;
    TreeFavorito.ReadOnly:=True;
    TreeFavorito.DragMode:=dmAutomatic;
    TreeFavorito.OnDragOver:=FavoritoDragOver;
    TreeFavorito.OnDragDrop:=FavoritoDragDrop;

    CreaMenus;
    TreeMenu.OnChange:=MenuChange;
    TreeFuncion.OnChange:=FuncionChange;
    TreeFuncion.OnDblClick:=FuncionDblClick;
    TreeFavorito.OnDblClick:=FavoritoDblClick;

    TreeMenu.Parent.TabOrder:=0;
    TreeFuncion.Parent.Parent.TabOrder:=1;
    Boton1.Parent.TabOrder:=2;
    TreeFuncion.Parent.TabOrder:=0;
    TreeFavorito.Parent.TabOrder:=1;
    Boton1.Parent.TabOrder:=2;

    MenuChange(nil,nil);
    if TreeFuncion.Focused then TreeFuncion.SetFocus;
    CargaFavorito;
    ActivaApli(nil);

    ShowWelcome;
    Timer.Enabled:=True;
    MenuRun(nil,'STARTAPLI');
    OnTimer(nil);
    IniciaSistema(101,'Inicio Aplicación');
end;

Procedure TInterapli.ShowWelcome;
begin Scroll.Visible:=Not (Trim(Welcome)='');
      LabelWelcome.Width:=200-18;
      LabelWelcome.Caption:=Welcome;
end;

Procedure TInterApli.MenuClick(Sender:TObject);
var S:String;
    P:Integer;
begin if Sender is TMenuItem
      then begin S:=TMenuItem(Sender).Hint; end
      else begin S:='|'; end;
      P:=Pos('|',S);
      ApliNomFuncion:=Copy(S,P+1,Length(S));
      MenuRun(Sender,ApliNomFuncion);
end;

Const FInterFun:TInterFun=nil;

Procedure TInterApli.MenuRun(Sender:TObject; Funcion:String);
begin LastFuncion:=Funcion;
           if Funcion='START' then ReLogOn
      else if Funcion='ABOUT' then MuestraAbout
      else if Funcion='CLOSE' then PostMessage(MainForm.Handle,WM_CLOSE,0,0)
      else if Funcion='PRINT_SETUP' then PrintSetup
      else if Funcion='ENDAPLI' then  begin if Assigned(FOnMenuClick) then FOnMenuClick(Self,Funcion);
                                      end
      else if Funcion='AFTERSTART' then  begin if Assigned(FOnMenuClick) then FOnMenuClick(Self,Funcion);
                                      end
      else if Funcion='QUEST' then ShowQuest
      else if Assigned(FOnMenuClick)
           then begin if Funcion<>'STARTAPLI' then
                      begin if FInterFun=nil then FInterFun:=TInterFun.Create(nil);
                            FInterFun.Funcion:=Funcion;
                            FInterFun.InternalConnect(Apli,CvePerfil,SeguDataBaseName,SeguSessionName);
                            if Not FInterFun.ChecaAcceso(False)
                            then Raise EInterForma.Create(FInterFun.GetMsgError);
                      end;
                      FOnMenuClick(Self,Funcion);
                      if LastFuncion='STARTAPLI'
                         then begin Application.ProcessMessages;
                                    DespuesStart; //Despues_Run; //PostMessage(Handle,WM_DESPUES_START,0,0);
                              end;
                end;
end;

Procedure TInterApli.PrintSetup;
Var T:TPrinterSetupDialog;
begin T:=TPrinterSetupDialog.Create(MainForm);
      T.Execute;
      T.Free;
end;


procedure TInterApli.MenuChange(Sender: TObject; Node: TTreeNode);
begin if TreeMenu.Selected<>Nil then
      begin if TreeMenu.Selected.Data<>Nil
            then begin PanelFuncion.Caption:='Funciones  ['+TNodoFun(TreeMenu.Selected.Data).Desc+']';
                       CargaFuncion(TNodoFun(TreeMenu.Selected.Data).Clave);
                 end;
      end;
end;


procedure TInterApli.FuncionChange(Sender: TObject; Node:TTreeNode);
begin if TreeFuncion.Selected<>Nil then
      begin if TreeFuncion.Selected.Data<>Nil
            then begin StatusBar.Panels[4].Text:=TNodoFun(TreeFuncion.Selected.Data).Desc;
                 end;
      end;
end;

procedure TInterApli.FuncionDblClick(Sender: TObject);
begin if TreeFuncion.Selected<>Nil then
      begin if TreeFuncion.Selected.Data<>Nil
            then begin ApliNomFuncion:=TNodoFun(TreeFuncion.Selected.Data).Clave;
                       MenuRun(Sender,ApliNomFuncion);
                 end;
      end;
end;


procedure TInterApli.FavoritoDblClick(Sender: TObject);
begin if TreeFavorito.Selected<>Nil then
      begin if TreeFavorito.Selected.Data<>Nil
            then begin ApliNomFuncion:=TNodoFun(TreeFavorito.Selected.Data).Clave;
                       MenuRun(Sender,ApliNomFuncion);
                 end;
      end;
end;

procedure TInterApli.FuncionDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var T:TTreeView;
begin if Source=TreeFavorito
      then begin T:=TTreeView(Source);
                 Accept:=((T.Selected<>nil)and(TNodoFun(T.Selected.Data).Clave<>''));
           end
      else Accept:=False;
end;

procedure TInterApli.FuncionDragDrop(Sender, Source: TObject; X, Y: Integer);
var T:TTreeView; CVE:String;
begin if Source=TreeFavorito then
         begin T:=TTreeView(Source);
               if T.Selected<>nil then
                  begin CVE:=TNodoFun(T.Selected.Data).Clave;
                        if CVE='' then exit;
 if RunSQL('DELETE SECU_USR_DEF WHERE '+
           '(CVE_APLICACION='+#39+apli+#39+') '+
           ' and (ID_EMPRESA='+IntToStr(IDEMPRESA)+')'+
           ' and (CVE_USUARIO='+#39+usuario+#39+') '+
           ' and (CVE_IND_ADIC='+#39+Indicador+#39+') '+
           ' and (ID_GPO_ACCESO='+IntToStr(cvePerfil)+') '+
           ' and (CVE_FUNCION='+#39+CVE+#39+')',SeguDataBaseName,SeguSessionName,True)
   then CargaFavorito
   else InterMsg(tmMal,'',0,'Imposible eliminar la Función. Intente mas tarde');
               end;
         end;
end;


procedure TInterApli.FavoritoDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var T:TTreeView;
begin if Source=TreeFuncion
      then begin T:=TTreeView(Source);
                 Accept:=((T.Selected<>nil)and(TNodoFun(T.Selected.Data).Clave<>''));
           end
      else Accept:=False;
end;

procedure TInterApli.FavoritoDragDrop(Sender, Source: TObject; X, Y: Integer);
var T:TTreeView; CVE:String;
begin
  if Source=TreeFuncion then begin
     T:=TTreeView(Source);
     if T.Selected<>nil then begin
        CVE:=TNodoFun(T.Selected.Data).Clave;
        if CVE='' then
           exit;
        if GetSQL('SELECT CVE_APLICACION FROM SECU_USR_DEF WHERE '+
           '(CVE_APLICACION='+#39+apli+#39+') '+
           ' and (ID_EMPRESA='+IntToStr(IDEMPRESA)+')'+
           ' and (CVE_USUARIO='+#39+usuario+#39+') '+
           ' and (CVE_IND_ADIC='+#39+Indicador+#39+') '+
           ' and (ID_GPO_ACCESO='+IntToStr(cvePerfil)+') '+
           ' and (CVE_FUNCION='+#39+CVE+#39+')',SeguDataBaseName,SeguSessionName,True) then
           InterMsg(tmMal,'',0,'Esta Función ya existe. Imposible agregar nuevamente')
        else begin
           if RUNSQL('INSERT INTO SECU_USR_DEF (CVE_APLICACION,ID_EMPRESA,CVE_USUARIO,CVE_IND_ADIC,ID_GPO_ACCESO,CVE_FUNCION) '+
                    ' VALUES ('#39+apli+#39+','+IntToStr(IDEMPRESA)+','+#39+usuario+#39
                     +','+#39+Indicador+#39+','+IntToStr(cvePerfil)+','+#39+CVE+#39+')',SeguDataBaseName,SeguSessionName,True) then begin CargaFavorito;
                  end
             ELSE InterMsg(tmMal,'',0,'Imposible Agregar la Función. Intente mas tarde.');
        end;
   //ShowMessage('Droperaon'+TNodoFun(T.Selected.Data).Clave);
                  end;
         end;
end;

Function GetSysDateTime(DataBaseName,SessionName:String):TDateTime;
Var spAccCont  : TStoredProc;
begin
    GetSysDateTime:=0;
    if DataBaseName='' then exit;
    Try
    spAccCont:=TStoredProc.Create(Nil);
    try
    //Se establecen las propiedades del Stored Procedure
    spAccCont.DataBaseName:=DataBaseName;
    spAccCont.SessionName:=SessionName;
    spAccCont.StoredProcName:='OBT_FECHA_HORA';
    spAccCont.Params.CreateParam(ftDateTime,'P_FH_DATE',ptOutput);
    //Se ejecuta el Stored Procedure
    spAccCont.Prepare;
    spAccCont.ExecProc;
    //Se accesa el valor de salida
    GetSysDateTime:= spAccCont.ParamByName('P_FH_DATE').AsDateTime;
    spAccCont.UnPrepare;
    spAccCont.Close;
    finally
       spAccCont.Free;
    end;
    Except // NO HACE NADA
    end;
end;


Function TInterApli.SysDateTime:TDateTime;
Var
   spAccCont  : TStoredProc;
begin
  if SeguDataBaseName='' then exit;
  MsgError:='Imposible Crear Stored Procedure Obt_Fecha_Hora' ;
  spAccCont:=TStoredProc.Create(Nil);
  try
  MsgError:='Imposible Ejecutar Stored Procedure Obt_Fecha_Hora';
  //Se establecen las propiedades del Stored Procedure
  spAccCont.DataBaseName:=SeguDataBaseName;
  spAccCont.SessionName:=SeguSessionName;
  spAccCont.StoredProcName:='OBT_FECHA_HORA';
  spAccCont.Params.CreateParam(ftDateTime,'P_FH_DATE',ptOutput);
  //Se ejecuta el Stored Procedure
  spAccCont.Prepare;
  spAccCont.ExecProc;
  //Se accesa el valor de salida
  SysDateTime:= spAccCont.ParamByName('P_FH_DATE').AsDateTime;
  spAccCont.UnPrepare;
  spAccCont.Close;
  finally
     spAccCont.Free;
  end;
end;

Procedure TInterApli.CargaFuncion(Clave:String);
var
   Tn:TTreeNode;
   NodoFun:TNodoFun;
   NodoSel:TTreeNode;
   Gpo:String;
begin TreeFuncion.Selected:=Nil;
      TreeFuncion.Items.Clear;
      NodoSel:=Nil;
      Gpo:='';
      Q1.First;
      While Not Q1.EOF do
      begin
         if (Q1.FieldByName('CVE_MENU').AsString=Clave)
          then begin if (Gpo='') then Gpo:=Q1.FieldByName('ID_GPO').AsString;
                     if Gpo<>Q1.FieldByName('ID_GPO').AsString
                        then begin NodoFun:=TnodoFun.Create;
                                   NodoFun.Clave:='';
                                   NodoFun.Nombre:='';
                                   NodoFun.Desc:='';
                                   Tn:=TreeFuncion.Items.AddChildObject(Nil,NodoFun.Nombre,NodoFun);
                                   Tn.SelectedIndex:=2;
                                   Tn.ImageIndex:=2;
                             end;
                     Gpo:=Q1.FieldByName('ID_GPO').AsString;

                     NodoFun:=TnodoFun.Create;
                     NodoFun.Clave:=Q1.FieldByName('CVE_FUNCION').AsString;
                     NodoFun.Nombre:=Q1.FieldByName('NOM_FUNCION').AsString;
                     NodoFun.Desc:=Q1.FieldByName('TX_DESC_FUNCION').AsString;
                     Tn:=TreeFuncion.Items.AddChildObject(Nil,NodoFun.Nombre,NodoFun);
                     Tn.SelectedIndex:=1;
                     if NodoSel=nil then NodoSel:=Tn;
               end;
         Q1.Next;
      end;
      if NodoSel<>Nil then TreeFuncion.Selected:=NodoSel;
end;


Procedure TInterApli.CargaFavorito;
var Tn:TTreeNode;
    NodoFun:TNodoFun;
    NodoSel:TTreeNode;

begin TreeFavorito.Selected:=Nil;
      TreeFavorito.Items.Clear;
      NodoSel:=Nil;
      OpenFavorito;
      Q3.First;
      While Not Q3.EOF do
      begin NodoFun:=TnodoFun.Create;
            NodoFun.Clave:=Q3.FieldByName('CVE_FUNCION').AsString;
            NodoFun.Nombre:=Q3.FieldByName('NOM_FUNCION').AsString;
            NodoFun.Desc:=Q3.FieldByName('TX_DESC_FUNCION').AsString;
            Tn:=TreeFavorito.Items.AddChildObject(Nil,NodoFun.Nombre,NodoFun);
            Tn.SelectedIndex:=1;
            if NodoSel=nil then NodoSel:=Tn;
         Q3.Next;
      end;
      if NodoSel<>Nil then TreeFavorito.Selected:=NodoSel;
      TreeFavorito.Refresh;
end;

procedure TInterApli.FormaKeyPress(Sender: TObject; var Key: Char);
begin if Key=#13 then FuncionDblClick(Sender);
end;

Procedure TInterApli.OnTimer(Sender:TObject);
Var
  Fecha1,Fecha2 : TDateTime;
begin
  if StatusBar<>Nil then begin
     Fecha2 := now;//}GetSysDateTime(SeguDataBaseName,SeguSessionName);
     LastFechaHora:=Fecha2;
     FNotificador.ExecutaNotifica(WM_INTER_APLI_TIME_CHANGE,@LastFechaHora);
     if(SeguDataBaseName=DataBaseName)and(SeguSessionName=SessionName)then
        Fecha1 := Fecha2
     else
        Fecha1 := now;//}GetSysDateTime(DataBaseName,SessionName);
     if(Fecha1<>0)and(Fecha2<>0)Then
        StatusBar.Panels[3].Text:= 'OK'
     else begin
        if(Fecha1=0)and(Fecha2=0)then
           StatusBar.Panels[3].Text:= 'ERROR3'
        else
           if(Fecha1=0)then
              StatusBar.Panels[3].Text:= 'ERROR1'
           else
              if(Fecha2=0)then
                 StatusBar.Panels[3].Text:= 'ERROR2';
          end;
     StatusBar.Panels[0].Text:=Usuario; //+' '+UsuarioNombre;
     if Fecha2<>0 then
        StatusBar.Panels[1].Text:=FormatDateTime(toFechaHora,Fecha2); //SysDateTime);
     if FDatabase.AliasName<>'' then
        StatusBar.Panels[2].Text := FDataBase.AliasName
     else
        StatusBar.Panels[2].Text := BuscaValor(FDataBase,'SERVER NAME');
  end;
end;

Procedure TInterApli.ErrorGeneral(Sender:TObject; E:Exception);
var i:Integer;
Var sAux:String;
    ErrNum:LongInt;
    STP:TStoredProc;
    BitNum:LongInt;
    GenMSg:string;
    NoSave:Boolean;
    InterErr:TWInterErr;
    SalteYa:Boolean;

Procedure AddMsg(Var sAux:String; S:String; Cat,ErrCode,SubCode,Native:LongInt; Tipo:Integer; AddMsg:String);
Var SS:String;
begin
  if sAux='' then
     sAux:=S
  else
     sAux:=sAux+#13+#10+S;
  if Native=20020 then
     sAux:=S;
  Case Tipo of
    5 : sAux:=sAux+#13+#10+AddMsg;
  end;
end;

Function SinOra(S:String):string;
var
  es,Tok,SS:String; i:Integer;
  Dentro:Boolean;
begin
  Dentro:=False;
  es:=''; Tok:='';
  For i:=1 to Length(S) do begin
      if S[i]=#30 then //NADA
      else
      if S[i] in [':',',',' ','.',#13,#10] then begin
         SS:=S[i];
         if Tok<>'' then begin
            if Pos('ORA-',Tok)<>1 then begin
               Es:=Es+Tok;
            end
            else begin
               if(Copy(S,i+1,1)=':') and (S[i]=' ')then begin
                  SS:=''; S[i+1]:=#30;
               end;
               if s[I]=':' then
                  ss:='';
               if (Copy(S,i+1,1)=' ') then begin
                  S[i+1]:=#30;
               end;
            end;
         end;
         Es:=Es+SS;
         Tok:='';
      end
      else
         Tok:=Tok+S[i];
  end;
  if Tok<>'' then
     Es:=Es+Tok;
  if es='' then
     SinOra:=BonitoStr(S)
  else
     SinOra:=BonitoStr(es);
end;

Procedure Msg(MM,S:String; Tipo:Integer; Apli:TInterApli);
Var SS:String;
    Qr:TQrInterEncabezado;
begin SS:='';
  case Tipo of
    5:MessageDlg(MM,mtError,[mbOK],0);
    else begin
       if Not vgApliSaveError then begin
          MessageDlg(MM,mtError,[mbOK],0);
       end
       else begin
          Application.CreateForm(TWInterErr,InterErr);
           Try InterErr.Memo1.Lines.Text:=MM;
               Qr:=TQrInterEncabezado.Create(InterErr.QrTitulo);
               Qr.Parent:=InterErr.QrTitulo;
               Qr.Apli:=Apli;
               InterErr.ShowModal;
           Finally
             InterErr.Free;
           end;
         end;
    end;
  end;
end;

begin FPostErrorMessage:=E.Message;
      if Assigned(FOnPostError) then FOnPostError(Self);
      ErrNum:=0;
      BitNum:=-1;
      SalteYa:=False;
      if E is EDBEngineError then
         begin
               With E As EDBEngineError do
               begin sAux:='';
                     CursorEspera;
                     Try
                     For i:=0 to ErrorCount-1 do
                     if Not SalteYa then
                     With Errors[i] do
                     begin NoSave:=False;
                           ErrNum:=NativeError;
                           GenMsg:='Error DBEng.:'+Message+
                           'categoria     :'+IntToStr(Category)+#13+#10+
                           'Error Code    :'+IntToStr(ErrorCode)+#13+#10+
                           'Sub Code      :'+IntToStr(SubCode)+#13+#10+
                           'Native Error  :'+IntToStr(NativeError);
                           Case NativeError of
                           0:begin ErrNum:=ErrorCode;
                                   Case ErrorCode of
                                    9732:AddMsg(sAux,'Información Requerida.',Category,ErrorCode,SubCode,NativeError,5,Message);
                                   10036:AddMsg(sAux,'Imposible Conectar al '+Message,Category,ErrorCode,SubCode,NativeError,1,Message);
                                    9729:AddMsg(sAux,'Información Duplicada.',Category,ErrorCode,SubCode,NativeError,5,Message);
                                   11830:AddMsg(sAux,'Falto cerrar comilla en la sentencia SQL.',Category,ErrorCode,SubCode,NativeError,1,Message);
                                   13059:begin AddMsg(sAux,'Error General SQL.',Category,ErrorCode,SubCode,NativeError,5,Message);
                                               NoSave:=True;
                                         end;
                                   10038:AddMsg(sAux,'Nombre de campo Invalido.',Category,ErrorCode,SubCode,NativeError,1,Message);
                                   else  AddMsg(sAux,'Mensaje DBEng.:'+Message+
                                                     'categoria     :'+IntToStr(Category)+#13+#10+
                                                     'Error Code    :'+IntToStr(ErrorCode)+#13+#10+
                                                     'Sub Code      :'+IntToStr(SubCode)+#13+#10+
                                                     'Native Error  :'+IntToStr(NativeError)+#13+#10
                                                     ,Category,ErrorCode,SubCode,NativeError,1,Message);
                                   end; //Case
                              end; // 0 Native Error
                           1:begin ErrNum:=ErrorCode;
                                   Case ErrorCode of
                                   13059:AddMsg(sAux,'Imposible Validar Restricción de Información No Duplicada. Verifique.',Category,ErrorCode,SubCode,NativeError,5,Message);
                                   end;
                             end;
                        1400:begin ErrNum:=ErrorCode;
                                   Case ErrorCode of
                                   13059:AddMsg(sAux,'Imposible Validar Restricción de Información Requerida. Verifique.',Category,ErrorCode,SubCode,NativeError,5,Message);
                                   end;
                             end;
                        1407:begin ErrNum:=ErrorCode;
                                   Case ErrorCode of
                                   13059:AddMsg(sAux,'Imposible Validar Restricción de Información Requerida. Verifique.',Category,ErrorCode,SubCode,NativeError,5,Message);
                                   end;
                             end;
                           1017:AddMsg(sAux,'Usuario o Password Invalido.',Category,ErrorCode,SubCode,NativeError,5,Message);
                            942:AddMsg(sAux,'La Tabla o Vista seleccionada no Existe.',Category,ErrorCode,SubCode,NativeError,5,Message);
                            904:AddMsg(sAux,'Nombre de Columna Invalido.',Category,ErrorCode,SubCode,NativeError,5,Message);
                            923:AddMsg(sAux,'La palabra FROM no se encuentra donde se esperaba. Error de sintaxis sentencia SQL',Category,ErrorCode,SubCode,NativeError,5,Message);
                           else
                           if ErrorCode=13059
                                  then begin SalteYa:=True;
                                             AddMsg(sAux,SinOra(Message)
                                                    //'categoria     :'+IntToStr(Category)+#13+#10+
                                                    //'Error Code    :'+IntToStr(ErrorCode)+#13+#10+
                                                   // 'Sub Code      :'+IntToStr(SubCode)+#13+#10+
                                                   // 'Native Error  :'+IntToStr(NativeError)+#13+#10
                                                    ,Category,ErrorCode,SubCode,NativeError,1,Message);
                                       end
                                  else begin
                                AddMsg(sAux,'Server Mensaje:'+Message+#13+#10+
                                                  'categoria     :'+IntToStr(Category)+#13+#10+
                                                  'Error Code    :'+IntToStr(ErrorCode)+#13+#10+
                                                  'Sub Code      :'+IntToStr(SubCode)+#13+#10+
                                                  'Native Error  :'+IntToStr(NativeError)+#13+#10
                                                  ,Category,ErrorCode,SubCode,NativeError,1,Message);
                                       end;
                           end;
                           if (Not NoSave) and (vgApliSaveError) then
                           begin
                            STP:=TStoredProc.Create(Self);
                            Try STP.StoredProcName:='STPINSEBITACORA';
                              Try
                                STP.DataBaseName:=ErrorDataBaseName;
                                STP.SessionName:=ErrorSessionName;
                                STP.Prepare;
                                STP.ParamByName('PCVE_PROCESO').AsString:='ERRDEL';
                                STP.ParamByName('PCVE_USUAR_MODIF').AsString:=FUsuario; //DameUsuario;
                                STP.ParamByName('PF_PROCESO').Clear; //AsDateTime:=Now;
                                STP.ParamByName('pH_INICIO').Clear; //AsInteger:=0;
                                STP.ParamByName('pH_FINAL').Clear; //AsInteger:=0;
                                if BitNum=-1
                                then STP.ParamByName('PGPO_BITACORA').AsInteger:=-1
                                else STP.ParamByName('PGPO_BITACORA').AsInteger:=BitNum;
                                STP.ParamByName('PID_CONTRATO').AsInteger:=0;
                                STP.ParamByName('pID_ERROR_ORACLE').AsInteger:=ErrNum;
                                STP.ParamByName('pNUM_HOJAS').AsInteger:=0;
                                STP.ParamByName('pSIT_PROCESO').AsString:='ER';
                                STP.ParamByName('pTX_CIFRAS').AsString:='';
                                STP.ParamByName('pCVE_APLICACION').AsString:=Apli;
                                STP.ParamByName('pCVE_FUNCION').AsString:=LastFuncion;
                                STP.ParamByName('pTX_COMENTARIO').AsString:=GenMsg;
                                STP.ParamByName('pTX_SOLUCION').AsString:='';
                                STP.ParamByName('pBCOMMIT').AsString:='V';
                                Try
                                    STP.ExecProc;
                                    if BitNum=-1
                                    then BitNum:=STP.ParamByName('PIDBITACORA').AsInteger;
                                Except
                                      On E:Exception do
                                      begin Msg('Imposible Guardar la Información del Error '#13#10' Avise Inmediatamente Sistemas ',E.Message,0,Self);
                                      end;
                                end;
                                if STP.ParamByName('pCODRESP').AsInteger<>0
                                then begin Msg('Imposible Guardar la Información del Error '#13#10' Avise Inmediatamente Sistemas ','',0,Self);
                                     end;
                               Except On E:Exception do
                                      begin Msg('Imposible Guardar la Información del Error '#13#10' Avise Inmediatamente Sistemas ',E.Message,1,Self);
                                      end;
                               end;
                            Finally STP.Free;
                            end;
                         end;
                         end;
                   Finally CursorNormal;
                   end;
                   Msg(sAux,'',1,Self);
               end;
         end
    else if E is EDataBaseError  then Msg(EDataBaseError(E).Message,'',0,Self)
    else if E is EDivByZero then Msg('Ocurrio una División por Cero en el Programa.','',0,Self)
    else if E is EZeroDivide  then Msg('Ocurrio una División por Cero en el Programa.','',0,Self)
    else begin if Copy(E.Message,1,1)=#30
               then Msg(#13+#10+Copy(E.Message,2,Length(E.Message)),'',5,Self)
               else Msg('Error de Sistema.'+#13+#10+E.Message,'',0,Self);
         end;
end;

Procedure TInterApli.ActivaApli(Sender:TObject);
begin
end;

Procedure TInterApli.MenuClose(Sender:TObject);
begin MenuRun(Sender,'ENDAPLI');
      MenuRun(Sender,'CLOSE');
end;

procedure TInterApli.MenuSugiere(Sender: TObject);
begin MenuRun(Sender,'QUEST');
end;

Procedure TInterApli.MuestraAbout;
begin ShowAbout(VersionFecha,Version,NomAplicacion,VersionInfo,VersionImagen,VersionLogo);
end;

// Función que regresa el Usuario de BD desde el componente de seguridad.
function TInterApli.getDbUser(pAlias : String) : String;
var
   vResult : String;
begin
   try
      vResult := '';
      vResult := 'SISTEMAS';
   except
      on e: Exception do
         ShowMessage('Error en InterApl.getDbUser. ' + e.Message);
   end;
   Result := vResult;
end;

// Función que regresa el Password de BD desde el componente de seguridad.
function TInterApli.getDbPass(pAlias : String) : String;
var
   vResult : String;
begin
   try
      vResult := '';
      if not ((ParamStr(1) = 'P') or (ParamStr(1) = 'Q')) then
      vResult := 'DESARROLLO';
   except
      on e: Exception do
         ShowMessage('Error en InterApl.getDbPass. ' + e.Message);
   end;
   Result := vResult;

end;

end.

