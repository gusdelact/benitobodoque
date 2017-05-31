// Sistema         :
// Fecha de Inicio : 02/04/2012
// Función forma   :
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Fernando Jimenez Rivera
// Fecha           : ABRIL 2012
// Comentarios     :
Unit IntCrPPP;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,                                           
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, Grids,

IntParamCre, IntGenCre,
IntCrMovPPP, IntCrOperaci, IntCrCredito, IntCrCto,
IntSGCtrl, IntCrGruCla, InterEdit, Wwdatsrc, Wwkeycb, DBCtrls, IntCtoPanel,

//unidades adicionales
IntCrConPPP;

Const
  CoAUTORIZADO = 'AU';
  CoCANCELADO = 'CA';
  CoNOAUTORIZADO = 'NA';
  CoVERDAD ='V';
  coFALSO = 'F' ;
  CoPREDETERMINADO=CoVERDAD ;


Type
 TCrPPP= class;

  TWCrPPP=Class(TForm)
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
    icpCONTRATO: TInterCtoPanel;
    Label3: TLabel;
    edID_CESION: TEdit;
    btID_CESION: TBitBtn;
    edCESION: TEdit;
    ilCesion: TInterLinkit;
    gbCantidades: TGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edSituacion: TEdit;
    Label2: TLabel;
    bbConsMov: TBitBtn;
    iedInicialPPO: TInterEdit;
    iedIncrementosPPO: TInterEdit;
    iedDecrementosPPO: TInterEdit;
    iedActualPPO: TInterEdit;
    iedInicialIVA: TInterEdit;
    iedIncrementosIVA: TInterEdit;
    iedDecrementosIVA: TInterEdit;
    iedActualIVA: TInterEdit;
    iedInicialTOT: TInterEdit;
    iedIncrementosTOT: TInterEdit;
    iedDecrementosTOT: TInterEdit;
    iedActualTOT: TInterEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btID_CESIONClick(Sender: TObject);
    procedure ilCesionEjecuta(Sender: TObject);
    procedure bbConsMovClick(Sender: TObject);
    private
      procedure CalculaTotal ;
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrPPP;
end;
 TCrPPP= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ID_CREDITO        :TInterCampo;

        ParamCre     : TParamCre;
        ContratoCre  : TCrCto;
        Credito      : TCrCredito;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;


implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrPPP.Create( AOwner : TComponent );
begin Inherited;

  ID_CREDITO := CreaCampo( 'ID_CREDITO', ftInteger, tsNinguno, tsNinguno, False );

  {$WARNINGS OFF}
  Credito := TCrCredito.Create(Self);
  {$WARNINGS ON}
  Credito.MasterSource:=Self;

  {$WARNINGS OFF}
  ContratoCre := TCrCto.Create(Self);
  {$WARNINGS ON}
  ContratoCre.MasterSource:=Self;

  UseQuery  := False;
  HelpFile  := 'IntCrPPP.Hlp';
  ShowMenuReporte:=True;

end;

Destructor TCrPPP.Destroy;
begin
  If Credito <> Nil then
     Credito.Free ;
  If ContratoCre<>Nil then
     ContratoCre.Free ;  

  inherited;
end;


function TCrPPP.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrPPP;
begin
   W:=TWCrPPP.Create(Self);
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


Function TCrPPP.InternalBusca:Boolean;
begin InternalBusca := False;

end;

function TCrPPP.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA de NINGUNO**************************)
(*                                                                                       *)
(*  FORMA DE NINGUNO                                                                     *)
(*                                                                                       *)
(***********************************************FORMA de NINGUNO**************************)

procedure TWCrPPP.FormShow(Sender: TObject);
begin
    lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
    lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
    lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
    lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

    Objeto.ID_CREDITO.Control:=edID_CESION;
    Objeto.Credito.ID_CREDITO.Control:= edID_CESION ;
    Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := edCESION;
    Objeto.Credito.GetParams(Objeto);
    edCESION.Hint := Objeto.Credito.ContratoCre.Contrato.TITNombre.AsString;
    edCESION.ShowHint := True;

end;

procedure TWCrPPP.FormDestroy(Sender: TObject);
begin
    Objeto.ID_CREDITO.Control:=nil;

    Objeto.Credito.ID_CREDITO.Control:=nil ;
    Objeto.Credito.ContratoCre.Contrato.TITNombre.Control:=nil;
end;

