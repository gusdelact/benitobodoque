// Sistema         : Clase de CR_MET_METODOLOGIA
// Fecha de Inicio : 21/02/2013
// Función forma   : Clase de CR_MET_METODOLOGIA
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : 
// Comentarios     :
Unit IntCrMetMeto;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntParamCre, CheckLst;

Type
  TMetodologiaRelac = class
    Cve_Metodologia: String;
    Descripcion    : String;
  end;

  TCrMetMeto= class;

  TWCrMetMetodologi=Class(TForm)
    InterForma1             : TInterForma;
    Panel1: TPanel;
    lbID_METODOLOGIA: TLabel;
    edID_METODOLOGIA: TEdit;
    lbDESCRIPCION: TLabel;
    edDESCRIPCION: TEdit;
    lbCVES_MET_RELAC: TLabel;
    rdgSIT_METODOLOGIA: TRadioGroup;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    lbNOMBRE: TLabel;
    edNOMBRE: TEdit;
    clbCVES_MET_RELAC: TCheckListBox;
    qMetodologiasRelac: TQuery;
    edCVES_MET_RELAC: TEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure clbCVES_MET_RELACClickCheck(Sender: TObject);
    procedure edCVES_MET_RELACChange(Sender: TObject);
    private
    { Private declarations }
    Estado: String;
    function ObtCvesMetRelac:String;
    function ContieneClave (Cadena, Clave: String):Boolean;
    procedure AsignaMetodologiasRelac;
    public 
    { Public declarations } 
    Objeto : TCrMetMeto;
end; 
 TCrMetMeto= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        ID_METODOLOGIA           : TInterCampo;
        F_VIGENTE_DESDE          : TInterCampo;
        NOMBRE                   : TInterCampo;
        DESCRIPCION              : TInterCampo;
        CVES_MET_RELAC           : TInterCampo;
        SIT_METODOLOGIA          : TInterCampo;
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


constructor TCrMetMeto.Create( AOwner : TComponent ); 
begin Inherited; 
      ID_METODOLOGIA               := CreaCampo('ID_METODOLOGIA',ftFloat,tsNinguno,tsNinguno,True);
      ID_METODOLOGIA  .Caption     := 'Identificador de Metodología';
      NOMBRE                       := CreaCampo('NOMBRE',ftString,tsNinguno,tsNinguno,True);
      NOMBRE          .Caption     := 'Nombre Metodología';
      NOMBRE          .IsRequiered := True;
      DESCRIPCION                  := CreaCampo('DESCRIPCION',ftString,tsNinguno,tsNinguno,True);
      DESCRIPCION     .Caption     := 'Descripción';
      DESCRIPCION     .IsRequiered := True;
      F_VIGENTE_DESDE              := CreaCampo('F_VIGENTE_DESDE',ftDate,tsNinguno,tsNinguno,True);
      F_VIGENTE_DESDE .Caption     := 'Fecha Vigente Desde';
      CVES_MET_RELAC               := CreaCampo('CVES_MET_RELAC',ftString,tsNinguno,tsNinguno,True);
      CVES_MET_RELAC  .Caption     := 'Metodologías Relacionadas';
      CVES_MET_RELAC  .IsRequiered := True;
      SIT_METODOLOGIA              := CreaCampo('SIT_METODOLOGIA',ftString,tsNinguno,tsNinguno,True);
      SIT_METODOLOGIA .Caption     := 'Situación';
      SIT_METODOLOGIA .IsRequiered := True;
      with SIT_METODOLOGIA do
      begin
        Size     := 2;
        UseCombo := True;
        ComboLista.Add ('0');  ComboDatos.Add ('AC');
        ComboLista.Add ('1');  ComboDatos.Add ('IN');
      end;
      CVE_USU_ALTA             := CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_ALTA    .Caption := 'Clave de Usu Alta';
      FH_ALTA                  := CreaCampo('FH_ALTA',ftDateTime,tsNinguno,tsNinguno,True);
      FH_ALTA         .Caption := 'Fecha y Hora Alta';
      CVE_USU_MODIFICA         := CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_MODIFICA.Caption := 'Clave de Usu Modifica';
      FH_MODIFICA              := CreaCampo('FH_MODIFICA',ftDateTime,tsNinguno,tsNinguno,True);
      FH_MODIFICA     .Caption := 'Fecha y Hora Modifica';
      FKeyFields.Add('NOMBRE');

      TableName := 'CR_MET_METODOLOGIA'; 
      UseQuery := True; 
      HelpFile := 'IntCrMetMeto.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrMetMeto.Destroy;
begin inherited;
end;


function TCrMetMeto.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrMetMetodologi;
begin
   W:=TWCrMetMetodologi.Create(Self);
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


Function TCrMetMeto.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrMeMe.it','F');
      Try if Active then begin T.Param(0,ID_METODOLOGIA.AsString); 
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(1)]);
      finally  T.Free;
      end;
end;

function TCrMetMeto.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CR_MET_METODOLOGIA********************)
(*                                                                              *)
(*  FORMA DE CR_MET_METODOLOGIA                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_MET_METODOLOGIA********************)

procedure TWCrMetMetodologi.FormShow(Sender: TObject);
var
  row     : Integer;
  MetRelac: TMetodologiaRelac;
