// Sistema         : SISTEMA DE TESORERIA
// Fecha de Inicio : 27/03/1998
// Función forma   : Clase de TESO_OPERACION
// Desarrollo por  : MANUEL ROMERO IBARRA
// Diseñado por    : Roberto Hugo Gochicoa Melendez
// Comentarios     :
Unit IntTesoOpera;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntMon, IntTPosicion,
UnSegBtn;

Type
 TTesoOpera= class;

  TWTesoOperacion=Class(TForm)
    InterForma1             : TInterForma;
    GroupBox1: TGroupBox;
    lbCVE_AF_COSTO: TLabel;
    lbCVE_AF_CAPITAL: TLabel;
    lbCVE_AF_INTERES: TLabel;
    lbCVE_AF_POS_COMP: TLabel;
    lbCVE_AF_POSICION: TLabel;
    lbCVE_AF_SALDO: TLabel;
    cbCVE_AF_SALDO: TComboBox;
    CBCVE_AF_SDO_BLOQ: TComboBox;
    CBCVE_AF_POS_COMP: TComboBox;
    CBCVE_AF_COSTO: TComboBox;
    CBCVE_AF_CAPITAL: TComboBox;
    CBCVE_AF_INTERES: TComboBox;
    lbCVE_AF_SDO_BLOQ: TLabel;
    lbCVE_AF_SDO_COMP: TLabel;
    lbCVE_AF_SDO_SBC: TLabel;
    GroupBox2: TGroupBox;
    lbDESC_C_ID_PRIM: TLabel;
    edDESC_C_ID_PRIM: TEdit;
    lbDESC_L_ID_PRIM: TLabel;
    edDESC_L_ID_PRIM: TEdit;
    GroupBox3: TGroupBox;
    lbCVE_OPERACION: TLabel;
    edCVE_OPERACION: TEdit;
    lbCVE_TIPO_OPER: TLabel;
    cbCVE_TIPO_OPER: TComboBox;
    GroupBox4: TGroupBox;
    lbDESC_C_ID_SEC: TLabel;
    edDESC_C_ID_SEC: TEdit;
    lbDESC_L_ID_SEC: TLabel;
    edDESC_L_ID_SEC: TEdit;
    cbCVE_AF_POSICION: TComboBox;
    cbCVE_AF_SDO_SBC: TComboBox;
    cbCVE_AF_SDO_COMP: TComboBox;
    GroupBox5: TGroupBox;
    lbCVE_OPER_CPDA: TLabel;
    edCVE_OPER_CPDA: TEdit;
    lbCVE_OPER_VMTO: TLabel;
    edCVE_OPER_VMTO: TEdit;
    lbCVE_MONEDA_BASE: TLabel;
    edCVE_MONEDA_BASE: TEdit;
    btMoneda: TSpeedButton;
    edDescMoneda: TEdit;
    lbCVE_TIP_POSIC: TLabel;
    edCVE_TIP_POSIC: TEdit;
    BTTipoPosic: TSpeedButton;
    edTipoPosic: TEdit;
    lbB_RETIENE_ISR: TLabel;
    chB_RETIENE_ISR: TCheckBox;
    lbB_CORTE_INFORM: TLabel;
    chB_CORTE_INFORM: TCheckBox;
    lbB_GENERA_TRAN: TLabel;
    chB_GENERA_TRAN: TCheckBox;
    SBLimpiTipoPos: TSpeedButton;
    btClaveOperCon: TSpeedButton;
    btClaveOperVen: TSpeedButton;
    EdDescCveOpeCont: TEdit;
    EdDescCveOpeVent: TEdit;
    BBReporte: TBitBtn;
    Panel3: TPanel;
    Label1: TLabel;
    lbB_CVE_CAPTURA: TLabel;
    chB_CVE_CAPTURA: TCheckBox;
    Label2: TLabel;
    edCVE_OPE_LIQ_EFVO: TEdit;
    sbCveOpeLiqEfvo: TSpeedButton;
    EdDescCveOpeLiqEfvo: TEdit;
    chB_AF_ACUM_SIAC: TCheckBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btMonedaClick(Sender: TObject);
    procedure BTTipoPosicClick(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure edCVE_OPER_CPDAExit(Sender: TObject);
    procedure edCVE_OPER_VMTOExit(Sender: TObject);
    procedure SBLimpiTipoPosClick(Sender: TObject);
    procedure cbCVE_AF_POSICIONEnter(Sender: TObject);
    procedure btClaveOperConClick(Sender: TObject);
    procedure btClaveOperVenClick(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure BBReporteClick(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure edDESC_C_ID_PRIMExit(Sender: TObject);
    procedure edDESC_C_ID_SECExit(Sender: TObject);
    procedure sbCveOpeLiqEfvoClick(Sender: TObject);
    procedure edCVE_OPE_LIQ_EFVOExit(Sender: TObject);
    private
    { Private declarations }
    VLCreaTipoOperaCon    : Boolean;
    VlCreaTipoOperaVen    : Boolean;
    VlCreaTipoOperaLiqEfvo: Boolean;
    VlCreaMonedaBase      : Boolean;
    Function ValidaCveCont         : Boolean;   //Valida Cve de Cont no este en captura en Cve Oper
    Function ValidaCveVenc         : Boolean;   //Valida Cve de Venc no este en captura en Cve Oper
    Function ValidaCveLiqEfvo      : Boolean;   //Valida Cve de Liq. Efvo. no este en captura en Cve Oper
    Function ValidaCveContExista   : Boolean;   //Valida Cve de Cont exista en Cve Oper
    Function ValidacveVencExista   : Boolean;   //Valida Cve de Venc exista en Cve Oper
    Function ValidaCveLiqEfvoExista: Boolean;
    Procedure   CreaTipoOperaCon;
    Procedure   CreaTipoOperaVen;
    Procedure   CreaTipoOperaLiqEfvo;
    Procedure   CreaMonedaBase;
    public
    { Public declarations }
    Objeto : TTesoOpera;
end;

 TTesoOpera= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_OPERACION            : TInterCampo;
        B_RETIENE_ISR            : TInterCampo;
        B_CORTE_INFORM           : TInterCampo;
        B_GENERA_TRAN            : TInterCampo;
        CVE_AF_COSTO             : TInterCampo;
        CVE_AF_CAPITAL           : TInterCampo;
        CVE_AF_INTERES           : TInterCampo;
        CVE_AF_POS_COMP          : TInterCampo;
        CVE_AF_POSICION          : TInterCampo;
        CVE_AF_SALDO             : TInterCampo;
        CVE_AF_SDO_BLOQ          : TInterCampo;
        CVE_AF_SDO_COMP          : TInterCampo;
        CVE_AF_SDO_SBC           : TInterCampo;
        CVE_MONEDA_BASE          : TInterCampo;
        CVE_OPER_CPDA            : TInterCampo;
        CVE_OPER_VMTO            : TInterCampo;
        CVE_OPE_LIQ_EFVO         : TInterCampo;
        CVE_TIP_POSIC            : TInterCampo;
        CVE_TIPO_OPER            : TInterCampo;
        DESC_C_ID_PRIM           : TInterCampo;
        DESC_C_ID_SEC            : TInterCampo;
        DESC_L_ID_PRIM           : TInterCampo;
        DESC_L_ID_SEC            : TInterCampo;
        B_CVE_CAPTURA            : TInterCampo;
        B_AF_ACUM_SIAC           : TInterCampo;

        TipoPosic                : TTPosicion;

        Moneda                   : TMoneda;
        TipoOperaCon             : TTesoOpera;
        TipoOperaVen             : TTesoOpera;
        TipoOperaLiqEfvo         : TTesoOpera;

        ParamTeso                : TInterFrame;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
        Procedure   CreaTipoOperaConCl;
        Procedure   CreaTipoOperaVenCl;
        Procedure   CreaTipoOperaLiqEfvoCl;
        Procedure   CreaMonedaBaseCl;
        function    ValidaOperacion(VLOperacion: String): Boolean;
      published
      end;

implementation

uses IntMCoOp;
//Uses RepMon;

{$R *.DFM}

//******************************************************************************
constructor TTesoOpera.Create( AOwner : TComponent );
begin Inherited;
      CVE_OPERACION :=CreaCampo('CVE_OPERACION',ftString,tsNinguno,tsNinguno,True);
        CVE_OPERACION .Size:=6;
                CVE_OPERACION.Caption:='Clave de Operacion ';
      B_RETIENE_ISR :=CreaCampo('B_RETIENE_ISR',ftString,tsNinguno,tsNinguno,True);
        B_RETIENE_ISR .Size:=1;
                B_RETIENE_ISR.Caption:='Retiene Isr ';
      B_CORTE_INFORM :=CreaCampo('B_CORTE_INFORM',ftString,tsNinguno,tsNinguno,True);
        B_CORTE_INFORM .Size:=1;
                B_CORTE_INFORM.Caption:='Aplica Corte ';
      B_GENERA_TRAN :=CreaCampo('B_GENERA_TRAN',ftString,tsNinguno,tsNinguno,True);
        B_GENERA_TRAN .Size:=1;
                B_GENERA_TRAN.Caption:='Genera Tran ';
      CVE_AF_COSTO :=CreaCampo('CVE_AF_COSTO',ftString,tsNinguno,tsNinguno,True);
        With CVE_AF_COSTO do
        begin Size:=1;
            UseCombo:=True;
            ComboLista.Add('INCREMENTA'); ComboDatos.Add('I');
            ComboLista.Add('DECREMENTA'); ComboDatos.Add('D');
            ComboLista.Add('NO APLICA');  ComboDatos.Add('N');
        end;
                CVE_AF_COSTO.Caption:='Clave de Af Costo ';
      CVE_AF_CAPITAL :=CreaCampo('CVE_AF_CAPITAL',ftString,tsNinguno,tsNinguno,True);
        With CVE_AF_CAPITAL do
        begin Size:=1;
            UseCombo:=True;
            ComboLista.Add('INCREMENTA'); ComboDatos.Add('I');
            ComboLista.Add('DECREMENTA'); ComboDatos.Add('D');
            ComboLista.Add('NO APLICA');  ComboDatos.Add('N');
        end;
                CVE_AF_CAPITAL.Caption:='Clave de Af Capital ';
      CVE_AF_INTERES :=CreaCampo('CVE_AF_INTERES',ftString,tsNinguno,tsNinguno,True);
        With CVE_AF_INTERES do
        begin Size:=1;
            UseCombo:=True;
            ComboLista.Add('INCREMENTA'); ComboDatos.Add('I');
            ComboLista.Add('DECREMENTA'); ComboDatos.Add('D');
            ComboLista.Add('NO APLICA');  ComboDatos.Add('N');
        end;
                CVE_AF_INTERES.Caption:='Clave de Af Interes ';
      CVE_AF_POS_COMP :=CreaCampo('CVE_AF_POS_COMP',ftString,tsNinguno,tsNinguno,True);
        With CVE_AF_POS_COMP do
        begin Size:=1;
            UseCombo:=True;
            ComboLista.Add('INCREMENTA'); ComboDatos.Add('I');
            ComboLista.Add('DECREMENTA'); ComboDatos.Add('D');
            ComboLista.Add('NO APLICA');  ComboDatos.Add('N');
        end;
                CVE_AF_POS_COMP.Caption:='Clave de Af Pos Comp ';
      CVE_AF_POSICION :=CreaCampo('CVE_AF_POSICION',ftString,tsNinguno,tsNinguno,True);
        With CVE_AF_POSICION do
        begin Size:=1;
            UseCombo:=True;
            ComboLista.Add('INCREMENTA'); ComboDatos.Add('I');
            ComboLista.Add('DECREMENTA'); ComboDatos.Add('D');
            ComboLista.Add('NO APLICA');  ComboDatos.Add('N');
        end;
                CVE_AF_POSICION.Caption:='Clave de Af Posicion ';
      CVE_AF_SALDO :=CreaCampo('CVE_AF_SALDO',ftString,tsNinguno,tsNinguno,True);
        With CVE_AF_SALDO do
        begin Size:=1;
            UseCombo:=True;
            ComboLista.Add('INCREMENTA'); ComboDatos.Add('I');
            ComboLista.Add('DECREMENTA'); ComboDatos.Add('D');
            ComboLista.Add('NO APLICA');  ComboDatos.Add('N');
        end;
                CVE_AF_SALDO.Caption:='Clave de Af Saldo ';
      CVE_AF_SDO_BLOQ :=CreaCampo('CVE_AF_SDO_BLOQ',ftString,tsNinguno,tsNinguno,True);
        With CVE_AF_SDO_BLOQ do
        begin Size:=1;
            UseCombo:=True;
            ComboLista.Add('INCREMENTA'); ComboDatos.Add('I');
            ComboLista.Add('DECREMENTA'); ComboDatos.Add('D');
            ComboLista.Add('NO APLICA');  ComboDatos.Add('N');
        end;
                CVE_AF_SDO_BLOQ.Caption:='Clave de Af Sdo Bloq ';
      CVE_AF_SDO_COMP :=CreaCampo('CVE_AF_SDO_COMP',ftString,tsNinguno,tsNinguno,True);
        With CVE_AF_SDO_COMP do
        begin Size:=1;
            UseCombo:=True;
            ComboLista.Add('INCREMENTA'); ComboDatos.Add('I');
            ComboLista.Add('DECREMENTA'); ComboDatos.Add('D');
            ComboLista.Add('NO APLICA');  ComboDatos.Add('N');
        end;
                CVE_AF_SDO_COMP.Caption:='Clave de Af Sdo Comp ';
      CVE_AF_SDO_SBC :=CreaCampo('CVE_AF_SDO_SBC',ftString,tsNinguno,tsNinguno,True);
        With CVE_AF_SDO_SBC do
        begin Size:=1;
            UseCombo:=True;
            ComboLista.Add('INCREMENTA'); ComboDatos.Add('I');
            ComboLista.Add('DECREMENTA'); ComboDatos.Add('D');
            ComboLista.Add('NO APLICA');  ComboDatos.Add('N');
        end;
                CVE_AF_SDO_SBC.Caption:='Clave de Af Sdo Sbc ';
      CVE_MONEDA_BASE :=CreaCampo('CVE_MONEDA_BASE',ftFloat,tsNinguno,tsNinguno,True);
                CVE_MONEDA_BASE.Caption:='Clave de Moneda Base ';
      CVE_OPER_CPDA :=CreaCampo('CVE_OPER_CPDA',ftString,tsNinguno,tsNinguno,True);
        CVE_OPER_CPDA .Size:=6;
                CVE_OPER_CPDA.Caption:='Clave de Operación Cpda ';
      CVE_OPER_VMTO :=CreaCampo('CVE_OPER_VMTO',ftString,tsNinguno,tsNinguno,True);
        CVE_OPER_VMTO .Size:=6;
                CVE_OPER_VMTO.Caption:='Clave de Operación Vmto ';
      CVE_OPE_LIQ_EFVO :=CreaCampo('CVE_OPE_LIQ_EFVO',ftString,tsNinguno,tsNinguno,True);
        CVE_OPE_LIQ_EFVO .Size:=6;
                CVE_OPE_LIQ_EFVO.Caption:='Clave de Operación Liqcion. Efvo. ';
      CVE_TIP_POSIC :=CreaCampo('CVE_TIP_POSIC',ftString,tsNinguno,tsNinguno,True);
        CVE_TIP_POSIC .Size:=6;
                CVE_TIP_POSIC.Caption:='Clave de Tip Posic ';
      CVE_TIPO_OPER :=CreaCampo('CVE_TIPO_OPER',ftString,tsNinguno,tsNinguno,True);
        With CVE_TIPO_OPER do
        begin Size:=2;
            UseCombo:=True;
            ComboLista.Add('MERCADO DE VALORES'); ComboDatos.Add('MV');
            ComboLista.Add('CREDITO'); ComboDatos.Add('CR');
            ComboLista.Add('INVERSION');  ComboDatos.Add('IN');
            ComboLista.Add('MOVIMIENTO DE EFECTIVO');  ComboDatos.Add('EF');
            ComboLista.Add('LEYENDA');  ComboDatos.Add('LE');
        end;
                CVE_TIPO_OPER.Caption:='Clave de Tipo Operación ';
      DESC_C_ID_PRIM :=CreaCampo('DESC_C_ID_PRIM',ftString,tsNinguno,tsNinguno,True);
                DESC_C_ID_PRIM.Caption:='Descripción C Número de Prim ';
      DESC_C_ID_SEC :=CreaCampo('DESC_C_ID_SEC',ftString,tsNinguno,tsNinguno,True);
                DESC_C_ID_SEC.Caption:='Descripción C Número de Sec ';
      DESC_L_ID_PRIM :=CreaCampo('DESC_L_ID_PRIM',ftString,tsNinguno,tsNinguno,True);
                DESC_L_ID_PRIM.Caption:='Descripción L Número de Prim ';
      DESC_L_ID_SEC :=CreaCampo('DESC_L_ID_SEC',ftString,tsNinguno,tsNinguno,True);
                DESC_L_ID_SEC.Caption:='Descripción L Número de Sec ';
      B_CVE_CAPTURA :=CreaCampo('B_CVE_CAPTURA',ftString,tsNinguno,tsNinguno,True);
        B_CVE_CAPTURA .Size:=1;
                B_CVE_CAPTURA.Caption:='Aplica Captura';
      B_AF_ACUM_SIAC := CreaCampo('B_AF_ACUM_SIAC',ftString,tsNinguno,tsNinguno,True);
        B_AF_ACUM_SIAC.Size:=1;
                B_AF_ACUM_SIAC.Caption:='Afecta Acum. SIAC';


      CVE_OPERACION.IsRequiered   :=True;
      DESC_C_ID_PRIM.IsRequiered  :=True;
      DESC_C_ID_SEC.IsRequiered   :=True;
      DESC_L_ID_PRIM.IsRequiered  :=True;
      DESC_L_ID_SEC.IsRequiered   :=True;
      CVE_MONEDA_BASE.IsRequiered :=True;
      B_RETIENE_ISR.IsRequiered   :=True;
      B_CORTE_INFORM.IsRequiered  :=True;
      B_GENERA_TRAN.IsRequiered   :=True;
      CVE_TIPO_OPER.IsRequiered   :=True;
      CVE_AF_SALDO.IsRequiered    :=True;
      CVE_AF_SDO_SBC.IsRequiered  :=True;
      CVE_AF_SDO_COMP.IsRequiered :=True;
      CVE_AF_SDO_BLOQ.IsRequiered :=True;
      CVE_AF_POSICION.IsRequiered :=True;
      CVE_AF_POS_COMP.IsRequiered :=True;
      CVE_AF_COSTO.IsRequiered    :=True;
      CVE_AF_CAPITAL.IsRequiered  :=True;
      CVE_AF_INTERES.IsRequiered  :=True;
      CVE_OPER_CPDA.IsRequiered   :=True;
      CVE_OPER_VMTO.IsRequiered   :=True;
      CVE_OPE_LIQ_EFVO.IsRequiered:=True;

      FKeyFields.Add('CVE_OPERACION');

      TableName := 'TESO_OPERACION';
      UseQuery  := True;
      HelpFile  := 'IntTesoOpera.Hlp';
      ShowMenuReporte:=True;

      TipoPosic:=TTPosicion.Create(self);
      TipoPosic.MasterSource:=Self;
      TipoPosic.CVE_TIP_POSIC.MasterField:='CVE_TIP_POSIC';

      Debug:=False;
end;
//******************************************************************************
Destructor TTesoOpera.Destroy;
begin
   if TipoPosic        <> nil then TipoPosic.Free;
   if Moneda           <> nil then Moneda.Free;
   if TipoOperaCon     <> nil then TipoOperaCon.Free;
   if TipoOperaVen     <> nil then TipoOperaVen.Free;
   if TipoOperaLiqEfvo <> nil then TipoOperaLiqEfvo.Free;
inherited;
end;
//******************************************************************************
Procedure   TTesoOpera.CreaTipoOperaConCl;
begin
     TipoOperaCon:=TTesoOpera.Create(self);
     TipoOperaCon.GetParams(self);
     TipoOperaCon.MasterSource:=Self;
end;
//******************************************************************************
Procedure   TTesoOpera.CreaTipoOperaVenCl;
begin
     TipoOperaVen:=TTesoOpera.Create(self);
     TipoOperaVen.GetParams(self);
     TipoOperaVen.MasterSource:=Self;
end;
//******************************************************************************
Procedure   TTesoOpera.CreaTipoOperaLiqEfvoCl;
begin
     TipoOperaLiqEfvo:=TTesoOpera.Create(self);
     TipoOperaLiqEfvo.GetParams(self);
     TipoOperaLiqEfvo.MasterSource:=Self;
end;
//******************************************************************************
Procedure   TTesoOpera.CreaMonedaBaseCl;
begin
      Moneda:=TMoneda.Create(Self);
      Moneda.GetParams(self);
      Moneda.MasterSource:=Self;
end;
//******************************************************************************
function TTesoOpera.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWTesoOperacion;
begin
   W:=TWTesoOperacion.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
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
//******************************************************************************
Function TTesoOpera.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ITesOpe.it','S');
      Try if Active then begin T.Param(0,CVE_OPERACION.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;
//******************************************************************************
function TTesoOpera.Reporte:Boolean;
begin
     Execute_MenuRepOpeCon(True,Self);
end;

//******************************************************************************

function    TTesoOpera.ValidaOperacion(VLOperacion: String): Boolean;
begin
     if FindKey([VLOperacion]) then
     begin
          if ((CVE_TIPO_OPER.AsString = 'EF') and (B_CVE_CAPTURA.AsString = 'V')) then
              ValidaOperacion := True
          else
              ValidaOperacion := False;
          //end if
     end
     else
         ValidaOperacion := False;
     //end if
end;

{*******************************************************************************
PROCEDIMIENTOS CREADOS
*******************************************************************************}

// Valida que no exista la clave de operación
// en la clave de contrapartida a nivel captura (edit.tetx)
Function TWTesoOperacion.ValidaCveCont      : Boolean;
begin
     ValidaCveCont:=False;
     if edCVE_OPERACION.Text=edCVE_OPER_CPDA.Text then
     begin
          Showmessage('La CLAVE de CONTRAPARTIDA no puede ser igual a la CLAVE de OPERACION, Gracias.');
          ValidaCveCont:=False;
     end
     else
         ValidaCveCont:=True;

end;
//******************************************************************************
// Valida que no exista la clave de operación
// en la clave de operacion de vencimiento a nivel captura (edit.tetx)
Function TWTesoOperacion.ValidaCveVenc      : Boolean;
begin
  ValidaCveVenc:=False;
  if edCVE_OPERACION.Text=edCVE_OPER_VMTO.Text then
  begin
    Showmessage('La CLAVE de VENCIMIENTO no puede ser igual a la CLAVE de OPERACION, Gracias.');
    ValidaCveVenc:=False;
  end
  else
    ValidaCveVenc:=True;
end;
//******************************************************************************
// Valida que no exista la clave de operación
// en la clave de operacion de vencimiento a nivel captura (edit.tetx)
Function TWTesoOperacion.ValidaCveLiqEfvo      : Boolean;
begin
  ValidaCveLiqEfvo:=False;
  if (edCVE_OPERACION.Text=edCVE_OPE_LIQ_EFVO.Text) then
  begin
    Showmessage('La CLAVE de LIQUIDACION no puede ser igual a la CLAVE de OPERACION, Gracias.');
    ValidaCveLiqEfvo:=False;
  end
  else
    ValidaCveLiqEfvo:=True;
end;
//******************************************************************************
// Valida que no exista la clave de operación
//Crea un Tquery y verifica que exista
Function TWTesoOperacion.ValidaCveContExista: Boolean;
var QCveOper: TQuery;
begin
     ValidaCveContExista:=True;
     try
        QCveOper:=TQuery.Create(Self);
        QCveOper.DatabaseName:=Objeto.DataBaseName;
        QCveOper.SessionName:=Objeto.SessionName;
        QCveOper.Close;
        QCveOper.SQL.Clear;
        QCveOper.SQL.Add('SELECT CVE_OPERACION');
        QCveOper.SQL.Add('FROM TESO_OPERACION');
        QCveOper.SQL.Add('WHERE CVE_OPERACION='+#39+edCVE_OPER_CPDA.Text+#39);
        QCveOper.Open;
        if QCveOper.IsEmpty then
        begin
             Showmessage('La CLAVE de CONTRAPARTIDA no ha sido dada de alta previamente, Gracias.');
             ValidaCveContExista:=False;
        end
        else
        begin
             ValidaCveContExista:=True;
        end;
     finally
        QCveOper.Free;
     end;
end;
//******************************************************************************
// Valida que no exista la clave de operación
//Crea un Tquery y verifica que exista
Function TWTesoOperacion.ValidacveVencExista: Boolean;
var QCveOper: TQuery;
begin
     ValidacveVencExista:=True;
     try
        QCveOper:=TQuery.Create(Self);
        QCveOper.DatabaseName:=Objeto.DataBaseName;
        QCveOper.SessionName:=Objeto.SessionName;
        QCveOper.Close;
        QCveOper.SQL.Clear;
        QCveOper.SQL.Add('SELECT CVE_OPERACION');
        QCveOper.SQL.Add('FROM TESO_OPERACION');
        QCveOper.SQL.Add('WHERE CVE_OPERACION='+#39+edCVE_OPER_VMTO.Text+#39);
        QCveOper.Open;
        if QCveOper.IsEmpty then
        begin
             Showmessage('La CLAVE de VENCIMIENTO no ha sido dada de alta previamente, Gracias.');
             ValidacveVencExista:=False;
        end
        else
        begin
             ValidacveVencExista:=true;
        end;
     finally
        QCveOper.Free;
     end;
end;

//******************************************************************************
// Valida que no exista la clave de operación
//Crea un Tquery y verifica que exista
Function TWTesoOperacion.ValidaCveLiqEfvoExista: Boolean;
var QCveOper: TQuery;
begin
     ValidaCveLiqEfvoExista:=True;
     try
        QCveOper:=TQuery.Create(Self);
        QCveOper.DatabaseName:=Objeto.DataBaseName;
        QCveOper.SessionName:=Objeto.SessionName;
        QCveOper.Close;
        QCveOper.SQL.Clear;
        QCveOper.SQL.Add('SELECT CVE_OPERACION');
        QCveOper.SQL.Add('FROM TESO_OPERACION');
        QCveOper.SQL.Add('WHERE CVE_OPERACION='+#39+edCVE_OPE_LIQ_EFVO.Text+#39);
        QCveOper.Open;
        if QCveOper.IsEmpty then
        begin
             Showmessage('La CLAVE de LIQCION. EFVO. no ha sido dada de alta previamente, Gracias.');
             ValidaCveLiqEfvoExista:=False;
        end
        else
        begin
             ValidaCveLiqEfvoExista:=true;
        end;
     finally
        QCveOper.Free;
     end;
end;

//******************************************************************************
Procedure   TWTesoOperacion.CreaTipoOperaCon;
begin
     if VLCreaTipoOperaCon=False then
     begin
          Objeto.CreaTipoOperaConCl;
          Objeto.TipoOperaCon.CVE_OPERACION.MasterField:='CVE_OPER_CPDA';
          Objeto.TipoOperaCon.DESC_C_ID_PRIM.Control:=EdDescCveOpeCont;      // EDIT MUESTRE DESCRIPCION
          Objeto.TipoOperaCon.MasterSourceEditControl:=btClaveOperCon;// MASTER SOURCE EDIT CONTROL
          VLCreaTipoOperaCon:=True;
     end;
end;
//******************************************************************************
Procedure   TWTesoOperacion.CreaTipoOperaVen;
begin
     if VlCreaTipoOperaVen=False then
     begin
          Objeto.CreaTipoOperaVenCl;
          Objeto.TipoOperaVen.CVE_OPERACION.MasterField:='CVE_OPER_VMTO';
          Objeto.TipoOperaVen.DESC_C_ID_PRIM.Control:=EdDescCveOpeVent;      // EDIT MUESTRE DESCRIPCION
          Objeto.TipoOperaVen.MasterSourceEditControl:=btClaveOperVen;// MASTER SOURCE EDIT CONTROL
          VlCreaTipoOperaVen:=True;
     end;
end;
//******************************************************************************
Procedure   TWTesoOperacion.CreaTipoOperaLiqEfvo;
begin
     if VlCreaTipoOperaLiqEfvo=False then
     begin
          Objeto.CreaTipoOperaLiqEfvoCl;
          Objeto.TipoOperaLiqEfvo.CVE_OPERACION.MasterField:='CVE_OPE_LIQ_EFVO';
          Objeto.TipoOperaLiqEfvo.DESC_C_ID_PRIM.Control:=EdDescCveOpeLiqEfvo;      // EDIT MUESTRE DESCRIPCION
          Objeto.TipoOperaLiqEfvo.MasterSourceEditControl:=sbCveOpeLiqEfvo;// MASTER SOURCE EDIT CONTROL
          VlCreaTipoOperaLiqEfvo:=True;
     end;
end;
//******************************************************************************
Procedure   TWTesoOperacion.CreaMonedaBase;
begin
     if VlCreaMonedaBase=False then
     begin
          Objeto.CreaMonedaBaseCl;
          Objeto.Moneda.Cve_Moneda.MasterField:='CVE_MONEDA_BASE';
          Objeto.Moneda.Desc_Moneda.Control:=edDescMoneda;      // EDIT MUESTRE DESCRIPCION
          Objeto.Moneda.MasterSourceEditControl:=btMoneda;      // MASTER SOURCE EDIT CONTROL
          VlCreaMonedaBase:=True;
     end;
end;

(***********************************************FORMA TESO_OPERACION********************)
(*                                                                              *)
(*  FORMA DE TESO_OPERACION                                                            *)
(*                                                                              *)
(***********************************************FORMA TESO_OPERACION********************)

procedure TWTesoOperacion.FormShow(Sender: TObject);
begin
      Objeto.ParamTeso.FieldByName('NOMBRE_TESO').Control:=Label1;
      Objeto.CVE_OPERACION.Control   := edCVE_OPERACION;
      Objeto.B_RETIENE_ISR.Control   := chB_RETIENE_ISR;
      Objeto.B_CORTE_INFORM.Control  := chB_CORTE_INFORM;
      Objeto.B_GENERA_TRAN.Control   := chB_GENERA_TRAN;
      Objeto.CVE_AF_COSTO.Control    := CBCVE_AF_COSTO;
      Objeto.CVE_AF_CAPITAL.Control  := CBCVE_AF_CAPITAL;
      Objeto.CVE_AF_INTERES.Control  := CBCVE_AF_INTERES;
      Objeto.CVE_AF_POS_COMP.Control := CBCVE_AF_POS_COMP;
      Objeto.CVE_AF_POSICION.Control := cbCVE_AF_POSICION;
      Objeto.CVE_AF_SALDO.Control    := cbCVE_AF_SALDO;
      Objeto.CVE_AF_SDO_BLOQ.Control := CBCVE_AF_SDO_BLOQ;
      Objeto.CVE_AF_SDO_COMP.Control := cbCVE_AF_SDO_COMP;
      Objeto.CVE_AF_SDO_SBC.Control  := cbCVE_AF_SDO_SBC;
      Objeto.CVE_MONEDA_BASE.Control := edCVE_MONEDA_BASE;
      Objeto.CVE_OPER_CPDA.Control   := edCVE_OPER_CPDA;
      Objeto.CVE_OPER_VMTO.Control   := edCVE_OPER_VMTO;
      Objeto.CVE_OPE_LIQ_EFVO.Control:= edCVE_OPE_LIQ_EFVO;
      Objeto.CVE_TIP_POSIC.Control   := edCVE_TIP_POSIC;
      Objeto.CVE_TIPO_OPER.Control   := cbCVE_TIPO_OPER;
      Objeto.DESC_C_ID_PRIM.Control  := edDESC_C_ID_PRIM;
      Objeto.DESC_C_ID_SEC.Control   := edDESC_C_ID_SEC;
      Objeto.DESC_L_ID_PRIM.Control  := edDESC_L_ID_PRIM;
      Objeto.DESC_L_ID_SEC.Control   := edDESC_L_ID_SEC;
      Objeto.B_CVE_CAPTURA.Control   := chB_CVE_CAPTURA;
      Objeto.B_AF_ACUM_SIAC.Control  := chB_AF_ACUM_SIAC;

      Objeto.TipoPosic.DESC_TIPO_POSIC.Control:=edTipoPosic;// EDIT MUESTRE DESCRIPCION
      Objeto.TipoPosic.MasterSourceEditControl:=BTTipoPosic;// MASTER SOURCE EDIT CONTROL
      edTipoPosic.PopupMenu:=Objeto.TipoPosic.PopMenu;      // MENU POP
      edCVE_TIP_POSIC.PopupMenu:=Objeto.TipoPosic.PopMenu;  // MENU POP

      VLCreaTipoOperaCon     :=False;
      VlCreaTipoOperaVen     :=False;
      VlCreaTipoOperaLiqEfvo :=False;
      VlCreaMonedaBase       :=False;
end;
//******************************************************************************
procedure TWTesoOperacion.FormDestroy(Sender: TObject);
begin
     Objeto.TipoPosic.DESC_TIPO_POSIC.Control:=NIL;
     Objeto.TipoPosic.MasterSourceEditControl:=NIL;
     // NO SE DESASIGNA edDescTipoPosic.PopupMenu:=Objeto.TipoPosic.PopMenu; // MENU POP

     if VlCreaMonedaBase then
     begin
       Objeto.Moneda.Desc_Moneda.Control:=nil;
       Objeto.Moneda.MasterSourceEditControl:=nil;
     end;

     if VLCreaTipoOperaCon then
     begin
       Objeto.TipoOperaCon.DESC_C_ID_PRIM.Control :=Nil;
       Objeto.TipoOperaCon.MasterSourceEditControl:=Nil;
     end;

     if VlCreaTipoOperaVen then
     begin
       Objeto.TipoOperaVen.DESC_C_ID_PRIM.Control :=Nil;
       Objeto.TipoOperaVen.MasterSourceEditControl:=Nil;
     end;

     if VlCreaTipoOperaLiqEfvo then
     begin
       Objeto.TipoOperaLiqEfvo.DESC_C_ID_PRIM.Control :=Nil;
       Objeto.TipoOperaLiqEfvo.MasterSourceEditControl:=Nil;
     end;

     Objeto.CVE_OPERACION.Control   :=nil;
     Objeto.B_RETIENE_ISR.Control   :=nil;
     Objeto.B_CORTE_INFORM.Control  :=nil;
     Objeto.B_GENERA_TRAN.Control   :=nil;
     Objeto.CVE_AF_COSTO.Control    :=nil;
     Objeto.CVE_AF_CAPITAL.Control  :=nil;
     Objeto.CVE_AF_INTERES.Control  :=nil;
     Objeto.CVE_AF_POS_COMP.Control :=nil;
     Objeto.CVE_AF_POSICION.Control :=nil;
     Objeto.CVE_AF_SALDO.Control    :=nil;
     Objeto.CVE_AF_SDO_BLOQ.Control :=nil;
     Objeto.CVE_AF_SDO_COMP.Control :=nil;
     Objeto.CVE_AF_SDO_SBC.Control  :=nil;
     Objeto.CVE_MONEDA_BASE.Control :=nil;
     Objeto.CVE_OPER_CPDA.Control   :=nil;
     Objeto.CVE_OPER_VMTO.Control   :=nil;
     Objeto.CVE_OPE_LIQ_EFVO.Control:=nil;
     Objeto.CVE_TIP_POSIC.Control   :=nil;
     Objeto.CVE_TIPO_OPER.Control   :=nil;
     Objeto.DESC_C_ID_PRIM.Control  :=nil;
     Objeto.DESC_C_ID_SEC.Control   :=nil;
     Objeto.DESC_L_ID_PRIM.Control  :=nil;
     Objeto.DESC_L_ID_SEC.Control   :=nil;
     Objeto.B_CVE_CAPTURA.Control   :=nil;
     Objeto.B_AF_ACUM_SIAC.Control  :=nil;
     Try
       Objeto.ParamTeso.FieldByName('NOMBRE_TESO').Control:=nil;
     except
     end;
   //Objeto
end;
//******************************************************************************
procedure TWTesoOperacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;
//******************************************************************************
procedure TWTesoOperacion.InterForma1DespuesNuevo(Sender: TObject);
begin
     BBReporte.Enabled:=False;
     edCVE_OPERACION.SetFocus;
     cbCVE_TIPO_OPER.ItemIndex  :=0;
     cbCVE_AF_SALDO.ItemIndex   :=2;
     cbCVE_AF_SDO_SBC.ItemIndex :=2;
     cbCVE_AF_SDO_COMP.ItemIndex:=2;
     CBCVE_AF_SDO_BLOQ.ItemIndex:=2;
     cbCVE_AF_POSICION.ItemIndex:=2;
     CBCVE_AF_POS_COMP.ItemIndex:=2;
     CBCVE_AF_COSTO.ItemIndex   :=2;
     CBCVE_AF_CAPITAL.ItemIndex :=2;
     CBCVE_AF_INTERES.ItemIndex :=2;
     objeto.CVE_OPER_CPDA.AsString   :='NOAPLI';
     Objeto.CVE_OPER_VMTO.AsString   :='NOAPLI';
     Objeto.CVE_OPE_LIQ_EFVO.AsString:='NOAPLI';
     //valida que la clave dada por default sea valida y exista
     if ValidaCveContExista then
     begin
          CreaTipoOperaCon;
          Objeto.TipoOperaCon.FindKey([edCVE_OPER_CPDA.Text]);
     end
     else
     begin
          EdDescCveOpeCont.Clear;
          ShowMessage('No existe la clave "NOAPLI". Gracias!!!!!');
     end;
     //valida que la clave dada por default sea valida y exista
     if ValidacveVencExista then
     begin
          CreaTipoOperaVen;
          Objeto.TipoOperaVen.FindKey([edCVE_OPER_VMTO.Text]);
     end
     else
     begin
          EdDescCveOpeVent.Clear;
          ShowMessage('No existe la clave "NOAPLI". Gracias!!!!!');
     end;

     //valida que la clave dada por default sea valida y exista
     if ValidaCveLiqEfvoExista then
     begin
          CreaTipoOperaLiqEfvo;
          Objeto.TipoOperaLiqEfvo.FindKey([edCVE_OPE_LIQ_EFVO.Text]);
     end
     else
     begin
          EdDescCveOpeLiqEfvo.Clear;
          ShowMessage('No existe la clave "NOAPLI". Gracias!!!!!');
     end;

     //Localiza que la moneda base exista
     CreaMonedaBase;
     Objeto.Moneda.FindKey([Objeto.ParamTeso.FieldByName('CVE_MONEDA_BASE').AsSQL]);
end;
//******************************************************************************
procedure TWTesoOperacion.InterForma1DespuesModificar(Sender: TObject);
begin
     BBReporte.Enabled:=False;
     edCVE_OPERACION.SetFocus;
end;
//******************************************************************************
procedure TWTesoOperacion.btMonedaClick(Sender: TObject);
begin 

// NUEVA VALIDACION DE ACCESOS A BOTONES.  AUTO OCT 2012
IF not ValidaAccesoEsp(objeto.apli, 'TTESOOPERA_BTN0',true, true) THEN EXIT;

 
     CreaMonedaBase;
     Objeto.Moneda.Busca;
end;
//******************************************************************************
procedure TWTesoOperacion.BTTipoPosicClick(Sender: TObject);
begin 

// NUEVA VALIDACION DE ACCESOS A BOTONES.  AUTO OCT 2012
IF not ValidaAccesoEsp(objeto.apli, 'TTESOOPERA_BTN1',true, true) THEN EXIT;

 
     Objeto.TipoPosic.Busca;
     CBCVE_AF_POS_COMP.Enabled:=True;
     cbCVE_AF_POSICION.Enabled:=True;
end;
//******************************************************************************
procedure TWTesoOperacion.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
     Realizado:=True;

     if not(ValidaCveCont)    or  //Valida Cve de Cont no este en captura en Cve Oper
        not(ValidaCveVenc)    or  //Valida Cve de Venc no este en captura en Cve Oper
        not(ValidaCveLiqEfvo) then
     begin
          Realizado:=False;
          exit;
     end;

     If edCVE_TIP_POSIC.Text='' then
     begin Objeto.CVE_TIP_POSIC.IsNull:=True;
     end;

     ValidaCveContExista;  //Verifica que la Cve de Contrapartida exista en Cve de Operación
     ValidaCveVencExista;  //Verifica que la Cve de Vencimiento exista en la Cve de Operación
     ValidaCveLiqEfvoExista;

     BBReporte.Enabled:=True;
end;
//******************************************************************************
procedure TWTesoOperacion.SBLimpiTipoPosClick(Sender: TObject);
begin 

// NUEVA VALIDACION DE ACCESOS A BOTONES.  AUTO OCT 2012
IF not ValidaAccesoEsp(objeto.apli, 'TTESOOPERA_BTN2',true, true) THEN EXIT;

 
     edCVE_TIP_POSIC.Clear;
     Objeto.TipoPosic.Active:=False;
     CBCVE_AF_POS_COMP.ItemIndex:=2;
     cbCVE_AF_POSICION.ItemIndex:=2;
     CBCVE_AF_POS_COMP.Enabled:=False;
     cbCVE_AF_POSICION.Enabled:=False;
end;
//******************************************************************************
//Pone en ENABLED=False los 'CB' de Posición si el tipo de posición no se ha dado de alta
procedure TWTesoOperacion.cbCVE_AF_POSICIONEnter(Sender: TObject);
begin
     If edCVE_TIP_POSIC.Text='' then
     begin
          CBCVE_AF_POS_COMP.Enabled:=False;
          cbCVE_AF_POSICION.Enabled:=False;
     end;
end;
//******************************************************************************
procedure TWTesoOperacion.btClaveOperConClick(Sender: TObject);
begin

// NUEVA VALIDACION DE ACCESOS A BOTONES.  AUTO OCT 2012
IF not ValidaAccesoEsp(objeto.apli, 'TTESOOPERA_BTN3',true, true) THEN EXIT;
     CreaTipoOperaCon;
     Objeto.TipoOperaCon.Busca;
end;
//******************************************************************************
procedure TWTesoOperacion.btClaveOperVenClick(Sender: TObject);
begin 

// NUEVA VALIDACION DE ACCESOS A BOTONES.  AUTO OCT 2012
IF not ValidaAccesoEsp(objeto.apli, 'TTESOOPERA_BTN4',true, true) THEN EXIT;

 
     CreaTipoOperaVen;
     Objeto.TipoOperaVen.Busca;
end;
//******************************************************************************
procedure TWTesoOperacion.sbCveOpeLiqEfvoClick(Sender: TObject);
begin

// NUEVA VALIDACION DE ACCESOS A BOTONES.  AUTO OCT 2012
IF not ValidaAccesoEsp(objeto.apli, 'TTESOOPERA_BTN6',true, true) THEN EXIT;

 
  CreaTipoOperaLiqEfvo;
  Objeto.TipoOperaLiqEfvo.Busca;
end;

//******************************************************************************
procedure TWTesoOperacion.edCVE_OPER_CPDAExit(Sender: TObject);
begin  //Al salir del Edit Verifica que la Cve de Contrapartida exista en Cve de Operación
     ValidaCveCont;
     if ValidaCveContExista then
     begin
          CreaTipoOperaCon;
          Objeto.TipoOperaCon.FindKey([edCVE_OPER_CPDA.Text]);
     end
     else
     begin
          EdDescCveOpeCont.Clear;
     end;
end;
//******************************************************************************
procedure TWTesoOperacion.edCVE_OPER_VMTOExit(Sender: TObject);
begin //Al salir del Edit Verifica que la Cve de Vencimiento exista en Cve de Operación
      ValidaCveVenc;
     if ValidacveVencExista then
     begin
          CreaTipoOperaVen;
          Objeto.TipoOperaVen.FindKey([edCVE_OPER_VMTO.Text]);
      end
      else
      begin
           EdDescCveOpeVent.Clear;
      end;
end;
//******************************************************************************
procedure TWTesoOperacion.edCVE_OPE_LIQ_EFVOExit(Sender: TObject);
begin
   ValidaCveLiqEfvo;
   if ValidaCveLiqEfvoExista then
   begin
     CreaTipoOperaLiqEfvo;
     Objeto.TipoOperaLiqEfvo.FindKey([edCVE_OPE_LIQ_EFVO.Text]);
   end
   else
   begin
     EdDescCveOpeLiqEfvo.Clear;
   end;
end;
//******************************************************************************
procedure TWTesoOperacion.InterForma1Buscar(Sender: TObject);
begin
   Objeto.InternalBusca;
   CreaTipoOperaVen;
   Objeto.TipoOperaVen.FindKey([edCVE_OPER_VMTO.Text]);
   CreaTipoOperaCon;
   Objeto.TipoOperaCon.FindKey([edCVE_OPER_CPDA.Text]);
   CreaTipoOperaLiqEfvo;
   Objeto.TipoOperaLiqEfvo.FindKey([edCVE_OPE_LIQ_EFVO.Text]);
end;
//******************************************************************************
procedure TWTesoOperacion.BBReporteClick(Sender: TObject);
begin
// NUEVA VALIDACION DE ACCESOS A BOTONES.  AUTO OCT 2012
IF not ValidaAccesoEsp(objeto.apli, 'TTESOOPERA_BTN5',true, true) THEN EXIT;
Objeto.Reporte;
end;
//******************************************************************************
procedure TWTesoOperacion.InterForma1DespuesCancelar(Sender: TObject);
begin
     BBReporte.Enabled:=True;
end;
//******************************************************************************
procedure TWTesoOperacion.edDESC_C_ID_PRIMExit(Sender: TObject);
begin
     edDESC_L_ID_PRIM.Text:=edDESC_C_ID_PRIM.Text;
end;
//******************************************************************************
procedure TWTesoOperacion.edDESC_C_ID_SECExit(Sender: TObject);
begin
     edDESC_L_ID_SEC.Text:=edDESC_C_ID_SEC.Text;
end;
//******************************************************************************


end.
