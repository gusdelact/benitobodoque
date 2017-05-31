// Sistema         : Clase de CR_CAL_ACRED
// Fecha de Inicio : 24/05/2005
// Función forma   : Clase de CR_CAL_ACRED
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrCalAcre;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Grids, Aligrid, InterEdit,
IntLinkit, InterApl,

IntGenCre,
IntSICC,
IntParamCre,
IntCrAcredit,  // Acreditados
IntCrReCaAc,   // Relación Calificadora - Acreditado
IntCrCalCali,  // Catálogo Calificaciones de Calificadoras
IntCrCalific,  // Catálogo de Calificadoras
IntCrTRiesgo,  // Catálogo Tipo de Riesgo
IntCrCaArDe,   // Administración Archivos de Calificación
IntXls
;


Type

   // --
   // Clase para armar el clon de las calificaciones por acreditado
   TAcrClon = class(TObject)
   private
    FID_CALIFICADORA  : String;
    FCVE_TIPO_RIESGO  : String;
    FNOM_ARCHIVO      : String;
    FDESC_TIPO_ENTIDAD: String;
    FNOM_ACRED_CALIF  : String;
    FCVE_CALIFICACION : String;
    FTX_CALIFICACION  : String;
    FF_CALIFICACION   : String;
    FH_CALIFICACION   : String;

    procedure setCVE_CALIFICACION(const Value: String);
    procedure setCVE_TIPO_RIESGO(const Value: String);
    procedure setDESC_TIPO_ENTIDAD(const Value: String);
    procedure setID_CALIFICADORA(const Value: String);
    procedure setNOM_ACRED_CALIF(const Value: String);
    procedure setNOM_ARCHIVO(const Value: String);
    procedure setTX_CALIFICACION(const Value: String);
    procedure setF_CALIFICACION(const Value: String);
    procedure setH_CALIFICACION(const Value: String);

   protected
   public

      property ID_CALIFICADORA  : String write setID_CALIFICADORA;
      property CVE_TIPO_RIESGO  : String write setCVE_TIPO_RIESGO;
      property NOM_ARCHIVO      : String write setNOM_ARCHIVO;
      property DESC_TIPO_ENTIDAD: String write setDESC_TIPO_ENTIDAD;
      property NOM_ACRED_CALIF  : String write setNOM_ACRED_CALIF;
      property CVE_CALIFICACION : String write setCVE_CALIFICACION;
      property TX_CALIFICACION  : String write setTX_CALIFICACION;
      property F_CALIFICACION   : String write setF_CALIFICACION;
      property H_CALIFICACION   : String write setH_CALIFICACION;

   end;

 TCrCalAcre= class;

  TWCrCalAcred=Class(TForm)
    pgAltaDatos: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    btCarga: TBitBtn;
    MErrores: TMemo;
    InterForma1: TInterForma;
    lbID_CAL_ACRED: TLabel;
    edID_CAL_ACRED: TEdit;
    lbID_ACREDITADO: TLabel;
    edID_ACREDITADO: TEdit;
    lbID_CALIFICADORA: TLabel;
    edID_CALIFICADORA: TEdit;
    lbCVE_TIPO_RIESGO: TLabel;
    edCVE_TIPO_RIESGO: TEdit;
    lbFH_CALIFICACION: TLabel;
    dtpFH_CALIFICACION: TInterDateTimePicker;
    edFH_CALIFICACION: TEdit;
    lbCalificacion: TLabel;
    edCVE_CALIFICACION: TEdit;
    lbF_ALTA: TLabel;
    lbF_MODIFICA: TLabel;
    LBCVE_USU_ALTA: TLabel;
    lbCVE_USU_MODIFICA: TLabel;
    edF_MODIFICA: TEdit;
    edF_ALTA: TEdit;
    edCVE_USU_MODIFICA: TEdit;
    edCVE_USU_ALTA: TEdit;
    rgSIT_CAL_ACRED: TRadioGroup;
    lbCVE_CALIFICACION: TLabel;
    btID_ACREDITADO: TBitBtn;
    edNOM_ACREDITADO: TEdit;
    btID_CALIFICADORA: TBitBtn;
    edNOM_CALIFICADORA: TEdit;
    btCVE_CALIFICACION: TBitBtn;
    MsgPanel: TPanel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    lbCVE_GRADO_RIESGO: TLabel;
    edNUM_NIVEL: TEdit;
    edNUM_PUNTOS_DIST: TInterEdit;
    lbNUM_PUNTOS_DIST: TLabel;
    ilID_ACREDITADO: TInterLinkit;
    ilID_CALIFICADORA: TInterLinkit;
    edFileName: TEdit;
    Label1: TLabel;
    Button1: TButton;
    cbB_BREAK_ON_ERROR: TCheckBox;
    Label15: TLabel;
    ProgressBar: TProgressBar;
    lblCounter: TLabel;
    OpenDialog1: TOpenDialog;
    edNOM_ACRED_CALIF: TEdit;
    lbNOM_ACRED_CALIF: TLabel;
    lbCVE_TIPO_RIESGO1: TLabel;
    edCVE_TIPO_RIESGO1: TEdit;
    btCVE_TIPO_RIESGO1: TBitBtn;
    edDESC_TIPO_RIESGO1: TEdit;
    ilCVE_TIPO_RIESGO1: TInterLinkit;
    rgCVE_ENTIDAD: TRadioGroup;
    btAdminArch: TButton;
    rgCVE_ENTIDAD1: TRadioGroup;
    Query1: TQuery;
    lbInstrucciones: TLabel;
    lbLink1: TLabel;
    lbLink2: TLabel;
    edTXT_COMENTARIO: TMemo;
    lbTXT_COMENTARIO: TLabel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure ilID_ACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure btID_ACREDITADOClick(Sender: TObject);
    procedure btID_CALIFICADORAClick(Sender: TObject);
    procedure btCVE_CALIFICACIONClick(Sender: TObject);
    procedure ilID_ACREDITADOEjecuta(Sender: TObject);
    procedure ilID_CALIFICADORAEjecuta(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1AntesNuevo(Sender: TObject;
      var Realizado: Boolean);
    procedure edID_ACREDITADOExit(Sender: TObject);
    procedure edID_CALIFICADORAExit(Sender: TObject);
    procedure btCVE_CALIFICACIONExit(Sender: TObject);
    procedure edFH_CALIFICACIONExit(Sender: TObject);
    procedure rgSIT_CAL_ACREDExit(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure btCargaClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ilCVE_TIPO_RIESGO1Ejecuta(Sender: TObject);
    procedure btCVE_TIPO_RIESGO1Click(Sender: TObject);
    procedure btAdminArchClick(Sender: TObject);
    procedure lbLink1Click(Sender: TObject);
    procedure lbLink2Click(Sender: TObject);
    procedure edTXT_COMENTARIOExit(Sender: TObject);
    procedure InterForma1AntesModificar(Sender: TObject;
      var Realizado: Boolean);
    procedure FormCreate(Sender: TObject);
    private
    { Private declarations }
     function StpAltaCabeceraArchCal( peID_CALIFICADORA     : Integer;
                                      peCVE_TIPO_RIESGO     ,
                                      peNOM_ARCHIVO         : String;
                                      peFH_CALIFICACION     : TDateTime;
                                      peB_COMMIT            : String;
                                      psID_CAL_AR_CABEC     : Integer;
                                      psRESULTADO           : Integer;
                                      psTX_RESULTADO        : String;
                                      pebMuestraError       : Boolean
                                    ) : Boolean;

     function ActCveCalificacion( peID_CAL_AR_CABEC : Integer;
                                  peB_COMMIT        : String;
                                  var psRESULTADO       : Integer;
                                  var psTX_RESULTADO    : String;
                                  pebMuestraError       : Boolean
                                ) : Boolean;

     procedure ObtenIdCalificadoras(var psID_FITCH, psID_MOODYS, psID_STANDARD : Integer;
                                    var psNOM_FITCH, psNOM_MOODYS, psNOM_STANDARD : String);

     function  obtEntidad : Smallint;
     procedure obtCalificacionAnt;
     procedure actualizaHistorico;
     procedure insertaHistorico;
    public
    { Public declarations }
    Objeto   : TCrCalAcre;
    AcrClon  : TAcrClon;
    vpOriFH_CALIFICACION     : String; //SASG4921    28/04/2014

 end;

 TCrCalAcre= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ParamCre  : TParamCre;
        ID_CAL_ACRED             : TInterCampo;
        ID_ACREDITADO            : TInterCampo;
        ID_CALIFICADORA          : TInterCampo;
        CVE_TIPO_RIESGO          : TInterCampo;
        F_CALIFICACION           : TInterCampo;
        FH_CALIFICACION          : TInterCampo;
        CVE_CALIFICACION         : TInterCampo;
        SIT_CAL_ACRED            : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_ENTIDAD              : TInterCampo;
        CVE_ENTIDAD1             : TInterCampo;
        {ARR RIRA4381}
        TXT_COMENTARIO           : TInterCampo;

        Acreditado    : TCrAcredit;  // Acreditados
        Calif_x_Acred : TCrReCaAc;   // Calificadora por Acreditado
        Calificacion  : TCrCalCali;  // Calificaciones de Calificadoras
        TipoRiesgo1   : TCrTRiesgo;  // Tipo de Riesgo

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    MuestraUltCalifRealizada(peID_ACREDITADO : Integer; peCVE_TIPO_RIESGO :  String) : String;
      published
      end;




implementation
//Uses RepMon;

{$R *.DFM}


{ TAcrClon }

procedure TAcrClon.setCVE_CALIFICACION(const Value: String);
begin
  FCVE_CALIFICACION := Value;
end;

procedure TAcrClon.setCVE_TIPO_RIESGO(const Value: String);
begin
  FCVE_TIPO_RIESGO := Value;
end;

procedure TAcrClon.setDESC_TIPO_ENTIDAD(const Value: String);
begin
  FDESC_TIPO_ENTIDAD := Value;
end;

procedure TAcrClon.setF_CALIFICACION(const Value: String);
begin
  FF_CALIFICACION := Value;
end;

procedure TAcrClon.setH_CALIFICACION(const Value: String);
begin
  FH_CALIFICACION := Value;
end;

procedure TAcrClon.setID_CALIFICADORA(const Value: String);
begin
 FID_CALIFICADORA := Value;
end;

procedure TAcrClon.setNOM_ACRED_CALIF(const Value: String);
begin
  FNOM_ACRED_CALIF := Value;
end;

procedure TAcrClon.setNOM_ARCHIVO(const Value: String);
begin
  FNOM_ARCHIVO := Value;
end;

procedure TAcrClon.setTX_CALIFICACION(const Value: String);
begin
  FTX_CALIFICACION := Value;
end;



///------------------------------------------------------
///------------------------------------------------------
constructor TCrCalAcre.Create( AOwner : TComponent );
begin Inherited;
      ID_CAL_ACRED :=CreaCampo('ID_CAL_ACRED',ftFloat,tsNinguno,tsNinguno,True);
                ID_CAL_ACRED.Caption:='Número de Cal Acred';
      ID_ACREDITADO :=CreaCampo('ID_ACREDITADO',ftFloat,tsNinguno,tsNinguno,True);
                ID_ACREDITADO.Caption:='Número de Acreditado';
      ID_CALIFICADORA :=CreaCampo('ID_CALIFICADORA',ftFloat,tsNinguno,tsNinguno,True);
                ID_CALIFICADORA.Caption:='Número de Calificadora';
      CVE_TIPO_RIESGO :=CreaCampo('CVE_TIPO_RIESGO',ftString,tsNinguno,tsNinguno,True);
                CVE_TIPO_RIESGO.Caption:='Clave de Cal Riesgo';
      F_CALIFICACION :=CreaCampo('F_CALIFICACION',ftDate,tsNinguno,tsNinguno,True);
                F_CALIFICACION.Caption:='Fecha Calificacion';
      FH_CALIFICACION :=CreaCampo('FH_CALIFICACION',ftDateTime,tsNinguno,tsNinguno,True);
                FH_CALIFICACION.Caption:='Fecha y Hora Calificacion';
      CVE_CALIFICACION :=CreaCampo('CVE_CALIFICACION',ftString,tsNinguno,tsNinguno,True);
                CVE_CALIFICACION.Caption:='Clave de Calificacion';
      SIT_CAL_ACRED :=CreaCampo('SIT_CAL_ACRED',ftString,tsNinguno,tsNinguno,True);
                SIT_CAL_ACRED.Caption:='Situación Cal Acred';
      CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_ALTA.Caption:='Clave de Usu Alta';
      F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
                F_ALTA.Caption:='Fecha Alta';
      CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';

      TXT_COMENTARIO :=CreaCampo('TXT_COMENTARIO',ftString,tsNinguno,tsNinguno,True);
                TXT_COMENTARIO.Caption:='Comentario de la Calificacion';

      F_MODIFICA :=CreaCampo('F_MODIFICA',ftDate,tsNinguno,tsNinguno,True);
                F_MODIFICA.Caption:='Fecha Modifica';
      FKeyFields.Add('ID_CAL_ACRED');
      FKeyFields.Add('ID_ACREDITADO');
      FKeyFields.Add('ID_CALIFICADORA');
      FKeyFields.Add('CVE_TIPO_RIESGO');
      FKeyFields.Add('F_CALIFICACION');

      With SIT_CAL_ACRED do
        Begin
        Size:=2;
        UseCombo:=True;
        ComboLista.Add('0'); ComboDatos.Add(CSIT_AC);
        ComboLista.Add('1'); ComboDatos.Add(CSIT_CA);
        End;

      CVE_ENTIDAD :=CreaCampo('CVE_ENTIDAD',ftString,tsNinguno,tsNinguno,False);
      With CVE_ENTIDAD do
        Begin
        Size:=2;
        UseCombo:=True;
        ComboLista.Add('0'); ComboDatos.Add(CESTADO);
        ComboLista.Add('1'); ComboDatos.Add(CMUNICIPIO);
        ComboLista.Add('2'); ComboDatos.Add(CGOBIERNO_DESC);
        End;


      CVE_ENTIDAD1 :=CreaCampo('CVE_ENTIDAD1',ftString,tsNinguno,tsNinguno,False);
      With CVE_ENTIDAD1 do
        Begin
        Size:=2;
        UseCombo:=True;
        ComboLista.Add('0'); ComboDatos.Add(CESTADO);
        ComboLista.Add('1'); ComboDatos.Add(CMUNICIPIO);
        ComboLista.Add('2'); ComboDatos.Add(CGOBIERNO_DESC);
        End;

      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource:=Self;
      Acreditado.FieldByName('ID_ACREDITADO').MasterField:='ID_ACREDITADO';
      Acreditado.ShowAll := True;

      Calif_x_Acred := TCrReCaAc.Create(Self);
      Calif_x_Acred.MasterSource:=Self;
      Calif_x_Acred.FieldByName('ID_ACREDITADO').MasterField:='ID_ACREDITADO';
      Calif_x_Acred.FieldByName('ID_CALIFICADORA').MasterField:='ID_CALIFICADORA';
      Calif_x_Acred.ShowAll := True;

      Calificacion := TCrCalCali.Create(Self);
      Calificacion.MasterSource:=Self;
      Calificacion.FieldByName('ID_CALIFICADORA').MasterField:='ID_CALIFICADORA';
      Calificacion.ShowAll := True;

      TipoRiesgo1 := TCrTRiesgo.Create(Self);
      TipoRiesgo1.MasterSource:=Self;
      TipoRiesgo1.ShowAll := True;

      TableName := 'CR_CAL_ACRED';
      UseQuery := True; 
      HelpFile := 'IntCrCalAcre.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrCalAcre.Destroy;
begin
  If Assigned(Acreditado) Then Acreditado.Free;
  If Assigned(Calif_x_Acred) Then Calif_x_Acred.Free;
  If Assigned(Calificacion) Then Calificacion.Free;
  If Assigned(TipoRiesgo1) Then TipoRiesgo1.Free;
 inherited;
end;


function TCrCalAcre.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrCalAcred;
begin
   W:=TWCrCalAcred.Create(Self);
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

Function TCrCalAcre.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrCalA.it','F,F,F,S,D');
      Try if Active then begin T.Param(0,ID_CAL_ACRED.AsString); 
                               T.Param(1,ID_ACREDITADO.AsString); 
                               T.Param(2,ID_CALIFICADORA.AsString); 
                               T.Param(3,CVE_TIPO_RIESGO.AsString);
                               T.Param(4,F_CALIFICACION.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2),T.DameCampo(3),T.DameCampo(4)]);
      finally  T.Free;
      end;
