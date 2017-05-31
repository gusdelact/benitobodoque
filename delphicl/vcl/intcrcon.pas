// Sistema         : Clase de Contrato, Sistema de Credito
// Fecha de Inicio : 3 de Marzo de 1998
// Función forma   : Clase
// Desarrollo por  : Benjamin Hernandez Delsordo
// Comentarios     :
unit IntCrCon;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun, Menus, ComCtrls, IntDtPk,
  DBCtrls, InterEdit, UCRPE32, IntCrCoo, UnCrPack, IntTasIndFin
  ;

type

  TCrCon = Class;
  TWCrCon = class(TForm)
    InterForma1: TInterForma;
    pumDestino: TPopupMenu;
    Catlogo1: TMenuItem;
    pumGarantia: TPopupMenu;
    Catlogo2: TMenuItem;
    bbGarantias: TBitBtn;
    pumSegmento: TPopupMenu;
    catlogo4: TMenuItem;
    pumSubtipoBco: TPopupMenu;
    Catlogo5: TMenuItem;
    bbReporte: TBitBtn;
    rgSituacion: TRadioGroup;
    edNombre: TEdit;
    edIdCtoLiq: TEdit;
    edIdContrato: TEdit;
    lbIdContrato: TLabel;
    lbIdCtoLiq: TLabel;
    lbNombre: TLabel;
    PageControl1: TPageControl;
    ts2: TTabSheet;
    gbDatos: TGroupBox;
    lbComiteAut: TLabel;
    lbCveDestino: TLabel;
    lbCveGarantia: TLabel;
    lbCveOrigenRec: TLabel;
    lbFactProporGar: TLabel;
    lbFEntregaRecur: TLabel;
    sbCveDestino: TSpeedButton;
    sbCveOrigen: TSpeedButton;
    sbCveGarantia: TSpeedButton;
    lbTxCondGrales: TLabel;
    sbCVE_CLASIF_CNBV: TSpeedButton;
    lbCVE_CLASIF_CNBV: TLabel;
    lbFAutCredito: TLabel;
    lbCVE_CLASIF_SHCP: TLabel;
    sbCVE_CLASIF_SHCP: TSpeedButton;
    edComiteAut: TEdit;
    edFEntregaRecur: TEdit;
    edFactProporGar: TEdit;
    edDescDestino: TEdit;
    edDescGarantia: TEdit;
    edDescOrigen: TEdit;
    dtpFEntregaRecur: TInterDateTimePicker;
    edTxCondGrales: TEdit;
    edCVE_CLASIF_CNBV: TEdit;
    edFAutCredito: TEdit;
    edCVE_CLASIF_SHCP: TEdit;
    ts1: TTabSheet;
    lbDiasPlazo: TLabel;
    lbFVencimiento: TLabel;
    lbNumAmpliacion: TLabel;
    lbFAutComite: TLabel;
    edDiasPlazo: TEdit;
    edFVencimiento: TEdit;
    edNumAmpliacion: TEdit;
    edFAutComite: TEdit;
    dtpFAutComite: TInterDateTimePicker;
    ts3: TTabSheet;
    GroupBox3: TGroupBox;
    lbImpTransito: TLabel;
    lbImpDispuesto: TLabel;
    lbImpAutorizado: TLabel;
    lbImpDisponer: TLabel;
    edImpDispuesto: TInterEdit;
    edImpTransito: TInterEdit;
    edImpDisponer: TInterEdit;
    edImpAutorizado: TInterEdit;
    gbNaturaleza: TGroupBox;
    cbEventual: TComboBox;
    cbRevolvente: TComboBox;
    GroupBox1: TGroupBox;
    edCveSubTipoBanco: TEdit;
    sbCveSubTipoBanco: TSpeedButton;
    lbStBanco: TLabel;
    edCveSubTipocnbv: TEdit;
    lbStcnbv: TLabel;
    edMoneda: TEdit;
    lbMoneda: TLabel;
    edProducto: TEdit;
    lbProducto: TLabel;
    gbTasa: TGroupBox;
    lbCVE_TASA_REFER: TLabel;
    sbCVE_TASA_REFER: TBitBtn;
    edCVE_TASA_REFER: TEdit;
    edVALOR_TASA: TInterEdit;
    gbSobretasa: TGroupBox;
    rgOPERADOR_STASA: TRadioGroup;
    edSOBRETASA: TInterEdit;
    edTASA_REAL: TInterEdit;
    Label1: TLabel;
    edDiasTolerancia: TEdit;
    bbCancelar: TBitBtn;
    bbAmpliar: TBitBtn;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1Buscar(Sender : TObject);
    procedure bbReporteClick(Sender: TObject);
    procedure Catlogo1Click(Sender: TObject);
    procedure Catlogo2Click(Sender: TObject);
    procedure Catlogo3Click(Sender: TObject);
    procedure sbCveDestinoClick(Sender: TObject);
    procedure sbCveGarantiaClick(Sender: TObject);
    procedure sbCveOrigenClick(Sender: TObject);
    procedure bbGarantiasClick(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure cbEventualChange(Sender: TObject);
    procedure cbRevolventeChange(Sender: TObject);
    procedure sbCVE_CLASIF_CNBVClick(Sender: TObject);
    procedure sbCveSubTipoBancoClick(Sender: TObject);
    procedure Catlogo5Click(Sender: TObject);
    procedure sbCVE_CLASIF_SHCPClick(Sender: TObject);
    procedure InterForma1CanEdit(Sender: TObject; CanEdit: Boolean);
    procedure edDiasPlazoExit(Sender: TObject);
    procedure dtpFAutComiteChange(Sender: TObject);
    procedure edFAutComiteExit(Sender: TObject);
    procedure bbAmpliarClick(Sender: TObject);
    procedure bbCancelarClick(Sender: TObject);
    procedure edImpAutorizadoExit(Sender: TObject);
    procedure InterForma1AntesModificar(Sender: TObject;
      var Realizado: Boolean);
    procedure sbCVE_TASA_REFERClick(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Objeto : TCrCon;
  end;

  TCrCon = class(TCrCoo)
  private
  protected
  public
    V_AMPLIACION             : TInterCampo;
    Paquete                  : TCrPack;
    Tasa                     : TTasIndFin;
    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    procedure   OnDespuesNuevo (Sender : TObject; Modo : TModo; Proceso : Integer; Frame : Tinterframe);
    function    Reporte:Boolean; override;
    procedure   DataBaseChange; override;
{
    function    Disponer (Monto : double) : boolean;
    function    Transitar (Monto : double) : boolean;
    function    Cancelar (Monto : double) : boolean;
}
  published
  end;

implementation

uses
  IntCrCGa, IntCrCoR, IntCrMsg;

{$R *.DFM}

constructor TCrCon.Create( AOwner : TComponent );
begin
  inherited Create(AOwner);
      V_AMPLIACION :=CreaCampo('V_AMPLIACION',ftInteger,tsNinguno,tsNinguno,False);

      Paquete := TCrPack.Create(self);

      Tasa := TTasIndFin.Create(Self);
      Tasa.MasterSource := Self;
      Tasa.FieldByName('CVE_TASA_INDICAD').MasterField := 'CVE_TASA_REFER';
      Tasa.BuscaWhereString := 'TIPO_TASA_INDIC = ''MK'' AND B_TASA_CREDITO = ''V''';
end;

destructor TCrCon.Destroy;
begin
  if Paquete <> nil then Paquete.Free;
  if Tasa <> nil then Tasa.Free;
  inherited Destroy;
end;

procedure TCrCon.DataBaseChange;
begin
  inherited;
  Paquete.Apli := Apli;
end;

procedure  TCrCon.OnDespuesNuevo (Sender : TObject; Modo : TModo; Proceso : Integer; Frame : Tinterframe);
begin
  if (Frame.Active) and (Modo = moAppend) then
  begin
    Apli := Frame.Apli; GetParams(Frame);
    FindKey([Frame.FieldbyName('ID_CONTRATO').asString]);
    if SIT_LINEA.AsString = 'PA' then
    begin
      Modifica;
    end;
  end;
end;

function TCrCon.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCon;
begin
   W:=TWCrCon.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.Interforma1.ShowBtnNuevo := False;
      W.InterForma1.ShowBtnEliminar := False;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

function TCrCon.Reporte:Boolean;
var Reporte: TCrCoR;
begin
  Reporte:= TCrCoR.Create(Self);
  try
    Reporte.IsCheckSecu := False;
    Reporte.Apli := Apli;
    if Active then
      begin
        Reporte.RANGO.AsString := 'ES';
        Reporte.SIT_LINEA.AsString := 'TO';
        Reporte.CreContrato1.FindKey([ID_CONTRATO.AsInteger]);
        Reporte.CreContrato2.FindKey([ID_CONTRATO.AsInteger]);
        Reporte.Catalogo;
     end;
   finally
      Reporte.Free;
   end;
end;

(***********************************************FORMA TEMPLATE*******************)
(*                                                                              *)
(*  FORMA TEMPLATE                                                              *)
(*                                                                              *)
(***********************************************FORMA TEMPLATE*******************)

procedure TWCrCon.FormShow(Sender: TObject);
begin
   Objeto.B_EVENTUAL.Control := cbEventual;
   Objeto.B_REVOLVENTE.Control := cbRevolvente;
   Objeto.COMITE_AUT.Control := edComiteAut;
   Objeto.DIAS_PLAZO.Control := edDiasPlazo;
   Objeto.FACT_PROPOR_GAR.Control := edFactProporGar;
   Objeto.F_AUT_COMITE.Control := edFAutComite;
   Objeto.F_AUT_CREDITO.Control := edFAutCredito;
   Objeto.F_ENTREGA_RECUR.Control := edFEntregaRecur;
   Objeto.IMP_AUTORIZADO.Control := edImpAutorizado;
   Objeto.IMP_DISPUESTO.Control := edImpDispuesto;
   Objeto.IMP_TRANSITO.Control := edImpTransito;
   Objeto.NUM_AMPLIACION.Control := edNumAmpliacion;
   Objeto.TX_COND_GRALES.Control := edTxCondGrales;
   Objeto.SIT_LINEA.Control := rgSituacion;
   Objeto.OPERADOR_STASA.Control := rgOPERADOR_STASA;
   Objeto.SOBRETASA.Control := edSOBRETASA;
   Objeto.DIAS_TOLERANCIA.Control := edDiasTolerancia;

   Objeto.F_VENCIMIENTO.Control := edFVencimiento;
   objeto.IMP_DISPONER.Control := edImpDisponer;

   Objeto.Garantia.DESC_GARANTIA.Control := edDescGarantia;
   Objeto.Garantia.MasterSourceEditControl := sbCveGarantia;

   Objeto.Destino.DESC_DESTINO.Control := edDescDestino;
   Objeto.Destino.MasterSourceEditControl := sbCveDestino;

   Objeto.Origen.DESC_ORIGEN_REC.Control := edDescOrigen;
   Objeto.Origen.MasterSourceEditControl := sbCveOrigen;

   Objeto.ClasifCNBV.DESC_TIPO_CLASIF.Control := edCve_Clasif_CNBV;
   Objeto.ClasifCNBV.MasterSourceEditControl := sbCve_Clasif_CNBV;

   Objeto.ClasifSHCP.DESC_TIPO_CLASIF.Control := edCve_Clasif_SHCP;
   Objeto.ClasifSHCP.MasterSourceEditControl := sbCve_Clasif_SHCP;

   Objeto.SubtipoBanco.SubtipoCNBV.DESC_SUB_TIPO.Control := edCveSubTipocnbv;
   Objeto.SubtipoBanco.DESC_SUB_TIPO.Control := edCveSubTipoBanco;
   Objeto.SubtipoBanco.MasterSourceEditControl := sbCveSubTipoBanco;

   Objeto.Contrato.ID_Contrato.Control := edIdContrato;
   Objeto.Contrato.Titular.Nombre.Control := edNombre;
   Objeto.Contrato.Producto.Desc_Producto.Control := edProducto;
   Objeto.Contrato.Producto.Moneda.Desc_Moneda.Control := edMoneda;
//   Objeto.Contrato.MasterSourceEditControl := sbPrContrato;
   Objeto.Tasa.CVE_TASA_INDICAD.Control := edCVE_TASA_REFER;
   Objeto.Tasa.MasterSourceEditControl := sbCVE_TASA_REFER;
end;

procedure TWCrCon.FormDestroy(Sender: TObject);
begin
   Objeto.B_EVENTUAL.Control := nil;
   Objeto.B_REVOLVENTE.Control := nil;
   Objeto.COMITE_AUT.Control := nil;
   Objeto.DIAS_PLAZO.Control := nil;
   Objeto.FACT_PROPOR_GAR.Control := nil;
   Objeto.F_AUT_COMITE.Control := nil;
   Objeto.F_AUT_CREDITO.Control := nil;
   Objeto.F_ENTREGA_RECUR.Control := nil;
   Objeto.IMP_AUTORIZADO.Control := nil;
   Objeto.IMP_DISPUESTO.Control := nil;
   Objeto.IMP_TRANSITO.Control := nil;
   Objeto.NUM_AMPLIACION.Control := nil;
   Objeto.TX_COND_GRALES.Control := nil;
   Objeto.SIT_LINEA.Control := nil;
   Objeto.OPERADOR_STASA.Control := nil;
   Objeto.SOBRETASA.Control := nil;
   Objeto.DIAS_TOLERANCIA.Control := nil;

   Objeto.F_VENCIMIENTO.Control := nil;
   objeto.IMP_DISPONER.Control := nil;

   Objeto.Garantia.DESC_GARANTIA.Control := nil;
   Objeto.Garantia.MasterSourceEditControl := nil;

   Objeto.Destino.DESC_DESTINO.Control := nil;
   Objeto.Destino.MasterSourceEditControl := nil;

   Objeto.Origen.DESC_ORIGEN_REC.Control := nil;
   Objeto.Origen.MasterSourceEditControl := nil;

   Objeto.ClasifCNBV.DESC_TIPO_CLASIF.Control := nil;
   Objeto.ClasifCNBV.MasterSourceEditControl := nil;

   Objeto.ClasifSHCP.DESC_TIPO_CLASIF.Control := nil;
   Objeto.ClasifSHCP.MasterSourceEditControl := nil;

   Objeto.SubtipoBanco.SubtipoCNBV.DESC_SUB_TIPO.Control := nil;
   Objeto.SubtipoBanco.DESC_SUB_TIPO.Control := nil;
   Objeto.SubtipoBanco.MasterSourceEditControl := nil;

   Objeto.Contrato.ID_Contrato.Control := nil;
   Objeto.Contrato.Titular.Nombre.Control := nil;
   Objeto.Contrato.Producto.Desc_Producto.Control := nil;
   Objeto.Contrato.Producto.Moneda.Desc_Moneda.Control := nil;

   Objeto.Tasa.CVE_TASA_INDICAD.Control := nil;
   Objeto.Tasa.MasterSourceEditControl := nil;
end;

procedure TWCrCon.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TWCrCon.InterForma1Buscar(Sender: TObject);
begin
  if Objeto.Busca then
  begin
    if Objeto.SIT_LINEA.AsString = 'PA' then
      Objeto.Modifica;
  end;
end;

procedure TWCrCon.bbReporteClick(Sender: TObject);
begin
  Objeto.Reporte;
end;

procedure TWCrCon.Catlogo1Click(Sender: TObject);
begin
  objeto.Destino.Catalogo;
end;

procedure TWCrCon.Catlogo2Click(Sender: TObject);
begin
  Objeto.Garantia.Catalogo;
end;

procedure TWCrCon.Catlogo3Click(Sender: TObject);
begin
  Objeto.Origen.Catalogo;
end;

procedure TWCrCon.sbCveDestinoClick(Sender: TObject);
begin
  Objeto.Destino.Busca;
end;

procedure TWCrCon.sbCveGarantiaClick(Sender: TObject);
begin
  Objeto.Garantia.Busca;
end;

procedure TWCrCon.sbCveOrigenClick(Sender: TObject);
begin
  Objeto.Origen.Busca;
end;

procedure TWCrCon.bbGarantiasClick(Sender: TObject);
var
  Garantias : TCrCGa;
  Q : TQuery;
begin
  if Objeto.Active then
  begin
    Garantias := TCrCGa.Create(Self);
    Garantias.GetParams(Objeto);
    Garantias.Autorizacion := Objeto;
    Garantias.BuscaWhereString := '(CRE_CONT_GARANT.ID_CONTRATO =' + Objeto.ID_CONTRATO.AsString + ')';
    Q := GetSQLQuery('SELECT ID_CONTRATO, FOLIO_GARANTIA FROM CRE_CONT_GARANT WHERE ID_CONTRATO = ' + Objeto.ID_CONTRATO.AsString, Objeto.DataBaseName, Objeto.SessionName,false);
    if Q <> nil then
    begin
      try Garantias.FindKey([Q.FieldByName('ID_CONTRATO').AsInteger,Q.FieldByName('FOLIO_GARANTIA').AsInteger]);
      finally Q.Free;
      end;
    end;
    Garantias.Catalogo;
    Garantias.Free;
  end
  else
  begin raise EInterFrame.Create('No existe una autorización de crédito activa');
  end;
end;

procedure TWCrCon.InterForma1DespuesAceptar(Sender: TObject);
var
  Q : TQuery;
  Chequera : integer;
  CodRes : integer;
begin
  if (Objeto.Active) and (Objeto.SIT_LINEA.AsString = 'PA') then
  begin
    Chequera := 309900180;
    ProcesoCredito(-1,'Activando autorización');
    try
      InsertaTransaccion(0, Objeto.ID_CONTRATO.AsInteger, 0, Objeto.Apli.DameFechaEmpresa, 0, Objeto.IMP_AUTORIZADO.AsFloat, 0, 0, 'CALTLI', Objeto.Apli.DameFechaEmpresa, Objeto.IMP_AUTORIZADO.AsFloat, 'ALTA DE LINEA', '', 0, 0, Objeto, False, True);
    except
      ProcesoCredito(101,'Activando autorización');
      raise EInterframe.Create('La autorizacion no ha sido efectuada');
      Exit;
    end;
    //Asignación inicial de contrato de depósitos a la vista
    ProcesoCredito(30,'Activando autorización');
    if (Objeto.NUM_AMPLIACION.AsInteger = 0) then
      begin
        try
          Q := GetSQLQuery('SELECT C.ID_CTO_LIQ CHEQUERA '+
                           'FROM CONTRATO C '+
                           'WHERE '+
                           'C.CVE_TIP_CONTRATO = ''CRED'' AND '+
                           'C.ID_CONTRATO <> '+ Objeto.ID_CONTRATO.AsSQL +' AND '+
                           'C.ID_CTO_LIQ IS NOT NULL AND '+
                           '(C.CVE_PRODUCTO , C.ID_TITULAR) IN '+
                           '              (SELECT C.CVE_PRODUCTO, C.ID_TITULAR '+
                           '               FROM CONTRATO C WHERE '+
                           '               C.ID_CONTRATO = '+ Objeto.ID_CONTRATO.AsSQL +') '+
                           'ORDER BY C.ID_CONTRATO DESC',
                            Objeto.DataBaseName,Objeto.SessionName,false);
          if Q <> nil then
            begin
              if Q.FieldByName('CHEQUERA').AsString <> '' then
                Chequera := Q.FieldByName('CHEQUERA').AsInteger;
              Q.Free;
              Q := nil;
            end
          else
            begin
              Q := GetSQLQuery('SELECT C.ID_CTO_LIQ CHEQUERA ' +
                               'FROM CONTRATO C '     +
                               'WHERE C.CVE_TIP_CONTRATO = ''CRED'' ' +
                               'AND C.ID_TITULAR = ' + Objeto.Contrato.ID_TITULAR.AsSQL + ' ' +
                               'AND C.ID_CTO_LIQ IS NOT NULL '+
                               'ORDER BY C.ID_CONTRATO DESC',Objeto.DataBaseName,Objeto.SessionName,false);
              if Q <> nil then
                begin
                  if Q.FieldByName('CHEQUERA').AsString <> '' then
                    Chequera := Q.FieldByName('CHEQUERA').AsInteger;
                  Q.Free;
                  Q := nil;
                end
              else
                begin
                  Q := GetSQLQuery('SELECT C.ID_CONTRATO CHEQUERA '+
                                   'FROM CONTRATO C '+
                                   'WHERE '+
                                   'C.ID_TITULAR IN '+
                                   '              (SELECT C.ID_TITULAR '+
                                   '               FROM   CONTRATO C WHERE '+
                                   '               C.ID_CONTRATO = '+ Objeto.ID_CONTRATO.AsSQL +') AND '+
                                   'C.CVE_TIP_CONTRATO = ''CDVI'' '+
                                   'ORDER BY ROWID DESC',
                                    Objeto.DataBaseName,Objeto.SessionName,false);
                  if Q <> nil then
                    begin
                      if Q.FieldByName('CHEQUERA').AsString <> '' then
                        Chequera := Q.FieldByName('CHEQUERA').AsInteger;
                        Q.Free;
                        Q := nil;
                    end
                  else
                    begin
                      Chequera := 309900180;
                    end; //Ultimo intento
                end; //Tercer Intento
            end;  //Segundo Intento
          if Objeto.CVE_SUB_TIP_BCO.AsInteger = 118 then Chequera := 300027790
          else if Objeto.CVE_SUB_TIP_BCO.AsInteger = 119 then Chequera := 300027804
               else if Objeto.CVE_SUB_TIP_BCO.AsInteger = 120 then Chequera := 300027812
                     else if Objeto.CVE_SUB_TIP_BCO.AsInteger = 121 then Chequera := 300027820;
        finally
          if Q <> nil then Q.Free;
        end;
        ProcesoCredito(60,'Activando autorización');
        Objeto.Contrato.Edit;
        Objeto.Contrato.Id_Cto_Liq.AsInteger := Chequera;
        Objeto.Contrato.Post;
        ProcesoCredito(80,'Activando autorización');
        Objeto.Edit;
        Objeto.SIT_LINEA.AsString := 'AC';
        Objeto.Post;
      end; //Asignación de Chequeras
  end;
  ProcesoCredito(101,'Activando autorización');
  Objeto.V_AMPLIACION.AsInteger := 0;
end;

procedure TWCrCon.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
var
  vPlazo : Integer;
  Q : TQuery;
begin
  Realizado:=False;
  if (Objeto.Modo = moEdit) then
  begin
    Objeto.IMP_AUTORIZADO.GetFromControl;
    if (Objeto.IMP_AUTORIZADO.AsFloat <= 0) then
    begin
      MessageDlg('El importe autorizado debe ser mayor a cero',mtError,[mbOK],0);
      Exit;
    end;
  end;
  if (Objeto.Modo = moEdit) and (Objeto.V_AMPLIACION.AsInteger = -1) then
  begin
    Objeto.CVE_USU_AUTORIZA.AsString := Objeto.Apli.Usuario;
    if (Objeto.B_REVOLVENTE.AsString = 'F') and (cbRevolvente.ItemIndex = 1) and (Objeto.SIT_LINEA.AsString = 'AC') and (Objeto.NUM_AMPLIACION.AsInteger >= 0) then
      try
        Q := GetSQLQuery('SELECT SUM(IMP_CREDITO) IMP_CREDITO FROM CRE_CREDITO WHERE ID_CONTRATO = ' + objeto.ID_CONTRATO.AsString + ' AND SIT_CREDITO IN (''AC'',''PA'') GROUP BY ID_CONTRATO', Objeto.DataBaseName,Objeto.SessionName,false);
        if Q <> nil then
          if (Q.FieldByName('IMP_CREDITO').AsInteger <> 0) and (not Q.EOF) then
          begin
            Objeto.IMP_LIQUIDADO.AsFloat := Q.FieldByName('IMP_CREDITO').AsFloat;
            Objeto.IMP_DISPUESTO.AsFloat := Objeto.IMP_DISPUESTO.AsFloat - Objeto.IMP_LIQUIDADO.AsFloat;
            Objeto.IMP_AUTORIZADO.AsFloat := Objeto.IMP_AUTORIZADO.AsFloat + Objeto.IMP_LIQUIDADO.AsFloat;
          end
          else
          begin
            Objeto.IMP_LIQUIDADO.AsFloat := 0;
          end;
        finally
          Q.Free;
        end;
    end;
  Realizado:=True;
end;

procedure TWCrCon.cbEventualChange(Sender: TObject);
begin
  if (cbEventual.ItemIndex = 1) and not (Objeto.CVE_GARANTIA.AsString = 'CBUR') then
    cbRevolvente.ItemIndex := 0;
  if (cbEventual.ItemIndex = 1) then
  begin
    Objeto.DIAS_TOLERANCIA.AsInteger := 0;
    edDiasTolerancia.ReadOnly := True;
    edDiasTolerancia.Color := clMenu;
  end
  else
  begin
    Objeto.DIAS_TOLERANCIA.AsInteger := 28;  
    edDiasTolerancia.ReadOnly := False;
    edDiasTolerancia.Color := clWindow;
  end;
end;

procedure TWCrCon.cbRevolventeChange(Sender: TObject);
begin
  if (cbRevolvente.ItemIndex = 1) and not (Objeto.CVE_GARANTIA.AsString = 'CBUR') then
  begin
    cbEventual.ItemIndex := 0;
    cbEventualChange(nil);
  end;
end;

procedure TWCrCon.sbCVE_CLASIF_CNBVClick(Sender: TObject);
begin
  Objeto.ClasifCNBV.Busca;
end;

procedure TWCrCon.sbCveSubTipoBancoClick(Sender: TObject);
begin
  if Objeto.Active then
  begin
    Objeto.SubtipoBanco.SubtipoCNBV.TipoCredito.BuscaWhereString := 'CRE_TIPO_CREDITO.CVE_TIPO_CREDITO IN (SELECT CVE_TIPO_CREDITO FROM CRE_PRODUCTO WHERE CVE_PRODUCTO = ' + '''' + Objeto.Contrato.Cve_Producto.AsString + '''' + ')';
    Objeto.SubtipoBanco.SubtipoCNBV.BuscaWhereString := 'CRE_SUB_TIP_CNBV.CVE_SUB_TIP_CNBV IN (SELECT CRE_SUB_TIP_CNBV.CVE_SUB_TIP_CNBV FROM CRE_SUB_TIP_CNBV, CRE_PRODUCTO WHERE CRE_SUB_TIP_CNBV.CVE_TIPO_CREDITO = CRE_PRODUCTO.CVE_TIPO_CREDITO AND CRE_PRODUCTO.CVE_PRODUCTO = ' + '''' + Objeto.Contrato.Cve_Producto.AsString + '''' + ')';
    Objeto.SubtipoBanco.BuscaWhereString := 'CRE_SUB_TIP_BCO.CVE_SUB_TIP_BCO IN (SELECT SB.CVE_SUB_TIP_BCO FROM CRE_SUB_TIP_BCO SB, CRE_SUB_TIP_CNBV SC, CRE_PRODUCTO TC WHERE SB.CVE_SUB_TIP_CNBV = SC.CVE_SUB_TIP_CNBV AND SC.CVE_TIPO_CREDITO = TC.CVE_TIPO_CREDITO AND TC.CVE_PRODUCTO = ' + '''' + Objeto.Contrato.Cve_Producto.AsString + '''' + ')';
  end;
    Objeto.SubtipoBanco.Busca;
