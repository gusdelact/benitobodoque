// Sistema         : Clase de CR_EMISOR_SEGTO
// Fecha de Inicio : 29/04/2004
// Función forma   : Clase de CR_EMISOR_SEGTO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrEmiSeg;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,
//UNIDADES ADICIONALES
IntParamCre,
IntCrEmisor,
IntMon,
IntCrSeguimi, InterEdit,
IntMInstDesc;

Type
 TCrEmiSeg= class;

  TWCrEmisorSegto=Class(TForm)
    InterForma1             : TInterForma; 
    lbID_EMISOR : TLabel; 
    edID_EMISOR : TEdit; 
    edCVE_MONEDA : TEdit; 
    edCVE_SEGUIMIENTO : TEdit;
    btEMISOR: TBitBtn;
    edNOMBRE_EMISOR: TEdit;
    lbCVE_EMISOR_EXT: TLabel;
    edCVE_EMISOR_EXT: TEdit;
    edNOMBRE_EMISOR_EXT: TEdit;
    Label8: TLabel;
    btSEGUIMIENTO: TBitBtn;
    edDESC_SEGUIMIENTO: TEdit;
    Label1: TLabel;
    btMONEDA: TBitBtn;
    edDESC_MONEDA: TEdit;
    lbF_ALTA: TLabel;
    lbF_MODIFICA: TLabel;
    edF_MODIFICA: TEdit;
    edF_ALTA: TEdit;
    lbCVE_USU_ALTA: TLabel;
    lbCVE_USU_MODIFICA: TLabel;
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
    ilMONEDA: TInterLinkit;
    ilSEGTO: TInterLinkit;
    ilEMISOR: TInterLinkit;
    Label2: TLabel;
    edSOBRETASA: TInterEdit;
    Label3: TLabel;
    edCVE_FND_ENT_DES: TEdit;
    btnCVE_FND_ENT_DES: TBitBtn;
    edDESC_ENT_DES: TEdit;
    ilCVE_FND_ENT_DES: TInterLinkit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btEMISORClick(Sender: TObject);
    procedure ilEMISOREjecuta(Sender: TObject);
    procedure ilEMISORCapture(Sender: TObject; var Show: Boolean);
    procedure edID_EMISORExit(Sender: TObject);
    procedure btMONEDAClick(Sender: TObject);
    procedure ilMONEDAEjecuta(Sender: TObject);
    procedure ilMONEDACapture(Sender: TObject; var Show: Boolean);
    procedure edCVE_MONEDAExit(Sender: TObject);
    procedure btSEGUIMIENTOClick(Sender: TObject);
    procedure ilSEGTOEjecuta(Sender: TObject);
    procedure ilSEGTOCapture(Sender: TObject; var Show: Boolean);
    procedure edCVE_SEGUIMIENTOExit(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure edSOBRETASAExit(Sender: TObject);
    procedure edCVE_FND_ENT_DESExit(Sender: TObject);
    procedure btnCVE_FND_ENT_DESClick(Sender: TObject);
    procedure ilCVE_FND_ENT_DESCapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_FND_ENT_DESEjecuta(Sender: TObject);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrEmiSeg;
end; 
 TCrEmiSeg= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_FND_ENT_DES          : TInterCampo;
        ID_EMISOR                : TInterCampo;
        CVE_EMISOR_EXT           : TInterCampo;
        CVE_MONEDA               : TInterCampo;
        CVE_SEGUIMIENTO          : TInterCampo;
        SOBRETASA                : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;

        //Clases Adicionales
        ParamCre                 : TParamCre;
        Emisor                   : TCrEmisor;
        Moneda                   : TMoneda;
        Seguimiento              : TCrSeguimi;
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


constructor TCrEmiSeg.Create( AOwner : TComponent );
begin Inherited;
      CVE_FND_ENT_DES :=CreaCampo('CVE_FND_ENT_DES',ftString,tsNinguno,tsNinguno,True);
                CVE_FND_ENT_DES.Caption:='Clave de Fnd Ent Des';
      ID_EMISOR :=CreaCampo('ID_EMISOR',ftFloat,tsNinguno,tsNinguno,True);
                ID_EMISOR.Caption:='Número de Emisor';
      CVE_EMISOR_EXT :=CreaCampo('CVE_EMISOR_EXT',ftString,tsNinguno,tsNinguno,True);
                CVE_EMISOR_EXT.Caption:='Clave de Emisor Externo';
      CVE_MONEDA :=CreaCampo('CVE_MONEDA',ftFloat,tsNinguno,tsNinguno,True);
                CVE_MONEDA.Caption:='Clave de Moneda';
      CVE_SEGUIMIENTO :=CreaCampo('CVE_SEGUIMIENTO',ftString,tsNinguno,tsNinguno,True);
                CVE_SEGUIMIENTO.Caption:='Clave de Seguimiento';
      F_ALTA :=CreaCampo('F_ALTA',ftDateTime,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDateTime,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      SOBRETASA :=CreaCampo('SOBRETASA',ftFloat,tsNinguno,tsNinguno,True);
                SOBRETASA.Caption:='Sobretasa';

      FKeyFields.Add('CVE_FND_ENT_DES');
      FKeyFields.Add('ID_EMISOR');
      FKeyFields.Add('CVE_EMISOR_EXT');
      FKeyFields.Add('CVE_MONEDA');

      TableName := 'CR_EMISOR_SEGTO';
      UseQuery := True;
      HelpFile := 'IntCrEmiSeg.Hlp';
      ShowMenuReporte:=True;

      Emisor := TCrEmisor.Create(Self);
      Emisor.MasterSource:=Self;
      Emisor.FieldByName('CVE_FND_ENT_DES').MasterField:='CVE_FND_ENT_DES';
      Emisor.FieldByName('ID_ACREDITADO').MasterField:='ID_EMISOR';
      Emisor.FieldByName('CVE_EMISOR_EXT').MasterField:='CVE_EMISOR_EXT';
      {Emisor.BuscaWhereString := 'CR_EMISOR.SIT_EMISOR = ''AC''';}
      Emisor.FilterString := Emisor.BuscaWhereString;

      Moneda :=  TMoneda.Create(Self);
      Moneda.MasterSource:=Self;
      Moneda.FieldByName('CVE_MONEDA').MasterField :='CVE_MONEDA';

      Seguimiento := TCrSeguimi.Create(Self);
      Seguimiento.MasterSource:=Self;
      Seguimiento.FieldByName('CVE_SEGUIMIENTO').MasterField:='CVE_SEGUIMIENTO';

      MInstDesc := TMInstDesc.Create(Self);
      MInstDesc.MasterSource:= Self;
      MInstDesc.FieldByName('CVE_FND_ENT_DES').MasterField:= 'CVE_FND_ENT_DES';
end;

Destructor TCrEmiSeg.Destroy;
begin
   if Emisor  <> nil then
      Emisor.Free;
   if Moneda  <> nil then
      Moneda.Free;
   if Seguimiento  <> nil then
      Seguimiento.Free;
   if MInstDesc <> nil then
      MInstDesc.Free;
   inherited;
end;


function TCrEmiSeg.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrEmisorSegto;
begin
   W:=TWCrEmisorSegto.Create(Self);
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


Function TCrEmiSeg.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrEmSe.it','S,F,S,F');
      Try
         if Active then begin
            T.Param(0,CVE_FND_ENT_DES.AsString);
            T.Param(1,ID_EMISOR.AsString);
            T.Param(2,CVE_EMISOR_EXT.AsString);
            T.Param(3,CVE_MONEDA.AsString);
         end;
         if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2),T.DameCampo(3)]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA CR_EMISOR_SEGTO********************)
