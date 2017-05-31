//------------------------------------------------------------------------------
// Función    : Solicitud de Relacion (Chequera - Contrato)
// Desarrollo : Cesar Zamora Ramirez
// Fecha      : 11 de Abril del 2011
//------------------------------------------------------------------------------
{
   Desarrollo  : Omar Sosa Aguilar (MACO)
   Fecha       : 22 de Julio de 2016
   Descripcion : Se agrego procedimiento para poder refrescar y mostrar la
                 informacion de "Situación de envío" y "Datos de la Chequera".

}
unit IntChCteCtoSol;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntFind,
  UnSQL2, InterFun, ComCtrls, DBCtrls, Menus, Ungene, IntCtto, IntCtte,
  IntDtPk, Grids, DBGrids, IntChCte, IntPzaCo, IntPzaBan;

const WM_DESPUESSHOW=WM_USER+1;
      coCRLF      = #13#10;

type
  TSolCheCto  = class;
  TwChCteCtoSol = class(TForm)
    BitBtn1: TBitBtn;
    Label8: TLabel;
    Label11: TLabel;
    dbgCheq: TDBGrid;
    dbnCheq: TDBNavigator;
    dbnContratante: TDBNavigator;
    PanelCheqCto: TPanel;
    PopupChequera: TPopupMenu;
    CatalogoPersona: TMenuItem;
    Label3: TLabel;
    Label5: TLabel;
    edAba: TEdit;
    edFfc: TEdit;
    edIdPersona: TEdit;
    edNombrePersona: TEdit;
    edIdBancoChqra: TEdit;
    Label13: TLabel;
    Label15: TLabel;
    dbgContratante: TDBGrid;
    InterForma1: TInterForma;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label10: TLabel;
    edIdPlaza: TEdit;
    Label12: TLabel;
    edNombrePlaza: TEdit;
    edNomPlazaExt: TEdit;
    Label6: TLabel;
    Label9: TLabel;
    edNomPlazaBanco: TEdit;
    edCveSucBanco: TEdit;
    edNomSucBanco: TEdit;
    PopupPlaza: TPopupMenu;
    CatalogoPlaza: TMenuItem;
    Panel1: TPanel;
    lbColonia: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Label7: TLabel;
    Label14: TLabel;
    edNombreBeneficiario: TEdit;
    Label16: TLabel;
    edRFCBeneficiario: TEdit;
    btnAutorizar: TButton;
    btnActivar: TButton;
    lEtqSituacion: TLabel;
    lSituacion: TLabel;
    Label17: TLabel;
    dbgRecep: TDBGrid;
    edNombreIntermediario: TEdit;
    bbCheq: TBitBtn;
    edCuentaBanco: TEdit;
    edIdContrato: TEdit;
    lSituacionRecep: TLabel;
    dbnRecep: TDBNavigator;

    function  PermisoEnCambioDeStatus : String;
    procedure ValidaPermiso;
    procedure ValidaPermisoRecep;
    function  Modifica_SolicitudCheqCteCto (pSituacion : String) : Integer;
    function  Elimina_SolicitudCheqCteCto : Integer;

    function  Modifica_SolCheqCteCtoRecep (pSituacion : String) : Integer;
    function  Elimina_SolCheqCteCtoRecep : Integer;


    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1Buscar(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure CatalogoPersonaClick(Sender: TObject);
    procedure bbCheqClick(Sender: TObject);
    procedure CatalogoPlazaClick(Sender: TObject);
    procedure CatalogoPlazaBanClick(Sender: TObject);
    procedure btnAutorizarClick(Sender: TObject);
    procedure btnActivarClick(Sender: TObject);
    procedure InterForma1Eliminar(Sender: TObject; var Realizado: Boolean);
    procedure InterForma1AntesEliminar(Sender: TObject;
      var Realizado: Boolean);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure dbgCheqCellClick(Column: TColumn);
    procedure dbgRecepCellClick(Column: TColumn);
    procedure InterForma1BtnEliminar(Sender: TObject);
    procedure PanelCheqCtoClick(Sender: TObject);
    procedure InterForma1BtnBuscarClick(Sender: TObject);
  private
  public
    Objeto: TSolCheCto;
    procedure DespuesShow(var Msg:TMessage);   message WM_DESPUESSHOW;
  end;



  TSolCheCto = class(TInterFrame)
  private
    FContrato      : TContrato;
	 FPanelCheqCto  : TPanel;
  protected
    procedure SetContrato(Cto:TContrato);
  public
    Id_Contrato    : TInterCampo;
    Id_Persona     : TInterCampo;
    Id_Banco_Chqra : TInterCampo;
    Cuenta_Banco   : TInterCampo;
    Sit_Solicitud  : TInterCampo;

    SITUACION      : TInterCampo;

    Cheq 	   : TCheqCte;
    Contratante    : TCtte;
    ContratoPadre  : TContrato;

    QCheqCto	    : TQuery;
    QRelRecep	    : TQuery;

    dsCtte	    : TDataSource;
    dsCheqCto	    : TDataSource;
    dsRelRecep	    : TDataSource;

    constructor    Create( AOwner : TComponent ); override;
    destructor     Destroy; override;
    function       ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

    procedure      dsCtteDataChange(Sender: TObject; Field: TField);
    procedure      dsCheqCtoDataChange(Sender: TObject; Field: TField);
    procedure      dsRelRecepDataChange(Sender: TObject; Field: TField);

    procedure      RefrescaQCheqCto;
    Procedure      DataBaseChange; override;

    //MACO - SOAO4503 (22/JULIO/2016)
    //PROCEDIMIENTO PARA DESPLEGAR LOS DATOS DEL CONTRATO AUTOMATICAMENTE
    Procedure      MuestraSitEnv_DatChe();
    //PROCEDIMIENTO PARA BUSCAR CONTRATOS
    Procedure      BuscaContrato();
    //PROCEDIMIENTO PARA LIMPIAR LA INFORMACION QUE SE ESTA MOSTRANDO DE FORMA AUTOMATICA
    Procedure LimpiaDatos();
  published
    property       Contrato : TContrato Read FContrato Write SetContrato;
  end;

var
  Ventana         : TwChCteCtoSol;
  vgIdContrato    : Integer;
  vltmpsit, vlsql, vlmodo : string;

implementation
uses RepChCteCtoSol;
   {$R *.DFM}

constructor TSolCheCto.Create( AOwner : TComponent );
begin
   Inherited;

   Id_Contrato	     := CreaCampo('ID_CONTRATO',    ftInteger, tsNinguno, tsNinguno, True);
   Id_Persona	     := CreaCampo('ID_PERSONA',     ftInteger, tsNinguno, tsNinguno, True);
   Id_Banco_Chqra    := CreaCampo('ID_BANCO_CHQRA', ftInteger, tsNinguno, tsNinguno, True);
   Cuenta_Banco	     := CreaCampo('CUENTA_BANCO',   ftString,  tsNinguno, tsNinguno, True);
   Cuenta_Banco.Size := 20;
   Sit_Solicitud     := CreaCampo('SIT_SOLICITUD',  ftString,  tsNinguno, tsNinguno, True);

   SITUACION         := CreaCampo('SITUACION',  ftString,  tsNinguno, tsNinguno, False);

   Cheq              := TCheqCte.Create(self);
   Cheq.ShowAll      := True;
   Cheq.MasterSource := Self;
   Cheq.FieldByName('ID_PERSONA').MasterField     := 'ID_PERSONA';
   Cheq.FieldByName('ID_BANCO_CHQRA').MasterField := 'ID_BANCO_CHQRA';
   Cheq.FieldByName('CUENTA_BANCO').MasterField   := 'CUENTA_BANCO';

   Contratante   := TCtte.Create(Self);
   FContrato     := nil;
   FPanelCheqCto := nil;

   ContratoPadre              := TContrato.Create(Self);
   ContratoPadre.MasterSource := Self;

   dsCtte                 := TDataSource.Create(Self);
   dsCheqCto              := TDataSource.Create(Self);
   dsRelRecep             := TDataSource.Create(Self);

   dsCtte.OnDataChange     := dsCtteDataChange;
   dsCheqCto.OnDataChange  := dsCheqCtoDataChange;
   dsRelRecep.OnDataChange := dsRelRecepDataChange;

   UseQuery  := True;
   qCheqCto  := nil;
   QRelRecep := nil;

   TableName := 'CHEQ_CTE_CTO_SOL';
   FKeyFields.Add('ID_CONTRATO');
   FKeyFields.Add('ID_PERSONA');
   FKeyFields.Add('ID_BANCO_CHQRA');
   FKeyFields.Add('CUENTA_BANCO');
end;

procedure TSolCheCto.DataBaseChange;
begin
   inherited;
   ContratoPadre.GetParams(Self);
   Contratante.GetParams(Self);
end;

destructor TSolCheCto.Destroy;
begin
   if qCheqCto    <> nil then     qCheqCto.Free;
   if QRelRecep   <> nil then     QRelRecep.Free;
   if Contratante <> nil then     Contratante.Free;
   if Cheq        <> nil then     cheq.Free;
   inherited;
end;

function TSolCheCto.ShowWindow(FormaTipo : TFormaTipo):Integer;
var
   W : TwChCteCtoSol;
begin
   W := TwChCteCtoSol.Create(Self);
   try
      W.Objeto                 := Self;
      W.InterForma1.InterFrame := Self;
      W.InterForma1.FormaTipo  := FormaTipo;

      //W.InterForma1.ShowBtnBuscar    := False;
      //MACO - SOAO4503
      W.InterForma1.ShowBtnBuscar    := True;

      W.InterForma1.ShowBtnModificar := False;
      W.InterForma1.ShowBtnAyuda     := False;
      W.InterForma1.ShowGrid         := False;
      W.InterForma1.ShowNavigator    := False;
      W.InterForma1.Funcion          := FInterFun;
      Ventana                        := W;

      if trim(Ventana.PermisoEnCambioDeStatus) = '' then
      begin
         W.InterForma1.ShowBtnNuevo    := False;
         W.InterForma1.ShowBtnEliminar := False;
         W.InterForma1.ShowBtnAceptar  := False;
         W.InterForma1.ShowBtnCancelar := False;
      end;

      ContratoPadre.Busca;
      if ContratoPadre.Active then
      begin
         vgIdContrato := ContratoPadre.Id_Contrato.AsInteger;
         GetParams(ContratoPadre);
         Contrato     := ContratoPadre;
         W.InterForma1.ShowModal;
         ShowWindow   := W.InterForma1.ModalResult;
      end;
   finally
      W.Free;
   end;
end;

procedure TSolCheCto.SetContrato(Cto : TContrato);
begin
   FContrato:=Cto;
   if (Cto <> nil) and (Cto.Producto.Cve_Per_Jur_Prod.AsString = 'PM') then
      Contratante.FilterBy := fbTCtteTitular
   else
      Contratante.FilterBy := fbTCtteCtteCtto;
   Contratante.Contrato := Cto;
   if Cto <> nil then
      dsCtte.DataSet := Contratante.QContratante
   else
      Active := False;
end;

function TwChCteCtoSol.PermisoEnCambioDeStatus : String;
var
   Qry        : TQuery;
   vResultado : String;
begin
   vResultado := '';
   try
      Qry := GetSQLQuery('SELECT CVE_OPER_ACC '
                       + '  FROM SECU_OPER_ACC '
                       + ' WHERE CVE_FUNCION  = ''CLASE_' + UpperCase(objeto.ClassName) + ''''
                       + '   AND CVE_USUARIO  = ''' + Objeto.DameUsuario + ''''
                       + ' ORDER BY CVE_OPER_ACC', Objeto.SeguDataBaseName, Objeto.SeguSessionName, True);
      if Qry <> nil then
         while not Qry.eof do
         begin
            vResultado := vResultado + trim(Qry.FieldByName('CVE_OPER_ACC').AsString);
            Qry.next;
         end;
   finally
      if Qry <> nil then
      begin
         Qry.Close;
         Qry.Free;
      end;
   end;
   result := vResultado;
end;

procedure TwChCteCtoSol.ValidaPermiso;
var
   vTipoPermiso : String;
begin
   if (vlmodo='ENVIO') then
   begin
      btnAutorizar.Visible := False;
      btnActivar.Visible   := False;
      vTipoPermiso         := PermisoEnCambioDeStatus;

      if (Objeto.Active) then
      begin
         Objeto.Sit_Solicitud.GetFromControl;
         if (trim(Objeto.Sit_Solicitud.AsString) = 'IN') and ((trim(vTipoPermiso) = 'SA')   or
                                                              (trim(vTipoPermiso) = 'SASB') or
                                                              (trim(vTipoPermiso) = 'SASD') or
                                                              (trim(vTipoPermiso) = 'SASBSD')) then
            btnAutorizar.Visible := True;
         if (trim(Objeto.Sit_Solicitud.AsString) = 'AU') and ((trim(vTipoPermiso) = 'SB')   or
                                                              (trim(vTipoPermiso) = 'SASB') or
                                                              (trim(vTipoPermiso) = 'SBSD') or
                                                              (trim(vTipoPermiso) = 'SASBSD')) then
            btnActivar.Visible   := True;
      end;
   end;
end;

procedure TwChCteCtoSol.ValidaPermisoRecep;
var
   vTipoPermiso : String;
begin
   if (vlmodo='RECEPCION') then
   begin
      btnAutorizar.Visible := False;
      btnActivar.Visible   := False;
      vTipoPermiso         := PermisoEnCambioDeStatus;

      //if (Objeto.Active)  then
      if (vltmpsit='IN') OR (vltmpsit='AU') then
      begin
         Objeto.SITUACION.AsString := vltmpsit;
         if (trim(Objeto.SITUACION.AsString) = 'IN') and ((trim(vTipoPermiso) = 'SA')   or
                                                           (trim(vTipoPermiso) = 'SASB') or
                                                           (trim(vTipoPermiso) = 'SASD') or
                                                           (trim(vTipoPermiso) = 'SASBSD')) then
            btnAutorizar.Visible := True;
         if (trim(Objeto.SITUACION.AsString) = 'AU') and ((trim(vTipoPermiso) = 'SB')   or
                                                           (trim(vTipoPermiso) = 'SASB') or
                                                           (trim(vTipoPermiso) = 'SBSD') or
                                                           (trim(vTipoPermiso) = 'SASBSD')) then
            btnActivar.Visible   := True;
      end;      
   end;  
end;

procedure TSolCheCto.dsRelRecepDataChange(Sender: TObject; Field: TField);
begin
   if (Field = nil) and (QRelRecep <> nil) then
   begin
      vlsql:='SELECT NVL(SITUACION,''XX'') SITUACION FROM CUENTA_MOVIL '+
             ' WHERE ID_CONTRATO='+QRelRecep.FieldByName('ID_CONTRATO').AsString+
             '   AND NUMERO_CEL='''+QRelRecep.FieldByName('NUMERO_CEL').AsString+'''';
      GetSQLStr(vlsql, Apli.DataBaseName, Apli.SessionName, 'SITUACION', vltmpsit, True);
   end
   else
      Active := False;
   Ventana.ValidaPermisoRecep;
end;

procedure TSolCheCto.dsCheqCtoDataChange(Sender: TObject; Field: TField);
begin
   if (Field = nil) and (QCheqCto <> nil) then
      FindKey([QCheqCto.FieldByName('Id_Contrato').AsString,
               QCheqCto.FieldByName('Id_Persona').AsString,
               QCheqCto.FieldByName('Id_Banco_Chqra').AsString,
               QCheqCto.FieldByName('Cuenta_Banco').AsString])
   else
      Active := False;
   Ventana.ValidaPermiso;
end;

procedure TSolCheCto.dsCtteDataChange(Sender: TObject; Field: TField);
begin
   if (Field = nil) then
   begin
      if not dsCtte.DataSet.IsEmpty then
      begin
         Contratante.QContratante.FieldByName('CONTRATANTE').DisplayWidth      := 55;
         Contratante.QContratante.FieldByName('TIPO_CONTRATANTE').DisplayWidth := 35;
         RefrescaQCheqCto;
         Cheq.BuscaWhereString         := ' CHEQUERA_CTE.ID_PERSONA = ' + Contratante.Id_Persona.AsString;
         Cheq.Persona.BuscaWhereString := ' PERSONA.ID_PERSONA = ' + Contratante.Id_Persona.AsString;
      end
      else
         Active := False;
   end;
   //MACO - SOAO4503(25/JUL/2016)
   //MuestraSitEnv_DatChe;
end;

procedure TSolCheCto.RefrescaQCheqCto;
begin
   try
      if qCheqCto  <> nil then   qCheqCto.Free; qCheqCto := nil;
      if QRelRecep <> nil then   QRelRecep.Free; QRelRecep:=nil;

      if Contrato <> nil then
      begin
         if Contrato.ID_CONTRATO.AsInteger = 0 then
            Contrato.ID_CONTRATO.AsInteger := vgIdContrato;

         qCheqCto := GetSQLQuery(' select '
                               + '        chequera_cte.tipo_cuenta, '
                               + '        cheq_cte_cto_sol.cuenta_banco, '
                               + '        intermediario.nombre, '
                               + '        cheq_cte_cto_sol.sit_solicitud, '
                               + '        cheq_cte_cto_sol.id_contrato, '
                               + '        chequera_cte.nom_suc_banco, '
                               + '        pza_compensacion.nom_plaza, '
                               + '        cheq_cte_cto_sol.id_persona, '
                               + '        cheq_cte_cto_sol.id_banco_chqra '
                               + '   from cheq_cte_cto_sol, '
                               + '        persona intermediario, '
                               + '        chequera_cte, '
                               + '        pza_compensacion '
                               + '  where cheq_cte_cto_sol.id_contrato    = ' + IntToStr(Contrato.ID_CONTRATO.AsInteger)
                               + '    and cheq_cte_cto_sol.id_persona     = ' + dsCtte.DataSet.FieldByName('ID_PERSONA').AsString
                               + '    and cheq_cte_cto_sol.id_banco_chqra = intermediario.id_persona '
                               + '    and cheq_cte_cto_sol.id_persona     = chequera_cte.id_persona '
                               + '    and cheq_cte_cto_sol.id_banco_chqra = chequera_cte.id_banco_chqra '
                               + '    and cheq_cte_cto_sol.cuenta_banco   = chequera_cte.cuenta_banco '
                               + '    and chequera_cte.id_plaza           = pza_compensacion.id_plaza(+)'
                               + '  order by cheq_cte_cto_sol.sit_solicitud desc',
                               DataBaseName, SessionName, True);

         //RELACION CUENTA-CELULAR EN RECEPCION
         QRelRecep := GetSQLQuery(' select '
                               + '         ''MOVIL'' as tipo, '
                               + '         cm.numero_cel, '
                               + '         cm.situacion, '
                               + '         cm.id_contrato '
                               + '   from cuenta_movil cm'
                               + '  where cm.id_contrato    = ' + IntToStr(Contrato.ID_CONTRATO.AsInteger)
                               + '  order by cm.situacion desc',
                               DataBaseName, SessionName, True);
      end;

      if qCheqCto <> nil then
      begin
         qCheqCto.fieldByName('Sit_Solicitud').DisplayLabel := 'SITUACION';
         qCheqCto.fieldByName('Sit_Solicitud').DisplayWidth:=10;

         qCheqCto.fieldByName('Tipo_Cuenta').DisplayLabel   := 'TIPO';
         qCheqCto.fieldByName('Tipo_Cuenta').DisplayWidth:=10;

         qCheqCto.fieldByName('Id_Contrato').DisplayLabel   := 'CONTRATO';
         qCheqCto.fieldByName('Id_Contrato').DisplayWidth:=20;

         qCheqCto.fieldByName('Cuenta_Banco').DisplayLabel  := 'CUENTA';
         qCheqCto.fieldByName('Cuenta_Banco').DisplayWidth:=20;

         qCheqCto.fieldByName('Nombre').DisplayLabel        := 'INTERMEDIARIO';
         qCheqCto.fieldByName('Nombre').DisplayWidth:=35;

         qCheqCto.fieldByName('nom_plaza').DisplayLabel     := 'PLAZA';
         qCheqCto.fieldByName('nom_plaza').DisplayWidth:=35;

         qCheqCto.fieldByName('nom_suc_banco').Visible        := False;
         qCheqCto.fieldByName('Id_Contrato').Visible        := False;
         qCheqCto.fieldByName('Id_Banco_Chqra').Visible     := False;
         qCheqCto.fieldByName('Id_Persona').Visible         := False;
         if FPanelCheqCto <> nil then            FPanelCheqCto.Visible := False;
      end
      else if FPanelCheqCto <> nil then          FPanelCheqCto.Visible := True;
      dsCheqCto.DataSet := qCheqCto;
      if qCheqCto = nil then                     dsCheqCtoDataChange(Self, nil);

      //RELACION CUENTA-CELULAR EN RECEPCION
      if QRelRecep <> nil then
      begin
         QRelRecep.fieldByName('tipo').DisplayLabel   := 'TIPO';
         QRelRecep.fieldByName('tipo').DisplayWidth:=10;

         QRelRecep.fieldByName('id_contrato').DisplayLabel := 'CONTRATO';
         QRelRecep.fieldByName('id_contrato').DisplayWidth:=20;

         QRelRecep.fieldByName('numero_cel').DisplayLabel  := 'CELULAR';
         QRelRecep.fieldByName('numero_cel').DisplayWidth:=20;

         QRelRecep.fieldByName('situacion').DisplayLabel   := 'SITUACION';
         QRelRecep.fieldByName('situacion').DisplayWidth:=10;
      end;
      dsRelRecep.DataSet := QRelRecep;
      if QRelRecep = nil then
      begin
         vltmpsit:='';
         dsRelRecepDataChange(Self, nil);
      end;
     
   finally
     //MACO - SOAO4503(25/JUL/2016)
     MuestraSitEnv_DatChe;
   end;
end;

//**************************************************************//
//                     CLASE TwChCteCtoSol                        //
//**************************************************************//


function TwChCteCtoSol.Modifica_SolCheqCteCtoRecep (pSituacion : String) : Integer;
var
   Stp : TStoredProc;
begin
   Stp := TStoredProc.Create(nil);
   try
      with Stp do
      begin
         DatabaseName   := Objeto.DataBaseName;
         SessionName    := Objeto.SessionName;
         StoredProcName := 'PKGCORPORATIVO.MOD_CTOMOVIL';
         Params.CreateParam(ftInteger, 'p_Id_Contrato',    ptInput);
         Params.CreateParam(ftString,  'p_Numero_Cel_Ant', ptInput);
         Params.CreateParam(ftString,  'p_Numero_Cel',     ptInput);
         Params.CreateParam(ftString,  'p_Situacion',      ptInput);
         Params.CreateParam(ftString,  'p_Usuario',        ptInput);
         Params.CreateParam(ftInteger, 'p_Resultado',      ptOutput);

         ParamByName('p_Id_Contrato').AsInteger     := Objeto.QRelRecep.FieldByName('ID_CONTRATO').AsInteger;
         ParamByName('p_Numero_Cel_Ant').AsString   := Objeto.QRelRecep.FieldByName('NUMERO_CEL').AsString;
         ParamByName('p_Numero_Cel').AsString       := Objeto.QRelRecep.FieldByName('NUMERO_CEL').AsString;
         ParamByName('p_Situacion').AsString        := pSituacion;
         ParamByName('p_Usuario').AsString          := Objeto.Apli.Usuario;

         ExecProc;
         result := ParamByName('p_Resultado').AsInteger;
      end;
   finally
      Stp.Free;
      Stp := nil;
   end;
end;

function TwChCteCtoSol.Elimina_SolCheqCteCtoRecep : Integer;
var
   Stp : TStoredProc;
begin
   Stp := TStoredProc.Create(nil);
   try
      with Stp do
      begin
         DatabaseName   := Objeto.DataBaseName;
         SessionName    := Objeto.SessionName;
         StoredProcName := 'PKGCORPORATIVO.ELI_CTOMOVIL';
         Params.CreateParam(ftInteger, 'p_Id_Contrato',    ptInput);
         Params.CreateParam(ftString,  'p_Numero_Cel',     ptInput);
         Params.CreateParam(ftInteger, 'p_Resultado',      ptOutput);

         ParamByName('p_Id_Contrato').AsInteger  := Objeto.QRelRecep.FieldByName('ID_CONTRATO').AsInteger;
         ParamByName('p_Numero_Cel').AsString    := Objeto.QRelRecep.FieldByName('NUMERO_CEL').AsString;

         ExecProc;
         result := ParamByName('p_Resultado').AsInteger;
      end;
   finally
      Stp.Free;
      Stp := nil;
   end;
end;


procedure TwChCteCtoSol.DespuesShow(var Msg:TMessage);
begin
   if Objeto.qCheqCto <> nil then
      Objeto.FPanelCheqCto.Visible := False;
end;

procedure TwChCteCtoSol.FormShow(Sender: TObject);
begin
   with Objeto do
   begin
      Id_Contrato.control    := edIdContrato;
      ID_PERSONA.Control     := edIdPersona;
      ID_BANCO_CHQRA.Control := edIdBancoChqra;
      CUENTA_BANCO.Control   := edCuentaBanco;
      Sit_Solicitud.Control  := lSituacion;

      SITUACION.Control      := lSituacionRecep;

      Cheq.Persona.Nombre.Control   		:= edNombrePersona;
      Cheq.Intermediario.Persona.Nombre.Control := edNombreIntermediario;
      Cheq.Nom_Suc_Banco.Control   		:= edNomSucBanco;
      Cheq.ABA.Control				:= edABA;
      Cheq.FFC.Control				:= edFFC;
      Cheq.Id_Plaza.Control			:= edIdPlaza;
      Cheq.Nom_Plaza_Ext.Control		:= edNomPlazaExt;
      Cheq.Nom_Plaza_Banco.Control		:= edNomPlazaBanco;
      Cheq.Plaza.NOM_PLAZA.Control		:= edNombrePlaza;
      Cheq.Cve_Suc_Banco.Control		:= edCveSucBanco;
      Cheq.NOM_BENEFI.Control			:= edNombreBeneficiario;
      Cheq.RFC_BENEFICIARIO.Control		:= edRFCBeneficiario;

      // Asignacion de DataSources
      dbgContratante.datasource := dsCtte;
      dbnContratante.datasource := dsCtte;
      dbgCheq.datasource        := dsCheqCto;
      dbnCheq.datasource        := dsCheqCto;

      dbgRecep.datasource       := dsRelRecep;
      dbnRecep.datasource       := dsRelRecep;

      // Revision de los paneles
      FPanelCheqCto := PanelCheqCto;
      PostMessage(Handle,WM_DESPUESSHOW, 0, 0);
      vlmodo:='ENVIO';

   end;
end;

procedure TwChCteCtoSol.InterForma1Buscar(Sender: TObject);
begin
   if (Objeto.Busca) and (Objeto.QCheqCto <> nil) then
   begin
      Objeto.QCheqCto.locate('Id_Contrato; Id_Persona; Id_Banco_Chqra; Cuenta_Banco',
                              VarArrayOf([Objeto.Id_Contrato.AsInteger,
                                          Objeto.Id_Persona.AsInteger,
                                          Objeto.Id_Banco_Chqra.AsInteger,
                                          Objeto.Cuenta_Banco.AsString]),
                              [loCaseInsensitive]);
   end;
end;

procedure TwChCteCtoSol.BitBtn1Click(Sender: TObject);
begin
   Execute_RepChCteCtoSol(True, Objeto, Objeto.Id_Persona.AsString);
end;

procedure TwChCteCtoSol.InterForma1DespuesNuevo(Sender: TObject);
begin
   btnAutorizar.Visible          := False;
   btnActivar.Visible            := False;
   Objeto.Id_Contrato.AsInteger  := vgIdContrato;
   Objeto.Sit_Solicitud.AsString := 'IN';
   Objeto.DrawControl;
   bbCheqClick(self);
end;

procedure TwChCteCtoSol.InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean; var Realizado: Boolean);
var
   Qry : TQuery;
begin
   if IsNewData then
   begin
      try
         InterForma1.ShowError := False;
         Qry := GetSQLQuery(' SELECT * '
                          + '   FROM cheq_cte_cto_sol '
                          + '  WHERE id_contrato    = ' + Objeto.Id_Contrato.AsSQL
                          + '    AND id_persona     = ' + Objeto.Id_Persona.AsSQL
                          + '    AND id_banco_chqra = ' + Objeto.Id_Banco_Chqra.AsSQL
                          + '    AND cuenta_banco   = ' + Objeto.Cuenta_Banco.AsSQL,
                            Objeto.SeguDataBaseName, Objeto.SeguSessionName, True);
         if Qry = nil then
            Realizado := True
         else
         begin
            MessageDlg('La solicitud de relación Chequera - Contrato, ya existe', mtInformation, [mbOk], 0);
            Realizado := False;
         end;
      finally
         if Qry <> nil then
         begin
            Qry.Close;
            Qry.Free;
         end;
      end;
   end;
end;

procedure TwChCteCtoSol.InterForma1DespuesAceptar(Sender: TObject);
begin
   Objeto.RefrescaQCheqCto;
end;

procedure TwChCteCtoSol.InterForma1DespuesCancelar(Sender: TObject);
begin
   if Objeto.dsCheqCto.DataSet <> nil then
      Objeto.Cheq.FindKey([objeto.Id_Persona.AsString, objeto.Id_Banco_Chqra.AsString, objeto.Cuenta_Banco.AsString]);
       
end;

procedure TwChCteCtoSol.CatalogoPersonaClick(Sender: TObject);
begin
   Objeto.cheq.vgIdPersona := objeto.Contratante.Id_Persona.AsInteger;
   Objeto.cheq.Catalogo;
   if not(Objeto.Modo in [moAppend, moEdit]) then
      Objeto.RefrescaQCheqCto;
end;

procedure TwChCteCtoSol.bbCheqClick(Sender: TObject);
begin
   if(Objeto.Contratante.Active) and (Objeto.Contratante.QContratante <> nil) then
   begin
      if Objeto.Contratante.QContratante.FieldByName('CVE_PER_JURIDICA').asString = 'PF' then
        Objeto.Cheq.FilterBy:= fbTCheqCteFisica
      else
         if Objeto.Contratante.QContratante.FieldByName('CVE_PER_JURIDICA').asString = 'PM' then
            Objeto.Cheq.FilterBy:= fbTCheqCteMoral
         else
            Objeto.Cheq.FilterBy:= fbNinguno;
      Objeto.Cheq.BuscaWhereString := '(CHEQUERA_CTE.SIT_CHEQUERA = ''AC'' AND CHEQUERA_CTE.ID_PERSONA = '+ Objeto.Contratante.QContratante.FieldByName('ID_PERSONA').asString +')';
      if Objeto.Contrato.Cve_Tip_Contrato.AsString = 'CDVI' then
         Objeto.Cheq.BuscaWhereString := Objeto.Cheq.BuscaWhereString  +  ' AND CUENTA_BANCO <> ' + SQLSTR( Objeto.Contrato.Id_Contrato.AsString );
   end;
   Objeto.Cheq.Busca;
end;

procedure TwChCteCtoSol.CatalogoPlazaClick(Sender: TObject);
var
  Plaza : TPzaComp;
begin
	Plaza:= TPzaComp.Create(self);
   try
      Plaza.Apli := Objeto.Apli;
   	Plaza.Catalogo;
   finally
   	Plaza.Free;
   end;
end;

procedure TwChCteCtoSol.CatalogoPlazaBanClick(Sender: TObject);
var
   PlazaBan : TPzaBanx;
begin
   PlazaBan := TPzaBanx.Create(self);
   try
      PlazaBan.Apli := Objeto.Apli;
   	PlazaBan.Catalogo;
   finally
   	PlazaBan.Free;
   end;
end;

function TwChCteCtoSol.Modifica_SolicitudCheqCteCto (pSituacion : String) : Integer;
var
   Stp : TStoredProc;
begin
   Stp := TStoredProc.Create(nil);
   try
      with Stp do
      begin
         DatabaseName   := Objeto.DataBaseName;
         SessionName    := Objeto.SessionName;
         StoredProcName := 'PKGCORPORATIVO.MOD_SOLICITUDCHEQCTECTO';
         Params.CreateParam(ftInteger, 'p_Id_Contrato',    ptInput);
         Params.CreateParam(ftInteger, 'p_Id_Persona',     ptInput);
         Params.CreateParam(ftInteger, 'p_Id_Banco_Chqra', ptInput);
         Params.CreateParam(ftString,  'p_Cuenta_Banco',   ptInput);
         Params.CreateParam(ftString,  'p_Sit_Solicitud',  ptInput);
         Params.CreateParam(ftInteger, 'p_Resultado',      ptOutput);

         if Objeto.Id_Contrato.AsInteger = 0 then  Objeto.Id_Contrato.AsInteger := vgIdContrato;

         ParamByName('p_Id_Contrato').AsInteger    := Objeto.Id_Contrato.AsInteger;
         ParamByName('p_Id_Persona').AsInteger     := Objeto.Id_Persona.AsInteger;
         ParamByName('p_Id_Banco_Chqra').AsInteger := Objeto.Id_Banco_Chqra.AsInteger;
         ParamByName('p_Cuenta_Banco').AsString    := Objeto.Cuenta_Banco.AsString;
         ParamByName('p_Sit_Solicitud').AsString   := pSituacion;

         ExecProc;
         result := ParamByName('p_Resultado').AsInteger;
      end;
   finally
      Stp.Free;
      Stp := nil;
   end;
end;

function TwChCteCtoSol.Elimina_SolicitudCheqCteCto : Integer;
var
   Stp : TStoredProc;
begin
   Stp := TStoredProc.Create(nil);
   try
      with Stp do
      begin
         DatabaseName   := Objeto.DataBaseName;
         SessionName    := Objeto.SessionName;
         StoredProcName := 'PKGCORPORATIVO.ELI_SOLICITUDCHEQCTECTO';
         Params.CreateParam(ftInteger, 'p_Id_Contrato',    ptInput);
         Params.CreateParam(ftInteger, 'p_Id_Persona',     ptInput);
         Params.CreateParam(ftInteger, 'p_Id_Banco_Chqra', ptInput);
         Params.CreateParam(ftString,  'p_Cuenta_Banco',   ptInput);
         Params.CreateParam(ftString,  'p_EliCheCteCto',   ptInput);
         Params.CreateParam(ftInteger, 'p_Resultado',      ptOutput);

         if Objeto.Id_Contrato.AsInteger = 0 then  Objeto.Id_Contrato.AsInteger := vgIdContrato;

         ParamByName('p_Id_Contrato').AsInteger    := Objeto.Id_Contrato.AsInteger;
         ParamByName('p_Id_Persona').AsInteger     := Objeto.Id_Persona.AsInteger;
         ParamByName('p_Id_Banco_Chqra').AsInteger := Objeto.Id_Banco_Chqra.AsInteger;
         ParamByName('p_Cuenta_Banco').AsString    := Objeto.Cuenta_Banco.AsString;
         ParamByName('p_EliCheCteCto').AsString    := 'F';

         ExecProc;
         result := ParamByName('p_Resultado').AsInteger;
      end;
   finally
      Stp.Free;
      Stp := nil;
   end;
end;

procedure TwChCteCtoSol.btnAutorizarClick(Sender: TObject);
begin
   if (vlmodo='ENVIO') then
   begin
      if Modifica_SolicitudCheqCteCto('AU') = 0 then
         Objeto.RefrescaQCheqCto;
   end;
   if (vlmodo='RECEPCION') then
   begin
      if Modifica_SolCheqCteCtoRecep('AU') = 0 then
         Objeto.RefrescaQCheqCto;
   end;
end;

procedure TwChCteCtoSol.btnActivarClick(Sender: TObject);
begin
   if (vlmodo='ENVIO') then
   begin
      if Modifica_SolicitudCheqCteCto('AC') = 0 then
         Objeto.RefrescaQCheqCto;
   end;      
   if (vlmodo='RECEPCION') then
   begin
      if Modifica_SolCheqCteCtoRecep('AC') = 0 then
         Objeto.RefrescaQCheqCto;
   end;
end;

procedure TwChCteCtoSol.InterForma1AntesEliminar(Sender: TObject; var Realizado: Boolean);
begin
   try
      if Objeto.Active then
      begin
         InterForma1.ShowError := False;
         if (trim(Ventana.PermisoEnCambioDeStatus) = 'SD') and (trim(Objeto.Sit_Solicitud.AsString) <> 'IN') then
            raise EInterFrame.Create('Solo cuenta con permiso para eliminar Chequeras Inactivas');
         if trim(Objeto.Sit_Solicitud.AsString) = 'AC' then
            raise EInterFrame.Create('No puede eliminar Chequeras Activas');
         Realizado := True;
      end
      else
         Realizado := False;
   except
      on e: EInterFrame do
      begin
         MessageDlg(e.Message, mtInformation, [mbOK], 0);
         Realizado := False;
      end;
   end;
end;

procedure TwChCteCtoSol.InterForma1Eliminar(Sender: TObject; var Realizado: Boolean);
begin
   if MessageDlg('¿ Esta seguro de eliminar la solicitud de Relacion Chequera Cliente Contrato de Envio?' +coCRLF+
                        ' Contrato: '+IntToStr(Objeto.Id_Contrato.AsInteger) +coCRLF+
                        ' Cuenta: '+Objeto.Cuenta_Banco.AsString
   ,mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      if Elimina_SolicitudCheqCteCto = 0 then
         Realizado := True
      else
         Realizado := False;
   end;
end;

procedure TwChCteCtoSol.InterForma1DespuesEliminar(Sender: TObject);
begin
   Objeto.RefrescaQCheqCto;
end;

procedure TwChCteCtoSol.FormDestroy(Sender: TObject);
begin
   with Objeto do
      if Contrato <> nil then
      begin
         Id_Contrato.control    := nil;
         ID_PERSONA.Control     := nil;
         ID_BANCO_CHQRA.Control := nil;
         CUENTA_BANCO.Control   := nil;
         Sit_Solicitud.Control  := nil;

         SITUACION.Control      := nil;

         Cheq.Persona.Nombre.Control   	           := nil;
         Cheq.Intermediario.Persona.Nombre.Control := nil;
         Cheq.Nom_Suc_Banco.Control   		   := nil;
         Cheq.ABA.Control			   := nil;
         Cheq.FFC.Control			   := nil;
         Cheq.Id_Plaza.Control			   := nil;
         Cheq.Nom_Plaza_Ext.Control		   := nil;
         Cheq.Nom_Plaza_Banco.Control		   := nil;
         Cheq.Plaza.NOM_PLAZA.Control		   := nil;
         Cheq.Cve_Suc_Banco.Control		   := nil;
         Cheq.NOM_BENEFI.Control		   := nil;
         Cheq.RFC_BENEFICIARIO.Control		   := nil;

         // Asignacion de Data Source
         dbgContratante.datasource := nil;
         dbnContratante.datasource := nil;
         dbgCheq.datasource        := nil;
         dbnCheq.datasource        := nil;

         dbgRecep.datasource       := nil;
         dbnRecep.datasource       := nil;

         // Revision de los paneles
         FPanelCheqCto             := nil;
     end;
end;

procedure TwChCteCtoSol.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TwChCteCtoSol.dbgCheqCellClick(Column: TColumn);
begin
   if not(Objeto.Modo in [moAppend, moEdit]) then
   begin
      btnActivar.Caption:='Activar Solicitud de Envio';
      btnAutorizar.Caption:='Autorizar Solicitud de Envio';

      Panel1.Visible:=true;
      GroupBox1.Visible:=true;
      lSituacion.Visible:=true;
      lSituacionRecep.Visible:=false;

      InterForma1.BtnModificar.Visible:=true;
      InterForma1.BtnNuevo.Visible:=true;
      //InterForma1.BtnEliminar.Visible:=true;
      //
      InterForma1.BtnAceptar.Visible:=true;
      InterForma1.BtnCancelar.Visible:=true;
      vlmodo:='ENVIO';
      lEtqSituacion.Caption:='Situación Envío:';
      ValidaPermiso;
   end;
end;

procedure TwChCteCtoSol.dbgRecepCellClick(Column: TColumn);
begin
   if not(Objeto.Modo in [moAppend, moEdit]) then
   begin
      btnActivar.Caption:='Activar Solicitud de Recepción';
      btnAutorizar.Caption:='Autorizar Solicitud de Recepción';

      Panel1.Visible:=false;
      GroupBox1.Visible:=false;
      lSituacion.Visible:=false;
      lSituacionRecep.Visible:=true;

      InterForma1.BtnModificar.Visible:=false;
      InterForma1.BtnNuevo.Visible:=false;
      //InterForma1.BtnEliminar.Visible:=false;
      //
      InterForma1.BtnAceptar.Visible:=false;
      InterForma1.BtnCancelar.Visible:=false;
      vlmodo:='RECEPCION';
      lEtqSituacion.Caption:='Situación Recepción:';
      vlsql:='SELECT NVL(SITUACION,''XX'') SITUACION FROM CUENTA_MOVIL '+
             ' WHERE ID_CONTRATO='+Objeto.QRelRecep.FieldByName('ID_CONTRATO').AsString+
             '   AND NUMERO_CEL='''+Objeto.QRelRecep.FieldByName('NUMERO_CEL').AsString+'''';
      GetSQLStr(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, 'SITUACION', vltmpsit, True);
      lSituacionRecep.Caption:=vltmpsit;
      ValidaPermisoRecep;
   end;
end;

procedure TwChCteCtoSol.InterForma1BtnEliminar(Sender: TObject);
begin
    if (vlmodo='ENVIO') then //ENV
    begin
       InterForma1.Eliminar;
    end;

    if (vlmodo='RECEPCION') then //REC
    begin
       try
          if MessageDlg('¿ Esta seguro de Eliminar la Relacion de Chequera - Cuenta Movil de Recepcion ?' +coCRLF+
                        ' Contrato: '+Objeto.QRelRecep.FieldByName('ID_CONTRATO').AsString +coCRLF+
                        ' Celular: '+Objeto.QRelRecep.FieldByName('NUMERO_CEL').AsString,
                        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          begin
             vlsql:='DELETE FROM CUENTA_MOVIL '+
                    ' WHERE ID_CONTRATO = '+Objeto.QRelRecep.FieldByName('ID_CONTRATO').AsString+
                    '   AND NUMERO_CEL  = '''+Objeto.QRelRecep.FieldByName('NUMERO_CEL').AsString+''''+
                    '   AND TIPO_CUENTA =  10 ';

             RunSQL(vlsql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);
             RunSQL('COMMIT',Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,True);

             Objeto.RefrescaQCheqCto;
          end;
       Except
          on e: exception do
          begin
             Beep;Beep;
             ShowMessage('Problemas al Eliminar la Relación Contrato-Celular');
             ShowMessage(e.Message);
          end;
       end;
    end;
end;

procedure TwChCteCtoSol.PanelCheqCtoClick(Sender: TObject);
begin
   btnActivar.Caption:='Activar Solicitud de Envio';
   btnAutorizar.Caption:='Autorizar Solicitud de Envio';

   Panel1.Visible:=true;
   GroupBox1.Visible:=true;
   lSituacion.Visible:=true;
   lSituacionRecep.Visible:=false;

   InterForma1.BtnModificar.Visible:=true;
   InterForma1.BtnNuevo.Visible:=true;
   InterForma1.BtnAceptar.Visible:=true;
   InterForma1.BtnCancelar.Visible:=true;
   vlmodo:='ENVIO';
   lEtqSituacion.Caption:='Situación Envío:';
   ValidaPermiso;
end;

//MACO - SOAO4503 (22/JULIO/2016)
procedure TSolCheCto.MuestraSitEnv_DatChe;
begin
  Try
    if(dsCheqCto.DataSet.RecordCount > 0)then
       begin
        dsCheqCto.DataSet.First;
       end;
  Except
    
  End;
end;
//MACO - SOAO4503 (01/AGOSTO/2016)
procedure TSolCheCto.BuscaContrato;
begin
   ContratoPadre.Busca;
   if ContratoPadre.Active then
      begin
         vgIdContrato := ContratoPadre.Id_Contrato.AsInteger;
         GetParams(ContratoPadre);
         Contrato     := ContratoPadre;

      end;

end;
//MACO - SOAO4503 (01/AGOSTO/2016)
procedure TwChCteCtoSol.InterForma1BtnBuscarClick(Sender: TObject);
begin
  Try
    Objeto.BuscaContrato;
    Objeto.RefrescaQCheqCto;
    Ventana.BitBtn1.Enabled := True;
    Ventana.InterForma1.BtnNuevo.Enabled := True;
    Ventana.InterForma1.BtnEliminar.Enabled := True;
  Except
    Objeto.LimpiaDatos();
  End;
end;
//MACO - SOAO4503 (02/AGOSTO/2016)
procedure TSolCheCto.LimpiaDatos;
begin

  Ventana.edIdContrato.Text := '';
  Ventana.edCuentaBanco.Text:= '';
  Ventana.edNombreIntermediario.Text := '';
  ventana.edCveSucBanco.Text := '';
  Ventana.edNomSucBanco.Text := '';
  Ventana.edIdPlaza.Text := '';
  Ventana.edNomPlazaBanco.Text := '';
  Ventana.edNombrePlaza.Text := '';
  Ventana.edNombreBeneficiario.Text := '';
  Ventana.edRFCBeneficiario.Text := '';
  Ventana.BitBtn1.Enabled := False;
  Ventana.InterForma1.BtnNuevo.Enabled := False;
  Ventana.InterForma1.BtnEliminar.Enabled := False;
  Ventana.lSituacionRecep.Caption := '';
end;

end.



