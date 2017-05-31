// Sistema         : Clase de Empresas
// Fecha de Inicio : Noviembre de 1997
// Función forma   : Clase de Requisito
// Desarrollo por  : Victor Martinez
// Comentarios     :
unit IntEmpre;
interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind,UnSQL2, InterFun, ComCtrls, DBCtrls, Menus, IntPers,
  IntMPers, IntDtPk;
type
  TEmpresa= Class;
  TWEmpresa = class(TForm)
    InterForma1    : TInterForma;
    Panel1         : TPanel;
    lbICveRequisito: TLabel;
    EdIdEmpresa: TEdit;
    BitBtn1: TBitBtn;
    chBBloqueoGral: TCheckBox;
    GroupBox1: TGroupBox;
    edFIniMesAct: TEdit;
    edFFinMesAct: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    edFIniMesAnt: TEdit;
    edFFinMesAnt: TEdit;
    Label5: TLabel;
    edFAyer: TEdit;
    edNombreRepresentante: TEdit;
    Label6: TLabel;
    edIDRepresentante: TEdit;
    edNombreEmpresa: TEdit;
    GroupBox3: TGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Button1: TButton;
    Logotipo: TDBImage;
    PopupEmpresa: TPopupMenu;
    PopupRepresentante: TPopupMenu;
    Catlogo1: TMenuItem;
    Catlogo2: TMenuItem;
    chBFechaAct: TCheckBox;
    MacvDatePicker3: MacvDatePicker;
    MacvDatePicker4: MacvDatePicker;
    MacvDatePicker1: MacvDatePicker;
    MacvDatePicker2: MacvDatePicker;
    MacvDatePicker5: MacvDatePicker;
    chb_SocInv: TCheckBox;
    chb_Aplica_Isr: TCheckBox;
    chb_Aplica_Iva: TCheckBox;
    chB_Cierre_Auto: TCheckBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Catlogo1Click(Sender: TObject);
    procedure Catlogo2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private { Private declarations }
  public  { Public declarations }
    Objeto: TEmpresa;
  end;

  TEmpresa= class(TInterFrame)
  private
  protected
  public { Public declarations }
    ID_Empresa           : TInterCampo;
    B_Bloqueo_Gral       : TInterCampo;
    F_Ayer               : TInterCampo;
    F_Fin_Mes_Act        : TInterCampo;
    F_Fin_Mes_Ant        : TInterCampo;
    F_Ini_Mes_Act        : TInterCampo;
    F_Ini_Mes_Ant        : TInterCampo;
    ID_Representante     : TInterCampo;
    IM_Logo_empresa      : TInterCampo;
    B_Fecha_Act          : TInterCampo;
	 B_SOCINV             : TInterCampo;
	 B_APLICA_ISR         : TInterCampo;
	 B_APLICA_IVA         : TInterCampo;
	 B_CIERRE_AUTO        : TInterCampo;
    PersonaMoral         :TMPersona;
    Representante        :TMPersona;

    Function    InternalLocaliza:Boolean; override;
    function    InternalBusca : Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    function    Reporte:Boolean; override;
//  Procedure   DataBaseChange; Override;
  published
  end;

implementation
Uses RepEmpre, IntAuxEmp;
{$R *.DFM}

