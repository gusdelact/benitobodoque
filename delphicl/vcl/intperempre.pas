Unit IntPerEmpre;
//------------------------------------------------------------------------------
//  Información de la empresa
//  Realizó  : Carlos Adrian Mejía Ledón
//  Fecha    : Noviembre 2003
//  Empresa  : Grupo Financiero Interacciones.
//------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, UnGene,
  IntPers, IntPerRanEmp, IntPerRanVen, UnRpPerEmpre, UnConKYC;

Type
  TPerEmpre= class;

  TWPerEmpre=Class(TForm)
    InterForma1             : TInterForma;
    lbID_PERSONA: TLabel;
    iedID_PERSONA: TInterEdit;
    sbPersona: TSpeedButton;
    edNOMBRE: TEdit;
    qPerEmpresa: TQuery;
    lbID_RANGO_NO_EMPL: TLabel;
    iedID_RANGO_NO_EMPL: TInterEdit;
    spRangoEmpleados: TSpeedButton;
    lbID_RANGO_VENTAS: TLabel;
    iedID_RANGO_VENTAS: TInterEdit;
    sbRangoVentas: TSpeedButton;
    lbCVE_COB_GEOG: TLabel;
    cbCVE_COB_GEOG: TComboBox;
    Label1: TLabel;
    iedNUM_SUCURSALES: TInterEdit;
    bbPaises: TBitBtn;
    bbRefComer: TBitBtn;
    GroupBox1: TGroupBox;
    lbdIMP_ACTIVO: TLabel;
    lbIMP_PASIVO: TLabel;
    lbIMP_CAPITAL: TLabel;
    iedIMP_ACTIVO: TInterEdit;
    iedIMP_PASIVO: TInterEdit;
    iedIMP_CAPITAL: TInterEdit;
    Label2: TLabel;
    edGiroMerc: TInterEdit;
    Label3: TLabel;
    edActividad: TInterEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1BtnAceptar(Sender: TObject);
    procedure sbPersonaClick(Sender: TObject);
    function  ValidaPersona : Boolean;
    function  ValRangoEmpleados : Boolean;
    function  ValRangoVentas : Boolean;
    function  ValNumSucursales : Boolean;
    function  ValImpActivo : Boolean;
    function  ValImpPasivo : Boolean;
    function  ValImpCapital : Boolean;
    function  ValSumaImportes : Boolean;
    function  ValidaExiste : Boolean;
    function  ValGiroMercantil : Boolean;
    function  ValActividad : Boolean;
    procedure iedID_PERSONAExit(Sender: TObject);
    procedure iedID_PERSONAChange(Sender: TObject);
    procedure iedID_RANGO_NO_EMPLExit(Sender: TObject);
    procedure spRangoEmpleadosClick(Sender: TObject);
    procedure iedID_RANGO_VENTASExit(Sender: TObject);
    procedure iedNUM_SUCURSALESExit(Sender: TObject);
    procedure iedIMP_ACTIVOExit(Sender: TObject);
    procedure iedIMP_PASIVOExit(Sender: TObject);
    procedure iedIMP_CAPITALExit(Sender: TObject);
    procedure sbRangoVentasClick(Sender: TObject);
    procedure InterForma1Preview(Sender: TObject);
    procedure bbPaisesClick(Sender: TObject);
    procedure bbRefComerClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto          : TPerEmpre;
    vgIdPersona     : String;
    vgIdRangoNoEmpl : String;
    vgIdRangoVentas : String;
  end;

  TPerEmpre= class(TInterFrame)
    private
    protected
    public
      vpIdPersona              : Integer;
      ID_PERSONA               : TInterCampo;
      GIRO_MERCANTIL           : TInterCampo;
      ACTIVIDAD                : TInterCampo;
      ID_RANGO_NO_EMPL         : TInterCampo;
      ID_RANGO_VENTAS          : TInterCampo;
      CVE_COB_GEOG             : TInterCampo;
      NUM_SUCURSALES           : TInterCampo;
      IMP_ACTIVO               : TInterCampo;
      IMP_PASIVO               : TInterCampo;
      IMP_CAPITAL              : TInterCampo;

      PERSONA                  : TPersona;
      PER_RANG_EMPL            : TPerRanEmp;
      PER_RANG_VENTA           : TPerRanVen;

      function    InternalBusca : Boolean; override;
      constructor Create( AOwner : TComponent ); override;
      destructor  Destroy; override;
      function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    published
  end;

