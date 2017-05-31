// Sistema         : Clase de VCR_INTERES
// Fecha de Inicio : 11/06/2003
// Función forma   : Clase de VCR_INTERES
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntVcrIntere;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Tabs, Grids,

IntGenCre, IntCrInteres, IntParamCre, IntCtoPanel, IntCtoHeader;

const C_WORDIMP = 'Importe';
      C_WORDIVA = 'IVA';
      C_WORDTOT = 'Total';
      C_WORDPDO = 'Periodo ';

      C_ROWSEP = 5;
      C_WIDTH_FECHA  = 64;
      C_WIDTH_DINERO = 74;
      C_MAXFILTER = 5;
      C_FILTER : Array[0..C_MAXFILTER] of String = (' ',CSIT_AC,CSIT_LQ,CSIT_IM,CSIT_PA,CSIT_CA);

      C_COL_ID = 0;
Type
 TVcrIntere= class; 

  TWVcrInteres=Class(TForm)
    InterForma1             : TInterForma;
    Bevel1: TBevel;
    lblPeriodos: TLabel;
    lblTituloTotales: TLabel;
    lblTotImpVencido: TLabel;
    lblTotImpPagado: TLabel;
    lblTotImpProgramado: TLabel;
    strGrdData: TStringGrid;
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
    shp17: TShape;
    lblFecha: TLabel;
    lblVencimiento: TLabel;
    lblProgramado: TLabel;
    lblPago: TLabel;
    lblImpProgramado: TLabel;
    lblImpPagado: TLabel;
    lblImpVencido: TLabel;
    lblImpInteres: TLabel;
    lblSituacion: TLabel;
    Shape1: TShape;
    Label1: TLabel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure strGrdDataDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure strGrdDataKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tbstSituacionChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure btnRefrescarClick(Sender: TObject);
    procedure btnExcellAllClick(Sender: TObject);
    procedure btnExcellSelectedClick(Sender: TObject);
    procedure strGrdDataDblClick(Sender: TObject);
    private 
    { Private declarations }
     m_bMuestraIva : Boolean;

     procedure MostrarDetallePeriodo;
     procedure MostrarPeriodosInteres(nId_Credito : Integer; strSit_Interes : String);
     function BuscaRenglonPeriodo(nNUM_PERIODO : Integer) : Integer;

     function BuscaSituacionPeriodo(nNUM_PERIODO : Integer) : String;
     function Get_FiltroSituacion : String;

     function Get_AplicaIva : Boolean;
     function GetTabIndexBySIT_INTERES(strSIT_INTERES : String) : Integer;
    public
    { Public declarations }
     Objeto : TVcrIntere;
     property FiltroSituacion : String Read Get_FiltroSituacion;
     property AplicaIva : Boolean Read Get_AplicaIva;
    end;
 TVcrIntere= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ID_CREDITO                 : TInterCampo;
        NUM_PERIODO                : TInterCampo;
        SIT_INTERES                : TInterCampo;
        F_VENCIMIENTO              : TInterCampo;
        F_PROG_PAGO                : TInterCampo;
        F_PAGO                     : TInterCampo;
        IMP_INTERES                : TInterCampo;
        IMP_IVA                    : TInterCampo;
        IMP_IVA_PAGADO             : TInterCampo;
        IMP_PAGADO                 : TInterCampo;
        IMP_MORATORIO              : TInterCampo;
        IMP_PAGADO_MORA            : TInterCampo;
        IMP_IVA_MORA               : TInterCampo;
        IMP_PAG_IVA_MORA           : TInterCampo;

        ParamCre                 : TParamCre;
        Contrato                 : TCtrlCto;        

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


constructor TVcrIntere.Create( AOwner : TComponent ); 
begin Inherited;
      ID_CREDITO    := CreaCampo('ID_CREDITO',ftInteger,tsNinguno,tsNinguno,False);
                     ID_CREDITO.Caption:='Id. Credito';
      NUM_PERIODO   := CreaCampo('NUM_PERIODO',ftInteger,tsNinguno,tsNinguno,False);
                     NUM_PERIODO.Caption:='Núm. Periodo';
      SIT_INTERES      := CreaCampo('SIT_INTERES',ftString,tsNinguno,tsNinguno,False);
      F_VENCIMIENTO    := CreaCampo('F_VENCIMIENTO',ftDateTime,tsNinguno,tsNinguno,False);
      F_PROG_PAGO      := CreaCampo('F_PROG_PAGO',ftDateTime,tsNinguno,tsNinguno,False);
      F_PAGO           := CreaCampo('F_PAGO',ftDateTime,tsNinguno,tsNinguno,False);
      IMP_INTERES      := CreaCampo('IMP_INTERES',ftFloat,tsNinguno,tsNinguno,False);
      IMP_IVA          := CreaCampo('IMP_IVA',ftFloat,tsNinguno,tsNinguno,False);
      IMP_IVA_PAGADO   := CreaCampo('IMP_IVA_PAGADO',ftFloat,tsNinguno,tsNinguno,False);
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
      HelpFile := 'IntVcrIntere.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TVcrIntere.Destroy;
