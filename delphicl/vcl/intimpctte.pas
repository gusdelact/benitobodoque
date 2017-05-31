//------------------------------------------------------------------------------
// Función    : Impuestos por Contratante
// Desarrollo : Cesar Zamora Ramirez
// Fecha      : 21 de Mayo del 2009
//------------------------------------------------------------------------------

unit IntImpCtte;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  InterFor, IntFrm, InterApl, StdCtrls, ComCtrls, Buttons, Grids, intCtoHeader,
  UnSQL2, Mask, db, DbTables, ExtCtrls, IntLinkit, InterEdit;

type
  TImpCtte= class;

  TFrmImpCtte = class(TForm)
    iImpCtte: TInterForma;
    lContrato: TLabel;
    sbContrato: TSpeedButton;
    lConEje: TLabel;
    lAnioEje: TLabel;
    eTitular: TEdit;
    gbContratantes: TGroupBox;
    lEtqPTot1: TLabel;
    lEtqPTot2: TLabel;
    lPTotal: TLabel;
    lEtqPCon: TLabel;
    lActivos: TLabel;
    lInactivos: TLabel;
    lvwContratantes: TListView;
    ePContratante: TEdit;
    bRefrescar: TButton;
    bProrratear: TButton;
    pBlanco: TPanel;
    pAzul: TPanel;
    eContrato: TInterEdit;
    linkContrato: TInterLinkit;
    lStaEje: TLabel;
    lGuionEje: TLabel;
    procedure FormShow(Sender: TObject);
    procedure sbContratoClick(Sender: TObject);
    procedure bRefrescarClick(Sender: TObject);
    procedure bProrratearClick(Sender: TObject);
    procedure iImpCtteAntesAceptar(Sender: TObject; IsNewData: Boolean; var Realizado: Boolean);
    procedure iImpCtteAceptar(Sender: TObject; var Realizado: Boolean);
    procedure iImpCtteCancelar(Sender: TObject; var Realizado: Boolean);
    procedure iImpCtteAntesModificar(Sender: TObject; var Realizado: Boolean);
    procedure lvwContratantesCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure linkContratoCapture(Sender: TObject; var Show: Boolean);
    procedure linkContratoEjecuta(Sender: TObject);
    procedure iImpCtteModificar(Sender: TObject; var Realizado: Boolean);
  private
    { Private declarations }
  public
    Objeto: TImpCtte;
  end;



  TImpCtte = class(TInterFrame)
  private
    viContrato     : TInterFrame;
    vlContratantes : TListView;
    vePContratante : TEdit;
    vlPTotal       : TLabel;
    vlAnioEje      : TLabel;
    vlStaEje       : TLabel;
    vFormaTipo     : String;
    procedure      Configura_Impuestos(pId_Contrato : Integer; pActualizaCtte : String);

  {----------------------------------------------------------------------------}
  protected
    procedure      SetiContrato(ctto : TInterFrame);
    procedure      ObtenerPorcentajeTotal;
    procedure      ObtenerEjercicio;
    procedure      AgregarFila(lvw : Tlistview; informacion : Array of String);
    procedure      OnChangeplContratantes(Sender: TObject; Item: TListItem; Change: TItemChange);
    procedure      OnKeyPresspePContratante(Sender: TObject; var Key: Char);
    procedure      OnExitpePContratante(Sender: TObject);

  {----------------------------------------------------------------------------}
  public
    Contrato       : TCtrlCto;

    property       plContratantes : TListView   read vlContratantes write vlContratantes;
    property       pePContratante : TEdit       read vePContratante write vePContratante;
    property       plPTotal       : TLabel      read vlPTotal       write vlPTotal;
    property       plAnioEje      : TLabel      read vlAnioEje      write vlAnioEje;
    property       plStaEje       : TLabel      read vlStaEje       write vlStaEje;

    constructor    Create(AOwner : TComponent); override;
    function       ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    procedure      DataBaseChange; override;
    destructor     Destroy; override;
    procedure      OnAfterLocalizaContrato(Sender : TObject);
  {----------------------------------------------------------------------------}
  published
    { Published declarations }
    property       iContrato      : TInterFrame read viContrato     write SetiContrato;
  end;

var
   FrmImpCtte        : TFrmImpCtte;
   Qry               : TQuery;
   vSQL              : String;
   n                 : Integer;
implementation
   {$R *.DFM}

procedure TImpCtte.SetiContrato(ctto : TInterFrame);
begin
   if ctto <> nil then
   begin
      viContrato := ctto;
      Active     := True;
   end
   else
   begin
      viContrato := nil;
      Active     := False;
   end;
