// Sistema         : Clase de CR_BLQ_OPERACION
// Fecha de Inicio : 11/11/2008
// Función forma   : Clase de CR_BLQ_OPERACION
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrBlqOper;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,

IntParamCre,
IntGenCre;

Type
 TCrBlqOper= class; 

  TWCrBlqOperacion=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_BLQ_OPERACION: TLabel;
    lbDESC_BLQ_OPERACION: TLabel;
    edCVE_BLQ_OPERACION: TEdit;
    edDESC_BLQ_OPERACION: TEdit;
    rgSIT_BLQ_OPERACION: TRadioGroup;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    rgTIPO_AFECTACION: TRadioGroup;
    edCVE_BLQ_OPER_CANC: TEdit;
    lbCVE_BLQ_OPER_CANC: TLabel;
    Label1: TLabel;
    edCVE_DV_OPERACION: TEdit;
    edDESC_L_ID_PRIM: TEdit;
    edDESC_BLQ_OPERACION1: TEdit;
    btCVE_DV_OPERACION: TBitBtn;
    btCVE_BLQ_OPER_CANC: TBitBtn;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btCVE_BLQ_OPER_CANCClick(Sender: TObject);
    procedure btCVE_DV_OPERACIONClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrBlqOper;

    procedure CreaBuscador1(peStrNomBuscador : String;
                            peStrCamposBuscador : String;
                            penResultBusc1, penResultBusc2 : Integer;
                            peCVE_INTERCAMPO, peDESC_INTERCAMPO : TInterCampo
                           );

end;
 TCrBlqOper= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        CVE_BLQ_OPERACION        : TInterCampo;
        DESC_BLQ_OPERACION       : TInterCampo;
        TIPO_AFECTACION          : TInterCampo;
        SIT_BLQ_OPERACION        : TInterCampo;
        CVE_BLQ_OPER_CANC        : TInterCampo;
        CVE_DV_OPERACION         : TInterCampo;
        DESC_L_ID_PRIM           : TInterCampo;
        DESC_BLQ_OPERACION1      : TInterCampo;

        ParamCre    : TParamCre;

        procedure   Coloca_DESC_L_ID_PRIM;
        procedure   Coloca_DESC_BLQ_OPERACION1;

        function    InternalBusca : Boolean; override; 
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrBlqOper.Create( AOwner : TComponent );
begin Inherited;
      CVE_BLQ_OPERACION :=CreaCampo('CVE_BLQ_OPERACION',ftString,tsNinguno,tsNinguno,True);
                CVE_BLQ_OPERACION.Caption:='Clave de Blq Operacion';
      DESC_BLQ_OPERACION :=CreaCampo('DESC_BLQ_OPERACION',ftString,tsNinguno,tsNinguno,True);
                DESC_BLQ_OPERACION.Caption:='Descripción Blq Operacion';
      TIPO_AFECTACION :=CreaCampo('TIPO_AFECTACION',ftString,tsNinguno,tsNinguno,True);
      CVE_BLQ_OPER_CANC :=CreaCampo('CVE_BLQ_OPER_CANC',ftString,tsNinguno,tsNinguno,True);
      CVE_DV_OPERACION :=CreaCampo('CVE_DV_OPERACION',ftString,tsNinguno,tsNinguno,True);
      DESC_L_ID_PRIM :=CreaCampo('DESC_L_ID_PRIM',ftString,tsNinguno,tsNinguno,False);
      DESC_BLQ_OPERACION1 :=CreaCampo('DESC_BLQ_OPERACION1',ftString,tsNinguno,tsNinguno,False);      
      With TIPO_AFECTACION do
        Begin
        Size:=2;
        UseCombo:=True;
        Caption:='Tipo Afectación';
        ComboLista.Add('0'); ComboDatos.Add('I');
        ComboLista.Add('1'); ComboDatos.Add('D');
        ComboLista.Add('2'); ComboDatos.Add('N');
        End;

      SIT_BLQ_OPERACION :=CreaCampo('SIT_BLQ_OPERACION',ftString,tsNinguno,tsNinguno,True);
      With SIT_BLQ_OPERACION do
        Begin
        Size:=2;
        UseCombo:=True;
        Caption:='Situación Bloqueo de Operación';
        ComboLista.Add('0'); ComboDatos.Add(CSIT_AC);
        ComboLista.Add('1'); ComboDatos.Add(CSIT_CA);
        End;

      FKeyFields.Add('CVE_BLQ_OPERACION');

      TableName := 'CR_BLQ_OPERACION';
      UseQuery := True; 
      HelpFile := 'IntCrBlqOper.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrBlqOper.Destroy;
begin inherited;
end;


function TCrBlqOper.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrBlqOperacion;
begin
   W:=TWCrBlqOperacion.Create(Self);
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


Function TCrBlqOper.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrBlOp.it','S');
      Try if Active then begin T.Param(0,CVE_BLQ_OPERACION.AsString);
                               end;
          if T.Execute then
             Begin
             InternalBusca := FindKey([T.DameCampo(0)]);
             Coloca_DESC_L_ID_PRIM;
             Coloca_DESC_BLQ_OPERACION1;
             End;
      finally  T.Free;
      end;
