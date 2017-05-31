{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
// Sistema         : Clase de VCRCAPITAL
// Fecha de Inicio : 09/06/2003
// Función forma   : Clase de VCRCAPITAL
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntVcrcapita;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Grids,

IntGenCre, IntCrCapital, Tabs, IntParamCre, IntCtoPanel, IntCtoHeader;

const C_WORDIMP = 'Importe';
      C_WORDIVA = 'IVA';
      C_WORDTOT = 'Total';
      C_WORDPDO = 'Periodo ';

      C_ROWSEP = 5;
      C_WIDTH_FECHA  = 64;
      C_WIDTH_DINERO = 74;
      C_MAXFILTER = 5;
      C_FILTER : Array[0..C_MAXFILTER] of String = (' ',CSIT_AC,CSIT_LQ,CSIT_IM,CSIT_PA,CSIT_CA);

      C_COL_ID             = 0;
      C_COL_TITULO         = 5;
      C_COL_IMPPROGRAMADO  = 6;
      C_COL_IMPPAGADO      = 7;
      C_COL_IMPVENCIDO     = 8;
      C_COL_MORAPROGRAMADO = 9;
      C_COL_MORAPAGADO     = 10;
      C_COL_MORAVENCIDO    = 11;

Type
 TVcrcapita= class;

  TWVcrcapital=Class(TForm)
    InterForma1             : TInterForma;
    strGrdData: TStringGrid;
    lblPeriodos: TLabel;
    lblTituloTotales: TLabel;
    Bevel1: TBevel;
    lblTotMoraVencido: TLabel;
    lblTotMoraPagado: TLabel;
    lblTotMoraProgramado: TLabel;
    lblTotImpVencido: TLabel;
    lblTotImpPagado: TLabel;
    lblTotImpProgramado: TLabel;
    Panel1: TPanel;
    btnRefrescar: TBitBtn;
    tbstSituacion: TTabSet;
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
    PnlTitulos: TPanel;
    shp5: TShape;
    shp4: TShape;
    shp6: TShape;
    shp7: TShape;
    shp9: TShape;
    shp10: TShape;
    Shape8: TShape;
    shp11: TShape;
    shp8: TShape;
    Shape17: TShape;
    lblFecha: TLabel;
    lblVencimiento: TLabel;
    lblProgramado: TLabel;
    lblPago: TLabel;
    lblImpProgramado: TLabel;
    lblImpPagado: TLabel;
    lblImpVencido: TLabel;
    lblImpCapital: TLabel;
    lblSituacion: TLabel;
    Shape10: TShape;
    shp12: TShape;
    shp13: TShape;
    shp14: TShape;
    lblImporteMora: TLabel;
    lblMoraProgramado: TLabel;
    lblMOraPAgado: TLabel;
    lblMoraVencido: TLabel;
    Shape1: TShape;
    Label1: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure strGrdDataDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure strGrdDataDblClick(Sender: TObject);
    procedure strGrdDataKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tbstSituacionChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure btnRefrescarClick(Sender: TObject);
    procedure btnExcellAllClick(Sender: TObject);
    procedure btnExcellSelectedClick(Sender: TObject);
    private
    { Private declarations }
     m_bMuestraIva : Boolean;

     procedure MostrarPeriodosCapital(nId_Credito : Integer; strSit_Capital : String);
     procedure MostrarDetallePeriodo;
     function BuscaRenglonPeriodo(nNUM_PERIODO : Integer) : Integer;

     function BuscaSituacionPeriodo(nNUM_PERIODO : Integer) : String;
     function Get_FiltroSituacion : String;

     function GetTabIndexBySIT_CAPITAL(strSIT_CAPITAL : String) : Integer;     
     function Get_AplicaIva : Boolean;     
    public
    { Public declarations }
     Objeto : TVcrcapita;
     property FiltroSituacion : String Read Get_FiltroSituacion;
     property AplicaIVA : Boolean Read Get_AplicaIVA;
    end;
 TVcrcapita= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ID_CREDITO                   : TInterCampo;
        NUM_PERIODO                  : TInterCampo;
        SIT_CAPITAL                  : TInterCampo;
        F_VENCIMIENTO                : TInterCampo;
        F_PROG_PAGO                  : TInterCampo;
        F_PAGO                       : TInterCampo;
        IMP_CAPITAL                  : TInterCampo;
        IMP_PAGADO                   : TInterCampo;
        IMP_MORATORIO                : TInterCampo;
        IMP_PAGADO_MORA              : TInterCampo;
        IMP_IVA_MORA                 : TInterCampo;
        IMP_PAG_IVA_MORA             : TInterCampo;
        ParamCre                     : TParamCre;
        Contrato                     : TCtrlCto;

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


constructor TVcrcapita.Create( AOwner : TComponent );
begin Inherited;
      ID_CREDITO    := CreaCampo('ID_CREDITO',ftInteger,tsNinguno,tsNinguno,False);
                     ID_CREDITO.Caption:='Id. Credito';
      NUM_PERIODO   := CreaCampo('NUM_PERIODO',ftInteger,tsNinguno,tsNinguno,False);
                     NUM_PERIODO.Caption:='Núm. Periodo';
      SIT_CAPITAL      := CreaCampo('SIT_CAPITAL',ftString,tsNinguno,tsNinguno,False);
      F_VENCIMIENTO    := CreaCampo('F_VENCIMIENTO',ftDateTime,tsNinguno,tsNinguno,False);
      F_PROG_PAGO      := CreaCampo('F_PROG_PAGO',ftDateTime,tsNinguno,tsNinguno,False);
      F_PAGO           := CreaCampo('F_PAGO',ftDateTime,tsNinguno,tsNinguno,False);
      IMP_CAPITAL      := CreaCampo('IMP_CAPITAL',ftFloat,tsNinguno,tsNinguno,False);
      IMP_PAGADO       := CreaCampo('IMP_PAGADO',ftFloat,tsNinguno,tsNinguno,False);
      IMP_MORATORIO    := CreaCampo('IMP_MORATORIO',ftFloat,tsNinguno,tsNinguno,False);
      IMP_PAGADO_MORA  := CreaCampo('IMP_PAGADO_MORA',ftFloat,tsNinguno,tsNinguno,False);
      IMP_IVA_MORA     := CreaCampo('IMP_IVA_MORA',ftFloat,tsNinguno,tsNinguno,False);
      IMP_PAG_IVA_MORA := CreaCampo('IMP_PAG_IVA_MORA',ftFloat,tsNinguno,tsNinguno,False);

      Contrato := TCtrlCto.Create(Self);
      Contrato.MasterSource := Self;
      Contrato.ID_CONTRATO.MasterField := 'ID_CONTRATO';

      StpName  := ' ';
      UseQuery := False; 
      HelpFile := 'IntVcrcapita.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TVcrcapita.Destroy;
begin inherited;
end;

function TVcrcapita.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWVcrcapital;
begin
   W:=TWVcrcapital.Create(Self);
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


Function TVcrcapita.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('IVcrcapi.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

function TVcrcapita.Reporte:Boolean;
begin  Result := False;
end;


(***********************************************FORMA VCRCAPITAL********************)
(*                                                                              *)
(*  FORMA DE VCRCAPITAL                                                            *)
(*                                                                              *)
(***********************************************FORMA VCRCAPITAL********************)

procedure TWVcrcapital.FormShow(Sender: TObject);
var nRow, nId_Contrato, nTempNUM_PERIODO : Integer;
begin
 edID_CREDITO.Text := Objeto.ID_CREDITO.AsString;
 Caption := 'Consulta de Periodos de Capital del Crédito '+IntToStr(OBJETO.ID_CREDITO.AsInteger);
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

  { SI se indica el Periodo cuando se invoca la clase, entonces...

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

  If (NUM_PERIODO.AsInteger <> 0) Then
   Begin
   nTempNUM_PERIODO := NUM_PERIODO.AsInteger;
   tbstSituacion.TabIndex := GetTabIndexBySIT_CAPITAL(BuscaSituacionPeriodo(nTempNUM_PERIODO)); // Muestra Periodos
   nRow := BuscaRenglonPeriodo(nTempNUM_PERIODO);
   If AplicaIva Then strGrdData.Row := nRow + 1
   Else strGrdData.Row := nRow;
   End
  Else
   tbstSituacion.TabIndex :=  1; // Muestra Periodo Vigente

  If (Trim(strGrdData.Cells[C_COL_ID,0]) = '') Then // Si No Mostro Datos del Periodo Vigente Muestra Todos
   tbstSituacion.TabIndex := 0;
  End;
end;

procedure TWVcrcapital.FormDestroy(Sender: TObject);
begin
  //Objeto
end;

procedure TWVcrcapital.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

function TWVcrcapital.BuscaRenglonPeriodo(nNUM_PERIODO : Integer) : Integer;
var str : String;
    I : Integer;
begin
 Result := 0; // Es 0 de default para posicionar el renglon en el primero recordando que este grid tiene FixedRows =  0
 With strGrdData Do
  For I := 0 To RowCount-1 Do
   Begin
    str := Cells[C_COL_ID,I];
    If (SearchStr(IntToStr(nNUM_PERIODO), str) > 0) Then
     Begin
     Result := I;
     Break;
     End;
   End;
end;

function TWVcrcapital.BuscaSituacionPeriodo(nNUM_PERIODO : Integer) : String;
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
    SQL.Add('SELECT SIT_CAPITAL '+
            'FROM CR_CAPITAL '+
            'WHERE ID_CREDITO = '+IntToStr(Objeto.ID_CREDITO.AsInteger)+
            '  AND NUM_PERIODO = '+IntToStr(nNUM_PERIODO)
            );
    Open;
    If Active Then
     Result := FieldByName('SIT_CAPITAL').AsString;
   Finally
    Close; Free;
   End;
end;

function TWVcrcapital.Get_FiltroSituacion : String;
begin
  Result := C_FILTER[tbstSituacion.TabIndex];
end;

function TWVcrcapital.Get_AplicaIva : Boolean;
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

function TWVcrcapital.GetTabIndexBySIT_CAPITAL(strSIT_CAPITAL : String) : Integer;
var I : Integer;
begin
  Result := -1;
  For I := 0 To C_MAXFILTER Do
   If (C_FILTER[I] = strSit_Capital) Then
    Begin
    Result := I;
    Break;
    End;
end;

procedure TWVcrcapital.MostrarPeriodosCapital(nId_Credito : Integer; strSit_Capital : String);

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
    strId : String;
    I, nCountIM, nCountPer, nWidthColPeriodo, nTopicRow : Integer;
    dImpProgramado,    dImpPagado,    dImpVencido,
    dMoraProgramado,    dMoraPagado,    dMoraVencido : Extended;
begin
 m_bMuestraIva := AplicaIVA;

 { Esconde o Visualiza el Titulo de Periodo Moviendo el Panel }
 If (m_bMuestraIva) Then
  Begin PnlTitulos.Left := 2;  nWidthColPeriodo := 0; End
 Else
  Begin PnlTitulos.Left := 26; nWidthColPeriodo := 24; End;

 Qry := TQuery.Create(Self);
 With strGrdData, Objeto Do
  Try
   // Limpia y Reinicia el Grid
   nTopicRow := -1;
   ClearGrid(strGrdData);
   strGrdData.RowHeights[0] := strGrdData.DefaultRowHeight;
   strGrdData.RowCount := 1;
                                                 //  DESCRIPCION DE LAS COLUMNAS
   strGrdData.ColCount := 13;
   strGrdData.RowCount := 1500;
   strGrdData.ColWidths[C_COL_ID] := 0;                 // Indica el Número de Periodo y la Situación
   strGrdData.ColWidths[1] := nWidthColPeriodo;  // Indica el Número de Periodo
   strGrdData.ColWidths[2] := C_WIDTH_FECHA;     // Fecha de Vencimiento
   strGrdData.ColWidths[3] := C_WIDTH_FECHA;     // Fecha Programada
   strGrdData.ColWidths[4] := C_WIDTH_FECHA;     // Fecha de Pago
   strGrdData.ColWidths[C_COL_TITULO] := 42;                // Titulos de (IMPORTE, IVA, TOTAL) unicamente se muestra si Aplica IVA
   strGrdData.ColWidths[C_COL_IMPPROGRAMADO]  := C_WIDTH_DINERO;    // Importe de Capital Programado
   strGrdData.ColWidths[C_COL_IMPPAGADO]      := C_WIDTH_DINERO;    // Importe de Capital Pagado
   strGrdData.ColWidths[C_COL_IMPVENCIDO]     := C_WIDTH_DINERO;    // Importe de Capital  Vencido
   strGrdData.ColWidths[C_COL_MORAPROGRAMADO] := C_WIDTH_DINERO;    // Importe de Mora Programada
   strGrdData.ColWidths[C_COL_MORAPAGADO]     := C_WIDTH_DINERO;   // Importe de Mora Pagada
   strGrdData.ColWidths[C_COL_MORAVENCIDO]    := C_WIDTH_DINERO;   // Importe de Mora Vencido
   strGrdData.ColWidths[12] := 17;               // Situación

   Qry.SessionName := Objeto.SessionName;
   Qry.DataBaseName := Objeto.DataBaseName;
   Qry.SQL.Clear;
   Qry.SQL.Add('SELECT *'#13#10+
           'FROM CR_CAPITAL'#13#10+
           'WHERE ID_CREDITO = '+IntToStr(nId_Credito)+#13#10);
   If (Trim(strSit_Capital)  <> '') Then
    Qry.SQL.Add(' AND SIT_CAPITAL = '#39+strSit_Capital+#39);
   Qry.SQL.Add('ORDER BY NUM_PERIODO');
   Qry.Open;

  // Inicia el llenado del GRID
  nCountPer := 0; nCountIM := 0;
  While Not Qry.Eof Do
   Begin
    NUM_PERIODO.AsInteger     := Qry.FieldByName('NUM_PERIODO').AsInteger;
    SIT_CAPITAL.AsString      := Qry.FieldByName('SIT_CAPITAL').AsString;
    F_VENCIMIENTO.AsDateTime  := Qry.FieldByName('F_VENCIMIENTO').AsDateTime;
    F_PROG_PAGO.AsDateTime    := Qry.FieldByName('F_PROG_PAGO').AsDateTime;
    F_PAGO.AsDateTime         := Qry.FieldByName('F_PAGO').AsDateTime;
    IMP_CAPITAL.AsFloat       := Qry.FieldByName('IMP_CAPITAL').AsFloat;
    IMP_PAGADO.AsFloat        := Qry.FieldByName('IMP_PAGADO').AsFloat;
    IMP_MORATORIO.AsFloat     := Qry.FieldByName('IMP_MORATORIO').AsFloat;
    IMP_PAGADO_MORA.AsFloat   := Qry.FieldByName('IMP_PAGADO_MORA').AsFloat;
    IMP_IVA_MORA.AsFloat      := Qry.FieldByName('IMP_IVA_MORA').AsFloat;
    IMP_PAG_IVA_MORA.AsFloat  := Qry.FieldByName('IMP_PAG_IVA_MORA').AsFloat;

    Inc(nCountPer);
    If (SIT_CAPITAL.AsString = CSIT_IM) Then Inc(nCountIM);
    strId := NUM_PERIODO.AsString + ',' + SIT_CAPITAL.AsString;

    // Si Muestra el Iva entonces...
    If (m_bMuestraIva) Then
     Begin
     // Coloca Identificador de Periodo
     Inc(nTopicRow);
     Cells[C_COL_ID,nTopicRow]  := NUM_PERIODO.AsString;
     Cells[2,nTopicRow]  := C_WORDPDO + NUM_PERIODO.AsString;
     End;

    Inc(nTopicRow); // Agrega los Importes de la Comisión
    Cells[C_COL_ID,nTopicRow]  := strId;
    Cells[1,nTopicRow]  := NUM_PERIODO.AsString;
    If (F_VENCIMIENTO.AsDateTime > 0) Then Cells[2,nTopicRow] := FormatDateTime(CFORMAT_FECHA,F_VENCIMIENTO.AsDateTime);
    If (F_PROG_PAGO.AsDateTime > 0)   Then Cells[3,nTopicRow] := FormatDateTime(CFORMAT_FECHA,F_PROG_PAGO.AsDateTime);
    If (F_PAGO.AsDateTime > 0)        Then Cells[4,nTopicRow] := FormatDateTime(CFORMAT_FECHA,F_PAGO.AsDateTime);
    Cells[C_COL_TITULO,nTopicRow]         := C_WORDIMP;
    Cells[C_COL_IMPPROGRAMADO,nTopicRow]  := Format(CFORMAT_DINERO,[IMP_CAPITAL.AsFloat]);
    Cells[C_COL_IMPPAGADO,nTopicRow]      := Format(CFORMAT_DINERO,[IMP_PAGADO.AsFloat]);
    Cells[C_COL_MORAPROGRAMADO,nTopicRow] := Format(CFORMAT_DINERO,[IMP_MORATORIO.AsFloat]);
    Cells[C_COL_MORAPAGADO,nTopicRow]  := Format(CFORMAT_DINERO,[IMP_PAGADO_MORA.AsFloat]);
    Cells[12,nTopicRow] := SIT_CAPITAL.AsString;
    
    If (SIT_CAPITAL.AsString = CSIT_IM) Or (SIT_CAPITAL.AsString = CSIT_LQ) Then
     Begin
     // Calcula el Importe Vencido y el Importe Vencido de Mora
     Cells[C_COL_IMPVENCIDO,nTopicRow]  := Format(CFORMAT_DINERO,[IMP_CAPITAL.AsFloat - IMP_PAGADO.AsFloat]);
     Cells[C_COL_MORAVENCIDO,nTopicRow] := Format(CFORMAT_DINERO,[IMP_MORATORIO.AsFloat - IMP_PAGADO_MORA.AsFloat]);
     End
    Else
     Begin
     Cells[C_COL_IMPVENCIDO,nTopicRow]  := C_STRZERO;
     Cells[C_COL_MORAVENCIDO,nTopicRow] := C_STRZERO;
     End;

    // Si Tiene Iva entonces...
    If (m_bMuestraIva) Then
      Begin
      // Agrega los Importes de IVA
      Inc(nTopicRow);
      Cells[C_COL_ID,nTopicRow]  := strId;
      Cells[C_COL_TITULO,nTopicRow]          := C_WORDIVA;
      Cells[C_COL_MORAPROGRAMADO,nTopicRow]  := Format(CFORMAT_DINERO,[IMP_IVA_MORA.AsFloat]);
      Cells[C_COL_MORAPAGADO,nTopicRow]      := Format(CFORMAT_DINERO,[IMP_PAG_IVA_MORA.AsFloat]);
      
      // Calcula el Importe de Mora Vencido de IVA del Importe de Comisión
      If (SIT_CAPITAL.AsString = CSIT_IM) Or (SIT_CAPITAL.AsString = CSIT_LQ) Then
       Cells[C_COL_MORAVENCIDO,nTopicRow] := Format(CFORMAT_DINERO,[IMP_IVA_MORA.AsFloat - IMP_PAG_IVA_MORA.AsFloat])
      Else
       Cells[C_COL_MORAVENCIDO,nTopicRow]  := C_STRZERO;

      // Pequeño Renglon Separador;
      Inc(nTopicRow);
      Cells[C_COL_ID,nTopicRow]  := strId;
      RowHeights[nTopicRow] := C_ROWSEP;

      // Agrega los Totales
      Inc(nTopicRow);
      Cells[C_COL_ID,nTopicRow]  := strId;
      Cells[C_COL_TITULO,nTopicRow]         := C_WORDTOT;
      Cells[C_COL_IMPPROGRAMADO,nTopicRow]  := Format(CFORMAT_DINERO,[IMP_CAPITAL.AsFloat]);
      Cells[C_COL_IMPPAGADO,nTopicRow]      := Format(CFORMAT_DINERO,[IMP_PAGADO.AsFloat]);
      Cells[C_COL_MORAPROGRAMADO,nTopicRow] := Format(CFORMAT_DINERO,[IMP_MORATORIO.AsFloat + IMP_IVA_MORA.AsFloat]);
      Cells[C_COL_MORAPAGADO,nTopicRow]     := Format(CFORMAT_DINERO,[IMP_PAGADO_MORA.AsFloat + IMP_PAG_IVA_MORA.AsFloat]);

      If (SIT_CAPITAL.AsString = CSIT_IM) Or (SIT_CAPITAL.AsString = CSIT_LQ) Then
       Begin
       Cells[C_COL_IMPVENCIDO,nTopicRow]  := Format(CFORMAT_DINERO,[IMP_CAPITAL.AsFloat - IMP_PAGADO.AsFloat]);
       Cells[C_COL_MORAVENCIDO,nTopicRow] := Format(CFORMAT_DINERO,[IMP_MORATORIO.AsFloat - IMP_PAGADO_MORA.AsFloat +
                                                     IMP_IVA_MORA.AsFloat - IMP_PAG_IVA_MORA.AsFloat]);
       End
      Else
       Begin
       Cells[C_COL_IMPVENCIDO,nTopicRow]  := C_STRZERO;
       Cells[C_COL_MORAVENCIDO,nTopicRow] := C_STRZERO;
       End;

     End;
    Qry.Next;
   End;

   // Muestra Totales de Periodos
   lblTituloTotales.Caption := Give_TituloTotales(strSit_Capital);
   If (Trim(strSit_Capital)  = '') Then
    lblPeriodos.Caption := 'Total de Periodos = '+IntToStr(nCountPer)+
                     '      Total de Periodos Impagados = '+IntToStr(nCountIM)
   Else
    lblPeriodos.Caption := 'Total de Periodos '+tbstSituacion.Tabs[GetTabIndexBySIT_CAPITAL(strSIT_CAPITAL)]+' = '+IntToStr(nCountPer);

   // Ajusta el tamaño del Grid a la cantidad de Resultados Mostrados
   strGrdData.RowCount := nTopicRow + 1;

   // Muestra Grandes Totales de Importe
   dImpProgramado  := 0;  dImpPagado  := 0;    dImpVencido := 0;
   dMoraProgramado := 0;  dMoraPagado := 0;    dMoraVencido :=0;

   // Suma los importes de cada columna dependiendo si se muestra el IVA o no
   For I := 0 To RowCount - 1 Do
     If ((Cells[C_COL_TITULO,I] = C_WORDTOT) And (m_bMuestraIva)) Or
         ((I mod 2 <> 0) And (Not m_bMuestraIva))  Then
      Begin
      dImpProgramado  := dImpProgramado  + MoneyToFloat(Cells[C_COL_IMPPROGRAMADO ,I]);
      dImpPagado      := dImpPagado      + MoneyToFloat(Cells[C_COL_IMPPAGADO     ,I]);
      dImpVencido     := dImpVencido     + MoneyToFloat(Cells[C_COL_IMPVENCIDO    ,I]);
      dMoraProgramado := dMoraProgramado + MoneyToFloat(Cells[C_COL_MORAPROGRAMADO,I]);
      dMoraPagado     := dMoraPagado     + MoneyToFloat(Cells[C_COL_MORAPAGADO    ,I]);
      dMoraVencido    := dMoraVencido    + MoneyToFloat(Cells[C_COL_MORAVENCIDO   ,I]);
      End;

   lblTotImpProgramado.Caption  := Format(CFORMAT_DINERO,[dImpProgramado]);
   lblTotImpPagado.Caption      := Format(CFORMAT_DINERO,[dImpPagado]);
   lblTotImpVencido.Caption     := Format(CFORMAT_DINERO,[dImpVencido]);
   lblTotMoraProgramado.Caption := Format(CFORMAT_DINERO,[dMoraProgramado]);
   lblTotMoraPagado.Caption     := Format(CFORMAT_DINERO,[dMoraPagado]);
   lblTotMoraVencido.Caption    := Format(CFORMAT_DINERO,[dMoraVencido]);

   If (dImpVencido > 0) Then lblTotImpVencido.Font.Color := clRed
   Else lblTotImpVencido.Font.Color := clWindowText;

   If (dMoraVencido > 0) Then lblTotMoraVencido.Font.Color := clRed
   Else lblTotMoraVencido.Font.Color := clWindowText;
  Finally
   If Assigned(Qry) Then
    Begin Qry.Close; Qry.Free; End;
  End;
end;

procedure TWVcrcapital.strGrdDataDrawCell(Sender: TObject; ACol,
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
begin
 If (Sender Is TStringGrid) Then
  With (Sender As TStringGrid) Do
   Begin
    bNoExistenDatos := (Trim(Cells[C_COL_ID,0]) = '');
    If RowHeights[ARow] = C_ROWSEP Then
     Begin
     // Separador
     Rect1 := Rect_(0, Rect.Top, Width,Rect.Bottom);
     Canvas.Brush.Color := clWhite;
     Canvas.FillRect(Rect1);
     Canvas.TextRect(Rect1, (Rect1.Right - Canvas.TextWidth(str)) div 2,
                            Rect1.Top, str);
     End
    Else If (IsInteger(Cells[C_COL_ID, ARow])) Or (bNoExistenDatos) Then
     Begin
     If bNoExistenDatos Then str := CERROR_NOEXISTEN
     Else str := C_WORDPDO + Cells[C_COL_ID, ARow];

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
      If (str = CSIT_AC) Then  Canvas.Font.Color := clGreen;
      If (str = CSIT_LQ) Then  Canvas.Font.Color := clBlue;
      If (str = CSIT_PA) Then  Canvas.Font.Color := clBlack;
      If (str = CSIT_IM) Then  Canvas.Font.Color := clRed;
      If (gdSelected In State) Then Canvas.Font.Color := clWhite;

      If Not (gdSelected In State) And Not (m_bMuestraIva) Then
       Begin
       If ((ARow Mod 2) = 0) Then Canvas.Brush.Color := LIGHT_GRAY
       Else Canvas.Brush.Color := clWhite;
       End;

      If (ColWidths[ACol] = C_WIDTH_DINERO) Then
       Canvas.TextRect(Rect,Rect.Right - Canvas.TextWidth(Cells[ACol, ARow]),Rect.Top,Cells[ACol, ARow])
      Else
       Canvas.TextRect(Rect,Rect.Left,Rect.Top,Cells[ACol, ARow]);
     End;

   End;
end;

procedure TWVcrcapital.strGrdDataDblClick(Sender: TObject);
begin
 MostrarDetallePeriodo;
end;

procedure TWVcrcapital.strGrdDataKeyDown(Sender: TObject; var Key: Word;
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

procedure TWVcrcapital.MostrarDetallePeriodo;
var CrCapital : TCrCapital;
    str, strNum_Periodo : String;
begin
  str := strGrdData.Cells[C_COL_ID,strGrdData.Row];
  strNum_Periodo := TruncateStr(str,',');

  If IsInteger(strNum_Periodo) Then
   Begin
    Objeto.NUM_PERIODO.AsInteger := StrToInt(strNum_Periodo);
    CrCapital := TCrCapital.Create(Self);
    Try
     CrCapital.ParamCre := Objeto.ParamCre;
     CrCapital.GetParams(Objeto);
     CrCapital.FindKey([Objeto.ID_CREDITO.AsInteger,Objeto.NUM_PERIODO.AsInteger]);
     CrCapital.Catalogo;
    Finally
     If Assigned(CrCapital) Then CrCapital.Free;
    End;
   End;
end;

procedure TWVcrcapital.tbstSituacionChange(Sender: TObject;
  NewTab: Integer; var AllowChange: Boolean);
begin
 MostrarPeriodosCapital(Objeto.ID_CREDITO.AsInteger, C_FILTER[NewTab]);
end;

procedure TWVcrcapital.btnRefrescarClick(Sender: TObject);
begin
 MostrarPeriodosCapital(Objeto.ID_CREDITO.AsInteger, FiltroSituacion);
end;

procedure TWVcrcapital.btnExcellAllClick(Sender: TObject);
begin
 With strGrdData Do
  TakeDataGridToClipBoard(strGrdData,Rect(1,0,ColCount,RowCount));
end;

procedure TWVcrcapital.btnExcellSelectedClick(Sender: TObject);
begin
 With strGrdData Do
  TakeDataGridToClipBoard(strGrdData,Rect(1,Selection.Top,Selection.Right,Selection.Bottom));
end;

end.
