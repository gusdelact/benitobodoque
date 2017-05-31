// Sistema         : Clase de
// Fecha de Inicio :
// Función forma   : Clase
// Desarrollo por  :
// Comentarios     :
unit IntDocAdic;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, UnSQL2, InterFun, Menus, DBCtrls, Grids, DBGrids, IntMpers, IntDocto,
  IntCtte, ComCtrls, IntDtPk;

Const WM_DESPUESSHOW=WM_USER+1;

type

  TDocAdic = Class;
  TwDocAdic = class(TForm)
    InterForma1: TInterForma;
    BitBtn1: TBitBtn;
    Label11: TLabel;
    dbgContratante: TDBGrid;
    dbnContratante: TDBNavigator;
    dbgDocumento: TDBGrid;
    dbnDocumento: TDBNavigator;
    PanelDocumento: TPanel;
    Label7: TLabel;
    edIdContrato: TEdit;
    lbICveRequisito: TLabel;
    edIdPersona: TEdit;
    edNombrePersona: TEdit;
    PopupPersona: TPopupMenu;
    CatalogoPersona: TMenuItem;
    Label13: TLabel;
    edCveDocumento: TEdit;
    sbCveDocumento: TSpeedButton;
    edDescDocumento: TEdit;
    PopupDocumento: TPopupMenu;
    Catalogo1: TMenuItem;
    GroupBox3: TGroupBox;
    edVersion: TEdit;
    GroupBox1: TGroupBox;
    edFRegistro: TEdit;
    InterDateTimePicker1: TInterDateTimePicker;
    GroupBox2: TGroupBox;
    ListView1: TListView;
    qVersion: TQuery;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1AntesNuevo(Sender: TObject;
      var Realizado: Boolean);
    procedure sbCveDocumentoClick(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    procedure InterForma1Eliminar(Sender: TObject; var Realizado: Boolean);
    procedure InterForma1DespuesModificar(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    Objeto : TDocAdic;
    Procedure DespuesShow(Var Msg:TMessage); message WM_DESPUESSHOW;
  end;

  TDocAdic = class(TInterFrame)
  private
  		FContrato: TInterFrame;

      procedure      Configura_Impuestos(pId_Contrato : Integer; pActualizaCtte : String);    // CZR 10-JUNIO-2009
  protected
  		procedure SetContrato(Ctto: TInterFrame);
  public
    { Public declarations }
		Id_contrato  : TInterCampo;
      Id_Persona   : TInterCampo;
      Cve_Documento: TInterCampo;
      Id_version : TInterCampo;
      F_registro : TInterCampo;

      Persona: TMPersona;
      Documento: TDocumento;
      Contratante: TCtte;

      qDocumento: TQuery;
      //qVersi : TQuery;
      dsContratante: TDataSource;
      dsDocumento  : TDataSource;

      Ventana: TwDocAdic;
    constructor Create( AOwner : TComponent ); override;
     destructor  Destroy; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    function    Reporte:Boolean; override;
    function    InternalBusca : Boolean; override;

    Function  InternalEdit:Boolean; override;
    procedure 	 DataBaseChange; override;
    procedure   dsContratanteChange(Sender: TObject; Field: TField);
    procedure   dsDocumentoChange(Sender: TObject; Field: TField);
    procedure   RefrescaQDocumento;


    property Contrato: TInterFrame Read FContrato Write SetContrato;
  published
  end;

var
   vgCveDocto : String; // CZR 17-Feb-2011

implementation
   {$R *.DFM}

constructor TDocAdic.Create( AOwner : TComponent );
begin
   Inherited;
   Id_contrato  := CreaCampo('ID_CONTRATO',ftInteger,tsNinguno,tsNinguno,True);
   Id_Persona   := CreaCampo('ID_PERSONA',ftInteger,tsNinguno,tsNinguno,True);
   Cve_Documento:= CreaCampo('CVE_DOCUMENTO',ftString,tsNinguno,tsNinguno,True);
   Id_version := CreaCampo('ID_VERSION',ftInteger,tsNinguno,tsNinguno,True);
   F_registro := CreaCampo('F_VERSION',ftDate,tsNinguno,tsNinguno,True);

   Persona:= TMPersona.Create(self);
   Persona.MasterSource :=self;
   Persona.ID_Persona.MasterField := 'ID_PERSONA';

   Documento:= TDocumento.Create(self);
   Documento.MasterSource := self;
   Documento.Cve_documento.MasterField := 'CVE_DOCUMENTO';
   Documento.ShowAll := True;

   Contratante:= TCtte.Create(self);

   dsContratante:= TDataSource.Create(Self);
   dsDocumento  := TDataSource.Create(self);
   qDocumento   := TQuery.Create(self);
   //qVersi  := TQuery.Create(Self);
   dsDocumento.DataSet := qDocumento;

   dsContratante.OnDataChange := dsContratanteChange;
   dsDocumento.OnDataChange := dsDocumentoChange;

   Ventana:= nil;
   FContrato := nil;
   qDocumento := nil;
   //qVersi := nil;

   TableName := 'DOC_ADIC_PERSONA';
   FKeyFields.Add('ID_CONTRATO');
   FKeyFields.Add('ID_PERSONA');
   FKeyFields.Add('CVE_DOCUMENTO');
   UseQuery := True;
   HelpFile := 'IntTemp.hlp';
   ShowMenuReporte := False;
end;

destructor TDocAdic.Destroy;
begin
   if Contratante <> nil then Contratante.Free;
   if Persona <> nil then Persona.Free;
   if Documento <> nil then Documento.Free;
   if dsContratante <> nil then dsContratante.Free;
   if dsDocumento <> nil then dsDocumento.Free;
   if qDocumento <> nil then qDocumento.Free;
//   if qVersi <> nil then qVersi.Free;

   inherited;
end;

procedure TDocAdic.DataBaseChange;
begin
   inherited;
   Contratante.GetParams(Self);
end;

function TDocAdic.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwDocAdic;
begin
   W:=TwDocAdic.Create(Self);
   try
      W.Objeto:= Self;
      Ventana := w;
      W.InterForma1.InterFrame := self;
      W.InterForma1.FormaTipo := FormaTipo;
 //     w.InterForma1.ShowBtnModificar := True;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.CentrarForma := True;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

Function TDocAdic.InternalEdit:Boolean;
var S:String;
begin if GetSQL('SELECT CVE_OPER_ACC FROM SECU_OPER_ACC WHERE (CVE_FUNCION=''CLASE_'+UpperCase(ClassName)+''') AND (CVE_USUARIO='''+DameUsuario+''') and (CVE_OPER_ACC=''MM'')',
               SeguDataBaseName,SeguSessionName,True)
      then begin if (Contrato<>nil) and (Trunc(Contrato.FIeldByName('fh_modificacion').AsDateTime)<>Trunc(Apli.SysDateTime))
                 then Raise EInterFrame.Create('Este Documento fue Creado otro Dia. No tiene Derecho para Modificarlo, Solo el Mismo día de Creación. Verifique con su Administrador');
           end;
      Result:=Inherited InternalEdit;
end;

Function TDocAdic.InternalBusca:Boolean;
Var T:TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IntDAdic.it','I,I,S');
   try
      if Active then T.WhereString := '(Dod_Adic_persona.Id_Contrato = '+ Id_Contrato.asString + ') and (Doc_Adic_Persona.Id_Persona = '+ Id_Persona.asstring + ')';
      if T.Execute then InternalBusca := FindKey([T.DameCampo(0), T.DameCampo(1), T.DameCampo(2)]);
   finally
   	T.Free;
   end;
end;

procedure TDocAdic.SetContrato(Ctto: TInterFrame);
begin
	FContrato := Ctto;

	If Ctto <> nil then
      begin
         Contratante.Contrato := Ctto;
         dsContratante.DataSet := Contratante.QContratante;
      end
   else
   	begin
   		FContrato := nil;
         Active := False;
      end;
end;


procedure TDocAdic.dsContratanteChange(Sender: TObject; Field: TField);
begin
	if (Field = nil) and (Contratante.QContratante <> nil) and (Contrato <> nil) Then
   begin
   	RefrescaQDocumento;
   end;
end;

procedure TDocAdic.dsDocumentoChange(Sender: TObject; Field: TField);
var
  SQL      : String;
  i        : Integer;
  qVersi   : TQuery;
  sSqlFol  : String;
  qAutFol  : TQuery;
  qAutCues : TQuery;
  sSqlCues : String;
  n        : Integer;
  bdIdEval : String;
  bdSitEval: String;
begin

   if (Field = nil) and (Contratante.QContratante <> nil) and (Contrato <> nil) Then
   begin
    FindKey([Contrato.FieldByName('ID_CONTRATO').asString,
      			Contratante.QContratante.FieldByName('ID_PERSONA').asString,
               QDocumento.FieldByName('CVE_DOCUMENTO').asString]);

     SQL := 'SELECT DESC_DOCUMENTO, ID_VERSION, F_VERSION, SIT_VERSION ' +
            'FROM DOC_ADIC_PER_VER a, DOCUMENTO d ' +
            'WHERE a.cve_documento = d.cve_documento ' +
            '   and a.id_contrato= ' +  Contrato.FieldByName('ID_CONTRATO').asString +
            '   and id_persona= ' + Contratante.QContratante.FieldByName('ID_PERSONA').asString +
            '   and d.cve_documento = ' + Chr(39) +QDocumento.FieldByName('CVE_DOCUMENTO').asString + Chr(39) +
            ' ORDER BY F_VERSION DESC ';

     qVersi := TQuery.Create(Self);
     qVersi := GetSQLQuery(SQL,DataBaseName,SessionName,False);

     if ventana <> nil then
     begin
       ventana.ListView1.Items.Clear;
     end;

     i := 0;
     if qVersi <> nil then
     begin
       while not (qVersi.Eof) do
       begin
         if ventana <> nil then
         begin
           ventana.ListView1.Items.Add;
           ventana.ListView1.Items.Item[i].Caption := qVersi.FieldByName('DESC_DOCUMENTO').AsString;
           ventana.ListView1.Items.Item[i].SubItems.Add(qVersi.FieldByName('ID_VERSION').AsString);
           ventana.ListView1.Items.Item[i].SubItems.Add(qVersi.FieldByName('F_VERSION').AsString);
           ventana.ListView1.Items.Item[i].SubItems.Add(qVersi.FieldByName('SIT_VERSION').AsString);
           inc(i);
         end;
         qVersi.Next;
       end;
       qVersi.Active := False;
     end;
     qVersi.Free;

   {* Validacion de Documentos Necesario para la Autorizadion de Cuestionarios *}
   // validamos que tenga asociado un folio de cuestionario valido
   sSqlFol  := 'SELECT EV.ID_CUESTIONARIO, EV.ID_EMPRESA, EV.ID_EVALUACION, EV.SIT_EVALUACION '
              +  ' FROM SB_CONTRATO    SB '
              +     ' , PSI_EVALUACION EV '
              + ' WHERE 1 = 1  '
              +   ' AND SB.ID_CONTRATO   = ' + Contrato.FieldByName('ID_CONTRATO').asString
              +   ' AND EV.ID_EVALUACION = SB.ID_CUESTIONARIO '
              ;
     try
        qAutFol := TQuery.Create(Self);
        qAutFol := GetSQLQuery(sSqlFol,DataBaseName,SessionName,False);
        if qAutFol <> nil then
        begin
          while not (qAutFol.Eof) do
          begin
             bdSitEval :=  qAutFol.FieldByName('SIT_EVALUACION').AsString;
             bdIdEval  :=  qAutFol.FieldByName('ID_EVALUACION').AsString;
             If bdSitEval = 'PA' Then
             Begin
                // validamos que documentos son los necesario para autorizar el cuestionario Y cuales ya tiene
                sSqlCues := ' SELECT * '
                         +    ' FROM PSI_DOC_ADIC_EMPRESA '
                         +   ' WHERE 1 = 1  '
                         +     ' AND ID_EMPRESA = ' + qAutFol.FieldByName('ID_EMPRESA').AsString
                         +     ' AND ID_CUESTIONARIO = ' +  qAutFol.FieldByName('ID_CUESTIONARIO').AsString
                         +     ' AND SIT_DOCUMENTO = ''AC'''
                         +     ' AND CVE_DOCUMENTO NOT IN ( '
                         +                          ' SELECT CVE_DOCUMENTO '
                         +                            ' FROM DOC_ADIC_PERSONA '
                         +                            ' WHERE 1 = 1  '
                         +                              ' AND ID_CONTRATO = ' + Contrato.FieldByName('ID_CONTRATO').asString
                         +                         ' )'
                         ;
                try
                   qAutCues := TQuery.Create(Self);
                   qAutCues := GetSQLQuery(sSqlCues,DataBaseName,SessionName,False);

                   if qAutCues = nil then
                   begin

                     try
                        RunSQL( 'UPDATE PSI_EVALUACION '
                              +   ' SET SIT_EVALUACION = ''AU'''
                              + ' WHERE ID_EVALUACION = ' + bdIdEval 
                        , DataBaseName, SessionName, True);
                     except
                        on e: EInterFrame do
                        Begin
                           MessageDlg(e.Message, mtInformation, [mbOK], 0);
                           Break;
                        End;
                     end;

                   end;
                finally
                   qAutCues.Free;
                end;
             End;
              qAutFol.Next;
          end;
        end;
     finally
         qAutFol.Free;
     end;

   end;




end;

procedure TDocAdic.RefrescaQDocumento;
var sql: String;  i : integer; qVersi : TQuery;
begin
   if qDocumento <> nil then qDocumento.Free;

   If (Contratante.QContratante <> nil) and (Contrato <> nil)then
   begin
      vgCveDocto := trim(Cve_Documento.AsString);

      sql:= ' Select'+
      		'    Doc_Adic_Persona.Cve_Documento,'+
            '    Documento.Desc_Documento'+
            ' From'+
            '    Doc_Adic_Persona,'+
            '    Documento'+
            ' Where'+
            '    Doc_Adic_Persona.Id_Contrato = '+ Contrato.FieldByName('ID_CONTRATO').asString +
            '    and Doc_Adic_Persona.Id_Persona = '+ Contratante.QContratante.FieldByName('ID_PERSONA').asString +
            '    and Doc_Adic_Persona.Cve_Documento = Documento.Cve_Documento';

      qDocumento := GetSQLQuery(SQL,DataBaseName,SessionName,False);

      if qDocumento <> nil then
         begin
            qDocumento.FieldByName('CVE_DOCUMENTO').visible := False;
         	dsDocumento.DataSet := qDocumento;
            if Ventana <> nil then ventana.PanelDocumento.Visible := False;
         end
      else
      	begin
         	Active := False;
		if Ventana <> nil then ventana.PanelDocumento.Visible := True;
         end;
	end;
end;


function TDocAdic.Reporte:Boolean;
begin
// Aqui ejecutar el proceso del reporte
end;



(***********************************************FORMA TEMPLATE*******************)
(*                                                                              *)
(*  FORMA TEMPLATE                                                              *)
(*                                                                              *)
(***********************************************FORMA TEMPLATE*******************)
Procedure TwDocAdic.DespuesShow(Var Msg:TMessage);
begin
	If Objeto.QDocumento <> nil then PanelDocumento.Visible := False;
end;


procedure TwDocAdic.FormShow(Sender: TObject);
begin
   Objeto.Id_contrato.Control := edIdContrato;
   Objeto.Id_Persona.Control  := edIdPersona;
   Objeto.Cve_Documento.Control := edCveDocumento;
   Objeto.Id_version.Control := edVersion;
   Objeto.F_registro.Control := edFRegistro;

   Objeto.Persona.Nombre.Control := edNombrePersona;
   Objeto.Documento.Desc_documento.Control := edDescDocumento;
   Objeto.Persona.MasterSourceEditControl := edIdPersona;
   Objeto.Documento.MasterSourceEditControl := sbCveDocumento;

   dbgContratante.DataSource:= Objeto.dsContratante;
   dbnContratante.DataSource:= Objeto.dsContratante;
   dbgDocumento.DataSource	 := Objeto.dsDocumento;
   dbnDocumento.DataSource	 := Objeto.dsDocumento;

   PostMessage(Handle,WM_DESPUESSHOW,0,0);
end;

procedure TwDocAdic.FormDestroy(Sender: TObject);
begin
   Objeto.Id_contrato.Control := nil;
   Objeto.Id_Persona.Control  := nil;
   Objeto.Cve_Documento.Control := nil;
   Objeto.Id_version.Control := nil;
   Objeto.F_registro.Control := nil;

   Objeto.Persona.Nombre.Control := nil;
   Objeto.Documento.Desc_documento.Control := nil;
   Objeto.Persona.MasterSourceEditControl := nil;
   Objeto.Documento.MasterSourceEditControl := nil;

   Objeto.Ventana := nil;
end;

procedure TwDocAdic.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TwDocAdic.BitBtn1Click(Sender: TObject);
begin
   Objeto.Reporte;
end;

procedure TwDocAdic.InterForma1DespuesNuevo(Sender: TObject);
begin
	If (Objeto.Contrato <> nil) and (Objeto.Contratante.QContratante <> nil) then
   begin
   	edIdContrato.text := Objeto.Contrato.FieldByName('ID_CONTRATO').asString;
      Objeto.Persona.FindKey([Objeto.Contratante.QContratante.FieldByName('ID_PERSONA').asString]);
   end;

  InterDateTimePicker1.DateTime := Objeto.Apli.DameFechaEmpresa;
  edFRegistro.Text := DateToStr(Objeto.Apli.DameFechaEmpresa);

  edVersion.Text := '1';
  Objeto.Documento.Busca;
end;

procedure TwDocAdic.InterForma1AntesNuevo(Sender: TObject;
  var Realizado: Boolean);
begin
  InterDateTimePicker1.DateTime := Objeto.Apli.DameFechaEmpresa;
  edVersion.Text := '1';

  Realizado := True;
  If (Objeto.Contrato = nil) or (Objeto.Contratante.QContratante = nil) then
    Realizado := False;
end;

procedure TwDocAdic.sbCveDocumentoClick(Sender: TObject);
begin
   Objeto.Documento.Busca;
end;

procedure TwDocAdic.InterForma1Eliminar(Sender: TObject; var Realizado: Boolean);
var
   StpDoc : TStoredProc;
begin
   // CZR 02-Jun-2009   Tomar control del OnEliminar para ejecutar solo cuando sea necesario el DespuesEliminar
   if Objeto.qDocumento = nil then
   begin
      InterForma1.ShowError := True;
      Realizado             := False;
   end
   else
   begin
      InterForma1.ShowError := False;
      if MessageDlg('¿Desea Eliminar el Registro Actual?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
         RunSQL(' DELETE FROM DOC_ADIC_PERSONA '
              + ' WHERE ID_CONTRATO   = ' + IntToStr(Objeto.Contrato.FieldByName('ID_CONTRATO').AsInteger)
              + '   AND ID_PERSONA    = ' + Objeto.Id_Persona.AsSql
              + '   AND CVE_DOCUMENTO = ' + Objeto.Cve_Documento.AsSql,
                objeto.DataBaseName, objeto.SessionName, True);
         vgCveDocto := trim(Objeto.Cve_Documento.AsString);
         Realizado  := True;
      end
      else
         Realizado := False;

      stpDoc := TStoredProc.Create(Self);

      stpDoc.Params.Clear;
      stpDoc.StoredProcName := 'PKGCORPORATIVO.STPTIPCTE';
      stpDoc.DatabaseName := Objeto.Apli.DataBaseName;
      stpDoc.SessionName := Objeto.Apli.SessionName;
      stpDoc.Params.CreateParam(ftInteger,  'pIdContrato',  ptInput);
      stpDoc.Params.CreateParam(ftString,  'pCveDocto', ptInput);
      stpDoc.Params.CreateParam(ftString, 'pBIsBaja', ptInput);
      stpDoc.Params.ParamByName('pIdContrato').AsInteger :=
         Objeto.Contrato.FieldByName('ID_CONTRATO').AsInteger;
      stpDoc.Params.ParamByName('pCveDocto').AsString := vgCveDocto;
      stpDoc.Params.ParamByName('pBIsBaja').AsString := 'V';
      stpDoc.ExecProc;

      if stpDoc <> nil then
        stpDoc.Free;
      stpDoc := nil;

   end;
end;

// CZR 10-JUNIO-2009     Configura el Impuesto en Cotratante y Constancias
procedure TDocAdic.Configura_Impuestos(pId_Contrato : Integer; pActualizaCtte : String);
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

procedure TwDocAdic.InterForma1DespuesEliminar(Sender: TObject);
begin
  Objeto.RefrescaQDocumento;
   // CZR 02-Jun-2009   Se asigna el impuesto a cero en Contratantes y se Prorratea en Constancias, al eliminar el documento D187 al Titular
   if (trim(Objeto.Contratante.QContratante.FieldByName('Cve_Contratante').AsString) = 'C001') and (trim(vgCveDocto) = 'D187') then
      Objeto.Configura_Impuestos(Objeto.Contrato.FieldByName('ID_CONTRATO').AsInteger, 'V');
end;

procedure TwDocAdic.InterForma1DespuesAceptar(Sender: TObject);
var
  stpDoc : TStoredProc;
begin
   Objeto.RefrescaQDocumento;
   // CZR 02-Jun-2009   Prorratear impuesto en Contratantes y Constancias al asignar el documento D187 al Titular
   if (trim(Objeto.Contratante.QContratante.FieldByName('Cve_Contratante').AsString) = 'C001') and (trim(vgCveDocto) = 'D187') then
      Objeto.Configura_Impuestos(Objeto.Contrato.FieldByName('ID_CONTRATO').AsInteger, 'V');

   stpDoc := TStoredProc.Create(Self);

   stpDoc.Params.Clear;
   stpDoc.StoredProcName := 'PKGCORPORATIVO.STPTIPCTE';
   stpDoc.DatabaseName := Objeto.Apli.DataBaseName;
   stpDoc.SessionName := Objeto.Apli.SessionName;
   stpDoc.Params.CreateParam(ftInteger,  'pIdContrato',  ptInput);
   stpDoc.Params.CreateParam(ftString,  'pCveDocto', ptInput);
   stpDoc.Params.CreateParam(ftString, 'pBIsBaja', ptInput);
   stpDoc.Params.ParamByName('pIdContrato').AsInteger :=
       Objeto.Contrato.FieldByName('ID_CONTRATO').AsInteger;
   stpDoc.Params.ParamByName('pCveDocto').AsString := vgCveDocto;
   stpDoc.Params.ParamByName('pBIsBaja').AsString := 'F';
   stpDoc.ExecProc;

   if stpDoc <> nil then
     stpDoc.Free;
   stpDoc := nil;
end;

procedure TwDocAdic.InterForma1DespuesModificar(Sender: TObject);
begin
  qVersion.Active := False;
  qVersion.DatabaseName := Objeto.Apli.DataBaseName;
  qVersion.SessionName  := Objeto.Apli.SessionName;
  qVersion.SQL.Clear;
  qVersion.SQL.Add('SELECT MAX(ID_VERSION) AS ID_VERSION ' +
                   'FROM DOC_ADIC_PER_VER ' +
                   'WHERE ID_CONTRATO = ' +
                     Objeto.Contrato.FieldByName('ID_CONTRATO').asString +
                    '   AND ID_PERSONA=' + Objeto.Contratante.QContratante.FieldByName('ID_PERSONA').asString +
                    '   AND CVE_DOCUMENTO=' +  Chr(39) + Objeto.qDocumento.FieldByName('CVE_DOCUMENTO').asString + Chr(39));

  qVersion.Active := True;

  if qVersion.EOF then
    edVersion.Text := '1'
  else
    edVersion.Text := FloatToStr(qVersion.FieldByName('ID_VERSION').AsFloat + 1);
end;

end.



