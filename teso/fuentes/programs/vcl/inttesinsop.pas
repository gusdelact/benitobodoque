// Sistema         : Clase de TESO_INSTR_OPER
// Fecha de Inicio : 7/04/1998
// Función forma   : Clase de TESO_INSTR_OPER
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Rocio Del Carmen Arriaga Cardenas
// Comentarios     :
Unit IntTesInsOp;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntTesoOpera,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntMon, IntTasIndFin;

Type
 TTesInsOp= class;

  TWTesoInstrOp=Class(TForm)
    InterForma1             : TInterForma;
    GroupBox1: TGroupBox;
    edDESC_C_ID_PRIM: TEdit;
    lbDESC_C_ID_PRIM: TLabel;
    lbDESC_L_ID_PRIM: TLabel;
    edDESC_L_ID_PRIM: TEdit;
    GroupBox2: TGroupBox;
    lbDESC_C_ID_SEC: TLabel;
    edDESC_C_ID_SEC: TEdit;
    lbDESC_L_ID_SEC: TLabel;
    edDESC_L_ID_SEC: TEdit;
    GroupBox3: TGroupBox;
    lbCVE_MONEDA_BASE: TLabel;
    edCVE_MONEDA_BASE: TEdit;
    lbCVE_TIPO_SECTOR: TLabel;
    lbCVE_TIPO_TASA: TLabel;
    lbCVE_PER_JURIDICA: TLabel;
    edCVE_TASA_REF: TEdit;
    lbCVE_TASA_REF: TLabel;
    lbDIAS_PAGO: TLabel;
    edDIAS_PAGO: TEdit;
    lbDIAS_REVIS_TASA: TLabel;
    edDIAS_REVIS_TASA: TEdit;
    lbTIPO_ANUALIZA: TLabel;
    lbTIPO_CALC_INT: TLabel;
    edTIPO_CALC_INT: TEdit;
    chB_AFEC_CHEQRA: TCheckBox;
    chB_RETIENE_ISR: TCheckBox;
    chB_VENMTO_AUT: TCheckBox;
    GroupBox4: TGroupBox;
    lbCVE_INSTRUMENTO: TLabel;
    edCVE_INSTRUMENTO: TEdit;
    lbCVE_TIPO_OPER: TLabel;
    cbCVE_TIPO_OPER: TComboBox;
    sbCveMoneda: TSpeedButton;
    edDescripcionMoneda: TEdit;
    cbCVE_TIPO_SECTOR: TComboBox;
    cbCVE_TIPO_TASA: TComboBox;
    cbCVE_PER_JURIDICA: TComboBox;
    cbTIPO_ANUALIZA: TComboBox;
    edDescripcionTasa: TEdit;
    sbCveTasa: TSpeedButton;
    Button1: TButton;
    chB_EMITE_DOCTO: TCheckBox;
    edCVE_OPE_CARGO: TEdit;
    EdDescCveOpeCargo: TEdit;
    edCVE_OPE_ABONO: TEdit;
    EdDescCveOpeAbono: TEdit;
    sbCveOpeCargo: TSpeedButton;
    sbCveOpeAbono: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    chB_AF_ACUM_SIAC: TCheckBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure sbCveMonedaClick(Sender: TObject);
    procedure sbCveTasaClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure edDESC_C_ID_PRIMExit(Sender: TObject);
    procedure edDESC_C_ID_SECExit(Sender: TObject);
    procedure sbCveOpeCargoClick(Sender: TObject);
    procedure sbCveOpeAbonoClick(Sender: TObject);
    private
    { Private declarations }
    function ValidaDiasRevis : Boolean;
    function ValidaClavesOpe : Boolean;

    public
    { Public declarations }
    Objeto : TTesInsOp;
