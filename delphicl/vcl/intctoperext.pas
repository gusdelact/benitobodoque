//------------------------------------------------------------------------------
// Función    : Persona Extranjera
// Desarrollo : Cesar Zamora Ramirez
// Fecha      : 12 de Abril del 2013
//------------------------------------------------------------------------------
Unit IntCtoPerExt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IntFrm,
  DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntFind, UnSQL2,
  InterFun, ComCtrls, IntDtPk, InterEdit, IntLinkit, IntCtoHeader, UnFunProcICB;

Type
  TCtoPerExt = Class;

  TWCtoPerExt = Class(TForm)
    InterForma1 : TInterForma;
    eTitular: TEdit;
    sbContrato: TSpeedButton;
    ieIdContrato: TInterEdit;
    lContrato: TLabel;
    lMotApertura: TLabel;
    ieMotApertura: TInterEdit;
    cbBSucMex: TCheckBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure sbContratoClick(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    private
       { Private declarations }
    public
       { Public declarations }
       Objeto : TCtoPerExt;
    end;

  TCtoPerExt = class(TInterFrame)
    private
       { Private declarations }
    protected
       { Protected declarations }
       vContrato : TInterFrame;
    public
       { Public declarations }
       Ventana  : TWCtoPerExt;
       Contrato : TCtrlCto;

       Id_Contrato       : TInterCampo;
       Motivo_Apertura   : TInterCampo;
       B_Sucursal_Mexico : TInterCampo;

       procedure    ObtenerCtoPadre;
       procedure    ActivarSucursales(pActivar : Boolean);

       procedure    DataBaseChange;
       function     InternalBusca : Boolean; override;
       constructor  Create( AOwner : TComponent ); override;
       destructor   Destroy; override;
       function     ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
       procedure    AfterLocalizaCto(Sender : TObject);
       property     pContrato : TInterFrame read vContrato write vContrato;
    published
       { Published declarations }
    end;
implementation
   {$R *.DFM}

procedure TCtoPerExt.ObtenerCtoPadre;
begin
   if (pContrato <> nil) and (pContrato.Active) then
      Contrato.FindKey([pContrato.FieldByName('ID_CONTRATO').AsInteger]);
   ActivarSucursales(False);      
end;

procedure TCtoPerExt.ActivarSucursales(pActivar : Boolean);
begin
   Ventana.cbBSucMex.Enabled := pActivar;
end;

procedure TCtoPerExt.AfterLocalizaCto(Sender : TObject);
begin
   if (Contrato.Active) and (Contrato.ID_CONTRATO.AsInteger > 0) then
      ActivarSucursales(GetSQL('select * '
                             + '  from contrato                 cto '
                             + '       inner join persona_moral tit on tit.id_persona = cto.id_titular '
                             + ' where cto.id_contrato = ' + Contrato.Id_Contrato.AsSQL,
                               SeguDataBaseName, SeguSessionName, False))
   else
   begin
      Ventana.cbBSucMex.Checked := False;
      ActivarSucursales(False);
   end;
end;

constructor TCtoPerExt.Create( AOwner : TComponent );
begin
   Inherited;

   Ventana := Nil;

   Contrato                 := TCtrlCto.Create(Self);
   Contrato.MasterSource    := Self;
   Contrato.FieldByName('ID_CONTRATO').MasterField := 'ID_CONTRATO';
   Contrato.OnAfterLocaliza := AfterLocalizaCto;

   Id_Contrato       := CreaCampo('ID_CONTRATO',       ftInteger, tsNinguno, tsNinguno, True);
   Motivo_Apertura   := CreaCampo('MOTIVO_APERTURA',   ftString,  tsNinguno, tsNinguno, True);
   B_Sucursal_Mexico := CreaCampo('B_SUCURSAL_MEXICO', ftString,  tsNinguno, tsNinguno, True);

   FKeyFields.Add('ID_CONTRATO');

   TableName       := 'CTO_PERSONA_EXT';
   UseQuery        := True;
   ShowMenuReporte := True;
end;

destructor TCtoPerExt.Destroy;
begin
   inherited;
end;

procedure TCtoPerExt.DataBaseChange;
begin
   inherited;
   Contrato.GetParams(Self);
end;

function TCtoPerExt.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TWCtoPerExt;
begin
   W := TWCtoPerExt.Create(Self);
   try
      W.Objeto                    := Self;
      W.InterForma1.InterFrame    := Self;
      W.InterForma1.FormaTipo     := FormaTipo;
      W.InterForma1.ShowBtnAyuda  := False;
      W.InterForma1.ShowGrid      := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion       := FInterFun;
      Ventana                     := W;
      W.InterForma1.ShowModal;
      ShowWindow                  := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

function TCtoPerExt.InternalBusca:Boolean;
var
   T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('ITCTOPEREXT.IT', 'S');
   try
      if Active then   T.Param(0, Contrato.ID_CONTRATO.AsString);
      if Contrato.Active then
      begin
         if Contrato.ID_CONTRATO.AsInteger > 0 then
            T.WhereString := 'CTO_PERSONA_EXT.ID_CONTRATO = ' + Contrato.ID_CONTRATO.AsSQL;
      end;
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0)]);
   finally
      T.Free;
   end;
