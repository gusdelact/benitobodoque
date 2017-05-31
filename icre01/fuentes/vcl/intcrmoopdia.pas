// Sistema         : ICre01
// Fecha de Inicio : 14/09/2006
// Función forma   : Clase de IntCrMoOpDia
// Desarrollo por  : Intercase JMML
// Diseñado por    : Intercase JMML
// Comentarios     :

Unit IntCrMoOpDia;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntSGCtrl, IntMensRe,Ungene,

//Unidades Adicionales
IntParamCre,      //Parámetros Crédito
IntGenCre,
IntMon,           //Moneda
IntCrProduct,     //Producto de crédito
IntCrCatComi, Menus, IntLinkit
;

Type
 TCrMoOpDia= class;

  TWCrMoOpDia=Class(TForm)
    InterForma1             : TInterForma;
    MErrores: TMemo;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    rgTpoMovto: TRadioGroup;
    sgcData: TSGCtrl;
    Label6: TLabel;
    lbCVE_MONEDA: TLabel;
    cbxProducto: TCheckBox;
    edCVE_PRODUCTO_CRE: TEdit;
    btPRODUCTO_CRE: TBitBtn;
    edDESC_PRODUCTO_CRE: TEdit;
    edCVE_MONEDA: TEdit;
    btCVE_MONEDA: TBitBtn;
    edDESC_MONEDA: TEdit;
    cbxMoneda: TCheckBox;
    ilPRODUCTO_CRE: TInterLinkit;
    ilMONEDA: TInterLinkit;
    btBUSCA: TBitBtn;
    GroupBox1: TGroupBox;
    Label17: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edHoraIni: TEdit;
    edMinIni: TEdit;
    edSegIni: TEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edHoraFin: TEdit;
    edMinFin: TEdit;
    edSegFin: TEdit;
    lbPlazoDisp: TLabel;
    lbNumDisp: TLabel;
    lbNumAutor: TLabel;
    lbTasaTot: TLabel;
    lbImporte: TLabel;
    lbDiasxVenc: TLabel;
    lbFVenc: TLabel;
    cbxDetalle: TCheckBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure btBUSCAClick(Sender: TObject);
    procedure btCVE_MONEDAClick(Sender: TObject);
    procedure ilMONEDACapture(Sender: TObject; var Show: Boolean);
    procedure ilMONEDAEjecuta(Sender: TObject);
    procedure cbxMonedaClick(Sender: TObject);
    procedure btPRODUCTO_CREClick(Sender: TObject);
    procedure ilPRODUCTO_CRECapture(Sender: TObject; var Show: Boolean);
    procedure ilPRODUCTO_CREEjecuta(Sender: TObject);
    procedure cbxProductoClick(Sender: TObject);
    procedure edHoraIniKeyPress(Sender: TObject; var Key: Char);
    procedure rgTpoMovtoClick(Sender: TObject);
    procedure sgcDataCalcRow(Sendet: TObject; DataSet: TDataSet;
      CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
    private
    { Private declarations }
      vgsCveMon:        String;
      vgsTpoMovto:      String;
      vgsNumDisp:       Integer;
      vgdTotGpoMon:     Double;
      vgdTotGpoMovto:   Double;
      vgFinicio:        Boolean;

      function  CadenaSql: String;
      Procedure MuestraDatos;
      Procedure ObtenHoraMinSegAct;
      function ValidaDatos(var sMensaje: String):Boolean;
    public
    { Public declarations }
     Objeto : TCrMoOpDia;
end;
 TCrMoOpDia= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        TIPOMOVTO                : TInterCampo;

        //Clases Adicionales
        ParamCre                 : TParamCre;
        Moneda                   : TMoneda;
        Producto                 : TCrProduct;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;


implementation
{$R *.DFM}

constructor TCrMoOpDia.Create( AOwner : TComponent );
begin Inherited;
      TIPOMOVTO := CreaCampo('TIPOMOVTO',ftString,tsNinguno,tsNinguno,False);
      With TIPOMOVTO Do Begin Size:=2;
            UseCombo:=True;
            ComboLista.Add('0'); ComboDatos.Add(CSIT_NI);
            ComboLista.Add('1'); ComboDatos.Add(CSIT_ID);
      End;
            TIPOMOVTO.Caption:='Tipo Movimiento';
            TIPOMOVTO.Parametro:='TIPOMOVTO';

      Moneda := TMoneda.Create(Self);
      Moneda.MasterSource := Self;

      Producto := TCrProduct.Create(Self);
      Producto.MasterSource := Self;

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrMoOpDia.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrMoOpDia.Destroy;
begin
   If Moneda <> Nil Then
      Moneda.Free;
   If Producto <> Nil Then
      Producto.Free;

   inherited;
end;


function TCrMoOpDia.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrMoOpDia;
begin
   W:=TWCrMoOpDia.Create(Self);
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


Function TCrMoOpDia.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrMoOpDia.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA CrMoOpDia********************)
(*                                                                              *)
(*  FORMA DE CrMoOpDia                                                            *)
(*                                                                              *)
(***********************************************FORMA CrMoOpDia********************)
Procedure TWCrMoOpDia.MuestraDatos;
var
   vlQry:   TQuery;
   sSQL:    String;
