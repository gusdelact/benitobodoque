// Sistema         : Clase de CR_EMIS_GPO_PRO
// Fecha de Inicio : 19/11/2003
// Función forma   : Clase de CR_EMIS_GPO_PRO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrEmGpPr;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
//UNIDADES ADICIONALES
IntCrEmisor,IntParamCre, IntLinkit,IntGenCre, InterEdit, IntMInstDesc
;

Type
 TCrEmGpPr= class; 

  TWCrEmisGpPro=Class(TForm)
    InterForma1             : TInterForma;
    lbID_EMISOR : TLabel; 
    edID_EMISOR : TEdit;
    lbCVE_GRUPO_PROV : TLabel; 
    edCVE_GRUPO_PROV : TEdit; 
    edDESC_GRUPO_PROV : TEdit;
    lbIMP_RIESGO_MAX : TLabel; 
    rgSIT_GRUPO_PROV : TRadioGroup;
    btEMISOR: TBitBtn;
    edNOM_EMISOR: TEdit;
    Label1: TLabel;
    lbF_ALTA: TLabel;
    lbF_MODIFICA: TLabel;
    LBCVE_USU_ALTA: TLabel;
    lbCVE_USU_MODIFICA: TLabel;
    edF_ALTA: TEdit;
    edF_MODIFICA: TEdit;
    edCVE_USU_ALTA: TEdit;
    edCVE_USU_MODIFICA: TEdit;
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
    ilEMISOR: TInterLinkit;
    edIMP_RIESGO_MAX: TInterEdit;
    Label8: TLabel;
    edCVE_FND_ENT_DES: TEdit;
    btnDESC_ENT_DES: TBitBtn;
    edDESC_ENT_DES: TEdit;
    ilDESC_ENT_DES: TInterLinkit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btEMISORClick(Sender: TObject);
    procedure ilEMISOREjecuta(Sender: TObject);
    procedure edID_EMISORExit(Sender: TObject);
    procedure edCVE_GRUPO_PROVExit(Sender: TObject);
    procedure edDESC_GRUPO_PROVExit(Sender: TObject);
    procedure edIMP_RIESGO_MAXExit(Sender: TObject);
    procedure rgSIT_GRUPO_PROVExit(Sender: TObject);
    procedure ilEMISORCapture(Sender: TObject; var Show: Boolean);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure btnDESC_ENT_DESClick(Sender: TObject);
    procedure btnDESC_ENT_DESExit(Sender: TObject);
    procedure ilDESC_ENT_DESCapture(Sender: TObject; var Show: Boolean);
    procedure ilDESC_ENT_DESEjecuta(Sender: TObject);
    procedure edCVE_FND_ENT_DESExit(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrEmGpPr;
end;
 TCrEmGpPr= class(TInterFrame)
      private
      protected
      public
         vlEmisor    : String;
         vlEntDesc   : String;

        { Public declarations }
        CVE_FND_ENT_DES          : TInterCampo;
        ID_EMISOR                : TInterCampo;
        CVE_GRUPO_PROV           : TInterCampo;
        DESC_GRUPO_PROV          : TInterCampo;
        IMP_RIESGO_MAX           : TInterCampo;
        SIT_GRUPO_PROV           : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        ID_PROVEEDOR             : TInterCampo;

        ParamCre                 : TParamCre;
        Emisor                   : TCrEmisor;
        MInstDesc                : TMInstDesc;


        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrEmGpPr.Create( AOwner : TComponent );
begin Inherited;

      CVE_FND_ENT_DES :=CreaCampo('CVE_FND_ENT_DES',ftString,tsNinguno,tsNinguno,True);
                CVE_FND_ENT_DES.Caption:='Clave de Fnd Ent Des';
      ID_EMISOR :=CreaCampo('ID_EMISOR',ftFloat,tsNinguno,tsNinguno,True);
                ID_EMISOR.Caption:='Emisor';
      CVE_GRUPO_PROV :=CreaCampo('CVE_GRUPO_PROV',ftString,tsNinguno,tsNinguno,True);
                CVE_GRUPO_PROV.Caption:='Clave Grupo';
      DESC_GRUPO_PROV :=CreaCampo('DESC_GRUPO_PROV',ftString,tsNinguno,tsNinguno,True);
                DESC_GRUPO_PROV.Caption:='Descripción';
      IMP_RIESGO_MAX :=CreaCampo('IMP_RIESGO_MAX',ftFloat,tsNinguno,tsNinguno,True);
                IMP_RIESGO_MAX.Caption:='Riesgo Autorizado Grupo';
      SIT_GRUPO_PROV :=CreaCampo('SIT_GRUPO_PROV',ftString,tsNinguno,tsNinguno,True);
         With SIT_GRUPO_PROV do
          begin Size:=2;
                UseCombo:=True;
                ComboLista.Add('0'); ComboDatos.Add(CSIT_AC);
                ComboLista.Add('1'); ComboDatos.Add(CSIT_CA);
          end;
                SIT_GRUPO_PROV.Caption:='Situación del Proveedor dentro del Grupo';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      ID_PROVEEDOR :=CreaCampo('ID_PROVEEDOR',ftFloat,tsNinguno,tsNinguno,False);
      FKeyFields.Add('CVE_FND_ENT_DES');
      FKeyFields.Add('ID_EMISOR');
      FKeyFields.Add('CVE_GRUPO_PROV');

      TableName := 'CR_EMIS_GPO_PRO';
      UseQuery := True;
      HelpFile := 'IntCrEmGpPr.Hlp';
      ShowMenuReporte:=True;

      Emisor := TCrEmisor.Create(Self);
      Emisor.MasterSource:=Self;
      Emisor.FieldByName('CVE_FND_ENT_DES').MasterField:='CVE_FND_ENT_DES';
      Emisor.FieldByName('ID_ACREDITADO').MasterField:='ID_EMISOR';
      {Emisor.BuscaWhereString := ' CR_EMISOR.ID_ACREDITADO IN (SELECT ID_EMISOR FROM CR_EMISOR_PROV' +
                                 '                          WHERE SIT_EMISOR_PROV = ' + #39+ CSIT_AC + #39  + ')';
      Emisor.FilterString := Emisor.BuscaWhereString;}

      MInstDesc := TMInstDesc.Create(Self);
      MInstDesc.MasterSource:= Self;
      MInstDesc.FieldByName('CVE_FND_ENT_DES').MasterField:= 'CVE_FND_ENT_DES';
end;

Destructor TCrEmGpPr.Destroy;
begin
   if Emisor <> nil then
      Emisor.Free;
   If MInstDesc <> nil Then
      MInstDesc.Free;
   inherited;
end;


function TCrEmGpPr.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrEmisGpPro;
begin
   W:=TWCrEmisGpPro.Create(Self);
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


Function TCrEmGpPr.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrEGpP.it','S,F,S');
      Try
         if Active then begin
            T.Param(0,CVE_FND_ENT_DES.AsString);
            T.Param(1,ID_EMISOR.AsString);
            T.Param(2,CVE_GRUPO_PROV.AsString);
         end;
         if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2)]);
      finally  T.Free;
      end;
