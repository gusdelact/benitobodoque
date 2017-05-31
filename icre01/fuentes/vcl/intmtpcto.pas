// Sistema         : Clase de CR_CT_CONTRATO_C
// Fecha de Inicio : 21/05/2004
// Función forma   : Clase de CR_CT_CONTRATO_C
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMTpCto;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,
IntGenCre, IntParamCre, IntMCatFirma,IntMCatEncab,IntMCatDet, IntCrProduct;

Type
 TMTpCto= class;

  TWMTpCto=Class(TForm)
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
    edCVE_FIRMA: TEdit;
    Label1: TLabel;
    GroupBox4: TGroupBox;
    lbF_ALTA: TLabel;
    lbF_MODIF: TLabel;
    lbUSUA_ALTA: TLabel;
    lbUSUA_MODIF: TLabel;
    edF_ALTA: TEdit;
    edF_MODIFICA: TEdit;
    edCVE_USU_ALTA: TEdit;
    edCVE_USU_MODIF: TEdit;
    rgSIT_CONTRATO: TRadioGroup;
    btFIRMA: TBitBtn;
    edNOM_FIRMA: TEdit;
    ilFIRMA: TInterLinkit;
    edCVE_CTO_CRE: TEdit;
    Label3: TLabel;
    edDESC_L_CONTRATO: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    edCVE_PRODUCTO_CRE: TEdit;
    btCVE_PRODUCTO_CRE: TBitBtn;
    edNOM_CVE_PRODUCTO_CRE: TEdit;
    ilPRODUCTO: TInterLinkit;
    Label6: TLabel;
    edCVE_ENCABEZADO: TEdit;
    btCVE_ENCABEZADO: TBitBtn;
    edNOM_CVE_ENCABEZADO: TEdit;
    ilCVE_ENCABEZADO: TInterLinkit;
    Label7: TLabel;
    edCVE_DETALLE: TEdit;
    btCVE_DETALLE: TBitBtn;
    edNOM_CVE_DETALLE: TEdit;
    ilCVE_DETALLE: TInterLinkit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure rgSIT_CONTRATOExit(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edCVE_FIRMAExit(Sender: TObject);
    procedure btFIRMAClick(Sender: TObject);
    procedure ilFIRMACapture(Sender: TObject; var Show: Boolean);
    procedure ilFIRMAEjecuta(Sender: TObject);
    procedure edCVE_CTO_CREExit(Sender: TObject);
    procedure edDESC_L_CONTRATOExit(Sender: TObject);
    procedure edCVE_PRODUCTO_CREExit(Sender: TObject);
    procedure ilCVE_DETALLECapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_ENCABEZADOCapture(Sender: TObject; var Show: Boolean);
    procedure ilPRODUCTOCapture(Sender: TObject; var Show: Boolean);
    procedure edCVE_ENCABEZADOExit(Sender: TObject);
    procedure edCVE_DETALLEExit(Sender: TObject);
    procedure btCVE_ENCABEZADOClick(Sender: TObject);
    procedure ilCVE_ENCABEZADOEjecuta(Sender: TObject);
    procedure btCVE_DETALLEClick(Sender: TObject);
    procedure ilCVE_DETALLEEjecuta(Sender: TObject);
    procedure btCVE_PRODUCTO_CREClick(Sender: TObject);
    procedure ilPRODUCTOEjecuta(Sender: TObject);
    procedure edDESC_L_CONTRATOKeyPress(Sender: TObject; var Key: Char);
    procedure edCVE_CTO_CREKeyPress(Sender: TObject; var Key: Char);

    private
    { Private declarations }
    public
    { Public declarations }
      Objeto : TMTpCto;
    end;

 TMTpCto= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        CVE_CTO_CRE         : TInterCampo;
        DESC_L_CONTRATO     : TInterCampo;
        CVE_PRODUCTO_CRE    : TInterCampo;
        CVE_ENCABEZADO      : TInterCampo;
        CVE_DETALLE         : TInterCampo;
        CVE_FIRMA           : TInterCampo;
        SIT_CONTRATO        : TInterCampo;
        CVE_USU_ALTA        : TInterCampo;
        F_ALTA              : TInterCampo;
        CVE_USU_MODIFICA    : TInterCampo;
        F_MODIFICA          : TInterCampo;

        ParamCre            : TParamCre;
        MCatFirma           : TMCatFirma;
        MCatEncab           : TMCatEncab;
        MCatDet             : TMCatDet;
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

constructor TMTpCto.Create( AOwner : TComponent );
begin Inherited;
   CVE_CTO_CRE :=CreaCampo('CVE_CTO_CRE',ftString,tsNinguno,tsNinguno,True);
      CVE_CTO_CRE.Caption:='Clave de Contrato';
      CVE_CTO_CRE.NoCompare:= False;
   DESC_L_CONTRATO :=CreaCampo('DESC_L_CONTRATO',ftString,tsNinguno,tsNinguno,True);
      DESC_L_CONTRATO.Caption:='Descripción de Contrato';
      DESC_L_CONTRATO.NoCompare:= True;
   CVE_PRODUCTO_CRE :=CreaCampo('CVE_PRODUCTO_CRE',ftString,tsNinguno,tsNinguno,True);
      CVE_PRODUCTO_CRE.Caption:='Clave de Producto';
      CVE_PRODUCTO_CRE.NoCompare:= True;
   CVE_ENCABEZADO :=CreaCampo('CVE_ENCABEZADO',ftString,tsNinguno,tsNinguno,True);
      CVE_ENCABEZADO.Caption:='Clave de Encabezado';
      CVE_ENCABEZADO.NoCompare:= True;
   CVE_DETALLE :=CreaCampo('CVE_DETALLE',ftString,tsNinguno,tsNinguno,True);
      CVE_DETALLE.Caption:='Clave de Detalle';
      CVE_DETALLE.NoCompare:= True;
   CVE_FIRMA :=CreaCampo('CVE_FIRMA',ftString,tsNinguno,tsNinguno,True);
      CVE_FIRMA.Caption:='Clave de Firma';
      CVE_FIRMA.NoCompare:= True;
   SIT_CONTRATO :=CreaCampo('SIT_CONTRATO',ftString,tsNinguno,tsNinguno,True);
   With SIT_CONTRATO do begin
      Size:=2;
      UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add('AC');
      ComboLista.Add('1'); ComboDatos.Add('IN');
   end;
      SIT_CONTRATO.Caption:='Situación de Contrato';
      SIT_CONTRATO.NoCompare:= True;
   CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      CVE_USU_ALTA.NoCompare:= True;
   F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
      F_ALTA.Caption:='Fecha de Alta';
      F_ALTA.NoCompare:= True;
   CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      CVE_USU_MODIFICA.NoCompare:= True;
   F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
      F_MODIFICA.Caption:='Fecha Modifica';
      F_MODIFICA.NoCompare:= True;

   FKeyFields.Add('CVE_CTO_CRE');
   TableName := 'CR_CT_CONTRATO_C';
   UseQuery := True;
   HelpFile := 'IntMTpCto.Hlp';
   ShowMenuReporte:=True;

   MCatFirma := TMCatFirma.Create(Self);
   MCatFirma.MasterSource := Self;
   MCatFirma.FieldByName('CVE_FIRMA').MasterField := 'CVE_FIRMA';

   MCatEncab := TMCatEncab.Create(Self);
   MCatEncab.MasterSource := Self;
   MCatEncab.FieldByName('CVE_ENCABEZADO').MasterField := 'CVE_ENCABEZADO';

   MCatDet := TMCatDet.Create(Self);
   MCatDet.MasterSource := Self;
   MCatDet.FieldByName('CVE_DETALLE').MasterField := 'CVE_DETALLE';

   Producto :=  TCrProduct.Create(Self);
   Producto.MasterSource:=Self;
   Producto.FieldByName('CVE_PRODUCTO_CRE').MasterField :='CVE_PRODUCTO_CRE';

end;


Destructor TMTpCto.Destroy;
begin
   If MCatFirma <> Nil Then
      MCatFirma.Free;
   If MCatEncab <> Nil Then
      MCatEncab.Free;
   If MCatDet <> Nil Then
      MCatDet.Free;
   If Producto <> Nil Then
      Producto.Free;
   Inherited;
end;

function TMTpCto.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMTpCto;
begin
   W:=TWMTpCto.Create(Self);
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

Function TMTpCto.InternalBusca:Boolean;
Var T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IMTpCto.it','S,S');
   Try
      if Active then begin
         T.Param(0,CVE_CTO_CRE.AsString);
      end;
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0)]);
   finally
      T.Free;
   end;
