// Sistema         : Clase de CR_RIESGO_MDO
// Fecha de Inicio : 29/11/2005
// Función forma   : Clase de CR_RIESGO_MDO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrRiesMdo;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,

IntGenCre,
IntParamCre,
IntMProdGpo, // Grupo de Producto
IntCrGruCla  //GRUPO CLAVES
;

const
  C_GRUPO_CLAVE_RSGMDO = 'RSGMDO';
  C_FOLIO_CRRSGMDO     = 'CRRSGMDO';

Type
 TCrRiesMdo= class;

  TWCrRiesgoMdo=Class(TForm)
    InterForma1             : TInterForma;
    edCVE_PRODUCTO_GPO : TEdit;
    lbF_INI_VIGENCIA : TLabel;
    dtpF_INI_VIGENCIA : TInterDateTimePicker;
    edF_INI_VIGENCIA : TEdit;
    lbCVE_CRIT_RIESGO : TLabel;
    edCVE_CRIT_RIESGO : TEdit;
    lbPCT_RIESGO : TLabel;
    lbCVE_USU_MODIFICA: TLabel;
    lbCVE_USU_ALTA: TLabel;
    lbF_ALTA: TLabel;
    lbF_MODIFICA: TLabel;
    edCVE_USU_ALTA: TEdit;
    edCVE_USU_MODIFICA: TEdit;
    edF_ALTA: TEdit;
    edF_MODIFICA: TEdit;
    rgSIT_RIESGO_MDO: TRadioGroup;
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
    btCVE_PRODUCTO_GPO: TBitBtn;
    edDESC_L_PROD_GPO: TEdit;
    btCVE_CRIT_RIESGO: TBitBtn;
    edVALOR: TEdit;
    lbCVE_PRODUCTO_GPO: TLabel;
    ilCVE_PRODUCTO_GPO: TInterLinkit;
    ilCVE_CRIT_RIESGO: TInterLinkit;
    edPCT_RIESGO: TInterEdit;
    lbPCT_RIESGO1: TLabel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure ilCVE_PRODUCTO_GPOCapture(Sender: TObject;
      var Show: Boolean);
    procedure btCVE_PRODUCTO_GPOClick(Sender: TObject);
    procedure btCVE_CRIT_RIESGOClick(Sender: TObject);
    procedure ilCVE_PRODUCTO_GPOEjecuta(Sender: TObject);
    procedure ilCVE_CRIT_RIESGOEjecuta(Sender: TObject);
    procedure edCVE_PRODUCTO_GPOExit(Sender: TObject);
    procedure btCVE_PRODUCTO_GPOExit(Sender: TObject);
    procedure edCVE_CRIT_RIESGOExit(Sender: TObject);
    procedure btCVE_CRIT_RIESGOExit(Sender: TObject);
    procedure edPCT_RIESGOExit(Sender: TObject);
    procedure edF_INI_VIGENCIAExit(Sender: TObject);
    procedure dtpF_INI_VIGENCIAExit(Sender: TObject);
    procedure rgSIT_RIESGO_MDOExit(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1Buscar(Sender: TObject);
    private 
    { Private declarations }
    function ExisteRiesgo(peID_RIESGO_MDO   : Integer;
                          peCVE_PRODUCTO_GPO ,
                          peCVE_CRIT_RIESGO : String;
                          peF_INI_VIGENCIA  : TDateTime) : Boolean;

    public 
    { Public declarations } 
    Objeto : TCrRiesMdo;
end;
 TCrRiesMdo= class(TInterFrame)
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        ParamCre : TParamCre;         
        ID_RIESGO_MDO            : TInterCampo;
        CVE_PRODUCTO_GPO         : TInterCampo;
        F_INI_VIGENCIA           : TInterCampo;
        CVE_CRIT_RIESGO          : TInterCampo;
        PCT_RIESGO               : TInterCampo;
        SIT_RIESGO_MDO           : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        F_MODIFICA               : TInterCampo;

        ProdGpo                  : TMProdGpo;
        TipoRiesgo               : TCrGruCla;

        function    InternalBusca : Boolean; override; 
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override; 
      published 
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrRiesMdo.Create( AOwner : TComponent ); 
begin Inherited; 
      ID_RIESGO_MDO :=CreaCampo('ID_RIESGO_MDO',ftFloat,tsNinguno,tsNinguno,True);
                ID_RIESGO_MDO.Caption:='Número de Riesgo Mdo';
      CVE_PRODUCTO_GPO :=CreaCampo('CVE_PRODUCTO_GPO',ftString,tsNinguno,tsNinguno,True);
                CVE_PRODUCTO_GPO.Caption:='Clave de Producto Grupo';
      F_INI_VIGENCIA :=CreaCampo('F_INI_VIGENCIA',ftDate,tsNinguno,tsNinguno,True);
                F_INI_VIGENCIA.Caption:='Fecha Ini Vigencia';
      CVE_CRIT_RIESGO :=CreaCampo('CVE_CRIT_RIESGO',ftString,tsNinguno,tsNinguno,True);
                CVE_CRIT_RIESGO.Caption:='Clave de Crit Riesgo';
      PCT_RIESGO :=CreaCampo('PCT_RIESGO',ftFloat,tsNinguno,tsNinguno,True);
                PCT_RIESGO.Caption:='Pct Riesgo';
      SIT_RIESGO_MDO :=CreaCampo('SIT_RIESGO_MDO',ftString,tsNinguno,tsNinguno,True);
                SIT_RIESGO_MDO.Caption:='Situación Riesgo Mdo';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      FKeyFields.Add('ID_RIESGO_MDO');
      FKeyFields.Add('CVE_PRODUCTO_GPO');
      FKeyFields.Add('F_INI_VIGENCIA');
      FKeyFields.Add('CVE_CRIT_RIESGO');

       With SIT_RIESGO_MDO do
        Begin  Size := 2;
              UseCombo := True;
              ComboLista.Add('0'); ComboDatos.Add('AC');
              ComboLista.Add('1'); ComboDatos.Add('CA');
        End;

      ProdGpo := TMProdGpo.Create(Self);
      ProdGpo.MasterSource:=Self;
      ProdGpo.FieldByName('CVE_PRODUCTO_GPO').MasterField:='CVE_PRODUCTO_GPO';
      ProdGpo.ShowAll := True;

      TipoRiesgo := TCrGruCla.Create(Self);
      TipoRiesgo.MasterSource:=Self;
      TipoRiesgo.FieldByName('CVE_REFERENCIA').MasterField:='CVE_CRIT_RIESGO';
      TipoRiesgo.BuscaWhereString := ' CVE_GRUPO_CLAVE = '+SQlStr(C_GRUPO_CLAVE_RSGMDO);
      TipoRiesgo.ShowAll := True;

      TableName := 'ADMIPROD.CR_RIESGO_MDO';
      UseQuery := True;
      HelpFile := 'IntCrRiesMdo.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrRiesMdo.Destroy;
begin
 If Assigned(ProdGpo) Then ProdGpo.Free;
 If Assigned(TipoRiesgo) Then TipoRiesgo.Free;
 inherited;
end;

function TCrRiesMdo.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrRiesgoMdo;
begin
   W:=TWCrRiesgoMdo.Create(Self);
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

Function TCrRiesMdo.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrRiMd.it','F,S,D,S');
      Try if Active then begin T.Param(0,ID_RIESGO_MDO.AsString); 
                               T.Param(1,CVE_PRODUCTO_GPO.AsString); 
                               T.Param(2,F_INI_VIGENCIA.AsString); 
                               T.Param(3,CVE_CRIT_RIESGO.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2),T.DameCampo(3)]);
      finally  T.Free;
      end; 