end;


(***********************************************FORMA CR_EMIS_GPO_PRO********************)
(*                                                                              *)
(*  FORMA DE CR_EMIS_GPO_PRO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_EMIS_GPO_PRO********************)

procedure TWCrEmisGpPro.FormShow(Sender: TObject);
begin
      // Pinta datos del panel
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_FND_ENT_DES.Control:=edCVE_FND_ENT_DES;
      Objeto.ID_EMISOR.Control:=edID_EMISOR;
      Objeto.CVE_GRUPO_PROV.Control:=edCVE_GRUPO_PROV;
      Objeto.DESC_GRUPO_PROV.Control:=edDESC_GRUPO_PROV;
      Objeto.IMP_RIESGO_MAX.Control:=edIMP_RIESGO_MAX;
      Objeto.SIT_GRUPO_PROV.Control:=rgSIT_GRUPO_PROV;
      Objeto.F_ALTA.Control := edF_ALTA;
      Objeto.CVE_USU_ALTA.Control := edCVE_USU_ALTA;
      Objeto.F_MODIFICA.Control := edF_MODIFICA;
      Objeto.CVE_USU_MODIFICA.Control := edCVE_USU_MODIFICA;

      Objeto.Emisor.CVE_FND_ENT_DES.Control:=edCVE_FND_ENT_DES;
      Objeto.Emisor.Acreditado.Persona.Nombre.Control := edNOM_EMISOR;
      Objeto.Emisor.GetParams(Objeto);

      Objeto.MInstDesc.CVE_FND_ENT_DES.Control := edCVE_FND_ENT_DES;
      Objeto.MInstDesc.DESC_ENT_DES.Control := edDESC_ENT_DES;
      Objeto.MInstDesc.GetParams(Objeto);

      Interforma1.MsgPanel := MsgPanel;
end;

