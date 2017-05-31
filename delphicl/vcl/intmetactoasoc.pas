// Sistema         : Clase de NET_CONTRATO
// Fecha de Inicio : 23/06/1998
// Función forma   : Clase de NET_CONTRATO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Jose Alberto Ramirez Pacheco
// Comentarios     :
Unit IntMetaCtoAsoc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun, ComCtrls, DBCtrls, Grids, DBGrids,  Menus,
  //IntCtoHeader,     { Contrato Ligero}
    IntCtto,          { Catálogo de Contratos Corporativos }
    IntCtoConPro,     { Configuración de Captura de Contratos por Producto }
    IntEmple;         { Catálogo de Empleados }

Type
  TMetaCtoAs= class;

  TwMetaCtoAs=Class(TForm)
    InterForma1             : TInterForma;
    gContratos: TDBGrid;
    nContratos: TDBNavigator;
    GroupBox1: TGroupBox;
    ednombreTitular: TEdit;
    edIdContAsociad: TEdit;
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
    edIdEmpleado: TEdit;
    edNomEmpleado: TEdit;
    btnEmpleado: TBitBtn;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure bContratoClick(Sender: TObject);
    procedure CatalogoServicioClick(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure btnEmpleadoClick(Sender: TObject);
  private
  public
    Objeto : TMetaCtoAs;
  end;

  TMetaCtoAs= class(TInterFrame)
  private
    FContrato: TInterFrame;
    ConfigCaptura: TCtoConPro;
  protected
  procedure SetContrato(Ctto: TInterFrame);
  public
    { Public declarations }
    Id_Contrato: TInterCampo;
    Id_Cont_Asociad: TInterCampo;
    Id_Empleado: TInterCampo;

    qContratos: TQuery;
    dsContratos: TDataSource;
    timerCto: TTimer;
    ContratoAsoc: TContrato;
    Empleado: TEmpleado;

    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    procedure DataBaseChange; override;
    function  InternalBusca : Boolean; override;
    function  ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    function  Reporte:Boolean; override;
    Procedure RefrescaQContratos(pContratoDefault: Integer = 0);
    Procedure IniciaConfigContrato(pIdEmpresa: Integer; pCveProducto: String);
    Procedure dsContratosDataChange(Sender: TObject; Field: TField);
    Procedure OnTimerContrato(Sender: TObject);
    Procedure LocalizaContrato(pIdContrato, pIdContAsociad: String);

    Property Contrato: TInterFrame Read FContrato Write SetContrato;
  end;

implementation
//Uses RepMon;

{$R *.DFM}

constructor TMetaCtoAs.Create( AOwner : TComponent );
begin
	Inherited;
   Id_Contrato:=CreaCampo('ID_CONTRATO',ftFloat,tsNinguno,tsNinguno,True);
   Id_Cont_Asociad:=CreaCampo('ID_CONT_ASOCIAD',ftFloat,tsNinguno,tsNinguno,True);
   Id_Empleado:= CreaCampo('ID_EMPLEADO', ftFloat, tsNinguno, tsNinguno, True);

   ContratoAsoc:= TContrato.Create(self);
   ContratoAsoc.MasterSource := self;
   ContratoAsoc.ID_Contrato.MasterField := 'ID_CONT_ASOCIAD';

   Empleado:= TEmpleado.Create(Self);
   Empleado.MasterSource:= self;
   Empleado.Id_Persona.MasterField:= 'ID_EMPLEADO';

   ConfigCaptura:= TCtoConPro.Create(Self);

   FContrato := nil;
   dsContratos:= TDataSource.Create(self);
   dsContratos.OnDataChange := dsContratosDataChange;

   timerCto:= TTimer.Create(Self);
   timerCto.Interval:= 1000; //1 seg
   timerCto.Enabled:= False;
   timerCto.OnTimer:= OnTimerContrato;


   FKeyFields.Add('ID_CONTRATO');
   FKeyFields.Add('ID_CONT_ASOCIAD');

   TableName:= 'CTO_ASOCIADO';
   UseQuery := True;
end;

Destructor TMetaCtoAs.Destroy;
begin
  if qContratos <> nil then qContratos.Free; qContratos := nil;
  if dsContratos <> nil then dsContratos.Free; dsContratos := nil;
  If ConfigCaptura <> nil then ConfigCaptura.Free; ConfigCaptura:= nil;
  inherited;
end;

procedure TMetaCtoAs.DataBaseChange;
begin
  inherited;
  ConfigCaptura.GetParams(Self);
end;

Function TMetaCtoAs.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMetaCtoAs;
begin
   W:=TwMetaCtoAs.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.ShowBtnModificar:= False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.CentrarForma := True;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TMetaCtoAs.InternalBusca:Boolean;
Var
	T:TInterFindit;
begin
	InternalBusca := False;
   T := CreaBuscador('IMCTOASO.IT','F,F,S');
   Try
		if Contrato <> nil then
      begin
      	T.WhereString := 'CTO_ASOCIADO.ID_CONTRATO = ' + Contrato.FieldByName('ID_CONTRATO').AsString;
      	T.Param(0,Contrato.FieldByName('ID_CONTRATO').AsString);
      end;

      if T.Execute then
      begin
       		InternalBusca := FindKey([T.DameCampo(0), T.DameCampo(1)]);
          LocalizaContrato(T.DameCampo(0), T.DameCampo(1));
{
            qContratos.Locate('ID_CONTRATO; ID_CONT_ASOCIAD',
										VarArrayOf([T.DameCampo(0), T.DameCampo(1)]),
								      [loCaseInsensitive]);
}
      end;
   finally  T.Free;
   end;
end;


Procedure TMetaCtoAs.LocalizaContrato(pIdContrato, pIdContAsociad: String);
Begin
  if qContratos <> nil then
    qContratos.Locate('ID_CONTRATO; ID_CONT_ASOCIAD',
										  VarArrayOf([pIdContrato, pIdContAsociad]),
								      [loCaseInsensitive]);
end;


procedure TMetaCtoAs.SetContrato(Ctto: TInterFrame);
begin
  FContrato := Ctto;
  IniciaConfigContrato(Ctto.FieldByName('ID_EMPRESA').asInteger,
                       Ctto.FieldByName('CVE_PRODUCTO').AsString);
  RefrescaQContratos;
end;


Procedure TMetaCtoAs.IniciaConfigContrato(pIdEmpresa: Integer; pCveProducto: String);
Begin
  If (Contrato <> nil) and (pIdEmpresa > 0) and (pCveProducto <> '') Then
    ConfigCaptura.FindKey([pIdEmpresa, pCveProducto]);

  If ConfigCaptura.Active Then
  Begin
    If ConfigCaptura.B_Val_Empresa.AsString = 'V' Then
    Begin
      ContratoAsoc.FilterString:= 'Contrato.Id_Empresa = ' +  Contrato.FieldByName('ID_EMPRESA').asString;
      ContratoAsoc.BuscaWhereString:= ContratoAsoc.FilterString;
    end;
  end;
end;


Procedure TMetaCtoAs.RefrescaQContratos(pContratoDefault: Integer = 0);
begin
  if qContratos <> nil then qContratos.Free; qContratos := nil;

  If Contrato <> nil Then
  begin
      qContratos:= GetSQLQuery(
        ' SELECT Id_Contrato, Id_Cont_Asociad, ' +
        '        SubStr(PkgFunProcCorp.ClientePromotor(Id_Cont_Asociad, ''NOMBRE_CLIENTE''), 1, 80) Nombre_Titular ' +
        ' FROM Cto_Asociado ' +
        ' WHERE Cto_Asociado.Id_Contrato = ' + Contrato.FieldByName('ID_CONTRATO').asString,
         DataBaseName, SessionName, False);

      if qContratos <> nil then
      begin
      	qContratos.FieldByName('ID_CONTRATO').Visible := False;
        qContratos.FieldByName('NOMBRE_TITULAR').DisplayWidth := 77;
        qContratos.FieldByName('ID_CONT_ASOCIAD').DisplayLabel := 'Contrato';
        qContratos.FieldByName('NOMBRE_TITULAR').DisplayLabel := 'Titular';
        qContratos.FieldByName('ID_CONT_ASOCIAD').Alignment := taLeftJustify;
      end;
  end;

  If pContratoDefault > 0 Then
    LocalizaContrato(Contrato.FieldByName('ID_CONTRATO').asString,
                     IntToStr(pContratoDefault));

  dsContratos.DataSet := qContratos;
end;

procedure TMetaCtoAs.dsContratosDataChange(Sender: TObject; Field: TField);
begin
  if Field = nil Then
  Begin
    timerCto.Enabled:= False;
    timerCto.Enabled:= True;
  end;
end;


procedure TMetaCtoAs.OnTimerContrato(Sender: TObject);
Begin
  timerCto.Enabled:= False;
  If ContratoAsoc.ID_Contrato.AsInteger <> qContratos.FieldByName('ID_CONT_ASOCIAD').asInteger Then
    FindKey([qContratos.FieldByName('ID_CONTRATO').asString,
             qContratos.FieldByName('ID_CONT_ASOCIAD').asString]);
end;


function TMetaCtoAs.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA NET_CONTRATO********************)
(*                                                                              *)
(*  FORMA DE NET_CONTRATO                                                            *)
(*                                                                              *)
(***********************************************FORMA NET_CONTRATO********************)

