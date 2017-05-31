// Sistema         : Clase de DO_RECEP_TRAM
// Fecha de Inicio : 21/04/2004
// Función forma   : Clase de DO_RECEP_TRAM
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMRecTra;

Interface

Uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,
IntGenCre, IntParamCre, IntMPers,Menus, IntSGCtrl,
IntMTramite,    //catálogo de trámites
IntMDoctos,     //catálogo de documentos
IntCrAcredit,   //catálogo de acreditado
IntMDoMedio,    //catálogo de medios
IntMCteDoc,     //alta de documentos por acreditado
IntMExpAcreD   //Consulta de documentos entregados por acreditado
;

Type
 TMRecTra= Class;

  TWMRecTra=Class(TForm)
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
    rgSIT_RECEP_TRA: TRadioGroup;
    Label5: TLabel;
    edCVE_TRAMITE: TEdit;
    btTRAMITE: TBitBtn;
    edTRAMITE: TEdit;
    ilTramite: TInterLinkit;
    btAutorizar: TBitBtn;
    btCancelar: TBitBtn;
    GroupBox1: TGroupBox;
    lbID_PROMOTOR: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edID_EMPRESA: TEdit;
    btEMPRESA: TBitBtn;
    edNOM_EMPRESA: TEdit;
    edID_TRAMITE: TEdit;
    edID_REFERENCIA: TEdit;
    edCVE_MEDIO: TEdit;
    edACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    btCVE_MEDIO: TBitBtn;
    edNOM_CVE_MEDIO: TEdit;
    InterForma1: TInterForma;
    ilEMPRESA: TInterLinkit;
    ilACREDITADO: TInterLinkit;
    ilCVE_MEDIO: TInterLinkit;
    lbUSUA_ALTA: TLabel;
    lbF_ALTA: TLabel;
    edCVE_USUA_ALTA: TEdit;
    edF_ALTA: TEdit;
    lbUSUA_MODIF: TLabel;
    lbF_MODIF: TLabel;
    edCVE_USUA_MODIF: TEdit;
    edF_MODIFICA: TEdit;
    shp4: TShape;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape5: TShape;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Shape6: TShape;
    Label11: TLabel;
    Shape10: TShape;
    Label12: TLabel;
    Shape11: TShape;
    Label16: TLabel;
    sgcDATA: TSGCtrl;
    pmDoctos: TPopupMenu;
    Consultar1: TMenuItem;
    RegistrarDatosdeDocumento1: TMenuItem;
    Panel1: TPanel;
    Label15: TLabel;
    Label14: TLabel;
    Label13: TLabel;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    Label18: TLabel;
    Adicionardocumentoaltrmite1: TMenuItem;
    Procedure FormShow(Sender : TObject);
    Procedure FormClose(Sender : TObject; var Action : TCloseAction);
    Procedure FormDestroy(Sender : TObject);
    Procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    Procedure InterForma1Buscar(Sender: TObject);
    Procedure edID_EMPRESAExit(Sender: TObject);
    Procedure btEMPRESAClick(Sender: TObject);
    Procedure ilEMPRESACapture(Sender: TObject; var Show: Boolean);
    Procedure ilEMPRESAEjecuta(Sender: TObject);
    Procedure InterForma1DespuesNuevo(Sender: TObject);
    Procedure rgSIT_RECEP_TRAExit(Sender: TObject);
    Procedure InterForma1DespuesModificar(Sender: TObject);
    Procedure edID_EMPRESAKeyPress(Sender: TObject; var Key: Char);
    Procedure edCVE_TRAMITEExit(Sender: TObject);
    Procedure btTRAMITEClick(Sender: TObject);
    Procedure edID_REFERENCIAExit(Sender: TObject);
    Procedure edCVE_MEDIOExit(Sender: TObject);
    Procedure edID_REFERENCIAKeyPress(Sender: TObject; var Key: Char);
    Procedure ilTramiteCapture(Sender: TObject; var Show: Boolean);
    Procedure ilTramiteEjecuta(Sender: TObject);
    Procedure InterForma1DespuesAceptar(Sender: TObject);
    Procedure edACREDITADOExit(Sender: TObject);
    Procedure btACREDITADOClick(Sender: TObject);
    Procedure ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
    Procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure btAutorizarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure InterForma1AntesNuevo(Sender: TObject;
      var Realizado: Boolean);
    procedure btCVE_MEDIOClick(Sender: TObject);
    procedure ilCVE_MEDIOCapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_MEDIOEjecuta(Sender: TObject);
    procedure RegistrarDatosdeDocumento1Click(Sender: TObject);
    procedure sgcDATACalcRow(Sendet: TObject; DataSet: TDataSet;
      CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
    procedure sgcDATADblClick(Sender: TObject);
    procedure sgcDATAMoveRow(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure Consultar1Click(Sender: TObject);
    procedure Adicionardocumentoaltrmite1Click(Sender: TObject);

    Private
    { Private declarations }
        Procedure Controles;
        Function  ValidaPerfilUsuario: Boolean;
        Procedure MuestraDatos;
        Function  CadenaSql : String;
        Procedure Documentos;
        Procedure BitacoraDoctos;
        Procedure Exceptuar;
    Public
    { Public declarations }
      Objeto : TMRecTra;
    End;

 TMRecTra= class(TInterFrame)
      Private
         bContinuar:Boolean;
      Protected
      Public
        { Public declarations }
        ID_ACREDITADO            : TInterCampo;
        ID_EMPRESA               : TInterCampo;
        ID_TRAMITE               : TInterCampo;
        CVE_TRAMITE              : TInterCampo;
        ID_REFERENCIA            : TInterCampo;
        CVE_MEDIO                : TInterCampo;
        SIT_RECEP_TRAM           : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_DOCUMENTO            : TInterCampo;

        iIdEmpresa, iIdAcreditado, iReferencia : Integer;
        sCveMedio, sCveTramite, sCveProduct: String;

        ParamCre                 : TParamCre;
        Empresa                  : TMPersona; //Empresa
        Tramite                  : TMTramite;
        Acreditado               : TCrAcredit;
        MDoMedio                 : TMDoMedio;
        Doctos                   : TMDoctos;        

        Function    InternalBusca : Boolean; override;
        Constructor Create( AOwner : TComponent ); override;
        Destructor  Destroy; override;
        Function    InternalPost:Boolean; override;
        Function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        Function    Reporte:Boolean; override;
      Published
      End;

Implementation
Uses IntMRecExc,  //captura de excepciones
     IntMRecDoc      //Guarda documentos recibidos
     ;
{$R *.DFM}

Constructor TMRecTra.Create( AOwner : TComponent );
Begin Inherited;

   ID_ACREDITADO :=CreaCampo('ID_ACREDITADO',ftFloat,tsNinguno,tsNinguno,True);
      ID_ACREDITADO.Caption:='Identificador de Acreditado';
      ID_ACREDITADO.NoCompare:= False;
   ID_EMPRESA :=CreaCampo('ID_EMPRESA',ftFloat,tsNinguno,tsNinguno,True);
      ID_EMPRESA.Caption:='Identificador de empresa';
      ID_EMPRESA.NoCompare:= False;
   ID_TRAMITE :=CreaCampo('ID_TRAMITE',ftFloat,tsNinguno,tsNinguno,True);
      ID_TRAMITE.Caption:='Folio del trámite';
      ID_TRAMITE.NoCompare:= False;
   CVE_TRAMITE :=CreaCampo('CVE_TRAMITE',ftString,tsNinguno,tsNinguno,True);
      CVE_TRAMITE.Caption:='Clave de Trámites';
      CVE_TRAMITE.NoCompare:= False;

   ID_REFERENCIA :=CreaCampo('ID_REFERENCIA',ftFloat,tsNinguno,tsNinguno,True);
      ID_REFERENCIA.Caption:='Número de referencia';
      ID_REFERENCIA.NoCompare:= True;
   CVE_MEDIO :=CreaCampo('CVE_MEDIO',ftString,tsNinguno,tsNinguno,True);
      CVE_MEDIO.Caption:='Descripción corta del Trámite';
      CVE_MEDIO.NoCompare:= True;
   SIT_RECEP_TRAM :=CreaCampo('SIT_RECEP_TRAM',ftString,tsNinguno,tsNinguno,True);
   With SIT_RECEP_TRAM Do Begin
      Size:=2;
      UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add('AC');
      ComboLista.Add('1'); ComboDatos.Add('PE');
      ComboLista.Add('2'); ComboDatos.Add('AU');
      ComboLista.Add('3'); ComboDatos.Add('CA');
   End;
      SIT_RECEP_TRAM.Caption:='Situación del Trámite';
      SIT_RECEP_TRAM.NoCompare:= True;
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

   CVE_DOCUMENTO:= CreaCampo('CVE_DOCUMENTO',ftString,tsNinguno,tsNinguno,False);
      CVE_DOCUMENTO.Caption:='Clave de Documento';      

   FKeyFields.Add('ID_ACREDITADO');
   FKeyFields.Add('ID_EMPRESA');
   FKeyFields.Add('ID_TRAMITE');
   FKeyFields.Add('CVE_TRAMITE');

   TableName := 'DO_RECEP_TRAM';
   UseQuery := True;
   HelpFile := 'IntMRecTra.Hlp';
   ShowMenuReporte:=True;

   Empresa := TMPersona.Create(Self);
   Empresa.FilterBy := fbTMPersonaEmpresa;
   Empresa.MasterSource := Self;
   Empresa.FieldByName('ID_PERSONA').MasterField := 'ID_EMPRESA';

   Tramite:= TMTramite.Create(Self);
   Tramite.MasterSource := Self;
   Tramite.FieldByName('ID_EMPRESA').MasterField := 'ID_EMPRESA';
   Tramite.FieldByName('CVE_TRAMITE').MasterField := 'CVE_TRAMITE';

   Acreditado := TCrAcredit.Create(Self);
   Acreditado.MasterSource := Self;
   Acreditado.FieldByName('ID_ACREDITADO').MasterField := 'ID_ACREDITADO';

   MDoMedio := TMDoMedio.Create(Self);
   MDoMedio.MasterSource := Self;
   MDoMedio.FieldByName('CVE_MEDIO').MasterField := 'CVE_MEDIO';

   Doctos:= TMDoctos.Create(Self);
   Doctos.MasterSource := Self;
   Doctos.FieldByName('CVE_DOCUMENTO').MasterField := 'CVE_DOCUMENTO';
End;


Destructor TMRecTra.Destroy;
Begin
   If Empresa <> Nil Then
      Empresa.Free;
   If Tramite <> Nil Then
      Tramite.Free;
   If Acreditado <> Nil Then
      Acreditado.Free;
   If MDoMedio <> Nil Then
      MDoMedio.Free;
   If Doctos <> Nil Then
      Doctos.Free;
   Inherited;
End;

Function TMRecTra.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMRecTra;
Begin
   W:=TWMRecTra.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   Finally
      W.Free;
   End;
End;

Function TMRecTra.InternalBusca:Boolean;
Var T : TInterFindit;
Begin
   InternalBusca := False;
   T := CreaBuscador('IMRecTram.it','F,F,F,S');
   Try
      if Active Then Begin
         T.Param(0,ID_ACREDITADO.AsString);
         T.Param(1,ID_EMPRESA.AsString);
         T.Param(2,ID_TRAMITE.AsString);
         T.Param(3,CVE_TRAMITE.AsString);
      End;
      If T.Execute Then
         InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),
                                   T.DameCampo(2),T.DameCampo(3)]);
   Finally
      T.Free;
   End;
