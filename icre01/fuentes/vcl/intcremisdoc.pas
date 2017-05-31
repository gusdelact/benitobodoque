// Sistema         : Clase de CR_EMISOR_DOC
// Fecha de Inicio : 30/06/2003
// Función forma   : Clase de CR_EMISOR_DOC
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCrEmisDoc;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,

//Unidades Adicionales
IntParamCre, IntCrEmisor,IntCrTDocto,IntMInstDesc;

const
   CVERDAD = 'V';
   CFALSO  = 'F';


Type
 TCrEmisDoc= class;

  TWCrEmisorDoc=Class(TForm)
    InterForma1             : TInterForma; 
    lbID_EMISOR : TLabel;
    edID_EMISOR: TEdit;
    lbCVE_DOCUMENTO : TLabel; 
    edCVE_DOCUMENTO : TEdit;
    lbTASA_AFORO : TLabel; 
    rgSIT_DOCUMENTO : TRadioGroup;
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
    btACREDITADO: TBitBtn;
    edNOM_EMISOR: TEdit;
    btTIPO_DOCTO: TBitBtn;
    edDESC_TIPO_DOCTO: TEdit;
    lbF_ALTA: TLabel;
    lbF_MODIFICA: TLabel;
    edF_MODIFICA: TEdit;
    edF_ALTA: TEdit;
    LBCVE_USU_ALTA: TLabel;
    lbCVE_USU_MODIFICA: TLabel;
    edCVE_USU_MODIFICA: TEdit;
    edCVE_USU_ALTA: TEdit;
    ilTIPO_DOCTO: TInterLinkit;
    ilEMISOR: TInterLinkit;
    edTASA_AFORO: TInterEdit;
    Label8: TLabel;
    edCVE_FND_ENT_DES: TEdit;
    btnCVE_FND_ENT_DES: TBitBtn;
    edDESC_ENT_DES: TEdit;
    ilCVE_FND_ENT_DES: TInterLinkit;
    lbDIAS_PAGO: TLabel;
    edDIAS_PAGO: TInterEdit;
    chB_FV_REAL: TCheckBox;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure ilEMISORCapture(Sender: TObject; var Show: Boolean);
    procedure ilEMISOREjecuta(Sender: TObject);
    procedure btTIPO_DOCTOClick(Sender: TObject);
    procedure ilTIPO_DOCTOCapture(Sender: TObject; var Show: Boolean);
    procedure ilTIPO_DOCTOEjecuta(Sender: TObject);
    procedure edID_EMISORExit(Sender: TObject);
    procedure edCVE_DOCUMENTOExit(Sender: TObject);
    procedure edTASA_AFOROExit(Sender: TObject);
    procedure rgSIT_DOCUMENTOExit(Sender: TObject);
    Procedure MuestraHints;
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure edCVE_FND_ENT_DESExit(Sender: TObject);
    procedure btnCVE_FND_ENT_DESExit(Sender: TObject);
    procedure btnCVE_FND_ENT_DESClick(Sender: TObject);
    procedure ilCVE_FND_ENT_DESCapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_FND_ENT_DESEjecuta(Sender: TObject);
    procedure chB_FV_REALExit(Sender: TObject);
    private
    { Private declarations } 
    public
    { Public declarations } 
    Objeto : TCrEmisDoc;
end; 
 TCrEmisDoc= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        CVE_FND_ENT_DES          : TInterCampo;
        ID_EMISOR                : TInterCampo;
        CVE_DOCUMENTO            : TInterCampo;
        TASA_AFORO               : TInterCampo;
        SIT_DOCUMENTO            : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        DIAS_PAGO                : TInterCampo; // JFOF 03/01/2013
        B_F_VENC_REAL            : TInterCampo; // JFOF 18/01/2013

        //Clases Adicionales
        ParamCre                 : TParamCre;
        Emisor                   : TCrEmisor;
        TipoDocto                : TCrTDocto;
        MInstDesc                : TMInstDesc;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation
//Uses
{$R *.DFM}


