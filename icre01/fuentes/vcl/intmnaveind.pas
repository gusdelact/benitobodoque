// Sistema         : Clase de CR_GA_NAVE_IND
// Fecha de Inicio : 06/07/2004
// Función forma   : Clase de CR_GA_NAVE_IND
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMNaveInd;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,IntGenCre,
IntParamCre, InterEdit, IntCrRePrMn, IntMRegistro;

Type
 TMNaveInd= class;

  TwMNaveInd=Class(TForm)
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
    edIMP_GARANTIA: TInterEdit;
    cbxInmueble: TCheckBox;
    Button1: TButton;
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
    procedure edIMP_GARANTIAExit(Sender: TObject);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure cbxInmuebleExit(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure InterForma1AntesEliminar(Sender: TObject;
      var Realizado: Boolean);

    private
      Function ExisteReg(iIdSolicitud: Integer): Boolean;
    { Private declarations }
    public
    { Public declarations }
      Objeto : TMNaveInd;
    end;

 TMNaveInd= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        ID_SOLICITUD        : TInterCampo;
        IMP_GARANTIA        : TInterCampo;
        B_INMUEBLE          : TInterCampo;
        SIT_NAVE_IND        : TInterCampo;
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
uses IntMBiInmueb;
{$R *.DFM}

constructor TMNaveInd.Create( AOwner : TComponent );
begin Inherited;
   ID_SOLICITUD :=CreaCampo('ID_SOLICITUD',ftFloat,tsNinguno,tsNinguno,True);
      ID_SOLICITUD.Caption:='Identificador del registro de la garantía';
   IMP_GARANTIA :=CreaCampo('IMP_GARANTIA',ftFloat,tsNinguno,tsNinguno,True);
      IMP_GARANTIA.Caption:='Valor de la garantía';
      IMP_GARANTIA.NoCompare:= True;
   B_INMUEBLE :=CreaCampo('B_INMUEBLE',ftString,tsNinguno,tsNinguno,True);
      B_INMUEBLE.Caption:='Indica si es bien immueble';
      B_INMUEBLE.NoCompare:= True;
   SIT_NAVE_IND :=CreaCampo('SIT_NAVE_IND',ftString,tsNinguno,tsNinguno,True);
   With SIT_NAVE_IND Do Begin
      Size:=2;
      UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add('AC');
      ComboLista.Add('1'); ComboDatos.Add('IN');
   end;
      SIT_NAVE_IND.Caption:='Situación';
      SIT_NAVE_IND.NoCompare:= True;
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
   TableName := 'CR_GA_NAVE_IND';
   UseQuery := True;
   HelpFile := 'IntMNaveInd.Hlp';
   ShowMenuReporte:=True;

   MRegistro := TMRegistro.Create(Self);
   MRegistro.MasterSource:=Self;
   MRegistro.FieldByName('ID_SOLICITUD').MasterField:='ID_SOLICITUD';

end;


Destructor TMNaveInd.Destroy;
begin
   Inherited;
end;

function TMNaveInd.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMNaveInd;
begin
   W:=TWMNaveInd.Create(Self);
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

Function TMNaveInd.InternalBusca:Boolean;
Var T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IMNaveInd.it','I');
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

function TMNaveInd.Reporte:Boolean;
begin
   Result := False;
end;


(***********************************************FORMA CR_GA_NAVE_IND********************)
(*                                                                              *)
(*  FORMA DE CR_GA_NAVE_IND                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_GA_NAVE_IND********************)

procedure TwMNaveInd.FormShow(Sender: TObject);
begin
   InterForma1.BtnNuevo.Visible:= False;
   
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   With Objeto Do Begin
      ID_SOLICITUD.Control        := edID_SOLICITUD;
      IMP_GARANTIA.Control        := edIMP_GARANTIA;
      B_INMUEBLE.Control          := cbxInmueble;
      SIT_NAVE_IND.Control        := rgSITUACION;
      F_ALTA.Control              := edF_ALTA;
      CVE_USU_ALTA.Control        := edCVE_USU_ALTA;
      F_MODIFICA.Control          := edF_MODIFICA;
      CVE_USU_MODIFICA.Control    := edCVE_USU_MODIF;
      InterForma1.MsgPanel        := PnlMsg;

      MRegistro.ID_SOLICITUD.Control := edID_SOLICITUD;
      MRegistro.CVE_GARANTIA.Control := edCVE_GARANTIA;
      MRegistro.Garantia.DESC_GARANTIA.Control := edNOM_ID_SOLICITUD;
      MRegistro.VALOR_GARANTIA.Control := edIMP_GARANTIA;
      MRegistro.GetParams(Objeto);
   End;
end;

procedure TwMNaveInd.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      ID_SOLICITUD.Control        := Nil;
      IMP_GARANTIA.Control        := Nil;
      B_INMUEBLE.Control          := Nil;
      SIT_NAVE_IND.Control        := Nil;
      F_ALTA.Control              := Nil;
      CVE_USU_ALTA.Control        := Nil;
      F_MODIFICA.Control          := Nil;
      CVE_USU_MODIFICA.Control    := Nil;
      InterForma1.MsgPanel        := Nil;

      MRegistro.ID_SOLICITUD.Control := Nil;
      MRegistro.CVE_GARANTIA.Control := Nil;
      MRegistro.Garantia.DESC_GARANTIA.Control := Nil;
      MRegistro.VALOR_GARANTIA.Control := Nil;      
   End;
end;

procedure TwMNaveInd.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMNaveInd.InterForma1Buscar(Sender: TObject);
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

procedure TwMNaveInd.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.F_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   edID_SOLICITUD.SetFocus;
   rgSITUACION.ItemIndex:= 0;
   If Objeto.MRegistro.ID_SOLICITUD.AsInteger <> 0 Then Begin
      Objeto.ID_SOLICITUD.AsInteger:= Objeto.MRegistro.ID_SOLICITUD.AsInteger;
   End;

end;

procedure TwMNaveInd.rgSITUACIONExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSITUACION,True,CNULL,True);
end;

