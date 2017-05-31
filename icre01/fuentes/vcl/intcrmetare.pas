// Sistema         : Clase de CR_MET_TABLA_REFEREN
// Fecha de Inicio : 12/02/2013
// Función forma   : Clase de CR_MET_TABLA_REFEREN
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : 
// Comentarios     :
Unit IntCrMeTaRe;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, ImgList, ActnList, IntParamCre;

Type
  TEstadoConfiguracion = (ecVacio, ecEditado, ecInsertado, ecConsulta);

 TCrMeTaRe= class;

  TWCrMetTablaRefer=Class(TForm)
    InterForma1             : TInterForma;
    Panel1: TPanel;
    lbID_TABLA_REFEREN: TLabel;
    edID_TABLA_REFEREN: TEdit;
    lbTABLA_REFERENCIADA: TLabel;
    rdgSIT_TABLA_REFEREN: TRadioGroup;
    lbDESCRIPCION: TLabel;
    edDESCRIPCION: TEdit;
    lbNUM_COL_LLAVE: TLabel;
    edNUM_COL_LLAVE: TEdit;
    lbCOLUMNAS_LLAVE: TLabel;
    edCOLUMNAS_LLAVE: TEdit;
    lbCOLUMNAS_LLAVE_FORAN: TLabel;
    edCOLUMNAS_LLAVE_FORAN: TEdit;
    bbtnACTUALIZA_LLAVE: TBitBtn;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    Nuevo: TButton;
    qTablasReferenExis: TQuery;
    ActionList1: TActionList;
    actNuevo: TAction;
    Button1: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    actModificar: TAction;
    actEliminar: TAction;
    actAceptar: TAction;
    actCancelar: TAction;
    actBuscar: TAction;
    edTABLA_REFEREN: TEdit;
    btTABLA_REFEREN: TBitBtn;
    qDatosTabAct: TQuery;
    actActualizarLlave: TAction;
    lbCONSULTA_EN_PERSONA: TLabel;
    meCONSULTA_EN_PERSONA: TMemo;
    Label1: TLabel;
    edCOL_DESCRIPCION: TEdit;
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure actNuevoExecute(Sender: TObject);
    procedure actNuevoUpdate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actModificarExecute(Sender: TObject);
    procedure actEliminarExecute(Sender: TObject);
    procedure actAceptarExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actBuscarExecute(Sender: TObject);
    procedure btTABLA_REFERENClick(Sender: TObject);
    procedure actActualizarLlaveExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    private 
    { Private declarations }
      Estado: TEstadoConfiguracion;
      DefLlaveAct: Boolean;
      procedure Limpia_Tabla_Referen;
      procedure ObtDefPkTabRef (pNomTabReferen: String);
      procedure AplicaEstatusControl (Control: TControl; Habilitado: boolean; NomControl: String);
      function  SalvaTablaReferen ():Boolean;
      function  ActualizaDefLlave ():Boolean;
      function  ValidaConsultaEnPersona (): Boolean;
    public
    { Public declarations } 
    Objeto : TCrMeTaRe;
end; 
 TCrMeTaRe= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public
        { Public declarations }
        ParamCre:   TParamCre;
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


constructor TCrMeTaRe.Create( AOwner : TComponent ); 
begin Inherited;

      UseQuery := True;
      HelpFile := 'IntCrMeTaRe.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrMeTaRe.Destroy;
begin inherited;
end;


function TCrMeTaRe.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrMetTablaRefer;
begin
   W:=TWCrMetTablaRefer.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FTConsulta;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrMeTaRe.InternalBusca:Boolean;
Var T: TInterFindit;
begin
  InternalBusca := False;
     {T := CreaBuscador('ICrMeTR.it','F');
      Try if Active then begin T.Param(0, ID_TABLA_REFEREN.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;}
end;

function TCrMeTaRe.Reporte:Boolean;
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CR_MET_TABLA_REFEREN********************)
(*                                                                              *)
(*  FORMA DE CR_MET_TABLA_REFEREN                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_MET_TABLA_REFEREN********************)

procedure TWCrMetTablaRefer.FormDestroy(Sender: TObject);
begin
   //Objeto
end;

