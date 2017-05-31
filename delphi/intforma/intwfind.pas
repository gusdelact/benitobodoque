unit IntWFind;
//-------------------------------------------------------------
// Sistema         :   IntWFind
// Date            :   Julio de 1997
// Fecha de Inicio :   Julio de 1997
// Función forma   :   Forma Creada Internamente
// Desarrollo por  :   Víctor Martínez Castro
// Comentarios     :   Forma Estandar
// Actualizado al  :   07 Septiembre
// ------------------------------------------------------------

interface

uses
  Forms,Windows, Graphics, Db, ExtCtrls, DBTables, StdCtrls, Grids, DBGrids, Classes,
  Controls,SysUtils, ComCtrls, dbCtrls, IniFiles, Dialogs, Messages, InterEdit;



Const FindItSQL:Boolean=False;


Type
     TArr=Array[0..20] of String;

type
  TWFindIt = class(TForm)
    Query: TQuery;
    Timer1: TTimer;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    gb1: TGroupBox;
    Panel3: TPanel;
    btSelect: TButton;
    btCancel: TButton;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    Panel5: TPanel;
    GB2: TGroupBox;
    btTodos: TButton;
    sb1: TScrollBox;
    Panel6: TPanel;
    PB1: TProgressBar;
    Label1: TLabel;
    MultiPanel: TPanel;
    MultiPanelGroup: TRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btSelectClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure wwDBGrid1DblClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btTodosClick(Sender: TObject);
    procedure MultiPanelGroupClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormHide(Sender: TObject);
  private
    { Private declarations }
    Procedure SetRefrescaCount(I:Integer);
  public
    { Public declarations }
    StrSQL:TStringList;
    EdN  :Array[0..10] of TInterEdit;
    EdR  :Array[0..10] of TInterEdit;
    LbN  :Array[0..10] of TLabel;
    LbDet:Array[0..10] of TLabel;
    EdB  :Array[0..10] of TDBText;
    LabelN:TArr;
    CampoN:TArr;
    SourceFieldsN:TArr;
    SourceFieldsCount:Integer;
    SourceDataSet:TDataSet;
    ResN:TArr;
    TipoDefN:TArr;
    DefN:TArr;
    DefCount:Integer;
    ResCount:Integer;
    TipoN:TArr;
    CasoN:TArr;
    PosLabel:TArr;
    PosLabelW:TArr;
    ParamVentana:TArr;
    CampoCount:Integer;

    FValoresDefault:String;
    FTiposValoresDefault:String;
    FWhereString:String;

    MultiModo:Integer;
    MultiTitulo:String;
    MultiLabelN:TArr;
    MultiCount:Integer;
    MultiFileN:TArr;
    MultiResN:TArr;
//    CampoResultado:String;
    Tabla:String;
    Campos:String;
    SubSetCampos:String;
    SubSetTablas:String;
    SubSetWhere:String;
    Resultado:string;
    SessionName:String;
    DataBaseName:String;
    SeguSessionName:String;
    SeguDataBaseName:String;
    Refresca:Boolean;
    FRefrescaCount:Integer;


    CampoResultados:String;
    SourceFields:String;
//  TipoDatoDefault:String;
//  DatoDefault:String;

    Distinct:Boolean;
    IsDatoDefault:Boolean;
    ShowAll:Boolean;
    TempShowAll:Boolean;

    FGroupQuery:Boolean;
    FHavingString:String;

    FFastVal:String;
    FFastField:String;
    FFastWait:Boolean;
    FFastAutoSelect:Boolean;

    ShowDetail:Boolean;
    CamposOrderBy:String;
    ModoCaso:Integer;
    FMainPath:String;
    Fun1:String;
    Fun2:String;
    Fun3:String;
    Procedure ReQuery;
    procedure CambioEdit(Sender: TObject);
    procedure CambioTab(Sender: TObject);
    Function SetCampoResultado:String;
    Procedure AsignaResultado;
    Property RefrescaCount:Integer Read FRefrescaCount Write SetRefrescaCount;
    procedure CambioKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    Function LoadIt(I:Integer; ShowForm:Boolean):Boolean;
    Procedure DestruyeObjetos;
    Procedure CierraQuery;
  end;



var
  WFindIt: TWFindIt;

Function Findit(ParamVentana,
                Campos,Labels,Tipos,Casos,Posiciones,
                Tabla,CamposResultado,
                CamposOrderBy,
                SubSetCampos,SubSetTablas,SubSetWhere,
                DatoDefault,TipoDatoDefault,
                DataBaseName:string; SessionName:String; ShowAll:Boolean):String;

Function FinditAuto(ParamVentana,
                    Campos,Labels,Tipos,Casos,Posiciones,
                    Tabla,CamposResultado,
                    CamposOrderBy,
                    SubSetCampos,SubSetTablas,SubSetWhere,
                    DatoDefault,TipoDatoDefault,
                    DataBaseName:string; SessionName:String; ShowAll:Boolean;
                    DataSet:TDataSet; SourceFields:String;
                    ModoCaso:Integer; GroupQuery:Boolean; HavingString:String;
                    Distinct:Boolean):String;

Function FindForMe(FileName,CampoResultados:String;
                   ValoresDefault:String;
                   TiposValoresDefault:String;
                   DataSet:TDataSet; SourceFields:String;
                   DataBaseName:string; SessionName:String;
                   WhereString:String;
                   GroupQuery:Boolean;
                   HavingString:String;
                   eShowAll:Boolean; StrSQL:TStringList;
                   eFastVal:String;
                   eFastField:String;
                   eFastWait:Boolean;
                   eFastAutoSelect:Boolean):String;

Function InternalFindForMe(FileName,CampoResultados:String;
                   ValoresDefault:String;
                   TiposValoresDefault:String;
                   DataSet:TDataSet; SourceFields:String;
                   DataBaseName:string; SessionName:String;
                   SeguDataBaseName:string; SeguSessionName:String;
                   WhereString:String;
                   GroupQuery:Boolean;
                   HavingString:String;
                   eShowAll:Boolean; StrSQL:TStringList;
                   eFastVal:String;
                   eFastField:String;
                   eFastWait:Boolean;
                   eFastAutoSelect:Boolean):String;



Procedure SeparaCampos(S:String; Var L:TArr; Var N:Integer; Separador:Char);

Function GField(S:String; Modo:Integer):String;

Function FieldIt(S:String; I:Integer):String;

Function ParamIt(Origen:String; Add:String):String;

