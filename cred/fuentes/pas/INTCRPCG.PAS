// Sistema         : Clase de Alta Automática de Periodos
// Fecha de Inicio : 24/01/2000
// Función forma   : Clase de Alta Automática de Periodos
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Benjamin Hernandez Delsordo
// Comentarios     :
Unit IntCrPCG;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit;

type
  TCrPCG = class;

  TWCrPCG = class(TForm)
    InterForma1 : TInterForma;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edCredito: TEdit;
    edTasa: TEdit;
    edNPeriodos: TEdit;
    edMonto: TEdit;
    edDiaPago1: TEdit;
    edDiaPago2: TEdit;
    edFechaInicial: TEdit;
    Button1: TButton;
    bTasa: TButton;
    edVALOR_TASA: TInterEdit;
    Label8: TLabel;
    Label9: TLabel;
    edSobreTasa: TEdit;
    Label10: TLabel;
    edVALOR_TASAN: TInterEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure bTasaClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
      Objeto : TCrPCG;
  end;

  TPeriodoABCDGen = class(TInterFrame)
  public
    NumPer        : integer;
    Dias          : integer;
    FVencimiento  : TDateTime;
    FProgPago     : TDateTime;
    SaldoI  : double;
    Capital : double;
    Interes : double;
  end;

  TCrPCG= class(TInterFrame)
  private
    PagoF : double;
    procedure CalculaPagoFijo;
    procedure ConstruyeTabladeCapital;
    procedure ConstruyeTabladeInteres;
    procedure ActualizaCredito;
  protected
  public
    { Public declarations }
    Credito          :TInterCampo;
    Tasa             :TInterCampo;
    SobreTasa        :TInterCampo;
    ValorTasa        :TInterCampo;
    ValorTasaN       :TInterCampo;
    NPeriodos        :TInterCampo;
    Monto            :TInterCampo;
    DiaPago1         :TInterCampo;
    DiaPago2         :TInterCampo;
    FechaInicial     :TInterCampo;
    FechaFinal       :TInterCampo;
    PlazoCred        :TInterCampo;
    R                :double;
    I                :double;
    I24              :double;
    LPeriodos        :TList;
    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    procedure   GenerarPeriodos;
    procedure   CalcValorTasa(CveTasa : string; FechaVal : TDateTime);
    procedure   CalcValorTasaN;
    procedure   CalcI;
    procedure   CalcI24;
    procedure   CalcR;
    procedure   CalcPeriodos;
    procedure   InsertPeriodos;
  published
  end;

implementation

uses
  unTTasa, UnCrPack, IntCrInt, IntTCrPc;

{$R *.DFM}


procedure TCrPCG.ActualizaCredito;
begin

end;

procedure TCrPCG.CalcI;
begin
  I := ValorTasaN.AsFloat / 100;
  CalcI24;
end;

procedure TCrPCG.CalcI24;
begin
  I24 := I / 24;
end;

procedure TCrPCG.CalcPeriodos;
var
  vlSaldo,
  vlInt,
  vlCap,
  vlTotal : double;
  Periodo : TPeriodoABCDGen;
  Cont1   : integer;
  Fecha1,
  Fecha2   : TDate;
  Paquete  : TCrPack;

  function CalcSiguienteFecha(pFecha : TDate) : TDate;
  var
    Year, Month, Day : word;
    Day1, Month1, Year1 : word;
  begin
    DecodeDate(pFecha, Year, Month, Day);
    if (Day >= 1) and (Day <= 15) then
    begin
      Day1   := 24;
      Month1 := Month;
      Year1  := Year;
    end
    else
    begin
      Day1   := 9;
      Month1 := Month + 1;
      Year1  := Year;
      if Month1 = 13 then
      begin
        Month1 := 1;
        Year1  := Year + 1;
      end;
    end;
    Result := EncodeDate(Year1, Month1, Day1);
  end;

