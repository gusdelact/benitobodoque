// Sistema         : Clase de CRCONSULTA
// Fecha de Inicio : 13/04/2004
// Función forma   : Clase de CRCONSULTA
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrFndCons;
                                    
interface         

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Tabs, Grids, DBGrids,
InterApl, IntCtoPanel, IntCtoHeader, IntGenCre, ImgList, Menus,

IntParamCre;   // Objeto de Parametros

const
//   CO_A_SITUACION : Array [0..5] of String = ('',CSIT_AC, CSIT_LQ, CSIT_PA, CSIT_CA, CSIT_NA);
   CO_A_SITUACION : Array [0..4] of String = ('',CSIT_AC, CSIT_LQ, CSIT_PA, CSIT_CA);
   CO_A_LBL_DOCTO : Array[0..9] of String = ('','','','Nominal','Aforado','Remanente','Compra','Interés','Pagado','Vencido');

   CO_WORDIMP = 'Importe';
   CO_WORDIVA = 'IVA';
   CO_WORDSUB = 'Subtotal';
   CO_WORDTOT = 'Total';
   CO_WORDPDO = 'Periodo ';
   CO_WORDTPD = 'Tot. Per.';
{EASA4011       02112005
   CO_CAP_OCULTAR = '<<';
   CO_WIDTH_1_BTN = 22;
   CO_LEFT_1_BTN = 150;
   CO_CAP_MOSTRAR = 'Mostrar Capital >>';
   CO_WIDTH_2_BTN = 171;
   CO_LEFT_2_BTN = 0;
OFF EASA}
   CO_DEBE_ESTAR_ACTIVO = 'Para realizar la prórroga, debe de encontrarse el registro "Activo" ó "Por Activar".';

   CO_CHECKED   = 'V';
   CO_UNCHECKED = 'F';
   CO_NOTCHECK  = '-';

   CO_ROWSEP = 5;
   CO_ROWSEP2 = 1;
   CO_WIDTH_FECHA  = 64;
   CO_WIDTH_DINERO = 74;
   CO_WIDTH_DINERO2= 60;
   CO_WIDTH_DINERO3= 100;

   CO_COL1 = 0;
   CO_COL2 = CO_COL1 + 1;
   CO_COL3 = CO_COL2 + 1; // Se ocupa para la Situacion
   CO_COL4 = CO_COL3 + 1; // Num_Periodo únicamente para Interés
   CO_COL5 = CO_COL4 + 1; // Fecha de Vencimiemto únicamente para Interés

   CO_ERROR     = 'ERR';  // Mensaje de Error
   CO_CORTE     = 'COR';  // Corte de Periodo
   CO_CORTE1    = 'COR1'; // Corte 1 de Periodo ( Se usa para la descrpcion de la comisión )
   CO_DETALLE   = 'DET';  // Detalle
   CO_SUBTOTAL  = 'SUB';  // Subtotal
   CO_TOTAL     = 'TOT';  // Total
   CO_SEPARADOR = 'SEP';  // Separador

  { INICIO Constantes Capital }
   //HERJA
   CO_CAP_ENT_DESC          = CO_COL3 + 1;
   CO_CAP_PROG              = CO_COL3 + 2;
   //FIN HERJA

   CO_CAP_NUM_PERIODO       = CO_COL3 + 3; //1;
   CO_CAP_F_VENCIMIENTO     = CO_COL3 + 4; //2;
   CO_CAP_F_PROG_PAGO       = CO_COL3 + 5; //3;
   CO_CAP_F_PAGO            = CO_COL3 + 6; //4;

   CO_CAP_TITULO            = CO_COL3 + 7; //5;

   CO_CAP_IMP_CAPITAL       = CO_COL3 + 8; //6;
   CO_CAP_IMP_PAGADO        = CO_COL3 + 9; //7;
   CO_CAP_SIT_CAPITAL       = CO_COL3 + 10; //8;

  { FIN Constantes Capital }


  { INICIO Constantes Interés }
   //HERJA
   CO_INT_ENT_DESC          = CO_COL5 + 1;
   CO_INT_PROG              = CO_COL5 + 2;
   //FIN HERJA

   CO_INT_NUM_PERIODO       = CO_COL5 + 3; //1;

   CO_INT_F_VENCIMIENTO     = CO_COL5 + 4; //2;
   CO_INT_F_PROG_PAGO       = CO_COL5 + 5; //3;
   CO_INT_F_PAGO            = CO_COL5 + 6; //4;

   CO_INT_TITULO            = CO_COL5 + 7; //5;

   CO_INT_IMP_INTERES       = CO_COL5 + 8; //6;
   CO_INT_IMP_PAGADO        = CO_COL5 + 9; //7;

   CO_INT_IMP_IVA           = CO_COL5 + 8; //6;
   CO_INT_IMP_IVA_PAGADO    = CO_COL5 + 9; //7;

   CO_INT_B_FINANC          = CO_COL5 + 10; //8;

   CO_INT_SIT_INTERES       = CO_COL5 + 11; //9;

  { FIN Constantes Interés }

  { INICIO Constantes Capital Adicional }
   CO_CAP2_IMP_CAPITAL      = CO_COL3 + 1;
   CO_CAP2_F_VENCIMIENTO    = CO_COL3 + 2;
  { INICIO Constantes Capital Adicional }

  { INICIO Constantes Comisión }
   //HERJA
   CO_COM_ENT_DESC          = CO_COL3 + 1;
   CO_COM_PROG              = CO_COL3 + 2;
   //FIN HERJA

   CO_COM_NUM_PERIODO      = CO_COL3 + 3; //1;
   CO_COM_DESC_COMISION    = CO_COL3 + 3; //1;

   CO_COM_F_VENCIMIENTO    = CO_COL3 + 4; //2;
   CO_COM_F_PROG_PAGO      = CO_COL3 + 5; //3;
   CO_COM_F_PAGO           = CO_COL3 + 6; //4;

   CO_COM_TITULO           = CO_COL3 + 7; //5;

   CO_COM_IMP_COMISION     = CO_COL3 + 8; //6;
   CO_COM_IMP_PAGADO       = CO_COL3 + 9; //7;

   CO_COM_IMP_IVA          = CO_COL3 + 8; //6;
   CO_COM_IMP_IVA_PAGADO   = CO_COL3 + 9; //7;

   CO_COM_SIT_COMISION     = CO_COL3 + 10; //8;

   CO_COM_CVE_COMISION     = CO_COL3 + 11; //9;
  { FIN Constantes Comisión }
  

  { INICIO Constantes Documentos }
   CO_DOC_ID_DOCUMENTO       = CO_COL3 + 1;
   CO_DOC_CVE_TIPO_INTERES   = CO_COL3 + 2;
   CO_DOC_F_COMPRA           = CO_COL3 + 3;
   CO_DOC_F_PROG_PAGO        = co_col3 + 4;
   CO_DOC_F_PAGO             = co_col3 + 5;

   CO_DOC_TITULO             = co_col3 + 5;

   CO_DOC_IMP_NOMINAL        = CO_COL3 + 1;
   CO_DOC_IMP_AFORADO        = CO_COL3 + 2;
   CO_DOC_IMP_REMANENTE      = CO_COL3 + 3;
   CO_DOC_IMP_COMPRA         = CO_COL3 + 4;
   CO_DOC_IMP_INTERES        = CO_COL3 + 5;
   CO_DOC_IMP_PAGADO         = CO_COL3 + 6;
   CO_DOC_IMP_VENCIDO        = CO_COL3 + 7;

   CO_DOC_SIT_DOCUMENTO      = CO_COL3 + 1;
  { FIN Constantes Documentos }



  { INICIO Constantes Financiamiento }
   //HERJA
   CO_F_ENT_DESC          = CO_COL3 + 1;
   CO_F_PROG              = CO_COL3 + 2;
   //FIN HERJA

   CO_NUM_PERIODO            = CO_COL3 + 3; //1;
   CO_F_VENCIMIENTO          = CO_COL3 + 4; //2;
   CO_F_PROG_PAGO            = CO_COL3 + 5; //3;
   CO_F_PAGO                 = CO_COL3 + 6; //4;

   CO_FIN_TITULO             = co_col3 + 7; //5;

   CO_IMP_FINAN_ADIC         = CO_COL3 + 8; //6;
   CO_IMP_PAGADO             = CO_COL3 + 9; //7;
//   CO_IMP_FINAN_VENCIDO      = CO_COL3 + 10; //8;
   CO_SIT_FINAN_ADIC         = CO_COL3 + 10; //9;
  { FIN Constantes Financiamiento }

Type
 TConsulta = (ftCapital, ftInteres, ftComision, ftDocumentos, ftFinanciamiento, ftNone);
 TArrayDouble = Array of Double;