end;

function TCrCalAcre.MuestraUltCalifRealizada(peID_ACREDITADO : Integer; peCVE_TIPO_RIESGO :  String) : String;
var vlQry : TQuery;
begin
 vlQry := GetSQLQuery(' SELECT ULTIMA_CALIF_REALIZADA.*'+coCRLF+
                      ' FROM  ('+coCRLF+
                      '         SELECT CCA.*'+coCRLF+
                      '         FROM CR_CAL_ACRED CCA,'+coCRLF+
                      '              ( SELECT TEMP.*'+coCRLF+
                      '                FROM ( SELECT ID_ACREDITADO, ID_CALIFICADORA, B_PREDETERMINADA'+coCRLF+
                      '                       FROM CR_REL_CAL_ACRE'+coCRLF+
                      '                       WHERE ID_ACREDITADO = '+IntToStr(peID_ACREDITADO)+coCRLF+
                      '                         AND SIT_REL_CAL_ACRE <> '+SQLStr(CSIT_CA)+coCRLF+
                      '                       -- ORDER BY B_PREDETERMINADA DESC'+coCRLF+
                      '                      ) TEMP'+coCRLF+
                      '                WHERE ROWNUM = 1'+coCRLF+
                      '              ) CRCA'+coCRLF+
                      '          WHERE CCA.ID_ACREDITADO = CRCA.ID_ACREDITADO'+coCRLF+
                      '            AND CCA.ID_CALIFICADORA = CRCA.ID_CALIFICADORA'+coCRLF+
                      '            AND CCA.SIT_CAL_ACRED <> '+SQLStr(CSIT_CA)+coCRLF+
                      '            AND CCA.CVE_TIPO_RIESGO = NVL('+SQLStr(peCVE_TIPO_RIESGO)+','+SQlStr(CCVE_RIESGO)+')'+coCRLF+
                      '          ORDER BY F_CALIFICACION DESC'+coCRLF+
                      '        ) ULTIMA_CALIF_REALIZADA'+coCRLF+
                      '  WHERE ROWNUM = 1'+coCRLF,
                      Apli.DatabaseName, Apli.SessionName, True);
  If Assigned(vlQry) Then
   With vlQry Do
     Try
       If FindKey([FieldByName('ID_CAL_ACRED').AsString,
                   FieldByName('ID_ACREDITADO').AsString,
                   FieldByName('ID_CALIFICADORA').AsString,
                   FieldByName('CVE_TIPO_RIESGO').AsString,
                   FieldByName('F_CALIFICACION').AsString]) Then
          Begin
          Acreditado.FindKey([ID_ACREDITADO.AsString]);
          Calif_x_Acred.FindKey([ID_ACREDITADO.AsString, ID_CALIFICADORA.AsString]);
          Calificacion.FindKey([ID_CALIFICADORA.AsString, CVE_TIPO_RIESGO.AsString, CVE_CALIFICACION.AsString]);
          End;
     Finally
       vlQry.Close;
       vlQry.Free;
     End;
