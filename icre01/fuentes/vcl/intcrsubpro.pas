// Sistema         : Clase de CR_SUBDIV_PROCAM
// Fecha de Inicio : 02/08/2004
// Función forma   : Clase de CR_SUBDIV_PROCAM
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrSubPro;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
//UNIDADES ADICIONALES
IntParamCre,
IntGenCre, IntLinkit,
IntCrAcredit,
IntPers
;

Type
 TCrSubPro= class;

  TWCrSubdivProcam=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_SUB_DIVISION : TLabel; 
    edCVE_SUB_DIVISION : TEdit;
    lbNOMBRE_SUB_DIV : TLabel;
    edNOMBRE_SUB_DIV : TEdit;
    lbSIT_SUBDIVISION : TLabel; 
    rgSIT_SUBDIVISION : TRadioGroup;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    edF_MODIF: TEdit;
    edCVE_USUA_MODIF: TEdit;
    lbUSUA_MODIF: TLabel;
    lbF_MODIF: TLabel;
    edF_ALTA: TEdit;
    edCVE_USUA_ALTA: TEdit;
    lbUSUA_ALTA: TLabel;
    lbF_ALTA: TLabel;
    lbID_ACREDITADO: TLabel;
    edID_ACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOM_ACREDITADO: TEdit;
    edID_PERSONA: TEdit;
    btPERSONA: TBitBtn;
    edNOM_PERSONA: TEdit;
    ilACREDITADO: TInterLinkit;
    ilPERSONA: TInterLinkit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edCVE_SUB_DIVISIONExit(Sender: TObject);
    procedure edNOMBRE_SUB_DIVExit(Sender: TObject);
    procedure rgSIT_SUBDIVISIONExit(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure btACREDITADOClick(Sender: TObject);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure edID_ACREDITADOExit(Sender: TObject);
    procedure btPERSONAClick(Sender: TObject);
    procedure ilPERSONAEjecuta(Sender: TObject);
    procedure edID_PERSONAExit(Sender: TObject);
    procedure ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure ilPERSONACapture(Sender: TObject; var Show: Boolean);
    private 
    { Private declarations } 
    public
    { Public declarations }
    Objeto : TCrSubPro;
end;
 TCrSubPro= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ID_ACREDITADO            : TInterCampo;
        CVE_SUB_DIVISION         : TInterCampo;
        NOMBRE_SUB_DIV           : TInterCampo;
        ID_PERSONA               : TInterCampo;
        SIT_SUBDIVISION          : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;

        ParamCre                 : TParamCre;
        Acreditado               : TCrAcredit;
        Persona                  : TPersona;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;


implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrSubPro.Create( AOwner : TComponent );
begin Inherited;
      ID_ACREDITADO :=CreaCampo('ID_ACREDITADO',ftFloat,tsNinguno,tsNinguno,True);
                ID_ACREDITADO.Caption:='Acreditado';
      CVE_SUB_DIVISION :=CreaCampo('CVE_SUB_DIVISION',ftString,tsNinguno,tsNinguno,True);
                CVE_SUB_DIVISION.Caption:='Clave de Sub Division';
      NOMBRE_SUB_DIV :=CreaCampo('NOMBRE_SUB_DIV',ftString,tsNinguno,tsNinguno,True);
                NOMBRE_SUB_DIV.Caption:='Nombre Sub Div';
      ID_PERSONA :=CreaCampo('ID_PERSONA',ftFloat,tsNinguno,tsNinguno,True);
                ID_PERSONA.Caption:='Persona';
      SIT_SUBDIVISION :=CreaCampo('SIT_SUBDIVISION',ftString,tsNinguno,tsNinguno,True);
      With SIT_SUBDIVISION do
      begin Size:=2;
            UseCombo:=True;
            ComboLista.Add('0');                ComboDatos.Add(CSIT_AC);
            ComboLista.Add('1');                ComboDatos.Add(CSIT_CA);
      end;
                SIT_SUBDIVISION.Caption:='Situación Subdivision';
      F_ALTA :=CreaCampo('F_ALTA',ftDateTime,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDateTime,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';

      FKeyFields.Add('ID_ACREDITADO');
      FKeyFields.Add('CVE_SUB_DIVISION');

      TableName := 'CR_SUBDIV_PROCAM';
      UseQuery := True;
      HelpFile := 'IntCrSubPro.Hlp';
      ShowMenuReporte:=True;

      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource:=Self;
//      Acreditado.FieldByName('ID_ACREDITADO').MasterField:='ID_ACREDITADO';
//      Acreditado.BuscaWhereString := ' ACREDITADO.SIT_ACREDITADO = ''AC''';
  //    Acreditado.FilterString := Acreditado.BuscaWhereString;

      Persona := TPersona.Create(Self);
      Persona.MasterSource:=Self;
      Persona.FieldByName('ID_PERSONA').MasterField:='ID_PERSONA';
      Persona.BuscaWhereString := ' PERSONA.SIT_PERSONA = ''AC''';
      Persona.FilterString := Persona.BuscaWhereString;
end;

Destructor TCrSubPro.Destroy;
begin
     if Acreditado <> nil then
        Acreditado.free;
     //end if;

     if Persona <> nil then
        Persona.free;
     //end if;
    inherited;
end;


function TCrSubPro.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrSubdivProcam;
begin
   W:=TWCrSubdivProcam.Create(Self);
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


Function TCrSubPro.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrSupr.It','F,S');
      Try if Active then begin T.Param(0,ID_ACREDITADO.AsString);
                               T.Param(1,CVE_SUB_DIVISION.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA CR_SUBDIV_PROCAM********************)
(*                                                                              *)
(*  FORMA DE CR_SUBDIV_PROCAM                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_SUBDIV_PROCAM********************)

procedure TWCrSubdivProcam.FormShow(Sender: TObject);
begin
      //PINTA DATOS DEL PANEL INFERIOR
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.ID_ACREDITADO.Control:=edID_ACREDITADO;
      Objeto.CVE_SUB_DIVISION.Control:=edCVE_SUB_DIVISION;
      Objeto.NOMBRE_SUB_DIV.Control:=edNOMBRE_SUB_DIV;
      Objeto.ID_PERSONA.Control:=edID_PERSONA;
      Objeto.SIT_SUBDIVISION.Control:=rgSIT_SUBDIVISION;
      Objeto.CVE_USU_ALTA.Control := edCVE_USUA_ALTA;
      Objeto.F_ALTA.Control:=edF_ALTA;
      Objeto.F_MODIFICA.Control := edF_MODIF;
      Objeto.CVE_USU_MODIFICA.Control := edCVE_USUA_MODIF;

      Objeto.Acreditado.ID_ACREDITADO.Control:=edID_ACREDITADO;
      Objeto.Acreditado.Persona.Nombre.Control := edNOM_ACREDITADO;
      Objeto.Acreditado.GetParams(Objeto);

      Objeto.Persona.Nombre.Control := edNOM_PERSONA;
      Objeto.Persona.GetParams(Objeto);
end;

procedure TWCrSubdivProcam.FormDestroy(Sender: TObject);
begin
      Objeto.ID_ACREDITADO.Control:=nil;
      Objeto.CVE_SUB_DIVISION.Control:=nil;
      Objeto.NOMBRE_SUB_DIV.Control:=nil;
      Objeto.ID_PERSONA.Control:=nil;
      Objeto.SIT_SUBDIVISION.Control:=nil;
      Objeto.CVE_USU_ALTA.Control := nil;
      Objeto.F_ALTA.Control:=nil;
      Objeto.F_MODIFICA.Control := nil;
      Objeto.CVE_USU_MODIFICA.Control := nil;

      Objeto.Acreditado.ID_ACREDITADO.Control:=nil;
      Objeto.Acreditado.Persona.Nombre.Control := nil;
      Objeto.Persona.Nombre.Control := nil;
end;

procedure TWCrSubdivProcam.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrSubdivProcam.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   Objeto.F_ALTA.AsDateTime := Now;
   rgSIT_SUBDIVISION.ItemIndex :=  0;
   edID_ACREDITADO.SetFocus;
end;

procedure TWCrSubdivProcam.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
   Objeto.F_MODIFICA.AsDateTime := Now;
   edNOMBRE_SUB_DIV.SetFocus;
end;

procedure TWCrSubdivProcam.edCVE_SUB_DIVISIONExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
     vlSalida   := True;
     Objeto.CVE_SUB_DIVISION.GetFromControl;
     if Objeto.CVE_SUB_DIVISION.AsString = '' then
     Begin
        vlMsg := 'Favor de Indicar la Clave de la subdivisión';
        vlSalida   := False;
        InterForma1.ValidaExit(edCVE_SUB_DIVISION,vlSalida,vlMsg,True);
     end;
   end;
end;

procedure TWCrSubdivProcam.edNOMBRE_SUB_DIVExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edNOMBRE_SUB_DIV,True,'',True);
end;

procedure TWCrSubdivProcam.rgSIT_SUBDIVISIONExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_SUBDIVISION,True,'',True);
end;

