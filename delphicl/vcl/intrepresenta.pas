// Sistema         : Clase de REPRESENTANTE
// Fecha de Inicio : 16/06/2006
// Función forma   : Clase de REPRESENTANTE
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Jose Alberto Ramirez Pacheco
// Comentarios     :
Unit IntRepresenta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, ComCtrls, IntDtPk,
  InterFor, IntFrm, IntFind, UnSQL2, InterFun, UnGene,
    IntEmple,      { Catálogo de Empleados }
    IntUnNeg, IntLinkit;      { Catálogo de Unidades de Negocio }

Type
  TRepresent= class;

  TWRepresentante=Class(TForm)
    InterForma1: TInterForma;
    lbTIPO_PROEMIO : TLabel;
    cbTipoProemio: TComboBox;
    lbID_PERSONA : TLabel;
    edIdPersona: TEdit;
    lbTX_NOTA : TLabel;
    rgSitRepresentante: TRadioGroup;
    sbRepresentante: TSpeedButton;
    edNombre: TEdit;
    GroupBox1: TGroupBox;
    lbCVE_USR_ALTA: TLabel;
    lbFH_ALTA: TLabel;
    edCveUsrAlta: TEdit;
    edFHAlta: TEdit;
    GroupBox2: TGroupBox;
    lbCVE_USR_MODIFICA: TLabel;
    lbFH_MODIFICA: TLabel;
    edCveUsrModifica: TEdit;
    edFHModifica: TEdit;
    edTxNota: TMemo;
    GroupBox3: TGroupBox;
    sbEntidad: TSpeedButton;
    edIdEntidad: TEdit;
    edEntidad: TEdit;
    linkEmpleado: TInterLinkit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure sbRepresentanteClick(Sender: TObject);
    procedure sbEntidadClick(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure linkEmpleadoCapture(Sender: TObject; var Show: Boolean);
    procedure linkEmpleadoEjecuta(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Objeto : TRepresent;
  end;


  TRepresent= class(TInterFrame)
  private
    FListRepresenta: TListView;
  public
    { Public declarations }
    Tipo_Proemio: TInterCampo;
    Id_Persona: TInterCampo;
    Id_Entidad: TInterCampo;
    Cve_Usr_Alta: TInterCampo;
    FH_Alta: TInterCampo;
    Cve_Usr_Modifica: TInterCampo;
    FH_Modifica: TInterCampo;
    Tx_Nota: TInterCampo;
    Sit_Representa: TInterCampo;

    Empleado: TEmpleado;
    Entidad:  TUnNegocio;

    Property ListRepresenta: TListView Read FListRepresenta Write FListRepresenta;

    Constructor Create( AOwner : TComponent ); override;
    Destructor  Destroy; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    Function    InternalBusca : Boolean; override;
    Function    InicializaRepresentantes(pTipoProemio: String; pEntidad: Integer = 0): TQuery;
    Function    GetRepresentantes(pPrefijo: String = ''; pSeparador: String = ', '): String;
  end;


implementation

{$R *.DFM}

Constructor TRepresent.Create( AOwner : TComponent );
begin
  Inherited;
  Tipo_Proemio:= CreaCampo('TIPO_PROEMIO',ftString,tsNinguno,tsNinguno,True);
  With Tipo_Proemio do
  Begin
    UseCombo:= True;
    ComboDatos.Add('ICB');    ComboLista.Add('Casa de Bolsa');
    ComboDatos.Add('BCO');    ComboLista.Add('Banco');
    ComboDatos.Add('DIN');    ComboLista.Add('Mercado de Dinero');
    ComboDatos.Add('DINICB'); ComboLista.Add('Mercado de Dinero ICB'); // CZR 17-Dic-2010
    ComboDatos.Add('IFS');    ComboLista.Add('InterFinancial');
    ComboDatos.Add('NET');    ComboLista.Add('Internet');
    // CZR 09-Nov-2010
    ComboDatos.Add('CHE');    ComboLista.Add('Chequeras');
    ComboDatos.Add('INV');    ComboLista.Add('Inversiones');
    // CZR 09-Dic-2010
    ComboDatos.Add('CEO');    ComboLista.Add('MD Celebra Operaciones');
    ComboDatos.Add('COO');    ComboLista.Add('MD Confirma Operaciones');
  end;

  Id_Persona:= CreaCampo('ID_PERSONA', ftFloat, tsNinguno, tsNinguno, True);
  Id_Entidad:= CreaCampo('ID_ENTIDAD', ftFloat, tsNinguno, tsNinguno, True);
  Cve_Usr_Alta:= CreaCampo('CVE_USR_ALTA', ftString, tsNinguno, tsNinguno, True);
  FH_Alta:= CreaCampo('FH_ALTA', ftDateTime, tsNinguno, tsNinguno, True);
  Cve_Usr_Modifica:= CreaCampo('CVE_USR_MODIFICA', ftString, tsNinguno, tsNinguno, True);
  FH_Modifica:= CreaCampo('FH_MODIFICA', ftDateTime, tsNinguno, tsNinguno, True);
  Tx_Nota:= CreaCampo('TX_NOTA', ftString, tsNinguno, tsNinguno, True);
  Sit_Representa:= CreaCampo('SIT_REPRESENTA', ftString, tsNinguno, tsNinguno, True);
  With Sit_Representa do
  Begin
    UseCombo:= True;
    ComboDatos.Add('AC');   ComboLista.Add('0');
    ComboDatos.Add('IN');   ComboLista.Add('1');
  end;

  TableName := 'REPRESENTANTE';
  FKeyFields.Add('TIPO_PROEMIO');
  FKeyFields.Add('ID_PERSONA');

  Empleado:= TEmpleado.Create(self);
  Empleado.BuscaWhereString:= ' Sit_Empleado = ''AC'' ';
  Empleado.MasterSource:= Self;
  Empleado.Id_Persona.MasterField:= 'ID_PERSONA';

  Entidad:= TUnNegocio.Create(Self);
  Entidad.MasterSource:= Self;
  Entidad.Id_Entidad.MasterField:= 'ID_ENTIDAD';

  UseQuery := True;
  UseLink:= True;
  ShowMenuReporte:= False;
end;


Destructor TRepresent.Destroy;
begin
  FListRepresenta:= nil;
  inherited;
end;


Function TRepresent.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWRepresentante;
begin
  W:= TWRepresentante.Create(Self);
  Try
    W.Objeto:= Self;
    W.InterForma1.InterFrame:= Self;
    W.InterForma1.FormaTipo := FormaTipo;
    W.InterForma1.ShowGrid := False;
    W.InterForma1.ShowNavigator := False;
    W.InterForma1.Funcion := FInterFun;
    W.InterForma1.ShowBtnEliminar:= False;
    W.InterForma1.ShowBtnAyuda:= False;
    W.InterForma1.ShowModal;
    ShowWindow:= W.InterForma1.ModalResult;
  Finally
    W.Free;
  end;
end;


Function TRepresent.InternalBusca:Boolean;
Var T:TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('IReprese.it','S,F');
  Try
    if Active then
    begin
      T.Param(0,TIPO_PROEMIO.AsString);
      T.Param(1,ID_PERSONA.AsString);
    end;

    if T.Execute then InternalBusca:= FindKey([T.DameCampo(0),T.DameCampo(1)]);
  finally
    T.Free;
  end;
end;



Function TRepresent.InicializaRepresentantes(pTipoProemio: String; pEntidad: Integer): TQuery;
Var qRepresentantes: TQuery;
    intIndex: Integer;
Begin
  Try
    qRepresentantes:= GetSQLQuery(
        ' SELECT Representante.*, Persona.Nombre ' +
        ' FROM Representante, Persona, Empleado ' +
        ' WHERE Tipo_Proemio = ''' + pTipoProemio + ''' ' +
        '   AND Sit_Representa = ''AC''' +
        '   AND Representante.Id_Persona = Persona.Id_Persona ' +
        '   AND Representante.Id_Persona = Empleado.Id_Persona ' +
        '   AND Empleado.Sit_Empleado = ''AC'' ',
        DataBaseName, SessionName, True);

    If (qRepresentantes <> nil) and (Not qRepresentantes.IsEmpty) and (FListRepresenta <> nil) Then
    Begin
      While Not qRepresentantes.Eof do
        With FListRepresenta.Items.Add do
        Begin
          Caption:= BonitoStr(qRepresentantes.FieldByName('Nombre').AsString);
          Checked:= (pEntidad > 0) and (pEntidad = qRepresentantes.FieldByName('Id_Entidad').AsInteger);
          //SubItems.Add(qRepresentantes.FieldByName('CVE_MOTIVO').AsString);
          qRepresentantes.Next;
        end;
    end
    else MessageDlg('No existen Representantes del Grupo Financiero configurados para el proemio [' + pTipoProemio + ']', mtInformation, [mbOK], 0);
(*
    FRepresentantes:= nil;
    If qRepresentantes <> nil Then
    Begin
      SetLength(FRepresentantes, qRepresentantes.RecordCount);
      For intIndex:= 0 To qRepresentantes.RecordCount - 1 do
      Begin
        FRepresentantes[intIndex]:= qRepresentantes.FieldByName('Nombre').AsString;
        {
        FRepresentantes[intIndex].ImpComision:= qRepresentantes.FieldByName('Imp_Comision').AsFloat;
        FRepresentantes[intIndex].ImpTicket:= qRepresentantes.FieldByName('Imp_Ticket').AsFloat;
        }
        qRepresentantes.Next;
      end;
*)
  Finally
    Result:= qRepresentantes;
    if qRepresentantes <> nil Then qRepresentantes.Free; qRepresentantes:= nil;
  end;
end;


Function TRepresent.GetRepresentantes(pPrefijo: String = ''; pSeparador: String = ', '): String;
Var index:Integer;
    strLista: String;
Begin
  Try
    If (FListRepresenta <> nil) Then
    Begin
      for index:= 0 to FListRepresenta.Items.Count - 1 do
        If FListRepresenta.Items[index].Checked then
        Begin
          If strLista = '' then
            strLista:= pPrefijo + FListRepresenta.Items[index].Caption
          else strLista:= strLista + pSeparador + pPrefijo + FListRepresenta.Items[index].Caption;
        end;
    end;
  Finally
    Result:= strLista;
  end;
end;

(***********************************************FORMA REPRESENTANTE************)
(*                                                                            *)
(*  FORMA DE REPRESENTANTE                                                    *)
(*                                                                            *)
(***********************************************FORMA REPRESENTANTE************)
Procedure TWRepresentante.FormShow(Sender: TObject);
begin
  With Objeto do
  Begin
    useLink:= False;  //Se desactiva para que el empleado no tome la liga automática
    Id_Persona.Control:= edIdPersona;
    useLink:= True;
    Tipo_Proemio.Control:= cbTipoProemio;
    Id_Entidad.Control:= edIdEntidad;
    Cve_Usr_Alta.Control:= edCveUsrAlta;
    FH_Alta.Control:= edFHAlta;
    Cve_Usr_Modifica.Control:= edCveUsrModifica;
    FH_Modifica.Control:= edFHModifica;
    Tx_Nota.Control:= edTxNota;
    Sit_Representa.Control:= rgSitRepresentante;

    Empleado.Persona.Nombre.Control:= edNombre;
    Empleado.MasterSourceEditControl:= sbRepresentante;

    Entidad.Desc_Entidad.Control:= edEntidad;
    Entidad.MasterSourceEditControl:= sbEntidad;
  end;
end;


procedure TWRepresentante.FormDestroy(Sender: TObject);
begin
  With Objeto do
  Begin
    Tipo_Proemio.Control:= nil;
    Id_Persona.Control:= nil;
    Id_Entidad.Control:= nil;
    Cve_Usr_Alta.Control:= nil;
    FH_Alta.Control:= nil;
    Cve_Usr_Modifica.Control:= nil;
    FH_Modifica.Control:= nil;
    Tx_Nota.Control:= nil;
    Sit_Representa.Control:= nil;

    Empleado.Persona.Nombre.Control:= nil;
    Empleado.MasterSourceEditControl:= nil;

    Entidad.Desc_Entidad.Control:= nil;
    Entidad.MasterSourceEditControl:= nil;
  end;
end;


procedure TWRepresentante.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;


procedure TWRepresentante.InterForma1DespuesNuevo(Sender: TObject);
begin
  { Inicialización de Valores Default }
  With objeto do
  Begin
    Tipo_Proemio.AsString:= 'ICB';
    Sit_Representa.AsString:= 'AC';
    Cve_Usr_Alta.AsString:= DameUsuario;
    FH_Alta.AsDateTime:= Apli.SysDateTime;
  end;

  cbTipoProemio.SetFocus;
end;


procedure TWRepresentante.InterForma1DespuesModificar(Sender: TObject);
begin
  { Inicialización de Valores Default }
  With objeto do
  Begin
    Cve_Usr_Modifica.AsString:= DameUsuario;
    FH_Modifica.AsDateTime:= Apli.SysDateTime;
  end;

  edTxNota.SetFocus;
end;


procedure TWRepresentante.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
  Realizado:= False;
  Try
    If (Objeto.Empleado.Active) Then
    begin
      If (Objeto.Modo = moAppend) and
         (Objeto.Empleado.Sit_empleado.asString <> 'AC') Then
        Raise EInterFrame.Create('Seleccione un empleado activo.');
    end
    else Raise EInterFrame.Create('Revise que el empleado haya sido seleccionado');

    Realizado:= True;
  Except
    On e: Exception do
      MessageDlg('Error de captura de Información. ' + chr(VK_RETURN) + e.message,
          mtWarning, [mbOK], 0);
  end;
end;



procedure TWRepresentante.sbRepresentanteClick(Sender: TObject);
begin Objeto.Empleado.Busca;
end;

procedure TWRepresentante.sbEntidadClick(Sender: TObject);
begin Objeto.Entidad.Busca;
end;


procedure TWRepresentante.linkEmpleadoCapture(Sender: TObject;
  var Show: Boolean);
begin Show:= (Objeto.Modo = moAppend);
end;

procedure TWRepresentante.linkEmpleadoEjecuta(Sender: TObject);
Var filtroTmp: String;
    filtroOriginal: String;
begin
  filtroOriginal:= objeto.Empleado.FilterString;
  Try
    { Nuevo filtro de Empleados }
    filtroTmp:= filtroOriginal;
    addSql(filtroTmp, 'Sit_Empleado = ''AC''');
    objeto.Empleado.FilterString:= filtroTmp;

    Objeto.Empleado.FindKey([linkEmpleado.Buffer]);
  finally objeto.Empleado.FilterString:= filtroOriginal;
  end;
end;

end.
