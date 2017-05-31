// Sistema         : Clase de CRCOCHAD
// Fecha de Inicio : 04/02/2004
// Función forma   : Clase de CRCOCHAD
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntMCoChAd;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,
//UNIDADES ADICIONALES
IntParamCre,
IntGenCre,
IntCrAcredit,           // Acreditado
IntCrEmisor,            // Emisor
IntCrProveed,           // Prooveedor
IntCrGpCheq,            // Grupo de Chequeras
IntMQrChAd              // Reporte
;

Type
 TMCoChAd= class;

  TWMCoChAd=Class(TForm)
    InterForma1             : TInterForma;
    lbAplica: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    rgTipoAcreditado: TRadioGroup;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    edACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    cbACREDITADO: TCheckBox;
    rgOrden: TRadioGroup;
    edID_PROVEEDOR: TEdit;
    btPROVEEDOR: TBitBtn;
    edID_PROV_NAFINSA: TEdit;
    edNOM_PROVEEDOR: TEdit;
    cbPROVEEDOR: TCheckBox;
    rgTipoChequera: TRadioGroup;
    ilACREDITADO: TInterLinkit;
    ilPROVEEDOR: TInterLinkit;
    Label3: TLabel;
    edID_EMISOR: TEdit;
    btEMISOR: TBitBtn;
    edNOM_NAFIN_EMISOR: TEdit;
    cbEMISOR: TCheckBox;
    ilEMISOR: TInterLinkit;
    edCVE_NAFIN_EMISOR: TEdit;
    Label2: TLabel;
    edCVE_GPO_CHEQ: TEdit;
    btnCVE_GPO_CHEQ: TBitBtn;
    edDESC_GPO_CHEQ: TEdit;
    cbCVE_GPO_CHEQ: TCheckBox;
    ilCVE_GPO_CHEQ: TInterLinkit;
    rgOpeChequera: TRadioGroup;
    rgMovimientos: TRadioGroup;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure cbACREDITADOClick(Sender: TObject);
    procedure btEMISORClick(Sender: TObject);
    procedure ilEMISOREjecuta(Sender: TObject);
    procedure cbEMISORClick(Sender: TObject);
    procedure btPROVEEDORClick(Sender: TObject);
    procedure ilPROVEEDOREjecuta(Sender: TObject);
    procedure cbPROVEEDORClick(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure btnCVE_GPO_CHEQClick(Sender: TObject);
    procedure cbCVE_GPO_CHEQClick(Sender: TObject);
    procedure ilCVE_GPO_CHEQEjecuta(Sender: TObject);
    procedure ilCVE_GPO_CHEQCapture(Sender: TObject; var Show: Boolean);
    private
    { Private declarations }
        Procedure ImprimeReporte(bPreview:Boolean);
        procedure HabilitaControles(bEnabled : Boolean);
    public
    { Public declarations }
    Objeto : TMCoChAd;
end;
 TMCoChAd= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }

        //Clases Adicionales
        ParamCre                 : TParamCre;
        Acreditado               : TCrAcredit;
        Emisor                   : TCrEmisor;
        Proveedor                : TCrProveed;
        GrupoCheq                : TCrGpCheq;

        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation

{$R *.DFM}


constructor TMCoChAd.Create( AOwner : TComponent );
begin Inherited;

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrcochad.Hlp';
      ShowMenuReporte:=True;

      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource := Self;
      Acreditado.BuscaWhereString := 'SIT_ACREDITADO = ''AC''';

      Emisor := TCrEmisor.Create(Self);
      Emisor.MasterSource:=Self;
      Emisor.BuscaWhereString := 'SIT_EMISOR = ''AC''';

      Proveedor := TCrProveed.Create(Self);
      Proveedor.MasterSource:=Self;
      Proveedor.BuscaWhereString := 'SIT_PROVEEDOR = ''AC''';

      GrupoCheq := TCrGpCheq.Create(Self);
      GrupoCheq.MasterSource := Self;
end;

Destructor TMCoChAd.Destroy;
begin
   if Acreditado <> nil then
      Acreditado.Free;
   if Emisor <> nil then
      Emisor.Free;
   if Proveedor <> nil then
      Proveedor.Free;
   if GrupoCheq <> nil then
      GrupoCheq.Free;
    inherited;
end;


function TMCoChAd.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMCoChAd;
begin
   W:=TWMCoChAd.Create(Self);
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

(***********************************************FORMA CRCOCHAD********************)
(*                                                                              *)
(*  FORMA DE CRCOCHAD                                                            *)
(*                                                                              *)
(***********************************************FORMA CRCOCHAD********************)

