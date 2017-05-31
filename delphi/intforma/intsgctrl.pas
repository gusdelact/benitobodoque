unit IntSGCtrl;
//-------------------------------------------------------------
// Sistema         :   IntSGCtrl
// Date            :   Julio de 1997
// Fecha de Inicio :   Julio de 1997
// Función forma   :   Forma Creada Internamente
// Desarrollo por  :   Víctor Martínez Castro
// Comentarios     :   Forma Estandar
// Actualizado al  :   07 Septiembre
// ------------------------------------------------------------
interface
{$DEFINE HTML_ENABLED}
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBGrids, Grids, ComCtrls, DBTables, StdCtrls, ExtCtrls, UnSQL2, UnGene,
  RepSgCtrl, Quickrpt, QRCtrls, qrprntr, InterApl, Buttons,
  IntHTML, ClipBrd, Printers, IntHead;


Type TTipoDinero=Extended; //Currency; //Double; InterApl UnSubGen

Const kTipoCol=0;
      kFontColor=1;
      kPrintCol=2;
      kWdDate =64;
      kWdFloat  =95;
      kWdPrecio =95-16;
      kWdTitulos=95-16;
      kWdLongInt=95;

      kActualHeight=16;

      kNoPrint='NP';
      kPrintHeader='HP';

      kFtFloat  ='F#,###,###,###0.00;(#,###,###,###0.00);0';
      kFtLongInt='F#,###,###,###0;(#,###,###,###0);0';
      kFtLongIntNoCero='F#,###,###,###0;(#,###,###,###0); ';
      kFtFrac   ='F#,###,###,##0.00#####;(#,###,###,##0.00#####);0.00';
      kFtFracNoCero='F#,###,###,##0.00#####;(#,###,###,##0.00#####); ';
		kFtMoney  ='F#,###,###,###0.00;(#,###,###,###0.00);0.00';
      kFtMoneyNoCero='F#,###,###,###0.00;(#,###,###,###0.00); ';

Type TRowCaso=(rcQueryBegin, rcQueryEnd, rcRowBegin, rcRowEnd);
Type TEventOnCalc=Procedure(Sender:TObject; DataSet:TDataSet; Var Texto:String; X,Y:Integer; FieldName, ColName:String) of Object;
Type TEventOnCalcRow=Procedure(Sendet:TObject; DataSet:TDataSet; CurrRow:Integer; RowCaso:TRowCaso; Var ShowRow:Boolean) of Object;
Type ESGCtrl=Class(Exception)
             Public Constructor Create(const Msg:string); virtual;
             end;


     TQryDefine=Array[0..2] of String;
     TSGCtrl=Class;
     TTexto=Class(TComponent)
            Protected
                 FTexto:String;
                 FIsMulti:Boolean;
                 FCount:Integer;
                 FLines:TStringList;
                 Procedure SetText(S:String);
                 Function  GetText:String;
            Public
                 Constructor Create(AOwner:TComponent); override;
                 Destructor Destroy; override;
                 Function IsMulti:Boolean;
                 Function Lines(N:Integer):String;
                 Function LinesFull(N:Integer):String;
                 Function Align:Char;
					  Function LinesAlign(N:Integer):Char;
                 Property Count:Integer Read FCount Write FCount;
                 Property Texto:String read GetText Write SetText;
				end;



     TColumna=Class(TComponent)
              Protected
              SG:TSGCtrl;
              FCaption:String;
              FAlign:TColAlign;
              FWidth:Integer;
              FColName:String;
              FColNum:Integer;
              FFormat:String;
              FVisible:Boolean;
              Public
                IsCheck :Boolean;
                Procedure SetInfo(eColName, eCaption:String; eWidth:Integer; eAlign:TColAlign; eFormat:String; eVisible:Boolean);
                Procedure SetInfoEx(eColName, eCaption:String; eWidth:Integer; eAlign:TColAlign; eFormat:String; eVisible:Boolean; ShowTitle:Boolean);
              Published
                Property Caption:String Read FCaption Write FCaption;
                Property Align:TColAlign Read FAlign Write FAlign;
                Property Width:Integer Read FWidth Write FWidth;
                Property ColName:String Read FColName write FColName;
                Property ColNum:Integer Read FColNum Write FColNum;
                PRoperty Format:String Read  FFormat Write FFormat;
					 Property Visible:Boolean  REad FVisible Write FVisible;
              end;

	  TSGCtrl=Class(TCustomPanel)
         Protected
            FLastRow:Integer;
            FSG:TStringGrid;
            FPanel:TPanel;
            FPanel2:TPanel;
            FColumnas:TList;
            FColCount:Integer;
            FOnCalc:TEventOnCalc;
            FOnCalcRow:TEventOnCalcRow;
            FOnDblClick:TNotifyEvent;
            FStart:Integer;
            FLeftCol:Integer;
            FMaxRow:Integer;
            FTab:TTabControl;
            FBtExcel:TSpeedButton;
            FUp,FDown:TSpeedButton;
            FUpDown:TUpDown;
            RR  :TObject;
            FShowTab:Boolean;
            FTabWidth:Integer;
            FShowBtnPriorNext:Boolean;
            FShowBtnFirst:Boolean;
            FShowBtnLast:Boolean;
            FOnMoveRow:TMovedEvent;
				FOnTopLeftChanged:TNotifyEvent;
				FOnExcel:TNotifyEvent;
				FPageOrientation:TPrinterOrientation;
				
				
				Procedure SetShowBtnPriorNext(B:Boolean);
				Procedure SetShowBtnfirst(B:Boolean);
				Procedure SetShowBtnLast(B:Boolean);

            Procedure SetCellStr(eColName:String; eRow:Integer; eTexto:String);
            Function GetCellStr(eColName:String; eRow:Integer):String;
            Function GetColumna(Index:Integer):TColumna;
            Procedure SetColCount(N:Integer);
            procedure SetSG(SG:TStringGrid);
            Procedure SetTab(T:TTabControl);
            Function  GetTab:TTabControl;
            Procedure SetShowTab(B:Boolean);
            Procedure SetTabWidth(W:Integer);
            Procedure GridDobleClick(Sender:TObject);
            Procedure TopLeftChange(Sender:TObject);
            procedure DrawGridSelectCell(Sender: TObject; Col, Row: Integer; var CanSelect: Boolean);

            Procedure EnviaExcel(Sender:TObject);
         Public
            Titulo1:String;
            Titulo2:String;
            NomReporte:String;
            FechaInfor:TDateTime;
            ActualY:Integer;
            PrintRowCount:Integer;
            StackPrintRow:Integer;
            LastPrintRowCount:Integer;
            PrintOnHeader:Boolean;
            PrintChangePage:Boolean;
            PrintLastPage:Integer;
            TX:TTexto;
				TabIndex : TStringList;
            UseBonitoStr:Boolean;
            ApliEmail:TInterApli;
            HTML:THTP;
            Constructor Create(AOwner:TComponent); override;
            Destructor Destroy; override;
            Function  ToHeader(Linea:Integer):Integer;
            Function  AddHeader(Datos:Array of String; Alto:Integer; eFontColor:TColor):Integer;
            Procedure AddTitle(Nombre:String; Align:TColAlign);
            Procedure AddTexto(Nombre:String; Align:TColAlign; eFontColor:TColor; eAlto:Integer);
            Procedure AddTextoMultiLine(Nombre:String; Align:TColAlign; eFontColor:TColor; eAlto:Integer);
            Procedure AddQry(Q:TDataSet; eBegin,eEnd:Boolean; TitleWidth,RowHeaderWidth,RowWidth:Integer; ShowTitle:Boolean);
            Procedure AddQryRow(Q:TDataSet; Datos:Array of TQryDefine);
            Procedure AddQryValues(Q:TDataSet; Datos:Array of TQryDefine);
            Procedure DefaultOnCalc(DataSet:TDataSet; Var Texto:String; X,Y:Integer; FieldName, ColName:String);
            Procedure DefaultOnCalcRow(DataSet:TDataSet; CurrRow:Integer; RowCaso:TRowCaso; Var ShowRow:Boolean);
            Function  ColumnByName(eColName:String):TColumna;
            Procedure SetFontColor(Color:TColor);
            Procedure SetPrintCol(Caso:String);
            Procedure Clear(Texto:String);
            procedure TabChange(Sender: TObject); Virtual;
            procedure SGKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState); virtual;
            procedure DrawCellCanvas(Sender: TObject; eCanvas:TCanvas; eFSG:TStringGrid; Col, Row: Integer; Rect: TRect;
                                     State: TGridDrawState; MinX:Integer; EscalaX,EscalaY:Real; clColor:TColor; Sepa:Integer);
            Procedure MoveRow(Sender: TObject; FromIndex, ToIndex: Longint);
				procedure UpClick(Sender: TObject);
            procedure DownClick(Sender: TObject);
            procedure UpDownClick(Sender: TObject; Button: TUDBtnType);
				Property  Tab:TTabControl read GetTab Write SetTab;
				Property  SG :TStringGrid read FSG Write SetSG;
				Property  Columnas[Index:Integer]:TColumna read GetColumna ; //Write SetColuma;
				Property  ColCount:Integer Read FColCount Write SetColCount;
				Property  LeftCol:Integer Read FLeftCol Write FLeftCol;
				Property  MaxRow:Integer Read FMaxRow Write FMaxRow;
				Procedure GotoLast;
				Procedure GotoFirst;
				Function  GetHTMLBodyText:String;
				Function  GetFileExcel:String;
				Procedure OnPrepareHTMLBody(Sender:TObject; Var BodyText:String);
				Procedure SendEMail(Apli:TInterApli);
				Property  PageOrientation:TPrinterOrientation Read FPageOrientation Write FPageOrientation;
             Property  CellStr[eColName:String; eRow:Integer]:String read GetCellStr Write SetCellStr;
          Published
            Procedure NextRow;
            Procedure EndGrid;
            Procedure BeginGrid;
            Procedure EndCaption;
            procedure DrawCell(Sender: TObject; Col, Row: Integer; Rect: TRect; State: TGridDrawState);
            Procedure SetActualHeight(H:Integer);
            Procedure SetTitleHeight(H:Integer);
            Procedure AddRows;
            Procedure Print(Preview:Boolean; PrintHeader:Boolean; eApli:TInterApli);
            procedure RepSGNeedData(Sender: TObject; var MoreData: Boolean);
            procedure BandDetBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
            procedure RepSGControlBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
				Procedure SigTab;
				Procedure PrevTab;
            Procedure ClearTabs;
				Procedure AddTab(Caption,Index:String);
            PRocedure SetActualAsHeader;
            PRocedure SetLastActualAsHeader;
            Property  OnCalc:TEventOnCalc read FOnCalc Write FOnCalc;
            Property  OnCalcRow:TEventOnCalcRow Read FOnCalcRow Write FOnCalcRow;
				Property  ShowTab:Boolean Read FShowTab Write SetShowTab;
				Property  Start:Integer read FStart;
            Property  Font;
            Property  BorderStyle;
            Property  BorderWidth;
            Property  BevelInner;
            Property  BevelOuter;
            Property  BevelWidth;
            Property  Align;
            Property  Color;
            Property  ShowHint;
            Property  Enabled;
            Property  TabStop;
            Property  TabOrder;
            Property  OnExit;
            Property  PopupMenu;
            Property  TabWidth:Integer Read FTabWidth Write SetTabWidth;
            PRoperty  ShowBtnPriorNext:Boolean Read FShowBtnPriorNext Write SetShowBtnPriorNext;
            PRoperty  ShowBtnFirst:Boolean Read FShowBtnFirst Write SetShowBtnfirst;
            PRoperty  ShowBtnLast:Boolean Read FShowBtnLast Write SetShowBtnLast;
				Property  OnDblClick:TNotifyEvent Read FOnDblClick Write FOnDblClick;
				Property  OnMoveRow:TMovedEvent Read FOnMoveRow Write FOnMoveRow;
				Property  OnTopLeftChanged:TNotifyEvent Read FOnTopLeftChanged  Write FOnTopLeftChanged;
	  end;

