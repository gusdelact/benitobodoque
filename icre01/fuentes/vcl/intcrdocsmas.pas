// Sistema         : Clase de crdocsmas
// Fecha de Inicio : 26/09/2011
// Función forma   : Clase de crdocsmas
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Juan Francisco Ortega Flores
// Comentarios     : CARGA MASIVA DE DOCUMENTOS
Unit IntCrdocsmas;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Excel97, OleServer, IntSGCtrl,
//Clases Adicionales
IntParamCre,IntCrActPa, Gauges, Grids, Aligrid,IntGenCre, ImgList,

IntCrCesion,
IntCtoPanel,
IntCrDocto,
//IntCrCredito,
IntLinkit;


Const
   coCRLF      = #13#10;

   CO_COL_CHECK     = 0;
   CO_COL_SITPROCES = CO_COL_CHECK + 1;
   CO_COL_DOCUMENTO = CO_COL_SITPROCES + 1;
   CO_COL_TIPO      = CO_COL_DOCUMENTO + 1;
   CO_COL_FINGR     = CO_COL_TIPO +1;
   CO_COL_FVNTO     = CO_COL_FINGR + 1;                   
   CO_COL_PLAZO     = CO_COL_FVNTO  + 1;                  

   CO_COL_SOBRETSA  = CO_COL_PLAZO + 1;
   CO_COL_TASA      = CO_COL_SOBRETSA + 1;
   CO_COL_ALAMB     = CO_COL_TASA + 1;
   CO_COL_AFORO     = CO_COL_ALAMB + 1;
   CO_COL_IMPNOMIN  = CO_COL_AFORO + 1;

   CO_COL_FVREAL    = CO_COL_IMPNOMIN + 1;
   CO_COL_TBASE     = CO_COL_FVREAL + 1;
   CO_COL_TCOMIS    = CO_COL_TBASE + 1;
   CO_COL_IMP_AFO   = CO_COL_TCOMIS + 1;
   CO_COL_IMP_COMP  = CO_COL_IMP_AFO + 1;
   CO_COL_REMANENT  = CO_COL_IMP_COMP + 1;

   CO_ERROR     = 'ERR';  // Mensaje de Error
   CO_CHECKED   = 'V';
   CO_UNCHECKED = 'F';
   CO_NOTCHECK  = '-';

   CO_FECH_NULL = '30/12/1899';


Type
 TCrdocsmas= class;

  TWCrdocsmas=Class(TForm)
    InterForma1             : TInterForma;
    GBAutorizacion: TGroupBox;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    Shape10: TShape;
    Label14: TLabel;
    Label10: TLabel;
    Label15: TLabel;
    Label12: TLabel;
    Label4: TLabel;
    Shape11: TShape;
    Label9: TLabel;
    strgrdDocs: TStringGrid;
    MemoMessages: TMemo;
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
    btPROC_INFO: TBitBtn;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label2: TLabel;
    GBVenc: TGroupBox;
    lbArchivoEntrada: TLabel;
    sbArchivoEntrada: TSpeedButton;
    edArchivoEntrada: TEdit;
    bbImportar: TBitBtn;
    pAniBar: TPanel;
    ExcelApplicationI: TExcelApplication;
    ExcelWorksheetI: TExcelWorksheet;
    ExcelWorkbookI: TExcelWorkbook;
    odArchivoEntrada: TOpenDialog;
    Shape1: TShape;
    Label6: TLabel;
    Label7: TLabel;
    Shape2: TShape;
    Label8: TLabel;
    Shape3: TShape;
    Label11: TLabel;
    Shape4: TShape;
    Shape5: TShape;
    Label13: TLabel;
    ImageList: TImageList;
    edCVE_PROV: TEdit;
    edID_NAFINSA: TEdit;
    edNOMBRE_PROV: TEdit;
    edID_CESION: TEdit;
    ilCESION: TInterLinkit;
    edTITULAR: TEdit;
    btCESION: TBitBtn;
    Label18: TLabel;
    Label19: TLabel;
    Shape12: TShape;
    Shape13: TShape;
    Shape14: TShape;
    Shape15: TShape;
    Shape16: TShape;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    rgCVE_TIPO_INTERES: TRadioGroup;
    Sgridtemp: TStringGrid;
    GBLectura: TGroupBox;
    Label16: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    GroupBox2: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Tregleidos_tot: TEdit;
    Tregleidos_ok: TEdit;
    Tregleidos_error: TEdit;
    Tregproc_tot: TEdit;
    Tregproc_ok: TEdit;
    Tregproc_error: TEdit;
    btCANCELA_BLOQUE: TBitBtn;
    icpCONTRATO: TInterCtoPanel;
    GroupBox3: TGroupBox;
    ImpNomin: TEdit;
    ImpAforad: TEdit;
    ImpCompra: TEdit;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Shape17: TShape;
    Label31: TLabel;
    Shape18: TShape;
    Label32: TLabel;
    GroupBox4: TGroupBox;
    Label5: TLabel;
    Label17: TLabel;
    edFemisio: TEdit;
    edFcomp: TEdit;
    dtpF_COMPRA: TInterDateTimePicker;
    dtpF_EMISION: TInterDateTimePicker;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure sbArchivoEntradaClick(Sender: TObject);
    procedure bbImportarClick(Sender: TObject);
    procedure strgrdDocsDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure ConfGrid( SGrid : TStringGrid );
    procedure strgrdDocsMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure InvertCheck(StrinGrid : TStringGrid; nCol, nRow : Integer);
    procedure btPROC_INFOClick(Sender: TObject);
    procedure btCANCELA_BLOQUEClick(Sender: TObject);
    Function  ValFechaHabil(pFecha: TDate) : TDate;
    private
    { Private declarations }
    function ValidaDocs(
               vlFILA,
               vlDOCUMENTO,
               vlTIPO,
               vlFINGR,
               vlFVNTO,
               vlPLAZO,
               vlSOBRETSA,
               vlTASA,
               vlALAMB,
               vlAFORO,
               vlIMPNOMIN,
               vlSITPROCES : string
              ) : Boolean;

      Function InsertaDocto(StrinGrid : TStringGrid; nRow : Integer) : Boolean;
      Function ValidaCveDocto(PECLAVE:String): Boolean;
      Function QuitaComas(PPCadena : String):String;

    public
    { Public declarations }
    Objeto     : TCrdocsmas;
end;


 TCrdocsmas= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        vgCesion                 : String;
        ParamCre                 : TParamCre;

    //CLASES ADICIONALES

        Cesion     : TCrCesion;
        Documento  : TCrDocto;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
        Procedure   ObtTasaFondeo(pecesion, peplazo:integer; balambrada:string);
        Procedure   ObtSobreTasa(pecesion : integer);
        Procedure   ObtTasaDescuento(pesobretasa: Double);
        Procedure   ObtImpAforo(PEIMPNOMINAL, PETASAAFORO: currency);
        Procedure   ObtImpCompra(PEPLAZO:INTEGER; PETASADESC: currency);
        procedure   StpObtRemanente(pImpDepositado, pFactorMoras, pImpNominal, pAforo: Double; pIdDocumento : string);

      published
      end;

var

    vlID_CREDITO    : String;
    nRow            : word;
    vlCVE_TIPO_INT  : String[2];
    vlTASA_COMISION : Currency;
    VLSITDOCTO      : String;

    vltasatemp      : CURRENCY;
    vltasatmps      : CURRENCY;

    VLTASADESCTO    : CURRENCY;
    VLTASASOBRE     : CURRENCY;
    VLTASAFONDEO    : CURRENCY;
    VLIMPAFORADO    : CURRENCY;
    VLIMPCOMPRA     : CURRENCY;
    VLIMPREMANEN    : CURRENCY;

    VLERRORSTP      : String;
    vldocvalida     : String;
    VLIMPNOMINAT    : CURRENCY;
    VLIMPAFORADT    : CURRENCY;
    VLIMPCOMPRAT    : CURRENCY;

    vlgbaplica : String;

    cregtot, cregok, cregerror: integer;

    Query1, Query2, Query3 : TQuery; //jfof ene-2013
    vldiaspago  : String;
    vlfvencimr : TDateTime;

implementation
Uses //RepMon;
  IntCrCanDoc;

{$R *.DFM}


constructor TCrdocsmas.Create( AOwner : TComponent );
begin Inherited;

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrdocsmas.Hlp';
      ShowMenuReporte := True;


end;

Destructor TCrdocsmas.Destroy;
begin
     if vgCesion = '' then
       if Cesion <> nil then
          Cesion.Free;

inherited;
end;


function TCrdocsmas.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrdocsmas;
begin
   W := TWCrdocsmas.Create(Self);
   try
      W.Objeto := Self;
      W.InterForma1.InterFrame := Self;
      W.InterForma1.FormaTipo  := ftConsulta; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid   := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion  := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrdocsmas.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrdocsm.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;


