// Sistema         : Clase de CR_GA_SO_APL
// Fecha de Inicio : 08/07/2004
// Función forma   : Clase de CR_GA_SO_APL
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrGaSoApl;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, IntSGCtrl,
Grids, ImgList, Menus,

IntGenCre,
IntParamCre,  //Párametros de Crédito
IntCrAcredit, //Datos Acreditado
IntCrCto,     //Alta de Crédito  /  AUTORIZACION
IntCrCredito, //Alta de solicitudes de Disposición / DISPOSICION
IntCrGaSoLi,  //Solicitud de Garantía Liquida
IntCrGaSoFe,  //Solicitud de Garantía FEGA
IntMQrFmt8FIRA, // Formato 8 de FIRA
IntMQrFmt9FIRA  // Formato 9 de FIRA
;

const
      C_COL1                 = 0;
      C_COL2                 = C_COL1 + 1;
      C_COL3                 = C_COL2 + 1;
      C_COLID_CONTRATO       = C_COL3 + 1;
      C_COLID_CREDITO        = C_COL3 + 2;
      C_COLID_FIRA           = C_COL3 + 3;
      C_COLID_CONTROL_EXT    = C_COL3 + 4;
      C_COLNUM_PERIODO       = C_COL3 + 5;
      C_COLNOMBRE_ACREDITADO = C_COL3 + 6;
      C_COLIMP_ADEUDO        = C_COL3 + 7;
      C_COLF_ALTA_LIQ        = C_COL3 + 8;
      C_COLF_ALTA_FEGA       = C_COL3 + 9;

Type
 TCrGaSoApl= class;

  TWCrGaSoApl=Class(TForm)
    InterForma1             : TInterForma;
    lblAcreditado: TLabel;
    edID_ACREDITADO: TEdit;
    edID_CONTRATO: TEdit;
    edID_CREDITO: TEdit;
    lblAutorizacion: TLabel;
    lblDisposicion: TLabel;
    edNOM_ACREDITADO: TEdit;
    edNOM_TITULAR: TEdit;
    edNOM_ACREDITADO1: TEdit;
    btID_ACREDITADO: TBitBtn;
    btID_CONTRATO: TBitBtn;
    btID_CREDITO: TBitBtn;
    ilID_ACREDITADO: TInterLinkit;
    ilID_CONTRATO: TInterLinkit;
    ilID_CREDITO: TInterLinkit;
    GroupBox1: TGroupBox;
    lbLiqF_INICIO: TLabel;
    lbLiqF_FINAL: TLabel;
    dtpF_INICIO: TInterDateTimePicker;
    edF_INICIO: TEdit;
    edF_FINAL: TEdit;
    dtpF_FINAL: TInterDateTimePicker;
    chbxF_Liq: TCheckBox;
    chbxID_ACREDITADO: TCheckBox;
    chbxID_CONTRATO: TCheckBox;
    chbxID_CREDITO: TCheckBox;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    rgbxMostrar: TRadioGroup;
    btBUSCA: TBitBtn;
    Shape1: TShape;
    Label1: TLabel;
    Shape2: TShape;
    Label2: TLabel;
    Shape4: TShape;
    Label4: TLabel;
    Shape5: TShape;
    Label5: TLabel;
    Shape6: TShape;
    Label6: TLabel;
    Shape7: TShape;
    Label7: TLabel;
    Shape8: TShape;
    Label8: TLabel;
    btSolLiq: TBitBtn;
    btSolFEGA: TBitBtn;
    sgcDATOS: TStringGrid;
    Label9: TLabel;
    edID_CRED_EXTERNO: TEdit;
    btID_CRED_EXTERNO: TBitBtn;
    chbxID_CONTROL_EXT: TCheckBox;
    Label10: TLabel;
    edID_CONTROL_EXT: TEdit;
    btID_CONTROL_EXT: TBitBtn;
    chbxID_CRED_EXTERNO: TCheckBox;
    Label11: TLabel;
    Shape9: TShape;
    Label12: TLabel;
    Shape10: TShape;
    ilID_CRED_EXTERNO: TInterLinkit;
    ilID_CONTROL_EXT: TInterLinkit;
    PopupMenu1: TPopupMenu;
    SolicitarGarantaLquida1: TMenuItem;
    SolicitarGarantaFEGA1: TMenuItem;
    MostrarGarantaLquida1: TMenuItem;
    N1: TMenuItem;
    MostrarGarantaFEGA1: TMenuItem;
    btnFmt8FIRA: TBitBtn;
    btnFmt9FIRA: TBitBtn;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure btID_ACREDITADOClick(Sender: TObject);
    procedure btID_CONTRATOClick(Sender: TObject);
    procedure btID_CREDITOClick(Sender: TObject);
    procedure ilID_CREDITOCapture(Sender: TObject; var Show: Boolean);
    procedure ilID_ACREDITADOEjecuta(Sender: TObject);
    procedure ilID_CONTRATOEjecuta(Sender: TObject);
    procedure ilID_CREDITOEjecuta(Sender: TObject);
    procedure chbxID_ACREDITADOClick(Sender: TObject);
    procedure chbxID_CONTRATOClick(Sender: TObject);
    procedure chbxID_CREDITOClick(Sender: TObject);
    procedure btSolLiqClick(Sender: TObject);
    procedure btSolFEGAClick(Sender: TObject);
    procedure btBUSCAClick(Sender: TObject);
    procedure sgcDATOSDblClick(Sender: TObject);
    procedure sgcDATOSDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure chbxID_CONTROL_EXTClick(Sender: TObject);
    procedure btID_CONTROL_EXTClick(Sender: TObject);
    procedure ilID_CONTROL_EXTEjecuta(Sender: TObject);
    procedure chbxF_LiqClick(Sender: TObject);
    procedure edF_INICIOChange(Sender: TObject);
    procedure edF_INICIOExit(Sender: TObject);
    procedure edF_FINALExit(Sender: TObject);
    procedure btID_CRED_EXTERNOClick(Sender: TObject);
    procedure ilID_CRED_EXTERNOEjecuta(Sender: TObject);
    procedure chbxID_CRED_EXTERNOClick(Sender: TObject);
    procedure MostrarGarantaLquida1Click(Sender: TObject);
    procedure MostrarGarantaFEGA1Click(Sender: TObject);
    procedure btnFmt9FIRAClick(Sender: TObject);
    procedure btnFmt8FIRAClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
     Objeto : TCrGaSoApl;
    procedure MuestraDatos;
    procedure Solicita(pnMetodo : Integer);

    procedure MuestraGarantiaLiquida;
    procedure MuestraGarantiaFEGA;
    procedure SolicitaGarantiaLiquida(nRow : Integer);
    procedure SolicitaGarantiaFEGA(nRow : Integer);
