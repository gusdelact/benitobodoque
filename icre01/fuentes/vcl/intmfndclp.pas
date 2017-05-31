// Sistema         : Clase de TMFndCLP
// Fecha de Inicio : 13/06/2014
// Función forma   : Clase de TMFndCLP
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     : ROIM / ROUY
Unit IntMFndCLP;
interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,
Math,

//Unidades Adicionales
IntParamCre,      //Parámetros de Crédito
Intempre,         //Empresa
IntUnNeg,         //Unidad Negocio/Suc
IntMInstDesc,     //Entidad Descontadora
IntMQrFndCLP,     //Reporte de Pasivo Corto y Largo Plazo
IntSGCtrl,
IntGenCre
;

Type
 TMFndCLP= class;

  TwMFndCLP=Class(TForm)
    InterForma1             : TInterForma;
    lbAplica: TLabel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    cbxArchivo: TCheckBox;
    edNbrArch: TEdit;
    sbExcel: TSpeedButton;
    SaveDialog1: TSaveDialog;
    gbControl: TGroupBox;
    Label8: TLabel;
    lbICveRequisito: TLabel;
    EdIDSucursal: TEdit;
    BBSucursal: TBitBtn;
    EdDescSucursal: TEdit;
    CBSucursal: TCheckBox;
    EdIdEmpresa: TEdit;
    bbEmpresa: TBitBtn;
    edNombreEmpresa: TEdit;
    ilEmpresa: TInterLinkit;
    ILSucursal: TInterLinkit;
    Label9: TLabel;
    edCVE_FND_ENT_DES: TEdit;
    btCVE_FND_ENT_DES: TBitBtn;
    edNOM_FND_ENT_DES: TEdit;
    cbxCVE_FND_ENT_DES: TCheckBox;
    ilCVE_FND_ENT_DES: TInterLinkit;
    rgGenerarArchivo: TRadioGroup;
    sgcData: TSGCtrl;
    bConsulta: TButton;
    edF_Inicio: TEdit;
    dtpF_Inicio: TInterDateTimePicker;
    Label1: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure sbExcelClick(Sender: TObject);
    procedure edNbrArchChange(Sender: TObject);
    procedure cbxArchivoClick(Sender: TObject);
    procedure bbEmpresaClick(Sender: TObject);
    procedure BBSucursalClick(Sender: TObject);
    procedure ilEmpresaEjecuta(Sender: TObject);
    procedure ILSucursalEjecuta(Sender: TObject);
    procedure CBSucursalClick(Sender: TObject);
    procedure edCVE_FND_ENT_DESExit(Sender: TObject);
    procedure btCVE_FND_ENT_DESClick(Sender: TObject);
    procedure ilCVE_FND_ENT_DESEjecuta(Sender: TObject);
    procedure ilCVE_FND_ENT_DESCapture(Sender: TObject; var Show: Boolean);
    procedure cbxCVE_FND_ENT_DESClick(Sender: TObject);
    procedure bConsultaClick(Sender: TObject);

    procedure ConsultaPasivoCLP(BConsulta: Boolean);

    private
    { Private declarations }
        Procedure ImprimeReporte(bPreview:Boolean);
     Procedure AsignaEmpresaSuc;
    public
    { Public declarations }
    Objeto : TMFndCLP;

    VGSQLGenCons         : String;
end;
 TMFndCLP= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
       public
        { Public declarations }
        ParamCre                 : TParamCre;
        UnidadNegocio            : TUnNegocio;
        Empresa                  : TEmpresa;
        MInstDesc                : TMInstDesc;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;

implementation
{$R *.DFM}

constructor TMFndCLP.Create( AOwner : TComponent );
begin Inherited;
   Empresa := TEmpresa.Create(Self);
   UnidadNegocio := TUnNegocio.Create(Self);

   MInstDesc := TMInstDesc.Create(Self);
   MInstDesc.MasterSource:=Self;
   MInstDesc.FieldByName('CVE_FND_ENT_DES').MasterField:='CVE_FND_ENT_DES';

   UseQuery := False;
   HelpFile := 'InTMFndCLP.Hlp';
   ShowMenuReporte:=True;
end;

Destructor TMFndCLP.Destroy;
begin
   If Empresa <> Nil Then
      Empresa.free;
   If UnidadNegocio <> Nil Then
      UnidadNegocio.Free;
   If MInstDesc <> Nil Then
      MInstDesc.Free;
   Inherited;
end;


function TMFndCLP.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMFndCLP;
begin
   W:=TwMFndCLP.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftImprimir; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TMFndCLP.InternalBusca:Boolean;
begin InternalBusca := False;
end;


(***********************************************FORMA NINGUNO********************)
(*                                                                              *)
(*  FORMA DE NINGUNO                                                            *)
(*                                                                              *)
(***********************************************FORMA NINGUNO********************)
procedure TwMFndCLP.AsignaEmpresaSuc;
begin
     Objeto.Empresa.FindKey([IntToStr(objeto.Apli.IdEmpresa)]);
    if  Objeto.UnidadNegocio.FindKey([objeto.ParamCre.IDENTIDAD.AsString]) then
    begin
         CBSucursal.Checked := True;
    end;

    EdIdEmpresa.Enabled := objeto.ParamCre.B_MULTIEMPRESA.AsString = 'V';
    bbEmpresa.Enabled := objeto.ParamCre.B_MULTIEMPRESA.AsString = 'V';

    EdIDSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
    BBSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
    CBSucursal.Enabled := objeto.ParamCre.B_MULTISUCURSAL.AsString = 'V';
end;