procedure TwMetaCtoAs.FormShow(Sender: TObject);
begin
  With Objeto do
  Begin
    Id_Contrato.Control := edIdContrato;
    Id_Cont_Asociad.Control:= edIdContAsociad;
    Id_Empleado.control:= edIdEmpleado;

    ContratoAsoc.TITNOMBRE.Control := edNombreTitular;
    ContratoAsoc.Cve_Tip_contrato.Control := edCveTipContrato;
    ContratoAsoc.Producto.TipoContrato.Desc_Tipo_Contra.Control := edDescTipoContra;
    ContratoAsoc.Cve_Producto.Control := edCveProducto;
    ContratoAsoc.Desc_Producto.Control:= edDescProducto;
    ContratoAsoc.Cve_Moneda.Control := edCveMoneda;
    ContratoAsoc.Desc_Moneda.Control := edDescMoneda;
    ContratoAsoc.Id_Empresa.Control := edIdEmpresa;
    ContratoAsoc.EmpNombre.Control := edNombEmpresa;
    ContratoAsoc.F_Alta.Control := edFAlta;
    ContratoAsoc.Sit_Contrato.Control := rgSitContrato;

    Empleado.Persona.Nombre.Control:= edNomEmpleado;

    gContratos.DataSource := dsContratos;
    nContratos.DataSource := dsContratos;
  end;
