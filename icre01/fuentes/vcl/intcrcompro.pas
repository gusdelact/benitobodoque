{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y-,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}

// Sistema         : Clase de CR_COMIS_PROG
// Fecha de Inicio : 02/06/2003
// Función forma   : Clase de CR_COMIS_PROG
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCrComPro;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntCrCatComi, IntParamCre,
IntBasicCred,
IntLinkit,  Grids, Aligrid,   IntGenCre, Menus, IntSGCtrl,
IntCrComisEv, IntCrCoProg, InterEdit;

Const
   COL_CVE = 0; //Descripción de Comisión
   COL_COM = 1; //Descripción de Comisión
   COL_PCT = 2; //Porcentaje
   COL_IMP = 3; //Importe
   COL_SIT = 4; //Situación
Type
 TCrComPro= class;

  TWCrComPro=Class(TForm)
    InterForma1             : TInterForma;
    lbID_CREDITO : TLabel;
    edID_CREDITO : TEdit;
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
    Label23: TLabel;
    Label25: TLabel;
    Label7: TLabel;
    sgcDATOS: TSGCtrl;
    Label1: TLabel;
    Label2: TLabel;
    Label30: TLabel;
    PopupMenu1: TPopupMenu;
    AdicionaComProgramada1: TMenuItem;
    lbComAcc: TLabel;
    Configuracomision1: TMenuItem;
    ModificarComisiondePremio: TMenuItem;
    GBcomis_prem: TGroupBox;
    edIMP_COMIS_PREM: TInterEdit;
    btACEPTAR: TBitBtn;
    btCANCELA: TBitBtn;
    Label4: TLabel;
    Label3: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure sgcDATOSDblClick(Sender: TObject);
    procedure AdicionaComProgramada1Click(Sender: TObject);
    procedure Configuracomision1Click(Sender: TObject);
    procedure ModificarComisiondePremioClick(Sender: TObject);
    procedure btCANCELAClick(Sender: TObject);
    procedure btACEPTARClick(Sender: TObject);
    private
    { Private declarations }
       vgContinua: Boolean;
       Procedure LlenaGrid;
       procedure Actualiza_ImpComPrem( pIdCredito, pCveComision, pImpComReemb: STring );
       Procedure ActivaComision( pIdCredito, pCveComision,pSitComProg : STring );
       Procedure ComisEventual( pComision : String);
       Procedure ComisProg( pComision : String; pAlta, pModifica: Boolean; var psRealizado:Boolean);
    public
    { Public declarations }
    Objeto : TCrComPro;
end;

 TCrComPro= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        VGIDCredito              : Integer;
        vgModifica               : Boolean;
        ParamCre                 : TParamCre;
        BasicCred                : TBasicCred;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;


implementation

{$R *.DFM}


constructor TCrComPro.Create( AOwner : TComponent );
begin Inherited;
      TableName := '';
      UseQuery := True;
      HelpFile := 'IntCrComPro.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrComPro.Destroy;
begin
    inherited;
end;


function TCrComPro.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrComPro;
begin
   W:=TWCrComPro.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftConsulta;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

(***********************************************FORMA CR_COMIS_PROG********************)
(*                                                                              *)
(*  FORMA DE CR_COMIS_PROG                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_COMIS_PROG********************)

