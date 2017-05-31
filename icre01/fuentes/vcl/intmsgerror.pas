Unit IntMsgError;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls,InterFun, ComCtrls,
InterEdit, InterFor,InterApl, IntLinkit, UnConDi, IntInter, UnSql2;

const
  cAfirma    ='S';
  cNegativo  ='F';
  cTermina   ='T';
  
Type
  TWMsgError=Class(TForm)
    Panel6: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    edFuente: TEdit;
    edPortafolio: TEdit;
    edSigno: TEdit;
    edActivoFinanciero: TEdit;
    edActivoBasico: TEdit;
    edTasaFija1: TEdit;
    edTasaFija2: TEdit;
    edPlazoCupon: TEdit;
    edFactorAmoritizacion: TEdit;
    edTipoCredito: TEdit;
    edPortafolioCol: TEdit;
    edFechaPosicion: TEdit;
    edFechaInicio: TEdit;
    edFechaVencimiento: TEdit;
    edFechaEmision: TEdit;
    edImporte: TEdit;
    edFactCapitalizacion: TEdit;
    edTipoCambio: TEdit;
    edPorceQuebranto: TEdit;
    edValor: TEdit;
    edOtrosAccesorios: TEdit;
    edTasaCupon: TEdit;
    edNoCupones: TEdit;
    edCuponEmpAmort: TEdit;
    edNumAmortizaciones: TEdit;
    edTipoGarantias: TEdit;
    edDiaCorte: TEdit;
    Panel5: TPanel;
    Panel3: TPanel;
    Label29: TLabel;
    edMensaje: TEdit;
    Panel4: TPanel;
    Label28: TLabel;
    btSalir: TBitBtn;
    sbAceptaAdi: TBitBtn;
    Panel7: TPanel;
    bbCancel: TBitBtn;
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure InterForma1Aceptar(Sender: TObject; var Realizado: Boolean);
//    procedure InterForma1DespuesModificar(Sender: TObject);
//    procedure InterForma1Cancelar(Sender: TObject; var Realizado: Boolean);
    procedure btSalirClick(Sender: TObject);
    procedure sbAceptaAdiClick(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
//    procedure GuardaNuevo;
    private
    { Private declarations }
    public
    { Public declarations }
       NombreFuente          : WideString;
       NombrePortafolio      : WideString;
       Signo                 : WideString;
       NombreActivoFinanciero: WideString;
       NombreActivoBasico    : WideString;
       TasaFija1             : WideString;
       TasaFija2             : WideString;
       PlazodeCupon          : WideString;
       FactorAmortizacion    : WideString;
       TipoCredito           : WideString;
       PortafolioCol         : WideString;
       FechaPosicionOperacion: TDateTime;
       FechaInicio           : TDateTime;
       FechaVencimiento      : TDateTime;
       FechaDeEmision        : TDateTime;
       Importe               : Double;
       FactorCapitalizacion  : Double;
       TipoCambio            : Double;
       PorcentajeQuebranto   : Double;
       ValorCol              : Double;
       OtrosAccesorios       : Double;
       TasaCuponActual       : Double;
       NoDeCupones           : Smallint;
       CuponEmpiezaAmortizar : Smallint;
       NumeroAmortizaciones  : Smallint;
       TipoGarantias         : Smallint;
       DiaCorte              : Smallint;
       Error                 : String;
       Resultado             : TInterCampo;
end;

procedure MuestraMsgError(
       pNombreFuente          : WideString;
       pNombrePortafolio      : WideString;
       pSigno                 : WideString;
       pNombreActivoFinanciero: WideString;
       pNombreActivoBasico    : WideString;
       pTasaFija1             : WideString;
       pTasaFija2             : WideString;
       pPlazodeCupon          : WideString;
       pFactorAmortizacion    : WideString;
       pTipoCredito           : WideString;
       pPortafolioCol         : WideString;
       pFechaPosicionOperacion: TDateTime;
       pFechaInicio           : TDateTime;
       pFechaVencimiento      : TDateTime;
       pFechaDeEmision        : TDateTime;
       pImporte               : Double;
       pFactorCapitalizacion  : Double;
       pTipoCambio            : Double;
       pPorcentajeQuebranto   : Double;
       pValorCol              : Double;
       pOtrosAccesorios       : Double;
       pTasaCuponActual       : Double;
       pNoDeCupones           : Smallint;
       pCuponEmpiezaAmortizar : Smallint;
       pNumeroAmortizaciones  : Smallint;
       pTipoGarantias         : Smallint;
       pDiaCorte              : Smallint;
       pError                 : String;
       pResultado             : TInterCampo);

implementation

{$R *.DFM}

procedure MuestraMsgError(
       pNombreFuente          : WideString;
       pNombrePortafolio      : WideString;
       pSigno                 : WideString;
       pNombreActivoFinanciero: WideString;
       pNombreActivoBasico    : WideString;
       pTasaFija1             : WideString;
       pTasaFija2             : WideString;
       pPlazodeCupon          : WideString;
       pFactorAmortizacion    : WideString;
       pTipoCredito           : WideString;
       pPortafolioCol         : WideString;
       pFechaPosicionOperacion: TDateTime;
       pFechaInicio           : TDateTime;
       pFechaVencimiento      : TDateTime;
       pFechaDeEmision        : TDateTime;
       pImporte               : Double;
       pFactorCapitalizacion  : Double;
       pTipoCambio            : Double;
       pPorcentajeQuebranto   : Double;
       pValorCol              : Double;
       pOtrosAccesorios       : Double;
       pTasaCuponActual       : Double;
       pNoDeCupones           : Smallint;
       pCuponEmpiezaAmortizar : Smallint;
       pNumeroAmortizaciones  : Smallint;
       pTipoGarantias         : Smallint;
       pDiaCorte              : Smallint;
       pError                 : String;
       pResultado             : TInterCampo);

Var WMsgError : TWMsgError;
begin WMsgError := TWMsgError.Create(Nil);
      try
       WMsgError.NombreFuente          :=pNombreFuente;
       WMsgError.NombrePortafolio      :=pNombrePortafolio;
       WMsgError.Signo                 :=pSigno;
       WMsgError.NombreActivoFinanciero:=pNombreActivoFinanciero;
       WMsgError.NombreActivoBasico    :=pNombreActivoBasico;
       WMsgError.TasaFija1             :=pTasaFija1;
       WMsgError.TasaFija2             :=pTasaFija2;
       WMsgError.PlazodeCupon          :=pPlazodeCupon;
       WMsgError.FactorAmortizacion    :=pFactorAmortizacion;
       WMsgError.TipoCredito           :=pTipoCredito;
       WMsgError.PortafolioCol         :=pPortafolioCol;
       WMsgError.FechaPosicionOperacion:=pFechaPosicionOperacion;
       WMsgError.FechaInicio           :=pFechaInicio;
       WMsgError.FechaVencimiento      :=pFechaVencimiento;
       WMsgError.FechaDeEmision        :=pFechaDeEmision;
       WMsgError.Importe               :=pImporte;
       WMsgError.FactorCapitalizacion  :=pFactorCapitalizacion;
       WMsgError.TipoCambio            :=pTipoCambio;
       WMsgError.PorcentajeQuebranto   :=pPorcentajeQuebranto;
       WMsgError.ValorCol              :=pValorCol;
       WMsgError.OtrosAccesorios       :=pOtrosAccesorios;
       WMsgError.TasaCuponActual       :=pTasaCuponActual;
       WMsgError.NoDeCupones           :=pNoDeCupones;
       WMsgError.CuponEmpiezaAmortizar :=pCuponEmpiezaAmortizar;
       WMsgError.NumeroAmortizaciones  :=pNumeroAmortizaciones;
       WMsgError.TipoGarantias         :=pTipoGarantias;
       WMsgError.DiaCorte              :=pDiaCorte;
       WMsgError.Error                 :=pError;
       WMsgError.Resultado             :=pResultado;

//          WMsgError.TipoForma:=0;
          WMsgError.ShowModal;
      finally
         if WMsgError <> Nil then WMsgError.free;
      end;
end;

procedure TWMsgError.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWMsgError.FormShow(Sender: TObject);
begin    //
          edFuente.Text:=NombreFuente;
          edPortafolio.Text:=NombrePortafolio;
          edSigno.Text:=Signo;
          edActivoFinanciero.Text:=NombreActivoFinanciero;
          edActivoBasico.Text:=NombreActivoBasico;
          edTasaFija1.Text:=TasaFija1;
          edTasaFija2.Text:=TasaFija2;
          edPlazoCupon.Text:=PlazodeCupon;
          edFactorAmoritizacion.Text:=FactorAmortizacion;
          edTipoCredito.Text:=TipoCredito;
          edPortafolioCol.Text:=PortafolioCol;
          edFechaPosicion.Text:=DateToStr(FechaPosicionOperacion);
          edFechaInicio.Text:=DateToStr(FechaInicio);
          edFechaVencimiento.Text:=DateToStr(FechaVencimiento);
          edFechaEmision.Text:=DateToStr(FechaDeEmision);
          edImporte.Text:=FormatFloat('###,###,###0', Importe);
          edFactCapitalizacion.Text:=FormatFloat('###,###,###0', FactorCapitalizacion);
          edTipoCambio.Text:=FormatFloat('###,###,###0', TipoCambio);
          edPorceQuebranto.Text:=FormatFloat('###,###,###0', PorcentajeQuebranto);
          edValor.Text:=FormatFloat('###,###,###0', ValorCol);
          edOtrosAccesorios.Text:=FormatFloat('###,###,###0', OtrosAccesorios);
          edTasaCupon.Text:=FormatFloat('###,###,###0', TasaCuponActual);
          edNoCupones.Text:=FormatFloat('###,###,###0', NoDeCupones);
          edCuponEmpAmort.Text:=FormatFloat('###,###,###0', CuponEmpiezaAmortizar);
          edNumAmortizaciones.Text:=FormatFloat('###,###,###0', NumeroAmortizaciones);
          edTipoGarantias.Text:=FormatFloat('###,###,###0', TipoGarantias);
          edDiaCorte.Text:=FormatFloat('###,###,###0', DiaCorte);
          edMensaje.Text:=Error;
end;

procedure TWMsgError.FormDestroy(Sender: TObject);
begin //
end;

procedure TWMsgError.sbAceptaAdiClick(Sender: TObject);
begin Resultado.AsString:=cAfirma;
      Close;
end;

procedure TWMsgError.btSalirClick(Sender: TObject);
begin Resultado.AsString:=cNegativo;
      Close;
end;

procedure TWMsgError.InterForma1Aceptar(Sender: TObject;
  var Realizado: Boolean);
begin Resultado.AsString:=cAfirma;
      Realizado:=True;
      Close;
end;

procedure TWMsgError.bbCancelClick(Sender: TObject);
begin Resultado.AsString:=cTermina;
      Close;
end;

end.