end;

(***********************************************FORMA CR_CAL_ACRED********************)
(*                                                                              *)
(*  FORMA DE CR_CAL_ACRED                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_CAL_ACRED********************)

procedure TWCrCalAcred.FormShow(Sender: TObject);
begin
 With Objeto Do
  Begin
  lbDempresa.Caption := ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := ParamCre.FECHA.AsString;
  lbDUsuario.Caption := ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

  ID_CAL_ACRED.Control      := edID_CAL_ACRED;
  ID_ACREDITADO.Control     := edID_ACREDITADO;
  ID_CALIFICADORA.Control   := edID_CALIFICADORA;
  CVE_TIPO_RIESGO.Control   := edCVE_TIPO_RIESGO;
  FH_CALIFICACION.Control   := edFH_CALIFICACION;
  CVE_CALIFICACION.Control  := edCVE_CALIFICACION;
  SIT_CAL_ACRED.Control     := rgSIT_CAL_ACRED;
  CVE_USU_ALTA.Control      := edCVE_USU_ALTA;
  F_ALTA.Control            := edF_ALTA;
  CVE_USU_MODIFICA.Control  := edCVE_USU_MODIFICA;
  F_MODIFICA.Control        := edF_MODIFICA;

//  CVE_ENTIDAD.Control     := rgCVE_ENTIDAD;
//  CVE_ENTIDAD1.Control     := rgCVE_ENTIDAD1;

  {ARR RIRA4381 6May2010}
  TXT_COMENTARIO.control    := edTXT_COMENTARIO;

  Acreditado.ID_ACREDITADO.Control  := edID_ACREDITADO;
  Acreditado.Persona.Nombre.Control := edNOM_ACREDITADO;

  Calif_x_Acred.ID_CALIFICADORA.Control := edID_CALIFICADORA;
  Calif_x_Acred.Calificadora.Persona.Nombre.Control  := edNOM_CALIFICADORA;
  Calif_x_Acred.NOM_ACRED_CALIF.Control := edNOM_ACRED_CALIF;
  Calif_x_Acred.CVE_ENTIDAD.Control := rgCVE_ENTIDAD;

  Calificacion.CVE_TIPO_RIESGO.Control   := edCVE_TIPO_RIESGO;
  Calificacion.CVE_CALIFICACION.Control  := edCVE_CALIFICACION;
  Calificacion.NUM_PUNTOS_DIST.Control   := edNUM_PUNTOS_DIST;
  Calificacion.NUM_NIVEL.Control         := edNUM_NIVEL;

  TipoRiesgo1.CVE_TIPO_RIESGO.Control    := edCVE_TIPO_RIESGO1;
  TipoRiesgo1.DESC_TIPO_RIESGO.Control   := edDESC_TIPO_RIESGO1;

  Interforma1.MsgPanel := MsgPanel;
  End;

  dtpFH_CALIFICACION.DateTime := strtodatetime(FormatDateTime('dd/mm/yy hh:nn:ss', objeto.Apli.Fecha.GetSysDate));

end;

procedure TWCrCalAcred.FormDestroy(Sender: TObject);
begin
 With Objeto Do
  Begin
  ID_CAL_ACRED.Control      := Nil;
  ID_ACREDITADO.Control     := Nil;
  ID_CALIFICADORA.Control   := Nil;
  CVE_TIPO_RIESGO.Control   := Nil;
  FH_CALIFICACION.Control   := Nil;
  CVE_CALIFICACION.Control  := Nil;
  SIT_CAL_ACRED.Control     := Nil;
  CVE_USU_ALTA.Control      := Nil;
  F_ALTA.Control            := Nil;
  CVE_USU_MODIFICA.Control  := Nil;
  F_MODIFICA.Control        := Nil;

//  CVE_ENTIDAD.Control     := Nil;
//  CVE_ENTIDAD1.Control    := Nil;

  Acreditado.ID_ACREDITADO.Control  := Nil;
  Acreditado.Persona.Nombre.Control := Nil;

  Calif_x_Acred.ID_CALIFICADORA.Control := Nil;
  Calif_x_Acred.Calificadora.Persona.Nombre.Control  := Nil;
  Calif_x_Acred.NOM_ACRED_CALIF.Control := Nil;
  Calif_x_Acred.CVE_ENTIDAD.Control   := Nil;

  Calificacion.CVE_TIPO_RIESGO.Control   := Nil;
  Calificacion.CVE_CALIFICACION.Control  := Nil;
  Calificacion.NUM_PUNTOS_DIST.Control   := Nil;
  Calificacion.NUM_NIVEL.Control         := Nil;

  TipoRiesgo1.CVE_TIPO_RIESGO.Control    := Nil;
  TipoRiesgo1.DESC_TIPO_RIESGO.Control   := Nil;

  TXT_COMENTARIO.control    := nil;
  Interforma1.MsgPanel := Nil;
  End;

  AcrClon.Free;

end;

procedure TWCrCalAcred.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrCalAcred.InterForma1DespuesNuevo(Sender: TObject);
begin
  If edID_ACREDITADO.CanFocus Then
    edID_ACREDITADO.SetFocus;

  Objeto.SIT_CAL_ACRED.AsString := CSIT_AC;

end;

procedure TWCrCalAcred.InterForma1DespuesModificar(Sender: TObject);
begin
  If btCVE_CALIFICACION.CanFocus Then
    btCVE_CALIFICACION.SetFocus;
