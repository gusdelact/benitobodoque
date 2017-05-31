// Sistema         : Clase de CR_BC_CLAVE_OBS
// Fecha de Inicio : 22/02/2006
// Función forma   : Clase de CR_BC_CLAVE_OBS
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Sergio Eduardo Lopez Lopez
// Comentarios     :
Unit IntCrBcClOb;

interface

uses
Windows,   Messages,   SysUtils,   Classes,   Graphics,   Controls,   Forms,
Dialogs,   IntFrm,     DB,         DbTables,  Mask,       StdCtrls,   Buttons,
ExtCtrls,  InterFor,   IntFind,    UnSQL2,    InterFun,   ComCtrls,   IntDtPk,
InterEdit, IntLinkit,  Grids,      Aligrid,

//
IntGenCre,
IntParamCre,
IntCrGruCla,
//
IntCrAcredit,     // Acreditado
IntCrCto,         // Contrato
IntCrCredito,     // Disposición
//
// Intercréditos
IntCrCli,         // Cliente
IntCrCon,         // Contrato
IntCrCre          // Credito
//
;


const


coSqlICRE =     'SELECT C.ID_CREDITO,'                                          + coCRLF +
                '       P.NOMBRE,'                                              + coCRLF +
                '       C.CVE_OBSERVACION,'                                     + coCRLF +
                '       DECODE(P.CVE_PER_JURIDICA, ''PM'', PM.DESCRIPCION,'     + coCRLF +
                '                                  ''PF'', PF.DESCRIPCION,'     + coCRLF +
                '                                  NULL'                        + coCRLF +
                '                                 ) DESCRIPCION,'               + coCRLF +
                '       P.CVE_PER_JURIDICA'                                     + coCRLF +
                'FROM   CR_CREDITO C,'                                          + coCRLF +
                '       CR_CONTRATO L,'                                         + coCRLF +
                '       CONTRATO CTTO,'                                         + coCRLF +
                '       PERSONA P,'                                             + coCRLF +
                '       (SELECT ''PM'' CVE_PER_JURIDICA,'                       + coCRLF +
                '               CVE_REFERENCIA CVE_OBSERVACION,'                + coCRLF +
                '               VALOR DESCRIPCION'                              + coCRLF +
                '        FROM   CR_GRUPO_CLAVE'                                 + coCRLF +
                '        WHERE  CVE_GRUPO_CLAVE = ''BCCOPM'''                   + coCRLF +
                '       ) PM,'                                                  + coCRLF +
                '       (SELECT ''PF'' CVE_PER_JURIDICA,'                       + coCRLF +
                '               CVE_REFERENCIA CVE_OBSERVACION,'                + coCRLF +
                '               VALOR DESCRIPCION'                              + coCRLF +
                '        FROM   CR_GRUPO_CLAVE'                                 + coCRLF +
                '        WHERE  CVE_GRUPO_CLAVE = ''BCCOPF'''                   + coCRLF +
                '       ) PF,'                                                  + coCRLF +
                '       ('                                                      + coCRLF +
                '        SELECT TO_DATE( TO_CHAR( %s - 15, ''MM/YYYY'' ) , ''MM/YYYY'' ) F_MAN' + coCRLF +
                '        FROM   DUAL'                                           + coCRLF +
                '       )'                                                      + coCRLF +
                'WHERE  C.ID_CONTRATO  = L.ID_CONTRATO'                         + coCRLF +
                '  AND  C.FOL_CONTRATO = L.FOL_CONTRATO'                        + coCRLF +
                '  AND  L.ID_CONTRATO  = CTTO.ID_CONTRATO'                      + coCRLF +
                '  AND  P.ID_PERSONA   = CTTO.ID_TITULAR'                       + coCRLF +
                '  AND  PM.CVE_OBSERVACION(+) = C.CVE_OBSERVACION'              + coCRLF +
                '  AND  PF.CVE_OBSERVACION(+) = C.CVE_OBSERVACION'              + coCRLF +
                '  AND  CTTO.ID_EMPRESA   = %d'                                 + coCRLF +
                '  AND  (   C.SIT_CREDITO = ''AC'' OR   '                       + coCRLF +
                '         ( C.SIT_CREDITO = ''LQ'' AND  '                       + coCRLF +
                '           C.F_LIQUIDACION >= F_MAN'                           + coCRLF +
                '         )'                                                    + coCRLF +
                '       )';
                //'ORDER BY P.NOMBRE, C.ID_CREDITO';

