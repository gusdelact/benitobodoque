// Sistema         : Clase de NET_CONTRATO
// Fecha de Inicio : 23/06/1998
// Función forma   : Clase de NET_CONTRATO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Jose Alberto Ramirez Pacheco
// Comentarios     :
Unit IntNetSerUsr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, DBCtrls, Grids, DBGrids,
  IntNetServic, Menus;

Const
	c_MonitorFinanciero = 'MONI';

Type
 TNetSerUsr= class;  {Requiere que se le asigne un interframe a la propieda CONTRATO con }
 							{Id_Contrato, Id_Persona, Cve_Usuario}

  TwNetSerUsr=Class(TForm)
    InterForma1             : TInterForma;
    gServicios: TDBGrid;
    nServicios: TDBNavigator;
    GroupBox1: TGroupBox;
    PopupServicio: TPopupMenu;
    CatalogoServicio: TMenuItem;
    lbID_CONTRATO: TLabel;
    Label1: TLabel;
    edDescServicio: TEdit;
    edCveServicio: TEdit;
    bServicio: TBitBtn;
    bContrato: TBitBtn;
    edIdContrato: TLabel;
    PopupMenu1: TPopupMenu;
    MenuItem1: TMenuItem;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure bServicioClick(Sender: TObject);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure bContratoClick(Sender: TObject);
    procedure CatalogoServicioClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TNetSerUsr;
end;


 TNetSerUsr= class(TInterFrame)
      private
      	FContrato: TInterFrame;
      protected
			procedure SetContrato(Ctto: TInterFrame);
      public
        { Public declarations }
        ID_CONTRATO	: TInterCampo;
        Cve_Servicio : TInterCampo;

        qServicios : TQuery;
        dsServicios: TDataSource;
        dbSIVA     : TDataBase;
        Servicio: TNetSer;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;

        procedure DataBaseChange; override;
        Procedure RefrescaQServicios;
        Procedure dsServiciosDataChange(Sender: TObject; Field: TField);
		  Function  InternalPost : Boolean; override;
        Function  InternalDelete:Boolean; override;
        function  InternalBusca: Boolean; override;
        function  ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function  Reporte:Boolean; override;

        Property Contrato: TInterFrame Read FContrato Write SetContrato;
      published
      end;

implementation
//Uses RepMon;

{$R *.DFM}

USES IntNetCto;


constructor TNetSerUsr.Create( AOwner : TComponent );
begin Inherited;
      Id_Contrato:=CreaCampo('ID_CONTRATO',ftFloat,tsNinguno,tsNinguno,True);
      Id_Contrato.Caption:='Contrato';
      Cve_Servicio:=CreaCampo('CVE_SERVICIO',ftString,tsNinguno,tsNinguno,True);
      Cve_Servicio.Size:=4;
      Cve_Servicio.Caption:='Clave de Usuario';

      Servicio:= TNetSer.create(self);
      Servicio.MasterSource := self;
      Servicio.CVE_SERVICIO.MasterField := 'CVE_SERVICIO';
      Servicio.ShowAll := True;
      Servicio.BuscaWhereString := 'NET_SERVICIOS.SIT_SERVICIO = ''AC''';

      FContrato := nil;
      dsServicios:= TDataSource.Create(self);
      dsServicios.OnDataChange := dsServiciosDataChange;


      dbSIVA:= TDataBase.Create(nil);
      dbSIVA.DriverName := 'ORACLE';
      dbSIVA.DatabaseName := 'SIVA';
      dbSIVA.SessionName := '';
      dbSIVA.Params.Clear;
      If ParamStr(1) = 'P' Then                       {CREACION DE LA BASE SIVA}
         begin
            //dbSIVA.Params.Add('SERVER NAME=PSIVA');
            dbSIVA.Params.Add('PASSWORD=DEVELOP');
         end
      else
         begin
            //dbSIVA.Params.Add('SERVER NAME=DSIVA');
            dbSIVA.Params.Add('PASSWORD=DESARROLLO');
         end;
      dbSIVA.Params.Add('SERVER NAME=' + ParamStr(1) + 'MCAP');
      dbSIVA.Params.Add('USER NAME=SISTEMAS');
      dbSIVA.Params.Add('LANGDRIVER=DBWINWE0');
      dbSIVA.KeepConnection:= True;
      dbSIVA.LoginPrompt := False;
      dbSIVA.Connected := False;

      TableName:= 'NET_SERV_USR';
      FKeyFields.Add('ID_CONTRATO');
      FKeyFields.Add('CVE_SERVICIO');
      UseQuery := True;
