// Sistema         : Clase de CR_CCI_TRANSAC
// Fecha de Inicio : 05/11/2009
// Función forma   : Clase de CR_CCI_TRANSAC
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrCciTran;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,

IntGenCre,
IntParamCre,
IntCrCciConc
;

Type
 TCrCciTran= class; 

  TWCrCciTransac=Class(TForm)
    InterForma1             : TInterForma;
    lbF_OPERACION : TLabel;
    dtpF_OPERACION : TInterDateTimePicker;
    edF_OPERACION : TEdit;
    lbCVE_CCI_CONCEPTO: TLabel;
    edCVE_CCI_CONCEPTO: TEdit;
    lbIMP_CONCEPTO : TLabel;
    edID_CREDITO: TEdit;
    lbID_CREDITO: TLabel;
    rgSIT_CCI_TRANSAC: TRadioGroup;
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
    btCVE_CCI_CONCEPTO: TBitBtn;
    edDESC_CCI_CONCEPT: TEdit;
    ilCVE_CCI_CONCEPTO: TInterLinkit;
    lbFH_ALTA: TLabel;
    lbCVE_USU_ALTA: TLabel;
    edFH_ALTA: TEdit;
    edCVE_USU_ALTA: TEdit;
    Label1: TLabel;
    memTX_MOTIVO: TMemo;
    edIMP_CONCEPTO: TInterEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btCVE_CCI_CONCEPTOClick(Sender: TObject);
    procedure ilCVE_CCI_CONCEPTOCapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_CCI_CONCEPTOEjecuta(Sender: TObject);
    procedure edF_OPERACIONExit(Sender: TObject);
    procedure edCVE_CCI_CONCEPTOExit(Sender: TObject);
    procedure edIMP_CONCEPTOExit(Sender: TObject);
    procedure memTX_MOTIVOExit(Sender: TObject);
    procedure rgSIT_CCI_TRANSACExit(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrCciTran;
end;
 TCrCciTran= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ID_CCI_TRANSAC           : TInterCampo;
        ID_CREDITO               : TInterCampo;
        F_OPERACION              : TInterCampo;
        CVE_CCI_CONCEPTO         : TInterCampo;
        IMP_CONCEPTO             : TInterCampo;
        TX_MOTIVO                : TInterCampo;
        SIT_CCI_TRANSAC          : TInterCampo;
        FH_ALTA                  : TInterCampo;
        FH_CANCELA               : TInterCampo;
        FH_MODIFICA              : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        CVE_USU_CANCELA          : TInterCampo;

        vgID_CREDITO  : Integer;
        vgIMP_CREDITO : Double;
        vgIMP_ADICIONAL : Double;
        vgSDO_ACTUAL_V : Double;

        ConceptoCarta : TCrCciConc;
        ParamCre : TParamCre;

        function    InternalBusca : Boolean; override;
        function    DevuelveImpMovtosAplicados : Double;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;

implementation
{$R *.DFM}


constructor TCrCciTran.Create( AOwner : TComponent );
begin Inherited;
      ID_CCI_TRANSAC := CreaCampo('ID_CCI_TRANSAC',ftInteger,tsNinguno,tsNinguno,True);
      ID_CREDITO :=CreaCampo('ID_CREDITO',ftInteger,tsNinguno,tsNinguno,True);
                ID_CREDITO.Caption:='Número de Credito';
      F_OPERACION :=CreaCampo('F_OPERACION',ftDate,tsNinguno,tsNinguno,True);
                F_OPERACION.Caption:='Fecha Operacion';
      CVE_CCI_CONCEPTO :=CreaCampo('CVE_CCI_CONCEPTO',ftString,tsNinguno,tsNinguno,True);
                CVE_CCI_CONCEPTO.Caption:='Clave de Concepto';
      IMP_CONCEPTO :=CreaCampo('IMP_CONCEPTO',ftFloat,tsNinguno,tsNinguno,True);
                IMP_CONCEPTO.Caption:='Imp Concepto';
      TX_MOTIVO :=CreaCampo('TX_MOTIVO',ftString,tsNinguno,tsNinguno,True);
                TX_MOTIVO.Caption:='Texto Motivo';
      SIT_CCI_TRANSAC :=CreaCampo('SIT_CCI_TRANSAC',ftString,tsNinguno,tsNinguno,True);
                SIT_CCI_TRANSAC.Caption:='Situación';

      FH_ALTA          :=CreaCampo('FH_ALTA',ftDateTime,tsNinguno,tsNinguno,True);
      FH_CANCELA       :=CreaCampo('FH_CANCELA',ftDateTime,tsNinguno,tsNinguno,True);
      FH_MODIFICA      :=CreaCampo('FH_MODIFICA',ftDateTime,tsNinguno,tsNinguno,True);
      CVE_USU_ALTA     :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_CANCELA  :=CreaCampo('CVE_USU_CANCELA',ftString,tsNinguno,tsNinguno,True);

      FKeyFields.Add('ID_CCI_TRANSAC');

      With SIT_CCI_TRANSAC do
      Begin Size:=2;
           UseCombo:=True;
           ComboLista.Add('0'); ComboDatos.Add(CSIT_AC);
           ComboLista.Add('1'); ComboDatos.Add(CSIT_CA);
      End;

      {$WARNINGS OFF}
      ConceptoCarta := TCrCciConc.Create(Self);
      {$WARNINGS ON}
      ConceptoCarta.MasterSource := self;

      TableName := 'CR_CCI_TRANSAC';
      UseQuery := True;
      HelpFile := 'IntCrCciTran.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrCciTran.Destroy;
begin inherited;
end;


function TCrCciTran.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCciTransac;
begin
   W:=TWCrCciTransac.Create(Self);
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


Function TCrCciTran.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrCcTr.it','F');
      Try if Active then begin T.Param(0,ID_CCI_TRANSAC.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;


(***********************************************FORMA CR_CCI_TRANSAC********************)
(*                                                                              *)
(*  FORMA DE CR_CCI_TRANSAC                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_CCI_TRANSAC********************)

procedure TWCrCciTransac.FormShow(Sender: TObject);
begin
  With Objeto Do
    Begin
    lbDempresa.Caption := ParamCre.EMPRESA.AsString;
    lbDfecha.Caption   := ParamCre.FECHA.AsString;
    lbDUsuario.Caption := ParamCre.USUARIO.AsString;
    lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

    ConceptoCarta.CVE_CCI_CONCEPTO.Control := edCVE_CCI_CONCEPTO;
    ConceptoCarta.DESC_CCI_CONCEPT.Control := edDESC_CCI_CONCEPT;

    FH_ALTA.Control:=edFH_ALTA;
    ID_CREDITO.Control:=edID_CREDITO;
    F_OPERACION.Control:=edF_OPERACION;
    CVE_CCI_CONCEPTO.Control:=edCVE_CCI_CONCEPTO;
    IMP_CONCEPTO.Control:=edIMP_CONCEPTO;
    TX_MOTIVO.Control:=memTX_MOTIVO;
    SIT_CCI_TRANSAC.Control:=rgSIT_CCI_TRANSAC;
    CVE_USU_ALTA.Control:=edCVE_USU_ALTA;

    Interforma1.MsgPanel := MsgPanel;
    End;
end;

procedure TWCrCciTransac.FormDestroy(Sender: TObject);
begin
  With Objeto Do
    Begin
    ConceptoCarta.CVE_CCI_CONCEPTO.Control := Nil;
    ConceptoCarta.DESC_CCI_CONCEPT.Control := Nil;

    FH_ALTA.Control:=Nil;
    ID_CREDITO.Control:=Nil;
    F_OPERACION.Control:=Nil;
    CVE_CCI_CONCEPTO.Control:=Nil;
    IMP_CONCEPTO.Control:=Nil;
    TX_MOTIVO.Control:=Nil;
    SIT_CCI_TRANSAC.Control:=Nil;
    CVE_USU_ALTA.Control:=Nil;
    End;
end;

procedure TWCrCciTransac.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrCciTransac.InterForma1DespuesNuevo(Sender: TObject);
begin If edF_OPERACION.CanFocus Then edF_OPERACION.SetFocus;
      Objeto.ID_CREDITO.AsInteger := Objeto.vgID_CREDITO;
      Objeto.SIT_CCI_TRANSAC.AsString := 'AC';
end;

procedure TWCrCciTransac.InterForma1DespuesModificar(Sender: TObject);
begin If edF_OPERACION.CanFocus Then edF_OPERACION.SetFocus;
      Objeto.ID_CREDITO.AsInteger := Objeto.vgID_CREDITO;
end;

procedure TWCrCciTransac.btCVE_CCI_CONCEPTOClick(Sender: TObject);
begin
  Objeto.ConceptoCarta.ShowAll := True;
  Objeto.ConceptoCarta.Busca;
end;

procedure TWCrCciTransac.ilCVE_CCI_CONCEPTOCapture(Sender: TObject;
  var Show: Boolean);
begin
 Show := True;
end;

procedure TWCrCciTransac.ilCVE_CCI_CONCEPTOEjecuta(Sender: TObject);
begin
 Objeto.ConceptoCarta.FindKey([ilCVE_CCI_CONCEPTO.Buffer])
end;

procedure TWCrCciTransac.edF_OPERACIONExit(Sender: TObject);
var  vlbSalida  :  Boolean;
     vlStrMesg   :  String;
Begin
  vlbSalida := True;
  vlStrMesg := '';
  With Objeto Do
    Begin
    F_OPERACION.GetFromControl;
    If (F_OPERACION.AsDateTime = 0) Then
       Begin
       vlbSalida := False;
       vlStrMesg := CFAVOR + lbF_OPERACION.Caption;
       End
    End;
  InterForma1.ValidaExit(edF_OPERACION, vlbSalida, vlStrMesg, True)
end;

procedure TWCrCciTransac.edCVE_CCI_CONCEPTOExit(Sender: TObject);
var  vlbSalida  :  Boolean;
     vlStrMesg   :  String;
     sText : String;
     bFind : Boolean;
Begin
  vlbSalida := True;
  vlStrMesg := '';
  With Objeto Do
  Begin
    sText := edCVE_CCI_CONCEPTO.Text;
    If (Trim(sText) = '') Then
    Begin
       vlbSalida := False;
       vlStrMesg := CFAVOR + lbCVE_CCI_CONCEPTO.Caption;
    End
    Else
    Begin
      Try
         CVE_CCI_CONCEPTO.GetFromControl;
         bfind := ConceptoCarta.FindKey([sText]);
         If not bFind Then
         Begin
            vlbSalida := False;
            vlStrMesg := 'El campo '+lbCVE_CCI_CONCEPTO.Caption+' no es válido. Favor de verificar';
         End;
      Except
        On EInterFrame Do
        Begin
          vlbSalida := False;
          vlStrMesg := 'El '+lbCVE_CCI_CONCEPTO.Caption+' no es válido. Favor de verificar';
        End;
      End;
    End;
  End;
  InterForma1.ValidaExit(edCVE_CCI_CONCEPTO, vlbSalida, vlStrMesg, True);
end;

procedure TWCrCciTransac.edIMP_CONCEPTOExit(Sender: TObject);
var  vlbSalida  :  Boolean;
     vlStrMesg   :  String;
Begin
  vlbSalida := True;
  vlStrMesg := '';
  With Objeto Do
    Begin
    IMP_CONCEPTO.GetFromControl;
    If (IMP_CONCEPTO.AsFloat = 0) Then
       Begin
       vlbSalida := False;
       vlStrMesg := CFAVOR + lbIMP_CONCEPTO.Caption;
       End;
    End;
  InterForma1.ValidaExit(edIMP_CONCEPTO, vlbSalida, vlStrMesg, True)
end;

procedure TWCrCciTransac.memTX_MOTIVOExit(Sender: TObject);
begin
  memTX_MOTIVO.Text := UpperCase(memTX_MOTIVO.Text);
  InterForma1.ValidaExit(memTX_MOTIVO, True, '', True);
end;

procedure TWCrCciTransac.rgSIT_CCI_TRANSACExit(Sender: TObject);
begin
  InterForma1.ValidaExit(rgSIT_CCI_TRANSAC, True, '', True);
end;

procedure TWCrCciTransac.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
var vlStrMsg : String;
    vlIMP_CONCEPTO : Double;
begin
  With Objeto Do
    Begin
       // Si la situación esta activa, entonces...
       SIT_CCI_TRANSAC.GetFromControl;       
       If (SIT_CCI_TRANSAC.AsString = 'AC') Then
          Begin
          // 
          If ConceptoCarta.CVE_AFEC_SALDO.AsString = 'D' Then
            vlIMP_CONCEPTO := IMP_CONCEPTO.AsFloat * -1
          Else If ConceptoCarta.CVE_AFEC_SALDO.AsString = 'I' Then
            vlIMP_CONCEPTO := IMP_CONCEPTO.AsFloat
          Else
            vlIMP_CONCEPTO := 0;

          If ConceptoCarta.CVE_AFEC_SALDO.AsString = 'D' Then
             Begin
              If ( (vgIMP_CREDITO + vgIMP_ADICIONAL + DevuelveImpMovtosAplicados + vlIMP_CONCEPTO) < 0) Then
                 Begin
                 vlStrMsg := 'El '+lbIMP_CONCEPTO.Caption+' por '+IMP_CONCEPTO.AsString+' rebasa el saldo de la carta de crédito que es de '+FloatToStr(vgSDO_ACTUAL_V)+
                             '; el cual no es posible de realizar.';
                 Realizado := False;
                 MessageDlg(vlStrMsg, mtWarning, [mbOk], 0);
                 Exit;
                 End;
             End;
          End;

      If Modo = moAppend Then
        Begin
        ID_CCI_TRANSAC.AsInteger := ObtenFolio('CRCCITRA', vlStrMsg, Apli);
        FH_ALTA.AsDateTime := Now;
        CVE_USU_ALTA.AsString := Objeto.DameUsuario;
        End
       Else If Modo = moEdit Then
        Begin
         If (SIT_CCI_TRANSAC.AsString = 'CA') Then
            Begin
            FH_CANCELA.AsDateTime := Now;
            CVE_USU_CANCELA.AsString := Objeto.DameUsuario;
            End
          Else
            Begin
            FH_MODIFICA.AsDateTime := Now;
            CVE_USU_MODIFICA.AsString := Objeto.DameUsuario;
            End;
        End;
    End;
end;

function TCrCciTran.DevuelveImpMovtosAplicados : Double;
var vlSQL : String;
    vlIMP_CONCEPTO : Real;
begin
  vlSQL := ' SELECT SUM(CCT.IMP_CONCEPTO *  DECODE(CCC.CVE_AFEC_SALDO, ''D'', -1, ''I'', 1, 0)) AS IMP_CONCEPTO'+coCRLF+
           ' FROM ADMIPROD.CR_CCI_TRANSAC CCT,'+coCRLF+
           '      ADMIPROD.CR_CCI_CONCEPTO CCC'+coCRLF+
           ' WHERE CCT.SIT_CCI_TRANSAC = ''AC'''+coCRLF+
           '   AND CCC.CVE_CCI_CONCEPTO = CCT.CVE_CCI_CONCEPTO'+coCRLF+
           '   AND CCT.ID_CREDITO = '+ID_CREDITO.AsString+coCRLF+
           '   AND CCT.ID_CCI_TRANSAC NOT IN ('+ID_CCI_TRANSAC.AsString+')';
  If Not GetSQLFloat(vlSQL, Apli.DatabaseName, Apli.SessionName, 'IMP_CONCEPTO', vlIMP_CONCEPTO, False) Then
     vlIMP_CONCEPTO := 0;
  Result := vlIMP_CONCEPTO;
end;

end.


