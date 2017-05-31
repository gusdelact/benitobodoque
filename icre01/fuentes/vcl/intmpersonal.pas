// Sistema         : Clase de CR_GA_PERSONALES
// Fecha de Inicio : 05/07/2004
// Función forma   : Clase de CR_GA_PERSONALES
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMPersonal;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,IntGenCre,
IntParamCre, InterEdit, IntCrRePrMn, IntMRegistro, IntEmisora,
IntMPers,
IntPers
;

Type
 TMPersonal= class;

  TwMPersonal=Class(TForm)
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
    Label2: TLabel;
    edID_AVAL: TInterEdit;
    btID_AVAL: TBitBtn;
    edNOM_ID_AVAL: TEdit;
    ilID_AVAL: TInterLinkit;
    lbIMP_DEPOSITO: TLabel;
    edPCT_GARANTIZA: TInterEdit;
    Label14: TLabel;
    edCVE_GARANTIA: TEdit;
    cbxB_AVAL_CR: TCheckBox;
    Label1: TLabel;
    edID_AVAL_CR: TInterEdit;
    btID_AVAL_CR: TBitBtn;
    edNOM_ID_AVAL_CR: TEdit;
    ilID_AVAL_CR: TInterLinkit;
    edEfectiva: TInterEdit;
    edNominal: TInterEdit;
    edCuota: TInterEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edGarLiq: TInterEdit;
    Label7: TLabel;
    Label32: TLabel;
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
    procedure edID_AVALExit(Sender: TObject);
    procedure edPCT_GARANTIZAExit(Sender: TObject);
    procedure btID_AVALClick(Sender: TObject);
    procedure ilID_AVALEjecuta(Sender: TObject);
    procedure ilID_AVALCapture(Sender: TObject; var Show: Boolean);
    procedure cbxB_AVAL_CRExit(Sender: TObject);
    procedure edID_AVAL_CRExit(Sender: TObject);
    procedure btID_AVAL_CRClick(Sender: TObject);
    procedure ilID_AVAL_CREjecuta(Sender: TObject);
    procedure ilID_AVAL_CRCapture(Sender: TObject; var Show: Boolean);
    procedure cbxB_AVAL_CRClick(Sender: TObject);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);

    private
      Procedure CambiaCont;
      Procedure LlenaPorcent;
      Function  ObtPorc(dCveMoneda: Double;dCveOperativa:String;dPorcLiq: Double):Boolean;
    { Private declarations }
    public
    { Public declarations }
      Objeto : TMPersonal;
    end;

 TMPersonal= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        ID_SOLICITUD        : TInterCampo;
        ID_AVAL             : TInterCampo;
        PCT_GARANTIZA       : TInterCampo;
        B_AVAL_CR           : TInterCampo;
        ID_AVAL_CR          : TInterCampo;
        SIT_PERSONALES      : TInterCampo;
        F_ALTA              : TInterCampo;
        CVE_USU_ALTA        : TInterCampo;
        F_MODIFICA          : TInterCampo;
        CVE_USU_MODIFICA    : TInterCampo;

        PCT_GTIA_LIQ_INM    : TInterCampo;
        PCT_GTIA_FEGA_EF    : TInterCampo;
        PCT_GTIA_FEGA_NO    : TInterCampo;
        PCT_CUOTA_FEGA      : TInterCampo;


        ParamCre            : TParamCre;
        MRegistro           : TMRegistro;
        Persona             : TPersona;
        PersonaAval         : TPersona;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

implementation
{$R *.DFM}

