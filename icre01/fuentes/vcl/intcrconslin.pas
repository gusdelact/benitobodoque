// Sistema         : Clase de CRCONSLIN
// Fecha de Inicio : 13/08/2014
// Función forma   : Clase de CRCONSLIN
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Bzwrizhlurziljfvfiyrmz
// Comentarios     :
Unit IntCrconslin;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntSGCtrl,
IntParamCre,
IntGenCre,     // Funciones Genéricas
IntXls,
ComObj,
IntCrAcredit,     //Acreditado
IntCrProduct,     //Producto de crédito
IntLinkit
;


Type
 TCrconslin= class; 

  TWCrconslin=Class(TForm)
    InterForma1             : TInterForma;
    bConsulta: TButton;
    sgcData: TSGCtrl; 
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
    Label5: TLabel;
    lblCredito: TLabel;
    lblFechaAlta: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    rgLineaCredito: TRadioGroup;
    Label3: TLabel;
    edFIniAlta: TEdit;
    stpInicioAlta: TInterDateTimePicker;
    Label4: TLabel;
    edFFinAlta: TEdit;
    stpFinAlta: TInterDateTimePicker;
    chkFechaAlta: TCheckBox;
    Label6: TLabel;
    edFIniVenc: TEdit;
    stpInicioVenc: TInterDateTimePicker;
    Label7: TLabel;
    edFFinVenc: TEdit;
    stpFinVenc: TInterDateTimePicker;
    chbxFVenc: TCheckBox;
    edCVE_PRODUCTO_CRE: TEdit;
    btnProducto: TBitBtn;
    edDESC_C_PRODUCTO: TEdit;
    chbxProducto: TCheckBox;
    lbAplica: TLabel;
    edID_ACREDITADO: TEdit;
    btnID_ACREDITADO: TBitBtn;
    edNOM_ACRED: TEdit;
    chbxAcreditado: TCheckBox;
    chbxALinCred: TCheckBox;
    ilACREDITADO: TInterLinkit;
    ilPRODUCTO: TInterLinkit;
    Label8: TLabel;
    edFReporte: TEdit;
    stpReporte: TInterDateTimePicker;
    rgSitDisposicion: TRadioGroup;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure bConsultaClick(Sender: TObject);

    procedure ConsultaLineas;
    procedure LimpiaDatosAcred;
    procedure LimpiaDatosProd;
    procedure btnID_ACREDITADOClick(Sender: TObject);
    procedure btnID_ACREDITADOExit(Sender: TObject);
    procedure ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure btnProductoClick(Sender: TObject);
    procedure ilPRODUCTOCapture(Sender: TObject; var Show: Boolean);
    procedure ilPRODUCTOEjecuta(Sender: TObject);

    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrconslin;
end;
 TCrconslin= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ParamCre        : TParamCre;

        Acreditado      : TCrAcredit;
        Producto        : TCrProduct;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override; 
        function    Reporte:Boolean; override; 
      published 
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrconslin.Create( AOwner : TComponent );
begin Inherited;
    Acreditado := TCrAcredit.Create(Self);
    Acreditado.MasterSource := Self;

    Producto :=  TCrProduct.Create(Self);
    Producto.MasterSource:=Self;
    Producto.FieldByName('CVE_PRODUCTO_CRE').MasterField := 'CVE_PRODUCTO_CRE';



    StpName  := ' ';
    UseQuery := False;
    HelpFile := 'IntCrconslin.Hlp';
    ShowMenuReporte:=True;
end;

Destructor TCrconslin.Destroy;
begin
   if Acreditado <> nil then
      Acreditado.Free;
   //end if;

   if Producto <> nil then
      Producto.Free;
   //end if;
inherited;
end;


function TCrconslin.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrconslin;
begin
   W:=TWCrconslin.Create(Self);
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


Function TCrconslin.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrconsl.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TCrconslin.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA CRCONSLIN********************)
(*                                                                              *)
(*  FORMA DE CRCONSLIN                                                            *)
(*                                                                              *)
(***********************************************FORMA CRCONSLIN********************)

