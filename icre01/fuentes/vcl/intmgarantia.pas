// Sistema         : Clase de CR_GA_GARANTIA
// Fecha de Inicio : 23/06/2004
// Función forma   : Clase de CR_GA_GARANTIA
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMGarantia;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,IntGenCre,
IntParamCre, InterEdit, IntMTipoGar, IntCrUniTie;

Type
 TMGarantia= class;

  TwMGarantia=Class(TForm)
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
    edCVE_GARANTIA: TEdit;
    Label3: TLabel;
    edDESC_GARANTIA: TEdit;
    Label4: TLabel;
    GroupBox4: TGroupBox;
    lbF_ALTA: TLabel;
    lbF_MODIF: TLabel;
    lbUSUA_ALTA: TLabel;
    lbUSUA_MODIF: TLabel;
    edF_ALTA: TEdit;
    edF_MODIFICA: TEdit;
    edCVE_USU_ALTA: TEdit;
    edCVE_USU_MODIF: TEdit;
    Label1: TLabel;
    edCVE_TIPO_GAR: TEdit;
    btCVE_TIPO_GAR: TBitBtn;
    edNOM_CVE_TIPO_GAR: TEdit;
    ilCVE_TIPO_GAR: TInterLinkit;
    edPCT_COBERTURA: TInterEdit;
    Label2: TLabel;
    rgCVE_TIPO_SEGURO: TRadioGroup;
    rgSIT_GARANTIA: TRadioGroup;
    GroupBox1: TGroupBox;
    cbxB_REQ_AVALUO: TCheckBox;
    cbxB_REV_AVALUO: TCheckBox;
    edUNIDAD_TIEMPO_AV: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    cbxB_REQ_VALUACION: TCheckBox;
    cbxB_REVISION_GAR: TCheckBox;
    edUNIDAD_TIEMPO_RE: TEdit;
    edFACT_PROPOR_GAR: TInterEdit;
    Label11: TLabel;
    cbxB_REQ_INSCR_RPP: TCheckBox;
    cbxB_REQ_INSCR_RPC: TCheckBox;
    edCVE_SITI_GAR: TEdit;
    Label12: TLabel;
    edNUM_UNIDADES_AV: TInterEdit;
    edNUM_UNIDADES_RE: TInterEdit;
    Label13: TLabel;
    edCVE_SUB_SITI: TEdit;
    btUNIDAD_TIEMPO_AV: TBitBtn;
    btUNIDAD_TIEMPO_RE: TBitBtn;
    edNOM_UNIDAD_TIEMPO_AV: TEdit;
    edNOM_UNIDAD_TIEMPO_RE: TEdit;
    ilUNIDAD_TIEMPO_AV: TInterLinkit;
    ilUNIDAD_TIEMPO_RE: TInterLinkit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure edCVE_GARANTIAExit(Sender: TObject);
    procedure edDESC_GARANTIAExit(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure edCVE_TIPO_GARExit(Sender: TObject);
    procedure edPCT_COBERTURAExit(Sender: TObject);
    procedure rgCVE_TIPO_SEGUROExit(Sender: TObject);
    procedure cbxB_REQ_AVALUOExit(Sender: TObject);
    procedure cbxB_REV_AVALUOExit(Sender: TObject);
    procedure edUNIDAD_TIEMPO_AVExit(Sender: TObject);
    procedure edNUM_UNIDADES_AVExit(Sender: TObject);
    procedure edUNIDAD_TIEMPO_REExit(Sender: TObject);
    procedure edNUM_UNIDADES_REExit(Sender: TObject);
    procedure cbxB_REQ_VALUACIONExit(Sender: TObject);
    procedure cbxB_REVISION_GARExit(Sender: TObject);
    procedure cbxB_REQ_INSCR_RPPExit(Sender: TObject);
    procedure cbxB_REQ_INSCR_RPCExit(Sender: TObject);
    procedure edFACT_PROPOR_GARExit(Sender: TObject);
    procedure edCVE_SITI_GARExit(Sender: TObject);
    procedure rgSIT_GARANTIAExit(Sender: TObject);
    procedure btCVE_TIPO_GARClick(Sender: TObject);
    procedure ilCVE_TIPO_GAREjecuta(Sender: TObject);
    procedure ilCVE_TIPO_GARCapture(Sender: TObject; var Show: Boolean);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure cbxB_REV_AVALUOClick(Sender: TObject);
    procedure cbxB_REVISION_GARClick(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure cbxB_REQ_AVALUOClick(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure cbxB_REQ_VALUACIONClick(Sender: TObject);
    procedure edCVE_SUB_SITIExit(Sender: TObject);
    procedure btUNIDAD_TIEMPO_REClick(Sender: TObject);
    procedure btUNIDAD_TIEMPO_AVClick(Sender: TObject);
    procedure ilUNIDAD_TIEMPO_AVCapture(Sender: TObject; var Show: Boolean);
    procedure ilUNIDAD_TIEMPO_AVEjecuta(Sender: TObject);
    procedure ilUNIDAD_TIEMPO_RECapture(Sender: TObject;
      var Show: Boolean);
    procedure ilUNIDAD_TIEMPO_REEjecuta(Sender: TObject);
    procedure edNUM_UNIDADES_AVKeyPress(Sender: TObject; var Key: Char);
    procedure edNUM_UNIDADES_REKeyPress(Sender: TObject; var Key: Char);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure InterForma1AntesEliminar(Sender: TObject;
      var Realizado: Boolean);

    private
    { Private declarations }
      Procedure CambioControles;
    public
    { Public declarations }
      Objeto : TMGarantia;
    end;

 TMGarantia= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        CVE_GARANTIA        : TInterCampo;
        CVE_TIPO_GAR        : TInterCampo;
        DESC_GARANTIA       : TInterCampo;
        PCT_COBERTURA       : TInterCampo;
        CVE_TIPO_SEGURO     : TInterCampo;
        B_REQ_AVALUO        : TInterCampo;
        B_REV_AVALUO        : TInterCampo;
        UNIDAD_TIEMPO_AV    : TInterCampo;
        NUM_UNIDADES_AV     : TInterCampo;
        DIA_AVALUO          : TInterCampo;
        B_REQ_VALUACION     : TInterCampo;
        B_REVISION_GAR      : TInterCampo;
        UNIDAD_TIEMPO_RE    : TInterCampo;
        NUM_UNIDADES_RE     : TInterCampo;
        DIA_REVISION_GAR    : TInterCampo;
        FACT_PROPOR_GAR     : TInterCampo;
        B_REQ_INSCR_RPP     : TInterCampo;
        B_REQ_INSCR_RPC     : TInterCampo;
        CVE_SITI_GAR        : TInterCampo;
        SIT_GARANTIA        : TInterCampo;
        F_ALTA              : TInterCampo;
        CVE_USU_ALTA        : TInterCampo;
        F_MODIFICA          : TInterCampo;
        CVE_USU_MODIFICA    : TInterCampo;
        CVE_SUB_SITI        : TInterCampo;

        ParamCre            : TParamCre;
        MTipoGar            : TMTipoGar;
        CrUniTie1           : TCrUniTie;
        CrUniTie2           : TCrUniTie;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

implementation
{$R *.DFM}

constructor TMGarantia.Create( AOwner : TComponent );
begin Inherited;
   CVE_GARANTIA :=CreaCampo('CVE_GARANTIA',ftString,tsNinguno,tsNinguno,True);
      CVE_GARANTIA.Caption:='Clave de garantía';
      CVE_GARANTIA.NoCompare:= False;
   CVE_TIPO_GAR :=CreaCampo('CVE_TIPO_GAR',ftString,tsNinguno,tsNinguno,True);
      CVE_TIPO_GAR.Caption:='Clave tipo de garantía';
      CVE_TIPO_GAR.NoCompare:= True;
   DESC_GARANTIA :=CreaCampo('DESC_GARANTIA',ftString,tsNinguno,tsNinguno,True);
      DESC_GARANTIA.Caption:='Descripción de garantía';
      DESC_GARANTIA.NoCompare:= True;
   PCT_COBERTURA :=CreaCampo('PCT_COBERTURA',ftFloat,tsNinguno,tsNinguno,True);
      PCT_COBERTURA.Caption:='Porcentaje de garantía';
      PCT_COBERTURA.NoCompare:= True;
   CVE_TIPO_SEGURO :=CreaCampo('CVE_TIPO_SEGURO',ftString,tsNinguno,tsNinguno,True);
   With CVE_TIPO_SEGURO do begin
      Size:=2;
      UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add('OB');
      ComboLista.Add('1'); ComboDatos.Add('OP');
      ComboLista.Add('2'); ComboDatos.Add('EX');
      ComboLista.Add('3'); ComboDatos.Add('NA');
   end;
      CVE_TIPO_SEGURO.Caption:='Tipo de seguro';
      CVE_TIPO_SEGURO.NoCompare:= True;
   B_REQ_AVALUO :=CreaCampo('B_REQ_AVALUO',ftString,tsNinguno,tsNinguno,True);
      B_REQ_AVALUO.Caption:='Requiere avalúo';
      B_REQ_AVALUO.NoCompare:= True;
   B_REV_AVALUO :=CreaCampo('B_REV_AVALUO',ftString,tsNinguno,tsNinguno,True);
      B_REV_AVALUO.Caption:='Requiere revisión';
      B_REV_AVALUO.NoCompare:= True;
   UNIDAD_TIEMPO_AV :=CreaCampo('UNIDAD_TIEMPO_AV',ftString,tsNinguno,tsNinguno,True);
      UNIDAD_TIEMPO_AV.Caption:='Unidad de tiempo';
      UNIDAD_TIEMPO_AV.NoCompare:= True;
   NUM_UNIDADES_AV :=CreaCampo('NUM_UNIDADES_AV',ftFloat,tsNinguno,tsNinguno,True);
      NUM_UNIDADES_AV.Caption:='Número de unidades de tiempo';
      NUM_UNIDADES_AV.NoCompare:= True;
   DIA_AVALUO :=CreaCampo('DIA_AVALUO',ftFloat,tsNinguno,tsNinguno,True);
      DIA_AVALUO.Caption:='Número de día de avalúo';
      DIA_AVALUO.NoCompare:= True;
   B_REQ_VALUACION :=CreaCampo('B_REQ_VALUACION',ftString,tsNinguno,tsNinguno,True);
      B_REQ_VALUACION.Caption:='Requiere valuación';
      B_REQ_VALUACION.NoCompare:= True;
   B_REVISION_GAR :=CreaCampo('B_REVISION_GAR',ftString,tsNinguno,tsNinguno,True);
      B_REVISION_GAR.Caption:='Requiere revisión de garantía';
      B_REVISION_GAR.NoCompare:= True;
   UNIDAD_TIEMPO_RE :=CreaCampo('UNIDAD_TIEMPO_RE',ftString,tsNinguno,tsNinguno,True);
      UNIDAD_TIEMPO_RE.Caption:='Unidad de tiempo';
      UNIDAD_TIEMPO_RE.NoCompare:= True;
   NUM_UNIDADES_RE :=CreaCampo('NUM_UNIDADES_RE',ftFloat,tsNinguno,tsNinguno,True);
      NUM_UNIDADES_RE.Caption:='Número de unidades de tiempo';
      NUM_UNIDADES_RE.NoCompare:= True;
   DIA_REVISION_GAR :=CreaCampo('DIA_REVISION_GAR',ftFloat,tsNinguno,tsNinguno,True);
      DIA_REVISION_GAR.Caption:='Día de revisión de garantía';
      DIA_REVISION_GAR.NoCompare:= True;
   FACT_PROPOR_GAR :=CreaCampo('FACT_PROPOR_GAR',ftFloat,tsNinguno,tsNinguno,True);
      FACT_PROPOR_GAR.Caption:='Proporción de garantía con respecto a crédito';
      FACT_PROPOR_GAR.NoCompare:= True;
   B_REQ_INSCR_RPP :=CreaCampo('B_REQ_INSCR_RPP',ftString,tsNinguno,tsNinguno,True);
      B_REQ_INSCR_RPP.Caption:='Aplica inscripción en el registro público de la propiedad';
      B_REQ_INSCR_RPP.NoCompare:= True;
   B_REQ_INSCR_RPC :=CreaCampo('B_REQ_INSCR_RPC',ftString,tsNinguno,tsNinguno,True);
      B_REQ_INSCR_RPC.Caption:='Aplica inscripción en el registro público de comercio';
      B_REQ_INSCR_RPC.NoCompare:= True;
   CVE_SITI_GAR :=CreaCampo('CVE_SITI_GAR',ftString,tsNinguno,tsNinguno,True);
      CVE_SITI_GAR.Caption:='Clasificación de garantías';
      CVE_SITI_GAR.NoCompare:= True;
   SIT_GARANTIA :=CreaCampo('SIT_GARANTIA',ftString,tsNinguno,tsNinguno,True);
   With SIT_GARANTIA do begin
      Size:=2;
      UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add('AC');
      ComboLista.Add('1'); ComboDatos.Add('IN');
   end;
      SIT_GARANTIA.Caption:='Situación de garantía';
      SIT_GARANTIA.NoCompare:= True;
   F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
      F_ALTA.Caption:='Fecha de Alta';
      F_ALTA.NoCompare:= True;
   CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      CVE_USU_ALTA.NoCompare:= True;
   F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
      F_MODIFICA.Caption:='Fecha Modifica';
      F_MODIFICA.NoCompare:= True;
   CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      CVE_USU_MODIFICA.NoCompare:= True;
   CVE_SUB_SITI :=CreaCampo('CVE_SUB_SITI',ftString,tsNinguno,tsNinguno,True);
      CVE_SUB_SITI.Caption:='Clave de subclasificación';
      CVE_SUB_SITI.NoCompare:= True;

   FKeyFields.Add('CVE_GARANTIA');
   TableName := 'CR_GA_GARANTIA';
   UseQuery := True;
   HelpFile := 'IntMGarantia.Hlp';
   ShowMenuReporte:=True;

   MTipoGar := TMTipoGar.Create(Self);
   MTipoGar.MasterSource := Self;
   MTipoGar.FieldByName('CVE_TIPO_GAR').MasterField := 'CVE_TIPO_GAR';

   CrUniTie1 := TCrUniTie.Create(Self);
   CrUniTie1.MasterSource := Self;
   CrUniTie1.FieldByName('CVE_UNIDAD_TIEMP').MasterField := 'UNIDAD_TIEMPO_AV';

   CrUniTie2 := TCrUniTie.Create(Self);
   CrUniTie2.MasterSource := Self;
   CrUniTie2.FieldByName('CVE_UNIDAD_TIEMP').MasterField := 'UNIDAD_TIEMPO_RE';

end;


Destructor TMGarantia.Destroy;
begin
   If MTipoGar <> Nil Then
      MTipoGar.Free;
   If CrUniTie1 <> Nil Then
      CrUniTie1.Free;
   If CrUniTie2 <> Nil Then
      CrUniTie2.Free;
   Inherited;
end;

function TMGarantia.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMGarantia;
begin
   W:=TWMGarantia.Create(Self);
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

Function TMGarantia.InternalBusca:Boolean;
Var T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IMGarantia.it','S');
   Try
      if Active then begin
         T.Param(0,CVE_GARANTIA.AsString);
      end;
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0)]);
   finally
      T.Free;
   end;
