// Sistema         : Clase de INV_PAGARE
// Fecha de Inicio : 24/06/1999
// Función forma   : Clase de INV_PAGARE
// Diseñado por    : Marcos Zarate Castro
// CAMBIOS : En PKGINVERS.STPCATAS y AL VALIDAR


Unit IntInvPagare;

interface

uses
Windows,        Messages,     SysUtils,   Classes,    Graphics,     Controls,     Forms,       Dialogs,
IntFrm,         DB,           DbTables,   Mask,       StdCtrls,     Buttons,      ExtCtrls,    InterFor,
IntFind,        UnSQL2,       InterFun,   ComCtrls,   IntDtPk,      IntSGCtrl,    InterEdit,   UnConInv,
IntInvSaldo,    IntConPagare, unqrRecibo, UnTtasa2,   Printers,     IntSdoXGpoInv,Menus,       UnRecaptura,
IntInvBitacora, IntCtoPanel,  IntCtto,    IntConGen,  IntConTransa, IntConCtte,   UnQRCIFSPes, UnQRCIFSDls,
IntInvTasa,     UnQRCBDL1,    UnQRCBDL2,  IntDvLiqChqr,InDVMovTes,  InDVSolDep,   UnConDV,      unGene,
IntDatMail,     Grids;

const
  coCRLF = #13#10;

