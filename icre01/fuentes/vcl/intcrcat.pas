// Sistema         : Clase de CrCAT
// Fecha de Inicio : 17/08/2006
// Función forma   : Clase de CrCAT
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Manuel Romero Ibarra
// Comentarios     : IntCrComisEv
Unit IntCrcat;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
IntParamCre, InterEdit, IntSGCtrl, IntLinkit, math,
IntCrProduct,   //Producto Credito
IntTasIndFin,
IntCrCatComi,
IntGenCre
;

Type
 TCrcat= class;

  TWCrcat=Class(TForm)
    InterForma1             : TInterForma;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    ieMontoAutor: TInterEdit;
    Label2: TLabel;
    edF_Inicio: TEdit;
    dtpF_Inicio: TInterDateTimePicker;
    edF_FIN: TEdit;
    dtpF_Fin: TInterDateTimePicker;
    lbLiqF_INICIO: TLabel;
    Label3: TLabel;
    rgAmorCap: TRadioGroup;
    rgAmorInt: TRadioGroup;
    Label5: TLabel;
    cbPeriodo: TComboBox;
    GroupBox1: TGroupBox;
    BitBtn2: TBitBtn;
    Label4: TLabel;
    Label9: TLabel;
    ieTasaAnual: TInterEdit;
    BitBtn1: TBitBtn;
    Label11: TLabel;
    Label12: TLabel;
    iedID_CONTRATO: TInterEdit;
    btCONTRATO: TBitBtn;
    edCVE_PRODUCTO: TEdit;
    edDESC_PRODUCTO: TEdit;
    lbID_CONTRATO: TLabel;
    Label13: TLabel;
    edID_CESION: TEdit;
    btID_CESION: TBitBtn;
    edCESION: TEdit;
    RadioGroup1: TRadioGroup;
    cbNivelados: TCheckBox;
    lbCVE_PRODUCTO_CRE: TLabel;
    edCVE_PRODUCTO_CRE: TEdit;
    btPRODUCTO: TBitBtn;
    Edit1: TEdit;
    lbCVE_COMISION: TLabel;
    edCVE_COMISION: TEdit;
    btCOMISION: TBitBtn;
    edDESC_COMISION: TEdit;
    ilCOMISION: TInterLinkit;
    ilPRODUCTO: TInterLinkit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    edTIT_BANCO: TEdit;
    edTIT_IMPORTE: TEdit;
    SGCtrl1: TSGCtrl;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Edit2: TEdit;
    BitBtn3: TBitBtn;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    SGCtrl2: TSGCtrl;
    BitBtn4: TBitBtn;
    Label7: TLabel;
    lbCVE_TASA_REFER: TLabel;
    edCVE_TASA_REFER: TEdit;
    btTASA_REFER: TBitBtn;
    edDESC_TASA_REFER: TEdit;
    ilTASA_REFER: TInterLinkit;
    lbOPERADOR_STASA: TLabel;
    cbOPERADOR_STASA: TEdit;
    Label8: TLabel;
    edSOBRETASA: TInterEdit;
    ieValorTasaRef: TInterEdit;
    TabSheet3: TTabSheet;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    Memo4: TMemo;
    Label10: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure rgAmorCapClick(Sender: TObject);
    procedure rgAmorIntClick(Sender: TObject);
    procedure cbPeriodoChange(Sender: TObject);
    procedure btPRODUCTOClick(Sender: TObject);
    procedure ilPRODUCTOEjecuta(Sender: TObject);
    procedure btTASA_REFERClick(Sender: TObject);
    procedure ilTASA_REFEREjecuta(Sender: TObject);
    procedure btCOMISIONClick(Sender: TObject);
    procedure ilCOMISIONEjecuta(Sender: TObject);
    procedure cbOPERADOR_STASAKeyPress(Sender: TObject; var Key: Char);
    procedure btTASA_REFERExit(Sender: TObject);
    procedure edSOBRETASAExit(Sender: TObject);
    procedure cbOPERADOR_STASAExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrcat;
    IndexArrayComis   : Integer;
    ArrayComisiones   : Array of String;
    SQLComis          : String;
    function  ValorTasa(pTasa: String): String;
    procedure ValorTasaCred;
    procedure ArmaQueryComis;
    procedure GeneraConsulta;