coSqlCRED =     'SELECT C.ID_CREDITO,'                                          + coCRLF +
                '       P.NOMBRE,'                                              + coCRLF +
                '       C.CVE_OBSERVACION,'                                     + coCRLF +
                '       DECODE(P.CVE_PER_JURIDICA, ''PM'', PM.DESCRIPCION,'     + coCRLF +
                '                                  ''PF'', PF.DESCRIPCION,'     + coCRLF +
                '                                  NULL'                        + coCRLF +
                '                                 ) DESCRIPCION,'               + coCRLF +
                '       P.CVE_PER_JURIDICA'                                     + coCRLF +
                'FROM   CRE_CREDITO C,'                                         + coCRLF +
                '       CRE_CONTRATO L,'                                        + coCRLF +
                '       CONTRATO CTTO,'                                         + coCRLF +
                '       PERSONA P,'                                             + coCRLF +
                '       (SELECT ''PM'' CVE_PER_JURIDICA,'                       + coCRLF +
                '               CVE_REFERENCIA CVE_OBSERVACION,'                + coCRLF +
                '               VALOR DESCRIPCION'                              + coCRLF +
                '        FROM   CR_GRUPO_CLAVE'                                 + coCRLF +
                '        WHERE  CVE_GRUPO_CLAVE = ''BCCOPM'''                   + coCRLF +
                '       ) PM,'                                                  + coCRLF +
                '       (SELECT ''PF'' CVE_PER_JURIDICA,'                       + coCRLF +
                '               CVE_REFERENCIA CVE_OBSERVACION,'                + coCRLF +
                '               VALOR DESCRIPCION'                              + coCRLF +
                '        FROM   CR_GRUPO_CLAVE'                                 + coCRLF +
                '        WHERE  CVE_GRUPO_CLAVE = ''BCCOPF'''                   + coCRLF +
                '       ) PF,'                                                  + coCRLF +
                '       ('                                                      + coCRLF +
                '        SELECT TO_DATE( TO_CHAR( %s - 15, ''MM/YYYY'' ) , ''MM/YYYY'' ) F_MAN'  + coCRLF +
                '        FROM   DUAL'                                           + coCRLF +
                '       )'                                                      + coCRLF +
                'WHERE  C.ID_CONTRATO  = L.ID_CONTRATO'                         + coCRLF +
                '  AND  L.ID_CONTRATO  = CTTO.ID_CONTRATO'                      + coCRLF +
                '  AND  P.ID_PERSONA   = CTTO.ID_TITULAR'                       + coCRLF +
                '  AND  PM.CVE_OBSERVACION(+) = C.CVE_OBSERVACION'              + coCRLF +
                '  AND  PF.CVE_OBSERVACION(+) = C.CVE_OBSERVACION'              + coCRLF +
                '  AND  CTTO.ID_EMPRESA   = %d'                                 + coCRLF +
                '  AND  (   C.SIT_CREDITO = ''AC'' OR'                          + coCRLF +
                '         ( C.SIT_CREDITO = ''LQ'' AND'                         + coCRLF +
                '           C.F_LIQ_BNC >= F_MAN'                               + coCRLF +
                '         )'                                                    + coCRLF +
                '       )';
                //'ORDER BY C.ID_CREDITO';
//
coBCCOPF     = 'BCCOPF';
coBCCOPM     = 'BCCOPM';
//
coPosCred    = 0;
coPosNombre  = 1;
coPosObs     = 2;
coPosDesc    = 3;


