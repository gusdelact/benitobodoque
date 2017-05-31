// Sistema         : Clase de CR_MET_ASIG_MODELO
// Fecha de Inicio : 07/03/2013
// Función forma   : Clase de CR_MET_ASIG_MODELO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCrMeAsMo;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntParamCre;

Type
 TEstadoConfiguracion = (ecVacio, ecEditado, ecInsertado, ecConsulta);
 TCrMeAsMo= class;

  TWCrMetAsigModelo=Class(TForm)
    InterForma1             : TInterForma;
    Panel1: TPanel;
    lbNOMBRE_MODELO: TLabel;
    edNOMBRE_MODELO: TEdit;
    bbtnMODELO: TBitBtn;
    edDESC_MODELO: TEdit;
    rdgTIPO_ENTIDAD: TRadioGroup;
    lbID_ENTIDAD: TLabel;
    bbtnENTIDAD: TBitBtn;
    edDESC_ENTIDAD: TEdit;
    rdgSITUACION: TRadioGroup;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    lblDESC_MODELO: TLabel;
    lblDESC_ENTIDAD: TLabel;
    edID_MODELO: TEdit;
    lblID_MODELO: TLabel;
    edID_ENTIDAD: TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure bbtnMODELOClick(Sender: TObject);
    procedure bbtnENTIDADClick(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1Buscar(Sender: TObject);
    procedure rdgTIPO_ENTIDADClick(Sender: TObject);
    procedure edID_ENTIDADChange(Sender: TObject);
    procedure edID_MODELOChange(Sender: TObject);
    private
    { Private declarations }
      Estado  : TEstadoConfiguracion;
      function ValidaCampos (): Boolean;
    public
    { Public declarations }
    Objeto  : TCrMeAsMo;
end;
 TCrMeAsMo= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        TIPO_ENTIDAD             : TInterCampo;
        ID_ENTIDAD               : TInterCampo;
        ID_MODELO                : TInterCampo;
        F_VIGENTE_DESDE          : TInterCampo;
        SIT_ASIG_MODELO          : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        FH_ALTA                  : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        FH_MODIFICA              : TInterCampo;
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


constructor TCrMeAsMo.Create( AOwner : TComponent );
begin Inherited;

      TIPO_ENTIDAD             := CreaCampo('TIPO_ENTIDAD',ftString,tsNinguno,tsNinguno,True);
      TIPO_ENTIDAD    .Caption := 'Tipo Entidad';
      with TIPO_ENTIDAD do
      begin
        Size     := 11;
        UseCombo := True;
        ComboLista.Add ('0');
        ComboDatos.Add ('METODOLOGIA');
        ComboLista.Add ('1');
        ComboDatos.Add ('PERSONA');
      end;
      ID_ENTIDAD               := CreaCampo('ID_ENTIDAD',ftFloat,tsNinguno,tsNinguno,True);
      ID_ENTIDAD      .Caption := 'Número de Entidad';
      ID_MODELO                := CreaCampo('ID_MODELO',ftFloat,tsNinguno,tsNinguno,True);
      ID_MODELO       .Caption := 'Número de Modelo';
      F_VIGENTE_DESDE          := CreaCampo('F_VIGENTE_DESDE',ftDate,tsNinguno,tsNinguno,True);
      F_VIGENTE_DESDE .Caption := 'Fecha Vigente Desde';
      SIT_ASIG_MODELO          := CreaCampo('SIT_ASIG_MODELO',ftString,tsNinguno,tsNinguno,True);
      SIT_ASIG_MODELO .Caption := 'Situación Asig Modelo';
      with SIT_ASIG_MODELO do
      begin
        Size     := 2;
        UseCombo := True;
        ComboLista.Add ('0');
        ComboDatos.Add ('AC');
        ComboLista.Add ('1');
        ComboDatos.Add ('IN');
      end;
      CVE_USU_ALTA             := CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_ALTA    .Caption := 'Clave de Usu Alta';
      FH_ALTA                  := CreaCampo('FH_ALTA',ftDateTime,tsNinguno,tsNinguno,True);
      FH_ALTA         .Caption := 'Fecha y Hora Alta';
      CVE_USU_MODIFICA         := CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_MODIFICA.Caption := 'Clave de Usu Modifica';
      FH_MODIFICA              := CreaCampo('FH_MODIFICA',ftDateTime,tsNinguno,tsNinguno,True);
      FH_MODIFICA     .Caption := 'Fecha y Hora Modifica';
      FKeyFields.Add('TIPO_ENTIDAD');
      FKeyFields.Add('ID_ENTIDAD');
      FKeyFields.Add('ID_MODELO');

      TableName := 'CR_MET_ASIG_MODELO'; 
      UseQuery := True;
      HelpFile := 'IntCrMeAsMo.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrMeAsMo.Destroy;
begin inherited;
end;


function TCrMeAsMo.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrMetAsigModelo;
begin
   W:=TWCrMetAsigModelo.Create(Self);
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


Function TCrMeAsMo.InternalBusca:Boolean;
var
  T: TInterFindit;
begin
{  InternalBusca := False;
  T := CreaBuscador('ICrMeAM.it','S,F,F');
  Try
    if Active then
    begin
      T.Param(0,TIPO_ENTIDAD.AsString);
      T.Param(1,ID_ENTIDAD.AsString);
      T.Param(2,ID_MODELO.AsString);
    end;

    if T.Execute then
      InternalBusca := FindKey([T.DameCampo(0), T.DameCampo(1), T.DameCampo(2)]);
  finally
    T.Free;
  end;}
end;

function TCrMeAsMo.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CR_MET_ASIG_MODELO********************)
(*                                                                              *)
(*  FORMA DE CR_MET_ASIG_MODELO                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_MET_ASIG_MODELO********************)

