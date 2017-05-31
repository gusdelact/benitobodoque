// Sistema         : Clase de SCMeCheT
// Fecha de Inicio : 25/02/1999
// Función forma   : Clase de SCMeCheT
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Manuel Romero Ibarra
// Comentarios     :
Unit IntMCtaAcr;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,

//Unidades Adicionales
IntParamCre, IntCrCreChe,
IntPers, IntChCte, IntCrCredito, IntGenCre, IntMon;

Type
 TCrMCtaAcr= class;

  TWCrMCtaAcr=Class(TForm)
    InterForma1             : TInterForma;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    lbID_ACREDITADO: TLabel;
    edID_ACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE: TEdit;
    edCREDITO: TEdit;
    btCREDITO: TBitBtn;
    edID_CREDITO: TEdit;
    lbID_CREDITO: TLabel;
    lbCUENTA_BANCO: TLabel;
    btBANCO: TBitBtn;
    edBANCO: TEdit;
    edNombreBANCO: TEdit;
    rgCVE_TIP_OPE_CHQ: TRadioGroup;
    rgSIT_CHEQUERA: TRadioGroup;
    Label7: TLabel;
    Label8: TLabel;
    cbACREDITADO: TCheckBox;
    cbCREDITO: TCheckBox;
    cbBANCO: TCheckBox;
    ILAcreditado: TInterLinkit;
    ilCredito: TInterLinkit;
    ILBanco: TInterLinkit;
    rgCVE_TIP_CHEQ: TRadioGroup;
    rgCVE_TIP_ACRED: TRadioGroup;
    lbCVE_MONEDA: TLabel;
    edCVE_MONEDA: TEdit;
    btMONEDA: TBitBtn;
    edDESC_MONEDA: TEdit;
    cbMONEDA: TCheckBox;
    ilMONEDA: TInterLinkit;
    chB_CTA_TERCEROS: TCheckBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure btBANCOClick(Sender: TObject);
    procedure cbACREDITADOClick(Sender: TObject);
    procedure cbCREDITOClick(Sender: TObject);
    procedure cbBANCOClick(Sender: TObject);
    procedure btACREDITADOExit(Sender: TObject);
    procedure ILAcreditadoEjecuta(Sender: TObject);
    procedure ILBancoEjecuta(Sender: TObject);
    procedure btCREDITOClick(Sender: TObject);
    procedure ilCreditoEjecuta(Sender: TObject);
    procedure btCREDITOExit(Sender: TObject);
    procedure btBANCOExit(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure btMONEDAClick(Sender: TObject);
    procedure cbMONEDAClick(Sender: TObject);
    procedure ilMONEDAEjecuta(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrMCtaAcr;
end;
 TCrMCtaAcr= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        vgAcreditado          : String;

        ID_ACREDITADO         : TInterCampo;
        UTIL_ID_ACRED         : TInterCampo;
        ID_CREDITO            : TInterCampo;
        UTIL_ID_CREDITO       : TInterCampo;
        CVE_TIPO_ACRED        : TInterCampo;
        CVE_TIPO_CHEQ         : TInterCampo;
        ID_BANCO              : TInterCampo;
        UTIL_ID_BANCO         : TInterCampo;
        CVE_TIP_OPE_CHQ       : TInterCampo;
        SIT_CHEQUERA          : TInterCampo;
        CVE_MONEDA            : TInterCampo;
        UTIL_MONEDA           : TInterCampo;
        B_CTA_TERCEROS        : TInterCampo;


        ParamCre              : TParamCre;
        Persona               : TPersona;
        Banco                 : TCheqCte;
        Credito               : TCrCredito;
        Moneda                : TMoneda;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        Procedure   DataBaseChange; override;
      published
      end;

implementation
Uses IntCrQRCtaAcr;

{$R *.DFM}

//***************************************************************************************************
Procedure TCrMCtaAcr.DataBaseChange;
begin
     inherited;
end;

//***************************************************************************************************

constructor TCrMCtaAcr.Create( AOwner : TComponent );
begin Inherited;

      ID_ACREDITADO := CreaCampo('ID_ACREDITADO',ftFloat,tsNinguno,tsNinguno,False);
                ID_ACREDITADO.Caption:='Acreditado';
      UTIL_ID_ACRED := CreaCampo('UTIL_ID_ACRED',ftString,tsNinguno,tsNinguno,False);
         UTIL_ID_ACRED.Size:=1;
            UTIL_ID_ACRED.Caption:='Utiliza Acreditado';

      ID_CREDITO := CreaCampo('ID_CREDITO',ftString,tsNinguno,tsNinguno,False);
            ID_CREDITO.Caption:='Id Crédito';
      UTIL_ID_CREDITO := CreaCampo('UTIL_ID_CREDITO',ftString,tsNinguno,tsNinguno,False);
         UTIL_ID_CREDITO.Size:=1;
            UTIL_ID_CREDITO.Caption :='Utiliza Crédito';
      CVE_TIPO_ACRED :=CreaCampo('CVE_TIPO_ACRED',ftFloat,tsNinguno,tsNinguno,False);
      With CVE_TIPO_ACRED do
      begin Size:=2;
            UseCombo:=True;
            ComboLista.Add('0'); ComboDatos.Add(C_ACRED);
            ComboLista.Add('1'); ComboDatos.Add(C_PROCA);
            ComboLista.Add('2'); ComboDatos.Add(C_PROVE);
      end;
      CVE_TIPO_CHEQ :=CreaCampo('CVE_TIPO_CHEQ',ftFloat,tsNinguno,tsNinguno,False);
      With CVE_TIPO_CHEQ do
      begin Size:=2;
            UseCombo:=True;
            ComboLista.Add('0'); ComboDatos.Add(C_ADMIN);
            ComboLista.Add('1'); ComboDatos.Add(C_LIQUI);
            ComboLista.Add('2'); ComboDatos.Add(C_CHQIND);
      end;
      ID_BANCO := CreaCampo('ID_BANCO',ftFloat,tsNinguno,tsNinguno,False);
                ID_BANCO.Caption:='Banco';
      UTIL_ID_BANCO := CreaCampo('UTIL_ID_BANCO',ftFloat,tsNinguno,tsNinguno,False);
            UTIL_ID_BANCO.Size:=1;
                UTIL_ID_BANCO.Caption:='Utiliza Banco';

      CVE_TIP_OPE_CHQ := CreaCampo('CVE_TIP_OPE_CHQ',ftFloat,tsNinguno,tsNinguno,False);
          With CVE_TIP_OPE_CHQ do
          begin Size:=2;
                UseCombo:=True;
                ComboLista.Add('0'); ComboDatos.Add(C_CARGO);
                ComboLista.Add('1'); ComboDatos.Add(C_ABONO);
                ComboLista.Add('2'); ComboDatos.Add(C_AMBOS);
          end;
                CVE_TIP_OPE_CHQ.Caption:='Tipo de Operación de la Chequera';
      SIT_CHEQUERA := CreaCampo('SIT_CHEQUERA',ftFloat,tsNinguno,tsNinguno,False);
          With SIT_CHEQUERA do
          begin Size:=2;
                UseCombo:=True;
                ComboLista.Add('0'); ComboDatos.Add(CSIT_AC);
                ComboLista.Add('1'); ComboDatos.Add(CSIT_CA);
                ComboLista.Add('2'); ComboDatos.Add(C_AMBOS);
          end;
                SIT_CHEQUERA.Caption:='Situación de la Chequera';
      CVE_MONEDA :=CreaCampo('CVE_MONEDA',ftInteger,tsNinguno,tsNinguno,False);
          CVE_MONEDA.Caption:='Cve. Moneda';
      UTIL_MONEDA := CreaCampo('UTIL_MONEDA',ftFloat,tsNinguno,tsNinguno,False);
            UTIL_MONEDA.Size:=1;
                UTIL_MONEDA.Caption:='Utiliza Moneda';
      B_CTA_TERCEROS := CreaCampo('B_CTA_TERCEROS',ftFloat,tsNinguno,tsNinguno,False);
            B_CTA_TERCEROS.Size:=1;
                B_CTA_TERCEROS.Caption:='Cta. de Terceros';

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntMCtaAcr.Hlp';
      ShowMenuReporte:=True;

      {$WARNINGS OFF}
      Persona := TPersona.Create(Self);
      {$WARNINGS ON}
      Persona.MasterSource := Self;
      Persona.Id_Persona.MasterField := 'ID_ACREDITADO';
      Persona.BuscaWhereString := '(   PERSONA.ID_PERSONA IN (SELECT ID_ACREDITADO FROM CR_ACREDITADO ) ' +
                                  ' OR PERSONA.ID_PERSONA IN (SELECT ID_ACREDITADO FROM CR_PROVEEDOR  ))';
      Persona.FilterString := Persona.BuscaWhereString;

      {$WARNINGS OFF}
      Banco := TCheqCte.Create(Self);
      {$WARNINGS ON}
      Banco.MasterSource := Self;
      Banco.Id_Banco_Chqra.MasterField := 'ID_BANCO';

      {$WARNINGS OFF}
      Credito := TCrCredito.Create(Self);
      {$WARNINGS ON}
      Credito.MasterSource := Self;
      Credito.ID_CREDITO.MasterField := 'ID_CREDITO';

      {$WARNINGS OFF}
      Moneda := TMoneda.Create(Self);
      {$WARNINGS ON}
      Moneda.MasterSource := Self;
      Moneda.Cve_Moneda.MasterField := 'CVE_MONEDA';

      Modo:= moEdit;

end;

Destructor TCrMCtaAcr.Destroy;
begin
     if Persona <> nil then
        Persona.Free;
     //end if
     if Banco <> nil then
        Banco.Free;
     //end if
     if Credito <> nil then
        Credito.Free;
     //end if
     if Moneda <> nil then
        Moneda.Free;
     //end if
     inherited;
end;


function TCrMCtaAcr.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrMCtaAcr;
begin
   W:=TWCrMCtaAcr.Create(Self);
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

Function TCrMCtaAcr.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('IMCheT.it','');
      Try if Active then begin end;
      finally  T.Free;
      end;
end;

(***********************************************FORMA SCMeCheT********************)
(*                                                                              *)
(*  FORMA DE CrMCtaAcr                                                            *)
(*                                                                              *)
(***********************************************FORMA SCMeCheT********************)

procedure TWCrMCtaAcr.FormShow(Sender: TObject);
begin
      //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
     lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
     lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
     lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
     lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

     Objeto.CVE_TIPO_ACRED.Control := rgCVE_TIP_ACRED;
     Objeto.CVE_TIPO_CHEQ.Control := rgCVE_TIP_CHEQ;
     Objeto.CVE_TIP_OPE_CHQ.Control:= rgCVE_TIP_OPE_CHQ;
     Objeto.SIT_CHEQUERA.Control:= rgSIT_CHEQUERA;
     Objeto.B_CTA_TERCEROS.Control:= chB_CTA_TERCEROS;

     Objeto.Persona.Id_Persona.Control := edID_ACREDITADO;
     Objeto.Persona.Nombre.Control := edNOMBRE;
     Objeto.UTIL_ID_ACRED.Control := cbACREDITADO;
     Objeto.Persona.GetParams(Objeto);

     Objeto.Banco.Id_Banco_Chqra.Control := edBANCO;
     Objeto.Banco.Intermediario.Persona.Nombre.Control := edNombreBANCO;
     Objeto.Banco.GetParams(Objeto);
     Objeto.UTIL_ID_BANCO.Control := cbBANCO;

     Objeto.Credito.ID_CREDITO.Control := edID_CREDITO;
     Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := edCredito;
     Objeto.Banco.GetParams(Objeto);
     Objeto.UTIL_ID_CREDITO.Control := cbCREDITO;

     Objeto.Moneda.Cve_Moneda.Control := edCVE_MONEDA;
     Objeto.Moneda.Desc_Moneda.Control := edDESC_MONEDA;
     Objeto.Moneda.GetParams(Objeto);
     Objeto.UTIL_MONEDA.Control := cbMONEDA;

     if Objeto.vgAcreditado <> '' then
     begin
          if Objeto.Persona.FindKey([Objeto.vgAcreditado]) then
          begin
               cbACREDITADO.Checked:=True;
               cbACREDITADO.Enabled:=True;
          end;
     end;

end;

procedure TWCrMCtaAcr.FormDestroy(Sender: TObject);
begin
     Objeto.CVE_TIPO_ACRED.Control := nil;
     Objeto.CVE_TIPO_CHEQ.Control := nil;
     Objeto.CVE_TIP_OPE_CHQ.Control:= nil;
     Objeto.SIT_CHEQUERA.Control:= nil;
     Objeto.B_CTA_TERCEROS.Control:= nil;

     Objeto.Persona.Id_Persona.Control := nil;
     Objeto.Persona.Nombre.Control := nil;
     Objeto.UTIL_ID_ACRED.Control := nil;

     Objeto.Banco.Id_Banco_Chqra.Control := nil;
     Objeto.Banco.Intermediario.Persona.Nombre.Control := nil;
     Objeto.UTIL_ID_BANCO.Control := nil;

     Objeto.Credito.ID_CREDITO.Control := nil;
     Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := nil;
     Objeto.UTIL_ID_CREDITO.Control := nil;

     Objeto.Moneda.Cve_Moneda.Control := nil;
     Objeto.Moneda.Desc_Moneda.Control := nil;
     Objeto.UTIL_MONEDA.Control := nil;
end;

procedure TWCrMCtaAcr.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrMCtaAcr.InterForma1BtnImprimirClick(Sender: TObject);
begin
     Objeto.UTIL_ID_ACRED.GetFromControl;
     Objeto.UTIL_ID_CREDITO.GetFromControl;
     Objeto.UTIL_ID_BANCO.GetFromControl;
     objeto.CVE_TIPO_ACRED.GetFromControl;
     Objeto.CVE_TIPO_CHEQ.GetFromControl;
     Objeto.CVE_TIP_OPE_CHQ.GetFromControl;
     Objeto.SIT_CHEQUERA.GetFromControl;
     Objeto.UTIL_MONEDA.GetFromControl;
     Objeto.B_CTA_TERCEROS.GetFromControl;
     Execute_RepCtasAcred(False, Objeto);
end;

procedure TWCrMCtaAcr.InterForma1BtnPreviewClick(Sender: TObject);
begin
        Objeto.UTIL_ID_ACRED.GetFromControl;
        Objeto.UTIL_ID_CREDITO.GetFromControl;
        Objeto.UTIL_ID_BANCO.GetFromControl;
        objeto.CVE_TIPO_ACRED.GetFromControl;
        Objeto.CVE_TIPO_CHEQ.GetFromControl;
        Objeto.CVE_TIP_OPE_CHQ.GetFromControl;
        Objeto.SIT_CHEQUERA.GetFromControl;
        Objeto.UTIL_MONEDA.GetFromControl;
        Objeto.B_CTA_TERCEROS.GetFromControl;
        Execute_RepCtasAcred(True, Objeto);
end;

procedure TWCrMCtaAcr.btACREDITADOClick(Sender: TObject);
begin
        Objeto.Persona.ShowAll := True;
        if Objeto.Persona.Busca then
        begin
             Objeto.ID_ACREDITADO := Objeto.Persona.Id_Persona;
             cbACREDITADO.Checked := True;
             cbACREDITADO.Enabled := True;
        end;
end;

procedure TWCrMCtaAcr.btBANCOClick(Sender: TObject);
begin
        Objeto.Banco.ShowAll := True;
        if Objeto.Banco.Busca then
        Begin
           Objeto.ID_BANCO := Objeto.Banco.Id_Banco_Chqra;
           cbBANCO.Checked := True;
           cbBANCO.Enabled := True;
        end;
end;

procedure TWCrMCtaAcr.cbACREDITADOClick(Sender: TObject);
begin
     if Not(cbACREDITADO.Checked) then
     begin
          edID_ACREDITADO.Clear;
          edNOMBRE.Clear;
          Objeto.Persona.Active := False;
          cbACREDITADO.Checked := False;
          cbACREDITADO.Enabled := False;
     end;
end;

procedure TWCrMCtaAcr.cbCREDITOClick(Sender: TObject);
begin
     if Not(cbCREDITO.Checked) then
     begin
          edID_CREDITO.Clear;
          edCREDITO.Clear;
          cbCREDITO.Checked := False;
          cbCREDITO.Enabled := False;
          Objeto.Credito.Active := False;
     end;
end;

procedure TWCrMCtaAcr.cbBANCOClick(Sender: TObject);
begin
     if Not(cbBANCO.Checked) then
     begin
          edBANCO.Clear;
          edNombreBANCO.Clear;
          cbBANCO.Checked := False;
          cbBANCO.Enabled := False;
          Objeto.Banco.Active := False;
     end;
end;

procedure TWCrMCtaAcr.btACREDITADOExit(Sender: TObject);
Begin
     if Objeto.ID_ACREDITADO.AsString = '' then
      Begin
         cbACREDITADO.Enabled := False;
         cbACREDITADO.Checked := False;
      end
     else
      Begin
         cbACREDITADO.Enabled := True;
         cbACREDITADO.Checked := True;
      end;
end;

procedure TWCrMCtaAcr.ILAcreditadoEjecuta(Sender: TObject);
begin
    if  Objeto.Persona.FindKey([ILAcreditado.Buffer]) then
    begin
        Objeto.ID_ACREDITADO := Objeto.Persona.Id_Persona;
        cbACREDITADO.Checked := True;
        cbACREDITADO.Enabled := True;
    end;
end;

procedure TWCrMCtaAcr.ILBancoEjecuta(Sender: TObject);
begin
    if  Objeto.Persona.FindKey([ILAcreditado.Buffer]) then
    Begin
        Objeto.ID_BANCO := Objeto.Banco.Id_Banco_Chqra;
        cbBANCO.Checked := True;
        cbBANCO.Enabled := True;
    end;
end;

procedure TWCrMCtaAcr.btCREDITOClick(Sender: TObject);
begin
        Objeto.Credito.ShowAll := True;
        if Objeto.Credito.Busca then
        Begin
           Objeto.ID_CREDITO := Objeto.Credito.ID_CREDITO;
           cbCREDITO.Checked := True;
           cbCREDITO.Enabled := True;
        end;
end;

procedure TWCrMCtaAcr.ilCreditoEjecuta(Sender: TObject);
begin
    if  Objeto.Credito.FindKey([ilCredito.Buffer]) then
    begin
        Objeto.ID_CREDITO := Objeto.Credito.ID_CREDITO;
        cbCREDITO.Checked := True;
        cbCREDITO.Enabled := True;
    end;
end;

procedure TWCrMCtaAcr.btCREDITOExit(Sender: TObject);
begin
     if Objeto.ID_CREDITO.AsString = '' then
      Begin
         cbCREDITO.Enabled := False;
         cbCREDITO.Checked := False;
      end
     else
      Begin
         cbCREDITO.Enabled := True;
         cbCREDITO.Checked := True;
      end;
end;

procedure TWCrMCtaAcr.btBANCOExit(Sender: TObject);
begin
     if Objeto.ID_BANCO.AsString = '' then
      Begin
         cbBANCO.Enabled := False;
         cbBANCO.Checked := False;
      end
     else
      Begin
         cbBANCO.Enabled := True;
         cbBANCO.Checked := True;
      end;
end;

procedure TWCrMCtaAcr.InterForma1DespuesShow(Sender: TObject);
begin
   rgCVE_TIP_OPE_CHQ.ItemIndex := 0;
   rgSIT_CHEQUERA.ItemIndex := 0;
   rgCVE_TIP_CHEQ.ItemIndex := 0;
   rgCVE_TIP_ACRED.ItemIndex := 0;
end;

procedure TWCrMCtaAcr.btMONEDAClick(Sender: TObject);
begin
        Objeto.Moneda.ShowAll := True;
        if Objeto.Moneda.Busca then
        Begin
           Objeto.CVE_MONEDA := Objeto.Moneda.Cve_Moneda;
           cbMONEDA.Checked := True;
           cbMONEDA.Enabled := True;
        end;
end;

procedure TWCrMCtaAcr.cbMONEDAClick(Sender: TObject);
begin
     if Not(cbMONEDA.Checked) then
     begin
          edCVE_MONEDA.Clear;
          edDESC_MONEDA.Clear;
          cbMONEDA.Checked := False;
          cbMONEDA.Enabled := False;
          Objeto.Moneda.Active := False;
     end;
end;

procedure TWCrMCtaAcr.ilMONEDAEjecuta(Sender: TObject);
begin
    if  Objeto.Moneda.FindKey([ilMONEDA.Buffer]) then
    begin
        Objeto.CVE_MONEDA := Objeto.Moneda.Cve_Moneda;
        cbMONEDA.Checked := True;
        cbMONEDA.Enabled := True;
    end;
end;

end.
