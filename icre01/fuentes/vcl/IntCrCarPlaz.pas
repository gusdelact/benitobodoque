unit IntCrCarPlaz;
// Sistema         : Clase de CRCARPLAZ
// Fecha de Inicio : Agosto/2016
// Función forma   : Clase de CRCARPLAZ
// Desarrollo por  : RRDM.
// Diseñado por    : René Dávila
// Comentarios     :
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  InterFor, InterApl, IntFrm, StdCtrls, Buttons, ComCtrls, ExtCtrls, IntSGCtrl,
  Db, unSQL2, DBTables,
  IntParamCre,   // Clase de Parametros
  ComObj
  ;

type
  TCrCarPlaz = Class;

  TwCrCarPlaz = class(TForm)
    InterForma1: TInterForma;
    Panel1: TPanel;
    Panel2: TPanel;
    DTPFecha: TDateTimePicker;
    SGCQry: TSGCtrl;
    BBRegenerar: TBitBtn;
    BitBtn1: TBitBtn;
    Termo: TProgressBar;
    MsgPanel: TPanel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    Label32: TLabel;
    BBConsultar: TBitBtn;
    PnlRegenerando: TPanel;
    LblRegenerando: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BBRegenerarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BBConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Objeto : TCrCarPlaz;
    StoredProc,
    StoredProcRegenera : TStoredProc;
    Function CalculaCelda(Num : Integer) : String;
    Procedure EnviaraExcel(Qry : TComponent; QryDetalle : TQuery; Excel : Variant; Hoja : Integer; Titulo : String; Reg : Integer; Var Renglon : Integer; pShow : Boolean);
  end;

  TCrCarPlaz = class(TInterFrame)
      private
      private
      protected
      public
        { Public declarations }
        ParamCre                 : TParamCre;  //Parametros

        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;

var
  wCrCarPlaz: TwCrCarPlaz;

implementation

{$R *.DFM}

Const
      C_MSG_GRID_Inicial    = 'Realice una busqueda.'#30'>C';
      C_MSG_GRID_CALCULANDO = 'Calculando Información.'#30'>C';
      C_MSG_GRID_NULL       = 'No hay Información con estos Criterios.'#30'>C';

{ TCrCarPlaz }

constructor TCrCarPlaz.Create(AOwner: TComponent);
begin
  inherited;

end;

destructor TCrCarPlaz.Destroy;
begin
  inherited;

end;

function TCrCarPlaz.ShowWindow(FormaTipo: TFormaTipo): Integer;
Var
   W : TWCrCarPlaz;
begin
   W := TWCrCarPlaz.Create(Self);
   try
      W.Objeto := Self;
      W.InterForma1.InterFrame    := Self;
      W.InterForma1.FormaTipo     := ftConsulta; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid      := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion       := FInterFun;

      W.StoredProc := TStoredProc.Create(Self);
      W.StoredProc.DatabaseName := w.Objeto.Apli.DataBaseName;
      W.StoredProc.SessionName  := w.Objeto.Apli.SessionName;

      W.StoredProcRegenera := TStoredProc.Create(Self);
      W.StoredProcRegenera.DatabaseName := w.Objeto.Apli.DataBaseName;
      W.StoredProcRegenera.SessionName  := w.Objeto.Apli.SessionName;

      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;

end;

procedure TwCrCarPlaz.FormCreate(Sender: TObject);
begin
     DTPFecha.Date := Date;
     SGCQry.Clear(C_MSG_GRID_Inicial);
end;

procedure TwCrCarPlaz.BBRegenerarClick(Sender: TObject);
Var
   vlInicio,
   vlTermino : String;
