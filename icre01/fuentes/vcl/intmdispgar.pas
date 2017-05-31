// Sistema         : Clase de Garantía por Disposición
// Fecha de Inicio : 14/07/2004
// Función forma   : Clase de Garantía por Disposición
// Desarrollo por  :
// Diseñado por    :
// Comentarios     :
Unit IntMDispGar;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,InterEdit,
Grids, DBGrids, Menus, IntParamCre, IntLinkit,IntSGCtrl, IntCrCredito,
IntCrAcredit,

IntGenCre;

Type
 TMDispGar= class;

  TwMDispGar=Class(TForm)
    InterForma1             : TInterForma;
    sgcDATA: TSGCtrl;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    shp4: TShape;
    Shape1: TShape;
    Shape5: TShape;
    Label1: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Shape6: TShape;
    Label9: TLabel;
    Label5: TLabel;
    edID_ACREDITADO: TEdit;
    edNOM_ACREDITADO: TEdit;
    BitBtn1: TBitBtn;
    Shape2: TShape;
    Shape3: TShape;
    Label2: TLabel;
    Label4: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Shape4: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Label6: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Shape9: TShape;
    Label11: TLabel;
    sgcDATA_Dis: TSGCtrl;
    Shape11: TShape;
    Label13: TLabel;
    Label14: TLabel;
    edID_CREDITO: TInterEdit;
    Label15: TLabel;
    edID_CONTRATO: TInterEdit;
    Label16: TLabel;
    edIMP_DISPOSICION: TInterEdit;
    Label17: TLabel;
    edGARAN_DISP: TInterEdit;
    Label18: TLabel;
    edIMP_DISPUESTO: TInterEdit;
    Label19: TLabel;
    edGARAN_SDO: TInterEdit;
    Label20: TLabel;
    edSDO_INSOLUTO: TInterEdit;
    Label21: TLabel;
    edSOB_FQT: TInterEdit;
    edDESC_PRODUCTO: TInterEdit;
    edCVE_PRODUCTO_CRE: TInterEdit;
    rgSITUACION: TRadioGroup;
    Shape12: TShape;
    Shape13: TShape;
    Label22: TLabel;
    Label23: TLabel;
    edImporte: TInterEdit;
    Label24: TLabel;
    Shape14: TShape;
    Shape15: TShape;
    Label25: TLabel;
    Label26: TLabel;
    rgGarantias: TRadioGroup;
    Shape10: TShape;
    Shape16: TShape;
    Label12: TLabel;
    Label27: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure sgcDATADblClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure rgSITUACIONClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure sgcDATAMoveRow(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure rgGarantiasClick(Sender: TObject);

    private
    { Private declarations }
       Function  CadenaSql : String;
       Procedure MuestraDatos;
       Function  CadenaSql_Dis: String;
       Procedure MuestraDatos_Dis;
       Procedure Calcula;
    public
    { Public declarations }
    Objeto : TMDispGar;

end;
 TMDispGar= class(TInterFrame)
      private
      public
        { Public declarations }

        ID_CREDITO     : TInterCampo;
        ID_ACREDITADO  : TInterCampo;
        ParamCre       : TParamCre;
        CrCredito      : TCrCredito;
        Acreditado     : TCrAcredit;

        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;

implementation
Uses IntMRegistro;
{$R *.DFM}

constructor TMDispGar.Create( AOwner : TComponent );
begin Inherited;
   ID_CREDITO :=CreaCampo('ID_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
      ID_CREDITO.Caption:='Folio de garantía';
   ID_ACREDITADO :=CreaCampo('ID_ACREDITADO',ftFloat,tsNinguno,tsNinguno,True);
      ID_ACREDITADO.Caption:='Folio de acreditado';

   CrCredito := TCrCredito.Create(Self);
   CrCredito.MasterSource:=Self;
   CrCredito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

   Acreditado := TCrAcredit.Create(Self);
   Acreditado.MasterSource := Self;
   Acreditado.FieldByName('ID_ACREDITADO').MasterField := 'ID_ACREDITADO';

   TableName := '';
   UseQuery := True;
   HelpFile := 'IntMDispGar.Hlp';
   ShowMenuReporte:=True;

end;

Destructor TMDispGar.Destroy;
Begin
   inherited;
End;

function TMDispGar.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TwMDispGar;
begin
   W:=TwMDispGar.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftImprimir;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

Function TwMDispGar.CadenaSql : String;
var
   vlsql : String;
Begin
   vlSql:='';
   If Objeto.CrCredito.ContratoCre.Contrato.ID_Titular.AsInteger <> 0 Then Begin
      vlsql := ' SELECT ID_SOLICITUD,'+coCRLF+
               '        DESC_GARANTIA,'+coCRLF+
               '        DESC_TIPO_GAR AS CLASIFICACION,'+coCRLF+
               '        NVL(DECODE(CVE_GARANTIA, CPA.CVE_GTIA_LIQ, IMPORTE_PREND/PROPORCION , VALOR_PONDERADO),0)PONDERADO_GAR, '+coCRLF+
               '        PCT_GAR_DISP, '+coCRLF+
               '        NVL(DECODE(CVE_GARANTIA, CPA.CVE_GTIA_LIQ, IMPORTE_PREND, VALOR_GARANTIA),0)VAR_GAR, '+coCRLF+
               '        NVL(DISPUESTO,0)DISPUESTO, '+coCRLF+
               '        NVL(DECODE(CVE_GARANTIA, CPA.CVE_GTIA_LIQ, NVL(((IMPORTE_PREND/PROPORCION)-DISPUESTO),0), DISPONIBLE),0)DISPONIBLE_GAR, '+coCRLF+
               '        TIPO_SEGURO,'+coCRLF+
               '        REGISTRADO,'+coCRLF+
               '        ID_ACREDITADO '+coCRLF+
               '   FROM '+coCRLF+
               ' ( SELECT CVE_GTIA_LIQ FROM CR_PARAM_AGRO ) CPA,'+coCRLF+               
               ' ( '+coCRLF+
               '    SELECT  '+coCRLF+
					'        CGR.ID_SOLICITUD, '+coCRLF+
					'        CR_GA_GARANTIA.DESC_GARANTIA, '+coCRLF+
               '        CR_GA_TIPO_GAR.CVE_TIPO_GAR, '+coCRLF+
               '        CR_GA_TIPO_GAR.DESC_TIPO_GAR , '+coCRLF+
               '        CGR.VALOR_PONDERADO, '+coCRLF+
               '        CGR.PCT_GAR_DISP PROPORCION, '+coCRLF+
               '        NVL(CGR.PCT_GAR_DISP,0)||'':1'' PCT_GAR_DISP, '+coCRLF+
               '        NVL(CGR.VALOR_GARANTIA,0)VALOR_GARANTIA, '+coCRLF+
               '        CR_GA_GARANTIA.B_REQ_VALUACION, '+coCRLF+
               '        DECODE(CR_GA_GARANTIA.B_REQ_VALUACION,''V'',(ROUND(PKGFUNPROCCORP.PRECIOMERCADO '+coCRLF+
               '              (PKGFUNPROCCORP.FREFERENCIA(''D000'',1), '+coCRLF+
               '               CR_GA_PRENDARIAS.EMISORA,CR_GA_PRENDARIAS.SERIE, '+coCRLF+
               '               CR_GA_PRENDARIAS.TIPO_VALOR)*NVL(CR_GA_PRENDARIAS.NUM_ACC_TIT,0),2) '+coCRLF+
               '              ),NVL(CR_GA_PRENDARIAS.IMP_VALUACION,0))IMPORTE_PREND, '+coCRLF+
			    '        NVL(IMPORTES.SUMA,0) DISPUESTO, '+coCRLF+
			    '        NVL(NVL(CGR.VALOR_PONDERADO,0) - NVL(IMPORTES.SUMA,0),0) DISPONIBLE, '+coCRLF+
					'        CGR.CVE_GARANTIA, '+coCRLF+
					'        CGR.ID_ACREDITADO, '+coCRLF+
					'        NVL(CR_GA_BI_INMUEB.ID_SOLICITUD,0)ID_INMUEB, '+coCRLF+
					'        NVL(CR_GA_BI_MUEB.ID_SOLICITUD,0)ID_MUEB, '+coCRLF+
					'        NVL(CR_GA_PRENDARIAS.ID_SOLICITUD,0)ID_PREND, '+coCRLF+
					'        NVL(CR_GA_PERSONALES.ID_SOLICITUD,0)ID_PERSON, '+coCRLF+
					'        NVL(CR_GA_CESION.ID_SOLICITUD,0)ID_CESION, '+coCRLF+
					'        NVL(CR_GA_PAR_APOR.ID_SOLICITUD,0)ID_APOR, '+coCRLF+
					'        NVL(CR_GA_SIN_CLAS.ID_SOLICITUD,0)ID_SINCLAS,  '+coCRLF+
               '        NVL(CR_GA_NAVE_IND.ID_SOLICITUD,0)ID_NAVE_IND, '+coCRLF+
               '        NVL(CR_GA_DOC_COB.ID_SOLICITUD,0)ID_DOC_COB, '+coCRLF+
               '        DECODE(CGR.CVE_TIPO_SEGURO,''OB'',''Obligatorio'',''OP'',''Opcional'',''EX'',''Exceptuado'',''NA'',''No Aplica'','' '')TIPO_SEGURO, '+coCRLF+
               '        DECODE(NVL(CR_GA_SEGURO.ID_FOL_SEGURO,0),0,''No'',''Si'')REGISTRADO '+coCRLF+
					'   FROM CR_GA_REGISTRO  CGR,'+coCRLF+
               '        CR_GA_BI_INMUEB,'+coCRLF+
               '        CR_GA_BI_MUEB ,'+coCRLF+
               '        CR_GA_PRENDARIAS, '+coCRLF+
					'        CR_GA_PERSONALES,'+coCRLF+
               '        CR_GA_CESION   ,'+coCRLF+
               '        CR_GA_PAR_APOR,'+coCRLF+
               '        CR_GA_SIN_CLAS, '+coCRLF+
					'        CR_GA_DOC_COB,'+coCRLF+
               '        CR_GA_NAVE_IND,'+coCRLF+
               '        CR_GA_GARANTIA,'+coCRLF+
               '        CR_GA_TIPO_GAR,'+coCRLF+
               '        CR_GA_SEGURO, '+coCRLF+
               '			   ( SELECT ID_REG_SOL_GAR, SUM(IMP_GARANTIA) SUMA '+coCRLF+
               '			     FROM CR_GA_DIS_GAR '+coCRLF+
               '          WHERE SIT_REL_DIS_GAR = ''AC'''+coCRLF+
               '          GROUP BY ID_REG_SOL_GAR'+coCRLF+
               '        ) IMPORTES'+coCRLF+
					'  WHERE CGR.ID_SOLICITUD = CR_GA_BI_INMUEB.ID_SOLICITUD(+) '+coCRLF+
					'    AND CGR.ID_SOLICITUD = CR_GA_BI_MUEB.ID_SOLICITUD(+) '+coCRLF+
					'    AND CGR.ID_SOLICITUD = CR_GA_PRENDARIAS.ID_SOLICITUD(+) '+coCRLF+
					'    AND CGR.ID_SOLICITUD = CR_GA_PERSONALES.ID_SOLICITUD(+) '+coCRLF+
					'    AND CGR.ID_SOLICITUD = CR_GA_CESION.ID_SOLICITUD(+) '+coCRLF+
					'    AND CGR.ID_SOLICITUD = CR_GA_PAR_APOR.ID_SOLICITUD(+) '+coCRLF+
					'    AND CGR.ID_SOLICITUD = CR_GA_SIN_CLAS.ID_SOLICITUD(+) '+coCRLF+
               '    AND CGR.ID_SOLICITUD = CR_GA_DOC_COB.ID_SOLICITUD(+) '+coCRLF+
               '    AND CGR.ID_SOLICITUD = CR_GA_NAVE_IND.ID_SOLICITUD(+) '+coCRLF+
					'    AND CGR.CVE_GARANTIA = CR_GA_GARANTIA.CVE_GARANTIA '+coCRLF+
               '    AND CR_GA_GARANTIA.CVE_TIPO_GAR = CR_GA_TIPO_GAR.CVE_TIPO_GAR '+coCRLF+
               '    AND CGR.SIT_REG_GARANTIA=''AC'' '+coCRLF+
               '    AND CGR.ID_SOLICITUD = IMPORTES.ID_REG_SOL_GAR(+) '+coCRLF+
					'    AND CGR.ID_ACREDITADO = '+ Objeto.CrCredito.ContratoCre.Contrato.ID_Titular.AsSQL+coCRLF+
               '    AND CR_GA_SEGURO.CVE_TIPO_SEG_ORIG(+)=''GA'''+coCRLF+
               '    AND CGR.ID_SOLICITUD = CR_GA_SEGURO.ID_REFERENCIA(+)'+coCRLF
               ;

      If rgGarantias.ItemIndex = 1 Then Begin
         vlsql := vlsql +	' AND CGR.ID_SOLICITUD IN(SELECT ID_SOLICITUD '+coCRLF+
                           ' FROM CR_GA_GAR_CTO WHERE ID_CONTRATO ='+
                           Objeto.CrCredito.ID_CONTRATO.AsSQL +') ';
      End;
      vlsql := vlsql +	' )TABLA   ORDER BY ID_SOLICITUD';
   End;
   CadenaSql := vlSql;
end;

Procedure TwMDispGar.MuestraDatos;
var
   vlQry : TQuery;
   sSQL :String;
begin
   sSQL:= CadenaSql;
   If Trim(sSQL) <> '' Then Begin
      vlQry := GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
      try
         if vlQry <> nil then Begin

            vlQry.FieldByName('ID_SOLICITUD').DisplayLabel := 'ID_SOLICITUD' + #30 +'>C';
            vlQry.FieldByName('DESC_GARANTIA').DisplayLabel := 'DESC_GARANTIA' + #30 +'>C';
            vlQry.FieldByName('CLASIFICACION').DisplayLabel := 'CLASIFICACION' + #30 +'>C';
            vlQry.FieldByName('PONDERADO_GAR').DisplayLabel := 'PONDERADO_GAR' + #30 +'>C';
            vlQry.FieldByName('PCT_GAR_DISP').DisplayLabel := 'PCT_GAR_DISP' + #30 +'>C';
            vlQry.FieldByName('VAR_GAR').DisplayLabel := 'VAR_GAR' + #30 +'>C';
            vlQry.FieldByName('DISPUESTO').DisplayLabel := 'DISPUESTO' + #30 +'>C';
            vlQry.FieldByName('DISPONIBLE_GAR').DisplayLabel := 'DISPONIBLE_GAR' + #30 +'>C';
            vlQry.FieldByName('TIPO_SEGURO').DisplayLabel := 'TIPO_SEGURO' + #30 +'>C';
            vlQry.FieldByName('REGISTRADO').DisplayLabel := 'REGISTRADO' + #30 +'>C';
            vlQry.FieldByName('ID_ACREDITADO').Visible:= False;

            vlQry.FieldByName('ID_SOLICITUD').DisplayWidth := 8;
            vlQry.FieldByName('DESC_GARANTIA').DisplayWidth := 22;
            vlQry.FieldByName('CLASIFICACION').DisplayWidth := 17;
            vlQry.FieldByName('PONDERADO_GAR').DisplayWidth := 12;
            vlQry.FieldByName('PCT_GAR_DISP').DisplayWidth := 9;
            vlQry.FieldByName('VAR_GAR').DisplayWidth := 12;
            vlQry.FieldByName('DISPUESTO').DisplayWidth := 12;
            vlQry.FieldByName('DISPONIBLE_GAR').DisplayWidth := 12;
            vlQry.FieldByName('TIPO_SEGURO').DisplayWidth := 9;
            vlQry.FieldByName('REGISTRADO').DisplayWidth := 4;

            TNumericField(vlQry.FieldByName('PONDERADO_GAR')).DisplayFormat := '###,###,###,###,###,##0.00';
            TNumericField(vlQry.FieldByName('VAR_GAR')).DisplayFormat := '###,###,###,###,###,##0.00';
            TNumericField(vlQry.FieldByName('DISPUESTO')).DisplayFormat := '###,###,###,###,###,##0.00';
            TNumericField(vlQry.FieldByName('DISPONIBLE_GAR')).DisplayFormat := '###,###,###,###,###,##0.00';
            sgcDATA.AddQry( vlQry, True,True,-1,-1,-1,False);
         End Else Begin
            sgcDATA.Clear('NO SE ENCONTRARON DATOS'#30'>C');
         end;
      finally
         if vlQry <> nil then
            vlQry.free;
      end;
   End;
end;

procedure TwMDispGar.FormShow(Sender: TObject);
begin
   InterForma1.BtnPreview.Visible := False;
   InterForma1.BtnImprimir.Visible := False;
   InterForma1.BtnAyuda.Visible := False;

   lbDempresa.Caption := Objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := Objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := Objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := Objeto.ParamCre.PERFIL.AsString;

   With Objeto Do Begin
      ID_ACREDITADO.Control     := edID_ACREDITADO;
      CrCredito.ID_CREDITO.Control := edID_CREDITO;
      CrCredito.ID_CONTRATO.Control := edID_CONTRATO;
      CrCredito.ContratoCre.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO_CRE;
      CrCredito.ContratoCre.Producto.DESC_C_PRODUCTO.Control := edDESC_PRODUCTO;
      CrCredito.IMP_CREDITO.Control := edIMP_DISPOSICION;
      CrCredito.IMP_DISPUESTO.Control := edIMP_DISPUESTO;
      CrCredito.SDO_INSOLUTO.Control := edSDO_INSOLUTO;
      CrCredito.GetParams(Objeto);

      Acreditado.ID_ACREDITADO.Control := edID_ACREDITADO;
      Acreditado.Persona.Nombre.Control := edNOM_ACREDITADO;
      Acreditado.GetParams(Objeto);

   End;
end;

procedure TwMDispGar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TwMDispGar.InterForma1Buscar(Sender : TObject);
begin
  Self.Objeto.Busca;
end;

procedure TwMDispGar.InterForma1DespuesShow(Sender: TObject);
begin
   If Objeto.CrCredito.ID_CREDITO.AsInteger <> 0 Then Begin
      Objeto.ID_CREDITO.AsInteger := Objeto.CrCredito.ID_CREDITO.AsInteger;
      Objeto.ID_ACREDITADO.AsInteger := Objeto.CrCredito.ContratoCre.Contrato.ID_Titular.AsInteger;
      Objeto.Acreditado.FindKey([Objeto.ID_ACREDITADO.AsInteger]);
      rgSITUACION.itemindex:= 0;
      edImporte.Text:= '0';
   End;
   Calcula;
   MuestraDatos;
   MuestraDatos_Dis;   
end;

procedure TwMDispGar.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      ID_ACREDITADO.Control := Nil;
      CrCredito.ID_CREDITO.Control := Nil;
      CrCredito.ID_CONTRATO.Control := Nil;
      CrCredito.ContratoCre.CVE_PRODUCTO_CRE.Control := Nil;
      CrCredito.ContratoCre.Producto.DESC_C_PRODUCTO.Control := Nil;
      CrCredito.IMP_CREDITO.Control := Nil;
      CrCredito.IMP_DISPUESTO.Control := Nil;
      CrCredito.SDO_INSOLUTO.Control := Nil;
      Acreditado.ID_ACREDITADO.Control  := Nil;
      Acreditado.Persona.Nombre.Control := Nil;
   End;
end;

procedure TwMDispGar.BitBtn1Click(Sender: TObject);
Var
   MRegistro : TMRegistro;
begin
   If Objeto.CrCredito.ContratoCre.Contrato.ID_Titular.AsInteger <> 0 Then Begin
      MRegistro := TMRegistro.Create(self);
      Try
         MRegistro.Apli :=Objeto.Apli;
         MRegistro.ParamCre:=Objeto.ParamCre;
         MRegistro.ID_ACREDITADO.AsInteger:= Objeto.ID_ACREDITADO.AsInteger;
         MRegistro.Acreditado:= Objeto.Acreditado;
         MRegistro.Nuevo;
      Finally
         MRegistro.Free;
      End;
   End;
   MuestraDatos;
end;

procedure TwMDispGar.sgcDATADblClick(Sender: TObject);
Var
   MRegistro : TMRegistro;
   Y :Integer;
begin
   Y:= sgcDATA.SG.Row;
   If sgcDATA.CellStr['ID_SOLICITUD',Y] <> '0' Then Begin
      MRegistro := TMRegistro.Create(self);
      Try
         MRegistro.Apli :=Objeto.Apli;
         MRegistro.ParamCre:=Objeto.ParamCre;
         MRegistro.FindKey([sgcDATA.CellStr['ID_SOLICITUD',Y] ,
                            sgcDATA.CellStr['ID_ACREDITADO',Y] ]);
         MRegistro.Catalogo;
      Finally
         MRegistro.Free;
      End;
   End;
   MuestraDatos;
end;


Function TwMDispGar.CadenaSql_Dis : String;
var
   vlsql : String;
Begin
   vlSql:='';
   If Objeto.CrCredito.ContratoCre.Contrato.ID_Titular.AsInteger <> 0 Then Begin
      vlsql := 'SELECT  '+
					'        CR_GA_REGISTRO.ID_SOLICITUD, '+
					'        CR_GA_GARANTIA.DESC_GARANTIA, '+
               '        DECODE(NVL(CR_GA_NAVE_IND.ID_SOLICITUD,0),0, '+
               '        DECODE(NVL(CR_GA_BI_MUEB.ID_SOLICITUD,0),0, '+
					'  		DECODE(NVL(CR_GA_PRENDARIAS.ID_SOLICITUD,0),0, '+
					'        DECODE(NVL(CR_GA_PERSONALES.ID_SOLICITUD,0),0, '+
					'        DECODE(NVL(CR_GA_CESION.ID_SOLICITUD,0),0, '+
					'        DECODE(NVL(CR_GA_PAR_APOR.ID_SOLICITUD,0),0, '+
               '        DECODE(NVL(CR_GA_SIN_CLAS.ID_SOLICITUD,0),0, '+
               '        DECODE(NVL(CR_GA_BI_INMUEB.ID_SOLICITUD,0),0, '+
               '        DECODE(NVL(CR_GA_DOC_COB.ID_SOLICITUD,0),0,'' '', '+
               '        ''DOCUMENTOS POR COBRAR''),'+
               '        ''BIEN INMUEBLE''),'+
					'        ''SIN CLASIFICACION''), '+
					'        ''PARTICIPACIONES/APORTACIONES FEDERALES''), '+
					'        ''CESION''), '+
					'        ''PERSONALES''), '+
					'        ''PENDARIAS''), '+
					'        ''BIEN MUEBLE''), '+
					'        ''NAVE/UNIDAD INDUSTRIAL'')CLASIFICACION, '+

               '       NVL(CR_GA_DIS_GAR.IMP_GARANTIA,0)IMP_GARANTIA, '+
               '       CR_GA_DIS_GAR.F_ALTA, '+
               '       CR_GA_DIS_GAR.F_MODIFICA, '+
               '       DECODE(CR_GA_DIS_GAR.SIT_REL_DIS_GAR,''AC'',''Activo'',''IN'',''Inactivo'','' '')SIT_REL_DIS_GAR, '+
               '       CR_GA_DIS_GAR.ID_REL_DIS_GAR '+

					'   FROM CR_GA_REGISTRO  , CR_GA_BI_INMUEB, CR_GA_BI_MUEB , CR_GA_PRENDARIAS, '+
					'        CR_GA_PERSONALES, CR_GA_CESION   , CR_GA_PAR_APOR, CR_GA_SIN_CLAS, '+
					'        CR_GA_GARANTIA, CR_GA_DIS_GAR, CR_GA_DOC_COB, CR_GA_NAVE_IND '+
					'  WHERE CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_BI_INMUEB.ID_SOLICITUD(+) '+
					'    AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_BI_MUEB.ID_SOLICITUD(+) '+
					'    AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_PRENDARIAS.ID_SOLICITUD(+) '+
					'    AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_PERSONALES.ID_SOLICITUD(+) '+
					'    AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_CESION.ID_SOLICITUD(+) '+
					'    AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_PAR_APOR.ID_SOLICITUD(+) '+
					'    AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_SIN_CLAS.ID_SOLICITUD(+) '+
					'    AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_DOC_COB.ID_SOLICITUD(+) '+
					'    AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_NAVE_IND.ID_SOLICITUD(+) '+
					'    AND CR_GA_REGISTRO.CVE_GARANTIA = CR_GA_GARANTIA.CVE_GARANTIA '+
               '    AND CR_GA_REGISTRO.SIT_REG_GARANTIA=''AC'' '+
               '    AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_DIS_GAR.ID_REG_SOL_GAR '+
               '    AND CR_GA_DIS_GAR.ID_DISPOSICION = '+ Objeto.CrCredito.ID_CREDITO.AsSQL +
               '    AND CR_GA_REGISTRO.ID_ACREDITADO = '+ Objeto.CrCredito.ContratoCre.Contrato.ID_Titular.AsSQL;

         If rgSITUACION.ItemIndex = 0 Then
            vlsql := vlsql + '    AND CR_GA_DIS_GAR.SIT_REL_DIS_GAR = ''AC'''
         Else If rgSITUACION.ItemIndex = 1 Then
            vlsql := vlsql + '    AND CR_GA_DIS_GAR.SIT_REL_DIS_GAR = ''IN''';

         vlsql := vlsql + '  ORDER BY CR_GA_DIS_GAR.ID_REL_DIS_GAR, CR_GA_DIS_GAR.ID_DISPOSICION ';
   End;
   CadenaSql_Dis := vlSql;
end;

Procedure TwMDispGar.MuestraDatos_Dis;
var
   vlQry : TQuery;
   sSQL :String;
begin
   sSQL:= CadenaSql_Dis;
   If Trim(sSQL) <> '' Then Begin
      vlQry := GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
      try
         if vlQry <> nil then Begin

            vlQry.FieldByName('ID_SOLICITUD').DisplayLabel := 'ID_SOLICITUD' + #30 +'>C';
            vlQry.FieldByName('DESC_GARANTIA').DisplayLabel := 'DESC_GARANTIA' + #30 +'>C';
            vlQry.FieldByName('CLASIFICACION').DisplayLabel := 'CLASIFICACION' + #30 +'>C';
            vlQry.FieldByName('IMP_GARANTIA').DisplayLabel := 'IMP_GARANTIA' + #30 +'>C';
            vlQry.FieldByName('F_ALTA').DisplayLabel := 'F_ALTA' + #30 +'>C';
            vlQry.FieldByName('F_MODIFICA').DisplayLabel := 'F_MODIFICA' + #30 +'>C';
            vlQry.FieldByName('SIT_REL_DIS_GAR').DisplayLabel := 'SIT_REL_DIS_GAR' + #30 +'>C';
            vlQry.FieldByName('ID_REL_DIS_GAR').Visible := False;

            vlQry.FieldByName('ID_SOLICITUD').DisplayWidth := 12;
            vlQry.FieldByName('DESC_GARANTIA').DisplayWidth := 23;
            vlQry.FieldByName('CLASIFICACION').DisplayWidth := 23;
            vlQry.FieldByName('IMP_GARANTIA').DisplayWidth := 24;
            vlQry.FieldByName('F_ALTA').DisplayWidth := 12;
            vlQry.FieldByName('F_MODIFICA').DisplayWidth := 12;
            vlQry.FieldByName('SIT_REL_DIS_GAR').DisplayWidth := 12;

            TNumericField(vlQry.FieldByName('IMP_GARANTIA')).DisplayFormat := '###,###,###,###,###,##0.00';
            sgcDATA_Dis.AddQry( vlQry, True,True,-1,-1,-1,False);
         End Else Begin
            sgcDATA_Dis.Clear('NO SE ENCONTRARON DATOS'#30'>C');
         end;
      finally
         if vlQry <> nil then
            vlQry.free;
      end;
   End;
end;

procedure TwMDispGar.BitBtn2Click(Sender: TObject);
Var
   STPAgregar : TStoredProc;
   dIdSolicitud, dIMPORTE, dDISPONIBLE_GAR : Double;
begin
   Try
      dIdSolicitud:= StrToFloat(sgcDATA.CellStr['ID_SOLICITUD',sgcDATA.SG.Row]);
   except
      dIdSolicitud:= 0;
   end;
   If dIdSolicitud > 0 Then Begin
      If StrToFloat(edImporte.Text)<> 0 Then Begin
         If MessageDlg('¿Esta seguro de agregar el registro con el importe '+
            FormatFloat('###,###,###,###,##0.00',StrTofloat(edImporte.Text))+'?',
            mtConfirmation,[mbYes, mbNo], 0) = mrYes Then Begin

            dIMPORTE := StrToFloat(TrimChar(edImporte.Text,','#32));
            dDISPONIBLE_GAR := StrToFloat( TrimChar( sgcDATA.CellStr['DISPONIBLE_GAR',sgcDATA.SG.Row] ,','#32 ) );

            If  (dDISPONIBLE_GAR >= dIMPORTE) Then Begin
               STPAgregar := TStoredProc.Create(Self);
               Try
                  With STPAgregar Do Begin
                     STPAgregar.DatabaseName:= Objeto.Apli.DataBaseName;
                     STPAgregar.SessionName:= Objeto.Apli.SessionName;
                     STPAgregar.StoredProcName:='PKGCRDOCUMENTACION.STP_AGREGA_DIS_GAR';

                     Params.Clear;
                     Params.CreateParam(ftFloat,'PE_ID_DISPOSICION',ptInput);
                     Params.CreateParam(ftFloat,'PE_ID_REG_SOL_GAR',ptInput);
                     Params.CreateParam(ftFloat,'PE_IMP_GARANTIA',ptInput);
                     Params.CreateParam(ftDate,'PE_F_ALTA',ptInput);
                     Params.CreateParam(ftString,'PE_CVE_USU_ALTA',ptInput);
                     Params.CreateParam(ftFloat,'PE_ID_EMPRESA',ptInput);
                     Params.CreateParam(ftFloat,'PS_RESULTADO',ptOutput);
                     Params.CreateParam(ftString,'PS_TXRESULTADO',ptOutput);

                     ParamByName('PE_ID_DISPOSICION').AsFloat := Objeto.CrCredito.ID_CREDITO.AsFloat;
                     ParamByName('PE_ID_REG_SOL_GAR').AsFloat := StrToFloat(sgcDATA.CellStr['ID_SOLICITUD',sgcDATA.SG.Row]);
                     ParamByName('PE_IMP_GARANTIA').AsFloat := dIMPORTE;
                     ParamByName('PE_F_ALTA').AsDate := Objeto.Apli.DameFechaEmpresaDia('D000');
                     ParamByName('PE_CVE_USU_ALTA').AsString := Objeto.Apli.Usuario;
                     ParamByName('PE_ID_EMPRESA').AsFloat := Objeto.Apli.IdEmpresa;
                     ExecProc;

                     If ParamByName('PS_RESULTADO').AsInteger <> 0 Then Begin
                        ShowMessage('PROBLEMAS AL AGREGAR LA GARANTÍA: ' +
                                    ParamByName('PS_RESULTADO').AsString +': '+
                                    ParamByName('PS_TXRESULTADO').AsString);
                     End;
                     UnPrepare;
                  End;
               Finally
                  STPAgregar.Free;
               End;
               MuestraDatos;
               MuestraDatos_Dis;
               Calcula;
            End Else Begin
               ShowMessage('El disponible de la garantía no cubre el importe');
            End;
         End;
      End Else Begin
         ShowMessage('Debe indicar el importe a cubrir');
      End;
   End;
end;

procedure TwMDispGar.rgSITUACIONClick(Sender: TObject);
begin
   MuestraDatos_Dis;
end;

procedure TwMDispGar.BitBtn3Click(Sender: TObject);
Var
   STPEliminar : TStoredProc;
   dIdSolicitud : Double;
begin
   Try
      dIdSolicitud:= StrToFloat(sgcDATA_Dis.CellStr['ID_SOLICITUD',sgcDATA_Dis.SG.Row]);
   except
      dIdSolicitud:= 0;
   end;
   If MessageDlg('¿Esta seguro de eliminar el registro?',
      mtConfirmation,[mbYes, mbNo], 0) = mrYes Then Begin

      If dIdSolicitud > 0 Then Begin
         STPEliminar := TStoredProc.Create(Self);
         Try
            With STPEliminar Do Begin
               STPEliminar.DatabaseName:= Objeto.Apli.DataBaseName;
               STPEliminar.SessionName:= Objeto.Apli.SessionName;
               STPEliminar.StoredProcName:='PKGCRDOCUMENTACION.STP_ELIMINA_DIS_GAR';

               Params.Clear;
               Params.CreateParam(ftFloat,'PE_ID_REL_DIS_GAR',ptInput);
               Params.CreateParam(ftFloat,'PE_ID_DISPOSICION',ptInput);
               Params.CreateParam(ftFloat,'PE_ID_REG_SOL_GAR',ptInput);
               Params.CreateParam(ftDate,'PE_F_MODIFICA',ptInput);
               Params.CreateParam(ftString,'PE_CVE_USU_MODIFICA',ptInput);
               Params.CreateParam(ftFloat,'PE_ID_EMPRESA',ptInput);
               Params.CreateParam(ftString,'PE_COMMIT',ptInput);
               Params.CreateParam(ftFloat,'PS_RESULTADO',ptOutput);
               Params.CreateParam(ftString,'PS_TXRESULTADO',ptOutput);

               ParamByName('PE_ID_REL_DIS_GAR').AsFloat := StrToFloat(sgcDATA_Dis.CellStr['ID_REL_DIS_GAR',sgcDATA_Dis.SG.Row]);
               ParamByName('PE_ID_DISPOSICION').AsFloat := Objeto.CrCredito.ID_CREDITO.AsFloat;
               ParamByName('PE_ID_REG_SOL_GAR').AsFloat := StrToFloat(sgcDATA_Dis.CellStr['ID_SOLICITUD',sgcDATA_Dis.SG.Row]);
               ParamByName('PE_F_MODIFICA').AsDate := Objeto.Apli.DameFechaEmpresaDia('D000');
               ParamByName('PE_CVE_USU_MODIFICA').AsString := Objeto.Apli.Usuario;
               ParamByName('PE_ID_EMPRESA').AsFloat := Objeto.Apli.IdEmpresa;
               ParamByName('PE_COMMIT').AsString := CVERDAD;
               ExecProc;

               If ParamByName('PS_RESULTADO').AsInteger <> 0 Then Begin
                  ShowMessage('PROBLEMAS AL ELIMINAR LA GARANTÍA: ' +
                              ParamByName('PS_RESULTADO').AsString +': '+
                              ParamByName('PS_TXRESULTADO').AsString);
               End;
               UnPrepare;
            End;
         Finally
            STPEliminar.Free;
         End;
         MuestraDatos;
         MuestraDatos_Dis;
         Calcula;
      End Else Begin
         ShowMessage('Debe seleccionar un registro');
      End;
   End;
end;

procedure TwMDispGar.sgcDATAMoveRow(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
   edImporte.Text:= '0';
end;

Procedure TwMDispGar.Calcula;
Var
   sSQL: String;
   qyQuery : TQuery ;
   dGARAN_DISP , dGARAN_SDO, dSOB_FQT: Double;
Begin
   edGARAN_DISP.Text:= '0';
   edGARAN_SDO.Text:= '0';
   edSOB_FQT.Text:= '0';

   sSQL:='SELECT ID_DISPOSICION,SUM(IMP_GARANTIA) SUMA '+
         '  FROM CR_GA_DIS_GAR '+
         ' WHERE SIT_REL_DIS_GAR =''AC'''+
         '   AND ID_DISPOSICION ='+ Objeto.CrCredito.ID_CREDITO.AsSQL +
         ' GROUP BY ID_DISPOSICION ';
   qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName,Objeto.Apli.SessionName, False);
   If qyQuery <> Nil Then Begin
      If qyQuery.FieldByName('ID_DISPOSICION').AsString = Objeto.CrCredito.ID_CREDITO.AsString Then Begin

         If StrToFloat(edIMP_DISPOSICION.Text) >0 Then
            dGARAN_DISP:= (qyQuery.FieldByName('SUMA').AsFloat *100) / StrToFloat(edIMP_DISPOSICION.Text)
         Else
            dGARAN_DISP:= 0;

         If StrToFloat(edSDO_INSOLUTO.Text) >0 Then
            dGARAN_SDO:= (qyQuery.FieldByName('SUMA').AsFloat *100) / StrToFloat(edSDO_INSOLUTO.Text)
         Else
            dGARAN_SDO:= 0;

         dSOB_FQT:= qyQuery.FieldByName('SUMA').AsFloat - StrToFloat(edSDO_INSOLUTO.Text);

         edGARAN_DISP.Text:= FloatToStr(dGARAN_DISP);
         edGARAN_SDO.Text:= FloatToStr(dGARAN_SDO);
         edSOB_FQT.Text:= FloatToStr(dSOB_FQT);
      End;
      qyQuery.Free;
   End;
End;
procedure TwMDispGar.rgGarantiasClick(Sender: TObject);
begin
   MuestraDatos;
end;

end.