end;

procedure  TImpCtte.AgregarFila(lvw : Tlistview; informacion : array of String);
var
   fila : Tlistitem;
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

procedure TImpCtte.ObtenerEjercicio;
var
   vId_Empresa : Integer;
   vAnioEje    : String;
   vStaEje     : String;
begin
   if Contrato.Active then
      vId_Empresa := Contrato.Id_Empresa.AsInteger
   else
      vId_Empresa := 1;     // Por default es Casa de Bolsa

   try
      Qry := GetSqlQuery(' SELECT ANO, '
                       + '        DECODE(B_LAYOUT, ''V'', ''Cerrado'', ''Abierto'') AS STATUS '
                       + ' FROM SAT_PARAMETROS '
                       + ' WHERE ANO = (SELECT MAX(ANO) FROM SAT_PARAMETROS WHERE ID_EMPRESA = ' + IntToStr(vId_Empresa) + ')'
                       + '   AND ID_EMPRESA = ' + IntToStr(vId_Empresa),
                         DataBaseName, SessionName, True);
      if Qry <> nil then
      begin
         plAnioEje.Caption := IntToStr(Qry.FieldByName('ANO').AsInteger);
         plStaEje.Caption  := Trim(Qry.FieldByName('STATUS').AsString);
      end;

      if trim(plStaEje.Caption) = 'Abierto' then
         plStaEje.Font.Color := clNavy
      else
         plStaEje.Font.Color := clRed;
   finally
      if Qry <> nil then
      begin
         Qry.close;     Qry.free;
      end;
   end;
end;

procedure TImpCtte.OnAfterLocalizaContrato(Sender : TObject);
var
   vImpuesto: String;
begin
   plContratantes.Items.Clear;
   if Contrato.Active then
      with Qry do
         try
            vSQL := ' SELECT ctte.CVE_CONTRATANTE, '
                  + '        per.ID_PERSONA, '
                  + '        per.NOMBRE, '
                  + '        NVL(ctte.PCT_CONTRATO, 0) AS IMPUESTO, '
                  + '        ctte.SIT_CONTRATANTE '
                  + ' FROM CONTRATANTE         ctte '
                  + '      INNER JOIN PERSONA  per ON per.ID_PERSONA  = ctte.ID_PERSONA  '
                  + ' WHERE ctte.ID_CONTRATO = ' + Contrato.Id_Contrato.AsSql
                  + '   AND ctte.CVE_CONTRATANTE IN(''C001'',''C002'',''C003'')';      // Solo se considera Administradores, Titulares y Cotitulares
            Qry  := GetSqlQuery(vSQL, Self.DataBaseName, Self.SessionName, True);

            if Qry <> nil then
            begin
               while not eof do
               begin
                  if length(FieldByName('IMPUESTO').AsString) = 1 then          vImpuesto := FormatFloat('0.00',FieldByName('IMPUESTO').AsFloat)
                  else                                                          vImpuesto := FormatFloat('#.00',FieldByName('IMPUESTO').AsFloat);

                  AgregarFila(plContratantes, [trim(FieldByName('CVE_CONTRATANTE').AsString),
                                               IntToStr(FieldByName('ID_PERSONA').AsInteger),
                                               trim(FieldByName('NOMBRE').AsString),
                                               trim(vImpuesto),
                                               trim(FieldByName('SIT_CONTRATANTE').AsString)
                                              ]);
                  next;
               end;
               close;
            end;
            ObtenerPorcentajeTotal;
         finally
            if Qry <> nil then
            begin
               close;     free;
            end;
         end;
   ObtenerEjercicio;
end;

constructor TImpCtte.Create(AOwner : TComponent);
begin
   inherited;
   UseQuery                  := False;
   Contrato                  := TCtrlCto.Create(Self);
   Contrato.OnAfterLocaliza  := OnAfterLocalizaContrato;
   Contrato.BuscaWhereString := ' CONTRATO.CVE_TIP_CONTRATO IN(''CIBC'', ''IFON'', ''OMSC'')'
                              + ' AND EXISTS(SELECT ID_TITULAR FROM PERSONA_FISICA WHERE ID_PERSONA = CONTRATO.ID_TITULAR)'
                              + ' AND PKGFUNPROCCORP.BDOCTOCONTRATO(ID_CONTRATO, ID_TITULAR, ''D187'') = ''V''';
   Contrato.FilterString     := Contrato.BuscaWhereString;
end;

function TImpCtte.ShowWindow(FormaTipo : TFormaTipo) : Integer;
var
   w : TFrmImpCtte;