procedure TWCrMetAsigModelo.FormShow(Sender: TObject);
begin
  Objeto.ID_ENTIDAD     .Control := edID_ENTIDAD;
  Objeto.ID_MODELO      .Control := edID_MODELO;
  Objeto.TIPO_ENTIDAD   .Control := rdgTIPO_ENTIDAD;
  Objeto.SIT_ASIG_MODELO.Control := rdgSITUACION;

  //Asigna los valores a los campos informativos que se muestran en la parte inferior de la pantalla
  lbDEmpresa.Caption := Objeto.ParamCre.EMPRESA.AsString;
  lbDFecha  .Caption := Objeto.ParamCre.FECHA  .AsString;
  lbDUsuario.Caption := Objeto.ParamCre.USUARIO.AsString;
  lbDPerfil .Caption := Objeto.ParamCre.PERFIL .AsString;

  //Oculta el botón Eliminar
  Interforma1.BtnEliminar.Visible := False;
  //Recorre de posición los botones de Aceptar y Cancelar
  Interforma1.BtnCancelar.Top := Interforma1.BtnAceptar .Top;
  Interforma1.BtnAceptar .Top := Interforma1.BtnEliminar.Top;
end;

procedure TWCrMetAsigModelo.FormDestroy(Sender: TObject);
begin
  Objeto.ID_ENTIDAD     .Control := nil;
  Objeto.ID_MODELO      .Control := nil;
  Objeto.TIPO_ENTIDAD   .Control := nil;
  Objeto.SIT_ASIG_MODELO.Control := nil;
end;

procedure TWCrMetAsigModelo.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrMetAsigModelo.InterForma1DespuesNuevo(Sender: TObject);
begin
  //Asigna como estado Insertado
  Estado := ecInsertado;

  //Limpia los campos
  edID_MODELO    .Text      := '';
  edNOMBRE_MODELO.Text      := '';
  edDESC_MODELO  .Text      := '';
  edID_ENTIDAD   .Text      := '';
  edDESC_ENTIDAD .Text      := '';
  rdgSITUACION   .ItemIndex := -1;
  rdgTIPO_ENTIDAD.ItemIndex := -1;

  //Cuando se da clic en Nuevo la situación Actual de la asignación se cambia a Activa
  rdgSITUACION.ItemIndex := 0;

  //Pone los campos ID_MODELO, ID_ENTIDAD como ReadOnly
  edID_MODELO .ReadOnly := True;
  edID_ENTIDAD.ReadOnly := True;

  //Pone el focus en el primer campo a capturar
  edID_MODELO.SetFocus;
end;

procedure TWCrMetAsigModelo.InterForma1DespuesModificar(Sender: TObject);
begin
  Estado := ecEditado;

  //Pone los campos ID_MODELO, ID_ENTIDAD como ReadOnly
  edID_MODELO .ReadOnly := True;
  edID_ENTIDAD.ReadOnly := True;
  edID_MODELO .Color    := clBtnFace;
  edID_ENTIDAD.Color    := clBtnFace;

  //Deshabilita los botones que despliegan los FindIt
  bbtnMODELO .Enabled := False;
  bbtnENTIDAD.Enabled := False;

  //Deshabilita el campo "Tipo de Entidad Asociada"
  rdgTIPO_ENTIDAD.Enabled := False;
end;

//procedure TWCrMetAsigModelo.BitBtn1Click(Sender: TObject);
//begin // Objeto.Reporte; 
//end;


