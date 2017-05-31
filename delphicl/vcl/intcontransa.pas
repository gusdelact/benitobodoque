// Sistema         : Clase de CONPAGARE
// Fecha de Inicio : 25/01/1999
// Función forma   : Clase de CONPAGARE
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Alberto Ramirez Pacheco
// Comentarios     :
Unit IntConTransa;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, unConDV,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntSGCtrl, Spin, IntConsaldo,
InterEdit, unGene, IntCtoPanel, IntCtto, IntDvTransac
,UnValDvTRans, IntDvTranHis {CAPM}// VDVT0711
, UnSegBtn;

const ALTO_COL = 16;
const ALTO_DOBLE = 32;

Type
 TTipoPeriodo = (tpMesAnterior, tpMesActual, tpHoy, tpRango);

 TConTransa= class;

  TWConTransa=Class(TForm)
	 InterForma1             : TInterForma;
	 sgMovto: TSGCtrl;
	 GroupBox1: TGroupBox;
	 lbV_SDO_EFE_DV: TLabel;
	 edV_SDO_EFE_DV: TInterEdit;
	 lbV_SDO_BLOQ_DV: TLabel;
	 edV_SDO_BLOQ_DV: TInterEdit;
	 lbV_SDO_COMP_DV: TLabel;
	 edV_SDO_COMP_DV: TInterEdit;
	 lbV_SDO_DEUD_DV: TLabel;
	 edV_SDO_DEUD_DV: TInterEdit;
	 GroupBox3: TGroupBox;
	 lbV_SDO_DNC_DV: TLabel;
	 lbV_SDO_SBC_DV: TLabel;
	 edV_SDO_DNC_DV: TInterEdit;
	 edV_SDO_SBC_DV: TInterEdit;
	 GroupBox4: TGroupBox;
	 Label5: TLabel;
	 edLinSobregiro: TEdit;
	 lbV_SDO_SOBGIR_DV: TLabel;
	 edV_SDO_SOBGIR_DV: TInterEdit;
	 lbHeaderValuacion: TLabel;
	 GroupBox6: TGroupBox;
	 GroupBox7: TGroupBox;
	 edDisponible: TInterEdit;
	 edContable: TInterEdit;
	 InterCtoPanel1: TInterCtoPanel;
	 GroupBox2: TGroupBox;
	 bMesAnterior: TSpeedButton;
	 bMesActual: TSpeedButton;
	 bHoy: TSpeedButton;
	 bRango: TSpeedButton;
	 pRango: TPanel;
	 edFInicio: TEdit;
	 Label1: TLabel;
	 InterDateTimePicker1: TInterDateTimePicker;
	 Label2: TLabel;
	 edFFin: TEdit;
	 InterDateTimePicker2: TInterDateTimePicker;
    Label15: TLabel;
    edPEND_TD: TInterEdit;
    lbVIMP_COM_VIRT_AUD: TLabel;
    iedV_IMP_COM_VIRT_AUD: TInterEdit;
	 procedure FormShow(Sender : TObject);
	 procedure FormClose(Sender : TObject; var Action : TCloseAction);
	 procedure FormDestroy(Sender : TObject);
	 procedure SpeedButton1Click(Sender: TObject);
	 procedure SpeedButton2Click(Sender: TObject);
	 procedure SpeedButton3Click(Sender: TObject);
	 procedure bRangoClick(Sender: TObject);
	 procedure InterForma1Preview(Sender: TObject);
	 procedure InterForma1Imprimir(Sender: TObject);
	 procedure InterForma1Buscar(Sender: TObject);
    procedure sgMovtoDblClick(Sender: TObject);
	 private
	 { Private declarations }
	 public
	 { Public declarations }
		Objeto : TConTransa;
	 end;

	TConTransa= class(TInterFrame)
	private
                FTransacc: TDvTransac;
                FTransacc_HIST: TDvTranHis;   {CAPM}// VDVT0711
		FContrato: TInterFrame;
		FPeriodo: TTipoPeriodo;