Constructor TEmpresa.Create( AOwner : TComponent );
begin Inherited;
      ID_Empresa       :=CreaCampo('ID_EMPRESA',ftInteger,tsNinguno,tsNinguno,True);
      B_Bloqueo_Gral   :=CreaCampo('B_BLOQUEO_GRAL',ftString,tsNinguno,tsNinguno,True);
      B_Bloqueo_Gral.Size:=1;
      B_Fecha_Act:=CreaCampo('B_FECHA_ACT',ftString,tsNinguno,tsNinguno,True);
      B_Fecha_Act.Size:=1;
      F_Ayer           :=CreaCampo('F_AYER',ftDate,tsNinguno,tsNinguno,True);
      F_Fin_Mes_Act    :=CreaCampo('F_FIN_MES_ACT',ftDate,tsNinguno,tsNinguno,True);
      F_Fin_Mes_Ant    :=CreaCampo('F_FIN_MES_ANT',ftDate,tsNinguno,tsNinguno,True);
      F_Ini_Mes_Act    :=CreaCampo('F_INI_MES_ACT',ftDate,tsNinguno,tsNinguno,True);
      F_Ini_Mes_Ant    :=CreaCampo('F_INI_MES_ANT',ftDate,tsNinguno,tsNinguno,True);
      ID_Representante :=CreaCampo('ID_REPRESENTANTE',ftInteger,tsNinguno,tsNinguno,True);
      IM_Logo_empresa  :=CreaCampo('IM_LOGO_EMPRESA',ftGraphic,tsNinguno,tsNinguno,True);
      IM_Logo_Empresa.NoCompare:=True;
      IM_Logo_Empresa.NoSave:=True;

      B_SOCINV:= CreaCampo('B_SOCINV',ftString,tsNinguno,tsNinguno,True);
      B_APLICA_ISR:= CreaCampo('B_APLICA_ISR',ftString,tsNinguno,tsNinguno,True);
      B_APLICA_IVA:= CreaCampo('B_APLICA_IVA',ftString,tsNinguno,tsNinguno,True);
      B_CIERRE_AUTO:= CreaCampo('B_CIERRE_AUTO',ftString,tsNinguno,tsNinguno,True);

      FActive := False;
      FKeyFields.Add('ID_EMPRESA');
      TableName := 'EMPRESA';
      UseQuery := True;
      HelpFile := 'IntEmpre.hlp';
      ShowMenuReporte:=True;
      PersonaMoral:=TMPersona.Create(Self);
      PersonaMoral.FilterBy:=fbTMPersonaMoral;
      PersonaMoral.MasterSource:=Self;
      PersonaMoral.FieldByName('ID_PERSONA').MasterField:='ID_EMPRESA';

      Representante:=TMPersona.Create(Self);
      Representante.FilterBy:=fbTMPersonaFisica;
      Representante.MasterSource:=Self;
      Representante.FieldByName('ID_PERSONA').MasterField:='ID_REPRESENTANTE';
      IsCorp:=True;
end;

Destructor TEmpresa.Destroy;
begin if PersonaMoral<>nil then PersonaMoral.Free;
      if Representante<>nil then Representante.Free;
      inherited;
end;

(*
Procedure TEmpresa.DataBaseChange;
begin //Importante para poder Cambiar de Base de Datos.
      PersonaMoral.GetParams(Self);
      Representante.GetParams(Self);
end;
*)


Function TEmpresa.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W:TWEmpresa;
begin W:=TWEmpresa.Create(Self);
      try W.Objeto:= Self;
          W.InterForma1.InterFrame:=Self;
          W.InterForma1.FormaTipo := FormaTipo;
          W.InterForma1.ShowGrid := False;
          W.InterForma1.ShowNavigator := False;
          W.InterForma1.Funcion := FInterFun;
          W.InterForma1.ShowModal;
          ShowWindow := W.InterForma1.ModalResult;
      finally W.Free;
      end;
end;

Function TEmpresa.InternalLocaliza:Boolean;
begin FInternalDataSource.DataSet:=FQuery;
end;

Function TEmpresa.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T:=CreaBuscador('IntEmpre.it','S,S');
      T.CamposResultado:='';
      try if Active=True then T.Param(0,ID_EMPRESA.AsString);
          if T.Execute then
          begin InternalBusca:=FindKey([T.DameCampo(0)]);
          end;
      finally T.Free;
      end; {end-try}
      InternalBusca := True;
end;