constructor TCrEmisDoc.Create( AOwner : TComponent );
begin Inherited;
      CVE_FND_ENT_DES :=CreaCampo('CVE_FND_ENT_DES',ftString,tsNinguno,tsNinguno,True);
                CVE_FND_ENT_DES.Caption:='Clave de Fnd Ent Des';
      ID_EMISOR :=CreaCampo('ID_EMISOR',ftFloat,tsNinguno,tsNinguno,True);
                ID_EMISOR.Caption:='Acreditado';
      CVE_DOCUMENTO :=CreaCampo('CVE_DOCUMENTO',ftString,tsNinguno,tsNinguno,True);
                CVE_DOCUMENTO.Caption:='Tipo de Documento';
      TASA_AFORO :=CreaCampo('TASA_AFORO',ftFloat,tsNinguno,tsNinguno,True);
                TASA_AFORO.Caption:='Tasa Aforo';
      SIT_DOCUMENTO :=CreaCampo('SIT_DOCUMENTO',ftString,tsNinguno,tsNinguno,True);
      With SIT_DOCUMENTO do
      begin Size:=2;
            UseCombo:=True;
            ComboLista.Add('0'); ComboDatos.Add('AC');
            ComboLista.Add('1'); ComboDatos.Add('CA');
      end;
            SIT_DOCUMENTO.Caption:='Situación Documento por Emisor';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      DIAS_PAGO :=CreaCampo('DIAS_PAGO',ftInteger,tsNinguno,tsNinguno,True); // JFOF 03/01/2013 JFOF
                DIAS_PAGO.Caption:='Días de Pago';
      B_F_VENC_REAL :=CreaCampo('B_F_VENC_REAL',ftString,tsNinguno,tsNinguno,True);
                B_F_VENC_REAL.Caption:='Valida F_Vencim Real';

      FKeyFields.Add('CVE_FND_ENT_DES');
      FKeyFields.Add('ID_EMISOR');
      FKeyFields.Add('CVE_DOCUMENTO');

      TableName := 'CR_EMISOR_DOC';
      UseQuery := True;
      HelpFile := 'IntCrEmisDoc.Hlp';
      ShowMenuReporte:=True;

      Emisor := TCrEmisor.Create(Self);
      Emisor.MasterSource:=Self;
      Emisor.FieldByName('CVE_FND_ENT_DES').MasterField:='CVE_FND_ENT_DES';
      Emisor.FieldByName('ID_ACREDITADO').MasterField:='ID_EMISOR';

      TipoDocto := TCrTDocto.Create(Self);
      TipoDocto.MasterSource:=Self;
      TipoDocto.FieldByName('CVE_DOCUMENTO').MasterField:='CVE_DOCUMENTO';

      MInstDesc := TMInstDesc.Create(Self);
      MInstDesc.MasterSource:= Self;
      MInstDesc.FieldByName('CVE_FND_ENT_DES').MasterField:= 'CVE_FND_ENT_DES';
end;

Destructor TCrEmisDoc.Destroy;
begin
   if Emisor <> nil then
      Emisor.Free;
   if TipoDocto <> nil then
      TipoDocto.Free;
   if MInstDesc <> nil then
      MInstDesc.Free;
   inherited;
end;


function TCrEmisDoc.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrEmisorDoc;
begin
   W:=TWCrEmisorDoc.Create(Self);
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


Function TCrEmisDoc.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrEmDo.it','S,F,S');
      Try if Active then begin T.Param(0,CVE_FND_ENT_DES.AsString);
                               T.Param(1,ID_EMISOR.AsString);
                               T.Param(2,CVE_DOCUMENTO.AsString);
                               end;
          if T.Execute then
             InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2)]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA CR_EMISOR_DOC********************)
(*                                                                              *)
(*  FORMA DE CR_EMISOR_DOC                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_EMISOR_DOC********************)

procedure TWCrEmisorDoc.FormShow(Sender: TObject);
begin
      // Pinta datos del panel
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_FND_ENT_DES.Control:= edCVE_FND_ENT_DES;
      Objeto.ID_EMISOR.Control:=edID_EMISOR;
      Objeto.CVE_DOCUMENTO.Control:=edCVE_DOCUMENTO;
      Objeto.SIT_DOCUMENTO.Control:=rgSIT_DOCUMENTO;
      Objeto.F_ALTA.Control := edF_ALTA;
      Objeto.CVE_USU_ALTA.Control := edCVE_USU_ALTA;
      Objeto.F_MODIFICA.Control := edF_MODIFICA;
      Objeto.CVE_USU_MODIFICA.Control := edCVE_USU_MODIFICA;
      Objeto.TASA_AFORO.Control := edTASA_AFORO;
      Objeto.DIAS_PAGO.Control := edDIAS_PAGO;
      Objeto.B_F_VENC_REAL.Control := chB_FV_REAL;

      Objeto.Emisor.CVE_FND_ENT_DES.Control:= edCVE_FND_ENT_DES;
      Objeto.Emisor.Acreditado.Persona.Nombre.Control := edNOM_EMISOR;
      Objeto.Emisor.GetParams(Objeto);

      Objeto.TipoDocto.DESC_DOCUMENTO.Control := edDESC_TIPO_DOCTO;
      Objeto.TipoDocto.TASA_AFORO.Control := edTASA_AFORO;
      Objeto.TipoDocto.GetParams(Objeto);

      Objeto.MInstDesc.CVE_FND_ENT_DES.Control := edCVE_FND_ENT_DES;
      Objeto.MInstDesc.DESC_ENT_DES.Control := edDESC_ENT_DES;
      Objeto.MInstDesc.GetParams(Objeto);

      Interforma1.MsgPanel := MsgPanel;
