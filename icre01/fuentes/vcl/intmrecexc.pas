// Sistema         : Clase de DO_RECEP_EXC
// Fecha de Inicio : 27/04/2004
// Función forma   : Clase de DO_RECEP_EXC
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMRecExc;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,
IntGenCre, IntParamCre, IntMDoctos, IntMNRiesgo,IntUsuario,
IntMPers, IntMRecTra, IntCrAcredit;

Type
 TMRecExc= class;

  TWMRecExc=Class(TForm)
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
    edID_EMPRESA: TEdit;
    btEMPRESA: TBitBtn;
    edNOM_EMPRESA: TEdit;
    ilEMPRESA: TInterLinkit;
    GroupBox4: TGroupBox;
    lbF_ALTA: TLabel;
    lbF_MODIF: TLabel;
    lbUSUA_ALTA: TLabel;
    lbUSUA_MODIF: TLabel;
    edF_ALTA: TEdit;
    edF_MODIFICA: TEdit;
    edCVE_USUA_ALTA: TEdit;
    edCVE_USUA_MODIF: TEdit;
    rgSIT_RECEP_EXC: TRadioGroup;
    Label3: TLabel;
    edID_TRAMITE: TEdit;
    Label4: TLabel;
    edID_EXCEPCION: TEdit;
    Label5: TLabel;
    edCVE_DOCUMENTO: TEdit;
    btDOCUMENTO: TBitBtn;
    edDOCUMENTO: TEdit;
    ilDocumento: TInterLinkit;
    edTXT_EXCEPCION: TMemo;
    Label2: TLabel;
    dtF_REGULARIZA: TInterDateTimePicker;
    edF_REGULARIZA: TEdit;
    Label6: TLabel;
    Label1: TLabel;
    edCVE_NVL_RIESGO: TEdit;
    btCVE_NVL_RIESGO: TBitBtn;
    edNOM_RIESGO: TEdit;
    ilCVE_NVL_RIESGO: TInterLinkit;
    edTXT_REGULARIZA: TMemo;
    Label7: TLabel;
    Label8: TLabel;
    edCVE_USU_AUTORIZA: TEdit;
    btCVE_USU_AUTORIZA: TBitBtn;
    edNOM_CVE_USU_AUTORIZA: TEdit;
    ilCVE_USU_AUTORIZA: TInterLinkit;
    Label9: TLabel;
    dtF_AUTORIZA: TInterDateTimePicker;
    edF_AUTORIZA: TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1Buscar(Sender: TObject);
    procedure edID_EMPRESAExit(Sender: TObject);
    procedure btEMPRESAClick(Sender: TObject);
    procedure ilEMPRESACapture(Sender: TObject; var Show: Boolean);
    procedure ilEMPRESAEjecuta(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure rgSIT_RECEP_EXCExit(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edID_EMPRESAKeyPress(Sender: TObject; var Key: Char);
    procedure edCVE_DOCUMENTOExit(Sender: TObject);
    procedure btDOCUMENTOClick(Sender: TObject);
    procedure edTXT_EXCEPCIONExit(Sender: TObject);
    procedure edF_REGULARIZAExit(Sender: TObject);
    procedure ilDocumentoCapture(Sender: TObject; var Show: Boolean);
    procedure ilDocumentoEjecuta(Sender: TObject);
    procedure btCVE_NVL_RIESGOClick(Sender: TObject);
    procedure ilCVE_NVL_RIESGOEjecuta(Sender: TObject);
    procedure edCVE_NVL_RIESGOExit(Sender: TObject);
    procedure ilCVE_NVL_RIESGOCapture(Sender: TObject; var Show: Boolean);
    procedure edTXT_REGULARIZAExit(Sender: TObject);
    procedure edCVE_USU_AUTORIZAExit(Sender: TObject);
    procedure ilCVE_USU_AUTORIZACapture(Sender: TObject;
      var Show: Boolean);
    procedure ilCVE_USU_AUTORIZAEjecuta(Sender: TObject);
    procedure btCVE_USU_AUTORIZAClick(Sender: TObject);
    procedure edF_AUTORIZAExit(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);

    private
    { Private declarations }
       Function  ValidaPerfilUsuario: Boolean;
    public
    { Public declarations }
      Objeto : TMRecExc;
    end;

 TMRecExc= class(TInterFrame)
      private
        FBAutoriza:String;
        FBExceptua:String;
      protected
      public
        { Public declarations }
        ID_EMPRESA               : TInterCampo;
        ID_TRAMITE               : TInterCampo;
        ID_EXCEPCION             : TInterCampo;
        CVE_DOCUMENTO            : TInterCampo;
        CVE_NVL_RIESGO           : TInterCampo;
        SIT_RECEP_EXC            : TInterCampo;
        TXT_EXCEPCION            : TInterCampo;
        F_REGULARIZA             : TInterCampo;
        TXT_REGULARIZA           : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_AUTORIZA         : TInterCampo;
        F_AUTORIZA               : TInterCampo;

        ParamCre                 : TParamCre;
        Empresa                  : TMPersona; //Empresa
        Doctos                   : TMDoctos;
        NRiesgo                  : TMNRiesgo;
        Usuario                  : TUsuario;
        RecTra                   : TMRecTra;
        Acreditado               : TCrAcredit;
        
        Property    BAutoriza:String read FBAutoriza write FBAutoriza;
        Property    BExceptua:String read FBExceptua write FBExceptua;
        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        Function    InternalPost:Boolean; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

implementation
{$R *.DFM}

constructor TMRecExc.Create( AOwner : TComponent );
begin Inherited;
   ID_EMPRESA :=CreaCampo('ID_EMPRESA',ftFloat,tsNinguno,tsNinguno,True);
      ID_EMPRESA.Caption:='Identificador de empresa';
      ID_EMPRESA.NoCompare:= False;
   ID_TRAMITE :=CreaCampo('ID_TRAMITE',ftFloat,tsNinguno,tsNinguno,True);
      ID_TRAMITE.Caption:='Folio del trámite';
      ID_TRAMITE.NoCompare:= False;
   ID_EXCEPCION:=CreaCampo('ID_EXCEPCION',ftFloat,tsNinguno,tsNinguno,True);
      ID_EXCEPCION.Caption:='Folio de la Excepción';
      ID_EXCEPCION.NoCompare:= False;
   CVE_DOCUMENTO :=CreaCampo('CVE_DOCUMENTO',ftString,tsNinguno,tsNinguno,True);
      CVE_DOCUMENTO.Caption:='Clave de Documento';
      CVE_DOCUMENTO.NoCompare:= False;
   CVE_NVL_RIESGO :=CreaCampo('CVE_NVL_RIESGO',ftString,tsNinguno,tsNinguno,True);
      CVE_NVL_RIESGO.Caption:='Clave de Riesgo';
      CVE_NVL_RIESGO.NoCompare:= True;
   SIT_RECEP_EXC :=CreaCampo('SIT_RECEP_EXC',ftString,tsNinguno,tsNinguno,True);
   With SIT_RECEP_EXC do begin
      Size:=2;
      UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add('AC');
      ComboLista.Add('2'); ComboDatos.Add('SO');
   end;
      SIT_RECEP_EXC.Caption:='Situación de la excepción de documentos';
      SIT_RECEP_EXC.NoCompare:= True;
   TXT_EXCEPCION :=CreaCampo('TXT_EXCEPCION',ftString,tsNinguno,tsNinguno,True);
      TXT_EXCEPCION.Caption:='Excepciones';
      TXT_EXCEPCION.NoCompare:= True;
   F_REGULARIZA :=CreaCampo('F_REGULARIZA',ftDate,tsNinguno,tsNinguno,True);
      F_REGULARIZA.Caption:='Fecha de Regulariza';
      F_REGULARIZA.NoCompare:= True;
   TXT_REGULARIZA :=CreaCampo('TXT_REGULARIZA',ftString,tsNinguno,tsNinguno,True);
      TXT_REGULARIZA.Caption:='Regulariza';
      TXT_REGULARIZA.NoCompare:= True;
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
   CVE_USU_AUTORIZA :=CreaCampo('CVE_USU_AUTORIZA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_AUTORIZA.Caption:='Clave de Usu Autoriza';
      CVE_USU_AUTORIZA.NoCompare:= True;
   F_AUTORIZA :=CreaCampo('F_AUTORIZA',ftDate,tsNinguno,tsNinguno,True);
      F_AUTORIZA.Caption:='Fecha Autoriza';
      F_AUTORIZA.NoCompare:= True;

   FKeyFields.Add('ID_EMPRESA');
   FKeyFields.Add('ID_TRAMITE');
   FKeyFields.Add('ID_EXCEPCION');
   FKeyFields.Add('CVE_DOCUMENTO');
   TableName := 'DO_RECEP_EXC';
   UseQuery := True;
   HelpFile := 'IntMRecExc.Hlp';
   ShowMenuReporte:=True;

   Empresa := TMPersona.Create(Self);
   Empresa.FilterBy := fbTMPersonaEmpresa;
   Empresa.MasterSource := Self;
   Empresa.FieldByName('ID_PERSONA').MasterField := 'ID_EMPRESA';

   Doctos:= TMDoctos.Create(Self);
   Doctos.MasterSource := Self;
   Doctos.FieldByName('ID_EMPRESA').MasterField := 'ID_EMPRESA';
   Doctos.FieldByName('CVE_DOCUMENTO').MasterField := 'CVE_DOCUMENTO';

   NRiesgo :=TMNRiesgo.Create(Self);
   NRiesgo.MasterSource := Self;
   NRiesgo.FieldByName('ID_EMPRESA').MasterField := 'ID_EMPRESA';
   NRiesgo.FieldByName('CVE_NVL_RIESGO').MasterField := 'CVE_NVL_RIESGO';

   Usuario:= TUsuario.Create(Self);
   Usuario.MasterSource := Self;
   Usuario.FieldByName('CVE_USUARIO').MasterField := 'CVE_USU_AUTORIZA';

   RecTra    := TMRecTra.Create(Self);
   RecTra.MasterSource:= Self;
   RecTra.FieldByName('ID_TRAMITE').MasterField := 'ID_TRAMITE';
end;


Destructor TMRecExc.Destroy;
begin
   If NRiesgo <> Nil Then
      NRiesgo.Free;
   If Usuario <> Nil Then
      Usuario.Free;
   Inherited;
end;

function TMRecExc.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMRecExc;
begin
   W:=TWMRecExc.Create(Self);
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

Function TMRecExc.InternalBusca:Boolean;
Var T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IMRecExc.it','F,F,F,S');
   Try
      if Active then begin
         T.Param(0,ID_EMPRESA.AsString);
         T.Param(1,ID_TRAMITE.AsString);
         T.Param(2,ID_EXCEPCION.AsString);
         T.Param(3,CVE_DOCUMENTO.AsString);
      end;
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2),T.DameCampo(3)]);
   finally
      T.Free;
   end;
