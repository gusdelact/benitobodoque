// Sistema         : Clase de PRGAVENCIMIENTO
// Fecha de Inicio : 11/05/2004
// Función forma   : Clase de PRGAVENCIMIENTO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntPrgavenci;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Grids,
IntProrroga,    //Prorrogas
IntParamCre,   // Objeto de Parametros
IntGenCre     // Funciones Genéricas
;

const
 CO_COL = 0;
 CO_COL_NUM_PERIODO     = CO_COL + 1;
 CO_COL_F_VENCIMIENTO   = CO_COL + 2;
 CO_COL_F_VENC_PRGA     = CO_COL + 3;
 CO_COL_SIT_CAPITAL     = CO_COL + 4;
 CO_COL_IMP_CAPITAL     = CO_COL + 5;

 CO_CORTE = '* * * * * * * * * * * * * * * * *';

Type
 TPrgavenci= class;

  TWPrgavencimiento=Class(TForm)
    InterForma1             : TInterForma;
    Shape25: TShape;
    lblNUM_PERIODO: TLabel;
    Shape1: TShape;
    lblFechaVencimiento: TLabel;
    Shape18: TShape;
    lblF_VENCIMIENTO: TLabel;
    Shape2: TShape;
    lblF_VENC_PRGA: TLabel;
    Shape3: TShape;
    lblSIT_CAPITAL: TLabel;
    Shape4: TShape;
    lblIMP_CAPITAL: TLabel;
    strGrdData: TStringGrid;
    GroupBox4: TGroupBox;
    Label9: TLabel;
    Label12: TLabel;
    edID_CREDITO: TEdit;
    edNUM_PERIODO: TEdit;
    GroupBox2: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    dtpF_VENCIMIENTO: TEdit;
    InterDateTimePicker2: TInterDateTimePicker;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    PnlMsg: TPanel;
    memMessage: TMemo;
    btnAplicar: TButton;
    dtpF_VENC_PRGA_NVO: TDateTimePicker;
    grbxCorrimiento: TGroupBox;
    opAutomatico: TRadioButton;
    opManual: TRadioButton;
    lblCorrimiento: TLabel;
    dtpF_VENC_PRGA: TEdit;
    InterDateTimePicker1: TInterDateTimePicker;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure strGrdDataDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure opManualClick(Sender: TObject);
    procedure lblManualClick(Sender: TObject);
    procedure btnAplicarClick(Sender: TObject);
    procedure dtpF_VENC_PRGAChange(Sender: TObject);
    procedure dtpF_VENC_PRGA_NVOChange(Sender: TObject);
    procedure dtpF_VENC_PRGA_NVODropDown(Sender: TObject);
    procedure dtpF_VENC_PRGA_NVOCloseUp(Sender: TObject);
    procedure dtpF_VENC_PRGA_NVOEnter(Sender: TObject);
    private
    { Private declarations }

     vgbCambio,
     vgbNoHagasNada,
     vgbChange : Boolean;

     procedure Habilita(pbHabilita  : Boolean);
     function Mostrar : Boolean;
     procedure MuestraMensaje(pstrMsg : String; MsgDlgType : TMsgDlgType);
     procedure RealizaProrroga;
    public
    { Public declarations }
    Objeto : TPrgavenci;
end;
 TPrgavenci= class(TInterFrame)
      private

      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ID_CREDITO    : TInterCampo;
        NUM_PERIODO   : TInterCampo;
        F_VENCIMIENTO : TInterCampo;
        F_VENC_PRGA   : TInterCampo;
        CVE_CONCEPTO  : TInterCampo;

        ParamCre      : TParamCre;

        function    InternalBusca : Boolean; override; 
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published 
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TPrgavenci.Create( AOwner : TComponent ); 
begin Inherited;
      ID_CREDITO    :=CreaCampo('ID_CREDITO',ftFloat,tsNinguno,tsNinguno,False);
      NUM_PERIODO   :=CreaCampo('NUM_PERIODO',ftFloat,tsNinguno,tsNinguno,False);
      F_VENCIMIENTO :=CreaCampo('F_VENCIMIENTO',ftDateTime,tsNinguno,tsNinguno,False);
      F_VENC_PRGA   :=CreaCampo('F_VENC_PRGA',ftDateTime,tsNinguno,tsNinguno,False);
      CVE_CONCEPTO  :=CreaCampo('F_VENC_PRGA',ftString,tsNinguno,tsNinguno,False);

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntPrgavenci.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TPrgavenci.Destroy;
begin inherited;
end;