procedure TWCrMetAsigModelo.bbtnMODELOClick(Sender: TObject);
var
  T: TInterFindit;
begin
  T := Objeto.CreaBuscador ('ICRMODELO.IT', 'S');
  try
    if T.Execute then
    begin
      edID_Modelo    .Text := T.DameCampo (0);
      edNOMBRE_MODELO.Text := T.DameCampo (1);
      edDESC_MODELO  .Text := T.DameCampo (2);
    end;
  finally
    T.Free;
  end;
end;

procedure TWCrMetAsigModelo.bbtnENTIDADClick(Sender: TObject);
var
  T: TInterFindit;
begin
  if rdgTIPO_ENTIDAD.ItemIndex = 0 then
  begin
    T := Objeto.CreaBuscador ('ICRMETOD.IT', 'S');
    try
      if T.Execute then
      begin
        edID_ENTIDAD  .Text := T.DameCampo (0);
        edDESC_ENTIDAD.Text := T.DameCampo (2);
      end;
    finally
      T.Free;
    end;
  end
  else if rdgTIPO_ENTIDAD.ItemIndex = 1 then
  begin
    T := Objeto.CreaBuscador ('ICRPERSONA.IT', 'S');
    try
      if T.Execute then
      begin
        edID_ENTIDAD  .Text := T.DameCampo (0);
        edDESC_ENTIDAD.Text := T.DameCampo (1);
      end;
    finally
    end;
  end
  else
    MessageDlg ('Es necesario que seleccione el Tipo de Entidad Asociada.', mtInformation, [mbOK], 0);
end;

procedure TWCrMetAsigModelo.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
  //Valida que los campos se encuentren llenos para poder salvar
  if ValidaCampos then
  begin
    //Asigna los valores correspondientes a los objetos creados para poder salvar la Asignación

    //TIPO_ENTIDAD
    if rdgTIPO_ENTIDAD.ItemIndex = 0 then
      Objeto.TIPO_ENTIDAD.AsString := 'METODOLOGIA'
    else if rdgTIPO_ENTIDAD.ItemIndex = 1 then
      Objeto.TIPO_ENTIDAD.AsString := 'PERSONA';

    //SIT_ASIG_MODELO
    if rdgSITUACION.ItemIndex = 0 then
      Objeto.SIT_ASIG_MODELO.AsString := 'AC'
    else if rdgSITUACION.ItemIndex = 1 then
      Objeto.SIT_ASIG_MODELO.AsString := 'IN';

    if Estado = ecInsertado then
    begin
      //CVE_USU_ALTA
      Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
      //FH_ALTA
      Objeto.FH_ALTA.AsDateTime    := Now;
    end
    else if Estado = ecEditado then
    begin
      //CVE_USU_MODIFICA
      Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
      //FH_MODIFICA
      Objeto.FH_MODIFICA.AsDateTime    := Now;
    end;

    Realizado := True;
  end
  else
  begin
    Realizado := False;
    exit;
  end;
end;

function TWCrMetAsigModelo.ValidaCampos (): Boolean;
begin
  result := False;

  if edID_Modelo.Text = '' then
  begin
    MessageDlg ('Es necesario que seleccione un Modelo.', mtInformation, [mbOK], 0);
    edID_Modelo.SetFocus;
    result := False;
  end
  else if rdgTIPO_ENTIDAD.ItemIndex = -1 then
  begin
    MessageDlg ('Es necesario que seleccione un Tipo de Entidad Asociada.', mtInformation, [mbOK], 0);
    rdgTIPO_ENTIDAD.SetFocus;
    result := False;
  end
  else if edID_ENTIDAD.Text = '' then
  begin
    MessageDlg ('Es necesario que seleccione una Metodología o una Persona.', mtInformation, [mbOK], 0);
    edID_ENTIDAD.SetFocus;
    result := False;
  end
  else if rdgSITUACION.ItemIndex = -1 then
  begin
    MessageDlg ('Es necesario que indique la Situación de la Asignación.', mtInformation, [mbOK], 0);
    rdgSITUACION.SetFocus;
    result := False;
  end
  else
    result := True;
end;

procedure TWCrMetAsigModelo.InterForma1Buscar(Sender: TObject);
var
  T                 : TInterFindit;
  vlQry             : TQuery;
  NomTabla, NomCampo: String;
  TIF               : TInterFrame;