end;    

 TCrGaSoApl= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ID_ACREDITADO    : TInterCampo;
        ID_CONTRATO      : TInterCampo;
        ID_CREDITO       : TInterCampo;
        ID_CONTROL_EXT   : TInterCampo;
        F_INICIO         : TInterCampo;
        F_FINAL          : TInterCampo;

        Credito          : TCrCredito;
        Acreditado       : TCrAcredit;
        Autorizacion     : TCrCto;
        ParamCre         : TParamCre;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

      published
      end;

implementation

uses IntDmMain;
//Uses RepMon;

{$R *.DFM}


constructor TCrGaSoApl.Create( AOwner : TComponent ); 
begin Inherited; 
      ID_ACREDITADO  :=CreaCampo('ID_ACREDITADO',ftString,tsNinguno,tsNinguno,False);
      ID_CONTRATO    :=CreaCampo('ID_CONTRATO',ftString,tsNinguno,tsNinguno,False);
      ID_CREDITO     :=CreaCampo('ID_CREDITO',ftString,tsNinguno,tsNinguno,False);
      F_INICIO       :=CreaCampo('F_INICIO',ftDateTime,tsNinguno,tsNinguno,False);
      F_FINAL        :=CreaCampo('F_FINAL',ftDateTime,tsNinguno,tsNinguno,False);

      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource := Self;
      Acreditado.BuscaWhereString := 'CR_ACREDITADO.SIT_ACREDITADO ='#39+CSIT_AC+#39;
      Acreditado.FilterString := Acreditado.BuscaWhereString;

      Autorizacion := TCrCto.Create(Self);
      Autorizacion.MasterSource := Self;
      Autorizacion.FilterString := Autorizacion.BuscaWhereString;

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource := Self;
      Credito.BuscaWhereString := 'CR_CREDITO.SIT_CREDITO ='#39+CSIT_AC+#39;
      Credito.FilterString := Credito.BuscaWhereString;

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrGaSoApl.Hlp';
end;

Destructor TCrGaSoApl.Destroy;
begin
  If Assigned(Credito) Then Credito.Free;
  If Assigned(Acreditado) Then Acreditado.Free;
  If Assigned(Autorizacion) Then Autorizacion.Free;
  Inherited;
end;


function TCrGaSoApl.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrGaSoApl;
begin
   W:=TWCrGaSoApl.Create(Self);
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


Function TCrGaSoApl.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrGaSA.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

(***********************************************FORMA CR_GA_SO_APL********************)
(*                                                                              *)
(*  FORMA DE CR_GA_SO_APL                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_GA_SO_APL********************)

