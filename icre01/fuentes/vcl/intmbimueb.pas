// Sistema         : Clase de CR_GA_BI_MUEB
// Fecha de Inicio : 02/07/2004
// Función forma   : Clase de CR_GA_BI_MUEB
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMBiMueb;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,IntGenCre,
IntParamCre, InterEdit, IntCrRePrMn, IntMRegistro, IntMPerito, IntMNotario;

Type
 TMBiMueb= class;

  TwMBiMueb=Class(TForm)
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
    rgSITUACION: TRadioGroup;
    Label6: TLabel;
    edNOMBRE_VALUADOR: TEdit;
    Label7: TLabel;
    edF_VALUACION: TEdit;
    dtpF_VALUACION: TInterDateTimePicker;
    Label8: TLabel;
    edMARCA: TEdit;
    edMODELO: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    edID_SOLICITUD: TInterEdit;
    btID_SOLICITUD: TBitBtn;
    edNOM_ID_SOLICITUD: TEdit;
    ilID_SOLICITUD: TInterLinkit;
    edID_FACTURA: TEdit;
    edSERIE: TEdit;
    Label1: TLabel;
    edCVE_GARANTIA: TEdit;
    Label2: TLabel;
    edID_NOT_PUB: TEdit;
    edNOM_NOT_PUB: TEdit;
    edID_VALUADOR: TEdit;
    btID_VALUADOR: TBitBtn;
    ilID_VALUADOR: TInterLinkit;
    btID_NOT_PUB: TBitBtn;
    ilID_NOT_PUB: TInterLinkit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure edID_FACTURAExit(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure rgSITUACIONExit(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure edID_SOLICITUDExit(Sender: TObject);
    procedure ilID_SOLICITUDCapture(Sender: TObject; var Show: Boolean);
    procedure ilID_SOLICITUDEjecuta(Sender: TObject);
    procedure btID_SOLICITUDClick(Sender: TObject);
    procedure edF_VALUACIONExit(Sender: TObject);
    procedure edMARCAExit(Sender: TObject);
    procedure edMODELOExit(Sender: TObject);
    procedure edSERIEExit(Sender: TObject);
    procedure edID_NOT_PUBExit(Sender: TObject);
    procedure edID_VALUADORExit(Sender: TObject);
    procedure btID_VALUADORClick(Sender: TObject);
    procedure ilID_VALUADORCapture(Sender: TObject; var Show: Boolean);
    procedure ilID_VALUADOREjecuta(Sender: TObject);
    procedure btID_NOT_PUBClick(Sender: TObject);
    procedure ilID_NOT_PUBCapture(Sender: TObject; var Show: Boolean);
    procedure ilID_NOT_PUBEjecuta(Sender: TObject);
    procedure InterForma1DespuesEliminar(Sender: TObject);

    private
    { Private declarations }
    public
    { Public declarations }
      Objeto : TMBiMueb;
    end;

 TMBiMueb= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        ID_SOLICITUD        : TInterCampo;
        ID_VALUADOR         : TInterCampo;
        F_VALUACION         : TInterCampo;
        MARCA               : TInterCampo;
        MODELO              : TInterCampo;
        ID_FACTURA          : TInterCampo;
        SERIE               : TInterCampo;
        ID_NOT_PUB          : TInterCampo;
        SIT_BI_MUEB         : TInterCampo;
        F_ALTA              : TInterCampo;
        CVE_USU_ALTA        : TInterCampo;
        F_MODIFICA          : TInterCampo;
        CVE_USU_MODIFICA    : TInterCampo;

        ParamCre            : TParamCre;
        MRegistro           : TMRegistro;
        MPerito             : TMPerito;
        MNotario            : TMNotario;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

implementation
{$R *.DFM}

constructor TMBiMueb.Create( AOwner : TComponent );
begin Inherited;
   ID_SOLICITUD :=CreaCampo('ID_SOLICITUD',ftFloat,tsNinguno,tsNinguno,True);
      ID_SOLICITUD.Caption:='Identificador del  inmueble';
   ID_VALUADOR :=CreaCampo('ID_VALUADOR',ftFloat,tsNinguno,tsNinguno,True);
      ID_VALUADOR.Caption:='Nombre del valuador';
      ID_VALUADOR.NoCompare:= True;
   F_VALUACION :=CreaCampo('F_VALUACION',ftDate,tsNinguno,tsNinguno,True);
      F_VALUACION.Caption:='Fecha de valuación de la garantía';
      F_VALUACION.NoCompare:= True;
   MARCA :=CreaCampo('MARCA',ftString,tsNinguno,tsNinguno,True);
      MARCA.Caption:='Marca';
      MARCA.NoCompare:= True;
   MODELO :=CreaCampo('MODELO',ftString,tsNinguno,tsNinguno,True);
      MODELO.Caption:='Modelo';
      MODELO.NoCompare:= True;
   ID_FACTURA :=CreaCampo('ID_FACTURA',ftString,tsNinguno,tsNinguno,True);
      ID_FACTURA.Caption:='Identificador de factura';
      ID_FACTURA.NoCompare:= True;
   SERIE :=CreaCampo('SERIE',ftString,tsNinguno,tsNinguno,True);
      SERIE.Caption:='Modelo';
      SERIE.NoCompare:= True;
   ID_NOT_PUB :=CreaCampo('ID_NOT_PUB',ftFloat,tsNinguno,tsNinguno,True);
      ID_NOT_PUB.Caption:='Nombre de Not Pub.';
      ID_NOT_PUB.NoCompare:= True;

   SIT_BI_MUEB :=CreaCampo('SIT_BI_MUEB',ftString,tsNinguno,tsNinguno,True);
   With SIT_BI_MUEB do begin
      Size:=2;
      UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add('AC');
      ComboLista.Add('1'); ComboDatos.Add('IN');
   end;
      SIT_BI_MUEB.Caption:='Situación';
      SIT_BI_MUEB.NoCompare:= True;
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
   TableName := 'CR_GA_BI_MUEB';
   UseQuery := True;
   HelpFile := 'IntMBiMueb.Hlp';
   ShowMenuReporte:=True;

   MRegistro := TMRegistro.Create(Self);
   MRegistro.MasterSource:=Self;
   MRegistro.FieldByName('ID_SOLICITUD').MasterField:='ID_SOLICITUD';

   MPerito := TMPerito.Create(Self);
   MPerito.MasterSource:=Self;
   MPerito.FieldByName('ID_PERITO').MasterField:='ID_VALUADOR';

   MNotario := TMNotario.Create(Self);
   MNotario.MasterSource:=Self;
   MNotario.FieldByName('ID_NOTARIO').MasterField:='ID_NOT_PUB';
end;


Destructor TMBiMueb.Destroy;
begin
   If MPerito <> Nil Then
      MPerito.Free;
   If MNotario <> Nil Then
      MNotario.Free;
   Inherited;
end;

function TMBiMueb.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMBiMueb;
begin
   W:=TWMBiMueb.Create(Self);
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

Function TMBiMueb.InternalBusca:Boolean;
Var T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IMBiMueb.it','I');
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

function TMBiMueb.Reporte:Boolean;
begin
   Result := False;
end;


(***********************************************FORMA CR_GA_BI_MUEB********************)
(*                                                                              *)
(*  FORMA DE CR_GA_BI_MUEB                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_GA_BI_MUEB********************)

procedure TwMBiMueb.FormShow(Sender: TObject);
begin
   InterForma1.BtnNuevo.Visible:= False;
   
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   With Objeto Do Begin
      ID_SOLICITUD.Control        := edID_SOLICITUD;
      ID_VALUADOR.Control         := edID_VALUADOR;
      F_VALUACION.Control         := edF_VALUACION;
      MARCA.Control               := edMARCA;
      MODELO.Control              := edMODELO;
      ID_FACTURA.Control          := edID_FACTURA;
      SERIE.Control               := edSERIE;
      ID_NOT_PUB.Control          := edID_NOT_PUB;
      SIT_BI_MUEB.Control         := rgSITUACION;
      F_ALTA.Control              := edF_ALTA;
      CVE_USU_ALTA.Control        := edCVE_USU_ALTA;
      F_MODIFICA.Control          := edF_MODIFICA;
      CVE_USU_MODIFICA.Control    := edCVE_USU_MODIF;
      InterForma1.MsgPanel        := PnlMsg;

      MRegistro.ID_SOLICITUD.Control := edID_SOLICITUD;
      MRegistro.CVE_GARANTIA.Control := edCVE_GARANTIA;
      MRegistro.Garantia.DESC_GARANTIA.Control := edNOM_ID_SOLICITUD;
      MRegistro.GetParams(Objeto);

      MPerito.ID_PERITO.Control := edID_VALUADOR;
      MPerito.Persona.Nombre.Control := edNOMBRE_VALUADOR;
      MPerito.GetParams(Objeto);

      MNotario.ID_NOTARIO.Control := edID_NOT_PUB;
      MNotario.Persona.Nombre.Control := edNOM_NOT_PUB;
      MNotario.GetParams(Objeto);
   End;
end;

procedure TwMBiMueb.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      ID_SOLICITUD.Control        := Nil;
      ID_VALUADOR.Control         := Nil;
      F_VALUACION.Control         := Nil;
      MARCA.Control               := Nil;
      MODELO.Control              := Nil;
      ID_FACTURA.Control          := Nil;
      SERIE.Control               := Nil;
      ID_NOT_PUB.Control          := Nil;
      SIT_BI_MUEB.Control         := Nil;
      F_ALTA.Control              := Nil;
      CVE_USU_ALTA.Control        := Nil;
      F_MODIFICA.Control          := Nil;
      CVE_USU_MODIFICA.Control    := Nil;
      InterForma1.MsgPanel        := Nil;

      MRegistro.ID_SOLICITUD.Control := Nil;
      MRegistro.CVE_GARANTIA.Control := Nil;
      MRegistro.Garantia.DESC_GARANTIA.Control := Nil;
      MPerito.ID_PERITO.Control := Nil;
      MPerito.Persona.Nombre.Control := Nil;
      MNotario.ID_NOTARIO.Control := Nil;
      MNotario.Persona.Nombre.Control := Nil;
   End;
end;

procedure TwMBiMueb.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMBiMueb.InterForma1Buscar(Sender: TObject);
Var
   sSQL: String;
   qyQuery: TQuery;
Begin
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
      Objeto.MPerito.FindKey([Objeto.ID_VALUADOR.AsInteger]);
      Objeto.MNotario.FindKey([Objeto.ID_NOT_PUB.AsInteger]);
   End;
End;

procedure TwMBiMueb.edID_FACTURAExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.ID_FACTURA.GetFromControl;
      If Objeto.ID_FACTURA.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar folio de la factura';
      End;
      InterForma1.ValidaExit(edID_FACTURA,vlSalida,vlMsg,True);
   End;
end;

procedure TwMBiMueb.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.F_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   edF_VALUACION.Text := FormatDateTime('dd/mm/yyyy', Objeto.Apli.DameFechaEmpresaDia('D000'));
   dtpF_VALUACION.DateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   edID_SOLICITUD.SetFocus;
   rgSITUACION.ItemIndex:= 0;
   If Objeto.MRegistro.ID_SOLICITUD.AsInteger <> 0 Then Begin
      Objeto.ID_SOLICITUD.AsInteger:= Objeto.MRegistro.ID_SOLICITUD.AsInteger;
      edID_VALUADOR.SetFocus;
   End;
end;

procedure TwMBiMueb.rgSITUACIONExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSITUACION,True,CNULL,True);
end;

procedure TwMBiMueb.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.F_MODIFICA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
   edID_VALUADOR.SetFocus;
end;

procedure TwMBiMueb.InterForma1AntesAceptar(Sender: TObject;
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

procedure TwMBiMueb.edID_SOLICITUDExit(Sender: TObject);
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
         sSQL:= 'SELECT * FROM CR_GA_BI_MUEB WHERE ID_SOLICITUD='+Objeto.ID_SOLICITUD.AsString;
         qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName,Objeto.Apli.SessionName, False);
         If InterForma1.IsNewData Then Begin
            If qyQuery <> Nil Then Begin
               If qyQuery.FieldByName('ID_SOLICITUD').AsInteger = Objeto.ID_SOLICITUD.AsInteger Then Begin
                  vlSalida   := False;
                  vlMsg := 'El de registro de garantía ya existe en la categoría de Mueble';
               End;
               qyQuery.Free;
            End;
         End;
      End;
      InterForma1.ValidaExit(edID_SOLICITUD,vlSalida,vlMsg,True);
   End;
end;

procedure TwMBiMueb.ilID_SOLICITUDCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit)and (InterForma1.IsNewData);
end;

