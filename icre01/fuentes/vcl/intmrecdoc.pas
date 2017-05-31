// Sistema         : Clase de DO_RECEP_DOC
// Fecha de Inicio : 23/04/2004
// Función forma   : Clase de DO_RECEP_DOC
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMRecDoc;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,
IntGenCre, IntParamCre, IntMPers, IntMDoctos,IntMRecTra;

Type
 TMRecDoc= class;

  TWMRecDoc=Class(TForm)
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
    rgSIT_RECEP_DOC: TRadioGroup;
    Label3: TLabel;
    edID_TRAMITE: TEdit;
    Label4: TLabel;
    edID_RECEP_DOC: TEdit;
    Label5: TLabel;
    edCVE_DOCUMENTO: TEdit;
    btDOCUMENTO: TBitBtn;
    edDOCUMENTO: TEdit;
    ilDocumento: TInterLinkit;
    Label1: TLabel;
    edNUM_EXPEDIENTE: TEdit;
    cbB_ORIGIN_ENTREG: TCheckBox;
    cbB_COPIAS_ENTREG: TCheckBox;
    edTXT_OBSERVACION: TMemo;
    Label2: TLabel;
    Label6: TLabel;
    edF_VISTO_BUENO: TEdit;
    edCVE_USU_VOBO: TEdit;
    Label7: TLabel;
    cbxB_VISTO_BUENO: TCheckBox;
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
    procedure rgSIT_RECEP_DOCExit(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edID_EMPRESAKeyPress(Sender: TObject; var Key: Char);
    procedure edCVE_DOCUMENTOExit(Sender: TObject);
    procedure btDOCUMENTOClick(Sender: TObject);
    procedure edID_RECEP_DOCExit(Sender: TObject);
    procedure edNUM_EXPEDIENTEExit(Sender: TObject);
    procedure edID_RECEP_DOCKeyPress(Sender: TObject; var Key: Char);
    procedure cbB_ORIGIN_ENTREGExit(Sender: TObject);
    procedure cbB_COPIAS_ENTREGExit(Sender: TObject);
    procedure edTXT_OBSERVACIONExit(Sender: TObject);
    procedure ilDocumentoCapture(Sender: TObject; var Show: Boolean);
    procedure ilDocumentoEjecuta(Sender: TObject);
    procedure edNUM_EXPEDIENTEKeyPress(Sender: TObject; var Key: Char);

    private
    { Private declarations }
    public
    { Public declarations }
      Objeto : TMRecDoc;
    end;

 TMRecDoc= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        ID_EMPRESA               : TInterCampo;
        ID_TRAMITE               : TInterCampo;
        ID_RECEP_DOC             : TInterCampo;
        CVE_DOCUMENTO            : TInterCampo;
        NUM_EXPEDIENTE           : TInterCampo;
        B_ORIGIN_ENTREG          : TInterCampo;
        B_COPIAS_ENTREG          : TInterCampo;
        SIT_RECEP_DOC            : TInterCampo;
        TXT_OBSERVACION          : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        F_MODIFICA               : TInterCampo;
        B_VISTO_BUENO            : TInterCampo;
        F_VISTO_BUENO            : TInterCampo;
        CVE_USU_VOBO             : TInterCampo;

        ParamCre                 : TParamCre;
        Empresa                  : TMPersona;
        Doctos                   : TMDoctos;
        RecTra                   : TMRecTra;

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

constructor TMRecDoc.Create( AOwner : TComponent );
begin Inherited;

   ID_EMPRESA :=CreaCampo('ID_EMPRESA',ftFloat,tsNinguno,tsNinguno,True);
      ID_EMPRESA.Caption:='Identificador de empresa';
      ID_EMPRESA.NoCompare:= False;
   ID_TRAMITE :=CreaCampo('ID_TRAMITE',ftFloat,tsNinguno,tsNinguno,True);
      ID_TRAMITE.Caption:='Folio del trámite';
      ID_TRAMITE.NoCompare:= False;
   ID_RECEP_DOC:=CreaCampo('ID_RECEP_DOC',ftFloat,tsNinguno,tsNinguno,True);
      ID_RECEP_DOC.Caption:='Folio del Documento';
      ID_RECEP_DOC.NoCompare:= False;
   CVE_DOCUMENTO :=CreaCampo('CVE_DOCUMENTO',ftString,tsNinguno,tsNinguno,True);
      CVE_DOCUMENTO.Caption:='Clave de Documento';
      CVE_DOCUMENTO.NoCompare:= False;
   NUM_EXPEDIENTE :=CreaCampo('NUM_EXPEDIENTE',ftFloat,tsNinguno,tsNinguno,True);
      NUM_EXPEDIENTE.Caption:='Número de Expediente';
      NUM_EXPEDIENTE.NoCompare:= True;
   B_ORIGIN_ENTREG :=CreaCampo('B_ORIGIN_ENTREG',ftString,tsNinguno,tsNinguno,True);
      B_ORIGIN_ENTREG.Caption:='Entrega Original';
      B_ORIGIN_ENTREG.NoCompare:= True;
   B_COPIAS_ENTREG :=CreaCampo('B_COPIAS_ENTREG',ftString,tsNinguno,tsNinguno,True);
      B_COPIAS_ENTREG.Caption:='Entrega Copia';
      B_COPIAS_ENTREG.NoCompare:= True;
   SIT_RECEP_DOC :=CreaCampo('SIT_RECEP_DOC',ftString,tsNinguno,tsNinguno,True);
   With SIT_RECEP_DOC do begin
      Size:=2;
      UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add('AC');
      ComboLista.Add('2'); ComboDatos.Add('AU');
      ComboLista.Add('3'); ComboDatos.Add('CA');
      ComboLista.Add('4'); ComboDatos.Add('PE');
   end;
      SIT_RECEP_DOC.Caption:='Situación de la recepción de documentos';
      SIT_RECEP_DOC.NoCompare:= True;
   TXT_OBSERVACION :=CreaCampo('TXT_OBSERVACION',ftString,tsNinguno,tsNinguno,True);
      TXT_OBSERVACION.Caption:='Observaciones';
      TXT_OBSERVACION.NoCompare:= True;
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
   B_VISTO_BUENO :=CreaCampo('B_VISTO_BUENO',ftString,tsNinguno,tsNinguno,True);
      B_VISTO_BUENO.Caption:='Indica visto bueno';
      B_VISTO_BUENO.NoCompare:= True;
   F_VISTO_BUENO:=CreaCampo('F_VISTO_BUENO',ftDate,tsNinguno,tsNinguno,True);
      F_VISTO_BUENO.Caption:='Fecha de visto bueno';
      F_VISTO_BUENO.NoCompare:= True;
   CVE_USU_VOBO :=CreaCampo('CVE_USU_VOBO',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_VOBO.Caption:='Indica quien dio el visto bueno';
      CVE_USU_VOBO.NoCompare:= True;

   FKeyFields.Add('ID_EMPRESA');
   FKeyFields.Add('ID_TRAMITE');
   FKeyFields.Add('ID_RECEP_DOC');
   FKeyFields.Add('CVE_DOCUMENTO');
   TableName := 'DO_RECEP_DOC';
   UseQuery := True;
   HelpFile := 'IntMRecDoc.Hlp';
   ShowMenuReporte:=True;

   Empresa := TMPersona.Create(Self);
   Empresa.FilterBy := fbTMPersonaEmpresa;
   Empresa.MasterSource := Self;
   Empresa.FieldByName('ID_PERSONA').MasterField := 'ID_EMPRESA';

   Doctos:= TMDoctos.Create(Self);
   Doctos.MasterSource := Self;
   Doctos.FieldByName('ID_EMPRESA').MasterField := 'ID_EMPRESA';
   Doctos.FieldByName('CVE_DOCUMENTO').MasterField := 'CVE_DOCUMENTO';

   RecTra    := TMRecTra.Create(Self);
   RecTra.MasterSource:= Self;
   RecTra.FieldByName('ID_TRAMITE').MasterField := 'ID_TRAMITE';
end;


Destructor TMRecDoc.Destroy;
begin
{   If Empresa <> Nil Then
      Empresa.Free;
   If Doctos <> Nil Then
      Doctos.Free;}
   Inherited;
end;

function TMRecDoc.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMRecDoc;
begin
   W:=TWMRecDoc.Create(Self);
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

Function TMRecDoc.InternalBusca:Boolean;
Var T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IMRecDoc.it','F,F,F,S');
   Try
      if Active then begin
         T.Param(0,ID_EMPRESA.AsString);
         T.Param(1,ID_TRAMITE.AsString);
         T.Param(2,ID_RECEP_DOC.AsString);
         T.Param(3,CVE_DOCUMENTO.AsString);
      end;
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2),T.DameCampo(3)]);
   finally
      T.Free;
   end;
