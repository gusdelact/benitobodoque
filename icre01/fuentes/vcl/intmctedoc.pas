// Sistema         : Clase de DO_CLIENTE_DOC
// Fecha de Inicio : 30/04/2004
// Función forma   : Clase de DO_CLIENTE_DOC
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMCteDoc;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,
IntGenCre, IntParamCre, IntMPers, IntMDoctos,IntCrAcredit;

Type
 TMCteDoc= class;

  TWMCteDoc=Class(TForm)
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
    edCVE_USUA_ALTA: TEdit;
    edCVE_USUA_MODIF: TEdit;
    rgSIT_RECEP_TRA: TRadioGroup;
    Label3: TLabel;
    edID_DOCUMENTO: TEdit;
    Label2: TLabel;
    edACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    ilACREDITADO: TInterLinkit;
    Label5: TLabel;
    edCVE_DOCUMENTO: TEdit;
    btDOCUMENTO: TBitBtn;
    edDOCUMENTO: TEdit;
    ilDocumento: TInterLinkit;
    edTX_COMENTARIO: TMemo;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    cbxB_ORIGIN_ENTREG: TCheckBox;
    edF_ENTREGA_OR: TEdit;
    dtpF_ENTREGA_OR: TInterDateTimePicker;
    lbLiqF_INICIO: TLabel;
    cbxB_COPIAS_ENTREG: TCheckBox;
    edF_ENTREGA_COP: TEdit;
    dtpB_COPIAS_ENTREG: TInterDateTimePicker;
    Label6: TLabel;
    edNUMERO_COPIAS: TEdit;
    UpDown1: TUpDown;
    Label7: TLabel;
    dtpF_EXPIRA: TInterDateTimePicker;
    edF_EXPIRA: TEdit;
    Label8: TLabel;
    edFOL_DOCUMENTO: TEdit;
    Label4: TLabel;
    Label9: TLabel;
    edAREA_RESG_ORI: TEdit;
    Label10: TLabel;
    edNUM_EXPEDIENTE: TEdit;
    edF_DEVUELTO_CTE: TEdit;
    dtpF_DEVOLUCION: TInterDateTimePicker;
    Label13: TLabel;
    GroupBox2: TGroupBox;
    edID_DOC_RENOVADOR: TEdit;
    Label12: TLabel;
    edID_DOC_RENUEVA: TEdit;
    Label11: TLabel;
    btRenovar: TButton;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edACREDITADOExit(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure edCVE_DOCUMENTOExit(Sender: TObject);
    procedure btDOCUMENTOClick(Sender: TObject);
    procedure ilDocumentoCapture(Sender: TObject; var Show: Boolean);
    procedure ilDocumentoEjecuta(Sender: TObject);
    procedure edFOL_DOCUMENTOExit(Sender: TObject);
    procedure edF_EXPIRAExit(Sender: TObject);
    procedure cbxB_ORIGIN_ENTREGExit(Sender: TObject);
    procedure cbxB_COPIAS_ENTREGExit(Sender: TObject);
    procedure edF_ENTREGA_ORExit(Sender: TObject);
    procedure edF_ENTREGA_COPExit(Sender: TObject);
    procedure edNUMERO_COPIASExit(Sender: TObject);
    procedure edAREA_RESG_ORIExit(Sender: TObject);
    procedure edNUM_EXPEDIENTEExit(Sender: TObject);
    procedure edID_DOC_RENUEVAExit(Sender: TObject);
    procedure edID_DOC_RENOVADORExit(Sender: TObject);
    procedure edF_DEVUELTO_CTEExit(Sender: TObject);
    procedure rgSIT_RECEP_TRAExit(Sender: TObject);
    procedure edTX_COMENTARIOExit(Sender: TObject);
    procedure edNUMERO_COPIASKeyPress(Sender: TObject; var Key: Char);
    procedure edNUM_EXPEDIENTEKeyPress(Sender: TObject; var Key: Char);
    procedure edID_DOC_RENUEVAKeyPress(Sender: TObject; var Key: Char);
    procedure edID_DOC_RENOVADORKeyPress(Sender: TObject; var Key: Char);
    procedure cbxB_ORIGIN_ENTREGClick(Sender: TObject);
    procedure cbxB_COPIAS_ENTREGClick(Sender: TObject);
    procedure btRenovarExit(Sender: TObject);
    procedure btRenovarClick(Sender: TObject);
    procedure edNUMERO_COPIASChange(Sender: TObject);
    procedure edAREA_RESG_ORIKeyPress(Sender: TObject; var Key: Char);
    procedure InterForma1DespuesShow(Sender: TObject);

    private
    { Private declarations }
    public
    { Public declarations }
      Objeto : TMCteDoc;
    end;

 TMCteDoc= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        ID_ACREDITADO            : TInterCampo;
        ID_DOCUMENTO             : TInterCampo;
        CVE_DOCUMENTO            : TInterCampo;
        FOL_DOCUMENTO            : TInterCampo;
        TX_COMENTARIO            : TInterCampo;
        B_ORIGIN_ENTREG          : TInterCampo;
        F_ENTREGA_OR             : TInterCampo;
        B_COPIAS_ENTREG          : TInterCampo;
        NUMERO_COPIAS            : TInterCampo;
        F_ENTREGA_COP            : TInterCampo;
        F_EXPIRA                 : TInterCampo;
        AREA_RESG_ORI            : TInterCampo;
        NUM_EXPEDIENTE           : TInterCampo;
        ID_DOC_RENUEVA           : TInterCampo;
        ID_DOC_RENOVADOR         : TInterCampo;
        F_DEVUELTO_CTE           : TInterCampo;
        SIT_DOCUMENTO            : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;

        ParamCre                 : TParamCre;
        Doctos                   : TMDoctos;
        Acreditado               : TCrAcredit;

        function    InternalBusca : Boolean; override;
        Function    InternalPost : Boolean; override;
        Function    Inserta : Boolean;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

implementation

{$R *.DFM}

constructor TMCteDoc.Create( AOwner : TComponent );
begin Inherited;

   ID_ACREDITADO :=CreaCampo('ID_ACREDITADO',ftFloat,tsNinguno,tsNinguno,True);
      ID_ACREDITADO.Caption:='Identificador de Acreditado';
      ID_ACREDITADO.NoCompare:= False;
   ID_DOCUMENTO :=CreaCampo('ID_DOCUMENTO',ftFloat,tsNinguno,tsNinguno,True);
      ID_DOCUMENTO.Caption:='Número de Documento';
      ID_DOCUMENTO.NoCompare:= False;
   CVE_DOCUMENTO :=CreaCampo('CVE_DOCUMENTO',ftString,tsNinguno,tsNinguno,True);
      CVE_DOCUMENTO.Caption:='Clave de Documento';
      CVE_DOCUMENTO.NoCompare:= False;
   FOL_DOCUMENTO :=CreaCampo('FOL_DOCUMENTO',ftString,tsNinguno,tsNinguno,True);
      FOL_DOCUMENTO.Caption:='Folio de Documento';
      FOL_DOCUMENTO.NoCompare:= True;
   TX_COMENTARIO :=CreaCampo('TX_COMENTARIO',ftString,tsNinguno,tsNinguno,True);
      TX_COMENTARIO.Caption:='Comentarios';
      TX_COMENTARIO.NoCompare:= True;
   B_ORIGIN_ENTREG:=CreaCampo('B_ORIGIN_ENTREG',ftString,tsNinguno,tsNinguno,True);
      B_ORIGIN_ENTREG.Caption:='Identifica si entrega original';
      B_ORIGIN_ENTREG.NoCompare:= True;
   F_ENTREGA_OR:=CreaCampo('F_ENTREGA_OR',ftDate,tsNinguno,tsNinguno,True);
      F_ENTREGA_OR.Caption:='Fecha de entrega de original';
      F_ENTREGA_OR.NoCompare:= True;
   B_COPIAS_ENTREG:=CreaCampo('B_COPIAS_ENTREG',ftString,tsNinguno,tsNinguno,True);
      B_COPIAS_ENTREG.Caption:='Identifica si entrega copias';
      B_COPIAS_ENTREG.NoCompare:= True;
   NUMERO_COPIAS:=CreaCampo('NUMERO_COPIAS',ftFloat,tsNinguno,tsNinguno,True);
      NUMERO_COPIAS.Caption:='Número de copias';
      NUMERO_COPIAS.NoCompare:= True;
   F_ENTREGA_COP:=CreaCampo('F_ENTREGA_COP',ftDate,tsNinguno,tsNinguno,True);
      F_ENTREGA_COP.Caption:='Fecha de entrega de copias';
      F_ENTREGA_COP.NoCompare:= True;
   F_EXPIRA:=CreaCampo('F_EXPIRA',ftDate,tsNinguno,tsNinguno,True);
      F_EXPIRA.Caption:='Fecha en que expira el documento';
      F_EXPIRA.NoCompare:= True;
   AREA_RESG_ORI:=CreaCampo('AREA_RESG_ORI',ftString,tsNinguno,tsNinguno,True);
      AREA_RESG_ORI.Caption:='Area que resguarda el original';
      AREA_RESG_ORI.NoCompare:= True;
   NUM_EXPEDIENTE:=CreaCampo('NUM_EXPEDIENTE',ftFloat,tsNinguno,tsNinguno,True);
      NUM_EXPEDIENTE.Caption:='Número de expediente';
      NUM_EXPEDIENTE.NoCompare:= True;
   ID_DOC_RENUEVA:=CreaCampo('ID_DOC_RENUEVA',ftFloat,tsNinguno,tsNinguno,True);
      ID_DOC_RENUEVA.Caption:='Número de documento que renueva';
      ID_DOC_RENUEVA.NoCompare:= True;
   ID_DOC_RENOVADOR:=CreaCampo('ID_DOC_RENOVADOR',ftFloat,tsNinguno,tsNinguno,True);
      ID_DOC_RENOVADOR.Caption:='Número de documento renovador';
      ID_DOC_RENOVADOR.NoCompare:= True;
   F_DEVUELTO_CTE:=CreaCampo('F_DEVUELTO_CTE',ftDate,tsNinguno,tsNinguno,True);
      F_DEVUELTO_CTE.Caption:='Fecha en que se devuelve al cliente';
      F_DEVUELTO_CTE.NoCompare:= True;
   SIT_DOCUMENTO:=CreaCampo('SIT_DOCUMENTO',ftString,tsNinguno,tsNinguno,True);
   With SIT_DOCUMENTO do begin
      Size:=2;
      UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add('AC');
      ComboLista.Add('1'); ComboDatos.Add('RN');
      ComboLista.Add('2'); ComboDatos.Add('VE');
      ComboLista.Add('3'); ComboDatos.Add('DV');
   end;
      SIT_DOCUMENTO.Caption:='Situación del documento';
      SIT_DOCUMENTO.NoCompare:= True;
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

   FKeyFields.Add('ID_ACREDITADO');
   FKeyFields.Add('ID_DOCUMENTO');
   FKeyFields.Add('CVE_DOCUMENTO');
   TableName := 'DO_CLIENTE_DOC';
   UseQuery := True;
   HelpFile := 'IntMCteDoc.Hlp';
   ShowMenuReporte:=True;

   Doctos:= TMDoctos.Create(Self);
   Doctos.MasterSource := Self;
   Doctos.FieldByName('CVE_DOCUMENTO').MasterField := 'CVE_DOCUMENTO';

   Acreditado := TCrAcredit.Create(Self);
   Acreditado.MasterSource := Self;
   Acreditado.FieldByName('ID_ACREDITADO').MasterField := 'ID_ACREDITADO';

end;


Destructor TMCteDoc.Destroy;
begin
   Inherited;
end;

function TMCteDoc.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMCteDoc;
begin
   W:=TWMCteDoc.Create(Self);
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

Function TMCteDoc.InternalBusca:Boolean;
Var T : TInterFindit;
    vlSAlida : Boolean;
begin
   InternalBusca := False;
   T := CreaBuscador('IMCteDoc.it','F,F,S');
   Try
      if Active then begin
         T.Param(0,ID_ACREDITADO.AsString);
         T.Param(1,ID_DOCUMENTO.AsString);
         T.Param(2,CVE_DOCUMENTO.AsString);
      end;
      If T.Execute Then Begin
         vlSalida := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2)]);
         If vlSalida Then Begin
            Acreditado.FindKey([ID_ACREDITADO.AsString]);
            Doctos.FindKey([IntToStr(Apli.IdEmpresa),CVE_DOCUMENTO.AsString]);
         End;
      end;
      InternalBusca := vlSalida;
   finally
      T.Free;
   end;