begin
  Paquete := TCrPack.Create(Self); Paquete.Apli := Apli;
  LPeriodos.Clear;
  vlSaldo := Monto.AsFloat;
  Fecha1 := Trunc(FechaInicial.AsDateTime);

  for Cont1 := 0 to NPeriodos.AsInteger - 1 do
  begin
    vlInt   := vlSaldo * I24;
    vlCap   := R - vlInt;
    vlSaldo := vlSaldo - PreDbltoDbl(vlCap,2);
    Fecha2 := CalcSiguienteFecha(Fecha1);

    Periodo := TPeriodoABCDGen.Create(Self);
    Periodo.NumPer := Cont1 + 1;
    Periodo.SaldoI  := PreDbltoDbl(vlSaldo,2);
    if Cont1 = NPeriodos.AsInteger - 1 then
    begin
      Periodo.Capital := PreDbltoDbl(vlSaldo + vlCap, 2);
    end
    else
    begin
      Periodo.Capital := PreDbltoDbl(vlCap,2);
    end;
    Periodo.Interes := PreDbltoDbl(vlInt,2);
    Periodo.FVencimiento := Fecha2;
    Periodo.FProgPago := Paquete.EsHabil(Fecha2, 1, 'PAMEXI');
    Periodo.Dias := Trunc(Fecha2 - Fecha1);
    LPeriodos.Add(Periodo);
    Fecha1 := Fecha2;
  end;
  FechaFinal.AsDateTime := Fecha1;
  PlazoCred.AsInteger   := FechaFinal.AsInteger - FechaInicial.AsInteger;
  Paquete.Free; Paquete := nil;
end;

procedure TCrPCG.CalcR;
var
  T1 : double;
begin
  CalcI;
  T1 := 1 - exp(ln(1 + I24) * -1 * NPeriodos.AsInteger);
  T1 := T1 / I24;
  T1 := Monto.AsFloat / T1;
  R  := T1;
end;

procedure TCrPCG.CalculaPagoFijo;
begin

end;

procedure TCrPCG.CalcValorTasa(CveTasa: string; FechaVal : TDateTime);
var
  TasaNum : TTasa;
  Adelante : Boolean;
begin
  Adelante := True;
  TasaNum := TTasa.Create(Self);
  try
    TasaNum.Apli := Apli;
    TasaNum.Funcion := 2;
    TasaNum.ClaveTasaInd := CveTasa;
    TasaNum.FechaEvaluacion := Trunc(FechaVal);
    TasaNum.ValoresARecorrer := 0;
    TasaNum.Direccion := Adelante;
    if (TasaNum.ValorActNFechas = 0) then
    begin
      ValorTasa.AsFloat := TasaNum.ValorVigente;
      CalcValorTasaN;
    end;
  finally
    TasaNum.Free; TasaNum := nil;
  end;
end;


procedure TCrPCG.CalcValorTasaN;
begin
  ValorTasaN.AsFloat := ValorTasa.AsFloat + SobreTasa.AsFloat;
end;

procedure TCrPCG.ConstruyeTabladeCapital;
begin

end;

procedure TCrPCG.ConstruyeTabladeInteres;
begin

end;