end;

function TMRecExc.Reporte:Boolean;
begin
   Result := False;
end;

Function TMRecExc.InternalPost : Boolean;
var    stpInserta : TStoredProc;
       VLSalida     : Boolean;
       Msg          : String;
begin
   InternalPost := False;
   VLSalida := False;
   if Modo=moEdit then begin
          VLSalida:=Inherited InternalPost;
   end;
   if Modo=moAppend then Begin
      stpInserta:=TStoredProc.Create(Nil);
      try
         Try
            stpInserta.DatabaseName:=DataBaseName;
            stpInserta.SessionName:=SessionName;
            stpInserta.Active:=False;
            stpInserta.Params.Clear;
            stpInserta.StoredProcName:='PKGCRDOCUMENTACION.STP_ALTAEXCEPCION';
            stpInserta.Params.CreateParam(ftFloat,'PE_ID_EMPRESA',ptInput);
            stpInserta.Params.CreateParam(ftFloat,'PE_ID_TRAMITE',ptInput);
            stpInserta.Params.CreateParam(ftFloat,'PE_ID_EXCEPCION',ptInput);
            stpInserta.Params.CreateParam(ftString,'PE_CVE_DOCUMENTO',ptInput);
            stpInserta.Params.CreateParam(ftString,'PE_CVE_NVL_RIESGO',ptInput);
            stpInserta.Params.CreateParam(ftString,'PE_SIT_RECEP_EXC',ptInput);
            stpInserta.Params.CreateParam(ftString,'PE_TXT_EXCEPCION',ptInput);
            stpInserta.Params.CreateParam(ftDateTime,'PE_F_REGULARIZA',ptInput);
            stpInserta.Params.CreateParam(ftString,'PE_TXT_REGULARIZA',ptInput);
            stpInserta.Params.CreateParam(ftString,'PE_CVE_USU_ALTA',ptInput);
            stpInserta.Params.CreateParam(ftDateTime,'PE_F_ALTA',ptInput);
            stpInserta.Params.CreateParam(ftString,'PE_CVE_USU_MODIFICA',ptInput);
            stpInserta.Params.CreateParam(ftDateTime,'PE_F_MODIFICA',ptInput);
            stpInserta.Params.CreateParam(ftString,'PE_CVE_USU_AUTORIZA',ptInput);
            stpInserta.Params.CreateParam(ftDateTime,'PE_F_AUTORIZA',ptInput);

            stpInserta.Params.CreateParam(ftFloat,'PS_ID_EXCEPCION',ptOutput);
            stpInserta.Params.CreateParam(ftFloat,'PS_RESULTADO',ptOutput);
            stpInserta.Params.CreateParam(ftString,'PS_TX_RESULTADO',ptOutput);

            stpInserta.ParamByName('PE_ID_EMPRESA').AsFloat := ID_EMPRESA.AsFloat;
            stpInserta.ParamByName('PE_ID_TRAMITE').AsFloat := ID_TRAMITE.AsFloat;
            stpInserta.ParamByName('PE_ID_EXCEPCION').AsFloat := ID_EXCEPCION.AsFloat;
            stpInserta.ParamByName('PE_CVE_DOCUMENTO').AsString := CVE_DOCUMENTO.AsString;
            stpInserta.ParamByName('PE_CVE_NVL_RIESGO').AsString := CVE_NVL_RIESGO.AsString;
            stpInserta.ParamByName('PE_SIT_RECEP_EXC').AsString := SIT_RECEP_EXC.AsString;
            stpInserta.ParamByName('PE_TXT_EXCEPCION').AsString := TXT_EXCEPCION.AsString;

            If F_REGULARIZA.AsDateTime <> 0 Then
               stpInserta.ParamByName('PE_F_REGULARIZA').AsDateTime := F_REGULARIZA.AsDateTime
            Else
               stpInserta.ParamByName('PE_F_REGULARIZA').Clear;

            stpInserta.ParamByName('PE_TXT_REGULARIZA').AsString := TXT_REGULARIZA.AsString;
            stpInserta.ParamByName('PE_CVE_USU_ALTA').AsString := CVE_USU_ALTA.AsString;

            If F_ALTA.AsDateTime <> 0 Then
               stpInserta.ParamByName('PE_F_ALTA').AsDateTime := F_ALTA.AsDateTime
            Else
               stpInserta.ParamByName('PE_F_ALTA').Clear;
            stpInserta.ParamByName('PE_CVE_USU_MODIFICA').AsString := CVE_USU_MODIFICA.AsString;
            If F_MODIFICA.AsDateTime <>0 Then
               stpInserta.ParamByName('PE_F_MODIFICA').AsDateTime := F_MODIFICA.AsDateTime
            Else
               stpInserta.ParamByName('PE_F_MODIFICA').Clear;

            stpInserta.ParamByName('PE_CVE_USU_AUTORIZA').AsString := CVE_USU_AUTORIZA.AsString;
            If F_AUTORIZA.AsDateTime <> 0 Then
               stpInserta.ParamByName('PE_F_AUTORIZA').AsDateTime := F_AUTORIZA.AsDateTime
            Else
               stpInserta.ParamByName('PE_F_AUTORIZA').Clear;

            stpInserta.ExecProc;

            If stpInserta.ParamByName('PS_RESULTADO').AsFloat = 0 Then Begin
               ID_EXCEPCION.AsFloat := stpInserta.ParamByName('PS_ID_EXCEPCION').AsFloat;
               VLSalida:= True;
            End Else Begin
                ShowMessage('ERROR EN ALTA DE RECEPTACULO: ' + IntToStr(stpInserta.ParamByName('PS_RESULTADO').AsInteger)+
                            stpInserta.ParamByName('PS_TX_RESULTADO').AsString);
            End;
         Except
             ShowMessage('Problemas con el Alta de la Excepción. Avise Urgentemente a Sistemas');
         end;
      finally
          if stpInserta <> nil then
          begin
               stpInserta.UnPrepare;
               stpInserta.Free;
          end;
      end;
      AutoRefresh := True;
      InternalPost := VLSalida;
   End;
