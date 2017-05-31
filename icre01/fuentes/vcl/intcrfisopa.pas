// Sistema         : Clase de CR_FID_SOL_PAGO
// Fecha de Inicio : 25/07/2005
// Función forma   : Clase de CR_FID_SOL_PAGO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrFiSoPa;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntSGCtrl, IntLinkit,
UCrpe32, NMsmtp, InterApl, Menus,

IntParamCre,
IntGenCre,
IntSICC,
IntCrFidMae,     // Alta FIDEICOMISO Maestro
IntCrAcredit,    // Alta Acreditado
IntCrCredito,    // Alta Disposición
IntCrReFiDi
;

const
{ CO_PLANTILLA_SOL_PAGO    = 'O:\Delphide\ICre01\Reportes\Plantilla_SolPago.html';
  CO_PLANTILLA_SOL_DETALLE = 'O:\Delphide\ICre01\Reportes\Plantilla_SolPago_Detalle.html';
}

 CO_PLANTILLA_SOL_PAGO    = '\\Inter25\corp\Delphide\ICre01\Reportes\Plantilla_SolPago.html';
 CO_PLANTILLA_SOL_DETALLE = '\\Inter25\corp\Delphide\ICre01\Reportes\Plantilla_SolPago_Detalle.html';

// Campos a Sustituir
 CO_NOM_DESTINATARIO   = 'NOM_DESTINATARIO';
 CO_FIDEICOMISO        = 'FIDEICOMISO';
 CO_NUM_FOLIO          = 'NUM_FOLIO';
 CO_NOM_ACREDITADO     = 'NOM_ACREDITADO';
 CO_ID_CREDITO         = 'ID_CREDITO';
 CO_NUM_PERIODO        = 'NUM_PERIODO';
 CO_F_VENCIMIENTO      = 'F_VENCIMIENTO';
 CO_F_MAX_SOLICITAR    = 'F_MAX_SOLICITAR';

 // Ubicación de Inserción de Código
 CO_CODE_DETALLE       = 'CODE_DETALLE';
 
