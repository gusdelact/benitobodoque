// Sistema         : Clase de Tipo de Contratantes
// Fecha de Inicio : Noviembre de 1997
// Función forma   : Clase de Tipo de Contratante
// Desarrollo por  : Victor Martinez, Alberto Ramirez, Julio Ruiloba
// Comentarios     :
unit IntTCtte;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun;

type

  TTipoCTTE= Class;
  TWTipoCtte= class(TForm)
    InterForma1    : TInterForma;
    lbICveSemento: TLabel;
    EdCveContratante: TEdit;
    lbDescSegmento: TLabel;
    EdContratante: TEdit;
    btReporte: TBitBtn;
    chBMovtoEfvo: TCheckBox;
    cboCveRolPld: TComboBox;
    Label1: TLabel;
    cbBValCtte: TCheckBox;
    cbBValPuesto: TCheckBox;
    cbBVerCtte: TCheckBox;
    Label2: TLabel;
    edCveRolCorpo: TEdit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btReporteClick(Sender: TObject);
    procedure cbBValCtteClick(Sender: TObject);
    procedure cbBVerCtteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Objeto:TTipoCTTE;
  end;

  TTipoCTTE= class(TInterFrame)
  private
    FContrato:TInterFrame;

  protected
    Procedure SetContrato(Cto:TInterFrame);
  public
    { Public declarations }
    Cve_Contratante  : TInterCampo;
    Desc_Contratante : TInterCampo;
    B_Movto_Efvo     : TInterCampo;
    Cve_Rol_Pld      : TInterCampo;

    // CZR 09-sep-2013
    B_Val_Ctte       : TInterCampo;
    B_Ver_Ctte       : TInterCampo;
    B_Val_Puesto     : TInterCampo;

    {RAPA4293 10Mar2014 CveRol en los nuevos sistemas PCORPO.Rol.Cve_Rol}
    CveRolCorpo: TInterCampo;

    Function InternalBusca : Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor Destroy; override;
    Function ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    function  Reporte:Boolean; override;
  published
    Property Contrato:TInterFrame Read FContrato Write SetContrato;
  end;

implementation

Uses RepTCtte;
{$R *.DFM}

constructor TTipoCtte.Create( AOwner : TComponent );
begin Inherited;
    Cve_Contratante:= CreaCampo('CVE_CONTRATANTE',ftString,tsNinguno,tsNinguno,True);
    Cve_Contratante.Size:=4;
    Desc_Contratante:= CreaCampo('DESC_CONTRATANTE',ftString,tsNinguno,tsNinguno,True);
    B_Movto_Efvo:= CreaCampo('B_MOVTO_EFVO',ftString,tsNinguno,tsNinguno,True);
    B_Movto_Efvo.Size:= 1;
    Cve_Rol_Pld   := CreaCampo('CVE_ROL_PLD', ftString, tsNinguno, tsNinguno, True);
    With Cve_Rol_Pld DO
    Begin
      Size := 2;
      UseCombo := True;
      ComboLista.Add('Sin Rol');              ComboDatos.Add('SR');
      ComboLista.Add('Titular');              ComboDatos.Add('TI');
      ComboLista.Add('Cotitular');            ComboDatos.Add('CO');
      ComboLista.Add('Proveedor Recursos');   ComboDatos.Add('PR');
      ComboLista.Add('Fondo de Terceros');    ComboDatos.Add('FT');
    End;
    // CZR 09-sep-2013
    B_Val_Ctte    := CreaCampo('B_VAL_CTTE',   ftString, tsNinguno, tsNinguno, True);
    B_Ver_Ctte    := CreaCampo('B_VER_CTTE',   ftString, tsNinguno, tsNinguno, True);
    B_Val_Puesto  := CreaCampo('B_VAL_PUESTO', ftString, tsNinguno, tsNinguno, True);

    {RAPA4293 10Mar2014 CveRol en los nuevos sistemas PCORPO.Rol.Cve_Rol}
    cveRolCorpo:= CreaCampo('CVE_ROL_CORPO', ftString, tsNinguno, tsNinguno, True);
    cveRolCorpo.IsRequiered:= true;

    FActive := False;
    FKeyFields.Add('CVE_CONTRATANTE');
    TableName := 'TIPO_CONTRATANTE';
    UseQuery := True;
    HelpFile := 'IntTCtte.hlp';
    ShowMenuReporte:=True;
    FContrato:=nil;
    IsCorp:=True;
