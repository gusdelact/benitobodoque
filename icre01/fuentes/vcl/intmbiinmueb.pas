// Sistema         : Clase de CR_GA_BI_INMUEB
// Fecha de Inicio : 02/07/2004
// Función forma   : Clase de CR_GA_BI_INMUEB
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMBiInmueb;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,IntGenCre,
IntParamCre, InterEdit, IntCrRePrMn, IntMNotario, IntMRegistro, IntMPerito,
IntCrRePaCnb, //Localidac CNBV
IntCrMunCnb // Municipios CNBV
;

Type
 TMBiInmueb= class;

  TwMBiInmueb=Class(TForm)
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
    btID_NOT_PUB: TBitBtn;
    edNOM_ID_DOMICILIO: TEdit;
    ilID_NOT_PUB: TInterLinkit;
    Label6: TLabel;
    edNOMBRE_VALUADOR: TEdit;
    Label7: TLabel;
    edF_VALUACION: TEdit;
    dtpF_VALUACION: TInterDateTimePicker;
    Label8: TLabel;
    edID_NOT_PUB: TEdit;
    edNOM_NOT_PUB: TEdit;
    Label10: TLabel;
    edID_SOLICITUD: TInterEdit;
    btID_SOLICITUD: TBitBtn;
    edNOM_ID_SOLICITUD: TEdit;
    ilID_SOLICITUD: TInterLinkit;
    edID_DOMICILIO: TEdit;
    edCVE_GARANTIA: TEdit;
    edID_VALUADOR: TEdit;
    btID_VALUADOR: TBitBtn;
    ilID_VALUADOR: TInterLinkit;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    edCVE_LOCAL_CNBV: TEdit;
    edNO_AVALUO: TEdit;
    BitBtn1: TBitBtn;
    edIMP_AVALUO: TInterEdit;
    edDESC_LOCAL_CNBV: TEdit;
    ilCVE_LOCAL_CNBV: TInterLinkit;
    edCVE_MUNICIPIO: TInterEdit;
    Label5: TLabel;
    BitBtn2: TBitBtn;
    edDESC_MUNICIPIO: TEdit;
    ilCVE_MUNICIPIO: TInterLinkit;
    edFOLIO: TInterEdit;
    cbCVE_LOCAL_EJECUT: TComboBox;
    Label9: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure rgSITUACIONExit(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure ilID_NOT_PUBCapture(Sender: TObject; var Show: Boolean);
    procedure ilID_NOT_PUBEjecuta(Sender: TObject);
    procedure btID_NOT_PUBClick(Sender: TObject);
    procedure edID_SOLICITUDExit(Sender: TObject);
    procedure ilID_SOLICITUDCapture(Sender: TObject; var Show: Boolean);
    procedure ilID_SOLICITUDEjecuta(Sender: TObject);
    procedure btID_SOLICITUDClick(Sender: TObject);
    procedure edF_VALUACIONExit(Sender: TObject);
    procedure edID_NOT_PUBExit(Sender: TObject);
    procedure btID_VALUADORClick(Sender: TObject);
    procedure edID_VALUADORExit(Sender: TObject);
    procedure ilID_VALUADORCapture(Sender: TObject; var Show: Boolean);
    procedure ilID_VALUADOREjecuta(Sender: TObject);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ilCVE_LOCAL_CNBVEjecuta(Sender: TObject);
    procedure edCVE_LOCAL_CNBVExit(Sender: TObject);
    procedure edIMP_AVALUOExit(Sender: TObject);
    procedure edNO_AVALUOExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);

    private
    { Private declarations }
      procedure ListaJurisprudencia;
    public
    { Public declarations }
      Objeto : TMBiInmueb;
    end;

 TMBiInmueb= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        ID_SOLICITUD        : TInterCampo;
        ID_VALUADOR         : TInterCampo;
        F_VALUACION         : TInterCampo;
        ID_NOT_PUB          : TInterCampo;
        SIT_BI_INMUEB       : TInterCampo;
        F_ALTA              : TInterCampo;
        CVE_USU_ALTA        : TInterCampo;
        F_MODIFICA          : TInterCampo;
        CVE_USU_MODIFICA    : TInterCampo;
        ID_ACREDITADO       : TInterCampo;
        CVE_MUNICIPIO       : TInterCampo;

        ParamCre            : TParamCre;
        MRegistro           : TMRegistro;
        MNotario            : TMNotario;
        MPerito             : TMPerito;


        //RIRA4281 23jun2010 se agregan los datos del avaluo
        LocalCNBV           : TCrRePaCnb;
        MunicipioCNBV       : TCrMunCnb;
        CVE_LOCAL_CNBV      : TInterCampo;
        IMP_AVALUO          : TInterCampo;
        NO_AVALUO           : TInterCampo;
        CVE_LOCAL_EJECUT       : TInterCampo;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