end;

function TMRecDoc.Reporte:Boolean;
begin
   Result := False;
end;

Function TMRecDoc.InternalPost : Boolean;
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
            stpInserta.StoredProcName:='PKGCRDOCUMENTACION.STP_ALTABITDOCTO';
            stpInserta.Params.CreateParam(ftFloat,'PE_ID_EMPRESA',ptInput);
            stpInserta.Params.CreateParam(ftFloat,'PE_ID_TRAMITE',ptInput);
            stpInserta.Params.CreateParam(ftFloat,'PE_ID_RECEP_DOC',ptInput);
            stpInserta.Params.CreateParam(ftString,'PE_CVE_DOCUMENTO',ptInput);
            stpInserta.Params.CreateParam(ftFloat,'PE_NUM_EXPEDIENTE',ptInput);
            stpInserta.Params.CreateParam(ftString,'PE_B_ORIGIN_ENTREG',ptInput);
            stpInserta.Params.CreateParam(ftString,'PE_B_COPIAS_ENTREG',ptInput);
            stpInserta.Params.CreateParam(ftString,'PE_SIT_RECEP_DOC',ptInput);
            stpInserta.Params.CreateParam(ftString,'PE_TXT_OBSERVACION',ptInput);
            stpInserta.Params.CreateParam(ftString,'PE_CVE_USU_ALTA',ptInput);
            stpInserta.Params.CreateParam(ftDateTime,'PE_F_ALTA',ptInput);
            stpInserta.Params.CreateParam(ftString,'PE_CVE_USU_MODIFICA',ptInput);
            stpInserta.Params.CreateParam(ftDateTime,'PE_F_MODIFICA',ptInput);
            stpInserta.Params.CreateParam(ftString,'PE_B_VISTO_BUENO',ptInput);
            stpInserta.Params.CreateParam(ftDateTime,'PE_F_VISTO_BUENO',ptInput);
            stpInserta.Params.CreateParam(ftString,'PE_CVE_USU_VOBO',ptInput);
            stpInserta.Params.CreateParam(ftFloat,'PS_ID_RECEP_DOC',ptOutput);
            stpInserta.Params.CreateParam(ftFloat,'PS_RESULTADO',ptOutput);
            stpInserta.Params.CreateParam(ftString,'PS_TX_RESULTADO',ptOutput);

            stpInserta.ParamByName('PE_ID_EMPRESA').AsFloat := ID_EMPRESA.AsFloat;
            stpInserta.ParamByName('PE_ID_TRAMITE').AsFloat := ID_TRAMITE.AsFloat;
            stpInserta.ParamByName('PE_ID_RECEP_DOC').AsFloat := ID_RECEP_DOC.AsFloat;
            stpInserta.ParamByName('PE_CVE_DOCUMENTO').AsString := CVE_DOCUMENTO.AsString;
            stpInserta.ParamByName('PE_NUM_EXPEDIENTE').AsFloat := NUM_EXPEDIENTE.AsFloat;
            stpInserta.ParamByName('PE_B_ORIGIN_ENTREG').AsString := B_ORIGIN_ENTREG.AsString;
            stpInserta.ParamByName('PE_B_COPIAS_ENTREG').AsString := B_COPIAS_ENTREG.AsString;
            stpInserta.ParamByName('PE_SIT_RECEP_DOC').AsString := SIT_RECEP_DOC.AsString;
            stpInserta.ParamByName('PE_TXT_OBSERVACION').AsString := TXT_OBSERVACION.AsString;
            stpInserta.ParamByName('PE_CVE_USU_ALTA').AsString := CVE_USU_ALTA.AsString;

            If F_ALTA.AsDateTime <> 0 Then
               stpInserta.ParamByName('PE_F_ALTA').AsDateTime := F_ALTA.AsDateTime
            Else
               stpInserta.ParamByName('PE_F_ALTA').Clear;

            stpInserta.ParamByName('PE_CVE_USU_MODIFICA').AsString := CVE_USU_MODIFICA.AsString;

            If F_MODIFICA.AsDateTime <> 0 Then
               stpInserta.ParamByName('PE_F_MODIFICA').AsDateTime := F_MODIFICA.AsDateTime
            Else
               stpInserta.ParamByName('PE_F_MODIFICA').Clear;
            stpInserta.ParamByName('PE_B_VISTO_BUENO').AsString := B_VISTO_BUENO.AsString;

            If F_VISTO_BUENO.AsDateTime <> 0  Then
               stpInserta.ParamByName('PE_F_VISTO_BUENO').AsDateTime := F_VISTO_BUENO.AsDateTime
            Else
               stpInserta.ParamByName('PE_F_VISTO_BUENO').Clear;

            stpInserta.ParamByName('PE_CVE_USU_VOBO').AsString := CVE_USU_VOBO.AsString;
            stpInserta.ExecProc;

            If stpInserta.ParamByName('PS_RESULTADO').AsFloat = 0 Then Begin
               ID_RECEP_DOC.AsFloat := stpInserta.ParamByName('PS_ID_RECEP_DOC').AsFloat;
               VLSalida:= True;
            End Else Begin
               ShowMessage('ERROR EN ALTA DE RECEPTACULO: ' + IntToStr(stpInserta.ParamByName('PS_RESULTADO').AsInteger)+
                           stpInserta.ParamByName('PS_TX_RESULTADO').AsString);
            End;
         Except
             ShowMessage('Problemas con el Alta del Movimiento. Avise Urgentemente a Sistemas');
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
(***********************************************FORMA DO_RECEP_DOC********************)
(*                                                                              *)
(*  FORMA DE DO_RECEP_DOC                                                            *)
(*                                                                              *)
(***********************************************FORMA DO_RECEP_DOC********************)

