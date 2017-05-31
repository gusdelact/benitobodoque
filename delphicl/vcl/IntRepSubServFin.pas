unit IntRepSubServFin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, InterFor, IntLinkit, Buttons, InterEdit, ComCtrls, ExtCtrls,
  IntSGCtrl, Db, DBTables, IntSecuAplic, IntEmpre, IntFrm, IntFind, Grids,
  DBGrids, RxMemDS;

type
  TRepSSF = class;

  TWSubServFin = class(TForm)
    ifrepssf         : TInterForma;
    ilEmpresa        : TInterLinkit;
    qbitacora        : TQuery;
    qDetalle         : TQuery;
    psplitter        : TPanel;
    btnHideFiltros   : TSpeedButton;
    pCabecera        : TPanel;
    sgcBitacora      : TSGCtrl;
    pcDetalle        : TPageControl;
    tsAuditoria      : TTabSheet;
    tsDetalle        : TTabSheet;
    gbFiltros        : TGroupBox;
    lbidauditoria    : TLabel;
    lbEmpresa        : TLabel;
    lbMedio          : TLabel;
    lbAplicacion     : TLabel;
    lbevento         : TLabel;
    lbReferencia     : TLabel;
    lbGrupo          : TLabel;
    ieIdAuditoria    : TInterEdit;
    edIdEmpresa      : TEdit;
    bbEmpresa        : TBitBtn;
    edNombreEmpresa  : TEdit;
    edMedio          : TEdit;
    bbMedio          : TBitBtn;
    edDescMedio      : TEdit;
    edAplicacion     : TEdit;
    edEvento         : TEdit;
    bbevento         : TBitBtn;
    edDescEvento     : TEdit;
    dtpfini          : TDateTimePicker;
    dtpffin          : TDateTimePicker;
    edReferencia     : TEdit;
    edGrupo          : TEdit;
    cbPeriodo        : TCheckBox;
    gbDetalle        : TGroupBox;
    sgcDetalle       : TSGCtrl;
    bbAgrDet         : TBitBtn;
    bbEliDet         : TBitBtn;
    bbLimDet         : TBitBtn;
    pfiltro          : TPanel;
    edCampo          : TEdit;
    lbcampo          : TLabel;
    lbValor          : TLabel;
    edValor          : TEdit;
    bbAceptar        : TBitBtn;
    bbCancelar       : TBitBtn;
    rxmdDetalle      : TRxMemoryData;
    dbgDetalle       : TDBGrid;
    rxmdDetalleCampo : TStringField;
    rxmdDetalleValor : TStringField;
    dsDetalle        : TDataSource;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ifrepssfDespuesShow(Sender: TObject);
    procedure cbPeriodoClick(Sender: TObject);
    procedure ilEmpresaCapture(Sender: TObject; var Show: Boolean);
    procedure bbEmpresaClick(Sender: TObject);
    procedure ilEmpresaEjecuta(Sender: TObject);
    procedure ifrepssfPreview(Sender: TObject);
    procedure sgcBitacoraDblClick(Sender: TObject);
    procedure bbMedioClick(Sender: TObject);
    procedure bbeventoClick(Sender: TObject);
    procedure btnHideFiltrosClick(Sender: TObject);
    procedure bbLimDetClick(Sender: TObject);
    procedure bbAgrDetClick(Sender: TObject);
    procedure bbCancelarClick(Sender: TObject);
    procedure bbAceptarClick(Sender: TObject);
    procedure bbEliDetClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Objeto  : TRepSSF;
    vg_Show : Boolean;
  end;

  TRepSSF = class(TInterFrame)
    private
    protected

    public
      { Public declarations }
      Id_Auditoria,
      Id_Empresa,
      Cve_Aplic,
      Cve_Medio,
      Cve_Tipo_Evento,
      F_Inicial,
      F_Final,
      Referencia,
      Cve_Grupo        : TInterCampo;

      pCve_Aplic,
      pCve_Medio,
      pCve_Grupo       : String;

      Empresa      : TEmpresa;
      secuApli     : TSecuAplic;

      constructor Create( AOwner : TComponent ); override;
      destructor  Destroy; override;
      function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    published
    end;

var
  WSubServFin: TWSubServFin;

implementation

