// Sistema         : Clase de CR_GA_SOL_NAFIN
// Fecha de Inicio : 17/11/2005
// Función forma   : Clase de CR_GA_SOL_NAFIN
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCrCbSoNa;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, IntLinkit,
IntCrCredito, IntCrGruCla, IntParamCre, IntGenCre, Menus
;
Const
   CCBSOLNAF = 'GRGAFE'; //FSOLNA
              //Folio Corporativo de Solicitud de Desembolso
              //se ocupa el mismo folio que garantia fega(donde se ocupa la tabla CR_GA_DET_SOL_FG)
              //para no obtener folios duplicados.
Type
  TCrCbSoNa= class;

  TWCrCbSolNafin=Class(TForm)
    InterForma1             : TInterForma; 
    lbID_SOLICITUD : TLabel; 
    edID_SOLICITUD : TEdit;
    lbCVE_INTER_FINAN : TLabel; 
    edCVE_INTER_FINAN : TEdit;
    lbDIAS_PLAZO : TLabel;
    lbIMP_ADEUDO_CAP : TLabel;
    lbIMP_ADEUDO_INT : TLabel;
    lbIMP_SOLICITAR : TLabel;
    lbPCT_NAFIN_APLIC: TLabel;
    lbCVE_CAUSA_INC: TLabel;
    edDESC_INTER_FINAN : TEdit;
    rgCVE_TIPO_LIQ: TRadioGroup;
    btCVE_INTER_FINAN: TBitBtn;
    rgSIT_GA_SOL_NAFIN: TRadioGroup;
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
    edDESC_CREDITO: TEdit;
    btnID_CREDITO: TBitBtn;
    edID_CREDITO: TEdit;
    Label2: TLabel;
    edDIAS_PLAZO: TInterEdit;
    edIMP_ADEUDO_CAP: TInterEdit;
    edPCT_NAFIN_APLIC: TInterEdit;
    edIMP_ADEUDO_INT: TInterEdit;
    edIMP_SOLICITAR: TInterEdit;
    ilID_CREDITO: TInterLinkit;
    ilCVE_INTER_FINAN: TInterLinkit;
    GroupBox1: TGroupBox;
    lbCVE_USU_ALTA: TLabel;
    edCVE_USU_ALTA: TEdit;
    lbCVE_USU_MODIFICA: TLabel;
    edCVE_USU_MODIFICA: TEdit;
    lbF_ALTA: TLabel;
    edF_ALTA: TEdit;
    lbF_MODIFICA: TLabel;
    edF_MODIFICA: TEdit;
    BtnAnexo4: TBitBtn;
    edCVE_CAUSA_INC: TEdit;
    btnCVE_CAUSA_INC: TBitBtn;
    edDESC_CAUSA_INC: TEdit;
    ilCVE_CAUSA_INC: TInterLinkit;
    pmIncumplimiento: TPopupMenu;
    Nuevo1: TMenuItem;
    Catlogo1: TMenuItem;
    edIMP_RECUPERADO: TInterEdit;
    Label1: TLabel;
    edIMP_APLICADO: TInterEdit;
    Label3: TLabel;
    btComAnual: TBitBtn;
    Label4: TLabel;
    edIMP_VENCIDO: TInterEdit;
    btnSolPagoAnt: TBitBtn;
    btLiquidaPas: TBitBtn;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btnID_CREDITOClick(Sender: TObject);
    procedure ilID_CREDITOEjecuta(Sender: TObject);
    procedure edID_CREDITOExit(Sender: TObject);
    procedure rgCVE_TIPO_LIQExit(Sender: TObject);
    procedure edCVE_INTER_FINANExit(Sender: TObject);
    procedure edDIAS_PLAZOExit(Sender: TObject);
    procedure edCVE_CAUSA_INCExit(Sender: TObject);
    procedure rgSIT_GA_SOL_NAFINExit(Sender: TObject);
    procedure btCVE_INTER_FINANClick(Sender: TObject);
    procedure ilCVE_INTER_FINANEjecuta(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure BtnAnexo4Click(Sender: TObject);
    procedure ilCVE_CAUSA_INCEjecuta(Sender: TObject);
    procedure btnCVE_CAUSA_INCExit(Sender: TObject);
    procedure btnCVE_CAUSA_INCClick(Sender: TObject);
    procedure Nuevo1Click(Sender: TObject);
    procedure Catlogo1Click(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure btComAnualClick(Sender: TObject);
    procedure edIMP_ADEUDOChange(Sender: TObject);
    procedure btLiquidaPasClick(Sender: TObject);
    procedure btnSolPagoAntClick(Sender: TObject);
    private
    { Private declarations }
      Function LlamaDetalle: Boolean;
      Function ValidaSit: Boolean;
      Function ObtieneClave: String;
    public
    { Public declarations }
    Objeto : TCrCbSoNa;
  end;
  //
  TCrCbSoNa= class(TInterFrame)
  private
  protected
  //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
  public
    Function  GeneraComAnual : boolean;
  public
        { Public declarations }
        ID_SOLICITUD             : TInterCampo;
        ID_CREDITO               : TInterCampo;
        CVE_TIPO_LIQ             : TInterCampo;
        CVE_INTER_FINAN          : TInterCampo;
        CVE_CAUSA_INC            : TInterCampo;
        DIAS_PLAZO               : TInterCampo;
        IMP_ADEUDO_CAP           : TInterCampo;
        IMP_ADEUDO_INT           : TInterCampo;
        IMP_VENCIDO              : TInterCampo;
        IMP_SOLICITAR            : TInterCampo;
        IMP_APLICADO             : TInterCampo;
        IMP_RECUPERADO           : TInterCampo;
        PCT_NAFIN_APLIC          : TInterCampo;
        SIT_GA_SOL_NAFIN         : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        DESC_INTER_FINAN         : TInterCampo;

        CrCredito     : TCrCredito;
        InterFinan    : TCrGruCla;
        ParamCre      : TParamCre;
        CausasInc     : TCrGruCla;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override; 
        function    Reporte:Boolean; override; 
  published
  end;



implementation
Uses IntQrSDesembolso, IntQrRepDetAdeudo, IntCrCobPas, IntMGenArch;

{$R *.DFM}


constructor TCrCbSoNa.Create( AOwner : TComponent );
begin
  Inherited;
  ID_SOLICITUD :=CreaCampo('ID_SOLICITUD',ftFloat,tsNinguno,tsNinguno,True);
  ID_SOLICITUD.Caption:='Número de Solicitud';
  ID_CREDITO :=CreaCampo('ID_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
  ID_CREDITO.Caption:='Número de Crédito';
  CVE_TIPO_LIQ :=CreaCampo('CVE_TIPO_LIQ',ftString,tsNinguno,tsNinguno,True);
  CVE_TIPO_LIQ.Caption:='Clave de Tipo Liq';
  With CVE_TIPO_LIQ Do Begin
    Size:=2;
    UseCombo:=True;
    ComboLista.Add('0'); ComboDatos.Add('IP');
    ComboLista.Add('1'); ComboDatos.Add('LD');
  End;

  CVE_INTER_FINAN :=CreaCampo('CVE_INTER_FINAN',ftString,tsNinguno,tsNinguno,True);
  CVE_INTER_FINAN.Caption:='Clave de Inter Finan';
  DIAS_PLAZO :=CreaCampo('DIAS_PLAZO',ftFloat,tsNinguno,tsNinguno,True);
  DIAS_PLAZO.Caption:='Dias Plazo';
  IMP_ADEUDO_CAP :=CreaCampo('IMP_ADEUDO_CAP',ftFloat,tsNinguno,tsNinguno,True);
  IMP_ADEUDO_CAP.Caption:='Imp Adeudo Cap';
  IMP_ADEUDO_INT :=CreaCampo('IMP_ADEUDO_INT',ftFloat,tsNinguno,tsNinguno,True);
  IMP_ADEUDO_INT.Caption:='Imp Adeudo Int';
  IMP_VENCIDO    :=CreaCampo('IMP_VENCIDO',ftFloat,tsNinguno,tsNinguno,False);
  IMP_VENCIDO.Caption:='Imp Vencido';
  IMP_SOLICITAR :=CreaCampo('IMP_SOLICITAR',ftFloat,tsNinguno,tsNinguno,True);
  IMP_SOLICITAR.Caption:='Imp Solicitar';
  IMP_APLICADO :=CreaCampo('IMP_APLICADO',ftFloat,tsNinguno,tsNinguno,True);
  IMP_APLICADO.Caption:='Imp Aplicado';
  IMP_RECUPERADO :=CreaCampo('IMP_RECUPERADO',ftFloat,tsNinguno,tsNinguno,True);
  IMP_RECUPERADO.Caption:='Imp Recuperado';
  PCT_NAFIN_APLIC :=CreaCampo('PCT_NAFIN_APLIC',ftFloat,tsNinguno,tsNinguno,True);
  PCT_NAFIN_APLIC.Caption:='Pct FegaNafin Aplic';
  CVE_CAUSA_INC :=CreaCampo('CVE_CAUSA_INC',ftString,tsNinguno,tsNinguno,True);
  CVE_CAUSA_INC.Caption:='Causa Inc';
  SIT_GA_SOL_NAFIN :=CreaCampo('SIT_GA_SOL_NAFIN',ftString,tsNinguno,tsNinguno,True);
  SIT_GA_SOL_NAFIN.Caption:='Situación Liq Fondeo';
  //
  With SIT_GA_SOL_NAFIN Do Begin
    Size:=2;
    UseCombo:=True;
    ComboLista.Add('0');  ComboDatos.Add('AC');
    ComboLista.Add('1');  ComboDatos.Add('IN');
    ComboLista.Add('1');  ComboDatos.Add('EN');
  End;

  F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
  F_ALTA.Caption:='Fecha Alta';
  CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
  CVE_USU_ALTA.Caption:='Clave de Usu Alta';
  F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
  F_MODIFICA.Caption:='Fecha Modifica';
  CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
  CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
  DESC_INTER_FINAN :=CreaCampo('DESC_INTER_FINAN',ftString,tsNinguno,tsNinguno,False);
  DESC_INTER_FINAN.Caption:='Descripción Inter_finan';
  FKeyFields.Add('ID_SOLICITUD');

  TableName := 'CR_GA_SOL_NAFIN';
  UseQuery := True;
  HelpFile := 'IntCrCbSoNa.Hlp';
  ShowMenuReporte:=True;

  CrCredito := TCrCredito.Create(Self);
  CrCredito.MasterSource:=Self;
  CrCredito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';
  //
  InterFinan := TCrGruCla.Create(Self);
  InterFinan.MasterSource:=Self;
  //
  CausasInc  := TCrGruCla.Create(Self);
  CausasInc.MasterSource:=Self;
end;

Destructor TCrCbSoNa.Destroy;
begin
  If CrCredito <> Nil Then
     CrCredito.Free;
  If InterFinan <> Nil Then
     InterFinan.Free;
  If CausasInc <> Nil Then
     CausasInc.Free;
  //
  inherited;
end;


function TCrCbSoNa.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCbSolNafin;
begin
   W:=TWCrCbSolNafin.Create(Self);
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


Function TCrCbSoNa.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrCbSN.it','F');
      Try if Active then begin T.Param(0,ID_SOLICITUD.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

function TCrCbSoNa.Reporte:Boolean;
begin //Execute_Reporte();
end;


function TCrCbSoNa.GeneraComAnual: boolean;
var stpCargaCnCr : TStoredProc;
begin
  Result := False;
  stpCargaCnCr := TStoredProc.Create(nil);
  try
    with stpCargaCnCr do
    begin
      DatabaseName := Apli.DatabaseName;
      SessionName  := Apli.SessionName;
      StoredProcName:='PKGCRCREDITOO1.STPCARGACOMCRED';
      // Se crean los parametros del StoreProcedure
      Params.Clear;
      Params.CreateParam( ftInteger, 'PEID_CREDITO',    ptInput   );
      Params.CreateParam( ftDate,    'PEF_CORTE',       ptInput   );
      Params.CreateParam( ftString,  'PETIPO_COMISION', ptInput   );
      Params.CreateParam( ftString,  'PECVE_USUARIO',   ptInput   );
      Params.CreateParam( ftString,  'PEBCOMMIT',       ptInput   );
      Params.CreateParam( ftInteger, 'PSRESULTADO',     ptOutput  );
      Params.CreateParam( ftString,  'PSTXRESULTADO',   ptOutput  );
      //
      ParamByName('PEID_CREDITO'    ).AsInteger := ID_CREDITO.AsInteger;
      ParamByName('PEF_CORTE'       ).AsDate    := Apli.DameFechaEmpresa;
      ParamByName('PETIPO_COMISION' ).AsString  := 'AN';
      ParamByName('PECVE_USUARIO'   ).AsString  := Apli.Usuario;
      ParamByName('PEBCOMMIT'       ).AsString  := 'V';
      ParamByName('PSRESULTADO'     ).AsInteger := 0;
      ParamByName('PSTXRESULTADO'   ).AsString  := '';
      //
      ExecProc;
      if ParamByName('PSRESULTADO' ).asInteger = 0 then
        Result := True
      else begin
        ShowMessage( 'Problemas al generar la comisión anual de la garantía : ' + coCRLF +
                     'Código : ' + ParamByName('PSRESULTADO').AsString + coCRLF +
                     'Mensaje: ' + ParamByName('PSTXRESULTADO').AsString
                   );
      end;
      //
    end;
  finally
    stpCargaCnCr.Free;
  end;
end;


(***********************************************FORMA CR_GA_SOL_NAFIN********************)
(*                                                                              *)
(*  FORMA DE CR_GA_SOL_NAFIN                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_GA_SOL_NAFIN********************)

Function TWCrCbSolNafin.ValidaSit: Boolean;
Var  sSQL    : String;
     qyQuery : TQuery;
Begin
   Result := False;
   sSQL:='SELECT ID_CREDITO, CVE_FND_ENT_DES, CVE_FND_PROGRAMA, SIT_CREDITO '+
         '  FROM CR_FND_CREDITO '+
         ' WHERE ID_CREDITO = '  + Objeto.ID_CREDITO.AsSQL;
   qyQuery:= GetSQLQueryNoNil(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
   If qyQuery <> Nil Then Begin
      While not qyQuery.Eof Do Begin
         If (qyQuery.FieldByName('CVE_FND_ENT_DES').AsString <> '' ) And
            (qyQuery.FieldByName('SIT_CREDITO').AsString ='AC')Then Begin
            Result := True;
            Exit;
         End;
         qyQuery.Next;
      End;
      qyQuery.Free;
   End;
End;


Function TWCrCbSolNafin.LlamaDetalle: Boolean;
Var dResultado: Double; stpInserta : TStoredProc; sSQL: String;
    qyQuery:TQuery;
Begin
   Result := False;
   If Objeto.CrCredito.ID_CREDITO.AsInteger >0 Then Begin
      stpInserta:=TStoredProc.Create(Nil);
      Try
         stpInserta.DatabaseName:=Objeto.Apli.DataBaseName;
         stpInserta.SessionName:=Objeto.Apli.SessionName;
         stpInserta.Active:=False;
         stpInserta.Params.Clear;
         stpInserta.StoredProcName:='PKGCRCREDITOO1.STPOBTIMPORTES';
         stpInserta.Params.CreateParam(ftInteger, 'PEIDSOLICITUD',  ptInput);
         stpInserta.Params.CreateParam(ftString,  'PECVETIPOSOL',   ptInput);
         stpInserta.Params.CreateParam(ftInteger, 'PEIDCREDITO',    ptInput);
         stpInserta.Params.CreateParam(ftInteger, 'PEDIASPLAZO',    ptInput);
         stpInserta.Params.CreateParam(ftString,  'PEBGENDETALLE',  ptInput);
         stpInserta.Params.CreateParam(ftString,  'PEBCOMMIT',      ptInput);
         stpInserta.Params.CreateParam(ftFloat,   'PSIMPCP',        ptOutput);
         stpInserta.Params.CreateParam(ftFloat,   'PSIMPIN',        ptOutput);
         stpInserta.Params.CreateParam(ftInteger, 'PSRESULTADO',    ptOutput);
         stpInserta.Params.CreateParam(ftString,  'PSTXRESULTADO',  ptOutput);
         //
         stpInserta.ParamByName('PEIDSOLICITUD').AsInteger := Objeto.ID_SOLICITUD.AsInteger;
         stpInserta.ParamByName('PECVETIPOSOL').AsString   := 'SOLNAF';
         stpInserta.ParamByName('PEIDCREDITO').AsInteger   := Objeto.ID_CREDITO.AsInteger;
         stpInserta.ParamByName('PEDIASPLAZO').AsInteger   := Objeto.DIAS_PLAZO.AsInteger;
         stpInserta.ParamByName('PEBCOMMIT').AsString      := 'V';
         if Objeto.ID_SOLICITUD.AsInteger > 0 then
           stpInserta.ParamByName('PEBGENDETALLE').AsString  := 'V'
         else
           stpInserta.ParamByName('PEBGENDETALLE').AsString  := 'F';
         //
         stpInserta.ExecProc;
         If stpInserta.ParamByName('PSRESULTADO').AsInteger = 0 Then Begin
            Result  := True;
            Objeto.IMP_ADEUDO_CAP.AsFloat := stpInserta.ParamByName('PSIMPCP').AsFloat;
            Objeto.IMP_ADEUDO_INT.AsFloat := stpInserta.ParamByName('PSIMPIN').AsFloat;
            Objeto.IMP_VENCIDO.AsFloat    := Objeto.IMP_ADEUDO_CAP.AsFloat + Objeto.IMP_ADEUDO_INT.AsFloat;
         End Else Begin
            Result  := False;
            ShowMessage('Error  al Obtener los importes '+
                        stpInserta.ParamByName('PSTXRESULTADO').AsString );
            Objeto.IMP_ADEUDO_CAP.AsFloat:=0;
            Objeto.IMP_ADEUDO_INT.AsFloat:=0;
            Objeto.IMP_VENCIDO.AsFloat   :=0;
         End;
      Finally
         If stpInserta <> Nil Then Begin
            stpInserta.UnPrepare;
            stpInserta.Free;
         End;
      End;
   End;
   If Result Then Begin
      Objeto.PCT_NAFIN_APLIC.AsFloat:= 0;
      sSQL:= ' SELECT NVL(PKGCRDOCUMENTACION.OBTEQUIVOPERATIVA('+ Objeto.ID_CREDITO.AsString+
               ',3),0) AS PCT FROM DUAL ';
      qyQuery:= GetSQLQueryNoNil(sSQL, Objeto.DataBaseName, Objeto.SessionName, False);
      If qyQuery <> Nil Then Begin
         Objeto.PCT_NAFIN_APLIC.AsFloat := qyQuery.FieldByName('PCT').AsFloat;
         Objeto.IMP_SOLICITAR.AsFloat   := ( (Objeto.IMP_ADEUDO_CAP.AsFloat +
                                              Objeto.IMP_ADEUDO_INT.AsFloat
                                             )*
                                             ( Objeto.PCT_NAFIN_APLIC.AsFloat/ 100 )
                                           );
         qyQuery.Free;
      End;
   End;
   //
End;


procedure TWCrCbSolNafin.FormShow(Sender: TObject);
begin
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.ID_SOLICITUD.Control     := edID_SOLICITUD;
      Objeto.ID_CREDITO.Control       := edID_CREDITO;
      Objeto.CVE_TIPO_LIQ.Control     := rgCVE_TIPO_LIQ;
      Objeto.CVE_INTER_FINAN.Control  := edCVE_INTER_FINAN;
      Objeto.CVE_CAUSA_INC.Control    := edCVE_CAUSA_INC;
      Objeto.DIAS_PLAZO.Control       := edDIAS_PLAZO;
      Objeto.IMP_ADEUDO_CAP.Control   := edIMP_ADEUDO_CAP;
      Objeto.IMP_ADEUDO_INT.Control   := edIMP_ADEUDO_INT;
      Objeto.IMP_VENCIDO.Control      := edIMP_VENCIDO;
      Objeto.IMP_SOLICITAR.Control    := edIMP_SOLICITAR;
      Objeto.IMP_APLICADO.Control     := edIMP_APLICADO;
      Objeto.IMP_RECUPERADO.Control   := edIMP_RECUPERADO;
      Objeto.PCT_NAFIN_APLIC.Control  := edPCT_NAFIN_APLIC;
      Objeto.SIT_GA_SOL_NAFIN.Control := rgSIT_GA_SOL_NAFIN;
      Objeto.F_ALTA.Control           := edF_ALTA;
      Objeto.CVE_USU_ALTA.Control     := edCVE_USU_ALTA;
      Objeto.F_MODIFICA.Control       := edF_MODIFICA;
      Objeto.CVE_USU_MODIFICA.Control := edCVE_USU_MODIFICA;
      Objeto.DESC_INTER_FINAN.Control := edDESC_INTER_FINAN;

      Objeto.CrCredito.ID_CREDITO.Control  := edID_CREDITO;
      Objeto.CrCredito.ContratoCre.Producto.DESC_L_PRODUCTO.Control := edDESC_CREDITO;
      Objeto.InterFinan.CVE_REFERENCIA.Control := edCVE_INTER_FINAN;
      Objeto.InterFinan.VALOR.Control := edDESC_INTER_FINAN;
      Objeto.CausasInc.CVE_REFERENCIA.Control:= edCVE_CAUSA_INC;
      Objeto.CausasInc.VALOR.Control:= edDESC_CAUSA_INC;
      Interforma1.MsgPanel := MsgPanel;
end;

procedure TWCrCbSolNafin.FormDestroy(Sender: TObject);
begin
      Objeto.ID_SOLICITUD.Control     := nil;
      Objeto.ID_CREDITO.Control       := nil;
      Objeto.CVE_TIPO_LIQ.Control     := nil;
      Objeto.CVE_INTER_FINAN.Control  := nil;
      Objeto.CVE_CAUSA_INC.Control    := nil;
      Objeto.DIAS_PLAZO.Control       := nil;
      Objeto.IMP_ADEUDO_CAP.Control   := nil;
      Objeto.IMP_ADEUDO_INT.Control   := nil;
      Objeto.IMP_VENCIDO.Control      := nil;
      Objeto.IMP_SOLICITAR.Control    := nil;
      Objeto.IMP_APLICADO.Control     := nil;
      Objeto.IMP_RECUPERADO.Control   := nil;
      Objeto.PCT_NAFIN_APLIC.Control  := nil;
      Objeto.SIT_GA_SOL_NAFIN.Control := nil;
      Objeto.F_ALTA.Control           := nil;
      Objeto.CVE_USU_ALTA.Control     := nil;
      Objeto.F_MODIFICA.Control       := nil;
      Objeto.CVE_USU_MODIFICA.Control := nil;
      Objeto.DESC_INTER_FINAN.Control := nil;
      //
      Objeto.CrCredito.ID_CREDITO.Control  := nil;
      Objeto.CrCredito.ContratoCre.Producto.DESC_L_PRODUCTO.Control := nil;
      Objeto.InterFinan.CVE_REFERENCIA.Control:= nil;
      Objeto.InterFinan.VALOR.Control:= nil;
      Objeto.CausasInc.CVE_REFERENCIA.Control:= nil;
      Objeto.CausasInc.VALOR.Control:= nil;
end;

procedure TWCrCbSolNafin.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;
//
procedure TWCrCbSolNafin.InterForma1DespuesAceptar(Sender: TObject);
var sExiste : String;
begin
   GetSQLStr( 'SELECT DECODE( COUNT(*), 0 , ''F'', ''V'' ) B_EXISTE FROM CR_CB_PAGO_ANT WHERE ID_CREDITO = ' +
              Objeto.ID_CREDITO.AsString, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName,
              'B_EXISTE', sExiste, True );
   //
   if sExiste <> 'V' then
     MessageDlg( '¡¡¡ No existe una solicitud de pago anticipado !!!', mtWarning, [mbOK], 0 );
   //ends_if
end;


procedure TWCrCbSolNafin.InterForma1DespuesNuevo(Sender: TObject);
begin
   Objeto.CVE_TIPO_LIQ.AsString    := 'LD';
   Objeto.CVE_INTER_FINAN.AsString := ObtieneClave;
   If Not Objeto.InterFinan.FindKey(['INTERM',Objeto.CVE_INTER_FINAN.AsString]) Then
   Begin
      Objeto.CVE_INTER_FINAN.AsString:= ObtieneClave;
      ShowMessage('No existe una descripción para la clave');
   End;
   Objeto.DIAS_PLAZO.AsInteger      := 180;
   Objeto.IMP_APLICADO.AsFloat      := 0;
   Objeto.IMP_RECUPERADO.AsFloat    := 0;
   Objeto.SIT_GA_SOL_NAFIN.AsString := 'AC';
   //
   edID_CREDITO.SetFocus;
end;

procedure TWCrCbSolNafin.InterForma1DespuesModificar(Sender: TObject);
begin
   edCVE_INTER_FINAN.SetFocus;
end;



procedure TWCrCbSolNafin.btnID_CREDITOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCBSONA_DISPO',True,True) then
   begin
     Objeto.CrCredito.ShowAll := True;
     If Objeto.CrCredito.Busca Then Begin
        LlamaDetalle;
        InterForma1.NextTab(btnID_CREDITO);
     End;
   end;
end;


procedure TWCrCbSolNafin.ilID_CREDITOEjecuta(Sender: TObject);
begin
  If (Objeto.Modo=moAppend)Then
    If Objeto.CrCredito.FindKey([ilID_CREDITO.Buffer]) Then Begin
          LlamaDetalle;
          InterForma1.NextTab(edID_CREDITO);
    End;
end;

procedure TWCrCbSolNafin.edID_CREDITOExit(Sender: TObject);
Var vlSalida : Boolean;
    vlMsg    : String;
begin
   vlSalida := True;
   vlMsg    := '';
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      Objeto.ID_CREDITO.GetFromControl;
      If Objeto.ID_CREDITO.AsInteger = 0 Then Begin
         vlSalida := False;
         vlmsg := 'Favor de Indicar el Número de Disposición';
      End;
      InterForma1.ValidaExit(edID_CREDITO,vlSalida,vlMsg,True);
   end;
end;

procedure TWCrCbSolNafin.edIMP_ADEUDOChange(Sender: TObject);
begin
  Objeto.IMP_VENCIDO.AsFloat := Objeto.IMP_ADEUDO_CAP.AsFloat + Objeto.IMP_ADEUDO_INT.AsFloat;
end;



procedure TWCrCbSolNafin.rgCVE_TIPO_LIQExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgCVE_TIPO_LIQ,True,'',True);
end;

procedure TWCrCbSolNafin.edCVE_INTER_FINANExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edCVE_INTER_FINAN,True,'',True);
end;

procedure TWCrCbSolNafin.edDIAS_PLAZOExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edDIAS_PLAZO,True,'',True);
end;

procedure TWCrCbSolNafin.edCVE_CAUSA_INCExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edCVE_CAUSA_INC,True,'',True);
end;

procedure TWCrCbSolNafin.rgSIT_GA_SOL_NAFINExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_GA_SOL_NAFIN,True,'',True);
end;

