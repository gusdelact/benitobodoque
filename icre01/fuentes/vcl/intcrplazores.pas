// Sistema         : Clase de CrPlazoRe
// Fecha de Inicio : 23/11/2009
// Función forma   : Clase de CrPlazoRe
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : HEGC. Claudia Hernandez Gonzalez
// Comentarios     : Consulta de Plazo Residual
Unit IntCrPlazoRes;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,IntParamCre,
IntCrAcredit, IntCrCredito, IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
IntSGCtrl, IntGenCre, Grids, DBGrids,ComObj,
IntXls, Spin;

Type
 TCrPlazoRe= class;

  TWCrPlazoRe=Class(TForm)
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Label2: TLabel;
    Label6: TLabel;
    Label1: TLabel;
    btMuestraDatos: TBitBtn;
    dtp_FECHACIERRE: TDateTimePicker;
    DBGrid1: TDBGrid;
    edFileNameXLS: TEdit;
    btnGeneraArchivo: TButton;
    ProgressBar: TProgressBar;
    bbExtraeInformacion: TBitBtn;
    btnSaveFileName: TButton;
    rgTipoConsulta: TRadioGroup;
    rgTipoConciliador: TRadioGroup;
    seRango: TSpinEdit;
    InterForma1: TInterForma;
    qryConPLAZORESIDUAL: TQuery;
    dsConPlazoREsidual: TDataSource;
    SaveDialog: TSaveDialog;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    bbcoicnresaldos: TBitBtn;
    DBGrid2: TDBGrid;
    Label4: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    bbCoincreSdo: TButton;
    ProgressBar1: TProgressBar;
    qryCoincreSdos: TQuery;
    dsCoincreSector: TDataSource;
    sdCoincreSector: TSaveDialog;
    qrsCoincreSector: TQuery;
    dsCoincreSdos: TDataSource;
    sdCoincreSdos: TSaveDialog;
    Label5: TLabel;
    DateTimePicker2: TDateTimePicker;
    bbConsolidadoSec: TBitBtn;
    Label7: TLabel;
    Edit2: TEdit;
    Button3: TButton;
    bbGenConsSec: TButton;
    ProgressBar2: TProgressBar;
    DBGrid3: TDBGrid;
    rgCoincreTipoRep: TRadioGroup;
    Label8: TLabel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure btMuestraDatosClick(Sender: TObject);
    procedure bbExtraeInformacionClick(Sender: TObject);
    procedure btnGeneraArchivoClick(Sender: TObject);
    procedure btnSaveFileNameClick(Sender: TObject);
    procedure HabilitaControles(pebHabilita : Boolean);
    procedure HabilitaControlesCOINCRE(pebHabilita : Boolean);
    procedure HabilitaControlesConsolidado(pebHabilita : Boolean);
    function  GeneraArchivoExcel(peFileName : String) : Boolean;
    function  GeneraArchivoExcelCOINCRE(peFileName : String) : Boolean;
    function  GeneraArchivoExcelConsolidado(peFileName : String) : Boolean;
    procedure edFileNameXLSKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rgTipoConsultaClick(Sender: TObject);
    procedure rgTipoConciliadorClick(Sender: TObject);
    procedure bbcoicnresaldosClick(Sender: TObject);
    procedure bbConsolidadoSecClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure bbCoincreSdoClick(Sender: TObject);
    procedure bbGenConsSecClick(Sender: TObject);
    private
    procedure MuestraDatos(pAnioMes:String;pTipoconsulta,pTipoConciliador:Integer);
    procedure MuestraDatosCoincreSdo(pAnio,PMes:String;TipoReport:Integer);
    procedure MuestraDatosConsolidadoSec(pdiaMesAnio:TDateTime);
    { Private declarations } 
    public
    { Public declarations }
    Objeto : TCrPlazoRe;
end;
 TCrPlazoRe= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        F_CIERRE   : TInterCampo;

        ParamCre   : TParamCre;
        CrCredito  : TCrCredito;
        Acreditado : TCrAcredit;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override; 
        function    Reporte:Boolean; override; 
      published 
      end;



implementation

{$R *.DFM}


constructor TCrPlazoRe.Create( AOwner : TComponent ); 
begin Inherited;
  StpName  := ' ';
  UseQuery := False;
  HelpFile := 'IntCrPlazoRe.Hlp';
  ShowMenuReporte:=True;
end;

Destructor TCrPlazoRe.Destroy;
begin inherited;
end;


function TCrPlazoRe.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrPlazoRe;
begin
   W:=TWCrPlazoRe.Create(Self);
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


Function TCrPlazoRe.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrPlazoReit','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

function TCrPlazoRe.Reporte:Boolean;
begin //Execute_Reporte();
end;


procedure TWCrPlazoRe.FormShow(Sender: TObject);
begin
   With Objeto Do
     Begin
          lbDempresa.Caption := ParamCre.EMPRESA.AsString;
          lbDfecha.Caption   := ParamCre.FECHA.AsString;
          lbDUsuario.Caption := ParamCre.USUARIO.AsString;
          lbDPerfil.Caption  := ParamCre.PERFIL.AsString;
     End;
  dtp_FECHACIERRE.DateTime:= DameFinMes(Objeto.Apli.DameFechaEmpresaDia('D000'));
  DateTimePicker1.DateTime:= DameFinMes(Objeto.Apli.DameFechaEmpresaDia('D000'));
  DateTimePicker2.DateTime:= DameFinMes(Objeto.Apli.DameFechaEmpresaDia('D000'));
end;

procedure TWCrPlazoRe.FormDestroy(Sender: TObject);
begin
   //Objeto
end;

procedure TWCrPlazoRe.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 QRYConPLazoREsidual.Close;
  Action := caFree;

end;

procedure TWCrPlazoRe.btMuestraDatosClick(Sender: TObject);
var
  stpInserta : TStoredProc;
  vlQry  :TQuery;
  sYeMo,
  sSQL   :String;
  nDay,
  nYear,
  nMonth :Word;
  vlFEchaCierre:tDateTime;
  vlYeMo:Integer;