implementation
{$R *.DFM}

constructor TMBiInmueb.Create( AOwner : TComponent );
begin Inherited;
   ID_SOLICITUD :=CreaCampo('ID_SOLICITUD',ftFloat,tsNinguno,tsNinguno,True);
      ID_SOLICITUD.Caption:='Identificador del  inmueble';
   ID_VALUADOR :=CreaCampo('ID_VALUADOR',ftFloat,tsNinguno,tsNinguno,True);
      ID_VALUADOR.Caption:='Identificador del valuador';
      ID_VALUADOR.NoCompare:= True;
   F_VALUACION :=CreaCampo('F_VALUACION',ftDate,tsNinguno,tsNinguno,True);
      F_VALUACION.Caption:='Fecha de valuación de la garantía';
      F_VALUACION.NoCompare:= True;
   ID_NOT_PUB :=CreaCampo('ID_NOT_PUB',ftFloat,tsNinguno,tsNinguno,True);
      ID_NOT_PUB.Caption:='Identificador de Notario Público';
      ID_NOT_PUB.NoCompare:= True;
   SIT_BI_INMUEB :=CreaCampo('SIT_BI_INMUEB',ftString,tsNinguno,tsNinguno,True);
   With SIT_BI_INMUEB do begin
      Size:=2;
      UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add('AC');
      ComboLista.Add('1'); ComboDatos.Add('IN');
   end;
      SIT_BI_INMUEB.Caption:='Situación';
      SIT_BI_INMUEB.NoCompare:= True;
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
   ID_ACREDITADO :=CreaCampo('ID_ACREDITADO',ftString,tsNinguno,tsNinguno,False);
      ID_ACREDITADO.Caption:='Identificador de Usu Acreditado';
      ID_ACREDITADO.NoCompare:= True;

    //RIRA4281 23jun2010 se dan de alta los datos del avaluo
    CVE_LOCAL_CNBV :=CreaCampo('CVE_LOCAL_CNBV',ftString,tsNinguno,tsNinguno,True);
              CVE_LOCAL_CNBV.Caption:='Localidad del avaluo';
    CVE_MUNICIPIO :=CreaCampo('CVE_MUNICIPIO',ftString,tsNinguno,tsNinguno,True);
              CVE_MUNICIPIO.Caption:='Clave de Municipio';


    IMP_AVALUO :=CreaCampo('IMP_AVALUO',ftfloat,tsNinguno,tsNinguno,True);
              IMP_AVALUO.Caption:='Importe Avaluo';
    NO_AVALUO :=CreaCampo('NO_AVALUO',ftString,tsNinguno,tsNinguno,True);
              NO_AVALUO.Caption:='Numero Avaluo';
    {$WARNINGS OFF}
    LocalCNBV := TCrRePaCnb.Create(Self);
    MunicipioCNBV := TCrMunCnb.Create(Self);
    {$WARNINGS ON}
    LocalCNBV.MasterSource:= Self;
    LocalCNBV.FieldByName('CVE_LOCAL_CNBV').MasterField:= 'CVE_LOCAL_CNBV';

    MunicipioCNBV.MasterSource:= Self;
    MunicipioCNBV.FieldByName('CVE_MUNICIPIO').MasterField:= 'CVE_MUNICIPIO';
    //RIRA4281 23jun2010

    //RUCJ4248: 
    CVE_LOCAL_EJECUT :=CreaCampo('CVE_LOCAL_EJECUT',ftString,tsNinguno,tsNinguno,True);
    CVE_LOCAL_EJECUT.Caption:='Localidad de Ejecutablilidad';

   FKeyFields.Add('ID_SOLICITUD');
   TableName := 'CR_GA_BI_INMUEB';
   UseQuery := True;
   HelpFile := 'IntMBiInmueb.Hlp';
   ShowMenuReporte:=True;

   MRegistro := TMRegistro.Create(Self);
   MRegistro.MasterSource:=Self;
   MRegistro.FieldByName('ID_SOLICITUD').MasterField:='ID_SOLICITUD';

   MNotario := TMNotario.Create(Self);
   MNotario.MasterSource:=Self;
   MNotario.FieldByName('ID_NOTARIO').MasterField:='ID_NOT_PUB';

   MPerito := TMPerito.Create(Self);
   MPerito.MasterSource:=Self;
   MPerito.FieldByName('ID_PERITO').MasterField:='ID_VALUADOR';