implementation
{$R *.DFM}
uses
  IntPerPaisCo, IntPerRefCom;

//**************************************************************//
//                      CLASE TPerEmpre                        //
//**************************************************************//

constructor TPerEmpre.Create( AOwner : TComponent );
begin
  Inherited;
  ID_PERSONA               := CreaCampo('ID_PERSONA',ftInteger,tsNinguno,tsNinguno,True);
  ID_PERSONA.Caption       := 'Persona';
  ID_RANGO_NO_EMPL         := CreaCampo('ID_RANGO_NO_EMPL',ftInteger,tsNinguno,tsNinguno,True);
  ID_RANGO_NO_EMPL.Caption := 'Rango de Número de Empleados';
  ID_RANGO_VENTAS          := CreaCampo('ID_RANGO_VENTAS',ftInteger,tsNinguno,tsNinguno,True);
  ID_RANGO_VENTAS.Caption  := 'Rango de Número de Ventas';
  CVE_COB_GEOG             := CreaCampo('CVE_COB_GEOG',ftString,tsNinguno,tsNinguno,True);
  with CVE_COB_GEOG do
  begin
    UseCombo := True;
    ComboLista.Add('Local');
    ComboLista.Add('Nacional');
    ComboLista.Add('Internacional');
    ComboDatos.Add('LO');
    ComboDatos.Add('NA');
    ComboDatos.Add('IN');
  end;
  NUM_SUCURSALES           := CreaCampo('NUM_SUCURSALES',ftInteger,tsNinguno,tsNinguno,True);
  NUM_SUCURSALES.Caption   := 'Número de Sucursales';
  IMP_ACTIVO               := CreaCampo('IMP_ACTIVO',ftFloat,tsNinguno,tsNinguno,True);
  IMP_ACTIVO.Caption       := 'Importe Activo';
  IMP_PASIVO               := CreaCampo('IMP_PASIVO',ftFloat,tsNinguno,tsNinguno,True);
  IMP_PASIVO.Caption       := 'Importe Pasivo';
  IMP_CAPITAL              := CreaCampo('IMP_CAPITAL',ftFloat,tsNinguno,tsNinguno,True);
  IMP_CAPITAL.Caption      := 'Importe Capital';
  GIRO_MERCANTIL           := CreaCampo('GIRO_MERCANTIL',ftString,tsNinguno,tsNinguno,True);
  ACTIVIDAD                := CreaCampo('ACTIVIDAD'     ,ftString,tsNinguno,tsNinguno,True);


  FKeyFields.Add('ID_PERSONA');
  TableName := 'PER_EMPRESA';
  UseQuery := True;
  HelpFile := 'IntPerEmpre.Hlp';
  ShowMenuReporte:=True;

  PERSONA                                    := TPersona.Create(Nil);
  PERSONA.MasterSource                       := Self;
  PERSONA.ID_PERSONA.MasterField             := 'ID_PERSONA';
  PER_RANG_EMPL                              := TPerRanEmp.Create(Self);
  PER_RANG_EMPL.MasterSource                 := Self;
  PER_RANG_EMPL.ID_RANGO_NO_EMPL.MasterField := 'ID_RANGO_NO_EMPL';
  PER_RANG_VENTA                             := TPerRanVen.Create(Self);
  PER_RANG_VENTA.MasterSource                := Self;
  PER_RANG_VENTA.ID_RANGO_VENTAS.MasterField := 'ID_RANGO_VENTAS';
end;

destructor TPerEmpre.Destroy;
begin
  if PERSONA <> nil then PERSONA.Free;
  PERSONA := nil;
  if PER_RANG_EMPL <> nil then PER_RANG_EMPL.Free;
  PER_RANG_EMPL := nil;
  if PER_RANG_VENTA <> nil then PER_RANG_VENTA.Free;
  PER_RANG_VENTA := nil;
  inherited;
end;