Type
  TCrBcClOb      = class;

  TWCrBcClaveObs = class(TForm)
    InterForma1: TInterForma;
    Label1: TLabel;
    edACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    ilACREDITADO: TInterLinkit;
    chbxAcreditado: TCheckBox;
    Label2: TLabel;
    edID_CREDITO: TEdit;
    btID_CREDITO: TBitBtn;
    ilCredito: TInterLinkit;
    edDESC_CREDITO: TEdit;
    chbxCREDITO: TCheckBox;
    Label7: TLabel;
    iedID_CONTRATO: TInterEdit;
    btCONTRATO: TBitBtn;
    edCVE_PRODUCTO: TEdit;
    ilIDCONTRATO: TInterLinkit;
    edDESC_PRODUCTO: TEdit;
    chbxAutorizacion: TCheckBox;
    pnColumnas: TPanel;
    edTitDocto: TEdit;
    edTitFVentto: TEdit;
    edTitSEL: TEdit;
    edTitDisp: TEdit;
    sagDATOS: TStringAlignGrid;
    btPropositos: TBitBtn;
    btCANCELA: TBitBtn;
    edCVE_OBSERVA: TEdit;
    btnCveObserva: TBitBtn;
    edDESC_OBSERVA: TEdit;
    ilCveObserva: TInterLinkit;
    Label3: TLabel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure chbxAcreditadoClick(Sender: TObject);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure chbxAutorizacionClick(Sender: TObject);
    procedure ilIDCONTRATOEjecuta(Sender: TObject);
    procedure btCONTRATOClick(Sender: TObject);
    procedure chbxCREDITOClick(Sender: TObject);
    procedure ilCreditoEjecuta(Sender: TObject);
    procedure btID_CREDITOClick(Sender: TObject);
    procedure btnCveObservaClick(Sender: TObject);
    procedure ilCveObservaEjecuta(Sender: TObject);
    procedure btPropositosClick(Sender: TObject);
    procedure btCANCELAClick(Sender: TObject);
  private
    procedure LimpiaPantalla;
    procedure BuscaDatos;
  public
    Objeto : TCrBcClOb;
  end;
  //
  //
  TCrBcClOb= class(TInterFrame)
  private
  protected
  //procedure Notification( AComponent : TComponent; Operation : TOperation); override;
  public
  { Public declarations }
    //
    B_FOUND                  : TInterCampo;
    CVE_PER_JURIDICA         : TInterCampo;
    CVE_APLICACION           : TInterCampo;
    //
    ParamCre                 : TParamCre;
    ClaveObserva             : TCrGruCla;
    //
    CredCliente              : TCrCli;
    CredContrato             : TCrCon;
    CredCredito              : TCrCre;
    //
    Acreditado               : TCrAcredit;
    ContratoCre              : TCrCto;
    Credito                  : TCrCredito;
    //
    function    stpCveObservacionBnc( peMetodo     : Integer; peIdCredito : Integer;
                                      peCveObserva : String;  peCveOrigen : String
                                    ): Boolean;
    //
    function    InternalBusca : Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    function    Reporte:Boolean; override;
  published
  end;

const
 coICRE  = 'ICRE';
 coCRED  = 'CRED';  



implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrBcClOb.Create( AOwner : TComponent );
begin
  Inherited;
  //
  B_FOUND          := CreaCampo( 'B_FOUND',          ftString, tsNinguno, tsNinguno, False  );
  //
  CVE_APLICACION   := CreaCampo( 'CVE_APLICACION',   ftString, tsNinguno, tsNinguno, False  );
  CVE_APLICACION.AsString := coICRE;
  //
  CVE_PER_JURIDICA := CreaCampo( 'CVE_PER_JURIDICA', ftString, tsNinguno, tsNinguno, False  );
  //
  ClaveObserva := TCrGruCla.Create(Self);
  ClaveObserva.MasterSource := Self;
  //
  CredCliente  := TCrCli.Create(Self);
  CredCliente.MasterSource := Self;
  //
  CredContrato := TCrCon.Create(Self);
  CredContrato.MasterSource := Self;
  //
  CredCredito  := TCrCre.Create(Self);
  CredCredito.MasterSource := Self;
  //
  Acreditado   := TCrAcredit.Create(Self);
  Acreditado.MasterSource := Self;
  //
  ContratoCre  := TCrCto.Create(Self);
  ContratoCre.MasterSource := Self;
  //
  Credito      := TCrCredito.Create(Self);
  Credito.MasterSource := Self;
  //
  StpName  := ' ';
  UseQuery := False;
  HelpFile := 'IntCrBcClOb.Hlp';
  ShowMenuReporte := True;
end;

Destructor TCrBcClOb.Destroy;
begin
  //
  if CredCliente <> nil then
    CredCliente.Free;
  //
  if CredContrato <> nil then
    CredContrato.Free;
  //
  if CredCredito <> nil then
    CredCredito.Free;
  //
  if Acreditado <> nil then
    Acreditado.Free;
  //
  if ContratoCre <> nil then
    ContratoCre.Free;
  //
  if Credito <> nil then
    Credito.Free;
  //
  inherited;
end;