end;


Destructor TMBiInmueb.Destroy;
begin
   If MNotario <> Nil Then
      MNotario.Free;
   If MPerito <> Nil Then
      MPerito.Free;
   if LocalCNBV <> nil then
      LocalCNBV.free;
   if MunicipioCNBV <> nil then
      MunicipioCNBV.Free;

   Inherited;
end;

function TMBiInmueb.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMBiInmueb;
begin
   W:=TWMBiInmueb.Create(Self);
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

Function TMBiInmueb.InternalBusca:Boolean;
Var T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IMBiInmueb.it','I');
   Try
      if Active then begin
         T.Param(0,ID_SOLICITUD.AsString);
      end;
      if T.Execute then
         If FindKey([T.DameCampo(0)]) Then Begin
            InternalBusca := True;
         End Else
            InternalBusca := False;
   finally
      T.Free;
   end;
end;

function TMBiInmueb.Reporte:Boolean;
begin
   Result := False;
end;


(***********************************************FORMA CR_GA_BI_INMUEB********************)
(*                                                                              *)
(*  FORMA DE CR_GA_BI_INMUEB                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_GA_BI_INMUEB********************)

procedure TwMBiInmueb.FormShow(Sender: TObject);
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
      ID_NOT_PUB.Control          := edID_NOT_PUB;
      SIT_BI_INMUEB.Control       := rgSITUACION;
      F_ALTA.Control              := edF_ALTA;
      CVE_USU_ALTA.Control        := edCVE_USU_ALTA;
      F_MODIFICA.Control          := edF_MODIFICA;
      CVE_USU_MODIFICA.Control    := edCVE_USU_MODIF;
      InterForma1.MsgPanel        := PnlMsg;
      //CVE_MUNICIPIO.Control       := edCVE_MUNICIPIO;
      CVE_MUNICIPIO.Control       := edFOLIO;

      MRegistro.ID_SOLICITUD.Control := edID_SOLICITUD;
      MRegistro.CVE_GARANTIA.Control := edCVE_GARANTIA;
      MRegistro.Garantia.DESC_GARANTIA.Control := edNOM_ID_SOLICITUD;
      MRegistro.GetParams(Objeto);

      MNotario.ID_NOTARIO.Control := edID_NOT_PUB;
      MNotario.Persona.Nombre.Control  := edNOM_NOT_PUB;
      MNotario.ID_DOMICILIO.Control  := edID_DOMICILIO;
      MNotario.Domicilio.CalleNumero.Control  := edNOM_ID_DOMICILIO;
      MNotario.GetParams(Objeto);

      MPerito.ID_PERITO.Control := edID_VALUADOR;
      MPerito.Persona.Nombre.Control := edNOMBRE_VALUADOR;
      MPerito.GetParams(Objeto);
      //RIRA4281 23jun2010 se agregan los campos del avaluo
      CVE_LOCAL_CNBV.Control:=edCVE_LOCAL_CNBV;

      CVE_LOCAL_EJECUT.control := cbCVE_LOCAL_EJECUT;

      IMP_AVALUO.Control := edIMP_AVALUO;
      NO_AVALUO.Control := edNO_AVALUO;

      LocalCNBV.CVE_LOCAL_CNBV.Control := edCVE_LOCAL_CNBV;
      LocalCNBV.DESC_LOCAL_CNBV.Control := edDESC_LOCAL_CNBV;
      LocalCNBV.GetParams(Objeto);

      MunicipioCNBV.CVE_MUNICIPIO.Control := edCVE_MUNICIPIO;
      MunicipioCNBV.COL_MINUCIPIO.Control := edDESC_MUNICIPIO;

      edFOLIO.Enabled := false;
      edFOLIO.Visible := false;
      ListaJurisprudencia;
   End;
