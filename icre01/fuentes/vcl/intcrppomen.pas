// Sistema         :
// Fecha de Inicio : 18/02/2013
// Función forma   : Para activar el proceso de calculo mensual de provisones y ajustes de PPO.
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Fernando Jimenez Rivera
// Fecha           : FEBRERO 2013
// Comentarios     :
Unit IntCrPPOMen;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, Grids,

IntParamCre,
IntCrMovPPP, IntCrOperaci, IntCrCredito, IntCrCto,
IntSGCtrl, IntCrGruCla, InterEdit, Wwdatsrc, Wwkeycb, DBCtrls, IntCtoPanel,
IntGenCre,
//unidades adicionales
IntCrConPPP, Psock, NMsmtp, QuickRpt, Qrctrls;

Const
  CoAUTORIZADO = 'AU';
  CoCANCELADO = 'CA';
  CoNOAUTORIZADO = 'NA';
  CoVERDAD ='V';
  coFALSO = 'F' ;
  CoPREDETERMINADO=CoVERDAD ;


Type
 TCrPPOMen= class;

  TWCrPPOMen=Class(TForm)
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
    Label2: TLabel;
    BitBtnCalc: TBitBtn;
    Memo1: TMemo;
    Edit1: TEdit;
    Label5: TLabel;
    Memo2: TQRMemo;
    NMSMTP1: TNMSMTP;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure BitBtnCalcClick(Sender: TObject);
    procedure EnviaCorreos;
    private
      function CalcProvMen(Credito: Integer; FchCierre: TDateTime): Boolean;
      function ObtenDestinatarios : String;
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrPPOMen;
end;
 TCrPPOMen= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        FECHA_PROCESO   : TInterCampo;

        ParamCre     : TParamCre;

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


constructor TCrPPOMen.Create( AOwner : TComponent );
begin Inherited;
  FECHA_PROCESO := CreaCampo( 'FECHA_PROCESO', ftDate, tsNinguno, tsNinguno, False );

  {$WARNINGS OFF}
  {$WARNINGS ON}
  {$WARNINGS OFF}
  {$WARNINGS ON}

  UseQuery  := False;
  HelpFile  := 'IntCrPPOMen.Hlp';
  ShowMenuReporte:=True;
end;

Destructor TCrPPOMen.Destroy;
begin
  inherited;
end;


function TCrPPOMen.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrPPOMen;
begin
   W:=TWCrPPOMen.Create(Self);
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


Function TCrPPOMen.InternalBusca:Boolean;
begin InternalBusca := False;

end;

function TCrPPOMen.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************FORMA de NINGUNO**************************************)
(*                                                                                       *)
(*  FORMA DE NINGUNO                                                                     *)
(*                                                                                       *)
(***********************************FORMA de NINGUNO**************************************)