end;

(***********************************************FORMA CR_RIESGO_MDO********************)
(*                                                                              *)
(*  FORMA DE CR_RIESGO_MDO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_RIESGO_MDO********************)

procedure TWCrRiesgoMdo.FormShow(Sender: TObject);
begin
 With Objeto Do
  Begin
  lbDempresa.Caption := ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := ParamCre.FECHA.AsString;
  lbDUsuario.Caption := ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := ParamCre.PERFIL.AsString;
    
  CVE_PRODUCTO_GPO.Control   := edCVE_PRODUCTO_GPO;
  F_INI_VIGENCIA.Control     := edF_INI_VIGENCIA;
  CVE_CRIT_RIESGO.Control    := edCVE_CRIT_RIESGO;
  PCT_RIESGO.Control         := edPCT_RIESGO;
  SIT_RIESGO_MDO.Control     := rgSIT_RIESGO_MDO;
  CVE_USU_ALTA.Control       := edCVE_USU_ALTA;
  F_ALTA.Control             := edF_ALTA;
  CVE_USU_MODIFICA.Control   := edCVE_USU_MODIFICA;
  F_MODIFICA.Control         := edF_MODIFICA;

  ProdGpo.CVE_PRODUCTO_GPO.Control := edCVE_PRODUCTO_GPO;
  ProdGpo.DESC_L_PROD_GPO.Control  := edDESC_L_PROD_GPO;

  TipoRiesgo.CVE_REFERENCIA.Control := edCVE_CRIT_RIESGO;
  TipoRiesgo.VALOR.Control := edVALOR;

  Interforma1.MsgPanel := MsgPanel;
  End;
