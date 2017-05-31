Unit IntHTML;
//-------------------------------------------------------------
// Sistema         :   IntHTML
// Date            :   Julio de 1999
// Fecha de Inicio :   Julio de 1999
// Función forma   :   Forma Creada Internamente
// Desarrollo por  :   Víctor Martínez Castro
// Comentarios     :   Forma Estandar
// Actualizado al  :   07 Septiembre
// ------------------------------------------------------------


interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBGrids, Grids, ComCtrls, DBTables, StdCtrls, ExtCtrls, UnSQL2, UnGene,
  InterApl, Buttons, UnSubGen;

Type
   TOnPrepareBodyEvent=Procedure(Sender:TObject; Var BodyText:String) of Object;
   THTP=Class (TPersistent)
            Private
              FHead:TStringList;
              FBody:TStringList;
              FFontSize:Integer;
              FCol   :Integer;
              FAncho :Integer;
              FTextHeader   : String;
              FTextPreBody  : String;
              FTextBody     : String;
              FTextPostBody : String;
              FTextAddress  : String;
              FTitle        : String;

              FHTMLHeader  :String;
              FHTMLPreBody :String;
              FHTMLBody    :String;
              FHTMLPostBody:String;
              FHTMLAddress :String;

              FOnPrepareBody: TOnPrepareBodyEvent;
            Public
              Constructor Create;  virtual; //override;
              Destructor  Destroy; override;
              Function    PrepareHTML:TStringList;
              Procedure   OpenBody(TextColor,BrushColor:TColor);
              Procedure   CloseBody;
              Procedure   OpenTable(Columns:Integer; CellPading,CellSpacing,Width:Integer; BorderColor:TColor; DefFontSize:Integer);
              Procedure   OpenTableRow;
              Procedure   CloseTableRow;
              Procedure   CreateHeader(Title,Generator,Version,Author:String);

              Procedure   Print(Text:String);
              Function    BodyPos:Integer;

              Procedure   AddTableRowTitle(Text:String; PreText,PostText:String; FontSize:Integer; Color,BrushColor:TColor; Align:TColAlign);
              Procedure   AddTableColValue(Text:String; PreText,PostText:String; FontSize:Integer; Width:Integer; WidthPorc:Integer; Color,BrushColor:TColor; Align:TColAlign; eColSpan:Integer);

              Procedure   CloseTable;

              Function    PrepareBody:String;

              Function    SaveToFile(FileName:String):Boolean;
              Procedure   PrepareBodyDefault   (Sender:TObject; Var BodyText:String);
              Procedure   PrepareAddressDefault(Sender:TObject; Var AddressText:String);

              Procedure   OpenRowTable(BrushColor:TColor);
              Procedure   CloseRowTable;
              Procedure   AddHTML(S:String);
              Procedure   ClearBody;
              Function    GetBodyText:String;
              Property    OnPrepareBody:TOnPrepareBodyEvent read FOnPrepareBody Write FOnPrepareBody;

              Property    TextHeader  :String Read FTextHeader   Write FTextHeader;
              Property    TextPreBody :String Read FTextPreBody  Write FTextPreBody;
              Property    TextBody    :String Read FTextBody     Write FTextBody;
              Property    TextPostBody:String Read FTextPostBody Write FTextPostBody;
              Property    TextAddress :String Read FTextAddress  Write FTextAddress;

              Property    HTMLHeader  :String Read FHTMLHeader Write FHTMLHeader;
              Property    HTMLPreBody :String Read FHTMLPreBody Write FHTMLPreBody;
              Property    HTMLBody    :String Read FHTMLBody Write FHTMLBody;
              Property    HTMLPostBody:String Read FHTMLPostBody Write FHTMLPostBody;
              Property    HTMLAddress :String Read FHTMLAddress Write FHTMLAddress;
              Property    Title       :String Read FTitle Write FTitle;

            end;

Const kO_Head='<HEAD>';
Const kC_Head='</HEAD>';

Const kO_HTML='<HTML>';
Const kC_HTML='</HTML>';

Const kC_TABLE='</TABLE>';

Const kF_Meta_Name='<META NAME="%S" CONTENT="%S">';
Const kF_Title='<TITLE>%S</TITLE>';
Const kO_Espacio='&nbsp;';
Const kO_Char32='&#32;';