constructor TMPersonal.Create( AOwner : TComponent );
begin Inherited;
   ID_SOLICITUD :=CreaCampo('ID_SOLICITUD',ftFloat,tsNinguno,tsNinguno,True);
      ID_SOLICITUD.Caption:='Identificador del  inmueble';
   ID_AVAL :=CreaCampo('ID_AVAL',ftFloat,tsNinguno,tsNinguno,True);
      ID_AVAL.Caption:='Identificador del Aval';
      ID_AVAL.NoCompare:= True;
   PCT_GARANTIZA :=CreaCampo('PCT_GARANTIZA',ftFloat,tsNinguno,tsNinguno,True);
      PCT_GARANTIZA.Caption:='Porcentaje que garantiza';
      PCT_GARANTIZA.NoCompare:= True;
   B_AVAL_CR :=CreaCampo('B_AVAL_CR',ftString,tsNinguno,tsNinguno,True);
      B_AVAL_CR.Caption:='Indica si son avales cruzados';
      B_AVAL_CR.NoCompare:= True;
   ID_AVAL_CR :=CreaCampo('ID_AVAL_CR',ftFloat,tsNinguno,tsNinguno,True);
      ID_AVAL_CR.Caption:='Identificador de aval cruzado';
      ID_AVAL_CR.NoCompare:= True;
   SIT_PERSONALES :=CreaCampo('SIT_PERSONALES',ftString,tsNinguno,tsNinguno,True);
   With SIT_PERSONALES Do Begin
      Size:=2;
      UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add('AC');
      ComboLista.Add('1'); ComboDatos.Add('IN');
   end;
      SIT_PERSONALES.Caption:='Situación';
      SIT_PERSONALES.NoCompare:= True;
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
   PCT_GTIA_LIQ_INM :=CreaCampo('PCT_GTIA_LIQ_INM',ftFloat,tsNinguno,tsNinguno,False);
      PCT_GTIA_LIQ_INM.Caption:='Porcentaje de garantía líquida';
      PCT_GTIA_LIQ_INM.NoCompare:= True;
   PCT_GTIA_FEGA_EF :=CreaCampo('PCT_GTIA_FEGA_EF',ftFloat,tsNinguno,tsNinguno,False);
      PCT_GTIA_FEGA_EF.Caption:='Porcentaje de garantía líquida';
      PCT_GTIA_FEGA_EF.NoCompare:= True;
   PCT_GTIA_FEGA_NO :=CreaCampo('PCT_GTIA_FEGA_NO',ftFloat,tsNinguno,tsNinguno,False);
      PCT_GTIA_FEGA_NO.Caption:='Porcentaje de garantía líquida';
      PCT_GTIA_FEGA_NO.NoCompare:= True;
   PCT_CUOTA_FEGA :=CreaCampo('PCT_CUOTA_FEGA',ftFloat,tsNinguno,tsNinguno,False);
      PCT_CUOTA_FEGA.Caption:='Porcentaje de garantía líquida';
      PCT_CUOTA_FEGA.NoCompare:= True;

   FKeyFields.Add('ID_SOLICITUD');
   TableName := 'CR_GA_PERSONALES';
   UseQuery := True;
   HelpFile := 'IntMPersonal.Hlp';
   ShowMenuReporte:=True;

   MRegistro := TMRegistro.Create(Self);
   MRegistro.MasterSource:=Self;
   MRegistro.FieldByName('ID_SOLICITUD').MasterField:='ID_SOLICITUD';

   Persona:= TPersona.Create(Self);
   //Persona.FilterBy := fbTMPersonaFisica;
   Persona.MasterSource := Self;
   Persona.FieldByName('ID_PERSONA').MasterField := 'ID_AVAL';

   PersonaAval:= TPersona.Create(Self);
   //PersonaAval.FilterBy := fbTMPersonaFisica;
   PersonaAval.MasterSource := Self;
   PersonaAval.FieldByName('ID_PERSONA').MasterField := 'ID_AVAL_CR';
end;


Destructor TMPersonal.Destroy;
begin
   //If MRegistro <> Nil Then
   //   MRegistro.Free;
   If Persona <> Nil Then
      Persona.Free;
   If PersonaAval <> Nil Then
      PersonaAval.Free;
   Inherited;
end;

function TMPersonal.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMPersonal;
begin
   W:=TWMPersonal.Create(Self);
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

Function TMPersonal.InternalBusca:Boolean;
Var T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IMPersonal.it','I');
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

