// Sistema         : Clase de CR_GA_CESION
// Fecha de Inicio : 05/07/2004
// Función forma   : Clase de CR_GA_CESION
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMCesion;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,IntGenCre,
IntParamCre, InterEdit, IntCrRePrMn, IntMRegistro, IntEmisora,
IntPers
;

Type
 TMCesion= class;

  TwMCesion=Class(TForm)
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
    lbIMP_DEPOSITO: TLabel;
    edPCT_CESION: TInterEdit;
    Label14: TLabel;
    edCVE_GARANTIA: TEdit;
    edTX_TIPO_CESION: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edNOMBRE_CEDENTE: TEdit;
    Label5: TLabel;
    edDESC_DEPENDENCIA: TEdit;
    Label7: TLabel;
    edUNIDAD_TIEMPO_CE: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    edF_VIGENCIA_INI: TEdit;
    dtpF_VIGENCIA_INI: TInterDateTimePicker;
    Label1: TLabel;
    edF_VIGENCIA_FIN: TEdit;
    dtpF_VIGENCIA_FIN: TInterDateTimePicker;
    Label2: TLabel;
    edIMP_EJECUTAR: TInterEdit;
    Label10: TLabel;
    edIMP_EJECUTADA: TInterEdit;
    Label11: TLabel;
    edNUM_UNIDADES_CE: TInterEdit;
    edDIA_COBRO_CE: TInterEdit;
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
    procedure edPCT_CESIONExit(Sender: TObject);
    procedure edTX_TIPO_CESIONExit(Sender: TObject);
    procedure edNOMBRE_CEDENTEExit(Sender: TObject);
    procedure edDESC_DEPENDENCIAExit(Sender: TObject);
    procedure edUNIDAD_TIEMPO_CEExit(Sender: TObject);
    procedure edNUM_UNIDADES_CEExit(Sender: TObject);
    procedure edDIA_COBRO_CEExit(Sender: TObject);
    procedure edF_VIGENCIA_INIExit(Sender: TObject);
    procedure edF_VIGENCIA_FINExit(Sender: TObject);
    procedure edIMP_EJECUTARExit(Sender: TObject);
    procedure edIMP_EJECUTADAExit(Sender: TObject);
    procedure edUNIDAD_TIEMPO_CEChange(Sender: TObject);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);

    private
    { Private declarations }
       Procedure CambiaControl;
    public
    { Public declarations }
      Objeto : TMCesion;
    end;

 TMCesion= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        ID_SOLICITUD        : TInterCampo;
        TX_TIPO_CESION      : TInterCampo;
        NOMBRE_CEDENTE      : TInterCampo;
        DESC_DEPENDENCIA    : TInterCampo;
        PCT_CESION          : TInterCampo;
        UNIDAD_TIEMPO_CE    : TInterCampo;
        NUM_UNIDADES_CE     : TInterCampo;
        DIA_COBRO_CE        : TInterCampo;
        F_VIGENCIA_INI      : TInterCampo;
        F_VIGENCIA_FIN      : TInterCampo;
        IMP_EJECUTAR        : TInterCampo;
        IMP_EJECUTADA       : TInterCampo;
        SIT_CESION          : TInterCampo;
        F_ALTA              : TInterCampo;
        CVE_USU_ALTA        : TInterCampo;
        F_MODIFICA          : TInterCampo;
        CVE_USU_MODIFICA    : TInterCampo;

        ParamCre            : TParamCre;
        MRegistro           : TMRegistro;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

implementation
{$R *.DFM}