end;

procedure TwMBiInmueb.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      ID_SOLICITUD.Control        := Nil;
      ID_VALUADOR.Control         := Nil;
      F_VALUACION.Control         := Nil;
      ID_NOT_PUB.Control          := Nil;
      SIT_BI_INMUEB.Control       := Nil;
      F_ALTA.Control              := Nil;
      CVE_USU_ALTA.Control        := Nil;
      F_MODIFICA.Control          := Nil;
      CVE_USU_MODIFICA.Control    := Nil;
      InterForma1.MsgPanel        := Nil;

      MRegistro.ID_SOLICITUD.Control := Nil;
      MRegistro.CVE_GARANTIA.Control := Nil;
      MRegistro.Garantia.DESC_GARANTIA.Control := Nil;

      MNotario.ID_NOTARIO.Control := Nil;
      MNotario.Persona.Nombre.Control  := Nil;
      MNotario.ID_DOMICILIO.Control  := Nil;
      MNotario.Domicilio.CalleNumero.Control  := Nil;

      MPerito.ID_PERITO.Control := Nil;
      MPerito.Persona.Nombre.Control := Nil;

      CVE_LOCAL_CNBV.Control:=nil;
      CVE_MUNICIPIO.Control := nil;
     LocalCNBV.CVE_LOCAL_CNBV.Control := nil;
     LocalCNBV.DESC_LOCAL_CNBV.Control := nil;
     IMP_AVALUO.Control := nil;
     NO_AVALUO.Control := nil;
     CVE_LOCAL_EJECUT.Control := nil;


   End;
end;

procedure TwMBiInmueb.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMBiInmueb.InterForma1Buscar(Sender: TObject);
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
            Objeto.ID_ACREDITADO.AsInteger:= qyQuery.FieldByName('ID_ACREDITADO').AsInteger;
            MRegistro.FindKey([Objeto.ID_SOLICITUD.AsInteger,Objeto.ID_ACREDITADO.AsInteger]);
         end;
         qyQuery.Free;
      End;
      Objeto.MNotario.FindKey([Objeto.ID_NOT_PUB.AsInteger]);
      Objeto.MPerito.FindKey([Objeto.ID_VALUADOR.AsInteger]);
   End;
end;

procedure TwMBiInmueb.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.F_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   edF_VALUACION.Text := FormatDateTime('dd/mm/yyyy', Objeto.Apli.DameFechaEmpresaDia('D000'));
   dtpF_VALUACION.DateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   edID_SOLICITUD.SetFocus;
   rgSITUACION.ItemIndex:= 0;
   If Objeto.MRegistro.ID_SOLICITUD.AsInteger <> 0 Then Begin
      Objeto.ID_SOLICITUD.AsInteger := Objeto.MRegistro.ID_SOLICITUD.AsInteger;
      Objeto.ID_ACREDITADO.AsInteger := Objeto.MRegistro.ID_ACREDITADO.AsInteger;
      edID_VALUADOR.SetFocus;
   End;
