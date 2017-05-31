// Sistema         : Clase de Producto
// Fecha de Inicio : Diciembre de 1997
// Función forma   : Clase de Producto
// Desarrollo por  : Victor Martinez, Alberto Ramirez, Julio Ruiloba
// Comentarios     :

unit IntProd;

interface


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, IntTCto, IntMon, InterFun, ComCtrls, UnSQL2, Menus, IntDtPk,
  RepProd2, RepProd3, InterEdit;

Const fbTProductoForward=1;

type
  TProducto = Class;
  TWProducto = class(TForm)
    InterForma1     : TInterForma;
    rgSitProducto: TRadioGroup;
    lbCveProducto: TLabel;
    Label3: TLabel;
    edDescCProducto: TEdit;
    lbDescProducto: TLabel;
    edDescProducto: TEdit;
    lbCveTipContrato: TLabel;
    edCveTipContrato: TEdit;
    edDescTipoContra: TEdit;
    lbCveMoneda: TLabel;
    edCveMoneda: TEdit;
    edDescMoneda: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    rgCvePerJurProd: TRadioGroup;
    Bevel1: TBevel;
    Label5: TLabel;
    Bevel2: TBevel;
    edCveProducto: TEdit;
    PopupTipoContrato: TPopupMenu;
    PopupMoneda: TPopupMenu;
    Catlogo1: TMenuItem;
    edFPuestVigProd: TEdit;
    lbFPuestVigProd: TLabel;
    sbBuscaTipoContrato: TSpeedButton;
    sbBuscaMoneda: TSpeedButton;
    Catalogo1: TMenuItem;
    MacvDatePicker1: MacvDatePicker;
    PopupReportes: TPopupMenu;
    N1: TMenuItem;
    Listado: TMenuItem;
    GestionProducto: TMenuItem;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ChkBxBContrataNet: TCheckBox;
    iedPtosRiesgo: TInterEdit;
    Label1: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender : TObject);
    procedure sbBuscaTipoContratoClick(Sender: TObject);
    procedure Catlogo1Click(Sender: TObject);
    procedure sbBuscaMonedaClick(Sender: TObject);
    procedure Catalogo1Click(Sender: TObject);
    procedure ListadoClick(Sender: TObject);
    procedure DatosProductoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure GestionProductoClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    Procedure DespuesAceptar(sender: TObject);
    Procedure DespuesCancelar(sender: TObject);
  private
  public
    Producto: TProducto;
  end;

  TProducto = class(TInterFrame)
  private
    vgCopiaProducto: Boolean;
    vgqCopia: TQuery;
  protected
  public
    Cve_Producto     : TInterCampo;
    Cve_Tip_Contrato : TInterCampo;
    Cve_Moneda       : TInterCampo;
    Cve_Per_Jur_Prod : TInterCampo;
    Desc_Producto    : TInterCampo;
    Desc_C_Producto  : TInterCampo;
    F_Puest_Vig_Prod : TInterCampo;
    Sit_Producto     : TInterCampo;
    B_Contrata_Net   : TInterCampo;
    Ptos_Riesgo      : TInterCampo;

    TipoContrato     : TTipoCto;
    Moneda  	       : TMoneda;
    function InternalBusca : Boolean; override;
    function InternalPost : Boolean; override;
    function CopiaProducto(pCveProd, pNvaCveProd, pDescCorta, pDesc:String): Boolean;
    function ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    constructor Create( AOwner : TComponent ); override;
    destructor Destroy; override;
    function Reporte: Boolean;
    Procedure SetFilterBy(Filter:Integer); override;
  published
  end;

implementation

{$R *.DFM}

Uses IntRepProd;

