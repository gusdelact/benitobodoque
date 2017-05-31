//------------------------------------------------------------------------------
// Función    : Catálogo de Escritura (Punto de Menu)
// Desarrollo : Victor Martinez, Alberto Ramirez, Julio Ruiloba
// Modifico   : Cesar Zamora Ramirez
// Fecha      : 13 de Diciembre de 1997
//------------------------------------------------------------------------------
unit IntEsc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntFind,
  IntPob, InterFun, ComCtrls, UnSQL2, Menus, IntNota;

type
  TEscritura = Class;
  TWEscritura = Class(TForm)
    InterForma1 : TInterForma;
    PopupNotario : TPopupMenu;
    Catlogo1 : TMenuItem;
    GroupBox2: TGroupBox;
    lbFojas: TLabel;
    lbPartida: TLabel;
    lbInscripcion: TLabel;
    lbLibro: TLabel;
    lbTomo: TLabel;
    Label2: TLabel;
    lbVolumen: TLabel;
    lbFEscritura: TLabel;
    edFojas: TEdit;
    edPartida: TEdit;
    edLibro: TEdit;
    edTomo: TEdit;
    edVolumen: TEdit;
    edNumNotaria: TEdit;
    edTxInscripcion: TMemo;
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
    edIdPersNotario: TMaskEdit;
    edNombre: TEdit;
    edNumEscPublica: TEdit;
    edFEscritura: TEdit;
    DateTimePicker1: TDateTimePicker;
    mObservaciones: TMemo;
    lObservaciones: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure sbBuscaAproxClick(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender : TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Catlogo1Click(Sender : TObject);
    procedure DateTimePicker1Enter(Sender : TObject);
    procedure DateTimePicker1CloseUp(Sender : TObject);
    procedure InterForma1DespuesModificar(Sender : TObject);
    procedure edTxInscripcionKeyPress(Sender: TObject; var Key: Char);
    procedure edTxInscripcionKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edTxInscripcionKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    Escritura : TEscritura;
    procedure CiudadMenuEjecuta(Sender : Tobject; Tag : Integer);
    procedure EstadoMenuEjecuta(Sender : Tobject; Tag : Integer);
    procedure PaisMenuEjecuta(Sender : Tobject; Tag : Integer);
  end;

  TEscritura = class(TInterFrame)
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    Id_Pers_Notario : TInterCampo;
    Num_Esc_Publica : TInterCampo;
    Cve_Poblacion   : TInterCampo;
    F_Escritura     : TInterCampo;
    F_Alta          : TInterCampo;
    Fojas           : TInterCampo;
    Libro           : TInterCampo;
    Num_Notaria     : TInterCampo;
    Partida         : TInterCampo;
    Tomo            : TInterCampo;
    Volumen         : TInterCampo;
    Tx_Inscripcion  : TInterCampo;
    Ciudad          : TInterCampo;
    Estado          : TInterCampo;
    Pais            : TInterCampo;
    CveCiudad       : TInterCampo;
    CveEstado       : TInterCampo;
    CvePais         : TInterCampo;
    CodigoRespuesta : TInterCampo;
    Nombre          : TInterCampo;
    Observaciones   : TInterCampo; // CZR 27-nov-4014
    PobCd           : TPoblacion;
    PobEdo          : TPoblacion;
    PobPais         : TPoblacion;
    Notario 		      : TNotario;
    function    RefrescaPoblacion : Boolean;
    function    InternalLocaliza : Boolean; override;
    function    Elimina : Boolean; override;
    function    InternalBusca : Boolean; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    constructor Create(AOwner : TComponent); override;
    destructor  Destroy; override;
    procedure   DataBaseChange; override;
  published
    { Published declarations }
  end;      
implementation
{$R *.DFM}

constructor TEscritura.Create( AOwner : TComponent );
begin
   Inherited;

   Id_Pers_Notario := CreaCampo('ID_PERS_NOTARIO', ftInteger, tsNinguno, tsNinguno, True);
   Num_Esc_Publica := CreaCampo('NUM_ESC_PUBLICA', ftInteger, tsNinguno, tsNinguno, True);
   Cve_Poblacion   := CreaCampo('CVE_POBLACION',   ftString,  tsNinguno, tsNinguno, True);
   F_Escritura     := CreaCampo('F_ESCRITURA',     ftDate,    tsNinguno, tsNinguno, True);
   Fojas           := CreaCampo('FOJAS',           ftString,  tsNinguno, tsNinguno, True);
   Libro           := CreaCampo('LIBRO',           ftString,  tsNinguno, tsNinguno, True);
   Num_Notaria     := CreaCampo('NUM_NOTARIA',     ftInteger, tsNinguno, tsNinguno, True);
   Partida         := CreaCampo('PARTIDA',         ftString,  tsNinguno, tsNinguno, True);
   Tomo            := CreaCampo('TOMO',            ftString,  tsNinguno, tsNinguno, True);
   Volumen         := CreaCampo('VOLUMEN',         ftString,  tsNinguno, tsNinguno, True);
   Tx_Inscripcion  := CreaCampo('TX_INSCRIPCION',  ftString,  tsNinguno, tsNinguno, True);
   F_Alta          := CreaCampo('F_ALTA',          ftDate,    tsNinguno, tsNinguno, True);
   Observaciones   := CreaCampo('OBSERVACIONES',   ftString,  tsNinguno, tsNinguno, True); // CZR 27-nov-4014

   Ciudad          := CreaCampo('CIUDAD',          ftString,  tsNinguno,                  tsConsulta+tsProc1,                              False);
   Estado          := CreaCampo('ESTADO',          ftString,  tsNinguno,                  tsConsulta+tsProc1,                              False);
   Pais            := CreaCampo('PAIS',            ftString,  tsNinguno,                  tsConsulta+tsProc1,                              False);
   CveCiudad       := CreaCampo('CVE_CIUDAD',      ftString,  tsModifica+tsNuevo+tsProc1, tsConsulta,                                      False);
   CveEstado       := CreaCampo('CVE_ESTADO',      ftString,  tsModifica+tsNuevo,         tsConsulta+tsProc1,                              False);
   CvePais         := CreaCampo('CVE_PAIS',        ftString,  tsModifica+tsNuevo,         tsConsulta+tsProc1,                              False);
   CodigoRespuesta := CreaCampo('CODRESP',         ftInteger, tsNinguno,                  tsConsulta+tsNuevo+tsModifica+tsElimina+tsProc1, False);
   Nombre          := CreaCampo('NOMBRE',          ftString,  tsNinguno,                  tsNinguno,                                       False);

   Cve_Poblacion.Size := 6;
   CveCiudad.Size     := 6;
   Fojas.Size         := 8;
   Libro.Size         := 20;
   Partida.Size       := 6;
   Tomo.Size          := 8;
   Volumen.Size       := 8;

   PobCd   := TPoblacion.Create(Self);
   PobEdo  := TPoblacion.Create(Self);
   PobPais := TPoblacion.Create(Self);

   Notario := TNotario.Create(self);
   Notario.MasterSource := Self;
   Notario.Id_Pers_Notario.MasterField := 'ID_PERS_NOTARIO';      

   TableName := 'ESCRITURA';
   FKeyFields.Add('ID_PERS_NOTARIO');
   FKeyFields.Add('NUM_ESC_PUBLICA');

   FActive   := False;
   UseQuery  := True;
   IsCorp := True;
end;

destructor TEscritura.Destroy;
begin
   if PobCD   <> nil then PobCD.Free;
   if PobEdo  <> nil then PobEdo.Free;
   if PobPais <> nil then PobPais.Free;
   if Notario <> nil then Notario.Free;
   inherited;
end;


procedure TEscritura.DataBaseChange;
begin
   PobCD.GetParams(Self);
   PobEdo.GetParams(Self);
   PobPais.GetParams(Self);
end;


function TEscritura.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TWEscritura;
begin
   W := TWEscritura.Create(Self);
   try
      W.Escritura                 := Self;
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

function TEscritura.RefrescaPoblacion : Boolean;
begin
   RefrescaPoblacion := False;
   StpEjecuta(StpPrepara('STPCOPOBLACION',tsProc1), tsProc1);
   if CodigoRespuesta.AsInteger = 0 then
      RefrescaPoblacion := True
   else
   begin
      Ciudad.AsString    := '';
      Estado.AsString    := '';
      Pais.AsString      := '';
      CveCiudad.AsString := '';
      CveEstado.AsString := '';
      CvePais.AsString   := '';
   end;
end;

function TEscritura.InternalLocaliza: Boolean;
var
   Str1 : String;
begin
   InternalLocaliza := False;
   CveCiudad.AsString := Self.Cve_Poblacion.AsString;
   GetSQLStr('SELECT NOMBRE FROM PERSONA WHERE (ID_PERSONA='+Id_Pers_Notario.AsString+')', DataBaseName, SessionName, 'NOMBRE', Str1, False);
   Nombre.AsString  := Str1;
   RefrescaPoblacion;
   InternalLocaliza := True;
end;       

function TEscritura.Elimina : Boolean;
begin
   raise EInterFrame.Create('No se puede Eliminar una Escritura');
end;

function TEscritura.InternalBusca : Boolean;
var
   T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IntEsc.it', 'S,S,S,I,D,S,S,S,S,S,S');
   try
      if Active then
      begin
         T.Param(0,Id_Pers_Notario.AsString);
         T.Param(1,Num_Esc_Publica.AsString);
      end;
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1)]);
   finally
      T.Free;
   end;
