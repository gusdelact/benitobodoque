// Sistema         : Clase de PRGAAJUSTE
// Fecha de Inicio : 11/05/2004
// Función forma   : Clase de PRGAAJUSTE
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntPrgaajust;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Grids, InterEdit, ImgList,
IntProrroga,    //Prorrogas
IntGenCre,     // Funciones Genéricas
IntParamCre    // Objeto de Parametros
;

const
 CO_COL = 0;
 CO_COL_NUM_PERIODO     = CO_COL;
 CO_COL_ESTADO          = CO_COL + 1;
 CO_COL_F_VENCIMIENTO   = CO_COL + 2;
 CO_COL_SIT_CAPITAL     = CO_COL + 3;
 CO_COL_IMP_CAPITAL     = CO_COL + 4;
 CO_COL_IMP_CAPITAL_NVO = CO_COL + 5;
 CO_COL_PRORRATEAR      = CO_COL + 6;

 CO_NO_PRORRATEADO = '0';
 CO_SI_PRORRATEADO = '1';
 CO_NO_PRORRATEAR  = '2';

 CO_EN_PRORROGA = 'En Prorroga';
 CO_CORTE = '* * * * * * * * * * * * * * * * *';

Type
 TPrgaajust= class;

  TWPrgaajuste=Class(TForm)
    InterForma1             : TInterForma;
    GroupBox1: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    edIMP_CAPITAL_NVO: TInterEdit;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label19: TLabel;
    Shape5: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    Label23: TLabel;
    Shape10: TShape;
    Label24: TLabel;
    Label25: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Shape6: TShape;
    Label22: TLabel;
    strGrdData: TStringGrid;
    GroupBox4: TGroupBox;
    Label9: TLabel;
    Label12: TLabel;
    edID_CREDITO: TEdit;
    edNUM_PERIODO: TEdit;
    ImgList: TImageList;
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
    edIMP_CAPITAL: TInterEdit;
    edIMP_DIFERENCIA: TInterEdit;
    memMessage: TMemo;
    btnAplicar: TButton;
    Shape1: TShape;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure strGrdDataDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure edIMP_CAPITAL_NVOExit(Sender: TObject);
    procedure strGrdDataKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strGrdDataMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnAplicarClick(Sender: TObject);
    private
    { Private declarations }
     function Get_Mensaje : String;
     procedure Set_Mensaje(pstrValue : String);

     procedure Mostrar;
     procedure Recalcula;
     procedure InvertCheck(StrGrd: TStringGrid; nCol, nRow: Integer);
     procedure MuestraMensaje(pstrMsg : String; MsgDlgType : TMsgDlgType);
    public
    { Public declarations }
    Objeto : TPrgaajust;
     property Mensaje : String Read Get_Mensaje Write Set_Mensaje;

end;
 TPrgaajust= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ID_CREDITO       : TInterCampo;
        NUM_PERIODO      : TInterCampo;
        IMP_CAPITAL      : TInterCampo;
        IMP_CAPITAL_NVO  : TInterCampo;
        IMP_DIFERENCIA   : TInterCampo;

        ParamCre         : TParamCre;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;


implementation
//Uses RepMon;

{$R *.DFM}

constructor TPrgaajust.Create( AOwner : TComponent );
begin Inherited;
      ID_CREDITO  :=CreaCampo('ID_CREDITO',ftFloat,tsNinguno,tsNinguno,False);
      NUM_PERIODO :=CreaCampo('NUM_PERIODO',ftFloat,tsNinguno,tsNinguno,False);
      IMP_CAPITAL :=CreaCampo('IMP_CAPITAL',ftFloat,tsNinguno,tsNinguno,False);
      IMP_CAPITAL_NVO :=CreaCampo('IMP_CAPITAL_NVO',ftFloat,tsNinguno,tsNinguno,False);
      IMP_DIFERENCIA :=CreaCampo('IMP_DIFERENCIA',ftFloat,tsNinguno,tsNinguno,False);

      StpName  := ' ';
      UseQuery := False; 
      HelpFile := 'IntPrgaajust.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TPrgaajust.Destroy;
