// Sistema         : Clase de CR_CT_USU_FIRMA
// Fecha de Inicio : 21/05/2004
// Función forma   : Clase de CR_CT_USU_FIRMA
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMUsuFirma;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,
IntGenCre, IntParamCre, IntMCatFirma, IntUsuario;

Type
 TMUsuFirma= class;

  TWMUsuFirma=Class(TForm)
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
    rgSIT_USU_FIRMA: TRadioGroup;
    btFIRMA: TBitBtn;
    edNOM_FIRMA: TEdit;
    ilFIRMA: TInterLinkit;
    Label2: TLabel;
    edCVE_USUARIO: TEdit;
    btUSUARIO: TBitBtn;
    edNOM_USUARIO: TEdit;
    ilUSUARIO: TInterLinkit;
    rgCVE_TIPO_ROL: TRadioGroup;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure rgSIT_USU_FIRMAExit(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edCVE_FIRMAExit(Sender: TObject);
    procedure InterForma1AntesEliminar(Sender: TObject;
      var Realizado: Boolean);
    procedure edCVE_USUARIOExit(Sender: TObject);
    procedure btFIRMAClick(Sender: TObject);
    procedure ilFIRMACapture(Sender: TObject; var Show: Boolean);
    procedure ilUSUARIOCapture(Sender: TObject; var Show: Boolean);
    procedure ilFIRMAEjecuta(Sender: TObject);
    procedure btUSUARIOClick(Sender: TObject);
    procedure ilUSUARIOEjecuta(Sender: TObject);

    private
    { Private declarations }
    public
    { Public declarations }
      Objeto : TMUsuFirma;
    end;

 TMUsuFirma= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        CVE_FIRMA           : TInterCampo;
        CVE_USUARIO         : TInterCampo;
        CVE_TIPO_ROL        : TInterCampo;
        SIT_USU_FIRMA       : TInterCampo;
        CVE_USU_ALTA        : TInterCampo;
        F_ALTA              : TInterCampo;
        CVE_USU_MODIFICA    : TInterCampo;
        F_MODIFICA          : TInterCampo;

        ParamCre            : TParamCre;
        MCatFirma           : TMCatFirma;
        Usuario             : TUsuario;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

implementation
{$R *.DFM}

constructor TMUsuFirma.Create( AOwner : TComponent );
begin Inherited;
   CVE_FIRMA :=CreaCampo('CVE_FIRMA',ftString,tsNinguno,tsNinguno,True);
      CVE_FIRMA.Caption:='Clave de Firma';
      CVE_FIRMA.NoCompare:= False;
   CVE_USUARIO :=CreaCampo('CVE_USUARIO',ftString,tsNinguno,tsNinguno,True);
      CVE_USUARIO.Caption:='Clave de Usuario';
      CVE_USUARIO.NoCompare:= False;
   CVE_TIPO_ROL :=CreaCampo('CVE_TIPO_ROL',ftString,tsNinguno,tsNinguno,True);
   With CVE_TIPO_ROL do begin
      Size:=2;
      UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add('AP');
      ComboLista.Add('1'); ComboDatos.Add('TE');
   end;
      CVE_TIPO_ROL.Caption:='Clave de Tipo de Rol';
      CVE_TIPO_ROL.NoCompare:= True;
   SIT_USU_FIRMA :=CreaCampo('SIT_USU_FIRMA',ftString,tsNinguno,tsNinguno,True);
   With SIT_USU_FIRMA do begin
      Size:=2;
      UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add('AC');
      ComboLista.Add('1'); ComboDatos.Add('IN');
   end;
      SIT_USU_FIRMA.Caption:='Situación de Rel. Usu Firma';
      SIT_USU_FIRMA.NoCompare:= True;
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

   FKeyFields.Add('CVE_FIRMA');
   FKeyFields.Add('CVE_USUARIO');
   TableName := 'CR_CT_USU_FIRMA';
   UseQuery := True;
   HelpFile := 'IntMUsuFirma.Hlp';
   ShowMenuReporte:=True;

   MCatFirma := TMCatFirma.Create(Self);
   MCatFirma.MasterSource := Self;
   MCatFirma.FieldByName('CVE_FIRMA').MasterField := 'CVE_FIRMA';

   Usuario := TUsuario.Create(Self);
   Usuario.MasterSource := Self;
   Usuario.FieldByName('CVE_USUARIO').MasterField := 'CVE_USUARIO';
end;


Destructor TMUsuFirma.Destroy;
begin
   if MCatFirma <> nil then
      MCatFirma.Free;
   Inherited;
end;

function TMUsuFirma.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMUsuFirma;
begin
   W:=TWMUsuFirma.Create(Self);
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

Function TMUsuFirma.InternalBusca:Boolean;
Var T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IMUsuFirma.it','S,S');
   Try
      if Active then begin
         T.Param(0,CVE_FIRMA.AsString);
         T.Param(1,CVE_USUARIO.AsString);
      end;
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
   finally
      T.Free;
   end;
end;

function TMUsuFirma.Reporte:Boolean;
begin
   Result := False;
end;


(***********************************************FORMA CR_CT_USU_FIRMA********************)
(*                                                                              *)
(*  FORMA DE CR_CT_USU_FIRMA                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_CT_USU_FIRMA********************)

procedure TWMUsuFirma.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   With Objeto Do Begin
      CVE_FIRMA.Control        := edCVE_FIRMA;
      CVE_USUARIO.Control      := edCVE_USUARIO;
      CVE_TIPO_ROL.Control     := rgCVE_TIPO_ROL;
      SIT_USU_FIRMA.Control    := rgSIT_USU_FIRMA;
      CVE_USU_ALTA.Control     := edCVE_USU_ALTA;
      F_ALTA.Control           := edF_ALTA;
      CVE_USU_MODIFICA.Control := edCVE_USU_MODIF;
      F_MODIFICA.Control       := edF_MODIFICA;
      InterForma1.MsgPanel     := PnlMsg;

      MCatFirma.CVE_FIRMA.Control :=edCVE_FIRMA;
      MCatFirma.DESC_L_BLOQUE.Control :=edNOM_FIRMA;
      MCatFirma.GetParams(Objeto);

      Usuario.CVE_USUARIO.Control := edCVE_USUARIO;
      Usuario.EMPLEADO.Persona.Nombre.Control := edNOM_USUARIO;

   End;
end;

procedure TWMUsuFirma.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      CVE_FIRMA.Control        := Nil;
      CVE_USUARIO.Control      := Nil;
      CVE_TIPO_ROL.Control     := Nil;
      SIT_USU_FIRMA.Control    := Nil;
      CVE_USU_ALTA.Control     := Nil;
      F_ALTA.Control           := Nil;
      CVE_USU_MODIFICA.Control := Nil;
      F_MODIFICA.Control       := Nil;
      InterForma1.MsgPanel     := Nil;

      MCatFirma.CVE_FIRMA.Control :=Nil;
      MCatFirma.DESC_L_BLOQUE.Control :=Nil;

      Usuario.CVE_USUARIO.Control := Nil;
      Usuario.EMPLEADO.Persona.Nombre.Control := Nil;
   End;
end;

procedure TWMUsuFirma.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWMUsuFirma.InterForma1AntesAceptar(Sender: TObject;
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

procedure TWMUsuFirma.InterForma1Buscar(Sender: TObject);
begin
   With Objeto Do Begin
      InternalBusca;
      MCatFirma.FindKey([CVE_FIRMA.AsString]);
      Usuario.FindKey([CVE_USUARIO.AsString]);     
   End;
end;

procedure TWMUsuFirma.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.F_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   rgCVE_TIPO_ROL.ItemIndex:= 0;
   rgSIT_USU_FIRMA.ItemIndex:= 0;
   edCVE_FIRMA.SetFocus;
end;

procedure TWMUsuFirma.rgSIT_USU_FIRMAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_USU_FIRMA,True,CNULL,True);
end;

procedure TWMUsuFirma.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.F_MODIFICA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
end;

procedure TWMUsuFirma.edCVE_FIRMAExit(Sender: TObject);
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

procedure TWMUsuFirma.InterForma1AntesEliminar(Sender: TObject;
  var Realizado: Boolean);
Var
   sSQL:String;
   qyQuery:TQuery;
begin
   sSQL:=' SELECT * FROM CR_CT_CONTRATO_C '+
         '  WHERE CVE_FIRMA ='+ Objeto.CVE_FIRMA.AsSQL ;
   qyQuery:= GetSQLQuery(sSQL,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,False);
   If qyQuery <> Nil Then Begin
      ShowMessage('La Firma '''+ Objeto.CVE_FIRMA.AsString+
                  ''' tiene registros asociados, No puede ser eliminado');
      qyQuery.Free;
      Realizado:=False;
   End Else
      Realizado:=True;
end;
procedure TWMUsuFirma.edCVE_USUARIOExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
     vlsql     : String;
     vlCveDoc  : String;
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.CVE_USUARIO.GetFromControl;

      If Objeto.CVE_USUARIO.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Indique la clave del Usuario';
      End Else Begin
         vlSql := ' SELECT * FROM CR_CT_USU_FIRMA ' +
                  ' WHERE CVE_FIRMA ='+ Objeto.CVE_FIRMA.AsSQL +
                  '   AND CVE_USUARIO ='+ Objeto.CVE_USUARIO.AsSQL;

         If InterForma1.IsNewData Then Begin
             GetSQLStr(vlSql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'CVE_USUARIO',vlCveDoc,False);
             If (vlCveDoc <>'' ) Then Begin
                VLSalida := False;
                VLMsg   := 'La Relación entre FIRMA-USUARIO ya Existe';
             End;
         End;
      End;
      InterForma1.ValidaExit(edCVE_USUARIO,vlSalida,vlMsg,True);
   End;
end;

procedure TWMUsuFirma.btFIRMAClick(Sender: TObject);
begin
   Objeto.MCatFirma.BuscaWhereString := ' CR_CT_FIRMA.SIT_FIRMA =''AC'' ';
   Objeto.MCatFirma.FilterString := Objeto.MCatFirma.BuscaWhereString;
   Objeto.MCatFirma.ShowAll := True;
   If Objeto.MCatFirma.Busca Then Begin
      InterForma1.NextTab(edCVE_FIRMA);
   End;
end;

procedure TWMUsuFirma.ilFIRMACapture(Sender: TObject; var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWMUsuFirma.ilUSUARIOCapture(Sender: TObject; var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWMUsuFirma.ilFIRMAEjecuta(Sender: TObject);
begin
   If Objeto.MCatFirma.FindKey([ilFIRMA.Buffer]) Then Begin
      InterForma1.NextTab(edCVE_FIRMA);
   End;
end;

procedure TWMUsuFirma.btUSUARIOClick(Sender: TObject);
begin
   Objeto.Usuario.ShowAll := True;
   If Objeto.Usuario.Busca Then Begin
      InterForma1.NextTab(edCVE_USUARIO);
   End;
end;

procedure TWMUsuFirma.ilUSUARIOEjecuta(Sender: TObject);
begin
   If Objeto.Usuario.FindKey([ilUSUARIO.Buffer]) Then Begin
      InterForma1.NextTab(edCVE_USUARIO);
   End;
end;

end.
