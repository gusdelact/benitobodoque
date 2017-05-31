unit UnSubgen;
//-------------------------------------------------------------
// Sistema         :   InterForma Genes Funciones SubGenerales
// Date            :   Julio de 1997  UnGene
// Fecha de Inicio :   Julio de 1997
// Función forma   :   Procesos Automaticos
// Desarrollo por  :   Víctor Martínez Castro
// Comentarios     :   Forma Estandar
// Actualizado al  :   07 Septiembre
// ------------------------------------------------------------

interface
Uses Buttons, WinProcs,WinTypes, SysUtils, Forms, DBTables, DB, ExtCtrls,Dialogs,
     Controls, stdCtrls, Graphics, DBCtrls, DBGrids,Wwdbedit, Wwdbigrd, Wwdbgrid,
     DbiProcs, DbiTypes, DbiErrs, WwdbComb, DBLookup, Wwdotdot, wwdblook,
     Classes, InterEdit, Mask, IniFiles, IntDTPK, Windows, Messages;

Const
     toFecha='DD/MM/YYYY';
     toFechaHora='DD/MM/YYYY HH:NN:SS';
     toHora='HH:NN:SS';

Const ColorLinkit:TColor=cl3dLight; //BtnHighLight;
Const ColorRequiered:TColor=$00FFF0DC;


Const WM_INTER_NOTIFICA=WM_USER+10000;
      WM_INTER_APLI_TIME_CHANGE=10;  // El Siguiente Parametro es un Apuntador a un TDateTime con la Nueva Hora.
      WM_INTER_REMOVE          =11;
      WM_INTER_FRAME_CHANGE    =12;

//Type TFormaTipo = (ftGrid,ftConsulta,ftCaptura,ftMulti,ftModifica, ftImprimir);

Type EInterForma=Class(Exception)
                     Public Constructor Create(const Msg:string); virtual;
                 end;

(*
TBaseInterCampo= class(TComponent)
private
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
  published
end;
*)

TEventOnNotifica=Procedure (Sender:TObject; Msg:TMessage) of Object;


TInterNotificador=Class(TPersistent)
                  Protected
                      FLinkeado      : Boolean;
                      FListaNotifica : TList;
                      FNotificador   : TInterNotificador;
                      FOnNotifica    : TEventOnNotifica;
                      Procedure      Notifica(Sender:TObject; Message:TMessage);
                  Public
                      WParam : Word;
                      LParam : LongInt;
                      Function  AgregaNotifica (Objeto:TObject):Boolean;
                      Function  EliminaNotifica(Objeto:TObject):Boolean;
                      Procedure ExecutaNotifica(Evento:Integer; Valor:Pointer);
                      Procedure SetNotificador(Noti:TInterNotificador);
                      Function  ProcesaNotifica(Message:TMessage):Boolean;
                      Constructor Create; virtual;
                      Destructor  Destroy; override; //virtual;
                      Property    Notificador:TInterNotificador Read FNotificador Write SetNotificador;
                      Property    OnNotifica:TEventOnNotifica Read FOnNotifica Write FOnNotifica;
               end;



TBaseInterFrame = class(TComponent)
private
    { Private declarations }
  protected
    { Protected declarations }
    FNotificador:TInterNotificador;
    FActive:Boolean; // Determina si está activo
    procedure  SetActive(B:Boolean); virtual; abstract;
    Function GetActive:Boolean; virtual; abstract;
    Function GetNotificador:TInterNotificador; Virtual; Abstract;
  public
    { Public declarations }
//    Function   FieldByName(NombreCampo:String):TBaseInterCampo;
    Function   FindKey(Const Llave:Array of Const):Boolean; Virtual; abstract;
    procedure  Edit; virtual; abstract;
    procedure  Post; virtual; abstract;
    procedure  Cancel; virtual; abstract;
    procedure  Append; virtual; abstract;
    procedure  Delete; virtual; abstract;
    function   Help:Boolean; virtual; abstract;
    function   Busca:Boolean; virtual; abstract;
    function   Catalogo:Boolean; virtual; abstract;
    Function   GetChildMaster(N:Integer):TBaseInterFrame; virtual; abstract;
    Procedure  SetCampo(NombreCampo:String; Valor:String); virtual; abstract;
    Function   GetCampo(NombreCampo:String):String; Virtual; Abstract;
    Function   GetApApli:TObject; Virtual; Abstract;
    Property   Notificador:TInterNotificador read GetNotificador Write FNotificador;
    Function   GetLastDateTime:TDateTime; virtual; Abstract;
  published
    Property   Active:Boolean read GetActive Write SetActive;
end;


type
  TBaseIniFile= class(TIniFile)
  private
  public
    constructor Create(const FileName: string; DataBaseName,SessionName:String);
    Destructor  Destroy; override;
    function ReadString(const Section, Ident, Default: string): string; virtual;
    function ReadInteger(const Section, Ident: string; Default: Longint): Longint; virtual;
    function ReadBool(const Section, Ident: string; Default: Boolean): Boolean; virtual;
  end;


type
  TSQLIniFile = class(TBaseIniFile)
  private
  public
    Lineas:TStringList;
    constructor Create(const FileName: string; DataBaseName,SessionName:String);
    Destructor  Destroy; override;
    function ReadString(const Section, Ident, Default: string): string; override;
    //procedure WriteString(const Section, Ident, Value: String);
    function ReadInteger(const Section, Ident: string; Default: Longint): Longint; override;
    //procedure WriteInteger(const Section, Ident: string; Value: Longint);
    function ReadBool(const Section, Ident: string; Default: Boolean): Boolean; override;
    //procedure WriteBool(const Section, Ident: string; Value: Boolean);
  end;




procedure LH(S:String);
procedure LC(S:String);

procedure InitLC(P1,P2:TPanel);
Procedure DoEvents;

Procedure  CursorEspera;
Procedure  CursorNormal;

Function   TimeValido(Var DT:TDateTime; Text:String):Boolean;
Procedure  InsFindStr(DAT:TTable; S:String; Campo:String);
Function   EnSeg(DT:TDateTime):LongInt;
Function   BuscaQry(Dat:TQuery; Campo:String; Key:LongInt):Boolean;

Procedure DatKeyUp(Dat:TDataSet; Var Key:Word; CanEdit:Boolean);
Procedure DatPrior(Dat:TDataSet);
Procedure DatNext(Dat:TDataSet);
Function  VolteaFecha(S:String):String;

Procedure SetEd(T:TDBEdit; CanEdit:Boolean);
Procedure SetCB(CB:TComboBox; CanEdit:Boolean);
Procedure SetDBrg(T:TDBRadioGroup; CanEdit:Boolean);
Procedure SetLook(T:TDBLookupCombo; CanEdit:Boolean);
Procedure SetEdDB1(T:TDBComboBox; CanEdit:Boolean);

Procedure SetFoco(T:TDBEdit; Grid:TDBGrid);
Procedure SetFocoDB1(T:TDBComboBox; Grid:TDBGrid);
Procedure SetFocoDBRg(T:TDBRadioGroup; Grid:TDBGrid);

Function IsEnabled(Hijo:TObject):Boolean;
Function IsFocusControl(Hijo:TObject):Boolean;

Var Panel4:TPanel;
    Panel3:TPanel;

Procedure LimpiaBase(T:TTable);

Procedure Cambia(Forma:TComponent; Padre:TComponent; Caso:Integer; Habilita:Boolean; IsNewData:Boolean; Grid:TwwDBGrid);

Procedure CambiaComp(Comp:TComponent; Caso:Integer; Habilita:Boolean; IsNewData:Boolean; Grid:TwwDBGrid);

Procedure CambiaStat(Forma:TWinControl; CasoDef,CasoCan:Integer);

Function DameCampoGrid(Grid:TwwDBGrid):String;

Function IntFindFile(Var FileName:String; DeDonde:string):Boolean;

Function ObtenUsuario:String;

Function FillRightCero(S:String; Tam:Integer):String;

Function IEmpresaCorta(S:String):String;

Procedure IStrReplace(Var S:String; SubStr:String; ReplaceWith:String);


Function ILeftZero(S:String; Tam:Integer):String;

Function IRigthZero(S:String; Tam:Integer):String;



Type
     str40 = string[40];
     MaxElementos = string[14];
     //Tpfuncion tipo definido para los modos de las aplicaciones.
     TpFuncion = (nulo,alta,baja,modifica,consulta);
     //Tipo para los botones de usuario
     TpBotones = string[12];
     //Rutas de elementos de la aplicacion
     TpRutas   = (RButton,RBmp,RDll,RReport,RHelp);
     TdeDonde  = (RTpublic,RTaplic,RToutApl,RToutPub);
     //Typos utilizados para la rutina de escritura al registry
     TregIO = (RegEscribe,RegLee);

Const
     //Botones generales.
     //posibles botones a ser utilizados en las aplicaciones