begin
   if Objeto.ValidaAccesoEsp('TCRPLAZORE_MDAT1',True,True) then
   begin
      dtp_FECHACIERRE.DateTime:= DameFinMes(dtp_FECHACIERRE.DateTime);
      DecodeDate(dtp_FECHACIERRE.DATETIME, nYear, nMonth, nDay);

      DateTimeToString(sYeMo,'yyyymm',dtp_FECHACIERRE.DateTime);
      vlYemo:=StrToInt(sYeMo);


      MuestraDatos(sYeMo,rgTipoConsulta.itemIndex,rgTipoConciliador.itemindex);
   end;
end;

Procedure TWCrPlazoRe.MuestraDatos(pAnioMes:String;pTipoConsulta,pTipoConciliador:Integer);
Var
   vlQry : TQuery;
   sSQL,vlFiltro :String;
Begin
 vlFiltro:='';
 If pTipoConsulta=0
 then
 Begin
  sSQL:=' SELECT  P.CVE_TIPO_SECTOR AS "Sector Persona", '+
             ' CRMS.CVE_SECTOR_CNBV AS "Sector CNBV"   , '+
             ' CCAS.ID_CREDITO      AS "Crédito"            , '+
             ' CCAC1.CVE_CAT_MINIMO AS "Catálogo Mínimo",'+
             ' CCAC1.CVE_MONEDA     AS "Moneda", '+
        ' decode(CCAS.cve_tipo_Cart,''VIG'',''Vigente'',''IMP'',''Impagado'',''VDO'',''Vencido'') AS "Tipo Cartera", '+
        ' CCAS.CVE_TIPO_SDO         AS "Identificador Saldo", '+
        ' CCAS.IMP_CONCEPTO as "Importe Concepto" '+
        ' FROM  CR_REGUL_ESTRA  CCAS, ( SELECT CCAC.ID_CREDITO, CCAC.ID_ACREDITADO, CCAC.CVE_CAT_MINIMO, CCAC.F_VENCIMIENTO, CCAC.CVE_MONEDA '+
        '                               FROM CR_CON_ADEU_CLTV CCAC '+
        '                               WHERE CCAC.ID_REG_VIGENTE = 1 '+
        '                             ) CCAC1, PERSONA P, ADMIPROD.CR_REGUL_MAP_SEC CRMS '+
        ' WHERE CCAS.ANIO_MES = '+pAnioMes+
        ' AND CCAC1.ID_CREDITO = CCAS.ID_CREDITO '+
        ' AND P.ID_PERSONA = CCAC1.ID_ACREDITADO '+
        ' AND CRMS.CVE_SECTOR (+)= P.CVE_TIPO_SECTOR '+
        ' ORDER BY CCAC1.CVE_CAT_MINIMO, CCAS.ID_CREDITO ';
  end
 else
   begin
     sSQL:= '   SELECT                                       '+
            '         CCAS.ANIO_MES                as "Año Mes",                '+
            '         CCAS.ID_CREDITO              AS "Crédito",                '+
            '         decode(CCAS.cve_tipo_Cart,''VIG'',''Vigente'',''IMP'',''Impagado'',''VDO'',''Vencido'') AS "Tipo Cartera", '+
//            '		 CCAS.CVE_TIPO_SDO         as "Tipo Saldo",             '+
            '                 CCAS.IMP_CONSOLIDADO as "Importe Consolidado",    '+
  //          '		 sum(CCAS.IMP_CONCEPTO)    as "Importe Concepto",       '+
            '		 CCAS2.TOTAL               as "Importe Concepto",                  '+
	    '   	 CCAS.IMP_CONSOLIDADO-CCAS2.TOTAL AS "Diferencia"       ' +
            '  FROM  CR_REGUL_ESTRA  CCAS,                   '+
            '       ( SELECT CCAC.ID_CREDITO,                '+
            '                CCAC.ID_ACREDITADO,             '+
            '                CCAC.CVE_CAT_MINIMO,            '+
            '                CCAC.F_VENCIMIENTO,             '+
            '				CCAC.CVE_MONEDA  '+
            '        FROM CR_CON_ADEU_CLTV CCAC              '+
            '         WHERE CCAC.ID_REG_VIGENTE = 1          '+
            '       ) CCAC1,                                 '+
            '       PERSONA P,                               '+
            '       ADMIPROD.CR_REGUL_MAP_SEC CRMS,                    '+
            '       ( SELECT ID_CREDITO, SUM( IMP_CONCEPTO) TOTAL, CVE_TIPO_CART  '+
            '       FROM CR_REGUL_ESTRA                '+
	    '       WHERE ANIO_MES= '+pAnioMes                +
	    '       GROUP BY ID_CREDITO,CVE_TIPO_CART        '+
	    '       )CCAS2                                         '+
            '  WHERE CCAS.ANIO_MES = '+pAnioMes               +
            '    AND CCAC1.ID_CREDITO = CCAS.ID_CREDITO      '+
            '    AND P.ID_PERSONA = CCAC1.ID_ACREDITADO      '+
            '    AND CRMS.CVE_SECTOR (+)= P.CVE_TIPO_SECTOR  '+
            '	 AND CCAS.ID_CREDITO=CCAS2.ID_CREDITO  AND CCAS.CVE_TIPO_CART=CCAS2.CVE_TIPO_CART  ';


         if rgTipoConciliador.ItemIndex=1
         then vlFiltro:= ' AND CCAS.IMP_CONSOLIDADO-CCAS2.TOTAL not between -'+seRango.Text+' and '+seRango.Text;

         sSql:=sSql+vlFiltro;

         SsQL:=sSQl+'  GROUP BY CCAS.ANIO_MES, CCAS.ID_CREDITO,decode(CCAS.cve_tipo_Cart,''VIG'',''Vigente'',''IMP'',''Impagado'',''VDO'',''Vencido''),CCAS.IMP_CONSOLIDADO ,CCAS2.TOTAL ';

         sSql:=sSQl+'  ORDER BY CCAS.ID_CREDITO ';
   End;

   If QryConPlazoResidual.Active Then QryConPlazoResidual.Close;
     With QryConPlazoResidual Do
     Try
        SQL.Clear;
        SQL.Add(sSQL);

        SQL.SaveToFile('c:\CoPlazoResidual.txt');

        DatabaseName := Objeto.Apli.DatabaseName;
        SessionName  := Objeto.Apli.SessionName;
        Open;
     Finally
     End;