function TCrBcClOb.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrBcClaveObs;
begin
   W:=TWCrBcClaveObs.Create(Self);
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


Function TCrBcClOb.InternalBusca:Boolean;
var T : TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('ICrBcCO.it','');
  Try
    if Active then begin end;
    //
    if T.Execute then
      InternalBusca := FindKey([]);
  finally
    T.Free;
  end;
end;

function TCrBcClOb.Reporte:Boolean;
begin
  //Execute_Reporte();
end;

function TCrBcClOb.stpCveObservacionBnc(peMetodo,     peIdCredito: Integer;
                                        peCveObserva, peCveOrigen: String): Boolean;
var stpCveObserva : TStoredProc;
begin
  Result  := False;
  stpCveObserva := TStoredProc.Create(nil);
  try
    with stpCveObserva do
    begin
      DatabaseName := Apli.DatabaseName;
      SessionName  := Apli.SessionName;
      StoredProcName:='PKGBURO.STPCVEOBSERVACIONBNC';
      // Se crean los parametros del StoreProcedure
      Params.Clear;
      Params.CreateParam( ftFloat,   'PEMETODO',         ptInput   );
      Params.CreateParam( ftFloat,   'PEIDCREDITO',      ptInput   );
      Params.CreateParam( ftString,  'PECVEOBSERVA',     ptInput   );
      Params.CreateParam( ftString,  'PECVEORIGEN',      ptInput   );
      Params.CreateParam( ftString,  'PEBCOMMIT',        ptInput   );
      Params.CreateParam( ftFloat,   'PSRESULTADO',      ptOutput  );
      Params.CreateParam( ftString,  'PSTXRESULTADO',    ptOutput  );
      //
      ParamByName( 'PEMETODO'     ).AsInteger := peMetodo;
      ParamByName( 'PEIDCREDITO'  ).AsInteger := peIdCredito;
      ParamByName( 'PECVEOBSERVA' ).AsString  := peCveObserva;
      ParamByName( 'PECVEORIGEN'  ).AsString  := peCveOrigen;
      ParamByName( 'PEBCOMMIT'    ).AsString  := 'V';
      //
      ExecProc;
      if ParamByName('PSRESULTADO' ).asInteger = 0 then
      Begin
        Result  := True;
      End else begin
        ShowMessage( 'Error al actualizar la clave de observación: ' + coCRLF +
                     'Código : ' + ParamByName('PSRESULTADO').AsString    + coCRLF +
                     'Mensaje: ' + ParamByName('PSTXRESULTADO').AsString
                   );
      end;
      //
    end;
  finally
    stpCveObserva.Free;
  end;
end;
(***********************************************FORMA CR_BC_CLAVE_OBS********************)
(*                                                                              *)
(*  FORMA DE CR_BC_CLAVE_OBS                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_BC_CLAVE_OBS********************)
//
procedure TWCrBcClaveObs.LimpiaPantalla;
var vlCol, vlRow : Integer;
begin
  // Barre el grid de datos y quita la información
  for vlRow := 0 to sagDATOS.RowCount - 1 do
  begin
    for vlCol := 0 to sagDATOS.ColCount - 1 do
    begin
      sagDATOS.Cells    [ vlCol, vlRow ] := '';
      sagDATOS.ColorCell[ vlCol, vlRow ] := clWindow;
      //
    end;
    sagDATOS.RowHeights[ vlRow ] := sagDATOS.DefaultRowHeight;
  end;
  sagDATOS.RowCount := 1;
  //
  Application.ProcessMessages;
end;
//
procedure TWCrBcClaveObs.BuscaDatos;
var sSql : String;
    qQry : TQuery;
    nRow : Integer;