//		FDia: Integer;
		FFecha:        TDateTime;
		FIniciaConsulta: Boolean;
		FCaption:      String;
		FSumRetiro: 	Real;
		FSumDeposito:	Real;
		FTotRetiro:    Real;
		FTotDeposito: 	Real;

		//FCveSitPagare: String;
	protected
		Procedure SetPeriodo(pPeriodo: TTipoPeriodo);
		Procedure SetContrato(Ctto: TInterFrame);
	public
		  { Public declarations }
		F_Inicio: TInterCampo;
		F_Fin:    TInterCampo;
		Desc_Periodo: TInterCampo;

//		Panel: TPanel;
                i_Rango: Boolean;
		Saldo: TConSaldo;
		StrGrid: TSGCtrl;
		CttoInterno: TContrato;
		Constructor Create( AOwner : TComponent ); override;
		Destructor  Destroy; override;
		Procedure 	DataBaseChange; Override;
		Function    InternalBusca : Boolean; override;
		Function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
		Function    Reporte:Boolean; override;

		Procedure 	RefrescaMovimientos;
		procedure   StrGridCalc(Sender: TObject; DataSet: TDataSet;
		  var Texto: String; X, Y: Integer; FieldName, ColName: String);
		procedure StrGridCalcRow(Sendet: TObject; DataSet: TDataSet;
		  CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);

		Property   Contrato: TInterFrame Read FContrato Write SetContrato;
		Property   Periodo: TTipoPeriodo Read FPeriodo Write SetPeriodo;

		//Property   CveSitPagare: String Read FCveSitPagare Write SetCveSitPagare;
	 published
	 end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TConTransa.Create( AOwner : TComponent );
begin
	Inherited;
	F_Inicio:= CreaCampo('F_INICIO', ftDate, tsNinguno, tsNinguno, False);
	F_Fin:= CreaCampo('F_FIN', ftDate, tsNinguno, tsNinguno, False);
	Desc_Periodo:= CreaCampo('DESC_PERIODO', ftString, tsNinguno, tsNinguno, False);

	Saldo:= TConSaldo.Create(self);
	CttoInterno:= TContrato.Create(self);
        i_Rango:= False;

        FTransacc:= TDvTransac.Create(self) ;
        FTransacc_HIST:= TDvTranHis.Create(self) ; {CAPM}// VDVT0711
//	FDia:= -1;
//	Panel:= nil;
	StrGrid:= nil;
	Contrato:= nil;
	StpName  := ' ';
	UseQuery := False;
	HelpFile := 'InTConTransa.Hlp';
	ShowMenuReporte:=True;
end;

Destructor TConTransa.Destroy;
begin
	If Saldo <> nil then Saldo.Free;
	If CttoInterno <> nil Then CttoInterno.Free;
        FTransacc.Free;
        FTransacc_HIST.Free;  {CAPM}// VDVT0711 

	inherited;
end;

Procedure TConTransa.DataBaseChange;
Begin
  Inherited;
  Saldo.GetParams(self);
  CttoInterno.GetParams(self);
  FTransacc.GetParams(self);
  FTransacc_HIST.GetParams(self); {CAPM}// VDVT0711
end;


function TConTransa.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWConTransa;
begin
	W:=TWConTransa.Create(Self);
	try
		W.Objeto:= Self;
		StrGrid:= W.sgMovto;
		StrGrid.OnCalc:= StrGridCalc;
		StrGrid.OnCalcRow:= StrGridCalcRow;
		W.InterForma1.InterFrame:= Self;
		W.InterForma1.FormaTipo := ftImprimir; //FIJA EL TIPO DE FORMA
		W.InterForma1.ShowGrid := False;
		W.InterForma1.ShowNavigator := False;
		W.InterForma1.ShowBtnBuscar:= (Contrato = nil);
		W.InterForma1.Funcion := FInterFun;
		W.InterForma1.ShowModal;
		ShowWindow := W.InterForma1.ModalResult;
	finally
		W.Free;
	end;
end;