end;

procedure TWCtoPerExt.sbContratoClick(Sender: TObject);
begin
   if (Objeto.pContrato <> nil) and (Objeto.pContrato.Active) then
   begin
      Objeto.ObtenerCtoPadre;
      Objeto.AfterLocalizaCto(Sender);
   end
   else
      Objeto.Contrato.Busca;
end;

procedure TWCtoPerExt.FormShow(Sender: TObject);
begin
   with Objeto do
   begin
      Contrato.ID_CONTRATO.Control := ieIdContrato;
      Contrato.TITNOMBRE.Control   := eTitular;
      Contrato.ShowMenuCatalogo    := True;
      Contrato.ShowMenuReporte     := False;
      Contrato.ShowMenuClear       := False;
      ieIdContrato.PopupMenu       := Contrato.PopMenu;
      Motivo_Apertura.Control      := ieMotApertura;
      B_Sucursal_Mexico.Control    := cbBSucMex;
      ObtenerCtoPadre;
   end;
end;

procedure TWCtoPerExt.FormDestroy(Sender: TObject);
begin
   with Objeto do
   begin
      Contrato.ID_CONTRATO.Control := nil;
      Contrato.TITNOMBRE.Control   := nil;
      Motivo_Apertura.Control      := nil;
      B_Sucursal_Mexico.Control    := nil;
   end;
end;

procedure TWCtoPerExt.InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean; var Realizado: Boolean);
begin
   with Objeto do
      try
         InterForma1.ShowError := False;
         GetFromControl;
         if Contrato.ID_CONTRATO.AsInteger <= 0 then
         begin
            ieIdContrato.SetFocus;
            raise EInterFrame.Create('Seleccione un Contrato');
         end;
         if trim(Motivo_Apertura.AsString) = '' then
         begin
            ieMotApertura.SetFocus;
            raise EInterFrame.Create('Especifique las razones para abrir una cuenta en México');
         end;
         if IsNewData then
         begin
            if GetSQL('select * from cto_persona_ext where id_contrato = ' + Contrato.ID_CONTRATO.AsSQL, SeguDataBaseName, SeguSessionName, False) then
               raise EInterFrame.Create('Ya existe la Persona Extranjera para el Contrato');
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

procedure TWCtoPerExt.InterForma1DespuesNuevo(Sender: TObject);
begin
   if Objeto.pContrato = nil then
      ieIdContrato.SetFocus
   else
   begin
      Objeto.ObtenerCtoPadre;
      ieIdContrato.SetFocus;
   end;
   Objeto.AfterLocalizaCto(Sender);
end;

procedure TWCtoPerExt.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.AfterLocalizaCto(Sender);
   ieMotApertura.SetFocus;
end;

procedure TWCtoPerExt.InterForma1DespuesEliminar(Sender: TObject);
begin
   Objeto.ActivarSucursales(False);
end;

procedure TWCtoPerExt.InterForma1DespuesAceptar(Sender: TObject);
begin
   Objeto.ActivarSucursales(False);
end;

procedure TWCtoPerExt.InterForma1DespuesCancelar(Sender: TObject);
begin
   if not Objeto.Contrato.Active then   Objeto.ObtenerCtoPadre;
end;

procedure TWCtoPerExt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;
end.
