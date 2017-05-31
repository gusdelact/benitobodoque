// Sistema         : Clase de CR_GA_PRENDARIAS
// Fecha de Inicio : 05/07/2004
// Función forma   : Clase de CR_GA_PRENDARIAS
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMPrend;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,IntGenCre,
IntParamCre, InterEdit, IntCrRePrMn, IntMRegistro, IntEmisora,
IntCrCto, IntCtto;

Type
 TMPrend= class;

  TwMPrend=Class(TForm)
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
    edNOMBRE_OTORGANTE: TEdit;
    Label7: TLabel;
    edID_SOLICITUD: TInterEdit;
    btID_SOLICITUD: TBitBtn;
    edNOM_ID_SOLICITUD: TEdit;
    ilID_SOLICITUD: TInterLinkit;
    Label2: TLabel;
    edID_CONTRATO: TInterEdit;
    btID_CONTRATO: TBitBtn;
    edNOM_ID_CONTRATO: TEdit;
    ilID_CONTRATO: TInterLinkit;
    lbIMP_DEPOSITO: TLabel;
    edIMP_DEPOSITO: TInterEdit;
    Label4: TLabel;
    Label14: TLabel;
    edEMISORA: TEdit;
    btEMISORA: TBitBtn;
    edSERIE: TEdit;
    edTIPO_VALOR: TEdit;
    ilEMISORA: TInterLinkit;
    edIMP_VALUACION: TInterEdit;
    Label1: TLabel;
    edCVE_GARANTIA: TEdit;
    edNUM_ACC_TIT: TInterEdit;
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
    procedure edNOMBRE_OTORGANTEExit(Sender: TObject);
    procedure btEMISORAClick(Sender: TObject);
    procedure ilEMISORAEjecuta(Sender: TObject);
    procedure ilEMISORACapture(Sender: TObject; var Show: Boolean);
    procedure edID_CONTRATOExit(Sender: TObject);
    procedure edIMP_DEPOSITOExit(Sender: TObject);
    procedure edNUM_ACC_TITExit(Sender: TObject);
    procedure btEMISORAExit(Sender: TObject);
    procedure edIMP_VALUACIONExit(Sender: TObject);
    procedure btID_CONTRATOClick(Sender: TObject);
    procedure ilID_CONTRATOEjecuta(Sender: TObject);
    procedure ilID_CONTRATOCapture(Sender: TObject; var Show: Boolean);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);

    private
      Procedure ObtPrecioMerc;
      Procedure CambioControl;
      Procedure BuscaEmisora; // SATV4766
    { Private declarations }
    public
    { Public declarations }
      Objeto : TMPrend;
    end;

 TMPrend= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        ID_SOLICITUD        : TInterCampo;
        ID_CONTRATO         : TInterCampo;
        NOMBRE_OTORGANTE    : TInterCampo;
        IMP_DEPOSITO        : TInterCampo;
        NUM_ACC_TIT         : TInterCampo;
        EMISORA             : TInterCampo;
        SERIE               : TInterCampo;
        TIPO_VALOR          : TInterCampo;
        IMP_VALUACION       : TInterCampo;
        SIT_PRENDARIAS      : TInterCampo;
        F_ALTA              : TInterCampo;
        CVE_USU_ALTA        : TInterCampo;
        F_MODIFICA          : TInterCampo;
        CVE_USU_MODIFICA    : TInterCampo;

        ParamCre            : TParamCre;
        MRegistro           : TMRegistro;
        MEmisora            : TEmisora;
        Autorizacion        : TContrato;

        function ObtenClavePRLV : String;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

implementation
{$R *.DFM}