end;

procedure TWCrCalAcred.ilID_ACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
 Show := True;
end;

procedure TWCrCalAcred.btID_ACREDITADOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCALACRE_ACRED',True,True) then
   begin
      Objeto.Acreditado.Busca;
   end;
end;

procedure TWCrCalAcred.btID_CALIFICADORAClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCALACRE_CLFRA',True,True) then
   begin
     With Objeto Do
       Begin
       Calif_x_Acred.BuscaWhereString := ' ID_ACREDITADO = ' + Acreditado.ID_ACREDITADO.AsString;
       If Calif_x_Acred.Busca Then
       End;
   end;
end;

procedure TWCrCalAcred.btCVE_CALIFICACIONClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCALACRE_CALIF',True,True) then
   begin
     With Objeto Do
       Begin
       Calificacion.BuscaWhereString := ' ID_CALIFICADORA = ' + Calif_x_Acred.ID_CALIFICADORA.AsString;
       If Calificacion.Busca Then
       End;
   end;
end;

procedure TWCrCalAcred.btCVE_TIPO_RIESGO1Click(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRCALACRE_TRIES',True,True) then
   begin
     With Objeto Do
       Begin
       If TipoRiesgo1.Busca Then
       End;
   end;   
end;

procedure TWCrCalAcred.ilID_ACREDITADOEjecuta(Sender: TObject);
begin
 With Objeto Do
   If Acreditado.FindKey([ilID_ACREDITADO.Buffer]) Then
end;

procedure TWCrCalAcred.ilID_CALIFICADORAEjecuta(Sender: TObject);
begin
 With Objeto Do
   If Calif_x_Acred.FindKey([Acreditado.ID_ACREDITADO.AsString, ilID_CALIFICADORA.Buffer]) Then
end;

procedure TWCrCalAcred.ilCVE_TIPO_RIESGO1Ejecuta(Sender: TObject);
begin
 With Objeto Do
  TipoRiesgo1.FindKey([ilCVE_TIPO_RIESGO1.Buffer]);
end;

procedure TWCrCalAcred.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
var vlstrMessage : String;
    mrResult : Word;
    vlFH_CALIFICACION : TDateTime;
    vlstrFH_CALIFICACION : String;
begin
 if not IsNewData then
 begin
    if ( StrToDateTime(edFH_CALIFICACION.Text)< StrToDateTime(vpOriFH_CALIFICACION) ) then
      MessageDlg('La fecha a modificar ('+ DateTimeToStr(StrToDateTime(edFH_CALIFICACION.Text))+') es anterior a la última almacenada ('+DateTimeToStr(StrToDateTime(vpOriFH_CALIFICACION))+').', mtWarning, [mbOK], 0);
 end;

 If IsNewData Then vlstrMessage := CCONFIRM_ALMACENA_INS
 Else vlstrMessage := CCONFIRM_ALMACENA_MOD;
 mrResult := MessageDlg(vlstrMessage, mtConfirmation, [mbYes, mbNo], 0);
                  
 With Objeto Do
   If (mrResult = mrYes) Then
    Begin
      If (IsNewData) Then
       Begin
       ID_CAL_ACRED.AsInteger := ObtenFolio(CFOL_CRCALACR, 'Folio "'+CFOL_CRCALACR+'".'+coCRLF+
                                            'Favor de intentar nuevamente o avisar a Sistemas.', Objeto.Apli);
       F_ALTA.AsDateTime      := Apli.DameFechaEmpresa;
       CVE_USU_ALTA.AsString  := Apli.Usuario;
       End
      Else
       Begin
         F_MODIFICA.AsDateTime     := Apli.DameFechaEmpresa;
         CVE_USU_MODIFICA.AsString := Apli.Usuario;

         // RUCJ4248 ::
         if objeto.CVE_CALIFICACION.AsString <> AcrClon.FCVE_CALIFICACION then
           actualizaHistorico;
       End;

     // Debido a nun problema con la interforma se hace el siguiente
     // copiado de valores y vaciado de variables.
     vlstrFH_CALIFICACION := edFH_CALIFICACION.Text;
     vlFH_CALIFICACION    := StrToDateTime(vlstrFH_CALIFICACION);
     FH_CALIFICACION.AsDateTime := vlFH_CALIFICACION;
     F_CALIFICACION.AsDateTime  := Trunc(vlFH_CALIFICACION);

     edFH_CALIFICACION.Text := vlstrFH_CALIFICACION;
     End;
 Realizado  := mrResult = mrYes;
end;

procedure TWCrCalAcred.InterForma1AntesNuevo(Sender: TObject;
  var Realizado: Boolean);
begin
  Objeto.Active := False;
end;

procedure TWCrCalAcred.edID_ACREDITADOExit(Sender: TObject);
var vlstrMsg : String;
begin
 With Objeto Do
  If (Modo = moAppend) Or (Modo = moEdit) Then
   Begin
   vlstrMsg := '';
   ID_ACREDITADO.GetFromControl;
   If (Trim(edID_ACREDITADO.Text) = '') Then vlstrMsg := 'Favor de indicar el '+lbID_ACREDITADO.Caption;
   InterForma1.ValidaExit(edID_ACREDITADO, (vlstrMsg = ''), vlstrMsg,True);
   End;
end;

procedure TWCrCalAcred.edID_CALIFICADORAExit(Sender: TObject);
var vlstrMsg : String;
begin
 With Objeto Do
  If (Modo = moAppend) Or (Modo = moEdit) Then
   Begin
   vlstrMsg := '';
   ID_CALIFICADORA.GetFromControl;
   If (Trim(edID_CALIFICADORA.Text) = '') Then vlstrMsg := 'Favor de indicar la '+lbID_CALIFICADORA.Caption;
   InterForma1.ValidaExit(edID_CALIFICADORA, (vlstrMsg = ''), vlstrMsg,True);
   End;
end;

procedure TWCrCalAcred.btCVE_CALIFICACIONExit(Sender: TObject);
var vlstrMsg : String;
begin
 With Objeto Do
  If (Modo = moAppend) Or (Modo = moEdit) Then
   Begin
   vlstrMsg := '';
   CVE_CALIFICACION.GetFromControl;
   If (Trim(edCVE_CALIFICACION.Text) = '') Then vlstrMsg := 'Favor de indicar la '+lbCVE_CALIFICACION.Caption;
   InterForma1.ValidaExit(btCVE_CALIFICACION, (vlstrMsg = ''), vlstrMsg,True);
   End;
end;

procedure TWCrCalAcred.edFH_CALIFICACIONExit(Sender: TObject);
var vlstrMsg : String;
    vlFH_CALIFICACION : TDateTime;
begin
 With Objeto Do
  If (Modo = moAppend) Or (Modo = moEdit) Then
   Begin
   vlstrMsg := '';
   If (Trim(edFH_CALIFICACION.Text) = '') Then vlstrMsg := 'Favor de indicar la '+lbFH_CALIFICACION.Caption
   Else If (Not SICC_IsDateTime(edFH_CALIFICACION.Text, vlFH_CALIFICACION)) Then vlstrMsg := 'La fecha no es válida ó falta indicar la hora en que se calificó.';
   InterForma1.ValidaExit(edFH_CALIFICACION, (vlstrMsg = ''), vlstrMsg,True);
   End;
end;

procedure TWCrCalAcred.rgSIT_CAL_ACREDExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_CAL_ACRED, True, '',True);
end;

procedure TWCrCalAcred.InterForma1Buscar(Sender: TObject);
begin
  With Objeto Do
   If InternalBusca Then
    Begin
    Acreditado.FindKey([ID_ACREDITADO.AsString]);
    Calif_x_Acred.FindKey([ID_ACREDITADO.AsString, ID_CALIFICADORA.AsString]);
    Calificacion.FindKey([ID_CALIFICADORA.AsString, CVE_TIPO_RIESGO.AsString, CVE_CALIFICACION.AsString]);
    End;

    rgCVE_ENTIDAD.ItemIndex := obtEntidad;
    rgCVE_ENTIDAD1.ItemIndex := rgCVE_ENTIDAD.ItemIndex;
end;