end;
 TCrcat= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        ProductoCre     : TInterCampo;
        MontoAutor      : TInterCampo;
        FechaIni        : TInterCampo;
        FechaFin        : TInterCampo;
        TipoAmort       : TInterCampo;
        TipoInteres     : TInterCampo;
        Periodo         : TInterCampo;
        BNivelado       : TInterCampo;
        TasaReferencia  : TInterCampo;
        OperadorSTasa   : TInterCampo;
        SobreTasa       : TInterCampo;
        TasaCredito     : TInterCampo;
        Comision        : TInterCampo;


        ParamCre        : TParamCre;
        Producto        : TCrProduct;
        TasaRefer       : TTasIndFin;
        Comisiones      : TCrCatComi;

        Memo1, Memo2, Memo3, Memo4 : TMemo;

        { Public declarations }
        Function    CalculaCATSimulador(MontoAutor, TasaAnualizada : Double;
                                        FechaIni, FechaFin : TDate;
                                        TipoAmort, TipoInteres, Periodo : Integer;
                                        ComisAuto, ComisDisp, ComisPer, ComisSeg : Double) : Double;
        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrcat.Create( AOwner : TComponent );
begin Inherited;


      ProductoCre :=CreaCampo('ProductoCre',ftString,tsNinguno,tsNinguno,False);
                ProductoCre.Caption:='ProductoCre';
      MontoAutor :=CreaCampo('MontoAutor',ftFloat,tsNinguno,tsNinguno,False);
                MontoAutor.Caption:='MontoAutor';
      FechaIni :=CreaCampo('FechaIni',ftDate,tsNinguno,tsNinguno,False);
                FechaIni.Caption:='FechaIni';
      FechaFin :=CreaCampo('FechaFin',ftDate,tsNinguno,tsNinguno,False);
                FechaFin.Caption:='FechaFin';
      TipoAmort :=CreaCampo('TipoAmort',ftInteger,tsNinguno,tsNinguno,False);
                TipoAmort.Caption:='TipoAmort';
      TipoInteres :=CreaCampo('TipoInteres',ftInteger,tsNinguno,tsNinguno,False);
                TipoInteres.Caption:='TipoInteres';
      Periodo :=CreaCampo('Periodo',ftInteger,tsNinguno,tsNinguno,False);
                Periodo.Caption:='Periodo';
      BNivelado :=CreaCampo('BNivelado',ftString,tsNinguno,tsNinguno,False);
                BNivelado.Caption:='BNivelado';
      TasaReferencia :=CreaCampo('TasaReferencia',ftFloat,tsNinguno,tsNinguno,False);
                TasaReferencia.Caption:='TasaReferencia';
      OperadorSTasa :=CreaCampo('OperadorSTasa',ftString,tsNinguno,tsNinguno,False);
                OperadorSTasa.Caption:='OperadorSTasa';
      SobreTasa :=CreaCampo('SobreTasa',ftFloat,tsNinguno,tsNinguno,False);
                SobreTasa.Caption:='SobreTasa';
      TasaCredito :=CreaCampo('TasaCredito',ftFloat,tsNinguno,tsNinguno,False);
                TasaCredito.Caption:='TasaCredito';
      Comision :=CreaCampo('Comision',ftFloat,tsNinguno,tsNinguno,False);
                Comision.Caption:='Comision';

      Producto :=  TCrProduct.Create(Self);
      Producto.MasterSource:=Self;
      Producto.FieldByName('CVE_PRODUCTO_CRE').MasterField:='ProductoCre';

      TasaRefer := TTasIndFin.Create(Self);
      TasaRefer.MasterSource:=Self;
      TasaRefer.FieldByName('CVE_TASA_INDICAD').MasterField:='TasaReferencia';

      Comisiones := TCrCatComi.Create(Self);
      Comisiones.MasterSource := self;


      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrcat.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrcat.Destroy;