end;

function TMGarantia.Reporte:Boolean;
begin
   Result := False;
end;


(***********************************************FORMA CR_GA_GARANTIA********************)
(*                                                                              *)
(*  FORMA DE CR_GA_GARANTIA                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_GA_GARANTIA********************)

procedure TwMGarantia.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   With Objeto Do Begin
      CVE_GARANTIA.Control        := edCVE_GARANTIA;
      CVE_TIPO_GAR.Control        := edCVE_TIPO_GAR;
      DESC_GARANTIA.Control       := edDESC_GARANTIA;
      PCT_COBERTURA.Control       := edPCT_COBERTURA;
      CVE_TIPO_SEGURO.Control     := rgCVE_TIPO_SEGURO;
      B_REQ_AVALUO.Control        := cbxB_REQ_AVALUO;
      B_REV_AVALUO.Control        := cbxB_REV_AVALUO;
      UNIDAD_TIEMPO_AV.Control    := edUNIDAD_TIEMPO_AV;
      NUM_UNIDADES_AV.Control     := edNUM_UNIDADES_AV;
      B_REQ_VALUACION.Control     := cbxB_REQ_VALUACION;
      B_REVISION_GAR.Control      := cbxB_REVISION_GAR;
      UNIDAD_TIEMPO_RE.Control    := edUNIDAD_TIEMPO_RE;
      NUM_UNIDADES_RE.Control     := edNUM_UNIDADES_RE;
      FACT_PROPOR_GAR.Control     := edFACT_PROPOR_GAR;
      B_REQ_INSCR_RPP.Control     := cbxB_REQ_INSCR_RPP;
      B_REQ_INSCR_RPC.Control     := cbxB_REQ_INSCR_RPC;
      CVE_SITI_GAR.Control        := edCVE_SITI_GAR;
      SIT_GARANTIA.Control        := rgSIT_GARANTIA;
      F_ALTA.Control              := edF_ALTA;
      CVE_USU_ALTA.Control        := edCVE_USU_ALTA;
      F_MODIFICA.Control          := edF_MODIFICA;
      CVE_USU_MODIFICA.Control    := edCVE_USU_MODIF;
      CVE_SUB_SITI.Control        := edCVE_SUB_SITI;
      InterForma1.MsgPanel        := PnlMsg;

      MTipoGar.CVE_TIPO_GAR.Control  := edCVE_TIPO_GAR;
      MTipoGar.DESC_TIPO_GAR.Control := edNOM_CVE_TIPO_GAR;
      edNOM_CVE_TIPO_GAR.Hint := MTipoGar.DESC_TIPO_GAR.AsString;
      edNOM_CVE_TIPO_GAR.ShowHint := True;
      MTipoGar.GetParams(Objeto);

      CrUniTie1.CVE_UNIDAD_TIEMP.Control := edUNIDAD_TIEMPO_AV;
      CrUniTie1.DESCRIPCION.Control := edNOM_UNIDAD_TIEMPO_AV;
      CrUniTie1.GetParams(Objeto);

      CrUniTie2.CVE_UNIDAD_TIEMP.Control := edUNIDAD_TIEMPO_RE;
      CrUniTie2.DESCRIPCION.Control := edNOM_UNIDAD_TIEMPO_RE;
      CrUniTie2.GetParams(Objeto);

   End;
