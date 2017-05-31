// Sistema         : Clase de CR_EMISOR_PROV
// Fecha de Inicio : 30/06/2003
// Función forma   : Clase de CR_EMISOR_PROV
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :         
// Comentarios     :
Unit IntCrEmiPro;

interface                

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,

//Unidades Adicionales
IntParamCre,IntCrEmisor,IntCrProveed, IntMPers, InterEdit,IntGenCre, IntCrGruPro,Grids,
IntEmple,  Aligrid, IntMInstDesc,
IntCrCartrIm            //Detalle de Impagado
;

Const
   coCRLF      = #13#10;
   CO_COL1 = 0;
   CO_COL2 = CO_COL1 + 1;
   CO_COL3 = CO_COL2 + 1;
   CO_COL4 = CO_COL3 + 1;
   CO_COL5 = CO_COL4 + 1;
   CO_COL6 = CO_COL5 + 1;   

   CO_ERROR     = 'ERR';  // Mensaje de Error

Type
 TCrEmiPro= class;

  TWCrEmisorProv=Class(TForm)
    InterForma1             : TInterForma; 
    lbID_EMISOR : TLabel; 
    edID_EMISOR : TEdit;
    lbID_PROVEEDOR : TLabel;
    edID_PROVEEDOR : TEdit;
    lbID_PROMOTOR : TLabel;
    edID_PROMOTOR : TEdit;
    rgSIT_EMISOR_PROV : TRadioGroup;
    btEMISOR: TBitBtn;
    btPROVEEDOR: TBitBtn;
    btPROMOTOR: TBitBtn;
    edNOM_PROMOTOR: TEdit;
    edNOM_PROVEEDOR: TEdit;
    edNOM_EMISOR: TEdit;
    lbF_ALTA: TLabel;
    lbF_MODIFICA: TLabel;
    edF_MODIFICA: TEdit;
    edF_ALTA: TEdit;
    LBCVE_USU_ALTA: TLabel;
    lbCVE_USU_MODIFICA: TLabel;
    edCVE_USU_MODIFICA: TEdit;
    edCVE_USU_ALTA: TEdit;
    MsgPanel: TPanel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    ilPROVEEDOR: TInterLinkit;
    ilPROMOTOR: TInterLinkit;
    ilEMISOR: TInterLinkit;
    edID_PROV_EXTERNO: TEdit;
    edRIESGO_MAXIMO: TInterEdit;
    Label1: TLabel;
    Label2: TLabel;
    edRIESGO_ACUMULADO: TInterEdit;
    BitBtn4: TBitBtn;
    Label3: TLabel;
    edCVE_FND_ENT_DES: TEdit;
    btnCVE_FND_ENT_DES: TBitBtn;
    edDESC_ENT_DES: TEdit;
    ilCVE_FND_ENT_DES: TInterLinkit;
    GBAutorizacion: TGroupBox;
    GBchequera: TGroupBox;
    strgrdCheq: TStringGrid;
    Shape2: TShape;
    Label5: TLabel;
    Shape1: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Shape5: TShape;
    Label11: TLabel;
    spBLOQUEO: TStoredProc;
    Label13: TLabel;
    edSOBRETASA: TInterEdit;
    strgrdCont: TStringGrid;
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
    Shape12: TShape;
    Label16: TLabel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btEMISORClick(Sender: TObject);
    procedure ilEMISORCapture(Sender: TObject; var Show: Boolean);
    procedure ilEMISOREjecuta(Sender: TObject);
    procedure btPROVEEDORClick(Sender: TObject);
    procedure ilPROVEEDORCapture(Sender: TObject; var Show: Boolean);
    procedure ilPROVEEDOREjecuta(Sender: TObject);
    procedure btPROMOTORClick(Sender: TObject);
    procedure ilPROMOTORCapture(Sender: TObject; var Show: Boolean);
    procedure ilPROMOTOREjecuta(Sender: TObject);
    procedure btEMISORExit(Sender: TObject);
    procedure edID_PROVEEDORExit(Sender: TObject);
    procedure edID_PROMOTORExit(Sender: TObject);
    procedure rgSIT_EMISOR_PROVExit(Sender: TObject);
    Procedure MuestraHints;
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure edRIESGO_MAXIMOExit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure edCVE_FND_ENT_DESExit(Sender: TObject);
    procedure btnCVE_FND_ENT_DESClick(Sender: TObject);
    procedure ilCVE_FND_ENT_DESCapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_FND_ENT_DESEjecuta(Sender: TObject);
    procedure edSOBRETASAExit(Sender: TObject);
    procedure strgrdCheqDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure strgrdContDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);

    private
    { Private declarations }
     procedure IniciaError(var StrGrd : TStringGrid);
     function  Revisa_Bloqueo(peIdContrato : String):string;
     procedure  Llena_Linea;
     procedure  Llena_Chequera;
    public 
    { Public declarations }
    Objeto : TCrEmiPro;
end;
 TCrEmiPro= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        CVE_FND_ENT_DES          : TInterCampo;
        ID_EMISOR                : TInterCampo;
        ID_PROVEEDOR             : TInterCampo;
        ID_PROMOTOR              : TInterCampo;
        SIT_EMISOR_PROV          : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        RIESGO_MAXIMO            : TInterCampo;
        IMP_RIESGO_ACUM          : TInterCampo;
        SOBRETASA                : TInterCampo;

        //Clases Adicionales
        ParamCre                 : TParamCre;
        Emisor                   : TCrEmisor;
        Proveedor                : TCrProveed;
//        Promotor                 : TMPersona; //Promotor Responsable
        Promotor                 : TEmpleado; //Promotor Responsable
        MInstDesc                : TMInstDesc;
        DetImpagado              : TCrCartrIm;

        // Campos de Prellenado para cuando es Nuevo
        m_sCVE_FND_ENT_DES          : String;
        m_nPRE_ID_EMISOR            : Integer;
        m_nPRE_ID_PROVEEDOR         : Integer;
        m_strCVE_EMISOR_EXT       : String;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        Procedure   ObtenRiesgoAcumulado;
        function    RefinanAut(peIdContrato, peFolContrato : String):string;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrEmiPro.Create( AOwner : TComponent );
