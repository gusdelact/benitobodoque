// Sistema         : Clase de CR_CAPTURA_COMISION_BLOQUEO
// Fecha de Inicio : 18¿/12/2008
// Función forma   : Clase de CR_CAPTURA_COMISION_BLOQUEO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrCaCoBl;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Grids, InterEdit,

IntParamCre,
IntCrBlqConc, // Catálogo Bloqueo de Concepto
IntGenCre,
IntLinkit;

const
   CO_COL_CVE_BLQ_CPTO   = 0;
   CO_COL_DESC_BLQ_CPTO  = 1;
   CO_COL_PCT_BLOQUEAR   = 2;
   CO_COL_IMP_BLOQUEAR   = 3;
   CO_COL_ID_BLQ_TRANSAC = 4;


Type
 TCrCaCoBl= class; 

  TWCrCaptComiBloq=Class(TForm)
    InterForma1             : TInterForma;
    StringGrid: TStringGrid;
    lbID_CREDITO: TLabel;
    edID_CREDITO: TEdit;
    edNOM_ACREDITADO: TEdit;
    lblID_CONTRATO_DV: TLabel;
    edID_CONTRATO_DV: TEdit;
    edNOM_TITULAR_DV: TEdit;
    Label3: TLabel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    edSUM_IMP_BLOQUEAR: TInterEdit;
    btnInsert: TButton;
    btnEliminar: TButton;
    Label1: TLabel;
    edIMP_CREDITO: TInterEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Shape1: TShape;
    cbxPCT_BLOQUEAR: TComboBox;
    btnCVE_BLQ_CPTO: TBitBtn;
    btnAplicar: TButton;
    Label8: TLabel;
    memMessages: TMemo;
    btID_CREDITO: TBitBtn;
    ilID_CREDITO: TInterLinkit;
    btID_CONTRATO: TBitBtn;
    ilID_CONTRATO_DV: TInterLinkit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure StringGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure btnInsertClick(Sender: TObject);
    procedure btnCVE_BLQ_CPTOClick(Sender: TObject);
    procedure btnEliminarClick(Sender: TObject);
    procedure StringGridKeyPress(Sender: TObject; var Key: Char);
    procedure cbxPCT_BLOQUEARChange(Sender: TObject);
    procedure StringGridSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure btnAplicarClick(Sender: TObject);
    procedure ilID_CREDITOCapture(Sender: TObject; var Show: Boolean);
    procedure ilID_CREDITOEjecuta(Sender: TObject);
    procedure ilID_CONTRATO_DVEjecuta(Sender: TObject);
    procedure btID_CREDITOClick(Sender: TObject);
    procedure btID_CONTRATOClick(Sender: TObject);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrCaCoBl;

    procedure CreaBuscador1(peStrNomBuscador : String;
                           peStrCamposBuscador : String;
                           penResultBusc1, penResultBusc2 : Integer;
                           peCVE_INTERCAMPO, peDESC_INTERCAMPO : TInterCampo;
                           peCheckBox : TCheckBox
                          );
    procedure ReiniciaGrid;                          
end;
 TCrCaCoBl= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ParamCre                 : TParamCre;

        CrBlqConc : TCrBlqConc;

        ID_CREDITO       : TInterCampo;
        NOM_ACREDITADO   : TInterCampo;
        ID_CONTRATO_DV   : TInterCampo;
        NOM_TITULAR_DV   : TInterCampo;
        IMP_CREDITO      : TInterCampo;
        SUM_IMP_BLOQUEAR : TInterCampo;

        vgmemMessages    : TMemo;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

        procedure ColocaDatosChequera;
        procedure ColocaDatosDiposicion;
        procedure GetDataFromControls;

        function InsTransBloqueo(peCVE_BLQ_CPTO : String; pePCT_BLOQUEADO, peIMP_SALDO : Double;
                                 var psID_BLQ_TRANSAC : Integer) : Boolean;
        function ActivaTransBloqueo(peID_BLQ_TRANSAC : Integer) : Boolean;
      published
      end;

implementation

{$R *.DFM}