procedure TWMRecDoc.FormShow(Sender: TObject);
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
      ID_RECEP_DOC.Control     := edID_RECEP_DOC;
      CVE_DOCUMENTO.Control    := edCVE_DOCUMENTO;
      NUM_EXPEDIENTE.Control   := edNUM_EXPEDIENTE;
      B_ORIGIN_ENTREG.Control  := cbB_ORIGIN_ENTREG;
      B_COPIAS_ENTREG.Control  := cbB_COPIAS_ENTREG;
      SIT_RECEP_DOC.Control    := rgSIT_RECEP_DOC;
      TXT_OBSERVACION.Control  := edTXT_OBSERVACION;
      CVE_USU_ALTA.Control     := edCVE_USUA_ALTA;
      CVE_USU_MODIFICA.Control := edCVE_USUA_MODIF;
      F_ALTA.Control           := edF_ALTA;
      F_MODIFICA.Control       := edF_MODIFICA;
      B_VISTO_BUENO.Control    := cbxB_VISTO_BUENO;
      F_VISTO_BUENO.Control    := edF_VISTO_BUENO;
      CVE_USU_VOBO.Control     := edCVE_USU_VOBO;

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

   cbxB_VISTO_BUENO.Checked:=True;
end;

procedure TWMRecDoc.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      ID_EMPRESA.Control       := Nil;
      ID_TRAMITE.Control       := Nil;
      ID_RECEP_DOC.Control     := Nil;
      CVE_DOCUMENTO.Control    := Nil;
      NUM_EXPEDIENTE.Control   := Nil;
      B_ORIGIN_ENTREG.Control  := Nil;
      B_COPIAS_ENTREG.Control  := Nil;
      SIT_RECEP_DOC.Control    := Nil;
      TXT_OBSERVACION.Control  := Nil;
      CVE_USU_ALTA.Control     := Nil;
      CVE_USU_MODIFICA.Control := Nil;
      F_ALTA.Control           := Nil;
      F_MODIFICA.Control       := Nil;
      B_VISTO_BUENO.Control    := Nil;
      F_VISTO_BUENO.Control    := Nil;
      CVE_USU_VOBO.Control     := Nil;

      InterForma1.MsgPanel     := Nil;
   End;
   Objeto.Empresa.Nombre.Control     :=Nil;
   Objeto.Empresa.ID_Persona.Control :=Nil;

   Objeto.Doctos.CVE_DOCUMENTO.Control  := Nil;
   Objeto.Doctos.DESC_DOCUMENTO.Control := Nil;