procedure TWCrPPP.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrPPP.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrPPP.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrPPP.btID_CESIONClick(Sender: TObject);
begin
if Objeto.ValidaAccesoEsp('TCRPPP_CONSDISP',True,True) then  // JFOF 13/03/2013 FUNCION DE SEGURIDADES
  begin
     Objeto.Credito.FilterString:= ' ID_CREDITO IN (SELECT ID_CREDITO FROM CR_PPO_PREMIO) ' ;
     Objeto.Credito.BuscaWhereString := Objeto.Credito.FilterString ;
     Objeto.Credito.ShowAll := True;
     if Objeto.Credito.Busca then begin
          icpCONTRATO.Frame := Objeto.Credito.ContratoCre.Contrato;
          icpCONTRATO.RefrescaInfo; //REFRESCA LA INFORMACIÓN DEL CREDITO
          CalculaTotal;
          InterForma1.NextTab(edID_CESION);
     End;
  end;
end;

procedure TWCrPPP.CalculaTotal ;
var
    Inicial, InicialPPO, InicialIVA : Real ;
    Incrementos, IncremPPO, IncremIVA: Real ;
    Devoluciones, DevolPPO, DevolIVA: Real ;
    sSQL: String ;
    Id: Integer ;
    qyQuery : TQuery;
begin
  sSQL:= 'SELECT MIN(ID_TRANSACCION) AS TRANS_INI FROM CR_TRANSACCION '+
         'WHERE ID_CREDITO = '+Objeto.Credito.ID_CREDITO.AsString+' '+
         'AND (ID_TRANS_CANCELA IS NULL AND SIT_TRANSACCION = ''AC'') '+
         'AND CVE_OPERACION = ''PPPINC'' ';

  GetSQLInt(sSql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'TRANS_INI', id, False) ;

  sSQL := 'SELECT SUM(CASE WHEN CDT.CVE_CONCEPTO = ''IMPBRU'' THEN IMP_CONCEPTO ELSE 0 END) IMPBRU, ' +
          '       SUM(CASE WHEN CDT.CVE_CONCEPTO = ''IMPIVA'' THEN IMP_CONCEPTO ELSE 0 END) IMPIVA, ' +
          '       SUM(IMP_CONCEPTO) IMPTOT ' +
          'FROM CR_TRANSACCION CT, CR_DET_TRANSAC CDT ' +
          'WHERE CDT.ID_TRANSACCION = CT.ID_TRANSACCION ' +
          '  AND CT.ID_TRANSACCION = '+IntToStr(Id);