begin inherited;
end;


function TCrcat.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrcat;
begin
   W:=TWCrcat.Create(Self);
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


Function TCrcat.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrcat.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

function TCrcat.Reporte:Boolean;
begin //Execute_Reporte();
end;

Function    TCrcat.CalculaCATSimulador(
                   MontoAutor, TasaAnualizada : Double;
                   FechaIni, FechaFin : TDate;
                   TipoAmort, TipoInteres, Periodo : Integer;
                   ComisAuto, ComisDisp, ComisPer, ComisSeg : Double) : Double;
var   MontosK           : Array of Double;
      MontosSI          : Array of Double;
      MontosI           : Array of Double;
      MontosC           : Array of Double;
      MontosCS          : Array of Double;
      VLPlazoTot        : Integer;
      VLPlazoPer        : Integer;
      VLPlazoPerAcum    : Integer;
      VLNoPer           : Integer;
      VLNoPerInd        : Integer;
      VLItera           : Integer;
      VLMontoCapitalPer : Double;
      VLSaldoInsoluto   : Double;
      VLMontoInteresPer : Double;
      VLTasaCAT         : Double;
begin
     //Determina el plazo
//     VLPlazoTot := StrToInt(FormatFloat('######',FechaFin  - FechaIni));
     VLPlazoTot := trunc(FechaFin  - FechaIni);
     ShowMessage(IntToStr(VLPlazoTot));
     //Determina Total de Periodos
     if Periodo = 0 then  //SEMANAL
        VLPlazoPer := 7;
     if Periodo = 1 then  //QUINCENAL
        VLPlazoPer := 15;
     if Periodo = 2 then  //MENSUAL
        VLPlazoPer := 30;
     if Periodo = 3 then  //BIMESTRAL
        VLPlazoPer := 60;
     if Periodo = 4 then  //TRIMESTRAL
        VLPlazoPer := 90;
     if Periodo = 5 then
        VLPlazoPer := 120;//CUATRIMESTRAL
     if Periodo = 6 then
        VLPlazoPer := 180;//SEMESTRAL
     if Periodo = 7 then
        VLPlazoPer := 360;//ANUAL
     //end if
     //Determina No. de periodos
     VLNoPer :=  Trunc(VLPlazoTot / VLPlazoPer);
     if (VLPlazoTot mod VLPlazoPer) > 0 then
         VLNoPer := VLNoPer + 1;
     //end if
     ShowMessage(IntToStr(VLNoPer));
     //Determina Periodos de CCCC   AAAA   PPPPP   IIII  TTTT  AAAA  LLLL
     SetLength(MontosK,VLPlazoTot+1);
     SetLength(MontosSI,VLPlazoTot+1);
     SetLength(MontosI,VLPlazoTot+1);
     SetLength(MontosC,VLPlazoTot+1);
     SetLength(MontosCS,VLPlazoTot+2);

     if TipoAmort = 0 then // periodica
     begin
          VLMontoCapitalPer := Trunc( MontoAutor / VLNoPer);
          VLSaldoInsoluto := MontoAutor;
          VLNoPerInd := 1;
          VLPlazoPerAcum := VLPlazoPer;
          for VLItera := 1 to VLPlazoTot do
          begin
               if ((VLItera = VLPlazoPerAcum) or (VLItera = VLPlazoTot)) then
               begin
                    VLPlazoPerAcum := VLPlazoPerAcum + VLPlazoPer;
                    if VLNoPer = VLNoPerInd then
                         MontosK[VLItera] := MontoAutor - (VLMontoCapitalPer * (VLNoPer - 1))
                    else
                        MontosK[VLItera] := VLMontoCapitalPer;
                    VLNoPerInd := VLNoPerInd + 1;
               end
               else
                   MontosK[VLItera] := 0;
               // end if;
               if VLItera = 1 then
                    MontosSI[VLItera] := VLSaldoInsoluto;
               //end if;
               VLSaldoInsoluto := VLSaldoInsoluto - MontosK[VLItera];
               if VLItera < VLPlazoTot then
                  MontosSI[VLItera + 1] := VLSaldoInsoluto;
               //end if;
          end;
     end;
     if TipoAmort = 1 then // Vencimiento
     begin
          VLSaldoInsoluto := MontoAutor;
          for VLItera := 1 to VLPlazoTot do
          begin
               if (VLItera = VLPlazoTot) then
                   MontosK[VLItera] := MontoAutor
               else
                   MontosK[VLItera] := 0;
               // end if;
               VLSaldoInsoluto := VLSaldoInsoluto - MontosK[VLItera];
               MontosSI[VLItera] := VLSaldoInsoluto;
          end;
     end;

     //Determina Periodos de IIII NNNNN TTTTT EEEEE RRRRR EEEEE SSSSSS

     if TipoInteres = 0 then //Inicio
     begin
          for VLItera := 1 to VLPlazoTot do
          begin
               if (VLItera = 1) then
                   MontosI[VLItera] := (MontoAutor * TasaAnualizada / 36000) * VLPlazoTot
               else
                   MontosI[VLItera] := 0;
               // end if;
          end;
     end;

     if TipoInteres = 1 then //Periodica
     begin
          VLNoPerInd := 1;
          VLPlazoPerAcum := VLPlazoPer;
          VLMontoInteresPer := 0;
          for VLItera := 1 to VLPlazoTot do
          begin
               VLMontoInteresPer := VLMontoInteresPer + (MontosSI[VLItera] * TasaAnualizada / 36000);
               if ((VLItera = VLPlazoPerAcum) or (VLItera = VLPlazoTot)) then
               begin
                    VLPlazoPerAcum := VLPlazoPerAcum + VLPlazoPer;

                    MontosI[VLItera] := VLMontoInteresPer;
                    VLMontoInteresPer := 0;

                    VLNoPerInd := VLNoPerInd + 1;
               end
               else
                   MontosI[VLItera] := 0;
               // end if;
          end;
     end;

     if TipoInteres = 2 then //Vencimiento
     begin
          VLNoPerInd := 1;
          VLPlazoPerAcum := VLPlazoPer;
          VLMontoInteresPer := 0;
          for VLItera := 1 to VLPlazoTot do
          begin
               VLMontoInteresPer := VLMontoInteresPer + (MontosSI[VLItera-1] * TasaAnualizada / 36000);
               if (VLItera = VLPlazoTot) then
               begin
                    VLPlazoPerAcum := VLPlazoPerAcum + VLPlazoPer;

                    MontosI[VLItera] := VLMontoInteresPer;
                    VLMontoInteresPer := 0;

                    VLNoPerInd := VLNoPerInd + 1;
               end
               else
                   MontosI[VLItera] := 0;
               // end if;
          end;
     end;

     //Total
     for VLItera := 1 to VLPlazoTot  + 1 do
     begin
          if VLItera = 1 then
              MontosCS[VLItera] := MontoAutor * (-1)
          else
              MontosCS[VLItera] := MontosK[VLItera-1] + MontosI[VLItera-1];
          //end if
     end;

     for VLItera := 1 to VLPlazoTot do Memo1.Lines.Add(FormatFloat('###,###,###,##0.00',MontosK[VLItera]));
     for VLItera := 1 to VLPlazoTot do Memo2.Lines.Add(FormatFloat('###,###,###,##0.00',MontosSI[VLItera]));
     for VLItera := 1 to VLPlazoTot do Memo3.Lines.Add(FormatFloat('###,###,###,##0.00',MontosI[VLItera]));
     for VLItera := 1 to VLPlazoTot + 1 do Memo4.Lines.Add(FormatFloat('###,###,###,##0.00',MontosCS[VLItera]));

     VLTasaCAT := InternalRateOfReturn(0.1,MontosCS);

     CalculaCATSimulador := VLTasaCAT * 360;

