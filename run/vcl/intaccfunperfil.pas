unit IntAccFunPerfil;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, InterFor,
  IntFrm, ComCtrls, StdCtrls, UnSql2, Buttons, IntLinkit, ExtCtrls, IntSecGpAcc,
  IntSecuAplFun, IntSecuFunci, IntSecuPerfi, IntSecuAplUsr, Mask, ImgList;

Const 							{þ --> OK     o --> VACIO    FONT: Windings}
{	cSI = 'þ';
   cNO = 'o';}
	cSI = 'x';
   cNO = '';
   cIncremento = 5;

type
	TNodo = class
   	Aplicacion: String;
      Menu		 : String;
      Grupo     : Integer;
      Funcion	 : String;
      Perfil    : String;
      Nombre	 : String;
      Desc		 : String;
      Posicion  : Integer;
      Nivel     : Integer;
   end;

   TLastNodo = Record
   	Aplicacion: String;
      Menu		 : String;
      Grupo     : Integer;
      Funcion	 : String;
   end;

	TAccFunPer = class;

   TwAccFunPer = class(TForm)
    InterForma1: TInterForma;
    lvAcceso: TListView;
    lbHeaderAplicacion: TLabel;
    lbHeaderClase: TLabel;
    InterLinkit1: TInterLinkit;
    GroupBox1: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    chbBHorario: TCheckBox;
    chbBWarning: TCheckBox;
    Bevel1: TBevel;
    Bevel2: TBevel;
    chbInvertir: TCheckBox;
    chbBBloqueado: TCheckBox;
    lbAplicacion: TLabel;
    rgSeleccion: TRadioGroup;
    gbPerfil: TGroupBox;
    edCveFuncion: TEdit;
    BitBtn1: TBitBtn;
    edNomFuncion: TEdit;
    Label1: TLabel;
    gbFuncion: TGroupBox;
    Label2: TLabel;
    edIdGpoAcceso: TEdit;
    BitBtn2: TBitBtn;
    edNomGpoAcceso: TEdit;
    lbNomFuncion: TLabel;
    lbNomGpoAcceso: TLabel;
    Panel1: TPanel;
    InterLinkit2: TInterLinkit;
    lbNomUsuario: TLabel;
    ImagenAcceso: TImageList;
    TimerMenu: TTimer;
    edHMinimaEjec: TMaskEdit;
    edHMaximaEjec: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure lvAccesoColumnClick(Sender: TObject; Column: TListColumn);
    procedure InterLinkit1Ejecuta(Sender: TObject);
    procedure InterLinkit1Capture(Sender: TObject; var Show: Boolean);
    procedure lvAccesoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lvAccesoDblClick(Sender: TObject);
    procedure lvAccesoChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure FormHide(Sender: TObject);
    procedure rgSeleccionClick(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure lvAccesoChanging(Sender: TObject; Item: TListItem;
      Change: TItemChange; var AllowChange: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure InterLinkit2Capture(Sender: TObject; var Show: Boolean);
    procedure InterLinkit2Ejecuta(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure InterForma1Aceptar(Sender: TObject; var Realizado: Boolean);
    procedure chbBHorarioClick(Sender: TObject);
    procedure chbBWarningClick(Sender: TObject);
    procedure InterForma1Modificar(Sender: TObject;
      var Realizado: Boolean);
    procedure TimerMenuTimer(Sender: TObject);
   private
    { Private declarations }
      NumTimerMenu: Integer;
		ItemTimerMenu: TListItem;
	   ChangeTimerMenu: TItemChange;
   public
    { Public declarations }
		Objeto: TAccFunPer;
      DobleClick: Boolean;

      Procedure RefrescaMenu;
      Function RefrescaIndiceImagen(Bloq, Hor, War: Boolean): Integer;
      Function LimpiaMenu: TLastNodo;
      Function MouseToCol(X,Y: Integer): Integer;
      Function ModificaAcceso(ListaItem: TListItem; Columna: Integer; InvertirValor: Boolean): Boolean;
      Function EfectuaModificacion(Apl, Per, Fun, Campo: String; Valor: String): Boolean;
      Function LocateList(Frame: TInterFrame; CveFun: String): Boolean;
   end;


   TAccFunPer = Class(TInterFrame)
   Private
      FAplicacion: TInterFrame;
   	FShowCatalogo: Boolean;
      FPorPerfil: Boolean;
      FSeleccion: Integer;
   Protected
	   PerfilAplicacion, PerfilClases: String;
   	DescPerfilApl, DescPerfilClase: String;

      Procedure SetAplicacion(Frame: TInterFrame);
   Public
      Cve_Aplicacion : TInterCampo;
      Id_Gpo_Acceso	: TInterCampo;
      Cve_Funcion		: TInterCampo;
      B_Bloqueado		: TInterCampo;
      B_Acc_Alta		: TInterCampo;
      B_Acc_Baja		: TInterCampo;
      B_Acc_Cons		: TInterCampo;
      B_Acc_Modif		: TInterCampo;
      B_Horario		: TInterCampo;
      B_Warning		: TInterCampo;
      H_Maxima_Ejec 	: TInterCampo;
      H_Minima_Ejec	: TInterCampo;
      B_Acc_Cata		: TInterCampo;

      Perfil: TSecuPerfi;
      Funcion: TSecuFunci;

      Perfil_Apli: TSecGpAcc;
      Funcion_Apli: TSecAplFun;
      Usuario_Apli: TSecAplUsr;
		constructor Create(AOwner: TComponent ); override;
     	Destructor  Destroy; override;
     	Procedure   DataBaseChange; Override;
     	Function    ShowWindow(FormaTipo: TFormaTipo): Integer; override;

     	Property Aplicacion: TInterFrame Read FAplicacion Write SetAplicacion;
      Property ShowCatalogo: Boolean Read FShowCatalogo Write FShowCatalogo;
      Property PorPerfil: Boolean Read FPorPerfil Write FPorPerfil;
      Property Seleccion: Integer Read FSeleccion Write FSeleccion;
   end;


var
  wAccFunPer: TwAccFunPer;

implementation

{$R *.DFM}


{**************************************************************************}
{															FRAME									}
{**************************************************************************}

constructor TAccFunPer.Create(AOwner: TComponent );
Begin
	inherited;
   Cve_Aplicacion := CreaCampo('CVE_APLICACION', ftString, tsNinguno, tsNinguno,True);
   	Cve_Aplicacion.Size := 6;
   Id_Gpo_Acceso	:= CreaCampo('ID_GPO_ACCESO', ftInteger, tsNinguno,tsNinguno,True);
   Cve_Funcion		:= CreaCampo('CVE_FUNCION', ftString, tsNinguno,tsNinguno,True);
   	Cve_Funcion.Size := 16;
   B_Bloqueado		:= CreaCampo('B_BLOQUEADO', ftString, tsNinguno,tsNinguno,True);
   	B_Bloqueado.Size := 1;
   B_Acc_Cata		:= CreaCampo('B_ACC_CATA', ftString, tsNinguno,tsNinguno,True);
   	B_Acc_Cata.Size := 1;
   B_Acc_Cons		:= CreaCampo('B_ACC_CONS', ftString, tsNinguno,tsNinguno,True);
   	B_Acc_Cons.Size := 1;
   B_Acc_Alta		:= CreaCampo('B_ACC_ALTA', ftString, tsNinguno,tsNinguno,True);
   	B_Acc_Alta.Size := 1;
   B_Acc_Baja		:= CreaCampo('B_ACC_BAJA', ftString, tsNinguno,tsNinguno,True);
   	B_Acc_Baja.Size := 1;
   B_Acc_Modif		:= CreaCampo('B_ACC_MODIF', ftString, tsNinguno,tsNinguno,True);
   	B_Acc_Modif.Size:= 1;
   B_Horario		:= CreaCampo('B_HORARIO', ftString, tsNinguno,tsNinguno,True);
   	B_Horario.Size := 1;
   B_Warning		:= CreaCampo('B_WARNING', ftString, tsNinguno,tsNinguno,True);
   	B_Warning.Size := 1;
   H_Maxima_Ejec	:= CreaCampo('H_MAXIMA_EJEC', ftString, tsNinguno,tsNinguno,True);
   	H_Maxima_Ejec.Size := 6;
   H_Minima_Ejec	:= CreaCampo('H_MINIMA_EJEC', ftString, tsNinguno,tsNinguno,True);
   	H_Minima_Ejec.Size := 6;

   Perfil:= TSecuPerfi.Create(self);
   Perfil.MasterSource := self;
   Perfil.ID_GPO_ACCESO.MasterField := 'ID_GPO_ACCESO';

   Funcion:= TSecuFunci.Create(self);
   Funcion.MasterSource := self;
   Funcion.CVE_FUNCION.MasterField := 'CVE_FUNCION';

   Perfil_Apli:= TSecGpAcc.Create(self);
   Funcion_Apli:= TSecAplFun.Create(self);
   Usuario_Apli:= TSecAplUsr.Create(self);

   PorPerfil:= True;
   Seleccion:= -1;
   PerfilAplicacion:= '';
   PerfilClases:= '';
   DescPerfilApl:= '';
   DescPerfilClase:= '';

	B_Bloqueado.NoClear := True;
   B_Horario.NoClear := True;
   B_Warning.NoClear := True;
   H_Maxima_Ejec.NoClear := True;
   H_Minima_Ejec.NoClear := True;

   TableName := 'SECU_FUN_AUT_GPO';
   UseQuery := True;
   FKeyFields.Add('CVE_APLICACION');
   FKeyFields.Add('ID_GPO_ACCESO');
   FKeyFields.Add('CVE_FUNCION');

   ShowCatalogo := False;
end;

Destructor TAccFunPer.Destroy;
Begin inherited;
end;

Procedure TAccFunPer.DataBaseChange;
Begin
	inherited;
   Perfil_Apli.GetParams(self);
   Funcion_Apli.GetParams(self);
   Usuario_Apli.GetParams(self);
end;

Function TAccFunPer.ShowWindow(FormaTipo: TFormaTipo): Integer;
var W: TwAccFunPer;
begin
   W:= TwAccFunPer.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= nil;
      W.InterForma1.FormaTipo := ftGrid;   //ftConsulta;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.CentrarForma := True;
      W.InterForma1.ShowBtnNuevo := False;
      W.InterForma1.ShowBtnEliminar := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Procedure TAccFunPer.SetAplicacion(Frame: TInterFrame);
Begin
	FAplicacion := Frame;
   Perfil_Apli.SecuApli := Frame;
   Funcion_Apli.Aplicacion := Frame;
   Usuario_Apli.Aplicacion := Frame;

	If Frame <> nil then
   Begin
   	ShowCatalogo := True;
      Funcion.BuscaWhereString := 'Secu_Funcion.Cve_Funcion in (Select Distinct Cve_funcion from secu_apl_fun where Cve_Aplicacion = '''+ Aplicacion.FieldByName('CVE_APLICACION').asString +''')';
   end;
end;


(***************************************************************************)
(*															FORMA		 							*)
(***************************************************************************)

procedure TwAccFunPer.FormShow(Sender: TObject);
begin
   if Objeto.Aplicacion <> nil then
   Begin
   	lbAplicacion.Caption := Objeto.Aplicacion.FieldByName('NOM_APLICACION').asString;
//	  	RefrescaMenu;
   end;

   Objeto.B_Bloqueado.Control := chbBBloqueado;
   Objeto.B_Horario.Control 	:= chbBHorario;
   Objeto.B_Warning.Control	:= chbBWarning;
   Objeto.H_Maxima_Ejec.Control:= edHMaximaEjec;
   Objeto.H_Minima_Ejec.Control:= edHMinimaEjec;
   Objeto.Cve_Funcion.Control := edCveFuncion;
   Objeto.Id_Gpo_Acceso.Control:= edIdGpoAcceso;
   Objeto.Perfil.NOM_GPO_ACCESO.Control := edNomGpoAcceso;
   Objeto.Funcion.NOM_FUNCION.Control := edNomFuncion;

   Objeto.Perfil_Apli.Perfil.NOM_GPO_ACCESO.Control := lbNomGpoAcceso;
   Objeto.Funcion_Apli.Funcion.NOM_FUNCION.Control := lbNomFuncion;
   Objeto.Usuario_Apli.Usuario.eMPLEADO.PERSONA.Nombre.Control := lbNomUsuario;

   NumTimerMenu:= 0;
   rgSeleccion.ItemIndex := 0;
end;

procedure TwAccFunPer.FormHide(Sender: TObject);
begin
   Objeto.B_Bloqueado.Control := nil;
   Objeto.B_Horario.Control 	:= nil;
   Objeto.B_Warning.Control	:= nil;
   Objeto.H_Maxima_Ejec.Control:= nil;
   Objeto.H_Minima_Ejec.Control:= nil;
   Objeto.Cve_Funcion.Control := nil;
   Objeto.Id_Gpo_Acceso.Control:= nil;
   Objeto.Perfil.NOM_GPO_ACCESO.Control := nil;
   Objeto.Funcion.NOM_FUNCION.Control := nil;

   Objeto.Perfil_Apli.Perfil.NOM_GPO_ACCESO.Control := nil;
   Objeto.Funcion_Apli.Funcion.NOM_FUNCION.Control := nil;
   Objeto.Usuario_Apli.Usuario.eMPLEADO.PERSONA.Nombre.Control := nil;
	LimpiaMenu;
end;



Function TwAccFunPer.LimpiaMenu: TLastNodo;
Var
	Cont: Integer;
   Resultado: TLastNodo;
Begin
	Objeto.ShowCatalogo := False;

   If lvAcceso.Selected <> nil then
   Begin
      Resultado.Aplicacion:= TNodo(lvAcceso.Selected.Data).aplicacion;
      Resultado.Menu      := TNodo(lvAcceso.Selected.Data).Menu;
      Resultado.Grupo     := TNodo(lvAcceso.Selected.Data).Grupo;
      Resultado.Funcion   := TNodo(lvAcceso.Selected.Data).Funcion;
   end
   else
   	Begin
         Resultado.Aplicacion:= '';
         Resultado.Menu      := '';
         Resultado.Grupo     := 0;
         Resultado.Funcion   := '';
      end;

	For Cont:=0 To lvAcceso.Items.Count-1 do
   Begin
   	TNodo((lvAcceso.Items.Item[Cont]).Data).Free;
      //if lvAcceso.Items.Item[Cont].SubItems <> nil then lvAcceso.Items.Item[Cont].SubItems.Free;
   end;

   lvAcceso.Items.Clear;
   Objeto.ShowCatalogo := True;
   Result := Resultado;
end;


Function TwAccFunPer.RefrescaIndiceImagen(Bloq, Hor, War: Boolean): Integer;
Begin
   If (Bloq) then
   Begin
      If (Hor) or (War) Then Result:= 2
      else Result:= 1;
   end
   else
   Begin
      If (Hor) or (War) Then Result:= 0;
   end;
end;



Procedure TwAccFunPer.RefrescaMenu;
Var
	qMenu, q: TQuery;
   ListItem: TListItem;
   Resultado: TLastNodo;
   Nodo: TNodo;
   LMen, LGpo, LFun: String;
   Nivel: Integer;
   CampoCaptionLista: String;
   CambiaRegistro: Boolean;

   Function ComoBoolean(Valor: String): Boolean;
   Begin
   	If (UpperCase(Valor) = 'V') or (UpperCase(Valor) = 'T')  then Result := True
      else Result := False;
   end;


   Function Caracter(Indice: Integer): String;
   Begin
   	Result := '';

      Case Indice of
         1: Result := qMenu.FieldByname('B_Acc_CataA').asString;
         2: Result := qMenu.FieldByname('B_Acc_ConsA').asString;
         3: Result := qMenu.FieldByname('B_Acc_AltaA').asString;
         4: Result := qMenu.FieldByname('B_Acc_BajaA').asString;
         5: Result := qMenu.FieldByname('B_Acc_ModifA').asString;  //6 = separador
         7: Result := qMenu.FieldByname('B_Acc_CataC').asString;
         8: Result := qMenu.FieldByname('B_Acc_ConsC').asString;
         9: Result := qMenu.FieldByname('B_Acc_AltaC').asString;
         10: Result := qMenu.FieldByname('B_Acc_BajaC').asString;
         11: Result := qMenu.FieldByname('B_Acc_ModifC').asString;
         else Result := 'F';
      end;

      If Result = 'V' Then Result:= cSI
      else if Result = 'F' Then Result:= cNO;
   end;



   Procedure AddSqlAcceso(Datos: Boolean; pNivel: Integer);
   Var Inicio: Integer;
   	 Cont: Integer;
       Per, Fun: String;
       IndiceImagen: Integer;
   Begin
      ListItem:= lvAcceso.Items.Add;
      ListItem.Caption:= Copy('                      ', 1, pNivel * cIncremento) + Nodo.Nombre;
      ListItem.Data := Nodo;
      IndiceImagen:= -1;

      If (qMenu <> nil) and (Nodo.Funcion <> '') then
      Begin
      	IndiceImagen:= RefrescaIndiceImagen(
         		ComoBoolean(qMenu.FieldByName('B_BLOQUEADOA').AsString),
            	ComoBoolean(qMenu.FieldByName('B_HORARIOA').AsString),
               ComoBoolean(qMenu.FieldByName('B_WARNINGA').AsString));
      end;

      ListItem.ImageIndex := IndiceImagen;

      If Datos Then
	      For Cont := 1 to 11 do
         	lvAcceso.Items.Item[ListItem.Index].SubItems.Add(Caracter(Cont));
   end;



   Procedure RefrescaMenuFuncion;
	Begin
	   	If Not Objeto.Funcion_Apli.Active Then Exit;

         qMenu:= GetSqlQuery(
              ' SELECT'+
              ' 	 Secu_Gpo_Acceso.Cve_Aplicacion,'+
              '    Secu_Gpo_Acceso.Id_Gpo_Acceso,'+
              '    Secu_Perfil.Nom_Gpo_Acceso,'+
              '    Secu_Perfil.Tx_Desc_Gpo_Ac,'+
              '    Apl.Id_Gpo_Acceso 	Id_Gpo_AccesoA,'+
              '    Apl.B_Bloqueado   	B_BloqueadoA,'+
              '    Apl.B_Acc_Cata		B_Acc_CataA,'+
              '    Apl.B_Acc_Cons		B_Acc_ConsA,'+
              '    Apl.B_Acc_Alta		B_Acc_AltaA,'+
              '    Apl.B_Acc_Baja		B_Acc_BajaA,'+
              '    Apl.B_Acc_Modif		B_Acc_ModifA,'+
              '    Apl.B_Horario			B_HorarioA,'+
              '    Apl.B_Warning			B_WarningA,'+
              '    Apl.H_MAxima_Ejec	H_MAxima_EjecA,'+
              '    Apl.H_Minima_Ejec	H_Minima_EjecA,'+
              '    Clase.Id_Gpo_Acceso Id_Gpo_AccesoC,'+
              '    Clase.B_Bloqueado   B_BloqueadoC,'+
              '    Clase.B_Acc_Cata		B_Acc_CataC,'+
              '    Clase.B_Acc_Cons		B_Acc_ConsC,'+
              '    Clase.B_Acc_Alta		B_Acc_Altac,'+
              '    Clase.B_Acc_Baja		B_Acc_BajaC,'+
              '    Clase.B_Acc_Modif	B_Acc_ModifC,'+
              '    Clase.B_Horario		B_HorarioC,'+
              '    Clase.B_Warning		B_WarningC,'+
              '    Clase.H_MAxima_Ejec	H_MAxima_EjecC,'+
              '    Clase.H_Minima_Ejec	H_Minima_EjecC'+
              ' FROM'+
              '    Secu_Gpo_Acceso, Secu_Perfil,'+
              '    secu_fun_aut_gpo Apl,'+
              '    secu_fun_aut_gpo Clase'+
              ' WHERE'+
              '    Secu_Gpo_Acceso.Cve_Aplicacion = ''' + Objeto.Aplicacion.FieldByName('CVE_APLICACION').asString + '''' +
              '    and Secu_Gpo_Acceso.Id_Gpo_Acceso = Secu_Perfil.Id_Gpo_Acceso'+
              '    and Apl.cve_Aplicacion(+) = Secu_Gpo_Acceso.Cve_Aplicacion'+
              '    and Apl.cve_funcion(+) = ''' + Objeto.Funcion_Apli.CVE_FUNCION.AsString + '''' +
              '    and Apl.id_gpo_acceso(+) = Secu_Gpo_Acceso.Id_Gpo_Acceso'+
              '    and Clase.cve_Aplicacion(+) = ''CLASE''' +
              '    and Clase.cve_funcion(+) = ''' + Objeto.Funcion_Apli.CVE_FUNCION.AsString + '''' +
              '    and Clase.id_gpo_acceso(+) = Secu_Gpo_Acceso.Id_Gpo_Acceso'+
              ' ORDER BY Secu_Perfil.Nom_Gpo_Acceso',
         Objeto.DataBaseName, Objeto.SessionName, False);

         Try
         While (qMenu <> nil) and (Not qMenu.Eof) do
         Begin
            Nodo:= TNodo.Create;				{CREACION DEL NODO FUNCION}
            Nodo.Aplicacion:= qMenu.FieldByName('CVE_APLICACION').asString;
            Nodo.Funcion   := Objeto.Funcion_Apli.CVE_FUNCION.AsString;
            Nodo.Perfil    := qMenu.FieldByName('ID_GPO_ACCESO').asString;
            Nodo.Nombre    := qMenu.FieldByName('NOM_GPO_ACCESO').asString;
            Nodo.Desc      := qMenu.FieldByName('NOM_GPO_ACCESO').asString;
            AddSqlAcceso(True, 1);
            qMenu.Next;
         end;
         Finally
            if (qMenu <> nil) then qMenu.Free;
         end;
	end;



   Procedure RefrescaMenuMenu;
	Begin
	   	If (Not Objeto.Perfil_Apli.Active) Then Exit;
         If Objeto.PerfilClases = '' then Objeto.PerfilClases := '-1';

         qMenu:= GetSqlQuery(
              ' Select'+
              '    Secu_menu_gpo_fun.*,'+
              '    Secu_menu.Nom_Menu,'+
              '    Secu_menu_gpo.tx_desc_gpo_menu,'+
              '    Secu_Funcion.Nom_funcion,'+
              '    Apl.Id_Gpo_Acceso 	Id_Gpo_AccesoA,'+
              '    Apl.B_Bloqueado   	B_BloqueadoA,'+
              '    Apl.B_Acc_Cata		B_Acc_CataA,'+
              '    Apl.B_Acc_Cons		B_Acc_ConsA,'+
              '    Apl.B_Acc_Alta		B_Acc_AltaA,'+
              '    Apl.B_Acc_Baja		B_Acc_BajaA,'+
              '    Apl.B_Acc_Modif		B_Acc_ModifA,'+
              '    Apl.B_Horario			B_HorarioA,'+
              '    Apl.B_Warning			B_WarningA,'+
              '    Apl.H_MAxima_Ejec	H_MAxima_EjecA,'+
              '    Apl.H_Minima_Ejec	H_Minima_EjecA,'+
              '    Clase.Id_Gpo_Acceso Id_Gpo_AccesoC,'+
              '    Clase.B_Bloqueado   B_BloqueadoC,'+
              '    Clase.B_Acc_Cata		B_Acc_CataC,'+
              '    Clase.B_Acc_Cons		B_Acc_ConsC,'+
              '    Clase.B_Acc_Alta		B_Acc_Altac,'+
              '    Clase.B_Acc_Baja		B_Acc_BajaC,'+
              '    Clase.B_Acc_Modif	B_Acc_ModifC,'+
              '    Clase.B_Horario		B_HorarioC,'+
              '    Clase.B_Warning		B_WarningC,'+
              '    Clase.H_MAxima_Ejec	H_MAxima_EjecC,'+
              '    Clase.H_Minima_Ejec	H_Minima_EjecC'+
              '    From'+
              '       Secu_menu_gpo_fun,'+
              '       secu_menu_gpo,'+
              '       secu_menu,'+
              '       Secu_Funcion,'+
              '       secu_fun_aut_gpo Apl,'+
              '       secu_fun_aut_gpo Clase'+
              '    where'+
              '       secu_menu_gpo_fun.cve_aplicacion = '''+ Objeto.Aplicacion.FieldByName('CVE_APLICACION').asString +''''+
              '       and Secu_menu.cve_aplicacion = secu_menu_gpo_fun.cve_aplicacion'+
              '       and Secu_menu.cve_menu = secu_menu_gpo_fun.cve_menu'+
              '       and Secu_menu_gpo.cve_aplicacion = Secu_menu.cve_aplicacion'+
              '       and Secu_menu_gpo.cve_menu = Secu_menu.cve_menu'+
              '       and Secu_menu_gpo.id_gpo_menu = secu_menu_gpo_fun.id_gpo_menu'+
              '       and Secu_Funcion.cve_funcion = secu_menu_gpo_fun.cve_funcion'+
              '       and Apl.cve_Aplicacion(+)= secu_menu_gpo_fun.cve_aplicacion'+
              '       and Apl.cve_funcion(+)= secu_menu_gpo_fun.cve_funcion'+
              '       and Apl.id_gpo_acceso(+)= '+ Objeto.PerfilAplicacion +
              '       and Clase.cve_Aplicacion(+)=''CLASE'''+
              '       and Clase.cve_funcion(+)=secu_menu_gpo_fun.cve_funcion'+
              '       and Clase.id_gpo_acceso(+)= ' + Objeto.PerfilClases +
              '    Order by'+
              '       secu_menu.Num_posicion,'+
              '       secu_menu.cve_menu,'+
              '       secu_menu_gpo.num_posicion,'+
              '       secu_menu_gpo.id_gpo_menu,'+
              '       secu_menu_gpo_fun.num_posicion,'+
              '       secu_menu_gpo_fun.cve_funcion',
         Objeto.DataBaseName, Objeto.SessionName, False);

         Try
            LMen:= '';
            LGpo:= '';
            LFun:= '';
            Nivel:= 0;

            While (qMenu <> nil) and (NOT qMenu.EOF) do
            begin
               If LMen <> qMenu.FieldByName('CVE_MENU').asString Then
               Begin Nivel:= 1;
                     LMen := qMenu.FieldByName('CVE_MENU').asString;
                     LGpo := '';
                     LFun := '';
                     CampoCaptionLista:= 'NOM_MENU';
                     CambiaRegistro:= False;
               end
               else If LGpo <> qMenu.FieldByName('ID_GPO_MENU').asString Then
                  Begin Nivel:= 2;
                        LGpo := qMenu.FieldByName('ID_GPO_MENU').asString;
                        LFun := '';
                        CampoCaptionLista:= 'TX_DESC_GPO_MENU';
                        CambiaRegistro:= False;
                  end
                  else If LFun <> qMenu.FieldByName('CVE_FUNCION').asString Then
                     Begin Nivel:= 3;
                           LFun := qMenu.FieldByName('CVE_FUNCION').asString;
                           CampoCaptionLista:= 'NOM_FUNCION';
                           CambiaRegistro:= True;
                     end;


               Nodo:= TNodo.Create;				{CREACION DEL NODO DE LA LISTA}
               Nodo.Aplicacion:= qMenu.FieldByName('CVE_APLICACION').asString;
               Nodo.Menu      := qMenu.FieldByName('CVE_MENU').asString;
               Nodo.Perfil		:= Objeto.PerfilAplicacion; //Objeto.Perfil_Apli.ID_GPO_ACCESO.AsString;
               Nodo.Nombre    := qMenu.FieldByName(CampoCaptionLista).asString;
               Nodo.Desc      := qMenu.FieldByName(CampoCaptionLista).asString;
               Nodo.Posicion  := 0;

               If nivel > 1 Then Nodo.Grupo:= qMenu.FieldByName('ID_GPO_MENU').asInteger
               else Nodo.Grupo:= 0;

               If nivel > 2 Then Nodo.Funcion:= qMenu.FieldByName('CVE_FUNCION').asString
               else Nodo.Funcion:= '';

               AddSqlAcceso(CambiaRegistro, Nivel);
               If CambiaRegistro Then qMenu.Next;
            end;
         Finally
            If qMenu <> nil Then qMenu.Free; qMenu:= nil;
         end;
                                 {**************************************
                                       FUNCIONES AGREGADAS AL MENU
                                 ***************************************}
         Nodo:= TNodo.Create;				{CREACION DEL NODO SEPARACION}
         Nodo.Aplicacion:= Objeto.Aplicacion.FieldByName('CVE_APLICACION').asString;
         Nodo.Nombre		:= '';
         Nodo.Desc  		:= '';
         Nodo.Posicion  := 0;
         AddSqlAcceso(False, 0);
         Nodo:= TNodo.Create;				{CREACION DEL NODO SEPARACION 2}
         Nodo.Aplicacion:= Objeto.Aplicacion.FieldByName('CVE_APLICACION').asString;
         Nodo.Nombre		:= '';
         Nodo.Desc  		:= '';
         Nodo.Posicion  := 0;
         AddSqlAcceso(False, 0);
         Nodo:= TNodo.Create;				{CREACION DEL NODO FUNCIONES AGREGADAS AL MENU}
         Nodo.Aplicacion:= Objeto.Aplicacion.FieldByName('CVE_APLICACION').asString;
         Nodo.Nombre		:= 'Funciones que NO forman parte del menú';
         Nodo.Desc  		:= 'Funciones que NO forman parte del menú';
         Nodo.Posicion  := 0;
         AddSqlAcceso(False, 0);

         qMenu:= GetSqlQuery(
            ' Select'+
            '	Secu_Funcion.Cve_Funcion,'+
            '   Secu_Funcion.Nom_Funcion,'+
            '   Secu_Funcion.Tx_Desc_Funcion,'+
            '   Apl.Id_Gpo_Acceso 	Id_Gpo_AccesoA,'+
            '	 Apl.B_Bloqueado   	B_BloqueadoA,'+
            '   Apl.B_Acc_Cata		B_Acc_CataA,'+
            '   Apl.B_Acc_Cons		B_Acc_ConsA,'+
            '   Apl.B_Acc_Alta		B_Acc_AltaA,'+
            '   Apl.B_Acc_Baja		B_Acc_BajaA,'+
            '   Apl.B_Acc_Modif		B_Acc_ModifA,'+
            '   Apl.B_Horario			B_HorarioA,'+
            '   Apl.B_Warning			B_WarningA,'+
            '   Apl.H_MAxima_Ejec	H_MAxima_EjecA,'+
            '   Apl.H_Minima_Ejec	H_Minima_EjecA,'+
            '   Clase.Id_Gpo_Acceso Id_Gpo_AccesoC,'+
            '   Clase.B_Bloqueado   B_BloqueadoC,'+
            '   Clase.B_Acc_Cata		B_Acc_CataC,'+
            '   Clase.B_Acc_Cons		B_Acc_ConsC,'+
            '   Clase.B_Acc_Alta		B_Acc_Altac,'+
            '   Clase.B_Acc_Baja		B_Acc_BajaC,'+
            '   Clase.B_Acc_Modif	B_Acc_ModifC,'+
            '   Clase.B_Horario		B_HorarioC,'+
            '   Clase.B_Warning		B_WarningC,'+
            '   Clase.H_MAxima_Ejec	H_MAxima_EjecC,'+
            '   Clase.H_Minima_Ejec	H_Minima_EjecC'+
            ' FROM'+
            ' 	 Secu_fun_aut_gpo Apl,'+
            '   Secu_fun_aut_gpo Clase,'+
            '	 Secu_Funcion,'+
            '	(SELECT Distinct Cve_Funcion'+
            '		FROM Secu_Apl_Fun'+
            '		WHERE Cve_Aplicacion = ''' + Objeto.Aplicacion.FieldByName('CVE_APLICACION').asString + '''' +
            '	 MINUS'+
            '		SELECT Distinct Cve_Funcion'+
            '		FROM Secu_Menu_Gpo_Fun'+
            '		WHERE Cve_Aplicacion = ''' + Objeto.Aplicacion.FieldByName('CVE_APLICACION').asString + ''') Funcion_Menu' +
            ' WHERE'+
            '   Secu_Funcion.Cve_Funcion = Funcion_Menu.Cve_Funcion'+
            '	 and Apl.cve_Aplicacion(+) = ''' + Objeto.Aplicacion.FieldByName('CVE_APLICACION').asString + '''' +
            '   and Apl.cve_funcion(+) = Funcion_Menu.Cve_Funcion'+
            '   and Apl.id_gpo_acceso(+) = '+ Objeto.PerfilAplicacion +
            '   and Clase.cve_Aplicacion(+) = ''CLASE'''+
            '   and Clase.cve_funcion(+) = Funcion_Menu.Cve_Funcion'+
            '   and Clase.id_gpo_acceso(+) = '+ Objeto.PerfilClases +
            ' ORDER BY Secu_Funcion.Nom_Funcion',
            Objeto.DataBaseName, Objeto.SessionName, False);

         Try
            While (qMenu <> nil) and (NOT qMenu.EOF) do
            begin
               Nodo:= TNodo.Create;				{CREACION DEL NODO FUNCION}
               Nodo.Aplicacion:= Objeto.Aplicacion.FieldByName('CVE_APLICACION').asString;
               Nodo.Funcion   := '';
               Nodo.Grupo := 0;
               Nodo.Funcion   := qMenu.FieldByName('CVE_FUNCION').asString;
               Nodo.Perfil		:= Objeto.PerfilAplicacion; //Objeto.Perfil_Apli.ID_GPO_ACCESO.AsString;
               Nodo.Nombre    := qMenu.FieldByName('NOM_FUNCION').asString;
               Nodo.Desc      := qMenu.FieldByName('TX_DESC_FUNCION').asString;
               Nodo.Posicion  := 1;
               AddSqlAcceso(True, 1);
               qMenu.Next;
            end;
         Finally
            If qMenu <> nil Then qMenu.Free;
         end;
   end;




Begin
	Resultado := LimpiaMenu;

	If (Objeto.Aplicacion = nil) then Exit;


   Nodo:= TNodo.Create;				{CREACION DEL NODO APLICACION}
   Nodo.Aplicacion:= Objeto.Aplicacion.FieldByName('CVE_APLICACION').asString;
   Nodo.Nombre		:= Objeto.Aplicacion.FieldByName('NOM_APLICACION').asString;
   Nodo.Desc  		:= Objeto.Aplicacion.FieldByName('TX_DESC_APLI').asString;
   Nodo.Posicion  := 0;
   AddSqlAcceso(False, 0);

	If Objeto.PorPerfil Then
   Begin
      If rgSeleccion.ItemIndex = 0 Then
      Begin
         Objeto.PerfilAplicacion:= Objeto.Perfil_Apli.ID_GPO_ACCESO.AsString;
         Objeto.PerfilClases:= Objeto.Perfil_Apli.ID_GPO_ACCESO.AsString;
         If Objeto.Perfil_Apli <> nil then
         Begin
	         //Objeto.DescPerfilClase:= Objeto.Perfil_Apli.NOM_GPO_ACCESO.AsString;
   	      Objeto.DescPerfilApl:= Objeto.Perfil_Apli.Perfil.NOM_GPO_ACCESO.AsString;
            q:= GetSqlQuery (
               ' SELECT Secu_Gpo_acceso.ID_GPO_ACCESO, Secu_Perfil.Nom_Gpo_Acceso'+
               ' FROM Secu_Gpo_acceso,'+
               '  Secu_Perfil'+
               ' WHERE'+
               '  Secu_Gpo_acceso.Id_Gpo_Acceso = Secu_Perfil.Id_Gpo_Acceso'+
               '  and Secu_Gpo_acceso.Cve_Aplicacion = ''CLASE'''+
               '  and Secu_Gpo_acceso.Id_Gpo_Acceso = '+ Objeto.Perfil_Apli.ID_GPO_ACCESO.AsString,
               Objeto.DataBaseName, Objeto.SessionName, False);
            Try
               If q <> nil then
               Begin
                  Objeto.DescPerfilClase:= q.FieldByName('NOM_GPO_ACCESO').asString;
                  Objeto.PerfilClases:= q.FieldByName('ID_GPO_ACCESO').asString;
               end
               else
               Begin
                  Objeto.DescPerfilClase:= '';
                  Objeto.PerfilClases:= '';
               end;
            Finally
               If q <> nil then q.Free;
            end;

         end;
      end
      else If rgSeleccion.ItemIndex = 2 Then
      Begin
         Objeto.PerfilAplicacion:= Objeto.Usuario_Apli.ID_GPO_ACCESO.AsString;
         q:= GetSqlQuery (
            ' SELECT Secu_Usr_Apl_Gpo.ID_GPO_ACCESO, Secu_Perfil.Nom_Gpo_Acceso'+
            ' FROM Secu_Usr_Apl_Gpo,'+
            '  Secu_Perfil'+
            ' WHERE'+
            '  Secu_Usr_Apl_Gpo.Id_Gpo_Acceso = Secu_Perfil.Id_Gpo_Acceso'+
            '  and Secu_Usr_Apl_Gpo.Cve_Aplicacion = ''CLASE'''+
            '  and Secu_Usr_Apl_Gpo.Cve_Usuario = ''' + Objeto.Usuario_Apli.CVE_USUARIO.asString + '''' +
            '  and Secu_Usr_Apl_Gpo.Id_empresa = '+ Objeto.Usuario_Apli.ID_EMPRESA.AsString +
            '  and Secu_Usr_Apl_Gpo.Cve_Ind_Adic = '''+ Objeto.Usuario_Apli.CVE_IND_ADIC.AsString +'''',
            Objeto.DataBaseName, Objeto.SessionName, False);
         Try
         	If q <> nil then
            Begin
            	Objeto.DescPerfilClase:= q.FieldByName('NOM_GPO_ACCESO').asString;
               Objeto.PerfilClases:= q.FieldByName('ID_GPO_ACCESO').asString;
            end
            else
            Begin
            	Objeto.DescPerfilClase:= '';
               Objeto.PerfilClases:= '';
            end;
            Objeto.Perfil_Apli.FindKey([Objeto.Usuario_Apli.Cve_Aplicacion.asString, Objeto.Usuario_Apli.ID_GPO_ACCESO.AsString]);
            Objeto.DescPerfilApl:= Objeto.Perfil_Apli.Perfil.NOM_GPO_ACCESO.AsString;
         Finally
         	If q <> nil then q.Free;
         end;
      end;

	   lbHeaderAplicacion.Caption:= '['+ Objeto.DescPerfilApl + ']';
   	lbHeaderClase.Caption:= '['+ Objeto.DescPerfilClase + ']';
   end
   else
   Begin
	   lbHeaderAplicacion.Caption:= '';
   	lbHeaderClase.Caption:= '';
   end;

	If Objeto.PorPerfil Then RefrescaMenuMenu
	else RefrescaMenuFuncion;

   Objeto.Seleccion:=  rgSeleccion.ItemIndex;
   gbPerfil.Enabled := (Objeto.Seleccion = 0) or (Objeto.Seleccion = 2);
   gbFuncion.Enabled:= Objeto.Seleccion = 1;
end;


procedure TwAccFunPer.lvAccesoColumnClick(Sender: TObject;
  Column: TListColumn);
Var	Indice: Integer;
		Columna: Integer;
      Mensaje, NombreAplicacion: String;
begin
	If Interforma1.CanEdit Then Exit;

	Columna:= Column.Index;
	if (Columna in ([0,6])) or (Columna > 11) Then Exit;

   Case Columna of
   1, 7:  Mensaje:= 'Catálogo';
   2, 8:  Mensaje:= 'Consulta';
   3, 9:  Mensaje:= 'Alta';
   4, 10:  Mensaje:= 'Baja';
   5, 11: Mensaje:= 'Modificación';
   end;

   If Columna > 5 then NombreAplicacion := 'CLASE'
   else NombreAplicacion := Objeto.Aplicacion.FieldByName('CVE_APLICACION').asString;

   If chbInvertir.Checked Then
	   Mensaje:= 'Los Accesos de ['+ Mensaje + '] para todas las funciones de la Aplicación ['+ NombreAplicacion + '] serán Invertidos'
   else
   	Mensaje:= 'Se dará Acceso de ['+ Mensaje + '] a todas las funciones de la Aplicación ['+ NombreAplicacion + '] ';

   if MessageDlg(Mensaje, mtConfirmation, [mbYES, mbNO], 0) = mrYES Then
   Begin
	   For Indice := 0 to lvAcceso.Items.Count -1 do
   	Begin
   		ModificaAcceso(lvAcceso.Items.Item[Indice], Columna - 1, chbInvertir.Checked);
	   end;
   end;
end;


Function TwAccFunPer.MouseToCol(X,Y: Integer): Integer;
Var
	ListaItem: TListItem;
   PtoInicio: TPoint;
   Indice: Integer;
   xMin, xMax : Integer;
   ColumnaOK: Boolean;

begin
   Result := -1;
	ListaItem:= lvAcceso.GetItemAt(X,Y);
   if  ListaItem <> nil then
   Begin
	   PtoInicio:= ListaItem.GetPosition;
   	ColumnaOK:= False;
      xMax:= PtoInicio.x - 1;
      Indice:= 0;
      Repeat
         xMin:= xMax + 1;
         Case lvAcceso.Column[Indice].Width of
            -1:  xMax := xMax + ColumnTextWidth;
            -2:  xMax := xMax + ColumnHeaderWidth;
            else xMax := xMax + lvAcceso.Column[Indice].Width;
         end;

         If ((X >= xMin) and (X < xMax)) Then ColumnaOK:= True
         else
         Begin
         	ColumnaOK:= False;
            Inc(Indice);
         enD;
      Until (ColumnaOK) or (Indice = lvAcceso.Columns.Count);

		If ColumnaOK Then  Result := Indice - 1;
   end;
end;



Function TwAccFunPer.EfectuaModificacion(Apl, Per, Fun, Campo: String; Valor: String): Boolean;
var
	q: TQuery;
   Bloq, Hor, War, H_Max, H_Min: String;
   SqlCampo: String;
Begin
   If chbBBloqueado.Checked Then Bloq:= 'V' else Bloq:= 'F';
   If chbBHorario.Checked Then Hor:= 'V' else Hor:= 'F';
   If chbBWarning.Checked Then War:= 'V' else War:= 'F';
   If Trim(edHMaximaEjec.Text) = '' Then H_Max:= '000000' else H_Max:= edHMaximaEjec.Text;
   If Trim(edHMinimaEjec.Text) = '' Then H_Min:= '000000' else H_Min:= edHMinimaEjec.Text;


	If Apl= 'CLASE' Then Per:= Objeto.PerfilClases
   else Per:= Objeto.PerfilAplicacion;

	Try
      Try
         q:= GetSqlQuery(
            ' SELECT Secu_Fun_Aut_Gpo.* FROM Secu_Fun_Aut_Gpo, Secu_Apl_fun'+
            ' WHERE Secu_Apl_fun.Cve_Aplicacion = Secu_Fun_Aut_Gpo.Cve_Aplicacion'+
            '   and Secu_Apl_fun.Cve_Funcion = Secu_Fun_Aut_Gpo.Cve_Funcion'+
            '   and Secu_Fun_Aut_Gpo.Cve_Aplicacion = ''' + Apl + '''' +
            '   and Secu_Fun_Aut_Gpo.Id_Gpo_Acceso = ' + Per +
            '   and Secu_Fun_Aut_Gpo.Cve_Funcion = '''+ Fun + '''',
            Objeto.DataBaseName, Objeto.SessionName, True);

         If q = nil then  	{Objeto.State = tsNuevo}
         Begin                            						{Insertar el registro}
            If (Apl = 'CLASE') and (Objeto.Aplicacion <> nil) and (Objeto.Aplicacion.FieldByName('CVE_APLICACION').asString <> 'CLASE') Then
            Begin
               Bloq:= 'F';
               Hor:= 'F';
               War:= 'F';
               H_Max:= '000000';
               H_Min:= '000000';
            end;

            Campo := UpperCase(Campo);
            SqlCampo:= '';
				If  Campo = 'B_ACC_CATA' Then SqlCampo:= ''''+ Valor +'''' else SqlCampo:= '''F''';
				If  Campo = 'B_ACC_CONS' Then SqlCampo:= SqlCampo + ', '''+ Valor +'''' else SqlCampo:= SqlCampo + ', ''F''';
            If  Campo = 'B_ACC_ALTA' Then SqlCampo:= SqlCampo + ', '''+ Valor +'''' else SqlCampo:= SqlCampo + ', ''F''';
            If  Campo = 'B_ACC_BAJA' Then SqlCampo:= SqlCampo + ', '''+ Valor +'''' else SqlCampo:= SqlCampo + ', ''F''';
            If  Campo = 'B_ACC_MODIF' Then SqlCampo:= SqlCampo +', '''+ Valor +'''' else SqlCampo:= SqlCampo + ', ''F''';

	      	RunSQl(
   	      	' INSERT INTO Secu_Fun_Aut_Gpo'+
               '   (CVE_APLICACION, ID_GPO_ACCESO, CVE_FUNCION,'+
               '    B_ACC_CATA, B_ACC_CONS, B_ACC_ALTA, B_ACC_BAJA, B_ACC_MODIF,'+
					'	  B_BLOQUEADO, B_HORARIO, B_WARNING, H_MAXIMA_EJEC, H_MINIMA_EJEC) '+
               ' VALUES ('+
               '   '''+ Apl +''', ' +
                        Per +', ' +
               '   '''+ Fun +''', ' +
                        SqlCampo + ', '+
					    ''''+ Bloq +''', '''+ Hor +''', '''+ War + ''', '''+ H_Max +''', '''+ H_Min +''')',
         	   Objeto.DataBaseName, Objeto.SessionName, True);
         end
         else
         Begin
            If (Apl = 'CLASE') and (Objeto.Aplicacion <> nil) and (Objeto.Aplicacion.FieldByName('CVE_APLICACION').asString <> 'CLASE') Then
            Begin
               Bloq:= q.FieldByName('B_BLOQUEADO').asString;
               Hor:= q.FieldByName('B_HORARIO').asString;
               War:= q.FieldByName('B_WARNING').asString;
               H_Max:= q.FieldByName('H_MAXIMA_EJEC').asString;
               H_Min:= q.FieldByName('H_MINIMA_EJEC').asString;
            end;

            If (Bloq = 'F') and (Hor = 'F') and (War = 'F') and
	            (
                ((q.FieldByName('B_ACC_CATA').asString = 'F') or (Campo = 'B_ACC_CATA')) and
            	 ((q.FieldByName('B_ACC_CONS').asString = 'F') or (Campo = 'B_ACC_CONS')) and
            	 ((q.FieldByName('B_ACC_ALTA').asString = 'F') or (Campo = 'B_ACC_ALTA')) and
            	 ((q.FieldByName('B_ACC_BAJA').asString = 'F') or (Campo = 'B_ACC_BAJA')) and
            	 ((q.FieldByName('B_ACC_MODIF').asString = 'F') or (Campo = 'B_ACC_MODIF'))
               ) 	Then
            Begin
	   	      RunSql(                               {Eliminar el registro}
                  ' DELETE SECU_FUN_AUT_GPO '+
      	   	   ' WHERE Cve_Aplicacion = ''' + Apl + '''' +
         	   	'   and Id_Gpo_Acceso = ' + Per +
	            	'   and Cve_Funcion = '''+ Fun + '''',
		            Objeto.DataBaseName, Objeto.SessionName, True);
            end
            else
            Begin                                     {Actualizar el registro}
	            SqlCampo :=	' B_BLOQUEADO = '''+ Bloq + ''', '+
            				' B_HORARIO = '''+ Hor + ''', '+
                        ' B_WARNING = '''+ War + ''', '+
                        ' H_MAXIMA_EJEC = '''+ H_Max + ''', '+
                        ' H_MINIMA_EJEC = '''+ H_Min + '''';

					if Trim(Campo) <> '' Then SqlCampo := SqlCampo + ', ' + Campo + ' = ''' + Valor + '''';

	   	      RunSql(
   	   	      ' UPDATE SECU_FUN_AUT_GPO SET '+ SqlCampo +
      	   	   ' WHERE Cve_Aplicacion = ''' + Apl + '''' +
         	   	'   and Id_Gpo_Acceso = ' + Per +
	            	'   and Cve_Funcion = '''+ Fun + '''',
		            Objeto.DataBaseName, Objeto.SessionName, True);
      	   end;
         end;


         if Trim(Campo) <> '' Then
            GetSqlStr(
               ' SELECT '+ Campo + ' FROM SECU_FUN_AUT_GPO'+
                  ' WHERE Cve_Aplicacion = ''' + Apl + '''' +
                  '   and Id_Gpo_Acceso = ' + Per +
                  '   and Cve_Funcion = '''+ Fun + '''',
               Objeto.DataBaseName, Objeto.SessionName, Campo, Valor, False);

         Result := True;
      Finally
         If q <> nil Then q.Free;
      end;
   Except Result := False;
   end;
end;


Function TwAccFunPer.ModificaAcceso(ListaItem: TListItem; Columna: Integer; InvertirValor: Boolean): Boolean;
Var
   Campo, NombreAplicacion: String;
   Valor: String;
   ValorFinal: String;
Begin
	Result := False;
	Campo := '';

	Case Columna of
      0,6:	Campo := 'B_ACC_CATA';
      1,7: Campo := 'B_ACC_CONS';
      2,8: Campo := 'B_ACC_ALTA';
      3,9: Campo := 'B_ACC_BAJA';
      4,10: Campo := 'B_ACC_MODIF';
   end;

   If Columna > 5 then NombreAplicacion := 'CLASE'
   else NombreAplicacion := Objeto.Aplicacion.FieldByName('CVE_APLICACION').asString;

   If (Campo = '') or												{Columna NO Valida}
      (TNodo(ListaItem.Data).Funcion = '') or 				{La Opcion No tiene asignados una Funcion o Accesos}
      (ListaItem.SubItems.Count = 0)
	Then Exit;

   Valor := ListaItem.SubItems.Strings[Columna];

   If InvertirValor Then
   Begin
   	If Valor = cSI Then Valor := 'F'
	   else Valor := 'V';
   end
   else Valor := 'V';

   ValorFinal := Valor;

   Try
      Result:= EfectuaModificacion(
		            NombreAplicacion,
      		      TNodo(ListaItem.Data).Perfil,
            		TNodo(ListaItem.Data).Funcion,
		            Campo,
      		      Valor);

{      RunSql(
      	' UPDATE SECU_FUN_AUT_GPO SET '+ Campo + ' = ''' + Valor + '''' +
         ' WHERE Cve_Aplicacion = ''' + NombreAplicacion + '''' +
         '   and Id_Gpo_Acceso = ' + TNodo(ListaItem.Data).Perfil +
         '   and Cve_Funcion = '''+ TNodo(ListaItem.Data).Funcion + '''',
         Objeto.DataBaseName, Objeto.SessionName, True);

      GetSqlStr(
      	' SELECT '+ Campo + ' FROM SECU_FUN_AUT_GPO'+
         ' WHERE Cve_Aplicacion = ''' + NombreAplicacion + '''' +
         '   and Id_Gpo_Acceso = ' + TNodo(ListaItem.Data).Perfil +
         '   and Cve_Funcion = '''+ TNodo(ListaItem.Data).Funcion + '''',
         Objeto.DataBaseName, Objeto.SessionName, Campo, Valor, True);}

      if (Result) and (Valor = ValorFinal) Then
      Begin
      	Result := True;
      	If Valor = 'V' Then Valor:= cSI
      	else Valor:= cNO;
			ListaItem.SubItems.Strings[Columna] := Valor;

         If (Objeto.Aplicacion <> nil) and (Objeto.Aplicacion.FieldByName('CVE_APLICACION').asString = 'CLASE') then
         	ListaItem.SubItems.Strings[Columna + 6] := Valor;
      end;
   Except
   	Result := False;
   end;
end;



procedure TwAccFunPer.lvAccesoMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
Var Columna: Integer;

Begin
	If DobleClick then
   Begin
   	Columna:= MouseToCol(X,Y);
      If (Columna >= 6) and (Objeto.Aplicacion <> nil) and (Objeto.Aplicacion.FieldByName('CVE_APLICACION').asString = 'CLASE') Then
         Columna := Columna - 6;

		ModificaAcceso(lvAcceso.GetItemAt(X,Y), Columna, True);
   	DobleClick:= False;
   end;
end;

procedure TwAccFunPer.lvAccesoDblClick(Sender: TObject);
begin DobleClick:= True;
end;



procedure TwAccFunPer.rgSeleccionClick(Sender: TObject);
begin
	If (rgSeleccion.ItemIndex = 0) or (rgSeleccion.ItemIndex = 2) then gbPerfil.BringToFront;
   If rgSeleccion.ItemIndex = 1 then gbFuncion.BringToFront;
   lbNomUsuario.Visible := (rgSeleccion.ItemIndex = 2);

   If Objeto.Seleccion = rgSeleccion.ItemIndex Then
   Begin
		gbPerfil.Enabled := (rgSeleccion.ItemIndex = 0) or (rgSeleccion.ItemIndex = 2);
   	gbFuncion.Enabled := rgSeleccion.ItemIndex = 1;
   end
   else
   Begin
		gbPerfil.Enabled := False;
   	gbFuncion.Enabled := False;
   end;

   Case rgSeleccion.ItemIndex of
      0,2:	Objeto.PorPerfil:= True;
      1:		Objeto.PorPerfil:= False;
   end;
end;


procedure TwAccFunPer.InterForma1Buscar(Sender: TObject);
begin
	Case rgSeleccion.ItemIndex of
   	0: If Objeto.Perfil_Apli.Busca Then RefrescaMenu;
      1: If Objeto.Funcion_Apli.Busca Then RefrescaMenu;
      2: If Objeto.Usuario_Apli.Busca Then RefrescaMenu;
   end;
end;

procedure TwAccFunPer.lvAccesoChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
   NumTimerMenu:= 0;
   TimerMenu.Enabled := False;

	If (Objeto.ShowCatalogo) and (Change = ctState) Then
   Begin
      If (lvAcceso.Selected = nil) Then Objeto.Active := False
      else If (Not Objeto.Active) and (TNodo(Item.Data).Perfil <> '') and (TNodo(Item.Data).Funcion <> '') Then
      Begin
      	NumTimerMenu:= 0;
         ItemTimerMenu := Item;
         ChangeTimerMenu:= Change;
         TimerMenu.Enabled := True;
         InterForma1.F.btModificar.Enabled:= True;
      end
      else InterForma1.F.btModificar.Enabled:= False;
   end;
end;


procedure TwAccFunPer.lvAccesoChanging(Sender: TObject; Item: TListItem;
  Change: TItemChange; var AllowChange: Boolean);
begin AllowChange:= Not (InterForma1.CanEdit);
end;


procedure TwAccFunPer.InterLinkit1Capture(Sender: TObject;
  var Show: Boolean);
begin Show := Not InterForma1.CanEdit;
end;

procedure TwAccFunPer.InterLinkit2Capture(Sender: TObject;
  var Show: Boolean);
begin Show := Not InterForma1.CanEdit;
end;


procedure TwAccFunPer.InterLinkit1Ejecuta(Sender: TObject);
begin
	Objeto.Funcion.FindKey([InterLinkit1.Buffer]);
   If Objeto.Funcion.Active Then
   Begin
   	LocateList(Objeto.Funcion, Objeto.Funcion.CVE_FUNCION.asString);
      //lvAcceso.Selected := lvAcceso.FindCaption(0, Copy('                       ', 1, 3 * cIncremento) + Objeto.Funcion.Nom_Funcion.asString,True,True,True);
   end;
end;

procedure TwAccFunPer.InterLinkit2Ejecuta(Sender: TObject);
begin
	Objeto.Perfil.FindKey([InterLinkit2.Buffer]);
   If Objeto.Perfil.Active Then
   Begin
      //lvAcceso.Selected := lvAcceso.FindCaption(0, Copy('                       ', 1, 1 * cIncremento) + Objeto.Perfil.NOM_GPO_ACCESO.asString,True,True,True);
		LocateList(Objeto.Perfil, Objeto.Perfil.ID_GPO_ACCESO.asString);
   end;
end;

procedure TwAccFunPer.BitBtn1Click(Sender: TObject);
begin
   If (Not InterForma1.CanEdit) and (Objeto.Funcion.Busca) Then
   Begin
   	LocateList(Objeto.Funcion, Objeto.Funcion.CVE_FUNCION.asString);
//      lvAcceso.Selected := lvAcceso.FindCaption(0, Copy('                       ', 1, 3 * cIncremento) + Objeto.Funcion.Nom_Funcion.asString,True,True,True);
      //if lvAcceso.Selected = nil then Objeto.Funcion.Active := False;
   end;
end;


procedure TwAccFunPer.BitBtn2Click(Sender: TObject);
begin
   If (Not InterForma1.CanEdit) and (Objeto.Perfil.Busca) Then
   Begin
//      lvAcceso.Selected := lvAcceso.FindCaption(0, Copy('                       ', 1, 1 * cIncremento) + Objeto.Perfil.NOM_GPO_ACCESO.asString,True,True,True);
      LocateList(Objeto.Perfil, Objeto.Perfil.ID_GPO_ACCESO.asString);
      //if lvAcceso.Selected = nil then Objeto.Perfil.Active := False;

   end;
end;


Function TwAccFunPer.LocateList(Frame: TInterFrame; CveFun: String): Boolean;
Var	Indice: Integer;
		Encontrado: Boolean;
Begin
	Indice:= 1;
   Encontrado:= False;
   CveFun:= UpperCase(CveFun);
	While (Indice < lvAcceso.Items.Count) and (Not Encontrado) do
   Begin
   	If Objeto.PorPerfil Then
      Begin
         If TNodo(lvAcceso.Items.Item[Indice].Data).Funcion = CveFun Then Encontrado:= True
         else Inc(Indice);
      end
      else
      Begin
         If TNodo(lvAcceso.Items.Item[Indice].Data).Perfil = CveFun Then Encontrado:= True
         else Inc(Indice);
      end
   end;

   if Encontrado then
   Begin
   	lvAcceso.ItemFocused:= lvAcceso.Items.Item[Indice];
      lvAcceso.Selected := lvAcceso.Items.Item[Indice];
      lvAcceso.Selected.MakeVisible(True);

//      lvAcceso.TopItem:= lvAcceso.Items.Item[Indice-1];
   end
   else Frame.Active := False;

   //lvAcceso.Selected := lvAcceso.Items.Item[Indice];
   Result := Encontrado;
end;


procedure TwAccFunPer.InterForma1Aceptar(Sender: TObject;
  var Realizado: Boolean);
begin
   If EfectuaModificacion(
   		TNodo(lvAcceso.Selected.Data).Aplicacion,
         TNodo(lvAcceso.Selected.Data).Perfil,
         TNodo(lvAcceso.Selected.Data).Funcion,
         '', '') Then
   Begin
   	Realizado:= True;
      lvAcceso.Selected.ImageIndex := RefrescaIndiceImagen(chbBBloqueado.Checked, chbBHorario.Checked, chbBWarning.Checked);
   end
   else Realizado:= False;

   InterForma1.ShowError:= False;
end;

procedure TwAccFunPer.chbBHorarioClick(Sender: TObject);
begin If (InterForma1.CanEdit) and (chbBHorario.Checked) Then chbBWarning.Checked := False;
end;

procedure TwAccFunPer.chbBWarningClick(Sender: TObject);
begin	If (InterForma1.CanEdit) and (chbBWarning.Checked) Then chbBHorario.Checked := False;
end;

procedure TwAccFunPer.InterForma1Modificar(Sender: TObject;
  var Realizado: Boolean);
begin
	Realizado := True;
{	If Objeto.Active Then Objeto.Edit
   else
   Begin
   	if TNodo(lvAcceso.Selected.Data).Funcion <> '' Then Objeto.Append
      else Realizado := False;
   end;}
end;



procedure TwAccFunPer.TimerMenuTimer(Sender: TObject);
begin
	If NumTimerMenu = 3 Then
   Begin
   	NumTimerMenu:= 0;
      TimerMenu.Enabled:= False;

      Objeto.FindKey([	Objeto.Aplicacion.FieldByName('CVE_APLICACION').asString,
                        TNodo(ItemTimerMenu.Data).Perfil,
                        TNodo(ItemTimerMenu.Data).Funcion]);

      If Not Objeto.Active Then
      Begin
         edCveFuncion.Text := TNodo(ItemTimerMenu.Data).Funcion;
         edIdGpoAcceso.Text := TNodo(ItemTimerMenu.Data).Perfil;
         Objeto.Funcion.FindKey([edCveFuncion.Text]);
         Objeto.Perfil.FindKey([edIdGpoAcceso.Text]);
      end;

      If Not Objeto.PorPerfil Then
      Begin
      	Objeto.PerfilAplicacion:= edIdGpoAcceso.Text;
         lbHeaderAplicacion.Caption:= '['+ edNomGpoAcceso.Text + ']';
         If GetSql('Select Id_Gpo_Acceso From Secu_Gpo_Acceso Where Cve_aplicacion = ''CLASE'' and Id_Gpo_Acceso = '+ edIdGpoAcceso.Text,
         	Objeto.DataBaseName, Objeto.SessionName, False) Then
         Begin
	         Objeto.PerfilClases := edIdGpoAcceso.Text;
         	lbHeaderClase.Caption:= '['+ edNomGpoAcceso.Text + ']';
         end
         else
         Begin
	         Objeto.PerfilClases := '';
         	lbHeaderClase.Caption:= '[]';
         end;
      end;
   end
   else Inc(NumTimerMenu);
end;





end.