end;

function TMTpCto.Reporte:Boolean;
begin
   Result := False;
end;


(***********************************************FORMA CR_CT_CONTRATO_C********************)
(*                                                                              *)
(*  FORMA DE CR_CT_CONTRATO_C                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_CT_CONTRATO_C********************)

procedure TWMTpCto.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   With Objeto Do Begin
      CVE_CTO_CRE.Control      := edCVE_CTO_CRE;
      DESC_L_CONTRATO.Control  := edDESC_L_CONTRATO;
      CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO_CRE;
      CVE_ENCABEZADO.Control   := edCVE_ENCABEZADO;
      CVE_DETALLE.Control      := edCVE_DETALLE;
      CVE_FIRMA.Control        := edCVE_FIRMA;
      SIT_CONTRATO.Control     := rgSIT_CONTRATO;
      CVE_USU_ALTA.Control     := edCVE_USU_ALTA;
      F_ALTA.Control           := edF_ALTA;
      CVE_USU_MODIFICA.Control := edCVE_USU_MODIF;
      F_MODIFICA.Control       := edF_MODIFICA;
      InterForma1.MsgPanel     := PnlMsg;

      MCatFirma.CVE_FIRMA.Control :=edCVE_FIRMA;
      MCatFirma.DESC_L_BLOQUE.Control :=edNOM_FIRMA;
      MCatFirma.GetParams(Objeto);

      MCatEncab.CVE_ENCABEZADO.Control := edCVE_ENCABEZADO;
      MCatEncab.DESC_L_BLOQUE.Control := edNOM_CVE_ENCABEZADO;
      MCatEncab.GetParams(Objeto);

      MCatDet.CVE_DETALLE.Control := edCVE_DETALLE;
      MCatDet.DESC_L_BLOQUE.Control := edNOM_CVE_DETALLE;
      MCatDet.GetParams(Objeto);

      Producto.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO_CRE;
      Producto.DESC_C_PRODUCTO.Control := edNOM_CVE_PRODUCTO_CRE;
      Producto.GetParams(Objeto);

   End;