begin
  //
  LimpiaPantalla;
  //
  Objeto.B_FOUND.AsString := 'F';
  //
  if ( edACREDITADO.Text = '' ) and ( iedID_CONTRATO.Text = '' ) and ( edID_CREDITO.Text = '' ) then
    Exit;
  //ends_if
  //
  if Objeto.CVE_APLICACION.AsString = coICRE then
  Begin
    sSql := Format( coSqlICRE,  [ SQLFecha( Objeto.Apli.DameFechaEmpresa ), Objeto.Apli.IdEmpresa ] );
  End else if Objeto.CVE_APLICACION.AsString = coCRED then
  Begin
    sSql := Format( coSqlCRED,  [ SQLFecha( Objeto.Apli.DameFechaEmpresa ), Objeto.Apli.IdEmpresa ] );
  End;
  //
  if edACREDITADO.Text <> '' then
    sSql := sSql + ' AND CTTO.ID_TITULAR = '  + edACREDITADO.Text;
  //
  if iedID_CONTRATO.Text <> '' then
    sSql := sSql + ' AND CTTO.ID_CONTRATO = ' + iedID_CONTRATO.Text;
  //
  if edID_CREDITO.Text <> '' then
    sSql := sSql + ' AND C.ID_CREDITO = '     + edID_CREDITO.Text;
  //
    sSql := sSql + coCRLF + ' ORDER BY P.NOMBRE, C.ID_CREDITO';
  //
  qQry := GetSQLQuery( sSql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False );
  if not ( qQry <> nil ) then
  Begin
    Exit;
  End;
  //
  nRow := 0;
  qQry.First;
  Objeto.B_FOUND.AsString := 'V';
  while not qQry.Eof do
  Begin
    //
    sagDATOS.Cells[ coPosCred,    nRow ] := qQry.FieldByName('ID_CREDITO').AsString;
    sagDATOS.Cells[ coPosNombre,  nRow ] := qQry.FieldByName('NOMBRE').AsString;
    sagDATOS.Cells[ coPosObs,     nRow ] := qQry.FieldByName('CVE_OBSERVACION').AsString;
    sagDATOS.Cells[ coPosDesc,    nRow ] := qQry.FieldByName('DESCRIPCION').AsString;
    Objeto.CVE_PER_JURIDICA.AsString     := qQry.FieldByName('CVE_PER_JURIDICA').AsString;
    qQry.Next;
    if not qQry.Eof then
    Begin
      sagDATOS.RowCount := sagDATOS.RowCount + 1;
      inc(nRow);
    End;
    //
  End;
  {}
end;
//
procedure TWCrBcClaveObs.FormShow(Sender: TObject);
begin
  // Por defeult funciona con las clases de ICRE
  Objeto.CVE_APLICACION.AsString := coICRE;
  if Objeto.Apli.Apli = coCRED then
    Objeto.CVE_APLICACION.AsString := coCRED;
  //
  //PINTA DATOS DEL PANEL INFERIOR
  if Objeto.ParamCre <> nil then
  Begin
    lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
    lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
    lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
    lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;
  End;
  //
  if Objeto.CVE_APLICACION.AsString = coICRE then
  Begin
    Objeto.Acreditado.ID_ACREDITADO.Control  := edACREDITADO;
    Objeto.Acreditado.Persona.Nombre.Control := edNOMBRE_ACRED;
    //
    Objeto.ContratoCre.ID_CONTRATO.Control := iedID_CONTRATO;
    Objeto.ContratoCre.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO;
    Objeto.ContratoCre.Producto.DESC_C_PRODUCTO.Control := edDESC_PRODUCTO;
    //
    Objeto.Credito.ID_CREDITO.Control := edID_CREDITO;
    Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := edDESC_CREDITO;
  End;
  //
  if Objeto.CVE_APLICACION.AsString = coCRED then
  Begin
    Objeto.CredCliente.ID_PERSONA.Control     := edACREDITADO;
    Objeto.CredCliente.Persona.Nombre.Control := edNOMBRE_ACRED;
    //
    Objeto.CredContrato.ID_CONTRATO.Control   := iedID_CONTRATO;
    Objeto.CredContrato.SubtipoBanco.CVE_SUB_TIP_BCO.Control := edCVE_PRODUCTO;
    Objeto.CredContrato.SubtipoBanco.DESC_SUB_TIPO.Control   := edDESC_PRODUCTO;
    //
    Objeto.CredCredito.ID_CREDITO.Control := edID_CREDITO;
    Objeto.CredCredito.Autorizacion.Contrato.TITNOMBRE.Control := edDESC_CREDITO;
    //
  End;
  //
  Objeto.CredContrato.BuscaWhereString := 'CRE_CONTRATO.ID_CONTRATO NOT IN (SELECT ID_CONTRATO FROM CRE_CONTRATO C, ' +
                                          'CRE_SUB_TIP_BCO S WHERE C.CVE_SUB_TIP_BCO = S.CVE_SUB_TIP_BCO AND '        +
                                          'S.CVE_SUB_CARTERA = ''DESCUE'') AND (CRE_CONTRATO.SIT_LINEA = ''AC'')';
  Objeto.CredContrato.FilterString     := Objeto.CredContrato.BuscaWhereString ;
  //
  Objeto.ContratoCre.BuscaWhereString := 'CR_CONTRATO.SIT_LINEA = ''AC''';
  Objeto.ContratoCre.FilterString     := Objeto.ContratoCre.BuscaWhereString;
  //
  Objeto.ClaveObserva.CVE_REFERENCIA.Control := edCVE_OBSERVA;
  Objeto.ClaveObserva.VALOR.Control := edDESC_OBSERVA;
  //
  LimpiaPantalla;
  Objeto.B_FOUND.AsString := 'F';