end;

procedure TwMGarantia.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      CVE_GARANTIA.Control        := Nil;
      CVE_TIPO_GAR.Control        := Nil;
      DESC_GARANTIA.Control       := Nil;
      PCT_COBERTURA.Control       := Nil;
      CVE_TIPO_SEGURO.Control     := Nil;
      B_REQ_AVALUO.Control        := Nil;
      B_REV_AVALUO.Control        := Nil;
      UNIDAD_TIEMPO_AV.Control    := Nil;
      NUM_UNIDADES_AV.Control     := Nil;
      B_REQ_VALUACION.Control     := Nil;
      B_REVISION_GAR.Control      := Nil;
      UNIDAD_TIEMPO_RE.Control    := Nil;
      NUM_UNIDADES_RE.Control     := Nil;
      FACT_PROPOR_GAR.Control     := Nil;
      B_REQ_INSCR_RPP.Control     := Nil;
      B_REQ_INSCR_RPC.Control     := Nil;
      CVE_SITI_GAR.Control        := Nil;
      SIT_GARANTIA.Control        := Nil;
      F_ALTA.Control              := Nil;
      CVE_USU_ALTA.Control        := Nil;
      F_MODIFICA.Control          := Nil;
      CVE_USU_MODIFICA.Control    := Nil;
      CVE_SUB_SITI.Control        := Nil;
      InterForma1.MsgPanel        := Nil;

      MTipoGar.CVE_TIPO_GAR.Control  := Nil;
      MTipoGar.DESC_TIPO_GAR.Control := Nil;

      CrUniTie1.CVE_UNIDAD_TIEMP.Control := Nil;
      CrUniTie1.DESCRIPCION.Control := Nil;
      CrUniTie2.CVE_UNIDAD_TIEMP.Control := Nil;
      CrUniTie2.DESCRIPCION.Control := Nil;

   End;
