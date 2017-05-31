{******************************************************************************}
{*                                                                            *}
{*                  DFL Software's Light Lib Objects Unit                     *}
{*                  (C) Copyright DFL Software, Inc. 1995                     *}
{*                                                                            *}
{******************************************************************************}

unit llo;

{******************************************************************************}
interface
{******************************************************************************}

uses SysUtils, WinTypes, WinProcs, Messages, Classes, Controls, Dialogs, Forms,
     Graphics, ExtCtrls, Buttons, StdCtrls, DsgnIntf,
     IniFiles,
     oNotReg,  { TDlgNotRegistered class (if llo was not registered) }
     oNotProf; { Light Lib Edition Violation: Professional Edition required.}


{******************************************************************************}

{ include Light Lib Object defines }
{$I LLO.INC}

{******************************************************************************}

type

    TLightLibPath = Class( TObject )
    private
        FBaseDir    : String;
        FDelphiDir  : String;
        FSampleDir  : String;
        FDataDir    : String;
        FHelpDir    : String;
    protected
    public
        Constructor Create;
        Destructor Destroy; override;
        property BaseDir : String read FBaseDir;   {examples: C:\LIGHTLIB      }
        property DelphiDir : String read FDelphiDir; {        C:\DELPHI        }
        property SampleDir : String read FSampleDir; {        C:\LIGHTLIB\...  }
        property DataDir : String read FDataDir;     {        C:\LIGHTLIB\DATA }
        Property HelpDir : String read FHelpDir;     {        C:\LIGHTLIB\HELP }
    end;


{******************************************************************************}
{*                     Light Lib FileName Property                            *}
{******************************************************************************}

type
    TImageName = String;
type
    TImageNameProperty = class (TStringProperty)
    private
    public
        procedure Edit; override;
        function  GetAttributes: TPropertyAttributes; override;
    end;


{******************************************************************************}
{*                        Light Lib Container property                        *}
{******************************************************************************}

Const
    TLightLibStripSize = 2048;

    TLightLibContainerSize : Longint = 65500;
Type
    TLightLibStrip = Array[1..TLightLibStripSize] of Byte;

    TMemContainer = Array[1..65500] of byte;
    TpMemContainer = ^TMemContainer;

    TContainerInfo = class(TPersistent)
    protected
        FStripSize      : Longint;
        FNumberOfStrips : Longint;
        FBytesUsed      : Longint;
    published
        property StripSize : Longint read FStripSize write FStripSize;
        property NumberOfStrips : Longint read FNumberOfStrips write FNumberOfStrips;
        property BytesUsed : Longint read FBytesUsed write FBytesUsed;
    end;

    TLightLibContainer = class(TPersistent)
    protected
        FContainerInfo : TContainerInfo;
        FContainer : TpMemContainer;
        procedure SetContainer( Index : Longint; AStrip : Byte );
        function  GetContainer( Index : Longint) : Byte;
        procedure DefineProperties( Filer : TFiler ); override;
        procedure WriteContainer( Writer : TWriter );
        procedure ReadContainer( Reader : TReader );
{        procedure WriteContainer( Writer : TStream );
        procedure ReadContainer( Reader : TStream );}
        procedure SetContainerInfo( AInfo : TContainerInfo );
    public
        constructor Create;
        destructor  Destroy; override;
        property Container[Index:Longint]: Byte read GetContainer write SetContainer;
    published
        property ContainerInfo : TContainerInfo read FContainerInfo write SetContainerInfo;
    end;

{Container Class property editor}

    TLightLibContainerProperty = class (TClassProperty)
    private
    public
    	procedure Edit; override;
    	function  GetAttributes: TPropertyAttributes; override;
    end;




{******************************************************************************}
{* Light Lib Error handler class :                                            *}
{*          When an error occures, the ProcOnError callback procedure         *}
{*          will create an instance of this class to handle either            *}
{*          standard error- or userdefined behaviour                          *}
{******************************************************************************}


    TLightLibError = class
    private
        liSelf   : LongInt; { internal use }
        cbOnError: Pointer;
    protected
    public
        Destructor Destroy;
        Constructor Init( liLLError : LongInt );
        function Action : String;
        function Caller : String;
        function LightLibObject : LongInt;
        function ErrorMessage : String;
        function Number : Integer;
        function ObjectClass : String;
        function ObjectLib : String;
        function PassedParameter : String;
        function PropertyDefine : LongInt;
        function PropertyName : String;
    end;

{******************************************************************************}

    TLightLibBase = class;
    TLLErrorEvent = procedure( Sender: TLightLibBase; var CallStd: Boolean; Error: TLightLibError ) of Object; {//--}

{******************************************************************************}

    TLightLibBase = class( TCustomControl )
    private
        FLLErrorEvent: TLLErrorEvent;
        FLightLibApp: Longint;
        FErrorDialogEnabled: Boolean;
        function GetErrorDialogEnabled: Boolean;
        procedure SetErrorDialogEnabled(Value: Boolean);
        function GetLightLibApp: Longint;
    public
        constructor Create( AOwner: TComponent ); override;
        destructor Destroy; override;
        procedure DoLLError( var CallStd: Boolean; llError: TLightLibError );
        property liLightLibApp: Longint read GetLightLibApp;
        function LightLibAppRegister( AApplication: TApplication; LLClass: Longint ): LongInt;
        function LightLibAppUnRegister: LongInt;
    published
        property OnLLError: TLLErrorEvent read FLLErrorEvent write FLLErrorEvent;
        property ErrorDialogEnabled: Boolean read GetErrorDialogEnabled write SetErrorDialogEnabled;
    end;

{******************************************************************************}

    { LLO.DLL Function Prototypes }

{$ifdef Win32}
    function oDLLLoad : LongInt; stdcall ;
    function oNew( liClass, liLLObject: LongInt; siSizeOfCargo: longInt; liValue,
                   liExtraParam: LongInt ): LongInt; stdcall ;
    function oDel( liLLObject: LongInt ): LongInt; stdcall ;
    function oCopy( lpOwner : Longint; lpObject: Longint;
                    dwAction, dwParam1, dwParam2, dwParam3 : LongInt ) : Longint; stdcall ;
    function oAccess( liLLObject, liProperty, liExtraParam: LongInt ): LongInt; stdcall ;
    function oAssign( liLLObject, liProperty, liValue, liExtraParam: LongInt ):LongInt; stdcall ;
    function oInvoke( liLLObject, liMethod, liExtraParam: LongInt ): LongInt; stdcall ;
    function oWalk( lillObject, liMethod, udfWalk : Longint; siLevel : Smallint ;
                    liClassFilter, liUserParam : Longint ): Longint; stdcall ;
    procedure ProcOnError( liLLError : LongInt ); export; stdcall ; { callback procedure for error handling }
{$else}
    function oDLLLoad : LongInt;
    function oNew( liClass, liLLObject: LongInt; siSizeOfCargo: ShortInt; liValue,
                   liExtraParam: LongInt ): LongInt;
    function oDel( liLLObject: LongInt ): LongInt;
    function oCopy( lpOwner : Longint; lpObject: Longint;
                    dwAction, dwParam1, dwParam2, dwParam3 : LongInt ) : Longint;
    function oAccess( liLLObject, liProperty, liExtraParam: LongInt ): LongInt;
    function oAssign( liLLObject, liProperty, liValue, liExtraParam: LongInt ):LongInt;
    function oInvoke( liLLObject, liMethod, liExtraParam: LongInt ): LongInt;
    function oWalk( lillObject, liMethod, udfWalk : Longint; siLevel : ShortInt;
                    liClassFilter, liUserParam : Longint ): Longint;
    procedure ProcOnError( liLLError : LongInt ); export; { callback procedure for error handling }
{$endif}

Var
    LLRegisterCount          : Integer; { Global counter of LLI, LLB etc. instances
                                          in design mode }
    DelphiObjectInCargo      : Boolean;


{ utility function prototypes
  being used in LLI.PAS, too. That's why they're in the interface section }

function  min( i1, i2:Longint ):Longint;
function  max( i1, i2:Longint ):Longint;
function  MinReal( r1, r2:real ):real;
function  MaxReal( r1, r2:real ):real;

function  LightLibVersionStr( AProduct : Longint ) : String;
function  LightLibCopyrightStr : String;


{******************************************************************************}
implementation
{******************************************************************************}

Uses
    LLErrDlg;{ Light Lib Error Dialog( DlgError class )}


procedure StdErrorHandler( oWindow  : TObject; oLLError : TLightLibError ); forward;


{ include resource files
  depending on system }

{$ifdef Win32}
    {$R LLO.R32}
    function  oDLLLoad; stdcall; external 'LLO32.DLL';
    function  oNew;     stdcall; external 'LLO32.DLL';
    function  oCopy;    stdcall; external 'LLO32.DLL';
    function  oDel;     stdcall; external 'LLO32.DLL';
    function  oAccess;  stdcall; external 'LLO32.DLL';
    function  oAssign;  stdcall; external 'LLO32.DLL';
    function  oInvoke;  stdcall; external 'LLO32.DLL';
    function  oWalk;    stdcall; external 'LLO32.DLL';
{$else}
    {$R LLO.R16}
    function  oDLLLoad; external 'LLO16';
    function  oNew;     external 'LLO16';
    function  oCopy;    external 'LLO16';
    function  oDel;     external 'LLO16';
    function  oAccess;  external 'LLO16';
    function  oAssign;  external 'LLO16';
    function  oInvoke;  external 'LLO16';
    function  oWalk;    external 'LLO16';
{$endif}


{******************************************************************************}

Var
    lWarnProError: Boolean;


{******************************************************************************}
{*               TLightLibContainer  class implementation                     *}
{******************************************************************************}

procedure TLightLibContainer.SetContainer( Index : Longint; AStrip : Byte );
begin
    FContainer^[Index] := Astrip;
end;

{******************************************************************************}

function  TLightLibContainer.GetContainer( Index : Longint) : Byte;
begin
    Result := FContainer^[Index];
end;

{******************************************************************************}

procedure TLightLibContainer.DefineProperties( Filer : TFiler );
begin
    Filer.DefineProperty( 'Container', ReadContainer, WriteContainer, True );
{    Filer.DefineBinaryProperty( 'Container', ReadContainer, WriteContainer, True );}
end;

{******************************************************************************}

{procedure TLightLibContainer.WriteContainer( Writer : TStream );}
procedure TLightLibContainer.WriteContainer( Writer : TWriter );
begin
    Writer.Write( FContainer^, TLightLibContainerSize );
end;

{******************************************************************************}

{procedure TLightLibContainer.ReadContainer( Reader : TStream );}
procedure TLightLibContainer.ReadContainer( Reader : TReader );
begin
    Reader.Read( FContainer^, TLightLibContainerSize );
end;

{******************************************************************************}

procedure TLightLibContainer.SetContainerInfo( AInfo : TContainerInfo );
begin
    FContainerInfo.Assign( AInfo );
end;

{******************************************************************************}

constructor TLightLibContainer.Create;
Var
    i : Longint;
begin
    new( FContainer );

    for i := 1 to TLightLibContainerSize do
    begin
        FContainer^[i] := 66;
    end;
    FContainerInfo := TContainerInfo.Create;
end;

{******************************************************************************}

destructor  TLightLibContainer.Destroy;
begin
    if ( FContainer <> nil ) then
        dispose( FContainer );
    Inherited Destroy;
end;



{******************************************************************************}
{*          TLightLibContainerProperty editor class implementation            *}
{******************************************************************************}

procedure TLightLibContainerProperty.Edit;
begin
end;

{******************************************************************************}

function  TLightLibContainerProperty.GetAttributes: TPropertyAttributes;
begin
    Result := [paReadOnly];
end;

{******************************************************************************}
{*                          TImageName Property                               *}
{******************************************************************************}

procedure TImageNameProperty.Edit;
Var
    OpenDialog : TOpenDialog;
begin

    OpenDialog := TOpenDialog.Create( Application );
    try
        OpenDialog.Filter := 'Image files |*.BMP;*.GIF;*.JPG;*.PCX;*.PNG;*.TGA;*.TIF|' +
                             'Bitmap files (*.BMP)|*.BMP|' +
                             'GIF files (*.GIF)|*.GIF|' +
                             'JPEG files (*.JPG)|*.JPG|' +
                             'PCX files (*.PCX)|*.PCX|' +
                             'Ping files (*.PNG)|*.PNG|' +
                             'Targa files (*.TGA)|*.TGA|' +
                             'Tiff files (*.TIF)|*.TIF|' +
                             'All files (*.*)|*.*';

        if ( OpenDialog.Execute ) then
        begin
            SetValue( OpenDialog.FileName );
        end;
    finally
        OpenDialog.free;
    end;
end;

function  TImageNameProperty.GetAttributes: TPropertyAttributes;
begin
    Result := [paDialog];
end;

{******************************************************************************}
{*                                                                            *}
{*                     LightLibPath class implementation                      *}
{*                                                                            *}
{******************************************************************************}

Constructor TLightLibPath.Create;
var
    LightLibIni: TIniFile;
begin
    LightLibIni := TIniFile.Create('LIGHTLIB.INI');
    with LightLibIni do
    begin

        FBaseDir    := ReadString('Directories', 'LightLibPath', 'ERROR');
        FDelphiDir  := ReadString('Directories', 'DELPHIPath', 'ERROR');
        FSampleDir  := ReadString('Directories', 'SamplesPath', 'ERROR');
        FDataDir    := ReadString('Directories', 'DataPath', 'ERROR');
        FHelpDir    := FBaseDir + '\HELP';

    end;
    LightLibIni.Free;
end;

Destructor TLightLibPath.Destroy;
begin
    inherited Destroy;
end;

{******************************************************************************}
{*                                                                            *}
{*                     LightLibError class implementation                     *}
{*                                                                            *}
{******************************************************************************}

function TLightLibError.Action : String;
Var
    liAction    : LongInt;
    sAction     : String;
begin
    { Get the error action name }

    liAction := LongInt( oAccess( liSelf, LLO_ERROR_ACTION, LLO_VOID_PARAM ) );

    { To be updated }
    if ( liAction > 100 ) then
    begin
        { If liAction is greater than 100, it is not one of the std oNew/oDel,
          but should be an iGet/iPut ...
          In these cases, the LLO_ERROR_ACTION return a psz ! }
        sAction := StrPas( PChar(oAccess( liSelf, LLO_ERROR_ACTION, LLO_VOID_PARAM)) );
    end
    else
    begin
        Case  liAction of
            LLO_ACTION_NEW :
                sAction := 'New';

            LLO_ACTION_DEL :
                sAction := 'Del';

            LLO_ACTION_ACCESS :
                sAction := 'Access';

            LLO_ACTION_ASSIGN :
                sAction := 'Assign';

            LLO_ACTION_INVOKE :
                sAction := 'Invoke';

            LLO_ACTION_COPY :
                sAction := 'Copy';
        end; {Case}

    end; {else}

    Result := sAction;
end;

{******************************************************************************}

function TLightLibError.Caller : String;
Var
    liApp       : LongInt;
    liTest      : LongInt;
begin

    liApp := oAccess( liSelf, LLO_ABSTRACT_APPLICATION, LLO_VOID_PARAM );

    liTest := oAccess( liApp, LLO_APPLICATION_NAME, LLO_VOID_PARAM );

    if ( liTest <> 0 ) then
        Result := StrPas( PChar( liTest ) )
    else
        Result := '';

end;

{******************************************************************************}

Destructor TLightLibError.Destroy;
begin
end;

{******************************************************************************}

Constructor TLightLibError.Init( liLLError : LongInt );
Var i: Longint;
begin
    { Connect the Delphi object to the existing DLL LightLibError }
    liSelf := liLLError;

    i := oAccess( liLLError, LLO_ABSTRACT_CARGO_COUNT, 0 );
    { Store in oDelphiObject the reference to the DelphiObject }
    oAssign( liLLError,
             LLO_ABSTRACT_CARGO,
             LongInt( Self ),
             LLO_ABSTRACT_CARGO_O_DELPHI_OBJECT );
end;

{******************************************************************************}

function TLightLibError.LightLibObject : LongInt;
begin
    { Get the object on which the error occurs }
    Result := LongInt( oAccess( liSelf, LLO_ERROR_OBJECT, LLO_VOID_PARAM ) );

end;

{******************************************************************************}

function TLightLibError.ErrorMessage : String;
Var
    liTest : Longint;
begin
    { Get the error message }

    liTest := oAccess( liSelf, LLO_ERROR_MESSAGE, LLO_VOID_PARAM );

    if ( liTest <> 0 ) then
        Result := StrPas( PChar( liTest ) )
    else
        Result := '';

end;

{******************************************************************************}

function TLightLibError.Number : Integer;
begin
    { Get the error number }
    Result := Integer( oAccess( liSelf, LLO_ERROR_NUMBER, LLO_VOID_PARAM ) );

end;

{******************************************************************************}

function TLightLibError.ObjectClass : String;
Var
    sClass : String;
begin
    sClass := IntToHex( PropertyDefine, 4);

    if ( sClass = '0000' ) then
        sClass := 'Context'

    else if ( sClass = '0001' ) then
	sClass := 'Abstract'

    else if ( sClass = '0002' ) then
        sClass := 'Error'

    else if ( sClass = '0003' ) then
        sClass := 'Application'

    else if ( sClass = '0100' ) then
        sClass := 'Application'

    else if ( sClass = '0101' ) then
        sClass := 'Image'

    else if ( sClass = '0200' ) then
        sClass := 'Application'

    else if ( sClass = '0201' ) then
        sClass := 'Graph'

    else if ( sClass = '0202' ) then
        sClass := 'Column'

    else if ( sClass = '0203' ) then
        sClass := 'Axis X'

    else if ( sClass = '0204' ) then
        sClass := 'Axis Y'

    else if ( sClass = '0205' ) then
        sClass := 'Legend'

    else if ( sClass = '0206' ) then
        sClass := 'Font'

    else if ( sClass = '0300' ) then
        sClass := 'Application'

    else if ( sClass = '0301' ) then
        sClass := 'WAVE'

    else if ( sClass = '0302' ) then
        sClass := 'AVI'

    else if ( sClass = '0303' ) then
        sClass := 'MIDI'

    else
        sClass := 'Unknown';

    Result := sClass;

end;

{******************************************************************************}

function TLightLibError.ObjectLib : String;
Var
    sLib : String;
begin

    sLib := IntToHex( PropertyDefine, 2 );

    if ( sLib = '00' ) then
        sLib := 'Object'

    else if ( sLib = '01' ) then
        sLib := 'Images'

    else if ( sLib = '02' ) then
        sLib := 'Business'

    else if ( sLib = '03' ) then
        sLib := 'MultiMedia';

    Result := sLib;

end;

{******************************************************************************}

function TLightLibError.PassedParameter : String;
Var
    liParameter	: LongInt;
    sReturn     : String;
    liTest      : Longint;
begin

    { Get the parameter passed }

    liParameter := LongInt( oAccess( liSelf,LLO_ERROR_PARAM,LLO_VOID_PARAM ) );

    if ( IsBadReadPtr( pointer( liParameter ), 1 ) = FALSE ) then
        sReturn := 'Ptr or String'
    else
    begin
        liTest := liParameter ;
        if ( liTest <> 0 ) then
            sReturn := IntToStr( liParameter );
    end;

    Result := sReturn;

end;

{******************************************************************************}

function TLightLibError.PropertyDefine : LongInt;
begin
    { Get the error property define value }
    Result := LongInt( oAccess( liSelf, LLO_ERROR_PROPERTY, LLO_VOID_PARAM ) );
end;

{******************************************************************************}

function TLightLibError.PropertyName : String;
Var
    liTest : Longint;
begin
    { Get the error property name }

    liTest := oAccess( liSelf, LLO_ERROR_PROPERTY_NAME, LLO_VOID_PARAM );

    if ( liTest <> 0 ) then
        Result := StrPas( PChar( liTest ) )
    else
        Result := '';
end;

{******************************************************************************}
{*                     TLightLibBase class implementation                     *}
{******************************************************************************}

constructor TLightLibBase.Create( AOwner: TComponent );
begin
    inherited Create( AOwner );

    LightLibAppRegister( Application , 0 );

    ErrorDialogEnabled := True;
end;

{******************************************************************************}

destructor TLightLibBase.Destroy;
begin
    LightLibAppUnRegister;
    inherited Destroy;
end;

{******************************************************************************}

procedure TLightLibBase.DoLLError( var CallStd: Boolean; llError: TLightLibError );{//--}
begin
    if ( Assigned( FLLErrorEvent ) ) then
        FLLErrorEvent( Self, CallStd, llError );
end;

{******************************************************************************}

function TLightLibBase.GetLightLibApp: Longint;
Var
    oDialog : TDlgNotRegistered;
begin
    if ( FLightLibApp = 0 ) then
    begin
        oDialog := TDlgNotRegistered.Create( Application );
        oDialog.ShowModal;
        oDialog.Hide;
        odialog.Free;
    end;
    Result := FLightLibApp;
end;

{******************************************************************************}

function TLightLibBase.LightLibAppRegister( AApplication: TApplication; LLClass: Longint ): LongInt;
var
    liAppHnd: LongInt;
    cAppName: String;
    pAppName: PChar;
begin

    pAppName := 'MyApp';

    if ( FLightLibApp = 0 ) then
    begin
        { Find out the application handle }
        liAppHnd := AApplication.Handle;

        { Give a name to the app }
        cAppName := 'LightLibFromDelphi';

        { Register the Delphi application into the Light Lib Objects DLL
          LLO_VOID_PARAM means no parent, 2 means two longints as default cargo }

        FLightLibApp := oNew( LLO_CLASS_APPLICATION,
                              LLO_VOID_PARAM,
                              2,
                              liAppHnd,
                              LongInt( pAppName ));

        if ( FLightLibApp <> 0 ) then
        begin
            { set the option base to zero }
            oAssign( FLightLibApp, LLO_APPLICATION_OPTION_BASE, 0, 0 );
            { Set the standard Error handler}
            oAssign( FLightLibApp, LLO_ABSTRACT_ON_ERROR, LongInt( @ProcOnError ), LLO_VOID_VALUE );
            { store the reference to the calling class (eg: TImageWindow, TGraphWindow) in the application object }
            oAssign( FLightLibApp,
                     LLO_ABSTRACT_CARGO,
                     Longint( Self ),
                     LLO_ABSTRACT_CARGO_O_DELPHI_OBJECT );
        end;
    end;
    Result := FLightLibApp;
end;

{******************************************************************************}

function TLightLibBase.LightLibAppUnRegister: LongInt;
begin
    { Destroy the Light Lib Application if there is no other instance of it
      encountered in the delphi application }

    if ( FLightLibApp <> 0 ) then
    begin
        oDel( FLightLibApp );
        FLightLibApp := 0;
    end;
    Result := FLightLibApp;
end;

{******************************************************************************}

function TLightLibBase.GetErrorDialogEnabled: Boolean;
begin
    Result := FErrorDialogEnabled;
end;

{******************************************************************************}

procedure TLightLibBase.SetErrorDialogEnabled(Value: Boolean);
begin
    FErrorDialogEnabled := Value;

    if ( FErrorDialogEnabled ) then
    begin
        oAssign( liLightLibApp, LLO_APPLICATION_MESSAGE, LLO_MESSAGE_ERROR_BOX, LLO_VOID_PARAM );
    end
    else
    begin
        oAssign( liLightLibApp, LLO_APPLICATION_MESSAGE, LLO_MESSAGE_ERROR_NONE, LLO_VOID_PARAM );
    end;

end;


{******************************************************************************}
{*                                                                            *}
{*             Light Lib Error management CallBack procedure                  *}
{*                                                                            *}
{******************************************************************************}

procedure ProcOnError( liLLError : LongInt );
Var
    oDelphiObjectError    : TLightLibError;
    oDelphiObjectLightLib : TObject;
    CallStd               : Boolean;
    ErrorApplication      : Longint;
begin
    { =======
      WARNING
      =======
      We strongly recommend not to modify this function. It is very
      tightly integrated with LLO.DLL }

    { Create a LightLibError object wrapper in Delphi }
    oDelphiObjectError := TLightLibError.Init( liLLError );

    { Get the application of the object on which the error occured }
    ErrorApplication := oAccess( liLLError, LLO_ABSTRACT_APPLICATION, 0 );

    { retreive Delphi Object from the Application cargo }
    oDelphiObjectLightLib := TObject( oAccess( ErrorApplication,
                                               LLO_ABSTRACT_CARGO,
                                               LLO_ABSTRACT_CARGO_O_DELPHI_OBJECT ) );

    if ( TLightLibBase(oDelphiObjectLightLib).ErrorDialogEnabled ) then
    begin
        CallStd := True; { by default we'll call standard error handling }


        if ( oDelphiObjectLightLib <> nil ) then
        begin
            { fire the event of the concerned component }
            TLightLibBase(oDelphiObjectLightLib).DoLLError( CallStd, oDelphiObjectError );
        end;

        if ( CallStd ) then
            StdErrorHandler( Application, oDelphiObjectError );

    end;

end; { of  ProcOnError }


{******************************************************************************}

procedure StdErrorHandler( oWindow  : TObject;          { The registered window object }
                           oLLError : TLightLibError ); { The Light Lib Error Object }
Var
    DlgError     : TDlgError;
    DlgNotProf   : TDlgNotProf;
begin
    { This is the default error handling system. }

    if ( oLLError.Number = LLI_ERROR_SCANNER_NOT_ONLINE ) then
    begin
        MessageDlg( 'Error attempting to acquire an image.' +
                    'No TWAIN device available or scan operation aborted',
                    mtError, [mbOk], 0 );
    end
    else if ( oLLError.Number = LLO_ERROR_PROFESSIONAL_VERSION_ONLY ) then
    begin

        if ( lWarnProError ) then
        begin
            DlgNotProf := TDlgNotProf.Create( Application );
            try
                if ( DlgNotProf.ShowModal = mrCancel ) then
                    lWarnProError := False;
            finally
                DlgNotProf.Free;
            end;
        end
        else
        begin
            MessageBeep( MB_ICONASTERISK );
            MessageBeep( MB_ICONEXCLAMATION );
            MessageBeep( MB_ICONHAND );
            MessageBeep( MB_ICONQUESTION );
        end;

    end
    else
    begin

	DlgError := TDlgError.Create( Application );
        try

            DlgError.Init( oLLError );
            DlgError.ShowModal;

        finally

            DlgError.Free;

        end;

    end; {if}

end; { StdErrorHandler }

{******************************************************************************}
{*   Light Lib registration / unregistration functions                        *}
{******************************************************************************}

(*
function liLightLibApp: LongInt;
Var
    oDialog : TDlgNotRegistered;
begin


    if ( liLightLibRegisteredApp = 0 ) then
    begin
        oDialog := TDlgNotRegistered.Create( Application );
        oDialog.ShowModal;
        oDialog.Hide;
        odialog.Free;
    end;

    Result := liLightLibRegisteredApp;
end;
*)
{***************************************************************************}
(*
function liLightLibAppRegister( AApplication: TApplication; LLClass: Longint ): LongInt;
var
    liAppHnd: LongInt;
    cAppName: String;
    pAppName: PChar;
begin

    pAppName := 'MyApp';

    LLRegisterCount := LLRegisterCount + 1;

    if ( liLightLibRegisteredApp = 0 ) then
    begin
        { Find out the application handle }
        liAppHnd := AApplication.Handle;

        { Give a name to the app }
        cAppName := 'LightLibFromDelphi';

        { Register the Delphi application into the Light Lib Objects DLL
          LLO_VOID_PARAM means no parent, 2 means two longints as default cargo }

        liLightLibRegisteredApp := oNew( LLO_CLASS_APPLICATION,
                                         LLO_VOID_PARAM,
                                         255,
                                         liAppHnd,
                                         LongInt( pAppName ));

        if ( liLightLibRegisteredApp <> 0 ) then
        begin
            { set the option base to zero }
            oAssign( liLightLibRegisteredApp, LLO_APPLICATION_OPTION_BASE, 0, 0 );
            { Set the standard Error handler}
            oAssign( liLightLibRegisteredApp, LLO_ABSTRACT_ON_ERROR, LongInt( @ProcOnError ), LLO_VOID_VALUE );

        end;

    end;

    { store the reference to the calling class (eg: TImageWindow, TGraphWindow) in the application object }
{    oAssign( liLightLibRegisteredApp,
             LLO_ABSTRACT_CARGO,
             LLClass,
             LLO_ABSTRACT_CARGO_O_DELPHI_OBJECT );
}
    Result := liLightLibRegisteredApp;
end;
*)
{***************************************************************************}
(*
function liLightLibAppUnRegister: LongInt;
begin

    { Destroy the Light Lib Application if there is no other instance of it
      encountered in the delphi application }

    if ( LLRegisterCount = 1 ) then
    begin
        oDel( liLightLibRegisteredApp );
        liLightLibRegisteredApp := 0;
    end;

    LLRegisterCount := LLRegisterCount - 1; { count down the LL Instances }

    Result := liLightLibRegisteredApp;
end;
*)
{***************************************************************************}

function min( i1, i2:Longint ):Longint;
begin
    if (i1 < i2) then
        result := i1
    else
        result := i2;
end;

{******************************************************************************}

function max( i1, i2:Longint ):Longint;
begin
    if (i1 > i2) then
        result := i1
    else
        result := i2;
end;

{***************************************************************************}

function MinReal( r1, r2:real ):real;
begin
    if (r1 < r2) then
        result := r1
    else
        result := r2;
end;

{******************************************************************************}

function MaxReal( r1, r2:real ):real;
begin
    if (r1 > r2) then
        result := r1
    else
        result := r2;
end;

{******************************************************************************}

function  LightLibVersionStr( AProduct : Longint ) : String;
Var
    VerMajor : String[10];
    VerMinor : String[10];
    VerNum   : Longint;
    VerEdition : String[20];
begin
    VerNum   := oAccess( 0, LLO_ABSTRACT_LIBRARY_VERSION, AProduct );
    if ( VerNum <> 0 ) then
    begin
        VerMajor := Copy(IntToStr(VerNum),1,1);
        VerMinor := Copy(IntToStr(VerNum),2,2);
        if ( Copy(IntToStr(VerNum), 4, 1) = '1' ) then
            VerEdition := ' (Evaluation)'
        else if ( Copy(IntToStr(VerNum),4,1) = '2' ) then
            VerEdition := ' (Runtime)'
        else if ( Copy(IntToStr(VerNum),4,1) = '4' ) then
            VerEdition := ' (Standard)'
        else if ( Copy(IntToStr(VerNum),4,1) = '8' ) then
            VerEdition := ' (Professional)';
        Result   := 'Version ' + VerMajor + '.' + VerMinor + VerEdition;
    end
    else
        Result   := 'Version (not known)';

end;

{******************************************************************************}

function  LightLibCopyrightStr : String;
Var year : string;
begin
    year := FormatDateTime( 'YYYY', Now );
    if year = '1995' then year := '1996';
    Result := 'Copyright (C) 1995 - ' +
               year +
              ' DFL Software, Inc.';
end;

{******************************************************************************}

begin

    lWarnProError := True;
    DelphiObjectInCargo := False;

    { Do this to ensure correct loadind of DLL }
    if ( oDLLLoad = 1 ) then begin end;

end. { of unit LLO }