function TMPersonal.Reporte:Boolean;
begin
   Result := False;
end;


(***********************************************FORMA CR_GA_PERSONALES********************)
(*                                                                              *)
(*  FORMA DE CR_GA_PERSONALES                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_GA_PERSONALES********************)

procedure TwMPersonal.FormShow(Sender: TObject);
begin
   InterForma1.BtnNuevo.Visible:= False;
   
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   With Objeto Do Begin
      ID_SOLICITUD.Control        := edID_SOLICITUD;
      ID_AVAL.Control             := edID_AVAL;
      PCT_GARANTIZA.Control       := edPCT_GARANTIZA;
      B_AVAL_CR.Control           := cbxB_AVAL_CR;
      ID_AVAL_CR.Control          := edID_AVAL_CR;
      SIT_PERSONALES.Control      := rgSITUACION;
      F_ALTA.Control              := edF_ALTA;
      CVE_USU_ALTA.Control        := edCVE_USU_ALTA;
      F_MODIFICA.Control          := edF_MODIFICA;
      CVE_USU_MODIFICA.Control    := edCVE_USU_MODIF;
      InterForma1.MsgPanel        := PnlMsg;

      PCT_GTIA_LIQ_INM.Control := edGarLiq;
      PCT_GTIA_FEGA_EF.Control := edEfectiva;
      PCT_GTIA_FEGA_NO.Control := edNominal;
      PCT_CUOTA_FEGA.Control   := edCuota;

      MRegistro.ID_SOLICITUD.Control := edID_SOLICITUD;
      MRegistro.CVE_GARANTIA.Control := edCVE_GARANTIA;
      MRegistro.Garantia.DESC_GARANTIA.Control := edNOM_ID_SOLICITUD;
      MRegistro.GetParams(Objeto);

      Persona.Id_Persona.Control := edID_AVAL;
      Persona.Nombre.Control := edNOM_ID_AVAL;
      Persona.GetParams(Objeto);

      PersonaAval.Id_Persona.Control := edID_AVAL_CR;
      PersonaAval.Nombre.Control := edNOM_ID_AVAL_CR;
      PersonaAval.GetParams(Objeto);
   End;
end;

procedure TwMPersonal.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      ID_SOLICITUD.Control        := Nil;
      ID_AVAL.Control             := Nil;
      PCT_GARANTIZA.Control       := Nil;
      B_AVAL_CR.Control           := Nil;
      ID_AVAL_CR.Control          := Nil;
      SIT_PERSONALES.Control      := Nil;
      F_ALTA.Control              := Nil;
      CVE_USU_ALTA.Control        := Nil;
      F_MODIFICA.Control          := Nil;
      CVE_USU_MODIFICA.Control    := Nil;
      InterForma1.MsgPanel        := Nil;

      PCT_GTIA_LIQ_INM.Control := Nil;
      PCT_GTIA_FEGA_EF.Control := Nil;
      PCT_GTIA_FEGA_NO.Control := Nil;
      PCT_CUOTA_FEGA.Control   := Nil;

      MRegistro.ID_SOLICITUD.Control := Nil;
      MRegistro.CVE_GARANTIA.Control := Nil;
      MRegistro.Garantia.DESC_GARANTIA.Control := Nil;

      Persona.Id_Persona.Control := Nil;
      Persona.Nombre.Control := Nil;

      PersonaAval.Id_Persona.Control := Nil;
      PersonaAval.Nombre.Control := Nil;
   End;
end;

procedure TwMPersonal.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMPersonal.InterForma1Buscar(Sender: TObject);
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
      Persona.FindKey([ID_AVAL.AsString]);
      PersonaAval.FindKey([ID_AVAL_CR.AsString]);
      LlenaPorcent;      
   End;
end;

procedure TwMPersonal.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.F_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   edID_SOLICITUD.SetFocus;
   rgSITUACION.ItemIndex:= 0;
   CambiaCont;
   If Objeto.MRegistro.ID_SOLICITUD.AsInteger <> 0 Then Begin
      Objeto.ID_SOLICITUD.AsInteger:= Objeto.MRegistro.ID_SOLICITUD.AsInteger;
      edID_AVAL.SetFocus;
   End;
