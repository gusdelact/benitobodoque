// Sistema         : Clase de DV_LIQ_CHQRA
// Fecha de Inicio : 01/11/1999
// Función forma   : Clase de DV_LIQ_CHQRA
// Diseñado por    : Marcos Zarate Castro
// Comentarios     :
Unit IntDvLiqChqr;

interface

uses
Windows,   Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,  IntFind,
UnSQL2,    InterFun, ComCtrls, IntDtPk,  IntChCte, IntViaLiquid,   IntInter,
IntCtoHeader, IntLinkit, InterEdit, UnConDV, UnConInv,INTRFCIVA,
UnSegBtn;

Type
 TDvLiqChqr= class;    

  TWDvLiqChqra=Class(TForm)
    InterForma1             : TInterForma;
    gbGenerales: TGroupBox;
    lbID_FOL_LIQUIDA: TLabel;
    edID_FOL_LIQUIDA: TEdit;
    edFH_REGISTRO: TEdit;
    lbFH_REGISTRO: TLabel;
    lbID_TRANSACCION: TLabel;
    edID_TRANSACCION: TEdit;
    lbF_OPERACION: TLabel;
    edF_OPERACION: TEdit;
    lbSIT_MOVTO: TLabel;
    cbSit_movto: TComboBox;
    lbCVE_USUARIO: TLabel;
    edCVE_USUARIO: TEdit;
    gbDatosMovto: TGroupBox;
    lbCVE_VIA_LIQCION: TLabel;
    edCVE_VIA_LIQCION: TEdit;
    lbIMP_MOVTO: TLabel;
    lbID_CONTRATO_DV: TLabel;
    lbTX_COMENTARIO: TLabel;
    edTX_COMENTARIO: TEdit;
    edViaLiquidacion: TEdit;
    edNomTitular: TEdit;
    InterLinkit1: TInterLinkit;
    InterLinkit2: TInterLinkit;
    edID_CONTRATO_DV: TInterEdit;
    edIMP_MOVTO: TInterEdit;
    InterLinkit3: TInterLinkit;
    Panel1: TPanel;
    lbID_PERSONA: TLabel;
    edNomPersona: TEdit;
    lbID_BANCO_CHQRA: TLabel;
    edNomBanco: TEdit;
    lbNUM_CUENTA: TLabel;
    edNUM_CUENTA: TEdit;
    BitBtn1: TBitBtn;
    pnIFS: TPanel;
    Label4: TLabel;
    edNomPlazaExt: TEdit;
    Label3: TLabel;
    edFfc: TEdit;
    Label2: TLabel;
    edAba: TEdit;
    pnBanco: TPanel;
    Label1: TLabel;
    Label5: TLabel;
    edNOM_PLAZA_BANCO: TEdit;
    edCVE_SUC_BANCO: TEdit;
    edId_Plaza_Banco: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    edNOM_SUC_BANCO: TEdit;
    sbCliente: TBitBtn;
    bbViaLiq: TBitBtn;
    bbBanco: TBitBtn;
    edFH_cancela: TEdit;
    edCve_Usu_Cancela: TEdit;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edId_Tesoreria: TEdit;
    Label11: TLabel;
    edFol_Movto_Efvo: TEdit;
    sbCapturaRfc: TSpeedButton;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterLinkit1Capture(Sender: TObject; var Show: Boolean);
    procedure InterLinkit2Capture(Sender: TObject; var Show: Boolean);
    procedure InterLinkit1Ejecuta(Sender: TObject);
    procedure InterLinkit2Ejecuta(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure InterLinkit3Capture(Sender: TObject; var Show: Boolean);
    procedure InterLinkit3Ejecuta(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1AntesModificar(Sender: TObject;
      var Realizado: Boolean);
    procedure InterForma1AntesNuevo(Sender: TObject;
      var Realizado: Boolean);
    procedure  ValidaCto;
    procedure  ValidaBanco;
    function   Salir:Boolean;
    procedure  sbClienteClick(Sender: TObject);
    procedure  bbViaLiqClick(Sender: TObject);
    procedure  bbBancoClick(Sender: TObject);
    procedure  edID_CONTRATO_DVExit(Sender: TObject);
    procedure edIMP_MOVTOExit(Sender: TObject);
    procedure edCVE_VIA_LIQCIONExit(Sender: TObject);
    procedure edTX_COMENTARIOExit(Sender: TObject);
    procedure edNomPersonaExit(Sender: TObject);
    procedure edNUM_CUENTAExit(Sender: TObject);
    procedure edNomBancoExit(Sender: TObject);
    procedure edId_Plaza_BancoExit(Sender: TObject);
    procedure edNOM_PLAZA_BANCOExit(Sender: TObject);
    procedure edCVE_SUC_BANCOExit(Sender: TObject);
    procedure edNOM_SUC_BANCOExit(Sender: TObject);
    procedure edNomPlazaExtExit(Sender: TObject);
    procedure edFfcExit(Sender: TObject);
    procedure edAbaExit(Sender: TObject);
    procedure sbCapturaRfcClick(Sender: TObject);
    procedure gbDatosMovtoExit(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TDvLiqChqr;
end;
 TDvLiqChqr= class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        ID_FOL_LIQUIDA            : TInterCampo;
        ID_BANCO_CHQRA            : TInterCampo;
        NUM_CUENTA                : TInterCampo;
        NOMBRE_BENEFICIA          : TInterCampo;   // Nuevo 24-nov-99
        CVE_SUC_BANCO             : TInterCampo;   // Nuevo 24-nov-99
        NOM_SUC_BANCO             : TInterCampo;   // Nuevo 24-nov-99
        ID_PLAZA_BCO              : TInterCampo;   // Nuevo 24-nov-99
        DESC_BANCO                : TInterCampo;   // Nuevo 15-Feb-2000
        NOM_PLAZA_BANCO           : TInterCampo;   // Nuevo 24-nov-99
        NOM_PLAZA_EXT             : TInterCampo;   // Nuevo 24-nov-99
        ABA                       : TInterCampo;   // Nuevo 24-nov-99
        FFC                       : TInterCampo;   // Nuevo 24-nov-99
        IMP_MOVTO                 : TInterCampo;
        ID_CONTRATO_DV            : TInterCampo;
        TX_COMENTARIO             : TInterCampo;
        SIT_MOVTO                 : TInterCampo;
        CVE_VIA_LIQCION           : TInterCampo;
        CVE_USUARIO               : TInterCampo;
        F_OPERACION               : TInterCampo;
        FH_REGISTRO               : TInterCampo;
        ID_TRANSACCION            : TInterCampo;

        ID_TESORERIA              : TInterCampo;
        FOL_MOVTO_EFVO            : TInterCampo;
        FH_CANCELA                : TInterCampo;
        CVE_USU_CANCELA           : TInterCampo;
        TX_INF_FISCAL             : TInterCampo;

        ViaLiquid                 : TViaLiquid;
        CtrlCto                   : TCtrlCto;
        CheqCte                   : TCheqCte;
        Banco                     : TIntermed;
        Id_Contrato               : Integer;
        Importe                   : Double;
        pnBanco                   : TPanel;
        pnIFS                     : TPanel;
        function    InternalBusca : Boolean; override;
        function    InternalPost  : Boolean; override;
        function    InsertaFolSol : Boolean;
        procedure   ValidaEmpresa;

        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        procedure   Databasechange;override;

      published
      end;



implementation

{$R *.DFM}


constructor TDvLiqChqr.Create( AOwner : TComponent );
begin Inherited;
      ID_FOL_LIQUIDA :=CreaCampo('ID_FOL_LIQUIDA',ftFloat,tsNinguno,tsNinguno,True);
                ID_FOL_LIQUIDA.Caption:='Número de Fol Liquida';
      ID_BANCO_CHQRA :=CreaCampo('ID_BANCO_CHQRA',ftFloat,tsNinguno,tsNinguno,True);
                ID_BANCO_CHQRA.Caption:='Número de Banco Chqra';

      DESC_BANCO:=CreaCampo('DESC_BANCO',ftString,tsNinguno,tsNinguno,True);

      NUM_CUENTA :=CreaCampo('NUM_CUENTA',ftString,tsNinguno,tsNinguno,True);
        NUM_CUENTA.Size:=20;
                NUM_CUENTA.Caption:='Número Cuenta';

      NOMBRE_BENEFICIA:=CreaCampo('NOMBRE_BENEFICIA',ftString,tsNinguno,tsNinguno,True);
      CVE_SUC_BANCO   :=CreaCampo('CVE_SUC_BANCO',   ftString,tsNinguno,tsNinguno,True);
      CVE_SUC_BANCO.Size:=4;
      NOM_SUC_BANCO   :=CreaCampo('NOM_SUC_BANCO',   ftString,tsNinguno,tsNinguno,True);
      ID_PLAZA_BCO    :=CreaCampo('ID_PLAZA_BCO',    ftString,tsNinguno,tsNinguno,True);
      ID_PLAZA_BCO.Size:=3;
      NOM_PLAZA_BANCO :=CreaCampo('NOM_PLAZA_BANCO',   ftString,tsNinguno,tsNinguno,True);
      NOM_PLAZA_EXT   :=CreaCampo('NOM_PLAZA_EXT',   ftString,tsNinguno,tsNinguno,True);
      ABA             :=CreaCampo('ABA',             ftString,tsNinguno,tsNinguno,True);
      FFC             :=CreaCampo('FFC',             ftString,tsNinguno,tsNinguno,True);
      //NUEVOS


      IMP_MOVTO :=CreaCampo('IMP_MOVTO',ftFloat,tsNinguno,tsNinguno,True);
                IMP_MOVTO.Caption:='Imp Movto';
      ID_CONTRATO_DV :=CreaCampo('ID_CONTRATO_DV',ftFloat,tsNinguno,tsNinguno,True);
                ID_CONTRATO_DV.Caption:='Número de Contrato Dv';
      TX_COMENTARIO :=CreaCampo('TX_COMENTARIO',ftString,tsNinguno,tsNinguno,True);
                TX_COMENTARIO.Caption:='Comentario';
      SIT_MOVTO :=CreaCampo('SIT_MOVTO',ftString,tsNinguno,tsNinguno,True);
      with SIT_MOVTO do
      begin
        Size:=2;
        Caption:='Situación Movto';
        UseCombo:=True;
        ComboLista.Add('No Liquidado');  ComboDatos.Add('NL');
        ComboLista.Add('Cancelado');     ComboDatos.Add('CA');
        ComboLista.Add('Liquidado');     ComboDatos.Add('LQ');
      end;
      CVE_VIA_LIQCION :=CreaCampo('CVE_VIA_LIQCION',ftString,tsNinguno,tsNinguno,True);
        CVE_VIA_LIQCION .Size:=8;
                CVE_VIA_LIQCION.Caption:='Clave de Via Liqcion';
      CVE_USUARIO :=CreaCampo('CVE_USUARIO',ftString,tsNinguno,tsNinguno,True);
        CVE_USUARIO .Size:=8;
                CVE_USUARIO.Caption:='Clave de Usuario';
      F_OPERACION :=CreaCampo('F_OPERACION',ftDate,tsNinguno,tsNinguno,True);
                F_OPERACION.Caption:='Fecha Operacion';
      FH_REGISTRO :=CreaCampo('FH_REGISTRO',ftDateTime,tsNinguno,tsNinguno,True);
                FH_REGISTRO.Caption:='Fecha y Hora Registro';
      ID_TRANSACCION :=CreaCampo('ID_TRANSACCION',ftFloat,tsNinguno,tsNinguno,True);
                ID_TRANSACCION.Caption:='Número de Transaccion';

      ID_TESORERIA :=CreaCampo('ID_TESORERIA',ftFloat,tsNinguno,tsNinguno,True);
                ID_TESORERIA.Caption:='Número de tesorería';

      FOL_MOVTO_EFVO :=CreaCampo('FOL_MOVTO_EFVO',ftFloat,tsNinguno,tsNinguno,True);
                FOL_MOVTO_EFVO.Caption:='movto de tesorería';

      FH_CANCELA :=CreaCampo('FH_CANCELA',ftDate,tsNinguno,tsNinguno,True);
                FH_CANCELA.Caption:='Fecha y Hora Cancela';

      CVE_USU_CANCELA :=CreaCampo('CVE_USU_CANCELA',ftString,tsNinguno,tsNinguno,True);
        CVE_USU_CANCELA.Size:=8;
                CVE_USU_CANCELA.Caption:='Clave de Usuario Cancela';
      TX_INF_FISCAL :=CreaCampo('TX_INF_FISCAL',ftString,tsNinguno,tsNinguno,True);


      FKeyFields.Add('ID_FOL_LIQUIDA');

      TableName := 'DV_LIQ_CHQRA';
      UseQuery := True;
      ViaLiquid:=TViaLiquid.Create(Self);
      ViaLiquid.MasterSource:=Self;
      ViaLiquid.CVE_VIA_LIQCION.MasterField:='CVE_VIA_LIQCION';

      CtrlCto := TCtrlCto.Create(Self);
      CtrlCto.MasterSource:=Self;
      CtrlCto.ID_CONTRATO.MasterField:='ID_CONTRATO_DV';

      CheqCte := TCheqCte.Create(Self);

      Banco   := TIntermed.Create(Self);

      Importe:=-1;
end;

procedure TDvLiqChqr.Databasechange;
begin Inherited;
      CheqCte.GetParams(Self);
      Banco.GetParams(Self);
end;

Destructor TDvLiqChqr.Destroy;
begin if ViaLiquid <> nil then ViaLiquid.free;
      if CtrlCto   <> nil then CtrlCto.free;
      if CheqCte   <> nil then CheqCte.free;
      if Banco     <> nil then Banco.free;
      inherited;
end;

function TDvLiqChqr.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWDvLiqChqra;
begin
   W:=TWDvLiqChqra.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.ShowBtnEliminar:=False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

function TDvLiqChqr.InsertaFolSol:Boolean;
Var sp   : TStoredProc;
    CodResp  : Double;
    Descproc : String;
begin InsertaFolSol:=False;
      sp:=TStoredProc.Create(nil);
      try
       sp.DatabaseName:=Apli.DataBaseName;
       sp.SessionName :=Apli.SessionName;
       if CtrlCto.Id_Empresa.AsInteger = cEmpBanco
       then sp.StoredProcName:='PKGDPVISTA.STPINSSLIQTES'
       else sp.StoredProcName:='PKGDPVISTA.STPINSSOLLIQ';

       sp.Params.CreateParam(ftFloat,   'pID_FOL_LIQUIDA',  ptInputOutput);
       sp.Params.CreateParam(ftFloat,   'pID_BANCO_CHQRA',  ptInput);
       sp.Params.CreateParam(ftString,  'pNUM_CUENTA',      ptInput);
       sp.Params.CreateParam(ftString,  'pNOMBRE_BENEFIC',  ptInput);
       sp.Params.CreateParam(ftString,  'pCVE_SUC_BANCO',   ptInput);
       sp.Params.CreateParam(ftString,  'pNOM_SUC_BANCO',   ptInput);
       sp.Params.CreateParam(ftString,  'pID_PLAZA_BCO',    ptInput);
       sp.Params.CreateParam(ftString,  'pNOM_PLAZA_BANCO', ptInput);
       sp.Params.CreateParam(ftString,  'pNOM_PLAZA_EXT',   ptInput);
       sp.Params.CreateParam(ftString,  'pABA',             ptInput);
       sp.Params.CreateParam(ftString,  'pFFC',             ptInput);
       sp.Params.CreateParam(ftFloat,   'pIMP_MOVTO',       ptInput);
       sp.Params.CreateParam(ftFloat,   'pID_CONTRATO_DV',  ptInput);
       sp.Params.CreateParam(ftString,  'pTX_COMENTARIO',   ptInput);
       sp.Params.CreateParam(ftString,  'pCVE_VIA_LIQCION', ptInput);
       sp.Params.CreateParam(ftString,  'pCVE_USUARIO',     ptInput);
       sp.Params.CreateParam(ftDateTime,'pF_OPERACION',     ptInput);
       sp.Params.CreateParam(ftString,  'pDESC_BANCO',      ptInput);
       sp.Params.CreateParam(ftString,  'pTX_FISCAL',      ptInput);
       sp.Params.CreateParam(ftInteger, 'pResp',            ptOutput);
       sp.Params.CreateParam(ftString,  'pDescProc',        ptOutput);

       //Asigna los valores de entrada
       sp.Params.ParamByName('pID_BANCO_CHQRA').AsFloat  := ID_BANCO_CHQRA.AsFloat;
       sp.Params.ParamByName('pNUM_CUENTA').AsString     := NUM_CUENTA.AsString;
       sp.Params.ParamByName('pNOMBRE_BENEFIC').AsString := NOMBRE_BENEFICIA.AsString;
       sp.Params.ParamByName('pCVE_SUC_BANCO').AsString  := CVE_SUC_BANCO.AsString;
       sp.Params.ParamByName('pNOM_SUC_BANCO').AsString  := NOM_SUC_BANCO.AsString;
       sp.Params.ParamByName('pID_PLAZA_BCO').AsString   := ID_PLAZA_BCO.AsString;
       sp.Params.ParamByName('pNOM_PLAZA_BANCO').AsString:= NOM_PLAZA_BANCO.AsString;
       sp.Params.ParamByName('pNOM_PLAZA_EXT').AsString  := NOM_PLAZA_EXT.AsString;
       sp.Params.ParamByName('pABA').AsString            := ABA.AsString;
       sp.Params.ParamByName('pFFC').AsString            := FFC.AsString;
       sp.Params.ParamByName('pIMP_MOVTO').AsFloat       := IMP_MOVTO.AsFloat;
       sp.Params.ParamByName('pID_CONTRATO_DV').AsFloat  := ID_CONTRATO_DV.AsFloat;
       sp.Params.ParamByName('pTX_COMENTARIO').AsString  := TX_COMENTARIO.AsString;
       sp.Params.ParamByName('pCVE_VIA_LIQCION').AsString:= CVE_VIA_LIQCION.AsString;
       sp.Params.ParamByName('pCVE_USUARIO').AsString    := CVE_USUARIO.AsString;
       sp.Params.ParamByName('pF_OPERACION').AsDateTime  := F_OPERACION.AsDateTime;
       sp.Params.ParamByName('pDESC_BANCO').AsString     := DESC_BANCO.AsString;
       sp.Params.ParamByName('pTX_FISCAL').AsString      := TX_INF_FISCAL.AsString;

       //Prepara y ejecuta el stored procedure
       sp.Prepare;
       sp.ExecProc;

       //Obtiene el resultado de la ejecución del stored procedure
       CodResp  :=sp.parambyname('pResp').AsFloat;
       Descproc :=sp.parambyname('pDescProc').AsString;

       InsertaFolSol:=(CodResp=0);

       if CodResp <> 0
       then MessageDlg(Descproc,mtError,[mbOK],0)
       else begin
              ID_FOL_LIQUIDA.AsFloat:=sp.parambyname('pID_FOL_LIQUIDA').AsFloat;
              Importe:=Importe -  IMP_MOVTO.AsFloat;
            end;

      except sp.free;
      end;
end;

procedure TDvLiqChqr.ValidaEmpresa;
begin pnIfs.Visible:=False;
      pnBanco.Visible:=False;
      if (CtrlCto.Id_Empresa.AsInteger = cEmpifs) or
         (CtrlCto.Id_Empresa.AsInteger = cEmpBancoDls)
      then pnIfs.Visible:=True
      else if CtrlCto.Id_Empresa.AsInteger = cEmpBanco
           then pnBanco.Visible:=True;
end;

function TDvLiqChqr.InternalPost  : Boolean;
begin if Modo = moAppend
      then begin
             if InsertaFolSol
             then begin
                    InternalPost:=True;
                  end
             else begin
                    InternalPost:=False;
                    Raise EInterFrame.Create('Error al dar de alta la solicitud');
                  end;
           end
      else InternalPost:=inherited InternalPost;
end;
Function TDvLiqChqr.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('IDvLiCh.it','F');
      T.WhereString:='CVE_USUARIO = '''  + Apli.Usuario +  '''';
      Try if Active then begin T.Param(0,ID_FOL_LIQUIDA.AsString);
                               end;
          if T.Execute then
          begin
            InternalBusca := FindKey([T.DameCampo(0)]);
            ValidaEmpresa;
          end;
      finally  T.Free;
      end;
end;


(***********************************************FORMA DV_LIQ_CHQRA********************)
(*                                                                              *)
(*  FORMA DE DV_LIQ_CHQRA                                                            *)
(*                                                                              *)
(***********************************************FORMA DV_LIQ_CHQRA********************)

procedure TWDvLiqChqra.FormShow(Sender: TObject);
begin
  Objeto.ID_FOL_LIQUIDA.Control := edID_FOL_LIQUIDA;
  Objeto.DESC_BANCO.Control     := edNomBanco;
  Objeto.NUM_CUENTA.Control     := edNUM_CUENTA;

  Objeto.CVE_SUC_BANCO.Control  := edCVE_SUC_BANCO;
  Objeto.NOM_SUC_BANCO.Control  := edNOM_SUC_BANCO;
  Objeto.ID_PLAZA_BCO.Control   := edId_Plaza_Banco;
  Objeto.NOM_PLAZA_BANCO.Control:= edNOM_PLAZA_BANCO;

  Objeto.NOMBRE_BENEFICIA.Control:= edNomPersona;
  Objeto.NOM_PLAZA_EXT.Control   := edNomPlazaExt;
  Objeto.ABA.Control             := edAba;
  Objeto.FFC.Control             := edFFc;

  Objeto.CheqCte.Cuenta_Banco.Control  := edNUM_CUENTA;
  Objeto.CheqCte.Nom_Plaza_Ext.Control :=edNomPlazaExt;
  Objeto.CheqCte.ABA.Control           :=edAba;
  Objeto.CheqCte.FFC.Control           :=edFFc;
  Objeto.CheqCte.Intermediario.Nom_Corto_Interm.Control  := edNomBanco;
  Objeto.CheqCte.CVE_SUC_BANCO.Control                   := edCVE_SUC_BANCO;
  Objeto.CheqCte.NOM_SUC_BANCO.Control                   := edNOM_SUC_BANCO;
  Objeto.CheqCte.ID_PLAZA.Control                        := edId_Plaza_Banco;
  Objeto.CheqCte.NOM_PLAZA_BANCO.Control                 := edNOM_PLAZA_BANCO;
  Objeto.IMP_MOVTO.Control                               := edIMP_MOVTO;
  Objeto.ID_CONTRATO_DV.Control                          := edID_CONTRATO_DV;

  Objeto.CtrlCto.ID_CONTRATO.control                     := edID_CONTRATO_DV;
  Objeto.CtrlCto.TITNombre.Control                       := edNomTitular;

  Objeto.TX_COMENTARIO.Control                           := edTX_COMENTARIO;
  Objeto.SIT_MOVTO.Control                               := cbSit_Movto;
  Objeto.CVE_VIA_LIQCION.Control                         := edCVE_VIA_LIQCION;

  Objeto.ViaLiquid.CVE_VIA_LIQCION.Control               := edCVE_VIA_LIQCION;
  Objeto.ViaLiquid.DESC_SISTEMA_LIQ.Control              := edViaLiquidacion;

  Objeto.CVE_USUARIO.Control                             := edCVE_USUARIO;
  Objeto.F_OPERACION.Control                             := edF_OPERACION;
  Objeto.FH_REGISTRO.Control                             := edFH_REGISTRO;
  Objeto.ID_TRANSACCION.Control                          := edID_TRANSACCION;

  Objeto.FH_CANCELA.Control                              := edFH_Cancela;
  Objeto.CVE_USU_CANCELA.Control                         := edCve_Usu_Cancela;
  Objeto.ID_TESORERIA.Control                            := edId_Tesoreria;
  Objeto.FOL_MOVTO_EFVO.Control :=edFol_Movto_Efvo;
  Objeto.pnBanco:=pnBanco;
  Objeto.pnIFS  :=pnIFS;
end;

procedure TWDvLiqChqra.FormDestroy(Sender: TObject);
begin
  Objeto.ID_FOL_LIQUIDA.Control                         := nil;
  Objeto.DESC_BANCO.Control                             := nil;
  Objeto.NUM_CUENTA.Control                             := nil;
  Objeto.CVE_SUC_BANCO.Control                          := nil;
  Objeto.NOM_SUC_BANCO.Control                          := nil;
  Objeto.ID_PLAZA_BCO.Control                           := nil;
  Objeto.NOM_PLAZA_BANCO.Control                        := nil;

  Objeto.NOMBRE_BENEFICIA.Control                       := nil;
  Objeto.NOM_PLAZA_EXT.Control                          := nil;
  Objeto.ABA.Control                                    := nil;
  Objeto.FFC.Control                                    := nil;

  Objeto.CheqCte.Cuenta_Banco.Control                   := nil;
  Objeto.CheqCte.Nom_Plaza_Ext.Control                  := nil;
  Objeto.CheqCte.ABA.Control                            := nil;
  Objeto.CheqCte.FFC.Control                            := nil;
  Objeto.CheqCte.Intermediario.Nom_Corto_Interm.Control := nil;
  Objeto.CheqCte.CVE_SUC_BANCO.Control                  := nil;
  Objeto.CheqCte.NOM_SUC_BANCO.Control                  := nil;
  Objeto.CheqCte.ID_PLAZA.Control                       := nil;
  Objeto.CheqCte.NOM_PLAZA_BANCO.Control                := nil;

  Objeto.IMP_MOVTO.Control                              := nil;
  Objeto.ID_CONTRATO_DV.Control                         := nil;

  Objeto.CtrlCto.ID_CONTRATO.control                    := nil;
  Objeto.CtrlCto.TITNombre.Control                      := nil;

  Objeto.TX_COMENTARIO.Control                          := nil;
  Objeto.SIT_MOVTO.Control                              := nil;
  Objeto.CVE_VIA_LIQCION.Control                        := nil;

  Objeto.ViaLiquid.CVE_VIA_LIQCION.Control              := nil;
  Objeto.ViaLiquid.DESC_SISTEMA_LIQ.Control             := nil;

  Objeto.CVE_USUARIO.Control                            := nil;
  Objeto.F_OPERACION.Control                            := nil;
  Objeto.FH_REGISTRO.Control                            := nil;
  Objeto.ID_TRANSACCION.Control                         := nil;

  Objeto.FH_CANCELA.Control                             := nil;
  Objeto.CVE_USU_CANCELA.Control                        := nil;
  Objeto.ID_TESORERIA.Control                           := nil;
  Objeto.FOL_MOVTO_EFVO.Control                         := nil;
end;

procedure TWDvLiqChqra.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWDvLiqChqra.InterForma1DespuesNuevo(Sender: TObject);
begin edID_CONTRATO_DV.SetFocus;
      Objeto.Cve_Usuario.AsString  :=Objeto.Apli.Usuario;
      Objeto.Cve_Usuario.DrawControl;
      Objeto.F_OPERACION.AsDateTime:=Objeto.Apli.DameFechaEmpresa;
      Objeto.F_OPERACION.DrawControl;
      if Objeto.Id_Contrato <> 0 then
      begin
        if Objeto.CtrlCto.FindKey([Objeto.Id_Contrato]) then ValidaCto;
      end;
      if Objeto.Importe  <> -1 then Objeto.IMP_MOVTO.AsFloat:=Objeto.Importe;
end;

procedure TWDvLiqChqra.InterForma1DespuesModificar(Sender: TObject);
begin edID_CONTRATO_DV.SetFocus;
end;

procedure TWDvLiqChqra.InterLinkit1Capture(Sender: TObject;
  var Show: Boolean);
begin Show:=Interforma1.CanEdit;
end;

procedure TWDvLiqChqra.InterLinkit2Capture(Sender: TObject;
  var Show: Boolean);
begin Show:=Interforma1.CanEdit;
end;

procedure TWDvLiqChqra.InterLinkit1Ejecuta(Sender: TObject);
begin if Not Objeto.CtrlCto.Active
      then begin
             MessageDlg('Debe seleccionar un contrato',mtError,[mbOK],0);
             edID_CONTRATO_DV.SetFocus;
           end
      else begin
             Objeto.ViaLiquid.FilterString:='CVE_VIA_LIQCION IN (SELECT CVE_VIA_LIQCION FROM VIA_LIQ_EMPRESA WHERE ID_EMPRESA = ' + Objeto.CtrlCto.Id_Empresa.AsString + ' AND  Cve_Moneda = ' + Objeto.CtrlCto.Cve_Moneda.AsString + ')';
             Objeto.ViaLiquid.FindKey([InterLinkit1.Buffer]);
           end;
end;

procedure TWDvLiqChqra.InterLinkit2Ejecuta(Sender: TObject);
begin Objeto.CtrlCto.FilterString:='CONTRATO.CVE_TIP_CONTRATO  IN (''CDVI'',''BDVI'',''IDVI'') ';
      if Objeto.CtrlCto.FindKey([InterLinkit2.Buffer]) then
      begin
        if Not ( (Objeto.CtrlCto.Cve_Tip_Contrato.AsString = 'CDVI') or
                 (Objeto.CtrlCto.Cve_Tip_Contrato.AsString = 'BDVI') or
                 (Objeto.CtrlCto.Cve_Tip_Contrato.AsString = 'IDVI')
               )
        then begin
               MessageDlg('Debe seleccionar un contrato de depósitos a la vista',mtError,[mbOK],0);
               Objeto.CtrlCto.Active:=False;
             end
        else ValidaCto;
      end;
end;

procedure TWDvLiqChqra.ValidaCto;
Var Persona,Cuenta,Banco,ViaLiq : String;
begin Persona:=Objeto.CtrlCto.Id_Empresa.AsString;
      Cuenta:='';
      Banco:='';
      pnIfs.Visible:=False;
      pnBanco.Visible:=False;
      edId_Plaza_Banco.TEXT:='';
      edNOM_PLAZA_BANCO.TEXT:='';
      edCVE_SUC_BANCO.TEXT:='';
      edNOM_SUC_BANCO.TEXT:='';
      edNomPlazaExt.TEXT:='';
      edFfc.TEXT:='';
      edAba.TEXT:='';
      if Objeto.CtrlCto.Id_Empresa.AsInteger = cEmpifs
      then begin
             Cuenta:='';
             Banco :='';
             ViaLiq:=cViaIFSDef;
             Objeto.NUM_CUENTA.AsString:='0';
             Objeto.NUM_CUENTA.DrawControl;
             pnIfs.Visible:=True;
           end
      else if Objeto.CtrlCto.Id_Empresa.AsInteger = cEmpBancoDls
           then begin
                  Cuenta:=cCtaBDLDef;
                  Banco:=cBcoBDLDef;
                  ViaLiq:=cViaBDLDef;
                  pnIfs.Visible:=True;
                end
           else if Objeto.CtrlCto.Id_Empresa.AsInteger = cEmpBanco
                then begin
//                       ViaLiq:=cViaBCODef;
                       ViaLiq:='';
                       pnBanco.Visible:=True;
                       Objeto.Banco.BuscaWhereString:=
                         ' ID_INTERMEDIARIO IN (SELECT DISTINCT ID_INTERMEDIARIO FROM ' +
                         '                       VIA_LIQUIDACION VIA, ' +
                         '                       VIA_LIQ_EMPRESA LIQE ' +
                         '                       WHERE VIA.CVE_VIA_LIQCION = LIQE.CVE_VIA_LIQCION AND ' +
                         '                       LIQE.ID_EMPRESA = ' + Objeto.CtrlCto.Id_Empresa.AsString + ')';
                       Objeto.Banco.FilterString:=Objeto.Banco.BuscaWhereString;
                     end;
       Objeto.ViaLiquid.FindKey([ViaLiq]);
       if Cuenta <> '' then Objeto.CheqCte.FindKey([Persona,Banco,Cuenta]);
end;

procedure TWDvLiqChqra.BitBtn1Click(Sender: TObject);
begin 

// NUEVA VALIDACION DE ACCESOS A BOTONES.  AUTO OCT 2012
IF not ValidaAccesoEsp(objeto.apli, 'TDVLIQCHQR_BTN0',true, true) THEN EXIT;

  if Not Objeto.CtrlCto.Active
      then begin
             MessageDlg('Debe seleccionar un contrato',mtError,[mbOK],0);
             edID_CONTRATO_DV.SetFocus;
           end
      else begin
             Objeto.CheqCte.BuscaWhereString:='CHEQUERA_CTE.ID_PERSONA IN(SELECT DISTINCT ID_PERSONA FROM CONTRATANTE WHERE ID_CONTRATO = ' + Objeto.CtrlCto.ID_CONTRATO.AsString + ')';
             if Objeto.CheqCte.Busca
             then Objeto.ID_BANCO_CHQRA.AsInteger:=Objeto.CheqCte.Id_Banco_Chqra.AsInteger;
           end;
end;

procedure TWDvLiqChqra.ValidaBanco;
begin if Not Objeto.Banco.Active
      then begin
             edNomBanco.text:='';
             Objeto.ID_BANCO_CHQRA.AsString:='';
           end
      else begin
             edNomBanco.Text:=Objeto.Banco.Persona.Nombre.AsString;
             Objeto.ID_BANCO_CHQRA.AsInteger:=Objeto.Banco.Id_Intermediario.AsInteger;
           end;
end;

procedure TWDvLiqChqra.InterLinkit3Capture(Sender: TObject;
  var Show: Boolean);
begin Show:=Interforma1.CanEdit;
end;

procedure TWDvLiqChqra.InterLinkit3Ejecuta(Sender: TObject);
begin Objeto.Banco.FindKey([InterLinkit3.Buffer]);
end;

procedure TWDvLiqChqra.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin Realizado:=False;
      Objeto.GetFromControl;
      if LiqBloqueada(Objeto) then Exit;
      if Objeto.Modo <> moAppend then
      begin
         if Objeto.SIT_MOVTO.AsString = 'LQ'
         then Messagedlg('El movimiento ya fue liquidado y no se pueden aceptar los cambios',mtError,[mbOK],0)
         else Realizado:=True;
      end
      else begin
             if Not Objeto.CtrlCto.Active
             then Messagedlg('Debe seleccionar un contrato',mtError,[mbOK],0)
             else if Not Objeto.ViaLiquid.Active
                  then Messagedlg('Debe seleccionar una vía de liquidación',mtError,[mbOK],0)
                  else if Objeto.IMP_MOVTO.AsString = ''
                       then Messagedlg('Debe indicar un importe',mtError,[mbOK],0)
                       else if Objeto.NUM_CUENTA.AsString = ''
                            then Objeto.NUM_CUENTA.AsString:= '0'
//                            else Realizado:=True;
                            else if Not CtoBloqRet(Objeto)
                                 then Realizado:=True;
           end;
end;

procedure TWDvLiqChqra.InterForma1AntesModificar(Sender: TObject;
  var Realizado: Boolean);
begin Realizado:=False;
      if LiqBloqueada(Objeto) then Exit;
      if Objeto.SIT_MOVTO.AsString = 'LQ'
      then Messagedlg('El movimiento ya fue liquidado y no puede ser modificado',mtError,[mbOK],0)
      else Realizado:=True;
end;

procedure TWDvLiqChqra.InterForma1AntesNuevo(Sender: TObject;
  var Realizado: Boolean);
begin Realizado:=False;
      if LiqBloqueada(Objeto) then Exit;
      Realizado:=True;
end;

procedure TWDvLiqChqra.sbClienteClick(Sender: TObject);
begin 

// NUEVA VALIDACION DE ACCESOS A BOTONES.  AUTO OCT 2012
IF not ValidaAccesoEsp(objeto.apli, 'TDVLIQCHQR_BTN1',true, true) THEN EXIT;

  Objeto.CtrlCto.BuscaWhereString:='CONTRATO.CVE_TIP_CONTRATO IN (''CDVI'',''BDVI'',''IDVI'') ';
      if Objeto.CtrlCto.Busca
      then ValidaCto;
end;

procedure TWDvLiqChqra.bbViaLiqClick(Sender: TObject);
begin 

// NUEVA VALIDACION DE ACCESOS A BOTONES.  AUTO OCT 2012
IF not ValidaAccesoEsp(objeto.apli, 'TDVLIQCHQR_BTN2',true, true) THEN EXIT;

  if Not Objeto.CtrlCto.Active
      then begin
             MessageDlg('Debe seleccionar un contrato',mtError,[mbOK],0);
             edID_CONTRATO_DV.SetFocus;
           end
      else begin
             Objeto.ViaLiquid.BuscaWhereString:='CVE_VIA_LIQCION IN (SELECT CVE_VIA_LIQCION FROM VIA_LIQ_EMPRESA WHERE ID_EMPRESA = ' + Objeto.CtrlCto.Id_Empresa.AsString + ' AND  Cve_Moneda = ' + Objeto.CtrlCto.Cve_Moneda.AsString + ')';
             Objeto.ViaLiquid.Busca;
           end;
end;

procedure TWDvLiqChqra.bbBancoClick(Sender: TObject);
begin 

// NUEVA VALIDACION DE ACCESOS A BOTONES.  AUTO OCT 2012
IF not ValidaAccesoEsp(objeto.apli, 'TDVLIQCHQR_BTN3',true, true) THEN EXIT;

  if Objeto.Banco.Busca then ValidaBanco;
end;

procedure TWDvLiqChqra.edID_CONTRATO_DVExit(Sender: TObject);
Var Valido : Boolean;
begin if Salir or Interforma1.PreValidaExit(edID_CONTRATO_DV) then Exit;
      Valido:=Trim(edID_CONTRATO_DV.text)<>'';
      Interforma1.ValidaExit(edID_CONTRATO_DV,Valido,'Debe indicar un contrato',True);
end;

function TWDvLiqChqra.Salir:Boolean;
begin Salir:= (Interforma1.IsCancel) or
              (Objeto.Modo = moBrowse);
end;

procedure TWDvLiqChqra.edIMP_MOVTOExit(Sender: TObject);
Var Valido : Boolean;
begin if Salir or Interforma1.PreValidaExit(edIMP_MOVTO) then Exit;
      Valido:=Trim(edIMP_MOVTO.Text)<>'';
      Interforma1.ValidaExit(edIMP_MOVTO,Valido,'Debe indicar un monto',True);
end;

procedure TWDvLiqChqra.edCVE_VIA_LIQCIONExit(Sender: TObject);
Var Valido : Boolean;
begin if Salir or Interforma1.PreValidaExit(edCVE_VIA_LIQCION) then Exit;
      Valido:=Trim(edCVE_VIA_LIQCION.Text)<>'';
      Interforma1.ValidaExit(edCVE_VIA_LIQCION,Valido,'Debe indicar una clave de liquidación',True);
end;

procedure TWDvLiqChqra.edTX_COMENTARIOExit(Sender: TObject);
begin if Salir or Interforma1.PreValidaExit(edTX_COMENTARIO) then Exit;
      Interforma1.ValidaExit(edTX_COMENTARIO,True,'',True);
end;

procedure TWDvLiqChqra.edNomPersonaExit(Sender: TObject);
begin if Salir or Interforma1.PreValidaExit(edNomPersona) then Exit;
      Interforma1.ValidaExit(edNomPersona,True,'',True);
end;

procedure TWDvLiqChqra.edNUM_CUENTAExit(Sender: TObject);
begin if Salir or Interforma1.PreValidaExit(edNUM_CUENTA) then Exit;
      Interforma1.ValidaExit(edNUM_CUENTA,True,'',True);
end;

procedure TWDvLiqChqra.edNomBancoExit(Sender: TObject);
begin if Salir or Interforma1.PreValidaExit(edNomBanco) then Exit;
      Interforma1.ValidaExit(edNomBanco,True,'',True);
end;

procedure TWDvLiqChqra.edId_Plaza_BancoExit(Sender: TObject);
begin if Salir or Interforma1.PreValidaExit(edId_Plaza_Banco) then Exit;
      Interforma1.ValidaExit(edId_Plaza_Banco,True,'',True);
end;

procedure TWDvLiqChqra.edNOM_PLAZA_BANCOExit(Sender: TObject);
begin if Salir or Interforma1.PreValidaExit(edNOM_PLAZA_BANCO) then Exit;
      Interforma1.ValidaExit(edNOM_PLAZA_BANCO,True,'',True);
end;

procedure TWDvLiqChqra.edCVE_SUC_BANCOExit(Sender: TObject);
begin if Salir or Interforma1.PreValidaExit(edCVE_SUC_BANCO) then Exit;
      Interforma1.ValidaExit(edCVE_SUC_BANCO,True,'',True);
end;

procedure TWDvLiqChqra.edNOM_SUC_BANCOExit(Sender: TObject);
begin if Salir or Interforma1.PreValidaExit(edNOM_SUC_BANCO) then Exit;
      Interforma1.ValidaExit(edNOM_SUC_BANCO,True,'',True);
end;

procedure TWDvLiqChqra.edNomPlazaExtExit(Sender: TObject);
begin if Salir or Interforma1.PreValidaExit(edNomPlazaExt) then Exit;
      Interforma1.ValidaExit(edNomPlazaExt,True,'',True);
end;

procedure TWDvLiqChqra.edFfcExit(Sender: TObject);
begin if Salir or Interforma1.PreValidaExit(edFfc) then Exit;
      Interforma1.ValidaExit(edFfc,True,'',True);
end;

procedure TWDvLiqChqra.edAbaExit(Sender: TObject);
begin if Salir or Interforma1.PreValidaExit(edAba) then Exit;
      Interforma1.ValidaExit(edAba,True,'',True);
end;

procedure TWDvLiqChqra.sbCapturaRfcClick(Sender: TObject);
var vlRFC,vlIva2 : String;
    vlIVA        : Double;
begin 

// NUEVA VALIDACION DE ACCESOS A BOTONES.  AUTO OCT 2012
IF not ValidaAccesoEsp(objeto.apli, 'TDVLIQCHQR_BTN4',true, true) THEN EXIT;

 
  Execute_RFCIVA(vlRFC,vlIVA,vlIva2,Objeto);
  Objeto.TX_INF_FISCAL.AsString := vlIva2;
end;

procedure TWDvLiqChqra.gbDatosMovtoExit(Sender: TObject);
  function BuscaFlagRFC: Boolean;
    var vlSql : tQuery;
  begin
    vlSql := tQuery.Create(nil);
    vlSql.DatabaseName := Objeto.DataBaseName;
    vlSql.SessionName  := Objeto.SessionName;
    BuscaFlagRFC := True;
    Try
      vlSql.SQL.Text := ' SELECT * FROM DV_OPERACION,VIA_LIQUIDACION WHERE CVE_VIA_LIQCION = ' + #39 + edCVE_VIA_LIQCION.Text + #39 +
                        ' AND VIA_LIQUIDACION.CVE_OPER_DV = DV_OPERACION.CVE_OPERACION ' +
                        ' AND B_INF_FISCAL = ' + #39 + 'V' + #39;
      vlSql.Open;
      if vlSql.Eof then BuscaFlagRfc := false;
    Finally vlSql.Free;
    end;
  end;
begin
  sbCapturaRfc.Enabled := BuscaFlagRFC;
end;

end.
