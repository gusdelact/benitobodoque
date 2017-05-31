// Sistema         : Clase de CR_GA_SEGURO
// Fecha de Inicio : 08/07/2004
// Función forma   : Clase de CR_GA_SEGURO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMSeguro;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,IntGenCre,
IntParamCre, InterEdit, IntCrAcredit, IntMTipoPol, IntInter,
IntSGCtrl, IntMon;

Type
 TMSeguro= class;

  TwMSeguro=Class(TForm)
    InterForma1             : TInterForma;
    PnlMsg: TPanel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    edNUM_POLIZA: TEdit;
    Label3: TLabel;
    edBIEN_ASEGURADO: TEdit;
    Label4: TLabel;
    edID_REFERENCIA: TEdit;
    Label1: TLabel;
    edTX_ENDOSO_PREF: TEdit;
    Label5: TLabel;
    edCVE_TIPO_POLIZA: TEdit;
    btCVE_TIPO_POLIZA: TBitBtn;
    edNOM_CVE_TIPO_POLIZA: TEdit;
    ilCVE_TIPO_POLIZA: TInterLinkit;
    Label7: TLabel;
    edID_ASEGURADORA: TEdit;
    btID_ASEGURADORA: TBitBtn;
    edNOM_ID_ASEGURADORA: TEdit;
    ilID_ASEGURADORA: TInterLinkit;
    edTX_TIPO_COBER: TMemo;
    Label8: TLabel;
    edF_VENCIMIENTO: TEdit;
    dtpF_VENCIMIENTO: TInterDateTimePicker;
    Label9: TLabel;
    edIMP_SUM_ASEG: TInterEdit;
    Label10: TLabel;
    edTX_COMENTARIO: TMemo;
    Label11: TLabel;
    edF_RENOVACION: TEdit;
    dtpF_RENOVACION: TInterDateTimePicker;
    Label12: TLabel;
    edCVE_FORM_PAGO: TEdit;
    Label13: TLabel;
    edF_ULT_PAGO: TEdit;
    dtpF_ULT_PAGO: TInterDateTimePicker;
    Label14: TLabel;
    GroupBox4: TGroupBox;
    lbF_ALTA: TLabel;
    lbF_MODIF: TLabel;
    lbUSUA_ALTA: TLabel;
    lbUSUA_MODIF: TLabel;
    edF_ALTA: TEdit;
    edF_MODIFICA: TEdit;
    edCVE_USU_ALTA: TEdit;
    edCVE_USU_MODIF: TEdit;
    rgSIT_SEGURO: TRadioGroup;
    edID_FOL_SEGURO: TInterEdit;
    Label15: TLabel;
    Label2: TLabel;
    shp4: TShape;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape5: TShape;
    Label6: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Shape6: TShape;
    Label20: TLabel;
    Shape10: TShape;
    Label21: TLabel;
    sgcDATA: TSGCtrl;
    edNOM_MONEDA: TEdit;
    btCVE_MONEDA: TBitBtn;
    edCVE_MONEDA: TEdit;
    Label22: TLabel;
    ilCVE_MONEDA: TInterLinkit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure edNUM_POLIZAExit(Sender: TObject);
    procedure edBIEN_ASEGURADOExit(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure ilCVE_TIPO_POLIZACapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_TIPO_POLIZAEjecuta(Sender: TObject);
    procedure ilID_ASEGURADORACapture(Sender: TObject; var Show: Boolean);
    procedure ilID_ASEGURADORAEjecuta(Sender: TObject);
    procedure btCVE_TIPO_POLIZAClick(Sender: TObject);
    procedure btID_ASEGURADORAClick(Sender: TObject);
    procedure edCVE_TIPO_POLIZAExit(Sender: TObject);
    procedure edID_ASEGURADORAExit(Sender: TObject);
    procedure edTX_ENDOSO_PREFExit(Sender: TObject);
    procedure edIMP_SUM_ASEGExit(Sender: TObject);
    procedure edTX_TIPO_COBERExit(Sender: TObject);
    procedure edF_VENCIMIENTOExit(Sender: TObject);
    procedure edF_RENOVACIONExit(Sender: TObject);
    procedure edCVE_FORM_PAGOExit(Sender: TObject);
    procedure edF_ULT_PAGOExit(Sender: TObject);
    procedure edTX_COMENTARIOExit(Sender: TObject);
    procedure rgSIT_SEGUROExit(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    procedure sgcDATADblClick(Sender: TObject);
    procedure edCVE_MONEDAExit(Sender: TObject);
    procedure btCVE_MONEDAClick(Sender: TObject);
    procedure ilCVE_MONEDACapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_MONEDAEjecuta(Sender: TObject);

    private
       Function  CadenaSql : String;
       Procedure MuestraDatos;
       Function  ObtFolio: Integer;
    { Private declarations }
    public
    { Public declarations }
      Objeto : TMSeguro;
    end;

 TMSeguro= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        ID_FOL_SEGURO       : TInterCampo;
        CVE_TIPO_SEG_ORIG   : TInterCampo;
        ID_REFERENCIA       : TInterCampo;
        TX_ENDOSO_PREF      : TInterCampo;
        BIEN_ASEGURADO      : TInterCampo;
        CVE_TIPO_POL        : TInterCampo;
        ID_ASEGURADORA      : TInterCampo;
        NUM_POLIZA          : TInterCampo;
        TX_TIPO_COBER       : TInterCampo;
        F_VENCIMIENTO       : TInterCampo;
        IMP_SUM_ASEG        : TInterCampo;
        TX_COMENTARIO       : TInterCampo;
        F_RENOVACION        : TInterCampo;
        CVE_FORM_PAGO       : TInterCampo;
        F_ULT_PAGO          : TInterCampo;
        SIT_SEGURO          : TInterCampo;
        F_ALTA              : TInterCampo;
        CVE_USU_ALTA        : TInterCampo;
        F_MODIFICA          : TInterCampo;
        CVE_USU_MODIFICA    : TInterCampo;
        CVE_MONEDA          : TInterCampo;

        ParamCre            : TParamCre;
        MTipoPol            : TMTipoPol;
        Intermediario       : TIntermed;
        Moneda              : TMoneda;

        sCveTipoSeg  : String;
        iIdReferencia : Integer;
        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

implementation
{$R *.DFM}

constructor TMSeguro.Create( AOwner : TComponent );
begin Inherited;
   ID_FOL_SEGURO :=CreaCampo('ID_FOL_SEGURO',ftFloat,tsNinguno,tsNinguno,True);
      ID_FOL_SEGURO.Caption:='Identificador FOLIO';
   CVE_TIPO_SEG_ORIG :=CreaCampo('CVE_TIPO_SEG_ORIG',ftString,tsNinguno,tsNinguno,True);
      CVE_TIPO_SEG_ORIG.Caption:='Tipo de seguro';
   ID_REFERENCIA :=CreaCampo('ID_REFERENCIA',ftFloat,tsNinguno,tsNinguno,True);
      ID_REFERENCIA.Caption:='Identificador de acreditado';

   TX_ENDOSO_PREF :=CreaCampo('TX_ENDOSO_PREF',ftString,tsNinguno,tsNinguno,True);
      TX_ENDOSO_PREF.Caption:='Endoso preferente';
      TX_ENDOSO_PREF.NoCompare:= True;
   BIEN_ASEGURADO :=CreaCampo('BIEN_ASEGURADO',ftString,tsNinguno,tsNinguno,True);
      BIEN_ASEGURADO.Caption:='Bien asegurado';
      BIEN_ASEGURADO.NoCompare:= True;
   CVE_TIPO_POL :=CreaCampo('CVE_TIPO_POL',ftString,tsNinguno,tsNinguno,True);
      CVE_TIPO_POL.Caption:='Tipo de Póliza';
      CVE_TIPO_POL.NoCompare:= True;
   ID_ASEGURADORA :=CreaCampo('ID_ASEGURADORA',ftFloat,tsNinguno,tsNinguno,True);
      ID_ASEGURADORA.Caption:='Identificador de aseguradora';
      ID_ASEGURADORA.NoCompare:= True;
   NUM_POLIZA :=CreaCampo('NUM_POLIZA',ftString,tsNinguno,tsNinguno,True);
      NUM_POLIZA.Caption:='Número de póliza';
      NUM_POLIZA.NoCompare:= True;
   TX_TIPO_COBER :=CreaCampo('TX_TIPO_COBER',ftString,tsNinguno,tsNinguno,True);
      TX_TIPO_COBER.Caption:='Tipo de cobertura';
      TX_TIPO_COBER.NoCompare:= True;
   F_VENCIMIENTO :=CreaCampo('F_VENCIMIENTO',ftDate,tsNinguno,tsNinguno,True);
      F_VENCIMIENTO.Caption:='Fecha de vencimiento';
      F_VENCIMIENTO.NoCompare:= True;
   IMP_SUM_ASEG :=CreaCampo('IMP_SUM_ASEG',ftFloat,tsNinguno,tsNinguno,True);
      IMP_SUM_ASEG.Caption:='Suma asegurada';
      IMP_SUM_ASEG.NoCompare:= True;
   TX_COMENTARIO :=CreaCampo('TX_COMENTARIO',ftString,tsNinguno,tsNinguno,True);
      TX_COMENTARIO.Caption:='Comentario';
      TX_COMENTARIO.NoCompare:= True;
   F_RENOVACION :=CreaCampo('F_RENOVACION',ftDate,tsNinguno,tsNinguno,True);
      F_RENOVACION.Caption:='Fecha de renovación';
      F_RENOVACION.NoCompare:= True;
   CVE_FORM_PAGO :=CreaCampo('CVE_FORM_PAGO',ftString,tsNinguno,tsNinguno,True);
      CVE_FORM_PAGO.Caption:='Forma de pago';
      CVE_FORM_PAGO.NoCompare:= True;
   F_ULT_PAGO :=CreaCampo('F_ULT_PAGO',ftDate,tsNinguno,tsNinguno,True);
      F_ULT_PAGO.Caption:='Fecha de último pago';
      F_ULT_PAGO.NoCompare:= True;
   SIT_SEGURO :=CreaCampo('SIT_SEGURO',ftString,tsNinguno,tsNinguno,True);
   With SIT_SEGURO Do Begin
      Size:=2;
      UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add('AC');
      ComboLista.Add('1'); ComboDatos.Add('IN');
   End;
      SIT_SEGURO.Caption:='Situación de seguro';
      SIT_SEGURO.NoCompare:= True;
   F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
      F_ALTA.Caption:='Fecha de alta';
      F_ALTA.NoCompare:= True;
   CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_ALTA.Caption:='Usuario de alta';
      CVE_USU_ALTA.NoCompare:= True;
   F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
      F_MODIFICA.Caption:='Fechad e modificación';
      F_MODIFICA.NoCompare:= True;
   CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_MODIFICA.Caption:='Usuario de modificación';
      CVE_USU_MODIFICA.NoCompare:= True;
   CVE_MONEDA :=CreaCampo('CVE_MONEDA',ftFloat,tsNinguno,tsNinguno,True);
      CVE_MONEDA.Caption:='Clave de moneda';
      CVE_MONEDA.NoCompare:= True;


   FKeyFields.Add('ID_FOL_SEGURO');
   FKeyFields.Add('CVE_TIPO_SEG_ORIG');
   FKeyFields.Add('ID_REFERENCIA');

   TableName := 'CR_GA_SEGURO';
   UseQuery := True;
   HelpFile := 'IntMSeguro.Hlp';
   ShowMenuReporte:=True;

   MTipoPol := TMTipoPol.Create(Self);
   MTipoPol.MasterSource:=Self;
   MTipoPol.FieldByName('CVE_TIPO_POL').MasterField:='CVE_TIPO_POL';

   {$WARNINGS OFF}
   Intermediario:= TIntermed.Create(Self);
   {$WARNINGS ON}
   Intermediario.MasterSource := Self;
   Intermediario.Id_Intermediario.MasterField := 'ID_ASEGURADORA';
   Intermediario.FilterBy := fbTAseguradora;
   Intermediario.BuscaWhereString:= 'Sit_Intermed = ''AC''';

   Moneda := TMoneda.Create(Self);
   Moneda.MasterSource:=Self;
   Moneda.FieldByName('CVE_MONEDA').MasterField:='CVE_MONEDA';
end;


Destructor TMSeguro.Destroy;
begin
   If MTipoPol <> Nil Then
      MTipoPol.Free;
   If Intermediario <> Nil Then
     Intermediario.Free;
   If Moneda <> Nil Then
      Moneda.Free;
   Inherited;
end;

function TMSeguro.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMSeguro;
begin
   W:=TWMSeguro.Create(Self);
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

Function TMSeguro.InternalBusca:Boolean;
Var T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IMSeguro.it','I,S,I');
   Try
      if Active then begin
         T.Param(0,ID_FOL_SEGURO.AsString);
         T.Param(1,CVE_TIPO_SEG_ORIG.AsString);
         T.Param(2,ID_REFERENCIA.AsString);
      end;
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2)]);
   finally
      T.Free;
   end;
