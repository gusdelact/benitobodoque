// Sistema         : Clase de CR_FORMATO_NAF
// Fecha de Inicio : 27/01/2004
// Función forma   : Clase de CR_FORMATO_NAF
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCrFrmtNaf;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk;

Type
  TCrFrmtNaf= class;

  TWCrFrmtNaf=Class(TForm)
    InterForma1             : TInterForma;
    lbDESC_C_FORMATO: TLabel;
    edDESC_C_FORMATO: TEdit;
    lbDESC_L_FORMATO: TLabel;
    edDESC_L_FORMATO: TEdit;
    edCVE_FORMATO_NAF: TEdit;
    lbCVE_FORMATO_NAF: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
  private
  public
    Objeto : TCrFrmtNaf;
  end;
  //
  TCrFrmtNaf= class(TInterFrame)
  private
  protected
  public
    { Public declarations }
    CVE_FORMATO_NAF          : TInterCampo;
    DESC_C_FORMATO           : TInterCampo;
    DESC_L_FORMATO           : TInterCampo;
    function    InternalBusca : Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
  published
  end;



implementation


{$R *.DFM}


constructor TCrFrmtNaf.Create( AOwner : TComponent ); 
begin
  Inherited;
  CVE_FORMATO_NAF := CreaCampo( 'CVE_FORMATO_NAF', ftString, tsNinguno, tsNinguno, True );
  DESC_C_FORMATO  := CreaCampo( 'DESC_C_FORMATO',  ftString, tsNinguno, tsNinguno, True );
  DESC_L_FORMATO  := CreaCampo( 'DESC_L_FORMATO',  ftString, tsNinguno, tsNinguno, True );
  //
  CVE_FORMATO_NAF.Caption := 'Formato de Nafin';
  DESC_C_FORMATO.Caption  := 'Descripción Corta del Formato de NAFIN';
  DESC_L_FORMATO.Caption  := 'Descripción Larga del Formato de NAFIN';

  FKeyFields.Add('CVE_FORMATO_NAF');

  TableName := 'CR_FORMATO_NAF';
  UseQuery := True;
  HelpFile := 'InTCrFrmtNaf.Hlp';
  ShowMenuReporte:=True;

end;

Destructor TCrFrmtNaf.Destroy;
begin
  inherited;
end;


function TCrFrmtNaf.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrFrmtNaf;
begin
   W:=TWCrFrmtNaf.Create(Self);
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


Function TCrFrmtNaf.InternalBusca:Boolean;
var T : TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('IcrFmtNf.it','S');
  Try
    if Active then begin T.Param(0,CVE_FORMATO_NAF.AsString); end;
    if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
  finally
    T.Free;
  end;
end;



(***********************************************FORMA CR_FORMATO_NAF********************)
(*                                                                              *)
(*  FORMA DE CR_FORMATO_NAF                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_FORMATO_NAF********************)

procedure TWCrFrmtNaf.FormShow(Sender: TObject);
begin
  Objeto.CVE_FORMATO_NAF.Control := edCVE_FORMATO_NAF;
  Objeto.DESC_C_FORMATO.Control  := edDESC_C_FORMATO;
  Objeto.DESC_L_FORMATO.Control  := edDESC_L_FORMATO;
end;

procedure TWCrFrmtNaf.FormDestroy(Sender: TObject);
begin
  Objeto.CVE_FORMATO_NAF.Control := nil;
  Objeto.DESC_C_FORMATO.Control  := nil;
  Objeto.DESC_L_FORMATO.Control  := nil;
end;

procedure TWCrFrmtNaf.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