function TPerEmpre.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
  W : TWPerEmpre;
begin
  W:=TWPerEmpre.Create(Self);
  try
    W.Objeto:= Self;
    W.InterForma1.InterFrame:= Self;
    W.InterForma1.FormaTipo := FormaTipo;
    W.InterForma1.ShowGrid := False;
    W.InterForma1.ShowNavigator := False;
    W.InterForma1.Funcion := FInterFun;
    W.InterForma1.ShowBtnAyuda := False;
    W.InterForma1.ShowBtnPreview := True;
    W.qPerEmpresa.DatabaseName := Apli.DataBaseName;
    W.InterForma1.ShowModal;
    ShowWindow := W.InterForma1.ModalResult;
  finally
    W.Free;
  end;
end;

function TPerEmpre.InternalBusca:Boolean;
var
  T : TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('IPerEmpre.it','I');
  if vpIdPersona <> 0 then
    T.WhereString:= 'Persona.Id_Persona = ' + intToStr(vpIdPersona);
  try
    if Active then
    begin
      T.Param(0,ID_PERSONA.AsString);
    end;
    if T.Execute then
      InternalBusca := FindKey([T.DameCampo(0)]);
  finally
    T.Free;
  end;
end;

//**************************************************************//
//                      CLASE TWPerEmpre                       //
//**************************************************************//

procedure TWPerEmpre.FormShow(Sender: TObject);
begin
  Objeto.ID_PERSONA.Control                     := iedID_PERSONA;
  Objeto.ID_RANGO_NO_EMPL.Control               := iedID_RANGO_NO_EMPL;
  Objeto.ID_RANGO_VENTAS.Control                := iedID_RANGO_VENTAS;
  Objeto.CVE_COB_GEOG.Control                   := cbCVE_COB_GEOG;
  Objeto.NUM_SUCURSALES.Control                 := iedNUM_SUCURSALES;
  Objeto.IMP_ACTIVO.Control                     := iedIMP_ACTIVO;
  Objeto.IMP_PASIVO.Control                     := iedIMP_PASIVO;
  Objeto.IMP_CAPITAL.Control                    := iedIMP_CAPITAL;
  Objeto.PERSONA.ID_PERSONA.Control             := iedID_PERSONA;
  Objeto.PERSONA.NOMBRE.Control                 := edNOMBRE;
  Objeto.PER_RANG_EMPL.ID_RANGO_NO_EMPL.Control := iedID_RANGO_NO_EMPL;
  Objeto.PER_RANG_VENTA.ID_RANGO_VENTAS.Control := iedID_RANGO_VENTAS;
  Objeto.GIRO_MERCANTIL.Control                 := edGiroMerc;
  Objeto.ACTIVIDAD.Control                      := edActividad;
  InterForma1.F.btNuevo.SetFocus;
end;

procedure TWPerEmpre.FormDestroy(Sender: TObject);
begin
  Objeto.ID_PERSONA.Control                     := nil;
  Objeto.ID_RANGO_NO_EMPL.Control               := nil;
  Objeto.ID_RANGO_VENTAS.Control                := nil;
  Objeto.CVE_COB_GEOG.Control                   := nil;
  Objeto.NUM_SUCURSALES.Control                 := nil;
  Objeto.IMP_ACTIVO.Control                     := nil;
  Objeto.IMP_PASIVO.Control                     := nil;
  Objeto.IMP_CAPITAL.Control                    := nil;
  Objeto.PERSONA.ID_PERSONA.Control             := nil;
  Objeto.PERSONA.NOMBRE.Control                 := nil;
  Objeto.PER_RANG_EMPL.ID_RANGO_NO_EMPL.Control := nil;
  Objeto.PER_RANG_VENTA.ID_RANGO_VENTAS.Control := nil;
  Objeto.GIRO_MERCANTIL.Control                 := nil;
  Objeto.ACTIVIDAD.Control                      := nil;
end;

procedure TWPerEmpre.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

//**************************************************************//
//             Eventos de los componentes de la Forma           //
//**************************************************************//