end;

Destructor TNetSerUsr.Destroy;
begin
	if dbSIVA <> nil then dbSIVA.Free;
	if qServicios <> nil then qServicios.Free;
        if dsServicios <> nil then dsServicios.Free;
	inherited;
end;

procedure TNetSerUsr.DataBaseChange;
begin
	inherited;
	//if Contrato <> nil Then Contrato.GetParams(self);
end;

Function TNetSerUsr.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwNetSerUsr;
begin
   W:=TwNetSerUsr.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.CentrarForma := True;
      W.InterForma1.ShowBtnModificar := False;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function  TNetSerUsr.InternalPost : Boolean;
var	Id_Titular: Integer;
		TranSIVA_OK: Boolean;
      TranINET_OK: Boolean;
begin
	Result := False;
	If Cve_Servicio.AsString = c_MonitorFinanciero Then
   Begin
   	Try
      	TranSIVA_OK:= False;
   	   TranINET_OK:= True;
         dbSIVA.Connected := True;
         dbSIVA.StartTransaction;
         Try
            Apli.DataBase.StartTransaction;
            TranINET_OK:= False;

            Id_Titular := -1;
            GetSqlInt('Select Id_Titular from contrato where id_contrato = '+ Contrato.FieldByName('ID_CONTRATO').asString,
	           	Apli.SeguDataBaseName, Apli.SeguSessionName,'ID_TITULAR',Id_Titular,False);

            inherited InternalPost;

            RunSql(
            	'Insert'+
               '	Into Siv_Usuario ('+
					'		CVE_USUARIO,'+
					'		ID_PERSONA,'+
					'		SIT_USUARIO,'+
					'		TIME_REFRESH) '+
               '	Values ('+
                     '''' + Contrato.FieldByName('CVE_USUARIO').asString + ''', ' +
                     IntToStr(Id_Titular) + ', ' +
                     '''AC'', 120)',
            	dbSIVA.DatabaseName, dbSIVA.SessionName, True);

	       TranSIVA_OK:= True;
   		   TranINET_OK:= True;
         finally
            If (TranSIVA_OK) and (TranINET_OK) Then
               Begin
                  Apli.DataBase.Commit;
                  dbSIVA.Commit;
                  Result := True;
               end
            else
               Begin
               	if Not TranINET_OK Then Apli.DataBase.Rollback;
                  dbSIVA.Rollback;
                  Result := False;
               end;
            dbSIVA.Connected := False
         end;
      Except
			Raise EInterFrame.Create('Imposible generar el registro de Usuario para el Monitor financiero. Consulte a su administrador');
      end;
   end
   else Result := inherited InternalPost;
end;



Function TNetSerUsr.InternalDelete:Boolean;
var	TranSIVA_OK: Boolean;
      TranINET_OK: Boolean;
begin
	Result := False;
	If Cve_Servicio.AsString = c_MonitorFinanciero Then
   Begin
   	Try
         TranSIVA_OK := False;
         TranINET_OK := True;
         dbSIVA.Connected := True;
         dbSIVA.StartTransaction;
         Try
            Apli.DataBase.StartTransaction;
            TranINET_OK := False;

            RunSql(' DELETE Siv_Emi_Usuario Where Cve_Usuario = '''+ Contrato.FieldByName('CVE_USUARIO').asString + '''',
               dbSIVA.DatabaseName, dbSIVA.SessionName, True);

            RunSql(' DELETE Siv_Usuario Where Cve_Usuario = '''+ Contrato.FieldByName('CVE_USUARIO').asString + '''',
               dbSIVA.DatabaseName, dbSIVA.SessionName, True);

            inherited InternalDelete;

            TranINET_OK := True;
            TranSIVA_OK := True;
         finally
            If (TranINET_OK) and (TranSIVA_OK) Then
               Begin
                  Apli.DataBase.Commit;
                  dbSIVA.Commit;
                  Result:= True;
               end
            else
               Begin
                  if Not TranINET_OK Then Apli.DataBase.Rollback;
                  dbSIVA.Rollback;
                  Result:= False;
               end;
            dbSIVA.Connected := False
         end;
      Except
			Raise EInterFrame.Create('Imposible eliminar el servicio de Monitor financiero. Consulte a su administrador');
      end;
   end
   else Result := inherited InternalDelete;
end;


Function TNetSerUsr.InternalBusca:Boolean;
Var
	T:TInterFindit;
   Ctto: TNetCto;
begin
	InternalBusca := False;
   T := CreaBuscador('INSerUsr.it','F,S');
   Try
		if Contrato <> nil then
      begin
      	T.WhereString := 'NET_SERV_USR.ID_CONTRATO = ' + Contrato.FieldByName('ID_CONTRATO').AsString;
      	T.Param(0,Contrato.FieldByName('ID_CONTRATO').AsString);
      end;

      if T.Execute then
      begin
{       	if ID_CONTRATO.AsString = T.DameCampo(0) Then
         begin}
       		InternalBusca := FindKey([T.DameCampo(0), T.DameCampo(1)]);
            qServicios.Locate('ID_CONTRATO; CVE_SERVICIO',
										VarArrayOf([T.DameCampo(0), T.DameCampo(1)]),
								      [loCaseInsensitive]);
{         end
         else
         begin
         	Ctto:= TNetCto.create(self);
            Try
            	Ctto.GetParams(self);
               Ctto.FindKey([T.DameCampo(0)]);
               Contrato := Ctto;
            finally
               Ctto.Free;
            end;
         end;   }
      end;
   finally  T.Free;
   end;
end;

procedure TNetSerUsr.SetContrato(Ctto: TInterFrame);
begin
	FContrato := Ctto;

   If (Ctto <> nil) Then
   begin
      RefrescaQServicios;
   end;
end;

Procedure TNetSerUsr.RefrescaQServicios;
begin
if qServicios <> nil then qServicios.Free; qServicios := nil;

   If Contrato <> nil Then
   begin
      qServicios := GetSQLQuery(
         ' select'+
         '   Net_Serv_usr.Id_contrato,'+
         '   Net_Serv_usr.Cve_Servicio,'+
         '   Net_Servicios.Desc_Servicio'+
         ' from'+
         '   Net_serv_usr,'+
         '   Net_servicios'+
         ' where'+
         '   Net_Serv_Usr.Id_Contrato = '+ Contrato.FieldByName('ID_CONTRATO').asString +
         '   and Net_Serv_Usr.Cve_Servicio = Net_Servicios.Cve_Servicio',
         DataBaseName, SessionName, False);


      if qServicios <> nil then
      begin
         qServicios.FieldByName('ID_CONTRATO').Visible := False;
         qServicios.FieldByName('CVE_SERVICIO').Visible := False;
         qServicios.FieldByName('DESC_SERVICIO').DisplayWidth := 61;
         qServicios.FieldByName('DESC_SERVICIO').DisplayLabel := 'Servicio';
      end;
   end;

   dsServicios.DataSet := qServicios;
end;

procedure TNetSerUsr.dsServiciosDataChange(Sender: TObject; Field: TField);
begin
	if Field = nil then
		FindKey([qServicios.FieldByName('ID_CONTRATO').asString,
   			qServicios.FieldByName('CVE_SERVICIO').asString]);
end;


function TNetSerUsr.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA NET_CONTRATO********************)
(*                                                                              *)
(*  FORMA DE NET_CONTRATO                                                            *)
(*                                                                              *)
(***********************************************FORMA NET_CONTRATO********************)

procedure TwNetSerUsr.FormShow(Sender: TObject);
begin
   Objeto.ID_CONTRATO.Control:=edIdContrato;
   Objeto.Cve_Servicio.Control := edCveServicio;

   Objeto.Servicio.DESC_SERVICIO.Control := edDescServicio;
   gServicios.DataSource := Objeto.dsServicios;
   nServicios.DataSource := Objeto.dsServicios;
end;

procedure TwNetSerUsr.FormDestroy(Sender: TObject);
begin
   Objeto.ID_CONTRATO.Control :=nil;
   Objeto.Cve_Servicio.Control:= nil;

   Objeto.Servicio.DESC_SERVICIO.Control := nil;
   gServicios.DataSource := nil;
end;

procedure TwNetSerUsr.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwNetSerUsr.InterForma1DespuesNuevo(Sender: TObject);
  var
   Q : Tquery;
   SQL: string;
   vSit : String;
begin
if Objeto.Contrato <> nil then
   begin
      Objeto.ID_CONTRATO.AsString := Objeto.Contrato.FieldByName('ID_CONTRATO').asString;
//      Objeto.Servicio.Busca;
      SQL:=' SELECT SIT_CONTRATO '
          +' FROM CONTRATO '
          +' WHERE ID_CONTRATO = ' + Objeto.ID_CONTRATO.AsString;
      Q := GetSqlQuery(SQL,Objeto.Apli.SeguDataBaseName,Objeto.Apli.SeguSessionName,True);
      if Q<>nil then
         begin
          try
            vSit := Q.FieldByName('SIT_CONTRATO').AsString;
          Finally
            Q.Free;
          end;
      end;
      if Q=nil then
         Q.Free;
      If vSit = 'AC' Then
         Objeto.Servicio.Busca
      Else
         begin
            ShowMessage('Imposible Asignar un Servicio a un Contrato Inactivo');
            exit;
         end;
   end
   else
   	messagedlg('No hay un contrato asignado',mtError,[mbOK],0);
end;

procedure TwNetSerUsr.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TwNetCto.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


procedure TwNetSerUsr.bServicioClick(Sender: TObject);
  var
   Q : Tquery;
   SQL: string;
   vSit : String;
begin
      SQL:=' SELECT SIT_CONTRATO '
          +' FROM CONTRATO@corp '
          +' WHERE ID_CONTRATO = ' + Objeto.Contrato.FieldByName('ID_CONTRATO').asString;
      Q := GetSqlQuery(SQL,Objeto.Apli.SeguDataBaseName,Objeto.Apli.SeguSessionName,True);
  if Q<>nil then
     begin
      try
        vSit := Q.FieldByName('SIT_CONTRATO').AsString;
      Finally
        Q.Free;
      end;
  end;
  if Q=nil then
     Q.Free;

  If vSit = 'AC' Then
     Objeto.Servicio.Busca
  Else
     begin
        ShowMessage('Imposible Asignar un Servicio a un Contrato Inactivo');
        exit;
     end;
end;

procedure TwNetSerUsr.InterForma1DespuesEliminar(Sender: TObject);
begin Objeto.RefrescaQServicios;
end;

procedure TwNetSerUsr.InterForma1DespuesAceptar(Sender: TObject);
begin
{	if Objeto.Active Then Objeto.Contrato.FindKey([Objeto.ID_CONTRATO.AsString]);}
	Objeto.RefrescaQServicios;
{   bContrato.Visible := False;}
end;

procedure TwNetSerUsr.bContratoClick(Sender: TObject);
Var    Ctto: TNetCto;
begin
   Ctto:= TNetCto.create(self);
   Try
      Ctto.GetParams(Objeto);
      if Ctto.Busca Then
      begin
      	Objeto.ID_CONTRATO.AsString := Ctto.ID_CONTRATO.AsString;
         Objeto.FContrato := Ctto;
      end;
   finally
      Ctto.Free;
   end;
end;

procedure TwNetSerUsr.CatalogoServicioClick(Sender: TObject);
begin	Objeto.Servicio.Catalogo;
end;

end.