end;

procedure TWCrEmisorDoc.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_FND_ENT_DES.Control:= nil;
      Objeto.ID_EMISOR.Control:=nil;
      Objeto.CVE_DOCUMENTO.Control:=nil;
      Objeto.SIT_DOCUMENTO.Control:=nil;
      Objeto.F_ALTA.Control := nil;
      Objeto.CVE_USU_ALTA.Control := nil;
      Objeto.F_MODIFICA.Control := nil;
      Objeto.CVE_USU_MODIFICA.Control := nil;
      Objeto.TASA_AFORO.Control := nil;
      Objeto.DIAS_PAGO.Control := nil;
      Objeto.B_F_VENC_REAL.Control := nil;

      Objeto.Emisor.CVE_FND_ENT_DES.Control:= nil;
      Objeto.Emisor.Acreditado.Persona.Nombre.Control := nil;
      Objeto.TipoDocto.DESC_DOCUMENTO.Control := nil;
      Objeto.TipoDocto.TASA_AFORO.Control := nil;
      Objeto.MInstDesc.CVE_FND_ENT_DES.Control := nil;
      Objeto.MInstDesc.DESC_ENT_DES.Control := nil;
end;

procedure TWCrEmisorDoc.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrEmisorDoc.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.SIT_DOCUMENTO.AsString := 'AC';
   Objeto.F_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresa;
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   Objeto.B_F_VENC_REAL.AsString := CVERDAD;
   MuestraHints;
   edCVE_FND_ENT_DES.SetFocus;
end;

procedure TWCrEmisorDoc.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.F_MODIFICA.AsDateTime := Objeto.Apli.DameFechaEmpresa;
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
   edTASA_AFORO.SetFocus;
end;

procedure TWCrEmisorDoc.btACREDITADOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCREMISDOC_ACRED',True,True) then
   begin
       Objeto.CVE_FND_ENT_DES.GetFromControl;
       If Objeto.CVE_FND_ENT_DES.AsString <> '' Then Begin
          Objeto.Emisor.BuscaWhereString := ' CR_EMISOR.CVE_FND_ENT_DES = ' + #39 + Objeto.CVE_FND_ENT_DES.AsString + #39;
          Objeto.Emisor.FilterString := Objeto.Emisor.BuscaWhereString;
       End;

       Objeto.Emisor.ShowAll := True;
       If Objeto.Emisor.Busca Then
          InterForma1.NextTab(edID_EMISOR);
   end;
end;

procedure TWCrEmisorDoc.ilEMISORCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrEmisorDoc.ilEMISOREjecuta(Sender: TObject);
begin
   Objeto.CVE_FND_ENT_DES.GetFromControl;
   If Objeto.CVE_FND_ENT_DES.AsString <> '' Then Begin
      Objeto.Emisor.BuscaWhereString := ' CR_EMISOR.CVE_FND_ENT_DES = ' + #39 + Objeto.CVE_FND_ENT_DES.AsString + #39;
      Objeto.Emisor.FilterString := Objeto.Emisor.BuscaWhereString;
   End;

   If Objeto.Emisor.FindKeyNear([Objeto.CVE_FND_ENT_DES.AsString, ilEMISOR.Buffer],['CVE_FND_ENT_DES','ID_ACREDITADO']) Then
      InterForma1.NextTab(edID_EMISOR);
end;

procedure TWCrEmisorDoc.btTIPO_DOCTOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCREMISDOC_TPDOC',True,True) then
   begin
     Objeto.TipoDocto.ShowAll := True;
     if Objeto.TipoDocto.Busca then
        InterForma1.NextTab(edCVE_DOCUMENTO);
     //end if
     Objeto.TASA_AFORO.AsFloat := Objeto.TipoDocto.TASA_AFORO.AsFloat;
   end;
end;

procedure TWCrEmisorDoc.ilTIPO_DOCTOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrEmisorDoc.ilTIPO_DOCTOEjecuta(Sender: TObject);
begin
   if Objeto.TipoDocto.FindKey([ilTIPO_DOCTO.Buffer]) then
       InterForma1.NextTab(edCVE_DOCUMENTO);
   //end if