end;

procedure TWCrBcClaveObs.FormDestroy(Sender: TObject);
begin
  if Objeto.CVE_APLICACION.AsString = coICRE then
  Begin
    Objeto.Acreditado.Active  := False;
    Objeto.ContratoCre.Active := False;
    Objeto.Credito.Active     := False;
    //
    Objeto.Acreditado.ID_ACREDITADO.Control := nil;
    Objeto.Acreditado.Persona.Nombre.Control := nil;

    Objeto.ContratoCre.ID_CONTRATO.Control := nil;
    Objeto.ContratoCre.CVE_PRODUCTO_CRE.Control := nil;
    Objeto.ContratoCre.Producto.DESC_C_PRODUCTO.Control := nil;

    Objeto.Credito.ID_CREDITO.Control := nil;
    Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := nil;
  End;
  //
  if Objeto.CVE_APLICACION.AsString = coCRED then
  Begin
    Objeto.CredCliente.Active  := False;
    Objeto.CredContrato.Active := False;
    Objeto.CredCredito.Active  := False;
    //
    Objeto.CredCliente.ID_PERSONA.Control     := nil;
    Objeto.CredCliente.Persona.Nombre.Control := nil;
    //
    Objeto.CredContrato.ID_CONTRATO.Control   := nil;
    Objeto.CredContrato.SubtipoBanco.CVE_SUB_TIP_BCO.Control := nil;
    Objeto.CredContrato.SubtipoBanco.DESC_SUB_TIPO.Control   := nil;
    //
    Objeto.CredCredito.ID_CREDITO.Control := nil;
    Objeto.CredCredito.Autorizacion.Contrato.TITNOMBRE.Control := nil;
  End;
  //
  Objeto.ClaveObserva.CVE_REFERENCIA.Control := nil;
  Objeto.ClaveObserva.VALOR.Control := nil;
  //
end;

procedure TWCrBcClaveObs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;
{
+ ---------------------------------------------------------------------------- +
|                                                                              |
|                                 ACREDITADO                                   |
|                                                                              |
+ ---------------------------------------------------------------------------- +
}
procedure TWCrBcClaveObs.chbxAcreditadoClick(Sender: TObject);
begin
  If not chbxAcreditado.Checked Then
  Begin
    if Objeto.CVE_APLICACION.AsString = coICRE then
      Objeto.Acreditado.Active   := False
    else if Objeto.CVE_APLICACION.AsString = coCRED then
      Objeto.CredCliente.Active   := False;
    //
    chbxAcreditado.Checked := False;
    chbxAcreditado.Enabled := False;
    LimpiaPantalla;
    BuscaDatos;
  End Else Begin
    chbxAcreditado.Checked := True;
    chbxAcreditado.Enabled := True;
  End;
  //
end;
//
procedure TWCrBcClaveObs.ilACREDITADOEjecuta(Sender: TObject);
var Flag : Boolean;
begin
  Flag := False;
  //
  if Objeto.CVE_APLICACION.AsString = coICRE then
    Flag := Objeto.Acreditado.FindKey([ilACREDITADO.Buffer])
  else if Objeto.CVE_APLICACION.AsString = coCRED then
    Flag := Objeto.CredCliente.FindKey([ilACREDITADO.Buffer]);
  //
  If Flag Then
  Begin
    chbxAcreditado.Checked := True;
    chbxAcreditado.Enabled := True;
    InterForma1.NextTab(edACREDITADO);
    Objeto.ClaveObserva.Active := False;
    BuscaDatos;
  End;
  //