end;

function TMCteDoc.Reporte:Boolean;
begin
   Result := False;
end;

function TMCteDoc.Inserta: Boolean;
Var
   VLSalida      : Boolean;
   STPObtDocto  : TStoredProc;
Begin
   VLSalida := False;
   ID_ACREDITADO.GetFromControl;
   CVE_DOCUMENTO.GetFromControl;

   STPObtDocto := TStoredProc.Create(Self);
   Try
      With STPObtDocto Do Begin
         STPObtDocto.DatabaseName:= Apli.DataBaseName;
         STPObtDocto.SessionName:= Apli.SessionName;
         STPObtDocto.StoredProcName:='PKGCRDOCUMENTACION.STP_ALTA_DOCTOS_ACRE';
         STPObtDocto.Active:=False;
         STPObtDocto.Params.Clear;
         STPObtDocto.Params.CreateParam(ftFloat,'PE_ID_ACREDITADO',ptInput);
         STPObtDocto.Params.CreateParam(ftFloat,'PE_ID_DOCUMENTO',ptInput);
         STPObtDocto.Params.CreateParam(ftString,'PE_CVE_DOCUMENTO',ptInput);
         STPObtDocto.Params.CreateParam(ftString,'PE_FOL_DOCUMENTO',ptInput);
         STPObtDocto.Params.CreateParam(ftString,'PE_TX_COMENTARIO',ptInput);
         STPObtDocto.Params.CreateParam(ftString,'PE_B_ORIGIN_ENTREG',ptInput);
         STPObtDocto.Params.CreateParam(ftDateTime,'PE_F_ENTREGA_OR',ptInput);
         STPObtDocto.Params.CreateParam(ftString,'PE_B_COPIAS_ENTREG',ptInput);
         STPObtDocto.Params.CreateParam(ftFloat,'PE_NUMERO_COPIAS',ptInput);
         STPObtDocto.Params.CreateParam(ftDateTime,'PE_F_ENTREGA_COP',ptInput);
         STPObtDocto.Params.CreateParam(ftDateTime,'PE_F_EXPIRA',ptInput);
         STPObtDocto.Params.CreateParam(ftString,'PE_AREA_RESG_ORI',ptInput);
         STPObtDocto.Params.CreateParam(ftFloat,'PE_NUM_EXPEDIENTE',ptInput);
         STPObtDocto.Params.CreateParam(ftFloat,'PE_ID_DOC_RENUEVA',ptInput);
         STPObtDocto.Params.CreateParam(ftFloat,'PE_ID_DOC_RENOVADOR',ptInput);
         STPObtDocto.Params.CreateParam(ftDateTime,'PE_F_DEVUELTO_CTE',ptInput);
         STPObtDocto.Params.CreateParam(ftString,'PE_SIT_DOCUMENTO',ptInput);
         STPObtDocto.Params.CreateParam(ftDateTime,'PE_F_ALTA',ptInput);
         STPObtDocto.Params.CreateParam(ftString,'PE_CVE_USU_ALTA',ptInput);
         STPObtDocto.Params.CreateParam(ftDateTime,'PE_F_MODIFICA',ptInput);
         STPObtDocto.Params.CreateParam(ftString,'PE_CVE_USU_MODIFICA',ptInput);
         STPObtDocto.Params.CreateParam(ftFloat,'PE_ID_EMPRESA',ptInput);
         STPObtDocto.Params.CreateParam(ftFloat,'PS_ID_DOCUMENTO',ptOutput);
         STPObtDocto.Params.CreateParam(ftFloat,'PS_RESULTADO',ptOutput);
         STPObtDocto.Params.CreateParam(ftString,'PS_TX_RESULTADO',ptOutput);

         STPObtDocto.ParamByName('PE_ID_ACREDITADO').AsFloat := ID_ACREDITADO.AsFloat;
         STPObtDocto.ParamByName('PE_ID_DOCUMENTO').AsFloat := ID_DOCUMENTO.AsFloat;
         STPObtDocto.ParamByName('PE_CVE_DOCUMENTO').AsString := CVE_DOCUMENTO.AsString;
         STPObtDocto.ParamByName('PE_FOL_DOCUMENTO').AsString := FOL_DOCUMENTO.AsString;
         STPObtDocto.ParamByName('PE_TX_COMENTARIO').AsString := TX_COMENTARIO.AsString;
         STPObtDocto.ParamByName('PE_B_ORIGIN_ENTREG').AsString := B_ORIGIN_ENTREG.AsString;

         If F_ENTREGA_OR.AsDateTime <> 0 Then
            STPObtDocto.ParamByName('PE_F_ENTREGA_OR').AsDateTime := F_ENTREGA_OR.AsDateTime
         Else
            STPObtDocto.ParamByName('PE_F_ENTREGA_OR').Clear;


         STPObtDocto.ParamByName('PE_B_COPIAS_ENTREG').AsString := B_COPIAS_ENTREG.AsString;
         STPObtDocto.ParamByName('PE_NUMERO_COPIAS').AsFloat := NUMERO_COPIAS.AsFloat;

         If F_ENTREGA_COP.AsDateTime <> 0 Then
            STPObtDocto.ParamByName('PE_F_ENTREGA_COP').AsDateTime := F_ENTREGA_COP.AsDateTime
         Else
            STPObtDocto.ParamByName('PE_F_ENTREGA_COP').Clear;

         If F_EXPIRA.AsDateTime <> 0 Then
            STPObtDocto.ParamByName('PE_F_EXPIRA').AsDateTime := F_EXPIRA.AsDateTime
         Else
            STPObtDocto.ParamByName('PE_F_EXPIRA').Clear;

         STPObtDocto.ParamByName('PE_AREA_RESG_ORI').AsString := AREA_RESG_ORI.AsString;
         STPObtDocto.ParamByName('PE_NUM_EXPEDIENTE').AsFloat := NUM_EXPEDIENTE.AsFloat;
         STPObtDocto.ParamByName('PE_ID_DOC_RENUEVA').AsFloat := ID_DOC_RENUEVA.AsFloat;
         STPObtDocto.ParamByName('PE_ID_DOC_RENOVADOR').AsFloat := ID_DOC_RENOVADOR.AsFloat;

         If F_DEVUELTO_CTE.AsDateTime <> 0 Then
            STPObtDocto.ParamByName('PE_F_DEVUELTO_CTE').AsDateTime := F_DEVUELTO_CTE.AsDateTime
         Else
            STPObtDocto.ParamByName('PE_F_DEVUELTO_CTE').Clear;

         STPObtDocto.ParamByName('PE_SIT_DOCUMENTO').AsString := SIT_DOCUMENTO.AsString;

         If F_ALTA.AsDateTime <> 0 Then
            STPObtDocto.ParamByName('PE_F_ALTA').AsDateTime := F_ALTA.AsDateTime
         Else
            STPObtDocto.ParamByName('PE_F_ALTA').Clear;

         STPObtDocto.ParamByName('PE_CVE_USU_ALTA').AsString := CVE_USU_ALTA.AsString;

         If F_MODIFICA.AsDateTime <> 0 Then
            STPObtDocto.ParamByName('PE_F_MODIFICA').AsDateTime := F_MODIFICA.AsDateTime
         Else
            STPObtDocto.ParamByName('PE_F_MODIFICA').Clear;
            
         STPObtDocto.ParamByName('PE_CVE_USU_MODIFICA').AsString := CVE_USU_MODIFICA.AsString;
         STPObtDocto.ParamByName('PE_ID_EMPRESA').AsFloat := Apli.IdEmpresa;
         STPObtDocto.ExecProc;

         If STPObtDocto.ParamByName('PS_RESULTADO').AsFloat = 0 Then Begin
            ID_DOCUMENTO.AsFloat := STPObtDocto.ParamByName('PS_ID_DOCUMENTO').AsFloat;
            VLSalida:= True;
         End Else Begin
            ShowMessage('PROBLEMAS AL INSERTAR: ' +
                        IntToStr(STPObtDocto.ParamByName('PS_RESULTADO').AsInteger)+ ' : '+
                        STPObtDocto.ParamByName('PS_TX_RESULTADO').AsString);
         End;
      End;
   Finally
      If STPObtDocto <> Nil Then Begin
         STPObtDocto.UnPrepare;
         STPObtDocto.Free;
      end;
   End;
   Inserta := VLSalida;