constructor TMCesion.Create( AOwner : TComponent );
begin Inherited;
   ID_SOLICITUD :=CreaCampo('ID_SOLICITUD',ftFloat,tsNinguno,tsNinguno,True);
      ID_SOLICITUD.Caption:='Identificador del registro de garantía';
   TX_TIPO_CESION :=CreaCampo('TX_TIPO_CESION',ftString,tsNinguno,tsNinguno,True);
      TX_TIPO_CESION.Caption:='Tipo de cesión de derechos';
      TX_TIPO_CESION.NoCompare:= True;
   NOMBRE_CEDENTE :=CreaCampo('NOMBRE_CEDENTE',ftString,tsNinguno,tsNinguno,True);
      NOMBRE_CEDENTE.Caption:='Nombre de cedente';
      NOMBRE_CEDENTE.NoCompare:= True;
   DESC_DEPENDENCIA :=CreaCampo('DESC_DEPENDENCIA',ftString,tsNinguno,tsNinguno,True);
      DESC_DEPENDENCIA.Caption:='Descripción de dependencia';
      DESC_DEPENDENCIA.NoCompare:= True;
   PCT_CESION :=CreaCampo('PCT_CESION',ftFloat,tsNinguno,tsNinguno,True);
      PCT_CESION.Caption:='Porcentaje de la cesión';
      PCT_CESION.NoCompare:= True;
   UNIDAD_TIEMPO_CE :=CreaCampo('UNIDAD_TIEMPO_CE',ftString,tsNinguno,tsNinguno,True);
      UNIDAD_TIEMPO_CE.Caption:='Unidades de tiempo para cesión';
      UNIDAD_TIEMPO_CE.NoCompare:= True;
   NUM_UNIDADES_CE :=CreaCampo('NUM_UNIDADES_CE',ftFloat,tsNinguno,tsNinguno,True);
      NUM_UNIDADES_CE.Caption:='Número de unidades de tiempo para cesión';
      NUM_UNIDADES_CE.NoCompare:= True;
   DIA_COBRO_CE :=CreaCampo('DIA_COBRO_CE',ftFloat,tsNinguno,tsNinguno,True);
      DIA_COBRO_CE.Caption:='Día de cobro';
      DIA_COBRO_CE.NoCompare:= True;
   F_VIGENCIA_INI :=CreaCampo('F_VIGENCIA_INI',ftDate,tsNinguno,tsNinguno,True);
      F_VIGENCIA_INI.Caption:='Fecha de terminación/vencimiento';
      F_VIGENCIA_INI.NoCompare:= True;
   F_VIGENCIA_FIN :=CreaCampo('F_VIGENCIA_FIN',ftDate,tsNinguno,tsNinguno,True);
      F_VIGENCIA_FIN.Caption:='Fecha de inicio de vigencia';
      F_VIGENCIA_FIN.NoCompare:= True;
   IMP_EJECUTAR :=CreaCampo('IMP_EJECUTAR',ftFloat,tsNinguno,tsNinguno,True);
      IMP_EJECUTAR.Caption:='Valor de obra por ejecutar';
      IMP_EJECUTAR.NoCompare:= True;
   IMP_EJECUTADA :=CreaCampo('IMP_EJECUTADA',ftFloat,tsNinguno,tsNinguno,True);
      IMP_EJECUTADA.Caption:='Valor de obra ejecutada';
      IMP_EJECUTADA.NoCompare:= True;
   SIT_CESION :=CreaCampo('SIT_CESION',ftString,tsNinguno,tsNinguno,True);
   With SIT_CESION Do Begin
      Size:=2;
      UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add('AC');
      ComboLista.Add('1'); ComboDatos.Add('IN');
   end;
      SIT_CESION.Caption:='Situación';
      SIT_CESION.NoCompare:= True;
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
   TableName := 'CR_GA_CESION';
   UseQuery := True;
   HelpFile := 'IntMCesion.Hlp';
   ShowMenuReporte:=True;

   MRegistro := TMRegistro.Create(Self);
   MRegistro.MasterSource:=Self;
   MRegistro.FieldByName('ID_SOLICITUD').MasterField:='ID_SOLICITUD';
end;


Destructor TMCesion.Destroy;
begin
//   If MRegistro <> Nil Then
//      MRegistro.Free;
   Inherited;
end;

function TMCesion.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMCesion;
begin
   W:=TWMCesion.Create(Self);
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

Function TMCesion.InternalBusca:Boolean;
Var T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IMCesion.it','I');
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

function TMCesion.Reporte:Boolean;
begin
   Result := False;
end;


(***********************************************FORMA CR_GA_CESION********************)
(*                                                                              *)
(*  FORMA DE CR_GA_CESION                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_GA_CESION********************)

procedure TwMCesion.FormShow(Sender: TObject);
begin
   InterForma1.BtnNuevo.Visible:= False;
   
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   With Objeto Do Begin
      ID_SOLICITUD.Control        := edID_SOLICITUD;
      TX_TIPO_CESION.Control      := edTX_TIPO_CESION;
      NOMBRE_CEDENTE.Control      := edNOMBRE_CEDENTE;
      DESC_DEPENDENCIA.Control    := edDESC_DEPENDENCIA;
      PCT_CESION.Control          := edPCT_CESION;
      UNIDAD_TIEMPO_CE.Control    := edUNIDAD_TIEMPO_CE;
      NUM_UNIDADES_CE.Control     := edNUM_UNIDADES_CE;
      DIA_COBRO_CE.Control        := edDIA_COBRO_CE;
      F_VIGENCIA_INI.Control      := edF_VIGENCIA_INI;
      F_VIGENCIA_FIN.Control      := edF_VIGENCIA_FIN;
      IMP_EJECUTAR.Control        := edIMP_EJECUTAR;
      IMP_EJECUTADA.Control       := edIMP_EJECUTADA;
      SIT_CESION.Control          := rgSITUACION;
      F_ALTA.Control              := edF_ALTA;
      CVE_USU_ALTA.Control        := edCVE_USU_ALTA;
      F_MODIFICA.Control          := edF_MODIFICA;
      CVE_USU_MODIFICA.Control    := edCVE_USU_MODIF;
      InterForma1.MsgPanel        := PnlMsg;

      MRegistro.ID_SOLICITUD.Control := edID_SOLICITUD;
      MRegistro.CVE_GARANTIA.Control := edCVE_GARANTIA;
      MRegistro.Garantia.DESC_GARANTIA.Control := edNOM_ID_SOLICITUD;
      MRegistro.GetParams(Objeto);
   End;