Function TConTransa.InternalBusca:Boolean;
begin	Result:= True;
end;

function TConTransa.Reporte:Boolean;
begin //Execute_Reporte();
end;

Procedure TConTransa.SetContrato(Ctto: TInterFrame);
Begin
	FContrato:= Ctto;
	If Ctto <> nil then Saldo.FindKey([Ctto.FieldByName('ID_CONTRATO').AsString,'V','V','F','F'])
end;

Procedure TConTransa.SetPeriodo(pPeriodo: TTipoPeriodo);
Begin
	FPeriodo:= pPeriodo;
//	If Panel <> nil Then Panel.Visible:= False;

	Case pPeriodo of
		tpMesAnterior:
			Begin
//				Panel:= nil;
				Desc_Periodo.AsString:= 'MES ANTERIOR';
				F_Inicio.AsDateTime:= Apli.DameFechaEmpresaDia('IMAN');
				F_Fin.AsDateTime:= Apli.DameFechaEmpresaDia('FMAN');
			end;
		tpMesActual:
			Begin
//				Panel:= nil;
				Desc_Periodo.AsString:= 'MES ACTUAL';
				F_Inicio.AsDateTime:= Apli.DameFechaEmpresaDia('IMAC');
				F_Fin.AsDateTime:= Apli.DameFechaEmpresaDia('D000');
			end;
		tpHoy:
			Begin
//				Panel:= nil;
				Desc_Periodo.AsString:= 'HOY';
				F_Inicio.AsDateTime:= Apli.DameFechaEmpresaDia('D000');
				F_Fin.AsDateTime:= Apli.DameFechaEmpresaDia('D000');
			end;

		tpRango: Desc_Periodo.AsString:= 'RANGO DE FECHAS';
	end;


	If Contrato <> nil Then RefrescaMovimientos;
//	If Panel <> nil Then Panel.Visible:= True;
end;


Procedure TConTransa.RefrescaMovimientos;
Var q: TQuery;
    Situacion: String;
    vlFec,
    vlFecFin    : TDateTime;
Begin
	If (StrGrid = nil) or (Contrato = nil)  Then Exit;
