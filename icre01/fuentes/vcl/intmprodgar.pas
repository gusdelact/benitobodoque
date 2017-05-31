// Sistema         : Clase de CR_GA_REL_PRO_GA
// Fecha de Inicio : 24/06/2004
// Función forma   : Clase de CR_GA_REL_PRO_GA
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMProdGar;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,IntGenCre,
IntParamCre, InterEdit, IntMGarantia,IntCrProduct;

Type
 TMProdGar= class;

  TwMProdGar=Class(TForm)
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
    edCVE_PRODUCTO_CRE: TEdit;
    Label3: TLabel;
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
    edCVE_GARANTIA: TEdit;
    btCVE_GARANTIA: TBitBtn;
    edNOM_CVE_GARANTIA: TEdit;
    ilCVE_GARANTIA: TInterLinkit;
    rgSITUACION: TRadioGroup;
    btCVE_PRODUCTO_CRE: TBitBtn;
    edNOM_CVE_PRODUCTO_CRE: TEdit;
    ilCVE_PRODUCTO_CRE: TInterLinkit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure edCVE_PRODUCTO_CREExit(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure edCVE_GARANTIAExit(Sender: TObject);
    procedure rgSITUACIONExit(Sender: TObject);
    procedure btCVE_GARANTIAClick(Sender: TObject);
    procedure ilCVE_GARANTIAEjecuta(Sender: TObject);
    procedure ilCVE_GARANTIACapture(Sender: TObject; var Show: Boolean);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure btCVE_PRODUCTO_CREClick(Sender: TObject);
    procedure ilCVE_PRODUCTO_CRECapture(Sender: TObject;
      var Show: Boolean);
    procedure ilCVE_PRODUCTO_CREEjecuta(Sender: TObject);

    private
    { Private declarations }
    public
    { Public declarations }
      Objeto : TMProdGar;
    end;

 TMProdGar= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        CVE_PRODUCTO_CRE    : TInterCampo;
        CVE_GARANTIA        : TInterCampo;
        SIT_REL_PRO_GAR     : TInterCampo;
        F_ALTA              : TInterCampo;
        CVE_USU_ALTA        : TInterCampo;
        F_MODIFICA          : TInterCampo;
        CVE_USU_MODIFICA    : TInterCampo;

        ParamCre            : TParamCre;
        MGarantia           : TMGarantia;
        Producto            : TCrProduct;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

implementation
{$R *.DFM}

constructor TMProdGar.Create( AOwner : TComponent );
begin Inherited;

   CVE_PRODUCTO_CRE :=CreaCampo('CVE_PRODUCTO_CRE',ftString,tsNinguno,tsNinguno,True);
      CVE_PRODUCTO_CRE.Caption:='Clave de producto';
   CVE_GARANTIA :=CreaCampo('CVE_GARANTIA',ftString,tsNinguno,tsNinguno,True);
      CVE_GARANTIA.Caption:='Clave de garantía';
   SIT_REL_PRO_GAR :=CreaCampo('SIT_REL_PRO_GAR',ftString,tsNinguno,tsNinguno,True);
   With SIT_REL_PRO_GAR do begin
      Size:=2;
      UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add('AC');
      ComboLista.Add('1'); ComboDatos.Add('IN');
   end;
      SIT_REL_PRO_GAR.Caption:='Situación de garantía';
      SIT_REL_PRO_GAR.NoCompare:= True;
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

   FKeyFields.Add('CVE_PRODUCTO_CRE');
   FKeyFields.Add('CVE_GARANTIA');
   TableName := 'CR_GA_REL_PRO_GA';
   UseQuery := True;
   HelpFile := 'IntMProdGar.Hlp';
   ShowMenuReporte:=True;

   MGarantia := TMGarantia.Create(Self);
   MGarantia.MasterSource := Self;
   MGarantia.FieldByName('CVE_GARANTIA').MasterField := 'CVE_GARANTIA';

   Producto := TCrProduct.Create(Self);
   Producto.MasterSource := Self;
   Producto.FieldByName('CVE_PRODUCTO_CRE').MasterField := 'CVE_PRODUCTO_CRE';
end;


Destructor TMProdGar.Destroy;
begin
   If MGarantia <> Nil Then
      MGarantia.Free;
   If Producto <> Nil Then
      Producto.Free;
   Inherited;
end;

function TMProdGar.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMProdGar;
begin
   W:=TWMProdGar.Create(Self);
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

Function TMProdGar.InternalBusca:Boolean;
Var T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IMProdGar.it','S,S');
   Try
      if Active then begin
         T.Param(0,CVE_PRODUCTO_CRE.AsString);
         T.Param(1,CVE_GARANTIA.AsString);
      end;
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
   finally
      T.Free;
   end;
end;

function TMProdGar.Reporte:Boolean;
begin
   Result := False;
end;


(***********************************************FORMA CR_GA_REL_PRO_GA********************)
(*                                                                              *)
(*  FORMA DE CR_GA_REL_PRO_GA                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_GA_REL_PRO_GA********************)

procedure TwMProdGar.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   With Objeto Do Begin
      CVE_PRODUCTO_CRE.Control    := edCVE_PRODUCTO_CRE;
      CVE_GARANTIA.Control        := edCVE_GARANTIA;
      SIT_REL_PRO_GAR.Control     := rgSITUACION;
      F_ALTA.Control              := edF_ALTA;
      CVE_USU_ALTA.Control        := edCVE_USU_ALTA;
      F_MODIFICA.Control          := edF_MODIFICA;
      CVE_USU_MODIFICA.Control    := edCVE_USU_MODIF;
      InterForma1.MsgPanel        := PnlMsg;

      MGarantia.CVE_GARANTIA.Control  := edCVE_GARANTIA;
      MGarantia.DESC_GARANTIA.Control := edNOM_CVE_GARANTIA;
      MGarantia.GetParams(Objeto);
      edNOM_CVE_GARANTIA.Hint := MGarantia.DESC_GARANTIA.AsString;
      edNOM_CVE_GARANTIA.ShowHint := True;

      Producto.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO_CRE;
      Producto.DESC_C_PRODUCTO.Control := edNOM_CVE_PRODUCTO_CRE;
      Producto.GetParams(Objeto);
      edNOM_CVE_PRODUCTO_CRE.Hint := Producto.DESC_C_PRODUCTO.AsString;
      edNOM_CVE_PRODUCTO_CRE.ShowHint := True;
   End;
end;

procedure TwMProdGar.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      CVE_PRODUCTO_CRE.Control    := Nil;
      CVE_GARANTIA.Control        := Nil;
      SIT_REL_PRO_GAR.Control     := Nil;
      F_ALTA.Control              := Nil;
      CVE_USU_ALTA.Control        := Nil;
      F_MODIFICA.Control          := Nil;
      CVE_USU_MODIFICA.Control    := Nil;
      InterForma1.MsgPanel        := Nil;

      MGarantia.CVE_GARANTIA.Control    := Nil;
      MGarantia.DESC_GARANTIA.Control   := Nil;
      Producto.CVE_PRODUCTO_CRE.Control := Nil;
      Producto.DESC_C_PRODUCTO.Control  := Nil;
   End;
end;

procedure TwMProdGar.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMProdGar.InterForma1Buscar(Sender: TObject);
begin
   With Objeto Do Begin
      InternalBusca;
   End;
end;

procedure TwMProdGar.edCVE_PRODUCTO_CREExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.CVE_PRODUCTO_CRE.GetFromControl;
      If Objeto.CVE_PRODUCTO_CRE.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe seleccionar un tipo de producto';
      End;
      InterForma1.ValidaExit(edCVE_PRODUCTO_CRE,vlSalida,vlMsg,True);
   End;
end;

procedure TwMProdGar.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.F_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   edCVE_PRODUCTO_CRE.SetFocus;
   rgSITUACION.ItemIndex:= 0;
end;

procedure TwMProdGar.edCVE_GARANTIAExit(Sender: TObject);
Var  vlSalida    : boolean;
     vlMsg, sSQL : String;
     qyQuery     : TQuery;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.CVE_PRODUCTO_CRE.GetFromControl;
      Objeto.CVE_GARANTIA.GetFromControl;
      If Objeto.CVE_GARANTIA.AsString <> CNULL Then Begin
         If InterForma1.IsNewData Then Begin
            sSQL:='SELECT * FROM CR_GA_REL_PRO_GA '+
                  ' WHERE CVE_PRODUCTO_CRE ='+ Objeto.CVE_PRODUCTO_CRE.AsSQL+
                  '   AND CVE_GARANTIA ='+ Objeto.CVE_GARANTIA.AsSQL;
            qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
            If qyQuery <> Nil Then Begin
               vlSalida   := False;
               vlMsg := 'La relación Producto-Garantía ya existe';
               qyQuery.Free;
            End;
         End;
      End Else Begin
         vlSalida   := False;
         vlMsg := 'Debe seleccionar un tipo de garantía';
      End;
      InterForma1.ValidaExit(edCVE_GARANTIA,vlSalida,vlMsg,True);
   End;
end;

procedure TwMProdGar.rgSITUACIONExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSITUACION,True,CNULL,True);
end;

