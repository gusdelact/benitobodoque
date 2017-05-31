// Sistema         : Clase de CR_REL_OPE_CON
// Fecha de Inicio : 03/06/2003
// Función forma   : Clase de CR_REL_OPE_CON
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : 
// Comentarios     :
Unit IntCrReOpCo;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,

//Unidades Adicionales
IntParamCre, IntCrOperaci, IntCrConcept, IntDVOperaci;

Type
 TCrReOpCo= class;

  TWCrRelOpeCon=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_OPERACION : TLabel;
    edCVE_OPERACION : TEdit;
    lbCVE_CONCEPTO : TLabel;
    edCVE_CONCEPTO : TEdit;
    lbCVE_AFECTA_DV : TLabel;
    edCVE_AFECTA_DV : TEdit;
    lbCVE_CANC_DV : TLabel;
    edCVE_CANC_DV : TEdit;
    rgCVE_AFEC_IMP_OP : TRadioGroup;
    chB_EDO_CTA : TCheckBox;
    btOPERACION: TBitBtn;
    btCONCEPTO: TBitBtn;
    edDESC_CONCEPTO: TEdit;
    edDESC_OPER: TEdit;
    btCANCELA_DV: TBitBtn;
    btAFECTA_DV: TBitBtn;
    edAFECTA_DV: TEdit;
    edCANCELA_DV: TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    ilOPERACION: TInterLinkit;
    ilCONCEPTO: TInterLinkit;
    ilAFECTA_DV: TInterLinkit;
    ilCANCELA_DV: TInterLinkit;
    PnlMsg: TPanel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btOPERACIONClick(Sender: TObject);
    procedure ilOPERACIONEjecuta(Sender: TObject);
    procedure ilOPERACIONCapture(Sender: TObject; var Show: Boolean);
    procedure btCONCEPTOClick(Sender: TObject);
    procedure ilCONCEPTOEjecuta(Sender: TObject);
    procedure ilCONCEPTOCapture(Sender: TObject; var Show: Boolean);
    procedure edCVE_OPERACIONExit(Sender: TObject);
    procedure edCVE_CONCEPTOExit(Sender: TObject);
    procedure edCVE_AFECTA_DVExit(Sender: TObject);
    procedure edCVE_CANC_DVExit(Sender: TObject);
    procedure chB_EDO_CTAExit(Sender: TObject);
    procedure rgCVE_AFEC_IMP_OPExit(Sender: TObject);
    procedure btAFECTA_DVClick(Sender: TObject);
    procedure ilAFECTA_DVEjecuta(Sender: TObject);
    procedure ilAFECTA_DVCapture(Sender: TObject; var Show: Boolean);
    procedure btCANCELA_DVClick(Sender: TObject);
    procedure ilCANCELA_DVEjecuta(Sender: TObject);
    procedure ilCANCELA_DVCapture(Sender: TObject; var Show: Boolean);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    Procedure MuestraHints;
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrReOpCo;
end;
 TCrReOpCo= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_OPERACION            : TInterCampo;
        CVE_CONCEPTO             : TInterCampo;
        CVE_AFECTA_DV            : TInterCampo;
        CVE_CANC_DV              : TInterCampo;
        CVE_AFEC_IMP_OP          : TInterCampo;
        B_EDO_CTA                : TInterCampo;

        ParamCre                 : TParamCre;
        Operacion                : TCrOperaci;
        Concepto                 : TCrConcept;
        DVOperAfec               : TDVOperaci;
        DVOperCanc               : TDVOperaci;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation

{$R *.DFM}