Function VerifyField(DataSet:TDataSet; Campo:String; Caso:Integer):TTipoDinero;

Const vfCeroIfNull=1;
Const vfAbs=2;
Const vfCeroIfNull_Abs=3;

Function QDF(N1,N2,N3:String):TQryDefine;

Function FFormat(Formato:String; F:TTipoDinero):String;
Function FillL(S:String; Tam:Integer; C:String):String;
Function GetCalcTexto(DataSet:TDataSet; Texto:String):String;

Procedure Register;

implementation
{$R IntSGCtrl.DCR}

Uses IntQrGrid, IntWSendEMail;

procedure Register;
begin RegisterComponents('Inter', [TSGCtrl]);
end;


Function FFormat(Formato:String; F:TTipoDinero):String;
begin FFormat:=FormatFloat(Copy(Formato,2,100),F);
end;

Function FillL(S:String; Tam:Integer; C:String):String;
Var L:String;
    i:Integer;
begin Result:='';
      for i:=0 to Tam do
        L:=L+C;
      L:=L+S;
      Result:=Copy(L,(Length(L)-Tam)+1,Tam);
end;


Function QDF(N1,N2,N3:String):TQryDefine;
begin Result[0]:=N1;
      Result[1]:=N2;
      Result[2]:=N3;
end;


