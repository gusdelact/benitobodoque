// Sistema         : Clase de CR_ECC_COM_SOLI
// Fecha de Inicio : 11/08/2005
// Función forma   : Clase de CR_ECC_COM_SOLI
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCrEcCoSo;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntParamCre, IntCrCredito,
IntLinkit, InterEdit, IntCrCalcInt, IntTasIndFin, IntGenCre, IntCrUniTie,
IntCrAmortiz, IntCrPagInt, IntMCatFirma;

Type
 TCrEcCoSo= class; 

  TWCrEccComSoli=Class(TForm)
    InterForma1             : TInterForma; 
    lbFOLIO_SOLICITUD : TLabel; 
    edFOLIO_SOLICITUD : TEdit;
    GroupBox1: TGroupBox;
    lbID_CREDITO: TLabel;
    lbIMP_CREDITO: TLabel;
    lbCVE_TASA_REFER: TLabel;
    lbTASA_REFER: TLabel;
    lbOPERADOR_STASA: TLabel;
    lbSOBRETASA: TLabel;
    lbTASA_APLICADA: TLabel;
    lbUNIDAD_TIEMPO_RE: TLabel;
    lbCVE_TIPO_TASA: TLabel;
    lbCVE_CALCULO: TLabel;
    lbFACT_MORAS: TLabel;
    lbF_INICIO: TLabel;
    lbF_VENCIMIENTO: TLabel;
    lbCVE_AMORTIZACION: TLabel;
    lbCVE_PAG_INTERES: TLabel;
    edID_CREDITO: TEdit;
    edCVE_TASA_REFER: TEdit;
    edTASA_REFER: TEdit;
    edOPERADOR_STASA: TEdit;
    edSOBRETASA: TEdit;
    edTASA_APLICADA: TEdit;
    edUNIDAD_TIEMPO_RE: TEdit;
    edCVE_CALCULO: TEdit;
    edFACT_MORAS: TEdit;
    dtpF_INICIO: TInterDateTimePicker;
    edF_INICIO: TEdit;
    dtpF_VENCIMIENTO: TInterDateTimePicker;
    edF_VENCIMIENTO: TEdit;
    edCVE_AMORTIZACION: TEdit;
    edCVE_PAG_INTERES: TEdit;
    btPROM_ADM: TBitBtn;
    edDESC_CREDITO: TEdit;
    btCALC_INT: TBitBtn;
    edDESC_CALC_INT: TEdit;
    btTASA_REFER: TBitBtn;
    edDESC_TASA_REFER: TEdit;
    edCVE_TIPO_TASA: TComboBox;
    bbUNIDAD_TIEMPO_RE: TBitBtn;
    btTIPO_AMORT: TBitBtn;
    edDESC_TIPO_AMORT: TEdit;
    btPAGO_INT: TBitBtn;
    edDESC_PAGO_INT: TEdit;
    GroupBox2: TGroupBox;
    lbCVE_FIRMA: TLabel;
    lbF_IMPRESION: TLabel;
    lbNUM_IMPRESION: TLabel;
    edCVE_FIRMA: TEdit;
    dtpF_IMPRESION: TInterDateTimePicker;
    edF_IMPRESION: TEdit;
    edNUM_IMPRESION: TEdit;
    btnMCatFirma: TBitBtn;
    edDESC_L_BLOQUE: TEdit;
    lbTX_ENCABEZADO: TLabel;
    lbTX_DETALLE: TLabel;
    lbTX_CALCE: TLabel;
    lbF_EMIS_EDO_CTA: TLabel;
    edF_EMIS_EDO_CTA: TEdit;
    dtpF_EMIS_EDO_CTA: TInterDateTimePicker;
    lbF_FIRMA_CONV: TLabel;
    dtpF_FIRMA_CONV: TInterDateTimePicker;
    edF_FIRMA_CONV: TEdit;
    lbSIT_SOLICITUD: TLabel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    ilID_CREDITO: TInterLinkit;
    edIMP_CREDITO: TInterEdit;
    ilCALINT: TInterLinkit;
    ilTASA_REFER: TInterLinkit;
    ilTIPAMORT: TInterLinkit;
    ilPAGINT: TInterLinkit;
    ilCVE_FIRMA: TInterLinkit;
    cbSIT_SOLICITUD: TLabel;
    GroupBox3: TGroupBox;
    lbF_ALTA: TLabel;
    lbCVE_USU_ALTA: TLabel;
    dtpF_ALTA: TInterDateTimePicker;
    edF_ALTA: TEdit;
    edCVE_USU_ALTA: TEdit;
    edTX_CALCE: TMemo;
    edTX_DETALLE: TMemo;
    edTX_ENCABEZADO: TMemo;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btPROM_ADMClick(Sender: TObject);
    procedure ilID_CREDITOEjecuta(Sender: TObject);
    procedure btCALC_INTClick(Sender: TObject);
    procedure ilCALINTEjecuta(Sender: TObject);
    procedure btTASA_REFERClick(Sender: TObject);
    procedure ilTASA_REFEREjecuta(Sender: TObject);
    procedure edCVE_TIPO_TASAExit(Sender: TObject);
    procedure bbUNIDAD_TIEMPO_REClick(Sender: TObject);
    procedure btTIPO_AMORTClick(Sender: TObject);
    procedure ilTIPAMORTEjecuta(Sender: TObject);
    procedure btPAGO_INTClick(Sender: TObject);
    procedure ilPAGINTEjecuta(Sender: TObject);
    procedure btnMCatFirmaClick(Sender: TObject);
    procedure ilCVE_FIRMAEjecuta(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    private 
    { Private declarations } 
    public
    { Public declarations } 
    Objeto : TCrEcCoSo;
end;
 TCrEcCoSo= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        FOLIO_SOLICITUD          : TInterCampo;
        ID_CREDITO               : TInterCampo;
        TX_ENCABEZADO            : TInterCampo;
        IMP_CREDITO              : TInterCampo;
        CVE_TASA_REFER           : TInterCampo;
        TASA_REFER               : TInterCampo;
        OPERADOR_STASA           : TInterCampo;
        SOBRETASA                : TInterCampo;
        TASA_APLICADA            : TInterCampo;
        UNIDAD_TIEMPO_RE         : TInterCampo;
        CVE_TIPO_TASA            : TInterCampo;
        CVE_CALCULO              : TInterCampo;
        FACT_MORAS               : TInterCampo;
        F_FIRMA_CONV             : TInterCampo;
        F_INICIO                 : TInterCampo;
        F_VENCIMIENTO            : TInterCampo;
        CVE_AMORTIZACION         : TInterCampo;
        CVE_PAG_INTERES          : TInterCampo;
        TX_DETALLE               : TInterCampo;
        TX_CALCE                 : TInterCampo;
        F_EMIS_EDO_CTA           : TInterCampo;
        CVE_FIRMA                : TInterCampo;
        SIT_SOLICITUD            : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_IMPRESION              : TInterCampo;
        NUM_IMPRESION            : TInterCampo;

        ParamCre                 : TParamCre;
        CrCredito                : TCrCredito;
        CalcInt                  : TCrCalcInt;
        TasaRefer                : TTasIndFin;
        UTiempoTasa              : TCrUniTie;
        TipoAmort                : TCrAmortiz;
        PagoInt                  : TCrPagInt;
        MCatFirma                : TMCatFirma;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
        procedure   CambioSituacion(Sender: TObject);
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrEcCoSo.Create( AOwner : TComponent );
begin Inherited; 
      FOLIO_SOLICITUD :=CreaCampo('FOLIO_SOLICITUD',ftFloat,tsNinguno,tsNinguno,True);
                FOLIO_SOLICITUD.Caption:='Folio Solicitud';
      ID_CREDITO :=CreaCampo('ID_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CREDITO.Caption:='Número de Credito';
      TX_ENCABEZADO :=CreaCampo('TX_ENCABEZADO',ftString,tsNinguno,tsNinguno,True);
                TX_ENCABEZADO.Caption:='Encabezado';
      IMP_CREDITO :=CreaCampo('IMP_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
                IMP_CREDITO.Caption:='Imp Credito';
      CVE_TASA_REFER :=CreaCampo('CVE_TASA_REFER',ftString,tsNinguno,tsNinguno,True);
                CVE_TASA_REFER.Caption:='Clave de Tasa Refer';
      TASA_REFER :=CreaCampo('TASA_REFER',ftFloat,tsNinguno,tsNinguno,True);
                TASA_REFER.Caption:='Tasa Refer';
      OPERADOR_STASA :=CreaCampo('OPERADOR_STASA',ftString,tsNinguno,tsNinguno,True);
                OPERADOR_STASA.Caption:='Operador Stasa';
      SOBRETASA :=CreaCampo('SOBRETASA',ftFloat,tsNinguno,tsNinguno,True);
                SOBRETASA.Caption:='Sobretasa';
      TASA_APLICADA :=CreaCampo('TASA_APLICADA',ftFloat,tsNinguno,tsNinguno,True);
                TASA_APLICADA.Caption:='Tasa Aplicada';
      UNIDAD_TIEMPO_RE :=CreaCampo('UNIDAD_TIEMPO_RE',ftString,tsNinguno,tsNinguno,True);
                UNIDAD_TIEMPO_RE.Caption:='Unidad Tiempo Re';
      CVE_TIPO_TASA :=CreaCampo('CVE_TIPO_TASA',ftString,tsNinguno,tsNinguno,True);
                CVE_TIPO_TASA.Caption:='Clave de Tipo Tasa';
      with CVE_TIPO_TASA do
      Begin  Size := 2;
             UseCombo := True;
             ComboLista.Add('FIJA');            ComboDatos.Add(C_FIJA);
             ComboLista.Add('VARIABLE');        ComboDatos.Add(C_VARIABLE);
      end;

      CVE_CALCULO :=CreaCampo('CVE_CALCULO',ftString,tsNinguno,tsNinguno,True);
                CVE_CALCULO.Caption:='Clave de Calculo';
      FACT_MORAS :=CreaCampo('FACT_MORAS',ftFloat,tsNinguno,tsNinguno,True);
                FACT_MORAS.Caption:='Fact Moras';
      F_FIRMA_CONV :=CreaCampo('F_FIRMA_CONV',ftDate,tsNinguno,tsNinguno,True);
                F_FIRMA_CONV.Caption:='Fecha Firma Conv';
      F_INICIO :=CreaCampo('F_INICIO',ftDate,tsNinguno,tsNinguno,True);
                F_INICIO.Caption:='Fecha Inicio';
      F_VENCIMIENTO :=CreaCampo('F_VENCIMIENTO',ftDate,tsNinguno,tsNinguno,True);
                F_VENCIMIENTO.Caption:='Fecha Vencimiento';
      CVE_AMORTIZACION :=CreaCampo('CVE_AMORTIZACION',ftString,tsNinguno,tsNinguno,True);
                CVE_AMORTIZACION.Caption:='Clave de Amortizacion';
      CVE_PAG_INTERES :=CreaCampo('CVE_PAG_INTERES',ftString,tsNinguno,tsNinguno,True);
                CVE_PAG_INTERES.Caption:='Clave de Pag Interes';
      TX_DETALLE :=CreaCampo('TX_DETALLE',ftString,tsNinguno,tsNinguno,True);
                TX_DETALLE.Caption:='Detalle';
      TX_CALCE :=CreaCampo('TX_CALCE',ftString,tsNinguno,tsNinguno,True);
                TX_CALCE.Caption:='Calce';
      F_EMIS_EDO_CTA :=CreaCampo('F_EMIS_EDO_CTA',ftDate,tsNinguno,tsNinguno,True);
                F_EMIS_EDO_CTA.Caption:='Fecha Emis Edo Cta';
      CVE_FIRMA :=CreaCampo('CVE_FIRMA',ftString,tsNinguno,tsNinguno,True);
                CVE_FIRMA.Caption:='Clave de Firma';
      SIT_SOLICITUD :=CreaCampo('SIT_SOLICITUD',ftString,tsNinguno,tsNinguno,True);
                SIT_SOLICITUD.Caption:='Situación Solicitud';
        With SIT_SOLICITUD do
           begin Size:=2;
                 UseCombo:=True;
                 ComboLista.Add('ACTIVO');      ComboDatos.Add('AC');
                 ComboLista.Add('INACTIVO');    ComboDatos.Add('IN');
           end;
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_IMPRESION :=CreaCampo('F_IMPRESION',ftDate,tsNinguno,tsNinguno,True);
                F_IMPRESION.Caption:='Fecha Impresion';
      NUM_IMPRESION :=CreaCampo('NUM_IMPRESION',ftFloat,tsNinguno,tsNinguno,True);
                NUM_IMPRESION.Caption:='Número Impresion';
      FKeyFields.Add('FOLIO_SOLICITUD');
      FKeyFields.Add('ID_CREDITO');


      CrCredito := TCrCredito.Create(Self);
      CrCredito.MasterSource:=Self;
      CrCredito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';
      CalcInt := TCrCalcInt.Create(Self);
      CalcInt.MasterSource:=Self;
      CalcInt.FieldByName('CVE_CALCULO_INT').MasterField:='CVE_CALCULO';
      TasaRefer := TTasIndFin.Create(Self);
      TasaRefer.MasterSource:=Self;
      TasaRefer.FieldByName('CVE_TASA_INDICAD').MasterField:='CVE_TASA_REFER';
      TasaRefer.BuscaWhereString := 'TASA_INDIC_FINAN.B_TASA_CREDITO =' + #39 + 'V'+ #39;
      TasaRefer.FilterString := TasaRefer.BuscaWhereString;
      UTiempoTasa := TCrUniTie.Create(Self);
      UTiempoTasa.MasterSource:=Self;
      UTiempoTasa.FieldByName('CVE_UNIDAD_TIEMP').MasterField:='UNIDAD_TIEMPO_RE';
      TipoAmort := TCrAmortiz.Create(Self);
      TipoAmort.MasterSource:=Self;
      TipoAmort.FieldByName('CVE_AMORTIZACION').MasterField:='CVE_AMORTIZACION';
      PagoInt := TCrPagInt.Create(Self);
      PagoInt.MasterSource:=Self;
      PagoInt.FieldByName('CVE_PAG_INTERES').MasterField:='CVE_PAG_INTERES';
      MCatFirma := TMCatFirma.Create(Self);
      MCatFirma.MasterSource:=Self;
      MCatFirma.FieldByName('CVE_FIRMA').MasterField:='CVE_FIRMA';

      TableName := 'CR_ECC_COM_SOLI';
      UseQuery := True;
      HelpFile := 'IntCrEcCoSo.Hlp';
      ShowMenuReporte:=True;

      SIT_SOLICITUD.OnChange := CambioSituacion;
end;

Destructor TCrEcCoSo.Destroy;
begin
   If CrCredito <> nil Then
      CrCredito.Free;
   If CalcInt <> nil Then
      CalcInt.Free;
   If TasaRefer <> nil Then
      TasaRefer.Free;
   If TipoAmort <> nil Then
      TipoAmort.Free;
   If PagoInt <> nil Then
      PagoInt.Free;
   If MCatFirma <> nil Then
      MCatFirma.Free;
   inherited;
end;


function TCrEcCoSo.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrEccComSoli;
begin
   W:=TWCrEccComSoli.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftGrid;//FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrEcCoSo.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrEcCS.it','F,F');
      Try if Active then begin T.Param(0,FOLIO_SOLICITUD.AsString);
                               T.Param(1,ID_CREDITO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end; 
end;

function TCrEcCoSo.Reporte:Boolean;
begin //Execute_Reporte();
end;

procedure TCrEcCoSo.CambioSituacion(Sender: TObject);
begin
     If (SIT_SOLICITUD.Control<>nil) and (SIT_SOLICITUD.Control is TLabel) then
        TLabel(SIT_SOLICITUD.Control).Caption:=SIT_SOLICITUD.AsCombo;
     //END IF
end;

(***********************************************FORMA CR_ECC_COM_SOLI********************)
(*                                                                              *)
(*  FORMA DE CR_ECC_COM_SOLI                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_ECC_COM_SOLI********************)

procedure TWCrEccComSoli.FormShow(Sender: TObject);
begin

      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      InterForma1.BtnNuevo.Visible:= False;
      InterForma1.BtnEliminar.Visible:= False;
      InterForma1.BtnModificar.Visible:= False;
      InterForma1.BtnAceptar.Visible:= False;
      InterForma1.BtnCancelar.Visible:= False;

      Objeto.FOLIO_SOLICITUD.Control:=edFOLIO_SOLICITUD;
      Objeto.ID_CREDITO.Control:=edID_CREDITO;
      Objeto.TX_ENCABEZADO.Control:=edTX_ENCABEZADO;
      Objeto.IMP_CREDITO.Control:=edIMP_CREDITO;
      Objeto.CVE_TASA_REFER.Control:=edCVE_TASA_REFER;
      Objeto.TASA_REFER.Control:=edTASA_REFER;
      Objeto.OPERADOR_STASA.Control:=edOPERADOR_STASA;
      Objeto.SOBRETASA.Control:=edSOBRETASA;
      Objeto.TASA_APLICADA.Control:=edTASA_APLICADA;
      Objeto.UNIDAD_TIEMPO_RE.Control:=edUNIDAD_TIEMPO_RE;
      Objeto.CVE_TIPO_TASA.Control:=edCVE_TIPO_TASA;
      Objeto.CVE_CALCULO.Control:=edCVE_CALCULO;
      Objeto.FACT_MORAS.Control:=edFACT_MORAS;
      Objeto.F_FIRMA_CONV.Control:=edF_FIRMA_CONV;
      Objeto.F_INICIO.Control:=edF_INICIO;
      Objeto.F_VENCIMIENTO.Control:=edF_VENCIMIENTO;
      Objeto.CVE_AMORTIZACION.Control:=edCVE_AMORTIZACION;
      Objeto.CVE_PAG_INTERES.Control:=edCVE_PAG_INTERES;
      Objeto.TX_DETALLE.Control:=edTX_DETALLE;
      Objeto.TX_CALCE.Control:=edTX_CALCE;
      Objeto.F_EMIS_EDO_CTA.Control:=edF_EMIS_EDO_CTA;
      Objeto.CVE_FIRMA.Control:=edCVE_FIRMA;
      Objeto.SIT_SOLICITUD.Control:=cbSIT_SOLICITUD;
      Objeto.F_ALTA.Control:=edF_ALTA;
      Objeto.CVE_USU_ALTA.Control:=edCVE_USU_ALTA;
      Objeto.F_IMPRESION.Control:=edF_IMPRESION;
      Objeto.NUM_IMPRESION.Control:=edNUM_IMPRESION;

      Objeto.CrCredito.ID_CREDITO.Control := edID_CREDITO;
      Objeto.CrCredito.ContratoCre.Producto.DESC_C_PRODUCTO.Control := edDESC_CREDITO;
      Objeto.CrCredito.GetParams(Objeto);
      Objeto.CalcInt.CVE_CALCULO_INT.Control :=edCVE_CALCULO;
      Objeto.CalcInt.DESC_CALCULO.Control :=edDESC_CALC_INT;
      Objeto.CalcInt.GetParams(Objeto);
      Objeto.TasaRefer.CVE_TASA_INDICAD.Control := edCVE_TASA_REFER;
      Objeto.TasaRefer.DESC_TASA_INDIC.Control := edDESC_TASA_REFER;
      Objeto.TasaRefer.GetParams(Objeto);
      Objeto.UTiempoTasa.DESCRIPCION.Control := edUNIDAD_TIEMPO_RE;
      Objeto.UTiempoTasa.GetParams(Objeto);
      Objeto.TipoAmort.CVE_AMORTIZACION.Control :=edCVE_AMORTIZACION;
      Objeto.TipoAmort.DESC_AMORTIZA.Control :=edDESC_TIPO_AMORT;
      Objeto.TipoAmort.GetParams(Objeto);
      Objeto.PagoInt.CVE_PAG_INTERES.Control :=edCVE_PAG_INTERES;
      Objeto.PagoInt.DESC_PAG_INTERES.Control :=edDESC_PAGO_INT;
      Objeto.PagoInt.GetParams(Objeto);
      Objeto.MCatFirma.CVE_FIRMA.Control:=edCVE_FIRMA;
      Objeto.MCatFirma.DESC_L_BLOQUE.Control:=edDESC_L_BLOQUE;
      Objeto.MCatFirma.GetParams(Objeto);
end;

procedure TWCrEccComSoli.FormDestroy(Sender: TObject);
begin
      Objeto.FOLIO_SOLICITUD.Control:=nil;
      Objeto.ID_CREDITO.Control:=nil;
      Objeto.TX_ENCABEZADO.Control:=nil;
      Objeto.IMP_CREDITO.Control:=nil;
      Objeto.CVE_TASA_REFER.Control:=nil;
      Objeto.TASA_REFER.Control:=nil;
      Objeto.OPERADOR_STASA.Control:=nil;
      Objeto.SOBRETASA.Control:=nil;
      Objeto.TASA_APLICADA.Control:=nil;
      Objeto.UNIDAD_TIEMPO_RE.Control:=nil;
      Objeto.CVE_TIPO_TASA.Control:=nil;
      Objeto.CVE_CALCULO.Control:=nil;
      Objeto.FACT_MORAS.Control:=nil;
      Objeto.F_FIRMA_CONV.Control:=nil;
      Objeto.F_INICIO.Control:=nil;
      Objeto.F_VENCIMIENTO.Control:=nil;
      Objeto.CVE_AMORTIZACION.Control:=nil;
      Objeto.CVE_PAG_INTERES.Control:=nil;
      Objeto.TX_DETALLE.Control:=nil;
      Objeto.TX_CALCE.Control:=nil;
      Objeto.F_EMIS_EDO_CTA.Control:=nil;
      Objeto.CVE_FIRMA.Control:=nil;
      Objeto.SIT_SOLICITUD.Control:=nil;
      Objeto.F_ALTA.Control:=nil;
      Objeto.CVE_USU_ALTA.Control:=nil;
      Objeto.F_IMPRESION.Control:=nil;
      Objeto.NUM_IMPRESION.Control:=nil;

      Objeto.CrCredito.ID_CREDITO.Control := nil;
      Objeto.CrCredito.ContratoCre.Producto.DESC_C_PRODUCTO.Control := nil;
      Objeto.CalcInt.CVE_CALCULO_INT.Control :=nil;
      Objeto.CalcInt.DESC_CALCULO.Control :=nil;
      Objeto.TasaRefer.CVE_TASA_INDICAD.Control := nil;
      Objeto.TasaRefer.DESC_TASA_INDIC.Control := nil;
      Objeto.UTiempoTasa.DESCRIPCION.Control := nil;
      Objeto.TipoAmort.CVE_AMORTIZACION.Control :=nil;
      Objeto.TipoAmort.DESC_AMORTIZA.Control :=nil;
      Objeto.PagoInt.CVE_PAG_INTERES.Control :=nil;
      Objeto.PagoInt.DESC_PAG_INTERES.Control :=nil;
      Objeto.MCatFirma.CVE_FIRMA.Control:=nil;
      Objeto.MCatFirma.DESC_L_BLOQUE.Control:=nil;
   //Objeto
end;

procedure TWCrEccComSoli.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrEccComSoli.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrEccComSoli.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrEccComSoli.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCrEccComSoli.btPROM_ADMClick(Sender: TObject);
begin
   Objeto.CrCredito.ShowAll := True;
   If Objeto.CrCredito.Busca Then Begin
      InterForma1.NextTab(edID_CREDITO);
   End;
end;

procedure TWCrEccComSoli.ilID_CREDITOEjecuta(Sender: TObject);
begin
   If Objeto.CrCredito.FindKey([ilID_CREDITO.Buffer]) Then Begin
      InterForma1.NextTab(edID_CREDITO);
   End;
end;

procedure TWCrEccComSoli.btCALC_INTClick(Sender: TObject);
begin
   Objeto.CalcInt.ShowAll := True;
   if Objeto.CalcInt.Busca then
      InterForma1.NextTab(btCALC_INT);
end;

procedure TWCrEccComSoli.ilCALINTEjecuta(Sender: TObject);
begin
   if Objeto.CalcInt.FindKey([ilCALINT.Buffer]) then
      InterForma1.NextTab(edCVE_CALCULO);
end;

procedure TWCrEccComSoli.btTASA_REFERClick(Sender: TObject);
begin
   Objeto.TasaRefer.ShowAll := True;
   if Objeto.TasaRefer.Busca then
      InterForma1.NextTab(btTASA_REFER);
end;

procedure TWCrEccComSoli.ilTASA_REFEREjecuta(Sender: TObject);
begin
   if Objeto.TasaRefer.FindKey([ilTASA_REFER.Buffer]) then
       InterForma1.NextTab(edCVE_TASA_REFER);
end;

procedure TWCrEccComSoli.edCVE_TIPO_TASAExit(Sender: TObject);
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      Objeto.CVE_TIPO_TASA.GetFromControl;
      if Objeto.CVE_TIPO_TASA.AsString = C_FIJA then
      Begin
            bbUNIDAD_TIEMPO_RE.Enabled := False;
            if ( Objeto.CVE_CALCULO.AsString = 'RE' ) THEN
            Begin
               ShowMessage('La clave de calculo de interes no puede ser Revisable');
               edCVE_CALCULO.SetFocus;
            end;
      end
      else
      Begin
            bbUNIDAD_TIEMPO_RE.Enabled := True;
      end;
   end;
   InterForma1.ValidaExit(edCVE_TIPO_TASA,True,'',True);
end;

procedure TWCrEccComSoli.bbUNIDAD_TIEMPO_REClick(Sender: TObject);
begin
   Objeto.UTiempoTasa.ShowAll := True;
   if Objeto.UTiempoTasa.Busca then
   begin
        Objeto.UNIDAD_TIEMPO_RE.AsString := Objeto.UTiempoTasa.CVE_UNIDAD_TIEMP.AsString;
        InterForma1.NextTab(bbUNIDAD_TIEMPO_RE);
   end;
end;

procedure TWCrEccComSoli.btTIPO_AMORTClick(Sender: TObject);
begin
    Objeto.TipoAmort.ShowAll := True;
    if Objeto.TipoAmort.Busca then
       InterForma1.NextTab(btTIPO_AMORT);
end;

procedure TWCrEccComSoli.ilTIPAMORTEjecuta(Sender: TObject);
begin
   if Objeto.TipoAmort.FindKey([ilTIPAMORT.Buffer]) then
      InterForma1.NextTab(edCVE_AMORTIZACION);
end;

procedure TWCrEccComSoli.btPAGO_INTClick(Sender: TObject);
begin
   Objeto.PagoInt.ShowAll := True;
   if Objeto.PagoInt.Busca then
      InterForma1.NextTab(btPAGO_INT);
end;

procedure TWCrEccComSoli.ilPAGINTEjecuta(Sender: TObject);
begin
   if Objeto.PagoInt.FindKey([ilPAGINT.Buffer]) then
      InterForma1.NextTab(edCVE_PAG_INTERES);
end;

procedure TWCrEccComSoli.btnMCatFirmaClick(Sender: TObject);
begin
   Objeto.MCatFirma.ShowAll := True;
   if Objeto.MCatFirma.Busca then
      InterForma1.NextTab(btnMCatFirma);
end;

procedure TWCrEccComSoli.ilCVE_FIRMAEjecuta(Sender: TObject);
begin
   if Objeto.PagoInt.FindKey([ilCVE_FIRMA.Buffer]) then
      InterForma1.NextTab(edCVE_FIRMA);
end;

procedure TWCrEccComSoli.InterForma1Buscar(Sender: TObject);
begin
   If Objeto.InternalBusca Then Begin
      //Objeto.CrCredito.FindKey([Objeto.ID_CREDITO.AsString]);
      //Objeto.MCatFirma.FindKey([Objeto.CVE_FIRMA.AsString]);
   End;
end;

end.