end;


(***********************************************FORMA CrCAT********************)
(*                                                                              *)
(*  FORMA DE CrCAT                                                            *)
(*                                                                              *)
(***********************************************FORMA CrCAT********************)

Procedure TWCrcat.ArmaQueryComis;
begin

end;

procedure TWCrcat.GeneraConsulta;
begin

end;

procedure TWCrcat.ValorTasaCred;
begin
     Objeto.SobreTasa.GetFromControl;
     if Objeto.OperadorSTasa.AsString = '+' then
        Objeto.TasaCredito.AsFloat := StrToFloat(ieValorTasaRef.Text) + Objeto.SobreTasa.AsFloat
     else if Objeto.OperadorSTasa.AsString = '-' then
        Objeto.TasaCredito.AsFloat := StrToFloat(ieValorTasaRef.Text) - Objeto.SobreTasa.AsFloat
     else if Objeto.OperadorSTasa.AsString = '*' then
        Objeto.TasaCredito.AsFloat := StrToFloat(ieValorTasaRef.Text) * Objeto.SobreTasa.AsFloat
     else if Objeto.OperadorSTasa.AsString = '/' then
        Objeto.TasaCredito.AsFloat := StrToFloat(ieValorTasaRef.Text) / Objeto.SobreTasa.AsFloat
     else
        Objeto.TasaCredito.AsFloat := StrToFloat(ieValorTasaRef.Text) + Objeto.SobreTasa.AsFloat;