end;

procedure TWMRecDoc.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWMRecDoc.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   With Objeto Do Begin
   //nuevo
      if IsNewData then Begin
         if MessageDlg('¿Desea almacenar los datos capturados?',
              mtConfirmation,[mbYes, mbNo], 0) = mrYes then Begin
            CVE_USU_ALTA.AsString := DameUsuario;
            F_ALTA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
            Objeto.B_VISTO_BUENO.GetFromControl;
            If B_VISTO_BUENO.AsString='V' Then Begin
               CVE_USU_VOBO.AsString := DameUsuario;
               F_VISTO_BUENO.AsDateTime := Apli.DameFechaEmpresaDia('D000');
            End;
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

procedure TWMRecDoc.InterForma1Buscar(Sender: TObject);
begin
   With Objeto Do Begin
      InternalBusca;                      
      Empresa.FindKey([ID_EMPRESA.AsString]);
      Doctos.FindKey([ID_EMPRESA.AsString,CVE_DOCUMENTO.AsString]);
   End;
end;

procedure TWMRecDoc.edID_EMPRESAExit(Sender: TObject);
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

procedure TWMRecDoc.btEMPRESAClick(Sender: TObject);
begin
   Objeto.Empresa.ShowAll := True;
   If Objeto.Empresa.Busca Then Begin
      InterForma1.NextTab(edID_EMPRESA);
   End;
