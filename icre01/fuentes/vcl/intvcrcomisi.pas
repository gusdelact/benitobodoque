// Sistema         : Clase de VCRCOMISION
// Fecha de Inicio : 03/06/2003
// Función forma   : Clase de VCRCOMISION
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntVcrcomisi;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Grids,

IntGenCre, IntCrComisio, IntParamCre, Tabs, IntCtoPanel, IntCtoHeader;

const C_WORDIMP = 'Importe';
      C_WORDIVA = 'IVA';
      C_WORDTOT = 'Total';
      C_WORDTOTPDO  = 'Tot. Pdo.';
      C_WORDPDO = 'Periodo ';

      C_ROWSEP = 5;
      C_ROWSEP2 = 17;
      C_WIDTH_FECHA  = 64;
      C_WIDTH_DINERO = 74;
      C_MAXFILTER = 5;
      C_FILTER : Array[0..C_MAXFILTER] of String = (' ',CSIT_AC,CSIT_LQ,CSIT_IM,CSIT_PA,CSIT_CA);

      C_COL_F_VENCIMIENTO = 2;
      C_COL_F_PROG_PAGO = 3;
      C_COL_F_PAGO = 4;

      C_COL_ID             = 0;
      C_COL_TITULO         = 5;
      C_COL_IMPPROGRAMADO  = 6;
      C_COL_IMPPAGADO      = 7;
      C_COL_IMPVENCIDO     = 8;
      C_COL_MORAPROGRAMADO = 9;
      C_COL_MORAPAGADO     = 10;
      C_COL_MORAVENCIDO    = 11;
Type
 TVcrcomisi = class;

 TPeriodo = (tpCapital, tpInteres, tpComision);

  TWVcrcomision=Class(TForm)
    InterForma1             : TInterForma;
    strGrdData: TStringGrid;
    lblDescripcion: TLabel;
    shp3: TShape;
    shp4: TShape;
    shp5: TShape;
    shp6: TShape;
    shp7: TShape;
    shp9: TShape;
    shp10: TShape;
    Shape8: TShape;
    shp11: TShape;
    shp8: TShape;
    Shape10: TShape;
    shp12: TShape;
    shp13: TShape;
    shp14: TShape;
    Shape17: TShape;
    lblFecha: TLabel;
    lblVencimiento: TLabel;
    lblProgramado: TLabel;
    lblPago: TLabel;
    lblImpProgramado: TLabel;
    lblImpPagado: TLabel;
    lblImpVencido: TLabel;
    lblImpComision: TLabel;
    lblImporteMora: TLabel;
    lblMoraProgramado: TLabel;
    lblMOraPAgado: TLabel;
    lblMoraVencido: TLabel;
    lblSituacion: TLabel;
    lblPeriodos: TLabel;
    tbstSituacion: TTabSet;
    lblTituloTotales: TLabel;
    Panel1: TPanel;
    btnRefrescar: TBitBtn;
    lblTotImpProgramado: TLabel;
    lblTotImpPagado: TLabel;
    lblTotMoraProgramado: TLabel;
    lblTotImpVencido: TLabel;
    lblTotMoraPagado: TLabel;
    lblTotMoraVencido: TLabel;
    Bevel1: TBevel;
    btnExcellAll: TBitBtn;
    btnExcellSelected: TBitBtn;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    icpCONTRATO: TInterCtoPanel;
    lbID_CREDITO: TLabel;
    edID_CREDITO: TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure strGrdDataDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure strGrdDataDblClick(Sender: TObject);
    procedure strGrdDataKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnRefrescarClick(Sender: TObject);
    procedure tbstSituacionChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure strGrdDataSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure edID_CREDITOKeyPress(Sender: TObject; var Key: Char);
    procedure btnExcellAllClick(Sender: TObject);
    procedure btnExcellSelectedClick(Sender: TObject);
    private
    { Private declarations }
     procedure MostrarPeriodosComision(nId_Credito : Integer; strSit_Comision : String);
     procedure MostrarDetallePeriodo;

      function BuscaSituacionPeriodo(nNUM_PERIODO : Integer; strCVE_COMISION : String) : String;     
      function Get_FiltroSituacion : String;
      function GetTabIndexBySIT_COMISION(strSit_Comision : String) : Integer;

     function Get_AplicaIva : Boolean;
     function BuscaRenglonPeriodo(nNUM_PERIODO : Integer; strCVE_COMISION : String) : Integer;           
    public
    { Public declarations }
     Objeto : TVcrcomisi;
     property FiltroSituacion : String Read Get_FiltroSituacion;
     property AplicaIVA : Boolean Read Get_AplicaIVA;     
    end;

 TVcrcomisi= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ID_CREDITO                   : TInterCampo;
        NUM_PERIODO                  : TInterCampo;
        CVE_COMISION                 : TInterCampo;
        IMP_COMISION                 : TInterCampo;
        IMP_PAGADO                   : TInterCampo;
        IMP_IVA                      : TInterCampo;
        IMP_IVA_PAGADO               : TInterCampo;
        IMP_MORATORIO                : TInterCampo;
        IMP_PAGADO_MORA              : TInterCampo;
        IMP_IVA_MORA                 : TInterCampo;
        IMP_PAG_IVA_MORA             : TInterCampo;
        SIT_COMISION                 : TInterCampo;
        F_VENCIMIENTO                : TInterCampo;
        F_PROG_PAGO                  : TInterCampo;
        F_PAGO                       : TInterCampo;

        ParamCre                     : TParamCre;
        Contrato                     : TCtrlCto;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte : Boolean; override;
      end;

implementation
{$R *.DFM}

