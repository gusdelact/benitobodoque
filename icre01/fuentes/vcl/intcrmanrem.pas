{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y-,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
// Sistema         : Clase de CrManRem
// Fecha de Inicio : 23/07/2003
// Función forma   : Clase de CrManRem
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrManRem;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntSGCtrl, Ungene,

//Unidades Adicionales
IntParamCre,
IntCrEmisor,
IntCrCesion,
IntCrProveed,
IntGenCre,
IntCrDocIMPr,
InterEdit, IntLinkit, Menus;

Type
 TCrManRem= class;

  TWCrManRem=Class(TForm)
    InterForma1             : TInterForma;
    lbID_EMISOR : TLabel;
    lbID_PROVEEDOR : TLabel;
    lbID_CESION : TLabel;
    lbF_PAG_INICIAL : TLabel;
    dtpF_PAG_INICIAL : TInterDateTimePicker;
    edF_PAG_INICIAL : TEdit;
    lbF_PAG_FINAL : TLabel;
    dtpF_PAG_FINAL : TInterDateTimePicker;
    edF_PAG_FINAL : TEdit;
    lbIMP_MINIMO : TLabel;
    lbIMP_MAXIMO : TLabel;
    lbSIT_MAN_REM : TLabel;
    rgSIT_MAN_REM : TRadioGroup;
    chB_APLICA_EMISOR : TCheckBox;
    chB_APLICA_PROV : TCheckBox;
    chB_APLICA_CESION : TCheckBox;
    chB_APLICA_FECHA : TCheckBox;
    chB_APLICA_IMPORTES : TCheckBox;
    edNOMBRE_CESION: TEdit;
    edNOMBRE_PROV: TEdit;
    edNOMB_EMISOR: TEdit;
    Label19: TLabel;
    BBBusca: TBitBtn;
    sgcDATOS: TSGCtrl;
    edTIT_DOCUMENTO: TEdit;
    edTIT_TIPO: TEdit;
    edTIT_IMPORTE: TEdit;
    edTIT_SIT: TEdit;
    edTIT_AUT: TEdit;
    MErrores: TMemo;
    edTIT_FVALOR: TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    edNOMBRE_EMISOR: TEdit;
    edCVE_EMISOR_NAFINSA: TEdit;
    Label2: TLabel;
    edPROV_NAFINSA: TEdit;
    btEMISOR: TBitBtn;
    btPROVEEDOR: TBitBtn;
    btCESION: TBitBtn;
    edIMP_MINIMO: TInterEdit;
    edIMP_MAXIMO: TInterEdit;
    rgTIPO: TRadioGroup;
    ilCESION: TInterLinkit;
    ilPROVEEDOR: TInterLinkit;
    ilEMISOR: TInterLinkit;
    edID_EMISOR: TEdit;
    edID_PROVEEDOR: TEdit;
    edID_CESION: TEdit;
    edTIT_FPAGO: TEdit;
    btAUTORIZA: TBitBtn;
    btCANCELA: TBitBtn;
    btLIBERA: TBitBtn;
    Label1: TLabel;
    edF_VAL_INICIAL: TEdit;
    dtpF_VAL_INICIAL: TInterDateTimePicker;
    Label3: TLabel;
    edF_VAL_FINAL: TEdit;
    dtpF_VAL_FINAL: TInterDateTimePicker;
    chB_APLICA_F_VAL: TCheckBox;
    edF_DEVOL: TEdit;
    chB_MOVTO_EFECTIVO: TCheckBox;
    chAGRUP_TODOS: TCheckBox;
    pmMODIFICA: TPopupMenu;
    Modificar1: TMenuItem;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure btEMISORClick(Sender: TObject);
    procedure chB_APLICA_EMISORClick(Sender: TObject);
    procedure btPROVEEDORClick(Sender: TObject);
    procedure chB_APLICA_PROVClick(Sender: TObject);
    procedure btCESIONClick(Sender: TObject);
    procedure chB_APLICA_CESIONClick(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure chB_APLICA_FECHAClick(Sender: TObject);
    procedure chB_APLICA_IMPORTESClick(Sender: TObject);

    Procedure MuestraDatos;
    procedure BBBuscaClick(Sender: TObject);
    procedure sgcDATOSCalcRow(Sendet: TObject; DataSet: TDataSet;
      CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
    procedure sgcDATOSDblClick(Sender: TObject);
    procedure dtpF_PAG_INICIALClick(Sender: TObject);
    procedure dtpF_PAG_FINALClick(Sender: TObject);
    procedure edIMP_MINIMOEnter(Sender: TObject);
    procedure dtpF_PAG_INICIALEnter(Sender: TObject);
    procedure dtpF_PAG_FINALEnter(Sender: TObject);
    procedure dtpF_PAG_FINALExit(Sender: TObject);
    procedure dtpF_PAG_INICIALExit(Sender: TObject);
    procedure btAUTORIZAClick(Sender: TObject);
    procedure btLIBERAClick(Sender: TObject);
    procedure edIMP_MAXIMOEnter(Sender: TObject);
    procedure ilEMISOREjecuta(Sender: TObject);
    procedure ilPROVEEDOREjecuta(Sender: TObject);
    procedure ilCESIONEjecuta(Sender: TObject);
    procedure btCANCELAClick(Sender: TObject);
    procedure rgTIPOClick(Sender: TObject);
    procedure chB_APLICA_F_VALClick(Sender: TObject);
    procedure dtpF_VAL_FINALChange(Sender: TObject);
    procedure dtpF_VAL_INICIALChange(Sender: TObject);
    procedure edF_VAL_INICIALExit(Sender: TObject);
    procedure edF_VAL_FINALExit(Sender: TObject);
    procedure dtpF_VAL_INICIALExit(Sender: TObject);
    procedure dtpF_VAL_INICIALEnter(Sender: TObject);
    procedure dtpF_VAL_FINALEnter(Sender: TObject);
    procedure dtpF_VAL_FINALExit(Sender: TObject);
    procedure chAGRUP_TODOSClick(Sender: TObject);
    procedure Modificar1Click(Sender: TObject);
  private
    vgBFValIniChange : Boolean;
    vgBFValFinChange : Boolean;
  private
    procedure AsignaFechaValor( peBandera : Boolean );
    { Private declarations }
  public
    { Public declarations }
    Objeto : TCrManRem;
  end;
 TCrManRem= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        vgCesion        : String;
        vgAcreditado    : String;
        vgProveedor     : String; //LOLS
        vgNafin         : String;
        vgCtaCargo      : String;
        vgCtaProv       : String;
        vgBanco         : String;
        vgAutoriza      : String;
        vgLibera        : String;

        ID_EMISOR                : TInterCampo;
        CVE_EMISOR_NAFIN         : TInterCampo;
        ID_PROVEEDOR             : TInterCampo;
        ID_CESION                : TInterCampo;
        F_PAG_INICIAL            : TInterCampo;
        F_PAG_FINAL              : TInterCampo;
        F_VAL_INICIAL            : TInterCampo;
        F_VAL_FINAL              : TInterCampo;
        IMP_MINIMO               : TInterCampo;
        IMP_MAXIMO               : TInterCampo;
        SIT_MAN_REM              : TInterCampo;
        B_APLICA_EMISOR          : TInterCampo;
        B_APLICA_PROV            : TInterCampo;
        B_APLICA_CESION          : TInterCampo;
        B_APLICA_FECHA           : TInterCampo;
        B_APLICA_IMPORTES        : TInterCampo;
        B_APLICA_FVAL            : TInterCampo;
        CUENTA_BANCO             : TInterCampo;
        ID_BANCO_CHQRA           : TInterCampo;
        CVE_TIPO_REM             : TInterCampo;
        B_MOVTO_EFECTIVO         : TInterCampo;

        //Clases Adicionales
        ParamCre                 : TParamCre;
        Emisor                   : TCrEmisor;
        Proveedor                : TCrProveed;
        Cesion                   : TCrCesion;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        Function    CadenaSql: String;
        Function    AutRemanente : String;
        Function    LibRemanente : String;
        Function    ObtChequera( pIdCesion , pCveEmisNafin , pIdAcreditado , pTipoAcred , pTipoChq, pMetodo : String;
                                var vlError : String ): Boolean;
        Function    AutorizaRem(vlIdCesion : String; vlIdDocumento : String;
                                vlCveTipoReman : String; var vlError : String) : Boolean;
        Function    LiberaRem(vlIdCesion : String; vlIdDocumento : String;
                              vlCveTipoReman,vlBMovtoEfectivo : String; var vlError : String) : Boolean;
        Function    Existen_Rem_x_AutoLibe(strID_CESION, strID_DOCUMENTO, strSIT_REMANENTE : String;
                                           dF_BUSCA : TDateTime; var dFECHA : TDateTime) : Boolean;
        Function    CanelaRem(vlIdCesion : String; vlIdDocumento : String;
                             vlCveTipoReman : String; var vlError : String) : Boolean;
      published
      end;

implementation

{$R *.DFM}

constructor TCrManRem.Create( AOwner : TComponent );
begin Inherited;
      ID_EMISOR :=CreaCampo('ID_EMISOR',ftInteger,tsNinguno,tsNinguno,False);
                ID_EMISOR.Caption:='Emisor';
                ID_EMISOR.Parametro:='ID_EMISOR';
      CVE_EMISOR_NAFIN :=CreaCampo('CVE_EMISOR_NAFIN',ftString,tsNinguno,tsNinguno,False);
                CVE_EMISOR_NAFIN.Caption:='Emisor NAFIN';
                CVE_EMISOR_NAFIN.Parametro:='CVE_EMISOR_NAFIN';
      ID_PROVEEDOR :=CreaCampo('ID_PROVEEDOR',ftInteger,tsNinguno,tsNinguno,False);
                ID_PROVEEDOR.Caption:='Proveedor';
                ID_PROVEEDOR.Parametro:='ID_PROVEEDOR';
      ID_CESION :=CreaCampo('ID_CESION',ftInteger,tsNinguno,tsNinguno,False);
                ID_CESION.Caption:='Cesión';
                ID_CESION.Parametro:='ID_CESION';
      F_PAG_INICIAL :=CreaCampo('F_PAG_INICIAL',ftDate,tsNinguno,tsNinguno,False);
                F_PAG_INICIAL.Caption:='F. Pago Inicial';
                F_PAG_INICIAL.Parametro:='F_PAG_INICIAL';
      F_PAG_FINAL :=CreaCampo('F_PAG_FINAL',ftDate,tsNinguno,tsNinguno,False);
                F_PAG_FINAL.Caption:='F. Pago Final';
                F_PAG_FINAL.Parametro:='F_PAG_FINAL';
      F_VAL_INICIAL := CreaCampo('F_VAL_INICIAL', ftDate, tsNinguno, tsNinguno, False );
      F_VAL_INICIAL.Caption  := 'F. Valor Inicial';
      F_VAL_INICIAL.Parametro:= 'F_VAL_INICIAL';
      F_VAL_FINAL := CreaCampo('F_VAL_FINAL', ftDate, tsNinguno, tsNinguno, False);
      F_VAL_FINAL.Caption   := 'F. Valor Final';
      F_VAL_FINAL.Parametro := 'F_VAL_FINAL';
      IMP_MINIMO :=CreaCampo('IMP_MINIMO',ftFloat,tsNinguno,tsNinguno,False);
                IMP_MINIMO.Caption:='Importe Mínimo';
                IMP_MINIMO.Parametro:='IMP_MINIMO';
      IMP_MAXIMO :=CreaCampo('IMP_MAXIMO',ftFloat,tsNinguno,tsNinguno,False);
                IMP_MAXIMO.Caption:='Importe Máximo';
                IMP_MAXIMO.Parametro:='IMP_MAXIMO';
      SIT_MAN_REM :=CreaCampo('SIT_MAN_REM',ftString,tsNinguno,tsNinguno,False);
      With SIT_MAN_REM do
      begin Size:=2;
            UseCombo:=True;
            ComboLista.Add('0'); ComboDatos.Add(CSIT_NA);
            ComboLista.Add('1'); ComboDatos.Add(CSIT_AU);
            ComboLista.Add('2'); ComboDatos.Add(CSIT_LI);
            ComboLista.Add('3'); ComboDatos.Add(CSIT_TO);
      end;
                SIT_MAN_REM.Caption:='Situación';
                SIT_MAN_REM.Parametro:='SIT_MAN_REM';
      B_APLICA_EMISOR :=CreaCampo('B_APLICA_EMISOR',ftString,tsNinguno,tsNinguno,False);
                B_APLICA_EMISOR.Caption:='';
                B_APLICA_EMISOR.Parametro:='B_APLICA_EMISOR';
      B_APLICA_PROV :=CreaCampo('B_APLICA_PROV',ftString,tsNinguno,tsNinguno,False);
                B_APLICA_PROV.Caption:='';
                B_APLICA_PROV.Parametro:='B_APLICA_PROV';
      B_APLICA_CESION :=CreaCampo('B_APLICA_CESION',ftString,tsNinguno,tsNinguno,False);
                B_APLICA_CESION.Caption:='';
                B_APLICA_CESION.Parametro:='B_APLICA_CESION';
      B_APLICA_FECHA :=CreaCampo('B_APLICA_FECHA',ftString,tsNinguno,tsNinguno,False);
                B_APLICA_FECHA.Caption:='';
                B_APLICA_FECHA.Parametro:='B_APLICA_FECHA';
      B_APLICA_FVAL :=CreaCampo('B_APLICA_FVAL',ftString,tsNinguno,tsNinguno,False);
      B_APLICA_FVAL.Caption:='';
      B_APLICA_FVAL.Parametro:='B_APLICA_FVAL';
      B_APLICA_IMPORTES :=CreaCampo('B_APLICA_IMPORTES',ftString,tsNinguno,tsNinguno,False);
                B_APLICA_IMPORTES.Caption:='';
                B_APLICA_IMPORTES.Parametro:='B_APLICA_IMPORTES';
      ID_BANCO_CHQRA :=CreaCampo('ID_BANCO_CHQRA',ftFloat,tsNinguno,tsNinguno,False);
      CUENTA_BANCO :=CreaCampo('CUENTA_BANCO',ftFloat,tsNinguno,tsNinguno,False);
      CVE_TIPO_REM :=CreaCampo('CVE_TIPO_REM',ftString,tsNinguno,tsNinguno,False);
      With CVE_TIPO_REM do
      begin Size:=2;
            UseCombo:=True;
            ComboLista.Add('0'); ComboDatos.Add(CREMANENTE);
            ComboLista.Add('1'); ComboDatos.Add(CINTERES);
            ComboLista.Add('2'); ComboDatos.Add(CCOMISION);
            ComboLista.Add('3'); ComboDatos.Add(CAMBOS);
      end;
      B_MOVTO_EFECTIVO :=CreaCampo('B_MOVTO_EFECTIVO',ftString,tsNinguno,tsNinguno,False);

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrManRem.Hlp';
      ShowMenuReporte:=True;

      Emisor := TCrEmisor.Create(Self);
      Emisor.MasterSource:=Self;
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
      Emisor.FieldByName('CVE_FND_ENT_DES').MasterField:='CVE_FND_ENT_DES';
{/ROIM}
      Emisor.FieldByName('ID_ACREDITADO').MasterField:='ID_EMISOR';
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
//      Emisor.FieldByName('CVE_EMISOR_NAFIN').MasterField:='CVE_EMISOR_NAFIN';
      Emisor.FieldByName('CVE_EMISOR_EXT').MasterField:='CVE_EMISOR_NAFIN';
{/ROIM}

      Proveedor := TCrProveed.Create(Self);
      Proveedor.MasterSource:=Self;
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
      Proveedor.FieldByName('CVE_FND_ENT_DES').MasterField:='CVE_FND_ENT_DES';
{/ROIM}
      Proveedor.FieldByName('ID_ACREDITADO').MasterField:='ID_PROVEEDOR';

      Cesion := TCrCesion.Create(Self);
      Cesion.MasterSource:=Self;
      Cesion.FieldByName('ID_CESION').MasterField:='ID_CESION';

end;

Destructor TCrManRem.Destroy;
begin
   if Emisor <> nil then
      Emisor.free;
   //end if

   if Proveedor <> nil then
      Proveedor.free;
   //end if

   if Cesion <> nil then
      Cesion.Free;
   //end if

   inherited;
end;


function TCrManRem.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrManRem;
begin
   W:=TWCrManRem.Create(Self);
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


Function TCrManRem.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrMaRe.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

Function TCrManRem.CadenaSql : String;
var vlSql     : String;
Begin
   ID_EMISOR.GetFromControl;
   CVE_EMISOR_NAFIN.GetFromControl;
   ID_PROVEEDOR.GetFromControl;
   ID_CESION.GetFromControl;
   B_APLICA_EMISOR.GetFromControl;
   B_APLICA_PROV.GetFromControl;
   B_APLICA_CESION.GetFromControl;
   B_APLICA_FECHA.GetFromControl;
   B_APLICA_FVAL.GetFromControl;
   B_APLICA_IMPORTES.GetFromControl;
   SIT_MAN_REM.GetFromControl;
   IMP_MINIMO.GetFromControl;
   CVE_TIPO_REM.GetFromControl;
   IMP_MAXIMO.GetFromControl;

   vlSql  := ' SELECT R.ID_CESION, ' +  #13#10 +
             '        R.ID_DOCUMENTO, ' +  #13#10 +
             '        DECODE( R.CVE_TIPO_REMAN,' + #39 + CREMANENTE +
                      #39 + ',' + #39 + 'REMANENTE'+ #39 + ',' + #39 + CINTERES +
                      #39 + ',' + #39 + 'INTERES'  + #39 + ',' + #39 + CCOMISION +
                      #39 + ',' + #39 + 'COMISION' + #39 + ' ) DESC_TIPO_REMAN, ' +  #13#10 +
             '        R.F_PAGO, ' +  #13#10 +
             '        R.F_VALOR, ' +  #13#10 +
             '        R.F_DEV_REMANENTE, '+  #13#10 +
             '        DECODE( R.CVE_TIPO_REMAN,'+SQLStr(CCOMISION)+',IMP_REMANENTE, IMP_DEV_REMAN ) IMP_DEV_REMAN, '+  #13#10 +
             '        R.SIT_REMANENTE, ' +  #13#10 +
                      #39 + ' ' + #39 +' AUT, ' +  #13#10 +
             '        E.ID_ACREDITADO, ' +  #13#10 +
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
//             '        E.CVE_EMISOR_NAFIN, ' +  #13#10 +
             '        E.CVE_EMISOR_EXT CVE_EMISOR_NAFIN, ' +  #13#10 +
{/ROIM}
             '        R.CVE_TIPO_REMAN,   ' +  #13#10 +
             '        P.ID_ACREDITADO ID_PROVEEDOR, ' +  #13#10 +
             '        PROV.NOMBRE NOMBRE_PROV' +  #13#10 +
             ' FROM (SELECT * FROM CR_REMANENTE R ' +
             '       WHERE ';

    vlSql  := vlSql +
             ' ((R.F_PAGO IS NOT NULL) ';
   if ((CVE_TIPO_REM.AsString = CCOMISION) OR (CVE_TIPO_REM.AsString = CAMBOS)) then
       vlSql  := vlSql +
             ' OR (R.CVE_TIPO_REMAN IN ' + #39 + 'CN' + #39 + ')) ' +  #13#10
   else
       vlSql  := vlSql +
             ' ) ' +  #13#10;
   //end if
   if B_APLICA_CESION.AsString = CVERDAD then
      vlSql := vlSql + ' AND R.ID_CESION = ' + ID_CESION.AsString;
   //end if
   if B_APLICA_IMPORTES.AsString = CVERDAD then
   Begin
      if ((IMP_MINIMO.AsFloat <> 0) and (IMP_MAXIMO.AsFloat = 0)) then
         vlsql := vlSql + ' AND R.IMP_DEV_REMAN >= ' + IMP_MINIMO.AsString
      else
      if ((IMP_MINIMO.AsFloat = 0) and (IMP_MAXIMO.AsFloat <> 0)) then
         vlsql := vlsql + ' AND R.IMP_DEV_REMAN <= ' + IMP_MAXIMO.AsString
      else
      if ((IMP_MINIMO.AsFloat <> 0) and (IMP_MAXIMO.AsFloat <> 0)) then
      Begin
         vlsql := vlsql + ' AND R.IMP_DEV_REMAN BETWEEN ' + IMP_MINIMO.AsString +
                          ' AND ' + IMP_MAXIMO.AsString;
      end;
   end;
   if SIT_MAN_REM.AsString <> CSIT_TO then
   Begin
      if SIT_MAN_REM.AsString = CSIT_NA then
         vlsql := vlsql + 'AND R.SIT_REMANENTE = ' + #39 + CSIT_NA + #39
      else if SIT_MAN_REM.AsString = CSIT_AU then
         vlsql := vlsql + 'AND R.SIT_REMANENTE = ' + #39 + CSIT_AU + #39
      else if SIT_MAN_REM.AsString = CSIT_LI then
         vlsql := vlsql + 'AND R.SIT_REMANENTE = ' + #39 + CSIT_LI + #39;
   end
   else
   begin
         vlsql := vlsql + 'AND R.SIT_REMANENTE <> ' + #39 + CSIT_CA + #39;
   end;
   if CVE_TIPO_REM.AsString <> CAMBOS then
   Begin
      if CVE_TIPO_REM.AsString = CREMANENTE then
         vlsql := vlsql + 'AND R.CVE_TIPO_REMAN = ' + #39 + CREMANENTE + #39
      else if CVE_TIPO_REM.AsString = CINTERES then
         vlsql := vlsql + 'AND R.CVE_TIPO_REMAN = ' + #39 + CINTERES + #39
      else if CVE_TIPO_REM.AsString = CCOMISION then
         vlsql := vlsql + 'AND R.CVE_TIPO_REMAN = ' + #39 + CCOMISION + #39;
   end;
   //aplica filtros para fechas en el caso diferente a comisiones
   if CVE_TIPO_REM.AsString <> CCOMISION then
   begin
       if B_APLICA_FECHA.AsString = CVERDAD then
       Begin
          vlSql := vlSql + ' AND R.F_PAGO BETWEEN TO_DATE( ' + #39 + F_PAG_INICIAL.AsString + #39 +','+ #39 +'DD/MM/YYYY' + #39 + ')' +
                           ' AND TO_DATE( ' + #39 + F_PAG_FINAL.AsString + #39 + ',' + #39 +'DD/MM/YYYY' + #39 + ') ';
       end;

       if B_APLICA_FVAL.AsString = CVERDAD then
       Begin
          vlSql := vlSql + ' AND R.F_VALOR BETWEEN ' + SQLFecha( F_VAL_INICIAL.AsDateTime )
                         + ' AND ' + SQLFecha( F_VAL_FINAL.AsDateTime ) + ' ';
       end;
   end;

       vlSql  := vlSql +
             '      ) R, ' +  #13#10 +
             '      CR_DOCUMENTO DOC, '    +  #13#10 +
             '      (SELECT * FROM CR_CAPITAL CP ' +
             '       WHERE 1=1 ';

       vlSql  := vlSql +
             '      )  CP, '    +  #13#10 +
             '      CR_CESION C, '    +  #13#10 +
             '      (SELECT * FROM CR_EMISOR E';

   if B_APLICA_EMISOR.AsString = CVERDAD then
      vlSql := vlSql + ' WHERE E.ID_ACREDITADO = ' + ID_EMISOR.AsString;
   // end if

       vlSql  := vlSql +
             '   ) E, '    +  #13#10 +
             '      (SELECT * FROM CR_PROVEEDOR P';

   if B_APLICA_PROV.AsString = CVERDAD then
      vlSql := vlSql + ' WHERE P.ID_ACREDITADO = ' + ID_PROVEEDOR.AsString;
   // end if

       vlSql  := vlSql +
             '   )  P, ' +  #13#10 +
             '      PERSONA  PROV '   +  #13#10 +
             ' WHERE R.ID_CESION = C.ID_CESION ' +  #13#10 +
             ' AND PKGCRACTUALIZA.STPOBTEMPRESA(C.ID_CESION) =' + IntToStr(Apli.IdEmpresa) + // LOLS 08 SEP 2005
             ' AND DOC.ID_CESION (+)= R.ID_CESION ' +  #13#10 +
             ' AND DOC.ID_DOCUMENTO (+)= R.ID_DOCUMENTO ' +  #13#10 +
             ' AND CP.ID_CREDITO (+)= DOC.ID_CESION ' +  #13#10 +
             ' AND CP.NUM_PERIODO (+)= DOC.NUM_PERIODO_DOC ' +  #13#10 +
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
//             ' AND E.ID_ACREDITADO = C.ID_EMISOR' +  #13#10 +
//             ' AND E.CVE_EMISOR_NAFIN = C.CVE_EMISOR_NAFIN ' +  #13#10
//             ' AND P.ID_ACREDITADO = C.ID_PROVEEDOR' +  #13#10 +
             ' AND E.CVE_FND_ENT_DES = C.CVE_FND_ENT_DES' +  #13#10 +
             ' AND E.ID_ACREDITADO = C.ID_EMISOR' +  #13#10 +
             ' AND E.CVE_EMISOR_EXT = C.CVE_EMISOR_NAFIN ' +  #13#10 +
             ' AND P.CVE_FND_ENT_DES = C.CVE_FND_ENT_DES' +  #13#10 +
             ' AND P.ID_ACREDITADO = C.ID_PROVEEDOR' +  #13#10 +
{/ROIM}
             ' AND PROV.ID_PERSONA = P.ID_ACREDITADO ';

   //aplica filtros para fechas en el caso de comisiones
   if CVE_TIPO_REM.AsString = CCOMISION then
   begin
       if B_APLICA_FECHA.AsString = CVERDAD then
       Begin
          vlSql := vlSql + ' AND CP.F_PAGO BETWEEN TO_DATE( ' + #39 + F_PAG_INICIAL.AsString + #39 +','+ #39 +'DD/MM/YYYY' + #39 + ')' +
                           ' AND TO_DATE( ' + #39 + F_PAG_FINAL.AsString + #39 + ',' + #39 +'DD/MM/YYYY' + #39 + ') ';
       end;

       if B_APLICA_FVAL.AsString = CVERDAD then
       Begin
          vlSql := vlSql + #13#10  + ' AND CP.F_VENCIMIENTO BETWEEN ' + SQLFecha( F_VAL_INICIAL.AsDateTime )
                         + #13#10  + ' AND ' + SQLFecha( F_VAL_FINAL.AsDateTime ) + ' ';
       end;
   end;


   CadenaSql := vlSql + ' ORDER BY PROV.NOMBRE, R.ID_CESION, R.ID_DOCUMENTO, R.CVE_TIPO_REMAN ';

end;

Function TCrManRem.AutRemanente : string;
Var vlSql : String;
    vlAutRem : String;
Begin
   vlSql:= ' SELECT B_AUT_REMANENTE ' +
           ' FROM CR_PERFIL_USUAR ' +
           ' WHERE CVE_GPO_ACCESO = ' + IntToStr(Apli.CvePerfil) +
           ' and CVE_TIPO_USUARIO = ' + SQLStr(CPERFIL_ADMIN);
   GetSQLStr(vlsql,Apli.DataBaseName,Apli.SessionName,'B_AUT_REMANENTE',vlAutRem, False);
   if vlAutRem = CNULL then
   Begin
     vlAutRem := CFALSO;
   end;
   AutRemanente:= vlAutRem;
End;

Function TCrManRem.LibRemanente : String;
Var vlSql : String;
    vlLibRem : String;
Begin
   vlSql:= ' SELECT B_LIB_REMANENTE ' +
           ' FROM CR_PERFIL_USUAR ' +
           ' WHERE CVE_GPO_ACCESO = ' + IntToStr(Apli.CvePerfil) +
           ' and CVE_TIPO_USUARIO = ' + SQLStr(CPERFIL_ADMIN);
   GetSQLStr(vlsql,Apli.DataBaseName,Apli.SessionName,'B_LIB_REMANENTE',vlLibRem, False);
   if vlLibRem = CNULL then
   Begin
     vlLibRem := CFALSO;
   end;
   LibRemanente:= vlLibRem;
End;
{---------------------------------------------------------------------------------------------------------------------
                                                Obtiene Chequera
----------------------------------------------------------------------------------------------------------------------}
Function  TCrManRem.ObtChequera( pIdCesion , pCveEmisNafin , pIdAcreditado , pTipoAcred , pTipoChq, pMetodo : String;
                                var vlError : String ): Boolean;
var  STPObtChqCte : TStoredProc;
     vlSalida     : Boolean;
Begin
     vgCtaCargo := '';
     vgCtaProv  := '';
     vlSalida := True;
     STPObtChqCte := TStoredProc.Create(Nil);
     try
        with STPObtChqCte do
        begin
          STPObtChqCte.DatabaseName:= Apli.DatabaseName;
          STPObtChqCte.SessionName:= Apli.SessionName;
          STPObtChqCte.StoredProcName:='PKGCRPERIODO.STPOBTENCHQCTE';
          // Se crean los parametros del StoreProcedure
          Params.Clear;
          Params.CreateParam(ftFloat,'PEIDCLIENTE',ptInput);
          Params.CreateParam(ftString,'PECVEEMISNAFIN',ptInput);
          Params.CreateParam(ftFloat,'PEIDCREDITO',ptInput);
          Params.CreateParam(ftString,'PECVETIPOACRED',ptInput);
          Params.CreateParam(ftString,'PECVETIPOCHEQ',ptInput);
          Params.CreateParam(ftString,'PEMETODO',ptInput);
          Params.CreateParam(ftFloat,'PSIDBANCOCHQRA',ptOutput);
          Params.CreateParam(ftFloat,'PSCUENTABANCO',ptOutput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
          //
          ParamByName('peIdCliente').AsString := pIdAcreditado;
          ParamByName('PECveEmisNafin').AsString := pCveEmisNafin;
          ParamByName('peIDCredito').AsString := pIdCesion;
          ParamByName('peCveTipoAcred').AsString := pTipoAcred;
          ParamByName('peCveTipoCheq').AsString := pTipoChq;
          ParamByName('peMetodo').AsString := pMetodo;
          ExecProc;

          if (ParamByName('PSResultado').AsInteger = 0) then
          begin
             vgBanco := ParamByName('PSIDBANCOCHQRA').AsString;
             vgCtaProv := ParamByName('PSCUENTABANCO').AsString;
          end
          else
          Begin
             vlError := (ParamByName('psTxResultado').AsString);
             ShowMessage('PROBLEMAS AL OBTENER LA CHEQUERA: ' +
             IntToStr(ParamByName('psRESULTADO').AsInteger));
             ShowMessage(vlError);
             vlSalida := False;
          end;
        end;
     finally
          STPObtChqCte.Free;
     end;
     ObtChequera := vlSalida;
End;


Function TCrManRem.Existen_Rem_x_AutoLibe(strID_CESION, strID_DOCUMENTO, strSIT_REMANENTE : String;
                                           dF_BUSCA : TDateTime; var dFECHA : TDateTime) : Boolean;
var Query : TQuery;
    vlSQL : String;
begin
 Result := False;
 vlSQL := '  SELECT COUNT(*) AS TOTAL, MIN(CR.F_PAGO) AS MIN_F_PAGO'+
          '  FROM  CR_CESION CE,'+
          '        CR_REMANENTE CR'+
          '  WHERE CE.ID_PROVEEDOR = (SELECT ID_PROVEEDOR FROM CR_CESION WHERE ID_CESION = '+strID_CESION+')'+
          '    AND CE.SIT_CESION NOT IN (''CA'')'+
          '    AND CR.ID_CESION = CE.ID_CESION'+
          '    AND CR.ID_DOCUMENTO <> '#39+strID_DOCUMENTO+#39+
          '    AND CR.SIT_REMANENTE = '#39+strSIT_REMANENTE+#39+
          '    AND CR.F_PAGO < TO_DATE('#39+FormatDateTime('DD/MM/YYYY',dF_BUSCA)+#39',''DD/MM/YYYY'') '+
          '    AND CR.F_PAGO IS NOT NULL';
 Query := GetSQLQuery(vlSQL, Apli.DataBaseName, Apli.SessionName, False);
 If Assigned(Query) Then
  With (Query) Do
   Try
    dFECHA := FieldByName('MIN_F_PAGO').AsDateTime;
    Result := FieldByName('TOTAL').AsInteger > 0;
   Finally
    Close;
    Free;
   End;
end;
{---------------------------------------------------------------------------------------------------------------------
                                                Autoriza Remanente
----------------------------------------------------------------------------------------------------------------------}
Function TCrManRem.AutorizaRem(vlIdCesion : String; vlIdDocumento : String;
                               vlCveTipoReman : String; var vlError : String) : Boolean;
var  STPAutorizaRem : TStoredProc;
     vlSalida       : Boolean;
Begin
     vlSalida := True;
     STPAutorizaRem := TStoredProc.Create(Self);
     try
        with STPAutorizaRem do
        begin
            STPAutorizaRem.DatabaseName:= Apli.DatabaseName;
            STPAutorizaRem.SessionName:= Apli.SessionName;
            STPAutorizaRem.StoredProcName:='PKGCRCREDITO.STPAUTORIZAREM';

            // Se crean los parametros del StoreProcedure
            Params.Clear;
            Params.CreateParam(ftFloat,'PEIDCESION',ptInput);
            Params.CreateParam(ftString,'PEIDDOCUMENTO',ptInput);
            Params.CreateParam(ftString,'PECVETIPOREMAN',ptInput);
            Params.CreateParam(ftString,'PECVEUSUAUT',ptInput);
            Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
            Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
            Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
            //
            ParamByName('peIdCesion').AsString := vlIdCesion;
            ParamByName('peIdDocumento').AsString := vlIdDocumento;
            ParamByName('peCveTipoReman').AsString := vlCveTipoReman;
            ParamByName('peCveUsuAut').AsString := Apli.Usuario;
            ParamByName('peBCommit').AsString := CVERDAD;
            ExecProc;

            if (STPAutorizaRem.ParamByName('PSResultado').AsInteger <>0) then
            Begin
               vlSalida:= False;
               vlError := ( STPAutorizaRem.ParamByName('psTxResultado').AsString);

               ShowMessage('PROBLEMAS AL AUTORIZAR EL REMANENTE: ' +
               IntToStr(STPAutorizaRem.ParamByName('psRESULTADO').AsInteger));
               ShowMessage(vlError);
            end;
            //end if;
        end;
     finally
          STPAutorizaRem.Free;
     end;
     AutorizaRem := vlSalida;
End;
{---------------------------------------------------------------------------------------------------------------------
                                                Libera Remanente
----------------------------------------------------------------------------------------------------------------------}
Function TCrManRem.LiberaRem(vlIdCesion : String; vlIdDocumento : String;
                             vlCveTipoReman,vlBMovtoEfectivo : String; var vlError : String) : Boolean;
var  STPLiberaRem   : TStoredProc;
     vlSalida       : Boolean;
Begin
     vlSalida := True;
     STPLiberaRem := TStoredProc.Create(Self);
     try
        with STPLiberaRem do
        begin
            STPLiberaRem.DatabaseName:= Apli.DatabaseName;
            STPLiberaRem.SessionName:= Apli.SessionName;
            STPLiberaRem.StoredProcName:='PKGCRCREDITO.STPLIBERAREM';

            // Se crean los parametros del StoreProcedure
            Params.Clear;
            Params.CreateParam(ftFloat,'PEIDCESION',ptInput);
            Params.CreateParam(ftString,'PEIDDOCUMENTO',ptInput);
            Params.CreateParam(ftString,'PECVETIPOREMAN',ptInput);
            Params.CreateParam(ftString,'PECVEMOVTOEFECT',ptInput);
            Params.CreateParam(ftString,'PECVEUSUDEV',ptInput);
            Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
            Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
            Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
            //
            ParamByName('peIdCesion').AsString := vlIdCesion;
            ParamByName('peIdDocumento').AsString := vlIdDocumento;
            ParamByName('peCveTipoReman').AsString := vlCveTipoReman;
            ParamByName('peCveMovtoEfect').AsString := vlBMovtoEfectivo;
            ParamByName('peCveUsuDev').AsString := Apli.Usuario;
            ParamByName('peBCommit').AsString := CVERDAD;
            ExecProc;

              if (STPLiberaRem.ParamByName('PSResultado').AsInteger <>0) then
              Begin
                 vlSalida:= False;
                 vlError := ( STPLiberaRem.ParamByName('psTxResultado').AsString);
                 ShowMessage('PROBLEMAS AL LIBERAR EL REMANENTE: ' +
                 IntToStr(STPLiberaRem.ParamByName('psRESULTADO').AsInteger));
                 ShowMessage(vlError);
              end;
              //end if;
        end;
     finally
          STPLiberaRem.Free;
     end;
     LiberaRem := vlSalida;
End;
{---------------------------------------------------------------------------------------------------------------------
                                                Cancela Remanente
----------------------------------------------------------------------------------------------------------------------}
Function TCrManRem.CanelaRem(vlIdCesion : String; vlIdDocumento : String;
                             vlCveTipoReman : String; var vlError : String) : Boolean;
var  STPCanelaRem   : TStoredProc;
     vlSalida       : Boolean;
Begin
     vlSalida := True;
     STPCanelaRem := TStoredProc.Create(Self);
     try
        with STPCanelaRem do
        begin
            STPCanelaRem.DatabaseName:= Apli.DatabaseName;
            STPCanelaRem.SessionName:= Apli.SessionName;
            STPCanelaRem.StoredProcName:='PKGCRCREDITO.STPCANCELAREM';

            // Se crean los parametros del StoreProcedure
            Params.Clear;
            Params.CreateParam(ftFloat,'PEIDCESION',ptInput);
            Params.CreateParam(ftString,'PEIDDOCUMENTO',ptInput);
            Params.CreateParam(ftString,'PECVETIPOREMAN',ptInput);
            Params.CreateParam(ftString,'PECVEUSUCAN',ptInput);
            Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
            Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
            Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
            //
            ParamByName('peIdCesion').AsString := vlIdCesion;
            ParamByName('peIdDocumento').AsString := vlIdDocumento;
            ParamByName('peCveTipoReman').AsString := vlCveTipoReman;
            ParamByName('peCveUsuCan').AsString := Apli.Usuario;
            ParamByName('peBCommit').AsString := CVERDAD;
            ExecProc;

              if (ParamByName('PSResultado').AsInteger <>0) then
              Begin
                 vlSalida:= False;
                 vlError := ( ParamByName('psTxResultado').AsString);
                 ShowMessage('PROBLEMAS AL OBTENER CANCELAR REMANENTE: ' +
                 IntToStr(ParamByName('psRESULTADO').AsInteger));
                 ShowMessage(vlError);
              end;
              //end if;
        end;
     finally
          STPCanelaRem.Free;
     end;
     CanelaRem := vlSalida;
End;

(***********************************************FORMA CrManRem********************)
(*                                                                              *)
(*  FORMA DE CrManRem                                                            *)
(*                                                                              *)
(***********************************************FORMA CrManRem********************)

Procedure TWCrManRem.MuestraDatos;
var vlQry : TQuery;
begin
  vlQry := GetSQLQuery(Objeto.CadenaSql,
                       Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
     try
        if vlQry <> nil then
        Begin
            Objeto.vgCesion := '';
            Objeto.vgAcreditado := '';
            Objeto.vgNafin := '';

            vlQry.FieldByName('ID_CESION').Visible := False;
            vlQry.FieldByName('ID_ACREDITADO').Visible := False;
            vlQry.FieldByName('CVE_TIPO_REMAN').Visible := False;
            vlQry.FieldByName('CVE_EMISOR_NAFIN').Visible := False;
            vlQry.FieldByName('ID_PROVEEDOR').Visible := False;
            vlQry.FieldByName('NOMBRE_PROV').Visible := False;

            vlQry.FieldByName('ID_DOCUMENTO').DisplayLabel := 'No. DOCUMENTO' + #30 +'>C';
            vlQry.FieldByName('DESC_TIPO_REMAN').DisplayLabel := 'TIPO' + #30 +'>C';
            vlQry.FieldByName('F_PAGO').DisplayLabel := 'F PAGO' + #30 +'>C';
            vlQry.FieldByName('F_VALOR').DisplayLabel := 'F PAGO' + #30 +'>C';
            vlQry.FieldByName('F_DEV_REMANENTE').DisplayLabel := 'F DEVOL' + #30 +'>C';
            vlQry.FieldByName('IMP_DEV_REMAN').DisplayLabel := 'IMPORTE' + #30 +'>C';
            vlQry.FieldByName('SIT_REMANENTE').DisplayLabel := 'SIT' + #30 +'>C';
            vlQry.FieldByName('AUT').DisplayLabel := 'AUT' + #30 +'>C';

            vlQry.FieldByName('ID_DOCUMENTO').DisplayWidth := 27;
            vlQry.FieldByName('DESC_TIPO_REMAN').DisplayWidth := 12;
            vlQry.FieldByName('F_PAGO').DisplayWidth := 12;
            vlQry.FieldByName('F_VALOR').DisplayWidth := 12;
            vlQry.FieldByName('F_DEV_REMANENTE').DisplayWidth := 12;
            vlQry.FieldByName('IMP_DEV_REMAN').DisplayWidth := 19;
            vlQry.FieldByName('SIT_REMANENTE').DisplayWidth := 5;
            vlQry.FieldByName('AUT').DisplayWidth := 3;


            sgcDATOS.SG.Canvas.Font.Size := 5;
            //sgcDATOS.Font.Size :=
            //sgcDATOS.SG.OnDrawCell




            TNumericField(vlQry.FieldByName('IMP_DEV_REMAN')).DisplayFormat := '###,###,###,###,###,###,##0.00';

            sgcDATOS.AddQry( vlQry, True,True,-1,-1,-1,False); // AGREGAR QUERY
            sgcDATOS.ColumnByName('AUT').IsCheck := True;//DEFINIR EL CAMPO AUT DEL QUERY COMO CHECKBOX
        end
        else

           sgcDATOS.Clear('NO EXISTEN DATOS'#30'>C');

        finally
        if vlQry <> nil then
           vlQry.free;
        //end if
        end;
end;

procedure TWCrManRem.FormShow(Sender: TObject);
begin
      //Pinta los datos del panel inferior
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.F_PAG_INICIAL.Control:=edF_PAG_INICIAL;
      Objeto.F_PAG_FINAL.Control:=edF_PAG_FINAL;
      Objeto.F_VAL_INICIAL.Control:=edF_VAL_INICIAL;
      Objeto.F_VAL_FINAL.Control:=edF_VAL_FINAL;
      Objeto.IMP_MINIMO.Control:=edIMP_MINIMO;
      Objeto.IMP_MAXIMO.Control:=edIMP_MAXIMO;
      Objeto.SIT_MAN_REM.Control:=rgSIT_MAN_REM;
      Objeto.B_APLICA_EMISOR.Control:=chB_APLICA_EMISOR;
      Objeto.B_APLICA_PROV.Control:=chB_APLICA_PROV;
      Objeto.B_APLICA_CESION.Control:=chB_APLICA_CESION;
      Objeto.B_APLICA_FECHA.Control:=chB_APLICA_FECHA;
      Objeto.B_APLICA_FVAL.Control:=chB_APLICA_F_VAL;
      Objeto.B_APLICA_IMPORTES.Control:=chB_APLICA_IMPORTES;
      Objeto.CVE_TIPO_REM.Control := rgTIPO;
      Objeto.B_MOVTO_EFECTIVO.Control := chB_MOVTO_EFECTIVO;

      Objeto.Emisor.ID_ACREDITADO.Control := edID_EMISOR;
      Objeto.ID_EMISOR.Control:=edID_EMISOR;
      Objeto.Emisor.Acreditado.Persona.Nombre.Control:=edNOMB_EMISOR;
{ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
//      Objeto.Emisor.CVE_EMISOR_NAFIN.Control:=edCVE_EMISOR_NAFINSA;
      Objeto.Emisor.CVE_EMISOR_EXT.Control:=edCVE_EMISOR_NAFINSA;
{/ROIM}
      Objeto.Emisor.NOMBRE_EMISOR.Control:=edNOMBRE_EMISOR;
      Objeto.Emisor.GetParams(Objeto);

      Objeto.Proveedor.ID_ACREDITADO.Control :=edID_PROVEEDOR;
      Objeto.ID_PROVEEDOR.Control:=edID_PROVEEDOR;
      Objeto.Proveedor.Persona.Nombre.Control := edNOMBRE_PROV;
{ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
//      Objeto.Proveedor.ID_PROV_NAFINSA.Control := edPROV_NAFINSA;
      Objeto.Proveedor.ID_PROV_EXTERNO.Control := edPROV_NAFINSA;
{/ROIM}
      Objeto.Proveedor.GetParams(Objeto);

      Objeto.Cesion.ID_CESION.Control :=edID_CESION;
      Objeto.ID_CESION.Control:=edID_CESION;
      Objeto.Cesion.CreCto.Contrato.TITNombre.Control := edNOMBRE_CESION;
      Objeto.Cesion.GetParams(Objeto);


      Objeto.F_PAG_INICIAL.AsDateTime := Objeto.Apli.DameFechaEmpresa;
      Objeto.F_PAG_FINAL.AsDateTime   := Objeto.F_PAG_INICIAL.AsDateTime;
      dtpF_PAG_INICIAL.DateTime := Objeto.F_PAG_INICIAL.AsDateTime;
      dtpF_PAG_FINAL.DateTime   := Objeto.F_PAG_INICIAL.AsDateTime;

      //Fecha Valor
      chB_APLICA_F_VAL.Checked := True;
end;

procedure TWCrManRem.FormDestroy(Sender: TObject);
begin
      Objeto.F_PAG_INICIAL.Control:=nil;
      Objeto.F_PAG_FINAL.Control:=nil;
      Objeto.F_VAL_INICIAL.Control:=nil;
      Objeto.F_VAL_FINAL.Control:=nil;
      Objeto.IMP_MINIMO.Control:=nil;
      Objeto.IMP_MAXIMO.Control:=nil;
      Objeto.SIT_MAN_REM.Control:=nil;
      Objeto.B_APLICA_EMISOR.Control:=nil;
      Objeto.B_APLICA_PROV.Control:=nil;
      Objeto.B_APLICA_CESION.Control:=nil;
      Objeto.B_APLICA_FECHA.Control:=nil;
      Objeto.B_APLICA_FVAL.Control:=nil;
      Objeto.B_APLICA_IMPORTES.Control:=nil;
      Objeto.CVE_TIPO_REM.Control :=nil;
      Objeto.B_MOVTO_EFECTIVO.Control := nil;

      Objeto.Emisor.ID_ACREDITADO.Control :=nil;
      Objeto.ID_EMISOR.Control:=nil;
      Objeto.Emisor.Acreditado.Persona.Nombre.Control:=nil;
{ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
//      Objeto.Emisor.CVE_EMISOR_NAFIN.Control:=nil;
      Objeto.Emisor.CVE_EMISOR_EXT.Control:=nil;
{/ROIM}
      Objeto.Emisor.NOMBRE_EMISOR.Control:=nil;

      Objeto.Proveedor.ID_ACREDITADO.Control :=nil;
      Objeto.ID_PROVEEDOR.Control:=nil;
      Objeto.Proveedor.Persona.Nombre:=nil;
  {ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
//      Objeto.Proveedor.ID_PROV_NAFINSA.Control :=nil;
      Objeto.Proveedor.ID_PROV_EXTERNO.Control :=nil;
{/ROIM}

      Objeto.Cesion.ID_CESION.Control :=nil;
      Objeto.ID_CESION.Control:=nil;
      Objeto.Cesion.CreCto.Contrato.TITNombre.Control :=nil;
   //Objeto
end;

procedure TWCrManRem.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrManRem.btEMISORClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRMANREM_EMIS',True,True) then
   begin
     Objeto.Emisor.ShowAll := True;
     if Objeto.Emisor.Busca then
     Begin
        Objeto.ID_EMISOR.AsString := Objeto.Emisor.ID_ACREDITADO.AsString;
        chB_APLICA_EMISOR.Checked := True;
        chB_APLICA_EMISOR.Enabled := True;
  //      MuestraDatos;
        InterForma1.NextTab(edID_EMISOR);
     end;
   end;
end;

procedure TWCrManRem.chB_APLICA_EMISORClick(Sender: TObject);
begin
   if not(chB_APLICA_EMISOR.Checked) then
   Begin
      Objeto.Emisor.Active := False;
      chB_APLICA_EMISOR.Checked := False;
      chB_APLICA_EMISOR.Enabled := False;
   end
   else
   Begin
      chB_APLICA_EMISOR.Checked := True;
      chB_APLICA_EMISOR.Enabled := True;
   end;
end;

procedure TWCrManRem.btPROVEEDORClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRMANREM_PROVE',True,True) then
   begin
     Objeto.Proveedor.ShowAll := True;
     if Objeto.Proveedor.Busca then
     Begin
        Objeto.ID_PROVEEDOR.AsString := Objeto.Proveedor.ID_ACREDITADO.AsString;
        chB_APLICA_PROV.Checked := True;
        chB_APLICA_PROV.Enabled := True;
  //      MuestraDatos;
        InterForma1.NextTab(edID_PROVEEDOR);
     end;
   end;
end;

procedure TWCrManRem.chB_APLICA_PROVClick(Sender: TObject);
begin
   if not(chB_APLICA_PROV.Checked) then
   Begin
      Objeto.Proveedor.Active := False;
      chB_APLICA_PROV.Checked := False;
      chB_APLICA_PROV.Enabled := False;
   end
   else
   Begin
      chB_APLICA_PROV.Checked := True;
      chB_APLICA_PROV.Enabled := True;
   end;
end;

procedure TWCrManRem.btCESIONClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRMANREM_CESN',True,True) then
   begin
     Objeto.Cesion.ShowAll := True;
     if Objeto.Cesion.Busca then
     Begin
        Objeto.ID_CESION.AsString :=Objeto.Cesion.ID_CESION.AsString;
        chB_APLICA_CESION.Checked := True;
        chB_APLICA_CESION.Enabled := True;
  //      MuestraDatos;
        InterForma1.NextTab(edID_CESION);
     end;
   end;
end;

procedure TWCrManRem.chB_APLICA_CESIONClick(Sender: TObject);
begin
   if not(chB_APLICA_CESION.Checked) then
   Begin
      Objeto.Cesion.Active := False;
      chB_APLICA_CESION.Checked := False;
      chB_APLICA_CESION.Enabled := False;
   end
   else
   Begin
      chB_APLICA_CESION.Checked := True;
      chB_APLICA_CESION.Enabled := True;
   end;
end;

procedure TWCrManRem.InterForma1DespuesShow(Sender: TObject);
begin
   Objeto.F_PAG_INICIAL.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
   Objeto.F_PAG_FINAL.AsDateTime := Objeto.Apli.DameFechaEmpresa;
   chB_APLICA_FECHA.Checked := True;
   chB_APLICA_IMPORTES.Checked := False;

   rgSIT_MAN_REM.ItemIndex := 0;
   rgTIPO.ItemIndex := 3;

   edTIT_DOCUMENTO.Color := clAmarillito;
   edTIT_TIPO.Color := clAmarillito;
   edTIT_FPAGO.Color := clAmarillito;
   edTIT_IMPORTE.Color := clAmarillito;
   edTIT_SIT.Color := clAmarillito;
   edTIT_AUT.Color := clAmarillito;
   edF_DEVOL.Color := clAmarillito;

   edID_CESION.SetFocus;
   Objeto.vgAutoriza := CVERDAD;
   Objeto.vgLibera := CVERDAD;

   if Objeto.AutRemanente = CFALSO then
   Begin
      objeto.vgAutoriza := CFALSO;
      btAUTORIZA.Enabled := False;
      rgSIT_MAN_REM.ItemIndex := 1;
   end;

   if Objeto.LibRemanente = CFALSO then
   Begin
      objeto.vgLibera := CFALSO;
      btLIBERA.Enabled := False;
      rgSIT_MAN_REM.ItemIndex := 0;
   end;

   if ( objeto.vgAutoriza = CFALSO ) AND ( objeto.vgLibera = CFALSO ) then
   Begin
      btCANCELA.Enabled := False;
   end;
   edID_EMISOR.SetFocus;

   // LOLS 08 SEP 2005
   Objeto.Cesion.BuscaWhereString := 'PKGCRACTUALIZA.STPOBTEMPRESA(CR_CESION.ID_CESION) =' + IntToStr(Objeto.Apli.IdEmpresa);
   Objeto.Cesion.FilterString     := Objeto.Cesion.BuscaWhereString;
end;

procedure TWCrManRem.chB_APLICA_FECHAClick(Sender: TObject);
begin
     Objeto.F_PAG_INICIAL.GetFromControl;
     Objeto.F_PAG_FINAL.GetFromControl;
   if not(chB_APLICA_FECHA.Checked) then
   Begin
      Objeto.F_PAG_INICIAL.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
      Objeto.F_PAG_FINAL.AsDateTime:= Objeto.Apli.DameFechaEmpresa;
      chB_APLICA_FECHA.Checked := False;
      chB_APLICA_FECHA.Enabled := False;

      edF_PAG_INICIAL.Text := '';
      edF_PAG_FINAL.Text := '';
   end
   else
   Begin
      if ((Objeto.F_PAG_INICIAL.AsDateTime > Objeto.F_PAG_FINAL.AsDateTime) or
         (Objeto.F_PAG_FINAL.AsDateTime < Objeto.F_PAG_INICIAL.AsDateTime)) then
      Begin
         ShowMessage('La fecha de pago inicial no debe de ser mayor a la fecha de pago final');
         edF_PAG_INICIAL.SetFocus;
      end
      else
      Begin
         Objeto.F_PAG_INICIAL.AsDateTime := Objeto.Apli.DameFechaEmpresa;
         Objeto.F_PAG_FINAL.AsDateTime:= Objeto.Apli.DameFechaEmpresa;
         chB_APLICA_FECHA.Checked := True;
         chB_APLICA_FECHA.Enabled := True;
      end;
   end;
end;

procedure TWCrManRem.chB_APLICA_IMPORTESClick(Sender: TObject);
begin
   if not(chB_APLICA_IMPORTES.Checked) then
   Begin
      Objeto.IMP_MINIMO.AsFloat := 0;
      Objeto.IMP_MAXIMO.AsFloat := 0;
      chB_APLICA_IMPORTES.Checked := False;
      chB_APLICA_IMPORTES.Enabled := False;
   end
   else if ((edIMP_MINIMO.Text <> '') and (edIMP_MAXIMO.Text <> '')) then
   Begin
      chB_APLICA_IMPORTES.Checked := True;
      chB_APLICA_IMPORTES.Enabled := True;
      edIMP_MINIMO.SetFocus;
   end;
end;

procedure TWCrManRem.BBBuscaClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRMANREM_BUSQ',True,True) then
   begin
      MuestraDatos;
   end;
end;

procedure TWCrManRem.sgcDATOSCalcRow(Sendet: TObject; DataSet: TDataSet;
  CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
var  vlsql  : String;
     vlBanco: String;
     vlResultado : Boolean;
     vlError     : String;
begin

  //case RoWCaso of //rcQueryBegin, rcRowBegin, rcQueryEnd
  if RowCaso = rcRowBegin then
  begin

    if Objeto.vgCesion <> DataSet.FieldByName('ID_CESION').AsString then
    Begin
       Objeto.vgCesion := DataSet.FieldByName('ID_CESION').AsString;
       Objeto.vgAcreditado := DataSet.FieldByName('ID_ACREDITADO').AsString;
       Objeto.vgNafin := DataSet.FieldByName('CVE_EMISOR_NAFIN').AsString;
       Objeto.vgProveedor := DataSet.FieldByName('ID_PROVEEDOR').AsString; //LOLS
       sgcDATOS.AddTitle('CESION : ' + Objeto.vgCesion, tcCenter);
       sgcDATOS.AddTexto( 'PROVEEDOR : ' + DataSet.FieldByName('NOMBRE_PROV').AsString,
                          tcCenter, clBlack, 15 );
       vlResultado := Objeto.ObtChequera( Objeto.vgCesion , '0', Objeto.vgProveedor ,
                                          C_PROVE ,         C_ADMIN,              C_CARGO,   vlError );
       MErrores.Lines.Add(vlError);
       if ( vlResultado ){AND vlResultado1)} then
       Begin
           vlsql := 'SELECT NOM_INET FROM INTERMEDIARIO WHERE ID_INTERMEDIARIO = ' + Objeto.vgBanco;
           GetSQLStr(vlsql, Objeto.Apli.DataBaseName,Objeto.Apli.SessionName, 'NOM_INET', vlBanco, False);
//           sgcDATOS.AddTexto('CHEQUERA:' + Objeto.vgCtaCargo +
           sgcDATOS.AddTexto( ' CUENTA / BANCO:' + Objeto.vgCtaProv + ' / ' +
                              vlBanco, tcCenter, clBlue, 15 );
       end
       else //sgcDATOS.AddTexto('CHEQUERA:     CUENTA / BANCO:     / ', tcCenter, clBlue, 15);
           sgcDATOS.AddTexto('CUENTA / BANCO:     / ', tcCenter, clBlue, 15);
    end;
  end;
end;

procedure TWCrManRem.sgcDATOSDblClick(Sender: TObject);
var Y : integer;
   procedure MarcaReg;
   Begin
     if sgcDATOS.CellStr['AUT',Y] = 'SI' + #30 + '>C' then
        sgcDATOS.CellStr['AUT',Y]:= ''
     else
        sgcDATOS.CellStr['AUT',Y]:= 'SI' + #30 + '>C';
  //end if
   end;
begin
  Y := sgcDATOS.SG.Row;
   //verifica si tiene permisos para autorizar
   if ( Objeto.vgAutoriza = CVERDAD ) and ( Objeto.vgLibera = CFALSO ) then
   Begin
     if ( sgcDATOS.CellStr['SIT_REMANENTE',Y] = CSIT_NA ) OR
        ( sgcDATOS.CellStr['SIT_REMANENTE',Y] = CSIT_AU ) then
        MarcaReg;
     //end if
   End
   //verifica si tiene permisos para liberar
   else if ( Objeto.vgLibera = CVERDAD ) and ( Objeto.vgAutoriza = CFALSO ) then
   Begin
     if ( sgcDATOS.CellStr['SIT_REMANENTE',Y] = CSIT_AU ) OR
        ( sgcDATOS.CellStr['SIT_REMANENTE',Y] = CSIT_LI ) then
        MarcaReg;
     //end if
   End
   //verifica si tiene permisos para autorizar y liberar
   else if ( Objeto.vgAutoriza = CVERDAD ) and ( Objeto.vgLibera = CVERDAD ) then
   Begin
        MarcaReg;
   End;
end;

procedure TWCrManRem.dtpF_PAG_INICIALClick(Sender: TObject);
begin
      chB_APLICA_FECHA.Checked := True;
      chB_APLICA_FECHA.Enabled := True;
end;

procedure TWCrManRem.dtpF_PAG_FINALClick(Sender: TObject);
begin
      chB_APLICA_FECHA.Checked := True;
      chB_APLICA_FECHA.Enabled := True;
end;

procedure TWCrManRem.edIMP_MINIMOEnter(Sender: TObject);
begin
      chB_APLICA_IMPORTES.Checked := True;
      chB_APLICA_IMPORTES.Enabled := True;
end;

procedure TWCrManRem.dtpF_PAG_INICIALEnter(Sender: TObject);
begin
      chB_APLICA_FECHA.Checked := True;
      chB_APLICA_FECHA.Enabled := True;
end;

procedure TWCrManRem.dtpF_PAG_FINALEnter(Sender: TObject);
begin
      chB_APLICA_FECHA.Checked := True;
      chB_APLICA_FECHA.Enabled := True;
end;

procedure TWCrManRem.dtpF_PAG_FINALExit(Sender: TObject);
begin
     Objeto.F_PAG_INICIAL.GetFromControl;
     Objeto.F_PAG_FINAL.GetFromControl;
     if (Objeto.F_PAG_FINAL.AsDateTime < Objeto.F_PAG_INICIAL.AsDateTime)  then
     Begin
        ShowMessage('La fecha de pago inicial no debe de ser mayor a la fecha de pago final');
        edF_PAG_FINAL.SetFocus;
     end
end;

procedure TWCrManRem.dtpF_PAG_INICIALExit(Sender: TObject);
begin
     Objeto.F_PAG_INICIAL.GetFromControl;
     Objeto.F_PAG_FINAL.GetFromControl;
     if (Objeto.F_PAG_INICIAL.AsDateTime > Objeto.F_PAG_FINAL.AsDateTime)  then
     Begin
        ShowMessage('La fecha de pago inicial no debe de ser mayor a la fecha de pago final');
        edF_PAG_INICIAL.SetFocus;
     end
end;


// BEGIN_MANEJO_DE_FECHA_VALOR
procedure TWCrManRem.AsignaFechaValor( peBandera : Boolean );
var vlFEmpre : TDate;
begin
  if peBandera then
  begin
    Objeto.F_VAL_INICIAL.GetFromControl;
    Objeto.F_VAL_FINAL.GetFromControl;
    vlFEmpre := Objeto.Apli.DameFechaEmpresa;
    if Objeto.F_VAL_INICIAL.AsString = '' then
    begin
      Objeto.F_VAL_INICIAL.AsDateTime := vlFEmpre;
      dtpF_VAL_INICIAL.DateTime := vlFEmpre;
    end;//ends_if
    if Objeto.F_VAL_FINAL.AsString = '' then
    begin
      Objeto.F_VAL_FINAL.AsDateTime := vlFEmpre;
      dtpF_VAL_FINAL.DateTime   := vlFEmpre;
    end;//ends_if
    //
    if Objeto.F_VAL_INICIAL.AsDateTime > Objeto.F_VAL_FINAL.AsDateTime then
    begin
      Objeto.F_VAL_FINAL.AsDateTime := Objeto.F_VAL_INICIAL.AsDateTime;
      dtpF_VAL_FINAL.DateTime := Objeto.F_VAL_INICIAL.AsDateTime;
    end;//ends_if
    Objeto.F_VAL_INICIAL.DrawControl;
    Objeto.F_VAL_FINAL.DrawControl;
  end else
  begin
    edF_VAL_INICIAL.Text:= '';
    edF_VAL_FINAL.Text  := '';
    Objeto.F_VAL_INICIAL.GetFromControl;
    Objeto.F_VAL_FINAL.GetFromControl;
  end;
  chB_APLICA_F_VAL.Checked := peBandera;
end;


procedure TWCrManRem.chB_APLICA_F_VALClick(Sender: TObject);
begin
  AsignaFechaValor( chB_APLICA_F_VAL.Checked );
end;

procedure TWCrManRem.edF_VAL_INICIALExit(Sender: TObject);
begin
  AsignaFechaValor( edF_VAL_INICIAL.Text <> '' );
end;


procedure TWCrManRem.dtpF_VAL_INICIALEnter(Sender: TObject);
begin
  vgBFValIniChange := False;
end;

procedure TWCrManRem.dtpF_VAL_INICIALChange(Sender: TObject);
begin
  vgBFValIniChange := True;
end;

procedure TWCrManRem.dtpF_VAL_INICIALExit(Sender: TObject);
begin
  if vgBFValIniChange then
    AsignaFechaValor( True );
end;


procedure TWCrManRem.edF_VAL_FINALExit(Sender: TObject);
begin
  AsignaFechaValor( edF_VAL_FINAL.Text <> '' );
end;

procedure TWCrManRem.dtpF_VAL_FINALEnter(Sender: TObject);
begin
  vgBFValFinChange := False;
end;

procedure TWCrManRem.dtpF_VAL_FINALChange(Sender: TObject);
begin
  vgBFValFinChange := True;
end;

procedure TWCrManRem.dtpF_VAL_FINALExit(Sender: TObject);
begin
  if vgBFValFinChange then
    AsignaFechaValor( True );
end;

// ENDS_MANEJO_DE_FECHA_VALOR

procedure TWCrManRem.btAUTORIZAClick(Sender: TObject);
var
    vlIdCesion , vlIdDocto, vlCveTipo, vlError,
    vlF_Pago, vlDescTipoReman : String;
    vlFecha    : TDateTime;
    nRow       : Integer;
    vlclave : String;
begin
    vlclave := '22';
// if ValidaUsuario(Objeto.Apli, vlClave) then
   if Objeto.ValidaAccesoEsp('TCRMANREM_AUTOR',True,True) then
   begin
     if CountSelec(sgcDatos,'AUT') > 0 then
     Begin
       Merrores.Clear;
       if MessageDlg('¿Está seguro de autorizar ' +IntToStr(CountSelec(sgcDatos,'AUT')) + ' remanentes',
                       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       Begin
        AddLine(MErrores,'====================================================');
        AddLine(MErrores,'***         INICIA PROCESO DE AUTORIZACION       ***');
        AddLine(MErrores,'Hora inicio:' + TimeToStr(Time));
        nRow:= 0;
        For nRow := 1 To sgcDATOS.SG.RowCount - 1 Do
           if (sgcDATOS.CellStr['AUT',nRow] = 'SI' + #30 + '>C') then
           Begin
               vlIdCesion := (sgcDATOS.CellStr['ID_CESION',nRow]);
               vlIdDocto  := (sgcDATOS.CellStr['ID_DOCUMENTO',nRow]);
               vlCveTipo  := (sgcDATOS.CellStr['CVE_TIPO_REMAN',nRow]);
               vlF_Pago   := (sgcDATOS.CellStr['F_PAGO',nRow]);
               vlDescTipoReman := (sgcDATOS.CellStr['DESC_TIPO_REMAN',nRow]);

               { Verifica si existen Remanentes x Autorizar del Proveedor }
               if Trim(vlF_Pago) <> '' Then
                 if Objeto.Existen_Rem_x_AutoLibe(vlIdCesion, vlIdDocto, CSIT_NA, StrToDate(vlF_Pago), vlFecha) then
                   if (MessageDlg('Aviso, existen remanentes del día '+FormatDateTime('DD/MM/YYYY',vlFecha)+
                                  ' pendientes de autorizar. ¿ Desea continuar con la Autorización del '+vlDescTipoReman+
                                  ' con documento '+vlIdDocto+'?.',mtConfirmation,
                                  [mbYes, mbNo], 0) = mrNo) Then
                       Break;
                   // end if
                 // end if
               //end if
               if not Objeto.AutorizaRem(vlIdCesion,vlIdDocto,vlCveTipo,vlError) then
               Begin
                  Merrores.Lines.Add(vlError);
                  if (MessageDlg(vlError + ' ¿ Desea Continuar ?.',mtConfirmation,
                                  [mbYes, mbNo], 0) = mrNo) Then
                       Break;
                  //end if
               end;
           end;
        //end for
        AddLine(MErrores,'Hora fin:' + TimeToStr(Time));
        AddLine(MErrores,'***        TERMINA PROCESO DE AUTORIZACION       ***');
        AddLine(MErrores,'====================================================');
        MuestraDatos;
       end;
     end
     else
        ShowMessage('Seleccione el o los registros a autorizar');
   end;
   {else
    begin
   ShowMessage('    No tiene suficientes permisos para esta Acción')
    end;}
end;

procedure TWCrManRem.btLIBERAClick(Sender: TObject);
var
    vlIdCesion, vlIdDocto, vlCveTipo, vlError,
    vlF_Pago, vlDescTipoReman : String;
    vlFecha    : TDateTime;
    nRow       : Integer;
    vlclave : String;
begin
    vlclave := '23';
// if ValidaUsuario(Objeto.Apli, vlClave) then
   if Objeto.ValidaAccesoEsp('TCRMANREM_LIBER',True,True) then
   begin
     if rgSIT_MAN_REM.ItemIndex = 2 then
        showMessage('Registro ya liberado')
     else BEGIN
       Objeto.B_MOVTO_EFECTIVO.GetFromControl;
       if CountSelec(sgcDatos,'AUT') > 0 then
       Begin
         Merrores.Clear;
         if MessageDlg('¿Está seguro de liberar ' +IntToStr(CountSelec(sgcDatos,'AUT')) + ' remanentes',
                         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
         Begin
          messageIniFinProceso(MErrores,CINICIO);//envia mensaje final proceso
          For nRow := 1 To sgcDATOS.SG.RowCount - 1 Do
             if (sgcDATOS.CellStr['AUT',nRow] = 'SI' + #30 + '>C') then
             Begin
                 IF (sgcDATOS.CellStr['SIT_REMANENTE',nRow]) = CSIT_LI THEN
                 Begin
                    showMessage('Registro ya liberado');
                    Break;
                 end
                 else
                 Begin
                   vlIdCesion := (sgcDATOS.CellStr['ID_CESION',nRow]);
                   vlIdDocto  := (sgcDATOS.CellStr['ID_DOCUMENTO',nRow]);
                   vlCveTipo  := (sgcDATOS.CellStr['CVE_TIPO_REMAN',nRow]);

                   vlF_Pago   := (sgcDATOS.CellStr['F_PAGO',nRow]);
                   vlDescTipoReman := (sgcDATOS.CellStr['DESC_TIPO_REMAN',nRow]);

                   { Verifica si existen Remanentes x Liberar del Proveedor }
                   if Trim(vlF_Pago) <> '' Then
                     if Objeto.Existen_Rem_x_AutoLibe(vlIdCesion, vlIdDocto, CSIT_AU, StrToDate(vlF_Pago), vlFecha) then
                       if (MessageDlg('Aviso, existen remanentes del día '+FormatDateTime('DD/MM/YYYY',vlFecha)+
                                      ' pendientes de liberar. ¿ Desea continuar con la Liberación del '+vlDescTipoReman+
                                      ' con documento '+vlIdDocto+'?.',mtConfirmation,
                                      [mbYes, mbNo], 0) = mrNo) Then
                           Break;
                       // end if
                     // end if
                   //end if

                   if not Objeto.LiberaRem(vlIdCesion,vlIdDocto,vlCveTipo, Objeto.B_MOVTO_EFECTIVO.AsString,vlError) then
                   Begin
                      Merrores.Lines.Add(vlError);
                      if (MessageDlg(vlError + ' ¿ Desea Continuar ?.',mtConfirmation,
                                      [mbYes, mbNo], 0) = mrNo) Then
                           Break;
                      //end if
                   end;
                 end;
             end;
          //end for
          messageIniFinProceso(MErrores,CFINAL);//envia mensaje final proceso
          MuestraDatos;
         end;
       end
       else
          ShowMessage('Seleccione el o los registros a liberar');
     END;
   end;
   {else
    begin
    ShowMessage('    No tiene suficientes permisos para esta Acción')
    end;}
end;

procedure TWCrManRem.edIMP_MAXIMOEnter(Sender: TObject);
begin
      chB_APLICA_IMPORTES.Checked := True;
      chB_APLICA_IMPORTES.Enabled := True;
end;

procedure TWCrManRem.ilEMISOREjecuta(Sender: TObject);
begin
   if Objeto.Emisor.FindKeyNear([ilEMISOR.Buffer],['ID_ACREDITADO']) then
   Begin
      Objeto.ID_EMISOR.AsString := Objeto.Emisor.ID_ACREDITADO.AsString;
      chB_APLICA_EMISOR.Checked := True;
      chB_APLICA_EMISOR.Enabled := True;
//      MuestraDatos;
      InterForma1.NextTab(edID_EMISOR);
   end;
end;

procedure TWCrManRem.ilPROVEEDOREjecuta(Sender: TObject);
begin
   if Objeto.Proveedor.FindKey([ilPROVEEDOR.Buffer]) then
   Begin
      Objeto.ID_PROVEEDOR.AsString := Objeto.Proveedor.ID_ACREDITADO.AsString;
      chB_APLICA_PROV.Checked := True;
      chB_APLICA_PROV.Enabled := True;
//      MuestraDatos;
      InterForma1.NextTab(edID_PROVEEDOR);
   end;
end;

procedure TWCrManRem.ilCESIONEjecuta(Sender: TObject);
begin
   if Objeto.Cesion.FindKey([ilCESION.Buffer]) then
   Begin
      Objeto.ID_CESION.AsString :=Objeto.Cesion.ID_CESION.AsString;
      chB_APLICA_CESION.Checked := True;
      chB_APLICA_CESION.Enabled := True;
//      MuestraDatos;
      InterForma1.NextTab(edID_CESION);
   end;
end;

procedure TWCrManRem.btCANCELAClick(Sender: TObject);
var
    vlIdCesion, vlIdDocto,
    vlCveTipo, vlError          :  String;
    nRow                        : Integer;
    vlSitRemanente              : String;
    vlclave : String;
begin
    vlclave := '24';
// if ValidaUsuario(Objeto.Apli, vlClave) then
   if Objeto.ValidaAccesoEsp('TCRMANREM_REVER',True,True) then
   begin
     if CountSelec(sgcDatos,'AUT') > 0 then
     Begin
       Merrores.Clear;
       if MessageDlg('¿Está seguro de reversar ' +IntToStr(CountSelec(sgcDatos,'AUT')) + ' remanente (s)',
                       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       Begin
        messageIniFinProceso(MErrores,CINICIO);//envia mensaje inicial proceso
        For nRow := 1 To sgcDATOS.SG.RowCount - 1 Do
           if (sgcDATOS.CellStr['AUT',nRow] = 'SI' + #30 + '>C') then
           Begin
               vlSitRemanente := sgcDATOS.CellStr['SIT_REMANENTE',nRow];
               if ( ( vlSitRemanente = CSIT_AU )  AND ( Objeto.vgAutoriza = CVERDAD )   or
                    ( vlSitRemanente = CSIT_LI )  AND ( Objeto.vgLibera = CVERDAD) ) then
               Begin
                 vlIdCesion := (sgcDATOS.CellStr['ID_CESION',nRow]);
                 vlIdDocto  := (sgcDATOS.CellStr['ID_DOCUMENTO',nRow]);
                 vlCveTipo  := (sgcDATOS.CellStr['CVE_TIPO_REMAN',nRow]);
                 if not Objeto.CanelaRem(vlIdCesion,vlIdDocto,vlCveTipo,vlError) then
                 Begin
                    Merrores.Lines.Add(vlError);
                    if (MessageDlg(vlError + ' ¿ Desea Continuar ?.',mtConfirmation,
                                    [mbYes, mbNo], 0) = mrNo) Then
                         Break;
                    //end if
                 end;
               end
               else if MessageDlg('No se puede reversar el Registro: Situación invalida o no tiene permisos para reversar. ¿Desea continuar?',
                       mtConfirmation, [mbYes, mbNo], 0) = mrNo then
                       Break;
           end;
        //end for
        messageIniFinProceso(MErrores,CFINAL);//envia mensaje final proceso
        MuestraDatos;
       end;
     end
     else
        ShowMessage('Seleccione el o los registros a cancelar');
   end;
   {else begin
   ShowMessage('    No tiene suficientes permisos para esta Acción')
   end;}
end;

procedure TWCrManRem.rgTIPOClick(Sender: TObject);
const CAut = 'Autoriza ';
      CLib = 'Libera ';
      CRev = 'Reversar ';
begin
   IF rgTIPO.ItemIndex <> 2 THEN
   BEGIN
        chB_MOVTO_EFECTIVO.Checked:= False;
        chB_MOVTO_EFECTIVO.Enabled:= False;
        IF rgTIPO.ItemIndex = 0 THEN
        Begin
           btAUTORIZA.Caption := CAut + 'Remanentes ';
           btLIBERA.Caption := CLib + 'Remanentes ';
           btCANCELA.Caption := CRev + 'Remanentes ';
        end
        else IF rgTIPO.ItemIndex = 1 THEN
        Begin
           btAUTORIZA.Caption := CAut + 'Interés ';
           btLIBERA.Caption := CLib + 'Interés ';
           btCANCELA.Caption := CRev + 'Interés ';
        end
        else IF rgTIPO.ItemIndex = 3 THEN
        Begin
           btAUTORIZA.Caption := CAut;
           btLIBERA.Caption := CLib;
           btCANCELA.Caption := CRev;
        end;

        lbF_PAG_INICIAL.Caption := 'F. Pago Inicial';
        Label1.Caption := 'F. Valor Inicial';
        lbF_PAG_FINAL.Caption := 'F. Pago Final';
        Label3.Caption := 'F. Valor Final';
   END
   else
   BEGIN
        chB_MOVTO_EFECTIVO.Checked:= True;
        chB_MOVTO_EFECTIVO.Enabled:= True;
        btAUTORIZA.Caption := CAut + 'Comisión ';
        btLIBERA.Caption := CLib + 'Comisión ';
        btCANCELA.Caption := CRev + 'Comisión ';

        lbF_PAG_INICIAL.Caption := 'F. Pago Inicial';
        Label1.Caption := 'F. Venc Inicial';
        lbF_PAG_FINAL.Caption := 'F. Pago Final';
        Label3.Caption := 'F. Venc Final';
   END;
end;

procedure TWCrManRem.chAGRUP_TODOSClick(Sender: TObject);
var nRow : Integer;
begin
   IF chAGRUP_TODOS.Checked THEN
      BEGIN
        For nRow := 1 To sgcDATOS.SG.RowCount - 1 Do
        Begin
           IF sgcDATOS.CellStr['AUT',nRow] = '' THEN
              sgcDATOS.CellStr['AUT',nRow]:= 'SI' + #30 + '>C';
        end;
      END
   ELSE
      BEGIN
        For nRow := 0 To sgcDATOS.SG.RowCount - 1 Do
        Begin
           IF sgcDATOS.CellStr['AUT',nRow] = 'SI' + #30 + '>C' THEN
              sgcDATOS.CellStr['AUT',nRow]:= '';
        end;
      END;
end;

procedure TWCrManRem.Modificar1Click(Sender: TObject);
Var DocImpPr: TCrDocIMPr;
begin

   if length( sgcDATOS.CellStr['ID_PROVEEDOR',sgcDATOS.SG.Row]) <= 8 then Begin
   DocImpPr := TCrDocIMPr.Create(self);
   Try
      DocImpPr.Apli:=Objeto.Apli;
      DocImpPr.ID_PROVEEDOR.AsString := sgcDATOS.CellStr['ID_PROVEEDOR',sgcDATOS.SG.Row];
      DocImpPr.NOM_PROVEEDOR.AsString := sgcDATOS.CellStr['NOMBRE_PROV',sgcDATOS.SG.Row];
      DocImpPr.ParamCre:=Objeto.ParamCre;
      DocImpPr.Catalogo;
   finally
      DocImpPr.Free;
   end;
   end;
end;

end.