end;

procedure TWEscritura.FormShow(Sender : TObject);
begin
   with Escritura do
   begin
      edCiudad.PopupMenu              := PobCd.PopMenu;
      edEstado.PopupMenu              := PobEdo.PopMenu;
      edPais.PopupMenu                := PobPais.PopMenu;
      PobCd.OnMenuEjecuta             := CiudadMenuEjecuta;
      PobEdo.OnMenuEjecuta            := EstadoMenuEjecuta;
      PobPais.OnMenuEjecuta           := PaisMenuEjecuta;
      Id_Pers_Notario.Control         := edIdPersNotario;
      Num_Esc_Publica.Control         := edNumEscPublica;
      Ciudad.Control                  := edCiudad;
      Estado.Control                  := edEstado;
      Pais.Control                    := edPais;
      F_Escritura.Control             := edFEscritura;
      Fojas.Control                   := edFojas;
      Libro.Control                   := edLibro;
      Num_Notaria.Control             := edNumNotaria;
      Partida.Control                 := edPartida;
      Tomo.Control                    := edTomo;
      Volumen.Control                 := edVolumen;
      Tx_Inscripcion.Control          := edTxInscripcion;
      Nombre.Control                  := edNombre;
      Observaciones.Control           := mObservaciones; // CZR 27-nov-2014
      Notario.MasterSourceEditControl := SpeedButton1;
   end;