Constructor ESGCtrl.Create(Const Msg:String);
begin Inherited Create(#30+Msg);
end;



Function FieldIt(S:String; I:Integer):String;
var R:String;
    k,j:Integer;
begin FieldIt:='';
      if S='' then exit;
      R:=''; k:=0;
      for j:=1 to length(s) do
      begin if S[j]=#30 then
            begin if (I=K) then
                     begin FieldIt:=R;
                           Exit;
                     end
                 else begin R:='';
                            Inc(K);
                      end;
            end
            else R:=R+S[j];
      end;
      if I=K then FieldIt:=R;
end;



Function VerifyField(DataSet:TDataSet; Campo:String; Caso:Integer):TTipoDinero;
var Res:TTipoDinero;
begin VerifyField:=0;
      Res:=0;
      if DataSet is TQuery then
      begin with TQuery(DataSet).FieldByName(Campo) do
            begin if Caso and 1=1 then
                  begin if IsNull then Res:=0 else Res:=AsFloat; //Float;
                  end else Res:=AsFloat; //Float;

                  if Caso and 2=2 then
                  begin if Res<0 then Res:=0;
                  end;
            end;
      end;
      VerifyField:=Res;
end;

Function TextoTexto(S:String):String;
var p:Integer;
begin P:=Pos(#30,S);
      if P>0
      then TextoTexto:=Copy(S,1,P-1)
      else TextoTexto:=S;
end;

Constructor TTexto.Create(AOwner:TComponent);
begin FTexto:='';
      FIsMulti:=False;
      FCount:=1;
      FLines:=TStringList.Create;
end;

Destructor TTexto.Destroy;
begin if FLines<>nil then FLines.Clear;
end;

Function TTexto.IsMulti:Boolean;
begin IsMulti:=(FCount>1);
end;


Function TTexto.Lines(N:Integer):String;
begin Lines:=TextoTexto(LinesFull(N));
end;


Function TTexto.LinesFull(N:Integer):String;
begin if (N>FLines.Count-1) or (N<0)
      then LinesFull:=''
      else LinesFull:=FLines.Strings[N];
end;


Function TTexto.Align:Char;
var p,Ap:Integer;
    AuxS:String;
begin Align:='N';
      P:=Pos(#30,FTexto);
      if P>0 then
      begin AuxS:=Copy(FTexto,P+1,Length(FTexto));
            AP:=Pos('>',AuxS);
            if AP>0 then
            begin AuxS:=Copy(AuxS,AP+1,1);
                  if Length(AuxS)>=1 then Align:=AuxS[1];
            end;
      end;
end;


Function TTexto.LinesAlign(N:Integer):Char;
var p,Ap:Integer;
    AuxS:String;
    Tx:String;
begin Tx:=LinesFull(N);
      LinesAlign:='N';
      P:=Pos(#30,Tx);
      if P>0 then
      begin AuxS:=Copy(Tx,P+1,Length(Tx));
            AP:=Pos('>',AuxS);
            if AP>0 then
            begin AuxS:=Copy(AuxS,AP+1,1);
                  if Length(AuxS)>=1 then LinesAlign:=AuxS[1];
            end;
      end;
end;


Procedure TTexto.SetText(S:String);
begin FTexto:=S;
      FLines.Text:=S;
      FCount:=FLines.Count;
end;

Function  TTexto.GetText:String;
begin GetText:=TextoTexto(FTexto);
end;



Procedure TColumna.SetInfo(eColName, eCaption:String; eWidth:Integer; eAlign:TColAlign; eFormat:String; eVisible:Boolean);
begin SetInfoEx(eColName, eCaption,eWidth,eAlign,eFormat,eVisible,True);
end;

Procedure TColumna.SetInfoEx(eColName, eCaption:String; eWidth:Integer; eAlign:TColAlign; eFormat:String; eVisible:Boolean; ShowTitle:Boolean);
begin IsCheck :=False;
      Caption:=eCaption;
      Width:=eWidth;
      Align:=eAlign;
      ColName:=Trim(UpperCase(eColName));
      Format:=eFormat;
      Visible:=eVisible;
      if Visible=False then begin if SG.FSG.ColCount<SG.FStart+ColNum+2
                                     then SG.ColCount:=SG.FStart+ColNum+2;

                                  SG.SG.FixedCols:=SG.FStart+ColNum+1;
                                  Width:=-1;
                                  SG.SG.Cells[KTipoCol,SG.ActualY]:='N';
                                  SG.SG.ColWidths[SG.FStart+ColNum]:=Width;
                                  SG.SG.Cells[SG.FStart+ColNum,SG.ActualY]:='';
                                   if SG.FLeftCol<ColNum+1 then SG.FLeftCol:=ColNum+1;
                            end;
      if ShowTitle then
      begin SG.SG.Cells[KTipoCol,SG.ActualY]:='H';
            SG.SG.Cells[SG.FStart+ColNum,SG.ActualY]:=eCaption;
            SG.SG.ColWidths[SG.FStart+ColNum]:=Width;
      end;
      if (Visible) and (Not ShowTitle) then
      begin SG.SG.Cells[KTipoCol,SG.ActualY]:='N';
            SG.SG.Cells[SG.FStart+ColNum,SG.ActualY]:='';
            SG.SG.ColWidths[SG.FStart+ColNum]:=Width;
      end;
end;



Procedure TSGCtrl.SendEMail(Apli:TInterApli);
var W:TWSendEMail;
begin Application.CreateForm(TWSendEMail,W);
      Try
        W.Apli:=Apli;
        W.SGCtrl:=Self;
        W.ShowModal;
      Finally W.Free;
      end;
end;



procedure TSGCtrl.UpClick(Sender: TObject);
begin GotoLast;
end;

Procedure TSGCtrl.GotoFirst;
begin if FSG.Row-1>=0
      then begin Fsg.Row:=FSG.FixedRows;
           end;
end;

Procedure TSGCtrl.GotoLast;
begin if FSG.Row+1<=(FSG.RowCount-1)
      then begin Fsg.Row:=FSG.RowCount-1;
           end;
end;

procedure TSGCtrl.DownClick(Sender: TObject);
begin GotoFirst;
end;


procedure TSGCtrl.UpDownClick(Sender: TObject; Button: TUDBtnType);
begin Case Button of
      btNext:if FSG.Row+1<=(FSG.RowCount-1) then Fsg.Row:=FSG.Row+1;
      btPrev:if FSG.Row-1>=FSG.FixedRows then Fsg.Row:=FSG.Row-1;
      end;
      if FUpDown.Position>=9500 then  begin FUpDown.Position:=0; FUpDown.Position:=-1; end;
      if FUpDown.Position<=-9500 then begin FUpDown.Position:=0; FUpDown.Position:=1; end;
end;

Procedure TSGCtrl.GridDobleClick(Sender:TObject);
begin if Assigned(FOnDblClick) then FOnDblClick(Self);
end;

Procedure TSGCtrl.TopLeftChange(Sender:TObject);
begin if Assigned(FOnTopLeftChanged) then FOnTopLeftChanged(Sender);
end;



Constructor TSGCtrl.Create(AOwner:TComponent);
var SGAux:TStringGrid;
	 BMPH:THandle;
	 BMP:TBitmap;
begin Inherited;
      UseBonitoStr:=False;
      FechaInfor:=0;
      FLastRow:=-1;
      SetBounds(10,10,100,100);
      ActualY:=0;
      FMaxRow:=-1;
      FColumnas:=TList.Create;
      FColumnas.Clear;
      FColCount:=1;
      FStart:=3;
      TX:=TTexto.Create(Self);
      TabIndex:=TStringList.Create;
      TabIndex.Clear;
      FPanel:=TPanel.Create(Self);
      FPanel.Parent:=Self;
      FPanel.Height:=24;
      FPanel.Align:=alBottom;
      FShowTab:=True;

      FBtExcel:=TSpeedButton.Create(Self);
      FBtExcel.Parent:=FPanel;
      FBtExcel.Align:=alLEft;
		FBtExcel.OnClick:=EnviaExcel;
      FBtExcel.SetBounds(-10,0,20,20);
      FBtExcel.Hint:='Enviar Información como Texto Separado con Tabuladores al Portapapeles.';
      FBtExcel.ShowHint:=True;
      //BMPH:=LoadBitmap(HInstance,'FIN'); BMP:=TBitMap.Create; BMP.Handle:=BMPH;
      FBtExcel.Glyph.LoadFromResourceName(HInstance,'TXT'); //:=BMP;

      FDown:=TSpeedButton.Create(Self);
      FDown.Parent:=FPanel;
      FDown.Align:=alLeft;
  //    FDown.Caption:='|<';
      FDown.OnClick:=DownClick;
      FDown.SetBounds(0,0,20,20);
      BMPH:=LoadBitmap(HInstance,'INICIO');
      BMP:=TBitMap.Create;
		BMP.Handle:=BMPH;
      FDown.Glyph:=BMP;

      FUpdown:=TUpDown.Create(Self);
      FUpdown.Parent:=FPanel;
      FUpdown.Align:=alLeft;
      FUpdown.OnClick:=UpDownClick;
		FUpdown.Orientation:=udHorizontal;
      FUpdown.Increment:=1;
      FUpdown.Min:=-10000;
      FUpdown.Max:=10000;
      FUpDown.SetBounds(20,0,40,20);

      FUp:=TSpeedButton.Create(Self);
      FUp.Parent:=FPanel;
      FUp.Align:=alLeft;
      FUp.OnClick:=UpClick;
//      FUp.Caption:='>|';
      FUp.SetBounds(60,0,20,20);
      BMPH:=LoadBitmap(HInstance,'FIN');
      BMP:=TBitMap.Create;
      BMP.Handle:=BMPH;
      FUp.Glyph:=BMP;




      Tab:=TTabControl.Create(Self);
      Tab.Parent:=FPanel;
      Tab.Align:=alClient;
      Tab.TabPosition:=tpBottom;
      Try

      SGAux:=TStringGrid.Create(Self);
      SGAux.Parent:=Self;
      SGAux.Align:=alClient;
      SGAux.ColCount:=5;
      SGAux.RowCount:=4;
      SGAux.FixedCols:=2;
      SGAux.FixedRows:=0;
      SGAux.Options:=[goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine,
                    goDrawFocusSelected, //goRowSizing,
                    goColSizing //goRowMoving, goColMoving, goEditing, goTabs, //goRowSelect,
                    //goAlwaysShowEditor, //goThumbTracking //goRowSizing
                    ];

      Except Raise EComponentError.Create('Creando Grid');
      end;
      SG:=SGAux;
		ColCount:=1;
//      ColCount:=2;

		 FShowBtnPriorNext:=True;
		 FShowBtnFirst:=True;
		 FShowBtnLast:=True;

		 ApliEmail:=nil;

		 HTML:=THTP.Create;
		 HTML.OnPrepareBody:=OnPrepareHTMLBody;
		 
		 FPageOrientation:=poPortrait;
end;

Destructor TSGCtrl.Destroy;
begin if FUpdown<>nil then FUpDown.Free; FUpDown:=nil;
      if FUp<>nil then FUp.Free; FUp:=nil;
      if FDown<>nil then FDown.Free; FDown:=nil;
      if Tab<>nil then Tab.Free; Tab:=nil;
      if FPanel<>nil then FPanel.Free; FPanel:=nil;
      if Tab<>nil then
      if TabIndex<>nil then TabIndex.Free;
      if Tx<>nil then Tx.Free;
      ColCount:=0;
      if HTML<>nil then HTML.Free; HTML:=nil;
      Inherited;
end;


Procedure TSGCtrl.MoveRow(Sender: TObject; FromIndex, ToIndex: Longint);
begin if Assigned(FOnMoveRow) then FOnMoveRow(Sender,FromIndex,ToIndex);
end;

Procedure TSGCtrl.SetShowBtnPriorNext(B:Boolean);
begin FShowBtnPriorNext:=B;
      FUpDown.Visible:=B;
end;

Procedure TSGCtrl.SetShowBtnfirst(B:Boolean);
begin FShowBtnFirst:=B;
      FUp.Visible:=B;
end;

Procedure TSGCtrl.SetShowBtnLast(B:Boolean);
begin FShowBtnLast:=B;
      FDown.Visible:=B;
end;



Procedure TSGCtrl.ClearTabs;
begin if Tab<>nil then Tab.Tabs.Clear;
      TabIndex.Clear;
end;

Procedure TSGCtrl.AddTab(Caption,Index:String);
begin if Tab<>nil then Tab.Tabs.Add(Caption);
      TabIndex.Add(Index);
end;

Procedure TSGCtrl.SetShowTab(B:Boolean);
begin FShowTab:=B;
      if Tab<>nil then Tab.Visible:=B;
end;


Procedure TSGCtrl.SetTab(T:TTabControl);
begin FTab:=T;
      if FTab<>nil then begin FTab.OnChange:=TabChange;
                              //FTab.OnClick:=TabChange;
                        end;
end;

Procedure TSGCtrl.SetTabWidth(W:Integer);
begin FTabWidth:=W;
      if Tab<>nil then Tab.TabWidth:=W;
end;

Function  TSGCtrl.GetTab:TTabControl;
begin GetTab:=FTab;
end;

procedure TSGCtrl.TabChange(Sender: TObject); //; var AllowChange: Boolean);
var N:Integer;
begin if Tab=nil then exit;
      if Tab.TabIndex<0 then exit;
      if Tab.TabIndex<=(TabIndex.Count-1)
         then FSG.Row:=StrToInt(TabIndex.Strings[Tab.TabIndex]);
end;




Procedure TSGCtrl.SigTab;
var i,P,R1,R2,Err,Last:Integer;
begin if FSG=nil then exit;
      P:=FSG.Row;
      Last:=P;
      //if TabIndex.Count>=1 then Val(TabIndex.Strings[0],R1,Err) else
      R1:=0;
      For i:=0 to TabIndex.Count-1 do
      begin R2:=0;
            Val(TabIndex.Strings[i],R2,Err);
            if Err=0
            then begin if (P>=R1) and (P<R2) then
                       begin if Tab<>nil
                                then begin Tab.TabIndex:=i; TabChange(Self); end
                                else FSG.Row:=R2;
                             Exit;
                       end;
                 end;
            R1:=R2;
      end;
end;

Procedure TSGCtrl.PrevTab;
var i,P,R1,R2,Err,Last:Integer;
begin if FSG=nil then exit;
      P:=FSG.Row;
      Last:=P;
      if TabIndex.Count>=1
         then Val(TabIndex.Strings[0],R1,Err)
         else R1:=0;
      For i:=0 to TabIndex.Count-1 do
      begin R2:=0;
            Val(TabIndex.Strings[i],R2,Err);
            if Err=0
            then begin if (P>R1) and (P<=R2) then
                       begin if Tab<>nil
                                then begin Tab.TabIndex:=i-1; TabChange(Self); end
                                else FSG.Row:=R1;
                             Exit;
                       end;
                 end;
            R1:=R2;
      end;
end;

procedure TSGCtrl.SGKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin if Shift=[ssShift]
      then begin if (Key=VK_DOWN) OR (Key=VK_RIGHT)  then SigTab;
                 if (Key=VK_UP)  OR (Key=VK_LEFT) then PrevTab;
                 Key:=0;
           end;
end;




Procedure TSGCtrl.SetTitleHeight(H:Integer);
begin SG.RowHeights[0]:=H;
end;


Function  TSGCtrl.ToHeader(Linea:Integer):Integer;
begin Result:=Linea;
      SG.Cells[KTipoCol,Linea]:='J';
end;

Procedure TSGCtrl.SetActualAsHeader;
begin SG.Cells[KTipoCol,ActualY]:='J';
end;

Procedure TSGCtrl.SetLastActualAsHeader;
begin SG.Cells[KTipoCol,ActualY-1]:='J';
end;






Procedure TSGCtrl.SetActualHeight(H:Integer);
begin if FSG.RowCount-1<=ActualY then AddRows;
      SG.RowHeights[ActualY]:=H;
end;

Procedure TSGCtrl.Clear(Texto:String);
begin BeginGrid;
      if ColCount=1
      then begin if FSG.Width>40 then FSG.ColWidths[FStart]:=FSG.Width-30;
           end;
      if Texto<>'' then begin Self.AddTitle(Texto,tcLeft);
                              EndCaption;
                        end;
      EndGrid;
end;


procedure TSGCtrl.SetSG(SG:TStringGrid);
begin Try
      FSG:=SG;
      if FSG<>nil
      then begin FSG.DefaultDrawing:=False;
                 FSG.OnDrawCell:=DrawCell;
                 FSG.OnKeyDown:=SGKeyDown;
                 FSG.OnDblClick:=GridDobleClick;
                 //FSG.OnRowMoved:=MoveRow;
                 FSG.OnTopLeftChanged:=TopLeftChange;
                 FSG.OnSelectCell:=DrawGridSelectCell;
                 BeginGrid;
                 EndGrid;
           end;
      Except Raise EComponentError.CReate('Error en Asigna SG');
      end;
end;

procedure TSGCtrl.DrawGridSelectCell(Sender: TObject; Col, Row: Integer; var CanSelect: Boolean);
begin if Row<>FLastRow then
      begin FLastRow:=Row;
            if Assigned(FOnMoveRow)
            then FOnMoveRow(Sender,FLastRow,Row);
      end;
end;



Function TSGCtrl.GetColumna(Index:Integer):TColumna;
begin if Index>ColCount-1 then ColCount:=Index+1;
      GetColumna:=FColumnas.Items[Index];
end;



Procedure Intersecta(Var R1,C1:TRect);
begin if (C1.Left>R1.Right) or (C1.Right<R1.Left)
      then begin // ESTA FUERA NO PINTAR
                 C1.Left:=C1.Right;
                 exit;
           end;
      if C1.Left<R1.Left
         then begin if C1.Right<R1.Left
                    then C1.Left:=R1.Left
                    else C1.Left:=R1.Left;
              end;

      if C1.Right>R1.Right
         then begin if C1.Left<R1.Right
                    then C1.Right:=R1.Right
                    else C1.Right:=R1.Right; //L1.Right;
              end;
end;


Function TabCount(Texto:String; Var T1,T2:String):Integer;
var pPos:Integer;
    C,I:Integer;
    Fin:Boolean;
begin TabCount:=0;
      pPos:=Pos(#9,Texto);
      T1:=''; T2:='';
      if pPos>0
      then begin Fin:=True;
                 C:=1;
                 for i:=pPos+1 to Length(Texto) do
                 begin if (Texto[i]=#9)and(Fin)
                       then begin Inc(C);
                            end
                       else Fin:=False
                 end;
                 TabCount:=C;
                 T1:=Copy(Texto,1,pPos-1);
                 T2:=Copy(Texto,pPos+C,Length(Texto));
           end;
end;


Procedure DibujaTexto(Caso:TColAlign; Canvas:TCanvas; Rect:TRect;  RectDibuja:TRect;  Texto:String; Col:Integer; FSG:TStringGrid;
                                      EscalaX,EscalaY:Real; Columna:TColumna; Ops:String; Sepa:Integer);
var OldAlign:LongInt;
    R1,R2,  C1,C2:TRect;
    AP,P,AuxH:Integer;
    AuxS,AuxSS:String;
    T1,T2:String;
    Sep,TC,J:Integer;
    ii:Integer;
    ExTexto:String;
    IsBold:Boolean;

Procedure Cuadrito(Canvas:TCanvas; RectDibuja,Rect:TRect; Texto:String);
Var MX,MY,I:Integer;
    PenColor:TColor;
    TX,TY:Real;
begin PenColor:=Canvas.Pen.Color;
      MX:=(Rect.Right+Rect.Left) div 2;
      MY:=(Rect.Top+Rect.Bottom) div 2;
      TX:=5*EscalaX;
      TY:=5*EscalaY;
      Canvas.MoveTo(Round(MX-TX),Round(MY-TY));
      Canvas.LineTo(Round(MX-TX),Round(MY+TY));
      Canvas.LineTo(Round(MX+TX),Round(MY+TY));
      Canvas.LineTo(Round(MX+TX),Round(MY-TY));
      Canvas.LineTo(Round(MX-TX),Round(MY-TY));
      if (Texto='') or (Trim(Texto)='F')
      then begin // NADA
           end
      else begin For i:=0 to Round(1*EscalaX) do
                 begin Canvas.Pen.Color:=clBlue; //Black;
                       Canvas.MoveTo(Round(MX-TX+(i)),Round(MY-TY));
                       Canvas.LineTo(Round(MX+TX),Round(MY+TY-(i)));

                       Canvas.MoveTo(Round(MX-TX),Round(MY-TY+(i)));
                       Canvas.LineTo(Round(MX+TX-(i)),Round(MY+TY));


                       Canvas.MoveTo(Round(MX+TX-(i)),Round(MY-TY));
                       Canvas.LineTo(Round(MX-TX),Round(MY+TY-(i)));

                       Canvas.MoveTo(Round(MX+TX),Round(MY-TY+(i)));
                       Canvas.LineTo(Round(MX-TX+(i)),Round(MY+TY));

                       (*Canvas.MoveTo(MX+5-i,MY-5);
                       Canvas.LineTo(MX-5,MY+5-i);

                       Canvas.MoveTo(MX+5,MY-5+i);
                       Canvas.LineTo(MX-5+i,MY+5);
                       *)


                 end;
           end;
      Canvas.Pen.Color:=PenColor;
end;

begin
IsBold:=False;
P:=Pos(#30,Texto);
if P>0 then
   begin AuxS:=Copy(Texto,P+1,Length(Texto));
         AP:=Pos('>',AuxS);
         if AP>0
         then begin AuxSS:=Copy(AuxS,AP+1,1);
                    Caso:=tcLeft;
                    if AuxSS='R' then Caso:=tcRight;
                    if AuxSS='C' then Caso:=tcCenter;
              end;
         AP:=Pos('B',AuxS);
         if AP>0 then IsBold:=True;
         Texto:=Copy(Texto,1,P-1);
   end;

P:=Pos(#09,Texto);
if P>0 then
begin  Case Caso of
tcRight:begin R1:=Rect;  R2:=Rect;
              C1:=RectDibuja; C2:=RectDibuja;
              TC:=TabCount(Texto,T1,T2);
              Sep:=0;
              For j:=FSG.ColCount-1 downto (FSG.ColCount-1)-(TC-1) do
              begin if FSG.ColWidths[j]>0 then Sep:=Round(Sep+(FSG.ColWidths[j]*EscalaX)+1);
              end;
              R1.Left:=R1.Left; R1.Right:=R1.Right-Sep; //(50*TC);
              R2.Left:=R2.Right-Sep; //(50*TC);
              Intersecta(R1,C1);
              Intersecta(R2,C2);
              DibujaTexto(Caso,Canvas,R1,C1,T1,Col,FSG,EscalaX,EscalaY, Columna, Ops,Sepa);
              DibujaTexto(Caso,Canvas,R2,C2,T2,Col,FSG,EscalaX,EscalaY, Columna, Ops,Sepa);
         end;
else begin // CASE ELSE
           R1:=Rect;  R2:=Rect;
           C1:=RectDibuja; C2:=RectDibuja;
           TC:=TabCount(Texto,T1,T2);
           Sep:=0;
           //For j:=(FSG.LeftCol) to (Col)+(TC-1) do
           For j:=(FSG.LeftCol) to (FSG.LeftCol)+(TC-1) do
           begin if FSG.ColWidths[j]>0 then Sep:=Round(Sep+(FSG.ColWidths[j]*EscalaX)+1)
           end;
           R1.Left:=R1.Left; R1.Right:=R1.Left+Sep; //(50*TC);
           R2.Left:=R2.Left+Sep; //(50*TC);
           Intersecta(R1,C1);
           Intersecta(R2,C2);
           DibujaTexto(Caso,Canvas,R1,C1,T1,Col,FSG,EscalaX,EscalaY,Columna, Ops,Sepa);
           DibujaTexto(Caso,Canvas,R2,C2,T2,Col+(TC-1),FSG,EscalaX,EscalaY,Columna, Ops,Sepa);
     end;
end; // CASE
exit; // TERMINA
end;  // TABULADORES

P:=Pos(#13+#10,Texto);
if P>0
   then begin AuxS:='';
              //ExtTextOut(Canvas.Handle, Rect.Right - 2, Rect.Top + 2, ETO_CLIPPED or
              //ETO_OPAQUE, @RectDibuja, PChar(AuxS), Length(AuxS), nil);
              AuxH:=(Rect.Bottom-Rect.Top) div 2;
              R1:=Rect; R1.Bottom:=R1.Top+AuxH;
              R2:=Rect; R2.Top:=R2.Bottom-AuxH;
              C1:=RectDibuja; C1.Top:=R1.Top; C1.Bottom:=R1.Bottom;
              C2:=RectDibuja; C2.Top:=R2.Top; C2.Bottom:=R2.Bottom;
              Intersecta(R1,C1);
              Intersecta(R2,C2);
              DibujaTexto(Caso,Canvas,R1,C1,Copy(Texto,1,P-1),Col,FSG,EscalaX,EscalaY, Columna, Ops,Sepa);
              DibujaTexto(Caso,Canvas,R2,C2,Copy(Texto,P+2,Length(Texto)),Col,FSG,EscalaX,EscalaY, Columna, Ops,Sepa);
              exit;
        end;
OldAlign:=GetTextAlign(Canvas.Handle);
ExTexto:=Texto;
Try
 Case Caso of
 tcRight:begin if (Columna.IsCheck) and (Ops='N') then Texto:='';
               SetTextAlign(Canvas.Handle, TA_RIGHT);
               if IsBold then Canvas.Font.Style:=[fsBold] else Canvas.Font.Style:=[];
               ExtTextOut(Canvas.Handle, Rect.Right - 1 - Sepa, Rect.Top + 1, ETO_CLIPPED or
               ETO_OPAQUE, @RectDibuja, PChar(Texto), Length(Texto), nil);
               if (Columna.IsCheck) and (Ops='N')
               then begin Cuadrito(Canvas,Rect,RectDibuja,ExTexto);
                    end;
         end;
 tcLeft: begin if (Columna.IsCheck) and (Ops='N') then Texto:='';
               SetTextAlign(Canvas.Handle, TA_LEFT);
               if IsBold then Canvas.Font.Style:=[fsBold] else Canvas.Font.Style:=[];
               ExtTextOut(Canvas.Handle, Rect.Left+ 1 + Sepa, Rect.Top + 1, ETO_CLIPPED or
               ETO_OPAQUE, @RectDibuja, PChar(Texto), Length(Texto), nil);
               if (Columna.IsCheck) and (Ops='N')
               then begin Cuadrito(Canvas,Rect,RectDibuja,ExTexto);
                    end;
         end;
tcCenter:begin if (Columna.IsCheck) and (Ops='N') then Texto:='';
               SetTextAlign(Canvas.Handle, TA_CENTER);
               if IsBold then Canvas.Font.Style:=[fsBold] else Canvas.Font.Style:=[];
               ExtTextOut(Canvas.Handle, (Rect.Left+Rect.Right) div 2, Rect.Top + 1, ETO_CLIPPED or
               ETO_OPAQUE, @RectDibuja, PChar(Texto), Length(Texto), nil);
               if (Columna.IsCheck) and (Ops='N')
               then begin Cuadrito(Canvas,Rect,RectDibuja,ExTexto);
                    end;
         end;
      end;
Finally SetTextAlign(Canvas.Handle,OldAlign);
end;

end;

procedure TSGCtrl.DrawCell(Sender: TObject; Col, Row: Integer; Rect: TRect; State: TGridDrawState);
begin DrawCellCanvas(Sender,FSG.Canvas,FSG,Col, Row, Rect, State,0,1,1, clAmarillito,1);
end;

procedure TSGCtrl.DrawCellCanvas(Sender: TObject; eCanvas:TCanvas; eFSG:TStringGrid; Col, Row: Integer;
                                 Rect: TRect; State: TGridDrawState; MinX:Integer; EscalaX,EscalaY:Real; clColor:TColor; Sepa:Integer);
var AuxS,s:String;
    Recta,RectaDibuja:TRect;
    Al:TColAlign;
    Info,InfoColor:String;
    i,Min,Max:Integer;
    OpS:String;
    Columna:TColumna;
begin if FStart<=Col then // AGUAS <=
      begin if Columnas[Col-FStart]=nil
            then AL:=TcLeft
            else begin AL:=Columnas[Col-FStart].Align;
                       Columna:=Columnas[Col-FStart];
                 end;
      end else AL:=TcLeft;
      S := eFSG.Cells[Col, Row];
      Info:=eFSG.Cells[kTipoCol,Row];
      OpS:=Copy(Info,1,1);
      InfoColor:=Trim(eFSG.Cells[kFontColor,Row]);
      Recta:=Rect;
      RectaDibuja:=Rect;

      if gdFixed in State    then begin eCanvas.Brush.Color:=clColor;
                                        eCanvas.Font.Color:=clBlack;
                                  end
 else if gdSelected in State then begin eCanvas.Brush.Color:=clActiveCaption;
                                        eCanvas.Font.Color:=clCaptionText;
                                  end
 else if gdFocused in State  then begin eCanvas.Brush.Color:=clActiveCaption;
                                        eCanvas.Font.Color:=clCaptionText;
                                  end
 else begin if (Ops='J')
            then eCanvas.Brush.Color:=clColor
            else eCanvas.Brush.Color:=clWindow;
            if InfoColor<>''
            then eCanvas.Font.Color:=StrToInt(InfoColor)
            else eCanvas.Font.Color:=clWindowText;
      end;

      if (Ops='H')
      then begin eCanvas.Brush.Color:=clColor;
                 eCanvas.Font.Color:=clBlack;
           end;

      if (Ops<>'N') and (Ops<>'H') and (Ops<>'J')
      then begin if Not (gdSelected in State)and(Ops='T') then
                 begin eCanvas.Brush.Color:=clColor;
                       eCanvas.Font.Color:=clBlack;
                 end;
                 Min:=MinX;
                 for i:=0 to eFSG.LeftCol-1 do // FStart
                 begin if eFSG.ColWidths[i]>0 then Min:=Min+eFSG.ColWidths[i]
                 end;
                 Max:=0;
                 for i:=eFSG.LeftCol-1 to eFSG.ColCount-1 do  // FStart
                 begin if eFSG.ColWidths[i]>0 then Max:=Round(Max+(eFSG.ColWidths[i]*EscalaX)+1)
                 end;

                 //RectaDibuja.Left:=RectaDibuja.Left-1;
                 RectaDibuja.Right:=RectaDibuja.Right+1;

                 Recta.Left:=Min+1;
                 Recta.Right:=MinX+Max-1;

                 AuxS:=Copy(Info,2,1);
                 AL:=tcLeft;
                 if AuxS='R' then AL:=tcRight;
                 if AuxS='C' then AL:=tcCenter;
           end;
      DibujaTexto(Al, eCanvas, Recta, RectaDibuja,S, Col, FSG,EscalaX,EscalaY ,Columna, Ops,Sepa);
end;



//Procedure TSGCtrl.SetColumna(Index:Integer; C:TColumna);
//begin TList.Items[Index]:=C;
//end;

Procedure TSGCtrl.SetColCount(N:Integer);
var i:Integer;
    C:TColumna;
begin SG.ColCount:=FStart+N;
      SG.DefaultRowHeight:=16;
      for i:=FColumnas.Count to N-1 do
      begin C:=TColumna.Create(Self);
            C.SG:=Self;
            C.ColNum:=i;
            FColumnas.Add(C);
      end;
      For i:=N to FColumnas.Count-1 do
      begin TColumna(FColumnas.Items[i]).Free;
      end;
      FColumnas.Count:=N;
      FColCount:=N;
end;

Function TSGCtrl.ColumnByName(eColName:String):TColumna;
var i:Integer;
begin eColName:=Trim(UpperCase(eColName));
      for i:=0 to FColumnas.Count-1 do
      begin if TColumna(FColumnas.Items[i]).ColName=eColName
               then begin ColumnByName:=FColumnas.Items[i];
                          exit;
                    end;
      end;
      Raise ESGCtrl.Create(' La Columna ' +eColName +' no existe ');
end;


Function TSGCtrl.AddHeader(Datos:Array of String; Alto:Integer; eFontColor:TColor):Integer;
var i:Integer;
begin //FSG.ColCount:=High(Datos)+1;
      FSG.Cells[kTipoCol,ActualY]:='N';
      if Alto<>-1 then SetActualHeight(Alto) else SetActualHeight(kActualHeight);
      if eFontColor<>-1 then SetFontColor(eFontColor) else SetFontColor(clWindowText);
      for i:=0 to High(Datos) do
      begin FSG.Cells[FStart+i,ActualY]:=Datos[i];
      end;
      AddHeader:=ActualY;
      NextRow;
end;

Procedure TSGCtrl.SetFontColor(Color:TColor);
begin FSG.Cells[kFontColor,ActualY]:=IntToStr(Color);
end;

Procedure TSGCtrl.SetPrintCol(Caso:String);
begin FSG.Cells[kPrintCol,ActualY]:=UpperCase(Caso);
end;


Procedure TSGCtrl.AddTitle(Nombre:String; Align:TColAlign);
var i:Integer;
begin Case Align of
      tcLeft  :FSG.Cells[kTipoCol,ActualY]:='TL';
      tcRight :FSG.Cells[kTipoCol,ActualY]:='TR';
      tcCenter:FSG.Cells[kTipoCol,ActualY]:='TC';
      end;
      for i:=FStart to FSG.ColCount-1 do
      begin FSG.Cells[i,ActualY]:=Nombre;
      end;
      NextRow;
end;

Procedure TSGCtrl.AddTexto(Nombre:String; Align:TColAlign; eFontColor:TColor; eAlto:Integer);
var i:Integer;
begin //FSG.Cells[kTipoCol,ActualY]:='N';
      Case Align of
      tcLeft  :FSG.Cells[kTipoCol,ActualY]:='XL';
      tcRight :FSG.Cells[kTipoCol,ActualY]:='XR';
      tcCenter:FSG.Cells[kTipoCol,ActualY]:='XC';
      end;
      if eFontColor<>-1 then SetFontColor(eFontColor);
      for i:=FStart to FSG.ColCount-1 do
      begin FSG.Cells[i,ActualY]:=Nombre;
      end;
      if eAlto<>-1 then SetActualHeight(eAlto) else SetActualHeight(kActualHeight);
      NextRow;
end;

Procedure TSGCtrl.AddTextoMultiLine(Nombre:String; Align:TColAlign; eFontColor:TColor; eAlto:Integer);
var i,j:Integer;
    L:TStringList;
begin L:=TStringList.Create;
      L.Text:=Nombre;

      Case Align of
      tcLeft  :FSG.Cells[kTipoCol,ActualY]:='XL';
      tcRight :FSG.Cells[kTipoCol,ActualY]:='XR';
      tcCenter:FSG.Cells[kTipoCol,ActualY]:='XC';
      end;

      Try
      if eFontColor<>-1 then SetFontColor(eFontColor);
      if L.Count<=0 then
      begin for i:=FStart to FSG.ColCount-1 do
            begin FSG.Cells[i,ActualY]:=Nombre;
            end;
      end
      else
      For j:=0 to L.Count-1 do
      begin if eFontColor<>-1 then SetFontColor(eFontColor);
            Case Align of
            tcLeft  :FSG.Cells[kTipoCol,ActualY]:='XL';
            tcRight :FSG.Cells[kTipoCol,ActualY]:='XR';
            tcCenter:FSG.Cells[kTipoCol,ActualY]:='XC';
            end;

            for i:=FStart to FSG.ColCount-1 do
            begin FSG.Cells[i,ActualY]:=L.Strings[j];
            end;
            if j<>(L.Count-1)
            then begin if eAlto<>-1 then SetActualHeight(eAlto) else SetActualHeight(kActualHeight);
                       NextRow;
                 end;
      end;
      NextRow;
      Finally L.Free;
      end;
end;





Procedure TSGCtrl.NextRow;
var i:Integer;
begin ActualY:=ActualY+1;
      FMaxRow:=ActualY;
      if ActualY>FSG.RowCount
         then begin AddRows;
              end;
      FSG.Cells[kTipoCol,ActualY]:='N';
      FSG.Cells[kFontColor,ActualY]:='';
      FSG.Cells[kPrintCol,ActualY]:='';
end;

Procedure TSGCtrl.AddRows;
var i,j:Integer;
begin FSG.RowCount:=ActualY+10;
      if FSG.Cells[0,ActualY]='' then FSG.Cells[0,ActualY]:='N';
      for i:=(ActualY+1) to ActualY+10 do
      begin FSG.Cells[kTipoCol,i]:='N';
            FSG.Cells[kFontColor,i]:='';
            FSG.Cells[kPrintCol,i]:='';
            For j:=kPrintCol to FSG.ColCount-1 do
                FSG.Cells[j,i]:='';
      end;
end;

Procedure TSGCtrl.SetCellStr(eColName:String; eRow:Integer; eTexto:String);
var i:Integer;
begin if eRow=-1 then eRow:=FSG.Selection.Top;
      eColName:=Trim(UpperCase(eColName));
      if eColName='@TYPE'
      then begin Self.FSG.Cells[kTipoCol ,eRow]:=eTexto;
                 Exit;
           end;

      if eColName='@FONTCOLOR'
      then begin Self.FSG.Cells[kFontColor,eRow]:=eTexto;
                 Exit;
           end;

      for i:=0 to ColCount-1 do
      begin With Columnas[i] do
            begin if ColName=eColName
                  then begin Self.FSG.Cells[FStart+ColNum,eRow]:=eTexto;
                       end;
            end;
      end;
end;

Function TSGCtrl.GetCellStr(eColName:String; eRow:Integer):String;
var i:Integer;
begin if eRow=-1 then eRow:=FSG.Selection.Top;
      eColName:=Trim(UpperCase(eColName));
      if eColName='@TYPE'
      then begin GetCellStr:=Self.FSG.Cells[kTipoCol ,eRow];
                 Exit;
           end;
      if eColName='@FONTCOLOR'
      then begin GetCellStr:=Self.FSG.Cells[kFontColor,eRow];
                 Exit;
           end;
      for i:=0 to ColCount-1 do
      begin With Columnas[i] do
            begin if ColName=eColName
                  then begin GetCellStr:=Self.FSG.Cells[FStart+ColNum,eRow];
                             Exit;
                       end;
            end;
      end;
      GetCellStr:='';
end;


Procedure TSGCtrl.EndGrid;
begin FSG.RowCount:=ActualY;
      FMaxRow:=ActualY+1;
      SG.Invalidate;
end;


Procedure TSGCtrl.EndCaption;
begin FSG.FixedRows:=ActualY;
end;

Procedure TSGCtrl.BeginGrid;
var i:Integer;
begin FSG.DefaultRowHeight:=16;
      ActualY:=0;
      Try
      AddRows;
      Except Raise EComponentError.CReate('AddRows');
      end;
      Try
      FSG.Cells[0,ActualY]:='N';
      if SG.ColCount<FStart then SG.ColCount:=FStart;
      For i:=0 to FStart-1 do
        SG.ColWidths[i]:=-1;
      Except Raise EComponentError.CReate('Asigna N');
      end;
end;





Procedure TSGCtrl.DefaultOnCalcRow(DataSet:TDataSet; CurrRow:Integer; RowCaso:TRowCaso;  Var ShowRow:Boolean);
begin if Assigned(OnCalcRow) then OnCalcRow(Self,DataSet,CurrRow,RowCaso,ShowRow);
end;



Function GetCalcTexto(DataSet:TDataSet; Texto:String):String;
var s1,s2:String;
i,l,Fin:Integer;
begin GetCalcTexto:='';
      if DataSet.IsEmpty then exit;
      Texto:=Trim(Texto);
      L:=Length(Texto);
      if L=0 then Result:=''
      else begin I:=Pos('+',Texto);
                 if i<>0 then begin Result:=GetCalcTexto(Dataset,Copy(Texto,1,I-1))+GetCalcTexto(DataSet,Copy(Texto,i+1,L));
                              end
                         else begin I:=Pos('"',Texto);
                                    if I=1
                                    then begin Fin:=Pos('"',Copy(Texto,2,L))-1;
                                               Texto:=Copy(Texto,2,Fin);
                                               Result:=Texto+GetCalcTexto(DataSet,Copy(Texto,Fin+1,L));
                                         end
                                    else begin if DataSet=nil
                                               then Result:=''
                                               else Result:=DataSet.fieldByName(Texto).AsString;
                                         end;
                              end;
           end;
end;






Procedure TSGCtrl.DefaultOnCalc(DataSet:TDataSet; Var Texto:String; X,Y:Integer; FieldName,ColName:String);

Function GetRes(S:String):String;
var s1,s2:String;
i,l,Fin:Integer;
begin S:=Trim(S);
      L:=Length(S);
      if L=0 then Result:=''
      else begin I:=Pos('+',S);
                 if i<>0 then begin Result:=GetRes(Copy(S,1,I-1))+GetRes(Copy(S,i+1,L));
                              end
                         else begin I:=Pos('"',S);
                                    if I=1
                                    then begin Fin:=Pos('"',Copy(S,2,L))-1;
                                               S:=Copy(S,2,Fin);
                                               Result:=S+GetRes(Copy(S,Fin+1,L));
                                         end
                                    else begin if DataSet=nil
                                               then Result:=''
                                               else Result:=DataSet.fieldByName(S).DisplayText; //AsString;
                                         end;
                              end;
           end;
end;

begin if UseBonitoStr
      then Texto:=BonitoStr(GetRes(FieldName))
      else Texto:=GetRes(FieldName);
end;


Procedure TSGCtrl.AddQryRow(Q:TDataSet; Datos:Array of TQryDefine);
//Array of String; Formatos:Array of String);
var i:Integer;
    F,Res:String;
    C1:Char;
    Col:TColumna;
    ShowCol:Boolean;
begin IF Q=nil then exit;
      Q.First;
      ShowCol:=False;
      if Assigned(OnCalcRow) then OnCalcRow(Self,Q,ActualY, rcQueryBegin ,ShowCol);
      While Not Q.EOF do
      begin ShowCol:=True;
            if Assigned(OnCalcRow) then OnCalcRow(Self,Q,ActualY, rcRowBegin ,ShowCol);
            for i:=0 to High(Datos) do
            begin Col:=ColumnByName(Datos[i][0]);
                  if Assigned(OnCalc)
                     then OnCalc(Self,Q,Res,I,ActualY,Datos[i][1],Datos[i][0])
                     else DefaultOnCalc(Q,Res,I,ActualY,Datos[i][1],Datos[i][0]);
                  if (Length(Datos[i][2])>1)
                  then begin F:=Datos[i][2];
                             Case F[1] of
                             '#':begin  if ShowCol then
                                        FSG.Cells[FStart+i,ActualY]:=FormatDateTime(Copy(F,2,Length(F)),StrToDate(Res));
                                 end;
                             'D':begin  if ShowCol then
                                        FSG.Cells[FStart+i,ActualY]:=Res;
                                 end;
                             'F':begin if Res='' then Res:='0';
                                       if ShowCol then
                                       FSG.Cells[FStart+i,ActualY]:=FormatFloat(Copy(F,2,Length(F)),StrToFloat(Res));
                                 end;
                             else begin if ShowCol then
                                        FSG.Cells[FStart+i,ActualY]:=Res;
                                  end;
                             end

                       end
                  else begin if ShowCol then
                             FSG.Cells[FStart+i,ActualY]:=Res;
                       end;
            end;
            if ShowCol then NextRow;
            if Assigned(OnCalcRow) then OnCalcRow(Self,Q,ActualY, rcRowEnd,ShowCol);
            Q.Next;
      end;
      if Assigned(OnCalcRow) then OnCalcRow(Self,Q,ActualY, rcQueryEnd ,ShowCol);
end;


Procedure TSGCtrl.AddQry(Q:TDataSet; eBegin,eEnd:Boolean; TitleWidth,RowHeaderWidth,RowWidth:Integer; ShowTitle:Boolean);
var i:Integer;
    F,Res:String;
    C1:Char;
    Col:TColumna;
    Campo:String;
    ShowCol:Boolean;
    Tc:TColAlign;
    DefW:Integer;
    ColN:Integer;
begin IF Q=nil then exit;
      if Q.FieldCount=0 then Exit;
      ColCount:=Q.FieldCount;
//      Q.Fields[i].
      (*
      SG.Canvas.Font.Name:='MS Sans Serif';
      SG.Canvas.Font.Style:=[];
      SG.Canvas.Font.Size:=7;
      *)
      DefW:=SG.Canvas.TextWidth('n');
      if eBegin  then BeginGrid;
      if ShowTitle then
      begin  if Trim(Titulo1)<>'' then begin if TitleWidth<>-1
                                             then Self.SetActualHeight(TitleWidth);
                                             SetPrintCol(kNoPrint);
                                             AddTitle(Titulo1,tcCenter);
                                       end;
             if Trim(Titulo2)<>'' then begin if TitleWidth<>-1
                                             then Self.SetActualHeight(TitleWidth);
                                             SetPrintCol(kNoPrint);
                                             AddTitle(Titulo2,tcCenter);
                                       end;
       end;

      ColN:=0;
      For i:=0 to Q.FieldCount-1 do
      begin if Q.Fields[i].Visible=False
            then begin Columnas[ColN].SetInfoEx(Q.Fields[i].FieldName,Q.Fields[i].DisplayLabel+#30'>L', 1, tcLeft,'',False,ShowTitle);
                       Inc(ColN);
                 end;
      end;

      if ColN=0 then begin SG.FixedCols:=FStart;
                           FLeftCol:=FStart+1;
                     end;
                     
      For i:=0 to Q.FieldCount-1 do
      begin Tc:=tcLeft;
            Case Q.Fields[i].Alignment of
            taRightJustify:Tc:=tcRight;
            taLeftJustify:Tc:=tcLeft;
            taCenter:Tc:=TcCenter;
            end;
            if Q.Fields[i].Visible=True
            then begin Columnas[ColN].SetInfoEx(Q.Fields[i].FieldName,
                                     Q.Fields[i].DisplayLabel+#30'>L',
                                     Q.Fields[i].DisplayWidth*DefW,
                                     tc,
                                     '',
                                     True,
                                     ShowTitle);
                       Inc(ColN);
                 end;
      end;
      if ShowTitle then
      begin if RowHeaderWidth<>-1
            then Self.SetActualHeight(RowHeaderWidth)
            else SetActualHeight(32);
            SetPrintCol(kPrintHeader);
            NextRow;
            EndCaption;
      end;
      //EndCaption;
      Q.First;
      ShowCol:=False;
      if Assigned(OnCalcRow) then OnCalcRow(Self,Q,ActualY, rcQueryBegin ,ShowCol);
      While Not Q.EOF do
      begin ShowCol:=True;
            if RowWidth<>-1 then Self.SetActualHeight(RowWidth);
            if Assigned(OnCalcRow) then OnCalcRow(Self,Q,ActualY, rcRowBegin ,ShowCol);
            For i:=0 to ColCount-1 do
            begin Col:=GetColumna(i);
                  Campo:=Col.ColName;
                  DefaultOnCalc(Q,Res,I,ActualY,Campo,Campo);
                  if Assigned(OnCalc)
                     then OnCalc(Self,Q,Res,I,ActualY , Campo,Campo);
                   begin if ShowCol then
                             FSG.Cells[FStart+i,ActualY]:=Res;
                   end;
            end;
            if ShowCol then NextRow;
            if Assigned(OnCalcRow) then OnCalcRow(Self,Q,ActualY, rcRowEnd,ShowCol);
            Q.Next;
      end;
      if Assigned(OnCalcRow) then OnCalcRow(Self,Q,ActualY, rcQueryEnd ,ShowCol);
      if eEnd then EndGrid;
end;



Procedure TSGCtrl.AddQryValues(Q:TDataSet; Datos:Array of TQryDefine);
var i:Integer;
    F,Res:String;
    C1:Char;
    Col1,Col2:TColumna;
    ShowCol:Boolean;
begin IF Q=nil then exit;
      Q.First;
      ShowCol:=False;
      if Assigned(OnCalcRow) then OnCalcRow(Self,Q,ActualY, rcQueryBegin ,ShowCol);
      While Not Q.EOF do
      begin ShowCol:=True;
            if Assigned(OnCalcRow) then OnCalcRow(Self,Q,ActualY, rcRowBegin ,ShowCol);
            Col1:=ColumnByName(Datos[0][0]);
            Col2:=ColumnByName(Datos[1][0]);
            For i:=0 to Q.FieldCount-1 do
            begin
                  FSG.Cells[FStart+Col1.FColNum,ActualY]:=Q.Fields[i].FieldName;
                  FSG.Cells[FStart+Col2.FColNum,ActualY]:=Q.Fields[i].AsString;
                  if ShowCol then NextRow;
                  if Assigned(OnCalcRow) then OnCalcRow(Self,Q,ActualY, rcRowEnd,ShowCol);
            end;
            Q.Next;
      end;
      if Assigned(OnCalcRow) then OnCalcRow(Self,Q,ActualY, rcQueryEnd ,ShowCol);

end;




procedure TSGCtrl.RepSGNeedData(Sender: TObject; var MoreData: Boolean);
var i:Integer;
begin Inc(PrintRowCount);
      While (FSG.Cells[kPrintCol,PrintRowCount]='NP')and(PrintRowCount<=(FSG.RowCount-1)) do
      begin Inc(PrintRowCount);
      end;
      if Sender is TRepSGControl
      then begin if PrintOnHeader then
                    begin PrintRowCount:=StackPrintRow;
                          PrintOnHeader:=False;
                          //:=PrintRowCount;
                          //PrintRowCount:=LastPrintRowCount;
                    end
                 else
                 if //(Not TRepSGControl(Sender).Available) and
                    (TRepSGControl(Sender).PageNumber>PrintLastPage) or (PrintChangePage)
                    then begin PrintChangePage:=False;
                               StackPrintRow:=PrintRowCount-1;
                               i:=0;
                               While (i<=PrintRowCount)and(FSG.Cells[kPrintCol,i]<>'HP') do
                               begin Inc(i);
                               end;
                              //if PrintRowCount<i then PrintRowCount:=i;
                               PrintRowCount:=i;
                               PrintOnHeader:=True;
                               PrintLastPage:=PrintLastPage+1; //TRepSGControl(Sender).PageNumber;
                               if PrintLastPage<=1 then PrintLastPage:=1;
                          end;
           end; //FIN
      MoreData:=(PrintRowCount<=(FSG.RowCount-1));
end;

Const MaxLab=2;


procedure TSGCtrl.BandDetBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
var i,j:Integer;
    MaxL, MaxR,PosL, AuxPos:Integer;
    Escala:Real;
    Tit:String;
    IsTit:Boolean;
    pRR:TQRMacvGridPrint;
    M:Boolean;
begin M:=False;
      Sender.Size.Height:=Round(SG.RowHeights[PrintRowCount]*2.2);
      if TRepSGControl(Sender.Parent).CurrentY>(TRepSGControl(Sender.Parent).Page.Length-
                                                (TRepSGControl(Sender.Parent).Page.BottomMargin
                                                 +TRepSGControl(Sender.Parent).Page.TopMargin)
                                                 +Sender.Size.Length)
         //TRepSGControl(Sender.Parent).PageNumber<>PrintLastPage
      then begin PrintChangePage:=True;
                 RepSGNeedData(TRepSGControl(Sender.Parent), M);
           end;
      pRR:=TQRMacvGridPrint(RR);
      pRR.LinNum:=PrintRowCount;
      pRR.Invalidate;
      Sender.Size.Height:=Round(SG.RowHeights[PrintRowCount]*2.2);
end;

procedure TSGCtrl.RepSGControlBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin PrintRowCount:=-1; //-1
      StackPrintRow:=-1; //1;
      LastPrintRowCount:=-1;
      PrintOnHeader:=False;
      PrintLastPage:=1;
      PrintChangePage:=False;
end;

Procedure TSGCtrl.Print(Preview:Boolean; PrintHeader:Boolean; eApli:TInterApli);
var Rep:TRepSGControl;
	 Lab:TQRLabel;
	 i,j:Integer;
	 Arr:Array[0..2] of TList;
	 Detalle:TQRBand;
	 Lab1:TQrLabel;
	  pRR:TQRMacvGridPrint;
    Qr:TQrInterEncabezado;
begin Rep:=TRepSGControl.Create(Self);
		Try
		Rep.Page.Orientation:=FPageOrientation;

                Qr:=TQrInterEncabezado.Create(Rep.QrTitulo);
                Qr.Parent:=Rep.QrTitulo;
                Qr.SetBounds(0,0,100,100);
		Qr.Apli:=eApli;
		Qr.Titulo1:=Titulo1;
		Qr.Titulo2:=Titulo2;
		Qr.NomReporte:=NomReporte;
		Qr.FechaInfor:=FechaInfor;

		Rep.BeforePrint:=RepSGControlBeforePrint;
		Rep.OnNeedData:=RepSGNeedData;
		Rep.BandDet.BeforePrint:=BandDetBeforePrint;

		RR:=TQRMacvGridPrint.Create(Rep.BandDet);
		pRR:=TQRMacvGridPrint(RR);
		pRR.Parent:=Rep.BandDet;
		pRR.SG:=Self;
		pRR.Font.Size:=7;
		pRR.SetBounds(0,0,2000,500);
                if Preview then Rep.Preview else Rep.Print;
		Finally Rep.Free;
		end;

end;


Function IsMultiLine(Texto:String; Var Lineas:TStringList):Boolean;
var Lin:TStringList;
    S1,S2,S3:String;
    P:Integer;

Procedure SeparaEnter(Texto:String; Var S1,S2:String);
var P:Integer;
begin P:=Pos(#13+#10,Texto);
      if P>0 then begin S1:=Copy(Texto,1,P-1);
                        S2:=Copy(Texto,P+2,Length(Texto));
                  end
             else begin S1:=Texto;
                        S2:='';
                  end;
end;

begin SeparaEnter(Texto,S1,S2);
      if (S2<>'')
         then begin Lin:=TStringList.Create; Lin.Clear;
                    Lin.Add(S1);
                    While (S2<>'') do
                    begin SeparaEnter(S1,S1,S2);
                          if (S1<>'') then Lin.Add(S1);
                    end;
                    Result:=True;
                    Lineas:=Lin;
              end
         else begin Result:=False;
                    Lineas:=nil;
              end;
end;


Function IsTabInside(Texto:String; Var eColTexto,eColAncho,eColNumCol:TStringList;  Align:TColAlign; SG:TSGCtrl):Boolean;
var Lineas,Contador:TStringList;
    T1,T2,S1,S2,S3:String;
    K, ColN, I, P, TC, Tam, SumaI:Integer;

    SalTam : TStringList;
    SalTxt : TStringList;
    SalCol : TStringList;

    ColSobra :Integer;
    ColInicio:Integer;
    ColSuma  :Integer;
    ColTam   :Integer;


begin Result:=False;
      eColTexto :=nil;
      eColAncho :=nil;
      eColNumCol:=nil;

      ColN:=(SG.SG.ColCount-SG.SG.LeftCol);
      P:=Pos(#09,Texto);
      if P=0 then Exit;

     Lineas:=TStringList.Create;
     Contador:=TStringList.Create;
      Try
               T2:=Texto;
               Repeat P:=Pos(#09,T2);
                               if P>0 then begin Texto:=T2;
                                                 TC:=TabCount(Texto,T1,T2);
                                                 Lineas.Add(T1);
                                                 Contador.Add(IntToStr(TC));
                                           end
                                      else begin if Trim(T2)<>''
                                                 then begin Lineas.Add(T2);
                                                            Contador.Add('0')
                                                      end;
                                           end;
         Until  (P<=0);

   SalTam:=TStringList.Create;
   SalTxt:=TStringList.Create;
   SalCol:=TStringList.Create;

   Case Align of
   tcRight :begin  ColInicio:=SG.SG.LeftCol;
                   ColSobra :=ColN;
                   ColSuma  :=1;
                   For i:=0 to Lineas.Count-1 do
                   begin Tam:=StrToInt(Contador.Strings[i]);
                         ColSobra:=ColSobra-Tam;
                   end;
                   For i:=0 to Lineas.Count-1 do
                   begin if (i=0) then Tam:=ColSobra else Tam:=StrToInt(Contador.Strings[i-1]);
                         ColTam:=0;
                         For k:=1 to Tam do
                         begin ColTam:=ColTam+SG.SG.ColWidths[ColInicio];
                               Inc(ColInicio,ColSuma);
                               Dec(ColSobra);
                         end;
                         SalTam.Add(IntToStr(ColTam));
                         SalCol.Add(IntToStr(Tam));
                         SalTxt.Add(Lineas[i]);
                   end;
             end;
   Else      begin ColInicio:=SG.SG.LeftCol;
                   ColSobra :=ColN;
                   ColSuma  :=1;
                   For i:=0 to Lineas.Count-1 do
                   begin Tam:=StrToInt(Contador.Strings[i]);
                         if Tam=0 then Tam:=ColSobra;
                         ColTam:=0;
                         For k:=1 to Tam do
                         begin ColTam:=ColTam+SG.SG.ColWidths[ColInicio];
                               Inc(ColInicio,ColSuma);
                               Dec(ColSobra);
                         end;
                         SalTam.Add(IntToStr(ColTam));
                         SalCol.Add(IntToStr(Tam));
                         SalTxt.Add(Lineas[i]);
                   end;
             end;
   end;{Case}
  Finally
     Lineas.Free;
     Contador.Free;
  end;

   eColTexto:=SalTxt;
   eColAncho:=SalTam;
   eColNumCol:=SalCol;

   Result:=True;

end;




Function IsAligned(S:String; Var Align:TColAlign):Boolean;
var Lin:TStringList;
    S1,S2:String;
    P:Integer;
    C1:Char;
begin P:=Pos(#30,S);
      if (P>0)
      then begin S1:=Copy(S,P+1,Length(S));
                 if (Copy(S1+' ',1,1)='>')
                    then begin S1:=Copy(S1+'  ',2,1);
                               C1:=S1[1];
                               Case C1 of
                               'L':Align:=TcLeft;
                               'R':Align:=TcRight;
                               'C':Align:=TcCenter;
                               end;
                         end;
           end;
end;


Function Clear30(S:String):String;
var Lin:TStringList;
    S1,S2:String;
    P:Integer;
    C1:Char;
begin P:=Pos(#30,S);
      if (P>0) then Result:=Copy(S,1,P-1)
               else Result:=S;
end;

Function Clear13(S:String):String;
var Lin:TStringList;
    S1,S2:String;
    P:Integer;
    C1:Char;
begin P:=Pos(#13,S);
      if (P>0) then S:=Clear13(Copy(S,1,P-1)+Copy(S,P+1,Length(S)));
      P:=Pos(#10,S);
      if (P>0) then S:=Clear13(Copy(S,1,P-1)+Copy(S,P+1,Length(S)));
      Result:=S;
end;

Function Remplaza13(S:String; Remp:string):String;
var Lin:TStringList;
    S1,S2:String;
    P:Integer;
    C1:Char;
begin P:=Pos(#13#10,S);
      if (P>0) then S:=Remplaza13(Copy(S,1,P-1)+Remp+Copy(S,P+1,Length(S)),Remp);
      P:=Pos(#10#13,S);
      if (P>0) then S:=Remplaza13(Copy(S,1,P-1)+Remp+Copy(S,P+1,Length(S)),Remp);
      P:=Pos(#13,S);
      if (P>0) then S:=Remplaza13(Copy(S,1,P-1)+Remp+Copy(S,P+1,Length(S)),Remp);
      P:=Pos(#10,S);
      if (P>0) then S:=Remplaza13(Copy(S,1,P-1)+Remp+Copy(S,P+1,Length(S)),Remp);
      Result:=S;
end;

Function Remplaza9(S,Remp:String):String;
var Lin:TStringList;
    S1,S2:String;
    P:Integer;
    C1:Char;
begin P:=Pos(#9,S);
      if (P>0) then S:=Remplaza9(Copy(S,1,P-1)+Remp+Copy(S,P+1,Length(S)),Remp);
      Result:=S;
end;



Function Clear9(S:String):String;
var Lin:TStringList;
    S1,S2:String;
    P:Integer;
    C1:Char;
begin P:=Pos(#9,S);
      if (P>0) then S:=Clear9(Copy(S,1,P-1)+Copy(S,P+1,Length(S)));
      Result:=S;
end;



Function Cien(N1,N2:Integer):Integer;
begin if N2=0
      then Result:=100
      else Result:=Trunc((N1/N2)*100);
end;


Function TSGCtrl.GetHTMLBodyText:String;
var H:THTP;
    i,ColN,Ancho,RowNum:Integer;
    MoreData:Boolean;
    Alin,MainAlin:TColAlign;
    Tit:Boolean;
    Color1,Color2:TColor;
    Texto,InfoColor,Tipo,Tipo1:String;
    ListTxt, ListTam, ListCol :TStringList;

    ExtraInfo:String;
    ExtraInicio:Integer;
    TIndex:Integer;
    PreTexto,PostTexto:String;

Procedure AgregaTitulo(Texto:String; PreText,PostText:String; Dato1:Integer; Color1,Color2:Tcolor; Alin:TColAlign);
var ListTxt, ListTam, ListCol :TStringList;
    i:Integer;
    Al:TColAlign;
begin if IsTabInside(Texto,ListTxt, ListTam, ListCol ,Alin,Self)
      then begin H.OpenRowTable(Color2);
                 For i:=0 to ListTxt.Count-1 do
                 begin Al:=Alin;
                       IsAligned(ListTxt.Strings[i],Alin);
                       if (ListTxt.Strings[i]='') then ListTxt.Strings[i]:=KO_Espacio;
                       H.AddTableColValue(Clear30(ListTxt.Strings[i]),PreText,PostText,-1,-1
                                                     ,Cien(StrToInt(ListTam.Strings[i]),Ancho)
                                                     ,Color1,Color2,Alin,-1);
                                                     //StrToInt(ListCol.Strings[i]));
                       //H.AddHtml('</TD>');
                        PreText:='';
                       PostText:='';
                 end;
                 H.CloseRowTable;
           end
      else begin H.AddTableRowTitle(Texto,PreText,PostText,-1,Color1,Color2,Alin);
           end;
end;

begin
Result:='';
H:=THTP.Create;
Try   //H.CreateHeader('Interacciones Casa de Bolsa','MACV HTML-Maker','1.0','Victor Martínez Castro');
      ColN:=(FSG.ColCount-FSG.LeftCol);
      Ancho:=0;
      For i:=FSG.LeftCol to FSG.ColCount-1 do
      begin Ancho:=Ancho+FSG.ColWidths[i]
      end;
      if Ancho<=0 then Ancho:=1;
      ExtraInfo:='';
      ExtraInicio:=H.BodyPos;
      H.OpenTable(ColN,1,0,-1,clGray,2);
      RowNum:=-1;
      MoreData:=True;
      While (MoreData) do
      begin Inc(RowNum);
            (*
            While (FSG.Cells[kPrintCol,RowNum]='NP')and(RowNum<=(FSG.RowCount-1)) do
            begin Inc(RowNum);
            end;
            *)
            if (RowNum<=(FSG.RowCount-1))
            then begin TIndex:=TabIndex.IndexOf(IntToStr(RowNum));
                       if TIndex<>-1
                       then begin ExtraInfo:=ExtraInfo+' '+'<A HREF="#A'+IntToStr(TIndex+1)+'">'+FTab.Tabs[TIndex]+'</A>';
                            end;
                       Tit:=False;
                       InfoColor:=Trim(FSG.Cells[kFontColor,RowNum]);
                       if InfoColor<>'' then Color1:=StrToInt(InfoColor)
                                        else Color1:=clblack; //TColor
                       //Color1:=InfoColor;
                       Color2:=clwhite;
                       Tipo:=FSG.Cells[kTipoCol,RowNum];
                       Tipo1:=Copy(Tipo,1,1);
							  if (Tipo1<>'N') and (Tipo1<>'H') and (Tipo1<>'J') then begin Tit:=True; Color2:=clAmarillito; end;

                       if Tipo='H'  then begin Color2:=clAmarillito; end;
                       if (Tipo='TL') then begin Alin:=tcLeft;   Tit:=True; Color2:=clAmarillito; end;
                       if (Tipo='TR') then begin Alin:=tcRight;  Tit:=True; Color2:=clAmarillito; end;
                       if (Tipo='TC') then begin Alin:=tcCenter; Tit:=True; Color2:=clAmarillito; end;

                       if (Tipo='XL') then begin Alin:=tcLeft;   Tit:=True; Color2:=clwhite; end;
                       if (Tipo='XR') then begin Alin:=tcRight;  Tit:=True; Color2:=clwhite; end;
                       if (Tipo='XC') then begin Alin:=tcCenter; Tit:=True; Color2:=clwhite; end;


                      if Tit
                      then begin //Color2:=clAmarillito;
                                 Texto:=FSG.Cells[SG.LeftCol,RowNum];
                                 if IsMultiLine(Texto,ListTxt)
                                 then begin Try
                                              MainAlin:=Alin;
                                              For i:=0 to ListTxt.Count-1 do
                                              begin Alin:=MainAlin;
                                                    IsAligned(ListTxt[i],Alin);
                                                    //AgregaTitulo(Texto:String; Dato1:Integer; Color1,Color2:Tcolor; Alin:TColAlign);
                                                    //H.AddTableRowTitle(Clear30(Lineas[i]),-1,Color1,Color2,Alin);
                                                    AgregaTitulo(Clear30(ListTxt[i]),'','',-1,Color1,Color2,Alin);
                                              end;
                                            Finally ListTxt.Free;
                                            end;

												  end
                                 else begin Texto:=FSG.Cells[SG.LeftCol,RowNum];
                                            IsAligned(Texto,Alin);
                                            PreTexto:=''; PostTexto:='';
                                            if (TIndex<>-1) then begin PreTexto:='<A NAME="A'+IntToStr(TIndex+1)+'"><A HREF="#A0">';
                                                                       PostTexto:='</A></A>';
                                                                 end;
                                            //H.AddTableRowTitle(Texto,-1,Color1,Color2,Alin);
                                            AgregaTitulo(Texto,PreTexto,PostTexto,-1,Color1,Color2,Alin);
                                      end;
                           end
                      else
                      begin H.OpenTableRow;
                            For i:=FSG.LeftCol to FSG.ColCount-1 do
                            begin if Columnas[i-FStart]=nil
                                  then Alin:=TcLeft
                                  else begin Alin:=Columnas[i-FStart].Align;
                                             //Columna:=Columnas[Col-FStart];
                                       end;
                                  Texto:=FSG.Cells[i,RowNum];
                                  IsAligned(Texto,Alin);
                                  H.AddTableColValue( Clear30(Texto),'','',-1,-1
                                                     ,Cien(FSG.ColWidths[i],Ancho)
                                                     ,Color1,Color2,Alin,-1);
                            end;
                            H.CloseTableRow;
                      end;


                 end;
            MoreData:=(RowNum<=(FSG.RowCount-1));
      end;
      if ExtraInfo<>'' then H.Print('<A NAME="A0">'+ExtraInfo+'</A>');
      H.CloseTable;

 Finally Result:=H.GetBodyText;
         H.Free; //Clear;
 end;

end;



Function TSGCtrl.GetFileExcel:String;
var H:TStringList;
    i,ColN,Ancho,RowNum:Integer;
    MoreData:Boolean;
    Alin,MainAlin:TColAlign;
    Tit:Boolean;
    Color1,Color2:TColor;
    Texto,InfoColor,Tipo,Tipo1:String;
    ListTxt, ListTam, ListCol :TStringList;

    ExtraInfo:String;
    ExtraInicio:Integer;
    TIndex:Integer;
	 PreTexto,PostTexto:String;

    StrLinea:String;

Procedure AgregaTitulo(Texto:String; PreText,PostText:String; Dato1:Integer; Color1,Color2:Tcolor; Alin:TColAlign);
var ListTxt, ListTam, ListCol :TStringList;
    i:Integer;
    Al:TColAlign;
    AuxLinea:string;
begin if IsTabInside(Texto,ListTxt, ListTam, ListCol ,Alin,Self)
      then begin //H.OpenRowTable(Color2);
                 AuxLinea:='';
                 if Alin=TcRight
                 then begin For i:=1 to ColN-ListTxt.Count do
                            begin AuxLinea:=AuxLinea+#09;
                            end;
                      end;
                 For i:=0 to ListTxt.Count-1 do
                 begin Al:=Alin;
                       IsAligned(ListTxt.Strings[i],Alin);
                       //if (ListTxt.Strings[i]='') then ListTxt.Strings[i]:=KO_Espacio;
                       AuxLinea:=AuxLinea+Remplaza9(Remplaza13(ListTxt.Strings[i],' '),' ')+#09;
                       {
                       H.AddTableColValue(Clear30(ListTxt.Strings[i]),PreText,PostText,-1,-1
                                                     ,Cien(StrToInt(ListTam.Strings[i]),Ancho)
                                                     ,Color1,Color2,Alin,-1);
                                                     //StrToInt(ListCol.Strings[i]));
                       }
							  //H.AddHtml('</TD>');
                        PreText:='';
                       PostText:='';
                 end;
                 {H.CloseRowTable;}
                 H.Add(AuxLinea);
           end
      else begin {H.AddTableRowTitle(Texto,PreText,PostText,-1,Color1,Color2,Alin);}
                 AuxLinea:='';
                 if Alin=TcRight
                 then begin For i:=1 to ColN-1 do
                            begin AuxLinea:=AuxLinea+#09;
                            end;
                      end;
                 AuxLinea:=AuxLinea+Remplaza9(Remplaza13(Clear30(Texto),' '),' ');
                 H.Add(AuxLinea);
           end;
end;

begin
 Result:='';
 H:=TStringList.Create;
Try   ColN:=(FSG.ColCount-FSG.LeftCol);
      Ancho:=0;
      For i:=FSG.LeftCol to FSG.ColCount-1 do
      begin Ancho:=Ancho+FSG.ColWidths[i]
      end;
      if Ancho<=0 then Ancho:=1;
		ExtraInfo:='';
      //ExtraInicio:=H.BodyPos;
      //H.OpenTable(ColN,1,0,-1,clGray,2);
      RowNum:=-1;
      MoreData:=True;
      While (MoreData) do
      begin Inc(RowNum);
            (*
            While (FSG.Cells[kPrintCol,RowNum]='NP')and(RowNum<=(FSG.RowCount-1)) do
            begin Inc(RowNum);
            end;
            *)
            if (RowNum<=(FSG.RowCount-1))
            then begin TIndex:=TabIndex.IndexOf(IntToStr(RowNum));
                       if TIndex<>-1
                       then begin ExtraInfo:=ExtraInfo+' '+'<A HREF="#A'+IntToStr(TIndex+1)+'">'+FTab.Tabs[TIndex]+'</A>';
                            end;
                       Tit:=False;
                       InfoColor:=Trim(FSG.Cells[kFontColor,RowNum]);
                       if InfoColor<>'' then Color1:=StrToInt(InfoColor)
                                        else Color1:=clblack; //TColor
                       //Color1:=InfoColor;
                       Color2:=clwhite;
                       Tipo:=FSG.Cells[kTipoCol,RowNum];
                       Tipo1:=Copy(Tipo,1,1);
                       if (Tipo1<>'N') and (Tipo1<>'H') and (Tipo1<>'J') then begin Tit:=True; Color2:=clAmarillito; end;

                       if Tipo='H'  then begin Color2:=clAmarillito; end;
							  if (Tipo='TL') then begin Alin:=tcLeft;   Tit:=True; Color2:=clAmarillito; end;
                       if (Tipo='TR') then begin Alin:=tcRight;  Tit:=True; Color2:=clAmarillito; end;
                       if (Tipo='TC') then begin Alin:=tcCenter; Tit:=True; Color2:=clAmarillito; end;

                       if (Tipo='XL') then begin Alin:=tcLeft;   Tit:=True; Color2:=clwhite; end;
                       if (Tipo='XR') then begin Alin:=tcRight;  Tit:=True; Color2:=clwhite; end;
                       if (Tipo='XC') then begin Alin:=tcCenter; Tit:=True; Color2:=clwhite; end;


                      if Tit
                      then begin //Color2:=clAmarillito;
                                 Texto:=FSG.Cells[SG.LeftCol,RowNum];
                                 if IsMultiLine(Texto,ListTxt)
                                 then begin Try
                                              MainAlin:=Alin;
                                              For i:=0 to ListTxt.Count-1 do
                                              begin Alin:=MainAlin;
                                                    IsAligned(ListTxt[i],Alin);
                                                    //AgregaTitulo(Texto:String; Dato1:Integer; Color1,Color2:Tcolor; Alin:TColAlign);
                                                    //H.AddTableRowTitle(Clear30(Lineas[i]),-1,Color1,Color2,Alin);
                                                    AgregaTitulo(Clear30(ListTxt[i]),'','',-1,Color1,Color2,Alin);
                                              end;
                                            Finally ListTxt.Free;
                                            end;

                                      end
                                 else begin Texto:=FSG.Cells[SG.LeftCol,RowNum];
                                            IsAligned(Texto,Alin);
														  PreTexto:=''; PostTexto:='';
                                            if (TIndex<>-1) then begin PreTexto:='<A NAME="A'+IntToStr(TIndex+1)+'"><A HREF="#A0">';
                                                                       PostTexto:='</A></A>';
                                                                 end;
                                            //H.AddTableRowTitle(Texto,-1,Color1,Color2,Alin);
                                            AgregaTitulo(Texto,PreTexto,PostTexto,-1,Color1,Color2,Alin);
                                      end;
                           end
                      else
                      begin //H.OpenTableRow;
                            StrLinea:='';
                            For i:=FSG.LeftCol to FSG.ColCount-1 do
                            begin if Columnas[i-FStart]=nil
                                  then Alin:=TcLeft
                                  else begin Alin:=Columnas[i-FStart].Align;
                                             //Columna:=Columnas[Col-FStart];
                                       end;
                                  Texto:=FSG.Cells[i,RowNum];
                                  IsAligned(Texto,Alin);
                                  {
                                  H.AddTableColValue( Clear30(Texto),'','',-1,-1
                                                     ,Cien(FSG.ColWidths[i],Ancho)
                                                     ,Color1,Color2,Alin,-1);
                                  }
                                   StrLinea:=StrLinea+Remplaza9(Remplaza13(Clear30(Texto),' '),' ')+#09;
                                  end;
                            //H.CloseTableRow;
                            H.Add(StrLinea);
							 end;


                 end;
            MoreData:=(RowNum<=(FSG.RowCount-1));
      end;
      {if ExtraInfo<>'' then H.Print('<A NAME="A0">'+ExtraInfo+'</A>');}
      {H.CloseTable;}

 Finally Result:=H.Text; {GetBodyText;}
         H.Free; //Clear;
 end;

end;


Procedure TSGCtrl.EnviaExcel(Sender:TObject);
var S:String;
begin S:=GetFileExcel;
      Clipboard.AsText:=S;
end;



Procedure TSGCtrl.OnPrepareHTMLBody(Sender:TObject; Var BodyText:String);
begin BodyText:=GetHTMLBodyText;
end;

end.