begin
   try
      w                          := TFrmImpCtte.Create(Self);
      w.Objeto                   := Self;
      w.iImpCtte.InterFrame      := Self;
      w.iImpCtte.FormaTipo       := FormaTipo;
      w.iImpCtte.ShowGrid        := False;
      w.iImpCtte.ShowNavigator   := False;
      w.iImpCtte.ShowBtnAyuda    := False;
      w.iImpCtte.ShowBtnNuevo    := False;
      w.iImpCtte.ShowBtnEliminar := False;
      w.iImpCtte.ShowBtnBuscar   := False;
      w.iImpCtte.Funcion         := FInterFun;
      w.iImpCtte.ShowModal;
      ShowWindow                 := w.iImpCtte.ModalResult;
   finally
      w.Free;
   end;
end;

procedure TImpCtte.DataBaseChange;
begin
   inherited;
   Contrato.GetParams(Self);
end;

destructor TImpCtte.Destroy;
begin
   Contrato.Id_Contrato.Control := nil;
   Contrato.TITNombre.Control   := nil;
   if (Contrato <> nil) then    Contrato.free;
   inherited;
end;

procedure TFrmImpCtte.FormShow(Sender: TObject);
begin
   Objeto.Contrato.Id_Contrato.Control:= eContrato;
   Objeto.Contrato.TITNombre.Control  := eTitular;
   Objeto.plContratantes              := lvwContratantes;
   Objeto.plContratantes.OnChange     := Objeto.OnChangeplContratantes;
   Objeto.pePContratante              := ePContratante;
   Objeto.pePContratante.OnExit       := Objeto.OnExitpePContratante;
   Objeto.pePContratante.OnKeyPress   := Objeto.OnKeyPresspePContratante;
   Objeto.plPTotal                    := lPTotal;
   Objeto.plAnioEje                   := lAnioEje;
   Objeto.plStaEje                    := lStaEje;

   if Objeto.iContrato <> nil then
   begin
      Objeto.Contrato.ID_CONTRATO.AsInteger := Objeto.iContrato.FieldByName('ID_CONTRATO').AsInteger;
      Objeto.contrato.FindKey([Objeto.Contrato.ID_CONTRATO.AsInteger]);
   end;
   Objeto.ObtenerEjercicio;
end;

procedure TFrmImpCtte.sbContratoClick(Sender: TObject);
begin
   Objeto.Contrato.Busca;
end;

procedure TImpCtte.ObtenerPorcentajeTotal;
var
   vPorTotal : Double;
begin
   if plContratantes.Items.Count = 0 then
      exit;
   vPorTotal := 0.00;

   for n:=0 to plContratantes.Items.Count-1 do
      if trim(plContratantes.Items[n].SubItems[3]) = 'AC' then                  // Considerar solo Contratantes Activos
         vPorTotal := vPorTotal + StrToFloat(plContratantes.Items[n].SubItems[2]);

   if length(FloatToStr(vPorTotal)) = 1 then                                    plPTotal.Caption := FormatFloat('0.00',vPorTotal)
   else                                                                         plPTotal.Caption := FormatFloat('#.00',vPorTotal);

   if StrToFloat(plPTotal.Caption) = 100 then                                   plPTotal.Font.Color := clNavy
   else                                                                         plPTotal.Font.Color := clRed;
end;

procedure TImpCtte.OnChangeplContratantes(Sender: TObject; Item: TListItem; Change: TItemChange);
begin
   if plContratantes.SelCount > 0 then
   begin
      if trim(Item.SubItems[3]) = 'AC' then
        pePContratante.text := plContratantes.Selected.SubItems[2]
      else
        pePContratante.text := '0.00';
      pePContratante.SetFocus;
   end;
end;

procedure TImpCtte.OnKeyPresspePContratante(Sender: TObject; var Key: Char);
begin
   if pos('.', pePContratante.text) = 0 then
   begin
      if (Ord(key) <> VK_BACK ) and (Pos(Key, '0123456789.') = 0) then
         Key := #0;
   end
   else
      if (Ord(key) <> VK_BACK ) and (Pos(Key, '0123456789') = 0) then
         Key := #0;
end;

procedure TImpCtte.OnExitpePContratante(Sender: TObject);
var
   vAux : String;
