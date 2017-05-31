// Sistema         : Clase de CR_OPERACION
// Fecha de Inicio : 02/06/2003
// Función forma   : Clase de CR_OPERACION
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCrOperaci;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,

//Unidades Adicionales
IntParamCre;

Type
 TCrOperaci= class; 

  TWCrOperacion=Class(TForm)
    InterForma1             : TInterForma; 
    lbCVE_OPERACION : TLabel; 
    edCVE_OPERACION : TEdit;
    lbDESC_C_OPERACION : TLabel; 
    edDESC_C_OPERACION : TEdit;
    lbDESC_L_OPERACION : TLabel; 
    edDESC_L_OPERACION : TEdit;
    rgCVE_AFEC_SALDO : TRadioGroup; 
    chB_EDO_CTA : TCheckBox;
    cbCVE_ACCESORIO : TComboBox;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    Label1: TLabel;
    edCVE_OPER_CANCELA: TEdit;
    chB_GENERA_CONTA: TCheckBox;
    Label32: TLabel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edCVE_OPERACIONExit(Sender: TObject);
    procedure edDESC_C_OPERACIONExit(Sender: TObject);
    procedure edDESC_L_OPERACIONExit(Sender: TObject);
    procedure rgCVE_AFEC_SALDOExit(Sender: TObject);
    procedure cbCVE_ACCESORIOExit(Sender: TObject);
    procedure chB_EDO_CTAExit(Sender: TObject);
    Procedure MuestraHints;
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure edCVE_OPER_CANCELAExit(Sender: TObject);
    procedure chB_GENERA_CONTAExit(Sender: TObject);
    private 
    { Private declarations }
    public 
    { Public declarations } 
    Objeto : TCrOperaci;
end;
 TCrOperaci= class(TInterFrame)
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        CVE_OPERACION            : TInterCampo;
        DESC_C_OPERACION         : TInterCampo;
        DESC_L_OPERACION         : TInterCampo;
        CVE_AFEC_SALDO           : TInterCampo;
        B_EDO_CTA                : TInterCampo;
        CVE_ACCESORIO            : TInterCampo;
        B_GENERA_CONTA           : TInterCampo;
        CVE_OPER_CANCELA         : TInterCampo;

        ParamCre                 : TParamCre;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;

implementation

{$R *.DFM}


constructor TCrOperaci.Create( AOwner : TComponent );
begin Inherited;
      CVE_OPERACION :=CreaCampo('CVE_OPERACION',ftString,tsNinguno,tsNinguno,True);
                CVE_OPERACION.Caption:='Clave Operación';
      DESC_C_OPERACION :=CreaCampo('DESC_C_OPERACION',ftString,tsNinguno,tsNinguno,True);
                DESC_C_OPERACION.Caption:='Descripción Corta';
      DESC_L_OPERACION :=CreaCampo('DESC_L_OPERACION',ftString,tsNinguno,tsNinguno,True);
                DESC_L_OPERACION.Caption:='Descripción Larga';
      CVE_AFEC_SALDO :=CreaCampo('CVE_AFEC_SALDO',ftString,tsNinguno,tsNinguno,True);
          with CVE_AFEC_SALDO do
          begin Size:=1;
                UseCombo:=True;
                ComboLista.Add('0'); ComboDatos.Add('I');
                ComboLista.Add('1'); ComboDatos.Add('D');
                ComboLista.Add('2'); ComboDatos.Add('N');
          end;
                CVE_AFEC_SALDO.Caption:='Afecta Saldo';
      B_EDO_CTA :=CreaCampo('B_EDO_CTA',ftString,tsNinguno,tsNinguno,True);
                B_EDO_CTA.Caption:='Estado de Cuenta';
      CVE_ACCESORIO :=CreaCampo('CVE_ACCESORIO',ftString,tsNinguno,tsNinguno,True);
          with CVE_ACCESORIO do
          begin Size:=2;
                UseCombo:=True;
                ComboLista.Add('CAPITAL');          ComboDatos.Add('CP');
                ComboLista.Add('LINEA DE CREDITO'); ComboDatos.Add('LN');
                ComboLista.Add('CREDITO');          ComboDatos.Add('CR');
                ComboLista.Add('INTERES');          ComboDatos.Add('IN');
                ComboLista.Add('CONCEPTO (COMIS)'); ComboDatos.Add('CN');
                ComboLista.Add('DOCUMENTO');        ComboDatos.Add('DC');
                ComboLista.Add('CESION');           ComboDatos.Add('CS');
                //RABA JUN 2015
                ComboLista.Add('POSIBLE PREMIO');   ComboDatos.Add('PP');
          end;
                CVE_ACCESORIO.Caption:='Clave de Accesorio';
        B_GENERA_CONTA :=CreaCampo('B_GENERA_CONTA',ftString,tsNinguno,tsNinguno,True);
                B_GENERA_CONTA.Caption:='Genera Conta';
        CVE_OPER_CANCELA :=CreaCampo('CVE_OPER_CANCELA',ftString,tsNinguno,tsNinguno,True);
                CVE_OPER_CANCELA.Caption:='Clave Operación Cancela';

      FKeyFields.Add('CVE_OPERACION');

      TableName := 'CR_OPERACION';
      UseQuery := True;
      HelpFile := 'IntCrOperaci.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrOperaci.Destroy;