end;

procedure TwMGarantia.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMGarantia.InterForma1Buscar(Sender: TObject);
begin
   With Objeto Do Begin
      InternalBusca;
      Objeto.CrUniTie1.FindKey([Objeto.UNIDAD_TIEMPO_AV.AsString]);
      Objeto.CrUniTie2.FindKey([Objeto.UNIDAD_TIEMPO_RE.AsString]);
      CambioControles;
   End;
end;

procedure TwMGarantia.edCVE_GARANTIAExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
     vlsql     : String;
     vlCveGar  : String;
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.CVE_GARANTIA.GetFromControl;

      If Objeto.CVE_GARANTIA.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Indique la clave de la garantía';
      End Else Begin
         vlSql := ' SELECT * FROM CR_GA_GARANTIA ' +
                  ' WHERE CVE_GARANTIA ='+ Objeto.CVE_GARANTIA.AsSQL;

         If InterForma1.IsNewData Then Begin
             GetSQLStr(vlSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'CVE_GARANTIA',vlCveGar,False);
             If (vlCveGar <>'' ) Then Begin
                VLSalida := False;
                VLMsg   := 'La clave de la garantía ya existe';
             End;
         End;
      End;
      InterForma1.ValidaExit(edCVE_GARANTIA,vlSalida,vlMsg,True);
   End;