procedure TWCrconslin.FormShow(Sender: TObject);
begin

    lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
    lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
    lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
    lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

    InterForma1.BtnImprimir.Visible := False;
    InterForma1.BtnPreview.Visible  := False;

    Objeto.Acreditado.ID_ACREDITADO.Control := edID_ACREDITADO;
    Objeto.Acreditado.Persona.Nombre.Control := edNOM_ACRED;
    Objeto.Acreditado.GetParams(Objeto);

    Objeto.Producto.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO_CRE;
    Objeto.Producto.DESC_C_PRODUCTO.Control := edDESC_C_PRODUCTO;
    Objeto.Producto.GetParams(Objeto);

    edFReporte.Text            := objeto.ParamCre.FECHA.AsString;
    rgSitDisposicion.ItemIndex := 0;
end;

procedure TWCrconslin.FormDestroy(Sender: TObject);
begin
    //Objeto
    Objeto.Acreditado.ID_ACREDITADO.Control := nil;
    Objeto.Acreditado.Persona.Nombre.Control := nil;

    Objeto.Producto.CVE_PRODUCTO_CRE.Control := nil;
    Objeto.Producto.DESC_C_PRODUCTO.Control := nil;
end;

procedure TWCrconslin.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrconslin.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrconslin.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrconslin.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


procedure TWCrconslin.bConsultaClick(Sender: TObject);
begin
   If Objeto.ValidaAccesoEsp('TCRCONSLIN_CONSU',True,True) then
   Begin
       //Validaciones
       if  ( chbxAcreditado.checked     )
       and ( edID_ACREDITADO.Text = '' ) then
       begin
               ShowMessage('Para buscar por Acreditado debe seleccionar uno, rectifique.');
               Exit;
       end;

       if  ( chbxProducto.checked     )
       and ( edCVE_PRODUCTO_CRE.Text = '' ) then
       begin
               ShowMessage('Para buscar por Producto debe seleccionar uno, rectifique.');
               Exit;
       end;

       if ( chkFechaAlta.checked ) then
       begin
           try
               if (StrToDate(edFIniAlta.Text) > StrToDate(edFFinAlta.Text)) then
               begin
                   ShowMessage('La "Fecha de Alta" inicial no debe ser mayor a la final, rectifique.');
                   Exit;
               end;
           except
               On E: Exception Do Begin
                   ShowMessage('El dato capturado para Fecha Alta es incorrecto, rectifique.');
                   abort;
               end;
           end;
       end;

       if ( chbxFVenc.checked ) then
       begin
           try
               if (StrToDate(edFIniVenc.Text) > StrToDate(edFFinVenc.Text)) then
               begin
                   ShowMessage('La "Fecha de Vencimiento" inicial no debe ser mayor a la final, rectifique.');
                   Exit;
               end;
           except
               On E: Exception Do Begin
                   ShowMessage('El dato capturado para Fecha Vencimiento es incorrecto, rectifique.');
                   abort;
               end;
           end;
       end;

       if ( chbxALinCred.checked ) then
       begin
           if (rgLineaCredito.ItemIndex < 0) then
           begin
               ShowMessage('Para buscar por Aplica Línea de Crédito debe seleccionar una opción, rectifique.');
               Exit;
           end;
       end;

       //Fecha Reporte
       try
           if (StrToDate(edFReporte.Text) > StrToDate(edFReporte.Text)) then
           begin
               //hacer nada, el dato es válido
           end;
       except
           On E: Exception Do Begin
               ShowMessage('El dato capturado para Fecha Reporte es incorrecto, rectifique.');
               abort;
           end;
       end;

       //Consulta
       Screen.Cursor:=crHourGlass;
       ConsultaLineas;
       Screen.Cursor:=crDefault;
   end;
end;



procedure TWCrconslin.ConsultaLineas;
var
    Q               : TQuery;
    VGSQLGenCons    : String;
    vlSitDispACHoy  : String;
    vlSitDispACFRep : String;