end;

procedure TWMRecDoc.ilEMPRESACapture(Sender: TObject; var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWMRecDoc.ilEMPRESAEjecuta(Sender: TObject);
begin
   If Objeto.Empresa.FindKey([ilEMPRESA.Buffer]) Then Begin
      InterForma1.NextTab(edID_EMPRESA);
   End;
end;

procedure TWMRecDoc.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.F_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   rgSIT_RECEP_DOC.ItemIndex:= 0;
   cbxB_VISTO_BUENO.Checked:= False;

   Objeto.ID_EMPRESA.AsInteger := Objeto.Apli.IdEmpresa;
   edID_EMPRESA.SetFocus;
   If Objeto.Empresa.FindKey([Objeto.Apli.IdEmpresa]) Then Begin
      edID_TRAMITE.SetFocus;
      If Objeto.RecTra.ID_TRAMITE.AsInteger<>0  Then Begin
         Objeto.ID_TRAMITE.AsInteger := Objeto.RecTra.ID_TRAMITE.AsInteger;
         edNUM_EXPEDIENTE.SetFocus;
         If Objeto.Doctos.CVE_DOCUMENTO.AsString <>'' Then Begin
            Objeto.CVE_DOCUMENTO.AsString := Objeto.Doctos.CVE_DOCUMENTO.AsString;
            edDOCUMENTO.Text := Objeto.Doctos.DESC_DOCUMENTO.AsString;
            cbB_ORIGIN_ENTREG.SetFocus;
         End;
      End;
   End;
end;

procedure TWMRecDoc.rgSIT_RECEP_DOCExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_RECEP_DOC,True,CNULL,True);
end;

procedure TWMRecDoc.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.F_MODIFICA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
end;