constructor TCrReOpCo.Create( AOwner : TComponent );
begin Inherited;
      CVE_OPERACION :=CreaCampo('CVE_OPERACION',ftString,tsNinguno,tsNinguno,True);
                CVE_OPERACION.Caption:='Clave Operación';
      CVE_CONCEPTO :=CreaCampo('CVE_CONCEPTO',ftString,tsNinguno,tsNinguno,True);
                CVE_CONCEPTO.Caption:='Clave Concepto';
      CVE_AFECTA_DV :=CreaCampo('CVE_AFECTA_DV',ftString,tsNinguno,tsNinguno,True);
                CVE_AFECTA_DV.Caption:='Clave Afecta Depósitos a la Vista';
      CVE_CANC_DV :=CreaCampo('CVE_CANC_DV',ftString,tsNinguno,tsNinguno,True);
                CVE_CANC_DV.Caption:='Clave Cancela Depositos a la Vista';
      CVE_AFEC_IMP_OP :=CreaCampo('CVE_AFEC_IMP_OP',ftString,tsNinguno,tsNinguno,True);
         With CVE_AFEC_IMP_OP do
         Begin Size := 1;
               UseCombo := True;
                ComboLista.Add('0'); ComboDatos.Add('I');
                ComboLista.Add('1'); ComboDatos.Add('D');
                ComboLista.Add('2'); ComboDatos.Add('N');
         end;
                CVE_AFEC_IMP_OP.Caption:='Afecta Importe Operación';
      B_EDO_CTA :=CreaCampo('B_EDO_CTA',ftString,tsNinguno,tsNinguno,True);
                B_EDO_CTA.Caption:='Estado de Cuenta';
      FKeyFields.Add('CVE_OPERACION');
      FKeyFields.Add('CVE_CONCEPTO');

      TableName := 'CR_REL_OPE_CON';
      UseQuery := True;
      HelpFile := 'IntCrReOpCo.Hlp';
      ShowMenuReporte:=True;

      Operacion := TCrOperaci.Create(self);
      Operacion.MasterSource := self;
      Operacion.FieldByName('CVE_OPERACION').MasterField := 'CVE_OPERACION';

      Concepto := TCrConcept.Create(self);
      Concepto.MasterSource := self;
      Concepto.FieldByName('CVE_CONCEPTO').MasterField := 'CVE_CONCEPTO';

      DVOperAfec := TDVOperaci.Create(self);
      DVOperAfec.MasterSource := self;
      DVOperAfec.FieldByName('CVE_OPERACION').MasterField := 'CVE_AFECTA_DV';

      DVOperCanc := TDVOperaci.Create(self);
      DVOperCanc.MasterSource := self;
      DVOperCanc.FieldByName('CVE_OPERACION').MasterField := 'CVE_CANC_DV';

end;


Destructor TCrReOpCo.Destroy;
begin
   if Operacion <> nil then
      Operacion.Free;
   //en if

   if Concepto <> nil then
   Concepto.Free;
   //en if

   if DVOperAfec <> nil then
   DVOperAfec.Free;
   //en if

   if DVOperCanc <> nil then
   DVOperCanc.Free;
   //en if

   inherited;
end;


function TCrReOpCo.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrRelOpeCon;
begin
   W:=TWCrRelOpeCon.Create(Self);
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


Function TCrReOpCo.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrReOC.it','S,S');
//      T := CreaBuscador('ICrROC.it','S,S');
      Try if Active then begin T.Param(0,CVE_OPERACION.AsString);
                               T.Param(1,CVE_CONCEPTO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA CR_REL_OPE_CON********************)
(*                                                                              *)
(*  FORMA DE CR_REL_OPE_CON                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_REL_OPE_CON********************)

procedure TWCrRelOpeCon.FormShow(Sender: TObject);
begin
      //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_OPERACION.Control:=edCVE_OPERACION;
      Objeto.CVE_CONCEPTO.Control:=edCVE_CONCEPTO;
      Objeto.CVE_AFEC_IMP_OP.Control:=rgCVE_AFEC_IMP_OP;
      Objeto.B_EDO_CTA.Control:=chB_EDO_CTA;

      Objeto.Operacion.DESC_C_OPERACION.Control := edDESC_OPER;
      Objeto.Operacion.GetParams(Objeto);

      Objeto.Concepto.DESC_C_CONCEPTO.Control := edDESC_CONCEPTO;
      Objeto.Concepto.GetParams(Objeto);

      Objeto.DVOperAfec.CVE_OPERACION.Control := edCVE_AFECTA_DV;
      Objeto.DVOperAfec.DESC_C_ID_PRIM.Control := edAFECTA_DV;
      Objeto.DVOperAfec.GetParams(Objeto);

      Objeto.DVOperCanc.CVE_OPERACION.Control := edCVE_CANC_DV;
      Objeto.DVOperCanc.DESC_C_ID_PRIM.Control := edCANCELA_DV;
      Objeto.DVOperCanc.GetParams(Objeto);

      InterForma1.MsgPanel := PnlMsg;