begin
    //Prepara filtro Sit Disposición
    if ( rgSitDisposicion.ItemIndex = 0 ) then
    begin
        vlSitDispACHoy  := 'V';
        vlSitDispACFRep := 'F';
    end
    else if ( rgSitDisposicion.ItemIndex = 1 ) then
    begin
        vlSitDispACHoy  := 'F';
        vlSitDispACFRep := 'V';
    end
    else
    begin
        vlSitDispACHoy  := 'V';
        vlSitDispACFRep := 'V';
    end;


    //Arma consulta
    VGSQLGenCons := ' SELECT ' + #13 +
                    ' CRC.ID_CONTRATO AS "Contrato", ' + #13 +
                    ' TITCC.NOMBRE AS "Cliente", ' + #13 +
                    ' PRODCORP.DESC_PRODUCTO AS "Producto Cto", ' + #13 +
                    ' MCTO.DESC_MONEDA AS "Moneda Cto", ' + #13 +
                    ' CTOC.SIT_CONTRATO AS "Situacion Cto", ' + #13 +
                    ' CTOC.ID_TITULAR AS "ID Acreditado", ' + #13 +
                    ' PRODCRE.CVE_PRODUCTO_CRE AS "Cve Producto Cred", ' + #13 +
                    ' PRODCRE.DESC_C_PRODUCTO AS  "Desc Producto Cred", ' + #13 +
                    ' DECODE (PRODCRE.B_LINEA_CREDITO, ''V'', ''SI'', ''NO'') AS "Apl Lin Cred Prod", ' + #13 +
                    ' CRC.CVE_DESTINO AS "Cve Destino Dispos", ' + #13 +
                    ' CRDES.DESC_DESTINO AS "Desc Destino Dispos", ' + #13 +
                    ' CRC.F_AUT_COMITE AS "F Aut Comite", ' + #13 +
                    ' CRC.DIAS_PLAZO AS "Dias Plazo", ' + #13 +
                    ' CRC.F_VENCIMIENTO AS "F Vencimiento", ' + #13 +
                    ' CRC.IMP_AUTORIZADO AS "Imp Autorizado", ' + #13 +
                    ' CRC.IMP_BLOQUEADO AS "Imp Bloqueado", ' + #13 +
                    ' PKGCRSALDOS.STPOBTDISPONIBLEAUT(CRC.ID_CONTRATO, CRC.FOL_CONTRATO) AS "Disponible Aut", ' + #13 +
                    ' PKGCRSALDOS.STPOBTDISPUESTOAUT(CRC.ID_CONTRATO, CRC.FOL_CONTRATO) AS "Dispuesto Aut", ' + #13 +
                    ' DECODE (CRC.B_APL_RENOVACION, ''V'', ''SI'', ''NO'') AS "Apli Renovacion", ' + #13 +
                    ' DECODE (CRC.B_REESTRUCTURA ,''V'', ''SI'', ''NO'') AS "Apli Reestructura", ' + #13 +
                    ' DECODE (CRC.CVE_FORMA_DISP ,''V'', ''SI'', ''NO'') AS "No Rev Disposicion", ' + #13 +
                    ' DECODE (CRC.B_EVENTUAL ,''V'', ''SI'', ''NO'') AS "Eventual", ' + #13 +
                    ' DECODE (CRC.B_REVOLVENTE ,''V'', ''SI'', ''NO'') AS "Revolvente", ' + #13 +
                    ' DECODE (CRC.B_PARAMETRICO ,''V'', ''SI'', ''NO'') AS "Es Parametrico", ' + #13 +
                    ' DECODE (CRC.B_APL_PRORROGA ,''V'', ''SI'', ''NO'') AS "Apl Prorrogas", ' + #13 +
                    ' DECODE (CRC.B_FINAN_CALIF ,''V'', ''SI'', ''NO'') AS "Apli Financ Calif", ' + #13 +
                    ' DECODE (CRC.B_FINANC_ADIC ,''V'', ''SI'', ''NO'') AS "Apli Financ Adic", ' + #13 +
                    ' DECODE (CRC.B_APL_CONVE_MOD ,''V'', ''SI'', ''NO'') AS "Conv Modif", ' + #13 +
                    ' DECODE (CRC.B_APL_EVEN_ACEL ,''V'', ''SI'', ''NO'') AS "Evento Acel", ' + #13 +
                    ' DECODE (CRC.B_TIPO_LINEA ,''V'', ''SI'', ''NO'') AS "Lin Cred Revocable", ' + #13 +
                    ' DECODE (CRC.B_DISP_EN_LINEA ,''V'', ''SI'', ''NO'') AS "Apl Disp Linea", ' + #13 +
                    ' DECODE (CRC.B_EMPROBLEMADA ,''V'', ''SI'', ''NO'') AS "Es Emproblemado", ' + #13 +
                    ' DECODE (CRC.B_PRELACION_PGO ,''V'', ''SI'', ''NO'') AS "Prelacion Pag Pref", ' + #13 +
                    ' DECODE (CRC.B_EMPLEADO ,''V'', ''SI'', ''NO'') AS "Es Empleado", ' + #13 +
                    ' DECODE (CRC.B_RAMO_28 ,''V'', ''SI'', ''NO'') AS "Es Ramo 28", ' + #13 +
                    ' CRC.CVE_MONEDA AS "Cve Monenda Lin", ' + #13 +
                    ' MCRC.DESC_MONEDA AS "Monenda Lin", ' + #13 +
                    ' CRC.TASA_BASE AS "Tasa Base", ' + #13 +
                    ' CRC.OPERADOR_STASA AS "Ope Sobre Tasa", ' + #13 +
                    ' CRC.MAX_PZO_DISP AS "Plazo de Disp", ' + #13 +
                    ' CRC.MAX_DIAS_DISPON AS "Plazo Max Disp", ' + #13 +
                    ' CRC.MAX_TASA AS "Tasa Max Cobrar", ' + #13 +
                    ' CRC.ID_AVAL_GOB AS "ID Gtia Gob", ' + #13 +
                    ' AGOB.NOMBRE AS "Gtia Gob", ' + #13 +
                    ' CRC.CVE_ANALISTA_RES AS "Analista Asig", ' + #13 +
                    ' CRC.NO_CONSUL_BURO AS "Consulta Buro", ' + #13 +
                    ' CRC.CVE_PRODUCTO_BCA AS "Cve Prod BCA", ' + #13 +
                    ' CRPBCA.DESC_L_PRODUCTO AS "Desc Prod BCA", ' + #13 +
                    ' CRC.F_ALTA AS "F Alta", ' + #13 +
                    ' CRC.CVE_USU_ALTA AS "U Alta", ' + #13 +
                    ' CRC.F_MODIFICA AS "F Mod", ' + #13 +
                    ' CRC.CVE_USU_MODIFICA AS "U Mod", ' + #13 +
                    ' CRC.CVE_USU_AUTORIZA AS "U Aut", ' + #13 +
                    ' CRC.SIT_LINEA AS "Situacion Linea", ' + #13 +
                    ' DECODE (CRTG.GAR_PART ,''V'', ''SI'', ''NO'') AS "Gtia con Part", ' + #13 +
                    ' DECODE (CRTG.GAR_APORT ,''V'', ''SI'', ''NO'') AS "Gtia con Aport", ' + #13 +
                    ' DECODE (CRTG.ING_PROPIOS ,''V'', ''SI'', ''NO'') AS "Ingresos Propios", ' + #13 +
                    ' CRTG.MON_GAR_PART AS "Monto Gtia con Part", ' + #13 +
                    ' CRTG.MON_GAR_APORT AS "Monto Gtia con Aport", ' + #13 +
                    ' CRTG.MON_ING_PROPIOS AS "Monto Ing Propios", ' + #13 +
                    ' CRTG.F_REG_GAR_PART AS "F Reg Gtia con Part", ' + #13 +
                    ' CRTG.F_REG_GAR_APORT AS "F Reg Gtia con Part", ' + #13 +
                    ' CRTG.F_REG_ING_PROPIOS AS "F Reg Ing Propios", ' + #13 +
                    ' CRTG.PCT_PART AS "Porc Gtia con Part", ' + #13 +
                    ' CRTG.PCT_APORT AS "Porc Gtia con Aport", ' + #13 +
                    ' CRTG.PCT_ING_PROP AS "Porc Ing Propios", ' + #13 +
                    ' CRTG.NUM_INSCR_DEUDA AS "No Inscrip E", ' + #13 +
                    ' CRTG.INS_FEDERAL AS "No Inscrip F", ' + #13 +
                    ' CRTG.F_ALTA_INSCR_DEU AS "F Inscrip Est", ' + #13 +
                    ' CRTG.F_PROG_INSCR_D AS "F Inscrip.Fed", ' + #13 +
                    ' DECODE (CRTG.B_GTIA_LEY_FED ,''V'', ''SI'', ''NO'') AS "Gtia Ley Fed", ' + #13 +
                    ' DECODE (CRTG.B_CONT_GUBERNA ,''V'', ''SI'', ''NO'') AS "Contab Gub" ' + #13 +
                    ' FROM ' + #13 +
                    ' CR_CONTRATO CRC, ' + #13 +
                    ' CONTRATO CTOC, ' + #13 +
                    ' PERSONA TITCC, ' + #13 +
                    ' PRODUCTO PRODCORP, ' + #13 +
                    ' MONEDA MCTO, ' + #13 +
                    ' CR_PRODUCTO PRODCRE, ' + #13 +
                    ' CR_DESTINO CRDES, ' + #13 +
                    ' MONEDA MCRC, ' + #13 +
                    ' PERSONA AGOB, ' + #13 +
                    ' CR_PRODUCTO_BCA CRPBCA, ' + #13 +
                    ' CR_TIPOS_GARAN CRTG ' + #13 +
                    ' WHERE ' + #13 +
                    '       CTOC.ID_CONTRATO         (+) = CRC.ID_CONTRATO ' + #13 +
                    '   AND TITCC.ID_PERSONA         (+) = CTOC.ID_TITULAR ' + #13 +
                    '   AND PRODCORP.CVE_PRODUCTO    (+) = CTOC.CVE_PRODUCTO ' + #13 +
                    '   AND MCTO.CVE_MONEDA          (+) = CTOC.CVE_MONEDA ' + #13 +
                    '   AND PRODCRE.CVE_PRODUCTO_CRE (+) = CRC.CVE_PRODUCTO_CRE ' + #13 +
                    '   AND CRDES.CVE_DESTINO        (+) = CRC.CVE_DESTINO ' + #13 +
                    '   AND MCRC.CVE_MONEDA          (+) = CTOC.CVE_MONEDA ' + #13 +
                    '   AND AGOB.ID_PERSONA          (+) = CRC.ID_AVAL_GOB ' + #13 +
                    '   AND CRPBCA.CVE_PRODUCTO_BCA  (+) = CRC.CVE_PRODUCTO_BCA ' + #13 +
                    '   AND CRTG.ID_CONTRATO         (+) = CRC.ID_CONTRATO ' + #13 +
                    '   AND CRTG.ID_REG_VIGENTE      (+) = 1 ' + #13 +
                    '   AND (   (CRC.F_VENCIMIENTO        >= TO_DATE(' + #39 + edFReporte.Text + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ')) ' + #13 +
                    '        OR (EXISTS (SELECT CRCRED.ID_CONTRATO FROM CR_CREDITO CRCRED ' + #13 +
                    '                    WHERE (   (CRCRED.SIT_CREDITO = ''AC'' AND ''V'' =' + #39 + vlSitDispACHoy + #39 + ') ' + #13 +
                    '                           OR (CRCRED.SIT_CREDITO = ''LQ'' AND CRCRED.F_LIQUIDACION <= TO_DATE(' + #39 + edFReporte.Text + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ')' + ' AND ''V'' =' + #39 +  vlSitDispACFRep + #39 + ')) ' + #13 +
                    '                      AND CRCRED.ID_CONTRATO = CRC.ID_CONTRATO))) ' + #13;

    //FILTROS
    if chbxAcreditado.Checked then
    begin
        VGSQLGenCons := VGSQLGenCons + '   AND CTOC.ID_TITULAR                = ' + edID_ACREDITADO.Text + #13;
    end;

    if chbxProducto.checked then
    begin
        VGSQLGenCons := VGSQLGenCons + '   AND CRC.CVE_PRODUCTO_CRE           = ' + #39 + edCVE_PRODUCTO_CRE.Text+ #39 + #13;
    end;

    if chkFechaAlta.Checked then
    begin
        VGSQLGenCons := VGSQLGenCons +
                        '   AND TRUNC(CRC.F_ALTA)        BETWEEN TO_DATE(' + #39 + edFIniAlta.Text + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ')' +
                        '   AND TO_DATE(' + #39 + edFFinAlta.Text + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ')' + #13;
    end;

    if chbxFVenc.Checked then
    begin
        VGSQLGenCons := VGSQLGenCons +
                        '   AND TRUNC(CRC.F_VENCIMIENTO) BETWEEN TO_DATE(' + #39 + edFIniVenc.Text + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ')' +
                        '   AND TO_DATE(' + #39 + edFFinVenc.Text + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ')' + #13;
    end;

    if chbxALinCred.Checked then
    begin
        if ( rgLineaCredito.ItemIndex = 0 ) then
            VGSQLGenCons := VGSQLGenCons + '   AND PRODCRE.B_LINEA_CREDITO        = ''V''' + #13
        else
            VGSQLGenCons := VGSQLGenCons + '   AND PRODCRE.B_LINEA_CREDITO        = ''F''' + #13;
    end;

    //ORDEN
    VGSQLGenCons := VGSQLGenCons + ' ORDER BY CRC.ID_CONTRATO ';

     Q :=  GetSQLQuery(VGSQLGenCons,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
     //Q.SQL.SaveToFile('c:\VGSQLGenCons.txt');
     try
          if Q <> nil then
          begin
               //TNumericField( Q.FieldByName('Importe Bruto') ).DisplayFormat:= '0,00.00';
               //TNumericField( Q.FieldByName('IVA') ).DisplayFormat:= '0,00.00';
               //TNumericField( Q.FieldByName('Importe Neto') ).DisplayFormat:= '0,00.00';
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

procedure TWCrconslin.btnID_ACREDITADOClick(Sender: TObject);
begin
   If Objeto.ValidaAccesoEsp('TCRCONSLIN_BCTE',True,True) then
   Begin
        with objeto do
        begin
            Acreditado.ShowAll := True;

            If Acreditado.Busca Then Begin
                chbxAcreditado.Checked := True;
                chbxAcreditado.Enabled := True;
                InterForma1.NextTab(edID_ACREDITADO);
            End
            else
            begin
                LimpiaDatosAcred;
            end;
        end;
   end;
end;

procedure TWCrconslin.btnID_ACREDITADOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edID_ACREDITADO,True,'',True);
end;