procedure TWCrSubdivProcam.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   //nuevo
   if IsNewData then
   Begin
      if MessageDlg('¿Desea almacenar los datos capturados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           Realizado := True;
      end
      else Realizado := False;
   end
   else if InterForma1.CanEdit then
   Begin
      if MessageDlg('¿Desea guardar los datos modificados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           Realizado := True;
      end
      else Realizado := False;
   end
end;

procedure TWCrSubdivProcam.btACREDITADOClick(Sender: TObject);
begin
   Objeto.Acreditado.ShowAll := True;
   if Objeto.Acreditado.Busca then
   Begin
      Objeto.ID_ACREDITADO.AsString := Objeto.Acreditado.ID_ACREDITADO.AsString;
      InterForma1.NextTab(edID_ACREDITADO);
   end;
end;

procedure TWCrSubdivProcam.ilACREDITADOEjecuta(Sender: TObject);
begin
   if Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) then
   Begin
      Objeto.ID_ACREDITADO.AsString := Objeto.Acreditado.ID_ACREDITADO.AsString;
      InterForma1.NextTab(edID_ACREDITADO);
   end;
end;

procedure TWCrSubdivProcam.edID_ACREDITADOExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
     vlSalida   := True;
     Objeto.ID_ACREDITADO.GetFromControl;
     if Objeto.ID_ACREDITADO.AsString = '' then
     Begin
        vlMsg := 'Favor de Indicar el Acreditado';
        vlSalida   := False;
        InterForma1.ValidaExit(edID_ACREDITADO,vlSalida,vlMsg,True);
     end;
   end;
end;

procedure TWCrSubdivProcam.btPERSONAClick(Sender: TObject);
begin
   Objeto.Persona.ShowAll := True;
   if Objeto.Persona.Busca then
      InterForma1.NextTab(edID_PERSONA);
end;

procedure TWCrSubdivProcam.ilPERSONAEjecuta(Sender: TObject);
begin
   if Objeto.Persona.FindKey([ilPERSONA.Buffer]) then
      InterForma1.NextTab(edID_PERSONA);
end;

procedure TWCrSubdivProcam.edID_PERSONAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edID_PERSONA,True,'',True);
end;

procedure TWCrSubdivProcam.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrSubdivProcam.ilPERSONACapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

end.