procedure TWMRecDoc.edID_EMPRESAKeyPress(Sender: TObject; var Key: Char);
begin
   If (Pos(Key,'0123456789'#8) = 0) Then Key := #0;
end;

procedure TWMRecDoc.edCVE_DOCUMENTOExit(Sender: TObject);
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

procedure TWMRecDoc.btDOCUMENTOClick(Sender: TObject);
Var
   sSQL:String;
begin
   Objeto.ID_EMPRESA.GetFromControl;
   sSQL:= 'ID_EMPRESA ='+ Objeto.ID_EMPRESA.AsSQL +
          ' AND CVE_DOCUMENTO NOT IN (SELECT CVE_DOCUMENTO '+
          '                       FROM DO_REL_TRAM_DOC '+
          '                      WHERE ID_EMPRESA ='+ Objeto.ID_EMPRESA.AsSQL +
          '                        AND CVE_TRAMITE ='+ Objeto.RecTra.CVE_TRAMITE.AsSQL+
          '                        AND SIT_REL_TRAM_DO =''AC'')'+
          ' AND CVE_DOCUMENTO NOT IN ( SELECT CVE_DOCUMENTO '+
          '                              FROM DO_RECEP_DOC'+
          '                             WHERE ID_EMPRESA ='+ Objeto.ID_EMPRESA.AsSQL +
          '                               AND ID_TRAMITE ='+Objeto.ID_TRAMITE.AsSQL +')';

   sSQL:= sSQL + ' AND SIT_DOCUMENTO = ''AC''';

   Objeto.Doctos.BuscaWhereString := sSQL;
   Objeto.Doctos.FilterString := Objeto.Doctos.BuscaWhereString;
   Objeto.Doctos.ShowAll := True;
   If Objeto.Doctos.Busca Then Begin
      InterForma1.NextTab(edCVE_DOCUMENTO);
   End;
end;

procedure TWMRecDoc.edID_RECEP_DOCExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edID_RECEP_DOC,True,CNULL,True);
end;

procedure TWMRecDoc.edNUM_EXPEDIENTEExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.NUM_EXPEDIENTE.GetFromControl;
      if Objeto.NUM_EXPEDIENTE.AsString = CNULL then
      Begin
         vlSalida   := False;
         vlMsg := 'Indique el Número de Expediente';
      end;
      InterForma1.ValidaExit(edNUM_EXPEDIENTE,vlSalida,vlMsg,True);
   end;
end;

procedure TWMRecDoc.edID_RECEP_DOCKeyPress(Sender: TObject;
  var Key: Char);
begin
   If (Pos(Key,'0123456789'#8) = 0) Then Key := #0;
end;

procedure TWMRecDoc.cbB_ORIGIN_ENTREGExit(Sender: TObject);
begin
   InterForma1.ValidaExit(cbB_ORIGIN_ENTREG,True,CNULL,True);
end;

procedure TWMRecDoc.cbB_COPIAS_ENTREGExit(Sender: TObject);
begin
   InterForma1.ValidaExit(cbB_COPIAS_ENTREG,True,CNULL,True);
end;

procedure TWMRecDoc.edTXT_OBSERVACIONExit(Sender: TObject);
var  vlSalida  :  boolean;
     vlMsg     :  String;
begin
   if ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) then
   begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.TXT_OBSERVACION.GetFromControl;
      if Objeto.TXT_OBSERVACION.AsString = CNULL then
      Begin
         vlSalida   := False;
         vlMsg := 'Indique las Observaciones';
      end;
      InterForma1.ValidaExit(edTXT_OBSERVACION,vlSalida,vlMsg,True);
   end;
end;

procedure TWMRecDoc.ilDocumentoCapture(Sender: TObject; var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWMRecDoc.ilDocumentoEjecuta(Sender: TObject);
begin
   If Objeto.Doctos.FindKey([Objeto.ID_EMPRESA.AsString,ilDocumento.Buffer]) Then Begin
      InterForma1.NextTab(edCVE_DOCUMENTO);
   End;
end;

procedure TWMRecDoc.edNUM_EXPEDIENTEKeyPress(Sender: TObject;
  var Key: Char);
begin
   If (Pos(Key,'0123456789'#8) = 0) Then Key := #0;
end;

end.
