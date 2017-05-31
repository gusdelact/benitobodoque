//------------------------------------------------------------------------------
// Función    : Catálogo de Escritura (Contratantes)
// Desarrollo : Victor Martinez Castro
// Modifico   : Cesar Zamora Ramirez
// Fecha      : 08 de Abril de 1998
//------------------------------------------------------------------------------
Unit InTEsc2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntFind,
  UnSQL2, InterFun, ComCtrls, IntDtPk, IntNota, IntPob, Menus, InterEdit;

Type
  TEscritura = Class;
  TWEsc = Class(TForm)
    InterForma1 : TInterForma;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    lbInscripcion: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lbFEscritura: TLabel;
    edTX_INSCRIPCION: TMemo;
    edF_ESCRITURA: TEdit;
    dtpF_ESCRITURA: TInterDateTimePicker;
    edLIBRO: TEdit;
    edVOLUMEN: TEdit;
    edPARTIDA: TEdit;
    edTOMO: TEdit;
    edFOJAS: TEdit;
    lbF_ALTA: TLabel;
    edF_ALTA: TEdit;
    dtpF_ALTA: TInterDateTimePicker;
    GroupBox1: TGroupBox;
    lbCiudadDelMun: TLabel;
    lbPais: TLabel;
    lbEstado: TLabel;
    sbBuscaAprox: TSpeedButton;
    edCiudad: TEdit;
    edEstado: TEdit;
    edPais: TEdit;
    GroupBox3: TGroupBox;
    lbIdPersNotario: TLabel;
    SpeedButton1: TSpeedButton;
    lbCalleNumero: TLabel;
    edID_PERS_NOTARIO: TMaskEdit;
    edNombre: TEdit;
    edNUM_ESC_PUBLICA: TEdit;
    PopupPoblacion: TPopupMenu;
    Catlogo1: TMenuItem;
    edNUM_NOTARIA: TInterEdit;
    lObservaciones: TLabel;
    mObservaciones: TMemo;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure sbBuscaAproxClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Catlogo1Click(Sender: TObject);
    procedure edCiudadMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edEstadoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edPaisMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edTX_INSCRIPCIONKeyPress(Sender: TObject; var Key: Char);
    procedure edTX_INSCRIPCIONKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edTX_INSCRIPCIONKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    private
      { Private declarations }
    	FEditPoblacion : TEdit;
    public
      { Public declarations }
      Objeto : TEscritura;
  end;

  TEscritura= class(TInterFrame)
    private
      { Private declarations }
    protected
      { Protected declarations }
    public
      { Public declarations }
      ID_PERS_NOTARIO : TInterCampo;
      NUM_ESC_PUBLICA : TInterCampo;
      CVE_POBLACION   : TInterCampo;
      F_ESCRITURA     : TInterCampo;
      F_ALTA          : TInterCampo;
      FOJAS           : TInterCampo;
      LIBRO           : TInterCampo;
      NUM_NOTARIA     : TInterCampo;
      PARTIDA         : TInterCampo;
      TOMO            : TInterCampo;
      VOLUMEN         : TInterCampo;
      TX_INSCRIPCION  : TInterCampo;
      NOMBRE          : TInterCampo;
      OBSERVACIONES   : TInterCampo; // CZR 27-nov-4014

      Ciudad          : TInterCampo; {InterCampos para el Stored Procedure de Población}
      Estado          : TInterCampo;
      Pais            : TInterCampo;
      CveCiudad       : TInterCampo;
      CveEstado       : TInterCampo;
      CvePais         : TInterCampo;
      CodigoRespuesta : TInterCampo;

      Notario         : TNotario;
      Poblacion       : TPoblacion;
      
      constructor Create(AOwner : TComponent); override;
      destructor  destroy; override;
      function    InternalBusca : Boolean; override;
      function    InternalLocaliza : Boolean; override;
      procedure   DataBaseChange; override;
      function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    published
      { Published declarations }
    end;
implementation
{$R *.DFM}