//  GetSQLFloat(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'IMP_NETO', Inicial, True) ;
  qyQuery := GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
  try
    If qyQuery <> Nil Then
    Begin
         Inicial    := qyQuery.FieldByName('IMPTOT').Asfloat;
         InicialPPO := qyQuery.FieldByName('IMPBRU').Asfloat;
         InicialIVA := qyQuery.FieldByName('IMPIVA').Asfloat;
    End;
  finally
    qyQuery.Free;
  end;

  If Inicial <0 then
  Begin
    inicial := 0;
    InicialPPO := 0;
    InicialIVA := 0;
  end;
  iedInicialPPO.Text := FloatToStr(InicialPPO) ;
  iedInicialIVA.Text := FloatToStr(InicialIVA) ;
  iedInicialTOT.Text := FloatToStr(Inicial) ;
  // <RABA AGO 2013> QUITAR EL -2 Y DEJAR NULL
  sSQL := 'SELECT PKGCRPPO.SaldoPPPaFecha('+Objeto.Credito.ID_CREDITO.AsString+', TO_DATE('''+DateToStr(Objeto.Apli.DameFechaEmpresa)+''', ''DD/MM/YYYY''), ''IMPTOT'', ''I'', NULL, ''V'') AS IMPTOT, ' +
          '       PKGCRPPO.SaldoPPPaFecha('+Objeto.Credito.ID_CREDITO.AsString+', TO_DATE('''+DateToStr(Objeto.Apli.DameFechaEmpresa)+''', ''DD/MM/YYYY''), ''IMPBRU'', ''I'', NULL, ''V'') AS IMPBRU, ' +
          '	  PKGCRPPO.SaldoPPPaFecha('+Objeto.Credito.ID_CREDITO.AsString+', TO_DATE('''+DateToStr(Objeto.Apli.DameFechaEmpresa)+''', ''DD/MM/YYYY''), ''IMPIVA'', ''I'', NULL, ''V'') AS IMPIVA ' +
          'FROM DUAL ';

//  GetSQLFloat(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'IMPORTE', Incrementos, True) ;
  qyQuery := GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
  try
    If qyQuery <> Nil Then
    Begin
         Incrementos := qyQuery.FieldByName('IMPTOT').Asfloat;
         IncremPPO   := qyQuery.FieldByName('IMPBRU').Asfloat;
         IncremIVA   := qyQuery.FieldByName('IMPIVA').Asfloat;
    End;
  finally
    qyQuery.Free;
  end;

  If Incrementos - inicial < 0 then
  begin
     iedIncrementosTOT.Text := '0';
     iedIncrementosPPO.Text := '0';
     iedIncrementosIVA.Text := '0';
  end
  else
  begin
     iedIncrementosTOT.Text := FloatToStr(Incrementos-Inicial) ;  // descontar el inicial
     iedIncrementosPPO.Text := FloatToStr(IncremPPO-InicialPPO) ;  // descontar el inicial
     iedIncrementosIVA.Text := FloatToStr(IncremIVA-InicialIVA) ;  // descontar el inicial
  end;
  // <RABA AGO 2013> QUITAR EL -2 Y DEJAR NULL
  sSQL := 'SELECT PKGCRPPO.SaldoPPPaFecha('+Objeto.Credito.ID_CREDITO.AsString+', TO_DATE('''+DateToStr(Objeto.Apli.DameFechaEmpresa)+''', ''DD/MM/YYYY''), ''IMPTOT'', ''D'', NULL, ''V'') AS IMPTOT, ' +
          '       PKGCRPPO.SaldoPPPaFecha('+Objeto.Credito.ID_CREDITO.AsString+', TO_DATE('''+DateToStr(Objeto.Apli.DameFechaEmpresa)+''', ''DD/MM/YYYY''), ''IMPBRU'', ''D'', NULL, ''V'') AS IMPBRU, ' +
          '	  PKGCRPPO.SaldoPPPaFecha('+Objeto.Credito.ID_CREDITO.AsString+', TO_DATE('''+DateToStr(Objeto.Apli.DameFechaEmpresa)+''', ''DD/MM/YYYY''), ''IMPIVA'', ''D'', NULL, ''V'') AS IMPIVA ' +
          'FROM DUAL ';

  qyQuery := GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
  try
    If qyQuery <> Nil Then
    Begin
         Devoluciones := qyQuery.FieldByName('IMPTOT').Asfloat;
         DevolPPO   := qyQuery.FieldByName('IMPBRU').Asfloat;
         DevolIVA   := qyQuery.FieldByName('IMPIVA').Asfloat;
    End;
  finally
    qyQuery.Free;
  end;

  iedDecrementosTOT.Text := FloatToStr(Devoluciones) ;
  iedDecrementosPPO.Text := FloatToStr(DevolPPO) ;
  iedDecrementosIVA.Text := FloatToStr(DevolIVA) ;

  iedActualTOT.Text := FloatToStr(Incrementos-Devoluciones) ;
  iedActualPPO.Text := FloatToStr(IncremPPO-DevolPPO) ;
  iedActualIVA.Text := FloatToStr(IncremIVA-DevolIVA) ;
end ;

procedure TWCrPPP.ilCesionEjecuta(Sender: TObject);
begin
   if Objeto.Credito.FindKey([ilCesion.Buffer]) then
      begin
        icpCONTRATO.Frame := Objeto.Credito.ContratoCre.Contrato;
        icpCONTRATO.RefrescaInfo; //REFRESCA LA INFORMACIÓN DEL CREDITO
        CalculaTotal;
        InterForma1.NextTab(edCESION);
      end ;
end;

procedure TWCrPPP.bbConsMovClick(Sender: TObject);
var CrConPPP  : TCrConPPP;
begin
if Objeto.ValidaAccesoEsp('TCRPPP_CONSMOVS',True,True) then // JFOF 13/03/2013 FUNCION DE SEGURIDADES
  begin
    if Objeto.Credito.ID_CREDITO.AsInteger > 0 then
    begin
      CrConPPP :=  TCrConPPP.Create(Self);
      try
        CrConPPP.Apli        := Objeto.Apli;
        CrConPPP.ParamCre    := Objeto.ParamCre;
        CrConPPP.vgIdCredito := Objeto.Credito.ID_CREDITO.AsInteger;
        CrConPPP.Catalogo;
      finally
        CrConPPP.Free;
      end;
    end
    else
      ShowMessage('Debe seleccionar una disposición...');
  end;
end;

end.