{$R *.DFM}
constructor TRepSSF.Create( AOwner : TComponent );
begin
  Inherited;
    Id_Auditoria         := CreaCampo('ID_AUDITORIA',    ftFloat,  tsNinguno, tsNinguno, False);
    Id_Auditoria.Size    := 10;
    Id_Empresa           := CreaCampo('ID_EMPRESA',      ftFloat,  tsNinguno, tsNinguno, False);
    Id_Empresa.Size      := 8;
    Cve_Aplic            := CreaCampo('CVE_APLIC',       ftString, tsNinguno, tsNinguno, False);
    Cve_Aplic.Size       := 12;
    Cve_Medio            := CreaCampo('CVE_MEDIO',       ftString, tsNinguno, tsNinguno, False);
    Cve_Medio.Size       := 8;
    Cve_Tipo_Evento      := CreaCampo('CVE_TIPO_EVENTO', ftString, tsNinguno, tsNinguno, False);
    Cve_Tipo_Evento.Size := 16;
    F_Inicial            := CreaCampo('F_INICIAL',       ftDate, tsNinguno, tsNinguno, False);
    F_Final              := CreaCampo('F_FINAL',         ftDate, tsNinguno, tsNinguno, False);
    Referencia           := CreaCampo('REFERENCIA',      ftString, tsNinguno, tsNinguno, False);
    Referencia.Size      := 60;
    Cve_Grupo            := CreaCampo('CVE_GRUPO',       ftString, tsNinguno, tsNinguno, False);;
    Cve_Grupo.Size       := 16;

    UseQuery  := True;
    HelpFile  := Emptystr;

    Empresa                             := TEmpresa.Create(self);
    Empresa.MasterSource                := Self;
    Empresa.ID_Empresa.MasterField      := 'ID_EMPRESA';
    secuApli                            := TSecuAplic.Create(self);
    secuApli.MasterSource               := Self;
    secuApli.CVE_APLICACION.MasterField := 'CVE_APLIC';
end;

Destructor TRepSSF.Destroy;
begin
  if Empresa  <> Nil then
    Empresa.free;
  if secuApli <> Nil then
    secuApli.free;
  inherited;
end;

function TRepSSF.ShowWindow(FormaTipo : TFormaTipo) : Integer;
var W : TWSubServFin;

begin
   W := TWSubServFin.Create(Self);
   try
      W.Objeto                    := Self;
      W.ifrepssf.InterFrame       := Self;
      W.ifrepssf.FormaTipo        := ftConsulta;
      W.ifrepssf.ShowGrid         := False;
      W.ifrepssf.ShowNavigator    := False;
      W.ifrepssf.Funcion          := FInterFun;
      W.ifrepssf.ShowBtnModificar := False;
      W.ifrepssf.ShowModal;
      ShowWindow := W.ifrepssf.ModalResult;
   finally
      W.Free;
   end;
end;

procedure TWSubServFin.FormShow(Sender: TObject);
begin
  Objeto.Id_Auditoria.Control                := ieIdAuditoria;
  Objeto.Id_Empresa.Control                  := edIdEmpresa;
  Objeto.Empresa.ID_Empresa.Control          := edIdEmpresa;
  Objeto.Empresa.PersonaMoral.Nombre.Control := edNombreEmpresa;
  Objeto.Cve_Aplic.Control                   := edAplicacion;
  Objeto.Cve_Medio.Control                   := edMedio;
  Objeto.Cve_Tipo_Evento.Control             := edEvento;
  Objeto.F_Inicial.Control                   := dtpfini;
  Objeto.F_Final.Control                     := dtpffin;
  Objeto.Referencia.Control                  := edReferencia;
  Objeto.Cve_Grupo.Control                   := edGrupo;
end;

procedure TWSubServFin.FormDestroy(Sender: TObject);
begin
  Objeto.Id_Auditoria.Control                := nil;
  Objeto.Id_Empresa.Control                  := nil;
  Objeto.Empresa.ID_Empresa.Control          := nil;
  Objeto.Empresa.PersonaMoral.Nombre.Control := nil;
  Objeto.Cve_Aplic.Control                   := nil;
  Objeto.Cve_Medio.Control                   := nil;
  Objeto.Cve_Tipo_Evento.Control             := nil;
  Objeto.F_Inicial.Control                   := nil;
  Objeto.F_Final.Control                     := nil;
  Objeto.Referencia.Control                  := nil;
  Objeto.Cve_Grupo.Control                   := nil;