end;

procedure TwMBiInmueb.rgSITUACIONExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSITUACION,True,CNULL,True);
end;

procedure TwMBiInmueb.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.F_MODIFICA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
   edID_VALUADOR.SetFocus;
end;

procedure TwMBiInmueb.InterForma1AntesAceptar(Sender: TObject;
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

procedure TwMBiInmueb.ilID_NOT_PUBCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit)or (InterForma1.IsNewData);
end;

procedure TwMBiInmueb.ilID_NOT_PUBEjecuta(Sender: TObject);
begin
   If Objeto.MNotario.FindKey([ilID_NOT_PUB.Buffer]) Then
      InterForma1.NextTab(edID_NOT_PUB);
end;

procedure TwMBiInmueb.btID_NOT_PUBClick(Sender: TObject);
begin
   Objeto.MNotario.BuscaWhereString := ' CR_GA_NOTARIO.SIT_NOTARIO =''AC'' ';
   Objeto.MNotario.FilterString := Objeto.MNotario.BuscaWhereString;
   Objeto.MNotario.ShowAll := True;
   If Objeto.MNotario.Busca Then Begin
      InterForma1.NextTab(edID_NOT_PUB);
   End;
end;

procedure TwMBiInmueb.edID_SOLICITUDExit(Sender: TObject);
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
            sSQL:= 'SELECT * FROM CR_GA_BI_INMUEB WHERE ID_SOLICITUD='+Objeto.ID_SOLICITUD.AsString;
            qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName,Objeto.Apli.SessionName, False);
            If qyQuery <> Nil Then Begin
               If qyQuery.FieldByName('ID_SOLICITUD').AsInteger = Objeto.ID_SOLICITUD.AsInteger Then Begin
                  vlSalida   := False;
                  vlMsg := 'El de registro de garantía ya existe en la categoría de Inmueble';
               End;
               qyQuery.Free;
            End;
         End;
      End;
      InterForma1.ValidaExit(edID_SOLICITUD,vlSalida,vlMsg,True);
   End;
end;

procedure TwMBiInmueb.ilID_SOLICITUDCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit)and (InterForma1.IsNewData);
end;

procedure TwMBiInmueb.ilID_SOLICITUDEjecuta(Sender: TObject);
begin
   If Objeto.MRegistro.FindKey([ilID_SOLICITUD.Buffer]) Then Begin
      InterForma1.NextTab(edID_SOLICITUD);
   End;
end;

procedure TwMBiInmueb.btID_SOLICITUDClick(Sender: TObject);
begin
   Objeto.MRegistro.ShowAll := True;
   If Objeto.MRegistro.Busca Then Begin
      InterForma1.NextTab(edID_SOLICITUD);
   End;
end;

procedure TwMBiInmueb.edF_VALUACIONExit(Sender: TObject);
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

procedure TwMBiInmueb.edID_NOT_PUBExit(Sender: TObject);
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

procedure TwMBiInmueb.btID_VALUADORClick(Sender: TObject);
begin
   Objeto.MPerito.BuscaWhereString := ' CR_GA_PERITO.SIT_PERITO =''AC'' ';
   Objeto.MPerito.FilterString := Objeto.MPerito.BuscaWhereString;
   Objeto.MPerito.ShowAll := True;
   If Objeto.MPerito.Busca Then Begin
      InterForma1.NextTab(edID_VALUADOR);
   End;
end;

procedure TwMBiInmueb.edID_VALUADORExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.ID_VALUADOR.GetFromControl;
      If Objeto.ID_VALUADOR.AsFloat = 0 Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar el identificador del Perito Valuador';
      End;
      InterForma1.ValidaExit(edID_VALUADOR,vlSalida,vlMsg,True);
   End;
