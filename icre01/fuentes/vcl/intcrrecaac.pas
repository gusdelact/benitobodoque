// Sistema         : Clase de CR_REL_CAL_ACRE
// Fecha de Inicio : 30/05/2005
// Función forma   : Clase de CR_REL_CAL_ACRE
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrReCaAc;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Grids, Aligrid, InterEdit,
IntLinkit,

IntGenCre,
IntSICC,
IntParamCre,
IntCrAcredit,  // Acreditados
IntCrCalific   // Catálogo de Calificadoras
;

Type
 TCrReCaAc= class; 

  TWCrRelCalAcre=Class(TForm)
    InterForma1             : TInterForma;
    lbF_ALTA: TLabel;
    lbF_MODIFICA: TLabel;
    LBCVE_USU_ALTA: TLabel;
    lbCVE_USU_MODIFICA: TLabel;
    edF_MODIFICA: TEdit;
    edF_ALTA: TEdit;
    edCVE_USU_MODIFICA: TEdit;
    edCVE_USU_ALTA: TEdit;
    rgSIT_REL_CAL_ACRE: TRadioGroup;
    cbB_PREDETERMINADA: TCheckBox;
    edID_ACREDITADO: TEdit;
    btID_ACREDITADO: TBitBtn;
    edNOM_ACREDITADO: TEdit;
    edNOM_CALIFICADORA: TEdit;
    btID_CALIFICADORA: TBitBtn;
    edID_CALIFICADORA: TEdit;
    lbID_ACREDITADO: TLabel;
    lbID_CALIFICADORA: TLabel;
    MsgPanel: TPanel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    ilID_ACREDITADO: TInterLinkit;
    ilID_CALIFICADORA: TInterLinkit;
    edNOM_ACRED_CALIF: TEdit;
    lbNOM_ACRED_CALIF: TLabel;
    rgCVE_ENTIDAD: TRadioGroup;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure ilID_ACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure btID_ACREDITADOClick(Sender: TObject);
    procedure btID_CALIFICADORAClick(Sender: TObject);
    procedure ilID_ACREDITADOEjecuta(Sender: TObject);
    procedure ilID_CALIFICADORAEjecuta(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1AntesNuevo(Sender: TObject;
      var Realizado: Boolean);
    procedure edID_ACREDITADOExit(Sender: TObject);
    procedure edID_CALIFICADORAExit(Sender: TObject);
    procedure cbB_PREDETERMINADAExit(Sender: TObject);
    procedure rgSIT_REL_CAL_ACREExit(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure edNOM_ACRED_CALIFExit(Sender: TObject);
    procedure rgCVE_ENTIDADExit(Sender: TObject);
    private
    { Private declarations }
      function Valida_Existe_Otra_Calif_Predeter(var vlNOM_CALIFICADORA : String) : Boolean;
      function PredeterminaCalificadora(peID_ACREDITADO, peID_CALIFICADORA : Integer;
                                        var psRESULTADO : Integer; var psTX_RESULTADO : String) : Boolean;
    public
    { Public declarations }
    Objeto : TCrReCaAc;
end; 
 TCrReCaAc= class(TInterFrame) 
      private
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        ParamCre : TParamCre;
        vgID_ACREDITADO          : Integer;
        vgID_CALIFICADORA        : Integer;
        vgCVE_ENTIDAD            : String;
        vgNOM_ACRED_CALIF        : String;

        ID_ACREDITADO            : TInterCampo;
        ID_CALIFICADORA          : TInterCampo;
        CVE_ENTIDAD              : TInterCampo;
        NOM_ACRED_CALIF          : TInterCampo;
        B_PREDETERMINADA         : TInterCampo;
        SIT_REL_CAL_ACRE         : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        F_MODIFICA               : TInterCampo;

        Acreditado   : TCrAcredit;  // Acreditados
        Calificadora : TCrCalific;  // Calificadora

        function    InternalBusca : Boolean; override; 
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;


implementation

{$R *.DFM}


constructor TCrReCaAc.Create( AOwner : TComponent );
begin Inherited;
      vgID_ACREDITADO   := 0;
      vgID_CALIFICADORA := 0;
      vgCVE_ENTIDAD     := '';
      vgNOM_ACRED_CALIF := '';
      ID_ACREDITADO :=CreaCampo('ID_ACREDITADO',ftFloat,tsNinguno,tsNinguno,True);
                ID_ACREDITADO.Caption:='Número de Acreditado';
      ID_CALIFICADORA :=CreaCampo('ID_CALIFICADORA',ftFloat,tsNinguno,tsNinguno,True);
                ID_CALIFICADORA.Caption:='Número de Calificadora';
      B_PREDETERMINADA :=CreaCampo('B_PREDETERMINADA',ftString,tsNinguno,tsNinguno,True);
                ID_CALIFICADORA.Caption:='Calificadora Predeterminada';
      CVE_ENTIDAD :=CreaCampo('CVE_ENTIDAD',ftString,tsNinguno,tsNinguno,True);
                CVE_ENTIDAD.Caption:='Tipo de Identidad';
      NOM_ACRED_CALIF :=CreaCampo('NOM_ACRED_CALIF',ftString,tsNinguno,tsNinguno,True);
                NOM_ACRED_CALIF.Caption:='Nombre del Acreditado asignado para la Calificadora';
      SIT_REL_CAL_ACRE :=CreaCampo('SIT_REL_CAL_ACRE',ftString,tsNinguno,tsNinguno,True);
                SIT_REL_CAL_ACRE.Caption:='Situación Rel Cal Acre';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      FKeyFields.Add('ID_ACREDITADO');
      FKeyFields.Add('ID_CALIFICADORA');

      With CVE_ENTIDAD do
        Begin
        Size:=2;
        UseCombo:=True;
        ComboLista.Add('0'); ComboDatos.Add(CESTADO);
        ComboLista.Add('1'); ComboDatos.Add(CMUNICIPIO);
        ComboLista.Add('2'); ComboDatos.Add(CGOBIERNO_DESC);
        End;

      With SIT_REL_CAL_ACRE do
        Begin
        Size:=2;
        UseCombo:=True;
        ComboLista.Add('0'); ComboDatos.Add(CSIT_AC);
        ComboLista.Add('1'); ComboDatos.Add(CSIT_CA);
        End;

      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource:=Self;
      Acreditado.FieldByName('ID_ACREDITADO').MasterField:='ID_ACREDITADO';
      Acreditado.ShowAll := True;

      Calificadora := TCrCalific.Create(Self);
      Calificadora.MasterSource:=Self;
      Calificadora.FieldByName('ID_CALIFICADORA').MasterField:='ID_CALIFICADORA';
      Calificadora.ShowAll := True;

      TableName := 'CR_REL_CAL_ACRE';
      UseQuery := True;
      HelpFile := 'IntCrReCaAc.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrReCaAc.Destroy;
begin
 If Assigned(Acreditado) Then Acreditado.Free;
 If Assigned(Calificadora) Then Calificadora.Free;
 inherited;
end;

function TCrReCaAc.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrRelCalAcre;
begin
   W:=TWCrRelCalAcre.Create(Self);
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


Function TCrReCaAc.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrRlCA.it','F,F');
      Try if Active then begin T.Param(0,ID_ACREDITADO.AsString);
                               T.Param(1,ID_CALIFICADORA.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA CR_REL_CAL_ACRE********************)
(*                                                                              *)
(*  FORMA DE CR_REL_CAL_ACRE                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_REL_CAL_ACRE********************)

procedure TWCrRelCalAcre.FormShow(Sender: TObject);
begin
 With Objeto Do
  Begin
  lbDempresa.Caption := ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := ParamCre.FECHA.AsString;
  lbDUsuario.Caption := ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

  ID_ACREDITADO.Control     := edID_ACREDITADO;
  ID_CALIFICADORA.Control   := edID_CALIFICADORA;
  NOM_ACRED_CALIF.Control   := edNOM_ACRED_CALIF;
  CVE_ENTIDAD.Control     := rgCVE_ENTIDAD;
  SIT_REL_CAL_ACRE.Control  := rgSIT_REL_CAL_ACRE;
  B_PREDETERMINADA.Control  := cbB_PREDETERMINADA;
  CVE_USU_ALTA.Control      := edCVE_USU_ALTA;
  F_ALTA.Control            := edF_ALTA;
  CVE_USU_MODIFICA.Control  := edCVE_USU_MODIFICA;
  F_MODIFICA.Control        := edF_MODIFICA;

  Acreditado.ID_ACREDITADO.Control  := edID_ACREDITADO;
  Acreditado.Persona.Nombre.Control := edNOM_ACREDITADO;

  Calificadora.ID_CALIFICADORA.Control := edID_CALIFICADORA;
  Calificadora.Persona.Nombre.Control  := edNOM_CALIFICADORA;

  Interforma1.MsgPanel := MsgPanel;
  End;
end;

procedure TWCrRelCalAcre.FormDestroy(Sender: TObject);
begin
 With Objeto Do
  Begin
  ID_ACREDITADO.Control     := Nil;
  ID_CALIFICADORA.Control   := Nil;
  NOM_ACRED_CALIF.Control   := Nil;
  CVE_ENTIDAD.Control     := Nil;
  SIT_REL_CAL_ACRE.Control  := Nil;
  B_PREDETERMINADA.Control  := Nil;
  CVE_USU_ALTA.Control      := Nil;
  F_ALTA.Control            := Nil;
  CVE_USU_MODIFICA.Control  := Nil;
  F_MODIFICA.Control        := Nil;

  Acreditado.ID_ACREDITADO.Control  := Nil;
  Acreditado.Persona.Nombre.Control := Nil;

  Calificadora.ID_CALIFICADORA.Control := Nil;
  Calificadora.Persona.Nombre.Control  := Nil;

  Interforma1.MsgPanel := Nil;
  End;end;

procedure TWCrRelCalAcre.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrRelCalAcre.InterForma1DespuesNuevo(Sender: TObject);
begin If edID_ACREDITADO.Canfocus Then edID_ACREDITADO.SetFocus;
     With Objeto Do
      Begin
       If (vgID_ACREDITADO > 0) Then
         Acreditado.FindKey([IntToStr(vgID_ACREDITADO)]);
       If (vgID_CALIFICADORA > 0) Then
         Begin
         Calificadora.FindKey([IntToStr(vgID_CALIFICADORA)]);
         CVE_ENTIDAD.AsString := vgCVE_ENTIDAD;
         NOM_ACRED_CALIF.AsString := vgNOM_ACRED_CALIF;
         End;
      SIT_REL_CAL_ACRE.AsString := CSIT_AC;
      End;
end;

procedure TWCrRelCalAcre.InterForma1DespuesModificar(Sender: TObject);
begin If cbB_PREDETERMINADA.Canfocus Then cbB_PREDETERMINADA.SetFocus;
end;

procedure TWCrRelCalAcre.ilID_ACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
 Show := TRue;
end;

procedure TWCrRelCalAcre.btID_ACREDITADOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRRECAAC_ACRED',True,True) then
      Objeto.Acreditado.Busca;
end;

procedure TWCrRelCalAcre.btID_CALIFICADORAClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRRECAAC_CALIF',True,True) then
      Objeto.Calificadora.Busca;
end;

procedure TWCrRelCalAcre.ilID_ACREDITADOEjecuta(Sender: TObject);
begin
 With Objeto Do
   If Acreditado.FindKey([ilID_ACREDITADO.Buffer]) Then
end;

procedure TWCrRelCalAcre.ilID_CALIFICADORAEjecuta(Sender: TObject);
begin
 With Objeto Do
   If Calificadora.FindKey([ilID_CALIFICADORA.Buffer]) Then
end;

function TWCrRelCalAcre.Valida_Existe_Otra_Calif_Predeter(var vlNOM_CALIFICADORA : String) : Boolean;
begin
 Result := False; vlNOM_CALIFICADORA := '';
 With Objeto Do
   If (Modo = moAppend) Or (Modo = moEdit) Then
    Begin
    ID_ACREDITADO.GetFromControl;
    ID_CALIFICADORA.GetFromControl;
    If GetSQLStr(' SELECT SUBSTR(PKGCRSICC.STP_OBT_NOM_TITULAR_2(NULL, NULL, ID_CALIFICADORA),1,255) AS NOM_CALIFICADORA '+coCRLF+
                 ' FROM CR_REL_CAL_ACRE'+coCRLF+
                 ' WHERE ID_ACREDITADO = '+ID_ACREDITADO.AsString+coCRLF+
                 '   AND B_PREDETERMINADA = '+SQLStr(CVERDAD)+coCRLF+
                 '   AND SIT_REL_CAL_ACRE <> '+SQLStr(CSIT_CA)+coCRLF+
                 '   AND ID_CALIFICADORA NOT IN ('+ID_CALIFICADORA.AsString+')'+coCRLF,
                 Apli.DataBaseName, Apli.SessionName, 'NOM_CALIFICADORA', vlNOM_CALIFICADORA, True) Then
       Begin
       Result := Trim(vlNOM_CALIFICADORA) <> '';
       End;
    End;
end;

function TWCrRelCalAcre.PredeterminaCalificadora(peID_ACREDITADO, peID_CALIFICADORA : Integer;
                                                 var psRESULTADO : Integer; var psTX_RESULTADO : String) : Boolean;
var Stp : TStoredProc;
begin
  Result := False;
  Stp := TStoredProc.Create(Nil);
  If Assigned(Stp) Then
   With Stp Do
    Try
     StoredProcName := 'PKGCRSICC.STP_PREDETERMINA_CALIFICADORA';
     DatabaseName   := Objeto.Apli.DatabaseName;
     SessionName    := Objeto.Apli.SessionName;
     // Crea Variables
     Params.Clear;
     Params.CreateParam(ftInteger ,'peID_ACREDITADO'   , ptInput);
     Params.CreateParam(ftInteger ,'peID_CALIFICADORA' ,ptInput);
     Params.CreateParam(ftString  ,'peCVE_USU_MODIFICA',ptInput);
     Params.CreateParam(ftDateTime,'peF_MODIFICA'      ,ptInput);
     Params.CreateParam(ftString  ,'peB_COMMIT'        ,ptInput);
     Params.CreateParam(ftInteger ,'psRESULTADO'       ,ptOutput);
     Params.CreateParam(ftString  ,'psTX_RESULTADO'    ,ptOutput);
     // Asigna Variables
     ParamByName('peID_ACREDITADO').AsInteger    := peID_ACREDITADO;
     ParamByName('peID_CALIFICADORA').AsInteger  := peID_CALIFICADORA;
     ParamByName('peCVE_USU_MODIFICA').AsString  := Objeto.Apli.Usuario;
     ParamByName('peF_MODIFICA').AsDateTime      := Objeto.Apli.DameFechaEmpresa;
     ParamByName('peB_COMMIT').AsString          := CVERDAD;
     ExecProc;
     // Asigna Variables de Salida
     psRESULTADO    := ParamByName('psRESULTADO').AsInteger;
     psTX_RESULTADO := ParamByName('psTX_RESULTADO').AsString;
     Result := psRESULTADO = 0;
    Finally
     Stp.Params.Clear;
     Stp.Free;
    End;
end;

procedure TWCrRelCalAcre.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
var vlstrMessage, vlNOM_CALIFICADORA : String;
    mrResult : Word;
begin
  If cbB_PREDETERMINADA.Checked Then
   If Valida_Existe_Otra_Calif_Predeter(vlNOM_CALIFICADORA) Then
     If (MessageDlg('La calificadora "'+vlNOM_CALIFICADORA+'" se encontró como la predeterminada para este acreditado.'+coCRLF+
                    '¿Desea establecer la calificadora "'+edNOM_CALIFICADORA.Text+'" como la nueva predeterminada?'+coCRLF,
                    mtConfirmation, [mbYes, mbNo], 0 ) = mrNo) Then
       Begin
       Realizado := False;
       Exit;
       End; // If Valida_Existe_Otra_Calif_Predeter(vlNOM_CALIFICADORA) Then
   // End If cbB_PREDETERMINADA.Checked Then
 If IsNewData Then vlstrMessage := CCONFIRM_ALMACENA_INS
 Else vlstrMessage := CCONFIRM_ALMACENA_MOD;
 mrResult := MessageDlg(vlstrMessage, mtConfirmation, [mbYes, mbNo], 0);
 With Objeto Do
   If (mrResult = mrYes) Then
    Begin
      If (IsNewData) Then
       Begin
       F_ALTA.AsDateTime      := Apli.DameFechaEmpresa;
       CVE_USU_ALTA.AsString  := Apli.Usuario;
       End
      Else
       Begin
       F_MODIFICA.AsDateTime     := Apli.DameFechaEmpresa;
       CVE_USU_MODIFICA.AsString := Apli.Usuario;
       End;
     End;
 Realizado  := mrResult = mrYes;
 Objeto.NOM_ACRED_CALIF.AsString := edNOM_ACREDITADO.Text;
end;

procedure TWCrRelCalAcre.InterForma1DespuesAceptar(Sender: TObject);
var vlTX_RESULTADO : String;
    vlRESULTADO : Integer;
    sSQL,sOk : String;
    QryTmp : TQuery;
begin
  If cbB_PREDETERMINADA.Checked Then
    If Not PredeterminaCalificadora(Objeto.ID_ACREDITADO.AsInteger, Objeto.ID_CALIFICADORA.AsInteger,
                                    vlRESULTADO, vlTX_RESULTADO) Then
       Begin
       MessageDlg('Problemas al predeterminar la calificadora. Intente nuevamente o avise a sistemas.',
                  mtError, [mbOk], 0);
       Exit;
       End;
    // End If
 // End If
  //RIRA4281 Se agrega para tener homologados todos los registros del mismo acreditado 27 Mayo 10
  QryTmp := TQuery.Create(Application);
  QryTmp.DatabaseName := Objeto.DataBaseName;
  QryTmp.SessionName := Objeto.SessionName;
  sSQL := 'UPDATE CR_REL_CAL_ACRE SET CVE_ENTIDAD = ' +  QuotedStr(Objeto.CVE_ENTIDAD.AsString)  +
          ' WHERE ID_ACREDITADO   = ' +  QuotedStr(Objeto.ID_ACREDITADO.AsString)    +
          ' AND  ID_CALIFICADORA != ' +  Objeto.ID_CALIFICADORA.AsString      +
          ' AND  CVE_ENTIDAD     != ' +  QuotedStr(Objeto.CVE_ENTIDAD.AsString)    ;
  try
    QryTmp.SQL.Text := sSQL;
    QryTmp.ExecSQL;
  except
    ShowMessage('Error al Actualizar la clave de la entidad de los registros del mismo acreditado, intente más tarde');           
  end;
          QryTmp.Free;
end;

procedure TWCrRelCalAcre.InterForma1AntesNuevo(Sender: TObject;
  var Realizado: Boolean);
begin
  Objeto.Active := False;
end;

procedure TWCrRelCalAcre.edID_ACREDITADOExit(Sender: TObject);
var vlstrMsg : String;
begin
 With Objeto Do
  If (Modo = moAppend) Or (Modo = moEdit) Then
   Begin
   vlstrMsg := '';
   ID_ACREDITADO.GetFromControl;
   If (Trim(edID_ACREDITADO.Text) = '') Then vlstrMsg := 'Favor de indicar el '+lbID_ACREDITADO.Caption;
   InterForma1.ValidaExit(edID_ACREDITADO, (vlstrMsg = ''), vlstrMsg,True);
   End;
end;

procedure TWCrRelCalAcre.edID_CALIFICADORAExit(Sender: TObject);
var vlstrMsg : String;
begin
 With Objeto Do
  If (Modo = moAppend) Or (Modo = moEdit) Then
   Begin
   vlstrMsg := '';
   ID_CALIFICADORA.GetFromControl;
   If (Trim(edID_CALIFICADORA.Text) = '') Then vlstrMsg := 'Favor de indicar la '+lbID_CALIFICADORA.Caption;
   InterForma1.ValidaExit(edID_CALIFICADORA, (vlstrMsg = ''), vlstrMsg,True);
   End;
end;

procedure TWCrRelCalAcre.edNOM_ACRED_CALIFExit(Sender: TObject);
var vlstrMsg : String;
begin
 With Objeto Do
  If (Modo = moAppend) Or (Modo = moEdit) Then
   Begin
   vlstrMsg := '';
   NOM_ACRED_CALIF.GetFromControl;
   If (Trim(edNOM_ACRED_CALIF.Text) = '') Then vlstrMsg := 'Favor de indicar el '+lbNOM_ACRED_CALIF.Caption;
   InterForma1.ValidaExit(edNOM_ACRED_CALIF, (vlstrMsg = ''), vlstrMsg,True);
   End;
end;

procedure TWCrRelCalAcre.cbB_PREDETERMINADAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(cbB_PREDETERMINADA, True, '',True);
end;

procedure TWCrRelCalAcre.rgSIT_REL_CAL_ACREExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_REL_CAL_ACRE, True, '',True);
end;

procedure TWCrRelCalAcre.rgCVE_ENTIDADExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgCVE_ENTIDAD, True, '',True);
end;

procedure TWCrRelCalAcre.InterForma1Buscar(Sender: TObject);
begin
  With Objeto Do
   If InternalBusca Then
    Begin
    Acreditado.FindKey([ID_ACREDITADO.AsString]);
    Calificadora.FindKey([ID_CALIFICADORA.AsString]);
    End;
end;

end.