end;

procedure TwMetaCtoAs.FormDestroy(Sender: TObject);
begin
  With Objeto do
  Begin
    Id_Contrato.Control := nil;
    Id_Cont_Asociad.Control:= nil;
    Id_Empleado.control:= nil;

    ContratoAsoc.TITNOMBRE.Control := nil;
    ContratoAsoc.Cve_Tip_contrato.Control := nil;
    ContratoAsoc.Producto.TipoContrato.Desc_Tipo_Contra.Control := nil;
    ContratoAsoc.Cve_Producto.Control := nil;
    ContratoAsoc.Desc_Producto.Control:= nil;
    ContratoAsoc.Cve_Moneda.Control := nil;
    ContratoAsoc.Desc_Moneda.Control := nil;
    ContratoAsoc.Id_Empresa.Control := nil;
    ContratoAsoc.EmpNombre.Control := nil;
    ContratoAsoc.F_Alta.Control := nil;
    ContratoAsoc.Sit_Contrato.Control := nil;

    Empleado.Persona.Nombre.Control:= nil;
  end;

	gContratos.DataSource := nil;
  nContratos.DataSource:= nil;
end;

procedure TwMetaCtoAs.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMetaCtoAs.InterForma1DespuesNuevo(Sender: TObject);
begin
	if Objeto.Contrato <> nil then
   begin
   	Objeto.ID_CONTRATO.AsString := Objeto.Contrato.FieldByName('ID_CONTRATO').asString;
      bContratoClick(sender);
   end                
   else
   	MessageDlg('No hay un contrato de grupo asignado',mtError,[mbOK],0);