end;

procedure TWCrRelOpeCon.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_OPERACION.Control:=nil;
      Objeto.CVE_CONCEPTO.Control:=nil;
      Objeto.CVE_AFEC_IMP_OP.Control:=nil;
      Objeto.B_EDO_CTA.Control:=nil;

      Objeto.Operacion.DESC_C_OPERACION.Control := nil;
      Objeto.Concepto.DESC_C_CONCEPTO.Control := nil;

      Objeto.DVOperAfec.CVE_OPERACION.Control := nil;
      Objeto.DVOperAfec.DESC_C_ID_PRIM.Control := nil;

      Objeto.DVOperCanc.CVE_OPERACION.Control := nil;
      Objeto.DVOperCanc.DESC_C_ID_PRIM.Control := nil;

   //Objeto
end;

procedure TWCrRelOpeCon.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrRelOpeCon.InterForma1DespuesNuevo(Sender: TObject);
begin
   rgCVE_AFEC_IMP_OP.ItemIndex := 0;
   MuestraHints;   
   edCVE_OPERACION.SetFocus;
end;

procedure TWCrRelOpeCon.InterForma1DespuesModificar(Sender: TObject);
begin chB_EDO_CTA.SetFocus;
end;

procedure TWCrRelOpeCon.btOPERACIONClick(Sender: TObject);
begin
   Objeto.Operacion.ShowAll := true;
   if Objeto.Operacion.Busca then
       InterForma1.NextTab(edCVE_OPERACION);
   //end if
end;

procedure TWCrRelOpeCon.ilOPERACIONEjecuta(Sender: TObject);
begin
   if Objeto.Operacion.FindKey([ilOPERACION.Buffer]) then
       InterForma1.NextTab(edCVE_OPERACION);
   //end if
end;

procedure TWCrRelOpeCon.ilOPERACIONCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrRelOpeCon.btCONCEPTOClick(Sender: TObject);
begin
   Objeto.Concepto.ShowAll := true;
   if Objeto.Concepto.Busca then
       InterForma1.NextTab(edCVE_CONCEPTO);
   //end if
end;

procedure TWCrRelOpeCon.ilCONCEPTOEjecuta(Sender: TObject);
begin
   if Objeto.Concepto.FindKey([ilCONCEPTO.Buffer]) then
       InterForma1.NextTab(edCVE_CONCEPTO);
   //end if
end;

procedure TWCrRelOpeCon.ilCONCEPTOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrRelOpeCon.edCVE_OPERACIONExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMsg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      VLMsg     := '';
      VLSalida := True;
      Objeto.CVE_OPERACION.GetFromControl;
      if Objeto.CVE_OPERACION.AsString = '' then
      Begin
         VlSalida   := False;
         VLMsg :='Favor de Indicar la Clave del Operación';
      end;
      InterForma1.ValidaExit(edCVE_OPERACION,VLSalida,VLMsg,True);
   end;
end;

procedure TWCrRelOpeCon.edCVE_CONCEPTOExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMsg     :  String;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      VLMsg     := '';
      Objeto.CVE_CONCEPTO.GetFromControl;
      if Objeto.CVE_CONCEPTO.AsString = '' then
      Begin
         VLMsg:= 'Favor de Indicar la Clave del Concepto';
         VlSalida   := False;
      end; //end if
      InterForma1.ValidaExit(edCVE_CONCEPTO,VLSalida,VLMsg,True);
   end;
end;

procedure TWCrRelOpeCon.edCVE_AFECTA_DVExit(Sender: TObject);
Begin
      InterForma1.ValidaExit(edCVE_AFECTA_DV,True,'',True);