end;
(***********************************************FORMA DO_RECEP_EXC********************)
(*                                                                              *)
(*  FORMA DE DO_RECEP_EXC                                                            *)
(*                                                                              *)
(***********************************************FORMA DO_RECEP_EXC********************)

procedure TWMRecExc.FormShow(Sender: TObject);
begin

   InterForma1.BtnEliminar.Visible := False;
   InterForma1.BtnNuevo.Visible    := False;

   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   With Objeto Do Begin
      ID_EMPRESA.Control       := edID_EMPRESA;
      ID_TRAMITE.Control       := edID_TRAMITE;
      ID_EXCEPCION.Control     := edID_EXCEPCION;
      CVE_DOCUMENTO.Control    := edCVE_DOCUMENTO;
      CVE_NVL_RIESGO.Control   := edCVE_NVL_RIESGO;
      SIT_RECEP_EXC.Control    := rgSIT_RECEP_EXC;
      TXT_EXCEPCION.Control    := edTXT_EXCEPCION;
      F_REGULARIZA.Control     := edF_REGULARIZA;
      TXT_REGULARIZA.Control   := edTXT_REGULARIZA;
      CVE_USU_ALTA.Control     := edCVE_USUA_ALTA;
      CVE_USU_MODIFICA.Control := edCVE_USUA_MODIF;
      F_ALTA.Control           := edF_ALTA;
      F_MODIFICA.Control       := edF_MODIFICA;
      CVE_USU_AUTORIZA.Control := edCVE_USU_AUTORIZA;
      F_AUTORIZA.Control       := edF_AUTORIZA;
      InterForma1.MsgPanel     := PnlMsg;
   End;

   Objeto.Empresa.ID_Persona.Control :=edID_EMPRESA;
   Objeto.Empresa.Nombre.Control :=edNOM_EMPRESA;
   Objeto.Empresa.GetParams(Objeto);
   edNOM_EMPRESA.Hint := Objeto.Empresa.Nombre.AsString;
   edNOM_EMPRESA.ShowHint := True;
   Objeto.Empresa.GetParams(Objeto);

   Objeto.Doctos.CVE_DOCUMENTO.Control := edCVE_DOCUMENTO;
   Objeto.Doctos.DESC_DOCUMENTO.Control := edDOCUMENTO;
   Objeto.Doctos.GetParams(Objeto);

   Objeto.NRiesgo.CVE_NVL_RIESGO.Control := edCVE_NVL_RIESGO;
   Objeto.NRiesgo.DESC_NVL_RIESGO.Control := edNOM_RIESGO;
   Objeto.NRiesgo.GetParams(Objeto);

   Objeto.Usuario.CVE_USUARIO.Control := edCVE_USU_AUTORIZA;
   Objeto.Usuario.EMPLEADO.Persona.Nombre.Control := edNOM_CVE_USU_AUTORIZA;
   Objeto.Usuario.GetParams(Objeto);

   dtF_REGULARIZA.MinDate:= Objeto.Apli.DameFechaEmpresaDia('D000');
   dtF_REGULARIZA.DateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
   dtF_AUTORIZA.DateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');

