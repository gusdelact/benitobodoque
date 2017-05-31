// Sistema         : Clase de NINGUNO
// Fecha de Inicio : 14/04/2011
// Función forma   : Clase de NINGUNO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : 
// Comentarios     :
Unit IntCrCambiaO;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntParamCre, IntLinkit,
IntCrCredito, InterEdit, IntMFiraOpe,IntGenCre,IntMon;    //Disposición
Type
 TcrCambiaO= class;

  TWCambiaO=Class(TForm)
    InterForma1             : TInterForma;
    Label2: TLabel;
    edID_CESION: TEdit;
    btID_CESION: TBitBtn;
    edCESION: TEdit;
    ilCesion: TInterLinkit;
    GroupBox1: TGroupBox;
    edNOM_CVE_OPERATIVA1: TEdit;
    edCVE_OPERATIVA1: TEdit;
    Label11: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edNOM_MONEDA1: TEdit;
    edCVE_MONEDA1: TEdit;
    edPCT_GTIA_LIQ1: TEdit;
    edPCT_GTIA_FEGA_EF1: TEdit;
    edPCT_GTIA_FEGA_NO1: TEdit;
    edPCT_CUOTA_FEGA1: TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    pnestado: TPanel;
    ilCVE_OPERATIVA: TInterLinkit;
    GroupBox2: TGroupBox;
    edCVE_MONEDA: TEdit;
    Label7: TLabel;
    edNOM_MONEDA: TEdit;
    btCVE_OPERATIVA: TBitBtn;
    edCVE_OPERATIVA: TEdit;
    Label8: TLabel;
    edNOM_CVE_OPERATIVA: TEdit;
    Label9: TLabel;
    edPCT_GTIA_LIQ: TEdit;
    Label10: TLabel;
    edPCT_GTIA_FEGA_EF: TEdit;
    Label12: TLabel;
    edPCT_GTIA_FEGA_NO: TEdit;
    Label13: TLabel;
    edPCT_CUOTA_FEGA: TEdit;
    Label14: TLabel;
    Label16: TLabel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure btID_CESIONClick(Sender: TObject);
    procedure ilCesionCapture(Sender: TObject; var Show: Boolean);
    procedure ilCesionEjecuta(Sender: TObject);
    procedure btCVE_OPERATIVAClick(Sender: TObject);
    procedure ilCVE_OPERATIVAEjecuta(Sender: TObject);
    procedure InterForma1BtnAceptar(Sender: TObject);
    procedure Buscanombre(vlID_CREDITO : String);
    private 
    { Private declarations } 
    public
    { Public declarations } 
    Objeto : TcrCambiaO;
end; 
 TcrCambiaO= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        ParamCre                 : TParamCre;
        Credito                  : TCrCredito;//Disposición
        MFiraOpe            : TMFiraOpe;
        {********************************}
        {********************************}
        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
        procedure   StpUpdComision(pIdCredito: Integer; pCve_Operativa, pCalc_FG:string);
      published
      end;

implementation
//Uses RepMon;

{$R *.DFM}

procedure limpiaOperativa(NOM_CVE_OPERATIVA, CVE_MONEDA, CVE_NOM_MONEDA, CVE_OPERATIVA,
                          PCT_GTIA_LIQ, PCT_GTIA_FEGA_EF, PCT_GTIA_FEGA_NO, PCT_CUOTA_FEGATedit:Tedit);
BEGIN
   NOM_CVE_OPERATIVA.Text := '';
   CVE_MONEDA.Text := '';
   CVE_NOM_MONEDA.Text := '';
   CVE_OPERATIVA.Text := '';
   PCT_GTIA_LIQ.Text := '';
   PCT_GTIA_FEGA_EF.Text := '';
   PCT_GTIA_FEGA_NO.Text := '';
   PCT_CUOTA_FEGATedit.Text := '';
END;


procedure cargaOperativa(P_CVE_OPERATIVA:String;
                         NOM_CVE_OPERATIVA, CVE_MONEDA, CVE_NOM_MONEDA, CVE_OPERATIVA, PCT_GTIA_LIQ,
                         PCT_GTIA_FEGA_EF, PCT_GTIA_FEGA_NO, PCT_CUOTA_FEGATedit:Tedit;
                         Objeto : TcrCambiaO );