procedure TWCrPPOMen.FormShow(Sender: TObject);
var SQLText, vlFch: String;
begin
    lbDempresa.Caption := Objeto.ParamCre.EMPRESA.AsString;
    lbDfecha.Caption   := Objeto.ParamCre.FECHA.AsString;
    lbDUsuario.Caption := Objeto.ParamCre.USUARIO.AsString;
    lbDPerfil.Caption  := Objeto.ParamCre.PERFIL.AsString;

    SQLText:= 'SELECT TO_CHAR(LAST_DAY(ADD_MONTHS(TO_DATE('''+DateToStr(Objeto.ParamCre.Apli.DameFechaEmpresa)+''', ''DD/MM/YYYY''), -1)), ''DD/MM/YYYY'' ) AS F_MES_ANT '+
	      ' FROM DUAL ';

    GetSQLStr( SQLText, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'F_MES_ANT', vlFch, False );
    Objeto.FECHA_PROCESO.AsDateTime:= StrToDate(vlFch) ;
    Edit1.Text:= FormatDateTime('dddd, dd "de" mmmm "de" yyyy', Objeto.FECHA_PROCESO.AsDateTime) ;

end;

procedure TWCrPPOMen.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrPPOMen.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrPPOMen.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

(**************************** CALCULO DE PROVISONES CIERRE MENSUAL PROXIMO ANTERIOR *********************************)
function TWCrPPOMen.CalcProvMen(Credito: Integer; FchCierre: TDateTime): Boolean;
var
  STPCalculaProvisiones: TStoredProc;
begin
  STPCalculaProvisiones:= TStoredProc.Create(Self);
  try
     With STPCalculaProvisiones do begin
        StoredProcName := 'PKGCRPPO.STPCIERREMENSUALPPO';
        DatabaseName   := Objeto.Apli.DatabaseName;
        SessionName    := Objeto.Apli.SessionName;

        Params.Clear;
        Params.CreateParam(ftFloat, 'peIdCredito',  ptInput);
        Params.CreateParam(ftDate, 'peFecha',  ptInput);
        Params.CreateParam(ftString, 'peBCommit',  ptInput);
        Params.CreateParam(ftString, 'peCveUsuario',  ptInput);
        Params.CreateParam(ftFloat,'psResultado',ptOutput);
        Params.CreateParam(ftString,'psTxResultado',ptOutput);

        If Credito = 0 then
           ParamByName('peIdCredito').Clear
        Else
           ParamByName('peIdCredito').AsFloat := Credito;

        ParamByName('peFecha').AsDate := FchCierre;
        ParamByName('peBCommit').AsString := coVERDAD;
        ParamByName('peCveUsuario').AsString := Objeto.Apli.Usuario;

        ExecProc;

     if (ParamByName('psResultado').AsInteger = 0) then
         Result:= True
     else
        begin
           ShowMessage( IntToStr(ParamByName('psResultado').AsInteger)  + ' : ' +
                        ParamByName('psTxResultado').AsString );
           Memo1.Lines.Add(IntToStr(ParamByName('psResultado').AsInteger)  + ' : ' +
                        ParamByName('psTxResultado').AsString);
           Result:= False;
        end;
     end ;
  finally
     STPCalculaProvisiones.Free ;
  end ;

end;

procedure TWCrPPOMen.BitBtnCalcClick(Sender: TObject);
var       x: String;
    Credito: Integer;
    vlBEjecucion : Boolean;
begin
  if Objeto.ValidaAccesoEsp('TCRPPOMEN_CALCP',True,True) then
  begin
     Credito:= 0;

     x:= 'correctamente!.  ******';
     Memo1.Lines.Clear;
     Memo1.Lines.Add('******  Proceso de cálculo mensual de provisiones PPO ******');
     Memo1.Lines.Add('');
     vlBEjecucion := CalcProvMen(Credito, Objeto.FECHA_PROCESO.AsDateTime);
     If not vlBEjecucion  then
        begin
           x:='con problemas en cálculo! ******';
           Exit;
        end;
     If Credito <> 0 then x:= ' del crédito '+IntToStr(Credito)+' '+x;
     Memo1.Lines.Add('******  Ha terminado el proceso '+x);
     Memo1.Lines.Add('');

     if vlBEjecucion then
     begin
     if ObtenDestinatarios <> '' then
       begin
       EnviaCorreos;
       Memo1.Lines.Add('******  Se ha enviado notificación vía mail ******');
       end;
     end;
  end ;
end;

procedure TWCrPPOMen.EnviaCorreos;
begin
      try
        NMSMTP1.Host := obtValorGpoCve('CIEPPO', 'HOST', Objeto.Apli);
        NMSMTP1.Port := StrToInt(obtValorGpoCve('CIEPPO', 'PORT', Objeto.Apli));
        NMSMTP1.Connect;
        NMSMTP1.PostMessage.ToAddress.Assign(Memo2.Lines);
        NMSMTP1.PostMessage.FromAddress := obtValorGpoCve('CIEPPO', 'MAIL_SEND', Objeto.Apli);
        NMSMTP1.PostMessage.FromName := obtValorGpoCve('CIEPPO', 'FROM_NAME', Objeto.Apli);
        NMSMTP1.PostMessage.Subject := obtValorGpoCve('CIEPPO', 'SUBJECT', Objeto.Apli);
        NMSMTP1.PostMessage.date := FormatDateTime('dd/mm/yyyy hh:nn am/pm', Now);
        NMSMTP1.PostMessage.Body.Text := obtValorGpoCve('CIEPPO', 'BODY0', Objeto.Apli)+coCRLF+coCRLF+obtValorGpoCve('CIEPPO', 'BODY1', Objeto.Apli)+obtValorGpoCve('CIEPPO', 'BODY2', Objeto.Apli)+FormatDateTime('mmmm "de" yyyy', Objeto.FECHA_PROCESO.AsDateTime)+'.'+coCRLF+coCRLF+obtValorGpoCve('CIEPPO', 'BODY3', Objeto.Apli)+coCRLF+coCRLF+coCRLF+obtValorGpoCve('CIEPPO', 'BODY4', Objeto.Apli)+coCRLF+obtValorGpoCve('CIEPPO', 'BODY5', Objeto.Apli)+coCRLF+obtValorGpoCve('CIEPPO', 'BODY6', Objeto.Apli);
        NMSMTP1.PostMessage.Attachments.Clear;
        NMSMTP1.SubType := mtPlain;
        NMSMTP1.SendMail;
        NMSMTP1.Disconnect;
      except
      on E: Exception do
      begin

      end;
      end;
end;


function TWCrPPOMen.ObtenDestinatarios : String;
var Qry : TQuery;
    strBuf, strSeparator : String;
    VLSQL : String;
begin
 strSeparator := ''; strBuf := '';
 Qry := TQuery.Create(Nil);
 If Assigned(Qry) Then
  With (Qry) Do
   Try
    Memo2.Lines.Clear;
    DatabaseName := Objeto.Apli.DataBaseName;
    SessionName := Objeto.Apli.SessionName;
    SQL.Clear;
    VLSQL :=  '  SELECT valor '+
              '    FROM cr_grupo_clave '+
              '   WHERE cve_grupo_clave = ''CIEPPO'' '+
              '     AND cve_referencia LIKE ''MAIL_TO%''';

    SQL.Add(VLSQL);

    Open; First;
    While Not Eof Do
     Begin
     strBuf := strBuf + strSeparator + FieldByName('VALOR').AsString;
     strSeparator := C_SEPARATOR_MAIL + ' ';
     Memo2.Lines.Add(FieldByName('VALOR').AsString);
     Next;
     End;

   Finally
    Close;
    Free;
   End;
  Result := strBuf;
end;

end.