end;

procedure TWSubServFin.ifrepssfDespuesShow(Sender: TObject);
Var sql  : String;
    qDat : TQuery;

begin
  ifrepssf.BtnPreview.Visible := True;
  ifrepssf.BtnPreview.Caption := '&Buscar';
  ifrepssf.BtnAyuda.Visible   := False;
  Objeto.F_Inicial.AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
  dtpfini.DateTime            := Objeto.Apli.DameFechaEmpresaDia('D000');
  Objeto.F_Final.AsDateTime   := Objeto.Apli.DameFechaEmpresaDia('D000');
  dtpffin.DateTime            := Objeto.Apli.DameFechaEmpresaDia('D000');
  Objeto.Cve_Medio.AsString   := Objeto.pCve_Medio;
  edDescMedio.Text            := Emptystr;
  Objeto.Cve_Aplic.AsString   := Objeto.pCve_Aplic;
  Objeto.Cve_Grupo.AsString   := Objeto.pCve_Grupo;
  if Objeto.pCve_Medio <> Emptystr then Begin
    qDat := TQuery.Create(nil);
    Try
      sql := 'SELECT cve_medio, ' +
                   ' desc_medio ' +
              ' FROM medio ' +
             ' WHERE cve_medio = ' + Quotedstr(Objeto.pCve_Medio);
      qDat.DatabaseName := Objeto.Apli.DataBaseName;
      qDat.SessionName  := Objeto.Apli.SessionName;
      qDat.Close;
      qDat.SQL.Clear;
      qDat.SQL.Add(sql);
      qDat.Open;
      if Not qDat.Fields[0].IsNull then
        edDescMedio.Text := qDat.FieldByName('desc_medio').AsString;
    Finally
      qDat.Close;
      qDat.Free;
    end;
    bbMedio.Enabled := False;
  end;
  if Objeto.pCve_Aplic <> Emptystr then
    edAplicacion.Enabled := False;
  if Objeto.pCve_Grupo <> Emptystr then
    edGrupo.Enabled := False;
  sgcbitacora.Width := pCabecera.Width - 1;
  qbitacora.DatabaseName := Objeto.Apli.DataBaseName;
  qbitacora.SessionName  := Objeto.Apli.SessionName;
  qDetalle.DatabaseName  := Objeto.Apli.DataBaseName;
  qDetalle.SessionName   := Objeto.Apli.SessionName;
  vg_show                := True;
  pcDetalle.ActivePage   := tsAuditoria;
  pfiltro.SendToBack;
end;

procedure TWSubServFin.cbPeriodoClick(Sender: TObject);
begin
  dtpfini.Enabled := False;
  dtpffin.Enabled := False;
  if cbPeriodo.Checked then Begin
    dtpfini.Enabled := True;
    dtpffin.Enabled := True;
  end;
end;

procedure TWSubServFin.bbEmpresaClick(Sender: TObject);
begin
  Objeto.Empresa.Busca;
end;

procedure TWSubServFin.ilEmpresaCapture(Sender: TObject;
  var Show: Boolean);
begin
  Show := True;
end;

procedure TWSubServFin.ilEmpresaEjecuta(Sender: TObject);
begin
  Objeto.Empresa.FindKey([ilEmpresa.Buffer]);
end;

procedure TWSubServFin.ifrepssfPreview(Sender: TObject);
Var sql,
    sql_1,
    sql_2 : String;
    vli   : Integer;