constructor TCrPCG.Create( AOwner : TComponent );
begin
  inherited;
  Credito      := CreaCampo('Credito',ftInteger,tsNinguno,tsNinguno,False);
  Tasa         := CreaCampo('Tasa',ftString,tsNinguno,tsNinguno,False);
  ValorTasa    := CreaCampo('ValorTasa',ftFloat,tsNinguno,tsNinguno,False);
  ValorTasaN   := CreaCampo('ValorTasaN',ftFloat,tsNinguno,tsNinguno,False);
  SobreTasa    := CreaCampo('Tasa',ftFloat,tsNinguno,tsNinguno,False);
  NPeriodos    := CreaCampo('NPeriodos',ftInteger,tsNinguno,tsNinguno,False);
  Monto        := CreaCampo('Monto',ftFloat,tsNinguno,tsNinguno,False);
  DiaPago1     := CreaCampo('DiaPago1',ftInteger,tsNinguno,tsNinguno,False);
  DiaPago2     := CreaCampo('DiaPago2',ftInteger,tsNinguno,tsNinguno,False);
  FechaInicial := CreaCampo('FechaInicial',ftDate,tsNinguno,tsNinguno,False);
  FechaFinal   := CreaCampo('FechaFinal',ftDate,tsNinguno,tsNinguno,False);
  PlazoCred    := CreaCampo('PlazoCred',ftInteger,tsNinguno,tsNinguno,False);
  LPeriodos    := TList.Create;
  StpName  := ' ';
  IsCheckSecu := False;
  UseQuery := False;
  HelpFile := 'IntCrPCG.Hlp';
  ShowMenuReporte:=True;
end;

destructor TCrPCG.Destroy;
begin
  LPeriodos.Free;
  inherited;
end;


procedure TCrPCG.GenerarPeriodos;
begin
  Tasa.AsString := 'CT28';
  SobreTasa.AsFloat := 6;
  NPeriodos.AsInteger := 72;
  DiaPago1.AsInteger := 9;
  DiaPago2.AsInteger := 27;
  CalcValorTasa(Tasa.AsString, Apli.DameFechaEmpresa);
  CalcR;
  CalcPeriodos;
  InsertPeriodos;
end;


procedure TCrPCG.InsertPeriodos;
var
  vSituacion : string;
  vNumPer : integer;
  vCapital : TCrPc;
  vInteres : TCrInt;
  vPer : TPeriodoABCDGen;
begin
  vCapital := TCrPc.Create(Self);
  vInteres := TCrInt.Create(Self);
  try
    vCapital.GetParams(Self);
    vInteres.GetParams(Self);
    vSituacion := 'AC';
    for vNumPer := 0 to (LPeriodos.Count - 1) do
    begin
      vPer := TPeriodoABCDGen(LPeriodos.Items[vNumPer]);
      vCapital.Append;
      vCapital.ID_CREDITO.AsInteger     := Credito.AsInteger;
      vCapital.NUM_PERIODO.AsInteger    := vPer.NumPer;
      vCapital.B_COB_AUT.AsString       := 'F';
      vCapital.F_PAGO.IsNull            := True;
      vCapital.F_PROG_PAGO.AsDateTime   := vPer.FProgPago;
      vCapital.F_VENCIMIENTO.AsDateTime := vPer.FVencimiento;
      vCapital.FACT_CAPITALIZA.AsFloat  := 0;
      vCapital.IMP_BENEF_BCO.AsFloat    := 0;
      vCapital.IMP_BENEF_GOB.AsFloat    := 0;
      vCapital.IMP_CAPITAL.AsFloat      := vPer.Capital;
      vCapital.IMP_CAPITALIZA.AsFloat   := 0;
      vCapital.IMP_PAGADO.AsFloat       := 0;
      vCapital.IMP_VENCIDO.AsFloat      := 0;
      vCapital.PLAZO.AsInteger          := vPer.Dias;
      vCapital.SIT_CAPITAL.AsString     := vSituacion;
      vCapital.TASA_APLICADA.AsFloat    := 0;
      vCapital.TIPO_CAPITALIZA.AsInteger:= 0;
      vCapital.IMP_PAGO_PARCIAL.IsNull  := True;
      vCapital.Post;

      vInteres.Append;
      vInteres.ID_CREDITO.AsInteger      := Credito.AsInteger;
      vInteres.NUM_PERIODO.AsInteger     := vPer.NumPer;
      vInteres.B_COB_AUT.AsString        := 'F';
      vInteres.F_PAGO.IsNull             := True;
      vInteres.F_PROG_PAGO.AsDateTime    := vPer.FProgPago;
      vInteres.F_VENCIMIENTO.AsDateTime  := vPer.FVencimiento;
      vInteres.FACT_CAPITALIZA.AsFloat   := 0;
      vInteres.IMP_BENEF_BCO.AsFloat     := 0;
      vInteres.IMP_BENEF_GOB.AsFloat     := 0;
      vInteres.IMP_CAPITALIZA.AsFloat    := 0;
      vInteres.IMP_INTERES_AYER.AsFloat  := 0;
      vInteres.IMP_INTERES_DIA.AsFloat   := 0;
      vInteres.IMP_INTERES_ORIG.AsFloat  := 0;
      vInteres.IMP_INTERES_PER.AsFloat   := 0;
      vInteres.IMP_INTERES_PROY.AsFloat  := 0;
      vInteres.IMP_IVA.AsFloat           := 0;
      vInteres.IMP_IVA_PAGADO.AsFloat    := 0;
      vInteres.IMP_IVA_PROYEC.AsFloat    := 0;
      vInteres.IMP_PAGADO.AsFloat        := 0;
      vInteres.IMP_PAGO_FIJO.AsFloat     := 0;
      vInteres.IMP_VENCIDO.AsFloat       := 0;
      vInteres.PLAZO.AsInteger           := vPer.Dias;
      vInteres.SIT_INTERES.AsString      := vSituacion;
      if (vPer.NumPer = 1) then
      begin
        vInteres.TASA_APLICADA.AsFloat   := ValorTasaN.AsFloat;
      end
      else
      begin
        vInteres.TASA_APLICADA.AsFloat   := 0;
      end;
      vInteres.TIPO_CAPITALIZA.AsInteger := 0;
      vInteres.IMP_PAGO_PARCIAL.AsFloat  := 0;
      vInteres.Post;
      vSituacion := 'PA';
    end;
  finally
    vInteres.Free; vInteres := nil;
    vCapital.Free; vCapital := nil;
  end;