End;

function TMCteDoc.InternalPost: Boolean;
Var       VLSalida     : Boolean;
begin
     InternalPost := False;
     VLSalida := False;
     if Modo=moEdit then
     begin
          VLSalida:=Inherited InternalPost;
     end;
     if Modo=moAppend then
     begin
          try
             VLSalida := Inserta;
          Except
               Beep;Beep;Beep;Beep;
               ShowMessage('Problemas con el Alta de Documento. Avise Urgentemente a Sistemas');
          end;
     end;
     AutoRefresh := True;
     InternalPost := VLSalida;
end;

(***********************************************FORMA DO_CLIENTE_DOC********************)
(*                                                                              *)
(*  FORMA DE DO_CLIENTE_DOC                                                            *)
(*                                                                              *)
(***********************************************FORMA DO_CLIENTE_DOC********************)

procedure TWMCteDoc.FormShow(Sender: TObject);
begin
   InterForma1.BtnNuevo.Visible := False;
   InterForma1.BtnEliminar.Visible := False;

   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   With Objeto Do Begin
      ID_ACREDITADO.Control    := edACREDITADO;
      ID_DOCUMENTO.Control     := edID_DOCUMENTO;
      CVE_DOCUMENTO.Control    := edCVE_DOCUMENTO;
      FOL_DOCUMENTO.Control    := edFOL_DOCUMENTO;
      TX_COMENTARIO.Control    := edTX_COMENTARIO;
      B_ORIGIN_ENTREG.Control  := cbxB_ORIGIN_ENTREG;
      F_ENTREGA_OR.Control     := edF_ENTREGA_OR;
      B_COPIAS_ENTREG.Control  := cbxB_COPIAS_ENTREG;
      NUMERO_COPIAS.Control    := edNUMERO_COPIAS;
      F_ENTREGA_COP.Control    := edF_ENTREGA_COP;
      F_EXPIRA.Control         := edF_EXPIRA;
      AREA_RESG_ORI.Control    := edAREA_RESG_ORI;
      NUM_EXPEDIENTE.Control   := edNUM_EXPEDIENTE;
      ID_DOC_RENUEVA.Control   := edID_DOC_RENUEVA;
      ID_DOC_RENOVADOR.Control := edID_DOC_RENOVADOR;
      F_DEVUELTO_CTE.Control   := edF_DEVUELTO_CTE;
      SIT_DOCUMENTO.Control    := rgSIT_RECEP_TRA;
      F_ALTA.Control           := edF_ALTA;
      CVE_USU_ALTA.Control     := edCVE_USUA_ALTA;
      F_MODIFICA.Control       := edF_MODIFICA;
      CVE_USU_MODIFICA.Control := edCVE_USUA_MODIF;
      InterForma1.MsgPanel     := PnlMsg;
   End;

   Objeto.Acreditado.ID_ACREDITADO.Control := edACREDITADO;
   Objeto.Acreditado.Persona.Nombre.Control := edNOMBRE_ACRED;
   Objeto.GetParams(Objeto);
   edNOMBRE_ACRED.Hint := Objeto.Acreditado.Persona.Nombre.AsString;
   edNOMBRE_ACRED.ShowHint := True;

   Objeto.Doctos.CVE_DOCUMENTO.Control := edCVE_DOCUMENTO;
   Objeto.Doctos.DESC_DOCUMENTO.Control := edDOCUMENTO;
   Objeto.Doctos.GetParams(Objeto);
   edDOCUMENTO.Hint := Objeto.Doctos.DESC_DOCUMENTO.AsString;
   edDOCUMENTO.ShowHint := True;

   If Objeto.ID_ACREDITADO.AsInteger <>0 Then
      Objeto.Acreditado.FindKey([Objeto.ID_ACREDITADO.AsInteger]);