var consultas :TQuery;
begin
   consultas :=   GetSQLQuery('SELECT FIRA.*, (SELECT DESC_MONEDA FROM MONEDA WHERE CVE_MONEDA = FIRA.CVE_MONEDA) AS DESC_MONEDA '+
                              ',(SELECT DESC_OPERATIVA FROM CR_FIRA_OPERA WHERE CVE_OPERATIVA = FIRA.CVE_OPERATIVA) AS DESC_OPERATIVA '+
                              'FROM CR_FIRA_EQUIV FIRA WHERE CVE_OPERATIVA ='+QuotedStr(P_CVE_OPERATIVA)
                                ,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );

   NOM_CVE_OPERATIVA.text := consultas.FieldValues['DESC_OPERATIVA'];
   CVE_MONEDA.text := consultas.FieldValues['CVE_MONEDA'];
   CVE_NOM_MONEDA.text := consultas.FieldValues['DESC_MONEDA'];
   CVE_OPERATIVA.text := consultas.FieldValues['CVE_OPERATIVA'];
   PCT_GTIA_LIQ.text := FormatFloat('###,##0.00',consultas.FieldValues['PCT_GTIA_LIQ']);
   PCT_GTIA_FEGA_EF.text := FormatFloat('###,##0.00',consultas.FieldValues['PCT_GTIA_FEGA_EF']);
   PCT_GTIA_FEGA_NO.text := FormatFloat('###,##0.00',consultas.FieldValues['PCT_GTIA_FEGA_NO']);
   PCT_CUOTA_FEGATedit.text := FormatFloat('###,##0.00',consultas.FieldValues['PCT_CUOTA_FEGA']);
   consultas.Close;
end;


function RevisaAplicaciones_GFPY(ID_CREDITO : STRING; Objeto : TcrCambiaO):boolean;
var consultas :TQuery;
begin
   consultas :=   GetSQLQuery('SELECT COUNT(*) count FROM CR_TRANSACCION WHERE ID_CREDITO = '+QuotedStr(ID_CREDITO)+
                           ' AND CVE_OPERACION IN ('+
                           QuotedStr('PGCPGF')+','+QuotedStr('PGINGF')+','+QuotedStr('PGFNGF')+','+QuotedStr('PGCNGF')+','+
                           QuotedStr('PGCPGP')+','+QuotedStr('PGINGP')+','+QuotedStr('PGFNGP')+','+QuotedStr('PGCNGP')+
                           ') '+
                           ' AND SIT_TRANSACCION=''AC'' '+
                           ' AND ID_TRANS_CANCELA IS NULL '
                            ,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );

   if consultas.FieldValues['count']<>'0' then result := true
   else result := false;
   consultas.Close;
end;

function RevisaAplicaciones_GL(ID_CREDITO : STRING; Objeto : TcrCambiaO):boolean;
var consultas :TQuery;
begin
   consultas :=   GetSQLQuery('SELECT COUNT(*) count FROM CR_TRANSACCION WHERE ID_CREDITO = '+QuotedStr(ID_CREDITO)+
                           ' AND CVE_OPERACION IN ('+
                           QuotedStr('PGCPGL')+','+QuotedStr('PGINGL')+','+QuotedStr('PGFNGL')+','+QuotedStr('PGCNGL')+
                           ') '+
                           ' AND SIT_TRANSACCION=''AC'' '+
                           ' AND ID_TRANS_CANCELA IS NULL '
                            ,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );

   if consultas.FieldValues['count']<>'0' then result := true
   else result := false;
   consultas.Close;
end;

constructor TcrCambiaO.Create( AOwner : TComponent );
begin Inherited;
   {*********************************************************************}
   MFiraOpe := TMFiraOpe.Create(Self);
   MFiraOpe.MasterSource:=Self;
   MFiraOpe.FieldByName('CVE_OPERATIVA').MasterField:='CVE_OPERATIVA';
   {*********************************************************************}

   Credito := TCrCredito.Create(Self);
   Credito.MasterSource:=Self;
   Credito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

   StpName  := ' ';
   UseQuery := False;
   HelpFile := 'IntCrCambiaO.Hlp';
   ShowMenuReporte:=True;
