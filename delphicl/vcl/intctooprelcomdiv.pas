//------------------------------------------------------------------------------
// Función    : Relacion Comercial por Divisa               
// Desarrollo : Cesar Zamora Ramirez
// Fecha      : 11 de Febrero del 2013
//------------------------------------------------------------------------------
Unit IntCtoOpRelComDiv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm, DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, IntLinkit;

Type
  TRelComDiv = Class;

  TWRelComDiv = Class(TForm)
    InterForma1 : TInterForma;
    lCveTipoProd: TLabel;
    lDescTipoProd: TLabel;
    ieDescOpRelComDiv: TInterEdit;
    ieCveOpRelComDiv: TInterEdit;
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
       Objeto : TRelComDiv;
    end;

  TRelComDiv = class(TInterFrame)
    private
       { Private declarations }
    protected
       { Protected declarations }
    public
       { Public declarations }
       Cve_Oper_Rel_Comer_Div  : TInterCampo;
       Desc_Oper_Rel_Comer_Div : TInterCampo;
       Cve_Usuario_Alta        : TInterCampo;
       FH_Alta                 : TInterCampo;
       Cve_Usuario_Modifica    : TInterCampo;
       FH_Modifica             : TInterCampo;

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

constructor TRelComDiv.Create( AOwner : TComponent );
begin
   Inherited;

   Cve_Oper_Rel_Comer_Div  := CreaCampo('CVE_OPER_REL_COMER_DIV',  ftString,   tsNinguno, tsNinguno, True);
   Desc_Oper_Rel_Comer_Div := CreaCampo('DESC_OPER_REL_COMER_DIV', ftString,   tsNinguno, tsNinguno, True);
   Cve_Usuario_Alta        := CreaCampo('CVE_USUARIO_ALTA',        ftString,   tsNinguno, tsNinguno, True);
   FH_Alta                 := CreaCampo('FH_ALTA',                 ftDateTime, tsNinguno, tsNinguno, True);
   Cve_Usuario_Modifica    := CreaCampo('CVE_USUARIO_MODIFICA',    ftString,   tsNinguno, tsNinguno, True);
   FH_Modifica             := CreaCampo('FH_MODIFICA',             ftDateTime, tsNinguno, tsNinguno, True);

   FKeyFields.Add('CVE_OPER_REL_COMER_DIV');

   TableName       := 'CTO_OPER_REL_COMER_DIVISA';
   UseQuery        := True;
   ShowMenuReporte := True;
end;

destructor TRelComDiv.Destroy;
begin
   inherited;
end;

procedure TRelComDiv.DataBaseChange;
begin
   inherited;
end;

function TRelComDiv.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TWRelComDiv;
begin
   W := TWRelComDiv.Create(Self);
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

function TRelComDiv.InternalBusca:Boolean;
var
   T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('ITOPRELCOMDIV.IT', 'S');
   try
      if Active    then   T.Param(0, Cve_Oper_Rel_Comer_Div.AsString);
      if T.Execute then   InternalBusca := FindKey([T.DameCampo(0)]);
   finally
      T.Free;
   end;
end;

procedure TWRelComDiv.FormShow(Sender: TObject);
begin
   with Objeto do
   begin
      Cve_Oper_Rel_Comer_Div.Control  := ieCveOpRelComDiv;
      Desc_Oper_Rel_Comer_Div.Control := ieDescOpRelComDiv;
      Cve_Usuario_Alta.Control        := eCveUsrAlta;
      FH_Alta.Control                 := eFHAlta;
      Cve_Usuario_Modifica.Control    := eCveUsrMod;
      FH_Modifica.Control             := eFHMod;
   end;
end;

procedure TWRelComDiv.FormDestroy(Sender: TObject);
begin
   with Objeto do
   begin
      Cve_Oper_Rel_Comer_Div.Control  := nil;
      Desc_Oper_Rel_Comer_Div.Control := nil;
      Cve_Usuario_Alta.Control        := nil;
      FH_Alta.Control                 := nil;
      Cve_Usuario_Modifica.Control    := nil;
      FH_Modifica.Control             := nil;
   end;
end;

procedure TWRelComDiv.InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean; var Realizado: Boolean);
begin
   with Objeto do
      try
         InterForma1.ShowError := False;
         GetFromControl;
         if trim(Cve_Oper_Rel_Comer_Div.AsString) = '' then
         begin
            ieCveOpRelComDiv.SetFocus;
            raise EInterFrame.Create('Ingrese una Clave');
         end;
         if trim(Desc_Oper_Rel_Comer_Div.AsString) = '' then
         begin
            ieDescOpRelComDiv.SetFocus;
            raise EInterFrame.Create('Ingrese una Descripcion');
         end;
         if IsNewData then
         begin
            if GetSQL('select * '
                    + '  from cto_oper_rel_comer_divisa '
                    + ' where cve_oper_rel_comer_div = ' + Cve_Oper_Rel_Comer_Div.AsSQL,
                      SeguDataBaseName, SeguSessionName, False) then
               raise EInterFrame.Create('La Relacion Comercial por Divisa ya existe');
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

procedure TWRelComDiv.InterForma1DespuesNuevo(Sender: TObject);
begin
   ieCveOpRelComDiv.SetFocus;
end;

procedure TWRelComDiv.InterForma1DespuesModificar(Sender: TObject);
begin
   ieCveOpRelComDiv.SetFocus;
end;

procedure TWRelComDiv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;
end.
