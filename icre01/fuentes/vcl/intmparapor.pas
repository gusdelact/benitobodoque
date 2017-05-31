// Sistema         : Clase de CR_GA_PAR_APOR
// Fecha de Inicio : 06/07/2004
// Función forma   : Clase de CR_GA_PAR_APOR
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMParApor;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,IntGenCre,
IntParamCre, InterEdit, IntCrRePrMn, IntMRegistro, IntMTipoRamo;

Type
 TMParApor= class;

  TwMParApor=Class(TForm)
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
    GroupBox4: TGroupBox;
    lbF_ALTA: TLabel;
    lbF_MODIF: TLabel;
    lbUSUA_ALTA: TLabel;
    lbUSUA_MODIF: TLabel;
    edF_ALTA: TEdit;
    edF_MODIFICA: TEdit;
    edCVE_USU_ALTA: TEdit;
    edCVE_USU_MODIF: TEdit;
    rgSITUACION: TRadioGroup;
    Label6: TLabel;
    edID_SOLICITUD: TInterEdit;
    btID_SOLICITUD: TBitBtn;
    edNOM_ID_SOLICITUD: TEdit;
    ilID_SOLICITUD: TInterLinkit;
    edCVE_GARANTIA: TEdit;
    Label3: TLabel;
    edNOM_CEDENTE: TEdit;
    Label1: TLabel;
    edCVE_TIPO_RAMO: TEdit;
    btCVE_TIPO_RAMO: TBitBtn;
    edDESC_RAMO: TEdit;
    ilCVE_TIPO_RAMO: TInterLinkit;
    edCUENTA_BANCO: TEdit;
    Label2: TLabel;
    edID_CONTRATO: TInterEdit;
    Label4: TLabel;
    cbxB_FIDE_MAESTRO: TCheckBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure rgSITUACIONExit(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure edID_SOLICITUDExit(Sender: TObject);
    procedure ilID_SOLICITUDCapture(Sender: TObject; var Show: Boolean);
    procedure ilID_SOLICITUDEjecuta(Sender: TObject);
    procedure btID_SOLICITUDClick(Sender: TObject);
    procedure edNOM_CEDENTEExit(Sender: TObject);
    procedure edCVE_TIPO_RAMOExit(Sender: TObject);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure btCVE_TIPO_RAMOClick(Sender: TObject);
    procedure ilCVE_TIPO_RAMOCapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_TIPO_RAMOEjecuta(Sender: TObject);
    procedure edCUENTA_BANCOExit(Sender: TObject);
    procedure edID_CONTRATOExit(Sender: TObject);
    procedure cbxB_FIDE_MAESTROExit(Sender: TObject);

    private
    { Private declarations }
    public
    { Public declarations }
      Objeto : TMParApor;
    end;

 TMParApor= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        ID_SOLICITUD        : TInterCampo;
        CVE_TIPO_RAMO       : TInterCampo;
        NOM_CEDENTE         : TInterCampo;
        SIT_PAR_APOR        : TInterCampo;
        F_ALTA              : TInterCampo;
        CVE_USU_ALTA        : TInterCampo;
        F_MODIFICA          : TInterCampo;
        CVE_USU_MODIFICA    : TInterCampo;
        CUENTA_BANCO        : TInterCampo;
        ID_CONTRATO         : TInterCampo;
        B_FIDE_MAESTRO      : TInterCampo;

        ParamCre            : TParamCre;
        MRegistro           : TMRegistro;
        MTipoRamo           : TMTipoRamo;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

implementation
{$R *.DFM}

constructor TMParApor.Create( AOwner : TComponent );
begin Inherited;
   ID_SOLICITUD :=CreaCampo('ID_SOLICITUD',ftFloat,tsNinguno,tsNinguno,True);
      ID_SOLICITUD.Caption:='Identificador del registro de la garantía';
   CVE_TIPO_RAMO :=CreaCampo('CVE_TIPO_RAMO',ftString,tsNinguno,tsNinguno,True);
      CVE_TIPO_RAMO.Caption:='Clave de Ramo';
      CVE_TIPO_RAMO.NoCompare:= True;
   NOM_CEDENTE :=CreaCampo('NOM_CEDENTE',ftString,tsNinguno,tsNinguno,True);
      NOM_CEDENTE.Caption:='Nombre de cedente';
      NOM_CEDENTE.NoCompare:= True;
   SIT_PAR_APOR :=CreaCampo('SIT_PAR_APOR',ftString,tsNinguno,tsNinguno,True);
   With SIT_PAR_APOR Do Begin
      Size:=2;
      UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add('AC');
      ComboLista.Add('1'); ComboDatos.Add('IN');
   end;
      SIT_PAR_APOR.Caption:='Situación';
      SIT_PAR_APOR.NoCompare:= True;
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
   CUENTA_BANCO :=CreaCampo('CUENTA_BANCO',ftString,tsNinguno,tsNinguno,True);
      CUENTA_BANCO.Caption:='Cuenta de banco';
      CUENTA_BANCO.NoCompare:= True;
   ID_CONTRATO :=CreaCampo('ID_CONTRATO',ftString,tsNinguno,tsNinguno,True);
      ID_CONTRATO.Caption:='Contrato Casa de Bolsa';
      ID_CONTRATO.NoCompare:= True;
   B_FIDE_MAESTRO :=CreaCampo('B_FIDE_MAESTRO',ftString,tsNinguno,tsNinguno,True);
      B_FIDE_MAESTRO.Caption:='Indica si fideicomiso maestro';
      B_FIDE_MAESTRO.NoCompare:= True;

   FKeyFields.Add('ID_SOLICITUD');
   TableName := 'CR_GA_PAR_APOR';
   UseQuery := True;
   HelpFile := 'IntMParApor.Hlp';
   ShowMenuReporte:=True;

   MRegistro := TMRegistro.Create(Self);
   MRegistro.MasterSource:=Self;
   MRegistro.FieldByName('ID_SOLICITUD').MasterField:='ID_SOLICITUD';

   MTipoRamo := TMTipoRamo.Create(Self);
   MTipoRamo.MasterSource:=Self;
   MTipoRamo.FieldByName('CVE_TIPO_RAMO').MasterField:='CVE_TIPO_RAMO';
end;


Destructor TMParApor.Destroy;
begin
//   If MRegistro <> Nil Then
//      MRegistro.Free;
   If MTipoRamo <> Nil Then
      MTipoRamo.Free;
   Inherited;
end;

function TMParApor.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMParApor;
begin
   W:=TWMParApor.Create(Self);
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

Function TMParApor.InternalBusca:Boolean;
Var T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IMParApor.it','I');
   Try
      if Active then begin
         T.Param(0,ID_SOLICITUD.AsString);
      end;
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0)]);
   finally
      T.Free;
   end;