(*                                                                              *)
(*  FORMA DE CR_EMISOR_SEGTO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_EMISOR_SEGTO********************)

procedure TWCrEmisorSegto.FormShow(Sender: TObject);
begin
      // Pinta datos del panel
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_FND_ENT_DES.Control:=edCVE_FND_ENT_DES;
      Objeto.ID_EMISOR.Control:=edID_EMISOR;
      Objeto.CVE_EMISOR_EXT.Control:=edCVE_EMISOR_EXT;
      Objeto.CVE_MONEDA.Control:=edCVE_MONEDA;
      Objeto.CVE_SEGUIMIENTO.Control:=edCVE_SEGUIMIENTO;
      Objeto.F_ALTA.Control:=edF_ALTA;
      Objeto.CVE_USU_ALTA.Control:=edCVE_USU_ALTA;
      Objeto.F_MODIFICA.Control:=edF_MODIFICA;
      Objeto.CVE_USU_MODIFICA.Control:=edCVE_USU_MODIFICA;
      Objeto.SOBRETASA.Control := edSOBRETASA;

      Objeto.Emisor.CVE_FND_ENT_DES.Control:= edCVE_FND_ENT_DES;
      Objeto.Emisor.Acreditado.Persona.Nombre.Control := edNOMBRE_EMISOR;
      Objeto.Emisor.CVE_EMISOR_EXT.Control := edCVE_EMISOR_EXT;
      Objeto.Emisor.NOMBRE_EMISOR.Control := edNOMBRE_EMISOR_EXT;
      Objeto.Emisor.GetParams(Objeto);

      Objeto.Moneda.Desc_Moneda.Control := edDESC_MONEDA;
      Objeto.Moneda.GetParams(Objeto);

      Objeto.Seguimiento.DESC_SEGUIMIENTO.Control := edDESC_SEGUIMIENTO;
      Objeto.Seguimiento.GetParams(Objeto);

      Objeto.MInstDesc.CVE_FND_ENT_DES.Control:=edCVE_FND_ENT_DES;
      Objeto.MInstDesc.DESC_ENT_DES.Control:=edDESC_ENT_DES;
      Objeto.MInstDesc.GetParams(Objeto);

      Interforma1.MsgPanel := MsgPanel;
