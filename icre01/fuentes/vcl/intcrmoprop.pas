// Sistema         : ICre01
// Fecha de Inicio : 14/09/2006
// Función forma   : Clase de IntCrMoPrOp
// Desarrollo por  : Intercase JMML
// Diseñado por    : Intercase JMML
// Comentarios     :

Unit IntCrMoPrOp;

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
 TCrMoPrOp= class;

  TWCrMoPrOp=Class(TForm)
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
    lbPlazoDisp: TLabel;
    lbDiasVencAut: TLabel;
    lbNumAutor: TLabel;
    lbSaldoDisp: TLabel;
    Label1: TLabel;
    Label2: TLabel;
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
    procedure rgTpoMovtoClick(Sender: TObject);
    procedure sgcDataCalcRow(Sendet: TObject; DataSet: TDataSet;
      CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
    private
    { Private declarations }
      vgsCveMon:        String;
      vgsTpoMovto:      String;
      vgsPlazoMax:      String;
      vgdAutGpoMon:     Integer;
      vgdAutGpoMovto:   integer;
      vgsAutPlazoMax:   Integer;
      vgdTotGpoMon:     Double;
      vgdTotGpoMovto:   Double;
      vgsTotPlazoMax:   Double;
      vgFinicio:        Boolean;

      function  CadenaSql: String;
      Procedure MuestraDatos;
    public
    { Public declarations }
     Objeto : TCrMoPrOp;
end;
 TCrMoPrOp= class(TInterFrame)
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
//Uses RepMon;

{$R *.DFM}

constructor TCrMoPrOp.Create( AOwner : TComponent );
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
      HelpFile := 'IntCrMoPrOp.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrMoPrOp.Destroy;
begin
   If Moneda <> Nil Then
      Moneda.Free;
   If Producto <> Nil Then
      Producto.Free;

   inherited;
end;


function TCrMoPrOp.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrMoPrOp;
begin
   W:=TWCrMoPrOp.Create(Self);
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


Function TCrMoPrOp.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrMoPrOp.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA CrMoPrOp********************)
(*                                                                              *)
(*  FORMA DE CrMoPrOp                                                            *)
(*                                                                              *)
(***********************************************FORMA CrMoPrOp********************)
Procedure TWCrMoPrOp.MuestraDatos;
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

                If rgTpoMovto.ItemIndex = 0 Then Begin
                    vlQry.FieldByName('DIAS_FALT').Visible := False;
                    vlQry.FieldByName('IMP_RECUP').Visible := False;
                End Else Begin
                    vlQry.FieldByName('PLAZO_MAX_DISP').Visible := False;
                    vlQry.FieldByName('DIAS_X_VENCER').Visible := False;
                    vlQry.FieldByName('NUM_AUTOR').Visible := False;
                    vlQry.FieldByName('IMP_DISPUESTO').Visible := False;
                End;

                //ASIGNACION DE MASCARAS DE EDICION
                TNumericField(vlQry.FieldByName('IMP_DISPUESTO')).DisplayFormat := '###,###,###,###,##0.00';
                TNumericField(vlQry.FieldByName('IMP_RECUP')).DisplayFormat := '###,###,###,###,##0.00';

                //ASIGNACION DE LONGITUD DE COLUMNAS
                vlQry.FieldByName('CVE_MONEDA').DisplayWidth := 10;
                vlQry.FieldByName('DESC_MONEDA').DisplayWidth := 10;
                vlQry.FieldByName('TIPO_MOVTO').DisplayWidth := 10;

                vlQry.FieldByName('PLAZO_MAX_DISP').DisplayWidth := 22;
                vlQry.FieldByName('DIAS_X_VENCER').DisplayWidth := 25;
                vlQry.FieldByName('NUM_AUTOR').DisplayWidth := 22;
                vlQry.FieldByName('IMP_DISPUESTO').DisplayWidth := 20;
                vlQry.FieldByName('DIAS_FALT').DisplayWidth := 22;
                vlQry.FieldByName('IMP_RECUP').DisplayWidth := 25;

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