end;

function TMSeguro.Reporte:Boolean;
begin
   Result := False;
end;


(***********************************************FORMA CR_GA_SEGURO********************)
(*                                                                              *)
(*  FORMA DE CR_GA_SEGURO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_GA_SEGURO********************)

procedure TwMSeguro.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   With Objeto Do Begin
      ID_FOL_SEGURO.Control    := edID_FOL_SEGURO;
      ID_REFERENCIA.Control    := edID_REFERENCIA;
      TX_ENDOSO_PREF.Control   := edTX_ENDOSO_PREF;
      BIEN_ASEGURADO.Control   := edBIEN_ASEGURADO;
      CVE_TIPO_POL.Control     := edCVE_TIPO_POLIZA;
      ID_ASEGURADORA.Control   := edID_ASEGURADORA;
      NUM_POLIZA.Control       := edNUM_POLIZA;
      TX_TIPO_COBER.Control    := edTX_TIPO_COBER;
      F_VENCIMIENTO.Control    := edF_VENCIMIENTO;
      IMP_SUM_ASEG.Control     := edIMP_SUM_ASEG;
      TX_COMENTARIO.Control    := edTX_COMENTARIO;
      F_RENOVACION.Control     := edF_RENOVACION;
      CVE_FORM_PAGO.Control    := edCVE_FORM_PAGO;
      F_ULT_PAGO.Control       := edF_ULT_PAGO;
      SIT_SEGURO.Control       := rgSIT_SEGURO;
      F_ALTA.Control           := edF_ALTA;
      CVE_USU_ALTA.Control     := edCVE_USU_ALTA;
      F_MODIFICA.Control       := edF_MODIFICA;
      CVE_USU_MODIFICA.Control := edCVE_USU_MODIF;
      CVE_MONEDA.Control       := edCVE_MONEDA;
      InterForma1.MsgPanel     := PnlMsg;

      MTipoPol.CVE_TIPO_POL.Control := edCVE_TIPO_POLIZA;
      MTipoPol.DESC_TIPO_POL.Control := edNOM_CVE_TIPO_POLIZA;
      MTipoPol.GetParams(Objeto);

      Intermediario.Id_Intermediario.Control := edID_ASEGURADORA;
      Intermediario.Persona.Nombre.Control := edNOM_ID_ASEGURADORA;
      Intermediario.GetParams(Objeto);

      Moneda.Cve_Moneda.Control := edCVE_MONEDA;
      Moneda.Desc_Moneda.Control := edNOM_MONEDA;
      Moneda.GetParams(Objeto);
   End;

   If Objeto.sCveTipoSeg <> '' Then Begin
      Objeto.BuscaWhereString := '( CR_GA_SEGURO.CVE_TIPO_SEG_ORIG = '+ #39 + Trim(Objeto.sCveTipoSeg) + #39 + ')';
      If Objeto.iIdReferencia <> 0 Then Begin
         Objeto.BuscaWhereString := Objeto.BuscaWhereString + ' AND ( CR_GA_SEGURO.ID_REFERENCIA = ' + IntToStr(Objeto.iIdReferencia) + ')';
      End;
   End;
   Objeto.FilterString := Objeto.BuscaWhereString;