procedure TwMBiMueb.ilID_SOLICITUDEjecuta(Sender: TObject);
begin
   If Objeto.MRegistro.FindKey([ilID_SOLICITUD.Buffer]) Then Begin
      InterForma1.NextTab(edID_SOLICITUD);
   End;
end;

procedure TwMBiMueb.btID_SOLICITUDClick(Sender: TObject);
begin
   Objeto.MRegistro.ShowAll := True;
   If Objeto.MRegistro.Busca Then Begin
      InterForma1.NextTab(edID_SOLICITUD);
   End;
end;

procedure TwMBiMueb.edF_VALUACIONExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.F_VALUACION.GetFromControl;
      If Objeto.F_VALUACION.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar la fecha de valuación';
      End;
      InterForma1.ValidaExit(edF_VALUACION,vlSalida,vlMsg,True);
   End;
end;

procedure TwMBiMueb.edMARCAExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.MARCA.GetFromControl;
      If Objeto.MARCA.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar la marca';
      End;
      InterForma1.ValidaExit(edMARCA,vlSalida,vlMsg,True);
   End;
end;

procedure TwMBiMueb.edMODELOExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.MODELO.GetFromControl;
      If Objeto.MODELO.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar el modelo';
      End;
      InterForma1.ValidaExit(edMODELO,vlSalida,vlMsg,True);
   End;