end;

procedure TwMGarantia.edDESC_GARANTIAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edDESC_GARANTIA,True,CNULL,True);
end;

procedure TwMGarantia.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.F_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   edCVE_GARANTIA.SetFocus;
   rgSIT_GARANTIA.ItemIndex:= 0;
   rgCVE_TIPO_SEGURO.ItemIndex:= 0;
   CambioControles;   
end;

procedure TwMGarantia.edCVE_TIPO_GARExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.CVE_TIPO_GAR.GetFromControl;
      If Objeto.CVE_TIPO_GAR.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe seleccionar un tipo de garantía';
      End;
      InterForma1.ValidaExit(edCVE_TIPO_GAR,vlSalida,vlMsg,True);
   End;
end;

procedure TwMGarantia.edPCT_COBERTURAExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.PCT_COBERTURA.GetFromControl;
      If Objeto.PCT_COBERTURA.AsFloat = 0 Then Begin
         vlSalida   := False;
         vlMsg := 'El porcentaje de cobertura de la garantía no debe ser nulo';
      End Else Begin
         If (Pos('.', Objeto.PCT_COBERTURA.AsString) > 5) Then Begin
            vlSalida   := False;
            vlMsg := 'La la parte entera de %Cobertura debe ser menor a 10000';
         End;
      End;
      InterForma1.ValidaExit(edPCT_COBERTURA,vlSalida,vlMsg,True);
   End;
end;

procedure TwMGarantia.rgCVE_TIPO_SEGUROExit(Sender: TObject);
begin   InterForma1.ValidaExit(rgCVE_TIPO_SEGURO,True,CNULL,True);
end;

procedure TwMGarantia.cbxB_REQ_AVALUOExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.B_REQ_AVALUO.GetFromControl;
      If Objeto.B_REQ_AVALUO.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Indica si aplica avalúo para la garantía';
      End;
      InterForma1.ValidaExit(cbxB_REQ_AVALUO,vlSalida,vlMsg,True);
   End;
end;

procedure TwMGarantia.cbxB_REV_AVALUOExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.B_REV_AVALUO.GetFromControl;
      If Objeto.B_REV_AVALUO.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Indica si se requiere realizar una revisión periódica del avalúo';
      End;
      InterForma1.ValidaExit(cbxB_REV_AVALUO,vlSalida,vlMsg,True);
   End;
end;

procedure TwMGarantia.edUNIDAD_TIEMPO_AVExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.UNIDAD_TIEMPO_AV.GetFromControl;
      If cbxB_REV_AVALUO.Checked Then Begin
         If Objeto.UNIDAD_TIEMPO_AV.AsString = CNULL Then Begin
            vlSalida   := False;
            vlMsg := 'Indica la unidad de tiempo para la revisión del avalúo';
         End;
         InterForma1.ValidaExit(edUNIDAD_TIEMPO_AV,vlSalida,vlMsg,True);
      End Else Begin
         InterForma1.ValidaExit(edUNIDAD_TIEMPO_AV,True,CNULL,True);      
      End;
   End;
end;

procedure TwMGarantia.edNUM_UNIDADES_AVExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.NUM_UNIDADES_AV.GetFromControl;
      If cbxB_REV_AVALUO.Checked Then Begin
         If Objeto.NUM_UNIDADES_AV.AsInteger = 0 Then Begin
            vlSalida   := False;
            vlMsg := 'Indica el número de unidades de tiempo';
         End;
         InterForma1.ValidaExit(edNUM_UNIDADES_AV,vlSalida,vlMsg,True);
      End Else Begin
         InterForma1.ValidaExit(edNUM_UNIDADES_AV,True,CNULL,True);
      End;
   End;