Type
 TCrFiSoPa= class;

  TWCrFidSolPago=Class(TForm)
    InterForma1             : TInterForma;
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
    btIMPRIMIR: TBitBtn;
    sgcDATA: TSGCtrl;
    edID_FID_MAESTRO: TEdit;
    btID_FID_MAESTRO: TBitBtn;
    edNOM_FIDEICOMITEN: TEdit;
    edID_ACREDITADO: TEdit;
    btID_ACREDITADO: TBitBtn;
    edNOM_ACREDITADO1: TEdit;
    edID_CREDITO: TEdit;
    btID_CREDITO: TBitBtn;
    edNOM_ACREDITADO2: TEdit;
    cbxID_FID_MAESTRO: TCheckBox;
    cbxID_ACREDITADO: TCheckBox;
    cbxID_CREDITO: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btBusca: TBitBtn;
    edNUM_FOL_ADHESION: TEdit;
    lbNUM_FOL_ADHESION: TLabel;
    lbNOM_FIDEICOMITEN: TLabel;
    ilID_FID_MAESTRO: TInterLinkit;
    ilID_ACREDITADO: TInterLinkit;
    ilID_CREDITO: TInterLinkit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    rgFitroImpreso: TRadioGroup;
    Button1: TButton;
    PopupMenu1: TPopupMenu;
    SaveQryToFile1: TMenuItem;
    PopupMenu2: TPopupMenu;
    R1: TMenuItem;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure ilID_FID_MAESTROCapture(Sender: TObject; var Show: Boolean);
    procedure btID_FID_MAESTROClick(Sender: TObject);
    procedure btID_ACREDITADOClick(Sender: TObject);
    procedure btID_CREDITOClick(Sender: TObject);
    procedure ilID_FID_MAESTROEjecuta(Sender: TObject);
    procedure ilID_ACREDITADOEjecuta(Sender: TObject);
    procedure ilID_CREDITOEjecuta(Sender: TObject);
    procedure btBuscaClick(Sender: TObject);
    procedure cbxID_FID_MAESTROClick(Sender: TObject);
    procedure cbxID_ACREDITADOClick(Sender: TObject);
    procedure cbxID_CREDITOClick(Sender: TObject);
    procedure btIMPRIMIRClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SaveQryToFile1Click(Sender: TObject);
    procedure R1Click(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrFiSoPa;

    procedure BuscaDisposicion;
    procedure MuestraDatos;
    procedure Imprime( peID_FID_SOL_PAGO : Integer);

end;
 TCrFiSoPa= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        ParamCre : TParamCre;
        Fideicomiso : TCrFidMae;
        Acreditado  : TCrAcredit;
        Credito     : TCrCredito;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;


procedure EnviaCorreos_SolicitudPago( peApli : TInterApli);

function MakeBodyMail(peNOM_DESTINATARIO, peDETALLE : String) : String;

function GetDetailofMail : String;

function ReplaceVariablesfromEmail( peStrDetail : String;
                                    peFIDEICOMISO, peNUM_FOLIO,
                                    peNOM_ACREDITADO, peID_CREDITO,
                                    peNUM_PERIODO, peF_VENCIMIENTO,
                                    peF_MAX_SOLICITAR : String
                                   ) : String;

implementation

uses IntMQrFiSoPa;   // Solicitud de Pago

{$R *.DFM}
constructor TCrFiSoPa.Create( AOwner : TComponent );
begin Inherited;
      Fideicomiso := TCrFidMae.Create(Self);
      Fideicomiso.MasterSource:=Self;

      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource:=Self;

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
      Credito.BuscaWhereString := ' CR_CREDITO.ID_CONTRATO IN ( SELECT CO.ID_CONTRATO'+coCRLF+
                                  '                             FROM CR_CONTRATO CO,'+coCRLF+
                                  '                                 (SELECT CVE_PRODUCTO_CRE FROM CR_PRODUCTO WHERE CVE_PRODUCTO_GPO = '+SQLStr('GOBMUN')+') GYM'+coCRLF+
                                  '                             WHERE CO.CVE_PRODUCTO_CRE = GYM.CVE_PRODUCTO_CRE'+coCRLF+
                                  '                           )'+coCRLF
                                 ;

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrFiSoPa.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrFiSoPa.Destroy;
begin
 If Assigned(Fideicomiso) Then Fideicomiso.Free;
 If Assigned(Acreditado) Then Acreditado.Free;
 If Assigned(Credito) Then Credito.Free;
inherited;
end;

function TCrFiSoPa.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrFidSolPago;
begin
   W:=TWCrFidSolPago.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftConsulta; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

Function TCrFiSoPa.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrFiSP.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA CR_FID_SOL_PAGO********************)
(*                                                                              *)
(*  FORMA DE CR_FID_SOL_PAGO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_FID_SOL_PAGO********************)

procedure TWCrFidSolPago.FormShow(Sender: TObject);
begin
  With Objeto Do
   Begin
   lbDempresa.Caption := ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := ParamCre.FECHA.AsString;
   lbDUsuario.Caption := ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

   Fideicomiso.ID_FID_MAESTRO.Control := edID_FID_MAESTRO;
   Fideicomiso.NUM_FOL_ADHESION.Control := edNUM_FOL_ADHESION;
   Fideicomiso.NOM_FIDEICOMITEN.Control := edNOM_FIDEICOMITEN;

   Acreditado.ID_ACREDITADO.Control := edID_ACREDITADO;
   Acreditado.Persona.Nombre.Control := edNOM_ACREDITADO1;

   Credito.ID_CREDITO.Control := edID_CREDITO;
   Credito.ContratoCre.Contrato.TITNombre.Control := edNOM_ACREDITADO2;

   MuestraDatos;
   End;
