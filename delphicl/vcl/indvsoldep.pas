//******************************************************************************
// Sistema         : Clase TDVSolDepo
// Fecha de Inicio : 22/03/2000
// Función forma   : Clase de Solicitides de depósito
// Diseñado por    : Marcos Zárate Castro.
//******************************************************************************
Unit InDVSolDep;
interface
uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,IntFrm,DB,
DbTables,Mask,StdCtrls,Buttons,ExtCtrls,InterFor,IntFind,UnSQL2,InterFun,ComCtrls,
IntDtPk, IntCtoHeader, Grids,Wwdbigrd,Wwdbgrid, Wwquery, Wwdatsrc,UnConDV,
Ungene, DBCtrls,InterEdit, IntLinkit, IntSGCtrl , IntDvOperaci, IntTesInsOp;

Type
 TDVSolDepo= class;
  TWDVSolDep=Class(TForm)
    gbSeleccion: TGroupBox;
    lbID_CONTRATO: TLabel;
    edTitular: TEdit;
    p: TBitBtn;
    edID_CONTRATO: TInterEdit;
    Label3: TLabel;
    edCVE_OPERACION: TEdit;
    bbOperacion: TBitBtn;
    edDesc_Operacion: TEdit;
    InterForma1: TInterForma;
    iedImporte: TInterEdit;
    Label4: TLabel;
    InterLinkit1: TInterLinkit;
    InterLinkit2: TInterLinkit;
    lbTX_COMENTARIO: TLabel;
    edTX_COMENTARIO: TEdit;
    gbGenerales: TGroupBox;
    lbID_TRANSACCION: TLabel;
    lbSIT_MOVTO: TLabel;
    edID_TRANS_DV: TEdit;
    cbCVE_SIT_TRANS: TComboBox;
    Label1: TLabel;
    edCVE_USU_AUTORIZA: TEdit;
    lbID_FOL_LIQUIDA: TLabel;
    edID_FOL_DEPOSITO: TEdit;
    edFH_REGISTRO: TEdit;
    lbFH_REGISTRO: TLabel;
    lbF_OPERACION: TLabel;
    edFH_AUTORIZA: TEdit;
    edCVE_USUAR_ALTA: TEdit;
    lbCVE_USUARIO: TLabel;
    Label2: TLabel;
    edId_Tesoreria: TEdit;
    edFol_Movto_Efvo: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    edFH_Cancela: TEdit;
    edCve_Usu_Cancela: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    edCve_Instrumento: TEdit;
    bbInstrumento: TBitBtn;
    edDesc_Instrumento: TEdit;
    InterLinkit3: TInterLinkit;
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure pClick(Sender: TObject);
    procedure ValidaCto;
    procedure bbOperacionClick(Sender: TObject);
    procedure InterLinkit1Capture(Sender: TObject; var Show: Boolean);
    procedure InterLinkit1Ejecuta(Sender: TObject);
    procedure InterLinkit2Capture(Sender: TObject; var Show: Boolean);
    procedure InterLinkit2Ejecuta(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure bbInstrumentoClick(Sender: TObject);
    procedure InterLinkit3Capture(Sender: TObject; var Show: Boolean);
    procedure InterLinkit3Ejecuta(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto      : TDVSolDepo;
 end;
 TDVSolDepo = class(TInterFrame)
      private
      protected
      public
        { Public declarations }
        ID_FOL_DEPOSITO          : TInterCampo;
        ID_CONTRATO              : TInterCampo;
        IMP_TRANS                : TInterCampo;
        CVE_SIT_TRANS            : TInterCampo;
        CVE_USUAR_ALTA           : TInterCampo;
        FH_REGISTRO              : TInterCampo;
        CVE_USU_AUTORIZA         : TInterCampo;
        CVE_OPERACION            : TInterCampo;
        TX_COMENTARIO            : TInterCampo;
        FH_AUTORIZA              : TInterCampo;
        ID_TRANS_DV              : TInterCampo;
        ID_TESORERIA             : TInterCampo;
        FOL_MOVTO_EFVO           : TInterCampo;
        FH_CANCELA               : TInterCampo;
        CVE_USU_CANCELA          : TInterCampo;
        CVE_INSTRUMENTO          : TInterCampo;

        Contrato                 : TCtrlCto;
        Operacion                : TDvOperaci;
        TesInsOp                 : TTesInsOp;
        id_Cto_Nuevo             : Integer;
        procedure   databasechange;override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    InternalBusca:Boolean;override;
        function    InternalPost:Boolean; override;
        function    GenSolicDepo:Boolean;
      published
      end;

implementation

{$R *.DFM}

constructor TDVSolDepo.Create( AOwner : TComponent );
begin Inherited;
      ID_FOL_DEPOSITO :=CreaCampo('ID_FOL_DEPOSITO',ftFloat,tsNinguno,tsNinguno,True);
                ID_FOL_DEPOSITO.Caption:='Número de Fol Deposito';
      ID_CONTRATO :=CreaCampo('ID_CONTRATO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CONTRATO.Caption:='Número de Contrato';
      IMP_TRANS :=CreaCampo('IMP_TRANS',ftFloat,tsNinguno,tsNinguno,True);
                IMP_TRANS.Caption:='Imp Trans';
      CVE_SIT_TRANS :=CreaCampo('CVE_SIT_TRANS',ftString,tsNinguno,tsNinguno,True);
      with  CVE_SIT_TRANS do
      begin
         Size:=2;
         Caption:='Clave de Situación Trans';
         UseCombo:=True;
         ComboDatos.Add('NP'); ComboLista.Add('No Procesado');
         ComboDatos.Add('AU'); ComboLista.Add('Autorizado');
         ComboDatos.Add('CA'); ComboLista.Add('Cancelado');
      end;
      CVE_USUAR_ALTA :=CreaCampo('CVE_USUAR_ALTA',ftString,tsNinguno,tsNinguno,True);
        CVE_USUAR_ALTA .Size:=8;
                CVE_USUAR_ALTA.Caption:='Clave de Usuario Alta';
      FH_REGISTRO :=CreaCampo('FH_REGISTRO',ftDateTime,tsNinguno,tsNinguno,True);
                FH_REGISTRO.Caption:='Fecha y Hora Registro';
      CVE_USU_AUTORIZA :=CreaCampo('CVE_USU_AUTORIZA',ftString,tsNinguno,tsNinguno,True);
        CVE_USU_AUTORIZA .Size:=8;
                CVE_USU_AUTORIZA.Caption:='Clave de Usu Autoriza';
      CVE_OPERACION :=CreaCampo('CVE_OPERACION',ftString,tsNinguno,tsNinguno,True);
        CVE_OPERACION .Size:=6;
                CVE_OPERACION.Caption:='Clave de Operacion';
      TX_COMENTARIO :=CreaCampo('TX_COMENTARIO',ftString,tsNinguno,tsNinguno,True);
                TX_COMENTARIO.Caption:='Comentario';
      FH_AUTORIZA :=CreaCampo('FH_AUTORIZA',ftDateTime,tsNinguno,tsNinguno,True);
                FH_AUTORIZA.Caption:='Fecha y Hora Autoriza';
      ID_TRANS_DV :=CreaCampo('ID_TRANS_DV',ftFloat,tsNinguno,tsNinguno,True);
                ID_TRANS_DV.Caption:='Número de Trans Dv';

      ID_TESORERIA:=CreaCampo('ID_TESORERIA',ftFloat,tsNinguno,tsNinguno,True);
                ID_TESORERIA.Caption:='Número de Tesorería';

      FOL_MOVTO_EFVO:=CreaCampo('FOL_MOVTO_EFVO',ftFloat,tsNinguno,tsNinguno,True);
                FOL_MOVTO_EFVO.Caption:='Movimiento de Tesorería';

      FH_CANCELA :=CreaCampo('FH_CANCELA',ftDateTime,tsNinguno,tsNinguno,True);
                FH_CANCELA.Caption:='Fecha y Hora Cancelación';

      CVE_USU_CANCELA :=CreaCampo('CVE_USU_CANCELA',ftString,tsNinguno,tsNinguno,True);
        CVE_USU_CANCELA.Size:=8;
                CVE_USU_CANCELA.Caption:='Clave de Usu Cancela';
      CVE_INSTRUMENTO :=CreaCampo('CVE_INSTRUMENTO',ftString,tsNinguno,tsNinguno,True);
        CVE_INSTRUMENTO.Size:=6;


      FKeyFields.Add('ID_FOL_DEPOSITO');

      Contrato := TCtrlCto.Create(Self);
      Contrato.MasterSource:=Self;
      Contrato.ID_CONTRATO.MasterField:='ID_CONTRATO';

      Operacion:= TDvOperaci.Create(Self);
      Operacion.MasterSource:=Self;
      Operacion.CVE_OPERACION.MasterField:='CVE_OPERACION';


      TesInsOp  := TTesInsOp.Create(Self);
      TesInsOp.MasterSource:=Self;
      TesInsOp.CVE_INSTRUMENTO.MasterField:='CVE_INSTRUMENTO';

      TableName := 'DV_SOL_DEPOSITO';
      UseQuery := True;
      id_Cto_Nuevo:=-1;
end;

Destructor TDVSolDepo.Destroy;
begin if Contrato  <> Nil then Contrato.free;
      if Operacion <> Nil then Operacion.free;
      if TesInsOp  <> Nil then TesInsOp.free;
      inherited;
end;

function TDVSolDepo.GenSolicDepo:Boolean;
Var spCorpo : TStoredProc;
begin GenSolicDepo:=False;
      GetFromControl;
      spCorpo := TStoredProc.Create(Nil);
      try
      spCorpo.DatabaseName  :=Databasename;
      spCorpo.SessionName   :=SessionName;
      spCorpo.StoredProcName:='PKGDPVISTA.STPGENSOLICDEPO';

      { Prepara }
      spCorpo.Params.Clear;
      spCorpo.Params.CreateParam(ftFloat,  'PID_FOL_DEPOSITO', ptInputOutput);
      spCorpo.Params.CreateParam(ftFloat,  'PID_CONTRATO',     ptInput);
      spCorpo.Params.CreateParam(ftFloat,  'PIMP_TRANS',       ptInput);
      spCorpo.Params.CreateParam(ftString, 'PCVE_OPERACION',   ptInput);
      spCorpo.Params.CreateParam(ftString, 'PCVE_USUAR_ALTA',  ptInput);
      spCorpo.Params.CreateParam(ftString, 'PTX_COMENTARIO',   ptInput);
      spCorpo.Params.CreateParam(ftString, 'PCVE_INSTRUMENTO',  ptInput);
      spCorpo.Params.CreateParam(ftInteger,'PCodResp',         ptOutput);
      spCorpo.Params.CreateParam(ftString, 'Pdesc_proceso',    ptOutput);
      spCorpo.Params.CreateParam(ftString, 'PBCommRollb',      ptInput);

      //Envía los datos de entrada
      spCorpo.ParamByName('PID_CONTRATO').AsFloat      :=ID_CONTRATO.AsFloat;
      spCorpo.ParamByName('PIMP_TRANS').AsFloat        :=IMP_TRANS.AsFloat;
      spCorpo.ParamByName('PCVE_OPERACION').AsString   :=CVE_OPERACION.AsString;
      spCorpo.ParamByName('PCVE_USUAR_ALTA').AsString  :=CVE_USUAR_ALTA.AsString;
      spCorpo.ParamByName('PTX_COMENTARIO').AsString   :=TX_COMENTARIO.AsString;
      spCorpo.ParamByName('PCVE_INSTRUMENTO').AsString :=CVE_INSTRUMENTO.AsString;

      spCorpo.ExecProc;

      if spCorpo.ParamByName('pCodResp').AsInteger <> 0
      then begin
             MessageDlg('Ocurrió un error al grabar la solicitud de depósito : ' +
                        spCorpo.ParamByName('pdesc_proceso').AsString,mtError,[mbOK],0)
           end
      else begin
             GenSolicDepo:=True;
             ID_FOL_DEPOSITO.AsFloat:=spCorpo.ParamByName('PID_FOL_DEPOSITO').AsFloat;
           end;
      finally if spCorpo <> nil then spCorpo.free;
      end;
end;

function TDVSolDepo.internalPost:Boolean;
begin if Modo = moAppend
      then InternalPost:= GenSolicDepo
      else InternalPost:= inherited InternalPost;
end;

procedure TDVSolDepo.databasechange;
begin inherited;
      Contrato.GetParams(Self);
      Operacion.GetParams(Self);
end;

Function TDVSolDepo.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('IDvSoDe.it','F');
      Try if Active then begin T.Param(0,ID_FOL_DEPOSITO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

function TDVSolDepo.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWDVSolDep;
begin W:=TWDVSolDep.Create(Self);
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

(********************************************************************************)
(*                               F  O  R  M  A                                  *)
(*                                                                              *)
(********************************************************************************)

procedure TWDVSolDep.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWDVSolDep.FormShow(Sender: TObject);
begin Objeto.ID_FOL_DEPOSITO.Control:=edID_FOL_DEPOSITO;
      Objeto.ID_CONTRATO.Control:=edID_CONTRATO;
      Objeto.Contrato.ID_CONTRATO.Control:=edID_CONTRATO;
      Objeto.Contrato.TITNombre.Control:=edTitular;
      Objeto.IMP_TRANS.Control:=iedImporte;
      Objeto.CVE_SIT_TRANS.Control:=cbCVE_SIT_TRANS;
      Objeto.CVE_USUAR_ALTA.Control:=edCVE_USUAR_ALTA;
      Objeto.FH_REGISTRO.Control:=edFH_REGISTRO;
      Objeto.CVE_USU_AUTORIZA.Control:=edCVE_USU_AUTORIZA;
      Objeto.CVE_OPERACION.Control:=edCVE_OPERACION;
      Objeto.Operacion.CVE_OPERACION.Control:=edCVE_OPERACION;
      Objeto.Operacion.DESC_L_ID_PRIM.Control:=edDesc_Operacion;
      Objeto.TX_COMENTARIO.Control:=edTX_COMENTARIO;
      Objeto.FH_AUTORIZA.Control:=edFH_AUTORIZA;
      Objeto.ID_TRANS_DV.Control:=edID_TRANS_DV;
      Objeto.ID_TESORERIA.Control:=edId_Tesoreria;
      Objeto.FOL_MOVTO_EFVO.Control:=edFol_Movto_Efvo;
      Objeto.CVE_USU_CANCELA.Control:=edCve_Usu_Cancela;
      Objeto.FH_CANCELA.Control:=edFH_Cancela;
      Objeto.CVE_INSTRUMENTO.Control:=edCve_Instrumento;
      Objeto.TesInsOp.DESC_L_ID_PRIM.Control:=edDesc_Instrumento;
      Objeto.FilterString    :='(CVE_USUAR_ALTA = ''' + Objeto.apli.Usuario + ''' OR CVE_USU_AUTORIZA = ''' + Objeto.apli.Usuario + ''') ';
      Objeto.BuscaWhereString:=Objeto.FilterString;
      Objeto.Operacion.FilterString:='B_APL_TESOR =''V'' AND CVE_AF_SDO_EFE = ''I''';
      Objeto.Operacion.BuscaWhereString:=Objeto.Operacion.FilterString;
      Objeto.TesInsOp.FilterString:='B_APLICA_DVISTA =''V''';
      Objeto.TesInsOp.BuscaWhereString:=Objeto.TesInsOp.FilterString;
      Objeto.Contrato.BuscaWhereString:='contrato.CVE_TIP_CONTRATO = ''CDVI''';
      Objeto.Contrato.FilterString:=Objeto.Contrato.BuscaWhereString;
end;

procedure TWDVSolDep.FormHide(Sender: TObject);
begin Objeto.ID_FOL_DEPOSITO.Control:=nil;
      Objeto.ID_CONTRATO.Control:=nil;
      Objeto.Contrato.ID_CONTRATO.Control:=nil;
      Objeto.Contrato.TITNombre.Control:=nil;
      Objeto.IMP_TRANS.Control:=nil;
      Objeto.CVE_SIT_TRANS.Control:=nil;
      Objeto.CVE_USUAR_ALTA.Control:=nil;
      Objeto.FH_REGISTRO.Control:=nil;
      Objeto.CVE_USU_AUTORIZA.Control:=nil;
      Objeto.CVE_OPERACION.Control:=nil;
      Objeto.Operacion.CVE_OPERACION.Control:=nil;
      Objeto.Operacion.DESC_L_ID_PRIM.Control:=nil;
      Objeto.TX_COMENTARIO.Control:=nil;
      Objeto.FH_AUTORIZA.Control:=nil;
      Objeto.ID_TRANS_DV.Control:=nil;
      Objeto.ID_TESORERIA.Control:=nil;
      Objeto.FOL_MOVTO_EFVO.Control:=nil;
      Objeto.CVE_USU_CANCELA.Control:=nil;
      Objeto.FH_CANCELA.Control:=nil;
      Objeto.CVE_INSTRUMENTO.Control:=nil;
      Objeto.TesInsOp.DESC_L_ID_PRIM.Control:=nil;
end;

procedure TWDVSolDep.ValidaCto;
begin if Objeto.Contrato.Cve_Tip_Contrato.AsString <> cCDVIBco then
      begin
        Objeto.Contrato.Active:=False;
        Messagedlg('Solo puede operar contratos de depósitos a la vista del banco',mtError,[mbOK],0);
      end;
end;

procedure TWDVSolDep.pClick(Sender: TObject);
begin if Objeto.Contrato.Busca then ValidaCto;
end;

procedure TWDVSolDep.bbOperacionClick(Sender: TObject);
begin if Not Objeto.Contrato.Active
      then begin
             MessageDlg('Debe seleccionar un contrato',mtError,[mbOK],0);
             edID_CONTRATO.Setfocus;
           end
      else Objeto.Operacion.Busca;
end;


procedure TWDVSolDep.InterLinkit1Capture(Sender: TObject;
  var Show: Boolean);
begin Show:=Interforma1.CanEdit
end;

procedure TWDVSolDep.InterLinkit1Ejecuta(Sender: TObject);
begin if Objeto.Contrato.FindKey([InterLinkit1.Buffer]) then ValidaCto;
end;

procedure TWDVSolDep.InterLinkit2Capture(Sender: TObject;
  var Show: Boolean);
begin Show:=Interforma1.CanEdit
end;

procedure TWDVSolDep.InterLinkit2Ejecuta(Sender: TObject);
begin if Not Objeto.Contrato.Active
      then begin
             MessageDlg('Debe seleccionar un contrato ',mtError,[mbOK],0);
             edID_CONTRATO.Setfocus;
           end;
end;

procedure TWDVSolDep.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin Realizado:=False;
      Objeto.GetFromControl;
      if Not Objeto.Contrato.Active then
      begin
        MessageDlg('Debe seleccionar un contrato',mtError,[mbOK],0);
        Exit;
      end;
      if Objeto.IMP_TRANS.AsFloat = 0 then
      begin
        MessageDlg('Debe indicar un importe',mtError,[mbOK],0);
        Exit;
      end;

      if Not Objeto.Operacion.Active then
      begin
        MessageDlg('Debe seleccionar una operación',mtError,[mbOK],0);
        Exit;
      end;

      if Objeto.CVE_USUAR_ALTA.AsString ='' then
      begin
        MessageDlg('No se ha especificado el usuario que da de alta la solicitud',mtError,[mbOK],0);
        Exit;
      end;
      Realizado:=True;
end;

procedure TWDVSolDep.InterForma1DespuesNuevo(Sender: TObject);
begin Objeto.CVE_USUAR_ALTA.AsString:=Objeto.Apli.Usuario;
      Objeto.CVE_SIT_TRANS.AsString:='NP';
      if Objeto.id_Cto_Nuevo <> -1
      then begin
             Objeto.Contrato.FindKey([Objeto.id_Cto_Nuevo]);
             edCVE_OPERACION.setfocus;
           end
      else edID_CONTRATO.SetFocus;
end;

procedure TWDVSolDep.bbInstrumentoClick(Sender: TObject);
begin Objeto.TesInsOp.Busca;
end;

procedure TWDVSolDep.InterLinkit3Capture(Sender: TObject;
  var Show: Boolean);
begin Show:=Interforma1.CanEdit;
end;

procedure TWDVSolDep.InterLinkit3Ejecuta(Sender: TObject);
begin
Objeto.TesInsOp.FindKey([InterLinkit3.Buffer]);
end;

end.
