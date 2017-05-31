// Sistema         : Clase de CR_CON_ADEUDO_HIS
// Fecha de Inicio : 16/07/2008
// Función forma   : Clase de CR_CON_ADEUDO_HIS
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrCoAdHi;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm, DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, Grids, DBGrids,
IntWFind, IntGenCre, IntLinkit,
IntDmMain,
IntParamCre, DBCtrls   // Parametros
;

Type
 TCrCoAdHi = class;

  TWCrConAdeudoHis=Class(TForm)
    InterForma1             : TInterForma;
    PageControl1: TPageControl;
    tbsht1: TTabSheet;
    tbhst2: TTabSheet;
    GroupBox1: TGroupBox;
    lblIMP_CAP_VIG: TLabel;
    lblIMP_CAP_IMP: TLabel;
    lblIMP_CAP_VDO_EX: TLabel;
    lblIMP_CAP_VDO_NE: TLabel;
    edIMP_CAP_VIG: TInterEdit;
    edIMP_CAP_IMP: TInterEdit;
    edIMP_CAP_VDO_EX: TInterEdit;
    GroupBox2: TGroupBox;
    lblIMP_INT_VIG: TLabel;
    lblIMP_INT_IMP: TLabel;
    lblIMP_INT_VDO_EX: TLabel;
    edIMP_INT_VIG: TInterEdit;
    edIMP_INT_IMP: TInterEdit;
    edIMP_INT_VDO_EX: TInterEdit;
    DataSource1: TDataSource;
    lblF_CIERRE: TLabel;
    Label8: TLabel;
    edID_CREDITO: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    edNOMBRE: TEdit;
    edDESC_L_PRODUCTO: TEdit;
    edID_ACREDITADO: TEdit;
    edCVE_PRODUCTO_CRE: TEdit;
    DBGrid1: TDBGrid;
    Label11: TLabel;
    QryCR_CON_ADEUDO_HIS: TQuery;
    edIMP_CAP_VDO_NE: TInterEdit;
    QryCR_CON_ADEUDO_HISFH_MODIFICACION: TDateTimeField;
    QryCR_CON_ADEUDO_HISIMP_CAP_VIG: TFloatField;
    QryCR_CON_ADEUDO_HISIMP_CAP_IMP: TFloatField;
    QryCR_CON_ADEUDO_HISIMP_CAP_VDO_EX: TFloatField;
    QryCR_CON_ADEUDO_HISIMP_CAP_VDO_NE: TFloatField;
    QryCR_CON_ADEUDO_HISIMP_INT_VIG: TFloatField;
    QryCR_CON_ADEUDO_HISIMP_INT_IMP: TFloatField;
    QryCR_CON_ADEUDO_HISIMP_INT_VDO_EX: TFloatField;
    QryCR_CON_ADEUDO_HISCVE_USU_MODIFICA: TStringField;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    lblIMP_INT_VDO_NE: TLabel;
    edIMP_INT_VDO_NE: TInterEdit;
    dtpF_CIERRE: TInterDateTimePicker;
    QryCR_CON_ADEUDO_HISF_CIERRE: TDateTimeField;
    edF_CIERRE: TEdit;
    ilID_CREDITO: TInterLinkit;
    btIdCredito: TBitBtn;
    QryCR_CON_ADEUDO_HISNOMBRE: TStringField;
    Label1: TLabel;
    memMotivo: TMemo;
    lblMotivo: TLabel;
    DBMemMotivo: TDBMemo;
    lblTX_MOTIVO: TLabel;
    QryCR_CON_ADEUDO_HISTX_MOTIVO: TMemoField;
    DBText1: TDBText;
    DBText2: TDBText;
    lblTX_MOTIVO1: TLabel;
    DatabaseDWHC: TDatabase;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure tbhst2Show(Sender: TObject);
    procedure dtpF_CIERRECloseUp(Sender: TObject);
    procedure edF_CIERREExit(Sender: TObject);
    procedure ilID_CREDITOCapture(Sender: TObject; var Show: Boolean);
    procedure btIdCreditoClick(Sender: TObject);
    procedure ilID_CREDITOEjecuta(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrCoAdHi;

end;
 TCrCoAdHi= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ParamCre    : TParamCre;

        vgDatabaseDWHC   : TDataBase;

        ID_CREDITO       : TInterCampo;
        F_CIERRE         : TInterCampo;

        ID_ACREDITADO    : TInterCampo;
        NOMBRE           : TInterCampo;
        CVE_PRODUCTO_CRE : TInterCampo;
        DESC_L_PRODUCTO  : TInterCampo;

        IMP_CAP_VIG      : TInterCampo;
        IMP_CAP_IMP      : TInterCampo;
        IMP_CAP_VDO_EX   : TInterCampo;
        IMP_CAP_VDO_NE   : TInterCampo;
        IMP_INT_VIG      : TInterCampo;
        IMP_INT_IMP      : TInterCampo;
        IMP_INT_VDO_EX   : TInterCampo;
        IMP_INT_VDO_NE   : TInterCampo;
        TX_MOTIVO        : TInterCampo;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        procedure   ColocaDatosCredito;
        procedure   ColocaSaldosConsAdeudo;
        procedure   ColocaDatos;
        function    Add_Months(peFecha : TDateTime; penAgregaMes : Integer) : TDateTime;
        procedure   InicializaBasedeDatos(pestrPrefijoBase : String);
        function    ExisteEnCOINCRE(peID_CREDITO : Integer; peF_OPERACION : TDateTime; penAgregaMes : Integer) : Boolean;
        function    ActualizaSaldos : Boolean;
        function    TraspasaDisposicion : Boolean;
        Function    InternalPost : Boolean; override;
      published
      end;

implementation
{$R *.DFM}


constructor TCrCoAdHi.Create( AOwner : TComponent );
begin Inherited;
      ID_CREDITO :=CreaCampo('ID_CREDITO',ftInteger,tsNinguno,tsNinguno,False);
      ID_CREDITO.Caption:='No. Disposición';

      F_CIERRE :=CreaCampo('F_CIERRE',ftDate,tsNinguno,tsNinguno,False);
      F_CIERRE.Caption:='Fecha de Cierre';

      ID_ACREDITADO := CreaCampo('ID_ACREDITADO',ftInteger,tsNinguno,tsNinguno,False);
      ID_ACREDITADO.Caption:='Id. Acreditado';

      NOMBRE := CreaCampo('NOMBRE',ftString,tsNinguno,tsNinguno,False);
      NOMBRE.Caption:='Nombre Acreditado';

      CVE_PRODUCTO_CRE :=CreaCampo('CVE_PRODUCTO_CRE',ftString,tsNinguno,tsNinguno,False);
      CVE_PRODUCTO_CRE.Caption:='Clave del Producto';

      DESC_L_PRODUCTO  :=CreaCampo('DESC_L_PRODUCTO',ftString,tsNinguno,tsNinguno,False);
      DESC_L_PRODUCTO.Caption:='Producto';

      IMP_CAP_VIG :=CreaCampo('IMP_CAP_VIG',ftFloat,tsNinguno,tsNinguno,False);
      IMP_CAP_VIG.Caption:='Imp. Capital Vigente';

      IMP_CAP_IMP :=CreaCampo('IMP_CAP_IMP',ftFloat,tsNinguno,tsNinguno,False);
      IMP_CAP_IMP.Caption:='Imp. Capital Impagado';

      IMP_CAP_VDO_EX :=CreaCampo('IMP_CAP_VDO_EX',ftFloat,tsNinguno,tsNinguno,False);
      IMP_CAP_VDO_EX.Caption:='Imp. Capital Vdo. Exigible';

      IMP_CAP_VDO_NE :=CreaCampo('IMP_CAP_VDO_NE',ftFloat,tsNinguno,tsNinguno,False);
      IMP_CAP_VDO_NE.Caption:='Imp. Capital Vdo. No Exigible';

      IMP_INT_VIG :=CreaCampo('IMP_INT_VIG',ftFloat,tsNinguno,tsNinguno,False);
      IMP_INT_VIG.Caption:='Imp. Interés Vigente';

      IMP_INT_IMP :=CreaCampo('IMP_INT_IMP',ftFloat,tsNinguno,tsNinguno,False);
      IMP_INT_IMP.Caption:='Imp. Interés Impagado';

      IMP_INT_VDO_EX :=CreaCampo('IMP_INT_VDO_EX',ftFloat,tsNinguno,tsNinguno,False);
      IMP_INT_VDO_EX.Caption:='Imp. Interés Vdo. Exigible';

      IMP_INT_VDO_NE :=CreaCampo('IMP_INT_VDO_NE',ftFloat,tsNinguno,tsNinguno,False);
      IMP_INT_VDO_NE.Caption:='Imp. Interés Vdo. No Exigible';

      TX_MOTIVO  := CreaCampo('TX_MOTIVO',ftString,tsNinguno,tsNinguno,False);
      TX_MOTIVO.Caption:='Motivo de la actualización';

      FKeyFields.Add('F_CIERRE');
      FKeyFields.Add('ID_CREDITO');
      TableName := 'CR_CON_ADEUDO_SDO';

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrCoAdHi.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrCoAdHi.Destroy;
begin
  inherited;
end;

function TCrCoAdHi.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrConAdeudoHis;
begin
   W:=TWCrConAdeudoHis.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftGrid; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      W.InterForma1.ShowBtnEliminar := False;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrCoAdHi.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICRCCAH.IT','');
      Try if Active then begin end;
          if T.Execute then
            Begin
            InternalBusca := FindKey([T.DameCampo(0), T.DameCampo(1)]);
            ColocaDatos;
            End;
      finally  T.Free;
      end;
end;

(***********************************************FORMA CR_CON_ADEUDO_HIS********************)
(*                                                                              *)
(*  FORMA DE CR_CON_ADEUDO_HIS                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_CON_ADEUDO_HIS********************)

procedure TWCrConAdeudoHis.FormShow(Sender: TObject);
begin
  With Objeto Do
    Begin
    lbDempresa.Caption := ParamCre.EMPRESA.AsString;
    lbDfecha.Caption   := ParamCre.FECHA.AsString;
    lbDUsuario.Caption := ParamCre.USUARIO.AsString;
    lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

    ID_CREDITO.Control := edID_CREDITO;
    F_CIERRE.Control := edF_CIERRE;

    ID_ACREDITADO.Control    := edID_ACREDITADO;
    NOMBRE.Control           := edNOMBRE;
    CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO_CRE;
    DESC_L_PRODUCTO.Control  := edDESC_L_PRODUCTO;

    IMP_CAP_VIG.Control := edIMP_CAP_VIG;
    IMP_CAP_IMP.Control := edIMP_CAP_IMP;
    IMP_CAP_VDO_EX.Control := edIMP_CAP_VDO_EX;
    IMP_CAP_VDO_NE.Control := edIMP_CAP_VDO_NE;
    IMP_INT_VIG.Control := edIMP_INT_VIG;
    IMP_INT_IMP.Control := edIMP_INT_IMP;
    IMP_INT_VDO_EX.Control := edIMP_INT_VDO_EX;
    IMP_INT_VDO_NE.Control := edIMP_INT_VDO_NE;
    TX_MOTIVO.Control := memMotivo;

//    vgDatabaseDWHC := DatabaseDWHC;

    F_CIERRE.AsDateTime := (Apli.DameFechaEmpresa - 1);
    End;
end;

procedure TWCrConAdeudoHis.FormDestroy(Sender: TObject);
begin
  With Objeto Do
    Begin
    ID_CREDITO.Control := Nil;
    F_CIERRE.Control := Nil;

    ID_ACREDITADO.Control    := Nil;
    NOMBRE.Control           := Nil;
    CVE_PRODUCTO_CRE.Control := Nil;
    DESC_L_PRODUCTO.Control  := Nil;

    IMP_CAP_VIG.Control := Nil;
    IMP_CAP_IMP.Control := Nil;
    IMP_CAP_VDO_EX.Control := Nil;
    IMP_CAP_VDO_NE.Control := Nil;
    IMP_INT_VIG.Control := Nil;
    IMP_INT_IMP.Control := Nil;
    IMP_INT_VDO_EX.Control := Nil;
    IMP_INT_VDO_NE.Control := Nil;
    TX_MOTIVO.Control := Nil;

//    vgDatabaseDWHC := Nil;
    End;
end;

procedure TWCrConAdeudoHis.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DatabaseDWHC.Close;
  Action := caFree;
end;

procedure TCrCoAdHi.ColocaSaldosConsAdeudo;
var vlQry : TQuery;
begin
  F_CIERRE.GetFromControl;
  ID_CREDITO.GetFromControl;
  If (Trim(ID_CREDITO.AsString) = '') Then
    Exit;

  vlQry := GetSQLQueryNoNil(' SELECT *'+coCRLF+
                            ' FROM CR_CON_ADEUDO_SDO WHERE F_CIERRE = '+SQLFecha(F_CIERRE.AsDateTime)+coCRLF+
                            '  AND ID_CREDITO = '+ID_CREDITO.AsString,
                            Apli.DatabaseName, Apli.SessionName, True);
  If Assigned(vlQry) Then
    Begin
    With vlQry Do
      Try
        IMP_CAP_VIG.AsFloat    := FieldByName('IMP_CAP_VIG').AsFloat;
        IMP_CAP_IMP.AsFloat    := FieldByName('IMP_CAP_IMP').AsFloat;
        IMP_CAP_VDO_EX.AsFloat := FieldByName('IMP_CAP_VDO_EX').AsFloat;
        IMP_CAP_VDO_NE.AsFloat := FieldByName('IMP_CAP_VDO_NE').AsFloat;
        IMP_INT_VIG.AsFloat    := FieldByName('IMP_INT_VIG').AsFloat;
        IMP_INT_IMP.AsFloat    := FieldByName('IMP_INT_IMP').AsFloat;
        IMP_INT_VDO_EX.AsFloat := FieldByName('IMP_INT_VDO_EX').AsFloat;
        IMP_INT_VDO_NE.AsFloat := FieldByName('IMP_INT_VDO_NE').AsFloat;
      Finally
        Close;
      End;
    End
  Else
    Begin
    IMP_CAP_VIG.AsFloat    := 0;
    IMP_CAP_IMP.AsFloat    := 0;
    IMP_CAP_VDO_EX.AsFloat := 0;
    IMP_CAP_VDO_NE.AsFloat := 0;
    IMP_INT_VIG.AsFloat    := 0;
    IMP_INT_IMP.AsFloat    := 0;
    IMP_INT_VDO_EX.AsFloat := 0;
    IMP_INT_VDO_NE.AsFloat := 0;

    MessageDlg('No se encontró saldo para la disposición '+ID_CREDITO.AsString+' con Fecha Especifcica '+SQLFecha(F_CIERRE.AsDateTime),
               mtWarning, [mbOk], 0);
    End;
end;

procedure TCrCoAdHi.ColocaDatosCredito;
var vlQry : TQuery;
begin
  ID_CREDITO.GetFromControl;
  vlQry := GetSQLQueryNoNil('  SELECT CC.ID_CREDITO, CTO.ID_TITULAR AS ID_ACREDITADO, P.NOMBRE, CO.CVE_PRODUCTO_CRE, CP.DESC_L_PRODUCTO'+coCRLF+
                            '  FROM CR_CREDITO CC, CR_CONTRATO CO, CONTRATO CTO, PERSONA P, CR_PRODUCTO CP'+coCRLF+
                            '  WHERE CC.ID_CREDITO = '+ID_CREDITO.AsString+coCRLF+
                            '    AND CO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
                            '    AND CTO.ID_CONTRATO = CO.ID_CONTRATO AND P.ID_PERSONA = CTO.ID_TITULAR'+coCRLF+
                            '    AND CP.CVE_PRODUCTO_CRE = CO.CVE_PRODUCTO_CRE'+coCRLF+
                            ' UNION'+coCRLF+
                            '  SELECT CC.ID_CREDITO, CTO.ID_TITULAR AS ID_ACREDITADO, P.NOMBRE, TO_CHAR(CO.CVE_SUB_TIP_BCO) AS CVE_SUB_TIP_BCO, CSTB.DESC_SUB_TIPO'+coCRLF+
                            '  FROM CRE_CREDITO CC, CRE_CONTRATO CO, CONTRATO CTO, PERSONA P, CRE_SUB_TIP_BCO CSTB'+coCRLF+
                            '  WHERE CC.ID_CREDITO = '+ID_CREDITO.AsString+coCRLF+
                            '    AND CO.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
                            '    AND CTO.ID_CONTRATO = CO.ID_CONTRATO AND P.ID_PERSONA = CTO.ID_TITULAR'+coCRLF+
                            '    AND CSTB.CVE_SUB_TIP_BCO = CO.CVE_SUB_TIP_BCO'+coCRLF,
                            Apli.DatabaseName, Apli.SessionName, True);

  If Assigned(vlQry) Then
    Begin
      With vlQry Do
        Try
          ID_ACREDITADO.AsString    := FieldByName('ID_ACREDITADO').AsString;
          NOMBRE.AsString           := FieldByName('NOMBRE').AsString;
          CVE_PRODUCTO_CRE.AsString := FieldByName('CVE_PRODUCTO_CRE').AsString;
          DESC_L_PRODUCTO.AsString  := FieldByName('DESC_L_PRODUCTO').AsString;
        Finally
          Close;
        End;
    End
  Else
    Begin
    ID_CREDITO.AsString       := ''; 
    ID_ACREDITADO.AsString    := '';
    NOMBRE.AsString           := '';
    CVE_PRODUCTO_CRE.AsString := '';
    DESC_L_PRODUCTO.AsString  := '';
    End;
end;

procedure TCrCoAdHi.InicializaBasedeDatos(pestrPrefijoBase : String);
begin
{ If Not vgDatabaseDWHC.Connected Then
   With vgDatabaseDWHC Do
     Begin
     AliasName := pestrPrefijoBase + 'DWHC';
     Params.Clear;
     Params.Add('USER NAME=SISTEMAS');
     If (pestrPrefijoBase = 'D') Then
       Params.Add('PASSWORD=DESARROLLO')
     Else If (pestrPrefijoBase = 'P') Then
       Params.Add('PASSWORD=DEVELOP');
     Connected := True;
     End;    }   // SE COMENTA PARA TOMAR CONFIGURACIÓN DEL DBConecta JFOF DIC-2013
end;

function TCrCoAdHi.Add_Months(peFecha : TDateTime; penAgregaMes : Integer) : TDateTime;
var vlFecha : Real;
begin
  Result := peFecha;
  If GetSQLFloat( ' SELECT ADD_MONTHS('+SQLFecha(peFecha)+','+IntToStr(penAgregaMes)+') AS FECHA FROM DUAL ',
                 Apli.DataBaseName, Apli.SessionName, 'FECHA', vlFecha, True) Then
    Result := TDateTime(vlFecha);
end;

function TCrCoAdHi.ExisteEnCOINCRE(peID_CREDITO : Integer; peF_OPERACION : TDateTime; penAgregaMes : Integer) : Boolean;
var vlSQL : String;
    vlnTotal : Integer;
begin
  Result := False;
  vlSQL :=  ' SELECT COUNT(*) AS TOTAL'+coCRLF+
            ' FROM DM_CR_FAC_CREDITO@DWHC DCFC,'+coCRLF+
            '      DM_CR_DIM_CREDITO@DWHC DCDC,'+coCRLF+
            '      ( SELECT DCDM.ANIO, DCDM.MES, DCDM.ID_ANIO_MES'+coCRLF+
            '        FROM DM_CR_DIM_MES@DWHC DCDM'+coCRLF+
            '        WHERE DCDM.NUM_MES = TO_NUMBER(TO_CHAR(ADD_MONTHS('+SQLFecha(peF_OPERACION)+','+IntToStr(penAgregaMes)+'),''MM''))'+coCRLF+
            '          AND DCDM.ANIO = TO_NUMBER(TO_CHAR(ADD_MONTHS('+SQLFecha(peF_OPERACION)+','+IntToStr(penAgregaMes)+'),''YYYY''))'+coCRLF+
            '      ) DCDM'+coCRLF+
            ' WHERE DCFC.ID_ANIO_MES = DCDM.ID_ANIO_MES'+coCRLF+
            '   AND DCDC.CREDITO = TO_CHAR('+IntToStr(peID_CREDITO)+')'+coCRLF+
            '   AND DCDC.ID_CREDITO = DCFC.ID_CREDITO'+coCRLF;

  If GetSQLInt(vlSQL, Apli.DatabaseName, Apli.SessionName, 'TOTAL', vlnTotal, True) Then
    Result := vlnTotal > 0;
end;

function TCrCoAdHi.TraspasaDisposicion : Boolean;
var vlStp : TStoredProc;
    vlFecha : TDateTime;
    vlAnio, vlMes, vlDia : Word;
begin
  Result := False;
  vlStp := TStoredProc.Create(Nil);
  With vlStp Do
  If dmMain.dbMainDWHC.Connected Then
     Try
       //Inicia el SPT
       vlStp.DatabaseName := dmMain.dbMainDWHC.DatabaseName;//vgDatabaseDWHC.DatabaseName;
       vlStp.SessionName  := dmMain.dbMainDWHC.SessionName;//vgDatabaseDWHC.SessionName;
       StoredProcName:= 'PKGCRNEWCOINCRE.STP_TRASP_DISP_A_MES_ANT';

       Params.Clear;
       Params.CreateParam( ftInteger,'peID_CREDITO',    ptInput);
       Params.CreateParam( ftInteger,'peNUM_ANIO_ALTA', ptInput);
       Params.CreateParam( ftInteger,'peNUM_MES_ALTA',  ptInput);
       Params.CreateParam( ftString, 'peCVE_USU_ALTA',  ptInput);
       Params.CreateParam( ftInteger,'psRESULTADO',     ptOutput);
       Params.CreateParam( ftString, 'psTX_RESULTADO',  ptOutput);
       Prepare;

       // Se tiene que agregar 1 mes; porque por lo general Existe en el mes siguiente la disposición
       // Todo esto se debe a la queridisima FECHA VALOR
       vlFecha := Add_Months(F_CIERRE.AsDateTime, 1);
       DecodeDate(vlFecha, vlAnio, vlMes, vlDia);

       // Asigna los valores
       ParamByName('peID_CREDITO').AsInteger    := ID_CREDITO.AsInteger;
       ParamByName('peNUM_ANIO_ALTA').AsInteger := vlAnio;
       ParamByName('peNUM_MES_ALTA').AsInteger  := vlMes;
       ParamByName('peCVE_USU_ALTA').AsString   := DameUsuario;

       ExecProc;
       If (ParamByName('psRESULTADO').AsInteger = 0) Then
         Begin
         Result := True;
         End
       Else
         Begin
         MessageDlg(ParamByName('psTX_RESULTADO').AsString, mtError, [mbOk], 0);
         End;

     Finally
       Free;
     End;
end;

function TCrCoAdHi.ActualizaSaldos : Boolean;
var vlStp : TStoredProc;
    vlstrPrefijoBase : String;
begin
  Result := False;
  F_CIERRE.GetFromControl;
  ID_CREDITO.GetFromControl;
  IMP_CAP_VIG.GetFromControl;
  IMP_CAP_IMP.GetFromControl;
  IMP_CAP_VDO_EX.GetFromControl;
  IMP_CAP_VDO_NE.GetFromControl;
  IMP_INT_VIG.GetFromControl;
  IMP_INT_IMP.GetFromControl;
  IMP_INT_VDO_EX.GetFromControl;
  IMP_INT_VDO_NE.GetFromControl;
  TX_MOTIVO.GetFromControl;

  // Realiza la pregunta de que si existe en COINCRE en el mes siguiente a la Fecha de Cierre,
  // pero NO EXISTE en el mes Actual en CONICRE, entonces...
  // Pregunta al Usuario si lo quiere adicionar para este Mes
  If ( Not ExisteEnCOINCRE(ID_CREDITO.AsInteger, F_CIERRE.AsDateTime, 0)) Then
     Begin
        If (MessageDlg('La Disposición no existe en COINCRE para este mes de '+
                       FormatDateTime('MMMM', F_CIERRE.AsDateTime)+','+coCRLF+
                       '¿Desea que se reporte en este?',
                       mtConfirmation, [mbYes, mbNo], 0) = mrYes) Then
          Begin
          vlstrPrefijoBase  := ParamStr(1);
          InicializaBasedeDatos(vlstrPrefijoBase);
          // Traspasa la disposición
          TraspasaDisposicion;
          End;
     End;

  vlStp := TStoredProc.Create(Nil);
  With vlStp Do
     Try
       //Inicia el SPT
       vlStp.DatabaseName := Apli.DatabaseName;
       vlStp.SessionName  := Apli.SessionName;
       StoredProcName:= 'PKGCRCONSOLIDADO1.STP_MOD_CONS_Y_COINC';

       Params.Clear;
       Params.CreateParam( ftInteger,'peID_CREDITO', ptInput);
       Params.CreateParam( ftDate,   'peF_CIERRE', ptInput);
       Params.CreateParam( ftFloat,  'peIMP_CAP_VIG', ptInput);
       Params.CreateParam( ftFloat,  'peIMP_CAP_IMP', ptInput);
       Params.CreateParam( ftFloat,  'peIMP_CAP_VDO_EX', ptInput);
       Params.CreateParam( ftFloat,  'peIMP_CAP_VDO_NE', ptInput);
       Params.CreateParam( ftFloat,  'peIMP_INT_VIG', ptInput);
       Params.CreateParam( ftFloat,  'peIMP_INT_IMP', ptInput);
       Params.CreateParam( ftFloat,  'peIMP_INT_VDO_EX', ptInput);
       Params.CreateParam( ftFloat,  'peIMP_INT_VDO_NE', ptInput);
       Params.CreateParam( ftString, 'peCVE_USU_MODIFICA', ptInput);
       Params.CreateParam( ftString, 'peTX_MOTIVO', ptInput);       
       Params.CreateParam( ftString, 'peB_COMMIT', ptInput);
       Params.CreateParam( ftInteger,'psRESULTADO', ptOutput);
       Params.CreateParam( ftString, 'psTX_RESULTADO', ptOutput);

       ParamByName('peID_CREDITO').AsInteger       := ID_CREDITO.AsInteger;
       ParamByName('peF_CIERRE').AsDate            := F_CIERRE.AsInteger;
       ParamByName('peIMP_CAP_VIG').AsFloat        := IMP_CAP_VIG.AsFloat;
       ParamByName('peIMP_CAP_IMP').AsFloat        := IMP_CAP_IMP.AsFloat;
       ParamByName('peIMP_CAP_VDO_EX').AsFloat     := IMP_CAP_VDO_EX.AsFloat;
       ParamByName('peIMP_CAP_VDO_NE').AsFloat     := IMP_CAP_VDO_NE.AsFloat;
       ParamByName('peIMP_INT_VIG').AsFloat        := IMP_INT_VIG.AsFloat;
       ParamByName('peIMP_INT_IMP').AsFloat        := IMP_INT_IMP.AsFloat;
       ParamByName('peIMP_INT_VDO_EX').AsFloat     := IMP_INT_VDO_EX.AsFloat;
       ParamByName('peIMP_INT_VDO_NE').AsFloat     := IMP_INT_VDO_NE.AsFloat;
       ParamByName('peCVE_USU_MODIFICA').AsString  := DameUsuario;
       ParamByName('peTX_MOTIVO').AsString         := TX_MOTIVO.AsString;
       ParamByName('peB_COMMIT').AsString          := 'V';

       ExecProc;
       If (ParamByName('psRESULTADO').AsInteger = 0) Then
         Begin
         Result := True;
         End
       Else
         Begin
         MessageDlg(ParamByName('psTX_RESULTADO').AsString, mtError, [mbOk], 0);
         End;

     Finally
       Free;
     End;
end;

procedure TCrCoAdHi.ColocaDatos;
begin
   ID_CREDITO.GetFromControl;
   If (ID_CREDITO.AsString = '') Then
     Begin
     MessageDlg('Favor de indicar el No. de Disposición', mtWarning, [mbOk], 0);
     Exit;
     End;
   ColocaDatosCredito;
   ColocaSaldosConsAdeudo;
   TX_MOTIVO.AsString := '';
end;

procedure TWCrConAdeudoHis.tbhst2Show(Sender: TObject);
begin
  Objeto.F_CIERRE.getFromControl;
  Objeto.ID_CREDITO.getFromControl;

  If (Trim(Objeto.ID_CREDITO.AsString) = '') Then
    Exit;

  With QryCR_CON_ADEUDO_HIS Do
    Begin
    QryCR_CON_ADEUDO_HIS.Close;

    DatabaseName := Objeto.Apli.DatabaseName;
    SessionName  := Objeto.Apli.SessionName;

    If Active Then Close;
    SQL.Clear;
    SQL.Add( ' SELECT CCAH.*, U.ID_PERSONA, P.NOMBRE'+coCRLF+
             ' FROM ADMIPROD.CR_CON_ADEUDO_HIS CCAH,'+coCRLF+
             '      USUARIO U,'+coCRLF+
             '      PERSONA P'+coCRLF+
             ' WHERE CCAH.ID_CREDITO = '+Objeto.ID_CREDITO.AsString+coCRLF+
             '   AND U.CVE_USUARIO = CCAH.CVE_USU_MODIFICA'+coCRLF+
             '   AND P.ID_PERSONA = U.ID_PERSONA'+coCRLF+
             ' ORDER BY CCAH.FH_MODIFICACION DESC'+coCRLF
           );
    Open;
    End;
end;

procedure TWCrConAdeudoHis.dtpF_CIERRECloseUp(Sender: TObject);
begin
  edF_CIERRE.Text := DateToStr(dtpF_CIERRE.Date);
  Objeto.ID_CREDITO.GetFromControl;
  If (Objeto.ID_CREDITO.AsString <> '') Then
     Objeto.ColocaDatos;
end;

procedure TWCrConAdeudoHis.edF_CIERREExit(Sender: TObject);
begin
if edF_CIERRE.Text <> '' then
 begin
  dtpF_CIERRE.Date := StrToDate(edF_CIERRE.Text);
  Objeto.ID_CREDITO.GetFromControl;
  If (Objeto.ID_CREDITO.AsString <> '') Then
     Objeto.ColocaDatos;
 end;
end;

procedure TWCrConAdeudoHis.ilID_CREDITOCapture(Sender: TObject;
  var Show: Boolean);
begin
  Show := True;
end;

procedure TWCrConAdeudoHis.btIdCreditoClick(Sender: TObject);
Var vlInterFindit : TInterFindit;
begin
   if Objeto.ValidaAccesoEsp('TCRCOADHI_DISP',True,True) then
   begin
      VlInterFindit := Objeto.CreaBuscador('ICRCCAS.IT','');
      Try
        If vlInterFindit.Execute Then
          Begin
          Objeto.ID_CREDITO.AsInteger := StrToInt(vlInterFindit.DameCampo(0));
          Objeto.ColocaDatos;
          End;
      Finally
          vlInterFindit.Free;
      End;
   end;   
end;

procedure TWCrConAdeudoHis.ilID_CREDITOEjecuta(Sender: TObject);
begin
 Objeto.ColocaDatos;
end;

function TCrCoAdHi.InternalPost: Boolean;
begin
  Result := False;
  If ((Modo = moEdit) Or (Modo = moAppend)) Then
    Begin
      If ActualizaSaldos Then
        Begin
        MessageDlg('Saldos Actualizados', mtInformation, [mbOk],  0);
        Result := True;
        End
      Else
        Begin
        MessageDlg('Error al actualizar saldos', mtError, [mbOk],  0);
        End;
    End
  Else
    Begin
    Result := Inherited InternalPost;
    End;
end;

procedure TWCrConAdeudoHis.InterForma1DespuesNuevo(Sender: TObject);
begin
  If edF_CIERRE.CanFocus Then edF_CIERRE.SetFocus;
  memMotivo.Clear;
end;

procedure TWCrConAdeudoHis.InterForma1DespuesModificar(Sender: TObject);
begin
  If edF_CIERRE.CanFocus Then edF_CIERRE.SetFocus;
  memMotivo.Clear;
end;

procedure TWCrConAdeudoHis.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
  If (Trim(memMotivo.Text) = '') Then
    Begin
    MessageDlg('Favor de indicar el motivo.', mtWarning, [mbOk], 0);
    If memMotivo.CanFocus Then memMotivo.SetFocus;
    Realizado := False;
    End;
end;

end.