constructor TVcrcomisi.Create( AOwner : TComponent );
begin Inherited;
      ID_CREDITO  := CreaCampo('ID_CREDITO',ftInteger,tsNinguno,tsNinguno,False);
                     ID_CREDITO.Caption:='Id. Credito';
      NUM_PERIODO := CreaCampo('NUM_PERIODO',ftInteger,tsNinguno,tsNinguno,False);
                     NUM_PERIODO.Caption:='Núm. Periodo';
      CVE_COMISION := CreaCampo('CVE_COMISION',ftstring,tsNinguno,tsNinguno,False);
                     NUM_PERIODO.Caption:='Cve. de Comisión';

      SIT_COMISION     := CreaCampo('SIT_COMISION',ftString,tsNinguno,tsNinguno,False);
      IMP_COMISION     := CreaCampo('IMP_COMISION',ftFloat,tsNinguno,tsNinguno,False);
      IMP_PAGADO       := CreaCampo('IMP_PAGADO',ftFloat,tsNinguno,tsNinguno,False);
      IMP_IVA          := CreaCampo('IMP_IVA',ftFloat,tsNinguno,tsNinguno,False);
      IMP_IVA_PAGADO   := CreaCampo('IMP_IVA_PAGADO',ftFloat,tsNinguno,tsNinguno,False);
      IMP_MORATORIO    := CreaCampo('IMP_MORATORIO',ftFloat,tsNinguno,tsNinguno,False);
      IMP_PAGADO_MORA  := CreaCampo('IMP_PAGADO_MORA',ftFloat,tsNinguno,tsNinguno,False);
      IMP_IVA_MORA     := CreaCampo('IMP_IVA_MORA',ftFloat,tsNinguno,tsNinguno,False);
      IMP_PAG_IVA_MORA := CreaCampo('IMP_PAG_IVA_MORA',ftFloat,tsNinguno,tsNinguno,False);
      F_VENCIMIENTO    := CreaCampo('F_VENCIMIENTO',ftDateTime,tsNinguno,tsNinguno,False);
      F_PROG_PAGO      := CreaCampo('F_PROG_PAGO',ftDateTime,tsNinguno,tsNinguno,False);
      F_PAGO           := CreaCampo('F_PAGO',ftDateTime,tsNinguno,tsNinguno,False);

      Contrato := TCtrlCto.Create(Self);
      Contrato.MasterSource := Self;
      Contrato.ID_CONTRATO.MasterField := 'ID_CONTRATO';

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntVcrcomisi.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TVcrcomisi.Destroy;
begin inherited;
end;


function TVcrcomisi.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWVcrcomision;
begin
   W:=TWVcrcomision.Create(Self);
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