end;

procedure TWCrFidSolPago.FormDestroy(Sender: TObject);
begin
  With Objeto Do
   Begin
   Fideicomiso.ID_FID_MAESTRO.Control := Nil;
   Fideicomiso.NUM_FOL_ADHESION.Control := Nil;
   Fideicomiso.NOM_FIDEICOMITEN.Control := Nil;

   Acreditado.ID_ACREDITADO.Control := Nil;
   Acreditado.Persona.Nombre.Control := Nil;

   Credito.ID_CREDITO.Control := Nil;
   Credito.ContratoCre.Contrato.TITNombre.Control := Nil;
   End;
end;

procedure TWCrFidSolPago.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrFidSolPago.ilID_FID_MAESTROCapture(Sender: TObject;
  var Show: Boolean);
begin
 Show := True;
end;

procedure TWCrFidSolPago.btID_FID_MAESTROClick(Sender: TObject);
begin
 With Objeto Do
  If Fideicomiso.Busca Then
   Begin
   If edID_ACREDITADO.CanFocus Then edID_ACREDITADO.SetFocus;
   cbxID_FID_MAESTRO.Checked := True;
   cbxID_FID_MAESTRO.Enabled := True;
   End;
end;

procedure TWCrFidSolPago.btID_ACREDITADOClick(Sender: TObject);
begin
 With Objeto Do
  If Acreditado.Busca Then
   Begin
   cbxID_ACREDITADO.Checked := True;
   cbxID_ACREDITADO.Enabled := True;
   cbxID_ACREDITADOClick(Self);
   End;  
end;

procedure TWCrFidSolPago.btID_CREDITOClick(Sender: TObject);
begin
 With Objeto Do
  If Credito.Busca Then
    BuscaDisposicion;
end;

procedure TWCrFidSolPago.ilID_FID_MAESTROEjecuta(Sender: TObject);
begin
 With Objeto Do
  If Fideicomiso.FindKey([ilID_FID_MAESTRO.Buffer]) Then
   Begin
   If edID_ACREDITADO.CanFocus Then edID_ACREDITADO.SetFocus;
   cbxID_FID_MAESTRO.Checked := True;
   cbxID_FID_MAESTRO.Enabled := True;
   End;
end;

procedure TWCrFidSolPago.ilID_ACREDITADOEjecuta(Sender: TObject);
begin
 With Objeto Do
  If Acreditado.FindKey([ilID_ACREDITADO.Buffer]) Then ;
   Begin
   If edID_CREDITO.CanFocus Then edID_CREDITO.SetFocus;
   cbxID_ACREDITADO.Checked := True;
   cbxID_ACREDITADO.Enabled := True;
   End;
end;

procedure TWCrFidSolPago.ilID_CREDITOEjecuta(Sender: TObject);
begin
 With Objeto Do
  If Credito.FindKey([ilID_CREDITO.Buffer]) Then
   BuscaDisposicion;
end;

procedure TWCrFidSolPago.btBuscaClick(Sender: TObject);
begin
  MuestraDatos;
end;