//---- Exit de Persona ----//
procedure TWPerEmpre.iedID_PERSONAExit(Sender: TObject);
begin
  vgIdPersona := iedID_PERSONA.Text;
  if (InterForma1.F.btAceptar.Enabled) and
     not (InterForma1.IsCancel)        then
    ValidaPersona;
end;

//---- Change de Persona ----//
procedure TWPerEmpre.iedID_PERSONAChange(Sender: TObject);
begin
  edNOMBRE.Clear;
end;

//---- Exit de Rango de Empleados ----//
procedure TWPerEmpre.iedID_RANGO_NO_EMPLExit(Sender: TObject);
begin
  vgIdRangoNoEmpl := iedID_RANGO_NO_EMPL.Text;
  if (InterForma1.F.btAceptar.Enabled) and
     not (InterForma1.IsCancel)        then
    ValRangoEmpleados;
end;

//---- Exit de Rango de Ventas ----//
procedure TWPerEmpre.iedID_RANGO_VENTASExit(Sender: TObject);
begin
  vgIdRangoVentas := iedID_RANGO_VENTAS.Text;
  if (InterForma1.F.btAceptar.Enabled) and
     not (InterForma1.IsCancel)        then
    ValRangoVentas;
end;

//---- Exit de Número de Sucursales ----//
procedure TWPerEmpre.iedNUM_SUCURSALESExit(Sender: TObject);
begin
  if (InterForma1.F.btAceptar.Enabled) and
     not (InterForma1.IsCancel)        then
    ValNumSucursales;
end;

//---- Exit de Importe de Activo ----//
procedure TWPerEmpre.iedIMP_ACTIVOExit(Sender: TObject);
begin
  if (InterForma1.F.btAceptar.Enabled) and
     not (InterForma1.IsCancel)        then
    ValImpActivo;
end;

//---- Exit de Importe de Pasivo ----//
procedure TWPerEmpre.iedIMP_PASIVOExit(Sender: TObject);
begin
  if (InterForma1.F.btAceptar.Enabled) and
     not (InterForma1.IsCancel)        then
    ValImpPasivo;
end;

//---- Exit de Importe de Capital ----//
procedure TWPerEmpre.iedIMP_CAPITALExit(Sender: TObject);
begin
  if (InterForma1.F.btAceptar.Enabled) and
     not (InterForma1.IsCancel)        then
    ValImpCapital;
end;

//**************************************************************//
//                   Botones de Interforma                      //
//**************************************************************//

//---- Bóton Aceptar ----//
procedure TWPerEmpre.InterForma1BtnAceptar(Sender: TObject);
var
  vlAccion : string;
begin
  vlAccion := InterForma1.F.Accion;
  // Acción Nuevo
  if vlAccion = cNuevo then
  begin
    if ValidaPersona then
      if ValRangoEmpleados then
        if ValRangoVentas then
          if ValGiroMercantil then
            if ValActividad then
              if ValNumSucursales then
                if ValImpActivo then
                  if ValImpPasivo then
                    if ValImpCapital then
                      if ValSumaImportes then
                        if ValidaExiste then
                          InterForma1.Aceptar;
  end;
  // Acción Modificar
  if vlAccion = cModificar then
  begin
    if ValRangoEmpleados then
      if ValRangoVentas then
        if ValGiroMercantil then
          if ValActividad then
            if ValNumSucursales then
              if ValImpActivo then
                if ValImpPasivo then
                  if ValImpCapital then
                    if ValSumaImportes then
                      InterForma1.Aceptar;
  end;
end;

//---- Bóton Preview ----//
procedure TWPerEmpre.InterForma1Preview(Sender: TObject);
begin
  EXECUTE_RP_PEREMPRE(Objeto.Apli,'Ver', Objeto.vpIdPersona);
end;

//**************************************************************//
//                   Eventos de Interforma                      //
//**************************************************************//

//---- Después de Nuevo ----//
procedure TWPerEmpre.InterForma1DespuesNuevo(Sender: TObject);
begin
  cbCVE_COB_GEOG.ItemIndex := 0;
  if Objeto.vpIdPersona <> 0 then
  begin
    Objeto.PERSONA.FindKey([Objeto.vpIdPersona]);
    iedID_RANGO_NO_EMPL.SetFocus;
  end
  else
    iedID_PERSONA.SetFocus;
