unit iFilter;


{******************************************************************************}
interface
{******************************************************************************}
uses Classes, Controls, Messages, WinTypes, Forms, Graphics, WinProcs, StdCtrls,
     SysUtils, LLO;

{ include Light Lib Images defines }
{$I LLI.INC}
const
    MaxMatrixSize = 11;
type
    TFilterMatrix = Array[1..MaxMatrixSize,1..MaxMatrixSize] of Integer;
type
    TUserFilter = Class(TObject)
    protected
        FSize      : Integer;
        FMatrix    : TFilterMatrix;
        FRGBFilter : Longint;
        FFilter    : Longint;
    private
        procedure SetCell( x, y : Integer; Value : Integer );
        function GetCell( x, y : Integer ): Integer;
    public
        Constructor Create( AOwner: TLightLibBase; ASize : Integer );
        Destructor Destroy; override;
        property RGBFilter : Longint read FRGBFilter write FRGBFilter;
        property Filter : Longint read FFilter;
        property Matrix[X, Y: Integer]: Integer read GetCell write SetCell;
        property Size : Integer read FSize;
    end;


{******************************************************************************}
implementation
{******************************************************************************}

Constructor TUserFilter.Create( AOwner: TLightLibBase; ASize : Integer );
begin
    inherited Create;

    if ( ASize in [1..MaxMatrixSize] ) then
        FSize := ASize
    else
        FSize := 3;

    FFilter := oNew( LLI_CLASS_FILTER,
                     AOwner.liLightLibApp,
                     FSize,
                     0,
                     0 );

end;

{******************************************************************************}

Destructor TUserFilter.Destroy;
begin
    if ( FFilter <> 0 ) then
        FFilter := oDel( FFilter );

    inherited Destroy;
end;

{******************************************************************************}

procedure TUserFilter.SetCell( x, y : Integer; Value : Integer );
begin
    if ( x in [1..FSize] ) and
       ( y in [1..FSize] ) then
        Matrix[x,y] := Value;
end;

{******************************************************************************}

function TUserFilter.GetCell( x, y : Integer ): Integer;
begin
    if ( x in [1..FSize] ) and
       ( y in [1..FSize] ) then
        Result := Matrix[x,y]
    else
        Result := 0;
end;

{******************************************************************************}
end.
