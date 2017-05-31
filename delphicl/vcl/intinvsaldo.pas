// Sistema         : Clase de INV_SALDO
// Fecha de Inicio : 28/06/1999
// Función forma   : Clase de INV_SALDO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Marcos Zarate Castro
// Comentarios     :
Unit IntInvSaldo;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, intgpoinv, IntCtoHeader;

Type
 TInvSaldo= class;

  TWInvSaldo=Class(TForm)
    InterForma1             : TInterForma;
    lbCTO_REF_ORIGEN : TLabel; 
    edCTO_REF_ORIGEN : TEdit;
    lbFOLIO_GRUPO : TLabel; 
    edFOLIO_GRUPO : TEdit;
    btGrupo: TBitBtn;
    edDescGrupo: TEdit;
    bbCtoRefer: TBitBtn;
    edNomCtoRefer: TEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure btGrupoClick(Sender: TObject);
    procedure bbCtoReferClick(Sender: TObject);
    private 
    { Private declarations } 
    public
    { Public declarations } 
    Objeto : TInvSaldo;
end;
 TInvSaldo= class(TInterFrame) 
      private 
      protected

      public
        { Public declarations }
        ID_CONTRATO              : TInterCampo;
        ID_ULT_NUM_PGRE          : TInterCampo;
        IMP_CAPITAL_REAL         : TInterCampo;
        IMP_CAPITAL_VIRT         : TInterCampo;
        IMP_INT_REAL             : TInterCampo;
        IMP_INT_VIRT             : TInterCampo;
        IMP_ISR_REAL             : TInterCampo;
        IMP_ISR_VIRT             : TInterCampo;
        NUM_PGRES_REAL           : TInterCampo;
        NUM_PGRES_VIRT           : TInterCampo;
        VAL_PROM_REAL            : TInterCampo;
        VAL_PROM_VIRT            : TInterCampo;
        CTO_REF_ORIGEN           : TInterCampo;
        FOLIO_GRUPO              : TInterCampo;
        Grupo                    : tGrupoInv;
        Contrato                 : TCtrlCto;
        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;



implementation

{$R *.DFM}


constructor TInvSaldo.Create( AOwner : TComponent ); 
begin Inherited;
      ID_CONTRATO :=CreaCampo('ID_CONTRATO',ftFloat,tsNinguno,tsNinguno,True);
                ID_CONTRATO.Caption:='Número de Contrato';
      ID_ULT_NUM_PGRE :=CreaCampo('ID_ULT_NUM_PGRE',ftFloat,tsNinguno,tsNinguno,True);
                ID_ULT_NUM_PGRE.Caption:='Número de Última Número Pgre';
      IMP_CAPITAL_REAL :=CreaCampo('IMP_CAPITAL_REAL',ftFloat,tsNinguno,tsNinguno,True);
                IMP_CAPITAL_REAL.Caption:='Imp Capital Real';
      IMP_CAPITAL_VIRT :=CreaCampo('IMP_CAPITAL_VIRT',ftFloat,tsNinguno,tsNinguno,True);
                IMP_CAPITAL_VIRT.Caption:='Imp Capital Virt';
      IMP_INT_REAL :=CreaCampo('IMP_INT_REAL',ftFloat,tsNinguno,tsNinguno,True);
                IMP_INT_REAL.Caption:='Imp Int Real';
      IMP_INT_VIRT :=CreaCampo('IMP_INT_VIRT',ftFloat,tsNinguno,tsNinguno,True);
                IMP_INT_VIRT.Caption:='Imp Int Virt';
      IMP_ISR_REAL :=CreaCampo('IMP_ISR_REAL',ftFloat,tsNinguno,tsNinguno,True);
                IMP_ISR_REAL.Caption:='Imp Isr Real';
      IMP_ISR_VIRT :=CreaCampo('IMP_ISR_VIRT',ftFloat,tsNinguno,tsNinguno,True);
                IMP_ISR_VIRT.Caption:='Imp Isr Virt';
      NUM_PGRES_REAL :=CreaCampo('NUM_PGRES_REAL',ftFloat,tsNinguno,tsNinguno,True);
                NUM_PGRES_REAL.Caption:='Número Pgres Real';
      NUM_PGRES_VIRT :=CreaCampo('NUM_PGRES_VIRT',ftFloat,tsNinguno,tsNinguno,True);
                NUM_PGRES_VIRT.Caption:='Número Pgres Virt';
      VAL_PROM_REAL :=CreaCampo('VAL_PROM_REAL',ftFloat,tsNinguno,tsNinguno,True);
                VAL_PROM_REAL.Caption:='Val Prom Real';
      VAL_PROM_VIRT :=CreaCampo('VAL_PROM_VIRT',ftFloat,tsNinguno,tsNinguno,True);
                VAL_PROM_VIRT.Caption:='Val Prom Virt';
      CTO_REF_ORIGEN :=CreaCampo('CTO_REF_ORIGEN',ftFloat,tsNinguno,tsNinguno,True);
                CTO_REF_ORIGEN.Caption:='Cto Ref Origen';
      FOLIO_GRUPO :=CreaCampo('FOLIO_GRUPO',ftFloat,tsNinguno,tsNinguno,True);
                FOLIO_GRUPO.Caption:='Folio Grupo';
      FKeyFields.Add('ID_CONTRATO');

      Grupo := tGrupoInv.Create(Self);
      Grupo.MasterSource:=Self;
      Grupo.FOLIO_GRUPO.MasterField:='FOLIO_GRUPO';

      Contrato := TCtrlCto.Create(Self);
      Contrato.MasterSource:=Self;
      Contrato.ID_CONTRATO.MasterField:='CTO_REF_ORIGEN';

      Self.UseLink:=True;

      TableName := 'INV_SALDO';
      UseQuery := True;
      HelpFile := 'IntInvSaldo.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TInvSaldo.Destroy;