end;
 TTesInsOp= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_INSTRUMENTO          : TInterCampo;
        B_AFEC_CHEQRA            : TInterCampo;
        B_RETIENE_ISR            : TInterCampo;
        B_VENMTO_AUT             : TInterCampo;
        B_EMITE_DOCTO            : TInterCampo;
        B_AF_ACUM_SIAC           : TInterCampo;
        CVE_MONEDA_BASE          : TInterCampo;
        CVE_PER_JURIDICA         : TInterCampo;
        CVE_TASA_REF             : TInterCampo;
        CVE_TIPO_OPER            : TInterCampo;
        CVE_TIPO_SECTOR          : TInterCampo;
        CVE_TIPO_TASA            : TInterCampo;
        CVE_OPE_CARGO            : TInterCampo;
        CVE_OPE_ABONO            : TInterCampo;
        DESC_C_ID_PRIM           : TInterCampo;
        DESC_C_ID_SEC            : TInterCampo;
        DESC_L_ID_PRIM           : TInterCampo;
        DESC_L_ID_SEC            : TInterCampo;
        DIAS_PAGO                : TInterCampo;
        DIAS_REVIS_TASA          : TInterCampo;
        TIPO_ANUALIZA            : TInterCampo;
        TIPO_CALC_INT            : TInterCampo;

        Moneda                   : TMoneda;
        Tasa                     : TTasIndFin;
        CveOperCargo             : TTesoOpera;
        CveOperAbono             : TTesoOpera;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
        function    ValidaInstrumento(VLInstrumento: String; VLCveMonedaBase: Integer): Boolean;
      published
      end;


implementation
//Uses RepMon;

{$R *.DFM}