end;

procedure TWMRecExc.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      ID_EMPRESA.Control       := Nil;
      ID_TRAMITE.Control       := Nil;
      ID_EXCEPCION.Control     := Nil;
      CVE_DOCUMENTO.Control    := Nil;
      CVE_NVL_RIESGO.Control   := Nil;
      SIT_RECEP_EXC.Control    := Nil;
      TXT_EXCEPCION.Control    := Nil;
      F_REGULARIZA.Control     := Nil;
      TXT_REGULARIZA.Control   := Nil;
      CVE_USU_ALTA.Control     := Nil;
      CVE_USU_MODIFICA.Control := Nil;
      F_ALTA.Control           := Nil;
      F_MODIFICA.Control       := Nil;
      CVE_USU_AUTORIZA.Control := Nil;
      F_AUTORIZA.Control       := Nil;

      InterForma1.MsgPanel     := Nil;
   End;
   Objeto.Empresa.Nombre.Control     :=Nil;
   Objeto.Empresa.ID_Persona.Control :=Nil;

   Objeto.Doctos.CVE_DOCUMENTO.Control  := Nil;
   Objeto.Doctos.DESC_DOCUMENTO.Control := Nil;

   Objeto.NRiesgo.CVE_NVL_RIESGO.Control := Nil;
   Objeto.NRiesgo.DESC_NVL_RIESGO.Control := Nil;

   Objeto.Usuario.CVE_USUARIO.Control := Nil;
   Objeto.Usuario.EMPLEADO.Persona.Nombre.Control := Nil;

   //Objeto.RecTra.ID_TRAMITE.Control := Nil;