end;

procedure TWCrRiesgoMdo.FormDestroy(Sender: TObject);
begin
 With Objeto Do
  Begin
  CVE_PRODUCTO_GPO.Control  := Nil;
  F_INI_VIGENCIA.Control    := Nil;
  CVE_CRIT_RIESGO.Control   := Nil;
  PCT_RIESGO.Control        := Nil;
  SIT_RIESGO_MDO.Control    := Nil;
  CVE_USU_ALTA.Control      := Nil;
  F_ALTA.Control            := Nil;
  CVE_USU_MODIFICA.Control  := Nil;
  F_MODIFICA.Control        := Nil;

  ProdGpo.CVE_PRODUCTO_GPO.Control := Nil;
  ProdGpo.DESC_L_PROD_GPO.Control  := Nil;

  TipoRiesgo.CVE_REFERENCIA.Control := Nil;
  TipoRiesgo.VALOR.Control := Nil;

  Interforma1.MsgPanel := Nil;  
  End;
end;

procedure TWCrRiesgoMdo.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrRiesgoMdo.InterForma1DespuesNuevo(Sender: TObject);
begin
  With Objeto Do
   Begin
   If edCVE_PRODUCTO_GPO.CanFocus Then edCVE_PRODUCTO_GPO.SetFocus;
   F_INI_VIGENCIA.AsDateTime := Apli.DameFechaEmpresa;
   SIT_RIESGO_MDO.AsString := CSIT_AC;
   End;
end;

procedure TWCrRiesgoMdo.InterForma1DespuesModificar(Sender: TObject);
begin If edPCT_RIESGO.CanFocus Then edPCT_RIESGO.SetFocus;
end;

procedure TWCrRiesgoMdo.ilCVE_PRODUCTO_GPOCapture(Sender: TObject;
  var Show: Boolean);
begin
 Show := True;
end;

procedure TWCrRiesgoMdo.btCVE_PRODUCTO_GPOClick(Sender: TObject);
begin
 With Objeto Do
  ProdGpo.Busca;
end;

procedure TWCrRiesgoMdo.btCVE_CRIT_RIESGOClick(Sender: TObject);
begin
 With Objeto Do
  TipoRiesgo.Busca;
end;

procedure TWCrRiesgoMdo.ilCVE_PRODUCTO_GPOEjecuta(Sender: TObject);
begin
 With Objeto Do
  If ProdGpo.FindKey([ilCVE_PRODUCTO_GPO.Buffer]) Then
    InterForma1.NextTab(edCVE_PRODUCTO_GPO);
