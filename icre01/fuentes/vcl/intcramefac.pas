// Sistema         : Clase de CRAMEFAC
// Fecha de Inicio : 15/06/2003
// Función forma   : Clase de CRAMEFAC
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrAmefac;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit,IntGenCre,

    IntParamCre, IntCrDesMot;
const
   CPESOS   = '484';
   CTA_1305 = '1305';
   cMesesName : array [1..12] of shortstring =
     ('Enero', 'Febrero', 'Marzo', 'Abril',
      'Mayo','Junio','Julio','Agosto',
      'Septiembre','Octubre','Noviembre','Diciembre');

   cMesesNum : array [1..12] of shortstring =
     ('01','02','03','04',
      '05','06','07','08',
      '09','10','11','12');
Type
 TCrAmefac= class;

  TWCrAmefac=Class(TForm)
    InterForma1             : TInterForma;
    Label1: TLabel;
    lblLoad: TLabel;
    edF_MES: TEdit;
    dtpF_MES: TInterDateTimePicker;
    btGENERA: TBitBtn;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    SaveDialog1: TSaveDialog;
    ProgressBar: TProgressBar;
    GroupBox1: TGroupBox;
    chINF_MENSUAL: TCheckBox;
    Label5: TLabel;
    edDIR_INFMENSUAL: TEdit;
    btDIR_INFMENSUAL: TBitBtn;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label2: TLabel;
    edEMP_DIRECTOS: TInterEdit;
    edEMP_INDIRECTOS: TInterEdit;
    GroupBox3: TGroupBox;
    chINF_VENCIDA: TCheckBox;
    edDIR_INFVENCIDA: TEdit;
    btDIR_INFVENCIDA: TBitBtn;
    Label4: TLabel;
    SaveDialog2: TSaveDialog;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure btDIR_INFMENSUALClick(Sender: TObject);
    procedure btDIR_INFVENCIDAClick(Sender: TObject);
    procedure chINF_MENSUALClick(Sender: TObject);
    procedure chINF_VENCIDAClick(Sender: TObject);
    procedure btGENERAClick(Sender: TObject);
    procedure edEMP_DIRECTOSExit(Sender: TObject);
    procedure edEMP_INDIRECTOSExit(Sender: TObject);
    private
    { Private declarations }
      F2          : TextFile;
      vgMes       : String;
      vgPeriodo   : String;
      vgAnio      : String;
      vgIniAnio   : String;
      vgFFinMes   : String;
      vgStatus    : String;
      vgDiasMes   : String;

      procedure   GeneraFile;
      procedure   ObtenDatos;
      procedure   ObtenDatosVencida;
      function    CadenaSql: String;
      function    CadenaSql2: String;
      Function    ObtenFFinMesHabil: TDateTime;
      Procedure   Status;
    public
    { Public declarations }
    Objeto : TCrAmefac;
end;
 TCrAmefac= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        F_MES                      : TInterCampo;
        F_INI_MES                  : TInterCampo;
        F_FIN_MES                  : TInterCampo;

        ParamCre                 : TParamCre;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrAmefac.Create( AOwner : TComponent );
begin Inherited;
      F_MES :=CreaCampo('F_MES',ftDate,tsNinguno,tsNinguno,false);
      F_INI_MES :=CreaCampo('F_INI_MES',ftDate,tsNinguno,tsNinguno,false);
      F_FIN_MES :=CreaCampo('F_FIN_MES',ftDate,tsNinguno,tsNinguno,false);

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrAmefac.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrAmefac.Destroy;
begin inherited;
end;


function TCrAmefac.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrAmefac;
begin
   W:=TWCrAmefac.Create(Self);
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

