// Sistema         : Clase de CR_REL_DISP_SIEB
// Fecha de Inicio : 09/06/2004
// Función forma   : Clase de CR_REL_DISP_SIEB
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMDispSieb;

Interface

Uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,
IntGenCre, IntParamCre, IntCrCto, IntCtoPanel, InterEdit,
IntCrCredito,IntMEstSieb;

Type
 TMDispSieb= Class;

  TwMDispSieb=Class(TForm)
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
    icpCONTRATO: TInterCtoPanel;
    ilID_CREDITO: TInterLinkit;
    Label23: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label12: TLabel;
    edIMP_DISPOSICION: TInterEdit;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label16: TLabel;
    edIMP_COMPARTIR: TInterEdit;
    edIMP_INICIO: TInterEdit;
    edIMP_FINAL: TInterEdit;
    edIMP_SIEBAN: TInterEdit;
    edPCT_REAL: TInterEdit;
    edF_RECEPCION: TEdit;
    dtpF_RECEPCION: TInterDateTimePicker;
    edPCT_COMPARTIR: TInterEdit;
    edPCT_ESTIMADO: TInterEdit;
    edPCT_INICIO: TInterEdit;
    edPCT_FINAL: TInterEdit;
    btCREDITO: TBitBtn;
    edNOM_CREDITO: TEdit;
    rgSIT_REL_DISP_SIE: TRadioGroup;
    btCANCELA_ESTIMULO: TBitBtn;
    edCVE_USUA_MODIF: TEdit;
    lbUSUA_MODIF: TLabel;
    edCVE_USUA_ALTA: TEdit;
    lbUSUA_ALTA: TLabel;
    edF_MODIFICA: TEdit;
    lbF_MODIF: TLabel;
    edF_ALTA: TEdit;
    lbF_ALTA: TLabel;
    edF_FACTURACION: TEdit;
    edID_FACTURA: TEdit;
    edID_CREDITO: TEdit;
    gbFOLIO: TGroupBox;
    lbID_SOLICITUD: TLabel;
    Label5: TLabel;
    edNUM_CONTROL: TEdit;
    Label8: TLabel;
    edID_FIRA: TInterEdit;
    Procedure FormShow(Sender : TObject);
    Procedure FormClose(Sender : TObject; var Action : TCloseAction);
    Procedure FormDestroy(Sender : TObject);
    Procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    Procedure InterForma1Buscar(Sender: TObject);
    Procedure ilID_CREDITOCapture(Sender: TObject; var Show: Boolean);
    Procedure ilID_CREDITOEjecuta(Sender: TObject);
    Procedure InterForma1DespuesNuevo(Sender: TObject);
    Procedure rgSIT_REL_DISP_SIEExit(Sender: TObject);
    Procedure InterForma1DespuesModificar(Sender: TObject);
    Procedure InterForma1DespuesShow(Sender: TObject);
    Procedure btCREDITOClick(Sender: TObject);
    Procedure edIMP_SIEBANExit(Sender: TObject);
    Procedure edID_CREDITOExit(Sender: TObject);
    Procedure InterForma1DespuesAceptar(Sender: TObject);
    Procedure btCANCELA_ESTIMULOClick(Sender: TObject);
    procedure InterForma1BtnModificarClick(Sender: TObject);
    procedure edPCT_COMPARTIRExit(Sender: TObject);
    procedure edPCT_INICIOExit(Sender: TObject);
    procedure edPCT_FINALExit(Sender: TObject);

    Private
    { Private declarations }
      Function ObtFolio(pCveFolio : String; pMsg : String): Integer;
      Procedure MuestraDatos;
      Procedure ObtFechaRecep(iIdFactura : Integer);
    Public
    { Public declarations }
      Objeto : TMDispSieb;
    End;

 TMDispSieb= Class(TInterFrame)
      Private

      Protected
      Public
        { Public declarations }
        ID_SOLICITUD             : TInterCampo;
        ID_CREDITO               : TInterCampo;
        PCT_ESTIMADO             : TInterCampo;
        PCT_COMPARTIR            : TInterCampo;
        IMP_SIEBAN               : TInterCampo;
        PCT_REAL                 : TInterCampo;
        F_FACTURACION            : TInterCampo;
        ID_FACTURA               : TInterCampo;
        SIT_REL_DISP_SIE         : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFIC          : TInterCampo;

        NOM_CREDITO              : TInterCampo;
        IMP_DISPOSICION          : TInterCampo;
        PCT_INICIO               : TInterCampo;
        PCT_FINAL                : TInterCampo;
        IMP_COMPARTIR            : TInterCampo;
        IMP_INICIO               : TInterCampo;
        IMP_FINAL                : TInterCampo;
        NUM_CONTROL              : TInterCampo;
        ID_FIRA                  : TInterCampo;

        ParamCre                 : TParamCre;
        Disposicion              : TCrCredito;
        MEstSieb                 : TMEstSieb;

        Function    InternalBusca : Boolean; Override;
        Constructor Create( AOwner : TComponent ); Override;
        Destructor  Destroy; Override;
        Function    ShowWindow(FormaTipo : TFormaTipo) : Integer; Override;
        Function    Reporte:Boolean; Override;

      Published
      End;

Implementation
{$R *.DFM}