procedure TWCrFidSolPago.BuscaDisposicion;
var vlID_TITULAR, vlID_FID_MAESTRO : Integer;
begin
 With Objeto Do
   Begin
   cbxID_CREDITO.Checked:=True;
   cbxID_CREDITO.Enabled:=True;
      GetSqlInt(' SELECT ID_TITULAR FROM CONTRATO '+coCRLF+
                ' WHERE ID_CONTRATO = (SELECT ID_CONTRATO FROM CR_CREDITO WHERE ID_CREDITO = '+Credito.ID_CREDITO.AsString+')',
                Apli.DatabaseName, Apli.SessionName,
                'ID_TITULAR', vlID_TITULAR, True);
   If Acreditado.FindKey([vlID_TITULAR])Then
      Begin
      cbxID_ACREDITADO.Checked:=True;
      cbxID_ACREDITADO.Enabled:=True;
      GetSqlInt(' SELECT ID_FID_MAESTRO FROM CR_FID_REL_DISP '+coCRLF+
                '  WHERE ID_CREDITO = '+Credito.ID_CREDITO.AsString+' AND SIT_FID_REL_DISP <> '+SQLStr(CSIT_CA)+coCRLF,
                Apli.DatabaseName, Apli.SessionName,
                'ID_FID_MAESTRO', vlID_FID_MAESTRO, True);
      If (vlID_FID_MAESTRO > 0) Then
        If Fideicomiso.FindKey([vlID_FID_MAESTRO]) Then
          Begin
          cbxID_FID_MAESTRO.Checked := True;
          cbxID_FID_MAESTRO.Enabled := True;
          End
        Else
          Begin
          Fideicomiso.Active := False;
          cbxID_FID_MAESTRO.Checked := False;
          cbxID_FID_MAESTRO.Enabled := False;
          End
      End;
   End;
end;

procedure TWCrFidSolPago.MuestraDatos;
Var vlSQL : String;
    vlQry : TQuery;