end;

procedure TwMBiMueb.edSERIEExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.SERIE.GetFromControl;
      If Objeto.SERIE.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar la serie';
      End;
      InterForma1.ValidaExit(edSERIE,vlSalida,vlMsg,True);
   End;
end;

procedure TwMBiMueb.edID_NOT_PUBExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.ID_NOT_PUB.GetFromControl;
      If Objeto.ID_NOT_PUB.AsFloat = 0 Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar el identificador del notario público';
      End;
      InterForma1.ValidaExit(edID_NOT_PUB,vlSalida,vlMsg,True);
   End;
end;

procedure TwMBiMueb.edID_VALUADORExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.ID_VALUADOR.GetFromControl;
      If Objeto.ID_VALUADOR.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar el identificador del valuador';
      End;
      InterForma1.ValidaExit(edID_VALUADOR,vlSalida,vlMsg,True);
   End;
end;

procedure TwMBiMueb.btID_VALUADORClick(Sender: TObject);
begin
   Objeto.MPerito.BuscaWhereString := ' CR_GA_PERITO.SIT_PERITO =''AC'' ';
   Objeto.MPerito.FilterString := Objeto.MPerito.BuscaWhereString;
   Objeto.MPerito.ShowAll := True;
   If Objeto.MPerito.Busca Then Begin
      InterForma1.NextTab(edID_VALUADOR);
   End;