End;

Function TMRecTra.Reporte:Boolean;
Begin
   Result := False;
End;

Function TMRecTra.InternalPost : Boolean;
Var    stpInserta : TStoredProc;
       VLSalida     : Boolean;
       Msg          : String;
Begin
   InternalPost := False;
   VLSalida := False;
   If Modo=moEdit Then Begin
          Result:=Inherited InternalPost;
   End;
   If Modo=moAppEnd Then Begin
      stpInserta:=TStoredProc.Create(Nil);
      try
         Try
            stpInserta.DatabaseName:=DataBaseName;
            stpInserta.SessionName:=SessionName;
            stpInserta.Active:=False;
            stpInserta.Params.Clear;
            stpInserta.StoredProcName:='PKGCRDOCUMENTACION.STP_ALTATRAMITE';
            stpInserta.Params.CreateParam(ftFloat,'PE_ID_ACREDITADO',ptInput);
            stpInserta.Params.CreateParam(ftFloat,'PE_ID_EMPRESA',ptInput);
            stpInserta.Params.CreateParam(ftFloat,'PE_ID_TRAMITE',ptInput);
            stpInserta.Params.CreateParam(ftString,'PE_CVE_TRAMITE',ptInput);
            stpInserta.Params.CreateParam(ftFloat,'PE_ID_REFERENCIA',ptInput);
            stpInserta.Params.CreateParam(ftString,'PE_CVE_MEDIO',ptInput);
            stpInserta.Params.CreateParam(ftString,'PE_SIT_RECEP_TRAM',ptInput);
            stpInserta.Params.CreateParam(ftString,'PE_CVE_USU_ALTA',ptInput);
            stpInserta.Params.CreateParam(ftDateTime,'PE_F_ALTA',ptInput);
            stpInserta.Params.CreateParam(ftString,'PE_CVE_USU_MODIFICA',ptInput);
            stpInserta.Params.CreateParam(ftDateTime,'PE_F_MODIFICA',ptInput);
            stpInserta.Params.CreateParam(ftFloat,'PS_ID_TRAMITE',ptOutput);
            stpInserta.Params.CreateParam(ftFloat,'PS_RESULTADO',ptOutput);
            stpInserta.Params.CreateParam(ftString,'PS_TX_RESULTADO',ptOutput);

            stpInserta.ParamByName('PE_ID_ACREDITADO').AsFloat := ID_ACREDITADO.AsFloat;
            stpInserta.ParamByName('PE_ID_EMPRESA').AsFloat := ID_EMPRESA.AsFloat;
            stpInserta.ParamByName('PE_ID_TRAMITE').AsFloat := ID_TRAMITE.AsFloat;
            stpInserta.ParamByName('PE_CVE_TRAMITE').AsString := CVE_TRAMITE.AsString;
            stpInserta.ParamByName('PE_ID_REFERENCIA').AsFloat := ID_REFERENCIA.AsFloat;
            stpInserta.ParamByName('PE_CVE_MEDIO').AsString := CVE_MEDIO.AsString;
            stpInserta.ParamByName('PE_SIT_RECEP_TRAM').AsString := SIT_RECEP_TRAM.AsString;
            stpInserta.ParamByName('PE_CVE_USU_ALTA').AsString := CVE_USU_ALTA.AsString;

            If F_ALTA.AsDateTime <>0 Then
               stpInserta.ParamByName('PE_F_ALTA').AsDateTime := F_ALTA.AsDateTime
            Else
               stpInserta.ParamByName('PE_F_ALTA').Clear;

            stpInserta.ParamByName('PE_CVE_USU_MODIFICA').AsString := CVE_USU_MODIFICA.AsString;

            If F_MODIFICA.AsDateTime <> 0 Then
               stpInserta.ParamByName('PE_F_MODIFICA').AsDateTime := F_MODIFICA.AsDateTime
            Else
               stpInserta.ParamByName('PE_F_MODIFICA').Clear;
            stpInserta.ExecProc;

            If stpInserta.ParamByName('PS_RESULTADO').AsFloat = 0 Then Begin
               ID_TRAMITE.AsFloat := stpInserta.ParamByName('PS_ID_TRAMITE').AsFloat;
               VLSalida:= True;
               bContinuar:= True;
            End Else Begin
                ShowMessage('PROBLEMAS CON EL ALTA DE RECEPTACULO: ' +
                            IntToStr(stpInserta.ParamByName('PS_RESULTADO').AsInteger)+' : '+
                            stpInserta.ParamByName('PS_TX_RESULTADO').AsString);
                bContinuar:= False;
            End;
         Except
             bContinuar:= False;
             ShowMessage('Problemas con el Alta del Trámite. Avise Urgentemente a Sistemas');
         End;
      Finally
          If stpInserta <> Nil Then Begin
            stpInserta.UnPrepare;
            stpInserta.Free;
          End;
      End;
      AutoRefresh := False;
      InternalPost := VLSalida
   End;
