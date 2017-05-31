//------------------------------------------------------------------------------
// Función    : Opciones de Reporte GMSLA de proemio ICB
// Desarrollo : Cesar Zamora Ramirez
// Fecha      : 03 de Junio del 2011
//------------------------------------------------------------------------------

unit IntOpRpGMSLA;
interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, InterEdit,
   IntFind, UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, DBCtrls, IntCtto,
   IntProemioICB;

Type
  TOpRpGMSLA = Class;

  TWOpRpGMSLA = Class(TForm)
    InterForma1 : TInterForma;
    lTasa: TLabel;
    ieTasa: TInterEdit;
    cbSelTodoOpciones: TCheckBox;
    lvOpciones: TListView;
    lvAforosGpo: TListView;
    lAforosGpo: TLabel;
    cbSelTodoAforos: TCheckBox;
    lOpcReporte: TLabel;
    lAgtProcesos: TLabel;
    ieAgtProcesos: TInterEdit;

    procedure PintaValores;
    procedure LimpiaValores;

    procedure cbSelTodoOpcionesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure InterForma1BtnAyudaClick(Sender: TObject);
    procedure InterForma1BtnSalirClick(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure cbSelTodoAforosClick(Sender: TObject);
    private
      { Private declarations }
    public
      Objeto : TOpRpGMSLA;
    end;


  TOpRpGMSLA = class(TInterFrame)
    private
      vProemio       : TProemioICB;
      vieTasa        : TInterEdit;
      vieAgtProcesos : TInterEdit;
      vlvAforosGpo   : TListView;
      vlvOpciones    : TListView;
    protected
      procedure   AgregarFila(lvw : Tlistview; informacion : Array of String);
    public
      constructor Create( AOwner : TComponent ); override;
      function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    published
      property    Proemio        : TProemioICB Read vProemio       Write vProemio;
      property    pieTasa        : TInterEdit  Read vieTasa        Write vieTasa;
      property    pieAgtProcesos : TInterEdit  Read vieAgtProcesos Write vieAgtProcesos;
      property    plvAforosGpo   : TListView   Read vlvAforosGpo   Write vlvAforosGpo;
      property    plvOpciones    : TListView   Read vlvOpciones    Write vlvOpciones;
    end;

implementation
   {$R *.DFM}

constructor TOpRpGMSLA.Create( AOwner : TComponent );
begin
   inherited;
   UseQuery        := True;
   ShowMenuReporte := True;
   AutoRefresh     := False;
end;

procedure TOpRpGMSLA.AgregarFila(lvw : Tlistview; informacion : array of String);
var
   fila : Tlistitem;
   n    : Integer;
begin
   for n := low(informacion) to high(informacion) do
   begin
      with lvw do
         if n = 0 then
         begin
            fila         := Items.Add;
            fila.Caption := informacion[n]
         end
         else
            fila.SubItems.Add(informacion[n]);
   end;
end;

function TOpRpGMSLA.ShowWindow(FormaTipo: TFormaTipo):Integer;
var
   W   : TWOpRpGMSLA;
   Qry : TQuery;
begin
   W := TWOpRpGMSLA.Create(Self);
   try
      W.Objeto                 := Self;
      W.InterForma1.InterFrame := Self;
      W.InterForma1.FormaTipo  := FormaTipo;
      W.lvAforosGpo.Items.Clear;

      try
         Qry := GetSqlQuery(' select gpo.cve_grupo, gpo.desc_grupo, '
                          + '        nvl(gpo.pct_aforo_gpo,0) as pct_aforo_gpo, '
                          + '        nvl(det.pct_aforo,0) as pct_aforo_cto, '
                          + '        (case when nvl(det.pct_aforo,0) < nvl(gpo.pct_aforo_gpo,0) then   nvl(gpo.pct_aforo_gpo,0) '
                          + '         else                                                             nvl(det.pct_aforo,0) '
                          + '         end) as pct_aforo '
                          + '   from sb_grupo_aforo            gpo, '
                          + '        sb_aforo_contrato_detalle det, '
                          + '        sb_aforo_contrato         cto '
                          + '  where gpo.id_empresa       = ' + Proemio.Contrato.Id_Empresa.AsSQL
                          + '    and gpo.cve_medio        = ''' + trim(cPrestamoValores) + ''''
                          + '    and gpo.sit_aforo_gpo    = ''AC'''
                          + '    and det.id_empresa(+)    = gpo.id_empresa '
                          + '    and det.cve_grupo(+)     = gpo.cve_grupo '
                          + '    and det.cve_medio(+)     = gpo.cve_medio '
                          + '    and det.id_contrato(+)   = ' + Proemio.Contrato.Id_Contrato.AsSQL
                          + '    and cto.id_contrato(+)   = det.id_contrato '
                          + '    and cto.cve_medio(+)     = det.cve_medio '
                          + '    and cto.sit_aforo_cto(+) = ''AC'''
                          + '    and cto.f_vigencia(+)   >= trunc(sysdate) '
                          + ' order by gpo.cve_grupo, gpo.desc_grupo',
                            Apli.DataBaseName, Apli.SessionName, True);
         if Qry <> nil then
            while not Qry.eof do
            begin
               AgregarFila(W.lvAforosGpo, [trim(Qry.FieldByName('CVE_GRUPO').AsString),
                                           trim(Qry.FieldByName('DESC_GRUPO').AsString),
                                           FloatToStr(Qry.FieldByName('PCT_AFORO').AsFloat),
                                           FloatToStr(Qry.FieldByName('PCT_AFORO_GPO').AsFloat),
                                           FloatToStr(Qry.FieldByName('PCT_AFORO_CTO').AsFloat)
                                           ]);
               Qry.next;
            end;
      finally
         if Qry <> nil then
            Qry.Free;
      end;

      // Configuracion de opciones en reporte
      Proemio.Formato_CtoMarco.GetFromControl;
      W.ieTasa.Enabled               := (trim(Proemio.Formato_CtoMarco.AsString) = '2');
      W.ieAgtProcesos.Enabled        := (trim(Proemio.Formato_CtoMarco.AsString) = '2');
      W.lOpcReporte.Enabled          := (trim(Proemio.Formato_CtoMarco.AsString) = '2');
      W.cbSelTodoOpciones.Enabled    := (trim(Proemio.Formato_CtoMarco.AsString) = '2');
      W.lvOpciones.Enabled           := (trim(Proemio.Formato_CtoMarco.AsString) = '2');
      
      W.InterForma1.ShowBtnNuevo     := False;
      W.InterForma1.ShowBtnModificar := False;
      W.InterForma1.ShowBtnEliminar  := False;
      W.InterForma1.ShowBtnBuscar    := False;
      W.InterForma1.ShowBtnAceptar   := False;
      W.InterForma1.ShowBtnCancelar  := False;
      W.InterForma1.ShowBtnAyuda     := True;
      W.InterForma1.ShowBtnSalir     := True;
      W.InterForma1.ShowGrid         := False;
      W.InterForma1.ShowNavigator    := False;
      W.InterForma1.Funcion          := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow                     := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

procedure TWOpRpGMSLA.InterForma1DespuesShow(Sender: TObject);
begin
   InterForma1.BtnAyuda.Caption := '&Aceptar';
   InterForma1.BtnSalir.Caption := '&Cancelar';
end;

procedure TWOpRpGMSLA.cbSelTodoAforosClick(Sender: TObject);
var
   n : Integer;
begin
   for n:=0 to Objeto.plvAforosGpo.Items.Count-1 do
      Objeto.plvAforosGpo.Items[n].Checked := cbSelTodoAforos.Checked;
end;

procedure TWOpRpGMSLA.cbSelTodoOpcionesClick(Sender: TObject);
var
   n : Integer;
begin
   for n:=0 to Objeto.plvOpciones.Items.Count-1 do
      Objeto.plvOpciones.Items[n].Checked := cbSelTodoOpciones.Checked;
end;

procedure TWOpRpGMSLA.PintaValores;
var
   n : Integer;
begin
   for n:=0 to Objeto.plvAforosGpo.Items.Count-1 do
      Objeto.plvAforosGpo.Items[n].Checked := (StrToInt(Objeto.plvAforosGpo.Items[n].SubItems[3]) > 0);

   for n:=0 to Objeto.plvOpciones.Items.Count-1 do
      Objeto.plvOpciones.Items[n].Checked := False;
   if trim(Objeto.Proemio.Formato_CtoMarco.AsString) = '2' then
   begin
      Objeto.pieTasa.Text                  :=  trim(OpcRpGMSLACtoMarco.Tasa);
      Objeto.pieAgtProcesos.Text           :=  trim(OpcRpGMSLACtoMarco.AgtProcesos);
      Objeto.plvOpciones.Items[0].Checked  := (trim(OpcRpGMSLACtoMarco.Opcion1)  = 'X');
      Objeto.plvOpciones.Items[1].Checked  := (trim(OpcRpGMSLACtoMarco.Opcion2)  = 'X');
      Objeto.plvOpciones.Items[2].Checked  := (trim(OpcRpGMSLACtoMarco.Opcion3)  = 'X');
      Objeto.plvOpciones.Items[3].Checked  := (trim(OpcRpGMSLACtoMarco.Opcion4)  = 'X');
      Objeto.plvOpciones.Items[4].Checked  := (trim(OpcRpGMSLACtoMarco.Opcion5)  = 'X');
      Objeto.plvOpciones.Items[5].Checked  := (trim(OpcRpGMSLACtoMarco.Opcion6)  = 'X');
      Objeto.plvOpciones.Items[6].Checked  := (trim(OpcRpGMSLACtoMarco.Opcion7)  = 'X');
      Objeto.plvOpciones.Items[7].Checked  := (trim(OpcRpGMSLACtoMarco.Opcion8)  = 'X');
      Objeto.plvOpciones.Items[8].Checked  := (trim(OpcRpGMSLACtoMarco.Opcion9)  = 'X');
      Objeto.plvOpciones.Items[9].Checked  := (trim(OpcRpGMSLACtoMarco.Opcion10) = 'X');
      Objeto.plvOpciones.Items[10].Checked := (trim(OpcRpGMSLACtoMarco.Opcion11) = 'X');
      Objeto.plvOpciones.Items[11].Checked := (trim(OpcRpGMSLACtoMarco.Opcion12) = 'X');
      Objeto.plvOpciones.Items[12].Checked := (trim(OpcRpGMSLACtoMarco.Opcion13) = 'X');
      Objeto.plvOpciones.Items[13].Checked := (trim(OpcRpGMSLACtoMarco.Opcion14) = 'X');
   end
   else
      LimpiaValores;
end;

procedure TWOpRpGMSLA.FormShow(Sender: TObject);
begin
   Objeto.pieTasa            := ieTasa;
   Objeto.pieAgtProcesos     := ieAgtProcesos;
   Objeto.plvAforosGpo       := lvAforosGpo;
   Objeto.plvOpciones        := lvOpciones;
   Objeto.pieTasa.Text       := '0.00';
   cbSelTodoAforos.Checked   := False;
   cbSelTodoOpciones.Checked := False;
   PintaValores;
end;

procedure TWOpRpGMSLA.LimpiaValores;
begin
   with OpcRpGMSLACtoMarco do
   begin
      Tasa        := '0.00';
      AgtProcesos := '';
      Opcion1     := '';
      Opcion2     := '';
      Opcion3     := '';
      Opcion4     := '';
      Opcion5     := '';
      Opcion6     := '';
      Opcion7     := '';
      Opcion8     := '';
      Opcion9     := '';
      Opcion10    := '';
      Opcion11    := '';
      Opcion12    := '';
      Opcion13    := '';
      Opcion14    := '';
   end;
end;

procedure TWOpRpGMSLA.InterForma1BtnAyudaClick(Sender: TObject);
var
   Qry : TQuery;
   n   : Integer;
begin
   if trim(Objeto.pieTasa.Text) = '' then
   begin
      MessageDlg('Ingrese una Tasa', mtInformation, [mbOk], 0);
      exit;
   end;

   RunSQL(' delete sb_aforo_contrato_detalle '
        + ' where id_empresa  = ' + Objeto.Proemio.Contrato.Id_Empresa.AsSQL
        + '   and cve_medio   = ''' + trim(cPrestamoValores) + ''''
        + '   and id_contrato = ' + Objeto.Proemio.Contrato.Id_Contrato.AsSQL,
          Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True);
   RunSQL(' delete sb_aforo_contrato '
        + ' where id_contrato = ' + Objeto.Proemio.Contrato.Id_Contrato.AsSQL
        + '   and cve_medio   = ''' + trim(cPrestamoValores) + '''',
          Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True);

   // SB_AFORO_CONTRATO, es constraint de SB_AFORO_CONTRATO_DETALLE
   RunSQL(' insert into sb_aforo_contrato (cve_medio, id_contrato, pct_inicial, pct_minimo, sit_aforo_cto, f_vigencia) '
        + ' values ( ''PRVA'', ' + Objeto.Proemio.Contrato.Id_Contrato.AsSQL + ', 0, 0, ''AC'', trunc(SYSDATE)+360)',
          Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True);
   for n := 0 to Objeto.plvAforosGpo.Items.Count-1 do
   begin
      if Objeto.plvAforosGpo.Items[n].Checked then
         RunSQL(' insert into sb_aforo_contrato_detalle (id_empresa, cve_grupo, cve_medio, id_contrato, pct_aforo) '
              + ' values ( ' + IntToStr(Objeto.Proemio.Contrato.Id_Empresa.AsInteger) + ', '''
              + trim(Objeto.plvAforosGpo.Items[n].Caption) + ''', '''
              + trim(cPrestamoValores) + ''', '
              + IntToStr(Objeto.Proemio.Contrato.Id_Contrato.AsInteger) + ', '
              + trim(Objeto.plvAforosGpo.Items[n].SubItems[1]) + ')',
                Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True);
   end;

   LimpiaValores;
   with OpcRpGMSLACtoMarco do
   begin
      Tasa        := trim(Objeto.pieTasa.Text);
      AgtProcesos := trim(Objeto.pieAgtProcesos.Text);
      if Objeto.plvOpciones.Items[0].Checked  then   Opcion1  := 'X';
      if Objeto.plvOpciones.Items[1].Checked  then   Opcion2  := 'X';
      if Objeto.plvOpciones.Items[2].Checked  then   Opcion3  := 'X';
      if Objeto.plvOpciones.Items[3].Checked  then   Opcion4  := 'X';
      if Objeto.plvOpciones.Items[4].Checked  then   Opcion5  := 'X';
      if Objeto.plvOpciones.Items[5].Checked  then   Opcion6  := 'X';
      if Objeto.plvOpciones.Items[6].Checked  then   Opcion7  := 'X';
      if Objeto.plvOpciones.Items[7].Checked  then   Opcion8  := 'X';
      if Objeto.plvOpciones.Items[8].Checked  then   Opcion9  := 'X';
      if Objeto.plvOpciones.Items[9].Checked  then   Opcion10 := 'X';
      if Objeto.plvOpciones.Items[10].Checked then   Opcion11 := 'X';
      if Objeto.plvOpciones.Items[11].Checked then   Opcion12 := 'X';
      if Objeto.plvOpciones.Items[12].Checked then   Opcion13 := 'X';
      if Objeto.plvOpciones.Items[13].Checked then   Opcion14 := 'X';
   end;
   InterForma1.Salir;
end;

procedure TWOpRpGMSLA.InterForma1BtnSalirClick(Sender: TObject);
begin
   InterForma1.Salir;
end;
end.

