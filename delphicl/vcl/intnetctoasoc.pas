// Sistema         : Clase de NET_CONTRATO
// Fecha de Inicio : 23/06/1998
// Función forma   : Clase de NET_CONTRATO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Jose Alberto Ramirez Pacheco
// Comentarios     :
Unit IntNetCtoAsoc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, DBCtrls, Grids, DBGrids,
  IntNetServic, IntCtto, Menus;

Type
 TNetCtoAso= class;

  TwNetCtoAso=Class(TForm)
    InterForma1             : TInterForma;
    gContratos: TDBGrid;
    nContratos: TDBNavigator;
    GroupBox1: TGroupBox;
    ednombreTitular: TEdit;
    edIdCtoAsoc: TEdit;
    bContrato: TBitBtn;
    lbID_CONTRATO: TLabel;
    edIdContrato: TLabel;
    edCveTipContrato: TEdit;
    edDescTipoContra: TEdit;
    edDescProducto: TEdit;
    edCveProducto: TEdit;
    edCveMoneda: TEdit;
    edDescMoneda: TEdit;
    edNombEmpresa: TEdit;
    edIdEmpresa: TEdit;
    edFAlta: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    rgSitContrato: TRadioGroup;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edCvePerfil: TEdit;
    btnPerfil: TBitBtn;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure bContratoClick(Sender: TObject);
    procedure CatalogoServicioClick(Sender: TObject);
    procedure btnPerfilClick(Sender: TObject);
    procedure InterForma1AntesNuevo(Sender: TObject;
      var Realizado: Boolean);
    procedure ObtenerCtoPadre; // CZR 19-OCT-2010
    procedure InterForma1DespuesCancelar(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TNetCtoAso;
    end;

 TNetCtoAso= class(TInterFrame)
      private
      	FContrato: TInterFrame;
      protected
			procedure SetContrato(Ctto: TInterFrame);
      public
        { Public declarations }
         vId_Contrato : Integer; // CZR 19-OCT-2010

			Id_Contrato: TInterCampo;
         Id_Cto_Asoc: TInterCampo;
         Nombre_Titular: TInterCampo;
         Cve_Tip_contrato: TInterCampo;
         Desc_Tipo_Contra: TInterCampo;
         Cve_Producto: TInterCampo;
         Desc_Producto: TInterCampo;
         Cve_Moneda: TInterCampo;
         Desc_Moneda: TInterCampo;
         Id_Empresa: TInterCampo;
         Nomb_Empresa: TInterCampo;
         F_Alta: TInterCampo;
         Sit_Contrato: TInterCampo;
         cve_perfil : TInterCampo;

        qContratos: TQuery;
        dsContratos: TDataSource;
        ContratoAsoc: TContrato;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;

        procedure DataBaseChange; override;
        Procedure RefrescaQContratos;
        Procedure dsContratosDataChange(Sender: TObject; Field: TField);
        function  InternalBusca : Boolean; override;
        function  ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function  Reporte:Boolean; override;

        Property Contrato: TInterFrame Read FContrato Write SetContrato;
      published
      end;

implementation
//Uses RepMon;

{$R *.DFM}

USES IntNetCto;


constructor TNetCtoAso.Create( AOwner : TComponent );
begin
	Inherited;
   Id_Contrato:=CreaCampo('ID_CONTRATO',ftFloat,tsNinguno,tsNinguno,True);
   Id_Cto_Asoc:=CreaCampo('ID_CTO_ASOC',ftFloat,tsNinguno,tsNinguno,True);
   Nombre_Titular:=CreaCampo('NOMBRE_TITULAR',ftString,tsNinguno,tsNinguno,True);
   Cve_Tip_contrato:=CreaCampo('CVE_TIP_CONTRATO',ftString,tsNinguno,tsNinguno,True);
   Cve_Tip_contrato.Size := 4;
   Desc_Tipo_Contra:=CreaCampo('DESC_TIPO_CONTRA',ftString,tsNinguno,tsNinguno,True);
   Cve_Producto:=CreaCampo('CVE_PRODUCTO',ftString,tsNinguno,tsNinguno,True);
   Cve_Producto.Size := 4;
   Desc_Producto:=CreaCampo('DESC_PRODUCTO',ftString,tsNinguno,tsNinguno,True);
   Cve_Moneda:=CreaCampo('CVE_MONEDA',ftInteger,tsNinguno,tsNinguno,True);
   Desc_Moneda:=CreaCampo('DESC_MONEDA',ftString,tsNinguno,tsNinguno,True);
   Id_Empresa:=CreaCampo('ID_EMPRESA',ftFloat,tsNinguno,tsNinguno,True);
   Nomb_Empresa:=CreaCampo('NOMB_EMPRESA',ftString,tsNinguno,tsNinguno,True);
   F_Alta:=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
   Sit_Contrato:=CreaCampo('SIT_CONTRATO',ftString,tsNinguno,tsNinguno,True);
   cve_perfil:=CreaCampo('cve_perfil',ftString,tsNinguno,tsNinguno,True);

   With Sit_Contrato do
   begin
   	UseCombo := True;
      Size := 2;
      ComboDatos.Add('AC');					ComboLista.Add('0');
      ComboDatos.Add('IN');					ComboLista.Add('1');
      ComboDatos.Add('CA');					ComboLista.Add('2');
   end;

   ContratoAsoc:= TContrato.Create(self);
   ContratoAsoc.MasterSource := self;
   ContratoAsoc.ID_Contrato.MasterField := 'ID_CTO_ASOC';

{   ContratoAsoc.TITNOMBRE.MasterField := 'NOMBRE_TITULAR';
//   ContratoAsoc.Cve_Tip_Contrato.MasterField := 'CVE_TIP_CONTRATO';
//   ContratoAsoc.Producto.TipoContrato.Desc_Tipo_Contra.MasterField := 'DESC_TIPO_CONTRA';
   ContratoAsoc.Cve_Producto.MasterField := 'CVE_PRODUCTO';
//   ContratoAsoc.Producto.Desc_Producto.MasterField := 'DESC_PRODUCTO';
   ContratoAsoc.Cve_Moneda.MasterField := 'CVE_MONEDA';
//   ContratoAsoc.Moneda.Desc_Moneda.MasterField := 'DESC_MONEDA';
   ContratoAsoc.Id_Empresa.MasterField := 'ID_EMPRESA';
//   ContratoAsoc.Empresa.Nombre.MasterField := 'NOMB_EMPRESA';
   ContratoAsoc.F_Alta.MasterField := 'F_ALTA';
   ContratoAsoc.Sit_Contrato.MasterField := 'SIT_CONTRATO';}


   FContrato := nil;
   dsContratos:= TDataSource.Create(self);
   dsContratos.OnDataChange := dsContratosDataChange;

   FKeyFields.Add('ID_CONTRATO');
   FKeyFields.Add('ID_CTO_ASOC');

   TableName:= 'NET_CTO_ASOC';
   UseQuery := True;
end;

Destructor TNetCtoAso.Destroy;
begin
	if qContratos <> nil then qContratos.Free; qContratos := nil;
   if dsContratos <> nil then dsContratos.Free; dsContratos := nil;
	inherited;
end;

procedure TNetCtoAso.DataBaseChange;
begin
	inherited;
	//if Contrato <> nil Then Contrato.GetParams(self);
end;

Function TNetCtoAso.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwNetCtoAso;
begin
   W:=TwNetCtoAso.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.CentrarForma := True;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TNetCtoAso.InternalBusca:Boolean;
Var
	T:TInterFindit;
   Ctto: TNetCto;
begin
	InternalBusca := False;
   T := CreaBuscador('INCtoAso.it','F,S');
   Try
		if Contrato <> nil then
      begin
      	T.WhereString := 'NET_CTO_ASOC.ID_CONTRATO = ' + Contrato.FieldByName('ID_CONTRATO').AsString;
      	T.Param(0,Contrato.FieldByName('ID_CONTRATO').AsString);
      end;

      if T.Execute then
      begin
       		InternalBusca := FindKey([T.DameCampo(0), T.DameCampo(1)]);
            qContratos.Locate('ID_CONTRATO; ID_CTO_ASOC',
										VarArrayOf([T.DameCampo(0), T.DameCampo(1)]),
								      [loCaseInsensitive]);
      end;
   finally  T.Free;
   end;
end;

procedure TNetCtoAso.SetContrato(Ctto: TInterFrame);
begin
	FContrato := Ctto;

   If (Ctto <> nil) Then
   begin
      RefrescaQContratos;
   end;
end;

Procedure TNetCtoAso.RefrescaQContratos;
begin
	if qContratos <> nil then qContratos.Free; qContratos := nil;

   If Contrato <> nil Then
   begin
      qContratos := GetSQLQuery(
         ' select'+
         '   Net_Cto_Asoc.Id_contrato,'+
         '   Net_Cto_Asoc.Id_Cto_Asoc,'+
         '   Net_Cto_Asoc.Nombre_Titular,'+
         '   Net_Cto_Asoc.Sit_Contrato, '+
         '   Net_Cto_Asoc.cve_perfil '+
         ' from'+
         '   Net_Cto_Asoc'+
         ' where'+
         '   Net_Cto_Asoc.Id_Contrato = '+ Contrato.FieldByName('ID_CONTRATO').asString,
         DataBaseName, SessionName, False);


      if qContratos <> nil then
      begin
      	qContratos.FieldByName('ID_CONTRATO').Visible := False;
         qContratos.FieldByName('NOMBRE_TITULAR').DisplayWidth := 67;
         qContratos.FieldByName('ID_CTO_ASOC').DisplayLabel := 'Contrato';
         qContratos.FieldByName('NOMBRE_TITULAR').DisplayLabel := 'Titular';
         qContratos.FieldByName('SIT_CONTRATO').DisplayLabel := 'Situación';
         qContratos.FieldByName('ID_CTO_ASOC').Alignment := taLeftJustify;
         qContratos.FieldByName('SIT_CONTRATO').Alignment := taCenter;
         qContratos.FieldByName('CVE_PERFIL').DisplayLabel := 'Perfil';
      end;
   end;

   dsContratos.DataSet := qContratos;
end;

procedure TNetCtoAso.dsContratosDataChange(Sender: TObject; Field: TField);
begin
	if Field = nil then
   	FindKey([qContratos.FieldByName('ID_CONTRATO').asString,
   			qContratos.FieldByName('ID_CTO_ASOC').asString]);
end;


function TNetCtoAso.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA NET_CONTRATO********************)
(*                                                                              *)
(*  FORMA DE NET_CONTRATO                                                            *)
(*                                                                              *)
(***********************************************FORMA NET_CONTRATO********************)

