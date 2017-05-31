unit IntFind;
//-------------------------------------------------------------
// Sistema         :   Sistema Rapido de Busqueda
// Date            :   Octubre de 1997
// Fecha de Inicio :   Octubre de 1997
// Función forma   :   Todos!!!
// Desarrollo por  :   Víctor Martínez Castro
// Comentarios     :   Componente Estandar para Relacionar Busquedas
// Actualizado al  :   07 Septiembre
// ------------------------------------------------------------
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, extCtrls //DSGNINTF  para Delphi 5.0
  , Buttons;

Type
    TOnExecute= Procedure (Sender : TObject; Select:Boolean) of Object;


Type
(*  Para Delphi 5.0
    TFindItEditor=Class(TComponentEditor)
     Public
        Function GetVerbCount:Integer; override;
        Procedure Edit; override;
        Function GetVerb(Index:Integer):String; override;
        Procedure ExecuteVerb(Index:Integer); override;
     end;
type *)


  TInterFindit=class(TComponent)
  private
    { Private declarations }
    FOnPrepareExecute:TNotifyEvent;
    FOnExecute:TOnExecute;
    FDatosDefault:String;
    FTiposDatosDefault:String;
    FResultado:String;
    FCamposResultado:String;
    FCamposSource:String;
    FDataBaseName:String;
    FFileName:String;
    FDataSet:TDataSet;
    FControl:TControl;
    FSessionName:String;
    FWhereString:String;
    FShowAll:Boolean;
    FGroupQuery:Boolean;
    FHavingString:String;
    FSeguDataBaseName:String;
    FSeguSessionName:String;
  protected
    { Protected declarations }
    Procedure SetDataSet(eDataSet:TDataSet);
    Procedure SetDataBaseName(S:String);
    Procedure SetSessionName(S:String);
    Procedure SetControl(T:TControl);
    procedure Notification( AComponent : TComponent; Operation : TOperation); override;
  public
    { Public declarations }
    StrSQL:TStringList;
    FastVal:String;
    FastField:String;
    FastWait:Boolean;
    FastAutoSelect:Boolean;
    constructor Create( AOwner : TComponent ); override;
    Destructor  Destroy; override;
    function    Execute:Boolean;
    Procedure   DespuesEjecuta(Res:Boolean);
    Procedure   AntesEjecuta;
    Function    DameCampo(N:Integer):String;
    Procedure   EditClick(Sendet:TObject);
    Procedure   Param(Numero:Integer; Valor:string);
    Property    ShowAll:Boolean Read FShowAll Write FShowAll;
    Property    GroupQuery:Boolean Read FGroupQuery Write FGroupQuery;
    Property    HavingString:String Read FHavingString Write FHavingString;
  published
    { Published declarations }
    Property DataSet:TDataSet Read FDataSet Write SetDataSet;
    Property DataBaseName:String Read FDataBaseName Write SetDataBaseName;
    Property SessionName:String Read FSessionName Write SetSessionName;

    Property SeguDataBaseName:String Read FSeguDataBaseName Write FSeguDataBaseName;
    Property SeguSessionName:String Read FSeguSessionName Write FSeguSessionName;


    Property Control:TControl Read FControl Write SetControl;
    Property FileName:String Read FFileName Write FFileName;
    Property CamposResultado:String Read FCamposResultado Write FCamposResultado;
    Property CamposSource:String Read FCamposSource Write FCamposSource;
    Property DatosDefault:String Read FDatosDefault Write FDatosDefault;
    Property TiposDatosDefault:String Read FTiposDatosDefault  Write FTiposDatosDefault;
    Property Resultado:String Read FResultado Write FResultado;
    Property OnPrepareExecute:TNotifyEvent Read FOnPrepareExecute Write FOnPrepareExecute;
    Property OnExecute:TOnExecute Read FOnExecute Write FOnExecute;
    Property WhereString:String Read FWhereString Write FWhereString;
  end;

procedure Register;

implementation
Uses IntEFind, IntWFind;

{$R *.DCR}


procedure Register;
begin
  RegisterComponents('Inter', [TInterFindit]);
//  RegisterComponentEditor(TInterFindIt,TFindItEditor);
end;