constructor TTesInsOp.Create( AOwner : TComponent );
begin Inherited;
      CVE_INSTRUMENTO :=CreaCampo('CVE_INSTRUMENTO',ftString,tsNinguno,tsNinguno,True);
        CVE_INSTRUMENTO .Size:=6;
                CVE_INSTRUMENTO.Caption:='Clave de Instrumento ';
      B_AFEC_CHEQRA :=CreaCampo('B_AFEC_CHEQRA',ftString,tsNinguno,tsNinguno,True);
        B_AFEC_CHEQRA .Size:=1;
                B_AFEC_CHEQRA.Caption:='Afec Cheqra ';
      B_RETIENE_ISR :=CreaCampo('B_RETIENE_ISR',ftString,tsNinguno,tsNinguno,True);
        B_RETIENE_ISR .Size:=1;
                B_RETIENE_ISR.Caption:='Retiene Isr ';
      B_VENMTO_AUT :=CreaCampo('B_VENMTO_AUT',ftString,tsNinguno,tsNinguno,True);
        B_VENMTO_AUT .Size:=1;
                B_VENMTO_AUT.Caption:='Venmto Aut ';
      B_EMITE_DOCTO := CreaCampo('B_EMITE_DOCTO',ftString,tsNinguno,tsNinguno,True);
        B_EMITE_DOCTO.Size:=1;
                B_EMITE_DOCTO.Caption:='Emite Docto.';
      B_AF_ACUM_SIAC := CreaCampo('B_AF_ACUM_SIAC',ftString,tsNinguno,tsNinguno,True);
        B_AF_ACUM_SIAC.Size:=1;
                B_AF_ACUM_SIAC.Caption:='Afecta Acum. SIAC';
      CVE_MONEDA_BASE :=CreaCampo('CVE_MONEDA_BASE',ftFloat,tsNinguno,tsNinguno,True);
                CVE_MONEDA_BASE.Caption:='Clave de Moneda Base ';
      CVE_PER_JURIDICA :=CreaCampo('CVE_PER_JURIDICA',ftString,tsNinguno,tsNinguno,True);
       With CVE_PER_JURIDICA do
       begin Size:=2;
            UseCombo:=True;
            ComboLista.Add('Indistinto');     ComboDatos.Add('IN');
            ComboLista.Add('Persona Física'); ComboDatos.Add('PF');
            ComboLista.Add('Persona Moral');  ComboDatos.Add('PM');
       end;
                CVE_PER_JURIDICA.Caption:='Clave de Per Juridica ';
      CVE_TASA_REF :=CreaCampo('CVE_TASA_REF',ftString,tsNinguno,tsNinguno,True);
        CVE_TASA_REF .Size:=8;
                CVE_TASA_REF.Caption:='Clave de Tasa Ref ';
      CVE_OPE_CARGO :=CreaCampo('CVE_OPE_CARGO',ftString,tsNinguno,tsNinguno,True);
        CVE_OPE_CARGO .Size:=6;
                CVE_OPE_CARGO.Caption:='Clave Operación de Cargo';
      CVE_OPE_ABONO :=CreaCampo('CVE_OPE_ABONO',ftString,tsNinguno,tsNinguno,True);
        CVE_OPE_ABONO .Size:=6;
                CVE_OPE_ABONO.Caption:='Clave Operación de Cargo';
       CVE_TIPO_OPER :=CreaCampo('CVE_TIPO_OPER',ftString,tsNinguno,tsNinguno,True);
       With CVE_TIPO_OPER do
       begin Size:=2;
            UseCombo:=True;
            ComboLista.Add('Leyenda');                ComboDatos.Add('LE');
            ComboLista.Add('Inversión/Crédito');      ComboDatos.Add('IC');
            ComboLista.Add('Mercado de Valores');     ComboDatos.Add('MV');
            ComboLista.Add('Movimiento de Efectivo'); ComboDatos.Add('EF');
       end;
                CVE_TIPO_OPER.Caption:='Clave de Tipo Operación ';
      CVE_TIPO_SECTOR :=CreaCampo('CVE_TIPO_SECTOR',ftString,tsNinguno,tsNinguno,True);
       With CVE_TIPO_SECTOR do
       begin Size:=2;
            UseCombo:=True;
            ComboLista.Add('Financiero');    ComboDatos.Add('03');
            ComboLista.Add('Privado');       ComboDatos.Add('01');
            ComboLista.Add('Público');       ComboDatos.Add('02');
            ComboLista.Add('Bancario');      ComboDatos.Add('04');
            ComboLista.Add('Gubernamental'); ComboDatos.Add('05');
       end;
                CVE_TIPO_SECTOR.Caption:='Clave de Tipo Sector ';
      CVE_TIPO_TASA :=CreaCampo('CVE_TIPO_TASA',ftString,tsNinguno,tsNinguno,True);
       With CVE_TIPO_TASA do
       begin Size:=4;
            UseCombo:=True;
            ComboLista.Add('Tasa Bruta');     ComboDatos.Add('TB');
            ComboLista.Add('Tasa Neta');      ComboDatos.Add('TN');
            ComboLista.Add('Tasa Real');      ComboDatos.Add('TR');
            ComboLista.Add('Sobretasa');      ComboDatos.Add('ST');
            ComboLista.Add('Indices Conoc.'); ComboDatos.Add('IC');

       end;
                CVE_TIPO_TASA.Caption:='Clave de Tipo Tasa ';
      DESC_C_ID_PRIM :=CreaCampo('DESC_C_ID_PRIM',ftString,tsNinguno,tsNinguno,True);
                DESC_C_ID_PRIM.Caption:='Descripción C Número de Prim ';
      DESC_C_ID_SEC :=CreaCampo('DESC_C_ID_SEC',ftString,tsNinguno,tsNinguno,True);
                DESC_C_ID_SEC.Caption:='Descripción C Número de Sec ';
      DESC_L_ID_PRIM :=CreaCampo('DESC_L_ID_PRIM',ftString,tsNinguno,tsNinguno,True);
                DESC_L_ID_PRIM.Caption:='Descripción L Número de Prim ';
      DESC_L_ID_SEC :=CreaCampo('DESC_L_ID_SEC',ftString,tsNinguno,tsNinguno,True);
                DESC_L_ID_SEC.Caption:='Descripción L Número de Sec ';
      DIAS_PAGO :=CreaCampo('DIAS_PAGO',ftFloat,tsNinguno,tsNinguno,True);
                DIAS_PAGO.Caption:='Dias Pago ';
      DIAS_REVIS_TASA :=CreaCampo('DIAS_REVIS_TASA',ftFloat,tsNinguno,tsNinguno,True);
                DIAS_REVIS_TASA.Caption:='Dias Revis Tasa ';
      TIPO_ANUALIZA :=CreaCampo('TIPO_ANUALIZA',ftFloat,tsNinguno,tsNinguno,True);
       With TIPO_ANUALIZA do
       begin
            UseCombo:=True;
            ComboLista.Add('Comercial/Comercial'); ComboDatos.Add('2');
            ComboLista.Add('Real/Real');           ComboDatos.Add('1');
            ComboLista.Add('Real/Comercial');      ComboDatos.Add('3');
       end;
                TIPO_ANUALIZA.Caption:='Tipo Anualiza ';
      TIPO_CALC_INT :=CreaCampo('TIPO_CALC_INT',ftString,tsNinguno,tsNinguno,True);
        TIPO_CALC_INT .Size:=4;
                TIPO_CALC_INT.Caption:='Tipo Calc Int ';
      FKeyFields.Add('CVE_INSTRUMENTO');

      TableName := 'TESO_INSTR_OPER';
      UseQuery := True;
      HelpFile := 'IntTesInsOp.Hlp';
      ShowMenuReporte:=True;

      // Definición de campos requeridos

      CVE_TASA_REF.IsRequiered := False;

      // Creación del objeto moneda

      Moneda := TMoneda.Create(Self);
      Moneda.MasterSource := Self;
      Moneda.Cve_Moneda.MasterField:='CVE_MONEDA_BASE';

      // Creación del objeto tasa_indic_finan

      Tasa := TTasIndFin.Create(Self);
      Tasa.MasterSource := Self;
      Tasa.Cve_Tasa_Indicad.MasterField:='CVE_TASA_REF';

      // Creación del objeto clave de operación para la clave de cargo

      CveOperCargo:=TTesoOpera.Create(Self);
      CveOperCargo.MasterSource:=Self;
      CveOperCargo.CVE_OPERACION.MasterField:='CVE_OPE_CARGO';

      // Creación del objeto clave de operación para la clave de abono

      CveOperAbono:=TTesoOpera.Create(Self);
      CveOperAbono.MasterSource:=Self;
      CveOperAbono.CVE_OPERACION.MasterField:='CVE_OPE_ABONO';