end;

Destructor TcrCambiaO.Destroy;
begin
   if Credito <> nil then
      Credito.Free;
   If MFiraOpe <> Nil Then
      MFiraOpe.Free;
   inherited;
end;


function TcrCambiaO.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCambiaO;
begin
   W:=TWCambiaO.Create(Self);
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


Function TcrCambiaO.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('INinguno.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TcrCambiaO.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;

{--------------------------  ACTUALIZA MONTOS DE CUOTAS FEGA  ----------------------------}
Procedure TcrCambiaO.StpUpdComision(pIdCredito: Integer; pCve_Operativa, pCalc_FG:string);
var   sptUpdComis : TStoredProc;
Begin
   try
     sptUpdComis := TStoredProc.Create(Self);
     with sptUpdComis do
     begin
        //Inicia el SPT
        DatabaseName:= Apli.DatabaseName;
        SessionName:= Apli.SessionName;
        StoredProcName:= 'PKGCRREDESCTO.STPUPDCOMFND';
        Params.Clear;
        Params.CreateParam(ftInteger,'PEIDCREDITO',ptInput);
        Params.CreateParam(ftString, 'PECAMBIO_OPE',ptInput);
        Params.CreateParam(ftString, 'PECALCULA_FG',ptInput);
        Params.CreateParam(ftString, 'PECVEOPERATIVA',ptInput);
        Params.CreateParam(ftString, 'PEBCOMMIT',ptInput);
        Params.CreateParam(ftFloat,  'PSRESULTADO',ptOutput);
        Params.CreateParam(ftString, 'PSTXRESULTADO',ptOutput);
        Prepare;
        ParamByName('PEIDCREDITO').AsInteger := pIdCredito;
        ParamByName('PECAMBIO_OPE').AsString := 'V';
        ParamByName('PECALCULA_FG').AsString := pCalc_FG;
        ParamByName('PECVEOPERATIVA').AsString := pCve_Operativa;
        ParamByName('PEBCOMMIT').AsString := 'V';

        ExecProc;

        if (ParamByName('PSRESULTADO').AsInteger <> 0) then
           ShowMessage( IntToStr(ParamByName('PSRESULTADO').AsInteger)  + ' : ' + ParamByName('PSTXRESULTADO').AsString );
     end;
   finally
      sptUpdComis.Free;
   end;
end;


(***********************************************FORMA NINGUNO********************)
(*                                                                              *)
(*  FORMA DE NINGUNO                                                            *)
(*                                                                              *)
(***********************************************FORMA NINGUNO********************)

procedure TWCambiaO.Buscanombre(vlID_CREDITO : String);
var vlQry: TQuery;
    vlSql: string;
begin
   edCESION.Text:='';
 vlSql :='SELECT NOMBRE FROM PERSONA ' +
         ' WHERE ID_PERSONA IN (SELECT ID_TITULAR FROM CONTRATO ' +
         '                       WHERE ID_CONTRATO IN (SELECT ID_CONTRATO FROM CR_CREDITO ' +
         '      		                       WHERE ID_CREDITO = '+vlID_CREDITO+
	 '	       		                      ) ' +
         '                     ) ';

    vlQry := GetSQLQuery(vlSql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );

    try
      if vlQry <> nil then
      begin
         edCESION.Text :=  vlQry.FieldByName('NOMBRE').asString;
      end;
   finally
        if vlQry <> nil then vlQry.free;
    end;
end;

procedure TWCambiaO.FormShow(Sender: TObject);
begin
   Objeto.Credito.ID_CREDITO.Control := edID_CESION;
   Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := edCESION;
   Objeto.Credito.GetParams(Objeto);
   edCESION.Hint := Objeto.Credito.ContratoCre.Contrato.TITNombre.AsString;
   edCESION.ShowHint := True;

   With Objeto Do
   Begin
      lbDempresa.Caption := ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := ParamCre.FECHA.AsString;
      lbDUsuario.Caption := ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

      InterForma1.BtnAceptar.Visible:=True;
      InterForma1.BtnAyuda.Visible:=False;
      InterForma1.BtnCancelar.Visible:=False;
      InterForma1.BtnModificar.Visible:=False;
      InterForma1.BtnEliminar.Visible:=False;
      MFiraOpe.GetParams(Objeto);

      InterForma1.BtnAceptar.Enabled:=true;      
   end;
end;

procedure TWCambiaO.FormDestroy(Sender: TObject);
begin
    Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := nil;
    Objeto.Credito.ID_CREDITO.Control := nil;
end;

procedure TWCambiaO.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;
                        
procedure TWCambiaO.btID_CESIONClick(Sender: TObject);
var vlclave : STring;

begin
//JFOF VALIDA USUARIO 12/10/2011
//    vlclave := '13';
  //  if ValidaUsuario(Objeto.Apli,vlclave) then
//JFOF VALIDA USUARIO 12/10/2011
    if Objeto.ValidaAccesoEsp('TCRCAMBIAO_DISPO',True,True) then
    begin
       Objeto.Credito.ShowAll := True;
       pnestado.Caption:='';
       if Objeto.Credito.Busca then
       begin
          InterForma1.NextTab(edID_CESION);

          Buscanombre(edID_CESION.Text);

          LimpiaOperativa(edNOM_CVE_OPERATIVA1, edCVE_MONEDA1, edNOM_MONEDA1, edCVE_OPERATIVA1, edPCT_GTIA_LIQ1,
                          edPCT_GTIA_FEGA_EF1,  edPCT_GTIA_FEGA_NO1, edPCT_CUOTA_FEGA1);

          LimpiaOperativa(edNOM_CVE_OPERATIVA, edCVE_MONEDA, edNOM_MONEDA, edCVE_OPERATIVA, edPCT_GTIA_LIQ,
                          edPCT_GTIA_FEGA_EF, edPCT_GTIA_FEGA_NO, edPCT_CUOTA_FEGA);

          if (Objeto.Credito.CVE_OPERATIVA.AsString <> '') then
          begin
             btCVE_OPERATIVA.Enabled := True;
             pnEstado.caption := '';
             cargaOperativa(Objeto.Credito.CVE_OPERATIVA.AsString,
                            edNOM_CVE_OPERATIVA1, edCVE_MONEDA1, edNOM_MONEDA1, edCVE_OPERATIVA1, edPCT_GTIA_LIQ1,
                            edPCT_GTIA_FEGA_EF1, edPCT_GTIA_FEGA_NO1, edPCT_CUOTA_FEGA1,
                            Objeto);

            if RevisaAplicaciones_GFPY(Objeto.Credito.ID_CREDITO.AsString, Objeto) then
            begin
               pnestado.Caption:='La disposición cuenta con Aplicaciones de Garantia FEGA/PYME';
               btCVE_OPERATIVA.Enabled := False;
            end;

            if RevisaAplicaciones_GL(Objeto.Credito.ID_CREDITO.AsString, Objeto) then
               pnestado.Caption:='La disposición cuenta con Aplicaciones de Garantia Liquida';
          end
          else
          begin
             btCVE_OPERATIVA.Enabled := True;

             pnEstado.caption := 'La disposición no cuenta con Operativa Asociada';
             edCVE_MONEDA1.text := '';
             edNOM_MONEDA1.text := '';
             edCVE_OPERATIVA1.text := '';
             edNOM_CVE_OPERATIVA1.text := '';
             edPCT_GTIA_LIQ1.text := '';
             edPCT_GTIA_FEGA_EF1.text := '';
             edPCT_GTIA_FEGA_NO1.text := '';
             edPCT_CUOTA_FEGA1.text := '';
          end;
        End;
    end;
      //else
      //  begin
      //  ShowMessage('    No tiene suficientes permisos para esta Acción');
      //  end;
end;

procedure TWCambiaO.ilCesionCapture(Sender: TObject; var Show: Boolean);
begin
   Show := True;
end;

procedure TWCambiaO.ilCesionEjecuta(Sender: TObject);
begin
   pnestado.Caption:='';
   If Objeto.Credito.FindKey([ilCesion.Buffer]) Then
   Begin
      InterForma1.NextTab(edID_CESION);
      Buscanombre(edID_CESION.Text);

      LimpiaOperativa(edNOM_CVE_OPERATIVA1, edCVE_MONEDA1, edNOM_MONEDA1, edCVE_OPERATIVA1, edPCT_GTIA_LIQ1,
                      edPCT_GTIA_FEGA_EF1,  edPCT_GTIA_FEGA_NO1, edPCT_CUOTA_FEGA1);

      LimpiaOperativa(edNOM_CVE_OPERATIVA, edCVE_MONEDA, edNOM_MONEDA, edCVE_OPERATIVA, edPCT_GTIA_LIQ,
                      edPCT_GTIA_FEGA_EF, edPCT_GTIA_FEGA_NO, edPCT_CUOTA_FEGA);

      if (Objeto.Credito.CVE_OPERATIVA.AsString <> '') then
      begin
         btCVE_OPERATIVA.Enabled := True;
         pnEstado.caption := '';
         cargaOperativa(Objeto.Credito.CVE_OPERATIVA.AsString,
                        edNOM_CVE_OPERATIVA1, edCVE_MONEDA1, edNOM_MONEDA1, edCVE_OPERATIVA1, edPCT_GTIA_LIQ1,
                        edPCT_GTIA_FEGA_EF1, edPCT_GTIA_FEGA_NO1, edPCT_CUOTA_FEGA1,
                        Objeto);

         if RevisaAplicaciones_GFPY(Objeto.Credito.ID_CREDITO.AsString, Objeto) then
         begin
            pnestado.Caption:='La disposición cuenta con Aplicaciones de Garantia FEGA/PYME';
            btCVE_OPERATIVA.Enabled := False;
         end;

         if RevisaAplicaciones_GL(Objeto.Credito.ID_CREDITO.AsString, Objeto) then
            pnestado.Caption:='La disposición cuenta con Aplicaciones de Garantia Liquida';
      end
      else
      begin
         btCVE_OPERATIVA.Enabled := True;

         pnEstado.caption := 'La disposición no cuenta con Operativa Asociada';
         edCVE_MONEDA1.text := '';
         edNOM_MONEDA1.text := '';
         edCVE_OPERATIVA1.text := '';
         edNOM_CVE_OPERATIVA1.text := '';
         edPCT_GTIA_LIQ1.text := '';
         edPCT_GTIA_FEGA_EF1.text := '';
         edPCT_GTIA_FEGA_NO1.text := '';
         edPCT_CUOTA_FEGA1.text := '';
      end;
   End;
end;

procedure TWCambiaO.btCVE_OPERATIVAClick(Sender: TObject);
var t:string;
    vlclave : String;
begin
//JFOF VALIDA USUARIO 12/10/2011
//    vlclave := '14';
//if ValidaUsuario(Objeto.Apli,vlclave) then
//JFOF VALIDA USUARIO 12/10/2011
   if Objeto.ValidaAccesoEsp('TCRCAMBIAO_NVAOP',True,True) then
   begin
    //operativas compatibles con el contrato
       Objeto.MFiraOpe.BuscaWhereString :=
    //   ' CVE_OPERATIVA <> ' +  QuotedStr(edCVE_OPERATIVA1.text) + ' AND ' +
       ' EXISTS(Select ID_CONTRATO FROM CR_GA_FIRA_CTO GATO ' +
       ' WHERE GATO.CVE_OPERATIVA = CR_FIRA_OPERA.CVE_OPERATIVA ' +
       '   AND GATO.ID_CONTRATO   = ' + QuotedStr(Objeto.Credito.ID_CONTRATO.AsString)+
       ')';

       Objeto.MFiraOpe.FilterString := Objeto.MFiraOpe.BuscaWhereString;
       Objeto.MFiraOpe.ShowAll := True;
       If Objeto.MFiraOpe.Busca Then
       Begin
          edCVE_OPERATIVA.Text := Objeto.MFiraOpe.CVE_OPERATIVA.AsString;
          cargaOperativa(edCVE_OPERATIVA.Text, edNOM_CVE_OPERATIVA, edCVE_MONEDA, edNOM_MONEDA, edCVE_OPERATIVA,
                            edPCT_GTIA_LIQ, edPCT_GTIA_FEGA_EF, edPCT_GTIA_FEGA_NO, edPCT_CUOTA_FEGA,
                            Objeto);

          InterForma1.NextTab(btCVE_OPERATIVA);
       End;
   end ;
   //else
   // begin
   //  ShowMessage('    No tiene suficientes permisos para esta Acción');
   // end;
end;


procedure TWCambiaO.ilCVE_OPERATIVAEjecuta(Sender: TObject);
begin
   If Objeto.MFiraOpe.FindKey([ilCVE_OPERATIVA.Buffer]) Then
      InterForma1.NextTab(edCVE_OPERATIVA);
end;

procedure TWCambiaO.InterForma1BtnAceptar(Sender: TObject);
var B_Procesar : Boolean;
    B_RECALCULO_FEGA : String;  //Recalculo de FEGA opcional HERJA
begin
   if not (MessageDlg('¿Confirma cambiar Operativa?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then exit;

   if (trim(edCVE_OPERATIVA1.Text)<>'') and (trim(edCVE_OPERATIVA.Text)='') then
   begin
      ShowMessage('No se ha seleccionado Nueva Operativa');
      exit;
   end;

   if (trim(edCVE_OPERATIVA1.Text)='') and (trim(edCVE_OPERATIVA.Text)='') then
   begin
      ShowMessage('No se ha seleccionado Nueva Operativa');
      exit;
   end;

   if (trim(edCVE_OPERATIVA1.Text) = trim(edCVE_OPERATIVA.Text)) then
   begin
      ShowMessage('Las Operativas son las Mismas');
      exit;
   end;

   B_Procesar:=true;
   if RevisaAplicaciones_GFPY(Objeto.Credito.ID_CREDITO.AsString, Objeto) then
   begin
      ShowMessage('La disposición cuenta con Aplicaciones de Garantia FEGA/PYME');
      B_Procesar:=false;
   end;
   if RevisaAplicaciones_GL(Objeto.Credito.ID_CREDITO.AsString, Objeto) then
   begin
      if MessageDlg('La disposición cuenta con Aplicaciones de Garantia Liquida, ¿Desea continuar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
         B_Procesar:=true
      else
         B_Procesar:=false;
   end;                               

   if B_Procesar=false then exit;

   //CAMBIO DE OPERATIVA
   if (trim(edCVE_OPERATIVA1.Text)<>'') and (trim(edCVE_OPERATIVA.Text)<>'') then
   begin
      if (MessageDlg('¿Desea Recalcular Cuotas FEGA?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then B_RECALCULO_FEGA:='V'
      else B_RECALCULO_FEGA:='F';

      Objeto.StpUpdComision(Objeto.Credito.ID_CREDITO.AsInteger, edCVE_OPERATIVA.Text,  B_RECALCULO_FEGA);
      ShowMEssage('La Operativa fue cambiada y las Cuotas recalculadas...');
   end;

   //ALTA DE OPERATIVA
   if (trim(edCVE_OPERATIVA1.Text)='') and (trim(edCVE_OPERATIVA.Text)<>'') then
   begin
      Objeto.StpUpdComision(Objeto.Credito.ID_CREDITO.AsInteger, edCVE_OPERATIVA.Text, 'F');
      ShowMEssage('La Operativa dada de Alta...');
   end;

   LimpiaOperativa(edNOM_CVE_OPERATIVA1, edCVE_MONEDA1, edNOM_MONEDA1, edCVE_OPERATIVA1, edPCT_GTIA_LIQ1,
                   edPCT_GTIA_FEGA_EF1,  edPCT_GTIA_FEGA_NO1, edPCT_CUOTA_FEGA1);

   LimpiaOperativa(edNOM_CVE_OPERATIVA, edCVE_MONEDA, edNOM_MONEDA, edCVE_OPERATIVA, edPCT_GTIA_LIQ,
                   edPCT_GTIA_FEGA_EF, edPCT_GTIA_FEGA_NO, edPCT_CUOTA_FEGA);

   edID_CESION.Text := '';
   edCESION.Text := '';
   pnestado.Caption:='';
   btCVE_OPERATIVA.Enabled := false;
 end;

end.