{ Para Delphi 5.0
Procedure TFindItEditor.Edit;
begin inherited;
end;

Function  TFindItEditor.GetVerbCount:Integer;
begin Result:=1;
end;

Function  TFindItEditor.GetVerb(Index:Integer):String;
begin Case Index of
      0:Result:='FindIt Editor´s';
      end;
end;

Procedure TFindItEditor.ExecuteVerb(Index:Integer);
var F:TWIntEFind;
begin Case Index of
      0:begin if (Component=nil)or(Not (Component is TInterFindIt))  then exit;
              if TInterFindIt(Component).DataBaseName=''
                 then begin MessageDlg('Debe Asignar la Propiedad DataBaseName',mtError,[mbOK],0);
                            Exit;
                      end;
              F:=TWIntEFind.Create(Application);
               Try
                   F.FMainDir:=Designer.GetPrivateDirectory;
                   F.FileName:=TInterFindIt(Component).FileName;
                   F.DataBaseName:=TInterFindIt(Component).DataBaseName;
                   F.SessionName:=TInterFindIt(Component).SessionName;
                   if F.ShowModal=mrOK then
                      begin TInterFindIt(Component).FileName:=F.Archivo;
                            Designer.Modified;
                      end;
               Finally F.Free;
               end;
        end;
      end;
      Inherited;
end;
}

Procedure TInterFindit.DespuesEjecuta(Res:Boolean);
begin if Assigned(FOnExecute) then FOnExecute(Self,Res);
end;

Procedure TInterFindit.AntesEjecuta;
begin if Assigned(FOnPrepareExecute) then FOnPrepareExecute(Self);
end;


function TInterFindit.Execute:Boolean;
Var Res:Boolean;
begin Try
      AntesEjecuta;
      Resultado:='';
      Resultado:=InternalFindForMe(FileName,
                                   CamposResultado,
                                   DatosDefault,
                                   TiposDatosDefault,
                                   DataSet,
                                   CamposSource,
                                   DataBaseName,
                                   SessionName,
                                   SeguDataBaseName,
                                   SeguSessionName,
                                   WhereString,
                                   GroupQuery,
                                   HavingString,
                                   ShowAll,
                                   StrSQL,
                                   FastVal,
                                   FastField,
                                   FastWait,
                                   FastAutoSelect
                                   );
     Res:=(Resultado<>'');
     DespuesEjecuta(Res);
     Execute:=Res;
     Finally FastVal:='';
             FastField:='';
             FastWait:=True;
             FastAutoSelect:=False;
     end;
end;

Function TInterFindit.DameCampo(N:Integer):String;
begin DameCampo:=FieldIt(Resultado,N);
end;

Procedure TInterFindit.Param(Numero:Integer; Valor:string);
var S:String;
    R1:TArr;
    I,N:Integer;
begin if (Numero>10)or(Numero<0)
      then begin MessageDlg(' Error en el número de Parámetro ['+Name+']',mtError,[mbOK],0);
                 exit;
           end;
      SeparaCampos(DatosDefault,R1,N,#30);
      R1[Numero]:=Valor;
      if N>Numero then Numero:=N;
      S:='';
      for i:=0 to Numero do
      begin if S=''
            then S:=S+R1[I]
            else S:=S+#30+R1[I];
      end;
      DatosDefault:=S;
end;


Constructor TInterFindit.Create( AOwner : TComponent );
begin inherited Create( AOwner );
      FDataSet:=nil;
      FDataBaseName:='';
      FSessionName:='';
      FFileName:='';
      FCamposSource:='';
      FCamposResultado:='';
      FControl:=nil;
      FShowAll:=False;
      FGroupQuery:=False;
      FHavingString:='';
      StrSQL:=TStringList.Create;
      SeguDataBaseName:='';
      SeguSessionName:='';
      FastVal:='';
      FastField:='';
      FastWait:=True;
      FastAutoSelect:=False;
end;



Destructor TInterFindit.Destroy;
begin if StrSQL<>nil then StrSQL.Free;
      inherited Destroy;
end;

Procedure TInterFindit.SetDataSet(eDataSet:TDataSet);
begin FDataSet:=eDataSet;
end;

Procedure TInterFindit.SetDataBaseName(S:String);
begin FDataBaseName:=S;
      if SeguDataBaseName='' then SeguDataBaseName:=S;
end;

Procedure TInterFindit.SetSessionName(S:String);
begin FSessionName:=S;
      if SeguSessionName='' then SeguSessionName:=S;
end;

Procedure TInterFindit.SetControl(T:TControl);
begin FControl:=T;
      if T=nil then exit;
      if FControl is TBitBtn
      then begin TBitBtn(FControl).OnClick:=EditClick;
           end
 else if FControl is TSpeedButton
      then begin TSpeedButton(FControl).OnClick:=EditClick;
           end
 else if FControl is TButton
     then begin TButton(FControl).OnClick:=EditClick;
          end;

end;

Procedure TInterFindit.EditClick(Sendet:TObject);
begin Execute;
end;

procedure TInterFindit.Notification( AComponent : TComponent; Operation : TOperation);
begin
  inherited Notification( AComponent, Operation );
  if ( Operation = opRemove ) and ( AComponent = FDataSet) then FDataSet:= nil;
  if ( Operation = opRemove ) and ( AComponent = FControl) then FControl:= nil;
end;



end.