End;
(***********************************************FORMA DO_RECEP_TRAM********************)
(*                                                                              *)
(*  FORMA DE DO_RECEP_TRAM                                                            *)
(*                                                                              *)
(***********************************************FORMA DO_RECEP_TRAM********************)

Procedure TWMRecTra.FormShow(SEnder: TObject);
Begin

   InterForma1.BtnModificar.Visible  := False;
   InterForma1.BtnEliminar.Visible   := False;
   Objeto.bContinuar:= False;

   lbDempresa.Caption := Objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := Objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := Objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := Objeto.ParamCre.PERFIL.AsString;

   With Objeto Do Begin
      ID_ACREDITADO.Control    := edACREDITADO;
      ID_EMPRESA.Control       := edID_EMPRESA;
      ID_TRAMITE.Control       := edID_TRAMITE;
      CVE_TRAMITE.Control      := edCVE_TRAMITE;
      ID_REFERENCIA.Control    := edID_REFERENCIA;
      CVE_MEDIO.Control        := edCVE_MEDIO;
      SIT_RECEP_TRAM.Control   := rgSIT_RECEP_TRA;
      CVE_USU_ALTA.Control     := edCVE_USUA_ALTA;
      CVE_USU_MODIFICA.Control := edCVE_USUA_MODIF;
      F_ALTA.Control           := edF_ALTA;
      F_MODIFICA.Control       := edF_MODIFICA;
      InterForma1.MsgPanel     := PnlMsg;

      Empresa.ID_Persona.Control :=edID_EMPRESA;
      Empresa.Nombre.Control :=edNOM_EMPRESA;
      Empresa.GetParams(Objeto);

      edNOM_EMPRESA.Hint := Empresa.Nombre.AsString;
      edNOM_EMPRESA.ShowHint := True;
      Empresa.GetParams(Objeto);

      Tramite.CVE_TRAMITE.Control := edCVE_TRAMITE;
      Tramite.DESC_C_TRAMITE.Control := edTRAMITE;
      Tramite.GetParams(Objeto);

      Acreditado.ID_ACREDITADO.Control := edACREDITADO;
      Acreditado.Persona.Nombre.Control := edNOMBRE_ACRED;
      Acreditado.GetParams(Objeto);
      edNOMBRE_ACRED.Hint := Acreditado.Persona.Nombre.AsString;
      edNOMBRE_ACRED.ShowHint := True;

      MDoMedio.CVE_MEDIO.Control := edCVE_MEDIO;
      MDoMedio.DESC_MEDIO.Control:= edNOM_CVE_MEDIO;
      MDoMedio.GetParams(Objeto);

      Doctos.GetParams(Objeto);

   End;

   If Objeto.iIdEmpresa <> 0 Then   Begin
      Objeto.BuscaWhereString := '( DO_RECEP_TRAM.ID_EMPRESA = ' + IntToStr(Objeto.iIdEmpresa) + ')';
      If Trim(Objeto.sCveMedio) <> '' Then Begin
         Objeto.BuscaWhereString := Objeto.BuscaWhereString + ' AND ( DO_RECEP_TRAM.CVE_MEDIO = ' + #39 + Objeto.sCveMedio + #39 + ')';
         If Objeto.iReferencia <> 0 Then Begin
            Objeto.BuscaWhereString := Objeto.BuscaWhereString + ' AND ( DO_RECEP_TRAM.ID_REFERENCIA = ' + IntToStr(Objeto.iReferencia) + ')';
            If Objeto.iIdAcreditado <> 0 Then Begin
               Objeto.BuscaWhereString := Objeto.BuscaWhereString + ' AND ( DO_RECEP_TRAM.ID_ACREDITADO = ' + IntToStr(Objeto.iIdAcreditado) + ')';
            End;
         End;
      End;
   End;
   Objeto.FilterString := Objeto.BuscaWhereString;
End;

Procedure TWMRecTra.FormDestroy(SEnder: TObject);
Begin
   With Objeto Do Begin
      ID_ACREDITADO.Control    := Nil;
      ID_EMPRESA.Control       := Nil;
      ID_TRAMITE.Control       := Nil;
      CVE_TRAMITE.Control      := Nil;
      ID_REFERENCIA.Control    := Nil;
      CVE_MEDIO.Control        := Nil;
      SIT_RECEP_TRAM.Control   := Nil;
      CVE_USU_ALTA.Control     := Nil;
      CVE_USU_MODIFICA.Control := Nil;
      F_ALTA.Control           := Nil;
      F_MODIFICA.Control       := Nil;
      InterForma1.MsgPanel     := Nil;

      Empresa.Nombre.Control :=Nil;
      Empresa.ID_Persona.Control :=Nil;
      Tramite.CVE_TRAMITE.Control := Nil;
      Tramite.DESC_C_TRAMITE.Control := Nil;      
      Acreditado.ID_ACREDITADO.Control := Nil;
      Acreditado.Persona.Nombre.Control := Nil;      
      MDoMedio.CVE_MEDIO.Control := Nil;
      MDoMedio.DESC_MEDIO.Control:= Nil;      
   End;
End;

Procedure TWMRecTra.FormClose(SEnder: TObject; Var Action: TCloseAction);
Begin Action := caFree;
End;

Procedure TWMRecTra.InterForma1AntesAceptar(SEnder: TObject;
  IsNewData: Boolean; Var Realizado: Boolean);
Begin
   edID_REFERENCIA.Tag:=18;
   With Objeto Do Begin
      If IsNewData Then Begin
         If MessageDlg('¿Desea almacenar los datos capturados?',
              mtConfirmation,[mbYes, mbNo], 0) = mrYes Then Begin
            CVE_USU_ALTA.AsString := DameUsuario;
            F_ALTA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
            Realizado := True;
         End else
            Realizado := False;
      End Else Begin
         If MessageDlg('¿Desea guardar los datos modificados?',
              mtConfirmation,[mbYes, mbNo], 0) = mrYes Then Begin
            CVE_USU_MODIFICA.AsString := DameUsuario;
            F_MODIFICA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
            Realizado := True;
         End Else
            Realizado := False;
      End
   End;
End;

Procedure TWMRecTra.InterForma1Buscar(SEnder: TObject);
Begin
   With Objeto Do Begin
      InternalBusca;
      Empresa.FindKey([ID_EMPRESA.AsString]);
      Acreditado.FindKey([ID_ACREDITADO.AsString]);
      Tramite.FindKey([ID_EMPRESA.AsString,CVE_TRAMITE.AsString]);
      MDoMedio.FindKey([CVE_MEDIO.AsString]);
      Controles;
      MuestraDatos;      
   End;
End;