function TWCrCalAcred.StpAltaCabeceraArchCal( peID_CALIFICADORA     : Integer;
                                              peCVE_TIPO_RIESGO     ,
                                              peNOM_ARCHIVO         : String;
                                              peFH_CALIFICACION     : TDateTime;
                                              peB_COMMIT            : String;
                                              psID_CAL_AR_CABEC     : Integer;
                                              psRESULTADO           : Integer;
                                              psTX_RESULTADO        : String;
                                              pebMuestraError       : Boolean
                                            ) : Boolean;
var Stp : TStoredProc;
    vlbResult : Boolean;
begin
  vlbResult := False;
  Stp :=  TStoredProc.Create(Nil);
  If Assigned(Stp) Then
    With Stp Do
     Try
       StoredProcName := 'PKGCRSICC.STP_ALTA_CABECERA_ARCH_CAL';
       DataBaseName   := Objeto.Apli.DataBaseName;
       SessionName    := Objeto.Apli.SessionName;
       Params.CreateParam(ftInteger ,'peID_CALIFICADORA' ,ptInput);
       Params.CreateParam(ftString  ,'peCVE_TIPO_RIESGO' ,ptInput);
       Params.CreateParam(ftString  ,'peNOM_ARCHIVO'     ,ptInput);
       Params.CreateParam(ftDateTime,'peFH_CALIFICACION' ,ptInput);
       Params.CreateParam(ftString  ,'peCVE_USU_ALTA'    ,ptInput);
       Params.CreateParam(ftDateTime,'peF_ALTA'          ,ptInput);
       Params.CreateParam(ftString  ,'peB_COMMIT'        ,ptInput);
       Params.CreateParam(ftInteger ,'psID_CAL_AR_CABEC' ,ptOutput);
       Params.CreateParam(ftInteger ,'psRESULTADO'       ,ptOutput);
       Params.CreateParam(ftString  ,'psTX_RESULTADO'    ,ptOutput);

       ParamByName('peID_CALIFICADORA').AsInteger         := peID_CALIFICADORA;
       ParamByName('peCVE_TIPO_RIESGO').AsString          := peCVE_TIPO_RIESGO;
       ParamByName('peNOM_ARCHIVO').AsString              := peNOM_ARCHIVO;
       ParamByName('peFH_CALIFICACION').AsDateTime        := peFH_CALIFICACION;
       ParamByName('peCVE_USU_ALTA').AsString             := Objeto.Apli.Usuario;
       ParamByName('peF_ALTA').AsDateTime                 := Objeto.Apli.DameFechaEmpresa;
       ParamByName('peB_COMMIT').AsString                 := peB_COMMIT;
       ExecProc;

       psID_CAL_AR_CABEC := ParamByName('psID_CAL_AR_CABEC').AsInteger;
       psRESULTADO       := ParamByName('psRESULTADO').AsInteger  ;
       psTX_RESULTADO    := ParamByName('psTX_RESULTADO').AsString;

       If (psRESULTADO <> 0) Then
        If (pebMuestraError) Then
          MessageDlg(psTX_RESULTADO ,mtError, [mbOk], 0);

       vlbResult := (psRESULTADO = 0);
     Finally
       Stp.Params.Clear;
       Stp.Free;
     End;
     Result := vlbResult;
end;

function TWCrCalAcred.ActCveCalificacion(peID_CAL_AR_CABEC : Integer;
                                         peB_COMMIT        : String;
                                         var psRESULTADO       : Integer;
                                         var psTX_RESULTADO    : String;
                                         pebMuestraError       : Boolean
                                         ) : Boolean;
var Stp : TStoredProc;
    vlbResult : Boolean;
begin
  vlbResult := False;
  Stp :=  TStoredProc.Create(Nil);
  If Assigned(Stp) Then
    With Stp Do
     Try
       StoredProcName := 'PKGCRSICC.STP_ACT_CVE_CALIFICACION';
       DataBaseName   := Objeto.Apli.DataBaseName;
       SessionName    := Objeto.Apli.SessionName;
       Params.CreateParam(ftInteger ,'peID_CAL_AR_CABEC' ,ptInput);
       Params.CreateParam(ftString  ,'peB_COMMIT'        ,ptInput);
       Params.CreateParam(ftInteger ,'psRESULTADO'       ,ptOutput);
       Params.CreateParam(ftString  ,'psTX_RESULTADO'    ,ptOutput);

       ParamByName('peID_CAL_AR_CABEC').AsInteger         := peID_CAL_AR_CABEC;
       ParamByName('peB_COMMIT').AsString                 := peB_COMMIT;
       ExecProc;

       psRESULTADO       := ParamByName('psRESULTADO').AsInteger  ;
       psTX_RESULTADO    := ParamByName('psTX_RESULTADO').AsString;

       If (psRESULTADO <> 0) Then
        If (pebMuestraError) Then
          MessageDlg(psTX_RESULTADO ,mtError, [mbOk], 0);

       vlbResult := (psRESULTADO = 0);
     Finally
       Stp.Params.Clear;
       Stp.Free;
     End;
     Result := vlbResult;
end;

procedure TWCrCalAcred.ObtenIdCalificadoras(var psID_FITCH, psID_MOODYS, psID_STANDARD : Integer;
                                            var psNOM_FITCH, psNOM_MOODYS, psNOM_STANDARD : String);
begin
   // Obtiene el Id de la calificadora Fitch
   psNOM_FITCH := 'FITCH'; 
   GetSQLInt(' SELECT R.*'+coCRLF+
             ' FROM ( SELECT ID_CALIFICADORA, PKGCRSICC.STP_OBT_NOM_TITULAR_2(NULL, NULL, ID_CALIFICADORA) AS NOM_CALIFICADORA'+coCRLF+
             '        FROM CR_CALIFICADORA'+coCRLF+
             '      ) R'+coCRLF+
             ' WHERE NOM_CALIFICADORA LIKE ''%FITCH%'''+coCRLF,
             Objeto.Apli.Databasename, Objeto.Apli.SessionName, 'ID_CALIFICADORA', psID_FITCH, True);

   // Obtiene el Id de la calificadora Moodys
   psNOM_MOODYS := 'MOODYS';
   GetSQLInt(' SELECT R.*'+coCRLF+
             ' FROM ( SELECT ID_CALIFICADORA, PKGCRSICC.STP_OBT_NOM_TITULAR_2(NULL, NULL, ID_CALIFICADORA) AS NOM_CALIFICADORA'+coCRLF+
             '        FROM CR_CALIFICADORA'+coCRLF+
             '      ) R'+coCRLF+
             ' WHERE NOM_CALIFICADORA LIKE ''%MOODY%S%'''+coCRLF,
             Objeto.Apli.Databasename, Objeto.Apli.SessionName, 'ID_CALIFICADORA', psID_MOODYS, True);


   // Obtiene el Id de la calificadora Standard & Poors
   psNOM_STANDARD := 'STANDARD';
   GetSQLInt(' SELECT R.*'+coCRLF+
             ' FROM ( SELECT ID_CALIFICADORA, PKGCRSICC.STP_OBT_NOM_TITULAR_2(NULL, NULL, ID_CALIFICADORA) AS NOM_CALIFICADORA'+coCRLF+
             '        FROM CR_CALIFICADORA'+coCRLF+
             '      ) R'+coCRLF+
             ' WHERE NOM_CALIFICADORA LIKE ''%STANDARD%'''+coCRLF,
             Objeto.Apli.Databasename, Objeto.Apli.SessionName, 'ID_CALIFICADORA', psID_STANDARD, True);
end;


procedure TWCrCalAcred.btCargaClick(Sender: TObject);
var vlQry : TQuery;
    I, vlCountReg, vlLastRow, vlNUM_FOLIO : Integer;
    vlDescProc : String;
    vlDESC_TIPO_ENTIDAD : String;
    vlFH_CALIFICACION : TDateTime;
    vlID_CAL_AR_CABEC, vlRESULTADO : Integer;

    vlID_CALIFICADORA,
    vlID_FITCH, vlID_MOODYS, vlID_STANDARD : Integer;

    vlNOM_CALIFICADORA,
    vlNOM_FITCH, vlNOM_MOODYS, vlNOM_STANDARD : String;

    vlExcelApp : OleVariant;


    vlnLastError, vlnRowExcel,
    vlnColExcel_LOCALIDAD, vlnColExcel_CALIFICACION : Integer;