begin
  Objeto.GetFromControl;
  sgcBitacora.Clear(' ');
  rxmdDetalle.DisableControls;
  sql_1 := Emptystr;
  sql_2 := Emptystr;
  vli   := 1;
  if rxmdDetalle.RecordCount > 0 then Begin
    rxmdDetalle.First;
    sql_1 := ' AND (';
    While Not rxmdDetalle.Eof do Begin
      if (Trim(rxmdDetalleCampo.AsString) <> EmptyStr) and (Trim(rxmdDetalleValor.AsString) <> Emptystr) then Begin
        if vli = 1 then
          sql_1 := sql_1 + ' (b.campo = ' + Quotedstr(Trim(rxmdDetalleCampo.AsString)) +
                           ' AND b.valor = ' + Quotedstr(Trim(rxmdDetalleValor.AsString)) + ') '
        else
          sql_1 := sql_1 + ' OR (b.campo = ' + Quotedstr(Trim(rxmdDetalleCampo.AsString)) +
                           ' AND b.valor = ' + Quotedstr(Trim(rxmdDetalleValor.AsString)) + ') ';
      end
      else if (Trim(rxmdDetalleCampo.AsString) <> EmptyStr) then Begin
        if vli = 1 then
          sql_1 := sql_1 + ' (b.campo = ' + Quotedstr(Trim(rxmdDetalleCampo.AsString)) + ') '
        else
          sql_1 := sql_1 + ' OR (b.campo = ' + Quotedstr(Trim(rxmdDetalleCampo.AsString)) + ') ';
      end
      else if (Trim(rxmdDetalleValor.AsString) <> Emptystr) then Begin
        if vli = 1 then
          sql_1 := sql_1 + ' (b.valor = ' + Quotedstr(Trim(rxmdDetalleValor.AsString)) + ') '
        else
          sql_1 := sql_1 + ' OR (b.valor = ' + Quotedstr(Trim(rxmdDetalleValor.AsString)) + ') ';
      end;
      rxmdDetalle.Next;
      Inc(vli);
    end;
    sql_1 := sql_1 + ') ';
  end;

  qDetalle.close;
  sgcDetalle.Clear(' ');
  sql := ' SELECT a.id_auditoria, ' +
                ' a.cve_aplic, ' +
                ' a.cve_medio, ' +
                ' a.cve_tipo_evento, ' +
                ' a.cve_usuario, ' +
                ' (Select Nombre ' +
                   ' from Persona ' +
                  ' Where id_persona = (select h.id_persona ' +
                                        ' from Usuario h ' +
                                       ' where h.cve_usuario = a.cve_usuario)) as nombre, ' +
                ' a.fh_registro, ' +
                ' a.metodo, ' +
                ' a.nivel_auditoria, ' +
                ' a.referencia, ' +
                ' a.cve_grupo ' +
           ' FROM Auditoria_Corp a ';
  if sql_1 <> Emptystr then
    sql := sql + ' , '+
                 ' Auditoria_Detalle b ';
  sql := sql + ' WHERE 1 = 1 ';
  if sql_1 <> Emptystr then
    sql := sql + ' AND b.id_auditoria = a.id_auditoria ' + sql_1;
  if Objeto.Id_Auditoria.AsString <> EmptyStr then
    sql := sql + ' AND a.id_auditoria = ' + Objeto.Id_Auditoria.AsSQL;
  if Objeto.Id_Empresa.AsString <> Emptystr then
    sql := sql + ' AND a.id_empresa = ' + Objeto.Id_Empresa.AsSQL;
  if Objeto.Cve_Medio.AsString <> Emptystr then
    sql := sql + ' AND a.cve_medio = ' + Quotedstr(Objeto.Cve_Medio.AsString);
  if Objeto.Cve_Aplic.AsString <> Emptystr then
    sql := sql + ' AND a.cve_aplic = ' + Quotedstr(Objeto.Cve_Aplic.AsString);
  if Objeto.Cve_Tipo_Evento.AsString <> Emptystr then
    sql := sql + ' AND a.cve_tipo_evento = ' + Quotedstr(Objeto.Cve_Tipo_Evento.AsString);
  if cbPeriodo.Checked then
    sql := sql + ' AND a.f_operacion BETWEEN to_date(' + Quotedstr(FormatDateTime('dd/mm/yyyy', dtpfini.DateTime)) +
                                            ', ' + Quotedstr('dd/mm/yyyy') + ') ' +
                                       ' AND to_date(' + Quotedstr(FormatDateTime('dd/mm/yyyy', dtpffin.DateTime)) + ') ';
  if Objeto.Referencia.AsString <> Emptystr then
    sql := sql + ' AND a.referencia = ' + Quotedstr(Objeto.Referencia.AsString);
  if Objeto.Cve_Grupo.AsString <> Emptystr then
    sql := sql + ' AND a.cve_grupo = ' + Quotedstr(Objeto.Cve_Grupo.AsString);
  sql := sql + ' ORDER BY a.fh_registro DESC ';
  qbitacora.Close;
  qbitacora.SQL.Clear;
  qbitacora.SQL.Add(sql);
  qbitacora.Open;
  qbitacora.First;
  qbitacora.FieldByName('id_auditoria').DisplayLabel    := 'Auditoría' + #30 + '>C';
  qbitacora.FieldByName('cve_aplic').DisplayLabel       := 'Aplicación' + #30 + '>C';
  qbitacora.FieldByName('cve_medio').DisplayLabel       := 'Medio' + #30 + '>C';
  qbitacora.FieldByName('cve_tipo_evento').DisplayLabel := 'Tipo Evento' + #30 + '>C';
  qbitacora.FieldByName('cve_usuario').DisplayLabel     := 'Clave Usuario' + #30 + '>C';
  qbitacora.FieldByName('nombre').DisplayLabel          := 'Usuario' + #30 + '>C';
  qbitacora.FieldByName('fh_registro').DisplayLabel     := 'Fecha Registro' + #30 + '>C';
  qbitacora.FieldByName('metodo').DisplayLabel          := 'Metodo' + #30 + '>C';
  qbitacora.FieldByName('nivel_auditoria').DisplayLabel := 'Auditoria' + #30 + '>C';
  qbitacora.FieldByName('referencia').DisplayLabel      := 'Referencia' + #30 + '>C';
  qbitacora.FieldByName('cve_grupo').DisplayLabel       := 'Grupo' + #30 + '>C';
  qbitacora.FieldByName('id_auditoria').DisplayWidth    := 10;
  qbitacora.FieldByName('cve_aplic').DisplayWidth       := 12;
  qbitacora.FieldByName('cve_medio').DisplayWidth       := 12;
  qbitacora.FieldByName('cve_tipo_evento').DisplayWidth := 15;
  qbitacora.FieldByName('cve_usuario').DisplayWidth     := 12;
  qbitacora.FieldByName('nombre').DisplayWidth          := 40;
  qbitacora.FieldByName('fh_registro').DisplayWidth     := 20;
  qbitacora.FieldByName('metodo').DisplayWidth          := 30;
  qbitacora.FieldByName('nivel_auditoria').DisplayWidth := 15;
  qbitacora.FieldByName('referencia').DisplayWidth      := 15;
  qbitacora.FieldByName('cve_grupo').DisplayWidth       := 20;
  sgcBitacora.AddQry(qbitacora, True, True, -1, -1, -1, True);