//   If CveSitPagare <> '' then Situacion:= ' and Inv_Pagare.Cve_Sit_Pagare = '''+ CveSitPagare + ''''
//   else Situacion:= '';

	GetFromControl;

	q:= TQuery.Create(self);
     Try
	q.DataBaseName:= DataBaseName;
	q.SessionName:= SessionName;
	q.SQL.Text:=

		' SELECT'+
		'   Dv_Transaccion.Id_Contrato,'+
		'   Dv_Transaccion.Id_Cod_Resp,'+
		'   Dv_Transaccion.Cve_Operacion,'+
		'   Dv_Transaccion.Num_Cheque,'+
		'   Dv_Operacion.B_Muestra_Edocta,'+
		'   Dv_Transaccion.F_Liquidacion,'+
		'   Dv_Transaccion.Id_Transaccion,'+
                // emh 28/06/2006 '   Dv_Operacion.Desc_L_Id_Prim AS Concepto, '+
                ' substr(  REPLACE(Dv_Operacion.Desc_L_Id_Prim,''%pt%'', PkgImpuesto.obtpctiva(Dv_Transaccion.Id_Contrato)||''%''),1,55) as  Concepto, '+
		'   Dv_Transaccion.Tx_Referencia as Concepto2,'+
		'   Dv_Transaccion.Imp_Trans,'+
		'   Dv_Operacion.Cve_Af_Imp_Car,'+
		'   Dv_Operacion.Cve_Af_Imp_Abo,'+
		'   Dv_Transaccion.Sdo_Disponible,'+
                '   Dv_Transaccion.Tx_Inf_Fiscal'+
		//' FROM Dv_Transaccion, Dv_Operacion'+
    ' FROM '+cControlDVT+'Dv_Transaccion Dv_Transaccion, Dv_Operacion'+
		' WHERE'+
		'	Dv_Transaccion.Cve_Operacion = Dv_Operacion.Cve_Operacion'+
		'   and Dv_Transaccion.Id_Cod_Resp = 0' +
		'   and Dv_Transaccion.Id_Contrato =' + Contrato.FieldByName('ID_CONTRATO').AsString +
		'	and Dv_Operacion.B_Muestra_Edocta = ''V''';

        {***}
	If (F_Inicio.IsNull) and (F_Fin.IsNull) Then
  else If (F_Inicio.IsNull) Then q.SQL.Text:= q.SQL.Text + '   and Dv_Transaccion.F_Liquidacion <= '+ setSQLFechaVal(F_Fin.AsDateTime, fFin)
	else If (F_Fin.IsNull) Then q.SQL.Text:= q.SQL.Text + '   and Dv_Transaccion.F_Liquidacion >= '+ setSQLFechaVal(F_Inicio.AsDateTime, fIni)
	{else If (F_Inicio.IsNull) Then q.SQL.Text:= q.SQL.Text + '   and Dv_Transaccion.F_Liquidacion <= '+ F_Fin.AsSQL
	else If (F_Fin.IsNull) Then q.SQL.Text:= q.SQL.Text + '   and Dv_Transaccion.F_Liquidacion >= '+ F_Inicio.AsSQL }
	else begin
               if funAplFecha(Apli) then
               begin
                  {***}
                  BuscaFecIniMov(vlfec,vlFecFin,Apli);
                  if F_Inicio.AsDateTime < vlfec then
                  //   q.SQL.Text:= q.SQL.Text + '   and Dv_Transaccion.F_Liquidacion between to_date('''+ FormatDateTime('DD/MM/YYYY',vlfec)  +''',''DD/MM/YYYY'') '
                  //else q.SQL.Text:= q.SQL.Text + ' and Dv_Transaccion.F_Liquidacion between '+ F_Inicio.AsSQL;
                     q.SQL.Text:= q.SQL.Text + '   and Dv_Transaccion.F_Liquidacion between '+ setSQLFechaVal(vlfec,fIni)
                  else q.SQL.Text:= q.SQL.Text + ' and Dv_Transaccion.F_Liquidacion between '+ setSQLFechaVal(F_Inicio.AsDateTime, fIni);

                  if F_Fin.AsDateTime > vlfecFin then
                  //   q.SQL.Text:= q.SQL.Text + '   and  to_date('''+ FormatDateTime('DD/MM/YYYY',vlfecFin)  +''',''DD/MM/YYYY'') '
                  //else q.SQL.Text:= q.SQL.Text + ' and   '+ F_Fin.AsSQL;
                     q.SQL.Text:= q.SQL.Text + '   and  '+setSQLFechaVal(vlfecFin, fFin )
                  else q.SQL.Text:= q.SQL.Text + ' and   '+ setSQLFechaVal(F_Fin.AsDateTime, fFin);


               end
               //else q.SQL.Text:= q.SQL.Text + '   and Dv_Transaccion.F_Liquidacion between '+ F_Inicio.AsSQL + ' and '+ F_Fin.AsSQL;
               else q.SQL.Text:= q.SQL.Text + '   and Dv_Transaccion.F_Liquidacion between '+ fSetBetween(F_Inicio.AsDateTime,F_Fin.AsDateTime);
             end;

	q.SQL.Text:= q.SQL.Text +
    ' ORDER BY'+
    '	F_Liquidacion,'+
		' Id_Transaccion';
		//'	Dv_Transaccion.F_Liquidacion,'+
		//'   Dv_Transaccion.Id_Transaccion';

  q.SQL.Text := fValidaFechasDvTransaccion(q.SQL.Text,Apli); {CAPM}// VDVT0711

	q.Active:= True;

		StrGrid.BeginGrid;
		StrGrid.ClearTabs;
		StrGrid.SetActualHeight(ALTO_COL);

		If Periodo = tpHoy Then
			StrGrid.Titulo1:= 'Consulta de Movimientos del '+ FmtFecha(F_Inicio.AsDateTime, '@D de @MMMM de @YYYY')
		else if i_Rango then
                  StrGrid.Titulo1:= 'Consulta de Movimientos del '+ FmtFecha(F_Inicio.AsDateTime, '@D de @MMMM de @YYYY') + ' al '+FmtFecha(F_Fin.AsDateTime, '@D de @MMMM de @YYYY')
                else
                   StrGrid.Titulo1:= 'Consulta de Movimientos de '+ FmtFecha(F_Inicio.AsDateTime, '@MMMM de @YYYY');

		StrGrid.Titulo2:= 'Contrato: '+ Contrato.FieldByName('ID_CONTRATO').asString + '  ' + Contrato.FieldByName('TITNOMBRE').asString;

		q.FieldByName('ID_CONTRATO').Visible:= False;
		q.FieldByName('ID_COD_RESP').Visible:= False;
		q.FieldByName('CVE_OPERACION').Visible:= False;
		q.FieldByName('NUM_CHEQUE').Visible:= False;
		q.FieldByName('B_MUESTRA_EDOCTA').Visible:= False;
		q.FieldByName('IMP_TRANS').Visible:= False;
		q.FieldByName('CONCEPTO2').Visible:= False;
                q.FieldByName('TX_INF_FISCAL').Visible:= False;

		q.FieldByName('F_LIQUIDACION').DisplayLabel := 'Fecha'+#30+'>C';
		q.FieldByName('ID_TRANSACCION').DisplayLabel:= 'Referencia'+#30+'>C';
		q.FieldByName('CONCEPTO').DisplayLabel	 	  := 'Concepto'+#30+'>C';
		q.FieldByName('CVE_AF_IMP_CAR').DisplayLabel:= 'Retiros'+#30+'>C';
		q.FieldByName('CVE_AF_IMP_ABO').DisplayLabel:= 'Depósitos'+#30+'>C';
		q.FieldByName('SDO_DISPONIBLE').DisplayLabel:= 'Saldo'+#30+'>C';

		TFloatField(q.FieldByName('SDO_DISPONIBLE')).DisplayFormat := '###,###,###,###.00';

		q.FieldByName('F_LIQUIDACION').DisplayWidth := 10;
		q.FieldByName('ID_TRANSACCION').DisplayWidth:= 10;
		q.FieldByName('CONCEPTO').DisplayWidth 	  := 55;
		q.FieldByName('CVE_AF_IMP_CAR').DisplayWidth:= 15;
		q.FieldByName('CVE_AF_IMP_ABO').DisplayWidth:= 15;
		q.FieldByName('SDO_DISPONIBLE').DisplayWidth:= 15;

		q.FieldByName('F_LIQUIDACION').Alignment := taCenter;
		q.FieldByName('ID_TRANSACCION').Alignment:= taCenter;
		q.FieldByName('CONCEPTO').Alignment 	  := taLeftJustify;
		q.FieldByName('CVE_AF_IMP_CAR').Alignment:= taRightJustify;
		q.FieldByName('CVE_AF_IMP_ABO').Alignment:= taRightJustify;
		q.FieldByName('SDO_DISPONIBLE').Alignment:= taRightJustify;

		StrGrid.AddQry(Q, // Query
							True, // Iniciar Grid, Limpiar Lineas Anteriores.
							True, // Cerrar Grid, Sin que Aparezcan mas Lineas Abajo.
							-1,   // Si Titulo1, o Titulo2 tienen Texto, es el alto del titulo.
							ALTO_COL,  // Alto del Header, -1 es el Default 32 Columnas
							ALTO_DOBLE,// Alto del las Lineas, 1 es el Default 32
							True); // ShowTitle
	Finally
		If q <> nil Then q.Free;
		StrGrid.EndGrid;
		StrGrid.MoveRow(self, 1,1);
	end;
