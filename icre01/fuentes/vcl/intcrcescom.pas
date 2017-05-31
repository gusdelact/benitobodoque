// Sistema         : Clase de CR_CESION_COMIS
// Fecha de Inicio : 12/11/2003
// Función forma   : Clase de CR_CESION_COMIS
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrCesCom;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit,IntCtoPanel, IntLinkit,
//Unidades adicionales
IntCrCesion,
IntParamCre,
IntGenCre,
IntCrCatComi;

Type
 TCrCesCom= class;

  TWCrCesionComis=Class(TForm)
    InterForma1             : TInterForma;
    lbID_CESION: TLabel;
    edID_CESION: TEdit;
    lbCVE_COMISION : TLabel; 
    edCVE_COMISION : TEdit;
    lbF_APLICACION : TLabel; 
    dtpF_APLICACION : TInterDateTimePicker; 
    edF_APLICACION : TEdit;
    lbIMP_COMISION : TLabel;
    iedIMP_COMISION: TInterEdit;
    lbIMP_IVA : TLabel; 
    IedIMP_IVA : TInterEdit; 
    rgSIT_COMISION : TRadioGroup;
    lbF_ALTA: TLabel;
    lbF_MODIFICA: TLabel;
    LBCVE_USU_ALTA: TLabel;
    lbCVE_USU_MODIFICA: TLabel;
    edF_MODIFICA: TEdit;
    edF_ALTA: TEdit;
    edCVE_USU_MODIFICA: TEdit;
    edCVE_USU_ALTA: TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    MsgPanel: TPanel;
    edTITULAR: TEdit;
    btCESION: TBitBtn;
    btCVE_COMISION: TBitBtn;
    edDESC_COMISION: TEdit;
    GroupBox1: TGroupBox;
    lbFOL_DV_CAR_PROV: TLabel;
    lbFOL_DV_ABO_COMIS: TLabel;
    lbFOL_DV_ABO_IVA: TLabel;
    lbNUM_FACTURA: TLabel;
    icpCONTRATO: TInterCtoPanel;
    ilCESION: TInterLinkit;
    ilCOMISION: TInterLinkit;
    edFOL_DV_CAR_PROV: TEdit;
    edFOL_DV_ABO_COMIS: TEdit;
    edFOL_DV_ABO_IVA: TEdit;
    edNUM_FACTURA: TEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btCESIONClick(Sender: TObject);
    procedure ilCESIONEjecuta(Sender: TObject);
    procedure ilCESIONCapture(Sender: TObject; var Show: Boolean);
    procedure edID_CESIONExit(Sender: TObject);
    procedure btCVE_COMISIONClick(Sender: TObject);
    procedure ilCOMISIONEjecuta(Sender: TObject);
    procedure ilCOMISIONCapture(Sender: TObject; var Show: Boolean);
    procedure edCVE_COMISIONExit(Sender: TObject);
    procedure edF_APLICACIONExit(Sender: TObject);
    procedure iedIMP_COMISIONExit(Sender: TObject);
    procedure IedIMP_IVAExit(Sender: TObject);
    procedure edFOL_DV_CAR_PROVExit(Sender: TObject);
    procedure edFOL_DV_ABO_COMISExit(Sender: TObject);
    procedure edFOL_DV_ABO_IVAExit(Sender: TObject);
    procedure edNUM_FACTURAExit(Sender: TObject);
    procedure rgSIT_COMISIONExit(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrCesCom;
end; 
 TCrCesCom= class(TInterFrame) 
      private
      protected
      public
        { Public declarations }
        ID_CESION                : TInterCampo;
        CVE_COMISION             : TInterCampo;
        F_APLICACION             : TInterCampo;
        IMP_COMISION             : TInterCampo;
        IMP_IVA                  : TInterCampo;
        SIT_COMISION             : TInterCampo;
        FOL_DV_CAR_PROV          : TInterCampo;
        FOL_DV_ABO_COMIS         : TInterCampo;
        FOL_DV_ABO_IVA           : TInterCampo;
        NUM_FACTURA              : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;

        //Clases Adcionales
        ParamCre                 : TParamCre;
        Cesion                   : TCrCesion;
        Comision                 : TCrCatComi;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

      published 
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrCesCom.Create( AOwner : TComponent ); 
begin Inherited; 
      ID_CESION :=CreaCampo('ID_CESION',ftFloat,tsNinguno,tsNinguno,True);
                ID_CESION.Caption:='Cesión';
      CVE_COMISION :=CreaCampo('CVE_COMISION',ftString,tsNinguno,tsNinguno,True);
                CVE_COMISION.Caption:='Cve de Comisión';
      F_APLICACION :=CreaCampo('F_APLICACION',ftDate,tsNinguno,tsNinguno,True);
                F_APLICACION.Caption:='Fecha Aplicación';
      IMP_COMISION :=CreaCampo('IMP_COMISION',ftFloat,tsNinguno,tsNinguno,True);
                IMP_COMISION.Caption:='Imp. Comisión';
      IMP_IVA :=CreaCampo('IMP_IVA',ftFloat,tsNinguno,tsNinguno,True);
                IMP_IVA.Caption:='Imp. IVA';
      SIT_COMISION :=CreaCampo('SIT_COMISION',ftString,tsNinguno,tsNinguno,True);
      With SIT_COMISION do
          begin Size:=2;
                UseCombo:=True;
                ComboLista.Add('0');    ComboDatos.Add(CSIT_AC);
                ComboLista.Add('1');    ComboDatos.Add(CSIT_CA);
                ComboLista.Add('2');    ComboDatos.Add(CSIT_PA);
          end;
                SIT_COMISION.Caption:='Situación Comision';
      FOL_DV_CAR_PROV :=CreaCampo('FOL_DV_CAR_PROV',ftFloat,tsNinguno,tsNinguno,True);
                FOL_DV_CAR_PROV.Caption:='Fol Dv Car Prov';
      FOL_DV_ABO_COMIS :=CreaCampo('FOL_DV_ABO_COMIS',ftFloat,tsNinguno,tsNinguno,True);
                FOL_DV_ABO_COMIS.Caption:='Fol Dv Abono Comis';
      FOL_DV_ABO_IVA :=CreaCampo('FOL_DV_ABO_IVA',ftFloat,tsNinguno,tsNinguno,True);
                FOL_DV_ABO_IVA.Caption:='Fol Dv Abono IVA';
      NUM_FACTURA :=CreaCampo('NUM_FACTURA',ftFloat,tsNinguno,tsNinguno,True);
                NUM_FACTURA.Caption:='Número Factura';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      FKeyFields.Add('ID_CESION');
      FKeyFields.Add('CVE_COMISION');

      TableName := 'CR_CESION_COMIS';
      UseQuery := True;
      HelpFile := 'IntCrCesCom.Hlp';
      ShowMenuReporte:=True;

      Cesion := TCrCesion.Create(Self);
      Cesion.MasterSource:=Self;
      Cesion.FieldByName('ID_CESION').MasterField:='ID_CESION';

      Comision := TCrCatComi.Create(Self);
      Comision.MasterSource:=Self;
      Comision.FieldByName('CVE_COMISION').MasterField:='CVE_COMISION';
end;

Destructor TCrCesCom.Destroy;
begin
   if Cesion <> nil then
      Cesion.Free;
   //end if

   if Comision <> nil then
      Comision.Free;
   //end if

   inherited;
end;


function TCrCesCom.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCesionComis;
begin
   W:=TWCrCesionComis.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftConsulta;// FormaTipo;//
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrCesCom.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrCeCo.it','F,S');
      Try if Active then begin T.Param(0,ID_CESION.AsString);
                               T.Param(1,CVE_COMISION.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA CR_CESION_COMIS********************)
(*                                                                                      *)
(*  FORMA DE CR_CESION_COMIS                                                            *)
(*                                                                                      *)
(***********************************************FORMA CR_CESION_COMIS********************)

procedure TWCrCesionComis.FormShow(Sender: TObject);
begin
      icpCONTRATO.Frame := Objeto.Cesion.CreCto.Contrato;
      icpCONTRATO.RefrescaInfo; //Refresca la información del Contrato

      //Pinta los datos del panel inferior
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.ID_CESION.Control:=edID_CESION;
      Objeto.CVE_COMISION.Control:=edCVE_COMISION;
      Objeto.F_APLICACION.Control:=edF_APLICACION;
      Objeto.IMP_COMISION.Control:=IedIMP_COMISION;
      Objeto.IMP_IVA.Control:=IedIMP_IVA;
      Objeto.SIT_COMISION.Control:=rgSIT_COMISION;
      Objeto.FOL_DV_CAR_PROV.Control:=edFOL_DV_CAR_PROV;
      Objeto.FOL_DV_ABO_COMIS.Control:=edFOL_DV_ABO_COMIS;
      Objeto.FOL_DV_ABO_IVA.Control:=edFOL_DV_ABO_IVA;
      Objeto.NUM_FACTURA.Control:=edNUM_FACTURA;
      Objeto.F_ALTA.Control:=edF_ALTA;
      Objeto.CVE_USU_ALTA.Control:=edCVE_USU_ALTA;
      Objeto.F_MODIFICA.Control:=edF_MODIFICA;
      Objeto.CVE_USU_MODIFICA.Control:=edCVE_USU_MODIFICA;

      Objeto.Cesion.CreCto.Contrato.TITNombre.Control := edTITULAR;
      Objeto.Cesion.GetParams(Objeto);

      Objeto.Comision.DESC_COMISION.Control := edDESC_COMISION;
      Objeto.Comision.GetParams(Objeto);
end;

procedure TWCrCesionComis.FormDestroy(Sender: TObject);
begin
      Objeto.ID_CESION.Control:=nil;
      Objeto.CVE_COMISION.Control:=nil;
      Objeto.F_APLICACION.Control:=nil;
      Objeto.IMP_COMISION.Control:=nil;
      Objeto.IMP_IVA.Control:=nil;
      Objeto.SIT_COMISION.Control:=nil;
      Objeto.FOL_DV_CAR_PROV.Control:=nil;
      Objeto.FOL_DV_ABO_COMIS.Control:=nil;
      Objeto.FOL_DV_ABO_IVA.Control:=nil;
      Objeto.NUM_FACTURA.Control:=nil;
      Objeto.F_ALTA.Control:=nil;
      Objeto.CVE_USU_ALTA.Control:=nil;
      Objeto.F_MODIFICA.Control:=nil;
      Objeto.CVE_USU_MODIFICA.Control:=nil;

      Objeto.Cesion.CreCto.Contrato.TITNombre.Control := nil;
      Objeto.Comision.DESC_COMISION.Control := nil;
   //Objeto
end;

procedure TWCrCesionComis.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrCesionComis.InterForma1DespuesNuevo(Sender: TObject);
begin
   with Objeto do
   Begin
        F_APLICACION.AsDateTime := APli.DameFechaEmpresa;
        IMP_COMISION.AsFloat := 0;
        IMP_IVA.AsFloat := 0;
        rgSIT_COMISION.ItemIndex := 2;
        F_ALTA.AsDateTime := Apli.DameFechaEmpresa;
        CVE_USU_ALTA.AsString := Apli.Usuario;
        edID_CESION.SetFocus;
   end;
end;

procedure TWCrCesionComis.InterForma1DespuesModificar(Sender: TObject);
begin
   icpCONTRATO.RefrescaInfo;
   Objeto.F_MODIFICA.AsDateTime := Objeto.Apli.DameFechaEmpresa;
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
   edF_APLICACION.SetFocus;
end;


procedure TWCrCesionComis.btCESIONClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCESCOM_CESION',True,True) then
   begin
     Objeto.Cesion.ShowAll := True;
     if Objeto.Cesion.Busca then
        Interforma1.NextTab(edID_CESION);
     //end if
   end;
end;

procedure TWCrCesionComis.ilCESIONEjecuta(Sender: TObject);
begin
   if Objeto.Cesion.FindKey([Objeto.ID_CESION.AsString]) then
      Interforma1.NextTab(edID_CESION);
   //end if
end;

procedure TWCrCesionComis.ilCESIONCapture(Sender: TObject;
  var Show: Boolean);
begin
        Show := (InterForma1.CanEdit) or (InterForma1.IsNewData);
end;

procedure TWCrCesionComis.edID_CESIONExit(Sender: TObject);
var vlSalida : Boolean;
    vlMsg    : String;
begin
   vlSalida := True;
   vlMsg := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      vlMsg := '';
      vlSalida := True;
      Objeto.ID_CESION.GetFromControl;
      If Objeto.ID_CESION.AsString = '' then
      Begin
          vlSalida := False;
          vlMsg:='Favor de Indicar el número de cesión';
      end;
      InterForma1.ValidaExit(edID_CESION,vlSalida,vlMsg,True);
   End;
end;

procedure TWCrCesionComis.btCVE_COMISIONClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCESCOM_CVECOM',True,True) then
   begin
     Objeto.Comision.ShowAll := True;
     if Objeto.Comision.Busca then
        Interforma1.NextTab(edCVE_COMISION);
     //en if
   end;
end;

procedure TWCrCesionComis.ilCOMISIONEjecuta(Sender: TObject);
begin
   if Objeto.Comision.FindKey([Objeto.CVE_COMISION.AsString]) then
      Interforma1.NextTab(edCVE_COMISION);
   //en if
end;

procedure TWCrCesionComis.ilCOMISIONCapture(Sender: TObject;
  var Show: Boolean);
begin
        Show := (InterForma1.CanEdit) or (InterForma1.IsNewData);
end;

procedure TWCrCesionComis.edCVE_COMISIONExit(Sender: TObject);
var vlSalida : Boolean;
    vlMsg    : String;
begin
   vlSalida := True;
   vlMsg := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      vlMsg := '';
      vlSalida := True;
      Objeto.CVE_COMISION.GetFromControl;
      If Objeto.CVE_COMISION.AsString = '' then
      Begin
          vlSalida := False;
          vlMsg:='Favor de Indicar la clave de la comisión';
      end;
      InterForma1.ValidaExit(edCVE_COMISION,vlSalida,vlMsg,True);
   End;
end;

procedure TWCrCesionComis.edF_APLICACIONExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edF_APLICACION,True,'',True);
end;