procedure TWMCoChAd.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   With Objeto do
   Begin
      Acreditado.ID_ACREDITADO.Control := edACREDITADO;
      Acreditado.Persona.Nombre.Control := edNOMBRE_ACRED;
      Acreditado.GetParams(Objeto);

      Emisor.ID_ACREDITADO.Control := edID_EMISOR;
      Emisor.Acreditado.Persona.Nombre.Control := edNOM_NAFIN_EMISOR;
{ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
//      Emisor.CVE_EMISOR_NAFIN.Control := edCVE_NAFIN_EMISOR;
      Emisor.CVE_EMISOR_EXT.Control := edCVE_NAFIN_EMISOR;
{/ROIM}
      Emisor.GetParams(Objeto);

      Proveedor.ID_ACREDITADO.Control := edID_PROVEEDOR;
      Proveedor.Persona.Nombre.Control := edNOM_PROVEEDOR;
{ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
//      Proveedor.ID_PROV_NAFINSA.Control := edID_PROV_NAFINSA;
      Proveedor.ID_PROV_EXTERNO.Control := edID_PROV_NAFINSA;
{/ROIM}
      Proveedor.GetParams(Objeto);

      GrupoCheq.CVE_GPO_CHEQ.Control := edCVE_GPO_CHEQ;
      GrupoCheq.DESC_GPO_CHEQ.Control := edDESC_GPO_CHEQ;
   end;
end;

procedure TWMCoChAd.FormDestroy(Sender: TObject);
begin
   With Objeto do
   Begin
      Acreditado.ID_ACREDITADO.Control := nil;
      Acreditado.Persona.Nombre.Control := nil;

      Emisor.ID_ACREDITADO.Control := nil;
      Emisor.Acreditado.Persona.Nombre.Control := nil;
{ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
//      Emisor.CVE_EMISOR_NAFIN.Control := nil;
      Emisor.CVE_EMISOR_EXT.Control := nil;
{/ROIM}

      Proveedor.ID_ACREDITADO.Control := nil;
      Proveedor.Persona.Nombre.Control := nil;
{ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
//      Proveedor.ID_PROV_NAFINSA.Control := nil;
      Proveedor.ID_PROV_EXTERNO.Control := nil;
{/ROIM}

      GrupoCheq.CVE_GPO_CHEQ.Control := nil;
      GrupoCheq.DESC_GPO_CHEQ.Control := nil;
   end;
end;

procedure TWMCoChAd.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWMCoChAd.btACREDITADOClick(Sender: TObject);
begin
   Objeto.Acreditado.ShowAll := True;
   if Objeto.Acreditado.Busca then
   Begin
      cbACREDITADO.Checked := True;
      cbACREDITADO.Enabled := True;
   end;
end;

procedure TWMCoChAd.ilACREDITADOEjecuta(Sender: TObject);
begin
   if Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) then
   Begin
      cbACREDITADO.Checked := True;
      cbACREDITADO.Enabled := True;
   end;
end;

procedure TWMCoChAd.cbACREDITADOClick(Sender: TObject);
begin
   if not ( cbACREDITADO.Checked ) then
   Begin
      Objeto.Acreditado.Active := False;
      cbACREDITADO.Enabled := False;
      cbACREDITADO.Checked := False;
   end;
end;

procedure TWMCoChAd.btEMISORClick(Sender: TObject);
begin
   Objeto.Emisor.ShowAll := True;
   if Objeto.Emisor.Busca then
   Begin
      cbEMISOR.Checked := True;
      cbEMISOR.Enabled := True;
   end;
end;

procedure TWMCoChAd.ilEMISOREjecuta(Sender: TObject);
begin
   if Objeto.Emisor.FindKey([ilEMISOR.Buffer]) then
   Begin
      cbEMISOR.Checked := True;
      cbEMISOR.Enabled := True;
   end;
end;

procedure TWMCoChAd.cbEMISORClick(Sender: TObject);
begin
   if not ( cbEMISOR.Checked ) then
   Begin
      Objeto.Emisor.Active := False;
      cbEMISOR.Enabled := False;
      cbEMISOR.Checked := False;
   end;
end;

procedure TWMCoChAd.btPROVEEDORClick(Sender: TObject);
begin
   Objeto.Proveedor.ShowAll := True;
   if Objeto.Proveedor.Busca then
   Begin
      cbPROVEEDOR.Checked := True;
      cbPROVEEDOR.Enabled := True;
   end;
end;

procedure TWMCoChAd.ilPROVEEDOREjecuta(Sender: TObject);
begin
   if Objeto.Proveedor.FindKey([ilPROVEEDOR.Buffer]) then
   Begin
      cbPROVEEDOR.Checked := True;
      cbPROVEEDOR.Enabled := True;
   end;
end;

procedure TWMCoChAd.cbPROVEEDORClick(Sender: TObject);
begin
   if not ( cbPROVEEDOR.Checked ) then
   Begin
      Objeto.Proveedor.Active := False;
      cbPROVEEDOR.Checked := False;
      cbPROVEEDOR.Enabled := False;
   end;
end;

Procedure TWMCoChAd.ImprimeReporte(bPreview:Boolean);
Var
    sTipoAcred,sTipoCheqra,sOpeChequera, sMovimientos, sOrden :String;
    iSit :Integer;
Begin
    iSit:=rgTipoAcreditado.ItemIndex;
    case iSit of
        0: sTipoAcred:='AC'; //Acreditado
        1: sTipoAcred:='EM'; //Emisor
        2: sTipoAcred:='PR'; //Proveedor
        3: sTipoAcred:=''; //Indistinto
    end;

    iSit:=rgOpeChequera.ItemIndex;
    case iSit of
        0: sTipoCheqra:='V';  //Predeterminada
        1: sTipoCheqra:='F';  //No Predeterminada
        2: sTipoCheqra:='';   //Indistinto
    end;

    iSit:=rgTipoChequera.ItemIndex;
    case iSit of
        0: sOpeChequera:='CR';  //Cargo
        1: sOpeChequera:='AB';  //Abono
        2: sOpeChequera:='AM';  //Ambos
        3: sOpeChequera:='';    //Indistinto
    end;

    iSit:=rgMovimientos.ItemIndex;
    case iSit of
        0: sMovimientos:='CM';  //Con Movimientos
        1: sMovimientos:='SM';  //Sin Movimientos
        2: sMovimientos:='';    //Indistinto
    end;

    iSit:=rgOrden.ItemIndex;
    case iSit of
        0: sOrden:='TA';  //Por Tipo Acreditado
        1: sOrden:='NC';  //Por Número de Chequera
    end;

    RepChqraAdmin( edACREDITADO.Text, edID_EMISOR.Text, edCVE_NAFIN_EMISOR.Text, edID_PROVEEDOR.Text,
                   sTipoAcred, sTipoCheqra, sOpeChequera, edCVE_GPO_CHEQ.Text,  sMovimientos, sOrden, Objeto.Apli,bPreview);
End;

procedure TWMCoChAd.InterForma1BtnImprimirClick(Sender: TObject);
begin
if Objeto.ValidaAccesoEsp('TMCOCHAD_IMPRI',True,True) then
        ImprimeReporte(False);
end;

procedure TWMCoChAd.InterForma1BtnPreviewClick(Sender: TObject);
begin
if Objeto.ValidaAccesoEsp('TMCOCHAD_PREVI',True,True) then
        ImprimeReporte(True);
end;

procedure TWMCoChAd.btnCVE_GPO_CHEQClick(Sender: TObject);
begin
 If Objeto.GrupoCheq.Busca Then
  Begin
  cbCVE_GPO_CHEQ.Checked := True;
  cbCVE_GPO_CHEQ.Enabled := True;
  HabilitaControles(False);
  End;
end;

procedure TWMCoChAd.cbCVE_GPO_CHEQClick(Sender: TObject);
begin
   if not ( cbCVE_GPO_CHEQ.Checked ) then
   Begin
      Objeto.GrupoCheq.Active := False;
      cbCVE_GPO_CHEQ.Checked := False;
      cbCVE_GPO_CHEQ.Enabled := False;
      HabilitaControles(True);
   end;
end;

procedure TWMCoChAd.HabilitaControles(bEnabled : Boolean);
begin
  edACREDITADO.Enabled     := bEnabled;
  edID_EMISOR.Enabled      := bEnabled;
  edID_PROVEEDOR.Enabled   := bEnabled;
  btACREDITADO.Enabled     := bEnabled;
  btEMISOR.Enabled         := bEnabled;
  btPROVEEDOR.Enabled      := bEnabled;
  cbACREDITADO.Enabled     := bEnabled;
  cbEMISOR.Enabled         := bEnabled;
  cbPROVEEDOR.Enabled      := bEnabled;
  rgTipoAcreditado.Enabled := bEnabled;
  rgTipoChequera.Enabled   := bEnabled;
  rgOpeChequera.Enabled    := bEnabled;

  Objeto.Acreditado.Active := bEnabled;
  Objeto.Emisor.Active     := bEnabled;
  Objeto.Proveedor.Active  := bEnabled;
  rgTipoAcreditado.ItemIndex := 3;
  rgTipoChequera.ItemIndex := 3;
  rgOpeChequera.ItemIndex := 2;
end;

procedure TWMCoChAd.ilCVE_GPO_CHEQEjecuta(Sender: TObject);
begin
   if Objeto.GrupoCheq.FindKey([ilCVE_GPO_CHEQ.Buffer]) then
   Begin
      cbCVE_GPO_CHEQ.Checked := True;
      cbCVE_GPO_CHEQ.Enabled := True;
      HabilitaControles(False);
   end;
end;

procedure TWMCoChAd.ilCVE_GPO_CHEQCapture(Sender: TObject;
  var Show: Boolean);
begin
 Show := True;
end;

end.
