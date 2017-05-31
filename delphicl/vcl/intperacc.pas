// -----------------------------------------------------------------------------
// Participacion Accionaria
// Realizó : Juan Carlos Sanchez Reyes
// Rehizo  : Cesar Zamora Ramirez
// Fecha   : 23 de Octubre del 2013
// -----------------------------------------------------------------------------

Unit IntPerAcc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, IntFind,
  UnSQL2, InterFun, ComCtrls, IntDtPk, InterEdit, UnGene, unFunProcICB, IntPers;

Type
  TPerAcc = class;
  TWPerAcc = class(TForm)
    InterForma1 : TInterForma;
    lEmpresa: TLabel;
    ieIdEmpresa: TInterEdit;
    sbEmpresa: TSpeedButton;
    edDescEmpresa: TEdit;
    lAccionista: TLabel;
    ieIdAccionista: TInterEdit;
    sbAccionista: TSpeedButton;
    edNomAccionista: TEdit;
    gbAccionistas: TGroupBox;
    lvwAccionistas: TListView;
    lNivelAcc: TLabel;
    bNivelAcc: TBevel;
    pNivel1: TPanel;
    pNivel2: TPanel;
    pNivel3: TPanel;
    bNivelCom: TBevel;
    lNivelCom: TLabel;
    pNivelCom: TPanel;
    lTotal: TLabel;
    gbTotal: TGroupBox;
    lTotEmpresa: TLabel;
    lTotNivel1: TLabel;
    ieTotEmpresa: TInterEdit;
    ieTotNivel1: TInterEdit;
    gbAlta: TGroupBox;
    ieFAlta: TInterEdit;
    lFAlta: TLabel;
    lCveUsrAlta: TLabel;
    ieCveUsrAlta: TInterEdit;
    lAlta: TLabel;
    gbAcciones: TGroupBox;
    lNumAcciones: TLabel;
    ieNumAcciones: TInterEdit;
    lPctAcciones: TLabel;
    iePctAcciones: TInterEdit;
    lAcciones: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure sbEmpresaClick(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure sbAccionistaClick(Sender: TObject);
    procedure ieNumAccionesExit(Sender: TObject);

    procedure ObtInfoAccionistas;
    procedure ObtPctAcciones;

    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure lvwAccionistasDblClick(Sender: TObject);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure lvwAccionistasCustomDrawSubItem(Sender: TCustomListView;
      Item: TListItem; SubItem: Integer; State: TCustomDrawState;
      var DefaultDraw: Boolean);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1AntesNuevo(Sender: TObject;
      var Realizado: Boolean);
    procedure InterForma1AntesModificar(Sender: TObject;
      var Realizado: Boolean);

    private
      { Private declarations }
    public
      { Public declarations }
      Objeto : TPerAcc;
  end;

  TPerAcc= class(TInterFrame)
    private
      { Private declarations }
    protected
      { Protected declarations }
    public
      { Public declarations }
      Empresa    : TPersona;
      Accionista : TPersona;

      Id_Accionista     : TInterCampo;
      Id_Pers_Emp       : TInterCampo;
      Num_Acciones      : TInterCampo;
      Pct_Participacion : TInterCampo;
      Fh_Alta           : TInterCampo;
      Cve_Usuario_Alta  : TInterCampo;
      Nivel_Composicion : TInterCampo;
      Tot_Nivel1        : TInterCampo;

      vIdPersonaPadre : Integer;

      function    InternalBusca : Boolean; override;
      constructor Create( AOwner : TComponent ); override;
      destructor  Destroy; override;
      function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    published
      { Published declarations }
  end;
implementation
  {$R *.DFM}

constructor TPerAcc.Create( AOwner : TComponent );
begin
   Inherited;

   Empresa                           := TPersona.Create(Nil);
   Empresa.MasterSource              := Self;
   Empresa.ID_PERSONA.MasterField    := 'ID_PERS_EMP';

   Accionista                        := TPersona.Create(Nil);
   Accionista.MasterSource           := Self;
   Accionista.ID_PERSONA.MasterField := 'ID_ACCIONISTA';

   Id_Accionista     := CreaCampo('ID_ACCIONISTA',     ftInteger,  tsNinguno, tsNinguno, True);
   Id_Pers_Emp       := CreaCampo('ID_PERS_EMP',       ftInteger,  tsNinguno, tsNinguno, True);
   Num_Acciones      := CreaCampo('NUM_ACCIONES',      ftFloat,    tsNinguno, tsNinguno, True);
   Pct_Participacion := CreaCampo('PCT_PARTICIPACION', ftFloat,    tsNinguno, tsNinguno, True);
   Fh_Alta           := CreaCampo('FH_ALTA',           ftDateTime, tsNinguno, tsNinguno, True);
   Cve_Usuario_Alta  := CreaCampo('CVE_USUARIO_ALTA',  ftString,   tsNinguno, tsNinguno, True);
   Nivel_Composicion := CreaCampo('NIVEL_COMPOSICION', ftInteger,  tsNinguno, tsNinguno, False);
   Tot_Nivel1        := CreaCampo('TOT_NIVEL1',        ftFloat,    tsNinguno, tsNinguno, False);

   FKeyFields.Add('ID_ACCIONISTA');
   FKeyFields.Add('ID_PERS_EMP');
   TableName       := 'ACCIONISTA';
   UseQuery        := True;
   ShowMenuReporte := False;
end;

destructor TPerAcc.Destroy;
begin
   if Accionista <> nil then   Accionista.Free; Accionista := nil;
   if Empresa    <> nil then   Empresa.Free;    Empresa    := nil;
   inherited;
end;

function TPerAcc.ShowWindow(FormaTipo : TFormaTipo):Integer;
var
   W : TWPerAcc;
begin
   W := TWPerAcc.Create(Self);
   try
      W.Objeto                    := Self;
      W.InterForma1.InterFrame    := Self;
      W.InterForma1.FormaTipo     := FormaTipo;
      W.InterForma1.ShowGrid      := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion       := FInterFun;
      W.InterForma1.ShowBtnAyuda  := False;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

function TPerAcc.InternalBusca:Boolean;
var
   T : TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('ITACC.IT', 'I');
   try
      if Active then
      begin
         T.Param(0, ID_ACCIONISTA.AsString);
         T.Param(1, ID_PERS_EMP.AsString);
      end;
      if T.Execute then
         InternalBusca := FindKey([T.DameCampo(0), T.DameCampo(1)]);
   finally
      T.Free;
   end;
end;

procedure TWPerAcc.ObtInfoAccionistas;
var
   Qry : TQuery;
begin
   lvwAccionistas.Items.Clear;
   Objeto.Nivel_Composicion.AsInteger := 0;
   Objeto.Tot_Nivel1.AsFloat          := 0;

   if (not Objeto.Empresa.Active) or (Objeto.Empresa.Id_Persona.AsInteger = 0) then
   begin
      if Objeto.vIdPersonaPadre <> 0 then
         Objeto.Empresa.FindKey([Objeto.vIdPersonaPadre]);
   end;
   if (Objeto.Empresa.Active) and (Objeto.Empresa.Id_Persona.AsInteger > 0) then
   begin
      try
         Qry := GetSqlQuery('select a.id_pers_emp  as id_empresa, '
                          + '       empresa.nombre as nombre_empresa, '
                          + '       nivel, '
                          + '       a.id_accionista, '
                          + '       accion.nombre  as nombre_accionista, '
                          + '       num_acciones_sf, '
                          + '       num_acciones '
                          + '  from (select level as nivel, '
                          + '               id_accionista, '
                          + '               id_pers_emp, '
                          + '               num_acciones as num_acciones_sf, '
                          + '               to_char(num_acciones, ' +  QuotedStr('999,999,999,990') + ') as num_acciones '
                          + '          from accionista '
                          + '         start with id_pers_emp       = ' + Objeto.Empresa.Id_Persona.AsSQL
                          + '       connect by prior id_accionista = id_pers_emp '
                          + '                    and level         < 4) a, '
                          + '        persona accion, '
                          + '        persona empresa '
                          + ' where accion.id_persona  = a.id_accionista '
                          + '   and empresa.id_persona = a.id_pers_emp '
                          + ' order by 3, 2, 5',
                            Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
         if Qry <> nil then
            while not Qry.eof do
            begin
               AgregaFilaLvw(lvwAccionistas, [Trim(Qry.FieldByName('ID_EMPRESA').AsString),
                                              Trim(Qry.FieldByName('NOMBRE_EMPRESA').AsString),
                                              Trim(Qry.FieldByName('NIVEL').AsString),
                                              Trim(Qry.FieldByName('ID_ACCIONISTA').AsString),
                                              Trim(Qry.FieldByName('NOMBRE_ACCIONISTA').AsString),
                                              Trim(Qry.FieldByName('NUM_ACCIONES').AsString)]);
               if Qry.FieldByName('NIVEL').AsInteger = 1 then                            // Total de Acciones Nivel 1
                  Objeto.Tot_Nivel1.AsFloat := Objeto.Tot_Nivel1.AsFloat + Qry.FieldByName('NUM_ACCIONES_SF').AsFloat;
               Objeto.Nivel_Composicion.AsInteger := Qry.FieldByName('NIVEL').AsInteger; // Nivel de Composicion
               Qry.Next;
            end;
      finally
         if Qry <> nil then
            Qry.Free;
      end;
   end;
   Objeto.Nivel_Composicion.DrawControl;
   Objeto.Tot_Nivel1.DrawControl;

   case Objeto.Nivel_Composicion.AsInteger of
      1:   pNivelCom.Color := $00FFD8B0;
      2:   pNivelCom.Color := $00C7C1B7;
      3:   pNivelCom.Color := $00A1B47A;
      else pNivelCom.Color := clBtnFace;
   end;
end;

procedure TWPerAcc.FormShow(Sender: TObject);
begin
   with Objeto do
   begin
      Empresa.Id_Persona.Control       := ieIdEmpresa;
      Empresa.Nombre.Control           := edDescEmpresa;
      Empresa.Num_Tot_Acciones.Control := ieTotEmpresa;
      Accionista.Id_Persona.Control    := ieIdAccionista;
      Accionista.Nombre.Control        := edNomAccionista;
      Num_Acciones.Control             := ieNumAcciones;
      Pct_Participacion.Control        := iePctAcciones;
      Fh_Alta.Control                  := ieFAlta;
      Cve_Usuario_Alta.Control         := ieCveUsrAlta;
      Nivel_Composicion.Control        := pNivelCom;
      Tot_Nivel1.Control               := ieTotNivel1;
      ObtInfoAccionistas;
   end;
end;

procedure TWPerAcc.FormDestroy(Sender: TObject);
begin
   with Objeto do
   begin
      Empresa.Id_Persona.Control       := nil;
      Empresa.Nombre.Control           := nil;
      Empresa.Num_Tot_Acciones.Control := nil;
      Accionista.Id_Persona.Control    := nil;
      Accionista.Nombre.Control        := nil;
      Num_Acciones.Control             := nil;
      Pct_Participacion.Control        := nil;
      Fh_Alta.Control                  := nil;
      Cve_Usuario_Alta.Control         := nil;
      Nivel_Composicion.Control        := nil;
      Tot_Nivel1.Control               := nil;
   end;
end;

procedure TWPerAcc.sbEmpresaClick(Sender: TObject);
begin
   Objeto.Empresa.FilterBy := fbTPersonaMoral;
   Objeto.Empresa.Busca;
   ObtInfoAccionistas;
end;

procedure TWPerAcc.sbAccionistaClick(Sender: TObject);
begin
   Objeto.Accionista.BuscaWhereString := 'persona.id_persona <> ' + Objeto.Empresa.Id_Persona.AsSQL + ' and ' // Excluir a la empresa como accionista
                                       + 'persona.id_persona not in (select id_accionista '                   // Un accionista solo puede ser capturado una vez
                                                                   + ' from accionista a '
                                                                   + 'where id_pers_emp = ' + Objeto.Empresa.Id_Persona.AsSQL + ')';
   Objeto.Accionista.Busca;
end;

procedure TWPerAcc.ObtPctAcciones;
begin
   with Objeto do
   begin
      if Empresa.Num_Tot_Acciones.AsFloat = 0 then
         Pct_Participacion.AsFloat := 0
      else
         Pct_Participacion.AsFloat := (Num_Acciones.AsFloat / Empresa.Num_Tot_Acciones.AsFloat) * 100;
      Pct_Participacion.DrawControl;
   end;
end;

procedure TWPerAcc.ieNumAccionesExit(Sender: TObject);
begin
   Objeto.GetFromControl;
   ObtPctAcciones;
end;

procedure TWPerAcc.lvwAccionistasDblClick(Sender: TObject);
begin
    if lvwAccionistas.SelCount <> 0 then
    begin
       Objeto.FindKey([StrToInt(lvwAccionistas.Selected.SubItems[2]), StrToInt(lvwAccionistas.Selected.Caption)]);
       ObtInfoAccionistas;
    end;
end;

procedure TWPerAcc.lvwAccionistasCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
var
   vItem : Integer;
begin
   if trim(item.SubItems[1]) = '' then vItem := 0
   else                                vItem := StrToInt(item.SubItems[1]);
   case vItem of
      1:   Sender.Canvas.Brush.Color := $00FFD8B0;
      2:   Sender.Canvas.Brush.Color := $00C7C1B7;
      3:   Sender.Canvas.Brush.Color := $00A1B47A;
      else Sender.Canvas.Brush.Color := clWindow;
   end;
end;

procedure TWPerAcc.InterForma1Buscar(Sender: TObject);
begin
   Objeto.Busca;
   ObtInfoAccionistas;
end;

procedure TWPerAcc.InterForma1AntesNuevo(Sender: TObject; var Realizado: Boolean);
begin
   InterForma1.ShowError := False;
   Objeto.Empresa.Num_Tot_Acciones.GetFromControl;
   if Objeto.Empresa.Num_Tot_Acciones.AsFloat = 0  then
   begin
      Realizado := False;
      MessageDlg('El Total de Acciones de la empresa no ha sido configurado', mtInformation, [mbOK], 0)
   end
   else
      Realizado := True;
end;

procedure TWPerAcc.InterForma1AntesModificar(Sender: TObject; var Realizado: Boolean);
begin
   InterForma1.ShowError := False;
   Objeto.Empresa.Num_Tot_Acciones.GetFromControl;
   if Objeto.Empresa.Num_Tot_Acciones.AsFloat = 0  then
   begin
      Realizado := False;
      MessageDlg('El Total de Acciones de la empresa no ha sido configurado', mtInformation, [mbOK], 0)
   end
   else
      Realizado := True;
end;

procedure TWPerAcc.InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean; var Realizado: Boolean);
begin
   with Objeto do
   begin
      try
         GetFromControl;
         InterForma1.ShowError := False;
         if not Empresa.Active then
         begin
            ieIdEmpresa.SetFocus;
            raise EInterFrame.Create('Seleccione una empresa');
         end;
         if not Accionista.Active then
         begin
            ieIdAccionista.SetFocus;
            raise EInterFrame.Create('Seleccione un accionista');
         end;
         if Num_Acciones.AsFloat = 0 then
         begin
            ieNumAcciones.SetFocus;
            raise EInterFrame.Create('Ingrese el número de acciones');
         end;
         if (Num_Acciones.AsFloat + Tot_Nivel1.AsFloat) > (Empresa.Num_Tot_Acciones.AsFloat) then
         begin
            ieNumAcciones.SetFocus;
            raise EInterFrame.Create('El número de acciones, no puede ser mayor al total de acciones de la empresa');
         end;
         if IsNewData then
         begin
            Fh_Alta.AsDateTime        := Now;
            Cve_Usuario_Alta.AsString := Objeto.DameUsuario;
            Fh_Alta.DrawControl;
            Cve_Usuario_Alta.DrawControl;
         end;
         ObtPctAcciones;
         Realizado := True
      except
         on e: EInterFrame do
         begin
            MessageDlg(e.Message, mtInformation, [mbOK], 0);
            Realizado := False;
         end;
      end;
   end;
end;

procedure TWPerAcc.InterForma1DespuesNuevo(Sender: TObject);
begin
   ObtInfoAccionistas;
   ieIdEmpresa.SetFocus;
end;

procedure TWPerAcc.InterForma1DespuesModificar(Sender: TObject);
begin
   ieNumAcciones.SetFocus;
end;

procedure TWPerAcc.InterForma1DespuesEliminar(Sender: TObject);
begin
   ObtInfoAccionistas;
end;

procedure TWPerAcc.InterForma1DespuesAceptar(Sender: TObject);
begin
   ObtInfoAccionistas;
end;

procedure TWPerAcc.InterForma1DespuesCancelar(Sender: TObject);
begin
   ObtInfoAccionistas;
end;

procedure TWPerAcc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;
end.