procedure TWCrCesionComis.iedIMP_COMISIONExit(Sender: TObject);
var vlSalida : Boolean;
    vlMsg    : String;
begin
   vlSalida := True;
   vlMsg := '';
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      vlMsg := '';
      vlSalida := True;
      Objeto.IMP_COMISION.GetFromControl;
      If Objeto.IMP_COMISION.AsFloat < 0 then
      Begin
          vlSalida := False;
          vlMsg:='El importe de comisión no puede ser menor a cero';
      end;
      InterForma1.ValidaExit(iedIMP_COMISION,vlSalida,vlMsg,True);
   End;
end;

procedure TWCrCesionComis.IedIMP_IVAExit(Sender: TObject);
begin
      InterForma1.ValidaExit(IedIMP_IVA,True,'',True);
end;

procedure TWCrCesionComis.edFOL_DV_CAR_PROVExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edFOL_DV_CAR_PROV,True,'',True);
end;

procedure TWCrCesionComis.edFOL_DV_ABO_COMISExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edFOL_DV_ABO_COMIS,True,'',True);
end;

procedure TWCrCesionComis.edFOL_DV_ABO_IVAExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edFOL_DV_ABO_IVA,True,'',True);
end;

procedure TWCrCesionComis.edNUM_FACTURAExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edNUM_FACTURA,True,'',True);
end;

procedure TWCrCesionComis.rgSIT_COMISIONExit(Sender: TObject);
begin
      InterForma1.ValidaExit(rgSIT_COMISION,True,'',True);
end;

procedure TWCrCesionComis.InterForma1Buscar(Sender: TObject);
begin
   if Objeto.Busca then
   Begin
      ShowMessage(Objeto.Cesion.CreCto.Contrato.ID_CONTRATO.AsString);
      Objeto.Cesion.FindKey([Objeto.ID_CESION.AsString]);
      icpCONTRATO.RefrescaInfo;
   end;
end;

procedure TWCrCesionComis.InterForma1AntesAceptar(Sender: TObject;
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
   else
   Begin
      if MessageDlg('¿Desea guardar los datos modificados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           Realizado := True;
      end
      else Realizado := False;
   end
end;

end.