Type
 TCrFndCons= class;

  TWCrFndCons=Class(TForm)
    InterForma1             : TInterForma;
    pgctrlConsulta: TPageControl;
    tbstSituacion: TTabSet;
    tbshtCapital: TTabSheet;
    tbshtInteres: TTabSheet;
    tbshtComision: TTabSheet;
    tbshtFinanciamiento: TTabSheet;
    PnlTitulos: TPanel;
    shp5: TShape;
    shp4: TShape;
    shp6: TShape;
    shp7: TShape;
    shp9: TShape;
    shp10: TShape;
    Shape8: TShape;
    shp8: TShape;
    Shape17: TShape;
    lblFecha: TLabel;
    lblVencimiento: TLabel;
    lblProgramado: TLabel;
    lblPago: TLabel;
    lblImpProgramado: TLabel;
    lblImpPagado: TLabel;
    lblImpCapital: TLabel;
    lblSituacion: TLabel;
    strgrdCapital: TStringGrid;
    Shape2: TShape;
    Label2: TLabel;
    strgrdInteres: TStringGrid;
    pnlTitulosInteres: TPanel;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape9: TShape;
    Shape11: TShape;
    Shape13: TShape;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lblImpInteres: TLabel;
    Shape27: TShape;
    Shape28: TShape;
    shp3: TShape;
    lblDescripcion: TLabel;
    Shape29: TShape;
    Shape30: TShape;
    Shape31: TShape;
    Shape32: TShape;
    Shape33: TShape;
    Shape35: TShape;
    Shape40: TShape;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    lblImpComision: TLabel;
    Label30: TLabel;
    strgrdComision: TStringGrid;
    icpCONTRATO: TInterCtoPanel;
    lblPeriodos: TLabel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    Label31: TLabel;
    Shape41: TShape;
    Shape42: TShape;
    Label32: TLabel;
    strgrdFinanciamiento: TStringGrid;
    Panel2: TPanel;
    Shape43: TShape;
    Shape44: TShape;
    Shape45: TShape;
    Shape46: TShape;
    Shape47: TShape;
    Shape48: TShape;
    Shape49: TShape;
    Shape51: TShape;
    Shape52: TShape;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Panel3: TPanel;
    btnRefrescar: TBitBtn;
    btnExcellSelected: TBitBtn;
    btnExcellAll: TBitBtn;
    Shape1: TShape;
    Label1: TLabel;
    shpLiquidados: TShape;
    lblLiquidados: TLabel;
    lblActivos: TLabel;
    shpActivos: TShape;
    lblNoAutorizados: TLabel;
    shpNoAutorizados: TShape;
    lblCancelados: TLabel;
    shpCancelados: TShape;
    shp17: TShape;
    Label10: TLabel;
    Shape56: TShape;
    Shape10: TShape;
    Label9: TLabel;
    Shape12: TShape;
    Shape14: TShape;
    Label11: TLabel;
    Label12: TLabel;
    Shape15: TShape;
    Label13: TLabel;
    Shape16: TShape;
    Label14: TLabel;
    Shape18: TShape;
    Shape19: TShape;
    Label15: TLabel;
    Label16: TLabel;
    Shape20: TShape;
    Label17: TLabel;
    Label44: TLabel;
    Rorden: TRadioGroup;
    Label18: TLabel;
    tbshtDocumentos: TTabSheet;
    Label25: TLabel;
    Label26: TLabel;
    Shape21: TShape;
    Shape22: TShape;
    lbl4: TLabel;
    Shape23: TShape;
    Label27: TLabel;
    Label28: TLabel;
    Shape24: TShape;
    lbl1: TLabel;
    Shape25: TShape;
    lbl2: TLabel;
    lbl3: TLabel;
    Shape26: TShape;
    Label29: TLabel;
    Shape34: TShape;
    Shape36: TShape;
    Shape37: TShape;
    Shape38: TShape;
    Label39: TLabel;
    Shape39: TShape;
    Label42: TLabel;
    Label43: TLabel;
    Shape50: TShape;
    strgrdDocumentos1: TStringGrid;
    strgrdDocumentos2: TStringGrid;
    strgrdDocumentos3: TStringGrid;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure btnRefrescarClick(Sender: TObject);
    procedure pgctrlConsultaChange(Sender: TObject);
    procedure tbstSituacionChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure strgrdCapitalDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure strgrdDocumentos1SelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure strgrdCapitalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgrdInteresSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure strgrdInteresTopLeftChanged(Sender: TObject);
    procedure RordenClick(Sender: TObject);
    private
    { Private declarations }
     vg_Credito : Integer;
     vg_bMuestraIva : Boolean;
     vgGrid : TStringGrid;

     function Get_SituacionActual : String;
     procedure Set_SituacionActual(pValor : String);

     function Get_ConsultaActual : TConsulta;
     procedure Set_ConsultaActual(pValor : TConsulta);

     procedure Set_Credito(pValor : Integer);


     procedure MuestraCapital(pID_CREDITO : Integer; pSIT_CREDITO : String);
     procedure MuestraInteres(pID_CREDITO : Integer; pSIT_CREDITO : String);
     procedure MuestraComision(pID_CREDITO : Integer; pSIT_CREDITO : String);
     procedure MuestraFinanciamiento(pID_CREDITO : Integer; pSIT_CREDITO : String);
     procedure MuestraDocumentos(pID_CESION : Integer; pSIT_DOCUMENTO : String);
     procedure Mostrar(pstrSituacion  : String);
     procedure MostrarTotalPeriodos(pStrSituacion : String);
     procedure MostrarPaginaError;

     procedure MuestraTabuladores(pID_CREDITO : Integer);
     procedure IniciaError(var StrGrd : TStringGrid);
     procedure AgregaEspacioParaTotales( var StrGrd : TStringGrid; var nRow : Integer; nColTitulo : Integer);
     procedure CalculaTotales(var StrGrd : TStringGrid; nRowTotales : Integer; const AColumnasTotales : Array of Integer );

    public
    { Public declarations }
    Objeto : TCrFndCons;
    published
    { Published daclarations }
     property SituacionActual : String Read Get_SituacionActual Write Set_SituacionActual;
     property ConsultaActual : TConsulta Read Get_ConsultaActual Write Set_ConsultaActual;
     property Credito : Integer Read vg_Credito Write Set_Credito;
    end;

 TCrFndCons= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ParamCre                     : TParamCre;
        Contrato                     : TCtrlCto;
        Opcion                       : TConsulta;

        ID_CREDITO                   : TInterCampo;
        NUM_PERIODO                  : TInterCampo;
        SIT_CREDITO                  : TInterCampo;

        //HERJA
        CVE_FND_ENT_DES              : TInterCampo;
        CVE_FND_PROGRAMA             : TInterCampo;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;

function Consulta_Credito(pOpcion : TConsulta; pID_CREDITO, pNUM_PERIODO : Integer;
                  pSIT_CREDITO, pCVE : String; pApli : TInterApli; pParamCre : TParamCre) : TModalResult;

implementation
{$R *.DFM}


function Consulta_Credito(pOpcion : TConsulta; pID_CREDITO, pNUM_PERIODO : Integer;
                  pSIT_CREDITO, pCVE : String; pApli : TInterApli; pParamCre : TParamCre) : TModalResult;
var Crconsult : TCrFndCons;
begin
  Crconsult := TCrFndCons.Create(Nil);
  Crconsult.Apli := pApli;
  Crconsult.ParamCre := pParamCre;
  Crconsult.ID_CREDITO.AsInteger  := pID_CREDITO;
  Crconsult.NUM_PERIODO.AsInteger := pNUM_PERIODO;
  Crconsult.SIT_CREDITO.AsString  := pSIT_CREDITO;
  Crconsult.Opcion := pOpcion;
  Crconsult.ShowWindow(ftConsulta);
end;


constructor TCrFndCons.Create( AOwner : TComponent );
begin Inherited;
  ID_CREDITO    := CreaCampo('ID_CREDITO',ftInteger,tsNinguno,tsNinguno,False);
  NUM_PERIODO   := CreaCampo('NUM_PERIODO',ftInteger,tsNinguno,tsNinguno,False);
  SIT_CREDITO   := CreaCampo('SIT_CREDITO',ftString,tsNinguno,tsNinguno,False);

  //HERJA
  CVE_FND_ENT_DES   := CreaCampo('CVE_FND_ENT_DES',ftString,tsNinguno,tsNinguno,False);
  CVE_FND_PROGRAMA  := CreaCampo('CVE_FND_PROGRAMA',ftString,tsNinguno,tsNinguno,False);

  Contrato := TCtrlCto.Create(Self);
  Contrato.MasterSource := Self;
  Contrato.ID_CONTRATO.MasterField := 'ID_CONTRATO';

  { Inicializa Valores }
  ID_CREDITO.AsInteger  := -1;
  NUM_PERIODO.AsInteger := -1;
  SIT_CREDITO.AsString  := '';
  //HERJA
  CVE_FND_ENT_DES.AsString   := '';
  CVE_FND_PROGRAMA.AsString  := '';
end;

Destructor TCrFndCons.Destroy;
begin inherited;
end;

function TCrFndCons.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrFndCons;
begin
   W:=TWCrFndCons.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftConsulta; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;

      W.Credito            := W.Objeto.ID_CREDITO.AsInteger;
      W.SituacionActual    := W.Objeto.SIT_CREDITO.AsString;
      W.ConsultaActual     := W.Objeto.Opcion;
      W.btnRefrescarClick(Self);

      // Si llegase a no mostrarse la consulta que solicito el usuario
      // debido a que las banderas de CR_PRODUCTO no lo permiten mostrar entonces
      // Muestra la página de Error
      If (W.ConsultaActual <> W.Objeto.Opcion) Then
        W.MostrarPaginaError;

      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrFndCons.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrconsu.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

(***********************************************FORMA CRCONSULTA********************)
(*                                                                              *)
(*  FORMA DE CRCONSULTA                                                            *)
(*                                                                              *)
(***********************************************FORMA CRCONSULTA********************)

procedure TWCrFndCons.FormShow(Sender: TObject);
begin
 With Objeto Do
  Begin
  icpCONTRATO.Frame := Contrato;

  lbDempresa.Caption := ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := ParamCre.FECHA.AsString;
  lbDUsuario.Caption := ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := ParamCre.PERFIL.AsString;
  End;
end;

procedure TWCrFndCons.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

{ ******** Declaración de Propiedades ******** }

procedure TWCrFndCons.Set_Credito(pValor : Integer);
begin
 If (pValor <> vg_Credito) Then
  Begin
  vg_Credito := pValor;
  Objeto.Contrato.FindKey([Obten_Contrato(vg_Credito, Objeto.Apli)]);
  icpCONTRATO.RefrescaInfo;
  End;
end;    

function TWCrFndCons.Get_SituacionActual : String;
begin
 Result := CO_A_SITUACION[tbstSituacion.TabIndex];
end;

procedure TWCrFndCons.Set_SituacionActual(pValor : String);
var I : Integer;
begin
 If (pValor <> SituacionActual) Then
   For I := 0 To High(CO_A_SITUACION) Do
    If pValor = CO_A_SITUACION[I] Then
     Begin
     tbstSituacion.TabIndex := I;
     Break;
     End;
end;

function TWCrFndCons.Get_ConsultaActual : TConsulta;
begin
  Case pgctrlConsulta.ActivePageIndex Of
    0 : Result := ftCapital;
    1 : Result := ftInteres;
    2 : Result := ftComision;
    3 : Result := ftDocumentos;
    4 : Result := ftFinanciamiento;
   Else
    Result := ftNone;
  End;
end;

procedure TWCrFndCons.Set_ConsultaActual(pValor : TConsulta);
begin
 If (ConsultaActual <> pValor) Then
  Case pValor Of
    ftCapital        : pgctrlConsulta.ActivePageIndex := 0;
    ftInteres        : pgctrlConsulta.ActivePageIndex := 1;
    ftComision       : pgctrlConsulta.ActivePageIndex := 2;
    ftDocumentos     : pgctrlConsulta.ActivePageIndex := 3;
    ftFinanciamiento : pgctrlConsulta.ActivePageIndex := 4;
    ftNone           : pgctrlConsulta.ActivePageIndex := 5;
  End;
end;

{ Procedimientos }

procedure TWCrFndCons.MuestraCapital(pID_CREDITO : Integer; pSIT_CREDITO : String);
var vlstrSQL : String;
    vlQry : TQuery;
    nRow : Integer;
    nWidthColPeriodo : Integer;