end;

procedure TwMSeguro.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      ID_FOL_SEGURO.Control    := Nil;
      ID_REFERENCIA.Control    := Nil;
      TX_ENDOSO_PREF.Control   := Nil;
      BIEN_ASEGURADO.Control   := Nil;
      CVE_TIPO_POL.Control     := Nil;
      ID_ASEGURADORA.Control   := Nil;
      NUM_POLIZA.Control       := Nil;
      TX_TIPO_COBER.Control    := Nil;
      F_VENCIMIENTO.Control    := Nil;
      IMP_SUM_ASEG.Control     := Nil;
      TX_COMENTARIO.Control    := Nil;
      F_RENOVACION.Control     := Nil;
      CVE_FORM_PAGO.Control    := Nil;
      F_ULT_PAGO.Control       := Nil;
      SIT_SEGURO.Control       := Nil;
      F_ALTA.Control           := Nil;
      CVE_USU_ALTA.Control     := Nil;
      F_MODIFICA.Control       := Nil;
      CVE_USU_MODIFICA.Control := Nil;
      CVE_MONEDA.Control       := Nil;      
      InterForma1.MsgPanel     := Nil;

      MTipoPol.CVE_TIPO_POL.Control := Nil;
      MTipoPol.DESC_TIPO_POL.Control := Nil;

      Intermediario.Id_Intermediario.Control := Nil;
      Intermediario.Persona.Nombre.Control := Nil;

      Moneda.Cve_Moneda.Control := Nil;
      Moneda.Desc_Moneda.Control := Nil;
   End;