end;


function TCrPCG.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrPCG;
begin
   W:=TWCrPCG.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftConsulta; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

(***********************************************FORMA CrPCG********************)
(*                                                                              *)
(*  FORMA DE CrPCG                                                            *)
(*                                                                              *)
(***********************************************FORMA CrPCG********************)

procedure TWCrPCG.FormShow(Sender: TObject);
begin
  Objeto.Credito.Control := edCredito;
  Objeto.Tasa.Control := edTasa;
  Objeto.SobreTasa.Control := edSobreTasa;
  Objeto.ValorTasa.Control := edVALOR_TASA;
  Objeto.ValorTasaN.Control := edVALOR_TASAN;
  Objeto.NPeriodos.Control := edNPeriodos;
  Objeto.Monto.Control := edMonto;
  Objeto.DiaPago1.Control := edDiaPago1;
  Objeto.DiaPago2.Control := edDiaPago2;
  Objeto.FechaInicial.Control := edFechaInicial;
end;

procedure TWCrPCG.FormDestroy(Sender: TObject);
begin
  Objeto.Credito.Control := nil;
  Objeto.Tasa.Control := nil;
  Objeto.SobreTasa.Control := nil;
  Objeto.NPeriodos.Control := nil;
  Objeto.Monto.Control := nil;
  Objeto.DiaPago1.Control := nil;
  Objeto.DiaPago2.Control := nil;
  Objeto.FechaInicial.Control := nil;
  Objeto.ValorTasa.Control := nil;
  Objeto.ValorTasaN.Control := nil;
end;

procedure TWCrPCG.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TWCrPCG.bTasaClick(Sender: TObject);
begin
  Objeto.Credito.AsInteger := 13500;
  Objeto.Monto.AsFloat := 125000;
  Objeto.FechaInicial.AsDateTime := Objeto.Apli.DameFechaEmpresa;
  Objeto.GenerarPeriodos;
end;

end.