function TWCrMoPrOp.CadenaSql: String;
var
    sSQL:       String;
    sFiltros:   String;
    sTpoMovto:  String;

    sFecha:     String;
begin
    Objeto.GetFromControl;
    sFiltros := '';

    sFecha := FormatDateTime('dd/mm/yyyy',Objeto.Apli.DameFechaEmpresa);
    sFecha := '23/08/2006';

    If Objeto.Moneda.Cve_Moneda.AsString <> '' Then
        sFiltros := '    AND MON.CVE_MONEDA = ''' + Objeto.Moneda.Cve_Moneda.AsString + ''' ' +  coCRLF;

    If Objeto.Producto.CVE_PRODUCTO_CRE.AsString <> '' Then
        sFiltros := sFiltros + '    AND CCTO.CVE_PRODUCTO_CRE = ''' + Objeto.Producto.CVE_PRODUCTO_CRE.AsString + ''' ' + coCRLF;

    If rgTpoMovto.ItemIndex = 0 Then Begin      //Si es por Disposición
        sTpoMovto := '        ''Disposición'' AS TIPO_MOVTO, ' + coCRLF;
    End Else Begin                              //Si es por Recuperación
        sTpoMovto := '        ''Recuperación'' AS TIPO_MOVTO, ';
    End;

    sSQL := ' SELECT ' + coCRLF +
            '    DATOS.CVE_MONEDA, ' + coCRLF +
            '    DATOS.DESC_MONEDA, ' + coCRLF +
            '    DATOS.TIPO_MOVTO, ' + coCRLF +
            '    DATOS.PLAZO_MAX_DISP, ' + coCRLF +
            '    DATOS.DIAS_X_VENCER, ' + coCRLF +
            '    COUNT(*) AS NUM_AUTOR, ' + coCRLF +
            '    SUM(DATOS.IMP_DISPUESTO) AS IMP_DISPUESTO, ' + coCRLF +
            '    0 AS DIAS_FALT, ' + coCRLF +
            '    0 AS IMP_RECUP ' + coCRLF +
            ' FROM ' + coCRLF +
            '    ( ' + coCRLF +
            '     SELECT ' + coCRLF +
            '        MON.CVE_MONEDA, ' + coCRLF +
            '        MON.DESC_MONEDA, ' + coCRLF +
            sTpoMovto +
            '        PKGCRINET.FUNOBTPZOMAXDISP(CCTO.ID_CONTRATO, CCTO.FOL_CONTRATO, CCTO.F_VENCIMIENTO) AS PLAZO_MAX_DISP, ' + coCRLF +
            '        (CCTO.F_VENCIMIENTO - TO_DATE(''' + sFecha + ''',''DD/MM/YYYY'')) AS DIAS_X_VENCER, ' + coCRLF +
            '        CCTO.IMP_DISPUESTO ' + coCRLF +
            '     FROM CONTRATO CTTO, ' + coCRLF +
            '        CR_CONTRATO CCTO, ' + coCRLF +
            '        MONEDA MON ' + coCRLF +
            '     WHERE CTTO.ID_EMPRESA = ' + IntToStr( Objeto.Apli.IdEmpresa ) + coCRLF +
            '       AND CTTO.CVE_MONEDA = MON.CVE_MONEDA ' + coCRLF +
            '       AND CTTO.ID_CONTRATO = CCTO.ID_CONTRATO ' + coCRLF +
            sFiltros +
            '    ) DATOS ' + coCRLF +
            ' GROUP BY DATOS.CVE_MONEDA, ' + coCRLF +
            '    DATOS.DESC_MONEDA, ' + coCRLF +
            '    DATOS.TIPO_MOVTO, ' + coCRLF +
            '    DATOS.PLAZO_MAX_DISP, ' + coCRLF +
            '    DATOS.DIAS_X_VENCER ' + coCRLF +
            ' ORDER BY DATOS.CVE_MONEDA, ' + coCRLF +
            '    DATOS.TIPO_MOVTO, ' + coCRLF +
            '    DATOS.PLAZO_MAX_DISP, ' + coCRLF +
            '    DATOS.DIAS_X_VENCER ';

   CadenaSql := sSQL;
end;

procedure TWCrMoPrOp.FormShow(Sender: TObject);
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
end;

procedure TWCrMoPrOp.FormDestroy(Sender: TObject);
begin
      Objeto.TIPOMOVTO.Control:=nil;

      Objeto.Moneda.Cve_Moneda.Control := Nil;
      Objeto.Moneda.Desc_Moneda.Control := Nil;
      Objeto.Producto.CVE_PRODUCTO_CRE.Control := Nil;
      Objeto.Producto.DESC_L_PRODUCTO.Control := Nil;
end;

procedure TWCrMoPrOp.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrMoPrOp.InterForma1DespuesShow(Sender: TObject);
begin
    rgTpoMovto.ItemIndex := 0;
end;

procedure TWCrMoPrOp.btBUSCAClick(Sender: TObject);
begin
    AddLine(MErrores,'Inicio de Búsqueda...');
    MuestraDatos;
    AddLine(MErrores,'Fin de Búsqueda.');
end;

procedure TWCrMoPrOp.btCVE_MONEDAClick(Sender: TObject);
begin
    Objeto.Moneda.ShowAll := True;

    If Objeto.Moneda.Busca Then begin
        cbxMoneda.Checked:=True;
        cbxMoneda.Enabled:=True;
        InterForma1.NextTab(edCVE_MONEDA);
    End;
end;

procedure TWCrMoPrOp.ilMONEDACapture(Sender: TObject; var Show: Boolean);
begin
    Show := True;
end;

procedure TWCrMoPrOp.ilMONEDAEjecuta(Sender: TObject);
begin
    If Objeto.Moneda.FindKey([ilMONEDA.Buffer]) Then Begin
        cbxMoneda.Checked:=True;
        cbxMoneda.Enabled:=True;
        InterForma1.NextTab(edCVE_MONEDA);
    End;
end;

procedure TWCrMoPrOp.cbxMonedaClick(Sender: TObject);
begin
    EnableCheckBox(cbxMoneda);
    Objeto.Moneda.Active := cbxMoneda.Checked;
end;

procedure TWCrMoPrOp.btPRODUCTO_CREClick(Sender: TObject);
begin
    Objeto.Producto.ShowAll := True;

    If Objeto.Producto.Busca Then Begin
        cbxProducto.Checked:=True;
        cbxProducto.Enabled:=True;
        InterForma1.NextTab(edCVE_PRODUCTO_CRE);
    End;
end;

procedure TWCrMoPrOp.ilPRODUCTO_CRECapture(Sender: TObject;
  var Show: Boolean);
begin
    Show:= True;
end;

procedure TWCrMoPrOp.ilPRODUCTO_CREEjecuta(Sender: TObject);
begin
    If Objeto.Producto.FindKey([ilPRODUCTO_CRE.Buffer]) Then Begin
        cbxProducto.Checked:=True;
        cbxProducto.Enabled:=True;
        InterForma1.NextTab(edCVE_PRODUCTO_CRE);
    End;
end;

procedure TWCrMoPrOp.cbxProductoClick(Sender: TObject);
begin
    EnableCheckBox(cbxProducto);
    Objeto.Producto.Active := cbxProducto.Checked;
end;

procedure TWCrMoPrOp.rgTpoMovtoClick(Sender: TObject);
begin
    sgcData.Clear('NO EXISTEN DATOS'#30'>C');
    
    If rgTpoMovto.ItemIndex = 0 Then Begin
        lbPlazoDisp.Visible := True;
        lbDiasVencAut.Visible := True;
        lbNumAutor.Visible := True;
        lbSaldoDisp.Visible := True;
    End Else Begin
        lbPlazoDisp.Visible := False;
        lbDiasVencAut.Visible := False;
        lbNumAutor.Visible := False;
        lbSaldoDisp.Visible := False;
    End;
end;

procedure TWCrMoPrOp.sgcDataCalcRow(Sendet: TObject; DataSet: TDataSet;
  CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
Var
    sDescMon:       String;
    sTotGpoMon:     String;
    sTotGpoMovto:   String;
    sTotPlazoMax:    String;
begin
    If (RowCaso = rcQueryBegin) Then Begin
        vgsCveMon := '';
        vgsTpoMovto := '';
        vgsPlazoMax := '';
        vgdTotGpoMon := 0;
        vgdTotGpoMovto := 0;
        vgsTotPlazoMax := 0;
        vgdAutGpoMon := 0;
        vgdAutGpoMovto := 0;
        vgsAutPlazoMax := 0;
        vgFinicio := True;
    End;

    If (RowCaso = rcRowBegin) Then Begin                  //Valida un cambio de grupo
        If (vgsCveMon <> DataSet.FieldByName('CVE_MONEDA').AsString) Then Begin
            If vgFinicio Then                       //Cierra el grupo anterior
                vgFinicio := False
            Else Begin
                sTotPlazoMax := '            Total por Plazo Máximo a Disponer: ' +
                                 #9#9 + IntToStr(vgsAutPlazoMax) + #9 +
                                 Format(CFORMAT_DINERO,[vgsTotPlazoMax]);
                sgcData.AddTexto(sTotPlazoMax, tcLeft, clMaroon, 15);
                sTotGpoMovto := '      Total por Tipo de Movimiento: ' +
                                 #9#9 + IntToStr(vgdAutGpoMovto) + #9 +
                                 Format(CFORMAT_DINERO,[vgdTotGpoMovto]);
                sgcData.AddTexto(sTotGpoMovto, tcLeft, clMaroon, 15);
                sTotGpoMon := 'Total por Moneda: ' +
                                 #9#9 + IntToStr(vgdAutGpoMon) + #9 +
                               Format(CFORMAT_DINERO,[vgdTotGpoMon]);
                sgcData.AddTexto(sTotGpoMon, tcLeft, clMaroon, 15);
            End;

            //Inicializa con los nuevos datos del siguiente grupo
            vgsCveMon := DataSet.FieldByName('CVE_MONEDA').AsString;
            sDescMon := DataSet.FieldByName('DESC_MONEDA').AsString;
            vgsTpoMovto := DataSet.FieldByName('TIPO_MOVTO').AsString;
            vgsPlazoMax := DataSet.FieldByName('PLAZO_MAX_DISP').AsString;

            sgcData.AddTexto('Moneda: ' + vgsCveMon + '    ' + sDescMon, tcLeft, clMaroon, 15);
            sgcData.AddTexto('      Tipo de Movimiento: ' + vgsTpoMovto, tcLeft, clMaroon, 15);
            sgcData.AddTexto('            Plazo Máximo: ' + vgsPlazoMax, tcLeft, clMaroon, 15);

            vgdAutGpoMon := DataSet.FieldByName('NUM_AUTOR').AsInteger;
            vgdAutGpoMovto := DataSet.FieldByName('NUM_AUTOR').AsInteger;
            vgsAutPlazoMax := DataSet.FieldByName('NUM_AUTOR').AsInteger;

            vgsTotPlazoMax := DataSet.FieldByName('IMP_DISPUESTO').AsFloat;
            vgdTotGpoMovto := DataSet.FieldByName('IMP_DISPUESTO').AsFloat;
            vgdTotGpoMon := DataSet.FieldByName('IMP_DISPUESTO').AsFloat;
        End Else Begin
            vgdAutGpoMon := vgdAutGpoMon + DataSet.FieldByName('NUM_AUTOR').AsInteger;
            vgdTotGpoMon := vgdTotGpoMon + DataSet.FieldByName('IMP_DISPUESTO').AsFloat;

            If (vgsTpoMovto <> DataSet.FieldByName('TIPO_MOVTO').AsString) Then Begin
                sTotPlazoMax := '            Total por Plazo Máximo a Disponer: ' +
                                 #9#9 + IntToStr(vgsAutPlazoMax) + #9 +
                                 Format(CFORMAT_DINERO,[vgsTotPlazoMax]);
                sgcData.AddTexto(sTotPlazoMax, tcLeft, clMaroon, 15);
                sTotGpoMovto := '      Total por Tipo de Movimiento: ' +
                                 #9#9 + IntToStr(vgdAutGpoMovto) + #9 +
                                 Format(CFORMAT_DINERO,[vgdTotGpoMovto]);
                sgcData.AddTexto(sTotGpoMovto, tcLeft, clMaroon, 15);

                //Inicializa con los nuevos datos del siguiente grupo
                vgdAutGpoMovto := DataSet.FieldByName('NUM_AUTOR').AsInteger;
                vgsAutPlazoMax := DataSet.FieldByName('NUM_AUTOR').AsInteger;

                vgsTpoMovto := DataSet.FieldByName('TIPO_MOVTO').AsString;
                vgsPlazoMax := DataSet.FieldByName('PLAZO_MAX_DISP').AsString;

                sgcData.AddTexto('      Tipo de Movimiento: ' + vgsTpoMovto, tcLeft, clMaroon, 15);
                sgcData.AddTexto('            Plazo Máximo: ' + vgsPlazoMax, tcLeft, clMaroon, 15);

                vgdTotGpoMovto := DataSet.FieldByName('IMP_DISPUESTO').AsFloat;
                vgsTotPlazoMax := DataSet.FieldByName('IMP_DISPUESTO').AsFloat;
            End Else Begin
                vgdAutGpoMovto := vgdAutGpoMovto + DataSet.FieldByName('NUM_AUTOR').AsInteger;
                vgdTotGpoMovto := vgdTotGpoMovto + DataSet.FieldByName('IMP_DISPUESTO').AsFloat;

                If (vgsPlazoMax <> DataSet.FieldByName('PLAZO_MAX_DISP').AsString) Then Begin
                    sTotPlazoMax := '            Total por Plazo Máximo a Disponer: ' +
                                 #9#9 + IntToStr(vgsAutPlazoMax) + #9 +
                                     Format(CFORMAT_DINERO,[vgsTotPlazoMax]);
                    sgcData.AddTexto(sTotPlazoMax, tcLeft, clMaroon, 15);

                    //Inicializa con los nuevos datos del siguiente grupo
                    vgsAutPlazoMax := DataSet.FieldByName('NUM_AUTOR').AsInteger;

                    vgsPlazoMax := DataSet.FieldByName('PLAZO_MAX_DISP').AsString;

                    sgcData.AddTexto('            Plazo Máximo: ' + vgsPlazoMax, tcLeft, clMaroon, 15);

                    vgsTotPlazoMax := DataSet.FieldByName('IMP_DISPUESTO').AsFloat;
                End Else Begin
                    vgsAutPlazoMax := vgsAutPlazoMax + DataSet.FieldByName('NUM_AUTOR').AsInteger;
                    vgsTotPlazoMax := vgsTotPlazoMax + DataSet.FieldByName('IMP_DISPUESTO').AsFloat;
                End;
            End;
        End;
    End;

    If (RowCaso = rcQueryEnd) Then Begin      //Valida fin de Query
        sTotPlazoMax := '            Total por Plazo Máximo a Disponer: ' +
                         #9#9 + IntToStr(vgsAutPlazoMax) + #9 + Format(CFORMAT_DINERO,[vgsTotPlazoMax]);
        sgcData.AddTexto(sTotPlazoMax, tcLeft, clMaroon, 15);
        sTotGpoMovto := '      Total por Tipo de Movimiento: ' +
                         #9#9 + IntToStr(vgdAutGpoMovto) + #9 +  Format(CFORMAT_DINERO,[vgdTotGpoMovto]);
        sgcData.AddTexto(sTotGpoMovto, tcLeft, clMaroon, 15);
        sTotGpoMon := 'Total por Moneda: ' +
                         #9#9 + IntToStr(vgdAutGpoMon) + #9 + Format(CFORMAT_DINERO,[vgdTotGpoMon]);
        sgcData.AddTexto(sTotGpoMon, tcLeft, clMaroon, 15);
    End;
end;

end.
