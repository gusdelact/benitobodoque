//------------------------------------------------------------------------------
// Función    : Catalogo de Parametros Bursatiles ICB (SB_PARAMETRO_ICB)
// Desarrollo : Cesar Zamora Ramirez
// Fecha      : 18 de octubre del 2011
//------------------------------------------------------------------------------ 
Unit IntSbParamIcb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm, DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntFind,
  UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit;

Type
  TSbParIcb = class;
  
  TWSbParamIcb = class(TForm)
    InterForma1 : TInterForma;
    lIdentificador: TLabel;
    lClave: TLabel;
    ieIdentificador: TInterEdit;
    mClave: TMemo;
    lSituacion: TLabel;
    rgSituacion: TRadioGroup;
    lNumero: TLabel;
    ieNumero: TInterEdit;
    mValor: TMemo;
    lValor: TLabel;
    gbAlta: TGroupBox;
    gbModifico: TGroupBox;
    lUsrAlta: TLabel;
    edUsrAlta: TEdit;
    lFHAlta: TLabel;
    edFHAlta: TEdit;
    lUsrModifico: TLabel;
    edUsrModifico: TEdit;
    lFHModifico: TLabel;
    edFHModifico: TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    private
      { Private declarations }
    public
      { Public declarations }
      Objeto : TSbParIcb;
    end;

  TSbParIcb = class(TInterFrame)
    private
      { Private declarations }
    protected
      { Protected declarations }
    public
      { Public declarations }
      ID_PARAM            : TInterCampo;
      NUM_PARAM           : TInterCampo;
      PARAMETRO           : TInterCampo;
      VALUE_PARAM         : TInterCampo;
      CVE_SITUACION_PARAM : TInterCampo;
      CVE_USUARIO_ALTA    : TInterCampo;
      FH_ALTA             : TInterCampo;
      CVE_USUARIO_MOD     : TInterCampo;
      FH_MODIFICA         : TInterCampo;
    
      // Variables y metodos, que permiten condicionar la pantalla
      aIdParam   : Array of Integer;
      aNumParam  : Array Of Integer;
      vBotones   : Boolean;
      vNuevo     : Boolean;
      vModificar : Boolean;
      vEliminar  : Boolean;
      vBuscar    : Boolean;
      procedure setParametros(pIdParam : Array of Integer; pNumParam : Array Of Integer; pBotones, pNuevo : Boolean; pModificar : Boolean; pEliminar : Boolean; pBuscar : Boolean);
      function  getParametros : String;

      function    InternalBusca : Boolean; override;
      constructor Create( AOwner : TComponent ); override;
      destructor  Destroy; override;
      function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    published
      { Published declarations }
    end;

implementation
{$R *.DFM}

procedure TSbParIcb.setParametros(pIdParam : Array of Integer; pNumParam : Array Of Integer; pBotones, pNuevo : Boolean; pModificar : Boolean; pEliminar : Boolean; pBuscar : Boolean);
var
   n : Integer;
begin
   SetLength(aIdParam, Length(pIdParam));          SetLength(aNumParam, Length(pNumParam));
   for n := low(pIdParam)  to high(pIdParam)  do   aIdParam[n]  := pIdParam[n];
   for n := low(pNumParam) to high(pNumParam) do   aNumParam[n] := pNumParam[n];
   //---------------------------------------------------------------------------
   vBotones   := pBotones;
   vNuevo     := pNuevo;
   vModificar := pModificar;
   vEliminar  := pEliminar;
   vBuscar    := pBuscar;
end;

function TSbParIcb.getParametros : String;
var
   vIdParam  : String;
   vNumParam : String;
   vResult   : String;
   n         : Integer;
begin
   vIdParam  := '';
   vNumParam := '';
   vResult   := '';
   //---------------------------------------------------------------------------
   for n := low(aIdParam)  to high(aIdParam)  do   vIdParam  := vIdParam  + ', ' + IntToStr(aIdParam[n]);
   for n := low(aNumParam) to high(aNumParam) do   vNumParam := vNumParam + ', ' + IntToStr(aNumParam[n]);
   //---------------------------------------------------------------------------
   if trim(vIdParam)  <> '' then   vResult := vResult + ' AND ID_PARAM  IN(' + copy(vIdParam,  3, length(vIdParam))  + ')';
   if trim(vNumParam) <> '' then   vResult := vResult + ' AND NUM_PARAM IN(' + copy(vNumParam, 3, length(vNumParam)) + ')';
   if trim(vResult)   <> '' then   vResult := copy(vResult, 6, length(vResult));
   //---------------------------------------------------------------------------
   Result := vResult;
end;

constructor TSbParIcb.Create( AOwner : TComponent );
begin
   inherited;
   
   ID_PARAM            := CreaCampo('ID_PARAM',            ftInteger, tsNinguno, tsNinguno, True);
   NUM_PARAM           := CreaCampo('NUM_PARAM',           ftInteger, tsNinguno, tsNinguno, True);
   PARAMETRO           := CreaCampo('PARAMETRO',           ftString,  tsNinguno, tsNinguno, True);
   VALUE_PARAM         := CreaCampo('VALUE_PARAM',         ftString,  tsNinguno, tsNinguno, True);
   CVE_SITUACION_PARAM := CreaCampo('CVE_SITUACION_PARAM', ftString,  tsNinguno, tsNinguno, True);
   CVE_USUARIO_ALTA    := CreaCampo('CVE_USUARIO_ALTA',    ftString,  tsNinguno, tsNinguno, True);
   FH_ALTA             := CreaCampo('FH_ALTA',             ftDate,    tsNinguno, tsNinguno, True);
   CVE_USUARIO_MOD     := CreaCampo('CVE_USUARIO_MOD',     ftString,  tsNinguno, tsNinguno, True);
   FH_MODIFICA         := CreaCampo('FH_MODIFICA',         ftDate,    tsNinguno, tsNinguno, True);
   with CVE_SITUACION_PARAM do
   begin
      Size     := 3;
      UseCombo := True;
      ComboDatos.Add('ACT');	ComboLista.Add('0'); // La clave de situación quedo como ACT e INA ya que asi crearon el campo,
      ComboDatos.Add('INA');	ComboLista.Add('1'); // y ya existen registros utilizados en procesos.
   end;

   FKeyFields.Add('ID_PARAM');
   FKeyFields.Add('NUM_PARAM');

   TableName       := 'SB_PARAMETRO_ICB';
   UseQuery        := True;
   ShowMenuReporte := True;