begin
   if Objeto.ValidaAccesoEsp('TCRCALACRE_CGABL',True,True) then
   begin
      // Inicia Validaciones
       vlDescProc := '';
       If (Trim(Objeto.TipoRiesgo1.CVE_TIPO_RIESGO.AsString) = '') Then
         Begin
         vlDescProc := 'Favor de indicar el '+lbCVE_TIPO_RIESGO1.Caption;
         If edCVE_TIPO_RIESGO1.CanFocus Then edCVE_TIPO_RIESGO1.SetFocus;
         End
       Else If (rgCVE_ENTIDAD1.ItemIndex < 0) Then
         Begin
         vlDescProc := 'Favor de indicar el '+rgCVE_ENTIDAD1.Caption;
         If rgCVE_ENTIDAD1.CanFocus Then rgCVE_ENTIDAD1.SetFocus;
         End
       Else If (Trim(ExtractFileName(edFileName.Text)) = '') Then
         Begin
         vlDescProc := 'Falta Indicar el nombre del archivo a cargar.';
         If edFileName.CanFocus Then edFileName.SetFocus;
         End
        Else If Not FileExists(edFileName.Text) Then
         Begin
         vlDescProc := 'El Archvo indicado no existe o no se encuentra en la ruta específicada. Favor de Verificar.';
         If edFileName.CanFocus Then edFileName.SetFocus;
         End
        Else If (Not CanOpenFile(edFileName.Text, True, vlnLastError)) Then
         Begin
         vlDescProc := 'Error:'+IntToStr(vlnLastError);
         If edFileName.CanFocus Then edFileName.SetFocus;
         End;
       If (vlDescProc <> '') Then
        Begin
        MessageDlg(vlDescProc, mtWarning, [mbOk], 0);
        Exit;
        End;
       // Esta parte del código es HARDCODE (Así como se lee) y el usuario
       // tiene de conocimiento que en el momento de que se realice una
       // modificación en el formato de archivo se tiene que revisar y avisara
       // sistemas.
       //
       //
       // Abre el Archivo de Excel
       //
       If Not OpenExcelFile(edFileName.Text, vlExcelApp) Then
        Exit;

       // Coloca Mensajes de Inicio
       MErrores.Lines.Add(MensajeHoraInicio);
       MErrores.Lines.Add('******* INICIA CARGA POR SISTEMA *******');

       // Inicia con la obtención de las calificadoras...
       ObtenIdCalificadoras(vlID_FITCH, vlID_MOODYS, vlID_STANDARD,
                            vlNOM_FITCH, vlNOM_MOODYS, vlNOM_STANDARD);

       For I := 1 To 3 Do
         Begin
           //
           vlID_CALIFICADORA := -1;
           Case I Of
            1 : Begin
                vlID_CALIFICADORA := vlID_FITCH;     vlNOM_CALIFICADORA := vlNOM_FITCH;
                vlnColExcel_LOCALIDAD := ColumnXlS('A'); vlnColExcel_CALIFICACION := ColumnXlS('B');
                End;

            2 : Begin
                vlID_CALIFICADORA := vlID_MOODYS;    vlNOM_CALIFICADORA := vlNOM_MOODYS;
                vlnColExcel_LOCALIDAD := ColumnXlS('C'); vlnColExcel_CALIFICACION := ColumnXlS('D');
                End;

            3 : Begin
                vlID_CALIFICADORA := vlID_STANDARD;  vlNOM_CALIFICADORA := vlNOM_STANDARD;
                vlnColExcel_LOCALIDAD := ColumnXlS('E'); vlnColExcel_CALIFICACION := ColumnXlS('F');
                End;
           End;
           // Obtiene la fecha en la calificadora asigno dicha calificación
           vlFH_CALIFICACION := vlExcelApp.Workbooks[1].WorkSheets[1].Cells[3, vlnColExcel_CALIFICACION].Value;
           // Da de alta la cabecera del Archivo para esa Calificadora y Obtiene el Folio del Archivo Insertado
           // en "vlID_CAL_AR_CABEC"
           StpAltaCabeceraArchCal( vlID_CALIFICADORA,
                                   Objeto.TipoRiesgo1.CVE_TIPO_RIESGO.AsString,
                                   UpperCaseAcentos(vlNOM_CALIFICADORA+'_'+ExtractFileName(edFileName.Text)),
                                   vlFH_CALIFICACION,
                                   CFALSO,
                                   vlID_CAL_AR_CABEC,
                                   vlRESULTADO,
                                   vlDescProc,
                                   False
                                 );
            // ¿Hay errores?
            If (Trim(vlDescProc) <> '') Then
             Begin
             MsgMemo(MErrores, vlDescProc, mtWarning, [mbOk], 0);
             Exit;
             End;
            // Obtiene el Tipo de Entidad
            Case rgCVE_ENTIDAD1.ItemIndex Of
             0 : vlDESC_TIPO_ENTIDAD := 'ESTADO';
             1 : vlDESC_TIPO_ENTIDAD := 'MUNICIPIO';
             2 : vlDESC_TIPO_ENTIDAD := 'GOBIERNO DESC';
             // 2 : vlDESC_TIPO_ENTIDAD := 'CRÉDITOS ESTRUCTURADOS';
            Else
             vlDESC_TIPO_ENTIDAD := '';
            End;
            // Inserta cada uno de los registros
            vlQry := TQuery.Create(Nil);
            With vlQry Do
             Begin
             DatabaseName := Objeto.Apli.DatabaseName;
             SessionName  := Objeto.Apli.SessionName;
             Params.Clear;
             SQL.Clear;
             SQL.Add(' INSERT INTO CR_CAL_AR_DETALL'+coCRLF+
                     ' ( ID_CAL_AR_DETALL,  ID_CAL_AR_CABEC,  DESC_TIPO_ENTIDAD,'+coCRLF+
                     '   NOM_ACRED_CALIF,   TX_CALIFICACION,'+coCRLF+
                     '   SIT_CAL_AR_DETALL, CVE_USU_ALTA,     F_ALTA ) '+coCRLF+
                     ' VALUES '+coCRLF+
                     ' ( :PID_CAL_AR_DETALL,  :PID_CAL_AR_CABEC,  :PDESC_TIPO_ENTIDAD,'+coCRLF+
                     '   :PNOM_ACRED_CALIF,   :PTX_CALIFICACION,'+coCRLF+
                     '   :PSIT_CAL_AR_DETALL, :PCVE_USU_ALTA,     :PF_ALTA ) '+coCRLF
                     );
             Prepare;
             {
             Params.CreateParam(ftInteger , 'PID_CAL_AR_DETALL'  ,ptInput);
             Params.CreateParam(ftInteger , 'PID_CAL_AR_CABEC'   ,ptInput);
             Params.CreateParam(ftString  , 'PDESC_TIPO_ENTIDAD' ,ptInput);
             Params.CreateParam(ftString  , 'PNOM_ACRED_CALIF'   ,ptInput);
             Params.CreateParam(ftString  , 'PTX_CALIFICACION'   ,ptInput);
             Params.CreateParam(ftString  , 'PSIT_CAL_AR_DETALL' ,ptInput);
             Params.CreateParam(ftString  , 'PCVE_USU_ALTA'      ,ptInput);
             Params.CreateParam(ftDateTime, 'PF_ALTA'            ,ptInput);
             }

             ParamByName('PID_CAL_AR_CABEC').AsInteger   := vlID_CAL_AR_CABEC;
             ParamByName('PDESC_TIPO_ENTIDAD').AsString  := vlDESC_TIPO_ENTIDAD;
             ParamByName('PSIT_CAL_AR_DETALL').AsString  := CSIT_AC;
             ParamByName('PCVE_USU_ALTA').AsString       := Objeto.Apli.Usuario;
             ParamByName('PF_ALTA').AsDateTime           := Objeto.Apli.DameFechaEmpresa;
             End;

            vlCountReg := 0;  vlLastRow := GetLastRow(vlExcelApp, vlnColExcel_LOCALIDAD);
            ProgressBar.Max := vlLastRow - 3; // Se le restan 3 debido a que no se toma encuenta el "HEADER" del Archivo
            For vlnRowExcel := 4 To vlLastRow Do
             With vlQry Do
              Try
               ParamByName('PNOM_ACRED_CALIF').AsString   := UppercaseAcentos(vlExcelApp.Workbooks[1].WorkSheets[1].Cells[vlnRowExcel, vlnColExcel_LOCALIDAD].Value);
               ParamByName('PTX_CALIFICACION').AsString   := vlExcelApp.Workbooks[1].WorkSheets[1].Cells[vlnRowExcel, vlnColExcel_CALIFICACION].Value;

               If (ParamByName('PNOM_ACRED_CALIF').AsString <> '') And (ParamByName('PTX_CALIFICACION').AsString <> '') Then
                 Begin
                 vlNUM_FOLIO := ObtenFolio(CFOL_CRCALDET, 'Error al Obtener el Folio "'+CFOL_CRCALDET+'". Avise a Sistemas.', Objeto.Apli);
                 If (vlNUM_FOLIO = 0) Then
                  Exit;
                 ParamByName('PID_CAL_AR_DETALL').AsInteger := vlNUM_FOLIO;
                 ExecSQL;
                 ParamByName('PNOM_ACRED_CALIF').AsString := '';
                 ParamByName('PTX_CALIFICACION').AsString := '';
                 End;

               vlCountReg := vlCountReg + 1;
               ProgressBar.Position := vlCountReg;
               lblCounter.Caption := IntToStr(vlCountReg);
               Application.ProcessMessages;
              Finally
               Close;
              End;

            // Si el Archivo se Cargo bien, entonces...
            If (Trim(vlDescProc) = '') Then
             Begin
             // Actualiza la Clave de Calificación del Archivo
             ActCveCalificacion(vlID_CAL_AR_CABEC,
                                CVERDAD,
                                vlRESULTADO,
                                vlDescProc,
                                False
                               );
             End;
         End; // End For
         // Cierra el Libro de Excel
         CloseExcelFile(vlExcelApp);

         // Si todo salio correcto, entonces...
         If (Trim(vlDescProc) <> '') Then
          Begin
          MsgMemo(MErrores, vlDescProc, mtError, [mbOk], 0)
          End
         Else
          Begin
          MsgMemo(MErrores, '******* TERMINA CARGA POR SISTEMA *******', mtInformation, [mbOk], 0);
          btAdminArchClick(Self);
          End;
    end;      