end;

procedure TWCrCon.Catlogo5Click(Sender: TObject);
begin
  if Objeto.Active then
  begin
    Objeto.SubtipoBanco.SubtipoCNBV.TipoCredito.BuscaWhereString := 'CRE_TIPO_CREDITO.CVE_TIPO_CREDITO IN (SELECT CVE_TIPO_CREDITO FROM CRE_PRODUCTO WHERE CVE_PRODUCTO = ' + '''' + Objeto.Contrato.Cve_Producto.AsString + '''' + ')';
    Objeto.SubtipoBanco.SubtipoCNBV.BuscaWhereString := 'CRE_SUB_TIP_CNBV.CVE_SUB_TIP_CNBV IN (SELECT CRE_SUB_TIP_CNBV.CVE_SUB_TIP_CNBV FROM CRE_SUB_TIP_CNBV, CRE_PRODUCTO WHERE CRE_SUB_TIP_CNBV.CVE_TIPO_CREDITO = CRE_PRODUCTO.CVE_TIPO_CREDITO AND CRE_PRODUCTO.CVE_PRODUCTO = ' + '''' + Objeto.Contrato.Cve_Producto.AsString + '''' + ')';
    Objeto.SubtipoBanco.BuscaWhereString := 'CRE_SUB_TIP_BCO.CVE_SUB_TIP_BCO IN (SELECT SB.CVE_SUB_TIP_BCO FROM CRE_SUB_TIP_BCO SB, CRE_SUB_TIP_CNBV SC, CRE_PRODUCTO TC WHERE SB.CVE_SUB_TIP_CNBV = SC.CVE_SUB_TIP_CNBV AND SC.CVE_TIPO_CREDITO = TC.CVE_TIPO_CREDITO AND TC.CVE_PRODUCTO = ' + '''' + Objeto.Contrato.Cve_Producto.AsString + '''' + ')';
  end;
    Objeto.SubtipoBanco.Catalogo;