begin inherited;
end;

function TVcrIntere.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWVcrInteres;
begin
   W:=TWVcrInteres.Create(Self);
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

Function TVcrIntere.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('IVcrInte.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TVcrIntere.Reporte:Boolean; 
begin Result := False;
end;

(***********************************************FORMA VCR_INTERES********************)
(*                                                                              *)
(*  FORMA DE VCR_INTERES                                                            *)
(*                                                                              *)
(***********************************************FORMA VCR_INTERES********************)

function TWVcrInteres.BuscaRenglonPeriodo(nNUM_PERIODO : Integer) : Integer;
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

function TWVcrInteres.BuscaSituacionPeriodo(nNUM_PERIODO: Integer): String;
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
    SQL.Add('SELECT SIT_INTERES '+
            'FROM CR_INTERES '+
            'WHERE ID_CREDITO = '+IntToStr(Objeto.ID_CREDITO.AsInteger)+
            '  AND NUM_PERIODO = '+IntToStr(nNUM_PERIODO)
            );
    Open;
    If Active Then
     Result := FieldByName('SIT_INTERES').AsString;
   Finally
    Close; Free;
   End;
end;

function TWVcrInteres.Get_AplicaIva : Boolean;
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

function TWVcrInteres.GetTabIndexBySIT_INTERES(strSIT_INTERES : String) : Integer;
var I : Integer;
begin
  Result := -1;
  For I := 0 To C_MAXFILTER Do
   If (C_FILTER[I] = strSit_Interes) Then
    Begin
    Result := I;
    Break;
    End;
end;

procedure TWVcrInteres.MostrarPeriodosInteres(nId_Credito : Integer; strSit_Interes : String);

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
    I, nCountIM, nCountPer, nTopicRow, nWidthColPeriodo : Integer;
    dImpProgramado,    dImpPagado,    dImpVencido : Extended;
begin
 m_bMuestraIva := AplicaIva;
 Qry := TQuery.Create(Self);
 
 With strGrdData, Objeto Do
  Try
   // Limpia y Reinicia el Grid
   nTopicRow := -1;
   ClearGrid(strGrdData);
   For I := 0 To strGrdData.RowCount - 1 Do
    strGrdData.RowHeights[I] := strGrdData.DefaultRowHeight;
   strGrdData.RowCount := 1;

   If (m_bMuestraIva) Then
    Begin PnlTitulos.Left := 1;  nWidthColPeriodo := 0; End
   Else
    Begin PnlTitulos.Left := 25; nWidthColPeriodo := 23; End;

                                                 //  DESCRIPCION DE LAS COLUMNAS
   strGrdData.ColCount := 10;
   strGrdData.RowCount := 1500;
   strGrdData.ColWidths[0] := 0;                 // Indica el Número y Situación del Periodo 
   strGrdData.ColWidths[1] := nWidthColPeriodo;  // Indica el Número de Periodo
   strGrdData.ColWidths[2] := C_WIDTH_FECHA;     // Fecha de Vencimiento
   strGrdData.ColWidths[3] := C_WIDTH_FECHA;     // Fecha Programada
   strGrdData.ColWidths[4] := C_WIDTH_FECHA;     // Fecha de Pago
   strGrdData.ColWidths[5] := 42;                // Titulos de (IMPORTE, IVA, TOTAL) unicamente se muestra si Aplica IVA
   strGrdData.ColWidths[6] := C_WIDTH_DINERO;    // Importe de Interes Programado
   strGrdData.ColWidths[7] := C_WIDTH_DINERO;    // Importe de Interes Pagado
   strGrdData.ColWidths[8] := C_WIDTH_DINERO;    // Importe de Interes Vencido
   strGrdData.ColWidths[9] := 17;               // Situación

   Qry.SessionName := Objeto.SessionName;
   Qry.DataBaseName := Objeto.DataBaseName;
   Qry.SQL.Clear;
   Qry.SQL.Add('SELECT *'#13#10+
               'FROM CR_INTERES'#13#10+
               'WHERE ID_CREDITO = '+IntToStr(nId_Credito)+#13#10);
   If (Trim(strSit_Interes)  <> '') Then
    Qry.SQL.Add(' AND SIT_INTERES = '#39+strSit_Interes+#39);
   Qry.SQL.Add('ORDER BY NUM_PERIODO');
   Qry.Open;

   // Inicia el llenado del GRID
   nCountPer := 0; nCountIM := 0;
   While Not Qry.Eof Do
    Begin
    ID_CREDITO.AsInteger      := Qry.FieldByName('ID_CREDITO').AsInteger;
    NUM_PERIODO.AsInteger     := Qry.FieldByName('NUM_PERIODO').AsInteger;
    SIT_INTERES.AsString      := Qry.FieldByName('SIT_INTERES').AsString;
    F_VENCIMIENTO.AsDateTime  := Qry.FieldByName('F_VENCIMIENTO').AsDateTime;
    F_PROG_PAGO.AsDateTime    := Qry.FieldByName('F_PROG_PAGO').AsDateTime;
    F_PAGO.AsDateTime         := Qry.FieldByName('F_PAGO').AsDateTime;
    IMP_INTERES.AsFloat       := Qry.FieldByName('IMP_INTERES').AsFloat;
    IMP_IVA.AsFloat           := Qry.FieldByName('IMP_IVA').AsFloat;
    IMP_IVA_PAGADO.AsFloat    := Qry.FieldByName('IMP_IVA_PAGADO').AsFloat;
    IMP_PAGADO.AsFloat        := Qry.FieldByName('IMP_PAGADO').AsFloat;

    Inc(nCountPer);
    If (SIT_INTERES.AsString = CSIT_IM) Then Inc(nCountIM);
    strId := NUM_PERIODO.AsString + ',' + SIT_INTERES.AsString;

    If (m_bMuestraIVA) Then
     Begin
     // Coloca Identificador de Periodo
     Inc(nTopicRow); 
     Cells[0,nTopicRow]  := NUM_PERIODO.AsString;
     Cells[2,nTopicRow]  := C_WORDPDO + NUM_PERIODO.AsString;
     End;

    Inc(nTopicRow); // Agrega los Importes de la Comisión
    Cells[0,nTopicRow]  := strId;
    Cells[1,nTopicRow]  := NUM_PERIODO.AsString;
    If (F_VENCIMIENTO.AsDateTime > 0) Then Cells[2,nTopicRow] := FormatDateTime(CFORMAT_FECHA,F_VENCIMIENTO.AsDateTime);
    If (F_PROG_PAGO.AsDateTime > 0)   Then Cells[3,nTopicRow] := FormatDateTime(CFORMAT_FECHA,F_PROG_PAGO.AsDateTime);
    If (F_PAGO.AsDateTime > 0)        Then Cells[4,nTopicRow] := FormatDateTime(CFORMAT_FECHA,F_PAGO.AsDateTime);
    Cells[5,nTopicRow]  := C_WORDIMP;
    Cells[6,nTopicRow]  := Format(CFORMAT_DINERO,[IMP_INTERES.AsFloat]);
    Cells[7,nTopicRow]  := Format(CFORMAT_DINERO,[IMP_PAGADO.AsFloat]);
    Cells[9,nTopicRow] := SIT_INTERES.AsString;

    // Calcula el Importe Vencido
    If (SIT_INTERES.AsString = CSIT_IM) Or (SIT_INTERES.AsString = CSIT_LQ) Then
     Cells[8,nTopicRow]  := Format(CFORMAT_DINERO,[IMP_INTERES.AsFloat - IMP_PAGADO.AsFloat])
    Else
     Cells[8,nTopicRow]  := C_STRZERO;

    // Si Tiene Iva entonces...
    If m_bMuestraIva Then
      Begin
      // Agrega los Importes de IVA
      Inc(nTopicRow);
      Cells[0,nTopicRow]  := strId;
      Cells[5,nTopicRow]  := C_WORDIVA;
      Cells[6,nTopicRow]  := Format(CFORMAT_DINERO,[IMP_IVA.AsFloat]);
      Cells[7,nTopicRow]  := Format(CFORMAT_DINERO,[IMP_IVA_PAGADO.AsFloat]);
      
      // Calcula el Importe de Vencido de IVA del Importe de Comisión
      If (SIT_INTERES.AsString = CSIT_IM) Or (SIT_INTERES.AsString = CSIT_LQ) Then
       Cells[8, nTopicRow] := Format(CFORMAT_DINERO,[IMP_IVA.AsFloat - IMP_IVA_PAGADO.AsFloat])
      Else
       Cells[8,nTopicRow]  := C_STRZERO;

      // Pequeño Renglon Separador;
      Inc(nTopicRow);
      Cells[0,nTopicRow]  := strId;
      RowHeights[nTopicRow] := C_ROWSEP;

      // Agrega los Totales
      Inc(nTopicRow);
      Cells[0,nTopicRow]  := strId;
      Cells[5,nTopicRow]  := C_WORDTOT;
      Cells[6,nTopicRow]  := Format(CFORMAT_DINERO,[IMP_INTERES.AsFloat + IMP_IVA.AsFloat]);
      Cells[7,nTopicRow]  := Format(CFORMAT_DINERO,[IMP_PAGADO.AsFloat + IMP_IVA_PAGADO.AsFloat]);

      If (SIT_INTERES.AsString = CSIT_IM) Or (SIT_INTERES.AsString = CSIT_LQ) Then
       Cells[8,nTopicRow]  := Format(CFORMAT_DINERO,[IMP_INTERES.AsFloat - IMP_PAGADO.AsFloat +
                                                     IMP_IVA.AsFloat - IMP_IVA_PAGADO.AsFloat])
      Else
       Cells[8,nTopicRow]  := C_STRZERO;
      End;
   Qry.Next;
   End;

   // Muestra Totales de Periodos
   lblTituloTotales.Caption := Give_TituloTotales(strSit_Interes);
   If (Trim(strSit_Interes)  = '') Then
    lblPeriodos.Caption := 'Total de Periodos = '+IntToStr(nCountPer)+
                     '      Total de Periodos Impagados = '+IntToStr(nCountIM)
   Else
    lblPeriodos.Caption := 'Total de Periodos '+tbstSituacion.Tabs[GetTabIndexBySIT_INTERES(strSIT_INTERES)]+
                           ' = '+IntToStr(nCountPer);

   // Ajusta el tamaño del Grid a la cantidad de Resultados Mostrados
   strGrdData.RowCount := nTopicRow + 1;

   // Muestra Grandes Totales de Importe
   dImpProgramado  := 0;  dImpPagado  := 0;    dImpVencido := 0;

   For I := 0 To RowCount - 1 Do
     If ((Cells[5,I] = C_WORDTOT) And (m_bMuestraIva)) Or
         ((I mod 2 <> 0) And (Not m_bMuestraIva))  Then
      Begin
      dImpProgramado  := dImpProgramado  + MoneyToFloat(Cells[6,I]);
      dImpPagado      := dImpPagado      + MoneyToFloat(Cells[7,I]);
      dImpVencido     := dImpVencido     + MoneyToFloat(Cells[8,I]);
      End;

   lblTotImpProgramado.Caption  := Format(CFORMAT_DINERO,[dImpProgramado]);
   lblTotImpPagado.Caption      := Format(CFORMAT_DINERO,[dImpPagado]);
   lblTotImpVencido.Caption     := Format(CFORMAT_DINERO,[dImpVencido]);

   If (dImpVencido > 0) Then lblTotImpVencido.Font.Color := clRed
   Else lblTotImpVencido.Font.Color := clWindowText;

  Finally
   If Assigned(Qry) Then
    Begin Qry.Close; Qry.Free; End;
  End;
end;

procedure TWVcrInteres.FormShow(Sender: TObject);
var nRow, nId_Contrato, nTempNUM_PERIODO : Integer;
begin
 edID_CREDITO.Text := Objeto.ID_CREDITO.AsString;
 Caption := 'Consulta de Periodos de Interés del Crédito '+IntToStr(Objeto.ID_CREDITO.AsInteger);
 edID_CREDITO.Text := Objeto.ID_CREDITO.AsString;
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
   tbstSituacion.TabIndex := GetTabIndexBySIT_INTERES(BuscaSituacionPeriodo(nTempNUM_PERIODO)); // Muestra Periodos
   nRow := BuscaRenglonPeriodo(nTempNUM_PERIODO);
   If AplicaIVA Then strGrdData.Row := nRow + 1
   Else strGrdData.Row := nRow;
   End
  Else
   tbstSituacion.TabIndex :=  1; // Muestra Periodo Vigente
   
  If (Trim(strGrdData.Cells[0,0]) = '') Then // Si No Mostro Datos del Periodo Vigente Muestra Todos
   tbstSituacion.TabIndex := 0;
  End;
end;

procedure TWVcrInteres.FormDestroy(Sender: TObject);
begin
 //Objeto
end;

procedure TWVcrInteres.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWVcrInteres.strGrdDataDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
const LIGHT_YELLOW = $00CCFFFF;

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
    bNoExistenDatos := (Trim(Cells[0,0]) = '');
    If RowHeights[ARow] = C_ROWSEP Then
     Begin
     // Separador
     Rect1 := Rect_(0, Rect.Top, Width,Rect.Bottom);
     Canvas.Brush.Color := clWhite;
     Canvas.FillRect(Rect1);
     Canvas.TextRect(Rect1, (Rect1.Right - Canvas.TextWidth(str)) div 2,
                            Rect1.Top, str);
     End
    Else If (IsInteger(Cells[0, ARow])) Or (bNoExistenDatos) Then
     Begin
     If bNoExistenDatos Then str := CERROR_NOEXISTEN
     Else str := C_WORDPDO + Cells[0, ARow];

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
      If (str = CSIT_AC) Then  Canvas.Font.Color := clGreen;
      If (str = CSIT_LQ) Then  Canvas.Font.Color := clBlue;
      If (str = CSIT_PA) Then  Canvas.Font.Color := clBlack;
      If (str = CSIT_IM) Then  Canvas.Font.Color := clRed;
      If (gdSelected In State) Then Canvas.Font.Color := clWhite;

      If Not (gdSelected In State) And Not (m_bMuestraIva) Then
       Begin
       If ((ARow Mod 2) = 0) Then Canvas.Brush.Color := $00F0F0F0
       Else Canvas.Brush.Color := clWhite;
       End;     

      If (ColWidths[ACol] = C_WIDTH_DINERO) Then
       Canvas.TextRect(Rect,Rect.Right - Canvas.TextWidth(Cells[ACol, ARow]),Rect.Top,Cells[ACol, ARow])
      Else
       Canvas.TextRect(Rect,Rect.Left,Rect.Top,Cells[ACol, ARow]);
     End;

   End;
end;

procedure TWVcrInteres.strGrdDataKeyDown(Sender: TObject; var Key: Word;
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

procedure TWVcrInteres.tbstSituacionChange(Sender: TObject;
  NewTab: Integer; var AllowChange: Boolean);
begin
 MostrarPeriodosInteres(Objeto.ID_CREDITO.AsInteger, C_FILTER[NewTab]);
end;

procedure TWVcrInteres.btnRefrescarClick(Sender: TObject);
begin
 MostrarPeriodosInteres(Objeto.ID_CREDITO.AsInteger, FiltroSituacion);
end;

procedure TWVcrInteres.btnExcellAllClick(Sender: TObject);
begin
 With strGrdData Do
  TakeDataGridToClipBoard(strGrdData,Rect(1,0,ColCount,RowCount));
end;

procedure TWVcrInteres.btnExcellSelectedClick(Sender: TObject);
begin
 With strGrdData Do
  TakeDataGridToClipBoard(strGrdData,Rect(1,Selection.Top,Selection.Right,Selection.Bottom));
end;

procedure TWVcrInteres.MostrarDetallePeriodo;
var CrInteres : TCrInteres;
    str, strNum_Periodo : String;
begin
  str := strGrdData.Cells[0,strGrdData.Row];
  strNum_Periodo := TruncateStr(str,',');

  If IsInteger(strNum_Periodo) Then
   Begin
    Objeto.NUM_PERIODO.AsInteger := StrToInt(strNum_Periodo);
    CrInteres := TCrInteres.Create(Self);
    Try
     CrInteres.GetParams(Objeto);
     CrInteres.ParamCre := Objeto.ParamCre;
     CrInteres.FindKey([Objeto.ID_CREDITO.AsInteger,Objeto.NUM_PERIODO.AsInteger]);
     CrInteres.Catalogo;
    Finally
     If Assigned(CrInteres) Then CrInteres.Free;
    End;
   End;
end;

function TWVcrInteres.Get_FiltroSituacion : String;
begin
  Result := C_FILTER[tbstSituacion.TabIndex];
end;

procedure TWVcrInteres.strGrdDataDblClick(Sender: TObject);
begin
 MostrarDetallePeriodo;
end;

end.
