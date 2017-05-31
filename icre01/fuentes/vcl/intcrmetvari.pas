// Sistema         : Clase de CR_MET_VARIABLE
// Fecha de Inicio : 18/02/2013
// Función forma   : Clase de CR_MET_VARIABLE
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCrMetVari;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntParamCre;

Type
 TArrayString = array of string;
 TEstadoConfiguracion = (ecVacio, ecEditado, ecInsertado, ecConsulta);

 TCrMetVari= class;

  TWCrMetVariable=Class(TForm)
    InterForma1             : TInterForma;
    Panel1: TPanel;
    lbID_VARIABLE: TLabel;
    edID_VARIABLE: TEdit;
    lbNOMBRE: TLabel;
    edNOMBRE: TEdit;
    lbDESCRIPCION: TLabel;
    edDESCRIPCION: TEdit;
    lbTIPO_DATO: TLabel;
    lbLONGITUD: TLabel;
    edLONGITUD: TEdit;
    lbPRECISION: TLabel;
    edPRECISION: TEdit;
    lbFORMATO: TLabel;
    edFORMATO: TEdit;
    lbVAL_DEFAULT: TLabel;
    edVAL_DEFAULT: TEdit;
    lbFUNC_BUSQUEDA: TLabel;
    edFUNC_BUSQUEDA: TEdit;
    lbLISTA_FIJA_OPC: TLabel;
    edLISTA_FIJA_OPC: TEdit;
    lbTIPO_CAP_OP_MULTIPLE: TLabel;
    lbVAL_RET_OP_MULTIPLE: TLabel;
    lbVAL_DEFAULT_COL_INAC: TLabel;
    edVAL_DEFAULT_COL_INAC: TEdit;
    lbFORMA_INGRESO: TLabel;
    lbURL: TLabel;
    edURL: TEdit;
    rdgSIT_VARIABLE: TRadioGroup;
    cbTIPO_DATO: TComboBox;
    cbTIPO_CAP_OP_MULTIPLE: TComboBox;
    cbVAL_RET_OP_MULTIPLE: TComboBox;
    cbFORMA_INGRESO: TComboBox;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    updLONGITUD: TUpDown;
    updPRECISION: TUpDown;
    bbtnNOMBRE_FINDIT: TBitBtn;
    meVAL_BD: TMemo;
    meELEMENTOS: TMemo;
    lblVAL_BD: TLabel;
    lblELEMENTOS: TLabel;
    edDESC_FINDIT: TEdit;
    Label3: TLabel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edNOMBREExit(Sender: TObject);
    procedure edLONGITUDExit(Sender: TObject);
    procedure edPRECISIONExit(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure cbTIPO_DATOChange(Sender: TObject);
    procedure bbtnNOMBRE_FINDITClick(Sender: TObject);
    procedure cbTIPO_CAP_OP_MULTIPLEChange(Sender: TObject);
    procedure cbFORMA_INGRESOChange(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure edLISTA_FIJA_OPCChange(Sender: TObject);
    procedure edFUNC_BUSQUEDAChange(Sender: TObject);
    private
    { Private declarations }
    Estado: TEstadoConfiguracion;
    procedure HabilitarCampos;
    procedure ObtListasValElem;
    function  ObtListaFijaOpc: Boolean;
    function  ValidacionListas: Boolean;
    function  Split (S: string; Separator: char): TArrayString;
    function  CalculaLongitud (TipoCapOpMul: String): Integer;
    public
    { Public declarations }
    Objeto : TCrMetVari;
  end;

  TCrMetVari= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ID_VARIABLE              : TInterCampo;
        F_VIGENTE_DESDE          : TInterCampo;
        NOMBRE                   : TInterCampo;
        DESCRIPCION              : TInterCampo;
        TIPO_DATO                : TInterCampo;
        LONGITUD                 : TInterCampo;
        PRECISION                : TInterCampo;
        FORMATO                  : TInterCampo;
        VAL_DEFAULT              : TInterCampo;
        FUNC_BUSQUEDA            : TInterCampo;
        LISTA_FIJA_OPC           : TInterCampo;
        TIPO_CAP_OP_MULTIPLE     : TInterCampo;
        VAL_RET_OP_MULTIPLE      : TInterCampo;
        VAL_DEFAULT_COL_INAC     : TInterCampo;
        FORMA_INGRESO            : TInterCampo;
        CONSULTA_VAL_CAPTURA     : TInterCampo;
        CONSULTA_CALC_ESPEC      : TInterCampo;
        CONSULTA_CALC_MASIV      : TInterCampo;
        URL                      : TInterCampo;
        SIT_VARIABLE             : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        FH_ALTA                  : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        FH_MODIFICA              : TInterCampo;
        W                        : TWCrMetVariable;

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


constructor TCrMetVari.Create( AOwner : TComponent ); 
begin Inherited; 
      ID_VARIABLE                  := CreaCampo('ID_VARIABLE',ftFloat,tsNinguno,tsNinguno,True);
      ID_VARIABLE         .Caption := 'Identificador de Variable';
      NOMBRE                       := CreaCampo('NOMBRE',ftString,tsNinguno,tsNinguno,True);
      NOMBRE              .Caption := 'Nombre Variable';
      NOMBRE              .IsRequiered := True;
      F_VIGENTE_DESDE              := CreaCampo('F_VIGENTE_DESDE',ftDate,tsNinguno,tsNinguno,True);
      F_VIGENTE_DESDE     .Caption := 'Fecha Vigente Desde';
      DESCRIPCION                  := CreaCampo('DESCRIPCION',ftString,tsNinguno,tsNinguno,True);
      DESCRIPCION         .Caption := 'Descripción';
      DESCRIPCION         .IsRequiered := True;
      TIPO_DATO                    := CreaCampo('TIPO_DATO',ftString,tsNinguno,tsNinguno,True);
      TIPO_DATO           .Caption := 'Tipo Dato';
      TIPO_DATO           .IsRequiered := True;
      LONGITUD                     :=CreaCampo('LONGITUD',ftFloat,tsNinguno,tsNinguno,True);
      LONGITUD            .Caption := 'Longitud';
      PRECISION                    := CreaCampo('PRECISION',ftFloat,tsNinguno,tsNinguno,True);
      PRECISION           .Caption := 'Precisión';
      FORMATO                      := CreaCampo('FORMATO',ftString,tsNinguno,tsNinguno,True);
      FORMATO             .Caption := 'Formato';
      VAL_DEFAULT                  := CreaCampo('VAL_DEFAULT',ftString,tsNinguno,tsNinguno,True);
      VAL_DEFAULT         .Caption := 'Valor por Default';
      FUNC_BUSQUEDA                := CreaCampo('FUNC_BUSQUEDA',ftString,tsNinguno,tsNinguno,True);
      FUNC_BUSQUEDA       .Caption := 'Función de Búsqueda';
      LISTA_FIJA_OPC               := CreaCampo('LISTA_FIJA_OPC',ftString,tsNinguno,tsNinguno,True);
      LISTA_FIJA_OPC      .Caption := 'Lista Fija de Opciones';
      TIPO_CAP_OP_MULTIPLE         := CreaCampo('TIPO_CAP_OP_MULTIPLE',ftString,tsNinguno,tsNinguno,True);
      TIPO_CAP_OP_MULTIPLE.Caption := 'Tipo Captura Opción Múltiple';
      VAL_RET_OP_MULTIPLE          := CreaCampo('VAL_RET_OP_MULTIPLE',ftString,tsNinguno,tsNinguno,True);
      VAL_RET_OP_MULTIPLE .Caption := 'Valor Retorno Opción Múltiple';
      VAL_DEFAULT_COL_INAC         := CreaCampo('VAL_DEFAULT_COL_INAC',ftString,tsNinguno,tsNinguno,True);
      VAL_DEFAULT_COL_INAC.Caption := 'Valor Default Variable Inactiva';
      FORMA_INGRESO                := CreaCampo('FORMA_INGRESO',ftString,tsNinguno,tsNinguno,True);
      FORMA_INGRESO       .Caption := 'Forma Ingreso';
      FORMA_INGRESO       .IsRequiered := True;
      URL                          := CreaCampo('URL',ftString,tsNinguno,tsNinguno,True);
      URL                 .Caption := 'URL';
      SIT_VARIABLE                 := CreaCampo('SIT_VARIABLE',ftString,tsNinguno,tsNinguno,True);
      SIT_VARIABLE        .Caption := 'Situación Variable';
      SIT_VARIABLE        .IsRequiered := True;
      with SIT_VARIABLE do
      begin
        Size     := 2;
        UseCombo := True;
        ComboLista.Add ('0');  ComboDatos.Add ('AC');
        ComboLista.Add ('1');  ComboDatos.Add ('IN');
      end;
      CVE_USU_ALTA                 := CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_ALTA        .Caption := 'Clave de Usu Alta';
      FH_ALTA                      := CreaCampo('FH_ALTA',ftDateTime,tsNinguno,tsNinguno,True);
      FH_ALTA             .Caption := 'Fecha y Hora Alta';
      CVE_USU_MODIFICA             := CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_MODIFICA    .Caption := 'Clave de Usu Modifica';
      FH_MODIFICA                  := CreaCampo('FH_MODIFICA',ftDateTime,tsNinguno,tsNinguno,True);
      FH_MODIFICA         .Caption := 'Fecha y Hora Modifica';
      FKeyFields.Add('NOMBRE');

      TableName := 'CR_MET_VARIABLE';
      UseQuery := True;
      HelpFile := 'IntCrMetVari.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrMetVari.Destroy;
begin inherited;
end;


function TCrMetVari.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrMetVariable;
begin
   W:=TWCrMetVariable.Create(Self);
   try
      W.Objeto:= Self;
      W.Objeto.W := W;
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


Function TCrMetVari.InternalBusca:Boolean;
Var
  T: TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('ICrMeVa.it','F');
  Try
    if Active then
    begin
      T.Param(0,ID_VARIABLE.AsString);
    end;

    if T.Execute then
      InternalBusca := FindKey([T.DameCampo(1)]);

    W.ObtListasValElem;

  finally
    T.Free;
  end;
end;

function TCrMetVari.Reporte:Boolean;
begin //Execute_Reporte();
end;


(***********************************************FORMA CR_MET_VARIABLE********************)
(*                                                                              *)
(*  FORMA DE CR_MET_VARIABLE                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_MET_VARIABLE********************)

procedure TWCrMetVariable.FormShow(Sender: TObject);
begin
      Objeto.ID_VARIABLE         .Control := edID_VARIABLE;
      Objeto.NOMBRE              .Control := edNOMBRE;
      Objeto.DESCRIPCION         .Control := edDESCRIPCION;
      Objeto.TIPO_DATO           .Control := cbTIPO_DATO;
      Objeto.LONGITUD            .Control := edLONGITUD;
      Objeto.PRECISION           .Control := edPRECISION;
      Objeto.FORMATO             .Control := edFORMATO;
      Objeto.VAL_DEFAULT         .Control := edVAL_DEFAULT;
      Objeto.FUNC_BUSQUEDA       .Control := edFUNC_BUSQUEDA;
      Objeto.LISTA_FIJA_OPC      .Control := edLISTA_FIJA_OPC;
      Objeto.TIPO_CAP_OP_MULTIPLE.Control := cbTIPO_CAP_OP_MULTIPLE;
      Objeto.VAL_RET_OP_MULTIPLE .Control := cbVAL_RET_OP_MULTIPLE;
      Objeto.VAL_DEFAULT_COL_INAC.Control := edVAL_DEFAULT_COL_INAC;
      Objeto.FORMA_INGRESO       .Control := cbFORMA_INGRESO;
      Objeto.URL                 .Control := edURL;
      Objeto.SIT_VARIABLE        .Control := rdgSIT_VARIABLE;

      //Obtiene los datos para el panel de información que se muestra en la parte inferior de la pantalla
      lbDEmpresa.Caption                  := Objeto.ParamCre.EMPRESA.AsString;
      lbDFecha  .Caption                  := Objeto.ParamCre.FECHA  .AsString;
      lbDUsuario.Caption                  := Objeto.ParamCre.USUARIO.AsString;
      lbDPerfil .Caption                  := Objeto.ParamCre.PERFIL .AsString;

      //Oculta el botón Eliminar y recorre los botones Aceptar y Cancelar
      Interforma1.BtnEliminar.Visible     := False;
      InterForma1.BtnCancelar.Top         := InterForma1.BtnAceptar .Top;
      InterForma1.BtnAceptar .Top         := InterForma1.BtnEliminar.Top;

      Estado                              := ecVacio;
end;

procedure TWCrMetVariable.FormDestroy(Sender: TObject);
begin
      Objeto.ID_VARIABLE.Control:=nil;
      Objeto.NOMBRE.Control:=nil;
      Objeto.DESCRIPCION.Control:=nil;
      Objeto.TIPO_DATO.Control:=nil;
      Objeto.LONGITUD.Control:=nil;
      Objeto.PRECISION.Control:=nil;
      Objeto.FORMATO.Control:=nil;
      Objeto.VAL_DEFAULT.Control:=nil;
      Objeto.FUNC_BUSQUEDA.Control:=nil;
      Objeto.LISTA_FIJA_OPC.Control:=nil;
      Objeto.TIPO_CAP_OP_MULTIPLE.Control:=nil;
      Objeto.VAL_RET_OP_MULTIPLE.Control:=nil;
      Objeto.VAL_DEFAULT_COL_INAC.Control:=nil;
      Objeto.FORMA_INGRESO.Control:=nil;
      Objeto.URL.Control:=nil;
      Objeto.SIT_VARIABLE.Control:=nil;
   //Objeto
end;

procedure TWCrMetVariable.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrMetVariable.InterForma1DespuesNuevo(Sender: TObject);
begin
  Estado := ecInsertado;

  //Habilita el campo Nombre Variable
  edNOMBRE.Enabled := True;

  //Habilita los UpDown de los campos Longitud y Precisión
  updLONGITUD .Enabled := True;
  updPRECISION.Enabled := True;

  //Pone la situación como Activa
  rdgSIT_VARIABLE.ItemIndex := 0;

  //Establece el valor "CAPTURA" para el campo Forma Ingreso
  cbFORMA_INGRESO.ItemIndex := 0;

  //Pone como de sólo lectura el campo Nombre FindIt
  edFUNC_BUSQUEDA.ReadOnly := True;

  //Llama al procedimiento que habilita o deshabilita algunos campos dependiendo del valor de otros
  HabilitarCampos;

  //Pone el focus al primer campo a capturar
  edNOMBRE.SetFocus;
end;

procedure TWCrMetVariable.InterForma1DespuesModificar(Sender: TObject);
begin
  Estado := ecEditado;

  //Deshabilita el campo Nombre Variable
  edNOMBRE.Enabled := False;
  edNOMBRE.Color   := clBtnFace;

  //Habilita los UpDown de los campos Longitud y Precisión
  updLONGITUD .Enabled := True;
  updPRECISION.Enabled := True;

  //Pone como de sólo lectura el campo Nombre FindIt
  edFUNC_BUSQUEDA.ReadOnly := True;

  //Llama al procedimiento que habilita o deshabilita diferentes campos dependiendo del valor de otros
  HabilitarCampos;
end;

procedure TWCrMetVariable.edNOMBREExit(Sender: TObject);
begin
 //Valida que el Nombre de la Variable no tenga espacios en blanco
  if Pos (' ', edNOMBRE.Text) > 0 then
    begin
      MessageDlg ('El Nombre de la Variable no debe contener espacios en blanco.', mtInformation, [mbOk], 0);
      edNOMBRE.SetFocus;
    end;
end;

procedure TWCrMetVariable.edLONGITUDExit(Sender: TObject);
var
  e: Integer;
  r, p: Real;
begin
  if edLONGITUD.Text = '' then
  begin
    //Si hay Precisión la Longitud No puede ser Nula
    if (edPRECISION.Text <> '') then
    begin
      MessageDlg ('La Longitud no puede ser Nula.', mtInformation, [mbOk], 0);
      edLONGITUD.SetFocus;
      exit;
    end;
    
    exit;
  end;


  val(edLONGITUD.Text, r, e);

  if e <> 0 then
  begin
    MessageDlg ('El valor capturado no es numérico.', mtInformation, [mbOk], 0);
    edLONGITUD.SetFocus;
    exit;
  end;

  //Valida que la Longitud sea un entero positivo
  if (r < 0) or (Frac (r) <> 0) then
  begin
    MessageDlg ('La Longitud debe ser un entero positivo.', mtInformation, [mbOk], 0);
    edLONGITUD.SetFocus;
    exit;
  end;

  //Valida que la Longitud No sea igual a 0
  if r = 0 then
  begin
    MessageDlg ('La Longitud debe ser mayor a 0.', mtInformation, [mbOk], 0);
    edLONGITUD.SetFocus;
    exit;
  end;

  val(edPRECISION.Text, p, e);

  //Si hay Precisión y Longitud, la Longitud debe ser mayor que la Presición
  if (r <> 0) and (p <> 0) then
    if r <= p then
    begin
      MessageDlg ('La Longitud debe ser mayor a la Precisión.', mtInformation, [mbOk], 0);
      edLONGITUD.SetFocus;
      exit;
    end;
end;

procedure TWCrMetVariable.edPRECISIONExit(Sender: TObject);
var
  e   : Integer;
  p, l: Real;
begin
  if edPRECISION.Text = '' then
    exit;

  val(edPRECISION.Text, p, e);

  if e <> 0 then
  begin
    MessageDlg ('El valor capturado no es numérico.', mtInformation, [mbOk], 0);
    edPRECISION.SetFocus;
    exit;
  end;

  //Valida que la Precision sea un entero positivo
  if (p < 0) or (Frac (p) <> 0) then
  begin
    MessageDlg ('La Precisión debe ser un entero positivo.', mtInformation, [mbOk], 0);
    edPRECISION.SetFocus;
    exit;
  end;

  if p = 0 then
  begin
    MessageDlg ('La Precisión debe ser mayor a 0.', mtInformation, [mbOk], 0);
    edPRECISION.SetFocus;
    exit;
  end;

  //Si hay Precisión la Longitud No puede ser Nula
  if edLONGITUD.Text = '' then
  begin
    MessageDlg ('La Longitud no puede ser Nula.', mtInformation, [mbOk], 0);
    edLONGITUD.SetFocus;
    exit;
  end
  else
  begin
    //Si hay Precisión y Longitud, la Longitud debe ser mayor que la Presición
    val(edLONGITUD.Text, l, e);
    if l <= p then
    begin
      MessageDlg ('La Longitud debe ser mayor a la Precisión.', mtInformation, [mbOk], 0);
      edPRECISION.SetFocus;
      exit;
    end;
  end;
end;

procedure TWCrMetVariable.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
var
  Longitud: Integer;
begin
  //Llama al procedimiento que obtiene el valor para la Lista Fija de Opciones (valor final)
  if Not ObtListaFijaOpc then
  begin
    Realizado := False;
    exit;
  end;

  //En caso de que la variable sea de Opción Múltiple, la Longitud se calcula
  if cbTIPO_CAP_OP_MULTIPLE.Items [cbTIPO_CAP_OP_MULTIPLE.ItemIndex] <> '' then
  begin
    edLONGITUD.ReadOnly := True;
    edLONGITUD.Color    := clBtnFace;
    Longitud            := CalculaLongitud (cbTIPO_CAP_OP_MULTIPLE.Items [cbTIPO_CAP_OP_MULTIPLE.ItemIndex]);

    if Longitud > 0 then
      edLONGITUD.Text := IntToStr (Longitud)
    else
      edLONGITUD.Text := '';
  end
  else
  begin
    edLONGITUD.ReadOnly := False;
    edLONGITUD.Color    := clWindow;
  end;

  if (cbTIPO_DATO.Items [cbTIPO_DATO.ItemIndex] = 'VARCHAR2') and (edLONGITUD.Text = '') then
  begin
    MessageDlg ('Es necesario que proporcione una Longitud.', mtInformation, [mbOk], 0);
    Realizado := False;
    edLONGITUD.SetFocus;
    exit;
  end;

  if (cbTIPO_CAP_OP_MULTIPLE.Items [cbTIPO_CAP_OP_MULTIPLE.ItemIndex] = 'COMBOBOXCHECK') and
     (cbVAL_RET_OP_MULTIPLE.Items [cbVAL_RET_OP_MULTIPLE.ItemIndex]   = '') then
  begin
    MessageDlg ('Es necesario que indique el Valor de Retorno de Opción Múltiple.', mtInformation, [mbOk], 0);
    Realizado := False;
    cbVAL_RET_OP_MULTIPLE.SetFocus;
    exit;
  end;

  //Valida que si la Forma de Ingreso es igual a URL entonces el campo URL es obligatorio
  if (cbFORMA_INGRESO.Items [cbFORMA_INGRESO.ItemIndex] = 'URL') and (edURL.Text = '') then
  begin
    MessageDlg ('Es necesario que proporcione una URL.', mtInformation, [mbOk], 0);
    Realizado := False;
    edURL.SetFocus;
    exit;
  end;

  if Estado = ecInsertado then
  begin
    Objeto.CVE_USU_ALTA.AsString       := Objeto.Apli.Usuario;
    Objeto.FH_ALTA     .AsDateTime     := Now;
  end;

  if Estado = ecEditado then
  begin
    Objeto.CVE_USU_MODIFICA.AsString   := Objeto.Apli.Usuario;
    Objeto.FH_MODIFICA     .AsDateTime := Now;
  end;
end;

procedure TWCrMetVariable.cbTIPO_DATOChange(Sender: TObject);
begin
  if (Estado <> ecInsertado) and (Estado <> ecEditado) then
    exit;

  if (cbTIPO_DATO.Items[cbTIPO_DATO.ItemIndex] = 'DATE') or (cbTIPO_DATO.Items[cbTIPO_DATO.ItemIndex] = 'DATETIME') then
  begin
    //Limpia los campos Longitud y Precisión
    updLONGITUD .Max                 := 0;
    edLONGITUD  .Text                := '';
    edPRECISION .Text                := '';
    //Se deshabilitan los campos de Longitud y Precisión
    edLONGITUD  .ReadOnly            := True;
    updLONGITUD .Enabled             := False;
    edPRECISION .ReadOnly            := True;
    updPRECISION.Enabled             := False;
    //Cambia el color de los campos Longitud y Precisión
    edLONGITUD  .Color               := clBtnFace;
    edPRECISION .Color               := clBtnFace;

    //Limpia los campos de Captura Múltiple
    cbTIPO_CAP_OP_MULTIPLE.ItemIndex := -1;
    cbVAL_RET_OP_MULTIPLE .ItemIndex := -1;
    meVAL_BD              .Clear;
    meELEMENTOS           .Clear;
    edLISTA_FIJA_OPC      .Text      := '';
    //Se deshabilitan los campos de Captura Múltiple
    cbTIPO_CAP_OP_MULTIPLE.Enabled   := False;
    cbVAL_RET_OP_MULTIPLE .Enabled   := False;
    meVAL_BD              .ReadOnly  := True;
    meELEMENTOS           .ReadOnly  := True;
    //Cambia el color de los campos de Captura Múltiple
    cbTIPO_CAP_OP_MULTIPLE.Color     := clBtnFace;
    cbVAL_RET_OP_MULTIPLE .Color     := clBtnFace;
    meVAL_BD              .Color     := clBtnFace;
    meELEMENTOS           .Color     := clBtnFace;

    //Deshabilita el campo Formato
    edFORMATO.ReadOnly               := True;
    edFORMATO.Color                  := clBtnFace;
  end
  else if cbTIPO_DATO.Items[cbTIPO_DATO.ItemIndex] = 'NUMBER' then
  begin
    //Limpia los campos de Captura Múltiple
    cbTIPO_CAP_OP_MULTIPLE.ItemIndex := -1;
    cbVAL_RET_OP_MULTIPLE .ItemIndex := -1;
    meVAL_BD              .Clear;
    meELEMENTOS           .Clear;
    edLISTA_FIJA_OPC      .Text      := '';
    //Se deshabilitan los campos de Captura Múltiple
    cbTIPO_CAP_OP_MULTIPLE.Enabled   := False;
    cbVAL_RET_OP_MULTIPLE .Enabled   := False;
    meVAL_BD              .ReadOnly  := True;
    meELEMENTOS           .ReadOnly  := True;
    //Cambia el color de los campos de Captura Múltiple
    cbTIPO_CAP_OP_MULTIPLE.Color     := clBtnFace;
    cbVAL_RET_OP_MULTIPLE .Color     := clBtnFace;
    meVAL_BD              .Color     := clBtnFace;
    meELEMENTOS           .Color     := clBtnFace;

    //Se habilitan los campos de Longitud y Precisión
    edLONGITUD  .ReadOnly            := False;
    updLONGITUD .Enabled             := True;
    edPRECISION .ReadOnly            := False;
    updPRECISION.Enabled             := True;
    //Establece la longitud máxima para numéricos
    updLONGITUD .Max                 := 14;
    if updLONGITUD.Position > updLONGITUD.Max then
      updLONGITUD.Position := updLONGITUD.Max;

    //Cambia el color de los campos Longitud y Precisión
    edLONGITUD .Color                := clWindow;
    edPRECISION.Color                := clWindow;

    //Habilita el campo Formato
    edFORMATO.ReadOnly               := False;
    edFORMATO.Color                  := clWindow;
  end
  else if cbTIPO_DATO.Items[cbTIPO_DATO.ItemIndex] = 'VARCHAR2' then
  begin
    //Establece la longitud máxima de 4000
    updLONGITUD .Max                 := 4000;
    //Limpia el campo "Precisión"
    edPRECISION .Text                := '';
    //Se habilitan los campos de Longitud y Precisión
    edLONGITUD  .ReadOnly            := False;
    updLONGITUD .Enabled             := True;
    edPRECISION .ReadOnly            := True;
    updPRECISION.Enabled             := False;
    //Cambia el color de los campos Longitud y Precisión
    edLONGITUD .Color                := clWindow;
    edPRECISION.Color                := clBtnFace;

    //Se habilita el campo "Tipo Captura Opción Múltiple" si el campo "Forma Ingreso" es igual a Captura
    if cbFORMA_INGRESO.Items [cbFORMA_INGRESO.ItemIndex] = 'CAPTURA' then
    begin
      cbTIPO_CAP_OP_MULTIPLE.Enabled   := True;
      cbTIPO_CAP_OP_MULTIPLE.Color     := clWindow;
    end
    else
    begin
      cbTIPO_CAP_OP_MULTIPLE.Enabled   := False;
      cbTIPO_CAP_OP_MULTIPLE.Color     := clBtnFace;
    end;

    //Limpia el campo Formato
    edFORMATO.Text                   := '';
    //Deshabilita el campo Formato
    edFORMATO.ReadOnly               := True;
    edFORMATO.Color                  := clBtnFace;
  end;
end;

procedure TWCrMetVariable.bbtnNOMBRE_FINDITClick(Sender: TObject);
var
  T    : TInterFindit;
begin
  T := Objeto.CreaBuscador('ICrClasFindIt.it','S');
  try
    if T.Execute then
    begin
      edFUNC_BUSQUEDA.Text := T.DameCampo(0);
    end;
  finally
    T.Free;
  end;
end;

procedure TWCrMetVariable.cbTIPO_CAP_OP_MULTIPLEChange(Sender: TObject);
var
  n, sumLongitudes, Longitud: Integer;
begin
  if (Estado <> ecInsertado) and (Estado <> ecEditado) then
    exit;

  sumLongitudes := 0;

  //Habilita los campos correspondientes a Opción Múltiple cuando el valor del campo "Tipo Captura Opción Múltiple" sea diferente de Nulo
  if cbTIPO_CAP_OP_MULTIPLE.Items [cbTIPO_CAP_OP_MULTIPLE.ItemIndex] <> '' then
  begin
    //Habilita el campo "Valor Retorno Opción Múltiple" si el valor del campo "Tipo Captura Opción Múltiple" es = a COMBOBOXCHECK
    if cbTIPO_CAP_OP_MULTIPLE.Items [cbTIPO_CAP_OP_MULTIPLE.ItemIndex] = 'COMBOBOXCHECK' then
    begin
      cbVAL_RET_OP_MULTIPLE.Enabled := True;
      cbVAL_RET_OP_MULTIPLE.Color   := clWindow;
    end
    else
    begin
      cbVAL_RET_OP_MULTIPLE.ItemIndex := -1;
      cbVAL_RET_OP_MULTIPLE.Enabled   := False;
      cbVAL_RET_OP_MULTIPLE.Color     := clBtnFace;
    end;

    meVAL_BD             .ReadOnly := False;
    meELEMENTOS          .ReadOnly := False;
    meVAL_BD             .Color    := clWindow;
    meELEMENTOS          .Color    := clWindow;
  end
  else
  begin
    cbVAL_RET_OP_MULTIPLE.ItemIndex := -1;
    meVAL_BD             .Clear;
    meELEMENTOS          .Clear;

    cbVAL_RET_OP_MULTIPLE.Enabled   := False;
    meVAL_BD             .ReadOnly  := True;
    meELEMENTOS          .ReadOnly  := True;

    cbVAL_RET_OP_MULTIPLE.Color     := clBtnFace;
    meVAL_BD             .Color     := clBtnFace;
    meELEMENTOS          .Color     := clBtnFace;
  end;

  //Valida que memos se habilitan dependiendo del valor seleccionado en el campo "Tipo Captura Opción Múltiple"
  if cbTIPO_CAP_OP_MULTIPLE.Items [cbTIPO_CAP_OP_MULTIPLE.ItemIndex] = 'COMBOBOX' then
  begin
    //Deshabilita el Memo "Valor en Base de Datos"
    meVAL_BD.Clear;
    meVAL_BD.ReadOnly := True;
    meVAL_BD.Color    := clBtnFace;
  end
  else if (cbTIPO_CAP_OP_MULTIPLE.Items [cbTIPO_CAP_OP_MULTIPLE.ItemIndex] = 'RADIOBUTTONS') or
          (cbTIPO_CAP_OP_MULTIPLE.Items [cbTIPO_CAP_OP_MULTIPLE.ItemIndex] = 'COMBOBOXCHECK') then
  begin
    meVAL_BD.ReadOnly := False;
    meVAL_BD.Color    := clWindow;
  end;

  //En caso de que la variable sea de Opción Múltiple, la Longitud se calcula
  if cbTIPO_CAP_OP_MULTIPLE.Items [cbTIPO_CAP_OP_MULTIPLE.ItemIndex] <> '' then
  begin
    edLONGITUD.ReadOnly := True;
    edLONGITUD.Color    := clBtnFace;
    Longitud            := CalculaLongitud (cbTIPO_CAP_OP_MULTIPLE.Items [cbTIPO_CAP_OP_MULTIPLE.ItemIndex]);

    if Longitud > 0 then
      edLONGITUD.Text := IntToStr (Longitud)
    else
      edLONGITUD.Text := '';
  end
  else
  begin
    edLONGITUD.ReadOnly := False;
    edLONGITUD.Color    := clWindow;
  end;
end;

procedure TWCrMetVariable.cbFORMA_INGRESOChange(Sender: TObject);
begin
  if (Estado <> ecInsertado) and (Estado <> ecEditado) then
    exit;

  //Habilita el campo "Tipo Captura Opción Múltiple" si la Forma de Ingreso es Captura y el Tipo de Dato es Varchar2
  if (cbFORMA_INGRESO.Items [cbFORMA_INGRESO.ItemIndex] = 'CAPTURA') and
     (cbTIPO_DATO.Items [cbTIPO_DATO.ItemIndex] = 'VARCHAR2') then
  begin
    cbTIPO_CAP_OP_MULTIPLE.Enabled := True;
    cbTIPO_CAP_OP_MULTIPLE.Color   := clWindow;
  end
  else
  begin
    //Limpia los campos de Captura Múltiple
    cbTIPO_CAP_OP_MULTIPLE.ItemIndex := -1;
    cbVAL_RET_OP_MULTIPLE .ItemIndex := -1;
    meVAL_BD              .Clear;
    meELEMENTOS           .Clear;
    edLISTA_FIJA_OPC      .Text      := '';
    //Se deshabilitan los campos de Captura Múltiple
    cbTIPO_CAP_OP_MULTIPLE.Enabled   := False;
    cbVAL_RET_OP_MULTIPLE .Enabled   := False;
    meVAL_BD              .ReadOnly  := True;
    meELEMENTOS           .ReadOnly  := True;
    //Cambia el color de los campos de Captura Múltiple
    cbTIPO_CAP_OP_MULTIPLE.Color     := clBtnFace;
    cbVAL_RET_OP_MULTIPLE .Color     := clBtnFace;
    meVAL_BD              .Color     := clBtnFace;
    meELEMENTOS           .Color     := clBtnFace;
  end;

  //Habilita el campo URL si el valor seleccionado en el campo "Forma Ingreso" es igual a URL
  if cbFORMA_INGRESO.Items [cbFORMA_INGRESO.ItemIndex] = 'URL' then
  begin
    edURL.ReadOnly := False;
    edURL.Color    := clWindow;
  end
  else
  begin
    edURL.Text     := '';
    edURL.ReadOnly := True;
    edURL.Color    := clBtnFace;
  end;
end;

procedure TWCrMetVariable.HabilitarCampos;
begin
  //Si el Estado es ecInsertado = Nuevo entonces se deshabilita el campo "Tipo Captura Opción Múltiple"
  if Estado = ecInsertado then
  begin
    cbTIPO_CAP_OP_MULTIPLE.Enabled := False;
    cbTIPO_CAP_OP_MULTIPLE.Color   := clBtnFace;
  end;


  //Habilita o deshabilita los campos de Opción Múltiple dependiendo del Tipo de Dato de la Variable
  if (cbTIPO_DATO.Items[cbTIPO_DATO.ItemIndex] = 'DATE') or (cbTIPO_DATO.Items[cbTIPO_DATO.ItemIndex] = 'DATETIME') then
  begin
    //Limpia los campos Longitud y Precisión
    edLONGITUD  .Text                := '';
    edPRECISION .Text                := '';
    //Se deshabilitan los campos de Longitud y Precisión
    edLONGITUD  .ReadOnly            := True;
    updLONGITUD .Enabled             := False;
    edPRECISION .ReadOnly            := True;
    updPRECISION.Enabled             := False;
    //Cambia el color de los campos Longitud y Precisión
    edLONGITUD  .Color               := clBtnFace;
    edPRECISION .Color               := clBtnFace;

    //Limpia los campos de Captura Múltiple
    cbTIPO_CAP_OP_MULTIPLE.ItemIndex := -1;
    cbVAL_RET_OP_MULTIPLE .ItemIndex := -1;
    meVAL_BD              .Clear;
    meELEMENTOS           .Clear;
    edLISTA_FIJA_OPC      .Text      := '';
    //Se deshabilitan los campos de Captura Múltiple
    cbTIPO_CAP_OP_MULTIPLE.Enabled   := False;
    cbVAL_RET_OP_MULTIPLE .Enabled   := False;
    meVAL_BD              .ReadOnly  := True;
    meELEMENTOS           .ReadOnly  := True;
    //Cambia el color de los campos de Captura Múltiple
    cbTIPO_CAP_OP_MULTIPLE.Color     := clBtnFace;
    cbVAL_RET_OP_MULTIPLE .Color     := clBtnFace;
    meVAL_BD              .Color     := clBtnFace;
    meELEMENTOS           .Color     := clBtnFace;

    //Deshabilita el campo Formato
    edFORMATO.ReadOnly               := True;
    edFORMATO.Color                  := clBtnFace;
  end
  else if cbTIPO_DATO.Items[cbTIPO_DATO.ItemIndex] = 'NUMBER' then
  begin
    //Limpia los campos de Captura Múltiple
    cbTIPO_CAP_OP_MULTIPLE.ItemIndex := -1;
    cbVAL_RET_OP_MULTIPLE .ItemIndex := -1;
    meVAL_BD              .Clear;
    meELEMENTOS           .Clear;
    edLISTA_FIJA_OPC      .Text      := '';
    //Se deshabilitan los campos de Captura Múltiple
    cbTIPO_CAP_OP_MULTIPLE.Enabled   := False;
    cbVAL_RET_OP_MULTIPLE .Enabled   := False;
    meVAL_BD              .ReadOnly  := True;
    meELEMENTOS           .ReadOnly  := True;
    //Cambia el color de los campos de Captura Múltiple
    cbTIPO_CAP_OP_MULTIPLE.Color     := clBtnFace;
    cbVAL_RET_OP_MULTIPLE .Color     := clBtnFace;
    meVAL_BD              .Color     := clBtnFace;
    meELEMENTOS           .Color     := clBtnFace;

    //Establece la longitud máxima para numéricos
    updLONGITUD .Max                 := 14;
    if updLONGITUD.Position > updLONGITUD.Max then
      updLONGITUD.Position := updLONGITUD.Max;
    //Se habilitan los campos de Longitud y Precisión
    edLONGITUD  .ReadOnly            := False;
    updLONGITUD .Enabled             := True;
    edPRECISION .ReadOnly            := False;
    updPRECISION.Enabled             := True;
    //Cambia el color de los campos Longitud y Precisión
    edLONGITUD  .Color                := clWindow;
    edPRECISION .Color                := clWindow;

    //Habilita el campo Formato
    edFORMATO.ReadOnly               := False;
    edFORMATO.Color                  := clWindow;
  end
  else if cbTIPO_DATO.Items[cbTIPO_DATO.ItemIndex] = 'VARCHAR2' then
  begin
    //Limpia el campo "Precisión"
    edPRECISION .Text                := '';
    //Se habilitan los campos de Longitud y Precisión
    edLONGITUD  .ReadOnly            := False;
    updLONGITUD .Enabled             := True;
    edPRECISION .ReadOnly            := True;
    updPRECISION.Enabled             := False;
    //Cambia el color de los campos Longitud y Precisión
    edLONGITUD .Color                := clWindow;
    edPRECISION.Color                := clBtnFace;

    //Se habilita el campo "Tipo Captura Opción Múltiple" si el campo "Forma Ingreso" es igual a Captura
    if cbFORMA_INGRESO.Items [cbFORMA_INGRESO.ItemIndex] = 'CAPTURA' then
    begin
      cbTIPO_CAP_OP_MULTIPLE.Enabled   := True;
      cbTIPO_CAP_OP_MULTIPLE.Color     := clWindow;
    end
    else
    begin
      cbTIPO_CAP_OP_MULTIPLE.Enabled   := False;
      cbTIPO_CAP_OP_MULTIPLE.Color     := clBtnFace;
    end;

    //Limpia el campo Formato
    edFORMATO.Text                   := '';
    //Deshabilita el campo Formato
    edFORMATO.ReadOnly               := True;
    edFORMATO.Color                  := clBtnFace;
  end;


  //Habilita los campos correspondientes a Opción Múltiple cuando el valor del campo "Tipo Captura Opción Múltiple" sea diferente de Nulo
  if cbTIPO_CAP_OP_MULTIPLE.Items [cbTIPO_CAP_OP_MULTIPLE.ItemIndex] <> '' then
  begin
    //Habilita el campo "Valor Retorno Opción Múltiple" si el valor del campo "Tipo Captura Opción Múltiple" es = a COMBOBOXCHECK
    if cbTIPO_CAP_OP_MULTIPLE.Items [cbTIPO_CAP_OP_MULTIPLE.ItemIndex] = 'COMBOBOXCHECK' then
    begin
      cbVAL_RET_OP_MULTIPLE.Enabled := True;
      cbVAL_RET_OP_MULTIPLE.Color   := clWindow;
    end
    else
    begin
      cbVAL_RET_OP_MULTIPLE.ItemIndex := -1;
      cbVAL_RET_OP_MULTIPLE.Enabled   := False;
      cbVAL_RET_OP_MULTIPLE.Color     := clBtnFace;
    end;

    meVAL_BD             .ReadOnly := False;
    meELEMENTOS          .ReadOnly := False;
    meVAL_BD             .Color    := clWindow;
    meELEMENTOS          .Color    := clWindow;
  end
  else
  begin
    cbVAL_RET_OP_MULTIPLE.ItemIndex := -1;
    meVAL_BD             .Clear;
    meELEMENTOS          .Clear;

    cbVAL_RET_OP_MULTIPLE.Enabled   := False;
    meVAL_BD             .ReadOnly  := True;
    meELEMENTOS          .ReadOnly  := True;

    cbVAL_RET_OP_MULTIPLE.Color     := clBtnFace;
    meVAL_BD             .Color     := clBtnFace;
    meELEMENTOS          .Color     := clBtnFace;
  end;


  //Valida que memos se habilitan dependiendo del valor seleccionado en el campo "Tipo Captura Opción Múltiple"
  if cbTIPO_CAP_OP_MULTIPLE.Items [cbTIPO_CAP_OP_MULTIPLE.ItemIndex] = 'COMBOBOX' then
  begin
    //Deshabilita el Memo "Valor en Base de Datos"
    meVAL_BD.Clear;
    meVAL_BD.ReadOnly := True;
    meVAL_BD.Color    := clBtnFace;
  end
  else if (cbTIPO_CAP_OP_MULTIPLE.Items [cbTIPO_CAP_OP_MULTIPLE.ItemIndex] = 'RADIOBUTTONS') or
          (cbTIPO_CAP_OP_MULTIPLE.Items [cbTIPO_CAP_OP_MULTIPLE.ItemIndex] = 'COMBOBOXCHECK') then
  begin
    //Habilita el Memo "Valor en Base de Datos"
    meVAL_BD.ReadOnly := False;
    meVAL_BD.Color    := clWindow;
  end;


  //Habilita o deshabilita el campo "URL" si el valor del campo Forma Ingreso es igual a URL
  if cbFORMA_INGRESO.Items [cbFORMA_INGRESO.ItemIndex] = 'URL' then
  begin
    edURL.ReadOnly := False;
    edURL.Color    := clWindow;
  end
  else
  begin
    edURL.Text     := '';
    edURL.ReadOnly := True;
    edURL.Color    := clBtnFace;
  end
end;

procedure TWCrMetVariable.InterForma1DespuesAceptar(Sender: TObject);
begin
  Estado := ecConsulta;
end;

procedure TWCrMetVariable.InterForma1DespuesCancelar(Sender: TObject);
begin
  if Estado = ecEditado then
    ObtListasValElem;

  Estado := ecConsulta;
end;

function TWCrMetVariable.ObtListaFijaOpc: Boolean;
var
  n        : Integer;
  resultado: String;
begin
  {Obtiene el valor que se va a almacenar en la Base de Datos para el campo "Lista Fija de Opciones"}

  result := False;

  //Valida los valores de las listas
  if Not ValidacionListas then
    exit;

  //Cuando el valor del campo "Tipo Captura Opción Múltiple" es igual a COMBOBOX se realiza lo siguiente
  if cbTIPO_CAP_OP_MULTIPLE.Items [cbTIPO_CAP_OP_MULTIPLE.ItemIndex] = 'COMBOBOX' then
  begin
    For n := 1 to meELEMENTOS.Lines.Count do
    begin
      if n = 1 then
        resultado := resultado + meELEMENTOS.Lines [n - 1]
      else
        resultado := resultado + '|' + meELEMENTOS.Lines [n - 1];
    end;
  end
  else if (cbTIPO_CAP_OP_MULTIPLE.Items [cbTIPO_CAP_OP_MULTIPLE.ItemIndex] = 'RADIOBUTTONS') or
          (cbTIPO_CAP_OP_MULTIPLE.Items [cbTIPO_CAP_OP_MULTIPLE.ItemIndex] = 'COMBOBOXCHECK') then
  begin
    For n := 1 to meVAL_BD.Lines.Count do
    begin
        if n = 1 then
          resultado := resultado + meVAL_BD.Lines [n - 1] + '|' + meELEMENTOS.Lines [n - 1]
        else
          resultado := resultado + '|' + meVAL_BD.Lines [n - 1] + '|' + meELEMENTOS.Lines [n - 1];
    end;
  end;

  edLISTA_FIJA_OPC.Text := resultado;
  result := True;
end;

function TWCrMetVariable.ValidacionListas: Boolean;
var
  n: Integer;
begin
  result := False;

  if cbTIPO_CAP_OP_MULTIPLE.Items [cbTIPO_CAP_OP_MULTIPLE.ItemIndex] = 'COMBOBOX' then
  begin
    if meELEMENTOS.Lines.Count <= 0 then
    begin
      MessageDlg ('Es necesario que proporcione los Elementos correspondientes a la Lista Fija de Opciones.', mtInformation, [mbOk], 0);
      result := False;
      exit;
    end;

    For n := 1 to meELEMENTOS.Lines.Count do
    begin
      //Valida que no haya lineas vacias
      if meELEMENTOS.Lines [n - 1] = '' then
      begin
        MessageDlg ('La lista de Elementos correspondiente a la Lista Fija de Opciones, no debe tener líneas vacias. Favor de revisarla.', mtInformation, [mbOk], 0);
        result := False;
        exit;
      end;

      //Valida que la linea no tenga |
      if Pos ('|', meELEMENTOS.Lines [n - 1]) <> 0 then
      begin
        MessageDlg ('Los Elementos registrados en la Lista Fija de Opciones, no deben tener |. Favor de revisarlos.', mtInformation, [mbOk], 0);
        result := False;
        exit;
      end;
    end;
  end
  else if (cbTIPO_CAP_OP_MULTIPLE.Items [cbTIPO_CAP_OP_MULTIPLE.ItemIndex] = 'RADIOBUTTONS') or
          (cbTIPO_CAP_OP_MULTIPLE.Items [cbTIPO_CAP_OP_MULTIPLE.ItemIndex] = 'COMBOBOXCHECK') then
  begin
    if (meVAL_BD.Lines.Count <= 0) or (meELEMENTOS.Lines.Count <= 0) then
    begin
      MessageDlg ('Es necesario que proporcione los Valores en BD y los Elementos, correspondientes a la Lista Fija de Opciones.', mtInformation, [mbOk], 0);
      result := False;
      exit;
    end;

    //Valida que la lista de Valores en BD y la lista de Elementos tengan el mismo número de lineas
    if meVAL_BD.Lines.Count <> meELEMENTOS.Lines.Count then
    begin
      MessageDlg ('La lista de Valores en BD y la lista de Elementos correspondientes a la Lista Fija de Opciones, no tienen el mismo número de lineas. Favor de revisarlas.', mtInformation, [mbOk], 0);
      meVAL_BD.SetFocus;
      result := False;
      exit;
    end;

    For n := 1 to meVAL_BD.Lines.Count do
    begin
      //Valida que no haya lineas vacias en la lista de Valores en BD
      if meVAL_BD.Lines [n - 1] = '' then
      begin
        MessageDlg ('La lista de Valores en BD correspondiente a la Lista Fija de Opciones, no debe tener líneas vacias. Favor de revisarla.', mtInformation, [mbOk], 0);
        meVAL_BD.SetFocus;
        result := False;
        exit;
      end;

      //Valida que no haya lineas vacias en la lista de Elementos
      if meELEMENTOS.Lines [n - 1] = '' then
      begin
        MessageDlg ('La lista de Elementos correspondiente a la Lista Fija de Opciones, no debe tener líneas vacias. Favor de revisarla.', mtInformation, [mbOk], 0);
        meELEMENTOS.SetFocus;
        result := False;
        exit;
      end;

      //Valida que la linea no tenga |
      if Pos ('|', meVAL_BD.Lines [n - 1]) <> 0 then
      begin
        MessageDlg ('Los Valores en BD correspondientes a la Lista Fija de Opciones, no deben tener |. Favor de revisarlos.', mtInformation, [mbOk], 0);
        meVAL_BD.SetFocus;
        result := False;
        exit;
      end;

      //Valida que la linea no tenga |
      if Pos ('|', meELEMENTOS.Lines [n - 1]) <> 0 then
      begin
        MessageDlg ('Los Elementos correspondientes a la Lista Fija de Opciones, no deben tener |. Favor de revisarlos.', mtInformation, [mbOk], 0);
        meELEMENTOS.SetFocus;
        result := False;
        exit;
      end;

    end;
  end;

  result := True;
end;

procedure TWCrMetVariable.ObtListasValElem;
var
  A: TArrayString;
  i: integer;
  val:string;
begin
  if cbTIPO_CAP_OP_MULTIPLE.Items [cbTIPO_CAP_OP_MULTIPLE.ItemIndex] = 'COMBOBOX' then
  begin
    A := Split (edLISTA_FIJA_OPC.Text, '|');
    meELEMENTOS.Clear;

    for i := 0 to Length (A) - 1 do
    meELEMENTOS.Lines.Add (A [i]);
  end
  else if (cbTIPO_CAP_OP_MULTIPLE.Items [cbTIPO_CAP_OP_MULTIPLE.ItemIndex] = 'RADIOBUTTONS') or
          (cbTIPO_CAP_OP_MULTIPLE.Items [cbTIPO_CAP_OP_MULTIPLE.ItemIndex] = 'COMBOBOXCHECK') then
  begin
    meVAL_BD   .Clear;
    meELEMENTOS.Clear;

    A := Split (edLISTA_FIJA_OPC.Text, '|');

    for i := 0 to Length (A) - 1 do
    if Odd (i) then
      meELEMENTOS.Lines.Add (A [i])
    else
      meVAL_BD.Lines.Add (A [i]);

  end
  else
  begin
    meVAL_BD   .Clear;
    meELEMENTOS.Clear;
  end;
end;

function TWCrMetVariable.Split (S: string; Separator: char): TArrayString;
var
  Len, p: integer;
begin
  Len := 0;
  SetLength (result, Len);

  repeat
    p := Pos (Separator, S);

    if p > 0 then
    begin
      Inc (Len);
      SetLength (result, Len);

      result [Len - 1] := Copy (S, 1, p - 1);
      Delete (S, 1, p);
    end;
  until p = 0;

  if (S <> '') or (Len > 0) then
  begin
    Inc (Len);
    SetLength (result, Len);

    result [Len - 1] := S;
  end;
end;

procedure TWCrMetVariable.edLISTA_FIJA_OPCChange(Sender: TObject);
begin
  //ObtListasValElem;
end;

procedure TWCrMetVariable.edFUNC_BUSQUEDAChange(Sender: TObject);
var
  vlQry: TQuery;
begin
  vlQry              := TQuery.Create (Self);
  vlQry.DatabaseName := Objeto.Apli.DataBaseName;
  vlQry.SessionName  := Objeto.Apli.SessionName;
  vlQry.SQL.Clear;
  vlQry.SQL.Add ('Select Cve_FindIt,');
  vlQry.SQL.Add ('       Substr (TX_FINDIT, InStr (Upper (TX_FINDIT), ''V_TITULO='') + Length (''V_TITULO='')) Titulo');
  vlQry.SQL.Add ('  From Clas_FindIt');
  vlQry.SQL.Add (' Where Cve_FindIt = :Cve_FindIt');
  vlQry.Params.Clear;
  vlQry.Params.CreateParam (ftInteger, 'Cve_FindIt', ptInput);
  vlQry.ParamByName ('Cve_FindIt').AsString := edFUNC_BUSQUEDA.Text;
  vlQry.Open;

  edDESC_FINDIT.Text := vlQry.FieldByName ('Titulo').AsString;

  vlQry.Free;
end;

function TWCrMetVariable.CalculaLongitud (TipoCapOpMul: String): Integer;
var
  n, LongitudMax, LongitudActual, sumLongitudes: Integer;
begin
  result         := 0;
  sumLongitudes  := 0;
  LongitudMax    := 0;
  LongitudActual := 0;

  //Cuando el Tipo Captura Opción Múltiple sea COMBOBOXCHECK, la Longitud de la variable va a ser calculada de la sig. forma:
  //Sumatoria de todas las Longitudes de Valores en BD + (Numero de Valores en BD - 1)
  if TipoCapOpMul = 'COMBOBOXCHECK' then
  begin
    for n := 0 to meVAL_BD.Lines.Count - 1 do
      sumLongitudes := sumLongitudes + Length (meVAL_BD.Lines[n]);

    result := sumLongitudes + (meVAL_BD.Lines.Count - 1);
  end
  //Cuando el Tipo Captura Opción Múltiple sea RADIOBUTTONS, la Longitud de la variable va a ser calculada de la sig. forma:
  //Debe ser igual a la máxima Longitud de los Valores en BD
  else if TipoCapOpMul = 'RADIOBUTTONS' then
  begin
    for n := 0 to meVAL_BD.Lines.Count - 1 do
    begin
      if n = 0 then
        LongitudMax    := Length (meVAL_BD.Lines[n])
      else
        LongitudActual := Length (meVAL_BD.Lines[n]);

      if LongitudActual > LongitudMax then
        LongitudMax := LongitudActual;
    end;

    result := LongitudMax;
  end
  //Cuando el Tipo Captura Opción Múltiple sea RADIOBUTTONS, la Longitud de la variable va a ser calculada de la sig. forma:
  //Debe ser igual a la máxima Longitud de los Elementos
  else if TipoCapOpMul = 'COMBOBOX' then
  begin
    for n := 0 to meELEMENTOS.Lines.Count - 1 do
    begin
      if n = 0 then
        LongitudMax    := Length (meELEMENTOS.Lines[n])
      else
        LongitudActual := Length (meELEMENTOS.Lines[n]);

      if LongitudActual > LongitudMax then
        LongitudMax := LongitudActual;
    end;

    result := LongitudMax;
  end
end;

end.