Begin
    sSQL := CadenaSql;

    If Trim(sSQL) <> '' Then Begin
        vlQry := GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
        Try
            If vlQry <> Nil Then Begin
               //COLUMNAS OCULTAS
                vlQry.FieldByName('CVE_MONEDA').Visible := False;
                vlQry.FieldByName('DESC_MONEDA').Visible := False;
                vlQry.FieldByName('TIPO_MOVTO').Visible := False;
                vlQry.FieldByName('NUM_DISP').Visible := False;

                If (rgTpoMovto.ItemIndex = 1) AND (cbxDetalle.Checked) Then
                    vlQry.FieldByName('DIAS_X_VENCER').Visible := False;

                //ASIGNACION DE MASCARAS DE EDICION
                TNumericField(vlQry.FieldByName('IMP_NETO')).DisplayFormat := '###,###,###,###,##0.00';

                //ASIGNACION DE LONGITUD DE COLUMNAS
                vlQry.FieldByName('CVE_MONEDA').DisplayWidth := 10;
                vlQry.FieldByName('DESC_MONEDA').DisplayWidth := 10;
                vlQry.FieldByName('TIPO_MOVTO').DisplayWidth := 10;
                vlQry.FieldByName('NUM_DISP').DisplayWidth := 10;
                vlQry.FieldByName('IMP_NETO').DisplayWidth := 15;

                If cbxDetalle.Checked Then Begin
                    vlQry.FieldByName('DIAS_PLAZO').DisplayWidth := 15;
                    vlQry.FieldByName('ID_CREDITO').DisplayWidth := 15;
                    vlQry.FieldByName('ID_CONTRATO').DisplayWidth := 15;
                    vlQry.FieldByName('TASA_APLICADA').DisplayWidth := 15;
                    If (rgTpoMovto.ItemIndex = 1) AND (cbxDetalle.Checked) Then
                        vlQry.FieldByName('DIAS_X_VENCER').DisplayWidth := 15;
                    vlQry.FieldByName('F_VENC_CRE').DisplayWidth := 12;
                End Else
                    vlQry.FieldByName('IMP_NETO').Visible := False;

                sgcData.SG.Font.Size := 4;
                sgcData.AddQry(vlQry,True,True,-1,-1,-1,False);
            End Else
                sgcData.Clear('NO SE ENCONTRARON DATOS'#30'>C');
        Finally
            If vlQry <> Nil Then
                vlQry.free;
        End;
    End;
end;

function TWCrMoOpDia.CadenaSql: String;
var
    sSQL:       String;
    sFiltros:   String;
    sTpoMovto:  String;
    sFecha:     String;
    sCampos:    String;
    sGroupBy:   String;
    sOrderBy:   String;
    sHMSIni:    String;
    sHMSFin:    String;
begin
    Objeto.GetFromControl;
    sFiltros := '';

    sFecha := FormatDateTime('dd/mm/yyyy',Objeto.Apli.DameFechaEmpresa);
    sHMSIni := edHoraIni.Text + edMinIni.Text + edSegIni.Text;
    sHMSFin := edHoraFin.Text + edMinFin.Text + edSegFin.Text;

    // sFecha := '23/08/2006';

    If Objeto.Moneda.Cve_Moneda.AsString <> '' Then
        sFiltros := '    AND MON.CVE_MONEDA = ''' + Objeto.Moneda.Cve_Moneda.AsString + ''' ' +  coCRLF;

    If Objeto.Producto.CVE_PRODUCTO_CRE.AsString <> '' Then
        sFiltros := sFiltros + '    AND CCTO.CVE_PRODUCTO_CRE = ''' + Objeto.Producto.CVE_PRODUCTO_CRE.AsString + ''' ' + coCRLF;

    If rgTpoMovto.ItemIndex = 0 Then Begin      //Si es por Disposición
        sFiltros := sFiltros + '    AND COPER.CVE_OPERACION IN (''DISPCS'',''DISPCR'',''DISPRE'',''DISPRS'',''DSCSDL'') ' + coCRLF;
        sTpoMovto := '        ''Disposición'' AS TIPO_MOVTO, ' + coCRLF;
    End Else Begin                              //Si es por Recuperación
        sFiltros := sFiltros + '    AND COPER.CVE_AFEC_SALDO = ''I'' ' + coCRLF +
                               '    AND COPER.CVE_ACCESORIO <> ''CR'' ' + coCRLF;
        sTpoMovto := '        ''Recuperación'' AS TIPO_MOVTO, ';
    End;

    If Not cbxDetalle.Checked Then Begin
        sCampos  := '    COUNT(*) AS NUM_DISP, ' + coCRLF +
                    '    SUM(DATOS.IMP_NETO) AS IMP_NETO ' + coCRLF;

        sGroupBy := ' GROUP BY DATOS.CVE_MONEDA, DATOS.DESC_MONEDA, DATOS.TIPO_MOVTO ' + coCRLF;
        sOrderBy := ' ORDER BY DATOS.CVE_MONEDA, DATOS.TIPO_MOVTO ';
    End Else Begin
        sCampos  := '    1 AS NUM_DISP, ' + coCRLF +
                    '    DATOS.DIAS_PLAZO, ' + coCRLF +
                    '    DATOS.ID_CREDITO, ' + coCRLF +
                    '    DATOS.ID_CONTRATO, ' + coCRLF +
                    '    DATOS.TASA_APLICADA, ' + coCRLF +
                    '    DATOS.IMP_NETO, ' + coCRLF +
                    '    DECODE(SIGN(DATOS.DIAS_X_VENCER),-1,0,DATOS.DIAS_X_VENCER) AS DIAS_X_VENCER, ' + coCRLF +
                    '    DATOS.F_VENC_CRE ' + coCRLF;

        sGroupBy := ' ';
        sOrderBy := ' ORDER BY DATOS.CVE_MONEDA, DATOS.TIPO_MOVTO, DATOS.DIAS_PLAZO ';
    End;

    sSQL := ' SELECT ' + coCRLF +
            '    DATOS.CVE_MONEDA, ' + coCRLF +
            '    DATOS.DESC_MONEDA, ' + coCRLF +
            '    DATOS.TIPO_MOVTO, ' + coCRLF +
            sCampos +
            ' FROM ' + coCRLF +
            '    ( ' + coCRLF +
            '     SELECT ' + coCRLF +
            sTpoMovto +
            '        CTRA.ID_TRANSACCION, ' + coCRLF +
            '        CTRA.ID_GRUPO_TRANSAC, ' + coCRLF +
            '        CTRA.CVE_OPERACION, ' + coCRLF +
            '        CTRA.ID_CONTRATO, ' + coCRLF +
            '        CTRA.ID_CREDITO, ' + coCRLF +
            '        CTRA.ID_PERIODO, ' + coCRLF +
            '        CTRA.CVE_COMISION, ' + coCRLF +
            '        CTRA.IMP_NETO, ' + coCRLF +
            '        CTRA.F_OPERACION, ' + coCRLF +
            '        TO_NUMBER(TO_CHAR(CTRA.FH_ALTA,''HHMISS'')) AS HORA_MIN_SEG, ' + coCRLF +
            '        CTRA.SIT_TRANSACCION, ' + coCRLF +
            '        CTRA.TASA_APLICADA, ' + coCRLF +
            '        COPER.CVE_ACCESORIO, ' + coCRLF +
            '        CCRED.DIAS_PLAZO, ' + coCRLF +
            '        CCRED.F_VENCIMIENTO AS F_VENC_CRE, ' + coCRLF +
            '        CCTO.CVE_PRODUCTO_CRE, ' + coCRLF +
            '        MON.CVE_MONEDA, ' + coCRLF +
            '        MON.DESC_MONEDA, ' + coCRLF +
            '        DECODE(COPER.CVE_ACCESORIO,''CN'',(TO_DATE(''' + sFecha + ''',''DD/MM/YYYY'') - CCOM.F_VENCIMIENTO), ' + coCRLF +
            '                                   ''IN'',(TO_DATE(''' + sFecha + ''',''DD/MM/YYYY'') - CINT.F_VENCIMIENTO), ' + coCRLF +
            '                                   ''CP'',(TO_DATE(''' + sFecha + ''',''DD/MM/YYYY'') - CCAP.F_VENCIMIENTO), ' + coCRLF +
            '                                   ''FN'',(TO_DATE(''' + sFecha + ''',''DD/MM/YYYY'') - CFIN.F_VENCIMIENTO), ' + coCRLF +
            '                                   0) AS DIAS_X_VENCER, ' + coCRLF +
            '        CCOM.F_VENCIMIENTO AS F_VENC_COM, ' + coCRLF +
            '        CINT.F_VENCIMIENTO AS F_VENC_INT, ' + coCRLF +
            '        CCAP.F_VENCIMIENTO AS F_VENC_CAP, ' + coCRLF +
            '        CFIN.F_VENCIMIENTO AS F_VENC_FIN ' + coCRLF +
            '     FROM ' + coCRLF +
            '        CR_TRANSACCION CTRA, ' + coCRLF +
            '        CR_OPERACION   COPER, ' + coCRLF +
            '        CR_CREDITO     CCRED, ' + coCRLF +
            '        CR_CONTRATO    CCTO, ' + coCRLF +
            '        CONTRATO       CTO, ' + coCRLF +
            '        MONEDA         MON, ' + coCRLF +
            '        CR_COMISION    CCOM, ' + coCRLF +
            '        CR_INTERES     CINT, ' + coCRLF +
            '        CR_CAPITAL     CCAP, ' + coCRLF +
            '        CR_FINAN_ADIC CFIN ' + coCRLF +
            '     WHERE ' + coCRLF +
            '        CTRA.SIT_TRANSACCION = ''AC'' ' + coCRLF +
            '        AND CTRA.ID_CREDITO = CCRED.ID_CREDITO ' + coCRLF +
            '        AND CTRA.CVE_OPERACION = COPER.CVE_OPERACION ' + coCRLF +
            '        AND CCRED.ID_CONTRATO = CCTO.ID_CONTRATO ' + coCRLF +
            '        AND CCRED.FOL_CONTRATO = CCTO.FOL_CONTRATO ' + coCRLF +
            '        AND CCRED.ID_CONTRATO = CTO.ID_CONTRATO ' + coCRLF +
            '        AND CTO.CVE_MONEDA = MON.CVE_MONEDA ' + coCRLF +
            '        AND CTO.ID_EMPRESA = ' + IntToStr( Objeto.Apli.IdEmpresa )+ coCRLF +
            '        AND CTRA.ID_CREDITO = CCOM.ID_CREDITO (+) ' + coCRLF +
            '        AND CTRA.ID_PERIODO = CCOM.NUM_PERIODO (+) ' + coCRLF +
            '        AND CTRA.CVE_COMISION = CCOM.CVE_COMISION (+) ' + coCRLF +
            '        AND CTRA.ID_CREDITO = CINT.ID_CREDITO (+) ' + coCRLF +
            '        AND CTRA.ID_PERIODO = CINT.NUM_PERIODO (+) ' + coCRLF +
            '        AND CTRA.ID_CREDITO = CCAP.ID_CREDITO (+) ' + coCRLF +
            '        AND CTRA.ID_PERIODO = CCAP.NUM_PERIODO (+) ' + coCRLF +
            '        AND CTRA.ID_CREDITO = CFIN.ID_CREDITO (+) ' + coCRLF +
            '        AND CTRA.ID_PERIODO = CFIN.NUM_PERIODO (+) ' + coCRLF +
            '        AND CTRA.F_OPERACION = TO_DATE(''' + sFecha + ''',''DD/MM/YYYY'') ' + coCRLF +
            sFiltros +
            '    ) DATOS ' + coCRLF +
            ' WHERE HORA_MIN_SEG >= ' + sHMSIni + coCRLF +
            '    AND HORA_MIN_SEG <= ' + sHMSFin + coCRLF +
            sGroupBy +
            sOrderBy;

   CadenaSql := sSQL;
end;

procedure TWCrMoOpDia.FormShow(Sender: TObject);
begin
      //Pinta los datos del panel inferior
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.TIPOMOVTO.Control := rgTpoMovto;

      Objeto.Moneda.Cve_Moneda.Control := edCVE_MONEDA;
      Objeto.Moneda.Desc_Moneda.Control := edDESC_MONEDA;
      Objeto.Moneda.GetParams(Objeto);

      Objeto.Producto.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO_CRE;
      Objeto.Producto.DESC_L_PRODUCTO.Control := edDESC_PRODUCTO_CRE;
      Objeto.Producto.GetParams(Objeto);

      edHoraIni.Text := '00';
      edMinIni.Text := '00';
      edSegIni.Text := '00';

      ObtenHoraMinSegAct;
end;

procedure TWCrMoOpDia.FormDestroy(Sender: TObject);
begin
      Objeto.TIPOMOVTO.Control:=nil;

      Objeto.Moneda.Cve_Moneda.Control := Nil;
      Objeto.Moneda.Desc_Moneda.Control := Nil;
      Objeto.Producto.CVE_PRODUCTO_CRE.Control := Nil;
      Objeto.Producto.DESC_L_PRODUCTO.Control := Nil;
end;

procedure TWCrMoOpDia.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrMoOpDia.InterForma1DespuesShow(Sender: TObject);
begin
    rgTpoMovto.ItemIndex := 1;
end;

procedure TWCrMoOpDia.btBUSCAClick(Sender: TObject);
Var
    sMensaje: String;
begin
    If Not ValidaDatos(sMensaje) Then Begin
        ShowMessage(sMensaje);
    End Else Begin
        AddLine(MErrores,'Inicio de Búsqueda...');
        MuestraDatos;
        AddLine(MErrores,'Fin de Búsqueda.');
    End;
end;

procedure TWCrMoOpDia.btCVE_MONEDAClick(Sender: TObject);
begin
    Objeto.Moneda.ShowAll := True;

    If Objeto.Moneda.Busca Then begin
        cbxMoneda.Checked:=True;
        cbxMoneda.Enabled:=True;
        InterForma1.NextTab(edCVE_MONEDA);
    End;
end;

procedure TWCrMoOpDia.ilMONEDACapture(Sender: TObject; var Show: Boolean);
begin
    Show := True;
end;

procedure TWCrMoOpDia.ilMONEDAEjecuta(Sender: TObject);
begin
    If Objeto.Moneda.FindKey([ilMONEDA.Buffer]) Then Begin
        cbxMoneda.Checked:=True;
        cbxMoneda.Enabled:=True;
        InterForma1.NextTab(edCVE_MONEDA);
    End;
end;

procedure TWCrMoOpDia.cbxMonedaClick(Sender: TObject);
begin
    EnableCheckBox(cbxMoneda);
    Objeto.Moneda.Active := cbxMoneda.Checked;
end;

procedure TWCrMoOpDia.btPRODUCTO_CREClick(Sender: TObject);
begin
    Objeto.Producto.ShowAll := True;

    If Objeto.Producto.Busca Then Begin
        cbxProducto.Checked:=True;
        cbxProducto.Enabled:=True;
        InterForma1.NextTab(edCVE_PRODUCTO_CRE);
    End;
end;

procedure TWCrMoOpDia.ilPRODUCTO_CRECapture(Sender: TObject;
  var Show: Boolean);
begin
    Show:= True;
end;

procedure TWCrMoOpDia.ilPRODUCTO_CREEjecuta(Sender: TObject);
begin
    If Objeto.Producto.FindKey([ilPRODUCTO_CRE.Buffer]) Then Begin
        cbxProducto.Checked:=True;
        cbxProducto.Enabled:=True;
        InterForma1.NextTab(edCVE_PRODUCTO_CRE);
    End;
end;

procedure TWCrMoOpDia.cbxProductoClick(Sender: TObject);
begin
    EnableCheckBox(cbxProducto);
    Objeto.Producto.Active := cbxProducto.Checked;
end;

procedure TWCrMoOpDia.edHoraIniKeyPress(Sender: TObject; var Key: Char);
begin
    If Not (Key In ['0'..'9',#8]) Then
        Key := #0
end;

procedure TWCrMoOpDia.rgTpoMovtoClick(Sender: TObject);
begin
    sgcData.Clear('NO EXISTEN DATOS'#30'>C');

    If rgTpoMovto.ItemIndex = 0 Then Begin
        lbFVenc.Visible := False;
        lbDiasxVenc.Caption := 'F. Vencimiento';
    End Else Begin
        lbFVenc.Visible := True;
        lbDiasxVenc.Caption := 'Días x Vencer';
    End;
end;

procedure TWCrMoOpDia.ObtenHoraMinSegAct;
var
    sSQL: String;
    qyQuery: TQuery;
Begin
    SSQL := ' SELECT '+
            '    TO_CHAR(SYSDATE,''DD'') AS DIA_ACT, '+
            '    TO_CHAR(SYSDATE,''MM'') AS MES_ACT, '+
            '    TO_CHAR(SYSDATE,''YYYY'') AS ANYO_ACT, '+
            '    TO_CHAR(SYSDATE,''HH'') AS HORA_ACT, '+
            '    TO_CHAR(SYSDATE,''MI'') AS MIN_ACT, '+
            '    TO_CHAR(SYSDATE,''SS'') AS SEG_ACT '+
            ' FROM DUAL ';

    qyQuery := GetSQLQuery(SSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );

    If qyQuery <> Nil Then Begin
        edHoraFin.Text := qyQuery.FieldByName('HORA_ACT').AsString;
        edMinFin.Text := qyQuery.FieldByName('MIN_ACT').AsString;
        edSegFin.Text := qyQuery.FieldByName('SEG_ACT').AsString;
        qyQuery.Free;
    End;
End;

Function TWCrMoOpDia.ValidaDatos(var sMensaje: String):Boolean;
begin
    Result := True;

    If (Trim(edHoraIni.Text) = '') Or (Trim(edHoraFin.Text) = '')Then Begin
        sMensaje := 'Favor de Indicar la Hora Inicial y Final.';
        Result := False;
    End;
    If Result Then Begin
        If (Trim(edMinIni.Text) = '') Or (Trim(edMinFin.Text) = '')Then Begin
            sMensaje := 'Favor de Indicar el Minuto Inicial y Final.';
            Result := False;
        End;
    End;
    If Result Then Begin
        If (Trim(edSegIni.Text) = '') Or (Trim(edSegFin.Text) = '')Then Begin
            sMensaje := 'Favor de Indicar el Segundo Inicial y Final.';
            Result := False;
        End;
    End;
    If Result Then Begin
        If (StrToInt(edHoraIni.Text) > 23) Or (StrToInt(edHoraFin.Text) > 23) Then Begin
            sMensaje := 'Las Horas Inicial y Final Deben ser Menores o Iguales a 23.';
            Result := False;
        End;
    End;
    If Result Then Begin
        If (StrToInt(edMinIni.Text) > 59) Or (StrToInt(edMinFin.Text) > 59) Then Begin
            sMensaje := 'Los Minutos Inicial y Final Deben ser Menores o Iguales a 59.';
            Result := False;
        End;
    End;
    If Result Then Begin
        If (StrToInt(edSegIni.Text) > 59) Or (StrToInt(edSegFin.Text) > 59) Then Begin
            sMensaje := 'Los Segundos Inicial y Final Deben ser Menores o Iguales a 59.';
            Result := False;
        End;
    End;
end;

procedure TWCrMoOpDia.sgcDataCalcRow(Sendet: TObject; DataSet: TDataSet;
  CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
Var
    sDescMon:       String;
    sTotGpoMon:     String;
    sTotGpoMovto:   String;
    sTotNumDisp:    String;
begin
    If ( RowCaso = rcQueryBegin ) Then Begin
        vgsCveMon := '';
        vgsTpoMovto := '';
        vgdTotGpoMon := 0;
        vgdTotGpoMovto := 0;
        vgsNumDisp := 0;
        vgFinicio := True;
    End;

    If (RowCaso = rcRowBegin) Then Begin                  //Valida un cambio de grupo
        If (vgsCveMon <> DataSet.FieldByName('CVE_MONEDA').AsString) Then Begin
            If vgFinicio Then                       //Cierra el grupo anterior
                vgFinicio := False
            Else Begin
                sTotNumDisp := '            Total Número de Disposiciones: ' + IntToStr(vgsNumDisp);
                sgcData.AddTexto(sTotNumDisp, tcLeft, clMaroon, 15);
                sTotGpoMovto := '      Total por Tipo de Movimiento: ' + Format(CFORMAT_DINERO,[vgdTotGpoMovto]);
                sgcData.AddTexto(sTotGpoMovto, tcLeft, clMaroon, 15);
                sTotGpoMon := 'Total por Moneda: ' + Format(CFORMAT_DINERO,[vgdTotGpoMon]);
                sgcData.AddTexto(sTotGpoMon, tcLeft, clMaroon, 15);
            End;

            //Inicializa con los nuevos datos del siguiente grupo
            vgsCveMon := DataSet.FieldByName('CVE_MONEDA').AsString;
            sDescMon := DataSet.FieldByName('DESC_MONEDA').AsString;
            vgsTpoMovto := DataSet.FieldByName('TIPO_MOVTO').AsString;

            sgcData.AddTexto('Moneda: ' + vgsCveMon + '    ' + sDescMon, tcLeft, clMaroon, 15);
            sgcData.AddTexto('      Tipo de Movimiento: ' + vgsTpoMovto, tcLeft, clMaroon, 15);

            vgdTotGpoMovto := DataSet.FieldByName('IMP_NETO').AsFloat;
            vgdTotGpoMon := DataSet.FieldByName('IMP_NETO').AsFloat;
            vgsNumDisp := DataSet.FieldByName('NUM_DISP').AsInteger;
        End Else Begin
            If (vgsTpoMovto <> DataSet.FieldByName('TIPO_MOVTO').AsString) Then Begin
                sTotNumDisp := '            Total Número de Disposiciones: ' + IntToStr(vgsNumDisp);
                sgcData.AddTexto(sTotNumDisp, tcLeft, clMaroon, 15);
                sTotGpoMovto := '      Total por Tipo de Movimiento: ' + Format(CFORMAT_DINERO,[vgdTotGpoMovto]);
                sgcData.AddTexto( sTotGpoMovto, tcLeft, clMaroon, 15);

                //Inicializa con los nuevos datos del siguiente grupo
                vgsTpoMovto := DataSet.FieldByName('TIPO_MOVTO').AsString;
                sgcData.AddTexto('      Tipo de Movimiento: ' + vgsTpoMovto, tcLeft, clMaroon, 15);

                vgdTotGpoMovto := DataSet.FieldByName('IMP_NETO').AsFloat;
                vgsNumDisp := DataSet.FieldByName('NUM_DISP').AsInteger;
            End Else Begin
                vgdTotGpoMovto := vgdTotGpoMovto + DataSet.FieldByName('IMP_NETO').AsFloat;
                vgsNumDisp := vgsNumDisp + DataSet.FieldByName('NUM_DISP').AsInteger;
            End;
            vgdTotGpoMon := vgdTotGpoMon + DataSet.FieldByName('IMP_NETO').AsFloat;
        End;
    End;

    If (RowCaso = rcQueryEnd) Then Begin      //Valida fin de Query
        sTotNumDisp := '            Total Número de Disposiciones: ' + IntToStr(vgsNumDisp);
        sgcData.AddTexto(sTotNumDisp, tcLeft, clMaroon, 15);
        sTotGpoMovto := '      Total por Tipo de Movimiento: ' + Format(CFORMAT_DINERO,[vgdTotGpoMovto]);
        sgcData.AddTexto(sTotGpoMovto, tcLeft, clMaroon, 15);
        sTotGpoMon := 'Total por Moneda: ' + Format(CFORMAT_DINERO,[vgdTotGpoMon]);
        sgcData.AddTexto(sTotGpoMon, tcLeft, clMaroon, 15);
    End;
end;

end.