end;


procedure TConTransa.StrGridCalc(Sender: TObject; DataSet: TDataSet;
		  var Texto: String; X, Y: Integer; FieldName, ColName: String);
Begin
	If ColName = 'CVE_AF_IMP_CAR' Then
	Begin
		If DataSet.FieldByName('CVE_AF_IMP_CAR').asString = 'I' then
			Texto:= FormatFloat('#,###.00', DataSet.FieldByName('IMP_TRANS').asFloat)
		else Texto:= '';
	end
	else If ColName = 'CVE_AF_IMP_ABO' Then
	Begin
		If DataSet.FieldByName('CVE_AF_IMP_ABO').asString = 'I' then
			Texto:= FormatFloat('#,###.00', DataSet.FieldByName('IMP_TRANS').asFloat)
		else Texto:= '';
	end
	else If ColName = 'CONCEPTO' Then
	Begin
		If Trim(DataSet.FieldByName('CONCEPTO2').asString) <> '' then
			Texto:= DataSet.FieldByName('CONCEPTO').asString  +  #13+#10 +
                                DataSet.FieldByName('CONCEPTO2').asString;
                If Trim(DataSet.FieldByName('TX_INF_FISCAL').asString) <> '' then
                   Texto:= Texto + #13+#10 + DataSet.FieldByName('TX_INF_FISCAL').asString;

	end;
