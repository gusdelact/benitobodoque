//------------------------------------------------------------------------------
// Función    : Frecuencia por Divisa
// Desarrollo : Cesar Zamora Ramirez
// Fecha      : 11 de Febrero del 2013
//------------------------------------------------------------------------------
Unit IntCtoOpFrecDiv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm, DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, IntLinkit;

Type
  TFrecDiv = Class;

  TWFrecDiv = Class(TForm)
    InterForma1 : TInterForma;
    lCveTipoProd: TLabel;
    lDescTipoProd: TLabel;
    ieDescOpFrecDiv: TInterEdit;
    ieCveOpFrecDiv: TInterEdit;
    gbAlta: TGroupBox;
    lCveUsrAlta: TLabel;
    lFHAlta: TLabel;
    eCveUsrAlta: TEdit;
    eFHAlta: TEdit;
    gbModifica: TGroupBox;
    lCveUsrMod: TLabel;
    lFHMod: TLabel;
    eCveUsrMod: TEdit;
    eFHMod: TEdit;
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
       Objeto : TFrecDiv;
    end;

  TFrecDiv = class(TInterFrame)
    private
       { Private declarations }
    protected
       { Protected declarations }
    public
       { Public declarations }
       Cve_Oper_Frecuencia_Div  : TInterCampo;
       Desc_Oper_Frecuencia_Div : TInterCampo;
       Cve_Usuario_Alta         : TInterCampo;
       FH_Alta                  : TInterCampo;
       Cve_Usuario_Modifica     : TInterCampo;
       FH_Modifica              : TInterCampo;

       procedure    DataBaseChange;
       function     InternalBusca : Boolean; override;
       constructor  Create( AOwner : TComponent ); override;
       destructor   Destroy; override;
       function     ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    published
       { Published declarations }
    end;
implementation
   {$R *.DFM}

constructor TFrecDiv.Create( AOwner : TComponent );
begin
   Inherited;

   Cve_Oper_Frecuencia_Div  := CreaCampo('CVE_OPER_FRECUENCIA_DIV',  ftString,   tsNinguno, tsNinguno, True);
   Desc_Oper_Frecuencia_Div := CreaCampo('DESC_OPER_FRECUENCIA_DIV', ftString,   tsNinguno, tsNinguno, True);
   Cve_Usuario_Alta         := CreaCampo('CVE_USUARIO_ALTA',         ftString,   tsNinguno, tsNinguno, True);
   FH_Alta                  := CreaCampo('FH_ALTA',                  ftDateTime, tsNinguno, tsNinguno, True);
   Cve_Usuario_Modifica     := CreaCampo('CVE_USUARIO_MODIFICA',     ftString,   tsNinguno, tsNinguno, True);
   FH_Modifica              := CreaCampo('FH_MODIFICA',              ftDateTime, tsNinguno, tsNinguno, True);

   FKeyFields.Add('CVE_OPER_FRECUENCIA_DIV');

   TableName       := 'CTO_OPER_FRECUENCIA_DIVISA';
   UseQuery        := True;
   ShowMenuReporte := True;
end;

destructor TFrecDiv.Destroy;
begin
   inherited;
end;

procedure TFrecDiv.DataBaseChange;
begin
   inherited;
end;

function TFrecDiv.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TWFrecDiv;
begin
   W := TWFrecDiv.Create(Self);
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

function TFrecDiv.InternalBusca:Boolean;
var
   T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('ITOPFRECDIV.IT', 'S');
   try
      if Active    then   T.Param(0, Cve_Oper_Frecuencia_Div.AsString);
      if T.Execute then   InternalBusca := FindKey([T.DameCampo(0)]);
   finally
      T.Free;
   end;
end;

procedure TWFrecDiv.FormShow(Sender: TObject);
begin
   with Objeto do
   begin
      Cve_Oper_Frecuencia_Div.Control  := ieCveOpFrecDiv;
      Desc_Oper_Frecuencia_Div.Control := ieDescOpFrecDiv;
      Cve_Usuario_Alta.Control         := eCveUsrAlta;
      FH_Alta.Control                  := eFHAlta;
      Cve_Usuario_Modifica.Control     := eCveUsrMod;
      FH_Modifica.Control              := eFHMod;
   end;
end;

procedure TWFrecDiv.FormDestroy(Sender: TObject);
begin
   with Objeto do
   begin
      Cve_Oper_Frecuencia_Div.Control  := nil;
      Desc_Oper_Frecuencia_Div.Control := nil;
      Cve_Usuario_Alta.Control         := nil;
      FH_Alta.Control                  := nil;
      Cve_Usuario_Modifica.Control     := nil;
      FH_Modifica.Control              := nil;
   end;
end;

procedure TWFrecDiv.InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean; var Realizado: Boolean);
begin
   with Objeto do
      try
         InterForma1.ShowError := False;
         GetFromControl;
         if trim(Cve_Oper_Frecuencia_Div.AsString) = '' then
         begin
            ieCveOpFrecDiv.SetFocus;
            raise EInterFrame.Create('Ingrese una Clave');
         end;
         if trim(Desc_Oper_Frecuencia_Div.AsString) = '' then
         begin
            ieDescOpFrecDiv.SetFocus;
            raise EInterFrame.Create('Ingrese una Descripcion');
         end;
         if IsNewData then
         begin
            if GetSQL('select * '
                    + '  from cto_oper_frecuencia_divisa '
                    + ' where cve_oper_frecuencia_div = ' + Cve_Oper_Frecuencia_Div.AsSQL,
                      SeguDataBaseName, SeguSessionName, False) then
               raise EInterFrame.Create('La Frecuencia por Divisa ya existe'); 
            Cve_Usuario_Alta.AsString     := DameUsuario;
            FH_Alta.AsDateTime            := Now;
         end
         else
         begin
            Cve_Usuario_Modifica.AsString := DameUsuario;
            FH_Modifica.AsDateTime        := Now;
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

procedure TWFrecDiv.InterForma1DespuesNuevo(Sender: TObject);
begin
   ieCveOpFrecDiv.SetFocus;
end;

procedure TWFrecDiv.InterForma1DespuesModificar(Sender: TObject);
begin
   ieCveOpFrecDiv.SetFocus;
end;

procedure TWFrecDiv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;
end.