begin
   if plContratantes.SelCount > 0 then
   begin
      if trim(plContratantes.Selected.SubItems[3]) = 'AC' then
      begin
         if length(trim(pePContratante.text)) = 0 then
            pePContratante.text := '0.00'
         else
            if pos('.', pePContratante.text) = 0 then
               pePContratante.text := trim(pePContratante.text) + '.00'
            else
            begin
               vAux := StrScan(PChar(pePContratante.text), '.');
               vAux := StringReplace(vAux,'.',' ',[rfReplaceAll]);
               case length(trim(vAux)) of
                  0:          pePContratante.text := trim(pePContratante.text) + '00';
                  1:          pePContratante.text := trim(pePContratante.text) + '0';
                  else        pePContratante.text := FormatFloat('0.00', StrToFloat(pePContratante.text));
               end;
            end;
         plContratantes.Selected.SubItems[2] := trim(pePContratante.text);
         ObtenerPorcentajeTotal;
      end
      else
         pePContratante.text := '0.00';
      plContratantes.SetFocus;
   end;
end;

procedure TFrmImpCtte.iImpCtteAntesModificar(Sender: TObject; var Realizado: Boolean);
begin
   Realizado := Objeto.Contrato.Active;
end;

procedure TFrmImpCtte.iImpCtteAntesAceptar(Sender: TObject; IsNewData: Boolean; var Realizado: Boolean);
begin
   Objeto.ObtenerPorcentajeTotal;
   if (Objeto.plPTotal.caption) = '100.00' then
      Realizado := True
   else
   begin
      iImpCtte.ShowError := False;
      MessageDlg('El porcentaje Total es distinto al 100% requerido', mtError, [mbYes], 0);
      Realizado := False;
   end;
end;

// CZR 10-JUNIO-2009     Configura el Impuesto en Cotratante y Constancias
procedure TImpCtte.Configura_Impuestos(pId_Contrato : Integer; pActualizaCtte : String);
var
   Stp : TStoredProc;
begin
   with Stp do
      try
         Stp            := TStoredProc.Create(nil);
         DataBaseName   := Apli.DataBaseName;
         SessionName    := Apli.SessionName;
         StoredProcName := 'PKGSATFUNPROC.CONFIGURA_IMPUESTOS';

         Params.CreateParam(ftInteger, 'pId_Contrato',   ptInPut);
         Params.CreateParam(ftString,  'pUsuario',       ptInPut);
         Params.CreateParam(ftString,  'pActualizaCtte', ptInPut);

         ParamByName('pId_Contrato').AsInteger  := pId_Contrato;
         ParamByName('pUsuario').AsString       := trim(DameUsuario);
         ParamByName('pActualizaCtte').AsString := trim(pActualizaCtte);
         ExecProc;
      finally
         if Stp <> nil then
            Free;
      end;
end;

procedure TFrmImpCtte.iImpCtteAceptar(Sender: TObject; var Realizado: Boolean);
var
   vConActivo : Boolean;
