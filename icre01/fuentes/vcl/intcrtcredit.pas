// Sistema         : Clase de CR_TIP_CRED_BC
// Fecha de Inicio : 18/02/2005
// Función forma   : Clase de CR_TIP_CRED_BC
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrTCredit;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntParamCre, InterEdit;

Type
 TCrTCredit= class;

  TWCrTCredito=Class(TForm)
    InterForma1             : TInterForma; 
    edDESC_TIPO_CRED : TEdit;
    lbTIPO_CUENTA : TLabel;
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
    Label1: TLabel;
    edTIPO_CUENTA: TInterEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure edDESC_TIPO_CREDExit(Sender: TObject);
    procedure edTIPO_CUENTAExit(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrTCredit;
end; 
 TCrTCredit= class(TInterFrame) 
      private 
      protected 
      public
        { Public declarations }
        CVE_TIPO_CRED_BC         : TInterCampo;
        DESC_TIPO_CRED           : TInterCampo;

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


constructor TCrTCredit.Create( AOwner : TComponent );
begin Inherited;
      CVE_TIPO_CRED_BC :=CreaCampo('CVE_TIPO_CRED_BC',ftFloat,tsNinguno,tsNinguno,True);
                CVE_TIPO_CRED_BC.Caption:='Tipo Cuenta';
      DESC_TIPO_CRED :=CreaCampo('DESC_TIPO_CRED',ftString,tsNinguno,tsNinguno,True);
                DESC_TIPO_CRED.Caption:='Descripción';
      FKeyFields.Add('CVE_TIPO_CRED_BC');

      TableName := 'CR_TIP_CRED_BC';
      UseQuery := True;
      HelpFile := 'IntCrTCredit.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrTCredit.Destroy;
begin inherited;
end;


function TCrTCredit.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrTCredito;
begin
   W:=TWCrTCredito.Create(Self);
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


Function TCrTCredit.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrTCred.it','S');
      Try if Active then begin T.Param(0,CVE_TIPO_CRED_BC.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA CR_TIP_CRED_BC********************)
(*                                                                              *)
(*  FORMA DE CR_TIP_CRED_BC                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_TIP_CRED_BC********************)

procedure TWCrTCredito.FormShow(Sender: TObject);
begin
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.CVE_TIPO_CRED_BC.Control:=edTIPO_CUENTA;
      Objeto.DESC_TIPO_CRED.Control:=edDESC_TIPO_CRED;

      InterForma1.MsgPanel := MsgPanel;
end;

procedure TWCrTCredito.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_TIPO_CRED_BC.Control:=nil;
      Objeto.DESC_TIPO_CRED.Control:=nil;
end;

procedure TWCrTCredito.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrTCredito.edDESC_TIPO_CREDExit(Sender: TObject);
begin
   { VALIDA EL ON EXIT }
   InterForma1.ValidaExit(edDESC_TIPO_CRED,True,'',True);
end;

procedure TWCrTCredito.edTIPO_CUENTAExit(Sender: TObject);
var  VLSalida  :  boolean;
     VLMesg     :  String;
Begin
   VLMesg     := '';
   vlSalida := True;
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      Objeto.CVE_TIPO_CRED_BC.GetFromControl;
      if Objeto.CVE_TIPO_CRED_BC.AsString = '' then
      Begin
         vlSalida := False;
         vlMesg := 'Favor de Introducir la clave de tipo de crédito';
      end;
      InterForma1.ValidaExit(edTIPO_CUENTA,VLSalida,VLMesg,True);
   end;
end;

procedure TWCrTCredito.InterForma1DespuesModificar(Sender: TObject);
begin
   edDESC_TIPO_CRED.SetFocus;
end;
end.