procedure TWCrGaSoApl.FormShow(Sender: TObject);
begin
 With Objeto Do
  Begin
  ID_ACREDITADO.Control := edID_ACREDITADO;
  ID_CONTRATO.Control := edID_CONTRATO;
  ID_CREDITO.Control := edID_CREDITO;
  F_INICIO.Control := edF_INICIO;
  F_FINAL.Control := edF_FINAL;

  Acreditado.ID_ACREDITADO.Control := edID_ACREDITADO;
  Acreditado.Persona.Nombre.Control := edNOM_ACREDITADO;

  Autorizacion.ID_CONTRATO.Control := edID_CONTRATO;
  Autorizacion.Acreditado.Persona.Nombre.Control := edNOM_TITULAR;

  Credito.ID_CREDITO.Control := edID_CREDITO;
  Credito.ContratoCre.Acreditado.Persona.Nombre.Control := edNOM_ACREDITADO1;

  lbDempresa.Caption := ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := ParamCre.FECHA.AsString;
  lbDUsuario.Caption := ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

  MuestraDatos;
  End;
end;

procedure TWCrGaSoApl.FormDestroy(Sender: TObject);
begin
 With Objeto Do
  Begin
  ID_ACREDITADO.Control := Nil;
  ID_CONTRATO.Control := Nil;
  ID_CREDITO.Control := Nil;
  F_INICIO.Control := Nil;
  F_FINAL.Control := Nil;
  End;
end;

procedure TWCrGaSoApl.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrGaSoApl.btID_ACREDITADOClick(Sender: TObject);
begin
  With Objeto Do
   If Acreditado.Busca Then
    Begin
    chbxID_ACREDITADO.Enabled := True;
    chbxID_ACREDITADO.Checked := True;    
    End;
end;

procedure TWCrGaSoApl.btID_CONTRATOClick(Sender: TObject);
begin
  With Objeto Do
   If Autorizacion.Busca Then
     Begin
     chbxID_CONTRATO.Enabled := True;
     chbxID_CONTRATO.Checked := True;

       If Acreditado.FindKey([Autorizacion.Acreditado.ID_ACREDITADO.AsInteger]) Then
        Begin
        chbxID_ACREDITADO.Enabled := True;
        chbxID_ACREDITADO.Checked := True;
        End;
     End;
end;

procedure TWCrGaSoApl.btID_CREDITOClick(Sender: TObject);
begin
  With Objeto Do
   If Credito.Busca Then
     Begin
     chbxID_CREDITO.Enabled := True;
     chbxID_CREDITO.Checked := True;

       If Autorizacion.FindKey([Credito.ID_CONTRATO.AsInteger, Credito.ContratoCre.FOL_CONTRATO.AsInteger]) Then
        Begin
        chbxID_CONTRATO.Enabled := True;
        chbxID_CONTRATO.Checked := True;

          If Acreditado.FindKey([Autorizacion.Contrato.ID_TITULAR.AsInteger]) Then
           Begin
           chbxID_ACREDITADO.Enabled := True;
           chbxID_ACREDITADO.Checked := True;
           edNOM_ACREDITADO1.Text := Acreditado.Persona.Nombre.AsString;
           edNOM_TITULAR.Text := Acreditado.Persona.Nombre.AsString;
           End;
        End;
     End;
end;

procedure TWCrGaSoApl.ilID_CREDITOCapture(Sender: TObject;
  var Show: Boolean);
begin
 Show := True;
end;

procedure TWCrGaSoApl.ilID_ACREDITADOEjecuta(Sender: TObject);
begin
 With Objeto Do
  If Acreditado.FindKey([ilID_ACREDITADO.Buffer]) Then
    Begin
    chbxID_ACREDITADO.Enabled := True;
    chbxID_ACREDITADO.Checked := True;
    End;
end;

procedure TWCrGaSoApl.ilID_CONTRATOEjecuta(Sender: TObject);
begin
 With Objeto Do
  If Autorizacion.FindKey([ilID_CONTRATO.Buffer]) Then
     Begin
     chbxID_CONTRATO.Enabled := True;
     chbxID_CONTRATO.Checked := True;

       If Acreditado.FindKey([Autorizacion.Acreditado.ID_ACREDITADO.AsInteger]) Then
        Begin
        chbxID_ACREDITADO.Enabled := True;
        chbxID_ACREDITADO.Checked := True;
        End;
     End;
end;

procedure TWCrGaSoApl.ilID_CREDITOEjecuta(Sender: TObject);
begin
 With Objeto Do
  If Credito.FindKey([ilID_CREDITO.Buffer]) Then
     Begin
     chbxID_CREDITO.Enabled := True;
     chbxID_CREDITO.Checked := True;

     If Autorizacion.FindKey([Credito.ID_CONTRATO.AsInteger, Credito.ContratoCre.FOL_CONTRATO.AsInteger]) Then
        Begin
        chbxID_CONTRATO.Enabled := True;
        chbxID_CONTRATO.Checked := True;

          If Acreditado.FindKey([Autorizacion.Contrato.ID_TITULAR.AsInteger]) Then
           Begin
           chbxID_ACREDITADO.Enabled := True;
           chbxID_ACREDITADO.Checked := True;
           edNOM_ACREDITADO1.Text := Acreditado.Persona.Nombre.AsString;
           edNOM_TITULAR.Text := Acreditado.Persona.Nombre.AsString;           
           End;
        End;

     End;