begin
  T := Objeto.CreaBuscador ('ICRMEAM.IT', 'S');
  try
    if Active then
    begin
      T.Param(0,Objeto.TIPO_ENTIDAD.AsString);
      T.Param(1,Objeto.ID_ENTIDAD.AsString);
      T.Param(2,Objeto.ID_MODELO.AsString);
      T.Param(3,Objeto.SIT_ASIG_MODELO.AsString);
    end;

    if T.Execute then
    begin
      Objeto.FindKey ([T.DameCampo(0), T.DameCampo(1), T.DameCampo(2)]);

      //Indica el tipo de Entidad Asociada
      if Objeto.TIPO_ENTIDAD.AsString = 'METODOLOGIA' then
      begin
        rdgTIPO_ENTIDAD.ItemIndex := 0;
        NomTabla                  := 'CR_Met_Metodologia';
        NomCampo                  := 'ID_Metodologia';
      end
      else if Objeto.TIPO_ENTIDAD.AsString = 'PERSONA' then
      begin
        rdgTIPO_ENTIDAD.ItemIndex := 1;
        NomTabla                  := 'CR_Met_Persona';
        NomCampo                  := 'ID_Persona';
      end;

      //Indica el estatus de la Asignación
      if Objeto.SIT_ASIG_MODELO.AsString = 'AC' then
        rdgSITUACION.ItemIndex := 0
      else if Objeto.SIT_ASIG_MODELO.AsString = 'IN' then
        rdgSITUACION.ItemIndex := 1;

      Interforma1.BtnModificarClick (Self);
      Interforma1.BtnCancelarClick  (Self);
    end;
  finally
    T.Free;
  end;
end;

procedure TWCrMetAsigModelo.rdgTIPO_ENTIDADClick(Sender: TObject);
begin
  edID_ENTIDAD  .Text := '';
  edDESC_ENTIDAD.Text := '';
end;

procedure TWCrMetAsigModelo.edID_ENTIDADChange(Sender: TObject);
var
  vlQry: TQuery;
  NomTabla, NomCampo: String;
begin
  if Objeto.TIPO_ENTIDAD.AsString = 'METODOLOGIA' then
  begin
    NomTabla                  := 'CR_Met_Metodologia';
    NomCampo                  := 'ID_Metodologia';
  end
  else if Objeto.TIPO_ENTIDAD.AsString = 'PERSONA' then
  begin
    NomTabla                  := 'CR_Met_Persona';
    NomCampo                  := 'ID_Persona';
  end;

  if (NomTabla <> '') and (NomCampo <> '') then
  begin
    try
      //Obtiene la Descripción de la Entidad Asociada
      vlQry := TQuery.Create (self);
      vlQry.DatabaseName := Objeto.Apli.DataBaseName;
      vlQry.SessionName  := Objeto.Apli.SessionName;
      vlQry.SQL.Clear;
      vlQry.SQL.Add ('Select Descripcion');
      vlQry.SQL.Add ('  From ' + NomTabla);
      vlQry.SQL.Add (' Where ' + NomCampo + ' = :IDCampo' );
      vlQry.Params.Clear;
      vlQry.Params.CreateParam (ftInteger, 'IDCampo', ptInput);
      vlQry.ParamByName ('IDCampo').AsInteger := Objeto.ID_ENTIDAD.AsInteger;
      vlQry.Open;

      edDESC_ENTIDAD.Text := vlQry.FieldByName ('Descripcion').AsString;
    finally
      vlQry.Free;
    end;
  end;
end;

procedure TWCrMetAsigModelo.edID_MODELOChange(Sender: TObject);
var
  vlQry: TQuery;
begin
  //Obtiene el Nombre y la Descripción del Modelo
  if edID_Modelo.Text <> '' then
  begin
    vlQry := TQuery.Create (self);
    vlQry.DatabaseName := Objeto.Apli.DataBaseName;
    vlQry.SessionName  := Objeto.Apli.SessionName;
    vlQry.SQL.Clear;
    vlQry.SQL.Add ('Select Nombre,');
    vlQry.SQL.Add ('       Descripcion');
    vlQry.SQL.Add ('  From CR_Met_Modelo');
    vlQry.SQL.Add (' Where ID_Modelo = :IDModelo');
    vlQry.Params.Clear;
    vlQry.Params.CreateParam (ftInteger, 'IDModelo', ptInput);
    vlQry.ParamByName ('IDModelo').AsInteger := StrToInt (edID_Modelo.Text);
    vlQry.Open;

    edNOMBRE_MODELO.Text := vlQry.FieldByName ('Nombre')     .AsString;
    edDESC_MODELO  .Text := vlQry.FieldByName ('Descripcion').AsString;

    vlQry.Free;
  end
  else
  begin
    edNOMBRE_MODELO.Text := '';
    edDESC_MODELO  .Text := '';
  end;
end;

end.
