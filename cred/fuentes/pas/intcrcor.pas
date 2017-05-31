unit IntCrCoR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, db,
  InterFor, StdCtrls, ExtCtrls, Menus, Buttons, UnSql2, IntFrm,ComCtrls, IntCrCre,
  UCRPE32, IntCrCoo;

type
  TCrCoR = class;

  TwCrCoR = class(TForm)
    InterForma1: TInterForma;
    rgSIT_LINEA: TRadioGroup;
    rgRango: TRadioGroup;
    gbAutorizacion: TGroupBox;
    lbIdContrato1: TLabel;
    lbIdContrato2: TLabel;
    sbIdContrato2: TBitBtn;
    sbIdContrato1: TBitBtn;
    edIdContrato2: TEdit;
    edIdContrato1: TEdit;
    procedure InterForma1Preview(Sender: TObject);
    procedure InterForma1Imprimir(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure rgRangoClick(Sender: TObject);
    procedure sbIdContrato1Click(Sender: TObject);
    procedure sbIdContrato2Click(Sender: TObject);
    procedure rgSIT_LINEAClick(Sender: TObject);
  private
    { Private declarations }
  protected
  public
    { Public declarations }
      Objeto: TCrCoR;
      procedure Impresion(Preview: Boolean);
  end;

  TCrCoR = class(TInterFrame)
  private
  public
    RANGO        :  TInterCampo;
    ID_CONTRATO1 :  TInterCampo;
    ID_CONTRATO2 :  TInterCampo;
    CreContrato1 :  TCrCoo;
    CreContrato2 :  TCrCoo;
    SIT_LINEA    :  TInterCampo;

    Constructor Create( AOwner: TComponent); override;
    Destructor  Destroy; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    procedure   DatabaseChange; override;
  end;

var wCrCoR: TwCrCoR;

implementation

Uses RepCrCoR;

{$R *.DFM}


Constructor TCrCoR.Create( AOwner: TComponent);
begin
  inherited;

  SIT_LINEA := CreaCampo('SIT_LINEA',ftString,tsNinguno,tsNinguno,False);
  with SIT_LINEA do
    begin
      Size:=2;
      UseCombo:=True;
      ComboLista.Add('0');  ComboDatos.Add('TO');
      ComboLista.Add('1');  ComboDatos.Add('AC');
      ComboLista.Add('2');  ComboDatos.Add('LQ');
      Caption:='Situacion de Lineas';
      end;
  RANGO := CreaCampo('RANGO',ftString,tsNinguno,tsNinguno,False);
  with RANGO do
    begin
      Size:=2;
      UseCombo:=True;
      ComboLista.Add('0');  ComboDatos.Add('GL');
      ComboLista.Add('1');  ComboDatos.Add('ES');
      Caption:='Rango de Impresion';
      end;
  ID_CONTRATO1 := CreaCampo('ID_CONTRATO1',ftinteger,tsNinguno,tsNinguno,False);
  ID_CONTRATO2 := CreaCampo('ID_CONTRATO2',ftinteger,tsNinguno,tsNinguno,False);

  CreContrato1 := TCrCoo.Create(Self);
  CreContrato2 := TCrCoo.Create(Self);
end;

destructor TCrCoR.Destroy;
begin
  if CreContrato1 <> nil then CreContrato1.Free;
  if CreContrato2 <> nil then CreContrato2.Free;
  inherited;
end;

procedure TCrCoR.DatabaseChange;
begin
  inherited;
  CreContrato1.GetParams(Self);
  CreContrato2.GetParams(Self);
end;


Function TCrCoR.ShowWindow(FormaTipo : TFormaTipo) : Integer;
var   W: TWCrCoR;
begin W:= TWCrCoR.Create(self);
      try
         W.Objeto := Self;
         w.InterForma1.CentrarForma := True;
         W.InterForma1.FormaTipo := ftImprimir;
         W.InterForma1.Funcion := FInterFun;
         W.InterForma1.ShowModal;
         ShowWindow := W.InterForma1.ModalResult;
      finally W.Free;
      end;
end;

procedure TwCrCoR.FormShow(Sender: TObject);
begin
  Objeto.SIT_LINEA.Control := rgSIT_LINEA;
  Objeto.RANGO.Control := rgRango;
  Objeto.CreContrato1.ID_CONTRATO.Control := edIdContrato1;
  Objeto.CreContrato2.ID_CONTRATO.Control := edIdContrato2;
end;

procedure TwCrCoR.FormHide(Sender: TObject);
begin
  Objeto.SIT_LINEA.Control := nil;
  Objeto.RANGO.Control := nil;
  Objeto.CreContrato1.ID_CONTRATO.Control := nil;
  Objeto.CreContrato2.ID_CONTRATO.Control := nil;
end;

procedure TwCrCoR.Impresion(Preview: Boolean);
begin
  if Objeto.CreContrato1.Active then
    Objeto.ID_CONTRATO1.AsInteger := Objeto.CreContrato1.ID_CONTRATO.AsInteger;
  if Objeto.CreContrato2.Active then
    Objeto.ID_CONTRATO2.AsInteger := Objeto.CreContrato2.ID_CONTRATO.AsInteger;
  Execute_RepCrCoR(Preview, Objeto);
end;
{
var
  SQL : TStrings;
begin
//  Execute_RepCred(Objeto, Preview);
  if Objeto.CreContrato1.Active then
    Objeto.ID_CONTRATO1.AsInteger := Objeto.CreContrato1.ID_CONTRATO.AsInteger;
  if Objeto.CreContrato2.Active then
    Objeto.ID_CONTRATO2.AsInteger := Objeto.CreContrato2.ID_CONTRATO.AsInteger;

  rAutCred.SQL.Query.Clear;
  with rAutCred do
    begin
      SQLQuery.Add('SELECT ');
      SQLQuery.Add('PERSONA."NOMBRE", ');
      SQLQuery.Add('CONTRATO."ID_CONTRATO", CONTRATO."CVE_TIP_CONTRATO", ');
      SQLQuery.Add('CRE_CONTRATO."B_EVENTUAL", CRE_CONTRATO."B_REVOLVENTE", CRE_CONTRATO."DIAS_PLAZO", CRE_CONTRATO."F_AUT_COMITE", CRE_CONTRATO."IMP_AUTORIZADO", CRE_CONTRATO."IMP_DISPUESTO", CRE_CONTRATO."IMP_TRANSITO", CRE_CONTRATO."SIT_LINEA", ');
      SQLQuery.Add('MONEDA."DESC_MONEDA", ');
      SQLQuery.Add('CRE_SUB_TIP_BCO."DESC_SUB_TIPO" ');
      SQLQuery.Add('FROM ');
      SQLQuery.Add('"ADMIPROD"."PERSONA" PERSONA, ');
      SQLQuery.Add('"ADMIPROD"."CONTRATO" CONTRATO, ');
      SQLQuery.Add('"ADMIPROD"."CRE_CONTRATO" CRE_CONTRATO, ');
      SQLQuery.Add('"ADMIPROD"."MONEDA" MONEDA, ');
      SQLQuery.Add('"ADMIPROD"."CRE_SUB_TIP_BCO" CRE_SUB_TIP_BCO ');
      SQLQuery.Add('WHERE ');
      SQLQuery.Add('PERSONA."ID_PERSONA" = CONTRATO."ID_TITULAR" AND ');
      SQLQuery.Add('CONTRATO."ID_CONTRATO" = CRE_CONTRATO."ID_CONTRATO" AND ');
      SQLQuery.Add('CONTRATO."CVE_MONEDA" = MONEDA."CVE_MONEDA" AND ');
      SQLQuery.Add('CRE_CONTRATO."CVE_SUB_TIP_BCO" = CRE_SUB_TIP_BCO."CVE_SUB_TIP_BCO" ');
      if (Objeto.SIT_LINEA.AsString = 'AC') or (Objeto.SIT_LINEA.AsString = 'LQ') then
        SQLQuery.Add(' AND CRE_CONTRATO."SIT_LINEA" ='''+ Objeto.SIT_LINEA.AsString +''' ');
      if (Objeto.RANGO.AsString = 'ES') then
        begin
          SQLQuery.Add(' AND CONTRATO."ID_CONTRATO" >= ' + Objeto.ID_CONTRATO1.AsSQL + ' ');
          SQLQuery.add(' AND CONTRATO."ID_CONTRATO" <= ' + Objeto.ID_CONTRATO2.AsSQL + ' ');
        end;
      SQLQuery.Add('ORDER BY ');
      SQLQuery.Add('MONEDA."DESC_MONEDA" ASC, ');
      SQLQuery.Add('PERSONA."NOMBRE" ASC');
    end;
  rAutCred.Connect := 'DSN=PCORP; UID='+dmMain.apMain.getDbUser('CORP')+'; PWD='+dmMain.apMain.getDbPass('CORP')+'';
  rAutCred.Execute;
end;
}

procedure TwCrCoR.InterForma1Preview(Sender: TObject);
begin
  Impresion(True);
end;

procedure TwCrCoR.InterForma1Imprimir(Sender: TObject);
begin
  Impresion(False);
end;

procedure TwCrCoR.rgRangoClick(Sender: TObject);
begin
  Objeto.RANGO.GetFromControl;
  sbIdContrato1.Enabled := (rgRango.ItemIndex = 1);
  sbIdContrato2.Enabled := (rgRango.ItemIndex = 1);
end;

procedure TwCrCoR.sbIdContrato1Click(Sender: TObject);
begin
  if Objeto.CreContrato1.Busca then
        Objeto.CreContrato2.FindKey([Objeto.CreContrato1.ID_CONTRATO.AsInteger]);
end;

procedure TwCrCoR.sbIdContrato2Click(Sender: TObject);
begin
  Objeto.CreContrato2.Busca;
end;

procedure TwCrCoR.rgSIT_LINEAClick(Sender: TObject);
begin
  Objeto.SIT_LINEA.GetFromControl;
end;




end.