constructor TMPrend.Create( AOwner : TComponent );
begin Inherited;
   ID_SOLICITUD :=CreaCampo('ID_SOLICITUD',ftFloat,tsNinguno,tsNinguno,True);
      ID_SOLICITUD.Caption:='Identificador del  inmueble';
   ID_CONTRATO :=CreaCampo('ID_CONTRATO',ftFloat,tsNinguno,tsNinguno,True);
      ID_CONTRATO.Caption:='Identificador del Contrato';
      ID_CONTRATO.NoCompare:= True;
   NOMBRE_OTORGANTE :=CreaCampo('NOMBRE_OTORGANTE',ftString,tsNinguno,tsNinguno,True);
      NOMBRE_OTORGANTE.Caption:='Nombre del Otorgante';
      NOMBRE_OTORGANTE.NoCompare:= True;
   IMP_DEPOSITO :=CreaCampo('IMP_DEPOSITO',ftFloat,tsNinguno,tsNinguno,True);
      IMP_DEPOSITO.Caption:='Importe del depósito';
      IMP_DEPOSITO.NoCompare:= True;
   NUM_ACC_TIT :=CreaCampo('NUM_ACC_TIT',ftFloat,tsNinguno,tsNinguno,True);
      NUM_ACC_TIT.Caption:='Número de acciones/títulos';
      NUM_ACC_TIT.NoCompare:= True;
   EMISORA :=CreaCampo('EMISORA',ftString,tsNinguno,tsNinguno,True);
      EMISORA.Caption:='EMISORA';
      EMISORA.NoCompare:= True;
   SERIE :=CreaCampo('SERIE',ftString,tsNinguno,tsNinguno,True);
      SERIE.Caption:='SERIE';
      SERIE.NoCompare:= True;
   TIPO_VALOR :=CreaCampo('TIPO_VALOR',ftString,tsNinguno,tsNinguno,True);
      TIPO_VALOR.Caption:='TIPO_VALOR';
      TIPO_VALOR.NoCompare:= True;
   IMP_VALUACION :=CreaCampo('IMP_VALUACION',ftFloat,tsNinguno,tsNinguno,True);
      IMP_VALUACION.Caption:='Importe de la valuación';
      IMP_VALUACION.NoCompare:= True;
   SIT_PRENDARIAS :=CreaCampo('SIT_PRENDARIAS',ftString,tsNinguno,tsNinguno,True);
   With SIT_PRENDARIAS do begin
      Size:=2;
      UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add('AC');
      ComboLista.Add('1'); ComboDatos.Add('IN');
   end;
      SIT_PRENDARIAS.Caption:='Situación';
      SIT_PRENDARIAS.NoCompare:= True;
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

   FKeyFields.Add('ID_SOLICITUD');
   TableName := 'CR_GA_PRENDARIAS';
   UseQuery := True;
   HelpFile := 'IntMPrend.Hlp';
   ShowMenuReporte:=True;

   MRegistro := TMRegistro.Create(Self);
   MRegistro.MasterSource:=Self;
   MRegistro.FieldByName('ID_SOLICITUD').MasterField:='ID_SOLICITUD';

   MEmisora :=  TEmisora.Create(Self);
   MEmisora.MasterSource := Self;
   MEmisora.fieldbyName('EMISORA').MasterField := 'EMISORA';
   MEmisora.fieldbyName('SERIE').MasterField := 'SERIE';
   MEmisora.fieldbyName('TIPO_VALOR').MasterField := 'TIPO_VALOR';

   Autorizacion := TContrato.Create(Self);
   Autorizacion.MasterSource := Self;

end;


Destructor TMPrend.Destroy;
begin
//   If MRegistro <> Nil Then
//      MRegistro.Free;
   If MEmisora <> Nil Then
      MEmisora.Free;
   If Autorizacion <> Nil Then
      Autorizacion.Free;
   Inherited;
end;

function TMPrend.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMPrend;
begin
   W:=TWMPrend.Create(Self);
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

Function TMPrend.InternalBusca:Boolean;
Var T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IMPrend.it','I');
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

function TMPrend.Reporte:Boolean;
begin
   Result := False;
end;


(***********************************************FORMA CR_GA_PRENDARIAS********************)
(*                                                                              *)
(*  FORMA DE CR_GA_PRENDARIAS                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_GA_PRENDARIAS********************)

