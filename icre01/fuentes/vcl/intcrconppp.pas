// Sistema         : Clase de TCrConPPP
// Fecha de Inicio : 27/02/2012
// Función forma   : Clase de TCrConPPP
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Fernando Jimenez Rivera
// Comentarios     :
Unit IntCrConPPP;    
interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,

//Unidades Adicionales
IntParamCre,
IntCrProduct,     //Producto de crédito
IntCrAcredit,     //Acreditado
IntCrCto,         // Linea/Contrato
IntCrCredito,     //Disposición
IntMQrInfCobr,    //Reporte
IntMProdGpo, IntCtoPanel, IntSGCtrl      //Grupo de Producto
;

Type
 TCrConPPP= class;

  TwCrConPPP=Class(TForm)
    InterForma1             : TInterForma;
    lbAplica: TLabel;
    rgSitMov: TRadioGroup;
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
    edACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    ilACREDITADO: TInterLinkit;
    chbxAcreditado: TCheckBox;
    Label2: TLabel;
    chbxCESION: TCheckBox;
    edCESION: TEdit;
    btID_CESION: TBitBtn;
    edID_CESION: TEdit;
    ilCesion: TInterLinkit;
    Label9: TLabel;
    edCVE_PRODUCTO_GPO: TEdit;
    btCVE_PRODUCTO_GPO: TBitBtn;
    edNOM_CVE_PRODUCTO_GPO: TEdit;
    cbxCVE_PRODUCTO_GPO: TCheckBox;
    ilCVE_PRODUCTO_GPO: TInterLinkit;
    GBRango: TGroupBox;
    lbLiqF_INICIO: TLabel;
    edF_INICIO: TEdit;
    dtpF_INICIO: TInterDateTimePicker;
    Label3: TLabel;
    edF_FINAL: TEdit;
    dtpF_FINAL: TInterDateTimePicker;
    Label5: TLabel;
    edID_CONTRATO: TEdit;
    btnCONTRATO: TBitBtn;
    edDESC_C_PRODUCTO: TEdit;
    ilCONTRATO: TInterLinkit;
    chbxContrato: TCheckBox;
    icpCONTRATO: TInterCtoPanel;
    SGDatos: TSGCtrl;
    rgTipoMov: TRadioGroup;
    bbConsulta: TBitBtn;
    ChBxFechas: TCheckBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure chbxAcreditadoClick(Sender: TObject);
    procedure edACREDITADOExit(Sender: TObject);
    procedure edID_CESIONChange(Sender: TObject);
    procedure edID_CESIONExit(Sender: TObject);
    procedure btID_CESIONClick(Sender: TObject);
    procedure chbxCESIONClick(Sender: TObject);
    procedure ilCesionCapture(Sender: TObject; var Show: Boolean);
    procedure ilCesionEjecuta(Sender: TObject);
    procedure edCVE_PRODUCTO_GPOExit(Sender: TObject);
    procedure btCVE_PRODUCTO_GPOClick(Sender: TObject);
    procedure ilCVE_PRODUCTO_GPOCapture(Sender: TObject;
      var Show: Boolean);
    procedure ilCVE_PRODUCTO_GPOEjecuta(Sender: TObject);
    procedure cbxCVE_PRODUCTO_GPOClick(Sender: TObject);
    procedure edID_CONTRATOExit(Sender: TObject);
    procedure btnCONTRATOClick(Sender: TObject);
    procedure ilCONTRATOCapture(Sender: TObject; var Show: Boolean);
    procedure ilCONTRATOEjecuta(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure chbxContratoClick(Sender: TObject);
    procedure bbConsultaClick(Sender: TObject);
    procedure ChBxFechasClick(Sender: TObject);
    procedure edF_INICIOExit(Sender: TObject);
    procedure edF_FINALExit(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    private
    { Private declarations }
       Procedure CambiaControl;
       Function FormaQuery(sF_Inicio,sF_Final,sAcreditado,
                           sContrato,sCesion,sTipoMov, sSitMov,sGpoProd: String ):String;
       Function DeterminaIn(CveAcc: String): String ;
    public
    { Public declarations }
    Objeto : TCrConPPP;
end;
 TCrConPPP= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
       public
        { Public declarations }
        Acreditado               : TCrAcredit;
        ContratoCre              : TCrCto;
        Credito                  : TCrCredito;//Disposición
        ParamCre                 : TParamCre;
        GpoProd                  : TMProdGpo;

        vgIdCredito              : Integer ;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

var
   In_Operaciones : String ;

implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrConPPP.Create( AOwner : TComponent );
begin Inherited;
      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource := Self;

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
      Credito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

      ContratoCre := TCrCto.Create(Self);
      ContratoCre.MasterSource:=Self;
      ContratoCre.FieldByName('ID_CONTRATO').MasterField:='ID_CONTRATO';

      GpoProd:= TMProdGpo.Create(Self);
      GpoProd.MasterSource:=Self;
      GpoProd.FieldByName('CVE_PRODUCTO_GPO').MasterField:='CVE_PRODUCTO_GPO';

      vgIdCredito := 0 ;

      UseQuery := False;
      HelpFile := 'InTCrConPPP.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrConPPP.Destroy;
begin
   If Acreditado <> Nil Then
      Acreditado.Free;
   If ContratoCre <> Nil then
      ContratoCre.Free;
   If Credito <> Nil Then
      Credito.Free;
   If GpoProd <> Nil Then
      GpoProd.Free;
   inherited;
end;


function TCrConPPP.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwCrConPPP;
begin
   W:=TwCrConPPP.Create(Self);
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


Function TCrConPPP.InternalBusca:Boolean;
begin InternalBusca := False;

end;

function TCrConPPP.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA NINGUNO********************)
(*                                                                              *)
(*  FORMA DE NINGUNO                                                            *)
(*                                                                              *)
(***********************************************FORMA NINGUNO********************)
Function TwCrConPPP.DeterminaIn(CveAcc: String): String ;
var QApoyo: TQuery;
    t: String ;
begin
    QApoyo:= GetSQLQuery('SELECT CVE_OPERACION FROM CR_OPERACION '+
                         ' WHERE CVE_ACCESORIO = '''+CveAcc+ ''' ', Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
    t:= '(''0'')' ;
    Try
       If QApoyo <> Nil Then
          begin
             t:= '(''0'' ' ;
             While not QApoyo.Eof do begin
               t:= t+ ', '''+trim(QApoyo.Fields[0].AsString)+'''  ';
               QApoyo.Next ;
             end ;
             t:= t + ' )' ;
          end
       Else
          ShowMessage('No se encontraron claves del accesorio '+CveAcc) ;

    Finally
      If QApoyo <> Nil Then
         QApoyo.Free;
    End ;

    Result:= t ;
end ;

Function TwCrConPPP.FormaQuery(sF_Inicio,sF_Final,sAcreditado,
                               sContrato,sCesion,sTipoMov,sSitMov,sGpoProd: String ):String;
Var
    sSQL:String;
Begin
    sSQL:=
          'SELECT DISTINCT CT.ID_CREDITO, CT.ID_TRANSACCION, CT.F_OPERACION, CT.CVE_OPERACION, '+coCRLF+
          '                 (SELECT IMP_CONCEPTO                                               '+coCRLF+
          '                  FROM CR_DET_TRANSAC                                               '+coCRLF+
          '                  WHERE ID_TRANSACCION = CT.ID_TRANSACCION  AND CVE_CONCEPTO = ''IMPBRU'')  AS IMP_BRUTO, '+coCRLF+
          '                 (SELECT IMP_CONCEPTO                                                                     '+coCRLF+
          '                  FROM CR_DET_TRANSAC                                                                     '+coCRLF+
          '                  WHERE ID_TRANSACCION = CT.ID_TRANSACCION  AND CVE_CONCEPTO = ''IMPIVA'')  AS IMP_IVA,   '+coCRLF+
	  '		    CASE WHEN CR.CVE_AFECTA_SDO = ''I'' THEN CT.IMP_NETO ELSE NULL END AS ABONO,             '+coCRLF+
          '                 CASE WHEN CR.CVE_AFECTA_SDO = ''D'' THEN CT.IMP_NETO ELSE NULL END AS CARGO,             '+coCRLF+
          '                 CT.SIT_TRANSACCION, CO.DESC_C_OPERACION --, CR.CVE_AFECTA_SDO                            '+coCRLF+
          'FROM CR_TRANSACCION CT, CR_OPERACION CO, CR_REL_CON_AFEC CR, CR_CREDITO CRE, CONTRATO CTO                 '+coCRLF+
          'WHERE 1=1 ';

    If Trim(sAcreditado) <> '' then
       sSQL:= sSQL + ' AND CTO.ID_TITULAR = '+sAcreditado+'  ' ;

    If Trim(sContrato) <> '' then
       sSQL:= sSQL + ' AND CRE.ID_CONTRATO = '+sContrato+'  ' ;

    If Trim(sCesion) <> '' then
       sSQL:= sSQL + ' AND CT.ID_CREDITO = '+sCesion+'  ' ;

    If (Trim(sF_Inicio) <> '') and (Trim(sF_Final) <> '') then
       sSQL:= sSQL + '  AND F_OPERACION >= TO_DATE('''+FormatDateTime('DD/MM/YYYY',StrToDate(sF_Inicio))+''', ''DD/MM/YYYY'') '+coCRLF+
                     '  AND F_OPERACION <= TO_DATE('''+FormatDateTime('DD/MM/YYYY',StrToDate(sF_Final))+''', ''DD/MM/YYYY'') ' ;

    If Trim(sTipoMov) <> '' then
       sSQL:= sSQL + ' AND CR.CVE_AFECTA_SDO = '''+sTipoMov+'''  ' ;

    If Trim(sSitMov) <> '' then
       sSQL:= sSQL + ' AND CT.SIT_TRANSACCION = '''+sSitMov+'''  ' ;


    sSQL:= sSQL + ' AND CRE.ID_CREDITO = CT.ID_CREDITO        '+coCRLF+
                  ' AND CTO.ID_CONTRATO = CRE.ID_CONTRATO     '+coCRLF+
                  ' AND CT.CVE_OPERACION IN                   '+coCRLF+
                  '    (SELECT CVE_OPERACION                  '+coCRLF+
                  '     FROM CR_OPERACION                     '+coCRLF+
                  '     WHERE CVE_ACCESORIO = ''PP'') --PPP   '+coCRLF+
                  ' AND CT.CVE_OPERACION = CO.CVE_OPERACION   '+coCRLF+
                  ' AND CT.CVE_OPERACION = CR.CVE_OPERACION   '+coCRLF+
                  ' AND CO.CVE_OPERACION = CR.CVE_OPERACION   '+coCRLF+
                  ' ORDER BY CT.ID_CREDITO, CT.ID_TRANSACCION ' ;

    Result:= sSQL;
End;

procedure TwCrConPPP.FormShow(Sender: TObject);
begin
      icpCONTRATO.Frame := Objeto.ContratoCre.Contrato;
      icpCONTRATO.RefrescaInfo; //REFRESCA LA INFORMACIÓN DEL CREDITO

      //PINTA DATOS DEL PANEL INFERIOR
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.GpoProd.CVE_PRODUCTO_GPO.Control:= edCVE_PRODUCTO_GPO;
      Objeto.GpoProd.DESC_C_PROD_GPO.Control:= edNOM_CVE_PRODUCTO_GPO;
      Objeto.GpoProd.GetParams(Objeto);

      Objeto.Acreditado.ID_ACREDITADO.Control := edACREDITADO;
      Objeto.Acreditado.Persona.Nombre.Control := edNOMBRE_ACRED;
      Objeto.GetParams(Objeto);
      edNOMBRE_ACRED.Hint := Objeto.Acreditado.Persona.Nombre.AsString;
      edNOMBRE_ACRED.ShowHint := True;

      Objeto.ContratoCre.ID_CONTRATO.Control := edID_CONTRATO ;
      Objeto.ContratoCre.Producto.DESC_C_PRODUCTO.Control:= edDESC_C_PRODUCTO ;
      Objeto.GetParams(Objeto);
      edDESC_C_PRODUCTO.Hint := Objeto.ContratoCre.Producto.DESC_C_PRODUCTO.AsString ;
      edDESC_C_PRODUCTO.ShowHint := True ;

      Objeto.Credito.ID_CREDITO.Control := edID_CESION;
      Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := edCESION;
      Objeto.Credito.GetParams(Objeto);
      edCESION.Hint := Objeto.Credito.ContratoCre.Contrato.TITNombre.AsString;
      edCESION.ShowHint := True;

end;

procedure TwCrConPPP.FormDestroy(Sender: TObject);
begin
    Objeto.GpoProd.CVE_PRODUCTO_GPO.Control:= nil;
    Objeto.GpoProd.DESC_C_PROD_GPO.Control:= nil;
    Objeto.Acreditado.ID_ACREDITADO.Control := nil;
    Objeto.Acreditado.Persona.Nombre.Control := nil;
    Objeto.ContratoCre.Producto.DESC_C_PRODUCTO.Control := nil;
    Objeto.ContratoCre.ID_CONTRATO.Control := nil;
    Objeto.Credito.ID_CREDITO.Control := nil;
    Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := nil ;
end;

procedure TwCrConPPP.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwCrConPPP.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TwCrConPPP.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWNinguno.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;

procedure TwCrConPPP.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TwCrConPPP.ilACREDITADOEjecuta(Sender: TObject);
begin
    If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
        InterForma1.NextTab(edACREDITADO);
    End;
end;

procedure TwCrConPPP.btACREDITADOClick(Sender: TObject);
var Cadena : String ;
begin
if Objeto.ValidaAccesoEsp('TCRCONPPP_ACRED',True,True) then // JFOF 13/03/2013 FUNCION DE SEGURIDADES
  begin
     Cadena:= ' SELECT DISTINCT CONTRATO.ID_TITULAR  '+
              ' FROM CONTRATO , CR_CREDITO , CR_PPO_PREMIO  '+
              ' WHERE CONTRATO.ID_CONTRATO = CR_CREDITO.ID_CONTRATO AND CR_CREDITO.ID_CREDITO = CR_PPO_PREMIO.ID_CREDITO ';
     Objeto.Acreditado.Persona.BuscaWhereString:= ' PERSONA.ID_PERSONA IN ('+Cadena+') ' ;
     Objeto.Acreditado.Persona.FilterString:= Objeto.Acreditado.Persona.BuscaWhereString ;
     Objeto.Acreditado.ShowAll := True;
     If Objeto.Acreditado.Busca Then Begin
          chbxAcreditado.Checked:=True;
          chbxAcreditado.Enabled:=True;
          InterForma1.NextTab(edACREDITADO);
     End;
  end;
end;

procedure TwCrConPPP.chbxAcreditadoClick(Sender: TObject);
begin
    If not chbxAcreditado.Checked Then Begin
        Objeto.Acreditado.Active:=False;
        chbxAcreditado.Checked:=False;
        chbxAcreditado.Enabled:=False;
        Objeto.ContratoCre.BuscaWhereString := '';
        Objeto.ContratoCre.FilterString := '';
    End Else Begin
        chbxAcreditado.Checked:=True;
        chbxAcreditado.Enabled:=True;
    End;
end;

procedure TwCrConPPP.edACREDITADOExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edACREDITADO,True,'',True);
end;

procedure TwCrConPPP.edID_CESIONChange(Sender: TObject);
begin
    If Trim(edID_CESION.Text)<>'' Then Begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
    End Else Begin
        chbxCESION.Checked:=False;
        chbxCESION.Enabled:=False;
    End;
end;

procedure TwCrConPPP.edID_CESIONExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edID_CESION,True,'',True);
end;

procedure TwCrConPPP.btID_CESIONClick(Sender: TObject);
var Cadena: String ;
begin
if Objeto.ValidaAccesoEsp('TCRCONPPP_DISP',True,True) then  // JFOF 13/03/2013 FUNCION DE SEGURIDADES
  begin
     Cadena:= ' SELECT DISTINCT CR_CREDITO.ID_CONTRATO  '+
              ' FROM CONTRATO , CR_CREDITO , CR_PPO_PREMIO  '+
              ' WHERE CONTRATO.ID_CONTRATO = CR_CREDITO.ID_CONTRATO AND CR_CREDITO.ID_CREDITO = CR_PPO_PREMIO.ID_CREDITO ';
     If chbxACREDITADO.Checked then
        begin
           Cadena := Cadena + ' AND CONTRATO.ID_TITULAR = '+Objeto.Acreditado.ID_ACREDITADO.AsString+' ' ;
        end ;

     If chbxContrato.Checked then
        begin
           Cadena := Cadena + ' AND CR_CREDITO.ID_CONTRATO = '+Objeto.ContratoCre.ID_CONTRATO.AsString+' ' ;
        end ;

     Objeto.Credito.BuscaWhereString:= ' CR_CREDITO.ID_CONTRATO IN ( '+Cadena+') ' ;
     Objeto.Credito.FilterString:= Objeto.Credito.BuscaWhereString ;
     Objeto.Credito.ShowAll := True;
     if Objeto.Credito.Busca then begin
          icpCONTRATO.Frame := Objeto.Credito.ContratoCre.Contrato;
          icpCONTRATO.RefrescaInfo; //REFRESCA LA INFORMACIÓN DEL CREDITO
          chbxCESION.Checked:=True;
          chbxCESION.Enabled:=True;
          InterForma1.NextTab(edID_CESION);
     End;
  end;
end;

procedure TwCrConPPP.chbxCESIONClick(Sender: TObject);
begin
    If not chbxCESION.Checked Then Begin
        Objeto.Credito.Active:=False;
        chbxCESION.Checked:=False;
        chbxCESION.Enabled:=False;
    End Else Begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
    End;
end;

procedure TwCrConPPP.ilCesionCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TwCrConPPP.ilCesionEjecuta(Sender: TObject);
begin
    If Objeto.Credito.FindKey([ilCesion.Buffer]) Then Begin
        icpCONTRATO.RefrescaInfo; //REFRESCA LA INFORMACIÓN DEL CREDITO
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
        InterForma1.NextTab(edID_CESION);
    End;
end;

procedure TwCrConPPP.edCVE_PRODUCTO_GPOExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edCVE_PRODUCTO_GPO,True,'',True);
end;

procedure TwCrConPPP.btCVE_PRODUCTO_GPOClick(Sender: TObject);
begin
   Objeto.GpoProd.ShowAll := True;
   If Objeto.GpoProd.Busca Then Begin
      CambiaControl;
      InterForma1.NextTab(edCVE_PRODUCTO_GPO);
   End;
end;
Procedure TwCrConPPP.CambiaControl;
Begin
   cbxCVE_PRODUCTO_GPO.Checked:=True;
   cbxCVE_PRODUCTO_GPO.Enabled:=True;
End;

procedure TwCrConPPP.ilCVE_PRODUCTO_GPOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TwCrConPPP.ilCVE_PRODUCTO_GPOEjecuta(Sender: TObject);
begin
   If Objeto.GpoProd.FindKey([ilCVE_PRODUCTO_GPO.Buffer]) Then Begin
      CambiaControl;
      InterForma1.NextTab(edCVE_PRODUCTO_GPO);
   End;
end;

procedure TwCrConPPP.cbxCVE_PRODUCTO_GPOClick(Sender: TObject);
begin
   If not cbxCVE_PRODUCTO_GPO.Checked Then Begin
      Objeto.GpoProd.Active:=False;
      cbxCVE_PRODUCTO_GPO.Checked:=False;
      cbxCVE_PRODUCTO_GPO.Enabled:=False;
   End Else Begin
      cbxCVE_PRODUCTO_GPO.Checked:=True;
      cbxCVE_PRODUCTO_GPO.Enabled:=True;
   End;
end;

procedure TwCrConPPP.edID_CONTRATOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edID_CONTRATO, True, '', True) ;
end;

procedure TwCrConPPP.btnCONTRATOClick(Sender: TObject);
var Cadena: String ;
begin
if Objeto.ValidaAccesoEsp('TCRCONPPP_LINEA',True,True) then // JFOF 13/03/2013 FUNCION DE SEGURIDADES
  begin
     Cadena:= ' SELECT DISTINCT CONTRATO.ID_CONTRATO  '+
              ' FROM CONTRATO , CR_CREDITO , CR_PPO_PREMIO  '+
              ' WHERE CONTRATO.ID_CONTRATO = CR_CREDITO.ID_CONTRATO AND CR_CREDITO.ID_CREDITO = CR_PPO_PREMIO.ID_CREDITO ';
     If chbxACREDITADO.Checked then
        begin
           Cadena := Cadena + ' AND CONTRATO.ID_TITULAR = '+Objeto.Acreditado.ID_ACREDITADO.AsString+' ' ;
        end ;
     Objeto.ContratoCre.BuscaWhereString := ' CR_CONTRATO.ID_CONTRATO IN ('+Cadena+') ';
     Objeto.ContratoCre.FilterString:= Objeto.ContratoCre.BuscaWhereString ;
     Objeto.ContratoCre.ShowAll := True;
     if Objeto.ContratoCre.Busca then begin
          icpCONTRATO.Frame := Objeto.ContratoCre.Contrato;
          icpCONTRATO.RefrescaInfo; //REFRESCA LA INFORMACIÓN DEL CREDITO
          chbxContrato.Checked:=True;
          chbxContrato.Enabled:=True;
          InterForma1.NextTab(edID_CONTRATO);
     End;
  end;
end;

procedure TwCrConPPP.ilCONTRATOCapture(Sender: TObject; var Show: Boolean);
begin
   Show := True ;
end;

procedure TwCrConPPP.ilCONTRATOEjecuta(Sender: TObject);
begin
    If Objeto.ContratoCre.FindKey([ilCONTRATO.Buffer]) Then Begin
        icpCONTRATO.RefrescaInfo;
        chbxContrato.Checked:=True;
        chbxContrato.Enabled:=True;
        InterForma1.NextTab(edID_CONTRATO);
    End;
end;

procedure TwCrConPPP.InterForma1Buscar(Sender: TObject);
begin
   If Objeto.Busca then
   Begin
      icpCONTRATO.Frame := Objeto.ContratoCre.Contrato;
      icpCONTRATO.RefrescaInfo;
   End ;
end;

procedure TwCrConPPP.chbxContratoClick(Sender: TObject);
begin
    If not chbxContrato.Checked Then Begin
        Objeto.ContratoCre.Active:=False;
        chbxContrato.Checked:=False;
        chbxContrato.Enabled:=False;
        Objeto.Credito.BuscaWhereString := '';
        Objeto.Credito.FilterString := '';
    End Else Begin
        chbxContrato.Checked:=True;
        chbxContrato.Enabled:=True;
    End;
end;

procedure TwCrConPPP.bbConsultaClick(Sender: TObject);
var Q: TQuery ;
    SQLText, Acred, Cto, Cred, FI, FF, Tipo, Sit: String ;
begin
if Objeto.ValidaAccesoEsp('TCRCONPPP_CGRAL',True,True) then  // JFOF 13/03/2013 FUNCION DE SEGURIDADES
  begin
     SQLText:= ''; Acred:= ''; Cto:= ''; Cred:= '';
     FI:=''; FF:=''; Tipo:=''; Sit:='';

     if chbxAcreditado.Checked then
        Acred:= edACREDITADO.Text ;

     if chbxContrato.Checked then
        Cto:= edID_CONTRATO.Text ;

     if chbxCesion.Checked then
        Cred:= edID_CESION.Text ;

     if chbxFechas.Checked then
        begin
           FI:= edF_INICIO.Text ;
           FF:= edF_FINAL.Text ;
        end ;

     Case rgTipoMov.ItemIndex of
        0: Tipo:= 'I' ;
        1: Tipo:= 'D' ;
     end ;

     Case rgSitMov.ItemIndex of
        0: Sit:= 'AC' ;
        1: Sit:= 'CA' ;
     end ;

     SQLText:= FormaQuery(FI, FF, Acred, Cto, Cred, Tipo, Sit, '') ;

     Q:= GetSQLQuery(SQLText, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
     Try
        If Q <> Nil Then
           begin
              Q.FieldByName('ID_CREDITO').DisplayLabel := 'Crédito' + #30 +'>C';
              Q.FieldByName('ID_TRANSACCION').DisplayLabel := 'Trans.' + #30 +'>C';
              Q.FieldByName('F_OPERACION').DisplayLabel := 'Fecha' + #30 +'>C';
              Q.FieldByName('CVE_OPERACION').DisplayLabel := 'Cve. Op.' + #30 +'>C';
              Q.FieldByName('DESC_C_OPERACION').DisplayLabel := 'Op.' + #30 +'>C';
              Q.FieldByName('IMP_BRUTO').DisplayLabel := 'Imp. Bruto' + #30 +'>C';
              Q.FieldByName('IMP_IVA').DisplayLabel := 'Imp. IVA' + #30 +'>C';
              Q.FieldByName('CARGO').DisplayLabel := 'Decremento' + #30 +'>C';
              Q.FieldByName('ABONO').DisplayLabel := 'Incremento' + #30 +'>C';
              Q.FieldByName('SIT_TRANSACCION').DisplayLabel := 'Sit' + #30 +'>C';
              Q.FieldByName('ID_CREDITO').DisplayWidth := 7;
              Q.FieldByName('ID_TRANSACCION').DisplayWidth := 10;
              Q.FieldByName('F_OPERACION').DisplayWidth := 11;
              Q.FieldByName('CVE_OPERACION').DisplayWidth := 8;
              Q.FieldByName('DESC_C_OPERACION').DisplayWidth := 27;
              Q.FieldByName('IMP_BRUTO').DisplayWidth := 15;
              TNumericField( Q.FieldByName('IMP_BRUTO') ).DisplayFormat:= '###,###,###,###,###,##0.00';
              Q.FieldByName('IMP_IVA').DisplayWidth := 15;
              TNumericField( Q.FieldByName('IMP_IVA') ).DisplayFormat:= '###,###,###,###,###,##0.00';
              Q.FieldByName('ABONO').DisplayWidth := 15;
              TNumericField( Q.FieldByName('ABONO') ).DisplayFormat:= '###,###,###,###,###,##0.00';
              Q.FieldByName('CARGO').DisplayWidth := 15;
              TNumericField( Q.FieldByName('CARGO') ).DisplayFormat:= '###,###,###,###,###,##0.00';
              Q.FieldByName('SIT_TRANSACCION').DisplayWidth := 3;
              SGDatos.AddQry(Q,True,True,20,20,20,True);
              Q.SQL.SaveToFile('C:\IntConPPP.sql')
           end
        Else
           SGDatos.Clear('NO SE ENCONTRARON DATOS'#30'>C');
     Finally
       If Q <> Nil Then
          Q.Free;
     End ;
  end;
end;

procedure TwCrConPPP.ChBxFechasClick(Sender: TObject);
begin
   if not(ChBxFechas.Checked) then
      begin
         edF_INICIO.Text := '' ;
         edF_FINAL.Text := '' ;
         edF_INICIO.Color := clBtnFace ;
         edF_FINAL.Color := clBtnFace ;
      end
   else
      begin
         edF_INICIO.Color := clWindow ;
         edF_FINAL.Color := clWindow ;
     end ;

   edF_INICIO.Enabled := ChBxFechas.Checked ;
   edF_FINAL.Enabled := ChBxFechas.Checked ;
end;

procedure TwCrConPPP.edF_INICIOExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edF_INICIO,True,'',True);
end;

procedure TwCrConPPP.edF_FINALExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edF_FINAL,True,'',True);
end;

procedure TwCrConPPP.InterForma1DespuesShow(Sender: TObject);
begin
  if Objeto.vgIdCredito > 0 then
  begin
    If Objeto.Credito.FindKey([Objeto.vgIdCredito]) Then
    begin
      if Objeto.ContratoCre.FindKey([Objeto.Credito.ID_CONTRATO.AsString, '1']) then
         begin
            icpContrato.RefrescaInfo ;
            If Objeto.Acreditado.FindKey([Objeto.ContratoCre.Contrato.ID_TITULAR.AsString]) then
               bbConsultaClick(Self);
         end ;
    end;
    Objeto.vgIdCredito := 0;
  end;
end;

end.