constructor TCrCaCoBl.Create( AOwner : TComponent ); 
begin Inherited; 
      ID_CREDITO     := CreaCampo('ID_CREDITO',ftInteger,tsNinguno,tsNinguno,False);
      NOM_ACREDITADO := CreaCampo('NOM_ACREDITADO',ftString,tsNinguno,tsNinguno,False);
      ID_CONTRATO_DV := CreaCampo('ID_CONTRATO_DV',ftInteger,tsNinguno,tsNinguno,False);
      NOM_TITULAR_DV := CreaCampo('NOM_TITULAR_DV',ftString,tsNinguno,tsNinguno,False);
      IMP_CREDITO    := CreaCampo('IMP_CREDITO',ftFloat,tsNinguno,tsNinguno,False);
      SUM_IMP_BLOQUEAR := CreaCampo('SUM_IMP_BLOQUEAR',ftFloat,tsNinguno,tsNinguno,False);

      {$WARNINGS OFF}
      CrBlqConc := TCrBlqConc.Create(Self);
      {$WARNINGS ON}
      CrBlqConc.MasterSource:=Self;
      CrBlqConc.FieldByName('CVE_BLQ_CPTO').MasterField:='CVE_BLQ_CPTO';      

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrCaCoBl.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrCaCoBl.Destroy;
begin
  If Assigned(CrBlqConc) Then CrBlqConc.Free;
  inherited;
end;


function TCrCaCoBl.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCaptComiBloq;
begin
   W:=TWCrCaptComiBloq.Create(Self);
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


Function TCrCaCoBl.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrCaCB.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

(***********************************************FORMA CR_CAPTURA_COMISION_BLOQUEO********************)
(*                                                                              *)
(*  FORMA DE CR_CAPTURA_COMISION_BLOQUEO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_CAPTURA_COMISION_BLOQUEO********************)

procedure TWCrCaptComiBloq.FormShow(Sender: TObject);
begin
  With Objeto Do
    Begin
    lbDempresa.Caption := ParamCre.EMPRESA.AsString;
    lbDfecha.Caption   := ParamCre.FECHA.AsString;
    lbDUsuario.Caption := ParamCre.USUARIO.AsString;
    lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

    ID_CREDITO.Control       := edID_CREDITO;
    NOM_ACREDITADO.Control   := edNOM_ACREDITADO;
    ID_CONTRATO_DV.Control   := edID_CONTRATO_DV;
    NOM_TITULAR_DV.Control   := edNOM_TITULAR_DV;
    IMP_CREDITO.Control      := edIMP_CREDITO;
    SUM_IMP_BLOQUEAR.Control := edSUM_IMP_BLOQUEAR;

//    ID_CREDITO.AsInteger := 4951;  // Prueba
//    ID_CONTRATO_DV.AsInteger := 301000160; // Prueba
    SUM_IMP_BLOQUEAR.AsFloat := 0;

    vgmemMessages := memMessages;

    StringGrid.ColWidths[CO_COL_ID_BLQ_TRANSAC] := 0;

    If (ID_CREDITO.AsInteger <> 0) Then  ColocaDatosDiposicion;
    If (ID_CONTRATO_DV.AsInteger <> 0) Then  ColocaDatosChequera;
    End;
end;

procedure TWCrCaptComiBloq.FormDestroy(Sender: TObject);
begin
  With Objeto Do
    Begin
    ID_CREDITO.Control       := Nil;
    NOM_ACREDITADO.Control   := Nil;
    ID_CONTRATO_DV.Control   := Nil;
    NOM_TITULAR_DV.Control   := Nil;
    IMP_CREDITO.Control      := Nil;
    SUM_IMP_BLOQUEAR.Control := Nil;
    End;
  Inherited;  
end;

