// Sistema         : Clase de CrAcredCM
// Fecha de Inicio : 01/04/2013
// Función forma   : Clase de CrAcredCM
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Zizxvoriznlhyza
// Comentarios     :
Unit IntCrAcredCM;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,

IntParamCre,
IntGenCre,
IntCrAcredit, IntSGCtrl, ActnList, ImgList
;

Type
 TCrAcredCM= class;

  TWCrAcredCM=Class(TForm)
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
    Label5: TLabel;
    edID_ACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOM_ACREDITADO: TEdit;
    ilACREDITADO: TInterLinkit;
    lbSituacionCM: TLabel;
    sgcDATOS: TSGCtrl;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    bbtnProcesoCM: TBitBtn;
    ImageList1: TImageList;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure FormShow(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    Procedure MuestraDatos;
    Procedure ProcesoMercantil(vlProceso:String);
    private 
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrAcredCM;
end; 
 TCrAcredCM= class(TInterFrame)
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        ID_ACREDITADO  : TInterCampo;
        B_CMERCANTIL   : TInterCampo;
        ParamCre       : TParamCre;
        Acreditado     : TCrAcredit;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published 
      end;

implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrAcredCM.Create( AOwner : TComponent );
begin Inherited; 
   ID_ACREDITADO :=CreaCampo('ID_ACREDITADO',ftFloat,tsNinguno,tsNinguno,True);
   ID_ACREDITADO.Caption:='Id de acreditado';

   B_CMERCANTIL :=CreaCampo('B_CMERCANTIL',ftString,tsNinguno,tsNinguno,True);
   B_CMERCANTIL.Caption := 'En Concurso Mercantil';

   Acreditado := TCrAcredit.Create(Self);
   Acreditado.MasterSource := Self;
   Acreditado.FieldByName('ID_ACREDITADO').MasterField := 'ID_ACREDITADO';

   StpName  := ' ';
   UseQuery := False;
   HelpFile := 'IntCrAcredCM.Hlp';
//   ShowMenuReporte:=True;
end;

Destructor TCrAcredCM.Destroy;
begin
   If Assigned(Acreditado) Then
    Acreditado.Free;
   inherited;
end;


function TCrAcredCM.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrAcredCM;
begin
   W:=TWCrAcredCM.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftImprimir; //ftConsulta; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrAcredCM.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICracred.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

(***********************************************FORMA CrAcredCM********************)
(*                                                                              *)
(*  FORMA DE CrAcredCM                                                            *)
(*                                                                              *)
(***********************************************FORMA CrAcredCM********************)

procedure TWCrAcredCM.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      ID_ACREDITADO.Control := Nil;
      Acreditado.ID_ACREDITADO.Control  := Nil;
      Acreditado.Persona.Nombre.Control := Nil;
   End;
end;

procedure TWCrAcredCM.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;


//procedure TWCrAcredCM.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte; 
//end;


procedure TWCrAcredCM.FormShow(Sender: TObject);
begin

   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   With Objeto Do Begin
      ID_ACREDITADO.Control     := edID_ACREDITADO;
      Acreditado.ID_ACREDITADO.Control := edID_ACREDITADO;
      Acreditado.Persona.Nombre.Control := edNOM_ACREDITADO;
      Acreditado.GetParams(Objeto);
   End;

end;

procedure TWCrAcredCM.btACREDITADOClick(Sender: TObject);
begin
if Objeto.ValidaAccesoEsp('TCRACREDCM_BACR',True,True) then  // JFOF 29/04/2013 FUNCION DE SEGURIDADES
  begin
     Objeto.Acreditado.ShowAll := True;
     If Objeto.Acreditado.Busca Then Begin
        MuestraDatos;
        InterForma1.NextTab(edID_ACREDITADO);
     End;
  end;
end;

procedure TWCrAcredCM.ilACREDITADOEjecuta(Sender: TObject);
begin
   If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
      MuestraDatos;
      InterForma1.NextTab(edID_ACREDITADO);
   End;
end;

procedure TWCrAcredCM.MuestraDatos;
var
  sql :String;
  vlQry : TQuery;

  vlB_CMercantil :String;
  vlF_Empresa :TDateTime;
  vlF_EmpSTR  :String;
begin
  vlF_Empresa := Objeto.Apli.DameFechaEmpresa;
  vlF_EmpSTR  := DateToStr(vlF_Empresa-1);

  sql := 'SELECT PKGCRTRASCARTERA.FUNACREDCMERCA(ID_ACREDITADO) B_CMERCANTIL ' + coCRLF+
         'FROM CR_ACREDITADO ' + coCRLF+
         'WHERE ID_ACREDITADO = ' + Objeto.Acreditado.ID_ACREDITADO.AsString;

  GetSQLStr(sql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'B_CMERCANTIL', vlB_CMercantil, True);
  Objeto.B_CMERCANTIL.AsString := vlB_CMercantil;
  
  If vlB_CMercantil = 'V' then
  begin
     lbSituacionCM.Caption := 'En Concurso Mercantil';
     bbtnProcesoCM.Glyph.FreeImage;
     bbtnProcesoCM.Action := ActionList1.Actions[1];
  end
  else
  begin
     lbSituacionCM.Caption := '';
     bbtnProcesoCM.Glyph.FreeImage;
     bbtnProcesoCM.Action := ActionList1.Actions[0];
  end;
  bbtnProcesoCM.Enabled := True;
  
  sql := 'SELECT ID_CREDITO, ID_CONTRATO, F_TRASPASO_VENC, ' + coCRLF+
         '       (CASE WHEN F_AUTORIZA = ' + SQLFecha(vlF_Empresa) + ' THEN IMP_CREDITO ' + coCRLF+
	                  'ELSE PKGCRPPO.FUNOBTSDO(ID_CREDITO, ''' + vlF_EmpSTR + ''', ''INSOLUTO'', '''') END) SALDO ' + coCRLF+
         'FROM CR_CREDITO ' + coCRLF+
         'WHERE ID_CONTRATO IN (SELECT ID_CONTRATO FROM CONTRATO WHERE ID_TITULAR = ' + Objeto.Acreditado.ID_ACREDITADO.AsString + ') ' + coCRLF+
         '  AND SIT_CREDITO = ''AC'' ' + coCRLF+
         'ORDER BY F_TRASPASO_VENC, ID_CREDITO ' + coCRLF;

  vlQry := GetSQLQuery(sql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );

  try
     if vlQry <> nil then
     Begin
        vlQry.FieldByName('ID_CREDITO').DisplayWidth := 13;
        vlQry.FieldByName('ID_CONTRATO').DisplayWidth := 13;;
        vlQry.FieldByName('F_TRASPASO_VENC').DisplayWidth := 14;
        vlQry.FieldByName('SALDO').DisplayWidth := 15;

        TNumericField(vlQry.FieldByName('SALDO')).DisplayFormat := '###,###,###,###,###,###,##0.00';

        sgcDATOS.AddQry( vlQry, True,True,-1,-1,-1,False); // AGREGAR QUERY

     end
     else
     Begin
        sgcDATOS.Clear('EL ACREDITADO NO TIENE CRÉDITOS ACTIVOS'#30'>C');
     end;
  finally
    if vlQry <> nil then
       vlQry.free;
  end;

end;

procedure TWCrAcredCM.Action1Execute(Sender: TObject);
begin
if Objeto.ValidaAccesoEsp('TCRACREDCM_PRCVN',True,True) then     // JFOF 29/04/2013 FUNCION DE SEGURIDADES
 begin
    // Se traspasan a cartera vencida todos los créditos vigentes del acreditado
    ProcesoMercantil('VEN');
    MuestraDatos;
 end;
end;

procedure TWCrAcredCM.Action2Execute(Sender: TObject);
begin
if Objeto.ValidaAccesoEsp('TCRACREDCM_PRCVI',True,True) then     // JFOF 29/04/2013 FUNCION DE SEGURIDADES
  begin
      // Se traspasan a cartera vigente todos los créditos vencidos por Concurso Mercantil
    // Los creditos vencidos y que cumplen con pagos o pago sostenido se traspasarán en el cierre nocturno
    ProcesoMercantil('VIG');
    MuestraDatos;
  end;
end;

procedure TWCrAcredCM.ProcesoMercantil(vlProceso: String);
var
  STPTrasCartXAcred: TStoredProc;
begin
   Objeto.ID_ACREDITADO.GetFromControl;
   try
     STPTrasCartXAcred := TStoredProc.Create(Self);
     with STPTrasCartXAcred do
     begin
        //Inicia el SPT
        STPTrasCartXAcred.DatabaseName:= Objeto.Apli.DatabaseName;
        STPTrasCartXAcred.SessionName:= Objeto.Apli.SessionName;
        STPTrasCartXAcred.StoredProcName:= 'PKGCRTRASCARTERA.STPTRASCARTXACRED';
        Params.Clear;
        Params.CreateParam(ftFloat,   'PEIDEMPRESA', ptInput);
        Params.CreateParam(ftFloat,   'PEIDACREDITADO', ptInput);
        Params.CreateParam(ftFloat,   'PEIDGPOTRANS', ptInput);
        Params.CreateParam(ftDate,    'PEFCIERRE', ptInput);
        Params.CreateParam(ftString,  'PEPROCESO', ptInput);   // VEN o VIG
        Params.CreateParam(ftString,  'PECVEUSUARIO', ptInput);
        Params.CreateParam(ftString,  'PEBCOMMIT', ptInput);
        Params.CreateParam(ftFloat,   'PSRESULTADO',  ptOutput);
        Params.CreateParam(ftString,  'PSTXRESULTADO',ptOutput);
        Prepare;
        ParamByName('PEIDEMPRESA').AsFloat := Objeto.Apli.IdEmpresa;
        ParamByName('PEIDACREDITADO').AsFloat := Objeto.ID_ACREDITADO.AsFloat;
        ParamByName('PEIDGPOTRANS').Clear;
        parambyName('PEFCIERRE').AsDate:= Objeto.Apli.DameFechaEmpresa ;
        ParamByName('PEPROCESO').AsString := vlProceso;
        ParamByName('PECVEUSUARIO').AsString  := Objeto.Apli.Usuario;
        ParamByName('PEBCOMMIT').AsString := 'V';
        ExecProc;

        if (ParamByName('psResultado').AsInteger <> 0) then
        Begin
           ShowMessage( IntToStr(ParamByName('psResultado').AsInteger)  + ' : ' +
                        ParamByName('psTxResultado').AsString );
        end
        else
           ShowMessage('Proceso Correcto.');
     end;
   finally
      STPTrasCartXAcred.Free;
   end;
end;

end.