End;
//
procedure TWCrBcClaveObs.btACREDITADOClick(Sender: TObject);
var Flag : Boolean;
begin
  Flag := False;
  //
  if Objeto.CVE_APLICACION.AsString = coICRE then
    Flag := Objeto.Acreditado.Busca
  else If Objeto.CVE_APLICACION.AsString = coCRED then
    Flag := Objeto.CredCliente.Busca;
  //
  If Flag Then
  Begin
    chbxAcreditado.Checked := True;
    chbxAcreditado.Enabled := True;
    InterForma1.NextTab(edACREDITADO);
    Objeto.ClaveObserva.Active := False;
    BuscaDatos;
  End;
  //
end;
{
+ ---------------------------------------------------------------------------- +
|                                                                              |
|                                 AUTORIZACION                                 |
|                                                                              |
+ ---------------------------------------------------------------------------- +
}
procedure TWCrBcClaveObs.chbxAutorizacionClick(Sender: TObject);
begin
  //
  If not chbxAutorizacion.Checked Then
  Begin
    if Objeto.CVE_APLICACION.AsString = coICRE then
      Objeto.ContratoCre.Active   := False
    else if Objeto.CVE_APLICACION.AsString = coCRED then
      Objeto.CredContrato.Active  := False;
    //
    chbxAutorizacion.Checked := False;
    chbxAutorizacion.Enabled := False;
    LimpiaPantalla;
    BuscaDatos;
  End Else Begin
    chbxAutorizacion.Checked := True;
    chbxAutorizacion.Enabled := True;
  End;
  //
end;
//
procedure TWCrBcClaveObs.ilIDCONTRATOEjecuta(Sender: TObject);
var Flag : Boolean;
begin
  //
  Flag := False;
  //
  if Objeto.CVE_APLICACION.AsString = coICRE then
    Flag := Objeto.ContratoCre.FindKey([ilIDCONTRATO.Buffer])
  else if Objeto.CVE_APLICACION.AsString = coCRED then
    Flag := Objeto.CredContrato.FindKey([ilIDCONTRATO.Buffer]);
  //
  If Flag Then
  Begin
    chbxAutorizacion.Checked := True;
    chbxAutorizacion.Enabled := True;
    InterForma1.NextTab(iedID_CONTRATO);
    Objeto.ClaveObserva.Active := False;
    BuscaDatos;
  End;
  //
end;
//
procedure TWCrBcClaveObs.btCONTRATOClick(Sender: TObject);
var Flag : Boolean;
begin
  //
  Flag := False;
  //
  if Objeto.CVE_APLICACION.AsString = coICRE then
    Flag := Objeto.ContratoCre.Busca
  else if Objeto.CVE_APLICACION.AsString = coCRED then
    Flag := Objeto.CredContrato.Busca;
  //
  If Flag Then
  Begin
    chbxAutorizacion.Checked := True;
    chbxAutorizacion.Enabled := True;
    InterForma1.NextTab(iedID_CONTRATO);
    Objeto.ClaveObserva.Active := False;
    BuscaDatos;
  End;
  //
end;
{
+ ---------------------------------------------------------------------------- +
|                                                                              |
|                                 CREDITO                                      |
|                                                                              |
+ ---------------------------------------------------------------------------- +
}
procedure TWCrBcClaveObs.chbxCREDITOClick(Sender: TObject);
begin
  If not chbxCREDITO.Checked Then
  Begin
    if Objeto.CVE_APLICACION.AsString = coICRE then
      Objeto.Credito.Active     := False
    else if Objeto.CVE_APLICACION.AsString = coCRED then
      Objeto.CredCredito.Active := False;
    //
    chbxCREDITO.Checked := False;
    chbxCREDITO.Enabled := False;
    LimpiaPantalla;
    BuscaDatos;
  End Else Begin
    chbxCREDITO.Checked := True;
    chbxCREDITO.Enabled := True;
  End;
  //
end;

procedure TWCrBcClaveObs.ilCreditoEjecuta(Sender: TObject);
var Flag : Boolean;
begin
  //
  Flag := False;
  //
  if Objeto.CVE_APLICACION.AsString = coICRE then
    Flag := Objeto.Credito.FindKey([ilCredito.Buffer])
  else if Objeto.CVE_APLICACION.AsString = coCRED then
    Flag := Objeto.CredCredito.FindKey([ilCredito.Buffer]);
  //
  If Flag Then
  Begin
    chbxCREDITO.Checked := True;
    chbxCREDITO.Enabled := True;
    InterForma1.NextTab(edID_CREDITO);
    Objeto.ClaveObserva.Active := False;
    BuscaDatos;
  End;
  //