end;

procedure TwMSeguro.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMSeguro.InterForma1Buscar(Sender: TObject);
begin
   With Objeto Do Begin
      InternalBusca;
   End;
end;

procedure TwMSeguro.edNUM_POLIZAExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.NUM_POLIZA.GetFromControl;
      If Objeto.NUM_POLIZA.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar el número de póliza';
      End;
      InterForma1.ValidaExit(edNUM_POLIZA,vlSalida,vlMsg,True);
   End;
end;

procedure TwMSeguro.edBIEN_ASEGURADOExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.BIEN_ASEGURADO.GetFromControl;
      If Objeto.BIEN_ASEGURADO.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar la descripción del bien a asegurar';
      End;
      InterForma1.ValidaExit(edBIEN_ASEGURADO,vlSalida,vlMsg,True);
   End;
end;

procedure TwMSeguro.InterForma1DespuesNuevo(Sender: TObject);
begin
   dtpF_VENCIMIENTO.DateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
   dtpF_VENCIMIENTO.MinDate:= Objeto.Apli.DameFechaEmpresaDia('D000');
   edF_VENCIMIENTO.Text:= FormatDateTime('dd/mm/yyyy',Objeto.Apli.DameFechaEmpresaDia('D000'));

   dtpF_ULT_PAGO.DateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
   dtpF_ULT_PAGO.MinDate:= Objeto.Apli.DameFechaEmpresaDia('D000');
   edF_ULT_PAGO.Text:= FormatDateTime('dd/mm/yyyy',Objeto.Apli.DameFechaEmpresaDia('D000'));

   dtpF_RENOVACION.DateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
   dtpF_RENOVACION.MinDate:= Objeto.Apli.DameFechaEmpresaDia('D000');

   rgSIT_SEGURO.ItemIndex:= 0;
   edCVE_TIPO_POLIZA.SetFocus;

   If Trim(Objeto.sCveTipoSeg)<> '' Then
      Objeto.CVE_TIPO_SEG_ORIG.AsString:= Trim(Objeto.sCveTipoSeg);
   If Objeto.iIdReferencia<>0 Then
      Objeto.ID_REFERENCIA.AsInteger:= Objeto.iIdReferencia;