Procedure TWMRecTra.edID_EMPRESAExit(SEnder: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.ID_EMPRESA.GetFromControl;
      If Objeto.ID_EMPRESA.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Indique el identificador de la empresa';
      End;
      InterForma1.ValidaExit(edID_EMPRESA,vlSalida,vlMsg,True);
   End;
End;

Procedure TWMRecTra.btEMPRESAClick(SEnder: TObject);
Begin
   Objeto.Empresa.ShowAll := True;
   If Objeto.Empresa.Busca Then Begin
      InterForma1.NextTab(edID_EMPRESA);
   End;
End;

Procedure TWMRecTra.ilEMPRESACapture(SEnder: TObject; Var Show: Boolean);
Begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
End;

Procedure TWMRecTra.ilEMPRESAEjecuta(SEnder: TObject);
Begin
   If Objeto.Empresa.FindKey([ilEMPRESA.Buffer]) Then Begin
      InterForma1.NextTab(edID_EMPRESA);
   End;
End;

Procedure TWMRecTra.InterForma1DespuesNuevo(SEnder: TObject);
Var
   iX,iY:Integer;
Begin
   Objeto.F_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   rgSIT_RECEP_TRA.ItemIndex:= 0;
   edID_EMPRESA.SetFocus;

   If Objeto.iIdEmpresa <> 0 Then Begin
      Objeto.Empresa.FindKey([Objeto.iIdEmpresa]);
      edACREDITADO.SetFocus;
      If Objeto.iIdAcreditado <> 0 Then Begin
         Objeto.Acreditado.FindKey([Objeto.iIdAcreditado]);
         edCVE_MEDIO.SetFocus;
         If Trim(Objeto.sCveMedio) <> '' Then Begin
            Objeto.MDoMedio.FindKey([Objeto.sCveMedio]);
            edID_REFERENCIA.SetFocus;
            If Objeto.iReferencia <> 0 Then Begin
               Objeto.ID_REFERENCIA.AsInteger:= Objeto.iReferencia;
               edCVE_TRAMITE.SetFocus;
            End;
         End;
      End;
   End;
   sgcDATA.Clear(''#30'>C');
End;

Procedure TWMRecTra.rgSIT_RECEP_TRAExit(SEnder: TObject);
Begin
   InterForma1.ValidaExit(rgSIT_RECEP_TRA,True,CNULL,True);
End;

Procedure TWMRecTra.InterForma1DespuesModificar(SEnder: TObject);
Begin
   Objeto.F_MODIFICA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
End;

Procedure TWMRecTra.edID_EMPRESAKeyPress(SEnder: TObject; Var Key: Char);
Begin
   If (Pos(Key,'0123456789'#8) = 0) Then Key := #0;
End;

Procedure TWMRecTra.edCVE_TRAMITEExit(SEnder: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
     vlsql     : String;
     vlCveTra  : String;
Begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.CVE_TRAMITE.GetFromControl;
      If Objeto.CVE_TRAMITE.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Indique la clave del Trámite';
      End;
      InterForma1.ValidaExit(edCVE_TRAMITE,vlSalida,vlMsg,True);
   End;
End;

Procedure TWMRecTra.btTRAMITEClick(SEnder: TObject);
Var
   sSQL : String;
Begin
   Objeto.ID_EMPRESA.GetFromControl;
   Objeto.CVE_MEDIO.GetFromControl;
   sSQL:= 'ID_EMPRESA ='+ Objeto.ID_EMPRESA.AsSQL;

   If Trim(Objeto.sCveProduct) <>'' Then Begin
      sSQL:= sSQL + ' AND CVE_TRAMITE IN (SELECT CVE_TRAMITE '+
                    '                       FROM DO_PROD_TRAM '+
                    '                      WHERE CVE_PRODUCTO_CRE ='''+ Trim(Objeto.sCveProduct) +''''+
                    '                        AND SIT_REL_PRO_TRA =''AC'')';
   End;

   sSQL:= sSQL +  ' AND CVE_MEDIO ='+ Objeto.CVE_MEDIO.AsSQL +
                  ' AND SIT_TRAMITE = ''AC''';

   Objeto.Tramite.BuscaWhereString := sSQL;
   Objeto.Tramite.FilterString := Objeto.Tramite.BuscaWhereString;
   Objeto.Tramite.ShowAll := True;   
   If Objeto.Tramite.Busca Then Begin
      InterForma1.NextTab(edCVE_TRAMITE);
   End;
   MuestraDatos;   
End;

Procedure TWMRecTra.edID_REFERENCIAExit(SEnder: TObject);
Begin
   InterForma1.ValidaExit(edID_REFERENCIA,True,CNULL,True);
End;

Procedure TWMRecTra.edCVE_MEDIOExit(SEnder: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppEnd)) Then
   Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.CVE_MEDIO.GetFromControl;
      If Objeto.CVE_MEDIO.AsString = CNULL Then
      Begin
         vlSalida   := False;
         vlMsg := 'Indique la Clave del Medio por el cual fue invocado';
      End;
      InterForma1.ValidaExit(edCVE_MEDIO,vlSalida,vlMsg,True);
   End;
End;

Procedure TWMRecTra.edID_REFERENCIAKeyPress(SEnder: TObject;
  Var Key: Char);
Begin
   If (Pos(Key,'0123456789'#8) = 0) Then Key := #0;
End;

Procedure TWMRecTra.ilTramiteCapture(SEnder: TObject; Var Show: Boolean);
Begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
End;

Procedure TWMRecTra.ilTramiteEjecuta(SEnder: TObject);
Begin
   If Objeto.Tramite.FindKey([Objeto.ID_EMPRESA.AsInteger,ilTramite.Buffer]) Then Begin
      MuestraDatos;
      InterForma1.NextTab(edCVE_TRAMITE);
   End;
End;


Procedure TWMRecTra.InterForma1DespuesAceptar(SEnder: TObject);
Begin
   MuestraDatos;
End;

Procedure TWMRecTra.edACREDITADOExit(SEnder: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.ID_ACREDITADO.GetFromControl;

      If Objeto.ID_ACREDITADO.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Indique el identificador del Acreditado';
      End;
      InterForma1.ValidaExit(edACREDITADO,vlSalida,vlMsg,True);
   End;
End;

Procedure TWMRecTra.btACREDITADOClick(SEnder: TObject);
Begin
   Objeto.Acreditado.ShowAll := True;
   If Objeto.Acreditado.Busca Then Begin
        InterForma1.NextTab(edACREDITADO);
   End;
End;

Procedure TWMRecTra.ilACREDITADOCapture(SEnder: TObject;
  Var Show: Boolean);
Begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
End;

Procedure TWMRecTra.ilACREDITADOEjecuta(SEnder: TObject);
Begin
   If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
      InterForma1.NextTab(edACREDITADO);
   End;
End;

procedure TWMRecTra.btAutorizarClick(Sender: TObject);
Var
   stpAutoriza : TStoredProc;
Begin
   //If ValidaPerfilUsuario then Begin
      If Objeto.Active Then Begin
        If MessageDlg('¿Está seguro de Activar el Trámite?',
          mtConfirmation,[mbYes, mbNo], 0) = mrYes then Begin
            stpAutoriza:=TStoredProc.Create(Nil);
            try
               Try
                  stpAutoriza.DatabaseName:= Objeto.DataBaseName;
                  stpAutoriza.SessionName:= Objeto.SessionName;
                  stpAutoriza.Active:=False;
                  stpAutoriza.Params.Clear;
                  stpAutoriza.StoredProcName:='PKGCRDOCUMENTACION.STP_AUTORIZA_TRAM';
                  stpAutoriza.Params.CreateParam(ftFloat,'PE_ID_ACREDITADO',ptInput);
                  stpAutoriza.Params.CreateParam(ftFloat,'PE_ID_EMPRESA',ptInput);
                  stpAutoriza.Params.CreateParam(ftFloat,'PE_ID_TRAMITE',ptInput);
                  stpAutoriza.Params.CreateParam(ftString,'PE_CVE_TRAMITE',ptInput);
                  stpAutoriza.Params.CreateParam(ftFloat,'PS_RESULTADO',ptOutput);
                  stpAutoriza.Params.CreateParam(ftString,'PS_TX_RESULTADO',ptOutput);

                  stpAutoriza.ParamByName('PE_ID_ACREDITADO').AsFloat := Objeto.ID_ACREDITADO.AsFloat;
                  stpAutoriza.ParamByName('PE_ID_EMPRESA').AsFloat := Objeto.ID_EMPRESA.AsFloat;
                  stpAutoriza.ParamByName('PE_ID_TRAMITE').AsFloat := Objeto.ID_TRAMITE.AsFloat;
                  stpAutoriza.ParamByName('PE_CVE_TRAMITE').AsString := Objeto.CVE_TRAMITE.AsString;
                  stpAutoriza.ExecProc;

                  If stpAutoriza.ParamByName('PS_RESULTADO').AsFloat <> 0 Then Begin
                     ShowMessage('PROBLEMAS EN LA AUTORIZACIÓN : ' +
                                  IntToStr(stpAutoriza.ParamByName('PS_RESULTADO').AsInteger)+' : '+
                                  stpAutoriza.ParamByName('PS_TX_RESULTADO').AsString);
                  End Else Begin
                     Objeto.FindKey([Objeto.ID_ACREDITADO.AsInteger,
                                     Objeto.ID_EMPRESA.AsInteger,
                                     Objeto.ID_TRAMITE.AsInteger,
                                     Objeto.CVE_TRAMITE.AsString]);
                     Controles;
                  End;
               Except
                  ShowMessage('Problemas con la Autorización del Trámite. Avise Urgentemente a Sistemas');
               End;
            Finally
               If stpAutoriza <> Nil Then Begin
                  stpAutoriza.UnPrepare;
                  stpAutoriza.Free;
               End;
            End;
         End;
      End;
// End;
end;

procedure TWMRecTra.btCancelarClick(Sender: TObject);
Var
   stpCancelar : TStoredProc;
Begin
   If Objeto.Active Then Begin
     If MessageDlg('¿Está seguro de Cancelar el Trámite?',
          mtConfirmation,[mbYes, mbNo], 0) = mrYes then Begin
         stpCancelar:=TStoredProc.Create(Nil);
         try
            Try
               stpCancelar.DatabaseName:= Objeto.DataBaseName;
               stpCancelar.SessionName:= Objeto.SessionName;
               stpCancelar.Active:=False;
               stpCancelar.Params.Clear;
               stpCancelar.StoredProcName:='PKGCRDOCUMENTACION.STP_CANCELA_TRAM';
               stpCancelar.Params.CreateParam(ftFloat,'PE_ID_ACREDITADO',ptInput);
               stpCancelar.Params.CreateParam(ftFloat,'PE_ID_EMPRESA',ptInput);
               stpCancelar.Params.CreateParam(ftFloat,'PE_ID_TRAMITE',ptInput);
               stpCancelar.Params.CreateParam(ftString,'PE_CVE_TRAMITE',ptInput);
               stpCancelar.Params.CreateParam(ftFloat,'PS_RESULTADO',ptOutput);
               stpCancelar.Params.CreateParam(ftString,'PS_TX_RESULTADO',ptOutput);

               stpCancelar.ParamByName('PE_ID_ACREDITADO').AsFloat := Objeto.ID_ACREDITADO.AsFloat;
               stpCancelar.ParamByName('PE_ID_EMPRESA').AsFloat := Objeto.ID_EMPRESA.AsFloat;
               stpCancelar.ParamByName('PE_ID_TRAMITE').AsFloat := Objeto.ID_TRAMITE.AsFloat;
               stpCancelar.ParamByName('PE_CVE_TRAMITE').AsString := Objeto.CVE_TRAMITE.AsString;
               stpCancelar.ExecProc;

               If stpCancelar.ParamByName('PS_RESULTADO').AsFloat <> 0 Then Begin
                  ShowMessage('PROBLEMAS AL CANCELAR : ' +
                              IntToStr(stpCancelar.ParamByName('PS_RESULTADO').AsInteger)+' : '+
                              stpCancelar.ParamByName('PS_TX_RESULTADO').AsString);
               End Else Begin
                  Objeto.FindKey([Objeto.ID_ACREDITADO.AsInteger,
                                  Objeto.ID_EMPRESA.AsInteger,
                                  Objeto.ID_TRAMITE.AsInteger,
                                  Objeto.CVE_TRAMITE.AsString]);
                  Controles;
               End;
            Except
               ShowMessage('Problemas con la Cancelación del Trámite. Avise Urgentemente a Sistemas');
            End;
         Finally
            If stpCancelar <> Nil Then Begin
               stpCancelar.UnPrepare;
               stpCancelar.Free;
            End;
         End;
      End;
   End;
end;

Procedure TWMRecTra.Controles;
Begin
   If Objeto.SIT_RECEP_TRAM.AsString ='AU' Then Begin
      btAutorizar.Tag:=0;
      btAutorizar.Enabled:=False;
      btCancelar.Tag:=17;
      btCancelar.Enabled:=True;
   End;
   If Objeto.SIT_RECEP_TRAM.AsString ='CA' Then Begin
      btAutorizar.Tag:=0;
      btAutorizar.Enabled:=False;
      btCancelar.Tag:=0;
      btCancelar.Enabled:=False;
   End;
   If Objeto.SIT_RECEP_TRAM.AsString ='AC' Then Begin
      btAutorizar.Tag:=17;
      btAutorizar.Enabled:=True;
      btCancelar.Tag:=17;
      btCancelar.Enabled:=True;
   End;

End;
function TWMRecTra.ValidaPerfilUsuario: Boolean;
Var
   vlResultado     : Boolean;
   stpValidaPerfil : TStoredProc;
   sSQL:String;
   qyQuery:TQuery;
begin
   vlResultado := True;
   sSQL:= ' SELECT CVE_DOCUMENTO FROM DO_REL_TRAM_DOC '+
          '  WHERE ID_EMPRESA ='+ Objeto.ID_EMPRESA.AsSQL +
          '    AND CVE_TRAMITE ='+ Objeto.CVE_TRAMITE.AsSQL;
   qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);

   If qyQuery <> Nil Then Begin
      While not qyQuery.Eof Do Begin
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
               ParamByName('PE_CVE_USUAR').AsString     := Objeto.Apli.Usuario;
               ParamByName('PE_CVE_APLI').AsString      := Objeto.Apli.Apli;
               ParamByName('PE_ID_EMPRESA').AsInteger   := Objeto.ID_EMPRESA.AsInteger;
               ParamByName('PE_CVE_IND_ADIC').AsString  := Objeto.Apli.Indicador;
               ParamByName('PE_CVE_TRAMITE').AsString   := Objeto.CVE_TRAMITE.AsString;
               ParamByName('PE_CVE_DOCUMENTO').AsString := qyQuery.FieldByName('CVE_DOCUMENTO').AsString;
               ParamByName('PE_PERMISO').AsString       := 'AUT';
               ExecProc;

               if ParamByName('PS_RESULTADO').AsInteger <> 0 then begin
                  vlResultado := False;
                  MessageDlg('PROBLEMAS AL VALIDAR USUARIO : '+
                              ParamByName('PS_RESULTADO').AsString + ': ' +
                              ParamByName('PS_TXRESULTADO').AsString ,
                              mtInformation, [mbOK], 0  );
               end;
               UnPrepare;
            end;
         finally
            stpValidaPerfil.Free;
         end;
         qyQuery.Next;
      End;
      qyQuery.Free;
   End;
   ValidaPerfilUsuario := vlResultado;
end;

procedure TWMRecTra.InterForma1DespuesCancelar(Sender: TObject);
begin
   edID_REFERENCIA.Tag:=18;
   InterForma1.InitShow;
   MuestraDatos;
end;

procedure TWMRecTra.InterForma1AntesNuevo(Sender: TObject;
  var Realizado: Boolean);
begin
   If Objeto.iReferencia <> 0 Then Begin
      edID_REFERENCIA.Tag:=17;
   End Else Begin
      edID_REFERENCIA.Tag:=18;
   End;
end;

procedure TWMRecTra.btCVE_MEDIOClick(Sender: TObject);
begin
   Objeto.MDoMedio.ShowAll := True;
   If Objeto.MDoMedio.Busca Then Begin
        InterForma1.NextTab(edCVE_MEDIO);
   End;
end;

procedure TWMRecTra.ilCVE_MEDIOCapture(Sender: TObject; var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit) and (InterForma1.IsNewData);
end;

procedure TWMRecTra.ilCVE_MEDIOEjecuta(Sender: TObject);
begin
   If Objeto.MDoMedio.FindKey([ilCVE_MEDIO.Buffer]) Then Begin
      InterForma1.NextTab(edCVE_MEDIO);
   End;
end;


Function TWMRecTra.CadenaSql : String;
Var
   vlsql, vlsql1 : String;
Begin
   vlSql:='';
   If Objeto.ID_ACREDITADO.AsInteger <> 0 Then Begin
      vlsql := 'SELECT  DO_RECEP_DOC.B_VISTO_BUENO, DO_RECEP_DOC.F_VISTO_BUENO,'+
               '        DECODE(NVL(DO_CLIENTE_DOC.ID_DOCUMENTO,0),0, '+
               '        DECODE(NVL(DO_RECEP_EXC.ID_EXCEPCION,0),0, '+
               '        DECODE(NVL(DO_RECEP_DOC.ID_RECEP_DOC,0),0, '+
               '        ''NO'',''VO''),''EX''),''EN'')ENTREGADO, '+
               '        DO_CLIENTE_DOC.ID_DOCUMENTO, '+
               '        DO_CLIENTE_DOC.FOL_DOCUMENTO, '+
               '        DO_RECEP_EXC.ID_EXCEPCION, '+
               '        DECODE(DO_RECEP_EXC.SIT_RECEP_EXC,''AC'',''Activo'',''SO'',''Solventado'')SIT_RECEP_EXC, '+
               '        DO_RECEP_DOC.ID_RECEP_DOC, '+
               '        DECODE(DO_RECEP_DOC.SIT_RECEP_DOC,''AC'',''Activo'',''AU'',''Autorizado'',''CA'',''Cancelado'',''PE'',''Pendiente'','' '')SIT_RECEP_DOC, '+
               '        TABLA.*, '+
               '        DECODE(DO_CLIENTE_DOC.SIT_DOCUMENTO,''AC'',''Activo'',''RN'',''Renovado'',''VE'',''Vencido'',''DV'',''Devuelto'','' '')SIT_DOCUMENTO, '+
               '        '' ''FOLIO,        '' ''VOBO,        '' ''EXCEP '+
               ' FROM  ( '+
               '       (SELECT  DO_REL_TRAM_DOC.CVE_DOCUMENTO, '+
               '                DO_DOCUMENTO.DESC_DOCUMENTO, '+
               '                DECODE(DO_REL_TRAM_DOC.CVE_TIP_DOC,''BA'',''Básica'',''CO'',''Complementaria'','' '')CVE_TIP_DOC, '+
               '                DECODE(DO_REL_TRAM_DOC.B_REQ_ORIGINAL,''V'',''SI'',''F'',''NO'','' '')B_REQ_ORIGINAL, '+
               '                DECODE(DO_REL_TRAM_DOC.B_OBLIGATORIO,''V'',''SI'',''F'',''NO'','' '')B_OBLIGATORIO, '+
               '                DO_REL_TRAM_DOC.ID_EMPRESA, '+
               '                DO_REL_TRAM_DOC.CVE_TRAMITE, '+
               '                DECODE(DO_REL_TRAM_DOC.B_EXCEPTUAR,''V'',''SI'',''F'',''NO'','' '')B_EXCEPTUAR, '+
               '                DO_RECEP_TRAM.ID_ACREDITADO, '+
               '                DO_RECEP_TRAM.ID_TRAMITE, '+
               '                DO_DOCUMENTO.DIAS_AVI_EXPIRA, '+
               '                DECODE(DO_DOCUMENTO.B_RENUEVA,''V'',''SI'',''F'',''NO'','' '')B_RENUEVA, '+
               '                DO_RECEP_TRAM.SIT_RECEP_TRAM '+
               '          FROM  DO_REL_TRAM_DOC,  DO_RECEP_TRAM, DO_DOCUMENTO '+
               '         WHERE  DO_REL_TRAM_DOC.ID_EMPRESA ='+ Objeto.ID_EMPRESA.AsSQL +
               '           AND  DO_RECEP_TRAM.ID_TRAMITE ='+ Objeto.ID_TRAMITE.AsSQL +
               '           AND  DO_RECEP_TRAM.CVE_TRAMITE ='+ Objeto.CVE_TRAMITE.AsSQL +
               '           AND  DO_RECEP_TRAM.ID_ACREDITADO ='+ Objeto.ID_ACREDITADO.AsSQL +
               '           AND  DO_REL_TRAM_DOC.ID_EMPRESA = DO_RECEP_TRAM.ID_EMPRESA '+
               '           AND  DO_REL_TRAM_DOC.CVE_TRAMITE = DO_RECEP_TRAM.CVE_TRAMITE '+
               '           AND  DO_REL_TRAM_DOC.ID_EMPRESA = DO_DOCUMENTO.ID_EMPRESA '+
               '           AND  DO_REL_TRAM_DOC.CVE_DOCUMENTO = DO_DOCUMENTO.CVE_DOCUMENTO '+
               '           AND  DO_REL_TRAM_DOC.SIT_REL_TRAM_DO = ''AC'' ) ';
      vlsql1:= 'UNION ALL '+
               '       (SELECT  DO_RECEP_DOC.CVE_DOCUMENTO, '+
               '                DO_DOCUMENTO.DESC_DOCUMENTO, '+
               '                ''Complementaria'' CVE_TIP_DOC, '+
               '                ''NO'' B_REQ_ORIGINAL, '+
               '                ''NO'' B_OBLIGATORIO, '+
               '                DO_RECEP_DOC.ID_EMPRESA, '+
               '                DO_RECEP_TRAM.CVE_TRAMITE, '+
               '                ''SI'' B_EXCEPTUAR, '+
               '                DO_RECEP_TRAM.ID_ACREDITADO, '+
               '                DO_RECEP_DOC.ID_TRAMITE, '+
               '                0 DIAS_AVI_EXPIRA, '+
               '                ''SI'' B_RENUEVA, '+
               '                DO_RECEP_TRAM.SIT_RECEP_TRAM '+
               '          FROM DO_RECEP_DOC, DO_DOCUMENTO, DO_RECEP_TRAM '+
               '         WHERE DO_RECEP_DOC.ID_EMPRESA ='+ Objeto.ID_EMPRESA.AsSQL +
               '           AND DO_RECEP_DOC.ID_TRAMITE = '+ Objeto.ID_TRAMITE.AsSQL +
               '           AND DO_RECEP_DOC.CVE_DOCUMENTO NOT IN (SELECT CVE_DOCUMENTO '+
               '                                       FROM DO_REL_TRAM_DOC '+
               '                                      WHERE ID_EMPRESA ='+ Objeto.ID_EMPRESA.AsSQL +
               '                                        AND CVE_TRAMITE ='+ Objeto.CVE_TRAMITE.AsSQL +
               '                                        AND SIT_REL_TRAM_DO =''AC'') '+
               '           AND SIT_RECEP_DOC = ''AC'' '+
               '           AND DO_RECEP_DOC.ID_EMPRESA = DO_DOCUMENTO.ID_EMPRESA '+
               '           AND DO_RECEP_DOC.CVE_DOCUMENTO = DO_DOCUMENTO.CVE_DOCUMENTO '+
               '           AND DO_RECEP_DOC.ID_EMPRESA = DO_RECEP_TRAM.ID_EMPRESA '+
               '           AND DO_RECEP_DOC.ID_TRAMITE = DO_RECEP_TRAM.ID_TRAMITE '+
               '           AND DO_RECEP_TRAM.CVE_TRAMITE ='+ Objeto.CVE_TRAMITE.AsSQL +
               '           AND DO_RECEP_TRAM.ID_ACREDITADO = '+ Objeto.ID_ACREDITADO.AsSQL+') '+
               '       )TABLA, '+
               '       DO_CLIENTE_DOC, DO_RECEP_EXC , DO_RECEP_DOC '+
               ' WHERE  TABLA.ID_ACREDITADO = DO_CLIENTE_DOC.ID_ACREDITADO(+) '+
               '   AND  TABLA.CVE_DOCUMENTO = DO_CLIENTE_DOC.CVE_DOCUMENTO(+) '+
               '   AND  DO_CLIENTE_DOC.SIT_DOCUMENTO (+)= ''AC'' '+
               '   AND  TABLA.ID_EMPRESA = DO_RECEP_EXC.ID_EMPRESA(+) '+
               '   AND  TABLA.ID_TRAMITE = DO_RECEP_EXC.ID_TRAMITE(+) '+
               '   AND  TABLA.CVE_DOCUMENTO = DO_RECEP_EXC.CVE_DOCUMENTO(+) '+
               '   AND  TABLA.ID_EMPRESA = DO_RECEP_DOC.ID_EMPRESA(+) '+
               '   AND  TABLA.ID_TRAMITE = DO_RECEP_DOC.ID_TRAMITE(+) '+
               '   AND  TABLA.CVE_DOCUMENTO = DO_RECEP_DOC.CVE_DOCUMENTO(+) ';

   End;
   CadenaSql := vlSql + vlsql1;
End;

Procedure TWMRecTra.MuestraDatos;
Var
   vlQry : TQuery;
   sSQL :String;
   i:Integer;
Begin
   If Objeto.ID_TRAMITE.AsInteger <>0 Then Begin
      sSQL:= CadenaSql;
      If Trim(sSQL) <> '' Then Begin
         vlQry := GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
         Try
            if vlQry <> nil Then Begin
               vlQry.FieldByName('B_VISTO_BUENO').Visible  := False;
               vlQry.FieldByName('F_VISTO_BUENO').Visible  := False;
               vlQry.FieldByName('ENTREGADO').Visible  := False;
               vlQry.FieldByName('ID_DOCUMENTO').Visible  := False;
               vlQry.FieldByName('FOL_DOCUMENTO').Visible  := False;
               vlQry.FieldByName('ID_EXCEPCION').Visible  := False;
               vlQry.FieldByName('SIT_RECEP_EXC').Visible  := False;
               vlQry.FieldByName('ID_RECEP_DOC').Visible  := False;
               vlQry.FieldByName('SIT_RECEP_DOC').Visible  := False;
               vlQry.FieldByName('CVE_DOCUMENTO').DisplayLabel  := 'CLAVE' + #30 +'>C';
               vlQry.FieldByName('DESC_DOCUMENTO').DisplayLabel := 'DOCUMENTO' + #30 +'>C';
               vlQry.FieldByName('CVE_TIP_DOC').DisplayLabel  := 'TIPODOC' + #30 +'>C';
               vlQry.FieldByName('B_REQ_ORIGINAL').DisplayLabel:= 'ORIGINAL' + #30 +'>C';
               vlQry.FieldByName('B_OBLIGATORIO').DisplayLabel:= 'OBLIGATORIO' + #30 +'>C';
               vlQry.FieldByName('ID_EMPRESA').Visible  := False;
               vlQry.FieldByName('CVE_TRAMITE').Visible  := False;
               vlQry.FieldByName('B_EXCEPTUAR').Visible  := False;
               vlQry.FieldByName('ID_ACREDITADO').Visible  := False;
               vlQry.FieldByName('ID_TRAMITE').Visible  := False;
               vlQry.FieldByName('DIAS_AVI_EXPIRA').Visible  := False;
               vlQry.FieldByName('B_RENUEVA').Visible  := False;
               vlQry.FieldByName('SIT_RECEP_TRAM').Visible  := False;
               vlQry.FieldByName('SIT_DOCUMENTO').DisplayLabel  := 'SITUACION' + #30 +'>C';
               vlQry.FieldByName('FOLIO').Visible  := False;
               vlQry.FieldByName('VOBO').DisplayLabel := 'VOBO' + #30 +'>C';
               vlQry.FieldByName('EXCEP').DisplayLabel := 'EXCEP' + #30 +'>C';

               vlQry.FieldByName('CVE_DOCUMENTO').DisplayWidth  := 9;
               vlQry.FieldByName('DESC_DOCUMENTO').DisplayWidth := 50;
               vlQry.FieldByName('CVE_TIP_DOC').DisplayWidth  := 11;
               vlQry.FieldByName('B_REQ_ORIGINAL').DisplayWidth:= 7;
               vlQry.FieldByName('B_OBLIGATORIO').DisplayWidth:= 9;
               vlQry.FieldByName('SIT_DOCUMENTO').DisplayWidth  := 9;
               vlQry.FieldByName('VOBO').DisplayWidth := 5;
               vlQry.FieldByName('EXCEP').DisplayWidth := 5;

               sgcDATA.AddQry( vlQry, True,True,-1,-1,-1,False);
               sgcDATA.ColumnByName('VOBO').IsCheck := True;
               sgcDATA.ColumnByName('EXCEP').IsCheck := True;
            End Else Begin
              sgcDATA.Clear('NO SE ENCONTRARON DATOS'#30'>C');
            End;
         finally
            if vlQry <> nil Then
               vlQry.free;
         End;
      End;

      For i:=0 To sgcDATA.SG.RowCount Do Begin
         If Trim(sgcDATA.CellStr['ID_EXCEPCION',i]) <> '' Then
            sgcDATA.CellStr['EXCEP',i] := 'SI' + #30 + '>C'
         Else
            sgcDATA.CellStr['EXCEP',i] := '';
      End;

      For i:=0 To sgcDATA.SG.RowCount Do Begin
         If (Trim(sgcDATA.CellStr['ID_RECEP_DOC',i]) <> '')And
            (Trim(sgcDATA.CellStr['B_VISTO_BUENO',i]) ='V')
         Then
            sgcDATA.CellStr['VOBO',i] := 'SI' + #30 + '>C'
         Else
            sgcDATA.CellStr['VOBO',i] := '';
      End;
   End;
End;

Procedure TWMRecTra.Documentos;
Var
   MCteDoc  : TMCteDoc;
   MExpAcreD: TMExpAcreD;
   sSQL: String;
Begin
   If (Trim(sgcDATA.CellStr['ID_DOCUMENTO',sgcDATA.SG.Row])='') Then Begin
      If Objeto.ID_ACREDITADO.AsInteger <> 0 Then Begin
         MCteDoc:=TMCteDoc.create(Nil);
         Try
            MCteDoc.Apli:= Objeto.Apli;
            MCteDoc.ParamCre:= Objeto.ParamCre;
            MCteDoc.Acreditado:= Objeto.Acreditado;
            MCteDoc.Doctos:= Objeto.Doctos;
            MCteDoc.Nuevo;
            If Trim(sgcDATA.CellStr['ID_EXCEPCION',sgcDATA.SG.Row])<>'' Then Begin
               sSQL:= 'UPDATE DO_RECEP_EXC '+
                      '   SET SIT_RECEP_EXC = ''SO'' '+
                      ' WHERE ID_EMPRESA ='+ Objeto.ID_EMPRESA.AsString +
                      '   AND ID_TRAMITE ='+ Objeto.ID_TRAMITE.AsString +
                      '   AND ID_EXCEPCION ='+ Trim(sgcDATA.CellStr['ID_EXCEPCION',sgcDATA.SG.Row])+
                      '   AND CVE_DOCUMENTO ='''+ Objeto.CVE_DOCUMENTO.AsString +'''';
               RunSQL(sSQL,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName, False);
            End;
         Finally
            MCteDoc.Free;
         End;
      End;
   End Else Begin
      If Objeto.ID_ACREDITADO.AsInteger <> 0 Then Begin
         MCteDoc:=TMCteDoc.create(Nil);
         Try
            MCteDoc.Apli:= Objeto.Apli;
            MCteDoc.ParamCre:= Objeto.ParamCre;
            MCteDoc.Acreditado:= Objeto.Acreditado;
            MCteDoc.Doctos:= Objeto.Doctos;
            MCteDoc.FindKey([Objeto.ID_ACREDITADO.AsString,
                             sgcDATA.CellStr['ID_DOCUMENTO',sgcDATA.SG.Row],
                             sgcDATA.CellStr['CVE_DOCUMENTO',sgcDATA.SG.Row]]);
            MCteDoc.Catalogo;
         Finally
            MCteDoc.Free;
         End;
      End;
   End;
   MuestraDatos;
End;

procedure TWMRecTra.RegistrarDatosdeDocumento1Click(Sender: TObject);
begin
   If (Objeto.SIT_RECEP_TRAM.AsString = 'AC')Or
      (Objeto.SIT_RECEP_TRAM.AsString = 'PE') Then Begin
     Documentos;
     MuestraDatos;
   End;
end;

procedure TWMRecTra.sgcDATACalcRow(Sendet: TObject; DataSet: TDataSet;
  CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
Begin
   sgcDATA.SetFontColor(clRed);
   If DataSet.FieldByName('ID_EXCEPCION').AsString <> '' Then
      sgcDATA.SetFontColor(clGreen);
   If DataSet.FieldByName('ID_DOCUMENTO').AsString <> '' Then
      sgcDATA.SetFontColor(clBlack);
end;

procedure TWMRecTra.sgcDATADblClick(Sender: TObject);
Begin
   If (Objeto.SIT_RECEP_TRAM.AsString = 'AC')Or
      (Objeto.SIT_RECEP_TRAM.AsString = 'PE') Then Begin
      If sgcDATA.SG.Selection.Left = 27 Then Begin
         BitacoraDoctos;
      End Else If sgcDATA.SG.Selection.Left = 28 Then Begin
         Exceptuar;
      End;
   End Else Begin
      ShowMessage('La situación del trámite no permite recibir o exceptuar documentos');
   End;
End;

Procedure TWMRecTra.Exceptuar;
Var
   RecExc : TMRecExc;
Begin
   If (UpperCase(sgcDATA.CellStr['B_EXCEPTUAR',sgcDATA.SG.Row])='SI') Then Begin
      If (Trim(sgcDATA.CellStr['ID_EXCEPCION',sgcDATA.SG.Row])='') Then Begin
         If(Trim(sgcDATA.CellStr['ID_RECEP_DOC',sgcDATA.SG.Row]) = '')Then Begin
            If (Trim(sgcDATA.CellStr['SIT_RECEP_TRAM',sgcDATA.SG.Row])<>'AU')And
               (Trim(sgcDATA.CellStr['SIT_RECEP_TRAM',sgcDATA.SG.Row])<>'CA') Then Begin
               RecExc:=TMRecExc.create(Nil);
               Try
                  RecExc.Apli:= Objeto.Apli;
                  RecExc.ParamCre:= Objeto.ParamCre;
                  RecExc.Empresa:= Objeto.Empresa;
                  RecExc.Doctos:= Objeto.Doctos;
                  RecExc.RecTra:= Objeto;
                  RecExc.Nuevo;
               Finally
                  RecExc.Free;
               End;
            End Else Begin
               ShowMessage('La situación del trámite no permite exceptuar documentos');
            End;
         End Else Begin
             ShowMessage('El documento ya se recibió');
         End;
      End Else Begin
         RecExc:=TMRecExc.create(Nil);
         Try
            RecExc.Apli:= Objeto.Apli;
            RecExc.ParamCre:= Objeto.ParamCre;
            RecExc.FindKey([Objeto.ID_EMPRESA.AsInteger,
                            Objeto.ID_TRAMITE.AsString,
                            sgcDATA.CellStr['ID_EXCEPCION',sgcDATA.SG.Row],
                            sgcDATA.CellStr['CVE_DOCUMENTO',sgcDATA.SG.Row]]);
            RecExc.Catalogo;
         Finally
            RecExc.Free;
         End;
      End;
      MuestraDatos;
    End Else Begin
       ShowMessage('El Documento '''+ sgcDATA.CellStr['DESC_DOCUMENTO',sgcDATA.SG.Row]+
                   ''' no puede ser Exceptuado');
    End;
End;
Procedure TWMRecTra.BitacoraDoctos;
var    stpInserta : TStoredProc;
       sSQL: String;
Begin
   If (Trim(sgcDATA.CellStr['ID_RECEP_DOC',sgcDATA.SG.Row]) ='')Then Begin
      If  sgcDATA.CellStr['VOBO',25] = '' Then Begin
         stpInserta:=TStoredProc.Create(Nil);
         try
            Try
               stpInserta.DatabaseName:=Objeto.DataBaseName;
               stpInserta.SessionName:=Objeto.SessionName;
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


               stpInserta.ParamByName('PE_ID_EMPRESA').AsFloat := Objeto.ID_EMPRESA.AsFloat;
               stpInserta.ParamByName('PE_ID_TRAMITE').AsFloat := Objeto.ID_TRAMITE.AsFloat;
               stpInserta.ParamByName('PE_ID_RECEP_DOC').AsFloat := 0;
               stpInserta.ParamByName('PE_CVE_DOCUMENTO').AsString := Objeto.CVE_DOCUMENTO.AsString;
               stpInserta.ParamByName('PE_NUM_EXPEDIENTE').AsFloat := 0;
               stpInserta.ParamByName('PE_B_ORIGIN_ENTREG').AsString := 'F';
               stpInserta.ParamByName('PE_B_COPIAS_ENTREG').AsString := 'F';
               stpInserta.ParamByName('PE_SIT_RECEP_DOC').AsString := 'AC';
               stpInserta.ParamByName('PE_TXT_OBSERVACION').AsString := 'Recibido';
               stpInserta.ParamByName('PE_CVE_USU_ALTA').AsString := Objeto.Apli.Usuario;
               stpInserta.ParamByName('PE_F_ALTA').AsDateTime := Objeto.Apli.DameFechaEmpresa;
               stpInserta.ParamByName('PE_B_VISTO_BUENO').AsString := 'V';
               stpInserta.ParamByName('PE_F_VISTO_BUENO').AsDateTime := Objeto.Apli.DameFechaEmpresa;
               stpInserta.ParamByName('PE_CVE_USU_VOBO').AsString := Objeto.Apli.Usuario;
               stpInserta.ExecProc;

               If stpInserta.ParamByName('PS_RESULTADO').AsFloat <> 0 Then Begin
                  ShowMessage('ERROR EN ALTA DE RECEPTACULO: ' + IntToStr(stpInserta.ParamByName('PS_RESULTADO').AsInteger)+
                              stpInserta.ParamByName('PS_TX_RESULTADO').AsString);
               End Else Begin
                  If Trim(sgcDATA.CellStr['ID_EXCEPCION',sgcDATA.SG.Row])<>'' Then Begin
                     sSQL:= 'UPDATE DO_RECEP_EXC '+
                            '   SET SIT_RECEP_EXC = ''SO'' '+
                            ' WHERE ID_EMPRESA ='+ Objeto.ID_EMPRESA.AsString +
                            '   AND ID_TRAMITE ='+ Objeto.ID_TRAMITE.AsString +
                            '   AND ID_EXCEPCION ='+ Trim(sgcDATA.CellStr['ID_EXCEPCION',sgcDATA.SG.Row])+
                            '   AND CVE_DOCUMENTO ='''+ Objeto.CVE_DOCUMENTO.AsString +'''';
                     RunSQL(sSQL,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName, False);
                  End;
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
         MuestraDatos;
      End;
   End Else Begin
      If Trim(sgcDATA.CellStr['B_VISTO_BUENO',sgcDATA.SG.Row]) ='F' Then Begin
         sSQL:= 'UPDATE DO_RECEP_DOC '+
                '   SET B_VISTO_BUENO = ''V'', '+
                '       F_VISTO_BUENO = TO_DATE('''+ FormatDateTime('dd/mm/yyyy',Objeto.Apli.DameFechaEmpresaDia('D000')) +''',''DD/MM/YYYY'') '+
                ' WHERE ID_EMPRESA ='+ Trim(sgcDATA.CellStr['ID_EMPRESA',sgcDATA.SG.Row])+
                '   AND ID_TRAMITE ='+ Trim(sgcDATA.CellStr['ID_TRAMITE',sgcDATA.SG.Row])+
                '   AND ID_RECEP_DOC ='+ Trim(sgcDATA.CellStr['ID_RECEP_DOC',sgcDATA.SG.Row])+
                '   AND CVE_DOCUMENTO ='''+ Trim(sgcDATA.CellStr['CVE_DOCUMENTO',sgcDATA.SG.Row])+ '''';
         RunSQL(sSQL,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName, False);
         MuestraDatos;
      End;
   End;

End;

procedure TWMRecTra.sgcDATAMoveRow(Sender: TObject; FromIndex,  ToIndex: Integer);
begin
   Objeto.CVE_DOCUMENTO.AsString:=sgcDATA.CellStr['CVE_DOCUMENTO',ToIndex];
   Objeto.Doctos.FindKey([Objeto.ID_EMPRESA.AsString,sgcDATA.CellStr['CVE_DOCUMENTO',ToIndex]]);
end;

procedure TWMRecTra.Consultar1Click(Sender: TObject);
Var
   MExpAcreD: TMExpAcreD;
begin
   If (Objeto.SIT_RECEP_TRAM.AsString = 'AC')Or
      (Objeto.SIT_RECEP_TRAM.AsString = 'PE') Then Begin
      MExpAcreD:=TMExpAcreD.create(Nil);
      Try
         MExpAcreD.Apli:= Objeto.Apli;
         MExpAcreD.ParamCre:= Objeto.ParamCre;
         MExpAcreD.ID_ACREDITADO.AsInteger:= Objeto.ID_ACREDITADO.AsInteger;
         MExpAcreD.Catalogo;
      Finally
         MExpAcreD.Free;
      End;
      MuestraDatos;
   End;
end;

procedure TWMRecTra.Adicionardocumentoaltrmite1Click(Sender: TObject);
Var
   MRecDoc : TMRecDoc;
begin
   If (Objeto.SIT_RECEP_TRAM.AsString = 'AC')Or
      (Objeto.SIT_RECEP_TRAM.AsString = 'PE') Then Begin
      MRecDoc:=TMRecDoc.create(Nil);
      Try
         MRecDoc.Apli:= Objeto.Apli;
         MRecDoc.ParamCre:= Objeto.ParamCre;
         MRecDoc.RecTra:= Objeto;
         MRecDoc.Nuevo;
      Finally
         MRecDoc.Free;
      End;
      MuestraDatos;
   End;
end;

End.