End;


Procedure TWCrPlazoRe.MuestraDatosCoincreSdo(pAnio,PMes:String;TipoReport:Integer);
Var
   vlQry : TQuery;
   sSQL,vlFiltro :String;

   qyQuery : TQuery;
   sSQLDia, VLID_ANIO_MES : String;
Begin
     vlFiltro:='';
     VLID_ANIO_MES := '0';
     sSQL:='  ';

     //Busca la fecha de DWHC
     sSQLDia := 'SELECT ID_ANIO_MES FROM DM_CR_DIM_MES@DWHC ' +
                ' WHERE NUM_MES = ' + PMes + ' AND ANIO = ' + pAnio  + ' ORDER BY ANIO, NUM_MES';
     qyQuery:= GetSQLQuery(sSQLDia, Objeto.DataBaseName, Objeto.SessionName, False);
     try
        If qyQuery <> Nil Then
        Begin
             VLID_ANIO_MES := qyQuery.FieldByName('ID_ANIO_MES').AsString;
         end;
     finally
        qyQuery.Free;
     end;



     //Saldos al Corte
     if  TipoReport = 0 then
     begin
         sSQL:=' SELECT * FROM ( ' +
               ' select ''PESOS'' AS MONEDA, bb.CVE_CAT_MINIMO AS CatalogoMinimo,' +
               '        SUM(AA.IMP_SDO_K_VIG) AS SaldoVigente, SUM(AA.IMP_SDO_K_IMP) AS SaldoImpagado, SUM(AA.IMP_SDO_K_VEN) AS SaldoVencido,' +
               ' 	   SUM(AA.IMP_INT_CORTE) AS InteresVigente, SUM(AA.IMP_SDO_IO_IMP) AS InteresImpagado, SUM(AA.IMP_INT_DEV_VDO) AS InteresVencido,' +
               ' 	   SUM(AA.IMP_INT_COB_ANT) AS IntPagxAnt' +
               ' from (SELECT * FROM DM_CR_FAC_Credito@DWHC WHERE ID_ANIO_MES = ' + VLID_ANIO_MES + ') aa,' +
               '      (SELECT * FROM DM_CR_DIM_Credito@DWHC WHERE ID_OLTP_MONEDA = 484 AND CVE_TIPO_CARTERA = ''BANCAR'') bb' +
               ' where aa.ID_CREDITO = bb.ID_CREDITO' +
               ' GROUP BY CVE_CAT_MINIMO' +
               ' UNION ALL' +
               ' select ''DOLARES'' AS MONEDA, bb.CVE_CAT_MINIMO AS CatalogoMinimo,' +
               '        SUM(AA.IMP_SDO_K_VIG) AS SaldoVigente, SUM(AA.IMP_SDO_K_IMP) AS SaldoImpagado, SUM(AA.IMP_SDO_K_VEN) AS SaldoVencido,' +
               ' 	   SUM(AA.IMP_INT_CORTE) AS InteresVigente, SUM(AA.IMP_SDO_IO_IMP) AS InteresImpagado, SUM(AA.IMP_INT_DEV_VDO) AS InteresVencido,' +
               ' 	   SUM(AA.IMP_INT_COB_ANT) AS IntPagxAnt' +
               ' from (SELECT * FROM DM_CR_FAC_Credito@DWHC WHERE ID_ANIO_MES = ' + VLID_ANIO_MES + ') aa,' +
               '      (SELECT * FROM DM_CR_DIM_Credito@DWHC WHERE ID_OLTP_MONEDA = 840 AND CVE_TIPO_CARTERA = ''BANCAR'') bb' +
               ' where aa.ID_CREDITO = bb.ID_CREDITO' +
               ' GROUP BY CVE_CAT_MINIMO' +
               ' UNION ALL' +
               ' select ''VALOR'' AS MONEDA, bb.CVE_CAT_MINIMO AS CatalogoMinimo,' +
               '        SUM(AA.IMP_SDO_K_VIG_VP) AS SaldoVigente, SUM(AA.IMP_SDO_K_IMP_VP) AS SaldoImpagado, SUM(AA.IMP_SDO_K_VEN_VP) AS SaldoVencido,' +
               ' 	   SUM(AA.IMP_INT_CORTE_VP) AS InteresVigente, SUM(AA.IMP_SDO_IO_IMP_VP) AS InteresImpagado, SUM(AA.IMP_INT_DEV_VDO_VP) AS InteresVencido,' +
               ' 	   SUM(AA.IMP_INT_COB_ANT_VP) AS IntPagxAnt' +
               ' from (SELECT * FROM DM_CR_FAC_Credito@DWHC WHERE ID_ANIO_MES = ' + VLID_ANIO_MES + ') aa,' +
               '      (SELECT * FROM DM_CR_DIM_Credito@DWHC WHERE CVE_TIPO_CARTERA = ''BANCAR'') bb' +
               ' where aa.ID_CREDITO = bb.ID_CREDITO' +
               ' GROUP BY CVE_CAT_MINIMO' +
               ' ) ORDER BY MONEDA, CatalogoMinimo ';
     end;

     //Saldos al Promedio     
     if  TipoReport = 1 then
     begin
         sSQL:=' SELECT * FROM (' +
               ' select ''PESOS'' AS MONEDA, bb.CVE_CAT_MINIMO AS CatalogoMinimo,' +
               '        SUM(AA.IMP_SDO_K_VIG) AS SaldoVigente, SUM(AA.IMP_SDO_K_IMP) AS SaldoImpagado, SUM(AA.IMP_SDO_K_VEN) AS SaldoVencido,' +
               ' 	   SUM(AA.IMP_SPM_K_VIG) AS SaldoPromedioVigente, SUM(AA.IMP_SPM_K_IMP) AS SaldoPromedioImpagado, SUM(AA.IMP_SPM_K_VEN) AS SaldoPromedioVencidoCap,' +
               ' 	   SUM(IMP_IO_DEV) AS InteresesGenerados' +
               ' from (SELECT * FROM DM_CR_FAC_Credito@DWHC WHERE ID_ANIO_MES = ' + VLID_ANIO_MES + ') aa,' +
               '      (SELECT * FROM DM_CR_DIM_Credito@DWHC WHERE ID_OLTP_MONEDA = 484 AND CVE_TIPO_CARTERA = ''BANCAR'') bb' +
               ' where aa.ID_CREDITO = bb.ID_CREDITO' +
               ' GROUP BY bb.CVE_CAT_MINIMO' +
               ' UNION ALL' +
               ' select ''DOLARES'' AS MONEDA, bb.CVE_CAT_MINIMO AS CatalogoMinimo,' +
               '        SUM(AA.IMP_SDO_K_VIG) AS SaldoVigente, SUM(AA.IMP_SDO_K_IMP) AS SaldoImpagado, SUM(AA.IMP_SDO_K_VEN) AS SaldoVencido,' +
               ' 	   SUM(AA.IMP_SPM_K_VIG) AS SaldoPromedioVigente, SUM(AA.IMP_SPM_K_IMP) AS SaldoPromedioImpagado, SUM(AA.IMP_SPM_K_VEN) AS SaldoPromedioVencidoCap,' +
               ' 	   SUM(IMP_IO_DEV) AS InteresesGenerados' +
               ' from (SELECT * FROM DM_CR_FAC_Credito@DWHC WHERE ID_ANIO_MES = ' + VLID_ANIO_MES + ') aa,' +
               '      (SELECT * FROM DM_CR_DIM_Credito@DWHC WHERE ID_OLTP_MONEDA = 840 AND CVE_TIPO_CARTERA = ''BANCAR'') bb' +
               ' where aa.ID_CREDITO = bb.ID_CREDITO' +
               ' GROUP BY bb.CVE_CAT_MINIMO' +
               ' UNION ALL' +
               ' select ''VALOR'' AS MONEDA, bb.CVE_CAT_MINIMO AS CatalogoMinimo,' +
               '        SUM(AA.IMP_SDO_K_VIG_VP) AS SaldoVigente, SUM(AA.IMP_SDO_K_IMP_VP) AS SaldoImpagado, SUM(AA.IMP_SDO_K_VEN_VP) AS SaldoVencido,' +
               ' 	   SUM(AA.IMP_SPM_K_VIG_VP) AS SaldoPromedioVigente, SUM(AA.IMP_SPM_K_IMP_VP) AS SaldoPromedioImpagado, SUM(AA.IMP_SPM_K_VEN_VP) AS SaldoPromedioVencidoCap,' +
               ' 	   SUM(IMP_IO_DEV_VP) AS InteresesGenerados' +
               ' from (SELECT * FROM DM_CR_FAC_Credito@DWHC WHERE ID_ANIO_MES = ' + VLID_ANIO_MES + ') aa,' +
               '      (SELECT * FROM DM_CR_DIM_Credito@DWHC WHERE CVE_TIPO_CARTERA = ''BANCAR'') bb' +
               ' where aa.ID_CREDITO = bb.ID_CREDITO' +
               ' GROUP BY bb.CVE_CAT_MINIMO' +
               ' ) ORDER BY MONEDA, CatalogoMinimo ';
     end;

     If qryCoincreSdos.Active Then qryCoincreSdos.Close;
     With qryCoincreSdos Do
     Try
        SQL.Clear;
        SQL.Add(sSQL);

        SQL.SaveToFile('c:\CoPlazoResidual.txt');

        DatabaseName := Objeto.Apli.DatabaseName;
        SessionName  := Objeto.Apli.SessionName;
        Open;
     Finally
     End;
