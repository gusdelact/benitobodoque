// Sistema         : Clase de NINGUNO
// Fecha de Inicio : 27/08/2013
// Función forma   : Clase de NINGUNO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Qforlxvhziifraxzhgil
// Comentarios     : Correccion nama4756 F50-PO01
Unit IntEstResRC;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntSGCtrl, IntParamCre,
IntPers, ShellAPI, ComObj, Grids;

const ALTO_COL = 16;
const ALTO_DOBLE = 20;

const
{ Colores }
  AzulClaro            = $00F1E6DC;
  AzulOscuro           = $00C67E3E;
  NaranjaClaro         = $00D9E9FD;
  NaranjaOscuro        = $000A6BE2;
  VerdeClaro           = $00DEF1EB;
  VerdeOscuro          = $003C9376;
  Gris                 = $00F2F2F2;

  Producto1            = $00F1D9C5;
  Producto2            = $00E4CCB8;
  Producto3            = $00E2B48D;
  Producto4            = $00D9E9FD;
  Producto5            = $00B4D5FC;
  Producto6            = $008FBFFA;
  Producto7            = $00BCE4D8;
  Producto8            = $009BD7C4;
  Producto9            = $0059BB9B;

  AzulGraficaClaro     = $00D58E55;
  AzulGraficaOscuro    = $00926037;
  NaranjaGraficaClaro  = $0090C0FA;
  NaranjaGraficaOscuro = $000A6CE4;
  VerdeGraficaClaro    = $009BD6C3;
  VerdeGraficaOscuro   = $003C9377;
  GrisGrafica          = $007F7F7F;

{ XlFileFormat }
  xlAddIn               =    18;
  xlCSV                 =     6;
  xlCSVMac              =    22;
  xlCSVMSDOS            =    24;
  xlCSVWindows          =    23;
  xlDBF2                =     7;
  xlDBF3                =     8;
  xlDBF4                =    11;
  xlDIF                 =     9;
  xlExcel2              =    16;
  xlExcel2FarEast       =    27;
  xlExcel3              =    29;
  xlExcel4              =    33;
  xlExcel5              =    39;
  xlExcel7              =    39;
  xlExcel9795           =    43;
  xlExcel4Workbook      =    35;
  xlIntlAddIn           =    26;
  xlIntlMacro           =    25;
  xlWorkbookNormal      = -4143;
  xlSYLK                =     2;
  xlTemplate            =    17;
  xlCurrentPlatformText = -4158;
  xlTextMac             =    19;
  xlTextMSDOS           =    21;
  xlTextPrinter         =    36;
  xlTextWindows         =    20;
  xlWJ2WD1              =    14;
  xlWK1                 =     5;
  xlWK1ALL              =    31;
  xlWK1FMT              =    30;
  xlWK3                 =    15;
  xlWK4                 =    38;
  xlWK3FM3              =    32;
  xlWKS                 =     4;
  xlWorks2FarEast       =    28;
  xlWQ1                 =    34;
  xlWJ3                 =    40;
  xlWJ3FJ3              =    41;
  xlWBatWorkSheet       = -4167;

{ XlBorderWeight }

  xlHairline =     1;
  xlMedium   = -4138;
  xlThick    =     4;
  xlThin     =     2;

{ xlHorizontalAlignment}
  xlHAlignCenter = -4108;
  xlHAlignLeft   = -4131;
  xlHAlignRight  = -4152;
  xlBottom       = -4107;
  xlContext      = -5002;

{xlBorderIndex}
  xlEdgeLeft         =     7;
  xlEdgeTop          =     8;
  xlEdgeBottom       =     9;
  xlEdgeRight        =    10;
  xlDiagonalDown     =     5;
  xlDiagonalUp       =     6;
  xlNone             = -4142;
  xlInsideVertical   =    11;
  xlInsideHorizontal =    12;

{xlCalculationMode}
  xlCalculationManual        = -4135;
  xlCalculationAutomatic     = -4105;
  xlCalculationSemiautomatic =     2;

{xlLineStyle}
  xlContinuous             =     1;
  xlDash                   = -4115;
  xlDashDot                =     4;
  xlDashDotDot             =     5;
  xlDot                    = -4118;
  xlDouble                 = -4119;
  xlSlantDashDot           =    13;
  xlLineStyleNone          = -4142;
  xlSolid                  =     1;
  xlAutomatic              = -4105;
  xlThemeColorAccent1      =     5;
  xlThemeColorAccent3      =     7;
  xlThemeColorAccent6      =    10;
  xlThemeColorLight1       =     0;
  xlThemeColorLight2       =     4;
  xlThemeColorDark1        =     1;
  xlUnderlineStyleNone     = -4142;

  msoThemeColorAccent1     =     5;
  msoThemeColorAccent3     =     7;
  msoThemeColorAccent6     =    10;
  msoThemeColorText2       =    15;
  msoThemeColorBackground1 =    14;
  msoLineDash              =     4;

{Chart Enummeration}
  xlBarClustered      =    57;
  xlColumns           =     2;
  xlColumnClustered   =    51;
  xl3DColumnClustered =    54;
  xlLine              =     4;
  xl3DLine            = -4101;
  msoTrue             =     1;

{Fill Pattern}
  msoPattern5Percent        = 1;
  msoPatternOutlinedDiamond = 41;