function TEmpresa.Reporte:Boolean;
begin Execute_RepEmpre(True,Self);
end;
(***********************************************FORMA DE Empresa  ***************)
(*                                                                              *)
(*  FORMA DE EMPRESA                                                            *)
(*                                                                              *)
(***********************************************FORMA DE Empresa  ***************)
procedure TWEmpresa.FormShow(Sender: TObject);
begin Objeto.ID_Empresa.Control      :=edIDEmpresa;
      Objeto.B_Bloqueo_Gral.Control  :=chBBloqueoGral;
      Objeto.B_Fecha_Act.Control     :=chBFechaAct;
      Objeto.F_Ayer.Control          :=edFAyer;
      Objeto.F_Fin_Mes_Act.Control   :=edFFinMesAct;
      Objeto.F_Fin_Mes_Ant.Control   :=edFFinMesAnt;
      Objeto.F_Ini_Mes_Act.Control   :=edFIniMesAct;
      Objeto.F_Ini_Mes_Ant.Control   :=edFIniMesAnt;
      Objeto.ID_Representante.Control:=edIDRepresentante;
      Objeto.IM_Logo_empresa.Control :=Logotipo;
      Objeto.B_SOCINV.Control:= chb_SocInv;
      Objeto.B_APLICA_ISR.Control:= chb_Aplica_Isr;
      Objeto.B_APLICA_IVA.Control:= chb_Aplica_Iva;
      Objeto.B_CIERRE_AUTO.Control:= chB_Cierre_Auto;


      Objeto.PersonaMoral.Nombre.Control:=edNombreEmpresa;
      Objeto.PersonaMoral.MasterSourceEditControl:=SpeedButton1;
      Objeto.Representante.Nombre.Control:=edNombreRepresentante;
      Objeto.Representante.MasterSourceEditControl:=SpeedButton2;
end;

procedure TWEmpresa.FormDestroy(Sender: TObject);
begin Objeto.ID_Empresa.Control      :=nil;
      Objeto.B_Bloqueo_Gral.Control  :=nil;
      Objeto.B_Fecha_Act.Control     :=nil;
      Objeto.F_Ayer.Control          :=nil;
      Objeto.F_Fin_Mes_Act.Control   :=nil;
      Objeto.F_Fin_Mes_Ant.Control   :=nil;
      Objeto.F_Ini_Mes_Act.Control   :=nil;
      Objeto.F_Ini_Mes_Ant.Control   :=nil;
      Objeto.ID_Representante.Control:=nil;
      Objeto.IM_Logo_empresa.Control :=nil;
      Objeto.B_SOCINV.Control:= nil;
      Objeto.B_APLICA_ISR.Control:= nil;
      Objeto.B_APLICA_IVA.Control:= nil;
      Objeto.B_CIERRE_AUTO.Control:= nil;

      Objeto.PersonaMoral.Nombre.Control:=nil;
      Objeto.Representante.Nombre.Control:=nil;
      Logotipo.DataSource:= nil;
      Logotipo.DataField:='';
end;

procedure TWEmpresa.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWEmpresa.InterForma1DespuesNuevo(Sender: TObject);
begin edNombreEmpresa.SetFocus;
      Objeto.B_Bloqueo_Gral.AsString:='F';
      Objeto.B_Fecha_Act.AsString:='F';
end;

procedure TWEmpresa.InterForma1DespuesModificar(Sender: TObject);
begin edNombreRepresentante.SetFocus;
end;

procedure TWEmpresa.BitBtn1Click(Sender: TObject);
begin
  If Objeto.ValidaAccesoEsp('EMP_REPORTE',True,True) Then
  Begin
    Objeto.Reporte;
  End;
end;

procedure TWEmpresa.SpeedButton1Click(Sender: TObject);
begin
  If Objeto.ValidaAccesoEsp('EMP_IDEMP',True,True) Then
  Begin
    Objeto.PersonaMoral.Busca;
  End;
end;

procedure TWEmpresa.SpeedButton2Click(Sender: TObject);
begin
  If Objeto.ValidaAccesoEsp('EMP_REPRESENTE',True,True) Then
  Begin
    Objeto.Representante.Busca;
  End;
end;

procedure TWEmpresa.Catlogo1Click(Sender: TObject);
begin Objeto.PersonaMoral.Catalogo;
end;

procedure TWEmpresa.Catlogo2Click(Sender: TObject);
begin Objeto.Representante.Catalogo;
end;

procedure TWEmpresa.Button1Click(Sender: TObject);
begin
  If Objeto.ValidaAccesoEsp('EMP_MODIF',True,True) Then
  Begin
    ModificaLogoEmpresa(Objeto);
  End;
end;



end.