end;

procedure TWMRecExc.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWMRecExc.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   With Objeto Do Begin
   //nuevo
      //If ValidaPerfilUsuario then Begin
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
         end;
      {End Else Begin
         Realizado:= False;
      End;}
   End;
end;

procedure TWMRecExc.InterForma1Buscar(Sender: TObject);
begin
   With Objeto Do Begin
      InternalBusca;
      Empresa.FindKey([ID_EMPRESA.AsString]);
      Doctos.FindKey([ID_EMPRESA.AsString,CVE_DOCUMENTO.AsString]);
   End;
end;

procedure TWMRecExc.edID_EMPRESAExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.ID_EMPRESA.GetFromControl;
      if Objeto.ID_EMPRESA.AsString = CNULL then
      Begin
         vlSalida   := False;
         vlMsg := 'Indique el identificador de la empresa';
      end;
      InterForma1.ValidaExit(edID_EMPRESA,vlSalida,vlMsg,True);
   end;

end;

procedure TWMRecExc.btEMPRESAClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   If Objeto.Empresa.Busca Then Begin
      InterForma1.NextTab(edID_EMPRESA);
   End;
end;

procedure TWMRecExc.ilEMPRESACapture(Sender: TObject; var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWMRecExc.ilEMPRESAEjecuta(Sender: TObject);
begin
   If Objeto.Empresa.FindKey([ilEMPRESA.Buffer]) Then Begin
      InterForma1.NextTab(edID_EMPRESA);
   End;
end;

procedure TWMRecExc.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.F_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   edID_EMPRESA.SetFocus;
   rgSIT_RECEP_EXC.ItemIndex:= 0;
   If Objeto.Usuario.FindKey([Objeto.Apli.Usuario]) Then Begin
      Objeto.CVE_USU_AUTORIZA.AsString := Objeto.Usuario.CVE_USUARIO.AsString;
      edNOM_CVE_USU_AUTORIZA.Text:=Objeto.Usuario.EMPLEADO.Persona.Nombre.AsString;
   End;
   If Objeto.Empresa.Active  Then Begin
      Objeto.ID_EMPRESA.AsInteger := Objeto.Empresa.ID_Persona.AsInteger;
      edNOM_EMPRESA.Text := Objeto.Empresa.Nombre.AsString;
      edCVE_DOCUMENTO.SetFocus;
   End;

   If Objeto.Doctos.Active  Then Begin
      Objeto.CVE_DOCUMENTO.AsString := Objeto.Doctos.CVE_DOCUMENTO.AsString;
      edDOCUMENTO.Text := Objeto.Doctos.DESC_DOCUMENTO.AsString;
      edCVE_NVL_RIESGO.SetFocus;
   End;
   If Objeto.RecTra.Active  Then Begin
      Objeto.ID_TRAMITE.AsInteger := Objeto.RecTra.ID_TRAMITE.AsInteger;
   End;
   Objeto.F_REGULARIZA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.F_AUTORIZA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
end;

procedure TWMRecExc.rgSIT_RECEP_EXCExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_RECEP_EXC,True,CNULL,True);
end;