end;

procedure TWEscritura.FormDestroy(Sender : TObject);
begin
   with Escritura do
   begin
      Id_Pers_Notario.Control         := nil;
      Num_Esc_Publica.Control         := nil;
      Ciudad.Control                  := nil;
      Estado.Control                  := nil;
      Pais.Control                    := nil;
      F_Escritura.Control             := nil;
      Fojas.Control                   := nil;
      Libro.Control                   := nil;
      Num_Notaria.Control             := nil;
      Partida.Control                 := nil;
      Tomo.Control                    := nil;
      Volumen.Control                 := nil;
      Tx_Inscripcion.Control          := nil;
      Nombre.Control                  := nil;
      Observaciones.Control           := nil; // CZR 27-nov-2014
      Notario.MasterSourceEditControl := nil;
   end;
end;  

procedure TWEscritura.CiudadMenuEjecuta(Sender : Tobject; Tag : Integer);
begin
   Case Tag of
      0 :
      begin
         if trim(Escritura.CveCiudad.AsString) <> '' then
            Escritura.PobCd.FindKey([Escritura.CveCiudad.AsString]);
         Escritura.PobCd.Catalogo;
         Escritura.RefrescaPoblacion;
      end;
      else
         Escritura.PobCd.MenuEjecuta(Tag);
   end;
end;

procedure TWEscritura.EstadoMenuEjecuta(Sender : Tobject; Tag : Integer);
begin
   Case Tag of
      0 :
      begin
         if trim(Escritura.CveEstado.AsString) <> '' then
            Escritura.PobEdo.FindKey([Escritura.CveEstado.AsString]);
         Escritura.PobEdo.Catalogo;
         Escritura.RefrescaPoblacion;
      end;
      else
         Escritura.PobEdo.MenuEjecuta(Tag);
   end;
end;