procedure TwMNaveInd.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.F_MODIFICA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
end;

procedure TwMNaveInd.InterForma1AntesAceptar(Sender: TObject;
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

procedure TwMNaveInd.edID_SOLICITUDExit(Sender: TObject);
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
         sSQL:= 'SELECT * FROM CR_GA_NAVE_IND WHERE ID_SOLICITUD='+Objeto.ID_SOLICITUD.AsSQL;
         qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName,Objeto.Apli.SessionName, False);
         If InterForma1.IsNewData Then Begin
            If qyQuery <> Nil Then Begin
               If qyQuery.FieldByName('ID_SOLICITUD').AsInteger = Objeto.ID_SOLICITUD.AsInteger Then Begin
                  vlSalida   := False;
                  vlMsg := 'El de registro de garantía ya existe en la categoría de garantías sin clasificación';
               End;
               qyQuery.Free;
            End;
         End;
      End;
      InterForma1.ValidaExit(edID_SOLICITUD,vlSalida,vlMsg,True);
   End;
end;

procedure TwMNaveInd.ilID_SOLICITUDCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit)and (InterForma1.IsNewData);
end;

procedure TwMNaveInd.ilID_SOLICITUDEjecuta(Sender: TObject);
begin
   If Objeto.MRegistro.FindKey([ilID_SOLICITUD.Buffer]) Then Begin
      InterForma1.NextTab(edID_SOLICITUD);
   End;
end;

procedure TwMNaveInd.btID_SOLICITUDClick(Sender: TObject);
begin
   Objeto.MRegistro.ShowAll := True;
   If Objeto.MRegistro.Busca Then Begin
      InterForma1.NextTab(edID_SOLICITUD);
   End;
end;

procedure TwMNaveInd.edIMP_GARANTIAExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.IMP_GARANTIA.GetFromControl;
      If Objeto.IMP_GARANTIA.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar el importe del valor de la garantía';
      End;
      InterForma1.ValidaExit(edIMP_GARANTIA,vlSalida,vlMsg,True);
   End;
end;