Function SeparaNombres(S:String):String;

implementation

Uses UnSubGen;

//Uses UnSQL2;
{$R *.DFM}

Procedure ADDSQL(Var SS:String; Add:String);
begin if SS='' then SS:=ADD else if ADD<>'' then SS:=SS+' and '+ADD;
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


Procedure TWFindIt.SetRefrescaCount(I:Integer);
begin PB1.Position:=RefrescaCount;
      FRefrescaCount:=I;
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

Function ParamIt(Origen:String; Add:String):String;
begin if Origen=''
      then ParamIt:=Add
      else if Add<>'' then ParamIt:=Origen+#30+Add
                      else ParamIt:=Origen;
end;


Procedure SeparaCampos(S:String; Var L:TArr; Var N:Integer; Separador:Char);
var rs:string;
    i:Integer;
    EnParen:Boolean;
    ParentCount:Integer;
begin N:=-1;
      EnParen:=False;
      rs:='';
      ParentCount:=0;
      for i:=1 to Length(S) do
      begin if (S[i]='(')
            then begin Inc(ParentCount); Rs:=Rs+S[i];
                 end
            else begin if ParentCount>0 then
                          begin if S[i]=')' then begin Dec(ParentCount);
                                                       Rs:=Rs+S[i];
                                                 end
                                else Rs:=Rs+S[i];
                          end
                       else
                       if (S[i]=Separador) then begin
                                       //if RS<>'' then
                                       begin Inc(N);
                                             L[N]:=Rs;
                                             Rs:='' ;
                                       end;
                              end
                         else Rs:=Rs+S[i];
                 end;
      end;
      if Rs<>'' then begin Inc(N); L[N]:=Rs; end;
end;

Function GField(S:String; Modo:Integer):String;
var i:Integer;
begin S:=UpperCase(S);
      i:=Pos(' AS ',S);
      if i>0 then
         begin if Modo=0 then
               begin GField:=Trim(Copy(S,i+4,Length(S)));
               end
               else
               if Modo=10 then
               begin GField:=GField(Trim(Copy(S,1,i-1)),10);
               end
               else
               begin GField:=Trim(Copy(S,1,i-1));
               end;
         end
     else begin IF modo=0 then
                begin
                  i:=Pos('.',S);
                  if i>0 then
                  begin GField:=Trim(Copy(S,i+1,Length(S)));
                  end
                  else GField:=Trim(S);
                end
                else if Modo=10 then
                     begin i:=Pos('.',S);
                           if i>0 then
                           begin GField:=Trim(Copy(S,i+1,Length(S)));
                           end
                           else GField:=Trim(S);
                     end
                else GField:=Trim(S);
          end;
end;


Function SeparaNombres(S:String):String;
var L:TArr;
    N,i,j:Integer;
    Sal:String;
    Ent:String;
begin  SeparaCampos(S,L,N,',');
       Sal:='';
       For i:=0 to N do
       begin Ent:=GField(L[i],10);
             For j:=0 to i-1 do
             begin if Trim(L[J])=Trim(Ent) then begin L[i]:=''; ent:=''; end;
             end;
       end;
       For i:=0 to N do
       begin if L[i]<>'' then
             begin if Sal<>'' then Sal:=Sal+','+GField(L[i],10)
                              else Sal:=GField(L[i],10);
             end;
       end;
       SeparaNombres:=Sal;
end;


Function CamposSinGato(S:String):string;
var S1,S2:String;
i:integer;
begin S2:=''; S1:='';
      for i:=0 to Length(S) do
      begin if (S[i]=',')
            then begin if S1<>''
                       then begin
                            end
                       else begin S2:=S2+S1;
                            end;
                 end
            else begin S1:=S1+S[i];
                 end
      end;
end;


Function ValStr(S:String):Integer;
var L:LongInt; Err:Integer;
begin Val(S,L,Err);
      if (Err<>0)or(S='')
         then ValStr:=0
         else ValStr:=L;
end;

Function ValStrDef(S:String; Def:Integer):Integer;
var L:LongInt; Err:Integer;
begin Val(S,L,Err);
      if (Err<>0)or(S='')
         then ValStrDef:=Def
         else ValStrDef:=L;
end;


procedure TWFindIt.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action:=CaFree;
end;

Function Findit(ParamVentana,Campos,Labels,Tipos,Casos,Posiciones,Tabla,CamposResultado,
                CamposOrderBy,SubSetCampos,SubSetTablas,SubSetWhere,DatoDefault,TipoDatoDefault,DataBaseName:string;
                SessionName:String;
                ShowAll:Boolean):String;
var F:TWFindIt;
    Aux:Integer;
    AuxAlto:Integer;
begin FindIt:='';
      if Campos='' then exit;
      Application.CreateForm(TWFindIt,F);
      SeparaCampos(Campos,F.CampoN,F.CampoCount,',');
      SeparaCampos(Labels,F.LabelN,Aux,',');
      SeparaCampos(Tipos,F.TipoN,Aux,',');
      SeparaCampos(Casos,F.CasoN,Aux,',');
      SeparaCampos(CamposResultado,F.ResN,F.ResCount,',');
      SeparaCampos(DatoDefault,F.DefN,F.DefCount,',');
      SeparaCampos(TipoDatoDefault,F.TipoDefN,Aux,',');
      SeparaCampos(Posiciones,F.PosLabel,Aux,',');
      SeparaCampos(ParamVentana,F.ParamVentana,Aux,',');
      F.Caption:=F.ParamVentana[0];
      F.ShowDetail:=False;
      F.Label1.Caption:='';
      F.SourceDataSet:=nil;
      AuxAlto:=0;
      if ValStr(F.ParamVentana[1])<>0 then
         begin F.Width:=ValStr(F.ParamVentana[1]);
         end;
      if ValStr(F.ParamVentana[3])<>0 then
         begin AuxAlto:=ValStr(F.ParamVentana[3]);
         end;
      if Pos('SHOW_DETAIL',F.ParamVentana[2])<>0 then
         begin F.Panel5.Visible:=True;
               F.Height:=F.Panel1.Height+F.Panel2.Height+AuxAlto;
               F.ShowDetail:=True;
         end;

      if (ValStr(F.ParamVentana[4])<>0)
     and (ValStr(F.ParamVentana[5])<>0) then
         begin F.Left:=ValStr(F.ParamVentana[4]);
               F.Top:=ValStr(F.ParamVentana[5]);
         end
      else begin F.Left:=(Screen.Width-F.Width) div 2;
                 F.Top:=(Screen.Height-F.Height) div 2;
           end;
      F.ShowAll:=ShowAll;
      F.Campos:=Campos;
      F.CamposOrderBy:=CamposOrderBy;
      F.Tabla:=Tabla;
      F.DBGrid1.Columns[0].Width:=F.DBGrid1.Width-1;