procedure TWCrMetTablaRefer.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrMetTablaRefer.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrMetTablaRefer.Limpia_Tabla_Referen;
begin
  //Limpia los campos de la forma
  edID_TABLA_REFEREN    .Text      := '';
  edDESCRIPCION         .Text      := '';
  edNUM_COL_LLAVE       .Text      := '';
  edCOLUMNAS_LLAVE      .Text      := '';
  edCOLUMNAS_LLAVE_FORAN.Text      := '';
  edTABLA_REFEREN       .Text      := '';
  edCOL_DESCRIPCION     .Text      := '';
  rdgSIT_TABLA_REFEREN  .ItemIndex := -1;
  meCONSULTA_EN_PERSONA .Lines.Clear;
end;

procedure TWCrMetTablaRefer.ObtDefPkTabRef (pNomTabReferen: String);
var
  StpObtInfPkTabRf: TStoredProc;
begin
  StpObtInfPkTabRf := TStoredProc.Create (self);
  try
    with StpObtInfPkTabRf do
    begin
      StpObtInfPkTabRf.DatabaseName   := Objeto.Apli.DatabaseName;
      StpObtInfPkTabRf.SessionName    := Objeto.Apli.SessionName;
      StpObtInfPkTabRf.StoredProcName := 'SISTEMAS.PKGCRADMINCOMERCIAL.STPOBTINFPKTABRF';

      Params.Clear;
      Params.CreateParam (ftString,  'PETABLA_REFERENCIADA',     ptInput);
      Params.CreateParam (ftInteger, 'PSNUM_COL_LLAVE',          ptOutput);
      Params.CreateParam (ftString,  'PSCOLUMNAS_LLAVE',         ptOutput);
      Params.CreateParam (ftString,  'PSCOLUMNAS_LLAVE_FORANEA', ptOutput);
      Params.CreateParam (ftInteger, 'PSERROR',                  ptOutput);
      Params.CreateParam (ftString,  'PSMSGERROR',               ptOutput);
      Prepare;

      ParamByName ('PETABLA_REFERENCIADA').AsString := pNomTabReferen;
      ExecProc;

      if ParamByName ('PSERROR').AsInteger = 0 then
      begin
        edNUM_COL_LLAVE.Text        := ParamByName ('PSNUM_COL_LLAVE')         .AsString;
        edCOLUMNAS_LLAVE.Text       := ParamByName ('PSCOLUMNAS_LLAVE')        .AsString;
        edCOLUMNAS_LLAVE_FORAN.Text := ParamByName ('PSCOLUMNAS_LLAVE_FORANEA').AsString;
      end
      else
        ShowMessage('Error en ' + ParamByName ('PSERROR').AsString + ': ' + ParamByName('PSMSGERROR').AsString);

      UnPrepare;
    end;
  finally
    StpObtInfPkTabRf.Free;
  end;
end;

procedure TWCrMetTablaRefer.actNuevoExecute(Sender: TObject);
begin
  Estado := ecInsertado;
  Limpia_Tabla_Referen;

  //Establece la situación de la Tabla Referenciada como Nueva
  rdgSIT_TABLA_REFEREN.ItemIndex := 0;
  //Pone el focus al primer campo de captura
  edTABLA_REFEREN.TabOrder := 1;
  edTABLA_REFEREN.TabStop  := True;
  edTABLA_REFEREN.SetFocus;
end;

procedure TWCrMetTablaRefer.actNuevoUpdate(Sender: TObject);
var
  editActLlave: boolean;