Function TVcrcomisi.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('IVcrcomi.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

function TVcrcomisi.Reporte:Boolean;
begin Result := False;
end;


(***********************************************FORMA VCRCOMISION********************)
(*                                                                              *)
(*  FORMA DE VCRCOMISION                                                            *)
(*                                                                              *)
(***********************************************FORMA VCRCOMISION********************)

function TWVcrcomision.Get_AplicaIva : Boolean;
var QryIVA : TQuery;
begin
 QryIVA := TQuery.Create(Self);
 With QryIVA Do
  Try
   SessionName := Objeto.SessionName;
   DataBaseName := Objeto.DataBaseName;
   SQL.Clear;
   SQL.Add('SELECT B_APLICA_IVA FROM CR_CREDITO WHERE ID_CREDITO = '+IntToStr(Objeto.ID_CREDITO.AsInteger));
   Open;
   Result := FieldByName('B_APLICA_IVA').AsString = CVERDAD;
  Finally
   If Assigned(QryIVA) Then Begin Close; Free; End;
  End;
end;

function TWVcrcomision.BuscaRenglonPeriodo(nNUM_PERIODO : Integer; strCVE_COMISION : String) : Integer;
var str : String;
    I : Integer;
begin
 Result := 0; // Es 0 de default para posicionar el renglon en el primero recordando que este grid tiene FixedRows =  0
 With strGrdData Do
  For I := 0 To RowCount-1 Do
   Begin
    str := Cells[C_COL_ID,I];
    If (SearchStr(IntToStr(nNUM_PERIODO), str) > 0) And
       (SearchStr(strCVE_COMISION, str) > 0)   Then
     Begin
     Result := I;
     Break;
     End;
   End;
end;

function TWVcrcomision.BuscaSituacionPeriodo(nNUM_PERIODO : Integer; strCVE_COMISION : String) : String;
var Qry : TQuery;
begin
 Result := '';
 Qry := TQuery.Create(Nil);
 If Assigned(Qry) Then
  With (Qry) Do
   Try
    SessionName := Objeto.SessionName;
    DataBaseName := Objeto.DataBaseName;
    SQL.Clear;
    SQL.Add('SELECT SIT_COMISION '+
            'FROM CR_COMISION '+
            'WHERE ID_CREDITO = '+IntToStr(Objeto.ID_CREDITO.AsInteger)+
            '  AND NUM_PERIODO = '+IntToStr(nNUM_PERIODO)+
            '  AND CVE_COMISION = '#39+strCVE_COMISION+#39
            );
    Open;
    If Active Then
     Result := FieldByName('SIT_COMISION').AsString;
   Finally
    Close; Free;
   End;
end;

function TWVcrcomision.GetTabIndexBySIT_COMISION(strSit_Comision : String) : Integer;
var I : Integer;
begin
 Result := -1;
 For I := 0 To C_MAXFILTER Do
  If (C_FILTER[I] = strSit_Comision) Then
   Begin
   Result := I;
   Break;
   End;
end;

procedure TWVcrcomision.MostrarPeriodosComision(nId_Credito : Integer; strSit_Comision : String);
var Qry : TQuery;
    strId : String;
    bMuestraIva, bFirst : Boolean;
    I, nCountIM, nCountPer, nTopicRow, nTopicPeriodo : Integer;
    dImpProgramado,    dImpPagado,    dImpVencido,
    dMoraProgramado,    dMoraPagado,    dMoraVencido,
    dTotImpProgramado, dTotImpPagado,  dTotImpVencido,
    dTotMoraProgramado, dTotMoraPagado, dTotMoraVencido : Extended;

 function MoneyToFloat(strValue : String) : Extended;
 begin
  If (Trim(strValue) <> '') Then Result := StrToFloat(TrimChar(strValue,'$,'))
  Else Result := 0;
 end;

 function Give_TituloTotales(strSit : String) : String;
 var str : String;
 begin
  str := C_WORDTOT + ' de ';
  If (Trim(strSit) = '') Then str := C_WORDTOT
  Else If (strSit = CSIT_AC) Then str := str + tbstSituacion.Tabs[1]
  Else If (strSit = CSIT_LQ) Then str := str + tbstSituacion.Tabs[2]
  Else If (strSit = CSIT_IM) Then str := str + tbstSituacion.Tabs[3]
  Else If (strSit = CSIT_PA) Then str := str + tbstSituacion.Tabs[4]
  Else str := str + tbstSituacion.Tabs[5];
  Result := str;
 end;

begin
 bMuestraIva := AplicaIVA;
 Qry := TQuery.Create(Self);
 With Objeto, strGrdData Do
  Try
   // Busca la información a presentar
   Qry.SessionName := Objeto.SessionName;
   Qry.DataBaseName := Objeto.DataBaseName;
   Qry.SQL.Clear;
   Qry.SQL.Add('SELECT NVL(CA.DESC_COMISION,'#39+CERROR_CLAVE+#39') AS DESC_COMISION, CO.*'#13#10+
               'FROM CR_COMISION CO,'#13#10+
               '     CR_CAT_COMISION CA'#13#10+
               'WHERE CO.ID_CREDITO = '+IntToStr(nId_Credito)+#13#10+
               '     AND CA.CVE_COMISION (+)= CO.CVE_COMISION'#13#10);
   If (Trim(strSit_Comision)  <> '') Then
    Qry.SQL.Add(' AND CO.SIT_COMISION = '#39+strSit_Comision+#39);
   Qry.SQL.Add('ORDER BY CO.NUM_PERIODO, CO.CVE_COMISION');
   Qry.Open;

   // Limpia el Grid
   ClearGrid(strGrdData);
   For I := 0 To strGrdData.RowCount - 1 Do
    strGrdData.RowHeights[I] := strGrdData.DefaultRowHeight;
   strGrdData.RowCount := 1;
                                                 //  DESCRIPCION DE LAS COLUMNAS
   nTopicRow := -1;
   strGrdData.ColCount := 13;
   strGrdData.RowCount := 1500;
   strGrdData.ColWidths[C_COL_ID] := 0;                             // Indica el Identificador
   strGrdData.ColWidths[1] := 60;                                   // Descripción de la Clave
   strGrdData.ColWidths[C_COL_F_VENCIMIENTO]  := C_WIDTH_FECHA;     // Fecha de Vencimiento
   strGrdData.ColWidths[C_COL_F_PROG_PAGO]    := C_WIDTH_FECHA;     // Fecha Programada
   strGrdData.ColWidths[C_COL_F_PAGO]         := C_WIDTH_FECHA;     // Fecha de Pago
   strGrdData.ColWidths[C_COL_TITULO]         := 42;                // Titulos de (IMPORTE, IVA, TOTAL) unicamente se muetsra si Aplica IVA
   strGrdData.ColWidths[C_COL_IMPPROGRAMADO]  := C_WIDTH_DINERO;    // Importe de Comision Programado
   strGrdData.ColWidths[C_COL_IMPPAGADO]      := C_WIDTH_DINERO;    // Importe de Comision Pagado
   strGrdData.ColWidths[C_COL_IMPVENCIDO]     := C_WIDTH_DINERO;    // Importe de Comision  Vencido
   strGrdData.ColWidths[C_COL_MORAPROGRAMADO] := C_WIDTH_DINERO;    // Importe de Mora Programada
   strGrdData.ColWidths[C_COL_MORAPAGADO]     := C_WIDTH_DINERO;    // Importe de Mora Pagada
   strGrdData.ColWidths[C_COL_MORAVENCIDO]    := C_WIDTH_DINERO;    // Importe de Mora Vencido
   strGrdData.ColWidths[12] := 17;               // Situación

   // Inicia Totales Variables
   dTotImpProgramado   := 0;  dTotImpPagado       := 0;  dTotImpVencido      := 0;
   dTotMoraProgramado  := 0;  dTotMoraPagado      := 0;  dTotMoraVencido     := 0;

  // Inicia el llenado del GRID
  nCountPer := 0; nCountIM := 0; nTopicPeriodo := 0; bFirst := True; strId := '';
   While Not Qry.EOF Do
    Begin
     NUM_PERIODO.AsInteger    := Qry.FieldByName('NUM_PERIODO').AsInteger;
     SIT_COMISION.AsString    := Qry.FieldByName('SIT_COMISION').AsString;
     CVE_COMISION.AsString    := Qry.FieldByName('CVE_COMISION').AsString;     
     IMP_COMISION.AsFloat     := Qry.FieldByName('IMP_COMISION').AsFloat;
     IMP_PAGADO.AsFloat       := Qry.FieldByName('IMP_PAGADO').AsFloat;
     IMP_IVA.AsFloat          := Qry.FieldByName('IMP_IVA').AsFloat;
     IMP_IVA_PAGADO.AsFloat   := Qry.FieldByName('IMP_IVA_PAGADO').AsFloat;
     IMP_MORATORIO.AsFloat    := Qry.FieldByName('IMP_MORATORIO').AsFloat;
     IMP_PAGADO_MORA.AsFloat  := Qry.FieldByName('IMP_PAGADO_MORA').AsFloat;
     IMP_IVA_MORA.AsFloat     := Qry.FieldByName('IMP_IVA_MORA').AsFloat;
     IMP_PAG_IVA_MORA.AsFloat := Qry.FieldByName('IMP_PAG_IVA_MORA').AsFloat;
     F_VENCIMIENTO.AsDateTime := Qry.FieldByName('F_VENCIMIENTO').AsDateTime;
     F_PROG_PAGO.AsDateTime   := Qry.FieldByName('F_PROG_PAGO').AsDateTime;
     F_PAGO.AsDateTime        := Qry.FieldByName('F_PAGO').AsDateTime;

     Inc(nTopicRow); Inc(nCountPer);
     If (SIT_COMISION.AsString = CSIT_IM) Then Inc(nCountIM);

     If (nTopicPeriodo <> NUM_PERIODO.AsInteger) Then
      Begin
      If Not bFirst Then
       Begin
       // Agrega Pequeño Salto de Línea
       Cells[C_COL_ID,nTopicRow]  := strId;
       RowHeights[nTopicRow] := C_ROWSEP;
       Inc(nTopicRow); 
       
       Cells[C_COL_ID,nTopicRow]              := strId;
       Cells[C_COL_TITULO,nTopicRow]          := C_WORDTOTPDO;
       Cells[C_COL_IMPPROGRAMADO,nTopicRow]   := Format(CFORMAT_DINERO,[dTotImpProgramado]);
       Cells[C_COL_IMPPAGADO,nTopicRow]       := Format(CFORMAT_DINERO,[dTotImpPagado]);
       Cells[C_COL_MORAPROGRAMADO,nTopicRow]  := Format(CFORMAT_DINERO,[dTotMoraProgramado]);
       Cells[C_COL_MORAPAGADO,nTopicRow]      := Format(CFORMAT_DINERO,[dTotMoraPagado]);

      If (SIT_COMISION.AsString = CSIT_IM) Or (SIT_COMISION.AsString = CSIT_LQ) Then
       Begin
       Cells[C_COL_IMPVENCIDO,nTopicRow]  := Format(CFORMAT_DINERO,[dTotImpVencido]);
       Cells[C_COL_MORAVENCIDO,nTopicRow] := Format(CFORMAT_DINERO,[dTotMoraVencido]);
       End
      Else
       Begin
       Cells[C_COL_IMPVENCIDO,nTopicRow]  := C_STRZERO;
       Cells[C_COL_MORAVENCIDO,nTopicRow] := C_STRZERO;
       End;

       // Reinicia Totales Variables
       dTotImpProgramado   := 0;  dTotImpPagado       := 0;  dTotImpVencido      := 0;
       dTotMoraProgramado  := 0;  dTotMoraPagado      := 0;  dTotMoraVencido     := 0;

       Inc(nTopicRow);
       End;

      // Agrega Identificador del Periodo
      bFirst := False;
      nTopicPeriodo := NUM_PERIODO.AsInteger;
      Cells[C_COL_ID,nTopicRow]  := NUM_PERIODO.AsString;
      Cells[1,nTopicRow]  := C_WORDPDO + NUM_PERIODO.AsString;
      Inc(nTopicRow); // Agrega los Importes de la Comisión
      End;

     // Coloca Todos los datos del Importe
     strId := NUM_PERIODO.AsString  + ',' + SIT_COMISION.AsString + ',' + CVE_COMISION.AsString;
     Cells[C_COL_ID,nTopicRow]  := strId;
     Cells[1,nTopicRow]  := Qry.FieldByName('DESC_COMISION').AsString;
     RowHeights[nTopicRow] := C_ROWSEP2;

     Inc(nTopicRow);
     Cells[C_COL_ID,nTopicRow]  := strId;
     If (F_VENCIMIENTO.AsDateTime > 0) Then Cells[C_COL_F_VENCIMIENTO,nTopicRow]  := FormatDateTime(CFORMAT_FECHA,F_VENCIMIENTO.AsDateTime);
     If (F_PROG_PAGO.AsDateTime > 0)   Then Cells[C_COL_F_PROG_PAGO,nTopicRow]  := FormatDateTime(CFORMAT_FECHA,F_PROG_PAGO.AsDateTime);
     If (F_PAGO.AsDateTime > 0)        Then Cells[C_COL_F_PAGO,nTopicRow]  := FormatDateTime(CFORMAT_FECHA,F_PAGO.AsDateTime);
     Cells[C_COL_TITULO,nTopicRow]         := C_WORDIMP;
     Cells[C_COL_IMPPROGRAMADO,nTopicRow]  := Format(CFORMAT_DINERO,[IMP_COMISION.AsFloat]);
     Cells[C_COL_IMPPAGADO,nTopicRow]      := Format(CFORMAT_DINERO,[IMP_PAGADO.AsFloat]);
     Cells[C_COL_MORAPROGRAMADO,nTopicRow] := Format(CFORMAT_DINERO,[IMP_MORATORIO.AsFloat]);
     Cells[C_COL_MORAPAGADO,nTopicRow]     := Format(CFORMAT_DINERO,[IMP_PAGADO_MORA.AsFloat]);
     If (SIT_COMISION.AsString = CSIT_IM) Or (SIT_COMISION.AsString = CSIT_LQ) Then
      Begin
      // Calcula el Importe Vencido y el Importe Vencido de Mora
      Cells[C_COL_IMPVENCIDO,nTopicRow]  := Format(CFORMAT_DINERO,[IMP_COMISION.AsFloat - IMP_PAGADO.AsFloat]);
      Cells[C_COL_MORAVENCIDO,nTopicRow] := Format(CFORMAT_DINERO,[IMP_MORATORIO.AsFloat - IMP_PAGADO_MORA.AsFloat]);
      End
     Else
      Begin
      Cells[C_COL_IMPVENCIDO,nTopicRow]  := C_STRZERO;
      Cells[C_COL_MORAVENCIDO,nTopicRow] := C_STRZERO;
      End;
      
     Cells[12,nTopicRow]  := SIT_COMISION.AsString;

     If bMuestraIva Then
      Begin
      // Agrega los Importes de IVA
      Inc(nTopicRow);
      Cells[C_COL_ID,nTopicRow]             := strId;
      Cells[C_COL_TITULO,nTopicRow]         := C_WORDIVA;
      Cells[C_COL_IMPPROGRAMADO,nTopicRow]  := Format(CFORMAT_DINERO,[IMP_IVA.AsFloat]);
      Cells[C_COL_IMPPAGADO,nTopicRow]      := Format(CFORMAT_DINERO,[IMP_IVA_PAGADO.AsFloat]);
      Cells[C_COL_MORAPROGRAMADO,nTopicRow] := Format(CFORMAT_DINERO,[IMP_IVA_MORA.AsFloat]);
      Cells[C_COL_MORAPAGADO,nTopicRow]     := Format(CFORMAT_DINERO,[IMP_PAG_IVA_MORA.AsFloat]);

      // Calcula los Totales
      dImpProgramado  := IMP_COMISION.AsFloat + IMP_IVA.AsFloat;
      dImpPagado      := IMP_PAGADO.AsFloat + IMP_IVA_PAGADO.AsFloat;
      dMoraProgramado := IMP_MORATORIO.AsFloat + IMP_IVA_MORA.AsFloat;
      dMoraPagado     := IMP_PAGADO_MORA.AsFloat + IMP_PAG_IVA_MORA.AsFloat;
      dImpVencido     := IMP_COMISION.AsFloat - IMP_PAGADO.AsFloat +
                         IMP_IVA.AsFloat - IMP_IVA_PAGADO.AsFloat;
      dMoraVencido    := IMP_MORATORIO.AsFloat - IMP_PAGADO_MORA.AsFloat +
                         IMP_IVA_MORA.AsFloat - IMP_PAG_IVA_MORA.AsFloat;

      If (SIT_COMISION.AsString = CSIT_IM) Or (SIT_COMISION.AsString = CSIT_LQ) Then
       Begin
       // Calcula el Importe Vencido de IVA del Importe de Comisión y el Importe de Mora Vencido de IVA del Importe de Comisión
       Cells[C_COL_IMPVENCIDO,nTopicRow]  := Format(CFORMAT_DINERO,[IMP_IVA.AsFloat - IMP_IVA_PAGADO.AsFloat]);
       Cells[C_COL_MORAVENCIDO,nTopicRow] := Format(CFORMAT_DINERO,[IMP_IVA_MORA.AsFloat - IMP_PAG_IVA_MORA.AsFloat]);
       End
      Else
       Begin
       Cells[C_COL_IMPVENCIDO,nTopicRow]  := C_STRZERO;
       Cells[C_COL_MORAVENCIDO,nTopicRow] := C_STRZERO;
       End;

      Inc(nTopicRow);
      Cells[C_COL_ID,nTopicRow]             := strId;
      Cells[C_COL_TITULO,nTopicRow]         := C_WORDTOT;
      Cells[C_COL_IMPPROGRAMADO,nTopicRow]  := Format(CFORMAT_DINERO,[dImpProgramado]);
      Cells[C_COL_IMPPAGADO,nTopicRow]      := Format(CFORMAT_DINERO,[dImpPagado]);
      Cells[C_COL_MORAPROGRAMADO,nTopicRow] := Format(CFORMAT_DINERO,[dMoraProgramado]);
      Cells[C_COL_MORAPAGADO,nTopicRow]     := Format(CFORMAT_DINERO,[dMoraPagado]);
      If (SIT_COMISION.AsString = CSIT_IM) Or (SIT_COMISION.AsString = CSIT_LQ) Then
       Begin
       Cells[C_COL_IMPVENCIDO,nTopicRow]  := Format(CFORMAT_DINERO,[dImpVencido]);
       Cells[C_COL_MORAVENCIDO,nTopicRow] := Format(CFORMAT_DINERO,[dMoraVencido]);
       End
      Else
       Begin
       Cells[C_COL_IMPVENCIDO,nTopicRow]  := C_STRZERO;
       Cells[C_COL_MORAVENCIDO,nTopicRow] := C_STRZERO;
       End; 

      dTotImpProgramado   := dTotImpProgramado + dImpProgramado;
      dTotImpPagado       := dTotImpPagado + dImpPagado;
      dTotImpVencido      := dTotImpVencido + dImpVencido;
      dTotMoraProgramado  := dTotMoraProgramado + dMoraProgramado;
      dTotMoraPagado      := dTotMoraPagado + dMoraPagado;
      dTotMoraVencido     := dTotMoraVencido + dMoraVencido;
      End;
    Qry.Next;
    End;

   // Totales Finales
    Begin
    // Agrega Pequeño Salto de Línea
    Inc(nTopicRow);
    Cells[C_COL_ID,nTopicRow]  := strId;
    RowHeights[nTopicRow] := C_ROWSEP;

    // Coloca el Total Final del Periodo
    Inc(nTopicRow);
    Cells[C_COL_ID,nTopicRow]             := strId;
    Cells[C_COL_TITULO,nTopicRow]         := C_WORDTOTPDO;
    Cells[C_COL_IMPPROGRAMADO,nTopicRow]  := Format(CFORMAT_DINERO,[dTotImpProgramado]);
    Cells[C_COL_IMPPAGADO,nTopicRow]      := Format(CFORMAT_DINERO,[dTotImpPagado]);
    Cells[C_COL_MORAPROGRAMADO,nTopicRow] := Format(CFORMAT_DINERO,[dTotMoraProgramado]);
    Cells[C_COL_MORAPAGADO,nTopicRow]     := Format(CFORMAT_DINERO,[dTotMoraPagado]);
    If (SIT_COMISION.AsString = CSIT_IM) Or (SIT_COMISION.AsString = CSIT_LQ) Then
     Begin
     Cells[C_COL_IMPVENCIDO,nTopicRow]  := Format(CFORMAT_DINERO,[dTotImpVencido]);
     Cells[C_COL_MORAVENCIDO,nTopicRow] := Format(CFORMAT_DINERO,[dTotMoraVencido]);
     End
    Else
     Begin
     Cells[C_COL_IMPVENCIDO,nTopicRow] := C_STRZERO;
     Cells[C_COL_MORAVENCIDO,nTopicRow] := C_STRZERO;
     End;
    End;

   // Muestra Totales de Periodos y coloca Titulos
   lblTituloTotales.Caption := Give_TituloTotales(strSit_Comision);
   If (Trim(strSit_Comision)  = '') Then
    lblPeriodos.Caption := 'Total de Periodos = '+IntToStr(nCountPer)+
                     '      Total de Periodos Impagados = '+IntToStr(nCountIM)
   Else
    lblPeriodos.Caption := 'Total de Periodos '+tbstSituacion.Tabs[GetTabIndexBySIT_COMISION(strSIT_COMISION)]+
                           ' = '+IntToStr(nCountPer);

   // Ajusta el tamaño del Grid a la cantidad de Resultados Mostrados
   strGrdData.RowCount := nTopicRow + 1;

   // Unicamente para Cuando No Aplica Iva se hace esta Suma para el Total de cada uno de los Periodos C_WORDTOTPDO
   If Not bMuestraIVA Then
    Begin
    dImpProgramado  := 0;  dImpPagado  := 0;    dImpVencido := 0;
    dMoraProgramado := 0;  dMoraPagado := 0;    dMoraVencido :=0;
    For I := 0 To RowCount - 1 Do
     Begin
     If IsInteger(Cells[C_COL_ID,I]) Then
      Begin
      dImpProgramado  := 0;  dImpPagado  := 0;    dImpVencido := 0;
      dMoraProgramado := 0;  dMoraPagado := 0;    dMoraVencido :=0;
      End
     Else If (Cells[C_COL_TITULO,I] = C_WORDTOTPDO) Then
      Begin
      Cells[C_COL_IMPPROGRAMADO,I]  := Format(CFORMAT_DINERO,[dImpProgramado ]);
      Cells[C_COL_IMPPAGADO,I]      := Format(CFORMAT_DINERO,[dImpPagado     ]);
      Cells[C_COL_IMPVENCIDO,I]     := Format(CFORMAT_DINERO,[dImpVencido    ]);
      Cells[C_COL_MORAPROGRAMADO,I] := Format(CFORMAT_DINERO,[dMoraProgramado]);
      Cells[C_COL_MORAPAGADO,I]     := Format(CFORMAT_DINERO,[dMoraPagado    ]);
      Cells[C_COL_MORAVENCIDO,I]    := Format(CFORMAT_DINERO,[dMoraVencido   ]);
      End
     Else
      Begin
      dImpProgramado  := dImpProgramado  + MoneyToFloat(Cells[C_COL_IMPPROGRAMADO,I]);
      dImpPagado      := dImpPagado      + MoneyToFloat(Cells[C_COL_IMPPAGADO,I]);
      dImpVencido     := dImpVencido     + MoneyToFloat(Cells[C_COL_IMPVENCIDO,I]);
      dMoraProgramado := dMoraProgramado + MoneyToFloat(Cells[C_COL_MORAPROGRAMADO,I]);
      dMoraPagado     := dMoraPagado     + MoneyToFloat(Cells[C_COL_MORAPAGADO,I]);
      dMoraVencido    := dMoraVencido    + MoneyToFloat(Cells[C_COL_MORAVENCIDO,I]);
      End;
     End;
    End;

   // Muestra Grandes Totales de Importe
   dImpProgramado  := 0;  dImpPagado  := 0;    dImpVencido := 0;
   dMoraProgramado := 0;  dMoraPagado := 0;    dMoraVencido :=0;
   For I := 0 To RowCount - 1 Do
      If ((Cells[C_COL_TITULO,I] = C_WORDTOT) And bMuestraIva)
          Or ((Cells[C_COL_TITULO,I] = C_WORDIMP) And Not bMuestraIva) Then
       Begin
       dImpProgramado  := dImpProgramado  + MoneyToFloat(Cells[C_COL_IMPPROGRAMADO,I]);
       dImpPagado      := dImpPagado      + MoneyToFloat(Cells[C_COL_IMPPAGADO,I]);
       dImpVencido     := dImpVencido     + MoneyToFloat(Cells[C_COL_IMPVENCIDO,I]);
       dMoraProgramado := dMoraProgramado + MoneyToFloat(Cells[C_COL_MORAPROGRAMADO,I]);
       dMoraPagado     := dMoraPagado     + MoneyToFloat(Cells[C_COL_MORAPAGADO,I]);
       dMoraVencido    := dMoraVencido    + MoneyToFloat(Cells[C_COL_MORAVENCIDO,I]);
       End;
   lblTotImpProgramado.Caption  := Format(CFORMAT_DINERO,[dImpProgramado]);
   lblTotImpPagado.Caption      := Format(CFORMAT_DINERO,[dImpPagado]);
   lblTotImpVencido.Caption     := Format(CFORMAT_DINERO,[dImpVencido]);
   lblTotMoraProgramado.Caption := Format(CFORMAT_DINERO,[dMoraProgramado]);
   lblTotMoraPagado.Caption     := Format(CFORMAT_DINERO,[dMoraPagado]);
   lblTotMoraVencido.Caption    := Format(CFORMAT_DINERO,[dMoraVencido]);

   If (dImpVencido > 0) Then lblTotImpVencido.Font.Color := clRed
   Else lblTotImpVencido.Font.Color := clBlack;

   If (dMoraVencido > 0) Then lblTotMoraVencido.Font.Color := clRed
   Else lblTotMoraVencido.Font.Color := clBlack;

  Finally
   If Assigned(Qry) Then
    Begin Qry.Close; Qry.Free; End;
  End;
end;

procedure TWVcrcomision.FormShow(Sender: TObject);
var nRow, nId_Contrato, nTempNUM_PERIODO : Integer;
    strTempCVE_COMISION : String;
begin
 edID_CREDITO.Text := Objeto.ID_CREDITO.AsString;
 Caption := 'Consulta de Periodos de Comisión del Crédito '+IntToStr(Objeto.ID_CREDITO.AsInteger);
 With Objeto Do
  Begin
  lbDempresa.Caption := ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := ParamCre.FECHA.AsString;
  lbDUsuario.Caption := ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

  nId_Contrato := Obten_Contrato(ID_CREDITO.AsInteger, Apli);
  Contrato.ID_CONTRATO.AsInteger := nId_Contrato;
  Contrato.FindKey([nId_Contrato]);
  icpCONTRATO.Frame := Contrato;
  icpCONTRATO.RefrescaInfo;

  { SI se indica el Periodo y la Clave de Comsión cuando se invoca la clase, entonces...

     La clase se ubicara en la pestaña correspondiente con la situación del periodo, ejemplo:
     Si el periodo solicitado tiene situación 'IM', se activara la pestaña de "Impagados"
     además de que se ubicará en el renglón en eñ que se encuentre el periodo.

    DE LO CONTRARIO

      La clase se ubicara siempre en el periodo 1 del Crédito 

    ***************************************************************************************************************
    NOTA : Cabe recordar que cada vez que se asigna o cambia de pestaña, se invoca el evento
           De onchange del componente "tbstSituacion", el cual *** MUESTRA LOS PERIODOS DE LA PESTAÑA SOLICITADA ***
    ***************************************************************************************************************       
  }

  If (NUM_PERIODO.AsInteger <> 0) And (Trim(CVE_COMISION.AsString) <> '') Then
   Begin
   nTempNUM_PERIODO := NUM_PERIODO.AsInteger;
   strTempCVE_COMISION := CVE_COMISION.AsString;
   tbstSituacion.TabIndex := GetTabIndexBySIT_COMISION(BuscaSituacionPeriodo(nTempNUM_PERIODO, strTempCVE_COMISION)); // Muestra Periodos
   nRow := BuscaRenglonPeriodo(nTempNUM_PERIODO, strTempCVE_COMISION);
   If AplicaIva Then strGrdData.Row := nRow + 1
   Else strGrdData.Row := nRow;
   End
  Else
   tbstSituacion.TabIndex :=  1; // Muestra Periodo Vigente
   
  If (Trim(strGrdData.Cells[C_COL_ID,0]) = '') Then // Si No Mostro Datos del Periodo Vigente Muestra Todos
   tbstSituacion.TabIndex := 0;
  End;
end;

procedure TWVcrcomision.FormDestroy(Sender: TObject);
begin
 {}
end;

procedure TWVcrcomision.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWVcrcomision.strGrdDataDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
const LIGHT_YELLOW = $00CCFFFF;
      DARK_GREEN = $00004000;

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
    str, strSit : String;
    bNoExistenDatos : Boolean;
begin
 str := '';
 If (Sender Is TStringGrid) Then
  With (Sender As TStringGrid) Do
   Begin
    bNoExistenDatos := (Trim(Cells[C_COL_ID,0]) = '');

    If (RowHeights[ARow] = C_ROWSEP) Then
     Begin
     // Separador
     Rect1 := Rect_(0, Rect.Top, Width,Rect.Bottom);
     Canvas.Brush.Color := clWhite;
     Canvas.FillRect(Rect1);
     Canvas.TextRect(Rect1, (Rect1.Right - Canvas.TextWidth(str)) div 2,
                            Rect1.Top, str);
     End
    Else If (RowHeights[ARow] = C_ROWSEP2) Then
     Begin
     // Descripción de la Comisión
     str := Cells[1,ARow];
     Rect1 := Rect_(0, Rect.Top, Width,Rect.Bottom);

     If Not (gdSelected In State) Then
      Canvas.Brush.Color := clWhite;

     Canvas.FillRect(Rect1);
     Canvas.TextRect(Rect1, Rect1.Left, Rect1.Top, str);
     End
    Else If (IsInteger(Cells[C_COL_ID, ARow])) Or (bNoExistenDatos) Then
     Begin
     // Periodo Amarillo
     If bNoExistenDatos Then str := CERROR_NOEXISTEN
     Else str := 'Periodo ' + Cells[C_COL_ID, ARow];

     Rect1 := Rect_(0, Rect.Top, Width,Rect.Bottom);
     Canvas.Brush.Color := LIGHT_YELLOW;
     Canvas.FillRect(Rect1);
     Canvas.Font.Style := [fsBold];
     Canvas.Font.Color := clBlack;
     Canvas.TextRect(Rect1, (Rect1.Right - Canvas.TextWidth(str)) div 2,
                            Rect1.Top, str);
     End
    Else
     Begin
      str := Cells[C_COL_ID,ARow];
      TruncateStr(str,',');
      strSit := TruncateStr(str,',');

      If (strSit = CSIT_AC) Then  Canvas.Font.Color := DARK_GREEN;
      If (strSit = CSIT_LQ) Then  Canvas.Font.Color := clBlue;
      If (strSit = CSIT_PA) Then  Canvas.Font.Color := clBlack;
      If (strSit = CSIT_IM) Then  Canvas.Font.Color := clRed;
      If (gdSelected In State) Then Canvas.Font.Color := clWhite;

      If (ColWidths[ACol] = C_WIDTH_DINERO) Then
       Canvas.TextRect(Rect,Rect.Right - Canvas.TextWidth(Cells[ACol, ARow]),Rect.Top,Cells[ACol, ARow])
      Else
       Canvas.TextRect(Rect,Rect.Left,Rect.Top,Cells[ACol, ARow]);
     End;
   End;
end;

procedure TWVcrcomision.MostrarDetallePeriodo;
var CrComisio : TCrComisio;
    str, strNum_Periodo, strSituacion, strCve_Comision : String;
begin
 With strGrdData Do
  Begin
  str := Cells[C_COL_ID,Row];
  strNum_Periodo  := TruncateStr(str,',');
  strSituacion    := TruncateStr(str,',');
  strCve_Comision := str;
  End;

  If IsInteger(strNum_Periodo) Then
   Begin
   Objeto.NUM_PERIODO.AsInteger := StrToInt(strNum_Periodo);
   Objeto.CVE_COMISION.AsString := strCve_Comision;
   
   CrComisio := TCrComisio.Create(Self);
    Try
     CrComisio.GetParams(Objeto);
     CrComisio.ParamCre := Objeto.ParamCre;
     CrComisio.FindKey([Objeto.ID_CREDITO.AsInteger,Objeto.NUM_PERIODO.AsInteger,Objeto.CVE_COMISION.AsString]);
     CrComisio.Catalogo;
    Finally
     If Assigned(CrComisio) Then CrComisio.Free;
    End;
   End;
end;

procedure TWVcrcomision.strGrdDataDblClick(Sender: TObject);
begin
 MostrarDetallePeriodo;
end;

procedure TWVcrcomision.strGrdDataKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var nTabIndex : Integer;
begin
 nTabIndex := tbstSituacion.TabIndex;
 If Key = VK_RETURN Then MostrarDetallePeriodo
 Else If (ssCtrl In Shift) And ((Key = Ord('C')) Or (Key = Ord('c'))) Then btnExcellSelectedClick(Self)
 Else If ((ssCtrl In Shift) And (ssShift In Shift) And (Key = VK_TAB))
         Or ((ssCtrl In Shift) And (Key = VK_PRIOR)) Then  Dec(nTabIndex)
 Else If ((ssCtrl In Shift) And (Key = VK_TAB))
         Or ((ssCtrl In Shift) And (Key = VK_NEXT)) Then Inc(nTabIndex);

 If (nTabIndex > tbstSituacion.Tabs.Count-1) Then nTabIndex := 0
 Else If (nTabIndex < 0) Then nTabIndex := tbstSituacion.Tabs.Count-1;
 tbstSituacion.TabIndex := nTabIndex;
end;

procedure TWVcrcomision.btnRefrescarClick(Sender: TObject);
begin
 MostrarPeriodosComision(Objeto.ID_CREDITO.AsInteger, FiltroSituacion);
end;

function TWVcrcomision.Get_FiltroSituacion : String;
begin
  Result := C_FILTER[tbstSituacion.TabIndex];
end;

procedure TWVcrcomision.tbstSituacionChange(Sender: TObject;
  NewTab: Integer; var AllowChange: Boolean);
begin
 MostrarPeriodosComision(Objeto.ID_CREDITO.AsInteger, C_FILTER[NewTab]);
end;

procedure TWVcrcomision.strGrdDataSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
 strGrdData.Hint := strGrdData.Cells[1,ARow];
end;

procedure TWVcrcomision.edID_CREDITOKeyPress(Sender: TObject;
  var Key: Char);
begin
 If Pos(Key,'0123456789'#8) = 0 Then Key := #0;
end;

procedure TWVcrcomision.btnExcellAllClick(Sender: TObject);
begin
 With strGrdData Do
  TakeDataGridToClipBoard(strGrdData,Rect(1,0,ColCount,RowCount));
end;

procedure TWVcrcomision.btnExcellSelectedClick(Sender: TObject);
begin
 With strGrdData Do
  TakeDataGridToClipBoard(strGrdData,Rect(1,Selection.Top,Selection.Right,Selection.Bottom));
end;

end.