end;

procedure TWCrRelOpeCon.edCVE_CANC_DVExit(Sender: TObject);
Begin
      InterForma1.ValidaExit(edCVE_CANC_DV,True,'',True);
end;

procedure TWCrRelOpeCon.chB_EDO_CTAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_EDO_CTA,True,'',True);
end;

procedure TWCrRelOpeCon.rgCVE_AFEC_IMP_OPExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgCVE_AFEC_IMP_OP,True,'',True);
end;

procedure TWCrRelOpeCon.btAFECTA_DVClick(Sender: TObject);
begin
   Objeto.DVOperAfec.BuscaWhereString := 'DV_OPERACION.CVE_MEDIO = '+
                                        #39 + 'CREDIT' + #39 ;
   Objeto.DVOperAfec.FilterString := Objeto.DVOperAfec.BuscaWhereString;

   Objeto.DVOperAfec.ShowAll := true;
   if Objeto.DVOperAfec.Busca then
       InterForma1.NextTab(edCVE_AFECTA_DV);
   //end if
end;

procedure TWCrRelOpeCon.ilAFECTA_DVEjecuta(Sender: TObject);
begin
   if Objeto.DVOperAfec.FindKey([ilAFECTA_DV.Buffer]) then
      InterForma1.NextTab(edCVE_AFECTA_DV);
   //end if
end;

procedure TWCrRelOpeCon.ilAFECTA_DVCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrRelOpeCon.btCANCELA_DVClick(Sender: TObject);
begin
   Objeto.DVOperCanc.BuscaWhereString := 'DV_OPERACION.CVE_MEDIO = '+
                                        #39 + 'CREDIT' + #39 ;
   Objeto.DVOperCanc.FilterString := Objeto.DVOperCanc.BuscaWhereString;

   Objeto.DVOperCanc.ShowAll := true;
   if Objeto.DVOperCanc.Busca then
      InterForma1.NextTab(edCVE_CANC_DV);
   //end if
end;

procedure TWCrRelOpeCon.ilCANCELA_DVEjecuta(Sender: TObject);
begin
   if Objeto.DVOperCanc.FindKey([ilCANCELA_DV.Buffer]) then
      InterForma1.NextTab(edCVE_CANC_DV);
   //end if
end;

procedure TWCrRelOpeCon.ilCANCELA_DVCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWCrRelOpeCon.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   //nuevo
   if IsNewData then
   Begin
      if MessageDlg('¿Desea almacenar los datos capturados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           Objeto.CVE_OPERACION.AsString := Objeto.Operacion.CVE_OPERACION.AsString;
           Realizado := True;
      end
      else Realizado := False;
   end
   else
   Begin
      if MessageDlg('¿Desea guardar los datos modificados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           Objeto.CVE_OPERACION.AsString := Objeto.Operacion.CVE_OPERACION.AsString;
           Realizado := True;
      end
      else Realizado := False;
   end
end;

Procedure TWCrRelOpeCon.MuestraHints;
Begin
      edDESC_OPER.Hint := Objeto.Operacion.DESC_C_OPERACION.AsString;
      edDESC_OPER.ShowHint := True;
      edDESC_CONCEPTO.Hint := Objeto.Concepto.DESC_C_CONCEPTO.AsString;
      edDESC_CONCEPTO.ShowHint := True;
      edAFECTA_DV.Hint := Objeto.DVOperAfec.DESC_C_ID_PRIM.AsString;
      edAFECTA_DV.ShowHint := True;
      edCANCELA_DV.Hint := Objeto.DVOperCanc.DESC_C_ID_PRIM.AsString;
      edCANCELA_DV.ShowHint := True;
End;

procedure TWCrRelOpeCon.InterForma1Buscar(Sender: TObject);
begin
 if Objeto.Busca then
    MuestraHints;
 //end if
end;

procedure TWCrRelOpeCon.InterForma1DespuesAceptar(Sender: TObject);
begin
    MuestraHints;
end;

end.