// CZR 19-OCT-2010
procedure TwNetCtoAso.ObtenerCtoPadre;
begin
   if trim(edIdContrato.caption) = '' then
   begin
      Objeto.Id_Contrato.AsInteger := Objeto.vId_Contrato;
      Objeto.Id_Contrato.DrawControl;
   end;
end;

procedure TwNetCtoAso.FormShow(Sender: TObject);
begin
   Objeto.Id_Contrato.Control := edIdContrato;
   Objeto.Id_Cto_Asoc.Control := edIdCtoAsoc;
   Objeto.Nombre_Titular.Control := edNombreTitular;
   Objeto.Cve_Tip_contrato.Control := edCveTipContrato;
   Objeto.Desc_Tipo_Contra.Control := edDescTipoContra;
   Objeto.Cve_Producto.Control := edCveProducto;
   Objeto.Desc_Producto.Control := edDescProducto;
   Objeto.Cve_Moneda.Control := edCveMoneda;
   Objeto.Desc_Moneda.Control := edDescMoneda;
   Objeto.Id_Empresa.Control := edIdEmpresa;
   Objeto.Nomb_Empresa.Control := edNombEmpresa;
   Objeto.F_Alta.Control := edFAlta;
   Objeto.Sit_Contrato.Control := rgSitContrato;
   Objeto.cve_perfil.Control := edCvePerfil;

   gContratos.DataSource := Objeto.dsContratos;
   nContratos.DataSource := Objeto.dsContratos;

   ObtenerCtoPadre; // CZR 19-OCT-2010
