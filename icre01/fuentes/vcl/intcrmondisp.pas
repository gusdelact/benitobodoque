// Sistema         : Clase de CRMONITOR
// Fecha de Inicio : 08/06/2004
// Función forma   : Clase de CRMONITOR
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrMonDisp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm, DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun, ComCtrls, IntDtPk, Menus, IntLinkit, IntSGCtrl,
//UNIDADES ADICIONALES

  IntParamCre,
  IntGenCre,
  IntCrCredito,
  IntCrCesion,//SST10052011 Manda a Cesion
  IntCrCto,
  IntCrProduct,
  IntCrAcredit,
  IntCrliquida,
  IntCrMotRech,
  IntCrRelDisp;    //RABA OCT 2013 INTEGRACIÓN DE O17

Type
 TCrMonDisp= class;

  TWCrMonDisp=Class(TForm)
    InterForma1             : TInterForma;
    lbID_CESION: TLabel;
    Label10: TLabel;
    lbF_PAG_INICIAL: TLabel;
    lbID_EMISOR: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edID_CREDITO: TEdit;
    edACREDITADO: TEdit;
    rgSITUACION: TRadioGroup;
    btACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    chB_APLI_ACRED: TCheckBox;
    btCREDITO: TBitBtn;
    edTITULAR: TEdit;
    chB_APLI_DISP: TCheckBox;
    btBUSCA: TBitBtn;
    edTIT_DOCUMENTO: TEdit;
    edTIT_TIPO: TEdit;
    sgcDATOS: TSGCtrl;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    edF_INICIAL: TEdit;
    dtpF_INICIAL: TInterDateTimePicker;
    edF_FINAL: TEdit;
    dtpF_FINAL: TInterDateTimePicker;
    edAUTORIZACION: TEdit;
    btAUTORIZACION: TBitBtn;
    edTITULAR_AUT: TEdit;
    chB_APLI_AUT: TCheckBox;
    edPRODUCTO: TEdit;
    btPRODUCTO: TBitBtn;
    edDESC_PRODUCTO: TEdit;
    chB_APLI_PROD: TCheckBox;
    ilCREDITO: TInterLinkit;
    ilACREDITADO: TInterLinkit;
    ilPRODUCTO: TInterLinkit;
    pmDISP: TPopupMenu;
    Disposicin1: TMenuItem;
    CosultaAutorizacin1: TMenuItem;
    ConsultaProducto1: TMenuItem;
    N4Mdulodeliquidacin1: TMenuItem;
    ConsultaAcreditado1: TMenuItem;
    edSitMedCre: TEdit;
    Edit7: TEdit;
    edLiqIdCredito: TEdit;
    Edit8: TEdit;
    Edit10: TEdit;
    Edit9: TEdit;
    Edit2: TEdit;
    ilAUTORIZACION: TInterLinkit;
    MotivosdeRechazo1: TMenuItem;
    lbSolicDisp: TLabel;
    edFolioSolicitud: TEdit;
    bbtnFolioDisp: TBitBtn;
    edDisposicion: TEdit;
    InterLinkit1: TInterLinkit;
    ilSolDisposicion: TInterLinkit;
    chkbSolDisp: TCheckBox;
    Edit1: TEdit;
    RelacionarSolyDisp1: TMenuItem;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure btBUSCAClick(Sender: TObject);
    procedure InterForma2DespuesShow(Sender: TObject);
    procedure btCREDITOClick(Sender: TObject);
    procedure ilCREDITOEjecuta(Sender: TObject);
    procedure chB_APLI_DISPClick(Sender: TObject);
    procedure btAUTORIZACIONClick(Sender: TObject);
    procedure ilAUTORIZACIONEjecuta(Sender: TObject);
    procedure chB_APLI_AUTClick(Sender: TObject);
    procedure btPRODUCTOClick(Sender: TObject);
    procedure ilPRODUCTOEjecuta(Sender: TObject);
    procedure chB_APLI_PRODClick(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure chB_APLI_ACREDClick(Sender: TObject);
    procedure chB_APLI_FECHASClick(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure Disposicin1Click(Sender: TObject);
    procedure CosultaAutorizacin1Click(Sender: TObject);
    procedure ConsultaProducto1Click(Sender: TObject);
    procedure ConsultaAcreditado1Click(Sender: TObject);
    procedure N4Mdulodeliquidacin1Click(Sender: TObject);
    procedure rgSITUACIONClick(Sender: TObject);
    procedure edID_CREDITOExit(Sender: TObject);
    procedure edAUTORIZACIONExit(Sender: TObject);
    procedure edPRODUCTOExit(Sender: TObject);
    procedure edACREDITADOExit(Sender: TObject);
    procedure MotivosdeRechazo1Click(Sender: TObject);
    procedure edFolioSolicitudExit(Sender: TObject);
    procedure bbtnFolioDispClick(Sender: TObject);
    procedure bbtnFolioDispExit(Sender: TObject);
    procedure ilSolDisposicionEjecuta(Sender: TObject);
    procedure chkbSolDispClick(Sender: TObject);
    procedure edFolioSolicitudChange(Sender: TObject);
    procedure sgcDATOSDblClick(Sender: TObject);
    procedure RelacionarSolyDisp1Click(Sender: TObject);
    private
    { Private declarations }
        Function    CadenaSql : String;
        Procedure MuestraDatos;
        function  QuitaComas(PPCadena : String):String; //RABA 
    public
    { Public declarations }
    Objeto : TCrMonDisp;
end;
 TCrMonDisp= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }

        ParamCre                 : TParamCre;
        Disposicion              : TCrCredito;//Disposición
        Autorizacion             : TCrCto;
        Producto                 : TCrProduct;
        Acreditado               : TCrAcredit;

        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

      published
      end;

implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrMonDisp.Create( AOwner : TComponent );
begin Inherited;

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrMonitor.Hlp';
      ShowMenuReporte:=True;

      Disposicion := TCrCredito.Create(Self);
      Disposicion.MasterSource := Self;

      Autorizacion := TCrCto.Create(Self);
      Autorizacion.MasterSource := Self;

      Producto := TCrProduct.Create(Self);
      Producto.MasterSource := Self;

      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource := Self;

end;

Destructor TCrMonDisp.Destroy;
begin
   if Disposicion <> nil then
      Disposicion.Free;
   //end if

   if Autorizacion <> nil then
      Autorizacion.Free;
   //end if

   if Producto <> nil then
      Producto.Free;
   //end if

   if Acreditado <> nil then
      Acreditado.Free;
   //end if

    inherited;
end;


function TCrMonDisp.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrMonDisp;
begin
   W:=TWCrMonDisp.Create(Self);
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


(***********************************************FORMA CRMONITOR********************)
(*                                                                              *)
(*  FORMA DE CRMONITOR                                                            *)
(*                                                                              *)
(***********************************************FORMA CRMONITOR********************)
function TWCrMonDisp.CadenaSql: String;
var
  vlSql: String;
begin
  {vlSql:= ' SELECT CR.ID_CREDITO, CR.ID_CONTRATO, ' + coCRLF +
            ' CP.CVE_PRODUCTO_CRE, PT.NOMBRE ACREDITADO, ' + coCRLF +
            ' CR.IMP_CREDITO, CR.ID_PROM_ADM, ' + coCRLF +
            ' CR.SIT_CREDITO, CLD.DESC_LIQUIDACION, ' + coCRLF +
            ' CR.SIT_LIQ_RECEP, CTO.ID_TITULAR, ' + coCRLF +
            ' CR.FOL_CONTRATO ' + coCRLF +
          ' FROM (SELECT SUBSTR(PKGCRLIQUIDA.stpobtsitliq(CR.id_credito,CR.cve_liquidacion,CR.ref_externa_liq),1,2) SIT_LIQ_RECEP,' + coCRLF +
            ' CR.* ' + coCRLF +
            ' FROM CR_CREDITO CR WHERE 1=1 '+ coCRLF;
  if rgSITUACION.ItemIndex = 0 then
    vlsql:= vlsql + ' AND CR.SIT_CREDITO = ' + SQLStr(CSIT_NA) + coCRLF
  else
    if rgSITUACION.ItemIndex = 1 then
      vlsql:= vlsql + ' AND CR.SIT_CREDITO = ' + SQLStr(CSIT_AC) + coCRLF
    else
      if rgSITUACION.ItemIndex = 2 then
        vlsql:= vlsql + ' AND CR.SIT_CREDITO = ' + SQLStr(CSIT_CA) + coCRLF
      else
        if rgSITUACION.ItemIndex = 3 then
          vlsql:= vlsql + ' AND CR.SIT_CREDITO = ' + SQLStr(CSIT_RE) + coCRLF;
  vlsql:= vlsql +' AND CR.F_INICIO BETWEEN ' + SQLFecha(StrToDateTime(edF_INICIAL.Text)) + 'AND ' +
                                                        SQLFecha(StrToDateTime(edF_FINAL.Text)) + ') CR, ' + coCRLF +
             ' (SELECT * FROM CR_CONTRATO ' + coCRLF +
             ' WHERE CVE_PRODUCTO_CRE  IN ( SELECT CVE_PRODUCTO FROM CR_PERF_PROD_USU WHERE CVE_GPO_ACCESO = ' +
               IntToStr(Objeto.Apli.CvePerfil)+ ')) CCTO,  ' + coCRLF +
             ' (SELECT * FROM CR_PRODUCTO WHERE CVE_PRODUCTO_GPO <> ''FACTOR'') CP, ' + coCRLF +
             ' CONTRATO CTO, ' + coCRLF +
             ' PERSONA PT, ' + coCRLF +
             ' CR_LIQUIDA_DISP CLD ' + coCRLF +
             ' WHERE CCTO.ID_CONTRATO = CR.ID_CONTRATO  ' + coCRLF +
               ' AND CCTO.FOL_CONTRATO = CR.FOL_CONTRATO ' + coCRLF +
               ' AND CP.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE ' + coCRLF +
               ' AND CTO.ID_CONTRATO = CR.ID_CONTRATO ' + coCRLF +
               ' AND PT.ID_PERSONA = CTO.ID_TITULAR '+ coCRLF +
               ' AND CLD.CVE_LIQUIDACION = CR.CVE_LIQUIDACION ' + coCRLF ;
  if chB_APLI_DISP.Checked then
    vlsql:= vlsql + ' AND CR.ID_CREDITO = ' + edID_CREDITO.Text + coCRLF;
   //end if;
  if chB_APLI_AUT.Checked then
    vlsql:= vlsql + ' AND CR.ID_CONTRATO = ' + edAUTORIZACION.Text + coCRLF;
   //end if;
  if chB_APLI_PROD.Checked then
    vlsql:= vlsql + ' AND CP.CVE_PRODUCTO_CRE = ' + SQLStr(edPRODUCTO.Text) + coCRLF;
   //end if;
  if chB_APLI_ACRED.Checked then
    vlsql:= vlsql + ' AND CTO.ID_TITULAR = ' + edACREDITADO.Text + coCRLF;
   //end if;
  vlsql:= vlsql + ' ORDER BY CR.ID_CREDITO, PT.NOMBRE ';
  CadenaSql:= vlSql;}
  // </SST>
  // 28ABR2011
  // Se arregla el Script, para colocar los datos del Monitor Web
  if rgSITUACION.ItemIndex <> 0 then
  begin
//    vlSql:= ' SELECT CR.ID_CREDITO, CR.ID_CONTRATO, ' +
    vlSql:= ' SELECT CR.CVE_MEDIO, CR.ID_CREDITO, CR.ID_CONTRATO, ' +
              ' CP.CVE_PRODUCTO_CRE, PT.NOMBRE ACREDITADO, ' +
              ' CR.IMP_CREDITO, CR.ID_PROM_ADM, ' +
              ' CR.SIT_CREDITO, CLD.DESC_LIQUIDACION, ' +
              ' CR.SIT_LIQ_RECEP, CTO.ID_TITULAR, ' +
              ' CR.FOL_CONTRATO ' +
            ' FROM (SELECT SUBSTR(PKGCRLIQUIDA.stpobtsitliq(CR.id_credito,CR.cve_liquidacion,CR.ref_externa_liq),1,2) SIT_LIQ_RECEP,' +
              ' CR.* ' +
              ' FROM CR_CREDITO CR WHERE 1=1 ';
    if rgSITUACION.ItemIndex = 1 then
      vlsql:= vlsql + ' AND CR.SIT_CREDITO = ' + SQLStr(CSIT_NA);
    if rgSITUACION.ItemIndex = 2 then
      vlsql:= vlsql + ' AND CR.SIT_CREDITO = ' + SQLStr(CSIT_AC);
    if rgSITUACION.ItemIndex = 3 then
      vlsql:= vlsql + ' AND CR.SIT_CREDITO = ' + SQLStr(CSIT_CA);
    if rgSITUACION.ItemIndex = 4 then
      vlsql:= vlsql + ' AND CR.SIT_CREDITO = ' + SQLStr(CSIT_RE);
    vlsql:= vlsql +' AND CR.F_INICIO BETWEEN ' + SQLFecha(StrToDateTime(edF_INICIAL.Text)) + 'AND ' +
                                                          SQLFecha(StrToDateTime(edF_FINAL.Text)) + ') CR, ' +
               ' (SELECT * FROM CR_CONTRATO ' +
               ' WHERE CVE_PRODUCTO_CRE  IN ( SELECT CVE_PRODUCTO FROM CR_PERF_PROD_USU WHERE CVE_GPO_ACCESO = ' +
                 IntToStr(Objeto.Apli.CvePerfil)+ ')) CCTO,  ' +
               ' (SELECT * FROM CR_PRODUCTO WHERE CVE_PRODUCTO_GPO <> ''FACTOR'') CP, ' +
               ' CONTRATO CTO, ' +
               ' PERSONA PT, ' +
               ' CR_LIQUIDA_DISP CLD ' +
               ' WHERE CCTO.ID_CONTRATO = CR.ID_CONTRATO  ' +
                 ' AND CCTO.FOL_CONTRATO = CR.FOL_CONTRATO ' +
                 ' AND CP.CVE_PRODUCTO_CRE = CCTO.CVE_PRODUCTO_CRE ' +
                 ' AND CTO.ID_CONTRATO = CR.ID_CONTRATO ' +
                 ' AND PT.ID_PERSONA = CTO.ID_TITULAR ' +
                 ' AND CLD.CVE_LIQUIDACION = CR.CVE_LIQUIDACION ';
    if chB_APLI_DISP.Checked then
      vlsql:= vlsql + ' AND CR.ID_CREDITO = ' + edID_CREDITO.Text;
    if chB_APLI_AUT.Checked then
      vlsql:= vlsql + ' AND CR.ID_CONTRATO = ' + edAUTORIZACION.Text;
    if chB_APLI_PROD.Checked then
      vlsql:= vlsql + ' AND CP.CVE_PRODUCTO_CRE = ' + SQLStr(edPRODUCTO.Text);
    if chB_APLI_ACRED.Checked then
      vlsql:= vlsql + ' AND CTO.ID_TITULAR = ' + edACREDITADO.Text;
    vlsql:= vlsql + ' ORDER BY CR.ID_CREDITO, PT.NOMBRE';
    CadenaSql:= vlSql;
  end
  else
  begin
//    vlSql:= ' SELECT BIS.ID_SOLICITUD AS ID_CREDITO, BIS.ID_CONTRATO_LINEA AS ID_CONTRATO, ' +
    vlSql:= ' SELECT BIS.CVE_MEDIO, BIS.ID_SOLICITUD AS ID_CREDITO, BIS.ID_CONTRATO_LINEA AS ID_CONTRATO, ' +    //RABA se agrega el medio del cual proviene
            '        CRCON.FOL_CONTRATO, ' +
              ' CRCON.CVE_PRODUCTO_CRE, TIT.NOMBRE AS ACREDITADO, BIS.IMPORTE AS IMP_CREDITO, ' +
              ' CRCON.ID_PROM_ADMON AS ID_PROM_ADM, PRO.SIT_PRODUCTO AS SIT_CREDITO, ' +
                {chr(39) + ' ' + chr(39) + ' AS DESC_LIQUIDACION, ' + chr(39) + ' ' +
                chr(39) + ' AS SIT_LIQ_RECEP, ' +}
              ' (SELECT CRE.ID_CREDITO FROM CR_CREDITO CRE ' +
               ' WHERE CRE.ID_CONTRATO = BIS.ID_CONTRATO_LINEA ' +
                 ' AND CRE.ID_SOLICITUD = BIS.ID_SOLICITUD ' +
                 ' AND CRE.CVE_MEDIO = BIS.CVE_MEDIO) AS DESC_LIQUIDACION, ' +
              ' (SELECT CRE.SIT_CREDITO FROM CR_CREDITO CRE ' +
               ' WHERE CRE.ID_CONTRATO = BIS.ID_CONTRATO_LINEA ' +
                 ' AND CRE.ID_SOLICITUD = BIS.ID_SOLICITUD ' +
                 ' AND CRE.CVE_MEDIO = BIS.CVE_MEDIO) AS SIT_LIQ_RECEP, ' +
              ' PRO.B_CONSULTA_DOC, CON.ID_TITULAR ' +
//            ' FROM CR_CONTRATO CRCON, CR_BI_SOLICITUD BIS, CR_PRODUCTO PRO, ' +
            ' FROM CR_CONTRATO CRCON, CR_PRODUCTO PRO, ' +
              ' CONTRATO CON, PERSONA TIT,  ' +
//RABA
            '  (SELECT ''BIT'' AS CVE_MEDIO, BIS.ID_SOLICITUD, BIS.ID_CONTRATO_LINEA, BIS.IMPORTE, BIS.F_INICIO ' +
            '   FROM CR_BI_SOLICITUD BIS ' +
            '   WHERE BIS.ESTADO = 3  ' +   // Estado liberadas!!! 
            '   UNION ALL ' +
            '   SELECT ''BPM'' AS CVE_MEDIO, OMC.ID_SOLICITUD, OMC.ID_CONTRATO_LINEA, ' +
            '          CASE WHEN OMC.ID_PROVEEDOR IS NULL THEN OMC.IMP_DISPOSICION ELSE OMC.IMP_DISPOSICION * (NVL(OMC.PCT_AFORO,100)/100) END AS IMPORTE, ' +
            '          TRUNC(OMC.F_SOLICITUD) AS F_INICIO ' +
            '   FROM CR_OMC_SOLICITUD OMC ' +
            '   WHERE OMC.SIT_SOLICITUD = ''AU'' ' +  //Estado Autorizada!!!
            '   ) BIS ' +
// FIN RABA
            ' WHERE CRCON.ID_CONTRATO = BIS.ID_CONTRATO_LINEA ' +
              ' AND PRO.CVE_PRODUCTO_CRE = CRCON.CVE_PRODUCTO_CRE ' +
              ' AND CRCON.ID_CONTRATO = CON.ID_CONTRATO ' +
              ' AND CON.ID_TITULAR = TIT.ID_PERSONA ' +
//              ' AND BIS.ESTADO = 3 ' + //Estado liberadas!!!   //RABA SE INTEGRA EN EL SUBQUERY
              ' AND BIS.F_INICIO BETWEEN ' +
                  SQLFecha(StrToDateTime(edF_INICIAL.Text)) +
                  ' AND ' + SQLFecha(StrToDateTime(edF_FINAL.Text));
    if chkbSolDisp.Checked = True then
      vlSql:= vlSql + ' AND BIS.ID_SOLICITUD = ' + edFolioSolicitud.Text;
    if chB_APLI_AUT.Checked = True then
      vlSql:= vlSql + ' AND BIS.ID_CONTRATO_LINEA = ' + edAUTORIZACION.Text;
    if chB_APLI_PROD.Checked = True then
      vlSql:= vlSql + ' AND CRCON.CVE_PRODUCTO_CRE = ' + QuotedStr(edPRODUCTO.Text);
    if chB_APLI_ACRED.Checked = True then
      vlSql:= vlSql + ' AND CON.ID_TITULAR = ' + edACREDITADO.Text;
    vlSql:= vlSql + ' ORDER BY BIS.ID_SOLICITUD';
    CadenaSql:= vlSql;
  end;
  //<SST/>
end;

//</SST>
//05MAY2011 Cambios Script Monitor Web
procedure TWCrMonDisp.MuestraDatos;
var
  vlQry: TQuery;
begin
  vlQry:= GetSQLQuery(CadenaSql,
                      Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
  try
    if vlQry <> nil then
    begin
      if rgSITUACION.ItemIndex <> 0 then
      begin
        //Datos que no se muestran
        vlQry.FieldByName('ID_TITULAR').Visible:= False;
        vlQry.FieldByName('FOL_CONTRATO').Visible:= False;
        vlQry.FieldByName('CVE_MEDIO').DisplayWidth:= 8;
        vlQry.FieldByName('ID_CREDITO').DisplayWidth:= 8;
        vlQry.FieldByName('ID_CONTRATO').DisplayWidth:= 15;
        vlQry.FieldByName('CVE_PRODUCTO_CRE').DisplayWidth:= 10;
        vlQry.FieldByName('ACREDITADO').DisplayWidth:= 37;
        vlQry.FieldByName('IMP_CREDITO').DisplayWidth:= 13;
        vlQry.FieldByName('ID_PROM_ADM').DisplayWidth:= 10;
        vlQry.FieldByName('SIT_CREDITO').DisplayWidth:= 4;
        vlQry.FieldByName('DESC_LIQUIDACION').DisplayWidth:= 12;
        vlQry.FieldByName('SIT_LIQ_RECEP').DisplayWidth:= 8;
        TNumericField(vlQry.FieldByName('IMP_CREDITO')).DisplayFormat:= '###,###,###,###,###,###,##0.00';
        sgcDATOS.AddQry(vlQry, True, True, -1, -1, -1, False); //AGREGAR QUERY
      end
      else
      begin
        //</SST>
        vlQry.FieldByName('ID_TITULAR').Visible:= False;
        vlQry.FieldByName('B_CONSULTA_DOC').Visible:= False;
        vlQry.FieldByName('FOL_CONTRATO').Visible:= False;
        vlQry.FieldByName('CVE_MEDIO').DisplayWidth:= 8;
        vlQry.FieldByName('ID_CREDITO').DisplayWidth:= 8;
        vlQry.FieldByName('ID_CONTRATO').DisplayWidth:= 15;
        vlQry.FieldByName('CVE_PRODUCTO_CRE').DisplayWidth:= 10;
        vlQry.FieldByName('ACREDITADO').DisplayWidth:= 37;
        vlQry.FieldByName('IMP_CREDITO').DisplayWidth:= 13;
        vlQry.FieldByName('ID_PROM_ADM').DisplayWidth:= 10;
        vlQry.FieldByName('SIT_CREDITO').DisplayWidth:= 4;
        vlQry.FieldByName('DESC_LIQUIDACION').DisplayWidth:= 12;
        vlQry.FieldByName('SIT_LIQ_RECEP').DisplayWidth:= 8;
        TNumericField(vlQry.FieldByName('IMP_CREDITO')).DisplayFormat:= '###,###,###,###,###,###,##0.00';
        sgcDATOS.AddQry(vlQry, True, True, -1, -1, -1, False);
        //<SST/>
      end;
    end
    else
    begin
      sgcDATOS.Clear('NO EXISTEN DATOS'#30'>C');
    end;
  finally
    if vlQry <> nil then
      vlQry.free;
    //end if
  end;
end;
//<SST/>

procedure TWCrMonDisp.FormShow(Sender: TObject);
begin
  //PINTA DATOS DEL PANEL INFERIOR
  lbDempresa.Caption:= Objeto.ParamCre.EMPRESA.AsString;
  lbDfecha.Caption  := Objeto.ParamCre.FECHA.AsString;
  lbDUsuario.Caption:= Objeto.ParamCre.USUARIO.AsString;
  lbDPerfil.Caption := Objeto.ParamCre.PERFIL.AsString;

  Objeto.Disposicion.ID_CREDITO.Control:= edID_CREDITO;
  Objeto.Disposicion.ContratoCre.Acreditado.Persona.Nombre.Control:= edTITULAR;
  Objeto.Disposicion.GetParams(Objeto);

  Objeto.Autorizacion.ID_CONTRATO.Control:= edAUTORIZACION;
  Objeto.Autorizacion.Acreditado.Persona.Nombre.Control:= edTITULAR_AUT;
  Objeto.Autorizacion.GetParams(Objeto);

  Objeto.Producto.CVE_PRODUCTO_CRE.Control:= edPRODUCTO;
  Objeto.Producto.DESC_C_PRODUCTO.Control:= edDESC_PRODUCTO;
  Objeto.Producto.GetParams(Objeto);

  Objeto.Acreditado.ID_ACREDITADO.Control:= edACREDITADO;
  Objeto.Acreditado.Persona.Nombre.Control:= edNOMBRE_ACRED;
  Objeto.Acreditado.GetParams(Objeto);
  //</SST>
  //06 MAYO 2011
  //Validaciones para no colocar filtros equivocados en la consulta
  //Por default "No Autorizados"
  edFolioSolicitud.Enabled:= False;
  //<SST/>
end;

procedure TWCrMonDisp.FormDestroy(Sender: TObject);
begin
      Objeto.Disposicion.ID_CREDITO.Control := nil;
      Objeto.Disposicion.ContratoCre.Acreditado.Persona.Nombre.Control := nil;

      Objeto.Autorizacion.ID_CONTRATO.Control := nil;
      Objeto.Autorizacion.Acreditado.Persona.Nombre.Control := nil;

      Objeto.Producto.CVE_PRODUCTO_CRE.Control := nil;
      Objeto.Producto.DESC_C_PRODUCTO.Control := nil;

      Objeto.Acreditado.ID_ACREDITADO.Control := nil;
      Objeto.Acreditado.Persona.Nombre.Control := nil;
end;

procedure TWCrMonDisp.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrMonDisp.btBUSCAClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRMONDISP_BUSCA',True,True) then
   begin
      MuestraDatos;
   end;
end;

procedure TWCrMonDisp.InterForma2DespuesShow(Sender: TObject);
begin
  MuestraDatos;
end;

procedure TWCrMonDisp.btCREDITOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRMONDISP_DISP',True,True) then
   begin
      if rgSITUACION.ItemIndex <> 0 then
      begin
        Objeto.Disposicion.ShowAll:= True;
        if Objeto.Disposicion.Busca then
        begin
          chB_APLI_DISP.Checked:= True;
          chB_APLI_DISP.Enabled:= True;
          InterForma1.NextTab(edID_CREDITO);
        end;
      end;
   end;
end;

procedure TWCrMonDisp.ilCREDITOEjecuta(Sender: TObject);
begin
   if Objeto.Disposicion.FindKey([ilCREDITO.Buffer]) then
   Begin
      chB_APLI_DISP.Checked:= True;
      chB_APLI_DISP.Enabled:= True;
      InterForma1.NextTab(edID_CREDITO);
   end;
end;

procedure TWCrMonDisp.chB_APLI_DISPClick(Sender: TObject);
begin
    If not chB_APLI_DISP.Checked Then Begin
        Objeto.Disposicion.Active:=False;
        chB_APLI_DISP.Checked:=False;
        chB_APLI_DISP.Enabled:=False;
    End Else Begin
        chB_APLI_DISP.Checked:=True;
        chB_APLI_DISP.Enabled:=True;
    End;
    MuestraDatos;
end;

procedure TWCrMonDisp.btAUTORIZACIONClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRMONDISP_AUTRZ',True,True) then
   begin
      Objeto.Autorizacion.ShowAll:= True;
      if Objeto.Autorizacion.Busca then
      begin
        chB_APLI_AUT.Checked:= True;
        chB_APLI_AUT.Enabled:= True;
        InterForma1.NextTab(edAUTORIZACION);
      end;
   end;
end;

procedure TWCrMonDisp.ilAUTORIZACIONEjecuta(Sender: TObject);
Begin
   if Objeto.Autorizacion.FindKey([ilAUTORIZACION.Buffer]) then
   Begin
      chB_APLI_AUT.Checked:= True;
      chB_APLI_AUT.Enabled:= True;
      InterForma1.NextTab(edAUTORIZACION);
   end;
end;

procedure TWCrMonDisp.chB_APLI_AUTClick(Sender: TObject);
begin
    If not chB_APLI_AUT.Checked Then Begin
        Objeto.Autorizacion.Active:=False;
        chB_APLI_AUT.Checked:=False;
        chB_APLI_AUT.Enabled:=False;
    End Else Begin
        chB_APLI_AUT.Checked:=True;
        chB_APLI_AUT.Enabled:=True;
    End;
    MuestraDatos;
end;

procedure TWCrMonDisp.btPRODUCTOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRMONDISP_PROD',True,True) then
   begin
      Objeto.Producto.ShowAll:= True;
      if Objeto.Producto.Busca then
      begin
        chB_APLI_PROD.Checked:= True;
        chB_APLI_PROD.Enabled:= True;
        InterForma1.NextTab(edID_CREDITO);
      end;
   end;
end;

procedure TWCrMonDisp.ilPRODUCTOEjecuta(Sender: TObject);
begin
   if Objeto.Producto.FindKey([ilPRODUCTO.Buffer]) then
   Begin
      chB_APLI_PROD.Checked:= True;
      chB_APLI_PROD.Enabled:= True;
      InterForma1.NextTab(edPRODUCTO);
   end;
end;

procedure TWCrMonDisp.chB_APLI_PRODClick(Sender: TObject);
begin
    If not chB_APLI_PROD.Checked Then Begin
        Objeto.Producto.Active:=False;
        chB_APLI_PROD.Checked:=False;
        chB_APLI_PROD.Enabled:=False;
    End Else Begin
        chB_APLI_PROD.Checked:=True;
        chB_APLI_PROD.Enabled:=True;
    End;
    MuestraDatos;
end;

procedure TWCrMonDisp.btACREDITADOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRMONDISP_ACRED',True,True) then
   begin
      Objeto.Acreditado.ShowAll:= True;
      if Objeto.Acreditado.Busca then
      begin
        chB_APLI_ACRED.Checked:= True;
        chB_APLI_ACRED.Enabled:= True;
        InterForma1.NextTab(edACREDITADO);
      end;
   end;
end;

procedure TWCrMonDisp.ilACREDITADOEjecuta(Sender: TObject);
begin
  if Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) then
  begin
    chB_APLI_ACRED.Checked:= True;
    chB_APLI_ACRED.Enabled:= True;
    InterForma1.NextTab(edACREDITADO);
  end;
end;

procedure TWCrMonDisp.chB_APLI_ACREDClick(Sender: TObject);
begin
    If not chB_APLI_ACRED.Checked Then Begin
        Objeto.Acreditado.Active:=False;
        chB_APLI_ACRED.Checked:=False;
        chB_APLI_ACRED.Enabled:=False;
    End Else Begin
        chB_APLI_ACRED.Checked:=True;
        chB_APLI_ACRED.Enabled:=True;
    End;
    MuestraDatos;
end;

procedure TWCrMonDisp.chB_APLI_FECHASClick(Sender: TObject);
begin
    MuestraDatos;
end;

procedure TWCrMonDisp.InterForma1DespuesShow(Sender: TObject);
begin
  rgSITUACION.ItemIndex:= 1; //SST09052011 Default No autorizados
  dtpF_INICIAL.DateTime:= Objeto.Apli.DameFechaEmpresa;
  dtpF_FINAL.DateTime:= Objeto.Apli.DameFechaEmpresa;
  edF_INICIAL.text:=FormatDateTime('dd/mm/yyyy',dtpF_INICIAL.DateTime);
  edF_FINAL.text:=FormatDateTime('dd/mm/yyyy',dtpF_FINAL.DateTime);
  MuestraDatos;
end;

procedure TWCrMonDisp.Disposicin1Click(Sender: TObject);
var
  Credito: TCrCredito;
  Cesion: TCrCesion;
  vlQry: TQuery;
  vlBConsuNuevo: Boolean;
  vlIdCredito, vlConsulta, vlBConsultaDoc: String;
  vlIdSolicitud, vlIdContratoLinea, vlIdTitular: String;
  vlCveMedio: String;     //RABA
begin
  // </SST>
  // 29ABR2011
  // Se agrega el Script, para colocar los datos del Monitor Web
  if rgSITUACION.ItemIndex <> 0 then
  begin
    try
      vlIdCredito:= sgcDATOS.CellStr['ID_CREDITO', sgcDATOS.SG.Row];
      Credito:= TCrCredito.Create(self);
      Credito.Apli:= Objeto.Apli;
      Credito.vgIdContratoWeb:= 0;
      Credito.FindKey([vlIdCredito]);
      Credito.ParamCre:= Objeto.ParamCre;
      Credito.Catalogo;
    finally
      Credito.Free;
    end;
  end
  else
  begin
    try
      vlCveMedio := sgcDATOS.CellStr['CVE_MEDIO', sgcDATOS.SG.Row];
      vlIdSolicitud:= sgcDATOS.CellStr['ID_CREDITO', sgcDATOS.SG.Row];
      vlIdContratoLinea:= sgcDATOS.CellStr['ID_CONTRATO', sgcDATOS.SG.Row];
      vlBConsultaDoc:= sgcDATOS.CellStr['B_CONSULTA_DOC', sgcDATOS.SG.Row];
      vlIdTitular:= sgcDATOS.CellStr['ID_TITULAR', sgcDATOS.SG.Row];
      vlConsulta:= ' SELECT ID_CREDITO FROM CR_CREDITO ' +
                   ' WHERE ID_SOLICITUD = ' + vlIdSolicitud +
                   '   AND CVE_MEDIO = ''' + vlCveMedio + '''';
      vlQry:= TQuery.Create(Self);
      vlQry.DatabaseName:= Objeto.Apli.DatabaseName;
      vlQry.SessionName:= Objeto.Apli.SessionName;
      vlQry.Close;
      vlQry.SQL.Text:= vlConsulta;
      vlQry.Open;
      vlBConsuNuevo:= False;
      if vlQry <> nil then
      begin
        vlIdCredito:= vlQry.FieldByName('ID_CREDITO').AsString;
        if vlIdCredito <> '' then
          vlBConsuNuevo:= True;
      end;
      vlQry.Close;
      // NO EXISTE
      if vlBConsuNuevo = False then
      begin
        if vlCveMedio = 'BIT' Then
           vlConsulta:= ' SELECT BIS.ID_PROVEEDOR, BIS.F_INICIO, BIS.PLAZO, BIS.F_TERMINO, ' +
                        ' BIS.IMPORTE, (SELECT PORCENTAJE FROM CR_BI_SOLICITUD_COMISION COM ' +
                                      ' WHERE COM.ID_SOLICITUD = BIS.ID_SOLICITUD ' +
                                        ' AND COM.CVE_COMISION = '+QuotedStr('CODI')+') AS COMDISP, ' +
                        ' BIS.ID_TIPO_INTERES ' +
                        ' FROM CR_BI_SOLICITUD BIS ' +
                        ' WHERE BIS.ID_SOLICITUD = ' + vlIdSolicitud +
                          ' AND BIS.ID_CONTRATO_LINEA = ' + vlIdContratoLinea
        else
           vlConsulta:= ' SELECT OMC.ID_PROVEEDOR, OMC.F_INICIO, OMC.NUM_PLAZO AS PLAZO, OMC.F_VENCIMIENTO AS F_TERMINO, ' +
                        '        CASE WHEN OMC.ID_PROVEEDOR IS NULL THEN OMC.IMP_DISPOSICION ELSE OMC.IMP_DISPOSICION * (NVL(OMC.PCT_AFORO,100)/100) END AS IMPORTE, ' +
                        '        (SELECT PCT_COMISION FROM CR_OMC_COMISION COM ' +
                        '         WHERE COM.ID_EMPRESA = OMC.ID_EMPRESA ' +
                        '           AND COM.ID_SOLICITUD = OMC.ID_SOLICITUD ' +
                        '           AND COM.CVE_COMISION = (CASE WHEN OMC.ID_PROVEEDOR IS NULL THEN ''CODI'' ELSE ''CODIPR'' END) ' +
                        '         ) AS COMDISP, ' +
                        '        CASE WHEN OMC.CVE_TIPO_INTERES = ''IN'' THEN 1 ELSE 2 END AS ID_TIPO_INTERES ' +
                        ' FROM CR_OMC_SOLICITUD OMC ' +
                        ' WHERE OMC.ID_SOLICITUD = ' + vlIdSolicitud +
                        '   AND ID_CONTRATO_LINEA = ' + vlIdContratoLinea;
        vlQry.SQL.Text:= vlConsulta;
        vlQry.Open;
        if vlQry <> nil then
        begin
          if vlBConsultaDoc <> 'V' then
          begin
            try
              Credito:= TCrCredito.Create(Self);
              Credito.Apli:= Objeto.Apli;
              Credito.vgIdSolWeb:= StrToInt(vlIdSolicitud);
              Credito.vgIdContratoWeb:= StrToInt(vlIdContratoLinea);
              Credito.vgFInicioWeb:= vlQry.FieldByName('F_INICIO').AsDateTime;
              Credito.vgPlazoWeb:= vlQry.FieldByName('PLAZO').AsInteger;
              Credito.vgFTerminoWeb:= vlQry.FieldByName('F_TERMINO').AsDateTime;
              Credito.vgImporteWeb:= vlQry.FieldByName('IMPORTE').AsFloat;
              Credito.vgComDispWeb:= vlQry.FieldByName('COMDISP').AsFloat;
              Credito.vgCveMedio:= vlCveMedio;
              Credito.ParamCre:= Objeto.ParamCre;
              Credito.Nuevo;
            finally
              Credito.Free;
            end;
          end
          else
          begin
            try
              Cesion:= TCrCesion.Create(Self);
              Cesion.Apli:= Objeto.Apli;
              Cesion.vgIdSolWeb:= StrToInt(vlIdSolicitud);
              Cesion.vgIdContratoWeb:= StrToInt(vlIdContratoLinea);
              Cesion.vgIdEmisorWeb:= StrToInt(sgcDATOS.CellStr['ID_TITULAR', sgcDATOS.SG.Row]);
              Cesion.vgIdProveedor:= vlQry.FieldByName('ID_PROVEEDOR').AsInteger;
              Cesion.vgComDispWeb:= vlQry.FieldByName('COMDISP').AsFloat;
              Cesion.vgIdTipoInteres:= vlQry.FieldByName('ID_TIPO_INTERES').AsInteger;
              Cesion.vgCveMedio := vlCveMedio;
              Cesion.ParamCre:= Objeto.ParamCre;
              Cesion.Nuevo;
              Cesion.Catalogo;              
            finally
              Cesion.Free;
            end;
          end;
        end
        else
        begin
          if vlBConsultaDoc <> 'V' then
          begin
            try
              Credito:= TCrCredito.Create(Self);
              Credito.Apli:= Objeto.Apli;
              Credito.vgIdContratoWeb:= 0;
              Credito.vgCveMedio := vlCveMedio;
              Credito.Catalogo;
            finally
              Credito.Free;
            end;
          end
          else
          begin
            try
              Cesion:= TCrCesion.Create(Self);
              Cesion.Apli:= Objeto.Apli;
              Cesion.vgIdContratoWeb:= 0;
              Cesion.vgCveMedio := vlCveMedio;
              Cesion.Catalogo;
            finally
              Cesion.Free;
            end;
          end;
        end;
      end
      else
      begin
        if vlBConsultaDoc <> 'V' then
        begin
          try
            Credito:= TCrCredito.Create(self);
            Credito.Apli:= Objeto.Apli;
            Credito.vgIdContratoWeb:= 0;
            Credito.FindKey([vlIdCredito]);
            Credito.ParamCre:= Objeto.ParamCre;
            Credito.Catalogo;
          finally
            Credito.Free;
          end;
        end
        else
        begin
          try
            Cesion:= TCrCesion.Create(self);
            Cesion.Apli:= Objeto.Apli;
            Cesion.vgIdContratoWeb:= 0;
            Cesion.FindKey([vlIdCredito]);
            Cesion.CreCto.FindKey([Cesion.Credito.Id_Contrato.AsString,'1']);
            Cesion.ParamCre:= Objeto.ParamCre;
            Cesion.Catalogo;
          finally
            Cesion.Free;
          end;
        end;
      end;
    finally
      if vlQry <> nil then
        vlQry.Free;
    end;
  end;
  MuestraDatos;
  //<SST/>
end;

procedure TWCrMonDisp.CosultaAutorizacin1Click(Sender: TObject);
var  CrCto : TCrCto;
     vlIdCto : String;
     vlFolCto : String;
     vlAcred : String;
begin
   vlIdCto := sgcDATOS.CellStr['ID_CONTRATO',sgcDATOS.SG.Row];
   vlFolCto := sgcDATOS.CellStr['FOL_CONTRATO',sgcDATOS.SG.Row];
   vlAcred := sgcDATOS.CellStr['ID_TITULAR',sgcDATOS.SG.Row];
   CrCto := TCrCto.Create(self);
   Try
      CrCto.Apli:=Objeto.Apli;
      CrCto.FindKey([vlIdCto,vlFolCto]);
      CrCto.Acreditado.FindKey([vlAcred]);
      CrCto.ParamCre:=Objeto.ParamCre;
      CrCto.Catalogo;
   finally
      CrCto.Free;
   end;
   MuestraDatos;
end;

procedure TWCrMonDisp.ConsultaProducto1Click(Sender: TObject);
var  CrProd : TCrProduct;
     vlCveProd : String;
begin
   vlCveProd := sgcDATOS.CellStr['CVE_PRODUCTO_CRE',sgcDATOS.SG.Row];
   CrProd := TCrProduct.Create(self);
   Try
      CrProd.Apli:=Objeto.Apli;
      CrProd.FindKey([vlCveProd]);
      CrProd.ParamCre:=Objeto.ParamCre;
      CrProd.Catalogo;
   finally
      CrProd.Free;
   end;
   MuestraDatos;
end;

procedure TWCrMonDisp.ConsultaAcreditado1Click(Sender: TObject);
var  CrAcred : TCrAcredit;
     vlAcred : String;
begin
   vlAcred := sgcDATOS.CellStr['ID_TITULAR',sgcDATOS.SG.Row];
   CrAcred := TCrAcredit.Create(self);
   Try
      CrAcred.Apli:=Objeto.Apli;
      CrAcred.FindKey([vlAcred]);
      CrAcred.ParamCre:=Objeto.ParamCre;
      CrAcred.Catalogo;
   finally
      CrAcred.Free;
   end;
   MuestraDatos;
end;

procedure TWCrMonDisp.N4Mdulodeliquidacin1Click(Sender: TObject);
var  Liquida : TCrliquida;
     vlIdCredito : String;
begin
   vlIdCredito := sgcDATOS.CellStr['ID_CREDITO',sgcDATOS.SG.Row];
   Liquida := TCrliquida.Create(self);
   Try
      Liquida.Apli:=Objeto.Apli;
      Liquida.Disposicion.FindKey([vlIdCredito]);
      Liquida.ParamCre:=Objeto.ParamCre;
      Liquida.Catalogo;

   finally
      Liquida.Free;
   end;
   MuestraDatos;
end;

procedure TWCrMonDisp.rgSITUACIONClick(Sender: TObject);
begin
  //</SST>
  //06 MAYO 2011
  //Validaciones para no colocar filtros equivocados en la consulta
  if rgSITUACION.ItemIndex <> 0 then
  begin
    edFolioSolicitud.Text:= '';
    edLiqIdCredito.Text:= '  MEDIO LIQ.';
    edSitMedCre.Text:= ' SIT MED';
    edFolioSolicitud.Enabled:= False;
    chkbSolDisp.Enabled:= False;
    chkbSolDisp.Checked:= False;
    edID_CREDITO.Enabled:= True;
    RelacionarSolyDisp1.Visible := False;
  end
  else
  begin
    edID_CREDITO.Text:= '';
    edLiqIdCredito.Text:= '  SOLICITUD';
    edSitMedCre.Text:= ' SIT CRE';
    edFolioSolicitud.Enabled:= True;
    edID_CREDITO.Enabled:= False;
    chB_APLI_DISP.Checked:= False;
    RelacionarSolyDisp1.Visible := True;
  end;
  //<SST/>
  MuestraDatos;
end;

procedure TWCrMonDisp.edID_CREDITOExit(Sender: TObject);
begin
  MuestraDatos;
end;

procedure TWCrMonDisp.edAUTORIZACIONExit(Sender: TObject);
begin
  MuestraDatos;
end;

procedure TWCrMonDisp.edPRODUCTOExit(Sender: TObject);
begin
  MuestraDatos;
end;

procedure TWCrMonDisp.edACREDITADOExit(Sender: TObject);
begin
  MuestraDatos;
end;

procedure TWCrMonDisp.MotivosdeRechazo1Click(Sender: TObject);
Var   Motivo : TCrMotRech;
begin
      Motivo := TCrMotRech.Create(self);
      try
         Motivo.Apli:=Objeto.Apli;
         Motivo.ParamCre:=Objeto.ParamCre;
         Motivo.ID_CREDITO.AsString := sgcDATOS.CellStr['ID_CREDITO',sgcDATOS.SG.Row];
         Motivo.Catalogo;
      finally
             Motivo.Free;
      end;
      MuestraDatos;
end;
// </SST>
// 02MAY2011
// Cambios diversos para funcionalidad Monitor Web
procedure TWCrMonDisp.edFolioSolicitudExit(Sender: TObject);
begin
  MuestraDatos;
end;

procedure TWCrMonDisp.bbtnFolioDispClick(Sender: TObject);
var
  T: TInterFindit;
begin
   if Objeto.ValidaAccesoEsp('TCRMONDISP_SOLDS',True,True) then
   begin
      if rgSITUACION.ItemIndex = 0 then
      begin
        T:= Objeto.CreaBuscador('ICRSOLDISP.IT','F,F');
        T.WhereString:= 'BIS.ESTADO = ' + QuotedStr('3'); //Estado Liberado
        try
          if T.Execute then
          begin
            edFolioSolicitud.Text:= T.DameCampo(0);
            chkbSolDisp.Enabled:= True;
            chkbSolDisp.Checked:= True;
          end;
        finally
          T.Free;
        end;
      end;
   end;
end;

procedure TWCrMonDisp.bbtnFolioDispExit(Sender: TObject);
begin
  MuestraDatos;
end;

procedure TWCrMonDisp.ilSolDisposicionEjecuta(Sender: TObject);
begin
  if Objeto.Disposicion.FindKey([ilCREDITO.Buffer]) then
  begin
    chkbSolDisp.Checked:= True;
    chkbSolDisp.Enabled:= True;
    InterForma1.NextTab(edFolioSolicitud);
  end;
end;

procedure TWCrMonDisp.chkbSolDispClick(Sender: TObject);
begin
  MuestraDatos;
end;

procedure TWCrMonDisp.edFolioSolicitudChange(Sender: TObject);
begin
  if edFolioSolicitud.Text <> '' then
  begin
    chkbSolDisp.Enabled:= True;
    chkbSolDisp.Checked:= True;
  end;
end;

procedure TWCrMonDisp.sgcDATOSDblClick(Sender: TObject);
var
  Pixel: TPoint;
begin
  GetCursorPos(Pixel);
  pmDISP.Popup(Pixel.X,Pixel.Y);
end;
//<SST/>
procedure TWCrMonDisp.RelacionarSolyDisp1Click(Sender: TObject);
Var
  Relacion: TCrRelDisp;
  vlIdSolicitud, vlIdContratoLinea, vlCveMedio, vlImpCredito, vlBConsultaDoc: String;
  qyQuery : TQuery;
  vlSQL : String;
  Continua :Boolean;
begin
  vlIdSolicitud:= sgcDATOS.CellStr['ID_CREDITO', sgcDATOS.SG.Row];
  vlIdContratoLinea:= sgcDATOS.CellStr['ID_CONTRATO', sgcDATOS.SG.Row];
  vlCveMedio := sgcDATOS.CellStr['CVE_MEDIO', sgcDATOS.SG.Row];
  vlImpCredito := sgcDATOS.CellStr['IMP_CREDITO', sgcDATOS.SG.Row];
  vlBConsultaDoc:= sgcDATOS.CellStr['B_CONSULTA_DOC', sgcDATOS.SG.Row];
  Continua := True;

  //Se valida que la solicitud no este asociada con un crédito
  vlSQL := ' SELECT ID_CREDITO FROM CR_CREDITO ' +
           ' WHERE ID_SOLICITUD = ' + vlIdSolicitud +
           '   AND CVE_MEDIO = ''' + vlCveMedio + '''';
  qyQuery:= GetSQLQuery(vlSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
  try
    If qyQuery <> Nil Then
    Begin
         ShowMessage ('La solicitud ya está asociada a una disposición.');
         Continua := False;
    End;
  finally
    qyQuery.Free;
  end;

  If Continua then
  begin
    try
       Relacion:= TCrRelDisp.Create(Self);
       Relacion.Apli:= Objeto.Apli;
       Relacion.vgIdSolWeb:= StrToInt(vlIdSolicitud);
       Relacion.vgIdContratoWeb:= StrToInt(vlIdContratoLinea);
       Relacion.vgCveMedio :=  vlCveMedio;
       Relacion.vgImpCredito := StrToFloat(quitacomas(trim(vlImpCredito)));
       Relacion.vgBConsultaDoc := vlBConsultaDoc;
       Relacion.ParamCre:= Objeto.ParamCre;
       Relacion.Nuevo;
    finally
       Relacion.Free;
    end;
    MuestraDatos;
  end;
end;

function TWCrMonDisp.QuitaComas(PPCadena: String): String;
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

   try
      QuitaComas:=vlRenglon;
   except
      QuitaComas:='0' ;
   end ;
end;

end.