end;

procedure TwMGarantia.edUNIDAD_TIEMPO_REExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.UNIDAD_TIEMPO_RE.GetFromControl;
      If cbxB_REVISION_GAR.Checked Then Begin
         If Objeto.UNIDAD_TIEMPO_RE.AsString = CNULL Then Begin
            vlSalida   := False;
            vlMsg := 'Indica la unidad de tiempo para revisión de la garantía';
         End;
         InterForma1.ValidaExit(edUNIDAD_TIEMPO_RE,vlSalida,vlMsg,True);
      End Else Begin
         InterForma1.ValidaExit(edUNIDAD_TIEMPO_RE,True,CNULL,True);
      End;
   End;
end;

procedure TwMGarantia.edNUM_UNIDADES_REExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.NUM_UNIDADES_RE.GetFromControl;
      If cbxB_REVISION_GAR.Checked Then Begin
         If Objeto.NUM_UNIDADES_RE.AsInteger = 0 Then Begin
            vlSalida   := False;
            vlMsg := 'Indica el número de unidades de tiempo';
         End;
         InterForma1.ValidaExit(edNUM_UNIDADES_RE,vlSalida,vlMsg,True);
      End Else Begin
         InterForma1.ValidaExit(edNUM_UNIDADES_RE,True,CNULL,True);
      End;
   End;
end;

procedure TwMGarantia.cbxB_REQ_VALUACIONExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.B_REQ_VALUACION.GetFromControl;
      If Objeto.B_REQ_VALUACION.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Indica si requiere valuación la garantía';
      End;
      InterForma1.ValidaExit(cbxB_REQ_VALUACION,vlSalida,vlMsg,True);
   End;
end;

procedure TwMGarantia.cbxB_REVISION_GARExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.B_REVISION_GAR.GetFromControl;
      If Objeto.B_REVISION_GAR.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Indica si se requiere realizar una revisión periódica de la garantía';
      End;
      InterForma1.ValidaExit(cbxB_REVISION_GAR,vlSalida,vlMsg,True);
   End;
end;

procedure TwMGarantia.cbxB_REQ_INSCR_RPPExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.B_REQ_INSCR_RPP.GetFromControl;
      If Objeto.B_REQ_INSCR_RPP.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Indica si requiere inscripción al RPP';
      End;
      InterForma1.ValidaExit(cbxB_REQ_INSCR_RPP,vlSalida,vlMsg,True);
   End;
end;

procedure TwMGarantia.cbxB_REQ_INSCR_RPCExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.B_REQ_INSCR_RPC.GetFromControl;
      If Objeto.B_REQ_INSCR_RPC.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Indica si requiere inscripción al RPC';
      End;
      InterForma1.ValidaExit(cbxB_REQ_INSCR_RPC,vlSalida,vlMsg,True);
   End;
end;

procedure TwMGarantia.edFACT_PROPOR_GARExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.FACT_PROPOR_GAR.GetFromControl;
      If Objeto.FACT_PROPOR_GAR.AsFloat = 0 Then Begin
         vlSalida   := False;
         vlMsg := 'Indica la proporción de la garantía con respecto al crédito';
      End Else Begin
         If (Pos('.', Objeto.FACT_PROPOR_GAR.AsString) > 3) Then Begin
            vlSalida   := False;
            vlMsg := 'La Porción debe ser menor a 100';
         End;
      End;
      InterForma1.ValidaExit(edFACT_PROPOR_GAR,vlSalida,vlMsg,True);
   End;
end;

procedure TwMGarantia.edCVE_SITI_GARExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edCVE_SITI_GAR,True,CNULL,True);
end;

procedure TwMGarantia.rgSIT_GARANTIAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_GARANTIA,True,CNULL,True);
end;

procedure TwMGarantia.btCVE_TIPO_GARClick(Sender: TObject);
begin
   Objeto.MTipoGar.ShowAll := True;
   If Objeto.MTipoGar.Busca Then Begin
      InterForma1.NextTab(edCVE_TIPO_GAR);
   End;
end;

procedure TwMGarantia.ilCVE_TIPO_GAREjecuta(Sender: TObject);
begin
   If Objeto.MTipoGar.FindKey([ilCVE_TIPO_GAR.Buffer]) Then Begin
      InterForma1.NextTab(edCVE_TIPO_GAR);
   End;
end;

procedure TwMGarantia.ilCVE_TIPO_GARCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit)or (InterForma1.IsNewData);
end;

procedure TwMGarantia.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.F_MODIFICA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
   edCVE_TIPO_GAR.SetFocus;
   CambioControles;
end;

