// Sistema         : Clase de VCRDOCUMENTO
// Fecha de Inicio : 01/07/2003
// Función forma   : Clase de VCRDOCUMENTO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntVcrdocume;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntCtoPanel, Grids,

IntGenCre, IntParamCre, Tabs, IntCrDocto, IntCtoHeader;

const
      C_WORDTOT = 'Total';
      C_ROWSEP = 5;
      C_WIDTH_FECHA  = 64;
      C_WIDTH_DINERO = 74;
      C_FILTER : Array[0..5] of String = (' ',CSIT_AC,CSIT_LQ,CSIT_IM,CSIT_PA,CSIT_CA);
      C_LABEL : Array[0..7] of String = ('Id','Nominal','Aforado','Remanente','Compra','Interés','Pagado','Vencido');
      

Type
 TVcrdocume= class;

  TWVcrdocumento=Class(TForm)
    InterForma1             : TInterForma;
    edID_CESION: TEdit;
    lbID_CREDITO: TLabel;
    icpCONTRATO: TInterCtoPanel;
    strGrdData1: TStringGrid;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    lblFecha: TLabel;
    lblPago: TLabel;
    Label1: TLabel;
    shp4: TShape;
    Shape1: TShape;
    shp7: TShape;
    lblProgramado: TLabel;
    shp6: TShape;
    lblSituacion: TLabel;
    Shape17: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Label3: TLabel;
    lbl3: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    Shape10: TShape;
    Label5: TLabel;
    tbstSituacion: TTabSet;
    lblPeriodos: TLabel;
    btnExcellAll: TBitBtn;
    btnExcellSelected: TBitBtn;
    Panel1: TPanel;
    btnRefrescar: TBitBtn;
    Edit1: TEdit;
    lblTituloTotales: TLabel;
    strGrdData2: TStringGrid;
    strGrdData3: TStringGrid;
    Shape2: TShape;
    Label2: TLabel;
    Shape7: TShape;
    lbl4: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure strGrdData1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure tbstSituacionChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure strGrdData1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnExcellAllClick(Sender: TObject);
    procedure btnExcellSelectedClick(Sender: TObject);
    procedure btnRefrescarClick(Sender: TObject);
    procedure strGrdData1DblClick(Sender: TObject);
    procedure strGrdData1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure strGrdData3TopLeftChanged(Sender: TObject);
    private
    { Private declarations }
     vgGrid : TStringGrid;

     procedure MostrarDetalleDocumento;
     procedure MostrarDetalleDocumentos(nId_Cesion, nTabIndex : Integer; strSit_Documento : String);
     function Get_FiltroSituacion : String;
    public
    { Public declarations }
    Objeto : TVcrdocume;
    property FiltroSituacion : String Read Get_FiltroSituacion;
    end;
 TVcrdocume= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ID_CESION               : TInterCampo;
        ID_DOCUMENTO            : TInterCampo;
        NUM_PERIODO_DOC         : TInterCampo;
        CVE_TIPO_INTERES        : TInterCampo;
        DESC_TIPO_INTERES       : TInterCampo;
        CVE_DOCUMENTO           : TInterCampo;
        F_COMPRA                : TInterCampo;
        F_EMISION               : TInterCampo;
        IMP_NOMINAL             : TInterCampo;
        IMP_COMPRA              : TInterCampo;
        TASA_DESCUENTO          : TInterCampo;
        TASA_AFORO              : TInterCampo;
        SIT_DOCUMENTO           : TInterCampo;

        F_VENCIMIENTO           : TInterCampo;
        F_PROG_PAGO             : TInterCampo;
        F_PAGO                  : TInterCampo;
        IMP_PAGADO              : TInterCampo;
        IMP_MORATORIO           : TInterCampo;
        IMP_PAGADO_MORA         : TInterCampo;
        F_ALTA                  : TInterCampo;

        IMP_AFORADO             : TInterCampo;
        IMP_REMANENTE           : TInterCampo;
        IMP_INTERES             : TInterCampo;

        Contrato                : TCtrlCto;
        ParamCre                : TParamCre;

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