end;

procedure TWCrCon.sbCVE_CLASIF_SHCPClick(Sender: TObject);
begin
  Objeto.ClasifSHCP.Busca;
end;

procedure TWCrCon.InterForma1CanEdit(Sender: TObject; CanEdit: Boolean);
begin
  if CanEdit then
  begin
    if Objeto.Active then
    begin
      if (Objeto.Modo = moEdit) then
      begin
        if (Objeto.SIT_LINEA.AsString = 'PA') then
        begin
          sbCveSubTipoBanco.Enabled := True;
          cbEventual.Enabled := True;
          cbRevolvente.Enabled := True;
          dtpFAutComite.Enabled := True;
          edFAutComite.ReadOnly := False;
          edFAutComite.Color := clWindow;
          edDiasPlazo.ReadOnly := False;
          edDiasPlazo.Color := clWindow;
          dtpFEntregaRecur.Enabled := True;
          edFEntregaRecur.ReadOnly := False;
          edFEntregaRecur.Color := clWindow;
          edFactProporGar.ReadOnly := False;
          edFactProporGar.Color := clWindow;
          edTxCondGrales.ReadOnly := False;
          edTxCondGrales.Color := clWindow;
          edComiteAut.ReadOnly := False;
          edComiteAut.Color := clWindow;
          sbCveDestino.Enabled := True;
          sbCveOrigen.Enabled := True;
          sbCveGarantia.Enabled := True;
          sbCVE_CLASIF_CNBV.Enabled :=  True;
          sbCVE_CLASIF_SHCP.Enabled := True;
          edImpAutorizado.Readonly := False;
          edImpAutorizado.Color := clWindow;
          edSOBRETASA.ReadOnly := False;
          edSOBRETASA.Color := clWindow;
          sbCVE_TASA_REFER.Enabled := True;
          rgOPERADOR_STASA.Enabled := True;
          edDiasTolerancia.ReadOnly := False;
          edDiasTolerancia.Color := clWindow;
        end
      else
        begin
          sbCveSubTipoBanco.Enabled := False;
          cbEventual.Enabled := False;
          cbRevolvente.Enabled := False;
          dtpFAutComite.Enabled := False;
          edFAutComite.ReadOnly := True;
          edFAutComite.Color := clMenu;
          edDiasPlazo.ReadOnly := True;
          edDiasPlazo.Color := clMenu;
          dtpFEntregaRecur.Enabled := False;
          edFEntregaRecur.ReadOnly := True;
          edFEntregaRecur.Color := clMenu;
          edFactProporGar.ReadOnly := True;
          edFactProporGar.Color := clMenu;
          edTxCondGrales.ReadOnly := True;
          edTxCondGrales.Color := clMenu;
          edComiteAut.ReadOnly := True;
          edComiteAut.Color := clMenu;
          sbCveDestino.Enabled := False;
          sbCveOrigen.Enabled := False;
          sbCveGarantia.Enabled := False;
          sbCVE_CLASIF_CNBV.Enabled :=  False;
          sbCVE_CLASIF_SHCP.Enabled := False;
          edImpAutorizado.Readonly := True;
          edImpAutorizado.Color := clMenu;
          edSOBRETASA.ReadOnly := True;
          edSOBRETASA.Color := clMenu;
          sbCVE_TASA_REFER.Enabled := False;
          rgOPERADOR_STASA.Enabled := False;
          edDiasTolerancia.ReadOnly := True;
          edDiasTolerancia.Color := clMenu;
          if (Objeto.V_AMPLIACION.AsInteger = -1) then
          begin
            edDiasPlazo.Color := clWindow;
            edDiasPlazo.ReadOnly := False;
            edImpAutorizado.Color := clWindow;
            edImpAutorizado.ReadOnly := False;
            edComiteAut.ReadOnly := False;
            edComiteAut.Color := clWindow;