end;


function TWCrcat.ValorTasa(pTasa: String): String;
var   vlsql : String;
    vlValor : String;
    StpValorTasa: TStoredProc;
begin
  if pTasa <> '' then Begin
    vlValor:='0';
    StpValorTasa := TStoredProc.Create(Nil);
    If Assigned(StpValorTasa) Then
    With StpValorTasa Do
        Try
         StoredProcName := 'PKGCRCREDITOO1.STPCALCTASAREFER';
         DatabaseName := Objeto.Apli.DataBaseName;
         SessionName := Objeto.Apli.SessionName;
         Params.Clear;
         Params.CreateParam(ftString,'peCVE_TASA_INDICAD', ptInput);
         Params.CreateParam(ftDate,'peF_CALCULO', ptInput);
         Params.CreateParam(ftFloat,'psVAL_TASA', ptOutput);
         Params.CreateParam(ftFloat,'PSRESULTADO', ptOutput);
         Params.CreateParam(ftString,'PSTX_RESULTADO', ptOutput);

         ParamByName('peCVE_TASA_INDICAD').AsString := pTasa;
         ParamByName('peF_CALCULO').AsDateTime := Objeto.FechaIni.AsDateTime;
         ExecProc;

         If (ParamByName('PSRESULTADO').AsFloat = 0) Then
           vlValor:= ParamByName('psVAL_TASA').AsString
         else showMessage('STPCALCTASAREFER: '+ParamByName('PSTX_RESULTADO').AsString);

        Finally
         Free;
        End;
      ValorTasa := vlValor;
    end;
end;