end;

procedure TWMTpCto.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      CVE_CTO_CRE.Control      := Nil;
      DESC_L_CONTRATO.Control  := Nil;
      CVE_PRODUCTO_CRE.Control := Nil;
      CVE_ENCABEZADO.Control   := Nil;
      CVE_DETALLE.Control      := Nil;
      CVE_FIRMA.Control        := Nil;
      SIT_CONTRATO.Control     := Nil;
      CVE_USU_ALTA.Control     := Nil;
      F_ALTA.Control           := Nil;
      CVE_USU_MODIFICA.Control := Nil;
      F_MODIFICA.Control       := Nil;
      InterForma1.MsgPanel     := Nil;

      MCatFirma.CVE_FIRMA.Control :=Nil;
      MCatFirma.DESC_L_BLOQUE.Control :=Nil;
      MCatEncab.CVE_ENCABEZADO.Control :=Nil;
      MCatEncab.DESC_L_BLOQUE.Control :=Nil;
      MCatDet.CVE_DETALLE.Control :=Nil;
      MCatDet.DESC_L_BLOQUE.Control:= Nil;
      Producto.CVE_PRODUCTO_CRE.Control :=nil;
      Producto.DESC_C_PRODUCTO.Control := nil;
   End;
end;

procedure TWMTpCto.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWMTpCto.InterForma1AntesAceptar(Sender: TObject;
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

procedure TWMTpCto.InterForma1Buscar(Sender: TObject);
begin
   With Objeto Do Begin
      InternalBusca;
   End;
end;

procedure TWMTpCto.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.F_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   rgSIT_CONTRATO.ItemIndex:= 0;
   edCVE_CTO_CRE.SetFocus;
end;

procedure TWMTpCto.rgSIT_CONTRATOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_CONTRATO,True,CNULL,True);
end;

procedure TWMTpCto.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.F_MODIFICA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
end;

procedure TWMTpCto.edCVE_FIRMAExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.CVE_FIRMA.GetFromControl;
      if Objeto.CVE_FIRMA.AsString = CNULL then
      Begin
         vlSalida   := False;
         vlMsg := 'Indique la clave de la Firma';
      end;
      InterForma1.ValidaExit(edCVE_FIRMA,vlSalida,vlMsg,True);
   end;
end;

procedure TWMTpCto.btFIRMAClick(Sender: TObject);
begin
   Objeto.MCatFirma.BuscaWhereString := ' CR_CT_FIRMA.SIT_FIRMA =''AC'' ';
   Objeto.MCatFirma.FilterString := Objeto.MCatFirma.BuscaWhereString;
   Objeto.MCatFirma.ShowAll := True;
   If Objeto.MCatFirma.Busca Then Begin
      InterForma1.NextTab(edCVE_FIRMA);
   End;
end;

procedure TWMTpCto.ilFIRMACapture(Sender: TObject; var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) or (InterForma1.IsNewData);
end;

procedure TWMTpCto.ilFIRMAEjecuta(Sender: TObject);
begin
   If Objeto.MCatFirma.FindKey([ilFIRMA.Buffer]) Then Begin
      InterForma1.NextTab(edCVE_FIRMA);
   End;
end;