end;

procedure TwMPersonal.rgSITUACIONExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSITUACION,True,CNULL,True);
end;

procedure TwMPersonal.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.F_MODIFICA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
   CambiaCont;
   edID_AVAL.SetFocus;
end;

procedure TwMPersonal.InterForma1AntesAceptar(Sender: TObject;
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

procedure TwMPersonal.edID_SOLICITUDExit(Sender: TObject);
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
         If InterForma1.IsNewData Then Begin
            sSQL:= 'SELECT * FROM CR_GA_PERSONALES WHERE ID_SOLICITUD='+Objeto.ID_SOLICITUD.AsSQL;
            qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName,Objeto.Apli.SessionName, False);
            If qyQuery <> Nil Then Begin
               If qyQuery.FieldByName('ID_SOLICITUD').AsInteger = Objeto.ID_SOLICITUD.AsInteger Then Begin
                  vlSalida   := False;
                  vlMsg := 'El de registro de garantía ya existe en la categoría de garantías Personales';
               End;
               qyQuery.Free;
            End;
         End;
      End;
      InterForma1.ValidaExit(edID_SOLICITUD,vlSalida,vlMsg,True);
   End;
end;

procedure TwMPersonal.ilID_SOLICITUDCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit)and (InterForma1.IsNewData);
end;

procedure TwMPersonal.ilID_SOLICITUDEjecuta(Sender: TObject);
begin
   If Objeto.MRegistro.FindKey([ilID_SOLICITUD.Buffer]) Then Begin
      InterForma1.NextTab(edID_SOLICITUD);
   End;
end;

procedure TwMPersonal.btID_SOLICITUDClick(Sender: TObject);
begin
   Objeto.MRegistro.ShowAll := True;
   If Objeto.MRegistro.Busca Then Begin
      InterForma1.NextTab(edID_SOLICITUD);
   End;
end;

procedure TwMPersonal.edID_AVALExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.ID_AVAL.GetFromControl;
      If Objeto.ID_AVAL.AsFloat = 0 Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar el identificador del Aval';
      End;
      InterForma1.ValidaExit(edID_AVAL,vlSalida,vlMsg,True);
   End;
end;

procedure TwMPersonal.edPCT_GARANTIZAExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.PCT_GARANTIZA.GetFromControl;
      If Objeto.PCT_GARANTIZA.AsFloat = 0 Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar el porcentaje que garantiza';
      End;
      InterForma1.ValidaExit(edPCT_GARANTIZA,vlSalida,vlMsg,True);
   End;
end;

procedure TwMPersonal.btID_AVALClick(Sender: TObject);
begin
   Objeto.Persona.ShowAll := True;
   If Objeto.Persona.Busca Then Begin
//      Objeto.Persona.BuscaWhereString := ' PERSONA.ID_PERSONA IN (SELECT ID_ACREDITADO FROM CR_ACREDITADO) ';
//      Objeto.Persona.FilterString := Objeto.Persona.BuscaWhereString;
      InterForma1.NextTab(edID_AVAL);
   end;
end;

procedure TwMPersonal.ilID_AVALEjecuta(Sender: TObject);
begin
   If Objeto.Persona.FindKey([ilID_AVAL.Buffer]) Then Begin
//      Objeto.Persona.BuscaWhereString := ' PERSONA.ID_PERSONA IN (SELECT ID_ACREDITADO FROM CR_ACREDITADO) ';
//      Objeto.Persona.FilterString := Objeto.Persona.BuscaWhereString;
      InterForma1.NextTab(edID_AVAL);
   End;
end;

procedure TwMPersonal.ilID_AVALCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit)Or(InterForma1.IsNewData);
end;

procedure TwMPersonal.cbxB_AVAL_CRExit(Sender: TObject);
begin
   InterForma1.ValidaExit(cbxB_AVAL_CR,True,CNULL,True);
