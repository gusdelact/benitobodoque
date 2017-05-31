// Sistema         : Clase de ImpProICB
// Fecha de Inicio : 17/07/2006
// Función forma   : Clase de ImpProICB
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Jose Alberto Ramirez Pacheco
// Comentarios     :
Unit IntProemioICB;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  Buttons, ExtCtrls, ComCtrls, DB, DbTables, DBCtrls,
  IntFrm, InterFor, IntFind, InterFun, Quickrpt, QRCtrls, InterMemo,
  InterEdit, IntDtPk,
  IntCtto,          { Clase Corporativa de Contratos }
  IntRepresenta,    { Catálogo de Representantes del Grupo Financiero }
  ComObj //PAra el caso de manipular ms word
  ,shellapi, printers     //para el shellexecute
  ;

// CZR 02-mayo-2011
// Informacion de Persona
Type
   TDatosPersona = Record
      Nombre     : String;
      Puesto     : String;
      Email      : String;
      Telefono   : String;
      Fax        : String;
      Dom_Fiscal : String;
   end;
// Opciones de reporte GMSLA de Cto Marco
Type
   TOpcRpGMSLACtoMarco = Record
      Tasa        : String;
      AgtProcesos : String;
      Opcion1     : String;
      Opcion2     : String;
      Opcion3     : String;
      Opcion4     : String;
      Opcion5     : String;
      Opcion6     : String;
      Opcion7     : String;
      Opcion8     : String;
      Opcion9     : String;
      Opcion10    : String;
      Opcion11    : String;
      Opcion12    : String;
      Opcion13    : String;
      Opcion14    : String;
   end;

var
   ImprimirDocto      : Boolean;
   // CZR 03-junio-2011
   OpcRpGMSLACtoMarco : TOpcRpGMSLACtoMarco;

const
   cTipoProemio       : String = 'ICB';   { Tipo de Proemio controlado por la clase }
   //Contratantes
   cCtteRepLegal      : String = 'C004';
   cCtteRepMenor      : String = 'C006';
   // Conceptos
   cConceptoGeneral   : String = 'T001';
   cConceptoMenorEdad : String = 'T015';
   // CZR 30-Mayo-2011   Contrato Marco
   cConfirmaCtoMarco  : String = 'COOICB'; // Confirma
   cAutorizaCtoMarco  : String = 'AUTICB'; // Autoriza
   cOperadorCtoMarco  : String = 'OPEICB'; // Operador
   cPrestamoValores   : String = 'PRVA';   // Clave de Medio para Prestamo de Valores