procedure TwMFndCLP.FormShow(Sender: TObject);
begin
      //PINTA DATOS DEL PANEL INFERIOR
  With Objeto Do
   Begin
    lbDempresa.Caption := ParamCre.EMPRESA.AsString;
    lbDfecha.Caption   := ParamCre.FECHA.AsString;
    lbDUsuario.Caption := ParamCre.USUARIO.AsString;
    lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

    dtpF_Inicio.DateTime:= Apli.DameFechaEmpresaDia('FMAN');
    edF_Inicio.text:=FormatDateTime('dd/mm/yyyy',dtpF_Inicio.DateTime);
   End;
   Objeto.Empresa.ID_Empresa.Control := EdIdEmpresa;
   Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
   Objeto.Empresa.GetParams(Objeto);

   Objeto.UnidadNegocio.Id_Entidad.Control := EdIDSucursal;
   Objeto.UnidadNegocio.Desc_Entidad.Control := EdDescSucursal;
   Objeto.UnidadNegocio.GetParams(Objeto);

   Objeto.MInstDesc.CVE_FND_ENT_DES.Control := edCVE_FND_ENT_DES;
   Objeto.MInstDesc.DESC_ENT_DES.Control    := edNOM_FND_ENT_DES;
   Objeto.MInstDesc.GetParams(Objeto);

   AsignaEmpresaSuc;
end;

procedure TwMFndCLP.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      Empresa.ID_Empresa.Control := Nil;
      Empresa.PersonaMoral.Nombre.Control := Nil;
      UnidadNegocio.Id_Entidad.Control := Nil;
      UnidadNegocio.Desc_Entidad.Control := Nil;
      MInstDesc.CVE_FND_ENT_DES.Control  := Nil;
      MInstDesc.DESC_ENT_DES.Control     := Nil;
   End;
end;

procedure TwMFndCLP.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMFndCLP.InterForma1BtnPreviewClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMFNDCLP_PREVI',True,True)
   then
   begin
      if ( rgGenerarArchivo.ItemIndex = 0 ) then
      begin
        ConsultaPasivoCLP(False);
        ImprimeReporte(True);
      end
      else
        ShowMessage('El reporte en pantalla solo está disponible para la opción <Resumen>.');
   end;

end;

Procedure TwMFndCLP.ImprimeReporte(bPreview:Boolean);
begin
   ReporteFndCortoLargoPlazo(VGSQLGenCons,
                             edF_Inicio.Text,
                             edNbrArch.Text,
                             Objeto.Apli,
                             bPreview);

   If Trim(edNbrArch.Text)<>'' Then Begin
      If bGenArch Then
        ShowMessage('El Archivo '+ Trim(edNbrArch.Text)+' se generó correctamente.')
      Else
        ShowMessage('No se generó el Archivo.')
   End;
End;


procedure TwMFndCLP.InterForma1BtnImprimirClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMFNDCLP_IMPRI',True,True)
   then
   begin
      if ( rgGenerarArchivo.ItemIndex = 0 ) then
      begin
        ConsultaPasivoCLP(False);
        ImprimeReporte(False);
      end
      else
        ShowMessage('El reporte en pantalla solo está disponible para la opción <Resumen>.');
   end;
end;


procedure TwMFndCLP.sbExcelClick(Sender: TObject);
var sExt:String;
begin
  If SaveDialog1.Execute Then Begin
      sExt:= copy(SaveDialog1.FileName,Length(SaveDialog1.FileName)-3,Length(SaveDialog1.FileName));
      If  UpperCase(sExt)= '.XLS' Then
         edNbrArch.Text := SaveDialog1.FileName
      Else
         edNbrArch.Text := SaveDialog1.FileName + '.xls';
  End Else
    edNbrArch.Text := '';
end;

procedure TwMFndCLP.edNbrArchChange(Sender: TObject);
begin
   If Trim(edNbrArch.Text)<>'' Then Begin
      cbxArchivo.Checked:=True;
      cbxArchivo.Enabled:=True;
   End Else Begin
      cbxArchivo.Checked:=False;
      cbxArchivo.Enabled:=False;
   End;
end;

procedure TwMFndCLP.cbxArchivoClick(Sender: TObject);
begin
   If not cbxArchivo.Checked Then Begin
      edNbrArch.Text:= '';
      cbxArchivo.Checked:=False;
      cbxArchivo.Enabled:=False;
   End Else Begin
      cbxArchivo.Checked:=True;
      cbxArchivo.Enabled:=True;
   End;
end;

procedure TwMFndCLP.bbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   Objeto.Empresa.Busca;
end;

procedure TwMFndCLP.BBSucursalClick(Sender: TObject);
begin
   If Objeto.UnidadNegocio.Busca Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMFndCLP.ilEmpresaEjecuta(Sender: TObject);
begin
   Objeto.Empresa.FindKey([ilEmpresa.Buffer])
end;

procedure TwMFndCLP.ILSucursalEjecuta(Sender: TObject);
begin
   If  Objeto.UnidadNegocio.FindKey([ILSucursal.Buffer]) Then Begin
      CBSucursal.Checked := True;
   End;
end;

procedure TwMFndCLP.CBSucursalClick(Sender: TObject);
begin
   If Not(CBSucursal.Checked) Then Begin
      EdIDSucursal.Clear;
      EdDescSucursal.Clear;
      Objeto.UnidadNegocio.Active := False;
      CBSucursal.Checked := False;
    End;
end;

procedure TwMFndCLP.edCVE_FND_ENT_DESExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edCVE_FND_ENT_DES,True,'',True);
end;

procedure TwMFndCLP.btCVE_FND_ENT_DESClick(Sender: TObject);
begin
   Objeto.MInstDesc.ShowAll := True;
   If Objeto.MInstDesc.Busca Then Begin
      cbxCVE_FND_ENT_DES.Checked:=True;
      cbxCVE_FND_ENT_DES.Enabled:=True;
      InterForma1.NextTab(edCVE_FND_ENT_DES);
   End;
end;

procedure TwMFndCLP.ilCVE_FND_ENT_DESEjecuta(Sender: TObject);
begin
   If Objeto.MInstDesc.FindKey([ilCVE_FND_ENT_DES.Buffer]) Then Begin
      cbxCVE_FND_ENT_DES.Checked:=True;
      cbxCVE_FND_ENT_DES.Enabled:=True;
      InterForma1.NextTab(edCVE_FND_ENT_DES);
   End;