begin
  Objeto.ID_METODOLOGIA  .Control := edID_METODOLOGIA;
  Objeto.NOMBRE          .Control := edNOMBRE;
  Objeto.DESCRIPCION     .Control := edDESCRIPCION;
  Objeto.CVES_MET_RELAC  .Control := edCVES_MET_RELAC;
  Objeto.SIT_METODOLOGIA .Control := rdgSIT_METODOLOGIA;

  //Obtiene los datos para el panel de información que se muestra en la parte inferior de la pantalla
  lbDEmpresa.Caption              := Objeto.ParamCre.EMPRESA.AsString;
  lbDFecha  .Caption              := Objeto.ParamCre.FECHA  .AsString;
  lbDUsuario.Caption              := Objeto.ParamCre.USUARIO.AsString;
  lbDPerfil .Caption              := Objeto.ParamCre.PERFIL .AsString;

  //Oculta el botón Eliminar y recorre los botones Aceptar y Cancelar
  InterForma1.BtnEliminar.Visible := False;
  InterForma1.BtnCancelar.Top     := InterForma1.BtnAceptar .Top;
  InterForma1.BtnAceptar .Top     := InterForma1.BtnEliminar.Top;

  //Carga las Metodologías Relacionadas en el componente CheckListBox
  qMetodologiasRelac.Close;
  qMetodologiasRelac.DatabaseName := Objeto.Apli.DataBaseName;
  qMetodologiasRelac.SessionName  := Objeto.Apli.SessionName;
  qMetodologiasRelac.Open;

  while not qMetodologiasRelac.Eof do
  begin
    MetRelac := TMetodologiaRelac.Create;

    MetRelac.Cve_Metodologia := qMetodologiasRelac.FieldByName ('Cve_Clave').AsString;
    MetRelac.Descripcion     := qMetodologiasRelac.FieldByName ('Desc_Cve').AsString;

    clbCVES_MET_RELAC.Items.AddObject (qMetodologiasRelac.FieldByName ('Desc_Cve').AsString, MetRelac);
    qMetodologiasRelac.Next;
  end;

end;

procedure TWCrMetMetodologi.FormDestroy(Sender: TObject);
begin
      Objeto.ID_METODOLOGIA .Control := nil;
      Objeto.NOMBRE         .Control := nil;
      Objeto.DESCRIPCION    .Control := nil;
      Objeto.CVES_MET_RELAC .Control := nil;
      Objeto.SIT_METODOLOGIA.Control := nil;
end;

procedure TWCrMetMetodologi.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrMetMetodologi.InterForma1DespuesNuevo(Sender: TObject);
var
  n:Integer;
begin
  //Establece la Situación como Activa
  rdgSIT_METODOLOGIA.ItemIndex := 0;

  //Quita la selección a los items del CheckListBox
  For n:=0 to clbCVES_MET_RELAC.Items.Count - 1 do
    clbCVES_MET_RELAC.Checked[n] := False;

  Estado := 'Nuevo';

  //Pone el focus en el primer campo a capturar
  edNOMBRE.SetFocus;
end;

procedure TWCrMetMetodologi.InterForma1DespuesModificar(Sender: TObject);
begin
  //Inhabilita el campo Nombre Metodología y cambia el color de este
  edNOMBRE.ReadOnly := True;
  edNOMBRE.Color    := clBtnFace;

  Estado := 'Modificar';
end;

procedure TWCrMetMetodologi.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
  //Asigna las Claves de Metodologías Relacionadas
  Objeto.CVES_MET_RELAC.AsString       := ObtCvesMetRelac;

  if Estado = 'Nuevo' then
  begin
    Objeto.CVE_USU_ALTA.AsString       := Objeto.Apli.Usuario;
    Objeto.FH_ALTA     .AsDateTime     := Now;
  end
  else if Estado = 'Modificar' then
  begin
    Objeto.CVE_USU_MODIFICA.AsString   := Objeto.Apli.Usuario;
    Objeto.FH_MODIFICA     .AsDateTime := Now;
  end;
end;

function TWCrMetMetodologi.ObtCvesMetRelac:String;
var
  n       : integer;
  MetRelac: TMetodologiaRelac;
begin
  result := '';

  For n:=0 to clbCVES_MET_RELAC.Items.Count - 1 do
    if clbCVES_MET_RELAC.Checked [n] then
    begin
      MetRelac := TMetodologiaRelac (clbCVES_MET_RELAC.Items.Objects[n]);
      result := result + ',' + MetRelac.Cve_Metodologia;
    end;

  if Length (result) > 0 then
    Delete (result, 1, 1);
end;

function TWCrMetMetodologi.ContieneClave (Cadena, Clave: String):Boolean;
begin
  result := Pos (',' + Clave + ',', ',' + Cadena + ',') > 0;
end;

procedure TWCrMetMetodologi.AsignaMetodologiasRelac;
var
  n: Integer;
  MetRelac: TMetodologiaRelac;
begin
  if Objeto.CVES_MET_RELAC.AsString <> '' then
  begin
    for n:=0 to clbCVES_MET_RELAC.Items.Count -1 do
    begin
      MetRelac := TMetodologiaRelac (clbCVES_MET_RELAC.Items.Objects[n]);
      if ContieneClave (Objeto.CVES_MET_RELAC.AsString, MetRelac.Cve_Metodologia) then
        clbCVES_MET_RELAC.Checked[n] := True
      else
        clbCVES_MET_RELAC.Checked[n] := False;
    end;
  end
  else
  begin
    for n:=0 to clbCVES_MET_RELAC.Items.Count -1 do
    begin
      clbCVES_MET_RELAC.Checked[n] := False;
    end;
  end;
end;

procedure TWCrMetMetodologi.clbCVES_MET_RELACClickCheck(Sender: TObject);
begin
  Objeto.CVES_MET_RELAC.AsString := ObtCvesMetRelac;
end;

procedure TWCrMetMetodologi.edCVES_MET_RELACChange(Sender: TObject);
begin
  AsignaMetodologiasRelac;
end;

end.
