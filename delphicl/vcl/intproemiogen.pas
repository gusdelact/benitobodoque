//------------------------------------------------------------------------------
// Función    : Proemio General
// Desarrollo : Cesar Zamora Ramirez
// Fecha      : 09 de Noviembre del 2010
//------------------------------------------------------------------------------

unit IntProemioGen;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  Buttons, ExtCtrls, ComCtrls, DB, DbTables, DBCtrls, IntFrm, InterFor, IntFind,
  InterFun, IntCtto, IntCtoConPro, IntRepresenta, IntDtPk; 
    
var
   ImprimirDocto: Boolean;
const
   cCtteRepLegal: String = 'C004';

Type
  TProemioGen  = Class;

  TWProemioGen = Class(TForm)
    InterForma1             : TInterForma;
    Bevel1: TBevel;
    Label1: TLabel;
    Bevel2: TBevel;
    Label2: TLabel;
    Bevel3: TBevel;
    Label5: TLabel;
    cbCliente: TComboBox;
    Label6: TLabel;
    lvRepresentantes: TListView;
    lblContrato: TLabel;
    Label7: TLabel;
    ckConvenio: TCheckBox;
    lFecFirma: TLabel;
    eFecFirma: TEdit;
    dtpFecFirma: TInterDateTimePicker;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1Preview(Sender: TObject);
    procedure InterForma1Imprimir(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
  public
    { Public declarations }
    Objeto : TProemioGen;
  end;


  TProemioGen = class(TInterFrame)
  private
    FContrato     : TContrato;
    FConfigCaptura: TCtoConPro;

    Procedure ImprimeConvenioModif(pPreview: Boolean);

  Protected
    Procedure SetContrato(pContrato: TContrato);
    Procedure SetConfigCaptura(pConfigCaptura: TCtoConPro);
    Procedure IniciaRepresentantesCliente(pCombo: TComboBox);
    Procedure IniciaContratosILine(pLista: TListView);
  public
    { Public declarations }
    B_ConvModif : TInterCampo;
    F_Firma     : TInterCampo;

    Cliente: TInterCampo;
    Tiene_ILine: TInterCampo;

    Representantes: TRepresent;

    Property Contrato     : TContrato  Read FContrato      Write SetContrato;
    Property ConfigCaptura: TCtoConPro Read FConfigCaptura Write SetConfigCaptura;

    Constructor Create(AOwner: TComponent); override;
    Destructor  Destroy; override;
    Procedure   DataBaseChange; override;
    function    ShowWindow(FormaTipo: TFormaTipo): Integer; override;
    function    Reporte:Boolean; override;
    Procedure   Impresion(pPreview: Boolean = True);
  published
  end;

  procedure ImpresionProemioGen(pContrato: TContrato);

implementation
uses
  UnSQL2,        { Unidad general para consultas a Base de Datos }
  UnGene,        { Funciones Generales - Interacciones }
  UnRpConvBco;   { Proemio de Convenio para Envío de Estados de Cuenta por Medios Electrónicos (BCO) }
{$R *.DFM}

procedure ImpresionProemioGen(pContrato: tContrato);
var
   Proemio : TProemioGen;
Begin
   Proemio:= TProemioGen.Create(nil);
   try
      Proemio.Apli          := pContrato.Apli;
      Proemio.Contrato      := pContrato;
      Proemio.ConfigCaptura := pContrato.ConfigCaptura;
      Proemio.ShowWindow(ftImprimir);
   finally
      Proemio.Free;
      Proemio := nil;
   end;
end;

Constructor TProemioGen.Create( AOwner : TComponent );
begin
  inherited;

  B_ConvModif     := CreaCampo('B_CONVMODIF', ftString, tsNinguno, tsNinguno, False);
  F_Firma         := CreaCampo('F_FIRMA', ftDate,   tsNinguno, tsNinguno, False);
  Cliente         := CreaCampo('CLIENTE', ftString, tsNinguno, tsNinguno, False);
  Tiene_ILine     := CreaCampo('TIENE_ILINE', ftString, tsNinguno, tsNinguno, False);

  Representantes  := TRepresent.Create(Self);

  UseQuery        := False;
  ShowMenuReporte := True;
end;

Destructor TProemioGen.Destroy;
begin
  If Representantes <> nil Then Representantes.Free; Representantes:= nil;
  inherited;
end;

Procedure TProemioGen.DataBaseChange;
Begin
  inherited;
  Representantes.GetParams(Self);
end;

function TProemioGen.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWProemioGen;
begin
  W:=TWProemioGen.Create(Self);
  Try
    W.Objeto:= Self;
    W.InterForma1.InterFrame:= Self;
    W.InterForma1.FormaTipo:= ftImprimir;
    W.InterForma1.ShowGrid:= False;
    W.InterForma1.ShowNavigator:= False;
    W.InterForma1.ShowBtnAyuda:= False;
    W.InterForma1.Funcion:= FInterFun;
    W.InterForma1.ShowModal;
    ShowWindow:= W.InterForma1.ModalResult;
  Finally
    W.Free;
  end;
end;

function TProemioGen.Reporte:Boolean;
begin
   Impresion;
end;

Procedure TProemioGen.Impresion(pPreview: Boolean = True);
Var index: Integer;
    strLista: String;
    imprime:boolean;
Begin
  GetFromControl;

  Try
    { Validaciones }
    If Cliente.AsString = '' then
      Raise EInterFrame.Create('Revise que se hayan seleccionado/Capturado un representante para el Cliente.');

    If Representantes.GetRepresentantes('', '') = '' Then
      Raise EInterFrame.Create('Revise que se hayan seleccionado representantes para el Grupo Financiero.');

    if (Contrato.B_Sol_ILine.AsString = 'V') and
       (Tiene_ILine.asString = 'F') Then
      Raise EInterFrame.Create('El contrato ' + Contrato.Id_Contrato.AsString + ' requiere acceso a Internet y aún no ha sido asociado.');

    { Impresión }
    If B_ConvModif.AsString = 'V' then ImprimeConvenioModif(pPreview);
  Except
    On e: Exception do
    Begin
      messagedlg('Error en la impresión del Proemio para Contratos de Intermediación. ' + chr(13) + //chr(VK_RETURN) +
                 e.Message, mtError, [mbOK], 0);
    end; 
  end;
end;

procedure TProemioGen.SetContrato(pContrato: TContrato);
begin
   FContrato := pContrato;
   if (pContrato <> nil) and (pContrato.Active) then
   begin
      B_ConvModif.AsString := 'V';
   end;
end;

procedure TProemioGen.SetConfigCaptura(pConfigCaptura: TCtoConPro);
begin
   FConfigCaptura := pConfigCaptura;
end;

Procedure TProemioGen.IniciaRepresentantesCliente(pCombo: TComboBox);
Var qCliente: TQuery;
Begin
  Try
    qCliente:= GetSqlQuery(
        'Select Nombre ' +
        'From ' +
        '( ' +
        '   Select Persona.Nombre, Num_Cotitular ' +
        '   From Contratante, Persona ' +
        '   Where Id_Contrato = ' + Contrato.Id_Contrato.asSql +
        '     and Cve_Contratante = ''' + cCtteRepLegal  + '''' +
        '     and Contratante.Id_Persona = Persona.Id_Persona ' +
        '   Union ' +
        '   Select PkgFunProcCorp.ClientePromotor(Id_Contrato, ''NOMBRE_CLIENTE''), 0 ' +
        '   From Contrato, Producto ' +
        '   Where Id_Contrato = ' + Contrato.Id_Contrato.asSql +
        '     and Cve_Per_Jur_Prod = ''PF'' ' +
        '     and Contrato.Cve_Producto = Producto.Cve_Producto ' +
        ') ' +
        'Order by Num_Cotitular ',
        DataBaseName, SessionName, True);

    If (qCliente <> nil) and (Not qCliente.IsEmpty) Then
      If (pCombo <> nil) Then
      Begin
        While not qCliente.EOF do
        begin
          pCombo.Items.Add(qCliente.FieldByName('Nombre').AsString);
          qCliente.Next;
        end;
        pCombo.ItemIndex:= 0;
      end
    Else Raise EInterFrame.Create('Error al inicilaizar los Representantes del Cliente.');
  Except
    Raise;
  end;
end;

Procedure TProemioGen.IniciaContratosILine(pLista: TListView);
Var qILine: TQuery;
Begin
  Try
    Tiene_ILine.asString:= 'F';
    qILine:= GetSqlQuery(
        ' Select ' +
        '   Net_Cto_Asoc.Id_Contrato, ' +
        '   Contrato.Sit_Contrato, ' +
        '   PkgFunProcCorp.ClientePromotor(Net_Cto_Asoc.Id_Contrato, ''NOMBRE_CLIENTE'') as Titular ' +
        ' From Net_Cto_Asoc, Contrato ' +
        ' Where Net_Cto_Asoc.Id_Cto_Asoc = ' + Contrato.Id_Contrato.asSql +
        '   and Net_Cto_Asoc.Id_Contrato = Contrato.Id_Contrato ' +
        '   and Contrato.Sit_Contrato = ''AC'' ' +
        ' Order by Net_Cto_Asoc.Id_Contrato ',
        DataBaseName, SessionName, True);

    If (qILine <> nil) and (Not qILine.IsEmpty) Then
    Begin
      { Inicializa el número de contratos I-Line a los que esta asociado }
      Tiene_ILine.asString:= 'V';
      { Carga la lista de Contratos }
      If (pLista <> nil) Then
      Begin
        While not qILine.EOF do
        begin
          With pLista.Items.Add do
          Begin
            Caption:= qILine.FieldByName('Id_Contrato').AsString;
            SubItems.Add(BonitoStr(qILine.FieldByName('Titular').AsString));
          end;
          qILine.Next;
        end;
      end;
    end;
  Except
    Raise;
  end;
end;

procedure TProemioGen.ImprimeConvenioModif(pPreview: Boolean);
var
   Rp : TrpConvBco;
begin
   try
      Rp                      := TrpConvBco.Create(Self);
      Rp.QryCtto.Active       := False;
      Rp.QryCtto.DatabaseName := DataBaseName;
      Rp.QryCtto.SessionName  := SessionName;
      Rp.QryCtto.ParamByName('ID_CONTRATO').AsInteger := StrToInt(Contrato.Id_Contrato.asString);
      Rp.QryCtto.Active       := True;

      Rp.QRLabel41.Caption := UpperCase(Representantes.GetRepresentantes(' ', ' y/o' + chr(VK_RETURN)));

      Cliente.GetFromControl;
      Rp.QRLabel42.Caption := Cliente.AsString;

      F_Firma.GetFromControl;
      Rp.QRLabel24.Caption := F_Firma.AsString;

      Rp.Preview;
      Rp.Free;
   except
      on e: Exception do
         MessageDlg('Error al Imprimir el Convenio Modificatorio del Contrato ' + Contrato.Id_Contrato.asString + '.' + Chr(VK_RETURN) + e.Message, mtError, [MBOK], 0);
   end;
end;

procedure TWProemioGen.FormShow(Sender: TObject);
begin
  With Objeto do
  Begin
    Contrato.Id_Contrato.Control:= lblContrato;
    B_ConvModif.Control:= ckConvenio;

    F_Firma.Control    := eFecFirma;
    F_Firma.AsDateTime := Apli.DameFechaEmpresaDia('D000');

    Cliente.Control:= cbCliente;

    Representantes.ListRepresenta:= lvRepresentantes;

    { Inicialización de Representantes del Grupo Financiero }
    Representantes.InicializaRepresentantes(Objeto.ConfigCaptura.Tipo_Proemio.AsString, Contrato.Id_Entidad.asInteger);

    { Inicialización de Representantes del Cliente }
    IniciaRepresentantesCliente(cbCliente);

    { Inicialización de los contratos que tienen acceso via Internét }
    //IniciaContratosILine(lvContratosILine);

    cbCliente.Enabled:= Contrato.Producto.Cve_Per_Jur_Prod.AsString = 'PM';

  end;
end;

procedure TWProemioGen.InterForma1DespuesShow(Sender: TObject);
begin
  if GetSQL('SELECT CVE_OPER_ACC FROM SECU_OPER_ACC WHERE (CVE_FUNCION=''CLASE_TCONTRATO'') AND (CVE_USUARIO='''+objeto.DameUsuario+''') and (CVE_OPER_ACC=''IC'')',
     objeto.SeguDataBaseName,objeto.SeguSessionName,True)  THEN
  BEGIN
    ImprimirDocto:= true;
  END
  ELSE
  BEGIN
    ImprimirDocto:= false;
    objeto.B_ConvModif.AsString := 'F';
  END;

  // Validar si cuenta el usuario con permiso de cambiar la fecha de firma de contrato.
  if GetSQL('SELECT CVE_OPER_ACC FROM SECU_OPER_ACC WHERE (CVE_FUNCION=''CLASE_TCONTRATO'') AND (CVE_USUARIO='''+objeto.DameUsuario+''') and (CVE_OPER_ACC=''CF'')',
     objeto.SeguDataBaseName,objeto.SeguSessionName,True)  then
  begin
    eFecFirma.Enabled   := True;
    dtpFecFirma.Enabled := True;
  end
  else
  begin
    eFecFirma.Enabled   := False;
    dtpFecFirma.Enabled := False;
  end;

  if //Convenio Modificatorio para el Envío de Estados de Cuenta por Medios Electrónicos
  GetSQL('SELECT CVE_OPER_ACC FROM SECU_OPER_ACC WHERE (CVE_FUNCION=''CLASE_TCONTRATO'') AND (CVE_USUARIO='''+objeto.DameUsuario+''') and (CVE_OPER_ACC=''CN'')',
     objeto.SeguDataBaseName,objeto.SeguSessionName,True) THEN
  BEGIN
    ckConvenio.Visible  := True;
  END
  ELSE
  BEGIN
    ckConvenio.Visible          := False;
    objeto.B_ConvModif.AsString := 'F';
  END;
end;

procedure TWProemioGen.FormDestroy(Sender: TObject);
begin
  With Objeto do
  Begin
    Contrato.Id_Contrato.Control:= nil;
    B_ConvModif.Control:= nil;
    F_Firma.Control := nil;
    Cliente.Control:= nil;
    Representantes.ListRepresenta:= nil;
  end;
end;

procedure TWProemioGen.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TWProemioGen.InterForma1Preview(Sender: TObject);
begin
   Objeto.Impresion;
end;

procedure TWProemioGen.InterForma1Imprimir(Sender: TObject);
begin
   Objeto.Impresion(False);
end;
end.