procedure TwMPrend.FormShow(Sender: TObject);
begin
   InterForma1.BtnNuevo.Visible:= False;

   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   With Objeto Do Begin
      ID_SOLICITUD.Control        := edID_SOLICITUD;
      ID_CONTRATO.Control         := edID_CONTRATO;
      NOMBRE_OTORGANTE.Control    := edNOMBRE_OTORGANTE;
      IMP_DEPOSITO.Control        := edIMP_DEPOSITO;
      NUM_ACC_TIT.Control         := edNUM_ACC_TIT;
      EMISORA.Control             := edEMISORA;
      SERIE.Control               := edSERIE;
      TIPO_VALOR.Control          := edTIPO_VALOR;
      IMP_VALUACION.Control       := edIMP_VALUACION;
      SIT_PRENDARIAS.Control      := rgSITUACION;
      F_ALTA.Control              := edF_ALTA;
      CVE_USU_ALTA.Control        := edCVE_USU_ALTA;
      F_MODIFICA.Control          := edF_MODIFICA;
      CVE_USU_MODIFICA.Control    := edCVE_USU_MODIF;
      InterForma1.MsgPanel        := PnlMsg;

      MRegistro.ID_SOLICITUD.Control := edID_SOLICITUD;
      MRegistro.CVE_GARANTIA.Control := edCVE_GARANTIA;
      MRegistro.Garantia.DESC_GARANTIA.Control := edNOM_ID_SOLICITUD;
      MRegistro.GetParams(Objeto);

      // Si no es pagaré, entonces...
      If EMISORA.AsString <> ObtenClavePRLV Then
         Begin
         MEmisora.EMISORA.Control := edEMISORA;
         MEmisora.SERIE.Control := edSERIE;
         MEmisora.TIPO_VALOR.Control := edTIPO_VALOR;
         MEmisora.GetParams(Objeto);
         End;

      Autorizacion.ID_CONTRATO.Control :=edID_CONTRATO;
      Autorizacion.Titular.Nombre.Control := edNOM_ID_CONTRATO;
      Autorizacion.GetParams(Objeto);
   End;
end;

procedure TwMPrend.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      ID_SOLICITUD.Control        := Nil;
      ID_CONTRATO.Control         := Nil;
      NOMBRE_OTORGANTE.Control    := Nil;
      IMP_DEPOSITO.Control        := Nil;
      NUM_ACC_TIT.Control         := Nil;
      EMISORA.Control             := Nil;
      SERIE.Control               := Nil;
      TIPO_VALOR.Control          := Nil;
      IMP_VALUACION.Control       := Nil;
      SIT_PRENDARIAS.Control      := Nil;
      F_ALTA.Control              := Nil;
      CVE_USU_ALTA.Control        := Nil;
      F_MODIFICA.Control          := Nil;
      CVE_USU_MODIFICA.Control    := Nil;
      InterForma1.MsgPanel        := Nil;

      MRegistro.ID_SOLICITUD.Control := Nil;
      MRegistro.CVE_GARANTIA.Control := Nil;
      MRegistro.Garantia.DESC_GARANTIA.Control := Nil;

      // Si no es pagaré, entonces...
      If EMISORA.AsString <> ObtenClavePRLV Then
         Begin
         MEmisora.EMISORA.Control := Nil;
         MEmisora.SERIE.Control := Nil;
         MEmisora.TIPO_VALOR.Control := Nil;
         End;
         
      Autorizacion.ID_CONTRATO.Control :=Nil;
      Autorizacion.Titular.Nombre.Control := Nil;

   End;
end;

procedure TwMPrend.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMPrend.BuscaEmisora;
begin
 With Objeto Do
  Begin
  // Si no es pagaré, entonces...
  If (Trim(EMISORA.AsString) <> ObtenClavePRLV) Then
    MEmisora.FindKey([EMISORA.AsString,SERIE.AsString,TIPO_VALOR.AsString]);
  End;
end;

procedure TwMPrend.InterForma1Buscar(Sender: TObject);
Var
   sSQL: String;
   qyQuery: TQuery;
begin
   With Objeto Do Begin
      If InternalBusca Then Begin
         sSQL:=' SELECT ID_ACREDITADO FROM CR_GA_REGISTRO WHERE ID_SOLICITUD='+ Objeto.ID_SOLICITUD.AsSQL ;
         qyQuery:= GetSQLQueryNoNil(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
         If qyQuery <> Nil Then Begin
            If qyQuery.FieldByName('ID_ACREDITADO').AsInteger <> 0 Then Begin
               MRegistro.FindKey([Objeto.ID_SOLICITUD.AsInteger,qyQuery.FieldByName('ID_ACREDITADO').AsInteger]);
            End;
            qyQuery.Free;
         End;
         BuscaEmisora;
         Autorizacion.FindKey([ID_CONTRATO.AsString]);
         ObtPrecioMerc;
      End;
   End;
end;

procedure TwMPrend.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.F_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   edID_SOLICITUD.SetFocus;
   rgSITUACION.ItemIndex:= 0;
   If Objeto.MRegistro.ID_SOLICITUD.AsInteger <> 0 Then Begin
      Objeto.ID_SOLICITUD.AsInteger:= Objeto.MRegistro.ID_SOLICITUD.AsInteger;
      edID_CONTRATO.SetFocus;
   End;
   CambioControl;   
end;

procedure TwMPrend.rgSITUACIONExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSITUACION,True,CNULL,True);
end;