end;

procedure TWCrGaSoApl.ilID_CONTROL_EXTEjecuta(Sender: TObject);

 function ObtenCredito(pID_CONTROL_EXT : String) : Integer;
 var vlQry : TQuery;
 begin
  Result := -1;
  vlQry := TQuery.Create(Nil);
  If Assigned(vlQry) Then
   With (vlQry) Do
    Try
     DatabaseName := Objeto.DatabaseName;
     SessionName := Objeto.SessionName;
     SQL.Clear;
     SQL.Add(' SELECT ID_CREDITO FROM CR_CREDITO WHERE ID_CONTROL_EXT = '+SQLStr(pID_CONTROL_EXT));
     Open;
     Result := FieldByName('ID_CREDITO').AsInteger;
     Close;
    Finally
     vlQry.Free;
    End;
 end;

var nID_CREDITO : Integer;
begin
 With Objeto Do
  Begin
  nID_CREDITO := ObtenCredito(ilID_CONTROL_EXT.Buffer);
  If (nID_CREDITO > -1) Then
    Begin
    edID_CONTROL_EXT.Text := ilID_CONTROL_EXT.Buffer;
    ID_CREDITO.AsInteger := nID_CREDITO;
    ilID_CREDITO.Buffer := IntToStr(nID_CREDITO);
    ilID_CREDITOEjecuta(Self);
    chbxID_CONTROL_EXT.Checked := True;
    End;
  End;
end;


procedure TWCrGaSoApl.chbxID_ACREDITADOClick(Sender: TObject);
begin
  If (Objeto.Acreditado.Active <> chbxID_ACREDITADO.Checked) Then
   Objeto.Acreditado.Active := chbxID_ACREDITADO.Checked;
  chbxID_ACREDITADO.Enabled := chbxID_ACREDITADO.Checked;
end;

procedure TWCrGaSoApl.chbxID_CONTRATOClick(Sender: TObject);
begin
  If (Objeto.Autorizacion.Active <> chbxID_CONTRATO.Checked) Then
   Objeto.Autorizacion.Active := chbxID_CONTRATO.Checked;
  chbxID_CONTRATO.Enabled := chbxID_CONTRATO.Checked;
end;

procedure TWCrGaSoApl.chbxID_CREDITOClick(Sender: TObject);
begin
  If (Objeto.Credito.Active <> chbxID_CREDITO.Checked) Then
   Objeto.Credito.Active := chbxID_CREDITO.Checked;
  chbxID_CREDITO.Enabled := chbxID_CREDITO.Checked;
end;

procedure TWCrGaSoApl.btBUSCAClick(Sender: TObject);
begin
 MuestraDatos;
end;

procedure TWCrGaSoApl.MuestraDatos;
var vlstrSQL : String;
    vlQry : TQuery;
    nRow : Integer;