end;

Destructor TTesInsOp.Destroy;
begin
   if Moneda       <> nil then Moneda.Free;
   if Tasa         <> nil then Tasa.Free;
   if CveOperCargo <> nil then CveOperCargo.Free;
   if CveOperAbono <> nil then CveOperAbono.Free;
inherited;
end;


function TTesInsOp.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWTesoInstrOp;
begin
   W:=TWTesoInstrOp.Create(Self);
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


Function TTesInsOp.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ITeInOp.it','S');
      Try if Active then begin T.Param(0,CVE_INSTRUMENTO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

//******************************************************************************

function TTesInsOp.Reporte:Boolean;
begin //Execute_Reporte();
end;

//******************************************************************************

function    TTesInsOp.ValidaInstrumento(VLInstrumento: String; VLCveMonedaBase: Integer): Boolean;
begin
     if FindKey([VLInstrumento]) then
     begin
          if ((CVE_MONEDA_BASE.AsInteger = VLCveMonedaBase)  AND  (CVE_TIPO_OPER.AsString='EF')) then
              ValidaInstrumento := True
          else
              ValidaInstrumento := False;
          //end if
     end
     else
         ValidaInstrumento := False;
     //end if
end;


(***********************************************FORMA TESO_INSTR_OPER********************)
(*                                                                              *)
(*  FORMA DE TESO_INSTR_OPER                                                            *)
(*                                                                              *)
(***********************************************FORMA TESO_INSTR_OPER********************)

procedure TWTesoInstrOp.FormShow(Sender: TObject);
begin
   Objeto.CVE_INSTRUMENTO.Control := edCVE_INSTRUMENTO;
   Objeto.B_AFEC_CHEQRA.Control   := chB_AFEC_CHEQRA;
   Objeto.B_RETIENE_ISR.Control   := chB_RETIENE_ISR;
   Objeto.B_VENMTO_AUT.Control    := chB_VENMTO_AUT;
   Objeto.B_EMITE_DOCTO.Control   := chB_EMITE_DOCTO;
   Objeto.B_AF_ACUM_SIAC.Control  := chB_AF_ACUM_SIAC;
   Objeto.CVE_MONEDA_BASE.Control := edCVE_MONEDA_BASE;
   Objeto.CVE_PER_JURIDICA.Control:= cbCVE_PER_JURIDICA;
   Objeto.CVE_TASA_REF.Control    := edCVE_TASA_REF;
   Objeto.CVE_TIPO_OPER.Control   := cbCVE_TIPO_OPER;
   Objeto.CVE_TIPO_SECTOR.Control := cbCVE_TIPO_SECTOR;
   Objeto.CVE_TIPO_TASA.Control   := cbCVE_TIPO_TASA;
   Objeto.CVE_OPE_CARGO.Control   := edCVE_OPE_CARGO;
   Objeto.CVE_OPE_ABONO.Control   := edCVE_OPE_ABONO;
   Objeto.DESC_C_ID_PRIM.Control  := edDESC_C_ID_PRIM;
   Objeto.DESC_C_ID_SEC.Control   := edDESC_C_ID_SEC;
   Objeto.DESC_L_ID_PRIM.Control  := edDESC_L_ID_PRIM;
   Objeto.DESC_L_ID_SEC.Control   := edDESC_L_ID_SEC;
   Objeto.DIAS_PAGO.Control       := edDIAS_PAGO;
   Objeto.DIAS_REVIS_TASA.Control := edDIAS_REVIS_TASA;
   Objeto.TIPO_ANUALIZA.Control   := cbTIPO_ANUALIZA;
   Objeto.TIPO_CALC_INT.Control   := edTIPO_CALC_INT;

   Objeto.CveOperCargo.DESC_L_ID_PRIM.Control :=edDescCveOpeCargo;
   Objeto.CveOperCargo.MasterSourceEditControl:=sbCveOpeCargo;

   Objeto.CveOperAbono.DESC_L_ID_PRIM.Control :=edDescCveOpeAbono;
   Objeto.CveOperAbono.MasterSourceEditControl:=sbCveOpeAbono;

   Objeto.Moneda.Desc_Moneda.Control    :=edDescripcionMoneda;
   Objeto.Moneda.MasterSourceEditControl:=sbCveMoneda;

   Objeto.Tasa.DESC_TASA_INDIC.Control:=edDescripcionTasa;
   Objeto.Tasa.MasterSourceEditControl:=sbCveMoneda;
end;

procedure TWTesoInstrOp.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_INSTRUMENTO.Control := nil;
      Objeto.B_AFEC_CHEQRA.Control   := nil;
      Objeto.B_RETIENE_ISR.Control   := nil;
      Objeto.B_VENMTO_AUT.Control    := nil;
      Objeto.B_EMITE_DOCTO.Control   := nil;
      Objeto.B_AF_ACUM_SIAC.Control  := nil;
      Objeto.CVE_MONEDA_BASE.Control := nil;
      Objeto.CVE_PER_JURIDICA.Control:= nil;
      Objeto.CVE_TASA_REF.Control    := nil;
      Objeto.CVE_TIPO_OPER.Control   := nil;
      Objeto.CVE_TIPO_SECTOR.Control := nil;
      Objeto.CVE_TIPO_TASA.Control   := nil;
      Objeto.CVE_OPE_CARGO.Control   := nil;
      Objeto.CVE_OPE_ABONO.Control   := nil;
      Objeto.DESC_C_ID_PRIM.Control  := nil;
      Objeto.DESC_C_ID_SEC.Control   := nil;
      Objeto.DESC_L_ID_PRIM.Control  := nil;
      Objeto.DESC_L_ID_SEC.Control   := nil;
      Objeto.DIAS_PAGO.Control       := nil;
      Objeto.DIAS_REVIS_TASA.Control := nil;
      Objeto.TIPO_ANUALIZA.Control   := nil;
      Objeto.TIPO_CALC_INT.Control   := nil;

      Objeto.CveOperCargo.DESC_L_ID_PRIM.Control :=nil;
      Objeto.CveOperCargo.MasterSourceEditControl:=nil;

      Objeto.CveOperAbono.DESC_L_ID_PRIM.Control :=nil;
      Objeto.CveOperAbono.MasterSourceEditControl:=nil;

      Objeto.Moneda.Desc_Moneda.Control    :=nil;
      Objeto.Moneda.MasterSourceEditControl:=nil;

      Objeto.Tasa.DESC_TASA_INDIC.Control:=nil;
      Objeto.Tasa.MasterSourceEditControl:=nil;

   //Objeto
end;

procedure TWTesoInstrOp.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWTesoInstrOp.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
      edCVE_INSTRUMENTO.SetFocus;
      cbCVE_TIPO_OPER.ItemIndex   := 0;
      cbCVE_TIPO_TASA.ItemIndex   := 0;
      cbCVE_TIPO_SECTOR.ItemIndex := 0;
      cbCVE_PER_JURIDICA.ItemIndex:= 0;
      cbTIPO_ANUALIZA.ItemIndex   := 0;
      Objeto.DIAS_PAGO.AsInteger  := 0;
      Objeto.DIAS_REVIS_TASA.AsInteger := 0;
      Objeto.CVE_OPE_CARGO.AsString := 'NOAPLI';
      Objeto.CVE_OPE_ABONO.AsString := 'NOAPLI';
end;

procedure TWTesoInstrOp.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWTesoInstrOp.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


procedure TWTesoInstrOp.sbCveMonedaClick(Sender: TObject);
begin
  Objeto.Moneda.Busca;
end;

procedure TWTesoInstrOp.sbCveTasaClick(Sender: TObject);
begin
  Objeto.Tasa.BuscaWhereString:='(TIPO_TASA_INDIC = ''MK'')';
  Objeto.Tasa.Busca;
end;

procedure TWTesoInstrOp.Button1Click(Sender: TObject);
begin
  edCVE_TASA_REF.Clear;
  Objeto.Tasa.Active := False;
end;

procedure TWTesoInstrOp.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   ValidaDiasRevis;
   if not ValidaClavesOpe then
   begin
      Realizado := False;
   end;
end;

function TWTesoInstrOp.ValidaDiasRevis : Boolean;
begin
  If (StrToInt(edDIAS_PAGO.Text)       <> 0) and
     (StrToInt(edDIAS_REVIS_TASA.Text) <> 0) and
     (StrToInt(edDIAS_PAGO.Text) mod StrToInt(edDIAS_REVIS_TASA.Text) <> 0) then
  begin
    Showmessage('Los días de revisión no son múltiplo de los días de pago');
  end;
end;

function TWTesoInstrOp.ValidaClavesOpe : Boolean;
begin
   ValidaClavesOpe := True;
   if (Objeto.CVE_OPE_CARGO.AsString <> 'NOAPLI') AND
      (Objeto.CVE_OPE_ABONO.AsString <> 'NOAPLI') AND
      (Objeto.CVE_OPE_CARGO.AsString = Objeto.CVE_OPE_ABONO.AsString) then
   begin
      ValidaClavesOpe := False;
      Showmessage ('La clave de CARGO Y ABONO no pueden ser iguales.  Verifique');
   end;
end;

procedure TWTesoInstrOp.edDESC_C_ID_PRIMExit(Sender: TObject);
begin
  if (edDESC_L_ID_PRIM.Text = '') then
  begin
    edDESC_L_ID_PRIM.Text := edDESC_C_ID_PRIM.Text;
  end;
end;

procedure TWTesoInstrOp.edDESC_C_ID_SECExit(Sender: TObject);
begin
  if (edDESC_L_ID_SEC.Text = '') then
  begin
     edDESC_L_ID_SEC.Text := edDESC_C_ID_SEC.Text;
  end;
end;

procedure TWTesoInstrOp.sbCveOpeCargoClick(Sender: TObject);
begin
   Objeto.CveOperCargo.Busca;
   ValidaClavesOpe;
end;

procedure TWTesoInstrOp.sbCveOpeAbonoClick(Sender: TObject);
begin
  Objeto.CveOperAbono.Busca;
  ValidaClavesOpe;
end;

end.