end;

procedure TWCrRiesgoMdo.ilCVE_CRIT_RIESGOEjecuta(Sender: TObject);
begin
 With Objeto Do
  If TipoRiesgo.FindKey([C_GRUPO_CLAVE_RSGMDO, ilCVE_CRIT_RIESGO.Buffer]) Then
    InterForma1.NextTab(edCVE_CRIT_RIESGO);
end;

procedure TWCrRiesgoMdo.edCVE_PRODUCTO_GPOExit(Sender: TObject);
var vlstrMsg : String;
begin
 With Objeto Do
  If (Modo = moAppend) Or (Modo = moEdit) Then
   Begin
   vlstrMsg := '';
   If (Trim(edCVE_PRODUCTO_GPO.Text) = '') Then vlstrMsg := 'Favor de indicar el '+lbCVE_PRODUCTO_GPO.Caption;
   InterForma1.ValidaExit((Sender As TWinControl), (vlstrMsg = ''), vlstrMsg,True);
   End;
end;

procedure TWCrRiesgoMdo.btCVE_PRODUCTO_GPOExit(Sender: TObject);
var vlstrMsg : String;
begin
 With Objeto Do
  If (Modo = moAppend) Or (Modo = moEdit) Then
   Begin
   vlstrMsg := '';
   If (Trim(edCVE_PRODUCTO_GPO.Text) = '') Then vlstrMsg := 'Favor de indicar el '+lbCVE_PRODUCTO_GPO.Caption;
   InterForma1.ValidaExit((Sender As TWinControl), (vlstrMsg = ''), vlstrMsg,True);
   End;
end;

procedure TWCrRiesgoMdo.edCVE_CRIT_RIESGOExit(Sender: TObject);
var vlstrMsg : String;
begin
 With Objeto Do
  If (Modo = moAppend) Or (Modo = moEdit) Then
   Begin
   vlstrMsg := '';
   If (Trim(edCVE_CRIT_RIESGO.Text) = '') Then vlstrMsg := 'Favor de indicar el '+lbCVE_CRIT_RIESGO.Caption;
   InterForma1.ValidaExit((Sender As TWinControl), (vlstrMsg = ''), vlstrMsg,True);
   End;
end;

procedure TWCrRiesgoMdo.btCVE_CRIT_RIESGOExit(Sender: TObject);
var vlstrMsg : String;
begin
 With Objeto Do
  If (Modo = moAppend) Or (Modo = moEdit) Then
   Begin
   vlstrMsg := '';
   If (Trim(edCVE_CRIT_RIESGO.Text) = '') Then vlstrMsg := 'Favor de indicar el '+lbCVE_CRIT_RIESGO.Caption;
   InterForma1.ValidaExit((Sender As TWinControl), (vlstrMsg = ''), vlstrMsg,True);
   End;
end;

procedure TWCrRiesgoMdo.edPCT_RIESGOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edPCT_RIESGO, True, '',True);
end;

procedure TWCrRiesgoMdo.edF_INI_VIGENCIAExit(Sender: TObject);
var vlstrMsg : String;
begin
 With Objeto Do
  If (Modo = moAppend) Or (Modo = moEdit) Then
   Begin
   vlstrMsg := '';
   If (Trim(edF_INI_VIGENCIA.Text) = '') Then vlstrMsg := 'Favor de indicar el '+lbF_INI_VIGENCIA.Caption;
   InterForma1.ValidaExit((Sender As TWinControl), (vlstrMsg = ''), vlstrMsg,True);
   End;
end;

procedure TWCrRiesgoMdo.dtpF_INI_VIGENCIAExit(Sender: TObject);
var vlstrMsg : String;
begin
 With Objeto Do
  If (Modo = moAppend) Or (Modo = moEdit) Then
   Begin
   vlstrMsg := '';
   If (Trim(edF_INI_VIGENCIA.Text) = '') Then vlstrMsg := 'Favor de indicar el '+lbF_INI_VIGENCIA.Caption;
   InterForma1.ValidaExit((Sender As TWinControl), (vlstrMsg = ''), vlstrMsg,True);
   End;