End;

procedure TwMSeguro.InterForma1DespuesModificar(Sender: TObject);
begin
   dtpF_RENOVACION.DateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
   edF_RENOVACION.Text:= FormatDateTime('dd/mm/yyyy',Objeto.Apli.DameFechaEmpresaDia('D000'));
   edCVE_TIPO_POLIZA.SetFocus;
end;

procedure TwMSeguro.ilCVE_TIPO_POLIZACapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit)or(InterForma1.IsNewData);
end;

procedure TwMSeguro.ilCVE_TIPO_POLIZAEjecuta(Sender: TObject);
begin
   If Objeto.MTipoPol.FindKey([ilCVE_TIPO_POLIZA.Buffer]) Then Begin
      InterForma1.NextTab(edCVE_TIPO_POLIZA);
   End;
end;

procedure TwMSeguro.ilID_ASEGURADORACapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit)or(InterForma1.IsNewData);
end;

procedure TwMSeguro.ilID_ASEGURADORAEjecuta(Sender: TObject);
begin
   If Objeto.Intermediario.FindKey([ilID_ASEGURADORA.Buffer]) Then Begin
      InterForma1.NextTab(edID_ASEGURADORA);
   End;
end;

procedure TwMSeguro.btCVE_TIPO_POLIZAClick(Sender: TObject);
begin
   Objeto.MTipoPol.ShowAll := True;
   If Objeto.MTipoPol.Busca Then Begin
      InterForma1.NextTab(edCVE_TIPO_POLIZA);
   End;