begin Inherited;
      CVE_FND_ENT_DES :=CreaCampo('CVE_FND_ENT_DES',ftString,tsNinguno,tsNinguno,True);
                CVE_FND_ENT_DES.Caption:='Clave de Fnd Ent Des';
      ID_EMISOR :=CreaCampo('ID_EMISOR',ftFloat,tsNinguno,tsNinguno,True);
                ID_EMISOR.Caption:='Emisor';
      ID_PROVEEDOR :=CreaCampo('ID_PROVEEDOR',ftFloat,tsNinguno,tsNinguno,True);
                ID_PROVEEDOR.Caption:='Proveedor';
      ID_PROMOTOR :=CreaCampo('ID_PROMOTOR',ftFloat,tsNinguno,tsNinguno,True);
                ID_PROMOTOR.Caption:='Promotor Responsable';
      SIT_EMISOR_PROV :=CreaCampo('SIT_EMISOR_PROV',ftString,tsNinguno,tsNinguno,True);
         With SIT_EMISOR_PROV do
          begin Size:=2;
                UseCombo:=True;
                ComboLista.Add('0'); ComboDatos.Add('AC');
                ComboLista.Add('1'); ComboDatos.Add('CA');
          end;
                SIT_EMISOR_PROV.Caption:='Situación relación Emisor - Proveedor';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      RIESGO_MAXIMO :=CreaCampo('RIESGO_MAXIMO',ftFloat,tsNinguno,tsNinguno,True);
                RIESGO_MAXIMO.Caption:='Riesgo Máximo';
      IMP_RIESGO_ACUM :=CreaCampo('IMP_RIESGO_ACUM',ftFloat,tsNinguno,tsNinguno,False);
      SOBRETASA :=CreaCampo('SOBRETASA',ftFloat,tsNinguno,tsNinguno,True);
                SOBRETASA.Caption:='Sobretasa';

      FKeyFields.Add('CVE_FND_ENT_DES');
      FKeyFields.Add('ID_EMISOR');
      FKeyFields.Add('ID_PROVEEDOR');

      TableName := 'CR_EMISOR_PROV';
      UseQuery := True;
      HelpFile := 'IntCrEmiPro.Hlp';
      ShowMenuReporte:=True;

      Emisor := TCrEmisor.Create(Self);
      Emisor.MasterSource:=Self;
      Emisor.FieldByName('CVE_FND_ENT_DES').MasterField:='CVE_FND_ENT_DES';
      Emisor.FieldByName('ID_ACREDITADO').MasterField:='ID_EMISOR';

      Proveedor := TCrProveed.Create(Self);
      Proveedor.MasterSource:=Self;
      Proveedor.FieldByName('CVE_FND_ENT_DES').MasterField:='CVE_FND_ENT_DES';
      Proveedor.FieldByName('ID_ACREDITADO').MasterField:='ID_PROVEEDOR';
      {Proveedor.BuscaWhereString := 'SIT_PROVEEDOR = ''AC''';}

      Promotor := TEmpleado.Create(Self);
      Promotor.FilterBy := fbTMPersonaEmpleado;
      Promotor.MasterSource := Self;
      Promotor.FieldByName('ID_PERSONA').MasterField := 'ID_PROMOTOR';
      Promotor.BuscaWhereString := 'SIT_EMPLEADO = ''AC''';
      Promotor.FilterString := Promotor.BuscaWhereString;

      MInstDesc := TMInstDesc.Create(Self);
      MInstDesc.MasterSource:= Self;
      MInstDesc.FieldByName('CVE_FND_ENT_DES').MasterField:= 'CVE_FND_ENT_DES';
end;

Destructor TCrEmiPro.Destroy;
begin
   if Emisor <> nil then
      Emisor.Free;
   if Proveedor <> nil then
      Proveedor.Free;
   if Promotor <> nil then
      Promotor.Free;
   if MInstDesc <> nil then
      MInstDesc.Free;
   inherited;
end;


function TCrEmiPro.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrEmisorProv;
begin
   W:=TWCrEmisorProv.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrEmiPro.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrEmPr.it','S,F,F');
      Try
         if Active then begin
            T.Param(0,CVE_FND_ENT_DES.AsString);
            T.Param(1,ID_EMISOR.AsString);
            T.Param(2,ID_PROVEEDOR.AsString);
         end;
         if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2)]);
      finally  T.Free;
      end;
end;
{----------------------------------------------------------------------------------------------------------------------
                                        OBTIENE EL IMPORTE RIESGO ACUMULADO
----------------------------------------------------------------------------------------------------------------------}
Procedure TCrEmiPro.ObtenRiesgoAcumulado;
var vlSql         : String;
    vlRiesAcum    : String;
Begin
   vlSql := 'SELECT PKGCRPERIODO.StpObtRiesgoAcum( '+ SQLStr(CVE_FND_ENT_DES.AsString) + ' , ' + ID_EMISOR.AsString + ' , ' + ID_PROVEEDOR.AsString +') RIESGO_ACUM FROM DUAL';
   GetSqlStr(vlSqL,Apli.DataBaseName,Apli.SessionName,'RIESGO_ACUM',vlRiesAcum,False);
   if vlRiesAcum = '' then
      vlRiesAcum := '0';
   IMP_RIESGO_ACUM.AsFloat := StrToFloat(vlRiesAcum);
end;