procedure TCrdocsmas.ObtTasaDescuento(pesobretasa:double);
var   spObtTasaDesc : TStoredProc;
Begin
   begin
        //B_ALAMBRADA.GetFromControl;
        try
          spObtTasaDesc := TStoredProc.Create(Self);
          with spObtTasaDesc do
          begin
             //Inicia el SPT
             spObtTasaDesc.DatabaseName   := Apli.DatabaseName;
             spObtTasaDesc.SessionName    := Apli.SessionName;
             spObtTasaDesc.StoredProcName := 'PKGCRPERIODO.STPOBTTASADESCTO';

             // Se crean los parametros del StoreProcedure
             Params.Clear;
             Params.CreateParam(ftFloat,'PETASAFONDEO',ptInput);
             Params.CreateParam(ftFloat,'PETASACOMISION',ptInput);
             Params.CreateParam(ftFloat,'PESOBRETASA',ptInput);
             Params.CreateParam(ftFloat,'PSTASADESCTO',ptOutput);
             Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
             Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
             //
             ParamByName('peTasaFondeo').AsFloat := VLTASAFONDEO;
             ParamByName('peTasaComision').AsFloat := Cesion.Emisor.TASA_COMISION.AsFloat;
             ParamByName('peSobreTasa').AsFloat := pesobretasa;
             ExecProc;

             if (ParamByName('PSResultado').AsInteger = 0) then
             begin
                //TASA_DESCUENTO.AsFloat := ParamByName('psTasaDescto').AsFloat;
                VLTASADESCTO:= ParamByName('psTasaDescto').AsFloat;
             end
             else
             Begin
                VLTASADESCTO:=0;
                ShowMessage('PROBLEMAS AL OBTENER LA TASA DE DESCUENTO: ' +
                           IntToStr(ParamByName('psRESULTADO').AsInteger));
                ShowMessage(ParamByName('psTxResultado').AsString);
             end;
             //end if;
          end;
        finally
           spObtTasaDesc.Free;
        end;
   end;
end;

procedure TCrdocsmas.ObtTasaFondeo(pecesion, peplazo:integer; balambrada:string);
var   spObtTasaFondeo : TStoredProc;
      VLBandera       : String;
Begin
       //B_ALAMBRADA.GetFromControl;
       VLBandera := balambrada;
       try
         spObtTasaFondeo := TStoredProc.Create(Self);
         with spObtTasaFondeo do
         begin
            //Inicia el SPT
            spObtTasaFondeo.DatabaseName:= Apli.DatabaseName;
            spObtTasaFondeo.SessionName:= Apli.SessionName;
            spObtTasaFondeo.StoredProcName:= 'PKGCRPERIODO.STPOBTTASAFONDEO';

            // Se crean los parametros del StoreProcedure
            Params.Clear;
            Params.CreateParam(ftFloat,'PEIDCESION',ptInput);
            Params.CreateParam(ftFloat,'PEPLAZO',ptInput);
            Params.CreateParam(ftString,'PEBALAMBRA',ptInput);
            Params.CreateParam(ftFloat,'PSTASAFONDEO',ptOutput);
            Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
            Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);

            ParamByName('peIdCesion').AsInteger := pecesion;
            ParamByName('pePlazo').AsInteger := peplazo;
            ParamByName('PEbalambra').AsString := balambrada;
            ExecProc;

            if (ParamByName('PSResultado').AsInteger = 0) then
            begin
               //TASA_FONDEO.AsFloat := ParamByName('psTasaFondeo').AsFloat;
               VLTASAFONDEO := ParamByName('psTasaFondeo').AsFloat;
            end
            else
            Begin
               VLTASAFONDEO :=0;
               ShowMessage('PROBLEMAS AL OBTENER LA TASA FONDEO: ' +
                          IntToStr(ParamByName('psRESULTADO').AsInteger));
               ShowMessage(ParamByName('psTxResultado').AsString);
            end;
            //end if;
         end;
       finally
          spObtTasaFondeo.Free;
       end;
end;

procedure TCrdocsmas.ObtImpAforo(PEIMPNOMINAL, PETASAAFORO: currency);
var  vlsql        : String;
     vlsqlPeriodo : String;   //---DEINTEC.DF 02.MAYO.2008    DESCUENTO MERCANTIL
     vlPeriodo    : String;   //---DEINTEC.DF 02.MAYO.2008    DESCUENTO MERCANTIL
     vlImpAforado2 : String;