end;

procedure TWMCteDoc.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      ID_ACREDITADO.Control    := Nil;
      ID_DOCUMENTO.Control     := Nil;
      CVE_DOCUMENTO.Control    := Nil;
      FOL_DOCUMENTO.Control    := Nil;
      TX_COMENTARIO.Control    := Nil;
      B_ORIGIN_ENTREG.Control  := Nil;
      F_ENTREGA_OR.Control     := Nil;
      B_COPIAS_ENTREG.Control  := Nil;
      NUMERO_COPIAS.Control    := Nil;
      F_ENTREGA_COP.Control    := Nil;
      F_EXPIRA.Control         := Nil;
      AREA_RESG_ORI.Control    := Nil;
      NUM_EXPEDIENTE.Control   := Nil;
      ID_DOC_RENUEVA.Control   := Nil;
      ID_DOC_RENOVADOR.Control := Nil;
      F_DEVUELTO_CTE.Control   := Nil;
      SIT_DOCUMENTO.Control    := Nil;
      F_ALTA.Control           := Nil;
      CVE_USU_ALTA.Control     := Nil;
      F_MODIFICA.Control       := Nil;
      CVE_USU_MODIFICA.Control := Nil;
      InterForma1.MsgPanel     := Nil;

   End;

   Objeto.Acreditado.ID_ACREDITADO.Control := nil;
   Objeto.Acreditado.Persona.Nombre.Control := nil;

   Objeto.Doctos.CVE_DOCUMENTO.Control  := Nil;
   Objeto.Doctos.DESC_DOCUMENTO.Control := Nil;
