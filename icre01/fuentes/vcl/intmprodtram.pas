// Sistema         : Clase de DO_PROD_TRAM
// Fecha de Inicio : 10/08/2004
// Función forma   : Clase de DO_PROD_TRAM
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMProdTram;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,
IntGenCre, IntParamCre, IntCrProduct, IntMTramite;

Type
 TMProdTram= class;

  TwMProdTram=Class(TForm)
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
    lbID_PROMOTOR: TLabel;
    edCVE_PRODUCTO_CRE: TEdit;
    btCVE_PRODUCTO_CRE: TBitBtn;
    edNOM_CVE_PRODUCTO_CRE: TEdit;
    ilCVE_PRODUCTO_CRE: TInterLinkit;
    edCVE_TRAMITE: TEdit;
    Label1: TLabel;
    GroupBox4: TGroupBox;
    lbF_ALTA: TLabel;
    lbF_MODIF: TLabel;
    lbUSUA_ALTA: TLabel;
    lbUSUA_MODIF: TLabel;
    edF_ALTA: TEdit;
    edF_MODIFICA: TEdit;
    edCVE_USUA_ALTA: TEdit;
    edCVE_USUA_MODIFICA: TEdit;
    rgSIT_REL_PRO_TRA: TRadioGroup;
    btCVE_TRAMITE: TBitBtn;
    edNOM_CVE_TRAMITE: TEdit;
    ilCVE_TRAMITE: TInterLinkit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1Buscar(Sender: TObject);
    procedure edCVE_PRODUCTO_CREExit(Sender: TObject);
    procedure btCVE_PRODUCTO_CREClick(Sender: TObject);
    procedure ilCVE_PRODUCTO_CRECapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_PRODUCTO_CREEjecuta(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure rgSIT_REL_PRO_TRAExit(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edCVE_TRAMITEExit(Sender: TObject);
    procedure ilCVE_TRAMITECapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_TRAMITEEjecuta(Sender: TObject);
    procedure btCVE_TRAMITEClick(Sender: TObject);

    private
    { Private declarations }
    public
    { Public declarations }
      Objeto : TMProdTram;
    end;

 TMProdTram= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        CVE_PRODUCTO_CRE         : TInterCampo;
        CVE_TRAMITE              : TInterCampo;
        SIT_REL_PRO_TRA          : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;

        ParamCre                 : TParamCre;
        Producto                 : TCrProduct;
        MTramite                 : TMTramite;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

implementation
{$R *.DFM}

constructor TMProdTram.Create( AOwner : TComponent );
begin Inherited;

   CVE_PRODUCTO_CRE :=CreaCampo('CVE_PRODUCTO_CRE',ftString,tsNinguno,tsNinguno,True);
      CVE_PRODUCTO_CRE.Caption:='Clave producto de crédito';
      CVE_PRODUCTO_CRE.NoCompare:= False;
   CVE_TRAMITE :=CreaCampo('CVE_TRAMITE',ftString,tsNinguno,tsNinguno,True);
      CVE_TRAMITE.Caption:='Clave de Trámite';
      CVE_TRAMITE.NoCompare:= False;
   SIT_REL_PRO_TRA :=CreaCampo('SIT_REL_PRO_TRA',ftString,tsNinguno,tsNinguno,True);
   With SIT_REL_PRO_TRA do begin
      Size:=2;
      UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add('AC');
      ComboLista.Add('1'); ComboDatos.Add('IN');
   end;
      SIT_REL_PRO_TRA.Caption:='Situación';
      SIT_REL_PRO_TRA.NoCompare:= True;

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
   FKeyFields.Add('CVE_TRAMITE');
   TableName := 'DO_PROD_TRAM';
   UseQuery := True;
   HelpFile := 'IntMProdTram.Hlp';
   ShowMenuReporte:=True;

   Producto := TCrProduct.Create(Self);
   Producto.MasterSource := Self;
   Producto.FieldByName('CVE_PRODUCTO_CRE').MasterField := 'CVE_PRODUCTO_CRE';

   MTramite := TMTramite.Create(Self);
   MTramite.MasterSource := Self;
   MTramite.FieldByName('CVE_TRAMITE').MasterField := 'CVE_TRAMITE';
end;


Destructor TMProdTram.Destroy;
begin
   If Producto <> Nil Then
      Producto.Free;
   If MTramite <> Nil Then
      MTramite.Free;
   Inherited;
end;

function TMProdTram.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMProdTram;
begin
   W:=TWMProdTram.Create(Self);
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

Function TMProdTram.InternalBusca:Boolean;
Var T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IMProdTram.it','S,S');
   Try
      if Active then begin
         T.Param(0,CVE_PRODUCTO_CRE.AsString);
         T.Param(1,CVE_TRAMITE.AsString);
      end;
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
   finally
      T.Free;
   end;
end;

function TMProdTram.Reporte:Boolean;
begin
   Result := False;
end;


(***********************************************FORMA DO_PROD_TRAM********************)
(*                                                                              *)
(*  FORMA DE DO_PROD_TRAM                                                            *)
(*                                                                              *)
(***********************************************FORMA DO_PROD_TRAM********************)

procedure TwMProdTram.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   With Objeto Do Begin
      CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO_CRE;
      CVE_TRAMITE.Control      := edCVE_TRAMITE;
      SIT_REL_PRO_TRA.Control  := rgSIT_REL_PRO_TRA;
      F_ALTA.Control           := edF_ALTA;
      CVE_USU_ALTA.Control     := edCVE_USUA_ALTA;
      F_MODIFICA.Control       := edF_MODIFICA;
      CVE_USU_MODIFICA.Control := edCVE_USUA_MODIFICA;
      InterForma1.MsgPanel := PnlMsg;

      Producto.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO_CRE;
      Producto.DESC_C_PRODUCTO.Control := edNOM_CVE_PRODUCTO_CRE;
      Producto.GetParams(Objeto);

      MTramite.CVE_TRAMITE.Control := edCVE_TRAMITE;
      MTramite.DESC_C_TRAMITE.Control:= edNOM_CVE_TRAMITE;
      MTramite.GetParams(Objeto);
   End;

end;

procedure TwMProdTram.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      CVE_PRODUCTO_CRE.Control := Nil;
      CVE_TRAMITE.Control      := Nil;
      SIT_REL_PRO_TRA.Control  := Nil;
      F_ALTA.Control           := Nil;
      CVE_USU_ALTA.Control     := Nil;
      F_MODIFICA.Control       := Nil;
      CVE_USU_MODIFICA.Control := Nil;
      InterForma1.MsgPanel     := NIL;

      Producto.CVE_PRODUCTO_CRE.Control := Nil;
      Producto.DESC_C_PRODUCTO.Control  := Nil;
      MTramite.CVE_TRAMITE.Control := Nil;
      MTramite.DESC_C_TRAMITE.Control := Nil;
   End;
end;

procedure TwMProdTram.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMProdTram.InterForma1AntesAceptar(Sender: TObject;
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

procedure TwMProdTram.InterForma1Buscar(Sender: TObject);
begin
   With Objeto Do Begin
      InternalBusca;
      Producto.FindKey([CVE_PRODUCTO_CRE.AsString]);
      MTramite.FindKey([Apli.IdEmpresa,CVE_TRAMITE.AsString]);
   End;
end;

procedure TwMProdTram.edCVE_PRODUCTO_CREExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.CVE_PRODUCTO_CRE.GetFromControl;
      if Objeto.CVE_PRODUCTO_CRE.AsString = CNULL then
      Begin
         vlSalida   := False;
         vlMsg := 'Indique la clave de Producto';
      end;
      InterForma1.ValidaExit(edCVE_PRODUCTO_CRE,vlSalida,vlMsg,True);
   end;
end;

procedure TwMProdTram.btCVE_PRODUCTO_CREClick(Sender: TObject);
begin
   Objeto.Producto.ShowAll := True;
   If Objeto.Producto.Busca Then Begin
      InterForma1.NextTab(edCVE_PRODUCTO_CRE);
   End;
end;

procedure TwMProdTram.ilCVE_PRODUCTO_CRECapture(Sender: TObject; var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TwMProdTram.ilCVE_PRODUCTO_CREEjecuta(Sender: TObject);
begin
   If Objeto.Producto.FindKey([ilCVE_PRODUCTO_CRE.Buffer]) Then Begin
      InterForma1.NextTab(edCVE_PRODUCTO_CRE);
   End;
end;

procedure TwMProdTram.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.F_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   rgSIT_REL_PRO_TRA.ItemIndex:= 0;
   edCVE_PRODUCTO_CRE.SetFocus;
end;

procedure TwMProdTram.rgSIT_REL_PRO_TRAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_REL_PRO_TRA,True,CNULL,True);
end;

procedure TwMProdTram.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.F_MODIFICA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
end;

procedure TwMProdTram.edCVE_TRAMITEExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
     vlsql     : String;
     vlCveDoc  : String;
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.CVE_TRAMITE.GetFromControl;
      If Objeto.CVE_TRAMITE.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Indique la clave de Trámite';
      End Else Begin

         vlSql := ' SELECT * FROM DO_PROD_TRAM ' +
                  ' WHERE CVE_PRODUCTO_CRE ='+ Objeto.CVE_PRODUCTO_CRE.AsSQL+
                  ' AND CVE_TRAMITE ='+ Objeto.CVE_TRAMITE.AsSQL;
         If InterForma1.IsNewData Then Begin
             GetSQLStr(vlSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'CVE_TRAMITE',vlCveDoc,False);
             If (vlCveDoc <>'' ) Then Begin
                VLSalida := False;
                VLMsg   := 'La relación Producto - Trámite ya Existe';
             End;
         End;
      End;
      InterForma1.ValidaExit(edCVE_TRAMITE,vlSalida,vlMsg,True);
   End;
end;

procedure TwMProdTram.ilCVE_TRAMITECapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TwMProdTram.ilCVE_TRAMITEEjecuta(Sender: TObject);
begin
   If Objeto.MTramite.FindKey([ilCVE_TRAMITE.Buffer]) Then Begin
      InterForma1.NextTab(edCVE_TRAMITE);
   End;
end;

procedure TwMProdTram.btCVE_TRAMITEClick(Sender: TObject);
begin
   Objeto.MTramite.ShowAll := True;
   If Objeto.MTramite.Busca Then Begin
      InterForma1.NextTab(edCVE_TRAMITE);
   End;
end;

end.