end;

procedure TWCrBcClaveObs.btID_CREDITOClick(Sender: TObject);
var Flag : Boolean;
begin
  //
  Flag := False;
  //
  if Objeto.CVE_APLICACION.AsString = coICRE then
    Flag := Objeto.Credito.Busca
  else if Objeto.CVE_APLICACION.AsString = coCRED then
    Flag := Objeto.CredCredito.Busca;
  //
  If Flag Then
  Begin
    chbxCREDITO.Checked := True;
    chbxCREDITO.Enabled := True;
    InterForma1.NextTab(edID_CREDITO);
    Objeto.ClaveObserva.Active := False;
    BuscaDatos;
  End;
  //
end;
{
+ ---------------------------------------------------------------------------- +
|                                                                              |
|                         CLAVE DE OBSERVACION                                 |
|                                                                              |
+ ---------------------------------------------------------------------------- +
}
procedure TWCrBcClaveObs.btnCveObservaClick(Sender: TObject);
var sFiltro : String;
begin
  sFiltro := '';
  If Objeto.CVE_PER_JURIDICA.AsString = 'PF' then
    sFiltro := ' CVE_GRUPO_CLAVE = ''BCCOPF'' '
  Else If Objeto.CVE_PER_JURIDICA.AsString = 'PM' then
    sFiltro := ' CVE_GRUPO_CLAVE = ''BCCOPM'' '
  ;
  Objeto.ClaveObserva.FilterString := sFiltro;
  Objeto.ClaveObserva.BuscaWhereString := sFiltro;
  //
  Objeto.ClaveObserva.Busca;
end;

procedure TWCrBcClaveObs.ilCveObservaEjecuta(Sender: TObject);
var sFiltro : String;
begin
  If Objeto.CVE_PER_JURIDICA.AsString = 'PF' then
    sFiltro := coBCCOPF
  Else If Objeto.CVE_PER_JURIDICA.AsString = 'PM' then
    sFiltro := coBCCOPM;
  //
  //
  Objeto.ClaveObserva.FindKey( [ sFiltro, ilCveObserva.Buffer ] );
  //
end;

procedure TWCrBcClaveObs.btPropositosClick(Sender: TObject);
var i     : integer;
    iCred : integer;
    sCve  : String;
begin
  if Objeto.B_FOUND.AsString = 'V' then
  Begin
    if not ( MessageDlg( '¿Está seguro de asignar la clave de observación?', mtConfirmation, [mbYes, mbNo], 0 ) = mrYes ) then
    Begin
      Exit;
    End;
    //
    sCve := Objeto.ClaveObserva.CVE_REFERENCIA.AsString;
    if sCve = '' then
    Begin
      ShowMessage('Seleccione una clave de observación');
      Exit;
    End;
    //
    For i := 0 to sagDATOS.RowCount - 1 do
    Begin
      iCred := StrToIntDef( sagDATOS.Cells[coPosCred, i ], 0 );
      if not Objeto.stpCveObservacionBnc( 1, iCred, sCve, Objeto.CVE_APLICACION.AsString ) then
      Begin
        if not ( MessageDlg( '¿Desea continuar?', mtConfirmation, [mbYes, mbNo], 0 ) = mrYes ) then
        Begin
          Break;
        End;
        //
      End;
    End;
    //
    BuscaDatos;
    //
  End;
  //
End;

procedure TWCrBcClaveObs.btCANCELAClick(Sender: TObject);
var i     : integer;
    iCred : integer;
begin
  if Objeto.B_FOUND.AsString = 'V' then
  Begin
    if not ( MessageDlg( '¿Está seguro de eliminar la clave de observación?', mtConfirmation, [mbYes, mbNo], 0 ) = mrYes ) then
    Begin
      Exit;
    End;
    //
    For i := 0 to sagDATOS.RowCount - 1 do
    Begin
      iCred := StrToIntDef( sagDATOS.Cells[coPosCred, i ], 0 );
      if not Objeto.stpCveObservacionBnc( 2, iCred, '', Objeto.CVE_APLICACION.AsString ) then
      Begin
        if not ( MessageDlg( '¿Desea continuar?', mtConfirmation, [mbYes, mbNo], 0 ) = mrYes ) then
        Begin
          Break;
        End;
        //
      End;
    End;
    //
    BuscaDatos;
    //
  End;
  //
End;


end.