end;

procedure TwMSeguro.btID_ASEGURADORAClick(Sender: TObject);
begin

   Objeto.Intermediario.BuscaWhereString:= ' INTERMEDIARIO.CVE_TIPO_INTERM = ''AS'''
                                    + ' AND INTERMEDIARIO.SIT_INTERMED ='
                                    + #39 + CSIT_AC + #39 ;
   Objeto.Intermediario.FilterString := Objeto.Intermediario.BuscaWhereString;

   Objeto.Intermediario.ShowAll := True;
   If Objeto.Intermediario.Busca Then Begin
      InterForma1.NextTab(edID_ASEGURADORA);
   End;
end;

procedure TwMSeguro.edCVE_TIPO_POLIZAExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.CVE_TIPO_POL.GetFromControl;
      If Objeto.CVE_TIPO_POL.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe seleccionar un tipo de póliza';
      End;
      InterForma1.ValidaExit(edCVE_TIPO_POLIZA,vlSalida,vlMsg,True);
   End;
end;

procedure TwMSeguro.edID_ASEGURADORAExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.ID_ASEGURADORA.GetFromControl;
      If Objeto.ID_ASEGURADORA.AsFloat = 0 Then Begin
         vlSalida   := False;
         vlMsg := 'Debe seleccionar una aseguradora';
      End;
      InterForma1.ValidaExit(edID_ASEGURADORA,vlSalida,vlMsg,True);
   End;
end;

procedure TwMSeguro.edTX_ENDOSO_PREFExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.TX_ENDOSO_PREF.GetFromControl;
      If Objeto.TX_ENDOSO_PREF.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Indique endoso preferente a:';
      End;
      InterForma1.ValidaExit(edTX_ENDOSO_PREF,vlSalida,vlMsg,True);
   End;
end;

procedure TwMSeguro.edIMP_SUM_ASEGExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.IMP_SUM_ASEG.GetFromControl;
      If Objeto.IMP_SUM_ASEG.AsFloat = 0 Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar la suma asegurada';
      End;
      InterForma1.ValidaExit(edIMP_SUM_ASEG,vlSalida,vlMsg,True);
   End;
end;

procedure TwMSeguro.edTX_TIPO_COBERExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.TX_TIPO_COBER.GetFromControl;
      If Objeto.TX_TIPO_COBER.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe el tipo de cobertura del seguro';
      End;
      InterForma1.ValidaExit(edTX_TIPO_COBER,vlSalida,vlMsg,True);
   End;
end;

procedure TwMSeguro.edF_VENCIMIENTOExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.F_VENCIMIENTO.GetFromControl;
      If  Objeto.F_VENCIMIENTO.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Indique la fecha de vencimiento del seguro';
      End Else Begin
         If Objeto.F_VENCIMIENTO.AsDateTime <= Objeto.Apli.DameFechaEmpresaDia('D000')Then Begin
            vlSalida   := False;
            vlMsg := 'La fecha de vencimiento del seguro debe ser mayor al día de hoy';
         End;
      End;
      InterForma1.ValidaExit(edF_VENCIMIENTO,vlSalida,vlMsg,True);
   End;
end;

procedure TwMSeguro.edF_RENOVACIONExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If (Objeto.Modo = moEdit) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.F_RENOVACION.GetFromControl;
      If  Objeto.F_RENOVACION.AsFloat = Objeto.F_VENCIMIENTO.AsFloat  Then Begin
         vlSalida   := False;
         vlMsg := 'La fecha de vencimiento debe ser diferente de la fecha de renovación';
      End Else Begin
         If Objeto.F_RENOVACION.AsDateTime <= Objeto.Apli.DameFechaEmpresaDia('D000')Then Begin
            vlSalida   := False;
            vlMsg := 'La fecha de renovación debe ser mayor al día de hoy';
         End;
      End;
      InterForma1.ValidaExit(edF_RENOVACION,vlSalida,vlMsg,True);
   End Else Begin
      InterForma1.ValidaExit(edF_RENOVACION,True,CNULL,True);
   End;