end;

procedure TwNetCtoAso.FormDestroy(Sender: TObject);
begin
   Objeto.Id_Contrato.Control := nil;
   Objeto.Id_Cto_Asoc.Control := nil;
   Objeto.Nombre_Titular.Control := nil;
   Objeto.Cve_Tip_contrato.Control := nil;
   Objeto.Desc_Tipo_Contra.Control := nil;
   Objeto.Cve_Producto.Control := nil;
   Objeto.Desc_Producto.Control := nil;
   Objeto.Cve_Moneda.Control := nil;
   Objeto.Desc_Moneda.Control := nil;
   Objeto.Id_Empresa.Control := nil;
   Objeto.Nomb_Empresa.Control := nil;
   Objeto.F_Alta.Control := nil;
   Objeto.Sit_Contrato.Control := nil;
   Objeto.cve_perfil.Control := nil;
gContratos.DataSource := nil;
end;

procedure TwNetCtoAso.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwNetCtoAso.InterForma1DespuesNuevo(Sender: TObject);
begin
   if Objeto.Contrato <> nil then
   begin
      Objeto.ID_CONTRATO.AsString := Objeto.Contrato.FieldByName('ID_CONTRATO').asString;
      bContratoClick(sender);
   end
   else
      messagedlg('No hay un contrato asignado',mtError,[mbOK],0);