Type

  TRecRegAutPag = record
                    bRegAutPag      : Boolean;
                    sCodResp        : Integer;
                    sTxtResp        : String;
                  end;

  TRecAutorizarPag = record
                    bAutorizarPag   : Boolean;
                    sCodResp        : Integer;
                    sTxtResp        : String;
                  end;

 TInvPagare= class;

  TWInvPagare=Class(TForm)
    InterForma1             : TInterForma;
    gbDatosPag: TGroupBox;
    lbID_CONTRATO: TLabel;
    edID_CONTRATO: TEdit;
    lbID_PAGARE: TLabel;
    edID_PAGARE: TEdit;
    edF_APERTURA: TEdit;
    lbF_APERTURA: TLabel;
    lbIMP_CAPITAL: TLabel;
    lbDIAS_PLAZO: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edF_VENCIMIENTO: TEdit;
    lbF_VENCIMIENTO: TLabel;
    gbInstrucciones: TGroupBox;
    lbDIAS_PLAZO_RENOV: TLabel;
    lbCVE_IMP_RENOV: TLabel;
    lbIMP_RENOVAR: TLabel;
    gbSituacion: TGroupBox;
    cbSituacion: TComboBox;
    btVencimiento: TBitBtn;
    btRenovacion: TBitBtn;
    btRecibo: TBitBtn;
    btTasas: TBitBtn;
    mRespuesta: TMemo;
    cbCveRenovar: TComboBox;
    iedImp_Capital: TInterEdit;
    iedIntNeto: TInterEdit;
    iedImp_neto_vto: TInterEdit;
    iedDias_Plazo: TInterEdit;
    iedDias_Plazo_Renov: TInterEdit;
    iedImp_Renovar: TInterEdit;
    pnGrid: TPanel;
    SGCtrl1: TSGCtrl;
    Panel1: TPanel;
    rgSituacion: TRadioGroup;
    idtpCalenda: TInterDateTimePicker;
    pnTasa: TPanel;
    lbTASA_NETA: TLabel;
    iedTasa_Neta: TInterEdit;
    gbGrupo: TGroupBox;
    edGrupo: TEdit;
    btGrupo: TBitBtn;
    bbValuacion: TBitBtn;
    lblRegistros: TLabel;
    bbGrupo: TBitBtn;
    PopupMenu1: TPopupMenu;
    Bitcora1: TMenuItem;
    Recibo1: TMenuItem;
    Vencimiento1: TMenuItem;
    Renovacin1: TMenuItem;
    bbRefrescar: TBitBtn;
    Timer1: TTimer;
    InterCtoPanel1: TInterCtoPanel;
    PopupMenu2: TPopupMenu;
    Contratos1: TMenuItem;
    Consulta1: TMenuItem;
    gbcomentario: TGroupBox;
    edTX_COM_PAG: TEdit;
    Movimientos1: TMenuItem;
    ContratantesCtoInversin1: TMenuItem;
    ContratantesCtoLiquidacin1: TMenuItem;
    N2: TMenuItem;
    pnBanderas: TPanel;
    chbSBC: TCheckBox;
    chbCausaISR: TCheckBox;
    N1: TMenuItem;
    Liquidaciones1: TMenuItem;
    Depsitos1: TMenuItem;
    pnComentario: TPanel;
    lbTX_INST_CAJERO: TLabel;
    edTX_INST_CAJERO: TEdit;
    lblSaldo: TLabel;
    bbDatos: TBitBtn;
    Enviarporemail1: TMenuItem;
    Label3: TLabel;
    Label4: TLabel;
    iedTasa_Bruta: TInterEdit;
    chkMostraDatosdeCreditos: TCheckBox;
    btAutorizar: TBitBtn;
    Label5: TLabel;
    iedTASA_INFLAC: TInterEdit;
    iedGATNom: TInterEdit;
    Label6: TLabel;
    Label7: TLabel;
    iedGATReal: TInterEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure iedImp_CapitalExit(Sender: TObject);
    function  Salir:Boolean;
    procedure chbSBCExit(Sender: TObject);
    procedure chbCausaISRExit(Sender: TObject);
    procedure iedDias_PlazoExit(Sender: TObject); //MARA4356 FEB 2008 CAPTURA DE TASAS BRUTAS
    procedure iedDias_Plazo_RenovExit(Sender: TObject);
    procedure cbCveRenovarExit(Sender: TObject);
    procedure iedImp_RenovarExit(Sender: TObject);
    procedure edTX_COM_PAGExit(Sender: TObject);
    procedure edTX_INST_CAJEROExit(Sender: TObject);
    procedure SGCtrl1Calc(Sender: TObject; DataSet: TDataSet;
      var Texto: String; X, Y: Integer; FieldName, ColName: String);
    procedure ValidaRenovacion;
    procedure btVencimientoClick(Sender: TObject);
    procedure btRenovacionClick(Sender: TObject);
    procedure btReciboClick(Sender: TObject);
    procedure bbValuacionClick(Sender: TObject);
    procedure btTasasClick(Sender: TObject);
    procedure InterForma1Eliminar(Sender: TObject; var Realizado: Boolean);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1Imprimir(Sender: TObject);
    procedure bbGrupoClick(Sender: TObject);
    procedure btGrupoClick(Sender: TObject);
    procedure InterForma1AntesNuevo(Sender: TObject;
      var Realizado: Boolean);
    procedure InterForma1AntesEliminar(Sender: TObject;
      var Realizado: Boolean);
    procedure InterForma1AntesModificar(Sender: TObject;
      var Realizado: Boolean);
    procedure SGCtrl1DblClick(Sender: TObject);
    procedure InterForma1Modificar(Sender: TObject;
      var Realizado: Boolean);
    procedure Bitcora1Click(Sender: TObject);
    procedure Recibo1Click(Sender: TObject);
    procedure Vencimiento1Click(Sender: TObject);
    procedure Renovacin1Click(Sender: TObject);
    procedure bbRefrescarClick(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure SGCtrl1MoveRow(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure Contratos1Click(Sender: TObject);
    procedure Consulta1Click(Sender: TObject);
    procedure idtpCalendaCloseUp(Sender: TObject);
    procedure idtpCalendaEnter(Sender: TObject);
    procedure Movimientos1Click(Sender: TObject);
    procedure ContratantesCtoLiquidacin1Click(Sender: TObject);
    procedure ContratantesCtoInversin1Click(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure rgSituacionClick(Sender: TObject);
    function  MuestraRenovacion:Boolean;
    function  EstableceRenovacion:Boolean;
    procedure PintaSaldo;
    procedure Liquidaciones1Click(Sender: TObject);
    procedure Depsitos1Click(Sender: TObject);
    procedure bbDatosClick(Sender: TObject);
    procedure imprimeRecibo(pMail:Boolean);
    function  VerifImporte(pImporte : Double):Boolean;
    function  TasaInflacion:Double;
    procedure Enviarporemail1Click(Sender: TObject);
    procedure iedTasa_BrutaExit(Sender: TObject);
    procedure chkMostraDatosdeCreditosClick(Sender: TObject);
    procedure btAutorizarClick(Sender: TObject);
    function  AutorizarPag(pIdContrato, pIdPagare: Double): TRecAutorizarPag;
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure iedTASA_INFLACExit(Sender: TObject);
    private
    { Private declarations }
      vlQry : TQuery; 
    public
    { Public declarations }
    Objeto   : TInvPagare;

end;
 TInvPagare= class(TInterFrame)
      private
         FContrato: TInterFrame;
      protected
         Procedure SetContrato(Ctto: TInterFrame);
      public
        { Public declarations }
        ID_CONTRATO              : TInterCampo;
        ID_PAGARE                : TInterCampo;
        B_IMPRESO                : TInterCampo;
        B_RENOVACION             : TInterCampo;
        CVE_IMP_RENOV            : TInterCampo;
        CVE_MET_ISR              : TInterCampo;
        CVE_SIT_PAGARE           : TInterCampo;
        DIAS_PLAZO               : TInterCampo;
        DIAS_PLAZO_RENOV         : TInterCampo;
        FH_REGISTRO              : TInterCampo;
        F_ALTA                   : TInterCampo;
        F_APERTURA               : TInterCampo;
        F_VENCIMIENTO            : TInterCampo;
        F_VENCIMIENTO_REN        : TInterCampo;
        IMP_ACUM_INT             : TInterCampo;
        IMP_ACUM_ISR             : TInterCampo;
        IMP_CAPITAL              : TInterCampo;
        IMP_INT_VTO              : TInterCampo;
        IMP_INTERES              : TInterCampo;
        IMP_INTERES_W            : TInterCampo;
        IMP_ISR_VTO              : TInterCampo;
        IMP_NETO_VTO             : TInterCampo;
        IMP_RENOVAR              : TInterCampo;
        IMP_VALUACION            : TInterCampo;
        IMP_INT_BRUTO            : TInterCampo;
        PCT_ISR                  : TInterCampo;
        TASA_BRUTA               : TInterCampo;
        TASA_NETA                : TInterCampo;
        TX_COM_PAG               : TInterCampo;
        TASA_COSTO               : TInterCampo;
        CVE_USUARIO              : TInterCampo;
        TX_INST_CAJERO           : TInterCampo;
        ID_EMPRESA               : TInterCampo;
        ID_SUCURSAL              : TInterCampo;
        CVE_MEDIO                : TInterCampo;
        FiltroSitua              : String;
        B_SALVOBC                : TInterCampo;
        B_CAUSAISR               : TInterCampo;
        Tipo_Cambio              : TInterCampo;
        TASA_INFLAC              : TInterCampo;
        qPagares                 : TQuery;
        SGCtrl                   : TSGCtrl;
        vgCheckBox               : TCheckBox; // SATV4766;
        Timer1                   : TTimer;
        lblRegistros             : TLabel;
        mRespuesta               : TMemo;
        Saldo                    : TInvSaldo;
        Tasa                     : Ttasa;
        Estado                   : String;
        Contador                 : Integer;
        F_OperaCto               : TDateTime;
        Sucursal                 : String;
        Refrescar                : Boolean;
        TasaAsignada             : Double;
        Espendiente              : Boolean;
        ShowPagare               : String; {Variable para buscar el pagaré despues de visualizar el catálogo}
        vgTasaBruta              : Double;
        function    InternalBusca   : Boolean; override;
        function    InternalLocaliza: Boolean; override;
        function    InternalPost  : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        procedure   databasechange;override;
        procedure   RefrescaGrid;
        function    BuscaObjeto:Boolean;
        function    ValidaPlazo:Boolean;
        function    ValidaTasa:Boolean;
        function    ValidaFAp:Boolean;
        function    ValidaImportes:Boolean;
        function    ValidaPctIsr:Boolean;
        function    BuscaTCambio:Boolean;
        function    EstableceISR:Boolean;
        function    ValidaBanda:Boolean;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        Property    Contrato : TInterFrame Read FContrato Write SetContrato;
        function    ValidaISR:Boolean; //MARA4356 DIC 2007
        function    ObtenTasaNeta:Boolean;//MARA4356 FEB 2008 CAPTURA DE TASAS BRUTAS
        function     RegistrarAutPag(pIdContrato, pIdPagare: Double): TRecRegAutPag;

      published
      end;

implementation

{$R *.DFM}

constructor TInvPagare.Create( AOwner : TComponent );
begin Inherited;
      ID_CONTRATO :=CreaCampo('ID_CONTRATO',ftFloat,tsNinguno,tsNinguno,True);
      with ID_CONTRATO do
      begin
        Caption  :='Número de Contrato';
      end;

      ID_PAGARE :=CreaCampo('ID_PAGARE',ftFloat,tsNinguno,tsNinguno,True);
                ID_PAGARE.Caption:='Número de Pagare';
      B_IMPRESO :=CreaCampo('B_IMPRESO',ftString,tsNinguno,tsNinguno,True);
        B_IMPRESO .Size:=1;
                B_IMPRESO.Caption:='Impreso';
      B_RENOVACION :=CreaCampo('B_RENOVACION',ftString,tsNinguno,tsNinguno,True);
        B_RENOVACION .Size:=1;
                B_RENOVACION.Caption:='Renovacion';
      CVE_IMP_RENOV :=CreaCampo('CVE_IMP_RENOV',ftString,tsNinguno,tsNinguno,True);
      with CVE_IMP_RENOV do
      begin
        Size:=2;
        Caption:='Clave de Imp Renov';
        UseCombo:=True;
        comboLista.Add('Total al vencer'); comboDatos.Add('TO');
        comboLista.Add('Solo Capital');    comboDatos.Add('CP');
        comboLista.Add('Importe');         comboDatos.Add('IM');
        comboLista.Add('No Renovar');      comboDatos.Add('NA');
      end;
      CVE_MET_ISR :=CreaCampo('CVE_MET_ISR',ftFloat,tsNinguno,tsNinguno,True);
                CVE_MET_ISR.Caption:='Clave de Met Isr';
      CVE_SIT_PAGARE :=CreaCampo('CVE_SIT_PAGARE',ftString,tsNinguno,tsNinguno,True);
      with CVE_SIT_PAGARE do
      begin
        Size:=2;
        Caption:='Clave de Situación Pagare';
        UseCombo:=True;
        comboLista.Add('Activo');         comboDatos.Add('AC');
        comboLista.Add('Renovado');       comboDatos.Add('RE');
        comboLista.Add('Vencido');        comboDatos.Add('VE');
        comboLista.Add('Por activar');    comboDatos.Add('PA');
        comboLista.Add('Por autorizar');  comboDatos.Add('PU');
      end;
      DIAS_PLAZO :=CreaCampo('DIAS_PLAZO',ftFloat,tsNinguno,tsNinguno,True);
                DIAS_PLAZO.Caption:='Dias Plazo';
      DIAS_PLAZO_RENOV :=CreaCampo('DIAS_PLAZO_RENOV',ftFloat,tsNinguno,tsNinguno,True);
                DIAS_PLAZO_RENOV.Caption:='Dias Plazo Renov';
      FH_REGISTRO :=CreaCampo('FH_REGISTRO',ftDate,tsNinguno,tsNinguno,True);
                FH_REGISTRO.Caption:='Fecha y Hora Registro';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      F_APERTURA :=CreaCampo('F_APERTURA',ftDate,tsNinguno,tsNinguno,True);
                F_APERTURA.Caption:='Fecha Apertura';
      F_VENCIMIENTO :=CreaCampo('F_VENCIMIENTO',ftDate,tsNinguno,tsNinguno,True);
                F_VENCIMIENTO.Caption:='Fecha Vencimiento';
      F_VENCIMIENTO_REN:=CreaCampo('F_VENCIMIENTO_REN',ftDate,tsNinguno,tsNinguno,False);
                F_VENCIMIENTO_REN.Caption:='Fecha Vencimiento Nuevo';
      IMP_ACUM_INT :=CreaCampo('IMP_ACUM_INT',ftFloat,tsNinguno,tsNinguno,True);
                IMP_ACUM_INT.Caption:='Imp Acum Int';
      IMP_ACUM_ISR :=CreaCampo('IMP_ACUM_ISR',ftFloat,tsNinguno,tsNinguno,True);
                IMP_ACUM_ISR.Caption:='Imp Acum Isr';
      IMP_CAPITAL :=CreaCampo('IMP_CAPITAL',ftFloat,tsNinguno,tsNinguno,True);
                IMP_CAPITAL.Caption:='Imp Capital';
      IMP_INT_VTO :=CreaCampo('IMP_INT_VTO',ftFloat,tsNinguno,tsNinguno,True);
                IMP_INT_VTO.Caption:='Imp Int Vto';
      IMP_INTERES:=CreaCampo('IMP_INTERES',ftFloat,tsNinguno,tsNinguno,False);   //CAMPO CALCULADO
      IMP_INTERES_W:=CreaCampo('IMP_INTERES_W',ftFloat,tsNinguno,tsNinguno,False);   //CAMPO CALCULADO
      IMP_ISR_VTO :=CreaCampo('IMP_ISR_VTO',ftFloat,tsNinguno,tsNinguno,True);
                IMP_ISR_VTO.Caption:='Imp Isr Vto';
      IMP_NETO_VTO :=CreaCampo('IMP_NETO_VTO',ftFloat,tsNinguno,tsNinguno,True);
                IMP_NETO_VTO.Caption:='Imp Neto Vto';
      IMP_RENOVAR :=CreaCampo('IMP_RENOVAR',ftFloat,tsNinguno,tsNinguno,True);
                IMP_RENOVAR.Caption:='Imp Renovar';
      IMP_VALUACION :=CreaCampo('IMP_VALUACION',ftFloat,tsNinguno,tsNinguno,True);
                IMP_VALUACION.Caption:='Imp Valuacion';
      PCT_ISR :=CreaCampo('PCT_ISR',ftFloat,tsNinguno,tsNinguno,True);
                PCT_ISR.Caption:='Pct Isr';
      TASA_BRUTA :=CreaCampo('TASA_BRUTA',ftFloat,tsNinguno,tsNinguno,True);
                TASA_BRUTA.Caption:='Tasa Bruta';
      TASA_NETA :=CreaCampo('TASA_NETA',ftFloat,tsNinguno,tsNinguno,True);
                TASA_NETA.Caption:='Tasa Neta';
      TX_COM_PAG :=CreaCampo('TX_COM_PAG',ftString,tsNinguno,tsNinguno,True);
                TX_COM_PAG.Caption:='Com Pag';
      TASA_COSTO :=CreaCampo('TASA_COSTO',ftFloat,tsNinguno,tsNinguno,True);
                TASA_COSTO.Caption:='Tasa Costo';
      CVE_USUARIO :=CreaCampo('CVE_USUARIO',ftString,tsNinguno,tsNinguno,True);
        CVE_USUARIO .Size:=8;
                CVE_USUARIO.Caption:='Clave de Usuario';
      TX_INST_CAJERO :=CreaCampo('TX_INST_CAJERO',ftString,tsNinguno,tsNinguno,True);
                TX_INST_CAJERO.Caption:='Inst Cajero';
      ID_EMPRESA :=CreaCampo('ID_EMPRESA',ftFloat,tsNinguno,tsNinguno,True);
                ID_EMPRESA.Caption:='Número de Empresa';
      ID_SUCURSAL :=CreaCampo('ID_SUCURSAL',ftFloat,tsNinguno,tsNinguno,True);
                ID_SUCURSAL.Caption:='Número de Sucursal';
      CVE_MEDIO :=CreaCampo('CVE_MEDIO',ftString,tsNinguno,tsNinguno,True);
                CVE_MEDIO.Caption:='Clave de Medio';
      B_SALVOBC :=CreaCampo('B_SALVOBC',ftString,tsNinguno,tsNinguno,False);
      B_CAUSAISR:=CreaCampo('B_CAUSAISR',ftString,tsNinguno,tsNinguno,False);
      IMP_INT_BRUTO:=CreaCampo('IMP_INT_BRUTO',ftFloat,tsNinguno,tsNinguno,False);
      TIPO_CAMBIO  :=CreaCampo('TIPO_CAMBIO',ftFloat,tsNinguno,tsNinguno,False);

      TASA_INFLAC  :=CreaCampo('TASA_INFLAC',ftFloat,tsNinguno,tsNinguno,true);
                TASA_INFLAC.Caption:= 'Tasa de inflación';

      Saldo := TInvSaldo.Create(Self);
      Tasa  := Ttasa.Create(Self);

      FKeyFields.Add('ID_CONTRATO');
      FKeyFields.Add('ID_PAGARE');

      TableName := 'INV_PAGARE';
      UseQuery := True;
      ShowMenuReporte:=True;
      qPagares := TQuery.Create(Nil);
      FContrato:=Nil;
      FiltroSitua:='';
      Refrescar:=True;
end;

procedure TInvPagare.databasechange;
begin inherited;
      qPagares.databasename:=databasename;
      qPagares.SessionName :=SessionName;
      Saldo.GetParams(Self);
      Tasa.Apli:=Apli;
end;

Destructor TInvPagare.Destroy;
begin if qPagares <> nil then qPagares.free;
      if Saldo <> nil then Saldo.free;
      if Tasa <> nil then Tasa.free;
      inherited;
end;

function TInvPagare.InternalPost : Boolean;
Var sp       : TStoredProc;
    Realizado: Boolean;
    vlMensaje,
    vlTipOper,
    vlMensCompl: String;
    vlRegistrarAutPag : TRecRegAutPag;
begin   GetFromControl;
        Realizado:=False;
        InternalPost:=Realizado;
        sp:= TStoredProc.Create(Nil);
        try
          sp.DatabaseName:=DatabaseName;
          sp.SessionName :=SessionName;
          sp.StoredProcName:='PKGINVERS.STPMANTOPAGARE';
          sp.Params.CreateParam(ftString,  'VPendiente',    ptInput);
          sp.Params.CreateParam(ftString,  'VTipoOper',     ptInput);
          sp.Params.CreateParam(ftFloat,   'VContrato',     ptInput);
          sp.Params.CreateParam(ftString,  'VBRenovacion',  ptInput);
          sp.Params.CreateParam(ftString,  'VCve_Imp_Renov',ptInput);
          sp.Params.CreateParam(ftFloat,   'VDias_Plazo',   ptInput);
          sp.Params.CreateParam(ftFloat,   'VDias_PlazoRen',ptInput);
          sp.Params.CreateParam(ftDateTime,'VF_Alta',       ptInput);
          sp.Params.CreateParam(ftDateTime,'VF_Apertura',   ptInput);
          sp.Params.CreateParam(ftDateTime,'VF_Vencimiento',ptInput);
          sp.Params.CreateParam(ftFloat,   'VImp_Capital',  ptInput);
          sp.Params.CreateParam(ftFloat,   'VImp_Int_Vto',  ptInput);
          sp.Params.CreateParam(ftFloat,   'VImp_ISR_Vto',  ptInput);
          sp.Params.CreateParam(ftFloat,   'VImp_Neto_Vto', ptInput);
          sp.Params.CreateParam(ftFloat,   'VImp_Renovar',  ptInput);
          sp.Params.CreateParam(ftFloat,   'VPct_ISR',      ptInput);
          sp.Params.CreateParam(ftFloat,   'VTasa_Bruta',   ptInput);
          sp.Params.CreateParam(ftFloat,   'VTasa_Neta',    ptInput);
          sp.Params.CreateParam(ftString,  'VTx_Com_Pag',   ptInput);
          sp.Params.CreateParam(ftFloat,   'VTasa_Costo',   ptInput);
          sp.Params.CreateParam(ftString,  'VCve_Usuario',  ptInput);
          sp.Params.CreateParam(ftString,  'VTx_Inst_Caj',  ptInput);
          sp.Params.CreateParam(ftString,  'VTasa_Inflac',  ptInput);
          sp.Params.CreateParam(ftFloat,   'VId_Pagare',    ptInputOutput);
          sp.Params.CreateParam(ftString,  'desc_proceso',  ptOutput);
          sp.Params.CreateParam(ftFloat,   'pCodResp',      ptOutput);

          //Asigna los valores de entrada
          if EsPendiente
          then sp.Params.ParamByName('VPendiente').AsString :=cVerdad
          else sp.Params.ParamByName('VPendiente').AsString  :=cFalso;

          sp.Params.ParamByName('VTipoOper').AsString  :=Estado;
          sp.Params.ParamByName('VContrato').AsFloat        :=Id_Contrato.AsFloat;
          sp.Params.ParamByName('VBRenovacion').AsString    :=B_Renovacion.AsString;
          sp.Params.ParamByName('VCve_Imp_Renov').AsString  :=Cve_Imp_Renov.AsString;
          sp.Params.ParamByName('VDias_Plazo').AsFloat      :=Dias_Plazo.AsFloat;
          sp.Params.ParamByName('VDias_PlazoRen').AsFloat   :=DIAS_PLAZO_RENOV.AsFloat;
          sp.Params.ParamByName('VF_Alta').AsDateTime       :=F_Alta.AsDateTime;
          sp.Params.ParamByName('VF_Apertura').AsDateTime   :=F_Apertura.AsDateTime;
          sp.Params.ParamByName('VF_Vencimiento').AsDateTime:=F_Vencimiento.AsDateTime;
          sp.Params.ParamByName('VImp_Capital').AsFloat     :=Imp_Capital.AsFloat;

          sp.Params.ParamByName('VImp_Int_Vto').AsFloat     :=Imp_Interes.AsFloat;

          sp.Params.ParamByName('VImp_ISR_Vto').AsFloat     :=IMP_ISR_VTO.AsFloat;
          sp.Params.ParamByName('VImp_Neto_Vto').AsFloat    :=Imp_Neto_Vto.AsFloat;
          sp.Params.ParamByName('VImp_Renovar').AsFloat     :=Imp_Renovar.AsFloat;
          sp.Params.ParamByName('VPct_ISR').AsFloat         :=Pct_ISR.AsFloat;
          sp.Params.ParamByName('VTasa_Bruta').AsFloat      :=Tasa_Bruta.AsFloat;
          sp.Params.ParamByName('VTasa_Neta').AsFloat       :=Tasa_Neta.AsFloat;
          sp.Params.ParamByName('VTx_Com_Pag').AsString     :=TX_COM_PAG.AsString;
          sp.Params.ParamByName('VTasa_Costo').AsFloat      :=Tasa_Costo.AsFloat;
          sp.Params.ParamByName('VCve_Usuario').AsString    :=Cve_Usuario.AsString;
          sp.Params.ParamByName('VTx_Inst_Caj').AsString    :=TX_INST_CAJERO.AsString;
          sp.Params.ParamByName('VTasa_Inflac').AsString    :=TASA_INFLAC.AsString;
          if Estado <> cAltaPagare
          then sp.params.ParamByName('VId_Pagare').AsFloat:=Id_Pagare.AsFloat;

          //Prepara y ejecuta el stored procedure
          try
            sp.ExecProc;
            Realizado:=True;
          except
          end;

          if Realizado then Realizado:= (sp.params.ParamByName('pCodResp').AsFloat = 0);
          if Not Realizado
          then begin
                 mRespuesta.Lines.Add('Error : ' + sp.params.ParamByName('pCodResp').AsString + ', ' + sp.params.ParamByName('desc_proceso').AsString);
                 Raise EInterFrame.Create('Error : ' + sp.params.ParamByName('pCodResp').AsString + ', ' + sp.params.ParamByName('desc_proceso').AsString);
               end
          else begin
                if Estado = cAltaPagare
                then begin
                      // Crear el Registro de Autorizacion de Pagares
                      vlRegistrarAutPag := RegistrarAutPag(ID_CONTRATO.AsFloat, sp.params.ParamByName('VId_Pagare').AsFloat);
                      if (not vlRegistrarAutPag.bRegAutPag) then
                         vlMensCompl := 'Error al Crear el Registro de Autorización del Pagaré' + coCRLF + vlRegistrarAutPag.sTxtResp
                      else
                         vlMensCompl :=  'Se creó Registro de Autorización del Pagaré';

                      vlMensaje:='Alta de pagaré exitosa con número: ' + sp.params.ParamByName('VId_Pagare').AsString + coCRLF + vlMensCompl;
                      Id_Pagare.AsFloat:=sp.params.ParamByName('VId_Pagare').AsFloat;
                      Id_Pagare.DrawControl;
                     end
                else if Estado = cCancPagare
                     then vlMensaje:='Cancelación de pagaré exitosa '
                     else if Estado = cModPagare
                     then vlMensaje:='Modificación de pagaré exitosa ';
                 mRespuesta.Lines.Add(vlMensaje);
                 InternalPost:= True;
                 RefrescaGrid;
                 Active:=True;
               end;
        finally sp.Params.Clear;
                sp.free;
        end;
end;

function TInvPagare.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWInvPagare;
begin
   W:=TWInvPagare.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowBtnImprimir:=True;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      SGCtrl      :=W.SGCtrl1;
      vgCheckBox  :=W.chkMostraDatosdeCreditos;
      Timer1      :=W.Timer1;
      lblRegistros:=W.lblRegistros;
      mRespuesta:=W.mRespuesta;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

function TInvPagare.EstableceISR:Boolean;
begin EstableceISR:=False;
      if IMP_ISR_VTO.AsFloat=0
      then B_CAUSAISR.AsString:=cFalso
      else B_CAUSAISR.AsString:=cVerdad;
      EstableceISR:=True;
end;

function TInvPagare.ValidaBanda:Boolean;
Var vlMensaje : String;
    vlTasa1, vlTasa2 : String;
begin ValidaBanda:=False;
      if (Contrato.FieldByName('ID_EMPRESA').AsInteger = cInterfin) or
         (Contrato.FieldByName('ID_EMPRESA').AsInteger = cBanco)   // Se agrego el 24 de Agosto del 2000 (Banco)
      then begin
             vlTasa1:=TASA_BRUTA.AsString;//ANTES TASA_NETA MARA4356 FEB 2008 PARA CAPTURA DE TASAS BRUTAS
             vlTasa2:=FloatToStr(TasaAsignada);
             if (StrToFloat(vlTasa1) > StrToFloat(vlTasa2)) AND     //solo para tasas mayores
                 Not EsAdministrador(Self)
             then begin
                    vlMensaje:='Tasa fuera de banda. Se necesita autorización del administrador';
                    CVE_SIT_PAGARE.AsString:=cPorAutoriz;
                    Espendiente:=True;
                    mRespuesta.Lines.Add(vlMensaje);
                    MessageDlg(vlMensaje,mtInformation,[mbOK],0);
                  end
             else CVE_SIT_PAGARE.AsString:=cPorActivar;
             CVE_SIT_PAGARE.DrawControl;
             ValidaBanda:=True;
           end
      else ValidaBanda:=True;
end;

function TInvPagare.InternalLocaliza: Boolean;
Var Valido : Boolean;
begin if Not Refrescar
      then InternalLocaliza:=Inherited InternalLocaliza
      else begin
             Valido := Inherited InternalLocaliza;
             if Valido then Valido:=BuscaTCambio;
             if Valido then Valido:=EstableceISR;
             IMP_INTERES.AsFloat:=IMP_INT_VTO.AsFloat;
             IMP_INTERES_W.AsFloat:=StrToFloat(FormatFloat('###########0.00',(IMP_INT_VTO.AsFloat - IMP_ISR_VTO.AsFloat)));
             InternalLocaliza:=Valido;
           end;
end;

function TInvPagare.InternalBusca:Boolean;
var T:TInterFindit;
begin InternalBusca := False;
      T:=CreaBuscador('IntCtto.it','S,S');
      T.WhereString:='CONTRATO.CVE_TIP_CONTRATO IN (''INPA'',''INIF'',''BPAG'')';
      Try
          if T.Execute
          then begin
                 InternalBusca := Contrato.FindKey([T.DameCampo(0)]);
                 Saldo.FindKey([Contrato.FieldByName('ID_CONTRATO').AsString]);
                 RefrescaGrid;
                 Sucursal:=FloatToStr(ObtenEntidad(Contrato));
                 if qPagares.RecordCount = 0
                 then Active:=False
                 else begin
                        Contador:=0;
                        Timer1.Enabled:=True;
                      end;
                 end;
      finally  T.Free;
      end;
end;

Procedure TInvPagare.SetContrato(Ctto: TInterFrame);
Begin
   FContrato:= Ctto;
   If Ctto <> nil Then
   Begin
     RefrescaGrid;
   end;
end;

procedure TInvPagare.refrescagrid;
var vlbMostraDatosdeCreditos : Boolean;
begin
      qPagares.disablecontrols;
      qPagares.Close;

    // <SATV4766 09Feb2009 Modificación para mostrar los pagares que estan vinculados
    //  como garantía de alguna disposición de ICRE o INTERCREDITOS >
    //
    vlbMostraDatosdeCreditos := False;
    If Assigned(vgCheckBox) Then
      vlbMostraDatosdeCreditos := vgCheckBox.Checked;

    If (vlbMostraDatosdeCreditos) Then
      Begin
      qPagares.SQL.Text:=
                ' SELECT  IP.ID_CONTRATO, IP.ID_PAGARE, IP.IMP_CAPITAL, IP.DIAS_PLAZO, IP.TASA_NETA, (IP.IMP_INT_VTO - IP.IMP_ISR_VTO) Interes,'+coCRLF+
                '         IP.F_APERTURA, IP.F_VENCIMIENTO, IP.IMP_NETO_VTO, IP.CVE_SIT_PAGARE,'+coCRLF+
                '         IAP.CVE_SIT_PAGARE CVE_SIT_AUT_PAG,'+coCRLF+
                {Actualizado a solicitud de Ismael '         DECODE(IAP.CVE_SIT_PAGARE, ''NA'', ''NO AUTORIZADO'', ''AU'', ''AUTORIZADO'', ''NO APLICA'') DESC_SIT_AUT_PAG,'+coCRLF+}
                '         DECODE(IAP.CVE_SIT_PAGARE, ''NA'', ''PENDIENTE'', ''AU'', ''REVISADO'', ''NO APLICA'') DESC_SIT_AUT_PAG,'+coCRLF+
                '         IP.TX_COM_PAG, IP.TX_INST_CAJERO,  IP.B_GTIA_FWD,'+coCRLF+
                '         CRPD1.CVE_ORIGEN, CRPD1.ID_CREDITO, CRPD1.NOMBRE'+coCRLF+
                ' FROM    INV_PAGARE IP,'+coCRLF+
                '         (   SELECT CRPD.ID_CONTRATO, CRPD.ID_PAGARE, CRPD.ID_CREDITO, ''ICRE'' AS CVE_ORIGEN, P.NOMBRE'+coCRLF+
                '             FROM CR_REL_PAG_DISP CRPD,'+coCRLF+
                '                  CR_CREDITO CC,'+coCRLF+
                '                  CONTRATO CTO,'+coCRLF+
                '                  PERSONA P'+coCRLF+
                '             WHERE CRPD.ID_CONTRATO = '+Contrato.FieldByName('ID_CONTRATO').AsString+coCRLF+
                '               AND CRPD.SIT_REL_PAG_DISP = ''AC'''+coCRLF+
                '               AND CC.ID_CREDITO = CRPD.ID_CREDITO'+coCRLF+
                '               AND CC.SIT_CREDITO <> ''CA'''+coCRLF+
                '               AND CTO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
                '               AND P.ID_PERSONA = CTO.ID_TITULAR'+coCRLF+
                '           UNION ALL'+coCRLF+
                '             SELECT CRPD.ID_CONTRATO, CRPD.ID_PAGARE, CRPD.ID_CREDITO, ''INTER'' AS CVE_ORIGEN, P.NOMBRE'+coCRLF+
                '             FROM CR_REL_PAG_DISP CRPD,'+coCRLF+
                '                  CRE_CREDITO CC,'+coCRLF+
                '                  CONTRATO CTO,'+coCRLF+
                '                  PERSONA P'+coCRLF+
                '             WHERE CRPD.ID_CONTRATO = '+Contrato.FieldByName('ID_CONTRATO').AsString+coCRLF+
                '               AND CRPD.SIT_REL_PAG_DISP = ''AC'''+coCRLF+
                '               AND CC.ID_CREDITO = CRPD.ID_CREDITO'+coCRLF+
                '               AND CC.SIT_CREDITO NOT IN (''CA'',''TA'')'+coCRLF+
                '               AND CTO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
                '               AND P.ID_PERSONA = CTO.ID_TITULAR'+coCRLF+
                '         ) CRPD1,'+coCRLF+
                '         INV_AUT_PAGARE IAP'+coCRLF+
                ' WHERE IP.ID_CONTRATO = '+Contrato.FieldByName('ID_CONTRATO').AsString+coCRLF+
                '   AND CRPD1.ID_CONTRATO (+)= IP.ID_CONTRATO'+coCRLF+
                '   AND CRPD1.ID_PAGARE (+)= IP.ID_PAGARE'+coCRLF+
                '   AND IAP.ID_CONTRATO(+) = IP.ID_CONTRATO'+coCRLF+
                '   AND IAP.ID_PAGARE(+) = IP.ID_PAGARE';
      End
    Else
      Begin
      qPagares.SQL.Text:='SELECT ' +
               '  IP.ID_CONTRATO, ' +
               '  IP.ID_PAGARE, ' +
               '  IP.IMP_CAPITAL, ' +
               '  IP.DIAS_PLAZO, ' +
               '  IP.TASA_NETA, ' +
               '  (IP.IMP_INT_VTO - IP.IMP_ISR_VTO) Interes, ' +
               '  IP.F_APERTURA, ' +
               '  IP.F_VENCIMIENTO, ' +
               '  IP.IMP_NETO_VTO, ' +
               '  IP.CVE_SIT_PAGARE, ' +
               '  IAP.CVE_SIT_PAGARE CVE_SIT_AUT_PAG, ' +
               '  DECODE(IAP.CVE_SIT_PAGARE, ''NA'', ''PENDIENTE'', ''AU'', ''REVISADO'', ''NO APLICA'') DESC_SIT_AUT_PAG,' +
               '  IP.TX_COM_PAG, ' +
               '  IP.TX_INST_CAJERO,' +
               '  IP.B_GTIA_FWD ' +
               ' FROM ' +
               '  INV_PAGARE IP, INV_AUT_PAGARE IAP ' +
               ' WHERE ' +
               '  IP.ID_CONTRATO = ' + Contrato.FieldByName('ID_CONTRATO').AsString +
               '  AND IAP.ID_CONTRATO(+) = IP.ID_CONTRATO ' +
               '  AND IAP.ID_PAGARE(+) = IP.ID_PAGARE';


      End;
      // </SATV4766>

      if (Trim(FiltroSitua) <> '') then
        if (Trim(FiltroSitua) = cNoAutorizado) then
          qPagares.SQL.Text:=qPagares.SQL.Text + ' AND IAP.CVE_SIT_PAGARE = ''' + FiltroSitua + ''''
        else
          qPagares.SQL.Text:=qPagares.SQL.Text + ' AND IP.CVE_SIT_PAGARE = ''' + FiltroSitua + '''';

      qPagares.Open;

      qPagares.FieldByName('ID_CONTRATO').Visible     :=False;
      qPagares.FieldByName('ID_PAGARE').DisplayLabel  := 'Pagaré';
            qPagares.FieldByName('ID_PAGARE').DisplayWidth  := 8;
      qPagares.FieldByName('IMP_CAPITAL').DisplayLabel:= 'Capital';
            TFloatField(qPagares.FieldByName('IMP_CAPITAL')).DisplayFormat:= '$#,##0.00';
            qPagares.FieldByName('IMP_CAPITAL').DisplayWidth:=15;
      qPagares.FieldByName('DIAS_PLAZO').DisplayLabel:= 'Plazo';
            qPagares.FieldByName('DIAS_PLAZO').DisplayWidth:=6;
      qPagares.FieldByName('TASA_NETA').DisplayLabel:= 'Tasa Neta';
            TFloatField(qPagares.FieldByName('TASA_NETA')).DisplayFormat:= '0.000000';
            qPagares.FieldByName('TASA_NETA').DisplayWidth:=9;
      qPagares.FieldByName('F_APERTURA').DisplayLabel:= 'Apertura';
            qPagares.FieldByName('F_APERTURA').DisplayWidth:=12;
      qPagares.FieldByName('Interes').DisplayLabel:= 'Interés';
            qPagares.FieldByName('Interes').DisplayWidth:=15;
      qPagares.FieldByName('F_VENCIMIENTO').DisplayLabel:= 'Vencimiento';
            qPagares.FieldByName('F_VENCIMIENTO').DisplayWidth:=12;
      qPagares.FieldByName('IMP_NETO_VTO').DisplayLabel:= 'Neto';
            TFloatField(qPagares.FieldByName('IMP_NETO_VTO')).DisplayFormat:= '$#,##0.00';
            qPagares.FieldByName('IMP_NETO_VTO').DisplayWidth:=15;
      qPagares.FieldByName('CVE_SIT_PAGARE').DisplayLabel:= 'Situación';
            qPagares.FieldByName('CVE_SIT_PAGARE').DisplayWidth:=10;
      // Maker-Chequer
      qPagares.FieldByName('CVE_SIT_AUT_PAG').Visible := False;
      qPagares.FieldByName('DESC_SIT_AUT_PAG').DisplayLabel:= 'Checker';
            qPagares.FieldByName('CVE_SIT_PAGARE').DisplayWidth:=16;
      qPagares.FieldByName('TX_COM_PAG').DisplayLabel:= 'Comentarios';
            qPagares.FieldByName('TX_COM_PAG').DisplayWidth:=50;
      qPagares.FieldByName('TX_INST_CAJERO').DisplayLabel:= 'Instrucciones';
            qPagares.FieldByName('TX_INST_CAJERO').DisplayWidth:=50;
      qPagares.FieldByName('B_GTIA_FWD').DisplayLabel:= 'Gtia.FWD';
            qPagares.FieldByName('B_GTIA_FWD').DisplayWidth:=10;

    // <SATV4766 09Feb2009 Modificación para mostrar los pagares que estan vinculados
    If (vlbMostraDatosdeCreditos) Then
      Begin
      qPagares.FieldByName('CVE_ORIGEN').DisplayWidth:=10;
          qPagares.FieldByName('CVE_ORIGEN').DisplayLabel:= 'Origen';
      qPagares.FieldByName('ID_CREDITO').DisplayWidth:=10;
          qPagares.FieldByName('ID_CREDITO').DisplayLabel:= 'No. Disposición';
      qPagares.FieldByName('NOMBRE').DisplayWidth:=50;
          qPagares.FieldByName('NOMBRE').DisplayLabel:= 'Acreditado';
      End;
    // </SATV4766>

      if SGCtrl <> nil then
      begin
         SGCtrl.AddQry(qPagares,True,True,-1,20,-1,True);
         SGCtrl.UpClick(Nil);
         lblRegistros.Caption:= IntToStr(qPagares.RecordCount) +  ' Registro(s)';
      end;
      qPagares.Enablecontrols;
      Contador:=0;
end;

Function TInvPagare.ValidaPlazo:Boolean;
Var vlPais : String;
begin ValidaPlazo:=False;
      Dias_Plazo.GetFromControl;
      Apli.Fecha.IdEmpresa:=Contrato.FieldByName('ID_EMPRESA').AsFloat;


      if not ((Dias_Plazo.AsInteger >=1) and (Dias_Plazo.AsInteger <= 364)) then
         begin
            MensajePanel('El plazo no es valido debe estar entre 1 y 364.',mtError,[mbOK],0,mRespuesta);
            Exit;
         end;

      F_Vencimiento.AsDatetime:=F_Apertura.AsDatetime + Dias_Plazo.AsInteger;
      //Si la empresa trabaja en días inhábiles, no valida fechas festivas o inhábiles
      if Not funValidaFHabil(Apli) then
      begin
         // Valida que la fecha de vencimiento sea válida para la empresa de acuerdo
         Apli.Fecha.FechaReferencia := F_Vencimiento.AsDateTime;
         if Not Apli.Fecha.FechaValida then
         begin
            MensajePanel('La fecha de Vencimiento no es válida.',mtError,[mbOK],0,mRespuesta);
            Exit;
         end;
         Apli.Fecha.FechaReferencia := F_Apertura.AsDateTime;
         if Not Apli.Fecha.FechaValida then
         begin
            MensajePanel('La fecha de Apertura no es válida.',mtError,[mbOK],0,mRespuesta);
            Exit;
         end;

         //Valida que la fecha de vencimiento no sea festiva en México, (Aunque la empresa sea Estados Unidos)
         Apli.Fecha.IdEmpresa:=cBanco;
         // Valida que la fecha de vencimiento sea válida para la empresa de acuerdo
         Apli.Fecha.FechaReferencia := F_Vencimiento.AsDateTime;
         if Not Apli.Fecha.FechaValida then
         begin
            MensajePanel('La fecha de Vencimiento no es válida para México.',mtError,[mbOK],0,mRespuesta);
            Exit;
         end;
      end;
      F_Vencimiento.DrawControl;
      ValidaPlazo:=True;
end;

function TInvPagare.ValidaTasa:Boolean;
Var Valido : Boolean;
    vlDescProc:String;
begin ValidaTasa := False;

      Valido:=BuscaTasaLimit(DIAS_PLAZO,
                        vgTasaBruta,
                        Apli);
      if Not Valido
      then
      begin
      	Mrespuesta.Lines.add('Error al buscar TASA : No se encuentra registrado el plazo' + vlDescProc);
        Exit;
      end;

      Valido:=BuscaTasa(ID_CONTRATO,
                        IMP_CAPITAL,
                        DIAS_PLAZO,
                        TASA_COSTO,
                        TASA_BRUTA,//ANTES TASA_NETA MARA4356 FEB 2008 CAPTURA DE TASA BRUTA
                        vlDescProc,
                        Apli);
      mrespuesta.Lines.Add(vlDescProc);
      if Not Valido
      then Mrespuesta.Lines.add('Error al buscar TASA : ' + vlDescProc)
      else if TASA_COSTO.AsFloat = 0
           then mrespuesta.Lines.Add('Problemas al asignar tasa')
           else begin
                  ValidaTasa := True;
                  TASA_BRUTA.DrawControl; //ANTES TASA_NETA MARA4356 FEB 2008 CAPTURA DE TASA BRUTA
                  TasaAsignada:= vgTasaBruta;
                  //TASA_BRUTA.AsFloat;//ANTES TASA_NETA MARA4356 FEB 2008 CAPTURA DE TASA BRUTA
                end;
end;

function TInvPagare.ValidaFAp:Boolean;
Var Valido:Boolean;
    vlDescProc : String;
begin GetFromControl;
      ValidaFAp:=False;
      Valido:=BuscaFApertura(Id_Contrato,
                             B_SALVOBC,
                             F_Alta,
                             F_Apertura,
                             vlDescProc,
                             Apli);
      ValidaFAp:=Valido;
      if Not Valido
      then mrespuesta.Lines.Add('Error al validar fecha de apertura : ' + vlDescProc);
end;

function TInvPagare.ValidaPctIsr:Boolean;
Var Valido:Boolean;
begin GetFromControl;
      ValidaPctIsr:=False;
      Valido:=BuscaPctISR(ID_CONTRATO,
                          IMP_CAPITAL,
                          DIAS_PLAZO,
                          //TASA_NETA, MARA4356 FEB 2008 CAPTURA DE TASAS BRUTAS
                          TASA_BRUTA,
                          PCT_ISR,
                          F_VENCIMIENTO, //MARA4356 DIC 2007 PARA PARAMETRIZAR EL % ISR
                          Apli);

      ValidaPctIsr:=Valido;
      if Not Valido
      then mrespuesta.Lines.Add('Error al obtener el porcentaje de ISR');
end;

function TInvPagare.ValidaImportes:Boolean;
Var Valido:Boolean;
    vlDescProc : String;
begin GetFromControl;
      Valido:=CalculaImportes(Imp_Capital,
                              Tasa_Neta,
                              Pct_Isr,
                              Dias_Plazo,
                              Tasa_Bruta,
                              IMP_ISR_VTO,
                              Imp_Int_Bruto,
                              IMP_INT_VTO,
                              IMP_NETO_VTO,
                              F_VENCIMIENTO,
                              vlDescProc,
                              Apli);
      ValidaImportes:=Valido;
      if Not Valido
      then mrespuesta.Lines.add('Error al validar importes : ' + vlDescProc)
      else begin
             Tasa_Bruta.DrawControl;
             IMP_ISR_VTO.DrawControl;
             Imp_Int_Bruto.DrawControl;
             IMP_INTERES.AsFloat:=Imp_Int_Bruto.AsFloat;
             IMP_INTERES_W.AsFloat:=StrToFloat(FormatFloat('###########0.00',(IMP_INTERES.AsFloat - IMP_ISR_VTO.AsFloat)));
             IMP_INTERES_W.DrawControl;
             IMP_NETO_VTO.DrawControl;
           end;
end;

function TInvPagare.BuscaTCambio:Boolean;
begin BuscaTCambio:=False;
      Tipo_Cambio.AsFloat:=ObtenTCambio(Contrato,F_Apertura);
      BuscaTCambio:=True;
end;

function TInvPagare.BuscaObjeto:Boolean;
Var vlRegistro: Integer;
    vlBuscar  : Boolean;
begin vlRegistro:=SGCTRL.SG.selection.Top;
        BuscaObjeto:=FindKey([Contrato.FieldByName('ID_CONTRATO').AsString,
                              SGCTRL.cellStr['ID_PAGARE',vlRegistro]]);
end;

function TInvPagare.ValidaISR:Boolean; //MARA4356 DIC 2007 
var vlCve:String;
BEGIN
//   GetSqlStr('select cve_tip_excep from excepcion_cte where id_contrato = ' + ID_CONTRATO.AsString +
//             ' and cve_tip_excep=''ISRPRL'' and sit_excepcion = ''AC''',DataBaseName,SessionName,'cve_tip_excep',vlCve,True);
   GetSqlStr(' Select Pkgfunproccorp.BExcepcion('+ID_CONTRATO.AsString+',''ISRPRL'','''+DateTimeToStr(Apli.DameFechaEmpresa)+''' ) VALOR from dual ',
              DataBaseName,SessionName,'VALOR',vlCve,True);
   if vlCve='V' then
      ValidaISR:=True
   else
      ValidaISR:=False;
END;

function TInvPagare.ObtenTasaNeta:Boolean; //MARA4356 FEB 2008 PARA CAPTURA DE TASAS BRUTAS
var b:Boolean;
begin
  b:=BuscaTasaNeta(Apli, PCT_ISR, Tasa_Bruta, F_VENCIMIENTO, Tasa_Neta);
  ObtenTasaNeta:=b;
end;

(***********************************************FORMA INV_PAGARE********************)
(*                                                                              *)
(*  FORMA DE INV_PAGARE                                                            *)
(*                                                                              *)
(***********************************************FORMA INV_PAGARE********************)

procedure TWInvPagare.FormShow(Sender: TObject);
begin Objeto.FiltroSitua:='';
      rgSituacion.ItemIndex:=0;
      Objeto.F_OperaCto:=ObtenFecOper(Objeto.Contrato);
      Objeto.RefrescaGrid;
      if Objeto.qPagares.RecordCount > 0 then Objeto.BuscaObjeto;
      Objeto.Sucursal:=FloatToStr(ObtenEntidad(Objeto.Contrato));
      Objeto.ID_CONTRATO.Control      :=edID_CONTRATO;
      Objeto.ID_PAGARE.Control        :=edID_PAGARE;
      Objeto.CVE_IMP_RENOV.Control    :=cbCveRenovar;
      Objeto.CVE_SIT_PAGARE.Control   :=cbSituacion;
      Objeto.DIAS_PLAZO.Control       :=iedDIAS_PLAZO;
      Objeto.DIAS_PLAZO_RENOV.Control :=iedDIAS_PLAZO_RENOV;
      Objeto.F_APERTURA.Control       :=edF_APERTURA;
      Objeto.F_VENCIMIENTO.Control    :=edF_VENCIMIENTO;
      Objeto.IMP_CAPITAL.Control      :=iedIMP_CAPITAL;
      Objeto.IMP_NETO_VTO.Control     :=iedIMP_NETO_VTO;
      Objeto.IMP_RENOVAR.Control      :=iedIMP_RENOVAR;
      Objeto.TASA_NETA.Control        :=iedTASA_NETA;
      Objeto.TASA_BRUTA.Control       :=iedTASA_BRUTA;//MARA4356 FEB 2008 PARA CAPTURA DE TASAS BRUTAS

      Objeto.TASA_INFLAC.Control      :=iedTASA_INFLAC;

      Objeto.TX_COM_PAG.Control       :=edTX_COM_PAG;
      Objeto.TX_INST_CAJERO.Control   :=edTX_INST_CAJERO;
      Objeto.B_SALVOBC.Control        :=chbSBC;
      Objeto.B_CAUSAISR.Control       :=chbCausaISR;
      Objeto.IMP_INTERES_W.Control    :=iedIntNeto;
      Objeto.Saldo.Grupo.DESC_GRUPO.Control:=edGrupo;
      pnBanderas.Enabled:=(Objeto.Contrato.FieldByName('ID_EMPRESA').AsInteger <> cInterFin);
      //pnComentario.Enabled:=(Objeto.Contrato.FieldByName('ID_EMPRESA').AsInteger = cBanco);
      Objeto.Saldo.FindKey([Objeto.Contrato.FieldByName('ID_CONTRATO').AsString]);
      InterCtoPanel1.Frame:= Objeto.Contrato;
      SGCtrl1.ApliEmail:=Objeto.Apli;
      InterCtoPanel1.ShowEnviarEmail:=True;
      InterCtoPanel1.SGCtrlEmail:=SGCtrl1;
      lblSaldo.caption:='';

      SGCtrl1.SG.Options := SGCtrl1.SG.Options + [goRowSelect];
end;

procedure TWInvPagare.FormDestroy(Sender: TObject);
begin
      Objeto.ID_CONTRATO.Control      :=nil;
      Objeto.ID_PAGARE.Control        :=nil;
      Objeto.CVE_IMP_RENOV.Control    :=nil;
      Objeto.CVE_SIT_PAGARE.Control   :=nil;
      Objeto.DIAS_PLAZO.Control       :=nil;
      Objeto.DIAS_PLAZO_RENOV.Control :=nil;
      Objeto.F_APERTURA.Control       :=nil;
      Objeto.F_VENCIMIENTO.Control    :=nil;
      Objeto.IMP_CAPITAL.Control      :=nil;
      Objeto.IMP_NETO_VTO.Control     :=nil;
      Objeto.IMP_RENOVAR.Control      :=nil;
      Objeto.IMP_INTERES_W.Control    :=nil;
      Objeto.TASA_NETA.Control        :=nil;
      Objeto.TASA_BRUTA.Control       :=nil;//MARA4356 FEB 2008 PARA CAPTURA DE TASAS BRUTAS
      Objeto.TX_COM_PAG.Control       :=nil;
      Objeto.TX_INST_CAJERO.Control   :=nil;
      Objeto.B_SALVOBC.Control        :=nil;
      Objeto.B_CAUSAISR.Control       :=nil;
      Objeto.Saldo.Grupo.DESC_GRUPO.Control:=nil;

      Objeto.TASA_INFLAC.Control      :=nil;

      Timer1.Enabled:=False;
end;

procedure TWInvPagare.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWInvPagare.InterForma1DespuesNuevo(Sender: TObject);
begin Mrespuesta.Clear;
      Objeto.CVE_SIT_PAGARE.AsString :=cPorActivar;
      Objeto.Espendiente:=False;
      Objeto.CVE_SIT_PAGARE.DrawControl;
      Objeto.ID_CONTRATO.AsFloat     :=Objeto.Contrato.FieldByName('ID_CONTRATO').AsFloat;
      Objeto.ID_CONTRATO.DrawControl;
      Objeto.CVE_IMP_RENOV.AsString  :=cRenTotal;
      Objeto.CVE_IMP_RENOV.DrawControl;
      Objeto.CVE_USUARIO.AsString    :=Objeto.Apli.Usuario;
      Mrespuesta.Lines.Add('Pagaré Nuevo');
      iedImp_Renovar.Enabled:=false;
      Objeto.B_RENOVACION.AsString:=cVerdad;
      Objeto.TASA_BRUTA.AsFloat:=0;
      chbSBC.Checked:=False;
      //chbCausaISR.Checked:=(Objeto.Contrato.FieldByName('ID_EMPRESA').AsInteger <> cInterFin);
      //MARA4356 DIC 2007 SE CAMBIA LA SENTENCIA ANTERIOR POR LA SIGUIENTE
      chbCausaISR.Checked:=NOT(Objeto.ValidaISR);
      chbCausaISR.Enabled:=False;
      idtpCalenda.Date:=Objeto.F_OperaCto;
      pnTasa.Enabled:=PuedeModifTasa(Objeto);
      gbDatosPag.Enabled:=True;

      Objeto.TASA_INFLAC.AsFloat:= TasaInflacion;
      iedGATNom.Text:= '';
      iedGATReal.Text:= '';

      //El capital por default será lo que tenga en la chequera
      Objeto.IMP_CAPITAL.AsFloat:=SaldoDisp(Objeto.Contrato);
      Objeto.IMP_CAPITAL.DrawControl;
      PintaSaldo;
      iedImp_Capital.SetFocus;
end;

procedure TWInvPagare.PintaSaldo;
begin if Objeto.Active
      then lblSaldo.Caption:='Saldo ' + FormatFloat('$##,##0.00',SaldoDisp(Objeto.Contrato));
end;

procedure TWInvPagare.iedImp_CapitalExit(Sender: TObject);
Var Valido : Boolean;
begin if Salir or Interforma1.PreValidaExit(iedImp_Capital) then Exit;
      Valido:=(Trim(iedImp_Capital.Text)<>'') and (StrToFloat(iedImp_Capital.Text)<>0);
      if Valido and (Objeto.Contrato.FieldByName('ID_EMPRESA').AsInteger = cInterFin)
      then Valido:=Objeto.ValidaFAp;
      //Nuevo. MZarate. Valida Importe Mínimo
{      if Valido
      then Valido:=VerifImporte(StrToFloat(iedImp_Capital.Text));                  }
      Interforma1.ValidaExit(iedImp_Capital,Valido,'Debe indicar un capital',True);
end;

function TWInvPagare.VerifImporte(pImporte : Double):Boolean;
Var vlCodResp  : Integer;
    vlDescProc : String;
begin VerifImporte:=False;
      VerImpMinProd(Objeto.Apli, Objeto.Contrato.FieldByName('CVE_PRODUCTO').AsString,
                    pImporte,vlCodResp,vlDescProc);
      if vlCodResp <> 0
      then ShowMessage(vlDescProc)
      else VerifImporte:=True;
end;


function TWInvPagare.Salir:Boolean;
begin Salir:= (Interforma1.IsCancel) or
              (Objeto.Modo = moBrowse);
end;

procedure TWInvPagare.chbSBCExit(Sender: TObject);
begin if Salir or Interforma1.PreValidaExit(chbSBC) then Exit;
      Interforma1.ValidaExit(chbSBC,Objeto.ValidaFAp,'',True);
end;

procedure TWInvPagare.chbCausaISRExit(Sender: TObject);
begin if Salir or Interforma1.PreValidaExit(chbCausaISR) then Exit;
      Interforma1.ValidaExit(chbCausaISR,True,'',True)
end;

function TWInvPagare.MuestraRenovacion:Boolean;
begin MuestraRenovacion:=False;
      iedDias_Plazo_Renov.text:=iedDias_Plazo.Text;
      ValidaRenovacion;
      iedImp_Renovar.Text   :=iedImp_neto_vto.text;
      cbCveRenovar.ItemIndex:=0;
      MuestraRenovacion:=True;
end;

procedure TWInvPagare.iedDias_PlazoExit(Sender: TObject);
Var Valido : Boolean;
begin idtpCalenda.Color:=clWindow;
      if Salir or Interforma1.PreValidaExit(iedDias_Plazo) then Exit;
      Valido:=(iedDias_Plazo.text <> '') and (StrToFloat(iedDias_Plazo.text) <> 0);
      if Valido then Valido:=Objeto.ValidaPlazo;
      if Valido then Valido:=Objeto.ValidaTasa;

      if Valido then
      begin
         iedGATNom.Text:= Objeto.TASA_BRUTA.AsString;
         iedGATReal.Text:= FloatToStr(Objeto.TASA_BRUTA.AsFloat-Objeto.TASA_INFLAC.AsFloat);
      end;

      if chbCausaISR.Checked then if Valido then Valido:=Objeto.ValidaPctIsr;
      if Valido then Valido:=Objeto.ObtenTasaNeta;//MARA4356 FEB 2008 CAPTURA DE TASAS BRUTAS
      if Valido then Valido:=Objeto.ValidaImportes;
      if Valido then Valido:=Objeto.BuscaTCambio;     
      if Interforma1.ValidaExit(iedDias_Plazo,Valido,'',True)
      then MuestraRenovacion;
end;

{MARA4356 FEB 2008 CAPTURA DE TASAS BRUTAS
procedure TWInvPagare.iedTasa_NetaExit(Sender: TObject);
Var Valido : Boolean;
begin if Salir or Interforma1.PreValidaExit(iedTasa_Neta) then Exit;
      Valido:=(iedTasa_Neta.text<>'') and (StrToFloat(iedTasa_Neta.text)<>0);
      Objeto.GetFromControl;
      if chbCausaISR.Checked
      then if Valido
           then Valido:=Objeto.ValidaPctIsr;
      if Valido then Valido:=Objeto.ValidaImportes;
      if Valido then Valido:=Objeto.BuscaTCambio;
      if Valido then Valido:=Objeto.ValidaBanda;
      if Valido then Valido:=MuestraRenovacion;
      Interforma1.ValidaExit(iedTasa_Neta,Valido,'',True);
end;}

//aqui
procedure TWInvPagare.iedTasa_BrutaExit(Sender: TObject);
Var Valido : Boolean;
begin if Salir or Interforma1.PreValidaExit(iedTasa_Bruta) then Exit;
      Valido:=(iedTasa_Bruta.text<>'') and (StrToFloat(iedTasa_Bruta.text)<>0);
      Objeto.GetFromControl;
      if chbCausaISR.Checked then if Valido then Valido:=Objeto.ValidaPctIsr;
      if Valido then Valido:=Objeto.ObtenTasaNeta; //MARA4356 FEB 2008 CAPTURA DE TASAS BRUTAS
      if Valido then Valido:=Objeto.ValidaImportes;
      if Valido then Valido:=Objeto.BuscaTCambio;
      if Valido then Valido:=Objeto.ValidaBanda;
      if Valido then Valido:=MuestraRenovacion;

      if Valido then
         iedGATReal.Text:= FloatToStr(Objeto.TASA_BRUTA.AsFloat-Objeto.TASA_INFLAC.AsFloat);

      Interforma1.ValidaExit(iedTasa_Bruta,Valido,'',True);
end;

procedure TWInvPagare.iedDias_Plazo_RenovExit(Sender: TObject);
Var Valido : Boolean;
begin if Salir or Interforma1.PreValidaExit(iedDias_Plazo_Renov) then Exit;
      Valido:=(Trim(iedDias_Plazo_Renov.Text)<>'') and (Trim(iedDias_Plazo_Renov.Text)<>'0');
      Interforma1.ValidaExit(iedDias_Plazo_Renov,Valido,'',True);
end;

procedure TWInvPagare.cbCveRenovarExit(Sender: TObject);
Var Valido : Boolean;
begin if Salir or Interforma1.PreValidaExit(cbCveRenovar) then Exit;
      Valido:=(cbCveRenovar.Text <> '');
      if Valido then Valido:=EstableceRenovacion;
      Interforma1.ValidaExit(cbCveRenovar,Valido,'',True);
end;

procedure TWInvPagare.ValidaRenovacion;
begin iedImp_Renovar.Enabled:=False;
      iedDias_Plazo_Renov.Enabled:=True;
      case cbCveRenovar.ItemIndex of
           0:iedImp_Renovar.text:=iedImp_neto_vto.text;
           1:iedImp_Renovar.text:=iedImp_Capital.text;
           2:begin
               iedImp_Renovar.Enabled:=True;
               iedImp_Renovar.Text:=iedImp_neto_vto.text;
             end;
           3:begin
               iedImp_Renovar.Text:='0';
               iedDias_Plazo_Renov.Text:='0';
               iedDias_Plazo_Renov.Enabled:=False;
               //idtpPlazoDiasV.Enabled:=False;
               Objeto.B_RENOVACION.AsString:=cFalso;
             end;
      end;
end;

procedure TWInvPagare.iedImp_RenovarExit(Sender: TObject);
Var Valido : Boolean;
begin if Salir or Interforma1.PreValidaExit(iedImp_Renovar) then Exit;
      Objeto.CVE_IMP_RENOV.GetFromControl;
      if Objeto.CVE_IMP_RENOV.AsString = cNoRenovar
      then Valido:=(Trim(iedImp_Renovar.Text)<>'')
      else Valido:=(Trim(iedImp_Renovar.Text)<>'') and (StrToFloat(iedImp_Renovar.Text)<> 0);
      Interforma1.ValidaExit(iedImp_Renovar,Valido,'Debe indicar un importe a renovar',True)
end;

procedure TWInvPagare.edTX_COM_PAGExit(Sender: TObject);
begin if Salir or Interforma1.PreValidaExit(edTX_COM_PAG) then Exit;
      Interforma1.ValidaExit(edTX_COM_PAG,True,'',True)
end;

procedure TWInvPagare.edTX_INST_CAJEROExit(Sender: TObject);
begin if Salir or Interforma1.PreValidaExit(edTX_INST_CAJERO) then Exit;
      Interforma1.ValidaExit(edTX_INST_CAJERO,True,'',True)
end;

procedure TWInvPagare.SGCtrl1Calc(Sender: TObject; DataSet: TDataSet;
  var Texto: String; X, Y: Integer; FieldName, ColName: String);
begin if ColName='CVE_SIT_PAGARE'
      then begin
            if DataSet.FieldByName('CVE_SIT_AUT_PAG').AsString = cNoAutorizado
               then SGCtrl1.SetFontColor(clDkGray)
            else if DataSet.FieldByName('CVE_SIT_PAGARE').AsString = cActivo
                 then begin
                    if DataSet.FieldByName('F_VENCIMIENTO').AsDateTime = Objeto.F_OperaCto
                    then SGCtrl1.SetActualAsHeader
                    else SGCtrl1.SetFontColor(clBlack);
                 end
                 else if DataSet.FieldByName('CVE_SIT_PAGARE').AsString = cRenovado
                      then SGCtrl1.SetFontColor(clBlue)
                      else if DataSet.FieldByName('CVE_SIT_PAGARE').AsString = cVencido
                           then SGCtrl1.SetFontColor(clRed)
                           else if DataSet.FieldByName('CVE_SIT_PAGARE').AsString = cPorActivar
                                then SGCtrl1.SetFontColor(clGreen)
                                else if DataSet.FieldByName('CVE_SIT_PAGARE').AsString = cPorAutoriz
                                     then SGCtrl1.SetFontColor(clPurple)
                                     else if DataSet.FieldByName('CVE_SIT_PAGARE').AsString = cCancelado
                                          then SGCtrl1.SetFontColor(clMaroon)
                                          else if DataSet.FieldByName('CVE_SIT_PAGARE').AsString = cRenCancel
                                               then SGCtrl1.SetFontColor(clNavy);
           end;
end;

procedure TWInvPagare.btVencimientoClick(Sender: TObject);
Var vlTasaBruta:Double;
    vlInstr,
    DescProc, vlCveAsigTasa,
    vlMensaje: String;
    Anticipado,
    Realizado: Boolean;
begin if SucuBloqueada(Objeto, Objeto.Sucursal, objeto.Contrato.FieldByName('ID_EMPRESA').AsString) then Exit;
      if Not Objeto.BuscaObjeto then Exit;
      if Objeto.CVE_SIT_PAGARE.AsString = cActivo
      then begin
             Anticipado:=(Objeto.F_Vencimiento.AsDateTime <> Objeto.F_OperaCto) and
                         (Objeto.F_APERTURA.AsDateTime    <> Objeto.F_OperaCto);


             // Si quiere vencer un pagaré el día en que se apertura no  siendo
             // Administrador, envia un mensaje de error
//           if (Objeto.Contrato.FieldByName('ID_EMPRESA').AsInteger = cInterFin) then
//           begin
                if (Objeto.F_APERTURA.AsDateTime = Objeto.F_OperaCto) and Not EsAdministrador(Objeto) then
                begin
                  MensajePanel('Usted no puede vencer la operación el mismo día. Solicitelo con su administrador',mtError,[mbOK],0,mRespuesta);
                  Exit;
                end;
//             end;
             //
             if (objeto.F_VENCIMIENTO.AsDateTime <> Objeto.F_OperaCto) and
                (objeto.F_APERTURA.AsDateTime <> Objeto.F_OperaCto)  and
                (Objeto.Id_Empresa.AsInteger = cBanco)
             then MensajePanel('El pagare no es operable el dia de hoy',mtError,[mbOK],0,mRespuesta)
             else begin
                    vlMensaje:='¿Confirma el vencimiento?';
                    if MessageDlg(vlMensaje,MtConfirmation,[mbYes,mbNo],0) = mrYes then
                    begin
                       if Objeto.Contrato.FieldByName('ID_EMPRESA').AsInteger = cBanco
                       then vlInstr := InputBox('Instrucciones para el cajero','Intruduzca instrucciones para el cajero',' ')
                       else vlInstr :='';
                       if ((Objeto.Id_Empresa.AsInteger = cInterFin) or
                           (Objeto.Id_Empresa.AsInteger = cBancoDls) ) and Anticipado
                       then begin
                              if Not PuedeVencerAnt(Objeto)
                              then begin
                                     DescProc:='Usted no tiene acceso para vencer anticipadamente';
                                     MessageDlg(DescProc,mtError,[mbOK],0);
                                     mRespuesta.Lines.Add(DescProc);
                                     Exit;
                                   end;
                              if Not CapturaTasaBruta(Objeto,vlCveAsigTasa,vlTasaBruta,Objeto.F_OperaCto) then
                              begin
                                 DescProc:='Tasa no asignada. Proceso cancelado';
                                 MessageDlg(DescProc,mtError,[mbOK],0);
                                 mRespuesta.Lines.Add(DescProc);
                                 Exit;
                              end;
                            end;

                       Realizado:=Renovacion(Objeto.Id_Contrato,   Objeto.Id_Pagare,
                                             cVencido,
                                             Objeto.F_Apertura,    Objeto.F_Vencimiento,
                                             Objeto.F_OperaCto,     vlInstr,
                                             Objeto.Id_Empresa,    Objeto.Id_Sucursal,
                                             vlCveAsigTasa,        vlTasaBruta,
                                             DescProc,             Objeto.Apli);
                       mRespuesta.Lines.Add(DescProc);
                       if Realizado
                       then begin
                              Objeto.Refresh;
                              Objeto.RefrescaGrid;
                            end;
                    end;
             end;
           end
      else MensajePanel('El pagare no está activo',mtError,[mbOK],0,mRespuesta);
end;

procedure TWInvPagare.btRenovacionClick(Sender: TObject);
Var vlInstr,
    DescProc,
    vlMensaje: String;
    Realizado: Boolean;
begin if SucuBloqueada(Objeto, Objeto.Sucursal, objeto.Contrato.FieldByName('ID_EMPRESA').AsString) then Exit;
      if Not Objeto.BuscaObjeto then Exit;
      if Objeto.CVE_SIT_PAGARE.AsString = cActivo
      then begin
             if objeto.F_VENCIMIENTO.AsDateTime <> Objeto.F_OperaCto
             then MensajePanel('El pagare no es operable el dia de hoy',mtError,[mbOK],0,mRespuesta)
             else begin
                    vlMensaje:='¿Confirma la renovación?';
                    if MessageDlg(vlMensaje,MtConfirmation,[mbYes,mbNo],0) = mrYes then
                    begin
                       if Objeto.Contrato.FieldByName('ID_EMPRESA').AsInteger = cBanco
                       then vlInstr := InputBox('Instrucciones para el cajero','Intruduzca instrucciones para el cajero',' ')
                       else  vlInstr := '';

                       Realizado:=Renovacion(Objeto.Id_Contrato,   Objeto.Id_Pagare,
                                             cRenovado,
                                             Objeto.F_Apertura,    Objeto.F_Vencimiento,
                                             Objeto.F_OperaCto,     vlInstr,
                                             Objeto.Id_Empresa,    Objeto.Id_Sucursal,
                                             '',                   Objeto.Tasa_Bruta.AsFloat,
                                             DescProc,             Objeto.Apli);
                       mRespuesta.Lines.Add(DescProc);
                       if Realizado
                       then begin
                              Objeto.Refresh;
                              Objeto.RefrescaGrid;
                            end;
                    end;
                  end;
           end
      else MensajePanel('El pagare no está activo',mtError,[mbOK],0,mRespuesta);
end;

procedure TWInvPagare.btReciboClick(Sender: TObject);
begin imprimeRecibo(False);
end;

procedure TWInvPagare.imprimeRecibo(pMail:Boolean);
Var vlBEnvia : Boolean;
    vlNomArDig,
    vlCadena,
    vlHost,
    vlMailOrig,
    vlMailDest : String;
begin if SucuBloqueada(Objeto, Objeto.Sucursal, objeto.Contrato.FieldByName('ID_EMPRESA').AsString) then Exit;
      if Not Objeto.BuscaObjeto then Exit;
      if Objeto.ID_EMPRESA.AsInteger = cInterFin
      then begin
             if Not (Objeto.CVE_SIT_PAGARE.AsString = cActivo)
             then begin
                    vlCadena:='El pagaré no está activo';
                    MessageDlg(vlCadena,mtError,[mbOK],0);
                    mRespuesta.Lines.Add(vlCadena);
                  end
             else begin
                    //
                    if pMail then  //modificado EMAIL oct 2002
                    begin
                       vlNomArDig:=DirectorioTemporal(False) + Objeto.Id_Contrato.AsString + '_' + Objeto.Id_Pagare.AsString + cExtDig;
                       MuestraDatMail(Objeto.Apli, vlBEnvia, vlHost, vlMailOrig, vlMailDest);
                       if Not vlBEnvia then
                       begin
                          MessageDlg('No se pudo enviar el mail',mtError,[mbOK],0);
                          Exit;
                       end;
                    end;
                    //

                    if Objeto.Contrato.FieldByName('CVE_MONEDA').AsInteger <> cDolares
                    then execute_conf_ifs_pesos(False, Objeto.Apli,
                                     Objeto.Id_Contrato.AsFloat,
                                     Objeto.Id_Pagare.AsFloat,
                                     Objeto.Contrato.FieldByName('TITNOMBRE').AsString)
                    //
                    else execute_conf_ifs_dlls(False, Objeto.Apli, //modificado EMAIL oct 2002
                                     Objeto.Id_Contrato.AsFloat,
                                     Objeto.Id_Pagare.AsFloat,
                                     Objeto.Contrato.FieldByName('TITNOMBRE').AsString,
                                     pMail,
                                     vlNomArDig,
                                     vlHost,
                                     vlMailOrig,
                                     vlMailDest);
                    //
                  end;
           end
      else if (Objeto.ID_EMPRESA.AsInteger = cBanco) or (Objeto.ID_EMPRESA.AsInteger = cBancoNM ) then
           begin
             Execute_Recibo(False,Objeto,Objeto.Contrato.FieldByName('CVE_MONEDA').asInteger,
                     Objeto.Tipo_Cambio.AsFloat,Objeto.F_OperaCto);
           end
           else if Objeto.ID_EMPRESA.AsInteger = cBancoDls then
                begin
                  if EsUnBanco(Objeto.apli,Objeto.Id_Contrato.AsInteger)
                  then execute_conf_BDlsCall(False, Objeto.Apli,
                                             Objeto.Id_Contrato.AsFloat,
                                             Objeto.Id_Pagare.AsFloat,
                                             Objeto.Contrato.FieldByName('TITNOMBRE').AsString)
                  else execute_conf_BDlsCtes(False, Objeto.Apli,
                                             Objeto.Id_Contrato.AsFloat,
                                             Objeto.Id_Pagare.AsFloat,
                                             Objeto.Contrato.FieldByName('TITNOMBRE').AsString);
                end;
end;


procedure TWInvPagare.bbValuacionClick(Sender: TObject);
Var Consulta: TConPagare;
begin Consulta:= TConPagare.Create(Objeto);
      Try
         Consulta.GetParams(Objeto);
         Consulta.Contrato:= Objeto.Contrato;
         Consulta.Catalogo;
      Finally Consulta.Free;
      end;
end;

procedure TWInvPagare.btTasasClick(Sender: TObject);
Var CvePerJur,
    TipoPagare:String;
begin if Not Objeto.Active then Exit;
      CvePerJur:=ObtenPersJur(Objeto.Contrato);
      if ( (Objeto.Contrato.FieldByName('ID_EMPRESA').AsInteger=cBanco) OR (Objeto.Contrato.FieldByName('ID_EMPRESA').AsInteger=cBancoNM) ) and
         (Objeto.Contrato.FieldByName('CVE_MONEDA').AsInteger=cPesos) and
         (CvePerJur=cPersFisica)
      then TipoPagare:=cPRLVPF
      else if (Objeto.Contrato.FieldByName('ID_EMPRESA').AsInteger=cBanco) and
              (Objeto.Contrato.FieldByName('CVE_MONEDA').AsInteger=cPesos) and
              (CvePerJur=cPersMoral)
           then TipoPagare:=cPRLVPM
           else if (Objeto.Contrato.FieldByName('ID_EMPRESA').AsInteger=cBanco) and
                   (Objeto.Contrato.FieldByName('CVE_MONEDA').AsInteger=cUdis)
                then TipoPagare:=cPRLVUDI
                else if (Objeto.Contrato.FieldByName('ID_EMPRESA').AsInteger=cInterFin) and
                        (Objeto.Contrato.FieldByName('CVE_MONEDA').AsInteger=cDolares) and
                        (CvePerJur=cPersFisica)
                     then TipoPagare:=cPRLVIFPF
                     else if (Objeto.Contrato.FieldByName('ID_EMPRESA').AsInteger=cInterFin) and
                             (Objeto.Contrato.FieldByName('CVE_MONEDA').AsInteger=cDolares) and
                             (CvePerJur=cPersMoral)
                          then TipoPagare:=cPRLVIFPM
                          else if (Objeto.Contrato.FieldByName('ID_EMPRESA').AsInteger=cInterFin) and
                                  (Objeto.Contrato.FieldByName('CVE_MONEDA').AsInteger=cPesos) and
                                  (CvePerJur=cPersFisica)
                               then TipoPagare:=cPRLVIFMXPF
                               else if (Objeto.Contrato.FieldByName('ID_EMPRESA').AsInteger=cInterFin) and
                                       (Objeto.Contrato.FieldByName('CVE_MONEDA').AsInteger=cPesos) and
                                       (CvePerJur=cPersMoral)
                                    then TipoPagare:=cPRLVIFMXPM
                                    else if (Objeto.Contrato.FieldByName('ID_EMPRESA').AsInteger=cBancoDls) and
                                            (Objeto.Contrato.FieldByName('CVE_MONEDA').AsInteger=cDolares)  and
                                            (CvePerJur=cPersFisica)
                                         then TipoPagare:=cPBCODLLSPF
                                         else if (Objeto.Contrato.FieldByName('ID_EMPRESA').AsInteger=cBancoDls) and
                                                 (Objeto.Contrato.FieldByName('CVE_MONEDA').AsInteger=cDolares)  and
                                                 (CvePerJur=cPersMoral)
                                              then TipoPagare:=cPBCODLLSPM;

      Objeto.Tasa.ClaveTasaInd := TipoPagare;
      Objeto.Tasa.FechaOpera   := Objeto.F_OperaCto;
      Objeto.Tasa.Plazo        := 0;
      Objeto.Tasa.MontoOpera   := 0;
      Objeto.Tasa.GenMat;
end;

procedure TWInvPagare.InterForma1Eliminar(Sender: TObject;
  var Realizado: Boolean);
Var vlMensaje:String;
begin if Objeto.CVE_SIT_PAGARE.AsString<>cPorActivar
      then MensajePanel('Solamente puede cancelar los pagarés ''PA'':Por activar',mtError,[mbOK],0,mRespuesta)
      else begin
             vlMensaje:='¿Confirma la cancelación?';
             if MessageDlg(vlMensaje,MtConfirmation,[mbYes,mbNo],0) = mrYes then
             begin
                Realizado:=False;
                Objeto.Edit;
                Objeto.CVE_SIT_PAGARE.AsString:=cCancelado;
                try
                   Objeto.Post;
                   Realizado:=True;
                   if Objeto.qPagares.RecordCount = 0
                   then Objeto.Active:=False
                   else begin
                          Objeto.Contador:=0;
                          Timer1.Enabled:=True;
                        end;
                except
                  if not Realizado
                  then Objeto.Cancel;
                end;
             end
             else Realizado:=True;
           end;
end;

procedure TWInvPagare.InterForma1DespuesModificar(Sender: TObject);
begin pnTasa.Enabled:=PuedeModifTasa(Objeto);
      gbDatosPag.Enabled:=(Objeto.CVE_SIT_PAGARE.AsString=cPorActivar);
      if gbDatosPag.Enabled
      then iedImp_Capital.SetFocus
      else iedDias_Plazo_Renov.SetFocus;
end;

function TWInvPagare.EstableceRenovacion:Boolean;
begin EstableceRenovacion:=False;
      ValidaRenovacion;
      if cbCveRenovar.ItemIndex = 2
      then iedImp_Renovar.SetFocus;
      EstableceRenovacion:=True;
end;

procedure TWInvPagare.InterForma1Imprimir(Sender: TObject);
begin Objeto.SGCtrl.PageOrientation := poLandscape;
      Objeto.SGCtrl.Print(True,True,Objeto.Apli);
end;


procedure TWInvPagare.bbGrupoClick(Sender: TObject);
begin Objeto.Saldo.Modifica;
end;

procedure TWInvPagare.btGrupoClick(Sender: TObject);
Var SdoXGpo :TSdoXGpo;
begin if Objeto.Saldo.FOLIO_GRUPO.AsFloat = 0 then Exit;
      SdoXGpo  := TSdoXGpo.Create(Nil);
      try SdoXGpo.Apli:=Objeto.Apli;
          SdoXGpo.Grupo:=Objeto.Saldo;
          SdoXGpo.Catalogo;
      finally SdoXGpo.free;
      end;
end;

procedure TWInvPagare.InterForma1AntesNuevo(Sender: TObject;
  var Realizado: Boolean);
begin Realizado:=False;
      if SucuBloqueada(Objeto, Objeto.Sucursal, objeto.Contrato.FieldByName('ID_EMPRESA').AsString) then Exit;
      if (Objeto.Contrato.FieldByName('ID_EMPRESA').AsInteger = cInterFin) and
         (Objeto.Contrato.FieldByName('CVE_MONEDA').AsInteger = cPesos) and
         Not (PuedeOperarIFSPesos(Objeto))
      then MensajePanel('Usted no puede operar pagarés de Interfinancial en Pesos',mtError,[mbOK],0,mRespuesta)
      else begin
             Objeto.Estado:=cAltaPagare;
             Objeto.Espendiente:=False;
             Realizado:=True;
           end;
end;

procedure TWInvPagare.InterForma1AntesEliminar(Sender: TObject;
  var Realizado: Boolean);
begin Realizado:=False;
      if SucuBloqueada(Objeto, Objeto.Sucursal, objeto.Contrato.FieldByName('ID_EMPRESA').AsString) then Exit;
      Objeto.Estado:=cCancPagare;
      Objeto.Espendiente:=False;
      Realizado:=True;
end;

procedure TWInvPagare.InterForma1AntesModificar(Sender: TObject;
  var Realizado: Boolean);
begin Realizado:=False;
      if SucuBloqueada(Objeto, Objeto.Sucursal, objeto.Contrato.FieldByName('ID_EMPRESA').AsString) then Exit;
      Objeto.Estado:=cModPagare;
      Objeto.Espendiente:=False;
      Realizado:=True;
end;

procedure TWInvPagare.SGCtrl1DblClick(Sender: TObject);
begin if Objeto.qPagares.RecordCount = 0 then Exit;
      if Objeto.BuscaObjeto then
      begin
         if Objeto.TASA_INFLAC.AsString <> '' then
         begin
           iedGATNom.Text:= Objeto.TASA_BRUTA.AsString;
           iedGATReal.Text:= FloatToStr(Objeto.TASA_BRUTA.AsFloat-Objeto.TASA_INFLAC.AsFloat);
         end;
      end;
end;

procedure TWInvPagare.InterForma1Modificar(Sender: TObject;
  var Realizado: Boolean);
begin if Not((Objeto.CVE_SIT_PAGARE.AsString = cActivo) or
             (Objeto.CVE_SIT_PAGARE.AsString = cPorActivar))
      then begin
             Realizado:=False;
             MensajePanel('Solo puede modificar pagarés activos o por activar',mtError,[mbOK],0,mRespuesta)
           end
      else begin
             Realizado:=False;
             Objeto.Edit;
             Realizado:=True;
           end;
end;

procedure TWInvPagare.Bitcora1Click(Sender: TObject);
Var InvBitaco : TInvBitaco;
begin if Objeto.qPagares.RecordCount = 0 then Exit;
      if Objeto.BuscaObjeto then
      begin
         InvBitaco := TInvBitaco.Create(Nil);
         try InvBitaco.GetParams(Objeto);
             InvBitaco.Pagare:=Objeto;
             InvBitaco.Catalogo;
         finally
         end;
      end;
end;

procedure TWInvPagare.Recibo1Click(Sender: TObject);
begin if Objeto.qPagares.RecordCount = 0 then Exit;
      if Objeto.BuscaObjeto then btReciboClick(Nil);
end;

procedure TWInvPagare.Vencimiento1Click(Sender: TObject);
begin if Objeto.qPagares.RecordCount = 0 then Exit;
      if Objeto.BuscaObjeto then btVencimientoClick(Nil);
end;

procedure TWInvPagare.Renovacin1Click(Sender: TObject);
begin if Objeto.qPagares.RecordCount = 0 then Exit;
      if Objeto.BuscaObjeto then btRenovacionClick(nil);
end;

procedure TWInvPagare.bbRefrescarClick(Sender: TObject);
begin Objeto.RefrescaGrid;
      Objeto.BuscaObjeto;
end;

procedure TWInvPagare.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin Realizado:=False;
      if SucuBloqueada(Objeto, Objeto.Sucursal, objeto.Contrato.FieldByName('ID_EMPRESA').AsString) then Exit;
      if (Objeto.DIAS_PLAZO_RENOV.AsString <> iedDias_Plazo_Renov.Text) and (Objeto.Modo = moEdit) and (cbCveRenovar.ItemIndex <> 3)
      then begin
//             if Execute_Captura('Recaptura del plazo', 'Plazo del pagaré', StrToFloat(iedDias_Plazo_Renov.Text), -1, taNinguno, Objeto.Apli, iedDias_Plazo_Renov)
             if Execute_Captura('Recaptura del plazo', 'Plazo del pagaré', StrToFloat(iedDias_Plazo_Renov.Text), -1, taNinguno, Objeto.Apli, nil)
             then Realizado:= True;
           end
      else if (Objeto.Modo = moAppend)
           then begin
//                  if Execute_Captura('Recaptura del plazo', 'Plazo del pagaré', StrToFloat(iedDias_Plazo.Text), -1, taNinguno, Objeto.Apli, iedDias_Plazo)
                  if Execute_Captura('Recaptura del plazo', 'Plazo del pagaré', StrToFloat(iedDias_Plazo.Text), -1, taNinguno, Objeto.Apli, nil)
                  then Realizado:= True;
                end
           else Realizado:= True;
      if (Objeto.Modo = moAppend) and (Realizado) then
      begin
        Realizado:= False;
//        if Execute_Captura('Recaptura del capital del pagaré', 'Importe del capital',  StrToFloat(iedImp_Capital.Text), -1, taNinguno, Objeto.Apli, iedImp_Capital)
        if Execute_Captura('Recaptura del capital del pagaré', 'Importe del capital',  StrToFloat(iedImp_Capital.Text), -1, taNinguno, Objeto.Apli, nil)
        then Realizado:=True;
      end;
end;

procedure TWInvPagare.Timer1Timer(Sender: TObject);
begin  Objeto.Contador:=Objeto.Contador+1;
       if Objeto.Contador = 3
       then begin
              Timer1.Enabled:=False;

              if Objeto.BuscaObjeto then
              begin
                 if Objeto.TASA_INFLAC.AsString <> '' then
                 begin
                    iedGATNom.Text:= Objeto.TASA_BRUTA.AsString;
                    iedGATReal.Text:= FloatToStr(Objeto.TASA_BRUTA.AsFloat-Objeto.TASA_INFLAC.AsFloat);
                 end;
              end;

              Objeto.Contador:=0;
            end
end;

procedure TWInvPagare.SGCtrl1MoveRow(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin Objeto.Contador:=0;
      Timer1.Enabled:=True;
end;

procedure TWInvPagare.Contratos1Click(Sender: TObject);
Var Contrato : TContrato;
begin Contrato := TContrato.Create(Nil);
      try Contrato.GetParams(Objeto);
          Contrato.FindKey([Objeto.Contrato.FieldByName('ID_CONTRATO').AsString]);
          Contrato.Catalogo;
      finally Contrato.Free;
      end;
end;

procedure TWInvPagare.Consulta1Click(Sender: TObject);
begin Execute_Generales(Objeto.Contrato);
end;

procedure TWInvPagare.idtpCalendaCloseUp(Sender: TObject);
begin if Objeto.F_OperaCto >= idtpCalenda.Date
      then begin
             MensajePanel('La fecha de vencimiento debe ser mayor a la fecha actual',mtError,[mbOK],0,mRespuesta);
             Objeto.DIAS_PLAZO.AsFloat:=0;
             Objeto.DIAS_PLAZO.DrawControl;
           end
      else begin
             Objeto.DIAS_PLAZO.AsFloat:=Int(idtpCalenda.Date - Objeto.F_APERTURA.AsDateTime);
           end;
end;

procedure TWInvPagare.idtpCalendaEnter(Sender: TObject);
begin idtpCalenda.Color:=clRed;
end;

procedure TWInvPagare.Movimientos1Click(Sender: TObject);
Var MovDepVis:TConTransa;
    CtoLiqui : TContrato;
begin if Objeto.ID_EMPRESA.AsInteger = cBancoNM then exit;
      MovDepVis:=TConTransa.Create(Nil);
      try MovDepVis.GetParams(Objeto);
          CtoLiqui := TContrato.Create(Nil);
          try
             CtoLiqui.GetParams(Objeto);
             if CtoLiqui.FindKey([Objeto.Contrato.FieldByName('ID_CTO_LIQ').AsString])
             then begin
                    MovDepVis.Contrato:=CtoLiqui;
                    MovDepVis.Catalogo;
                  end;
          finally CtoLiqui.free;
			 end;
		finally MovDepVis.free;
		end;
end;

procedure TWInvPagare.ContratantesCtoLiquidacin1Click(Sender: TObject);
Var ConCtte  : TConCtte;
    CtoLiqui : TContrato;
begin ConCtte:=TConCtte.Create(Nil);
      CtoLiqui:= TContrato.Create(Nil);
      try
         ConCtte.GetParams(Objeto);
         CtoLiqui.GetParams(Objeto);
         if CtoLiqui.FindKey([Objeto.Contrato.FieldByName('ID_CTO_LIQ').AsString])
         then begin
                ConCtte.Contrato:= CtoLiqui;
                ConCtte.Catalogo;
              end;
      finally
         if CtoLiqui <> nil then CtoLiqui.free;
         if ConCtte <> nil then ConCtte.free;
      end;
end;

procedure TWInvPagare.ContratantesCtoInversin1Click(Sender: TObject);
Var ConCtte:TConCtte;
begin ConCtte:=TConCtte.Create(Self);
      try
        ConCtte.Apli:=Objeto.Apli;
        ConCtte.Contrato:=Objeto.Contrato;
        ConCtte.Catalogo;
      finally
         if ConCtte <> nil then ConCtte.free;
      end;
end;

procedure TWInvPagare.InterForma1DespuesAceptar(Sender: TObject);
begin gbDatosPag.Enabled:=True;
      lblSaldo.caption:='';
end;

procedure TWInvPagare.InterForma1DespuesCancelar(Sender: TObject);
begin gbDatosPag.Enabled:=True;
      lblSaldo.caption:='';
end;

procedure TWInvPagare.rgSituacionClick(Sender: TObject);
begin case rgSituacion.ItemIndex of
         0:Objeto.FiltroSitua:='';
         1:Objeto.FiltroSitua:=cActivo;
         2:Objeto.FiltroSitua:=cRenovado;
         3:Objeto.FiltroSitua:=cVencido;
         4:Objeto.FiltroSitua:=cPorActivar;
         5:Objeto.FiltroSitua:=cNoAutorizado;
      end;
      Objeto.RefrescaGrid;
      if Objeto.qPagares.RecordCount = 0
      then Objeto.Active:=False
      else begin
             Objeto.Contador:=2;
             Timer1.Enabled:=True;
           end;
end;

procedure TWInvPagare.Liquidaciones1Click(Sender: TObject);
Var DvLiqChqr : TDvLiqChqr;
begin if Objeto.ID_EMPRESA.AsInteger = cBancoNM then exit;
      DvLiqChqr := TDvLiqChqr.Create(Nil);
      try
         DvLiqChqr.GetParams(Objeto);
         DvLiqChqr.Id_Contrato:=Objeto.Contrato.FieldByName('ID_CTO_LIQ').AsInteger;
         DvLiqChqr.Importe:=SaldoDisp(Objeto.Contrato);
         DvLiqChqr.Catalogo;
      finally
         DvLiqChqr.free;
      end;
end;

procedure TWInvPagare.Depsitos1Click(Sender: TObject);
Var DVMovTes  : TDVMovTes;
    DVSolDepo : TDVSolDepo;
begin if Objeto.ID_EMPRESA.AsInteger = cBancoNM then exit;
      if Objeto.Contrato.FieldByName('ID_EMPRESA').AsInteger = cBanco
      then begin
             DVSolDepo := TDVSolDepo.Create(Nil);
             try
               DVSolDepo.GetParams(Objeto);
               DVSolDepo.id_Cto_Nuevo :=Objeto.Contrato.FieldByName('ID_CTO_LIQ').AsInteger;
               DVSolDepo.Nuevo;
             finally
               DVSolDepo.free;
             end;
           end
      else begin
             DVMovTes := TDVMovTes.Create(Nil);
             try
               DVMovTes.GetParams(Objeto);
               DVMovTes.id_Cto_Nuevo :=Objeto.Contrato.FieldByName('ID_CTO_LIQ').AsInteger;
               DVMovTes.SoloDepositos:=True;
               DVMovTes.Catalogo;
             finally
               DVMovTes.free;
             end;
           end;
end;

procedure TWInvPagare.bbDatosClick(Sender: TObject);
begin if Objeto.ID_EMPRESA.AsInteger = cBancoNM then exit;
      PopupMenu2.Popup(bbDatos.Left,200);
end;

procedure TWInvPagare.Enviarporemail1Click(Sender: TObject);
begin
      showmessage('Opción bloqueada temporalmente');
      Exit;
      imprimeRecibo(True);
end;


procedure TWInvPagare.chkMostraDatosdeCreditosClick(Sender: TObject);
begin
  With Objeto Do
    Begin
      If Assigned(FContrato) Then
        RefrescaGrid;
    End;
end;

//
// Registrar Autorizacion Pagare
//
function TInvPagare.RegistrarAutPag(pIdContrato, pIdPagare: Double): TRecRegAutPag;
var
  StpRegAutPagare: TStoredProc;
begin
    StpRegAutPagare := TStoredProc.Create(nil);
    StpRegAutPagare.DatabaseName := Apli.DataBaseName;
    StpRegAutPagare.SessionName  := Apli.SessionName;

    Try
        StpRegAutPagare.Params.Clear;
        StpRegAutPagare.StoredProcName := 'PKGINVERS.STPREGAUTPAGARE';
        StpRegAutPagare.Params.CreateParam(ftFloat,'PEIDCONTRATO',ptInput);
        StpRegAutPagare.Params.CreateParam(ftFloat,'PEIDPAGARE',ptInput);
        StpRegAutPagare.Params.CreateParam(ftFloat,'PSCODRESP',ptOutput);
        StpRegAutPagare.Params.CreateParam(ftString,'PSDESCPROCESO',ptOutput);

        StpRegAutPagare.ParamByName('PEIDCONTRATO').AsFloat := pIdContrato;
        StpRegAutPagare.ParamByName('PEIDPAGARE').AsFloat  := pIdPagare;

        StpRegAutPagare.ExecProc;

        If StpRegAutPagare.ParamByName('PSCODRESP').AsFloat <> 0 Then
          RegistrarAutPag.bRegAutPag := False
        else
          RegistrarAutPag.bRegAutPag := True;

        RegistrarAutPag.sCodResp     := StpRegAutPagare.ParamByName('PSCODRESP').AsInteger;
        RegistrarAutPag.sTxtResp     := StpRegAutPagare.ParamByName('PSDESCPROCESO').AsString;

    Finally
        If StpRegAutPagare <> Nil Then
            StpRegAutPagare.Free;
    End;
end;

procedure TWInvPagare.btAutorizarClick(Sender: TObject);
var
  sp       : TStoredProc;
  vlAutorizarPag: TRecAutorizarPag;
  vlMensaje : String;
  vlRegistro : Integer;
  sit, contrato, pagare : String;
begin

  // Autorizar el Pagare
  vlAutorizarPag := AutorizarPag(Objeto.ID_CONTRATO.AsFloat, Objeto.ID_PAGARE.AsFloat);
  if (not vlAutorizarPag.bAutorizarPag) then
  begin
     ShowMessage('Error al Autorizar el Pagaré ' + coCRLF + vlAutorizarPag.sTxtResp);
     mRespuesta.Lines.Add(vlAutorizarPag.sTxtResp);
  end
  else
  begin
    vlMensaje := 'Se Autorizó el Pagaré ' + Objeto.ID_PAGARE.AsString + ' Exitosamente.';
    ShowMessage(vlMensaje);
    mrespuesta.Lines.Add(vlMensaje);
  end;

  Objeto.RefrescaGrid;

end;

//
// Autorizar Pagare
//
function TWInvPagare.AutorizarPag(pIdContrato, pIdPagare: Double): TRecAutorizarPag;
var
  StpAutorPagare: TStoredProc;
  vlCveUsuario:   String;
begin

    vlCveUsuario := Objeto.DameUsuario;

    StpAutorPagare := TStoredProc.Create(nil);
    StpAutorPagare.DatabaseName := Objeto.Apli.DataBaseName;
    StpAutorPagare.SessionName  := Objeto.Apli.SessionName;

    Try
        StpAutorPagare.Params.Clear;
        StpAutorPagare.StoredProcName := 'PKGINVERS.STPAUTORPAGARE';
        StpAutorPagare.Params.CreateParam(ftFloat,'PEIDCONTRATO',ptInput);
        StpAutorPagare.Params.CreateParam(ftFloat,'PEIDPAGARE',ptInput);
        StpAutorPagare.Params.CreateParam(ftString,'PECVEUSUARIOAUT',ptInput);
        StpAutorPagare.Params.CreateParam(ftFloat,'PSCODRESP',ptOutput);
        StpAutorPagare.Params.CreateParam(ftString,'PSDESCPROCESO',ptOutput);

        StpAutorPagare.ParamByName('PEIDCONTRATO').AsFloat := pIdContrato;
        StpAutorPagare.ParamByName('PEIDPAGARE').AsFloat  := pIdPagare;
        StpAutorPagare.ParamByName('PECVEUSUARIOAUT').AsString := vlCveUsuario;

        StpAutorPagare.ExecProc;

        If StpAutorPagare.ParamByName('PSCODRESP').AsFloat <> 0 Then
          AutorizarPag.bAutorizarPag := False
        else
          AutorizarPag.bAutorizarPag := True;

        AutorizarPag.sCodResp     := StpAutorPagare.ParamByName('PSCODRESP').AsInteger;
        AutorizarPag.sTxtResp     := StpAutorPagare.ParamByName('PSDESCPROCESO').AsString;

    Finally
        If StpAutorPagare <> Nil Then
            StpAutorPagare.Free;
    End;
end;

procedure TWInvPagare.InterForma1DespuesShow(Sender: TObject);
var
  i : Integer;
begin
  if Objeto.ShowPagare <> '' then
  begin
    for i := Objeto.SGCtrl.sg.rowcount - 1 downto 1 do
    begin
      if Objeto.SGCTRL.cellStr['ID_PAGARE',i] = Objeto.ShowPagare then
      begin
        Objeto.SGCTRL.SG.Row := i;
        Objeto.BuscaObjeto;
      end;
    end;
  end;
end;

function TWInvPagare.TasaInflacion:Double;
var
    sSQL :String;
begin
   sSQL:= ' SELECT TASA_INFLAC FROM INV_TASA_INFLAC ' +
          ' WHERE ROWNUM = 1 ' +
          ' ORDER BY ANO_MES DESC ';

   If Trim(sSQL) <> '' Then Begin
      vlQry := GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True);
      Try
         If vlQry <> Nil Then Begin
            TasaInflacion:= vlQry.FieldByName('TASA_INFLAC').AsFloat;
         End;
      Finally
         If vlQry <> Nil Then
            vlQry.free;
      End;
   End;
end;

procedure TWInvPagare.iedTASA_INFLACExit(Sender: TObject);
begin
   Objeto.TASA_INFLAC.AsFloat:= StrtoFloat(iedTASA_INFLAC.Text);
   iedGATReal.Text:= FloatToStr(Objeto.TASA_BRUTA.AsFloat-Objeto.TASA_INFLAC.AsFloat);
end;

end.