constructor TProducto.Create( AOwner : TComponent );
begin
   Inherited;
   Cve_Producto := CreaCampo('CVE_PRODUCTO',ftString,tsNinguno,tsNinguno,True);
   Cve_Tip_Contrato := CreaCampo('CVE_TIP_CONTRATO',ftString,tsNinguno,tsNinguno,True);
   Cve_Moneda := CreaCampo('CVE_MONEDA',ftInteger,tsNinguno,tsNinguno,True);
   Desc_Producto := CreaCampo('DESC_PRODUCTO',ftString,tsNinguno,tsNinguno,True);
   Desc_C_Producto := CreaCampo('DESC_C_PRODUCTO',ftString,tsNinguno,tsNinguno,True);
   F_Puest_Vig_Prod := CreaCampo('F_PUEST_VIG_PROD',ftDate,tsNinguno,tsNinguno,True);
   Sit_Producto := CreaCampo('SIT_PRODUCTO',ftString,tsNinguno,tsNinguno,True);
   With Sit_Producto do
   begin
   	UseCombo := True;
		ComboLista.Add('0');					ComboDatos.Add('AC');
		ComboLista.Add('1');					ComboDatos.Add('IN');
		ComboLista.Add('2');					ComboDatos.Add('BL');
   end;
   Cve_Per_Jur_Prod := CreaCampo('CVE_PER_JUR_PROD',ftString,tsNinguno,tsNinguno,True);
   With Cve_Per_Jur_Prod do
   begin
   	Cve_Per_Jur_Prod.UseCombo := True;
		ComboLista.Add('0');					ComboDatos.Add('PF');
		ComboLista.Add('1');					ComboDatos.Add('PM');
   end;
   B_Contrata_Net := CreaCampo('B_CONTRATA_NET',ftString,tsNinguno,tsNinguno,True);
   B_Contrata_Net.Size := 1;
   B_Contrata_Net.SetAsString('F');
   Ptos_Riesgo:= CreaCampo('PTOS_RIESGO', ftFloat, tsNinguno, tsNinguno, True);

   FActive := False;
   TableName := 'PRODUCTO';
   UseQuery := True;
   FKeyFields.Add('CVE_PRODUCTO');
   HelpFile := 'IntProd.hlp';

   TipoContrato:=TTipoCto.Create(Self);
   TipoContrato.MasterSource:=Self;
   TipoContrato.FieldByName('CVE_TIP_CONTRATO').MasterField:='CVE_TIP_CONTRATO';

   Moneda:=TMoneda.Create(Self);
   Moneda.MasterSource:=Self;
   Moneda.FieldByName('CVE_MONEDA').MasterField:='CVE_MONEDA';

   //TipoContrato.OnDespuesBusca:=OnTitularDespuesBusca;
   vgCopiaProducto := False;
   vgqCopia:= nil;
   IsCorp:=True;
end;

destructor TProducto.Destroy;
begin
  if vgqCopia <> nil then vgqCopia.Free;
  if TipoContrato <> nil then TipoContrato.Free;
  if Moneda <> nil then Moneda.Free;
  inherited;
end;

Procedure TProducto.SetFilterBy(Filter:Integer);
begin
 Inherited;
end;

function TProducto.CopiaProducto(pCveProd, pNvaCveProd, pDescCorta, pDesc:String): Boolean;
var
  ProductoCopiado: Boolean;