end;

procedure TWCrEmisorSegto.FormDestroy(Sender: TObject);
begin Objeto.CVE_FND_ENT_DES.Control:=nil;
      Objeto.ID_EMISOR.Control:=nil;
      Objeto.CVE_EMISOR_EXT.Control:=nil;
      Objeto.CVE_MONEDA.Control:=nil;
      Objeto.CVE_SEGUIMIENTO.Control:=nil;
      Objeto.F_ALTA.Control:=nil;
      Objeto.CVE_USU_ALTA.Control:=nil;
      Objeto.F_MODIFICA.Control:=nil;
      Objeto.CVE_USU_MODIFICA.Control:=nil;
      Objeto.SOBRETASA.Control := nil;

      Objeto.Emisor.CVE_FND_ENT_DES.Control:= nil;
      Objeto.Emisor.Acreditado.Persona.Nombre.Control := nil;
      Objeto.Emisor.CVE_EMISOR_EXT.Control := nil;
      Objeto.Emisor.NOMBRE_EMISOR.Control := nil;
      Objeto.Moneda.Desc_Moneda.Control := nil;
      Objeto.Seguimiento.DESC_SEGUIMIENTO.Control := nil;
      Objeto.MInstDesc.CVE_FND_ENT_DES.Control:=nil;
      Objeto.MInstDesc.DESC_ENT_DES.Control:=nil;
end;

procedure TWCrEmisorSegto.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrEmisorSegto.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   Objeto.F_ALTA.AsDateTime := Now;
   edCVE_FND_ENT_DES.SetFocus;
end;

procedure TWCrEmisorSegto.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
   Objeto.F_MODIFICA.AsDateTime := Now;
   edCVE_SEGUIMIENTO.SetFocus;
end;

procedure TWCrEmisorSegto.btEMISORClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCREMISEG_EMIS',True,True) then
   begin
     Objeto.CVE_FND_ENT_DES.GetFromControl;
     If Objeto.CVE_FND_ENT_DES.AsString <> '' Then Begin
        Objeto.Emisor.BuscaWhereString :=' CR_EMISOR.SIT_EMISOR = ''AC'' AND CR_EMISOR.CVE_FND_ENT_DES = ' + #39 + Objeto.CVE_FND_ENT_DES.AsString + #39;
        Objeto.Emisor.FilterString := Objeto.Emisor.BuscaWhereString;
     End;
     Objeto.Emisor.ShowAll := True;
     If Objeto.Emisor.Busca Then Begin
        InterForma1.NextTab(edID_EMISOR);
     End;
   end;
end;

procedure TWCrEmisorSegto.ilEMISOREjecuta(Sender: TObject);
begin
   Objeto.CVE_FND_ENT_DES.GetFromControl;
   If Objeto.CVE_FND_ENT_DES.AsString <> '' Then Begin
      Objeto.Emisor.BuscaWhereString := ' CR_EMISOR.SIT_EMISOR = ''AC'' AND CR_EMISOR.CVE_FND_ENT_DES = ' + #39 + Objeto.CVE_FND_ENT_DES.AsString + #39;
      Objeto.Emisor.FilterString := Objeto.Emisor.BuscaWhereString;
   End;
   If Objeto.Emisor.FindKeyNear([Objeto.CVE_FND_ENT_DES.AsString,ilEMISOR.Buffer],['CVE_FND_ENT_DES','ID_ACREDITADO']) Then Begin
      InterForma1.NextTab(edID_EMISOR);
   End;
end;