end;

procedure TWSubServFin.sgcBitacoraDblClick(Sender: TObject);
Var sql,
    sql1        : String;
    vln_renglon : Integer;

begin
  qDetalle.Close;
  sgcDetalle.Clear(' ');
  vln_renglon := sgcbitacora.SG.Selection.Top;
  sql1        := Trim(sgcBitacora.CellStr['id_auditoria', vln_renglon]);
  sql := ' SELECT id_auditoria, ' +
                ' cve_tipo_auditoria, ' +
                ' campo, ' +
                ' SUBSTR(valor, 1, 100) as valor' +
           ' FROM Auditoria_Detalle ' +
          ' WHERE id_auditoria = ' + sql1  +//qbitacora.fieldByName('id_auditoria').AsString;
          ' ORDER BY 2 desc, 3 ';
  qDetalle.SQL.Clear;
  qDetalle.SQL.Add(sql);
  qDetalle.Open;
  qDetalle.FieldByName('id_auditoria').Visible            := False;
  qDetalle.FieldByName('cve_tipo_auditoria').DisplayLabel := 'Tipo Auditoria' + #30 + '>C';
  qDetalle.FieldByName('campo').DisplayLabel              := 'Campo' + #30 + '>C';
  qDetalle.FieldByName('valor').DisplayLabel              := 'Valor' + #30 + '>C';
  qDetalle.FieldByName('cve_tipo_auditoria').DisplayWidth := 15;
  qDetalle.FieldByName('campo').DisplayWidth              := 18;
  qDetalle.FieldByName('valor').DisplayWidth              := 40;
  sgcDetalle.AddQry(qDetalle, True, True, -1, -1, -1, True);
end;

procedure TWSubServFin.bbMedioClick(Sender: TObject);
Var T : TInterFindit;