//HERJA 31.08.2010
procedure TWCrComPro.Actualiza_ImpComPrem( pIdCredito, pCveComision, pImpComReemb: STring );
var   StpComis : TStoredProc;
Begin
   try
     StpComis := TStoredProc.Create(Self);
     with StpComis do
     begin
        //Inicia el SPT
        StpComis.DatabaseName:= Objeto.Apli.DatabaseName;
        StpComis.SessionName:= Objeto.Apli.SessionName;
        StpComis.StoredProcName:= 'PKGCRCOMISIONES.STPUPD_IMPCOMPREM';
        Params.Clear;
        Params.CreateParam(ftInteger,'PEIDCREDITO',ptInput);
        Params.CreateParam(ftString,'PECVECOMISION',ptInput);
        Params.CreateParam(ftString,'PEIMPCOMPREM',ptInput);
        Params.CreateParam(ftString,'PECVEUSUMOD',ptInput);
        Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
        Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
        Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
        Prepare;
        ParamByName('peIdCredito').AsInteger := StrToInt(pIdCredito);
        ParamByName('peCveComision').AsString := pCveComision;
        ParamByName('peImpComPrem').AsFloat := StrToFloat(pImpComReemb);
        ParamByName('peCveUsuMod').AsString := Objeto.Apli.Usuario;
        ParamByName('peBCommit').AsString := CVERDAD;
        ExecProc;

        if (ParamByName('PSResultado').AsInteger <> 0) then
        Begin
           ShowMessage( IntToStr(ParamByName('psRESULTADO').AsInteger)  + ' : ' +
                        ParamByName('psTxResultado').AsString );
           GenMsg('Disposición' + pIdCredito +
                  'Desc: [' + IntToStr(ParamByName('psRESULTADO').AsInteger)+'] '+
                  ParamByName('psTxResultado').AsString,Objeto.Apli);
        end;
        //end if;
     end;
   finally
      StpComis.Free;
   end;
end;


procedure TWCrComPro.ActivaComision( pIdCredito, pCveComision,pSitComProg : STring );
var   StpComis : TStoredProc;
Begin
   try
     StpComis := TStoredProc.Create(Self);
     with StpComis do
     begin
        //Inicia el SPT
        StpComis.DatabaseName:= Objeto.Apli.DatabaseName;
        StpComis.SessionName:= Objeto.Apli.SessionName;
        StpComis.StoredProcName:= 'PKGCRCOMISIONES.STPUPDSITCOMPROG';
        Params.Clear;
        Params.CreateParam(ftInteger,'PEIDCREDITO',ptInput);
        Params.CreateParam(ftString,'PECVECOMISION',ptInput);
        Params.CreateParam(ftString,'PESITCOMPROG',ptInput);
        Params.CreateParam(ftString,'PECVEUSUMOD',ptInput);
        Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
        Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
        Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
        Prepare;
        ParamByName('peIdCredito').AsString := pIdCredito;
        ParamByName('peCveComision').AsString := pCveComision;
        ParamByName('peSitComProg').AsString := pSitComProg;
        ParamByName('peCveUsuMod').AsString := Objeto.Apli.Usuario;
        ParamByName('peBCommit').AsString := CVERDAD;
        ExecProc;

        if (ParamByName('PSResultado').AsInteger <> 0) then
        Begin
           ShowMessage( IntToStr(ParamByName('psRESULTADO').AsInteger)  + ' : ' +
                        ParamByName('psTxResultado').AsString );
           GenMsg('Disposición' + pIdCredito +
                  'Desc: [' + IntToStr(ParamByName('psRESULTADO').AsInteger)+'] '+
                  ParamByName('psTxResultado').AsString,Objeto.Apli);
        end;
        //end if;
     end;
   finally
      StpComis.Free;
   end;
end;

procedure TWCrComPro.FormShow(Sender: TObject);
begin
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.BasicCred.LlenaDatos(Objeto.VGIDCredito);

      edID_CREDITO.Text := Objeto.BasicCred.ID_CREDITO.AsString;
      edDESC_CREDITO.Text := Objeto.BasicCred.NOM_ACREDITADO.AsString;
      LlenaGrid;
end;

procedure TWCrComPro.FormDestroy(Sender: TObject);
begin
   //Objeto
end;

procedure TWCrComPro.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrComPro.LlenaGrid;
var vlQry : TQuery;
    vlsql : String;