end;

procedure TWCrRiesgoMdo.rgSIT_RIESGO_MDOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_RIESGO_MDO, True, '',True);
end;

function TWCrRiesgoMdo.ExisteRiesgo(peID_RIESGO_MDO   : Integer;
                                    peCVE_PRODUCTO_GPO ,
                                    peCVE_CRIT_RIESGO : String;
                                    peF_INI_VIGENCIA  : TDateTime) : Boolean;
var vlCount : Integer;
begin
 With Objeto Do
   Begin
   GetSQLInt(' SELECT COUNT(*) AS TOTAL FROM ADMIPROD.CR_RIESGO_MDO CRM '+coCRLF+
             ' WHERE CRM.CVE_PRODUCTO_GPO = '+SQLStr(peCVE_PRODUCTO_GPO)+coCRLF+
             '   AND CRM.CVE_CRIT_RIESGO  = '+SQLStr(peCVE_CRIT_RIESGO)+coCRLF+
             '   AND CRM.F_INI_VIGENCIA   = '+SQLFecha(peF_INI_VIGENCIA)+coCRLF+
             '   AND CRM.ID_RIESGO_MDO <> ' +IntToStr(peID_RIESGO_MDO)+coCRLF,
             Apli.DataBaseName, Apli.SessionName, 'TOTAL', vlCount, True );
   Result := vlCount > 0;
   End;
end;

procedure TWCrRiesgoMdo.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
var vlstrMessage : String;
    mrResult : Word;
begin
 Realizado := False;
 With Objeto Do
  Begin
  CVE_PRODUCTO_GPO.GetFromControl;
  ID_RIESGO_MDO.GetFromControl;
  F_INI_VIGENCIA.GetFromControl;
  CVE_CRIT_RIESGO.GetFromControl;

   If (ExisteRiesgo(ID_RIESGO_MDO.AsInteger,
                    CVE_PRODUCTO_GPO.AsString,
                    CVE_CRIT_RIESGO.AsString,
                    F_INI_VIGENCIA.AsDateTime)) Then
    Begin
       MessageDlg('El Criterio de Riesgo con la misma fecha de inicio de vigencia'+coCRLF+
                   ', ya fue dado de alta con anterioridad. Verifique.',
                  mtWarning, [mbOk], 0);
       Realizado := False;
    End
   Else
    Begin
       If IsNewData Then vlstrMessage := CCONFIRM_ALMACENA_INS
       Else vlstrMessage := CCONFIRM_ALMACENA_MOD;
       mrResult := MessageDlg(vlstrMessage, mtConfirmation, [mbYes, mbNo], 0);
       If (mrResult = mrYes) Then
          Begin
          If (IsNewData) Then
             Begin
             ID_RIESGO_MDO.AsInteger   := ObtenFolio(C_FOLIO_CRRSGMDO, 'Problemas al Obtener el folio '+C_FOLIO_CRRSGMDO,Objeto.Apli);
             F_ALTA.AsDateTime         := Apli.DameFechaEmpresa;
             CVE_USU_ALTA.AsString     := Apli.Usuario;
             Realizado := True;
             End
          Else
             Begin
             F_MODIFICA.AsDateTime     := Apli.DameFechaEmpresa;
             CVE_USU_MODIFICA.AsString := Apli.Usuario;
             Realizado := True;             
             End;
          End;
    End;
 End; // End Objeto   
end;

procedure TWCrRiesgoMdo.InterForma1Buscar(Sender: TObject);
begin
 With Objeto Do
  If InternalBusca Then
    Begin
    TipoRiesgo.FindKey([C_GRUPO_CLAVE_RSGMDO, CVE_CRIT_RIESGO.AsString]);
    End;
end;

end.