procedure TwMGarantia.cbxB_REV_AVALUOClick(Sender: TObject);
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      If cbxB_REV_AVALUO.Checked Then Begin
         cbxB_REQ_AVALUO.Checked:= True;
         edUNIDAD_TIEMPO_AV.Tag:= 530;
         edUNIDAD_TIEMPO_AV.TabStop:= True;
         btUNIDAD_TIEMPO_AV.Tag:= 18;
         edNUM_UNIDADES_AV.Tag:= 18;
         edNUM_UNIDADES_AV.Text:= '1';
         edNUM_UNIDADES_AV.TabStop:= True;
      End Else Begin
         edUNIDAD_TIEMPO_AV.Tag:= 529;
         edUNIDAD_TIEMPO_AV.TabStop:= False;         
         btUNIDAD_TIEMPO_AV.Tag:= 17;
         edNUM_UNIDADES_AV.Tag:= 17;
         Objeto.CrUniTie1.Active:= False;
         edNUM_UNIDADES_AV.Text:= '';
         edNUM_UNIDADES_AV.TabStop:= False;
      End;
      InterForma1.InitShow;
   End;
end;

procedure TwMGarantia.cbxB_REVISION_GARClick(Sender: TObject);
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      If cbxB_REVISION_GAR.Checked Then Begin
         cbxB_REQ_VALUACION.Checked:= True;
         edUNIDAD_TIEMPO_RE.Tag:= 530;
         edUNIDAD_TIEMPO_RE.TabStop:= True;
         btUNIDAD_TIEMPO_RE.Tag:= 18;
         edNUM_UNIDADES_RE.Tag:= 18;
         edNUM_UNIDADES_RE.TabStop:= True;
         edNUM_UNIDADES_RE.Text:= '1';
      End Else Begin
         edUNIDAD_TIEMPO_RE.Tag:= 529;
         edUNIDAD_TIEMPO_RE.TabStop:= False;
         btUNIDAD_TIEMPO_RE.Tag:= 17;
         edNUM_UNIDADES_RE.Tag:= 17;
         Objeto.CrUniTie2.Active:= False;
         edNUM_UNIDADES_RE.Text:= '';
         edNUM_UNIDADES_RE.TabStop:= False;         
      End;
      InterForma1.InitShow;
   End;
end;

procedure TwMGarantia.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin

   edUNIDAD_TIEMPO_AV.Tag:= 530;
   edUNIDAD_TIEMPO_AV.TabStop:= True;
   btUNIDAD_TIEMPO_AV.Tag:= 18;
   edNUM_UNIDADES_AV.Tag:= 18;
   edNUM_UNIDADES_AV.TabStop:= True;

   edUNIDAD_TIEMPO_RE.Tag:= 530;
   edUNIDAD_TIEMPO_RE.TabStop:= True;
   btUNIDAD_TIEMPO_RE.Tag:= 18;
   edNUM_UNIDADES_RE.Tag:= 18;
   edNUM_UNIDADES_RE.TabStop:= True;

   With Objeto Do Begin
      if IsNewData then Begin
         if MessageDlg('¿Desea almacenar los datos capturados?',
            mtConfirmation,[mbYes, mbNo], 0) = mrYes then Begin
            CVE_USU_ALTA.AsString := DameUsuario;
            F_ALTA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
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

procedure TwMGarantia.cbxB_REQ_AVALUOClick(Sender: TObject);
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      If cbxB_REQ_AVALUO.Checked Then Begin
         cbxB_REV_AVALUO.Checked:= True;
      End Else Begin
         cbxB_REV_AVALUO.Checked:= False;
      End;
   End;
end;

procedure TwMGarantia.InterForma1DespuesShow(Sender: TObject);
begin
   CambioControles;
end;

Procedure TwMGarantia.CambioControles;
Begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin

      edUNIDAD_TIEMPO_AV.Tag:= 529;
      edUNIDAD_TIEMPO_AV.TabStop:= False;      
      btUNIDAD_TIEMPO_AV.Tag:= 17;
      edNUM_UNIDADES_AV.Tag:= 17;
      edNUM_UNIDADES_AV.TabStop:= False;

      If cbxB_REQ_AVALUO.Checked Then Begin
         If cbxB_REV_AVALUO.Checked Then Begin
            cbxB_REV_AVALUO.Enabled := True;
            edUNIDAD_TIEMPO_AV.Tag:= 530;
            edUNIDAD_TIEMPO_AV.TabStop:= True;
            btUNIDAD_TIEMPO_AV.Tag:= 18;
            edNUM_UNIDADES_AV.Tag:= 18;
            edNUM_UNIDADES_AV.TabStop:= True;
         End;
      End Else
         cbxB_REV_AVALUO.Enabled := False;


      edUNIDAD_TIEMPO_RE.Tag:= 529;
      edUNIDAD_TIEMPO_RE.TabStop:= False;
      btUNIDAD_TIEMPO_RE.Tag:= 17;
      edNUM_UNIDADES_RE.Tag:= 17;
      edNUM_UNIDADES_RE.TabStop:= False;

      If cbxB_REQ_VALUACION.Checked Then Begin
         If cbxB_REVISION_GAR.Checked Then Begin
            cbxB_REVISION_GAR.Enabled:= True;
            edUNIDAD_TIEMPO_RE.Tag:= 530;
            edUNIDAD_TIEMPO_RE.TabStop:= True;
            btUNIDAD_TIEMPO_RE.Tag:= 18;
            edNUM_UNIDADES_RE.Tag:= 18;
            edNUM_UNIDADES_RE.TabStop:= True;
         End;
      End Else
         cbxB_REVISION_GAR.Enabled:= False;

      InterForma1.InitShow;
   End;