//   cgImagenes   :array [tsbAlta..tsbAvance] of MaxElementos =

     tsbAlta       : TpBotones = 'alta.bmp';
     tsbAcepta     : TpBotones = 'Aceptar.bmp';
     tsbAyuda      : TpBotones = 'Ayuda.bmp';
     tsbBorra      : TpBotones = 'Borrar.bmp';
     tsbBuscaAprox : TpBotones = 'BuscaApx.bmp';
     tsbBuscaExacto: TpBotones = 'BuscaEx.bmp';
     tsbCancela    : TpBotones = 'Cancela.bmp';
     tsbConsulta   : TpBotones = 'Consulta.bmp';
     tsbModifica   : TpBotones = 'Modifica.bmp';
     tsbSalir      : TpBotones = 'Salir.bmp';
     tsbParticip   : TpBotones = 'Particip.bmp';
     tsbAvance     : TpBotones = 'Avance.bmp';
     tsbImprime    : TpBotones = 'Imprimir.bmp';
     tsbPassWord   : TpBotones = 'PassWord.bmp';



   //Texto utilizado para las fechas
   cgMsg001 = 'La fecha final debe se mayor o igual a la fecha de inicio';
   cgMsg002 = 'La fecha de inicio debe se mayor o igual a la fecha de inicio del proyecto';

//Utiliza esta funcion para obtener la ruta de la imagen
//el parametro splash es para que se le asigne imagen
Procedure CargaImg( splash :TControl;  imagen : string);

Procedure CargaImagen( Var splash : TImage; imagen : string);

//Obtiene la imagen y la asigna al boton,
//las imagenes por boton ya estan definidas, esto con la
//finalidad de que no se salgan de estandar
//posibles botones de aplicaciones
//tsbAlta,tsbAcepta,tsbAyuda,
//tsbBorra,tsbBuscaAprox,
//tsbBuscaExacto,tsbCancela,tsbConsulta,
//tsbModifica,tsbSalir,tsbParticip,tsbAvance

Function LocalizaArchivo(Var FileName:String; cgFindit:String) :Boolean;

//Uses Registry;
Implementation
Uses UnSQL2;

Function ILeftZero(S:String; Tam:Integer):String;
Var k : Integer;
vacio : string;
begin
vacio := '';
for k := 1 to tam Do vacio := vacio + '0';
Result:=Copy(Vacio+S,(Length(S)+Length(Vacio))-(Tam-1),Tam);
end;

Function IRigthZero(S:String; Tam:Integer):String;
Var k : Integer;
vacio : string;
begin
Vacio :='';
for k := 1 to tam Do vacio := vacio + '0';
Result:=Copy(S+Vacio,1,Tam);
end;



Procedure IStrReplace(Var S:String; SubStr:String; ReplaceWith:String);
var AuxS:String;
    I:Integer;
begin if SubStr='' then Exit;
      I:=Pos(SubStr,S);
      if (I>0) then begin Delete(S,I,Length(SubStr));
                          Insert(S,ReplaceWith,I);
                  end
               else Exit;
      AuxS:=S+' ';
      While (S<>AuxS) do
      begin AuxS:=S;
            IStrReplace(S,SubStr,ReplaceWith);
      end;
end;

Function IEmpresaCorta(S:String):String;
var SS:String;
begin SS:=UpperCase(S);
      IStrReplace(SS,'INTERACCIONES','');
      IStrReplace(SS,', S.A. DE C.V.','');
      IStrReplace(SS,', S.A.','');
      IStrReplace(SS,',S.A. DE C.V.','');
      IStrReplace(SS,'S.A. DE C.V.','');
      IStrReplace(SS,'S.A.','');
      IStrReplace(SS,'C.V.','');
      Result:=SS;
      (*
      if Pos('INTERACCIONES',S)>0
         THEN BEGIN Delete(S,Pos('INTERACCIONES',S),Length('INTERACCIONES'));
              END;
         *)
end;


Constructor TInterNotificador.Create;
begin FLinkeado      :=False;
      FListaNotifica :=Tlist.Create; FListaNotifica.Clear;
      FNotificador   :=nil;
end;

Destructor  TInterNotificador.Destroy;
begin if FNotificador<>nil then FNotificador.EliminaNotifica(Self);
      ExecutaNotifica(WM_INTER_REMOVE,Self);
      if FListaNotifica<>nil then FListaNotifica.Free; FListaNotifica:=nil;
      Inherited;
end;

Procedure TInterNotificador.SetNotificador(Noti:TInterNotificador);
begin if FNotificador<>nil then FNotificador.EliminaNotifica(Self);
      if (Noti<>nil) then Noti.AgregaNotifica(Self);
      FNotificador:=Noti;
end;


Function  TInterNotificador.ProcesaNotifica(Message:TMessage):Boolean;
begin if (Message.Msg=WM_INTER_NOTIFICA)
      then begin WParam:=Message.WParam;
                 LParam:=Message.LParam;
                 if (WParam=WM_INTER_REMOVE) then Notificador:=nil;
                 Result:=True;
           end
      else Result:=False;
end;

Function  TInterNotificador.AgregaNotifica (Objeto:TObject):Boolean;
begin Result:=False;
      if FListaNotifica.IndexOf(Objeto)=-1
      then begin FListaNotifica.Add(Objeto);
                 Result:=True;
           end;
end;

Function  TInterNotificador.EliminaNotifica(Objeto:TObject):Boolean;
var i:Integer;
begin Result:=False;
      I:=FListaNotifica.IndexOf(Objeto);
      if I=-1
      then begin Result:=False;
           end
      else begin FListaNotifica.Delete(I);
                 Result:=True;
           end;
end;

Procedure TInterNotificador.Notifica(Sender:TObject; Message:TMessage);
begin if ProcesaNotifica(Message)
         then if Assigned(OnNotifica) then FOnNotifica(Sender,Message);
end;

Procedure TInterNotificador.ExecutaNotifica(Evento:Integer; Valor:Pointer);
var NotificaMensaje:TMessage;
    i:Integer;
    Obj:TObject;
begin NotificaMensaje.Msg:=WM_INTER_NOTIFICA;
      NotificaMensaje.WParam:=Evento;
      NotificaMensaje.LParam:=LongInt(Valor);
      For i:=0 to FListaNotifica.Count-1 do
      begin TInterNotificador(FListaNotifica[i]).Notifica(Self,NotificaMensaje);
      end;
end;