end;

function TMParApor.Reporte:Boolean;
begin
   Result := False;
end;


(***********************************************FORMA CR_GA_PAR_APOR********************)
(*                                                                              *)
(*  FORMA DE CR_GA_PAR_APOR                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_GA_PAR_APOR********************)

procedure TwMParApor.FormShow(Sender: TObject);
begin
   InterForma1.BtnNuevo.Visible:= False;
   
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   With Objeto Do Begin
      ID_SOLICITUD.Control        := edID_SOLICITUD;
      CVE_TIPO_RAMO.Control       := edCVE_TIPO_RAMO;
      NOM_CEDENTE.Control         := edNOM_CEDENTE;
      SIT_PAR_APOR.Control        := rgSITUACION;
      F_ALTA.Control              := edF_ALTA;
      CVE_USU_ALTA.Control        := edCVE_USU_ALTA;
      F_MODIFICA.Control          := edF_MODIFICA;
      CVE_USU_MODIFICA.Control    := edCVE_USU_MODIF;

      CUENTA_BANCO.Control        := edCUENTA_BANCO;
      ID_CONTRATO.Control         := edID_CONTRATO;
      B_FIDE_MAESTRO.Control      := cbxB_FIDE_MAESTRO;

      InterForma1.MsgPanel        := PnlMsg;

      MRegistro.ID_SOLICITUD.Control := edID_SOLICITUD;
      MRegistro.CVE_GARANTIA.Control := edCVE_GARANTIA;
      MRegistro.Garantia.DESC_GARANTIA.Control := edNOM_ID_SOLICITUD;
      MRegistro.GetParams(Objeto);

      MTipoRamo.CVE_TIPO_RAMO.Control:= edCVE_TIPO_RAMO;
      MTipoRamo.DESC_TIPO_RAMO.Control:= edDESC_RAMO;
      MTipoRamo.GetParams(Objeto);
   End;