function TPrgavenci.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWPrgavencimiento;
begin
   W:=TWPrgavencimiento.Create(Self);
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


Function TPrgavenci.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('IPrgaven.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA PRGAVENCIMIENTO********************)
(*                                                                              *)
(*  FORMA DE PRGAVENCIMIENTO                                                            *)
(*                                                                              *)
(***********************************************FORMA PRGAVENCIMIENTO********************)

procedure TWPrgavencimiento.FormShow(Sender: TObject);
begin
 With Objeto Do
  Begin
  lbDempresa.Caption := ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := ParamCre.FECHA.AsString;
  lbDUsuario.Caption := ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

  ID_CREDITO.Control    := edID_CREDITO;
  NUM_PERIODO.Control   := edNUM_PERIODO;
  F_VENCIMIENTO.Control := dtpF_VENCIMIENTO;
  F_VENC_PRGA.Control   := dtpF_VENC_PRGA;

  If CVE_CONCEPTO.AsString = 'KA' Then
   lblIMP_CAPITAL.Caption := 'Importe'+coCRLF+'Capital'
  Else
   lblIMP_CAPITAL.Caption := 'Importe'+coCRLF+'Interés';
  End;
 Habilita(False);
end;

procedure TWPrgavencimiento.FormDestroy(Sender: TObject);
begin
 With Objeto Do
  Begin
  ID_CREDITO.Control    := Nil;
  NUM_PERIODO.Control   := Nil;
  F_VENCIMIENTO.Control := Nil;
  End;
end;

procedure TWPrgavencimiento.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWPrgavencimiento.Habilita(pbHabilita  : Boolean);
begin
  lblNUM_PERIODO.Enabled      := pbHabilita;
  lblFechaVencimiento.Enabled := pbHabilita;
  lblF_VENCIMIENTO.Enabled    := pbHabilita;
  lblF_VENC_PRGA.Enabled      := pbHabilita;
  lblSIT_CAPITAL.Enabled      := pbHabilita;
  lblIMP_CAPITAL.Enabled      := pbHabilita;
  grbxCorrimiento.Enabled     := pbHabilita;
  lblCorrimiento.Enabled      := pbHabilita;
  opAutomatico.Enabled        := pbHabilita;
  opManual.Enabled            := pbHabilita;
  If Not (opAutomatico.Enabled) Then
   Begin
   opAutomatico.Checked       := False;
   opManual.Checked           := False;
   opAutomatico.Font.Color    := clGrayText;
   opManual.Font.Color        := clGrayText;
   End
  Else
   Begin
   opAutomatico.Font.Color    := clWindowText;
   opManual.Font.Color        := clWindowText;
   End;
  strGrdData.Enabled          := pbHabilita;
end;

function TWPrgavencimiento.Mostrar : Boolean;
var vlstrSQL, vlstrTableName,
    vlstrSituacion, vlstrImporte : String;
    vlQry : TQuery;
    nRow, vlMin_Num_Periodo : Integer;
begin
 Result := False; nRow := 0;
 Objeto.F_VENC_PRGA.GetFromControl;
 If (Objeto.CVE_CONCEPTO.AsString = 'KA') Then
  Begin
  vlstrTableName := 'CR_CAPITAL';
  vlstrSituacion := 'SIT_CAPITAL';
  vlstrImporte   := 'IMP_CAPITAL';
  End
 Else
  Begin
  vlstrTableName := 'CR_INTERES';
  vlstrSituacion := 'SIT_INTERES';
  vlstrImporte   := 'IMP_INTERES';
  End;

 vlstrSQL := ' SELECT MIN(NUM_PERIODO) AS MIN_NUM_PERIODO FROM '+vlstrTableName+coCRLF+
             ' WHERE ID_CREDITO = '+Objeto.ID_CREDITO.AsString+coCRLF+
             '  AND NUM_PERIODO > '+Objeto.NUM_PERIODO.AsString+coCRLF+
             '  AND F_VENCIMIENTO <= '+SQLFecha(Objeto.F_VENC_PRGA.AsDateTime);
 vlQry := GetSQLQuery(vlstrSQL, Objeto.DataBaseName, Objeto.SessionName, False);
 If Assigned(vlQry) Then
  With vlQry Do
   Begin
     // Obtiene el Primer Periodo Afectado
     vlMin_Num_Periodo := FieldByName('MIN_NUM_PERIODO').AsInteger;
     Close; Free;

     // Si No Afecto Ningún periodo la Nueva Fecha de Prorroga entonces se sale,
     // de lo contrario ...
      If (vlMin_Num_Periodo = 0) Then
       Exit;

       // Si hubo un cambio en la fecha, vuelve a llenar el Grid
      If (vgbCambio) Then
       Begin
           // Obtiene todos los periodos a afectar
           ClearGrid(strGrdData, 0);           
           vlstrSQL := ' SELECT * FROM '+vlstrTableName+coCRLF+
                       ' WHERE ID_CREDITO = '+Objeto.ID_CREDITO.AsString+coCRLF+
                       '   AND NUM_PERIODO >= '+IntToStr(vlMin_Num_Periodo)+coCRLF+
                       ' ORDER BY NUM_PERIODO';

           vlQry := GetSQLQuery(vlstrSQL, Objeto.DataBaseName, Objeto.SessionName, False);
           If Assigned(vlQry) Then
            With vlQry Do
             Try
               strGrdData.RowCount := 9999;
               strGrdData.ColWidths[CO_COL] := 0;

               nRow := 0;
               While Not Eof Do
                Begin
                strGrdData.Cells[CO_COL_NUM_PERIODO, nRow]   := FieldByName('NUM_PERIODO').AsString;
                strGrdData.Cells[CO_COL_F_VENCIMIENTO, nRow] := FieldByName('F_VENCIMIENTO').AsString;
                strGrdData.Cells[CO_COL_SIT_CAPITAL, nRow]   := FieldByName(vlstrSituacion).AsString;
                strGrdData.Cells[CO_COL_IMP_CAPITAL, nRow]   := Format(CFORMAT_DINERO, [FieldByName(vlstrImporte).AsFloat]);
                Inc(nRow);
                Next;
                End;

               Result := nRow > 0;
             Finally
               Close;
               Free;
             End;
      If (nRow = 0) Then strGrdData.RowCount := 1
      Else strGrdData.RowCount := nRow;
      vgbCambio := False;
      End
     Else
      Result := True; 

   End;
end;

procedure TWPrgavencimiento.strGrdDataDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
 With StrGrdData Do
  Begin
  // Le da Formato a las columnas de Importe
  If (ACol = CO_COL_IMP_CAPITAL) Then
   Canvas.TextRect(Rect,Rect.Right - Canvas.TextWidth(Cells[ACol, ARow]),Rect.Top,Cells[ACol, ARow])
  Else
   Canvas.TextRect(Rect,(Rect.Left + Rect.Right - Canvas.TextWidth(Cells[ACol, ARow])) div 2,Rect.Top,Cells[ACol, ARow]);

  If (gdFocused In State) Then
   If (ACol = CO_COL_F_VENC_PRGA) Then
    dtpF_VENC_PRGA_NVO.Top  := Top + Rect.Top;

  End;
end;

procedure TWPrgavencimiento.opManualClick(Sender: TObject);

  procedure AjustaFechasVencimiento;
  var nRow, vlDias : Integer;
      dF_VENCIMIENTO : TDateTime;
  begin
   vlDias := Trunc(Objeto.F_VENC_PRGA.AsDateTime - Objeto.F_VENCIMIENTO.AsDateTime);
   With strGrdData Do
    For nRow := 0 To RowCount - 1 Do
     Begin
     dF_VENCIMIENTO := StrToDate(Cells[CO_COL_F_VENCIMIENTO, nRow]);
     Cells[CO_COL_F_VENC_PRGA, nRow] := DateToStr(dF_VENCIMIENTO + vlDias);
     End;
  end;

  procedure LimpiaFechasVencimiento;
   var nRow : Integer;
  begin
   With strGrdData Do
    For nRow := 0 To RowCount - 1 Do
     Cells[CO_COL_F_VENC_PRGA, nRow] := '';
  end;

  function ExistenCambios : Boolean;
   var nRow : Integer;
  begin
   Result := False;
   With strGrdData Do
    For nRow := 0 To RowCount - 1 Do
     If (Cells[CO_COL_F_VENC_PRGA, nRow] <> '') Then
      Begin
      Result := True;
      Break;
      End;
  end;

begin
  dtpF_VENC_PRGA_NVO.Visible := opManual.Checked;
  
  If vgbNoHagasNada Then
   BeGin
   vgbNoHagasNada := False;
   Exit;
   End;

  If ExistenCambios Then
    Begin
     If (opManual.Checked) Then
      Begin
       If (MessageDlg('Se realizaron cambios de fecha. ¿Desea limpiarlos?.',mtConfirmation,[mbYes,mbNo],0) = mrYes) Then
         LimpiaFechasVencimiento;
      End
     Else
      Begin
        If ( MessageDlg('Se realizaron cambios de fecha. ¿Desea sustituirlos?.',mtConfirmation,[mbYes,mbNo],0) = mrYes) Then
          AjustaFechasVencimiento
        Else
         Begin
          vgbNoHagasNada := True;
          opManual.Checked := True;
         End;
      End;   
  End
 Else If (opAutomatico.Checked) Then
      AjustaFechasVencimiento;
end;

procedure TWPrgavencimiento.lblManualClick(Sender: TObject);
begin
 opManual.Checked := Not opManual.Checked;
end;

procedure TWPrgavencimiento.MuestraMensaje(pstrMsg : String; MsgDlgType : TMsgDlgType);
begin
  MessageDlg(pstrMsg, MsgDlgType, [mbOk], 0);
  memMessage.Lines.Add(CO_CORTE+coCRLF+FormatDateTime('HH:MM:SS AM/PM',Time)+#32+pstrMsg);
end;

procedure TWPrgavencimiento.btnAplicarClick(Sender: TObject);

  function EsValido : Boolean;
  begin
   Result := True;
   Objeto.F_VENC_PRGA.GetFromControl;
   If (Trim(dtpF_VENC_PRGA.Text) = '') Then
    Begin
    MuestraMensaje('Favor de indicar la Nueva Fecha de Prórroga.', mtError);
    Result := False;
    End
   Else If (Objeto.F_VENC_PRGA.AsDateTime <= Objeto.F_VENCIMIENTO.AsDateTime) Then
    Begin
    MuestraMensaje('La Nueva Fecha de Prórroga debe ser mayor'+coCRLF+'a la fecha actual del periodo.', mtError);
    Result := False;
    End;
  end;

  function SonFechasCorrectas(var pstrMensaje : String) : Boolean;
  var nRow, nTempRow : Integer;
      dF_VENCIMIENTO, dF_VENCIMIENTO1 : TDateTime;
  begin
   Result := True; pstrMensaje := '';
   With strGrdData Do
     For nRow := 0 To RowCount - 1 Do
      If (Cells[CO_COL_F_VENC_PRGA, nRow] <> '') Then
       Begin
         nTempRow := nRow - 1;
         If nTempRow < 0 Then
            nTempRow := nRow;

         dF_VENCIMIENTO  := StrToDate(Cells[CO_COL_F_VENC_PRGA, nRow]);
         dF_VENCIMIENTO1 := StrToDate(Cells[CO_COL_F_VENC_PRGA, nTempRow]);

         If (dF_VENCIMIENTO <= Objeto.F_VENC_PRGA.AsDateTime) Then
          Begin
              Row := nRow;
              pstrMensaje := 'La Nueva Fecha de Prórroga '+FormatDateTime(CFORMAT_FECHA, dF_VENCIMIENTO)+
                             ', no puede se menor o igual a la Fecha de Prórroga '+FormatDateTime(CFORMAT_FECHA,
                             Objeto.F_VENC_PRGA.AsDateTime)+'.';
              Result := False;
              Break;
          End
         Else If (dF_VENCIMIENTO <= dF_VENCIMIENTO1)
                 And (nRow <> nTempRow) Then
          Begin                                                    
              Row := nRow;
              pstrMensaje := 'Las Nuevas Fechas de Prórroga se traslapan. Verifique.';
              Result := False;
              Break;
          End;
       End;
  end;

  function CuantosAplicaronCambios : Integer;
  var nRow, nCount : Integer;
  begin
    nCount := 0;
    With strGrdData Do
     For nRow := 0 To RowCount - 1 Do
      If (Cells[CO_COL_F_VENC_PRGA, nRow] <> '') Then
       Inc(nCount);
    Result := nCount;
  end;

var nContador : Integer;
    vlstrMensaje : String;
begin
  // Falta validar que las fechas no se traslapen

  // Si no es válida la fecha de prórroga, entonces sale...
  If Not EsValido Then
   Exit;

  // De lo contrario verifica si se debe hacer algún ajuste de fechas,
  // para mostrar el periodo
  If Mostrar Then
   Begin
   Habilita(True);
   nContador := CuantosAplicaronCambios;
   If (nContador = 0) Then
    Begin
     If Not (opAutomatico.Checked) And Not (opManual.Checked) Then
      MuestraMensaje('La Nueva Fecha de Prórroga, afecta a otros periodos.'+coCRLF+
                     'Indique el tipo de corrimiento a realizar.'+coCRLF, mtInformation)
     Else
      MuestraMensaje('Debe de indicar las fechas de vencimiento...'+coCRLF+
                     'Para poder continuar.', mtWarning)
    End
   Else If (nContador < strGrdData.RowCount - 1) Then
    Begin
    MuestraMensaje('Debe de indicar todas las fechas de vencimiento...'+coCRLF+
                   'Para poder continuar.', mtWarning)
    End
   Else
    Begin
        If Not SonFechasCorrectas(vlstrMensaje) Then
         MuestraMensaje(vlstrMensaje, mtError)
        Else
         RealizaProrroga;
    End;

   End
  Else
   Begin
   Habilita(False);
   RealizaProrroga;
   End;
end;

procedure TWPrgavencimiento.RealizaProrroga;
var StpProrroga : TStoredProc;
    nRow, vlID_GPO_PRGA : Integer;
    vlstrMensaje : String;
begin
 Objeto.F_VENC_PRGA.GetFromControl;

 CreateSTP_PRORROGA(StpProrroga, Objeto.Apli.DatabaseName, Objeto.Apli.SessionName);
 With StpProrroga Do
  Try
    // Prórroga por Fecha de Vencimiento
    // Periodo Prorrogado
    ParamByName('PEID_CREDITO').AsFloat      := Objeto.ID_CREDITO.AsInteger;
    ParamByName('PEID_PERIODO_PRGA').AsFloat := Objeto.NUM_PERIODO.AsInteger;
    ParamByName('PEID_PERIODO').AsFloat      := Objeto.NUM_PERIODO.AsInteger;
    ParamByName('PECVE_PRORROGA').AsString   := 'PROFVE';
    ParamByName('PECVE_CONCEPTO').AsString   := Objeto.CVE_CONCEPTO.AsString;
    ParamByName('PEF_VENC_PRGA').AsDateTime  := Objeto.F_VENC_PRGA.AsDateTime;
    ParamByName('PEF_ALTA').AsDateTime       := Objeto.Apli.DameFechaEmpresa;
    ParamByName('PECVE_USU_ALTA').AsString   := Objeto.Apli.Usuario;
    ParamByName('PEB_COMMIT').AsString       := cFalso;
    ExecProc;
    If (ParamByName('PSRESULTADO').AsFloat <> 0) Then
      Begin
      MuestraMensaje(ParamByName('PSTX_RESULTADO').AsString, mtError);
      Exit;
      End;

    vlID_GPO_PRGA := ParamByName('PESID_GPO_PRGA').AsInteger;
    //Periodos Afectados por el cambio de Fecha de Vencimiento
    For nRow := 0 To strGrdData.RowCount - 1 Do
     Begin
     If (Trim(strGrdData.Cells[CO_COL_F_VENCIMIENTO, nRow]) <> '')Then
       Begin
       ParamByName('PESID_GPO_PRGA').AsInteger := vlID_GPO_PRGA;
       ParamByName('PEID_PERIODO').AsFloat     := StrToInt(strGrdData.Cells[CO_COL_NUM_PERIODO, nRow]);
       ParamByName('PEF_VENC_PRGA').AsDateTime := StrToDate(strGrdData.Cells[CO_COL_F_VENC_PRGA, nRow]);
       ExecProc;
       If (ParamByName('PSRESULTADO').AsFloat <> 0) Then
         Begin
         MuestraMensaje(ParamByName('PSTX_RESULTADO').AsString, mtError);
         Exit;
         End;
       End;
     End;

     RunSQL('COMMIT', Objeto.Apli.SessionName, Objeto.Apli.DatabaseName, False);
     
    If Not ActivaGrupoProrroga(vlID_GPO_PRGA, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, vlstrMensaje) Then
      MuestraMensaje(vlstrMensaje, mtError)
    Else
      Begin
      MuestraMensaje('PRORROGA Realizada', mtInformation);
      InterForma1.Salir;
      End;
  Finally
   Free;
  End;
end;

procedure TWPrgavencimiento.dtpF_VENC_PRGAChange(Sender: TObject);
begin
 vgbCambio := True;
 ClearGrid(strGrdData,0);
 strGrdData.RowCount := 1;
 Habilita(False);
end;

procedure TWPrgavencimiento.dtpF_VENC_PRGA_NVOChange(Sender: TObject);
begin
 vgbChange := True;
end;

procedure TWPrgavencimiento.dtpF_VENC_PRGA_NVODropDown(Sender: TObject);
begin
 vgbChange := False;
end;

procedure TWPrgavencimiento.dtpF_VENC_PRGA_NVOCloseUp(Sender: TObject);
begin
 If vgbChange Then
  With strGrdData Do
   Cells[CO_COL_F_VENC_PRGA,Row] := DateToStr(dtpF_VENC_PRGA_NVO.Date);
end;

procedure TWPrgavencimiento.dtpF_VENC_PRGA_NVOEnter(Sender: TObject);
begin
 With strGrdData Do
  If (Trim(Cells[CO_COL_F_VENC_PRGA,Row]) <> '') Then
   dtpF_VENC_PRGA_NVO.Date := StrToDate(strGrdData.Cells[CO_COL_F_VENC_PRGA,strGrdData.Row])
  Else
   dtpF_VENC_PRGA_NVO.Date := Objeto.Apli.DameFechaEmpresa;  
end;

end.