end;

procedure TWCrEmisorDoc.edID_EMISORExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMesg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      VLMesg     := '';
      VLSalida := True;
      Objeto.ID_EMISOR.GetFromControl;
      if Objeto.ID_EMISOR.AsString = '' then
      Begin
         VLSalida  := False;
         VLMesg    := 'Favor de Indicar al Emisor';
      end
      else if Objeto.Emisor.SIT_EMISOR.AsString <> 'AC' then
      Begin
         VLSalida  := False;
         VLMesg     := 'Emisor no Activo';
      end; //end if
      InterForma1.ValidaExit(edID_EMISOR,VLSalida,VLMesg,True);
   end;
end;

procedure TWCrEmisorDoc.edCVE_DOCUMENTOExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMesg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      VLMesg     := '';
      VLSalida := True;
      Objeto.CVE_DOCUMENTO.GetFromControl;
      if Objeto.CVE_DOCUMENTO.AsString = '' then
      Begin
         VLSalida  := False;
         VLMesg    := 'Favor de Indicar el Tipo de Documento';
      end;
      InterForma1.ValidaExit(edCVE_DOCUMENTO,VLSalida,VLMesg,True);
   end; //end if
end;

procedure TWCrEmisorDoc.edTASA_AFOROExit(Sender: TObject);
var vlsalida : Boolean;
    vlMsg    : String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   Begin
      vlSalida := True;
      vlMsg := '';
      Objeto.TASA_AFORO.GetFromControl;
      if Objeto.TASA_AFORO.AsString = '' then
         Objeto.TASA_AFORO.AsFloat := 0
      else if Objeto.TASA_AFORO.AsFloat < 0 then
      Begin
         vlSalida := False;
         vlMsg := 'El % Aforado no puede ser negativo';
      end;
      InterForma1.ValidaExit(edTASA_AFORO,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrEmisorDoc.rgSIT_DOCUMENTOExit(Sender: TObject);
Begin
   InterForma1.ValidaExit(rgSIT_DOCUMENTO,True,'',True);
end;

Procedure TWCrEmisorDoc.MuestraHints;
Begin
      edNOM_EMISOR.Hint := Objeto.Emisor.Acreditado.Persona.Nombre.AsString;
      edNOM_EMISOR.ShowHint := True;
      edDESC_TIPO_DOCTO.Hint := Objeto.TipoDocto.DESC_DOCUMENTO.AsString;
      edDESC_TIPO_DOCTO.ShowHint := True;
End;

procedure TWCrEmisorDoc.InterForma1Buscar(Sender: TObject);
begin
 if Objeto.Busca then
 Begin
    Objeto.Emisor.Acreditado.FindKey([Objeto.ID_EMISOR.AsString]);
    MuestraHints;
 end;
end;

procedure TWCrEmisorDoc.InterForma1DespuesAceptar(Sender: TObject);
begin
    MuestraHints;
end;

procedure TWCrEmisorDoc.InterForma1AntesAceptar(Sender: TObject;
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

procedure TWCrEmisorDoc.edCVE_FND_ENT_DESExit(Sender: TObject);
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
         VLMesg    := 'Favor de Indicar la Entidad Descontadora';
      end; //end if
      InterForma1.ValidaExit(edCVE_FND_ENT_DES,VLSalida,VLMesg,True);
   end;
end;

procedure TWCrEmisorDoc.btnCVE_FND_ENT_DESExit(Sender: TObject);
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
         VLMesg    := 'Favor de Indicar la Entidad Descontadora';
      end; //end if
      InterForma1.ValidaExit(edCVE_FND_ENT_DES,VLSalida,VLMesg,True);
   end;
end;

procedure TWCrEmisorDoc.btnCVE_FND_ENT_DESClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCREMISDOC_ENTDS',True,True) then
   begin
     Objeto.MInstDesc.ShowAll := True;
     if Objeto.MInstDesc.Busca then
        InterForma1.NextTab(edCVE_FND_ENT_DES);
   end;
end;

procedure TWCrEmisorDoc.ilCVE_FND_ENT_DESCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrEmisorDoc.ilCVE_FND_ENT_DESEjecuta(Sender: TObject);
begin
   if Objeto.MInstDesc.FindKey([ilCVE_FND_ENT_DES.Buffer]) then
      InterForma1.NextTab(edCVE_FND_ENT_DES);
end;

procedure TWCrEmisorDoc.chB_FV_REALExit(Sender: TObject);
begin
      InterForma1.ValidaExit(chB_FV_REAL,True,'',True);
end;

end.