begin
 ClearGrid(sgcDATOS,0);
 sgcDATOS.RowCount := 1;
 sgcDATOS.ColWidths[C_COL1] := 0;
 sgcDATOS.ColWidths[C_COL2] := 0;
 sgcDATOS.ColWidths[C_COL3] := 0;
  
 vlstrSQL :=
             ' SELECT'+coCRLF+
             '        CGSL.ID_SOLICITUD  AS ID_SOLICITUD_LIQ,'+coCRLF+
             '        CGSF.ID_SOLICITUD  AS ID_SOLICITUD_FEGA,'+coCRLF+
             '        CGSL.SIT_GAR_SOL_LIQ,'+coCRLF+
             '        CTO.ID_CONTRATO,'+coCRLF+
             '        CC.ID_CREDITO,'+coCRLF+
             '        CC.ID_CONTROL_EXT,'+coCRLF+
             '        0 AS ID_FIRA,'+coCRLF+
             '        CA.NUM_PERIODO,'+coCRLF+
             '        DECODE(P.CVE_PER_JURIDICA, ''PF'', PF.APELLIDO_PATERNO || '' '' || PF.APELLIDO_MATERNO || '' '' || PF.NOMBRE_PERSONA,'+coCRLF+
             '               PM.NOM_RAZON_SOCIAL)AS NOMBRE_ACREDITADO,'+coCRLF+
             '        CA.IMP_CAPITAL AS IMP_ADEUDO,'+coCRLF+
             '        CGSL.F_ALTA AS F_ALTA_LIQ,'+coCRLF+
             '        CGSF.F_ALTA AS F_ALTA_FEGA'+coCRLF+
             ' FROM'+coCRLF+
             '      ('+coCRLF+
             '       SELECT ID_CREDITO, NUM_PERIODO, IMP_CAPITAL'+coCRLF+
             '       FROM CR_CAPITAL'+coCRLF+
             '       WHERE SIT_CAPITAL = '+SqlStr(CSIT_IM)+coCRLF+
             '      ) CA,'+coCRLF+
             '      CR_CREDITO CC,'+coCRLF+
             '      CR_CESION CE,'+coCRLF+
             '      CONTRATO CTO,'+coCRLF+
             '      PERSONA P,'+coCRLF+
             '      PERSONA_MORAL PM,'+coCRLF+
             '      PERSONA_FISICA PF,'+coCRLF+
             '      ( SELECT * FROM CR_GA_SOL_LIQ'+coCRLF+
             '        WHERE SIT_GAR_SOL_LIQ <> '+SqlStr(CSIT_CA)+' ) CGSL,'+coCRLF+
             '      ( SELECT * FROM CR_GA_SOL_FEGA'+coCRLF+
             '        WHERE SIT_GAR_SOL_FEG <> '+SqlStr(CSIT_CA)+' ) CGSF'+coCRLF+
             ' WHERE CC.ID_CREDITO = CA.ID_CREDITO'+coCRLF+
             '   AND CC.SIT_CREDITO <> '+SqlStr(CSIT_CA)+coCRLF;

 Objeto.ID_ACREDITADO.GetFromControl;
 Objeto.ID_CONTRATO.GetFromControl;
 Objeto.ID_CREDITO.GetFromControl;

 If (Objeto.ID_ACREDITADO.AsInteger > 0) Then
  vlstrSQL := vlstrSQL + 'AND CTO.ID_TITULAR = '+Objeto.ID_ACREDITADO.AsString;

 If (Objeto.ID_CONTRATO.AsInteger > 0) Then
  vlstrSQL := vlstrSQL + 'AND CTO.ID_CONTRATO = '+Objeto.ID_CONTRATO.AsString;

 If (Objeto.ID_CREDITO.AsInteger > 0) Then
  vlstrSQL := vlstrSQL + 'AND CC.ID_CREDITO = '+Objeto.ID_CREDITO.AsString;

 If (edF_INICIO.Text <> '') And (edF_FINAL.Text <> '') Then
  vlstrSQL := vlstrSQL + 'AND CGSL.F_ALTA BETWEEN '+SQLFecha(dtpF_INICIO.Date)+' AND '+SQLFecha(dtpF_INICIO.Date);

  Case rgbxMostrar.ItemIndex Of
    0 : vlstrSQL := vlstrSQL +'    AND CGSL.ID_CREDITO (+)= CA.ID_CREDITO'+coCRLF+
                              '    AND CGSL.NUM_PERIODO (+)= CA.NUM_PERIODO'+coCRLF+
                              '    AND CGSL.ID_CREDITO IS NULL'+coCRLF;

    1 : vlstrSQL := vlstrSQL + '   AND CGSL.ID_CREDITO = CA.ID_CREDITO'+coCRLF+
                               '   AND CGSL.NUM_PERIODO = CA.NUM_PERIODO'+coCRLF;

    2 : vlstrSQL := vlstrSQL + '   AND CGSL.ID_CREDITO (+)= CA.ID_CREDITO'+coCRLF+
                               '   AND CGSL.NUM_PERIODO (+)= CA.NUM_PERIODO'+coCRLF;
  End;

  vlstrSQL := vlstrSQL +
            '   AND CGSF.ID_CREDITO (+)= CA.ID_CREDITO'+coCRLF+
            '   AND CGSF.NUM_PERIODO (+)= CA.NUM_PERIODO'+coCRLF+
            '   AND CE.ID_CESION (+)= CC.ID_CREDITO'+coCRLF+
            '   AND CE.ID_CESION IS NULL'+coCRLF+
            '   AND CTO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
            '   AND P.ID_PERSONA = CTO.ID_TITULAR'+coCRLF+
            '   AND PF.ID_PERSONA (+)= P.ID_PERSONA'+coCRLF+
            '   AND PM.ID_PERSONA (+)= P.ID_PERSONA'+coCRLF;

 vlQry := GetSQLQuery(vlstrSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
 If Assigned(vlQry) Then
  With vlQry Do
   Begin
    nRow := 0;
     While Not Eof Do
      Begin
      sgcDATOS.Cells[C_COL1,nRow]                 := FieldByName('ID_SOLICITUD_LIQ').AsString;
      sgcDATOS.Cells[C_COL2,nRow]                 := FieldByName('ID_SOLICITUD_FEGA').AsString;
      sgcDATOS.Cells[C_COL3,nRow]                 := FieldByName('SIT_GAR_SOL_LIQ').AsString;
      sgcDATOS.Cells[C_COLID_CONTRATO,nRow]       := FieldByName('ID_CONTRATO').AsString;
      sgcDATOS.Cells[C_COLID_CREDITO,nRow]        := FieldByName('ID_CREDITO').AsString;
      sgcDATOS.Cells[C_COLID_FIRA,nRow]           := FieldByName('ID_FIRA').AsString;
      sgcDATOS.Cells[C_COLID_CONTROL_EXT,nRow]    := FieldByName('ID_CONTROL_EXT').AsString;
      sgcDATOS.Cells[C_COLNUM_PERIODO,nRow]       := FieldByName('NUM_PERIODO').AsString;
      sgcDATOS.Cells[C_COLNOMBRE_ACREDITADO,nRow] := FieldByName('NOMBRE_ACREDITADO').AsString;
      sgcDATOS.Cells[C_COLIMP_ADEUDO,nRow]        := Format(CFORMAT_DINERO,[FieldByName('IMP_ADEUDO').AsFloat]);
      sgcDATOS.Cells[C_COLF_ALTA_LIQ,nRow]        := FieldByName('F_ALTA_LIQ').AsString;
      sgcDATOS.Cells[C_COLF_ALTA_FEGA,nRow]       := FieldByName('F_ALTA_FEGA').AsString;
      Inc(nRow);
      Next;
      End;
    If (nRow = 0) Then sgcDATOS.RowCount := 1
    Else sgcDATOS.RowCount := nRow;
   End;
end;

procedure TWCrGaSoApl.MuestraGarantiaLiquida;
var CrGaSoLi : TCrGaSoLi;
    nID_CREDITO, nNUM_PERIODO, nID_SOLICITUD, nRow : Integer;
begin
  nRow := sgcDATOS.Row;
  If ( Trim(sgcDATOS.Cells[C_COL1, nRow]) <> '') Then
   Begin
    CrGaSoLi := TCrGaSoLi.Create(self);
    Try
     CrGaSoLi.Apli     := Objeto.Apli;
     CrGaSoLi.ParamCre := Objeto.ParamCre;
     nID_SOLICITUD := StrToInt(sgcDATOS.Cells[C_COL1,nRow]);
     nID_CREDITO   := StrToInt(sgcDATOS.Cells[C_COLID_CREDITO,nRow]);
     nNUM_PERIODO  := StrToInt(sgcDATOS.Cells[C_COLNUM_PERIODO,nRow]);
     CrGaSoLi.FindKey([nID_SOLICITUD, nID_CREDITO, nNUM_PERIODO]);
     CrGaSoLi.Consulta;
    Finally
     If Assigned(CrGaSoLi) Then CrGaSoLi.Free;
    End;
   End;
end;

procedure TWCrGaSoApl.MuestraGarantiaFEGA;
var vlID_SOLICITUD, vlID_SOLIC_LIQ,
    vlID_CREDITO, vlNUM_PERIODO  : Integer;

    CrGaSoFe : TCrGaSoFe;
begin
 If (Trim(sgcDATOS.Cells[C_COL2, sgcDATOS.Row]) <> '') Then
  Begin
  vlID_SOLICITUD := StrToInt(sgcDATOS.Cells[C_COL2, sgcDATOS.Row]);
  vlID_SOLIC_LIQ := StrToInt(sgcDATOS.Cells[C_COL1, sgcDATOS.Row]);
  vlID_CREDITO   := StrToInt(sgcDATOS.Cells[C_COLID_CREDITO, sgcDATOS.Row]);
  vlNUM_PERIODO  := StrToInt(sgcDATOS.Cells[C_COLNUM_PERIODO, sgcDATOS.Row]);
  If (vlID_CREDITO > 0) Then
    Begin
    CrGaSoFe := TCrGaSoFe.Create(Self);
    CrGaSoFe.Apli := Objeto.Apli;
    CrGaSoFe.ParamCre := Objeto.ParamCre;
    CrGaSoFe.FindKey([vlID_SOLICITUD, vlID_SOLIC_LIQ, vlID_CREDITO, vlNUM_PERIODO]);
    CrGaSoFe.SolicitudLiq.FindKey([vlID_SOLIC_LIQ, vlID_CREDITO, vlNUM_PERIODO]);
    CrGaSoFe.Consulta;
    If Assigned(CrGaSoFe) Then CrGaSoFe.Free;
    End;
  End;
end;

procedure TWCrGaSoApl.SolicitaGarantiaLiquida(nRow : Integer);
var CrGaSoLi : TCrGaSoLi;
    vlstrID_CREDITO, vlstrNUM_PERIODO : String;
begin
  If (Trim(sgcDATOS.Cells[C_COL1, nRow]) <> '') Then
      MuestraGarantiaLiquida
  Else
   Begin
      CrGaSoLi := TCrGaSoLi.Create(self);
      Try
       CrGaSoLi.Apli := dmMain.apMain;
       CrGaSoLi.ParamCre := Objeto.ParamCre;
       CrGaSoLi.m_nID_CREDITO := StrToInt(sgcDATOS.Cells[C_COLID_CREDITO,nRow]);
       CrGaSoLi.m_nNUM_PERIODO := StrToInt(sgcDATOS.Cells[C_COLNUM_PERIODO,nRow]);
       CrGaSoLi.ShowWindow(ftCaptura);
      Finally
       CrGaSoLi.Free;
      End;
   End;
end;

procedure TWCrGaSoApl.SolicitaGarantiaFEGA(nRow : Integer);
var CrGaSoFe : TCrGaSoFe;
    vlstrID_CREDITO, vlstrNUM_PERIODO : String;
begin
 If (Trim(sgcDATOS.Cells[C_COL1, nRow]) = '') Then
  Begin
     If (MessageDlg('Para poder solicitar la Garantía FEGA, debe de haberse solicitado y aplicado la Garantía Líquida antes.'+coCRLF+
                    '¿Desea solicitar la Garantía Líquida en este momento?',mtWarning,[mbYes, mbNo],0) = mrYes) Then
        SolicitaGarantiaLiquida(nRow);
  End
 Else If (Trim(sgcDATOS.Cells[C_COL2, nRow]) <> '') Then
       Begin
            MuestraGarantiaFEGA;
       End
     Else
        Begin
         If ( Trim(sgcDATOS.Cells[C_COL3, nRow]) <> CSIT_LQ ) Then
            MessageDlg('Para poder solicitar la Garantía FEGA, debe de estar previamente aplicada'+coCRLF+
                       'la solicitud de Garantía Líquida.',mtInformation,[mbOk],0)
         Else
             Begin
                CrGaSoFe := TCrGaSoFe.Create(Self);
                Try
                  CrGaSoFe.Apli := dmMain.apMain;
                  CrGaSoFe.ParamCre := Objeto.ParamCre;
                  CrGaSoFe.m_nID_SOLIC_LIQ := StrToInt(sgcDATOS.Cells[C_COL1, nRow]);
                  CrGaSoFe.m_nID_CREDITO   := StrToInt(sgcDATOS.Cells[C_COLID_CREDITO, nRow]);
                  CrGaSoFe.m_nNUM_PERIODO  := StrToInt(sgcDATOS.Cells[C_COLNUM_PERIODO, nRow]);
                  CrGaSoFe.ShowWindow(ftCaptura);
                Finally
                  CrGaSoFe.Free;
                End;
             End;
       End;
end;


procedure TWCrGaSoApl.sgcDATOSDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  With sgcDATOS Do
   Begin
    Case ACol Of
     C_COLIMP_ADEUDO  : Canvas.TextRect(Rect, Rect.Right - Canvas.TextWidth(Cells[ACol, ARow]), Rect.Top, Cells[ACol, ARow]);
     C_COLNUM_PERIODO, C_COLF_ALTA_LIQ, C_COLF_ALTA_FEGA :
     Canvas.TextRect(Rect,Rect.Left +(Rect.Right - Rect.Left - Canvas.TextWidth(Cells[ACol, ARow])) div 2,Rect.Top,Cells[ACol, ARow]);
    Else
     Canvas.TextRect(Rect, Rect.Left, Rect.Top, Cells[ACol, ARow]);
    End; 
   End;

 btSolFEGA.Enabled := Trim((sgcDATOS.Cells[C_COLF_ALTA_LIQ,sgcDATOS.Row])) <> '';
 btnFmt8FIRA.Enabled := Trim((sgcDATOS.Cells[C_COLF_ALTA_FEGA,sgcDATOS.Row])) <> '';
 btnFmt9FIRA.Enabled := btnFmt8FIRA.Enabled;   
end;

procedure TWCrGaSoApl.chbxID_CONTROL_EXTClick(Sender: TObject);
begin
  If Not chbxID_CONTROL_EXT.Enabled Then
   edID_CONTROL_EXT.Text := '';
end;

procedure TWCrGaSoApl.btID_CONTROL_EXTClick(Sender: TObject);
Var T:TInterFindit;
begin
  With Objeto Do
   Begin
      T := CreaBuscador('ICrGaSA1.it','');
      Try if Active then begin end;
          if T.Execute then
            Begin
            edID_CONTROL_EXT.Text := T.DameCampo(0);
            ilID_CREDITO.Buffer := T.DameCampo(1);
            ilID_CREDITOEjecuta(Self);
            chbxID_CONTROL_EXT.Checked := True;
            End;
      finally  T.Free;
      end;
  End;
end;


procedure TWCrGaSoApl.chbxF_LiqClick(Sender: TObject);
begin
  If (Not chbxID_CONTROL_EXT.Checked) Then
   Begin
   edF_INICIO.Text := '';
   edF_FINAL.Text := '';
   End;
end;

procedure TWCrGaSoApl.edF_INICIOChange(Sender: TObject);
begin
 If Not (chbxF_Liq.Checked) Then
  chbxF_Liq.Checked := True;
end;

procedure TWCrGaSoApl.edF_INICIOExit(Sender: TObject);
begin
 With Objeto Do
  Begin
  F_INICIO.GetFromControl;
  F_FINAL.GetFromControl;
  If (Not F_INICIO.IsNull) Then
   If (F_INICIO.AsDateTime > F_FINAL.AsDateTime) And (Not F_FINAL.IsNull) Then
    ShowMessage('La fecha de Inicio no debe ser mayor que la Fecha Final.');
  End;
end;

procedure TWCrGaSoApl.edF_FINALExit(Sender: TObject);
begin
 With Objeto Do
  Begin
  F_INICIO.GetFromControl;
  F_FINAL.GetFromControl;
  If (Not F_FINAL.IsNull) Then
   If (F_FINAL.AsDateTime < F_INICIO.AsDateTime) And (Not F_INICIO.IsNull) Then
    ShowMessage('La fecha de Inicio no debe ser mayor que la Fecha de Inicio.');
  End;
end;

procedure TWCrGaSoApl.btID_CRED_EXTERNOClick(Sender: TObject);
Var T:TInterFindit;
begin
  With Objeto Do
   Begin
      T := CreaBuscador('ICrGaSA2.it','');
      Try if Active then begin end;
          if T.Execute then
            Begin
            edID_CRED_EXTERNO.Text := T.DameCampo(0);
            ilID_CREDITO.Buffer := T.DameCampo(1);
            ilID_CREDITOEjecuta(Self);
            chbxID_CRED_EXTERNO.Checked := True;
            End;
      finally  T.Free;
      end;
  End;
end;

procedure TWCrGaSoApl.ilID_CRED_EXTERNOEjecuta(Sender: TObject);

 function ObtenCredito(pID_CRED_EXTERNO : String) : Integer;
 var vlQry : TQuery;
 begin
  Result := -1;
  vlQry := TQuery.Create(Nil);
  If Assigned(vlQry) Then
   With (vlQry) Do
    Try
     DatabaseName := Objeto.DatabaseName;
     SessionName := Objeto.SessionName;
     SQL.Clear;
     SQL.Add(' SELECT ID_CREDITO FROM CR_CREDITO WHERE ID_CRED_EXTERNO = '+SQLStr(pID_CRED_EXTERNO));
     Open;
     Result := FieldByName('ID_CREDITO').AsInteger;
     Close;
    Finally
     vlQry.Free;
    End;
 end;

var nID_CREDITO : Integer;
begin
 With Objeto Do
  Begin
  nID_CREDITO := ObtenCredito(ilID_CRED_EXTERNO.Buffer);
  If (nID_CREDITO > -1) Then
    Begin
    edID_CRED_EXTERNO.Text := ilID_CRED_EXTERNO.Buffer;
    ID_CREDITO.AsInteger := nID_CREDITO;
    ilID_CREDITO.Buffer := IntToStr(nID_CREDITO);
    ilID_CRED_EXTERNOEjecuta(Self);
    chbxID_CRED_EXTERNO.Checked := True;
    End;
  End;
end;

procedure TWCrGaSoApl.chbxID_CRED_EXTERNOClick(Sender: TObject);
begin
  If Not chbxID_CONTROL_EXT.Enabled Then
   edID_CONTROL_EXT.Text := '';
end;

procedure TWCrGaSoApl.sgcDATOSDblClick(Sender: TObject);
begin
 Solicita(1);
end;

procedure TWCrGaSoApl.MostrarGarantaLquida1Click(Sender: TObject);
begin
 MuestraGarantiaLiquida;
 MuestraDatos;
end;

procedure TWCrGaSoApl.MostrarGarantaFEGA1Click(Sender: TObject);
begin
 MuestraGarantiaFEGA;
 MuestraDatos;
end;

// Metódo 1 es para Líquida
// Metódo 2 es para FEGA
procedure TWCrGaSoApl.Solicita(pnMetodo : Integer);
var nRow : Integer;
begin
  nRow := sgcDATOS.Row;
  Case pnMetodo  Of
   1 : SolicitaGarantiaLiquida(nRow);
   2 : SolicitaGarantiaFEGA(nRow);
  End;
  MuestraDatos;
end;

procedure TWCrGaSoApl.btSolLiqClick(Sender: TObject);
begin
 Solicita(1);
end;

procedure TWCrGaSoApl.btSolFEGAClick(Sender: TObject);
begin
 Solicita(2);
end;

procedure TWCrGaSoApl.btnFmt8FIRAClick(Sender: TObject);
begin
 Formato8FIRA(Objeto.Apli, StrToInt(sgcDATOS.Cells[C_COL2,sgcDATOS.Row]) )
                                                //    |
                                                //    |________________________ SOLICITUD_FEGA
end;

procedure TWCrGaSoApl.btnFmt9FIRAClick(Sender: TObject);
begin
 Formato9FIRA(Objeto.Apli, StrToInt(sgcDATOS.Cells[C_COL2,sgcDATOS.Row]) )
                                                //    |
                                                //    |________________________ SOLICITUD_FEGA

end;

end.