procedure TWCrcat.FormShow(Sender: TObject);
begin
     lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
     lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
     lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
     lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

     Objeto.ProductoCre.Control := edCVE_PRODUCTO_CRE;
     Objeto.Producto.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO_CRE;
     Objeto.Producto.DESC_L_PRODUCTO.Control := Edit1;
     Objeto.MontoAutor.Control := ieMontoAutor;
     Objeto.FechaIni.Control := dtpF_Inicio;
     Objeto.FechaFin.Control := dtpF_Fin;
     Objeto.BNivelado.Control := cbNivelados;
     Objeto.TasaReferencia.Control := edCVE_TASA_REFER;
     Objeto.TasaRefer.CVE_TASA_INDICAD.Control := edCVE_TASA_REFER;
     Objeto.TasaRefer.DESC_TASA_INDIC.Control := edDESC_TASA_REFER;
     Objeto.OperadorSTasa.Control := cbOPERADOR_STASA;
     Objeto.SobreTasa.Control := edSOBRETASA;
     Objeto.TasaCredito.Control := ieTasaAnual;
     Objeto.Comision.Control := edCVE_COMISION;
     Objeto.Comisiones.CVE_COMISION.Control := edCVE_COMISION;
     Objeto.Comisiones.DESC_COMISION.Control := edDESC_COMISION;

     Objeto.Producto.GetParams(Objeto);
     Objeto.TasaRefer.GetParams(Objeto);
     Objeto.Comisiones.GetParams(Objeto);

     cbOPERADOR_STASA.Text := '+';
     edSOBRETASA.Text := '0';

     Objeto.FechaIni.AsDateTime := Objeto.Apli.DameFechaEmpresa;
     Objeto.FechaFin.AsDateTime := Objeto.Apli.DameFechaEmpresa;
     dtpF_Inicio.Date:= Objeto.Apli.DameFechaEmpresa;
     dtpF_Fin.Date:= Objeto.Apli.DameFechaEmpresa;
     edF_Inicio.text:=FormatDateTime('dd/mm/yyyy',dtpF_Inicio.Date);
     edF_FIN.text:=FormatDateTime('dd/mm/yyyy',dtpF_Fin.Date);

     Objeto.OperadorSTasa.AsString := '+';
     Objeto.SobreTasa.AsString := '0';

     edCVE_PRODUCTO_CRE.SetFocus;

     Objeto.Memo1 := Memo1;
     Objeto.Memo2 := Memo2;
     Objeto.Memo3 := Memo3;
     Objeto.Memo4 := Memo4;

     IndexArrayComis := 1;
     SetLength(ArrayComisiones,15);
end;

procedure TWCrcat.FormDestroy(Sender: TObject);
begin
     Objeto.ProductoCre.Control := nil;
     Objeto.MontoAutor.Control := nil;
     Objeto.FechaIni.Control := nil;
     Objeto.FechaFin.Control := nil;
     Objeto.BNivelado.Control := nil;
     Objeto.TasaReferencia.Control := nil;
     Objeto.OperadorSTasa.Control := nil;
     Objeto.SobreTasa.Control := nil;
     Objeto.TasaCredito.Control := nil;
     Objeto.Comision.Control := nil;
     Objeto.Producto.DESC_L_PRODUCTO.Control := nil;
     Objeto.TasaRefer.DESC_TASA_INDIC.Control := nil;
     Objeto.Comisiones.DESC_COMISION.Control := nil;
end;

procedure TWCrcat.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrcat.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrcat.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrcat.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


procedure TWCrcat.BitBtn2Click(Sender: TObject);
var  VLCat  : Double;
begin
     Objeto.MontoAutor.GetFromControl;
     Objeto.TasaCredito.GetFromControl;
     Objeto.FechaIni.GetFromControl;
     Objeto.FechaFin.GetFromControl;
     VLCat :=  Objeto.CalculaCATSimulador(Objeto.MontoAutor.AsFloat,
                                          Objeto.TasaCredito.AsFloat,
                                          dtpF_Inicio.Date,
                                          dtpF_Fin.Date,
                                          Objeto.TipoAmort.AsInteger,
                                          Objeto.TipoInteres.AsInteger,
                                          Objeto.Periodo.AsInteger,
                                          0,
                                          0,
                                          0,
                                          0);

     Label4.Caption := FormatFloat('###,##0.0000',VLCat * 100);
end;

procedure TWCrcat.rgAmorCapClick(Sender: TObject);
begin
     Objeto.TipoAmort.AsInteger := rgAmorCap.ItemIndex;
end;

procedure TWCrcat.rgAmorIntClick(Sender: TObject);
begin
     Objeto.TipoInteres.AsInteger := rgAmorInt.ItemIndex;
end;

