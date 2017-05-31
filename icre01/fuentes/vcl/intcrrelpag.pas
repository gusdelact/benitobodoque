// Sistema         : Clase de CRCIERRE
// Fecha de Inicio : 09/12/2003
// Función forma   : Clase de CRCIERRE
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrRelPag;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, IntLinkit,
InterApl, IntCtoPanel, Grids, Aligrid, IntSGCtrl,

IntParamCre,
IntGenCre,
IntBasicCred,   // Clase Vacía de Crédito
IntInvPagare,   // Pagaré
IntCtoHeader    // Contrato Corporativo
;

Type
 TCrRelPag = class;

  TWCrRelPag=Class(TForm)
    InterForma1             : TInterForma;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    Label1: TLabel;
    edID_CREDITO: TEdit;
    btnID_CREDITO: TBitBtn;
    edNOM_CREDITO: TEdit;
    edID_PAGARE: TEdit;
    edNOM_PAGARE: TEdit;
    btnID_PAGARE: TBitBtn;
    Label2: TLabel;
    lbF_ALTA: TLabel;
    lbF_MODIFICA: TLabel;
    LBCVE_USU_ALTA: TLabel;
    lbCVE_USU_MODIFICA: TLabel;
    rgSIT_REL_PAG_DISP: TRadioGroup;
    edF_MODIFICA: TEdit;
    edF_ALTA: TEdit;
    edCVE_USU_MODIFICA: TEdit;
    edCVE_USU_ALTA: TEdit;
    rgbxPagare: TGroupBox;
    lblFH_REGISTRO: TLabel;
    lblF_APERTURA: TLabel;
    lblF_VENCIMIENTO: TLabel;
    lblDIAS_PLAZO: TLabel;
    lblIMP_CAPITAL: TLabel;
    lblIMP_INT_VTO: TLabel;
    lblTASA_NETA: TLabel;
    lblPCT_ISR: TLabel;
    lblIMP_NETO_VTO: TLabel;
    lblCVE_SIT_PAGARE: TLabel;
    cbxCVE_IMP_RENOV: TComboBox;
    lblCVE_IMP_RENOV: TLabel;
    edFH_REGISTRO: TEdit;
    dtpFH_REGISTRO: TInterDateTimePicker;
    edF_APERTURA: TEdit;
    dtpF_APERTURA: TInterDateTimePicker;
    edF_VENCIMIENTO: TEdit;
    dtpF_VENCIMIENTO: TInterDateTimePicker;
    edIMP_CAPITAL: TInterEdit;
    edIMP_INT_VTO: TInterEdit;
    edTASA_NETA: TInterEdit;
    edPCT_ISR: TInterEdit;
    edIMP_NETO_VTO: TInterEdit;
    edDIAS_PLAZO: TInterEdit;
    cbxCVE_SIT_PAGARE: TComboBox;
    lblIMP_RENOVAR: TLabel;
    edIMP_RENOVAR: TInterEdit;
    ilID_CREDITO: TInterLinkit;
    icpCONTRATO: TInterCtoPanel;
    btnCancela: TBitBtn;
    grpbxPagare: TGroupBox;
    Panel1: TPanel;
    sgcDATOS: TStringAlignGrid;
    lblIMP_CREDITO: TLabel;
    edIMP_CREDITO: TInterEdit;
    edDESC_ORIGEN: TEdit;
    lblCVE_ORIGEN: TLabel;
    edCVE_PRESUPUESTO: TEdit;
    lblCVE_MDO_OBJETIVO: TLabel;
    edDESC_PRESUPUESTO: TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure btnID_CREDITOClick(Sender: TObject);
    procedure ilID_CREDITOCapture(Sender: TObject; var Show: Boolean);
    procedure ilID_CREDITOEjecuta(Sender: TObject);
    procedure btnID_PAGAREClick(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure btnCancelaClick(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure sgcDATOSSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure InterForma1AntesNuevo(Sender: TObject;
      var Realizado: Boolean);
    private
    { Private declarations }
      procedure MuestraDatos;
      procedure MuestraPagaresdelCredito;
      procedure MuestraInformacion;
      procedure ActSituacionBtnCancela;
      procedure AsignaValores(peID_CREDITO : Integer);
    public
    { Public declarations }
    Objeto : TCrRelPag;
end;
 TCrRelPag= class(TInterFrame)
      private
        vgID_CREDITO      : Integer;
      protected
      public
        { Public declarations }
        ParamCre          : TParamCre;

        ID_REL_PAG_DISP   : TInterCampo;
        ID_PAGARE         : TInterCampo;
        ID_CONTRATO       : TInterCampo;
        ID_CREDITO        : TInterCampo;
        CVE_SIT_PAGARE    : TInterCampo;
        CVE_IMP_RENOV     : TInterCampo;
        SIT_REL_PAG_DISP  : TInterCampo;
        F_ALTA            : TInterCampo;
        CVE_USU_ALTA      : TInterCampo;
        F_MODIFICA        : TInterCampo;
        CVE_USU_MODIFICA  : TInterCampo;
        NOM_CREDITO       : TInterCampo;
        CVE_MONEDA        : TInterCampo;

        // <SATV4766 05/12/2008>
        DESC_ORIGEN       : TInterCampo;
        CVE_PRESUPUESTO   : TInterCampo;
        DESC_PRESUPUESTO  : TInterCampo;
        // </SATV4766 05/12/2008>

        IMP_CREDITO       : TInterCampo;

        BasicCred         : TBasicCred; // Clase de Disposición Básic
        Pagare            : TInvPagare; // Pagaré
        Contrato          : TCtrlCto;   // Contrato Corporativo

        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    InternalPost : Boolean; override;
        function    InternalBusca : Boolean; override;
      published
      end;

function Obten_NombreTitular(nID_CONTRATO : Integer; Apli : TInterApli) : String;

implementation
//Uses RepMon;

{$R *.DFM}

function Obten_NombreTitular(nID_CONTRATO : Integer; Apli : TInterApli) : String;
var Qry : TQuery;
begin
 Result := '';
 If Assigned(Apli) Then
  Begin
  Qry := TQuery.Create(Nil);
  If Assigned(Qry) Then
   With Qry Do
    Try
     SessionName  := Apli.SessionName;
     DataBaseName := Apli.DataBaseName;
     SQL.Clear;
     SQL.Add(
             ' SELECT (PF.NOMBRE_PERSONA || '' '' || PF.APELLIDO_PATERNO || '' '' || PF.APELLIDO_MATERNO || PM.NOM_RAZON_SOCIAL) AS NOMBRE'#13#10+
             ' FROM CONTRATO CTO,'#13#10+
             '      PERSONA_FISICA PF,'#13#10+
             '      PERSONA_MORAL PM'#13#10+
             ' WHERE CTO.ID_CONTRATO = '+IntToStr(nID_CONTRATO)+#13#10+
             '   AND PF.ID_PERSONA (+)= CTO.ID_TITULAR'#13#10+
             '   AND PM.ID_PERSONA (+)= CTO.ID_TITULAR'#13#10
             );
     Open;
     Result := FieldByName('NOMBRE').AsString;
    Finally
     Free;
    End;
  End;
end;

constructor TCrRelPag.Create( AOwner : TComponent );
begin Inherited;
      ID_REL_PAG_DISP :=CreaCampo('ID_REL_PAG_DISP',ftFloat,tsNinguno,tsNinguno,True);
                ID_REL_PAG_DISP.Caption:='Número de Rel Pag Disp';
      ID_CONTRATO :=CreaCampo('ID_CONTRATO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CONTRATO.Caption:='Número de Contrato';
      ID_PAGARE :=CreaCampo('ID_PAGARE',ftFloat,tsNinguno,tsNinguno,True);
                ID_PAGARE.Caption:='Número de Pagare';
      ID_CREDITO :=CreaCampo('ID_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CREDITO.Caption:='Número de Credito';
      SIT_REL_PAG_DISP :=CreaCampo('SIT_REL_PAG_DISP',ftString,tsNinguno,tsNinguno,True);
                SIT_REL_PAG_DISP.Caption:='Situación Rel Pag Disp';
      With SIT_REL_PAG_DISP do
      begin
        Size:=2;
        UseCombo:=True;
        ComboLista.Add('0'); ComboDatos.Add(CSIT_AC);
        ComboLista.Add('1'); ComboDatos.Add(CSIT_CA);
      end;
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
      FKeyFields.Add('ID_REL_PAG_DISP');
      FKeyFields.Add('ID_CONTRATO');
      FKeyFields.Add('ID_PAGARE');
      FKeyFields.Add('ID_CREDITO');

      TableName := 'CR_REL_PAG_DISP';
      UseQuery := True;
      HelpFile := 'IntCrRePaDi.Hlp';
      ShowMenuReporte:=True;

      CVE_SIT_PAGARE    := CreaCampo('CVE_SIT_PAGARE',ftString,tsNinguno,tsNinguno,False);
      With CVE_SIT_PAGARE Do
        Begin
        Size:=2;
        UseCombo:=True;
        ComboLista.Add('Activo');         ComboDatos.Add('AC');
        ComboLista.Add('Renovado');       ComboDatos.Add('RE');
        ComboLista.Add('Vencido');        ComboDatos.Add('VE');
        ComboLista.Add('Por activar');    ComboDatos.Add('PA');
        ComboLista.Add('Por autorizar');  ComboDatos.Add('PU');
        End;
      CVE_IMP_RENOV     := CreaCampo('CVE_IMP_RENOV',ftString,tsNinguno,tsNinguno,False);
      With CVE_IMP_RENOV Do
        Begin
        Size:=2;
        UseCombo:=True;
        ComboLista.Add('Total al vencer'); comboDatos.Add('TO');
        ComboLista.Add('Solo Capital');    comboDatos.Add('CP');
        ComboLista.Add('Importe');         comboDatos.Add('IM');
        ComboLista.Add('No Renovar');      comboDatos.Add('NA');
        End;

      IMP_CREDITO := CreaCampo('IMP_CREDITO',ftFloat,tsNinguno,tsNinguno,False);

      // <SATV4766 05/12/2008>
      DESC_ORIGEN := CreaCampo('DESC_ORIGEN',ftString,tsNinguno,tsNinguno,False);
      CVE_PRESUPUESTO := CreaCampo('CVE_PRESUPUESTO',ftString,tsNinguno,tsNinguno,False);
      DESC_PRESUPUESTO := CreaCampo('DESC_PRESUPUESTO',ftString,tsNinguno,tsNinguno,False);
      // </SATV4766 05/12/2008>

      {$WARNINGS OFF}
      Pagare := TInvPagare.Create(Self);
      {$WARNINGS ON}
      Pagare.MasterSource := Self;
      Pagare.FieldByName('ID_PAGARE').MasterField := 'ID_PAGARE';

      {$WARNINGS OFF}
      Contrato := TCtrlCto.Create(Self);
      {$WARNINGS ON}
      Contrato.MasterSource:=Self;
      Contrato.FieldByName('ID_CONTRATO').MasterField:='ID_CONTRATO';

      // Campos que no pertenecen a la tabla
      NOM_CREDITO :=CreaCampo('NOM_CREDITO',ftString,tsNinguno,tsNinguno,False);
      CVE_MONEDA  :=CreaCampo('CVE_MONEDA',ftInteger,tsNinguno,tsNinguno,False);

      vgID_CREDITO := 0;
end;

Destructor TCrRelPag.Destroy;
begin
 If Assigned(Pagare) Then Pagare.Free;
 If Assigned(Contrato) Then Contrato.Free;
 Inherited;
end;

function TCrRelPag.ShowWindow(FormaTipo:TFormaTipo) : Integer;
var W : TWCrRelPag;
begin
   W:=TWCrRelPag.Create(Self);
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

function TCrRelPag.InternalPost : Boolean;
var  stpRelPagDisp : TStoredProc;
     vlCVE_USU_ALTA : String;
     vlF_ALTA : TDateTime;
     VLSalida  : Boolean;
begin
     VLSalida := False;
     If Modo = moEdit Then
       Begin
       Result := Inherited InternalPost;
       VLSalida := True;
       End;
     If Modo = moAppend Then
        Begin
          stpRelPagDisp := TStoredProc.Create(Nil);
          try
            If Assigned(stpRelPagDisp) Then
            With stpRelPagDisp Do
               Begin
               DatabaseName := Apli.DatabaseName;
               SessionName  := Apli.SessionName;
               StoredProcName := 'PKGCRCREDITOO1.STP_REL_PAG_DISP';
               // Crea variables
               Params.CreateParam(ftFloat ,'peID_CREDITO',ptInput);
               Params.CreateParam(ftFloat ,'peID_CONTRATO',ptInput);
               Params.CreateParam(ftFloat ,'peID_PAGARE',ptInput);
               Params.CreateParam(ftString,'peB_REGISTRA_GAR',ptInput);
               Params.CreateParam(ftString,'peCVE_USU_ALTA',ptInput);
               Params.CreateParam(ftDateTime,'peF_ALTA',ptInput);
               Params.CreateParam(ftString,'peB_COMPROMETE_SDO',ptInput);
               Params.CreateParam(ftString,'peB_COMMIT',ptInput);
               Params.CreateParam(ftFloat ,'psID_REL_PAG_DISP',ptOutput);
               Params.CreateParam(ftFloat ,'psRESULTADO',ptOutput);
               Params.CreateParam(ftString,'psTX_RESULTADO',ptOutput);
               // Asigna Valores
               vlCVE_USU_ALTA := DameUsuario;
               vlF_ALTA := Apli.DameFechaEmpresa;
               ParamByName('peID_CREDITO').AsFloat := ID_CREDITO.AsInteger;
               ParamByName('peID_CONTRATO').AsFloat := Pagare.ID_CONTRATO.AsInteger;
               ParamByName('peID_PAGARE').AsFloat := Pagare.ID_PAGARE.AsInteger;
               ParamByName('peB_REGISTRA_GAR').AsString := CVERDAD; // Se registra como garantía
               ParamByName('peCVE_USU_ALTA').AsString := vlCVE_USU_ALTA;
               ParamByName('peF_ALTA').AsDateTime := vlF_ALTA;
               ParamByName('peB_COMPROMETE_SDO').AsString := cVERDAD;
               ParamByName('peB_COMMIT').AsString := cVERDAD;
               ExecProc;

               // Valida el Resultado
               If (ParamByName('psRESULTADO').AsFloat <> 0) Then
                Begin
                  // Muestra el Mensaje de Error
                  showmessage(ParamByName('psTX_RESULTADO').AsString);
                End
               Else
                Begin
                // Asignación de variable interna, no se muestra
                ID_REL_PAG_DISP.AsFloat := ParamByName('psID_REL_PAG_DISP').AsFloat;
                vgID_CREDITO := ID_CREDITO.AsInteger;
                // Asignación de valores
                SIT_REL_PAG_DISP.AsString := CSIT_AC;
                CVE_USU_ALTA.AsString := vlCVE_USU_ALTA;
                F_ALTA.AsDateTime := vlF_ALTA;
                vlSalida := True;
                End;
            End;
          finally
              stpRelPagDisp.Params.Clear;
              stpRelPagDisp.Free;
          end;
        End; // If Modo = moAppend Then
        AutoRefresh := False;
        InternalPost := vlSalida;
end;

function TCrRelPag.InternalBusca : Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('CRRELPAG1.IT','F,F,F,F');
      Try if Active then begin T.Param(0,ID_REL_PAG_DISP.AsString);
                               T.Param(1,ID_CONTRATO.AsString);
                               T.Param(2,ID_PAGARE.AsString);
                               T.Param(3,ID_CREDITO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2),T.DameCampo(3)]);
      finally  T.Free;
      end;
end;

(***********************************************FORMA CRCIERRE********************)
(*                                                                              *)
(*  FORMA DE CRCIERRE                                                            *)
(*                                                                              *)
(***********************************************FORMA CRCIERRE********************)

procedure TWCrRelPag.FormShow(Sender: TObject);
begin
   With Objeto Do
    Begin
    lbDempresa.Caption := ParamCre.EMPRESA.AsString;
    lbDfecha.Caption   := ParamCre.FECHA.AsString;
    lbDUsuario.Caption := ParamCre.USUARIO.AsString;
    lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

    ID_PAGARE.Control         := edID_PAGARE;
    ID_CREDITO.Control        := edID_CREDITO;
    CVE_SIT_PAGARE.Control    := cbxCVE_SIT_PAGARE;
    CVE_IMP_RENOV.Control     := cbxCVE_IMP_RENOV;
    SIT_REL_PAG_DISP.Control  := rgSIT_REL_PAG_DISP;
    F_ALTA.Control            := edF_ALTA;
    CVE_USU_ALTA.Control      := edCVE_USU_ALTA;
    F_MODIFICA.Control        := edF_MODIFICA;
    CVE_USU_MODIFICA.Control  := edCVE_USU_MODIFICA;
    NOM_CREDITO.Control       := edNOM_CREDITO;
    IMP_CREDITO.Control       := edIMP_CREDITO;

    Pagare.FH_REGISTRO.Control       := edFH_REGISTRO;
    Pagare.F_APERTURA.Control        := edF_APERTURA;
    Pagare.F_VENCIMIENTO.Control     := edF_VENCIMIENTO;
    Pagare.DIAS_PLAZO.Control        := edDIAS_PLAZO;
    Pagare.IMP_CAPITAL.Control       := edIMP_CAPITAL;
    Pagare.IMP_INT_VTO.Control       := edIMP_INT_VTO;
    Pagare.TASA_NETA.Control         := edTASA_NETA;
    Pagare.PCT_ISR.Control           := edPCT_ISR;
    Pagare.IMP_NETO_VTO.Control      := edIMP_NETO_VTO;
    Pagare.ID_PAGARE.Control         := edID_PAGARE;
    Pagare.IMP_RENOVAR.Control       := edIMP_RENOVAR;
    Pagare.CVE_SIT_PAGARE.Control    := cbxCVE_SIT_PAGARE;
    Pagare.CVE_IMP_RENOV.Control     := cbxCVE_IMP_RENOV;

    // <SATV4766 05/12/2008>
    DESC_ORIGEN.Control              := edDESC_ORIGEN;
    CVE_PRESUPUESTO.Control          := edCVE_PRESUPUESTO;
    DESC_PRESUPUESTO.Control         := edDESC_PRESUPUESTO;
    // </SATV4766 05/12/2008>

    icpCONTRATO.Frame := Contrato;
    icpCONTRATO.RefrescaInfo;
    End;
end;

procedure TWCrRelPag.FormDestroy(Sender: TObject);
begin
   With Objeto Do
    Begin
    ID_PAGARE.Control         := Nil;
    ID_CREDITO.Control        := Nil;
    CVE_SIT_PAGARE.Control    := Nil;
    CVE_IMP_RENOV.Control     := Nil;
    SIT_REL_PAG_DISP.Control  := Nil;
    F_ALTA.Control            := Nil;
    CVE_USU_ALTA.Control      := Nil;
    F_MODIFICA.Control        := Nil;
    CVE_USU_MODIFICA.Control  := Nil;
    NOM_CREDITO.Control       := Nil;
    IMP_CREDITO.Control       := Nil;

    Pagare.FH_REGISTRO.Control       := Nil;
    Pagare.F_APERTURA.Control        := Nil;
    Pagare.F_VENCIMIENTO.Control     := Nil;
    Pagare.DIAS_PLAZO.Control        := Nil;
    Pagare.IMP_CAPITAL.Control       := Nil;
    Pagare.IMP_INT_VTO.Control       := Nil;
    Pagare.TASA_NETA.Control         := Nil;
    Pagare.PCT_ISR.Control           := Nil;
    Pagare.IMP_NETO_VTO.Control      := Nil;
    Pagare.ID_PAGARE.Control         := Nil;
    Pagare.IMP_RENOVAR.Control       := Nil;
    Pagare.CVE_SIT_PAGARE.Control    := Nil;
    Pagare.CVE_IMP_RENOV.Control     := Nil;

    // <SATV4766 05/12/2008>
    DESC_ORIGEN.Control              := Nil;
    CVE_PRESUPUESTO.Control          := Nil;
    DESC_PRESUPUESTO.Control         := Nil;
    // </SATV4766 05/12/2008>

    icpCONTRATO.Frame := Nil;
    End;
end;

procedure TWCrRelPag.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrRelPag.MuestraPagaresdelCredito;
var vlstrSQL : String;
    vlQry : TQuery;
    vlnRow : Integer;

    procedure ClearAlignGrid(StringAlignGrid : TStringAlignGrid; nStartRow : Integer = 1);
    var I, J : Integer;
    begin
     If Assigned(StringAlignGrid) Then
      With StringAlignGrid Do
       For I := nStartRow To RowCount-1 Do
        Begin
        RowHeights[I] := DefaultRowHeight;
        For J := 0 To ColCount-1 Do
           Cells[J,I] := '';
        End ;
    end;

begin
    ClearAlignGrid(sgcDATOS);
    sgcDATOS.RowCount := 1000;
    vlnRow := 1;

    If (Trim(Objeto.ID_CREDITO.AsString) <> '') Then
      Begin
          grpbxPagare.Caption := 'Pagarés Relacionados con la Disposición '+Objeto.ID_CREDITO.AsString;
          vlstrSQL :=
                     ' SELECT CRPD.ID_REL_PAG_DISP, IP.ID_CONTRATO, IP.ID_PAGARE,'+coCRLF+
                     '        SUBSTR(PKGCRCREDITOO1.STP_OBT_NOM_TITULAR(NULL,IP.ID_CONTRATO,NULL),1,255) AS NOMBRE,'+coCRLF+
                     '        IP.IMP_NETO_VTO,'+coCRLF+
                     '        IP.F_APERTURA,'+coCRLF+
                     '        IP.F_VENCIMIENTO,'+coCRLF+
                     '        IP.IMP_CAPITAL,'+coCRLF+
                     '        (IP.IMP_CAPITAL + IP.IMP_ACUM_INT - IP.IMP_ACUM_ISR) AS IMP_NETO_CORTE,'+coCRLF+
                     '        (IP.IMP_INT_VTO - IP.IMP_ISR_VTO) AS IMP_INTERES,'+coCRLF+
                     '        IP.IMP_RENOVAR,'+coCRLF+
                     '        IP.TASA_NETA,'+coCRLF+
                     '        IP.CVE_SIT_PAGARE'+coCRLF+
                     ' FROM  CR_REL_PAG_DISP CRPD,'+coCRLF+
                     '        INV_PAGARE IP '+coCRLF+
                     ' WHERE CRPD.ID_CREDITO ='+Objeto.ID_CREDITO.AsString+coCRLF+
                     '   AND IP.ID_CONTRATO = CRPD.ID_CONTRATO'+coCRLF+
                     '   AND IP.ID_PAGARE = CRPD.ID_PAGARE'+coCRLF+
                     '   AND CRPD.SIT_REL_PAG_DISP = ''AC'''+coCRLF+
                     ' ORDER BY IP.ID_PAGARE'+coCRLF;

          vlQry := GetSQLQuery(vlstrSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
          If Assigned(vlQry) Then
           Begin
             With vlQry Do
              Try
               //Datos que no se muestran
               FieldByName('ID_REL_PAG_DISP').Visible := False;

               //Formato de los datos que se muestran
               TDateField(FieldByName('F_APERTURA')).DisplayFormat := 'DD/MM/YYYY';
               TDateField(FieldByName('F_VENCIMIENTO')).DisplayFormat := 'DD/MM/YYYY';
               TNumericField(FieldByName('IMP_NETO_CORTE')).DisplayFormat := '###,###,###,###,###,###,##0.00'; // <SATV4766 05/12/2008>
               TNumericField(FieldByName('IMP_NETO_VTO')).DisplayFormat := '###,###,###,###,###,###,##0.00';               
               TNumericField(FieldByName('IMP_CAPITAL')).DisplayFormat := '###,###,###,###,###,###,##0.00';
               TNumericField(FieldByName('IMP_INTERES')).DisplayFormat := '###,###,###,###,###,###,##0.00';
               TNumericField(FieldByName('IMP_RENOVAR')).DisplayFormat := '###,###,###,###,###,###,##0.00';
               TNumericField(FieldByName('TASA_NETA')).DisplayFormat := '###,###,###,##0.000000';

               //Llena la información en el Grid
               First;
               While Not Eof Do
                Begin
                sgcDatos.Cells[ 0, vlnRow] := FieldByName('ID_REL_PAG_DISP').DisplayText;
                sgcDatos.Cells[ 1, vlnRow] := FieldByName('ID_CONTRATO').DisplayText;
                sgcDatos.Cells[ 2, vlnRow] := FieldByName('ID_PAGARE').DisplayText;
                sgcDatos.Cells[ 3, vlnRow] := FieldByName('NOMBRE').DisplayText;
                sgcDatos.Cells[ 4, vlnRow] := FieldByName('IMP_NETO_CORTE').DisplayText; // </SATV4766 05/12/2008>
                sgcDatos.Cells[ 5, vlnRow] := FieldByName('IMP_NETO_VTO').DisplayText;
                sgcDatos.Cells[ 6, vlnRow] := FieldByName('F_APERTURA').DisplayText;
                sgcDatos.Cells[ 7, vlnRow] := FieldByName('F_VENCIMIENTO').DisplayText;
                sgcDatos.Cells[ 8, vlnRow] := FieldByName('IMP_CAPITAL').DisplayText;
                sgcDatos.Cells[ 9, vlnRow] := FieldByName('IMP_INTERES').DisplayText;
                sgcDatos.Cells[10, vlnRow] := FieldByName('IMP_RENOVAR').DisplayText;
                sgcDatos.Cells[11, vlnRow] := FieldByName('TASA_NETA').DisplayText;
                sgcDatos.Cells[12, vlnRow] := FieldByName('CVE_SIT_PAGARE').DisplayText;
                Inc(vlnRow);
                Next;
                End;
              Finally
               vlQry.Close;
               vlQry.Free;
              End;
          End; // If Assigned(vlQry) Then
      End; // If (Trim(Objeto.CREDITO.ID_CREDITO.AsString) <> '') Then

      If (vlnRow = 1) Then vlnRow := 2;
      sgcDATOS.FixedRows := 1; 
      sgcDATOS.RowCount := vlnRow;
end;

procedure TWCrRelPag.MuestraDatos;
begin
   MuestraPagaresdelCredito;
   If btnID_PAGARE.CanFocus Then btnID_PAGARE.SetFocus;
end;

procedure TWCrRelPag.btnID_CREDITOClick(Sender: TObject);
Var T : TInterFindit;
    vlstrID_CREDITO  : String;
    BasicCred : TBasicCred;
begin
   if Objeto.ValidaAccesoEsp('TCRRELPAG_DISP',True,True) then
   begin
     // Codigo Anterior
     With Objeto Do
       Begin
         // T := CreaBuscador('ICrCredi.it','F');   Original
         T := CreaBuscador('CONSDISP.IT','');
         Try
          If Active Then
            T.Param(0,ID_CREDITO.AsString);
          If T.Execute Then
            Begin
            vlstrID_CREDITO := T.DameCampo(0);
            BasicCred := CreaTBCredito(StrToInt(vlstrID_CREDITO), Objeto.Apli);
            If Assigned(BasicCred) Then
               Begin
               ID_CREDITO.AsInteger := BasicCred.ID_CREDITO.AsInteger;
               NOM_CREDITO.AsString := BasicCred.NOM_ACREDITADO.AsString;
               IMP_CREDITO.AsFloat  := BasicCred.IMP_CREDITO.AsFloat;
               CVE_MONEDA.AsInteger := BasicCred.CVE_MONEDA.AsInteger;

               // <SATV4766 05/12/2008>
               DESC_ORIGEN.AsString      := BasicCred.DESC_ORIGEN.AsString;
               CVE_PRESUPUESTO.AsString  := BasicCred.CVE_PRESUPUESTO.AsString;
               DESC_PRESUPUESTO.AsString := BasicCred.DESC_PRESUPUESTO.AsString;
               // </SATV4766 05/12/2008>

               // Activa los controles
               MuestraDatos;
               InterForma1.NextTab(edID_CREDITO);
               BasicCred.Free;
               End;
            End;
        Finally
         T.Free;
        End;
      End;
   end;
end;

procedure TWCrRelPag.btnID_PAGAREClick(Sender: TObject);
Var  T : TInterFindit;
     vlID_CONTRATO, vlID_PAGARE : Integer;
begin
   if Objeto.ValidaAccesoEsp('TCRRELPAG_PAGARE',True,True) then
   begin
       With Objeto Do
       Begin
          T := CreaBuscador('CRRELPAG.IT','I,I,S,F,D,F,S');
          // T.WhereString := ' CTO.CVE_MONEDA = '+CVE_MONEDA.AsString+' AND IP.CVE_SIT_PAGARE NOT IN (''CA'')';
          T.WhereString := ' IP.CVE_SIT_PAGARE NOT IN (''CA'')'; // </SATV4766 Se elimina el filtro de Moneda 27Ene2009>
          Try if Active then begin
                             T.Param(0,ID_CONTRATO.AsString);
                             T.Param(1,ID_PAGARE.AsString);
                             end;
              If T.Execute Then
               Begin
               vlID_CONTRATO := StrToInt(T.DameCampo(0));
               vlID_PAGARE   := StrToInt(T.DameCampo(1));
               Pagare.FindKey([vlID_CONTRATO,vlID_PAGARE]);
               Contrato.FindKey([vlID_CONTRATO]);
               icpCONTRATO.RefrescaInfo;
               edNOM_PAGARE.Text := Obten_NombreTitular(vlID_CONTRATO,Apli);
               End;
          Finally  T.Free;
          End;
       End;
   end;
end;

procedure TWCrRelPag.ilID_CREDITOCapture(Sender: TObject;
  var Show: Boolean);
begin
 Show := True;
end;

procedure TWCrRelPag.AsignaValores(peID_CREDITO : Integer);
var BasicCred : TBasicCred;
begin
 With Objeto Do
    Begin
    BasicCred := CreaTBCredito(peID_CREDITO, Objeto.Apli);
    If Assigned (BasicCred) Then
      Begin
      ID_CREDITO.AsInteger := BasicCred.ID_CREDITO.AsInteger;
      NOM_CREDITO.AsString := BasicCred.NOM_ACREDITADO.AsString;
      IMP_CREDITO.AsFloat  := BasicCred.IMP_CREDITO.AsFloat;
      CVE_MONEDA.AsInteger := BasicCred.CVE_MONEDA.AsInteger;

      // <SATV4766 05/12/2008>
      DESC_ORIGEN.AsString      := BasicCred.DESC_ORIGEN.AsString;
      CVE_PRESUPUESTO.AsString  := BasicCred.CVE_PRESUPUESTO.AsString;
      DESC_PRESUPUESTO.AsString := BasicCred.DESC_PRESUPUESTO.AsString;
      // </SATV4766 05/12/2008>

      MuestraDatos;
      InterForma1.NextTab(edID_CREDITO);
      End;
   End;
end;

procedure TWCrRelPag.ilID_CREDITOEjecuta(Sender: TObject);
begin
 If (Trim(ilID_CREDITO.Buffer) <> '') Then
   AsignaValores( StrToInt(ilID_CREDITO.Buffer) );
end;

procedure TWCrRelPag.InterForma1DespuesNuevo(Sender: TObject);
begin
 edNOM_PAGARE.Text := '';
 If edID_CREDITO.CanFocus Then edID_CREDITO.SetFocus;
 With Objeto Do
   If (vgID_CREDITO <> 0) Then
    AsignaValores(vgID_CREDITO);
end;

procedure TWCrRelPag.InterForma1DespuesCancelar(Sender: TObject);
begin
 MuestraInformacion;
end;

procedure TWCrRelPag.InterForma1DespuesAceptar(Sender: TObject);
begin
 With Objeto Do
  Begin
  MuestraPagaresdelCredito;
  ActSituacionBtnCancela;
  End;
end;

procedure TWCrRelPag.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
var vlstrMessage : String;
begin
   vlstrMessage := '';
   If IsNewData Then
    vlstrMessage := '¿Desea almacenar los datos capturados?'
   Else If InterForma1.CanEdit Then
    vlstrMessage := '¿Desea guardar los datos modificados?';
   If (vlstrMessage <> '') Then
    Realizado := MessageDlg(vlstrMessage, mtConfirmation,[mbYes, mbNo], 0) = mrYes;
end;

procedure TWCrRelPag.btnCancelaClick(Sender: TObject);

   procedure CancelaRelPagDisp;
   var stpCancRelPagDisp : TStoredProc;
       vlCVE_USU_MODIFICA : String;
       vlF_MODIFICA : TDateTime;
   begin
          stpCancRelPagDisp := TStoredProc.Create(Nil);
          If Assigned(stpCancRelPagDisp) Then
           With stpCancRelPagDisp Do
             Begin
             DatabaseName := Objeto.Apli.DatabaseName;
             SessionName  := Objeto.Apli.SessionName;
             StoredProcName := 'PKGCRCREDITOO1.STP_CANC_REL_PAG_DISP';
             // Crea variables
             Params.CreateParam(ftFloat ,'peID_REL_PAG_DISP',ptInput);
             Params.CreateParam(ftString,'peCVE_USU_MODIFICA',ptInput);
             Params.CreateParam(ftDateTime,'peF_MODIFICA',ptInput);
             Params.CreateParam(ftString,'peB_COMMIT',ptInput);
             Params.CreateParam(ftFloat ,'psRESULTADO',ptOutput);
             Params.CreateParam(ftString,'psTX_RESULTADO',ptOutput);
             // Asigna Valores
             vlCVE_USU_MODIFICA := Objeto.DameUsuario;
             vlF_MODIFICA := Objeto.Apli.DameFechaEmpresa;
             ParamByName('peID_REL_PAG_DISP').AsFloat := Objeto.ID_REL_PAG_DISP.AsInteger;
             ParamByName('peCVE_USU_MODIFICA').AsString := vlCVE_USU_MODIFICA;
             ParamByName('peF_MODIFICA').AsDateTime := vlF_MODIFICA;
             ParamByName('peB_COMMIT').AsString := CVERDAD;
             ExecProc;

             If (ParamByName('psRESULTADO').AsFloat <> 0) Then
              Begin
              // Muestra el Mensaje de Error
              MessageDlg(ParamByName('psTX_RESULTADO').AsString,mtError,[mbOk],0);
              End
             Else
              Begin
              // Actualiza la situación a Cancelado
              MessageDlg('La "Relación de Pagaré - Disposición" fue Cancelado.',mtInformation,[mbOk],0);
              Objeto.FindKey([Objeto.ID_REL_PAG_DISP.AsInteger,
                              Objeto.ID_CONTRATO.AsInteger,
                              Objeto.ID_PAGARE.AsInteger,
                              Objeto.ID_CREDITO.AsInteger
                             ]);
              End;
             stpCancRelPagDisp.Params.Clear;
             stpCancRelPagDisp.Free;
             End; // End With stpCancRelPagDisp Do
   end;

begin
   if Objeto.ValidaAccesoEsp('TCRRELPAG_PAGARE',True,True) then
   begin
      With Objeto Do
      Begin
       If (MessageDlg('¿Desea cancelar la "Relación de Pagaré '+ID_PAGARE.AsString+
                      ' con la Disposición '+ID_CREDITO.AsString+'"?.',mtConfirmation,[mbYes, mbNo],0) = mrYes) Then
        Begin
        CancelaRelPagDisp;
        ActSituacionBtnCancela;
        MuestraPagaresdelCredito;
        End;
      End;
   end;
end;

procedure TWCrRelPag.ActSituacionBtnCancela;
begin
  btnCancela.Enabled := Objeto.SIT_REL_PAG_DISP.AsString = CSIT_AC;
end;

procedure TWCrRelPag.InterForma1DespuesShow(Sender: TObject);
begin
  ActSituacionBtnCancela;
end;

procedure TWCrRelPag.InterForma1Buscar(Sender: TObject);
begin
 With Objeto Do
 If Busca Then
  Begin
  vgID_CREDITO := ID_CREDITO.AsInteger;
  MuestraInformacion;
  End;
end;

procedure TWCrRelPag.InterForma1DespuesModificar(Sender: TObject);
begin
 edID_CREDITO.ReadOnly := True;
end;

procedure TWCrRelPag.MuestraInformacion;
var BasicCred : TBasicCred;
begin
 With Objeto Do
  If (ID_CREDITO.AsInteger <> 0) Then
   Begin
   Contrato.FindKey([ID_CONTRATO.AsInteger]);
   Pagare.FindKey([ID_CONTRATO.AsInteger,ID_PAGARE.AsInteger]);
   icpCONTRATO.RefrescaInfo;
   edNOM_PAGARE.Text  := Obten_NombreTitular(Objeto.ID_CONTRATO.AsInteger, Objeto.Apli);
   BasicCred := CreaTBCredito(ID_CREDITO.AsInteger, Objeto.Apli);
   If Assigned(BasicCred) Then
     Begin
     edNOM_CREDITO.Text := BasicCred.NOM_ACREDITADO.AsString;
     IMP_CREDITO.AsFloat  := BasicCred.IMP_CREDITO.AsFloat;

     // <SATV4766 05/12/2008>
     DESC_ORIGEN.AsString      := BasicCred.DESC_ORIGEN.AsString;
     CVE_PRESUPUESTO.AsString  := BasicCred.CVE_PRESUPUESTO.AsString;
     DESC_PRESUPUESTO.AsString := BasicCred.DESC_PRESUPUESTO.AsString;
     // </SATV4766 05/12/2008>

     BasicCred.Free;
     End;
   ActSituacionBtnCancela;
   End
  Else
   Begin
   edID_CREDITO.Text := '';
   edNOM_PAGARE.Text := '';
   End;
 MuestraPagaresdelCredito;
end;

procedure TWCrRelPag.sgcDATOSSelectCell(Sender: TObject; ACol,
  ARow : Integer; var CanSelect: Boolean);
var vlstrID_CONTRATO : String;
    vlstrID_PAGARE   : String;
    vlstrID_REL_PAG_DISP : String;
    BasicCred : TBasicCred;
begin
  If (Objeto.Modo = moBrowse) Then
   Begin
    vlstrID_REL_PAG_DISP := sgcDATOS.Cells[0, ARow];
    vlstrID_CONTRATO     := sgcDATOS.Cells[1, ARow];
    vlstrID_PAGARE       := sgcDATOS.Cells[2, ARow];

    If (Trim(vlstrID_REL_PAG_DISP) <> '') Then
     If ( StrToInt(vlstrID_REL_PAG_DISP) <> Objeto.ID_REL_PAG_DISP.AsInteger ) Then
      Begin
        // Encuentra Objeto
        If Objeto.FindKey([StrToInt(vlstrID_REL_PAG_DISP),
                           StrToInt(vlstrID_CONTRATO),
                           StrToInt(vlstrID_PAGARE),
                           Objeto.ID_CREDITO.AsInteger
                          ]) Then
          Begin
          // Actualiza Datos de Pagaré
          BasicCred := CreaTBCredito(Objeto.ID_CREDITO.AsInteger, Objeto.Apli);
          If Assigned(BasicCred) Then
             Begin
             edNOM_CREDITO.Text  := BasicCred.NOM_ACREDITADO.AsString;
             edIMP_CREDITO.Text  := Format(CFORMAT_DINERO, [BasicCred.IMP_CREDITO.AsFloat]);
             BasicCred.Free;
             End;
          Objeto.Pagare.FindKey([StrToInt(vlstrID_CONTRATO), StrToInt(vlstrID_PAGARE)]);
          Objeto.Contrato.FindKey([StrToInt(vlstrID_CONTRATO)]);
          icpCONTRATO.RefrescaInfo;
          edNOM_PAGARE.Text := Obten_NombreTitular(StrToInt(vlstrID_CONTRATO), Objeto.Apli);
          ActSituacionBtnCancela;
          End;
      End;

   End;
end;

procedure TWCrRelPag.InterForma1AntesNuevo(Sender: TObject;
  var Realizado: Boolean);
begin
     Objeto.Active := False;
end;

end.