procedure TWCrCaptComiBloq.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrCaptComiBloq.StringGridDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  If (gdFocused In State) Then
     Begin
       Case aCol Of
         CO_COL_CVE_BLQ_CPTO : Begin
                               btnCVE_BLQ_CPTO.Height := Rect.Bottom - Rect.Top;
                               btnCVE_BLQ_CPTO.Width  := btnCVE_BLQ_CPTO.Height;
                               btnCVE_BLQ_CPTO.Left   := StringGrid.Left + Rect.Right - btnCVE_BLQ_CPTO.Width + 1;
                               End;

         CO_COL_PCT_BLOQUEAR : Begin
                               cbxPCT_BLOQUEAR.Left   := StringGrid.Left + Rect.Right - cbxPCT_BLOQUEAR.Width + 1;
                               End;
       End;                        
       btnCVE_BLQ_CPTO.Top    := StringGrid.Top  + Rect.Top  + 2;
       cbxPCT_BLOQUEAR.Top    := btnCVE_BLQ_CPTO.Top;
     End;

  With Sender As TStringGrid Do
     Begin
       If (Cells[CO_COL_ID_BLQ_TRANSAC, Row] <> '') Then Canvas.Font.Color := clGreen
       Else Canvas.Font.Color := clBlack;

       Case ACol Of
         CO_COL_IMP_BLOQUEAR : Begin
                               Canvas.TextRect(Rect,Rect.Right - Canvas.TextWidth(Cells[ACol, ARow]) - 3,Rect.Top,Cells[ACol, ARow]);
                               End;

         CO_COL_PCT_BLOQUEAR : Begin
                               If (Cells[ACol, ARow] = 'NA') Then
                                  Canvas.TextRect(Rect,Rect.Left,Rect.Top,Cells[ACol, ARow])
                               Else
                                  Canvas.TextRect(Rect,Rect.Right - Canvas.TextWidth(Cells[ACol, ARow]) - cbxPCT_BLOQUEAR.Width - 3,Rect.Top,Cells[ACol, ARow]);
                               End;
       Else
         Canvas.TextRect(Rect,Rect.Left,Rect.Top,Cells[ACol, ARow]);
       End;
     End;
end;

procedure TWCrCaptComiBloq.btnInsertClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCACOBL_INSER',True,True) then
   begin
      StringGrid.RowCount :=  StringGrid.RowCount + 1;
   end;
end;

procedure TWCrCaptComiBloq.btnCVE_BLQ_CPTOClick(Sender: TObject);
begin
 With Objeto Do
   Begin
   CrBlqConc.ShowAll := True;
   CrBlqConc.BuscaWhereString := ' SIT_BLQ_CONCEPTO = ''AC''';
   If CrBlqConc.Busca Then
      Begin
      StringGrid.Cells[CO_COL_CVE_BLQ_CPTO,  StringGrid.Row] := CrBlqConc.CVE_BLQ_CPTO.AsString;
      StringGrid.Cells[CO_COL_DESC_BLQ_CPTO, StringGrid.Row] := CrBlqConc.DESC_BLQ_CPTO.AsString;
      End;
   End;
end;

procedure TCrCaCoBl.ColocaDatosChequera;
var vlNOM_TITULAR_DV : String;
begin
  If GetSQLStr( ' SELECT P.NOMBRE AS NOM_TITULAR_DV'+coCRLF+
                ' FROM CONTRATO CTO,'+coCRLF+
                '      PERSONA P'+coCRLF+
                ' WHERE CTO.ID_CONTRATO = '+ID_CONTRATO_DV.AsString+coCRLF+
                '   AND P.ID_PERSONA = CTO.ID_TITULAR',
                Apli.DatabaseName, Apli.SessionName, 'NOM_TITULAR_DV', vlNOM_TITULAR_DV, True) Then
     NOM_TITULAR_DV.AsString := vlNOM_TITULAR_DV
  Else
     NOM_TITULAR_DV.AsString := '';
end;

procedure TCrCaCoBl.ColocaDatosDiposicion;
Var vlQry : TQuery;
begin
  vlQry := GetSQLQueryNoNil(  ' SELECT P.NOMBRE AS NOM_ACREDITADO, CC.IMP_CREDITO'+coCRLF+
                              ' FROM ('+coCRLF+
                              '         SELECT CC.ID_CREDITO, CC.ID_CONTRATO, CC.IMP_CREDITO'+coCRLF+
                              '         FROM CR_CREDITO CC'+coCRLF+
                              '         WHERE CC.ID_CREDITO = '+ID_CREDITO.AsString+coCRLF+
                              '           AND CC.SIT_CREDITO <> ''CA'''+coCRLF+
                              '       UNION'+coCRLF+
                              '         SELECT CC.ID_CREDITO, CC.ID_CONTRATO, CC.IMP_CREDITO'+coCRLF+
                              '         FROM CRE_CREDITO CC'+coCRLF+
                              '         WHERE CC.ID_CREDITO = '+ID_CREDITO.AsString+coCRLF+
                              '           AND CC.SIT_CREDITO NOT IN (''TA'',''CA'')'+coCRLF+
                              '       ) CC,'+coCRLF+
                              '       CONTRATO CTO,'+coCRLF+
                              '       PERSONA P'+coCRLF+
                              ' WHERE CTO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
                              '   AND P.ID_PERSONA = CTO.ID_TITULAR',
                              Apli.DatabaseName, Apli.SessionName, True);

  If Not Assigned(vlQry) Then
    Begin
    NOM_ACREDITADO.AsString := '';
    IMP_CREDITO.AsFloat     := 0;
    End
  Else
    With vlQry Do
      Try
        NOM_ACREDITADO.AsString := FieldByName('NOM_ACREDITADO').AsString;
        IMP_CREDITO.AsFloat     := FieldByName('IMP_CREDITO').AsFloat;
      Finally
        vlQry.Close;
        vlQry.Free;
      End;