constructor TVcrdocume.Create( AOwner : TComponent );
begin Inherited;
      ID_CESION        := CreaCampo('ID_CESION',ftFloat,tsNinguno,tsNinguno,False);
      ID_DOCUMENTO     := CreaCampo('ID_DOCUMENTO',ftString,tsNinguno,tsNinguno,False);
      NUM_PERIODO_DOC  := CreaCampo('NUM_PERIODO_DOC',ftFloat,tsNinguno,tsNinguno,False);
      CVE_TIPO_INTERES := CreaCampo('CVE_TIPO_INTERES',ftString,tsNinguno,tsNinguno,False);
      DESC_TIPO_INTERES:= CreaCampo('DESC_TIPO_INTERES',ftString,tsNinguno,tsNinguno,False);
      CVE_DOCUMENTO    := CreaCampo('CVE_DOCUMENTO',ftString,tsNinguno,tsNinguno,False);
      F_COMPRA         := CreaCampo('F_COMPRA',ftDateTime,tsNinguno,tsNinguno,False);
      F_EMISION        := CreaCampo('F_EMISION',ftDateTime,tsNinguno,tsNinguno,False);
      IMP_NOMINAL      := CreaCampo('IMP_NOMINAL',ftFloat,tsNinguno,tsNinguno,False);
      IMP_COMPRA       := CreaCampo('IMP_COMPRA',ftFloat,tsNinguno,tsNinguno,False);
      TASA_DESCUENTO   := CreaCampo('TASA_DESCUENTO',ftFloat,tsNinguno,tsNinguno,False);
      TASA_AFORO       := CreaCampo('TASA_AFORO',ftFloat,tsNinguno,tsNinguno,False);
      SIT_DOCUMENTO    := CreaCampo('SIT_DOCUMENTO',ftString,tsNinguno,tsNinguno,False);

      F_VENCIMIENTO    := CreaCampo('F_VENCIMIENTO',ftDateTime,tsNinguno,tsNinguno,False);
      F_PROG_PAGO      := CreaCampo('F_PROG_PAGO',ftDateTime,tsNinguno,tsNinguno,False);
      F_PAGO           := CreaCampo('F_PAGO',ftDateTime,tsNinguno,tsNinguno,False);
      IMP_PAGADO       := CreaCampo('IMP_PAGADO',ftFloat,tsNinguno,tsNinguno,False);
      IMP_MORATORIO    := CreaCampo('IMP_MORATORIO',ftFloat,tsNinguno,tsNinguno,False);
      IMP_PAGADO_MORA  := CreaCampo('IMP_PAGADO_MORA',ftFloat,tsNinguno,tsNinguno,False);
      F_ALTA           := CreaCampo('F_ALTA',ftDateTime,tsNinguno,tsNinguno,False);
      IMP_AFORADO      := CreaCampo('IMP_AFORADO',ftFloat,tsNinguno,tsNinguno,False);
      IMP_REMANENTE    := CreaCampo('IMP_REMANENTE',ftFloat,tsNinguno,tsNinguno,False);
      IMP_INTERES      := CreaCampo('IMP_INTERES',ftFloat,tsNinguno,tsNinguno,False);

      Contrato := TCtrlCto.Create(Self);
      Contrato.MasterSource := Self;
      Contrato.ID_CONTRATO.MasterField := 'ID_CONTRATO';

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntVcrdocume.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TVcrdocume.Destroy;
begin inherited;
end;


function TVcrdocume.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWVcrdocumento;
begin
   W:=TWVcrdocumento.Create(Self);
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