constructor TEscritura.Create( AOwner : TComponent );
begin
   Inherited;

   ID_PERS_NOTARIO         := CreaCampo('ID_PERS_NOTARIO', ftFloat,   tsNinguno, tsNinguno, True);
   ID_PERS_NOTARIO.Caption := 'Número de Persona Notario ';
   NUM_ESC_PUBLICA         := CreaCampo('NUM_ESC_PUBLICA', ftFloat,   tsNinguno, tsNinguno, True);
   NUM_ESC_PUBLICA.Caption := 'Número Esc Publica ';
   CVE_POBLACION           := CreaCampo('CVE_POBLACION',   ftString,  tsNinguno, tsNinguno, True);
   CVE_POBLACION.Caption   := 'Clave de Poblacion ';
   F_ESCRITURA             := CreaCampo('F_ESCRITURA',     ftDate,    tsNinguno, tsNinguno, True);
   F_ESCRITURA.Caption     := 'Fecha Escritura ';
   F_ALTA                  := CreaCampo('F_ALTA',          ftDate,    tsNinguno, tsNinguno, True);
   F_ALTA.Caption          := 'Fecha Alta ';
   FOJAS                   := CreaCampo('FOJAS',           ftString,  tsNinguno, tsNinguno, True);
   FOJAS.Caption           := 'Fojas ';
   LIBRO                   := CreaCampo('LIBRO',           ftString,  tsNinguno, tsNinguno, True);
   LIBRO.Caption           := 'Libro ';
   NUM_NOTARIA             := CreaCampo('NUM_NOTARIA',     ftFloat,   tsNinguno, tsNinguno, True);
   NUM_NOTARIA.Caption     := 'Número Notaria ';
   PARTIDA                 := CreaCampo('PARTIDA',         ftString,  tsNinguno, tsNinguno, True);
   PARTIDA.Caption         := 'Partida ';
   TOMO                    := CreaCampo('TOMO',            ftString,  tsNinguno, tsNinguno, True);
   TOMO.Caption            := 'Tomo ';
   VOLUMEN                 := CreaCampo('VOLUMEN',         ftString,  tsNinguno, tsNinguno, True);
   VOLUMEN.Caption         := 'Volumen ';
   TX_INSCRIPCION          := CreaCampo('TX_INSCRIPCION',  ftString,  tsNinguno, tsNinguno, True);
   TX_INSCRIPCION.Caption  := 'Inscripcion ';
   OBSERVACIONES           := CreaCampo('OBSERVACIONES',   ftString,  tsNinguno, tsNinguno, True); // CZR 27-nov-4014
   OBSERVACIONES.Caption   := 'Observaciones';

   CveCiudad 	         	:= CreaCampo('CVE_CIUDAD',      ftString,  tsProc1,   tsNinguno, False); {InterCampos para el Stored Procedure de Población}
   CveEstado 		         := CreaCampo('CVE_ESTADO',      ftString,  tsNinguno, tsProc1,   False);
   CvePais  		         := CreaCampo('CVE_PAIS',        ftString,  tsNinguno, tsProc1,   False);
   Ciudad 			         := CreaCampo('CIUDAD',          ftString,  tsNinguno, tsProc1,   False);
   Estado 			         := CreaCampo('ESTADO',          ftString,  tsNinguno, tsProc1,   False);
   Pais 				         := CreaCampo('PAIS',            ftString,  tsNinguno, tsProc1,   False);
   CodigoRespuesta         := CreaCampo('CODRESP',         ftInteger, tsNinguno, tsProc1,   False);

   Notario := TNotario.Create(Self);
   Notario.MasterSource := Self;
   Notario.Id_Pers_Notario.MasterField := 'ID_PERS_NOTARIO';
   NOMBRE := Notario.Nombre;

   Poblacion := TPoblacion.Create(self);

   TableName := 'ESCRITURA';
   FKeyFields.Add('ID_PERS_NOTARIO');
   FKeyFields.Add('NUM_ESC_PUBLICA');
   
   UseQuery        := True;
   ShowMenuReporte := True;
   IsCorp          := True;
end;

destructor TEscritura.Destroy;
begin
   if Notario   <> nil then Notario.Free;
   if Poblacion <> nil then Poblacion.Free;
   inherited;
end;

function TEscritura.InternalBusca:Boolean;
var
   T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IntEsc.it','S,S,S,I,D,S,S,S,S,S,S');
   try
      if Active then
      begin
         T.Param(0,ID_PERS_NOTARIO.AsString);
         T.Param(1,NUM_ESC_PUBLICA.AsString);
      end;
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
   finally
      T.Free;
   end;
end;

function TEscritura.InternalLocaliza : Boolean;
begin
	CveCiudad.AsString :=  CVE_POBLACION.asString;
   StpEjecuta(StpPrepara('STPCOPOBLACION',tsProc1),tsProc1);
   if CodigoRespuesta.AsInteger <> 0 then
   begin
   	Ciudad.AsString    := '';
      Estado.AsString    := '';
      Pais.AsString      := '';
      CveCiudad.AsString := '';
      CveEstado.AsString := '';
      CvePais.AsString   := '';
   end;
end;

procedure TEscritura.DataBaseChange;
begin
	inherited;
	Poblacion.GetParams(self);
end;

function TEscritura.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TWEsc;
begin
   W := TWEsc.Create(Self);
   try
      W.Objeto                    := Self;
      W.InterForma1.InterFrame    := Self;
      W.InterForma1.FormaTipo     := FormaTipo;
      W.InterForma1.ShowBtnAyuda  := False;
      W.InterForma1.ShowGrid      := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion       := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

procedure TWEsc.FormShow(Sender: TObject);
begin
   with Objeto do
   begin
      ID_PERS_NOTARIO.Control := edID_PERS_NOTARIO;
      NUM_ESC_PUBLICA.Control := edNUM_ESC_PUBLICA;
      F_ESCRITURA.Control     := edF_ESCRITURA;
      F_ALTA.Control          := edF_ALTA;
      FOJAS.Control           := edFOJAS;
      LIBRO.Control           := edLIBRO;
      NUM_NOTARIA.Control     := edNUM_NOTARIA;
      PARTIDA.Control         := edPARTIDA;
      TOMO.Control            := edTOMO;
      VOLUMEN.Control         := edVOLUMEN;
      TX_INSCRIPCION.Control  := edTX_INSCRIPCION;
      OBSERVACIONES.Control   := mObservaciones; // CZR 27-nov-2014
      Ciudad.Control          := edCiudad;
      Estado.Control          := edEstado;
      Pais.Control            := edPais;
      Notario.Nombre.Control  := edNombre;
   end;