begin if Grupo <> nil then Grupo.free;
      if Contrato <> nil then Contrato.free; 
      inherited;
end;


function TInvSaldo.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWInvSaldo;
begin
   W:=TWInvSaldo.Create(Self);
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


Function TInvSaldo.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('IInvSald.it','F');
      Try if Active then begin T.Param(0,ID_CONTRATO.AsString);
                               end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;


(***********************************************FORMA INV_SALDO********************)
(*                                                                              *)
(*  FORMA DE INV_SALDO                                                            *)
(*                                                                              *)
(***********************************************FORMA INV_SALDO********************)

procedure TWInvSaldo.FormShow(Sender: TObject);
begin
      Objeto.CTO_REF_ORIGEN.Control:=edCTO_REF_ORIGEN;
      Objeto.Contrato.ID_CONTRATO.Control:=edCTO_REF_ORIGEN;
      Objeto.Contrato.TITNombre.Control:=edNomCtoRefer;
      Objeto.FOLIO_GRUPO.Control:=edFOLIO_GRUPO;
      Objeto.Grupo.DESC_GRUPO.Control:=edDescGrupo;
      Objeto.Grupo.FOLIO_GRUPO.Control:=edFOLIO_GRUPO;
      Objeto.Contrato.BuscaWhereString:='ID_CONTRATO IN (SELECT DISTINCT CTO_REF_ORIGEN FROM INV_SALDO)';
      Objeto.Contrato.FilterString:=Objeto.Contrato.BuscaWhereString;
end;

procedure TWInvSaldo.FormDestroy(Sender: TObject);
begin
      Objeto.CTO_REF_ORIGEN.Control:=nil;
      Objeto.Contrato.ID_CONTRATO.Control:=nil;
      Objeto.Contrato.TITNombre.Control:=nil;
      Objeto.FOLIO_GRUPO.Control:=nil;
      Objeto.Grupo.DESC_GRUPO.Control:=nil;
      Objeto.Grupo.FOLIO_GRUPO.Control:=nil;
end;

procedure TWInvSaldo.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWInvSaldo.btGrupoClick(Sender: TObject);
begin Objeto.Grupo.Busca;
end;

procedure TWInvSaldo.bbCtoReferClick(Sender: TObject);
begin Objeto.Contrato.Busca;
end;

end.