Constructor TMDispSieb.Create( AOwner : TComponent );
Begin Inherited;
   ID_SOLICITUD :=CreaCampo('ID_SOLICITUD',ftFloat,tsNinguno,tsNinguno,True);
      ID_SOLICITUD.Caption:='Folio de Solicitud';
      ID_SOLICITUD.NoCompare:= False;
   ID_CREDITO :=CreaCampo('ID_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
      ID_CREDITO.Caption:='Folio de la Disposición';
      ID_CREDITO.NoCompare:= False;
   PCT_ESTIMADO :=CreaCampo('PCT_ESTIMADO',ftFloat,tsNinguno,tsNinguno,True);
      PCT_ESTIMADO.Caption:='Dato estadístico del porcentaje estimado a recibir';
      PCT_ESTIMADO.NoCompare:= True;
   PCT_COMPARTIR :=CreaCampo('PCT_COMPARTIR',ftFloat,tsNinguno,tsNinguno,True);
      PCT_COMPARTIR.Caption:='Porcentaje a compartir';
      PCT_COMPARTIR.NoCompare:= True;
   IMP_SIEBAN :=CreaCampo('IMP_SIEBAN',ftFloat,tsNinguno,tsNinguno,True);
      IMP_SIEBAN.Caption:='Importe SIEBAN';
      IMP_SIEBAN.NoCompare:= True;
   PCT_REAL :=CreaCampo('PCT_REAL',ftFloat,tsNinguno,tsNinguno,True);
      PCT_REAL.Caption:='Porcentaje real';
      PCT_REAL.NoCompare:= True;
   F_FACTURACION :=CreaCampo('F_FACTURACION',ftDate,tsNinguno,tsNinguno,True);
      F_FACTURACION.Caption:='Fecha de Facturación';
      F_FACTURACION.NoCompare:= True;
   ID_FACTURA :=CreaCampo('ID_FACTURA',ftFloat,tsNinguno,tsNinguno,True);
      ID_FACTURA.Caption:='Folio de Factura';
      ID_FACTURA.NoCompare:= True;

   SIT_REL_DISP_SIE :=CreaCampo('SIT_REL_DISP_SIE',ftString,tsNinguno,tsNinguno,True);
   With SIT_REL_DISP_SIE Do Begin
      Size:=2;
      UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add('AC');
      ComboLista.Add('1'); ComboDatos.Add('FA');
      ComboLista.Add('2'); ComboDatos.Add('DI');
      ComboLista.Add('3'); ComboDatos.Add('DT');
      ComboLista.Add('4'); ComboDatos.Add('CA');
   End;
      SIT_REL_DISP_SIE.Caption:='Situación del importe SIEBAN a nivel disposición';
      SIT_REL_DISP_SIE.NoCompare:= True;
   CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      CVE_USU_ALTA.NoCompare:=True;
   F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
      F_ALTA.Caption:='Fecha de Alta';
      F_ALTA.NoCompare:=True;
   CVE_USU_MODIFIC :=CreaCampo('CVE_USU_MODIFIC',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_MODIFIC.Caption:='Clave de Usu Modifica';
      CVE_USU_MODIFIC.NoCompare:=True;
   F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
      F_MODIFICA.Caption:='Fecha Modifica';
      F_MODIFICA.NoCompare:=True;
   NOM_CREDITO :=CreaCampo('NOM_CREDITO',ftString,tsNinguno,tsNinguno,False);
      NOM_CREDITO.Caption:='Nombre de Acreditado';
      NOM_CREDITO.NoCompare:=True;
   IMP_DISPOSICION :=CreaCampo('IMP_DISPOSICION',ftFloat,tsNinguno,tsNinguno,False);
      IMP_DISPOSICION.Caption:='Importe de disposición';
      IMP_DISPOSICION.NoCompare:=True;
   PCT_INICIO :=CreaCampo('PCT_INICIO',ftFloat,tsNinguno,tsNinguno,False);
      PCT_INICIO.Caption:='Porcentaje inicio';
      PCT_INICIO.NoCompare:=True;
   PCT_FINAL :=CreaCampo('PCT_FINAL',ftFloat,tsNinguno,tsNinguno,False);
      PCT_FINAL.Caption:='Porcentaje Final';
      PCT_FINAL.NoCompare:=True;
   IMP_COMPARTIR :=CreaCampo('IMP_COMPARTIR',ftFloat,tsNinguno,tsNinguno,False);
      IMP_COMPARTIR.Caption:='Importe a compartir';
      IMP_COMPARTIR.NoCompare:=True;
   IMP_INICIO :=CreaCampo('IMP_INICIO',ftFloat,tsNinguno,tsNinguno,False);
      IMP_INICIO.Caption:='Importe al inicio';
      IMP_INICIO.NoCompare:=True;
   IMP_FINAL :=CreaCampo('IMP_FINAL',ftFloat,tsNinguno,tsNinguno,False);
      IMP_FINAL.Caption:='Importe al final';
      IMP_FINAL.NoCompare:=True;
   NUM_CONTROL :=CreaCampo('NUM_CONTROL',ftString,tsNinguno,tsNinguno,False);
      NUM_CONTROL.Caption:='Número de control';
      NUM_CONTROL.NoCompare:=True;
   ID_FIRA :=CreaCampo('ID_FIRA',ftFloat,tsNinguno,tsNinguno,False);
      ID_FIRA.Caption:='Identificador de Fira';
      ID_FIRA.NoCompare:=True;

   FKeyFields.Add('ID_SOLICITUD');
   FKeyFields.Add('ID_CREDITO');
   TableName := 'CR_REL_DISP_SIEB';
   UseQuery := True;
   HelpFile := 'IntMDispSieb.Hlp';
   ShowMenuReporte:=True;

   Disposicion := TCrCredito.Create(Self);
   Disposicion.MasterSource := Self;
   Disposicion.FieldByName('ID_CREDITO').MasterField:= 'ID_CREDITO';

   MEstSieb:= TMEstSieb.Create(Self);
   MEstSieb.MasterSource:= Self;
End;


Destructor TMDispSieb.Destroy;
Begin
   If MEstSieb <> Nil Then
      MEstSieb.Free;
   Inherited;
End;

Function TMDispSieb.ShowWindow(FormaTipo:TFormaTipo):Integer;
Var W : TWMDispSieb;
Begin
   W:=TWMDispSieb.Create(Self);
   Try
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

Function TMDispSieb.InternalBusca:Boolean;
Var T : TInterFindit;
    vlSalida : Boolean;
    sSQL:String;
    qyQuery: TQuery;
Begin
   InternalBusca := False;
   T := CreaBuscador('IMDispSieb.it','F,F');
   Try
      If Active Then Begin
         T.Param(0,ID_SOLICITUD.AsString);
         T.Param(1,ID_CREDITO.AsString);
      End;
      If T.Execute Then Begin
         VLSalida := FindKey([T.DameCampo(0),T.DameCampo(1)]);
         If VLSalida Then Begin
            Disposicion.FindKey([T.DameCampo(1)]);
            If Disposicion.Active Then Begin

               sSQL:=' SELECT CTO.*, CR.ID_CREDITO, NVL(CTO.ID_SOLICITUD,0) SOLICITUD'+
                     '  FROM CR_REL_CTO_SIEB CTO, CR_CREDITO CR '+
                     ' WHERE CR.ID_CONTRATO = CTO.ID_CONTRATO '+
                     '   AND CR.ID_CREDITO = '+ Disposicion.ID_CREDITO.AsSQL+
                     '   AND CTO.SIT_REL_CTO_SIE =''AC''';
               qyQuery:= GetSQLQuery(sSQL, DataBaseName, SessionName, False);
               If qyQuery <> Nil Then Begin
                  If qyQuery.FieldByName('SOLICITUD').AsInteger <> 0 Then Begin
                     MEstSieb.FindKey([qyQuery.FieldByName('SOLICITUD').AsInteger]);
                  End;
                  qyQuery.Free;
               End;
            End;
         End;
         InternalBusca := VLSalida;
      End;
   Finally
      T.Free;
   End;
End;

Function TMDispSieb.Reporte:Boolean;
Begin
   Result := False;
End;

(***********************************************FORMA CR_REL_DISP_SIEB********************)
(*                                                                              *)
(*  FORMA DE CR_REL_DISP_SIEB                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_REL_DISP_SIEB********************)

Procedure TwMDispSieb.FormShow(SEnder: TObject);
Begin
   InterForma1.BtnNuevo.Visible := False;
   InterForma1.BtnEliminar.Visible := False;

   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   With Objeto Do Begin
      ID_SOLICITUD.Control      := lbID_SOLICITUD;
      ID_CREDITO.Control        := edID_CREDITO;
      PCT_ESTIMADO.Control      := edPCT_ESTIMADO;
      PCT_COMPARTIR.Control     := edPCT_COMPARTIR;
      IMP_SIEBAN.Control        := edIMP_SIEBAN;
      PCT_REAL.Control          := edPCT_REAL;
      F_FACTURACION.Control     := edF_FACTURACION;
      ID_FACTURA.Control        := edID_FACTURA;
      SIT_REL_DISP_SIE.Control  := rgSIT_REL_DISP_SIE;
      F_ALTA.Control            := edF_ALTA;
      CVE_USU_ALTA.Control      := edCVE_USUA_ALTA;
      F_MODIFICA.Control        := edF_MODIFICA;
      CVE_USU_MODIFIC.Control   := edCVE_USUA_MODIF;
      InterForma1.MsgPanel      := PnlMsg;

//      NOM_CREDITO.Control       := edNOM_CREDITO;
      IMP_DISPOSICION.Control   := edIMP_DISPOSICION;
      PCT_INICIO.Control        := edPCT_INICIO;
      PCT_FINAL.Control         := edPCT_FINAL;
      IMP_COMPARTIR.Control     := edIMP_COMPARTIR;
      IMP_INICIO.Control        := edIMP_INICIO;
      IMP_FINAL.Control         := edIMP_FINAL;
      NUM_CONTROL.Control       := edNUM_CONTROL;
      ID_FIRA.Control           := edID_FIRA;

   End;
   Objeto.Disposicion.ID_CREDITO.Control := edID_CREDITO;
   Objeto.Disposicion.ContratoCre.Contrato.TITNombre.Control:= edNOM_CREDITO;
   Objeto.Disposicion.IMP_CREDITO.Control:= edIMP_DISPOSICION;
   Objeto.Disposicion.ID_CRED_EXTERNO.Control:= edNUM_CONTROL;
   Objeto.Disposicion.ID_CONTROL_EXT.Control:= edID_FIRA;
   Objeto.Disposicion.GetParams(Objeto);
   edNOM_CREDITO.Hint := Objeto.Disposicion.ContratoCre.Contrato.TITNombre.AsString;
   edNOM_CREDITO.ShowHint := True;

   icpCONTRATO.Frame := Objeto.Disposicion.ContratoCre.Contrato;
   icpCONTRATO.RefrescaInfo;
End;

Procedure TwMDispSieb.FormDestroy(SEnder: TObject);
Begin
   With Objeto Do Begin
      ID_SOLICITUD.Control      := Nil;
      ID_CREDITO.Control        := Nil;
      PCT_ESTIMADO.Control      := Nil;
      PCT_COMPARTIR.Control     := Nil;
      IMP_SIEBAN.Control        := Nil;
      PCT_REAL.Control          := Nil;
      F_FACTURACION.Control     := Nil;
      ID_FACTURA.Control        := Nil;
      SIT_REL_DISP_SIE.Control  := Nil;
      F_ALTA.Control            := Nil;
      CVE_USU_ALTA.Control      := Nil;
      F_MODIFICA.Control        := Nil;
      CVE_USU_MODIFIC.Control   := Nil;
      InterForma1.MsgPanel      := Nil;

//      NOM_CREDITO.Control       := Nil;
      IMP_DISPOSICION.Control   := Nil;
      PCT_INICIO.Control        := Nil;
      PCT_FINAL.Control         := Nil;
      IMP_COMPARTIR.Control     := Nil;
      IMP_INICIO.Control        := Nil;
      IMP_FINAL.Control         := Nil;
      NUM_CONTROL.Control       := Nil;
      ID_FIRA.Control           := Nil;

   End;
   Objeto.Disposicion.ID_CREDITO.Control := Nil;
   Objeto.Disposicion.ContratoCre.Contrato.TITNombre.Control:= Nil;
   Objeto.Disposicion.IMP_CREDITO.Control:= Nil;
   Objeto.Disposicion.ID_CRED_EXTERNO.Control:= Nil;
   Objeto.Disposicion.ID_CONTROL_EXT.Control:= Nil;
End;

Procedure TwMDispSieb.FormClose(SEnder: TObject; Var Action: TCloseAction);
Begin Action := caFree;
End;

Procedure TwMDispSieb.InterForma1AntesAceptar(SEnder: TObject;
  IsNewData: Boolean; Var Realizado: Boolean);
Begin
   With Objeto Do Begin
      If IsNewData Then Begin
         If MessageDlg('¿Desea almacenar los datos capturados?',
              mtConfirmation,[mbYes, mbNo], 0) = mrYes Then Begin
            CVE_USU_ALTA.AsString := DameUsuario;
            F_ALTA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
            ID_SOLICITUD.AsInteger:= ObtFolio('CRSIEB','ID SOLICITUD: ');
            Realizado := True;
         End Else
            Realizado := False;
      End Else Begin
         If MessageDlg('¿Desea guardar los datos modificados?',
              mtConfirmation,[mbYes, mbNo], 0) = mrYes Then Begin
            CVE_USU_MODIFIC.AsString := DameUsuario;
            F_MODIFICA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
            Realizado := True;
         End Else
            Realizado := False;
      End
   End;
End;

Procedure TwMDispSieb.InterForma1Buscar(SEnder: TObject);
Begin
   If Objeto.Busca Then Begin
      icpCONTRATO.RefrescaInfo;
      MuestraDatos;
   End;
End;

Procedure TwMDispSieb.ilID_CREDITOCapture(SEnder: TObject; Var Show: Boolean);
Begin
   Show:=(InterForma1.CanEdit);
End;

Procedure TwMDispSieb.ilID_CREDITOEjecuta(SEnder: TObject);
Begin
   If Objeto.Disposicion.FindKey([ilID_CREDITO.Buffer]) Then Begin
      InterForma1.NextTab(edID_CREDITO);
   End;
End;

Procedure TwMDispSieb.InterForma1DespuesNuevo(SEnder: TObject);
Begin
   Objeto.F_ALTA.AsDateTime:= Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_ALTA.AsString:= Objeto.Apli.Usuario;
   rgSIT_REL_DISP_SIE.ItemIndex:= 0;

   If Objeto.Disposicion.ID_CREDITO.AsInteger <> 0 Then Begin
      Objeto.ID_CREDITO.AsInteger:= Objeto.Disposicion.ID_CREDITO.AsInteger;
      btCREDITO.Enabled:= False;
      edID_CREDITO.Color:= clBtnFace;
      edID_CREDITO.ReadOnly:= True;
   End;
   icpCONTRATO.RefrescaInfo;
   edPCT_COMPARTIR.SetFocus;
End;

Procedure TwMDispSieb.rgSIT_REL_DISP_SIEExit(SEnder: TObject);
Begin
   InterForma1.ValidaExit(rgSIT_REL_DISP_SIE,True,CNULL,True);
End;

Procedure TwMDispSieb.InterForma1DespuesModificar(SEnder: TObject);
Begin
   MuestraDatos;
   Objeto.F_MODIFICA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_MODIFIC.AsString := Objeto.Apli.Usuario;
   edPCT_COMPARTIR.SetFocus;
End;

Procedure TwMDispSieb.InterForma1DespuesShow(SEnder: TObject);
Var
   sSQL : String;
   qyQuery : TQuery;
Begin
   If Objeto.Disposicion.Active Then Begin
      sSQL:=' SELECT CTO.*, CR.ID_CREDITO, NVL(CTO.ID_SOLICITUD,0) SOLICITUD'+
            '  FROM CR_REL_CTO_SIEB CTO, CR_CREDITO CR '+
            ' WHERE CR.ID_CONTRATO = CTO.ID_CONTRATO '+
            '   AND CR.ID_CREDITO = '+ Objeto.Disposicion.ID_CREDITO.AsSQL+
            '   AND CTO.SIT_REL_CTO_SIE =''AC''';
      qyQuery:= GetSQLQuery(sSQL, Objeto.DataBaseName, Objeto.SessionName, False);
      If qyQuery <> Nil Then Begin
         If qyQuery.FieldByName('SOLICITUD').AsInteger <> 0 Then Begin
            Objeto.MEstSieb.FindKey([qyQuery.FieldByName('SOLICITUD').AsInteger]);
            MuestraDatos;
         End;
         qyQuery.Free;
      End;
   End;
   icpCONTRATO.RefrescaInfo;
End;

Procedure TwMDispSieb.btCREDITOClick(SEnder: TObject);
Begin
   Objeto.Disposicion.ShowAll := True;
   If Objeto.Disposicion.Busca Then Begin
      icpCONTRATO.RefrescaInfo;
      InterForma1.NextTab(edID_CREDITO);
   End;
End;
Function TwMDispSieb.ObtFolio(pCveFolio : String; pMsg : String): Integer;
Var
   STPObtFolios : TStoredProc;
   vlFolio     : Integer;
Begin
   vlFolio := 0;
   STPObtFolios := TStoredProc.Create(Nil);
   Try
      With STPObtFolios Do Begin
         DatabaseName:= Objeto.Apli.DatabaseName;
         SessionName:= Objeto.Apli.SessionName;
         StoredProcName:='PKGCRDOCUMENTACION.STPOBTENFOLIO';

         Params.Clear;
         Params.CreateParam(ftFloat,'PEIDEMPRESA',ptInput);
         Params.CreateParam(ftString,'PECVEFOLIO',ptInput);
         Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
         Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
         Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
         Params.CreateParam(ftFloat,'RESULT',ptResult);
         ParamByName('PEIDEmpresa').AsInteger := Objeto.Apli.IdEmpresa;
         ParamByName('PECVEFolio').AsString := pCveFolio;
         ParamByName('PEBCommit').AsString := 'V';

         ExecProc;

         If (ParamByName('PSResultado').AsInteger = 0) Then Begin
            vlFolio := ParamByName('Result').AsInteger;
         End Else
            ShowMessage('PROBLEMAS AL OBTENER EL ' + pMsg +
            IntToStr(ParamByName('PSResultado').AsInteger));
      End;
   Finally
      STPObtFolios.Free;
   End;
   ObtFolio:= vlFolio;
End;

Procedure TwMDispSieb.edIMP_SIEBANExit(SEnder: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
   dPorcentaje, dDivision:Double;
Begin

   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;

      Objeto.IMP_DISPOSICION.GetFromControl;
      Objeto.PCT_INICIO.GetFromControl;
      Objeto.PCT_FINAL.GetFromControl;
      Objeto.IMP_SIEBAN.GetFromControl;

      If Objeto.IMP_SIEBAN.AsFloat = 0 Then Begin
         vlSalida   := False;
         vlMsg := 'El importe SIEBAN debe ser mayor a cero';
      End Else Begin
         If (Objeto.IMP_SIEBAN.AsFloat > Objeto.IMP_DISPOSICION.AsFloat) Then Begin
            vlSalida   := False;
            vlMsg := 'El importe SIEBAN debe ser menor al importe de la disposición';
         End Else Begin
            If Objeto.IMP_DISPOSICION.AsFloat <>0 Then Begin
                  Try
                     dDivision := Objeto.IMP_SIEBAN.AsFloat / Objeto.IMP_DISPOSICION.AsFloat;
                     dPorcentaje := dDivision*100;
                     Objeto.PCT_REAL.AsFloat:= dPorcentaje;
                  Except
                     Objeto.PCT_REAL.AsFloat:= 0;
                  End;
            End Else
               Objeto.PCT_REAL.AsFloat:=0;
            Try
               Objeto.IMP_INICIO.AsFloat:= (Objeto.IMP_SIEBAN.AsFloat*Objeto.PCT_INICIO.AsFloat)/100;
            Except
               Objeto.IMP_INICIO.AsFloat:=0;
            End;
            Try
               Objeto.IMP_FINAL.AsFloat:= (Objeto.IMP_SIEBAN.AsFloat*Objeto.PCT_FINAL.AsFloat)/100;
            Except
               Objeto.IMP_FINAL.AsFloat:=0;
            End;
            Objeto.IMP_COMPARTIR.AsFloat:= ((Objeto.IMP_SIEBAN.AsFloat*Objeto.PCT_INICIO.AsFloat)/100) +
                                           ((Objeto.IMP_SIEBAN.AsFloat*Objeto.PCT_FINAL.AsFloat)/100);
         End;
      End;
      InterForma1.ValidaExit(edIMP_SIEBAN,vlSalida,vlMsg,True);
   End;
End;

Procedure TwMDispSieb.edID_CREDITOExit(SEnder: TObject);
Var
   vlSalida  :  boolean;
   vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.ID_CREDITO.GetFromControl;
      If Objeto.ID_CREDITO.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Indique el identificador del Crédito';
      End;
      InterForma1.ValidaExit(edID_CREDITO,vlSalida,vlMsg,True);
   End;
End;

Procedure TwMDispSieb.MuestraDatos;
Var
   sSQL: String;
   qyQuery: TQuery;
   dImpInicio, dImpFinal, dPctInicio, dPctFinal:Double;
Begin
   ObtFechaRecep(Objeto.ID_FACTURA.AsInteger);
   Objeto.NOM_CREDITO.AsString:=Objeto.Disposicion.ContratoCre.Contrato.TITNombre.AsString;
   Objeto.IMP_DISPOSICION.AsFloat := Objeto.Disposicion.IMP_CREDITO.AsFloat;
   Objeto.NUM_CONTROL.AsString := Objeto.Disposicion.ID_CRED_EXTERNO.AsString;
   Objeto.ID_FIRA.AsString := Objeto.Disposicion.ID_CONTROL_EXT.AsString;

   If InterForma1.IsNewData Then Begin
      Objeto.PCT_COMPARTIR.AsFloat:= Objeto.MEstSieb.PCT_COMPARTIR_IN.AsFloat+ Objeto.MEstSieb.PCT_COMPARTIR_FI.AsFloat;
      Objeto.PCT_INICIO.AsFloat:=  Objeto.MEstSieb.PCT_COMPARTIR_IN.AsFloat;
      Objeto.PCT_FINAL.AsFloat:= Objeto.MEstSieb.PCT_COMPARTIR_FI.AsFloat;

      Objeto.PCT_ESTIMADO.AsFloat:= Objeto.MEstSieb.PCT_ESTIMADO.AsFloat;
      Try
         Objeto.IMP_INICIO.AsFloat:= (Objeto.IMP_SIEBAN.AsFloat*Objeto.MEstSieb.PCT_COMPARTIR_IN.AsFloat)/100;
      Except
         Objeto.IMP_INICIO.AsFloat:=0;
      End;
      Try
         Objeto.IMP_FINAL.AsFloat:= (Objeto.IMP_SIEBAN.AsFloat*Objeto.MEstSieb.PCT_COMPARTIR_FI.AsFloat)/100;
      Except
         Objeto.IMP_FINAL.AsFloat:=0;
      End;
      Objeto.IMP_COMPARTIR.AsFloat:= ((Objeto.IMP_SIEBAN.AsFloat*Objeto.MEstSieb.PCT_COMPARTIR_IN.AsFloat)/100) +
                                     ((Objeto.IMP_SIEBAN.AsFloat*Objeto.MEstSieb.PCT_COMPARTIR_FI.AsFloat)/100);
   End Else Begin
      sSQL:= 'SELECT * FROM CR_DET_DISP_SIEB WHERE ID_SOLICITUD='+ Objeto.ID_SOLICITUD.AsSQL;
      qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName,Objeto.Apli.SessionName, False);
      If qyQuery <> Nil Then Begin
         While not qyQuery.Eof Do Begin
            If qyQuery.FieldByName('CVE_TIPO_COMPART').AsString = 'IN' Then Begin
               dImpInicio:= qyQuery.FieldByName('IMP_COMPARTIR').AsFloat;
               dPctInicio:= qyQuery.FieldByName('PCT_COMPARTIR').AsFloat;
            End;
            If qyQuery.FieldByName('CVE_TIPO_COMPART').AsString = 'FI' Then Begin
               dImpFinal:= qyQuery.FieldByName('IMP_COMPARTIR').AsFloat;
               dPctFinal:= qyQuery.FieldByName('PCT_COMPARTIR').AsFloat;
            End;
            qyQuery.Next;
         End;
         edPCT_COMPARTIR.Text:= FormatFloat('###,##0.0000',dPctInicio+dPctFinal);
         edIMP_COMPARTIR.Text:= FormatFloat('###,###,###,###,###,##0.00',dImpInicio+dImpFinal);
         edIMP_INICIO.Text:= FormatFloat('###,###,###,###,###,##0.00',dImpInicio);
         edPCT_INICIO.Text:= FormatFloat('###,##0.0000',dPctInicio);
         edIMP_FINAL.Text:= FormatFloat('###,###,###,###,###,##0.00',dImpFinal);
         edPCT_FINAL.Text:= FormatFloat('###,##0.0000',dPctFinal);
         qyQuery.Free;
      End;
   End;
End;

Procedure TwMDispSieb.InterForma1DespuesAceptar(SEnder: TObject);
Var
   stpDetalle : TStoredProc;
Begin
   stpDetalle := TStoredProc.Create(Nil);
   Try
      With stpDetalle Do Begin
         DatabaseName:= Objeto.Apli.DatabaseName;
         SessionName:= Objeto.Apli.SessionName;
         StoredProcName:='PKGCRDOCUMENTACION.STP_INSERTADETALLE';

         Params.Clear;
         Params.CreateParam(ftFloat,'PE_ID_SOLICITUD',ptInput);
         Params.CreateParam(ftFloat,'PE_PCT_COMPARTIR_IN',ptInput);
         Params.CreateParam(ftFloat,'PE_IMP_COMPARTIR_IN',ptInput);
         Params.CreateParam(ftFloat,'PE_PCT_COMPARTIR_FI',ptInput);
         Params.CreateParam(ftFloat,'PE_IMP_COMPARTIR_FI',ptInput);
         Params.CreateParam(ftDateTime,'PE_F_LIQ_CLIENTE',ptInput);
         Params.CreateParam(ftString,'PE_SIT_DET_DISP_SIE',ptInput);
         Params.CreateParam(ftFloat,'PS_RESULTADO',ptOutput);
         Params.CreateParam(ftString,'PS_TX_RESULTADO',ptOutput);

         ParamByName('PE_ID_SOLICITUD').AsFloat := Objeto.ID_SOLICITUD.AsFloat;
         ParamByName('PE_PCT_COMPARTIR_IN').AsFloat := Objeto.PCT_INICIO.AsFloat;
         ParamByName('PE_IMP_COMPARTIR_IN').AsFloat := Objeto.IMP_INICIO.AsFloat;
         ParamByName('PE_PCT_COMPARTIR_FI').AsFloat := Objeto.PCT_FINAL.AsFloat;
         ParamByName('PE_IMP_COMPARTIR_FI').AsFloat := Objeto.IMP_FINAL.AsFloat;
         ParamByName('PE_F_LIQ_CLIENTE').Clear;
         ParamByName('PE_SIT_DET_DISP_SIE').AsString := Objeto.SIT_REL_DISP_SIE.AsString;
         ExecProc;

         If ParamByName('PS_RESULTADO').AsFloat <> 0 Then Begin
            ShowMessage('PROBLEMAS AL INSERTAR  EL DETALLE: ' + ParamByName('PS_TX_RESULTADO').AsString+
            FloatToStr(ParamByName('PS_RESULTADO').AsFloat));
         End;
      End;
   Finally
      stpDetalle.Free;
   End;
End;

Procedure TwMDispSieb.btCANCELA_ESTIMULOClick(SEnder: TObject);
Var
   stpDetalle : TStoredProc;
Begin
   If (Objeto.SIT_REL_DISP_SIE.AsString ='AC')Or
      (Objeto.SIT_REL_DISP_SIE.AsString ='CA') Then Begin
      If Objeto.SIT_REL_DISP_SIE.AsString <>'CA' Then Begin
         If MessageDlg('¿Desea Cancelar el Estímulo SIEBAN?',
                    mtConfirmation,[mbYes, mbNo], 0) = mrYes Then Begin
            stpDetalle := TStoredProc.Create(Nil);
            Try
               With stpDetalle Do Begin
                  DatabaseName:= Objeto.Apli.DatabaseName;
                  SessionName:= Objeto.Apli.SessionName;
                  StoredProcName:='PKGCRDOCUMENTACION.STP_CANCELA_SIEBDISP';

                  Params.Clear;
                  Params.CreateParam(ftFloat,'PE_ID_SOLICITUD',ptInput);
                  Params.CreateParam(ftFloat,'PE_ID_CREDITO',ptInput);
                  Params.CreateParam(ftFloat,'PS_RESULTADO',ptOutput);
                  Params.CreateParam(ftString,'PS_TX_RESULTADO',ptOutput);

                  ParamByName('PE_ID_SOLICITUD').AsFloat := Objeto.ID_SOLICITUD.AsFloat;
                  ParamByName('PE_ID_CREDITO').AsFloat := Objeto.ID_CREDITO.AsFloat;
                  ExecProc;

                  If ParamByName('PS_RESULTADO').AsFloat <> 0 Then Begin
                     ShowMessage('PROBLEMAS AL CANCELAR : ' + ParamByName('PS_TX_RESULTADO').AsString+
                     FloatToStr(ParamByName('PS_RESULTADO').AsFloat));
                  End;
               End;
            Finally
               stpDetalle.Free;
            End;
            Objeto.FindKey([Objeto.ID_SOLICITUD.AsString,Objeto.ID_CREDITO.AsString]);
            MuestraDatos;
         End;
      End Else Begin
         ShowMessage('El estímulo SIEBAN ya está cancelado');
      End;
   End Else Begin
      ShowMessage('El estímulo SIEBAN no puede ser cancelado');
   End;
End;

procedure TwMDispSieb.InterForma1BtnModificarClick(Sender: TObject);
Var
   stpInserta : TStoredProc;
Begin
   If Objeto.SIT_REL_DISP_SIE.AsString ='AC' Then Begin
      stpInserta:=TStoredProc.Create(Nil);
      try
         stpInserta.DatabaseName:=Objeto.DataBaseName;
         stpInserta.SessionName:=Objeto.SessionName;
         stpInserta.Active:=False;
         stpInserta.Params.Clear;
         stpInserta.StoredProcName:='PKGCRDOCUMENTACION.STP_MODIF_SIEB_DISP';
         stpInserta.Params.CreateParam(ftFloat,'PE_ID_SOLICITUD',ptInput);
         stpInserta.Params.CreateParam(ftFloat,'PE_ID_CREDITO',ptInput);
         stpInserta.Params.CreateParam(ftDateTime,'PE_F_ALTA',ptInput);
         stpInserta.Params.CreateParam(ftString,'PE_CVE_USU_ALTA',ptInput);
         stpInserta.Params.CreateParam(ftFloat,'PE_ID_EMPRESA',ptInput);
         stpInserta.Params.CreateParam(ftFloat,'PS_ID_SOLICITUD_NV',ptOutput);
         stpInserta.Params.CreateParam(ftFloat,'PS_RESULTADO',ptOutput);
         stpInserta.Params.CreateParam(ftString,'PS_TX_RESULTADO',ptOutput);

         stpInserta.ParamByName('PE_ID_SOLICITUD').AsFloat := Objeto.ID_SOLICITUD.AsFloat;
         stpInserta.ParamByName('PE_ID_CREDITO').AsFloat := Objeto.ID_CREDITO.AsFloat;
         stpInserta.ParamByName('PE_F_ALTA').AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
         stpInserta.ParamByName('PE_CVE_USU_ALTA').AsString := Objeto.Apli.Usuario;
         stpInserta.ParamByName('PE_ID_EMPRESA').AsFloat := Objeto.Apli.IdEmpresa;
         stpInserta.ExecProc;

         If stpInserta.ParamByName('PS_RESULTADO').AsFloat = 0 Then Begin
            Objeto.FindKey([stpInserta.ParamByName('PS_ID_SOLICITUD_NV').AsString]);
            Objeto.Modifica;
         End Else Begin
            ShowMessage('ERROR: ' + IntToStr(stpInserta.ParamByName('PS_RESULTADO').AsInteger)+
                         stpInserta.ParamByName('PS_TX_RESULTADO').AsString);
         End;

      Finally
          If stpInserta <> Nil Then Begin
            stpInserta.UnPrepare;
            stpInserta.Free;
          End;
      End;
   End Else Begin
      ShowMessage('El estímulo sólo puede modificarse en situación Activo');
   End;
end;

Procedure TwMDispSieb.ObtFechaRecep(iIdFactura : Integer);
Var
   sSQL : String;
   qyQuery : TQuery;
Begin
   If iIdFactura > 0 Then Begin
      sSQL:= 'SELECT * FROM CF_FACTURA@CONT WHERE ID_FACTURA='+ IntToStr(iIdFactura);
      qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName,False);
      If qyQuery <> Nil Then Begin
         If qyQuery.FieldByName('ID_FACTURA').AsInteger = iIdFactura Then Begin
            edF_RECEPCION.Text:= FormatDateTime('dd/mm/yyyy',qyQuery.FieldByName('F_PAGO').AsDateTime);
         End;
         qyQuery.Free;
      End;
   End Else Begin
      edF_RECEPCION.Text:= '';
   End;
End;
procedure TwMDispSieb.edPCT_COMPARTIRExit(Sender: TObject);
Var
   vlSalida  :  boolean;
   vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.PCT_COMPARTIR.GetFromControl;
      If Objeto.PCT_COMPARTIR.AsFloat = 0 Then Begin
         vlSalida   := False;
         vlMsg := 'Indique el porcentaje a compartir';
      End Else Begin
         If (Objeto.PCT_COMPARTIR.AsFloat > (Objeto.MEstSieb.PCT_COMPARTIR_IN.AsFloat +
                                             Objeto.MEstSieb.PCT_COMPARTIR_FI.AsFloat))Then Begin
            vlSalida   := False;
            vlMsg := 'El Porcentaje debe ser menor o igual al porcentaje máximo a compartir de la línea';
         End;
      End;
      InterForma1.ValidaExit(edPCT_COMPARTIR,vlSalida,vlMsg,True);
   End;
end;

procedure TwMDispSieb.edPCT_INICIOExit(Sender: TObject);
Var
   vlSalida  :  boolean;
   vlMsg     :  String;
   Resta     : Double;
Begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.PCT_INICIO.GetFromControl;
      If (Objeto.PCT_INICIO.AsFloat < 0)Or
         (Objeto.PCT_INICIO.AsFloat > Objeto.MEstSieb.PCT_COMPARTIR_IN.AsFloat) Then Begin
         vlSalida   := False;
         vlMsg := 'El Porcentaje debe ser mayor a cero y menor o igual al porcentaje máximo a compartir inicial de la línea';
      End Else Begin
         Resta:= Objeto.PCT_COMPARTIR.AsFloat - Objeto.PCT_INICIO.AsFloat;
         Objeto.PCT_FINAL.AsFloat := Resta;
      End;
      InterForma1.ValidaExit(edPCT_INICIO,vlSalida,vlMsg,True);
   End;
end;

procedure TwMDispSieb.edPCT_FINALExit(Sender: TObject);
Var
   vlSalida  : Boolean;
   vlMsg     : String;
   Resta     : Double;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.PCT_FINAL.GetFromControl;
      If (Objeto.PCT_FINAL.AsFloat < 0)Or
         (Objeto.PCT_FINAL.AsFloat > Objeto.MEstSieb.PCT_COMPARTIR_FI.AsFloat)Then Begin
         vlSalida   := False;
         vlMsg := 'El Porcentaje debe ser mayor a cero y menor o igual  al porcentaje máximo a compartir final de la línea';
      End Else Begin
         Resta:= Objeto.PCT_COMPARTIR.AsFloat - Objeto.PCT_FINAL.AsFloat;
         Objeto.PCT_INICIO.AsFloat := Resta;
      End;
      InterForma1.ValidaExit(edPCT_FINAL,vlSalida,vlMsg,True);
   End;
end;

End.