end;

procedure TwMCesion.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      ID_SOLICITUD.Control        := Nil;
      TX_TIPO_CESION.Control      := Nil;
      NOMBRE_CEDENTE.Control      := Nil;
      DESC_DEPENDENCIA.Control    := Nil;
      PCT_CESION.Control          := Nil;
      UNIDAD_TIEMPO_CE.Control    := Nil;
      NUM_UNIDADES_CE.Control     := Nil;
      DIA_COBRO_CE.Control        := Nil;
      F_VIGENCIA_INI.Control      := Nil;
      F_VIGENCIA_FIN.Control      := Nil;
      IMP_EJECUTAR.Control        := Nil;
      IMP_EJECUTADA.Control       := Nil;
      SIT_CESION.Control          := Nil;
      F_ALTA.Control              := Nil;
      CVE_USU_ALTA.Control        := Nil;
      F_MODIFICA.Control          := Nil;
      CVE_USU_MODIFICA.Control    := Nil;
      InterForma1.MsgPanel        := Nil;

      MRegistro.ID_SOLICITUD.Control := Nil;
      MRegistro.CVE_GARANTIA.Control := Nil;
      MRegistro.Garantia.DESC_GARANTIA.Control := Nil;
   End;
end;

procedure TwMCesion.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMCesion.InterForma1Buscar(Sender: TObject);
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

procedure TwMCesion.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.F_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   edF_VIGENCIA_INI.Text:= FormatDateTime('dd/mm/yyyy',Objeto.Apli.DameFechaEmpresaDia('D000'));
   dtpF_VIGENCIA_INI.DateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   edF_VIGENCIA_FIN.Text:= FormatDateTime('dd/mm/yyyy',Objeto.Apli.DameFechaEmpresaDia('D000'));
   dtpF_VIGENCIA_FIN.DateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   edID_SOLICITUD.SetFocus;
   rgSITUACION.ItemIndex:= 0;
   CambiaControl;
   If Objeto.MRegistro.ID_SOLICITUD.AsInteger <> 0 Then Begin
      Objeto.ID_SOLICITUD.AsInteger:= Objeto.MRegistro.ID_SOLICITUD.AsInteger;
      edTX_TIPO_CESION.SetFocus;
   End;
end;

procedure TwMCesion.rgSITUACIONExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSITUACION,True,CNULL,True);
end;

procedure TwMCesion.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.F_MODIFICA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
   CambiaControl;
   edTX_TIPO_CESION.SetFocus;
end;

procedure TwMCesion.InterForma1AntesAceptar(Sender: TObject;
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

procedure TwMCesion.edID_SOLICITUDExit(Sender: TObject);
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
         sSQL:= 'SELECT * FROM CR_GA_CESION WHERE ID_SOLICITUD='+Objeto.ID_SOLICITUD.AsSQL;
         qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName,Objeto.Apli.SessionName, False);
         If InterForma1.IsNewData Then Begin
            If qyQuery <> Nil Then Begin
               If qyQuery.FieldByName('ID_SOLICITUD').AsInteger = Objeto.ID_SOLICITUD.AsInteger Then Begin
                  vlSalida   := False;
                  vlMsg := 'El de registro de garantía ya existe en la categoría de garantías de Cesiones';
               End;
               qyQuery.Free;
            End;
         End;
      End;
      InterForma1.ValidaExit(edID_SOLICITUD,vlSalida,vlMsg,True);
   End;
end;

procedure TwMCesion.ilID_SOLICITUDCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit)and (InterForma1.IsNewData);
end;

procedure TwMCesion.ilID_SOLICITUDEjecuta(Sender: TObject);
begin
   If Objeto.MRegistro.FindKey([ilID_SOLICITUD.Buffer]) Then Begin
      InterForma1.NextTab(edID_SOLICITUD);
   End;
end;

procedure TwMCesion.btID_SOLICITUDClick(Sender: TObject);
begin
   Objeto.MRegistro.ShowAll := True;
   If Objeto.MRegistro.Busca Then Begin
      InterForma1.NextTab(edID_SOLICITUD);
   End;
