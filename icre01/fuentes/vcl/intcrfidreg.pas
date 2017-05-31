{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
// Sistema         : Clase de CR_FIDEICOMISO_REGLAS
// Fecha de Inicio : 19/07/2005
// Función forma   : Clase de CR_FIDEICOMISO_REGLAS
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrFidReg;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit,

IntParamCre,
IntGenCre,
IntSICC
;

Type
 TCrFidReg= class; 

  TWCrFideicoReglas=Class(TForm)
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
    grF_VENCIMIENTO: TGroupBox;
    lbDIA_VENC_INI: TLabel;
    lbDIA_VENC_FIN: TLabel;
    grSolicitud: TGroupBox;
    lbDIA_SOL_INI: TLabel;
    lbDIA_SOL_FIN: TLabel;
    lbDIA_SOL_ANTIC: TLabel;
    edCVE_FID_REGLA: TEdit;
    lbCVE_FID_REGLA: TLabel;
    edDESC_FID_REGLA: TEdit;
    lbDESC_FID_REGLA: TLabel;
    lbF_ALTA: TLabel;
    lbF_MODIFICA: TLabel;
    LBCVE_USU_ALTA: TLabel;
    lbCVE_USU_MODIFICA: TLabel;
    edF_MODIFICA: TEdit;
    edF_ALTA: TEdit;
    edCVE_USU_MODIFICA: TEdit;
    edCVE_USU_ALTA: TEdit;
    rgSIT_FID_REGLA: TRadioGroup;
    edDIA_VENC_INI: TInterEdit;
    edDIA_VENC_FIN: TInterEdit;
    edDIA_SOL_INI: TInterEdit;
    edDIA_SOL_FIN: TInterEdit;
    edDIA_SOL_ANTIC: TInterEdit;
    cbB_VENC_SIG_MES: TCheckBox;
    Bevel1: TBevel;
    cbB_SOL_SIG_MES: TCheckBox;
    Bevel2: TBevel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure rgSIT_FID_REGLAExit(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure edCVE_FID_REGLAExit(Sender: TObject);
    procedure edDIA_VENC_INIExit(Sender: TObject);
    procedure edDIA_SOL_INIExit(Sender: TObject);
    procedure edDIA_SOL_ANTICExit(Sender: TObject);
    procedure edDESC_FID_REGLAExit(Sender: TObject);
    procedure edDIA_VENC_FINExit(Sender: TObject);
    procedure edDIA_SOL_FINExit(Sender: TObject);
    procedure InterForma1AntesEliminar(Sender: TObject;
      var Realizado: Boolean);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrFidReg;

    function GetSeTraslapanDias(peDIA_VENC_INI_1   , peDIA_VENC_FIN_1   ,
                                peDIA_VENC_INI_2   , peDIA_VENC_FIN_2   : Integer
                               ) : Boolean;    

    procedure ValidaFechas(pestrTitle : String;
                           peLabel1, peLabel2 : TLabel;
                           peEdit1, peEdit2 : TInterEdit;
                           peCheckBox : TCheckBox;
                           var psMsg : String);

    // procedure ValidaFechas2(var psMsg : String);

end;
 TCrFidReg= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        ParamCre : TParamCre;
        CVE_FID_REGLA                : TInterCampo;
        DESC_FID_REGLA               : TInterCampo;
        DIA_VENC_INI                 : TInterCampo;
        DIA_VENC_FIN                 : TInterCampo;
        B_VENC_SIG_MES               : TInterCampo;
        DIA_SOL_INI                  : TInterCampo;
        DIA_SOL_FIN                  : TInterCampo;
        DIA_SOL_ANTIC                : TInterCampo;
        B_SOL_SIG_MES                : TInterCampo;
        SIT_FID_REGLA                : TInterCampo;
        CVE_USU_ALTA                 : TInterCampo;
        F_ALTA                       : TInterCampo;
        CVE_USU_MODIFICA             : TInterCampo;
        F_MODIFICA                   : TInterCampo;
        
        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published 
      end;

implementation
{$R *.DFM}


constructor TCrFidReg.Create( AOwner : TComponent ); 
begin Inherited;
      CVE_FID_REGLA  := CreaCampo('CVE_FID_REGLA',ftString,tsNinguno,tsNinguno,True);
                CVE_FID_REGLA.Caption := '';
      DESC_FID_REGLA := CreaCampo('DESC_FID_REGLA',ftString,tsNinguno,tsNinguno,True);
                DESC_FID_REGLA.Caption := '';
      DIA_VENC_INI   := CreaCampo('DIA_VENC_INI',ftInteger,tsNinguno,tsNinguno,True);
                DIA_VENC_INI.Caption := '';
      DIA_VENC_FIN   := CreaCampo('DIA_VENC_FIN',ftInteger,tsNinguno,tsNinguno,True);
                DIA_VENC_FIN.Caption := '';
      B_VENC_SIG_MES := CreaCampo('B_VENC_SIG_MES',ftString,tsNinguno,tsNinguno,True);
                B_VENC_SIG_MES.Caption := '';
      DIA_SOL_INI    := CreaCampo('DIA_SOL_INI',ftInteger,tsNinguno,tsNinguno,True);
                DIA_SOL_INI.Caption := '';
      DIA_SOL_FIN    := CreaCampo('DIA_SOL_FIN',ftInteger,tsNinguno,tsNinguno,True);
                DIA_SOL_FIN.Caption := '';
      DIA_SOL_ANTIC  := CreaCampo('DIA_SOL_ANTIC',ftInteger,tsNinguno,tsNinguno,True);
                DIA_SOL_ANTIC.Caption := '';
      B_SOL_SIG_MES := CreaCampo('B_SOL_SIG_MES',ftString,tsNinguno,tsNinguno,True);
                B_SOL_SIG_MES.Caption := '';
      SIT_FID_REGLA := CreaCampo('SIT_FID_REGLA',ftString,tsNinguno,tsNinguno,True);
                SIT_FID_REGLA.Caption:='Situación';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      FKeyFields.Add('CVE_FID_REGLA');

      With SIT_FID_REGLA do
        Begin
        Size:=3;
        UseCombo:=True;
        ComboLista.Add('0'); ComboDatos.Add(CSIT_AC);
        ComboLista.Add('1'); ComboDatos.Add(CSIT_CA);
        End;

      TableName := 'CR_FID_REGLA';
      UseQuery := True;
      HelpFile := 'IntCrFidReg.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrFidReg.Destroy;
begin inherited;
end;

function TCrFidReg.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrFideicoReglas;
begin
   W:=TWCrFideicoReglas.Create(Self);
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

Function TCrFidReg.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrFiRe.it','S');
      Try if Active then begin T.Param(0,CVE_FID_REGLA.AsString); end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;


(***********************************************FORMA CR_FIDEICOMISO_REGLAS********************)
(*                                                                              *)
(*  FORMA DE CR_FIDEICOMISO_REGLAS                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_FIDEICOMISO_REGLAS********************)

procedure TWCrFideicoReglas.FormShow(Sender: TObject);
begin
 With Objeto Do
  Begin
  lbDempresa.Caption := ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := ParamCre.FECHA.AsString;
  lbDUsuario.Caption := ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := ParamCre.PERFIL.AsString;
    
  CVE_FID_REGLA.Control      := edCVE_FID_REGLA;
  DESC_FID_REGLA.Control     := edDESC_FID_REGLA;
  DIA_VENC_INI.Control       := edDIA_VENC_INI;
  DIA_VENC_FIN.Control       := edDIA_VENC_FIN;
  B_VENC_SIG_MES.Control     := cbB_VENC_SIG_MES;
  DIA_SOL_INI.Control        := edDIA_SOL_INI;
  DIA_SOL_FIN.Control        := edDIA_SOL_FIN;
  DIA_SOL_ANTIC.Control      := edDIA_SOL_ANTIC;
  B_SOL_SIG_MES.Control      := cbB_SOL_SIG_MES;
  SIT_FID_REGLA.Control      := rgSIT_FID_REGLA;
  CVE_USU_ALTA.Control       := edCVE_USU_ALTA;
  F_ALTA.Control             := edF_ALTA;
  CVE_USU_MODIFICA.Control   := edCVE_USU_MODIFICA;
  F_MODIFICA.Control         := edF_MODIFICA;

  Interforma1.MsgPanel := MsgPanel;
  End;
end;

procedure TWCrFideicoReglas.FormDestroy(Sender: TObject);
begin
 With Objeto Do
  Begin
  CVE_FID_REGLA.Control      := Nil;
  DESC_FID_REGLA.Control     := Nil;
  DIA_VENC_INI.Control       := Nil;
  DIA_VENC_FIN.Control       := Nil;
  B_VENC_SIG_MES.Control     := Nil;
  DIA_SOL_INI.Control        := Nil;
  DIA_SOL_FIN.Control        := Nil;
  DIA_SOL_ANTIC.Control      := Nil;
  B_SOL_SIG_MES.Control      := Nil;
  SIT_FID_REGLA.Control      := Nil;
  CVE_USU_ALTA.Control       := Nil;
  F_ALTA.Control             := Nil;
  CVE_USU_MODIFICA.Control   := Nil;
  F_MODIFICA.Control         := Nil;

  Interforma1.MsgPanel := Nil;
  End;
end;

procedure TWCrFideicoReglas.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrFideicoReglas.InterForma1DespuesNuevo(Sender: TObject);
begin If edCVE_FID_REGLA.CanFocus Then edCVE_FID_REGLA.SetFocus;
      Objeto.SIT_FID_REGLA.AsString := CSIT_AC;
end;

procedure TWCrFideicoReglas.InterForma1DespuesModificar(Sender: TObject);
begin If edDESC_FID_REGLA.CanFocus Then edDESC_FID_REGLA.SetFocus;
end;

procedure TWCrFideicoReglas.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
var vlstrMessage : String;
    mrResult : Word;
begin
 If IsNewData Then vlstrMessage := CCONFIRM_ALMACENA_INS
 Else vlstrMessage := CCONFIRM_ALMACENA_MOD;
 mrResult := MessageDlg(vlstrMessage, mtConfirmation, [mbYes, mbNo], 0);
 With Objeto Do
   If (mrResult = mrYes) Then
    Begin
      If (IsNewData) Then
       Begin
       F_ALTA.AsDateTime        := Apli.DameFechaEmpresa;
       CVE_USU_ALTA.AsString    := Apli.Usuario;
       End
      Else
       Begin
       F_MODIFICA.AsDateTime     := Apli.DameFechaEmpresa;
       CVE_USU_MODIFICA.AsString := Apli.Usuario;
       End;
     End;
 Realizado  := mrResult = mrYes;
end;

procedure TWCrFideicoReglas.edCVE_FID_REGLAExit(Sender: TObject);
var vlstrMsg : String;
begin
 With Objeto Do
  If (Modo = moAppend) Or (Modo = moEdit) Then
   Begin
   vlstrMsg := '';
   If (Trim(edCVE_FID_REGLA.Text) = '') Then vlstrMsg := 'Favor de indicar la '+lbCVE_FID_REGLA.Caption;
   InterForma1.ValidaExit((Sender As TWinControl), (vlstrMsg = ''), vlstrMsg, True);
   End;
end;

procedure TWCrFideicoReglas.edDESC_FID_REGLAExit(Sender: TObject);
var vlstrMsg : String;
begin
 With Objeto Do
  If (Modo = moAppend) Or (Modo = moEdit) Then
   Begin
   vlstrMsg := '';
   If (Trim(edDESC_FID_REGLA.Text) = '') Then vlstrMsg := 'Favor de indicar la '+lbDESC_FID_REGLA.Caption;
   InterForma1.ValidaExit((Sender As TWinControl), (vlstrMsg = ''), vlstrMsg, True);
   End;
end;


function TWCrFideicoReglas.GetSeTraslapanDias(peDIA_VENC_INI_1   , peDIA_VENC_FIN_1   ,
                                              peDIA_VENC_INI_2   , peDIA_VENC_FIN_2   : Integer
                                             ) : Boolean;
var Stp : TStoredProc;
begin
  Stp :=  TStoredProc.Create(Nil);
  Result := False;
  If Assigned(Stp) Then
    With Stp Do
     Try
       StoredProcName := 'PKGCRGYM.GET_SE_TRASLAPAN_DIAS';
       DataBaseName   := Objeto.Apli.DataBaseName;
       SessionName    := Objeto.Apli.SessionName;
       Params.CreateParam(ftInteger ,'peDIA_VENC_INI_1'  ,ptInput);
       Params.CreateParam(ftInteger ,'peDIA_VENC_FIN_1'  ,ptInput);
       Params.CreateParam(ftInteger ,'peDIA_VENC_INI_2'  ,ptInput);
       Params.CreateParam(ftInteger ,'peDIA_VENC_FIN_2'  ,ptInput);
       Params.CreateParam(ftString  ,'RESULT'            ,ptResult);

       ParamByName('peDIA_VENC_INI_1').AsInteger := peDIA_VENC_INI_1;
       ParamByName('peDIA_VENC_FIN_1').AsInteger := peDIA_VENC_FIN_1;
       ParamByName('peDIA_VENC_INI_2').AsInteger := peDIA_VENC_INI_2;
       ParamByName('peDIA_VENC_FIN_2').AsInteger := peDIA_VENC_FIN_2;
       ExecProc;

       If (Trim(ParamByName('RESULT').AsString) = '') Then
        Begin
        MessageDlg('Problemas no identificado en la función "PKGCRGYM.GET_SE_TRASLAPAN_DIAS"'+coCRLF+
                   'Reintente nuevamente o avise a Sistemas.', mtError, [mbOk], 0);
        Result := False;
        End
       Else
        Result := (ParamByName('RESULT').AsString = CVERDAD);
     Finally
       Stp.Params.Clear;
       Stp.Free;
     End;
end;

procedure TWCrFideicoReglas.ValidaFechas(pestrTitle : String;
                                         peLabel1, peLabel2 : TLabel;
                                         peEdit1, peEdit2 : TInterEdit;
                                         peCheckBox : TCheckBox;
                                         var psMsg : String);
var vlDIA_INI, vlDIA_FIN : Integer;
begin
  vlDIA_INI := 0; vlDIA_FIN := 0;
  psMsg := '';
  // Obtiene las fechas de los controles
  If (Trim(peEdit1.Text) <> '') Then vlDIA_INI := StrToInt(peEdit1.Text);
  If (Trim(peEdit2.Text) <> '') Then vlDIA_FIN := StrToInt(peEdit2.Text);
  //
  If ((vlDIA_INI + vlDIA_FIN) = 0) Then
    psMsg := 'Debe de indicar los días Inicial y Final del '+grF_VENCIMIENTO.Caption+'.'
  Else If Not ((vlDIA_INI >= 1) And (vlDIA_INI <= 31)) Then
    psMsg := 'El "'+peLabel1.Caption+'" debe de estar entre los días 1 al 31. Verifique'
  Else If Not ((vlDIA_FIN >= 1) And (vlDIA_FIN <= 31)) Then
    psMsg := 'El "'+peLabel2.Caption+'" debe de estar entre los días 1 al 31. Verifique'
  ;
  peCheckBox.Checked := (vlDIA_INI > vlDIA_FIN);
end;

{
procedure TWCrFideicoReglas.ValidaFechas2(var psMsg : String);
begin
 With Objeto Do
  If (psMsg = '') Then
   Begin
   DIA_VENC_INI.GetFromControl;
   DIA_VENC_FIN.GetFromControl;
   DIA_SOL_INI.GetFromControl;
   DIA_SOL_FIN.GetFromControl;
   If (GetSeTraslapanDias(DIA_VENC_INI.AsInteger, DIA_VENC_FIN.AsInteger,
                          DIA_SOL_INI.AsInteger , DIA_SOL_FIN.AsInteger)) Then
      psMsg := 'Los días de "Solicitud de Pago" se traslapan con los días del "Rango Fecha de Vencimiento". Verifique';
   End;
end;
}

procedure TWCrFideicoReglas.edDIA_VENC_INIExit(Sender: TObject);
var vlstrMsg : String;
begin
 With Objeto Do
  If (Modo = moAppend) Or (Modo = moEdit) Then
   Begin
   ValidaFechas( ' rango de Vencimiento', lbDIA_VENC_INI, lbDIA_VENC_FIN, edDIA_VENC_INI, edDIA_VENC_FIN,
                 cbB_VENC_SIG_MES, vlstrMsg);
   InterForma1.ValidaExit((Sender As TWinControl), (vlstrMsg = ''), vlstrMsg,True);
   End;
end;

procedure TWCrFideicoReglas.edDIA_VENC_FINExit(Sender: TObject);
var vlstrMsg : String;
begin
 With Objeto Do
  If (Modo = moAppend) Or (Modo = moEdit) Then
   Begin
   ValidaFechas( ' rango de Vencimiento', lbDIA_VENC_INI, lbDIA_VENC_FIN, edDIA_VENC_INI, edDIA_VENC_FIN,
                 cbB_VENC_SIG_MES, vlstrMsg);
   InterForma1.ValidaExit((Sender As TWinControl), (vlstrMsg = ''), vlstrMsg,True);
   End;
end;

procedure TWCrFideicoReglas.edDIA_SOL_INIExit(Sender: TObject);
var vlstrMsg : String;
begin
 With Objeto Do
  If (Modo = moAppend) Or (Modo = moEdit) Then
   Begin
   ValidaFechas( ' rango de Solicitud', lbDIA_SOL_INI, lbDIA_SOL_FIN, edDIA_SOL_INI, edDIA_SOL_FIN,
                 cbB_SOL_SIG_MES, vlstrMsg);
   // ValidaFechas2(vlstrMsg);
   InterForma1.ValidaExit((Sender As TWinControl), (vlstrMsg = ''), vlstrMsg,True);
   End;
end;

procedure TWCrFideicoReglas.edDIA_SOL_FINExit(Sender: TObject);
var vlstrMsg : String;
begin
 With Objeto Do
  If (Modo = moAppend) Or (Modo = moEdit) Then
   Begin
   ValidaFechas( ' rango de Solicitud', lbDIA_SOL_INI, lbDIA_SOL_FIN, edDIA_SOL_INI, edDIA_SOL_FIN,
                 cbB_SOL_SIG_MES, vlstrMsg);
  // ValidaFechas2(vlstrMsg);
   InterForma1.ValidaExit((Sender As TWinControl), (vlstrMsg = ''), vlstrMsg,True);
   End;
end;

procedure TWCrFideicoReglas.edDIA_SOL_ANTICExit(Sender: TObject);
begin
 With Objeto Do
  If (Modo = moAppend) Or (Modo = moEdit) Then
   Begin
   InterForma1.ValidaExit(edDIA_SOL_ANTIC, True, '',True);
   End;
end;

procedure TWCrFideicoReglas.rgSIT_FID_REGLAExit(Sender: TObject);
begin
 With Objeto Do
  If (Modo = moAppend) Or (Modo = moEdit) Then
   Begin
   InterForma1.ValidaExit(rgSIT_FID_REGLA, True, '',True);
   End;
end;

procedure TWCrFideicoReglas.InterForma1AntesEliminar(Sender: TObject;
  var Realizado: Boolean);

  function SePuedeEliminar : Boolean;
  var vlQry : TQuery;
      vlstrSQL, vlstrBuffer, vlstrComa : String;
  begin
   Result := False; vlstrBuffer := ''; vlstrComa := '';
   vlstrSQL := ' SELECT CFM.NUM_FOL_ADHESION'+coCRLF+
               ' FROM CR_FID_REL_REG CFRR,'+coCRLF+
               '      CR_FID_MAESTRO CFM'+coCRLF+
               ' WHERE CFRR.CVE_FID_REGLA = '+SQLStr(Objeto.CVE_FID_REGLA.AsString)+coCRLF+
               '   AND CFRR.SIT_FID_REL_REG = '+SQLStr(CSIT_AC)+coCRLF+
               '   AND CFM.ID_FID_MAESTRO = CFRR.ID_FID_MAESTRO'+coCRLF+
               '   AND CFM.SIT_FID_MAESTRO = '+SQLStr(CSIT_AC)+coCRLF+
               ' GROUP BY NUM_FOL_ADHESION'+coCRLF
               ;
   vlQry := GetSQLQuery(vlstrSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True);
   If Not Assigned(vlQry) Then
    Result := True
   Else
    With vlQry Do
     Try
      vlQry.First;
      While Not vlQry.Eof Do
       Begin
       vlstrBuffer := vlstrBuffer + vlstrComa + '"' + FieldByName('NUM_FOL_ADHESION').AsString + '"';
       vlstrComa := ',';
       Next;
       End;
     Finally
       vlQry.Close;
       vlQry.Free;
       MessageDlg(' La Regla se encuentra vinculada con los siguiente(s) FIDEICOMISO(s): '+coCRLF+
                  coCRLF+
                  vlstrBuffer+coCRLF+coCRLF+
                  ' No se puede Eliminar.' , mtWarning, [mbOk], 0);
     End;
  end;
  
begin
  Realizado := SePuedeEliminar;
end;

end.