end;


procedure TConTransa.StrGridCalcRow(Sendet: TObject; DataSet: TDataSet;
		  CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
Var Anio, Mes, Dia: Word;
Begin
	Case RowCaso of
	rcQueryBegin:
		Begin
			If DataSet.IsEmpty Then StrGrid.AddTitle('NO HUBO MOVIMIENTOS ' + Desc_Periodo.AsString, TcCenter)
			else
			Begin
				FIniciaConsulta:= True;
				FFecha:= -1;
				FSumRetiro:= 0;
				FSumDeposito:= 0;
				FTotRetiro:= 0;
				FTotDeposito:= 0;
			end;
		end;

	rcQueryEnd:
		Begin
			StrGrid.ToHeader(StrGrid.AddHeader(['','','','','','','','','','','Total del Día: '+ DataSet.FieldByName('F_LIQUIDACION').asString, FormatFloat('#,##0.00', FSumRetiro),FormatFloat('#,##0.00', FSumDeposito),''], -1, clWindowText));  // Se agregó un '', porque estaba desfasado MZARATE MAR-2002
			StrGrid.ToHeader(StrGrid.AddHeader(['','','','','','','','','','','TOTAL GENERAL'+#30+'>C', FormatFloat('#,##0.00', FTotRetiro), FormatFloat('#,##0.00', FTotDeposito),''], -1, clWindowText));                                         // =
		end;

	rcRowBegin:
		begin
			DecodeDate(DataSet.FieldByName('F_LIQUIDACION').asDateTime, Anio, Mes, Dia);
	
//			If Dia <> FDia Then
			If DataSet.FieldByName('F_LIQUIDACION').asDateTime <> FFecha Then
			Begin
//				FDia:= Dia;
				FFecha:= DataSet.FieldByName('F_LIQUIDACION').asDateTime;				
				StrGrid.SetActualHeight(ALTO_COL);

				If Not FIniciaConsulta then
				Begin
					StrGrid.ToHeader(StrGrid.AddHeader(['','','','','','','','','','','Total del Día: '+ FCaption, FormatFloat('#,##0.00', FSumRetiro),FormatFloat('#,##0.00', FSumDeposito),''], -1, clWindowText)); // Se agregó un '', porque estaba desfasado MZARATE MAR-2002
					FSumRetiro:= 0;
					FSumDeposito:= 0;
				end;

				FCaption:= DataSet.FieldByName('F_LIQUIDACION').asString;
				StrGrid.AddTitle('Movimientos del día: '+ FCaption, tcLeft);
				StrGrid.AddTab(Trim(IntToStr(Dia)), IntToStr(StrGrid.ActualY - 1));

				FIniciaConsulta:= False;
			end;


			If DataSet.FieldByName('CVE_AF_IMP_CAR').asString = 'I' then
			Begin
				FSumRetiro:= FSumRetiro + DataSet.FieldByName('IMP_TRANS').AsFloat;
				FTotRetiro:= FTotRetiro + DataSet.FieldByName('IMP_TRANS').AsFloat;
			end
			else
			Begin
				FSumDeposito:= FSumDeposito + DataSet.FieldByName('IMP_TRANS').AsFloat;
				FTotDeposito:= FTotDeposito + DataSet.FieldByName('IMP_TRANS').AsFloat;
			end;


			If Trim(Dataset.FieldByName('CONCEPTO2').asString) = '' Then StrGrid.SetActualHeight(ALTO_COL)
			else StrGrid.SetActualHeight(ALTO_DOBLE);
                        If Trim(Dataset.FieldByName('TX_INF_FISCAL').asString) <> '' Then
                          StrGrid.SetActualHeight(ALTO_DOBLE + ALTO_COL);
		end;
	end;
end;


(***********************************************FORMA CONPAGARE********************)
(*  FORMA DE CONPAGARE                                                            *)
(***********************************************FORMA CONPAGARE********************)

procedure TWConTransa.FormShow(Sender: TObject);
begin
	Objeto.F_Inicio.Control:= edFInicio;
	Objeto.F_Fin.Control:= edFFin;

	Objeto.Saldo.V_SDO_EFE_DV.Control:= edV_SDO_EFE_DV;
	Objeto.Saldo.V_SDO_BLOQ_DV.Control:= edV_SDO_BLOQ_DV;
	Objeto.Saldo.V_SDO_COMP_DV.Control:= edV_SDO_COMP_DV;
	Objeto.Saldo.V_SDO_DEUD_DV.Control:= edV_SDO_DEUD_DV;
	Objeto.Saldo.Disponible.Control:= edDisponible;
	Objeto.Saldo.LinSobregiro.Control:= edLinSobregiro;
	Objeto.Saldo.V_SDO_SOBGIR_DV.Control:= edV_SDO_SOBGIR_DV;
	Objeto.Saldo.V_SDO_DNC_DV.Control:= edV_SDO_DNC_DV;
	Objeto.Saldo.V_SDO_SBC_DV.Control:= edV_SDO_SBC_DV;
	Objeto.Saldo.Contable.Control:= edContable;
        Objeto.Saldo.PendTarj.Control:= edPEND_TD;   //qutl4600 241004
	InterCtoPanel1.Frame:= Objeto.Contrato;

        sgMovto.ApliEmail:=Objeto.Apli;
        InterCtoPanel1.ShowEnviarEmail:=True;
        InterCtoPanel1.SGCtrlEmail:=sgMovto;

	lbHeaderValuacion.Caption:= 'Valuación al día ' + FmtFecha(Objeto.Apli.DameFechaEmpresaDia('D000'), '@D de @MMMM de @YYYY');
	bHoy.Down:= True;
	Objeto.periodo:= tpHoy;
        InterDateTimePicker1.DateTime := StrToDate(edFInicio.Text);
        InterDateTimePicker1.DateTime := StrToDate(edFFin.Text);
        Objeto.Saldo.V_IMP_COM_VIRT_AUD.Control:=iedV_IMP_COM_VIRT_AUD;//MARA4356 DIC 2006 SALDOS BLOQUEADOS POR AUTORIDAD
end;

procedure TWConTransa.FormDestroy(Sender: TObject);
begin
	Objeto.F_Inicio.Control:= nil;
	Objeto.F_Fin.Control:= nil;

        Objeto.Saldo.V_SDO_EFE_DV.Control:= nil;
	Objeto.Saldo.V_SDO_BLOQ_DV.Control:= nil;
	Objeto.Saldo.V_SDO_COMP_DV.Control:= nil;
	Objeto.Saldo.V_SDO_DEUD_DV.Control:= nil;
	Objeto.Saldo.Disponible.Control:= nil;
	Objeto.Saldo.LinSobregiro.Control:= nil;
	Objeto.Saldo.V_SDO_SOBGIR_DV.Control:= nil;
	Objeto.Saldo.V_SDO_DNC_DV.Control:= nil;
	Objeto.Saldo.V_SDO_SBC_DV.Control:= nil;
	Objeto.Saldo.Contable.Control:= nil;
        Objeto.Saldo.PendTarj.Control:= NIL; //qutl4600 241004
        Objeto.Saldo.V_IMP_COM_VIRT_AUD.Control:=nil;//MARA4356 DIC 2006 SALDOS BLOQUEADOS POR AUTORIDAD
end;

procedure TWConTransa.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWConTransa.SpeedButton1Click(Sender: TObject);
begin
// NUEVA VALIDACION DE ACCESOS A BOTONES.  AUTO OCT 2012
IF not ValidaAccesoEsp(objeto.apli, 'TCONTRANSA_BTN0',true, true) THEN EXIT;

   if StrToDate(edFInicio.Text) <= StrToDate(edFFin.Text) then
     Objeto.periodo:= tpMesAnterior
   else
     ShowMessage('El rango de fechas es incorrecto');
end;

procedure TWConTransa.SpeedButton2Click(Sender: TObject);
begin
// NUEVA VALIDACION DE ACCESOS A BOTONES.  AUTO OCT 2012
IF not ValidaAccesoEsp(objeto.apli, 'TCONTRANSA_BTN1',true, true) THEN EXIT;

  if StrToDate(edFInicio.Text) <= StrToDate(edFFin.Text) then
     Objeto.periodo:= tpMesActual
   else
     ShowMessage('El rango de fechas es incorrecto');
end;

procedure TWConTransa.SpeedButton3Click(Sender: TObject);
begin
// NUEVA VALIDACION DE ACCESOS A BOTONES.  AUTO OCT 2012
IF not ValidaAccesoEsp(objeto.apli, 'TCONTRANSA_BTN2',true, true) THEN EXIT;

 if StrToDate(edFInicio.Text) <= StrToDate(edFFin.Text) then
   Objeto.periodo:= tpHoy
 Else
    ShowMessage('El rango de fechas es incorrecto');
end;

procedure TWConTransa.bRangoClick(Sender: TObject);
begin 

// NUEVA VALIDACION DE ACCESOS A BOTONES.  AUTO OCT 2012
IF not ValidaAccesoEsp(objeto.apli, 'TCONTRANSA_BTN3',true, true) THEN EXIT;

   if StrToDate(edFInicio.Text) <= StrToDate(edFFin.Text) then Begin
     Objeto.i_Rango := True;
     Objeto.periodo := tpRango;
     Objeto.i_Rango := False;
   end else
     ShowMessage('El rango de fechas es incorrecto');
end;

procedure TWConTransa.InterForma1Preview(Sender: TObject);
begin	sgMovto.Print(True, True, Objeto.Apli);
end;

procedure TWConTransa.InterForma1Imprimir(Sender: TObject);
begin	sgMovto.Print(False, True, Objeto.Apli);
end;


procedure TWConTransa.InterForma1Buscar(Sender: TObject);
begin
  {***}

  If Objeto.CttoInterno.Busca Then Begin
    InterCtoPanel1.Frame:= Objeto.CttoInterno;
    Objeto.Contrato:= Objeto.CttoInterno;
    Objeto.periodo:= Objeto.Periodo;
  end;
end;


procedure TWConTransa.sgMovtoDblClick(Sender: TObject);
begin
  Try
    Objeto.FTransacc.Active := True;
    if Objeto.FTransacc.FindKey([StrToInt(sgMovto.cellStr['ID_TRANSACCION',sgMovto.SG.selection.Top])]) then
      Objeto.FTransacc.Consulta
    else
    begin
      Objeto.FTransacc_HIST.Active := True;
      if Objeto.FTransacc_HIST.FindKey([StrToInt(sgMovto.cellStr['ID_TRANSACCION',sgMovto.SG.selection.Top])]) then
         Objeto.FTransacc_HIST.Consulta
      else
    end;
  except
  end;
end;

end.