begin
  CopiaProducto := False;
  if pDesc = '' then
     pDesc := pDescCorta;
  try
    ProductoCopiado := False;
    if RunSQL(
       'INSERT INTO Producto(CVE_PRODUCTO, CVE_TIP_CONTRATO, CVE_MONEDA, CVE_PER_JUR_PROD, DESC_PRODUCTO, ' +
       '                     DESC_C_PRODUCTO, F_PUEST_VIG_PROD, SIT_PRODUCTO, B_CONTRATA_NET, PTOS_RIESGO, ' +
       '                     CVE_PROD_PROSPEC) ' +
       ' (select '''+ pNvaCveProd +''', ' +
       '     Cve_Tip_Contrato,'+
       '     Cve_Moneda,'+
       '     Cve_Per_Jur_prod,'+
       '     '''+ pDesc +''', '+
       '     '''+ pDescCorta +''', '+
       '     to_date('''+ formatDateTime('dd/mm/yyyy',Now) +''',''dd/mm/yyyy''), '+
       '     Sit_Producto, '+
       '     B_Contrata_Net, '+
       '     Ptos_Riesgo, ' +
       '     NULL ' +
       '  from Producto'+
       '  where cve_producto = '''+ pCveProd+''')',
           DataBaseName, SessionName, False) then
      ProductoCopiado := True;
    if ProductoCopiado then begin
       CopiaProducto := True;
       ShowMessage('Se creó el producto '+pNvaCveProd+' - '+pDesc);
       RunSQL('INSERT INTO Req_Prod_Ctte(ID_EMPRESA, CVE_PRODUCTO, CVE_REQUISITO, CVE_CONTRATANTE, CVE_CONCEP_CTTE, F_VIGENCIA, B_BLOQUEA_CTO)'+
            '	(select '+
            '     Id_Empresa,'+
	         '     '''+ pNvaCveProd +''', '+
            '     Cve_Requisito,'+
            '     Cve_Contratante, '+
            '     Cve_Concep_Ctte, F_Vigencia, B_Bloquea_Cto ' +
            '  From Req_Prod_Ctte'+
	         '  where cve_producto = '''+ pCveProd+''')',
            DataBaseName, SessionName, False);

       RunSQL('INSERT INTO Prod_Aut_Empresa(ID_EMPRESA, CVE_PRODUCTO, SIT_PROD_AUT) ' +
            '	(select '+
            '     Id_Empresa,'+
            '     '''+ pNvaCveProd +''', '+
            '     Sit_Prod_Aut'+
            '  from Prod_Aut_Empresa'+
	         '  where cve_producto = '''+ pCveProd+''')',
            DataBaseName, SessionName, False);

       RunSQL('INSERT INTO Doc_Prod_Cto(ID_EMPRESA, CVE_PRODUCTO, CVE_DOCUMENTO, F_VIGENCIA, B_BLOQUEA_CTO) '+
            '	(select '+
            '     Id_Empresa,'+
            '     '''+ pNvaCveProd +''', '+
            '     Cve_Documento, '+
            '     F_Vigencia, B_Bloquea_Cto ' +
            '  From Doc_Prod_Cto'+
	    '  Where Cve_Producto = ''' + pCveProd + ''')',
            DataBaseName, SessionName, False);
    end
    else
       Raise EInterFrame.Create('No se pudeo realizar la copia del producto '+ pDesc);
  Except
    Raise EInterFrame.Create('No se pudeo realizar la copia del producto '+ pDesc);
  end;
end;

function TProducto.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
  W : TWProducto;
begin
  W := TWProducto.Create(Self);
  try
    W.Producto := Self;
    W.InterForma1.InterFrame:=Self;
    W.InterForma1.FormaTipo := FormaTipo;
    W.InterForma1.ShowGrid := False;
    W.InterForma1.ShowNavigator := False;
    W.InterForma1.Funcion := FInterFun;
    W.InterForma1.ShowModal;
    ShowWindow := W.InterForma1.ModalResult;
  finally
    W.Free;
  end;
end;

function TProducto.InternalBusca : Boolean;
Var
  T : TInterFindit;
begin
  InternalBusca := False;
  if FilterbY=fbTProductoForward
     then  T := CreaBuscador('IntProdF.it','S')
     else  T := CreaBuscador('IntProd.it', 'S');
  try
     if Active then
        T.Param(0,Cve_Producto.AsString);
     if T.Execute then
        InternalBusca := FindKey([T.DameCampo(0)]);
  finally
     T.Free;
  end;
end;

function TProducto.InternalPost : Boolean;
begin
  Result := False;
  if vgCopiaProducto then begin					{Copia del producto desde ventana}
     if CopiaProducto(vgqCopia.FieldByName('CVE_PRODUCTO').asString,Cve_Producto.AsString,
                      Desc_C_Producto.AsString,Desc_Producto.AsString) then
      	Result := True;
  end
  else
     inherited InternalPost;
end;

function TProducto.Reporte: Boolean;
var
  Reporte: TReporteProducto;
Begin
  Reporte:= TReporteProducto.Create(Self);
  try
     Reporte.IsCheckSecu := False;
     Reporte.Apli := Self.Apli;
     if Active then Reporte.Producto.FindKey([self.Cve_Producto.asString]);
     Reporte.Catalogo
  finally
     Reporte.Free;
  end;
end;

(***********************************************FORMA DE PRODUCTO****************)
(*                                                                              *)
(*  FORMA DE PRODUCTO                                                           *)
(***********************************************FORMA DE PRODUCTO****************)

procedure TWProducto.FormShow(Sender : TObject);
begin
  Producto.Cve_Producto.Control     := edCveProducto;
  Producto.Cve_Tip_Contrato.Control := edCveTipContrato;
  Producto.Cve_Moneda.Control 	    := edCveMoneda;
  Producto.Cve_Per_Jur_Prod.Control := rgCvePerJurProd;
  Producto.Desc_Producto.Control    := edDescProducto;
  Producto.Desc_C_Producto.Control  := edDescCProducto;
  Producto.F_Puest_Vig_Prod.Control := edFPuestVigProd;
  Producto.Sit_Producto.Control     := rgSitProducto;
  Producto.B_Contrata_Net.Control   := ChkBxBContrataNet;
  Producto.Ptos_Riesgo.Control      := iedPtosRiesgo;

  Producto.TipoContrato.Desc_Tipo_Contra.Control := edDescTipoContra;
  Producto.Moneda.Desc_Moneda.Control 		 := edDescMoneda;
  Producto.TipoContrato.MasterSourceEditControl  := sbBuscaTipoContrato;
  Producto.Moneda.MasterSourceEditControl 	 := sbBuscaMoneda;
  InterForma1.OnDespuesAceptar  := DespuesAceptar;
  InterForma1.OnDespuesCancelar := DespuesCancelar;
end;

procedure TWProducto.FormDestroy(Sender : TObject);
begin
  Producto.Cve_Producto.Control     := nil;
  Producto.Cve_Tip_Contrato.Control := nil;
  Producto.Cve_Moneda.Control 	    := nil;
  Producto.Cve_Per_Jur_Prod.Control := nil;
  Producto.Desc_Producto.Control    := nil;
  Producto.Desc_C_Producto.Control  := nil;
  Producto.F_Puest_Vig_Prod.Control := nil;
  Producto.Sit_Producto.Control     := nil;
  Producto.B_Contrata_Net.Control   := nil;
  Producto.Ptos_Riesgo.Control      := nil;

  Producto.TipoContrato.Desc_Tipo_Contra.Control := nil;
  Producto.Moneda.Desc_Moneda.Control 		 := nil;
  Producto.TipoContrato.MasterSourceEditControl  := nil;
  Producto.Moneda.MasterSourceEditControl 	 := nil;
end;

Procedure TWProducto.DespuesAceptar(sender: TObject);
begin
  Producto.Cancel;
end;

Procedure TWProducto.DespuesCancelar(sender: TObject);
begin
  Producto.vgCopiaProducto := False;
  if Producto.vgqCopia <> nil then begin
     Producto.vgqCopia.Free;
     Producto.vgqCopia := nil;
  end;
end;

procedure TWProducto.FormClose(Sender : TObject; var Action : TCloseAction);
begin
   Action := caFree;
end;

procedure TWProducto.InterForma1DespuesNuevo(Sender : TObject);
var
  Q: TQuery;
begin
  if(Producto.vgCopiaProducto) and (Producto.vgqCopia <> nil) then begin
    {Copia del producto desde ventana}
     Producto.TipoContrato.FindKey([Producto.vgqCopia.FieldByName('CVE_TIP_CONTRATO').asString]);
     Producto.Moneda.FindKey([Producto.vgqCopia.FieldByName('CVE_MONEDA').asString]);
     Producto.Cve_Per_Jur_Prod.AsString := Producto.vgqCopia.FieldByName('CVE_PER_JUR_PROD').asString;
     Producto.F_Puest_Vig_Prod.AsDateTime := Now;
     Producto.Sit_Producto.AsString := Producto.vgqCopia.FieldByName('SIT_PRODUCTO').asString
  end
  else begin
     rgSitProducto.ItemIndex := 0;
     edCveProducto.SetFocus;
  end;
end;

procedure TWProducto.sbBuscaTipoContratoClick(Sender: TObject);
begin
  If Producto.ValidaAccesoEsp('PROD_TIPCTO',True,True) Then
  Begin
    Producto.TipoContrato.Busca;
  End;
end;

procedure TWProducto.Catlogo1Click(Sender: TObject);
begin
  Producto.TipoContrato.Catalogo;
end;

procedure TWProducto.sbBuscaMonedaClick(Sender: TObject);
begin
  If Producto.ValidaAccesoEsp('PROD_MONEDA',True,True) Then
  Begin
    Producto.Moneda.Busca;
  End;
end;

procedure TWProducto.Catalogo1Click(Sender: TObject);
begin
  Producto.Moneda.Catalogo;
end;

procedure TWProducto.BitBtn1Click(Sender: TObject);
begin
  If Producto.ValidaAccesoEsp('PROD_REPORTE',True,True) Then
  Begin
    Producto.Reporte;
  End;
end;

procedure TWProducto.ListadoClick(Sender: TObject);
begin
  Execute_RepProd3(True,Producto);
end;

procedure TWProducto.GestionProductoClick(Sender: TObject);
begin
  Producto.Reporte;
end;

procedure TWProducto.DatosProductoClick(Sender: TObject);
begin
  Producto.Reporte;
end;

procedure TWProducto.BitBtn2Click(Sender: TObject);
var
  Realizado: Boolean;
begin
  If Producto.ValidaAccesoEsp('PROD_COPIAPROD',True,True) Then
  Begin
    if Producto.Active then begin
       Producto.vgCopiaProducto := True;
       if Producto.vgqCopia <> nil then
          Producto.vgqCopia.Free;
       Producto.vgqCopia := nil;
       Producto.vgqCopia:= GetSqlQuery('Select * from Producto Where Cve_Producto = '''+ Producto.Cve_producto.asString+'''',Producto.DataBaseName, Producto.SessionName, False);
       InterForma1.BtnNuevoClick(Self);		{Manda a Interforma a nuevo, los datos se copian en OnDespuesNuevo}
    end
    else
       Raise EInterFrame.Create('No Existe un Producto seleccionado para copiar');
  End;
end;

end.