procedure TwMNaveInd.InterForma1DespuesEliminar(Sender: TObject);
begin
   edCVE_GARANTIA.Text:='';
   edNOM_ID_SOLICITUD.Text:='';
end;

procedure TwMNaveInd.InterForma1DespuesShow(Sender: TObject);
begin
   If Objeto.MRegistro.ID_SOLICITUD.AsInteger <> 0 Then Begin
      edIMP_GARANTIA.Text:=Objeto.MRegistro.VALOR_GARANTIA.AsString;

   End;
end;

procedure TwMNaveInd.cbxInmuebleExit(Sender: TObject);
begin
   InterForma1.ValidaExit(cbxInmueble,True,'',True);
end;

procedure TwMNaveInd.InterForma1DespuesAceptar(Sender: TObject);
Var
   MBiInmueb : TMBiInmueb;
   sAccion: String;
begin
   If cbxInmueble.Checked Then Begin
      If InterForma1.IsNewData Then
         sAccion:= 'guardar'
      Else
         sAccion:= 'modificar';

      If MessageDlg('¿Desea '+ sAccion +' los datos de la clasificación del Inmueble?',
         mtConfirmation,[mbYes, mbNo], 0) = mrYes Then Begin
         MBiInmueb := TMBiInmueb.Create(self);
         Try
            MBiInmueb.Apli :=Objeto.Apli;
            MBiInmueb.ParamCre:=Objeto.ParamCre;
            MBiInmueb.MRegistro:=Objeto.MRegistro;
            If Not ExisteReg(Objeto.ID_SOLICITUD.AsInteger) Then Begin
               MBiInmueb.FindKey([Objeto.ID_SOLICITUD.AsInteger]);
               MBiInmueb.Catalogo;
            End Else
               MBiInmueb.Nuevo;
         Finally
            MBiInmueb.Free;
         End;
      End;
   End;
end;
Function TwMNaveInd.ExisteReg(iIdSolicitud: Integer): Boolean;
Var
   sSQL: String;
   qyQuery: TQuery;
Begin
   sSQL:='SELECT * FROM CR_GA_BI_INMUEB WHERE ID_SOLICITUD = '+ IntToStr(iIdSolicitud);
   qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName,Objeto.Apli.SessionName, False);
   If qyQuery <> Nil Then Begin
      If qyQuery.FieldByName('ID_SOLICITUD').AsInteger = iIdSolicitud Then Begin
         ExisteReg:= False;
      End Else Begin
         ExisteReg:= True;
      End;
      qyQuery.Free;
   End Else Begin
      ExisteReg:= True;
   End;
End;

procedure TwMNaveInd.Button1Click(Sender: TObject);
Var
   MBiInmueb : TMBiInmueb;
begin
   If Objeto.B_INMUEBLE.AsString = 'V' Then Begin
      MBiInmueb := TMBiInmueb.Create(self);
      Try
         MBiInmueb.Apli :=Objeto.Apli;
         MBiInmueb.ParamCre:=Objeto.ParamCre;
         MBiInmueb.MRegistro:=Objeto.MRegistro;
         If Not ExisteReg(Objeto.ID_SOLICITUD.AsInteger) Then Begin
            MBiInmueb.FindKey([Objeto.ID_SOLICITUD.AsInteger]);
            MBiInmueb.Catalogo;
         End Else
            MBiInmueb.Nuevo;
      Finally
         MBiInmueb.Free;
      End;
   End Else Begin
      ShowMessage('No es Inmueble');
   End;
end;

procedure TwMNaveInd.InterForma1AntesEliminar(Sender: TObject;
  var Realizado: Boolean);
Var
   sSQL: String;
begin
   If Objeto.B_INMUEBLE.AsString = 'V' Then Begin
      If MessageDlg('Se borraran los datos del Inmueble',
         mtConfirmation,[mbYes, mbNo], 0) = mrYes Then Begin
         sSQL:= 'DELETE CR_GA_BI_INMUEB WHERE ID_SOLICITUD ='+ Objeto.ID_SOLICITUD.AsSQL;
         RunSQL(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False );
         Realizado:= True;
      End Else Begin
         Realizado:= False;
      End;
   End;
end;

end.