end;

procedure TwMBiInmueb.ilID_VALUADORCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit)or (InterForma1.IsNewData);
end;

procedure TwMBiInmueb.ilID_VALUADOREjecuta(Sender: TObject);
begin
   If Objeto.MPerito.FindKey([ilID_VALUADOR.Buffer]) Then
      InterForma1.NextTab(edID_VALUADOR);
end;

procedure TwMBiInmueb.InterForma1DespuesEliminar(Sender: TObject);
begin
   edCVE_GARANTIA.Text:='';
   edNOM_ID_SOLICITUD.Text:='';   
end;

procedure TwMBiInmueb.BitBtn1Click(Sender: TObject);
begin
   Objeto.LocalCNBV.ShowAll := True;
   if Objeto.LocalCNBV.Busca then
   Begin
      InterForma1.NextTab(edCVE_LOCAL_CNBV);
   end;
   //end if

end;

procedure TwMBiInmueb.ilCVE_LOCAL_CNBVEjecuta(Sender: TObject);
begin
 if Objeto.LocalCNBV.FindKey([ilCVE_LOCAL_CNBV.Buffer]) then
   InterForma1.NextTab(edCVE_LOCAL_CNBV);

end;

procedure TwMBiInmueb.edCVE_LOCAL_CNBVExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edCVE_LOCAL_CNBV,true,'',True);
end;

procedure TwMBiInmueb.edIMP_AVALUOExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edIMP_AVALUO,true,'',True);
end;


procedure TwMBiInmueb.edNO_AVALUOExit(Sender: TObject);
begin
      InterForma1.ValidaExit(edNO_AVALUO,true,'',True);
end;

procedure TwMBiInmueb.BitBtn2Click(Sender: TObject);
begin
  if Objeto.MunicipioCNBV.Busca then
  begin
    edFOLIO.Text := Objeto.MunicipioCNBV.FOLIO.AsString;
    edCVE_MUNICIPIO.Text := Objeto.MunicipioCNBV.CVE_MUNICIPIO.asString;
    edDESC_MUNICIPIO.Text := Objeto.MunicipioCNBV.NOM_MUNICIPIO.asString + ';' +
          Objeto.MunicipioCNBV.COL_MINUCIPIO.asString;
    InterForma1.NextTab(edCVE_MUNICIPIO);
  end;
end;

procedure TwMBiInmueb.FormActivate(Sender: TObject);
begin
        Objeto.MunicipioCNBV.FindKey([edFolio.text]);
        edCVE_MUNICIPIO.Text := Objeto.MunicipioCNBV.CVE_MUNICIPIO.asString;
        edDESC_MUNICIPIO.Text := Objeto.MunicipioCNBV.NOM_MUNICIPIO.asString + ';' +
              Objeto.MunicipioCNBV.COL_MINUCIPIO.asString;
end;

procedure TwMBiInmueb.ListaJurisprudencia;
const strJurrisprud= 'select (CVE_ESTADO || chr(32) || DESC_ESTADO) as Jurisprud from ADMIPROD.bc_estado';
var
  strQuery       : TQuery;
Begin
   cbCVE_LOCAL_EJECUT.Items.Clear;
   strQuery := TQuery.Create(Self);
   Try
       strQuery.SessionName := Objeto.SessionName;
       strQuery.DataBaseName := Objeto.DataBaseName;
       strQuery.SQL.Clear;
       strQuery.SQL.Add(strJurrisprud);
       strQuery.Open;

       While Not strQuery.Eof Do
         Begin
            cbCVE_LOCAL_EJECUT.Items.Add(strQuery.FieldByName('Jurisprud').AsString);
            strQuery.Next;
         End;
   Finally
     If Assigned(strQuery) Then
      Begin
         strQuery.Close;
         strQuery.Free;
      End;
   End;
end;

end.