end;

procedure TWMCteDoc.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWMCteDoc.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   With Objeto Do Begin
      if IsNewData then Begin
         if MessageDlg('¿Desea almacenar los datos capturados?',
            mtConfirmation,[mbYes, mbNo], 0) = mrYes then Begin
            Objeto.B_ORIGIN_ENTREG.GetFromControl;
            Objeto.B_COPIAS_ENTREG.GetFromControl;
            If (Objeto.B_ORIGIN_ENTREG.AsString = 'F')and
               (Objeto.B_COPIAS_ENTREG.AsString = 'F') Then Begin
               ShowMessage('Indique si se entregaron copias u original del documento');
               Realizado := False;
            End Else Begin
               CVE_USU_ALTA.AsString := DameUsuario;
               F_ALTA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
               Realizado := True;
            End;
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

procedure TWMCteDoc.InterForma1Buscar(Sender: TObject);
begin
   With Objeto Do Begin
      InternalBusca;
   End;
end;

procedure TWMCteDoc.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.F_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   rgSIT_RECEP_TRA.ItemIndex:= 0;
   edACREDITADO.SetFocus;

   If Objeto.Acreditado.ID_ACREDITADO.AsInteger<>0  Then Begin
      Objeto.ID_ACREDITADO.AsInteger := Objeto.Acreditado.ID_ACREDITADO.AsInteger;
      edCVE_DOCUMENTO.SetFocus;
   End;
   If Objeto.Doctos.CVE_DOCUMENTO.AsString<>'' Then Begin
      Objeto.CVE_DOCUMENTO.AsString := Objeto.Doctos.CVE_DOCUMENTO.AsString;
      edFOL_DOCUMENTO.SetFocus;      
   End;
   dtpF_EXPIRA.MinDate:= Objeto.Apli.DameFechaEmpresaDia('D000');
   dtpF_ENTREGA_OR.MinDate:= Objeto.Apli.DameFechaEmpresaDia('D000');
   dtpB_COPIAS_ENTREG.MinDate:= Objeto.Apli.DameFechaEmpresaDia('D000');
   dtpF_DEVOLUCION.MinDate:= Objeto.Apli.DameFechaEmpresaDia('D000');

   dtpF_EXPIRA.DateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
   dtpF_ENTREGA_OR.DateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
   dtpB_COPIAS_ENTREG.DateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
   dtpF_DEVOLUCION.DateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');

end;

procedure TWMCteDoc.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.F_MODIFICA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
end;

procedure TWMCteDoc.edACREDITADOExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.ID_ACREDITADO.GetFromControl;
      If Objeto.ID_ACREDITADO.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Indique el identificador del Acreditado';
      End;
      InterForma1.ValidaExit(edACREDITADO,vlSalida,vlMsg,True);
   End;
end;

procedure TWMCteDoc.btACREDITADOClick(Sender: TObject);
begin
   Objeto.Acreditado.ShowAll := True;
   If Objeto.Acreditado.Busca Then Begin
        InterForma1.NextTab(edACREDITADO);
   End;
end;

procedure TWMCteDoc.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and(InterForma1.IsNewData);//
end;

procedure TWMCteDoc.ilACREDITADOEjecuta(Sender: TObject);
begin
    If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
        InterForma1.NextTab(edACREDITADO);
    End;
end;

procedure TWMCteDoc.edCVE_DOCUMENTOExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
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

procedure TWMCteDoc.btDOCUMENTOClick(Sender: TObject);
begin
   Objeto.Doctos.ShowAll := True;
   Objeto.Doctos.BuscaWhereString :='ID_EMPRESA ='+ IntToStr(Objeto.Apli.IdEmpresa)+
                                    ' AND SIT_DOCUMENTO = ''AC''';
   Objeto.Doctos.FilterString := Objeto.Doctos.BuscaWhereString;
   If Objeto.Doctos.Busca Then Begin
      InterForma1.NextTab(edCVE_DOCUMENTO);
   End;
end;