procedure TWCrCbSolNafin.btCVE_INTER_FINANClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCBSONA_INTER',True,True) then
   begin
     Objeto.InterFinan.BuscaWhereString:= ' CVE_GRUPO_CLAVE = ''INTERM''';
     If Objeto.InterFinan.Busca Then Begin
        InterForma1.NextTab(btCVE_INTER_FINAN);
     End;
   end;
end;

procedure TWCrCbSolNafin.ilCVE_INTER_FINANEjecuta(Sender: TObject);
begin
   If Objeto.InterFinan.FindKey(['INTERM',ilCVE_INTER_FINAN.Buffer]) Then
      InterForma1.NextTab(btCVE_INTER_FINAN);
end;

procedure TWCrCbSolNafin.InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
          var Realizado: Boolean);
begin
  with Objeto Do
  begin
    If IsNewData Then
    Begin
        If MessageDlg('¿Desea almacenar los datos capturados?', mtConfirmation,[mbYes, mbNo], 0) = mrYes Then
        Begin
            ID_SOLICITUD.AsInteger:= ObtenFolio(CCBSOLNAF,'ID_SOLICITUD: ', Objeto.Apli);
            CVE_USU_ALTA.AsString := DameUsuario;
            F_ALTA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
            //
            If ID_SOLICITUD.AsInteger >0 Then
               Realizado := True
            Else
               Realizado := False;
        End Else
            Realizado := False;
    End Else Begin
        If MessageDlg('¿Desea guardar los datos modificados?', mtConfirmation,[mbYes, mbNo], 0) = mrYes Then
        Begin
            CVE_USU_MODIFICA.AsString := DameUsuario;
            F_MODIFICA.AsDateTime     := Apli.DameFechaEmpresaDia('D000');
            Realizado := True;
        End Else
            Realizado := False;
    End;
  End;
  //
  If Realizado Then
     Realizado := LlamaDetalle;