end;

procedure TwNetCtoAso.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;

end;

procedure TwNetCtoAso.InterForma1DespuesEliminar(Sender: TObject);
begin
   Objeto.RefrescaQContratos;
   ObtenerCtoPadre; // CZR 19-OCT-2010   
end;

procedure TwNetCtoAso.InterForma1DespuesAceptar(Sender: TObject);
begin Objeto.RefrescaQContratos;
end;

procedure TwNetCtoAso.bContratoClick(Sender: TObject);
begin
  If Objeto.ContratoAsoc.Busca then
   begin
     If Objeto.ContratoAsoc.Sit_Contrato.AsString = 'AC' Then
        begin
          Objeto.Nombre_Titular.AsString := Objeto.ContratoAsoc.TITNOMBRE.AsString;
          Objeto.Cve_Tip_Contrato.asString := Objeto.ContratoAsoc.Cve_Tip_Contrato.AsString;
          Objeto.Desc_Tipo_Contra.AsString :=  Objeto.ContratoAsoc.Producto.TipoContrato.Desc_Tipo_Contra.AsString;
          Objeto.Cve_Producto.AsString :=  Objeto.ContratoAsoc.Cve_Producto.AsString;
          Objeto.Desc_Producto.AsString :=  Objeto.ContratoAsoc.Producto.Desc_Producto.AsString;
          Objeto.Cve_Moneda.AsString :=  Objeto.ContratoAsoc.Cve_Moneda.AsString;
          Objeto.Desc_Moneda.AsString :=  Objeto.ContratoAsoc.Moneda.Desc_Moneda.AsString;
          Objeto.Id_Empresa.AsString :=  Objeto.ContratoAsoc.Id_Empresa.AsString;
          Objeto.Nomb_Empresa.AsString :=  Objeto.ContratoAsoc.Empresa.Nombre.AsString;
          Objeto.F_Alta.AsString :=  Objeto.ContratoAsoc.F_Alta.AsString;
          Objeto.Sit_Contrato.AsString :=  Objeto.ContratoAsoc.Sit_Contrato.AsString;
     end;
     If Objeto.ContratoAsoc.Sit_Contrato.AsString <> 'AC' Then
        begin
          ShowMessage('Imposible Asociar un Contrato Inactivo');
          exit;
     end;
   end;
end;


procedure TwNetCtoAso.CatalogoServicioClick(Sender: TObject);
begin	Objeto.ContratoAsoc.Catalogo;
end;



procedure TwNetCtoAso.btnPerfilClick(Sender: TObject);
Var
	T:TInterFindit;
begin
  T                   := TInterFindit.Create(Self);  //     InterMsg(tmMal,'',0,'Objeto.Apli.DataBaseName : ' + Objeto.Apli.DataBaseName );
  T.DataBaseName      := Objeto.Apli.DataBaseName;   //     InterMsg(tmMal,'',0,'Objeto.Apli.SessionName  : ' + Objeto.Apli.SessionName  );
  T.SessionName       := Objeto.Apli.SessionName;
  T.SeguDataBaseName  := Objeto.Apli.SeguDataBaseName;
  T.SeguSessionName   := Objeto.Apli.SeguSessionName;
  T.FileName          := 'NETPERFIL';  //Nueva Version que muestra IZ_EMPRESA
  if T.Execute then
  begin
    edCvePerfil.Text      := T.DameCampo(0);
  end;
  T.Free;
end;

// CZR 19-OCT-2010
procedure TwNetCtoAso.InterForma1AntesNuevo(Sender: TObject; var Realizado: Boolean);
var
   Qry : TQuery;
begin
   try
      Qry := GetSqlQuery('SELECT * FROM NET_CONTRATO WHERE ID_CONTRATO = ' + Objeto.Id_Contrato.AsSQL + ' AND B_PRO_FAC_ELEC = ''V''', Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
      if Qry <> nil then
         MessageDlg('Contrato de Proveedor de Factoraje Electrónico, verificar que el acuse de Clave de Usuario se encuentre en el expediente', mtInformation, [mbOk], 0);
      Realizado := True;
   Finally
      Qry.Free;
   end;
end;

procedure TwNetCtoAso.InterForma1DespuesCancelar(Sender: TObject);
begin
   ObtenerCtoPadre; // CZR 19-OCT-2010
end;
end.