procedure TWCrconslin.ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
begin
    Show:= True;
end;

procedure TWCrconslin.ilACREDITADOEjecuta(Sender: TObject);
begin
    with objeto do
    begin
        If Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
            chbxAcreditado.Checked:=True;
            chbxAcreditado.Enabled:=True;
            Acreditado.GetParams(Objeto);
            InterForma1.NextTab(edID_ACREDITADO);
        End
        else
        begin
            LimpiaDatosAcred;
        end;
    end;
end;

procedure TWCrconslin.LimpiaDatosAcred;
begin
  edID_ACREDITADO.Text := '';
  edNOM_ACRED.Text     := '';
  Objeto.Acreditado.ID_ACREDITADO.IsNull;
  Objeto.Acreditado.Persona.Nombre.IsNull;
end;

procedure TWCrconslin.LimpiaDatosProd;
begin
  edCVE_PRODUCTO_CRE.Text := '';
  edDESC_C_PRODUCTO.Text     := '';
  Objeto.Producto.CVE_PRODUCTO_CRE.IsNull;
  Objeto.Producto.DESC_C_PRODUCTO.IsNull;
end;


procedure TWCrconslin.btnProductoClick(Sender: TObject);
begin
   If Objeto.ValidaAccesoEsp('TCRCONSLIN_BPRO',True,True) then
   Begin
        with objeto do
        begin
            Producto.ShowAll := True;

            If Producto.Busca Then Begin
                chbxProducto.Checked := True;
                chbxProducto.Enabled := True;
                InterForma1.NextTab(edCVE_PRODUCTO_CRE);
            End
            else
            begin
                LimpiaDatosProd;
            end;
        end;
   end;
end;

procedure TWCrconslin.ilPRODUCTOCapture(Sender: TObject;
  var Show: Boolean);
begin
    Show:= True;
end;

procedure TWCrconslin.ilPRODUCTOEjecuta(Sender: TObject);
begin
    with objeto do
    begin
        If Producto.FindKey([ilPRODUCTO.Buffer]) Then Begin
            chbxProducto.Checked:=True;
            chbxProducto.Enabled:=True;
            Producto.GetParams(Objeto);
            InterForma1.NextTab(edCVE_PRODUCTO_CRE);
        End
        else
        begin
            LimpiaDatosProd;
        end;
    end;
end;

end.