procedure TWMTpCto.edCVE_CTO_CREExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
     vlsql     : String;
     vlCveDoc  : String;
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.CVE_CTO_CRE.GetFromControl;

      If Objeto.CVE_CTO_CRE.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Indique la clave del Contrato';
      End Else Begin
         vlSql := ' SELECT * FROM CR_CT_CONTRATO_C ' +
                  ' WHERE CVE_CTO_CRE ='+ Objeto.CVE_CTO_CRE.AsSQL;

         If InterForma1.IsNewData Then Begin
             GetSQLStr(vlSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'CVE_CTO_CRE',vlCveDoc,False);
             If (vlCveDoc <>'' ) Then Begin
                VLSalida := False;
                VLMsg   := 'La clave de Contrato ya Existe';
             End;
         End;
      End;
      InterForma1.ValidaExit(edCVE_CTO_CRE,vlSalida,vlMsg,True);
   End;
end;

procedure TWMTpCto.edDESC_L_CONTRATOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edDESC_L_CONTRATO,True,CNULL,True);
end;

procedure TWMTpCto.edCVE_PRODUCTO_CREExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edCVE_PRODUCTO_CRE,True,CNULL,True);
end;

procedure TWMTpCto.ilCVE_DETALLECapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) or (InterForma1.IsNewData);
end;

procedure TWMTpCto.ilCVE_ENCABEZADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) or (InterForma1.IsNewData);
end;

procedure TWMTpCto.ilPRODUCTOCapture(Sender: TObject; var Show: Boolean);
begin
   Show:= (InterForma1.CanEdit) or (InterForma1.IsNewData);
end;

procedure TWMTpCto.edCVE_ENCABEZADOExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.CVE_ENCABEZADO.GetFromControl;
      if Objeto.CVE_ENCABEZADO.AsString = CNULL then
      Begin
         vlSalida   := False;
         vlMsg := 'Indique la clave del encabezado';
      end;
      InterForma1.ValidaExit(edCVE_ENCABEZADO,vlSalida,vlMsg,True);
   end;
end;

procedure TWMTpCto.edCVE_DETALLEExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.CVE_DETALLE.GetFromControl;
      if Objeto.CVE_DETALLE.AsString = CNULL then
      Begin
         vlSalida   := False;
         vlMsg := 'Indique la clave del detalle';
      end;
      InterForma1.ValidaExit(edCVE_DETALLE,vlSalida,vlMsg,True);
   end;
end;

procedure TWMTpCto.btCVE_ENCABEZADOClick(Sender: TObject);
begin
   Objeto.MCatEncab.BuscaWhereString := ' CR_CT_ENCABEZADO.SIT_ENCABEZADO =''AC'' ';
   Objeto.MCatEncab.FilterString := Objeto.MCatEncab.BuscaWhereString;
   Objeto.MCatEncab.ShowAll := True;
   If Objeto.MCatEncab.Busca Then Begin
      InterForma1.NextTab(edCVE_ENCABEZADO);
   End;
end;

procedure TWMTpCto.ilCVE_ENCABEZADOEjecuta(Sender: TObject);
begin
   If Objeto.MCatEncab.FindKey([ilCVE_ENCABEZADO.Buffer]) Then Begin
      InterForma1.NextTab(edCVE_ENCABEZADO);
   End;
end;

procedure TWMTpCto.btCVE_DETALLEClick(Sender: TObject);
begin
   Objeto.MCatDet.BuscaWhereString := ' CR_CT_DETALLE.SIT_DETALLE =''AC'' ';
   Objeto.MCatDet.FilterString := Objeto.MCatDet.BuscaWhereString;
   Objeto.MCatDet.ShowAll := True;
   If Objeto.MCatDet.Busca Then Begin
      InterForma1.NextTab(edCVE_DETALLE);
   End;
end;

procedure TWMTpCto.ilCVE_DETALLEEjecuta(Sender: TObject);
begin
   If Objeto.MCatDet.FindKey([ilCVE_DETALLE.Buffer]) Then Begin
      InterForma1.NextTab(edCVE_DETALLE);
   End;
end;

procedure TWMTpCto.btCVE_PRODUCTO_CREClick(Sender: TObject);
begin
   Objeto.Producto.ShowAll := True;
   If Objeto.Producto.Busca then
      InterForma1.NextTab(edCVE_PRODUCTO_CRE);
end;

procedure TWMTpCto.ilPRODUCTOEjecuta(Sender: TObject);
begin
   If Objeto.Producto.FindKey([ilPRODUCTO.Buffer]) then
      InterForma1.NextTab(edCVE_PRODUCTO_CRE);
end;

procedure TWMTpCto.edDESC_L_CONTRATOKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key = #39 Then Key := #0;
end;

procedure TWMTpCto.edCVE_CTO_CREKeyPress(Sender: TObject; var Key: Char);
begin
   If Key = #39 Then Key := #0;
end;

end.