end;

procedure TwMFndCLP.ilCVE_FND_ENT_DESCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:= True;
end;

procedure TwMFndCLP.cbxCVE_FND_ENT_DESClick(Sender: TObject);
begin
   If not cbxCVE_FND_ENT_DES.Checked Then Begin
      Objeto.MInstDesc.Active:=False;
      cbxCVE_FND_ENT_DES.Checked:=False;
      cbxCVE_FND_ENT_DES.Enabled:=False;
   End Else Begin
      cbxCVE_FND_ENT_DES.Checked:=True;
      cbxCVE_FND_ENT_DES.Enabled:=True;
   End;
end;

procedure TwMFndCLP.bConsultaClick(Sender: TObject);
begin
   If Objeto.ValidaAccesoEsp('TMFNDCLP_CONSU',True,True) then
   Begin
       //Validaciones
       try
           if (StrToDate(edF_Inicio.Text) > StrToDate(edF_Inicio.Text)) then
           begin
             //nada, es para capturar error de tipo dato
           end;
       except
           On E: Exception Do Begin
               ShowMessage('El dato capturado para fecha es incorrecto, rectifique.');
               abort;
           end;
       end;

       if  ( cbxCVE_FND_ENT_DES.checked     )
       and ( edCVE_FND_ENT_DES.Text = '' ) then
       begin
               ShowMessage('Para buscar por Institución debe seleccionar una, rectifique.');
               Exit;
       end;

       //Consulta
       Screen.Cursor:=crHourGlass;
       ConsultaPasivoCLP(True);
       Screen.Cursor:=crDefault;
   end;
end;

procedure TwMFndCLP.ConsultaPasivoCLP(BConsulta: Boolean);
var
    Q                    : TQuery;
    vlSelectRes          : String;
    vlQryCuerpoDet       : String;
    vlFiltroEDDet        : String;
    vlCierreQryCuerpoDet : String;
    vlOrderByDet         : String;
    vlTblJoinRes         : String;
    vlFiltroEDRes        : String;
    vlOrderByRes         : String;