function TCrEmiPro.RefinanAut(peIdContrato, peFolContrato : String):string;
var StpRefinanAut :  TStoredProc;
Begin
   RefinanAut:='0';
    StpRefinanAut := TStoredProc.Create(Self);
    try
       with StpRefinanAut do
       begin
          StpRefinanAut.DatabaseName:= Apli.DatabaseName;
          StpRefinanAut.SessionName:= Apli.SessionName;
          StpRefinanAut.StoredProcName:='PKGCRSALDOS.STPOBTFINANADICAUT';

          Params.Clear;
          Params.CreateParam(ftFloat,'PEIDCONTRATO',ptInput);
          Params.CreateParam(ftFloat,'PEFOLCONTRATO',ptInput);
          Params.CreateParam(ftFloat,'PSFINADICAUT',ptOutput);
          Params.CreateParam(ftFloat,'PSRIESGOTOTAL',ptOutput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
          Prepare;
          ParamByName('peIdContrato').AsString  := peIdContrato;
          ParamByName('peFolcontrato').AsString := peFolContrato;
          ExecProc;

          if ParamByName('PSResultado').AsInteger = 0 then
          begin
             //TOTAL_FINANC_ADIC.AsFloat := ParamByName('PSFINADICAUT').AsFloat;
             //RIESGO_TOTAL.AsFloat := ParamByName('PSRIESGOTOTAL').AsFloat;
             RefinanAut:=FloatToStr(ParamByName('PSRIESGOTOTAL').AsFloat);
             if ( ( Modo = moEdit ) or ( Modo = moAppend ) ) then
               if ParamByName('psTxResultado').AsString <> CNULL then
                  MessageDlg(ParamByName('psTxResultado').AsString,mtInformation, [ mbOK ], 0);
               //end if
             //end if
          end
          else
          Begin
             ShowMessage('PROBLEMAS AL OBTENER EL REFINANCIAMIENTO: ' +
                         ParamByName('psRESULTADO').AsString);
             ShowMessage(ParamByName('psTxResultado').AsString);
          end;
          UnPrepare;
       end;
    finally
       StpRefinanAut.Free;
    end;
end;


(***********************************************FORMA CR_EMISOR_PROV********************)
(*                                                                              *)
(*  FORMA DE CR_EMISOR_PROV                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_EMISOR_PROV********************)

function TWCrEmisorProv.Revisa_Bloqueo(peIdContrato : String):string;
Begin
    Revisa_Bloqueo:='F';

    spBLOQUEO.DatabaseName := Objeto.Apli.DataBaseName;
    spBLOQUEO.SessionName  := Objeto.Apli.SessionName;
    spBLOQUEO.ParamByName('PIDCONTRATO').AsInteger := StrToInt(peIdContrato);
    spBLOQUEO.ParamByName('PFECHA').AsDate := Objeto.Apli.DameFechaEmpresa;
    spBLOQUEO.ExecProc;
    if copy(spBLOQUEO.ParamByName('PSRESULT').AsString,1,1) = 'V' then
       Revisa_Bloqueo:='V';
end;

procedure TWCrEmisorProv.Llena_Linea;
var vlsql :  String;
    vlQry : TQuery;
    nRow : Integer;
    vlcant : string;
begin
   {if  Trim(edNOM_EMISOR.Text)<>'' then
   begin}
      ClearGrid(strgrdCont,0);
      vlsql:=' SELECT C.F_VENCIMIENTO,  C.SIT_LINEA, C.ID_CONTRATO, C.CVE_PRODUCTO_CRE, '+coCRLF+
             '        (SELECT DESC_MONEDA FROM MONEDA WHERE CVE_MONEDA=C.CVE_MONEDA) MONEDA, '+coCRLF+
             '        (SELECT PKGCRSALDOS.STPOBTDISPONIBLEAUT( C.ID_CONTRATO, C.FOL_CONTRATO) FROM DUAL) AS DISPONIBLE, '+coCRLF+
             '        C.ID_CONTRATO, C.FOL_CONTRATO '+coCRLF+
             '   FROM CR_CONTRATO C, '+coCRLF+
   {          '        (SELECT MAX(F_ALTA) AS F_ALT '+coCRLF+
             '           FROM CR_CONTRATO WHERE 1=1 '+coCRLF+
             '            AND ID_CONTRATO IN (SELECT ID_CONTRATO '+coCRLF+
             '                                  FROM CONTRATO '+coCRLF+
     	     ' 	  			       WHERE ID_TITULAR IN ('+edID_EMISOR.Text+') '+coCRLF+
	     ' 			                 AND CVE_TIP_CONTRATO=''CRED'' '+coCRLF+
       	     '				         AND SIT_CONTRATO=''AC'' '+coCRLF+
	     '  			     )'+coCRLF+
             '            AND F_VENCIMIENTO >= TO_DATE(pkgCrComun.stpObtenFecha( '+IntToStr(Objeto.Apli.IdEmpresa)+', ''D000'' ),''DD/MM/YYYY'') '+coCRLF+
	     '       ) C1, '+coCRLF+       }
             '	     CR_PRODUCTO CP '+coCRLF+
             '  WHERE 1=1 '+coCRLF+
             '    AND C.ID_CONTRATO IN (SELECT ID_CONTRATO '+coCRLF+
             '                            FROM CONTRATO '+coCRLF+
     	     ' 	  	                 WHERE ID_TITULAR IN ('+edID_EMISOR.Text+') '+coCRLF+
	     ' 			           AND CVE_TIP_CONTRATO=''CRED'' '+coCRLF+
       	     '			           AND SIT_CONTRATO=''AC'' '+coCRLF+
	     '  		        )'+coCRLF+
             '    AND C.F_VENCIMIENTO >= TO_DATE(pkgCrComun.stpObtenFecha( '+IntToStr(Objeto.Apli.IdEmpresa)+', ''D000'' ),''DD/MM/YYYY'') '+coCRLF+
         //    '    AND C.F_ALTA = C1.F_ALT '+coCRLF+
             '    AND C.CVE_PRODUCTO_CRE = CP.CVE_PRODUCTO_CRE '+coCRLF+
             '    AND CP.CVE_PRODUCTO_GPO IN (''FACTOR'')'+coCRLF+
             '  ORDER BY C.F_ALTA DESC' ;

      vlQry := GetSQLQuery(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
      ClearGrid(strgrdCont,0);

      With strgrdCont Do
      Begin
         RowHeights[0] := DefaultRowHeight;
         RowCount := 1;
         ColCount := 6;
         RowCount := 9999;

         ColWidths[CO_COL1] := 80;
         ColWidths[CO_COL2] := 110;
         ColWidths[CO_COL3] := 110;
         ColWidths[CO_COL4] := 110;
         ColWidths[CO_COL5] := 90;
         ColWidths[CO_COL6] := 110;
      End;

      nRow := 0;
      IniciaError(strgrdCont);

      If Assigned(vlQry) Then
         With strgrdCont, vlQry Do
            While Not vlQry.Eof Do
            Begin
               TNumericField(FieldByName('DISPONIBLE')).DisplayFormat := '###,###,###,##0.00';

               Cells[CO_COL1, nRow] := FieldByName('ID_CONTRATO').AsString;
               Cells[CO_COL2, nRow] := FieldByName('F_VENCIMIENTO').AsString;

               vlcant := FieldByName('DISPONIBLE').AsString;
               Cells[CO_COL3, nRow] := Format('%m', [StrToFloat(vlcant)]);

               vlcant := Objeto.RefinanAut(FieldByName('ID_CONTRATO').AsString, FieldByName('FOL_CONTRATO').AsString);
               Cells[CO_COL4, nRow] := Format('%m', [StrToFloat(vlcant)]);

               if FieldByName('SIT_LINEA').AsString='NA' then Cells[CO_COL5, nRow]:='NO AUTORIZADO';
               if FieldByName('SIT_LINEA').AsString='AU' then Cells[CO_COL5, nRow]:='AUTORIZADO';
               if FieldByName('SIT_LINEA').AsString='AC' then Cells[CO_COL5, nRow]:='ACTIVO';
               if FieldByName('SIT_LINEA').AsString='CA' then Cells[CO_COL5, nRow]:='CANCELADO';

               Cells[CO_COL6, nRow] := FieldByName('MONEDA').AsString;

               Inc(nRow);
               Next;
           End;

      If (nRow = 0) Then strgrdCont.RowCount := 1
      else  strgrdCont.RowCount := nRow;

      If Assigned(vlQry) Then vlQry.Free;
   {end
   else
     ClearGrid(strgrdCont,0);}
end;

procedure TWCrEmisorProv.Llena_Chequera;
var vlstrSQL, vlstrSQL2 : String;
    vlQry, vlQry2 : TQuery;
    nRow : Integer;
    vlBLOQUEADA, vlSIT_CONTRATO : string;
begin
   {if Trim(edNOM_PROVEEDOR.Text)<>'' then
   begin}
      ClearGrid(strgrdCheq,0);
      vlstrSQL:=' SELECT '+coCRLF+
    	        ' CCC.CUENTA_BANCO AS CHEQUERA, '+coCRLF+
	        ' (SELECT NOMBRE FROM PERSONA WHERE ID_PERSONA IN ('+edID_PROVEEDOR.Text+') ) AS NOMBRE, '+coCRLF+
                '( CASE '+coCRLF+
                '  WHEN CCC.SIT_CHEQUERA = ''AC'' then ''ACTIVA'' '+coCRLF+
                '  WHEN CCC.SIT_CHEQUERA = ''CA'' then ''CANCELADA'' '+coCRLF+
                '  ELSE ''NA'' '+coCRLF+
                '  END) SIT_CHEQUERA, '+coCRLF+
                '( CASE '+coCRLF+
                '  WHEN CCC.CVE_TIPO_CHEQ = ''AD'' then ''ADMINISTRATIVA'' '+coCRLF+
                '  WHEN CCC.CVE_TIPO_CHEQ = ''LQ'' then ''LIQUIDACION'' '+coCRLF+
                '  ELSE ''NA'' '+coCRLF+
                '  END) TIPO_CHEQUERA, '+coCRLF+
                '( CASE '+coCRLF+
                '  WHEN CR1.SIT_CONTRATO = ''AC'' then ''ACTIVO'' '+coCRLF+
                '  WHEN CR1.SIT_CONTRATO = ''CA'' then ''CANCELADO'' '+coCRLF+
                '  WHEN CR1.SIT_CONTRATO = ''IN'' then ''INACTIVO'' '+coCRLF+
                '  WHEN CR1.SIT_CONTRATO = ''BL'' then ''BLOQUEADO'' '+coCRLF+
                '  ELSE ''NA'' '+coCRLF+
                '  END) SIT_CONTRATO '+coCRLF+
                '  FROM CR_CRED_CHEQ CCC, '+coCRLF+
                '      (SELECT ID_TITULAR, ID_CONTRATO, SIT_CONTRATO '+coCRLF+
                '         FROM CONTRATO '+coCRLF+
                '        WHERE ID_TITULAR IN ('+edID_PROVEEDOR.Text+')'+coCRLF+
                '          AND CVE_TIP_CONTRATO=''CDVI'' '+coCRLF+
//                '          AND SIT_CONTRATO=''AC'' '+coCRLF+
                '      ) CR1 '+coCRLF+
                ' WHERE CCC.ID_ACREDITADO IN ('+edID_PROVEEDOR.Text+')'+coCRLF+
//                '   AND CCC.CVE_TIPO_CHEQ = ''AD'' '+coCRLF+
                '   AND CCC.CUENTA_BANCO = CR1.ID_CONTRATO '+coCRLF+
                '   AND CCC.CVE_TIP_OPE_CHQ IN (''CR'',''AM'') ';

      vlstrSQL:=vlstrSQL + ' UNION '+coCRLF;

      vlstrSQL:=vlstrSQL +
                ' SELECT '+coCRLF+
    	        ' CCC.CUENTA_BANCO AS CHEQUERA, '+coCRLF+
	        ' (SELECT NOMBRE FROM PERSONA WHERE ID_PERSONA IN ('+edID_PROVEEDOR.Text+') ) AS NOMBRE, '+coCRLF+
                '( CASE '+coCRLF+
                '  WHEN CCC.SIT_CHEQUERA = ''AC'' then ''ACTIVA'' '+coCRLF+
                '  WHEN CCC.SIT_CHEQUERA = ''CA'' then ''CANCELADA'' '+coCRLF+
                '  ELSE ''NA'' '+coCRLF+
                '  END) SIT_CHEQUERA, '+coCRLF+
                '( CASE '+coCRLF+
                '  WHEN CCC.CVE_TIPO_CHEQ = ''AD'' then ''ADMINISTRATIVA'' '+coCRLF+
                '  WHEN CCC.CVE_TIPO_CHEQ = ''LQ'' then ''LIQUIDACION'' '+coCRLF+
                '  ELSE ''NA'' '+coCRLF+
                '  END) TIPO_CHEQUERA, '+coCRLF+
                '( CASE '+coCRLF+
                '  WHEN CR1.SIT_CONTRATO = ''AC'' then ''ACTIVO'' '+coCRLF+
                '  WHEN CR1.SIT_CONTRATO = ''CA'' then ''CANCELADO'' '+coCRLF+
                '  WHEN CR1.SIT_CONTRATO = ''IN'' then ''INACTIVO'' '+coCRLF+
                '  WHEN CR1.SIT_CONTRATO = ''BL'' then ''BLOQUEADO'' '+coCRLF+
                '  ELSE ''NA'' '+coCRLF+
                '  END) SIT_CONTRATO '+coCRLF+
                '  FROM CR_CRED_CHEQ CCC, '+coCRLF+
                '      (SELECT ID_TITULAR, ID_CONTRATO, SIT_CONTRATO '+coCRLF+
                '         FROM CONTRATO '+coCRLF+
                '        WHERE ID_TITULAR IN ('+edID_PROVEEDOR.Text+')'+coCRLF+
                '          AND CVE_TIP_CONTRATO=''CDVI'' '+coCRLF+
//                '          AND SIT_CONTRATO=''AC'' '+coCRLF+
                '      ) CR1 '+coCRLF+
                ' WHERE CCC.ID_ACREDITADO IN ('+edID_PROVEEDOR.Text+')'+coCRLF+
//                '   AND CCC.CVE_TIPO_CHEQ = ''AD'' '+coCRLF+
                '   AND CCC.CUENTA_BANCO <> CR1.ID_CONTRATO '+coCRLF+
                '   AND CCC.CVE_TIP_OPE_CHQ IN (''CR'',''AM'') ';

      vlQry := GetSQLQuery(vlstrSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
      ClearGrid(strgrdCheq,0);

      With strgrdCheq Do
      Begin
         RowHeights[0] := DefaultRowHeight;
         RowCount := 1;
         ColCount := 6;
         RowCount := 9999;

         ColWidths[CO_COL1] := 120;
         ColWidths[CO_COL2] := 250;
         ColWidths[CO_COL3] := 110;
         ColWidths[CO_COL4] := 70;
         ColWidths[CO_COL5] := 70;
         ColWidths[CO_COL6] := 70;         
      End;

      nRow := 0;
      IniciaError(strgrdCheq);

      If Assigned(vlQry) Then
         With strgrdCheq, vlQry Do
            While Not vlQry.Eof Do
            Begin
               vlBLOQUEADA:=' ';
               vlSIT_CONTRATO:=' ';

               IF FieldByName('TIPO_CHEQUERA').AsString='ADMINISTRATIVA' then
               begin
                  vlBLOQUEADA:='NO';
                  if Revisa_Bloqueo(FieldByName('CHEQUERA').AsString)='V' then
                     vlBLOQUEADA:='SI';

                  vlSIT_CONTRATO:= vlQry.FieldByName('SIT_CONTRATO').AsString;
               end;

               Cells[CO_COL1, nRow] := FieldByName('CHEQUERA').AsString;
               Cells[CO_COL2, nRow] := FieldByName('NOMBRE').AsString;
               Cells[CO_COL3, nRow] := FieldByName('TIPO_CHEQUERA').AsString;
               Cells[CO_COL4, nRow] := vlBLOQUEADA;
               Cells[CO_COL5, nRow] := FieldByName('SIT_CHEQUERA').AsString;
               Cells[CO_COL6, nRow] := vlSIT_CONTRATO;

               Inc(nRow);
               Next;
           End;

      If (nRow = 0) Then strgrdCheq.RowCount := 1
      else  strgrdCheq.RowCount := nRow;

      If Assigned(vlQry) Then vlQry.Free;
   {end
   else
    ClearGrid(strgrdCheq,0);}
end;


procedure TWCrEmisorProv.IniciaError(var StrGrd : TStringGrid);
begin
 If Assigned(StrGrd) Then
  Begin
  StrGrd.Cells[CO_COL1, 0] := CO_ERROR;
  StrGrd.Cells[CO_COL2, 0] := CERROR_NOEXISTEN;
  End;
end;

procedure TWCrEmisorProv.FormShow(Sender: TObject);
begin
      // Pinta datos del panel
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_FND_ENT_DES.Control:=edCVE_FND_ENT_DES;
      Objeto.ID_EMISOR.Control:=edID_EMISOR;
      Objeto.ID_PROVEEDOR.Control:=edID_PROVEEDOR;
      Objeto.ID_PROMOTOR.Control:=edID_PROMOTOR;


      Objeto.SIT_EMISOR_PROV.Control:=rgSIT_EMISOR_PROV;
      Objeto.F_ALTA.Control := edF_ALTA;
      Objeto.CVE_USU_ALTA.Control := edCVE_USU_ALTA;
      Objeto.F_MODIFICA.Control := edF_MODIFICA;
      Objeto.CVE_USU_MODIFICA.Control := edCVE_USU_MODIFICA;
      Objeto.RIESGO_MAXIMO.Control := edRIESGO_MAXIMO;
      Objeto.IMP_RIESGO_ACUM.Control := edRIESGO_ACUMULADO;
      Objeto.SOBRETASA.Control := edSOBRETASA;

      Objeto.Emisor.CVE_FND_ENT_DES.Control := edCVE_FND_ENT_DES;
      Objeto.Emisor.Acreditado.Persona.Nombre.Control := edNOM_EMISOR;
      Objeto.Emisor.GetParams(Objeto);

      Objeto.Proveedor.CVE_FND_ENT_DES.Control := edCVE_FND_ENT_DES;
      Objeto.Proveedor.Persona.Nombre.Control := edNOM_PROVEEDOR;
      Objeto.Proveedor.ID_PROV_EXTERNO.Control := edID_PROV_EXTERNO;
      Objeto.Proveedor.GetParams(Objeto);

      Objeto.Promotor.Persona.Nombre.Control :=edNOM_PROMOTOR;

      Objeto.Promotor.GetParams(Objeto);

      Objeto.MInstDesc.CVE_FND_ENT_DES.Control:=edCVE_FND_ENT_DES;
      Objeto.MInstDesc.DESC_ENT_DES.Control:=edDESC_ENT_DES;
      Objeto.MInstDesc.GetParams(Objeto);

      Interforma1.MsgPanel := MsgPanel;
end;

procedure TWCrEmisorProv.FormDestroy(Sender: TObject);
begin Objeto.CVE_FND_ENT_DES.Control:=nil;
      Objeto.ID_EMISOR.Control:=nil;
      Objeto.ID_PROVEEDOR.Control:=nil;
      Objeto.ID_PROMOTOR.Control:=nil;
      Objeto.SIT_EMISOR_PROV.Control:=nil;
      Objeto.F_ALTA.Control := nil;
      Objeto.CVE_USU_ALTA.Control := nil;
      Objeto.F_MODIFICA.Control := nil;
      Objeto.CVE_USU_MODIFICA.Control := nil;
      Objeto.RIESGO_MAXIMO.Control := nil;
      Objeto.IMP_RIESGO_ACUM.Control := nil;
      Objeto.SOBRETASA.Control := nil;

      Objeto.Emisor.CVE_FND_ENT_DES.Control := nil;
      Objeto.Emisor.Acreditado.Persona.Nombre.Control := nil;
      Objeto.Proveedor.CVE_FND_ENT_DES.Control := nil;
      Objeto.Proveedor.Persona.Nombre.Control := nil;
      Objeto.Proveedor.ID_PROV_EXTERNO.Control := nil;
      Objeto.Promotor.Persona.Nombre.Control :=nil;
      Objeto.MInstDesc.CVE_FND_ENT_DES.Control:=nil;
      Objeto.MInstDesc.DESC_ENT_DES.Control:=nil;
end;

procedure TWCrEmisorProv.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrEmisorProv.InterForma1DespuesNuevo(Sender: TObject);
begin
   With Objeto Do Begin
      If (m_nPRE_ID_EMISOR <> 0) And (m_nPRE_ID_PROVEEDOR <> 0) And (Trim(m_strCVE_EMISOR_EXT) <> '')
          And(Trim(m_sCVE_FND_ENT_DES) <> '') Then Begin
         CVE_FND_ENT_DES.AsString:= m_sCVE_FND_ENT_DES;
         ID_EMISOR.AsInteger := m_nPRE_ID_EMISOR;
         Emisor.FindKey([CVE_FND_ENT_DES.AsString,ID_EMISOR.AsInteger, m_strCVE_EMISOR_EXT]);
         ID_PROVEEDOR.AsInteger := m_nPRE_ID_PROVEEDOR;
         Proveedor.FindKey([CVE_FND_ENT_DES.AsString,ID_PROVEEDOR.AsInteger]);
      End;
   End;

   Objeto.SIT_EMISOR_PROV.AsString := 'AC';
   Objeto.F_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresa;
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   MuestraHints;
   edCVE_FND_ENT_DES.SetFocus;
end;

procedure TWCrEmisorProv.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.F_MODIFICA.AsDateTime := Objeto.Apli.DameFechaEmpresa;
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
   edID_PROMOTOR.SetFocus;
end;

procedure TWCrEmisorProv.btEMISORClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCREMIPRO_EMISOR',True,True) then
   begin
     Objeto.CVE_FND_ENT_DES.GetFromControl;
     If Objeto.CVE_FND_ENT_DES.AsString <> '' Then Begin
        Objeto.Emisor.BuscaWhereString := ' CR_EMISOR.CVE_FND_ENT_DES = ' + #39 + Objeto.CVE_FND_ENT_DES.AsString + #39;
        Objeto.Emisor.FilterString := Objeto.Emisor.BuscaWhereString;
     End;

     Objeto.Emisor.ShowAll := True;
     If Objeto.Emisor.Busca Then Begin
        InterForma1.NextTab(edID_EMISOR);
     End;
   end;     
end;

procedure TWCrEmisorProv.ilEMISORCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrEmisorProv.ilEMISOREjecuta(Sender: TObject);
begin
   Objeto.CVE_FND_ENT_DES.GetFromControl;
   If Objeto.CVE_FND_ENT_DES.AsString <> '' Then Begin
      Objeto.Emisor.BuscaWhereString := ' CR_EMISOR.CVE_FND_ENT_DES = ' + #39 + Objeto.CVE_FND_ENT_DES.AsString + #39;
      Objeto.Emisor.FilterString := Objeto.Emisor.BuscaWhereString;
   End;

   If Objeto.Emisor.FindKeyNear([Objeto.CVE_FND_ENT_DES.AsString, ilEMISOR.Buffer],['CVE_FND_ENT_DES','ID_ACREDITADO']) Then Begin
      InterForma1.NextTab(edID_EMISOR);
   End;
end;

procedure TWCrEmisorProv.btPROVEEDORClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCREMIPRO_PROV',True,True) then
   begin
     Objeto.CVE_FND_ENT_DES.GetFromControl;
     If Objeto.CVE_FND_ENT_DES.AsString <> '' Then Begin
        Objeto.Proveedor.BuscaWhereString := ' SIT_PROVEEDOR = ''AC'' AND CR_PROVEEDOR.CVE_FND_ENT_DES = ' + #39 + Objeto.CVE_FND_ENT_DES.AsString + #39;
        Objeto.Proveedor.FilterString := Objeto.Proveedor.BuscaWhereString;
     End;

     Objeto.Proveedor.ShowAll := True;
     If Objeto.Proveedor.Busca Then
        InterForma1.NextTab(edID_PROVEEDOR);
   end;        
end;

procedure TWCrEmisorProv.ilPROVEEDORCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrEmisorProv.ilPROVEEDOREjecuta(Sender: TObject);
begin
   Objeto.CVE_FND_ENT_DES.GetFromControl;
   If Objeto.CVE_FND_ENT_DES.AsString <> '' Then Begin
      Objeto.Proveedor.BuscaWhereString := ' SIT_PROVEEDOR = ''AC'' AND CR_PROVEEDOR.CVE_FND_ENT_DES = ' + #39 + Objeto.CVE_FND_ENT_DES.AsString + #39;
      Objeto.Proveedor.FilterString := Objeto.Proveedor.BuscaWhereString;
   End;

   If Objeto.Proveedor.FindKey([Objeto.CVE_FND_ENT_DES.AsString, ilPROVEEDOR.Buffer]) Then
      InterForma1.NextTab(edID_PROVEEDOR);
end;

procedure TWCrEmisorProv.btPROMOTORClick(Sender: TObject);
{begin                                                 JFOF 28/06/2011
   Objeto.Promotor.ShowAll := True;
   if Objeto.Promotor.Busca then
      InterForma1.NextTab(edID_PROMOTOR);
end;}
Var T : TInterFindit;
begin
   if Objeto.ValidaAccesoEsp('TCREMIPRO_PRMADM',True,True) then
   begin
      With Objeto Do
      Begin
        T := CreaBuscador('CRGPROMADM.IT','I');
        T.WhereString := ' GPO.SIT_GPO_CONTRATO = ''AC''' ;
        Try
          If T.Execute Then
             Begin
               Objeto.ID_PROMOTOR.AsString := T.DameCampo(0);
               Objeto.Promotor.Persona.Nombre.AsString := T.DameCampo(1);
               InterForma1.NextTab(btPROMOTOR);
             End;
        Finally
          T.Free;
        End;
      End;
   end;      
end;

//JFOF 28/06/2011

procedure TWCrEmisorProv.ilPROMOTORCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrEmisorProv.ilPROMOTOREjecuta(Sender: TObject);
begin
   if Objeto.Promotor.FindKey([Objeto.CVE_FND_ENT_DES.AsString,ilPROMOTOR.Buffer]) then
      InterForma1.NextTab(edID_PROMOTOR);
end;

procedure TWCrEmisorProv.btEMISORExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMesg    :  String;
Begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      VLMesg     := '';
      VLSalida   := True;
      Objeto.ID_EMISOR.GetFromControl;
      If Objeto.ID_EMISOR.AsString = '' Then Begin
         VLSalida  := False;
         VLMesg    := 'Favor de Indicar al Emisor';
      End Else If Objeto.Emisor.SIT_EMISOR.AsString <> 'AC' Then Begin
         VLSalida  := False;
         VLMesg    := 'Emisor no Activo';
      End;
      InterForma1.ValidaExit(edID_EMISOR,VLSalida,VLMesg,True);
   end;
end;

procedure TWCrEmisorProv.edID_PROVEEDORExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMesg    :  String;
Begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      VLMesg   := '';
      VLSalida := True;
      Objeto.ID_PROVEEDOR.GetFromControl;
      If Objeto.ID_PROVEEDOR.AsString = '' Then Begin
         VLSalida  := False;
         VLMesg    := 'Favor de Indicar al Proveedor';
      End Else If Objeto.Proveedor.SIT_PROVEEDOR.AsString <> 'AC' Then Begin
         VLSalida  := False;
         VLMesg     := 'Proveedor no Activo';
      End;
      InterForma1.ValidaExit(edID_PROVEEDOR,VLSalida,VLMesg,True);
   End;
end;

procedure TWCrEmisorProv.edID_PROMOTORExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMesg, vlSql, vlSql2 : String;
     vlSitEmp, vlSitGpo   : String;

Begin
     vlSql := ' SELECT emp.id_persona, emp.sit_empleado '+
              '   FROM empleado emp '+
              '  WHERE emp.id_persona = ' + Objeto.ID_PROMOTOR.AsString +
              ' ORDER BY emp.id_persona ';
      GetSqlStr(vlSqL,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'sit_empleado',vlSitEmp,False);

     vlSql2 :=  ' SELECT gpo.id_pers_asociad, gpo.sit_gpo_contrato '+
                '   FROM gpo_contrato gpo '+
                '  WHERE gpo.id_pers_asociad = ' + Objeto.ID_PROMOTOR.AsString +
                '    AND gpo.sit_gpo_contrato = ''AC'''+
               ' ORDER BY id_pers_asociad ';
      GetSqlStr(vlSqL2,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'sit_gpo_contrato',vlSitGpo,False);

   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      VLMesg     := '';
      VLSalida   := True;
      Objeto.ID_PROMOTOR.GetFromControl;
     If Objeto.ID_PROMOTOR.AsString = '' Then Begin
         VLSalida  := False;
         VLMesg    := 'Favor de Indicar al Promotor responsable'
         end
    else if vlSitEmp <> 'AC' Then Begin
//    Objeto.Promotor.Persona.Nombre.AsString
         VLSalida  := False;
         VLMesg    := 'Promotor Inactivo'
         end
    else if vlSitGpo = '' then begin
         VLSalida  := False;
         VLMesg    := 'No Existe Dupla para el Promotor'
         End;
      InterForma1.ValidaExit(edID_PROMOTOR,VLSalida,VLMesg,True);
   End;
end;

procedure TWCrEmisorProv.rgSIT_EMISOR_PROVExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_EMISOR_PROV,True,'',True);
end;

Procedure TWCrEmisorProv.MuestraHints;
Begin
   edNOM_EMISOR.Hint := Objeto.Emisor.Acreditado.Persona.Nombre.AsString;
   edNOM_EMISOR.ShowHint := True;
   edNOM_PROVEEDOR.Hint := Objeto.Proveedor.Persona.Nombre.AsString;
   edNOM_PROVEEDOR.ShowHint := True;
   edNOM_PROMOTOR.Hint := Objeto.Promotor.Persona.Nombre.AsString;
   edNOM_PROMOTOR.ShowHint := True;
End;

procedure TWCrEmisorProv.InterForma1Buscar(Sender: TObject);
Var vlMensaje : String;
begin
   edID_PROV_EXTERNO.Text:='';
   edNOM_PROVEEDOR.Text:='';
   If Objeto.Busca Then Begin
      Objeto.Emisor.Active := True;
      Objeto.ObtenRiesgoAcumulado;
      Objeto.Emisor.FindKeyNear([Objeto.CVE_FND_ENT_DES.AsString,Objeto.ID_EMISOR.AsString],
                              ['CVE_FND_ENT_DES','ID_ACREDITADO']);
      MuestraHints;

      //EASA  REQ. 20007 - 07 / 018   CARTERA IMPAGADA
        InterForma1.MsgPanel.Caption := '';
        InterForma1.MsgPanel.Color := clBtnFace;
        InterForma1.MsgPanel.Font.Color := clWhite;
      if not ( FindDispIMPProv(Objeto.ID_PROVEEDOR.AsInteger,Objeto.Apli, vlMensaje)) then
      Begin
         InterForma1.MsgPanel.Caption := vlMensaje;
         InterForma1.MsgPanel.Color := clRed;
         InterForma1.MsgPanel.Font.Color := clWhite;
         if MessageDlg(vlMensaje + ', desea ver el detalle?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
         Begin
            Objeto.DetImpagado := TCrCartrIm.Create(self);
            Try
              Objeto.DetImpagado.Apli:= Objeto.Apli;
              Objeto.DetImpagado.ID_ACREDITADO.AsString := Objeto.ID_PROVEEDOR.ASstring;
              Objeto.DetImpagado.NOM_ACREDITADO.AsString := Objeto.Proveedor.persona.nombre.asstring;
              Objeto.DetImpagado.TIPO_CLIENTE.AsString := 'PR';
              Objeto.DetImpagado.ParamCre:=Objeto.ParamCre;
              Objeto.DetImpagado.Catalogo;
            finally
              Objeto.DetImpagado.Free;
            end;
         end;
      end;
      Llena_Chequera;
      Llena_Linea;      
        //END EASA
   End;
end;

procedure TWCrEmisorProv.InterForma1DespuesAceptar(Sender: TObject);
begin
   MuestraHints;
end;

procedure TWCrEmisorProv.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   If IsNewData Then Begin
      If MessageDlg('¿Desea almacenar los datos capturados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes Then Begin
           Realizado := True;
      End Else Realizado := False;
   End Else Begin
      If MessageDlg('¿Desea guardar los datos modificados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes Then Begin
         Realizado := True;
      End Else
         Realizado := False;
   End;
end;

procedure TWCrEmisorProv.edRIESGO_MAXIMOExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMesg     :  String;
Begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      vlMesg     := '';
      vlSalida := True;
      Objeto.RIESGO_MAXIMO.GetFromControl;
      if Objeto.RIESGO_MAXIMO.AsFloat < 0 then
      Begin
         vlSalida  := False;
         vlMesg     := 'El Riesgo máximo no puede ser negativo';
      end;
      InterForma1.ValidaExit(edRIESGO_MAXIMO,vlSalida,vlMesg,True);
   end;
end;

procedure TWCrEmisorProv.BitBtn4Click(Sender: TObject);
var  GpoProv: TCrGruPro;
begin
   if Objeto.ValidaAccesoEsp('TCREMIPRO_AGRUPA',True,True) then
   begin
     if Objeto.Active then
     begin
        GpoProv := TCrGruPro.Create(self);
        try
           GpoProv.Apli:=Objeto.Apli;
           GpoProv.EmisGpoPrv.CVE_FND_ENT_DES.AsString := Objeto.CVE_FND_ENT_DES.AsString;
           GpoProv.EmisGpoPrv.ID_EMISOR.AsString := Objeto.ID_EMISOR.AsString;
           GpoProv.Proveedor.CVE_FND_ENT_DES.AsString := Objeto.CVE_FND_ENT_DES.AsString;
           GpoProv.Proveedor.ID_ACREDITADO.AsString := Objeto.ID_PROVEEDOR.AsString;
           GpoProv.CVE_FND_ENT_DES.AsString:= Objeto.CVE_FND_ENT_DES.AsString;
           GpoProv.ID_PROVEEDOR.AsString := Objeto.ID_PROVEEDOR.AsString;
           GpoProv.ParamCre:=Objeto.ParamCre;
           GpoProv.Catalogo;
        finally
               Objeto.FindKey([GpoProv.EmisGpoPrv.CVE_FND_ENT_DES.AsString,GpoProv.EmisGpoPrv.ID_EMISOR.AsString,GpoProv.ID_PROVEEDOR.AsString]);
               GpoProv.Free;
               Objeto.Emisor.FindKeyNear([Objeto.CVE_FND_ENT_DES.AsString, Objeto.ID_EMISOR.AsString],
                                         ['CVE_FND_ENT_DES','ID_ACREDITADO']);
        end;
     end
     else
        ShowMessage('Debe de seleccionar una relación.');
     //end if;
   end;     
end;

procedure TWCrEmisorProv.InterForma1DespuesShow(Sender: TObject);
begin
   Objeto.ObtenRiesgoAcumulado;
   Objeto.Emisor.FindKeyNear([Objeto.CVE_FND_ENT_DES.AsString,Objeto.ID_EMISOR.AsString],
                             ['CVE_FND_ENT_DES','ID_ACREDITADO']);
end;

procedure TWCrEmisorProv.edCVE_FND_ENT_DESExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMesg     :  String;
Begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then begin
      VLMesg     := '';
      VLSalida := True;
      Objeto.CVE_FND_ENT_DES.GetFromControl;
      If Objeto.CVE_FND_ENT_DES.AsString = '' Then Begin
         VLSalida  := False;
         VLMesg    := 'Favor de Indicar la Entidad Descontadora';
      End;
      InterForma1.ValidaExit(edCVE_FND_ENT_DES,VLSalida,VLMesg,True);
   end;
end;

procedure TWCrEmisorProv.btnCVE_FND_ENT_DESClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCREMIPRO_ENTDES',True,True) then
   begin
     Objeto.MInstDesc.ShowAll := True;
     If Objeto.MInstDesc.Busca Then Begin
        InterForma1.NextTab(edCVE_FND_ENT_DES);
     End;
   end;
end;

procedure TWCrEmisorProv.ilCVE_FND_ENT_DESCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrEmisorProv.ilCVE_FND_ENT_DESEjecuta(Sender: TObject);
begin
   If Objeto.MInstDesc.FindKey([ilCVE_FND_ENT_DES.Buffer]) Then Begin
      InterForma1.NextTab(edCVE_FND_ENT_DES);
   End;
end;

procedure TWCrEmisorProv.edSOBRETASAExit(Sender: TObject);
Var     VLSalida        : Boolean;
        VLMsg           : String;
begin
   VLSalida := True;
   VLMsg    := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      //Verifica que el dato no sea negativo
      Objeto.SOBRETASA.GetFromControl;
      if Objeto.SOBRETASA.AsFloat < 0 then
      Begin
         VLSalida := False;
         VLMsg    := 'La sobretasa no puede ser negativa';
      end;
      InterForma1.ValidaExit(edSOBRETASA,VLSalida,VLMsg,True);
   end;
end;

procedure TWCrEmisorProv.strgrdCheqDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var str : String;
begin
 If (Sender Is TStringGrid) Then
  With (Sender As TStringGrid) Do
   Begin
      If (gdSelected In State) Then Canvas.Brush.Color := clWhite;   
      Canvas.Font.Color := clBlack;

      str := Cells[CO_COL4,ARow];
      If (str = 'SI') Then
      begin
         Canvas.Font.Style := [fsBold];
         Canvas.Font.Color := clRed;
      end;

      str := Cells[CO_COL5,ARow];
      If (str = 'CANCELADA') Then
      begin
         Canvas.Font.Style := [fsBold];
         Canvas.Font.Color := clRed;
      end;

      str := Cells[CO_COL6,ARow];
      If (str <> ' ') Then
      begin
         If (str <> 'ACTIVO') Then
         begin
            Canvas.Font.Style := [fsBold];
            Canvas.Font.Color := clRed;
         end;
      end;   
      Canvas.TextRect(Rect,Rect.Left,Rect.Top,Cells[ACol, ARow])
  End;
end;

procedure TWCrEmisorProv.strgrdContDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var str : String;
begin
 If (Sender Is TStringGrid) Then
  With (Sender As TStringGrid) Do
   Begin
      If (gdSelected In State) Then Canvas.Brush.Color := clWhite;

      Canvas.Font.Color := clBlack;

      str := Cells[CO_COL5,ARow];
      If (str = 'NO AUTORIZADO')OR(str = 'CANCELADO') Then
      begin
         Canvas.Font.Color := clRed;
         Canvas.Font.Style := [fsBold];
      end;
      Canvas.TextRect(Rect,Rect.Left,Rect.Top,Cells[ACol, ARow])
  End;

end;

end.
