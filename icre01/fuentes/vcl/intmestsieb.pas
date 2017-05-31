// Sistema         : Clase de CR_REL_CTO_SIEB
// Fecha de Inicio : 07/06/2004
// Función forma   : Clase de CR_REL_CTO_SIEB
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMEstSieb;

Interface

Uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,
IntGenCre, IntParamCre, IntCrCto, IntCtoPanel, InterEdit;

Type
 TMEstSieb= Class;

  TwMEstSieb=Class(TForm)
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
    lbID_CONTRATO: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label27: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edID_CONTRATO: TInterEdit;
    btID_CONTRATO: TBitBtn;
    edCVE_PRODUCTO: TEdit;
    edDESC_PRODUCTO: TEdit;
    rgSIT_REL_CTO_SIE: TRadioGroup;
    edPCT_COMPARTIR_TOT: TInterEdit;
    edPCT_COMPARTIR_IN: TInterEdit;
    edPCT_COMPARTIR_FI: TInterEdit;
    ilID_CONTRATO: TInterLinkit;
    edTXT_COMENTARIO: TMemo;
    edCVE_USUA_MODIF: TEdit;
    lbUSUA_MODIF: TLabel;
    edCVE_USUA_ALTA: TEdit;
    lbUSUA_ALTA: TLabel;
    edF_MODIFICA: TEdit;
    lbF_MODIF: TLabel;
    edF_ALTA: TEdit;
    lbF_ALTA: TLabel;
    edPCT_ESTIMADO: TInterEdit;
    gbFOLIO: TGroupBox;
    lbID_SOLICITUD: TLabel;
    Procedure FormShow(Sender : TObject);
    Procedure FormClose(Sender : TObject; var Action : TCloseAction);
    Procedure FormDestroy(Sender : TObject);
    Procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    Procedure InterForma1Buscar(Sender: TObject);
    Procedure edID_CONTRATOExit(Sender: TObject);
    Procedure btID_CONTRATOClick(Sender: TObject);
    Procedure ilID_CONTRATOCapture(Sender: TObject; var Show: Boolean);
    Procedure ilID_CONTRATOEjecuta(Sender: TObject);
    Procedure InterForma1DespuesNuevo(Sender: TObject);
    Procedure rgSIT_REL_CTO_SIEExit(Sender: TObject);
    Procedure InterForma1DespuesModificar(Sender: TObject);
    Procedure edTXT_COMENTARIOExit(Sender: TObject);
    Procedure edPCT_COMPARTIR_TOTExit(Sender: TObject);
    Procedure edPCT_COMPARTIR_INExit(Sender: TObject);
    Procedure edPCT_COMPARTIR_FIExit(Sender: TObject);
    Procedure edPCT_COMPARTIR_TOTChange(Sender: TObject);
    Procedure InterForma1DespuesShow(Sender: TObject);
    Procedure edPCT_ESTIMADOExit(Sender: TObject);
    procedure InterForma1BtnModificarClick(Sender: TObject);

    Private
      Function ObtFolio(pCveFolio : String; pMsg : String): Integer;    
    { Private declarations }
    Public
    { Public declarations }
      Objeto : TMEstSieb;
    End;

 TMEstSieb= Class(TInterFrame)
      Private
      Protected
      Public
        { Public declarations }
        ID_CONTRATO              : TInterCampo;
        ID_SOLICITUD             : TInterCampo;
        PCT_ESTIMADO             : TInterCampo;
        PCT_COMPARTIR_IN         : TInterCampo;
        PCT_COMPARTIR_FI         : TInterCampo;
        TXT_COMENTARIO           : TInterCampo;
        SIT_REL_CTO_SIE          : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFIC          : TInterCampo;

        PCT_COMPARTIR_TOT        : TInterCampo;
        CVE_PRODUCTO             : TInterCampo;
        DESC_PRODUCTO            : TInterCampo;


        ParamCre                 : TParamCre;
        Autorizacion             : TCrCto;

        Function    InternalBusca : Boolean; Override;
        Constructor Create( AOwner : TComponent ); Override;
        Destructor  Destroy; Override;
        Function    ShowWindow(FormaTipo : TFormaTipo) : Integer; Override;
        Function    Reporte:Boolean; Override;
      Published
      End;

Implementation
{$R *.DFM}