procedure TWMRecExc.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.F_MODIFICA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
   edID_EMPRESA.SetFocus;   
end;

procedure TWMRecExc.edID_EMPRESAKeyPress(Sender: TObject; var Key: Char);
begin
   If (Pos(Key,'0123456789'#8) = 0) Then Key := #0;
end;

procedure TWMRecExc.edCVE_DOCUMENTOExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
     vlsql     : String;
     vlCveTra  : String;
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.CVE_DOCUMENTO.GetFromControl;

      If Objeto.CVE_DOCUMENTO.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Indique la Clave del Documento';
      End;
      InterForma1.ValidaExit(edCVE_DOCUMENTO,vlSalida,vlMsg,True);
   End;
end;

procedure TWMRecExc.btDOCUMENTOClick(Sender: TObject);
begin
   Objeto.Doctos.ShowAll := True;

   Objeto.ID_EMPRESA.GetFromControl;
   Objeto.Doctos.BuscaWhereString :='ID_EMPRESA ='+ Objeto.ID_EMPRESA.AsSQL+
                     ' AND CVE_DOCUMENTO IN (SELECT CVE_DOCUMENTO '+
                     '                       FROM DO_REL_TRAM_DOC '+
                     '                      WHERE ID_EMPRESA ='+ Objeto.ID_EMPRESA.AsSQL +
                     '                        AND CVE_TRAMITE ='''+ Objeto.RecTra.Tramite.CVE_TRAMITE.AsSQL +''''+
                     '                        AND SIT_REL_TRAM_DO =''AC'')'+
                     ' AND SIT_DOCUMENTO = ''AC''';
   Objeto.Doctos.FilterString := Objeto.Doctos.BuscaWhereString;
   If Objeto.Doctos.Busca Then Begin
      InterForma1.NextTab(edCVE_DOCUMENTO);
   End;
end;

procedure TWMRecExc.edTXT_EXCEPCIONExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.TXT_EXCEPCION.GetFromControl;
      if Objeto.TXT_EXCEPCION.AsString = CNULL then
      Begin
         vlSalida   := False;
         vlMsg := 'Indique el Motivo de la Excepción';
      end;
      InterForma1.ValidaExit(edTXT_EXCEPCION,vlSalida,vlMsg,True);
   end;
end;

procedure TWMRecExc.edF_REGULARIZAExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.F_REGULARIZA.GetFromControl;
      if Objeto.F_REGULARIZA.AsString = CNULL then
      Begin
         vlSalida   := False;
         vlMsg := 'Indique la fecha de regularización';
      end;
      InterForma1.ValidaExit(edF_REGULARIZA,vlSalida,vlMsg,True);
   end;
end;

procedure TWMRecExc.ilDocumentoCapture(Sender: TObject; var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWMRecExc.ilDocumentoEjecuta(Sender: TObject);
begin
   If Objeto.Doctos.FindKey([Objeto.ID_EMPRESA.AsString,ilDocumento.Buffer]) Then Begin
      InterForma1.NextTab(edCVE_DOCUMENTO);
   End;
end;

procedure TWMRecExc.btCVE_NVL_RIESGOClick(Sender: TObject);
begin
   Objeto.NRiesgo.ShowAll := True;
   Objeto.ID_EMPRESA.GetFromControl;
   Objeto.NRiesgo.BuscaWhereString :='ID_EMPRESA ='+ Objeto.ID_EMPRESA.AsSQL+
                                     ' AND SIT_NVL_RIESGO = ''AC''';
   Objeto.NRiesgo.FilterString := Objeto.NRiesgo.BuscaWhereString;
   If Objeto.NRiesgo.Busca Then Begin
      InterForma1.NextTab(edCVE_NVL_RIESGO);
   End;
end;

procedure TWMRecExc.ilCVE_NVL_RIESGOEjecuta(Sender: TObject);
begin
   If Objeto.NRiesgo.FindKey([Objeto.ID_EMPRESA.AsString,ilCVE_NVL_RIESGO.Buffer]) Then Begin
      InterForma1.NextTab(edCVE_NVL_RIESGO);
   End;
end;

procedure TWMRecExc.edCVE_NVL_RIESGOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edCVE_NVL_RIESGO,True,CNULL,True);
end;

procedure TWMRecExc.ilCVE_NVL_RIESGOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWMRecExc.edTXT_REGULARIZAExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.TXT_REGULARIZA.GetFromControl;
      if Objeto.TXT_REGULARIZA.AsString = CNULL then
      Begin
         vlSalida   := False;
         vlMsg := 'Indique el texto que indica el compromiso de los datos, firmas etc. que se van a regularizar';
      end;
      InterForma1.ValidaExit(edTXT_REGULARIZA,vlSalida,vlMsg,True);
   end;
end;

procedure TWMRecExc.edCVE_USU_AUTORIZAExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.CVE_USU_AUTORIZA.GetFromControl;
      if Objeto.CVE_USU_AUTORIZA.AsString = CNULL then
      Begin
         vlSalida   := False;
         vlMsg := 'Indique el usuario que autoriza la excepción';
      end;
      InterForma1.ValidaExit(edCVE_USU_AUTORIZA,vlSalida,vlMsg,True);
   end;
end;

procedure TWMRecExc.ilCVE_USU_AUTORIZACapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWMRecExc.ilCVE_USU_AUTORIZAEjecuta(Sender: TObject);
begin
   If Objeto.Usuario.FindKey([ilCVE_USU_AUTORIZA.Buffer]) Then Begin
      InterForma1.NextTab(edCVE_USU_AUTORIZA);
   End;
end;

procedure TWMRecExc.btCVE_USU_AUTORIZAClick(Sender: TObject);
begin
   Objeto.Usuario.ShowAll := True;
   If Objeto.Usuario.Busca Then Begin
      InterForma1.NextTab(edCVE_USU_AUTORIZA);
   End;
end;

procedure TWMRecExc.edF_AUTORIZAExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.F_AUTORIZA.GetFromControl;
      if Objeto.F_AUTORIZA.AsString = CNULL then
      Begin
         vlSalida   := False;
         vlMsg := 'Indique la fecha de autorización';
      end;
      InterForma1.ValidaExit(edF_AUTORIZA,vlSalida,vlMsg,True);
   end;
end;
{----------------------------------------------------------------------------------------------------------------------
                                        VALIDA PERFIL USUARIO A EXCEPTUAR
----------------------------------------------------------------------------------------------------------------------}
function TWMRecExc.ValidaPerfilUsuario: Boolean;
Var
   vlResultado     : Boolean;
   stpValidaPerfil : TStoredProc;
begin
   vlResultado := True;
   Objeto.CVE_DOCUMENTO.GetFromControl;
   stpValidaPerfil := TStoredProc.Create(Self);
   try
      with stpValidaPerfil do begin
         stpValidaPerfil.DatabaseName:= Objeto.Apli.DatabaseName;
         stpValidaPerfil.SessionName:= Objeto.Apli.SessionName;
         stpValidaPerfil.StoredProcName:='PKGCRDOCUMENTACION.STPVALIDAPERFIL';

         Params.Clear;
         Params.CreateParam(ftString,'PE_CVE_USUAR',ptInput);
         Params.CreateParam(ftString,'PE_CVE_APLI',ptInput);
         Params.CreateParam(ftInteger,'PE_ID_EMPRESA',ptInput);
         Params.CreateParam(ftString,'PE_CVE_IND_ADIC',ptInput);
         Params.CreateParam(ftString,'PE_CVE_TRAMITE',ptInput);
         Params.CreateParam(ftString,'PE_CVE_DOCUMENTO',ptInput);
         Params.CreateParam(ftString,'PE_PERMISO',ptInput);

         Params.CreateParam(ftString,'PS_B_AUTORIZA',ptOutput);
         Params.CreateParam(ftString,'PS_B_EXCEPTUA',ptOutput);
         Params.CreateParam(ftFloat,'PS_RESULTADO',ptOutput);
         Params.CreateParam(ftString,'PS_TXRESULTADO',ptOutput);
         Prepare;
         ParamByName('PE_CVE_USUAR').AsString     := Objeto.CVE_USU_AUTORIZA.AsString;//Objeto.Apli.Usuario;
         ParamByName('PE_CVE_APLI').AsString      := Objeto.Apli.Apli;
         ParamByName('PE_ID_EMPRESA').AsInteger   := Objeto.ID_EMPRESA.AsInteger;
         ParamByName('PE_CVE_IND_ADIC').AsString  := Objeto.Apli.Indicador;
         ParamByName('PE_CVE_TRAMITE').AsString   := Objeto.RecTra.Tramite.CVE_TRAMITE.AsString;
         ParamByName('PE_CVE_DOCUMENTO').AsString := Objeto.CVE_DOCUMENTO.AsString;
         ParamByName('PE_PERMISO').AsString       := 'EXC';
         ExecProc;

         if ParamByName('PS_RESULTADO').AsInteger <> 0 then begin
            vlResultado := False;
            MessageDlg('ERROR: '+ParamByName('PS_RESULTADO').AsString + ': ' + ParamByName('PS_TXRESULTADO').AsString ,
                                mtInformation, [mbOK], 0  );
         end else Begin
            Objeto.FBAutoriza:= ParamByName('PS_B_AUTORIZA').AsString;
            Objeto.FBExceptua:= ParamByName('PS_B_EXCEPTUA').AsString;
         end;
         UnPrepare;
      end;
   finally
      stpValidaPerfil.Free;
   end;
   ValidaPerfilUsuario := vlResultado;
end;

procedure TWMRecExc.InterForma1DespuesAceptar(Sender: TObject);
Var
   sSQL: String;
begin
   If InterForma1.IsNewData Then Begin
      sSQL:='UPDATE DO_RECEP_TRAM '+
            '   SET SIT_RECEP_TRAM = ''PE'''+
            ' WHERE ID_EMPRESA ='+ Objeto.ID_EMPRESA.AsSQL +
            '   AND ID_TRAMITE ='+ Objeto.ID_TRAMITE.AsSQL +
            '   AND CVE_TRAMITE ='+ Objeto.RecTra.CVE_TRAMITE.AsSQL +
            '   AND ID_ACREDITADO ='+ Objeto.RecTra.ID_ACREDITADO.AsSQL;
      RunSQL(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
   End;
end;

end.