begin
     //Llamado al SP para regenerar datos
     If MessageDlg('Esta seguro de Regenerar los datos del dia ' + DateToStr(DTPFecha.Date) +#13+#13 +
                   'Esto puede durar varios minutos', MtConfirmation, [MbOk, MbNo], 0) = MrOk Then
        Begin
             StoredProcRegenera.Close;
             StoredProcRegenera.StoredProcName:='PKGCRCIERRE.STP_CART_PLAZOS_MANUAL';
             try
                //Se limpian los parametros del StoreProcedure
                StoredProcRegenera.Params.Clear;
                // Se crean los parametros del StoreProcedure
                //In
                StoredProcRegenera.Params.CreateParam(ftDate,   'peF_Cierre'   , ptInput);
                StoredProcRegenera.Params.CreateParam(ftString, 'peID_Credito' , ptInput);
                StoredProcRegenera.Params.CreateParam(ftString, 'peB_Commit'   , ptInput);
                StoredProcRegenera.Params.CreateParam(ftString, 'peCve_Usuario', ptInput);
                // OUT
                StoredProcRegenera.Params.CreateParam(ftString, 'psResultado' ,ptOutput);
                StoredProcRegenera.Params.CreateParam(ftString, 'psTxResultado' ,ptOutput);
                // Asignacion de Valores
                StoredProcRegenera.ParamByName('peF_Cierre').Value := DateToStr(DTPFecha.Date);
                StoredProcRegenera.ParamByName('peID_Credito').AsString := '';
                StoredProcRegenera.ParamByName('peB_Commit').AsString := 'V';
                StoredProcRegenera.ParamByName('peCve_Usuario').AsString := Objeto.DameUsuario;
                //Se activa el StoreProcedure
                PnlRegenerando.Visible := True;
                LblRegenerando.Caption := ' Espere por favor ' + #13 + #13 +
                                          'Regenerando datos del dia' + #13 + DateToStr(DTPFecha.Date);
                PnlRegenerando.Refresh;
                vlInicio := FormatDateTime('HH:mm:ss', Now);
                StoredProcRegenera.ExecProc;    //Comentar para realizar pruebas sin llamar al SP
                //Sleep(15000);   //Para realizar pruebas sin mandar a llamar el SP
                vlTermino := FormatDateTime('HH:mm:ss', Now);
                MessageDlg('Proceso Terminado' + #13 + #13+ 'Inicio: ' + vlInicio + '   ' + 'Termino: ' + vlTermino, MtInformation, [MbOk],0);
                BBConsultarClick(Self);
             Except
                On E : Exception Do
                   ShowMessage('Error : ' + E.Message);
             end;
             PnlRegenerando.Visible := False;
        End;
end;

procedure TwCrCarPlaz.BitBtn1Click(Sender: TObject);
Var
   vlRenglon : Integer;
begin
     vlRenglon := 0;
     EnviarAExcel(StoredProc, Nil, Null, -1, '', 0, vlRenglon, True);
end;

procedure TwCrCarPlaz.EnviaraExcel(Qry: TComponent; QryDetalle: TQuery;
  Excel: Variant; Hoja: Integer; Titulo: String; Reg: Integer;
  var Renglon: Integer; pShow: Boolean);
Var
   X,
   vlHoja,
   vlRow,
   vMax,
   vlColor,
   vlCeldaIni,
   Registros : Integer;
   ESal      : Variant;
   Paso,
   Continua  : Boolean;
   Lineas    : TMemo;
   Line      : String;
begin
     vlHoja := 0;
     If Hoja > 0 Then
        vlHoja := Hoja;
     If Qry = Nil Then
        Begin
             Exit;
        End;
     Paso := False;
     If Qry.ClassType = TQuery Then
        If ((Qry As TQuery).Active) And ((Qry As TQuery).RecordCount <> 0) Then
           Paso := True;
     If Qry.ClassType = TStoredProc Then
        If ((Qry As TStoredProc).Active) And ((Qry As TStoredProc).RecordCount <> 0) Then
           Paso := True;

     If Paso Then
        Begin
             Try
                 If pShow Then Termo.Position := 0;
                 If Reg = 0 Then
                    Begin
                         If (Qry As TDBDataSet).RecordCount > 0 Then
                               vMax := (Qry As TDBDataSet).RecordCount
                         Else
                            Begin
                                 (Qry As TDBDataSet).Last;
                                 vMax := (Qry As TDBDataSet).RecordCount
                            End;
                    End
                 Else
                    vMax := Reg;
                 If pShow Then Termo.Max := vMax;
                 If pShow Then Termo.Visible := True;

                 vlRow := 3;

                 Lineas := TMemo.Create(Nil);    
                 Lineas.PArent := SGCQry.Parent;
                 Lineas.Visible := False;
                 Lineas.Lines.Clear;
                 Lineas.Lines.Add('Reporte al Dia' + #9 + #9 + DateToStr(DTPFecha.Date));
                 Lineas.Lines.Add(#9 + #9 + #9 + #9 + #9 + #9 + #9 +
                                  'Capital Vencido'+ #9 + #9 + #9 + #9 + #9 +
                                  'Financiamiento Adicional Vencido'+ #9 + #9 + #9 + #9 + #9 +
                                  'Interes Vencido'+ #9 + #9 + #9 + #9 + #9 +
                                  'Capital Vigente'+ #9 + #9 + #9 + #9 + #9 + #9 + #9 + #9 + #9 +
                                  'Financiamiento Adicional Vigente'+ #9 + #9 + #9 + #9 + #9 + #9 + #9 + #9 + #9 +
                                  'Interes Vigente'+ #9 + #9 + #9 + #9 + #9 + #9 + #9 + #9 + #9 +
                                  'Capital Vencido en Resultados'+ #9 + #9 + #9 + #9 + #9 + #9 +
                                  'Capital Vencido en Cuentas de Orden'+ #9 + #9 + #9 + #9 + #9 + #9 +
                                  'Financiamiento Adicional Vencido en Resultados'+ #9 + #9 + #9 + #9 + #9 + #9 +
                                  'Financiamiento Adicional Vencido en Cuentas de Orden'+ #9 + #9 + #9 + #9 + #9 + #9 +
                                  'Interes Vencido en Resultados'+ #9 + #9 + #9 + #9 + #9 + #9 +
                                  'Interes Vencido en Cuentas de Orden'+ #9 + #9 + #9 + #9 + #9 + #9 +
                                  'Consolidado de Adeudos'+ #9 + #9 + #9 + #9 + #9 + #9 + #9 + #9 + #9 + #9 + #9 +
                                  'Cifras Control'+ #9 + #9 + #9 + #9 + #9 + #9);


                 ESal := Excel;
                 Try
                     If ESal = Null Then
                        Begin
                             Try
                                ESal := CreateOleObject('Excel.Application');
                                ESal.Workbooks.Add;
                             Except
                                MessageDlg('Error al abrir Excel', MtError, [MbOk], 0);
                                Abort;
                             End;
                        End;
                 Except
                 End;
                 If Hoja < 1 Then
                    Begin
                         vlHoja := 1;
                    End;
                 Try
                    ESal.Workbooks[1].WorkSheets[vlHoja].Select;
                 Except
                    ESal.Workbooks[1].WorkSheets[vlHoja].Select;
                 End;
                 If Titulo <> '' Then
                    ESal.Workbooks[1].WorkSheets[vlHoja].name:= Titulo;
                 If Reg = 0 Then
                    (Qry As TDBDataSet).First;
                 Line := '';
                 For X := 0 To (Qry As TDBDataSet).FieldCount - 1 Do
                     Begin
                          //ESal.Workbooks[1].WorkSheets[vlHoja].Cells[vlRow, X + 1 ].Value := (Qry As TDBDataSet).Fields[X].FieldName;
                          Line := Line + (Qry As TDBDataSet).Fields[X].FieldName + #9;
                     End;
                 Lineas.Lines.Add(Line);
                 ESal.Range[CalculaCelda(1) + IntTostr(vlRow) + ':' + CalculaCelda((Qry As TDBDataSet).FieldCount) + IntTostr(vlRow)].Font.FontStyle := 'Bold';
                 ESal.Range[CalculaCelda(1) + IntTostr(vlRow) + ':' + CalculaCelda((Qry As TDBDataSet).FieldCount) + IntTostr(vlRow)].Interior.ColorIndex := 17;
                 ESal.Range[CalculaCelda(1) + IntToStr(vlRow) + ':' + CalculaCelda((Qry As TDBDataSet).FieldCount) + IntToStr(vlRow)].HorizontalAlignment := -4108;

                 If Renglon = 0 Then
                    vlRow := 1
                 Else
                    vlRow := Renglon;

                 Inc(vlRow);
                 If QryDetalle = Nil Then
                    (Qry As TDBDataSet).DisableControls;
                 Continua := True;
                 Registros := vMax;
                 While Continua Do
                       Begin
                            Line := '';
                            For X := 0 To (Qry As TDBDataSet).FieldCount - 1 Do
                               Begin
                                    If (Qry As TDBDataSet).Fields[X].DataType In [ftDateTime] Then
                                       Begin
                                            //If (Qry As TDBDataSet).Fields[X].AsString <> '' Then
                                               Begin
                                                    //ESal.Workbooks[1].WorkSheets[vlHoja].Cells[vlRow, X + 1 ].Formula := (Qry As TDBDataSet).Fields[X].Value;
                                                    Line := Line + (Qry As TDBDataSet).Fields[X].AsString + #9;
                                               End;
                                       End
                                    Else
                                       Begin
                                            //ESal.Workbooks[1].WorkSheets[vlHoja].Cells[vlRow, X + 1 ].Formula := (Qry As TDBDataSet).Fields[X].AsString;
                                            Line := Line + (Qry As TDBDataSet).Fields[X].AsString + #9;
                                       End;
                               End;
                            Lineas.Lines.Add(Line);

                            If QryDetalle <> Nil Then
                               Begin
                                    If Renglon = 0 Then
                                       Renglon := 1;
                                    EnviarAExcel(QryDetalle, Nil, ESal, vlHoja + 1, 'Detalle', 0, Renglon, False);
                               End;
                            Dec(Registros);
                            If Registros > 0 Then
                               (Qry As TDBDataSet).Next;
                            Inc(vlRow);
                            If pShow Then Termo.Position := Termo.Position + 1;
                            If ((Qry As TDBDataSet).Eof) Or (Registros = 0) Then
                               Continua := False;
                       End;
                 (Qry As TDBDataSet).EnableControls;

                 Inc(vlRow);
                 For X := 0 To (Qry As TDBDataSet).FieldCount - 1 Do
                     Begin
                          Case (Qry As TDBDataSet).Fields[X].DataType Of
                               ftDateTime : Begin
                                                 //
                                                 //ESal.Range[CalculaCelda(X + 1) + IntTostr(3) + ':' + CalculaCelda(X + 1) + IntTostr(vlRow)].NumberFormat := 'mm/dd/yyyy';
                                            End;
                               ftFloat    : Begin
                                                 If ((Qry As TDBDataSet).Fields[X].FieldName <> 'ID_CREDITO') And ((Qry As TDBDataSet).Fields[X].FieldName <> 'ID_CONTRATO') And
                                                    ((Qry As TDBDataSet).Fields[X].FieldName <> 'NUM_PERIODO') And ((Qry As TDBDataSet).Fields[X].FieldName <> 'PLAZO') And
                                                    ((Qry As TDBDataSet).Fields[X].FieldName <> 'NUM_DIAS_VENCIDO') And ((Qry As TDBDataSet).Fields[X].FieldName <> 'ID_TRANSACCION') And
                                                    ((Qry As TDBDataSet).Fields[X].FieldName <> 'ID_GRUPO_TRANSAC') And ((Qry As TDBDataSet).Fields[X].FieldName <> 'ID_PERIODO') And
                                                    ((Qry As TDBDataSet).Fields[X].FieldName <> 'ID_EVENTO_DET') And ((Qry As TDBDataSet).Fields[X].FieldName <> 'CUENTA') And
                                                    ((Qry As TDBDataSet).Fields[X].FieldName <> 'ID_EMPRESA') And ((Qry As TDBDataSet).Fields[X].FieldName <> 'ID_ACREDITADO') And
                                                    ((Qry As TDBDataSet).Fields[X].FieldName <> 'ID_CENT_COSTO') And ((Qry As TDBDataSet).Fields[X].FieldName <> 'ID_CTO_LIQ') And
                                                    ((Qry As TDBDataSet).Fields[X].FieldName <> 'ID_COD_RESP') And ((Qry As TDBDataSet).Fields[X].FieldName <> 'FOL_CONTRATO') And
                                                    ((Qry As TDBDataSet).Fields[X].FieldName <> 'DIAS_PLAZO') And ((Qry As TDBDataSet).Fields[X].FieldName <> 'FACT_MORAS') And
                                                    ((Qry As TDBDataSet).Fields[X].FieldName <> 'ID_TRANSAC_DISP') And ((Qry As TDBDataSet).Fields[X].FieldName <> 'DIA_PAGO_CAP') And
                                                    ((Qry As TDBDataSet).Fields[X].FieldName <> 'DIA_PAGO_INT') And ((Qry As TDBDataSet).Fields[X].FieldName <> 'DIA_REVISION') And
                                                    ((Qry As TDBDataSet).Fields[X].FieldName <> 'ID_CRED_EXTERNO') And ((Qry As TDBDataSet).Fields[X].FieldName <> 'ID_SOLICITUD') And
                                                    ((Qry As TDBDataSet).Fields[X].FieldName <> 'CVE_MONEDA') And ((Qry As TDBDataSet).Fields[X].FieldName <> '') And
                                                    ((Qry As TDBDataSet).Fields[X].FieldName <> '') And ((Qry As TDBDataSet).Fields[X].FieldName <> '') And
                                                    ((Qry As TDBDataSet).Fields[X].FieldName <> '') And ((Qry As TDBDataSet).Fields[X].FieldName <> '') And
                                                    ((Qry As TDBDataSet).Fields[X].FieldName <> '') And ((Qry As TDBDataSet).Fields[X].FieldName <> '') And
                                                    ((Qry As TDBDataSet).Fields[X].FieldName <> 'ID_CREDITO_1') And ((Qry As TDBDataSet).Fields[X].FieldName <> 'ID_CONTRATO_1') Then
                                                 ESal.Range[CalculaCelda(X + 1) + IntTostr(3) + ':' + CalculaCelda(X + 1) + IntTostr(vlRow)].NumberFormat := '#,##0.00';
                                            End;
                          End;
                     End;

                 If pShow Then Termo.Visible := False;
                 ESal.Visible := True;

                 Lineas.SelectAll;
                 Lineas.CopyToClipBoard;

                 ESal.Workbooks[1].WorkSheets[vlHoja].Cells[1, 1].Select;
                 ESal.Workbooks[1].WorkSheets[vlHoja].Paste;

                 ESal.Cells[4, 4].Select;
                 ESal.ActiveWindow.FreezePanes := True;
                 //ESal.Cells[3, 1].Select;
                 ESal.Range['A' + IntTostr(3) + ':' +  CalculaCelda((Qry As TDBDataSet).FieldCount) + IntTostr(vlRow)].Select;
                 ESal.Selection.AutoFilter;
                 ESal.Cells.EntireColumn.AutoFit;

                 ESal.Range[CalculaCelda(2) + IntTostr(3) + ':' + CalculaCelda(2) + IntTostr(vlRow)].NumberFormat := '###0';
                 ESal.Range[CalculaCelda(3) + IntTostr(3) + ':' + CalculaCelda(3) + IntTostr(vlRow)].NumberFormat := '@';

                 vlColor := 34;
                 //vlColor1 := 16;
                 If (Qry As TDBDataSet).Fields[1].FieldName = 'F_TRASPASO_VENC' Then
                    vlCeldaIni := 4
                 Else
                    vlCeldaIni := 8;
                 ESal.Range[CalculaCelda(vlCeldaIni + 000) + IntTostr(4) + ':' +  CalculaCelda(vlCeldaIni + 4) + IntTostr(vlRow)].Interior.ColorIndex :=  vlColor;
                 //ESal.Range[ CalculaCelda(vlCeldaIni + 005) + IntTostr(4) + ':' +  CalculaCelda(vlCeldaIni + 009) + IntTostr(vlRow)].Interior.ColorIndex := vlColor1;
                 ESal.Range[CalculaCelda(vlCeldaIni + 010) + IntTostr(4) + ':' +  CalculaCelda(vlCeldaIni + 014) + IntTostr(vlRow)].Interior.ColorIndex := vlColor;
                 //ESal.Range[ CalculaCelda(vlCeldaIni + 015) + IntTostr(4) + ':' + CalculaCelda(vlCeldaIni + 023) + IntTostr(vlRow)].Interior.ColorIndex := vlColor1;
                 ESal.Range[CalculaCelda(vlCeldaIni + 024) + IntTostr(4) + ':' + CalculaCelda(vlCeldaIni + 032) + IntTostr(vlRow)].Interior.ColorIndex := vlColor;
                 //ESal.Range[CalculaCelda(vlCeldaIni + 033) + IntTostr(4) + ':' + CalculaCelda(vlCeldaIni + 041) + IntTostr(vlRow)].Interior.ColorIndex := vlColor1;
                 ESal.Range[CalculaCelda(vlCeldaIni + 042) + IntTostr(4) + ':' + CalculaCelda(vlCeldaIni + 047) + IntTostr(vlRow)].Interior.ColorIndex := vlColor;
                 //ESal.Range[CalculaCelda(vlCeldaIni + 048) + IntTostr(4) + ':' + CalculaCelda(vlCeldaIni + 053) + IntTostr(vlRow)].Interior.ColorIndex := vlColor1;
                 ESal.Range[CalculaCelda(vlCeldaIni + 054) + IntTostr(4) + ':' + CalculaCelda(vlCeldaIni + 059) + IntTostr(vlRow)].Interior.ColorIndex := vlColor;
                 //ESal.Range[CalculaCelda(vlCeldaIni + 060) + IntTostr(4) + ':' + CalculaCelda(vlCeldaIni + 065) + IntTostr(vlRow)].Interior.ColorIndex := vlColor1;
                 ESal.Range[CalculaCelda(vlCeldaIni + 066) + IntTostr(4) + ':' + CalculaCelda(vlCeldaIni + 071) + IntTostr(vlRow)].Interior.ColorIndex := vlColor;
                 //ESal.Range[CalculaCelda(vlCeldaIni + 072) + IntTostr(4) + ':' + CalculaCelda(vlCeldaIni + 077) + IntTostr(vlRow)].Interior.ColorIndex := vlColor1;
                 ESal.Range[CalculaCelda(vlCeldaIni + 078) + IntTostr(4) + ':' + CalculaCelda(vlCeldaIni + 087) + IntTostr(vlRow)].Interior.ColorIndex := vlColor;
                 //ESal.Range[CalculaCelda(vlCeldaIni + 088) + IntTostr(4) + ':' + CalculaCelda(vlCeldaIni + 095) + IntTostr(vlRow)].Interior.ColorIndex := vlColor1;

                 //Centrado y Merge de Grupos;
                 ESal.Range[CalculaCelda(vlCeldaIni + 000) + IntTostr(2) + ':' +  CalculaCelda(vlCeldaIni + 004) + IntTostr(2)].Merge;
                 ESal.Range[CalculaCelda(vlCeldaIni + 005) + IntTostr(2) + ':' +  CalculaCelda(vlCeldaIni + 009) + IntTostr(2)].Merge;
                 ESal.Range[CalculaCelda(vlCeldaIni + 010) + IntTostr(2) + ':' +  CalculaCelda(vlCeldaIni + 014) + IntTostr(2)].Merge;
                 ESal.Range[CalculaCelda(vlCeldaIni + 015) + IntTostr(2) + ':' +  CalculaCelda(vlCeldaIni + 023) + IntTostr(2)].Merge;
                 ESal.Range[CalculaCelda(vlCeldaIni + 024) + IntTostr(2) + ':' +  CalculaCelda(vlCeldaIni + 032) + IntTostr(2)].Merge;
                 ESal.Range[CalculaCelda(vlCeldaIni + 033) + IntTostr(2) + ':' +  CalculaCelda(vlCeldaIni + 041) + IntTostr(2)].Merge;
                 ESal.Range[CalculaCelda(vlCeldaIni + 042) + IntTostr(2) + ':' +  CalculaCelda(vlCeldaIni + 047) + IntTostr(2)].Merge;
                 ESal.Range[CalculaCelda(vlCeldaIni + 048) + IntTostr(2) + ':' +  CalculaCelda(vlCeldaIni + 053) + IntTostr(2)].Merge;
                 ESal.Range[CalculaCelda(vlCeldaIni + 054) + IntTostr(2) + ':' +  CalculaCelda(vlCeldaIni + 059) + IntTostr(2)].Merge;
                 ESal.Range[CalculaCelda(vlCeldaIni + 060) + IntTostr(2) + ':' +  CalculaCelda(vlCeldaIni + 065) + IntTostr(2)].Merge;
                 ESal.Range[CalculaCelda(vlCeldaIni + 066) + IntTostr(2) + ':' +  CalculaCelda(vlCeldaIni + 071) + IntTostr(2)].Merge;
                 ESal.Range[CalculaCelda(vlCeldaIni + 072) + IntTostr(2) + ':' +  CalculaCelda(vlCeldaIni + 077) + IntTostr(2)].Merge;
                 ESal.Range[CalculaCelda(vlCeldaIni + 078) + IntTostr(2) + ':' +  CalculaCelda(vlCeldaIni + 087) + IntTostr(2)].Merge;
                 ESal.Range[CalculaCelda(vlCeldaIni + 088) + IntTostr(2) + ':' +  CalculaCelda(vlCeldaIni + 095) + IntTostr(2)].Merge;

                 ESal.Range[CalculaCelda(vlCeldaIni + 000) + IntTostr(2) + ':' +  CalculaCelda(vlCeldaIni + 004) + IntTostr(2)].HorizontalAlignment := -4108;
                 ESal.Range[CalculaCelda(vlCeldaIni + 005) + IntTostr(2) + ':' +  CalculaCelda(vlCeldaIni + 009) + IntTostr(2)].HorizontalAlignment := -4108;
                 ESal.Range[CalculaCelda(vlCeldaIni + 010) + IntTostr(2) + ':' +  CalculaCelda(vlCeldaIni + 014) + IntTostr(2)].HorizontalAlignment := -4108;
                 ESal.Range[CalculaCelda(vlCeldaIni + 015) + IntTostr(2) + ':' +  CalculaCelda(vlCeldaIni + 023) + IntTostr(2)].HorizontalAlignment := -4108;
                 ESal.Range[CalculaCelda(vlCeldaIni + 024) + IntTostr(2) + ':' +  CalculaCelda(vlCeldaIni + 032) + IntTostr(2)].HorizontalAlignment := -4108;
                 ESal.Range[CalculaCelda(vlCeldaIni + 033) + IntTostr(2) + ':' +  CalculaCelda(vlCeldaIni + 041) + IntTostr(2)].HorizontalAlignment := -4108;
                 ESal.Range[CalculaCelda(vlCeldaIni + 042) + IntTostr(2) + ':' +  CalculaCelda(vlCeldaIni + 047) + IntTostr(2)].HorizontalAlignment := -4108;
                 ESal.Range[CalculaCelda(vlCeldaIni + 048) + IntTostr(2) + ':' +  CalculaCelda(vlCeldaIni + 053) + IntTostr(2)].HorizontalAlignment := -4108;
                 ESal.Range[CalculaCelda(vlCeldaIni + 054) + IntTostr(2) + ':' +  CalculaCelda(vlCeldaIni + 059) + IntTostr(2)].HorizontalAlignment := -4108;
                 ESal.Range[CalculaCelda(vlCeldaIni + 060) + IntTostr(2) + ':' +  CalculaCelda(vlCeldaIni + 065) + IntTostr(2)].HorizontalAlignment := -4108;
                 ESal.Range[CalculaCelda(vlCeldaIni + 066) + IntTostr(2) + ':' +  CalculaCelda(vlCeldaIni + 071) + IntTostr(2)].HorizontalAlignment := -4108;
                 ESal.Range[CalculaCelda(vlCeldaIni + 072) + IntTostr(2) + ':' +  CalculaCelda(vlCeldaIni + 077) + IntTostr(2)].HorizontalAlignment := -4108;
                 ESal.Range[CalculaCelda(vlCeldaIni + 078) + IntTostr(2) + ':' +  CalculaCelda(vlCeldaIni + 087) + IntTostr(2)].HorizontalAlignment := -4108;
                 ESal.Range[CalculaCelda(vlCeldaIni + 088) + IntTostr(2) + ':' +  CalculaCelda(vlCeldaIni + 095) + IntTostr(2)].HorizontalAlignment := -4108;
                 //Termina Centrado y Merge;

                 //Pinta el fondo de los encabezados de Bandas
                 ESal.Range[CalculaCelda(vlCeldaIni + 000) + IntTostr(2) + ':' +  CalculaCelda(vlCeldaIni + 4) + IntTostr(2)].Interior.ColorIndex :=  vlColor;
                 //ESal.Range[ CalculaCelda(vlCeldaIni + 005) + IntTostr(2) + ':' +  CalculaCelda(vlCeldaIni + 009) + IntTostr(2)].Interior.ColorIndex := vlColor1;
                 ESal.Range[CalculaCelda(vlCeldaIni + 010) + IntTostr(2) + ':' +  CalculaCelda(vlCeldaIni + 014) + IntTostr(2)].Interior.ColorIndex := vlColor;
                 //ESal.Range[ CalculaCelda(vlCeldaIni + 015) + IntTostr(2) + ':' + CalculaCelda(vlCeldaIni + 023) + IntTostr(2)].Interior.ColorIndex := vlColor1;
                 ESal.Range[CalculaCelda(vlCeldaIni + 024) + IntTostr(2) + ':' + CalculaCelda(vlCeldaIni + 032) + IntTostr(2)].Interior.ColorIndex := vlColor;
                 //ESal.Range[CalculaCelda(vlCeldaIni + 033) + IntTostr(2) + ':' + CalculaCelda(vlCeldaIni + 041) + IntTostr(2)].Interior.ColorIndex := vlColor1;
                 ESal.Range[CalculaCelda(vlCeldaIni + 042) + IntTostr(2) + ':' + CalculaCelda(vlCeldaIni + 047) + IntTostr(2)].Interior.ColorIndex := vlColor;
                 //ESal.Range[CalculaCelda(vlCeldaIni + 048) + IntTostr(2) + ':' + CalculaCelda(vlCeldaIni + 053) + IntTostr(2)].Interior.ColorIndex := vlColor1;
                 ESal.Range[CalculaCelda(vlCeldaIni + 054) + IntTostr(2) + ':' + CalculaCelda(vlCeldaIni + 059) + IntTostr(2)].Interior.ColorIndex := vlColor;
                 //ESal.Range[CalculaCelda(vlCeldaIni + 060) + IntTostr(2) + ':' + CalculaCelda(vlCeldaIni + 065) + IntTostr(2)].Interior.ColorIndex := vlColor1;
                 ESal.Range[CalculaCelda(vlCeldaIni + 066) + IntTostr(2) + ':' + CalculaCelda(vlCeldaIni + 071) + IntTostr(2)].Interior.ColorIndex := vlColor;
                 //ESal.Range[CalculaCelda(vlCeldaIni + 072) + IntTostr(2) + ':' + CalculaCelda(vlCeldaIni + 077) + IntTostr(2)].Interior.ColorIndex := vlColor1;
                 ESal.Range[CalculaCelda(vlCeldaIni + 078) + IntTostr(2) + ':' + CalculaCelda(vlCeldaIni + 087) + IntTostr(2)].Interior.ColorIndex := vlColor;
                 //ESal.Range[CalculaCelda(vlCeldaIni + 088) + IntTostr(2) + ':' + CalculaCelda(vlCeldaIni + 095) + IntTostr(2)].Interior.ColorIndex := vlColor1;


                 ESal.Cells[1, 1].Select;
                 ESal.ActiveWindow.Zoom := 85;
                 Renglon := vlRow;
             Except
                  On E : Exception Do
                     Begin
                         ShowMessage(E.Message);
                         If pShow Then Termo.Visible := False;
                         Lineas.Destroy;
                         Lineas.Free;
                         ESal.Visible := True;
                     End;
             End;

        End
     Else
        Begin
             If Not (Qry As TDBDataSet).Active Then
                ShowMessage('No esta abierta la Consulta')
             Else
                ShowMessage('No hay datos para enviar');
        End;
end;

function TwCrCarPlaz.CalculaCelda(Num: Integer): String;
Var
   Ent,
   Flo     : Integer;
   Letras : String;
Begin
     If Num <= 1378 Then  //'AZZ'
         If Num <= 26 Then
            Letras := Char(Num + 64)
         Else
            If Num <= 702 Then
                Begin
                     Ent := Num Div 26;
                     Flo := Num mod 26;
                     If Flo = 0 Then
                        Begin
                             Ent := Ent-1;
                             Letras := Char(Ent + 64) + 'Z';
                        End
                     Else
                        Letras := Char(Ent + 64) + Char(Flo + 64);
                End
            Else
               Begin
                    Num := Num - 702 + 26;
                    Letras := 'A' + CalculaCelda(Num);
                    Letras := Letras;
               End
     Else
        Letras := 'BAA';
     Result := Letras;
end;

procedure TwCrCarPlaz.FormShow(Sender: TObject);
begin
      //PINTA DATOS DEL PANEL INFERIOR
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;
end;

procedure TwCrCarPlaz.BBConsultarClick(Sender: TObject);
Var
   X          : Integer;
   Q          : TQuery;
   vlMensaje,
   vlSQLStr   : String;
begin
     Q :=  GetSQLQuery('Select ' + QuotedStr('Calculando Informacion') + ' From Dual',Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
     SGCQry.addQry(Q,True,True,-1,-1,-1,True);
     SGCQry.Clear(C_MSG_GRID_CALCULANDO);
     SGCQry.Refresh;

     StoredProc.Close;
     StoredProc.StoredProcName:='STPCRCARTERAPLAZOS';
     try
        //Se limpian los parametros del StoreProcedure
        StoredProc.Params.Clear;
        // Se crean los parametros del StoreProcedure
        //In
        StoredProc.Params.CreateParam(ftString, 'PEDATO'      ,ptInput);
        // OUT
        StoredProc.Params.CreateParam(ftCursor, 'PSRESULTSET' ,ptOutput);
        // Asignacion de Valores
        StoredProc.ParamByName('PEDATO').AsString := DateToStr(DTPFecha.Date);
        //Se activa el StoreProcedure
        StoredProc.Open;
        If Trim(StoredProc.FieldByName('Mensaje').ASString) <> '' Then
           Begin
                vlMensaje := StoredProc.FieldByName('Mensaje').ASString;
                StoredProc.Close;
                ShowMessage('Error en la consulta:' + #13+#13 +vlMensaje);
                Abort;
           End;
     finally

     end;
     try
         //if StoredProc <> nil then
         if StoredProc.RecordCount <> 0 then
             begin
                 //ASIGNACION DE ETIQUETAS
                 For X := 0 To StoredProc.FieldCount - 1 Do
                     StoredProc.Fields[X].DisplayLabel     := StoredProc.Fields[X].FieldName + #30 +'>C';
                 //ASIGNACION DE MASCARAS DE EDICION
                 For X := 0 To StoredProc.FieldCount - 1 Do
                     Begin
                         If UpperCase(Copy(StoredProc.Fields[X].FieldName,1,4)) = 'IMP_' Then
                            TNumericField(StoredProc.Fields[X]).DisplayFormat     := '###,###,###,##0.00';
                         If UpperCase(Copy(StoredProc.Fields[X].FieldName,1,2)) = 'F_' Then
                            TNumericField(StoredProc.Fields[X]).DisplayFormat     := 'DD/MM/YYYY';
                     End;
                 //ASIGNACION DE LONGITUD DE COLUMNAS
                 For X := 0 To StoredProc.FieldCount - 1 Do
                     If Length(StoredProc.Fields[X].FieldName) < StoredProc.Fields[X].Size Then
                        StoredProc.Fields[X].DisplayWidth     := StoredProc.Fields[X].Size * 6
                     Else
                        StoredProc.Fields[X].DisplayWidth     := Round(Length(StoredProc.Fields[X].FieldName) * 1.5);
                 StoredProc.Fields[1].DisplayWidth     := 25;
                 //SGCTrasancciones.Titulo1 := ' ';
                 SGCQry.addQry(StoredProc,True,True,-1,-1,-1,True);
             end
         else
             SGCQry.Clear(C_MSG_GRID_NULL);
     finally

     end;
end;

end.