end;

procedure TWEsc.FormDestroy(Sender: TObject);
begin
   with Objeto do
   begin
      ID_PERS_NOTARIO.Control := nil;
      NUM_ESC_PUBLICA.Control := nil;
      F_ESCRITURA.Control     := nil;
      F_ALTA.Control          := nil;
      FOJAS.Control           := nil;
      LIBRO.Control           := nil;
      NUM_NOTARIA.Control     := nil;
      PARTIDA.Control         := nil;
      TOMO.Control            := nil;
      VOLUMEN.Control         := nil;
      TX_INSCRIPCION.Control  := nil;
      OBSERVACIONES.Control   := nil; // CZR 27-nov-2014
      Ciudad.Control          := nil;
      Estado.Control          := nil;
      Pais.Control            := nil;
      Notario.Nombre.Control  := nil;
   end;
end;

procedure TWEsc.sbBuscaAproxClick(Sender: TObject);
var
   InterFindit1 : TInterFindit;
begin
   InterFindit1 := Objeto.CreaBuscador('Ciudad.it', 'S,S,S,S,S,S');
   try
      InterFindit1.Param(0, Objeto.CveCiudad.AsString);
      InterFindit1.Param(2, Objeto.CveEstado.AsString);
      InterFindit1.Param(4, Objeto.CvePais.AsString);
      if InterFindIt1.Execute then
      begin
         Objeto.CveCiudad.AsString     := InterFindIt1.DameCampo(0);
         Objeto.Cve_Poblacion.AsString := InterFindIt1.DameCampo(0);
         Objeto.CveEstado.AsString     := InterFindit1.DameCampo(2);
         Objeto.CvePais.AsString       := InterFindit1.DameCampo(4);
         Objeto.Ciudad.AsString        := InterFindit1.DameCampo(1);
         Objeto.Estado.AsString        := InterFindit1.DameCampo(3);
         Objeto.Pais.AsString          := InterFindit1.DameCampo(5);
      end;
   finally
      InterFindit1.Free;
   end;
end;

procedure TWEsc.SpeedButton1Click(Sender: TObject);
begin
   Objeto.Notario.Busca;
end;

procedure TWEsc.Catlogo1Click(Sender: TObject);
begin
   Objeto.Poblacion.BuscaWhereString := '';     
   if FEditPoblacion = edCiudad then
   begin
      Objeto.Poblacion.BuscaWhereString := 'POBLACION.CVE_TIPO_POBLAC = ''CD''';
      Objeto.Poblacion.FindKey([Objeto.CveCiudad.AsString]);
   end
   else if FEditPoblacion = edEstado then
   begin
      Objeto.Poblacion.BuscaWhereString := 'POBLACION.CVE_TIPO_POBLAC = ''ES''';
      Objeto.Poblacion.FindKey([Objeto.CveEstado.AsString]);
   end
   else if FEditPoblacion = edPais then
   begin
      Objeto.Poblacion.BuscaWhereString := 'POBLACION.CVE_TIPO_POBLAC = ''PA''';
      Objeto.Poblacion.FindKey([Objeto.CvePais.AsString]);
   end;
	Objeto.Poblacion.Catalogo;
end;

procedure TWEsc.edCiudadMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   FEditPoblacion := edCiudad;
end;

procedure TWEsc.edEstadoMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   FEditPoblacion := edEstado;
end;

procedure TWEsc.edPaisMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   FEditPoblacion := edPais;
end;

procedure TWEsc.edTX_INSCRIPCIONKeyPress(Sender: TObject; var Key: Char);
begin
   // CZR 27-nov-2014   Por peticion del area de PLD se limita la captura a 40 caracteres. En la informacion historica se respeta la longitud del dato.
   if length(edTX_INSCRIPCION.Text) >= 40 then
      Key := #0;
end;

procedure TWEsc.edTX_INSCRIPCIONKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   // CZR 27-nov-2014   Por peticion del area de PLD se limita la captura a 40 caracteres. En la informacion historica se respeta la longitud del dato.
   if length(edTX_INSCRIPCION.Text) >= 40 then
      edTX_INSCRIPCION.Text := copy(edTX_INSCRIPCION.Text, 1, 40);
end;

procedure TWEsc.edTX_INSCRIPCIONKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   // CZR 27-nov-2014   Por peticion del area de PLD se limita la captura a 40 caracteres. En la informacion historica se respeta la longitud del dato.
   if length(edTX_INSCRIPCION.Text) >= 40 then
      edTX_INSCRIPCION.Text := copy(edTX_INSCRIPCION.Text, 1, 40);
end;

procedure TWEsc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;
end.