end;

procedure TwMPersonal.edID_AVAL_CRExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edID_AVAL_CR,True,CNULL,True);
end;

procedure TwMPersonal.btID_AVAL_CRClick(Sender: TObject);
begin
   Objeto.PersonaAval.ShowAll := True;
   If Objeto.PersonaAval.Busca Then Begin
//      Objeto.Persona.BuscaWhereString := ' PERSONA.ID_PERSONA IN (SELECT ID_ACREDITADO FROM CR_ACREDITADO) ';
//      Objeto.Persona.FilterString := Objeto.Persona.BuscaWhereString;
      InterForma1.NextTab(edID_AVAL_CR);
   end;
end;

procedure TwMPersonal.ilID_AVAL_CREjecuta(Sender: TObject);
begin
   If Objeto.PersonaAval.FindKey([ilID_AVAL_CR.Buffer]) Then Begin
//      Objeto.Persona.BuscaWhereString := ' PERSONA.ID_PERSONA IN (SELECT ID_ACREDITADO FROM CR_ACREDITADO) ';
//      Objeto.Persona.FilterString := Objeto.Persona.BuscaWhereString;
      InterForma1.NextTab(edID_AVAL_CR);
   End;
end;

procedure TwMPersonal.ilID_AVAL_CRCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit)Or(InterForma1.IsNewData);
end;

procedure TwMPersonal.cbxB_AVAL_CRClick(Sender: TObject);
begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppend)) Then
      CambiaCont;
end;

Procedure TwMPersonal.CambiaCont;
Begin
   If cbxB_AVAL_CR.Checked Then Begin
      Objeto.PersonaAval.Active:= True;
      edID_AVAL_CR.ReadOnly:= True;
      edID_AVAL_CR.Color:= clWindow;
      btID_AVAL_CR.Enabled:= True;
   End Else Begin
      Objeto.PersonaAval.Active:= False;
      edID_AVAL_CR.ReadOnly:= False;
      edID_AVAL_CR.Color:= clBtnFace;
      btID_AVAL_CR.Enabled:= False;
   End;
End;
procedure TwMPersonal.InterForma1DespuesEliminar(Sender: TObject);
begin
   edCVE_GARANTIA.Text:='';
   edNOM_ID_SOLICITUD.Text:='';
end;

procedure TwMPersonal.InterForma1DespuesShow(Sender: TObject);
begin
   If Objeto.MRegistro.ID_SOLICITUD.AsInteger <> 0 Then Begin
      Objeto.Persona.FindKey([Objeto.ID_AVAL.AsString]);
      Objeto.PersonaAval.FindKey([Objeto.ID_AVAL_CR.AsString]);
      edID_AVAL.SetFocus;
   End;
   LlenaPorcent;
end;

Procedure TwMPersonal.LlenaPorcent;
Var
   sSQL: String;
   qyQuery: TQuery;