end;

procedure TwMetaCtoAs.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TwMetaCtoAs.InterForma1DespuesEliminar(Sender: TObject);
begin Objeto.RefrescaQContratos;
end;

procedure TwMetaCtoAs.InterForma1DespuesAceptar(Sender: TObject);
begin Objeto.RefrescaQContratos(Objeto.ContratoAsoc.ID_Contrato.AsInteger);
end;

procedure TwMetaCtoAs.bContratoClick(Sender: TObject);
begin Objeto.ContratoAsoc.Busca;
end;


procedure TwMetaCtoAs.CatalogoServicioClick(Sender: TObject);
begin	Objeto.ContratoAsoc.Catalogo;
end;

procedure TwMetaCtoAs.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
Var idContrato: Integer;
    cvePerJur: String;
begin
  Try
    { Valida que el contrato de grupo este asignado }
    If (Objeto.Contrato = nil) Then
      Raise EInterFrame.Create('No hay un contrato de grupo asignado');

    { El contrato debe pertenecer a la empresa del contrato de grupo }
    If Objeto.ConfigCaptura.B_Val_Empresa.AsString = 'V' Then
    Begin
      If Objeto.Contrato.FieldByName('ID_EMPRESA').AsInteger <> Objeto.ContratoAsoc.Id_Empresa.AsInteger Then
        Raise EInterFrame.Create('El contrato asociado debe pertenecer a la misma empresa');
    end;


    { El contrato debe tener la misma personalidad Juridica que el contrato de grupo }
    If Objeto.ConfigCaptura.B_Val_Per_Jur.AsString = 'V' Then
    Begin
      If GetSQLStr(' SELECT Cve_Per_Jur_Prod '+
                   ' FROM Producto '+
                   ' WHERE Cve_Producto = '+ Objeto.Contrato.FieldByName('CVE_PRODUCTO').asSql,
                   Objeto.DataBaseName, Objeto.SessionName, 'CVE_PER_JUR_PROD', cvePerJur, False)
         and  (Objeto.ContratoAsoc.Producto.Cve_Per_Jur_Prod.AsString <> cvePerJur) Then
      Begin
        If cvePerJur = 'PF' Then
          Raise EInterFrame.Create('El contrato asociado debe ser de Personas Físicas.')
        else If cvePerJur = 'PF' Then
          Raise EInterFrame.Create('El contrato asociado debe ser de Personas Morales.')
        else Raise EInterFrame.Create('El contrato asociado debe tener la misma personalidad juridica que el contrato de grupo.');
      end;
    end;


    { Valida que el contrato no esté asociado a otro contrato de grupo con el mismo producto }
    If Objeto.ConfigCaptura.B_Val_Repetido.AsString = 'V' Then
    Begin
      If GetSQLInt(' SELECT Cto_Asociado.Id_Contrato '+
                   ' FROM Cto_Asociado, Contrato'+
                   ' WHERE Cto_Asociado.Id_Cont_Asociad = '+ Objeto.ContratoAsoc.ID_Contrato.AsString +
                   '   AND Cto_asociado.Id_Contrato = Contrato.Id_Contrato'+
                   '   AND Contrato.Cve_Producto = ''' + Objeto.Contrato.FieldByName('CVE_PRODUCTO').asString  + '''',
                   //'   and Contrato.Cve_Tip_Contrato = ''' + Objeto.Contrato.FieldByName('CVE_TIP_CONTRATO').asString  +'''',
                   Objeto.DataBaseName, Objeto.SessionName, 'ID_CONTRATO', IdContrato, False) then
        Raise EInterFrame.Create('El contrato ya está asociado al contrato: ' + IntToStr(IdContrato));
    end;
    Realizado := True;

  Except
    On E: Exception do
    Begin
      Realizado := False;
      MessageDlg('Error al asociar el contrato ' + Objeto.ContratoAsoc.ID_Contrato.AsString +
        chr(VK_RETURN) + e.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TwMetaCtoAs.btnEmpleadoClick(Sender: TObject);
begin Objeto.Empleado.Busca;
end;

end.