//      F.DatoDefault:=DatoDefault;
      F.IsDatoDefault:=(Trim(DatoDefault)<>'');
//      F.TipoDatoDefault:=TipoDatoDefault;
      F.SubSetCampos:=SubSetCampos;
      F.SubSetTablas:=SubSetTablas;
      F.SubSetWhere:=SubSetWhere;
//      F.CamposResultado:=CamposResultado;
      F.DataBaseName:=DataBaseName;
      F.SessionName:=SessionName;
      F.SeguDataBaseName:=DataBaseName;
      F.SeguSessionName:=SessionName;
      if F.ShowModal=mrOK
         then FindIt:=F.Resultado;
      F.Free;
end;

Function FinditAuto(ParamVentana,Campos,Labels,Tipos,Casos,Posiciones,Tabla,CamposResultado,
                CamposOrderBy,SubSetCampos,SubSetTablas,SubSetWhere,DatoDefault,TipoDatoDefault,DataBaseName:string;
                SessionName:String;
                ShowAll:Boolean; DataSet:TDataSet; SourceFields:String;
                ModoCaso:Integer; GroupQuery:Boolean; HavingString:String;
                Distinct:Boolean):String;
var F:TWFindIt;
    Aux:Integer;
    AuxAlto:Integer;
begin FindItAuto:='';
      if Campos='' then exit;
      Application.CreateForm(TWFindIt,F);
      SeparaCampos(Campos,F.CampoN,F.CampoCount,',');
      SeparaCampos(Labels,F.LabelN,Aux,',');
      SeparaCampos(Tipos,F.TipoN,Aux,',');
      SeparaCampos(Casos,F.CasoN,Aux,',');
      SeparaCampos(CamposResultado,F.ResN,F.ResCount,',');
      SeparaCampos(DatoDefault,F.DefN,F.DefCount,#30);
      SeparaCampos(TipoDatoDefault,F.TipoDefN,Aux,',');
      SeparaCampos(Posiciones,F.PosLabel,Aux,',');
      SeparaCampos(ParamVentana,F.ParamVentana,Aux,',');
      SeparaCampos(SourceFields,F.SourceFieldsN,F.SourceFieldsCount,',');
      F.FGroupQuery:=GroupQuery;
      F.FHavingString:=HavingString;
      F.Distinct:=Distinct;
      F.Caption:=F.ParamVentana[0];
      F.ShowDetail:=False;
      F.Label1.Caption:='';
      F.SourceDataSet:=DataSet;
      AuxAlto:=0;
      if ValStr(F.ParamVentana[1])<>0 then
         begin F.Width:=ValStr(F.ParamVentana[1]);
         end;
      if ValStr(F.ParamVentana[3])<>0 then
         begin AuxAlto:=ValStr(F.ParamVentana[3]);
         end;
      if Pos('SHOW_DETAIL',F.ParamVentana[2])<>0 then
         begin F.Panel5.Visible:=True;
               F.Height:=F.Panel1.Height+F.Panel2.Height+AuxAlto;
               F.ShowDetail:=True;
         end;

      if (ValStr(F.ParamVentana[4])<>0)
     and (ValStr(F.ParamVentana[5])<>0) then
         begin F.Left:=ValStr(F.ParamVentana[4]);
               F.Top:=ValStr(F.ParamVentana[5]);
         end
      else begin F.Left:=(Screen.Width-F.Width) div 2;
                 F.Top:=(Screen.Height-F.Height) div 2;
           end;
      F.ModoCaso:=ModoCaso;
      F.ShowAll:=ShowAll;
      F.Campos:=Campos;
      F.CamposOrderBy:=CamposOrderBy;
      F.Tabla:=Tabla;
      F.DBGrid1.Columns[0].Width:=F.DBGrid1.Width-1;
//      F.DatoDefault:=DatoDefault;
      F.IsDatoDefault:=(Trim(DatoDefault)<>'') or (F.SourceDataSet<>nil);

//      F.TipoDatoDefault:=TipoDatoDefault;
      F.SubSetCampos:=SubSetCampos;
      F.SubSetTablas:=SubSetTablas;
      F.SubSetWhere:=SubSetWhere;
//      F.CamposResultado:=CamposResultado;
      F.DataBaseName:=DataBaseName;
      F.SessionName:=SessionName;
      F.SeguDataBaseName:=DataBaseName;
      F.SeguSessionName:=SessionName;
      if F.ShowModal=mrOK
         then FindItAuto:=F.Resultado;
      F.Free;
end;

procedure TWFindIt.FormShow(Sender: TObject);
var I:Integer;
    T:Integer;
    Desp:Integer;
    Ancho:Integer;
    HAsFocus:Boolean;
    TieneRango:Boolean;
    NNCampo,Err:Integer;

begin Refresca:=False;
      HAsFocus:=False;
      RefrescaCount:=0;
      CierraQuery;
      Query.DataBaseName:=DataBaseName;
      Query.SessionName:=SessionName;
      TieneRango:=False;

      NNCampo:=-1;
      Val(FFastField,NNCampo,Err);
      if (Err<>0)or(FFastField='') then NNCampo:=-1;
      For i:=0 to CampoCount do
      begin if NNCampo=-1
            then begin if Trim(UpperCase(FFastField))=Trim(UpperCase(GField(CampoN[i],0)))
                       then NNCampo:=i;
                 end;
      end;

      if PosLabel[0]=''
         then T:=Round((gb1.width-16)/(CampoCount+1))
         else T:=-1;
      Ancho:=T;
      Desp:=0;
      for i:=0 to CampoCount do
      begin EdN[i]:=TInterEdit.Create(Self);
            EdN[i].TipoReader:=trTexto;
            EdN[i].MaxLength:=0;
            if Pos('C',CasoN[i])>0 then EdN[i].TipoReader:=trContrato;
            if Pos('M',CasoN[i])>0 then EdN[i].CharCase:=ecUpperCase;
            if Pos('H',CasoN[i])=0 then
            BEGIN
            if T<>-1 then Desp:=i*T
                     else begin if ValStr(PosLabel[i])=-1
                                   then Ancho:=(gb1.width-16)-Desp
                                   else Ancho:=ValStr(PosLabel[i])*Canvas.TextWidth('M');
                          end;
            END
            ELSE begin EdN[i].Visible:=False;
                 end;

            PosLabelW[i]:=IntToStr(Ancho div Canvas.TextWidth('M'));
            EdN[i].SetBounds(8+Desp,32,Ancho,21);
            EdN[i].Parent:=GB1;
            EdN[i].OnChange:=CambioEdit;
            EdN[i].OnExit:=CambioTab;
            EdN[i].OnKeyDown:=CambioKeyDown;

            if (Pos('R',CasoN[i])>0) and(EdN[i].Visible)
            then begin EdR[i]:=TInterEdit.Create(Self);
                       EdR[i].MaxLength:=0;
                       if Pos('M',CasoN[i])>0 then EdR[i].CharCase:=ecUpperCase;
                       EdR[i].SetBounds(8+Desp,32+24,Ancho,21);
                       EdR[i].Parent:=GB1;
                       EdR[i].OnChange:=CambioEdit;
//                     EdN[i].OnEnter:=CambioEdit;
                       EdR[i].OnExit:=CambioTab;
                       EdR[i].OnKeyDown:=CambioKeyDown;
                       TieneRango:=True;
                 end;
            LBN[i]:=TLabel.Create(Self);
            LbN[I].SetBounds(10+Desp,16,Ancho,21);
            LbN[i].Parent:=GB1;
            LbN[i].Caption:=LabelN[I];
            if Pos('H',CasoN[i])>0 then LbN[i].Visible:=False;
            if (Pos('CAMPORESULTADO',CampoN[i])=0) and (ShowDetail)
               then begin EDB[i]:=TDBText.Create(Self);
                          EDB[i].SetBounds(8+8,4+I*(32)+15,gb1.width-24,16);
                          EDB[i].Parent:=sb1;
                          EDB[i].DataSource:=DataSource1;
                          EDB[i].DataField:=GField(CampoN[I],0);
                          LbDet[i]:=TLabel.Create(Self);
                          LbDet[i].SetBounds(8,4+I*(32),100,15);
                          LbDet[i].Caption:=LabelN[I];
                          LbDet[i].Parent:=sb1;
                    end;
            if (Not HasFocus)and(EdN[i].Visible)
               then begin if (NNCampo<>-1)
                          then begin if NNCampo=i then
                                     begin EdN[i].SetFocus;
                                           EdN[i].Text:=FFastVal;
                                           EdN[i].SelStart:=Length(FFastVal);
                                           EdN[i].SelLength:=0;
                                           HasFocus:=True;
                                     end;
                               end
                          else begin EdN[i].SetFocus;
                                     HasFocus:=True;
                               end;
                    end;
            if EdN[i].Visible then Desp:=Desp+Ancho;
            //Query.
      end;
      if TieneRango then
      begin DBGrid1.Top:=32;
      end
      else
      begin DBGrid1.Top:=0;
      end;
      if (Not FFastWait) then
         begin IsDatoDefault:=False;
         end;
      if (ShowAll)or(IsDatoDefault)or(Not FFastWait) then ReQuery;
      if (Not FFastWait) then
         begin Refresca:=False;
               RefrescaCount:=0;
         end;
//      if eFastWait=False then ReQuery;
end;

procedure TWFindIt.btSelectClick(Sender: TObject);
begin Refresca:=False;
      RefrescaCount:=0;
      if Not (Query.IsEmpty)
         then begin AsignaResultado;
                    ModalResult:=mrOK;
              end;
end;

procedure TWFindIt.btCancelClick(Sender: TObject);
var i:Integer;
begin Refresca:=False;
      RefrescaCount:=0;
      Resultado:='';
      if DefCount>=0
      then begin Resultado:='';
                 for i:=0 to DefCount do
                 begin if Resultado<>''
                       then Resultado:=DefN[i]
                       else Resultado:=Resultado+#30+DefN[i];
                 end;
           end;
      ModalResult:=mrCancel;
end;

procedure TWFindIt.wwDBGrid1DblClick(Sender: TObject);
begin btSelectClick(Sender);
end;

Function TWFindIt.SetCampoResultado:String;
var s:string;
    i:Integer;
begin S:='';
      for i:=0 to ResCount do
      begin if S='' then S:=S+ResN[I]+' AS CAMPORESULTADO'+IntToStr(i)
                    else S:=S+', '+ResN[I]+' AS CAMPORESULTADO'+IntToStr(i)
      end;
      SetCampoResultado:=S;
end;

Procedure TWFindIt.AsignaResultado;
var i:Integer;
    S:String;
begin Resultado:='';
      for i:=0 to ResCount do
      begin if Resultado=''
            then Resultado:=Query.FieldByName('CAMPORESULTADO'+IntToStr(i)).AsString
            else Resultado:=Resultado+#30+Query.FieldByName('CAMPORESULTADO'+IntToStr(i)).AsString;
      end;
      if (SourceDataSet<>nil) then
         begin if SourceDataSet.State in [dsEdit,dsInsert] then
               begin if (ModoCaso=1)OR(ModoCaso=0) then
                     begin for i:=0 to SourceFieldsCount do
                           begin
                           if (SourceFieldsN[i]<>'') then
                           begin SourceDataSet.FieldByName(SourceFieldsN[i]).AsString:=
                                 Query.FieldByName('CAMPORESULTADO'+IntToStr(i)).AsString;
                           end;
                           end;
                     end;
               end
          else begin if (ModoCaso=2)and(SourceDataSet is TTable) then
                     begin S:='';
                           for i:=0 to SourceFieldsCount do
                           begin  if (SourceFieldsN[i]<>'') then
                                  begin AddSQL(S,'('+SourceFieldsN[i]+'='+#39+Query.FieldByName('CAMPORESULTADO'+IntToStr(i)).AsString+#39+')');
//                                        SourceDataSet.FieldByName(SourceFieldsN[i]).AsString:=
//                                        Query.FieldByName('CAMPORESULTADO'+IntToStr(i)).AsString;
                                  end;
                           end;
                           TTable(SourceDataSet).Filter:=S;
                     end;
               end;
         end;
end;

Function NumDef(S:String; Def:Integer):LongInt;
var s1:string; Err:Integer; V:Integer;
    i:Integer;
begin NumDef:=Def;
      s1:='';
      for i:=1 to length(s) do
      if S[i] in ['0'..'9']
       then begin S1:=S1+S[i];
            end;
      if (S1='')
         then exit
         else begin Val(S1,V,Err);
                    if Err<>0 then Exit else NumDef:=V;
              end;
end;


Procedure TWFindIt.ReQuery;
Var S,SL,SR,SE,SQL1,SQL,
    RanS,RanSL,RanSR,RanSE,RanSQL1,RanSQL:String;
    i:Integer;
    DT:TDateTime;

    ST1:String;
    SL1:Integer;

//    L:Integer;
begin SQL:=''; SQL1:='';
      if IsDatoDefault
         then begin if (SourceDataSet<>nil) then
                       begin if (Not SourceDataSet.IsEmpty) then
                             begin
                               for i:=0 to SourceFieldsCount do
                               begin if (SourceFieldsN[i]<>'')and (Not SourceDataSet.FieldByName(SourceFieldsN[i]).IsNull)
                                     then
                                     begin S:=UpperCase(SourceFieldsN[i]);
                                           Case SourceDataSet.FieldByName(SourceFieldsN[i]).DataType of
                         ftString,ftMemo,ftDate:S:='('+GField(ResN[i],1)+'='+#39+SourceDataSet.FieldByName(SourceFieldsN[i]).AsString+#39+')'
                                           else S:='('+GField(ResN[i],1)+'='+SourceDataSet.FieldByName(SourceFieldsN[i]).AsString+')';
                                           end;
                                           AddSQL(SQL,S);
                                      end;
                                end;
                                IsDatoDefault:=False;
                              end;
                       end            //SysUtils
                    else
                    for i:=0 to DefCount do
                    begin if (DefN[i]<>'') then
                          begin
                          S:=UpperCase(DefN[i]);
                          if S<>'NULL' then S:=#39+DefN[i]+#39;
                          if TipoDefN[i]='S'
                          then SQL1:='('+GField(ResN[i],1)+'='+S+')'
                          else if TipoDefN[i]='D'
                               then begin Try DT:=StrToDate(S);
                                          Except DT:=0;
                                          end;
                                          if DT<>0
                                          then SQL1:='('+GField(ResN[i],1)+'= TO_DATE(''DD/MM/YYYY'','''+FormatDateTime(ToFecha,DT)+''') )';
                                    end
                               else if TipoDefN[i]='DT'
                                    then begin Try DT:=StrToDateTime(S);
                                               Except DT:=0;
                                               end;
                                               if DT<>0
                                               then SQL1:='('+GField(ResN[i],1)+'= TO_DATE(''DD/MM/YYYY HH24:MI:SS'','''+FormatDateTime(ToFechaHora,DT)+''') )';
                                         end
                                    else begin SQL1:='('+GField(ResN[i],1)+'='+DefN[i]+')';
                                         end;
                          IsDatoDefault:=False;
                          AddSQL(SQL,SQL1);
                          end;

                    end;
              end
         else
      for i:=0 to CampoCount do
      begin EdN[i].ActualizaTexto;
            ST1:=EdN[i].Text;
            SL1:=Length(EdN[i].Text);
            if ((ST1<>'')and (SL1>=NumDef(CasoN[i],2))  ) //OR (ShowAll)
               then begin EdN[i].Font.Color:=clNavy;
                          S:=ST1;
                          if Pos('=',CasoN[i])>0
                             then begin if TipoN[i]='I'
                                        then begin SL:='';  SR:='';  end
                                        else begin SL:=#39; SR:=#39; end;
                                        SE:=' = '
                                  end
                        else begin SE:=' LIKE ';
                                   //if TipoN[i]='I'
                                   //   then begin SL:='';  SR:='';  end
                                   //   else
                                           begin if Pos('&',CasoN[i])>0
                                                 then begin SL:=#39; SR:='%'+#39; end
                                                 else begin SL:=#39+'%'; SR:='%'+#39; end;
                                           end;
                             end;
                          S:='('+GField(CampoN[i],1)+SE+SL+S+SR+')';

                          if (Pos('R',CasoN[i])>0)and(EdR[i].Text<>'') then
                          begin  RanS:=EdR[i].Text;
                                 if Pos('=',CasoN[i])>0
                                 then begin if TipoN[i]='I'
                                            then begin RanSL:='';  RanSR:='';  end
                                            else begin RanSL:=#39; RanSR:=#39; end;
                                            Se:=' >= ';
                                            RanSE:=' <= ';
                                      end
                                 else begin RanSE:=' <= ';
                                            Se:=' >= ';
                                            if TipoN[i]='I'
                                            then begin RanSL:='';  RanSR:='';  end
                                            else begin if Pos('&',CasoN[i])>0
                                                       then begin RanSL:=#39; RanSR:='%'+#39; end
                                                       else begin RanSL:=#39+'%'; RanSR:='%'+#39; end;
                                                 end;
                                      end;
                                 S:=EdN[i].Text;
                                 S:='('+GField(CampoN[i],1)+SE+SL+S+SR+') AND ('+GField(CampoN[i],1)+RanSE+RanSL+RanS+RanSR+')';
                          end;

                          AddSQL(SQL,S);
                    end
            else EdN[i].Font.Color:=clWindowText;
      end;
      if TempShowAll
         then BEGIN SQL:='';
                    AddSQL(sql,SubSetWhere)
              END
         else if (SQL='')and(ShowAll=False) then
              begin Label1.Caption:='Requiere más Caracteres para Iniciar la Buscar!!!';
                    CierraQuery;
                    exit;
              end;
      Label1.Caption:='';
      AddSQL(SQL,SubSetWhere);
      if Distinct
      then SQL1:='SELECT DISTINCT '
      else SQL1:='SELECT ';
      SQL1:=SQL1+Campos+','+SubSetCampos+' '+SetCampoResultado
            +' from '+Tabla+' ';
      if SubSetTablas<>'' then SQL1:=SQL1+','+SubSetTablas;

      Query.DisableControls;
      Label1.Caption:='Buscando Espere...';
      CursorEspera;
      Try
      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add(SQL1);
      if SQL<>'' then Query.SQL.Add(' WHERE '+SQL);
      if FGroupQuery then
      begin Query.SQL.Add(' GROUP By '+SeparaNombres(Campos+','+SubSetCampos+' '+SetCampoResultado));
            if FHavingString<>''
            then Query.SQL.Add(' HAVING '+FHavingString);
      end;
      if CamposOrderBy<>'' then Query.SQL.Add(' ORDER BY '+CamposOrderBy);

      if StrSQL<>nil then StrSQL.Assign(Query.SQL);
      Query.Open;
      //L:=1;
      for i:=0 to Query.FieldCount-1 do
      begin if (Pos('$',CasoN[i])>0) then
            begin if (Query.Fields[i] Is TFloatField)  then
                     with TFloatField(Query.Fields[i]) do
                     begin Currency:=True;
                     end;
                  if (Query.Fields[i] Is TFloatField)  then
                  with TCurrencyField(Query.Fields[i]) do
                     begin Currency:=True;
                     end;
            end;

            Query.Fields[i].DisplayLabel:=LabelN[i];
            Query.Fields[i].DisplayWidth:=Round(ValStr(PosLabelW[i])*1.4);
            //DBGrid1.Columns[L].Width:=100;
            if (Pos('CAMPORESULTADO',Query.Fields[i].FieldName)>0) or (Pos('G',CasoN[i])>0)
               then begin Query.Fields[i].Visible:=False;
                    end
               else begin //Inc(L);
                    end;
      end;
      Finally
      Query.EnableControls;
      CursorNormal;
      if Query.IsEmpty
         then Label1.Caption:='Listo, No se encontró Información.'
         else Label1.Caption:='Listo.';
      end;
      TempShowAll:=False;
end;

procedure TWFindIt.Timer1Timer(Sender: TObject);
begin Timer1.Enabled:=False;
      if Refresca
         then begin RefrescaCount:=RefrescaCount+1 end;
      if RefrescaCount>=10
         then begin ReQuery;
                    Refresca:=False;
                    RefrescaCount:=0;
                    Exit;
              end;
      Timer1.Enabled:=True;
end;

procedure TWFindIt.CambioEdit(Sender: TObject);
begin Refresca:=True;
      RefrescaCount:=0;
      Timer1.Enabled:=True;
end;

procedure TWFindIt.CambioTab(Sender: TObject);
begin if Refresca then
      begin RefrescaCount:=0;
      end;
end;


procedure TWFindIt.CambioKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin if (Key=vk_up)and(Query.Active) then begin Key:=0; Query.Prior; end;
      if (Key=vk_down)and(Query.Active) then begin Key:=0; Query.Next; end;
end;

procedure TWFindIt.DataSource1DataChange(Sender: TObject; Field: TField);
begin if Field=nil
         then begin btSelect.Enabled:=Not Query.IsEmpty;
              end;

end;

procedure TWFindIt.DBGrid1DblClick(Sender: TObject);
begin if btSelect.Enabled then btSelectClick(Sender);
end;


procedure TWFindIt.btTodosClick(Sender: TObject);
begin TempShowAll:=True;
      Refresca:=False;
      RefrescaCount:=0;
      ReQuery;
end;


 // Uses UnFindit;  Agregar esta Unidad

Function TWFindIt.LoadIt(I:Integer; ShowForm:Boolean):Boolean;
Var S,eFileName:String;
    Aux:Integer;
    Ini:TBaseIniFile;
begin LoadIt:=False;
//    ShowDetail:=False;
      Label1.Caption:='';
      eFileName:=MultiFileN[i];
if Not FindItSQL then
begin
      eFileName:=FMainPath+MultiFileN[i];
      if Not LocalizaArchivo(eFileName,'FindIt\')
         then begin
              eFileName:=MultiFileN[i];
              if Not LocalizaArchivo(eFileName,'FindIt\') then
              begin MessageDlg('Imposible Localizar el Archivo'+eFileName,mtError,[mbOK],0);
                    Resultado:='';
                    PostMessage(Handle,WM_CLOSE,0,0);
                    ModalResult:=mrCancel;
                    Exit;
              end;
              end;
      Ini:=TBaseIniFile.Create(eFileName,SeguDataBaseName,SeguSessionName);
end
else  Ini:=TSQLIniFile.Create(eFileName,SeguDataBaseName,SeguSessionName);
      CursorEspera;
      Try
      With Ini do
      begin if ReadString('Findit','V_CAMPOS','')='' then
               begin MessageDlg('No Existen Campos en Archivo It: '+eFileName,mtError,[mbOK],0);
                     Resultado:='';
                     PostMessage(Handle,WM_CLOSE,0,0);
                     ModalResult:=mrCancel;
                     Exit;
               end;
            ShowAll:=ReadBool('Findit','SHOWALL',False);
            //F.Width:=ValStrDef(ReadString('Findit','V_ANCHO',''),F.Width);
            DBGrid1.Columns[0].Width:=DBGrid1.Width-1; // Prueba
            //AuxAlto:=ValStrDef(ReadString('Findit','DETALLE_ALTO',''),0);
            (*
            ShowDetail:=ReadBool('Findit','DETALLE_MOSTRAR',False);
            if ShowDetail then
            begin Panel5.Visible:=True;
                  //Height:=Panel1.Height+Panel2.Height+AuxAlto;
            end;
            *)
            if ReadInteger('Findit','V_CENTRADO',0)=0
               then begin //Centrar Ventana
                          Left:=(Screen.Width-Width) div 2;
                          Top:=(Screen.Height-Height) div 2;
                    end
               else begin //Utilizar Valores de Default
                          Top:=ValStr(ReadString('Findit','V_Y',''));
                          Left:=ValStr(ReadString('Findit','V_X',''));
                    end;

            //if SourceFields='' then SourceFields:=ReadString('Findit','V_DS_CAMPOS','');
            //SeparaCampos(SourceFields,F.SourceFieldsN,F.SourceFieldsCount);
            //if CampoResultados='' then CampoResultados:=ReadString('Findit','V_RESULTADOS','');
            //SeparaCampos(CampoResultados,F.ResN,F.ResCount);

            //IsDatoDefault:=(Trim(ReadString('Findit','V_DEF_VALORES',''))<>'') or (SourceDataSet<>nil);
            IsDatoDefault:=((FValoresDefault<>'') or (SourceDataSet<>nil));

            SeparaCampos(ReadString('Findit','V_CAMPOS',''),CampoN,CampoCount,',');
            SeparaCampos(ReadString('Findit','V_ETIQUETAS',''),LabelN,Aux,',');
            SeparaCampos(ReadString('Findit','V_TIPOS',''),TipoN,Aux,',');
            SeparaCampos(ReadString('Findit','V_CAPTURA',''),CasoN,Aux,',');
            SeparaCampos(ReadString('Findit','V_POSICIONES',''),PosLabel,Aux,',');

            (*
            SeparaCampos(ReadString('Findit','V_DEF_VALORES',''),DefN,DefCount);
            SeparaCampos(ReadString('Findit','V_DEF_TIPOS',''),TipoDefN,Aux);
            *)

            Fun1:=ReadString('Findit','FUN_1','');
            Fun2:=ReadString('Findit','FUN_2','');
            Fun3:=ReadString('Findit','FUN_3','');

            Distinct:=ReadBool('Findit','DISTINCT',False);

            (*
            F.MultiModo:=ReadInteger('Findit','MULTI_MODO',0);
            F.MultiTitulo:=ReadString('Findit','MULTI_TITULO','');
            SeparaCampos(ReadString('Findit','MULTI_ETIQUETAS',''),F.MultiLabelN,F.MultiCount);
            SeparaCampos(ReadString('Findit','MULTI_ARCHIVOS',''),F.MultiFileN,Aux);
            SeparaCampos(ReadString('Findit','MULTI_RESULTADOS',''),F.MultiResN,Aux);
            *)

            Tabla:=ReadString('Findit','V_TABLA','');
            Campos:=ReadString('Findit','V_CAMPOS','');
            ModoCaso:=ReadInteger('Findit','MODO',0);
            SubSetCampos:=ReadString('Findit','V_ADD_CAMPOS','');
            SubSetTablas:=ReadString('Findit','V_ADD_TABLAS','');
            if FWhereString=''
               then SubSetWhere:=ReadString('Findit','V_ADD_WHERE','')
               else begin S:=FWhereString;
                          AddSQL(S,ReadString('Findit','V_ADD_WHERE',''));
                          SubSetWhere:=S;
                    end;
            CamposOrderBy:=ReadString('Findit','V_ORDERBY','');
      end;
      Finally Ini.Free;
              CursorNormal;
      end;
      DestruyeObjetos;
      if (ShowForm)and(Visible=True) then FormShow(nil);
end;

Function FindForMe(FileName,CampoResultados:String;
                   ValoresDefault:String;
                   TiposValoresDefault:String;
                   DataSet:TDataSet;
                   SourceFields:String; DataBaseName:string; SessionName:String;
                   WhereString:String;
                   GroupQuery:Boolean;
                   HavingString:String;
                   eShowAll:Boolean;
                   StrSQL:TStringList;
                   eFastVal:String;
                   eFastField:String;
                   eFastWait:Boolean;
                   eFastAutoSelect:Boolean):String;

begin Result:=InternalFindForMe(FileName,CampoResultados,ValoresDefault,
                   TiposValoresDefault,DataSet,SourceFields,
                   DataBaseName,SessionName,
                   DataBaseName,SessionName,
                   WhereString,GroupQuery,HavingString,eShowAll,
                   StrSQL,
                   eFastVal,
                   eFastField,
                   eFastWait,
                   eFastAutoSelect);

end;



Function InternalFindForMe(FileName,CampoResultados:String;
                   ValoresDefault:String;
                   TiposValoresDefault:String;
                   DataSet:TDataSet;
                   SourceFields:String;
                   DataBaseName:string; SessionName:String;
                   SeguDataBaseName:string; SeguSessionName:String;
                   WhereString:String;
                   GroupQuery:Boolean;
                   HavingString:String;
                   eShowAll:Boolean;
                   StrSQL:TStringList;
                   eFastVal:String;
                   eFastField:String;
                   eFastWait:Boolean;
                   eFastAutoSelect:Boolean):String;
var F:TWFindIt;
    Aux:Integer;
    i:Integer;
    Ini:TBaseIniFile;
    AuxAlto:Integer;
    S,FName:String;
begin InternalFindForMe:='';
      if FileName='' then exit;
      Application.CreateForm(TWFindIt,F);
      Try

      F.FFastVal:=eFastVal;
      F.FFastField:=eFastField;
      F.FFastWait:=eFastWait;
      F.FFastAutoSelect:=eFastAutoSelect;

      F.FValoresDefault:=ValoresDefault;
      F.StrSQL:=StrSQL;
      F.FTiposValoresDefault:=TiposValoresDefault;
      F.FWhereString:=WhereString;

      F.FGroupQuery:=GroupQuery;
      F.FHavingString:=HavingString;

      F.DataBaseName:=DataBaseName;
      F.SessionName:=SessionName;
      F.SeguDataBaseName:=SeguDataBaseName;
      F.SeguSessionName:=SeguSessionName;

      F.SourceDataSet:=DataSet;
      F.CampoResultados:=CampoResultados;
      F.SourceFields:=SourceFields;
//    Edit14.Text:=ReadString('Findit','V_DS_TABLA',''); No se Utiliza
      F.ShowDetail:=False;
      F.Label1.Caption:='';
//      AuxAlto:=0;
      FName:=FileName;
      if Not FindItSQL then
      begin if Not LocalizaArchivo(FName,'FindIt\')
            then begin MessageDlg('Imposible Localizar el Archivo'+FName,mtError,[mbOK],0);
                       F.Free;
                       Exit;
                 end;
            Ini:=TBaseIniFile.Create(FName,SeguDataBaseName,SeguSessionName);
      end
      else Ini:=TSQLIniFile.Create(FName,SeguDataBaseName,SeguSessionName);

      F.FMainPath:=ExtractFilePath(FName);
      CursorEspera;
      Try
      With Ini do
      begin F.MultiModo:=ReadInteger('Findit','MULTI_MODO',0);
            if (ReadString('Findit','V_CAMPOS','')='')and(F.MultiModo=0)
               then begin MessageDlg('No Existen Campos en Archivo It: '+FileName,mtError,[mbOK],0);
                          F.Free; F:=nil;
                          Ini.Free; Ini:=nil;
                          exit;
                    end;
            F.ShowAll:=ReadBool('Findit','SHOWALL',False) or (eShowAll);
            F.Caption:=ReadString('Findit','V_TITULO','');
            F.Width:=ValStrDef(ReadString('Findit','V_ANCHO',''),F.Width);
            F.DBGrid1.Columns[0].Width:=F.DBGrid1.Width-1;
            AuxAlto:=ValStrDef(ReadString('Findit','DETALLE_ALTO',''),0);
            F.ShowDetail:=ReadBool('Findit','DETALLE_MOSTRAR',False);

            F.Distinct:=ReadBool('Findit','DISTINCT',False);

            F.MultiModo:=ReadInteger('Findit','MULTI_MODO',0);
            F.MultiTitulo:=ReadString('Findit','MULTI_TITULO','');
            SeparaCampos(ReadString('Findit','MULTI_ETIQUETAS',''),F.MultiLabelN,F.MultiCount,',');
            SeparaCampos(ReadString('Findit','MULTI_ARCHIVOS',''),F.MultiFileN,Aux,',');
            SeparaCampos(ReadString('Findit','MULTI_RESULTADOS',''),F.MultiResN,Aux,',');

            // Tamaño Default 271 Pixels!!
            if Not F.ShowDetail then AuxAlto:=0;
            if F.MultiModo=1 then
               begin AuxAlto:=AuxAlto+F.MultiPanel.Height;
                     F.MultiPanel.Visible:=True;
                     F.Panel2.Height:=209+F.MultiPanel.Height; //+24;  //CAMBIO1
                     F.Height:=209+F.Panel1.Height+AuxAlto;
                     F.MultiPanelGroup.Caption:=F.MultiTitulo;
                     F.MultiPanelGroup.Items.Clear;
                     F.MultiPanelGroup.Columns:=F.MultiCount+1;
                     for i:=0 to F.MultiCount do
                       F.MultiPanelGroup.Items.Add(F.MultiLabelN[i]);
               end;
            if F.ShowDetail then
            begin F.Panel5.Visible:=True;
                  F.Height:=F.Panel1.Height+F.Panel2.Height+AuxAlto;
            end;

            if ReadInteger('Findit','V_CENTRADO',0)=0
               then begin //Centrar Ventana
                          F.Left:=(Screen.Width-F.Width) div 2;
                          F.Top:=(Screen.Height-F.Height) div 2;
                    end
               else begin //Utilizar Valores de Default
                          F.Top:=ValStr(ReadString('Findit','V_Y',''));
                          F.Left:=ValStr(ReadString('Findit','V_X',''));
                    end;

            if SourceFields='' then SourceFields:=ReadString('Findit','V_DS_CAMPOS','');
            SeparaCampos(SourceFields,F.SourceFieldsN,F.SourceFieldsCount,',');

            if CampoResultados='' then CampoResultados:=ReadString('Findit','V_RESULTADOS','');
            SeparaCampos(CampoResultados,F.ResN,F.ResCount,',');

            if F.FValoresDefault=''
               then begin F.FValoresDefault:=ReadString('Findit','V_DEF_VALORES','');
                          F.FTiposValoresDefault:=ReadString('Findit','V_DEF_TIPOS','');
                          SeparaCampos(F.FValoresDefault,F.DefN,F.DefCount,',');
                          SeparaCampos(F.FTiposValoresDefault,F.TipoDefN,Aux,',');
                    end
               else begin SeparaCampos(F.FValoresDefault,F.DefN,F.DefCount,#30);
                          SeparaCampos(F.FTiposValoresDefault,F.TipoDefN,Aux,',');
                    end;



            F.IsDatoDefault:=((F.FValoresDefault<>'') or (F.SourceDataSet<>nil));

            (*F.FValoresDefault:=ValoresDefault;
            F.FTiposValoresDefault:=TiposValoresDefault;
            *)


            SeparaCampos(ReadString('Findit','V_CAMPOS',''),F.CampoN,F.CampoCount,',');
            SeparaCampos(ReadString('Findit','V_ETIQUETAS',''),F.LabelN,Aux,',');
            SeparaCampos(ReadString('Findit','V_TIPOS',''),F.TipoN,Aux,',');
            SeparaCampos(ReadString('Findit','V_CAPTURA',''),F.CasoN,Aux,',');
            SeparaCampos(ReadString('Findit','V_POSICIONES',''),F.PosLabel,Aux,',');

            F.Tabla:=ReadString('Findit','V_TABLA','');
            F.Campos:=ReadString('Findit','V_CAMPOS','');
            F.ModoCaso:=ReadInteger('Findit','MODO',0);
            F.SubSetCampos:=ReadString('Findit','V_ADD_CAMPOS','');
            F.SubSetTablas:=ReadString('Findit','V_ADD_TABLAS','');
            if F.FWhereString=''
               then F.SubSetWhere:=ReadString('Findit','V_ADD_WHERE','')
               else begin S:=F.FWhereString;
                          AddSQL(S,ReadString('Findit','V_ADD_WHERE',''));
                          F.SubSetWhere:=S;
                    end;
            F.CamposOrderBy:=ReadString('Findit','V_ORDERBY','');
      end;
      Finally
             if Ini<>nil then Ini.Free;
             CursorNormal;
      end;
      if F.MultiModo=1 then begin F.MultiPanelGroup.ItemIndex:=0;
                                  //F.LoadIt(0,False);

                            end;
      F.ModalResult:=mrNone;
      if F.ShowModal=mrOK then InternalFindForMe:=F.Resultado;
      Finally if F<>nil then F.Free;
      end;
end;



procedure TWFindIt.MultiPanelGroupClick(Sender: TObject);
begin LoadIt(MultiPanelGroup.ItemIndex,True);
end;

procedure TWFindIt.FormCreate(Sender: TObject);
var i:Integer;
begin for i:=0 to 10 do
      begin EdN[i]  :=nil;
            LbN[i]  :=nil;
            LbDet[i]:=nil;
            EdB[i]  :=nil;
      end;
      StrSQL:=nil;
      FFastVal:='';
      FFastField:='';
      FFastWait:=True;
      FFastAutoSelect:=False;
end;

Procedure TWFindIt.CierraQuery;
begin Query.Close;
      DBGrid1.Columns[0].Width:=DBGrid1.Width-1;
      btSelect.Enabled:=False;
end;

procedure TWFindIt.DestruyeObjetos;
var i:Integer;
begin CierraQuery;
      for i:=0 to 10 do
      begin if EdN[i]<>nil then EdN[i].Free;
            if LbN[i]<>nil then LbN[i].Free;
            if LbDet[i]<>nil then LbDet[i].Free;
            if EdB[i]<>nil then EdB[i].Free;
            EdN[i]  :=nil;
            LbN[i]  :=nil;
            LbDet[i]:=nil;
            EdB[i]  :=nil;
      end;
end;


procedure TWFindIt.FormHide(Sender: TObject);
begin FFastVal:='';
      FFastField:='';
      FFastWait:=True;
      FFastAutoSelect:=False;
end;

end.