end;

procedure TWCrCbSolNafin.InterForma1Buscar(Sender: TObject);
begin
   If Objeto.InternalBusca Then Begin
      Objeto.InterFinan.FindKey(['INTERM',Objeto.CVE_INTER_FINAN.AsString]);
      Objeto.CausasInc.FindKey(['CAUSIN', Objeto.CVE_CAUSA_INC.AsString]);
   End;
end;

procedure TWCrCbSolNafin.InterForma1DespuesCancelar(Sender: TObject);
begin
   Objeto.InterFinan.FindKey(['INTERM',Objeto.CVE_INTER_FINAN.AsString]);
end;


Function TWCrCbSolNafin.ObtieneClave: String;
Var sSQL, sResultado:String; qyQuery: TQuery;
Begin
   sResultado:='';
   sSQL:= 'SELECT VALOR FROM CR_GRUPO_CLAVE '+
          ' WHERE CVE_GRUPO_CLAVE = ''SOGTNF'''+
          '   AND CVE_REFERENCIA= ''SGCVIN''';
   qyQuery:= GetSQLQueryNoNil(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
   If qyQuery <> Nil Then Begin
      sResultado:= qyQuery.FieldByName('VALOR').AsString;
      qyQuery.Free;
   End;
   ObtieneClave:= sResultado;
End;

procedure TWCrCbSolNafin.ilCVE_CAUSA_INCEjecuta(Sender: TObject);
begin
   If Objeto.InterFinan.FindKey(['CAUSIN',ilCVE_CAUSA_INC.Buffer]) Then
      InterForma1.NextTab(btnCVE_CAUSA_INC);
end;

procedure TWCrCbSolNafin.btnCVE_CAUSA_INCExit(Sender: TObject);
begin
   InterForma1.ValidaExit(edID_CREDITO,True,'',True);
end;

procedure TWCrCbSolNafin.btnCVE_CAUSA_INCClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCBSONA_INCUM',True,True) then
   begin
     Objeto.CausasInc.BuscaWhereString:= ' CVE_GRUPO_CLAVE = ''CAUSIN''';
     If Objeto.CausasInc.Busca Then Begin
        InterForma1.NextTab(btnCVE_CAUSA_INC);
     End;
   end;
end;

procedure TWCrCbSolNafin.Nuevo1Click(Sender: TObject);
Var CrGruClaNvo: TCrGruCla;
begin
   Try
      CrGruClaNvo := TCrGruCla.Create(Nil);
      CrGruClaNvo.Apli := Objeto.Apli;
      CrGruClaNvo.ParamCre := Objeto.ParamCre;
      CrGruClaNvo.sCveGrupo:= 'CAUSIN';
      CrGruClaNvo.Nuevo;
   Finally
      CrGruClaNvo.Free;
   End;
end;

procedure TWCrCbSolNafin.Catlogo1Click(Sender: TObject);
Var CrGruClaCta: TCrGruCla;
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then
      Objeto.GetFromControl;

   If Objeto.CVE_CAUSA_INC.AsString <> '' Then Begin
      Try
         CrGruClaCta := TCrGruCla.Create(Nil);
         CrGruClaCta.Apli := Objeto.Apli;
         CrGruClaCta.ParamCre := Objeto.ParamCre;
         CrGruClaCta.FindKey(['CAUSIN', Objeto.CVE_CAUSA_INC.AsString]);
         CrGruClaCta.Catalogo;
      Finally
         CrGruClaCta.Free;
      End;
   End;
end;
//
procedure TWCrCbSolNafin.btnSolPagoAntClick(Sender: TObject);
var MGenArch : TMGenArch;
begin
  If ( Objeto.ID_SOLICITUD.AsInteger > 0 ) Then
  Begin
      MGenArch := TMGenArch.Create(self);
      try
        MGenArch.Apli     := Objeto.Apli;
        MGenArch.ParamCre := Objeto.ParamCre;
        MGenArch.Catalogo;
      finally
        MGenArch.Free;
      end;
      //
  End Else Begin
      ShowMessage('Debe seleccionar una Solicitud');
  End;
end;
//
procedure TWCrCbSolNafin.btLiquidaPasClick(Sender: TObject);
var CrCobPas : TCrCobPas;
begin
  If ( Objeto.ID_SOLICITUD.AsInteger > 0 ) Then
  Begin
    //
    If ValidaSit then
    Begin
      //
      CrCobPas  := TCrCobPas.Create(self);
      try
        CrCobPas.Apli     := Objeto.Apli;
        CrCobPas.ParamCre := Objeto.ParamCre;
        CrCobPas.Catalogo;
      finally
        CrCobPas.Free;
      end;
      //
    End Else
      ShowMessage('No existe una disposición pasiva activa');
    //
  End Else Begin
      ShowMessage('Debe seleccionar una Solicitud');
  End;
end;
//
procedure TWCrCbSolNafin.btComAnualClick(Sender: TObject);
var MGenArch : TMGenArch;
begin
  If ( Objeto.ID_SOLICITUD.AsInteger > 0 ) Then
  Begin
    if Objeto.GeneraComAnual then
    Begin
      MGenArch := TMGenArch.Create(self);
      try
        MGenArch.Apli     := Objeto.Apli;
        MGenArch.ParamCre := Objeto.ParamCre;
        MGenArch.Catalogo;
      finally
        MGenArch.Free;
      end;
      //
    End;
  End Else Begin
      ShowMessage('Debe seleccionar una Solicitud');
  End;
End;
//
procedure TWCrCbSolNafin.BtnAnexo4Click(Sender: TObject);
begin
   If ( Objeto.ID_SOLICITUD.AsInteger > 0 ) Then
   Begin
     RepDesembolso(Objeto.ID_SOLICITUD.AsInteger, Objeto.ID_CREDITO.AsInteger, Objeto.Apli, True);
     RepDetAdeudo (Objeto.ID_SOLICITUD.AsInteger, Objeto.ID_CREDITO.AsInteger, Objeto.Apli, True);
   End Else Begin
      ShowMessage('Debe seleccionar una Solicitud');
   End;
end;



End.