procedure TWCrcat.cbPeriodoChange(Sender: TObject);
begin
     if cbPeriodo.Text = 'Semanal' then
        Objeto.Periodo.AsInteger := 0;
     if cbPeriodo.Text = 'Quincenal' then
        Objeto.Periodo.AsInteger := 1;
     if cbPeriodo.Text = 'Mensual' then
        Objeto.Periodo.AsInteger := 2;
     if cbPeriodo.Text = 'Bimestral' then
        Objeto.Periodo.AsInteger := 3;
     if cbPeriodo.Text = 'Trimestral' then
        Objeto.Periodo.AsInteger := 4;
     if cbPeriodo.Text = 'Cuatrimetral' then
        Objeto.Periodo.AsInteger := 5;
     if cbPeriodo.Text = 'Semestral' then
        Objeto.Periodo.AsInteger := 6;
     if cbPeriodo.Text = 'Anual' then
        Objeto.Periodo.AsInteger := 7;
end;

procedure TWCrcat.btPRODUCTOClick(Sender: TObject);
begin
   Objeto.Producto.ShowAll := True;
   if Objeto.Producto.Busca then
      InterForma1.NextTab(btCONTRATO);
   // end if
end;

procedure TWCrcat.ilPRODUCTOEjecuta(Sender: TObject);
begin
     if Objeto.Producto.FindKey([ilPRODUCTO.Buffer]) then
        InterForma1.NextTab(btCONTRATO);
     // end if;
end;

procedure TWCrcat.btTASA_REFERClick(Sender: TObject);
begin
   Objeto.TasaRefer.ShowAll := True;
   if Objeto.TasaRefer.Busca then
      InterForma1.NextTab(btTASA_REFER);
   //end if
end;

procedure TWCrcat.ilTASA_REFEREjecuta(Sender: TObject);
begin
   if Objeto.TasaRefer.FindKey([ilTASA_REFER.Buffer]) then
       InterForma1.NextTab(edCVE_TASA_REFER);
   //end if

end;

procedure TWCrcat.btCOMISIONClick(Sender: TObject);
begin
   Objeto.Comisiones.ShowAll := True;
   if Objeto.Comisiones.Busca then
      InterForma1.NextTab(edCVE_COMISION);
   //end if
end;

procedure TWCrcat.ilCOMISIONEjecuta(Sender: TObject);
begin
   if Objeto.Comisiones.FindKey([ilCOMISION.Buffer]) then
      InterForma1.NextTab(edCVE_COMISION);
   //end if
end;

procedure TWCrcat.cbOPERADOR_STASAKeyPress(Sender: TObject; var Key: Char);
begin
     if Not((key=Char(42)) or (key=Char(43)) or (key=Char(45)) or (key=Char(47)) or (key=Char(8)) or (key=Char(13)))  then
     begin
          Key:=Char(0);
          InterForma1.ShowMsgPanel('Solo se permiten + , - , / , * ');
     end;
end;


procedure TWCrcat.btTASA_REFERExit(Sender: TObject);
var vlSalida : Boolean;
    vlMsg    : String;
begin
     vlSalida := True;
     vlMsg := CNULL;
     Objeto.TasaReferencia.GetFromControl;
     Objeto.SobreTasa.GetFromControl;
     if Objeto.TasaReferencia.AsString = CNULL then
     Begin
        vlSalida := False;
        vlMsg := 'Favor de Indicar la Tasa de Referencia';
     end;

     if VlSalida then
     begin
          ieValorTasaRef.Text := ValorTasa(Objeto.TasaReferencia.AsString);
          ValorTasaCred;
     end;
end;

procedure TWCrcat.edSOBRETASAExit(Sender: TObject);
begin
     ValorTasaCred;
end;

procedure TWCrcat.cbOPERADOR_STASAExit(Sender: TObject);
begin
     ValorTasaCred;
end;

procedure TWCrcat.SpeedButton1Click(Sender: TObject);
begin
     if Objeto.Comisiones.CVE_COMISION.AsString <> '' then
     begin
         if IndexArrayComis < 15 then
         begin
              ArrayComisiones[IndexArrayComis] := Objeto.Comisiones.CVE_COMISION.AsString;
              IndexArrayComis := IndexArrayComis  + 1;
              ArmaQueryComis;
              GeneraConsulta;
         end
         else
            ShowMessage('Solo puede regsitrar hasta 14 comisiones en el simulador');
         //end if
     end
     else
        ShowMessage('Debe seleccionar una Comisión');
     //end if
end;

end.