end;

procedure TwMSeguro.edCVE_FORM_PAGOExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.CVE_FORM_PAGO.GetFromControl;
      If  Objeto.CVE_FORM_PAGO.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Indique la forma de pago del seguro';
      End;
      InterForma1.ValidaExit(edCVE_FORM_PAGO,vlSalida,vlMsg,True);
   End;
end;

procedure TwMSeguro.edF_ULT_PAGOExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.F_ULT_PAGO.GetFromControl;
      If  Objeto.F_ULT_PAGO.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Indique la fecha de último pago del seguro';
      End;
      InterForma1.ValidaExit(edF_ULT_PAGO,vlSalida,vlMsg,True);
   End;
end;

procedure TwMSeguro.edTX_COMENTARIOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edTX_COMENTARIO,True,CNULL,True);
end;

procedure TwMSeguro.rgSIT_SEGUROExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_SEGURO,True,CNULL,True);
end;

procedure TwMSeguro.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   With Objeto Do Begin
      if IsNewData then Begin
         if MessageDlg('¿Desea almacenar los datos capturados?',
            mtConfirmation,[mbYes, mbNo], 0) = mrYes then Begin
            CVE_USU_ALTA.AsString := DameUsuario;
            F_ALTA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
            ID_FOL_SEGURO.AsInteger := ObtFolio;
            Realizado := True;
         end else
            Realizado := False;
      end else Begin
         if MessageDlg('¿Desea guardar los datos modificados?',
              mtConfirmation,[mbYes, mbNo], 0) = mrYes then Begin
            CVE_USU_MODIFICA.AsString := DameUsuario;
            F_MODIFICA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
            Realizado := True;
         end else
            Realizado := False;
      end
   End;
end;

Function TwMSeguro.CadenaSql : String;
Var
   vlsql : String;