procedure TWCrEmisGpPro.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_FND_ENT_DES.Control:=nil;
      Objeto.ID_EMISOR.Control:=nil;
      Objeto.CVE_GRUPO_PROV.Control:=nil;
      Objeto.DESC_GRUPO_PROV.Control:=nil;
      Objeto.IMP_RIESGO_MAX.Control:=nil;
      Objeto.SIT_GRUPO_PROV.Control:=nil;
      Objeto.F_ALTA.Control := nil;
      Objeto.CVE_USU_ALTA.Control := nil;
      Objeto.F_MODIFICA.Control := nil;
      Objeto.CVE_USU_MODIFICA.Control := nil;

      Objeto.Emisor.CVE_FND_ENT_DES.Control:=nil;
      Objeto.Emisor.Acreditado.Persona.Nombre.Control := nil;
      Objeto.MInstDesc.CVE_FND_ENT_DES.Control := nil;
      Objeto.MInstDesc.DESC_ENT_DES.Control := nil;
end;

procedure TWCrEmisGpPro.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrEmisGpPro.InterForma1DespuesNuevo(Sender: TObject);
begin
   rgSIT_GRUPO_PROV.ItemIndex := 0;
   Objeto.F_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresa;
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   Objeto.ID_EMISOR.AsString := Objeto.vlEmisor;
   Objeto.CVE_FND_ENT_DES.AsString := Objeto.vlEntDesc;

   Objeto.Emisor.FindKeyNear([Objeto.vlEntDesc,Objeto.vlEmisor],['CVE_FND_ENT_DES','ID_ACREDITADO']);
   edCVE_FND_ENT_DES.SetFocus;
end;

procedure TWCrEmisGpPro.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.F_MODIFICA.AsDateTime := Objeto.Apli.DameFechaEmpresa;
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
   edDESC_GRUPO_PROV.SetFocus;
end;


procedure TWCrEmisGpPro.btEMISORClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCREMGPPR_EMIS',True,True) then
   begin
       Objeto.CVE_FND_ENT_DES.GetFromControl;
       If Objeto.CVE_FND_ENT_DES.AsString <> '' Then Begin
          Objeto.Emisor.BuscaWhereString :='       CR_EMISOR.ID_ACREDITADO IN (SELECT ID_EMISOR FROM CR_EMISOR_PROV' +
                                           ' WHERE SIT_EMISOR_PROV = ' + #39+ CSIT_AC + #39  + ')'+
                                           ' AND  CR_EMISOR.CVE_FND_ENT_DES = ' + #39 + Objeto.CVE_FND_ENT_DES.AsString + #39;
          Objeto.Emisor.FilterString := Objeto.Emisor.BuscaWhereString;
       End;
       Objeto.Emisor.ShowAll := True;
       If Objeto.Emisor.Busca then
          Interforma1.NextTab(edID_EMISOR);
   end;
end;

procedure TWCrEmisGpPro.ilEMISOREjecuta(Sender: TObject);
begin
   Objeto.CVE_FND_ENT_DES.GetFromControl;
   If Objeto.CVE_FND_ENT_DES.AsString <> '' Then Begin
      Objeto.Emisor.BuscaWhereString :=' CR_EMISOR.ID_ACREDITADO IN (SELECT ID_EMISOR FROM CR_EMISOR_PROV' +
                                       ' WHERE SIT_EMISOR_PROV = ' + #39+ CSIT_AC + #39  + ')'+
                                       ' AND  CR_EMISOR.CVE_FND_ENT_DES = ' + #39 + Objeto.CVE_FND_ENT_DES.AsString + #39;
      Objeto.Emisor.FilterString := Objeto.Emisor.BuscaWhereString;
   End;

   If Objeto.Emisor.FindKeyNear([Objeto.CVE_FND_ENT_DES.AsString,ilEMISOR.Buffer],['CVE_FND_ENT_DES','ID_ACREDITADO']) Then Begin
      InterForma1.NextTab(edID_EMISOR);
   End;
end;

procedure TWCrEmisGpPro.edID_EMISORExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMesg     :  String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMesg     := '';
      vlSalida := True;
      Objeto.ID_EMISOR.GetFromControl;
      if Objeto.ID_EMISOR.AsString = '' then
      Begin
         vlSalida  := False;
         vlMesg    := 'Favor de Indicar al Emisor';
      end
      else if Objeto.Emisor.SIT_EMISOR.AsString <> 'AC' then
      Begin
         vlSalida  := False;
         vlMesg     := 'Emisor no Activo';
      end; //end if
      InterForma1.ValidaExit(edID_EMISOR,vlSalida,vlMesg,True);
   end; //end if