Function HTPStr(S:String):String;

Function HTPStrAlign(S:String; Align:TColAlign):String;

implementation


Function HTPStr(S:String):String;
Function  ACute(S:String):String;
begin      if S='ñ' then Result:='&ntilde;' else if S='Ñ' then Result:='&Ntilde;'
      else if S='á' then Result:='&aacute;'
      else if S='é' then Result:='&eacute;'
      else if S='í' then Result:='&iacute;'
      else if S='ó' then Result:='&oacute;'
      else if S='ú' then Result:='&uacute;' else if S='ü' then Result:='&uuml;'
      else if S='Á' then Result:='&Aacute;'
      else if S='É' then Result:='&Eacute;'
      else if S='Í' then Result:='&Iacute;'
      else if S='Ó' then Result:='&Oacute;'
      else if S=#13 then Result:='<BR>'
      else if S=#10 then Result:=''
      else if S='Ú' then Result:='&Uacute;' else if S='Ü' then Result:='&Uuml;'
      else Result:=S;
end;

var i:Integer;
    SS:String;
begin SS:='';
      For i:=1 to Length(S) do
      begin SS:=SS+aCute(S[i]);
      end;
      if SS='' then Result:=kO_Espacio
               else Result:=SS;
end;

Function HTPStrAlign(S:String; Align:TColAlign):String;
var AuxS:String;
    Rempla,Bien:Boolean;
    i:Integer;

Function Reemplaza(S:String; Que:Char; ConQue:String):String;
var AuxS:String;
    i:Integer;
begin AuxS:='';
      for i:=1 to Length(S) do
      begin if (S[i]=Que)
               then AuxS:=AuxS+ConQue
               else AuxS:=AuxS+S[i];
      end;
      Result:=Trim(AuxS);
end;

