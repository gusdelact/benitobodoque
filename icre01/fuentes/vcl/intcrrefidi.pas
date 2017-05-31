// Sistema         : Clase de CR_FID_RELDISP
// Fecha de Inicio : 21/07/2005
// Función forma   : Clase de CR_FID_RELDISP
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrReFiDi;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,

IntParamCre,
IntGenCre,
IntSICC,
IntCrCredito,  // Alta de Disposición
IntCrFidMae   // Alta de FIDEICOMISO Maestro
;

const
 CO_CRREFDDI = 'CRREFDDI'; // Fol. Relación FIDEICOMISO Maestro-Disposición

Type
 TCrReFiDi= class;

  TWCrRelFidDisp=Class(TForm)
    InterForma1             : TInterForma;
    lbID_CREDITO : TLabel;
    edID_CREDITO : TEdit;
    lbID_FID_MAESTRO : TLabel;
    edID_FID_MAESTRO : TEdit;
    lbF_ALTA: TLabel;
    lbF_MODIFICA: TLabel;
    LBCVE_USU_ALTA: TLabel;
    lbCVE_USU_MODIFICA: TLabel;
    edF_ALTA: TEdit;
    edF_MODIFICA: TEdit;
    edCVE_USU_ALTA: TEdit;
    edCVE_USU_MODIFICA: TEdit;
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
    btID_FID_MAESTRO: TBitBtn;
    edNOM_ACREDITADO: TEdit;
    btID_CREDITO: TBitBtn;
    ilID_CREDITO: TInterLinkit;
    ilID_FID_MAESTRO: TInterLinkit;
    btnVerFIDEICOMISO: TButton;
    btnCancela: TBitBtn;
    lbPCT_TASA_ADIC: TLabel;
    edPCT_TASA_ADIC: TInterEdit;
    rgSIT_FID_REL_DISP: TRadioGroup;
    edID_FID_REL_DISP: TEdit;
    lbID_FID_REL_DISP: TLabel;
    btnVerCredito: TButton;
    lbNUM_FOL_ADHESION: TLabel;
    edNUM_FOL_ADHESION: TEdit;
    lbNOM_FIDEICOMITEN: TLabel;
    edNOM_FIDEICOMITEN: TEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btID_CREDITOClick(Sender: TObject);
    procedure btID_FID_MAESTROClick(Sender: TObject);
    procedure ilID_CREDITOCapture(Sender: TObject; var Show: Boolean);
    procedure ilID_CREDITOEjecuta(Sender: TObject);
    procedure ilID_FID_MAESTROEjecuta(Sender: TObject);
    procedure btnVerFIDEICOMISOClick(Sender: TObject);
    procedure btnCancelaClick(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1AntesNuevo(Sender: TObject;
      var Realizado: Boolean);
    procedure InterForma1Buscar(Sender: TObject);
    procedure edID_CREDITOExit(Sender: TObject);
    procedure edID_FID_MAESTROExit(Sender: TObject);
    procedure btnVerFIDEICOMISOExit(Sender: TObject);
    procedure rgSIT_FID_REL_DISPExit(Sender: TObject);
    procedure edPCT_TASA_ADICExit(Sender: TObject);
    procedure btnVerCreditoExit(Sender: TObject);
    procedure btnVerCreditoClick(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrReFiDi;

    procedure MuestraNomAcreditado;
    function ExisteRelFideicomisoDisposicion(peID_FID_REL_DISP, peID_CREDITO, peID_FID_MAESTRO : Integer) : Boolean;
    procedure ObtenFideicomisoDisposicion(peID_CREDITO : Integer; var psID_FID_MAESTRO : Integer;
                                          var psNUM_FOL_ADHESION : String);
    function StpActTasaFidSolPago( peID_FID_REL_DISP    : Integer;
                                   pePCT_TASA_ADIC      : Double;
                                   peB_COMMIT           : String;
                                   var psRESULTADO      : Integer;
                                   var psTX_RESULTADO   : String;
                                   pebMuestraError      : Boolean
                                ) : Boolean;

    function StpAltaFidSolCuota( peID_CREDITO         : Integer;
                                 peNUM_PERIODO        : Integer;
                                 peB_COMMIT           : String;
                                 var psRESULTADO      : Integer;
                                 var psTX_RESULTADO   : String;
                                 pebMuestraError      : Boolean
                                ) : Boolean;

    function AltaSolicitudCuota : Boolean;

end;
 TCrReFiDi= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ParamCre : TParamCre;
        Credito : TCrCredito;
        Fideicomiso : TCrFidMae;

        ID_FID_REL_DISP          : TInterCampo;
        ID_CREDITO               : TInterCampo;
        PCT_TASA_ADIC            : TInterCampo;
        ID_FID_MAESTRO           : TInterCampo;
        SIT_FID_REL_DISP         : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        F_MODIFICA               : TInterCampo;
        NOM_ACREDITADO           : TInterCampo;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;

implementation
{$R *.DFM}

constructor TCrReFiDi.Create( AOwner : TComponent );
begin Inherited;
      ID_FID_REL_DISP :=CreaCampo('ID_FID_REL_DISP',ftFloat,tsNinguno,tsNinguno,True);
                ID_FID_REL_DISP.Caption:='Número de Rel Fid Disp';
      ID_CREDITO :=CreaCampo('ID_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CREDITO.Caption:='Número de Credito';
      ID_FID_MAESTRO :=CreaCampo('ID_FID_MAESTRO',ftFloat,tsNinguno,tsNinguno,True);
                ID_FID_MAESTRO.Caption:='Número de Fid Maestro';
      PCT_TASA_ADIC :=CreaCampo('PCT_TASA_ADIC',ftFloat,tsNinguno,tsNinguno,True);
                PCT_TASA_ADIC.Caption:='Porcentaje de Tasa';
      SIT_FID_REL_DISP :=CreaCampo('SIT_FID_REL_DISP',ftString,tsNinguno,tsNinguno,True);
                SIT_FID_REL_DISP.Caption:='Situación Rel Fid Disp';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      NOM_ACREDITADO :=CreaCampo('NOM_ACREDITADO',ftString,tsNinguno,tsNinguno,False);
      FKeyFields.Add('ID_FID_REL_DISP');

      With SIT_FID_REL_DISP do
        Begin
        Size:=3;
        UseCombo:=True;
        ComboLista.Add('0'); ComboDatos.Add(CSIT_AC);
        ComboLista.Add('1'); ComboDatos.Add(CSIT_CA);
        End;

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
      Credito.FieldByName('ID_CREDITO').MasterField := 'ID_CREDITO';
      Credito.BuscaWhereString := ' CR_CREDITO.SIT_CREDITO = '+SQLStr(CSIT_AC)+coCRLF+
                                  ' AND CR_CREDITO.ID_CONTRATO IN ( SELECT CO.ID_CONTRATO'+coCRLF+
                                  '                             FROM CR_CONTRATO CO,'+coCRLF+
                                  '                                 (SELECT CVE_PRODUCTO_CRE FROM CR_PRODUCTO WHERE CVE_PRODUCTO_GPO = '+SQLStr('GOBMUN')+') GYM'+coCRLF+
                                  '                             WHERE CO.CVE_PRODUCTO_CRE = GYM.CVE_PRODUCTO_CRE'+coCRLF+
                                  '                           )'+coCRLF
                                 ;
      Credito.FilterString := Credito.BuscaWhereString;

      Fideicomiso := TCrFidMae.Create(Self);
      Fideicomiso.MasterSource:=Self;
      Fideicomiso.FieldByName('ID_FID_MAESTRO').MasterField := 'ID_FID_MAESTRO';
      Fideicomiso.BuscaWhereString := '  PKGCRGYM.GET_ES_VALIDO_FIDEICOMISO(CR_FID_MAESTRO.ID_FID_MAESTRO) = '+SQLStr(CVERDAD)+coCRLF+
                                      '  AND CR_FID_MAESTRO.SIT_FID_MAESTRO <> '+SQLStr(CSIT_CA)+coCRLF;
      Fideicomiso.FilterString := Fideicomiso.BuscaWhereString;

      TableName := 'CR_FID_REL_DISP';
      UseQuery := True;
      HelpFile := 'IntCrReFiDi.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrReFiDi.Destroy;
begin
  If Assigned(Credito) Then Credito.Free;
  If Assigned(Fideicomiso) Then Fideicomiso.Free;
  inherited;
end;

function TCrReFiDi.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrRelFidDisp;
begin
   W:=TWCrRelFidDisp.Create(Self);
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


Function TCrReFiDi.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrReFD.it','F');
      Try if Active then begin T.Param(0,ID_FID_REL_DISP.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA CR_FID_RELDISP********************)
(*                                                                              *)
(*  FORMA DE CR_FID_RELDISP                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_FID_RELDISP********************)

procedure TWCrRelFidDisp.FormShow(Sender: TObject);
begin
  With Objeto Do
   Begin
   lbDempresa.Caption := ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := ParamCre.FECHA.AsString;
   lbDUsuario.Caption := ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

   ID_FID_REL_DISP.Control    := edID_FID_REL_DISP;
   ID_CREDITO.Control         := edID_CREDITO;
   PCT_TASA_ADIC.Control      := edPCT_TASA_ADIC;
   ID_FID_MAESTRO.Control     := edID_FID_MAESTRO;
   SIT_FID_REL_DISP.Control   := rgSIT_FID_REL_DISP;
   CVE_USU_ALTA.Control       := edCVE_USU_ALTA;
   F_ALTA.Control             := edF_ALTA;
   CVE_USU_MODIFICA.Control   := edCVE_USU_MODIFICA;
   F_MODIFICA.Control         := edF_MODIFICA;

   Credito.ID_CREDITO.Control := edID_CREDITO;
   NOM_ACREDITADO.Control     := edNOM_ACREDITADO;

   Fideicomiso.ID_FID_MAESTRO.Control := edID_FID_MAESTRO;
   Fideicomiso.NUM_FOL_ADHESION.Control := edNUM_FOL_ADHESION;
   Fideicomiso.NOM_FIDEICOMITEN.Control := edNOM_FIDEICOMITEN;

   Interforma1.MsgPanel := MsgPanel;
   MuestraNomAcreditado;
   End;
end;

procedure TWCrRelFidDisp.FormDestroy(Sender: TObject);
begin
  With Objeto Do
   Begin
   ID_FID_REL_DISP.Control    := Nil;
   ID_CREDITO.Control         := Nil;
   PCT_TASA_ADIC.Control      := Nil;
   ID_FID_MAESTRO.Control     := Nil;
   SIT_FID_REL_DISP.Control   := Nil;
   CVE_USU_ALTA.Control       := Nil;
   F_ALTA.Control             := Nil;
   CVE_USU_MODIFICA.Control   := Nil;
   F_MODIFICA.Control         := Nil;

   Credito.ID_CREDITO.Control := Nil;
   NOM_ACREDITADO.Control     := Nil;

   Fideicomiso.ID_FID_MAESTRO.Control := Nil;
   Fideicomiso.NUM_FOL_ADHESION.Control := Nil;
   Fideicomiso.NOM_FIDEICOMITEN.Control := Nil;   

   Interforma1.MsgPanel := Nil;
   End;
end;

procedure TWCrRelFidDisp.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrRelFidDisp.InterForma1DespuesNuevo(Sender: TObject);
begin If edID_FID_MAESTRO.CanFocus Then edID_FID_MAESTRO.SetFocus;
      Objeto.SIT_FID_REL_DISP.AsString := CSIT_AC;
end;

procedure TWCrRelFidDisp.InterForma1DespuesModificar(Sender: TObject);
begin If btnVerFIDEICOMISO.CanFocus Then btnVerFIDEICOMISO.SetFocus;
end;

procedure TWCrRelFidDisp.MuestraNomAcreditado;
var vlstrNOM_ACREDITADO : String;
begin
  With Objeto Do
   If Active Then
    Begin
    GetSQLStr('SELECT SUBSTR(PKGCRSICC.STP_OBT_NOM_TITULAR_2('+Credito.ID_CREDITO.AsString+', NULL, NULL),1,255) AS NOM_ACREDITADO FROM DUAL',
              Apli.DatabaseName, Apli.SessionName, 'NOM_ACREDITADO', vlstrNOM_ACREDITADO, False
             );
    NOM_ACREDITADO.AsString := vlstrNOM_ACREDITADO;
    End;
end;

procedure TWCrRelFidDisp.btID_CREDITOClick(Sender: TObject);
begin
 With Objeto Do
  Begin
  If Credito.Busca Then
   Begin
   MuestraNomAcreditado;
   If edPCT_TASA_ADIC.CanFocus Then edPCT_TASA_ADIC.SetFocus;
   End;
  End;
end;

procedure TWCrRelFidDisp.btID_FID_MAESTROClick(Sender: TObject);
begin
 With Objeto Do
  Begin
  Fideicomiso.ShowAll := True;
  If Fideicomiso.Busca Then
   If edID_CREDITO.CanFocus Then edID_CREDITO.SetFocus;
  End;
end;

procedure TWCrRelFidDisp.ilID_CREDITOCapture(Sender: TObject;
  var Show: Boolean);
begin
 Show := True;
end;

procedure TWCrRelFidDisp.ilID_CREDITOEjecuta(Sender: TObject);
begin
 With Objeto Do
  Begin
  If Credito.FindKey([ilID_CREDITO.Buffer]) Then
   Begin
   If edPCT_TASA_ADIC.CanFocus Then edPCT_TASA_ADIC.SetFocus;
   MuestraNomAcreditado;
   End;
  End;
end;

procedure TWCrRelFidDisp.ilID_FID_MAESTROEjecuta(Sender: TObject);
begin
 With Objeto Do
  Begin
  If Fideicomiso.FindKey([ilID_FID_MAESTRO.Buffer]) Then
   If edID_CREDITO.CanFocus Then edID_CREDITO.SetFocus;
  End;
end;

procedure TWCrRelFidDisp.btnVerFIDEICOMISOClick(Sender: TObject);
begin
 With Objeto Do
  If (Fideicomiso.ID_FID_MAESTRO.AsInteger = 0) Then
    MessageDlg('Con esta opción usted puede ver el contenido del Fideicomiso ligado a la disposición, '+coCRLF+
               'pero para ello debe indicarlo antes de consultarlo.', mtInformation, [mbOk], 0)
  Else
    Begin
    Fideicomiso.ParamCre := ParamCre;
    Fideicomiso.Consulta;
    End;
end;

procedure TWCrRelFidDisp.btnCancelaClick(Sender: TObject);
begin
  With Objeto Do
   Begin
     If (ID_FID_REL_DISP.AsInteger = 0) Then
      MessageDlg('Con esta opción usted puede cancelar una "'+Caption+'",'+coCRLF+
                 'pero para ello debe de primero seleccionar esta con el botón de "Buscar" y posteriormente cancelarla.',
                 mtInformation, [mbOk], 0)
     Else
      Begin
        If (MessageDlg('¿Desea cancelar la '+Caption+'?',
                       mtConfirmation, [mbYes, mbNo], 0) = mrYes) Then
          Begin
          Edit;
          SIT_FID_REL_DISP.AsString := CSIT_CA;
          CVE_USU_MODIFICA.AsString := DameUsuario;
          F_MODIFICA.AsDateTime := Apli.DameFechaEmpresa;
          Post;
          btnCancela.Enabled := False;
          End;
      End;
  End;
end;

function TWCrRelFidDisp.ExisteRelFideicomisoDisposicion(peID_FID_REL_DISP, peID_CREDITO, peID_FID_MAESTRO : Integer) : Boolean;
var vlstrSQL : String;
    vlnTOTAL : Integer;
begin
  vlstrSQL := '  SELECT COUNT(*) AS TOTAL FROM CR_FID_REL_DISP'+coCRLF+
              '  WHERE ID_CREDITO = '+IntToStr(peID_CREDITO)+coCRLF+
              '    AND ID_FID_MAESTRO = '+IntToStr(peID_FID_MAESTRO)+coCRLF+
              '    AND ID_FID_REL_DISP <> '+IntToStr(peID_FID_REL_DISP)+coCRLF+
              '    AND SIT_FID_REL_DISP <> '+SQLStr(CSIT_CA)+coCRLF
              ;
  GetSQLInt(vlstrSQL, Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, 'TOTAL', vlnTOTAL, True);
  Result := vlnTOTAL > 0;
end;

procedure TWCrRelFidDisp.ObtenFideicomisoDisposicion(peID_CREDITO : Integer;
                         var psID_FID_MAESTRO : Integer; var psNUM_FOL_ADHESION : String);
var vlstrSQL : String;
    vlQry : TQuery;
begin
  psID_FID_MAESTRO    := 0;
  psNUM_FOL_ADHESION  := '';
  vlstrSQL := ' SELECT CFM.ID_FID_MAESTRO, CFM.NUM_FOL_ADHESION'+coCRLF+
              ' FROM CR_FID_MAESTRO CFM,'+coCRLF+
              '    ( SELECT ID_FID_MAESTRO FROM CR_FID_REL_DISP'+coCRLF+
              '      WHERE ID_CREDITO = '+IntToStr(peID_CREDITO)+coCRLF+
              '        AND SIT_FID_REL_DISP <> '+SQLStr(CSIT_CA)+coCRLF+
              '    ) CRFD'+coCRLF+
              ' WHERE CFM.ID_FID_MAESTRO = CRFD.ID_FID_MAESTRO'+coCRLF+
              '  AND CFM.SIT_FID_MAESTRO <> '+SQLStr(CSIT_CA)+coCRLF
              ;
  vlQry := GetSQLQuery(vlstrSQL, Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, True);
  If Assigned(vlQry) Then
   With vlQry Do
    Try
     psID_FID_MAESTRO   := FieldByName('ID_FID_MAESTRO').AsInteger;
     psNUM_FOL_ADHESION := FieldByName('NUM_FOL_ADHESION').AsString;
    Finally
     vlQry.Close;
     vlQry.Free;
    End;
end;

function TWCrRelFidDisp.StpActTasaFidSolPago(  peID_FID_REL_DISP    : Integer;
                                               pePCT_TASA_ADIC      : Double;
                                               peB_COMMIT           : String;
                                               var psRESULTADO      : Integer;
                                               var psTX_RESULTADO   : String;
                                               pebMuestraError      : Boolean
                                             ) : Boolean;
var Stp : TStoredProc;
    vlbResult : Boolean;
begin
  vlbResult := False;
  Stp :=  TStoredProc.Create(Nil);
  If Assigned(Stp) Then
    With Stp Do
     Try
       StoredProcName := 'PKGCRGYM.STP_ACT_TASA_FID_SOL_PAGO';
       DataBaseName   := Objeto.Apli.DataBaseName;
       SessionName    := Objeto.Apli.SessionName;
       Params.CreateParam(ftInteger ,'peID_FID_REL_DISP' ,ptInput);
       Params.CreateParam(ftFloat   ,'pePCT_TASA_ADIC'   ,ptInput);
       Params.CreateParam(ftDateTime,'peF_REFERENCIA'    ,ptInput);
       Params.CreateParam(ftString  ,'peCVE_USU_MODIFICA',ptInput);
       Params.CreateParam(ftDateTime,'peF_MODIFICA'      ,ptInput);
       Params.CreateParam(ftString  ,'peB_COMMIT'        ,ptInput);
       Params.CreateParam(ftInteger ,'psRESULTADO'       ,ptOutput);
       Params.CreateParam(ftString  ,'psTX_RESULTADO'    ,ptOutput);

       ParamByName('peID_FID_REL_DISP').AsInteger := peID_FID_REL_DISP;
       ParamByName('pePCT_TASA_ADIC').AsFloat     := pePCT_TASA_ADIC;
       ParamByName('peF_REFERENCIA').AsDateTime   := Objeto.Apli.DameFechaEmpresa;
       ParamByName('peCVE_USU_MODIFICA').AsString := Objeto.Apli.Usuario;
       ParamByName('peF_MODIFICA').AsDateTime     := Objeto.Apli.DameFechaEmpresa;
       ParamByName('peB_COMMIT').AsString         := peB_COMMIT;
       ExecProc;

       psRESULTADO      := ParamByName('psRESULTADO').AsInteger     ;
       psTX_RESULTADO   := ParamByName('psTX_RESULTADO').AsString   ;

       If (psRESULTADO <> 0) Then
        If (pebMuestraError) Then
          MessageDlg(psTX_RESULTADO ,mtError, [mbOk], 0);

       vlbResult := (psRESULTADO = 0);
     Finally
       Stp.Params.Clear;
       Stp.Free;
     End;
     Result := vlbResult;
end;

function TWCrRelFidDisp.StpAltaFidSolCuota( peID_CREDITO         : Integer;
                                            peNUM_PERIODO        : Integer;
                                            peB_COMMIT           : String;
                                            var psRESULTADO      : Integer;
                                            var psTX_RESULTADO   : String;
                                            pebMuestraError      : Boolean
                                          ) : Boolean;
var Stp : TStoredProc;
    vlbResult : Boolean;
begin
  vlbResult := False;
  Stp :=  TStoredProc.Create(Nil);
  If Assigned(Stp) Then
    With Stp Do
     Try
       StoredProcName := 'PKGCRGYM.STP_ALTA_FID_SOL_CUOTA';
       DataBaseName   := Objeto.Apli.DataBaseName;
       SessionName    := Objeto.Apli.SessionName;
       Params.CreateParam(ftInteger ,'peID_CREDITO'      ,ptInput);
       Params.CreateParam(ftInteger ,'peNUM_PERIODO'     ,ptInput);
       Params.CreateParam(ftDateTime,'peF_REFERENCIA'    ,ptInput);
       Params.CreateParam(ftString  ,'peCVE_USU_ALTA'    ,ptInput);
       Params.CreateParam(ftDateTime,'peF_ALTA'          ,ptInput);
       Params.CreateParam(ftString  ,'peB_COMMIT'        ,ptInput);
       Params.CreateParam(ftInteger ,'psRESULTADO'       ,ptOutput);
       Params.CreateParam(ftString  ,'psTX_RESULTADO'    ,ptOutput);

       ParamByName('peID_CREDITO').AsInteger      := peID_CREDITO;
       ParamByName('peNUM_PERIODO').AsInteger     := peNUM_PERIODO;
       ParamByName('peF_REFERENCIA').AsDateTime   := Objeto.Apli.DameFechaEmpresa;
       ParamByName('peCVE_USU_ALTA').AsString     := Objeto.Apli.Usuario;
       ParamByName('peF_ALTA').AsDateTime         := Objeto.Apli.DameFechaEmpresa;
       ParamByName('peB_COMMIT').AsString         := peB_COMMIT;
       ExecProc;

       psRESULTADO      := ParamByName('psRESULTADO').AsInteger     ;
       psTX_RESULTADO   := ParamByName('psTX_RESULTADO').AsString   ;

       If (psRESULTADO <> 0) Then
        If (pebMuestraError) Then
          MessageDlg(psTX_RESULTADO ,mtError, [mbOk], 0);

       vlbResult := (psRESULTADO = 0);
     Finally
       Stp.Params.Clear;
       Stp.Free;
     End;
     Result := vlbResult;
end;

function TWCrRelFidDisp.AltaSolicitudCuota : Boolean;
var vlNUM_PERIODO : Integer;
    vlRESULTADO : Integer;
    vlTX_RESULTADO : String;
begin
Result := False;
 With Objeto Do
  If GetSQLInt('SELECT NUM_PERIODO FROM CR_CAPITAL WHERE ID_CREDITO = '+ID_CREDITO.AsString+' AND SIT_CAPITAL = '+SQLStr(CSIT_AC),
                Apli.DatabaseName, Apli.SessionName, 'NUM_PERIODO', vlNUM_PERIODO, True) Then
    Begin
    Result := StpAltaFidSolCuota( ID_CREDITO.AsInteger,
                                  vlNUM_PERIODO,
                                  CVERDAD,
                                  vlRESULTADO,
                                  vlTX_RESULTADO,
                                  True
                                );
    End;
end;

procedure TWCrRelFidDisp.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
var vlstrMessage, vlNUM_FOL_ADHESION : String;
    mrResult : Word;
    vlRESULTADO, vlID_FID_MAESTRO : Integer;
    vlTX_RESULTADO : String;
begin
 Realizado := False;
 ObtenFideicomisoDisposicion(Objeto.Credito.ID_CREDITO.AsInteger, vlID_FID_MAESTRO, vlNUM_FOL_ADHESION);
 With Objeto Do
   If (ExisteRelFideicomisoDisposicion(ID_FID_REL_DISP.AsInteger,
                                       Credito.ID_CREDITO.AsInteger,
                                       Fideicomiso.ID_FID_MAESTRO.AsInteger)) Then
     Begin
     MessageDlg('La relación indicada ya fue dada de alta con anterioridad. Verifique.',
                mtWarning, [mbOk], 0);
     Realizado := False;
     End
   Else If (vlID_FID_MAESTRO <> Fideicomiso.ID_FID_MAESTRO.AsInteger) And (vlID_FID_MAESTRO > 0) Then
     Begin
     MessageDlg('La disposición ya fué anteriormente relacionada con el Fideicomiso "'+vlNUM_FOL_ADHESION+'". Verifique.',
                mtWarning, [mbOk], 0);
     End
   Else
    Begin
     PCT_TASA_ADIC.GetFromControl;

     If IsNewData Then vlstrMessage := CCONFIRM_ALMACENA_INS
     Else vlstrMessage := CCONFIRM_ALMACENA_MOD;
     mrResult := MessageDlg(vlstrMessage, mtConfirmation, [mbYes, mbNo], 0);
       If (mrResult = mrYes) Then
        Begin
          If (IsNewData) Then
           Begin
           ID_FID_REL_DISP.AsInteger := ObtenFolio(CO_CRREFDDI, 'Problemas al Obtener el folio '+CO_CRREFDDI,Objeto.Apli);
           F_ALTA.AsDateTime         := Apli.DameFechaEmpresa;
           CVE_USU_ALTA.AsString     := Apli.Usuario;
           Realizado := True;
           End
          Else
           Begin
           F_MODIFICA.AsDateTime     := Apli.DameFechaEmpresa;
           CVE_USU_MODIFICA.AsString := Apli.Usuario;
           // Actualiza la tasa de todas las solicitudes generadas para esa disposición
           Realizado := StpActTasaFidSolPago(ID_FID_REL_DISP.AsInteger,
                                             PCT_TASA_ADIC.AsFloat,
                                             CVERDAD,
                                             vlRESULTADO,
                                             vlTX_RESULTADO,
                                             True);
           End;
         End;
    End;
end;

procedure TWCrRelFidDisp.InterForma1AntesNuevo(Sender: TObject;
  var Realizado: Boolean);
begin
 Objeto.Active := False;
end;

procedure TWCrRelFidDisp.InterForma1Buscar(Sender: TObject);
begin
 With Objeto Do
  If InternalBusca Then
   Begin
   MuestraNomAcreditado;
   btnCancela.Enabled := SIT_FID_REL_DISP.AsString = CSIT_AC;
   End;
end;

procedure TWCrRelFidDisp.edID_CREDITOExit(Sender: TObject);
var vlstrMsg : String;
begin
 With Objeto Do
  If (Modo = moAppend) Or (Modo = moEdit) Then
   Begin
   vlstrMsg := '';
   If (Trim(edID_CREDITO.Text) = '') Then vlstrMsg := 'Favor de indicar el '+lbID_CREDITO.Caption;
   InterForma1.ValidaExit((Sender As TWinControl), (vlstrMsg = ''), vlstrMsg,True);
   End;
end;

procedure TWCrRelFidDisp.edID_FID_MAESTROExit(Sender: TObject);
var vlstrMsg : String;
begin
 With Objeto Do
  If (Modo = moAppend) Or (Modo = moEdit) Then
   Begin
   vlstrMsg := '';
   If (Trim(edID_FID_MAESTRO.Text) = '') Then vlstrMsg := 'Favor de indicar el '+lbID_FID_MAESTRO.Caption;
   InterForma1.ValidaExit((Sender As TWinControl), (vlstrMsg = ''), vlstrMsg,True);
   End;
end;

procedure TWCrRelFidDisp.btnVerFIDEICOMISOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(btnVerFIDEICOMISO, True, '',True);
end;

procedure TWCrRelFidDisp.rgSIT_FID_REL_DISPExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_FID_REL_DISP, True, '',True);
end;

procedure TWCrRelFidDisp.edPCT_TASA_ADICExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edPCT_TASA_ADIC, True, '',True);
end;

procedure TWCrRelFidDisp.btnVerCreditoExit(Sender: TObject);
begin
   InterForma1.ValidaExit(btnVerCredito, True, '',True);
end;

procedure TWCrRelFidDisp.btnVerCreditoClick(Sender: TObject);
begin
 With Objeto Do
  If (Credito.ID_CREDITO.AsInteger = 0) Then
    MessageDlg('Con esta opción usted puede ver la disposición, pero para ello debe indicar'+coCRLF+
               'el No. de la disposición antes de consultarla.', mtInformation, [mbOk], 0)
  Else
    Begin
    Credito.ParamCre := ParamCre;
    Credito.Consulta;
    End;
end;

procedure TWCrRelFidDisp.InterForma1DespuesAceptar(Sender: TObject);
begin
 AltaSolicitudCuota;
end;

end.