//Modificación del 16/11/98
//            if Objeto.CVE_GARANTIA.AsString = 'CBUR' then
//            begin
            edSOBRETASA.ReadOnly := False;
            edSOBRETASA.Color := clWindow;
//            end;
          end;
         end;
      end;
    end;
  end;

end;


procedure TWCrCon.edDiasPlazoExit(Sender: TObject);
var
  vplazo : integer;
  vFVencimiento : TDateTime;
begin
  if (Objeto.Active) and (InterForma1.CanEdit) then
  begin
    vplazo := StrtoInt(edDiasPlazo.Text);
    if vPlazo <= 0 then
    begin
      MessageDlg('El plazo debe ser por lo menos de un dia',mtError,[mbOK],0);
      InterForma1.ShowError:=False;
      Exit;
    end
    else
    begin
      vFVencimiento := Trunc(StrtoInt(edDiasPlazo.Text) + StrtoDate(edFAutComite.Text));
      if Trunc(vFVencimiento) <> Trunc(Objeto.Paquete.EsHabil(vFVencimiento, 1, 'PAMEXI')) then
      begin
        vFVencimiento := Trunc(Objeto.Paquete.EsHabil(vFVencimiento, 1, 'PAMEXI'));
        edDiasPlazo.Text := FloatToStr(vFVencimiento - StrtoDate(edFAutComite.Text));
      end;
      Objeto.F_AUT_COMITE.GetFromControl;
      Objeto.DIAS_PLAZO.GetFromControl;
      Objeto.F_VENCIMIENTO.AsDateTime := Objeto.F_AUT_COMITE.AsDateTime + Objeto.DIAS_PLAZO.AsInteger;
    end;
  end;