begin inherited;
end;


function TPrgaajust.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWPrgaajuste;
begin
   W:=TWPrgaajuste.Create(Self);
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


Function TPrgaajust.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('IPrgaaju.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

(***********************************************FORMA PRGAAJUSTE********************)
(*                                                                              *)
(*  FORMA DE PRGAAJUSTE                                                            *)
(*                                                                              *)
(***********************************************FORMA PRGAAJUSTE********************)

procedure TWPrgaajuste.FormShow(Sender: TObject);
begin
 With Objeto Do
  Begin
  lbDempresa.Caption := ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := ParamCre.FECHA.AsString;
  lbDUsuario.Caption := ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

  ID_CREDITO.Control := edID_CREDITO;
  NUM_PERIODO.Control := edNUM_PERIODO;
  IMP_CAPITAL.Control := edIMP_CAPITAL;
  IMP_CAPITAL_NVO.Control := edIMP_CAPITAL_NVO;
  IMP_DIFERENCIA.Control := edIMP_DIFERENCIA;
  End;
end;

procedure TWPrgaajuste.FormDestroy(Sender: TObject);
begin
 With Objeto Do
  Begin
  ID_CREDITO.Control := Nil;
  NUM_PERIODO.Control := Nil;
  IMP_CAPITAL.Control := Nil;
  IMP_CAPITAL_NVO.Control := Nil;
  IMP_DIFERENCIA.Control := Nil;
  End;
end;

procedure TWPrgaajuste.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWPrgaajuste.Mostrar;
var vlstrSQL : String;
    vlQry : TQuery;
    nRow : Integer;
begin
 vlstrSQL := ' SELECT * FROM CR_CAPITAL '+coCRLF+
             ' WHERE ID_CREDITO = '+Objeto.ID_CREDITO.AsString+
             ' ORDER BY NUM_PERIODO';

 vlQry := GetSQLQuery(vlstrSQL, Objeto.DataBaseName, Objeto.SessionName, False);
 If Assigned(vlQry) Then
  With vlQry Do
   Try
     ClearGrid(strGrdData, 0);
     strGrdData.RowCount := 9999;

     nRow := 0;
     While Not Eof Do
      Begin
      strGrdData.Cells[CO_COL_NUM_PERIODO  , nRow] := FieldByName('NUM_PERIODO').AsString;

      If (FieldByName('NUM_PERIODO').AsInteger = Objeto.NUM_PERIODO.AsInteger) Then
        strGrdData.Cells[CO_COL_ESTADO, nRow] := CO_EN_PRORROGA;

      strGrdData.Cells[CO_COL_F_VENCIMIENTO, nRow] := FieldByName('F_VENCIMIENTO').AsString;
      strGrdData.Cells[CO_COL_SIT_CAPITAL  , nRow] := FieldByName('SIT_CAPITAL').AsString;
      strGrdData.Cells[CO_COL_IMP_CAPITAL  , nRow] := Format(CFORMAT_DINERO, [FieldByName('IMP_CAPITAL').AsFloat]);

      If (FieldByName('SIT_CAPITAL').AsString = CSIT_PA) And
          ( FieldByName('NUM_PERIODO').AsInteger > Objeto.NUM_PERIODO.AsInteger) Then
          strGrdData.Cells[CO_COL_PRORRATEAR, nRow] := CO_NO_PRORRATEADO
      Else
          strGrdData.Cells[CO_COL_PRORRATEAR, nRow] := CO_NO_PRORRATEAR;

      Inc(nRow);
      Next;
      End;

     If (nRow = 0) Then strGrdData.RowCount := 1
     Else strGrdData.RowCount := nRow;

   Finally
     Close;
     Free;
   End;
end;

procedure TWPrgaajuste.strGrdDataDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var Bmp : TBitmap;
    vlstr : String;
begin
  With strGrdData Do
    Begin
      vlstr := Trim(Cells[CO_COL_PRORRATEAR,ARow]);

      // Le cambia el color
      If (vlstr = CO_NO_PRORRATEAR) Then Canvas.Font.Color := clGray
      Else Canvas.Font.Color := clBlack;
      If (gdSelected In State) Then Canvas.Font.Color := clWhite;

      // Le da Formato a las columans de Importe
      If (ACol = CO_COL_IMP_CAPITAL_NVO) Or (ACol = CO_COL_IMP_CAPITAL) Then
       Canvas.TextRect(Rect,Rect.Right - Canvas.TextWidth(Cells[ACol, ARow]),Rect.Top,Cells[ACol, ARow])
      Else
       Canvas.TextRect(Rect,(Rect.Left + Rect.Right - Canvas.TextWidth(Cells[ACol, ARow])) div 2,Rect.Top,Cells[ACol, ARow]);

      // Muestra el CheckBox en la Columa de Prorrateo
      If (ACol = CO_COL_PRORRATEAR) Then
        Begin
        Bmp := TBitmap.Create;
        If Assigned(Bmp) Then
          Begin
          If (vlstr = CO_SI_PRORRATEADO) Then ImgList.GetBitmap(1,Bmp)
          Else If (vlstr = CO_NO_PRORRATEADO) Then ImgList.GetBitmap(0,Bmp)
          Else ImgList.GetBitmap(2,Bmp);
          Canvas.Draw(Rect.Left,Rect.Top,Bmp);
          Bmp.FreeImage;
          Bmp.Free;
          End;
        End;

     End;
end;

function TWPrgaajuste.Get_Mensaje : String;
begin
 Result := PnlMsg.Caption;
end;

procedure TWPrgaajuste.Set_Mensaje(pstrValue : String);
begin
 With PnlMsg Do
  Begin
  If (Trim(pstrValue) <> '') Then
   Begin
   Color := clRed;
   Font.Color := clWhite;
   End
  Else
   Begin
   Color := clBtnFace;
   Font.Color := clBlack;
   End;
  Caption := pstrValue;
  End;
end;

procedure TWPrgaajuste.InvertCheck(StrGrd: TStringGrid; nCol,
  nRow: Integer);
var vlstr, vlstrBool : String;
begin
 With StrGrd Do
  Begin
   vlstr := Cells[nCol,nRow];
   If (vlstr <> CO_NO_PRORRATEAR) Then
     Begin
     If (vlstr = CO_SI_PRORRATEADO) Then vlstrBool := CO_NO_PRORRATEADO
     Else vlstrBool := CO_SI_PRORRATEADO;
     Cells[nCol,nRow] := vlstrBool;
     End;
  Recalcula;
  End;
end;

procedure TWPrgaajuste.MuestraMensaje(pstrMsg : String; MsgDlgType : TMsgDlgType);
begin
  MessageDlg(pstrMsg, MsgDlgType, [mbOk], 0);
  memMessage.Lines.Add(CO_CORTE+coCRLF+FormatDateTime('HH:MM:SS AM/PM',Time)+#32+pstrMsg);
end;

procedure TWPrgaajuste.edIMP_CAPITAL_NVOExit(Sender: TObject);
begin
 With Objeto Do
  Begin
  IMP_CAPITAL_NVO.GetFromControl;
  Mensaje := '';
  If (IMP_CAPITAL_NVO.AsFloat > IMP_CAPITAL.AsFloat) Then
    Mensaje := 'El "Nuevo Importe", no debe ser mayor al "Importe de Capital".'
  Else If (IMP_CAPITAL_NVO.AsFloat = IMP_CAPITAL.AsFloat) Then
    Mensaje := 'El "Nuevo Importe", no debe ser igual al "Importe de Capital".'
  Else If (IMP_CAPITAL_NVO.AsFloat = 0) Then
    Mensaje := 'Favor de indicar el "Nuevo Importe".';
  IMP_DIFERENCIA.AsFloat := IMP_CAPITAL.AsFloat - IMP_CAPITAL_NVO.AsFloat;

  strGrdData.TabStop := Mensaje = '';
  btnAplicar.TabStop := strGrdData.TabStop;
  memMessage.TabStop := strGrdData.TabStop;

  If (strGrdData.TabStop) Then
   Begin
   Mostrar;
   Recalcula;
   End
  Else
   Begin
   ClearGrid(StrGrdData, 0);   
   StrGrdData.RowCount := 1;
   End;

  End;
end;

procedure TWPrgaajuste.Recalcula;
var nRow, vlnProrrateo, vlnUltimoPdoProrrateo, vlNUM_PERIODO : Integer;
    vldProrrateo, vldDifProrrateo, vlIMP_CAPITAL, vlIMP_CAPITAL_NVO : Double;
    str : String;
begin
 vlnProrrateo := 0; vlnUltimoPdoProrrateo := -1;
 With strGrdData Do
  Begin

  For nRow := 0 To RowCount - 1 Do
   If (Cells[CO_COL_PRORRATEAR, nRow] = CO_SI_PRORRATEADO) Then
     Begin
     vlnUltimoPdoProrrateo := nRow;
     Inc(vlnProrrateo);
     End;

  If (vlnProrrateo > 0) Then
   Begin
   vldProrrateo    := StrToFloat(Format('%8.2f',[Objeto.IMP_DIFERENCIA.AsFloat / vlnProrrateo]));
   vldDifProrrateo := Objeto.IMP_DIFERENCIA.AsFloat - (vldProrrateo * (vlnProrrateo - 1));
   End
  Else
   Begin
   vldProrrateo    := 0;
   vldDifProrrateo := 0;
   end;

  For nRow := 0 To RowCount - 1 Do
   Begin
       vlNUM_PERIODO := StrToInt(Cells[CO_COL_NUM_PERIODO, nRow]);

       If (Cells[CO_COL_PRORRATEAR, nRow] = CO_SI_PRORRATEADO)
            Or (vlNUM_PERIODO = Objeto.NUM_PERIODO.AsInteger) Then
         Begin
            vlIMP_CAPITAL := StrToFloat(TrimChar(Cells[CO_COL_IMP_CAPITAL, nRow], ','#32 ));
            If (vlNUM_PERIODO = Objeto.NUM_PERIODO.AsInteger) Then
               vlIMP_CAPITAL_NVO := Objeto.IMP_CAPITAL_NVO.AsInteger
            Else If (nRow = vlnUltimoPdoProrrateo) Then
               vlIMP_CAPITAL_NVO := vlIMP_CAPITAL + vldDifProrrateo
            Else
               vlIMP_CAPITAL_NVO := vlIMP_CAPITAL + vldProrrateo;
            str := Format(CFORMAT_DINERO, [vlIMP_CAPITAL_NVO]);
         End
       Else
         str := '';
       Cells[CO_COL_IMP_CAPITAL_NVO, nRow] := str;
   End;
  End;
end;

procedure TWPrgaajuste.strGrdDataKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 Case Key Of
  32 : InvertCheck(strGrdData,CO_COL_PRORRATEAR,strGrdData.Row);
 End;
end;

procedure TWPrgaajuste.strGrdDataMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var nCol, nRow : Integer;
begin
 With strGrdData Do
  Begin
  MouseToCell(X,Y,nCol, nRow);
  If (nCol = CO_COL_PRORRATEAR) Then
   InvertCheck(strGrdData, CO_COL_PRORRATEAR, nRow);
  End;
end;

procedure TWPrgaajuste.btnAplicarClick(Sender: TObject);

  function EsValido : Boolean;
  var nRow : Integer;
  begin
   Result := False;
   With (strGrdData) Do
     For nRow := 0 To RowCount - 1 Do
      If (Cells[CO_COL_PRORRATEAR, nRow] = CO_SI_PRORRATEADO) Then
       Begin
       Result := True;
       Break;
       End;
  end;


var
  StpProrroga : TStoredProc;
  nRow : Integer;
  vlBObtuvoFolio, vlbError : Boolean;
  vlPESID_GPO_PRGA : Integer;
  vlstrMensaje : String;
  vlIMP_CAP_PRGA, vlIMP_CAPITAL, vlIMP_CAPITAL_NVO : Double;
begin
 If (Mensaje <> '') Then
  Begin
  MuestraMensaje(Mensaje, mtError);
  Exit;
  End;

 If Not EsValido Then
  Begin
  MuestraMensaje('Debe de seleccionar al menos un periodo,'+
                 coCRLF+'para que se prorratee su diferencia', mtError);
  Exit;
  End;

  CreateSTP_PRORROGA(StpProrroga, Objeto.Apli.DatabaseName, Objeto.Apli.SessionName);
   If Assigned(StpProrroga) Then
    Begin
      With strGrdData, StpProrroga Do
       Begin
        ParamByName('PEID_CREDITO').AsFloat := Objeto.ID_CREDITO.AsInteger;
        ParamByName('PEID_PERIODO_PRGA').AsFloat := Objeto.NUM_PERIODO.AsInteger;
        ParamByName('PECVE_PRORROGA').AsString := 'PROIMP'; // This is Hardcode
        ParamByName('PECVE_CONCEPTO').AsString := 'KA'; // This is Hardcode
        ParamByName('PEF_ALTA').AsDateTime  := Objeto.Apli.DameFechaEmpresa;
        ParamByName('PECVE_USU_ALTA').AsString := Objeto.Apli.Usuario;
        ParamByName('PEB_COMMIT').AsString := CFALSO;
        vlBObtuvoFolio := False;
        vlPESID_GPO_PRGA := -1;
        vlbError := False;

        For nRow := 0 To RowCount - 1 Do
         Begin
          If (Cells[CO_COL_PRORRATEAR,nRow] <> CO_SI_PRORRATEADO)
              And (Cells[CO_COL_ESTADO, nRow] <> CO_EN_PRORROGA) Then
           Continue;

          vlIMP_CAPITAL := StrToFloat(TrimChar(Cells[CO_COL_IMP_CAPITAL,nRow],','#32));
          vlIMP_CAPITAL_NVO := StrToFloat(TrimChar(Cells[CO_COL_IMP_CAPITAL_NVO,nRow],','#32));
          If (Cells[CO_COL_ESTADO, nRow] = CO_EN_PRORROGA) Then
           vlIMP_CAP_PRGA := vlIMP_CAPITAL - vlIMP_CAPITAL_NVO
          Else
           vlIMP_CAP_PRGA := vlIMP_CAPITAL_NVO - vlIMP_CAPITAL;

          ParamByName('PEID_PERIODO').AsFloat   := StrToFloat(Cells[CO_COL_NUM_PERIODO, nRow]);
          ParamByName('PEIMP_CAP_PRGA').AsFloat := vlIMP_CAP_PRGA;

          If vlBObtuvoFolio Then ParamByName('PESID_GPO_PRGA').AsInteger := vlPESID_GPO_PRGA
          Else ParamByName('PESID_GPO_PRGA').Clear;
          ExecProc;
          If (ParamByName('PSRESULTADO').AsFloat <> 0) Then
            Begin
            MuestraMensaje(ParamByName('PSTX_RESULTADO').AsString, mtError);
            vlbError := True;
            Break;
            End
          Else
            Begin
            vlPESID_GPO_PRGA := ParamByName('PESID_GPO_PRGA').AsInteger;
            vlBObtuvoFolio := True;
            End;
         End;
       End; // End For

      If Not (vlbError) Then
        Begin
         RunSQL('COMMIT', Objeto.Apli.SessionName, Objeto.Apli.DatabaseName, False);
         If ActivaGrupoProrroga(vlPESID_GPO_PRGA, Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, vlstrMensaje) Then
           Begin
           MuestraMensaje('Prórroga Realizada.', mtInformation);
           InterForma1.Salir;
           End
          Else
           MuestraMensaje(vlstrMensaje, mtError);
        End;
      StpProrroga.Free;

    End; // End If
end;

end.

