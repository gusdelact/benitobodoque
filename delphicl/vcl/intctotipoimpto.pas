//------------------------------------------------------------------------------
// Función    : Tipo de Impuesto por Contrato
// Desarrollo : Cesar Zamora Ramirez
// Fecha      : 20 de Febrero del 2013
//------------------------------------------------------------------------------
Unit IntCtoTipoImpto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm, DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, IntLinkit;

Type
  TCtoTipImp = Class;

  TWCtoTipoImpto = Class(TForm)
    InterForma1 : TInterForma;
    lClave: TLabel;
    lDescripcion: TLabel;
    ieDescImp: TInterEdit;
    ieCveImp: TInterEdit;
    cbBRetiene: TCheckBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    private
       { Private declarations }
    public
       { Public declarations }
       Objeto : TCtoTipImp;
    end;

  TCtoTipImp = class(TInterFrame)
    private
       { Private declarations }
    protected
       { Protected declarations }
    public
       { Public declarations }
       Cve_Impuesto  : TInterCampo;
       Desc_Impuesto : TInterCampo;
       B_Retiene     : TInterCampo;

       procedure   DataBaseChange;
       function    InternalBusca : Boolean; override;
       constructor Create( AOwner : TComponent ); override;
       destructor  Destroy; override;
       function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    published
       { Published declarations }
    end;
implementation
   {$R *.DFM}

constructor TCtoTipImp.Create( AOwner : TComponent );
begin
   Inherited;

   Cve_Impuesto  := CreaCampo('CVE_IMPUESTO',  ftString, tsNinguno, tsNinguno, True);
   Desc_Impuesto := CreaCampo('DESC_IMPUESTO', ftString, tsNinguno, tsNinguno, True);
   B_Retiene     := CreaCampo('B_RETIENE',     ftString, tsNinguno, tsNinguno, True);

   FKeyFields.Add('CVE_IMPUESTO');

   TableName       := 'CTO_TIPO_IMPUESTO';
   UseQuery        := True;
   ShowMenuReporte := True;
end;

destructor TCtoTipImp.Destroy;
begin
   inherited;
end;

procedure TCtoTipImp.DataBaseChange;
begin
   inherited;
end;

function TCtoTipImp.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TWCtoTipoImpto;
begin
   W := TWCtoTipoImpto.Create(Self);
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

function TCtoTipImp.InternalBusca:Boolean;
var
   T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('ITCTOTIPOIMP.IT', 'S');
   try
      if Active    then   T.Param(0, Cve_Impuesto.AsString);
      if T.Execute then   InternalBusca := FindKey([T.DameCampo(0)]);
   finally
      T.Free;
   end;
end;

procedure TWCtoTipoImpto.FormShow(Sender: TObject);
begin
   Objeto.Cve_Impuesto.Control  := ieCveImp;
   Objeto.Desc_Impuesto.Control := ieDescImp;
   Objeto.B_Retiene.Control     := cbBRetiene;
end;

procedure TWCtoTipoImpto.FormDestroy(Sender: TObject);
begin
   Objeto.Cve_Impuesto.Control  := nil;
   Objeto.Desc_Impuesto.Control := nil;
   Objeto.B_Retiene.Control     := nil;
end;

procedure TWCtoTipoImpto.InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean; var Realizado: Boolean);
begin
   with Objeto do
      try
         InterForma1.ShowError := False;
         GetFromControl;
         if trim(Cve_Impuesto.AsString) = '' then
         begin
            ieCveImp.SetFocus;
            raise EInterFrame.Create('Ingrese una Clave');
         end;
         if trim(Desc_Impuesto.AsString) = '' then
         begin
            ieDescImp.SetFocus;
            raise EInterFrame.Create('Ingrese una Descripcion');
         end;
         if IsNewData then
         begin
            if GetSQL('select * '
                    + '  from cto_tipo_impuesto '
                    + ' where cve_impuesto = ' + Cve_Impuesto.AsSQL,
                      SeguDataBaseName, SeguSessionName, False) then
               raise EInterFrame.Create('El Tipo de Impuesto por Contrato ya existe');
         end;
         Realizado := True;
      except
         on e: EInterFrame do
         begin
            MessageDlg(e.Message, mtInformation, [mbOK], 0);
            Realizado := False;
         end;
      end;
end;

procedure TWCtoTipoImpto.InterForma1DespuesNuevo(Sender: TObject);
begin
   ieCveImp.SetFocus;
end;

procedure TWCtoTipoImpto.InterForma1DespuesModificar(Sender: TObject);
begin
   ieDescImp.SetFocus;
end;

procedure TWCtoTipoImpto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;
end.