begin
  actNuevo.Enabled           :=  Interforma1.Funcion.Nuevo     and (Estado In [ecVacio, ecConsulta]);
  actModificar.Enabled       :=  Interforma1.Funcion.Modificar and (Estado In [ecConsulta]);
  actBuscar.Enabled          :=  Interforma1.Funcion.Consultar and (Estado In [ecVacio, ecConsulta]);
  actAceptar.Enabled         :=  Estado In [ecInsertado, ecEditado];
  actCancelar.Enabled        :=  Estado In [ecInsertado, ecEditado];
  actActualizarLlave.Enabled := (Estado In [ecConsulta, ecEditado]) and Not DefLlaveAct;

  AplicaEstatusControl (edTABLA_REFEREN,       False,                              'edTABLA_REFEREN');
  AplicaEstatusControl (btTABLA_REFEREN,       Estado In [ecInsertado],            '');
  AplicaEstatusControl (edDESCRIPCION,         Estado In [ecInsertado, ecEditado], '');
  AplicaEstatusControl (rdgSIT_TABLA_REFEREN,  Estado In [ecInsertado, ecEditado], '');
  AplicaEstatusControl (meCONSULTA_EN_PERSONA, Estado In [ecInsertado, ecEditado], '');
  AplicaEstatusControl (edCOL_DESCRIPCION,     Estado In [ecInsertado, ecEditado], '');
end;

procedure TWCrMetTablaRefer.FormCreate(Sender: TObject);
begin
  Estado      := ecVacio;
  DefLlaveAct := True;
end;

procedure TWCrMetTablaRefer.actModificarExecute(Sender: TObject);
begin
  Estado := ecEditado;
end;

procedure TWCrMetTablaRefer.actEliminarExecute(Sender: TObject);
begin
  Estado := ecVacio;
end;

procedure TWCrMetTablaRefer.actAceptarExecute(Sender: TObject);
var
  SalvadoExitoso: Boolean;
begin
  //Salva los datos capturados o modificados en la BD
  SalvadoExitoso := SalvaTablaReferen;

  //Cambia el estado de la pantalla a Consulta si el proceso de Salvado fue exitoso
  if SalvadoExitoso then
    Estado := ecConsulta;
end;

procedure TWCrMetTablaRefer.actCancelarExecute(Sender: TObject);
var
  SitTab: String;
begin
  //Define el estado de la pantalla en caso de que se presione el botón Cancelar
  if Estado = ecInsertado then
  begin
    Limpia_Tabla_Referen;
    Estado := ecVacio;
  end
  else if Estado = ecEditado then
  begin
    Estado := ecConsulta;
  end;

  //Si la pantalla se encuentra en estado de Editado y se da clic en Cancelar se reconsultan los datos de la Tabla Referenciada
  qDatosTabAct.Close;
  qDatosTabAct.DatabaseName := Objeto.Apli.DataBaseName;
  qDatosTabAct.SessionName  := Objeto.Apli.SessionName;

  qDatosTabAct.ParamByName ('Tabla_Referenciada').AsString := edTABLA_REFEREN.Text;
  qDatosTabAct.Open;

  if qDatosTabAct.RecordCount <> 0 then
  begin
    edDESCRIPCION.Text := qDatosTabAct.FieldByName ('Descripcion')      .AsString;
    SitTab             := qDatosTabAct.FieldByName ('Sit_Tabla_Referen').AsString;
    meCONSULTA_EN_PERSONA.Lines.Text := qDatosTabAct.FieldByName ('Consulta_En_Persona').AsString;

    if SitTab = 'AC' then
      rdgSIT_TABLA_REFEREN.ItemIndex := 0
    else
      rdgSIT_TABLA_REFEREN.ItemIndex := 1;
  end;
end;

procedure TWCrMetTablaRefer.actBuscarExecute(Sender: TObject);
var
  T     : TInterFindit;
  SitTab: String;
  vlQry : TQuery;
