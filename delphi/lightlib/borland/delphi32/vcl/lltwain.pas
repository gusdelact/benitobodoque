{******************************************************************************}
{*                                                                            *}
{*                   DFL Software's Light Lib Twain Unit                      *}
{*                  (C) Copyright DFL Software, Inc. 1996                     *}
{*                                                                            *}
{******************************************************************************}

unit Lltwain;

{******************************************************************************}
interface
{******************************************************************************}
uses Classes, Controls, Messages, WinTypes, Forms, Graphics, WinProcs, StdCtrls,
     SysUtils, DsgnIntf, Dialogs, LLO;

{ include Light Lib Object defines }
{$I LLO.INC}

{ include Light Lib Twain defines }
{$I LLI.INC}

{******************************************************************************}
(*                 Light Lib Twain Propertiy Hirarchy

               TLLVar                      TLLList
                  |-- TLLStringVar            |-- TLLStringList
                  |-- TLLDoubleVar            |-- TLLDoubleList
                  |-- TLLBooleanVar           |-- TLLBooleanList
                  |-- TLLWordVar              |-- TLLWordList
*)

{******************************************************************************}
{*                            Var class declarations                          *}
{******************************************************************************}


type
  TLLVar = class ( TObject )
      private
          FTwainObject  : Longint;  { pointer to twain object }
          FProperty     : Longint;  { the twain property }
      protected
          function GetpValue: Longint;
          procedure SetpValue( NewValue: Longint );
          function GetIsSupported: Boolean;
      public
          Constructor Create( pTwainObject: Longint; nProperty: Longint ); virtual;
          Destructor Destroy; virtual;
          property IsSupported: Boolean read GetIsSupported;
  end;

{******************************************************************************}

  TLLStringVar = class ( TLLVar )
      private
      protected
          function GetValue: String;
          procedure SetValue( NewValue: String );
      public
          Constructor Create( pTwainObject: Longint; nProperty: Longint ); virtual;
          Destructor Destroy; virtual;
          property Value: String read GetValue write SetValue;
  end;

{******************************************************************************}

  TLLDoubleVar = class ( TLLVar )
      private
      protected
          function GetValue: Double;
          procedure SetValue( NewValue: Double );
      public
          Constructor Create( pTwainObject: Longint; nProperty: Longint ); virtual;
          Destructor Destroy; virtual;
          property Value: Double read GetValue write SetValue;
  end;

{******************************************************************************}

  TLLBooleanVar = class ( TLLVar )
      private
      protected
          function GetValue: Boolean;
          procedure SetValue( NewValue: Boolean );
      public
          Constructor Create( pTwainObject: Longint; nProperty: Longint ); virtual;
          Destructor Destroy; virtual;
          property Value: Boolean read GetValue write SetValue;
  end;

{******************************************************************************}

  TLLWordVar = class ( TLLVar )
      private
      protected
          function GetValue: Word;
          procedure SetValue( NewValue: Word );
      public
          Constructor Create( pTwainObject: Longint; nProperty: Longint ); virtual;
          Destructor Destroy; virtual;
          property Value: Word read GetValue write SetValue;
  end;

{******************************************************************************}
{*                          List class declarations                           *}
{******************************************************************************}

type
  TListType = ( ltUnknown, ltRange, ltEnumerated );

{******************************************************************************}

type
  TLLList = class ( TObject )
      private
          FLightLibList : Longint;  { pointer to list object }
          FTwainObject  : Longint;  { pointer to twain object }
          FProperty     : Longint;  { the twain property }
      protected
          function GetpValue: Longint;
          procedure SetpValue( NewValue: Longint );
          function GetListType: TListType;
          function GetpFirst: Longint;
          function GetpNext: Longint;
          function GetpPrevious: Longint;
          function GetpLast: Longint;
          function GetpMin: Longint;
          function GetpMax: Longint;
          function GetpItem( Index: Longint ): Longint;
          function GetStep: Double;
          function GetCount: Longint;
          function GetItemSize: Longint;
          function GetIsSupported: Boolean;
          function IspValid( AValue: Longint ): Boolean;
      public
          Constructor Create( pTwainObject: Longint; nProperty: Longint ); virtual;
          Destructor Destroy; virtual;
          property IsSupported: Boolean read GetIsSupported;
          property ListType: TListType read GetListType;
          property Count: Longint read GetCount;
          property ItemSize: Longint read GetItemSize;
          property Step: Double read GetStep;
  end;

{******************************************************************************}

type
  TLLStringList = Class ( TLLList )
      private
      protected
          function GetValue: String;
          procedure SetValue( NewValue: String );
          function GetFirst: String;
          function GetNext: String;
          function GetPrevious: String;
          function GetLast: String;
          function GetMin: String;
          function GetMax: String;
      public
          Constructor Create( pTwainObject: Longint; nProperty: Longint ); virtual;
          Destructor Destroy; virtual;
          function Item( Index: Longint ): String;
          function IsValid( AValue: String ): Boolean;
          property Value: String read GetValue write SetValue;
          property First: String read GetFirst;
          property Next: String read GetNext;
          property Previous: String read GetPrevious;
          property Last: String read GetLast;
          property Min: String read GetMin;
          property Max: String read GetMax;
  end;

{******************************************************************************}

type
  TLLDoubleList = Class ( TLLList )
      private
      protected
          function GetValue: Double;
          procedure SetValue( NewValue: Double );
          function GetFirst: Double;
          function GetNext: Double;
          function GetPrevious: Double;
          function GetLast: Double;
          function GetMin: Double;
          function GetMax: Double;
      public
          Constructor Create( pTwainObject: Longint; nProperty: Longint ); virtual;
          Destructor Destroy; virtual;
          function Item( Index: Longint ): Double;
          function IsValid( AValue: Double ): Boolean;
          property Value: Double read GetValue write SetValue;
          property First: Double read GetFirst;
          property Next: Double read GetNext;
          property Previous: Double read GetPrevious;
          property Last: Double read GetLast;
          property Min: Double read GetMin;
          property Max: Double read GetMax;
  end;

{******************************************************************************}

type
  TLLBooleanList = Class ( TLLList )
      private
      protected
          function GetValue: Boolean;
          procedure SetValue( NewValue: Boolean );
          function GetFirst: Boolean;
          function GetNext: Boolean;
          function GetPrevious: Boolean;
          function GetLast: Boolean;
          function GetMin: Boolean;
          function GetMax: Boolean;
      public
          Constructor Create( pTwainObject: Longint; nProperty: Longint ); virtual;
          Destructor Destroy; virtual;
          function Item( Index: Longint ): Boolean;
          function IsValid( AValue: Boolean ): Boolean;
          property Value: Boolean read GetValue write SetValue;
          property First: Boolean read GetFirst;
          property Next: Boolean read GetNext;
          property Previous: Boolean read GetPrevious;
          property Last: Boolean read GetLast;
          property Min: Boolean read GetMin;
          property Max: Boolean read GetMax;
  end;

{******************************************************************************}

type
  TLLWordList = Class ( TLLList )
      private
      protected
          function GetValue: Word;
          procedure SetValue( NewValue: Word );
          function GetFirst: Word;
          function GetNext: Word;
          function GetPrevious: Word;
          function GetLast: Word;
          function GetMin: Word;
          function GetMax: Word;
      public
          Constructor Create( pTwainObject: Longint; nProperty: Longint ); virtual;
          Destructor Destroy; virtual;
          function Item( Index: Longint ): Word;
          function IsValid( AValue: Word ): Boolean;
          property Value: Word read GetValue write SetValue;
          property First: Word read GetFirst;
          property Next: Word read GetNext;
          property Previous: Word read GetPrevious;
          property Last: Word read GetLast;
          property Min: Word read GetMin;
          property Max: Word read GetMax;
  end;

{******************************************************************************}
{*                          Twain class declaration                           *}
{******************************************************************************}

type
  TLLTwain = Class ( TObject )
      private
          FOwner:            TLightLibBase;
          FTwainObject:      Longint; { pointer to twain object }
          FSourceName:       TLLStringList;
          FResolutionX:      TLLDoubleList;
          FResolutionY:      TLLDoubleList;
          FDeviceUnits:      TLLWordList;
          FPhysicalWidth:    TLLDoubleVar;
          FPhysicalHeight:   TLLDoubleVar;
          FFeederEnabled:     TLLBooleanVar;
          FFeederLoaded:     TLLBooleanVar;
          FFeederAutofeed:   TLLBooleanVar;
          FAutoBright:       TLLBooleanVar;
          FBrightness:       TLLDoubleList;
          FContrast:         TLLDoubleList;
          FScaleX:           TLLDoubleList;
          FScaleY:           TLLDoubleList;
          FPixelType:        TLLWordList;
          FBitDepth:         TLLWordList;
          FLightest:         TLLDoubleList;
          FDarkest:          TLLDoubleList;
          FSizeX1:           TLLDoubleVar;
          FSizeY1:           TLLDoubleVar;
          FSizeX2:           TLLDoubleVar;
          FSizeY2:           TLLDoubleVar;
      protected
          function GetSourceName: TLLStringList;
          function GetResolutionX: TLLDoubleList;
          function GetResolutionY: TLLDoubleList;
          function GetDeviceUnits: TLLWordList;
          function GetPhysicalWidth: TLLDoubleVar;
          function GetPhysicalHeight: TLLDoubleVar;
          function GetFeederEnabled: TLLBooleanVar;
          function GetFeederLoaded: TLLBooleanVar;
          function GetFeederAutofeed: TLLBooleanVar;
          function GetAutoBright: TLLBooleanVar;
          function GetBrightness: TLLDoubleList;
          function GetContrast: TLLDoubleList;
          function GetScaleX: TLLDoubleList;
          function GetScaleY: TLLDoubleList;
          function GetPixelType: TLLWordList;
          function GetBitDepth: TLLWordList;
          function GetLightest: TLLDoubleList;
          function GetDarkest: TLLDoubleList;
          function GetSizeX1: TLLDoubleVar;
          function GetSizeY1: TLLDoubleVar;
          function GetSizeX2: TLLDoubleVar;
          function GetSizeY2: TLLDoubleVar;

          procedure Cleanup; { clear all properties (list and var) }
      public
          Constructor Create( AOwner: TLightLibBase ); virtual;
          Destructor Destroy; virtual;
          function LoadFromBlob( FileName: TFileName ): Boolean;
          function SaveToBlob( FileName: TFileName ): Boolean;
          property SourceName: TLLStringList read GetSourceName;
          property ResolutionX: TLLDoubleList read GetResolutionX;
          property ResolutionY: TLLDoubleList read GetResolutionY;
          property DeviceUnits: TLLWordList read GetDeviceUnits;
          property PhysicalWidth: TLLDoubleVar read GetPhysicalWidth;
          property PhysicalHeight: TLLDoubleVar read GetPhysicalHeight;
          property FeederEnabled: TLLBooleanVar read GetFeederEnabled;
          property FeederLoaded: TLLBooleanVar read GetFeederLoaded;
          property FeederAutofeed: TLLBooleanVar read GetFeederAutofeed;
          property AutoBright: TLLBooleanVar read GetAutoBright;
          property Brightness: TLLDoubleList read GetBrightness;
          property Contrast: TLLDoubleList read GetContrast;
          property ScaleX: TLLDoubleList read GetScaleX;
          property ScaleY: TLLDoubleList read GetScaleY;
          property PixelType: TLLWordList read GetPixelType;
          property BitDepth: TLLWordList read GetBitDepth;
          property Lightest: TLLDoubleList read GetLightest;
          property Darkest: TLLDoubleList read GetDarkest;
          property SizeX1: TLLDoubleVar read GetSizeX1;
          property SizeY1: TLLDoubleVar read GetSizeY1;
          property SizeX2: TLLDoubleVar read GetSizeX2;
          property SizeY2: TLLDoubleVar read GetSizeY2;
          property LLTwainObject: Longint read FTwainObject;
  end;

{******************************************************************************}
implementation
{******************************************************************************}

{******************************************************************************}
{*                       TLLVar class implementation                          *}
{******************************************************************************}

Constructor TLLVar.Create( pTwainObject: Longint; nProperty: Longint );
begin
    FTwainObject  := pTwainObject;
    FProperty     := nProperty;
end;

{******************************************************************************}

Destructor TLLVar.Destroy;
begin
end;

{******************************************************************************}

function TLLVar.GetpValue: Longint;
begin
    { returns a pointer to the value }
    Result := oAccess( FTwainObject, FProperty, LLI_ACCESS_TWAIN_SELECTION ) {MH}
end;

{******************************************************************************}

procedure TLLVar.SetpValue( NewValue: Longint );
begin
    { sets the Var value }
    if ( IsSupported ) then
        oAssign( FTwainObject, FProperty, NewValue, 0 ); 
end;

{******************************************************************************}

function TLLVar.GetIsSupported: Boolean;
var
    Res : Longint;
begin
    { returns true if the capability is supported by the driver }
    Res := oAccess( FTwainObject, FProperty, LLI_ACCESS_TWAIN_CAPABILITY_AVAILABLE );
    Result := Boolean( Res );
end;

{******************************************************************************}


{******************************************************************************}
{*                    TLLStringVar class implementation                       *}
{******************************************************************************}

Constructor TLLStringVar.Create( pTwainObject: Longint; nProperty: Longint );
begin
    inherited Create( pTwainObject, nProperty );
end;

{******************************************************************************}

Destructor TLLStringVar.Destroy;
begin
    inherited Destroy;
end;

{******************************************************************************}

function TLLStringVar.GetValue: String;
Var
    pTmp: Longint;
begin
    pTmp := GetpValue;
    if ( pTmp <> 0 ) then
        Result := StrPas( PChar( pTmp ) )
    else
        Result := '';
end;

{******************************************************************************}

procedure TLLStringVar.SetValue( NewValue: String );
Var
    pTmp : Array[0..255] of char;
begin
    StrPCopy( pTmp, NewValue );
    SetpValue( LongInt( @pTmp ) );
end;

{******************************************************************************}


{******************************************************************************}
{*                    TLLDoubleVar class implementation                       *}
{******************************************************************************}

Constructor TLLDoubleVar.Create( pTwainObject: Longint; nProperty: Longint );
begin
    inherited Create( pTwainObject, nProperty );
end;

{******************************************************************************}

Destructor TLLDoubleVar.Destroy;
begin
    inherited Destroy;
end;

{******************************************************************************}

function TLLDoubleVar.GetValue: Double;
Var
    pTmp : Longint;
    ptrDouble : ^double ;
begin
    pTmp := GetpValue;
    ptrDouble := Pointer( pTmp );
    if ( ptrDouble <> Nil ) then
        Result := ptrDouble^
    else
        Result := 0.0 ;
end;

{******************************************************************************}

procedure TLLDoubleVar.SetValue( NewValue: Double );
begin
    SetpValue( LongInt( @NewValue ) );
end;

{******************************************************************************}


{******************************************************************************}
{*                    TLLBooleanVar class implementation                      *}
{******************************************************************************}

Constructor TLLBooleanVar.Create( pTwainObject: Longint; nProperty: Longint );
begin
    inherited Create( pTwainObject, nProperty );
end;

{******************************************************************************}

Destructor TLLBooleanVar.Destroy;
begin
    inherited Destroy;
end;

{******************************************************************************}

function TLLBooleanVar.GetValue: Boolean;
begin
    Result := Boolean( GetpValue );
end;

{******************************************************************************}

procedure TLLBooleanVar.SetValue( NewValue: Boolean );
begin
    SetpValue( LongInt( NewValue ) );
end;

{******************************************************************************}


{******************************************************************************}
{*                       TLLWordVar class implementation                      *}
{******************************************************************************}

Constructor TLLWordVar.Create( pTwainObject: Longint; nProperty: Longint );
begin
    inherited Create( pTwainObject, nProperty );
end;

{******************************************************************************}

Destructor TLLWordVar.Destroy;
begin
    inherited Destroy;
end;

{******************************************************************************}

function TLLWordVar.GetValue: Word;
begin
    Result := Word( GetpValue );
end;

{******************************************************************************}

procedure TLLWordVar.SetValue( NewValue: Word );
begin
    SetpValue( LongInt( NewValue ) );
end;

{******************************************************************************}

{******************************************************************************}
{*                       TLLList class implementation                         *}
{******************************************************************************}

Constructor TLLList.Create( pTwainObject: Longint; nProperty: Longint );
begin
    { get the Light Lib List Object from the DLL }
    FLightLibList := oAccess( pTwainObject, nProperty, LLI_ACCESS_TWAIN_ENUMERATION );
    FTwainObject  := pTwainObject;
    FProperty     := nProperty;
end;

{******************************************************************************}

Destructor TLLList.Destroy;
begin
    { the Light Lib List object is allocated by the DLL but has to be freed here }
    if ( FLightLibList <> 0 ) then
        FLightLibList := oDel( FLightLibList );
end;

{******************************************************************************}

function TLLList.GetListType: TListType;
begin
    { returns the type of the list ( RANGE or ENUMERATED ) }
    if ( oAccess( FLightLibList, LLO_LIST_TYPE, 0 ) = LLO_TYPE_RANGE ) then
        Result := ltRange
    else if ( oAccess( FLightLibList, LLO_LIST_TYPE, 0 ) = LLO_TYPE_ENUM ) then
        Result := ltEnumerated
    else
        Result := ltUnknown;
end;

{******************************************************************************}

function TLLList.GetpValue: Longint;
begin
    { returns a pointer to the current item in the list }
    Result := oAccess( FTwainObject, FProperty, 0 );
end;

{******************************************************************************}

procedure TLLList.SetpValue( NewValue: Longint );
begin
    { sets the current item in the list }
    if ( IsSupported ) then
        oAssign( FTwainObject, FProperty, NewValue, 0 );
end;

{******************************************************************************}

function TLLList.GetpFirst: Longint;
begin
    { returns a pointer to the first item in the list }
    Result := oAccess( FLightLibList, LLO_LIST_FIRST, 0 );
end;

{******************************************************************************}

function TLLList.GetpNext: Longint;
begin
    { returns a pointer to the next item in the list }
    Result := oAccess( FLightLibList, LLO_LIST_NEXT, 0 );
end;

{******************************************************************************}

function TLLList.GetpPrevious: Longint;
begin
    { returns a pointer to the previous item in the list }
    Result := oAccess( FLightLibList, LLO_LIST_PREVIOUS, 0 );
end;

{******************************************************************************}

function TLLList.GetpLast: Longint;
begin
    { returns a pointer to the last item in the list }
    Result := oAccess( FLightLibList, LLO_LIST_LAST, 0 );
end;

{******************************************************************************}

function TLLList.GetpMin: Longint;
begin
    { returns the min value for a range list }
    Result := oAccess( FLightLibList, LLO_LIST_MIN, 0 );
end;

{******************************************************************************}

function TLLList.GetpMax: Longint;
begin
    { returns the max value for a range list }
    Result := oAccess( FLightLibList, LLO_LIST_MAX, 0 );
end;

{******************************************************************************}

function TLLList.GetpItem( Index: Longint ): Longint;
begin
    { returns the 'Index'th item in the list }
    Result := oAccess( FLightLibList, LLO_LIST_INDEX, Index );
end;

{******************************************************************************}

function TLLList.GetStep: Double;
begin
    { returns the step if the lis is a range }
    Result := Double( Pointer( oAccess( FLightLibList, LLO_LIST_STEP, 0 ) )^ );
end;

{******************************************************************************}

function TLLList.GetCount: Longint;
begin
    { returns the number of items in the list }
    Result := oAccess( FLightLibList, LLO_LIST_COUNT, 0 );
end;

{******************************************************************************}

function TLLList.GetItemSize: Longint;
begin
    { returns the size in bytes of one item in the list }
    Result := oAccess( FLightLibList, LLO_LIST_ITEM_SIZE, 0 );
end;

{******************************************************************************}

function TLLList.GetIsSupported: Boolean;
var
    Res : Longint;
begin
    { returns true if the capability is supported by the driver }
    Res := oAccess( FTwainObject, FProperty, LLI_ACCESS_TWAIN_CAPABILITY_AVAILABLE );
    Result := Boolean( Res );
end;

{******************************************************************************}

function TLLList.IspValid( AValue: Longint ): Boolean;
Var
    OldCurrent: Longint;
    TestCurrent: Longint;

    function MemCmp(p1, p2: Longint; Size: Longint ): Boolean;
    begin
        if ( p1 = 0 ) or ( p2 = 0 ) then
        begin
            Result := False;
            exit;
        end;

        Result := True;
        if (Size > 8) then { string list }
        begin
            while ( Result ) and ( Size > 0 ) and
                  ( (Byte(Pointer(p1)^) <> 0) and (Byte(Pointer(p2)^) <> 0) ) do
            begin
                Result := ( Byte(Pointer(p1)^) = Byte(Pointer(p2)^) );
                inc( p1 );
                inc( p2 );
                dec( Size );
            end;
        end
        else { double-, boolean- or word list }
        begin
            while ( Result ) and ( Size > 0 ) do
            begin
                Result := ( Byte(Pointer(p1)^) = Byte(Pointer(p2)^) );
                inc( p1 );
                inc( p2 );
                dec( Size );
            end;
        end;
    end;

begin
    { returns TRUE if the AValue is contained in the list }

    { keep old "current" value to restore it later }
    OldCurrent := oAccess( FLightLibList, LLO_LIST_CURRENT, 0 );

    { assign the value to be tested }
    oAssign( FLightLibList, LLO_LIST_CURRENT, AValue, ItemSize );
    TestCurrent := oAccess( FLightLibList, LLO_LIST_CURRENT, 0 );

    { restore  old "current" value }
    oAssign( FLightLibList, LLO_LIST_CURRENT, OldCurrent, 0 );

    Result := MemCmp( TestCurrent, AValue, ItemSize )

end;

{******************************************************************************}



{******************************************************************************}
{*                      TLLStringList class implementation                    *}
{******************************************************************************}

Constructor TLLStringList.Create( pTwainObject: Longint; nProperty: Longint );
begin
    inherited Create( pTwainObject, nProperty );
end;

{******************************************************************************}

Destructor TLLStringList.Destroy;
begin
    inherited Destroy;
end;

{******************************************************************************}

function TLLStringList.GetValue: String;
Var
    pTmp: Longint;
begin
    pTmp := GetpValue;
    if ( pTmp <> 0 ) then
        Result := StrPas( PChar( pTmp ) )
    else
        Result := '';
end;

{******************************************************************************}

procedure TLLStringList.SetValue( NewValue: String );
Var
    pTmp : Array[0..255] of char;
begin
    StrPCopy( pTmp, NewValue );
    SetpValue( LongInt( @pTmp ) );
end;

{******************************************************************************}

function TLLStringList.GetFirst: String;
Var
    pTmp: Longint;
begin
    pTmp := GetpFirst;
    if ( pTmp <> 0 ) then
        Result := StrPas( PChar( pTmp ) )
    else
        Result := '';
end;

{******************************************************************************}

function TLLStringList.GetNext: String;
Var
    pTmp: Longint;
begin
    pTmp := GetpNext;
    if ( pTmp <> 0 ) then
        Result := StrPas( PChar( pTmp ) )
    else
        Result := '';
end;

{******************************************************************************}

function TLLStringList.GetPrevious: String;
Var
    pTmp: Longint;
begin
    pTmp := GetpPrevious;
    if ( pTmp <> 0 ) then
        Result := StrPas( PChar( pTmp ) )
    else
        Result := '';
end;

{******************************************************************************}

function TLLStringList.GetLast: String;
Var
    pTmp: Longint;
begin
    pTmp := GetpLast;
    if ( pTmp <> 0 ) then
        Result := StrPas( PChar( pTmp ) )
    else
        Result := '';
end;

{******************************************************************************}

function TLLStringList.GetMin: String;
Var
    pTmp: Longint;
begin
    pTmp := GetpMin;
    if ( pTmp <> 0 ) then
        Result := StrPas( PChar( pTmp ) )
    else
        Result := '';
end;

{******************************************************************************}

function TLLStringList.GetMax: String;
Var
    pTmp: Longint;
begin
    pTmp := GetpMax;
    if ( pTmp <> 0 ) then
        Result := StrPas( PChar( pTmp ) )
    else
        Result := '';
end;

{******************************************************************************}

function TLLStringList.Item( Index: Longint ): String;
Var
    pTmp: Longint;
begin
    pTmp := GetpItem( Index );
    if ( pTmp <> 0 ) then
        Result := StrPas( PChar( pTmp ) )
    else
        Result := '';
end;

{******************************************************************************}

function TLLStringList.IsValid( AValue: String ): Boolean;
Var
    pTmp : Array[0..255] of char;
begin
    StrPCopy( pTmp, AValue );
    Result := IspValid( LongInt( @pTmp ) );
end;

{******************************************************************************}


{******************************************************************************}
{*                      TLLDoubleList class implementation                    *}
{******************************************************************************}

Constructor TLLDoubleList.Create( pTwainObject: Longint; nProperty: Longint );
begin
    inherited Create( pTwainObject, nProperty );
end;

{******************************************************************************}

Destructor TLLDoubleList.Destroy;
begin
    inherited Destroy;
end;

{******************************************************************************}

function TLLDoubleList.GetValue: Double;
Var
    pTmp : Longint;
    pDouble : ^Double ;
begin
    pTmp := GetpValue;
    pDouble := Pointer( pTmp );
    if ( pDouble <> Nil ) then
        Result := pDouble^
    else
        Result := 0.0 ;
end;

{******************************************************************************}

procedure TLLDoubleList.SetValue( NewValue: Double );
begin
    SetpValue( LongInt( @NewValue ) );
end;

{******************************************************************************}

function TLLDoubleList.GetFirst: Double;
Var
    pTmp : Longint;
    pDouble : ^Double ;
begin
    pTmp := GetpFirst;
    pDouble := Pointer( pTmp );
    if ( pDouble <> Nil ) then
        Result := pDouble^
    else
        Result := 0.0 ;
end;

{******************************************************************************}

function TLLDoubleList.GetNext: Double;
Var
    pTmp : Longint;
    pDouble : ^Double ;
begin
    pTmp := GetpNext;
    pDouble := Pointer( pTmp );
    if ( pDouble <> Nil ) then
        Result := pDouble^
    else
        Result := 0.0 ;
end;

{******************************************************************************}

function TLLDoubleList.GetPrevious: Double;
Var
    pTmp : Longint;
    pDouble : ^Double ;
begin
    pTmp := GetpPrevious;
    pDouble := Pointer( pTmp );
    if ( pDouble <> Nil ) then
        Result := pDouble^
    else
        Result := 0.0 ;
end;

{******************************************************************************}

function TLLDoubleList.GetLast: Double;
Var
    pTmp : Longint;
    pDouble : ^Double ;
begin
    pTmp := GetpLast;
    pDouble := Pointer( pTmp );
    if ( pDouble <> Nil ) then
        Result := pDouble^
    else
        Result := 0.0 ;
end;

{******************************************************************************}

function TLLDoubleList.GetMin: Double;
Var
    pTmp : Longint;
    pDouble : ^Double ;
begin
    pTmp := GetpMin;
    pDouble := Pointer( pTmp );
    if ( pDouble <> Nil ) then
        Result := pDouble^
    else
        Result := 0.0 ;
end;

{******************************************************************************}

function TLLDoubleList.GetMax: Double;
Var
    pTmp : Longint;
    pDouble : ^Double ;
begin
    pTmp := GetpMax;
    pDouble := Pointer( pTmp );
    if ( pDouble <> Nil ) then
        Result := pDouble^
    else
        Result := 0.0 ;
end;

{******************************************************************************}

function TLLDoubleList.Item( Index: Longint ): Double;
Var
    pTmp : Longint;
    pDouble : ^Double ;
begin
    pTmp := GetpItem( Index );
    pDouble := Pointer( pTmp );
    if ( pDouble <> Nil ) then
        Result := pDouble^
    else
        Result := 0.0 ;
end;

{******************************************************************************}

function TLLDoubleList.IsValid( AValue: Double ): Boolean;
begin
    Result := IspValid( LongInt( @AValue ) );
end;

{******************************************************************************}


{******************************************************************************}
{*                     TLLBooleanList class implementation                    *}
{******************************************************************************}

Constructor TLLBooleanList.Create( pTwainObject: Longint; nProperty: Longint );
begin
    inherited Create( pTwainObject, nProperty );
end;

{******************************************************************************}

Destructor TLLBooleanList.Destroy;
begin
    inherited Destroy;
end;

{******************************************************************************}

function TLLBooleanList.GetValue: Boolean;
begin
    Result := Boolean( GetpValue );
end;

{******************************************************************************}

procedure TLLBooleanList.SetValue( NewValue: Boolean );
begin
    SetpValue( LongInt( NewValue ) );
end;

{******************************************************************************}

function TLLBooleanList.GetFirst: Boolean;
Var
    pTmp : Longint;
    pBoolean : ^Boolean ;
begin
    pTmp   := GetpFirst;
    pBoolean  := Pointer( pTmp );
    if ( pBoolean <> Nil ) then
        Result := pBoolean^
    else
        Result := False;
end;

{******************************************************************************}

function TLLBooleanList.GetNext: Boolean;
Var
    pTmp : Longint;
    pBoolean : ^Boolean ;
begin
    pTmp   := GetpNext;
    pBoolean  := Pointer( pTmp );
    if ( pBoolean <> Nil ) then
        Result := pBoolean^
    else
        Result := False;
end;

{******************************************************************************}

function TLLBooleanList.GetPrevious: Boolean;
Var
    pTmp : Longint;
    pBoolean : ^Boolean ;
begin
    pTmp   := GetpPrevious;
    pBoolean  := Pointer( pTmp );
    if ( pBoolean <> Nil ) then
        Result := pBoolean^
    else
        Result := False;
end;

{******************************************************************************}

function TLLBooleanList.GetLast: Boolean;
Var
    pTmp : Longint;
    pBoolean : ^Boolean ;
begin
    pTmp   := GetpLast;
    pBoolean  := Pointer( pTmp );
    if ( pBoolean <> Nil ) then
        Result := pBoolean^
    else
        Result := False;
end;

{******************************************************************************}

function TLLBooleanList.GetMin: Boolean;
Var
    pTmp : Longint;
    pBoolean : ^Boolean ;
begin
    pTmp   := GetpMin;
    pBoolean  := Pointer( pTmp );
    if ( pBoolean <> Nil ) then
        Result := pBoolean^
    else
        Result := False;
end;

{******************************************************************************}

function TLLBooleanList.GetMax: Boolean;
Var
    pTmp : Longint;
    pBoolean : ^Boolean ;
begin
    pTmp   := GetpMax;
    pBoolean  := Pointer( pTmp );
    if ( pBoolean <> Nil ) then
        Result := pBoolean^
    else
        Result := False;
end;

{******************************************************************************}

function TLLBooleanList.Item( Index: Longint ): Boolean;
Var
    pTmp : Longint;
    pBoolean : ^Boolean ;
begin
    pTmp   := GetpItem( Index );
    pBoolean  := Pointer( pTmp );
    if ( pBoolean <> Nil ) then
        Result := pBoolean^
    else
        Result := False;
end;

{******************************************************************************}

function TLLBooleanList.IsValid( AValue: Boolean ): Boolean;
begin
    Result := IspValid( LongInt( @AValue ) );
end;

{******************************************************************************}


{******************************************************************************}
{*                       TLLWordList class implementation                     *}
{******************************************************************************}

Constructor TLLWordList.Create( pTwainObject: Longint; nProperty: Longint );
begin
    inherited Create( pTwainObject, nProperty );
end;

{******************************************************************************}

Destructor TLLWordList.Destroy;
begin
    inherited Destroy;
end;

{******************************************************************************}
function TLLWordList.GetValue: Word;
begin
    Result := Word( GetpValue );
end;

{******************************************************************************}

procedure TLLWordList.SetValue( NewValue: Word );
begin
    SetpValue( LongInt( NewValue ) );
end;

{******************************************************************************}

function TLLWordList.GetFirst: Word;
Var
    pTmp : Longint;
    pWord : ^Word ;
begin
    pTmp   := GetpFirst;
    pWord  := Pointer( pTmp );
    if ( pWord <> Nil ) then
        Result := pWord^
    else
        Result := 0;
end;

{******************************************************************************}

function TLLWordList.GetNext: Word;
Var
    pTmp : Longint;
    pWord : ^Word ;
begin
    pTmp   := GetpNext;
    pWord  := Pointer( pTmp );
    if ( pWord <> Nil ) then
        Result := pWord^
    else
        Result := 0;
end;

{******************************************************************************}

function TLLWordList.GetPrevious: Word;
Var
    pTmp : Longint;
    pWord : ^Word ;
begin
    pTmp   := GetpPrevious;
    pWord  := Pointer( pTmp );
    if ( pWord <> Nil ) then
        Result := pWord^
    else
        Result := 0;
end;

{******************************************************************************}

function TLLWordList.GetLast: Word;
Var
    pTmp : Longint;
    pWord : ^Word ;
begin
    pTmp   := GetpLast;
    pWord  := Pointer( pTmp );
    if ( pWord <> Nil ) then
        Result := pWord^
    else
        Result := 0;
end;

{******************************************************************************}

function TLLWordList.GetMin: Word;
Var
    pTmp : Longint;
    pWord : ^Word ;
begin
    pTmp   := GetpMin;
    pWord  := Pointer( pTmp );
    if ( pWord <> Nil ) then
        Result := pWord^
    else
        Result := 0;
end;

{******************************************************************************}

function TLLWordList.GetMax: Word;
Var
    pTmp : Longint;
    pWord : ^Word ;
begin
    pTmp   := GetpMax;
    pWord  := Pointer( pTmp );
    if ( pWord <> Nil ) then
        Result := pWord^
    else
        Result := 0;
end;

{******************************************************************************}

function TLLWordList.Item( Index: Longint ): Word;
Var
    pTmp : Longint;
    pWord : ^Word ;
begin
    pTmp   := GetpItem( Index );
    pWord  := Pointer( pTmp );
    if ( pWord <> Nil ) then
        Result := pWord^
    else
        Result := 0;
end;

{******************************************************************************}

function TLLWordList.IsValid( AValue: Word ): Boolean;
begin
    Result := IspValid( LongInt( @AValue ) );
end;

{******************************************************************************}


{******************************************************************************}
{*                       TLLTwain class implementation                        *}
{******************************************************************************}

Constructor TLLTwain.Create( AOwner: TLightLibBase );
begin
    FOwner := AOwner;
    { set the base to zero }
    oAssign ( AOwner.liLightLibApp, LLO_APPLICATION_OPTION_BASE, 0, 0 );

    { create a new Light Lib Twain object }
    FTwainObject := oNew( LLI_CLASS_TWAIN, AOwner.liLightLibApp, 1, Application.Handle, LLO_VOID_PARAM );

    if ( FTwainObject <> 0 ) then
    begin
        FSourceName := TLLStringList.Create( FTwainObject, LLI_TWAIN_SOURCE );
    end;
end;

{******************************************************************************}

Destructor TLLTwain.Destroy;
begin
    Cleanup;
end;

{******************************************************************************}

procedure TLLTwain.Cleanup;
begin
    if ( FSourceName <> nil ) then     begin FSourceName.Destroy;     FSourceName     := nil; end;

    if ( FResolutionX <> nil ) then    begin FResolutionX.Destroy;    FResolutionX    := nil; end;
    if ( FResolutionY <> nil ) then    begin FResolutionY.Destroy;    FResolutionY    := nil; end;
    if ( FDeviceUnits <> nil ) then    begin FDeviceUnits.Destroy;    FDeviceUnits    := nil; end;
    if ( FPhysicalWidth <> nil ) then  begin FPhysicalWidth.Destroy;  FPhysicalWidth  := nil; end;
    if ( FPhysicalHeight <> nil ) then begin FPhysicalHeight.Destroy; FPhysicalHeight := nil; end;
    if ( FFeederEnabled <> nil ) then   begin FFeederEnabled.Destroy; FFeederEnabled  := nil; end;
    if ( FFeederLoaded <> nil ) then   begin FFeederLoaded.Destroy;   FFeederLoaded   := nil; end;
    if ( FFeederAutofeed <> nil ) then begin FFeederAutofeed.Destroy; FFeederAutofeed := nil; end;
    if ( FAutoBright <> nil ) then     begin FAutoBright.Destroy;     FAutoBright     := nil; end;
    if ( FBrightness <> nil ) then     begin FBrightness.Destroy;     FBrightness     := nil; end;
    if ( FContrast <> nil ) then       begin FContrast.Destroy;       FContrast       := nil; end;
    if ( FScaleX <> nil ) then         begin FScaleX.Destroy;         FScaleX         := nil; end;
    if ( FScaleY <> nil ) then         begin FScaleY.Destroy;         FScaleY         := nil; end;
    if ( FPixelType <> nil ) then      begin FPixelType.Destroy;      FPixelType      := nil; end;
    if ( FBitDepth <> nil ) then       begin FBitDepth.Destroy;       FBitDepth       := nil; end;
    if ( FLightest <> nil ) then       begin FLightest.Destroy;       FLightest       := nil; end;
    if ( FDarkest <> nil ) then        begin FDarkest.Destroy;        FDarkest        := nil; end;
    if ( FSizeX1 <> nil ) then         begin FSizeX1.Destroy;         FSizeX1         := nil; end;
    if ( FSizeY1 <> nil ) then         begin FSizeY1.Destroy;         FSizeY1         := nil; end;
    if ( FSizeX2 <> nil ) then         begin FSizeX2.Destroy;         FSizeX2         := nil; end;
    if ( FSizeY2 <> nil ) then         begin FSizeY2.Destroy;         FSizeY2         := nil; end;

    if ( FTwainObject <> 0 ) then
        FTwainObject := oDel( FTwainObject );
end;

{******************************************************************************}

function TLLTwain.LoadFromBlob( FileName: TFileName ): Boolean;
var
    FBlob: Longint;
    NumberOfStrips: Longint;
    sCount: Longint;
    pStrip: Longint;
    StripSize: Longint;
    FileStream: TFileStream;
    BlobSize: Longint;
    nRead: Longint;
    {$ifdef Win32}
    TwainSignature: Array[1..12] of AnsiChar;
    {$else}
    TwainSignature: Array[1..12] of Char;
    {$endif}
begin
    Result := False;

    FBlob := oNew( LLO_CLASS_BLOB,                    { make a new blob        }
                   FOwner.liLightLibApp, { Light Lib Application  }
                   -1,
                   Longint( TLightLibStripSize ),     { StripSize = 2048       }
                   0 );

    if ( FBlob <> 0 ) and ( FileExists( FileName ) ) then
    begin

        { create the stream where to read from }
        FileStream := TFileStream.Create( FileName, fmOpenRead );
        FileStream.Read( TwainSignature, sizeof(TwainSignature) );

        if ( TwainSignature[1]  = 'B' ) and
           ( TwainSignature[2]  = 'L' ) and
           ( TwainSignature[3]  = 'O' ) and
           ( TwainSignature[4]  = 'B' ) and
           ( TwainSignature[5]  = '0' ) and
           ( TwainSignature[6]  = '1' ) and
           ( TwainSignature[7]  = '0' ) and
           ( TwainSignature[8]  = '4' ) and
           ( TwainSignature[9]  = '0' ) and
           ( TwainSignature[10] = '0' ) and
           ( TwainSignature[11] = '0' ) and
           ( TwainSignature[12] = '0' ) then
        begin
            { seek back to begin of file }
            FileStream.Seek( 0, 0 );
            { get the size of the delphi blob }
            BlobSize := FileStream.Seek( 0, 2 );

            if ( BlobSize > 0 ) then
            begin
                 FileStream.Seek( 0, 0 );

                 { set the base to zero }
                 oAssign ( FOwner.liLightLibApp, LLO_APPLICATION_OPTION_BASE, 0, 0 );

                 { set the size of the blob }
                 oAssign( FBlob, LLO_BLOB_SIZE, BlobSize, 0 );

                 NumberOfStrips := ( BlobSize div TLightLibStripSize ) + 1 ;

                 { write each strip to the container }

                 for sCount := 0 to NumberOfStrips do
                 begin
                     pStrip := oAccess( FBlob, LLO_BLOB_STRIP_PTR, sCount );
                     FileStream.Read( Pointer( pStrip )^, TLightLibStripSize );
                 end;

                 CleanUp;
                 FTwainObject := oCopy( FOwner.liLightLibApp, FBlob, LLO_COPY_UNBLOB, 0, 0, 0 );

                 if ( FTwainObject <> 0 ) then
                 begin
                     { IMPORTANT: assign the application handle to the twain object }
                     oAssign( FTwainObject, LLI_TWAIN_HWND, Application.Handle, 0 );
                 end;

            end;
        end;

        FileStream.Free;
        FBlob := oDel( FBlob );

    end;

    if ( FTwainObject <> 0 ) then
    begin
        if ( FSourceName = nil ) then
        begin
            FSourceName := TLLStringList.Create( FTwainObject, LLI_TWAIN_SOURCE );
            Result := True;
        end;
    end;
end;

{******************************************************************************}

function TLLTwain.SaveToBlob( FileName: TFileName ): Boolean;
var
    FBlob: Longint;
    NumberOfStrips: Longint;
    sCount: Longint;
    pStrip: Longint;
    StripSize: Longint;
    FileStream: TFileStream;
    Written: Longint;
    F: File;
begin
    Result := False;
    FBlob := oCopy ( FOwner.liLightLibApp,            { Light Lib Application  }
                     FTwainObject,                   { Light Lib Object Twain }
                     LLO_COPY_BLOB,                  { make a blob            }
                     LLO_COMPRESSION_SIZE + LLO_GENERIC_COMPRESSION_SIZE,
                     Longint(TLightLibStripSize),    { StripSize = 2048       }
                     0 );

    if ( FBlob <> 0 ) then
    begin
        { set the base to zero }
        oAssign ( FOwner.liLightLibApp, LLO_APPLICATION_OPTION_BASE, 0, 0 );

        { get the number of strips in the blob }
        NumberOfStrips := oAccess( FBlob, LLO_BLOB_STRIP_COUNT, 0 );

        AssignFile(F, FileName);
        Rewrite(F);
        CloseFile(F);

        FileStream := TFileStream.Create( FileName, fmOpenWrite );
        try
            { write each strip to the container }
            for sCount := 0 to NumberOfStrips-1 do
            begin
                pStrip   := oAccess( FBlob, LLO_BLOB_STRIP_PTR, sCount );
                Written  := FileStream.Write( Pointer( pStrip )^, TLightLibStripSize );
            end;
            Result := True;
        finally
            FileStream.Free;
            FBlob := oDel( FBlob );
        end;
    end;
end;

{******************************************************************************}

function TLLTwain.GetSourceName: TLLStringList;
begin
    Result := FSourceName;
end;

{******************************************************************************}

function TLLTwain.GetResolutionX: TLLDoubleList;
begin
    if ( FResolutionX <> nil ) then
        FResolutionX.Destroy;
    FResolutionX := TLLDoubleList.Create( FTwainObject, LLI_TWAIN_RESOLUTION_X );
    Result := FResolutionX;
end;

{******************************************************************************}

function TLLTwain.GetResolutionY: TLLDoubleList;
begin
    if ( FResolutionY <> nil ) then
        FResolutionY.Destroy;
    FResolutionY := TLLDoubleList.Create( FTwainObject, LLI_TWAIN_RESOLUTION_Y );
    Result := FResolutionY;
end;

{******************************************************************************}

function TLLTwain.GetDeviceUnits: TLLWordList;
begin
    if ( FDeviceUnits <> nil ) then
        FDeviceUnits.Destroy;
    FDeviceUnits := TLLWordList.Create( FTwainObject, LLI_TWAIN_DEVICE_UNITS );
    Result := FDeviceUnits;
end;

{******************************************************************************}

function TLLTwain.GetPhysicalWidth: TLLDoubleVar;
begin
    if ( FPhysicalWidth <> nil ) then
        FPhysicalWidth.Destroy;
    FPhysicalWidth := TLLDoubleVar.Create( FTwainObject, LLI_TWAIN_DEVICE_PHYSICAL_WIDTH );
    Result := FPhysicalWidth;
end;

{******************************************************************************}

function TLLTwain.GetPhysicalHeight: TLLDoubleVar;
begin
    if ( FPhysicalHeight <> nil ) then
        FPhysicalHeight.Destroy;
    FPhysicalHeight  := TLLDoubleVar.Create( FTwainObject, LLI_TWAIN_DEVICE_PHYSICAL_HEIGHT );
    Result := FPhysicalHeight;
end;

{******************************************************************************}

function TLLTwain.GetFeederEnabled: TLLBooleanVar;
begin
    if ( FFeederEnabled <> nil ) then
        FFeederEnabled.Destroy;
    FFeederEnabled := TLLBooleanVar.Create( FTwainObject, LLI_TWAIN_FEEDER_ENABLED );
    Result := FFeederEnabled;
end;

{******************************************************************************}

function TLLTwain.GetFeederLoaded: TLLBooleanVar;
begin
    if ( FFeederLoaded <> nil ) then
        FFeederLoaded.Destroy;
    FFeederLoaded := TLLBooleanVar.Create( FTwainObject, LLI_TWAIN_FEEDER_LOAD );
    Result := FFeederLoaded;
end;

{******************************************************************************}

function TLLTwain.GetFeederAutofeed: TLLBooleanVar;
begin
    if ( FFeederAutofeed <> nil ) then
        FFeederAutofeed.Destroy;
    FFeederAutofeed := TLLBooleanVar.Create( FTwainObject, LLI_TWAIN_FEEDER_AUTOFEED );
    Result := FFeederAutofeed;
end;

{******************************************************************************}

function TLLTwain.GetAutoBright: TLLBooleanVar;
begin
    if ( FAutoBright <> nil ) then
        FAutoBright.Destroy;
    FAutoBright := TLLBooleanVar.Create( FTwainObject, LLI_TWAIN_ACQ_AUTOBRIGHT );
    Result := FAutoBright;
end;

{******************************************************************************}

function TLLTwain.GetBrightness: TLLDoubleList;
begin
    if ( FBrightness <> nil ) then
        FBrightness.Destroy;
    FBrightness := TLLDoubleList.Create( FTwainObject, LLI_TWAIN_ACQ_BRIGHTNESS );
    Result := FBrightness;
end;

{******************************************************************************}

function TLLTwain.GetContrast: TLLDoubleList;
begin
    if ( FContrast <> nil ) then
        FContrast.Destroy;
    FContrast := TLLDoubleList.Create( FTwainObject, LLI_TWAIN_ACQ_CONTRAST );
    Result := FContrast;
end;

{******************************************************************************}

function TLLTwain.GetScaleX: TLLDoubleList;
begin
    if ( FScaleX <> nil ) then
        FScaleX.Destroy;
    FScaleX := TLLDoubleList.Create( FTwainObject, LLI_TWAIN_ACQ_SCALE_X );
    Result := FScaleX;
end;

{******************************************************************************}

function TLLTwain.GetScaleY: TLLDoubleList;
begin
    if ( FScaleY <> nil ) then
        FScaleY.Destroy;
    FScaleY := TLLDoubleList.Create( FTwainObject, LLI_TWAIN_ACQ_SCALE_Y );
    Result := FScaleY;
end;

{******************************************************************************}

function TLLTwain.GetPixelType: TLLWordList;
begin
    if ( FPixelType <> nil ) then
        FPixelType.Destroy;
    FPixelType := TLLWordList.Create( FTwainObject, LLI_TWAIN_ACQ_PIXEL_TYPE );
    Result := FPixelType;
end;

{******************************************************************************}

function TLLTwain.GetBitDepth: TLLWordList;
begin
    if ( FBitDepth <> nil ) then
        FBitDepth.Destroy;
    FBitDepth := TLLWordList.Create( FTwainObject, LLI_TWAIN_ACQ_BIT_DEPTH );
    Result := FBitDepth;
end;

{******************************************************************************}

function TLLTwain.GetLightest: TLLDoubleList;
begin
    if ( FLightest <> nil ) then
        FLightest.Destroy;
    FLightest := TLLDoubleList.Create( FTwainObject, LLI_TWAIN_LIGHT );
    Result := FLightest;
end;

{******************************************************************************}

function TLLTwain.GetDarkest: TLLDoubleList;
begin
    if ( FDarkest <> nil ) then
        FDarkest.Destroy;
    FDarkest := TLLDoubleList.Create( FTwainObject, LLI_TWAIN_DARK );
    Result := FDarkest;
end;

{******************************************************************************}

function TLLTwain.GetSizeX1: TLLDoubleVar;
begin
    if ( FSizeX1 <> nil ) then
        FSizeX1.Destroy;
    FSizeX1 := TLLDoubleVar.Create( FTwainObject, LLI_TWAIN_SIZE_X1 );
    Result := FSizeX1;
end;

{******************************************************************************}

function TLLTwain.GetSizeY1: TLLDoubleVar;
begin
    if ( FSizeY1 <> nil ) then
        FSizeY1.Destroy;
    FSizeY1 := TLLDoubleVar.Create( FTwainObject, LLI_TWAIN_SIZE_Y1 );
    Result := FSizeY1;
end;

{******************************************************************************}

function TLLTwain.GetSizeX2: TLLDoubleVar;
begin
    if ( FSizeX2 <> nil ) then
        FSizeX2.Destroy;
    FSizeX2 := TLLDoubleVar.Create( FTwainObject, LLI_TWAIN_SIZE_X2 );
    Result := FSizeX2;
end;

{******************************************************************************}

function TLLTwain.GetSizeY2: TLLDoubleVar;
begin
    if ( FSizeY2 <> nil ) then
        FSizeY2.Destroy;
    FSizeY2 := TLLDoubleVar.Create( FTwainObject, LLI_TWAIN_SIZE_Y2 );
    Result := FSizeY2;
end;

{******************************************************************************}

end. { of LLTWAIN }