begin inherited;
end;


function TCrOperaci.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrOperacion;
begin
   W:=TWCrOperacion.Create(Self);
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

Function TCrOperaci.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrOpera.it','S');
      Try if Active then begin T.Param(0,CVE_OPERACION.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA CR_OPERACION********************)
(*                                                                              *)
(*  FORMA DE CR_OPERACION                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_OPERACION********************)

procedure TWCrOperacion.FormShow(Sender: TObject);
begin
      //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_OPERACION.Control:=edCVE_OPERACION;
      Objeto.DESC_C_OPERACION.Control:=edDESC_C_OPERACION;
      Objeto.DESC_L_OPERACION.Control:=edDESC_L_OPERACION;
      Objeto.CVE_AFEC_SALDO.Control:=rgCVE_AFEC_SALDO;
      Objeto.B_EDO_CTA.Control:=chB_EDO_CTA;
      Objeto.CVE_ACCESORIO.Control:=cbCVE_ACCESORIO;
      Objeto.B_GENERA_CONTA.Control:=chB_GENERA_CONTA;
      Objeto.CVE_OPER_CANCELA.Control:=edCVE_OPER_CANCELA;
end;

procedure TWCrOperacion.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_OPERACION.Control:=nil;
      Objeto.DESC_C_OPERACION.Control:=nil;
      Objeto.DESC_L_OPERACION.Control:=nil;
      Objeto.CVE_AFEC_SALDO.Control:=nil;
      Objeto.B_EDO_CTA.Control:=nil;
      Objeto.CVE_ACCESORIO.Control:=nil;
      Objeto.B_GENERA_CONTA.Control:=nil;
      Objeto.CVE_OPER_CANCELA.Control:=nil;
   //Objeto
end;

procedure TWCrOperacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrOperacion.InterForma1DespuesNuevo(Sender: TObject);
begin
   MuestraHints;
   rgCVE_AFEC_SALDO.ItemIndex := 2;
   edCVE_OPERACION.SetFocus;
end;

procedure TWCrOperacion.InterForma1DespuesModificar(Sender: TObject);
begin edDESC_C_OPERACION.SetFocus;
end;

procedure TWCrOperacion.edCVE_OPERACIONExit(Sender: TObject);
var  VLSalida  :  boolean;
Begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      Objeto.CVE_OPERACION.GetFromControl;
      if Objeto.CVE_OPERACION.AsString = '' then
         VlSalida   := False;
      //end if
      InterForma1.ValidaExit(edCVE_OPERACION,VLSalida,'',True);
   end;
end;

procedure TWCrOperacion.edDESC_C_OPERACIONExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edDESC_C_OPERACION,True,'',True);
end;

procedure TWCrOperacion.edDESC_L_OPERACIONExit(Sender: TObject);
begin
    InterForma1.ValidaExit(edDESC_L_OPERACION,True,'',True);
end;

procedure TWCrOperacion.rgCVE_AFEC_SALDOExit(Sender: TObject);
begin
    InterForma1.ValidaExit(rgCVE_AFEC_SALDO,True,'',True);
end;

procedure TWCrOperacion.cbCVE_ACCESORIOExit(Sender: TObject);
begin
    InterForma1.ValidaExit(cbCVE_ACCESORIO,True,'',True);
end;

procedure TWCrOperacion.chB_EDO_CTAExit(Sender: TObject);
begin
    InterForma1.ValidaExit(chB_EDO_CTA,True,'',True);
end;

Procedure TWCrOperacion.MuestraHints;
Begin
      edDESC_C_OPERACION.Hint := Objeto.DESC_C_OPERACION.AsString;
      edDESC_C_OPERACION.ShowHint := True;
      edDESC_L_OPERACION.Hint := Objeto.DESC_L_OPERACION.AsString;
      edDESC_L_OPERACION.ShowHint := True;
End;

procedure TWCrOperacion.InterForma1Buscar(Sender: TObject);
begin
 if Objeto.Busca then
    MuestraHints;
 //end if
end;

procedure TWCrOperacion.InterForma1DespuesAceptar(Sender: TObject);
begin
   MuestraHints;
end;

procedure TWCrOperacion.InterForma1AntesAceptar(Sender: TObject;
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

procedure TWCrOperacion.edCVE_OPER_CANCELAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edCVE_OPER_CANCELA,True,'',True);
end;

procedure TWCrOperacion.chB_GENERA_CONTAExit(Sender: TObject);
begin
    InterForma1.ValidaExit(chB_GENERA_CONTA,True,'',True);
end;

end.