begin
  With Objeto Do
   Begin
   vlSQL := ' SELECT   CFD.NUM_FOL_ADHESION,'+coCRLF+
            '          CFD.NOM_FIDEICOMITEN,'+coCRLF+
            '          CFSP.ID_CREDITO,'+coCRLF+
            '          SUBSTR(PKGCRSICC.STP_OBT_NOM_TITULAR_2(CFSP.ID_CREDITO, NULL, NULL),1,255) AS NOM_TITULAR,'+coCRLF+
            '          CA.F_VENCIMIENTO,'+coCRLF+
            '          PKGCRGYM.GET_FID_FECHA_SOL_PAGO(''F_FINAL'',CFSP.ID_CREDITO, CFSP.NUM_PERIODO) AS F_MAX_SOLICITAR,'+coCRLF+
            '          CFSP.B_IMPRESO,'+coCRLF+
            '          CFSP.SDO_INSOLUTO,'+coCRLF+
            '          CFD.ID_FID_MAESTRO,'+coCRLF+
            '          CFSP.ID_FID_SOL_PAGO,'+coCRLF+
            '          CRFD.ID_FID_REL_DISP'+coCRLF+
            ' FROM CR_FID_SOL_PAGO CFSP,'+coCRLF+
            '      ( SELECT * FROM CR_FID_REL_DISP'+coCRLF+
            '        WHERE SIT_FID_REL_DISP <> ''CA'''+coCRLF+
            '      ) CRFD,'+coCRLF+
            '      ( SELECT * FROM CR_FID_MAESTRO'+coCRLF+
            '        WHERE SIT_FID_MAESTRO <> ''CA'''+coCRLF+
            '      ) CFD,'+coCRLF+
            '      CRE_CAPITAL CA, '+coCRLF+
            '      CR_CREDITO CC, '+coCRLF+
            '      CONTRATO CTO '+coCRLF+
            ' WHERE CRFD.ID_CREDITO = CFSP.ID_CREDITO'+coCRLF+
            '   AND CFD.ID_FID_MAESTRO = CRFD.ID_FID_MAESTRO'+coCRLF+
            '   AND CA.ID_CREDITO = CFSP.ID_CREDITO'+coCRLF+
            '   AND CA.NUM_PERIODO = CFSP.NUM_PERIODO'+coCRLF+
            '   AND CC.ID_CREDITO = CA.ID_CREDITO'+coCRLF+
            '   AND CTO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF
            ;

   If (Trim(Fideicomiso.ID_FID_MAESTRO.AsString) <> '') Then
            vlSQL := vlSQL + '   AND CFD.ID_FID_MAESTRO = '+Fideicomiso.ID_FID_MAESTRO.AsString+coCRLF;

   If (Trim(Acreditado.ID_ACREDITADO.AsString) <> '') Then
            vlSQL := vlSQL + '   AND CTO.ID_TITULAR = '+Acreditado.ID_ACREDITADO.AsString+coCRLF;

   If (Trim(Credito.ID_CREDITO.AsString) <> '') Then
            vlSQL := vlSQL + '   AND CFSP.ID_CREDITO = '+Credito.ID_CREDITO.AsString+coCRLF;

   Case rgFitroImpreso.ItemIndex Of
     0 : vlSQL := vlSQL + '   AND CFSP.B_IMPRESO = '+SQLStr(CVERDAD)+coCRLF;
     1 : vlSQL := vlSQL + '   AND CFSP.B_IMPRESO = '+SQLStr(CFALSO)+coCRLF;
   End;

   vlQry := GetSQLQuery(vlSQL, Apli.DataBaseName, Apli.SessionName, True );
   If Not Assigned(vlQry) Then
     sgcDATA.Clear('NO EXISTEN DATOS'#30'>C')
   Else
     Try
       sgcDATA.SG.Canvas.Font.Size := 5;
       vlQry.FieldByName('NUM_FOL_ADHESION').DisplayWidth    := 16;
       vlQry.FieldByName('NOM_FIDEICOMITEN').DisplayWidth    := 35;
       vlQry.FieldByName('ID_CREDITO').DisplayWidth          := 10;
       vlQry.FieldByName('NOM_TITULAR').DisplayWidth         := 22;
       vlQry.FieldByName('F_VENCIMIENTO').DisplayWidth       := 12;
       vlQry.FieldByName('F_MAX_SOLICITAR').DisplayWidth     := 12;
       vlQry.FieldByName('B_IMPRESO').DisplayWidth           := 7;
       vlQry.FieldByName('SDO_INSOLUTO').Visible        := False;
       vlQry.FieldByName('ID_FID_MAESTRO').Visible      := False;
       vlQry.FieldByName('ID_FID_SOL_PAGO').Visible     := False;
       vlQry.FieldByName('ID_FID_REL_DISP').Visible     := False;

       TNumericField(vlQry.FieldByName('SDO_INSOLUTO')).DisplayFormat := '###,###,###,###,###,###,##0.00';
       sgcDATA.AddQry( vlQry, True,True,-1,-1,-1,False);
     Finally
       vlQry.Close;
       vlQry.Free;
     End;
   End; 
end;

procedure TWCrFidSolPago.cbxID_FID_MAESTROClick(Sender: TObject);
begin
   If Not cbxID_FID_MAESTRO.Checked Then
     Begin
     Objeto.Fideicomiso.Active:=False;
     cbxID_FID_MAESTRO.Checked:=False;
     cbxID_FID_MAESTRO.Enabled:=False;
     End
   Else
     Begin
     cbxID_FID_MAESTRO.Checked:=True;
     cbxID_FID_MAESTRO.Enabled:=True;
    End;
end;

procedure TWCrFidSolPago.cbxID_ACREDITADOClick(Sender: TObject);
begin
   If Not cbxID_ACREDITADO.Checked Then
      Begin
      Objeto.Acreditado.Active:=False;
      cbxID_ACREDITADO.Checked:=False;
      cbxID_ACREDITADO.Enabled:=False;
      End
   Else
      Begin
      cbxID_ACREDITADO.Checked:=True;
      cbxID_ACREDITADO.Enabled:=True;
      End;
end;

procedure TWCrFidSolPago.cbxID_CREDITOClick(Sender: TObject);
begin
   If Not cbxID_CREDITO.Checked Then
      Begin
      Objeto.Credito.Active:=False;
      cbxID_CREDITO.Checked:=False;
      cbxID_CREDITO.Enabled:=False;
      End
   Else
      Begin
      cbxID_CREDITO.Checked:=True;
      cbxID_CREDITO.Enabled:=True;
      End;
end;

procedure TWCrFidSolPago.Imprime( peID_FID_SOL_PAGO : Integer);
Begin
 With Objeto Do
  // Si se imprime fisicamente y fue correcta la impresión, entonces...
  If RepFiSoPa(Apli.IdEmpresa,
               peID_FID_SOL_PAGO,
               Apli,
               True,
              SaveQryToFile1.Checked) Then
    btBuscaClick(Self);
End;

procedure TWCrFidSolPago.btIMPRIMIRClick(Sender: TObject);
var vlstrID_FID_SOL_PAGO : String;
begin
  vlstrID_FID_SOL_PAGO := sgcDATA.CellStr['ID_FID_SOL_PAGO', sgcDATA.SG.Row];
  If IsInteger(vlstrID_FID_SOL_PAGO) Then
    Imprime( StrToInt(vlstrID_FID_SOL_PAGO) );
end;

function MakeBodyMail(peNOM_DESTINATARIO, peDETALLE : String) : String;
var vlstrResult, vlstrBuffer : String;
    F : TextFile;
begin
 vlstrResult := '';
 Try
  If FileExists(CO_PLANTILLA_SOL_PAGO) Then
   Begin
   AssignFile(F, CO_PLANTILLA_SOL_PAGO);
   Reset(F);
   While Not Eof(F) Do
     Begin
     ReadLn(F, vlstrBuffer);
     vlstrBuffer := ReplaceAllStr(vlstrBuffer, CO_NOM_DESTINATARIO, peNOM_DESTINATARIO);
     vlstrBuffer := ReplaceAllStr(vlstrBuffer, CO_CODE_DETALLE, peDETALLE);
     vlstrResult := vlstrResult + vlstrBuffer;
     End;
   End;
  Finally
   CloseFile(F);
   Result := vlstrResult;
  End;
end;

function GetDetailofMail : String;
var vlstrResult, vlstrBuffer : String;
    F : TextFile;
begin
 vlstrResult := '';
 Try
  If FileExists(CO_PLANTILLA_SOL_DETALLE) Then
   Begin
   AssignFile(F, CO_PLANTILLA_SOL_DETALLE);
   Reset(F);
   While Not Eof(F) Do
     Begin
     ReadLn(F, vlstrBuffer);
     vlstrResult := vlstrResult + vlstrBuffer;
     End;
   End;
  Finally
   CloseFile(F);
   Result := vlstrResult;
  End;
end;

function ReplaceVariablesfromEmail( peStrDetail : String;
                                                   peFIDEICOMISO, peNUM_FOLIO,
                                                   peNOM_ACREDITADO, peID_CREDITO,
                                                   peNUM_PERIODO, peF_VENCIMIENTO,
                                                   peF_MAX_SOLICITAR : String
                                                 ) : String;
var vlstrResult : String;
begin
 vlstrResult := '';
 vlstrResult := ReplaceAllStr(peStrDetail, CO_FIDEICOMISO, peFIDEICOMISO);
 vlstrResult := ReplaceAllStr(vlstrResult, CO_NUM_FOLIO, peNUM_FOLIO);
 vlstrResult := ReplaceAllStr(vlstrResult, CO_NOM_ACREDITADO, peNOM_ACREDITADO);
 vlstrResult := ReplaceAllStr(vlstrResult, CO_ID_CREDITO, peID_CREDITO);
 vlstrResult := ReplaceAllStr(vlstrResult, CO_NUM_PERIODO, peNUM_PERIODO);
 vlstrResult := ReplaceAllStr(vlstrResult, CO_F_VENCIMIENTO, peF_VENCIMIENTO);
 vlstrResult := ReplaceAllStr(vlstrResult, CO_F_MAX_SOLICITAR, peF_MAX_SOLICITAR);
 Result := vlstrResult;
end;

procedure EnviaCorreos_SolicitudPago( peApli : TInterApli);
var vlQry : TQuery;
    vlstrSQL, vlstrEMAILMsg, vlstrDetail,
    vlNOM_DESTINATARIO, vlEMAIL, vlTITLE : String;
    vlACTUAL_ID_DESTINATARIO : Integer;
    vlB_URGE : Boolean;
begin
 vlstrSQL := ' SELECT  CFC.ID_PERSONA AS ID_DESTINATARIO,'+coCRLF+
             '         PKGCRSICC.STP_OBT_NOM_TITULAR_2(NULL, NULL, CFC.ID_PERSONA) AS NOM_DESTINATARIO,'+coCRLF+
             '         CFC.EMAIL,'+coCRLF+
             '         CFD.NUM_FOL_ADHESION,'+coCRLF+
             '         CFD.NOM_FIDEICOMITEN,'+coCRLF+
             '         CFSP.ID_CREDITO,'+coCRLF+
             '         SUBSTR(PKGCRSICC.STP_OBT_NOM_TITULAR_2(CFSP.ID_CREDITO, NULL, NULL),1,255) AS NOM_ACREDITADO,'+coCRLF+
             '         CA.F_VENCIMIENTO,'+coCRLF+
             '         CFSP.NUM_PERIODO,'+coCRLF+
             '         PKGCRGYM.GET_FID_FECHA_SOL_PAGO(''F_FINAL'',CFSP.ID_CREDITO, CFSP.NUM_PERIODO) AS F_MAX_SOLICITAR,'+coCRLF+
             '         CFSP.B_IMPRESO,'+coCRLF+
             '         CFSP.SDO_INSOLUTO,'+coCRLF+
             '         CFD.ID_FID_MAESTRO,'+coCRLF+
             '         CFSP.ID_FID_SOL_PAGO'+coCRLF+
             ' FROM ( SELECT * FROM CR_FID_SOL_PAGO'+coCRLF+
             '        WHERE SIT_FID_SOL_PAGO <> ''CA'''+coCRLF+
             '          AND B_IMPRESO = ''F'') CFSP,'+coCRLF+
             '      ( SELECT * FROM CR_FID_REL_DISP'+coCRLF+
             '        WHERE SIT_FID_REL_DISP <> ''CA'''+coCRLF+
             '      ) CRFD,'+coCRLF+
             '      ( SELECT * FROM CR_FID_MAESTRO'+coCRLF+
             '        WHERE SIT_FID_MAESTRO <> ''CA'''+coCRLF+
             '      ) CFD,'+coCRLF+
             '      ( SELECT * FROM CR_FID_CORREO'+coCRLF+
             '        WHERE SIT_FID_CORREO <> ''CA'' -- Que no sencuentren Cancelados'+coCRLF+
             '      ) CFC,'+coCRLF+
             '      CRE_CAPITAL CA,'+coCRLF+
             '      CR_CREDITO CC,'+coCRLF+
             '      CONTRATO CTO'+coCRLF+
             ' WHERE CRFD.ID_CREDITO = CFSP.ID_CREDITO'+coCRLF+
             '   AND CFD.ID_FID_MAESTRO = CRFD.ID_FID_MAESTRO'+coCRLF+
             '   AND CA.ID_CREDITO = CFSP.ID_CREDITO'+coCRLF+
             '   AND CA.NUM_PERIODO = CFSP.NUM_PERIODO'+coCRLF+
             '   AND CC.ID_CREDITO = CA.ID_CREDITO'+coCRLF+
             '   AND CTO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
             '   AND CFC.ID_FID_MAESTRO = CRFD.ID_FID_MAESTRO'+coCRLF+
             ' ORDER BY ID_DESTINATARIO, NUM_FOL_ADHESION, NOM_ACREDITADO, ID_CREDITO'+coCRLF
             ;
  vlQry := GetSQLQuery(vlstrSQL, peApli.DatabaseName, peApli.SessionName, True);
  If Assigned(vlQry) Then
   With vlQry Do
    Try
      // Barre cada uno de las solcitudes de pago a notificar...
      If Not Eof Then
        Begin
        // Para solventar esto, se me ocurrío que fuera una vez a buscar el detalle del mensaje
        // para evitar varios accesos a la unidad de O:\
        vlstrDetail := GetDetailofMail; vlstrEMAILMsg := ''; vlB_URGE := False;
        vlACTUAL_ID_DESTINATARIO := FieldByName('ID_DESTINATARIO').AsInteger;
        First; // Coloca el cursor en el primer registro
          Repeat
            //
            vlNOM_DESTINATARIO := FieldByName('NOM_DESTINATARIO').AsString;
            vlEMAIL := FieldByName('EMAIL').AsString;
            vlstrEMAILMsg := vlstrEMAILMsg + coCRLF+ ReplaceVariablesfromEmail(vlstrDetail,
                                                     FieldByName('NOM_FIDEICOMITEN').AsString,
                                                     FieldByName('NUM_FOL_ADHESION').AsString,
                                                     FieldByName('NOM_ACREDITADO').AsString,
                                                     FieldByName('ID_CREDITO').AsString,
                                                     FieldByName('NUM_PERIODO').AsString,
                                                     FieldByName('F_VENCIMIENTO').AsString,
                                                     FieldByName('F_MAX_SOLICITAR').AsString
                                                     );
            If (FieldByName('F_MAX_SOLICITAR').AsDateTime < peApli.DameFechaEmpresa)  Then
             vlB_URGE := True;

            Next;
            If (vlACTUAL_ID_DESTINATARIO <> FieldByName('ID_DESTINATARIO').AsInteger) Or
                (Eof) Then
             Begin
              If (vlB_URGE) Then vlTITLE := 'AVISO URGENTE: Solicitudes de Pago Pendientes de Imprimir'
              Else vlTITLE := 'AVISO: Solicitudes de Pago Pendientes de Imprimir';

              vlstrEMAILMsg := MakeBodyMail(vlNOM_DESTINATARIO,
                                            vlstrEMAILMsg);
              SendEMail(peApli, mtHTML, True, vlTITLE,
                       vlstrEMAILMsg, vlEMAIL,'', '', '');
              vlstrEMAILMsg := ''; vlB_URGE := False;
              vlACTUAL_ID_DESTINATARIO := FieldByName('ID_DESTINATARIO').AsInteger;
             End;
           Until Eof;
        End;
    Finally
     vlQry.Close;
     vlQry.Free;
    End;
end;

procedure TWCrFidSolPago.Button1Click(Sender: TObject);
begin
 EnviaCorreos_SolicitudPago(Objeto.Apli);
end;

procedure TWCrFidSolPago.SaveQryToFile1Click(Sender: TObject);
begin
 SaveQryToFile1.Checked := Not SaveQryToFile1.Checked;
end;

procedure TWCrFidSolPago.R1Click(Sender: TObject);
var CrReFiDi  : TCrReFiDi;
    vlID_FID_REL_DISP : String;
begin
 vlID_FID_REL_DISP := sgcDATA.CellStr['ID_FID_REL_DISP', sgcDATA.SG.Row];
 If IsInteger(vlID_FID_REL_DISP) Then
  Begin
   CrReFiDi := TCrReFiDi.Create(self);
   Try
    CrReFiDi.Apli := Objeto.Apli;
    CrReFiDi.ParamCre := Objeto.ParamCre;
    CrReFiDi.FindKey([StrToInt(vlID_FID_REL_DISP)]);
    CrReFiDi.Catalogo;
   Finally
    If Assigned(CrReFiDi) Then CrReFiDi.Free;
    btBuscaClick(Self);
   End;
  End;  
end;

end.

