unit IntMenuSegu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, InterFor, IntFrm, UnSql2, db, dbtables, IntSecuAplic,
  IntMenu, IntMenuGpo, IntMenGpoFun, Buttons, Menus, ExtCtrls;

Const WM_DESPUESSHOW=WM_USER+1;

type
	TNodo = class
   	Aplicacion: String;
      Menu		 : String;
      Grupo     : Integer;
      Funcion	 : String;
      Nombre	 : String;
      Desc		 : String;
      Posicion  : Integer;
      Nivel     : Integer;
   end;

   TLastNodo = record
   	Aplicacion: String;
   	Menu: String;
      Grupo: Integer;
      Funcion: String;
   end;

	TMenuSegu = Class;

  TwMenuSegu = class(TForm)
    tvMenu: TTreeView;
    InterForma1: TInterForma;
    Funcion: TTreeView;
    ImagenFuncion: TImageList;
    gbMenu: TGroupBox;
    gbGrupo: TGroupBox;
    gbFuncion: TGroupBox;
    lbAplicacion: TLabel;
    Label2: TLabel;
    edMNombre: TEdit;
    edMDescripcion: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    edMPosicion: TEdit;
    chbMBloqueado: TCheckBox;
    Label6: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edGClave: TEdit;
    edGNombre: TEdit;
    Label14: TLabel;
    edGPosicion: TEdit;
    chbGBloqueado: TCheckBox;
    lbGMenu: TLabel;
    lbFMenu: TLabel;
    Label10: TLabel;
    edFPosicion: TEdit;
    chbFBloqueado: TCheckBox;
    lbFGrupo: TLabel;
    lbFFuncion: TLabel;
    edMClave: TEdit;
    ImagenMenu: TImageList;
    chbWarning: TCheckBox;
    BitBtn1: TBitBtn;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    PopupFuncionApl: TPopupMenu;
    AgregarFuncin1: TMenuItem;
    bAgregaFuncion: TBitBtn;
    bEliminaFuncion: TBitBtn;
    BitBtn2: TBitBtn;
    TimerMenu: TTimer;
    procedure bInsHermanoClick(Sender: TObject);
    procedure bEliminarClick(Sender: TObject);
    procedure tvMenuDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure tvMenuDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure bRefreshFuncionClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tvMenuChange(Sender: TObject; Node: TTreeNode);
    procedure bRefreshMenuClick(Sender: TObject);
    procedure tvMenuEditing(Sender: TObject; Node: TTreeNode;
      var AllowEdit: Boolean);
    procedure FormHide(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1Nuevo(Sender: TObject; var Realizado: Boolean);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure edGNombreChange(Sender: TObject);
    procedure edMNombreChange(Sender: TObject);
    procedure bInsHijoClick(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure chbWarningClick(Sender: TObject);
    procedure InterForma1Eliminar(Sender: TObject; var Realizado: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure InterForma1CanEdit(Sender: TObject; CanEdit: Boolean);
    procedure tvMenuChanging(Sender: TObject; Node: TTreeNode;
      var AllowChange: Boolean);
    procedure tvMenuKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure AgregarFuncin1Click(Sender: TObject);
    procedure bAgregaFuncionClick(Sender: TObject);
    procedure FuncionKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bEliminaFuncionClick(Sender: TObject);
    procedure TimerMenuTimer(Sender: TObject);
    procedure InterForma1AntesEliminar(Sender: TObject;
      var Realizado: Boolean);
    procedure InterForma1AntesModificar(Sender: TObject;
      var Realizado: Boolean);
    procedure InterForma1AntesNuevo(Sender: TObject;
      var Realizado: Boolean);
  private
    { Private declarations }
      NumTimerMenu: Integer;
  public
    { Public declarations }
		Objeto: TMenuSegu;
      Procedure RefrescaFuncion;
      Procedure RefrescaMenu;
      Function  LimpiaFuncion: String;
      Function  LimpiaMenu: TLastNodo;
      Procedure ReposicionMenu(Padre: TTreeNode; Inicio, Incremento: Integer);
      Function  RevisaNodosIguales(Nodo: TTreeNode; LastNodo: TLastNodo): Boolean;
      Procedure EliminaArbol(Inicio: TTreeNode; Nivel: Integer);
      Procedure InsertaArbol(Origen, Destino: TTreeNode; Nivel: Integer);
      Procedure InsertaNodo(Origen: TNodo; Destino: TTreeNode);
      Procedure DespuesShow(Var Msg:TMessage); message WM_DESPUESSHOW;
      Function  LocateTree(Frame: TInterFrame; CveFun: String): Boolean;
      Procedure CambioNodo;
  end;



  TMenuSegu = Class(TInterFrame)
  Private
		FAplicacion: TInterFrame;
      FHermano: Boolean;
      FShowCatalogo: Boolean;
      FShowWarning: Boolean;
      FAltaRegistro: Boolean;
      FIsMoving: Boolean;
  Protected
		Procedure SetAplicacion(Frame: TInterFrame);
      //Function  GetNextKey(Padre: TNodo; Var NumPos: Integer): String;
      Function  GetNextKey(Nodo: TNodo): String;

  Public
		SecuMenu	  : TSecuMenu;
      SecuGrupo  : TMenuGpo;
      SecuFuncion: TMenuGpoFu;

     constructor Create(AOwner: TComponent ); override;
     Destructor  Destroy; override;
     Procedure   DataBaseChange; Override;
     Function    ShowWindow(FormaTipo: TFormaTipo): Integer; override;

     Property Aplicacion: TInterFrame Read FAplicacion Write SetAplicacion;
     Property Hermano: Boolean Read FHermano Write FHermano;
     Property ShowCatalogo: Boolean Read FShowCatalogo Write FShowCatalogo;
     Property ShowWarning: Boolean Read FShowWarning Write FShowWarning;
     Property AltaRegistro: Boolean Read FAltaRegistro Write FAltaRegistro;
     Property IsMoving: Boolean Read FIsMoving Write FIsMoving;
  end;

var
  wMenuSegu: TwMenuSegu;

implementation

Uses IntSecuAplFun;

{$R *.DFM}

(***************************************************************************)
(*															CLASE    							*)
(***************************************************************************)
constructor TMenuSegu.Create(AOwner: TComponent );
Begin
	inherited;
   SecuMenu	  := TSecuMenu.Create(self);
   SecuGrupo  := TMenuGpo.Create(self);
   SecuFuncion:= TMenuGpoFu.Create(self);

   SecuMenu.Active   := False;
   SecuGrupo.Active  := False;
   SecuFuncion.Active:= False;

   ShowCatalogo := False;
   ShowWarning := True;
   AltaRegistro:= False;
   IsMoving:= False;
   AskDelete:= True;
   Hermano := True;
end;

Destructor TMenuSegu.Destroy;
Begin
   if SecuMenu <> nil then SecuMenu.Free;
   if SecuGrupo <> nil then SecuGrupo.Free;
   if SecuFuncion <> nil then SecuFuncion.Free;
	inherited;
end;

Procedure TMenuSegu.DataBaseChange;
Begin
   SecuMenu.GetParams(self);
   SecuGrupo.GetParams(self);
   SecuFuncion.GetParams(self);
end;

Function TMenuSegu.ShowWindow(FormaTipo: TFormaTipo): Integer;
var W : TwMenuSegu;
begin
   W:=TwMenuSegu.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= nil;
      W.InterForma1.FormaTipo := ftGrid;   //ftConsulta;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.ShowBtnBuscar:= False;
      W.InterForma1.CentrarForma := True;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

Procedure TMenuSegu.SetAplicacion(Frame: TInterFrame);
Begin
	FAplicacion := Frame;

	If Frame <>nil then
   Begin
   	ShowCatalogo := True;
      SecuFuncion.Funcion.BuscaWhereString :=
      	' (Secu_Funcion.Cve_Funcion in (SELECT Cve_Funcion from Secu_Apl_Fun Where Cve_Aplicacion = '''+ Aplicacion.FieldByName('CVE_APLICACION').asString +''')) ';
   end
   else
      SecuFuncion.BuscaWhereString := '';
end;

//Function TMenuSegu.GetNextKey(Padre: TNodo; Var NumPos: Integer): String;
Function TMenuSegu.GetNextKey(Nodo: TNodo): String;
Var	SqlCampo, SqlFrom, SqlWhere: String;
		q: TQuery;
      Entero, Code, NumMax: Integer;
Begin
	Case Nodo.Nivel of
   1:	Begin
   		SqlCampo:= 'Cve_Menu';
      	SqlFrom := 'Secu_Menu';
         SqlWhere:= 'Cve_aplicacion = '''+ Nodo.Aplicacion + '''';
   	end;

   2:	Begin
   		SqlCampo:= 'Id_Gpo_Menu';
   		SqlFrom := ' Secu_Menu_Gpo ';
         SqlWhere:= ' Cve_aplicacion = '''+ Nodo.Aplicacion + '''' +
         	' and Cve_Menu = '''+ Nodo.Menu + '''';
   	end;
{   2:	Begin
   		SqlFrom := 'Secu_Menu_Gpo_Fun';
         SqlWhere:= ' Cve_aplicacion = '''+ Padre.Aplicacion + '''' +
         	' and Cve_Menu = '''+ Padre.Menu + '''' +
         	' and Id_Gpo_Menu = '+ IntToStr(Padre.Grupo);
   	end;}
   end;


   NumMax := 0;
   Nodo.Posicion := 0;
	q:= GetSqlQuery('Select * from '+ SqlFrom + ' Where '+ SqlWhere,
   		DataBaseName, SessionName, False);
   Try
      While (q <> nil) and (Not q.EOF) do
      Begin
         Val(q.FieldByName(SqlCampo).asString, Entero,Code);
         If (Code = 0) and (Entero > NumMax) Then NumMax := Entero;
         If q.FieldByName('NUM_POSICION').asInteger > Nodo.Posicion Then Nodo.Posicion := q.FieldByName('NUM_POSICION').asInteger;

         q.Next;
      end;
   Finally
   	If q <> nil then q.Free;
   end;

   Inc(NumMax);
   Inc(Nodo.Posicion);
   Result := IntToStr(NumMax);
end;

(***************************************************************************)
(*															FORMA		 							*)
(***************************************************************************)
Procedure TwMenuSegu.DespuesShow(Var Msg:TMessage);
begin
	if Objeto.Aplicacion <> nil then
   Begin
   	lbAplicacion.Caption := Objeto.Aplicacion.FieldByName('NOM_APLICACION').asString;
	   RefrescaMenu;
   	RefrescaFuncion;
   end;
end;


procedure TwMenuSegu.FormShow(Sender: TObject);
begin
   Objeto.SecuMenu.CVE_MENU.Control := edMClave;
   Objeto.SecuMenu.NOM_MENU.Control := edMNombre;
   Objeto.SecuMenu.TX_DESC_MENU.Control := edMDescripcion;
   Objeto.SecuMenu.NUM_POSICION.Control := edMPosicion;
   Objeto.SecuMenu.B_BLOQUEADO.Control := chbMBloqueado;

   Objeto.SecuGrupo.ID_GPO_MENU.Control := edGClave;
   Objeto.SecuGrupo.TX_DESC_GPO_MENU.Control := edGNombre;
   Objeto.SecuGrupo.NUM_POSICION.Control := edGPosicion;
   Objeto.SecuGrupo.B_BLOQUEADO.Control :=chbGBloqueado;

   Objeto.SecuFuncion.NUM_POSICION.Control := edFPosicion;
   Objeto.SecuFuncion.B_BLOQUEADO.Control := chbFBloqueado;

	Objeto.SecuGrupo.Menu.TX_DESC_MENU.Control := lbGMenu;
   Objeto.SecuFuncion.MenuGrupo.Menu.TX_DESC_MENU.Control := lbFMenu;
   Objeto.SecuFuncion.MenuGrupo.TX_DESC_GPO_MENU.Control := lbFGrupo;
   Objeto.SecuFuncion.Funcion.TX_DESC_FUNCION.Control := lbFFuncion;

   chbWarning.Checked := Objeto.ShowWarning;
   NumTimerMenu:= 0;

   PostMessage(Handle,WM_DESPUESSHOW,0,0);
end;


procedure TwMenuSegu.FormHide(Sender: TObject);
begin
   LimpiaFuncion;
   LimpiaMenu;

   Objeto.SecuMenu.CVE_MENU.Control := nil;
   Objeto.SecuMenu.NOM_MENU.Control := nil;
   Objeto.SecuMenu.TX_DESC_MENU.Control := nil;
   Objeto.SecuMenu.NUM_POSICION.Control := nil;
   Objeto.SecuMenu.B_BLOQUEADO.Control := nil;

   Objeto.SecuGrupo.ID_GPO_MENU.Control := nil;
   Objeto.SecuGrupo.TX_DESC_GPO_MENU.Control := nil;
   Objeto.SecuGrupo.NUM_POSICION.Control := nil;
   Objeto.SecuGrupo.B_BLOQUEADO.Control :=nil;

   Objeto.SecuFuncion.NUM_POSICION.Control := nil;
   Objeto.SecuFuncion.B_BLOQUEADO.Control := nil;

	Objeto.SecuGrupo.Menu.TX_DESC_MENU.Control := nil;
   Objeto.SecuFuncion.MenuGrupo.Menu.TX_DESC_MENU.Control := nil;
   Objeto.SecuFuncion.MenuGrupo.TX_DESC_GPO_MENU.Control := nil;
   Objeto.SecuFuncion.Funcion.TX_DESC_FUNCION.Control := nil;
end;



Procedure TwMenuSegu.InsertaNodo(Origen: TNodo; Destino: TTreeNode);
Var
	Datos: TNodo;
   Posicion: Integer;
   SqlCampo, Campos, SqlFrom, SqlWhere, TipoDato: String;
Begin
{	Datos:= TNodo(Destino.Data);
	TipoDato := '''';
	SqlWhere:= 'Cve_Aplicacion = '''+  Datos.Aplicacion + '''';

	Case Origen.Nivel of
   1:	Begin
   		Campos
   		SqlCampo:= 'Cve_Menu';
         SqlFrom := 'Secu_Menu';
   	end;

   2:	Begin
   		SqlCampo:= 'Id_Gpo_Menu';
         SqlFrom := 'Secu_Menu_Gpo';
         SqlWhere:= SqlWhere + ' and Cve_Menu = '''+ Datos.Menu +'''';
         TipoDato := '';
   	end;

   3: Begin
   		SqlCampo:= 'Cve_Funcion';
         SqlFrom := 'Secu_Menu_Gpo_Fun';
         SqlWhere:= SqlWhere + ' and Cve_Menu = '''+ Datos.Menu +''' and Id_Gpo_Menu = ' + IntToStr(Datos.Grupo);
   	end;
   end;


	If Origen.Nivel = Destino.Level Then
   Begin
   	Posicion:= Datos.Posicion;
   	ReposicionMenu(Destino.Parent, Posicion, 1);
   end
   else If Origen.Nivel - 1 = Destino.Level Then
   Begin
      Posicion := -1;
		GetSqlInt(
   		' SELECT Count (*) NUM From '+ SqlFrom + ' WHERE ' + SqlWhere,
   		Objeto.DataBaseName, Objeto.SessionName, 'NUM', Posicion, False);
      Inc(Posicion);
      ReposicionMenu(Nodo, Posicion, 1);
   end;



   RunSql(
      ' INSERT INTO'+
      ' Secu_Menu_Gpo_Fun (Cve_Aplicacion, Cve_Menu, Id_Gpo_Menu, Cve_Funcion, B_Bloqueado, Num_Posicion)'+
      '    Values (''' + Datos.Aplicacion + ''', ''' +
                         Datos.Menu + ''', ' +
                         IntToStr(Datos.Grupo) + ', ''' +
                         TNodo(Origen.Data).Funcion + ''', ''F'',' + IntToStr(Posicion) + ')',
      Objeto.DataBaseName, Objeto.SessionName,False);}
end;



Procedure TwMenuSegu.InsertaArbol(Origen, Destino: TTreeNode; Nivel: Integer);
Begin
{   case Inicio.Level of
   1:	Begin
   		If Origen.level = Nievel Then
         Begin
         end;

         RunSql(
            ' INSERT Into Secu_Menu ( '+
            ' WHERE Cve_Aplicacion = '''+ TNodo(Inicio.Data).Aplicacion + '''' +
            '   and Cve_Menu = '''+ TNodo(Inicio.Data).Menu + '''',
            Objeto.DataBaseName, Objeto.SessionName, False);
      end;

   2:	Begin
         RunSql(
            ' DELETE Secu_Menu_Gpo '+
            ' WHERE Cve_Aplicacion = '''+ TNodo(Inicio.Data).Aplicacion + '''' +
            '   and Cve_Menu = '''+ TNodo(Inicio.Data).Menu + '''' +
            '   and Id_Gpo_Menu = '+ IntToStr(TNodo(Inicio.Data).Grupo),
            Objeto.DataBaseName, Objeto.SessionName, False);
      end;

   3:	Begin
         RunSql(
            ' DELETE Secu_Menu_Gpo_Fun '+
            ' WHERE Cve_Aplicacion = '''+ TNodo(Inicio.Data).Aplicacion + '''' +
            '   and Cve_Menu = '''+ TNodo(Inicio.Data).Menu + '''' +
            '   and Id_Gpo_Menu = '+ IntToStr(TNodo(Inicio.Data).Grupo) +
            '   and Cve_Funcion = '''+ TNodo(Inicio.Data).Funcion + '''',
            Objeto.DataBaseName, Objeto.SessionName, False);
      end;
   end;

   If Inicio.HasChildren Then EliminaArbol(Inicio.Item[0], Nivel)}
end;


Procedure TwMenuSegu.EliminaArbol(Inicio: TTreeNode; Nivel: Integer);
Var	Padre: TTreeNode;
Begin
	If Inicio.HasChildren Then EliminaArbol(Inicio.Item[0], Nivel)
	else
   Begin
      case Inicio.Level of
      1:	Begin
            RunSql(
               ' DELETE Secu_Menu '+
               ' WHERE Cve_Aplicacion = '''+ TNodo(Inicio.Data).Aplicacion + '''' +
               '   and Cve_Menu = '''+ TNodo(Inicio.Data).Menu + '''',
               Objeto.DataBaseName, Objeto.SessionName, False);
         end;

      2:	Begin
            RunSql(
               ' DELETE Secu_Menu_Gpo '+
               ' WHERE Cve_Aplicacion = '''+ TNodo(Inicio.Data).Aplicacion + '''' +
               '   and Cve_Menu = '''+ TNodo(Inicio.Data).Menu + '''' +
               '   and Id_Gpo_Menu = '+ IntToStr(TNodo(Inicio.Data).Grupo),
               Objeto.DataBaseName, Objeto.SessionName, False);
         end;

      3:	Begin
            RunSql(
               ' DELETE Secu_Menu_Gpo_Fun '+
               ' WHERE Cve_Aplicacion = '''+ TNodo(Inicio.Data).Aplicacion + '''' +
               '   and Cve_Menu = '''+ TNodo(Inicio.Data).Menu + '''' +
               '   and Id_Gpo_Menu = '+ IntToStr(TNodo(Inicio.Data).Grupo) +
               '   and Cve_Funcion = '''+ TNodo(Inicio.Data).Funcion + '''',
               Objeto.DataBaseName, Objeto.SessionName, False);
         end;
      end;

      Padre:= Inicio.Parent;
      TNodo(Inicio.Data).Free;
      Inicio.Free;

      if Padre.Level >= Nivel Then EliminaArbol(Padre, Nivel);
   end;
end;

Function TwMenuSegu.RevisaNodosIguales(Nodo: TTreeNode; LastNodo: TLastNodo): Boolean;
Begin
	If
   	(LastNodo.Aplicacion= TNodo(Nodo.Data).aplicacion) and
	   (LastNodo.Menu      = TNodo(Nodo.Data).Menu)       and
   	(LastNodo.Grupo     = TNodo(Nodo.Data).Grupo)      and
	   (LastNodo.Funcion   = TNodo(Nodo.Data).Funcion)
   Then Result := True
   else Result := False;
End;


Procedure TwMenuSegu.ReposicionMenu(Padre: TTreeNode; Inicio, Incremento: Integer);
Var
	q: TQuery;
   Indice: Integer;
   SqlCampo, SqlFrom, SqlWhere, TipoDato: String;
   Datos: TNodo;
Begin
	TipoDato := '''';
	Datos:= TNodo(Padre.Data);
	SqlWhere:= 'Cve_Aplicacion = '''+  Datos.Aplicacion + '''';

	Case Padre.Level of
   0:	Begin
   		SqlCampo:= 'Cve_Menu';
         SqlFrom := 'Secu_Menu';
   	end;

   1:	Begin
   		SqlCampo:= 'Id_Gpo_Menu';
         SqlFrom := 'Secu_Menu_Gpo';
         SqlWhere:= SqlWhere + ' and Cve_Menu = '''+ Datos.Menu +'''';
         TipoDato := '';
   	end;

   2:	Begin
   		SqlCampo:= 'Cve_Funcion';
         SqlFrom := 'Secu_Menu_Gpo_Fun';
         SqlWhere:= SqlWhere + ' and Cve_Menu = '''+ Datos.Menu +''' and Id_Gpo_Menu = ' + IntToStr(Datos.Grupo);
   	end;
   end;

   q:= GetSqlQuery(
   		' SELECT Num_Posicion, '+ SqlCampo + ' FROM ' + SqlFrom + ' WHERE ' + SqlWhere +
//         '   and Num_Posicion >= '+ IntToStr(Inicio) +
         ' ORDER BY Num_Posicion DESC',
         Objeto.DataBaseName, Objeto.SessionName,False);

	Indice := 0;
	GetSqlInt(
   	' SELECT Count (*) NUM From '+ SqlFrom + ' WHERE ' + SqlWhere,
   	Objeto.DataBaseName, Objeto.SessionName,'NUM',Indice,False);

   Indice := Indice + Incremento;

   If Q<>nil then
   Begin
	   Try
         While not q.EOF do
         Begin
            RunSql(
            	' UPDATE ' + SqlFrom +
               ' SET Num_Posicion = ' + IntToStr(Indice) +
               ' WHERE '+ SqlWhere + ' and '+ SqlCampo + ' = ' + TipoDato + q.FieldByName(SqlCampo).asString + TipoDato,
            	Objeto.DataBaseName, Objeto.SessionName, False);

            If Indice - Incremento = Inicio Then Dec(Indice,2)
            else Dec(Indice,1);
            q.Next;
         end;
   	Finally
      	q.Free;
	   end;
   end;

{   If Q<>nil then
   Begin
	   Try
         While not q.EOF do
         Begin
            RunSql(
            	' UPDATE ' + SqlFrom +
               ' SET Num_Posicion = ' + IntToStr(q.FieldByName('NUM_POSICION').asInteger + 1) +
               ' WHERE '+ SqlWhere + ' and '+ SqlCampo + ' = ' + TipoDato + q.FieldByName(SqlCampo).asString + TipoDato,
            	Objeto.DataBaseName, Objeto.SessionName, False);

            q.Next;
         end;
   	Finally
      	q.Free;
	   end;
   end;}
end;


Function TwMenuSegu.LimpiaMenu: TLastNodo;
Var
	Cont: Integer;
   Resultado: TLastNodo;
Begin
	Objeto.ShowCatalogo := False;
	If tvMenu.Selected <> nil then
   Begin
      Resultado.Aplicacion:= TNodo(tvMenu.Selected.Data).aplicacion;
      Resultado.Menu      := TNodo(tvMenu.Selected.Data).Menu;
      Resultado.Grupo     := TNodo(tvMenu.Selected.Data).Grupo;
      Resultado.Funcion   := TNodo(tvMenu.Selected.Data).Funcion;
   end
   else
   	Begin
         Resultado.Aplicacion:= '';
         Resultado.Menu      := '';
         Resultado.Grupo     := 0;
         Resultado.Funcion   := '';
      end;

	For Cont:=0 To tvMenu.Items.Count-1 do
   	TNodo((tvMenu.Items.Item[Cont]).Data).Free;

   tvMenu.Items.Clear;
   Objeto.ShowCatalogo := True;
   Result := Resultado;
end;


Procedure TwMenuSegu.RefrescaMenu;
Var
	qMenu, qGrupo, qFuncion: TQuery;
   NodoMenu, NodoGrupo, NodoFuncion: TTreeNode;
   Nodo: TNodo;
   LastNodo: TTreeNode;
   Resultado: TLastNodo;
Begin
	Objeto.ShowCatalogo := False;
   Resultado := LimpiaMenu;
   NodoMenu:= nil;
   NodoGrupo:= nil;
   NodoFuncion:= nil;

	If Objeto.Aplicacion = nil then Exit;

   Nodo:= TNodo.Create;				{CREACION DEL NODO APLICACION}
   Nodo.Aplicacion:= Objeto.Aplicacion.FieldByName('CVE_APLICACION').asString;
   Nodo.Nombre		:= Objeto.Aplicacion.FieldByName('NOM_APLICACION').asString;
   Nodo.Desc  		:= Objeto.Aplicacion.FieldByName('TX_DESC_APLI').asString;
   Nodo.Posicion  := 0;
   LastNodo:= tvMenu.Items.AddChildObject(nil,Nodo.Nombre,Nodo);
   LastNodo.ImageIndex := -1;

   qMenu:= GetSqlQuery(
   ' SELECT Secu_Menu.*'+
   ' FROM Secu_Menu'+
   ' WHERE Secu_Menu.Cve_Aplicacion = ''' + Objeto.Aplicacion.FieldByName('CVE_APLICACION').asString + '''' +
   ' ORDER BY Secu_Menu.Num_Posicion',
   Objeto.DataBaseName,Objeto.SessionName,False);

   Try
   While (qMenu <> nil) and (Not qMenu.Eof) do
   Begin
      Nodo:= TNodo.Create;				{CREACION DEL NODO MENU}
      Nodo.Aplicacion:= qMenu.FieldByName('CVE_APLICACION').asString;
      Nodo.Menu      :=  qMenu.FieldByName('CVE_MENU').asString;
      Nodo.Nombre    := qMenu.FieldByName('NOM_MENU').asString;
      Nodo.Desc      := qMenu.FieldByName('TX_DESC_MENU').asString;
      Nodo.Posicion  := qMenu.FieldByName('NUM_POSICION').asInteger;
      NodoMenu:= tvMenu.Items.AddChildObject(tvMenu.Items.Item[0],Nodo.Nombre,Nodo);
      NodoMenu.ImageIndex := -1;

      If RevisaNodosIguales(NodoMenu, Resultado) Then LastNodo := NodoMenu;

      qGrupo:= GetSqlQuery(
      ' SELECT Secu_Menu_Gpo.*'+
      ' FROM Secu_Menu_Gpo'+
      ' WHERE Secu_Menu_Gpo.Cve_Aplicacion = ''' + qMenu.FieldByName('CVE_APLICACION').asString + '''' +
      '   and Secu_Menu_Gpo.Cve_Menu = '''+ qMenu.FieldByName('CVE_MENU').asString + '''' +
      ' ORDER BY Secu_Menu_Gpo.Num_Posicion',
      Objeto.DataBaseName,Objeto.SessionName,False);

      Try
      While (qGrupo <> nil) and (Not qGrupo.Eof) do
      Begin
         Nodo:= TNodo.Create;				{CREACION DEL NODO GRUPO}
         Nodo.Aplicacion:= qGrupo.FieldByName('CVE_APLICACION').asString;
         Nodo.Menu      :=  qGrupo.FieldByName('CVE_MENU').asString;
         Nodo.Grupo     := qGrupo.FieldByName('ID_GPO_MENU').asInteger;
         Nodo.Nombre    := qGrupo.FieldByName('TX_DESC_GPO_MENU').asString;
         Nodo.Desc      := qGrupo.FieldByName('TX_DESC_GPO_MENU').asString;
	      Nodo.Posicion  := qGrupo.FieldByName('NUM_POSICION').asInteger;

         NodoGrupo:= tvMenu.Items.AddChildObject(NodoMenu, Nodo.Nombre, Nodo);
         NodoGrupo.ImageIndex := -1;

         If RevisaNodosIguales(NodoGrupo, Resultado) Then LastNodo := NodoGrupo;

         qFuncion:= GetSqlQuery(
         ' SELECT Secu_Menu_Gpo_Fun.*, Secu_Funcion.Nom_Funcion, Secu_Funcion.Tx_Desc_Funcion'+
         ' FROM Secu_Menu_Gpo_Fun, Secu_Funcion'+
         ' WHERE Secu_Menu_Gpo_Fun.Cve_Funcion = Secu_Funcion.Cve_Funcion'+
         '   and Secu_Menu_Gpo_Fun.Cve_Aplicacion = ''' + qGrupo.FieldByName('CVE_APLICACION').asString + '''' +
         '   and Secu_Menu_Gpo_Fun.Cve_Menu = '''+ qGrupo.FieldByName('CVE_MENU').asString + '''' +
         '   and Secu_Menu_Gpo_Fun.Id_Gpo_Menu = '+ qGrupo.FieldByName('ID_GPO_MENU').asString +
         ' ORDER BY Secu_Menu_Gpo_Fun.Num_Posicion',
         Objeto.DataBaseName,Objeto.SessionName,False);

         Try
         While (qFuncion <> nil) and (Not qFuncion.Eof) do
         Begin
            Nodo:= TNodo.Create;				{CREACION DEL NODO FUNCION}
            Nodo.Aplicacion:= qFuncion.FieldByName('CVE_APLICACION').asString;
            Nodo.Menu      := qFuncion.FieldByName('CVE_MENU').asString;
            Nodo.Grupo     := qFuncion.FieldByName('ID_GPO_MENU').asInteger;
            Nodo.Funcion   := qFuncion.FieldByName('CVE_FUNCION').asString;
            Nodo.Nombre    := qFuncion.FieldByName('NOM_FUNCION').asString;
            Nodo.Desc      := qFuncion.FieldByName('TX_DESC_FUNCION').asString;
		      Nodo.Posicion  := qFuncion.FieldByName('NUM_POSICION').asInteger;

            NodoFuncion:= tvMenu.Items.AddChildObject(NodoGrupo, Nodo.Nombre, Nodo);
            NodoFuncion.ImageIndex := -1;

            If RevisaNodosIguales(NodoFuncion, Resultado) Then LastNodo := NodoFuncion;

            qFuncion.Next;
         end;
         Finally
         	If qFuncion <> nil then qFuncion.Free;
         end;

         qGrupo.Next;
      end;
      Finally
      	If qGrupo <> nil then qGrupo.Free;
      end;

      qMenu.Next;
   end;
   Finally
   	If qMenu <> nil then qMenu.Free;
   end;

//   If LastNodo.Parent <> nil then LastNodo.Parent.Expand(False)
//   else LastNodo.Expand(False);

   If LastNodo.Parent <> nil then LastNodo.Expand(True)
   else LastNodo.Expand(False);

   Objeto.ShowCatalogo := True;
	tvMenu.Selected := LastNodo;
end;


Function TwMenuSegu.LimpiaFuncion: String;
Var Cont: Integer;
Begin
	If Funcion.Selected <> nil then Result:= TNodo(Funcion.Selected.Data).Funcion
   else Result := '';

	For Cont:=0 To Funcion.Items.Count-1 do
   	TNodo((Funcion.Items.Item[Cont]).Data).Free;

   Funcion.Items.Clear;
end;


Procedure TwMenuSegu.RefrescaFuncion;
Var	q: TQuery;
   	NodoFun: TNodo;
      LastClave: String;
      Nodo, LastNodo: TTreeNode;
Begin
	LastClave:= LimpiaFuncion;
   LastNodo:= nil;

	If Objeto.Aplicacion <> nil then
   Begin
	  	Q:=GetSqlQuery(
      	' SELECT Secu_Apl_Fun.*, Secu_Funcion.Nom_Funcion, Secu_Funcion.Tx_Desc_Funcion, Menu_Funcion.Cve_Funcion Menu'+
         ' FROM'+
         '    Secu_Apl_Fun, Secu_Funcion, '+
         '    ( Select Distinct Cve_Funcion From Secu_Menu_Gpo_Fun Where Cve_Aplicacion = ''' + Objeto.Aplicacion.FieldByName('CVE_APLICACION').asString + ''') Menu_Funcion' +
         ' WHERE Secu_Apl_Fun.Cve_Aplicacion = ''' + Objeto.Aplicacion.FieldByName('CVE_APLICACION').asString + '''' +
      	'    and Secu_Apl_Fun.Cve_Funcion = Secu_Funcion.Cve_Funcion'+
         '    and Secu_Apl_Fun.Cve_Funcion = Menu_Funcion.Cve_Funcion (+)'+
         ' ORDER BY Secu_Funcion.Nom_Funcion',
         Objeto.DataBaseName, Objeto.SessionName,False);

		if Q<>nil then
      Begin
      	Try
		      While not Q.EOF do
   		   Begin
            	NodoFun:= TNodo.Create;
               NodoFun.Aplicacion:= q.FieldByName('CVE_APLICACION').asString;
               NodoFun.Funcion:= q.FieldByName('CVE_FUNCION').asString;
               NodoFun.Nombre:= q.FieldByName('NOM_FUNCION').asString;
               NodoFun.Desc  := q.FieldByName('TX_DESC_FUNCION').asString;
               NodoFun.Posicion := 0;

               Nodo:= Funcion.Items.AddChildObject(nil,NodoFun.Nombre,NodoFun);
               //Nodo.SelectedIndex := -1;
               If TNodo(Nodo.Data).Funcion = LastClave Then LastNodo := Nodo;

               If Trim(q.FieldByName('MENU').asString)  <> '' Then Nodo.ImageIndex := 1
               else Nodo.ImageIndex := -1;

               q.Next;
      		end;
         finally
         	q.Free;
         end;
      end;

      if LastNodo <> nil Then Funcion.Selected := LastNodo;
      Funcion.SetFocus;
   end;
end;


procedure TwMenuSegu.tvMenuDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
Var	Nodo: TTreeNode;
begin
   Nodo := tvMenu.GetNodeAt(X, Y);
   If Nodo <> nil Then
   Begin
      if Source = Funcion Then
      	Accept := (Nodo.Level in ([2,3]))
      else if Source = tvMenu Then
      Begin
         If (tvMenu.Selected <> nil) and (tvMenu.Selected.Level > 0) and (tvMenu.Selected.Level = Nodo.Level) Then
         Begin
         	Case Nodo.Level of
            1: Accept := (TNodo(tvMenu.Selected.Data).Aplicacion = TNodo(Nodo.Data).Aplicacion);
            2: Accept := (TNodo(tvMenu.Selected.Data).Aplicacion = TNodo(Nodo.Data).Aplicacion) and (TNodo(tvMenu.Selected.Data).Menu = TNodo(Nodo.Data).Menu);
            3: Accept := (TNodo(tvMenu.Selected.Data).Aplicacion = TNodo(Nodo.Data).Aplicacion) and (TNodo(tvMenu.Selected.Data).Menu = TNodo(Nodo.Data).Menu) and (TNodo(tvMenu.Selected.Data).Grupo = TNodo(Nodo.Data).Grupo);
            end;
         end
         else Accept := False;
      end;
   end
   else
      Accept := False;
end;

procedure TwMenuSegu.tvMenuDragDrop(Sender, Source: TObject; X, Y: Integer);
Var
	Nodo, Origen: TTreeNode;
   Datos: TNodo;
	Posicion:Integer;
   OK_Transaccion: Boolean;
	SqlCampo, SqlFrom, SqlWhere, SqlDato, TipoDato: String;
begin
	Nodo := tvMenu.GetNodeAt(X, Y);
   Origen := TTreeView(Source).Selected;

   Datos:= TNodo(Nodo.Data);

   If (Nodo <> nil) and (Origen <> nil) then
   Begin
   	If Source = Funcion Then
      Begin
			if Nodo.Level = 2 Then
         Begin
         	Posicion := -1;
         	GetSqlInt(
	   		' SELECT Nvl(Max(Num_Posicion), 0) Posicion FROM Secu_Menu_Gpo_Fun '+
				' WHERE Cve_Aplicacion = ''' + Datos.Aplicacion + '''' +
            '   and Cve_Menu = '''+ Datos.Menu + '''' +
            '   and Id_Gpo_Menu = ' + IntToStr(Datos.Grupo),
         	Objeto.DataBaseName, Objeto.SessionName,'POSICION',Posicion,False);
            Inc(Posicion);
         	ReposicionMenu(Nodo, Posicion, 1);
         end
		   else
         Begin
         	Posicion := Datos.Posicion;
         	ReposicionMenu(Nodo.Parent, Posicion, 1);
         end;

         RunSql(
         	' INSERT INTO'+
            ' Secu_Menu_Gpo_Fun (Cve_Aplicacion, Cve_Menu, Id_Gpo_Menu, Cve_Funcion, B_Bloqueado, Num_Posicion)'+
            '    Values (''' + Datos.Aplicacion + ''', ''' +
            						 Datos.Menu + ''', ' +
                               IntToStr(Datos.Grupo) + ', ''' +
                               TNodo(Origen.Data).Funcion + ''', ''F'',' + IntToStr(Posicion) + ')',
         	Objeto.DataBaseName, Objeto.SessionName,False);
      end
      else if Source = tvMenu Then
      Begin
      	If Not (Origen.Index > Nodo.Index) Then
         Begin
         	If Nodo.Index = Nodo.Parent.Count-1 Then
         		Datos.Posicion := Datos.Posicion + 2
            else
            	Datos.Posicion := Datos.Posicion + 1;
         end;

         ReposicionMenu(Nodo.Parent, Datos.Posicion, 1);

         SqlWhere:= 'Cve_Aplicacion = ''' + Datos.Aplicacion + ''' ';
         TipoDato:= '''';

         Case Origen.Level of
         1:	Begin
               SqlCampo:= 'Cve_Menu';
               SqlFrom := 'Secu_Menu';
               SqlDato := TNodo(Origen.Data).Menu;
            end;
         2:	Begin
               SqlCampo:= 'Id_Gpo_Menu';
               SqlFrom := 'Secu_Menu_Gpo';
               SqlWhere:= SqlWhere + ' and Cve_Menu = '''+ Datos.Menu +'''';
               SqlDato := IntToStr(TNodo(Origen.Data).Grupo);
               TipoDato := '';
            end;
         3: Begin
               SqlCampo:= 'Cve_Funcion';
               SqlFrom := 'Secu_Menu_Gpo_Fun';
               SqlWhere:= SqlWhere + ' and Cve_Menu = '''+ Datos.Menu +''' and Id_Gpo_Menu = ' + IntToStr(Datos.Grupo);
               SqlDato := TNodo(Origen.Data).Funcion;
            end;
         end;


         RunSql(
            ' UPDATE ' + SqlFrom +
            ' SET Num_Posicion = ' + IntToStr(Datos.Posicion) +
            ' WHERE '+ SqlWhere + ' and '+ SqlCampo + ' = ' + TipoDato + SqlDato + TipoDato,
            Objeto.DataBaseName, Objeto.SessionName, False);

      	ReposicionMenu(Nodo.Parent, 1, 0);
      end;
   end;

   RefrescaMenu;
   RefrescaFuncion;
end;

procedure TwMenuSegu.tvMenuChange(Sender: TObject; Node: TTreeNode);
begin
	If (Objeto.ShowCatalogo) Then
   Begin
      If (Objeto.AltaRegistro) Then CambioNodo
      else
      Begin
			NumTimerMenu:= 0;
         TimerMenu.Enabled := True;
         Objeto.IsMoving:= True;
      end;
   end
   else
   begin
   	NumTimerMenu:= 0;
      TimerMenu.Enabled := False;
      Objeto.IsMoving:= False;
   end;
end;


procedure TwMenuSegu.tvMenuEditing(Sender: TObject; Node: TTreeNode;
  var AllowEdit: Boolean);
begin
{   If (tvMenu.Selected.Level in ([1,2,3])) Then
   Begin
   	Interforma1.BtnModificarClick(self);
   End;}
   AllowEdit:= False;
end;


procedure TwMenuSegu.bInsHermanoClick(Sender: TObject);
begin
	Objeto.Hermano:= True;
	Interforma1.BtnNuevoClick(Sender);
end;

procedure TwMenuSegu.bInsHijoClick(Sender: TObject);
begin
	Objeto.Hermano:= False;
	Interforma1.BtnNuevoClick(Sender);
end;

procedure TwMenuSegu.bEliminarClick(Sender: TObject);
Var Realizado: Boolean;
begin InterForma1.Eliminar;
end;


procedure TwMenuSegu.bRefreshMenuClick(Sender: TObject);
begin RefrescaMenu;
end;


procedure TwMenuSegu.bRefreshFuncionClick(Sender: TObject);
begin RefrescaFuncion;
end;


procedure TwMenuSegu.InterForma1Nuevo(Sender: TObject;
  var Realizado: Boolean);
Var
	Nodo, Datos: TNodo;
   NvoNodo: TTreeNode;
begin
	Realizado := False;
   Objeto.AltaRegistro:= True;


   case tvMenu.Selected.Level of
	   0: InterForma1.InterFrame := Objeto.SecuMenu;
   	1: InterForma1.InterFrame := Objeto.SecuGrupo;
	   2: InterForma1.InterFrame := Objeto.SecuFuncion;
   	3: Exit;
   end;

	Datos:= TNodo(tvMenu.Selected.Data);
   Nodo:= TNodo.Create;

   Nodo.Aplicacion:= Datos.Aplicacion;
   Nodo.Menu   := Datos.Menu;
   Nodo.Grupo  := Datos.Grupo;
   Nodo.Funcion:= Datos.Funcion;
   Nodo.Nombre := '';
   Nodo.Desc   := '';
   Nodo.Nivel  := tvMenu.Selected.Level + 1;

{   If Objeto.Hermano Then
      NvoNodo:= tvMenu.Items.AddChildObject(tvMenu.Selected.Parent, '', Nodo)
   else}
   	NvoNodo:= tvMenu.Items.AddChildObject(tvMenu.Selected, '', Nodo);

   tvMenu.Selected := NvoNodo;

   InterForma1.InterFrame.Append;

   Realizado := True;
   Objeto.Hermano:= True;
   If Realizado Then Objeto.AltaRegistro:= True
   else Objeto.AltaRegistro:= False;
end;


procedure TwMenuSegu.InterForma1DespuesNuevo(Sender: TObject);
Var
	Nodo: TNodo;
   q: TQuery;
   Index: Integer;
begin
	Nodo:= TNodo(tvMenu.Selected.Data);
   Index := 0;

   Try
      Case tvMenu.Selected.Level of
      1: Begin
            {q:= GetSqlQuery(
               ' SELECT Count(*) NUM, Nvl(Max(Num_Posicion),0) Posicion'+
               ' FROM Secu_Menu'+
               ' WHERE Secu_Menu.Cve_Aplicacion = '''+ Nodo.Aplicacion + '''',
               Objeto.DataBaseName, Objeto.SessionName, False);}

            Nodo.Menu := Objeto.GetNextKey(Nodo);

{            Nodo.Menu := IntToStr(q.FieldByName('NUM').asInteger + 1);
            Nodo.Posicion := q.FieldByName('POSICION').asInteger + 1;}
            Objeto.SecuMenu.CVE_APLICACION.AsString := Nodo.Aplicacion;
            Objeto.SecuMenu.CVE_MENU.AsString := Nodo.Menu;
            Objeto.SecuMenu.NUM_POSICION.AsInteger := Nodo.Posicion;

            edMNombre.SetFocus;
         end;

      2: Begin
            {q:= GetSqlQuery(
               ' SELECT Count(*) NUM, Nvl(Max(Num_Posicion),0) Posicion'+
               ' FROM Secu_Menu_Gpo'+
               ' WHERE Secu_Menu_Gpo.Cve_Aplicacion = '''+ Nodo.Aplicacion + '''' +
               '   and Secu_Menu_Gpo.Cve_Menu = ''' + Nodo.Menu + '''',
               Objeto.DataBaseName, Objeto.SessionName, False);}

            //Nodo.Grupo := StrToInt(Objeto.GetNextKey(TNodo(tvMenu.Selected.Parent.Data), Nodo.Posicion));

            Nodo.Grupo := StrToInt(Objeto.GetNextKey(Nodo));

{           Nodo.Grupo:= q.FieldByName('NUM').asInteger + 1;
            Nodo.Posicion := q.FieldByName('POSICION').asInteger + 1;}
            Objeto.SecuGrupo.CVE_APLICACION.AsString := Nodo.Aplicacion;
            Objeto.SecuGrupo.CVE_MENU.AsString := Nodo.Menu;
            Objeto.SecuGrupo.ID_GPO_MENU.AsInteger := Nodo.Grupo;
            Objeto.SecuGrupo.NUM_POSICION.AsInteger := Nodo.Posicion;

            lbGMenu.Caption := TNodo(tvMenu.Selected.Parent.data).Desc;
            edGNombre.SetFocus;
         end;

      3: Begin
            Objeto.SecuFuncion.Funcion.Busca;

            q:= GetSqlQuery(
            ' SELECT Count(*) NUM, Nvl(Max(Num_Posicion),0) Posicion'+
            ' FROM Secu_Menu_Gpo_Fun'+
            ' WHERE Secu_Menu_Gpo_Fun.Cve_Aplicacion = '''+ Nodo.Aplicacion + '''' +
            '   and Secu_Menu_Gpo_Fun.Cve_Menu = ''' + Nodo.Menu + '''' +
            '   and Secu_Menu_Gpo_Fun.Id_Gpo_Menu = ' + IntToStr(Nodo.Grupo) ,
            Objeto.DataBaseName, Objeto.SessionName, False);

            Nodo.Funcion := Objeto.SecuFuncion.CVE_FUNCION.AsString;
            Nodo.Posicion := q.FieldByName('POSICION').asInteger + 1;
            Objeto.SecuFuncion.CVE_APLICACION.AsString := Nodo.Aplicacion;
            Objeto.SecuFuncion.CVE_MENU.AsString := Nodo.Menu;
            Objeto.SecuFuncion.ID_GPO_MENU.AsInteger := Nodo.Grupo;
            Objeto.SecuFuncion.CVE_FUNCION.AsString := Nodo.Funcion;
            Objeto.SecuFuncion.NUM_POSICION.AsInteger := Nodo.Posicion;

            lbFGrupo.Caption := TNodo(tvMenu.Selected.Parent.data).Desc;
            lbFMenu.Caption := TNodo(tvMenu.Selected.Parent.Parent.data).Desc;
      	end;
      end;

   finally
   	If q<> nil then q.Free;
   end;
end;



procedure TwMenuSegu.InterForma1DespuesAceptar(Sender: TObject);
Var	Datos: TNodo;
begin
	Try
   	tvMenu.SetFocus;
      
   	If (InterForma1.IsNewData) and (tvMenu.Selected.Level = 1) Then
      Begin
      	//Datos:= TNodo(tvMenu.Selected.Data);

			RunSQL(
         	'INSERT INTO'+
            ' Secu_Menu_Gpo(Cve_Aplicacion, Cve_Menu, Id_Gpo_Menu, B_Bloqueado, Num_Posicion, Tx_Desc_Gpo_Menu)'+
            '       Values ('''+ TINterFrame(Interforma1.InterFrame).FieldByName('CVE_APLICACION').asString + ''', ''' + TInterFrame(Interforma1.InterFrame).FieldByName('CVE_MENU').asString + ''', 1, ''F'', 1, ''Grupo 1'')',
            Objeto.DataBaseName, Objeto.SessionName, False);
      end;
   finally
	   RefrescaFuncion;
   	RefrescaMenu;
      Objeto.AltaRegistro:= False;
   end;
end;

procedure TwMenuSegu.InterForma1DespuesEliminar(Sender: TObject);
begin
   RefrescaFuncion;
   RefrescaMenu;
end;

procedure TwMenuSegu.InterForma1DespuesCancelar(Sender: TObject);
begin
	Objeto.AltaRegistro:= False;
   RefrescaFuncion;
   RefrescaMenu;
end;

procedure TwMenuSegu.edGNombreChange(Sender: TObject);
begin
	If InterForma1.CanEdit Then
   Begin
   	tvMenu.Selected.Text := edGNombre.Text;
   end;

end;

procedure TwMenuSegu.edMNombreChange(Sender: TObject);
begin
	If InterForma1.CanEdit Then
   Begin
   	tvMenu.Selected.Text := edMNombre.Text;
      edMDescripcion.Text := edMNombre.Text;
   end;
end;

procedure TwMenuSegu.InterForma1DespuesModificar(Sender: TObject);
begin
	Case tvMenu.Selected.Level of
   1:	edMNombre.SetFocus;
   2: edGNombre.SetFocus;
   3: edFPosicion.SetFocus;
   end;
end;

procedure TwMenuSegu.chbWarningClick(Sender: TObject);
begin
	Objeto.ShowWarning := chbWarning.Checked;
   Objeto.AskDelete := chbWarning.Checked;
end;

procedure TwMenuSegu.InterForma1Eliminar(Sender: TObject;
  var Realizado: Boolean);
begin
	Realizado:= False;
   If (Objeto.ShowWarning) Then
   Begin
	   If (tvMenu.Selected.HasChildren) Then
   	Begin
      	If Messagedlg('El Menu o Grupo a eliminar tiene dependientes, ¿Desea eliminarlos tambien?',mtConfirmation,[mbYES, mbNO], 0) = mrNO Then
	      Begin
   	   	Realizado:= True;
	     		Exit;
   	   end;
	   end
      else
      Begin
      	If Messagedlg('Delea eliminar el registro',mtConfirmation,[mbYES, mbNO], 0) = mrNO Then
	      Begin
   	   	Realizado:= True;
	     		Exit;
   	   end;
      end;
   end;

   EliminaArbol(tvMenu.Selected, tvMenu.Selected.Level);
   Realizado:= True;
end;

procedure TwMenuSegu.BitBtn1Click(Sender: TObject);
begin
	If Objeto.SecuFuncion.Funcion.Busca Then
	  	LocateTree(Objeto.SecuFuncion.Funcion,  Objeto.SecuFuncion.Funcion.CVE_FUNCION.asString);
end;

procedure TwMenuSegu.InterForma1CanEdit(Sender: TObject; CanEdit: Boolean);
begin If Objeto <> nil then Objeto.ShowCatalogo:= Not CanEdit;
end;

procedure TwMenuSegu.tvMenuChanging(Sender: TObject; Node: TTreeNode;
  var AllowChange: Boolean);
begin AllowChange := Objeto.ShowCatalogo;
end;

procedure TwMenuSegu.tvMenuKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	Case Key of
		VK_INSERT: InterForma1.Nuevo;
      VK_DELETE: InterForma1.Eliminar;
   end;
end;

procedure TwMenuSegu.SpeedButton1Click(Sender: TObject);
begin RefrescaMenu;
end;


procedure TwMenuSegu.SpeedButton2Click(Sender: TObject);
begin RefrescaFuncion;
end;

procedure TwMenuSegu.AgregarFuncin1Click(Sender: TObject);
Begin AgregarFuncin1Click(self);
end;

procedure TwMenuSegu.bAgregaFuncionClick(Sender: TObject);
Var	AplFun: TSecAplFun;
begin
	If Objeto.Aplicacion <> nil then
   Begin
		AplFun:= TSecAplFun.Create(self);
      Try
      	AplFun.Apli := Objeto.Apli;
         AplFun.Aplicacion := Objeto.Aplicacion;
         AplFun.Nuevo;
         RefrescaFuncion;
      Finally
         If AplFun <> nil then AplFun.Free;
      end;
   end;
end;

procedure TwMenuSegu.bEliminaFuncionClick(Sender: TObject);
Var	AplFun: TSecAplFun;
begin
	If (Objeto.Aplicacion <> nil) and (Funcion.Selected <> nil) then
   Begin
		AplFun:= TSecAplFun.Create(self);
      Try
      	AplFun.Apli := Objeto.Apli;
         AplFun.Aplicacion := Objeto.Aplicacion;
         AplFun.FindKey([TNodo(Funcion.Selected.Data).Aplicacion, TNodo(Funcion.Selected.Data).Funcion]);
         AplFun.Elimina;
         RefrescaFuncion;
      Finally
         If AplFun <> nil then AplFun.Free;
      end;
   end;
end;


procedure TwMenuSegu.FuncionKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	Case Key of
		VK_INSERT: bAgregaFuncionClick(Self);
      VK_DELETE: bEliminaFuncionClick(Self);
   end;
end;


Function TwMenuSegu.LocateTree(Frame: TInterFrame; CveFun: String): Boolean;
Var	Indice: Integer;
		Encontrado: Boolean;
Begin
	Indice:= 0;
   Encontrado:= False;
   CveFun:= UpperCase(CveFun);
	While (Indice < Funcion.Items.Count) and (Not Encontrado) do
   Begin
   	If TNodo(Funcion.Items.Item[Indice].Data).Funcion = CveFun Then Encontrado:= True
      else Inc(Indice);
   end;

   if Encontrado then
   Begin
      Funcion.Selected := Funcion.Items.Item[Indice];
      Funcion.Selected.MakeVisible;
   end
   else Frame.Active := False;

   Result := Encontrado;
end;


Procedure TwMenuSegu.CambioNodo;
Var Datos: TNodo;
Begin
		TimerMenu.Enabled := False;
      NumTimerMenu := 0;
      Objeto.IsMoving:= False;

      if (tvMenu.Selected.Level = 1) then gbMenu.BringToFront;
      if (tvMenu.Selected.Level = 2) then gbGrupo.BringToFront;
      if (tvMenu.Selected.Level = 3) then gbFuncion.BringToFront;

      gbMenu.Visible   := (tvMenu.Selected.Level = 1);
      gbGrupo.Visible  := (tvMenu.Selected.Level = 2);
      gbFuncion.Visible:= (tvMenu.Selected.Level = 3);


      If Not Objeto.AltaRegistro Then
      Begin
         Datos:= TNodo(tvMenu.Selected.Data);
         Case tvMenu.Selected.Level of
         0:	Begin
               InterForma1.InterFrame := nil;
            end;

         1: Begin
               Objeto.SecuMenu.FindKey([Datos.Aplicacion, Datos.Menu]);
               InterForma1.InterFrame := Objeto.SecuMenu;
            end;

         2: Begin
               Objeto.SecuGrupo.FindKey([Datos.Aplicacion, Datos.Menu, IntToStr(Datos.Grupo)]);
               InterForma1.InterFrame := Objeto.SecuGrupo;
            end;

         3: Begin
               Objeto.SecuFuncion.FindKey([Datos.Aplicacion, Datos.Menu, IntToStr(Datos.Grupo), Datos.Funcion]);
               InterForma1.InterFrame := Objeto.SecuFuncion;
            end;
         end;
      end;

end;


procedure TwMenuSegu.TimerMenuTimer(Sender: TObject);

begin
	If NumTimerMenu = 3 Then CambioNodo
   else Inc(NumTimerMenu);
end;

procedure TwMenuSegu.InterForma1AntesEliminar(Sender: TObject;
  var Realizado: Boolean);
begin
	if (objeto <> nil) Then
   begin
   	While Objeto.IsMoving do application.ProcessMessages;
   end;
end;

procedure TwMenuSegu.InterForma1AntesModificar(Sender: TObject;
  var Realizado: Boolean);
begin
	if (objeto <> nil) Then
   begin
   	While Objeto.IsMoving do application.ProcessMessages;
   end;

end;

procedure TwMenuSegu.InterForma1AntesNuevo(Sender: TObject;
  var Realizado: Boolean);
begin
	if (objeto <> nil) Then
   begin
   	While Objeto.IsMoving do application.ProcessMessages;
   end;

end;

end.