(***********************************************FORMA CRAMEFAC********************)
(*                                                                              *)
(*  FORMA DE CRAMEFAC                                                            *)
(*                                                                              *)
(***********************************************FORMA CRAMEFAC********************)
function TWCrAmefac.CadenaSql: String;
var vlsql  :String;
begin
   vlsql := ' SELECT VF.IMP_ACUM, ' + coCRLF +
            '        PROM.PROM_CP_MES, ' + coCRLF +
            '        SDO.SALDOS_ANTICIPO, ' + coCRLF +
            '        NC.NUM_CEDENTES, ' + coCRLF +
            '        NE.NUM_CLIENTES, ' + coCRLF +
            '        0 FACT_RECURSOS, ' + coCRLF +
            '        NF.FACT_SIN_RECURSOS ' + coCRLF +
            ' FROM ( -- 1 VOLUMEN ACUMULADO' + coCRLF +
            '        SELECT NVL(ROUND(SUM(IMP_CAP_PESOS),2),0) IMP_ACUM' + coCRLF +
            '        FROM (' + coCRLF +
            '               SELECT NVL(CC.IMP_CAPITAL,0) *' + coCRLF +
            '                      NVL(PKGCORPO.OBTTIPOCAMBIO(PKGCRCOMUN.STPOBTENFECHA(2,''FMAN''),' + coCRLF +
            '                      C.CVE_MONEDA,''V'' ), 1 )  IMP_CAP_PESOS' + coCRLF +
            '               FROM ( SELECT * FROM CR_CREDITO' + coCRLF +
            '                      WHERE F_AUTORIZA BETWEEN  ' + SQLFecha( StrToDateTime(  vgIniAnio ) ) + ' AND ' +
                                                                SQLFecha( Objeto.F_FIN_MES.AsDateTime ) + coCRLF +
            '                      AND SIT_CREDITO  <> ''CA''' + coCRLF +
            '                    ) CR, CR_CESION CS,' + coCRLF +
            '                    CR_CAPITAL CC,' + coCRLF +
            '                    CONTRATO   C' + coCRLF +
            '               WHERE CS.ID_CESION  = CR.ID_CREDITO' + coCRLF +
            '               AND   CC.ID_CREDITO = CS.ID_CESION' + coCRLF +
            '               AND   C.ID_CONTRATO = CR.ID_CONTRATO' + coCRLF +
            '             )' + coCRLF +
            '      )VF, ' + coCRLF +


            '      ( --3 SALDOS DE ANTICIPO' + coCRLF +
            '        SELECT NVL(ROUND(PA.PROM_CP_MES - PI.PROM_INT - PG.PROM_AFORO_GAR,2),0) PROM_CP_MES ' + coCRLF +
            '        FROM (--PROMEDIO DE CAPITAL DEL MES ' + coCRLF + //     --Promedio de Capital del mes
            '               SELECT SUM(CAP.IMP_MES)/' + vgDiasMes + ' PROM_CP_MES ' + coCRLF +
            '               FROM ( ' + coCRLF +
            '                     SELECT NVL(CHC.SDO_INSOLUTO,0) * ' + coCRLF +
            '                            NVL(PKGCORPO.OBTTIPOCAMBIO(PKGCRCOMUN.STPOBTENFECHA(2,''FMAN''), ' + coCRLF +
            '                                                       C.CVE_MONEDA,''V'' ), 1 )  IMP_MES ' + coCRLF +
            '                     FROM ( SELECT CR.* FROM CR_CREDITO CR, CR_CESION CS ' + coCRLF +
            '                            WHERE CS.ID_CESION = CR.ID_CREDITO) CR, ' + coCRLF +
            '                          ( SELECT * FROM CR_HISTO_CRED ' + coCRLF +
            '                            WHERE F_CIERRE BETWEEN ' + SQLFecha(Objeto.F_INI_MES.AsDateTime) + ' AND ' +
                                                                    SQLFecha(Objeto.F_FIN_MES.AsDateTime) + coCRLF +
            '                          ) CHC, CONTRATO   C ' + coCRLF +
            '                     WHERE CHC.ID_CREDITO = CR.ID_CREDITO  ' + coCRLF +
            '                     AND   C.ID_CONTRATO  = CR.ID_CONTRATO ' + coCRLF +
            '                    )CAP ' + coCRLF +
            '             ) PA,'+ coCRLF +


            '             ( --PROMEDIO DE INTERES COBRADOS POR ANTICIPADOS DEL MES ' + coCRLF +
            '               SELECT ROUND(NVL(SUM(ICA.IMP_INT_COB_ANT),0)/' + vgDiasMes + ',2) PROM_INT ' + coCRLF +
            '               FROM ( ' + coCRLF +
            '                     SELECT NVL(CT.IMP_NETO,0) * ' + coCRLF +
            '                            NVL(PKGCORPO.OBTTIPOCAMBIO(PKGCRCOMUN.STPOBTENFECHA(2,''FMAN''), ' + coCRLF +
            '                                           CTO.CVE_MONEDA,''V'' ), 1 )  IMP_INT_COB_ANT ' + coCRLF +
            '                     FROM ( SELECT * FROM CR_TRANSACCION ' + coCRLF +
            '                            WHERE CVE_OPERACION in (''PAGOII'', ''PAGOIN'') ' + coCRLF +
            '                            AND ( SIT_TRANSACCION = ''AC'' AND ID_TRANS_CANCELA IS NULL) ' + coCRLF +
            '                            AND F_OPERACION BETWEEN ' + SQLFecha(Objeto.F_INI_MES.AsDateTime) + ' AND ' +
                                                                     SQLFecha(Objeto.F_FIN_MES.AsDateTime) + coCRLF +
            '                          ) CT, CONTRATO CTO ' + coCRLF +
            '                     WHERE CTO.ID_CONTRATO = CT.ID_CONTRATO ' + coCRLF +
            '                    )ICA ' + coCRLF +
            '             ) PI,'+ coCRLF +

            '             ( --PROMEDIO DE AFOROS EN GARANTÍA DEL MES ' + coCRLF +
            '               SELECT ROUND(NVL(SUM(AG.AFORO_GARANTIA),0)/ ' + vgDiasMes + ' ,2) PROM_AFORO_GAR ' + coCRLF +
            '               FROM (' + coCRLF +
            '                      SELECT ( CD.IMP_NOMINAL - CC.IMP_CAPITAL ) *' + coCRLF +
            '                             NVL(PKGCORPO.OBTTIPOCAMBIO(PKGCRCOMUN.STPOBTENFECHA(2,''FMAN''),' + coCRLF +
            '                                                    CTO.CVE_MONEDA,''V'' ), 1) AFORO_GARANTIA' + coCRLF +
            '                      FROM ( SELECT * FROM CR_CREDITO' + coCRLF +
            '                             WHERE F_AUTORIZA BETWEEN ' + SQLFecha(Objeto.F_INI_MES.AsDateTime) + ' AND ' +
                                                                       SQLFecha(Objeto.F_FIN_MES.AsDateTime) + coCRLF +
            '                             AND   SIT_CREDITO <> ''CA''' + coCRLF +
            '                           )CR, CR_DOCUMENTO CD, CR_CAPITAL CC, CONTRATO CTO' + coCRLF +
            '                      WHERE CD.ID_CESION    = CR.ID_CREDITO' + coCRLF +
            '                      AND CC.ID_CREDITO     = CR.ID_CREDITO' + coCRLF +
            '                      AND CC.NUM_PERIODO    = CD.NUM_PERIODO_DOC' + coCRLF +
            '                      AND   CTO.ID_CONTRATO = CR.ID_CONTRATO' + coCRLF +
            '                      AND (CD.IMP_NOMINAL - CC.IMP_CAPITAL) <> 0' + coCRLF +
            '                     )AG' + coCRLF +
            '             )PG'+ coCRLF +
            '      ) PROM,'+ coCRLF +


            '      ( --3 SALDOS DE ANTICIPO' + coCRLF +
            '        SELECT NVL(ROUND(PV.SDO_VDO_FIN_MES  + PA.CAP_FIN_MES - PI.INT_FIN_MES - AFORO_GAR_FIN_MES ,2),0) SALDOS_ANTICIPO'+ coCRLF +

            '        FROM ( --SALDO DEL IMPORTE VENCIDO A FIN DE MES' + coCRLF +
            '               SELECT ROUND(SUM(SDO_CAP_VDO),2) SDO_VDO_FIN_MES '+ coCRLF +
            '               FROM ('+ coCRLF +
            '                      SELECT CHC.IMP_CAPITAL_VDO *'+ coCRLF +
            '                             NVL(PKGCORPO.OBTTIPOCAMBIO(PKGCRCOMUN.STPOBTENFECHA(2,''FMAN''),'+ coCRLF +
            '                                                       CTO.CVE_MONEDA,''V'' ), 1) SDO_CAP_VDO'+ coCRLF +
            '                      FROM CR_CREDITO CR, CR_HISTO_CRED CHC, CONTRATO CTO'+ coCRLF +
            '                      WHERE F_CIERRE = ' + SQLFecha(StrToDateTime(vgFFinMes)) + coCRLF +
            '                      AND CHC.ID_CREDITO = CR.ID_CREDITO'+ coCRLF +
            '                      AND CTO.ID_CONTRATO = CR.ID_CONTRATO'+ coCRLF +
            '                    )'+ coCRLF +
            '             ) PV,'+ coCRLF +

            '             ( --SALDO CAPITAL FIN DE MES' + coCRLF +

            '               SELECT ROUND(SUM(CAP_FIN_MES),2) CAP_FIN_MES'+ coCRLF +
            '               FROM ('+ coCRLF +
            '                     SELECT CHC.SDO_VIG_TOTAL *'+ coCRLF +
            '                            NVL(PKGCORPO.OBTTIPOCAMBIO(PKGCRCOMUN.STPOBTENFECHA(2,''FMAN''),'+ coCRLF +
            '                            CTO.CVE_MONEDA,''V'' ), 1) CAP_FIN_MES'+ coCRLF +
            '                     FROM ( SELECT * FROM CR_CREDITO )CR,'+ coCRLF +
            '                          ( SELECT * FROM CR_HISTO_CRED '+ coCRLF +
            '                            WHERE F_CIERRE = ' + SQLFecha(StrToDateTime(vgFFinMes)) + coCRLF +
            '                          ) CHC, CR_CESION CS, CONTRATO CTO'+ coCRLF +
            '                     WHERE CHC.ID_CREDITO = CR.ID_CREDITO'+ coCRLF +
            '                     AND   CHC.ID_CREDITO = CS.ID_CESION'+ coCRLF +
            '                     AND  CTO.ID_CONTRATO = CR.ID_CONTRATO'+ coCRLF +
            '                    )CAP '+ coCRLF +
            '             ) PA,'+ coCRLF +

            '             (--SALDO DE INTERESES COBRADOS POR ANTICIPADO A FIN DE MES' + coCRLF +
            '               SELECT ROUND(SUM(INT_FIN_MES),2) INT_FIN_MES' + coCRLF +
            '               FROM (' + coCRLF +
            '                     SELECT CHC.IMP_INTERES_PAG *' + coCRLF +
            '                            NVL(PKGCORPO.OBTTIPOCAMBIO(PKGCRCOMUN.STPOBTENFECHA(2,''FMAN''),' + coCRLF +
            '                                                       CTO.CVE_MONEDA,''V'' ), 1) INT_FIN_MES' + coCRLF +
            '                     FROM ( SELECT * FROM CR_CREDITO )CR,' + coCRLF +
            '                          ( SELECT * FROM CR_HISTO_CRED' + coCRLF +
            '                            WHERE F_CIERRE =  ' + SQLFecha(StrToDateTime(vgFFinMes)) + coCRLF +
            '                          ) CHC, CR_CESION CS, CONTRATO CTO' + coCRLF +
            '                     WHERE CHC.ID_CREDITO  = CR.ID_CREDITO' + coCRLF +
            '                     AND   CHC.ID_CREDITO  = CS.ID_CESION' + coCRLF +
            '                     AND   CTO.ID_CONTRATO = CR.ID_CONTRATO' + coCRLF +
            '                    )' + coCRLF +
            '             ) PI,'+ coCRLF +

            '             ( --SALDO DE AFOROS EN GARANTÍA A FIN DE MES'+ coCRLF +
            '               SELECT NVL(ROUND( SUM( ( CD.IMP_NOMINAL * '+ coCRLF +
            '                      NVL(PKGCORPO.OBTTIPOCAMBIO (PKGCRCOMUN.STPOBTENFECHA(2,''FMAN''), '+ coCRLF +
            '                      C.CVE_MONEDA,''V'' ), 1)) - ( PKGCRPERIODO.ObtenImpAforo(CD.Imp_Nominal,CD.TASA_AFORO)* '+ coCRLF +
            '                      NVL(PKGCORPO.OBTTIPOCAMBIO (PKGCRCOMUN.STPOBTENFECHA(2,''FMAN''), '+ coCRLF +
            '                      C.CVE_MONEDA,''V'' ), 1))),2),0) AFORO_GAR_FIN_MES '+ coCRLF +
            '               FROM CR_CREDITO CR, CONTRATO C, CR_DOCUMENTO CD '+ coCRLF +
            '               WHERE CR.F_AUTORIZA = ' + SQLFecha(StrToDateTime(vgFFinMes)) + coCRLF +
            '               AND CD.SIT_DOCUMENTO IN (''AC'',''LQ'') '+ coCRLF +
            '               AND CR.SIT_CREDITO IN (''AC'',''LQ'') '+ coCRLF +
            '               AND C.ID_CONTRATO = CR.ID_CONTRATO '+ coCRLF +
            '               AND CD.ID_CESION = CR.ID_CREDITO '+ coCRLF +
            '             )PG'+ coCRLF +
            '      )SDO, ' + coCRLF +


            '      ( ' + coCRLF +
            '        SELECT COUNT(*) NUM_CEDENTES ' + coCRLF +
            '        FROM ( ' + coCRLF +
            '               SELECT ID_PROVEEDOR ' + coCRLF +
            '               FROM CR_CESION ' + coCRLF +
            '               WHERE F_AUTORIZA BETWEEN ' + SQLFecha(Objeto.F_INI_MES.AsDateTime) + ' AND ' +
                                                         SQLFecha(Objeto.F_FIN_MES.AsDateTime) + coCRLF +
            '               AND SIT_CESION <> ' + SQLStr(CSIT_CA) + coCRLF +
            '               GROUP BY ID_PROVEEDOR) ' + coCRLF +
            '      )NC, ' + coCRLF +
            '      ( '  + coCRLF + // --NUMERO DE CLIENTES
            '        SELECT COUNT(*) NUM_CLIENTES' + coCRLF +
            '        FROM ( ' + coCRLF +
            '               SELECT ID_EMISOR' + coCRLF +
            '               FROM CR_CESION' + coCRLF +
            '               WHERE F_AUTORIZA BETWEEN ' + SQLFecha(Objeto.F_INI_MES.AsDateTime) + ' AND ' +
                                                         SQLFecha(Objeto.F_FIN_MES.AsDateTime) + coCRLF +
            '               AND SIT_CESION <> ' + SQLStr(CSIT_CA) + coCRLF +
            '               GROUP BY ID_EMISOR)' + coCRLF +
            '      )NE, ' + coCRLF +
            '      ( ' + coCRLF +// MONTO DE OPERACIONES DEL MES DE DD
            '        SELECT NVL(ROUND(( SUM(PKGCRPERIODO.ObtenImpAforo(CD.Imp_Nominal, ' + coCRLF +
            '                     CD.TASA_AFORO) * NVL(PKGCORPO.OBTTIPOCAMBIO (PKGCRCOMUN.STPOBTENFECHA(2,''FMAN''),' + coCRLF +
            '                     C.CVE_MONEDA,''V'' ), 1 ))),2),0) FACT_SIN_RECURSOS ' + coCRLF +
            '        FROM CR_CREDITO   CR,CR_DOCUMENTO CD, CONTRATO     C ' + coCRLF +
            '        WHERE CR.F_AUTORIZA BETWEEN  ' + SQLFecha(Objeto.F_INI_MES.AsDateTime) + ' AND ' +
                                                      SQLFecha(Objeto.F_FIN_MES.AsDateTime) + coCRLF +
            '        AND CD.SIT_DOCUMENTO NOT IN ( ''CA'',''NA'')' + coCRLF +
            '        AND CR.SIT_CREDITO IN ( ''AC'',''LQ'',''IM'')' + coCRLF +
            '        AND CD.ID_CESION = CR.ID_CREDITO ' + coCRLF +
            '        AND C.ID_CONTRATO = CR.ID_CONTRATO ' + coCRLF +
            '      )NF'  + coCRLF;

   CadenaSql := vlsql;