end;

procedure TWCrEmisGpPro.edCVE_GRUPO_PROVExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMesg     :  String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMesg     := '';
      vlSalida := True;
      Objeto.CVE_GRUPO_PROV.GetFromControl;
      if Objeto.CVE_GRUPO_PROV.AsString = '' then
      Begin
         vlSalida  := False;
         vlMesg    := 'Favor de Indicar al Emisor';
      end;
      InterForma1.ValidaExit(edCVE_GRUPO_PROV,vlSalida,vlMesg,True);
   end; //end if
end;

procedure TWCrEmisGpPro.edDESC_GRUPO_PROVExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edDESC_GRUPO_PROV,True,'',True);
end;

procedure TWCrEmisGpPro.edIMP_RIESGO_MAXExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMesg     :  String;
     vlMontoAcum : Double;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMesg     := '';
      vlSalida := True;
      Objeto.IMP_RIESGO_MAX.GetFromControl;
      if not (ValNumPositivo(vlMesg,Objeto.IMP_RIESGO_MAX.AsInteger)) then
         vlSalida  := False;
      //end if
      if Objeto.ID_PROVEEDOR.AsString <> '' then
      Begin
         vlMontoAcum := ObtenRiesgoAcumulado(Objeto.ID_EMISOR.AsString,Objeto.ID_PROVEEDOR.AsString, Objeto.Apli);
         if Objeto.IMP_RIESGO_MAX.AsFloat <= vlMontoAcum then
         Begin
            vlMesg := 'El Riesgo Máximo por grupo no debe de ser menor al monto Acumulado : ' + FORMAT(CFORMAT_DINERO,[vlMontoAcum])+
                      ' de la relación Emisor - Proveedor';
            vlSalida := False;
         end;
      end;
      InterForma1.ValidaExit(edIMP_RIESGO_MAX,vlSalida,vlMesg,True);
   end;
end;

procedure TWCrEmisGpPro.rgSIT_GRUPO_PROVExit(Sender: TObject);
begin
      InterForma1.ValidaExit(rgSIT_GRUPO_PROV,True,'',True);
end;

procedure TWCrEmisGpPro.ilEMISORCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrEmisGpPro.InterForma1DespuesShow(Sender: TObject);
begin
   Objeto.Emisor.FindKeyNear([Objeto.CVE_FND_ENT_DES.AsString,Objeto.ID_EMISOR.AsString],['CVE_FND_ENT_DES','ID_ACREDITADO']);
end;

procedure TWCrEmisGpPro.btnDESC_ENT_DESClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCREMGPPR_ENTDES',True,True) then
   begin
     Objeto.MInstDesc.ShowAll := True;
     If Objeto.MInstDesc.Busca then
        Interforma1.NextTab(edCVE_FND_ENT_DES);
   end;
end;

procedure TWCrEmisGpPro.btnDESC_ENT_DESExit(Sender: TObject);
var
   vlSalida  :  boolean;
   vlMesg     :  String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then begin
      vlMesg     := '';
      vlSalida := True;
      Objeto.CVE_FND_ENT_DES.GetFromControl;
      if Objeto.CVE_FND_ENT_DES.AsString = '' then Begin
         vlSalida  := False;
         vlMesg    := 'Favor de Indicar la Entidad Descontadora';
      end; //end if
      InterForma1.ValidaExit(edCVE_FND_ENT_DES,vlSalida,vlMesg,True);
   end; //end if
end;

procedure TWCrEmisGpPro.ilDESC_ENT_DESCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrEmisGpPro.ilDESC_ENT_DESEjecuta(Sender: TObject);
begin
   if Objeto.MInstDesc.FindKey([ilDESC_ENT_DES.Buffer]) then Begin
      InterForma1.NextTab(edCVE_FND_ENT_DES);
   end;
end;

procedure TWCrEmisGpPro.edCVE_FND_ENT_DESExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMesg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      VLMesg     := '';
      VLSalida := True;
      Objeto.CVE_FND_ENT_DES.GetFromControl;
      if Objeto.CVE_FND_ENT_DES.AsString = '' then
      Begin
         VLSalida  := False;
         VLMesg     := 'Favor de Indicar la Entidad Descontadora';
      end; //end if
      InterForma1.ValidaExit(edCVE_FND_ENT_DES,VLSalida,VLMesg,True);
   end;
end;

end.