procedure TWMCteDoc.ilDocumentoCapture(Sender: TObject; var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWMCteDoc.ilDocumentoEjecuta(Sender: TObject);
begin
   If Objeto.Doctos.FindKey([Objeto.Apli.IdEmpresa,ilDocumento.Buffer]) Then Begin
      Objeto.CVE_DOCUMENTO.AsString:= Objeto.Doctos.CVE_DOCUMENTO.AsString;
      edDOCUMENTO.Text:= Objeto.Doctos.DESC_DOCUMENTO.AsString;
      InterForma1.NextTab(edCVE_DOCUMENTO);
   End;
end;

procedure TWMCteDoc.edFOL_DOCUMENTOExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg, sSQL :  String;
     vlCveGar  : String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.FOL_DOCUMENTO.GetFromControl;
      Objeto.CVE_DOCUMENTO.GetFromControl;
      Objeto.ID_ACREDITADO.GetFromControl;

      If Objeto.FOL_DOCUMENTO.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Debe indicar el número de Folio del documento';
      End Else Begin
         sSQL:='SELECT CVE_DOCUMENTO, ID_ACREDITADO, FOL_DOCUMENTO '+
               '  FROM DO_CLIENTE_DOC '+
               ' WHERE CVE_DOCUMENTO='+ Objeto.CVE_DOCUMENTO.AsSQL +
               '   AND ID_ACREDITADO='+ Objeto.ID_ACREDITADO.AsSQL +
               '   AND FOL_DOCUMENTO='+ Objeto.FOL_DOCUMENTO.AsSQL;

         If InterForma1.IsNewData Then Begin
            GetSQLStr(sSQL,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'FOL_DOCUMENTO',vlCveGar,False);
            If (vlCveGar <>'' ) Then Begin
               If MessageDlg('La relación del acreditado con el documento ya existe'#13#10'¿Desea continuar?',
                  mtConfirmation,[mbYes, mbNo], 0) = mrYes Then
                  VLSalida := True
               Else
                  VLSalida := False;
            End;
         End;
      End;
      InterForma1.ValidaExit(edFOL_DOCUMENTO,vlSalida,vlMsg,True);
   End;
end;

procedure TWMCteDoc.edF_EXPIRAExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      rgSIT_RECEP_TRA.ItemIndex:= 0;
      Objeto.F_EXPIRA.GetFromControl;
      If Objeto.F_EXPIRA.AsString <> CNULL Then Begin
         If Objeto.F_EXPIRA.AsDateTime <= Objeto.Apli.DameFechaEmpresaDia('D000') Then Begin
            vlSalida   := False;
            vlMsg := 'La Fecha de expiración debe ser mayor al día de hoy';
            rgSIT_RECEP_TRA.ItemIndex:= 2
         End;
      End;
      InterForma1.ValidaExit(edF_EXPIRA,vlSalida,vlMsg,True);
   End;
end;

procedure TWMCteDoc.cbxB_ORIGIN_ENTREGExit(Sender: TObject);
begin
   InterForma1.ValidaExit(cbxB_ORIGIN_ENTREG,True,CNULL,True);
end;

procedure TWMCteDoc.cbxB_COPIAS_ENTREGExit(Sender: TObject);
begin
   InterForma1.ValidaExit(cbxB_COPIAS_ENTREG,True,CNULL,True);
end;

procedure TWMCteDoc.edF_ENTREGA_ORExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.F_ENTREGA_OR.GetFromControl;
      If Objeto.F_ENTREGA_OR.AsString <> CNULL Then Begin
         If Objeto.F_ENTREGA_OR.AsDateTime < Objeto.Apli.DameFechaEmpresaDia('D000') Then Begin
            vlSalida   := False;
            vlMsg := 'La Fecha de entrega debe ser mayor o igual al día de hoy';
         End Else Begin
            cbxB_ORIGIN_ENTREG.Checked:= True;
         End;
      End Else Begin
         cbxB_ORIGIN_ENTREG.Checked:= False;
      End;
      InterForma1.ValidaExit(edF_ENTREGA_OR,vlSalida,vlMsg,True);
   End;
end;

procedure TWMCteDoc.edF_ENTREGA_COPExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.F_ENTREGA_COP.GetFromControl;
      If Objeto.F_ENTREGA_COP.AsString <> CNULL Then Begin
         cbxB_COPIAS_ENTREG.Checked:= True;
         If Trim(edNUMERO_COPIAS.Text)='' Then
            edNUMERO_COPIAS.Text:= '1';
         If Objeto.F_ENTREGA_COP.AsDateTime < Objeto.Apli.DameFechaEmpresaDia('D000') Then Begin
            vlSalida   := False;
            vlMsg := 'La Fecha de entrega debe ser mayor o igual al día de hoy';
         End;
      End Else Begin
         cbxB_COPIAS_ENTREG.Checked:= False;
         edNUMERO_COPIAS.Text:= '';
      End;
      InterForma1.ValidaExit(edF_ENTREGA_COP,vlSalida,vlMsg,True);
   End;
end;

procedure TWMCteDoc.edNUMERO_COPIASExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edNUMERO_COPIAS,True,CNULL,True);
end;

procedure TWMCteDoc.edAREA_RESG_ORIExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.AREA_RESG_ORI.GetFromControl;
      Objeto.B_ORIGIN_ENTREG.GetFromControl;
      If Objeto.B_ORIGIN_ENTREG.AsString = 'V' Then Begin
         If Objeto.AREA_RESG_ORI.AsString = CNULL Then Begin
            vlSalida   := False;
            vlMsg := 'Debe especificar el área de resguardo del documento original';
         End;
      End;
      InterForma1.ValidaExit(edAREA_RESG_ORI,vlSalida,vlMsg,True);
   End;
end;

procedure TWMCteDoc.edNUM_EXPEDIENTEExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.NUM_EXPEDIENTE.GetFromControl;
      Objeto.B_ORIGIN_ENTREG.GetFromControl;
      If Objeto.B_ORIGIN_ENTREG.AsString = 'V' Then Begin
         If Objeto.NUM_EXPEDIENTE.AsFloat = 0 Then Begin
            vlSalida   := False;
            vlMsg := 'Debe especificar el número de expediente de resguardo del documento original';
         End;
      End;
      InterForma1.ValidaExit(edNUM_EXPEDIENTE,vlSalida,vlMsg,True);
   End;
end;

procedure TWMCteDoc.edID_DOC_RENUEVAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edID_DOC_RENUEVA,True,CNULL,True);
end;

procedure TWMCteDoc.edID_DOC_RENOVADORExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edID_DOC_RENOVADOR,True,CNULL,True);
end;

procedure TWMCteDoc.edF_DEVUELTO_CTEExit(Sender: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      rgSIT_RECEP_TRA.ItemIndex:= 0;
      Objeto.F_DEVUELTO_CTE.GetFromControl;
      Objeto.B_ORIGIN_ENTREG.GetFromControl;
      Objeto.B_COPIAS_ENTREG.GetFromControl;

      If Objeto.F_DEVUELTO_CTE.AsString <> CNULL Then Begin
         If (Objeto.B_ORIGIN_ENTREG.AsString ='F')And
            (Objeto.B_COPIAS_ENTREG.AsString ='F') Then Begin
            vlSalida := False;
            vlMsg := 'Debe indicar si se recibieron documentos originales o copias para que exista una devolución';
         End Else Begin
            If Objeto.F_DEVUELTO_CTE.AsDateTime < Objeto.Apli.DameFechaEmpresaDia('D000') Then Begin
               vlSalida := False;
               vlMsg := 'La Fecha de devolución debe ser mayor o igual al día de hoy';
            End Else
               rgSIT_RECEP_TRA.ItemIndex:= 3;
         End;
      End;
      InterForma1.ValidaExit(edF_DEVUELTO_CTE,vlSalida,vlMsg,True);
   End;
end;

procedure TWMCteDoc.rgSIT_RECEP_TRAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_RECEP_TRA,True,CNULL,True);
end;

procedure TWMCteDoc.edTX_COMENTARIOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edTX_COMENTARIO,True,CNULL,True);
end;

procedure TWMCteDoc.edNUMERO_COPIASKeyPress(Sender: TObject;
  var Key: Char);