end;

Procedure TWCrPlazoRe.MuestraDatosConsolidadoSec(pdiaMesAnio:TDateTime);
Var
   vlQry : TQuery;
   sSQL,vlFiltro :String;
Begin
     vlFiltro:='';
     sSQL:= '  SELECT ' +
            '  P.CVE_TIPO_SECTOR, ' +
            '  CCAC1.CVE_MONEDA, ' +
            '  CRMS.CVE_SECTOR_CNBV, ' +
            '  CCAS.ID_CREDITO, ' +
            '  CCAC1.CVE_CAT_MINIMO, ' +
            '  CCAC1.F_VENCIMIENTO, ' +
            '  CCAS.IMP_CAP_VIG, ' +
            '  CCAS.IMP_CAP_IMP, ' +
            '  CCAS.IMP_CAP_VDO_EX, ' +
            '  CCAS.IMP_CAP_VDO_NE, ' +
            '  CCAS.IMP_INT_VIG, ' +
            '  CCAS.IMP_INT_IMP, ' +
            '  CCAS.IMP_INT_VDO_EX ' +
            '  FROM CR_CON_ADEUDO_SDO CCAS, ' +
            '    ( SELECT CCAC.ID_CREDITO, ' +
            '      CCAC.ID_ACREDITADO, ' +
            '      CCAC.CVE_CAT_MINIMO, ' +
            '      CCAC.F_VENCIMIENTO, ' +
            '  	   CCAC.CVE_MONEDA ' +
            '      FROM CR_CON_ADEU_CLTV CCAC ' +
            '      WHERE CCAC.ID_REG_VIGENTE = 1 ' +
            '    ) CCAC1, ' +
            '      PERSONA P, ' +
            '      ADMIPROD.CR_REGUL_MAP_SEC CRMS ' +
            '  WHERE CCAS.F_CIERRE = ' + SQLFecha(pdiaMesAnio) +
            '  AND CCAC1.ID_CREDITO = CCAS.ID_CREDITO ' +
            '  AND P.ID_PERSONA = CCAC1.ID_ACREDITADO ' +
            '  AND CRMS.CVE_SECTOR (+)= P.CVE_TIPO_SECTOR ';


     If qrsCoincreSector.Active Then qrsCoincreSector.Close;
     With qrsCoincreSector Do
     Try
        SQL.Clear;
        SQL.Add(sSQL);

        SQL.SaveToFile('c:\CoPlazoResidual.txt');

        DatabaseName := Objeto.Apli.DatabaseName;
        SessionName  := Objeto.Apli.SessionName;
        Open;
     Finally
     End;
