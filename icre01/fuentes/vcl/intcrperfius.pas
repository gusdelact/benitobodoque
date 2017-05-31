// Sistema         : Clase de CR_PERFIL_USUAR
// Fecha de Inicio : 02/06/2003
// Función forma   : Clase de CR_PERFIL_USUAR
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrPerfiUs;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,IntParamCre,

IntGenCre, IntSecGpAcc, IntLinkit, InterEdit;

Type
 TCrPerfiUs= class;

  TWCrPerfilUs=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_GPO_ACCESO : TLabel;
    edCVE_GPO_ACCESO : TEdit;
    lbDESC_TIPO_USUAR : TLabel;
    edDESC_TIPO_USUAR : TEdit;
    chB_BLOQUEADO : TCheckBox;
    btnCVE_GPO_ACCESO: TBitBtn;
    ILCVE_GPO_ACCESO: TInterLinkit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    edNOM_GPO_ACCESO: TEdit;
    GroupBox1: TGroupBox;
    chB_AUT_REMANENTE: TCheckBox;
    chB_LIB_REMANENTE: TCheckBox;
    cbB_VAL_HORA_SEG: TCheckBox;
    rgCVE_TIPO_USUARIO: TRadioGroup;
    GroupBox2: TGroupBox;
    cbB_AUT_CESION: TCheckBox;
    cbB_VAL_IMP_CES: TCheckBox;
    Label1: TLabel;
    iedIMP_MAX_AUT_CES: TInterEdit;
    chB_CANCELA_CES_AU: TCheckBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure ILCVE_GPO_ACCESOCapture(Sender: TObject; var Show: Boolean);
    procedure ILCVE_GPO_ACCESOEjecuta(Sender: TObject);
    procedure btnCVE_GPO_ACCESOClick(Sender: TObject);
    procedure edCVE_GPO_ACCESOExit(Sender: TObject);
    procedure edDESC_TIPO_USUARExit(Sender: TObject);
    procedure chB_BLOQUEADOExit(Sender: TObject);
    procedure chB_AUT_REMANENTEExit(Sender: TObject);
    procedure chB_LIB_REMANENTEExit(Sender: TObject);
    Procedure MuestraHints;
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure cbB_VAL_HORA_SEGExit(Sender: TObject);
    procedure cbB_AUT_CESIONExit(Sender: TObject);
    procedure iedIMP_MAX_AUT_CESExit(Sender: TObject);
    procedure chB_CANCELA_CES_AUExit(Sender: TObject);
    procedure rgCVE_TIPO_USUARIOExit(Sender: TObject);
    procedure cbB_VAL_IMP_CESExit(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
     Objeto : TCrPerfiUs;
    end;
 TCrPerfiUs= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_GPO_ACCESO           : TInterCampo;
        CVE_TIPO_USUARIO         : TInterCampo;
        DESC_TIPO_USUAR          : TInterCampo;
        B_BLOQUEADO              : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        B_AUT_REMANENTE          : TInterCampo;
        B_LIB_REMANENTE          : TInterCampo;
        B_VAL_HORA_SEG           : TInterCampo;
        B_AUT_CESION             : TInterCampo;
        B_VAL_IMP_CES            : TInterCampo;
        IMP_MAX_AUT_CES          : TInterCampo;
        B_CANCELA_CES_AU         : TInterCampo;

        Perfil : TSecGpAcc;
        ParamCre                 : TParamCre;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrPerfiUs.Create( AOwner : TComponent );
begin Inherited;
      CVE_GPO_ACCESO :=CreaCampo('CVE_GPO_ACCESO',ftString,tsNinguno,tsNinguno,True);
                CVE_GPO_ACCESO.Caption:='Clave de Grupo Acceso';
      CVE_TIPO_USUARIO :=CreaCampo('CVE_TIPO_USUARIO',ftString,tsNinguno,tsNinguno,True);
         With CVE_TIPO_USUARIO do
         Begin  Size := 2;
                UseCombo := True;
                ComboLista.Add('0'); ComboDatos.Add('AD');
                ComboLista.Add('1'); ComboDatos.Add('AS');
                ComboLista.Add('2'); ComboDatos.Add('CO');
         end;
                CVE_TIPO_USUARIO.Caption:='Clave de Tipo Usuario';
      DESC_TIPO_USUAR :=CreaCampo('DESC_TIPO_USUAR',ftString,tsNinguno,tsNinguno,True);
                DESC_TIPO_USUAR.Caption:='Descripción Tipo Usuario';
      B_BLOQUEADO :=CreaCampo('B_BLOQUEADO',ftString,tsNinguno,tsNinguno,True);
                B_BLOQUEADO.Caption:='Bloqueado';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      B_AUT_REMANENTE :=CreaCampo('B_AUT_REMANENTE',ftString,tsNinguno,tsNinguno,True);
                B_AUT_REMANENTE.Caption:='Autoriza Remanente';
      B_LIB_REMANENTE :=CreaCampo('B_LIB_REMANENTE',ftString,tsNinguno,tsNinguno,True);
                B_LIB_REMANENTE.Caption:='Libera Remanente';
      B_VAL_HORA_SEG :=CreaCampo('B_VAL_HORA_SEG',ftString,tsNinguno,tsNinguno,True);
                B_VAL_HORA_SEG.Caption:='Activa Hora Captura Seguimiento';
      B_AUT_CESION :=CreaCampo('B_AUT_CESION',ftString,tsNinguno,tsNinguno,True);
                B_AUT_CESION.Caption:='Autoriza Cesión';
      B_VAL_IMP_CES :=CreaCampo('B_VAL_IMP_CES',ftString,tsNinguno,tsNinguno,True);
                B_VAL_IMP_CES.Caption:='Valida Importe Cesión';
      IMP_MAX_AUT_CES :=CreaCampo('IMP_MAX_AUT_CES',ftFloat,tsNinguno,tsNinguno,True);
                IMP_MAX_AUT_CES.Caption:='Importe Máximo Autorizado Cesión';
      B_CANCELA_CES_AU :=CreaCampo('B_CANCELA_CES_AU',ftString,tsNinguno,tsNinguno,True);
                B_CANCELA_CES_AU.Caption:='Valida Cancela Cesion';

      FKeyFields.Add('CVE_GPO_ACCESO');
      FKeyFields.Add('CVE_TIPO_USUARIO');

      Perfil := TSecGpAcc.Create(Self);
      Perfil.MasterSource := Self;

      TableName := 'CR_PERFIL_USUAR';
      UseQuery := True;
      HelpFile := 'IntCrPerfiUs.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrPerfiUs.Destroy;
begin
   if Perfil <> nil then
      Perfil.free;
   //end if
   Inherited;
end;

function TCrPerfiUs.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrPerfilUs;
begin
   W:=TWCrPerfilUs.Create(Self);
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

Function TCrPerfiUs.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrPerUs.it','S,S');
      Try if Active then begin T.Param(0,CVE_GPO_ACCESO.AsString);
                               T.Param(1,CVE_TIPO_USUARIO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end;
end;

(********************************************** FORMA CR_PERFIL_USUAR *******************)
(*                                                                                      *)
(*  FORMA DE CR_PERFIL_USUAR                                                            *)
(*                                                                                      *)
(********************************************** FORMA CR_PERFIL_USUAR *******************)

procedure TWCrPerfilUs.FormShow(Sender: TObject);
begin
 With Objeto Do
  Begin
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      CVE_GPO_ACCESO.Control := edCVE_GPO_ACCESO;
      CVE_TIPO_USUARIO.Control := rgCVE_TIPO_USUARIO;
      DESC_TIPO_USUAR.Control := edDESC_TIPO_USUAR;
      B_BLOQUEADO.Control := chB_BLOQUEADO;
      B_AUT_REMANENTE.Control := chB_AUT_REMANENTE;
      B_LIB_REMANENTE.Control := chB_LIB_REMANENTE;
      B_VAL_HORA_SEG.Control := cbB_VAL_HORA_SEG;
      B_AUT_CESION.Control := cbB_AUT_CESION;
      B_VAL_IMP_CES.Control := cbB_VAL_IMP_CES;
      IMP_MAX_AUT_CES.Control := iedIMP_MAX_AUT_CES;
      B_CANCELA_CES_AU.Control := chB_CANCELA_CES_AU;

      Perfil.CVE_APLICACION.AsString := Apli.Apli;
      Perfil.NOM_GPO_ACCESO.Control := edNOM_GPO_ACCESO;
//      Perfil.Perfil.NOM_GPO_ACCESO.Control := edNOM_GPO_ACCESO;
      Perfil.BuscaWhereString := 'SECU_GPO_ACCESO.CVE_APLICACION = '#39+Apli.Apli+#39;
  End;
end;

procedure TWCrPerfilUs.FormDestroy(Sender: TObject);
begin
 With Objeto Do
  Begin
      CVE_GPO_ACCESO.Control := nil;
      CVE_TIPO_USUARIO.Control := nil;
      DESC_TIPO_USUAR.Control := nil;
      B_BLOQUEADO.Control := nil;
      B_AUT_REMANENTE.Control := nil;
      B_LIB_REMANENTE.Control := nil;
      B_VAL_HORA_SEG.Control := nil;
      B_AUT_CESION.Control := nil;
      B_VAL_IMP_CES.Control := nil;
      IMP_MAX_AUT_CES.Control := nil;
      B_CANCELA_CES_AU.Control := nil;

      Perfil.NOM_GPO_ACCESO.Control := nil;
  End;
end;

procedure TWCrPerfilUs.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrPerfilUs.InterForma1DespuesNuevo(Sender: TObject);
begin
   rgCVE_TIPO_USUARIO.ItemIndex := 0;
   MuestraHints;
   If edCVE_GPO_ACCESO.CanFocus Then edCVE_GPO_ACCESO.SetFocus;
end;

procedure TWCrPerfilUs.InterForma1DespuesModificar(Sender: TObject);
begin If edCVE_GPO_ACCESO.CanFocus Then edCVE_GPO_ACCESO.SetFocus;
end;

procedure TWCrPerfilUs.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
 With Objeto Do
  Begin
     //nuevo
   if IsNewData then
   Begin
      if MessageDlg('¿Desea almacenar los datos capturados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           CVE_USU_ALTA.AsString := DameUsuario;
           F_ALTA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
           Realizado := True;
      end
      else Realizado := False;
   end
   else
   Begin
      if MessageDlg('¿Desea guradar los datos modificados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin
           CVE_USU_MODIFICA.AsString := DameUsuario;
           F_MODIFICA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
           Realizado := True;
      end
      else Realizado := False;
   end
  End;
end;

procedure TWCrPerfilUs.ILCVE_GPO_ACCESOCapture(Sender: TObject;
  var Show: Boolean);
begin
 Show := True;
end;

procedure TWCrPerfilUs.ILCVE_GPO_ACCESOEjecuta(Sender: TObject);
begin
 With Objeto Do
    Begin
       If Perfil.FindKey([Apli.Apli,ILCVE_GPO_ACCESO.Buffer]) Then
          Begin
             CVE_GPO_ACCESO.AsInteger := Perfil.ID_GPO_ACCESO.AsInteger;
             InterForma1.NextTab(edCVE_GPO_ACCESO);
          end;
    end;
end;

procedure TWCrPerfilUs.btnCVE_GPO_ACCESOClick(Sender: TObject);
begin
 With Objeto Do
    Begin
      Perfil.ShowAll := True;
      If Perfil.Busca Then
         Begin
            CVE_GPO_ACCESO.AsInteger := Perfil.ID_GPO_ACCESO.AsInteger;
           InterForma1.NextTab(edCVE_GPO_ACCESO);
         end;
    end;
end;

procedure TWCrPerfilUs.edCVE_GPO_ACCESOExit(Sender: TObject);
var  VLSalida  :  boolean;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
      begin
         Objeto.CVE_GPO_ACCESO.GetFromControl;
         if Objeto.CVE_GPO_ACCESO.AsString = '' then
         Begin
//            ShowMessage('Favor de Indicar la Clave del Atributo');
            VlSalida   := False;
         end; //end if
         InterForma1.ValidaExit(edCVE_GPO_ACCESO,VLSalida,'',True);
      end;
end;

procedure TWCrPerfilUs.edDESC_TIPO_USUARExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edDESC_TIPO_USUAR,True,'',True);
end;

procedure TWCrPerfilUs.chB_BLOQUEADOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_BLOQUEADO,True,'',True);
end;

procedure TWCrPerfilUs.chB_AUT_REMANENTEExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_AUT_REMANENTE,True,'',True);
end;

procedure TWCrPerfilUs.chB_LIB_REMANENTEExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_LIB_REMANENTE,True,'',True);
end;