Constructor TMEstSieb.Create( AOwner : TComponent );
Begin Inherited;
   ID_SOLICITUD :=CreaCampo('ID_SOLICITUD',ftFloat,tsNinguno,tsNinguno,True);
      ID_SOLICITUD.Caption:='Identificador del Estímulo';
      ID_SOLICITUD.NoCompare:= False;
   ID_CONTRATO :=CreaCampo('ID_CONTRATO',ftFloat,tsNinguno,tsNinguno,True);
      ID_CONTRATO.Caption:='Identificador del Contrato';
      ID_CONTRATO.NoCompare:= True;
   PCT_ESTIMADO :=CreaCampo('PCT_ESTIMADO',ftFloat,tsNinguno,tsNinguno,True);
      PCT_ESTIMADO.Caption:='Dato estadístico del porcentaje estimado a recibir';
      PCT_ESTIMADO.NoCompare:= True;
   PCT_COMPARTIR_IN :=CreaCampo('PCT_COMPARTIR_IN',ftFloat,tsNinguno,tsNinguno,True);
      PCT_COMPARTIR_IN.Caption:='Porcentaje a compartir al inicio de las disposiciones';
      PCT_COMPARTIR_IN.NoCompare:= True;
   PCT_COMPARTIR_FI :=CreaCampo('PCT_COMPARTIR_FI',ftFloat,tsNinguno,tsNinguno,True);
      PCT_COMPARTIR_FI.Caption:='Porcentaje a compartir al final de las disposiciones';
      PCT_COMPARTIR_FI.NoCompare:= True;
   TXT_COMENTARIO:=CreaCampo('TXT_COMENTARIO',ftString,tsNinguno,tsNinguno,True);
      TXT_COMENTARIO.Caption:='Comentario';
      TXT_COMENTARIO.NoCompare:= True;

   SIT_REL_CTO_SIE :=CreaCampo('SIT_REL_CTO_SIE',ftString,tsNinguno,tsNinguno,True);
   With SIT_REL_CTO_SIE Do Begin
      Size:=2;
      UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add('AC');
      ComboLista.Add('1'); ComboDatos.Add('CA');
   End;
      SIT_REL_CTO_SIE.Caption:='Situación del SIEBAN a nivel contrato';
      SIT_REL_CTO_SIE.NoCompare:= True;
   CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      CVE_USU_ALTA.NoCompare:= True;
   F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
      F_ALTA.Caption:='Fecha de Alta';
      F_ALTA.NoCompare:= True;
   CVE_USU_MODIFIC :=CreaCampo('CVE_USU_MODIFIC',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_MODIFIC.Caption:='Clave de Usu Modifica';
      CVE_USU_MODIFIC.NoCompare:= True;
   F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
      F_MODIFICA.Caption:='Fecha Modifica';
      F_MODIFICA.NoCompare:= True;

   PCT_COMPARTIR_TOT :=CreaCampo('PCT_COMPARTIR_TOT',ftFloat,tsNinguno,tsNinguno,False);
      PCT_COMPARTIR_TOT.Caption:='Porcentaje a compartir Total';
      PCT_COMPARTIR_TOT.NoCompare:= True;
   CVE_PRODUCTO :=CreaCampo('CVE_PRODUCTO',ftString,tsNinguno,tsNinguno,False);
      CVE_PRODUCTO.Caption:='Clave de Producto';
      CVE_PRODUCTO.NoCompare:= True;
   DESC_PRODUCTO :=CreaCampo('DESC_PRODUCTO',ftString,tsNinguno,tsNinguno,False);
      DESC_PRODUCTO.Caption:='Descripción de Producto';
      DESC_PRODUCTO.NoCompare:= True;

   FKeyFields.Add('ID_SOLICITUD');
   TableName := 'CR_REL_CTO_SIEB';
   UseQuery := True;
   HelpFile := 'IntMEstSieb.Hlp';
   ShowMenuReporte:=True;

   Autorizacion := TCrCto.Create(Self);
   Autorizacion.MasterSource := Self;
   Autorizacion.FieldByName('ID_CONTRATO').MasterField := 'ID_CONTRATO';
End;


Destructor TMEstSieb.Destroy;
Begin
   Inherited;
End;

Function TMEstSieb.ShowWindow(FormaTipo:TFormaTipo):Integer;
Var W : TWMEstSieb;
Begin
   W:=TWMEstSieb.Create(Self);
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

Function TMEstSieb.InternalBusca:Boolean;
Var T : TInterFindit;
    vlSalida : Boolean;
Begin
   InternalBusca := False;
   T := CreaBuscador('IMEstSieb.it','F');
   Try
      If Active Then Begin
         T.Param(0,ID_SOLICITUD.AsString);
      End;
      If T.Execute Then Begin
         VLSalida := FindKey([T.DameCampo(0)]);
         If VLSalida Then Begin
            Autorizacion.FindKey([ID_CONTRATO.AsString,'1']);
            If Autorizacion.Active Then Begin
               PCT_COMPARTIR_TOT.AsFloat:= PCT_COMPARTIR_IN.AsFloat + PCT_COMPARTIR_FI.AsFloat;
               CVE_PRODUCTO.AsString:= Autorizacion.CVE_PRODUCTO_CRE.AsString;
               DESC_PRODUCTO.AsString:= Autorizacion.Producto.DESC_C_PRODUCTO.AsString;
            End;
         End;
         InternalBusca := VLSalida;
      End;
   Finally
      T.Free;
   End;
End;

Function TMEstSieb.Reporte:Boolean;
Begin
   Result := False;
End;


(***********************************************FORMA CR_REL_CTO_SIEB********************)
(*                                                                              *)
(*  FORMA DE CR_REL_CTO_SIEB                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_REL_CTO_SIEB********************)

Procedure TwMEstSieb.FormShow(SEnder: TObject);
Begin
   InterForma1.BtnNuevo.Visible := False;
   InterForma1.BtnEliminar.Visible := False;

   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   With Objeto Do Begin
      ID_CONTRATO.Control       := edID_CONTRATO;
      ID_SOLICITUD.Control      := lbID_SOLICITUD;
      PCT_ESTIMADO.Control      := edPCT_ESTIMADO;
      PCT_COMPARTIR_IN.Control  := edPCT_COMPARTIR_IN;
      PCT_COMPARTIR_FI.Control  := edPCT_COMPARTIR_FI;
      TXT_COMENTARIO.Control    := edTXT_COMENTARIO;
      SIT_REL_CTO_SIE.Control   := rgSIT_REL_CTO_SIE;
      F_ALTA.Control            := edF_ALTA;
      CVE_USU_ALTA.Control      := edCVE_USUA_ALTA;
      F_MODIFICA.Control        := edF_MODIFICA;
      CVE_USU_MODIFIC.Control   := edCVE_USUA_MODIF;
      PCT_COMPARTIR_TOT.Control := edPCT_COMPARTIR_TOT;
      CVE_PRODUCTO.Control      := edCVE_PRODUCTO;
      DESC_PRODUCTO.Control     := edDESC_PRODUCTO;
      InterForma1.MsgPanel      := PnlMsg;
   End;

   Objeto.Autorizacion.ID_CONTRATO.Control :=edID_CONTRATO;
   Objeto.Autorizacion.CVE_PRODUCTO_CRE.Control :=edCVE_PRODUCTO;
   Objeto.Autorizacion.Producto.DESC_C_PRODUCTO.Control := edDESC_PRODUCTO;
   Objeto.Autorizacion.GetParams(Objeto);
   edDESC_PRODUCTO.Hint := Objeto.Autorizacion.Producto.DESC_C_PRODUCTO.AsString;
   edDESC_PRODUCTO.ShowHint := True;

   icpCONTRATO.Frame := Objeto.Autorizacion.Contrato;
   icpCONTRATO.RefrescaInfo;
End;

Procedure TwMEstSieb.FormDestroy(SEnder: TObject);
Begin
   With Objeto Do Begin
      ID_CONTRATO.Control       := Nil;
      ID_SOLICITUD.Control      := Nil;
      PCT_ESTIMADO.Control      := Nil;
      PCT_COMPARTIR_IN.Control  := Nil;
      PCT_COMPARTIR_FI.Control  := Nil;
      TXT_COMENTARIO.Control    := Nil;
      SIT_REL_CTO_SIE.Control   := Nil;
      F_ALTA.Control            := Nil;
      CVE_USU_ALTA.Control      := Nil;
      F_MODIFICA.Control        := Nil;
      CVE_USU_MODIFIC.Control   := Nil;
      PCT_COMPARTIR_TOT.Control := Nil;
      CVE_PRODUCTO.Control      := Nil;
      DESC_PRODUCTO.Control     := Nil;
      InterForma1.MsgPanel      := Nil;
   End;
   Objeto.Autorizacion.ID_CONTRATO.Control :=Nil;
   Objeto.Autorizacion.CVE_PRODUCTO_CRE.Control :=Nil;
   Objeto.Autorizacion.Producto.DESC_C_PRODUCTO.Control := Nil;
End;

Procedure TwMEstSieb.FormClose(SEnder: TObject; Var Action: TCloseAction);
Begin Action := caFree;
End;

Procedure TwMEstSieb.InterForma1AntesAceptar(SEnder: TObject;
  IsNewData: Boolean; Var Realizado: Boolean);
Begin
   With Objeto Do Begin
      If IsNewData Then Begin
         If MessageDlg('¿Desea almacenar los datos capturados?',
              mtConfirmation,[mbYes, mbNo], 0) = mrYes Then Begin
            CVE_USU_ALTA.AsString := DameUsuario;
            F_ALTA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
            ID_SOLICITUD.AsInteger:= ObtFolio('CRSIEBLI','ID SOLICITUD: ');
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

Procedure TwMEstSieb.InterForma1Buscar(SEnder: TObject);
Begin
   If Objeto.Busca Then Begin
      icpCONTRATO.RefrescaInfo;
   End;
End;

Procedure TwMEstSieb.edID_CONTRATOExit(SEnder: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.ID_CONTRATO.GetFromControl;
      If Objeto.ID_CONTRATO.AsString = CNULL Then Begin
         vlSalida   := False;
         vlMsg := 'Indique el identificador del Contrato';
      End;
      InterForma1.ValidaExit(edID_CONTRATO,vlSalida,vlMsg,True);
   End;
End;

Procedure TwMEstSieb.btID_CONTRATOClick(SEnder: TObject);
Begin
   Objeto.Autorizacion.ShowAll := True;
   If Objeto.Autorizacion.Busca Then Begin
      icpCONTRATO.RefrescaInfo;
      InterForma1.NextTab(edID_CONTRATO);
   End;
End;

Procedure TwMEstSieb.ilID_CONTRATOCapture(SEnder: TObject; Var Show: Boolean);
Begin
   Show:=(InterForma1.CanEdit);//and (InterForma1.IsNewData);
End;

Procedure TwMEstSieb.ilID_CONTRATOEjecuta(SEnder: TObject);
Begin
   If Objeto.Autorizacion.FindKey([ilID_CONTRATO.Buffer,'1']) Then Begin
      InterForma1.NextTab(edID_CONTRATO);
   End;
End;

Procedure TwMEstSieb.InterForma1DespuesNuevo(SEnder: TObject);
Begin
   Objeto.F_ALTA.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
   rgSIT_REL_CTO_SIE.ItemIndex:= 0;
   edID_CONTRATO.SetFocus;

   If Objeto.Autorizacion.Contrato.ID_CONTRATO.AsInteger <> 0 Then Begin
      Objeto.ID_CONTRATO.AsInteger := Objeto.Autorizacion.Contrato.ID_CONTRATO.AsInteger;
      Objeto.CVE_PRODUCTO.AsString := Objeto.Autorizacion.Producto.CVE_PRODUCTO_CRE.AsString;
      Objeto.DESC_PRODUCTO.AsString := Objeto.Autorizacion.Producto.DESC_C_PRODUCTO.AsString;
      edPCT_ESTIMADO.SetFocus;      
   End;
   icpCONTRATO.RefrescaInfo;

End;

Procedure TwMEstSieb.rgSIT_REL_CTO_SIEExit(SEnder: TObject);
Begin
   InterForma1.ValidaExit(rgSIT_REL_CTO_SIE,True,CNULL,True);
End;

Procedure TwMEstSieb.InterForma1DespuesModificar(SEnder: TObject);
Begin
   If Objeto.SIT_REL_CTO_SIE.AsString = 'AC' Then Begin
      Objeto.PCT_COMPARTIR_TOT.AsFloat:= Objeto.PCT_COMPARTIR_IN.AsFloat + Objeto.PCT_COMPARTIR_FI.AsFloat;
      Objeto.CVE_PRODUCTO.AsString:= Objeto.Autorizacion.CVE_PRODUCTO_CRE.AsString;
      Objeto.DESC_PRODUCTO.AsString:= Objeto.Autorizacion.Producto.DESC_C_PRODUCTO.AsString;
   End;
End;

Procedure TwMEstSieb.edTXT_COMENTARIOExit(SEnder: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.TXT_COMENTARIO.GetFromControl;
      If Trim(Objeto.TXT_COMENTARIO.AsString)='' Then Begin
         vlSalida   := False;
         vlMsg := 'Indique los Comentarios o Instrucciones adicionales';
      End;
      InterForma1.ValidaExit(edTXT_COMENTARIO,vlSalida,vlMsg,True);
   End;
End;

Procedure TwMEstSieb.edPCT_COMPARTIR_TOTExit(SEnder: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.PCT_COMPARTIR_TOT.GetFromControl;
      If (Objeto.PCT_COMPARTIR_TOT.AsFloat = 0)Then Begin
         vlSalida   := False;
         vlMsg := 'El Porcentaje debe ser mayor a cero y menor a 100';
      End Else Begin
         If (Objeto.PCT_COMPARTIR_TOT.AsFloat > 100)Then Begin
            vlSalida   := False;
            vlMsg := 'El Porcentaje debe menor o igual a 100';
         End;
      End;
      InterForma1.ValidaExit(edPCT_COMPARTIR_TOT,vlSalida,vlMsg,True);
   End;
End;

Procedure TwMEstSieb.edPCT_COMPARTIR_INExit(SEnder: TObject);
Var
   vlSalida  : Boolean;
   vlMsg     : String;
   Resta     : Double;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.PCT_COMPARTIR_IN.GetFromControl;
      If (Objeto.PCT_COMPARTIR_IN.AsFloat < 0)Or
         (Objeto.PCT_COMPARTIR_IN.AsFloat > Objeto.PCT_COMPARTIR_TOT.AsFloat) Then Begin
         vlSalida   := False;
         vlMsg := 'El Porcentaje debe ser >0 y <= al Porcentaje a compartir';
      End Else Begin
         Resta:=0;
         Resta:= Objeto.PCT_COMPARTIR_TOT.AsFloat - Objeto.PCT_COMPARTIR_IN.AsFloat;
         Objeto.PCT_COMPARTIR_FI.AsFloat := Resta;
      End;
      InterForma1.ValidaExit(edPCT_COMPARTIR_IN,vlSalida,vlMsg,True);
   End;
End;

Procedure TwMEstSieb.edPCT_COMPARTIR_FIExit(SEnder: TObject);
Var
   vlSalida  : Boolean;
   vlMsg     : String;
   Resta     : Double;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;

      Objeto.PCT_COMPARTIR_FI.GetFromControl;
      If (Objeto.PCT_COMPARTIR_FI.AsFloat < 0)Or
         (Objeto.PCT_COMPARTIR_FI.AsFloat > Objeto.PCT_COMPARTIR_TOT.AsFloat)Then Begin
         vlSalida   := False;
         vlMsg := 'El Porcentaje debe ser >0 y <= al Porcentaje a compartir';
      End Else Begin
         Resta:=0;
         Resta:= Objeto.PCT_COMPARTIR_TOT.AsFloat - Objeto.PCT_COMPARTIR_FI.AsFloat;
         Objeto.PCT_COMPARTIR_IN.AsFloat := Resta;
      End;
      InterForma1.ValidaExit(edPCT_COMPARTIR_FI,vlSalida,vlMsg,True);
   End;
End;

Procedure TwMEstSieb.edPCT_COMPARTIR_TOTChange(SEnder: TObject);
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      Objeto.PCT_COMPARTIR_IN.AsFloat:=0;
      Objeto.PCT_COMPARTIR_FI.AsFloat:=0;
   End;
End;

Procedure TwMEstSieb.InterForma1DespuesShow(SEnder: TObject);
Begin
   Objeto.Autorizacion.FindKey([Objeto.ID_CONTRATO.AsString,'1']);
   If Objeto.Autorizacion.Active Then Begin
      icpCONTRATO.RefrescaInfo;
      Objeto.PCT_COMPARTIR_TOT.AsFloat:= Objeto.PCT_COMPARTIR_IN.AsFloat + Objeto.PCT_COMPARTIR_FI.AsFloat;
      Objeto.CVE_PRODUCTO.AsString:= Objeto.Autorizacion.CVE_PRODUCTO_CRE.AsString;
      Objeto.DESC_PRODUCTO.AsString:= Objeto.Autorizacion.Producto.DESC_C_PRODUCTO.AsString;
      edID_CONTRATO.Color := clBtnFace;
   End;
End;

Procedure TwMEstSieb.edPCT_ESTIMADOExit(SEnder: TObject);
Var  vlSalida  :  boolean;
     vlMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppEnd)) Then Begin
      vlMsg    := CNULL;
      vlSalida := True;
      Objeto.PCT_ESTIMADO.GetFromControl;
      If Objeto.PCT_ESTIMADO.AsFloat = 0 Then Begin
         vlSalida   := False;
         vlMsg := 'El Porcentaje debe ser mayor a cero';
      End Else Begin
         If (Objeto.PCT_ESTIMADO.AsFloat > 100)Then Begin
            vlSalida   := False;
            vlMsg := 'El Porcentaje debe menor o igual a 100';
         End;
      End;
      InterForma1.ValidaExit(edPCT_ESTIMADO,vlSalida,vlMsg,True);
   End;
End;

Function TwMEstSieb.ObtFolio(pCveFolio : String; pMsg : String): Integer;
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

procedure TwMEstSieb.InterForma1BtnModificarClick(Sender: TObject);
Var
   stpModSiebLi : TStoredProc;
Begin
   If Objeto.SIT_REL_CTO_SIE.AsString ='AC' Then Begin
      stpModSiebLi:=TStoredProc.Create(Nil);
      Try
         stpModSiebLi.DatabaseName:=Objeto.DataBaseName;
         stpModSiebLi.SessionName:=Objeto.SessionName;
         stpModSiebLi.Active:=False;
         stpModSiebLi.Params.Clear;
         stpModSiebLi.StoredProcName:='PKGCRDOCUMENTACION.STP_MODIF_SIEBLI';
         stpModSiebLi.Params.CreateParam(ftFloat,'PE_ID_SOLICITUD',ptInput);
         stpModSiebLi.Params.CreateParam(ftFloat,'PE_ID_CONTRATO',ptInput);
         stpModSiebLi.Params.CreateParam(ftDateTime,'PE_F_ALTA',ptInput);
         stpModSiebLi.Params.CreateParam(ftString,'PE_CVE_USU_ALTA',ptInput);
         stpModSiebLi.Params.CreateParam(ftFloat,'PE_ID_EMPRESA',ptInput);
         stpModSiebLi.Params.CreateParam(ftFloat,'PS_ID_SOLICITUD_NV',ptOutput);
         stpModSiebLi.Params.CreateParam(ftFloat,'PS_RESULTADO',ptOutput);
         stpModSiebLi.Params.CreateParam(ftString,'PS_TX_RESULTADO',ptOutput);

         stpModSiebLi.ParamByName('PE_ID_SOLICITUD').AsFloat := Objeto.ID_SOLICITUD.AsFloat;
         stpModSiebLi.ParamByName('PE_ID_CONTRATO').AsFloat := Objeto.ID_CONTRATO.AsFloat;
         stpModSiebLi.ParamByName('PE_F_ALTA').AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
         stpModSiebLi.ParamByName('PE_CVE_USU_ALTA').AsString := Objeto.Apli.Usuario;
         stpModSiebLi.ParamByName('PE_ID_EMPRESA').AsFloat := Objeto.Apli.IdEmpresa;

         stpModSiebLi.ExecProc;

         If stpModSiebLi.ParamByName('PS_RESULTADO').AsFloat = 0 Then Begin
            Objeto.FindKey([stpModSiebLi.ParamByName('PS_ID_SOLICITUD_NV').AsString]);
            Objeto.Modifica;
         End Else Begin
             ShowMessage('ERROR: ' + IntToStr(stpModSiebLi.ParamByName('PS_RESULTADO').AsInteger)+
                          stpModSiebLi.ParamByName('PS_TX_RESULTADO').AsString);
         End;
      Finally
         If stpModSiebLi <> Nil Then Begin
            stpModSiebLi.UnPrepare;
            stpModSiebLi.Free;
         End;
      End;
   End Else Begin
      ShowMessage('El estímulo SIEBAN sólo puede modificarse en situación Activo');
   End;
end;

End.