end;

//---- Después de Modificar ----//
procedure TWPerEmpre.InterForma1DespuesModificar(Sender: TObject);
begin
  iedID_RANGO_NO_EMPL.SetFocus;
end;

//**************************************************************//
//                        Buscadores                            //
//**************************************************************//

//---- Buscador de Persona ----//
procedure TWPerEmpre.sbPersonaClick(Sender: TObject);
begin
  if Objeto.PERSONA.Busca then
    iedID_RANGO_NO_EMPL.SetFocus;
end;

//---- Buscador de Rango de Empleados ----//
procedure TWPerEmpre.spRangoEmpleadosClick(Sender: TObject);
begin
  if Objeto.PER_RANG_EMPL.Busca then
    iedID_RANGO_VENTAS.SetFocus;
end;

//---- Buscador de Rango de Ventas ----//
procedure TWPerEmpre.sbRangoVentasClick(Sender: TObject);
begin
  if Objeto.PER_RANG_VENTA.Busca then
    cbCVE_COB_GEOG.SetFocus;
end;

//**************************************************************//
//                       Validaciones                           //
//**************************************************************//

//---- Valida Persona ----//
function TWPerEmpre.ValidaPersona : Boolean;
var
  vlMensaje : String;
begin
  // Valida que se especifique una persona
  if Length(iedID_PERSONA.Text) <= 0 then
    vlMensaje := 'Debe especificar una empresa...'
  // Valida que la persona exista
  else if not Objeto.PERSONA.FindKey([Trim(iedID_PERSONA.Text)]) then
    vlMensaje := 'La empresa ' + Trim(vgIdPersona) + ' no existe...'
  // Validación exitosa
  else
    vlMensaje := '';
  // Presenta Mensaje
  if vlMensaje <> '' then
  begin
    ValidaPersona := False;
    MessageBeep(0);
    InterMsg(tmInformacion,'',0,vlMensaje);
    iedID_PERSONA.SetFocus;
    iedID_PERSONA.Clear;
    edNOMBRE.Clear;
  end
  else
    ValidaPersona := True;
end;

//---- Valida Rango de Empleados ----//
function TWPerEmpre.ValRangoEmpleados : Boolean;
var
  vlMensaje : String;
begin
  if Length(iedID_RANGO_NO_EMPL.Text) > 0 then
  begin
    // Valida que el rango exista
    if not Objeto.PER_RANG_EMPL.FindKey([Trim(iedID_RANGO_NO_EMPL.Text)]) then
      vlMensaje := 'El rango de empleados ' + Trim(vgIdRangoNoEmpl) + ' no existe...'
    // Validación exitosa
    else
      vlMensaje := '';
    // Presenta Mensaje
    if vlMensaje <> '' then
    begin
      ValRangoEmpleados := False;
      MessageBeep(0);
      InterMsg(tmInformacion,'',0,vlMensaje);
      iedID_RANGO_NO_EMPL.SetFocus;
      iedID_RANGO_NO_EMPL.Clear;
    end
    else
      ValRangoEmpleados := True;
  end
  else
    ValRangoEmpleados := True;
end;

//---- Valida Rango de Ventas ----//
function TWPerEmpre.ValRangoVentas : Boolean;
var
  vlMensaje : String;
begin
  if Length(iedID_RANGO_VENTAS.Text) > 0 then
  begin
    // Valida que el rango exista
    if not Objeto.PER_RANG_VENTA.FindKey([Trim(iedID_RANGO_VENTAS.Text)]) then
      vlMensaje := 'El rango de ventas ' + Trim(vgIdRangoVentas) + ' no existe...'
    // Validación exitosa
    else
      vlMensaje := '';
    // Presenta Mensaje
    if vlMensaje <> '' then
    begin
      ValRangoVentas := False;
      MessageBeep(0);
      InterMsg(tmInformacion,'',0,vlMensaje);
      iedID_RANGO_VENTAS.SetFocus;
      iedID_RANGO_VENTAS.Clear;
    end
    else
      ValRangoVentas := True;
  end
  else
    ValRangoVentas := True;
end;