end;

procedure TWCrCalAcred.Button1Click(Sender: TObject);
var vlstrDir : String;
begin
 vlstrDir := ExtractFileDir(edFileName.Text);
 If (Trim(vlstrDir) <> 'C:\') Then
  OpenDialog1.InitialDir := vlstrDir;
 If OpenDialog1.Execute Then
  edFileName.Text := OpenDialog1.FileName;
end;

procedure TWCrCalAcred.btAdminArchClick(Sender: TObject);
var vlID_FITCH, vlID_MOODYS, vlID_STANDARD : Integer;
    vlNOM_FITCH, vlNOM_MOODYS, vlNOM_STANDARD : String;
begin
   if Objeto.ValidaAccesoEsp('TCRCALACRE_ADMAR',True,True) then
   begin
     // Inicia con la obtención de las calificadoras...
     ObtenIdCalificadoras(vlID_FITCH, vlID_MOODYS, vlID_STANDARD,
                          vlNOM_FITCH, vlNOM_MOODYS, vlNOM_STANDARD);
     MuestraDetalleArchivo(UpperCaseAcentos(vlNOM_FITCH+'_'+ExtractFileName(edFileName.Text)), Objeto.ParamCre, Objeto.Apli);
     MuestraDetalleArchivo(UpperCaseAcentos(vlNOM_MOODYS+'_'+ExtractFileName(edFileName.Text)), Objeto.ParamCre, Objeto.Apli);
     MuestraDetalleArchivo(UpperCaseAcentos(vlNOM_STANDARD+'_'+ExtractFileName(edFileName.Text)), Objeto.ParamCre, Objeto.Apli);
     // Limpia los datos para la próxima Carga
     rgCVE_ENTIDAD1.ItemIndex := - 1;
     edFileName.Text := '';
     ProgressBar.Position := 0;
     lblCounter.Caption := '0';
   end;  
end;

procedure TWCrCalAcred.lbLink1Click(Sender: TObject);
var vlExcelApp : OleVariant;
begin
 OpenExcelFile('\\Inter25\Corp\Delphide\ICre01\Reportes\Formato_ARegional.xls',vlExcelApp);
 vlExcelApp.Visible := True;
end;

procedure TWCrCalAcred.lbLink2Click(Sender: TObject);
var vlExcelApp : OleVariant;
begin
 OpenExcelFile('\\Inter25\Corp\Delphide\ICre01\Reportes\Ejemplo_ARegional.xls',vlExcelApp);
 vlExcelApp.Visible := True;
end;

procedure TWCrCalAcred.edTXT_COMENTARIOExit(Sender: TObject);
begin
InterForma1.ValidaExit(edTXT_COMENTARIO, True, '',True);
end;

procedure TWCrCalAcred.InterForma1AntesModificar(Sender: TObject;
  var Realizado: Boolean);
begin
//
  obtCalificacionAnt;
  vpOriFH_CALIFICACION:=edFH_CALIFICACION.Text;
end;

procedure TWCrCalAcred.actualizaHistorico;
begin
    insertaHistorico;
end;

procedure TWCrCalAcred.insertaHistorico;
var
  iCabecero, iDetalle : integer;
  vlQry     : TQuery;
begin
  iCabecero := ObtenFolio('CRCALCAB', 'Error al Obtener el Folio "CRCALCAB". Avise a Sistemas.', Objeto.Apli);
  iDetalle  := ObtenFolio('CRCALDET', 'Error al Obtener el Folio "CRCALDET". Avise a Sistemas.', Objeto.Apli);
  vlQry := TQuery.Create(Nil);
  try
    try
      with vlQry do
      begin
        DatabaseName := Objeto.Apli.DatabaseName;
        SessionName  := Objeto.Apli.SessionName;
        Params.Clear;
        SQL.Clear;
        SQL.Add(
           ' INSERT INTO CR_CAL_AR_CABEC   '+coCRLF+
           '  ( ID_CAL_AR_CABEC  , ID_CALIFICADORA  , CVE_TIPO_RIESGO  , NOM_ARCHIVO      , '+coCRLF+
           '    F_CALIFICACION   , FH_CALIFICACION  , SIT_CAL_AR_CABE  , F_ALTA           , '+coCRLF+
           '    CVE_USU_ALTA     , F_MODIFICA       , CVE_USU_MODIFICA '+coCRLF+
           '  ) '+coCRLF+
           ' VALUES  '+coCRLF+
           '  ( :VLID_CAL_AR_CABEC  , :PEID_CALIFICADORA  , :PECVE_TIPO_RIESGO  , :PENOM_ARCHIVO      ,  '+coCRLF+
           '    :VLF_CALIFICACION   , :PEFH_CALIFICACION  , :VLSIT_CAL_AR_CABE  , :PEF_ALTA           ,  '+coCRLF+
           '    :PECVE_USU_ALTA     , NULL               , NULL '+coCRLF+
           '  ) '+coCRLF
           );
        Prepare;
        ParamByName('VLID_CAL_AR_CABEC').AsInteger  := iCabecero;
        ParamByName('PEID_CALIFICADORA').AsString   := AcrClon.FID_CALIFICADORA;
        ParamByName('PECVE_TIPO_RIESGO').AsString   := AcrClon.FCVE_TIPO_RIESGO;
        ParamByName('PENOM_ARCHIVO').AsString       := AcrClon.FNOM_ARCHIVO;
        ParamByName('VLF_CALIFICACION').AsString    := AcrClon.FF_CALIFICACION;
        ParamByName('PEFH_CALIFICACION').AsDateTime := StrToDateTime(AcrClon.FH_CALIFICACION);
        ParamByName('VLSIT_CAL_AR_CABE').AsString   := CSIT_AC;
        ParamByName('PEF_ALTA').AsDateTime          := Objeto.Apli.DameFechaEmpresa;
        ParamByName('PECVE_USU_ALTA').AsString      := Objeto.Apli.Usuario;
        ExecSQL;

      end;
    except
      on E : Exception do
        ShowMessage(E.ClassName + E.Message);
    end;


    // insertamos los datos del detalle
    try
      with vlQry do
      begin
        DatabaseName := Objeto.Apli.DatabaseName;
        SessionName  := Objeto.Apli.SessionName;
        Params.Clear;
        SQL.Clear;
        SQL.Add(' INSERT INTO CR_CAL_AR_DETALL'+coCRLF+
               ' ( ID_CAL_AR_DETALL,  ID_CAL_AR_CABEC,  DESC_TIPO_ENTIDAD,'+coCRLF+
               '   NOM_ACRED_CALIF,   CVE_CALIFICACION, TX_CALIFICACION,'+coCRLF+
               '   SIT_CAL_AR_DETALL, CVE_USU_ALTA,     F_ALTA ) '+coCRLF+
               ' VALUES '+coCRLF+
               ' ( :PID_CAL_AR_DETALL,  :PID_CAL_AR_CABEC,  :PDESC_TIPO_ENTIDAD,'+coCRLF+
               '   :PNOM_ACRED_CALIF,   :PCVE_CALIFICACION, :PTX_CALIFICACION,'+coCRLF+
               '   :PSIT_CAL_AR_DETALL, :PCVE_USU_ALTA,     :PF_ALTA ) '+coCRLF
               );
        Prepare;
        ParamByName('PID_CAL_AR_CABEC').AsInteger   := iCabecero;
        ParamByName('PDESC_TIPO_ENTIDAD').AsString  := AcrClon.FDESC_TIPO_ENTIDAD;
        ParamByName('PSIT_CAL_AR_DETALL').AsString  := CSIT_AC;
        ParamByName('PCVE_USU_ALTA').AsString       := Objeto.Apli.Usuario;
        ParamByName('PF_ALTA').AsDateTime           := Objeto.Apli.DameFechaEmpresa;
        ParamByName('PCVE_CALIFICACION').AsString   := AcrClon.FCVE_CALIFICACION;
        ParamByName('PNOM_ACRED_CALIF').AsString    := AcrClon.FNOM_ACRED_CALIF;
        ParamByName('PTX_CALIFICACION').AsString    := AcrClon.FTX_CALIFICACION;
        ParamByName('PID_CAL_AR_DETALL').AsInteger  := iDetalle;
        ExecSQL;
    //    ParamByName('PNOM_ACRED_CALIF').AsString := '';
    //    ParamByName('PTX_CALIFICACION').AsString := '';
      End;
    except
      on E : Exception do
        ShowMessage(E.ClassName + E.Message);
    end;
  finally
    vlQry.Free;
  end;
  
end;

procedure TWCrCalAcred.FormCreate(Sender: TObject);
begin
   AcrClon := TAcrClon.Create;
end;

procedure TWCrCalAcred.obtCalificacionAnt;
var
  strSQL, vlDESC_TIPO_ENTIDAD : string;
  strTexto : String;
begin
  // Con estO OBTENEMOS el tipo de entidad al que pertenece
  strSQL := '' +
      ' select DESC_ENTIDAD from cr_cal_acred t1 ' +
      '   inner join cr_rel_cal_acre t2 on (t2.id_acreditado = t1.id_acreditado and t2.id_calificadora = t1.id_calificadora) ' +
      '   inner join CR_CAL_TIPO_ENT t3 on (t3.cve_entidad = t2.cve_entidad) ' +
      ' where t1.id_acreditado = ' + Objeto.ID_ACREDITADO.AsString +
      '	  and t2.id_calificadora = ' + Objeto.ID_CALIFICADORA.AsString;

  GetSQLStr(strSQL,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'DESC_ENTIDAD',vlDESC_TIPO_ENTIDAD,False);

  if vlDESC_TIPO_ENTIDAD = '' then
    vlDESC_TIPO_ENTIDAD := 'ESTADO';

  strTexto := copy(objeto.TXT_COMENTARIO.AsString, 0,254);
  if trim(strTexto) = '' then
    strTexto := 'SIN TEXTO';

  with AcrClon do
  begin
    setID_CALIFICADORA(Objeto.Calificacion.ID_CALIFICADORA.AsString);
    setCVE_TIPO_RIESGO('RIESGO');
    setNOM_ARCHIVO('CARGA MANUAL');
    setDESC_TIPO_ENTIDAD(vlDESC_TIPO_ENTIDAD);
    setNOM_ACRED_CALIF(objeto.Acreditado.Persona.Nombre.AsString);   //ROUY4095 OCT2014 Se homologa con dato NOMPRE PERSONA, como se toma en IntCrReCaAc
//    setNOM_ACRED_CALIF(objeto.Acreditado.NOM_ACRED_REG.AsString);
    setCVE_CALIFICACION(objeto.CVE_CALIFICACION.AsString);
    setTX_CALIFICACION( strTexto );
    setF_CALIFICACION(Objeto.F_CALIFICACION.AsString);
    setH_CALIFICACION(Objeto.FH_CALIFICACION.AsString);
  end;
end;

function TWCrCalAcred.obtEntidad: Smallint;
var
  strSQL, resultado : String;
  index : smallint;
begin
  // Con estO OBTENEMOS el tipo de entidad al que pertenece
  strSQL := '' +
      ' select t3.CVE_ENTIDAD from cr_cal_acred t1 ' +
      '   inner join cr_rel_cal_acre t2 on (t2.id_acreditado = t1.id_acreditado and t2.id_calificadora = t1.id_calificadora) ' +
      '   inner join CR_CAL_TIPO_ENT t3 on (t3.cve_entidad = t2.cve_entidad) ' +
      ' where t1.id_acreditado = ' + Objeto.ID_ACREDITADO.AsString +
      '	  and t2.id_calificadora = ' + Objeto.ID_CALIFICADORA.AsString;

  GetSQLStr(strSQL,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'CVE_ENTIDAD',resultado,False);

  if resultado = 'ES' then
    index := 0
  else if resultado = 'MU' then
    index := 1
  else index := 2;

  Result := index;
end;

end.




{
SELECT SUMA.*, CSBO.DESC_SUB_TIPO
FROM
(SELECT * FROM CRE_SUB_TIP_BCO) CSBO,
(SELECT --CCR.ID_CREDITO,
       CCR.CVE_SUB_TIP_BCO, SUM(IMP_INTERES) IMP_INTERES
       --,SDO_INSOLUTO, IMP_INTERES-SDO_INSOLUTO DIF
FROM
    (SELECT SUM(IMP_INTERES) IMP_INTERES, ID_CREDITO FROM CR_INTERES_02102005@DCORP WHERE ID_CREDITO IN
    (41600,42126,42483,42499,42505,42543,42556,42594,42595,42600,42620,42626,42643,42644,42692,
    42693,42708,42745,42752,42777,42791,42897,42928,42930,42945,42993,43079,43182,43193,43215,
    43261,43282,43285,43286,43308,43312,43313,43337,43356,43363,43386,43411,43412,43413,43416,
    43417,43445,43454,43461,43487,43542,43543,43548,43551,43568,43575,43591,43596,43605,43637,
    43664,43682,43684,43727,43757,43802,43803,43806,43813,43814,43816,42668,43078,43402,43553,43789)
    AND  SIT_INTERES IN ('TI') GROUP BY ID_CREDITO) CCP,
    (SELECT CCR.*, CTO.CVE_SUB_TIP_BCO FROM CR_CREDITO_02102005@DCORP CCR, CRE_CREDITO CC, CRE_CONTRATO CTO
    WHERE CCR.ID_CREDITO IN
    (41600,42126,42483,42499,42505,42543,42556,42594,42595,42600,42620,42626,42643,42644,42692,
    42693,42708,42745,42752,42777,42791,42897,42928,42930,42945,42993,43079,43182,43193,43215,
    43261,43282,43285,43286,43308,43312,43313,43337,43356,43363,43386,43411,43412,43413,43416,
    43417,43445,43454,43461,43487,43542,43543,43548,43551,43568,43575,43591,43596,43605,43637,
    43664,43682,43684,43727,43757,43802,43803,43806,43813,43814,43816,42668,43078,43402,43553,43789)
    AND   CC.ID_CREDITO = CCR.ID_CREDITO
    AND   CTO.ID_CONTRATO = CC.ID_CONTRATO) CCR
WHERE CCP.ID_CREDITO = CCR.ID_CREDITO
AND   F_TRASPASO_VENC IS NULL
GROUP BY CCR.CVE_SUB_TIP_BCO) SUMA
WHERE CSBO.CVE_SUB_TIP_BCO = SUMA.CVE_SUB_TIP_BCO


REPORTE DE COLOCACIÓN DE INTERCREDITOS
SIEMPRES QUE CAMIBA DE 

}
