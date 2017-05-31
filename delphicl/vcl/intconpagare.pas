// Sistema         : Clase de CONPAGARE
// Fecha de Inicio : 25/01/1999
// Función forma   : Clase de CONPAGARE
// Diseñado por    : Alberto Ramirez Pacheco
// Comentarios     :
Unit IntConPagare;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, unGene,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntSGCtrl, IntCtoPanel;

Type
 TConPagare= class;

  TWConPagare=Class(TForm)
	 InterForma1             : TInterForma;
    sgPagare: TSGCtrl;
	 gbValuacion: TGroupBox;
    Label14: TLabel;
    bvRevaluacion: TBevel;
    lbTipoInt: TLabel;
    lbPesos: TLabel;
    lbTipoNeto: TLabel;
    lbCapTot: TLabel;
	 lbIntVto: TLabel;
	 lbNetoVto: TLabel;
    lbCapPesos: TLabel;
    lbIntPesos: TLabel;
    lbNetoPesos: TLabel;
    lbTCPesos: TLabel;
    Bevel2: TBevel;
    Bevel4: TBevel;
    Label16: TLabel;
    lbNomGrupo: TLabel;
    Bevel1: TBevel;
    lbDescMoneda: TLabel;
    InterCtoPanel1: TInterCtoPanel;
	 rgValuacion: TRadioGroup;
    GroupBox1: TGroupBox;
    sbTodos: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    bbImprimir: TBitBtn;
    pnSaldo: TPanel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure sbTodosClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure rgValuacionClick(Sender: TObject);
    procedure InterForma1Imprimir(Sender: TObject);
	 procedure InterForma1Preview(Sender: TObject);
    procedure bbImprimirClick(Sender: TObject);
    PROCEDURE EstableceTitulos;
	 private
	 { Private declarations }
	 public
	 { Public declarations }
		Objeto : TConPagare;
		Procedure Valuacion;
	 end;

	TConPagare= class(TInterFrame)
	private
		FContrato: TInterFrame;
		FCveSitPagare: String;
	protected
	 //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
		Procedure SetCveSitPagare(Sit: String);
	public
		  { Public declarations }
		Id_Contrato: TInterCampo;
		Id_Pagare: TInterCampo;
		Nom_Titular: TInterCampo;

		RESP            : TInterCampo;
		V_B_OBT_DESC    : TInterCampo;
		V_B_OBT_SALDOS  : TInterCampo;
		V_B_OBT_VAL_DIA : TInterCampo;
		V_B_VAL_PESOS   : TInterCampo;
		V_CAPITAL_INV   : TInterCampo;
		V_CONTRATO      : TInterCampo;
		V_CONTRATO_LIQ  : TInterCampo;
		V_CONTRATO_REF  : TInterCampo;
		V_CVE_TIP_CTO   : TInterCampo;
		V_DESC_ENTIDAD  : TInterCampo;
		V_DESC_GRUPO    : TInterCampo;
		V_DESC_MONEDA   : TInterCampo;
		V_DESC_PRODUCTO : TInterCampo;
		V_DESC_SEGMENTO : TInterCampo;
		V_DESC_TIP_CTO  : TInterCampo;
		V_ID_PROMOTOR   : TInterCampo;
		V_ID_TITULAR    : TInterCampo;
		V_INTERES_HOY   : TInterCampo;
		V_INTERES_INV   : TInterCampo;
		V_LIN_SOBGIRO   : TInterCampo;
		V_NOM_CTO_REF   : TInterCampo;
		V_NOM_EMPRESA   : TInterCampo;
		V_NOM_PROMOTOR  : TInterCampo;
		V_NOM_TITULAR   : TInterCampo;
		V_SDO_BLOQ_DV   : TInterCampo;
		V_SDO_COMP_DV   : TInterCampo;
		V_SDO_DEUD_DV   : TInterCampo;
		V_SDO_DNC_DV    : TInterCampo;
		V_SDO_EFE_DV    : TInterCampo;
		V_SDO_REM_DV    : TInterCampo;
		V_SDO_SBC_DV    : TInterCampo;
		V_SDO_SOBGIR_DV : TInterCampo;
		V_SIT_CONTRATO  : TInterCampo;
		V_TIP_SOBGIRO   : TInterCampo;
		V_TIPO_CAMBIO   : TInterCampo;

		StrGrid: TSGCtrl;
		Constructor Create( AOwner : TComponent ); override;
		Destructor  Destroy; override;
		Function    InternalBusca : Boolean; override;
		Function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
		Function    Reporte:Boolean; override;
		Procedure 	RefrescaPagare;
		procedure   StrGridCalc(Sender: TObject; DataSet: TDataSet;
		  var Texto: String; X, Y: Integer; FieldName, ColName: String);
		procedure 	StrGridCalcRow(Sendet: TObject; DataSet: TDataSet;
		  CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
		Procedure   StrGridDblClick(Sender: TObject);

		Property   Contrato: TInterFrame Read FContrato Write FContrato;
       				{Id_Contrato, TitNombre, Cve_Moneda}

		Property   CveSitPagare: String Read FCveSitPagare Write SetCveSitPagare;
	 published
	 end;



implementation

Uses IntConPagVen;	{Instrucciones al vencimiento}

{$R *.DFM}


constructor TConPagare.Create( AOwner : TComponent );
begin
	Inherited;
	fPrefijo:= 'V_';

	Id_Contrato:= CreaCampo('ID_CONTRATO', ftInteger, tsNinguno, tsNinguno, False);
	Id_Pagare:= CreaCampo('ID_PAGARE', ftInteger, tsNinguno, tsNinguno, False);
	Nom_Titular:= CreaCampo('NOM_TITULAR', ftString, tsNinguno, tsNinguno, False);

	RESP            := CreaCampo('RESP',ftInteger,tsNinguno,tsProc1,False);
	RESP.Parametro := 'RESP';
	V_B_OBT_DESC    := CreaCampo('B_OBT_DESC',ftString,tsProc1,tsNinguno,False);
	V_B_OBT_SALDOS  := CreaCampo('B_OBT_SALDOS',ftString,tsProc1,tsNinguno,False);
	V_B_OBT_VAL_DIA := CreaCampo('B_OBT_VAL_DIA',ftString,tsProc1,tsNinguno,False);
	V_B_VAL_PESOS   := CreaCampo('B_VAL_PESOS',ftString,tsProc1,tsNinguno,False);
	V_CAPITAL_INV   := CreaCampo('CAPITAL_INV',ftFloat,tsNinguno,tsProc1,False);
	V_CONTRATO      := CreaCampo('CONTRATO',ftInteger,tsProc1,tsNinguno,False);
	V_CONTRATO_LIQ  := CreaCampo('CONTRATO_LIQ',ftInteger,tsNinguno,tsProc1,False);
	V_CONTRATO_REF  := CreaCampo('CONTRATO_REF',ftInteger,tsNinguno,tsProc1,False);
	V_CVE_TIP_CTO   := CreaCampo('CVE_TIP_CTO',ftString,tsNinguno,tsProc1,False);
	V_DESC_ENTIDAD  := CreaCampo('DESC_ENTIDAD',ftString,tsNinguno,tsProc1,False);
	V_DESC_GRUPO    := CreaCampo('DESC_GRUPO',ftString,tsNinguno,tsProc1,False);
	V_DESC_MONEDA   := CreaCampo('DESC_MONEDA',ftString,tsNinguno,tsProc1,False);
	V_DESC_PRODUCTO := CreaCampo('DESC_PRODUCTO',ftString,tsNinguno,tsProc1,False);
	V_DESC_SEGMENTO := CreaCampo('DESC_SEGMENTO',ftString,tsNinguno,tsProc1,False);
	V_DESC_TIP_CTO  := CreaCampo('DESC_TIP_CTO',ftString,tsNinguno,tsProc1,False);
	V_ID_PROMOTOR   := CreaCampo('ID_PROMOTOR',ftInteger,tsNinguno,tsProc1,False);
	V_ID_TITULAR    := CreaCampo('ID_TITULAR',ftInteger,tsNinguno,tsProc1,False);
	V_INTERES_HOY   := CreaCampo('INTERES_HOY',ftFloat,tsNinguno,tsProc1,False);
	V_INTERES_INV   := CreaCampo('INTERES_INV',ftFloat,tsNinguno,tsProc1,False);
	V_LIN_SOBGIRO   := CreaCampo('LIN_SOBGIRO',ftFloat,tsNinguno,tsProc1,False);
	V_NOM_CTO_REF   := CreaCampo('NOM_CTO_REF',ftString,tsNinguno,tsProc1,False);
	V_NOM_EMPRESA   := CreaCampo('NOM_EMPRESA',ftString,tsNinguno,tsProc1,False);
	V_NOM_PROMOTOR  := CreaCampo('NOM_PROMOTOR',ftString,tsNinguno,tsProc1,False);
	V_NOM_TITULAR   := CreaCampo('NOM_TITULAR',ftString,tsNinguno,tsProc1,False);
	V_SDO_BLOQ_DV   := CreaCampo('SDO_BLOQ_DV',ftfloat,tsNinguno,tsProc1,False);
	V_SDO_COMP_DV   := CreaCampo('SDO_COMP_DV',ftFloat,tsNinguno,tsProc1,False);
	V_SDO_DEUD_DV   := CreaCampo('SDO_DEUD_DV',ftFloat,tsNinguno,tsProc1,False);
	V_SDO_DNC_DV    := CreaCampo('SDO_DNC_DV',ftFloat,tsNinguno,tsProc1,False);
	V_SDO_EFE_DV    := CreaCampo('SDO_EFE_DV',ftFloat,tsNinguno,tsProc1,False);
	V_SDO_REM_DV    := CreaCampo('SDO_REM_DV',ftFloat,tsNinguno,tsProc1,False);
	V_SDO_SBC_DV    := CreaCampo('SDO_SBC_DV',ftFloat,tsNinguno,tsProc1,False);
	V_SDO_SOBGIR_DV := CreaCampo('SDO_SOBGIR_DV',ftFloat,tsNinguno,tsProc1,False);
	V_SIT_CONTRATO  := CreaCampo('SIT_CONTRATO',ftString,tsNinguno,tsProc1,False);
	V_TIP_SOBGIRO   := CreaCampo('TIP_SOBGIRO',ftString,tsNinguno,tsProc1,False);
	V_TIPO_CAMBIO   := CreaCampo('TIPO_CAMBIO',ftFloat,tsNinguno,tsProc1,False);

	StrGrid:= nil;
	Contrato:= nil;
	StpName  := ' ';
	UseQuery := False;
	HelpFile := 'IntConPagare.Hlp';
	ShowMenuReporte:=True;
end;

Destructor TConPagare.Destroy;
begin inherited;
end;


function TConPagare.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWConPagare;
begin
	W:=TWConPagare.Create(Self);
	try
		W.Objeto:= Self;
		StrGrid:= W.sgPagare;
		StrGrid.OnCalc:= StrGridCalc;
		StrGrid.OnCalcRow:= StrGridCalcRow;
		StrGrid.OnDblClick:= StrGridDblClick;
		W.InterForma1.InterFrame:= Self;
		W.InterForma1.FormaTipo := ftConsulta;   //ftImprimir; //FIJA EL TIPO DE FORMA
		W.InterForma1.ShowGrid := False;
		W.InterForma1.ShowNavigator := False;
		W.InterForma1.Funcion := FInterFun;
		W.InterForma1.ShowModal;
		ShowWindow := W.InterForma1.ModalResult;
	finally
		W.Free;
	end;
end;


Function TConPagare.InternalBusca:Boolean;
Var T:TInterFindit;
begin
{	InternalBusca := False;
	T := CreaBuscador('IConPaga.it','');
	Try
		if Active then begin end;
		if T.Execute then InternalBusca := FindKey([]);
	finally  T.Free;
	end;}
end;

function TConPagare.Reporte:Boolean;
begin //Execute_Reporte();
end;

Procedure TConPagare.SetCveSitPagare(Sit: String);
Begin
	FCveSitPagare:= Sit;
	RefrescaPagare;
end;

Procedure TConPagare.RefrescaPagare;
Var q: TQuery;
	 Situacion: String;
Begin
	If (StrGrid = nil) or (Contrato = nil)  Then Exit;
	If CveSitPagare <> '' then Situacion:= ' and Inv_Pagare.Cve_Sit_Pagare = '''+ CveSitPagare + ''''
	else Situacion:= '';

	q:= TQuery.Create(self);
        Try
	q.DataBaseName:= DataBaseName;
	q.SessionName:= SessionName;
	q.SQL.Text:=
			' SELECT ' +
			'   Inv_Pagare.CVE_SIT_PAGARE Situacion,' +
			'   Inv_Pagare.ID_PAGARE Pagare,' +
			'   Inv_Pagare.F_APERTURA Apertura,' +
			'   Inv_Pagare.DIAS_PLAZO Plazo,' +
			'   Inv_Pagare.F_VENCIMIENTO Vencimiento,' +
			'   Inv_Pagare.IMP_CAPITAL Capital,' +
			'   (Inv_Pagare.IMP_INT_VTO - Inv_Pagare.Imp_Isr_Vto) Interes ,' +
			'   Inv_Pagare.TASA_NETA Tasa,' +
			'   Inv_Pagare.IMP_NETO_VTO Neto' +
{         '   Inv_Pagare.TX_COM_PAG Comentarios,' +
			'   Inv_Pagare.TX_INST_CAJERO Instrucciones ' +}
			' FROM Inv_Pagare' +
			' WHERE' +
			'   Inv_Pagare.ID_CONTRATO =' + Contrato.FieldByName('ID_CONTRATO').AsString +
			Situacion;
	q.Active:= True;


		StrGrid.BeginGrid;
		StrGrid.ClearTabs;
		StrGrid.SetActualHeight(19);

		StrGrid.Titulo1:= 'Consulta de Pagares ';
		StrGrid.Titulo2:= 'Contrato: '+ Contrato.FieldByName('ID_CONTRATO').asString + '  ' + Contrato.FieldByName('TITNOMBRE').asString;

		q.FieldByName('SITUACION').DisplayLabel	 := 'Situación'+#30+'>C';
		q.FieldByName('PAGARE').DisplayLabel       := 'Pagaré'+#30+'>C';
		q.FieldByName('APERTURA').DisplayLabel     := 'Apertura'+#30+'>C';
		q.FieldByName('PLAZO').DisplayLabel        := 'Plazo'+#30+'>C';
		q.FieldByName('VENCIMIENTO').DisplayLabel  := 'Vencimiento'+#30+'>C';
		q.FieldByName('CAPITAL').DisplayLabel      := 'Capital'+#30+'>C';
		q.FieldByName('INTERES').DisplayLabel      := 'Interés neto'+#30+'>C';
		q.FieldByName('TASA').DisplayLabel         := 'Tasa'+#30+'>C';
		q.FieldByName('NETO').DisplayLabel         := 'Neto'+#30+'>C';
{      q.FieldByName('COMENTARIOS').DisplayLabel  := 'Comentarios'+#30+'>C';
		q.FieldByName('INSTRUCCIONES').DisplayLabel:= 'Instrucciones'+#30+'>C';}

		TFloatField(q.FieldByName('CAPITAL')).DisplayFormat := '###,###,###,###.00';
		TFloatField(q.FieldByName('INTERES')).DisplayFormat := '###,###,###,###.00';
		TFloatField(q.FieldByName('NETO')).DisplayFormat    := '###,###,###,###.00';

		q.FieldByName('SITUACION').DisplayWidth := 11;
		q.FieldByName('PAGARE').DisplayWidth := 8;
		q.FieldByName('APERTURA').DisplayWidth := 12;
		q.FieldByName('PLAZO').DisplayWidth := 8;
		q.FieldByName('VENCIMIENTO').DisplayWidth := 12;
		q.FieldByName('CAPITAL').DisplayWidth := 15;
		q.FieldByName('INTERES').DisplayWidth := 15;
		q.FieldByName('TASA').DisplayWidth := 9;
		q.FieldByName('NETO').DisplayWidth := 15;

		q.FieldByName('SITUACION').Alignment := taCenter;
		q.FieldByName('PAGARE').Alignment := taCenter;
		q.FieldByName('APERTURA').Alignment := taCenter;
		q.FieldByName('PLAZO').Alignment := taCenter;
		q.FieldByName('VENCIMIENTO').Alignment := taCenter;
		q.FieldByName('CAPITAL').Alignment := taRightJustify;
		q.FieldByName('INTERES').Alignment := taRightJustify;
		q.FieldByName('TASA').Alignment := taRightJustify;
		q.FieldByName('NETO').Alignment := taRightJustify;
{      q.FieldByName('COMENTARIOS').Alignment := taLeftJustify;
		q.FieldByName('INSTRUCCIONES').Alignment := taLeftJustify;}

		StrGrid.AddQry(Q, // Query
							True, // Iniciar Grid, Limpiar Lineas Anteriores.
							True, // Cerrar Grid, Sin que Aparezcan mas Lineas Abajo.
							-1,   // Si Titulo1, o Titulo2 tienen Texto, es el alto del titulo.
							19,    // Alto del Header, -1 es el Default 32 Columnas
							-1,    // Alto del las Lineas, 1 es el Default 32
							True); // ShowTitle
	Finally
		If q <> nil Then q.Free;
		StrGrid.EndGrid;
		StrGrid.MoveRow(self, 1,1);
	end;
end;


procedure TConPagare.StrGridCalc(Sender: TObject; DataSet: TDataSet;
		  var Texto: String; X, Y: Integer; FieldName, ColName: String);
Begin
	If ColName = 'SITUACION' Then
	Begin
		If DataSet.FieldByName('SITUACION').asString = 'AC' then Texto:= 'Activo'
		else If DataSet.FieldByName('SITUACION').asString = 'VE' then Texto:= 'Vencido'
		else If DataSet.FieldByName('SITUACION').asString = 'RE' then Texto:= 'Renovado'
		else If DataSet.FieldByName('SITUACION').asString = 'PA' then Texto:= 'Por Activar'
		else If DataSet.FieldByName('SITUACION').asString = 'CA' then Texto:= 'Cancelado'
		else If DataSet.FieldByName('SITUACION').asString = 'RC' then Texto:= 'Ren. Canc.';
	end;
end;

procedure TConPagare.StrGridCalcRow(Sendet: TObject; DataSet: TDataSet;
		  CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
var DescSituacion: String;
begin //Type TRowCaso=(rcQueryBegin, rcQueryEnd, rcRowBegin, rcRowEnd);
	If CveSitPagare = 'AC' then DescSituacion:= 'ACTIVOS'
	else If CveSitPagare = 'RE' then DescSituacion:= 'RENOVADOS'
	else If CveSitPagare = 'VE' then DescSituacion:= 'VENCIDOS'
	else If CveSitPagare = 'PA' then DescSituacion:= 'POR ACTIVAR'
	else DescSituacion:= '';

	Case RowCaso of
		rcQueryBegin: If DataSet.IsEmpty Then StrGrid.AddTitle('NO TIENE PAGARES ' + DescSituacion,TcCenter);
	end;
end;


procedure TConPagare.StrGridDblClick(Sender: TObject);
var 
	RenglonActual: Integer;
	PagareStr, S: String;	
	Vencimiento: TConPagVen;
begin
	If Contrato = nil then Raise EInterFrame.Create('El Contrato no ha sido asignado');
	RenglonActual:= StrGrid.SG.Selection.Top;

	If (StrGrid.SG.Cells[KTipoCol, StrGrid.SG.Selection.Top] <> 'N') Then Exit;
	PagareStr:= StrGrid.CellStr['PAGARE' ,RenglonActual];

	Vencimiento:= TConPagVen.Create(self);
	Try
		Vencimiento.GetParams(Self);

		Id_Contrato.AsInteger:= Contrato.FieldByName('ID_CONTRATO').asInteger;
		Id_Pagare.AsString:= PagareStr;
		Nom_Titular.AsString:= Contrato.FieldByName('TITNOMBRE').asString;

		Vencimiento.InterFrame:= self;
		Vencimiento.Catalogo;
	Finally Vencimiento.Free;
	end;
//	InstruccionesVencimiento(Self, Contrato.FieldByName('ID_CONTRATO').asInteger, StrToInt(PagareStr));
end;

(***********************************************FORMA CONPAGARE********************)
(*                                                                              *)
(*  FORMA DE CONPAGARE                                                            *)
(*                                                                              *)
(***********************************************FORMA CONPAGARE********************)

procedure TWConPagare.FormShow(Sender: TObject);
begin
	InterCtoPanel1.Frame:= Objeto.Contrato;
        sgPagare.ApliEmail:=Objeto.Apli;
        InterCtoPanel1.ShowEnviarEmail:=True;
        InterCtoPanel1.SGCtrlEmail:=sgPagare;

	If Objeto.Contrato <> nil then
        begin
          Objeto.CveSitPagare:= 'AC';
        end;
	rgValuacion.ItemIndex:= 0;
        EstableceTitulos;
end;

procedure TWConPagare.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWConPagare.sbTodosClick(Sender: TObject);
begin	Objeto.CveSitPagare:= '';
        EstableceTitulos;
end;

procedure TWConPagare.SpeedButton1Click(Sender: TObject);
begin Objeto.CveSitPagare:= 'AC';
      EstableceTitulos;
end;

procedure TWConPagare.SpeedButton2Click(Sender: TObject);
begin Objeto.CveSitPagare:= 'RE';
      EstableceTitulos;
end;

procedure TWConPagare.SpeedButton3Click(Sender: TObject);
begin Objeto.CveSitPagare:= 'VE';
      EstableceTitulos;
end;


procedure TWConPagare.rgValuacionClick(Sender: TObject);
begin
  Valuacion;
  if rgValuacion.itemIndex = 0 then
  begin // intereses al dia
	 lbTipoInt.Caption   := 'Total de Intereses Netos al Dia';
	 lbTipoNeto.Caption  := 'Neto al Dia';
	 gbValuacion.Caption:= 'Valuación al Día';
	 lbIntVto.Caption    := FormatFloat('#,##0.00',objeto.V_INTERES_HOY.GetAsFloat);
	 lbNetoVto.Caption   := FormatFloat('#,##0.00',objeto.V_CAPITAL_INV.GetAsFloat +
																  objeto.V_INTERES_HOY.GetAsFloat);

	 LbIntPesos.Caption:= FormatFloat('#,##0.00',objeto.V_INTERES_HOY.GetAsFloat *  objeto.V_TIPO_CAMBIO.GetAsFloat);
	 LbNetoPesos.Caption:=FormatFloat('#,##0.00',(objeto.V_CAPITAL_INV.GetAsFloat +														objeto.V_INTERES_HOY.GetAsFloat) * objeto.V_TIPO_CAMBIO.GetAsFloat);
  end
  else
  begin //intereses netos al vencimiento
	 lbTipoInt.Caption  := 'Total de Intereses Netos al Vencimiento';
	 lbTipoNeto.Caption := 'Neto al Vencimiento';
	 gbValuacion.Caption:= 'Valuación al Vencimiento';
	 lbIntVto.Caption   := FormatFloat('#,##0.00',objeto.V_INTERES_INV.GetAsFloat);
	 lbNetoVto.Caption  := FormatFloat('#,##0.00',objeto.V_CAPITAL_INV.GetAsFloat + objeto.V_INTERES_INV.GetAsFloat);

	 LbIntPesos.Caption:= FormatFloat('#,##0.00',objeto.V_INTERES_INV.GetAsFloat * objeto.V_TIPO_CAMBIO.GetAsFloat);
	 LbNetoPesos.Caption:=FormatFloat('#,##0.00',(objeto.V_CAPITAL_INV.GetAsFloat + objeto.V_INTERES_INV.GetAsFloat) *  objeto.V_TIPO_CAMBIO.GetAsFloat);
  end;
  Objeto.CveSitPagare:=Objeto.CveSitPagare;
  EstableceTitulos;
end;

Procedure TwConPagare.Valuacion;
var S     : tStoredProc;
    vlSQL,vlFec,vlFecAnt : String;
    qConsulta : Tquery;
    vlFecMesAnt:TDateTime;
begin
  S:= objeto.stpPrepara('STPTOCN2',tsProc1);
  S.ParamByName('V_CONTRATO').asInteger     := objeto.contrato.FieldByName('ID_CONTRATO').AsInteger;
  S.ParamByName('V_B_OBT_DESC').AsString    := 'V';
  S.ParamByName('V_B_OBT_SALDOS').AsString  := 'V';
  S.ParamByName('V_B_VAL_PESOS').AsString   := 'F';
  S.ParamByName('V_B_OBT_VAL_DIA').AsString := 'V';
  objeto.InternalstpEjecuta(S,tsproc1,True);


  lbDescMoneda.Caption:= objeto.V_DESC_MONEDA.AsString;
  lbNomGrupo.Caption := objeto.V_DESC_GRUPO.AsString;
  lbCaptot.Caption   := FormatFloat('#,##0.00',objeto.V_CAPITAL_INV.asFloat);
  lbIntVto.Caption   := FormatFloat('#,##0.00',objeto.V_INTERES_INV.asFloat);
  lbNetoVto.Caption  := FormatFloat('#,##0.00',(Objeto.V_CAPITAL_INV.asFloat + Objeto.V_INTERES_INV.asFloat));

  vlFec:= FormatDateTime('YYYYMM',Objeto.Apli.DameFechaEmpresa);

  vlFecMesAnt:=Objeto.Apli.DameFechaEmpresadia('FMAN');
  vlFecAnt:=FormatDateTime('YYYYMM',vlFecMesAnt);

  qConsulta := Tquery.Create(nil);
  try qConsulta.databasename:=Objeto.Apli.databasename;
      qConsulta.sessionname :=Objeto.Apli.sessionname;
      vlSQL:=
            ' SELECT ' +
            ' ( INV_RESUMEN.SDO_INI_MES      +  INV_RESUMEN.IMP_CAP_FMES     + ' +
            '   INV_RESUMEN.IMPP_INT_FMES    -  INV_RESUMEN.IMPP_ISR_FMES    - ' +
            '   INV_RESUMEN.IMPP_AJ_INT_VCAN -  INV_RESUMEN.IMPP_AJ_ISR_VCAN - ' +
            '   INV_RESUMEN.IMP_RET_FMES) SALDO_FINAL  ' +
            ' FROM ' +
            ' INV_RESUMEN ' +
            ' WHERE ' +
            '     INV_RESUMEN.ID_CONTRATO = ' + objeto.contrato.FieldByName('ID_CONTRATO').AsSTRING +
            ' AND INV_RESUMEN.ANO_MES = ' + vlFecAnt;

      qConsulta.sql.text:=vlSQL;
      qConsulta.Open;
      if qConsulta.IsEmpty
      then pnSaldo.Caption :='No se encontró dato de INV_RESUMEN'
      else pnSaldo.Caption :=' Valuación de inicio de mes (' + FormatDateTime('01/MMM/YYYY',Objeto.Apli.DameFechaEmpresa) + ') : ' + FormatFloat('$##,##0.00',qConsulta.FieldByName('SALDO_FINAL').AsFloat);

  finally qConsulta.free;
  end;


  if Objeto.Contrato.FieldByName('CVE_MONEDA').AsInteger = 800 then
  begin
	 bvRevaluacion.Visible := True;
	 lbPesos.Visible       := True;
	 lbCapPesos.Visible    := True;
	 lbIntPesos.Visible    := True;
	 lbNetoPesos.Visible   := True;
	 lbTCPesos.Visible     := True;
	 lbTCPesos.Caption     := 'T.C. al dia : ' + Objeto.V_TIPO_CAMBIO.AsString;
	 lbCapPesos.Caption    := FormatFloat('#,##0.00',(objeto.V_CAPITAL_INV.AsFloat *
																	  Objeto.V_TIPO_CAMBIO.AsFloat));
	 lbIntPesos.Caption    := FormatFloat('#,##0.00',(objeto.V_INTERES_INV.AsFloat *
																	  Objeto.V_TIPO_CAMBIO.AsFloat));
	 lbNetoPesos.Caption   := FormatFloat('#,##0.00',(objeto.V_CAPITAL_INV.AsFloat +

																		objeto.V_INTERES_INV.AsFloat) *
																		Objeto.V_TIPO_CAMBIO.AsFloat);
  end
  else
  begin
	 bvRevaluacion.Visible := False;
	 lbPesos.Visible       := False;
	 lbCapPesos.Visible    := False;
	 lbIntPesos.Visible    := False;
	 lbNetoPesos.Visible   := False;
	 lbTCPesos.Visible     := False;
  end;
end;

procedure TWConPagare.InterForma1Imprimir(Sender: TObject);
begin sgPagare.Print(False, True, Objeto.Apli);
end;

procedure TWConPagare.InterForma1Preview(Sender: TObject);
begin	sgPagare.Print(True, True, Objeto.Apli);
end;

PROCEDURE TWConPagare.EstableceTitulos;
Var vlLetrero:String;
begin
     if Objeto.CveSitPagare = 'AC' then
     begin
       if rgValuacion.itemIndex = 0
       then vlLetrero:=' Al día '
       else vlLetrero:=' Al vencimiento ';

       sgPagare.AddTitle('',tcLeft);
       sgPagare.AddTitle('',tcLeft);
       sgPagare.AddTitle('================================================================================',tcLeft);
       sgPagare.AddTitle('' + pnSaldo.Caption,tcLeft);
       sgPagare.AddTitle('================================================================================',tcLeft);
       sgPagare.AddTitle('                   *** RESUMEN DE PAGARES VIGENTES ***',tcLeft);
       sgPagare.AddTitle('================================================================================',tcLeft);
       sgPagare.AddTitle('',tcLeft);
       sgPagare.AddTitle('Total de capital en pagarés vigentes      '   +  #09 + #09 + #09 + #09 + lbCapTot.Caption, tcLeft);
       sgPagare.AddTitle('Total de Intereses Netos (' + vlLetrero + ')' +  #09 + #09 + #09 + #09 + lbIntVto.Caption, tcLeft);
       sgPagare.AddTitle('Valuación                (' + vlLetrero + ')' +  #09 + #09 + #09 + #09 + lbNetoVto.Caption,tcLeft);
       sgPagare.AddTitle('================================================================================',tcLeft);
       sgPagare.AddTitle('',tcLeft);
       sgPagare.AddTitle('',tcLeft);
       sgPagare.EndGrid;
     end;
end;

procedure TWConPagare.bbImprimirClick(Sender: TObject);
begin
     sgPagare.Print(True,True,Objeto.Apli);
end;

end.