end;

procedure TwMBiMueb.ilID_VALUADORCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit)and (InterForma1.IsNewData);
end;

procedure TwMBiMueb.ilID_VALUADOREjecuta(Sender: TObject);
begin
   If Objeto.MPerito.FindKey([ilID_VALUADOR.Buffer]) Then
      InterForma1.NextTab(edID_VALUADOR);
end;

procedure TwMBiMueb.btID_NOT_PUBClick(Sender: TObject);
begin
   Objeto.MNotario.BuscaWhereString := ' CR_GA_NOTARIO.SIT_NOTARIO =''AC'' ';
   Objeto.MNotario.FilterString := Objeto.MNotario.BuscaWhereString;
   Objeto.MNotario.ShowAll := True;
   If Objeto.MNotario.Busca Then Begin
      InterForma1.NextTab(edID_NOT_PUB);
   End;
end;

procedure TwMBiMueb.ilID_NOT_PUBCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit)and (InterForma1.IsNewData);
end;

procedure TwMBiMueb.ilID_NOT_PUBEjecuta(Sender: TObject);
begin
   If Objeto.MNotario.FindKey([ilID_NOT_PUB.Buffer]) Then
      InterForma1.NextTab(edID_NOT_PUB);
end;

procedure TwMBiMueb.InterForma1DespuesEliminar(Sender: TObject);
begin
   edCVE_GARANTIA.Text:='';
   edNOM_ID_SOLICITUD.Text:='';   
end;

end.