procedure TwMProdGar.btCVE_GARANTIAClick(Sender: TObject);
begin
   Objeto.MGarantia.ShowAll := True;
   If Objeto.MGarantia.Busca Then Begin
      InterForma1.NextTab(edCVE_GARANTIA);
   End;
end;

procedure TwMProdGar.ilCVE_GARANTIAEjecuta(Sender: TObject);
begin
   If Objeto.MGarantia.FindKey([ilCVE_GARANTIA.Buffer]) Then Begin
      InterForma1.NextTab(edCVE_GARANTIA);
   End;
end;

procedure TwMProdGar.ilCVE_GARANTIACapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit)and (InterForma1.IsNewData);
end;

procedure TwMProdGar.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.F_MODIFICA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
   rgSITUACION.SetFocus;
end;

procedure TwMProdGar.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin

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

procedure TwMProdGar.btCVE_PRODUCTO_CREClick(Sender: TObject);
begin
   Objeto.Producto.BuscaWhereString:= ' CR_PRODUCTO.B_GARANTIA = '
                                    + #39 + 'V' + #39
                                    + ' AND CR_PRODUCTO.SIT_PRODUCTO ='
                                    + #39 + 'AC' + #39 ;
   Objeto.Producto.FilterString := Objeto.Producto.BuscaWhereString;

   Objeto.Producto.ShowAll := True;
   If Objeto.Producto.Busca Then Begin
      InterForma1.NextTab(edCVE_PRODUCTO_CRE);
   End;
end;

procedure TwMProdGar.ilCVE_PRODUCTO_CRECapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit)and (InterForma1.IsNewData);
end;

procedure TwMProdGar.ilCVE_PRODUCTO_CREEjecuta(Sender: TObject);
begin
   If Objeto.Producto.FindKey([ilCVE_PRODUCTO_CRE.Buffer]) Then Begin
      InterForma1.NextTab(edCVE_PRODUCTO_CRE);
   End;
end;

end.