end;

procedure TwMParApor.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      ID_SOLICITUD.Control        := Nil;
      CVE_TIPO_RAMO.Control            := Nil;
      NOM_CEDENTE.Control         := Nil;
      SIT_PAR_APOR.Control        := Nil;
      F_ALTA.Control              := Nil;
      CVE_USU_ALTA.Control        := Nil;
      F_MODIFICA.Control          := Nil;
      CVE_USU_MODIFICA.Control    := Nil;
      CUENTA_BANCO.Control        := Nil;
      ID_CONTRATO.Control         := Nil;
      B_FIDE_MAESTRO.Control      := Nil;
      InterForma1.MsgPanel        := Nil;

      MRegistro.ID_SOLICITUD.Control := Nil;
      MRegistro.CVE_GARANTIA.Control := Nil;
      MRegistro.Garantia.DESC_GARANTIA.Control := Nil;

      MTipoRamo.CVE_TIPO_RAMO.Control := Nil;
      MTipoRamo.DESC_TIPO_RAMO.Control := Nil;
   End;
end;

procedure TwMParApor.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMParApor.InterForma1Buscar(Sender: TObject);
Var
   sSQL: String;
   qyQuery: TQuery;
begin
   With Objeto Do Begin
      InternalBusca;
      sSQL:=' SELECT ID_ACREDITADO FROM CR_GA_REGISTRO WHERE ID_SOLICITUD='+ Objeto.ID_SOLICITUD.AsSQL ;
      qyQuery:= GetSQLQueryNoNil(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
      If qyQuery <> Nil Then Begin
         If qyQuery.FieldByName('ID_ACREDITADO').AsInteger <> 0 Then Begin
            MRegistro.FindKey([Objeto.ID_SOLICITUD.AsInteger,qyQuery.FieldByName('ID_ACREDITADO').AsInteger]);
         End;
         qyQuery.Free;
      End;
   End;
end;

procedure TwMParApor.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.F_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   cbxB_FIDE_MAESTRO.Checked:= False;
   edID_SOLICITUD.SetFocus;
   rgSITUACION.ItemIndex:= 0;

   If Objeto.MRegistro.ID_SOLICITUD.AsInteger <> 0 Then Begin
      Objeto.ID_SOLICITUD.AsInteger:= Objeto.MRegistro.ID_SOLICITUD.AsInteger;
      edNOM_CEDENTE.SetFocus;
   End;

end;

procedure TwMParApor.rgSITUACIONExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSITUACION,True,CNULL,True);
end;

procedure TwMParApor.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.F_MODIFICA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
   edNOM_CEDENTE.SetFocus;
end;

procedure TwMParApor.InterForma1AntesAceptar(Sender: TObject;
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

procedure TwMParApor.edID_SOLICITUDExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg, sSQL     :  String;
     qyQuery : TQuery;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.ID_SOLICITUD.GetFromControl;
      If Objeto.ID_SOLICITUD.AsFloat = 0 Then Begin
         vlSalida   := False;
         vlMsg := 'Debe seleccionar un registro de garantía';
      End Else Begin
         sSQL:= 'SELECT * FROM CR_GA_PAR_APOR WHERE ID_SOLICITUD='+Objeto.ID_SOLICITUD.AsSQL;
         qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName,Objeto.Apli.SessionName, False);
         If InterForma1.IsNewData Then Begin
            If qyQuery <> Nil Then Begin
               If qyQuery.FieldByName('ID_SOLICITUD').AsInteger = Objeto.ID_SOLICITUD.AsInteger Then Begin
                  vlSalida   := False;
                  vlMsg := 'El de registro de garantía ya existe en la categoría de garantías de Participaciones/Aportaciones Federales';
               End;
               qyQuery.Free;
            End;
         End;
      End;
      InterForma1.ValidaExit(edID_SOLICITUD,vlSalida,vlMsg,True);
   End;
