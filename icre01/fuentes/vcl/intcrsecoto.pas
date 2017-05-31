// Sistema         : Clase de CrSeCoTo
// Fecha de Inicio : 30/07/2003
// Función forma   : Clase de CrSeCoTo
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrSeCoTo;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntSGCtrl, IntMensRe,Ungene,


  //Unidades Adicionales
  IntParamCre, IntGenCre, IntConTransa, IntCtoHeader, IntCrCto,
  Menus,
  IntCrsecoco;

Type
 TCrSeCoTo= class;

  TWCrSeCoTo=Class(TForm)
    InterForma1             : TInterForma;
    btCANCELA: TBitBtn;
    btIDENTIFICA: TBitBtn;
    Merrores: TMemo;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    rgSITUACION: TRadioGroup;
    btBUSCA: TBitBtn;
    edF_FINAL: TEdit;
    dtF_FINAL: TInterDateTimePicker;
    dtF_INICIAL: TInterDateTimePicker;
    edF_INICIAL: TEdit;
    Label17: TLabel;
    Label5: TLabel;
    sgcDATOS: TSGCtrl;
    Label4: TLabel;
    edREFER_EXTERNA: TEdit;
    Edit1: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    btREPORTE: TBitBtn;
    Edit8: TEdit;
    edTIT_FECHA: TEdit;
    edTIT_MODO_PAGO: TEdit;
    pmReactivar: TPopupMenu;
    Reactivar1: TMenuItem;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure edF_INICIALExit(Sender: TObject);
    procedure edF_FINALExit(Sender: TObject);
    Procedure MuestraDatos;
    procedure btBUSCAClick(Sender: TObject);
    procedure sgcDATOSDblClick(Sender: TObject);
    procedure btIDENTIFICAClick(Sender: TObject);
    procedure sgcDATOSCalcRow(Sendet: TObject; DataSet: TDataSet;
      CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
    procedure btCANCELAClick(Sender: TObject);
    procedure Reactivar1Click(Sender: TObject);
    procedure rgSITUACIONClick(Sender: TObject);
    procedure btREPORTEClick(Sender: TObject);
    private
    { Private declarations }
    vgMoneda : String;
    public
    { Public declarations }
     Objeto : TCrSeCoTo;
end;
 TCrSeCoTo= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        vgChequera      : Integer;
        vgMyList        : TStrings;

        SITUACION                : TInterCampo;
        F_INICIAL                : TInterCampo;
        F_FINAL                  : TInterCampo;

        //Clases Adicionales
        ParamCre                 : TParamCre;
        //CrContrato               : TCrCto;
        Contrato                 : TCtrlCto;
        ConTransa                : TConTransa;


        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        Function    CadenaSql : String;
        Procedure   IdentificDep(pIdGpoPago, pReferExterna, pRegistro,
                                 pIdFolioDv, pIdCtoConcen, pMetodo : String ; var vsError :  String);
        Function    ObtReferenciado(pChequera : Integer; var vlError: String): Integer;
        Procedure   CancelaSegCob(pIdGpoPago, pRegistro : String; pMetodo : Integer;
                                  var vsError :  String);
        function GrupodeSeguimiento : String;
      published
      end;



implementation
//Uses RepMon;

const
   CoPosChq = 12;
   coPosSel = 8;

{$R *.DFM}


constructor TCrSeCoTo.Create( AOwner : TComponent );
begin Inherited;
      SITUACION :=CreaCampo('SITUACION',ftString,tsNinguno,tsNinguno,False);
      With SITUACION do
      begin Size:=2;
            UseCombo:=True;
            ComboLista.Add('0'); ComboDatos.Add(CSIT_NI);
            ComboLista.Add('1'); ComboDatos.Add(CSIT_ID);
            ComboLista.Add('2'); ComboDatos.Add(CSIT_CA);
            ComboLista.Add('3'); ComboDatos.Add(CSIT_TO);
      end;
                SITUACION.Caption:='Situación';
                SITUACION.Parametro:='SITUACION';
      F_INICIAL :=CreaCampo('F_INICIAL',ftDate,tsNinguno,tsNinguno,False);
                F_INICIAL.Caption:='Fecha Inicial';
                F_INICIAL.Parametro:='F_INICIAL';
      F_FINAL :=CreaCampo('F_FINAL',ftDate,tsNinguno,tsNinguno,False);
                F_FINAL.Caption:='Fecha Final';
                F_FINAL.Parametro:='F_FINAL';

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrSeCoTo.Hlp';
      ShowMenuReporte:=True;

      //CrContrato := TCrCto.Create(self);
      //CrContrato.MasterSource := Self;

      ConTransa := TConTransa.Create( Self );
      ConTransa.MasterSource  := Self;

      Contrato  := TCtrlCto.Create( Self );
      Contrato.MasterSource   := Self;

      vgMyList := TStringList.Create;
end;

Destructor TCrSeCoTo.Destroy;
begin
     if ConTransa <> nil then
        ConTransa.free;
     //end if

     if Contrato <> nil then
        Contrato.Free;

     vgMyList.Free;

     inherited;
end;


function TCrSeCoTo.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrSeCoTo;
begin
   W:=TWCrSeCoTo.Create(Self);
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


Function TCrSeCoTo.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrSeCoTo.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

function TCrSeCoTo.GrupodeSeguimiento : string;
Var vlSql, vlCVE_GPO_SEGUIM : String;
Begin
   vlSql:= ' SELECT CVE_GPO_SEGUIM ' +
           ' FROM CR_PERFIL_USUAR ' +
           ' WHERE CVE_GPO_ACCESO = ' + IntToStr(Apli.CvePerfil) +
           '  AND CVE_TIPO_USUARIO = ' + SQLStr(CPERFIL_CONSU);
   GetSQLStr(vlsql, Apli.DataBaseName, Apli.SessionName, 'CVE_GPO_SEGUIM', vlCVE_GPO_SEGUIM, False);
   Result := vlCVE_GPO_SEGUIM;
End;

Function TCrSeCoTo.CadenaSql : String;
var vlSql     : String;
    vlSqlSit  : String;
Begin
   SITUACION.GetFromControl;
   F_INICIAL.GetFromControl;
   F_FINAL.GetFromControl;

vlSqlSit := '';

   if SITUACION.AsString <> CSIT_TO then
   begin
      if SITUACION.AsString = CSIT_ID then
         vlSqlSit := 'AND  B.SIT_SEGUIMIENTO = ' + SQLStr( CSIT_ID )
      else if SITUACION.AsString = CSIT_NI then
         vlSqlSit := 'AND  B.SIT_SEGUIMIENTO = ' + SQLStr( CSIT_NI )
      else if SITUACION.AsString = CSIT_CA then
         vlSqlSit := 'AND  B.SIT_SEGUIMIENTO IN ( ' + SQLStr( CSIT_CA ) + ',' +
                                                      SQLStr( CSIT_CI ) + ')';
   end;

   vlSql  := ' SELECT ''  '' SEL,  ' + coCRLF +
             '       B.F_COBRANZA, ' + coCRLF +
             '       B.CVE_SEGUIMIENTO, '  + coCRLF +
             '       B.ID_GRUPO_PAGO, '    + coCRLF +
             '       S.DESC_SEGUIMIENTO, ' + coCRLF +
             '       S.CVE_OPERACION_DV, ' + COCRLF + // SATV4766
             '       SUM( B.IMP_TOTAL ) AS SUM_IMP_TOTAL,  ' + coCRLF +
             '       TO_NUMBER(B.CHEQUERA) AS CHEQUERA, '   + coCRLF +
             '       PKGCRCOMUN.STPOBTENSDOCHQRA( B.CHEQUERA ) SALDO_CHEQ, ' + coCRLF +
             '       B.ID_TITULAR, '              + coCRLF +
             '       PA.NOMBRE AS ACREDITADO, '   + coCRLF +
             '       PR.NOMBRE AS PROMOTOR, '     + coCRLF +
             '       B.SIT_SEGUIMIENTO,' + coCRLF +
             '       B.CVE_MONEDA||'' - ''|| B.DESC_MONEDA  MONEDA ' + coCRLF +
             'FROM   CR_SEGUIMIENTO S, ' + coCRLF +
             '       ( ' + coCRLF +
             '        SELECT B.CVE_SEGUIMIENTO, ' + coCRLF +
             '               B.F_COBRANZA, '      + coCRLF +
             '               B.ID_GRUPO_PAGO, '   + coCRLF +
             '               B.SIT_SEGUIMIENTO, ' + coCRLF +
             '               B.IMP_TOTAL, '       + coCRLF +
             '               PKGCRPERIODO.STPObtChqCte( CTTO.ID_TITULAR, '        + coCRLF +
             '                                          NVL( CS.CVE_EMISOR_NAFIN, ''0'' ),  ' + coCRLF +
             '                                          CR.ID_CREDITO, '          + coCRLF +
             '                                          ''AC'', ''AD'', ''AB'' '  + coCRLF +
             '                                        ) CHEQUERA, '               + coCRLF +
             '               CTTO.ID_TITULAR, '      + coCRLF +
             '               CTTO.ID_PERS_ASOCIAD,'  + coCRLF +
             '               CTTO.CVE_MONEDA,     '  + coCRLF +
             '               M.DESC_MONEDA        '  + coCRLF +
             '        FROM   CR_BIT_SEGUIMIENTO B, ' + coCRLF +
             '               CR_CREDITO  CR, '       + coCRLF +
             '               CR_CESION   CS, '       + coCRLF +
             '               CR_CONTRATO L, '        + coCRLF +
             '               CONTRATO    CTTO,'      + coCRLF +
             '               MONEDA      M,   '      + coCRLF +
             '               CR_PRODUCTO PRO  '      + coCRLF +
             '        WHERE  B.F_COBRANZA     BETWEEN ' + SQLFecha(F_INICIAL.AsDateTime) + coCRLF +
             '                                    AND ' + SQLFecha(F_FINAL.AsDateTime)   + coCRLF +
             '          '  + vlSqlSit + coCRLF +
             '          AND  CTTO.ID_EMPRESA    = '+IntToStr(Apli.IdEmpresa) + coCRLF + // LOLS 08 SEP 2005
             '          AND  CR.ID_CREDITO      = B.ID_CREDITO '         + coCRLF +
             '          AND  CS.ID_CESION(+)    = CR.ID_CREDITO '        + coCRLF +
             '          AND  L.ID_CONTRATO      = CR.ID_CONTRATO '       + coCRLF +
             '          AND  L.FOL_CONTRATO     = CR.FOL_CONTRATO '      + coCRLF +
             '          AND  CTTO.ID_CONTRATO   = L.ID_CONTRATO '        + coCRLF +
             '          AND  CTTO.CVE_MONEDA    = M.CVE_MONEDA  '        + coCRLF +
             '          AND  L.CVE_PRODUCTO_CRE = PRO.CVE_PRODUCTO_CRE ' + coCRLF +
             '          AND  PRO.CVE_PRODUCTO_GPO NOT IN (''AGRONE'',''VIVPTE'',''VIVSHF'',''VVENDA'')   '  + coCRLF +
             '       ) B, '         + coCRLF +
             '       PERSONA PA, '  + coCRLF +
             '       PERSONA PR '   + coCRLF +
             'WHERE  B.CVE_SEGUIMIENTO = S.CVE_SEGUIMIENTO ' + coCRLF +
             '  AND  S.CVE_SEGUIMIENTO IN ( SELECT CVE_SEGUIMIENTO FROM CR_GPO_SEGUIMIENTO WHERE CVE_GPO_SEGUIM = ' + SQLStr(GrupodeSeguimiento) + ')' + coCRLF + //SATV4766
             '  AND  PA.ID_PERSONA     = B.ID_TITULAR '      + coCRLF +
             '  AND  PR.ID_PERSONA     = B.ID_PERS_ASOCIAD ' + coCRLF +
             'GROUP  BY  B.F_COBRANZA,       B.CVE_SEGUIMIENTO, B.ID_GRUPO_PAGO,        S.DESC_SEGUIMIENTO,' + coCRLF +
             '           S.CVE_OPERACION_DV, B.CHEQUERA,        B.ID_TITULAR,           PA.NOMBRE,         ' + coCRLF +
             '           PR.NOMBRE,          B.SIT_SEGUIMIENTO, B.CVE_MONEDA,           B.DESC_MONEDA      ' + coCRLF +
             'ORDER BY   B.CVE_MONEDA,       B.F_COBRANZA,       B.CVE_SEGUIMIENTO,     SUM_IMP_TOTAL';
   CadenaSql := vlSql;
end;

Function  TCrSeCoTo.ObtReferenciado(pChequera : Integer; var vlError: String): Integer;
var  STPObtRefer  : TStoredProc;
     vlImporte    : Integer;
Begin
     vlImporte := 0;
     STPObtRefer := TStoredProc.Create(Nil);
     try
        with STPObtRefer do
        begin
          DatabaseName:= Apli.DatabaseName;
          SessionName:= Apli.SessionName;
          StoredProcName:='PKGCRCREDITO.STPOBTSDOREF';
          // Se crean los parametros del StoreProcedure
          Params.Clear;
          Params.CreateParam(ftFloat,'PEIDCTOLIQ',ptInput);
          Params.CreateParam(ftFloat,'PEFECHADEP',ptInput);
          Params.CreateParam(ftInteger,'PSIMPORTE',ptOutput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
          //
          ParamByName('peIdCtoLiq').AsInteger := pChequera;
          ParamByName('peFechaDep').AsDate := Apli.DameFechaEmpresa;
          ExecProc;

          if (ParamByName('PSResultado').AsInteger = 0) then
          begin
             vlImporte:= ParamByName('psImporte').AsInteger;
          end
          else
          Begin
             vlError := (ParamByName('psTxResultado').AsString);
             ShowMessage('PROBLEMAS AL OBTENER LA CHEQUERA: ' +
             IntToStr(ParamByName('psRESULTADO').AsInteger));
             EXECUTE_MENSAJE(vlError);
          end;
        end;
     finally
          STPObtRefer.Free;
     end;
     ObtReferenciado := vlImporte;
End;


Procedure TCrSeCoTo.IdentificDep(pIdGpoPago, pReferExterna, pRegistro,
                                 pIdFolioDv, pIdCtoConcen, pMetodo : String ; var vsError : String);
var  STPIdentifDep  : TStoredProc;
Begin
     STPIdentifDep := TStoredProc.Create(Nil);
     try
        with STPIdentifDep do
        begin
          DatabaseName:= Apli.DatabaseName;
          SessionName:= Apli.SessionName;
          StoredProcName:='PKGCRCREDITO.STPIDENTIFICDEP';
          // Se crean los parametros del StoreProcedure
          Params.Clear;
          Params.CreateParam(ftFloat,'PEIDGRUPOPAGO',ptInput);
          Params.CreateParam(ftString,'PEREFEXTERNA',ptInput);
          Params.CreateParam(ftString,'PECVEUSUAUT',ptInput);
          Params.CreateParam(ftFloat,'PEIDFOLIODV',ptInput);
          Params.CreateParam(ftFloat,'PEIDCTOCONCEN',ptInput);
          Params.CreateParam(ftFloat,'PEMETODO',ptInput);
          Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);

          //
          ParamByName('PEIDGRUPOPAGO').AsString := pIdGpoPago;
          ParamByName('PEREFEXTERNA').AsString := pReferExterna;
          ParamByName('PECVEUSUAUT').AsString := Apli.Usuario;
          ParamByName('PEIDFOLIODV').AsString := pIdFolioDv;
          ParamByName('PEIDCTOCONCEN').AsString := pIdCtoConcen;
          ParamByName('PEMETODO').AsString := pMetodo;
          ParamByName('PEBCOMMIT').AsString := CVERDAD;
          ExecProc;

          if (ParamByName('PSResultado').AsInteger <> 0) then
          Begin
             vsError := ' PROBLEMAS AL IDENTIFICAR EL REGISTRO No. ' +
                        pRegistro + ' ERROR No. ' + IntToStr(ParamByName('psRESULTADO').AsInteger);
             vsError := vsError + ParamByName('psTxResultado').AsString;
             EXECUTE_MENSAJE(vsError);
          end;
        end;
     finally
          STPIdentifDep.Free;
     end;
End;

Procedure TCrSeCoTo.CancelaSegCob(pIdGpoPago, pRegistro : String; pMetodo : Integer;
                                  var vsError :  String);
var  STPCancelaSegCob : TStoredProc;
Begin
     STPCancelaSegCob := TStoredProc.Create(Nil);
     try
        with STPCancelaSegCob do
        begin
          DatabaseName:= Apli.DatabaseName;
          SessionName:= Apli.SessionName;
          StoredProcName:='PKGCRCREDITO.STPCANCSEGCOB';
          // Se crean los parametros del StoreProcedure
          Params.Clear;
          Params.CreateParam(ftFloat,'PEIDGRUPOPAGO',ptInput);
          Params.CreateParam(ftString,'PECVEUSUCANC',ptInput);
          Params.CreateParam(ftInteger,'PEMETODO',ptInput);
          Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
          //
          ParamByName('PEIDGRUPOPAGO').AsString := pIdGpoPago;
          ParamByName('PECVEUSUCANC').AsString := Apli.Usuario;
          ParamByName('PEMETODO').AsInteger := pMetodo;
          ParamByName('PEBCOMMIT').AsString := cVERDAD;
          ExecProc;

          if (ParamByName('PSResultado').AsInteger <> 0) then
          Begin
             vsError := ' PROBLEMAS AL REALIZAR LA REVERSA REGISTRO No. ' +
                        pRegistro + ' ERROR No. ' + IntToStr(ParamByName('psRESULTADO').AsInteger);
             vsError := vsError + ParamByName('psTxResultado').AsString;
             EXECUTE_MENSAJE(vsError);
          end;
        end;
     finally
          STPCancelaSegCob.Free;
     end;
End;
(***********************************************FORMA CrSeCoTo********************)
(*                                                                              *)
(*  FORMA DE CrSeCoTo                                                            *)
(*                                                                              *)
(***********************************************FORMA CrSeCoTo********************)
Procedure TWCrSeCoTo.MuestraDatos;
var vlQry : TQuery;
begin
     Objeto.vgMyList.Clear;
     Objeto.vgChequera:= 0;
     vgMoneda := '';
     vlQry := GetSQLQuery(Objeto.CadenaSql,
                       Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
     try
        if vlQry <> nil then
        Begin
        //Datos que no se muestran
            vlQry.FieldByName('CVE_SEGUIMIENTO').Visible := False;
            vlQry.FieldByName('CVE_OPERACION_DV').Visible := False; // SATV4766
            vlQry.FieldByName('ID_TITULAR').Visible := False;
            vlQry.FieldByName('ID_GRUPO_PAGO').Visible := False;
            vlQry.FieldByName('MONEDA').Visible := False;

            vlQry.FieldByName('SEL').DisplayWidth := 3;
            vlQry.FieldByName('F_COBRANZA').DisplayWidth := 11;
            vlQry.FieldByName('DESC_SEGUIMIENTO').DisplayWidth := 17;
            vlQry.FieldByName('SUM_IMP_TOTAL').DisplayWidth := 14;
            vlQry.FieldByName('CHEQUERA').DisplayWidth := 10;
            vlQry.FieldByName('SALDO_CHEQ').DisplayWidth := 14;
            vlQry.FieldByName('ACREDITADO').DisplayWidth := 25;
            vlQry.FieldByName('PROMOTOR').DisplayWidth := 28;
            vlQry.FieldByName('SIT_SEGUIMIENTO').DisplayWidth := 3;

            TNumericField(vlQry.FieldByName('SUM_IMP_TOTAL')).DisplayFormat := '###,###,###,###,###,###,##0.00';
            TNumericField(vlQry.FieldByName('SALDO_CHEQ')).DisplayFormat := '###,###,###,###,###,###,##0.00';

            sgcDATOS.AddQry( vlQry, True,True,-1,-1,-1,False); // AGREGAR QUERY
            sgcDATOS.ColumnByName('SEL').IsCheck := True;//DEFINIR EL CAMPO AUT DEL QUERY COMO CHECKBOX
        end
        else
        Begin
           sgcDATOS.Clear('NO EXISTEN DATOS'#30'>C');
        end;

        finally
        if vlQry <> nil then
           vlQry.free;
        //end if
        end;
end;

procedure TWCrSeCoTo.FormShow(Sender: TObject);
begin
      //Pinta los datos del panel inferior
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.SITUACION.Control:=rgSITUACION;
      Objeto.F_INICIAL.Control:=edF_INICIAL;
      Objeto.F_FINAL.Control:=edF_FINAL;
end;

procedure TWCrSeCoTo.FormDestroy(Sender: TObject);
begin
      Objeto.SITUACION.Control:=nil;
      Objeto.F_INICIAL.Control:=nil;
      Objeto.F_FINAL.Control:=nil;
   //Objeto
end;

procedure TWCrSeCoTo.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrSeCoTo.InterForma1DespuesShow(Sender: TObject);
begin
   rgSITUACION.ItemIndex := 0;
   Objeto.F_INICIAL.AsDateTime := Objeto.Apli.DameFechaEmpresa;
   Objeto.F_FINAL.AsDateTime := Objeto.Apli.DameFechaEmpresa;
   MuestraDatos;
end;

procedure TWCrSeCoTo.edF_INICIALExit(Sender: TObject);
begin
     Objeto.F_INICIAL.GetFromControl;
     Objeto.F_FINAL.GetFromControl;
     if (Objeto.F_FINAL.AsDateTime < Objeto.F_INICIAL.AsDateTime)  then
     Begin
        ShowMessage('La fecha de pago inicial no debe de ser mayor a la fecha de pago final');
        edF_INICIAL.SetFocus;
     end
end;

procedure TWCrSeCoTo.edF_FINALExit(Sender: TObject);
Begin
     Objeto.F_INICIAL.GetFromControl;
     Objeto.F_FINAL.GetFromControl;
     if (Objeto.F_FINAL.AsDateTime < Objeto.F_INICIAL.AsDateTime)  then
     Begin
        ShowMessage('La fecha de pago inicial no debe de ser mayor a la fecha de pago final');
        edF_FINAL.SetFocus;
     end
end;

procedure TWCrSeCoTo.btBUSCAClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRSECOTO_BUSCA',True,True) then
   begin
      MuestraDatos;
   end;
end;

procedure TWCrSeCoTo.sgcDATOSDblClick(Sender: TObject);
var Y : integer;
    vlContrato : String;
    vlChequera : String;
    Procedure MarcaReg;
    Begin
       if sgcDATOS.CellStr['SEL',Y] = 'SI' + #30 + '>C' then
          sgcDATOS.CellStr['SEL',Y]:= ''
       else
          sgcDATOS.CellStr['SEL',Y]:= 'SI' + #30 + '>C';
    end;

Begin
  with Objeto, sgcDATOS do
  Begin
      y := SG.Row;
      if SG.Selection.Left = coPosChq then         // Muestra los movtos sobre la chequera
      Begin
            //Llama a la clase de Depositos a la vista
         vlContrato := CellStr[ 'CHEQUERA', Y ];
         if ( vlContrato <> '' ) and ( Contrato.FindKey( [ vlContrato ] )  ) then
         begin
           ConTransa.Contrato := Contrato;
           ConTransa.Catalogo;
         end;
      end
           // Marca Registro a Identificar
      else if SG.Selection.Left = coPosSel then
      Begin
         vlChequera := CellStr['CHEQUERA',Y];
         if (vlChequera <> '') then
             MarcaReg
         else ShowMessage('Chequera vacia')
      end;
  end;
end;


procedure TWCrSeCoTo.btIDENTIFICAClick(Sender: TObject);
var nRow        : Integer;
    vlIdGpoPago : String;
    vlReferExt  : String;
    vlRegistro  : String;
    vlError     : String;
    vlID_TRANSACCION : String;
    vlChqConcentradora : String;
    nCountIde   : Integer;
    nRow_x_Identificar : Integer;
begin
   if Objeto.ValidaAccesoEsp('TCRSECOTO_IDENT',True,True) then
   begin
     vlRegistro := '';
     vlError := '';
     vlReferExt := edREFER_EXTERNA.Text;
     nCountIde := 0;

     if CountSelec(sgcDatos,'SEL') > 0 then
     Begin
       Merrores.Clear;
       if MessageDlg('¿Está seguro de Identificar ' +IntToStr(CountSelec(sgcDatos,'SEL')) + ' registro(s).',
                       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       Begin
        nRow_x_Identificar := 0;
        messageIniFinProceso(MErrores,CINICIO);//envia mensaje de inicio proceso
        For nRow := 0 To sgcDATOS.SG.RowCount - 1 Do    //Barre todos los registros para encontrar los marcados a identificar
           if (sgcDATOS.CellStr['SEL',nRow] = 'SI' + #30 + '>C') then
           Begin      //Identifica el registro
               Inc(nRow_x_Identificar);

               vlRegistro := IntToStr(nRow + 1) + ': < ' + (sgcDATOS.CellStr['DESC_SEGUIMIENTO',nRow]) +
                              ' > : ' + '< ' + (sgcDATOS.CellStr['ACREDITADO',nRow]) + ' > ';
               vlIdGpoPago := sgcDATOS.CellStr['ID_GRUPO_PAGO',nRow];

               // Inicio SATV4766
               If (Trim(sgcDATOS.CellStr['CVE_OPERACION_DV',nRow]) = '') Then
                 Begin
                  If (IndicaFechaRecursos(Objeto.Apli,
                                          nRow_x_Identificar,
                                          Trim(sgcDATOS.CellStr['SUM_IMP_TOTAL',nRow]),
                                          Trim(sgcDATOS.CellStr['DESC_SEGUIMIENTO',nRow]),
                                          Trim(sgcDATOS.CellStr['CHEQUERA',nRow]),
                                          vlID_TRANSACCION,
                                          vlChqConcentradora) = mrYes) Then
                    Objeto.IdentificDep(vlIdGpoPago, vlReferExt, vlRegistro,
                                        vlID_TRANSACCION, vlChqConcentradora ,'2', vlError)
                  Else
                    ShowMessage('Traspaso no realizado. El usuario no identifico el recurso.');
                 End
               Else
                Objeto.IdentificDep(vlIdGpoPago,vlReferExt,vlRegistro,'', '', '1',vlError);
               // Fin SATV4766


               if vlError <> '' then
                  AddLine(MErrores,vlError)
               else nCountIde := nCountIde + 1;
           end;
        //end for
       end;
       AddLine(MErrores,intToStr(nCountIde) + ' Registros identificados' );
       messageIniFinProceso(MErrores,CFINAL);//envia mensaje de Fin proceso
       MuestraDatos;
     end
     else
        ShowMessage('No existen registros para identificar');
   end;     
end;

procedure TWCrSeCoTo.sgcDATOSCalcRow(Sendet: TObject; DataSet: TDataSet;
  CurrRow: Integer; RowCaso: TRowCaso; var ShowRow: Boolean);
var vlError     : String;
    vlIndex     : Integer;
begin
   Objeto.vgChequera := DataSet.FieldByName('CHEQUERA').AsInteger;
   Objeto.vgMyList.Values[InttoStr(Objeto.vgChequera)];
   vlIndex := Objeto.vgMyList.IndexOfName(InttoStr(Objeto.vgChequera));
  {}
    if ( RowCaso = rcRowBegin ) then
    begin
        { Valida un cambio de Moneda }
        if ( vgMoneda <> DataSet.FieldByName('MONEDA').AsString ) then
        begin
          { Inicializa con los nuevos datos del siguiente moneda }
          vgMoneda := DataSet.FieldByName('MONEDA').AsString;
          sgcDATOS.AddTitle('MONEDA: ' + vgMoneda , tcCenter);
        end
    end;
   {}
   //Verifica si es un deposito por Referenciado
   if vlIndex < 0 then
      Objeto.vgMyList.Values[InttoStr(Objeto.vgChequera)] := IntToStr(Objeto.ObtReferenciado(Objeto.vgChequera,vlError));
   //end if

   if Objeto.vgMyList.Values[InttoStr(Objeto.vgChequera)] <> '0' then
   Begin
         // Si es referenciado  e identificado lo pone en color rojo
      if DataSet.FieldByName('SIT_SEGUIMIENTO').AsString = CSIT_ID then
         sgcDATOS.SetFontColor(clRed)
         //Si solo es referenciado lo pone de color azul
      else sgcDATOS.SetFontColor(clBlue);
      //end if
   end;
   if vlError <> '' then AddLine(Merrores,vlError); //end if
end;

procedure TWCrSeCoTo.btCANCELAClick(Sender: TObject);
var vlSit       : String;
    vlIdGpoPago : String;
    nRow        : Integer;
    vlRegistro  : String;
    vlError     : String;
    vlCountCanc : Integer;
    vlMetodo    : Integer;
begin
   if Objeto.ValidaAccesoEsp('TCRSECOTO_REVER',True,True) then
   begin
       vlRegistro := '';
       vlError := '';
       vlCountCanc := 0;
       if CountSelec(sgcDatos,'SEL') > 0 then
       Begin
         Merrores.Clear;
         if MessageDlg('¿Está seguro realizar la reversa de  ' +
                       IntToStr(CountSelec(sgcDatos,'SEL')) + ' seguimiento (s)',
                       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
         Begin
          messageIniFinProceso(MErrores,CINICIO);//envia mensaje de inicio proceso
          For nRow := 0 To sgcDATOS.SG.RowCount - 1 Do    //Barre todos los registros para encontrar los marcadoas a identificar
             if (sgcDATOS.CellStr['SEL',nRow] = 'SI' + #30 + '>C') then
             Begin      //Cancela el registro
                 vlRegistro := IntToStr(nRow + 1) + ': < ' +
                               (sgcDATOS.CellStr['DESC_SEGUIMIENTO',nRow]) +
                                ' > : ' + '< ' + (sgcDATOS.CellStr['ACREDITADO',nRow]) + ' > ';
                 vlIdGpoPago := sgcDATOS.CellStr['ID_GRUPO_PAGO',nRow];
                 vlSit := sgcDATOS.CellStr['SIT_SEGUIMIENTO',nRow];

                 if (vlSit = CSIT_CA) or (vlSit = CSIT_CI) then
                 Begin
                    vlError := 'El registro ' + vlRegistro + ' se encuentra cancelado';
                    Showmessage(vlError);
                 end
                 else
                 Begin
                   vlMetodo := 1;
                   If Trim(sgcDATOS.CellStr['CVE_OPERACION_DV',nRow]) = '' Then
                    vlMetodo := 2;

                           Objeto.CancelaSegCob(vlIdGpoPago,vlRegistro,vlMetodo,vlError);
                    vlCountCanc := vlCountCanc + 1;
                 end;

                 if vlError <> '' then
                    AddLine(MErrores,vlError);
             end;
          //end for
         end;
         AddLine(MErrores,IntToStr(vlCountCanc) + ' Registros reversados');
         messageIniFinProceso(MErrores,CFINAL);//envia mensaje de Fin proceso
         MuestraDatos;
       end
       else
          ShowMessage('No existen registros a reversar');
   end;
end;

procedure TWCrSeCoTo.Reactivar1Click(Sender: TObject);
var vlAfecto      : Boolean;
    nRow          : Integer;
    nCount        : Integer;
    vlSegto       : Integer;
begin
  vlAfecto   := False;
  nRow   := sgcDATOS.SG.Row;
  nCount := 0;
  if CountSelec(sgcDatos,'SEL') > 0 then
  Begin
    if ( ( Objeto.SITUACION.AsString = CSIT_CA)  and
         ( StrToDateTime(sgcDATOS.CellStr['F_COBRANZA', nRow]) = Objeto.Apli.DameFechaEmpresa) ) then
    Begin
        with sgcDatos do
        Begin
           if ( MessageDlg( '¿Desea reactivar esta (s) transacción (es)?',
                              mtConfirmation, mbYesNoCancel, 0 ) = mrYes ) then
           Begin
               if CellStr['SEL',nRow] <> CellStr['ID_SEGUIMIENTO',nRow] THEN
               begin
                  For nRow := 0 To sgcDATOS.SG.RowCount - 1 Do
                  Begin
                     if (sgcDATOS.CellStr['SEL',nRow] = 'SI' + #30 + '>C') then
                     Begin
                        if ( sgcDATOS.CellStr['SIT_SEGUIMIENTO',nRow] <> CSIT_ID ) then
                           sgcDATOS.CellStr['SEL',nRow] := 'SI' + #30 + '>C'
                        else sgcDATOS.CellStr['SEL',nRow]:= '';

                        if (sgcDATOS.CellStr['SEL',nRow] = 'SI' + #30 + '>C') then
                        Begin
                            StpReactivaSegui('',CellStr['ID_GRUPO_PAGO',nRow], '', '',
                                             strToDateTime(sgcDATOS.CellStr['F_COBRANZA', nRow]),
                                             Objeto.Apli, vlSegto );
                            vlAfecto := True;
                            nCount := nCount + 1;
                        end;
                     end;
                  end;//end for
                  if vlAfecto  then
                  Begin
                     ShowMessage('Han sido reactivadas ' + IntToStr(nCount) + ', transacciones');
                     MuestraDatos;
                  end;
               end;
           end;
        end;
    end
    else ShowMessage('Solo se pueden reactivar transacciones canceladas y del mismo día');
  end
  else ShowMessage('No existen datos seleccionados a reactivar');
end;

procedure TWCrSeCoTo.rgSITUACIONClick(Sender: TObject);
begin
  MuestraDatos;
end;

{   vlSql  := ' SELECT ' + #39 + '  ' + #39 + ' SEL, ' +
             '        B.F_COBRANZA,' +
             '        S.CVE_SEGUIMIENTO, ' +
             '        B.ID_GRUPO_PAGO, ' +
             '        S.DESC_SEGUIMIENTO, ' +
             '        SUM(B.IMP_TOTAL) AS SUM_IMP_TOTAL, ' +
             '        CH.CHEQUERA, ' +
             '        CH.SALDO_CHEQ, ' +
             '        C.ID_TITULAR, ' +
             '        PA.NOMBRE AS ACREDITADO, ' +
             '        PR.NOMBRE AS PROMOTOR, ' +
             '        B.SIT_SEGUIMIENTO ' +
             ' FROM CR_BIT_SEGUIMIENTO B, '+
             '      CR_SEGUIMIENTO S, ' +
             '      CR_CREDITO CR, ' +
             '      CR_CONTRATO CC, ' +
             '      CONTRATO C, ' +
             '      PERSONA PA, ' +    //Acreditado
             '      PERSONA PR, ' +     //Promotor
             '      ( SELECT  TO_NUMBER(SUBSTR(PKGCRPERIODO.STPObtChqCte( C.ID_TITULAR, ' +
                                                                        ' NVL(CS.CVE_EMISOR_NAFIN,0), ' +
                                                                        ' NULL,' +
                                                                   #39 + C_ACRED + #39 + ',' +
                                                                   #39 + C_ADMIN + #39 + ',' +
                                                                   #39 + C_ABONO + #39 + '),1, 10)) AS CHEQUERA, ' +
             '                PKGCRCOMUN.STPOBTENSDOCHQRA(TO_NUMBER(SUBSTR( ' +
                                             'PKGCRPERIODO.STPObtChqCte( C.ID_TITULAR, ' +
                                                                       ' NVL(CS.CVE_EMISOR_NAFIN,0), ' +
                                                                       ' CR.ID_CREDITO,' +
                                                                   #39 + C_ACRED + #39 + ',' +
                                                                   #39 + C_ADMIN + #39 + ',' +
                                                                   #39 + C_ABONO + #39 + '),1, 10))) SALDO_CHEQ ' +
             '        FROM CR_CESION CS, CR_CREDITO CR, CR_CONTRATO CCTO, CONTRATO C ' +
             '        WHERE  CS.ID_CESION(+) = CR.ID_CREDITO ' +
             '        AND    CR.ID_CONTRATO  = CCTO.ID_CONTRATO ' +
             '        AND    CR.FOL_CONTRATO = CCTO.FOL_CONTRATO ' +
             '        AND      C.ID_CONTRATO = CCTO.ID_CONTRATO ' +
             '      ) CH ' +
             ' WHERE S.CVE_SEGUIMIENTO = B.CVE_SEGUIMIENTO ' +
             ' AND B.F_COBRANZA BETWEEN TO_DATE( ' + #39 + F_INICIAL.AsString + #39 +
                                                ','+ #39 +'DD/MM/YYYY' + #39 + ')' +
                              ' AND TO_DATE( ' + #39 + F_FINAL.AsString + #39 + ',' +
                                                 #39 +'DD/MM/YYYY' + #39 + ')' +
             ' AND     CR.ID_CREDITO = B.ID_CREDITO ' +
             ' AND    CR.ID_CONTRATO = CC.ID_CONTRATO ' +
             ' AND   CR.FOL_CONTRATO = CC.FOL_CONTRATO ' +
             ' AND     C.ID_CONTRATO = CC.ID_CONTRATO ' +
             ' AND      C.ID_TITULAR = PA.ID_PERSONA '+
             ' AND C.ID_PERS_ASOCIAD = PR.ID_PERSONA ';

   if SITUACION.AsString <> CSIT_TO then
   Begin
      if SITUACION.AsString = CSIT_ID then
         vlsql := vlsql + 'AND B.SIT_SEGUIMIENTO = ' + #39 + CSIT_ID + #39
      else if SITUACION.AsString = CSIT_NI then
         vlsql := vlsql + 'AND B.SIT_SEGUIMIENTO = ' + #39 + CSIT_NI + #39
      else if SITUACION.AsString = CSIT_CA then
      Begin
         vlsql := vlsql + 'AND B.SIT_SEGUIMIENTO IN ( ' + #39 + CSIT_CA + #39 +
                  ' , ' + #39 + CSIT_CI + #39 + ' ) ';
      end;
   end;
   CadenaSql := vlSql + 'GROUP BY B.ID_GRUPO_PAGO, '+
                        '         B.F_COBRANZA, ' +
                        '         B.SIT_SEGUIMIENTO, ' +
                        '         S.CVE_SEGUIMIENTO, ' +
                        '         S.DESC_SEGUIMIENTO, ' +
                        '         C.ID_TITULAR, ' +
                        '         PA.NOMBRE, ' +
                        '         PR.NOMBRE, ' +
                        '         CH.CHEQUERA ' +
                        'ORDER BY B.F_COBRANZA, S.CVE_SEGUIMIENTO, SUM_IMP_TOTAL ';}

procedure TWCrSeCoTo.btREPORTEClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRSECOTO_REPOR',True,True) then
   begin
     //REPORTE
   end;
end;

end.