end;

procedure TWCrPlazoRe.bbExtraeInformacionClick(Sender: TObject);
Var
  stpInserta : TStoredProc;
  vlQry  :TQuery;
  sYeMo, sFechaCierre,
  sSQL   :String;
  nDay,
  nYear,
  nMonth :Word;

  VLDay,
  VLYear,
  VLMonth :String;

  vlFEchaCierre:tDateTime;
  vlYeMo:Integer;
begin
   if Objeto.ValidaAccesoEsp('TCRPLAZORE_EXTIN',True,True) then
   begin

      if MessageDlg('Desea ejecutar la carga de Plaso Residual?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin

          dtp_FECHACIERRE.DateTime:= DameFinMes(dtp_FECHACIERRE.DateTime);
          DecodeDate(dtp_FECHACIERRE.DATETIME, nYear, nMonth, nDay);

          DateTimeToString(VLYear,'yyyy',dtp_FECHACIERRE.DateTime);
          DateTimeToString(VLMonth,'mm',dtp_FECHACIERRE.DateTime);

          if StrToInt(VLMonth) = 12 then
          begin
               vlYemo:=    StrToInt(IntToStr(StrToInt(VLYear) + 1)+'01')
          end
          else
          begin
               DateTimeToString(sYeMo,'yyyymm',dtp_FECHACIERRE.DateTime);
               vlYemo:=StrToInt(sYeMo) + 1;
          end;

          qryConPlazoresidual.close;

          Try
             vlFechaCierre:=EncodeDate(nYear,nMonth,nDay);

             stpInserta:=TStoredProc.Create(Nil);
             stpInserta.DatabaseName  :=Objeto.Apli.DataBaseName;
             stpInserta.SessionName   :=Objeto.Apli.SessionName;
             stpInserta.StoredProcName:='PKGCRPLAZORESIDUAL' + '.STPCARGAPLAZOR';
             stpInserta.Params.Clear;
             stpInserta.Params.CreateParam(ftFloat,  'PEANIOMES',   ptInput);
             stpInserta.Params.CreateParam(ftFloat,  'PSRESULTADO',   ptOutput);
             stpInserta.Params.CreateParam(ftString, 'PSTXRESULTADO', ptOutput);
             stpInserta.Prepare;
             stpInserta.ParamByName('PEANIOMES').AsInteger    :=  vlYemo;
             stpInserta.ExecProc;

             If stpInserta.ParamByName('PSRESULTADO').AsInteger <> 0 Then Begin
                 ShowMessage('PROBLEMAS AL GRABAR DATOS PARA EL REPORTE: ' +
                     IntToStr(stpInserta.ParamByName('PSRESULTADO').AsInteger)+
                             stpInserta.ParamByName('PSTXRESULTADO').AsString);
             End
             else
             begin
                 ShowMessage('Carga Concluida de forma exitosa.');
             end;
          Finally
             If stpInserta <> Nil Then Begin
               stpInserta.UnPrepare;
               stpInserta.Free;
             End;
          End;
      end;
   end;
end;

procedure TWCrPlazoRe.btnGeneraArchivoClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRPLAZORE_GENAR',True,True) then
   begin
       If Not qryConPlazoResidual.Active Then
        Begin
          MessageDlg('No existe información del Año Mes '+ FormatDateTime('YYYYMM',dtp_FECHACIERRE.DateTime),
                      mtWarning, [mbOk], 0 );
          Exit;
        End
        Else If (Trim(ExtractFileName(edFileNameXLS.Text)) = '') Then
        Begin
          MessageDlg('Debe de indicar primero el nombre del archivo en donde desea guardar la información.',
                      mtWarning, [mbOk], 0 );
          Exit;
        End
        Else If (LowerCase(Trim(ExtractFileExt(edFileNameXLS.Text))) <> '.xls') Then
        Begin
          edFileNameXLS.Text := edFileNameXLS.Text + '.xls';
        End;

        HabilitaControles(False);
        try
           GeneraArchivoExcel(edFileNameXLS.Text);
        except
             ShowMessage('Proceso concluido');
        end;
        HabilitaControles(True);
   end;
end;

procedure TWCrPlazoRe.HabilitaControles(pebHabilita: Boolean);
begin
  dtp_FECHACIERRE.Enabled := pebHabilita;
  btMuestraDatos.Enabled := pebHabilita;
  dsCONPLAZORESIDUAL.Enabled := pebHabilita;
  edFileNameXLS.Enabled := pebHabilita;
  btnSaveFileName.Enabled := pebHabilita;
  btnGeneraArchivo.Enabled := pebHabilita;
end;

procedure TWCrPlazoRe.HabilitaControlesCOINCRE(pebHabilita : Boolean);
begin
  DateTimePicker1.Enabled := pebHabilita;
  bbcoicnresaldos.Enabled := pebHabilita;
  dsCoincreSdos.Enabled := pebHabilita;
  Edit1.Enabled := pebHabilita;
  Button1.Enabled := pebHabilita;
  bbCoincreSdo.Enabled := pebHabilita;
end;

procedure TWCrPlazoRe.HabilitaControlesConsolidado(pebHabilita : Boolean);
begin
  DateTimePicker2.Enabled := pebHabilita;
  bbConsolidadoSec.Enabled := pebHabilita;
  dsCoincreSector.Enabled := pebHabilita;
  Edit2.Enabled := pebHabilita;
  Button3.Enabled := pebHabilita;
  bbGenConsSec.Enabled := pebHabilita;
end;


procedure TWCrPlazoRe.btnSaveFileNameClick(Sender: TObject);
begin
  If SaveDialog.Execute Then
    edFileNameXLS.Text := SaveDialog.FileName;
end;

function TWCrPlazoRe.GeneraArchivoExcelCOINCRE(peFileName : String) : Boolean;
var
    vlRange : Variant;
    vlCol, vlRow : Integer;
    vlExcelApp : OleVariant;
    vlColumnRange : Variant;
    VLSalida      : Boolean;
begin

    Result := False;
    ProgressBar1.Min := 0;
    ProgressBar1.Position := 0;
    VLSalida := False;

    If Not qryCoincreSdos.Active Then
      Exit;

    vlExcelApp := CreateOleObject('Excel.Application');
    Try
       vlExcelApp.Workbooks.Add;
       //----------------------------------
       // INICIA COLOCACIÓN DE ENCABEZADOS
       vlRow := 1;

    // Coloca el tipo de fuente a 8     y los titulos de las columnas
    vlColumnRange := vlExcelApp.Workbooks[1].WorkSheets[1].Columns;
    For vlCol := 0 To DBGrid2.DataSource.DataSet.FieldCount-1 Do
      Begin
      vlColumnRange.Columns[vlCol+1].Font.Size := 8;
      vlExcelApp.Cells[1, vlCol+1 ].Value:=DBGrid2.DataSource.DataSet.fields[vlCol].FullName;
      End;

       //----------------------------------
       // INICIA EL LLENADO DE DATOS HACIA
       // EL ARCHIVO DE EXCEL
    ProgressBar1.Max := DBGrid2.DataSource.DataSet.RecordCount;
    DBGrid2.DataSource.DataSet.First;

    vlRow := 2;
    While not  DBGrid2.DataSource.DataSet.eof do
    Begin
      For vlCol := 0 To DBGrid2.DataSource.DataSet.FieldCount-1 Do
        Begin
          vlExcelApp.Cells[vlRow , vlCol +1 ].Value :=DBGrid2.datasource.dataset.fields[vlcol].asstring;
          Application.ProcessMessages;
        End;
        Application.ProcessMessages;
        Inc(vlRow);
        ProgressBar1.Position := vlRow;
        DBGrid2.DataSource.DataSet.next;
    End;

    VLSalida := True;

       //-----------------------------------------------
       //         INICIA FORMATOS DE CELDAS
       //-----------------------------------------------
       //


       // Modifica el tamaño de la fuente
       vlColumnRange := vlExcelApp.Workbooks[1].WorkSheets[1].Columns;
       For vlCol := 1 To DBGrid2.DataSource.DataSet.FieldCount-1 Do
       Begin
            vlColumnRange.Columns[vlCol].Font.Size := 8;
       End;

       // Colocación de colores de banda de titulos
       vlRange := vlExcelApp.Workbooks[1].WorkSheets[1].Range['A1:'+IntToColumnXlS(vlCol)+'1'];
       vlRange.Font.FontStyle := 'Bold';
       vlRange.Font.Color := clWhite;
       vlRange.Columns.Interior.ColorIndex := 1; // Negro
       vlRange.WrapText := True;


       For vlCol := 1 To DBGrid2.DataSource.DataSet.FieldCount-1 Do
       Begin
         vlRange := vlExcelApp.Workbooks[1].WorkSheets[1].Range[IntToColumnXlS(vlCol)+'1:'+IntToColumnXlS(vlCol)+'1'];
         vlRange.WrapText := True;
       End;

//       If rgTipoConsulta.itemindex = 0
//       then
//       Begin
//           vlRange := vlExcelApp.Workbooks[1].WorkSheets[1].Range['D1:D'+IntToStr(vlRow-1)];
//           vlRange.NumberFormat := '0';
//           vlRange := vlExcelApp.Workbooks[1].WorkSheets[1].Range['H1:H'+IntToStr(vlRow-1)];
//           vlRange.NumberFormat := '#,##0.00';
//
//       End
//       else
//         Begin
//           vlRange := vlExcelApp.Workbooks[1].WorkSheets[1].Range['D1:G'+IntToStr(vlRow-1)];
//            vlRange.NumberFormat := '#,##0.00';
//         End;

    Finally
       HabilitaControlesCOINCRE(True);
       vlExcelApp.ActiveWorkBook.SaveAs(peFileName);
       if CloseExcelFile(vlExcelApp) then
          ShowMessage('Archivo Generado')
       else
          ShowMessage('Archio no generado');
    End;

    GeneraArchivoExcelCOINCRE := VLSalida;
end;

function TWCrPlazoRe.GeneraArchivoExcelConsolidado(peFileName : String) : Boolean;
var
    vlRange : Variant;
    vlCol, vlRow : Integer;
    vlExcelApp : OleVariant;
    vlColumnRange : Variant;
    VLSalida      : Boolean;
begin

    Result := False;
    ProgressBar2.Min := 0;
    ProgressBar2.Position := 0;
    VLSalida := False;

    If Not qrsCoincreSector.Active Then
      Exit;

    vlExcelApp := CreateOleObject('Excel.Application');
    Try
       vlExcelApp.Workbooks.Add;
       //----------------------------------
       // INICIA COLOCACIÓN DE ENCABEZADOS
       vlRow := 1;

    // Coloca el tipo de fuente a 8     y los titulos de las columnas
    vlColumnRange := vlExcelApp.Workbooks[1].WorkSheets[1].Columns;
    For vlCol := 0 To DBGrid3.DataSource.DataSet.FieldCount-1 Do
      Begin
      vlColumnRange.Columns[vlCol+1].Font.Size := 8;
      vlExcelApp.Cells[1, vlCol+1 ].Value:=DBGrid3.DataSource.DataSet.fields[vlCol].FullName;
      End;

       //----------------------------------
       // INICIA EL LLENADO DE DATOS HACIA
       // EL ARCHIVO DE EXCEL
    ProgressBar2.Max := DBGrid3.DataSource.DataSet.RecordCount;
    DBGrid3.DataSource.DataSet.First;

    vlRow := 2;
    While not  DBGrid3.DataSource.DataSet.eof do
    Begin
      For vlCol := 0 To DBGrid3.DataSource.DataSet.FieldCount-1 Do
        Begin
          vlExcelApp.Cells[vlRow , vlCol +1 ].Value :=DBGrid3.datasource.dataset.fields[vlcol].asstring;
          Application.ProcessMessages;
        End;
        Application.ProcessMessages;
        Inc(vlRow);
        ProgressBar2.Position := vlRow;
        DBGrid3.DataSource.DataSet.next;
    End;

    VLSalida := True;

       //-----------------------------------------------
       //         INICIA FORMATOS DE CELDAS
       //-----------------------------------------------
       //


       // Modifica el tamaño de la fuente
       vlColumnRange := vlExcelApp.Workbooks[1].WorkSheets[1].Columns;
       For vlCol := 1 To DBGrid3.DataSource.DataSet.FieldCount-1 Do
       Begin
            vlColumnRange.Columns[vlCol].Font.Size := 8;
       End;

       // Colocación de colores de banda de titulos
       vlRange := vlExcelApp.Workbooks[1].WorkSheets[1].Range['A1:'+IntToColumnXlS(vlCol)+'1'];
       vlRange.Font.FontStyle := 'Bold';
       vlRange.Font.Color := clWhite;
       vlRange.Columns.Interior.ColorIndex := 1; // Negro
       vlRange.WrapText := True;


       For vlCol := 1 To DBGrid3.DataSource.DataSet.FieldCount-1 Do
       Begin
         vlRange := vlExcelApp.Workbooks[1].WorkSheets[1].Range[IntToColumnXlS(vlCol)+'1:'+IntToColumnXlS(vlCol)+'1'];
         vlRange.WrapText := True;
       End;

//       If rgTipoConsulta.itemindex = 0
//       then
//       Begin
//           vlRange := vlExcelApp.Workbooks[1].WorkSheets[1].Range['D1:D'+IntToStr(vlRow-1)];
//           vlRange.NumberFormat := '0';
//           vlRange := vlExcelApp.Workbooks[1].WorkSheets[1].Range['H1:H'+IntToStr(vlRow-1)];
//           vlRange.NumberFormat := '#,##0.00';
//
//       End
//       else
//         Begin
//           vlRange := vlExcelApp.Workbooks[1].WorkSheets[1].Range['D1:G'+IntToStr(vlRow-1)];
//            vlRange.NumberFormat := '#,##0.00';
//         End;

    Finally
       HabilitaControlesConsolidado(True);
       vlExcelApp.ActiveWorkBook.SaveAs(peFileName);
       if CloseExcelFile(vlExcelApp) then
          ShowMessage('Archivo Generado')
       else
          ShowMessage('Archio no generado');
    End;

    GeneraArchivoExcelConsolidado := VLSalida;

end;

function TWCrPlazoRe.GeneraArchivoExcel(peFileName: String): Boolean;
var
    vlRange : Variant;
    vlCol, vlRow : Integer;
    vlExcelApp : OleVariant;
    vlColumnRange : Variant;
    VLSalida      : Boolean;
begin

    Result := False;
    ProgressBar.Min := 0;
    ProgressBar.Position := 0;
    VLSalida := False;

    If Not qryConPlazoResidual.Active Then
      Exit;

    vlExcelApp := CreateOleObject('Excel.Application');
    Try
       vlExcelApp.Workbooks.Add;
       //----------------------------------
       // INICIA COLOCACIÓN DE ENCABEZADOS
       vlRow := 1;

    // Coloca el tipo de fuente a 8     y los titulos de las columnas
    vlColumnRange := vlExcelApp.Workbooks[1].WorkSheets[1].Columns;
    For vlCol := 0 To dbgrid1.DataSource.DataSet.FieldCount-1 Do
      Begin
      vlColumnRange.Columns[vlCol+1].Font.Size := 8;
      vlExcelApp.Cells[1, vlCol+1 ].Value:=dbgrid1.DataSource.DataSet.fields[vlCol].FullName;
      End;

       //----------------------------------
       // INICIA EL LLENADO DE DATOS HACIA
       // EL ARCHIVO DE EXCEL
    ProgressBar.Max := dbgrid1.DataSource.DataSet.RecordCount;
    dbgrid1.DataSource.DataSet.First;

    vlRow := 2;
    While not  dbgrid1.DataSource.DataSet.eof do
    Begin
      For vlCol := 0 To dbgrid1.DataSource.DataSet.FieldCount-1 Do
        Begin
          vlExcelApp.Cells[vlRow , vlCol +1 ].Value :=dbgrid1.datasource.dataset.fields[vlcol].asstring;
          Application.ProcessMessages;
        End;
        Application.ProcessMessages;
        Inc(vlRow);
        ProgressBar.Position := vlRow;
        dbgrid1.DataSource.DataSet.next;
    End;

    VLSalida := True;

       //-----------------------------------------------
       //         INICIA FORMATOS DE CELDAS
       //-----------------------------------------------
       //


       // Modifica el tamaño de la fuente
       vlColumnRange := vlExcelApp.Workbooks[1].WorkSheets[1].Columns;
       For vlCol := 1 To dbgrid1.DataSource.DataSet.FieldCount-1 Do
       Begin
            vlColumnRange.Columns[vlCol].Font.Size := 8;
       End;

       // Colocación de colores de banda de titulos
       vlRange := vlExcelApp.Workbooks[1].WorkSheets[1].Range['A1:'+IntToColumnXlS(vlCol)+'1'];
       vlRange.Font.FontStyle := 'Bold';
       vlRange.Font.Color := clWhite;
       vlRange.Columns.Interior.ColorIndex := 1; // Negro
       vlRange.WrapText := True;


       For vlCol := 1 To dbgrid1.DataSource.DataSet.FieldCount-1 Do
       Begin
         vlRange := vlExcelApp.Workbooks[1].WorkSheets[1].Range[IntToColumnXlS(vlCol)+'1:'+IntToColumnXlS(vlCol)+'1'];
         vlRange.WrapText := True;
       End;

       If rgTipoConsulta.itemindex = 0
       then
       Begin
           vlRange := vlExcelApp.Workbooks[1].WorkSheets[1].Range['D1:D'+IntToStr(vlRow-1)];
           vlRange.NumberFormat := '0';
           vlRange := vlExcelApp.Workbooks[1].WorkSheets[1].Range['H1:H'+IntToStr(vlRow-1)];
           vlRange.NumberFormat := '#,##0.00';

       End
       else
         Begin
           vlRange := vlExcelApp.Workbooks[1].WorkSheets[1].Range['D1:G'+IntToStr(vlRow-1)];
            vlRange.NumberFormat := '#,##0.00';
         End;

    Finally
       HabilitaControles(True);
       vlExcelApp.ActiveWorkBook.SaveAs(peFileName);
       if CloseExcelFile(vlExcelApp) then
          ShowMessage('Archivo Generado')
       else
          ShowMessage('Archio no generado');
    End;

    GeneraArchivoExcel := VLSalida;

end;


procedure TWCrPlazoRe.edFileNameXLSKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key = 13 Then btnGeneraArchivoClick(Self);
end;

procedure TWCrPlazoRe.rgTipoConsultaClick(Sender: TObject);
begin
qryConPlazoREsidual.close;
If rgTipoconsulta.itemIndex = 1
then rgTipoConciliador.enabled:=true
else
BEgin
  rgTipoConciliador.enabled:=false;
  label1.enabled:=false;
  seRango.Enabled:=false;
  seRango.EditorEnabled:=false;
end;
end;

procedure TWCrPlazoRe.rgTipoConciliadorClick(Sender: TObject);
begin
qryConPlazoREsidual.close;
If rgTipoConciliador.itemindex = 1
then
  Begin
    label1.enabled:=true;
    seRango.Enabled:=true;
    seRango.EditorEnabled:=true;
  End
else
  Begin
    label1.enabled:=false;
    seRango.Enabled:=false;
    seRango.EditorEnabled:=false;
  End;
end;

procedure TWCrPlazoRe.bbcoicnresaldosClick(Sender: TObject);
var sanio, smes : String;
begin
   if Objeto.ValidaAccesoEsp('TCRPLAZORE_MDAT2',True,True) then
   begin
     DateTimeToString(sanio,'yyyy',DameFinMes(DateTimePicker1.DateTime));
     DateTimeToString(smes,'MM',DameFinMes(DateTimePicker1.DateTime));
     MuestraDatosCoincreSdo(sanio,smes,rgCoincreTipoRep.ItemIndex);
   end;
end;

procedure TWCrPlazoRe.bbConsolidadoSecClick(Sender: TObject);
//var sYeMo : String;
begin
   if Objeto.ValidaAccesoEsp('TCRPLAZORE_MDAT3',True,True) then
   begin
    //     DateTimeToString(sYeMo,'dd/mm/yyyy',DameFinMes(DateTimePicker2.DateTime));
         MuestraDatosConsolidadoSec(DameFinMes(DateTimePicker2.DateTime));
   end;
end;

procedure TWCrPlazoRe.Button1Click(Sender: TObject);
begin
  If sdCoincreSdos.Execute Then
    Edit1.Text := sdCoincreSdos.FileName;
end;

procedure TWCrPlazoRe.Button3Click(Sender: TObject);
begin
  If sdCoincreSector.Execute Then
    Edit2.Text := sdCoincreSector.FileName;
end;

procedure TWCrPlazoRe.bbCoincreSdoClick(Sender: TObject);
begin
If Not qryCoincreSdos.Active Then
  Begin
    MessageDlg('No existe información del  '+ FormatDateTime('DD/MM/YYYY',DateTimePicker1.DateTime),
                mtWarning, [mbOk], 0 );
    Exit;
  End
  Else If (Trim(ExtractFileName(Edit1.Text)) = '') Then
  Begin
    MessageDlg('Debe de indicar primero el nombre del archivo en donde desea guardar la información.',
                mtWarning, [mbOk], 0 );
    Exit;
  End
  Else If (LowerCase(Trim(ExtractFileExt(Edit1.Text))) <> '.xls') Then
  Begin
    Edit1.Text := Edit1.Text + '.xls';
  End;

  HabilitaControlesCOINCRE(False);
  try
     GeneraArchivoExcelCOINCRE(Edit1.Text);
  except
       ShowMessage('Proceso concluido');
  end;
  HabilitaControlesCOINCRE(True);
end;

procedure TWCrPlazoRe.bbGenConsSecClick(Sender: TObject);
begin
 If Not qrsCoincreSector.Active Then
  Begin
    MessageDlg('No existe información del  '+ FormatDateTime('DD/MM/YYYY',DateTimePicker2.DateTime),
                mtWarning, [mbOk], 0 );
    Exit;
  End
  Else If (Trim(ExtractFileName(Edit2.Text)) = '') Then
  Begin
    MessageDlg('Debe de indicar primero el nombre del archivo en donde desea guardar la información.',
                mtWarning, [mbOk], 0 );
    Exit;
  End
  Else If (LowerCase(Trim(ExtractFileExt(Edit2.Text))) <> '.xls') Then
  Begin
    Edit2.Text := Edit2.Text + '.xls';
  End;

  HabilitaControlesConsolidado(False);
  try
     GeneraArchivoExcelConsolidado(Edit2.Text);
  except
       ShowMessage('Proceso concluido');
  end;
  HabilitaControlesConsolidado(True);
end;

end.