procedure TwMPrend.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.F_MODIFICA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
   CambioControl;   
   ObtPrecioMerc;
   edID_CONTRATO.SetFocus;
end;

procedure TwMPrend.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   edIMP_VALUACION.Tag:= 18;
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

procedure TwMPrend.edID_SOLICITUDExit(Sender: TObject);
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
         sSQL:= 'SELECT * FROM CR_GA_PRENDARIAS WHERE ID_SOLICITUD='+Objeto.ID_SOLICITUD.AsSQL;
         qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName,Objeto.Apli.SessionName, False);
         If InterForma1.IsNewData Then Begin
            If qyQuery <> Nil Then Begin
               If qyQuery.FieldByName('ID_SOLICITUD').AsInteger = Objeto.ID_SOLICITUD.AsInteger Then Begin
                  vlSalida   := False;
                  vlMsg := 'El de registro de garantía ya existe en la categoría de Prendarias';
               End;
               qyQuery.Free;
            End;
         End;
      End;
      InterForma1.ValidaExit(edID_SOLICITUD,vlSalida,vlMsg,True);
   End;
end;

procedure TwMPrend.ilID_SOLICITUDCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit)and (InterForma1.IsNewData);
end;

procedure TwMPrend.ilID_SOLICITUDEjecuta(Sender: TObject);
begin
   If Objeto.MRegistro.FindKey([ilID_SOLICITUD.Buffer]) Then Begin
      InterForma1.NextTab(edID_SOLICITUD);
   End;
end;

procedure TwMPrend.btID_SOLICITUDClick(Sender: TObject);
begin
   Objeto.MRegistro.ShowAll := True;
   If Objeto.MRegistro.Busca Then Begin
      InterForma1.NextTab(edID_SOLICITUD);
   End;
end;

procedure TwMPrend.edNOMBRE_OTORGANTEExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.NOMBRE_OTORGANTE.GetFromControl;
      If Objeto.NOMBRE_OTORGANTE.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar el nombre del otorgante';
      End;
      InterForma1.ValidaExit(edNOMBRE_OTORGANTE,vlSalida,vlMsg,True);
   End;
end;

procedure TwMPrend.btEMISORAClick(Sender: TObject);
begin
   Objeto.MEmisora.ShowAll := True;
   If Objeto.MEmisora.Busca Then Begin
      ObtPrecioMerc;
      InterForma1.NextTab(btEMISORA);
   End;
end;

procedure TwMPrend.ilEMISORAEjecuta(Sender: TObject);
begin
   If Objeto.MEmisora.FindKey([ilEMISORA]) Then Begin
      ObtPrecioMerc;
   End;
end;

procedure TwMPrend.ilEMISORACapture(Sender: TObject; var Show: Boolean);
begin
  Show:= True;
end;

procedure TwMPrend.edID_CONTRATOExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.ID_CONTRATO.GetFromControl;
      If Objeto.ID_CONTRATO.AsFloat = 0 Then Begin
         vlSalida   := False;
         vlMsg := 'Debe seleccionar una autorización';
      End;
      InterForma1.ValidaExit(edID_CONTRATO,vlSalida,vlMsg,True);
   End;
end;

procedure TwMPrend.edIMP_DEPOSITOExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.IMP_DEPOSITO.GetFromControl;
      If Objeto.IMP_DEPOSITO.AsFloat = 0 Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar el importe del depósito';
      End;
      InterForma1.ValidaExit(edIMP_DEPOSITO,vlSalida,vlMsg,True);
   End;
end;

procedure TwMPrend.edNUM_ACC_TITExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.NUM_ACC_TIT.GetFromControl;
      If Objeto.NUM_ACC_TIT.AsFloat = 0 Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar el número de acciones y títulos';
      End Else Begin
         ObtPrecioMerc;
      End;
      InterForma1.ValidaExit(edNUM_ACC_TIT,vlSalida,vlMsg,True);
   End;
end;

procedure TwMPrend.btEMISORAExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.EMISORA.GetFromControl;
      If Objeto.EMISORA.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar la emisora, serie y tipo valor';
      End Else Begin
         ObtPrecioMerc;
      End;
      InterForma1.ValidaExit(btEMISORA,vlSalida,vlMsg,True);
   End;
end;