end;

procedure TCrCaCoBl.GetDataFromControls;
begin
  ID_CREDITO.GetFromControl;
  NOM_ACREDITADO.GetFromControl;
  ID_CONTRATO_DV.GetFromControl;
  NOM_TITULAR_DV.GetFromControl;
  IMP_CREDITO.GetFromControl;
  SUM_IMP_BLOQUEAR.GetFromControl;
end;

procedure TWCrCaptComiBloq.btnEliminarClick(Sender: TObject);
var vlCol, vlRow : Integer;
begin
   if Objeto.ValidaAccesoEsp('TCRCACOBL_ELIM',True,True) then
   begin
      With StringGrid Do
      Begin
      If ((Row + 1) <= RowCount) Then
         Begin
           // Copia los datos
           For vlRow := Row To RowCount - 1 Do
             For vlCol := 0 To ColCount - 1 Do
               Cells[vlCol, vlRow] := Cells[vlCol, vlRow + 1];

         vlRow := RowCount - 1;
         RowCount := RowCount - 1; // Disminuye en 1 renglon

         btnCVE_BLQ_CPTO.Top := btnCVE_BLQ_CPTO.Top - btnCVE_BLQ_CPTO.Height;
         cbxPCT_BLOQUEAR.Top := btnCVE_BLQ_CPTO.Top;
         End
      Else
         Begin
         vlRow := Row;
         End;

      // Limpia datos del renglón
      For vlCol := 0 To ColCount - 1 Do
          Cells[vlCol, vlRow  + 1] := '';

      StringGrid.Repaint;
      End;
   end;
end;

procedure TWCrCaptComiBloq.StringGridKeyPress(Sender: TObject;
  var Key: Char);