Type
 TEstResRC= class;

  TWEstResRC=Class(TForm)
    InterForma1             : TInterForma;
    Panel1: TPanel;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    btBusca: TBitBtn;
    dtFechaInicio: TDateTimePicker;
    dtFechaFinal: TDateTimePicker;
    edACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    grdReservas: TSGCtrl;
    qryVistaLineas: TQuery;
    Database1: TDatabase;
    qryVistaLineasID_ACREDITADO: TFloatField;
    qryVistaLineasNOMBRE: TStringField;
    qryVistaLineasID_PERS_ASOCIAD: TFloatField;
    qryVistaLineasASOCIADO: TStringField;
    qryVistaLineasID_PROM_ADMON: TFloatField;
    qryVistaLineasADMINISTRADOR: TStringField;
    qryVistaLineasCVE_METODOLOGIA: TStringField;
    qryVistaLineasCVE_GRUPO_ECO: TStringField;
    qryVistaLineasDESC_GRUPO_ECO: TStringField;
    qryVistaLineasCVE_CAT_MIN: TStringField;
    qryVistaLineasDESC_CAT_MINIMO: TStringField;
    qryVistaLineasID_CONTRATO: TFloatField;
    qryVistaLineasRESERVA_L_ANT: TFloatField;
    qryVistaLineasRESERVA_ACRE_ANT: TFloatField;
    qryVistaLineasTOTAL_LINEA_ANT: TFloatField;
    qryVistaLineasTOTAL_ACRE_ANT: TFloatField;
    qryVistaLineasPCT_RESERVA_ANT: TFloatField;
    qryVistaLineasTC_ANT: TFloatField;
    qryVistaLineasCALIF_ANT: TStringField;
    qryVistaLineasRESERVA_L_ACT: TFloatField;
    qryVistaLineasTOTAL_LINEA_ACT: TFloatField;
    qryVistaLineasTOTAL_ACRE_ACT: TFloatField;
    qryVistaLineasRESERVA_ACRE_ACT: TFloatField;
    qryVistaLineasPCT_RESERVA_ACT: TFloatField;
    qryVistaLineasTC_ACT: TFloatField;
    qryVistaLineasCALIF_ACT: TStringField;
    qryVistaLineasGTOT_RESERVA_POR_L: TFloatField;
    qryVistaLineasGTOT_POR_LINEA: TFloatField;
    qryVistaLineasGTOT_RESERVA_ACRE: TFloatField;
    qryVistaLineasGTOT_ACREDITADO: TFloatField;
    qryVistaLineasCVE_MONEDA: TFloatField;
    qryVistaLineasDESC_MONEDA: TStringField;
    qryVistaLineasDESC_CLAVE: TStringField;
    cbAcreditado: TCheckBox;
    rgVista: TRadioGroup;
    qryVistaAcreditado: TQuery;
    qryVistaLineasSITUACION: TStringField;
    SaveXLS: TSaveDialog;
    sbExportarDetalle: TSpeedButton;
    qryVistaAcreditadoID_ACREDITADO: TFloatField;
    qryVistaAcreditadoNOMBRE: TStringField;
    qryVistaAcreditadoCVE_GRUPO_ECO: TStringField;
    qryVistaAcreditadoDESC_GRUPO_ECO: TStringField;
    qryVistaAcreditadoRESERVA_ACRE_ANT: TFloatField;
    qryVistaAcreditadoTOTAL_ACRE_ANT: TFloatField;
    qryVistaAcreditadoRESERVA_ACRE_ACT: TFloatField;
    qryVistaAcreditadoTOTAL_ACRE_ACT: TFloatField;
    qryVistaAcreditadoGTOT_RESERVA_ACRE: TFloatField;
    qryVistaAcreditadoGTOT_ACREDITADO: TFloatField;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btBuscaClick(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure cbAcreditadoClick(Sender: TObject);
    procedure sbExportarDetalleClick(Sender: TObject);
    procedure rgVistaExit(Sender: TObject);
    procedure dtFechaInicioChange(Sender: TObject);
    private
    { Private declarations }
      procedure generaConsultaLinea(AFecha1, AMesAnterior, AAcreditado : string);
      procedure generaConsultaAcreditado(AFecha1, AMesAnterior, AAcreditado : string);
      procedure EnableCheckBox(var CheckBox : TCheckBox);
      procedure agregaDatos(aQuery : TQuery);
      procedure ExportarXLSDetalle (FileName: string; AVista : Integer);
      procedure ClearGrid;

    public
    { Public declarations } 
    Objeto : TEstResRC;
end;

 TEstResRC= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        ///CAMPO1                   : TInterCampo;
        ID_ACREDITADO             : TInterCampo;

        ParamCre                  : TParamCre;
        Persona                   : TPersona;

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


constructor TEstResRC.Create( AOwner : TComponent ); 
begin Inherited;

  ID_ACREDITADO    :=CreaCampo('ID_ACREDITADO',ftInteger,tsNinguno,tsNinguno,False);

  Persona := TPersona.Create(Self);
  Persona.MasterSource := Self;

  StpName  := ' ';
  UseQuery := False;
  HelpFile := 'IntEstResRC.Hlp';
  ShowMenuReporte:=True;

end;

Destructor TEstResRC.Destroy;
begin inherited;

  {If Persona <> Nil Then
    Persona.Free;}

end;


function TEstResRC.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWEstResRC;
begin
   W:=TWEstResRC.Create(Self);
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


Function TEstResRC.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('INinguno.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TEstResRC.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA NINGUNO********************)
(*                                                                              *)
(*  FORMA DE NINGUNO                                                            *)
(*                                                                              *)
(***********************************************FORMA NINGUNO********************)

procedure TWEstResRC.FormShow(Sender: TObject);
begin
  ///Objeto.CAMPO1.Control:=edCAMPO1;

  Objeto.ID_ACREDITADO.Control    :=edACREDITADO;

  Objeto.Persona.Id_Persona.Control := edACREDITADO;
  Objeto.Persona.Nombre.Control := edNOMBRE_ACRED;

  dtFechaInicio.DateTime := Now;
  dtFechaFinal.DateTime := Now;

  qryVistaLineas.DatabaseName := Objeto.Apli.DataBaseName;
  qryVistaLineas.SessionName  := Objeto.Apli.SessionName;

  qryVistaAcreditado.DatabaseName := Objeto.Apli.DataBaseName;
  qryVistaAcreditado.SessionName  := Objeto.Apli.SessionName;

end;

procedure TWEstResRC.FormDestroy(Sender: TObject);
begin
  ///Objeto.CAMPO1.Control:=nil;
  ///Objeto

  Objeto.ID_ACREDITADO.Control    :=Nil;

  Objeto.Persona.Id_Persona.Control :=Nil;
  Objeto.Persona.Nombre.Control :=Nil;

end;

procedure TWEstResRC.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWEstResRC.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWEstResRC.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWEstResRC.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


procedure TWEstResRC.btBuscaClick(Sender: TObject);
var
  iMesAnterior : Integer;
  DiaF, MesF, AnoF, DiaI, MesI, AnoI: Word;  //nama4756 F50-PO01
  Dias, Meses, Anos: integer;                //nama4756 F50-PO01
begin
  ClearGrid;

  DecodeDate( dtFechaInicio.DateTime, AnoI, MesI, DiaI); //nama4756 F50-PO01
  DecodeDate( dtFechaFinal.DateTime, AnoF, MesF, DiaF); //nama4756 F50-PO01
  Dias:=DiaF - DiaI;                                    //nama4756 F50-PO01
  Meses:=MesF - MesI;                                   //nama4756 F50-PO01
  Anos:=AnoF - AnoI;                                    //nama4756 F50-PO01
  if Dias < 0 then                                      //nama4756 F50-PO01
    Dec(Meses);                                         //nama4756 F50-PO01

  iMesAnterior:=Meses + (Anos * 12);                    //nama4756 F50-PO01

//  iMesAnterior := StrToInt( FormatDateTime('YYYYMM', dtFechaFinal.DateTime) ) -
//                    StrToInt( FormatDateTime('YYYYMM', dtFechaInicio.DateTime) );

  case rgVista.ItemIndex of
    0 : generaConsultaLinea(FormatDateTime('YYYYMM', dtFechaFinal.DateTime),
                    IntToStr(iMesAnterior), trim(edACREDITADO.Text));
    else generaConsultaAcreditado(FormatDateTime('YYYYMM', dtFechaFinal.DateTime),
                    IntToStr(iMesAnterior), trim(edACREDITADO.Text));
  end;
end;

procedure TWEstResRC.generaConsultaLinea(AFecha1, AMesAnterior, AAcreditado : string);
begin
  {MessageDlg('Valor AFecha1 :: '+ AFecha1 + #13+#10 +
  'Valor AMesAnterior :: '+ AMesAnterior + #13+#10+
  'Valor AAcreditado :: ' + AAcreditado, mtWarning, [mbOK], 0);}
  with qryVistaLineas do
  begin
    if Active then
      Close;
    Params[0].AsString := trim(AFecha1);
    Params[1].AsString := trim(AFecha1);
    Params[2].AsString := trim(AMesAnterior);
    Params[3].AsString := trim(AFecha1);
    Params[4].AsString := trim(AFecha1);
    Params[5].AsString := trim(AMesAnterior);
    Params[6].AsString := trim(AFecha1);
    Params[7].AsString := trim(AMesAnterior);
    Params[8].AsString := trim(AFecha1);
    Params[9].AsString := trim(AFecha1);
    Params[10].AsString := trim(AFecha1);
    Params[11].AsString := trim(AFecha1);
    Params[12].AsString := trim(AMesAnterior);
    Params[13].AsString := trim(AAcreditado);
    Prepare;
    Open;
  end;

  agregaDatos(qryVistaLineas);

end;

procedure TWEstResRC.btACREDITADOClick(Sender: TObject);
begin
   Objeto.Persona.ShowAll := True;
   If Objeto.Persona.Busca Then
   Begin
      cbAcreditado.Checked:= True;
      cbAcreditado.Enabled:= True;
   End;
end;

procedure TWEstResRC.EnableCheckBox(var CheckBox: TCheckBox);
begin
  If Not CheckBox.Checked Then Begin
    CheckBox.Checked:=False;
    CheckBox.Enabled:=False;
  End Else Begin
    CheckBox.Checked:=True;
    CheckBox.Enabled:=True;
  End;
end;

procedure TWEstResRC.cbAcreditadoClick(Sender: TObject);
begin
  EnableCheckBox(cbAcreditado);
  Objeto.Persona.Active := cbAcreditado.Checked;
end;

procedure TWEstResRC.agregaDatos(aQuery: TQuery);
begin

  grdReservas.AddQry(aQuery, // Query
            True, // Iniciar Grid, Limpiar Lineas Anteriores.
            True, // Cerrar Grid, Sin que Aparezcan mas Lineas Abajo.
            -1,   // Si Titulo1, o Titulo2 tienen Texto, es el alto del titulo.
            ALTO_COL,  // Alto del Header, -1 es el Default 32 Columnas
            ALTO_DOBLE,// Alto del las Lineas, 1 es el Default 32
            True); // ShowTitle

end;

procedure TWEstResRC.generaConsultaAcreditado(AFecha1, AMesAnterior, AAcreditado: string);
begin

  {MessageDlg('Valor AFecha1 :: '+ AFecha1 + #13+#10 +
  'Valor AMesAnterior :: '+ AMesAnterior + #13+#10+
  'Valor AAcreditado :: ' + AAcreditado, mtWarning, [mbOK], 0);}
  with qryVistaAcreditado do
  begin
    if Active then
      Close;
    Params[0].AsString := trim(AFecha1);
    Params[1].AsString := trim(AFecha1);
    Params[2].AsString := trim(AMesAnterior);
    Params[3].AsString := trim(AFecha1);
    Params[4].AsString := trim(AFecha1);
    Params[5].AsString := trim(AMesAnterior);
    Params[6].AsString := trim(AFecha1);
    Params[7].AsString := trim(AMesAnterior);
    Params[8].AsString := trim(AFecha1);
    Params[9].AsString := trim(AFecha1);
    Params[10].AsString := trim(AFecha1);
    Params[11].AsString := trim(AFecha1);
    Params[12].AsString := trim(AMesAnterior);
    Params[13].AsString := trim(AAcreditado);
    Prepare;
    Open;
  end;

  agregaDatos(qryVistaAcreditado);

end;

procedure TWEstResRC.ExportarXLSDetalle(FileName: string; AVista : Integer);
var
  XLApp, XLSheet: Variant;
  Range, Chart, Serie: Variant;
  Row, RowIni, CurrTipo: integer;
  sVista : String;
  i, z : integer;

  procedure BorderRange (RangeStr: string);
  begin
    Range                                        := XLSheet.Range [RangeStr];

    Range.Borders [xlDiagonalDown].LineStyle     := xlNone;
    Range.Borders [xlDiagonalUp].LineStyle       := xlNone;
    Range.Borders [xlEdgeLeft].LineStyle         := xlContinuous;
    Range.Borders [xlEdgeLeft].Color             := 6064871;
    Range.Borders [xlEdgeLeft].TintAndShade      := 0.399981688894314;
    Range.Borders [xlEdgeLeft].Weight            := xlThin;

    Range.Borders [xlEdgeTop].LineStyle          := xlContinuous;
    Range.Borders [xlEdgeTop].Color              := 6064871;
    Range.Borders [xlEdgeTop].TintAndShade       := 0.399981688894314;
    Range.Borders [xlEdgeTop].Weight             := xlThin;

    Range.Borders [xlEdgeBottom].LineStyle       := xlContinuous;
    Range.Borders [xlEdgeBottom].Color           := 6064871;
    Range.Borders [xlEdgeBottom].TintAndShade    := 0.399981688894314;
    Range.Borders [xlEdgeBottom].Weight          := xlThin;

    Range.Borders [xlEdgeRight].LineStyle        := xlContinuous;
    Range.Borders [xlEdgeRight].Color            := 6064871;
    Range.Borders [xlEdgeRight].TintAndShade     := 0.399981688894314;
    Range.Borders [xlEdgeRight].Weight           := xlThin;

    Range.Borders [xlInsideVertical].LineStyle   := xlNone;
    Range.Borders [xlInsideHorizontal].LineStyle := xlNone;
  end;

begin


  XLApp := CreateOleObject('Excel.Application');
  try
    Cursor              := crHourGlass;
    XLApp.Visible       := False;
    XLApp.DisplayAlerts := False;
    XLApp.Workbooks.Add(xlWBatWorkSheet);

    {Inicia la generación de la tabla}
    XLSheet      := XLApp.Workbooks[1].WorkSheets[1];
    XLSheet.Name := 'Reporte';

    { http://instant-eyedropper.com/info/html_color_code/ }
    sVista := '';
    case AVista of
      0 : sVista := 'Reporte agrupado por Acreditado y Línea de Crédito';
      1 : sVista := 'Reporte agrupado por Acreditado';
    end;


    {Ancho del renglon de encabezados}
    Range := XLSheet.Range ['5:5'];
    Range.RowHeight  := 30;
    Range.HorizontalAlignment := xlHAlignCenter;
    Range.VerticalAlignment := xlHAlignCenter;
    Range.WrapText := True;
    Range.Orientation := 0;
    Range.AddIndent := False;
    Range.IndentLevel := 0;
    Range.ShrinkToFit := False;
    Range.ReadingOrder := xlContext;
    Range.MergeCells := False;
    Range := XLSheet.Range ['1:10000'];
    Range.Font.Name := 'Calibri';
    Range.Font.Size := 9;
    Range.Interior.Pattern             := xlSolid;
    Range.Interior.PatternColorIndex   := xlAutomatic;
    Range.Interior.PatternTintAndShade := 0;
    Range.Interior.ThemeColor          := xlThemeColorDark1;
    Range.Interior.TintAndShade        := 0;

    {Encabezado de las columnas}
    if AVista = 0 then
    begin
      XLSheet.Cells [5,  1].Formula  := 'Id Acreditado';
      XLSheet.Cells [5,  2].Formula  := 'Nombre';
      XLSheet.Cells [5,  3].Formula  := 'Id Asociado';
      XLSheet.Cells [5,  4].Formula  := 'Asociado';
      XLSheet.Cells [5,  5].Formula  := 'Id Promotor';
      XLSheet.Cells [5,  6].Formula  := 'Administrador';
      XLSheet.Cells [5,  7].Formula  := 'Cve Metodología';
      XLSheet.Cells [5,  8].Formula  := 'Metodología';
      XLSheet.Cells [5,  9].Formula  := 'Cve. Gpo. Eco.';
      XLSheet.Cells [5,  10].Formula := 'Grupo Económico';
      XLSheet.Cells [5,  11].Formula := 'Cve. Cat. Mínimo';
      XLSheet.Cells [5,  12].Formula := 'Descripción de Cat. Mínimo';
      XLSheet.Cells [5,  13].Formula := 'Id Línea';
      XLSheet.Cells [5,  14].Formula := 'Reservas por Autorización';
      XLSheet.Cells [5,  15].Formula := 'Reservas por Acreditado';
      XLSheet.Cells [5,  16].Formula := 'Total por Línea';
      XLSheet.Cells [5,  17].Formula := 'Total por Acreditado';
      XLSheet.Cells [5,  18].Formula := 'Pct de Reserva';
      XLSheet.Cells [5,  19].Formula := 'TC';
      XLSheet.Cells [5,  20].Formula := 'Calificación';
      XLSheet.Cells [5,  21].Formula := 'Reservas por Autorización';
      XLSheet.Cells [5,  22].Formula := 'Reservas por Acreditado';
      XLSheet.Cells [5,  23].Formula := 'Total por Línea';
      XLSheet.Cells [5,  24].Formula := 'Total por Acreditado';
      XLSheet.Cells [5,  25].Formula := 'Pct de Reserva';
      XLSheet.Cells [5,  26].Formula := 'TC';
      XLSheet.Cells [5,  27].Formula := 'Calificación';
      XLSheet.Cells [5,  28].Formula := 'Resevas por Autorización';
      XLSheet.Cells [5,  29].Formula := 'Total de la Autorización';
      XLSheet.Cells [5,  30].Formula := 'Resevas por Acreditado';
      XLSheet.Cells [5,  31].Formula := 'Adeudo Total Acreditado';
      XLSheet.Cells [5,  32].Formula := 'Cve. Moneda';
      XLSheet.Cells [5,  33].Formula := 'Moneda';
      XLSheet.Cells [5,  34].Formula := 'Situación';

      {Anchos de Columna}
      XLSheet.Range['B:B'].ColumnWidth := 35;
      XLSheet.Range['D:D'].ColumnWidth := 35;
      XLSheet.Range['F:F'].ColumnWidth := 35;
      XLSheet.Range['H:H'].ColumnWidth := 35;
      XLSheet.Range['J:J'].ColumnWidth := 35;
      XLSheet.Range['K:K'].ColumnWidth := 16;
      XLSheet.Range['L:L'].ColumnWidth := 35;

      XLSheet.Range['N:N'].ColumnWidth := 16;
      XLSheet.Range['O:O'].ColumnWidth := 16;
      XLSheet.Range['P:P'].ColumnWidth := 16;
      XLSheet.Range['Q:Q'].ColumnWidth := 16;
      XLSheet.Range['U:U'].ColumnWidth := 16;
      XLSheet.Range['V:V'].ColumnWidth := 16;
      XLSheet.Range['W:W'].ColumnWidth := 16;
      XLSheet.Range['X:X'].ColumnWidth := 16;
      XLSheet.Range['AB:AB'].ColumnWidth := 16;
      XLSheet.Range['AC:AC'].ColumnWidth := 16;
      XLSheet.Range['AD:AD'].ColumnWidth := 16;
      XLSheet.Range['AE:AE'].ColumnWidth := 16;
      XLSheet.Range['AG:AG'].ColumnWidth := 15;
      XLSheet.Range['AH:AH'].ColumnWidth := 14;

      {Encabezado del reporte}
      XLSheet.Cells [1, 1].Formula := Caption;  // Título del reporte
      XLSheet.Cells [2, 1].Formula := sVista;
      XLSheet.Range ['A2:F2'].Merge;
      XLSheet.Range ['A2'].HorizontalAlignment := xlHAlignLeft;
      XLSheet.Range ['A1:F1'].Merge;
      XLSheet.Range ['A1'].HorizontalAlignment := xlHAlignLeft;
      Range := XLSheet.Range ['A1:F2'];
      Range.Font.Color := clWhite;
      Range.Font.Bold := True;
      Range.Interior.Pattern             := xlSolid;
      Range.Interior.PatternTintAndShade := 0;
      Range.Interior.Color               := 6064871;
      Range.Interior.TintAndShade        := 0;


      XLSheet.Range ['A5:AH5'].HorizontalAlignment := xlHAlignLeft;
      Range := XLSheet.Range ['A5:AH5'];     ///rucj4248
      Range.Font.Color := clWhite;
      Range.Font.Bold := True;
      Range.Interior.Pattern             := xlSolid;
      Range.Interior.PatternColorIndex   := xlAutomatic;
      Range.Interior.PatternTintAndShade := 0;
      Range.Interior.Color               := 6064871;
      //Range.Interior.ThemeColor          := xlThemeColorAccent6;
      Range.Interior.TintAndShade        := 0;


      XLSheet.Cells [4, 14].Formula :=  FormatDateTime('YYYYMM', dtFechaInicio.DateTime) + '  ( fecha 1 )';
      XLSheet.Range ['N4:T4'].Merge;
      Range := XLSheet.Range ['N4:Q4'];
      Range.HorizontalAlignment := xlHAlignCenter;
      Range.Font.Color := clWhite;
      Range.Font.Bold := True;
      Range.Interior.Pattern             := xlSolid;
      Range.Interior.PatternColorIndex   := xlAutomatic;
      Range.Interior.PatternTintAndShade := 0;
      //Range.Interior.ThemeColor          := xlThemeColorAccent6;
      //Range.Interior.TintAndShade        := 0.399981688894314;
      Range.Interior.Color               := 6064871;
      Range.Interior.TintAndShade        := 0;

      XLSheet.Cells [4, 21].Formula := FormatDateTime('YYYYMM', dtFechaFinal.DateTime) + '  ( fecha 1+t )';
      XLSheet.Range ['U4:AA4'].Merge;
      Range := XLSheet.Range ['U4:X4'];
      Range.HorizontalAlignment := xlHAlignCenter;
      Range.Font.Color := clWhite;
      Range.Font.Bold := True;
      Range.Interior.Pattern             := xlSolid;
      Range.Interior.PatternColorIndex   := xlAutomatic;
      Range.Interior.PatternTintAndShade := 0;
      Range.Interior.Color               := 6064871;
      Range.Interior.TintAndShade        := 0;

      XLSheet.Cells [4, 28].Formula := 'Comparación ( fecha 1+t - fecha 1 )';
      XLSheet.Range ['AB4:AE4'].Merge;
      Range := XLSheet.Range ['AB4:AE4'];
      Range.HorizontalAlignment := xlHAlignCenter;
      Range.Font.Color := clWhite;
      Range.Font.Bold := True;
      Range.Interior.Pattern             := xlSolid;
      Range.Interior.PatternColorIndex   := xlAutomatic;
      Range.Interior.PatternTintAndShade := 0;
      //Range.Interior.ThemeColor          := xlThemeColorAccent6;
      //Range.Interior.TintAndShade        := 0.399981688894314;
      Range.Interior.Color               := 6064871;
      Range.Interior.TintAndShade        := 0;


      Row := 6;
      qryVistaLineas.First;
      while not qryVistaLineas.Eof do
      begin
        XLSheet.Cells [Row,  1].Formula  := qryVistaLineas.FieldByName ('ID_ACREDITADO').AsString;
        XLSheet.Cells [Row,  2].Formula  := qryVistaLineas.FieldByName ('NOMBRE').AsString;
        XLSheet.Cells [Row,  3].Formula  := qryVistaLineas.FieldByName ('ID_PERS_ASOCIAD').AsString;
        XLSheet.Cells [Row,  4].Formula  := qryVistaLineas.FieldByName ('ASOCIADO').AsString;
        XLSheet.Cells [Row,  5].Formula  := qryVistaLineas.FieldByName ('ID_PROM_ADMON').AsString;
        XLSheet.Cells [Row,  6].Formula  := qryVistaLineas.FieldByName ('ADMINISTRADOR').AsString;
        XLSheet.Cells [Row,  7].Formula  := qryVistaLineas.FieldByName ('CVE_METODOLOGIA').AsString;
        XLSheet.Cells [Row,  8].Formula  := qryVistaLineas.FieldByName ('DESC_CLAVE').AsString;
        XLSheet.Cells [Row,  9].Formula  := qryVistaLineas.FieldByName ('CVE_GRUPO_ECO').AsString;
        XLSheet.Cells [Row,  10].Formula  := qryVistaLineas.FieldByName ('DESC_GRUPO_ECO').AsString;
        XLSheet.Cells [Row,  11].Formula := qryVistaLineas.FieldByName ('CVE_CAT_MIN').AsString;
        XLSheet.Cells [Row,  12].Formula := qryVistaLineas.FieldByName ('DESC_CAT_MINIMO').AsString;
        XLSheet.Cells [Row,  13].Formula := qryVistaLineas.FieldByName ('ID_CONTRATO').AsString;
        XLSheet.Cells [Row,  14].Formula := qryVistaLineas.FieldByName ('RESERVA_L_ANT').AsString;
        XLSheet.Cells [Row,  15].Formula := qryVistaLineas.FieldByName ('RESERVA_ACRE_ANT').AsString;
        XLSheet.Cells [Row,  16].Formula := qryVistaLineas.FieldByName ('TOTAL_LINEA_ANT').AsString;
        XLSheet.Cells [Row,  17].Formula := qryVistaLineas.FieldByName ('TOTAL_ACRE_ANT').AsString;
        XLSheet.Cells [Row,  18].Formula := qryVistaLineas.FieldByName ('PCT_RESERVA_ANT').AsString;
        XLSheet.Cells [Row,  19].Formula := qryVistaLineas.FieldByName ('TC_ANT').AsString;
        XLSheet.Cells [Row,  20].Formula := qryVistaLineas.FieldByName ('CALIF_ANT').AsString;
        XLSheet.Cells [Row,  21].Formula := qryVistaLineas.FieldByName ('RESERVA_L_ACT').AsString;
        XLSheet.Cells [Row,  22].Formula := qryVistaLineas.FieldByName ('RESERVA_ACRE_ACT').AsString;
        XLSheet.Cells [Row,  23].Formula := qryVistaLineas.FieldByName ('TOTAL_LINEA_ACT').AsString;
        XLSheet.Cells [Row,  24].Formula := qryVistaLineas.FieldByName ('TOTAL_ACRE_ACT').AsString;
        XLSheet.Cells [Row,  25].Formula := qryVistaLineas.FieldByName ('PCT_RESERVA_ACT').AsString;
        XLSheet.Cells [Row,  26].Formula := qryVistaLineas.FieldByName ('TC_ACT').AsString;
        XLSheet.Cells [Row,  27].Formula := qryVistaLineas.FieldByName ('CALIF_ACT').AsString;
        XLSheet.Cells [Row,  28].Formula := qryVistaLineas.FieldByName ('GTOT_RESERVA_POR_L').AsString;
        XLSheet.Cells [Row,  29].Formula := qryVistaLineas.FieldByName ('GTOT_POR_LINEA').AsString;
        XLSheet.Cells [Row,  30].Formula := qryVistaLineas.FieldByName ('GTOT_RESERVA_ACRE').AsString;
        XLSheet.Cells [Row,  31].Formula := qryVistaLineas.FieldByName ('GTOT_ACREDITADO').AsString;
        XLSheet.Cells [Row,  32].Formula := qryVistaLineas.FieldByName ('CVE_MONEDA').AsString;
        XLSheet.Cells [Row,  33].Formula := qryVistaLineas.FieldByName ('DESC_MONEDA').AsString;
        XLSheet.Cells [Row,  34].Formula := qryVistaLineas.FieldByName ('SITUACION').AsString;

        qryVistaLineas.Next;
        Inc (Row);
      end;

      for z := 6 to Row-1 do
        for i := 0 to 32 do
          if (i < 26) then // dado que las columnas sobrepazan la 'Z' debemos validar a partir de AA..AB..
            BorderRange(chr(ord('A') + i) + IntToStr(z) + ':' + chr(ord('A') + i) + IntToStr(z))
          else
            BorderRange('A'+chr(ord('A') + (i-25)) + IntToStr(z) + ':A' + chr(ord('A') + (i-25)) + IntToStr(z));


    end  /// Termina bloque if AVista = 0 then
    else begin
      XLSheet.Cells [5,  1].Formula   := 'Id Acreditado';
      XLSheet.Cells [5,  2].Formula   := 'Nombre';
      XLSheet.Cells [5,  3].Formula   := 'Cve. Grupo Económico';
      XLSheet.Cells [5,  4].Formula   := 'Grupo Económico';
      XLSheet.Cells [5,  5].Formula   := 'Reservas por Acreditado';
      XLSheet.Cells [5,  6].Formula   := 'Total por Acreditado';
      XLSheet.Cells [5,  7].Formula   := 'Reservas por Acreditado';
      XLSheet.Cells [5,  8].Formula   := 'Total por Acreditado';
      XLSheet.Cells [5,  9].Formula   := 'Resevas por Acreditado';
      XLSheet.Cells [5,  10].Formula  := 'Adeudo Total Acreditado';

      {Encabezado del reporte}
      XLSheet.Cells [1, 1].Formula := Caption;  // Título del reporte
      XLSheet.Cells [2, 1].Formula := sVista;
      XLSheet.Range ['A2:F2'].Merge;
      XLSheet.Range ['A2'].HorizontalAlignment := xlHAlignLeft;
      XLSheet.Range ['A1:F1'].Merge;
      XLSheet.Range ['A1'].HorizontalAlignment := xlHAlignLeft;
      Range := XLSheet.Range ['A1:F2'];
      Range.Font.Color := clWhite;
      Range.Font.Bold := True;
      Range.Interior.Pattern             := xlSolid;
      Range.Interior.PatternTintAndShade := 0;
      Range.Interior.Color               := 6064871;
      Range.Interior.TintAndShade        := 0;

      XLSheet.Range ['A5:J5'].HorizontalAlignment := xlHAlignLeft;
      Range := XLSheet.Range ['A5:J5'];
      Range.Font.Color := clWhite;
      Range.Font.Bold := True;
      Range.Interior.Pattern             := xlSolid;
      Range.Interior.PatternColorIndex   := xlAutomatic;
      Range.Interior.PatternTintAndShade := 0;
      Range.Interior.Color               := 6064871;
      Range.Interior.TintAndShade        := 0;


      XLSheet.Cells [4, 5].Formula := FormatDateTime('YYYYMM', dtFechaInicio.DateTime) + '  ( fecha 1 )';
      XLSheet.Range ['E4:F4'].Merge;
      Range := XLSheet.Range ['E4:F4'];
      Range.HorizontalAlignment := xlHAlignCenter;
      Range.Font.Color := clWhite;
      Range.Font.Bold := True;
      Range.Interior.Pattern             := xlSolid;
      Range.Interior.PatternColorIndex   := xlAutomatic;
      Range.Interior.PatternTintAndShade := 0;
      Range.Interior.Color               := 6064871;
      Range.Interior.TintAndShade        := 0;

      XLSheet.Cells [4, 7].Formula := FormatDateTime('YYYYMM', dtFechaFinal.DateTime) + '  ( fecha 1+t )';
      XLSheet.Range ['G4:H4'].Merge;
      Range := XLSheet.Range ['G4:H4'];
      Range.HorizontalAlignment := xlHAlignCenter;
      Range.Font.Color := clWhite;
      Range.Font.Bold := True;
      Range.Interior.Pattern             := xlSolid;
      Range.Interior.PatternColorIndex   := xlAutomatic;
      Range.Interior.PatternTintAndShade := 0;
      Range.Interior.Color               := 6064871;
      Range.Interior.TintAndShade        := 0;

      XLSheet.Cells [4, 9].Formula := 'Comparación ( fecha 1+t - fecha 1 )';
      XLSheet.Range ['I4:J4'].Merge;
      Range := XLSheet.Range ['I4:J4'];
      Range.HorizontalAlignment := xlHAlignCenter;
      Range.Font.Color := clWhite;
      Range.Font.Bold := True;
      Range.Interior.Pattern             := xlSolid;
      Range.Interior.PatternColorIndex   := xlAutomatic;
      Range.Interior.PatternTintAndShade := 0;
      Range.Interior.Color               := 6064871;
      Range.Interior.TintAndShade        := 0;

      {Anchos de Columna}
      XLSheet.Range['B:B'].ColumnWidth := 35;
      XLSheet.Range['D:D'].ColumnWidth := 35;

      XLSheet.Range['E:E'].ColumnWidth := 16;
      XLSheet.Range['F:F'].ColumnWidth := 16;
      XLSheet.Range['G:G'].ColumnWidth := 16;
      XLSheet.Range['H:H'].ColumnWidth := 16;
      XLSheet.Range['I:I'].ColumnWidth := 16;
      XLSheet.Range['J:J'].ColumnWidth := 18;

      Row := 6;
      qryVistaAcreditado.First;
      while not qryVistaAcreditado.Eof do
      begin
        XLSheet.Cells [Row,  1].Formula  := qryVistaAcreditado.FieldByName ('ID_ACREDITADO').AsString;
        XLSheet.Cells [Row,  2].Formula  := qryVistaAcreditado.FieldByName ('NOMBRE').AsString;
        XLSheet.Cells [Row,  3].Formula  := qryVistaAcreditado.FieldByName ('CVE_GRUPO_ECO').AsString;
        XLSheet.Cells [Row,  4].Formula  := qryVistaAcreditado.FieldByName ('DESC_GRUPO_ECO').AsString;
        XLSheet.Cells [Row,  5].Formula  := qryVistaAcreditado.FieldByName ('RESERVA_ACRE_ANT').AsString;
        XLSheet.Cells [Row,  6].Formula  := qryVistaAcreditado.FieldByName ('TOTAL_ACRE_ANT').AsString;
        XLSheet.Cells [Row,  7].Formula  := qryVistaAcreditado.FieldByName ('RESERVA_ACRE_ACT').AsString;
        XLSheet.Cells [Row,  8].Formula  := qryVistaAcreditado.FieldByName ('TOTAL_ACRE_ACT').AsString;
        XLSheet.Cells [Row,  9].Formula  := qryVistaAcreditado.FieldByName ('GTOT_RESERVA_ACRE').AsString;
        XLSheet.Cells [Row,  10].Formula  := qryVistaAcreditado.FieldByName ('GTOT_ACREDITADO').AsString;

        qryVistaAcreditado.Next;
        Inc (Row);
      end;

      for z := 6 to Row-1 do
        for i := 0 to 9 do
          BorderRange(chr(ord('A') + i) + IntToStr(z) + ':' + chr(ord('A') + i) + IntToStr(z))   

    end;    /// Termina bloque else begin


  finally
    Cursor := crArrow;
    XLApp.Workbooks[1].SaveAs (FileName);
    XLApp.Quit;
    XLSheet  := Unassigned;
    Range    := Unassigned;
    XLApp    := Unassigned;
  end;

end;

procedure TWEstResRC.sbExportarDetalleClick(Sender: TObject);
var
  XLApp: Variant;
begin

  if Objeto.ValidaAccesoEsp('TESTRESRC_EXP',True,True) then
  begin
    sbExportarDetalle.Refresh;
    if SaveXLS.Execute then
    begin
      Cursor := crHourGlass;
      try
        ExportarXLSDetalle (SaveXLS.FileName, rgVista.ItemIndex);
        Cursor := crDefault;
        if MessageDlg ('Exportación exitosa. Deseas abrir el archivo?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          XLApp         := CreateOleObject('Excel.Application');
          XLApp.Visible := False;
          XLApp.Workbooks.Open (SaveXLS.FileName);
          XLApp.Visible := True;
        end;
      finally
        Cursor := crDefault;
      end;
    end;
  end

end;

procedure TWEstResRC.ClearGrid;
begin

 grdReservas.Clear('');

end;

procedure TWEstResRC.rgVistaExit(Sender: TObject);
begin
  ClearGrid;
end;

procedure TWEstResRC.dtFechaInicioChange(Sender: TObject);
begin
  ClearGrid;
end;

end.