end;

procedure TWCrAmefac.FormShow(Sender: TObject);
begin
   //PINTA DATOS DEL PANEL INFERIOR
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;
   Objeto.F_MES.Control := edF_MES;
end;

procedure TWCrAmefac.FormDestroy(Sender: TObject);
begin
   Objeto.F_MES.Control := nil;
end;

procedure TWCrAmefac.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrAmefac.InterForma1DespuesShow(Sender: TObject);
begin
   Objeto.F_MES.AsDateTime := Objeto.Apli.DameFechaEmpresa;
   edEMP_DIRECTOS.Text := '0';
   edEMP_INDIRECTOS.Text := '0';
end;

procedure TWCrAmefac.btDIR_INFMENSUALClick(Sender: TObject);
begin
 SaveDialog1.InitialDir := 'C:\';
 If SaveDialog1.Execute Then
  Begin
     edDIR_INFMENSUAL.Text := SaveDialog1.FileName;
     ProgressBar.Position := 0;
     btDIR_INFMENSUAL.Enabled := True;
     If btDIR_INFMENSUAL.CanFocus Then
        btDIR_INFMENSUAL.SetFocus;
  End;
end;

procedure TWCrAmefac.btDIR_INFVENCIDAClick(Sender: TObject);
begin
 SaveDialog2.InitialDir := 'C:\';
 If SaveDialog2.Execute Then
  Begin
     edDIR_INFVENCIDA.Text := SaveDialog2.FileName;
     ProgressBar.Position := 0;
     btDIR_INFMENSUAL.Enabled := True;
     If btDIR_INFVENCIDA.CanFocus Then
        btDIR_INFVENCIDA.SetFocus;
  End;