begin
 vlstrSQL := 'SELECT * FROM CR_FND_CAPITAL WHERE ID_CREDITO = '+IntToStr(pID_CREDITO);
 If (Trim(pSIT_CREDITO) <> '') Then
  vlstrSQL :=  vlstrSQL + ' AND SIT_CAPITAL = '+SQLSTR(pSIT_CREDITO);

 if Rorden.ItemIndex=0 then
 begin
    vlstrSQL :=   vlstrSQL + ' ORDER BY CVE_FND_ENT_DES, CVE_FND_PROGRAMA,'; //HERJA
    vlstrSQL :=   vlstrSQL + ' F_VENCIMIENTO, NUM_PERIODO';
 end;
 if Rorden.ItemIndex=1 then
 begin
    vlstrSQL :=   vlstrSQL + ' ORDER BY F_VENCIMIENTO, NUM_PERIODO';
 end;

 vlQry := GetSQLQuery(vlstrSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
 ClearGrid(strgrdCapital,0);

 // El Capital nunca tiene IVA ROIM748  el 27/04/2004
 vg_bMuestraIva := False;

 // Mueve el Panel para ocultar el titulo de la coumna Pdo. de Color Amarillo
 If (vg_bMuestraIva) Then
  Begin
     PnlTitulos.Left := 135; //4;
     nWidthColPeriodo := 0; End
 Else
  Begin
     PnlTitulos.Left := 135; //28;
     nWidthColPeriodo := 24;
  End;

  With strgrdCapital Do
   Begin
   RowHeights[0] := DefaultRowHeight;
   RowCount := 1;   //  DESCRIPCION DE LAS COLUMNAS
   ColCount := 18;
   RowCount := 9999;

   ColWidths[CO_COL1 ] := 0;
   ColWidths[CO_COL2 ] := 0;
   ColWidths[CO_COL3 ] := 0;
   //HERJA
   ColWidths[CO_CAP_ENT_DESC            ] := 70;
   ColWidths[CO_CAP_PROG                ] := 32;
   //
   ColWidths[CO_CAP_NUM_PERIODO       ] := nWidthColPeriodo;  // Indica el Número de Periodo
   ColWidths[CO_CAP_F_VENCIMIENTO     ] := CO_WIDTH_FECHA;     // Fecha de Vencimiento
   ColWidths[CO_CAP_F_PROG_PAGO       ] := CO_WIDTH_FECHA;     // Fecha Programada
   ColWidths[CO_CAP_F_PAGO            ] := CO_WIDTH_FECHA;     // Fecha de Pago
   ColWidths[CO_CAP_TITULO            ] := 30;                 // Titulos de (IMPORTE, IVA, TOTAL) unicamente se muestra si Aplica IVA
   ColWidths[CO_CAP_IMP_CAPITAL       ] := CO_WIDTH_DINERO;    // Importe de Capital Programado
   ColWidths[CO_CAP_IMP_PAGADO        ] := CO_WIDTH_DINERO;    // Importe de Capital Pagado
   ColWidths[CO_CAP_SIT_CAPITAL       ] := 35;                // Situación
   End;

 nRow := 0;
 IniciaError(strgrdCapital);

  If Assigned(vlQry) Then
   With strgrdCapital, vlQry Do
     While Not vlQry.Eof Do
      Begin
      // Si Muestra el Iva entonces...
      If (vg_bMuestraIva) Then
       Begin
       // Coloca Identificador de Periodo
       Cells[CO_COL1, nRow] := CO_CORTE;                                          // Identificador de Corte
       Cells[CO_COL2, nRow] := CO_WORDPDO + FieldByName('NUM_PERIODO').AsString;  // Identificador de Periodo
       Cells[CO_COL3, nRow] := FieldByName('SIT_CAPITAL').AsString;               // Identificador de Situación
       Inc(nRow);
       End;

      Cells[CO_COL1, nRow] := CO_DETALLE;                           // Identificador de Corte
      Cells[CO_COL2, nRow] := FieldByName('NUM_PERIODO').AsString;  // Identificador de Periodo
      Cells[CO_COL3, nRow] := FieldByName('SIT_CAPITAL').AsString;  // Identificador de Situación

      // LLena registros

      //HERJA
      Cells[CO_CAP_ENT_DESC,nRow] := FieldByName('CVE_FND_ENT_DES').AsString;
      Cells[CO_CAP_PROG,nRow] := FieldByName('CVE_FND_PROGRAMA').AsString;
      //
      Cells[CO_CAP_NUM_PERIODO,nRow] := FieldByName('NUM_PERIODO').AsString;
      If (FieldByName('F_VENCIMIENTO').AsDateTime > 0) Then Cells[CO_CAP_F_VENCIMIENTO   ,nRow] := FormatDateTime(CFORMAT_FECHA,FieldByName('F_VENCIMIENTO').AsDateTime);
      If (FieldByName('F_PROG_PAGO').AsDateTime > 0)   Then Cells[CO_CAP_F_PROG_PAGO     ,nRow] := FormatDateTime(CFORMAT_FECHA,FieldByName('F_PROG_PAGO').AsDateTime);
      If (FieldByName('F_PAGO').AsDateTime > 0)        Then Cells[CO_CAP_F_PAGO          ,nRow] := FormatDateTime(CFORMAT_FECHA,FieldByName('F_PAGO').AsDateTime);

      Cells[CO_CAP_TITULO          ,nRow] := CO_WORDIMP;
      Cells[CO_CAP_IMP_CAPITAL     ,nRow] := Format(CFORMAT_DINERO,[FieldByName('IMP_CAPITAL').AsFloat]);
      Cells[CO_CAP_IMP_PAGADO      ,nRow] := Format(CFORMAT_DINERO,[FieldByName('IMP_PAGADO').AsFloat]);
      Cells[CO_CAP_SIT_CAPITAL    , nRow] := FieldByName('SIT_CAPITAL').AsString;  // Identificador de Situación

      If (vg_bMuestraIva) Then
        Begin
        // Agrega los Importes de IVA
        Inc(nRow);

        Cells[CO_COL1, nRow] := CO_DETALLE; // Identificador de Detalle
        Cells[CO_COL2, nRow] := FieldByName('NUM_PERIODO').AsString;  // Identificador de Periodo
        Cells[CO_COL3, nRow] := FieldByName('SIT_CAPITAL').AsString;  // Identificador de Situación
        Cells[CO_CAP_TITULO,nRow]          := CO_WORDIVA;

        // Pequeño Renglon Separador;
        Inc(nRow);
        Cells[CO_COL1, nRow] := CO_SEPARADOR; // Identificador de Separador
        RowHeights[nRow] := CO_ROWSEP;

        // Agrega los Totales
        Inc(nRow);
        Cells[CO_COL1, nRow] := CO_SUBTOTAL; // Identificador de Subtotal
        Cells[CO_COL2, nRow] := FieldByName('NUM_PERIODO').AsString;  // Identificador de Periodo
        Cells[CO_COL3, nRow] := FieldByName('SIT_CAPITAL').AsString;  // Identificador de Situación
        Cells[CO_CAP_TITULO,nRow] := CO_WORDSUB;

        Cells[CO_CAP_IMP_CAPITAL    , nRow] := Format(CFORMAT_DINERO,[FieldByName('IMP_CAPITAL').AsFloat]);
        Cells[CO_CAP_IMP_PAGADO     , nRow] := Format(CFORMAT_DINERO,[FieldByName('IMP_PAGADO').AsFloat]);

        End;

      Inc(nRow);
      Next;
      End;

 // Ajusta el tamaño del Grid a la cantidad de Resultados Mostrados
 If (nRow = 0) Then strgrdCapital.RowCount := 1
 Else
  Begin
  // Agrega Pequeño Renglon Separador;
  AgregaEspacioParaTotales(strgrdCapital, nRow, CO_CAP_TITULO);
  CalculaTotales( strgrdCapital, nRow,
                  [CO_CAP_IMP_CAPITAL,  CO_CAP_IMP_PAGADO ] ); // Calcula los Totales
  strgrdCapital.RowCount := nRow + 1;
  End;

 strgrdCapital.Left := 0;
 If Assigned(vlQry) Then vlQry.Free;
end;


procedure TWCrFndCons.MuestraInteres(pID_CREDITO : Integer; pSIT_CREDITO : String);

    procedure AgregaRegistroInteres(Qry : TQuery; var nRow : Integer);
    Var nRowTemp : Integer;
    begin
      With strgrdInteres, Qry Do
       Begin
          nRowTemp := nRow;
          If (vg_bMuestraIva) Then
           Begin
           // Coloca Identificador de Periodo
           Cells[CO_COL1,nRow] := CO_CORTE;
           Cells[CO_COL2,nRow] := CO_WORDPDO + FieldByName('NUM_PERIODO').AsString;
           Cells[CO_COL3,nRow] := FieldByName('SIT_INTERES').AsString;
           Cells[CO_COL4,nRow] := FieldByName('NUM_PERIODO').AsString;
           Cells[CO_COL5,nRow] := FieldByName('F_VENCIMIENTO').AsString;
           Inc(nRow);
           End;

          Cells[CO_COL1,nRow] := CO_DETALLE;
          Cells[CO_COL2,nRow] := FieldByName('NUM_PERIODO').AsString;
          Cells[CO_COL3,nRow] := FieldByName('SIT_INTERES').AsString;
          Cells[CO_COL4,nRow] := FieldByName('NUM_PERIODO').AsString;
          Cells[CO_COL5,nRow] := FieldByName('F_VENCIMIENTO').AsString;

          //HERJA
          Cells[CO_INT_ENT_DESC,nRow] := FieldByName('CVE_FND_ENT_DES').AsString;
          Cells[CO_INT_PROG,nRow] := FieldByName('CVE_FND_PROGRAMA').AsString;
          //

          Cells[CO_INT_NUM_PERIODO,nRow] := FieldByName('NUM_PERIODO').AsString;

          If (FieldByName('F_VENCIMIENTO').AsDateTime > 0) Then Cells[CO_INT_F_VENCIMIENTO ,nRow] := FormatDateTime(CFORMAT_FECHA,FieldByName('F_VENCIMIENTO').AsDateTime);
          If (FieldByName('F_PROG_PAGO').AsDateTime > 0)   Then Cells[CO_INT_F_PROG_PAGO   ,nRow] := FormatDateTime(CFORMAT_FECHA,FieldByName('F_PROG_PAGO').AsDateTime);
          If (FieldByName('F_PAGO').AsDateTime > 0)        Then Cells[CO_INT_F_PAGO        ,nRow] := FormatDateTime(CFORMAT_FECHA,FieldByName('F_PAGO').AsDateTime);

          Cells[CO_INT_TITULO,nRow]      := CO_WORDIMP;
          Cells[CO_INT_IMP_INTERES,nRow] := Format(CFORMAT_DINERO,[FieldByName('IMP_INTERES').AsFloat]);
          Cells[CO_INT_IMP_PAGADO,nRow]  := Format(CFORMAT_DINERO,[FieldByName('IMP_PAGADO').AsFloat]);

          if FieldByName('B_FINAN_ADIC').AsString = '' then
             Cells[CO_INT_B_FINANC,nRow] := 'F'
          else
             Cells[CO_INT_B_FINANC,nRow] := FieldByName('B_FINAN_ADIC').AsString;

          Cells[CO_INT_SIT_INTERES,nRow] := FieldByName('SIT_INTERES').AsString;
    end;
       Inc(nRow);
    end;

    procedure AgregaRegVacio(pStrGrd : TStringGrid; nRow : Integer);
    begin
       With (pStrGrd) Do
         If vg_bMuestraIva Then
           Begin
           Cells[CO_COL1,nRow+3] := CO_SEPARADOR;
           RowHeights[nRow+3]    := CO_ROWSEP;
           End;
    end;

var vlstrSQL : String;
    vlQryI, vlQryK : TQuery;
    nRow, nRowTemp, nWidthColPeriodo, nWidthColFinanciamiento : Integer;
begin
 { Inicializa Query de Interés }
 vlstrSQL := 'SELECT * FROM CR_FND_INTERES WHERE ID_CREDITO = '+IntToStr(pID_CREDITO);
 If (Trim(pSIT_CREDITO) <> '') Then
  vlstrSQL :=  vlstrSQL + ' AND SIT_INTERES = '+SQLSTR(pSIT_CREDITO);
 if Rorden.ItemIndex=0 then
 begin
    vlstrSQL :=   vlstrSQL + ' ORDER BY CVE_FND_ENT_DES, CVE_FND_PROGRAMA,'; //HERJA
    vlstrSQL :=   vlstrSQL + ' F_VENCIMIENTO, NUM_PERIODO';
 end;
 if Rorden.ItemIndex=1 then
 begin
    vlstrSQL :=   vlstrSQL + ' ORDER BY F_VENCIMIENTO, NUM_PERIODO';
 end;                            
 vlQryI := GetSQLQuery(vlstrSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);

 { Inicializa Query de Capital }
 vlstrSQL := 'SELECT * FROM CR_FND_CAPITAL WHERE ID_CREDITO = '+IntToStr(pID_CREDITO);
 If (Trim(pSIT_CREDITO) <> '') Then
  vlstrSQL :=  vlstrSQL + ' AND SIT_CAPITAL = '+SQLSTR(pSIT_CREDITO);
 if Rorden.ItemIndex=0 then
 begin
    vlstrSQL :=   vlstrSQL + ' ORDER BY CVE_FND_ENT_DES, CVE_FND_PROGRAMA,'; //HERJA
    vlstrSQL :=   vlstrSQL + ' F_VENCIMIENTO, NUM_PERIODO';
 end;
 if Rorden.ItemIndex=1 then
 begin
    vlstrSQL :=   vlstrSQL + ' ORDER BY F_VENCIMIENTO, NUM_PERIODO';
 end;
 vlQryK := GetSQLQuery(vlstrSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);

 vg_bMuestraIva := False;

 { Limpia los GRIDS }
 ClearGrid(strgrdInteres,0);

 { Recorre los Titulos Amarillos de la Forma }
 If (vg_bMuestraIva) Then
  Begin
     PnlTitulos.Left := 130; //4;
     nWidthColPeriodo := 0; End
 Else
  Begin
     PnlTitulos.Left := 130; //28;
     nWidthColPeriodo := 24;
  End;

 { Aplica Financiamiento }
{ If (tbshtFinanciamiento.TabVisible) Then
  Begin PanelSituacion.Left := 526; nWidthColFinanciamiento := 60; End
 Else
  Begin PanelSituacion.Left := 464; nWidthColFinanciamiento := 0; End;
 }
 { Inicializa las columnas del GRID de Interés }
 With strgrdInteres Do
  Begin
  RowHeights[0] := DefaultRowHeight;
  RowCount := 1;   //  DESCRIPCION DE LAS COLUMNAS
  ColCount := 17; //15;
  RowCount := 9999;

  ColWidths[CO_COL1] := 0;
  ColWidths[CO_COL2] := 0;
  ColWidths[CO_COL3] := 0;
  ColWidths[CO_COL4] := 0;
  ColWidths[CO_COL5] := 0;
   //HERJA
  ColWidths[CO_INT_ENT_DESC            ] := 70;
  ColWidths[CO_INT_PROG                ] := 32;
   //
  ColWidths[CO_INT_NUM_PERIODO    ] := nWidthColPeriodo;
  ColWidths[CO_INT_F_VENCIMIENTO  ] := CO_WIDTH_FECHA;     // Fecha de Vencimiento
  ColWidths[CO_INT_F_PROG_PAGO    ] := CO_WIDTH_FECHA;     // Fecha Programada
  ColWidths[CO_INT_F_PAGO         ] := CO_WIDTH_FECHA;     // Fecha de Pago
  ColWidths[CO_INT_TITULO         ] := 42;                // Titulos de (IMPORTE, IVA, TOTAL) unicamente se muestra si Aplica IVA
  ColWidths[CO_INT_IMP_INTERES    ] := CO_WIDTH_DINERO;    // Importe de Interes Programado
  ColWidths[CO_INT_IMP_PAGADO     ] := CO_WIDTH_DINERO;    // Importe de Interes Pagado
  ColWidths[CO_INT_B_FINANC       ] := 33;
  ColWidths[CO_INT_SIT_INTERES    ] := 35;                // Situación
  End;

 nRow := 0;
 IniciaError(strgrdInteres);

 // Agrega los registros a los Grids
 If (Assigned(vlQryI)) And (Assigned(vlQryK)) Then
   While Not vlQryI.Eof Do
     Begin

     If (vlQryI.FieldByName('F_VENCIMIENTO').AsDateTime
             = vlQryK.FieldByName('F_VENCIMIENTO').AsDateTime) Then
         Begin
            nRowTemp := nRow;
            AgregaRegistroInteres(vlQryI, nRow);
            vlQryK.Next;
         End
      Else If (vlQryI.FieldByName('F_VENCIMIENTO').AsDateTime
                < vlQryK.FieldByName('F_VENCIMIENTO').AsDateTime) Then
         Begin
            AgregaRegistroInteres(vlQryI, nRow);
         End
      Else If (vlQryI.FieldByName('F_VENCIMIENTO').AsDateTime
                > vlQryK.FieldByName('F_VENCIMIENTO').AsDateTime) Then
         Begin
            AgregaRegVacio(StrGrdInteres, nRow);
            AgregaRegistroInteres(vlQryI, nRow);
            vlQryK.Next;
         End;

     vlQryI.Next;
     End;

 // Avanza el último periodo de Capital
 nRowTemp := nRow - 1;
// vlQryK.Next;
 // Ajusta el tamaño del Grid a la cantidad de Resultados Mostrados
 If (nRow = 0) Then strgrdInteres.RowCount := 1
 Else
  Begin
  nRowTemp := nRow;
  AgregaEspacioParaTotales(strgrdInteres, nRow, CO_INT_TITULO);
  CalculaTotales( strgrdInteres, nRow,
                  [CO_INT_IMP_INTERES,  CO_INT_IMP_PAGADO ] ); // Calcula los Totales
  strgrdInteres.RowCount := nRow + 1;

  End;

 strgrdInteres.Left:=0;

 If Assigned(vlQryI) Then vlQryI.Free;
 If Assigned(vlQryK) Then vlQryK.Free;
end;


procedure TWCrFndCons.MuestraComision(pID_CREDITO : Integer; pSIT_CREDITO : String);
var vlstrSQL, strSIT_COMISION, strCVE_COMISION : String;
    vlQry : TQuery;
    nRow, nPeriodoActual : Integer;
    bPrimero : Boolean;
    vldTotImpProgramado ,  vldTotImpPagado  ,  vldTotImpVencido  ,
    vldImpProgramado  ,    vldImpPagado      ,    vldImpVencido    : Double;
begin
 vlstrSQL := ' SELECT NVL(CA.DESC_COMISION,'+SQLStr(CERROR_CLAVE)+') AS DESC_COMISION, CO.*'+coCRLF+
             ' FROM CR_FND_COMISION CO,'+coCRLF+
             '      CR_CAT_COMISION CA'+coCRLF+
             ' WHERE CO.ID_CREDITO = '+IntToStr(pID_CREDITO)+coCRLF+
             '      AND CA.CVE_COMISION (+)= CO.CVE_COMISION'+coCRLF;
 If (Trim(pSIT_CREDITO) <> '') Then
  vlstrSQL :=  vlstrSQL + ' AND CO.SIT_COMISION = '+SQLSTR(pSIT_CREDITO);

 if Rorden.ItemIndex=0 then
 begin
    vlstrSQL :=   vlstrSQL + ' ORDER BY CO.CVE_FND_ENT_DES, CO.CVE_FND_PROGRAMA,'; //HERJA
    vlstrSQL :=   vlstrSQL + ' CO.F_VENCIMIENTO, CO.NUM_PERIODO, CO.CVE_COMISION';
 end;
 if Rorden.ItemIndex=1 then
 begin
    vlstrSQL :=   vlstrSQL + ' ORDER BY CO.F_VENCIMIENTO, CO.NUM_PERIODO, CO.CVE_COMISION';
 end;

 vlQry := GetSQLQuery(vlstrSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
 ClearGrid(strgrdComision,0);

 // La comisión siempre tendrá IVA ROIM748 el 27/04/2004
 vg_bMuestraIva := True;

 With (strgrdComision) Do
  Begin
  ColCount := 16;
  RowCount := 9999;
  ColWidths[CO_COL1] := 0;
  ColWidths[CO_COL2] := 0;
  ColWidths[CO_COL3] := 0;

   //HERJA
  ColWidths[CO_COM_ENT_DESC            ] := 70;
  ColWidths[CO_COM_PROG                ] := 32;
   //
  ColWidths[CO_COM_DESC_COMISION]    := 59;                // Descripción de la Clave
  ColWidths[CO_COM_F_VENCIMIENTO]    := CO_WIDTH_FECHA;     // Fecha de Vencimiento
  ColWidths[CO_COM_F_PROG_PAGO]      := CO_WIDTH_FECHA;     // Fecha Programada
  ColWidths[CO_COM_F_PAGO]           := CO_WIDTH_FECHA;     // Fecha de Pago
  ColWidths[CO_COM_TITULO]           := 42;                // Titulos de (IMPORTE, IVA, TOTAL) unicamente se muetsra si Aplica IVA
  ColWidths[CO_COM_IMP_COMISION]     := CO_WIDTH_DINERO;    // Importe de Comision Programado
  ColWidths[CO_COM_IMP_PAGADO]       := CO_WIDTH_DINERO;    // Importe de Comision Pagado
  ColWidths[CO_COM_SIT_COMISION]     := 17;                // Situación
  ColWidths[CO_COM_CVE_COMISION]     := 0;                // Situación
  End;

 // Inicia Totales Variables
 vldTotImpProgramado  := 0;  vldTotImpPagado  := 0;  vldTotImpVencido  := 0;

 nRow := 0; bPrimero := True; nPeriodoActual := -1;
 IniciaError(strgrdComision);

 If Assigned(vlQry) Then
   With strgrdComision, vlQry Do
      While Not vlQry.Eof Do
       Begin
         If (nPeriodoActual <> FieldByName('NUM_PERIODO').AsInteger) Then
          Begin
          // Si no es el Primer Registro entonces...
          If Not bPrimero Then
               Begin
               // Agrega un Pequeño Salto de Línea
               Inc(nRow);
               Cells[CO_COL1,nRow]  := CO_SEPARADOR;
               RowHeights[nRow]     := CO_ROWSEP;

               Inc(nRow);
               Cells[CO_COL1,nRow]  := CO_SUBTOTAL;
               Cells[CO_COL2,nRow]  := IntToStr(nPeriodoActual);
               Cells[CO_COL3,nRow]  := FieldByName('SIT_COMISION').AsString;

               //HERJA
               Cells[CO_COM_ENT_DESC,nRow] := FieldByName('CVE_FND_ENT_DES').AsString;
               Cells[CO_COM_PROG,nRow] := FieldByName('CVE_FND_PROGRAMA').AsString;
               //

               Cells[CO_COM_CVE_COMISION,nRow] := FieldByName('CVE_COMISION').AsString;
               Cells[CO_COM_TITULO,nRow]  := CO_WORDTPD;
               Cells[CO_COM_IMP_COMISION,nRow]    := Format(CFORMAT_DINERO,[vldTotImpProgramado]);
               Cells[CO_COM_IMP_PAGADO,nRow]      := Format(CFORMAT_DINERO,[vldTotImpPagado]);

               // Reinicia Totales Variables
               vldTotImpProgramado  := 0;  vldTotImpPagado  := 0;  vldTotImpVencido  := 0;
               Inc(nRow);
           End;

          // Agrega Identificador del Periodo
          bPrimero := False;
          nPeriodoActual       := FieldByName('NUM_PERIODO').AsInteger;
          Cells[CO_COL1,nRow]  := CO_CORTE;
          Cells[CO_COL2,nRow]  := CO_WORDPDO + ' ' + FieldByName('NUM_PERIODO').AsString;
          End;

         // Separador
         Inc(nRow);
         Cells[CO_COL1,nRow] := CO_SEPARADOR;
         RowHeights[nRow] := CO_ROWSEP2;

         // Coloca Todos los datos del Importe
         Inc(nRow);
         Cells[CO_COL1,nRow] := CO_CORTE1;
         Cells[CO_COL2,nRow] := FieldByName('DESC_COMISION').AsString;
         Cells[CO_COL3,nRow] := FieldByName('SIT_COMISION').AsString;
         Cells[CO_COM_CVE_COMISION,nRow]  := FieldByName('CVE_COMISION').AsString;

         //Detalle
         Inc(nRow);
         Cells[CO_COL1,nRow] := CO_DETALLE;
         Cells[CO_COL2,nRow] := FieldByName('NUM_PERIODO').AsString;
         Cells[CO_COL3,nRow] := FieldByName('SIT_COMISION').AsString;

         //HERJA
         Cells[CO_COM_ENT_DESC,nRow] := FieldByName('CVE_FND_ENT_DES').AsString;
         Cells[CO_COM_PROG,nRow] := FieldByName('CVE_FND_PROGRAMA').AsString;
         //

         Cells[CO_COM_CVE_COMISION,nRow] := FieldByName('CVE_COMISION').AsString;
//         Cells[CO_COM_CVE_COMISION,nRow] := FieldByName('CVE_COMISION').AsString;
         If (FieldByName('F_VENCIMIENTO').AsDateTime > 0) Then Cells[CO_COM_F_VENCIMIENTO,nRow] := FormatDateTime(CFORMAT_FECHA,FieldByName('F_VENCIMIENTO').AsDateTime);
         If (FieldByName('F_PROG_PAGO').AsDateTime > 0)   Then Cells[CO_COM_F_PROG_PAGO,nRow]   := FormatDateTime(CFORMAT_FECHA,FieldByName('F_PROG_PAGO').AsDateTime);
         If (FieldByName('F_PAGO').AsDateTime > 0)        Then Cells[CO_COM_F_PAGO,nRow]        := FormatDateTime(CFORMAT_FECHA,FieldByName('F_PAGO').AsDateTime);
         Cells[CO_COM_TITULO,nRow]          := CO_WORDIMP;
         Cells[CO_COM_IMP_COMISION,nRow]    := Format(CFORMAT_DINERO,[FieldByName('IMP_COMISION').AsFloat]);
         Cells[CO_COM_IMP_PAGADO,nRow]      := Format(CFORMAT_DINERO,[FieldByName('IMP_PAGADO').AsFloat]);

          Cells[CO_COM_SIT_COMISION,nRow]  := FieldByName('SIT_COMISION').AsString;

          // Calcula los Totales
          If vg_bMuestraIva Then
           Begin
            vldImpProgramado  := FieldByName('IMP_COMISION').AsFloat + FieldByName('IMP_IVA').AsFloat;
            vldImpPagado      := FieldByName('IMP_PAGADO').AsFloat + FieldByName('IMP_IVA_PAGADO').AsFloat;
            vldImpVencido     := FieldByName('IMP_COMISION').AsFloat - FieldByName('IMP_PAGADO').AsFloat +
                                 FieldByName('IMP_IVA').AsFloat - FieldByName('IMP_IVA_PAGADO').AsFloat;
           End
          Else
           Begin
            vldImpProgramado  := FieldByName('IMP_COMISION').AsFloat;
            vldImpPagado      := FieldByName('IMP_PAGADO').AsFloat;
            vldImpVencido     := FieldByName('IMP_COMISION').AsFloat - FieldByName('IMP_PAGADO').AsFloat;
           End;

         If vg_bMuestraIva Then
          Begin
          // Agrega los Importes de IVA
          Inc(nRow);
          Cells[CO_COL1,nRow] := CO_DETALLE;
          Cells[CO_COL2,nRow] := FieldByName('NUM_PERIODO').AsString;
          Cells[CO_COL3,nRow] := FieldByName('SIT_COMISION').AsString;
          Cells[CO_COM_CVE_COMISION,nRow] := FieldByName('CVE_COMISION').AsString;
          Cells[CO_COM_TITULO,nRow]           := CO_WORDIVA;
          Cells[CO_COM_IMP_IVA,nRow]          := Format(CFORMAT_DINERO,[FieldByName('IMP_IVA').AsFloat]);
          Cells[CO_COM_IMP_IVA_PAGADO,nRow]   := Format(CFORMAT_DINERO,[FieldByName('IMP_IVA_PAGADO').AsFloat]);

          Inc(nRow);
          Cells[CO_COL1,nRow] := CO_SUBTOTAL;
          Cells[CO_COL2,nRow] := FieldByName('NUM_PERIODO').AsString;
          Cells[CO_COL3,nRow] := FieldByName('SIT_COMISION').AsString;
          Cells[CO_COM_CVE_COMISION,nRow] := FieldByName('CVE_COMISION').AsString;          
          Cells[CO_COM_TITULO,nRow]           := CO_WORDTOT;
          Cells[CO_COM_IMP_COMISION,nRow]     := Format(CFORMAT_DINERO,[vldImpProgramado]);
          Cells[CO_COM_IMP_PAGADO,nRow]       := Format(CFORMAT_DINERO,[vldImpPagado]);

          End;

          vldTotImpProgramado   := vldTotImpProgramado + vldImpProgramado;
          vldTotImpPagado       := vldTotImpPagado + vldImpPagado;
          vldTotImpVencido      := vldTotImpVencido + vldImpVencido;

       strSIT_COMISION := FieldByName('SIT_COMISION').AsString;
       strCVE_COMISION := FieldByName('CVE_COMISION').AsString;
       Next;
       End;

   // Agrega últimos Subtotales por periodo
   If (nRow > 0) Then
    With StrGrdComision Do
    Begin
     // Agrega un Pequeño Salto de Línea
     Inc(nRow);
     Cells[CO_COL1,nRow]  := CO_SEPARADOR;
     Cells[CO_COL2,nRow]  := IntToStr(nPeriodoActual);
     RowHeights[nRow]     := CO_ROWSEP;

     Inc(nRow);
     Cells[CO_COL1,nRow]  := CO_SUBTOTAL;
     Cells[CO_COL2,nRow]  := IntToStr(nPeriodoActual);
     Cells[CO_COL3,nRow]  := strSIT_COMISION;
     Cells[CO_COM_CVE_COMISION,nRow] := strCVE_COMISION;
     Cells[CO_COM_TITULO,nRow]  := CO_WORDTPD;
     Cells[CO_COM_IMP_COMISION,nRow]    := Format(CFORMAT_DINERO,[vldTotImpProgramado]);
     Cells[CO_COM_IMP_PAGADO,nRow]      := Format(CFORMAT_DINERO,[vldTotImpPagado]);

    End;

 // Ajusta el tamaño del Grid a la cantidad de Resultados Mostrados
 If (nRow = 0) Then strgrdComision.RowCount := 1
 Else
  Begin
  Inc(nRow);
  AgregaEspacioParaTotales(strgrdComision, nRow, CO_INT_TITULO);
  CalculaTotales( strgrdComision, nRow,
                  [   CO_COM_IMP_COMISION     ,   CO_COM_IMP_PAGADO  ] ); // Calcula los Totales
  strgrdComision.RowCount := nRow + 1;
  End;

 strgrdComision.Left:=0;

 If Assigned(vlQry) Then vlQry.Free;
end;



procedure TWCrFndCons.MuestraDocumentos(pID_CESION : Integer; pSIT_DOCUMENTO : String);
var vlstrSQL : String;
    vlQry : TQuery;
    nRow, nTempRow : Integer;
begin
 vlstrSQL :=  ' SELECT'+coCRLF+
              '        CD.ID_CESION,'+coCRLF+
              '        CD.ID_DOCUMENTO,'+coCRLF+
              '        CD.NUM_PERIODO_DOC,'+coCRLF+
              '        CD.CVE_TIPO_INTERES,'+coCRLF+
              '        DECODE(CD.CVE_TIPO_INTERES,''IN'',''Inicio'','+coCRLF+
              '                                   ''VE'',''Venc.'',''Error'') AS DESC_TIPO_INTERES,'+coCRLF+
              '        CD.CVE_DOCUMENTO,'+coCRLF+
              '        CD.F_COMPRA,'+coCRLF+
              '        CD.F_EMISION,'+coCRLF+
              '        CD.IMP_NOMINAL,'+coCRLF+
              '        CD.IMP_COMPRA,'+coCRLF+
              '        CD.TASA_DESCUENTO,'+coCRLF+
              '        CD.TASA_AFORO,'+coCRLF+
              '        CD.SIT_DOCUMENTO,'+coCRLF+
              '        CA.IMP_CAPITAL,'+coCRLF+
              '        CA.IMP_CAPITAL AS IMP_AFORADO,'+coCRLF+
              '        CA.F_VENCIMIENTO,'+coCRLF+
              '        CA.F_PROG_PAGO,'+coCRLF+
              '        CA.F_PAGO,'+coCRLF+
              '        CA.IMP_PAGADO,'+coCRLF+
              '        CA.SIT_CAPITAL,'+coCRLF+
              '        CA.F_ALTA,'+coCRLF+
              '        CI.IMP_INTERES,'+coCRLF+
              '        CR.IMP_REMANENTE'+coCRLF+
              'FROM CR_DOCUMENTO CD,'+coCRLF+
              '     CR_FND_CAPITAL CA,'+coCRLF+
              '     CR_FND_INTERES CI,'+coCRLF+
              '     CR_REMANENTE CR'+coCRLF+
              '  WHERE CD.ID_CESION = '+IntToStr(pID_CESION)+coCRLF+
              '  AND CA.ID_CREDITO = CD.ID_CESION'+coCRLF+
              '  AND CI.ID_CREDITO = CD.ID_CESION'+coCRLF+
              '  AND CA.NUM_PERIODO = CD.NUM_PERIODO_DOC'+coCRLF+
              '  AND CI.NUM_PERIODO = CD.NUM_PERIODO_DOC'+coCRLF+
              '  AND CR.ID_CESION (+)= CD.ID_CESION'+coCRLF+
              '  AND CR.ID_DOCUMENTO (+)= CD.CVE_DOCUMENTO'+coCRLF;

 // Los documentos no tienen IVA
 vg_bMuestraIva := False;
 If (Trim(pSIT_DOCUMENTO) <> '') Then
  vlstrSQL :=  vlstrSQL + ' AND SIT_DOCUMENTO = '+SQLSTR(pSIT_DOCUMENTO)+coCRLF;

 if Rorden.ItemIndex=0 then
 begin
    vlstrSQL :=   vlstrSQL + ' ORDER BY CA.CVE_FND_ENT_DES, CA.CVE_FND_PROGRAMA,'; //HERJA
    vlstrSQL :=   vlstrSQL + ' F_VENCIMIENTO, NUM_PERIODO_DOC';
 end;
 if Rorden.ItemIndex=1 then
 begin
    vlstrSQL :=   vlstrSQL + ' ORDER BY F_VENCIMIENTO, NUM_PERIODO_DOC';
 end;



 vlQry := GetSQLQuery(vlstrSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
 ClearGrid(strgrdDocumentos1,0);
 ClearGrid(strgrdDocumentos2,0);
 ClearGrid(strgrdDocumentos3,0);

 With strgrdDocumentos1 Do
   Begin
   ColCount := 8;
   RowCount := 9999;
   ColWidths[CO_COL1] := 0;
   ColWidths[CO_COL2] := 0;
   ColWidths[CO_COL3] := 0;
   ColWidths[CO_DOC_ID_DOCUMENTO]     := 165;                // Indica el Identificador de Documento
   ColWidths[CO_DOC_CVE_TIPO_INTERES] := 48;                 // Tipo de Interés
   ColWidths[CO_DOC_F_COMPRA]         := CO_WIDTH_FECHA;     // Fecha de Compra
   ColWidths[CO_DOC_F_PROG_PAGO]      := CO_WIDTH_FECHA;     // Fecha Programada
   ColWidths[CO_DOC_F_PAGO]           := CO_WIDTH_FECHA;     // Fecha de Pago
   End;

 With strgrdDocumentos2 Do
   Begin
   ColCount := 10;
   RowCount := strgrdDocumentos1.RowCount;
   ColWidths[CO_COL1] := 0;
   ColWidths[CO_COL2] := 0;
   ColWidths[CO_COL3] := 0;
   ColWidths[CO_DOC_IMP_NOMINAL]   := CO_WIDTH_DINERO;    // Importe Nominal
   ColWidths[CO_DOC_IMP_AFORADO]   := CO_WIDTH_DINERO;    // Importe Aforado
   ColWidths[CO_DOC_IMP_REMANENTE] := CO_WIDTH_DINERO;    // Importe Remanente
   ColWidths[CO_DOC_IMP_COMPRA]    := CO_WIDTH_DINERO;    // Importe Compra
   ColWidths[CO_DOC_IMP_INTERES]   := CO_WIDTH_DINERO;    // Importe Interés
   ColWidths[CO_DOC_IMP_PAGADO]    := CO_WIDTH_DINERO;    // Importe Pagado
   ColWidths[CO_DOC_IMP_VENCIDO]   := CO_WIDTH_DINERO;    // Importe Vencido
   End;

 With strgrdDocumentos3 Do
   Begin
   ColCount := 3;
   RowCount := strgrdDocumentos1.RowCount;
   ColWidths[CO_COL1] := 0;
   ColWidths[CO_COL2] := 0;
   ColWidths[CO_COL3] := 17; // Situación
   End;

 nRow := 0;
 IniciaError(strgrdDocumentos1);
 IniciaError(strgrdDocumentos2);
 IniciaError(strgrdDocumentos3);

 If Assigned(vlQry) Then
  With vlQry Do
   While Not Eof Do
    Begin
     strgrdDocumentos1.Cells[CO_COL1,nRow] := CO_DETALLE;
     strgrdDocumentos1.Cells[CO_COL2,nRow] := FieldByName('NUM_PERIODO_DOC').AsString;
     strgrdDocumentos1.Cells[CO_COL3,nRow] := FieldByName('SIT_DOCUMENTO').AsString;
     strgrdDocumentos1.Cells[CO_DOC_ID_DOCUMENTO,nRow]     := FieldByName('ID_DOCUMENTO').AsString;
     strgrdDocumentos1.Cells[CO_DOC_CVE_TIPO_INTERES,nRow] := FieldByName('DESC_TIPO_INTERES').AsString;
     If (FieldByName('F_COMPRA').AsDateTime > 0)      Then strgrdDocumentos1.Cells[CO_DOC_F_COMPRA,nRow]    := FormatDateTime(CFORMAT_FECHA, FieldByName('F_COMPRA').AsDateTime);
     If (FieldByName('F_PROG_PAGO').AsDateTime > 0)   Then strgrdDocumentos1.Cells[CO_DOC_F_PROG_PAGO,nRow] := FormatDateTime(CFORMAT_FECHA, FieldByName('F_PROG_PAGO').AsDateTime);
     If (FieldByName('F_PAGO').AsDateTime > 0)        Then strgrdDocumentos1.Cells[CO_DOC_F_PAGO,nRow]      := FormatDateTime(CFORMAT_FECHA, FieldByName('F_PAGO').AsDateTime);

     strgrdDocumentos2.Cells[CO_COL1,nRow] := CO_DETALLE;
     strgrdDocumentos2.Cells[CO_COL2,nRow] := FieldByName('NUM_PERIODO_DOC').AsString;
     strgrdDocumentos2.Cells[CO_COL3,nRow] := FieldByName('SIT_DOCUMENTO').AsString;
     strgrdDocumentos2.Cells[CO_DOC_IMP_NOMINAL,nRow]   := Format(CFORMAT_DINERO,[FieldByName('IMP_NOMINAL').AsFloat]);
     strgrdDocumentos2.Cells[CO_DOC_IMP_AFORADO,nRow]   := Format(CFORMAT_DINERO,[FieldByName('IMP_AFORADO').AsFloat]);
     strgrdDocumentos2.Cells[CO_DOC_IMP_REMANENTE,nRow] := Format(CFORMAT_DINERO,[FieldByName('IMP_REMANENTE').AsFloat]);
     strgrdDocumentos2.Cells[CO_DOC_IMP_COMPRA,nRow]    := Format(CFORMAT_DINERO,[FieldByName('IMP_COMPRA').AsFloat]);
     strgrdDocumentos2.Cells[CO_DOC_IMP_INTERES,nRow]   := Format(CFORMAT_DINERO,[FieldByName('IMP_INTERES').AsFloat]);
     strgrdDocumentos2.Cells[CO_DOC_IMP_PAGADO,nRow]    := Format(CFORMAT_DINERO,[FieldByName('IMP_PAGADO').AsFloat]);

     If (FieldByName('SIT_DOCUMENTO').AsString <> CSIT_AC) Then
      strgrdDocumentos2.Cells[CO_DOC_IMP_VENCIDO,nRow] := Format(CFORMAT_DINERO,[FieldByName('IMP_AFORADO').AsFloat - FieldByName('IMP_PAGADO').AsFloat]);

     strgrdDocumentos3.Cells[CO_COL1,nRow] := CO_DETALLE;
     strgrdDocumentos3.Cells[CO_COL2,nRow] := FieldByName('NUM_PERIODO_DOC').AsString;
     strgrdDocumentos3.Cells[CO_COL3,nRow] := FieldByName('SIT_DOCUMENTO').AsString;
   Inc(nRow);
   Next;
   End;

 // Ajusta el tamaño del Grid a la cantidad de Resultados Mostrados
 If (nRow = 0) Then
  Begin
  strgrdDocumentos1.RowCount := 1;
  strgrdDocumentos2.RowCount := 1;
  strgrdDocumentos3.RowCount := 1;
  End
 Else
  Begin
  // Agrega Pequeño Renglon Separador;
  nTempRow := nRow;  AgregaEspacioParaTotales(strgrdDocumentos1, nTempRow, CO_DOC_TITULO);
  nTempRow := nRow;  AgregaEspacioParaTotales(strgrdDocumentos2, nTempRow, -1);
  nTempRow := nRow;  AgregaEspacioParaTotales(strgrdDocumentos3, nTempRow, -1);

  // Calcula los Totales
  CalculaTotales( strgrdDocumentos2, nTempRow,
                  [   CO_DOC_IMP_NOMINAL   ,   CO_DOC_IMP_AFORADO   ,   CO_DOC_IMP_REMANENTE ,
                      CO_DOC_IMP_COMPRA    ,   CO_DOC_IMP_INTERES   ,   CO_DOC_IMP_PAGADO    ,
                      CO_DOC_IMP_VENCIDO  ] );

  strgrdDocumentos1.RowCount := nTempRow + 1;
  strgrdDocumentos2.RowCount := nTempRow + 1;
  strgrdDocumentos3.RowCount := nTempRow + 1;
  End;

 If Assigned(vlQry) Then vlQry.Free;
end;



procedure TWCrFndCons.MuestraFinanciamiento(pID_CREDITO : Integer; pSIT_CREDITO : String);
var vlstrSQL : String;
    vlQry : TQuery;
    nRow : Integer;
begin
 vlstrSQL :=  ' SELECT * FROM CR_FND_FIN_ADIC '+coCRLF+
              ' WHERE ID_CREDITO = '+IntToStr(pID_CREDITO);
 If (Trim(pSIT_CREDITO) <> '') Then
  vlstrSQL :=  vlstrSQL + ' AND SIT_FINAN_ADIC = '+SQLSTR(pSIT_CREDITO)+coCRLF;

 if Rorden.ItemIndex=0 then
 begin
    vlstrSQL :=   vlstrSQL + ' ORDER BY CVE_FND_ENT_DES, CVE_FND_PROGRAMA,'; //HERJA
    vlstrSQL :=   vlstrSQL + ' F_VENCIMIENTO, NUM_PERIODO';
 end;
 if Rorden.ItemIndex=1 then
 begin
    vlstrSQL :=   vlstrSQL + ' ORDER BY F_VENCIMIENTO, NUM_PERIODO';
 end;

 vlQry := GetSQLQuery(vlstrSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);

  ClearGrid(strgrdFinanciamiento, 0);

  vg_bMuestraIva := False;
  With strgrdFinanciamiento Do
   Begin
   RowHeights[0] := DefaultRowHeight;
   RowCount := 1;   //  DESCRIPCION DE LAS COLUMNAS
   ColCount := 13;
   RowCount := 9999;

   ColWidths[CO_COL1] := 0;
   ColWidths[CO_COL2] := 0;
   ColWidths[CO_COL3] := 0;

   //HERJA
  ColWidths[CO_F_ENT_DESC            ] := 70;
  ColWidths[CO_F_PROG                ] := 32;
   //

   ColWidths[CO_NUM_PERIODO]        := 24;
   ColWidths[CO_F_VENCIMIENTO]      := CO_WIDTH_FECHA;
   ColWidths[CO_F_PROG_PAGO]        := CO_WIDTH_FECHA;
   ColWidths[CO_F_PAGO]             := CO_WIDTH_FECHA;
   ColWidths[CO_FIN_TITULO]         := 42;
   ColWidths[CO_IMP_FINAN_ADIC]     := CO_WIDTH_DINERO;
   ColWidths[CO_IMP_PAGADO]         := CO_WIDTH_DINERO;
//   ColWidths[CO_IMP_FINAN_VENCIDO]  := CO_WIDTH_DINERO;
   ColWidths[CO_SIT_FINAN_ADIC]     := 17;
   End;
 IniciaError(strgrdFinanciamiento);

 nRow := 0;
 If Assigned(vlQry) then
  With (vlQry) Do
   While Not Eof Do
    Begin
      strgrdFinanciamiento.Cells[CO_COL1,nRow] := CO_DETALLE;
      strgrdFinanciamiento.Cells[CO_COL2,nRow] := FieldByName('NUM_PERIODO').AsString;
      strgrdFinanciamiento.Cells[CO_COL3,nRow] := FieldByName('SIT_FINAN_ADIC').AsString;

      //HERJA
      strgrdFinanciamiento.Cells[CO_F_ENT_DESC,nRow] := FieldByName('CVE_FND_ENT_DES').AsString;
      strgrdFinanciamiento.Cells[CO_F_PROG,nRow] := FieldByName('CVE_FND_PROGRAMA').AsString;
      //

      strgrdFinanciamiento.Cells[CO_NUM_PERIODO, nRow] := FieldByName('NUM_PERIODO').AsString;

      If (FieldByName('F_VENCIMIENTO').AsDateTime > 0) Then strgrdFinanciamiento.Cells[CO_F_VENCIMIENTO, nRow]  := FormatDateTime(CFORMAT_FECHA, FieldByName('F_VENCIMIENTO').AsDateTime);
      If (FieldByName('F_PROG_PAGO').AsDateTime > 0)   Then strgrdFinanciamiento.Cells[CO_F_PROG_PAGO, nRow]    := FormatDateTime(CFORMAT_FECHA, FieldByName('F_PROG_PAGO').AsDateTime);
      If (FieldByName('F_PAGO').AsDateTime > 0)        Then strgrdFinanciamiento.Cells[CO_F_PAGO, nRow]         := FormatDateTime(CFORMAT_FECHA, FieldByName('F_PAGO').AsDateTime);

      strgrdFinanciamiento.Cells[CO_IMP_FINAN_ADIC, nRow] := Format(CFORMAT_DINERO,[FieldByName('IMP_FINAN_ADIC').AsFloat]);
      strgrdFinanciamiento.Cells[CO_IMP_PAGADO, nRow]     := Format(CFORMAT_DINERO,[FieldByName('IMP_PAGADO').AsFloat]);

//      If (FieldByName('SIT_FINAN_ADIC').AsString <> CSIT_AC) Then
//       strgrdFinanciamiento.Cells[CO_IMP_FINAN_VENCIDO,nRow] := Format(CFORMAT_DINERO,[FieldByName('IMP_FINAN_ADIC').AsFloat - FieldByName('IMP_PAGADO').AsFloat]);

      strgrdFinanciamiento.Cells[CO_SIT_FINAN_ADIC, nRow] := FieldByName('SIT_FINAN_ADIC').AsString;
      Inc(nRow);
      Next;
    End;

 // Ajusta el tamaño del Grid a la cantidad de Resultados Mostrados
 If (nRow = 0) Then
  strgrdFinanciamiento.RowCount := 1
 Else
  Begin
  // Agrega Pequeño Renglon Separador;
  AgregaEspacioParaTotales( strgrdFinanciamiento, nRow, CO_FIN_TITULO);
  // Calcula los Totales
//  CalculaTotales( strgrdFinanciamiento, nRow, [ CO_IMP_FINAN_ADIC, CO_IMP_PAGADO, CO_IMP_FINAN_VENCIDO ] );
  CalculaTotales( strgrdFinanciamiento, nRow, [ CO_IMP_FINAN_ADIC, CO_IMP_PAGADO ] );
  strgrdFinanciamiento.RowCount := nRow + 1;
  End;

 strgrdFinanciamiento.Left:=0;  

 If Assigned(vlQry) Then vlQry.Free;
end;

procedure TWCrFndCons.MuestraTabuladores(pID_CREDITO : Integer);
var vlstrSQL : String;
    vlQry : TQuery;
begin
   vlstrSQL :=
                ' SELECT CC.ID_CREDITO,'+coCRLF+
                '        CO.ID_CONTRATO,'+coCRLF+
                '        CP.CVE_PRODUCTO_CRE,'+coCRLF+
                '        CP.B_CONSULTA_CAP,'+coCRLF+
                '        CP.B_CONSULTA_INT,'+coCRLF+
                '        CP.B_CONSULTA_COM,'+coCRLF+
                '        CP.B_CONSULTA_DOC,'+coCRLF+
                '        CP.B_CONSULTA_FIN'+coCRLF+
                ' FROM CR_CREDITO CC,'+coCRLF+
                '      CR_CONTRATO CO,'+coCRLF+
                '      CR_PRODUCTO CP'+coCRLF+
                ' WHERE CC.ID_CREDITO = '+IntToStr(pID_CREDITO)+coCRLF+
                '   AND CO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
                '   AND CP.CVE_PRODUCTO_CRE = CO.CVE_PRODUCTO_CRE';
  vlQry := GetSQLQuery(vlstrSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
  If Assigned(vlQry) Then
   Begin
     With (vlQry) Do
      Begin
         tbshtCapital.TabVisible        := True;
         tbshtInteres.TabVisible        := True;
         tbshtComision.TabVisible       := True;
         tbshtFinanciamiento.TabVisible := True;

      {tbshtCapital.TabVisible        := FieldByName('B_CONSULTA_CAP').AsString = 'V';
      tbshtInteres.TabVisible        := FieldByName('B_CONSULTA_INT').AsString = 'V';
      tbshtComision.TabVisible       := FieldByName('B_CONSULTA_COM').AsString = 'V';
      tbshtFinanciamiento.TabVisible := FieldByName('B_CONSULTA_FIN').AsString = 'V';   }
      tbshtDocumentos.TabVisible     := FieldByName('B_CONSULTA_DOC').AsString = 'V';
      Close;
      Free;
      End;
    End;
end;

procedure TWCrFndCons.IniciaError(var StrGrd : TStringGrid);
begin
 If Assigned(StrGrd) Then
  Begin
  StrGrd.Cells[CO_COL1, 0] := CO_ERROR;
  StrGrd.Cells[CO_COL2, 0] := CERROR_NOEXISTEN;
  End;
end;

procedure TWCrFndCons.AgregaEspacioParaTotales( var StrGrd : TStringGrid; var nRow : Integer; nColTitulo : Integer);
begin
  // Agrega Pequeño Renglon Separador;
  If Assigned(StrGrd) Then
   Begin
   StrGrd.Cells[CO_COL1, nRow] := CO_SEPARADOR; // Identificador de Separador
   StrGrd.RowHeights[nRow] := CO_ROWSEP; // Tamaño del Separador
   Inc(nRow);
   If (nColTitulo > -1) Then
    StrGrd.Cells[nColTitulo,nRow] := CO_WORDTOT; // Word Total
   StrGrd.Cells[CO_COL1,   nRow] := CO_TOTAL; // Identificador de Separador
   End;
end;

procedure TWCrFndCons.CalculaTotales(var StrGrd : TStringGrid; nRowTotales : Integer; const AColumnasTotales : Array of Integer );
var I, J, nColumnas : Integer;
    ASumaColIndividual : TArrayDouble;
    str : String;
begin
  If Assigned(StrGrd) Then
   Begin
   nColumnas := High(AColumnasTotales)+1;  // Obtiene el total de columnas
   SetLength(ASumaColIndividual, nColumnas); // Crea un arreglo de variables Flotantes para llevar la cuenta de cada columna
   For J := 0 To nColumnas-1 Do // Inicializa sus valores en 0
    ASumaColIndividual[J] := 0;

    With StrGrd Do
      Begin
       For I := 0 To RowCount-1 Do
        If ( Cells[CO_COL1,I] = CO_DETALLE ) And ( Cells[CO_COL3,I] <> CSIT_CA ) Then
         For J := 0 To nColumnas-1 Do
          Begin
           str := TrimChar( Cells[AColumnasTotales[J], I], '$,'#32);
           If (str <> '') Then
            ASumaColIndividual[J] := ASumaColIndividual[J] + StrToFloat(str);
          End;

        For J := 0 To nColumnas-1 Do
         Cells[AColumnasTotales[J],nRowTotales] := Format(CFORMAT_DINERO,[ASumaColIndividual[J]]);
      End;
   // Libera Espacio
   SetLength(ASumaColIndividual, 0);
   End;
end;


procedure TWCrFndCons.MostrarTotalPeriodos(pStrSituacion : String);
var I, J, vlnTabIndex : Integer;
    vlStrGrd : TStringGrid;
    vlnPeriodoActual, vlnPeriodo,
    vlnTotPeriodoSit, vlnTotPeriodo : Integer;
begin
  vlStrGrd := Nil;
   Case ConsultaActual Of
    ftCapital        : vlStrGrd := StrGrdCapital;
    ftInteres        : vlStrGrd := StrGrdInteres;
    ftComision       : vlStrGrd := StrGrdComision;
    ftFinanciamiento : vlStrGrd := StrGrdFinanciamiento;
   End;

  vlnPeriodoActual := -1; vlnTotPeriodo := 0; vlnTotPeriodoSit := 0;

  If Assigned(vlStrGrd) Then
   With (vlStrGrd) Do
     For I := 0 To RowCount-1 Do
      If IsInteger(Cells[CO_COL2,I]) Then
       Begin
        vlnPeriodo := StrToInt(Cells[CO_COL2,I]);
        //If (vlnPeriodoActual <> vlnPeriodo) Then
        // Begin
         vlnPeriodoActual := vlnPeriodo;
         Inc(vlnTotPeriodo);

         If (pStrSituacion = Cells[CO_COL3,I]) Then
            Inc(vlnTotPeriodoSit);
         End;
       //End;

  vlnTabIndex := 0;
  For J := 0 To High(CO_A_SITUACION) Do
   If (CO_A_SITUACION[J] = pStrSituacion) Then
    Begin
    vlnTabIndex := J;
    Break;
    End;

  lblPeriodos.Caption := 'Total de Periodos = '+IntToStr(vlnTotPeriodo);
  If (pStrSituacion <> '') Then
   lblPeriodos.Caption := lblPeriodos.Caption +
                          '          Total de Periodos '+tbstSituacion.Tabs[vlnTabIndex]+' = '+IntToStr(vlnTotPeriodoSit);
end;

procedure TWCrFndCons.MostrarPaginaError;

  procedure ActivaUltimaPagina(pstrCaption1, pstrCaption2 : String);
  var vlstrSQL, vlCVE_PRODUCTO_CRE : String;
  begin
    vlstrSQL := ' SELECT CO.CVE_PRODUCTO_CRE '+coCRLF+
                ' FROM CR_CREDITO CC,'+coCRLF+
                '      CR_CONTRATO CO'+coCRLF+
                ' WHERE ID_CREDITO = '+IntToStr(Credito)+coCRLF+
                '   AND CO.ID_CONTRATO  = CC.ID_CONTRATO';
   GetSQLStr(vlstrSQL, Objeto.DataBaseName, Objeto.SessionName, 'CVE_PRODUCTO_CRE', vlCVE_PRODUCTO_CRE, False);
  end;

begin
 If (Credito > -1) Then
  Begin
   Case Objeto.Opcion Of
                        ftCapital        : ActivaUltimaPagina(tbshtCapital.Caption,'Periodos de Capital');
                        ftInteres        : ActivaUltimaPagina(tbshtInteres.Caption,'Periodos de Interés');
                        ftComision       : ActivaUltimaPagina(tbshtComision.Caption,'Periodos de Comisión');
                        ftDocumentos     : ActivaUltimaPagina(tbshtDocumentos.Caption,'Documentos');
                        ftFinanciamiento : ActivaUltimaPagina(tbshtFinanciamiento.Caption,'Financiamiento');
                       End;
  End;
end;

procedure TWCrFndCons.Mostrar(pStrSituacion  : String);
begin
 If (Credito > -1) And (ConsultaActual <> ftNone) Then
  Begin
   MuestraTabuladores(Credito);
   Case ConsultaActual Of
    ftCapital        : If tbshtCapital.TabVisible        Then MuestraCapital(Credito,pStrSituacion);
    ftInteres        : If tbshtInteres.TabVisible        Then MuestraInteres(Credito,pStrSituacion);
    ftComision       : If tbshtComision.TabVisible       Then MuestraComision(Credito,pStrSituacion);
    ftDocumentos     : If tbshtDocumentos.TabVisible     Then MuestraDocumentos(Credito,pStrSituacion);
    ftFinanciamiento : If tbshtFinanciamiento.TabVisible Then MuestraFinanciamiento(Credito,pStrSituacion);
    End;
   MostrarTotalPeriodos(pStrSituacion);
  End;
end;


{ Eventos }

procedure TWCrFndCons.pgctrlConsultaChange(Sender: TObject);
begin
 btnRefrescarClick(Self);
end;

procedure TWCrFndCons.btnRefrescarClick(Sender: TObject);
begin
 Mostrar(SituacionActual);
end;

procedure TWCrFndCons.tbstSituacionChange(Sender: TObject;
  NewTab: Integer; var AllowChange: Boolean);
begin
 Mostrar(CO_A_SITUACION[NewTab]);
end;

procedure TWCrFndCons.strgrdCapitalDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
const LIGHT_YELLOW = $00CCFFFF;
      LIGHT_GRAY = $00F0F0F0;

 // Esta función se hizo con el fin de reemplazar a la conocida función RECT()
 // debido a que el compilador confunde el llamado entre la variable y la función
 // en este procedimiento...
 function Rect_(nLeft, nTop, nRight, nBottom : Integer) : TRect;
 var R : TRect;
 begin
  R.Left := nLeft;
  R.Top := nTop;
  R.Right := nRight;
  R.Bottom := nBottom;
  Result := R;
 end;

var Rect1 : TRect;
    str, strIdentificador : String;
    nLeftCol : Integer;
    Bmp : TBitmap;
begin
 If (Sender Is TStringGrid) Then
  With (Sender As TStringGrid) Do
   Begin
    strIdentificador := Cells[CO_COL1,ARow];

    If (gdSelected In State) Then Canvas.Brush.Color := clNavy;

    // Separador
    If (strIdentificador = CO_SEPARADOR) Then
     Begin
         Rect1 := Rect_(0, Rect.Top, Width,Rect.Bottom);
         Canvas.Brush.Color := clWhite;
         Canvas.FillRect(Rect1);
     End

    // Titulo de Periodo o Mensaje de que No Existen Datos
    Else If (strIdentificador = CO_CORTE) Or (strIdentificador = CO_ERROR) Then
     Begin
         str := Cells[CO_COL2, ARow];
         Rect1 := Rect_(0, Rect.Top, Width,Rect.Bottom);
         Canvas.Brush.Color := LIGHT_YELLOW;
         Canvas.FillRect(Rect1);
         Canvas.Font.Style := [fsBold];
         Canvas.Font.Color := clBlack;
         Canvas.TextRect(Rect1, (Rect1.Right - Canvas.TextWidth(str)) div 2, Rect1.Top, str);
     End

    // Suttitulo de Periodo
    Else If (strIdentificador = CO_CORTE1) Then
     Begin
         str := Cells[CO_COL2, ARow];
         Rect1 := Rect_(0, Rect.Top, Width,Rect.Bottom);
         Canvas.Brush.Color := clWhite;
         Canvas.FillRect(Rect1);
         Canvas.Font.Style := [fsItalic];
         Canvas.Font.Color := clBlack;
         Canvas.TextRect(Rect1, Rect1.Left + 10, Rect1.Top, str);
     End

    // Cambio de Color del Detalle
    Else If (strIdentificador = CO_DETALLE) Or (strIdentificador = CO_SUBTOTAL) Or (strIdentificador = CO_TOTAL)Then
     Begin
          str := Cells[CO_COL3,ARow];
          If (str = CSIT_AC) Then  Canvas.Font.Color := clGreen;
          If (str = CSIT_LQ) Then  Canvas.Font.Color := clBlue;
          If (str = CSIT_IM) Then  Canvas.Font.Color := clRed;
          If (str = CSIT_CA) Then  Canvas.Font.Color := clDkGray;
          If (str = CSIT_PA) Or (str = '') Then  Canvas.Font.Color := clBlack;
          If (gdSelected In State) Then Canvas.Font.Color := clWhite;

          If Not (gdSelected In State) And Not (vg_bMuestraIva) And (Sender <> strgrdComision) Then
           Begin
           If ((ARow Mod 2) = 0) Then Canvas.Brush.Color := LIGHT_GRAY
           Else Canvas.Brush.Color := clWhite;
           End;

          If (ColWidths[ACol] = CO_WIDTH_DINERO) OR(ColWidths[ACol] = CO_WIDTH_DINERO2)
          OR (ColWidths[ACol] = CO_WIDTH_DINERO3) Then
           Canvas.TextRect(Rect,Rect.Right - Canvas.TextWidth(Cells[ACol, ARow]),Rect.Top,Cells[ACol, ARow])
          Else
           Canvas.TextRect(Rect,Rect.Left,Rect.Top,Cells[ACol, ARow]);
     End;

   End;
end;

procedure TWCrFndCons.strgrdDocumentos1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);

  procedure AsignaSeleccion( Sender, Grid : TStringGrid );
  begin
    if Sender <> Grid then
     Begin
     Grid.Row := ARow;
     End;
  end;
var
  Rect : TGridRect;
begin
 If Sender Is TStringGrid  Then
  Begin

    If Not Assigned(vgGrid) Then
     vgGrid := (Sender As TStringGrid);

    If (vgGrid = Sender) Then
     Begin
     vgGrid := Nil;
     End;
  End;
end;


procedure TWCrFndCons.strgrdCapitalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var vlnTabIndex : Integer;
begin
 If (Sender Is TStringGrid) Then
   Begin
   vlnTabIndex := tbstSituacion.TabIndex;

   If (vlnTabIndex > tbstSituacion.Tabs.Count-1) Then vlnTabIndex := 0
   Else If (vlnTabIndex < 0) Then vlnTabIndex := tbstSituacion.Tabs.Count-1;
   tbstSituacion.TabIndex := vlnTabIndex;
   End;
end;

procedure TWCrFndCons.strgrdInteresSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);

  procedure AsignaSeleccion( Sender, Grid : TStringGrid );
  begin
    if Sender <> Grid then
     Grid.Row := ARow;
  end;

var
  Rect : TGridRect;
begin
 If Sender Is TStringGrid  Then
  Begin
    If Not Assigned(vgGrid) Then
     vgGrid := (Sender As TStringGrid);

    If (vgGrid = Sender) Then
     Begin
     AsignaSeleccion( Sender As TStringGrid, strgrdInteres );
     vgGrid := Nil;
     End;
  End;
end;

procedure TWCrFndCons.strgrdInteresTopLeftChanged(Sender: TObject);

  procedure AsignaTopRow( Sender, Grid : TStringGrid );
  begin
    if Sender <> Grid then
      Grid.TopRow := Sender.TopRow
  end;

begin
 If Sender Is TStringGrid Then
   Try
    AsignaTopRow( Sender As TStringGrid, strgrdInteres );
   Finally
   End;

end;

procedure TWCrFndCons.RordenClick(Sender: TObject);
begin
   Mostrar(SituacionActual);
end;

end.