begin
   vConActivo := False;

   for n:=0 to Objeto.plContratantes.Items.Count-1 do
      if trim(Objeto.plContratantes.Items[n].SubItems[3]) = 'AC' then
      begin
         RunSQL(' UPDATE CONTRATANTE ' +
                ' SET PCT_CONTRATO      = ' + Trim(Objeto.plContratantes.Items[n].SubItems[2]) +
                ' WHERE ID_CONTRATO     = ' + Trim(Objeto.Contrato.Id_Contrato.AsSql) +
                '   AND ID_PERSONA      = ' + Trim(Objeto.plContratantes.Items[n].SubItems[0]) +
                '   AND CVE_CONTRATANTE = ''' + Trim(Objeto.plContratantes.Items[n].Caption) + '''',
                objeto.DataBaseName, objeto.SessionName, True);

         RunSQL(' INSERT INTO IMPCTTE_BIT (ID_CONTRATO, CVE_CONTRATANTE, ID_PERSONA, CONSECUTIVO, '
                                       + ' PCT_CONTRATO, ANO, CVE_USUARIO, DESC_MODIF, FH_MODIF) '
              + ' VALUES (' + Trim(Objeto.Contrato.Id_Contrato.AsSql)          + ', '''
                            + Trim(Objeto.plContratantes.Items[n].Caption)     + ''', '
                            + Trim(Objeto.plContratantes.Items[n].SubItems[0])
                            + ', SQ01_IMPCTTE_BIT.NEXTVAL, '
                            + Trim(Objeto.plContratantes.Items[n].SubItems[2]) + ', '
                            + Objeto.plAnioEje.Caption                         + ', '''
                            + Objeto.DameUsuario + ''', ''Modificacion Manual de Porcentaje'', SYSDATE)',
                objeto.DataBaseName, objeto.SessionName, True);
         vConActivo := True;
      end;

   if vConActivo then
   begin
     // Igualar Constancias a Contratantes
      Objeto.Configura_Impuestos(Objeto.Contrato.FieldByName('ID_CONTRATO').AsInteger, 'F');
      realizado := True;
   end
   else
      realizado := False;
end;

procedure TFrmImpCtte.iImpCtteCancelar(Sender: TObject; var Realizado: Boolean);
begin
   Objeto.OnAfterLocalizaContrato(Sender);
   Realizado := True;
end;

procedure TFrmImpCtte.bRefrescarClick(Sender: TObject);
begin
   Objeto.OnAfterLocalizaContrato(Sender);
end;

procedure TFrmImpCtte.bProrratearClick(Sender: TObject);
var
   pct_con   : String;
   vRestante : Double;
   vAuxiliar : Integer;
   vFidFA    : Boolean;
   vAdmin    : Boolean;
   vTit      : Boolean;
begin
   if Objeto.plContratantes.Items.Count > 0 then
   begin
      vRestante := 0;
      vAuxiliar := 0;
      vFidFA    := False;
      vAdmin    := False;
      vTit      := False;

      // Validar si el Concepto del Contrato es Fideicomiso o Fondo de Ahorro
      try
         Qry := GetSqlQuery('SELECT CVE_CONCEP_CTO FROM CONTRATO WHERE ID_CONTRATO = ' + Objeto.Contrato.ID_CONTRATO.AsSQL,
                             Objeto.DataBaseName, Objeto.SessionName, False);
         if Qry <> nil then
            if (trim(Qry.FieldbyName('CVE_CONCEP_CTO').AsString) = 'T006') or (trim(Qry.FieldbyName('CVE_CONCEP_CTO').AsString) = 'T007') then
               vFidFA := True;
      finally
         if Qry <> nil then
         begin
            Qry.Close;     Qry.Free;
         end;
      end;

      for n:=0 to Objeto.plContratantes.Items.Count-1 do
         if trim(Objeto.plContratantes.Items[n].SubItems[3]) = 'AC' then
         begin
            if trim(Objeto.plContratantes.Items[n].Caption) = 'C001' then       // Validar si algun Contratante es Titular
               vTit   := True;
            if trim(Objeto.plContratantes.Items[n].Caption) = 'C002' then       // Validar si algun Contratante es Administrador
               vAdmin := True;
            inc(vAuxiliar);                                                     // Obtener numero de Contratantes Activos
         end;
      pct_con := FormatFloat('#.00',(100/vAuxiliar));

      // Asignar a cada contratante el porcentaje correspondiente
      for n:=0 to Objeto.plContratantes.Items.Count-1 do
      begin
         Objeto.plContratantes.Items[n].SubItems[2] := '0.00';

         if trim(Objeto.plContratantes.Items[n].SubItems[3]) = 'AC' then
         begin
            if (vFidFA) and ((vAdmin) or (vTit)) then
            begin
               if vAdmin then
               begin
                  if trim(Objeto.plContratantes.Items[n].Caption) = 'C002' then     Objeto.plContratantes.Items[n].SubItems[2] := '100.00'
               end
               else
                  if trim(Objeto.plContratantes.Items[n].Caption) = 'C001' then     Objeto.plContratantes.Items[n].SubItems[2] := '100.00';
            end
            else
            begin
               Objeto.plContratantes.Items[n].SubItems[2] := trim(pct_con);
               vRestante := vRestante + StrToFloat(pct_con);
               vAuxiliar := n;                                                  // Obtener ultimo Contratante Activo
            end;
         end;
      end;

      if vRestante > 0 then
      begin
         vRestante := vRestante - StrToFloat(pct_con);                          // Descontar el % del contratante al que se le asignara el restante
         Objeto.plContratantes.Items[vAuxiliar].SubItems[2] := FormatFloat('#.00',(100-vRestante)); // Asignar el restante al ultimo Contratante Activo
      end;
      Objeto.ObtenerPorcentajeTotal;
   end;
end;

procedure TFrmImpCtte.lvwContratantesCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
   if trim(item.SubItems[3]) = 'AC' then                                        Sender.Canvas.Brush.Color := clWhite
   else                                                                         Sender.Canvas.Brush.Color := $00FFD8B0;
end;

procedure TFrmImpCtte.linkContratoCapture(Sender: TObject; var Show: Boolean);
begin
   Show:= (not iImpCtte.CanEdit);
end;

procedure TFrmImpCtte.linkContratoEjecuta(Sender: TObject);
begin
   Objeto.contrato.FindKey([linkContrato.Buffer]);
end;

procedure TFrmImpCtte.iImpCtteModificar(Sender: TObject; var Realizado: Boolean);
begin
   Realizado:= True;
end;
end.