Type
  TProemioICB  = Class;

  TWProemioICB = Class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    chkProemio: TCheckBox;
    chkMandato: TCheckBox;
    chkKYC: TCheckBox;
    chkConvenio: TCheckBox;
    chkCarta: TCheckBox;
    lblContrato: TLabel;
    ckConvenio: TCheckBox;
    ckCGBinter: TCheckBox;
    ckD218: TCheckBox;
    ckD219: TCheckBox;
    ckPerTra: TCheckBox;
    ckAfoSiefores: TCheckBox;
    ckCtoMarco: TCheckBox;
    pcOpciones: TPageControl;
    TabGeneral: TTabSheet;
    TabCtoMarco: TTabSheet;
    lbCAMPO1: TLabel;
    Bevel2: TBevel;
    Label2: TLabel;
    Bevel3: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Bevel4: TBevel;
    Label7: TLabel;
    lFecFirma: TLabel;
    edPiePagina: TEdit;
    edTipoFirma: TEdit;
    cbCliente: TComboBox;
    lvRepresentantes: TListView;
    lvContratosILine: TListView;
    eFecFirma: TEdit;
    dtpFecFirma: TInterDateTimePicker;
    InterForma1: TInterForma;
    cbConfirmaCtoMarco: TComboBox;
    cbAutorizaCtoMarco: TComboBox;
    cbOperadorCtoMarco: TComboBox;
    lConfirmaCtoMarco: TLabel;
    lAutorizaCtoMarco: TLabel;
    lOperadorCtoMarco: TLabel;
    rgFormatoCtoMarco: TRadioGroup;
    lFormatoCtoMarco: TLabel;
    btnOpcRpGMSLA: TButton;
    BtnImprimeClausulado: TButton;
    procedure LimpiaValorOpcRpGMSLA; // CZR 03-junio-2011
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1Preview(Sender: TObject);
    procedure InterForma1Imprimir(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure ckCtoMarcoClick(Sender: TObject);
    procedure btnOpcRpGMSLAClick(Sender: TObject);
    procedure BtnImprimeClausuladoClick(Sender: TObject);
  public
    { Public declarations }
    Objeto : TProemioICB;
  end;


  TProemioICB= class(TInterFrame)
  private
    FContrato : TContrato;

    Procedure ImprimeCGBinter(pPreview: Boolean);
    Procedure ImprimeConvenioModif(pPreview: Boolean);
    Procedure ImprimeProemio(pPreview: Boolean);
    Procedure ImprimeKYC(pPreview: Boolean);
    Procedure ImprimeConvenio(pPreview: Boolean);
    Procedure ImprimeCarta(pPreview: Boolean);
    Procedure ImprimeDocumento(pDocumento : String; pPreview : Boolean);        // CZR 15-Abr-2010
    Procedure ImprimePerTransaccional(pPreview: Boolean);                       // CZR 29-Nov-2010
    Procedure ImprimeAforesSieforesOMNIBUS(pPreview: Boolean);                  // CZR 08-Abr-2011
    // CZR 30-Mayo-2011
    Function  ObtenerDatosPersona (pIdPersona : Integer) : TDatosPersona;
    Function  ObtenerRepresentantes(pIdContrato: Integer) : String;
    Procedure ObtenerCtasLiquidacion (pIdIntermediario: Integer; label1: TQRLabel; label2: TQRLabel; label3: TQRLabel; label4: TQRLabel; label5: TQRLabel; label6: TQRLabel; label7: TQRLabel);
    Function  ConfOpcReporte : Boolean;
    Function  MesEnIngles(pMes : integer) : String;
    Procedure ImprimeCtoMarco(pPreview: Boolean);

  Protected
    Procedure SetContrato(pContrato: TContrato);
    Procedure IniciaRepresentantesCliente(pCombo: TComboBox);
    Procedure IniciaContratosILine(pLista: TListView);
  Public
    { Public declarations }
{
    Id_Contrato: TInterCampo;
    Id_Entidad: TInterCampo;
}
    B_CGBinter          : TInterCampo;
    B_ConvModif         : TInterCampo;
    B_Proemio           : TInterCampo;
    B_KYC               : TInterCampo;
    B_Mandato           : TInterCampo;
    B_Convenio          : TInterCampo;
    B_Carta             : TInterCampo;
    B_D218              : TInterCampo; // CZR 15-Abr-2010
    B_D219              : TInterCampo; // CZR 15-Abr-2010
    F_Firma             : TInterCampo; // CZR 31-Ago-2009
    B_PerTra            : TInterCampo; // CZR 29-Nov-2010
    B_AfoSiefores       : TInterCampo; // CZR 08-Abr-2011
    Cliente             : TInterCampo;
    Tiene_ILine         : TInterCampo;
    TextoPiePagina      : TInterCampo;
    TextoTipoFirma      : TInterCampo;
    // CZR 30-Mayo-2011   Contrato Marco
    B_CtoMarco          : TInterCampo;
    Formato_CtoMarco    : TInterCampo;
    Confirma_CtoMarco   : TInterCampo;
    Autoriza_CtoMarco   : TInterCampo;
    Operador_CtoMarco   : TInterCampo;

    Representantes : TRepresent;

    Property    Contrato: TContrato Read FContrato Write SetContrato;

    Constructor Create(AOwner: TComponent); override;
    Destructor  Destroy; override;
    Procedure   DataBaseChange; override;
    function    ShowWindow(FormaTipo: TFormaTipo): Integer; override;
    function    Reporte:Boolean; override;
    Procedure   Impresion(pPreview: Boolean = True);
  published
    { Published declarations }
  end;

  Procedure ImpresionProemioICB(pContrato: TContrato);

implementation

Uses
  UnSQL2,           { Unidad general para consultas a Base de Datos }
  UnGene,           { Funciones Generales - Interacciones }
  UnProemioICB_PF,  { Proemio para Personas Físicas }
  UnProemioICB_PM,  { Proemio para Personas Morales }
  UnAnexoKYC_PF,    { Anexo - Información KYC Personas Fisicas }
  UnAnexoKYC_PFEmp, { Anexo - Información KYC Personas Fisicas con Actividad Empresarial }
  UnAnexoKYC_PM,    { Anexo - Información KYC Personas Morales }
  UnAnexoMandato,   { Anexo - Mandato para Personas Morales }
  UnConvenio_OpInt, { Anexo - Convenio de Operaciones Internacionales }
  UnCarta_InvCal,   { Carta - Carta Inversionista Calificado }
  UnRpConv,
  UnRpConvNor,
  IntQRPreview,
  UnRpCGBinterPF,   { Reporte de Cartas Genéricas de Personas Físicas }
  UnRpCGBinterPM,   { Reporte de Cartas Genéricas de Personas Morales }
  UnRpDoc,          { Reporte Documento D218 y D219 }                           // CZR 15-Abr-2010
  UnRpPerTra,       { Reporte de Convenio de Perfil Transaccional }             // CZR 29-Nov-2010
  UnRpAfoSiefores,  { Reporte de Convenio para Afores y Siefores (ómnibus) }    // CZR 08-Abr-2011
  { Impresión de Contrato Marco }
  unCtoMarcoMSLA,   { Master Securities Loan Agreement }                        // CZR 16-mayo-2011
  unCtoMarcoOSLA,   { Overseas Securities Lender´s Agreement }                  // CZR 17-mayo-2011
  unCtoMarcoGMSLA,  { Global Master Securities Lending Agreement }              // CZR 17-mayo-2011
  IntOpRpGMSLA;     { Opciones de reporte GMSLA }                               // CZR 03-junio-2011
{$R *.DFM}

Procedure ImpresionProemioICB(pContrato: tContrato);
Var Proemio: TProemioICB;
Begin
  Proemio:= TProemioICB.Create(nil);
  Try
    Proemio.Apli:= pContrato.Apli;
    Proemio.Contrato:= pContrato;
    Proemio.ShowWindow(ftImprimir);
  Finally
    Proemio.Free; Proemio:= nil;
  end;
end;


Constructor TProemioICB.Create( AOwner : TComponent );
begin
  Inherited;
{
  Id_Contrato:= CreaCampo('ID_CONTRATO', ftFloat, tsNinguno, tsNinguno, False);
  Id_Entidad:= CreaCampo('ID_ENTIDAD', ftInteger, tsNinguno, tsNinguno, False);
}
  B_CGBinter    := CreaCampo('B_CGBINTER',    ftString, tsNinguno, tsNinguno, False);
  B_ConvModif   := CreaCampo('B_CONVMODIF',   ftString, tsNinguno, tsNinguno, False);
  B_Proemio     := CreaCampo('B_PROEMIO',     ftString, tsNinguno, tsNinguno, False);
  B_KYC         := CreaCampo('B_KYC',         ftString, tsNinguno, tsNinguno, False);
  B_Mandato     := CreaCampo('B_MANDATO',     ftString, tsNinguno, tsNinguno, False);
  B_Convenio    := CreaCampo('B_CONVENIO',    ftString, tsNinguno, tsNinguno, False);
  B_Carta       := CreaCampo('B_CARTA',       ftString, tsNinguno, tsNinguno, False);
  B_D218        := CreaCampo('B_D218',        ftString, tsNinguno, tsNinguno, False); // CZR 15-Abr-2010
  B_D219        := CreaCampo('B_D219',        ftString, tsNinguno, tsNinguno, False); // CZR 15-Abr-2010
  F_Firma       := CreaCampo('F_FIRMA',       ftDate,   tsNinguno, tsNinguno, False); // CZR 31-Ago-2009
  B_PerTra      := CreaCampo('B_PERTRA',      ftString, tsNinguno, tsNinguno, False); // CZR 29-Nov-2010
  B_AfoSiefores := CreaCampo('B_AFOSIEFORES', ftString, tsNinguno, tsNinguno, False); // CZR 08-Abr-2011

  // CZR 30-Mayo-2011
  B_CtoMarco          := CreaCampo('B_CTOMARCO',          ftString,  tsNinguno, tsNinguno, False);
  Formato_CtoMarco    := CreaCampo('FORMATO_CTOMARCO',    ftString,  tsNinguno, tsNinguno, False);
  Confirma_CtoMarco   := CreaCampo('CONFIRMA_CTOMARCO',   ftString,  tsNinguno, tsNinguno, False);
  Autoriza_CtoMarco   := CreaCampo('AUTORIZA_CTOMARCO',   ftString,  tsNinguno, tsNinguno, False);
  Operador_CtoMarco   := CreaCampo('OPERADOR_CTOMARCO',   ftString,  tsNinguno, tsNinguno, False);

  Cliente:= CreaCampo('CLIENTE', ftString, tsNinguno, tsNinguno, False);
  Tiene_ILine:= CreaCampo('TIENE_ILINE', ftString, tsNinguno, tsNinguno, False);
  TextoPiePagina:= CreaCampo('TEXTOPIEPAGINA', ftString, tsNinguno, tsNinguno, False);
  TextoTipoFirma:= CreaCampo('TEXTOTIPOFIRMA', ftString, tsNinguno, tsNinguno, False);

  Representantes:= TRepresent.Create(Self);

  UseQuery := False;
  ShowMenuReporte:= True;
end;


Destructor TProemioICB.Destroy;
begin
  If Representantes <> nil Then Representantes.Free; Representantes:= nil;
  inherited;
end;


Procedure TProemioICB.DataBaseChange;
Begin
  inherited;
  Representantes.GetParams(Self);
end;


function TProemioICB.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W   : TWProemioICB;
   Qry : TQuery; // CZR 30-Mayo-2011
begin
  W:=TWProemioICB.Create(Self);
  Try
    W.Objeto:= Self;
    W.InterForma1.InterFrame:= Self;
    W.InterForma1.FormaTipo:= ftImprimir; //FIJA EL TIPO DE FORMA

    // CZR 30-Mayo-2011
    try
       Qry := GetSqlQuery(' SELECT REPRESENTANTE.TIPO_PROEMIO, '
                        + '        PERSONA.ID_PERSONA, '
                        + '        PERSONA.NOMBRE '
                        + '   FROM REPRESENTANTE, '
                        + '        PERSONA '
                        + '  WHERE REPRESENTANTE.TIPO_PROEMIO  IN (''' + cConfirmaCtoMarco + ''', ''' + cAutorizaCtoMarco + ''', ''' + cOperadorCtoMarco + ''')'
                        + '    AND REPRESENTANTE.SIT_REPRESENTA = ''AC'''
                        + '    AND REPRESENTANTE.ID_PERSONA     = PERSONA.ID_PERSONA '
                        + '    AND PERSONA.SIT_PERSONA          = ''AC'''
                        + ' ORDER BY REPRESENTANTE.TIPO_PROEMIO, PERSONA.NOMBRE',
                          Apli.DataBaseName, Apli.SessionName, True);
      if Qry <> nil then
      begin
         Confirma_CtoMarco.UseCombo := True;
         Autoriza_CtoMarco.UseCombo := True;
         Operador_CtoMarco.UseCombo := True;
         while not Qry.eof do
         begin
            if trim(Qry.FieldByName('TIPO_PROEMIO').AsString) = cConfirmaCtoMarco then
            begin
               Confirma_CtoMarco.ComboLista.Add(trim(Qry.FieldByName('NOMBRE').AsString));
               Confirma_CtoMarco.ComboDatos.Add(trim(Qry.FieldByName('ID_PERSONA').AsString));
            end;
            if trim(Qry.FieldByName('TIPO_PROEMIO').AsString) = cAutorizaCtoMarco then
            begin
               Autoriza_CtoMarco.ComboLista.Add(trim(Qry.FieldByName('NOMBRE').AsString));
               Autoriza_CtoMarco.ComboDatos.Add(trim(Qry.FieldByName('ID_PERSONA').AsString));
            end;
            if trim(Qry.FieldByName('TIPO_PROEMIO').AsString) = cOperadorCtoMarco then
            begin
               Operador_CtoMarco.ComboLista.Add(trim(Qry.FieldByName('NOMBRE').AsString));
               Operador_CtoMarco.ComboDatos.Add(trim(Qry.FieldByName('ID_PERSONA').AsString));
            end;
            Qry.next;
         end;
      end;
    finally
       if Qry <> nil then
          Qry.Free;
    end;

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


function TProemioICB.Reporte:Boolean;
begin Impresion;
end;


Procedure TProemioICB.Impresion(pPreview: Boolean = True);
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
    If B_CGBinter.AsString    = 'V' then ImprimeCGBinter(pPreview);
    If B_ConvModif.AsString   = 'V' then ImprimeConvenioModif(pPreview);
    If B_Proemio.AsString     = 'V' then ImprimeProemio(pPreview);
    If B_KYC.AsString         = 'V' then ImprimeKYC(pPreview);
    If B_Mandato.AsString     = 'V' then Execute_AnexoMandato(Self, pPreview);
    If B_Convenio.AsString    = 'V' then ImprimeConvenio(pPreview);
    If B_Carta.AsString       = 'V' then ImprimeCarta(pPreview);
    If B_D218.AsString        = 'V' then ImprimeDocumento('D218', pPreview);     // CZR 15-Abr-2010
    If B_D219.AsString        = 'V' then ImprimeDocumento('D219', pPreview);     // CZR 15-Abr-2010
    If B_PerTra.AsString      = 'V' then ImprimePerTransaccional(pPreview);      // CZR 29-Nov-2010
    If B_AfoSiefores.AsString = 'V' then ImprimeAforesSieforesOMNIBUS(pPreview); // CZR 08-Abr-2011
    If B_CtoMarco.AsString    = 'V' then ImprimeCtoMarco(pPreview);              // CZR 27-Mayo-2011
  Except
    On e: Exception do
    Begin
      messagedlg('Error en la impresión del Proemio para Contratos de Intermediación. ' + chr(13) + //chr(VK_RETURN) +
                 e.Message, mtError, [mbOK], 0);
    end;

  end;
end;

procedure TProemioICB.ImprimePerTransaccional(pPreview: Boolean);
var
   Rp : TrpPerTra;
begin
   try
      Rp                      := TrpPerTra.Create(Self);
      Rp.QryCtto.Active       := False;
      Rp.QryCtto.DatabaseName := DataBaseName;
      Rp.QryCtto.SessionName  := SessionName;
      Rp.QryCtto.ParamByName('ID_CONTRATO').AsInteger := StrToInt(Contrato.Id_Contrato.asString);
      Rp.QryCtto.Active       := True;

      Rp.QRLabel26.Caption := UpperCase(Representantes.GetRepresentantes(' ', ' y/o' + chr(VK_RETURN)));

      Cliente.GetFromControl;
      Rp.QRLabel27.Caption := Cliente.AsString;

      F_Firma.GetFromControl;
      Rp.QRLabel24.Caption := F_Firma.AsString;

      Rp.Preview;
      Rp.Free;
   except
      on e: Exception do
         MessageDlg('Error al Imprimir el Convenio Perfil Transaccional del Contrato ' + Contrato.Id_Contrato.asString + '.' + Chr(VK_RETURN) + e.Message, mtError, [MBOK], 0);
   end;
end;

procedure TProemioICB.ImprimeAforesSieforesOMNIBUS(pPreview: Boolean);
var
   Rp : TRpAfoSiefores;
begin
   try
      Rp := TRpAfoSiefores.Create(Self);
      Cliente.GetFromControl;
      Rp.QRLabel27.Caption := Cliente.AsString;

      F_Firma.GetFromControl;
      Rp.QRLabel24.Caption := copy(F_Firma.AsString, 1, 2);
      Rp.QRLabel6.Caption  := copy(F_Firma.AsString, 4, 2);
      Rp.QRLabel20.Caption := copy(F_Firma.AsString, 7, 4) + '.';

      Rp.QRLabel26.Caption := UpperCase(Representantes.GetRepresentantes(' ', ' y/o' + chr(VK_RETURN)));
      Rp.Preview;
      Rp.Free;
   except
      on e: Exception do
         MessageDlg('Error al Imprimir el Convenio para Afores y Siefores (ómnibus) del Contrato ' + Contrato.Id_Contrato.asString + '.' + Chr(VK_RETURN) + e.Message, mtError, [MBOK], 0);
   end;
end;

// CZR 30-Mayo-2011   Obtiene Nombre, Puesto, Email, Telefono, Fax y Domicilio Fiscal de la persona solicitada
function TProemioICB.ObtenerDatosPersona (pIdPersona : Integer) : TDatosPersona;
var
   Qry          : TQuery;
   DatosPersona : TDatosPersona;
begin
   try
      Qry := GetSqlQuery('select persona.id_persona, '
                       + '       persona.nombre, '
                       + '       puesto.nombre_puesto, '
                       //+ '       nvl(direc_empleado.e_mail_ofic, direc_empleado.e_mail_personal) as email, '
                       + '       e_mail as email, '
                       //+ '       direc_empleado.telef_directo || '' ext. '' ||direc_empleado.ext_telefonica as telefono, '
                       + '       telef_oficina as telefono, '
                       //+ '       direc_empleado.tel_fax_asignado as fax, '
                       + '       telef_fax as fax, '
                       + '       domicilio.calle_numero  || '' '' || '
                       + '       domicilio.codigo_postal || '' '' || '
                       + '       domicilio.colonia       || '' '' || '
                       + '       ciudad.desc_poblacion   || '' '' || '
                       + '       estado.desc_poblacion   || '' '' || '
                       + '       pais.desc_poblacion as dom_fiscal '
                       + '  from persona, '
                       + '       empleado, '
                       //+ '       direc_empleado, ' // Arturo Larrondo quizo que se obtuvieran todos los datos de persona. 
                       + '       puesto, '
                       + '       domicilio, '
                       + '       poblacion ciudad, '
                       + '       poblacion estado, '
                       + '       poblacion pais '
                       + ' where persona.id_persona    = ' + IntToStr(pIdPersona)
                       + '   and persona.id_persona    = empleado.id_persona(+) '
                       //+ '   and empleado.id_persona   = direc_empleado.id_empleado(+) '
                       + '   and empleado.cve_puesto   = puesto.cve_puesto(+) '
                       + '   and persona.id_dom_fiscal = domicilio.id_domicilio '
                       + '   and domicilio.cve_ciudad  = ciudad.cve_poblacion '
                       + '   and domicilio.cve_estado  = estado.cve_poblacion '
                       + '   and domicilio.cve_pais    = pais.cve_poblacion',
                         Apli.DataBaseName, Apli.SessionName, True);
      if Qry <> nil then
      begin
         DatosPersona.Nombre     := trim(Qry.FieldByName('NOMBRE').AsString);
         DatosPersona.Puesto     := trim(Qry.FieldByName('NOMBRE_PUESTO').AsString);
         DatosPersona.Email      := trim(Qry.FieldByName('EMAIL').AsString);
         DatosPersona.Telefono   := trim(Qry.FieldByName('TELEFONO').AsString);
         DatosPersona.Fax        := trim(Qry.FieldByName('FAX').AsString);
         DatosPersona.Dom_Fiscal := trim(Qry.FieldByName('DOM_FISCAL').AsString);
      end;
   finally
      if Qry <> nil then
         Qry.Free;
      result := DatosPersona;
   end;
end;

// CZR 20-Julio-2011   Obtiene los representantes de un contrato
function TProemioICB.ObtenerRepresentantes(pIdContrato: Integer) : String;
var
   Qry        : TQuery;
   vResultado : String;
begin
   try
      vResultado := '';
      Qry := GetSqlQuery('select cte.cve_contratante, per.nombre '
                       + '  from contratante cte, '
                       + '       persona     per '
                       + ' where cte.id_contrato     = ' + IntToStr(pIdContrato)
                       + '   and cte.id_persona      = per.id_persona '
                       + '   and cte.cve_contratante = ''C004'''
                       + ' order by cte.cve_contratante, per.nombre',
                         Apli.DataBaseName, Apli.SessionName, True);
      if Qry <> nil then
      begin
         while not Qry.eof do
         begin
            vResultado := vResultado + ', ' + trim(Qry.FieldByName('NOMBRE').AsString);
            Qry.Next;
         end;
         vResultado := copy(vResultado, 3, length(vResultado))
      end;
   finally
      if Qry <> nil then
         Qry.Free;
   end;
   result := vResultado;
end;

// CZR 02-junio-2011   Obtiene Cuentas de Liquidacion
procedure TProemioICB.ObtenerCtasLiquidacion (pIdIntermediario: Integer; label1: TQRLabel; label2: TQRLabel; label3: TQRLabel; label4: TQRLabel; label5: TQRLabel; label6: TQRLabel; label7: TQRLabel);
var
   Qry : TQuery;
   vCtaPropiaIndeval : String;
begin
   try
      vCtaPropiaIndeval := '';
      label1.Caption    := '';
      label2.Caption    := '';
      label3.Caption    := '';
      label4.Caption    := '';
      label5.Caption    := '';
      label6.Caption    := '';
      label7.Caption    := '';

      Qry := GetSQLQuery(' SELECT CVE_VIA_LIQCION, CTA_SIST_INTERM, TIPO_CTA_INTERM, '
                       + '        DECODE(CVE_VIA_LIQCION, ''MDOSEC'', SUBSTR(CTA_SIST_INTERM, LENGTH(CTA_SIST_INTERM)-3, LENGTH(CTA_SIST_INTERM)), '
                       + '                                            CTA_SIST_INTERM) AS CTA_SIST_INTERM_AUX, '
                       + '        (CASE WHEN TIPO_CTA_INTERM = ''PR'' THEN ''Propia'''
                       + '              WHEN TIPO_CTA_INTERM = ''TR'' THEN ''Terceros'''
                       + '              ELSE                               CVE_VIA_LIQCION'
                       + '         END) AS DESC_TIPO_CTA '
                       + ' FROM CTA_VIA_LIQCION '
                       + ' WHERE CVE_VIA_LIQCION IN (''INDEVAL'', ''MDOSEC'', ''SAIF'', ''SIAC'') '
                       + '   AND ID_INTERMEDIARIO = ' + IntToStr(pIdIntermediario)
                       + ' ORDER BY CVE_VIA_LIQCION, TIPO_CTA_INTERM',
                         Apli.DataBaseName, Apli.SessionName, True);
                         
      if Qry <> nil then
      begin
         while not Qry.eof do
         begin
            if trim(Qry.FieldByName('CVE_VIA_LIQCION').AsString) = 'INDEVAL' then
            begin
               if trim(Qry.FieldByName('TIPO_CTA_INTERM').AsString) = 'PR' then
                  vCtaPropiaIndeval := trim(Qry.FieldByName('CTA_SIST_INTERM_AUX').AsString)
               else
               begin
                  label1.Caption := trim(Qry.FieldByName('CTA_SIST_INTERM_AUX').AsString);
                  label2.Caption := trim(Qry.FieldByName('CTA_SIST_INTERM_AUX').AsString);
                  label7.Caption := trim(Qry.FieldByName('CTA_SIST_INTERM_AUX').AsString);
               end;
            end;
            if trim(Qry.FieldByName('CVE_VIA_LIQCION').AsString) = 'MDOSEC' then
            begin
               if trim(Qry.FieldByName('TIPO_CTA_INTERM').AsString) = 'PR' then
                  label3.Caption := trim(Qry.FieldByName('CTA_SIST_INTERM_AUX').AsString) + ' - ' + trim(Qry.FieldByName('DESC_TIPO_CTA').AsString)
               else
                  label4.Caption := trim(Qry.FieldByName('CTA_SIST_INTERM_AUX').AsString) + ' - ' + trim(Qry.FieldByName('DESC_TIPO_CTA').AsString);
            end;
            if trim(Qry.FieldByName('CVE_VIA_LIQCION').AsString) = 'SIAC' then
               label5.Caption := trim(Qry.FieldByName('CTA_SIST_INTERM_AUX').AsString);
            if trim(Qry.FieldByName('CVE_VIA_LIQCION').AsString) = 'SAIF' then
               label6.Caption := trim(Qry.FieldByName('CTA_SIST_INTERM_AUX').AsString);
            Qry.next;
         end;
         label7.Caption := trim(label7.Caption) + ' ' + vCtaPropiaIndeval + ' Stock pledge without transfer of ownership';
      end;
   finally
      if Qry <> nil then
         Qry.Free;
   end;
end;

// CZR 27-Junio-2011   Valida configuracion de opciones del reporte
function TProemioICB.ConfOpcReporte : Boolean;
var
   Qry : TQuery;
begin
   try
      Qry := GetSqlQuery(' select distinct det.cve_grupo '
                       + '   from sb_grupo_aforo            gpo, '
                       + '        sb_aforo_contrato_detalle det, '
                       + '        sb_aforo_contrato         cto '
                       + '  where gpo.id_empresa    = ' + Contrato.Id_Empresa.AsSQL
                       + '    and gpo.cve_medio     = ''' + trim(cPrestamoValores) + ''''
                       + '    and gpo.sit_aforo_gpo = ''AC'''
                       + '    and det.id_empresa    = gpo.id_empresa '
                       + '    and det.cve_grupo     = gpo.cve_grupo '
                       + '    and det.cve_medio     = gpo.cve_medio '
                       + '    and det.id_contrato   = ' + Contrato.Id_Contrato.AsSQL
                       + '    and cto.id_contrato   = det.id_contrato '
                       + '    and cto.cve_medio     = det.cve_medio '
                       + '    and cto.sit_aforo_cto = ''AC'''
                       + '    and cto.f_vigencia   >= trunc(sysdate)',
                         Apli.DataBaseName, Apli.SessionName, True);
      result := (Qry <> nil);
   finally
      if Qry <> nil then
         Qry.Free;
   end;
end;

// CZR 09-Agosto-2011
function TProemioICB.MesEnIngles(pMes : integer) : String;
begin
   case pMes of
     1:    result := 'JANUARY';
     2:    result := 'FEBRUARY';
     3:    result := 'MARCH';
     4:    result := 'APRIL';
     5:    result := 'MAY';
     6:    result := 'JUNE';
     7:    result := 'JULY';
     8:    result := 'AUGUST';
     9:    result := 'SEPTEMBER';
     10:   result := 'OCTOBER';
     11:   result := 'NOVEMBER';
     12:   result := 'DECEMBER';
   end;
end;

procedure TProemioICB.ImprimeCtoMarco(pPreview: Boolean);
var
   RpMSLA          : TCtoMarcoMSLA;
   RpOSLA          : TCtoMarcoOSLA;
   RpGMSLA         : TCtoMarcoGMSLA;
   DatosPersona    : TDatosPersona;
   n               : Integer;
   vRepresentantes : String;
   vNombreConfirma : String;
begin
   if not ConfOpcReporte then
   begin
      MessageDlg('Debe configurar las opciones en reporte', mtInformation, [mbOk], 0);
      exit;
   end;
   vRepresentantes := ObtenerRepresentantes(Contrato.Id_Contrato.AsInteger);

   try
      case StrToInt(Formato_CtoMarco.AsString) of
         //---------------------------------------------------------------------
         // Master Securities Loan Agreement
         //---------------------------------------------------------------------
         0:
         begin
            RpMSLA := TCtoMarcoMSLA.Create(Self);
            with RpMSLA do
            begin
               // pag 1
               QRLabel2.Caption := DateToStr(F_Firma.AsDateTime);
               QRLabel3.Caption := trim(Contrato.Titular.Nombre.AsString);
               QRLabel4.Caption := trim(Contrato.Empresa.Nombre.AsString);

               DatosPersona := ObtenerDatosPersona(Confirma_CtoMarco.AsInteger);
               if Contrato.Id_Empresa.AsInteger = 1 then
                  vNombreConfirma := trim(DatosPersona.Nombre)
               else
                  vNombreConfirma := trim(DatosPersona.Nombre) + ' by ' + trim(Contrato.Empresa.Nombre.AsString);
               // pag 20
               QRMacvMemo174.Textos.Clear;
               QRMacvMemo453.Textos.Clear;
               QRMacvMemo449.Textos.Clear;
               QRMacvMemo386.Textos.Clear;
               QRMacvMemo388.Textos.Clear;
               QRMacvMemo387.Textos.Clear;
               QRMacvMemo174.Textos.Add(trim(vRepresentantes));
               QRMacvMemo453.Textos.Add(Contrato.Titular.Nombre.AsString);
               QRMacvMemo449.Textos.Add(DateToStr(F_Firma.AsDateTime));
               QRMacvMemo386.Textos.Add(trim(vNombreConfirma));
               QRMacvMemo388.Textos.Add(DatosPersona.Puesto);
               QRMacvMemo387.Textos.Add(DateToStr(F_Firma.AsDateTime));
               // AI-3
               QRMacvMemo457.Textos.Clear;
               QRMacvMemo460.Textos.Clear;
               QRMacvMemo464.Textos.Clear;
               QRMacvMemo158.Textos.Clear;
               QRMacvMemo161.Textos.Clear;
               QRMacvMemo164.Textos.Clear;
               QRMacvMemo457.Textos.Add(trim(vRepresentantes));
               QRMacvMemo464.Textos.Add(Contrato.Titular.Nombre.AsString);
               QRMacvMemo460.Textos.Add(DateToStr(F_Firma.AsDateTime));
               QRMacvMemo158.Textos.Add(trim(vNombreConfirma));
               QRMacvMemo161.Textos.Add(DatosPersona.Puesto);
               QRMacvMemo164.Textos.Add(DateToStr(F_Firma.AsDateTime));
               // AII-1
               QRMacvMemo469.Textos.Clear;
               QRMacvMemo472.Textos.Clear;
               QRMacvMemo476.Textos.Clear;
               QRMacvMemo127.Textos.Clear;
               QRMacvMemo176.Textos.Clear;
               QRMacvMemo194.Textos.Clear;
               QRMacvMemo469.Textos.Add(trim(vRepresentantes));
               QRMacvMemo476.Textos.Add(Contrato.Titular.Nombre.AsString);
               QRMacvMemo472.Textos.Add(DateToStr(F_Firma.AsDateTime));
               QRMacvMemo127.Textos.Add(trim(vNombreConfirma));
               QRMacvMemo176.Textos.Add(DatosPersona.Puesto);
               QRMacvMemo194.Textos.Add(DateToStr(F_Firma.AsDateTime));
               // AIII-2
               QRMacvMemo481.Textos.Clear;
               QRMacvMemo483.Textos.Clear;
               QRMacvMemo488.Textos.Clear;
               QRMacvMemo408.Textos.Clear;
               QRMacvMemo423.Textos.Clear;
               QRMacvMemo426.Textos.Clear;
               QRMacvMemo481.Textos.Add(trim(vRepresentantes));
               QRMacvMemo488.Textos.Add(Contrato.Titular.Nombre.AsString);
               QRMacvMemo483.Textos.Add(DateToStr(F_Firma.AsDateTime));
               QRMacvMemo408.Textos.Add(trim(vNombreConfirma));
               QRMacvMemo423.Textos.Add(DatosPersona.Puesto);
               QRMacvMemo426.Textos.Add(DateToStr(F_Firma.AsDateTime));
               // Schedule A
               QRMacvMemo493.Textos.Clear;
               QRMacvMemo496.Textos.Clear;
               QRMacvMemo500.Textos.Clear;
               QRMacvMemo504.Textos.Clear;
               QRMacvMemo507.Textos.Clear;
               QRMacvMemo510.Textos.Clear;
               QRMacvMemo493.Textos.Add(trim(vRepresentantes));
               QRMacvMemo500.Textos.Add(Contrato.Titular.Nombre.AsString);
               QRMacvMemo496.Textos.Add(DateToStr(F_Firma.AsDateTime));
               QRMacvMemo504.Textos.Add(trim(vNombreConfirma));
               QRMacvMemo507.Textos.Add(DatosPersona.Puesto);
               QRMacvMemo510.Textos.Add(DateToStr(F_Firma.AsDateTime));
               // Schedule B
               QRMacvMemo521.Textos.Clear;
               QRMacvMemo524.Textos.Clear;
               QRMacvMemo528.Textos.Clear;
               QRMacvMemo532.Textos.Clear;
               QRMacvMemo535.Textos.Clear;
               QRMacvMemo538.Textos.Clear;
               QRMacvMemo521.Textos.Add(trim(vRepresentantes));
               QRMacvMemo528.Textos.Add(Contrato.Titular.Nombre.AsString);
               QRMacvMemo524.Textos.Add(DateToStr(F_Firma.AsDateTime));
               QRMacvMemo532.Textos.Add(trim(vNombreConfirma));
               QRMacvMemo535.Textos.Add(DatosPersona.Puesto);
               QRMacvMemo538.Textos.Add(DateToStr(F_Firma.AsDateTime));
               // Schedule C
               QRMacvMemo549.Textos.Clear;
               QRMacvMemo552.Textos.Clear;
               QRMacvMemo556.Textos.Clear;
               QRMacvMemo560.Textos.Clear;
               QRMacvMemo563.Textos.Clear;
               QRMacvMemo566.Textos.Clear;
               QRMacvMemo549.Textos.Add(trim(vRepresentantes));
               QRMacvMemo556.Textos.Add(Contrato.Titular.Nombre.AsString);
               QRMacvMemo552.Textos.Add(DateToStr(F_Firma.AsDateTime));
               QRMacvMemo560.Textos.Add(trim(vNombreConfirma));
               QRMacvMemo563.Textos.Add(DatosPersona.Puesto);
               QRMacvMemo566.Textos.Add(DateToStr(F_Firma.AsDateTime));

               DatosPersona := ObtenerDatosPersona(Autoriza_CtoMarco.AsInteger);
               // pag 20
               QRMacvMemo147.Textos.Clear;
               QRMacvMemo150.Textos.Clear;
               QRMacvMemo147.Textos.Add(DatosPersona.Nombre);
               QRMacvMemo150.Textos.Add(DatosPersona.Puesto);
               // AI-3
               QRMacvMemo169.Textos.Clear;
               QRMacvMemo171.Textos.Clear;
               QRMacvMemo169.Textos.Add(DatosPersona.Nombre);
               QRMacvMemo171.Textos.Add(DatosPersona.Puesto);
               // AII-1
               QRMacvMemo201.Textos.Clear;
               QRMacvMemo393.Textos.Clear;
               QRMacvMemo201.Textos.Add(DatosPersona.Nombre);
               QRMacvMemo393.Textos.Add(DatosPersona.Puesto);
               // AIII-2
               QRMacvMemo430.Textos.Clear;
               QRMacvMemo433.Textos.Clear;
               QRMacvMemo430.Textos.Add(DatosPersona.Nombre);
               QRMacvMemo433.Textos.Add(DatosPersona.Puesto);
               // Schedule A
               QRMacvMemo514.Textos.Clear;
               QRMacvMemo517.Textos.Clear;
               QRMacvMemo514.Textos.Add(DatosPersona.Nombre);
               QRMacvMemo517.Textos.Add(DatosPersona.Puesto);
               // Schedule B
               QRMacvMemo542.Textos.Clear;
               QRMacvMemo545.Textos.Clear;
               QRMacvMemo542.Textos.Add(DatosPersona.Nombre);
               QRMacvMemo545.Textos.Add(DatosPersona.Puesto);
               // Schedule C
               QRMacvMemo574.Textos.Clear;
               QRMacvMemo572.Textos.Clear;
               QRMacvMemo574.Textos.Add(DatosPersona.Nombre);
               QRMacvMemo572.Textos.Add(DatosPersona.Puesto);

               DatosPersona := ObtenerDatosPersona(Contrato.Empresa.ID_Persona.AsInteger);
               // Schedule A
               QRMacvMemo445.Textos.Clear;
               QRMacvMemo445.Textos.Add(DatosPersona.Dom_Fiscal);

               QRLabel7.Caption := '';
               for n:=0 to Confirma_CtoMarco.ComboDatos.Count-1 do
               begin
                  DatosPersona     := ObtenerDatosPersona(StrToInt(Confirma_CtoMarco.ComboDatos.Strings[n]));
                  QRLabel7.Caption := QRLabel7.Caption + 'Name: '  + trim(DatosPersona.Nombre)   + chr(13);
                  QRLabel7.Caption := QRLabel7.Caption + 'Title: ' + trim(DatosPersona.Puesto)   + chr(13);
                  QRLabel7.Caption := QRLabel7.Caption + 'Phone: ' + trim(DatosPersona.Telefono) + chr(13);
                  QRLabel7.Caption := QRLabel7.Caption + 'Email: ' + trim(DatosPersona.Email)    + chr(13) + chr(13);
               end;
               QRLabel12.Caption := '';
               for n:=0 to Operador_CtoMarco.ComboDatos.Count-1 do
               begin
                  DatosPersona      := ObtenerDatosPersona(StrToInt(Operador_CtoMarco.ComboDatos.Strings[n]));
                  QRLabel12.Caption := QRLabel12.Caption + 'Name: '  + trim(DatosPersona.Nombre)   + chr(13);
                  QRLabel12.Caption := QRLabel12.Caption + 'Title: ' + trim(DatosPersona.Puesto)   + chr(13);
                  QRLabel12.Caption := QRLabel12.Caption + 'Phone: ' + trim(DatosPersona.Telefono) + chr(13);
                  QRLabel12.Caption := QRLabel12.Caption + 'Email: ' + trim(DatosPersona.Email)    + chr(13) + chr(13);
               end;

               // Schedule B
               // Instrucciones de Pago
               // Parte A
               QRLabel183.Caption := '';
               QRLabel190.Caption := '';
               ObtenerCtasLiquidacion(Contrato.Titular.ID_Persona.AsInteger, QRLabel181, QRLabel182, QRLabel191, QRLabel192, QRLabel187, QRLabel189, QRLabel231);
               // Parte B
               QRLabel168.Caption := '';
               QRLabel174.Caption := '';
               ObtenerCtasLiquidacion(Contrato.Empresa.ID_Persona.AsInteger, QRLabel175, QRLabel167, QRLabel210, QRLabel245, QRLabel172, QRLabel177, QRLabel223);

               // Schedule C
               QryCtto.Active       := False;
               QryCtto.DatabaseName := DataBaseName;
               QryCtto.SessionName  := SessionName;
               QryCtto.ParamByName('pIdEmpresa').AsInteger  := Contrato.Id_Empresa.AsInteger;
               QryCtto.ParamByName('pIdContrato').AsInteger := Contrato.Id_Contrato.AsInteger;
               QryCtto.Active       := True;

               RpMSLA.Preview;
               RpMSLA.Free;
            end;
         end;
         //---------------------------------------------------------------------
         // Overseas Securities Lender´s Agreement
         //---------------------------------------------------------------------
         1:
         begin
            RpOSLA := TCtoMarcoOSLA.Create(Self);
            with RpOSLA do
            begin
               // pag 2
               QRMacvMemo199.Textos.Clear;
               QRMacvMemo199.Textos.Add('IS MADE THE ' + FormatDateTime('dd', F_Firma.AsDateTime)                       + ' ' +
                                        'DAY OF '      + MesEnIngles(StrToInt(FormatDateTime('m', F_Firma.AsDateTime))) + ' ' +
                                        'OF '          + FormatDateTime('yyyy', F_Firma.AsDateTime)                     + '.');

               DatosPersona := ObtenerDatosPersona(Contrato.Titular.ID_Persona.AsInteger);
               // pag 2
               QRMacvMemo489.Parametro.Strings[0]:= trim(DatosPersona.Nombre);
               QRMacvMemo489.Parametro.Strings[1]:= trim(DatosPersona.Dom_Fiscal);
               // pag 25
               QRMacvMemo522.Textos.Clear;
               QRMacvMemo521.Textos.Clear;
               QRMacvMemo522.Textos.Add(trim(vRepresentantes));
               QRMacvMemo521.Textos.Add(trim(DatosPersona.Nombre));
               // Schedule 1
               QRMacvMemo603.Textos.Clear;
               QRMacvMemo605.Textos.Clear;
               QRMacvMemo603.Textos.Add(trim(vRepresentantes));
               QRMacvMemo605.Textos.Add(trim(DatosPersona.Nombre));
               // Schedule 2
               QRMacvMemo653.Textos.Clear;
               QRMacvMemo655.Textos.Clear;
               QRMacvMemo653.Textos.Add(trim(vRepresentantes));
               QRMacvMemo655.Textos.Add(trim(DatosPersona.Nombre));
               // Schedule 3
               QRMacvMemo667.Textos.Clear;
               QRMacvMemo668.Textos.Clear;
               QRMacvMemo667.Textos.Add(trim(vRepresentantes));
               QRMacvMemo668.Textos.Add(trim(DatosPersona.Nombre));

               DatosPersona := ObtenerDatosPersona(Contrato.Empresa.ID_Persona.AsInteger);
               // pag 2
               QRMacvMemo491.Parametro.Strings[0]:= trim(DatosPersona.Nombre);
               QRMacvMemo491.Parametro.Strings[1]:= trim(DatosPersona.Dom_Fiscal);
               // pag 25
               QRMacvMemo450.Textos.Clear;
               QRMacvMemo450.Textos.Add(trim(DatosPersona.Nombre));
               // Schedule 3
               QRMacvMemo221.Textos.Clear;
               QRMacvMemo221.Textos.Add(trim(DatosPersona.Dom_Fiscal));
               // Schedule 1
               QRMacvMemo649.Textos.Clear;
               QRMacvMemo649.Textos.Add(trim(DatosPersona.Nombre));
               // Schedule 2
               QRMacvMemo661.Textos.Clear;
               QRMacvMemo661.Textos.Add(trim(DatosPersona.Nombre));
               // Schedule 3
               QRMacvMemo675.Textos.Clear;
               QRMacvMemo675.Textos.Add(trim(DatosPersona.Nombre));

               DatosPersona := ObtenerDatosPersona(Confirma_CtoMarco.AsInteger);
               if Contrato.Id_Empresa.AsInteger = 1 then
                  vNombreConfirma := trim(DatosPersona.Nombre)
               else
                  vNombreConfirma := trim(DatosPersona.Nombre) + ' by ' + trim(Contrato.Empresa.Nombre.AsString);
               // pag 25
               QRMacvMemo449.Textos.Clear;
               QRMacvMemo449.Textos.Add(trim(vNombreConfirma));
               // Schedule 1
               QRMacvMemo650.Textos.Clear;
               QRMacvMemo650.Textos.Add(trim(vNombreConfirma));
               // Schedule 2
               QRMacvMemo659.Textos.Clear;
               QRMacvMemo659.Textos.Add(trim(vNombreConfirma));
               // Schedule 3
               QRMacvMemo673.Textos.Clear;
               QRMacvMemo673.Textos.Add(trim(vNombreConfirma));

               DatosPersona := ObtenerDatosPersona(Autoriza_CtoMarco.AsInteger);
               // pag 25
               QRMacvMemo451.Textos.Clear;
               QRMacvMemo451.Textos.Add(trim(DatosPersona.Nombre));
               // Schedule 1
               QRMacvMemo608.Textos.Clear;
               QRMacvMemo608.Textos.Add(trim(DatosPersona.Nombre));
               // Schedule 2
               QRMacvMemo665.Textos.Clear;
               QRMacvMemo665.Textos.Add(trim(DatosPersona.Nombre));
               // Schedule 3
               QRMacvMemo677.Textos.Clear;
               QRMacvMemo677.Textos.Add(trim(DatosPersona.Nombre));
               
               // Schedule 2
               QryCtto.Active       := False;
               QryCtto.DatabaseName := DataBaseName;
               QryCtto.SessionName  := SessionName;
               QryCtto.ParamByName('pIdEmpresa').AsInteger  := Contrato.Id_Empresa.AsInteger;
               QryCtto.ParamByName('pIdContrato').AsInteger := Contrato.Id_Contrato.AsInteger;
               QryCtto.Active       := True;

               // Schedule 3
               QRLabel7.Caption := '';
               for n:=0 to Confirma_CtoMarco.ComboDatos.Count-1 do
               begin
                  DatosPersona     := ObtenerDatosPersona(StrToInt(Confirma_CtoMarco.ComboDatos.Strings[n]));
                  QRLabel7.Caption := QRLabel7.Caption + 'Name: '  + trim(DatosPersona.Nombre)   + chr(13);
                  QRLabel7.Caption := QRLabel7.Caption + 'Title: ' + trim(DatosPersona.Puesto)   + chr(13);
                  QRLabel7.Caption := QRLabel7.Caption + 'Phone: ' + trim(DatosPersona.Telefono) + chr(13);
                  QRLabel7.Caption := QRLabel7.Caption + 'Email: ' + trim(DatosPersona.Email)    + chr(13) + chr(13);
               end;
               QRLabel12.Caption := '';
               for n:=0 to Operador_CtoMarco.ComboDatos.Count-1 do
               begin
                  DatosPersona      := ObtenerDatosPersona(StrToInt(Operador_CtoMarco.ComboDatos.Strings[n]));
                  QRLabel12.Caption := QRLabel12.Caption + 'Name: '  + trim(DatosPersona.Nombre)   + chr(13);
                  QRLabel12.Caption := QRLabel12.Caption + 'Title: ' + trim(DatosPersona.Puesto)   + chr(13);
                  QRLabel12.Caption := QRLabel12.Caption + 'Phone: ' + trim(DatosPersona.Telefono) + chr(13);
                  QRLabel12.Caption := QRLabel12.Caption + 'Email: ' + trim(DatosPersona.Email)    + chr(13) + chr(13);
               end;
               // Instrucciones de Pago
               // Parte A
               QRLabel183.Caption := '';
               QRLabel190.Caption := '';
               ObtenerCtasLiquidacion(Contrato.Titular.ID_Persona.AsInteger, QRLabel181, QRLabel182, QRLabel191, QRLabel192, QRLabel187, QRLabel189, QRLabel231);
               // Parte B
               QRLabel168.Caption := '';
               QRLabel174.Caption := '';
               ObtenerCtasLiquidacion(Contrato.Empresa.ID_Persona.AsInteger, QRLabel175, QRLabel167, QRLabel210, QRLabel245, QRLabel172, QRLabel177, QRLabel223);

               RpOSLA.Preview;
               RpOSLA.Free;
            end;
         end;
         //---------------------------------------------------------------------
         // Global Master Securities Lending Agreement
         //---------------------------------------------------------------------
         2:
         begin
            RpGMSLA := TCtoMarcoGMSLA.Create(Self);
            with RpGMSLA do
            begin
               // pag 3
               QRMacvMemo490.Parametro.Strings[0]:= trim(Contrato.Titular.Nombre.AsString);
               QRMacvMemo492.Parametro.Strings[0]:= trim(Contrato.Empresa.Nombre.AsString);

               DatosPersona := ObtenerDatosPersona(Confirma_CtoMarco.AsInteger);
               if Contrato.Id_Empresa.AsInteger = 1 then
                  vNombreConfirma := trim(DatosPersona.Nombre)
               else
                  vNombreConfirma := trim(DatosPersona.Nombre) + ' by ' + trim(Contrato.Empresa.Nombre.AsString);
               // pag 30
               QRMacvMemo234.Textos.Clear;
               QRMacvMemo422.Textos.Clear;
               QRMacvMemo646.Textos.Clear;
               QRMacvMemo859.Textos.Clear;
               QRMacvMemo234.Textos.Add(trim(vNombreConfirma));
               QRMacvMemo422.Textos.Add(trim(DatosPersona.Puesto));
               QRMacvMemo646.Textos.Add(DateToStr(F_Firma.AsDateTime));
               QRMacvMemo859.Textos.Add(trim(Contrato.Empresa.Nombre.AsString));
               // pag 32
               QRMacvMemo838.Textos.Clear;
               QRMacvMemo857.Textos.Clear;
               QRMacvMemo858.Textos.Clear;
               QRMacvMemo860.Textos.Clear;
               QRMacvMemo838.Textos.Add(trim(vNombreConfirma));
               QRMacvMemo857.Textos.Add(trim(DatosPersona.Fax));
               QRMacvMemo858.Textos.Add(trim(DatosPersona.Telefono));
               QRMacvMemo860.Textos.Add(trim(DatosPersona.Email));
               // Schedule 1
               QRMacvMemo158.Textos.Clear;
               QRMacvMemo159.Textos.Clear;
               QRMacvMemo160.Textos.Clear;
               QRMacvMemo168.Textos.Clear;
               QRMacvMemo158.Textos.Add(trim(vNombreConfirma));
               QRMacvMemo159.Textos.Add(trim(DatosPersona.Puesto));
               QRMacvMemo160.Textos.Add(DateToStr(F_Firma.AsDateTime));
               QRMacvMemo168.Textos.Add(trim(Contrato.Empresa.Nombre.AsString));
               // Schedule 2
               QRMacvMemo201.Textos.Clear;
               QRMacvMemo200.Textos.Clear;
               QRMacvMemo199.Textos.Clear;
               QRMacvMemo198.Textos.Clear;
               QRMacvMemo201.Textos.Add(trim(vNombreConfirma));
               QRMacvMemo200.Textos.Add(trim(DatosPersona.Puesto));
               QRMacvMemo199.Textos.Add(DateToStr(F_Firma.AsDateTime));
               QRMacvMemo198.Textos.Add(trim(Contrato.Empresa.Nombre.AsString));

               DatosPersona := ObtenerDatosPersona(Contrato.Empresa.ID_Persona.AsInteger);
               // pag 32
               QRMacvMemo837.Textos.Clear;
               QRMacvMemo837.Textos.Add(trim(DatosPersona.Dom_Fiscal));
               // Schedule 1
               QRMacvMemo863.Textos.Clear;
               QRMacvMemo863.Textos.Add(trim(DatosPersona.Dom_Fiscal));

               DatosPersona := ObtenerDatosPersona(Contrato.Titular.ID_Persona.AsInteger);
               // pag 30
               QRMacvMemo526.Textos.Clear;
               QRMacvMemo1.Textos.Clear;
               QRMacvMemo526.Textos.Add(trim(vRepresentantes));
               QRMacvMemo1.Textos.Add(trim(DatosPersona.Nombre));
               // pag 32
               QRMacvMemo233.Textos.Clear;
               QRMacvMemo393.Textos.Clear;
               QRMacvMemo648.Textos.Clear;
               QRMacvMemo654.Textos.Clear;
               QRMacvMemo656.Textos.Clear;
               QRMacvMemo233.Textos.Add(trim(DatosPersona.Dom_Fiscal));
               QRMacvMemo393.Textos.Add(trim(DatosPersona.Nombre));
               QRMacvMemo648.Textos.Add(trim(DatosPersona.Fax));
               QRMacvMemo654.Textos.Add(trim(DatosPersona.Telefono));
               QRMacvMemo656.Textos.Add(trim(DatosPersona.Email));
               // Schedule 1
               QRMacvMemo147.Textos.Clear;
               QRMacvMemo156.Textos.Clear;
               QRMacvMemo147.Textos.Add(trim(vRepresentantes));
               QRMacvMemo156.Textos.Add(trim(DatosPersona.Nombre));
               // Schedule 2
               QRMacvMemo212.Textos.Clear;
               QRMacvMemo206.Textos.Clear;
               QRMacvMemo212.Textos.Add(trim(vRepresentantes));
               QRMacvMemo206.Textos.Add(trim(DatosPersona.Nombre));

               DatosPersona := ObtenerDatosPersona(Autoriza_CtoMarco.AsInteger);
               // pag 30
               QRMacvMemo653.Textos.Clear;
               QRMacvMemo655.Textos.Clear;
               QRMacvMemo653.Textos.Add(trim(DatosPersona.Nombre));
               QRMacvMemo655.Textos.Add(trim(DatosPersona.Puesto));
               // Schedule 1
               QRMacvMemo170.Textos.Clear;
               QRMacvMemo171.Textos.Clear;
               QRMacvMemo170.Textos.Add(trim(DatosPersona.Nombre));
               QRMacvMemo171.Textos.Add(trim(DatosPersona.Puesto));
               // Schedule 2
               QRMacvMemo175.Textos.Clear;
               QRMacvMemo173.Textos.Clear;
               QRMacvMemo175.Textos.Add(trim(DatosPersona.Nombre));
               QRMacvMemo173.Textos.Add(trim(DatosPersona.Puesto));

               DatosPersona := ObtenerDatosPersona(Operador_CtoMarco.AsInteger);
               // pag32
               QRMacvMemo716.Textos.Clear;               
               QRMacvMemo716.Textos.Add(trim(OpcRpGMSLACtoMarco.AgtProcesos));
               QRMacvMemo685.Parametro.Strings[0]:= 'Pesos';

               // pag 31
               QRLabel5.Caption  := trim(OpcRpGMSLACtoMarco.Opcion1);
               QRLabel6.Caption  := trim(OpcRpGMSLACtoMarco.Opcion2);
               QRLabel7.Caption  := trim(OpcRpGMSLACtoMarco.Opcion3);
               QRLabel8.Caption  := trim(OpcRpGMSLACtoMarco.Opcion4);
               // pag32
               QRLabel9.Caption  := trim(OpcRpGMSLACtoMarco.Opcion5);
               QRLabel10.Caption := trim(OpcRpGMSLACtoMarco.Opcion6);
               QRMacvMemo688.Textos.Clear;
               QRMacvMemo688.Textos.Add('México');
               // pag 33
               QRLabel11.Caption  := trim(OpcRpGMSLACtoMarco.Opcion7);
               QRLabel12.Caption  := trim(OpcRpGMSLACtoMarco.Opcion8);
               QRLabel13.Caption  := trim(OpcRpGMSLACtoMarco.Opcion9);
               QRLabel14.Caption  := trim(OpcRpGMSLACtoMarco.Opcion10);
               QRLabel15.Caption  := trim(OpcRpGMSLACtoMarco.Opcion11);
               QRLabel16.Caption  := trim(OpcRpGMSLACtoMarco.Opcion12);
               QRLabel17.Caption  := trim(OpcRpGMSLACtoMarco.Opcion13);
               QRLabel18.Caption  := trim(OpcRpGMSLACtoMarco.Opcion14);
               QRMacvMemo738.Parametro.Strings[0]:= trim(OpcRpGMSLACtoMarco.Tasa);

               // Schedule 1
               QryCtto.Active       := False;
               QryCtto.DatabaseName := DataBaseName;
               QryCtto.SessionName  := SessionName;
               QryCtto.ParamByName('pIdEmpresa').AsInteger  := Contrato.Id_Empresa.AsInteger;
               QryCtto.ParamByName('pIdContrato').AsInteger := Contrato.Id_Contrato.AsInteger;
               QryCtto.Active       := True;
               QRLabel20.Caption    := '';
               for n:=0 to Confirma_CtoMarco.ComboDatos.Count-1 do
               begin
                  DatosPersona      := ObtenerDatosPersona(StrToInt(Confirma_CtoMarco.ComboDatos.Strings[n]));
                  QRLabel20.Caption := QRLabel20.Caption + 'Name: '  + trim(DatosPersona.Nombre)   + chr(13);
                  QRLabel20.Caption := QRLabel20.Caption + 'Title: ' + trim(DatosPersona.Puesto)   + chr(13);
                  QRLabel20.Caption := QRLabel20.Caption + 'Phone: ' + trim(DatosPersona.Telefono) + chr(13);
                  QRLabel20.Caption := QRLabel20.Caption + 'Email: ' + trim(DatosPersona.Email)    + chr(13) + chr(13);
               end;
               QRLabel21.Caption := '';
               for n:=0 to Operador_CtoMarco.ComboDatos.Count-1 do
               begin
                  DatosPersona      := ObtenerDatosPersona(StrToInt(Operador_CtoMarco.ComboDatos.Strings[n]));
                  QRLabel21.Caption := QRLabel21.Caption + 'Name: '  + trim(DatosPersona.Nombre)   + chr(13);
                  QRLabel21.Caption := QRLabel21.Caption + 'Title: ' + trim(DatosPersona.Puesto)   + chr(13);
                  QRLabel21.Caption := QRLabel21.Caption + 'Phone: ' + trim(DatosPersona.Telefono) + chr(13);
                  QRLabel21.Caption := QRLabel21.Caption + 'Email: ' + trim(DatosPersona.Email)    + chr(13) + chr(13);
               end;
               QRLabel22.Caption := '';
               for n:=0 to Autoriza_CtoMarco.ComboDatos.Count-1 do
               begin
                  DatosPersona      := ObtenerDatosPersona(StrToInt(Autoriza_CtoMarco.ComboDatos.Strings[n]));
                  QRLabel22.Caption := QRLabel22.Caption + 'Name: '  + trim(DatosPersona.Nombre)   + chr(13);
                  QRLabel22.Caption := QRLabel22.Caption + 'Title: ' + trim(DatosPersona.Puesto)   + chr(13);
                  QRLabel22.Caption := QRLabel22.Caption + 'Phone: ' + trim(DatosPersona.Telefono) + chr(13);
                  QRLabel22.Caption := QRLabel22.Caption + 'Email: ' + trim(DatosPersona.Email)    + chr(13) + chr(13);
               end;
               // Instrucciones de Pago
               // Parte A
               QRLabel183.Caption := '';
               QRLabel190.Caption := '';
               ObtenerCtasLiquidacion(Contrato.Titular.ID_Persona.AsInteger, QRLabel181, QRLabel182, QRLabel191, QRLabel192, QRLabel187, QRLabel189, QRLabel231);
               // Parte B
               QRLabel168.Caption := '';
               QRLabel174.Caption := '';
               ObtenerCtasLiquidacion(Contrato.Empresa.ID_Persona.AsInteger, QRLabel175, QRLabel167, QRLabel210, QRLabel245, QRLabel172, QRLabel177, QRLabel223);
                             
               RpGMSLA.Preview;
               RpGMSLA.Free;
            end;
         end;
      end;

   except
      on e: Exception do
         MessageDlg('Error al Imprimir el Contrato Marco para el Contrato ' + Contrato.Id_Contrato.asString + '.' + Chr(VK_RETURN) + e.Message, mtError, [MBOK], 0);
   end;
end;

Procedure TProemioICB.SetContrato(pContrato: TContrato);
//Var CveConcepto: String;
Begin
  FContrato:= pContrato;
  if (pContrato <> nil) and (pContrato.Active) Then
  Begin
    { Inicialización de los reportes que se imprimen por contrato }
    B_CGBinter.AsString:= 'V';
    B_ConvModif.AsString:= 'V';
    B_Proemio.AsString:= 'V';

    B_KYC.AsString:= 'V';
    If (Contrato.Producto.Cve_Per_Jur_Prod.AsString = 'PM') Then
      B_Mandato.AsString:= 'V'
    else B_Mandato.AsString:= 'F';

    { Información de Controles }
    If FContrato.Cve_Concep_Cto.AsString = cConceptoMenorEdad Then
      TextoTipoFirma.asString:= 'REPRESENTADO POR SUS PADRES'
    else TextoTipoFirma.asString:= 'DOS FIRMAS MINIMO';


{
    Id_Contrato.asString:= pContrato.fieldByName('ID_CONTRATO').asString;

    If pContrato.FieldExists('ID_ENTIDAD') Then
      Id_Entidad.asInteger:= pContrato.fieldByName('ID_ENTIDAD').asInteger;

    If pContrato.FieldExists('CVE_CONCEP_CTO') Then
      CveConcepto:= pContrato.fieldByName('CVE_CONCEP_CTO').asString
    else CveConcepto:= cConceptoGeneral;

    If CveConcepto = cConceptoMenorEdad Then
      TextoTipoFirma.asString:= 'REPRESENTADO POR SUS PADRES'
    else TextoTipoFirma.asString:= 'DOS FIRMAS MINIMO';
}
  end;

  //inicializaListaContratos;

  { Inicializa el Panel de Estado del Contrato }
  //panelEstado.setInetMast;
end;



Procedure TProemioICB.IniciaRepresentantesCliente(pCombo: TComboBox);
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


Procedure TProemioICB.IniciaContratosILine(pLista: TListView);
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
          //pCombo.Items.Add(qILine.FieldByName('Nombre').AsString);
          qILine.Next;
        end;
        //pLista.ItemIndex:= 0;
      end;
    end;
  Except
    Raise;
  end;
end;


Procedure TProemioICB.ImprimeConvenioModif(pPreview: Boolean);
var
   Rp    : TrpConv;
Begin
  Try
      ///////Execute_ProemioICB_PM(self, pPreview)
    MakeIntQRPreview;

    Rp := TrpConv.Create(Self);
    Rp.QryCtto.Active := False;
    Rp.QryCtto.DatabaseName := DataBaseName;
    Rp.QryCtto.SessionName  := SessionName;
    Rp.QryCtto.ParamByName('ID_CONTRATO').AsInteger := StrTOInt(Contrato.Id_Contrato.asString); //Objeto.CLAVE.AsInteger;  //100034462;
    Rp.QryCtto.Active := True;
    //Rp.detailRepresentanteICB.Items.Text:= UpperCase(Representantes.GetRepresentantes('', chr(VK_RETURN)));

    Rp.QRLabel41.Caption := UpperCase(Representantes.GetRepresentantes(' ', ' y/o' + chr(VK_RETURN)));
    Rp.QRLabel42.Caption := Rp.QryCtto.FieldByName('NOMBRE').AsString;
    //Rp.QRInterMemo7.Parametro.Strings[0]:= Rp.QryCtto.FieldByName('CORREO').AsString; //'wlopez@interacciones.com';
    Rp.Preview;
    Rp.Free;
  Except
    On e: Exception do
      MessageDlg('Error al Imprimir el Convenio Modificatorio del Contrato ' + Contrato.Id_Contrato.asString + '.' +
        Chr(VK_RETURN) + e.Message, mtError, [MBOK], 0);
  end;
end;

//De acuerdo al contrato identificar si es persona Física o Moral.
//En base a la personalidad jurídica, llamar TrpCGBPM o TrpCGBPF según el caso
Procedure TProemioICB.ImprimeCGBinter(pPreview: Boolean);
var
   RpPF                : TrpCGBPF;
   RpPM                : TrpCGBPM;
   vlSNombre           : String;
   vlSTipoCto          : String;
   vlSDescTipoCto      : String;
   vlsDiscrecionalidad : String;
Begin
  Try
    MakeIntQRPreview;
    If Contrato.Producto.Cve_Per_Jur_Prod.AsString = 'PM' Then
    begin
       RpPM := TrpCGBPM.Create(Self);
       RpPM.QryCtto.Active := False;
       RpPM.QryCtto.DatabaseName := DataBaseName;
       RpPM.QryCtto.SessionName  := SessionName;
       RpPM.QryCtto.ParamByName('ID_CONTRATO').AsInteger := StrToInt(Contrato.Id_Contrato.AsString);
       RpPM.QryCtto.Active := True;
       RpPM.QRLabel42.Caption := Contrato.TitNombre.AsString;

       // CZR 18-02-2010
       with RpPM.QRInterMemo2.Textos do
       begin
          Clear;
          Add ('@@0@ en mi carácter de representante legal de @@1@ quien es Titular del @@2@, celebrado con esa Institución, '
             + 'el cual se maneja de forma @@3@, les manifiesto lo siguiente: ');
          Add (' ');
          Add (' ');
          case Contrato.Id_Empresa.AsInteger of
             1: Add ('Que con fundamento en lo dispuesto por los articulos 102 y 103 de las Disposiciones de Carácter General aplicables a las Casas de Bolsa '
                   + '(Circular Única) emitidas por la Comisión Nacional Bancaria y de Valores, así como a lo pactado en el contrato de intermediación bursátil antes mencionado, '
                   + 'por medio del presente escrito otorgo a ustedes una instrucción expresa y genérica para que al amparo del mencionado contrato puedan operar '
                   + 'con valores del mercado de deuda emitidos por la sociedad controladora, entidades y empresas integrantes del mismo grupo financiero al que '
                   + 'pertenece esa Casa de Bolsa, asi como para realizar la asignación de valores de dichas operaciones cuando provengan de su posición propia.');
             2: Add ('Que de acuerdo a lo pactado en el contrato antes mencionado, por medio del presente escrito otorgo a ustedes una instrucción expresa y genérica para '
                   + 'que al amparo del mencionado contrato puedan operar con valores del mercado de deuda emitidos por la sociedad controladora, entidades y empresas '
                   + 'integrantes del mismo grupo financiero al que pertenece esa Institución Bancaria, así como para realizar la asignación de valores de dichas '
                   + 'operaciones cuando provengan de su posición propia.');
             else
                Add ('Que de acuerdo a lo pactado en el @@4@ antes mencionado, por medio del presente escrito otorgo a ustedes una instrucción expresa y genérica para '
                   + 'que el amparo del mencionado contrato puedan operar con valores del mercado de deuda emitidos por la sociedad controladora, entidades y empresas '
                   + 'integrantes del mismo grupo financiero al que pertenece esa institución.');
          end;
       end;

       RpPM.QRInterMemo2.Parametro.Strings[0]:= Cliente.AsString;
       RpPM.QRInterMemo2.Parametro.Strings[1]:= Contrato.TitNombre.AsString;
       //RpPM.QRInterMemo2.Parametro.Strings[2]:= Contrato.Id_Contrato.asString;
       //RpPM.QRFecha.Caption := FmtFecha(RpPM.QryCtto.FieldByName('FECHA').AsDateTime, '@DD-@MMM-@YYYY');
       RpPM.QRFecha.Caption := UpperCase(FmtFecha(RpPM.QryCtto.FieldByName('FECHA').AsDateTime, 'MÉxico, D.F. a @D de @MMMM de @YYYY'));

       //-------------------------
           GetSQLStr(' SELECT NOMBRE ' +
                     '   FROM PERSONA ' +
                     '  WHERE PERSONA.ID_PERSONA = ' + Contrato.Id_Empresa.AsString +
                     '  ',
                     DataBaseName,
                     SessionName,
                     'NOMBRE',
                     vlSNombre,
                     FALSE);
           IF vlSNombre <> '' THEN
             RpPM.QRLEmpresa.Caption := UpperCase(vlSNombre)
           ELSE
             RpPM.QRLEmpresa.Caption := UpperCase('INTERACCIONES, GRUPO FINANCIERO');
           GetSQLStr(' SELECT DESC_TIPO_CONTRA ' +
                     '   FROM CONTRATO A ' +
                     '   JOIN TIPO_CONTRATO b ON A.CVE_TIP_CONTRATO = b.CVE_TIP_CONTRATO ' +
                     '  WHERE A.ID_CONTRATO = ' + Contrato.Id_Contrato.AsString +
                     '  ',
                     DataBaseName,
                     SessionName,
                     'DESC_TIPO_CONTRA',
                     vlSDescTipoCto,
                     FALSE);

           vlSDescTipoCto:= 'contrato de ' + vlSDescTipoCto;

           RpPM.QRInterMemo2.Parametro.Strings[2]:= vlSDescTipoCto + ' No. ' + Contrato.Id_Contrato.asString;
           //RpPM.QRInterMemo2.Parametro.Strings[3]:= vlSDescTipoCto;

           {GetSQLStr(' SELECT DECODE(cve_discrecional,''DIS'', ''DISCRECIONAL'', ''NO DISCRECIONAL'') AS DISCRECIONAL ' +
                     '   FROM SB_CONTRATO ' +
                     '  WHERE ID_CONTRATO = ' + Contrato.Id_Contrato.AsString +
                     '  ',
                     DataBaseName,
                     SessionName,
                     'DISCRECIONAL',
                     vlsDiscrecionalidad,
                     FALSE);}
           RpPM.QRInterMemo2.Parametro.Strings[3]:= '____________________';
           RpPM.QRInterMemo2.Parametro.Strings[4]:= vlSDescTipoCto;

       //-------------------------
       RpPM.Preview;
       RpPM.Free;
    end
    else
    begin
       RpPF := TrpCGBPF.Create(Self);
       RpPF.QryCtto.Active := False;
       RpPF.QryCtto.DatabaseName := DataBaseName;
       RpPF.QryCtto.SessionName  := SessionName;
       RpPF.QryCtto.ParamByName('ID_CONTRATO').AsInteger := StrToInt(Contrato.Id_Contrato.asString);
       RpPF.QryCtto.Active := True;
       RpPF.QRLabel42.Caption := Contrato.TitNombre.AsString;

       // CZR 18-02-2010
       with RpPF.QRInterMemo2.Textos do
       begin
          Clear;
          Add ('@@0@ en mi carácter de Titular del @@1@, celebrado con esa Institución, el cual se maneja de forma @@2@, les manifiesto lo siguiente: ');
          Add (' ');
          Add (' ');
          case Contrato.Id_Empresa.AsInteger of
             1: Add ('Que con fundamento en lo dispuesto por los articulos 102 y 103 de las Disposiciones de Carácter General aplicables a las Casas de Bolsa '
                   + '(Circular Única) emitidas por la Comisión Nacional Bancaria y de Valores, así como a lo pactado en el contrato de intermediación bursátil antes mencionado, '
                   + 'por medio del presente escrito otorgo a ustedes una instrucción expresa y genérica para que al amparo del mencionado contrato puedan operar '
                   + 'con valores del mercado de deuda emitidos por la sociedad controladora, entidades y empresas integrantes del mismo grupo financiero al que '
                   + 'pertenece esa Casa de Bolsa, asi como para realizar la asignación de valores de dichas operaciones cuando provengan de su posición propia.');
             2: Add ('Que de acuerdo a lo pactado en el contrato antes mencionado, por medio del presente escrito otorgo a ustedes una instrucción expresa y genérica para '
                   + 'que al amparo del mencionado contrato puedan operar con valores del mercado de deuda emitidos por la sociedad controladora, entidades y empresas '
                   + 'integrantes del mismo grupo financiero al que pertenece esa Institución Bancaria, así como para realizar la asignación de valores de dichas '
                   + 'operaciones cuando provengan de su posición propia.');
             else
                Add ('Que de acuerdo a lo pactado en el @@3@ antes mencionado, por medio del presente escrito otorgo a ustedes una instrucción expresa y genérica para '
                   + 'que el amparo del mencionado contrato puedan operar con valores del mercado de deuda emitidos por la sociedad controladora, entidades y empresas '
                   + 'integrantes del mismo grupo financiero al que pertenece esa institución.');
          end;
       end;

       RpPF.QRInterMemo2.Parametro.Strings[0]:= Contrato.TitNombre.AsString;
       //RpPF.QRInterMemo2.Parametro.Strings[1]:= Contrato.Id_Contrato.asString;
       RpPF.QRFecha.Caption := UpperCase(FmtFecha(RpPF.QryCtto.FieldByName('FECHA').AsDateTime, 'MÉxico, D.F. a @D de @MMMM de @YYYY'));
       //-------------------------
           GetSQLStr(' SELECT NOMBRE ' +
                     '   FROM PERSONA ' +
                     '  WHERE PERSONA.ID_PERSONA = ' + Contrato.Id_Empresa.AsString +
                     '  ',
                     DataBaseName,
                     SessionName,
                     'NOMBRE',
                     vlSNombre,
                     FALSE);
           IF vlSNombre <> '' THEN
             RpPF.QRLEmpresa.Caption := UpperCase(vlSNombre)
           ELSE
             RpPF.QRLEmpresa.Caption := UpperCase('INTERACCIONES, GRUPO FINANCIERO');
           GetSQLStr(' SELECT DESC_TIPO_CONTRA ' +
                     '   FROM CONTRATO A ' +
                     '   JOIN TIPO_CONTRATO b ON A.CVE_TIP_CONTRATO = b.CVE_TIP_CONTRATO ' +
                     '  WHERE A.ID_CONTRATO = ' + Contrato.Id_Contrato.AsString +
                     '  ',
                     DataBaseName,
                     SessionName,
                     'DESC_TIPO_CONTRA',
                     vlSDescTipoCto,
                     FALSE);

           vlSDescTipoCto:= 'contrato de ' + vlSDescTipoCto;

           RpPF.QRInterMemo2.Parametro.Strings[1]:= vlSDescTipoCto + ' No. ' + Contrato.Id_Contrato.asString;
           //RpPF.QRInterMemo2.Parametro.Strings[2]:= vlSDescTipoCto;

           {GetSQLStr(' SELECT DECODE(cve_discrecional,''DIS'', ''DISCRECIONAL'', ''NO DISCRECIONAL'') AS DISCRECIONAL ' +
                     '   FROM SB_CONTRATO ' +
                     '  WHERE ID_CONTRATO = ' + Contrato.Id_Contrato.AsString +
                     '  ',
                     DataBaseName,
                     SessionName,
                     'DISCRECIONAL',
                     vlsDiscrecionalidad,
                     FALSE);}
           RpPF.QRInterMemo2.Parametro.Strings[2]:= '____________________';
           RpPF.QRInterMemo2.Parametro.Strings[3]:= vlSDescTipoCto;

       //-------------------------
       RpPF.Preview;
       RpPF.Free;
    end;

  Except
    On e: Exception do
      MessageDlg('Error al Imprimir la Carta Genérica Binter / ICB del Contrato ' + Contrato.Id_Contrato.asString + '.' +
        Chr(VK_RETURN) + e.Message, mtError, [MBOK], 0);
  end;
end;

Procedure TProemioICB.ImprimeDocumento(pDocumento : String; pPreview : Boolean);
var   // CZR 15-Abril-2010
   Reporte     : TrpDocumento;
   vInciso     : String;
   vNomEmpresa : String;
begin
   with Reporte do
      try
         MakeIntQRPreview;

         Reporte            := TrpDocumento.Create(Self);
         Query.Active       := False;
         Query.DatabaseName := DataBaseName;
         Query.SessionName  := SessionName;
         Query.Active       := True;
         QRFecha.Caption    := FmtFecha(Reporte.Query.FieldByName('FECHA').AsDateTime, 'MÉXICO, D.F. a @D de @MMMM de @YYYY');

         GetSQLStr('SELECT NOMBRE FROM PERSONA WHERE ID_PERSONA = ' + Contrato.Id_Empresa.AsString, DataBaseName, SessionName, 'NOMBRE', vNomEmpresa, false);
         if trim(vNomEmpresa) <> '' then
            QRLEmpresa.Caption := UpperCase(vNomEmpresa)
         else
            QRLEmpresa.Caption := UpperCase('INTERACCIONES, GRUPO FINANCIERO');

         with QRInterMemo2 do
         begin
            Textos.Clear;
            Textos.Add ('@@0@ por mi propio derecho y en mi carácter de Titular '
                      + '(o bien en mi carácter de representante legal del Titular) en el contrato de Intermediación '
                      + 'Bursátil No. @@1@ celebrado con esa Institución, les manifiesto que: ');
            Textos.Add (' ');
            Textos.Add (' ');

            Textos.Add ('En términos de lo establecido por el Articulo 61 y el anexo 13 de las "Disposiciones de Carácter '
                      + 'General Aplicables a las Casas de Bolsa" (Circular Única) emitidas por la Comisión Nacional '
                      + 'Bancaria y de Valores, es mi volutad ser considerado como Cliente Elegible para girar '
                      + 'Instrucciones a la Mesa, ya que cumplo con los supuestos previstos en dichas disposiciones y '
                      + 'en virtud de que esa Casa de Bolsa no tiene la totalidad de la custodia de mis valores, por medio de '
                      + 'la presente y BAJO PROTESTA DE DECIR VERDAD, manifiesto que: ');
            Textos.Add (' ');
            Textos.Add (' ');
            vInciso := 'a)';
            
            if trim(pDocumento) = 'D218' then
               Textos.Add (trim(vInciso) + ' He mantenido durante el último año en promedio inversiones en valores equivalentes'
                                         + ' en moneda nacional a por lo menos 20,000,000 (veinte millones) de Unidades de'
                                         + ' Inversión.')
            else
               Textos.Add (trim(vInciso) + ' He mantenido en promedio durante el último año inversiones en valores equivalentes en'
                                         + ' moneda nacional a por lo menos un millón quinientas mil unidades de inversión y/o he'
                                         + ' obtenido en cada uno de los dos últimos años, ingresos brutos anuales iguales o mayores al'
                                         + ' equivalente en moneda nacional a quinientas mil unidades de inversión.');
            Textos.Add (' ');
            Textos.Add (' ');
            vInciso := 'b)';

            if trim(pDocumento) = 'D219' then
            begin
               Textos.Add (trim(vInciso) + ' Autorizo a Interacciones Casa de Bolsa para que realice los cálculos que la Circular'
                                         + ' Única establece, relativos a la operación activa de mi cuenta para verificar el cumplimiento'
                                         + ' mínimo establecido durante los 12 meses previos de un millón doscientas cincuenta mil '
                                         + ' Unidades de Inversión.');
               Textos.Add (' ');
               Textos.Add (' ');
               vInciso := 'c)';
            end;

            Textos.Add (trim(vInciso) + ' Cuento con las herramientas y mecanismos informáticos o de cualquier otra naturaleza'
                                      + ' para dar seguimiento a las instrucciones que gire a esa Institución Bursátil de acuerdo al'
                                      + ' contrato antes referido.');
            Textos.Add (' ');
            Textos.Add (' ');
            if trim(vInciso) = 'c)' then   vInciso := 'd)'
            else                           vInciso := 'c)';

            Textos.Add (trim(vInciso) + ' Conozco la diferencia entre las instrucciones que se giran a Libro y a la Mesa, en el'
                                      + ' entendido que las primeras son aquellas que se giran para su transmisión inmediata a las'
                                      + ' Bolsas de Valores y no podrán ser administradas por la mesa de operación de esa Casa de'
                                      + ' Bolsa con independencia del medio a través del cual fueron instruidas y que las'
                                      + ' instrucciones a la Mesa son aquellas que tienen por objeto ser administradas por la Mesa'
                                      + ' de Operación de esa Casa de Bolsa a través de sus operadores de Bolsa.');
            Textos.Add (' ');
            Textos.Add (' ');
            if trim(vInciso) = 'd)' then   vInciso := 'e)'
            else                           vInciso := 'd)';

            Textos.Add (trim(vInciso) + ' Entiendo que los operadores de Bolsa de las Casas de Bolsa, son los encargados de'
                                      + ' administrar y ejecutar las ordenes derivadas de instrucciones giradas a la Mesa y estoy'
                                      + ' conciente de la transmisión y el orden de prelación para la ejecución de las ordenes que'
                                      + ' gire a la Mesa conforme a la fraccion II del Articulo 75 de la Circular Única, el cual señala'
                                      + ' que en caso de ordenes derivadas de instrucciones a la Mesa giradas por clientes deberán'
                                      + ' transmitirse como posturas por su totalidad o en fracciones durante la sesión Bursátil en que'
                                      + ' se reciba la instrucción, o bien durante la sesión bursátil del día hábil inmediato siguiente al'
                                      + ' de su recepción, cuando las instrucciones se reciban en horas o días inhábiles.');
            Textos.Add (' ');
            Textos.Add (' ');

            Textos.Add ('Cuando estas ordenes tengan identidad en el sentido de la operación, según sea compra o '
                      + 'venta, y en los valores a que estén referidas tendrán prelación entre sí, según su folio de '
                      + 'recepción en la Casa de Bolsa.');
            Textos.Add (' ');
            Textos.Add (' ');

            Textos.Add ('Manifestando que por el cumplimiento que se de a la presente comunicación desde este momento '
                      + 'relevamos a Interacciones Casa de Bolsa, S.A. de C.V. Grupo Financiero Interacciones de cualquier '
                      + 'responsabilidad de tipo civil, mercantil, fiscal y penal.');
            Textos.Add (' ');
            Textos.Add (' ');

            Textos.Add ('Atentamente.');
            Textos.Add (' ');
            Textos.Add (' ');
            Textos.Add (' ');
            Textos.Add ('____________________________________');
            Textos.Add (' ');
            Textos.Add ('@@2@');

            if Contrato.Producto.Cve_Per_Jur_Prod.AsString = 'PF' Then          Parametro.Strings[0] := Contrato.TitNombre.AsString
            else                                                                Parametro.Strings[0] := Cliente.AsString;
            Parametro.Strings[1]:= Contrato.ID_Contrato.AsString;
            if Contrato.Producto.Cve_Per_Jur_Prod.AsString = 'PF' Then          Parametro.Strings[2] := Contrato.TitNombre.AsString
            else                                                                Parametro.Strings[2] := Cliente.AsString;
         end;

         Preview;
         Free;
      except
         on e: exception do
            MessageDlg('Error al Imprimir el documento ' + trim(pDocumento) + ' del Contrato ' + Contrato.Id_Contrato.AsString + '.' + chr(VK_RETURN) + e.Message, mtError, [MBOK], 0);
      end;
end;

Procedure TProemioICB.ImprimeProemio(pPreview: Boolean);
Begin
  Try
    F_Firma.GetFromControl;   // CZR 31-Ago-09
    If Contrato.Producto.Cve_Per_Jur_Prod.AsString = 'PF' Then
      Execute_ProemioICB_PF(self, pPreview)
    Else If Contrato.Producto.Cve_Per_Jur_Prod.AsString = 'PM' Then
      Execute_ProemioICB_PM(self, pPreview)
    Else Raise EinterFrame.Create('No se ha identificado la Personalidad Jurídica del Contrato.');
  Except
    On e: Exception do
      MessageDlg('Error al Imprimir el Proemio para el Contrato ' + Contrato.Id_Contrato.asString + '.' +
        Chr(VK_RETURN) + e.Message, mtError, [MBOK], 0);
  end;
end;


Procedure TProemioICB.ImprimeKYC(pPreview: Boolean);
Var bActEmpresarial: String;
Begin
  Try
    If Contrato.Producto.Cve_Per_Jur_Prod.AsString = 'PM' Then
      Execute_AnexoKYC_PM(Self, Contrato.Id_Contrato.asInteger, pPreview)
    else
    Begin
      GetSQLStr('Select B_Activ_Empresa From Persona_Fisica ' +
                'Where Id_Persona = ' + Contrato.Id_Titular.asSql,
                DataBaseName, SessionName, 'B_ACTIV_EMPRESA', bActEmpresarial, False);
      If bActEmpresarial = 'V' Then
        Execute_AnexoKYC_PFEmp(Self, Contrato.Id_Contrato.asInteger, pPreview)
      else Execute_AnexoKYC_PF(Self, Contrato.Id_Contrato.asInteger, pPreview);
    end;
  Except
    On e: Exception do
      MessageDlg('Error al Imprimir la Información KYC.' + Chr(VK_RETURN) + e.Message,
         mtError, [MBOK], 0);
  end;
end;

Procedure TProemioICB.ImprimeConvenio(pPreview: Boolean);
Begin
  Try
      Execute_Convenio_OpInt(self, pPreview)
  Except
    On e: Exception do
      MessageDlg('Error al Imprimir el Convenio de Operaciones Internacionales para el Contrato ' + Contrato.Id_Contrato.asString + '.' +
        Chr(VK_RETURN) + e.Message, mtError, [MBOK], 0);
  end;
end;

Procedure TProemioICB.ImprimeCarta(pPreview: Boolean);
Begin
  Try
      Execute_Carta_InvCal(self, pPreview)
  Except
    On e: Exception do
      MessageDlg('Error al Imprimir Carta Inversionista Calificado para el Contrato ' + Contrato.Id_Contrato.asString + '.' +
        Chr(VK_RETURN) + e.Message, mtError, [MBOK], 0);
  end;
end;

(*
Function TProemioICB.PreparaRepresentantes: Boolean;
Var strSql: String;
    strFrom:  String;
    strWhere: String;
    qRepresentantes: TQuery;
Begin
  PreparaMotivos:= False;
  strSql:=
    ' SELECT Dr_Motivo.Cve_Motivo,' +
    '        Dr_Motivo.Desc_Motivo,' +
    '        Dr_Motivo.Cve_Gpo_Motivo';
  strFrom:= ' FROM Dr_Motivo';
  strWhere:= ' Dr_Motivo.Cve_Gpo_Motivo = ' + SQLStr(GetCveTipoMotivo(FTipoMot));

  If FCveOperacion = cCompra Then
    ADDSQL(strWhere, ' B_COMPRA = ' + SQLStr(cVerdadero))
  else If FCveOperacion = cVenta Then
    ADDSQL(strWhere, ' B_VENTA = ' + SQLStr(cVerdadero));

  If (FTipoMotOrigen = MotCancela) or (FTipoMotOrigen = MotCancelaCaja) Then
    ADDSQL(strWhere, ' B_CANCELA = ' + SQLStr(cVerdadero));

  If (FTipoMotOrigen <> MotNinguno) and (FIdOrden > 0) Then
  Begin
    If FMotivoCaja then
      strFrom:= strFrom +
        ',( SELECT Cve_Mot_Ref, Cve_Gpo_Mot_Ref' +
        '   FROM Dr_Motivo_Caja, Dr_Motivo_Ref' +
        '   WHERE Id_Movto = ' + IntToStr(FIdOrden) +
        '     AND Dr_Motivo_Caja.Cve_Gpo_Motivo = ' + SQLStr(GetCveTipoMotivo(FTipoMotOrigen)) +
        '     AND Dr_Motivo_Caja.Cve_Motivo = Dr_Motivo_Ref.Cve_Motivo' +
        '     AND Dr_Motivo_Caja.Cve_Gpo_Motivo = Dr_Motivo_Ref.Cve_Gpo_Motivo' +
        '   GROUP BY Cve_Mot_Ref, Cve_Gpo_Mot_Ref' +
        ' ) MotRef'
    else
      strFrom:= strFrom +
        ',( SELECT Cve_Mot_Ref, Cve_Gpo_Mot_Ref' +
        '   FROM Dr_Motivo_Orden, Dr_Motivo_Ref' +
        '   WHERE Id_Orden = ' + IntToStr(FIdOrden) +
        '     AND Dr_Motivo_Orden.Cve_Gpo_Motivo = ' + SQLStr(GetCveTipoMotivo(FTipoMotOrigen)) +
        '     AND Dr_Motivo_Orden.Cve_Motivo = Dr_Motivo_Ref.Cve_Motivo' +
        '     AND Dr_Motivo_Orden.Cve_Gpo_Motivo = Dr_Motivo_Ref.Cve_Gpo_Motivo' +
        '   GROUP BY Cve_Mot_Ref, Cve_Gpo_Mot_Ref' +
        ' ) MotRef';

    ADDSQL(strWhere, 'Dr_Motivo.Cve_Motivo = MotRef.Cve_Mot_Ref');
    ADDSQL(strWhere, 'Dr_Motivo.Cve_Gpo_Motivo = MotRef.Cve_Gpo_Mot_Ref');
  end;

  strSql:= strSql + ' ' + strFrom;
  If strWhere <> '' Then strSql:= strSql + ' WHERE ' + strWhere;

  qRepresentantes:= GetSQLQuery(strSql, DataBaseName, SessionName, False);
  If (qRepresentantes <> nil) and (Not qRepresentantes.IsEmpty) and (FListMotivos <> nil) Then
  Begin
    While Not qRepresentantes.Eof do
      With FListMotivos.Items.Add do
      Begin
{Sample
        ListItem := Items.Add;
        ListItem.Caption := Names[I][0];
        ListItem.SubItems.Add(Names[I][1]);
}
        Caption:= qRepresentantes.FieldByName('DESC_MOTIVO').AsString;
        SubItems.Add(qRepresentantes.FieldByName('CVE_MOTIVO').AsString);
        SubItems.Add(qRepresentantes.FieldByName('CVE_GPO_MOTIVO').AsString);
        qRepresentantes.Next;
      end;

    PreparaMotivos:= True
  end
  else MessageDlg('No existe información para ser desplegada', mtInformation, [mbOK], 0);
end;


Function TProemioICB.ValidaMotivos: Boolean;
Var intIndex: Integer;
    intNumMotivos: Integer;
Begin
  ValidaMotivos:= False;
  intNumMotivos:= 0;

  If FListMotivos <> nil Then
    Try
      Motivos:= nil;
      For intIndex:= 0 to FListMotivos.Items.Count - 1 do
      Begin
        If FListMotivos.Items[intIndex].Checked Then
        Begin
          ValidaMotivos:= True;
          intNumMotivos:= intNumMotivos + 1;
          SetLength(Motivos, intNumMotivos);
          Motivos[intNumMotivos - 1].CveGpoMotivo:= FListMotivos.Items[intIndex].SubItems.Strings[1];
          Motivos[intNumMotivos - 1].CveMotivo:= FListMotivos.Items[intIndex].SubItems.Strings[0];
          Motivos[intNumMotivos - 1].DescMotivo:= FListMotivos.Items[intIndex].Caption;
        end;
      end;
    Except
      ValidaMotivos:= False;
      Motivos:= nil;
    end;
End;
*)

{*******************************************************************************
  FORMA DE Impresión del Proemio de Intermediación Bursátil
*******************************************************************************}
procedure TWProemioICB.FormShow(Sender: TObject);
begin
  With Objeto do
  Begin

    Contrato.Id_Contrato.Control:= lblContrato;
    B_CGBinter.Control:= ckCGBinter;
    B_ConvModif.Control:= ckConvenio;
    B_Proemio.Control:= chkProemio;

    B_KYC.Control:= chkKYC;
    B_Mandato.Control:= chkMandato;
    B_Convenio.Control:= chkConvenio;
    B_Carta.Control:= chkCarta;

    // CZR 15-Abr-2010
    B_D218.Control := ckD218;
    B_D219.Control := ckD219;

    // CZR 31-Ago-2009
    F_Firma.Control    := eFecFirma;
    F_Firma.AsDateTime := Apli.DameFechaEmpresaDia('D000');

    B_PerTra.Control      := ckPerTra;      // CZR 29-Nov-2010
    B_AfoSiefores.Control := ckAfoSiefores; // CZR 08-Abr-2011

    // CZR 30-Mayo-2011
    B_CtoMarco.Control          := ckCtoMarco;
    Formato_CtoMarco.Control    := rgFormatoCtoMarco;
    Confirma_CtoMarco.Control   := cbConfirmaCtoMarco;
    Autoriza_CtoMarco.Control   := cbAutorizaCtoMarco;
    Operador_CtoMarco.Control   := cbOperadorCtoMarco;

    Cliente.Control:= cbCliente;
    TextoPiePagina.Control:= edPiePagina;
    TextoTipoFirma.Control:= edTipoFirma;

    Representantes.ListRepresenta:= lvRepresentantes;


    { Inicialización de Representantes del Grupo Financiero }
    Representantes.InicializaRepresentantes(cTipoProemio, Contrato.Id_Entidad.asInteger);

    { Inicialización de Representantes del Cliente }
    IniciaRepresentantesCliente(cbCliente);

    { Inicialización de los contratos que tienen acceso via Internét }
    IniciaContratosILine(lvContratosILine);

    cbCliente.Enabled:= Contrato.Producto.Cve_Per_Jur_Prod.AsString = 'PM';
  end;
end;

procedure TWProemioICB.InterForma1DespuesShow(Sender: TObject);
begin
  { Inicializa controles }
  chkMandato.Visible     := (Objeto.Contrato.Producto.Cve_Per_Jur_Prod.AsString = 'PM');
  TabCtoMarco.TabVisible := False; // CZR 30-Mayo-2011
//-----------------------------------------------------------------------------
  if GetSQL('SELECT CVE_OPER_ACC FROM SECU_OPER_ACC WHERE (CVE_FUNCION=''CLASE_TCONTRATO'') AND (CVE_USUARIO='''+objeto.DameUsuario+''') and (CVE_OPER_ACC=''IC'')',
     objeto.SeguDataBaseName,objeto.SeguSessionName,True)  THEN
  BEGIN
    ImprimirDocto         := TRUE;
    chkProemio.Visible    := TRUE;
    chkKYC.Visible        := TRUE;
    chkMandato.Visible    := TRUE;
    chkConvenio.Visible   := TRUE;
    chkCarta.Visible      := TRUE;
    ckD218.Visible        := TRUE; // CZR 15-Abr-2010
    ckD219.Visible        := TRUE; // CZR 15-Abr-2010
    ckPerTra.Visible      := TRUE; // CZR 29-Nov-2010
    ckAfoSiefores.Visible := TRUE; // CZR 08-Abr-2011
    ckCtoMarco.Visible    := TRUE; // CZR 30-Mayo-2011
  END
  ELSE
  BEGIN
    ImprimirDocto         := FALSE;
    chkProemio.Visible    := FALSE;
    chkKYC.Visible        := FALSE;
    chkMandato.Visible    := FALSE;
    chkConvenio.Visible   := FALSE;
    chkCarta.Visible      := FALSE;

    chkProemio.Enabled    := FALSE;
    chkKYC.Enabled        := FALSE;
    chkMandato.Enabled    := FALSE;
    chkConvenio.Enabled   := FALSE;
    chkCarta.Enabled      := FALSE;
    ckD218.Visible        := FALSE; // CZR 15-Abr-2010
    ckD219.Visible        := FALSE; // CZR 15-Abr-2010
    ckPerTra.Visible      := FALSE; // CZR 29-Nov-2010
    ckAfoSiefores.Visible := FALSE; // CZR 08-Abr-2011
    ckCtoMarco.Visible    := FALSE; // CZR 27-Mayo-2011

    objeto.B_ConvModif.AsString   := 'F';
    objeto.B_CGBinter.AsString    := 'F';
    objeto.B_Proemio.AsString     := 'F';
    objeto.B_KYC.AsString         := 'F';
    objeto.B_Mandato.AsString     := 'F';
    objeto.B_Convenio.AsString    := 'F';
    objeto.B_Carta.AsString       := 'F';
    objeto.B_D218.AsString        := 'F'; // CZR 15-Abr-2010
    objeto.B_D219.AsString        := 'F'; // CZR 15-Abr-2010
    objeto.B_PerTra.AsString      := 'F'; // CZR 29-Nov-2010
    objeto.B_AfoSiefores.AsString := 'F'; // CZR 08-Abr-2011
    objeto.B_CtoMarco.AsString    := 'F'; // CZR 27-Mayo-2011
  END;

  // CZR 31/08/2009   Validar si cuenta el usuario con permiso de cambiar la fecha de firma de contrato.
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
    ckConvenio.Visible  := TRUE;
  END
  ELSE
  BEGIN
    ckConvenio.Visible  := FALSE;
    chkProemio.Enabled  := FALSE;
    chkKYC.Enabled      := FALSE;
    chkMandato.Enabled  := FALSE;
    chkConvenio.Enabled := FALSE;
    chkCarta.Enabled    := FALSE;

    objeto.B_CGBinter.AsString  := 'F';
    objeto.B_ConvModif.AsString := 'F';
    objeto.B_Proemio.AsString   := 'F';
    objeto.B_KYC.AsString       := 'F';
    objeto.B_Mandato.AsString   := 'F';
    objeto.B_Convenio.AsString  := 'F';
    objeto.B_Carta.AsString     := 'F';

  END;
//-----------------------------------------------------------------------------
end;          

procedure TWProemioICB.FormDestroy(Sender: TObject);
begin
   with Objeto do
   begin
      Contrato.Id_Contrato.Control  := nil;
      B_CGBinter.Control            := nil;
      B_ConvModif.Control           := nil;
      B_Proemio.Control             := nil;
      B_KYC.Control                 := nil;
      B_Mandato.Control             := nil;
      B_Convenio.Control            := nil;
      B_Carta.Control               := nil;
      B_D218.Control                := nil; // CZR 15-Abr-2010
      B_D219.Control                := nil; // CZR 15-Abr-2010
      F_Firma.Control               := nil; // CZR 31-Ago-2009
      B_PerTra.Control              := nil; // CZR 29-Nov-2010
      B_AfoSiefores.Control         := nil; // CZR 08-Abr-2011
      // --> CZR 30-mayo-2011
      B_CtoMarco.Control            := nil;
      Formato_CtoMarco.Control      := nil;
      Confirma_CtoMarco.Control     := nil;
      Autoriza_CtoMarco.Control     := nil;
      Operador_CtoMarco.Control     := nil;
      // <--
      Cliente.Control               := nil;
      TextoPiePagina.Control        := nil;
      TextoTipoFirma.Control        := nil;

      Representantes.ListRepresenta := nil;
   end;
end;

procedure TWProemioICB.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TWProemioICB.InterForma1Preview(Sender: TObject);
begin
   Objeto.Impresion;
end;

procedure TWProemioICB.InterForma1Imprimir(Sender: TObject);
begin
   Objeto.Impresion(False);
end;

// CZR 03-jun-2011   Limpia valor de opciones de reporte GMSLA de Cto Marco
procedure TWProemioICB.LimpiaValorOpcRpGMSLA;
begin
   with OpcRpGMSLACtoMarco do
   begin
      Tasa        := '0.00';
      AgtProcesos := '';
      Opcion1     := '';
      Opcion2     := '';
      Opcion3     := '';
      Opcion4     := '';
      Opcion5     := '';
      Opcion6     := '';
      Opcion7     := '';
      Opcion8     := '';
      Opcion9     := '';
      Opcion10    := '';
      Opcion11    := '';
      Opcion12    := '';
      Opcion13    := '';
      Opcion14    := '';
   end;
end;

// CZR 30-mayo-2011
procedure TWProemioICB.ckCtoMarcoClick(Sender: TObject);
begin
   Objeto.B_CtoMarco.GetFromControl;
   if trim(Objeto.B_CtoMarco.AsString) = 'V' then
   begin
      TabCtoMarco.TabVisible       := True;
      pcOpciones.ActivePage        := TabCtoMarco;
      rgFormatoCtoMarco.ItemIndex  := 0;
      cbConfirmaCtoMarco.ItemIndex := 0;
      cbAutorizaCtoMarco.ItemIndex := 0;
      cbOperadorCtoMarco.ItemIndex := 0;
      LimpiaValorOpcRpGMSLA;
   end
   else
      TabCtoMarco.TabVisible := False;
end;

// CZR 03-jun-2011   Opciones de reporte GMSLA de Cto Marco
procedure TWProemioICB.btnOpcRpGMSLAClick(Sender: TObject);
var
   OpcRpGMSLA : TOpRpGMSLA;
begin   
   OpcRpGMSLA := TOpRpGMSLA.Create(self);
   with OpcRpGMSLA do
      try
         GetParams(objeto);
         Proemio  := Objeto;
         Catalogo;
      finally
         Free;
      end;
end;
procedure TWProemioICB.BtnImprimeClausuladoClick(Sender: TObject);
//Wlopez
//Marzo de 2013
//Lee PDF guardado en BD y lo visualiza para su consulta y/o impresión
  function EjecutarYEsperar( sPrograma: String; Visibilidad: Integer ): Integer;
  var  sAplicacion: array[0..512] of char;
    DirectorioActual: array[0..255] of char;
    DirectorioTrabajo: String;
    InformacionInicial: TStartupInfo;
    InformacionProceso: TProcessInformation;
    iResultado, iCodigoSalida: DWord;
  begin
    StrPCopy( sAplicacion, sPrograma );
    GetDir( 0, DirectorioTrabajo );
    StrPCopy( DirectorioActual, DirectorioTrabajo );
    FillChar( InformacionInicial, Sizeof( InformacionInicial ), #0 );
    InformacionInicial.cb := Sizeof( InformacionInicial );
    InformacionInicial.dwFlags := STARTF_USESHOWWINDOW;
    InformacionInicial.wShowWindow := Visibilidad;
    CreateProcess( nil, sAplicacion, nil, nil, False,CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS,                 nil, nil, InformacionInicial, InformacionProceso );

    repeat    iCodigoSalida := WaitForSingleObject( InformacionProceso.hProcess, 1000 );
      Application.ProcessMessages;
    until ( iCodigoSalida <> WAIT_TIMEOUT );

    GetExitCodeProcess( InformacionProceso.hProcess, iResultado );
    MessageBeep( 0 );
    CloseHandle( InformacionProceso.hProcess );
    Result := iResultado;
  end;

var
   vSecuencia : Integer;
   nomArchivo : String;
   qry : TQuery;
   vlVersion : Integer;
begin
   vSecuencia := 1;
   vlVersion :=1;
   //nomArchivo := '2011081.pdf';
   nomArchivo := '';
   qry := TQuery.Create(nil);
   qry.DatabaseName := objeto.DataBaseName;
   qry.SessionName  := objeto.SessionName;
   qry.sql.Add('select * from BIT_ARCHIVO where ID_ARCHIVO = ' + quotedstr('CLAUCT') + ' AND VERSION_ARCHIVO = (select max(VERSION_ARCHIVO) from BIT_ARCHIVO where ID_ARCHIVO = ' + quotedstr('CLAUCT') + ')');

   qry.Open;
   if qry <> nil then
   begin
      qry.First;
      while not qry.Eof do
      begin
         nomArchivo := qry.FieldByName('NOMBRE_ANT').AsString;
         vlVersion  := qry.FieldByName('VERSION_ARCHIVO').AsInteger;
         qry.Next;
      end;
      qry.Close;
   end;
   if EjecutarYEsperar('java -jar O:\delphipr\Corp\DownloadFile.jar ' + IntTOStr(vlVersion), SW_HIDE ) <> 0 then
      ShowMessage('Archivo no puede ser abierto ')
   else

   if (nomArchivo <> '') then
   begin
      ShellExecute(0,'open',PChar('c:\temp\'+nomArchivo),nil,nil,1);
   end;

end;

end.