end;

destructor TTipoCtte.Destroy;
begin inherited;
end;

Procedure TTipoCtte.SetContrato(Cto:TInterFrame);
begin FContrato:=Cto;
end;

Function TTipoCtte.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWTipoCtte;
begin
   W:=TWTipoCtte.Create(Self);
   try
      W.Objeto                    := Self;
      W.InterForma1.InterFrame    := Self;
      W.InterForma1.FormaTipo     := FormaTipo;
      W.InterForma1.ShowBtnAyuda  := False;
      W.InterForma1.ShowGrid      := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion       := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow                  := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

Function TTipoCtte.InternalBusca:Boolean;
Var T:TInterFindit;
begin
   InternalBusca := False;
   T:=CreaBuscador('IntTCtte.it','S,S');
   try
      if Active then T.Param(0,Cve_Contratante.AsString);
      if Contrato<>nil then
         begin
         	T.WhereString:=
            	'CVE_CONTRATANTE IN ('+
               ' SELECT'+
               '   CVE_CONTRATANTE'+
               ' FROM'+
               '   REQ_PROD_CTTE'+
               ' WHERE'+
               '   ID_EMPRESA='+Contrato.FieldByName('ID_EMPRESA').AsString+
               '   AND CVE_PRODUCTO='''+Contrato.FieldByName('CVE_PRODUCTO').AsString+''''+
               '   AND Req_Prod_Ctte.Cve_Concep_Ctte = '''+ Contrato.FieldByName('CVE_CONCEP_CTO').asString +''')';
         end;
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0)]);
      {end-if}
      finally
         T.Free;
      end;
end;

function TTipoCtte.Reporte:Boolean;
begin Execute_RepTCtte(True,Self);
end;

(***********************************************FORMA DE Tipo de Contratante*****)
(*                                                                              *)
(*  Tipo de Contratante                                                         *)
(*                                                                              *)
(***********************************************FORMA DE Tipo de Contratante*****)

procedure TWTipoCtte.FormShow(Sender: TObject);
begin
   with Objeto do
   begin
      Cve_Contratante.Control  := EdCveContratante;
      Desc_Contratante.Control := EdContratante;
      B_Movto_Efvo.Control     := chBMovtoEfvo;
      Cve_Rol_Pld.Control      := cboCveRolPld;
      // CZR 09-sep-2013
      B_Val_Ctte.Control       := cbBValCtte;
      B_Ver_Ctte.Control       := cbBVerCtte;
      B_Val_Puesto.Control     := cbBValPuesto;

      {RAPA4293 10Mar2014 CveRol en los nuevos sistemas PCORPO.Rol.Cve_Rol}
      cveRolCorpo.Control:= edCveRolCorpo;
   end;
end;

procedure TWTipoCtte.FormDestroy(Sender: TObject);
begin
   with Objeto do
   begin
      Cve_Contratante.Control  := nil;
      Desc_Contratante.Control := nil;
      B_Movto_Efvo.Control     := nil;
      Cve_Rol_Pld.Control      := nil;
      // CZR 09-sep-2013
      B_Val_Ctte.Control       := nil;
      B_Ver_Ctte.Control       := nil;
      B_Val_Puesto.Control     := nil;

      {RAPA4293 10Mar2014 CveRol en los nuevos sistemas PCORPO.Rol.Cve_Rol}
      cveRolCorpo.Control:= nil;
   end;
end;

procedure TWTipoCtte.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWTipoCtte.InterForma1DespuesNuevo(Sender: TObject);
begin edCveContratante.SetFocus;
end;

procedure TWTipoCtte.InterForma1DespuesModificar(Sender: TObject);
begin edContratante.SetFocus;
end;

procedure TWTipoCtte.btReporteClick(Sender: TObject);
begin Objeto.Reporte;
end;

procedure TWTipoCtte.cbBValCtteClick(Sender: TObject);
begin
   cbBVerCtte.Checked := not(cbBValCtte.Checked); // CZR 20-sep-2013
end;

procedure TWTipoCtte.cbBVerCtteClick(Sender: TObject);
begin
   cbBValCtte.Checked := not(cbBVerCtte.Checked); // CZR 20-sep-2013
end;
end.