Begin
   edEfectiva.Text:= '0';
   edNominal.Text:= '0';
   edCuota.Text:= '0';

   sSQl:=' SELECT CR_GA_DIS_GAR.ID_REG_SOL_GAR, '+
         '        CR_GA_FIRA_CTO.ID_SOLICITUD, '+
         '        CR_GA_FIRA_CTO.ID_CONTRATO, '+
         '        CR_GA_FIRA_CTO.PCT_GTIA_LIQ, '+
         '        CR_GA_FIRA_CTO.CVE_OPERATIVA, '+
         '        CR_CONTRATO.CVE_MONEDA '+

         '   FROM CR_GA_DIS_GAR, CR_CREDITO, CR_CONTRATO, '+
         '			CR_GA_FIRA_CTO '+
         '	 WHERE CR_GA_DIS_GAR.SIT_REL_DIS_GAR = ''AC'''+
         '		AND CR_GA_DIS_GAR.ID_DISPOSICION = CR_CREDITO.ID_CREDITO '+
         '		AND CR_CREDITO.ID_CONTRATO = CR_CONTRATO.ID_CONTRATO '+
         '		AND CR_CREDITO.FOL_CONTRATO = CR_CONTRATO.FOL_CONTRATO '+
         '		AND CR_CREDITO.ID_CONTRATO = CR_GA_FIRA_CTO.ID_CONTRATO '+
         '		AND CR_CREDITO.CVE_OPERATIVA = CR_GA_FIRA_CTO.CVE_OPERATIVA '+
         '		AND CR_GA_FIRA_CTO.SIT_GA_FIRA = ''AC'''+
         '     AND CR_GA_DIS_GAR.ID_REG_SOL_GAR ='+ Objeto.ID_SOLICITUD.AsSQL;

   qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
   If qyQuery <> Nil Then Begin
      If qyQuery.FieldByName('ID_REG_SOL_GAR').AsInteger = Objeto.ID_SOLICITUD.AsInteger Then Begin
         ObtPorc(qyQuery.FieldByName('CVE_MONEDA').AsFloat,
                 qyQuery.FieldByName('CVE_OPERATIVA').AsString,
                 qyQuery.FieldByName('PCT_GTIA_LIQ').AsFloat);
      End;
      qyQuery.Free;
   End;
End;


Function TwMPersonal.ObtPorc(dCveMoneda: Double;dCveOperativa:String;dPorcLiq: Double):Boolean;
Var
   STP : TStoredProc;
   bSalir : Boolean;
Begin
   bSalir:= False;
   STP := TStoredProc.Create(Nil);
   Try
      With STP Do Begin
         DatabaseName:= Objeto.Apli.DatabaseName;
         SessionName:= Objeto.Apli.SessionName;
         StoredProcName:='PKGCRDOCUMENTACION.STPOBTEQUIVALENCIA';
         Params.Clear;
         Params.CreateParam(ftFloat,'PECVE_MONEDA',ptInput);
         Params.CreateParam(ftString,'PECVE_OPERATIVA',ptInput);
         Params.CreateParam(ftFloat,'PEPCT_GTIA_LIQ',ptInput);
         Params.CreateParam(ftFloat,'PSPCT_GTIA_LIQ_INM',ptOutput);
         Params.CreateParam(ftFloat,'PSPCT_GTIA_FEGA_EF',ptOutput);
         Params.CreateParam(ftFloat,'PSPCT_GTIA_FEGA_NO',ptOutput);
         Params.CreateParam(ftFloat,'PSPCT_CUOTA_FEGA',ptOutput);
         Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
         Params.CreateParam(ftString,'PSTX_RESULTADO',ptOutput);

         ParamByName('PECVE_MONEDA').AsFloat := dCveMoneda;
         ParamByName('PECVE_OPERATIVA').AsString := dCveOperativa;
         ParamByName('PEPCT_GTIA_LIQ').AsFloat := dPorcLiq;
         ExecProc;

         If (ParamByName('PSRESULTADO').AsInteger = 0) Then Begin
            Objeto.PCT_GTIA_LIQ_INM.AsFloat := ParamByName('PSPCT_GTIA_LIQ_INM').AsFloat;
            Objeto.PCT_GTIA_FEGA_EF.AsFloat := ParamByName('PSPCT_GTIA_FEGA_EF').AsFloat;
            Objeto.PCT_GTIA_FEGA_NO.AsFloat := ParamByName('PSPCT_GTIA_FEGA_NO').AsFloat;
            Objeto.PCT_CUOTA_FEGA.AsFloat   := ParamByName('PSPCT_CUOTA_FEGA').AsFloat;
            bSalir:=True;
         End Else
            ShowMessage('PROBLEMAS AL OBTENER LOS PORCENTAJES ' +
            IntToStr(ParamByName('PSRESULTADO').AsInteger)+': '+
            ParamByName('PSTX_RESULTADO').AsString);
      End;
   Finally
      STP.Free;
   End;
   ObtPorc:= bSalir;
End;

end.
