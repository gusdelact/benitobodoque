 // Sistema         : Clase de CR_AM_CINV
 // Fecha de Inicio : 17/03/2010
 // Función forma   : Clase de CR_AM_CINV
 // Desarrollo por  : MACV. Class Maker.
 // Diseñado por    : Manuel Romero Ibarra
 // Comentarios     :
unit IntCrConInv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm, DB, DBTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntParamCre,
  IntFind, UnSQL2, InterFun, ComCtrls, IntDtPk,
  IntLinkit, InterEdit, IntSGCtrl,
  IntCrCredito,  // Crédito
  IntCatConInv  //Catálogo de conceptos de inversión
  ;

type
  TCrConInv = class;

  TWCrConInv = class(TForm)
    InterForma1:      TInterForma;
    lbID_DESPACHO:    TLabel;
    lbNOMBRE_SPVISOR: TLabel;
    lbTXT_COMENTARIO: TLabel;
    lbID_PROMOTOR:    TLabel;
    Label2:           TLabel;
    btID_CREDITO: TBitBtn;
    edDESC_CON_INV: TEdit;
    edIMPORTE: TInterEdit;
    Label1:           TLabel;
    bCVE_CON_INV: TBitBtn;
    sgConceptos: TSGCtrl;
    bCAT_CON_INV: TBitBtn;
    ilDescConInv: TInterLinkit;
    MsgPanel: TPanel;
    edConsecutivo: TEdit;
    edID_CREDITO: TEdit;
    edB_REC_PRES: TRadioGroup;
    Label3: TLabel;
    Label4: TLabel;
    edTotalPrestamo: TInterEdit;
    edTotalRecPropios: TInterEdit;
    ilCredito: TInterLinkit;
    edNOM_ACREDITADO: TEdit;
    edID_ACREDITADO: TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    Label5: TLabel;
    edCVE_CON_INV: TEdit;
    Label6: TLabel;
    edUNIDADES: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure btID_CREDITOClick(Sender: TObject);
    procedure btPROM_ADMClick(Sender: TObject);
    procedure ilDescConInvEjecuta(Sender: TObject);
    procedure bCAT_CON_INVClick(Sender: TObject);
    procedure ilCreditoEjecuta(Sender: TObject);
    procedure edID_CREDITOExit(Sender: TObject);
    procedure edIMPORTEExit(Sender: TObject);
    procedure B_REC_PRESExit(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure edB_REC_PRESClick(Sender: TObject);
    procedure edTotalRecPropiosExit(Sender: TObject);
    procedure edTotalPrestamoExit(Sender: TObject);
    procedure sgConceptosDblClick(Sender: TObject);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    procedure edCVE_CON_INVExit(Sender: TObject);
    procedure edUNIDADESExit(Sender: TObject);
    procedure InterForma1Aceptar(Sender: TObject; var Realizado: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    Objeto: TCrConInv;
    ultimo_id_credito : String;

    procedure Consecutivo;
    procedure Conceptos;
    function VerificaImporte:Boolean;
    function VerificaCInv:Boolean;
  end;

  TCrConInv = class(TInterFrame)
  private
  protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
  public
    { Public declarations }
    ID_CREDITO       : TInterCampo;
    CVE_CON_INV      : TInterCampo;
    IMPORTE          : TInterCampo;
    B_REC_PRES       : TInterCampo;
    UNIDADES         : TInterCampo;

    ParamCre         : TParamCre;
    Credito          : TCrCredito; //Disposición
    CatConInv        : TCatConInv; //Catálogo de conceptos de inversión

    function InternalBusca: boolean; override;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function ShowWindow(FormaTipo: TFormaTipo): integer; override;
    function Reporte: boolean; override;
  published
  end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrConInv.Create(AOwner: TComponent);
begin
  inherited;
  ID_CREDITO := CreaCampo('ID_CREDITO', ftFloat, tsNinguno, tsNinguno, True);
  ID_CREDITO.Caption := 'Número de Credito';
  CVE_CON_INV := CreaCampo('CVE_CON_INV', ftString, tsNinguno, tsNinguno, True);
  CVE_CON_INV.Caption := 'Clave de concepto de inversión';
  IMPORTE := CreaCampo('IMPORTE', ftFloat, tsNinguno, tsNinguno, True);
  IMPORTE.Caption := 'Importe';
  B_REC_PRES := CreaCampo('B_REC_PRES', ftString, tsNinguno, tsNinguno, True);
  with B_REC_PRES do
  begin
    Size := 2;
    UseCombo := True;
    ComboLista.Add('0');    ComboDatos.Add('V');
    ComboLista.Add('1');    ComboDatos.Add('F');
  end;
  B_REC_PRES.Caption := 'Recursos del préstamo';
  UNIDADES := CreaCampo('UNIDADES', ftInteger, tsNinguno, tsNinguno, True);
  UNIDADES.Caption := 'Unidades';

  FKeyFields.Add('ID_CREDITO');
  FKeyFields.Add('CVE_CON_INV');

  Credito := TCrCredito.Create(Self);
  Credito.MasterSource:=Self;
  Credito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

  {$WARNINGS OFF}
  CatConInv := TCatConInv.Create(self);
  {$WARNINGS ON}
  CatConInv.MasterSource := self;
  CatConInv.CVE_CON_INV.MasterField := 'CVE_CON_INV';


  TableName := 'ADMIPROD.CR_AM_CINV';
  UseQuery  := True;
  HelpFile  := 'IntCrConInv.Hlp';
  ShowMenuReporte := True;
end;

destructor TCrConInv.Destroy;
begin
   if Credito <> nil then
      Credito.Free;

  if CatConInv <> nil then
    CatConInv.Free;

  inherited;
end;


function TCrConInv.ShowWindow(FormaTipo: TFormaTipo): integer;
var
  W: TWCrConInv;
begin
  W := TWCrConInv.Create(Self);
  try
    W.Objeto := Self;
    W.InterForma1.InterFrame := Self;
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


function TCrConInv.InternalBusca: boolean;
var
  T: TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('ICrAMCInv.it', 'F,S');
  try
    if Active then
    begin
      T.Param(0, ID_CREDITO.AsString);
      T.Param(1, CVE_CON_INV.AsString);
    end;
    if T.Execute then
      InternalBusca := FindKey([T.DameCampo(0), T.DameCampo(1)]);
  finally
    T.Free;
  end;
end;

function TCrConInv.Reporte: boolean;
begin //Execute_Reporte();
end;


 (***********************************************FORMA CR_AM_BITACORA********************)
 (*                                                                              *)
 (*  FORMA DE CR_AM_BITACORA                                                            *)
 (*                                                                              *)
 (***********************************************FORMA CR_AM_BITACORA********************)

procedure TWCrConInv.FormShow(Sender: TObject);
begin
  //Datos del panel de la parte inferior de la forma
  lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
  lbDfecha.Caption  := objeto.ParamCre.FECHA.AsString;
  lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
  lbDPerfil.Caption := objeto.ParamCre.PERFIL.AsString;

  Objeto.Credito.ID_CREDITO.Control := edID_CREDITO;
  Objeto.Credito.ContratoCre.Contrato.ID_Titular.Control := edID_ACREDITADO;
  Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := edNOM_ACREDITADO;
  Objeto.Credito.GetParams(Objeto);

  Objeto.CVE_CON_INV.Control := edCVE_CON_INV;
  Objeto.CatConInv.DESC_CON_INV.Control := edDESC_CON_INV;
  Objeto.IMPORTE.Control := edIMPORTE;
  Objeto.B_REC_PRES.Control := edB_REC_PRES;
  Objeto.UNIDADES.Control := edUNIDADES;

  Interforma1.MsgPanel := MsgPanel;

  ultimo_id_credito := '';


end;

procedure TWCrConInv.FormDestroy(Sender: TObject);
begin
  Objeto.Credito.ID_CREDITO.Control := nil;
  Objeto.Credito.ContratoCre.Contrato.ID_Titular.Control := nil;
  Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := nil;

  Objeto.CVE_CON_INV.Control := nil;
  Objeto.CatConInv.DESC_CON_INV.Control := nil;
  Objeto.IMPORTE.Control := nil;
  Objeto.B_REC_PRES.Control := nil;
  Objeto.UNIDADES.Control := nil;

end;

procedure TWCrConInv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TWCrConInv.InterForma1DespuesNuevo(Sender: TObject);
begin
  //Establece las opciones por defecto de los controles RadioGroup
  conceptos;
  edB_REC_PRES.ItemIndex := 0;
  edID_CREDITO.SetFocus;

  edID_CREDITO.Text := ultimo_id_credito;

  if Objeto.Credito.findKey([edID_CREDITO.Text]) then
  begin
    Consecutivo;
    Conceptos;
    InterForma1.NextTab(edID_CREDITO);
  end;

end;


{ Llena la tabla de conceptos con el credito seleccionado
}
procedure TWCrConInv.Conceptos;
var
  vlSQL : String;
  vgQryConcep : TQuery;
  vlQry : TQuery;
begin
  sgConceptos.Clear('NO EXISTEN DATOS'#30'>C');
  if edID_CREDITO.Text <> '' then
  begin
    vlSQL := ' select   rownum as orden,datos.* ' +
             ' from ( ' +
             ' select   cac.cve_con_inv, ' +
             '          cci.desc_con_inv, ' +
             '          cac.unidades, ' +             
             '          to_char(cac.importe, ''9,999,999,999.99'') as importe, ' +
             '          case cac.b_rec_pres ' +
             ' 				 when ''V'' then ''Recursos del crédito'' ' +
             ' 				 when ''F'' then ''Recursos del productor'' ' +
             ' 				 end as b_rec_pres ' +
             ' from     cr_am_cinv cac, ' +
             '          cr_con_inv cci ' +
             ' where    cac.cve_con_inv = cci.cve_con_inv and cac.id_credito = ' + edID_CREDITO.Text +
             ' order by f_modificacion ' +
             ' ) datos';
    vgQryConcep  := GetSQLQueryNoNil(vlSQL, Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, True);
    If Assigned(vgQryConcep) Then
    begin
      try
      vgQryConcep.FieldByName('orden').DisplayLabel := 'Orden';
      vgQryConcep.FieldByName('orden').DisplayWidth := 6;
      vgQryConcep.FieldByName('orden').Alignment := taRightJustify;
      vgQryConcep.FieldByName('cve_con_inv').DisplayLabel := 'Clave de concepto';
      vgQryConcep.FieldByName('cve_con_inv').DisplayWidth := 18;
      vgQryConcep.FieldByName('cve_con_inv').Alignment := taCenter;
      vgQryConcep.FieldByName('desc_con_inv').DisplayLabel := 'Descripción de concepto';
      vgQryConcep.FieldByName('desc_con_inv').DisplayWidth := 30;
      vgQryConcep.FieldByName('unidades').DisplayLabel := 'Unidades';
      vgQryConcep.FieldByName('unidades').DisplayWidth := 10;
      vgQryConcep.FieldByName('unidades').Alignment := taCenter;
      vgQryConcep.FieldByName('importe').DisplayLabel := 'Importe';
      vgQryConcep.FieldByName('importe').DisplayWidth := 20;
      vgQryConcep.FieldByName('importe').Alignment := taRightJustify;
      vgQryConcep.FieldByName('b_rec_pres').DisplayLabel := 'Recursos del préstamo';
      vgQryConcep.FieldByName('b_rec_pres').DisplayWidth := 30;
      sgConceptos.AddQry(vgQryConcep,True,True,-1,-1,-1,True);
      finally vgQryConcep.Free;
      end;
    end;

    //Calcula y despliega el total de los conceptos de inversión con recursos del préstamo
    vlSQL :=
        ' select sum(importe) as total ' +
        ' from cr_am_cinv ' +
        ' where b_rec_pres = ''V'' and id_credito = ' + Objeto.ID_CREDITO.AsString;

    vlQry := GetSQLQueryNoNil(vlSQL, objeto.Apli.DatabaseName, objeto.Apli.SessionName, False );

    if Assigned(vlQry) then
    begin
      try
      edTotalPrestamo.text := vlQry.FieldByName('total').AsString;
      finally vlQry.Free;
      end;
    end;

    //Calcula y despliega el total de los conceptos de inversión con recursos del acreditado
    vlSQL :=
        ' select sum(importe) as total ' +
        ' from cr_am_cinv ' +
        ' where b_rec_pres = ''F'' and id_credito = ' + Objeto.ID_CREDITO.AsString;

    vlQry := GetSQLQueryNoNil(vlSQL, objeto.Apli.DatabaseName, objeto.Apli.SessionName, False );

    if Assigned(vlQry) then
    begin
      try
      edTotalRecPropios.text := vlQry.FieldByName('total').AsString;
      finally vlQry.Free;
      end;
    end;

  end;
end;

procedure TWCrConInv.btID_CREDITOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCONINV_DISP',True,True) then
   begin
      Objeto.Credito.ShowAll := True;
      if Objeto.Credito.Busca then
      begin
        Consecutivo;
        Conceptos;
        InterForma1.NextTab(edID_CREDITO);
      end;
   end;
end;

procedure TWCrConInv.btPROM_ADMClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCONINV_CVEINV',True,True) then
   begin
      if Objeto.CatConInv.Busca then
      begin
    //      edCVE_CON_INV.SetFocus;
        InterForma1.NextTab(edCVE_CON_INV);
      end;
   end;
end;

procedure TWCrConInv.bCAT_CON_INVClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCONINV_CNINV',True,True) then
   begin
      Objeto.CatConInv.Catalogo;
   end;
end;

procedure TWCrConInv.ilCreditoEjecuta(Sender: TObject);
begin
  if Objeto.Credito.findKey([ilCredito.buffer]) then
  begin
    Consecutivo;
    Conceptos;
    InterForma1.NextTab(edID_CREDITO);
  end;
end;

procedure TWCrConInv.ilDescConInvEjecuta(Sender: TObject);
begin
  Objeto.CatConInv.findKey([ilDescConInv.buffer]);
end;

{Encuentra el consecutivo asociado al credito seleccionado
}
procedure TWCrConInv.Consecutivo;
var vlSQL : String;
    vlQry : TQuery;
begin
  if (Objeto.Modo = moAppend) Or (Objeto.Modo = moEdit) Then
  begin
    Objeto.ID_CREDITO.GetFromControl;
    vlSQL := ' select count(id_credito)+1 as consecutivo '+
             ' from CR_AM_CINV '+
             ' where id_credito = ' + Objeto.ID_CREDITO.AsString+
             ' group by id_credito  ';

    vlQry := GetSQLQueryNoNil(vlSQL, objeto.Apli.DatabaseName, objeto.Apli.SessionName, False );

    If Assigned(vlQry) Then
    begin
      Try
        edConsecutivo.Text := vlQry.FieldByName('consecutivo').AsString;
      Finally
        vlQry.Free;
      End;
    end
    else
      edConsecutivo.Text := '1';
  end;
end;

//Verifica el credito capturado
procedure TWCrConInv.edID_CREDITOExit(Sender: TObject);
var  vlbSalida  :  Boolean;
     vlStrMesg   :  String;
     sText : String;
     bFind : Boolean;
Begin
  vlbSalida := True;
  vlStrMesg := '';
  With Objeto Do
  Begin
    vlbSalida := True;
    vlStrMesg := '';

    sText := edID_CREDITO.Text;
    If (Trim(sText) = '') Then
    Begin
       vlbSalida := False;
       vlStrMesg := 'El crédito se debe definir';
    End;
  End;
  InterForma1.ValidaExit(edID_CREDITO, vlbSalida, vlStrMesg, True);

  //Consecutivo;
  //Conceptos;
end;


//Verifica el valor capturado
function TWCrConInv.VerificaImporte:boolean;
var
  sText : String;
  vlSQL : String;
  vlQry : TQuery;
  importe_credito : Real;
  total : Real;
Begin
  VerificaImporte := True;
  if (objeto.Modo = moAppend) Or (objeto.Modo = moEdit) Then
  begin

    objeto.IMPORTE.GetFromControl;
    sText := objeto.IMPORTE.AsString;
    //sText := edIMPORTE.Text;
    objeto.B_REC_PRES.GetFromControl;

    if (Trim(sText) <> '0.00') and (Trim(sText) <> '')  and  (edB_REC_PRES.ItemIndex = 0) then
    with objeto do
    begin
      vlSQL :=
          ' select cred.imp_dispuesto as importe_credito ' +
          ' from   (select id_credito, ' +
          '                cre.imp_credito as imp_dispuesto ' +
          '         from   cr_credito cre, ' +
          '                cr_contrato con ' +
          '         where  cre.id_contrato = con.id_contrato ' +
          '         union ' +
          '         select id_credito, ' +
          '                cre.imp_credito as imp_dispuesto ' +
          '         from   cre_credito cre, ' +
          '                cre_contrato con ' +
          '         where  cre.id_contrato = con.id_contrato) cred ' +
          ' where  id_credito = ' + Objeto.ID_CREDITO.AsString;

      vlQry := GetSQLQueryNoNil(vlSQL, objeto.Apli.DatabaseName, objeto.Apli.SessionName, False );

      importe_credito := 0;
      if Assigned(vlQry) then
      begin
        try
          importe_credito := vlQry.FieldByName('importe_credito').AsFloat;
        finally
          vlQry.Free;
        end;
      end;

      vlSQL :=
          ' select sum(importe) as total ' +
          ' from cr_am_cinv ' +
          ' where b_rec_pres = ''V'' and id_credito = ' + Objeto.ID_CREDITO.AsString;

      vlQry := GetSQLQueryNoNil(vlSQL, objeto.Apli.DatabaseName, objeto.Apli.SessionName, False );

      total := 0;
      if Assigned(vlQry) then
      begin
        try
          total := vlQry.FieldByName('total').AsFloat;
        finally
          vlQry.Free;
        end;
      end;

      //Verifica que el importe no sea menor que el total
      if total + IMPORTE.AsFloat > importe_credito then
        VerificaImporte := False;
    end;
  end;
end;

procedure TWCrConInv.edIMPORTEExit(Sender: TObject);
var
  vlbSalida  :  Boolean;
  vlStrMesg   :  String;
Begin
  //Verificar que el importe no exceda al permitido
  vlStrMesg := 'El total excedería el importe del crédito';
  vlbSalida := VerificaImporte;
  if vlbSalida then
    vlStrMesg := '';
  InterForma1.ValidaExit(edIMPORTE, vlbSalida, vlStrMesg, True);
end;

procedure TWCrConInv.edB_REC_PRESClick(Sender: TObject);
begin
  B_REC_PRESExit(nil);
  edIMPORTE.SetFocus;
end;

procedure TWCrConInv.B_REC_PRESExit(Sender: TObject);
var
  vlbSalida  :  Boolean;
  vlStrMesg   :  String;
begin
  //Verificar que el importe no exceda al permitido
  vlStrMesg := 'Con estos recursos el total excedería el importe del crédito';
  vlbSalida := VerificaImporte;
  if vlbSalida then
    vlStrMesg := '';
  InterForma1.ValidaExit(edB_REC_PRES, vlbSalida, vlStrMesg, True);
end;

procedure TWCrConInv.InterForma1DespuesAceptar(Sender: TObject);
begin
  ultimo_id_credito := edID_CREDITO.Text;
  Conceptos;
end;

procedure TWCrConInv.InterForma1Buscar(Sender: TObject);
var
  encontrado: Boolean;
begin
  encontrado := objeto.InternalBusca;
  if encontrado then
  begin
    Conceptos;
    ultimo_id_credito := edID_CREDITO.Text;
  end;
end;

procedure TWCrConInv.edTotalRecPropiosExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edTotalRecPropios, True, '', True);
end;

procedure TWCrConInv.edTotalPrestamoExit(Sender: TObject);
begin
  InterForma1.ValidaExit(edTotalPrestamo, True, '', True);
end;

procedure TWCrConInv.sgConceptosDblClick(Sender: TObject);
var
  row : Integer;
  concepto   : String;
begin
  if objeto.Modo = moBrowse then
  begin
    row := sgConceptos.SG.Row;
    concepto := sgConceptos.SG.Cells[4,row];
    Objeto.FindKey([edID_CREDITO.Text, concepto]);
  end;
end;

procedure TWCrConInv.InterForma1DespuesEliminar(Sender: TObject);
begin
  Conceptos;
end;

//Verifica el concepto de inversión capturado
function TWCrConInv.VerificaCInv:boolean;
var
  sText : String;
  bFind : Boolean;
  vlSQL: string;
  vlQry : TQuery;
  vgQry : TQuery;
begin
  VerificaCInv := True;

  if (objeto.Modo = moAppend) Then
  begin
    Try
      vlSQL :=
        ' select count(*) as num ' +
        ' from	 cr_am_cinv ' +
        ' where	 id_credito = ' + edID_CREDITO.Text +
        ' and		 cve_con_inv = ' + edCVE_CON_INV.Text;
      vlQry := GetSQLQueryNoNil(vlSQL, objeto.Apli.DataBaseName, objeto.Apli.SessionName, False );

      if Assigned(vlQry) then
      begin
        try
          if vlQry.FieldByName('num').AsInteger > 0 then
          begin
            VerificaCInv := False;
            //MsgPanel.Caption := 'El concepto de inversión ya existe';
          end
          ;
          //else
          //  MsgPanel.Caption := '';
        finally vlQry.Free;
        end;
      end;

    Except
    End;
  end;
end;

procedure TWCrConInv.edCVE_CON_INVExit(Sender: TObject);
var
  vlbSalida  :  Boolean;
  vlStrMesg   :  String;
  sText : String;

Begin
  vlStrMesg := 'El concepto de inversión ya existe';
  vlbSalida := VerificaCInv;
  if vlbSalida then
  begin
    If (Trim(sText) = '') Then
    begin
      vlStrMesg := 'El concepto de inversión se debe definir';
    end
    else
      vlStrMesg := ''
  end
  else
  begin
    MessageDlg('El concepto de inversión seleccionado ya existe.', mtInformation, [mbOk], 0 );
    if objeto.CVE_CON_INV.AsString <> '1750' then
      vlbSalida := True;
  end;
  InterForma1.ShowMsgPanel(vlStrMesg);
  InterForma1.ValidaExit(edCVE_CON_INV, vlbSalida, vlStrMesg, True);
{
    If (Trim(sText) = '') Then
      InterForma1.ShowMsgPanel('El concepto de inversión esta duplicado')
    else
    begin
      if VerificaCInv and (objeto.CVE_CON_INV.AsString = '1750') then
        edCVE_CON_INV.SetFocus;
      InterForma1.ShowMsgPanel('El concepto de inversión esta duplicado');
    end;
  end;

  InterForma1.ValidaExit(edCVE_CON_INV, True, '', True);
}
end;

procedure TWCrConInv.edUNIDADESExit(Sender: TObject);
var
  vlbSalida  :  Boolean;
  vlStrMesg   :  String;
  sText : String;

Begin
  vlbSalida := True;
  vlStrMesg := '';

  if (objeto.Modo = moAppend) Or (objeto.Modo = moEdit) Then
  begin
    objeto.UNIDADES.getFromControl;
    sText := objeto.UNIDADES.AsString;
    If (Trim(sText) = '') Then
    begin
      vlbSalida := False;
      vlStrMesg := 'Las unidades se deben definir.';
    end
  end;
  InterForma1.ValidaExit(edUNIDADES, vlbSalida, vlStrMesg, True);
end;

procedure TWCrConInv.InterForma1Aceptar(Sender: TObject;
  var Realizado: Boolean);
begin
  if (not VerificaCInv) and (objeto.CVE_CON_INV.AsString <> '1750') then
  begin
    InterForma1.ShowMsgPanel('Este concepto de inversión no se puede duplicar');
    edCVE_CON_INV.SetFocus;
    Realizado := False;
    Exit;
  end;

  Realizado := False;
  Objeto.Post;
  Realizado := True;
  Conceptos;

  //Interforma1.BtnAceptarClick
  //FOnBtnAceptarClick
  //Interforma1.BtnAceptarClick(this);
end;

end.