begin
  T := Objeto.CreaBuscador('ITSUBSERFIN.IT','S,S');
  Try
    if T.Execute then Begin
      Objeto.Cve_Medio.AsString := T.DameCampo(0);
      edDescMedio.Text          := T.DameCampo(1);
    end
    else Begin
      Objeto.Cve_Medio.AsString := Emptystr;
      edDescMedio.Text          := Emptystr;
    end;
  finally
    T.Free;
  end;
end;

procedure TWSubServFin.bbeventoClick(Sender: TObject);
Var T : TInterFindit;

begin
  T := Objeto.CreaBuscador('ITTIPOEVEN.IT','S,S');
  Try
    if Objeto.Cve_Medio.AsString <> Emptystr then
      T.WhereString := ' a.cve_medio = ' + Quotedstr(Objeto.Cve_Medio.AsString);
    if T.Execute then Begin
      Objeto.Cve_Tipo_Evento.AsString := T.DameCampo(0);
      edDescEvento.Text               := T.DameCampo(1);
    end
    else Begin
      Objeto.Cve_Tipo_Evento.AsString := Emptystr;
      edDescEvento.Text               := Emptystr;
    end;
  finally
    T.Free;
  end;
end;

procedure TWSubServFin.btnHideFiltrosClick(Sender: TObject);
begin
  if vg_show then Begin
    psplitter.Width := 10;
    vg_show         := False;
  end
  else Begin
    psplitter.Width := 481;
    vg_show         := True;
  end;
  sgcbitacora.Width := pCabecera.Width - 1;
end;

procedure TWSubServFin.bbLimDetClick(Sender: TObject);
begin
  rxmdDetalle.Close;
  rxmdDetalle.Active := False;
  dbgDetalle.Refresh;
end;

procedure TWSubServFin.bbAgrDetClick(Sender: TObject);
begin
  pCabecera.Enabled           := False;
  gbDetalle.Enabled           := False;
  bbAgrDet.Enabled            := False;
  bbEliDet.Enabled            := False;
  bbLimDet.Enabled            := False;
  tsAuditoria.Enabled         := False;
  ifrepssf.BtnPreview.Enabled := False;
  ifrepssf.BtnSalir.Enabled   := False;
  edCampo.Text                := Emptystr;
  edValor.Text                := Emptystr;
  pfiltro.BringToFront;
  edCampo.SetFocus;
end;

procedure TWSubServFin.bbCancelarClick(Sender: TObject);
begin
  pCabecera.Enabled           := True;
  gbDetalle.Enabled           := True;
  bbAgrDet.Enabled            := True;
  bbEliDet.Enabled            := True;
  bbLimDet.Enabled            := True;
  tsAuditoria.Enabled         := True;
  ifrepssf.BtnPreview.Enabled := True;
  ifrepssf.BtnSalir.Enabled   := True;
  edCampo.Text                := Emptystr;
  edValor.Text                := Emptystr;
  pfiltro.SendToBack;
  dbgDetalle.Refresh;
end;

procedure TWSubServFin.bbAceptarClick(Sender: TObject);
begin
//  rxmdDetalle.DisableControls;
  rxmdDetalle.Active := True;
  rxmdDetalle.Append;
  if edCampo.Text <> EmptyStr then
    rxmdDetalleCampo.AsString := edCampo.Text;
  if edValor.Text <> EmptyStr then
    rxmdDetalleValor.AsString := edValor.Text;
  rxmdDetalle.Post;
//  rxmdDetalle.EnableControls;
  pCabecera.Enabled           := True;
  gbDetalle.Enabled           := True;
  bbAgrDet.Enabled            := True;
  bbEliDet.Enabled            := True;
  bbLimDet.Enabled            := True;
  tsAuditoria.Enabled         := True;
  ifrepssf.BtnPreview.Enabled := True;
  ifrepssf.BtnSalir.Enabled   := True;
  edCampo.Text                := Emptystr;
  edValor.Text                := Emptystr;
  pfiltro.SendToBack;
  dbgDetalle.Refresh;
end;

procedure TWSubServFin.bbEliDetClick(Sender: TObject);
begin
  rxmdDetalle.Delete;
  dbgDetalle.Refresh;
end;

end.