End;
procedure TwMGarantia.cbxB_REQ_VALUACIONClick(Sender: TObject);
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      If cbxB_REQ_VALUACION.Checked Then Begin
         cbxB_REVISION_GAR.Checked:= True;
      End Else Begin
         cbxB_REVISION_GAR.Checked:= False;
      End;
   End;
end;

procedure TwMGarantia.edCVE_SUB_SITIExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edCVE_SUB_SITI,True,CNULL,True);
end;

procedure TwMGarantia.btUNIDAD_TIEMPO_REClick(Sender: TObject);
begin
   Objeto.CrUniTie2.ShowAll := True;
   If Objeto.CrUniTie2.Busca Then Begin
      InterForma1.NextTab(edUNIDAD_TIEMPO_RE);
   End;
end;

procedure TwMGarantia.btUNIDAD_TIEMPO_AVClick(Sender: TObject);
begin
   Objeto.CrUniTie1.ShowAll := True;
   If Objeto.CrUniTie1.Busca Then Begin
      InterForma1.NextTab(edUNIDAD_TIEMPO_RE);
   End;
end;

procedure TwMGarantia.ilUNIDAD_TIEMPO_AVCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=((InterForma1.CanEdit)or (InterForma1.IsNewData))and
         (cbxB_REV_AVALUO.Checked);
end;

procedure TwMGarantia.ilUNIDAD_TIEMPO_AVEjecuta(Sender: TObject);
begin
   If Objeto.CrUniTie1.FindKey([ilUNIDAD_TIEMPO_AV.Buffer]) Then Begin
      InterForma1.NextTab(edUNIDAD_TIEMPO_AV);
   End;
end;

procedure TwMGarantia.ilUNIDAD_TIEMPO_RECapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=((InterForma1.CanEdit)or (InterForma1.IsNewData))and
         (cbxB_REVISION_GAR.Checked);
end;

procedure TwMGarantia.ilUNIDAD_TIEMPO_REEjecuta(Sender: TObject);
begin
   If Objeto.CrUniTie2.FindKey([ilUNIDAD_TIEMPO_RE.Buffer]) Then Begin
      InterForma1.NextTab(edUNIDAD_TIEMPO_RE);
   End;
end;

procedure TwMGarantia.edNUM_UNIDADES_AVKeyPress(Sender: TObject;
  var Key: Char);
begin
   If ((Pos(Key,'0123456789'#8)) = 0) Then Key := #0;
end;

procedure TwMGarantia.edNUM_UNIDADES_REKeyPress(Sender: TObject;
  var Key: Char);
begin
   If ((Pos(Key,'0123456789'#8)) = 0) Then Key := #0;
end;

procedure TwMGarantia.InterForma1DespuesCancelar(Sender: TObject);
begin
   edUNIDAD_TIEMPO_AV.Tag:= 530;
   edUNIDAD_TIEMPO_AV.TabStop:= True;
   btUNIDAD_TIEMPO_AV.Tag:= 18;
   edNUM_UNIDADES_AV.Tag:= 18;
   edNUM_UNIDADES_AV.TabStop:= True;
   edUNIDAD_TIEMPO_RE.Tag:= 530;
   edUNIDAD_TIEMPO_RE.TabStop:= True;
   btUNIDAD_TIEMPO_RE.Tag:= 18;
   edNUM_UNIDADES_RE.Tag:= 18;
   edNUM_UNIDADES_RE.TabStop:= True;   
   InterForma1.InitShow;
end;

procedure TwMGarantia.InterForma1AntesEliminar(Sender: TObject;
  var Realizado: Boolean);
Var
   sSQL, sSQL1: String;
   qyQuery, qyQuery1: TQuery;
begin
   sSQL:='SELECT DISTINCT CVE_GARANTIA FROM CR_GA_REGISTRO WHERE CVE_GARANTIA='+ Objeto.CVE_GARANTIA.AsSQL;
   qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
   If qyQuery <> Nil Then Begin
      If qyQuery.FieldByName('CVE_GARANTIA').AsString = Objeto.CVE_GARANTIA.AsString Then Begin
         ShowMessage('La garantia tiene registros relacionados, no puede eliminarse');
         Realizado:= False;
      End Else Begin
         sSQL1:='SELECT DISTINCT CVE_GARANTIA FROM CR_GA_REL_PRO_GA WHERE CVE_GARANTIA='+ Objeto.CVE_GARANTIA.AsSQL;
         qyQuery1:= GetSQLQuery(sSQL1, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
         If qyQuery1 <> Nil Then Begin
            If qyQuery1.FieldByName('CVE_GARANTIA').AsString = Objeto.CVE_GARANTIA.AsString Then Begin
               ShowMessage('La garantia tiene productos relacionados, no puede eliminarse');
               Realizado:= False;
            End;
            qyQuery1.Free;
         End;
      End;
      qyQuery.Free;
   End;

end;

end.