begin S:=HTPStr(S);
      Case Align of
      TcLeft  :begin Bien:=True; Rempla:=False;
                     i:=1;
                     While (i<=Length(S)) and (Bien) do
                     begin if (Bien)
                           then begin if (S[i]=' ') then begin S[i]:=#29; Rempla:=True; end
                                                    else Bien:=False;
                                end;
                           i:=i+1;
                     end;
                     if Rempla then AuxS:=Reemplaza(S,#29,kO_Char32) else AuxS:=S;
               end;
      TcRight :begin Bien:=True; Rempla:=False;
                     i:=Length(S);
                     While (i>=1) and (Bien) do
                     begin if (Bien)
                           then begin if (S[i]=' ') then begin S[i]:=#29; Rempla:=True; end
                                                    else Bien:=False;
                                end;
                           i:=i-1;
                     end;
                     if Rempla then AuxS:=Reemplaza(S,#29,kO_Char32) else AuxS:=S;
               end;
      tcCenter:AuxS:=Trim(S);
      end;
      Result:=AuxS;
end;

Function HTPColor(Color:TColor):String;
var S1,S2,S3:String;
begin S1:=FillRightCero(Trim(Format('%x',[GetRValue(Color)])),2);
      S2:=FillRightCero(Trim(Format('%x',[GetGValue(Color)])),2);
      S3:=FillRightCero(Trim(Format('%x',[GetBValue(Color)])),2);
      Result:='"#'+S1+S2+S3+'"';
end;




Constructor THTP.Create;
begin Inherited;
      FHead:=TStringList.Create; FHead.Clear;
      FBody:=TStringList.Create; FBody.Clear;
      FTextHeader   :='';
      FTextPreBody  :='';
      FTextBody     :='';
      FTextPostBody :='';
      FTextAddress  :='Derechos Reservados (c), '+FormatDateTime('YYYY',Now)+' Grupo Financiero Interacciones';
      HTMLHeader    :='';
      HTMLPreBody   :='';
      HTMLBody      :='';
      HTMLPostBody  :='';
      HTMLAddress   :='';
      Title         :='Grupo Financiero Interacciones';
      FCol:=1;  FAncho:=100;
end;


Destructor  THTP.Destroy;
begin if FHead<>nil then FHead.Free; FHead:=nil;
      if FBody<>nil then FBody.Free; FBody:=nil;
      Inherited;
end;

Procedure THTP.PrepareBodyDefault(Sender:TObject; Var BodyText:String);
begin BodyText:=FBody.Text;
end;

Procedure THTP.PrepareAddressDefault(Sender:TObject; Var AddressText:String);
begin AddressText:='Derechos Reservados (c), '+FormatDateTime('YYYY',Now)+' Grupo Financiero Interacciones';
end;

Procedure THTP.AddHTML(S:String);
begin if Trim(S)<>'' then FBody.Add(S);
end;

Function  THTP.GetBodyText:String;
begin Result:=FBody.Text;
end;


Function  THTP.PrepareBody:String;
var Salida:String;
begin Salida:='';
      if Assigned(FOnPrepareBody)
         then FOnPrepareBody(Self,Salida)
         else PrepareBodyDefault(Self,Salida);
      Result:=FTextPreBody+Salida+FTextPostBody;
end;

Function  THTP.PrepareHTML:TStringList;
var S:TStringList;
    i:Integer;
    H:THTP;
    Salida:String;
begin H:=THTP.Create;
      Try   H.CreateHeader(Title,'MACV HTML-Maker','1.0','Victor Martinez Castro');
            H.OpenBody(-1,-1);
            Salida:=PrepareBody;
            if Salida<>'' then H.AddHTML(Salida);
            if Trim(FTextAddress)<>''
            then begin H.AddHtml('<HR>');
                       H.AddHtml('<ADDRESS>');
                       H.AddHtml(HTPStr(FTextAddress));
                       H.AddHtml('</ADDRESS>');
                 end;
            H.CloseBody;

            S:=TStringList.Create;
            S.Add(kO_HTML);
            For i:=0 to H.FHead.Count-1 do
            begin S.Add(H.FHead.Strings[i]);
            end;
            For i:=0 to H.FBody.Count-1 do
            begin S.Add(H.FBody.Strings[i]);
            end;

            S.Add(kC_HTML);
            Result:=S;
      Finally H.Free;
      end;
end;




Procedure   THTP.CreateHeader(Title,Generator,Version,Author:String);
begin FHead.Clear;
      FHead.Add(kO_Head);
      //FHead.Add('<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1">');
      FHead.Add(Format(kF_Meta_Name,['Generator',HtpStr(Generator)]));
      FHead.Add(Format(kF_Meta_Name,['Version',HtpStr(Version)]));
      FHead.Add(Format(kF_Meta_Name,['Author',HtpStr(Author)]));
      FHead.Add(Format(kF_Title,[HtpStr(Title)]));
      FHead.Add(kC_Head);
end;

Procedure   THTP.OpenBody(TextColor,BrushColor:TColor);
begin FBody.Clear;
      if (TextColor=-1) then TextColor:=clBlack;
      if (BrushColor=-1) then BrushColor:=clWhite;
      FBody.Add('<BODY TEXT='+HTPColor(TextColor)+' BGCOLOR='+HTPColor(BrushColor)+' LINK="#0000FF" VLINK="#800080" ALINK="#FF0000">');
end;


Procedure   THTP.ClearBody;
begin FBody.Clear;
end;


Procedure   THTP.CloseBody;
begin FBody.Add('</BODY>');
end;


Procedure THTP.OpenTable(Columns:Integer; CellPading,CellSpacing,Width:Integer; BorderColor:TColor; DefFontSize:Integer);
var S_Width:String;
begin //FBody.Add('<TABLE BORDER BORDERCOLOR="#000000" CELLPADDING=7 WIDTH=590>
      FCol   :=Columns;
      FAncho :=Width;
      if BorderColor=-1 then BorderColor:=clBlack;
      if Width<>-1 then S_Width:='WIDTH="'+IntToStr(Width)+'" '
                   else S_Width:='WIDTH=100% ';

      FFontSize:=DefFontSize;
      FBody.Add('<TABLE BORDER CELLSPACING='+IntToStr(CellSpacing)+' CELLPADDING='+IntToStr(CellPading)+' '+S_Width+'  BORDERCOLOR='+HTPColor(BorderColor)+' > ');
end;

Procedure THTP.CloseTable;
begin FBody.Add(kC_TABLE);
end;


Procedure THTP.OpenTableRow;
begin  FBody.Add('<TR>');
end;

Procedure THTP.CloseTableRow;
begin  FBody.Add('</TR>');
end;


Procedure THTP.AddTableRowTitle(Text:String; PreText,PostText:String; FontSize:Integer; Color,BrushColor:TColor; Align:TColAlign);
var ss,FC_O,FC_C:String;
begin if BrushColor=-1 then BrushColor:=clWhite;
      if Color=-1      then Color:=clBlack;
      if FontSize=-1 then FontSize:=FFontSize;
      FBody.Add('<TR>');
      FBody.Add('<TD VALIGN="CENTER" COLSPAN="'+IntToStr(FCol)+'" BGCOLOR='+HTPColor(BrushColor)+'>');
      Case Align of
      tcLeft  :SS:='LEFT';
      tcRight :SS:='RIGHT';
      tcCenter:SS:='CENTER';
      end;

      FC_O:='<FONT SIZE='+IntToStr(FontSize)+' COLOR='+HTPColor(Color)+'>';
      FC_C:='</FONT>';

      FBody.Add(FC_O+'<P ALIGN="'+SS+'">'+PreText+HTPStrAlign(Text,Align)+PostText+FC_C+'</TD>');
      FBody.Add('</TR>');
end;


Procedure THTP.OpenRowTable(BrushColor:TColor);
begin if BrushColor=-1 then BrushColor:=clWhite;
      FBody.Add('<TR>');
      FBody.Add('<TD VALIGN="CENTER" COLSPAN="'+IntToStr(FCol)+'"  BGCOLOR='+HTPColor(BrushColor)+')');
      FBody.Add('<P><TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH=100%>');
      FBody.Add('<TR>');
end;

Procedure THTP.CloseRowTable;
begin FBody.Add('</TABLE>');
      FBody.Add('</TD>');
      FBody.Add('</TR>');
end;

Procedure THTP.AddTableColValue(Text:String; PreText,PostText:String; FontSize:Integer; Width:Integer; WidthPorc:Integer; Color,BrushColor:TColor; Align:TColAlign; eColSpan:Integer);
var ss,FC_O,FC_C,S_ColSpan:String;
begin if BrushColor=-1 then BrushColor:=clWhite;
      if Color=-1      then Color:=clBlack;
      if FontSize=-1 then FontSize:=FFontSize;
      if eColSpan<>-1 then S_ColSpan:=' COLSPAN="'+IntToStr(eColSpan)+'" ';
      if Width<>-1
      then FBody.Add('<TD WIDTH='+IntToStr(Width)+' '+S_ColSpan+'VALIGN="CENTER" BGCOLOR='+HTPColor(BrushColor)+'>')
      else FBody.Add('<TD WIDTH='+IntToStr(WidthPorc)+'%'+' '+S_ColSpan+'VALIGN="CENTER" BGCOLOR='+HTPColor(BrushColor)+'>');
      (*
      <TR><TD WIDTH="15%" VALIGN="TOP" BGCOLOR="#c0c0c0">
      <P ALIGN="CENTER">Posici&oacute;n</TD>
      *)
      Case Align of
      tcLeft  :SS:='LEFT';
      tcRight :SS:='RIGHT';
      tcCenter:SS:='CENTER';
      end;
      FC_O:='<FONT SIZE='+IntToStr(FontSize)+' COLOR='+HTPColor(Color)+'>';
      FC_C:='</FONT>';
      if Trim(Text)<>''
         then FBody.Add(FC_O+'<P ALIGN="'+SS+'">'+PreText+HTPStrAlign(Text,Align)+PostText+FC_C+'</TD>')
         else FBody.Add('<BR></TD>');//FC_O+'<P ALIGN="'+SS+'">'+HTPStr(Text)+FC_C);
      //FBody.Add('</TD>');
//      FBody.Add('</TR>');
end;


Procedure THTP.Print(Text:String);
begin FBody.Add('<P>'+HTPStr(Text));
end;

Function  THTP.BodyPos:Integer;
begin Result:=FBody.Count-1;
end;

Function    THTP.SaveToFile(FileName:String):Boolean;
var T:TStringList;
begin Result:=False;
      T:=PrepareHTML;
      if T=nil then Exit;
      Try T.SaveToFile(FileName);
          Result:=True;
      Finally T.Free;
      end;
end;

end.