begin

    vlSelectRes          := '';
    vlQryCuerpoDet       := '';
    vlFiltroEDDet        := '';
    vlCierreQryCuerpoDet := '';
    vlOrderByDet         := '';
    vlTblJoinRes         := '';
    vlFiltroEDRes        := '';
    vlOrderByRes         := '';

    vlSelectRes     :=
         ' SELECT ' + coCRLF +
         ' (CED.DESC_ENT_DES || ' + coCRLF +
         '  TO_CHAR(TBLED_AMOR.TIPO_PLAZO) || ' + coCRLF +
         '  TO_CHAR(TBLED_AMOR.CVE_MONEDA)) AS GPO_REP, ' + coCRLF +
         ' TO_DATE('+ #39 + edF_Inicio.Text + #39 + ', ''DD/MM/YYYY'') AS F_CORTE, ' + coCRLF +
         ' CED.DESC_ENT_DES, ' + coCRLF +
         ' DECODE(CED.CVE_TIPO_LINEA,''IR'',''IRREVOCABLE'',''RE'', ''REVOCABLE'', '''') AS CVE_TIPO_LINEA, ' + coCRLF +
         ' CED.IMP_LIMITE AS MONTO_LIN, ' + coCRLF +
         ' CED.DESC_GARANTIA, ' + coCRLF +
         ' TBLED_AMOR.CVE_FND_ENT_DES, ' + coCRLF +
         ' TBLED_AMOR.TIPO_PLAZO, ' + coCRLF +
         ' TBLED_AMOR.CVE_MONEDA, ' + coCRLF +
         ' MND.DESC_MONEDA, ' + coCRLF +
         ' MND.DESC_C_ID_SEC, ' + coCRLF +
         ' TBLED_AMOR.F_INI_PER_REP, ' + coCRLF +
         ' TBLED_AMOR.F_FIN_PER_REP, ' + coCRLF +
         ' MAX(TBLED_AMOR.PLAZO_FND) AS PLAZO_FND, ' + coCRLF +
         ' MAX(TBLED_AMOR.PROX_VENC) AS PROX_VENC, ' + coCRLF +
         ' MAX(TBLED_AMOR.IMP_REDESCONTADO) AS IMP_REDESCONTADO, ' + coCRLF +
         ' SUM(TBLED_AMOR.SALDO_INI) AS SALDO_INI, ' + coCRLF +
         ' SUM(TBLED_AMOR.AMOR_CAP_FA) AS AMOR_CAP_FA, ' + coCRLF +
         ' SUM(TBLED_AMOR.SALDO_FIN) AS SALDO_FIN, ' + coCRLF +
         ' DECODE(TBLED_AMOR.CVE_MONEDA, ''484'', SUM(TBLED_AMOR.AMOR_CAP_FA), ' + coCRLF +
         '                                      (PKGCRCONTA.STPOBT_TIPO_CAMBIO_SAP(2, TO_DATE(' + #39 + edF_Inicio.Text + #39 + ', ''DD/MM/YYYY''), ' + coCRLF +
         ' 				         840) * SUM(TBLED_AMOR.AMOR_CAP_FA))) AS AMOR_CAP_FA_VAL ' + coCRLF +
         ' FROM ' + coCRLF +
         ' (  --->>>INICIA REP DETALLE POR CREDITO<<<-- ' + coCRLF;

    vlQryCuerpoDet  :=
         '   SELECT ' + coCRLF +
         '   TBLSRED.TIPO_PLAZO, ' + coCRLF +
         '   TBLSRED.ID_CREDITO, ' + coCRLF +
         '   TBLSRED.CVE_FND_ENT_DES, ' + coCRLF +
         '   TBLSRED.CVE_FND_PROGRAMA, ' + coCRLF +
         '   TBLSRED.CVE_MONEDA, ' + coCRLF +
         '   TBLSRED.NUM_PERIODO, ' + coCRLF +
         '   TO_DATE(''01''||TO_CHAR(TBLSRED.F_VENCIMIENTO, ''MMYYYY''),''DD/MM/YYYY'') AS F_INI_PER_REP, ' + coCRLF +
         '   LAST_DAY(TBLSRED.F_VENCIMIENTO) AS F_FIN_PER_REP, ' + coCRLF +
         '   TBLSRED.FECH_INICIO, ' + coCRLF +
         '   TBLSRED.F_VENCIMIENTO, ' + coCRLF +
         '   TBLSRED.PLAZO_FND, ' + coCRLF +
         '   --   TBLSRED.PROX_VENC, ' + coCRLF +
         '   ROUND(((LAST_DAY(TBLSRED.F_VENCIMIENTO) - TO_DATE(' + #39 + edF_Inicio.Text + #39 + ', ''DD/MM/YYYY'') ) / 30)) AS PROX_VENC, ' + coCRLF +
         '   TBLSRED.IMP_REDESCONTADO, ' + coCRLF +
         '   TBLSRED.AMOR_CAP_ACUM_ANT, ' + coCRLF +
         '   TBLSRED.AMOR_FA_ACUM_ANT, ' + coCRLF +
         '   TBLSRED.AMOR_CAP, ' + coCRLF +
         '   TBLSRED.AMOR_FA, ' + coCRLF +
         '   (TBLSRED.IMP_REDESCONTADO - TBLSRED.AMOR_CAP_ACUM_ANT - TBLSRED.AMOR_FA_ACUM_ANT) AS SALDO_INI, ' + coCRLF +
         '   (TBLSRED.AMOR_CAP + TBLSRED.AMOR_FA) AS AMOR_CAP_FA, ' + coCRLF +
         '   (TBLSRED.IMP_REDESCONTADO - TBLSRED.AMOR_CAP_ACUM_ANT - TBLSRED.AMOR_FA_ACUM_ANT - TBLSRED.AMOR_CAP - TBLSRED.AMOR_FA) AS SALDO_FIN ' + coCRLF +
         '   FROM ' + coCRLF +
         '   ( ' + coCRLF +
         '      ---CALCULAR PLAZO--- ' + coCRLF +
         '      ---1 CORTO =  fecha corte más 1 año--- ' + coCRLF +
         '      ---2 LARGO =  mayor a (fecha corte más 1 año)--- ' + coCRLF +
         '      SELECT ' + coCRLF +
         '      (CASE WHEN (    CFK.F_VENCIMIENTO BETWEEN TO_DATE('+ #39 + edF_Inicio.Text + #39 + ', ''DD/MM/YYYY'') ' + coCRLF +
         '                  AND ADD_MONTHS(TO_DATE(' + #39 + edF_Inicio.Text + #39 + ', ''DD/MM/YYYY''), 12)) ' + coCRLF +
         '            THEN 1 ELSE 2 END) AS TIPO_PLAZO, ' + coCRLF +
         '      CFC.ID_CREDITO, ' + coCRLF +
         '      CFC.CVE_FND_ENT_DES, ' + coCRLF +
         '      CFC.CVE_FND_PROGRAMA, ' + coCRLF +
         '      CRCTO.CVE_MONEDA, ' + coCRLF +
         '      CFC.ID_PRESTAMO_PAS, ' + coCRLF +
         '      CFK.NUM_PERIODO, ' + coCRLF +
         '      (CFK.F_VENCIMIENTO - CFK.PLAZO) AS FECH_INICIO, ' + coCRLF +
         '      CFK.F_VENCIMIENTO, ' + coCRLF +
         '      ROUND((CFK.PLAZO / 30)) AS PLAZO_FND, ' + coCRLF +
         '      --  ROUND(((CFK.F_VENCIMIENTO - TO_DATE(' + #39 + edF_Inicio.Text + #39 + ', ''DD/MM/YYYY'') ) / 30)) AS PROX_VENC, ' + coCRLF +
         '      CFC.IMP_REDESCONTADO, ' + coCRLF +
         '      (CFK.IMP_CAPITAL - CFK.IMP_PAGO_FC) AS AMOR_CAP, ' + coCRLF +
         '      NVL((CFFA.IMP_FINAN_ADIC - CFFA.IMP_PAGO_FC), 0) AS AMOR_FA, ' + coCRLF +
         '      NVL((SELECT SUM( ' + coCRLF +
         '    	   CASE WHEN (CFK2.F_VENCIMIENTO <= TO_DATE(' + #39 + edF_Inicio.Text + #39 + ', ''DD/MM/YYYY'')) ' + coCRLF +
         '    	        THEN CFK2.IMP_PAGO_FC ELSE (CFK2.IMP_CAPITAL - CFK2.IMP_PAGO_FC) END ' + coCRLF +
         '    	   ) AS ACUMCANT ' + coCRLF +
         '            FROM ' + coCRLF +
         '   	      (SELECT ' + coCRLF +
         '             CR_FND_CAPITAL.F_VENCIMIENTO, ' + COCRLF +
         '             CR_FND_CAPITAL.IMP_CAPITAL, ' + COCRLF +
         '             CR_FND_CAPITAL.NUM_PERIODO, ' + COCRLF +
         '             CR_FND_CAPITAL.SIT_CAPITAL, ' + COCRLF +
         '             CR_FND_CAPITAL.ID_CREDITO, ' + COCRLF +
         '             CR_FND_CAPITAL.CVE_FND_ENT_DES, ' + COCRLF +
         '             CR_FND_CAPITAL.CVE_FND_PROGRAMA, ' + COCRLF +
         '             PKGCRCOMUN.STPOBTFNDIMPPAGADO(''RK'',''IMPBRU'', CR_FND_CAPITAL.ID_CREDITO, CR_FND_CAPITAL.CVE_FND_ENT_DES, CR_FND_CAPITAL.CVE_FND_PROGRAMA, ' + coCRLF +
         '                                         CR_FND_CAPITAL.NUM_PERIODO, NULL, TO_DATE(' + #39 + edF_Inicio.Text + #39 + ', ''DD/MM/YYYY''), ''V'') AS IMP_PAGO_FC ' + coCRLF +
         '             FROM ' + coCRLF +
         '     	       CR_FND_CAPITAL, ' + coCRLF +
         '             CR_FND_CREDITO ' + coCRLF +
         '             WHERE ' + coCRLF +
         '                   CR_FND_CAPITAL.ID_CREDITO       = CR_FND_CREDITO.ID_CREDITO ' + coCRLF +
         '               AND CR_FND_CAPITAL.CVE_FND_ENT_DES  = CR_FND_CREDITO.CVE_FND_ENT_DES ' + coCRLF +
         '               AND CR_FND_CAPITAL.CVE_FND_PROGRAMA = CR_FND_CREDITO.CVE_FND_PROGRAMA ' + coCRLF +
         '               AND (    (   CR_FND_CREDITO.SIT_CREDITO   = ''AC'' ' + coCRLF +
         '                         OR ' + coCRLF +
         '                            ( ' + coCRLF +
         '                                 CR_FND_CREDITO.SIT_CREDITO   = ''LQ'' ' + coCRLF +
         '                             AND CR_FND_CREDITO.F_LIQUIDACION > TO_DATE(' + #39 + edF_Inicio.Text + #39 + ', ''DD/MM/YYYY'') ' + coCRLF +
         '                            ) ' + coCRLF +
         '                        ) ' + coCRLF +
         '                    AND CR_FND_CREDITO.F_INICIO         <= TO_DATE(' + #39 + edF_Inicio.Text + #39 + ', ''DD/MM/YYYY'') ' + coCRLF +
         '                   ) ' + coCRLF +
         '               AND CR_FND_CAPITAL.SIT_CAPITAL NOT IN (''CA'', ''IM'') ' + coCRLF +
         '	      ) CFK2 ' + coCRLF +
         '            WHERE ' + coCRLF +
         '                 CFK2.ID_CREDITO       = CFK.ID_CREDITO ' + coCRLF +
         '             AND CFK2.CVE_FND_ENT_DES  = CFK.CVE_FND_ENT_DES ' + coCRLF +
         '             AND CFK2.CVE_FND_PROGRAMA = CFK.CVE_FND_PROGRAMA ' + coCRLF +
         '             AND CFK2.SIT_CAPITAL      NOT IN (''CA'', ''IM'') ' + coCRLF +
         '             AND CFK2.NUM_PERIODO      < CFK.NUM_PERIODO ' + coCRLF +
         '      ), 0) AS AMOR_CAP_ACUM_ANT, ' + coCRLF +
         '      NVL((SELECT SUM( ' + coCRLF +
         '    	   CASE WHEN (CFFA2.F_VENCIMIENTO <= TO_DATE(' + #39 + edF_Inicio.Text + #39 + ', ''DD/MM/YYYY'')) ' + coCRLF +
         '    	        THEN CFFA2.IMP_PAGO_FC ELSE (CFFA2.IMP_FINAN_ADIC - CFFA2.IMP_PAGO_FC) END ' + coCRLF +
         '    	   ) AS ACUMFAANT ' + coCRLF +
         '       FROM ' + coCRLF +
         '	   (SELECT ' + coCRLF +
         '          CR_FND_FIN_ADIC.F_VENCIMIENTO, ' + coCRLF +
         '          CR_FND_FIN_ADIC.IMP_FINAN_ADIC, ' + coCRLF +
         '          CR_FND_FIN_ADIC.ID_CREDITO, ' + coCRLF +
         '          CR_FND_FIN_ADIC.CVE_FND_ENT_DES, ' + coCRLF +
         '          CR_FND_FIN_ADIC.CVE_FND_PROGRAMA, ' + coCRLF +
         '          CR_FND_FIN_ADIC.SIT_FINAN_ADIC, ' + coCRLF +
         '          CR_FND_FIN_ADIC.NUM_PERIODO, ' + coCRLF +
         '          PKGCRCOMUN.STPOBTFNDIMPPAGADO(''RF'',''IMPBRU'', CR_FND_FIN_ADIC.ID_CREDITO, CR_FND_FIN_ADIC.CVE_FND_ENT_DES, CR_FND_FIN_ADIC.CVE_FND_PROGRAMA, ' + coCRLF +
         '                                    CR_FND_FIN_ADIC.NUM_PERIODO, NULL, TO_DATE(' + #39 + edF_Inicio.Text + #39 + ', ''DD/MM/YYYY''), ''V'') AS IMP_PAGO_FC ' + coCRLF +
         '          FROM ' + coCRLF +
         '          CR_FND_FIN_ADIC, ' + coCRLF +
         '          CR_FND_CREDITO ' + coCRLF +
         '          WHERE ' + coCRLF +
         '               CR_FND_FIN_ADIC.ID_CREDITO       = CR_FND_CREDITO.ID_CREDITO ' + coCRLF +
         '           AND CR_FND_FIN_ADIC.CVE_FND_ENT_DES  = CR_FND_CREDITO.CVE_FND_ENT_DES ' + coCRLF +
         '          AND CR_FND_FIN_ADIC.CVE_FND_PROGRAMA = CR_FND_CREDITO.CVE_FND_PROGRAMA ' + coCRLF +
         '           AND (    (   CR_FND_CREDITO.SIT_CREDITO   = ''AC'' ' + coCRLF +
         '                     OR ' + coCRLF +
         '                        ( ' + coCRLF +
         '                             CR_FND_CREDITO.SIT_CREDITO   = ''LQ'' ' + coCRLF +
         '                         AND CR_FND_CREDITO.F_LIQUIDACION > TO_DATE(' + #39 + edF_Inicio.Text + #39 + ', ''DD/MM/YYYY'') ' + coCRLF +
         '                        ) ' + coCRLF +
         '                    ) ' + coCRLF +
         '                AND CR_FND_CREDITO.F_INICIO         <= TO_DATE(' + #39 + edF_Inicio.Text + #39 + ', ''DD/MM/YYYY'') ' + coCRLF +
         '               ) ' + coCRLF +
         '           AND CR_FND_FIN_ADIC.SIT_FINAN_ADIC NOT IN (''CA'', ''IM'') ' + coCRLF +
         '	   ) CFFA2 ' + coCRLF +
         '       WHERE ' + coCRLF +
         '            CFFA2.ID_CREDITO       = CFFA.ID_CREDITO ' + coCRLF +
         '        AND CFFA2.CVE_FND_ENT_DES  = CFFA.CVE_FND_ENT_DES ' + coCRLF +
         '        AND CFFA2.CVE_FND_PROGRAMA = CFFA.CVE_FND_PROGRAMA ' + coCRLF +
         '        AND CFFA2.SIT_FINAN_ADIC   NOT IN (''CA'', ''IM'') ' + coCRLF +
         '        AND CFFA2.NUM_PERIODO      < CFFA.NUM_PERIODO ' + coCRLF +
         '      ), 0) AS AMOR_FA_ACUM_ANT ' + coCRLF +
         '      FROM ' + coCRLF +
         '      (SELECT ' + coCRLF +
         '         CR_FND_CAPITAL.F_VENCIMIENTO, ' + coCRLF +
         '         CR_FND_CAPITAL.NUM_PERIODO, ' + coCRLF +
         '         CR_FND_CAPITAL.PLAZO, ' + coCRLF +
         '         CR_FND_CAPITAL.IMP_CAPITAL, ' + coCRLF +
         '         CR_FND_CAPITAL.ID_CREDITO, ' + coCRLF +
         '         CR_FND_CAPITAL.CVE_FND_ENT_DES, ' + coCRLF +
         '         CR_FND_CAPITAL.CVE_FND_PROGRAMA, ' + coCRLF +
         '	   PKGCRCOMUN.STPOBTFNDIMPPAGADO(''RK'',''IMPBRU'', CR_FND_CAPITAL.ID_CREDITO, CR_FND_CAPITAL.CVE_FND_ENT_DES, CR_FND_CAPITAL.CVE_FND_PROGRAMA, ' + coCRLF +
         '                                     CR_FND_CAPITAL.NUM_PERIODO, NULL, TO_DATE(' + #39 + edF_Inicio.Text + #39 + ', ''DD/MM/YYYY''), ''V'') AS IMP_PAGO_FC ' + coCRLF +
         '	   FROM ' + coCRLF +
         '	   CR_FND_CAPITAL, ' + coCRLF +
         '       CR_FND_CREDITO ' + coCRLF +
         '       WHERE ' + coCRLF +
         '             CR_FND_CAPITAL.ID_CREDITO       = CR_FND_CREDITO.ID_CREDITO ' + coCRLF +
         '         AND CR_FND_CAPITAL.CVE_FND_ENT_DES  = CR_FND_CREDITO.CVE_FND_ENT_DES ' + coCRLF +
         '         AND CR_FND_CAPITAL.CVE_FND_PROGRAMA = CR_FND_CREDITO.CVE_FND_PROGRAMA ' + coCRLF +
         '         AND (    (   CR_FND_CREDITO.SIT_CREDITO   = ''AC'' ' + coCRLF +
         '                   OR ' + coCRLF +
         '                      ( ' + coCRLF +
         '                           CR_FND_CREDITO.SIT_CREDITO   = ''LQ'' ' + coCRLF +
         '                       AND CR_FND_CREDITO.F_LIQUIDACION > TO_DATE(' + #39 + edF_Inicio.Text + #39 + ', ''DD/MM/YYYY'') ' + coCRLF +
         '                      ) ' + coCRLF +
         '                  ) ' + coCRLF +
         '              AND CR_FND_CREDITO.F_INICIO         <= TO_DATE(' + #39 + edF_Inicio.Text + #39 + ', ''DD/MM/YYYY'') ' + coCRLF +
         '             ) ' + coCRLF +
         '         AND CR_FND_CAPITAL.SIT_CAPITAL NOT IN (''CA'', ''IM'') ' + coCRLF +
         '	  ) CFK, ' + coCRLF +
         '      (SELECT ' + coCRLF +
         '       CR_FND_FIN_ADIC.IMP_FINAN_ADIC, ' + coCRLF +
         '       CR_FND_FIN_ADIC.ID_CREDITO, ' + coCRLF +
         '       CR_FND_FIN_ADIC.CVE_FND_ENT_DES, ' + coCRLF +
         '       CR_FND_FIN_ADIC.CVE_FND_PROGRAMA, ' + coCRLF +
         '       CR_FND_FIN_ADIC.NUM_PERIODO, ' + coCRLF +
         '       PKGCRCOMUN.STPOBTFNDIMPPAGADO(''RF'',''IMPBRU'', CR_FND_FIN_ADIC.ID_CREDITO, CR_FND_FIN_ADIC.CVE_FND_ENT_DES, CR_FND_FIN_ADIC.CVE_FND_PROGRAMA, ' + coCRLF +
         '                                  CR_FND_FIN_ADIC.NUM_PERIODO, NULL, TO_DATE(' + #39 + edF_Inicio.Text + #39 + ', ''DD/MM/YYYY''), ''V'') AS IMP_PAGO_FC ' + coCRLF +
         '       FROM ' + coCRLF +
         '       CR_FND_FIN_ADIC, ' + coCRLF +
         '       CR_FND_CREDITO ' + coCRLF +
         '       WHERE ' + coCRLF +
         '             CR_FND_FIN_ADIC.ID_CREDITO       = CR_FND_CREDITO.ID_CREDITO ' + coCRLF +
         '         AND CR_FND_FIN_ADIC.CVE_FND_ENT_DES  = CR_FND_CREDITO.CVE_FND_ENT_DES ' + coCRLF +
         '         AND CR_FND_FIN_ADIC.CVE_FND_PROGRAMA = CR_FND_CREDITO.CVE_FND_PROGRAMA ' + coCRLF +
         '         AND (    (   CR_FND_CREDITO.SIT_CREDITO   = ''AC'' ' + coCRLF +
         '                   OR ' + coCRLF +
         '                      ( ' + coCRLF +
         '                           CR_FND_CREDITO.SIT_CREDITO   = ''LQ'' ' + coCRLF +
         '                       AND CR_FND_CREDITO.F_LIQUIDACION > TO_DATE(' + #39 + edF_Inicio.Text + #39 + ', ''DD/MM/YYYY'') ' + coCRLF +
         '                      ) ' + coCRLF +
         '                  ) ' + coCRLF +
         '              AND CR_FND_CREDITO.F_INICIO         <= TO_DATE(' + #39 + edF_Inicio.Text + #39 + ', ''DD/MM/YYYY'') ' + coCRLF +
         '             ) ' + coCRLF +
         '         AND CR_FND_FIN_ADIC.SIT_FINAN_ADIC NOT IN (''CA'', ''IM'') ' + coCRLF +
         '	  ) CFFA, ' + coCRLF +
         '      (SELECT ' + coCRLF +
         '       ID_CREDITO, ' + coCRLF +
         '       CVE_FND_ENT_DES, ' + coCRLF +
         '       CVE_FND_PROGRAMA, ' + coCRLF +
         '       ID_PRESTAMO_PAS, ' + coCRLF +
         '       IMP_REDESCONTADO ' + coCRLF +
         '       FROM ' + coCRLF +
         '       CR_FND_CREDITO ' + coCRLF +
         '       WHERE ' + coCRLF +
         '             (   CR_FND_CREDITO.SIT_CREDITO   = ''AC'' ' + coCRLF +
         '              OR ' + coCRLF +
         '                 ( ' + coCRLF +
         '                      CR_FND_CREDITO.SIT_CREDITO   = ''LQ'' ' + coCRLF +
         '                  AND CR_FND_CREDITO.F_LIQUIDACION > TO_DATE(' + #39 + edF_Inicio.Text + #39 + ', ''DD/MM/YYYY'') ' + coCRLF +
         '                 ) ' + coCRLF +
         '             ) ' + coCRLF +
         '         AND CR_FND_CREDITO.F_INICIO         <= TO_DATE(' + #39 + edF_Inicio.Text + #39 + ', ''DD/MM/YYYY'') ' + coCRLF +
         '      ) CFC, ' + coCRLF +
         '      CR_CREDITO CRCRED, ' + coCRLF +
         '      CR_CONTRATO CRCTO, ' + coCRLF +
         '	  CR_PRODUCTO CRPROD ' + coCRLF +
         '      WHERE ' + coCRLF +
         '            CFK.ID_CREDITO            = CFC.ID_CREDITO ' + coCRLF +
         '        AND CFK.CVE_FND_ENT_DES       = CFC.CVE_FND_ENT_DES ' + coCRLF +
         '        AND CFK.CVE_FND_PROGRAMA      = CFC.CVE_FND_PROGRAMA ' + coCRLF +
         '        AND CFK.F_VENCIMIENTO         > TO_DATE(' + #39 + edF_Inicio.Text + #39 + ', ''DD/MM/YYYY'') ' + coCRLF +
         '        AND CRCRED.ID_CREDITO         = CFK.ID_CREDITO ' + coCRLF +
         '        AND CRCTO.ID_CONTRATO         = CRCRED.ID_CONTRATO ' + coCRLF +
         '        AND CFFA.ID_CREDITO       (+) = CFK.ID_CREDITO ' + coCRLF +
         '        AND CFFA.CVE_FND_ENT_DES  (+) = CFK.CVE_FND_ENT_DES ' + coCRLF +
         '        AND CFFA.CVE_FND_PROGRAMA (+) = CFK.CVE_FND_PROGRAMA ' + coCRLF +
         '        AND CFFA.NUM_PERIODO      (+) = CFK.NUM_PERIODO ' + coCRLF +
         '        AND CRPROD.CVE_PRODUCTO_CRE   = CRCTO.CVE_PRODUCTO_CRE ' + coCRLF +
         '        AND CRPROD.ID_EMPRESA         = 2 --PARAM ID_EMPRESA-- ' + coCRLF;

    if (edCVE_FND_ENT_DES.Text <> '') then
    begin
      vlFiltroEDDet :=
        '         AND CFC.CVE_FND_ENT_DES       = ' + #39 + edCVE_FND_ENT_DES.Text + #39 + '--PARAM CVE_FND_ENT_DES 1de2-- ' + coCRLF;
    end;

    vlCierreQryCuerpoDet :=
         '    ) TBLSRED ' + coCRLF;

    vlOrderByDet    :=
         '     ORDER BY               --ACTIVAR PARA OBTENER EL DETALLE---- ' + coCRLF +
         '     TBLSRED.ID_CREDITO, ' + coCRLF +
         '     TBLSRED.NUM_PERIODO, ' + coCRLF +
         '     TBLSRED.CVE_FND_ENT_DES, ' + coCRLF +
         '     TBLSRED.CVE_FND_PROGRAMA, ' + coCRLF +
         '     TBLSRED.CVE_MONEDA, ' + coCRLF +
         '     TBLSRED.TIPO_PLAZO     --->>>TERMINA REP DETALLE POR CREDITO<<<--- ' + coCRLF;

    vlTblJoinRes    :=
         ' ) TBLED_AMOR, ' + coCRLF +
         ' CR_FND_ENT_DES CED, ' + coCRLF +
         ' MONEDA MND ' + coCRLF +
         ' WHERE ' + coCRLF +
         '       TBLED_AMOR.CVE_FND_ENT_DES (+) = CED.CVE_FND_ENT_DES --SE PRESENTAN TODAS AUNQUE NO TENGAN INFORMACIÓN-- ' + coCRLF +
         '   AND MND.CVE_MONEDA             (+) = TBLED_AMOR.CVE_MONEDA ' + coCRLF;

    if (edCVE_FND_ENT_DES.Text <> '') then
    begin
      vlFiltroEDRes :=
        '   AND TBLED_AMOR.CVE_FND_ENT_DES     = ' + #39 + edCVE_FND_ENT_DES.Text + #39 + ' --PARAM CVE_FND_ENT_DES 2de2-- ' + coCRLF;
    end;

    vlOrderByRes    :=
         ' GROUP BY ' + coCRLF +
         ' CED.DESC_ENT_DES, ' + coCRLF +
         ' CED.CVE_TIPO_LINEA, ' + coCRLF +
         ' CED.IMP_LIMITE, ' + coCRLF +
         ' CED.DESC_GARANTIA, ' + coCRLF +
         ' TBLED_AMOR.CVE_FND_ENT_DES, ' + coCRLF +
         ' TBLED_AMOR.TIPO_PLAZO, ' + coCRLF +
         ' TBLED_AMOR.CVE_MONEDA, ' + coCRLF +
         ' MND.DESC_MONEDA, ' + coCRLF +
         ' MND.DESC_C_ID_SEC, ' + coCRLF +
         ' TBLED_AMOR.F_INI_PER_REP, ' + coCRLF +
         ' TBLED_AMOR.F_FIN_PER_REP ' + coCRLF +
         ' ORDER BY ' + coCRLF +
         ' GPO_REP, ' + coCRLF +
         ' CED.DESC_ENT_DES, ' + coCRLF +
         ' CED.CVE_TIPO_LINEA, ' + coCRLF +
         ' CED.IMP_LIMITE, ' + coCRLF +
         ' CED.DESC_GARANTIA, ' + coCRLF +
         ' TBLED_AMOR.CVE_FND_ENT_DES, ' + coCRLF +
         ' TBLED_AMOR.TIPO_PLAZO, ' + coCRLF +
         ' TBLED_AMOR.CVE_MONEDA, ' + coCRLF +
         ' MND.DESC_MONEDA, ' + coCRLF +
         ' MND.DESC_C_ID_SEC, ' + coCRLF +
         ' TBLED_AMOR.F_INI_PER_REP, ' + coCRLF +
         ' TBLED_AMOR.F_FIN_PER_REP ' + coCRLF;

    //Armas el qry final para el reporte
    if ( rgGenerarArchivo.ItemIndex = 0 ) then
    begin
        //Genera Consulta por Entidad
        VGSQLGenCons :=   vlSelectRes
                        + vlQryCuerpoDet
                        + vlFiltroEDDet
                        + vlCierreQryCuerpoDet
                        + vlTblJoinRes
                        + vlFiltroEDRes
                        + vlOrderByRes;
    end
    else
    begin
        //Genera Consulta por Crédito
        VGSQLGenCons :=
                          vlQryCuerpoDet
                        + vlFiltroEDDet
                        + vlCierreQryCuerpoDet
                        + vlOrderByDet;
    end;

    //Se ejecuta solo en modo de consulta, los reportes tienen su propia ejecución del qry.
    if BConsulta then
    begin
        //Procesa Qry
        Q :=  GetSQLQuery(VGSQLGenCons,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
        //    Q.SQL.SaveToFile('c:\VGSQLGenConsCLP.txt');
        try
             if Q <> nil then
             begin
                 if ( rgGenerarArchivo.ItemIndex = 0 ) then
                 begin
                     TNumericField( Q.FieldByName('MONTO_LIN') ).DisplayFormat         := '0,00.00';
                     TNumericField( Q.FieldByName('IMP_REDESCONTADO') ).DisplayFormat  := '0,00.00';
                     TNumericField( Q.FieldByName('SALDO_INI') ).DisplayFormat         := '0,00.00';
                     TNumericField( Q.FieldByName('AMOR_CAP_FA') ).DisplayFormat       := '0,00.00';
                     TNumericField( Q.FieldByName('SALDO_FIN') ).DisplayFormat         := '0,00.00';
                     TNumericField( Q.FieldByName('AMOR_CAP_FA_VAL') ).DisplayFormat   := '0,00.00';
                 end
                 else
                 begin
                     TNumericField( Q.FieldByName('IMP_REDESCONTADO') ).DisplayFormat  := '0,00.00';
                     TNumericField( Q.FieldByName('AMOR_CAP_ACUM_ANT') ).DisplayFormat := '0,00.00';
                     TNumericField( Q.FieldByName('AMOR_FA_ACUM_ANT') ).DisplayFormat  := '0,00.00';
                     TNumericField( Q.FieldByName('AMOR_CAP') ).DisplayFormat          := '0,00.00';
                     TNumericField( Q.FieldByName('AMOR_FA') ).DisplayFormat           := '0,00.00';
                     TNumericField( Q.FieldByName('SALDO_INI') ).DisplayFormat         := '0,00.00';
                     TNumericField( Q.FieldByName('AMOR_CAP_FA') ).DisplayFormat       := '0,00.00';
                     TNumericField( Q.FieldByName('SALDO_FIN') ).DisplayFormat         := '0,00.00';
                 end;

                  sgcData.addQry(Q,True,True,-1,-1,-1,True);
             end
             else
             begin
                  sgcData.Clear('NO EXISTEN OPERACIONES PENDIENTES DE REPORTAR'#30'>C');
             end;
        finally
             if Q <> nil then  Q.free;
        end;
    end;
end;



end.

