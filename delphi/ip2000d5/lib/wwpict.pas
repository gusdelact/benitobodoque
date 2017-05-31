{
//
// Components : TwwPictureValidator
//
// Copyright (c) 1996, 1998 by Woll2Woll Software
//
// Components : TwwPictureValidator
//
// Description: Implement Paradox style PictureMask support
//
}
{$R-}

unit Wwpict;

interface

type

  TwwPicResult = (prComplete, prIncomplete, prEmpty, prError, prSyntax,
    prAmbiguous, prIncompNoFill);

  TwwPictureValidator = class
    Status: Word;
    Options: Word;
    Pic: PString;

   public
    constructor Create(const APic: string; AutoFill: Boolean);
    destructor Destroy; override; { add override 7/12/96}
    function IsValidInput(var S: string;
      SuppressFill: Boolean): Boolean; virtual;
    function IsValid(const S: string): Boolean; virtual;
    function Picture(var Input: string;
      AutoFill: Boolean): TwwPicResult; virtual;
    function isSyntaxError: boolean;
  end;

implementation

uses WinTypes, WinProcs, SysUtils;

const
   vsSyntax =  1;      { Error in the syntax }

  { Validator option flags }
  voFill     =  $0001;
  voTransfer =  $0002;
  voOnAppend =  $0004;

constructor TwwPictureValidator.Create(const APic: string;
  AutoFill: Boolean);
var
  S: String;
begin
  Status := 0;
  Options := 0;

  Pic := NewStr(APic);
  Options := voOnAppend;
  if AutoFill then Options := Options or voFill;
  S := '';
  if Picture(S, False) <> prEmpty then
    Status := vsSyntax;
end;

destructor TwwPictureValidator.Destroy;
begin
  DisposeStr(Pic);
  inherited Destroy;
end;

function TwwPictureValidator.isSyntaxError: boolean;
begin
   result:= (status=vsSyntax);
end;

function TwwPictureValidator.IsValidInput(var S: string;
  SuppressFill: Boolean): Boolean;
begin
  IsValidInput := (Pic = nil) or
     (Picture(S, (Options and voFill <> 0)  and not SuppressFill) <> prError);
end;

function TwwPictureValidator.IsValid(const S: string): Boolean;
var
  Str: String;
  Rslt: TwwPicResult;
begin
  Str := S;
  Rslt := Picture(Str, False);
  IsValid := (Pic = nil) or (Rslt = prComplete) or (Rslt = prEmpty);
end;

function IsNumber(ch: Char): Boolean;
begin
   result:= (ch>='0') and (ch<='9');
end;

function IsLetter(Ch: Char): Boolean;
begin
   result:= ((ch>='A') and (ch<='Z')) or
            ((ch>='a') and (ch<='z'));
end;

{function AnsiUpper(ch: char): boolean;
var temp: string[1];
begin
   temp:= AnsiUpperCase(ch);
   Ch := temp[1];
end;
}
function IsIntlLetter(Ch:char):Boolean;
begin
    result:= (IsLetter(Ch)) or (ord(ch)>128)
end;

function IsComplete(Rslt: TwwPicResult): Boolean;
begin
  IsComplete := Rslt in [prComplete, prAmbiguous];
end;

function IsIncomplete(Rslt: TwwPicResult): Boolean;
begin
  IsIncomplete := Rslt in [prIncomplete, prIncompNoFill];
end;

function TwwPictureValidator.Picture(var Input: string;
  AutoFill: Boolean): TwwPicResult;