Procedure TWCrPerfilUs.MuestraHints;
Begin
      edNOM_GPO_ACCESO.Hint := Objeto.Perfil.NOM_GPO_ACCESO.AsString;
      edNOM_GPO_ACCESO.ShowHint := True;
      edDESC_TIPO_USUAR.Hint := Objeto.DESC_TIPO_USUAR.AsString;
      edDESC_TIPO_USUAR.ShowHint := True;
End;

procedure TWCrPerfilUs.InterForma1DespuesAceptar(Sender: TObject);
begin
    MuestraHints;
end;

procedure TWCrPerfilUs.cbB_VAL_HORA_SEGExit(Sender: TObject);
begin
   InterForma1.ValidaExit(cbB_VAL_HORA_SEG,True,'',True);
end;

procedure TWCrPerfilUs.cbB_AUT_CESIONExit(Sender: TObject);
begin
   InterForma1.ValidaExit(cbB_AUT_CESION,True,'',True);
end;

procedure TWCrPerfilUs.iedIMP_MAX_AUT_CESExit(Sender: TObject);
var     vlValida :     Boolean;
        vlMsg    :     String;
Begin
   vlMsg    := '';
   vlValida := True;
   Objeto.IMP_MAX_AUT_CES.GetFromControl;
   If Objeto.IMP_MAX_AUT_CES.AsFloat <> 0 then
   Begin
      if not(ValNumPositivo(vlMsg,Objeto.IMP_MAX_AUT_CES.AsInteger)) then
         VLValida := False;
      //end if
   end;
   InterForma1.ValidaExit(iedIMP_MAX_AUT_CES,VLValida,VLmsg,True);
end;

procedure TWCrPerfilUs.chB_CANCELA_CES_AUExit(Sender: TObject);
begin
   InterForma1.ValidaExit(chB_CANCELA_CES_AU,True,'',True);
end;

procedure TWCrPerfilUs.rgCVE_TIPO_USUARIOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgCVE_TIPO_USUARIO,True,'',True);
end;

procedure TWCrPerfilUs.cbB_VAL_IMP_CESExit(Sender: TObject);
begin
   InterForma1.ValidaExit(cbB_VAL_IMP_CES,True,'',True);
end;

end.