begin
  T := Objeto.CreaBuscador('ICrMetTabRf.it','S');
  try
    if T.Execute then
    begin
      edID_TABLA_REFEREN         .Text := T.DameCampo(0);
      edTABLA_REFEREN            .Text := T.DameCampo(1);
      edDESCRIPCION              .Text := T.DameCampo(2);
      edNUM_COL_LLAVE            .Text := T.DameCampo(3);
      edCOLUMNAS_LLAVE           .Text := T.DameCampo(4);
      edCOLUMNAS_LLAVE_FORAN     .Text := T.DameCampo(5);
      SitTab                           := T.DameCampo(6);
      meCONSULTA_EN_PERSONA.Lines.Text := T.DameCampo(7);
      edCOL_DESCRIPCION          .Text := T.DameCampo(8);

      if SitTab = 'AC' then
        rdgSIT_TABLA_REFEREN.ItemIndex := 0
      else
        rdgSIT_TABLA_REFEREN.ItemIndex := 1;

      InterForma1.NextTab (btTABLA_REFEREN);

      Estado := ecConsulta;

      vlQry := TQuery.Create (Self);
      if Assigned(vlQry) then
        with vlQry do
        begin
          DatabaseName := Objeto.Apli.DataBaseName;
          SessionName  := Objeto.Apli.SessionName;

          SQL.Clear;
          SQL.Add ('Select PKGCRADMINCOMERCIAL.FncEsSyncPkTabRf (:Tabla_Referenciada) DefPkAct');
          SQL.Add ('  From Dual');
          Params.Clear;
          Params.CreateParam (ftString, 'Tabla_Referenciada', ptInput);
          ParamByName ('Tabla_Referenciada').AsString := edTABLA_REFEREN.Text;
          Open;

          DefLlaveAct := FieldByName ('DefPkAct').AsString = 'V';
        end;
    end;
  finally
    T.Free;
  end;
end;

procedure TWCrMetTablaRefer.AplicaEstatusControl (Control: TControl; Habilitado: boolean; NomControl: String);
var
  Edit:      TEdit;
  Memo:      TMemo;
  Combo:     TComboBox;

begin
  if Control is TEdit then
  begin
    Edit          := (Control as TEdit);
    Edit.ReadOnly := not Habilitado;
    Edit.TabStop  := Habilitado;

    if NomControl <> 'edTABLA_REFEREN' then
    begin
      if Habilitado then
        Edit.Color := clWindow
      else
        Edit.Color := clBtnFace;
    end
    else
    begin
      if Estado = ecInsertado then
        Edit.Color := clWindow
      else
        Edit.Color := clBtnFace;
    end;
  
  end
  else if Control is TMemo then
  begin
    Memo          := (Control as TMemo);
    Memo.ReadOnly := not Habilitado;
    Memo.TabStop  := Habilitado;

    if Habilitado then
      Memo.Color := clWindow
    else
      Memo.Color := clBtnFace;
  end
  else if (Control is TRadioGroup) or (Control is TCheckBox) or (Control is TBitBtn) then
    Control.Enabled := Habilitado
  else if (Control is TComboBox) then
  begin
    Combo := (Control as TComboBox);
    Combo.Enabled := Habilitado;

    if Habilitado then
      Combo.Color := clWindow
    else
      Combo.Color := clBtnFace;
  end
end;

procedure TWCrMetTablaRefer.btTABLA_REFERENClick(Sender: TObject);
var T:TInterFindit;
begin
  T := Objeto.CreaBuscador('ITablasRF.it','S');
  try
    if T.Execute then
    begin
      //Limpia los campos que contienen la definición de la Llave Primaria
      edNUM_COL_LLAVE       .Text := '';
      edCOLUMNAS_LLAVE      .Text := '';
      edCOLUMNAS_LLAVE_FORAN.Text := '';

      edTABLA_REFEREN .Text := T.DameCampo(0);
      InterForma1.NextTab (btTABLA_REFEREN);
    end;
  finally
    T.Free;
  end;

  //Se llama al procedimiento que carga la definición de la Llave Primaria de la Tabla seleccionada
  if edTABLA_REFEREN.Text <> '' then
    ObtDefPkTabRef (edTABLA_REFEREN.Text);
end;

function TWCrMetTablaRefer.SalvaTablaReferen ():Boolean;
var
  Stp_Alta_TabRf: TStoredProc;
  Mensaje       : String;
  Sit_TabRf     : String;