procedure TWEscritura.PaisMenuEjecuta(Sender : Tobject; Tag : Integer);
begin
   Case Tag of
      0 :
      begin
         if trim(Escritura.CvePais.AsString) <> '' then
            Escritura.PobPais.FindKey([Escritura.CvePais.AsString]);
         Escritura.PobPais.Catalogo;
         Escritura.RefrescaPoblacion;
      end;
      else
         Escritura.PobPais.MenuEjecuta(Tag);
   end;
end;

procedure TWEscritura.sbBuscaAproxClick(Sender: TObject);
var
   InterFindit1 : TInterFindit;
begin
   InterFindit1 := Escritura.CreaBuscador('Ciudad.it', 'S,S,S,S,S,S');
   try
      InterFindit1.Param(0,Escritura.CveCiudad.AsString);
      InterFindit1.Param(2,Escritura.CveEstado.AsString);
      InterFindit1.Param(4,Escritura.CvePais.AsString);
      if InterFindIt1.Execute then
      begin
         Escritura.CveCiudad.AsString     := InterFindIt1.DameCampo(0);
         Escritura.Cve_Poblacion.AsString := InterFindIt1.DameCampo(0);
         Escritura.CveEstado.AsString     := InterFindit1.DameCampo(2);
         Escritura.CvePais.AsString       := InterFindit1.DameCampo(4);
         Escritura.Ciudad.AsString        := InterFindit1.DameCampo(1);
         Escritura.Estado.AsString        := InterFindit1.DameCampo(3);
         Escritura.Pais.AsString          := InterFindit1.DameCampo(5);
      end;
   finally
      InterFindit1.Free;
   end;
end;

procedure TWEscritura.InterForma1DespuesNuevo(Sender : TObject);
begin
   edNumEscPublica.SetFocus;
end;

procedure TWEscritura.InterForma1DespuesModificar(Sender: TObject);
begin
   edNumNotaria.SetFocus;
end;

procedure TWEscritura.SpeedButton1Click(Sender: TObject);
var
   FindIt : TInterFindit;
begin
   FindIt := Escritura.CreaBuscador('IntNota.it', 'I,S,S,S');
   try
      if trim(edIdPersNotario.Text) <> '' then
         FindIt.Param(0,edIdPersNotario.Text);
      if FindIt.Execute then
      begin
         edIdPersNotario.Text := FindIt.DameCampo(0);
         edNombre.Text := FindIt.DameCampo(1) + ' ' + FindIt.DameCampo(2) + ' ' + FindIt.DameCampo(3);
      end;
   finally
      FindIt.Free;
   end;
end;

procedure TWEscritura.Catlogo1Click(Sender: TObject);
begin
   Escritura.Notario.Catalogo;
end;

procedure TWEscritura.DateTimePicker1Enter(Sender: TObject);
begin
   try
      DateTimePicker1.Date := StrToDate(edFEscritura.Text);
   except
      DateTimePicker1.Date := Now;
   end;
end;

procedure TWEscritura.DateTimePicker1CloseUp(Sender: TObject);
begin
   edFEscritura.Text := FormatDateTime('DD/MM/YYYY', DateTimePicker1.Date);
end;

procedure TWEscritura.edTxInscripcionKeyPress(Sender: TObject;  var Key: Char);
begin
   // CZR 27-nov-2014   Por peticion del area de PLD se limita la captura a 40 caracteres. En la informacion historica se respeta la longitud del dato. 
   if length(edTxInscripcion.Text) >= 40 then
      Key := #0;
end;

procedure TWEscritura.edTxInscripcionKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   // CZR 27-nov-2014   Por peticion del area de PLD se limita la captura a 40 caracteres. En la informacion historica se respeta la longitud del dato.
   if length(edTxInscripcion.Text) >= 40 then
      edTxInscripcion.Text := copy(edTxInscripcion.Text, 1, 40);
end;

procedure TWEscritura.edTxInscripcionKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   // CZR 27-nov-2014   Por peticion del area de PLD se limita la captura a 40 caracteres. En la informacion historica se respeta la longitud del dato.
   if length(edTxInscripcion.Text) >= 40 then
      edTxInscripcion.Text := copy(edTxInscripcion.Text, 1, 40);
end;        

procedure TWEscritura.FormClose(Sender : TObject; var Action : TCloseAction);
begin
   Action := caFree;
end;
end.