end;

procedure TWCrAmefac.chINF_MENSUALClick(Sender: TObject);
begin
   if chINF_MENSUAL.Checked then
   Begin
      edEMP_DIRECTOS.Enabled := True;
      edEMP_DIRECTOS.Color := clWindow;
      edEMP_INDIRECTOS.Enabled := True;
      edEMP_INDIRECTOS.Color := clWindow;
      btDIR_INFMENSUAL.Enabled :=True;
      edEMP_DIRECTOS.SetFocus;
   end
   else
   Begin
      edEMP_DIRECTOS.Enabled := False;
      edEMP_DIRECTOS.Color := clBtnFace;
      edEMP_INDIRECTOS.Enabled := False;
      edEMP_INDIRECTOS.Color := clBtnFace;
      btDIR_INFMENSUAL.Enabled :=False;
   end
end;

procedure TWCrAmefac.chINF_VENCIDAClick(Sender: TObject);
begin
   if chINF_VENCIDA.Checked then
      btDIR_INFVENCIDA.Enabled :=True
   else
      btDIR_INFVENCIDA.Enabled :=False;
end;

procedure TWCrAmefac.GeneraFile;
var vlMsg: String;
begin
  If chINF_MENSUAL.Checked Then
     begin
          If Savedialog1.filename <> '' then
            begin
              AssignFile(F2, Savedialog1.FileName);
              Rewrite(F2);
              Write(F2, 'INFORMACION MENSUAL PARA AMEFAC ' + #13#10);
              ProgressBar.Position := ProgressBar.Position + 10;
              Write(F2, 'INDICADORES FINANCIEROS ' + #9 +
                        'Volumen de Financiamiento Acumulado (Miles de Pesos)'  + #9 +
                        'Promedio de Anticipos'                                 + #9 +
                        'Saldo de Anticipos'                                    + #9 +
                        'Número de Cedentes'                                    + #9 +
                        'Número de Clientes'                                    + #9 +
                        'Factoraje con Recursos'                                + #9 +
                        'Factoraje sin Recursos'                                + #9 +
                        'Empleados Directos'                                    + #9 +
                        'Empleados Indirectos'                                  + #13#10);
              ProgressBar.Position := ProgressBar.Position + 10;
              ObtenDatos;
              CloseFile(F2);
              ProgressBar.Position := 100;
              ShowMessage('Archivo Informe Mensual Generado');
          end;
  end;
  If chINF_VENCIDA.Checked Then
     begin
       ProgressBar.Position := 0;
          If Savedialog2.filename <> '' then
            begin
              AssignFile(F2, Savedialog2.FileName);
              Rewrite(F2);
              Write(F2, 'INFORMACION MENSUAL PARA AMEFAC ' + #13#10);
              ProgressBar.Position := ProgressBar.Position + 10;
              Write(F2, 'CARTERA VENCIDA DEL MES '+ #13#10);
              ProgressBar.Position := ProgressBar.Position + 10;
              Write(F2, 'RFC'                     + #9 + #9 +
                        'Nombre de la Empresa'    + #9 + #9 +
                        'Estatus'                 + #9 + #9 +
                        'Montos (Miles de Pesos)' + #9 + #9 +
                        'Entidad Federativa'      + #13#10);
              ProgressBar.Position := ProgressBar.Position + 10;
              ObtenDatosVencida;
              Write(F2, 'Nombre del Responsable: ' + #13#10);
              CloseFile(F2);
              ProgressBar.Position := 100;
              ShowMessage('Archivo Vencida Generado');
          end;
  end;
end;

procedure TWCrAmefac.btGENERAClick(Sender: TObject);
var i, n : integer;
    vlDiasMes : String;
    vlDias : integer;
begin
   vgPeriodo := Copy(edF_MES.Text,4,2);
   vgAnio    := Copy(edF_MES.Text,7,4);
   vgIniAnio := '01/01/' + vgAnio;
   n:= 13;
   for i:= 1 to n do
   Begin
      if vgPeriodo = cMesesNum[n] then
         vgMes := cMesesName[n];
      n:= n-1;
   end;

   Objeto.F_INI_MES.AsDateTime := DameIniMes(StrToDateTime(edF_MES.Text));//funcion generica
   Objeto.F_FIN_MES.AsDateTime := DameFinMes(StrToDateTime(edF_MES.Text)); //funcion generica
   vgFFinMes := DateTimeToStr(Objeto.F_FIN_MES.AsDateTime);
   vgFFinMes := DateTimeToStr(ObtenFFinMesHabil);

   vLDias := 0;
   vlDiasMes := Copy(Objeto.F_FIN_MES.AsString,1,2);
   for i:= 1 to StrToInt(vlDiasMes) do
   Begin
         vlDias := vlDias + 1;
   end;

   vgDiasMes := IntToStr(vlDias);
//   vgDiasMes := Copy(edF_MES.Text,1,2);
   IF (chINF_MENSUAL.Checked) or (chINF_VENCIDA.Checked) then
      GeneraFile;
end;

procedure TWCrAmefac.ObtenDatos;
var vlSql   : String;
    Q       : TQuery;
    vlSalida: Boolean;
begin
   vlSql := CadenaSql;
   Begin
      Q := TQuery.Create(Self);
      Try
        Q.SessionName := Objeto.SessionName;
        Q.DataBaseName := Objeto.DataBaseName;
        Q.SQL.Clear;
        Q.SQL.Add(vlsql);
        Q.Open;
        While Not Q.Eof Do
  	BEGIN
           Write(F2,vgMes+ #9 +
                    FormatFloat('###,###,###,###,###,##0.00',Q.FieldByName('IMP_ACUM').AsFloat) +#09+
                    FormatFloat('###,###,###,###,###,##0.00',Q.FieldByName('PROM_CP_MES').AsFloat) +#09+
		    FormatFloat('###,###,###,###,###,##0.00',Q.FieldByName('SALDOS_ANTICIPO').AsFloat) +#09+
		    Q.FieldByName('NUM_CEDENTES').AsString+ #9 +
		    Q.FieldByName('NUM_CLIENTES').AsString+ #9 +
		    FormatFloat('###,###,###,###,###,##0.00',Q.FieldByName('FACT_RECURSOS').AsFloat) +#09+
		    FormatFloat('###,###,###,###,###,##0.00',Q.FieldByName('FACT_SIN_RECURSOS').AsFloat) +#09+
                    edEMP_DIRECTOS.Text+ #9 +
                    edEMP_INDIRECTOS.Text+ #13#10);
           ProgressBar.Position := ProgressBar.Position + 50;
           Q.Next;
        end;
      Finally
        If Assigned(Q) Then
        Begin
             Q.Close;
             Q.Free;
        End;
   end; //end Try finally
end;
end;

Function TWCrAmefac.ObtenFFinMesHabil : TDateTime;
var vlFFinMes : Integer;
    vlFHabil  : TDateTime;
begin
   vlFHabil := Objeto.F_FIN_MES.AsDateTime;
   vlFFinMes := ValidaFecha (vlFHabil,Objeto.Apli);
   while vlFFinMes = 1 do
   Begin
       vlFHabil := vlFHabil - 1;
       if ValidaFecha (vlFHabil,Objeto.Apli) <> 1 then
          vlFFinMes := 0;
       //end if
   end;
   ObtenFFinMesHabil := vlFHabil;
end;

procedure TWCrAmefac.edEMP_DIRECTOSExit(Sender: TObject);
begin
   if edEMP_DIRECTOS.Text = '' then edEMP_DIRECTOS.Text := '0';
end;

procedure TWCrAmefac.edEMP_INDIRECTOSExit(Sender: TObject);
begin
   if edEMP_INDIRECTOS.Text = '' then edEMP_INDIRECTOS.Text := '0';
end;

procedure TWCrAmefac.ObtenDatosVencida;
var vlSql   : String;
    Q       : TQuery;
    vlSalida: Boolean;
begin
   vlSql := CadenaSql2;
   Begin
      Q := TQuery.Create(Self);
      Try
        Q.SessionName := Objeto.SessionName;
        Q.DataBaseName := Objeto.DataBaseName;
        Q.SQL.Clear;
        Q.SQL.Add(vlSql);
        Q.Open;
        While Not Q.Eof Do
  	BEGIN
           if Q.FieldByName('MONTO').AsFloat <> 0 then
           Begin
              if MessageDlg('Introduzca el Status del Emsior : '+ Q.FieldByName('NOMBRE').AsString,
                             mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                  Status;
              //END IF;

              Write(F2,Q.FieldByName('SIGLAS_RFC').AsString+ #9 + #9 +
       		       Q.FieldByName('NOMBRE').AsString+ #9 + #9 +
  		       vgStatus + #9 + #9 +
		       FormatFloat('###,###,###,###,###,##0.00',Q.FieldByName('MONTO').AsFloat) + #9 + #9 +
		       Q.FieldByName('ENT_FED').AsString+ #13#10);
              ProgressBar.Position := ProgressBar.Position + 2;
           end;
           Q.Next;
        end;
      Finally
        If Assigned(Q) Then
        Begin
             Q.Close;
             Q.Free;
        End;
   ProgressBar.Position := 50;
   end; //end Try finally
end;
end;

function TWCrAmefac.CadenaSql2: String;
var vlsql: String;
begin

   vlsql := ' SELECT R.SIGLAS_RFC, '+ coCRLF +
            '        P.NOMBRE, '+ coCRLF +
            '        ROUND(SUM(SDO_CAP_VDO),2) MONTO, '+ coCRLF +
            '        PO.DESC_POBLACION ENT_FED '+ coCRLF +
            ' FROM(  SELECT CHC.IMP_CAPITAL_VDO * '+ coCRLF +
            '               NVL(PKGCORPO.OBTTIPOCAMBIO(PKGCRCOMUN.STPOBTENFECHA(2,''FMAN''), '+ coCRLF +
            '                                           CTO.CVE_MONEDA,''V'' ), 1) SDO_CAP_VDO, '+ coCRLF +
            '               CS.ID_EMISOR, CR.ID_CREDITO '+ coCRLF +
            '        FROM ( SELECT * FROM CR_CREDITO WHERE SIT_CREDITO <> ''CA'') CR, '+ coCRLF +
            '             ( SELECT * FROM CR_CESION WHERE SIT_CESION <> ''CA'') CS, '+ coCRLF +
            '              CR_HISTO_CRED CHC, CONTRATO CTO '+ coCRLF +
            '        WHERE F_CIERRE BETWEEN  ' + SQLFecha(Objeto.F_INI_MES.AsDateTime) + ' AND ' +
                                                 SQLFecha( Objeto.F_FIN_MES.AsDateTime ) + coCRLF +
            '        AND CS.ID_CESION    = CR.ID_CREDITO '+ coCRLF +
            '        AND CHC.ID_CREDITO  = CR.ID_CREDITO '+ coCRLF +
            '        AND CTO.ID_CONTRATO = CR.ID_CONTRATO '+ coCRLF +
            '     ) SV, '+ coCRLF +
            '     RFC R, '+ coCRLF +
            '     PERSONA P, '+ coCRLF +
            '     POBLACION PO, '+ coCRLF +
            '     DOMICILIO D '+ coCRLF +
            ' WHERE SV.ID_CREDITO    = SV.ID_CREDITO '+ coCRLF +
            ' AND R.ID_PERSONA     = SV.ID_EMISOR '+ coCRLF +
            ' AND P.ID_PERSONA     = R.ID_PERSONA '+ coCRLF +
            ' AND PO.CVE_POBLACION = D.CVE_ESTADO '+ coCRLF +
            ' AND D.ID_DOMICILIO   = P.ID_DOMICILIO '+ coCRLF +
            ' GROUP BY R.SIGLAS_RFC, P.NOMBRE, PO.DESC_POBLACION '+ coCRLF +
            ' ORDER BY R.SIGLAS_RFC, P.NOMBRE '+ coCRLF;

   CadenaSql2:= vlsql;
end;

Procedure TWCrAmefac.Status;
var   CrStatus : TCrDesMot;
begin
   CrStatus := TCrDesMot.Create(Self);
   Try
      CrStatus.lbDescMotivo.Caption := 'Estatus del Emisor';
      if CrStatus.ShowModal = mrOk then
      Begin
         vgStatus := CrStatus.meTX_MOTIVO.Text;
      end;
   finally
      CrStatus.Free;
   end;
end;

end.