begin
  Result := False;

  //Verifica que los campos obligatorios no estén vacios
  if edTABLA_REFEREN.Text = '' then
  begin
    MessageDlg ('Es necesario que seleccione una Tabla Referenciada.', mtInformation, [mbOk], 0);
    edTABLA_REFEREN.SetFocus;
    exit;
  end
  else if (edNUM_COL_LLAVE.Text = '') or (edCOLUMNAS_LLAVE.Text = '') or (edCOLUMNAS_LLAVE_FORAN.Text = '') then
  begin
    MessageDlg ('La tabla que intenta salvar no tiene definición de Llave Primaria.', mtInformation, [mbOk], 0);
    edNUM_COL_LLAVE.SetFocus;
    exit;
  end
  else if edDESCRIPCION.Text = '' then
  begin
    MessageDlg ('Es necesario que proporcione una Descripción de la Tabla Referenciada.', mtInformation, [mbOk], 0);
    edDESCRIPCION.SetFocus;
    exit;
  end
  else if meCONSULTA_EN_PERSONA.Lines.Text = '' then
  begin
    MessageDlg ('Es necesario que capture la consulta que cargará los datos de la Tabla Referenciada en la configuración de Personas.', mtInformation, [mbOK], 0);
    meCONSULTA_EN_PERSONA.SetFocus;
    exit;
  end
  else if edCOL_DESCRIPCION.Text = '' then
  begin
    MessageDlg ('Es necesario que capture la Columna Descripción correspondiente a la Consulta En Persona, que contendrá la descripción para este tipo de ' +
    'Entidades.', mtInformation, [mbOK], 0);
    edCOL_DESCRIPCION.SetFocus;
    exit;
  end
  else if not ValidaConsultaEnPersona then
  begin
    meCONSULTA_EN_PERSONA.SetFocus;
    exit;
  end
  else if rdgSIT_TABLA_REFEREN.ItemIndex = -1 then
  begin
    MessageDlg ('Es necesario que indique la Situación de la Tabla Referenciada.', mtInformation, [mbOk], 0);
    rdgSIT_TABLA_REFEREN.SetFocus;
    exit;
  end;
  
  if Estado = ecInsertado then
    Mensaje := '¿Desea salvar la configuración capturada como una Tabla Referenciada?'
  else
    Mensaje := '¿Desea salvar los cambios realizados a la Tabla Referenciada?';

  //Obtiene la Situación de la Tabla Referenciada y establece los valores a insertar en la tabla
  if rdgSIT_TABLA_REFEREN.ItemIndex = 0 then
    Sit_TabRf := 'AC'
  else
    Sit_TabRf := 'IN';

  if MessageDlg (Mensaje, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    //Valida si la tabla que se desea guardar ya existe
    qTablasReferenExis.Close;
    qTablasReferenExis.DatabaseName := Objeto.Apli.DataBaseName;
    qTablasReferenExis.SessionName  := Objeto.Apli.SessionName;

    qTablasReferenExis.ParamByName ('Tabla_Referen').AsString := edTABLA_REFEREN.Text;
    qTablasReferenExis.Open;

    if (Estado = ecInsertado) and (qTablasReferenExis.RecordCount <> 0) then
      if MessageDlg ('La tabla que trata de salvar ya existe, ¿desea reemplazar la configuración de esta?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
        exit;

    Stp_Alta_TabRf := TStoredProc.Create (self);
    try
      with Stp_Alta_TabRf do
      begin
        Stp_Alta_TabRf.DatabaseName := Objeto.Apli.DatabaseName;
        Stp_Alta_TabRf.SessionName  := Objeto.Apli.SessionName;
        Stp_Alta_TabRf.StoredProcName := 'SISTEMAS.PKGCRADMINCOMERCIAL.STP_ALTA_TABRF';

        Params.Clear;
        Params.CreateParam (ftInteger, 'peID_Tabla_Ref',           ptInputOutput);
        Params.CreateParam (ftString,  'peTabla_Referenciada',     ptInput);
        Params.CreateParam (ftString,  'peDescripcion',            ptInput);
        Params.CreateParam (ftInteger, 'peNum_Col_Llave',          ptInput);
        Params.CreateParam (ftString,  'peColumnas_Llave',         ptInput);
        Params.CreateParam (ftString,  'peColumnas_Llave_Foranea', ptInput);
        Params.CreateParam (ftString,  'peConsulta_En_Persona',    ptInput);
        Params.CreateParam (ftString,  'peColumna_Descripcion',    ptInput);
        Params.CreateParam (ftDate,    'peF_Vigente_Desde',        ptInput);
        Params.CreateParam (ftString,  'peSit_Tabla_Ref',          ptInput);
        Params.CreateParam (ftString,  'peCve_Usu_Alta',           ptInput);
        Params.CreateParam (ftDate,    'peFH_Alta',                ptInput);
        Params.CreateParam (ftInteger, 'psError',                  ptOutput);
        Params.CreateParam (ftString,  'psMsgError',               ptOutput);
        Prepare;

        ParamByName ('peTabla_Referenciada')    .AsString  := edTABLA_REFEREN.Text;
        ParamByName ('peDescripcion')           .AsString  := edDESCRIPCION.Text;
        ParamByName ('peNum_Col_Llave')         .AsInteger := StrToInt(edNUM_COL_LLAVE.Text);
        ParamByName ('peColumnas_Llave')        .AsString  := edCOLUMNAS_LLAVE.Text;
        ParamByName ('peColumnas_Llave_Foranea').AsString  := edCOLUMNAS_LLAVE_FORAN.Text;
        ParamByName ('peConsulta_En_Persona')   .AsString  := meCONSULTA_EN_PERSONA.Lines.Text;
        ParamByName ('peColumna_Descripcion')   .AsString  := edCOL_DESCRIPCION.Text;
        ParamByName ('peSit_Tabla_Ref')         .AsString  := Sit_TabRf;
        ParamByName ('peCve_Usu_Alta')          .AsString  := Objeto.Apli.Usuario;
        ParamByName ('peFH_Alta')               .AsDate    := Now;
        ExecProc;

        if ParamByName ('psError').AsInteger = 0 then
        begin
          Result := True;
          edID_TABLA_REFEREN.Text := ParamByName ('peID_Tabla_Ref').AsString;
          MessageDlg (Format ('Tabla Referenciada [%s] salvada exitosamente!', [edTABLA_REFEREN.Text]), mtInformation, [mbOk], 0)
        end
        else
          ShowMessage('Error en ' + ParamByName ('PSERROR').AsString + ': ' + ParamByName('PSMSGERROR').AsString);

        UnPrepare;
      end;
    finally
      Stp_Alta_TabRf.Free;
    end;
  end;
end;

function TWCrMetTablaRefer.ActualizaDefLlave ():Boolean;
var
  Stp_Act_Pk_TabRf: TStoredProc;
begin
    Result := False;

    Stp_Act_Pk_TabRf := TStoredProc.Create (self);
  try
    with Stp_Act_Pk_TabRf do
    begin
      Stp_Act_Pk_TabRf.DatabaseName   := Objeto.Apli.DataBaseName;
      Stp_Act_Pk_TabRf.SessionName    := Objeto.Apli.SessionName;
      Stp_Act_Pk_TabRf.StoredProcName := 'SISTEMAS.PKGCRADMINCOMERCIAL.STP_ACT_PK_TABRF';

      Params.Clear;
      Params.CreateParam (ftInteger, 'peID_Tabla_Ref',       ptInput);
      Params.CreateParam (ftString,  'peTabla_Referenciada', ptInput);
      Params.CreateParam (ftString,  'peCve_Usu_Modifica',   ptInput);
      Params.CreateParam (ftDate,    'peF_Vigente_Desde',    ptInput);
      Params.CreateParam (ftInteger, 'psError',              ptOutput);
      Params.CreateParam (ftString,  'psMsgError',           ptOutput);
      Prepare;

      ParamByName ('peID_Tabla_Ref')      .AsInteger := StrToInt (edID_TABLA_REFEREN.Text);
      ParamByName ('peTabla_Referenciada').AsString  := edTABLA_REFEREN.Text;
      ParamByName ('peCve_Usu_Modifica')  .AsString  := Objeto.Apli.Usuario;
      ExecProc;

      if ParamByName ('psError').AsInteger = 0 then
      begin
        MessageDlg (Format ('La Definición de la Llave Primaria de la Tabla [%s], se actualizó exitosamente!', [edTABLA_REFEREN.Text]), mtInformation, [mbOk], 0);
        bbtnACTUALIZA_LLAVE.Enabled := False;
        Result := True;
      end
      else
        ShowMessage('Error en ' + ParamByName ('PSERROR').AsString + ': ' + ParamByName('PSMSGERROR').AsString);

      Unprepare;
    end;
  finally
    Stp_Act_Pk_TabRf.Free;
  end;
end;

procedure TWCrMetTablaRefer.actActualizarLlaveExecute(Sender: TObject);
var
  Act_Exitosa: boolean;
begin
  //Actualiza la definición de la Llave Primaria de la tabla actual
  Act_Exitosa := ActualizaDefLlave;

  //Si la ctualización de la definición de la Llave Primaria se realizó correctamente entonces se obtiene la definición actualizada
  qDatosTabAct.Close;
  qDatosTabAct.DatabaseName := Objeto.Apli.DataBaseName;
  qDatosTabAct.SessionName  := Objeto.Apli.SessionName;

  qDatosTabAct.ParamByName ('Tabla_Referenciada').AsString := edTABLA_REFEREN.Text;
  qDatosTabAct.Open;

  if qDatosTabAct.RecordCount <> 0 then
  begin
    edNUM_COL_LLAVE       .Text := qDatosTabAct.FieldByName ('Num_Col_Llave')       .AsString;
    edCOLUMNAS_LLAVE      .Text := qDatosTabAct.FieldByName ('Columnas_Llave')      .AsString;
    edCOLUMNAS_LLAVE_FORAN.Text := qDatosTabAct.FieldByName ('Columnas_Llave_Foran').AsString;
  end;
end;

procedure TWCrMetTablaRefer.FormShow(Sender: TObject);
begin
  lbDempresa.Caption := Objeto.ParamCre.EMPRESA.AsString;
  lbDFecha  .Caption := Objeto.ParamCre.FECHA  .AsString;
  lbDUsuario.Caption := Objeto.ParamCre.USUARIO.AsString;
  lbDPerfil .Caption := Objeto.ParamCre.PERFIL .AsString;
end;

function TWCrMetTablaRefer.ValidaConsultaEnPersona (): Boolean;
var
  vlQry                           : TQuery;
  n                               : Integer;
  ColLlave, NomCol, ColLlaveNoCont: String;

begin
  result         := False;
  ColLlave       := edCOLUMNAS_LLAVE.Text + ',';
  ColLlaveNoCont := '';

  //Valida que la consulta ingresada en el campo Consulta En Persona se pueda ejecutar correctamente
  try
    vlQry := TQuery.Create (self);
    vlQry.DatabaseName := Objeto.Apli.DataBaseName;
    vlQry.SessionName  := Objeto.Apli.SessionName;
    vlQry.SQL.Add (meCONSULTA_EN_PERSONA.Lines.Text);
    vlQry.Open;

    if not vlQry.Eof then
    begin
      //Valida que las Columnas Llave de la Tabla Referenciada seleccionada estén contenidas en la Consulta
      For n := 1 to StrToInt (edNUM_COL_LLAVE.Text) do
      begin
        NomCol := Copy (ColLlave, 1, Pos (',', ColLlave) - 1);
        Delete (ColLlave, 1, Pos (',', ColLlave));

        if vlQry.Fields.FindField (NomCol) = nil then
        begin
          if n > 1 then
            ColLlaveNoCont := ColLlaveNoCont + ', ';

          ColLlaveNoCont := ColLlaveNoCont + NomCol;
        end;
      end;

      if ColLlaveNoCont <> '' then
      begin
        MessageDlg('Las siguientes Columnas de la Llave Primaria de la Tabla Referenciada seleccionada, no se encuentran contenidas en la Consulta En Persona: ' +
        ColLlaveNoCont + '. Favor de verificarla.', mtInformation, [mbOK], 0);
        result := False;
      end
      else
      begin
        //Si las columnas que componen la Llave Primaria se encuentran contenidas en la Consulta en Persona,
        //entonces valida que la Columna Descripción también lo este
        if vlQry.Fields.FindField (edCOL_DESCRIPCION.Text) = nil then
        begin
          MessageDlg (Format ('La Consulta En Persona no contiene la Columna Descripción [%s]. Favor de verificarla.', [edCOL_DESCRIPCION.Text]), mtInformation, [mbOK], 0);
          result := False;
        end
        else
          result := True;
      end;
    end;
  except
    on E: Exception do
      MessageDlg ('La Consulta En Persona es incorrecta. Favor de verificarla.', mtInformation, [mbOK], 0);
  end;
end;

end.