procedure TwMPrend.edIMP_VALUACIONExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.IMP_VALUACION.GetFromControl;
      If Objeto.IMP_VALUACION.AsFloat = 0 Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar el importe de la valuación';
      End;
      InterForma1.ValidaExit(edIMP_VALUACION,vlSalida,vlMsg,True);
   End;
end;

procedure TwMPrend.btID_CONTRATOClick(Sender: TObject);
begin
   Objeto.Autorizacion.ShowAll := True;
   If Objeto.Autorizacion.Busca Then Begin
      InterForma1.NextTab(edID_CONTRATO);
   End;
end;

procedure TwMPrend.ilID_CONTRATOEjecuta(Sender: TObject);
begin                              
   If Objeto.Autorizacion.FindKey([ilID_CONTRATO.Buffer]) Then Begin
      InterForma1.NextTab(edID_CONTRATO);
   End;
end;

procedure TwMPrend.ilID_CONTRATOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit)Or(InterForma1.IsNewData);
end;

procedure TwMPrend.InterForma1DespuesShow(Sender: TObject);
begin
   If Objeto.MRegistro.ID_SOLICITUD.AsInteger <> 0 Then Begin
      BuscaEmisora;
      Objeto.Autorizacion.FindKey([Objeto.ID_CONTRATO.AsString]);
      ObtPrecioMerc;
      edID_CONTRATO.SetFocus;
   End;
end;

procedure TwMPrend.InterForma1DespuesEliminar(Sender: TObject);
begin
   edCVE_GARANTIA.Text:='';
   edNOM_ID_SOLICITUD.Text:='';
   edIMP_VALUACION.Tag:= 18;   
end;

Procedure TwMPrend.ObtPrecioMerc;
Var
   sSQL: String;
   qyQuery: TQuery;
Begin
 // Si no es pagaré, entonces...
  If (Objeto.Emisora.AsString <> Objeto.ObtenClavePRLV) Then // SATV4766
   If Trim(Objeto.MRegistro.Garantia.B_REQ_VALUACION.AsString)='V' Then Begin
      sSQL:= 'SELECT ROUND(PKGFUNPROCCORP.PRECIOMERCADO( '+
             '             PKGFUNPROCCORP.FREFERENCIA(''D000'',1), '+
//      sSQL:= 'SELECT ROUND(PKGFUNPROCCORP.PRECIOMERCADO@PCORP( '+     EASA    0310/2004
//             '             PKGFUNPROCCORP.FREFERENCIA@PCORP(''D000'',1), '+           EASA    0310/2004
                Objeto.EMISORA.AsSQL +','+
                Objeto.SERIE.AsSQL +','+
                Objeto.TIPO_VALOR.AsSQL +')*'+ Objeto.NUM_ACC_TIT.AsSQL +
                ',2) AS IMP_VALUACION '+
             ' FROM DUAL';
      qyQuery:= GetSQLQueryNoNil(sSQL, Objeto.Apli.DataBaseName,Objeto.Apli.SessionName, False);
      If qyQuery <> Nil Then Begin
         edIMP_VALUACION.Text := qyQuery.FieldByName('IMP_VALUACION').AsString;
         qyQuery.Free;
      End Else Begin
         edIMP_VALUACION.Text := '0';
      End;
   End;
End;
procedure TwMPrend.InterForma1DespuesCancelar(Sender: TObject);
begin
   ObtPrecioMerc;
   edIMP_VALUACION.Tag:= 18;
   edIMP_VALUACION.TabStop:= True;
   InterForma1.InitShow;
end;

Procedure TwMPrend.CambioControl;
Begin
   If Trim(Objeto.MRegistro.Garantia.B_REQ_VALUACION.AsString)='V' Then Begin
      edIMP_VALUACION.Tag:= 17;
      edIMP_VALUACION.TabStop:= False;
   End Else Begin
      edIMP_VALUACION.Tag:= 18;
      edIMP_VALUACION.TabStop:= True;
   End;
   InterForma1.InitShow;
End;

function TMPrend.ObtenClavePRLV: String;
var vlCVE_GA_PRLV : String;
begin
 GetSQLStr('SELECT CVE_GA_PRLV FROM CR_PARAMETRO WHERE CVE_PARAMETRO = pkgCrComun.coCRE',
           Apli.DatabaseName, Apli.SessionName, 'CVE_GA_PRLV', vlCVE_GA_PRLV, False);
 Result := vlCVE_GA_PRLV;          
end;

end.