end;

destructor TSbParIcb.Destroy;
begin
   inherited;
end;

function TSbParIcb.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TWSbParamIcb;
begin
   W := TWSbParamIcb.Create(Self);
   try
      W.Objeto                    := Self;
      W.InterForma1.InterFrame    := Self;
      W.InterForma1.FormaTipo     := FormaTipo;
      W.InterForma1.ShowGrid      := False;
      W.InterForma1.ShowNavigator := False;
      if vBotones then
      begin
         W.InterForma1.ShowBtnNuevo     := vNuevo;
         W.InterForma1.ShowBtnModificar := vModificar;
         W.InterForma1.ShowBtnEliminar  := vEliminar;
         W.InterForma1.ShowBtnBuscar    := vBuscar;
      end;
      W.InterForma1.ShowBtnAyuda := False;
      W.InterForma1.Funcion      := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow                 := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

function TSbParIcb.InternalBusca:Boolean;
var
   T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('ISbParamIcb.it', 'I,I');
   T.WhereString := getParametros;
   try
      if Active then
      begin
         T.Param(0, ID_PARAM.AsString);
         T.Param(1, NUM_PARAM.AsString);
      end;
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0), T.DameCampo(1)]);
   finally
      T.Free;
   end;
end;

procedure TWSbParamIcb.FormShow(Sender: TObject);
begin
   Objeto.ID_PARAM.Control            := ieIdentificador;
   Objeto.NUM_PARAM.Control           := ieNumero;
   Objeto.PARAMETRO.Control           := mClave;
   Objeto.VALUE_PARAM.Control         := mValor;
   Objeto.CVE_SITUACION_PARAM.Control := rgSituacion;
   Objeto.CVE_USUARIO_ALTA.Control    := edUsrAlta;
   Objeto.FH_ALTA.Control             := edFHAlta;
   Objeto.CVE_USUARIO_MOD.Control     := edUsrModifico;
   Objeto.FH_MODIFICA.Control         := edFHModifico;  
end;

procedure TWSbParamIcb.FormDestroy(Sender: TObject);
begin
   Objeto.ID_PARAM.Control            := nil;
   Objeto.NUM_PARAM.Control           := nil;
   Objeto.PARAMETRO.Control           := nil;
   Objeto.VALUE_PARAM.Control         := nil;
   Objeto.CVE_SITUACION_PARAM.Control := nil;
   Objeto.CVE_USUARIO_ALTA.Control    := nil;
   Objeto.FH_ALTA.Control             := nil;
   Objeto.CVE_USUARIO_MOD.Control     := nil;
   Objeto.FH_MODIFICA.Control         := nil;
end;

procedure TWSbParamIcb.InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean; var Realizado: Boolean);
var
   Qry : TQuery;
begin
   try
      try
         InterForma1.ShowError := False;
         if trim(ieIdentificador.text) = '' then
            raise EInterFrame.Create('Ingrese un Identificador');
         if trim(ieNumero.text) = '' then
            raise EInterFrame.Create('Ingrese un Numero');
         if trim(mValor.text) = '' then
            raise EInterFrame.Create('Ingrese un Valor');
         Objeto.GetFromControl;

         if IsNewData then
         begin
            Qry := GetSQLQuery(' SELECT * '
                             + '   FROM sb_parametro_icb '
                             + '  WHERE id_param  = ' + Objeto.ID_PARAM.AsSQL
                             + '    AND num_param = ' + Objeto.NUM_PARAM.AsSQL,
                               Objeto.SeguDataBaseName, Objeto.SeguSessionName, True);
            if Qry <> nil then
               raise EInterFrame.Create('El parametro ya existe');
            Objeto.CVE_USUARIO_ALTA.AsString := Objeto.DameUsuario;
            Objeto.FH_ALTA.AsDateTime        := Now;
         end;
         
         Objeto.CVE_USUARIO_MOD.AsString := Objeto.DameUsuario;
         Objeto.FH_MODIFICA.AsDateTime   := Now;
         Realizado := True;
      except
         on e: EInterFrame do
         begin
            MessageDlg(e.Message, mtInformation, [mbOK], 0);
            Realizado := False;
         end;
      end;
   finally
      if Qry <> nil then
      begin
         Qry.Close;
         Qry.Free;
      end;
   end;
end;

procedure TWSbParamIcb.InterForma1DespuesNuevo(Sender: TObject);
begin
   ieIdentificador.SetFocus;
   rgSituacion.ItemIndex := 0;
end;

procedure TWSbParamIcb.InterForma1DespuesModificar(Sender: TObject);
begin
   ieIdentificador.SetFocus;
end;

procedure TWSbParamIcb.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;
end.