//---- Valida Número de Sucursales ----//
function TWPerEmpre.ValNumSucursales : Boolean;
var
  vlMensaje : String;
begin
  if Length(iedNUM_SUCURSALES.Text) > 0 then
  begin
    // Validación que el número de sucursales sea mayor o igual a cero
    if StrToInt(iedNUM_SUCURSALES.Text) < 0 then
      vlMensaje := 'El número de sucursales debe ser mayor o igual a cero...'
    // Validación exitosa
    else
      vlMensaje := '';
    // Presenta Mensaje
    if vlMensaje <> '' then
    begin
      ValNumSucursales := False;
      MessageBeep(0);
      InterMsg(tmInformacion,'',0,vlMensaje);
      iedNUM_SUCURSALES.SetFocus;
      iedNUM_SUCURSALES.Clear;
    end
    else
      ValNumSucursales := True;
  end
  else
    ValNumSucursales := True;
end;

//---- Valida Importe de Activo ----//
function TWPerEmpre.ValImpActivo : Boolean;
var
  vlMensaje : String;
begin
  if Length(iedIMP_ACTIVO.Text) > 0 then
  begin
    // Validación que el importe de activo sea mayor a cero o igual a cero
    if StrToFloat(iedIMP_ACTIVO.Text) < 0 then
      vlMensaje := 'El importe de activo debe ser mayor o igual a cero...'
    // Validación exitosa
    else
      vlMensaje := '';
    // Presenta Mensaje
    if vlMensaje <> '' then
    begin
      ValImpActivo := False;
      MessageBeep(0);
      InterMsg(tmInformacion,'',0,vlMensaje);
      iedIMP_ACTIVO.SetFocus;
      iedIMP_ACTIVO.Clear;
    end
    else
      ValImpActivo := True;
  end
  else
    ValImpActivo := True;
end;

//---- Valida Importe de Pasivo ----//
function TWPerEmpre.ValImpPasivo : Boolean;
var
  vlMensaje : String;
begin
  if Length(iedIMP_PASIVO.Text) > 0 then
  begin
    // Validación que el importe de pasivo sea mayor a cero o igual a cero
    if StrToFloat(iedIMP_PASIVO.Text) < 0 then
      vlMensaje := 'El importe de pasivo debe ser mayor o igual a cero...'
    // Validación exitosa
    else
      vlMensaje := '';
    // Presenta Mensaje
    if vlMensaje <> '' then
    begin
      ValImpPasivo := False;
      MessageBeep(0);
      InterMsg(tmInformacion,'',0,vlMensaje);
      iedIMP_PASIVO.SetFocus;
      iedIMP_PASIVO.Clear;
    end
    else
      ValImpPasivo := True;
  end
  else
    ValImpPasivo := True;
end;

//---- Valida Importe de Capital ----//
function TWPerEmpre.ValImpCapital : Boolean;
Begin
  ValImpCapital:= True;
end;
{ RAPA 28Sep04
var
  vlMensaje : String;

begin
  if Length(iedIMP_CAPITAL.Text) > 0 then
  begin
    // Validación que el importe de capital sea mayor a cero o igual a cero
    if StrToFloat(iedIMP_CAPITAL.Text) < 0 then
      vlMensaje := 'El importe de capital debe ser mayor o igual a cero...'
    // Validación exitosa
    else
      vlMensaje := '';
    // Presenta Mensaje
    if vlMensaje <> '' then
    begin
      ValImpCapital := False;
      MessageBeep(0);
      InterMsg(tmInformacion,'',0,vlMensaje);
      iedIMP_CAPITAL.SetFocus;
      iedIMP_CAPITAL.Clear;
    end
    else
      ValImpCapital := True;
  end
  else
    ValImpCapital := True;
end;
}

//---- Valida la Suma de Importes (Activo = Pasivo + Capital) ----//
function TWPerEmpre.ValSumaImportes : Boolean;
var
  vlMensaje    : String;
  vlImpActivo  : Real;
  vlImpPasivo  : Real;
  vlImpCapital : Real;