begin
   If (Pos(Key,'0123456789'#8) = 0) Then Key := #0;
end;

procedure TWMCteDoc.edNUM_EXPEDIENTEKeyPress(Sender: TObject;
  var Key: Char);
begin
   If cbxB_ORIGIN_ENTREG.Checked Then Begin
      If (Pos(Key,'0123456789'#8) = 0) Then Key := #0;
   End Else
      Key := #0;
end;

procedure TWMCteDoc.edID_DOC_RENUEVAKeyPress(Sender: TObject;
  var Key: Char);
begin
   If (Pos(Key,'0123456789'#8) = 0) Then Key := #0;
end;

procedure TWMCteDoc.edID_DOC_RENOVADORKeyPress(Sender: TObject;
  var Key: Char);
begin
   If (Pos(Key,'0123456789'#8) = 0) Then Key := #0;
end;

procedure TWMCteDoc.cbxB_ORIGIN_ENTREGClick(Sender: TObject);
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      If cbxB_ORIGIN_ENTREG.Checked Then Begin
         If Trim(edF_ENTREGA_OR.Text)='' Then
            edF_ENTREGA_OR.Text:= FormatDateTime('dd/mm/yyyy',Objeto.Apli.DameFechaEmpresaDia('D000'));
      End Else Begin
         edF_ENTREGA_OR.Text:= '';
         edAREA_RESG_ORI.Text:= '';
         edNUM_EXPEDIENTE.Text:= '';
      End;
   End;
end;

procedure TWMCteDoc.cbxB_COPIAS_ENTREGClick(Sender: TObject);
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      If cbxB_COPIAS_ENTREG.Checked Then Begin
         If Trim(edF_ENTREGA_COP.Text)='' Then Begin
            edF_ENTREGA_COP.Text:= FormatDateTime('dd/mm/yyyy',Objeto.Apli.DameFechaEmpresaDia('D000'));
            If Trim(edNUMERO_COPIAS.Text)='' Then
               edNUMERO_COPIAS.Text:= '1';
         End;
      End Else Begin
         edF_ENTREGA_COP.Text:= '';
         edNUMERO_COPIAS.Text:= '';
      End;
   End;
end;

procedure TWMCteDoc.btRenovarExit(Sender: TObject);
begin
   InterForma1.ValidaExit(btRenovar,True,CNULL,True);
end;

procedure TWMCteDoc.btRenovarClick(Sender: TObject);
Var
   stpRenovar : TStoredProc;
   MCteDoc: TMCteDoc;
Begin
   stpRenovar:=TStoredProc.Create(Nil);
   Try
      stpRenovar.DatabaseName:=Objeto.DataBaseName;
      stpRenovar.SessionName:=Objeto.SessionName;
      stpRenovar.Active:=False;
      stpRenovar.Params.Clear;
      stpRenovar.StoredProcName:='PKGCRDOCUMENTACION.STP_ALTA_RENOVACION';
      stpRenovar.Params.CreateParam(ftFloat,'PE_ID_ACREDITADO',ptInput);
      stpRenovar.Params.CreateParam(ftFloat,'PE_ID_DOCUMENTO',ptInput);
      stpRenovar.Params.CreateParam(ftString,'PE_CVE_DOCUMENTO',ptInput);
      stpRenovar.Params.CreateParam(ftString,'PE_FOL_DOCUMENTO',ptInput);
      stpRenovar.Params.CreateParam(ftString,'PE_TX_COMENTARIO',ptInput);
      stpRenovar.Params.CreateParam(ftString,'PE_B_ORIGIN_ENTREG',ptInput);
      stpRenovar.Params.CreateParam(ftDateTime,'PE_F_ENTREGA_OR',ptInput);
      stpRenovar.Params.CreateParam(ftString,'PE_B_COPIAS_ENTREG',ptInput);
      stpRenovar.Params.CreateParam(ftFloat,'PE_NUMERO_COPIAS',ptInput);
      stpRenovar.Params.CreateParam(ftDateTime,'PE_F_ENTREGA_COP',ptInput);
      stpRenovar.Params.CreateParam(ftDateTime,'PE_F_EXPIRA',ptInput);
      stpRenovar.Params.CreateParam(ftString,'PE_AREA_RESG_ORI',ptInput);
      stpRenovar.Params.CreateParam(ftFloat,'PE_NUM_EXPEDIENTE',ptInput);
      stpRenovar.Params.CreateParam(ftFloat,'PE_ID_DOC_RENUEVA',ptInput);
      stpRenovar.Params.CreateParam(ftFloat,'PE_ID_DOC_RENOVADOR',ptInput);
      stpRenovar.Params.CreateParam(ftDateTime,'PE_F_DEVUELTO_CTE',ptInput);
      stpRenovar.Params.CreateParam(ftString,'PE_SIT_DOCUMENTO',ptInput);
      stpRenovar.Params.CreateParam(ftString,'PE_F_ALTA',ptInput);
      stpRenovar.Params.CreateParam(ftString,'PE_CVE_USU_ALTA',ptInput);
      stpRenovar.Params.CreateParam(ftDateTime,'PE_F_MODIFICA',ptInput);
      stpRenovar.Params.CreateParam(ftString,'PE_CVE_USU_MODIFICA',ptInput);
      stpRenovar.Params.CreateParam(ftFloat,'PE_ID_EMPRESA',ptInput);

      stpRenovar.Params.CreateParam(ftFloat,'PS_ID_ACREDITADO',ptOutput);
      stpRenovar.Params.CreateParam(ftFloat,'PS_ID_DOCUMENTO',ptOutput);
      stpRenovar.Params.CreateParam(ftString,'PS_CVE_DOCUMENTO',ptOutput);
      stpRenovar.Params.CreateParam(ftFloat,'PS_RESULTADO',ptOutput);
      stpRenovar.Params.CreateParam(ftString,'PS_TX_RESULTADO',ptOutput);

      stpRenovar.ParamByName('PE_ID_ACREDITADO').AsFloat := Objeto.ID_ACREDITADO.AsFloat;
      stpRenovar.ParamByName('PE_ID_DOCUMENTO').AsFloat := Objeto.ID_DOCUMENTO.AsFloat;
      stpRenovar.ParamByName('PE_CVE_DOCUMENTO').AsString := Objeto.CVE_DOCUMENTO.AsString;
      stpRenovar.ParamByName('PE_FOL_DOCUMENTO').AsString := Objeto.FOL_DOCUMENTO.AsString;
      stpRenovar.ParamByName('PE_TX_COMENTARIO').AsString := Objeto.TX_COMENTARIO.AsString;
      stpRenovar.ParamByName('PE_B_ORIGIN_ENTREG').AsString := Objeto.B_ORIGIN_ENTREG.AsString;

      If Objeto.F_ENTREGA_OR.AsDateTime <> 0 Then
         stpRenovar.ParamByName('PE_F_ENTREGA_OR').AsDateTime := Objeto.F_ENTREGA_OR.AsDateTime
      Else
         stpRenovar.ParamByName('PE_F_ENTREGA_OR').Clear;

      stpRenovar.ParamByName('PE_B_COPIAS_ENTREG').AsString := Objeto.B_COPIAS_ENTREG.AsString;
      stpRenovar.ParamByName('PE_NUMERO_COPIAS').AsFloat := Objeto.NUMERO_COPIAS.AsFloat;

      If Objeto.F_ENTREGA_COP.AsDateTime <> 0 Then
         stpRenovar.ParamByName('PE_F_ENTREGA_COP').AsDateTime := Objeto.F_ENTREGA_COP.AsDateTime
      Else
         stpRenovar.ParamByName('PE_F_ENTREGA_COP').Clear;

      If Objeto.F_EXPIRA.AsDateTime <> 0 Then
         stpRenovar.ParamByName('PE_F_EXPIRA').AsDateTime := Objeto.F_EXPIRA.AsDateTime
      Else
         stpRenovar.ParamByName('PE_F_EXPIRA').Clear;

      stpRenovar.ParamByName('PE_AREA_RESG_ORI').AsString := Objeto.AREA_RESG_ORI.AsString;
      stpRenovar.ParamByName('PE_NUM_EXPEDIENTE').AsFloat := Objeto.NUM_EXPEDIENTE.AsFloat;
      stpRenovar.ParamByName('PE_ID_DOC_RENUEVA').AsFloat := Objeto.ID_DOC_RENUEVA.AsFloat;
      stpRenovar.ParamByName('PE_ID_DOC_RENOVADOR').AsFloat := Objeto.ID_DOC_RENOVADOR.AsFloat;

      If Objeto.F_DEVUELTO_CTE.AsDateTime <> 0 Then
         stpRenovar.ParamByName('PE_F_DEVUELTO_CTE').AsDateTime := Objeto.F_DEVUELTO_CTE.AsDateTime
      Else
         stpRenovar.ParamByName('PE_F_DEVUELTO_CTE').Clear;

      stpRenovar.ParamByName('PE_SIT_DOCUMENTO').AsString := Objeto.SIT_DOCUMENTO.AsString;

      If Objeto.F_ALTA.AsDateTime<>0 Then
         stpRenovar.ParamByName('PE_F_ALTA').AsDateTime := Objeto.F_ALTA.AsDateTime
      Else
         stpRenovar.ParamByName('PE_F_ALTA').Clear;

      stpRenovar.ParamByName('PE_CVE_USU_ALTA').AsString := Objeto.CVE_USU_ALTA.AsString;

      If Objeto.F_MODIFICA.AsDateTime <> 0 Then
         stpRenovar.ParamByName('PE_F_MODIFICA').AsDateTime := Objeto.F_MODIFICA.AsDateTime
      Else
         stpRenovar.ParamByName('PE_F_MODIFICA').Clear;

      stpRenovar.ParamByName('PE_CVE_USU_MODIFICA').AsString := Objeto.CVE_USU_MODIFICA.AsString;
      stpRenovar.ParamByName('PE_ID_EMPRESA').AsFloat := Objeto.Apli.IdEmpresa;
      stpRenovar.ExecProc;

      If stpRenovar.ParamByName('PS_RESULTADO').AsFloat = 0 Then Begin
         edID_DOC_RENOVADOR.Text := stpRenovar.ParamByName('PS_ID_DOCUMENTO').AsString;
         MCteDoc:=TMCteDoc.create(self);
         Try
            MCteDoc.Apli:= Objeto.Apli;
            MCteDoc.ParamCre:= Objeto.ParamCre;
            MCteDoc.Acreditado:= Objeto.Acreditado;
            MCteDoc.Doctos:= Objeto.Doctos;
            MCteDoc.FindKey([stpRenovar.ParamByName('PS_ID_ACREDITADO').AsFloat,
                             stpRenovar.ParamByName('PS_ID_DOCUMENTO').AsFloat,
                             stpRenovar.ParamByName('PS_CVE_DOCUMENTO').AsString ]);
            MCteDoc.Modifica;
         Finally
            MCteDoc.Free;
         End;

      End Else Begin
          ShowMessage('PROBLEMAS AL RENOVAR : ' +
                      IntToStr(stpRenovar.ParamByName('PS_RESULTADO').AsInteger)+ ' : '+
                      stpRenovar.ParamByName('PS_TX_RESULTADO').AsString);
      End;
   Finally
      If stpRenovar <> Nil Then Begin
         stpRenovar.UnPrepare;
         stpRenovar.Free;
      End;
   End;
End;

procedure TWMCteDoc.edNUMERO_COPIASChange(Sender: TObject);
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      If Trim(edNUMERO_COPIAS.Text)<>'' Then Begin
         cbxB_COPIAS_ENTREG.Checked:= True;
         If Trim(edF_ENTREGA_COP.Text)='' Then
            edF_ENTREGA_COP.Text:= FormatDateTime('dd/mm/yyyy',Objeto.Apli.DameFechaEmpresaDia('D000'));
      End Else Begin
         cbxB_COPIAS_ENTREG.Checked:= False;
         edF_ENTREGA_COP.Text:= '';
      End;
   End;
end;

procedure TWMCteDoc.edAREA_RESG_ORIKeyPress(Sender: TObject;
  var Key: Char);
begin
   If not cbxB_ORIGIN_ENTREG.Checked Then Begin
      Key := #0;
   End;
end;

procedure TWMCteDoc.InterForma1DespuesShow(Sender: TObject);
begin

   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      edACREDITADO.SetFocus;
      If Objeto.Acreditado.ID_ACREDITADO.AsInteger<>0 Then Begin
         Objeto.ID_ACREDITADO.AsInteger:= Objeto.Acreditado.ID_ACREDITADO.AsInteger;
         edCVE_DOCUMENTO.SetFocus;
      End;
      If Objeto.Doctos.CVE_DOCUMENTO.AsString<>'' Then Begin
         Objeto.CVE_DOCUMENTO.AsString:= Objeto.Doctos.CVE_DOCUMENTO.AsString;
         edFOL_DOCUMENTO.SetFocus;
      End;
   End;
end;

end.