end;

(***********************************************FORMA CR_BLQ_OPERACION********************)
(*                                                                              *)
(*  FORMA DE CR_BLQ_OPERACION                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_BLQ_OPERACION********************)

procedure TWCrBlqOperacion.FormShow(Sender: TObject);
begin
  With Objeto Do
    Begin
    lbDempresa.Caption := ParamCre.EMPRESA.AsString;
    lbDfecha.Caption   := ParamCre.FECHA.AsString;
    lbDUsuario.Caption := ParamCre.USUARIO.AsString;
    lbDPerfil.Caption  := ParamCre.PERFIL.AsString;
        
    CVE_BLQ_OPERACION.Control   := edCVE_BLQ_OPERACION;
    DESC_BLQ_OPERACION.Control  := edDESC_BLQ_OPERACION;
    TIPO_AFECTACION.Control     := rgTIPO_AFECTACION;
    SIT_BLQ_OPERACION.Control   := rgSIT_BLQ_OPERACION;
    CVE_BLQ_OPER_CANC.Control   := edCVE_BLQ_OPER_CANC;
    CVE_DV_OPERACION.Control    := edCVE_DV_OPERACION;
    DESC_L_ID_PRIM.Control      := edDESC_L_ID_PRIM;
    DESC_BLQ_OPERACION1.Control := edDESC_BLQ_OPERACION1;
    End;
end;

procedure TWCrBlqOperacion.FormDestroy(Sender: TObject);
begin
  With Objeto Do
    Begin
    CVE_BLQ_OPERACION.Control   := Nil;
    DESC_BLQ_OPERACION.Control  := Nil;
    TIPO_AFECTACION.Control     := Nil;
    SIT_BLQ_OPERACION.Control   := Nil;
    CVE_BLQ_OPER_CANC.Control   := Nil;
    CVE_DV_OPERACION.Control    := Nil;
    DESC_L_ID_PRIM.Control      := Nil;
    DESC_BLQ_OPERACION1.Control := Nil;
    End;
end;

procedure TWCrBlqOperacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrBlqOperacion.InterForma1DespuesNuevo(Sender: TObject);
begin If (edCVE_BLQ_OPERACION.CanFocus) Then edCVE_BLQ_OPERACION.SetFocus;
      Objeto.SIT_BLQ_OPERACION.AsString := 'AC'; 
end;

procedure TWCrBlqOperacion.InterForma1DespuesModificar(Sender: TObject);
begin If (edDESC_BLQ_OPERACION.CanFocus) Then edDESC_BLQ_OPERACION.SetFocus;
end;

procedure TWCrBlqOperacion.CreaBuscador1(peStrNomBuscador : String;
                                         peStrCamposBuscador : String;
                                         penResultBusc1, penResultBusc2 : Integer;
                                         peCVE_INTERCAMPO, peDESC_INTERCAMPO : TInterCampo
                                        );
Var vlInterFindit : TInterFindit;
begin
  VlInterFindit := Objeto.CreaBuscador(peStrNomBuscador, peStrCamposBuscador);
  Try
    If vlInterFindit.Execute Then
      Begin
      peCVE_INTERCAMPO.AsString  := vlInterFindit.DameCampo(penResultBusc1);
      peDESC_INTERCAMPO.AsString := vlInterFindit.DameCampo(penResultBusc2);
      End;
  Finally
      vlInterFindit.Free;
  End;
end;

procedure TWCrBlqOperacion.btCVE_BLQ_OPER_CANCClick(Sender: TObject);
begin
 With Objeto Do
   CreaBuscador1('ICrBlOp.it','S',0,1, CVE_BLQ_OPER_CANC, DESC_BLQ_OPERACION1);
end;

procedure TWCrBlqOperacion.btCVE_DV_OPERACIONClick(Sender: TObject);
begin
 With Objeto Do
   CreaBuscador1('CONSDVOPER.IT','S',0,1, CVE_DV_OPERACION, DESC_L_ID_PRIM);
end;

procedure TCrBlqOper.Coloca_DESC_L_ID_PRIM;
var vlStr : String;
begin
  GetSQLStr('SELECT D.DESC_L_ID_PRIM FROM DVC_OPERACION D WHERE D.CVE_OPERACION = '+SQLStr(CVE_DV_OPERACION.AsString),
            Apli.DatabaseName, Apli.SessionName, 'DESC_L_ID_PRIM', vlStr, False);
  DESC_L_ID_PRIM.AsString := vlStr;
end;

procedure TCrBlqOper.Coloca_DESC_BLQ_OPERACION1;
var vlStr : String;
begin
  GetSQLStr('SELECT C.DESC_BLQ_OPERACION FROM CR_BLQ_OPERACION C WHERE C.CVE_BLQ_OPERACION = '+SQLStr(CVE_BLQ_OPER_CANC.AsString),
            Apli.DatabaseName, Apli.SessionName, 'DESC_BLQ_OPERACION', vlStr, False);
  DESC_BLQ_OPERACION1.AsString := vlStr;
end;


end.