Function TVcrdocume.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('IVcrdocu.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

function TVcrdocume.Reporte:Boolean;
begin
 Result := False;
end;


(***********************************************FORMA VCRDOCUMENTO********************)
(*                                                                              *)
(*  FORMA DE VCRDOCUMENTO                                                            *)
(*                                                                              *)
(***********************************************FORMA VCRDOCUMENTO********************)

procedure TWVcrdocumento.FormShow(Sender: TObject);
var nId_Contrato : Integer;
begin
 With Objeto Do
  Begin
  lbDempresa.Caption := ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := ParamCre.FECHA.AsString;
  lbDUsuario.Caption := ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

  nId_Contrato := Obten_Contrato(ID_CESION.AsInteger, Apli);
  Contrato.ID_CONTRATO.AsInteger := nId_Contrato;
  Contrato.FindKey([nId_Contrato]);
  icpCONTRATO.Frame := Contrato;
  icpCONTRATO.RefrescaInfo;

  edID_CESION.Text := ID_CESION.AsString;
  MostrarDetalleDocumentos(ID_CESION.AsInteger,0,'');
  If strGrdData2.CanFocus Then strGrdData2.SetFocus;
  End;
end;

procedure TWVcrdocumento.FormDestroy(Sender: TObject);
begin
   //Objeto
end;

procedure TWVcrdocumento.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWVcrdocumento.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWVcrdocumento.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

function TWVcrdocumento.Get_FiltroSituacion : String;
begin
  Result := C_FILTER[tbstSituacion.TabIndex];
end;

procedure TWVcrdocumento.MostrarDetalleDocumentos(nId_Cesion, nTabIndex : Integer; strSit_Documento : String);

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

var Qry : TQuery;
    nCountPer, nCountIM, nTopicRow : Integer;
    strId : String;
begin
 Qry := TQuery.Create(Nil);
 If Assigned(Qry) Then
  With Objeto Do
  Try
   // Limpia y Reinicia el Grid
   nTopicRow := -1;
   ClearGrid(strGrdData1,0);
   ClearGrid(strGrdData2,0);
   ClearGrid(strGrdData3,0);

   strGrdData1.ColCount := 6;
   strGrdData1.RowCount := 1500;
   strGrdData1.ColWidths[0] := 0;                 // Indica el Número de Periodo y la Situación
   strGrdData1.ColWidths[1] := 165;               // Indica el Identificador de Documento
   strGrdData1.ColWidths[2] := 48;                // Tipo de Interés
   strGrdData1.ColWidths[3] := C_WIDTH_FECHA;     // Fecha de Compra
   strGrdData1.ColWidths[4] := C_WIDTH_FECHA;     // Fecha Programada
   strGrdData1.ColWidths[5] := C_WIDTH_FECHA;     // Fecha de Pago

   strGrdData2.ColCount := 8;
   strGrdData2.RowCount := strGrdData1.RowCount;

   strGrdData2.ColWidths[0] := 0;                 // Indica el Número de Periodo y la Situación
   strGrdData2.ColWidths[1] := C_WIDTH_DINERO;    // Importe Nominal
   strGrdData2.ColWidths[2] := C_WIDTH_DINERO;    // Importe Aforado
   strGrdData2.ColWidths[3] := C_WIDTH_DINERO;    // Importe Remanente
   strGrdData2.ColWidths[4] := C_WIDTH_DINERO;    // Importe Compra
   strGrdData2.ColWidths[5] := C_WIDTH_DINERO;    // Importe Interés
   strGrdData2.ColWidths[6] := C_WIDTH_DINERO;    // Importe Pagado
   strGrdData2.ColWidths[7] := C_WIDTH_DINERO;    // Importe Vencido

   strGrdData3.ColCount := 2;
   strGrdData3.RowCount := strGrdData1.RowCount;

   strGrdData3.ColWidths[0] := 0;                 // Indica el Número de Periodo y la Situación
   strGrdData3.ColWidths[1] := 17;                // Situación

   Qry.SessionName := Objeto.SessionName;
   Qry.DataBaseName := Objeto.DataBaseName;
   Qry.SQL.Clear;
   Qry.SQL.Add(
              ' SELECT'#13#10+
              '        CD.ID_CESION,'#13#10+
              '        CD.ID_DOCUMENTO,'#13#10+
              '        CD.NUM_PERIODO_DOC,'#13#10+
              '        CD.CVE_TIPO_INTERES,'#13#10+
              '        DECODE(CD.CVE_TIPO_INTERES,''IN'',''Inicio'','#13#10+
              '                                   ''VE'',''Venc.'',''Error'') AS DESC_TIPO_INTERES,'#13#10+
              '        CD.CVE_DOCUMENTO,'#13#10+
              '        CD.F_COMPRA,'#13#10+
              '        CD.F_EMISION,'#13#10+
              '        CD.IMP_NOMINAL,'#13#10+
              '        CD.IMP_COMPRA,'#13#10+
              '        CD.TASA_DESCUENTO,'#13#10+
              '        CD.TASA_AFORO,'#13#10+
              '        CD.SIT_DOCUMENTO,'#13#10+
              '        CA.IMP_CAPITAL,'#13#10+
              '        CA.F_VENCIMIENTO,'#13#10+
              '        CA.F_PROG_PAGO,'#13#10+
              '        CA.F_PAGO,'#13#10+
              '        CA.IMP_PAGADO,'#13#10+
              '        CA.IMP_MORATORIO,'#13#10+
              '        CA.IMP_PAGADO_MORA,'#13#10+
              '        CA.SIT_CAPITAL,'#13#10+
              '        CA.F_ALTA,'#13#10+
              '        CI.IMP_INTERES,'#13#10+
              '        CR.IMP_REMANENTE'#13#10+
              'FROM CR_DOCUMENTO CD,'#13#10+
              '     CR_CAPITAL CA,'#13#10+
              '     CR_INTERES CI,'#13#10+
              '     CR_REMANENTE CR'#13#10+
              '  WHERE CD.ID_CESION = '+ID_CESION.AsString+#13#10+
              '  AND CA.ID_CREDITO = CD.ID_CESION'#13#10+
              '  AND CI.ID_CREDITO = CD.ID_CESION'#13#10+
              '  AND CA.NUM_PERIODO = CD.NUM_PERIODO_DOC'#13#10+
              '  AND CI.NUM_PERIODO = CD.NUM_PERIODO_DOC'#13#10+
              '  AND CR.ID_CESION (+)= CD.ID_CESION'#13#10+
              '  AND CR.ID_DOCUMENTO (+)= CD.CVE_DOCUMENTO'#13#10
             );

    If (Trim(strSit_Documento) <> '') Then
     Qry.SQL.Add(' AND CD.SIT_DOCUMENTO = '#39+strSit_Documento+#39);
   Qry.SQL.Add('   AND CA.NUM_PERIODO = CD.NUM_PERIODO_DOC'#13#10);
   Edit1.text := Qry.SQL.Text;
   Qry.Open;

   nCountPer := 0; nCountIM := 0;
   While Not Qry.Eof Do
    Begin
     ID_CESION.AsInteger        := Qry.FieldByName('ID_CESION').AsInteger;
     ID_DOCUMENTO.AsString      := Qry.FieldByName('ID_DOCUMENTO').AsString;
     NUM_PERIODO_DOC.AsFloat    := Qry.FieldByName('NUM_PERIODO_DOC').AsFloat;
     CVE_TIPO_INTERES.AsString  := Qry.FieldByName('CVE_TIPO_INTERES').AsString;
     DESC_TIPO_INTERES.AsString := Qry.FieldByName('DESC_TIPO_INTERES').AsString;
     CVE_DOCUMENTO.AsString     := Qry.FieldByName('CVE_DOCUMENTO').AsString;
     F_COMPRA.AsDateTime        := Qry.FieldByName('F_COMPRA').AsDateTime;
     IMP_NOMINAL.AsFloat        := Qry.FieldByName('IMP_NOMINAL').AsFloat;
     IMP_COMPRA.AsFloat         := Qry.FieldByName('IMP_COMPRA').AsFloat;
     TASA_DESCUENTO.AsFloat     := Qry.FieldByName('TASA_DESCUENTO').AsFloat;
     TASA_AFORO.AsFloat         := Qry.FieldByName('TASA_AFORO').AsFloat;
     SIT_DOCUMENTO.AsString     := Qry.FieldByName('SIT_DOCUMENTO').AsString;

     F_PROG_PAGO.AsDateTime    := Qry.FieldByName('F_PROG_PAGO').AsDateTime;
     F_PAGO.AsDateTime         := Qry.FieldByName('F_PAGO').AsDateTime;
     IMP_PAGADO.AsFloat        := Qry.FieldByName('IMP_PAGADO').AsFloat;
     IMP_MORATORIO.AsFloat     := Qry.FieldByName('IMP_MORATORIO').AsFloat;
     IMP_AFORADO.AsFloat       := Qry.FieldByName('IMP_CAPITAL').AsFloat;
     IMP_REMANENTE.AsFloat     := Qry.FieldByName('IMP_REMANENTE').AsFloat;
     IMP_INTERES.AsFloat       := Qry.FieldByName('IMP_INTERES').AsFloat;
     IMP_PAGADO_MORA.AsFloat   := Qry.FieldByName('IMP_PAGADO_MORA').AsFloat;
     F_ALTA.AsDateTime         := Qry.FieldByName('F_ALTA').AsDateTime;

     strId := ID_CESION.AsString + ',' + ID_DOCUMENTO.AsString + ',' + SIT_DOCUMENTO.AsString;

     Inc(nCountPer);
     Inc(nTopicRow);
     If (SIT_DOCUMENTO.AsString = CSIT_IM) Then Inc(nCountIM);

     strGrdData1.Cells[0,nTopicRow] := strId;
     strGrdData1.Cells[1,nTopicRow] := ID_DOCUMENTO.AsString;
     strGrdData1.Cells[2,nTopicRow] := DESC_TIPO_INTERES.AsString;
     If (F_VENCIMIENTO.AsDateTime > 0) Then strGrdData1.Cells[3,nTopicRow] := FormatDateTime(CFORMAT_FECHA,F_COMPRA.AsDateTime);
     If (F_PROG_PAGO.AsDateTime > 0)   Then strGrdData1.Cells[4,nTopicRow] := FormatDateTime(CFORMAT_FECHA,F_PROG_PAGO.AsDateTime);
     If (F_PAGO.AsDateTime > 0)        Then strGrdData1.Cells[5,nTopicRow] := FormatDateTime(CFORMAT_FECHA,F_PAGO.AsDateTime);

     strGrdData2.Cells[0,nTopicRow] := strId;
     strGrdData2.Cells[1,nTopicRow] := Format(CFORMAT_DINERO,[IMP_NOMINAL.AsFloat]);
     strGrdData2.Cells[2,nTopicRow] := Format(CFORMAT_DINERO,[IMP_AFORADO.AsFloat]);
     strGrdData2.Cells[3,nTopicRow] := Format(CFORMAT_DINERO,[IMP_REMANENTE.AsFloat]); 
     strGrdData2.Cells[4,nTopicRow] := Format(CFORMAT_DINERO,[IMP_COMPRA.AsFloat]);
     strGrdData2.Cells[5,nTopicRow] := Format(CFORMAT_DINERO,[IMP_INTERES.AsFloat]);
     strGrdData2.Cells[6,nTopicRow] := Format(CFORMAT_DINERO,[IMP_PAGADO.AsFloat]);

     If (SIT_DOCUMENTO.AsString <> CSIT_AC) Then
      strGrdData2.Cells[7,nTopicRow] := Format(CFORMAT_DINERO,[IMP_AFORADO.AsFloat - IMP_PAGADO.AsFloat]);
     
     strGrdData3.Cells[0,nTopicRow] := strId;
     strGrdData3.Cells[1,nTopicRow] := SIT_DOCUMENTO.AsString;

     Qry.Next;
    End;
    // Muestra Totales de Periodos
    lblTituloTotales.Caption := Give_TituloTotales(strSit_Documento);
    If (Trim(strSit_Documento)  = '') Then
     lblPeriodos.Caption := 'Total de Periodos = '+IntToStr(nCountPer)+
                            '      Total de Periodos Impagados = '+IntToStr(nCountIM)
    Else
     lblPeriodos.Caption := 'Total de Periodos '+tbstSituacion.Tabs[nTabIndex]+' = '+IntToStr(nCountPer);

    // Ajusta el tamaño del Grid a la cantidad de Resultados Mostrados
    strGrdData1.RowCount := nTopicRow + 1;
    strGrdData2.RowCount := strGrdData1.RowCount;
    strGrdData3.RowCount := strGrdData1.RowCount;

    // Coloca el cursor en la Columna Visible 
    strGrdData2.Col := 1;    
  Finally
   If Assigned(Qry) Then Qry.Free;
  End;
end;

procedure TWVcrdocumento.MostrarDetalleDocumento;
var strId : String;
    strId_Cesion, strId_Documento : String;
    CrDocto : TCrDocto;
begin
 With strGrdData1 Do
  Begin
  strId := Cells[0,Row];
  strId_Cesion := TruncateStr(strId,',');
  strId_Documento := TruncateStr(strId,',');
  If (IsInteger(strId_Cesion)) And (Trim(strId_Documento) <> '') Then
   Begin
    CrDocto := TCrDocto.Create(Self);
    Try
     CrDocto.GetParams(Objeto);
     CrDocto.FindKey([StrToInt(strId_Cesion), strId_Documento]);
     CrDocto.ParamCre := Objeto.ParamCre;
     CrDocto.Catalogo;
    Finally
     If Assigned(CrDocto) Then CrDocto.Free;
    End;
   End;
  End;
end;

procedure TWVcrdocumento.strGrdData1DrawCell(Sender: TObject; ACol,
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
    str : String;
    bNoExistenDatos : Boolean;
    nLeftCol : Integer;
begin
 If (Sender Is TStringGrid) Then
  With (Sender As TStringGrid) Do
   Begin
    If (ACol = 1) And (Name = strGrdData1.Name) Then Canvas.Font.Name := 'Courier New' 
    Else Canvas.Font.Name := 'MS Sans Serif';

    bNoExistenDatos := (Trim(Cells[0,0]) = '');
    If (gdSelected In State) Then
     Canvas.Brush.Color := clNavy;

    If (IsInteger(Cells[0, ARow])) Or (bNoExistenDatos) Then
     Begin
     If bNoExistenDatos Then str := CERROR_NOEXISTEN;
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
      str := Cells[0,ARow];
      TruncateStr(str,',');
      TruncateStr(str,',');

      If (str = CSIT_AC) Then  Canvas.Font.Color := clGreen;
      If (str = CSIT_LQ) Then  Canvas.Font.Color := clBlue;
      If (str = CSIT_PA) Then  Canvas.Font.Color := clBlack;
      If (str = CSIT_IM) Then  Canvas.Font.Color := clRed;
      If (gdSelected In State) Then Canvas.Font.Color := clWhite;

      If Not (gdSelected In State) Then
       Begin
       If ((ARow Mod 2) = 0) Then Canvas.Brush.Color := LIGHT_GRAY
       Else Canvas.Brush.Color := clWhite;
       End;

      If (ColWidths[ACol] = C_WIDTH_DINERO) Then
       Canvas.TextRect(Rect,Rect.Right - Canvas.TextWidth(Cells[ACol, ARow]),Rect.Top,Cells[ACol, ARow])
      Else
       Canvas.TextRect(Rect,Rect.Left,Rect.Top,Cells[ACol, ARow]);
     End;

   If (Sender = strGrdData2) { And (ARow = 0) } Then
    Begin
    If (strGrdData2.LeftCol = 0) Then nLeftCol := 1
    Else nLeftCol := strGrdData2.LeftCol;
    
    lbl1.Caption := C_LABEL[nLeftCol];
    lbl2.Caption := C_LABEL[nLeftCol+1];
    lbl3.Caption := C_LABEL[nLeftCol+2];
    lbl4.Caption := C_LABEL[nLeftCol+3];
    End;

   End;
end;

procedure TWVcrdocumento.tbstSituacionChange(Sender: TObject;
  NewTab: Integer; var AllowChange: Boolean);
begin
 MostrarDetalleDocumentos(Objeto.ID_CESION.AsInteger, NewTab, C_FILTER[NewTab]);
end;

procedure TWVcrdocumento.btnRefrescarClick(Sender: TObject);
begin
 MostrarDetalleDocumentos(Objeto.ID_CESION.AsInteger, tbstSituacion.TabIndex, FiltroSituacion);
end;

procedure TWVcrdocumento.strGrdData1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var nTabIndex : Integer;
begin
 nTabIndex := tbstSituacion.TabIndex;
 If Key = VK_RETURN Then MostrarDetalleDocumento
 Else If (ssCtrl In Shift) And ((Key = Ord('C')) Or (Key = Ord('c'))) Then btnExcellSelectedClick(Self)
 Else If ((ssCtrl In Shift) And (ssShift In Shift) And (Key = VK_TAB))
         Or ((ssCtrl In Shift) And (Key = VK_PRIOR)) Then  Dec(nTabIndex)
 Else If ((ssCtrl In Shift) And (Key = VK_TAB))
         Or ((ssCtrl In Shift) And (Key = VK_NEXT)) Then Inc(nTabIndex);

 If (nTabIndex > tbstSituacion.Tabs.Count-1) Then nTabIndex := 0
 Else If (nTabIndex < 0) Then nTabIndex := tbstSituacion.Tabs.Count-1;
 tbstSituacion.TabIndex := nTabIndex;
end;

procedure TWVcrdocumento.btnExcellAllClick(Sender: TObject);
begin
 With strGrdData1 Do
  TakeDataGridToClipBoard(strGrdData1,Rect(1,0,ColCount,RowCount));
end;

procedure TWVcrdocumento.btnExcellSelectedClick(Sender: TObject);
begin
 With strGrdData1 Do
  TakeDataGridToClipBoard(strGrdData1,Rect(1,Selection.Top,Selection.Right,Selection.Bottom));
end;

procedure TWVcrdocumento.strGrdData1DblClick(Sender: TObject);
begin
 MostrarDetalleDocumento;
end;

procedure TWVcrdocumento.strGrdData1SelectCell(Sender: TObject; ACol,
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
     AsignaSeleccion( Sender As TStringGrid, strGrdData1 );
     AsignaSeleccion( Sender As TStringGrid, strGrdData2 );
     AsignaSeleccion( Sender As TStringGrid, strGrdData3 );
     vgGrid := Nil;
     End;
  End;

  if Sender = strGrdData2 Then
   CanSelect := ACol > 0;
end;

procedure TWVcrdocumento.strGrdData3TopLeftChanged(Sender: TObject);

  procedure AsignaTopRow( Sender, Grid : TStringGrid );
  begin
   if Sender <> Grid then
      Grid.TopRow := Sender.TopRow
  end;

begin
 If Sender Is TStringGrid Then
   Begin
   AsignaTopRow( Sender As TStringGrid, strGrdData1 );
   AsignaTopRow( Sender As TStringGrid, strGrdData2 );
   AsignaTopRow( Sender As TStringGrid, strGrdData3 );
   End;
end;

end.