end;

procedure TWCrCon.dtpFAutComiteChange(Sender: TObject);
begin
  if Objeto.Active then
  begin
    edFAutComite.Text := DatetoStr(Trunc(dtpFAutComite.Date));
    edDiasPlazoExit(Self);
  end;
end;

procedure TWCrCon.edFAutComiteExit(Sender: TObject);
begin
  if (Objeto.Modo = moEdit) then
  begin
    if StrtoDate(edFAutComite.Text) = (dtpFAutComite.Date) then
      Exit
    else
      dtpFAutComite.Date := StrtoDate(edFAutComite.Text);
  end;
end;

procedure TWCrCon.bbAmpliarClick(Sender: TObject);
begin
  if (Objeto.SIT_LINEA.AsString = 'AC') then
  begin
    Objeto.V_AMPLIACION.AsInteger := -1;
    Objeto.Modifica;
  end
  else
  begin
    raise EInterFrame.Create('La autorización no está activa, no puede ser ampliada');
    Exit;
  end;
end;

procedure TWCrCon.bbCancelarClick(Sender: TObject);
var
  vCuenta : integer;
begin
  if (Objeto.Active) then
  begin
    if (Objeto.SIT_LINEA.AsString = 'AC') or (Objeto.SIT_LINEA.AsString = 'PA') then
    begin
      vCuenta := 0;
      GetSQLInt('SELECT COUNT(ID_CREDITO) CUENTA FROM CRE_CREDITO WHERE ID_CONTRATO = ' + Objeto.ID_CONTRATO.AsString + ' AND SIT_CREDITO <> ''CA''',Objeto.DataBaseName,Objeto.SessionName, 'CUENTA', vCuenta, True);
      if (vCuenta = 0) then
      begin
       Objeto.Edit;
       Objeto.SIT_LINEA.AsString := 'CA';
       Objeto.Post;
      end
      else
      begin
        raise eInterFrame.Create('La autorización tiene créditos asociados, no puede ser cancelada');
        Exit;
      end;
    end
    else
    begin
      raise EinterFrame.Create('La autorizacion debe estar activa para poder ser cancelada');
      Exit;
    end;
  end;