begin
  if (Length(iedIMP_ACTIVO.Text)  > 0) and
     (Length(iedIMP_PASIVO.Text)  > 0) and
     (Length(iedIMP_CAPITAL.Text) > 0) then
  begin
    vlImpActivo  := StrToFloat(iedIMP_ACTIVO.Text);
    vlImpPasivo  := StrToFloat(iedIMP_PASIVO.Text);
    vlImpCapital := StrToFloat(iedIMP_CAPITAL.Text);
    if vlImpActivo <> (vlImpPasivo + vlImpCapital) then
      vlMensaje := 'La suma del Pasivo más Capital debe ser igual al Activo...'
    else
      vlMensaje := '';
    // Presenta Mensaje
    if vlMensaje <> '' then
    begin
      ValSumaImportes := False;
      MessageBeep(0);
      InterMsg(tmInformacion,'',0,vlMensaje);
      iedIMP_ACTIVO.SetFocus;
    end
    else
      ValSumaImportes := True;
  end
  else
    ValSumaImportes := True;
end;

//---- Valida Existe ----//
function TWPerEmpre.ValidaExiste : Boolean;
begin
  with qPerEmpresa do
  begin
    Close;
    ParamByName('pIdPersona').AsInteger := StrToInt(iedID_PERSONA.Text);
    Open;
    if not IsEmpty then
    begin
      ValidaExiste := False;
      MessageBeep(0);
      InterMsg(tmInformacion,'',0,'La empresa ' + Trim(iedID_PERSONA.Text) + ' ya ha sido dada de alta previamente...');
      iedID_PERSONA.SetFocus;
    end
    else
      ValidaExiste := True;
    Close;
  end;
end;

function  TWPerEmpre.ValGiroMercantil : Boolean;
begin
if Trim(edGiroMerc.Text) = '' then
  begin
      ValGiroMercantil := False;
      MessageBeep(0);
      InterMsg(tmInformacion,'',0,'El Giro Mercantil no puede ser vacio');
      edGiroMerc.SetFocus;
  end
  else
    ValGiroMercantil := True;

end;

function  TWPerEmpre.ValActividad : Boolean;
begin
if Trim(edActividad.Text) = '' then
  begin
      ValActividad := False;
      MessageBeep(0);
      InterMsg(tmInformacion,'',0,'La Actividad / Objeto Social Prep. no puede ser vacio');
      edActividad.SetFocus;
  end
  else
    ValActividad := True;
end;

procedure TWPerEmpre.bbPaisesClick(Sender: TObject);
var
  PER_PAIS_COBER : TPerPaisCo;
begin
  try
    PER_PAIS_COBER               := TPerPaisCo.Create(Self);
    PER_PAIS_COBER.MasterSource  := Objeto;
    PER_PAIS_COBER.GetParams(Objeto);
    PER_PAIS_COBER.vpIdPersona := Objeto.vpIdPersona;
{
    if Length(iedID_PERSONA.Text) > 0 then
      PER_PAIS_COBER.vpIdPersona := StrToInt(iedID_PERSONA.Text)
    else
      PER_PAIS_COBER.vpIdPersona := 0;
}
    PER_PAIS_COBER.Catalogo;
  finally
    if PER_PAIS_COBER <> nil then PER_PAIS_COBER.Free;
    PER_PAIS_COBER := nil;
  end;
end;

procedure TWPerEmpre.bbRefComerClick(Sender: TObject);
var
  PER_REF_COMERCIAL : TPerRefCom;
begin
  try
    PER_REF_COMERCIAL               := TPerRefCom.Create(Self);
    PER_REF_COMERCIAL.MasterSource  := Objeto;
    PER_REF_COMERCIAL.GetParams(Objeto);
    PER_REF_COMERCIAL.vpIdPersona:= Objeto.vpIdPersona;
{
    if Length(iedID_PERSONA.Text) > 0 then
      PER_REF_COMERCIAL.vpIdPersona := StrToInt(iedID_PERSONA.Text)
    else
      PER_REF_COMERCIAL.vpIdPersona := 0;
}
    PER_REF_COMERCIAL.Catalogo;
  finally
    if PER_REF_COMERCIAL <> nil then PER_REF_COMERCIAL.Free;
    PER_REF_COMERCIAL := nil;
  end;


end;

end.