var
  I, J: Byte;
  Rslt: TwwPicResult;
  Reprocess: Boolean;

  function Process(TermCh: Byte): TwwPicResult;
  var
    Rslt: TwwPicResult;
    Incomp: Boolean;
    OldI, OldJ, IncompJ, IncompI: Byte;
    skipAutoFill: Boolean;  {9/27/96 - Added to handle autofill and spaces in picture mask}

    { Consume input }
    procedure Consume(Ch: Char);
    begin
      Input[J] := Ch;
      Inc(J);
      Inc(I);
    end;

    { Skip a character or a picture group }
    procedure ToGroupEnd(var I: Byte; TermCh: Byte);
    var
      BrkLevel, BrcLevel: Integer;
    begin
      BrkLevel := 0;
      BrcLevel := 0;
      repeat
        if I = TermCh then Exit;
        case Pic^[I] of
          '[': Inc(BrkLevel);
          ']': Dec(BrkLevel);
          '{': Inc(BrcLevel);
          '}': Dec(BrcLevel);
          ';': Inc(I);
          '*':
            begin
              Inc(I);
              while IsNumber(Pic^[I]) do Inc(I);
              ToGroupEnd(I, Termch);
              Continue;
            end;
        end;
        Inc(I);
      until (BrkLevel <= 0) and (BrcLevel <= 0);
    end;

    procedure ToParensEnd(var I: Byte);
    var
      BrkLevel, BrcLevel: Integer;
    begin
      BrkLevel := 0;
      BrcLevel := 1;
      repeat
        if I = TermCh then Exit;
        case Pic^[I] of
          '[': Inc(BrkLevel);
          ']': Dec(BrkLevel);
          '{': Inc(BrcLevel);
          '}': Dec(BrcLevel);
          ';': Inc(I);
          '*':
            begin
              Inc(I);
              while IsNumber(Pic^[I]) do Inc(I);
              ToGroupEnd(I, TermCh);
              Continue;
            end;
        end;
        Inc(I);
      until (BrkLevel = 0) and (BrcLevel = 0);
    end;

    { Find the a comma separator }
    function SkipToComma: Boolean;
    begin
      repeat ToGroupEnd(I, TermCh) until (I = TermCh) or (Pic^[I] = ',');
      if I<=length(Pic^) then
         if Pic^[I] = ',' then Inc(I);
      SkipToComma := I < TermCh;
    end;

    { Calclate the end of a group }
    function CalcTerm: Byte;
    var
      K: Byte;
    begin
      K := I;
      ToGroupEnd(K, TermCh);
      CalcTerm := K;
    end;

    { The next group is repeated X times }
    function Iteration: TwwPicResult;
    var
      Itr, K, L: Byte;
      Rslt: TwwPicResult;
      NewTermCh: Byte;
      LastJ: Byte;
    begin
      Itr := 0;
      Rslt:= prEmpty; { Make compiler happy about being initialized }
{      Iteration := prError;}

      Inc(I);  { Skip '*' }

      { Retrieve number }
      while IsNumber(Pic^[I]) do
      begin
        Itr := Itr * 10 + Byte(Pic^[I]) - Byte('0');
        Inc(I);
      end;

      if I > TermCh then
      begin
        Result:= prSyntax;
        Exit;
      end;

      K := I;
      NewTermCh := CalcTerm;

      { If Itr is 0 allow any number, otherwise enforce the number }
      if Itr <> 0 then
      begin
        for L := 1 to Itr do
        begin
          I := K;
          Rslt := Process(NewTermCh);
          if not IsComplete(Rslt) then
          begin
            { Empty means incomplete since all are required }
            if (Rslt = prEmpty) then
            begin
               if(Pic^[i]='[') then Rslt:= prComplete    {Whole Iteration is Optional - !!!}
               else Rslt := prIncomplete;
            end;
            Result:= Rslt;
            Exit;
          end;
        end;
      end
      else
      begin
        repeat
          I := K;
          LastJ:= J;
          Rslt := Process(NewTermCh);
          if (J=LastJ) then break;   { Have not consumed any }
        until not IsComplete(Rslt);
        if (Rslt = prEmpty) or (Rslt = prError) then
        begin
          Inc(I);
          Rslt := prAmbiguous;
        end;
      end;
      I := NewTermCh;
      Result:= Rslt;
    end;

    { Process a picture group }
    function Group: TwwPicResult;
    var
      Rslt: TwwPicResult;
      TermCh: Byte;
    begin
      TermCh := CalcTerm;
      Inc(I);
      Rslt := Process(TermCh - 1);
      if not IsIncomplete(Rslt) then I := TermCh;
      Group := Rslt;
    end;

    function CheckComplete(Rslt: TwwPicResult; startGroup, EndGroup: integer): TwwPicResult; forward;

    function isOptionalParensGroup(startGroup, EndGroup: integer): boolean;
    var tempStartGroup, tempEndGroup: integer;
      function GetSubGroup(startGroup: integer; var tempEndGroup: integer): Boolean;
      var curPos: byte;
      begin
        curPos:= startGroup;
        repeat
           ToGroupEnd(curPos, endGroup)
        until (curPos >= EndGroup) or (Pic^[curPos] = ',');
        result := curPos <= endGroup;
        tempEndGroup:= curPos-1;
      end;
    begin
       tempStartGroup:= startGroup;
       tempEndGroup:= endGroup;
       tempStartGroup:= tempStartGroup + 1;  { Skip opening parens }
       result:= False; { Make compiler happy }

       while True do begin
          if not GetSubGroup(tempStartGroup, tempEndGroup) then
          begin
             result:= False;
             break;
          end
          else if (CheckComplete(prIncomplete, tempStartGroup, tempEndGroup)=prAmbiguous) then
          begin
             result:= True;
             break;
          end
          else begin
             tempStartGroup:= tempEndGroup + 2;
             if tempStartGroup>endGroup then
             begin
                result:= False;
                break;
             end
          end
       end
    end;

    function CheckComplete(Rslt: TwwPicResult; startGroup, EndGroup: integer): TwwPicResult;
    var
      J, EndJ: Byte;
    begin
      J := startGroup;
      if IsIncomplete(Rslt) then
      begin
        { Skip optional pieces }
        while True do begin
          case Pic^[J] of
            '[': ToGroupEnd(J, EndGroup);

            '*':
              if not IsNumber(Pic^[J + 1]) then
              begin
                Inc(J);
                ToGroupEnd(J, EndGroup);
              end
              else begin
                if (J+2<EndGroup) and (Pic^[J + 2]='[') then {Whole iteration is Optional!!!}
                begin
                   j:= j+2;
                   ToGroupEnd(J, EndGroup)
                end
                else
                   Break;
              end;

            ',': ToParensEnd(J); { Scan until encounter ending parens }

            '{': begin
                   EndJ:= j;
                   ToGroupEnd(EndJ, EndGroup);
                   if isOptionalParensGroup(j, EndJ-1) then j:= EndJ
                   else break; { has a required character}
                 end

            else begin
                CheckComplete:= Rslt;  {Not complete }
                exit;
            end
          end;

          if J >= EndGroup then break;  { Nothing required in current Group }
        end;

        if (J >= EndGroup) then Rslt := prAmbiguous;
      end;
      CheckComplete := Rslt;
    end;

    function Scan: TwwPicResult;
    var
      Ch: Char;
      temp:string;
      Rslt: TwwPicResult;
    begin
      Scan := prError;
      Rslt := prEmpty;
      while (I <> TermCh) and (Pic^[I] <> ',') do
      begin
        if J > Length(Input) then
        begin
          Scan := CheckComplete(Rslt, I, TermCh);
          Exit;
        end;

        Ch := Input[J];
        case Pic^[I] of
          '#': if not IsNumber(Ch) then Exit
               else Consume(Ch);
          '?': if not IsIntlLetter(Ch) then Exit
               else Consume(Ch);
          '&': if not IsIntlLetter(Ch) then Exit
               else begin
                 temp := AnsiUpperCase(ch);
                 Ch := temp[1];
                 Consume(Ch);
               end;
          '~': if not IsIntlLetter(Ch) then Exit
               else begin
                 temp := AnsiLowerCase(ch);
                 Ch := temp[1];
                 Consume(Ch);
               end;
          '!': begin
                 temp := AnsiUpperCase(ch);
                 Ch := temp[1];
                 Consume(Ch);
               end;
          '@': Consume(Ch);
          '*':
            begin
              Rslt := Iteration;
              if not IsComplete(Rslt) then
              begin
                Scan := Rslt;
                Exit;
              end;
              if Rslt = prError then Rslt := prAmbiguous;
            end;
          '{':
            begin
              Rslt := Group;
              if not IsComplete(Rslt) then
              begin
                Scan := Rslt;
                Exit;
              end;
            end;
          '[':
            begin
              Rslt := Group;
              if IsIncomplete(Rslt) then
              begin
                Scan := Rslt;
                Exit;
              end;
              if Rslt = prError then Rslt := prAmbiguous;
            end;
        else
          if Pic^[I] = ';' then Inc(I);
          if UpCase(Pic^[I]) <> UpCase(Ch) then begin
            if (not SkipAutofill) and (Ch = ' ') and (j = length(input)) then
{               Ch := Pic^[I]}
            else Exit;
          end
          else begin
            if (Ch = ' ') and (j = length(input)) then
               SkipAutoFill := True;
          end;
          Consume(Pic^[I]);
        end;

        if Rslt = prAmbiguous then
          Rslt := prIncompNoFill
        else
          Rslt := prIncomplete;
      end;

      if Rslt = prIncompNoFill then
        Scan := prAmbiguous
      else
        Scan := prComplete;
    end;

  begin
    Incomp := False;
    Incompi:= 0;  Incompj:= 0; {Make compiler happy}
    OldI := I;
    OldJ := J;
    skipAutoFill := False;
    repeat
      Rslt := Scan;

      { Only accept completes if they make it farther in the input
        stream from the last incomplete }
      if (Rslt in [prComplete, prAmbiguous]) and Incomp and (J < IncompJ) then
      begin
        Rslt := prIncomplete;
        J := IncompJ;
      end;

      if (Rslt = prError) or (Rslt = prIncomplete) then
      begin
        Process := Rslt;
        if not Incomp and (Rslt = prIncomplete) then
        begin
          Incomp := True;
          IncompI := I;
          IncompJ := J;
        end;
        I := OldI;
        J := OldJ;
        if not SkipToComma then
        begin
          if Incomp then
          begin
            Process := prIncomplete;
            I := IncompI;
            J := IncompJ;
          end;
          Exit;
        end;
        OldI := I;
      end;
    until (Rslt <> prError) and (Rslt <> prIncomplete);

    if (Rslt = prComplete) and Incomp then
      Process := prAmbiguous
    else
      Process := Rslt;
  end;

  function SyntaxCheck: Boolean;
  var
    I: Integer;
    BrkLevel, BrcLevel: Integer;
  begin
    SyntaxCheck := False;

    if Pic^ = '' then Exit;

    if Pic^[Length(Pic^)] = ';' then Exit;
    if (Pic^[Length(Pic^)] = '*') and (Pic^[Length(Pic^) - 1] <> ';') then
      Exit;

    I := 1;
    BrkLevel := 0;
    BrcLevel := 0;
    while I <= Length(Pic^) do
    begin
      case Pic^[I] of
        '[': Inc(BrkLevel);
        ']': Dec(BrkLevel);
        '{': Inc(BrcLevel);
        '}': Dec(BrcLevel);
        ';': Inc(I);
      end;
      Inc(I);
    end;
    if (BrkLevel <> 0) or (BrcLevel <> 0) then Exit;

    SyntaxCheck := True;
  end;


begin
  Picture := prSyntax;
  if not SyntaxCheck then Exit;

  Picture := prEmpty;
  if Input = '' then Exit;

  J := 1;
  I := 1;

  Rslt := Process(Length(Pic^) + 1);
  if (Rslt <> prError) and (Rslt <> prSyntax) and (J <= Length(Input)) then
    Rslt := prError;

  if (Rslt = prIncomplete) and AutoFill then
  begin
    Reprocess := False;
    while (I <= Length(Pic^)) and
      not (Pic^[I] in ['#','?','&', '~', '!', '@', '*', '{', '}', '[', ']', ',', #0]) do
    begin
      if Pic^[I] = ';' then Inc(I);
      Input := Input + Pic^[I];
      Inc(I);
      Reprocess := True;
    end;
    J := 1;
    I := 1;
    if Reprocess then
      Rslt := Process(Length(Pic^) + 1)
  end;

  if Rslt = prAmbiguous then
    Picture := prComplete
  else if Rslt = prIncompNoFill then
    Picture := prIncomplete
  else
    Picture := Rslt;
end;

end.