Constructor EInterForma.Create(Const Msg:String);
begin Inherited Create(#30+Msg);
end;


Function ObtenUsuario:String;
Var
  lpBuffer: lpstr;
  success: Boolean;
  nSize: DWord;
Begin
  nSize := 255;
  Result := '';
  GetMem(lpBuffer, 255);
  try
    success := GetUserName(lpBuffer, nSize);
    if not success then
    MessageDlg('Ocurrio un error al obtener el USUARIO', mtInformation, [mbOK], 0);
    Result := UpperCase(StrPas(lpBuffer));
  finally
    FreeMem(lpBuffer);
  end;
End;



Function LocalizaArchivo(Var FileName:String; cgFindit:String) :Boolean;
Const cgPublic='Public\';
var F:String;
    Ruta:String;
begin LocalizaArchivo:=False;
      if FileExists(FileName) then LocalizaArchivo:=True;
      {$IFNDEF  KMAINDIR}  Ruta:= ExtractFilePath(Application.ExeName); {$ENDIF}
      {$IFDEF  KMAINDIR}   Ruta:= KMAINDIR; {$ENDIF}
      F:=Ruta+FileName;
      if FileExists(F) then begin FileName:=F; LocalizaArchivo:=True; exit; end;
      F:=Ruta+cgFindit+FileName;
      if FileExists(F) then begin FileName:=F; LocalizaArchivo:=True; exit; end;
      F:=ExtractFilePath(ExtractFileDir(Ruta))+cgPublic+cgFindit+FileName;
      if FileExists(F) then begin FileName:=F; LocalizaArchivo:=True; exit; end;
      F:=ExtractFilePath(ExtractFileDir(ExtractFilePath(ExtractFileDir(Ruta))))+cgPublic+cgFindit+FileName;
      if FileExists(F) then begin FileName:=F; LocalizaArchivo:=True; exit; end;
end;


//Funcion para obtener las rutas de los diferentes
//elementos de las aplicaciones.
Function rutas(cual : TpRutas;deDonde:TdeDonde):String;
Var RutaDeAcceso : String;
   i : Integer;
Const
   cgButton     : str40 = 'buttons\';
   cgBMP        : str40 = 'bmps\';
   cgdll        : str40 = 'dlls\';
   cgHelp       : str40 = 'Helps\';
   cgReport     : str40 = 'Reports\';
   cgPublic     : str40 = 'Public\';
Begin
   RutaDeAcceso := ExtractFilePath(Application.ExeName);
   Case DeDonde Of
      RTpublic : Begin
                    i:= Length(RutaDeAcceso)-1;
                    While (i > 1) And (RutaDeAcceso[i]<>'\')Do i := i-1;
                    RutaDeAcceso := copy(RutaDeAcceso,1,i-1)+'\' + cgPublic;
                 End;
   RToutApl    : Begin
                    i:= Length(RutaDeAcceso)-1;
                    While (i > 1) And (RutaDeAcceso[i]<>'\')Do i := i-1;
                    RutaDeAcceso := copy(RutaDeAcceso,1,i-1)+'\';
                 End;
   RToutPub    : Begin
                    i:= Length(RutaDeAcceso)-1;
                    While (i > 1) And (RutaDeAcceso[i]<>'\')Do i := i-1;
                    RutaDeAcceso := copy(RutaDeAcceso,1,i-1)+'\';
                    i:= Length(RutaDeAcceso)-1;
                    While (i > 1) And (RutaDeAcceso[i]<>'\')Do i := i-1;
                    RutaDeAcceso := copy(RutaDeAcceso,1,i-1)+'\' + cgPublic;
                 End;
   End;
   Case cual Of
      RButton  : rutas := RutaDeAcceso+cgButton;
      RBmp     : rutas := RutaDeAcceso+cgBMP;
      RDll     : rutas := RutaDeAcceso+cgDLL;
      RHelp    : rutas := RutaDeAcceso+cgHelp;
      RReport  : rutas := RutaDeAcceso+cgReport;
   End;
End;

Procedure CargaImg( splash : TControl; imagen : string);
Var RDonde:TpRutas;

Begin
   if Splash Is TBitBtn then TBitBtn(Splash).NumGlyphs := 2
      else if Splash Is TSpeedButton then TSpeedButton(Splash).NumGlyphs := 2;

   if Splash is TImage then RDonde:=RBMP else RDonde:=RBUTTON;

   if FileExists(rutas(RDonde,RTaplic) + imagen) then
      BEGIN if Splash Is TImage then
                TImage(Splash).Picture.LoadFromFile(rutas(RDonde,RtAplic) + imagen)
             else
              if Splash Is TBitBtn then
                TBitBtn(Splash).Glyph.LoadFromFile(rutas(RDonde,RtAplic) + imagen)
             else
              if Splash Is TSpeedButton then
                TSpeedButton(Splash).Glyph.LoadFromFile(rutas(RDonde,RtAplic) + imagen)
         END
   else if FileExists(rutas(RDonde,RTpublic) + imagen) then
        begin
             if Splash Is TImage then
                TImage(Splash).Picture.LoadFromFile(rutas(RDonde,RTpublic ) + imagen)
             else
              if Splash Is TBitBtn then
                TBitBtn(Splash).Glyph.LoadFromFile(rutas(RDonde,RTpublic ) + imagen)
             else
              if Splash Is TSpeedButton then
                TSpeedButton(Splash).Glyph.LoadFromFile(rutas(RDonde,RTpublic ) + imagen);
        end
   else
      if FileExists(rutas(RDonde,RToutApl) + imagen) then
         BEGIN if Splash Is TImage then
                TImage(Splash).Picture.LoadFromFile(rutas(RDonde,RToutApl) + imagen)
             else
              if Splash Is TBitBtn then
                TBitBtn(Splash).Glyph.LoadFromFile(rutas(RDonde,RToutApl) + imagen)
             else
              if Splash Is TSpeedButton then
                TSpeedButton(Splash).Glyph.LoadFromFile(rutas(RDonde,RToutApl) + imagen);
         END
   else if FileExists(rutas(RDonde,RToutPub) + imagen) then
        BEGIN if Splash Is TImage then
                TImage(Splash).Picture.LoadFromFile(rutas(RDonde,RToutPub ) + imagen)
             else
              if Splash Is TBitBtn then
                TBitBtn(Splash).Glyph.LoadFromFile(rutas(RDonde,RToutPub ) + imagen)
             else
              if Splash Is TSpeedButton then
                TSpeedButton(Splash).Glyph.LoadFromFile(rutas(RDonde,RToutPub ) + imagen)
        END;
End; {CargaImagen}


Function IntFindFile(Var FileName:String; DeDonde:string):Boolean;
Const cgPublic='public\';
//      cgFindit='FindIt\';
var F:String;
    Ruta:String;
begin IntFindFile:=False;
      if FileExists(FileName) then begin IntFindFile:=True; exit; end;
      {$IFNDEF  KMAINDIR}  Ruta:= ExtractFilePath(Application.ExeName); {$ENDIF}
      {$IFDEF  KMAINDIR}   Ruta:= KMAINDIR; {$ENDIF}
      F:=Ruta+FileName;
      if FileExists(F) then begin FileName:=F; IntFindFile:=True; exit; end;
      F:=Ruta+DeDonde+FileName;
      if FileExists(F) then begin FileName:=F; IntFindFile:=True; exit; end;
      F:=ExtractFilePath(ExtractFileDir(Ruta))+cgPublic+DeDonde+FileName;
      if FileExists(F) then begin FileName:=F; IntFindFile:=True; exit; end;
      F:=ExtractFilePath(ExtractFileDir(ExtractFilePath(ExtractFileDir(Ruta))))+cgPublic+DeDonde+FileName;
      if FileExists(F) then begin FileName:=F; IntFindFile:=True; exit; end;
end;



Procedure CargaImagen( Var splash : TImage; imagen : string);
begin CargaImg(Splash,Imagen);
end;


Procedure CargaBoton( Var sbBotone : TSpeedButton;
                           imagen   : TpBotones);

begin CargaImg(sbBotone,Imagen);
end;

Procedure cargaBitBtn( Var sbBotone : TBitBtn;
                           imagen   : TpBotones);

begin cargaImg(sbBotone, Imagen);
end;

Procedure LimpiaBase(T:TTable);
begin T.DisableControls;
      Try
      T.Active:=True;
      T.First;
      While Not T.EOF do
      begin T.Delete;
      end;
      Finally T.EnableControls;
      end;
end;



Procedure SetEd(T:TDBEdit; CanEdit:Boolean);
begin Case CanEdit of
      True:begin T.Color:=clWindow;
                 T.ReadOnly:=False;
           end;
      False:begin T.Color:=clbtnFace;
                  T.ReadOnly:=True;
            end;
      end;
end;

Procedure SetCB(CB:TComboBox; CanEdit:Boolean);
begin Case CanEdit of
      True:begin CB.Color:=clWindow;
                 CB.Enabled:=True;
           end;
      False:begin CB.Color:=clbtnFace;
                  CB.Enabled:=False;
            end;
      end;
end;


Procedure SetDBrg(T:TDBRadioGroup; CanEdit:Boolean);
begin Case CanEdit of
      True:begin T.Color:=clbtnFace;
                 T.Font.Color:=clNavy;
                 T.ReadOnly:=False;
           end;
      False:begin T.Color:=clbtnFace;
                  T.Font.Color:=clBlack;
                  T.ReadOnly:=True;
            end;
      end;
end;

Procedure SetEdDB1(T:TDBComboBox; CanEdit:Boolean);
begin Case CanEdit of
      True:begin T.Color:=clWindow;
                 T.ReadOnly:=False;
           end;
      False:begin T.Color:=clbtnFace;
                  T.ReadOnly:=True;
            end;
      end;
end;


Procedure SetLook(T:TDBLookupCombo; CanEdit:Boolean);
begin Case CanEdit of
      True:begin T.Color:=clWindow;
                 T.ReadOnly:=False;
           end;
      False:begin T.Color:=clbtnFace;
                  T.ReadOnly:=True;
            end;
      end;
end;



Procedure SetFoco(T:TDBEdit; Grid:TDBGrid);
begin if Grid.SelectedField.FieldName=T.DataField
         then begin if (T.Enabled)and(T.Visible) then T.SetFocus;
              end;
end;

Procedure SetFocoDB1(T:TDBComboBox; Grid:TDBGrid);
begin if Grid.SelectedField.FieldName=T.DataField
         then begin if (T.Enabled)and(T.Visible) then T.SetFocus;
              end;
end;

Procedure SetFocoDBRg(T:TDBRadioGroup; Grid:TDBGrid);
begin if Grid.SelectedField.FieldName=T.DataField
         then begin if (T.Enabled)and(T.Visible) then T.SetFocus;
              end;
end;



Function  BuscaQry(Dat:TQuery; Campo:String; Key:LongInt):Boolean;
begin BuscaQry:=False;
      Dat.DisableControls;
      Try
      Dat.First;
      While Not Dat.EOF do
      begin if Dat.FieldByName(CAMPO).AsInteger=Key
               then begin BuscaQry:=True; exit; end;
            Dat.Next;
      end;
      Dat.First;
      Finally Dat.EnableControls;
      end;
end;


Function VolteaFecha(S:String):String;
var Dia,Mes,Ano:String;
    Vez,i        :Integer;
begin VolteaFecha:='';
      if S='' then exit;
      Vez:=0; Dia:=''; Mes:=''; Ano:='';
      for i:=1 to length(S) do
      begin if S[i]='/' then Inc(Vez)
            else
            Case Vez of
            0:Dia:=Dia+S[i];
            1:Mes:=Mes+S[i];
            2:Ano:=Ano+S[i];
            end;
      end;
      VolteaFecha:=Mes+'/'+Dia+'/'+Ano;
end;


procedure InitLC(P1,P2:TPanel);
begin Panel3:=P1;
      Panel4:=P2;
end;

procedure LH(S:String);
begin if Panel4=Nil then exit;
      if S=''
         then Panel4.Caption:=''
         else Panel4.Caption:=S;
      DoEvents;
end;

procedure LC(S:String);
begin if Panel3=Nil then exit;
      if S=''
         then Panel3.Caption:=''
         else Panel3.Caption:=S;
      DoEvents;
end;


Procedure DoEvents;
Var MSG : TMSG;
begin While PeekMessage(Msg,0,0,0,PM_REMOVE) do
      begin TranslateMessage(Msg);
            DispatchMessage(MSg);
      end;
end;


Procedure  CursorEspera;
begin DoEvents;
      SetCursor(LoadCursor(0,idc_Wait));
end;

Procedure  CursorNormal;
begin DoEvents;
      SetCursor(LoadCursor(0,idc_Arrow));
end;

Function NoSP(S:String):String;
Var L:String;
    i:Integer;
begin L:='';
      for i:=1 to Length(s) do
          if S[i]<>' ' then L:=L+S[i];
      NoSP:=L;
end;

Function FillRightCero(S:String; Tam:Integer):String;
Var L:String;
    i:Integer;
begin L:=S;
      for i:=1 to Tam-Length(s) do
          L:='0'+L;
      FillRightCero:=L;
end;

Procedure InsFindStr(DAT:TTable;  S:String; Campo:String);
begin Dat.SetKey;
      Dat.FieldByName(Campo).AsString:=S;
      if Not DAT.GotoKey
         then begin DAT.Append;
                    DAT.FieldByName(Campo).AsString:=S;
                    DAT.Post;
              end;
end;


Function TimeValido(Var DT:TDateTime; Text:String):Boolean;
Var SH,SM,SS:String;
    LH,LM,LS:Integer;
    WH,WM,WS,WMM:Word;
    EH,EM,ES:Integer;
    SP:String;
    RT:TDateTime;
begin TimeValido:=False;
      DT:=StrToTime('00:00:00');
      if Length(Text)<8 then begin MessageBeep(1); Exit; end;
      SH:=Copy(Text,1,2); SM:=Copy(Text,4,2); SS:=Copy(Text,7,2);
      if (SH='  ')and(SM='  ')and(SS='  ') then begin MessageBeep(1); Exit; end;
      Val(SH,LH,EH); Val(SM,LM,EM); Val(SS,LS,ES);
      if (SH='  ') then EH:=1; if (SM='  ') then EM:=1; if (SS='  ') then ES:=1;
      if (EH<>0)and(EM<>0)and(ES<>0) then begin MessageBeep(1); Exit; End;
      if (EH=0)and(EM<>0)and(ES=0)
         then begin LM:=0; end
         else begin SP:=FillRightCero(NoSP(SH)+NoSP(SM)+NoSP(SS),6);
                    SH:=Copy(SP,1,2); SM:=Copy(SP,3,2); SS:=Copy(SP,5,2);
                    Val(SH,LH,EH); Val(SM,LM,EM); Val(SS,LS,ES);
                    if (EH<>0)and(EM<>0)and(ES<>0) then begin MessageBeep(1); Exit; End;
              end;
      if LS>=60 then begin LM:=LM+LS div 60; LS:=LS Mod 60; end;
      if LM>=60 then begin LH:=LH+LM div 60; LM:=LM Mod 60; end;
      if LH>23 then begin LH:=23; MessageBeep(1); end;
      DT:=EncodeTime(LH,LM,LS,00);
      DecodeTime(DT,WH,WM,WS,WMM);
      RT:=EncodeDate(99,12,30);
      DT:=DT+RT;
      TimeValido:=True;
end;

Procedure DatNext(Dat:TDataSet);
begin if Not Dat.EOF
         then begin Dat.Next;
                    if Dat.EOF then begin Dat.Last; MessageBeep(1); end;
              end
         else MessageBeep(1);
end;

Procedure DatPrior(Dat:TDataSet);
begin if Not Dat.BOF
         then begin Dat.Prior;
                    if Dat.BOF then begin Dat.First; MessageBeep(1); end;
              end
         else MessageBeep(1);
end;


Procedure DatKeyUp(Dat:TDataSet; Var Key:Word; CanEdit:Boolean);
begin if CanEdit=False
         then begin if Key=VK_DOWN then begin DatNext(Dat); Key:=0; end;
                    if Key=VK_Up then begin DatPrior(Dat); Key:=0; end;
              end;
end;


Function EnSeg(DT:TDateTime):LongInt;
Var WH,WM,WS,WMM:Word;
begin DecodeTime(DT,WH,WM,WS,WMM);
      EnSeg:=WH*3600+WM*60+WS;
end;

Function DameCampoGrid(Grid:TwwDBGrid):String;
begin if (Grid<>Nil) and (Grid.SelectedField<>Nil)
         then DameCampoGrid:=Grid.SelectedField.FieldName
         else DameCampoGrid:='';
end;

Function IsEnabled(Hijo:TObject):Boolean;
begin If (Hijo Is TControl) then
       begin With Hijo as TControl do
             begin if HasParent then
                      begin IsEnabled:=((Visible) and (Enabled)) and (IsEnabled(Parent));
                      end
                  else
                      begin IsEnabled:=((Visible) and (Enabled));
                      end;
            end
       end
      else IsEnabled:=False;
end;



Function IsFocusControl(Hijo:TObject):Boolean;
Var Gpo:TGroupBox;
    ActivoOK:Boolean;
    i:Integer;
begin If (Hijo Is TGroupBox) then
       begin Gpo:=TGroupBox(Hijo);
             ActivoOK:=False;
             For i:=0 to Gpo.ControlCount-1 do
             begin if TWinControl(Gpo.Controls[i]).Enabled then ActivoOK:=True;
             end;
             (*
             For i:=0 to Gpo.ComponentCount-1 do
             begin if TComponent(Gpo.Components[i]).Enabled then ActivoOK:=True;
             end;
             *)
             Result:=ActivoOK;
       end
      else Result:=True;
end;


(*
RGB(GetRValue(100)
                               ,GetGValue(100)
                               ,GetBValue(100)
                               );
*)

//$00FFF8F8;



Procedure CambiaComp(Comp:TComponent; Caso:Integer; Habilita:Boolean; IsNewData:Boolean; Grid:TwwDBGrid);
Var Ena:Boolean;
begin Ena:=False;
      With Comp do
      begin
                  if Comp is TButton then
                  With TButton(Comp) do
                  begin if Tag and Caso = Caso then
                           begin if (Tag and 1)=1 then Ena:=Not Habilita;
                                 if (Tag and 2)=2 then Ena:=Habilita;
                                 if (Not IsNewData)and((Tag and 32)=32) then Ena:=False;
                                 Default:=False; Cancel:=False;
                                 Enabled:=Ena;
                                 if Ena then
                                 begin {Color:=clWindow;}
                                       if (Tag and 4)=4 then Default:=True;
                                       if (Tag and 8)=8 then Cancel:=True;
                                 end
                                 else {Color:=clbtnFace};
                                 {ReadOnly:=Ena;}
                                 if (Tag and 64)=64 then Visible:=Ena;
                                 if (Enabled) and ((Tag and 128)=128) and (IsEnabled(Comp))
                                    then SetFocus;
                           end;
                       Exit;
                  end else
                  if Comp is TBitBtn then
                  With TBitBtn(Comp) do
                  begin if Tag and Caso = Caso then
                           begin if (Tag and 1)=1 then Ena:=Not Habilita;
                                 if (Tag and 2)=2 then Ena:=Habilita;
                                 if (Not IsNewData)and((Tag and 32)=32) then Ena:=False;
                                 Default:=False; Cancel:=False;
                                 Enabled:=Ena;
                                 if Ena then
                                 begin {Color:=clWindow};
                                       if (Tag and 4)=4 then Default:=True;
                                       if (Tag and 8)=8 then Cancel:=True;
                                 end
                                 else {Color:=clbtnFace};
                                 {ReadOnly:=Ena;}
                                 if (Tag and 64)=64 then Visible:=Ena;
                                 if (Enabled) and ((Tag and 128)=128) and (IsEnabled(Comp))
                                    then SetFocus;
                           end;
                       Exit;
                  end  else
                 if Comp is TDBEdit then
                  With TDBEdit(Comp) do
                  begin if Tag and Caso = Caso then
                           begin if (Tag and 1)=1 then Ena:=Not Habilita;
                                 if (Tag and 2)=2 then Ena:=Habilita;

                                 if (Not IsNewData)and((Tag and 32)=32) then Ena:=False;

                                 if Ena then
                                 begin Color:=clWindow;
                                       //if (Tag and 4)=4 then {Default:=True};
                                       //if (Tag and 8)=8 then {Cancel:=True};
                                 end
                                 else Color:=clbtnFace;

                                 ReadOnly:=Not Ena;
                                 if (Grid<>Nil) and (Grid.Visible) and (Grid.SelectedField<>Nil) and (Grid.DataSource=DataSource)
                                 and (Grid.SelectedField.FieldName=DataField)
                                 then begin if (IsEnabled(Comp)) and (Not ReadOnly)
                                            then begin SetFocus; end;
                                      end;
                                 if (Tag and 64)=64 then Visible:=Ena;
                                 if (IsEnabled(Comp)) and ((Tag and 128)=128)
                                    then SetFocus;
                                 if ((Tag and 2048)=2048) and (Ena) then Color:=ColorRequiered; //VIC1
                           end;
                       Exit;
                  end  else
                if Comp is TEdit then
                  With TEdit(Comp) do
                  begin if Tag=-1
                           then begin ReadOnly:=True;
                                      Color:=clBtnFace;
                                      Exit;
                                end;
                        if Tag and (512+1024)=(512+1024)
                           then begin ReadOnly:=True;
                                      Color:=ColorLinkit;
                                      Exit;
                                end;

                        if Tag and Caso = Caso then
                           begin if (Tag and 1)=1 then Ena:=Not Habilita;
                                 if (Tag and 2)=2 then Ena:=Habilita;

                                 if (Not IsNewData)and((Tag and 32)=32) then Ena:=False;

                                 if Ena then
                                 begin Color:=clWindow;
                                       //if (Tag and 4)=4 then {Default:=True};
                                       //if (Tag and 8)=8 then {Cancel:=True};
                                 end
                                 else Color:=clbtnFace;

                                 ReadOnly:=Not Ena;
                                 //if (Grid<>Nil) and (Grid.Visible) and (Grid.SelectedField<>Nil)
                                 //then begin if Enabled and Visible and (Not ReadOnly)
                                 //           then begin SetFocus; end;
                                 //     end;
                                 if (Tag and 64)=64 then Visible:=Ena;
                                 if (IsEnabled(Comp)) and ((Tag and 128)=128)
                                    then SetFocus;
                                 if ((Tag and 512)=512) and (Not Ena) then Color:=ColorLinkit; //VIC1
                                 if ((Tag and 2048)=2048) and (Ena) then Color:=ColorRequiered; //VIC1
                           end;
                       Exit;
                  end   else
                if Comp is TMemo then
                  With TMemo(Comp) do
                  begin if Tag and Caso = Caso then
                           begin if Tag=-1
                                 then begin ReadOnly:=True;
                                            Color:=clBtnFace;
                                            Exit;
                                      end;
                                 if (Tag and 1)=1 then Ena:=Not Habilita;
                                 if (Tag and 2)=2 then Ena:=Habilita;

                                 if (Not IsNewData)and((Tag and 32)=32) then Ena:=False;

                                 if Ena then
                                 begin Color:=clWindow;
                                       //if (Tag and 4)=4 then {Default:=True};
                                       //if (Tag and 8)=8 then {Cancel:=True};
                                 end
                                 else Color:=clbtnFace;

                                 ReadOnly:=Not Ena;
                                 //if (Grid<>Nil) and (Grid.Visible) and (Grid.SelectedField<>Nil)
                                 //then begin if Enabled and Visible and (Not ReadOnly)
                                 //           then begin SetFocus; end;
                                 //     end;
                                 if (Tag and 64)=64 then Visible:=Ena;
                                 if (IsEnabled(Comp)) and ((Tag and 128)=128)
                                    then SetFocus;
                                 if ((Tag and 2048)=2048) and (Ena) then Color:=ColorRequiered; //VIC1
                           end;
                       Exit;
                  end   else
                if Comp is TInterEdit then
                  With TInterEdit(Comp) do
                  begin if Tag=-1
                           then begin ReadOnly:=True;
                                      Color:=clBtnFace;
                                      //Visible:=True;
                                      Exit;
                                end;
                        if Tag and (512+1024)=(512+1024)
                           then begin ReadOnly:=True;
                                      Color:=ColorLinkit;
                                      Exit;
                                end;
                        if Tag and Caso = Caso then
                           begin if (Tag and 1)=1 then Ena:=Not Habilita;
                                 if (Tag and 2)=2 then Ena:=Habilita;

                                 if (Not IsNewData)and((Tag and 32)=32) then Ena:=False;

                                 if Ena then
                                 begin Color:=clWindow;
                                       //if (Tag and 4)=4 then {Default:=True};
                                       //if (Tag and 8)=8 then {Cancel:=True};
                                 end
                                 else Color:=clbtnFace;

                                 ReadOnly:=Not Ena;
                                 //if (Grid<>Nil) and (Grid.Visible) and (Grid.SelectedField<>Nil)
                                 //then begin if Enabled and Visible and (Not ReadOnly)
                                 //           then begin SetFocus; end;
                                 //     end;
                                 if (Tag and 64)=64 then Visible:=Ena;
                                 if (IsEnabled(Comp)) and ((Tag and 128)=128)
                                    then SetFocus;
                                 if ((Tag and 512)=512) and (Not Ena) then Color:=ColorLinkit; //VIC1
                                 if ((Tag and 2048)=2048) and (Ena) then Color:=ColorRequiered; //VIC1
                           end;
                        Exit;
                  end   else
                if Comp is TComboBox then
                  With TComboBox(Comp) do
                  begin if Tag=-1
                           then begin Enabled:=False; //ReadOnly:=True;
                                      Color:=clBtnFace;
                                      //Visible:=True;
                                      Exit;
                                end;
                        if Tag and (512+1024)=(512+1024)
                           then begin //ReadOnly:=True;
                                      Color:=ColorLinkit;
                                      Exit;
                                end;
                        if Tag and Caso = Caso then
                           begin if (Tag and 1)=1 then Ena:=Not Habilita;
                                 if (Tag and 2)=2 then Ena:=Habilita;

                                 if (Not IsNewData)and((Tag and 32)=32) then Ena:=False;

                                 if Ena then
                                 begin Color:=clWindow;
                                       //if (Tag and 4)=4 then {Default:=True};
                                       //if (Tag and 8)=8 then {Cancel:=True};
                                 end
                                 else Color:=clBtnFace;

                                 //ReadOnly:=Not Ena;
                                 Enabled:=Ena;
                                 //if (Grid<>Nil) and (Grid.Visible) and (Grid.SelectedField<>Nil)
                                 //then begin if Enabled and Visible and (Not ReadOnly)
                                 //           then begin SetFocus; end;
                                 //     end;
                                 if (Tag and 64)=64 then Visible:=Ena;
                                 if (IsEnabled(Comp)) and ((Tag and 128)=128)
                                    then SetFocus;
                                 if ((Tag and 2048)=2048) and (Ena) then Color:=ColorRequiered; //VIC1
                           end;
                       Exit;
                  end   else
                  if Comp is TCheckBox then
                  With TCheckBox(Comp) do
                  begin if Tag=-1
                           then begin Enabled:=False; //ReadOnly:=True;
                                      Color:=clBtnFace;
                                      //Visible:=True;
                                      Exit;
                                end;
                        if Tag and (512+1024)=(512+1024)
                           then begin //ReadOnly:=True;
                                      Color:=ColorLinkit;
                                      Exit;
                                end;
                        if Tag and Caso = Caso then
                           begin if (Tag and 1)=1 then Ena:=Not Habilita;
                                 if (Tag and 2)=2 then Ena:=Habilita;

                                 if (Not IsNewData)and((Tag and 32)=32) then Ena:=False;

                                 if Ena then
                                 begin Color:=clBtnFace;
                                       //if (Tag and 4)=4 then {Default:=True};
                                       //if (Tag and 8)=8 then {Cancel:=True};
                                 end
                                 else Color:=clBtnFace;

                                 //ReadOnly:=Not Ena;
                                 Enabled:=Ena;
                                 //if (Grid<>Nil) and (Grid.Visible) and (Grid.SelectedField<>Nil)
                                 //then begin if Enabled and Visible and (Not ReadOnly)
                                 //           then begin SetFocus; end;
                                 //     end;
                                 if (Tag and 64)=64 then Visible:=Ena;
                                 if (IsEnabled(Comp)) and ((Tag and 128)=128)
                                    then SetFocus;
                                 if ((Tag and 2048)=2048) and (Ena) then Color:=ColorRequiered; //VIC1
                           end;
                       Exit;
                  end   else
                  if Comp is TRadioGroup then
                  With TRadioGroup(Comp) do
                  begin if Tag=-1
                           then begin Enabled:=False; //ReadOnly:=True;
                                      Color:=clBtnFace;
                                      //Visible:=True;
                                      Exit;
                                end;
                        if Tag and (512+1024)=(512+1024)
                           then begin //ReadOnly:=True;
                                      Color:=ColorLinkit;
                                      Exit;
                                end;
                        if Tag and Caso = Caso then
                           begin if (Tag and 1)=1 then Ena:=Not Habilita;
                                 if (Tag and 2)=2 then Ena:=Habilita;

                                 if (Not IsNewData)and((Tag and 32)=32) then Ena:=False;

                                 if Ena then
                                 begin Color:=clBtnFace;
                                       //if (Tag and 4)=4 then {Default:=True};
                                       //if (Tag and 8)=8 then {Cancel:=True};
                                 end
                                 else Color:=clBtnFace;

                                 //ReadOnly:=Not Ena;
                                 Enabled:=Ena;
                                 //if (Grid<>Nil) and (Grid.Visible) and (Grid.SelectedField<>Nil)
                                 //then begin if Enabled and Visible and (Not ReadOnly)
                                 //           then begin SetFocus; end;
                                 //     end;
                                 if (Tag and 64)=64 then Visible:=Ena;
                                 if (IsEnabled(Comp)) and ((Tag and 128)=128)
                                    then SetFocus;
                                 if ((Tag and 2048)=2048) and (Ena) then Color:=ColorRequiered; //VIC1
                           end;
                       Exit;
                  end   else
                  if Comp is TMaskEdit then
                  With TMaskEdit(Comp) do
                  begin if Tag=-1
                           then begin ReadOnly:=True;
                                      Color:=clBtnFace;
                                      //Visible:=True;
                                      Exit;
                                end;
                        if Tag and (512+1024)=(512+1024)
                           then begin ReadOnly:=True;
                                      Color:=ColorLinkit;
                                      Exit;
                                end;
                        if Tag and Caso = Caso then
                           begin if (Tag and 1)=1 then Ena:=Not Habilita;
                                 if (Tag and 2)=2 then Ena:=Habilita;

                                 if (Not IsNewData)and((Tag and 32)=32) then Ena:=False;

                                 if Ena then
                                 begin Color:=clWindow;
                                       //if (Tag and 4)=4 then {Default:=True};
                                       //if (Tag and 8)=8 then {Cancel:=True};
                                 end
                                 else Color:=clbtnFace;

                                 ReadOnly:=Not Ena;
                                // Enabled:=Ena;
                                 //if (Grid<>Nil) and (Grid.Visible) and (Grid.SelectedField<>Nil)
                                 //then begin if Enabled and Visible and (Not ReadOnly)
                                 //           then begin SetFocus; end;
                                 //     end;
                                 if (Tag and 64)=64 then Visible:=Ena;
                                 if (IsEnabled(Comp)) and ((Tag and 128)=128)
                                    then SetFocus;
                                 if ((Tag and 2048)=2048) and (Ena) then Color:=ColorRequiered; //VIC1
                           end;
                       Exit;
                  end   else
                if Comp is TwwDBLookupCombo then
                  With TwwDBLookupCombo(Comp) do
                  begin if Tag and Caso = Caso then
                           begin if (Tag and 1)=1 then Ena:=Not Habilita;
                                 if (Tag and 2)=2 then Ena:=Habilita;
                                 if (Not IsNewData)and((Tag and 32)=32) then Ena:=False;

                                 if Ena then
                                 begin Color:=clWindow;
                                       //if (Tag and 4)=4 then {Default:=True};
                                       //if (Tag and 8)=8 then {Cancel:=True};
                                 end
                                 else Color:=clbtnFace;
                                 ReadOnly:=Not Ena;
                                 Enabled:=Ena;
                                 if (Grid<>Nil) and (Grid.Visible) and (Grid.SelectedField<>Nil)
                                    and (Grid.DataSource=DataSource) and (Grid.SelectedField.FieldName=DataField)
                                            then begin if (IsEnabled(Comp)) and (Not ReadOnly)
                                                       then begin SetFocus; end;
                                                 end;
                                if (Tag and 64)=64 then Visible:=Ena;
                                 if (IsEnabled(Comp)) and ((Tag and 128)=128)
                                    then SetFocus;
                                 if ((Tag and 2048)=2048) and (Ena) then Color:=ColorRequiered; //VIC1
                           end;
                       Exit;
                  end   else
                  if Comp is TwwDBComboDLG then
                  With TwwDBComboDLG(Comp) do
                  begin if Tag and Caso = Caso then
                           begin if (Tag and 1)=1 then Ena:=Not Habilita;
                                 if (Tag and 2)=2 then Ena:=Habilita;
                                 if (Not IsNewData)and((Tag and 32)=32) then Ena:=False;

                                 if Ena then
                                 begin Color:=clWindow;
                                       //if (Tag and 4)=4 then {Default:=True};
                                       //if (Tag and 8)=8 then {Cancel:=True};
                                 end
                                 else Color:=clbtnFace;
                                 ReadOnly:=Not Ena;
                                 Enabled:=Ena;
                                 if (Grid<>Nil) and (Grid.Visible) and (Grid.SelectedField<>Nil)
                                    and (Grid.DataSource=DataSource) and (Grid.SelectedField.FieldName=DataField)
                                            then begin if (IsEnabled(Comp)) and (Not ReadOnly)
                                                       then begin SetFocus; end;
                                                 end;
                                if (Tag and 64)=64 then Visible:=Ena;
                                 if (IsEnabled(Comp)) and ((Tag and 128)=128)
                                    then SetFocus;
                                 if ((Tag and 2048)=2048) and (Ena) then Color:=ColorRequiered; //VIC1
                           end;
                       Exit;
                  end   else
                  if Comp is TwwDBComboBox then
                  With TwwDBComboBox(Comp) do
                  begin if Tag and Caso = Caso then
                           begin if (Tag and 1)=1 then Ena:=Not Habilita;
                                 if (Tag and 2)=2 then Ena:=Habilita;
                                 if (Not IsNewData)and((Tag and 32)=32) then Ena:=False;

                                 if Ena then
                                 begin Color:=clWindow;
                                       //if (Tag and 4)=4 then {Default:=True};
                                       //if (Tag and 8)=8 then {Cancel:=True};
                                 end
                                 else Color:=clbtnFace;
                                 ReadOnly:=Not Ena;
                                 Enabled:=Ena;
                                 if (Grid<>Nil) and (Grid.Visible) and (Grid.SelectedField<>Nil)
                                    and (Grid.DataSource=DataSource) and (Grid.SelectedField.FieldName=DataField)
                                            then begin if (IsEnabled(Comp)) and (Not ReadOnly)
                                                       then begin SetFocus; end;
                                                 end;
                                if (Tag and 64)=64 then Visible:=Ena;
                                 if (IsEnabled(Comp)) and ((Tag and 128)=128)
                                    then SetFocus;
                                if ((Tag and 2048)=2048) and (Ena) then Color:=ColorRequiered; //VIC1
                           end;
                       Exit;
                  end   else
                if Comp is TDBMemo then
                 With TDBMemo(Comp) do
                  begin if Tag and Caso = Caso then
                           begin if (Tag and 1)=1 then Ena:=Not Habilita;
                                 if (Tag and 2)=2 then Ena:=Habilita;
                                 if (Not IsNewData)and((Tag and 32)=32) then Ena:=False;

                                 if Ena then
                                 begin Color:=clWindow;
                                       //if (Tag and 4)=4 then {Default:=True};
                                       //if (Tag and 8)=8 then {Cancel:=True};
                                 end
                                 else Color:=clbtnFace;
                                 ReadOnly:=Not Ena;
                                 if (Grid<>Nil) and (Grid.Visible) and (Grid.SelectedField<>Nil) and (Grid.DataSource=DataSource)
                                 and (Grid.SelectedField.FieldName=DataField)
                                 then begin if (IsEnabled(Comp)) and (Not ReadOnly)
                                            then begin SetFocus; end;
                                      end;
                                 if (Tag and 64)=64 then Visible:=Ena;
                                 if (IsEnabled(Comp)) and ((Tag and 128)=128)
                                    then SetFocus;
                                 if ((Tag and 2048)=2048) and (Ena) then Color:=ColorRequiered; //VIC1
                           end;
                      Exit;
                  end   else
                 if Comp is TwwDBEdit then
                  With TwwDBEdit(Comp) do
                  begin if Tag and Caso = Caso then
                           begin if (Tag and 1)=1 then Ena:=Not Habilita;
                                 if (Tag and 2)=2 then Ena:=Habilita;
                                 if (Not IsNewData)and((Tag and 32)=32) then Ena:=False;

                                 if Ena then
                                 begin Color:=clWindow;
                                       //if (Tag and 4)=4 then {Default:=True};
                                       //if (Tag and 8)=8 then {Cancel:=True};
                                 end
                                 else Color:=clbtnFace;
                                 TwwDBEdit(Comp).ReadOnly:=Not Ena;
                                 if (Grid<>Nil) and (Grid.Visible) and (Grid.SelectedField<>Nil) and (Grid.DataSource=DataSource)
                                 and (Grid.SelectedField.FieldName=DataField)
                                 then begin if (TwwDBEdit(Comp).Enabled) and (TwwDBEdit(Comp).Visible) and (Not TwwDBEdit(Comp).ReadOnly) and (Ena)
                                            then begin TwwDBEdit(Comp).SetFocus; end;
                                      end;
                                 if (Tag and 64)=64 then Visible:=Ena;
                                 if (Enabled) and ((Tag and 128)=128) and (Visible)
                                    then SetFocus;
                                 if ((Tag and 2048)=2048) and (Ena) then Color:=ColorRequiered; //VIC1
                           end;
                       Exit;
                  end   else
                 if Comp is TDBRadioGroup  then
                  With TDBRadioGroup(Comp) do
                  begin if Tag and Caso = Caso then
                           begin if (Tag and 1)=1 then Ena:=Not Habilita;
                                 if (Tag and 2)=2 then Ena:=Habilita;
                                 if (Not IsNewData)and((Tag and 32)=32) then Ena:=False;
                                 {Default:=False; Cancel:=False;}
                                 if Ena then
                                 begin Color:=clbtnFace;
                                       //if (Tag and 4)=4 then {Default:=True};
                                       //if (Tag and 8)=8 then {Cancel:=True};
                                 end
                                 else Color:=clbtnFace;
                                 ReadOnly:=Not Ena;
                                 if (Grid<>Nil) and (Grid.Visible) and (Grid.SelectedField<>Nil) and (Grid.DataSource=DataSource)
                                 and (Grid.SelectedField.FieldName=DataField)
                                 then begin if (IsEnabled(Comp))
                                            then begin SetFocus;
                                                 end;
                                      end;
                                 if (Tag and 64)=64 then Visible:=Ena;
                                 if (IsEnabled(Comp)) and ((Tag and 128)=128)
                                    then SetFocus;
                                 if ((Tag and 2048)=2048) and (Ena) then Color:=ColorRequiered; //VIC1
                           end;
                      Exit;
                  end   else
                  if Comp is TDBCheckBox then
                  With TDBCheckBox (Comp) do
                  begin if Tag and Caso = Caso then
                           begin if (Tag and 1)=1 then Ena:=Not Habilita;
                                 if (Tag and 2)=2 then Ena:=Habilita;
                                 if (Not IsNewData)and((Tag and 32)=32) then Ena:=False;
                                 {Default:=False; Cancel:=False;}
                                 if Ena then
                                 begin Color:=clbtnFace;
                                       //if (Tag and 4)=4 then {Default:=True};
                                       //if (Tag and 8)=8 then {Cancel:=True};
                                 end
                                 else Color:=clbtnFace;
                                 Enabled:=Ena;
                                 ReadOnly:=Not Ena;
                                 if (Grid<>Nil) and (Grid.Visible) and (Grid.SelectedField<>Nil) and (Grid.DataSource=DataSource)
                                 and (Grid.SelectedField.FieldName=DataField)
                                 then begin if (IsEnabled(Comp))
                                            then begin SetFocus; DoEvents;
                                                 end;
                                      end;
                                 if (Tag and 64)=64 then Visible:=Ena;
                                 if (IsEnabled(Comp)) and ((Tag and 128)=128)
                                    then SetFocus;
                                 if ((Tag and 2048)=2048) and (Ena) then Color:=ColorRequiered; //VIC1
                           end;
                       Exit;
                  end   else

                  if Comp is TDBGrid then
                  With TDBGrid(Comp) do
                  begin if Tag and Caso = Caso then
                           begin if (Tag and 1)=1 then Ena:=Not Habilita;
                                 if (Tag and 2)=2 then Ena:=Habilita;
                                 if (Not IsNewData)and((Tag and 32)=32) then Ena:=False;
                                 if Ena then
                                 begin Color:=clWindow;
                                       //if (Tag and 4)=4 then {Default:=True};
                                       //if (Tag and 8)=8 then {Cancel:=True};
                                 end
                                 else Color:=clbtnFace;
                                 Enabled:=Ena;
                                 if (Tag and 64)=64 then Visible:=Ena;
                                 if (IsEnabled(Comp)) and ((Tag and 128)=128)
                                    then SetFocus;
                           end;
                      Exit;
                  end   else
                  if Comp is TwwDBGrid then
                  With TwwDBGrid(Comp) do
                  begin if Tag and Caso = Caso then
                           begin if (Tag and 1)=1 then Ena:=Not Habilita;
                                 if (Tag and 2)=2 then Ena:=Habilita;
                                 if (Not IsNewData)and((Tag and 32)=32) then Ena:=False;
                                 if Ena then
                                 begin {Color:=clWindow;}
                                       //if (Tag and 4)=4 then {Default:=True};
                                       //if (Tag and 8)=8 then {Cancel:=True};
                                 end
                                 else {Color:=clbtnFace};
                                 Enabled:=Ena;
                                 if (Tag and 64)=64 then Visible:=Ena;
                                 if (IsEnabled(Comp)) and ((Tag and 128)=128)
                                    then SetFocus;
                           end;
                      Exit;
                  end   else
                  if Comp is TDBNavigator then
                  With TDBNavigator(Comp) do
                  begin if Tag and Caso = Caso then
                           begin if (Tag and 1)=1 then Ena:=Not Habilita;
                                 if (Tag and 2)=2 then Ena:=Habilita;
                                 if (Not IsNewData)and((Tag and 32)=32) then Ena:=False;
                                 if Ena then
                                 begin {Color:=clWindow;}
                                       //if (Tag and 4)=4 then {Default:=True};
                                       //if (Tag and 8)=8 then {Cancel:=True};
                                 end
                                 else {Color:=clbtnFace};
                                 Enabled:=Ena;
                                 if (Tag and 64)=64 then Visible:=Ena;
                                 if (IsEnabled(Comp)) and ((Tag and 128)=128)
                                    then SetFocus;
                           end;
                      Exit;
                  end   else
                  if Comp is TControl then
                  With TControl(Comp) do
                  begin  if Tag=-1
                          then begin Enabled:=False;
                                     //Color:=clBtnFace;
                                     Exit;
                               end;
                         if Tag and (512+1024)=(512+1024)
                           then begin Enabled:=True;
                                      //Color:=cl3DLight;
                                      Exit;
                                end;

                           if Tag and Caso = Caso then
                           begin if (Tag and 1)=1 then Ena:=Not Habilita;
                                 if (Tag and 2)=2 then Ena:=Habilita;
                                 if (Not IsNewData)and((Tag and 32)=32) then Ena:=False;
                                 //if Ena then
                                 //begin Color:=clWindow;
                                 //end
                                 //else Color:=clbtnFace;
                                 Enabled:=Ena;
                                 if (Tag and 64)=64 then Visible:=Ena;
                           end;
                      Exit;
                  end;
          end;
end;


Function IsParent(Hijo:TObject; Padre:TComponent):Boolean;
begin if Hijo=Padre
      then IsParent:=True
      else begin If (Hijo Is TControl) then
                 begin
                 if (TControl(Hijo).HasParent)
                    then IsParent:=IsParent(TControl(Hijo).Parent,Padre)
                    else IsParent:=False
                 end
                 else IsParent:=False;

           end;
end;



Procedure Cambia(Forma:TComponent; Padre:TComponent; Caso:Integer; Habilita:Boolean; IsNewData:Boolean; Grid:TwwDBGrid);
Var i,j:Integer;
begin With Forma do
      begin
            for I := 0 to ComponentCount  -1 do
            begin
            if Not IsParent(Components[i],Padre) then   Continue;
               CambiaComp(Components[i], Caso, Habilita, IsNewData, Grid);
               if (Components[i].Tag<>-1)
                  then Cambia(Components[i],Padre,Caso,Habilita,IsNewData,Grid);
               if (Components[i] is TWinControl)
                  then begin for j := 0 to TWinControl(Components[i]).ControlCount-1 do
                             begin if Not IsParent(TWinControl(Components[i]).Controls[j],Padre) then   Continue;
                                    Cambia(TWinControl(Components[i]).Controls[j], Padre,Caso, Habilita, IsNewData, Grid);
                              //if (Controls[i].Tag<>-1) then Cambia(Controls[i],Padre,Caso,Habilita,IsNewData,Grid);
                              end;
                              //Cambia(Components[i],Padre,Caso,Habilita,IsNewData,Grid);
                       end;
            end;
            (*
            if Forma is TWinControl
            then begin With TWinControl(Forma) do
                       begin for I := 0 to ControlCount-1 do
                             begin if Not IsParent(Controls[i],Padre) then   Continue;
                                    Cambia(Controls[i], Padre,Caso, Habilita, IsNewData, Grid);
                              //if (Controls[i].Tag<>-1) then Cambia(Controls[i],Padre,Caso,Habilita,IsNewData,Grid);
                              end;
                       end;
             end;
             *)
      end;

end;
 (*

//            Cambia(Forma,Components[i],Caso,Habilita,Grid);

          begin //CambiaComp(Components[I],Caso,Habilita,Grid);

                if Components[I] is TDBEdit then
                  With TDBEdit(Components[I]) do
                  begin if Tag and Caso = Caso then
                           begin if (Tag and 1)=1 then Ena:=Not Habilita;
                                 if (Tag and 2)=2 then Ena:=Habilita;
                                 if Ena then
                                 begin Color:=clWindow;
                                       //if (Tag and 4)=4 then {Default:=True};
                                       //if (Tag and 8)=8 then {Cancel:=True};
                                 end
                                 else Color:=clbtnFace;
                                 ReadOnly:=Not Ena;
                                 if (Grid<>Nil) and (Grid.Visible) and (Grid.SelectedField<>Nil) and (Grid.DataSource=DataSource)
                                 and (Grid.SelectedField.FieldName=DataField)
                                 then begin if Enabled and Visible and (Not ReadOnly)
                                            then begin SetFocus; end;
                                      end;
                           end;
                       Continue;
                  end;
                if Components[I] is TwwDBLookupCombo then
                  With TwwDBLookupCombo(Components[I]) do
                  begin if Tag and Caso = Caso then
                           begin if (Tag and 1)=1 then Ena:=Not Habilita;
                                 if (Tag and 2)=2 then Ena:=Habilita;
                                 if Ena then
                                 begin Color:=clWindow;
                                       //if (Tag and 4)=4 then {Default:=True};
                                       //if (Tag and 8)=8 then {Cancel:=True};
                                 end
                                 else Color:=clbtnFace;
                                 ReadOnly:=Not Ena;
                                 if (Grid<>Nil) and (Grid.Visible) and (Grid.SelectedField<>Nil)
                                    and (Grid.DataSource=DataSource) and (Grid.SelectedField.FieldName=DataField)
                                            then begin if Enabled and Visible and (Not ReadOnly)
                                                       then begin SetFocus; end;
                                                 end;
                           end;
                       Continue;
                  end;

                if Components[I] is TDBMemo then
                 With TDBMemo(Components[I]) do
                  begin if Tag and Caso = Caso then
                           begin if (Tag and 1)=1 then Ena:=Not Habilita;
                                 if (Tag and 2)=2 then Ena:=Habilita;
                                 if Ena then
                                 begin Color:=clWindow;
                                       //if (Tag and 4)=4 then {Default:=True};
                                       //if (Tag and 8)=8 then {Cancel:=True};
                                 end
                                 else Color:=clbtnFace;
                                 ReadOnly:=Not Ena;
                                 if (Grid<>Nil) and (Grid.Visible) and (Grid.SelectedField<>Nil) and (Grid.DataSource=DataSource)
                                 and (Grid.SelectedField.FieldName=DataField)
                                 then begin if Enabled and Visible and (Not ReadOnly)
                                            then begin SetFocus; end;
                                      end;
                           end;
                      Continue;
                  end;

                 if Components[I] is TwwDBEdit then
                  With TwwDBEdit(Components[I]) do
                  begin if Tag and Caso = Caso then
                           begin if (Tag and 1)=1 then Ena:=Not Habilita;
                                 if (Tag and 2)=2 then Ena:=Habilita;
                                 if Ena then
                                 begin Color:=clWindow;
                                       //if (Tag and 4)=4 then {Default:=True};
                                       //if (Tag and 8)=8 then {Cancel:=True};
                                 end
                                 else Color:=clbtnFace;
                                 ReadOnly:=Not Ena;
                                 if (Grid<>Nil) and (Grid.Visible) and (Grid.SelectedField<>Nil) and (Grid.DataSource=DataSource)
                                 and (Grid.SelectedField.FieldName=DataField)
                                 then begin if Enabled and Visible and (Not ReadOnly)
                                            then begin SetFocus; end;
                                      end;
                           end;
                       Continue;
                  end;

                 if Components[I] is TDBRadioGroup  then
                  With TDBRadioGroup(Components[I]) do
                  begin if Tag and Caso = Caso then
                           begin if (Tag and 1)=1 then Ena:=Not Habilita;
                                 if (Tag and 2)=2 then Ena:=Habilita;
                                 {Default:=False; Cancel:=False;}
                                 if Ena then
                                 begin Color:=clbtnFace;
                                       //if (Tag and 4)=4 then {Default:=True};
                                       //if (Tag and 8)=8 then {Cancel:=True};
                                 end
                                 else Color:=clbtnFace;
                                 ReadOnly:=Not Ena;
                                 if (Grid<>Nil) and (Grid.Visible) and (Grid.SelectedField<>Nil) and (Grid.DataSource=DataSource)
                                 and (Grid.SelectedField.FieldName=DataField)
                                 then begin if Enabled and Visible
                                            then begin SetFocus; DoEvents;
                                                 end;
                                      end;
                           end;
                      Continue;
                  end;

                  if Components[I] is TDBCheckBox then
                  With TDBCheckBox (Components[I]) do
                  begin if Tag and Caso = Caso then
                           begin if (Tag and 1)=1 then Ena:=Not Habilita;
                                 if (Tag and 2)=2 then Ena:=Habilita;
                                 {Default:=False; Cancel:=False;}
                                 if Ena then
                                 begin Color:=clbtnFace;
                                       //if (Tag and 4)=4 then {Default:=True};
                                       //if (Tag and 8)=8 then {Cancel:=True};
                                 end
                                 else Color:=clbtnFace;
                                 Enabled:=Ena;
                                 ReadOnly:=Not Ena;
                                 if (Grid<>Nil) and (Grid.Visible) and (Grid.SelectedField<>Nil) and (Grid.DataSource=DataSource)
                                 and (Grid.SelectedField.FieldName=DataField)
                                 then begin if Enabled and Visible
                                            then begin SetFocus; DoEvents;
                                                 end;
                                      end;
                           end;
                       Continue;
                  end;

                  if Components[I] is TDBGrid then
                  With TDBGrid(Components[I]) do
                  begin if Tag and Caso = Caso then
                           begin if (Tag and 1)=1 then Ena:=Not Habilita;
                                 if (Tag and 2)=2 then Ena:=Habilita;
                                 if Ena then
                                 begin {Color:=clWindow;}
                                       //if (Tag and 4)=4 then {Default:=True};
                                       //if (Tag and 8)=8 then {Cancel:=True};
                                 end
                                 else {Color:=clbtnFace};
                                 Enabled:=Not Ena;
                           end;
                      Continue;
                  end;
                  if Components[I] is TButton then
                  With TButton(Components[I]) do
                  begin if Tag and Caso = Caso then
                           begin if (Tag and 1)=1 then Ena:=Not Habilita;
                                 if (Tag and 2)=2 then Ena:=Habilita;
                                 Default:=False; Cancel:=False;
                                 Enabled:=Ena;
                                 if Ena then
                                 begin {Color:=clWindow;}
                                       if (Tag and 4)=4 then Default:=True;
                                       if (Tag and 8)=8 then Cancel:=True;
                                 end
                                 else {Color:=clbtnFace};
                                 {ReadOnly:=Ena;}
                           end;
                       Continue;
                  end;

                  if Components[I] is TBitBtn then
                  With TBitBtn(Components[I]) do
                  begin if Tag and Caso = Caso then
                           begin if (Tag and 1)=1 then Ena:=Not Habilita;
                                 if (Tag and 2)=2 then Ena:=Habilita;
                                 Default:=False; Cancel:=False;
                                 Enabled:=Ena;
                                 if Ena then
                                 begin {Color:=clWindow};
                                       if (Tag and 4)=4 then Default:=True;
                                       if (Tag and 8)=8 then Cancel:=True;
                                 end
                                 else {Color:=clbtnFace};
                                 {ReadOnly:=Ena;}
                           end;
                       Continue;
                  end;
          end;
      end;

    end;
end;

*)

Procedure CambiaStat(Forma:TWinControl; CasoDef,CasoCan:Integer);
Var i:Integer;
begin exit;
      With Forma do
      begin
      for I := 0 to ComponentCount -1 do
          begin if Components[I] is TDBEdit then
                  With TDBEdit(Components[I]) do
                  begin if Tag and CasoDef = CasoDef then
                           begin
                           end;
                  end;
                if Components[I] is TwwDBEdit then
                  With TwwDBEdit(Components[I]) do
                  begin if Tag and CasoDef = CasoDef then
                           begin
                           end;
                  end;
                 if Components[I] is TDBRadioGroup  then
                  With TDBRadioGroup(Components[I]) do
                  begin if Tag and CasoDEF = CasoDEF then
                           begin
                           end;
                  end;

                 if Components[I] is TDBCheckBox then
                  With TDBCheckBox (Components[I]) do
                  begin if Tag and CasoDEF = CasoDEF then
                           begin
                           end;
                  end;

                  if Components[I] is TDBGrid then
                  With TDBGrid(Components[I]) do
                  begin if Tag and CasoDEF = CasoDEF then
                           begin
                           end;
                  end;
                  if Components[I] is TButton then
                  With TButton(Components[I]) do
                  begin if (Tag and CasoDef = CasoDef)and(Enabled=True)
                           then Default:=True else Default:=False;
                        if (Tag and CasoCan = CasoCan)and(Enabled=True)
                           then Cancel:=True else Cancel:=False;
                                 {if (Grid<>Nil) and (Grid.SelectedField.FieldName=DataField)
                                 then begin if Enabled and Visible
                                            then begin SetFocus; DoEvents;
                                                 end;
                                      end;}
                  end;

                  if Components[I] is TBitBtn then
                  With TBitBtn(Components[I]) do
                  begin if (Tag and CasoDef = CasoDef)and(Enabled=True)
                           then Default:=True else Default:=False;
                        if (Tag and CasoCan = CasoCan)and(Enabled=True)
                           then Cancel:=True else Cancel:=False;
                                 {if (Grid<>Nil) and (Grid.SelectedField.FieldName=DataField)
                                 then begin if Enabled and Visible
                                            then begin SetFocus; DoEvents;
                                                 end;
                                      end;}
                  end;
          end;
      end;
end;


constructor TSQLIniFile.Create(const FileName: string; DataBaseName,SessionName:String);
Var SQL:TQuery;
begin Lineas:=nil;
      SQL:=GetSQLQuery('SELECT TX_FINDIT FROM CLAS_FINDIT WHERE CVE_FINDIT='''+UpperCase(FileName)+'''',DataBaseName, SessionName,True);
      if SQL=nil then begin ShowMessage('El Archivo '+FileName+' no existe en la Base de Datos.');
                            exit;
                      end;
      Try Lineas:=TStringList.Create;
          Lineas.Text:=SQL.FieldByName('TX_FINDIT').AsString;
      Finally SQL.Free;
      end;

end;

Destructor  TSQLIniFile.Destroy;
begin if Lineas<>nil then Lineas.Free; Lineas:=nil;
end;

function TSQLIniFile.ReadString(const Section, Ident, Default: string): string;
var i,Len,LenS:Integer;
    Idn,S:String;
begin if Lineas=nil then exit;
      Idn:=UpperCase(Ident)+'=';
      Len:=Length(Idn);
      For i:=0 to Lineas.Count-1 do
      begin S:=Trim(Lineas[i]);
            LenS:=Length(S);
            if (S<>'')and(LenS>=Len) then
            begin if (UpperCase(Copy(S,1,Len))=Idn)
                     then begin ReadString:=Copy(S,Len+1,LenS);
                                Exit;
                          end;
            end;
      end;
      ReadString:=Default;
end;

function TSQLIniFile.ReadInteger(const Section, Ident: string; Default: Longint): Longint;
var S:String;
begin S:=ReadString(Section, Ident, IntToStr(Default));
      if S='' then ReadInteger:=Default
              else ReadInteger:=StrToInt(S);
end;

function TSQLIniFile.ReadBool(const Section, Ident: string; Default: Boolean): Boolean;
var S,D:String;
begin if Default then D:='1' else D:='0';
      S:=ReadString(Section , Ident, D);
      if S='' then ReadBool:=Default
              else ReadBool:=(Trim(S)='1');
end;


constructor TBaseIniFile.Create(const FileName: string; DataBaseName,SessionName:String);
begin Inherited Create(FileName);
end;

Destructor  TBaseIniFile.Destroy;
begin Inherited Destroy;
end;

function TBaseIniFile.ReadString(const Section, Ident, Default: string): string;
begin ReadString:=Inherited ReadString(Section, Ident, Default);
end;

function TBaseIniFile.ReadInteger(const Section, Ident: string; Default: Longint): Longint;
begin ReadInteger:=Inherited ReadInteger(Section, Ident, Default);
end;

function TBaseIniFile.ReadBool(const Section, Ident: string; Default: Boolean): Boolean;
begin ReadBool:=Inherited ReadBool(Section, Ident, Default);
end;


var C1,C2,C3:Integer;
begin Panel3:=Nil;
      Panel4:=Nil;
      C1:=GetRValue(ColorToRGB(clWindow));
      C2:=GetGValue(ColorToRGB(clWindow));
      C3:=GetBValue(ColorToRGB(clWindow));
      C2:=C2-25;
      C3:=C3-45;
      if C2<0 then C2:=0;
      if C3<0 then C3:=0;
      ColorRequiered:=(C1*256*256)+C2*256+C3;
end.