Begin
   vlSql:='';
   vlsql := 'SELECT '+
            '       ID_FOL_SEGURO, '+
            '       CVE_TIPO_SEG_ORIG, '+
            '       ID_REFERENCIA, '+
            '       CR_GA_SEGURO.CVE_TIPO_POL, '+
            '       CR_GA_TIPO_POL.DESC_TIPO_POL, '+
            '       NUM_POLIZA, '+
            '       IMP_SUM_ASEG, '+
            '       DECODE(SIT_SEGURO,''AC'',''Activo'',''IN'',''Inactivo'','' '')SIT_SEGURO '+
            '  FROM CR_GA_SEGURO, CR_GA_TIPO_POL '+
            ' WHERE CR_GA_SEGURO.CVE_TIPO_SEG_ORIG ='''+ Objeto.sCveTipoSeg +''''+
            '   AND CR_GA_SEGURO.ID_REFERENCIA ='+ IntToStr(Objeto.iIdReferencia) +
            '   AND CR_GA_SEGURO.CVE_TIPO_POL = CR_GA_TIPO_POL.CVE_TIPO_POL '+
            ' ORDER BY ID_FOL_SEGURO';

   CadenaSql := vlSql;
End;

Procedure TwMSeguro.MuestraDatos;
Var
   vlQry : TQuery;
   sSQL :String;
   i:Integer;
Begin
 If (Objeto.sCveTipoSeg <> '')And(Objeto.iIdReferencia <> 0) Then Begin
   sSQL:= CadenaSql;
   If Trim(sSQL) <> '' Then Begin
      vlQry := GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
      Try
         if vlQry <> nil Then Begin

            vlQry.FieldByName('ID_FOL_SEGURO').DisplayLabel  := 'ID_FOL_SEGURO' + #30 +'>C';
            vlQry.FieldByName('CVE_TIPO_SEG_ORIG').Visible  := False;
            vlQry.FieldByName('ID_REFERENCIA').DisplayLabel  := 'ID_REFERENCIA' + #30 +'>C';
            vlQry.FieldByName('CVE_TIPO_POL').DisplayLabel  := 'CVE_TIPO_POL' + #30 +'>C';
            vlQry.FieldByName('DESC_TIPO_POL').DisplayLabel:= 'DESC_TIPO_POL' + #30 +'>C';
            vlQry.FieldByName('NUM_POLIZA').DisplayLabel  := 'NUM_POLIZA' + #30 +'>C';
            vlQry.FieldByName('IMP_SUM_ASEG').DisplayLabel  := 'IMP_SUM_ASEG' + #30 +'>C';
            vlQry.FieldByName('SIT_SEGURO').DisplayLabel  := 'SIT_SEGURO' + #30 +'>C';

            vlQry.FieldByName('ID_FOL_SEGURO').DisplayWidth  := 11;
            vlQry.FieldByName('ID_REFERENCIA').DisplayWidth  := 11;
            vlQry.FieldByName('CVE_TIPO_POL').DisplayWidth:= 11;
            vlQry.FieldByName('DESC_TIPO_POL').DisplayWidth:= 25;
            vlQry.FieldByName('NUM_POLIZA').DisplayWidth  := 11;
            vlQry.FieldByName('IMP_SUM_ASEG').DisplayWidth := 11;
            vlQry.FieldByName('SIT_SEGURO').DisplayWidth :=7;

            TNumericField(vlQry.FieldByName('IMP_SUM_ASEG')).DisplayFormat := '###,###,###,###,###,###,##0.00';
            sgcDATA.AddQry( vlQry, True,True,-1,-1,-1,False);
         End Else Begin
           sgcDATA.Clear('NO SE ENCONTRARON DATOS'#30'>C');
         End;
      finally
         if vlQry <> nil Then
            vlQry.free;
      End;
   End;
 End;
End;

procedure TwMSeguro.InterForma1DespuesShow(Sender: TObject);
begin
   MuestraDatos;
end;

Function  TwMSeguro.ObtFolio: Integer;
Var
   sSQL: String; iFolio: Integer;
   qyQuery : TQuery;
Begin
   iFolio:= 1;
   sSQL:= ' SELECT (NVL(MAX(ID_FOL_SEGURO),0)+1) FOLIO '+
          '   FROM CR_GA_SEGURO '+
          '  WHERE CVE_TIPO_SEG_ORIG ='''+ Objeto.sCveTipoSeg +''''+
          '    AND ID_REFERENCIA ='+ IntToStr(Objeto.iIdReferencia);
   qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
   If qyQuery <> Nil Then Begin
      iFolio:= qyQuery.FieldByName('FOLIO').AsInteger;
      qyQuery.Free;
   End;
   ObtFolio:= iFolio;
End;
procedure TwMSeguro.InterForma1DespuesAceptar(Sender: TObject);
begin
   MuestraDatos;
end;

procedure TwMSeguro.InterForma1DespuesCancelar(Sender: TObject);
begin
   MuestraDatos;
end;

procedure TwMSeguro.InterForma1DespuesEliminar(Sender: TObject);
begin
   MuestraDatos;
end;

procedure TwMSeguro.sgcDATADblClick(Sender: TObject);
begin

   Objeto.FindKey([sgcDATA.CellStr['ID_FOL_SEGURO',sgcDATA.SG.Row],
                   sgcDATA.CellStr['CVE_TIPO_SEG_ORIG',sgcDATA.SG.Row],
                   sgcDATA.CellStr['ID_REFERENCIA',sgcDATA.SG.Row]]);
end;

procedure TwMSeguro.edCVE_MONEDAExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.CVE_MONEDA.GetFromControl;
      If Objeto.CVE_MONEDA.AsFloat = 0 Then Begin
         vlSalida   := False;
         vlMsg := 'Debe seleccionar una moneda';
      End;
      InterForma1.ValidaExit(edCVE_MONEDA,vlSalida,vlMsg,True);
   End;
end;

procedure TwMSeguro.btCVE_MONEDAClick(Sender: TObject);
begin
   Objeto.Moneda.ShowAll := True;
   If Objeto.Moneda.Busca Then Begin
      InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

procedure TwMSeguro.ilCVE_MONEDACapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit)or (InterForma1.IsNewData);
end;

procedure TwMSeguro.ilCVE_MONEDAEjecuta(Sender: TObject);
begin
   If Objeto.Moneda.FindKey([ilCVE_MONEDA.Buffer]) Then Begin
      InterForma1.NextTab(edCVE_MONEDA);
   End;
end;

end.
