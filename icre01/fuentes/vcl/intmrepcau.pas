{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y-,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
// Sistema         : Clase de RepCaucion
// Fecha de Inicio : 26/09/2002
// Función forma   : Clase de RepCaucion
// Desarrollo por  : Victor Hugo Santillán Trejo
// Diseñado por    : Manuel Romero Ibarra
// Comentarios     :
Unit IntMRepCau;   

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, IntInter,

ShellApi,
IntCtoHeader,
IntCrCre,
IntMPers,
IntPers,
IntQRPreview,
IntGenCre,
IntParamCre,
IntCrCredito,  // Disposición
IntCrAcredit   // Datos Adreditado
;

Type
 TMRepCau= class;

  TWRepCau=Class(TForm)
    InterForma1             : TInterForma;
    grpContrato: TGroupBox;
    ilID_Acreditado: TInterLinkit;
    Query1: TQuery;
    Edit1: TEdit;
    Qry: TQuery;
    grpCredito: TGroupBox;
    opCierredeAyer: TRadioButton;
    opPreciodeMercado: TRadioButton;
    edID_CREDITO: TEdit;
    btnCredito: TBitBtn;
    edNom_Credito: TEdit;
    ILCredito: TInterLinkit;
    chkCredito: TCheckBox;
    Bevel3: TBevel;
    edID_PROMOTOR: TEdit;
    edNombre_Promotor: TEdit;
    btnPromotor: TBitBtn;
    chkPromotor: TCheckBox;
    ILPromotor: TInterLinkit;
    chkAcreditado: TCheckBox;
    edID_ACREDITADO: TEdit;
    btnId_Persona: TBitBtn;
    edNombre: TEdit;
    Edit2: TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    grbReporte: TGroupBox;
    Bevel6: TBevel;
    Label8: TLabel;
    chkExcel: TCheckBox;
    edFileName: TEdit;
    btFileExcel: TButton;
    Label9: TLabel;
    chkInicio: TCheckBox;
    dtpFromInicio: TDateTimePicker;
    dtpToInicio: TDateTimePicker;
    cbxInicio: TComboBox;
    chkVencimiento: TCheckBox;
    dtpFromVencimiento: TDateTimePicker;
    cbxVencimiento: TComboBox;
    dtpToVencimiento: TDateTimePicker;
    grpSituacion: TGroupBox;
    Bevel1: TBevel;
    chkActivos: TCheckBox;
    chkNoActivo: TCheckBox;
    chkCancelados: TCheckBox;
    chkLiquidados: TCheckBox;
    chkTodos: TCheckBox;
    chkSinReferencia: TCheckBox;
    grpMonto: TGroupBox;
    opFaltante: TRadioButton;
    opSobrante: TRadioButton;
    opTodos: TRadioButton;
    opPlano: TRadioButton;
    opReporte: TRadioButton;
    SaveDialog1: TSaveDialog;
    Panel1: TPanel;
    opCreditosInternosA: TRadioButton;
    opCreditosInternosB: TRadioButton;
    Label4: TLabel;
    edCVE_PRESUPUESTO: TEdit;
    btCVE_PRESUPUESTO: TBitBtn;
    edDESC_PRESUPUESTO: TEdit;
    cbCVE_PRESUPUESTO: TCheckBox;
    ilCVE_PRESUPUESTO: TInterLinkit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure chkInicioClick(Sender: TObject);
    procedure chkVencimientoClick(Sender: TObject);
    procedure chkTodosClick(Sender: TObject);
    procedure chkActivosClick(Sender: TObject);
    procedure cbxInicioChange(Sender: TObject);
    procedure cbxVencimientoChange(Sender: TObject);
    procedure btnId_PersonaClick(Sender: TObject);
    procedure ilID_AcreditadoEjecuta(Sender: TObject);
    procedure ILCreditoEjecuta(Sender: TObject);
    procedure chkCreditoClick(Sender: TObject);
    procedure btnCreditoClick(Sender: TObject);
    procedure btnPromotorClick(Sender: TObject);
    procedure chkPromotorClick(Sender: TObject);
    procedure ILPromotorEjecuta(Sender: TObject);
    procedure ilID_AcreditadoCapture(Sender: TObject; var Show: Boolean);
    procedure chkAcreditadoClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure btFileExcelClick(Sender: TObject);
    procedure chkExcelClick(Sender: TObject);
    procedure btCVE_PRESUPUESTOClick(Sender: TObject);
    procedure ilCVE_PRESUPUESTOCapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_PRESUPUESTOEjecuta(Sender: TObject);
    procedure cbCVE_PRESUPUESTOClick(Sender: TObject);
    private
    { Private declarations }
     m_bPreview : Boolean;

     procedure Enable_Dtp_BySign(strSign : String; DtpFrom, DtpTo : TDateTimePicker);

     function Get_FilterWord : String;
     function Get_FilterBy : String;
     function Get_FilterOnlyByCredExt : String;
     procedure MakeReportCreditosInternos;

     procedure MakeReporte(peBPreview: Boolean);
     procedure CreaBuscador1(peStrNomBuscador : String;
                            peStrCamposBuscador : String;
                            penResultBusc1, penResultBusc2 : Integer;
                            peCVE_INTERCAMPO, peDESC_INTERCAMPO : TInterCampo;
                            peCheckBox : TCheckBox
                           );
     procedure ObtenDescripcion(peStrBuffer, peStrSQL, peStrNomCampo: String;
                                peCVE_INTERCAMPO, peDESC_INTERCAMPO : TInterCampo;
                                peCheckBox : TCheckBox);
     procedure LimpiaControles(peCheckBox: TCheckBox; peCVE_INTERCAMPO, peDESC_INTERCAMPO: TInterCampo);
    public
    { Public declarations }
    Objeto : TMRepCau;

    published
      property FilterWord : String Read Get_FilterWord;
      property FilterBy : String Read Get_FilterBy;
      property FilterOnlyByCredExt : String Read Get_FilterOnlyByCredExt;

end;
 TMRepCau= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ParamCre    : TParamCre;
        PromAsociado: TMPersona;
        Acreditado  : TCrAcredit; // Acreditado
        Credito     : TCrCredito; // Disposición

        CVE_PRESUPUESTO     : TInterCampo;
        DESC_PRESUPUESTO    : TInterCampo;        

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      end;

function SearchStr(substr,str : String) : Integer;
function ReplaceStr(strSource, strFind, strReplace : String) : String;

implementation

Uses IntMQrGtia; // Reporte Interno de Garantías

{$R *.DFM}

function SearchStr(substr,str : String) : Integer;
var I, J, H, nLen, nLen1 : Integer;
begin
   Result := 0;
   nLen   := Length(str);
   nLen1  := Length(substr);

  If (nLen > 0) And (nLen1 > 0) Then
   For I := 1 To nLen Do
    Begin
     If (str[I] = substr[1]) And (str[I+nLen1-1] = substr[nLen1]) Then
      Begin
       H := I;

       For J := 1 To nLen1 Do
        Begin
         If Not (substr[J] = str[H]) Then
          Break;
         Inc(H);
        End;

       If (H - I) = nLen1 Then
        Begin
        Result := I;
        Break;
        End;

      End;
    End;
end;

function ReplaceStr(strSource, strFind, strReplace : String) : String;
var nPos : Integer;
begin
 nPos := SearchStr(UpperCase(strFind),UpperCase(strSource));
 If (nPos > 0) Then
  Result := Copy(strSource,1,nPos-1)+strReplace+
            Copy(strSource,nPos+Length(strFind),Length(strSource))
 Else
  Result := strSource;
end;

constructor TMRepCau.Create( AOwner : TComponent );
begin
   Inherited;
   {$WARNINGS OFF}
   Acreditado  := TCrAcredit.Create(Self);
   {$WARNINGS ON}
   Acreditado.MasterSource := Self;
   Acreditado.ID_ACREDITADO.MasterField := 'ID_ACREDITADO';

   {$WARNINGS OFF}
   Credito   := TCrCredito.Create(Self);
   {$WARNINGS ON}
   Credito.MasterSource := Self;

   {$WARNINGS OFF}
   PromAsociado := TMPersona.Create(Self);
   {$WARNINGS ON}   
   PromAsociado.FilterBy := fbTMPersonaEmpleado;
   PromAsociado.MasterSource := Self;
   PromAsociado.FieldByName('ID_PERSONA').MasterField := 'ID_PERS_ASOCIAD';
   PromAsociado.BuscaWhereString := 'SIT_EMPLEADO = ''AC''';

   CVE_PRESUPUESTO     := CreaCampo('CVE_PRESUPUESTO',ftInteger,tsNinguno,tsNinguno,False);
   DESC_PRESUPUESTO    := CreaCampo('DESC_PRESUPUESTO',ftString,tsNinguno,tsNinguno,False);   

   StpName  := ' ';
   UseQuery := False;
   HelpFile := 'InTMRepCau.Hlp';
   ShowMenuReporte:=True;
end;

Destructor TMRepCau.Destroy;
begin
 If Assigned(Acreditado) Then Acreditado.Free;
 If Assigned(Credito) Then Credito.Free;
 If Assigned(PromAsociado) Then PromAsociado.Free;
 inherited;
end;

function TMRepCau.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWRepCau;
begin
   W:=TWRepCau.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftImprimir;// ftConsulta; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TMRepCau.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('IRepgara.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;


(***********************************************FORMA RepCaucion********************)
(*                                                                              *)
(*  FORMA DE RepCaucion                                                            *)
(*                                                                              *)
(***********************************************FORMA RepCaucion********************)

procedure TWRepCau.FormShow(Sender: TObject);
begin
 With Objeto Do
  Begin
  lbDempresa.Caption := ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := ParamCre.FECHA.AsString;
  lbDUsuario.Caption := ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

  Acreditado.ID_ACREDITADO.Control := edID_ACREDITADO;
  Acreditado.Persona.Nombre.Control := edNombre;

  Credito.ID_CREDITO.Control := edID_CREDITO;
  Credito.ContratoCre.Contrato.TITNombre.Control := edNom_Credito;

  PromAsociado.Nombre.Control := edNombre_Promotor;
  PromAsociado.ID_PERSONA.Control := edId_Promotor;

  CVE_PRESUPUESTO.Control   := edCVE_PRESUPUESTO;
  DESC_PRESUPUESTO.Control  := edDESC_PRESUPUESTO;

  dtpFromInicio.Date := Date;
  dtpToInicio.Date := Date;
  dtpFromVencimiento.Date := Date;
  dtpToVencimiento.Date := Date;
  End;

 With Objeto.Apli Do
  Begin
  Query1.DatabaseName := DatabaseName;
  Query1.SessionName := SessionName;
  End;
end;

procedure TWRepCau.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 With Objeto Do
  Begin
  Acreditado.ID_ACREDITADO.Control := Nil;
  Acreditado.Persona.Nombre.Control := Nil;

  Credito.ID_CREDITO.Control := Nil;
  Credito.ContratoCre.Contrato.TITNombre.Control := Nil;

  PromAsociado.Nombre.Control := Nil;
  PromAsociado.ID_Persona.Control := Nil;

  CVE_PRESUPUESTO.Control   := Nil;
  DESC_PRESUPUESTO.Control  := Nil;
  End;
end;

{ ********************************************************************************************* }

{ ******* Implementations of Procedures ******* }

procedure TWRepCau.Enable_Dtp_BySign(strSign: String; DtpFrom, DtpTo: TDateTimePicker);
begin
 If (Trim(strSign) <> '') Then
   If (strSign = 'Entre') Then
    Begin
    DtpFrom.Visible := True;
    DtpFrom.Enabled := True;
    End
   Else
    Begin
    DtpFrom.Visible := False;
    DtpFrom.Enabled := False;
    End;
end;

function TWRepCau.Get_FilterWord : String;
var
 bComma, bLast : Boolean;

 // Return a Comma or a 'o' when it requires, this fuction is only for checkbox of "Situación"
 function Comma : String;
 begin
  Result := '';
  If Not bComma Then bComma := True
  Else If bLast Then Result := ' o'
  Else If bComma Then Result := ',';
 end;

 // Return True if the checkbox selected is the last checked
 function IsLastChecked(CheckBox : TCheckBox) : Boolean;
 var I, nChecked : Integer;
     strName : String;
 begin
  nChecked := 0; strName := '';
  For I := 0 To grpSituacion.ControlCount - 1 Do
   If (grpSituacion.Controls[I] Is TCheckBox) Then
    With (grpSituacion.Controls[I] As TCheckBox) Do
     Begin
     If Checked Then
      Begin
      strName := Name;
      Inc(nChecked);
      End;
     End;

  Result := (strName = CheckBox.Name) And (nChecked > 2);
 end;
 //End IsLastChecked

 function Get_Filter_Situacion : String;

  function AreCheckedAll : Boolean;
  var I : Integer;
      bChecked : Boolean;
  begin
   bChecked := True;
   For I := 0 To grpSituacion.ControlCount - 1 Do
    If (grpSituacion.Controls[I] Is TCheckBox) Then
     With (grpSituacion.Controls[I] As TCheckBox) Do
      If (UpperCase(Name) <> 'CHKTODOS') Then
       bChecked := bChecked And Checked;

   Result := bChecked;
  end;
  //End AreCheckedAll

 var str : String;
 begin
  str := '';
  If chkTodos.Checked Or AreCheckedAll Then
   str := 'y por cualquier tipo de Situación'
  Else
   Begin
   bComma := False; bLast := False;
   str := 'y por su Situación';
   If chkActivos.Checked       Then str := str + Comma + ' "Activos"';
   If chkNoActivo.Checked      Then Begin bLast := IsLastChecked(chkActivos);    str := str + Comma + ' "No Activos"'; End;
   If chkCancelados.Checked    Then Begin bLast := IsLastChecked(chkCancelados); str := str + Comma + ' "Cancelados"'; End;
   If chkLiquidados.Checked    Then Begin bLast := IsLastChecked(chkLiquidados); str := str + Comma + ' "Liquidados"'; End;
   If chkSinReferencia.Checked Then Begin bLast := IsLastChecked(chkSinReferencia); str := str + Comma + ' "Sin Referencia"'; End;
   End;
  Result := str
 end;
 // End Get_Filter_Situacion

 function Get_Filter_Valuacion : String;
 begin
  Result := '';
   If opCierredeAyer.Checked Then Result := ' por el Tipo de Valuación al Cierre de Ayer '
   Else Result := ' por el Tipo de Valuación al Precio del Mercado ';
 end;
 // End Get_Filter_Valuacion

 function Get_Filter_Monto : String;
 begin
  Result := '';
  If Not opTodos.Checked Then
   If opFaltante.Checked Then Result := ' con Monto de Caución Faltante '
   Else Result := ' con Monto de Caución Sobrante ';
 end;
 // End Get_Filter_Monto

 function Get_Filter_Fechas : String;

  function Get_Filter_Fecha(cbxSign : TComboBox; dtpFrom, dtpTo : TDateTimePicker) : String;
  const FormatDateInter = 'dd"-"mmm"-"yy';
  var str : String;
  begin
   str := ' ';
   If (dtpFrom.Visible) Then
    str := FormatDateTime(FormatDateInter,dtpFrom.Date)+#32;

   If (cbxSign.ItemIndex = 0) Then
    str := ' del '+FormatDateTime(FormatDateInter,dtpTo.Date)+' al '+FormatDateTime(FormatDateInter,dtpTo.Date)
   Else
    str := str + cbxSign.Items[cbxSign.ItemIndex] + #32 + FormatDateTime(FormatDateInter,dtpTo.Date);

   Result := str;
  end;

 var str, strAnd : String;
 begin
  str := ''; strAnd := '';
  If (chkInicio.Checked) Then
   Begin str := ' con Fecha de Inicio'+Get_Filter_Fecha(cbxInicio,dtpFromInicio,dtpToInicio); strAnd := ' y'; End;

  If (chkVencimiento.Checked) Then
   str := str + strAnd + ' con Fecha de Vencimiento'+Get_Filter_Fecha(cbxVencimiento,dtpFromVencimiento,dtpToVencimiento);
  Result := str;
 end;
 // End Get_Filter_Fechas

 function Get_Filter_Acreditado : String;
 begin
 Result := '';
 If (chkAcreditado.Checked) And (Trim(edID_ACREDITADO.Text) <> '') Then
  Result := ' por Acreditado Específico';
 end;
 // End Get_Filter_Acreditado


 function Get_FilterPromotor : String;
 begin
 Result := '';
 If (Trim(edId_Promotor.Text) <> '') Then
  Result := ' con Promotor Específico ('+edNombre_Promotor.Text+')';
 end; // End Get_FilterPromotor

begin
 Result := 'Filtrado'+ Get_Filter_Acreditado + Get_Filter_Valuacion + Get_Filter_Situacion + Get_Filter_Monto +
           Get_Filter_Fechas + Get_FilterPromotor + '.';
end;
// End of Get_Filter_Word


{ ******* }

function TWRepCau.Get_FilterBy : String;

 function Get_FilterBySituacion : String;
 var str, strOr : String;
 begin
  Result := ''; str := ''; strOr := '';
  If Not chkTodos.Checked Then
   Begin
    If chkActivos.Checked    Then
     Begin
     str := ' SIT_CREDITO = '#39'AC'#39;
     strOr := ' OR ';
     End;
    If chkNoActivo.Checked   Then
     Begin
     str := str + strOr + ' SIT_CREDITO = '#39'NA'#39;
     strOr := ' OR ';
     End;
    If chkCancelados.Checked Then
     Begin
     str := str + strOr + ' SIT_CREDITO = '#39'CA'#39;
     strOr := ' OR ';
     End;
    If chkLiquidados.Checked Then
     Begin
     str := str + strOr + ' SIT_CREDITO = '#39'LQ'#39;
     End;

   If (Trim(str) <> '') Then
    Result := 'AND  ('+str+')';
   End;
 end;
 // End of Get_FilterByValuacion

 function Get_FilterByFechas : String;

  function Get_FilterByFecha(dtpFrom, dtpTo : TDateTimePicker; cbxFilter : TComboBox; strField : String) : String;
  const F_DATE1 = 'DD/MM/YYYY';
  begin
   If UpperCase(Trim(cbxFilter.Items[cbxFilter.ItemIndex])) = 'ENTRE' Then
    Result := ' TRUNC('+strField+') BETWEEN TO_DATE('#39+FormatDateTime(F_DATE1,dtpFrom.Date)+#39+
              ','#39+F_DATE1+#39') AND TO_DATE('#39+FormatDateTime(F_DATE1,dtpTo.Date)+#39','#39+F_DATE1+#39') '
   Else
    Result := ' TRUNC('+strField+') '+cbxFilter.Items[cbxFilter.ItemIndex]+
              ' TO_DATE('#39+FormatDateTime(F_DATE1,dtpTo.Date)+#39','#39+F_DATE1+#39') ';
  end;

 var strFilterFechas, strAnd : String;
 begin
  Result := ''; strFilterFechas := ''; strAnd := ' ';
  If chkInicio.Checked Then
   Begin
   strFilterFechas := Get_FilterByFecha(dtpFromInicio,dtpToInicio,cbxInicio,'F_INICIO');
   strAnd := ' AND ';
   End;
  If chkVencimiento.Checked Then
   strFilterFechas := strFilterFechas + strAnd +
                      Get_FilterByFecha(dtpFromVencimiento,dtpToVencimiento,cbxVencimiento,'F_INICIO + DIAS_PLAZO');

  If (Trim(strFilterFechas) <> '') Then
   Result := ' AND ('+strFilterFechas+')';
 end;

begin
  Result := ' '+Get_FilterBySituacion + Get_FilterByFechas;
end;
// End of Get_FilterBy

function TWRepCau.Get_FilterOnlyByCredExt : String;
const MAX_FIELDS = 2;
      aSEARCH  : Array[0..MAX_FIELDS] Of String = ('F_VALOR_CRED + DIAS_PLAZO','F_VALOR_CRED',
                                        'SIT_CREDITO');
      aREPLACE : Array[0..MAX_FIELDS] Of String = ('VA_CRED_EXTERNO.F_VENCIMIENTO','VA_CRED_EXTERNO.F_INICIO',
                                        'VA_CRED_EXTERNO.SIT_CREDITO');

var str : String;
    I : Integer;
begin
 // Because the query is the same but the fields are differnts in the table cre_credito and va_cred_externo
 // only make a sustitute for them
 str := FilterBy;

 For I := 0 To MAX_FIELDS Do
  Begin
  While Pos(aSEARCH[I],str) > 0 Do
   str := ReplaceStr(str,aSEARCH[I],aREPLACE[I]);
  End;
 Result := str;
end;

procedure TWRepCau.MakeReportCreditosInternos;

 function Get_Creditos(pestrSQL : String) : String;
 var str, strDia_Valuacion, strComa : String;
 begin
  With Qry Do
   Try
     DatabaseName := Objeto.Apli.DatabaseName;
     SessionName  := Objeto.Apli.SessionName;

     { Tipo de Valuación }
     If opCierredeAyer.Checked Then strDia_Valuacion := 'AYER'  // 'AYER' = Trae los datos del Día de Ayer
     Else strDia_Valuacion  := 'D000';   // 'D000' = Trae los datos del Día de Hoy

    str := ''; strComa := '';
    SQL.Clear;   //HIJO
    SQL.Add(' SELECT ID_CREDITO, SUM(IMP_VALUACION) - SUM(SDO_GRTIA) AS DIFERENCIA '+coCRLF+
            ' FROM'+coCRLF+
            '   ('+pestrSQL+')'+coCRLF+
            ' GROUP BY ID_CREDITO'+coCRLF
            );
    Edit1.Text := SQL.text;
    Open;

    If (opSobrante.Checked) Then
     While Not  Eof Do
      Begin
       If (FieldByName('DIFERENCIA').AsFloat > 0) Then
       Begin
       str := str + strComa + FieldByName('ID_CREDITO').AsString;
       strComa := ',';
       End;
      Next;
      End

    Else If (opFaltante.Checked) Then
     While Not Eof Do
      Begin
       If (FieldByName('DIFERENCIA').AsFloat < 0) Then
       Begin
       str := str + strComa + FieldByName('ID_CREDITO').AsString;
       strComa := ',';
       End;
      Next;
      End;

   Finally
    If (Trim(str) = '') Then Result := '0'
    Else Result := str;
    Close;
   End;
 end;

 procedure GetTipoCambioUDIS_DOLAR(var dUDI, dDOLLAR : Double);
 var Qry : TQuery;
     strDia_Valuacion : String;
 begin
   dUDI := 0;
   dDOLLAR := 0;
   Qry := TQuery.Create(Nil);
   If Assigned(Qry) Then
   With Qry Do
    Try
     DatabaseName := Objeto.Apli.DatabaseName;
     SessionName  := Objeto.Apli.SessionName;

     If opCierredeAyer.Checked Then strDia_Valuacion := 'AYER'  // 'AYER' = Trae los datos del Día de Ayer
     Else strDia_Valuacion  := 'D000';   // 'D000' = Trae los datos del Día de Hoy

     SQL.Clear;
     SQL.Add(' SELECT PKGCRECAUCIONES.OBTTIPOCAMBIO(484, 800, PkgFunProcCorp.FReferencia('#39+strDia_Valuacion+#39',2)) UDI,    '#13#10+
             '        PKGCRECAUCIONES.OBTTIPOCAMBIO(484, 840, PkgFunProcCorp.FReferencia('#39+strDia_Valuacion+#39',2)) DOLLAR FROM DUAL');
     Open;
     dUDI    := FieldByName('UDI').AsFloat;
     dDOLLAR := FieldByName('DOLLAR').AsFloat;
    Finally
     Close;    
     Free;
    End;
 end;

var FRpIntGtia : TFRpIntGtia;
    ReportPreview : TIntQRPreview;
    dUDI, dDOLLAR : Double;
    vlstrSQL, strDia_Valuacion : String;
    vlNumOpcion : Integer;
begin
 edit1.Text := FilterBy; ReportPreview := Nil;

 If Assigned(FRpIntGtia) Then
  FRpIntGtia.Close;

 Application.CreateForm(TFRpIntGtia,FRpIntGtia);
 If Assigned(FRpIntGtia) Then
  With FRpIntGtia Do
   Try
    FRpIntGtia.MostrarTotalAcreditado := opCreditosInternosB.Checked;
    ReportPreview := TIntQRPreview.CreatePreview(Application, FRpIntGtia.QuickRep );

    qrieCredIntGtia.Apli := Objeto.Apli;
    If (opCreditosInternosA.Checked) Then qrieCredIntGtia.Titulo2 := '('+opCreditosInternosA.Caption+')'
    Else qrieCredIntGtia.Titulo2 := '('+opCreditosInternosB.Caption+')';

    GetTipoCambioUDIS_DOLAR(dUDI, dDOLLAR);
    qrlblTipoCambio.Caption := 'Tipo de Cambio: UDI = '+Format('%16.4m',[dUDI])+
                               ' , DOLAR AMERICANO = '+Format('%16.4m',[dDOLLAR]);

    With qCredIntGtia Do
     Begin
     { Tipo de Valuación }
     If opCierredeAyer.Checked Then strDia_Valuacion := 'AYER'  // 'AYER' = Trae los datos del Día de Ayer
     Else strDia_Valuacion  := 'D000';   // 'D000' = Trae los datos del Día de Hoy

     QryTemp.DatabaseName := Objeto.Apli.DatabaseName;
     QryTemp.SessionName  := Objeto.Apli.SessionName;

     QryRESUMEN.DatabaseName := Objeto.Apli.DatabaseName;
     QryRESUMEN.SessionName  := Objeto.Apli.SessionName;
//</ RABA > 21 JUL 2011
// SE AGREGA QUERY PARA OBTENER LOS DIAS VENCIDOS POR CREDITO
     qryDiasVencido.DatabaseName := Objeto.Apli.DatabaseName;
     qryDiasVencido.SessionName := Objeto.Apli.SessionName;
//< RABA />

     DatabaseName := Objeto.Apli.DatabaseName;
     SessionName  := Objeto.Apli.SessionName;

     vlstrSQL :=
                '   SELECT'+coCRLF+
                '        R.ID_TITULAR AS ID_ACREDITADO,'+coCRLF+
                '        R.CVE_ORIGEN,'+coCRLF+
                '        R.ID_PERS_ASOCIAD,'+coCRLF+
                '        SUBSTR(PKGCRCREDITOO1.STP_OBT_NOM_TITULAR(NULL,NULL,R.ID_PERS_ASOCIAD),1,255) AS NOMBRE_PROMOTOR,'+coCRLF+
                '        R.ID_CONTRATO,'+coCRLF+
                '        SUBSTR(PKGCRCREDITOO1.STP_OBT_NOM_TITULAR(NULL,R.ID_CONTRATO,NULL),1,255) AS NOMBRE_ACREDITADO,'+coCRLF+
                '        R.SIT_CREDITO,'+coCRLF+
                '        R.ID_CREDITO,'+coCRLF+
                '        R.F_INICIO,'+coCRLF+
                '        R.F_VENCIMIENTO,'+coCRLF+
                '        R.TASA_INTERES,'+coCRLF+
                '        ROUND(R.IMP_CREDITO   * TIPO_CAMBIO_CTO, 2) AS IMP_CREDITO,'+coCRLF+
                '        ROUND(R.IMP_DISPUESTO * TIPO_CAMBIO_CTO, 2) AS IMP_DISPUESTO,'+coCRLF+
                '        ROUND((R.SDO_VIG_TOTAL + R.IMP_CAPITAL_VDO + R.IMP_VDO_FINAN_A) * TIPO_CAMBIO_CTO, 2) AS SDO_INSOLUTO,'+coCRLF+
                '        NULL AS PROPORCION,'+coCRLF+
                '        R.FACT_PROPOR_GAR,'+coCRLF+
                '        ROUND(ROUND(R.SDO_VIG_TOTAL * R.TIPO_CAMBIO_CTO + R.IMP_CAPITAL_VDO + R.IMP_VDO_FINAN_A, 2) * R.FACT_PROPOR_GAR ,2) AS SDO_GRTIA,'+coCRLF+
                '        NVL(ROUND(R.IMP_NETO_CORTE * TIPO_CAMBIO_OTORG, 2),0) AS IMP_VALUACION_CORTE,'+coCRLF+
                '        NVL(ROUND(R.IMP_NETO_VTO * TIPO_CAMBIO_OTORG, 2),0) AS IMP_VALUACION,'+coCRLF+
                '        R.CTO_OTORG AS OTORGANTE,'+coCRLF+
                '        SUBSTR(PKGCRCREDITOO1.STP_OBT_NOM_TITULAR(NULL,R.CTO_OTORG,NULL),1,255) AS NOMBRE_OTORGANTE,'+coCRLF+
                '        SUBSTR(PKGCRCREDITOO1.STP_OBT_NOM_TITULAR(NULL,NULL,R.PERS_ASOC_OTORG),1,255) AS PROMOTOR,'+coCRLF+
                '        0 AS NUEVA_VALUACION,'+coCRLF+
                '        R.FH_CAPTURA,'+coCRLF+
                '        R.ID_PAGARE,'+coCRLF+
                '        R.DIAS_PLAZO_PAG,'+coCRLF+
                '        R.F_VENCIMIENTO_PAG,'+coCRLF+
                '        R.TIPO_CAMBIO_CTO,'+coCRLF+
                '        R.TIPO_CAMBIO_OTORG,'+coCRLF+
                '        R.CVE_MONEDA,'+coCRLF+
                '        R.CVE_MON_OTORG,'+coCRLF+
                '        M.DESC_MONEDA,'+coCRLF+
                '        R.CVE_PRESUPUESTO,'+coCRLF+
                '        PRES.DESC_PRESUPUESTO'+coCRLF+                
                '   FROM ('+coCRLF+
                '          SELECT DATOS.*,'+coCRLF+
                '                 CTO.CVE_MONEDA,'+coCRLF+
                '                 CTO.ID_TITULAR,'+coCRLF+
                '                 CTO.ID_PERS_ASOCIAD,'+coCRLF+
                '                 PKGCRECAUCIONES.OBTTIPOCAMBIO(484, CTO.CVE_MONEDA,'+coCRLF+
                '                                                    PKGFUNPROCCORP.FREFERENCIA(''D000'',2)) AS TIPO_CAMBIO_CTO,'+coCRLF+
                '                 PKGCRECAUCIONES.OBTTIPOCAMBIO(484, CVE_MON_OTORG,'+coCRLF+
                '                                                    PKGFUNPROCCORP.FREFERENCIA(''D000'',2)) AS TIPO_CAMBIO_OTORG'+coCRLF+
                '          FROM ( SELECT'+coCRLF+
                '                        CC.CVE_ORIGEN,'+coCRLF+
                '                        CC.SIT_CREDITO, CC.ID_CONTRATO, CC.ID_CREDITO, CC.F_INICIO, CC.F_VENCIMIENTO, CC.IMP_CAPITAL_VDO, CC.IMP_VDO_FINAN_A,'+coCRLF+
                '                        CC.TASA_INTERES, CC.IMP_CREDITO, CC.IMP_DISPUESTO, CC.SDO_VIG_TOTAL,'+coCRLF+
//                '                        NVL(CC.FACT_PROPOR_GAR, CGFC.PCT_GTIA_LIQ / 100) AS FACT_PROPOR_GAR, CC.DIAS_PLAZO,'+coCRLF+
                '                        DECODE( NVL(CC.FACT_PROPOR_GAR, 0), 0, (CGFC.PCT_GTIA_LIQ / 100),'+coCRLF+
                '                                NVL(CC.FACT_PROPOR_GAR, 0) ) AS FACT_PROPOR_GAR,'+coCRLF+
                '                        CC.DIAS_PLAZO,'+coCRLF+
                '                        DATOS_PAGARE.IMP_NETO_CORTE,'+coCRLF+
                '                        DATOS_PAGARE.IMP_NETO_VTO,'+coCRLF+
                '                        DATOS_PAGARE.ID_CONTRATO AS CTO_OTORG,'+coCRLF+
                '                        DATOS_PAGARE.CVE_MONEDA  AS CVE_MON_OTORG,'+coCRLF+
                '                        DATOS_PAGARE.ID_PERS_ASOCIAD AS PERS_ASOC_OTORG,'+coCRLF+
                '                        SUBSTR(PKGCRCREDITOO1.STP_OBT_NOM_TITULAR(NULL,DATOS_PAGARE.ID_CONTRATO,NULL),1,255) AS NOM_OTORG,'+coCRLF+
                '                        SUBSTR(PKGCRCREDITOO1.STP_OBT_NOM_TITULAR(NULL,NULL,DATOS_PAGARE.ID_PERS_ASOCIAD),1,255) AS PROM_OTORG,'+coCRLF+
                '                        DATOS_PAGARE.F_APERTURA AS FH_CAPTURA,'+coCRLF+
                '                        -- Nuevos Campos Agregados para el uso de pagarés'+coCRLF+
                '                        DATOS_PAGARE.ID_PAGARE,'+coCRLF+
                '                        DATOS_PAGARE.DIAS_PLAZO AS DIAS_PLAZO_PAG,'+coCRLF+
                '                        DATOS_PAGARE.F_VENCIMIENTO AS F_VENCIMIENTO_PAG,'+coCRLF+
                '                        CC.CVE_PRESUPUESTO'+coCRLF+
                '                  FROM'+coCRLF+
                '                      (     SELECT'+coCRLF+
                '                                   ''ICRE'' AS CVE_ORIGEN,'+coCRLF+
                '                                   CC.ID_CREDITO,'+coCRLF+
                '                                   CC.SIT_CREDITO, CC.ID_CONTRATO,'+coCRLF+
                '                                   CC.F_INICIO, CC.F_VENCIMIENTO, CC.IMP_CAPITAL_VDO, CC.IMP_VDO_FINAN_A,'+coCRLF+
                '                                   CC.CVE_TASA_REFER || CC.OPERADOR_STASA || CC.SOBRETASA AS TASA_INTERES,'+coCRLF+
                '                                   CC.IMP_CREDITO,'+coCRLF+
                '                                   CC.IMP_DISPUESTO, CC.SDO_VIG_TOTAL, CC.FACT_PROPOR_GAR, CC.DIAS_PLAZO,'+coCRLF+
                '                                   CC.CVE_OPERATIVA,'+coCRLF+
                '                                   CP.CVE_PRESUPUESTO'+coCRLF+
                '                              FROM CR_CREDITO CC,'+coCRLF+
                '                                   CR_CONTRATO CO,'+coCRLF+
                '                                   CR_PRODUCTO CP'+coCRLF+
                '                              WHERE CC.SIT_CREDITO <> ''CA'''+coCRLF+
                '                                AND CO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
                '                                AND CP.CVE_PRODUCTO_CRE = CO.CVE_PRODUCTO_CRE'+coCRLF+
                '                           UNION ALL'+coCRLF+
                '                              SELECT'+coCRLF+
                '                                   ''INTER'' AS CVE_ORIGEN,'+coCRLF+
                '                                   CC.ID_CREDITO,'+coCRLF+
                '                                   CC.SIT_CREDITO, CC.ID_CONTRATO,'+coCRLF+
                '                                   CC.F_VALOR_CRED, (CC.F_VALOR_CRED + CC.DIAS_PLAZO) AS F_VENCIMIENTO, CC.IMP_CAPITAL_VDO, 0 AS IMP_VDO_FINAN_A,'+coCRLF+
                '                                   CC.CVE_TASA_REFER || CC.OPERADOR_STASA || CC.SOBRETASA AS TASA_INTERES,'+coCRLF+
                '                                   CC.IMP_CREDITO,'+coCRLF+
                '                                   CC.IMP_DISPUESTO, CC.SDO_INSOLUTO AS SDO_VIG_TOTAL, CC.FACT_PROPOR_GAR, CC.DIAS_PLAZO,'+coCRLF+
                '                                   '' '' AS CVE_OPERATIVA,'+coCRLF+
                '                                   CC.CVE_PRESUPUESTO'+coCRLF+
                '                              FROM CRE_CREDITO CC'+coCRLF+
                '                              WHERE SIT_CREDITO NOT IN (''TA'',''CA'')'+coCRLF+
                '                      ) CC,'+coCRLF+
                '                      ( SELECT ID_CONTRATO, CVE_OPERATIVA, MAX(PCT_GTIA_LIQ) AS PCT_GTIA_LIQ'+coCRLF+
                '                        FROM CR_GA_FIRA_CTO'+coCRLF+
                '                        WHERE SIT_GA_FIRA = ''AC'''+coCRLF+
                '                        GROUP BY ID_CONTRATO, CVE_OPERATIVA'+coCRLF+
                '                      ) CGFC,'+coCRLF+
                '                      ( SELECT CRPD.ID_CREDITO, PAGARE.*'+coCRLF+
                '                        FROM  ( SELECT ID_CREDITO, ID_CONTRATO, ID_PAGARE'+coCRLF+
                '                                FROM CR_REL_PAG_DISP'+coCRLF+
                '                                WHERE SIT_REL_PAG_DISP = ''AC'''+coCRLF+
                '                              ) CRPD,'+coCRLF+
                '                              ( SELECT CTO.CVE_MONEDA,'+coCRLF+
                '                                       CTO.ID_PERS_ASOCIAD,'+coCRLF+
                '                                       IP.ID_CONTRATO,'+coCRLF+
                '                                       IP.ID_PAGARE,'+coCRLF+
                '                                       (IP.IMP_CAPITAL + IP.IMP_ACUM_INT - IP.IMP_ACUM_ISR) AS IMP_NETO_CORTE,'+coCRLF+
                '                                       IP.IMP_NETO_VTO,'+coCRLF+
                '                                       IP.DIAS_PLAZO,'+coCRLF+
                '                                       IP.F_VENCIMIENTO,'+coCRLF+
                '                                       IP.F_APERTURA'+coCRLF+
                '                                FROM INV_PAGARE IP,'+coCRLF+
                '                                     CONTRATO CTO'+coCRLF+
                '                                WHERE IP.CVE_SIT_PAGARE = ''AC'' -- QUE SE ENCUENTRE ACTIVO EL PAGARÉ'+coCRLF+
                '                                  AND CTO.ID_CONTRATO = IP.ID_CONTRATO'+coCRLF+
                '                              ) PAGARE'+coCRLF+
                '                        WHERE PAGARE.ID_CONTRATO (+)= CRPD.ID_CONTRATO'+coCRLF+
                '                          AND PAGARE.ID_PAGARE (+)= CRPD.ID_PAGARE'+coCRLF+
                '                      ) DATOS_PAGARE'+coCRLF+
                '                     WHERE CC.ID_CREDITO = DATOS_PAGARE.ID_CREDITO'+coCRLF+
                '                       AND CGFC.ID_CONTRATO   (+)= CC.ID_CONTRATO'+coCRLF+
                '                       AND CGFC.CVE_OPERATIVA (+)= CC.CVE_OPERATIVA'+coCRLF+
                '                 ) DATOS,'+coCRLF+
                '                 CONTRATO CTO'+coCRLF+
                '           WHERE CTO.ID_CONTRATO = DATOS.ID_CONTRATO'+coCRLF+
                '        ) R, -- Resultado'+coCRLF+
                '        MONEDA M,'+coCRLF+
                '        CRE_PRESUPUESTO PRES'+coCRLF+                
                '   WHERE 1 = 1'+coCRLF+
                '     AND M.CVE_MONEDA = R.CVE_MONEDA'+coCRLF+
                '     AND PRES.CVE_PRESUPUESTO (+)= R.CVE_PRESUPUESTO'+coCRLF
                ;

    If (edID_ACREDITADO.Text <> '') Then
     vlstrSQL := vlstrSQL + '    AND ID_TITULAR = '+Objeto.Acreditado.ID_ACREDITADO.AsString+coCRLF;

    If (edID_PROMOTOR.Text <> '') Then
     vlstrSQL := vlstrSQL + '    AND ID_PERS_ASOCIAD = '+Objeto.PromAsociado.ID_PERSONA.AsString+coCRLF;

    If (edID_CREDITO.Text <> '') Then
     vlstrSQL := vlstrSQL + '    AND ID_CREDITO = '+Objeto.Credito.ID_CREDITO.AsString+coCRLF;

    Objeto.CVE_PRESUPUESTO.GetFromControl;
    If (Objeto.CVE_PRESUPUESTO.AsString <> '') Then
     vlstrSQL := vlstrSQL + '    AND PRES.CVE_PRESUPUESTO = '+SQLStr(Objeto.CVE_PRESUPUESTO.AsString)+coCRLF+
                            '    AND R.CVE_PRESUPUESTO = '+SQLStr(Objeto.CVE_PRESUPUESTO.AsString)+coCRLF;

     vlstrSQL := vlstrSQL + Get_FilterBy +coCRLF;

    If (opFaltante.Checked) Or (opSobrante.Checked) Then
     vlstrSQL := vlstrSQL + '    AND ID_CREDITO IN ('+Get_Creditos(vlstrSQL)+')'+coCRLF;

{    If (opCreditosInternosA.Checked) Then vlstrSQL := vlstrSQL + ' ORDER BY NOMBRE_PROMOTOR, ID_CREDITO, OTORGANTE'
    Else vlstrSQL := vlstrSQL + ' ORDER BY NOMBRE_PROMOTOR, NOMBRE_ACREDITADO, ID_CREDITO'; }

    If (opCreditosInternosA.Checked) Then vlstrSQL := vlstrSQL + ' ORDER BY DESC_PRESUPUESTO, NOMBRE_PROMOTOR, ID_CREDITO, OTORGANTE'
    Else vlstrSQL := vlstrSQL + ' ORDER BY DESC_PRESUPUESTO, NOMBRE_PROMOTOR, NOMBRE_ACREDITADO, ID_CREDITO';

    SQL.Clear;
    SQL.Add(vlstrSQL);

    Edit2.text := SQL.Text;
    End;

    qCredIntGtia.Open;
    qrlblFilter.Caption := FilterWord;

    If (qCredIntGtia.RecordCount > 0) Then
      Begin
       FRpIntGtia.vgBGeneraArchivoExcel := (chkExcel.Checked) And (ExtractFileName(Trim(edFileName.Text)) <> '');

       If opPlano.Checked Then vlNumOpcion := 0
       Else vlNumOpcion := 1;

       If (vgBGeneraArchivoExcel) Then
          FRpIntGtia.IniciaArchivoExcel(edFileName.Text, vlNumOpcion);

       If (m_bPreview) Then QuickRep.Preview
       Else QuickRep.Print;

       If (FRpIntGtia.vgBGeneraArchivoExcel) Then
         If FRpIntGtia.Cierra_Y_Guarda_ArchivoExcel Then
            If (MessageDlg('Se generó el archivo '+edFileName.Text+'.'+coCRLF+
                           '¿Desea abrirlo?', mtInformation, [mbYes, mbNo], 0) = mrYes) Then
              ShellExecute(Handle, 'open', 'excel', Pchar('"'+edFileName.Text+'"'), Nil, SW_SHOW);
      End
    Else ShowMessage('No hay datos que Mostrar');
   Finally
    If Assigned(ReportPreview) Then ReportPreview.Free;
    qCredIntGtia.Close;
    // qGarantias.Close;

    If Assigned(FRpIntGtia) Then
     FRpIntGtia.Free;
   End;
end;

{ ******* Implementations of Controls Events ******* }

procedure TWRepCau.chkInicioClick(Sender: TObject);
var bValue : Boolean;
begin
 bValue := chkInicio.Checked;
 dtpFromInicio.Enabled := bValue;
 dtpToInicio.Enabled := bValue;
 cbxInicio.Enabled := bValue;
end;

procedure TWRepCau.chkVencimientoClick(Sender: TObject);
var bValue : Boolean;
begin
 bValue := chkVencimiento.Checked;
 dtpFromVencimiento.Enabled := bValue;
 dtpToVencimiento.Enabled := bValue;
 cbxVencimiento.Enabled := bValue;
end;

procedure TWRepCau.cbxInicioChange(Sender: TObject);
begin
 Enable_Dtp_BySign(cbxInicio.Items[cbxInicio.ItemIndex],dtpFromInicio,dtpToInicio);
end;

procedure TWRepCau.cbxVencimientoChange(Sender: TObject);
begin
 Enable_Dtp_BySign(cbxVencimiento.Items[cbxVencimiento.ItemIndex],dtpFromVencimiento,dtpToVencimiento);
end;

procedure TWRepCau.chkTodosClick(Sender: TObject);
var I : Integer;
begin
  If (Sender As TCheckBox).Checked Then
   Begin
   For I := 0 To grpSituacion.ControlCount - 1 Do
    If (grpSituacion.Controls[I] Is TCheckBox) Then
     With (grpSituacion.Controls[I] As TCheckBox) Do
      If (UpperCase(Name) <> 'CHKTODOS') Then
       Checked := False;  // Uncheck all the checkboxes except "chkTodos"
   End;
end;

procedure TWRepCau.chkActivosClick(Sender: TObject);
var I : Integer;
    bChecked : Boolean;
begin
 bChecked := False;
 For I := 0 To grpSituacion.ControlCount - 1 Do
  If (grpSituacion.Controls[I] Is TCheckBox) Then
   With (grpSituacion.Controls[I] As TCheckBox) Do
    bChecked := bChecked Or Checked;

// If one of the checkbox is checked then uncheck chkTodos otherwise chkTodos is checked
 chkTodos.Checked := Not bChecked;
end;

procedure TWRepCau.FormCreate(Sender: TObject);
begin
 cbxInicio.ItemIndex := 0;
 cbxVencimiento.ItemIndex := 0;
end;

procedure TWRepCau.btnId_PersonaClick(Sender: TObject);
begin
 With Objeto Do
  Begin
   Acreditado.ShowAll := True;
   If Acreditado.Busca Then
    Begin
    chkAcreditado.Checked:=True;
    chkAcreditado.Enabled:=True;
    InterForma1.NextTab(edID_ACREDITADO);
    btnId_Persona.Enabled := True;
    End;
 End;
end;

procedure TWRepCau.btnPromotorClick(Sender: TObject);
begin
 With Objeto Do
  Begin
   PromAsociado.ShowAll := True;
   If PromAsociado.Busca Then
    Begin
    chkPromotor.Checked:=True;
    chkPromotor.Enabled:=True;
    InterForma1.NextTab(edID_PROMOTOR);
    btnPromotor.Enabled := True;
    End;
 End;
end;

procedure TWRepCau.btnCreditoClick(Sender: TObject);
begin
 With Objeto Do
  Begin
   Credito.ShowAll := True;
   If Credito.Busca Then
    Begin
    chkCredito.Checked:=True;
    chkCredito.Enabled:=True;
    InterForma1.NextTab(edID_CREDITO);
    btnCredito.Enabled := True;
    End;
 End;
end;

procedure TWRepCau.ilID_AcreditadoEjecuta(Sender: TObject);
begin
 If Objeto.Acreditado.FindKey([ilID_Acreditado.Buffer] ) Then
     Begin
     chkAcreditado.Checked:=True;
     chkAcreditado.Enabled:=True;
     InterForma1.NextTab(edID_ACREDITADO);
     btnId_Persona.Enabled := True;
     End;
end;

procedure TWRepCau.ILPromotorEjecuta(Sender: TObject);
begin
 If Objeto.PromAsociado.FindKey([ILPromotor.Buffer]) Then
     Begin
     chkPromotor.Checked:=True;
     chkPromotor.Enabled:=True;
     InterForma1.NextTab(edID_PROMOTOR);
     btnPromotor.Enabled := True;
     End;
end;

procedure TWRepCau.ILCreditoEjecuta(Sender: TObject);
begin
 If Objeto.Credito.FindKey([ILCredito.Buffer]) Then
     Begin
     chkCredito.Checked:=True;
     chkCredito.Enabled:=True;
     InterForma1.NextTab(edID_CREDITO);
     btnCredito.Enabled := True;
     End;
end;





procedure TWRepCau.ilID_AcreditadoCapture(Sender: TObject; var Show: Boolean);
begin
 Show := True;
end;

procedure TWRepCau.chkAcreditadoClick(Sender: TObject);
begin
    If Not chkAcreditado.Checked Then
      Begin
      Objeto.Acreditado.Active:=False;
      chkAcreditado.Checked:=False;
      chkAcreditado.Enabled:=False;
      End
    Else
      Begin
      chkAcreditado.Checked:=True;
      chkAcreditado.Enabled:=True;
      End;
end;

procedure TWRepCau.chkPromotorClick(Sender: TObject);
begin
    If Not chkPromotor.Checked Then
      Begin
      Objeto.PromAsociado.Active:=False;
      chkPromotor.Checked:=False;
      chkPromotor.Enabled:=False;
      End
    Else
      Begin
      chkPromotor.Checked:=True;
      chkPromotor.Enabled:=True;
      End;
end;


procedure TWRepCau.chkCreditoClick(Sender: TObject);
begin
    If Not chkCredito.Checked Then
      Begin
      Objeto.Credito.Active:=False;
      chkCredito.Checked:=False;
      chkCredito.Enabled:=False;
      End
    Else
      Begin
      chkCredito.Checked:=True;
      chkCredito.Enabled:=True;
      End;
end;

procedure TWRepCau.InterForma1BtnPreviewClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMREPCAU_PREVI',True,True) then
   begin
      MakeReporte(True);
   end;
end;

procedure TWRepCau.InterForma1BtnImprimirClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMREPCAU_IMPRI',True,True) then
   begin
      MakeReporte(False);
   end;
end;

procedure TWRepCau.btFileExcelClick(Sender: TObject);
begin
  If SaveDialog1.Execute Then
    edFileName.Text := SaveDialog1.FileName;
end;

procedure TWRepCau.chkExcelClick(Sender: TObject);
begin
 edFileName.Enabled  := chkExcel.Checked;
 btFileExcel.Enabled := chkExcel.Checked;
 opPlano.Enabled     := chkExcel.Checked;
 opReporte.Enabled   := chkExcel.Checked;

 If chkExcel.Enabled Then edFileName.Color := clWindow
 Else edFileName.Color := clBtnFace;
end;

procedure TWRepCau.MakeReporte(peBPreview: Boolean);
begin
  m_bPreview := peBPreview;
  MakeReportCreditosInternos;
end;

procedure TWRepCau.btCVE_PRESUPUESTOClick(Sender: TObject);
begin
 With Objeto Do
   CreaBuscador1('INTCRPRE.IT','',0,1, CVE_PRESUPUESTO, DESC_PRESUPUESTO, cbCVE_PRESUPUESTO);
end;

procedure TWRepCau.CreaBuscador1(peStrNomBuscador : String;
                                   peStrCamposBuscador : String;
                                   penResultBusc1, penResultBusc2 : Integer;
                                   peCVE_INTERCAMPO, peDESC_INTERCAMPO : TInterCampo;
                                   peCheckBox : TCheckBox
                                  );
Var vlInterFindit : TInterFindit;
begin
  VlInterFindit := Objeto.CreaBuscador(peStrNomBuscador, peStrCamposBuscador);
  Try
    If vlInterFindit.Execute Then
      Begin
      peCVE_INTERCAMPO.AsString  := vlInterFindit.DameCampo(penResultBusc1);
      peDESC_INTERCAMPO.AsString := vlInterFindit.DameCampo(penResultBusc2);
      peCheckBox.Checked := True;
      End;
  Finally
      vlInterFindit.Free;
  End;
end;


procedure TWRepCau.ilCVE_PRESUPUESTOCapture(Sender: TObject;
  var Show: Boolean);
begin
 Show := True;
end;

procedure TWRepCau.ilCVE_PRESUPUESTOEjecuta(Sender: TObject);
begin
 With Objeto Do
    ObtenDescripcion(  ilCVE_PRESUPUESTO.Buffer,
                       ' SELECT CP.DESC_PRESUPUESTO'+coCRLF+
                       ' FROM  CRE_PRESUPUESTO CP'+coCRLF+
                       ' WHERE CP.CVE_PRESUPUESTO = '+SQLStr(ilCVE_PRESUPUESTO.Buffer),
                       'DESC_PRESUPUESTO',
                       CVE_PRESUPUESTO,
                       DESC_PRESUPUESTO,
                       cbCVE_PRESUPUESTO
                     );
end;

procedure TWRepCau.LimpiaControles(peCheckBox: TCheckBox;
  peCVE_INTERCAMPO, peDESC_INTERCAMPO: TInterCampo);
begin
  If (Not peCheckBox.Checked) Then
    Begin
    peCVE_INTERCAMPO.AsString  := '';
    peDESC_INTERCAMPO.AsString := '';
    End;
end;

procedure TWRepCau.cbCVE_PRESUPUESTOClick(Sender: TObject);
begin
    LimpiaControles(cbCVE_PRESUPUESTO, Objeto.CVE_PRESUPUESTO, Objeto.DESC_PRESUPUESTO);
end;

procedure TWRepCau.ObtenDescripcion(peStrBuffer, peStrSQL, peStrNomCampo: String;
                                      peCVE_INTERCAMPO, peDESC_INTERCAMPO : TInterCampo;
                                      peCheckBox : TCheckBox);
var vlStrCampoResult : String;
begin
  With Objeto Do
    Begin
      GetSQLStr(peStrSQL, Apli.DataBaseName, Apli.SessionName, peStrNomCampo, vlStrCampoResult, False);
      If (Trim(vlStrCampoResult) <> '') Then
         Begin
         peCheckBox.Checked := True;
         peCVE_INTERCAMPO.AsString := Trim(peStrBuffer);
         peDESC_INTERCAMPO.AsString := vlStrCampoResult;
         End
      Else
         Begin
         peCheckBox.Checked := False;
         End;
    End;
end;

end.