procedure TWCrEmisorSegto.ilEMISORCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrEmisorSegto.edID_EMISORExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      vlMsg     := '';
      vlSalida := True;
      Objeto.ID_EMISOR.GetFromControl;
      If Objeto.ID_EMISOR.AsString = '' Then Begin
         vlSalida  := False;
         vlMsg    := 'Favor de Indicar al Emisor';
      End Else If Objeto.Emisor.SIT_EMISOR.AsString <> 'AC' Then Begin
         vlSalida  := False;
         vlMsg     := 'Emisor no Activo';
      End;
      InterForma1.ValidaExit(edID_EMISOR,vlSalida,vlMsg,True);
   End;
end;

procedure TWCrEmisorSegto.btMONEDAClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCREMISEG_MONED',True,True) then
   begin
     Objeto.Moneda.ShowAll := True;
     If Objeto.Moneda.Busca Then
        InterForma1.NextTab(edCVE_MONEDA);
   end;
end;

procedure TWCrEmisorSegto.ilMONEDAEjecuta(Sender: TObject);
begin
   If Objeto.Moneda.FindKey([ilMONEDA.Buffer]) Then
      InterForma1.NextTab(edCVE_MONEDA);
end;

procedure TWCrEmisorSegto.ilMONEDACapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrEmisorSegto.edCVE_MONEDAExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg : String;
Begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      Objeto.CVE_MONEDA.GetFromControl;
      If Objeto.CVE_MONEDA.AsString = '' Then Begin
         vlMsg := ('Favor de Indicar la Moneda');
         vlSalida   := False;
      End;
      InterForma1.ValidaExit(edCVE_MONEDA,vlSalida,vlMsg,True);
   End;
end;

procedure TWCrEmisorSegto.btSEGUIMIENTOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCREMISEG_CVESG',True,True) then
   begin
     Objeto.Seguimiento.ShowAll := True;
     If Objeto.Seguimiento.Busca Then
        InterForma1.NextTab(edCVE_SEGUIMIENTO);
   end;
end;

procedure TWCrEmisorSegto.ilSEGTOEjecuta(Sender: TObject);
begin
   If Objeto.Seguimiento.FindKey([ilSEGTO.Buffer]) Then
      InterForma1.NextTab(edCVE_SEGUIMIENTO);
end;

procedure TWCrEmisorSegto.ilSEGTOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrEmisorSegto.edCVE_SEGUIMIENTOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edCVE_SEGUIMIENTO,True,'',True);
end;

procedure TWCrEmisorSegto.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   //nuevo
   If IsNewData Then Begin
      If MessageDlg('¿Desea almacenar los datos capturados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes Then
           Realizado := True
      Else Realizado := False;
   End Else Begin
      If MessageDlg('¿Desea guardar los datos modificados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes Then Begin
         Realizado := True;
      End Else
         Realizado := False;
   End;
end;

procedure TWCrEmisorSegto.edSOBRETASAExit(Sender: TObject);
Var
   VLSalida        : Boolean;
   VLMsg           : String;
begin
   VLSalida := True;
   VLMsg    := '';
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      //Verifica que el dato no sea negativo
      Objeto.SOBRETASA.GetFromControl;
      If Objeto.SOBRETASA.AsFloat < 0 Then Begin
         VLSalida := False;
         VLMsg    := 'La sobretasa no puede ser negativa';
      End;
      InterForma1.ValidaExit(edSOBRETASA,VLSalida,VLMsg,True);
   End;
end;

procedure TWCrEmisorSegto.edCVE_FND_ENT_DESExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      vlMsg     := '';
      vlSalida := True;
      Objeto.CVE_FND_ENT_DES.GetFromControl;
      If Objeto.CVE_FND_ENT_DES.AsString = '' Then Begin
         vlSalida  := False;
         vlMsg    := 'Favor de Indicar la Entidad Descontadora';
      End;
      InterForma1.ValidaExit(edCVE_FND_ENT_DES,vlSalida,vlMsg,True);
   End;
end;

procedure TWCrEmisorSegto.btnCVE_FND_ENT_DESClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCREMISEG_ENTDS',True,True) then
   begin
     Objeto.MInstDesc.ShowAll := True;
     If Objeto.MInstDesc.Busca Then Begin
        InterForma1.NextTab(edCVE_FND_ENT_DES);
     End;
  end;
end;

procedure TWCrEmisorSegto.ilCVE_FND_ENT_DESCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrEmisorSegto.ilCVE_FND_ENT_DESEjecuta(Sender: TObject);
begin
   If Objeto.MInstDesc.FindKey([ilCVE_FND_ENT_DES.Buffer]) Then Begin
      InterForma1.NextTab(edCVE_FND_ENT_DES);
   End;
end;

end.