begin
 With StringGrid Do
    If ((Col = CO_COL_CVE_BLQ_CPTO) Or (StringGrid.Col = CO_COL_DESC_BLQ_CPTO)) Then
      Begin
      Key := #0;
      End
    Else
      Begin
      If (Pos(Key,'0123456789.'#8) = 0) Then Key := #0;
      End;
end;

procedure TWCrCaptComiBloq.cbxPCT_BLOQUEARChange(Sender: TObject);
begin
  StringGrid.Cells[CO_COL_PCT_BLOQUEAR,  StringGrid.Row] := cbxPCT_BLOQUEAR.Text;
end;

procedure TWCrCaptComiBloq.StringGridSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
var vlRow : Integer;
    vlIMP_BLOQUEAR, vlSUM_IMP_BLOQUEAR : Double;
    vlStrValue : String;
begin
  vlStrValue := TrimChar(Value,','#32);
  With StringGrid Do
    If (vlStrValue <> '') Then
      Begin
      If (ACol = CO_COL_PCT_BLOQUEAR) And (vlStrValue <> 'NA') Then
        Try
          vlIMP_BLOQUEAR := StrToFloat(vlStrValue) * Objeto.IMP_CREDITO.AsFloat;
          Cells[CO_COL_IMP_BLOQUEAR, Row] := Format(CFORMAT_DINERO, [vlIMP_BLOQUEAR]);
        Finally
        End;

      If ((ACol = CO_COL_PCT_BLOQUEAR) Or (ACol = CO_COL_IMP_BLOQUEAR))  Then
        Try
          vlSUM_IMP_BLOQUEAR := 0;
          For vlRow := 0 To RowCount - 1 Do
            Begin
            vlStrValue := TrimChar(Cells[CO_COL_IMP_BLOQUEAR, vlRow], ','#32);
            If (vlStrValue <> '') Then
              vlSUM_IMP_BLOQUEAR := vlSUM_IMP_BLOQUEAR + StrToFloat(vlStrValue);
            End;
          Objeto.SUM_IMP_BLOQUEAR.AsFloat := vlSUM_IMP_BLOQUEAR;
        Finally
        End;
      End;
end;

function TCrCaCoBl.InsTransBloqueo(peCVE_BLQ_CPTO : String; pePCT_BLOQUEADO, peIMP_SALDO : Double;
                                   var psID_BLQ_TRANSAC : Integer) : Boolean;
var vlStp : TStoredProc;
begin
  Result := False; psID_BLQ_TRANSAC := 0;
  vlStp := TStoredProc.Create(Nil);
  With vlStp Do
     Try
       //Inicia el SPT
       vlStp.DatabaseName := Apli.DatabaseName;
       vlStp.SessionName  := Apli.SessionName;
       StoredProcName:= 'PKGCRGTIA.STP_INS_TRANS_BLOQUEO';

       Params.Clear;
       Params.CreateParam( ftInteger ,'peID_CREDITO',        ptInput);
       Params.CreateParam( ftInteger ,'peID_CONTRATO_DV',    ptInput);
       Params.CreateParam( ftString  ,'peCVE_BLQ_CPTO',      ptInput);
       Params.CreateParam( ftString  ,'peCVE_BLQ_OPERACION', ptInput);
       Params.CreateParam( ftFloat   ,'peIMP_SALDO',         ptInput);
       Params.CreateParam( ftFloat   ,'pePCT_BLOQUEADO',     ptInput);
       Params.CreateParam( ftString  ,'peCVE_USU_ALTA',      ptInput);
       Params.CreateParam( ftString  ,'peTX_MOTIVO',         ptInput);
       Params.CreateParam( ftString  ,'peB_COMMIT',          ptInput);
       Params.CreateParam( ftInteger ,'psID_BLQ_TRANSAC',    ptOutput);
       Params.CreateParam( ftInteger ,'psRESULTADO',         ptOutput);
       Params.CreateParam( ftString  ,'psTX_RESULTADO',      ptOutput);

       // Asigna los valores
       ParamByName('peID_CREDITO').AsInteger       := ID_CREDITO.AsInteger;
       ParamByName('peID_CONTRATO_DV').AsInteger   := ID_CONTRATO_DV.AsInteger;
       ParamByName('peCVE_BLQ_CPTO').AsString      := peCVE_BLQ_CPTO;
       ParamByName('peCVE_BLQ_OPERACION').AsString := 'DGTIAC';
       ParamByName('peIMP_SALDO').AsFloat          := peIMP_SALDO;
       ParamByName('pePCT_BLOQUEADO').AsFloat      := pePCT_BLOQUEADO;
       ParamByName('peCVE_USU_ALTA').AsString      := DameUsuario;
       ParamByName('peTX_MOTIVO').AsString         := 'Bloqueo de Concepto desde la disposición.';
       ParamByName('peB_COMMIT').AsString          := 'V';

       ExecProc;
       If (ParamByName('psRESULTADO').AsInteger = 0) Then
         Begin
         psID_BLQ_TRANSAC := ParamByName('psID_BLQ_TRANSAC').AsInteger;
         Result := True;
         End
       Else
         Begin
         MessageDlg(ParamByName('psTX_RESULTADO').AsString, mtError, [mbOk], 0);
         vgmemMessages.Lines.Add(ParamByName('psTX_RESULTADO').AsString);
         End;

     Finally
       Free;
     End;
end;

function TCrCaCoBl.ActivaTransBloqueo(peID_BLQ_TRANSAC : Integer) : Boolean;
var vlStp : TStoredProc;
begin
  Result := False;
  vlStp := TStoredProc.Create(Nil);
  With vlStp Do
     Try
       //Inicia el SPT
       vlStp.DatabaseName := Apli.DatabaseName;
       vlStp.SessionName  := Apli.SessionName;
       StoredProcName:= 'PKGCRGTIA.STP_ACTIVA_TRANS_BLOQUEO';

       Params.Clear;
       Params.CreateParam( ftInteger ,'peID_BLQ_TRANSAC',    ptInput);
       Params.CreateParam( ftString  ,'peCVE_USU_ACTIVACION',  ptInput);
       Params.CreateParam( ftString  ,'peB_COMMIT',          ptInput);
       Params.CreateParam( ftInteger ,'psRESULTADO',         ptOutput);
       Params.CreateParam( ftString  ,'psTX_RESULTADO',      ptOutput);

       // Asigna los valores
       ParamByName('peID_BLQ_TRANSAC').AsInteger     := peID_BLQ_TRANSAC;
       ParamByName('peCVE_USU_ACTIVACION').AsString  := DameUsuario;
       ParamByName('peB_COMMIT').AsString            := 'V';

       ExecProc;
       If (ParamByName('psRESULTADO').AsInteger = 0) Then
         Begin
         Result := True;
         End
       Else
         Begin
         MessageDlg(ParamByName('psTX_RESULTADO').AsString, mtError, [mbOk], 0);
         vgmemMessages.Lines.Add(ParamByName('psTX_RESULTADO').AsString);         
         End;

     Finally
       Free;
     End;
End;

procedure TWCrCaptComiBloq.btnAplicarClick(Sender: TObject);
var vlID_BLQ_TRANSAC, vlRow : Integer;
    vlPCT_BLOQUEAR, vlIMP_BLOQUEAR : Double;
    vlCVE_BLQ_CPTO : String;
    vlstrMessage : String;
    vlbContinua : Boolean;
begin
   if Objeto.ValidaAccesoEsp('TCRCACOBL_APLICA',True,True) then
   begin
      //--------------------------------------
      // Inicia Validación de Captura de Datos
      vlbContinua := False;

      With Objeto Do
        Begin
        GetDataFromControls;
        vlstrMessage := '';
        If (Trim(NOM_ACREDITADO.AsString) = '') Then vlstrMessage := 'un '+lbID_CREDITO.Caption
        Else If (Trim(NOM_TITULAR_DV.AsString) = '') Then vlstrMessage := 'la '+lblID_CONTRATO_DV.Caption
        Else If (SUM_IMP_BLOQUEAR.AsFloat = 0) Then vlstrMessage := 'los conceptos y sus montos a comprometer';

        If (vlstrMessage <> '') Then
           Begin
           MessageDlg('Favor de indicar '+vlstrMessage+'.', mtWarning, [mbOk], 0);
           Exit;
           End;
        End;

      // Inicia validación de conceptos
      With StringGrid Do
        For vlRow := 0 To RowCount - 1 Do
          Try
            vlCVE_BLQ_CPTO  := Trim(Cells[CO_COL_CVE_BLQ_CPTO, vlRow]);
            vlIMP_BLOQUEAR  := StrToFloat(TrimChar(Cells[CO_COL_IMP_BLOQUEAR, vlRow],','#32));

            If ((vlCVE_BLQ_CPTO = '') Or (vlIMP_BLOQUEAR = 0)) Then
              Continue; // Se salta el renglón

            vlstrMessage := '';
            If (vlCVE_BLQ_CPTO = '') Then
               Begin
               vlstrMessage :=  'la "Clave de Concepto"';
               End
            Else If (vlIMP_BLOQUEAR = 0) Then
               Begin
               vlstrMessage :=  'el "Importe a Comprometer"';
               End;

            If (vlstrMessage <> '') Then
               Begin
               vlstrMessage := 'Favor de Indicar' +vlstrMessage+' del renglón'+IntToStr(vlRow+1);
               MessageDlg(vlstrMessage, mtWarning, [mbOk], 0);
               memMessages.Lines.Add(vlstrMessage);
               Exit;
               End;
          Finally
          End;

      // Inicia procesamiento de Datos
      With StringGrid Do
        For vlRow := 0 To RowCount - 1 Do
         Begin
         vlbContinua := False;
         // Obtiene los Datos del Primer renglón
         vlCVE_BLQ_CPTO  := Cells[CO_COL_CVE_BLQ_CPTO, vlRow];
         vlIMP_BLOQUEAR  := StrToFloat(TrimChar(Cells[CO_COL_IMP_BLOQUEAR, vlRow],','#32));

         // Si no has sido procesada la orden, entonces...
         If (Cells[CO_COL_ID_BLQ_TRANSAC, vlRow] <> '') Then
            Begin
            vlstrMessage := 'La clave de concepto "'+vlCVE_BLQ_CPTO+'" con importe a comprometer de '+
                             Format(CFORMAT_DINERO,[vlIMP_BLOQUEAR])+' ya fue anteriormentr aplicada.';
            MessageDlg(vlstrMessage, mtWarning, [mbOk], 0);
            memMessages.Lines.Add(vlstrMessage);
            vlbContinua := True;
            End
         Else
            Begin
            If (Cells[CO_COL_PCT_BLOQUEAR, vlRow]) = 'NA' Then
              vlPCT_BLOQUEAR  := 0
            Else
              vlPCT_BLOQUEAR  := StrToFloat(TrimChar(Cells[CO_COL_PCT_BLOQUEAR, vlRow],','#32));


            If ((vlCVE_BLQ_CPTO = '') Or (vlIMP_BLOQUEAR = 0)) Then
              Continue; // Se salta el renglón

            // Genera las transacciones de Bloqueo
            If Objeto.InsTransBloqueo(vlCVE_BLQ_CPTO, vlPCT_BLOQUEAR, vlIMP_BLOQUEAR, vlID_BLQ_TRANSAC) Then
               If Objeto.ActivaTransBloqueo(vlID_BLQ_TRANSAC) Then
                  Begin
                  // Coloca el Id en la columna, como si estuviera procesada
                  Cells[CO_COL_ID_BLQ_TRANSAC, vlRow] := IntToStr(vlID_BLQ_TRANSAC);
                  vlbContinua := True;
                  End;
            End;

            If Not vlbContinua Then
              Begin
              vlstrMessage := 'Hubo errores en la aplicación de Bloqueos. Favor de revisar los mensajes';
              MessageDlg(vlstrMessage, mtError, [mbOk], 0);
              memMessages.Lines.Add(vlstrMessage);
              If memMessages.CanFocus Then memMessages.SetFocus;
              Break;
              End
         End; // For vlRow := 0 To RowCount - 1 Do

         If (vlbContinua) Then
              Begin
              vlstrMessage := 'Se aplicaron todos los bloqueos señalados.';
              MessageDlg(vlstrMessage, mtInformation, [mbOk], 0);
              memMessages.Lines.Add(vlstrMessage);
              End;
   end;
end;

procedure TWCrCaptComiBloq.ilID_CREDITOCapture(Sender: TObject;
  var Show: Boolean);
begin
  Show := True;
end;

procedure TWCrCaptComiBloq.ilID_CREDITOEjecuta(Sender: TObject);
begin
  With Objeto Do
    Try
      ID_CREDITO.AsInteger := StrToInt(ilID_CREDITO.Buffer);
      ColocaDatosDiposicion;
    Except
      ID_CREDITO.AsInteger := 0;
    End;
end;

procedure TWCrCaptComiBloq.ilID_CONTRATO_DVEjecuta(Sender: TObject);
begin
  With Objeto Do
    Try
      ReiniciaGrid;
      ID_CONTRATO_DV.AsInteger := StrToInt(ilID_CONTRATO_DV.Buffer);
      ColocaDatosChequera;
    Except
      ID_CONTRATO_DV.AsInteger := 0;
    End;
end;

procedure TWCrCaptComiBloq.CreaBuscador1(peStrNomBuscador : String;
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
      If Assigned(peCheckBox) Then peCheckBox.Checked := True;
      End;
  Finally
      vlInterFindit.Free;
  End;
end;

procedure TWCrCaptComiBloq.btID_CREDITOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCACOBL_DISP',True,True) then
   begin
     With Objeto Do
       CreaBuscador1('CONSDISP.IT','',0,3, ID_CREDITO, NOM_ACREDITADO, Nil);
   end;
end;

procedure TWCrCaptComiBloq.ReiniciaGrid;
begin
  ClearGrid(StringGrid,0);
  btnCVE_BLQ_CPTO.Top := 112;
  cbxPCT_BLOQUEAR.Top := btnCVE_BLQ_CPTO.Top;
  StringGrid.RowCount := 1;
end;

procedure TWCrCaptComiBloq.btID_CONTRATOClick(Sender: TObject);
var vlID_CONTRATO_DV_ANT : Integer;
begin
   if Objeto.ValidaAccesoEsp('TCRCACOBL_CHEQ',True,True) then
   begin
     With Objeto Do
     Begin
     vlID_CONTRATO_DV_ANT := ID_CONTRATO_DV.AsInteger;
     CreaBuscador1('CONSCHEQ.IT','S,S',0,2,ID_CONTRATO_DV, NOM_TITULAR_DV, Nil);
     If (vlID_CONTRATO_DV_ANT <> ID_CONTRATO_DV.AsInteger) Then
        Begin
        ReiniciaGrid;
        End;
     End;
   end;
end;

end.
