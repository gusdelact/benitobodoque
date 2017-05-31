// Sistema         : Clase de LIM_RIE_GRUPO
// Fecha de Inicio : 14/01/2004
// Función forma   : Clase de LIM_RIE_GRUPO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Laura Gabriela Quevedo Torres
// Comentarios     :
Unit IntLimRieGru;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntEmpre, IntLinkit, UnConLim,
  InterEdit, IntLimGpRies;

Type
 TLimRieGru= class;

  TWLimRieGrupo=Class(TForm)
    InterForma1             : TInterForma;
    lbID_EMPRESA : TLabel;
    edID_EMPRESA : TEdit;
    lbCVE_GPO_RIESGO : TLabel;
    edCVE_GPO_RIESGO : TEdit;
    edDESC_GPO_RIESGO : TEdit;
    edNOM_EMPRESA: TEdit;
    SpeedButton1: TSpeedButton;
    Panel1: TPanel;
    lbCVE_CAL_RIESGO: TLabel;
    lbFCT_RIE_CONC: TLabel;
    lbPCT_LIM_CRED: TLabel;
    lbCVE_USR_ALTA: TLabel;
    edCVE_USR_ALTA: TEdit;
    lbFH_REGISTRO: TLabel;
    edFH_REGISTRO: TEdit;
    lbCVE_USR_MODIF: TLabel;
    edCVE_USR_MODIF: TEdit;
    lbFH_MODIFICACION: TLabel;
    edFH_MODIFICACION: TEdit;
    InterLinkit1: TInterLinkit;
    lbSIT_GRUPO: TLabel;
    edCVE_CAL_RIESGO: TInterEdit;
    cbSIT_GRUPO: TComboBox;
    edPCT_LIM_CRED: TInterEdit;
    edFCT_RIE_CONC: TInterEdit;
    SpeedButton2: TSpeedButton;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterLinkit1Capture(Sender: TObject; var Show: Boolean);
    procedure InterLinkit1Ejecuta(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure SpeedButton2Click(Sender: TObject);
    private
    { Private declarations }
    public 
    { Public declarations } 
    Objeto : TLimRieGru;
end; 
 TLimRieGru= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        ID_EMPRESA               : TInterCampo;
        CVE_GPO_RIESGO           : TInterCampo;
        CVE_CAL_RIESGO           : TInterCampo;
        DESC_GPO_RIESGO          : TInterCampo;
        FCT_RIE_CONC             : TInterCampo;
        PCT_LIM_CRED             : TInterCampo;
        CVE_USR_ALTA             : TInterCampo;
        FH_REGISTRO              : TInterCampo;
        CVE_USR_MODIF            : TInterCampo;
        FH_MODIFICACION          : TInterCampo;
        SIT_GRUPO                : TInterCampo;

        Empresa                  : TEmpresa;
        Lim_Gpo_Riesgo           : TLimGpRies;
        
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


constructor TLimRieGru.Create( AOwner : TComponent ); 
begin Inherited; 
      ID_EMPRESA :=CreaCampo('ID_EMPRESA',ftFloat,tsNinguno,tsNinguno,True);
                ID_EMPRESA.Caption:='Número de Empresa';
      //ID_EMPRESA.AsInteger :=1;           
      CVE_GPO_RIESGO :=CreaCampo('CVE_GPO_RIESGO',ftString,tsNinguno,tsNinguno,True);
                CVE_GPO_RIESGO.Caption:='Clave de Grupo Riesgo';
      CVE_CAL_RIESGO :=CreaCampo('CVE_CAL_RIESGO',ftString,tsNinguno,tsNinguno,True);
                CVE_CAL_RIESGO.Caption:='Clave de Cal Riesgo';
      //DESC_GPO_RIESGO :=CreaCampo('DESC_GPO_RIESGO',ftString,tsNinguno,tsNinguno,True);
      //          DESC_GPO_RIESGO.Caption:='Descripción Grupo Riesgo';
      FCT_RIE_CONC :=CreaCampo('FCT_RIE_CONC',ftFloat,tsNinguno,tsNinguno,True);
                FCT_RIE_CONC.Caption:='Fct Rie Conc';
      PCT_LIM_CRED :=CreaCampo('PCT_LIM_CRED',ftFloat,tsNinguno,tsNinguno,True);
                PCT_LIM_CRED.Caption:='Pct Lim Cred';
      CVE_USR_ALTA :=CreaCampo('CVE_USR_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USR_ALTA.Caption:='Clave de Usr Alta';
      FH_REGISTRO :=CreaCampo('FH_REGISTRO',ftDateTime,tsNinguno,tsNinguno,True);
                FH_REGISTRO.Caption:='Fecha y Hora Registro';
      CVE_USR_MODIF :=CreaCampo('CVE_USR_MODIF',ftString,tsNinguno,tsNinguno,True);
                CVE_USR_MODIF.Caption:='Clave de Usr Modificación';
      FH_MODIFICACION :=CreaCampo('FH_MODIFICACION',ftDateTime,tsNinguno,tsNinguno,True);
                FH_MODIFICACION.Caption:='Fecha y Hora Modificacion';
      SIT_GRUPO :=CreaCampo('SIT_GRUPO',ftString,tsNinguno,tsNinguno,True);
                SIT_GRUPO.Caption:='Situación Grupo';
      with SIT_GRUPO do begin
       Size:=2;
       UseCombo:=true;
       ComboDatos.Add(cActivo);       ComboLista.Add(cTxtAC);
       ComboDatos.Add(cInactivo);     ComboLista.Add(cTxtIN);
       ComboDatos.Add(cCancelado);    ComboLista.Add(cTxtCA);
      end;
      FKeyFields.Add('ID_EMPRESA');
      FKeyFields.Add('CVE_GPO_RIESGO');

      Empresa  := TEmpresa.Create(self);
      Empresa.MasterSource:=self;
      Empresa.ID_Empresa.MasterField:='ID_EMPRESA';

      Lim_Gpo_Riesgo :=TLimGpRies.Create(self);
      Lim_Gpo_Riesgo.MasterSource:=self;
      Lim_Gpo_Riesgo.CVE_GPO_RIESGO.MasterField:='CVE_GPO_RIESGO';

      TableName := 'LIM_RIE_GRUPO';
      UseQuery := True;
      HelpFile := 'IntLimRieGru.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TLimRieGru.Destroy;
begin inherited;
end;


function TLimRieGru.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWLimRieGrupo;
begin
   W:=TWLimRieGrupo.Create(Self);
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


Function TLimRieGru.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ILiRiGr.it','F,S');
      Try if Active then begin T.Param(0,ID_EMPRESA.AsString); 
                               T.Param(1,CVE_GPO_RIESGO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end; 
end;

function TLimRieGru.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA LIM_RIE_GRUPO********************)
(*                                                                              *)
(*  FORMA DE LIM_RIE_GRUPO                                                            *)
(*                                                                              *)
(***********************************************FORMA LIM_RIE_GRUPO********************)

procedure TWLimRieGrupo.FormShow(Sender: TObject);
begin
      Objeto.ID_EMPRESA.Control:=edID_EMPRESA;
      Objeto.CVE_GPO_RIESGO.Control:=edCVE_GPO_RIESGO;
      Objeto.CVE_CAL_RIESGO.Control:=edCVE_CAL_RIESGO;
      //Objeto.DESC_GPO_RIESGO.Control:=edDESC_GPO_RIESGO;
      Objeto.FCT_RIE_CONC.Control:=edFCT_RIE_CONC;
      Objeto.PCT_LIM_CRED.Control:=edPCT_LIM_CRED;
      Objeto.CVE_USR_ALTA.Control:=edCVE_USR_ALTA;
      Objeto.FH_REGISTRO.Control:=edFH_REGISTRO;
      Objeto.CVE_USR_MODIF.Control:=edCVE_USR_MODIF;
      Objeto.FH_MODIFICACION.Control:=edFH_MODIFICACION;
      Objeto.SIT_GRUPO.Control:=cbSIT_GRUPO;
      Objeto.Empresa.ID_Empresa.Control:= edID_EMPRESA;
      Objeto.Empresa.PersonaMoral.Nombre.Control:= edNOM_EMPRESA;
      Objeto.Lim_Gpo_Riesgo.CVE_GPO_RIESGO.Control:= edCVE_GPO_RIESGO;
      Objeto.Lim_Gpo_Riesgo.DESC_GPO_RIESGO.Control := edDESC_GPO_RIESGO;
end;

procedure TWLimRieGrupo.FormDestroy(Sender: TObject);
begin
      Objeto.ID_EMPRESA.Control:=nil;
      Objeto.CVE_GPO_RIESGO.Control:=nil;
      Objeto.CVE_CAL_RIESGO.Control:=nil;
      //Objeto.DESC_GPO_RIESGO.Control:=nil;
      Objeto.FCT_RIE_CONC.Control:=nil;
      Objeto.PCT_LIM_CRED.Control:=nil;
      Objeto.CVE_USR_ALTA.Control:=nil;
      Objeto.FH_REGISTRO.Control:=nil;
      Objeto.CVE_USR_MODIF.Control:=nil;
      Objeto.FH_MODIFICACION.Control:=nil;
      Objeto.SIT_GRUPO.Control:=nil;
      Objeto.Empresa.ID_Empresa.Control:= nil;
      Objeto.Empresa.PersonaMoral.Nombre.Control:= nil;
   //Objeto
end;

procedure TWLimRieGrupo.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWLimRieGrupo.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
 Objeto.SIT_GRUPO.AsString:= cActivo;
 Objeto.CVE_USR_ALTA.AsString:=Objeto.Apli.Usuario;
 Objeto.FH_REGISTRO.AsString:= FormatDateTime('DD/MM/YYYY HH:NN:SS',now);
end;

procedure TWLimRieGrupo.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
 Objeto.CVE_USR_MODIF.AsString:=Objeto.Apli.Usuario;
 Objeto.FH_MODIFICACION.AsString:= FormatDateTime('DD/MM/YYYY HH:NN:SS',now);
end;

//procedure TWLimRieGrupo.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte;
//end;


procedure TWLimRieGrupo.InterLinkit1Capture(Sender: TObject;
  var Show: Boolean);
begin Show:=True;

end;

procedure TWLimRieGrupo.InterLinkit1Ejecuta(Sender: TObject);
begin
  If Objeto.ValidaAccesoEsp('LRXG_GPORIESGO',True,True) Then
  Begin
    Objeto.Empresa.FindKey([InterLinkit1.Buffer]);
  End;
end;

procedure TWLimRieGrupo.SpeedButton1Click(Sender: TObject);
begin
  If Objeto.ValidaAccesoEsp('LRXG_EMPRESA',True,True) Then
  Begin
    Objeto.Empresa.Busca;
  End;
end;

procedure TWLimRieGrupo.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
 Realizado:=FALSE;
 Objeto.GetFromControl;
  if (Objeto.CVE_CAL_RIESGO.AsString='')then
    showmessage('Error: La clave de cálculo de riesgo no es valida')
  else
   Realizado:=true;
end;

procedure TWLimRieGrupo.SpeedButton2Click(Sender: TObject);
begin
  If Objeto.ValidaAccesoEsp('LRXG_GPORIESGO',True,True) Then
  Begin
    Objeto.Lim_Gpo_Riesgo.Busca
  End;
end;

end.