begin
  vgContinua := False;
  vlSql :=  ' SELECT  DECODE( CCP.SIT_COMIS_PROG,''CA'','''',''SI'') SIT_COMISION,      ' + coCRLF +
            '         CCC.CVE_COMISION,    ' + coCRLF +
            '         CCC.DESC_COMISION,    ' + coCRLF +
            '         CCP.PCT_COMISION,  ' + coCRLF +
            '         CCP.IMP_COMISION,  ' + coCRLF +
// RABA FEB 2012
//            '         DECODE(CCC.CVE_TIPO_COM,''EV'',''EVENTUAL'',''PERIODICA'') CVE_TIPO_COM, ' + coCRLF +
            '         (CASE WHEN CCP.CVE_TIPO_COM = ''EV'' THEN ''EVENTUAL'' WHEN CCP.CVE_TIPO_COM = ''PE'' THEN ''PERIODICA'' WHEN CCP.CVE_TIPO_COM = ''PP'' THEN ''PLAN PAGOS'' ELSE ''DESCONOCIDO'' END) CVE_TIPO_COM, ' + coCRLF +
// FIN RABA			
            '         CCP.SIT_COMIS_PROG   ' + coCRLF +
            '         , NVL(CCP.IMP_COMIS_PREM, 0) AS IMP_COMIS_PREM    ' + coCRLF + //HERJA 31.08.2010
            ' FROM CR_CAT_COMISION CCC,     ' + coCRLF +
            '      CR_COMIS_PROG   CCP      ' + coCRLF +
            ' WHERE CCP.ID_CREDITO    = ' + Objeto.BasicCred.ID_CREDITO.AsString + //Objeto.ID_CREDITO.AsString + coCRLF +
//            '   AND CCC.CVE_COMISION <> ''CODI''' + coCRLF +
            '   AND CCP.CVE_COMISION  = CCC.CVE_COMISION ' + coCRLF;

     vlQry := GetSQLQuery(vlSql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );

     try
        if vlQry <> nil then
        Begin
            vgContinua := True;
        //Datos que no se muestran
            vlQry.FieldByName('SIT_COMISION').DisplayWidth := 4;
            vlQry.FieldByName('CVE_COMISION').DisplayWidth := 8;
            vlQry.FieldByName('DESC_COMISION').DisplayWidth:= 38;
            vlQry.FieldByName('PCT_COMISION').DisplayWidth := 10;
            vlQry.FieldByName('IMP_COMISION').DisplayWidth := 13;
            vlQry.FieldByName('CVE_TIPO_COM').DisplayWidth := 13;
            vlQry.FieldByName('SIT_COMIS_PROG').DisplayWidth := 5;
            vlQry.FieldByName('IMP_COMIS_PREM').DisplayWidth := 13;  //HERJA 31.08.2010

            TNumericField(vlQry.FieldByName('IMP_COMISION')).DisplayFormat := '###,###,###,##0.00';     // RABA ENE 2013
            TNumericField(vlQry.FieldByName('IMP_COMIS_PREM')).DisplayFormat := '###,###,###,##0.00';   // RABA ENE 2013

            sgcDATOS.AddQry( vlQry, True,True,-1,-1,-1,False); // AGREGAR QUERY
            sgcDATOS.ColumnByName('SIT_COMISION').IsCheck := True;//DEFINIR EL CAMPO AUT DEL QUERY COMO CHECKBOX
        end
        else  sgcDATOS.Clear('NO EXISTEN DATOS'#30'>C');
     finally
       if vlQry <> nil then
          vlQry.free;
       //end if
     end;

  //LOLS 30 JUL 2006. CREDITO EN LINEA
  lbComAcc.Visible := False;
  vlSql :=  'SELECT  DECODE( CCP.SIT_COMIS_PROG,''CA'','''',''SI'') SIT_COMISION,      ' + coCRLF +
            '        CCC.CVE_COMISION,' + coCRLF +
            '        CCC.DESC_COMISION,   ' + coCRLF +
            '        CCP.PCT_COMISION,  ' + coCRLF +
            '        CCP.IMP_COMISION,  ' + coCRLF +
// RABA FEB 2012			
//            '        DECODE(CCC.CVE_TIPO_COM,''EV'',''EVENTUAL'',''PERIODICA'') CVE_TIPO_COM, ' + coCRLF +
            '        (CASE WHEN CCP.CVE_TIPO_COM = ''EV'' THEN ''EVENTUAL'' WHEN CCP.CVE_TIPO_COM = ''PE'' THEN ''PERIODICA'' WHEN CCP.CVE_TIPO_COM = ''PP'' THEN ''PLAN PAGOS'' ELSE ''DESCONOCIDO'' END) CVE_TIPO_COM, ' + coCRLF +
// FIN RABA
            '        CCP.SIT_COMIS_PROG   ' + coCRLF +
            'FROM    CR_CAT_COMISION CCC,' + coCRLF +
            '        CR_CREDITO C,' + coCRLF +
            '        CR_COM_PROG_ACC   CCP' + coCRLF +
            'WHERE   C.ID_CREDITO      = ' + Objeto.BasicCred.ID_CREDITO.AsString +
            '  AND   CCP.ID_ACCESORIO  = C.ID_CONTRATO' + coCRLF +
            '  AND   CCP.FOL_ACCESORIO = C.FOL_CONTRATO' + coCRLF +
            '  AND   CCP.CVE_ACCESORIO = ''LN''' + coCRLF +
            '  AND   CCP.CVE_EVENTO_COM = ''CL''' + coCRLF +
            '  AND   CCP.CVE_COMISION  = CCC.CVE_COMISION' + coCRLF +
            'UNION' + coCRLF +
            'SELECT  DECODE( CCP.SIT_COMIS_PROG,''CA'','''',''SI'') SIT_COMISION,      ' + coCRLF +
            '        CCC.CVE_COMISION,' + coCRLF +
            '        CCC.DESC_COMISION,   ' + coCRLF +
            '        CCP.PCT_COMISION,  ' + coCRLF +
            '        CCP.IMP_COMISION,  ' + coCRLF +
            '        DECODE(CCC.CVE_TIPO_COM,''EV'',''EVENTUAL'',''PERIODICA'') CVE_TIPO_COM, ' + coCRLF +
            '        CCP.SIT_COMIS_PROG   ' + coCRLF +
            'FROM    CR_CAT_COMISION CCC,' + coCRLF +
            '        CR_CREDITO C,' + coCRLF +
            '        CONTRATO   CTTO,' + coCRLF +
            '        CR_COM_PROG_ACC   CCP' + coCRLF +
            'WHERE   C.ID_CREDITO       = ' + Objeto.BasicCred.ID_CREDITO.AsString +
            '  AND   CTTO.ID_CONTRATO   = C.ID_CONTRATO' + coCRLF +
            '  AND   CCP.ID_ACCESORIO   = CTTO.ID_TITULAR' + coCRLF +
            '  AND   CCP.FOL_ACCESORIO  = 0' + coCRLF +
            '  AND   CCP.CVE_ACCESORIO  = ''AC''' + coCRLF +
            '  AND   CCP.CVE_EVENTO_COM = ''CL''' + coCRLF +
            '  AND   CCP.CVE_COMISION   = CCC.CVE_COMISION';
  vlQry := GetSQLQuery( vlSql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
  if vlQry <> nil then
  Begin
    if ( Objeto.BasicCred.SIT_CREDITO.AsString = 'NP' ) or
       ( Objeto.BasicCred.SIT_CREDITO.AsString = 'NA' ) then
      lbComAcc.Visible := True;
    //
    vlQry.Free;
  end;
  //ENDS_LOLS_30_JUL_2006_CREDITO_EN_LINEA
end;

procedure TWCrComPro.sgcDATOSDblClick(Sender: TObject);
var Y : integer;
    vlMod :Boolean; // RABA FEB 2012
begin
  vlMod := False; // RABA FEB 2012
  if   vgContinua  then Begin
    with Objeto, sgcDATOS do
    Begin
       Y := SG.Row;
       if ( BasicCred.SIT_CREDITO.AsString = 'NP' ) OR
          ( BasicCred.SIT_CREDITO.AsString = 'NA' ) THEN
          vgModifica:= True;
       //end if;
       if vgModifica then Begin
         if CellStr['SIT_COMIS_PROG',Y] = CSIT_AC then
               ActivaComision(BasicCred.ID_CREDITO.AsString,CellStr['CVE_COMISION',Y],CSIT_CA )
         else Begin
            ActivaComision(BasicCred.ID_CREDITO.AsString,CellStr['CVE_COMISION',Y],CSIT_AC );
// RABA FEB 2012			
            ComisProg( CellStr['CVE_COMISION',Y], False, True, vlMod ); // LOLS 26 JUL 2006 CREDITO EN LINEA
            if not vlMod then
               ActivaComision(BasicCred.ID_CREDITO.AsString,CellStr['CVE_COMISION',Y],CSIT_CA );
// FIN RABA
            {
            IF ( CellStr['CVE_TIPO_COM',Y] = 'EVENTUAL' ) THEN
               ComisEventual( CellStr['CVE_COMISION',Y] )
            ELSE ComisProg( CellStr['CVE_COMISION',Y] );
            }
         end;
       end
       else ShowMessage('NO TIENE PERMISO PARA MODIFICAR LA PROGRAMACIÓN');
     end;
   end;
   LlenaGrid;
end;


procedure TWCrComPro.ComisEventual( pComision : String);
var
    ComEvent  : TCrComisEv;
begin
   ComEvent := TCrComisEv.Create(self);
   try
      ComEvent.Apli       := Objeto.Apli;
      ComEvent.ParamCre   := Objeto.ParamCre;
      ComEvent.vgCredito  := Objeto.BasicCred.ID_CREDITO.AsString;
      ComEvent.vgComision := pComision;
      ComEvent.Catalogo;
   finally
      ComEvent.Free;
   end;
   LlenaGrid;
end;

procedure TWCrComPro.ComisProg(pComision: String; pAlta, pModifica: Boolean; var psRealizado:Boolean);
var
    CoProg     : TCrCoProg;
begin
   CoProg := TCrCoProg.Create(self);
   try
      CoProg.Apli:=Objeto.Apli;
      CoProg.ParamCre:=Objeto.ParamCre;
      CoProg.vgBActualiza := False;     // RABA FEB 2012
      //
      //LOLS 26 JUL 2006. CREDITO EN LINEA
      CoProg.vgDesCredito := Objeto.BasicCred.NOM_ACREDITADO.AsString;
      CoProg.VGIDCredito  := Objeto.BasicCred.ID_CREDITO.AsInteger;
      CoProg.Comision.BuscaWhereString := 'CR_CAT_COMISION.CVE_COMISION IN '               + coCRLF +
                                          '(SELECT CVE_COMISION FROM CR_PRODUCTO_COM '     + coCRLF +
                                          'WHERE CVE_PRODUCTO_CRE = '                      + coCRLF +
                                          SQLStr( Objeto.BasicCred.CVE_PRODUCTO.AsString ) + coCRLF +
                                          '  AND SIT_PRO_COMISION = ' + SQLStr( 'AC' ) + ')';
      CoProg.Comision.FilterString     := CoProg.Comision.BuscaWhereString;
      //ENDS_LOLS
      //
      CoProg.FindKey( [ Objeto.BasicCred.ID_CREDITO.AsString, pComision ] );
      //
      //LOLS 26 JUL 2006. CREDITO EN LINEA
      //CoProg.vgDesCredito := Objeto.BasicCred.NOM_ACREDITADO.AsString;
      //CoProg.VGIDCredito := Objeto.BasicCred.ID_CREDITO.AsInteger;
      //CoProg.Comision.FindKey([pComision]);
      //ENDS_LOLS
      //
// RABA FEB 2012	  
      If pAlta then
      begin
         If CoProg.Nuevo then
           psRealizado := True
         else
           psRealizado := False;
      end
      else
        if pModifica then
        begin
          CoProg.Modifica;
          if CoProg.vgBActualiza then
          begin
             psRealizado := True;
          end
          else
          begin
             psRealizado := False;
          end;
        end
        else
        begin
           CoProg.Catalogo;
           psRealizado := True;
        end;
// FIN RABA
   finally
      CoProg.Free;
   end;
//   LlenaGrid;
end;

procedure TWCrComPro.AdicionaComProgramada1Click(Sender: TObject);
var vlMod :Boolean; // RABA FEB 2012
begin
   vlMod := False;  // RABA FEB 2012
   ComisProg('', True, False, vlMod);   // RABA FEB 2012
end;


//<LOLS 09AGO2006. CONFIGURACIÓN DE COMISIONES>
procedure TWCrComPro.Configuracomision1Click(Sender: TObject);
var Y : integer;
    vlModifica : Boolean;
    vlMod :Boolean;
begin
  vlMod := False;
  if vgContinua then
  begin
    vlModifica := False;
    with Objeto, sgcDATOS do
    Begin
      Y := SG.Row;
      if ( CellStr['SIT_COMIS_PROG',Y ] = CSIT_AC  ) and
         ( ( BasicCred.SIT_CREDITO.AsString = 'NP' ) or
           ( BasicCred.SIT_CREDITO.AsString = 'NA' )
         ) then
         vlModifica := True;
// RABA FEB 2012
      if (vgModifica) and (CellStr['SIT_COMIS_PROG',Y ] = CSIT_AC) then
         vlModifica := True;
// RABA
      //end if;
      if vlModifica then begin
        ComisProg( CellStr[ 'CVE_COMISION', Y ], False, True, vlMod );
      end else
        ShowMessage('No es posible modificar la comisión ya que no se encuentra activa.');
      //
    End;
  End;
  LlenaGrid;
end;
//</LOLS>

procedure TWCrComPro.ModificarComisiondePremioClick(Sender: TObject);
var Y : integer;
    vlQry : TQuery;
    vlsql : string;
begin
   with Objeto, sgcDATOS do
   Begin
      Y := SG.Row;
      vlsql:=' SELECT B_COMIS_PREM FROM CR_CAT_COMISION '+
             ' WHERE CVE_COMISION = '''+CellStr['CVE_COMISION',Y]+'''';

      vlQry := GetSQLQuery(vlsql, Apli.DataBaseName, Apli.SessionName, True );
      try
         if vlQry <> nil then
         Begin
            If (vlQry.FieldByName('B_COMIS_PREM').AsString = 'V') Then
            Begin
               GBcomis_prem.Visible:=true;
               edIMP_COMIS_PREM.Text:=CellStr['IMP_COMIS_PREM',Y];
            end
            else
               ShowMessage('Esta Comision NO aplica PPO');
         end;
      finally
         if vlQry <> nil then vlQry.free;
      end;
   end;
end;

procedure TWCrComPro.btCANCELAClick(Sender: TObject);
begin
   GBcomis_prem.Visible:=false;
end;

procedure TWCrComPro.btACEPTARClick(Sender: TObject);
var Y : integer;
begin
   if Trim(edIMP_COMIS_PREM.Text)<>'' then
   begin
      if StrToFloat(edIMP_COMIS_PREM.Text)>0 then
      begin
         with sgcDATOS do
         Begin
            Y := SG.Row;
            Actualiza_ImpComPrem( edID_CREDITO.Text, CellStr['CVE_COMISION',Y] , edIMP_COMIS_PREM.Text );
         end;
         LlenaGrid;
         GBcomis_prem.Visible:=false;
      end
      else
         ShowMessage('El importe debe de ser mayor a CERO');
   end
   else
      ShowMessage('El importe no debe de ser Nulo');
end;

end.