Begin
   vlsqlPeriodo:= 'SELECT COUNT(*) + 1 AS PERIODO FROM CR_DOCUMENTO ' +    //---DEINTEC.DF 02.MAYO.2008    DESCUENTO MERCANTIL
                  'WHERE ID_CESION = ' + Cesion.ID_CESION.AsString;        //---DEINTEC.DF 02.MAYO.2008    DESCUENTO MERCANTIL
   GetSQLStr(vlsqlPeriodo, Apli.DataBaseName, Apli.SessionName, 'PERIODO', vlPeriodo, false);   //---DEINTEC.DF 02.MAYO.2008    DESCUENTO MERCANTIL

   vlsql := ' SELECT PKGCRPERIODO.ObtenImpAforoMer( ' + FloatToStr(PEIMPNOMINAL) +   //---DEINTEC.DF 02.MAYO.2008    DESCUENTO MERCANTIL
            ',' + FloatToStr(PETASAAFORO) + ', '''+ 'TRA' + ''', ' + vlPeriodo + ' ) AS IMP_AFORADO ' + ' FROM DUAL';    //DEINTEC.DF PRUEBAS
   GetSQLStr(vlsql,Apli.DataBaseName,Apli.SessionName,'IMP_AFORADO',vlImpAforado2,False);
   VLIMPAFORADO := StrToFloat(vlImpAforado2);
end;


procedure TCrdocsmas.ObtImpCompra(PEPLAZO:INTEGER; PETASADESC: currency);
var   spObtImpCompra : TStoredProc;
Begin
   //CVE_TIPO_INTERES.GetFromControl;
   try
     spObtImpCompra := TStoredProc.Create(Self);
     with spObtImpCompra do
     begin
        //Inicia el SPT
        spObtImpCompra.DatabaseName := Apli.DatabaseName;
        spObtImpCompra.SessionName := Apli.SessionName;
        spObtImpCompra.StoredProcName := 'PKGCRPERIODO.STPDESGLOZAAFORO';

        // Se crean los parametros del StoreProcedure
        Params.Clear;
        Params.CreateParam(ftString,'PECVETPOINT',ptInput);
        Params.CreateParam(ftFloat,'PEIMPAFORO',ptInput);
        Params.CreateParam(ftFloat,'PETASADESCTO',ptInput);
        Params.CreateParam(ftInteger,'PEPLAZO',ptInput);
        Params.CreateParam(ftFloat,'PSIMPCOMPRA',ptOutput);
        Params.CreateParam(ftFloat,'psImpInteres',ptOutput);
        Params.CreateParam(ftInteger,'PSRESULTADO',ptOutput);
        Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
        //
       // prepare;
        ParamByName('peCveTpoInt').AsString := Cesion.CVE_TIPO_INTERES.AsString;
        ParamByName('peImpAforo').AsFloat := VLIMPAFORADO;
        ParamByName('peTasaDescto').AsFloat := PETASADESC;
        ParamByName('pePlazo').AsInteger := PEPLAZO;
        ExecProc;

        if (ParamByName('PSResultado').AsInteger = 0) then
        begin
           VLIMPCOMPRA := ParamByName('psImpCompra').AsFloat;
        end
        else
        Begin
           VLIMPCOMPRA:=0;
           ShowMessage('PROBLEMAS AL OBTENER EL IMPORTE DE COMPRA: ' +
                      IntToStr(ParamByName('psRESULTADO').AsInteger));
           ShowMessage(ParamByName('psTxResultado').AsString);
        end;
        //end if;
     end;
   finally
      spObtImpCompra.Free;
   end;
end;


procedure TCrdocsmas.ObtSobreTasa(pecesion : integer);
var   spObtSobreTasa : TStoredProc;
Begin
   try
     spObtSobreTasa := TStoredProc.Create(Self);
     with spObtSobreTasa do
     begin
        //Inicia el SPT
        spObtSobreTasa.DatabaseName := Apli.DatabaseName;
        spObtSobreTasa.SessionName := Apli.SessionName;
        spObtSobreTasa.StoredProcName := 'PKGCRPERIODO.STPOBTSOBRETASA';

        // Se crean los parametros del StoreProcedure
        Params.Clear;
        Params.CreateParam(ftFloat,'PEIDCESION',ptInput);
        Params.CreateParam(ftFloat,'PSSOBRETASA',ptOutput);
        Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
        Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);

        ParamByName('peIdCesion').AsInteger := pecesion;
        ExecProc;

        if (ParamByName('PSResultado').AsInteger = 0) then
        begin
           //SOBRETASA.AsFloat := ParamByName('psSobreTasa').AsFloat;
           VLTASASOBRE := ParamByName('psSobreTasa').AsFloat;
        end
        else
        Begin
           VLTASASOBRE := 0;
           ShowMessage('PROBLEMAS AL OBTENER LA SOBRETASA: ' +
                      IntToStr(ParamByName('psRESULTADO').AsInteger));
           ShowMessage(ParamByName('psTxResultado').AsString);
        end;
        //end if;
     end;
   finally
      spObtSobreTasa.Free;
   end;
end;



procedure TCrdocsmas.StpObtRemanente(pImpDepositado, pFactorMoras, pImpNominal, pAforo: Double; pIdDocumento : string);
var  STPObtRem : TStoredProc;
Begin
     STPObtRem := TStoredProc.Create(Nil);
     try
        with STPObtRem do
        begin
          DatabaseName := Apli.DatabaseName;
          SessionName := Apli.SessionName;
          StoredProcName :='PKGCRPERIODO.STPOBTENREMANENTE';
          // Se crean los parametros del StoreProcedure
          Params.Clear;
          Params.CreateParam(ftInteger,'PEMETODO',ptInput);
          Params.CreateParam(ftFloat,'PEIMP_NOMINAL',ptInput);
          Params.CreateParam(ftFloat,'PETASA_AFORO',ptInput);
          Params.CreateParam(ftInteger,'PEIDCESION',ptInput);
          Params.CreateParam(ftString,'PEIDDOCUMENTO',ptInput);
          Params.CreateParam(ftDate,'PEFPAGO',ptInput);
          Params.CreateParam(ftFloat,'PEIMPDEPOSITADO',ptInput);
          Params.CreateParam(ftFloat,'PEFACTORMORAS',ptInput);
          Params.CreateParam(ftFloat,'PSIMPREMANENTE',ptOutput);
          Params.CreateParam(ftFloat,'PSIMPREMINTERES',ptOutput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
          //
          ParamByName('PEMETODO').AsString := CMETODO1;
          ParamByName('PEIMP_NOMINAL').AsFloat := pImpNominal;
          ParamByName('PETASA_AFORO').AsFloat := pAforo;
          ParamByName('PEIDCESION').AsInteger := Cesion.ID_CESION.AsInteger;
          ParamByName('PEIDDOCUMENTO').AsString := pIdDocumento;
          //ParamByName('PEFPAGO').AsDate := F_PROGRAMADA.AsDateTime;

          ParamByName('PEIMPDEPOSITADO').AsFloat := pImpDepositado;
          ParamByName('PEFACTORMORAS').AsFloat := pFactorMoras;
          ExecProc;

          if (ParamByName('PSRESULTADO').AsInteger = 0) then
          Begin
             VLIMPREMANEN  := ParamByName('PSIMPREMANENTE').AsFloat;
          end
          else
          Begin
             VLIMPREMANEN := 0;
             ShowMessage('PROBLEMAS AL OBTENER EL REMANENTE: ' +
             IntToStr(ParamByName('PSRESULTADO').AsInteger));

             ShowMessage(ParamByName('PSTXRESULTADO').AsString);
          end;
        end;
     finally
          STPObtRem.Free;
     end;
end;  


function TWCrdocsmas.InsertaDocto(StrinGrid : TStringGrid; nRow : Integer): Boolean;
var      VLSalida    : Boolean;
         STPObtDocto : TStoredProc;
         tinteres    : string;
         vlfechingre : String;
         vlfechvreal : String;
Begin
   VLSalida := False;
   try
      //Inicia el SPT
      VLERRORSTP:='';

    { if (StrinGrid.Cells[CO_COL_FINGR, nRow] = '') or (StrinGrid.Cells[CO_COL_FINGR, nRow] = CO_FECH_NULL) then
         vlfechingre := CO_FECH_NULL
         else
         vlfechingre := StrinGrid.Cells[CO_COL_FINGR, nRow];
     if (StrinGrid.Cells[CO_COL_FVREAL, nRow] = '') or (StrinGrid.Cells[CO_COL_FVREAL, nRow] = CO_FECH_NULL) then
         vlfechvreal := CO_FECH_NULL
         else
         vlfechvreal := StrinGrid.Cells[CO_COL_FVREAL, nRow]; }

     if rgCVE_TIPO_INTERES.itemindex=0 then tinteres:='IN'
     else  tinteres:='VE';


     STPObtDocto := TStoredProc.Create(Nil);
     with STPObtDocto do
     begin
        STPObtDocto.DatabaseName   := Objeto.Apli.DatabaseName;
        STPObtDocto.SessionName    := Objeto.Apli.SessionName;
        STPObtDocto.StoredProcName := 'PKGCRCREDITO.STPALTADOCTO';

        // Se crean los parametros del StoreProcedure
        Params.Clear;
        Params.CreateParam(ftString,'peIdDocto',ptInput);
        Params.CreateParam(ftFloat,'peIdCesion',ptInput);
        Params.CreateParam(ftString,'peCveDocto',ptInput);
        Params.CreateParam(ftString,'peTipoInteres',ptInput);
        Params.CreateParam(ftDate,'peFEmision',ptInput);
        Params.CreateParam(ftDate,'peFCompra',ptInput);
        Params.CreateParam(ftFloat,'pePlazoCapital',ptInput);
        Params.CreateParam(ftFloat,'peImpNominal',ptInput);
        Params.CreateParam(ftFloat,'peTasaComision',ptInput);
        Params.CreateParam(ftFloat,'peImpCompra',ptInput);
        Params.CreateParam(ftFloat,'peTasaFondeo',ptInput);
        Params.CreateParam(ftFloat,'peSobretasa',ptInput);
        Params.CreateParam(ftFloat,'peTasaDescuento',ptInput);
        Params.CreateParam(ftFloat,'peTasaAforo',ptInput);
        Params.CreateParam(ftFloat,'peImpCapital',ptInput);
        Params.CreateParam(ftFloat,'peImpRemanente',ptInput);
        Params.CreateParam(ftDate,'peFAlta',ptInput);
        Params.CreateParam(ftString,'peCveUsuAlta',ptInput);
        Params.CreateParam(ftString,'peBAlambrada',ptInput);
        Params.CreateParam(ftDate,'peFIngresoDoc',ptInput);
        Params.CreateParam(ftDate,'peFVencReal',ptInput);
        Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
        Params.CreateParam(ftFloat,'psNumPeriodoDoc',ptOutput);
        Params.CreateParam(ftString,'psSitDocto',ptOutput);
        Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
        Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
        //
        ParamByName('peIdDocto').AsString       := StrinGrid.Cells[CO_COL_DOCUMENTO, nRow];
        ParamByName('peIdCesion').AsInteger     := StrToInt(edID_CESION.Text);
        ParamByName('peCveDocto').AsString      := StrinGrid.Cells[CO_COL_TIPO, nRow];
        ParamByName('peTipoInteres').AsString   := tinteres;
        ParamByName('peFEmision').AsDateTime    := StrToDate(edFemisio.Text);
        ParamByName('peFCompra').AsDateTime     := StrToDate(edFcomp.Text);
        ParamByName('pePlazoCapital').AsInteger := StrToInt(StrinGrid.Cells[CO_COL_PLAZO, nrow]);
        ParamByName('peImpNominal').AsFloat     := StrToFloat(QuitaComas(StrinGrid.Cells[CO_COL_IMPNOMIN, nRow]));
        ParamByName('peTasaComision').AsFloat   := vlTASA_COMISION;

        ParamByName('peImpCompra').AsFloat      := StrToFloat(QuitaComas(StrinGrid.Cells[CO_COL_IMP_COMP, nRow]));

        ParamByName('peTasaFondeo').AsFloat     := VLTASAFONDEO;

        //ParamByName('peSobretasa').AsFloat      := StrToFloat(StrinGrid.Cells[CO_COL_SOBRETSA, nRow]);
        ParamByName('peSobretasa').AsFloat      := StrToFloat(StrinGrid.Cells[CO_COL_TCOMIS, nRow]);

        ParamByName('peTasaDescuento').AsFloat  := StrToFloat(StrinGrid.Cells[CO_COL_TASA, nRow]);
        ParamByName('peTasaAforo').AsFloat      := StrToFloat(StrinGrid.Cells[CO_COL_AFORO, nRow]);

        ParamByName('peImpCapital').AsFloat     := StrToFloat(QuitaComas(StrinGrid.Cells[CO_COL_IMP_AFO, nRow]));

        ParamByName('peImpRemanente').AsFloat   := StrToFloat(QuitaComas(StrinGrid.Cells[CO_COL_REMANENT, nRow]));

        ParamByName('peFAlta').AsDateTime       := Objeto.Apli.DameFechaEmpresa;
        ParamByName('peCveUsuAlta').AsString    := Objeto.Apli.Usuario;
        ParamByName('peBAlambrada').AsString    := StrinGrid.Cells[CO_COL_ALAMB, nRow];
        if StrinGrid.Cells[CO_COL_FINGR, nRow] = '' then
        begin
          ParamByName('peFIngresoDoc').Clear;
          ParamByName('peFVencReal').Clear;
        end
        else
        begin
          ParamByName('peFIngresoDoc').AsDateTime := StrToDate(StrinGrid.Cells[CO_COL_FINGR, nRow]);  //StrToDate(vlfechingre);
          ParamByName('peFVencReal').AsDateTime   := StrToDate(StrinGrid.Cells[CO_COL_FVREAL, nRow]); //StrToDate(vlfechvreal);
        end;
        ParamByName('peBCommit').AsString       := 'V';
        ExecProc;
        if (ParamByName('PSResultado').AsInteger = 0) then
        begin
           VLSalida := True;
           //NUM_PERIODO_DOC.AsInteger := ParamByName('psNumPeriodoDoc').AsInteger;
           //SIT_DOCUMENTO.AsString:= ParambyName('psSitDocto').AsString;
        end
        else // SI NO REALIZA LA CARGA MANDA ERRORES
        Begin
           //ShowMessage('PROBLEMAS AL GUARDAR EL DOCUMENTO: ' +
           //IntToStr(ParamByName('psRESULTADO').AsInteger));
           //ShowMessage(ParamByName('psTxResultado').AsString);
           //GenMsg('Credito' + edID_CESION.Text + ' Doc' + strgrdDocs.Cells[CO_COL_DOCUMENTO, nRow] + 'Desc: ' +ParamByName('psTxResultado').AsString,Apli);
           VLERRORSTP:= IntToStr(ParamByName('psRESULTADO').AsInteger) + ' ' + ParamByName('psTxResultado').AsString;
        end;
      end;
   finally
      STPObtDocto.Free;
   end;
   InsertaDocto := VLSalida;
end;

function TWCrdocsmas.ValidaCveDocto(PECLAVE: String): Boolean;
begin
      if GetSql('SELECT CVE_DOCUMENTO FROM CR_TIPO_DOCTO WHERE CVE_DOCUMENTO = '''+PECLAVE+'''',
                Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True)
      then ValidaCveDocto := True
      else ValidaCveDocto := False;
end;



function TCrdocsmas.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA crdocsmas********************)
(*                                                                                *)
(*  FORMA DE crdocsmas                                                            *)
(*                                                                                *)
(***********************************************FORMA crdocsmas********************)

//QUITA COMAS DE LAS CANTIDADES
Function TWCrdocsmas.QuitaComas(PPCadena : String):String;
var
   vlIndex, vlTotal : Integer;
   vlCar,vlRenglon: String;
begin
   vlTotal:= Length (Trim(PPCadena));
   vlRenglon:='';

   for vlIndex := 1 to vlTotal do
   begin
      vlCar:= Copy(PPCadena, vlIndex, 1);
      if  vlCar <> ',' then vlRenglon:=vlRenglon+vlCar;
   end;
   QuitaComas:=vlRenglon;
end;

procedure TWCrdocsmas.FormShow(Sender: TObject);
begin
With Objeto Do
   Begin
      icpCONTRATO.Frame := Objeto.Cesion.CreCto.Contrato;
      icpCONTRATO.RefrescaInfo; //Refresca la información del Contrato

      Objeto.Cesion.EmiProv.ID_PROVEEDOR.Control := edCVE_PROV;
      Objeto.Cesion.EmiProv.Proveedor.ID_PROV_EXTERNO.Control := edID_NAFINSA;
      Objeto.Cesion.EmiProv.Proveedor.Persona.Nombre.Control := edNOMBRE_PROV;
      Objeto.Cesion.ID_CESION.Control := edID_CESION;
      Objeto.Cesion.CreCto.Contrato.TITNombre.Control := edTITULAR;
      edFemisio.Text := DatetoStr(Objeto.Apli.DameFechaEmpresa);
      edFcomp.Text := DatetoStr(Objeto.Apli.DameFechaEmpresa);
      vlCVE_TIPO_INT  := Objeto.Cesion.CVE_TIPO_INTERES.AsString;
      vlTASA_COMISION := Objeto.Cesion.Emisor.TASA_COMISION.AsFloat;
      Objeto.Cesion.CVE_TIPO_INTERES.Control := rgCVE_TIPO_INTERES;

      edID_CESION.Enabled := False;

   end;
end;

procedure TWCrdocsmas.FormDestroy(Sender: TObject);
begin

      Objeto.Cesion.EmiProv.ID_PROVEEDOR.Control := nil;
      Objeto.Cesion.EmiProv.Proveedor.ID_PROV_EXTERNO.Control := nil;
      Objeto.Cesion.EmiProv.Proveedor.Persona.Nombre.Control := nil;
      Objeto.Cesion.ID_CESION.Control := nil;
      Objeto.Cesion.CreCto.Contrato.TITNombre.Control := nil;
      Objeto.Cesion.CVE_TIPO_INTERES.Control := nil;

   //Objeto
end;

procedure TWCrdocsmas.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrdocsmas.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrdocsmas.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrdocsmas.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte;
//end;


procedure TWCrdocsmas.sbArchivoEntradaClick(Sender: TObject);
var
  correcto: boolean;
begin

    Tregleidos_tot.Text:='0';
    Tregleidos_ok.Text:='0';
    Tregleidos_error.Text:='0';
    Tregproc_tot.Text:='0';
    Tregproc_ok.Text:='0';
    Tregproc_error.Text:='0';

    ImpNomin.Text  := '0';
    ImpAforad.Text := '0';
    ImpCompra.Text := '0';

    VLIMPNOMINAT :=0;
    VLIMPAFORADT :=0;
    VLIMPCOMPRAT :=0;

    MemoMessages.Clear;
    ClearGrid(strgrdDocs,0);
    ConfGrid(strgrdDocs);
    correcto := False;
    
  while not correcto and odArchivoEntrada.Execute do
  begin
    edArchivoEntrada.Text := odArchivoEntrada.FileName;
    if FileExists(odArchivoEntrada.FileName) then
      correcto := True
    else
    begin
      edArchivoEntrada.Text := '';
      ShowMessage('Archivo inexistente. Por favor seleccione un archivo');
    end;
  end;
end;

procedure TWCrdocsmas.bbImportarClick(Sender: TObject);
var
  LCID: integer;
  fila: integer;
  valida: String;

  //Para la barra de progreso
  ani: TAniBarThread;
    r: TRect;
  vlsobretasa, vltasadescu  : currency;
  vlMesg:string;
  vltemporal : STring;
  
begin
   if Objeto.ValidaAccesoEsp('TCRDOCSMAS_IMPOR',True,True) then
   begin
       MemoMessages.Clear;
       ClearGrid(strgrdDocs,0);
       ConfGrid(strgrdDocs);
       nRow := 0;
       cregtot :=0;
       cregok :=0;
       cregerror   :=0;

       if Trim(edArchivoEntrada.Text) = '' then
       begin
          ShowMessage('Seleccione un archivo');
          Exit;
       end;

       vlMesg := '¿ Está seguro de cargar el archivo seleccionado ?';
       if MessageDlg(vlMesg, mtConfirmation,[mbYes, mbNo], 0) = mrYes then
       Begin

      {* Inicia las variables para actualizar el medidor *}
      r := pAniBar.ClientRect;
      InflateRect(r, -pAniBar.BevelWidth, -pAniBar.BevelWidth);
      ani := TAniBarThread.Create(pAniBar, r, pAniBar.color, clLime, 100);
      bbImportar.Enabled := False;
      Application.ProcessMessages;

      LCID := GetUserDefaultLCID;
      //Si el campo con el nombre del reporte está vacio lee la información de
      //de la base de datos y utiliza el reporte
      if edArchivoEntrada.Text <> '' then
      begin
        {* Instrucciones para el archivo excel de entrada
         *}
        ExcelApplicationI.Connect;
        // Hace a Excel invisible
        ExcelApplicationI.Visible[LCID] := False;
        ExcelApplicationI.DisplayAlerts[LCID] := False;

        // Abre el archivo
        ExcelApplicationI.Workbooks.Open(edArchivoEntrada.Text,
          EmptyParam, //UpdateLinks: OleVariant
          EmptyParam, //ReadOnly: OleVariant
          EmptyParam, //Format: OleVariant
          EmptyParam, //Password: OleVariant
          EmptyParam, //WriteResPassword: OleVariant
          EmptyParam, //IgnoreReadOnlyRecommended: OleVariant
          EmptyParam, //Orign: OleVariant
          EmptyParam, //Delimiter: OleVariant
          EmptyParam, //Editable: OleVariant
          EmptyParam, //Notify: OleVariant
          EmptyParam, //Converter: OleVariant
          EmptyParam, //AddToMru: OleVariant
          LCID
          );
        ExcelWorkbookI.ConnectTo(ExcelApplicationI.ActiveWorkbook);
        ExcelWorksheetI.ConnectTo(ExcelApplicationI.ActiveSheet as _Worksheet);
      end;

      {* Extrae la información del archivo Excel *}
      fila := 2;
      try
        try
          //Para cada renglón con información
          valida  := trim(ExcelWorksheetI.Cells.Item[fila, 'A']); //PERIODO
          while (valida <> '@@@')  do
          begin
            // Extrae la información
            with strgrdDocs do
            begin
               Cells[CO_COL_DOCUMENTO, nRow] := trim(ExcelWorksheetI.Cells.Item[fila, 'A']);
               Cells[CO_COL_TIPO, nRow] := trim(ExcelWorksheetI.Cells.Item[fila, 'B']);
               Cells[CO_COL_FINGR, nRow]:= trim(ExcelWorksheetI.Cells.Item[fila, 'C']);//JFOF ENE-2013
               Cells[CO_COL_FVNTO, nRow]:= trim(ExcelWorksheetI.Cells.Item[fila, 'D']);
               Cells[CO_COL_PLAZO, nRow]:= FloatToStr(StrToDate(Cells[CO_COL_FVNTO, nRow] )  -  StrToDate(edFcomp.Text) );

              if trim(ExcelWorksheetI.Cells.Item[fila, 'E']) = '' then vlsobretasa := 0
               else
              if StrToFloat(ExcelWorksheetI.Cells.Item[fila, 'E']) < 0 then vlsobretasa := 0
               else
                  vlsobretasa := StrToFloat(ExcelWorksheetI.Cells.Item[fila, 'E']);

               Cells[CO_COL_SOBRETSA, nRow] := FormatFloat('#####0.0000', vlsobretasa );
               Cells[CO_COL_TASA, nRow] := FormatFloat('#####0.0000', StrToFloat(ExcelWorksheetI.Cells.Item[fila, 'F']));
               Cells[CO_COL_ALAMB, nRow] := trim(ExcelWorksheetI.Cells.Item[fila, 'G']);
               Cells[CO_COL_AFORO, nRow] := FormatFloat('##0.00', StrToFloat(ExcelWorksheetI.Cells.Item[fila, 'H']));
               Cells[CO_COL_IMPNOMIN, nRow] := FormatFloat('###,###,##0.00', StrToFloat(ExcelWorksheetI.Cells.Item[fila, 'I']));

               //Realiza Validaciones
               if  validaDocs(
                       IntToStr(nRow),
                       Cells[CO_COL_DOCUMENTO, nRow],
                       Cells[CO_COL_TIPO, nRow],
                       Cells[CO_COL_FINGR, nRow],
                       Cells[CO_COL_FVNTO, nRow],
                       Cells[CO_COL_PLAZO, nRow],
                       Cells[CO_COL_SOBRETSA, nRow],
                       Cells[CO_COL_TASA, nRow],
                       Cells[CO_COL_ALAMB, nRow],
                       Cells[CO_COL_AFORO, nRow],
                       QuitaComas(Cells[CO_COL_IMPNOMIN, nRow]),
                       Cells[CO_COL_SITPROCES, nRow]) then
                begin
                   Cells[CO_COL_SITPROCES, nRow] := 'OK';
                   Cells[CO_COL_CHECK, nRow]     := CO_CHECKED;
                   cregok :=cregok+1;
                end
                else
                begin
                   Cells[CO_COL_SITPROCES, nRow] := 'ERR';
                   Cells[CO_COL_CHECK, nRow]     := CO_UNCHECKED;
                   cregerror :=cregerror+1;
                end;

                if StrToFloat(Cells[CO_COL_TASA, nRow]) <= 0  then
                   Cells[CO_COL_TASA, nRow]:= FormatFloat('##0.0000',vltasatemp); // SOBRE ESCRIBE TASA DESCUENTO EN CASO DE SER CERO

                if StrToFloat(Cells[CO_COL_SOBRETSA, nRow]) > 0  then
                   vltasatmps:= StrToFloat(Cells[CO_COL_SOBRETSA, nRow]);  //EN CASO DE QUE EN EL EXCEL LA SOBRETASA SEA MAYOR CERO ENTONCES SE USA ESE DATO

    //               Cells[CO_COL_SOBRETSA, nRow]:= FormatFloat('##0.00',vltasatmps); // SOBRE ESCRIBE SOBRETASA EN CASO DE SER CERO
    //               Cells[CO_COL_TBASE, nRow]:= FormatFloat('##0.00',VLTASAFONDEO);


                if Cells[CO_COL_FINGR, nRow] <> '' then
                begin
                  if (vldiaspago <> '') or (strtoint(vldiaspago) = 0) then
                  begin
                   vlfvencimr := ValFechaHabil(strtodate(Cells[CO_COL_FINGR, nRow]) + strtoint(vldiaspago))
                  end
                   else
                   vlfvencimr := ValFechaHabil(StrToDate(Cells[CO_COL_FINGR, nRow]));
                end
                else
                   vlfvencimr := 0;

                   if vlfvencimr = 0 then
                   Cells[CO_COL_FVREAL, nRow]:= ''
                   else
                   Cells[CO_COL_FVREAL, nRow]:= DateToStr(vlfvencimr);
                   
                   Cells[CO_COL_TBASE, nRow]:= FormatFloat('##0.0000',VLTASAFONDEO);
    //               Cells[CO_COL_TCOMIS, nRow]:= FormatFloat('##0.00',vlTASA_COMISION);
                   Cells[CO_COL_TCOMIS, nRow]:= FormatFloat('#####0.0000',vltasatmps);
                   Cells[CO_COL_IMP_AFO, nRow]:= FormatFloat('###,###,##0.00',VLIMPAFORADO);
                   Cells[CO_COL_IMP_COMP, nRow]:= FormatFloat('###,###,##0.00',VLIMPCOMPRA);
                   Cells[CO_COL_REMANENT, nRow]:= FormatFloat('###,###,##0.00',VLIMPREMANEN);
            end;
            nRow:=nRow+1;
            cregtot := cregtot+1;

            inc(fila);
            valida  := Trim(ExcelWorksheetI.Cells.Item[fila, 'A']);
          end;

        finally
          //detiene la barra de progreso
          bbImportar.Enabled := True;
          ani.Terminate;

          ExcelApplicationI.Visible[LCID] := True;
          ExcelWorksheetI.Disconnect;
          ExcelWorkbookI.Disconnect;
          ExcelApplicationI.Disconnect;
        end;

        //Si no existe error notifica al usuario que se generó el reporte
        //ShowMessage('Informacion leida con Exito');
        edArchivoEntrada.Text := '';
        strgrdDocs.RowCount   := fila-2;


        Tregleidos_tot.Text   := IntToStr(cregtot);
        Tregleidos_ok.Text    := IntToStr(cregok);
        Tregleidos_error.Text := IntToStr(cregerror);

        ImpNomin.Text  := FormatFloat('###,###,##0.00',VLIMPNOMINAT);
        ImpAforad.Text := FormatFloat('###,###,##0.00',VLIMPAFORADT);
        ImpCompra.Text := FormatFloat('###,###,##0.00',VLIMPCOMPRAT);

      except
        on e: Exception do
        begin
          MessageDlg('No se importó completo el archivo.' +
            IntToStr(Fila) + e.Message, mtError, [mbOK], 0);
        end;
      end;
      end;
   end;
end;

procedure TWCrdocsmas.strgrdDocsDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var str : String;
    Bmp : TBitmap;
    sTexto: String;           // Texto que va a imprimir en la celda actual
    Alineacion: TAlignment;   // Alineación que le vamos a dar al texto
    iAnchoTexto: Integer;     // Ancho del texto a imprimir en pixels
begin
 If (Sender Is TStringGrid) Then
  With (Sender As TStringGrid) Do
   Begin
      If (gdSelected In State) Then Canvas.Brush.Color := clWhite;

      Canvas.Font.Color := clBlack;


      str := Cells[CO_COL_SITPROCES,ARow];
       If (str = 'ERR') Then
      begin
         Canvas.Font.Color := clRed;
         Canvas.Font.Style := [fsBold];
      end
      ELSE 
      begin
         Canvas.Font.Color := clGreen;
         Canvas.Font.Style := [fsBold];
      end;
      Canvas.TextRect(Rect,Rect.Left,Rect.Top,Cells[ACol, ARow]);

      if    (ACol = CO_COL_DOCUMENTO) or(ACol = CO_COL_TIPO) or(ACol = CO_COL_CHECK) or (ACol = CO_COL_FINGR) or
            (ACol = CO_COL_FVNTO) or(ACol = CO_COL_ALAMB) or(ACol = CO_COL_SITPROCES) or (ACol = CO_COL_FVREAL) then
         Alineacion := taCenter;

      if    (ACol = CO_COL_SOBRETSA) or(ACol = CO_COL_TASA) or(ACol = CO_COL_IMPNOMIN) or(ACol = CO_COL_PLAZO) or
            (ACol = CO_COL_AFORO)  or(ACol = CO_COL_TBASE) or(ACol = CO_COL_TCOMIS) or
            (ACol = CO_COL_IMP_AFO) or(ACol = CO_COL_IMP_COMP) or(ACol = CO_COL_REMANENT) then
         Alineacion := taRightJustify;

      sTexto := Cells[ACol,ARow];
      Canvas.FillRect( Rect );
      iAnchoTexto := Canvas.TextWidth( sTexto );

      case Alineacion of
        taLeftJustify:  Canvas.TextOut( Rect.Left + 5, Rect.Top + 2, sTexto );
        taCenter:       Canvas.TextOut( Rect.Left + ( ( Rect.Right - Rect.Left ) - iAnchoTexto ) div 2, Rect.Top + 2, sTexto );
        taRightJustify: Canvas.TextOut( Rect.Right - iAnchoTexto - 2, Rect.Top + 2, sTexto );
      end;


      If (ACol = CO_COL_CHECK) Then
      Begin
         Bmp := TBitmap.Create;
         If (Cells[CO_COL_CHECK,ARow] = CO_CHECKED) Then ImageList.GetBitmap(1,Bmp)
         Else ImageList.GetBitmap(0,Bmp);
         Canvas.Draw(Rect.Left,Rect.Top,Bmp);
         Bmp.FreeImage;
         Bmp.Free;
      End;

  End;
end;


procedure TWCrdocsmas.ConfGrid( SGrid : TStringGrid );
begin
 With SGrid Do
   Begin
      ColCount := 18; // 16

      RowHeights[0] := DefaultRowHeight;
      RowCount := 1;

      ColWidths[CO_COL_CHECK]     := 26;
      ColWidths[CO_COL_SITPROCES] := 45;
      ColWidths[CO_COL_DOCUMENTO] := 94;
      ColWidths[CO_COL_TIPO]      := 41;
      ColWidths[CO_COL_FINGR]     := 76;
      ColWidths[CO_COL_FVNTO]     := 73;
      ColWidths[CO_COL_PLAZO]     := 38;
      ColWidths[CO_COL_SOBRETSA]  := 56;
      ColWidths[CO_COL_TASA]      := 50;
      ColWidths[CO_COL_ALAMB]     := 47;
      ColWidths[CO_COL_AFORO]     := 56;
      ColWidths[CO_COL_IMPNOMIN]  := 78;
      ColWidths[CO_COL_FVREAL]    := 76;
      ColWidths[CO_COL_TBASE]     := 47;
      ColWidths[CO_COL_TCOMIS]    := 47;
      ColWidths[CO_COL_IMP_AFO]   := 78;
      ColWidths[CO_COL_IMP_COMP]  := 78;
      ColWidths[CO_COL_REMANENT]  := 69;
    End;
end;

procedure TWCrdocsmas.strgrdDocsMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var nCol, nRow : Integer;
begin
   strgrdDocs.MouseToCell(X, Y, nCol, nRow);
   if nCol = CO_COL_CHECK then
   begin
       if strgrdDocs.Cells[CO_COL_SITPROCES, nRow] <> 'ERR' then
         InvertCheck(strgrdDocs, CO_COL_CHECK, nRow);
   end;
end;

procedure TWCrdocsmas.InvertCheck(StrinGrid : TStringGrid; nCol, nRow : Integer);
begin
 With (StrinGrid) Do
  If (Cells[nCol, nRow] <>  CO_NOTCHECK) Then
   Begin
     If (Cells[nCol, nRow]  = CO_CHECKED) Then
         Cells[nCol, nRow] := CO_UNCHECKED
     Else
         Cells[nCol, nRow] := CO_CHECKED;
   End;
end;


function TWCrdocsmas.ValidaDocs(
               vlFILA,
               vlDOCUMENTO,
               vlTIPO,
               vlFINGR,
               vlFVNTO,
               vlPLAZO,
               vlSOBRETSA,
               vlTASA,
               vlALAMB,
               vlAFORO,
               vlIMPNOMIN,
               vlSITPROCES : string
              ) : Boolean;

   Function VerificaDocto(pIdProveedor : String; pIdDocumento, pCvedocto : String): Boolean;
   var vlSql    : String;
       vlResult : Integer;
   Begin
      vlSql := ' SELECT pkgcrperiodo.VerifdoctoProv( ' +
                       Objeto.Cesion.ID_CESION.AsString       + ' ,       ' +
                       SQLStr( pIdDocumento  ) + ' ) RESULT' +
               ' FROM DUAL ';
      GetSQLInt(vlSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'RESULT',vlResult,False);
      if vlResult = 0 then
         Result := False
      else if vlResult >= 1 then
         Result := True;
   end;

var  VLSalida  :  boolean;
     VlMsg:string;
     VLSql1,VLSql2,
     VlSql3  : String;
     VLfvr,vlfing : TDateTime;
begin
   VLSalida := true;
   MemoMessages.Lines.Add(' ');

   //SE CALCULA LA TASA DE FONDEO
   Objeto.ObtTasaFondeo( StrToInt(edID_CESION.Text), StrToInt(vlPLAZO),vlALAMB  );

   With strgrdDocs Do
    begin
     vldocvalida := Cells[CO_COL_TIPO, 0];
       //VALIDACION DE DOCUMENTO
     if ((Cells[CO_COL_DOCUMENTO, nRow] = '') or (Cells[CO_COL_DOCUMENTO, nRow] = '0')) then
     begin
        Vlfila := IntToStr(strToInt(Vlfila)+1);
        MemoMessages.Lines.Add('     ERROR: Indicar el número de documento en la fila: '+vlFILA);
        VLSalida := false;
     end
     else
       MemoMessages.Lines.Add('Docto. < '+vlDOCUMENTO+' >');

     if vlTIPO <> vldocvalida then
      begin
       MemoMessages.Lines.Add('     ERROR: Tipo de Documento diferente de acuerdo a la carga ');
       VLSalida := false;
      end;

      if validacvedocto(vlTIPO) = False then
      begin
      MemoMessages.Lines.Add('     ERROR: El Tipo de documento es Incorrecto ');
      VLSalida := false;
      end;

     //VALIDACION TIPO DE DOCUMENTO
     if vlTIPO = ''  then
     begin
        MemoMessages.Lines.Add('     ERROR: Indicar el tipo de documento');
        VLSalida:=false;
     end
     else
     if VerificaDocto(Objeto.Cesion.ID_PROVEEDOR.AsString, vlDOCUMENTO, vlTIPO) then
     Begin
        MemoMessages.Lines.Add('     ERROR: El documento ya existe');
        VLSalida := False;
     end;

     //VALIDA PLAZO
     IF StrToInt(vlPLAZO) <= 0 THEN
     BEGIN
        MemoMessages.Lines.Add('     ERROR: El plazo no puede ser menor o igual a Cero');
        VLSalida := False;
     END;

     //VALIDA FECHA DE EMISION
      If edFemisio.Text <> '' then
      Begin
         if StrToDate(edFemisio.Text) > Objeto.Apli.DameFechaEmpresa then
         begin
            MemoMessages.Lines.Add('     ERROR: La fecha de Emsión no puede ser mayor a la fecha de hoy');
            VLSalida := False;
         end
         else
         if ValidaFecha(StrToDate(edFemisio.Text),Objeto.Apli) <> 0 then
         begin
            MemoMessages.Lines.Add('     ERROR: La fecha de Emisión NO es un día hábil');
            VLSalida := False;
         end;
      end
      else
      begin
         MemoMessages.Lines.Add('     ERROR: Fecha de Emision NULA');
         VLSalida:=false;
         Cells[CO_COL_SITPROCES, nRow] := 'ERR';
         Cells[CO_COL_CHECK, nRow]     := CO_UNCHECKED;
      end;

      //INICIO VALIDA FECHA DE INGRESO DOC. JFOF ENE-2013
      if vlFINGR <> '' then
       begin
      if  StrToDate(vlFINGR) > StrToDate(edFemisio.Text) then
         Begin
            MemoMessages.Lines.Add('     ERROR: La fecha de Ingreso no puede ser mayor a la fecha de Inicio');
            VLSalida := False;
         End;
        end;

      //FIN    VALIDA FECHA DE INGRESO DOC. JFOF ENE-2013
      // INICIO VALIDA DÍAS DE PAGO JFOF ENE-2013
      if vlTIPO <> '' then
          begin
          vldiaspago := '';
          VLSql1 := '  SELECT emd.cve_fnd_ent_des, emd.id_emisor, emd.cve_documento, emd.dias_pago,'+
                    '         emd.b_f_venc_real'+
                    '    FROM cr_emisor_doc emd'+
                    '   WHERE 1 = 1'+
                    '     AND id_emisor =  (SELECT   id_emisor'+
                    '                         FROM cr_cesion'+
                    '                        WHERE id_cesion = '+ edID_CESION.Text +
                    '                     GROUP BY id_emisor) '+
                    '     AND emd.cve_documento = '''+ vlTIPO +'''';

           Query1 :=  GetSQLQuery(vlsql1, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True);
           if Query1 <> nil then
           vldiaspago := Query1.FieldByName('dias_pago').AsString;
           vlgbaplica := Query1.FieldByName('b_f_venc_real').AsString;

          if (vldiaspago = '') or (strtoint(vldiaspago) = 0) then
          begin
           VLSql2 := ' SELECT crt.cve_documento, crt.desc_documento, crt.dias_pago '+
                     '   FROM cr_tipo_docto crt '+
                     '  where 1=1 '+
                     '    and cve_documento = '''+ vlTIPO +'''';
          Query2 :=  GetSQLQuery(vlsql2, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
          if Query2 <> nil then
          vldiaspago := Query2.FieldByName('dias_pago').AsString;
          end;

          if (vldiaspago = '') or (strtoint(vldiaspago) = 0)  then
            begin
              if Query1 <> nil then
              begin
               if (Query1.FieldByName('b_f_venc_real').AsString = 'V') then
                begin
                 VLSalida := False;
                 MemoMessages.Lines.Add('     ERROR: No existen días de pago para el emisor/documento');
                end;
              end;
           end;
       end;

       if (vlgbaplica = 'V') and (vlFINGR = '') then
       begin
       VLSalida := False;
       MemoMessages.Lines.Add('     ERROR: La fecha de Ingreso es Nula y aplica fecha de vencimiento real');
       end;


       if vlFINGR <> '' then
       begin
        if (vldiaspago <> '') or (strtoint(vldiaspago) = 0) then
       begin
       VLfvr :=  ValFechaHabil(StrToDate(vlFINGR)+ StrToInt(vldiaspago));
       end
       else
       VLfvr :=  ValFechaHabil(StrToDate(vlFINGR));

       vlfing :=  StrToDate(vlFVNTO);

       if VLfvr > vlfing then  begin
       VLSalida := False;
       MemoMessages.Lines.Add('     ERROR: La fecha de vencimiento real NO puede ser mayor a la fecha de vencimiento');
       end;
       end;


      // FIN VALIDA DÍAS DE PAGO JFOF ENE-2013       
      // VALIDA FECHA DE VENCIMIENTO
      If vlFVNTO <> '' then
      Begin
         if StrToDate(edFcomp.Text) > StrToDate(vlFVNTO) then
         Begin
            MemoMessages.Lines.Add('     ERROR: La fecha de Vencimiento no puede ser menor a la fecha de compra');
            VLSalida := False;
         End
         else
         if StrToDate(vlFVNTO) < Objeto.Apli.DameFechaEmpresa then
         Begin
            MemoMessages.Lines.Add('     ERROR: La fecha de vencimiento no puede ser MENOR a la fecha de hoy');
            VLSalida := False;
         End
         else if ValidaFecha(StrToDate(vlFVNTO),Objeto.Apli) <> 0 then
         Begin
            MemoMessages.Lines.Add('     ERROR: La fecha de vencimiento NO es un día hábil');
            VLSalida := False;
         End;

      //VALIDA TASA ALAMBRADA
      IF ((vlALAMB <> 'F') AND (vlALAMB <> 'V'))  then
      begin
        MemoMessages.Lines.Add('     ERROR: La tasa Alambrada tiene valor diferente de "V" ó "F"');
        vlSalida := False;
      end;

      //VALIDA SOBRETASA
//      IF StrToFloat(vlSOBRETSA) < Objeto.Cesion.Emisor.SOBRETASA.AsFloat then
//      Begin
//         MemoMessages.Lines.Add('     ERROR: La sobretasa no dede de ser menor a la sobretasa del emisor');
//         vlSalida := False;
//      end;                 CHIO

      if (StrToFloat(vlSOBRETSA) > 0 ) and (StrToFloat(vlTASA) > 0) then
      begin
      MemoMessages.Lines.Add('     ERROR: Importes en Sobretasa y Tasa Descuento no pueden ser mayores a cero Simultáneamente ');
      vlSalida := False;
      end;

      //CALCULA TASA DESCUENTO EN CASO DE SER NULO
      IF (StrToFloat(vlSOBRETSA) > 0 ) and (StrToFloat(vlTASA) = 0) then
      Begin
         vltasatemp := 0;
         Objeto.ObtTasaDescuento(StrToFloat(vlSOBRETSA));
         if VLTASADESCTO = 0 then
         begin
            MemoMessages.Lines.Add('     ERROR: Calculo de Tasa de Descuento Invalido');
            vlSalida := False;
         end
         else
         vltasatemp := VLTASADESCTO;
      end;

      //CALCULA SOBRETASA EN CASO DE SER NULO
      IF (StrToFloat(vlSOBRETSA) = 0 ) and (StrToFloat(vlTASA) > 0) then
      Begin
         vltasatmps := 0;
         Objeto.ObtSobreTasa(StrToInt(edID_CESION.Text));

         if (VLTASAFONDEO + VLTASASOBRE) <> StrToFloat(vlTASA) then
           begin
                VLTASASOBRE := StrToFloat(vlTASA) - VLTASAFONDEO;
           end;
         if VLTASASOBRE = 0 then
         begin
            MemoMessages.Lines.Add('     ERROR: Calculo de Sobretasa Invalido');
            vlSalida := False;
         end
         else
         vltasatmps := VLTASASOBRE;
      end;

      //TASA INT/DESC
      if StrToFloat(vlTASA) < 0 then
      Begin
         MemoMessages.Lines.Add('     ERROR: La tasa de descuento no puede ser menor a cero');
         VLSalida := False;
      end;

      IF (StrToFloat(vlSOBRETSA) = 0 ) and (StrToFloat( vlTASA) > 0) then
      Begin
         if (VLTASAFONDEO + StrToFloat(vlSOBRETSA) <> StrToFloat(vlTASA)) then
         begin
            vlSOBRETSA := FloattoStr(StrToFloat(vlTASA) - VLTASAFONDEO);
         end;
      end;


      //VALIDA AFORO
      if StrToFloat(vlAFORO) <= 0 then
      begin
         MemoMessages.Lines.Add('     ERROR: Verificar Importe Aforo');
         VLSalida := False;
      end;


      //VALIDA IMPORTE NOMINAL
      if StrToFloat(vlIMPNOMIN) <= 0 then
      Begin
         MemoMessages.Lines.Add('     ERROR: El importe nominal debe de ser MAYOR a cero');
         VLSalida := False;
      end;


      if VLSalida then
      begin
         Objeto.ObtImpAforo(StrToFloat(vlIMPNOMIN), StrToFloat(vlAFORO));

         if StrToFloat(vlTASA) > 0 then begin
         Objeto.ObtImpCompra(StrToInt(vlPLAZO), StrToFloat(vlTASA));
         end
         else begin
         Objeto.ObtImpCompra(StrToInt(vlPLAZO), VLTASADESCTO);
         end;
         Objeto.StpObtRemanente(VLIMPCOMPRA, Objeto.Cesion.Credito.FACT_MORAS.AsFloat, StrToFloat(vlIMPNOMIN), StrToFloat(vlAFORO), vlDOCUMENTO);
         MemoMessages.Lines.Add('     Datos correctos');
         VLSalida := True;

         VLIMPNOMINAT := StrToFloat(vlIMPNOMIN) + VLIMPNOMINAT;
         VLIMPAFORADT := VLIMPAFORADO + VLIMPAFORADT;
         VLIMPCOMPRAT := VLIMPCOMPRA  + VLIMPCOMPRAT;

      end;

     end;

   end;
   ValidaDocs := VLSalida;
end;


procedure TWCrdocsmas.btPROC_INFOClick(Sender: TObject);
var cont1, cont2, RegTot  : word;
    vlMesg : String;

begin
   if Objeto.ValidaAccesoEsp('TCRDOCSMAS_PROC',True,True) then
   begin
       cregtot := 0;
       cregok :=0;
       cregerror   :=0;

       vlMesg := '¿ Está seguro de importar los registros marcados ?';
       if MessageDlg(vlMesg, mtConfirmation,[mbYes, mbNo], 0) = mrYes then
       Begin
          MemoMessages.Clear;
          ClearGrid(Sgridtemp,0);
          ConfGrid(Sgridtemp);

          //COPIAMOS LOS DOCUMENTOS A PROCESAR AL GRID TEMPORAL
          cont1  := 0;
          cont2  := 0;
          RegTot := strgrdDocs.RowCount;
          while (cont1 <= RegTot) do
          begin
             if (trim(strgrdDocs.Cells[CO_COL_SITPROCES, cont1])='OK') AND (trim(strgrdDocs.Cells[CO_COL_CHECK, cont1])=CO_CHECKED) then
             begin
                cregtot :=cregtot+1;

                Sgridtemp.Cells[CO_COL_DOCUMENTO, cont2] :=  strgrdDocs.Cells[CO_COL_DOCUMENTO, cont1];
                Sgridtemp.Cells[CO_COL_TIPO, cont2]      :=  strgrdDocs.Cells[CO_COL_TIPO, cont1];
                Sgridtemp.Cells[CO_COL_FINGR, cont2]     :=  strgrdDocs.Cells[CO_COL_FINGR, cont1];
                Sgridtemp.Cells[CO_COL_FVNTO, cont2]     :=  strgrdDocs.Cells[CO_COL_FVNTO, cont1];
                Sgridtemp.Cells[CO_COL_PLAZO, cont2]     :=  strgrdDocs.Cells[CO_COL_PLAZO, cont1];

                Sgridtemp.Cells[CO_COL_SOBRETSA, cont2]  :=  strgrdDocs.Cells[CO_COL_SOBRETSA, cont1];
                Sgridtemp.Cells[CO_COL_TASA, cont2]      :=  strgrdDocs.Cells[CO_COL_TASA, cont1];
                Sgridtemp.Cells[CO_COL_ALAMB, cont2]     :=  strgrdDocs.Cells[CO_COL_ALAMB, cont1];
                Sgridtemp.Cells[CO_COL_AFORO, cont2]     :=  strgrdDocs.Cells[CO_COL_AFORO, cont1];
                Sgridtemp.Cells[CO_COL_IMPNOMIN, cont2]  :=  strgrdDocs.Cells[CO_COL_IMPNOMIN, cont1];

                Sgridtemp.Cells[CO_COL_FVREAL, cont2]     :=  strgrdDocs.Cells[CO_COL_FVREAL, cont1];
                Sgridtemp.Cells[CO_COL_TBASE, cont2]     :=  strgrdDocs.Cells[CO_COL_TBASE, cont1];
                Sgridtemp.Cells[CO_COL_TCOMIS, cont2]    :=  strgrdDocs.Cells[CO_COL_TCOMIS, cont1];
                Sgridtemp.Cells[CO_COL_IMP_AFO, cont2]   :=  strgrdDocs.Cells[CO_COL_IMP_AFO, cont1];
                Sgridtemp.Cells[CO_COL_IMP_COMP, cont2]  :=  strgrdDocs.Cells[CO_COL_IMP_COMP, cont1];
                Sgridtemp.Cells[CO_COL_REMANENT, cont2]  :=  strgrdDocs.Cells[CO_COL_REMANENT, cont1];
                cont2:=cont2+1;
             end;
             cont1:=cont1+1;
          end;
          Sgridtemp.RowCount:=cont2-1;

          ClearGrid(strgrdDocs,0);
          ConfGrid(strgrdDocs);

          cont1  := 0;
          RegTot := Sgridtemp.RowCount;

          while (cont1 <= RegTot) or (trim(strgrdDocs.Cells[CO_COL_DOCUMENTO, cont1])<> '') do
          begin
             MemoMessages.Lines.Add('Docto. ('+Sgridtemp.Cells[CO_COL_DOCUMENTO, cont1]+')');

             strgrdDocs.Cells[CO_COL_DOCUMENTO, cont1]  :=  Sgridtemp.Cells[CO_COL_DOCUMENTO, cont1];
             strgrdDocs.Cells[CO_COL_TIPO, cont1]       :=  Sgridtemp.Cells[CO_COL_TIPO, cont1];
             strgrdDocs.Cells[CO_COL_FINGR, cont1]      :=  Sgridtemp.Cells[CO_COL_FINGR, cont1];
             strgrdDocs.Cells[CO_COL_FVNTO, cont1]      :=  Sgridtemp.Cells[CO_COL_FVNTO, cont1];
             strgrdDocs.Cells[CO_COL_PLAZO, cont1]      :=  Sgridtemp.Cells[CO_COL_PLAZO, cont1];
             strgrdDocs.Cells[CO_COL_SOBRETSA, cont1]   :=  Sgridtemp.Cells[CO_COL_SOBRETSA, cont1];
             strgrdDocs.Cells[CO_COL_TASA, cont1]       :=  Sgridtemp.Cells[CO_COL_TASA, cont1];
             strgrdDocs.Cells[CO_COL_ALAMB, cont1]      :=  Sgridtemp.Cells[CO_COL_ALAMB, cont1];
             strgrdDocs.Cells[CO_COL_AFORO, cont1]      :=  Sgridtemp.Cells[CO_COL_AFORO, cont1];
             strgrdDocs.Cells[CO_COL_IMPNOMIN, cont1]   :=  Sgridtemp.Cells[CO_COL_IMPNOMIN, cont1];
             strgrdDocs.Cells[CO_COL_FVREAL, cont1]     :=  Sgridtemp.Cells[CO_COL_FVREAL, cont1];
             strgrdDocs.Cells[CO_COL_TBASE, cont1]      :=  Sgridtemp.Cells[CO_COL_TBASE, cont1];
             strgrdDocs.Cells[CO_COL_TCOMIS, cont1]     :=  Sgridtemp.Cells[CO_COL_TCOMIS, cont1];
             strgrdDocs.Cells[CO_COL_IMP_AFO, cont1]    :=  Sgridtemp.Cells[CO_COL_IMP_AFO, cont1];
             strgrdDocs.Cells[CO_COL_IMP_COMP, cont1]   :=  Sgridtemp.Cells[CO_COL_IMP_COMP, cont1];
             strgrdDocs.Cells[CO_COL_REMANENT, cont1]   :=  Sgridtemp.Cells[CO_COL_REMANENT, cont1];

             if InsertaDocto(Sgridtemp, cont1)=true then
             begin
                strgrdDocs.Cells[CO_COL_CHECK, cont1]     := 'V';
                strgrdDocs.Cells[CO_COL_SITPROCES, cont1] :=  'PROC';
                MemoMessages.Lines.Add('     Procesado Correctamente');
                cregok :=cregok+1;
             end
             else
             begin
                strgrdDocs.Cells[CO_COL_CHECK, cont1]     := 'F';
                strgrdDocs.Cells[CO_COL_SITPROCES, cont1] :=  'ERR';
                MemoMessages.Lines.Add('     Error: '+VLERRORSTP);
                cregerror :=cregerror+1;
             end;

             cont1:=cont1+1;
          end;
          strgrdDocs.RowCount:= cont1;
          Tregproc_tot.Text:=IntToStr(cregtot);
          Tregproc_ok.Text:=IntToStr(cregok);
          Tregproc_error.Text:=IntToStr(cregerror);

          ShowMessage('  ¡ Proceso Concluido !');

       end;
   end;
end;



procedure TWCrdocsmas.btCANCELA_BLOQUEClick(Sender: TObject);
var  CancDocto: TCrcandoc;
begin
      CancDocto := TCrcandoc.Create(self);
      try
         CancDocto.Apli := Objeto.Apli;
         CancDocto.ParamCre := Objeto.ParamCre;
         CancDocto.ID_CESION.AsString := Objeto.Cesion.ID_CESION.AsString;
         CancDocto.Catalogo;
      finally
         Objeto.FindKey([CancDocto.ID_CESION.AsString,CancDocto.ID_DOCUMENTO.AsString]);
         CancDocto.Free;
         icpCONTRATO.RefrescaInfo; //Refresca la información del Contrato
      end;
end;


function TWCrdocsmas.ValFechaHabil(pFecha: TDate): TDate;
var     STPValFecha : TStoredProc;
        VLFecha     : TDate;
Begin
     STPValFecha := TStoredProc.Create(Nil);
     try
          STPValFecha.DatabaseName:= Objeto.Apli.DatabaseName;
          STPValFecha.SessionName:= Objeto.Apli.SessionName;
          STPValFecha.StoredProcName:='PKGFECHAS.SPE_FECHAMET6';
          STPValFecha.Params.CreateParam(ftInteger,'P_IdEmpresa',ptInput);
          STPValFecha.Params.CreateParam(ftString,'p_CveLiq',ptInput);
          STPValFecha.Params.CreateParam(ftDate,'P_Fecha',ptInputOutput);
          STPValFecha.Params.CreateParam(ftInteger,'ps_resp',ptOutput);
          STPValFecha.Prepare;
          STPValFecha.ParamByName('P_IdEmpresa').AsInteger := Objeto.Apli.IdEmpresa;
          STPValFecha.ParamByName('p_CveLiq').AsString := 'SPOT';
          STPValFecha.ParamByName('P_Fecha').AsDate := pFecha;
          STPValFecha.ExecProc;

          vlFecha  := STPValFecha.ParamByName('p_fecha').AsDate;
     finally
          If Assigned(STPValFecha) Then STPValFecha.Free;
     end;
     ValFechaHabil := vlFecha;

end;

end.