end;

procedure TWCrCon.edImpAutorizadoExit(Sender: TObject);
begin
  if (Objeto.Modo = moEdit) then
    begin
      Objeto.IMP_AUTORIZADO.GetFromControl;
      Objeto.IMP_DISPONER.AsFloat := Objeto.IMP_AUTORIZADO.AsFloat - Objeto.IMP_DISPUESTO.AsFloat;
    end;
end;

procedure TWCrCon.InterForma1AntesModificar(Sender: TObject;
  var Realizado: Boolean);
begin
  Realizado := False;
    if Objeto.Active then
      begin
        if (not (Objeto.SIT_LINEA.AsString = 'PA')) and (not (Objeto.V_AMPLIACION.AsInteger = -1)) then
        begin
          raise EInterFrame.Create('La autorización debe tener situación por activar para poder ser modificada');
          Exit;
        end;
      end;
  Realizado := True;
end;

procedure TWCrCon.sbCVE_TASA_REFERClick(Sender: TObject);
begin
  Objeto.Tasa.Busca;
end;

procedure TWCrCon.InterForma1DespuesModificar(Sender: TObject);
begin
  if (Objeto.V_AMPLIACION.AsInteger = -1) then
    begin
      Objeto.NUM_AMPLIACION.AsInteger := Objeto.NUM_AMPLIACION.AsInteger + 1;
    end;
  if Objeto.SIT_LINEA.AsString = 'PA' then
  begin
    Objeto.F_AUT_COMITE.AsDateTime := Objeto.Apli.DameFechaEmpresa;
    dtpFAutComite.Date := Objeto.Apli.DameFechaEmpresa;
    Objeto.F_AUT_CREDITO.AsDateTime := Objeto.Apli.DameFechaEmpresa;
    Objeto.F_ENTREGA_RECUR.AsDateTime := Objeto.Apli.DameFechaEmpresa;
    Objeto.F_VENCIMIENTO.AsDateTime :=  Objeto.Apli.DameFechaEmpresa;
  end;
end;

procedure TWCrCon.InterForma1DespuesCancelar(Sender: TObject);
begin
  Objeto.V_AMPLIACION.AsInteger := 0;
end;

end.