end;

procedure TwMCesion.edPCT_CESIONExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.PCT_CESION.GetFromControl;
      If Objeto.PCT_CESION.AsFloat = 0 Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar el porcentaje de cesión';
      End;
      InterForma1.ValidaExit(edPCT_CESION,vlSalida,vlMsg,True);
   End;
end;

procedure TwMCesion.edTX_TIPO_CESIONExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.TX_TIPO_CESION.GetFromControl;
      If Objeto.TX_TIPO_CESION.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar el tipo de cesión';
      End;
      InterForma1.ValidaExit(edTX_TIPO_CESION,vlSalida,vlMsg,True);
   End;
end;

procedure TwMCesion.edNOMBRE_CEDENTEExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.NOMBRE_CEDENTE.GetFromControl;
      If Objeto.NOMBRE_CEDENTE.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar el nombre del cedente';
      End;
      InterForma1.ValidaExit(edNOMBRE_CEDENTE,vlSalida,vlMsg,True);
   End;
end;

procedure TwMCesion.edDESC_DEPENDENCIAExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.DESC_DEPENDENCIA.GetFromControl;
      If Objeto.DESC_DEPENDENCIA.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar el nombre de la dependencia';
      End;
      InterForma1.ValidaExit(edDESC_DEPENDENCIA,vlSalida,vlMsg,True);
   End;
end;

procedure TwMCesion.edUNIDAD_TIEMPO_CEExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg:  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      CambiaControl;
      InterForma1.ValidaExit(edUNIDAD_TIEMPO_CE,vlSalida,vlMsg,True);
   End;
end;

procedure TwMCesion.edNUM_UNIDADES_CEExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edNUM_UNIDADES_CE,True,CNULL,True);
end;

procedure TwMCesion.edDIA_COBRO_CEExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edDIA_COBRO_CE,True,CNULL,True);
end;

procedure TwMCesion.edF_VIGENCIA_INIExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.F_VIGENCIA_INI.GetFromControl;
      If Objeto.F_VIGENCIA_INI.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar la fecha de inicio de vigencia';
      End;
      InterForma1.ValidaExit(edF_VIGENCIA_INI,vlSalida,vlMsg,True);
   End;
end;

procedure TwMCesion.edF_VIGENCIA_FINExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.F_VIGENCIA_FIN.GetFromControl;
      If Objeto.F_VIGENCIA_FIN.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar la fecha de fin de vigencia';
      End;
      InterForma1.ValidaExit(edF_VIGENCIA_FIN,vlSalida,vlMsg,True);
   End;
end;

procedure TwMCesion.edIMP_EJECUTARExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.IMP_EJECUTAR.GetFromControl;
      If Objeto.IMP_EJECUTAR.AsFloat = 0 Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar el valor de la obra por ejecutar';
      End;
      InterForma1.ValidaExit(edIMP_EJECUTAR,vlSalida,vlMsg,True);
   End;
end;

procedure TwMCesion.edIMP_EJECUTADAExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.IMP_EJECUTADA.GetFromControl;
      If Objeto.IMP_EJECUTADA.AsFloat = 0 Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar el valor de la obra ejecutada';
      End;
      InterForma1.ValidaExit(edIMP_EJECUTADA,vlSalida,vlMsg,True);
   End;
end;

procedure TwMCesion.edUNIDAD_TIEMPO_CEChange(Sender: TObject);
begin
   CambiaControl;
end;

Procedure TwMCesion.CambiaControl;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      Objeto.UNIDAD_TIEMPO_CE.GetFromControl;
      If Objeto.UNIDAD_TIEMPO_CE.AsString = CNULL Then Begin
         edNUM_UNIDADES_CE.ReadOnly:= True;
         edNUM_UNIDADES_CE.Text:= '0';
         edDIA_COBRO_CE.ReadOnly:= True;
         edDIA_COBRO_CE.Text:= '0';
      End Else Begin
         edNUM_UNIDADES_CE.ReadOnly:= False;
         edDIA_COBRO_CE.ReadOnly:= False;
      End;
   End;
End;
procedure TwMCesion.InterForma1DespuesEliminar(Sender: TObject);
begin
   edCVE_GARANTIA.Text:='';
   edNOM_ID_SOLICITUD.Text:='';
end;

procedure TwMCesion.InterForma1DespuesShow(Sender: TObject);
begin
   If Objeto.MRegistro.ID_SOLICITUD.AsInteger <> 0 Then Begin
      edTX_TIPO_CESION.SetFocus;
   End;
end;

End.