end;

procedure TwMParApor.ilID_SOLICITUDCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit)and (InterForma1.IsNewData);
end;

procedure TwMParApor.ilID_SOLICITUDEjecuta(Sender: TObject);
begin
   If Objeto.MRegistro.FindKey([ilID_SOLICITUD.Buffer]) Then Begin
      InterForma1.NextTab(edID_SOLICITUD);
   End;
end;

procedure TwMParApor.btID_SOLICITUDClick(Sender: TObject);
begin
   Objeto.MRegistro.ShowAll := True;
   If Objeto.MRegistro.Busca Then Begin
      InterForma1.NextTab(edID_SOLICITUD);
   End;
end;

procedure TwMParApor.edNOM_CEDENTEExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.NOM_CEDENTE.GetFromControl;
      If Objeto.NOM_CEDENTE.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar el nombre del cedente';
      End;
      InterForma1.ValidaExit(edNOM_CEDENTE,vlSalida,vlMsg,True);
   End;
end;

procedure TwMParApor.edCVE_TIPO_RAMOExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.CVE_TIPO_RAMO.GetFromControl;
      If Objeto.CVE_TIPO_RAMO.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar la clave del tipo de ramo';
      End;
      InterForma1.ValidaExit(edCVE_TIPO_RAMO,vlSalida,vlMsg,True);
   End;
end;

procedure TwMParApor.InterForma1DespuesEliminar(Sender: TObject);
begin
   edCVE_GARANTIA.Text:='';
   edNOM_ID_SOLICITUD.Text:='';
end;

procedure TwMParApor.InterForma1DespuesShow(Sender: TObject);
begin
   If Objeto.MRegistro.ID_SOLICITUD.AsInteger <> 0 Then Begin
      edNOM_CEDENTE.SetFocus;
   End;
end;

procedure TwMParApor.btCVE_TIPO_RAMOClick(Sender: TObject);
begin
   Objeto.MTipoRamo.ShowAll := True;
   If Objeto.MTipoRamo.Busca Then Begin
      InterForma1.NextTab(edCVE_TIPO_RAMO);
   End;
end;

procedure TwMParApor.ilCVE_TIPO_RAMOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit)or(InterForma1.IsNewData);
end;

procedure TwMParApor.ilCVE_TIPO_RAMOEjecuta(Sender: TObject);
begin
   If Objeto.MTipoRamo.FindKey([ilCVE_TIPO_RAMO.Buffer]) Then Begin
      InterForma1.NextTab(edCVE_TIPO_RAMO);
   End;
end;

procedure TwMParApor.edCUENTA_BANCOExit(Sender: TObject);
Begin
   If Trim(edCUENTA_BANCO.Text)<> '' Then Begin
      edID_CONTRATO.ReadOnly:= True;
   End Else Begin
      edID_CONTRATO.ReadOnly:= False;
   End;
   InterForma1.ValidaExit(edCUENTA_BANCO,True,'',True);
end;

procedure TwMParApor.edID_CONTRATOExit(Sender: TObject);
begin
   If Trim(edID_CONTRATO.Text)<> '' Then Begin
      edCUENTA_BANCO.ReadOnly:= True;
   End Else Begin
      edCUENTA_BANCO.ReadOnly:= False;
   End;
   InterForma1.ValidaExit(edID_CONTRATO,True,'',True);
end;

procedure TwMParApor.cbxB_FIDE_MAESTROExit(Sender: TObject);
begin
   InterForma1.ValidaExit(cbxB_FIDE_MAESTRO,True,'',True);
end;

end.
