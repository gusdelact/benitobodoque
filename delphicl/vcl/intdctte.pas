// Sistema         : Clase de Documentos Contratante
// Fecha de Inicio : Noviembre de 1997
// Función forma   : Clase de Documentos Contratante
// Desarrollo por  : Victor Martinez
// Comentarios     :
unit IntDCtte;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, RepDCtte,
  IntFind,UnSQL2, InterFun, ComCtrls, DBCtrls, Menus, IntPers, Intdocto, Ungene,
  IntPob, IntReq, IntNota, IntEsc, IntCtte, IntDtPk, Grids, DBGrids;

Const WM_DESPUESSHOW=WM_USER+1;
     C_Intervalo = 200;

type
  TDocCtte= Class;
  TWDocCtte = class(TForm)
    InterForma1    : TInterForma;
    lbICveRequisito:TLabel;
    edIdPersona:TEdit;
    edNombrePersona:TEdit;
    BitBtn1: TBitBtn;
    Label7: TLabel;
    edIdContrato: TEdit;
    rgSitDocCtte: TRadioGroup;
    GroupBox4: TGroupBox;
    Label5: TLabel;
    edFhModificacion: TEdit;
    Label12: TLabel;
    edCveUsuarModif: TEdit;
    MacvDatePicker1: MacvDatePicker;
    GroupBox2: TGroupBox;
    edFProxRevDoc: TEdit;
    Label10: TLabel;
    Label1: TLabel;
    edCveRequisito: TEdit;
    edDescRequisito: TEdit;
    MacvDatePicker3: MacvDatePicker;
    MacvDatePicker4: MacvDatePicker;
    PopupEscritura: TPopupMenu;
    Catalogo5: TMenuItem;
    edFAltaDoc: TEdit;
    MacvDatePicker2: MacvDatePicker;
    Label9: TLabel;
    sbCveDocumento: TSpeedButton;
    edCveDocumento: TEdit;
    edDescDocumento: TEdit;
    PopupDocumento: TPopupMenu;
    Catalogo1: TMenuItem;
    Label13: TLabel;
    dbgContratante: TDBGrid;
    Label8: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    dbgRequisito: TDBGrid;
    dbgDocumento: TDBGrid;
    GroupBox1: TGroupBox;
    sbNumEscPublica: TSpeedButton;
    edNumEscPublica: TEdit;
    Label6: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edDescPoblacion: TEdit;
    edNombreNotario: TEdit;
    MacvDatePicker5: MacvDatePicker;
    dbnRequisito: TDBNavigator;
    dbnDocumento: TDBNavigator;
    dbnContratante: TDBNavigator;
    PanelRequisito: TPanel;
    PanelDocumento: TPanel;
    Label4: TLabel;
    edFUltRevDoc: TEdit;
    MacvDatePicker6: MacvDatePicker;
    chbBCotejado: TCheckBox;
    chbBRevisado: TCheckBox;
    PopupNuevo: TPopupMenu;
    Nuevo1: TMenuItem;
    PopupRequisito: TPopupMenu;
    MenuItem2: TMenuItem;
    PopupPersona: TPopupMenu;
    CatalogoPersona: TMenuItem;
    sbMasterSourceEdit: TSpeedButton;
    StoredProc1: TStoredProc;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1Buscar(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Catalogo1Click(Sender: TObject);
    procedure Catalogo5Click(Sender: TObject);
    procedure sbNumEscPublicaClick(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure sbCveDocumentoClick(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    procedure InterForma1AntesNuevo(Sender: TObject; var Realizado: Boolean);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure Nuevo1Click(Sender: TObject);
    procedure CatalogoPersonaClick(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure InterForma1CanEdit(Sender: TObject; CanEdit: Boolean);
    procedure InterForma1AntesModificar(Sender: TObject; var Realizado: Boolean);
    procedure InterForma1AntesEliminar(Sender: TObject;
      var Realizado: Boolean);
    procedure FormHide(Sender: TObject);
  private
  public
    Objeto: TDocCtte;
    Procedure DespuesShow(Var Msg:TMessage); message WM_DESPUESSHOW;
  end;

  TDocCtte= class(TInterFrame)
  private
    FContrato:TInterFrame;
    FRequisito:TRequisito;
    FPanelRequisito: TPanel;
    FPanelDocumento: TPanel;
    Repeticion: Integer;
    Tiempo: TTimer;
    RepeticionDoc: Integer;
    TiempoDoc: TTimer;
    Entrada: Boolean;
    EntradaDoc: Boolean;
    FUseTimer: Boolean;
    FIsMoving: Boolean;
  protected
   procedure SetContrato(Cto:TInterFrame);
   procedure TiempoTimer(Sender: TObject);
   procedure TiempoTimerDoc(Sender: TObject);
   procedure SetRequisito(P_Req:TRequisito);
  public
    Id_Persona     : TInterCampo;
    Id_Contrato    : TInterCampo;
    cve_Documento  : TInterCampo;
    F_Prox_Rev_Doc : TInterCampo;
    F_Ult_Rev_Doc  : TInterCampo;
    Num_esc_Publica: TInterCampo;
    Sit_Doc_Ctte   : TInterCampo;
    Cve_Requisito  : TInterCampo;
    F_alta_doc     : TInterCampo;
    cve_usuar_modif: TInterCampo;
    fh_modificacion: TInterCampo;
    Id_Pers_Notario: TInterCampo;
    B_Cotejado	   : TInterCampo;
    B_Revisado	   : TInterCampo;
    Persona	: TPersona;
    Requisito	: TRequisito;
    Escritura	: TEscritura;
    Documento	: TDocumento;
    Contratante : TCtte;
    QRequisito	: TQuery;
    QDocumento	: TQuery;
    QDocReq	: TQuery;
    dsCtte   	: TDataSource;
    dsRequisito : TDataSource;
    dsDocumento : TDataSource;
    procedure Post; override;
    function InternalBusca : Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor Destroy; override;
    function ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    Function InternalEdit:Boolean; override;
    function Reporte:Boolean; override;
    Procedure DataBaseChange; Override;
    procedure dsCtteDataChange(Sender: TObject; Field: TField);
    procedure dsRequisitoDataChange(Sender: TObject; Field: TField);
    procedure dsDocumentoDataChange(Sender: TObject; Field: TField);
    Procedure RefrescaQRequisito;
    Procedure RefrescaQDocumento;
  published
    Property Contrato:TInterFrame Read FContrato Write SetContrato;
    Property Req:TRequisito Read FRequisito Write SetRequisito;
    Property UseTimer: Boolean Read FUseTimer Write FUseTimer;
    Property IsMoving: Boolean Read FIsMoving Write FIsMoving;
  end;

implementation

{$R *.DFM}

constructor TDocCtte.Create( AOwner : TComponent );
begin
   Inherited;
   Id_Persona		:= CreaCampo('ID_PERSONA',ftInteger,tsNinguno,tsNinguno,True);
   Id_Contrato		:= CreaCampo('ID_CONTRATO',ftInteger,tsNinguno,tsNinguno,True);
   cve_Documento	:= CreaCampo('CVE_DOCUMENTO',ftString,tsNinguno,tsNinguno,True);
   F_Prox_Rev_Doc	:= CreaCampo('F_PROX_REV_DOC',ftDate,tsNinguno,tsNinguno,True);
   F_Ult_Rev_Doc	:= CreaCampo('F_ULT_REV_DOC',ftDate,tsNinguno,tsNinguno,True);
   Num_esc_Publica:= CreaCampo('NUM_ESC_PUBLICA',ftInteger,tsNinguno,tsNinguno,True);
   Cve_Requisito	:= CreaCampo('CVE_REQUISITO',ftString,tsNinguno,tsNinguno,True);
   F_alta_doc		:= CreaCampo('F_ALTA_DOC',ftDate,tsNinguno,tsNinguno,True);
   cve_usuar_modif:= CreaCampo('CVE_USUAR_MODIF',ftString,tsNinguno,tsNinguno,True);
   fh_modificacion:= CreaCampo('FH_MODIFICACION',ftDate,tsNinguno,tsNinguno,True);
   Id_Pers_Notario:= CreaCampo('ID_PERS_NOTARIO',ftInteger,tsNinguno,tsNinguno,True);
   B_Cotejado		:= CreaCampo('B_COTEJADO',ftString,tsNinguno,tsNinguno,True);
   B_Revisado		:= CreaCampo('B_REVISADO',ftString,tsNinguno,tsNinguno,True);
   Sit_Doc_Ctte	:= CreaCampo('SIT_DOC_CTTE',ftString,tsNinguno,tsNinguno,True);
   With Sit_Doc_Ctte do
   begin
   	Size:= 2;
      UseCombo := True;
      ComboLista.Add('0');					ComboDatos.Add('AC');
      ComboLista.Add('1');					ComboDatos.Add('IN');
   end;
   cve_Documento.Size:= 4;
   Cve_Requisito.Size:= 4;
   cve_usuar_modif.Size:= 8;

   FActive := False;
   FKeyFields.Add('ID_PERSONA');
   FKeyFields.Add('ID_CONTRATO');
   FKeyFields.Add('CVE_DOCUMENTO');
   FKeyFields.Add('CVE_REQUISITO');
   TableName := 'DOC_CONTRATANTE';
   UseQuery := True;
   HelpFile := 'IntDCtte.hlp';
   ShowMenuReporte:=True;

   Persona:=TPersona.Create(Self);
   Persona.MasterSource:=Self;
   //Persona.MasterSourceReadOnly := True;
   Persona.FieldByName('ID_PERSONA').MasterField:='ID_PERSONA';

   Requisito:=TRequisito.Create(Self);
   Requisito.MasterSource:=Self;
   //Requisito.MasterSourceReadOnly := True;
   Requisito.FieldByName('CVE_REQUISITO').MasterField:='CVE_REQUISITO';

   Documento:=TDocumento.Create(Self);
   Documento.ShowAll := True;
   Documento.MasterSource:=Self;
   Documento.FieldByName('CVE_DOCUMENTO').MasterField:='CVE_DOCUMENTO';

   Contratante:=TCtte.Create(Self);
   Contratante.FilterBy := fbTCtteCtteCtto;

   Escritura:=TEscritura.Create(Self);
   Escritura.MasterSource := Contratante;
   Escritura.FieldByName('NUM_ESC_PUBLICA').MasterField := 'NUM_ESC_PUBLICA';
   Escritura.FieldByName('ID_PERS_NOTARIO').MasterField := 'ID_PERS_NOTARIO';


	FContrato      := nil;
   FRequisito     := nil;
   FPanelRequisito:= nil;
	FPanelDocumento:= nil;

   dsCtte:=TDataSource.Create(Self);
   dsCtte.OnDataChange := dsCtteDataChange;
   dsRequisito	 :=TDataSource.Create(Self);
   dsRequisito.OnDataChange   := dsRequisitoDataChange;
   dsDocumento	 :=TDataSource.Create(Self);
   dsDocumento.OnDataChange   := dsDocumentoDataChange;

   Repeticion := 0;
   RepeticionDoc := 0;
   Tiempo := TTimer.Create(self);
   Tiempo.Enabled := False;
   Tiempo.OnTimer := TiempoTimer;
   Tiempo.Interval := C_Intervalo;
   TiempoDoc := TTimer.Create(self);
   TiempoDoc.Enabled := False;
   TiempoDoc.OnTimer := TiempoTimerDoc;
   TiempoDoc.Interval := C_Intervalo;
   Entrada:= True;
	EntradaDoc:= True;
   IsMoving := False;

   IsCorp:=True;

   QRequisito:=nil;
   QDocumento:=nil;
end;


destructor TDocCtte.Destroy;
begin {if dsContratante<>nil then dsContratante.Free;
      if dsRequisito<>nil then dsRequisito.Free;
      if dsDocumento<>nil then dsDocumento.Free;}
      if QRequisito <> nil then QRequisito.Free;
      if QDocumento <> nil then QDocumento.Free;
      if Contratante<>nil then Contratante.Free;
		if Persona<>nil then Persona.Free;
      if Requisito<>nil then Requisito.Free;
      if Escritura<>nil then Escritura.Free;
      if Documento<>nil then Documento.Free;
      if Tiempo <> nil then Tiempo.Free;
      if TiempoDoc <> nil then TiempoDoc.Free;
      inherited;
end;


Procedure TDocCtte.DataBaseChange;
begin
	inherited;
   Contratante.GetParams(Self);
end;


Function TDocCtte.InternalEdit:Boolean;
var S:String;
begin if GetSQL('SELECT CVE_OPER_ACC FROM SECU_OPER_ACC WHERE (CVE_FUNCION=''CLASE_'+UpperCase(ClassName)+''') AND (CVE_USUARIO='''+DameUsuario+''') and (CVE_OPER_ACC=''MM'')',
               SeguDataBaseName,SeguSessionName,True)
      then begin if Trunc(fh_modificacion.AsDateTime)<>Trunc(Apli.SysDateTime)
                 then Raise EInterFrame.Create('Este Documento fue Creado otro Dia. No tiene Derecho para Modificarlo, Solo el Mismo día de Creación. Verifique con su Administrador');
           end;
      Result:=Inherited InternalEdit;
end;


Function TDocCtte.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W:TWDocCtte;
begin W:=TWDocCtte.Create(Self);
      try W.Objeto:= Self;
          W.InterForma1.InterFrame:=Self;
          W.InterForma1.FormaTipo := FormaTipo;
          W.InterForma1.ShowGrid := False;
          W.InterForma1.ShowNavigator := False;
          W.InterForma1.Funcion := FInterFun;
          W.InterForma1.ShowModal;
          ShowWindow := W.InterForma1.ModalResult;
      finally W.Free;
      end;
end;

procedure TDocCtte.Post;
var
   Q    :TQuery;
   Cont :Integer;
   RequisitosPosibles: TStringList;
   DocumentoStr: String;
   PrimerReq: Boolean;
   EstadoAnt: Integer;
   Hijo: TDocCtte;
begin
   PrimerReq:= True;
   GetFromControl;

	If modo = moAppend Then
   Begin
   	If Cve_Requisito.asString <> 'R033' Then
         begin
            RequisitosPosibles:= TStringList.Create;

            Q:=nil;
            If (Contrato <> nil) and (qRequisito <> nil)
            Then                    {OBTIENE LOS REQUISITOS FALTANTES}
                 Q:=GetSQLQuery(QRequisito.SQL.Text, DataBaseName, SessionName, False);
            Try
            RequisitosPosibles.Clear;
            if q <> nil then
            begin
               q.first;
               for Cont := 1 to q.RecordCount do
               begin
                  DocumentoStr :=documento.DocCompruebanRequisito(q.FieldByName('CVE_REQUISITO').asString,
                                                                  dsCtte.DataSet.FieldByName('CVE_PER_JURIDICA').asString,
                                                                  dsCtte.DataSet.FieldByName('CVE_NACIONALIDAD').asString,
                                                                  dsCtte.DataSet.FieldByName('CVE_CONCEP_CTTE').asString);

                  if pos(cve_Documento.AsString, DocumentoStr) <> 0 then
                     RequisitosPosibles.Add(q.FieldByName('CVE_REQUISITO').asString);
                  Q.Next;
               end;
            end;

            Finally if Q<>nil then Q.Free;
            end;


				Hijo:= TDocCtte.create(self);
            Hijo.GetParams(self);

            For Cont:=0 to RequisitosPosibles.Count -1 do
            Begin
            	Hijo.Append;
               Hijo.FieldsCopy(Self);
               Hijo.Id_Pers_Notario.asString := Escritura.Id_Pers_notario.asString;
               Hijo.Cve_Requisito.AsString := RequisitosPosibles.Strings[Cont];
               Hijo.OldPost;
            End;
{               If Not PrimerReq Then
               Begin
                  //FQuery.Insert;
               	Append;
                  EstadoAnt:= State;
                  State := 0;
                  FieldsReceive;
                  State := EstadoAnt;
               End;

               Id_Pers_Notario.asString := Escritura.Id_Pers_notario.asString;
               Cve_Requisito.AsString := RequisitosPosibles.Strings[Cont];
               OldPost;
               PrimerReq := False;}

            if Hijo <> nil then Hijo.Free;
            Cancel;

            if RequisitosPosibles <> nil then RequisitosPosibles.free;
      	end
      else
      	OldPost;			{Realiza el post del requisito R033 unicamente}
   end
   else
   	OldPost;
end;


Function TDocCtte.InternalBusca:Boolean;
Var 	T:TInterFindit;
		S: String;
begin InternalBusca := False;
      T:=CreaBuscador('IntDCtte.it','I,I,S,S');
      T.CamposResultado:='';
      If Contrato <> nil Then
      begin
      	AddSql(S,'Id_Contrato = '+ Contrato.FieldByName('ID_CONTRATO').asString);
         AddSql(S,'DCTTE.ID_PERSONA = '+ self.dsCtte.DataSet.fieldbyname('ID_PERSONA').asString);
      	T.WhereString := S;
      end;

      try if T.Execute then
          begin InternalBusca:=FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2),T.DameCampo(3)]);
          end;
      finally T.Free;
      end; {end-try}
end;

function TDocCtte.Reporte:Boolean;
begin Execute_RepDCtte(True,Self, Contrato.FieldByName('ID_CONTRATO').AsInteger);
end;

Procedure TDocCtte.SetContrato(Cto:TInterFrame);
begin
	FContrato:=Cto;
   Contratante.Contrato:=Cto;
   Documento.Contrato  :=Cto;

   If Cto <> nil Then
      Begin
//         Contratante.RefrescaQContratante;            {No necesario}
         dsCtte.DataSet := Contratante.QContratante;
//         RefrescaQRequisito;                          {No necesario}
//         RefrescaQDocumento;                          {No necesario}
      end
	else
		begin
			Active := False;
      end;

   Entrada := True;
   EntradaDoc := True;
end;


Procedure TDocCtte.SetRequisito(P_Req:TRequisito);
begin
	FRequisito:=P_Req;
	Documento.Requisito := P_Req;
end;


procedure TDocCtte.TiempoTimer(Sender: TObject);
begin
	if Repeticion = 3 Then
   begin
      Repeticion := 0;
      Tiempo.Enabled := False;
      IsMoving := False;

   	if Not dsCtte.DataSet.IsEmpty Then
         Begin
            //Contratante.dsContratanteDataChange(Sender, Field);

            //Contratante.QContratante.FieldByName('CONTRATANTE').DisplayWidth := 55;
            //Contratante.QContratante.FieldByName('TIPO_CONTRATANTE').DisplayWidth := 35;

            Documento.Cve_Per_Juridica:= Contratante.QContratante.FieldByName('CVE_PER_JURIDICA').asString;
            Documento.Cve_Concepto_Co := Contratante.Cve_Concep_Ctte.asString;
            Documento.Cve_Nacionalidad := Contratante.QContratante.FieldByName('CVE_NACIONALIDAD').asString;

            RefrescaQRequisito;
            RefrescaQDocumento;
         end
      else
      	Active := False;
   end
   else Inc(Repeticion);
end;

procedure TDocCtte.TiempoTimerDoc(Sender: TObject);
begin
	if RepeticionDoc = 3 Then
   begin
      RepeticionDoc := 0;
      TiempoDoc.Enabled := False;
      IsMoving := False;

   	if Not dsDocumento.DataSet.IsEmpty Then
      Begin
         FindKey([dsDocumento.DataSet.FieldByName('ID_PERSONA').asString,
               dsDocumento.DataSet.FieldByName('ID_CONTRATO').asString,
               dsDocumento.DataSet.FieldByName('CVE_DOCUMENTO').asString,
               dsDocumento.DataSet.FieldByName('CVE_REQUISITO').asString]);
         DrawControl;
   	End
      else
      	Active := False;
   end
   else Inc(RepeticionDoc);
end;


procedure TDocCtte.dsDocumentoDataChange(Sender: TObject; Field: TField);
Begin
   If (Field = nil) then
   Begin
//   	if EntradaDoc Then
		if Not UseTimer Then
      begin
         if Not dsDocumento.DataSet.IsEmpty Then
         Begin
            FindKey([dsDocumento.DataSet.FieldByName('ID_PERSONA').asString,
                  dsDocumento.DataSet.FieldByName('ID_CONTRATO').asString,
                  dsDocumento.DataSet.FieldByName('CVE_DOCUMENTO').asString,
                  dsDocumento.DataSet.FieldByName('CVE_REQUISITO').asString]);
            DrawControl;
         End
         else
            Active := False;

         EntradaDoc := False;
      end
      else
      begin
   		TiempoDoc.Enabled := True;
	      RepeticionDoc := 0;
         IsMoving := True;
      end;

   end;
end;

procedure TDocCtte.dsRequisitoDataChange(Sender: TObject; Field: TField);
begin
  If (Field = nil) then
  Begin
   	If Req <> nil then Req.Free;

    Req:= TRequisito.Create(Self);
    Req.GetParams(Self);

    If dsRequisito.DataSet <> nil then
    begin
      If Req.FindKey([dsRequisito.DataSet.FieldByName('Cve_Requisito').asString]) then
          Begin
             Req := Req;
             DrawControl;
          End
       else
          Begin
             Req.Free;
             Req := Nil;
          end;
    end
    else
    begin
      If Req.FindKey([Cve_Requisito.AsString]) then
          Begin
             Req := Req;
             DrawControl;
          End
       else
          Begin
             Req.Free;
             Req := Nil;
          end;
    end;
  End;
end;

procedure TDocCtte.dsCtteDataChange(Sender: TObject; Field: TField);
begin
  If(Field = nil) then Begin
     if Not UseTimer Then begin
        if Not dsCtte.DataSet.IsEmpty Then Begin
           Documento.Cve_Per_Juridica := Contratante.QContratante.FieldByName('CVE_PER_JURIDICA').asString;
           Documento.Cve_Concepto_Co  := Contratante.Cve_Concep_Ctte.asString;
           Documento.Cve_Nacionalidad := Contratante.QContratante.FieldByName('CVE_NACIONALIDAD').asString;
           RefrescaQRequisito;
           RefrescaQDocumento;
        end
        else
           Active := False;
     Entrada:= False;
     end
     else begin
	Tiempo.Enabled := True;
   	   Repeticion := 0;
         IsMoving := True;
      end;
   end;
end;

Procedure TDocCtte.RefrescaQRequisito;
Begin
  Try
    If QRequisito <> nil then QRequisito.Free;
       QRequisito:= nil;
    If(Contrato <> nil)then Begin
       QRequisito := GetSQLQuery(
        ' SELECT Requisito.Desc_Requisito as Requisito, ' +
        '       ReqCtte.Cve_Requisito, ' +
        '       DECODE(Req_Prod_Ctte.B_Bloquea_Cto, ''V'', ''SI'', ''F'', ''NO'', ''NO'') as B_BLOQUEA_CTO, ' +
        '       Req_Prod_Ctte.F_Vigencia ' +
        ' FROM Requisito, Req_Prod_Ctte, ' +
        '  ( ' +
        '    SELECT Cve_Requisito ' +
        '    FROM Req_Prod_Ctte ' +
        '    WHERE Id_Empresa = ' + Contrato.FieldByName('ID_EMPRESA').asSql +
        '      and Cve_Producto = ' + Contrato.FieldByName('CVE_PRODUCTO').asSql +
        '      and Cve_Concep_Ctte = ' + Contrato.FieldByName('CVE_CONCEP_CTO').asSql +
        '      and Cve_Contratante = ''' + dsCtte.DataSet.FieldByName('CVE_CONTRATANTE').asString + '''' +
        '      and Cve_Requisito <> ''R016'' ' +
        '    MINUS ' +
        '    SELECT Cve_Requisito ' +
        '    FROM Doc_Contratante ' +
        '    WHERE Id_Contrato = ' + Contrato.FieldByName('ID_CONTRATO').asSql +
        '      and Id_Persona = ' + dsCtte.DataSet.FieldByName('ID_PERSONA').asString +
        '  ) ReqCtte ' +
        ' WHERE ReqCtte.Cve_Requisito = Requisito.Cve_Requisito ' +
        '  and ReqCtte.Cve_Requisito = Req_Prod_Ctte.Cve_Requisito ' +
        '  and Req_Prod_Ctte.Id_Empresa = ' + Contrato.FieldByName('ID_EMPRESA').asSql +
        '  and Req_Prod_Ctte.Cve_Producto = ' + Contrato.FieldByName('CVE_PRODUCTO').asSql +
        '  and Req_Prod_Ctte.Cve_Concep_Ctte = ' + Contrato.FieldByName('CVE_CONCEP_CTO').asSql +
        '  and Req_Prod_Ctte.Cve_Contratante = ''' + dsCtte.DataSet.FieldByName('CVE_CONTRATANTE').asString + '''',
        DataBaseName, SessionName, False);

{RAPA 13Ago2004
            ' SELECT'+
            '   REQUISITO.DESC_REQUISITO REQUISITO,'+
            '   REQUISITO.CVE_REQUISITO'+
            ' FROM'+
            '   REQ_PROD_CTTE,'+
            '   TIPO_CONTRATANTE,'+
            '   PRODUCTO,'+
            '   REQUISITO,'+
            '   EMPRESA'+
            ' WHERE REQ_PROD_CTTE.CVE_CONTRATANTE = TIPO_CONTRATANTE.CVE_CONTRATANTE'+
            '   AND REQ_PROD_CTTE.CVE_PRODUCTO    = PRODUCTO.CVE_PRODUCTO'+
            '   AND REQ_PROD_CTTE.CVE_REQUISITO   = REQUISITO.CVE_REQUISITO'+
            '   AND REQ_PROD_CTTE.ID_EMPRESA      = EMPRESA.ID_EMPRESA'+
            '   AND REQ_PROD_CTTE.CVE_PRODUCTO    = '''+ Contrato.FieldByName('CVE_PRODUCTO').asString+''''+
            '   AND REQ_PROD_CTTE.CVE_CONTRATANTE = '''+ dsCtte.DataSet.FieldByName('CVE_CONTRATANTE').asString+''''+
            '   AND REQ_PROD_CTTE.ID_EMPRESA      =   '+ Contrato.FieldByName('ID_EMPRESA').asString+
            '   and Req_Prod_Ctte.Cve_Concep_Ctte = '''+ Contrato.FieldByName('CVE_CONCEP_CTO').asString + '''' +
            ' MINUS'+
            ' SELECT'+
            '   REQUISITO.DESC_REQUISITO REQUISITO,'+
            '   REQUISITO.CVE_REQUISITO'+
            ' FROM'+
            '   CONTRATANTE,'+
            '   DOC_CONTRATANTE,'+
            '   DOCUMENTO,'+
            '   REQUISITO'+
            ' WHERE CONTRATANTE.ID_CONTRATO       = DOC_CONTRATANTE.ID_CONTRATO'+
            '   AND CONTRATANTE.ID_PERSONA        = DOC_CONTRATANTE.ID_PERSONA'+
            '   AND DOC_CONTRATANTE.CVE_REQUISITO = REQUISITO.CVE_REQUISITO'+
            '   AND DOC_CONTRATANTE.CVE_DOCUMENTO = DOCUMENTO.CVE_DOCUMENTO'+
            '   AND CONTRATANTE."ID_CONTRATO"     = '+Contrato.FieldByName('ID_CONTRATO').asString+
            '   and Contratante.Cve_Contratante   = '''+ dsCtte.DataSet.FieldByName('CVE_CONTRATANTE').asString + '''' +
            '   AND CONTRATANTE."ID_PERSONA"      = '+dsCtte.DataSet.FieldByName('ID_PERSONA').asString,
}

    end;
    If QRequisito<>nil then
    Begin
       QRequisito.fieldByName('CVE_REQUISITO').Visible := False;

       QRequisito.fieldByName('REQUISITO').DisplayLabel:= 'Requisito';
       QRequisito.fieldByName('B_BLOQUEA_CTO').DisplayLabel:= 'Bloqueo';
       QRequisito.fieldByName('F_VIGENCIA').DisplayLabel:= 'Vigencia';
       QRequisito.fieldByName('B_BLOQUEA_CTO').DisplayWidth := 7;
       QRequisito.fieldByName('F_VIGENCIA').DisplayWidth := 12;
       QRequisito.fieldByName('B_BLOQUEA_CTO').Alignment:= taCenter;
       QRequisito.fieldByName('F_VIGENCIA').Alignment:= taCenter;

       If FPanelRequisito <> nil Then
       begin
          If QRequisito.fieldByName('CVE_REQUISITO').asString = 'R016' Then
             FPanelRequisito.Visible := True
          else FPanelRequisito.Visible := False;
       end;
    end
    else
      if FPanelRequisito <> nil Then
        FPanelRequisito.Visible := True;
    dsRequisito.DataSet := QRequisito;
    If QRequisito = nil then
      dsRequisitoDataChange(Self, nil);
  Finally
  end;
end;

Procedure TDocCtte.RefrescaQDocumento;
Begin
  Try
    if QDocumento <> nil Then
       QDocumento.Free; QDocumento:=nil;
    If(Contrato <> nil) then Begin
       QDocumento:= GetSQLQuery(' SELECT'+
            '   REQUISITO.DESC_REQUISITO REQUISITO,'+
            '   DOCUMENTO.DESC_DOCUMENTO DOCUMENTO,'+
            '   DOC_CONTRATANTE.F_ULT_REV_DOC ULT_REV,'+
            '   DOC_CONTRATANTE.F_PROX_REV_DOC PROX_REV,'+
            '   CONTRATANTE.ID_CONTRATO,'+
            '   CONTRATANTE.ID_PERSONA,'+
            '   CONTRATANTE.CVE_CONTRATANTE,'+
            '   DOC_CONTRATANTE.CVE_DOCUMENTO,'+
            '   DOC_CONTRATANTE.CVE_REQUISITO,'+
            '   DOCUMENTO.B_OPCIONAL,'+
            '   DOCUMENTO.F_VIGENCIA, '+
            '   Req_Prod_Ctte.B_Bloquea_Cto, ' +
            '   Req_Prod_Ctte.F_Vigencia as F_Vigencia_Req ' +
            ' FROM'+
            '   CONTRATANTE,'+
            '   DOC_CONTRATANTE,'+
            '   DOCUMENTO,'+
            '   REQUISITO, '+
            '   Req_Prod_Ctte ' +
            ' WHERE CONTRATANTE.ID_CONTRATO       = DOC_CONTRATANTE.ID_CONTRATO'+
            '   AND CONTRATANTE.ID_PERSONA        = DOC_CONTRATANTE.ID_PERSONA'+
            '   AND DOC_CONTRATANTE.CVE_REQUISITO = REQUISITO.CVE_REQUISITO'+
            '   AND DOC_CONTRATANTE.CVE_DOCUMENTO = DOCUMENTO.CVE_DOCUMENTO'+
            '   AND CONTRATANTE.ID_CONTRATO       = '+Contrato.FieldByName('ID_CONTRATO').asString+
            '   and Contratante.Cve_Contratante   = ''' + dsCtte.DataSet.FieldByName('CVE_CONTRATANTE').asString + '''' +
            '   AND CONTRATANTE.ID_PERSONA        = '+dsCtte.DataSet.FieldByName('ID_PERSONA').asString +
            '   and Req_Prod_Ctte.Id_Empresa      = ' + Contrato.FieldByName('ID_EMPRESA').asSql +
            '   and Req_Prod_Ctte.Cve_Producto    = ' + Contrato.FieldByName('CVE_PRODUCTO').asSql +
            '   and Req_Prod_Ctte.Cve_Concep_Ctte = ' + Contrato.FieldByName('CVE_CONCEP_CTO').asSql +
            '   and Req_Prod_Ctte.Cve_Contratante = Contratante.Cve_Contratante ' +
            '   and Req_Prod_Ctte.Cve_Requisito   = Doc_Contratante.Cve_Requisito ',
            DataBaseName, SessionName, False);
    end;
    if QDocumento<> nil then begin
       QDocumento.fieldByName('ID_CONTRATO').Visible := False;
       QDocumento.fieldByName('ID_PERSONA').Visible := False;
       QDocumento.fieldByName('CVE_CONTRATANTE').Visible := False;
       QDocumento.fieldByName('CVE_DOCUMENTO').Visible := False;
       QDocumento.fieldByName('CVE_REQUISITO').Visible := False;
       QDocumento.fieldByName('REQUISITO').DisplayLabel := 'Requisito';
       QDocumento.fieldByName('DOCUMENTO').DisplayLabel := 'Documento';
       QDocumento.fieldByName('B_OPCIONAL').DisplayLabel := 'Opcional';
       QDocumento.fieldByName('F_VIGENCIA').DisplayLabel := 'Vigencia Doc';
       QDocumento.fieldByName('ULT_REV').DisplayLabel :=  'Ult Rev';
       QDocumento.fieldByName('PROX_REV').DisplayLabel := 'Prox Rev';
       QDocumento.fieldByName('B_BLOQUEA_CTO').DisplayLabel := 'Bloqueo';
       QDocumento.fieldByName('F_VIGENCIA_REQ').DisplayLabel := 'Vigencia Req';
       QDocumento.fieldByName('ULT_REV').Alignment:= taCenter;
       QDocumento.fieldByName('PROX_REV').Alignment:= taCenter;
       QDocumento.fieldByName('B_OPCIONAL').Alignment:= taCenter;
       QDocumento.fieldByName('F_VIGENCIA').Alignment:= taCenter;
       QDocumento.fieldByName('B_BLOQUEA_CTO').Alignment:= taCenter;
       QDocumento.fieldByName('F_VIGENCIA_REQ').Alignment:= taCenter;

       if FPanelDocumento <> nil Then
          FPanelDocumento.Visible := False;
    end
    else begin
       Active := False;
       if FPanelDocumento <> nil Then
          FPanelDocumento.Visible := True;
     end;
     dsDocumento.DataSet := QDocumento;
  Finally
  end;
end;

(***************************************FORMA DE Requisitos de Contratantes******)
(*                                                                              *)
(*  FORMA DE Documentos de Contratantes                                         *)
(*                                                                              *)
(***************************************FORMA DE Requisitos de Contratantes******)

Procedure TWDocCtte.DespuesShow(Var Msg:TMessage);
begin
  If(Objeto.QRequisito <> nil)and(Objeto.QRequisito.FieldByName('CVE_REQUISITO').asString<>'R016')then
    PanelRequisito.Visible := False;
  If Objeto.QDocumento <> nil then
    PanelDocumento.Visible := False;
end;

procedure TWDocCtte.FormShow(Sender: TObject);
begin
   Objeto.Id_Persona.Control:= edIdPersona;			{Asignación de controles}
   Objeto.Id_Contrato.Control:= edIdContrato;
   Objeto.cve_Documento.Control:= edcveDocumento;
   Objeto.F_Prox_Rev_Doc.Control:= edFProxRevDoc;
   Objeto.F_Ult_Rev_Doc.Control:= edFUltRevDoc;
//   Objeto.Num_esc_Publica.Control:= edNumEscPublica;
   Objeto.Sit_Doc_Ctte.Control:= rgSitDocCtte;
   Objeto.Cve_Requisito.Control:= edCveRequisito;
   Objeto.F_alta_doc.Control:= edFAltaDoc;
   Objeto.cve_usuar_modif.Control:= edcveusuarmodif;
   Objeto.fh_modificacion.Control:= edfhmodificacion;
   Objeto.B_Cotejado.Control:= chbBCotejado;
   Objeto.B_Revisado.Control:= chbBRevisado;

   Objeto.Persona.Nombre.Control:=edNombrePersona;
   Objeto.Requisito.Desc_Requisito.Control:=edDescRequisito;
   Objeto.Escritura.Num_esc_Publica.Control:=edNumEscPublica;
   Objeto.Escritura.Nombre.Control := edNombreNotario;
   Objeto.Escritura.Ciudad.Control := edDescPoblacion;
   Objeto.Documento.Desc_documento.Control:=edDescDocumento;
   Objeto.Persona.MasterSourceEditControl := sbMasterSourceEdit;
   Objeto.Requisito.MasterSourceEditControl := sbMasterSourceEdit;
   Objeto.Escritura.MasterSourceEditControl:=sbNumEscPublica;
   Objeto.Documento.MasterSourceEditControl:=sbCveDocumento;

   dbgContratante.datasource:= objeto.dsCtte;     {Asignacion de Data Source}
   dbnContratante.datasource:= objeto.dsCtte;
   dbgRequisito.datasource  := objeto.dsRequisito;
   dbnRequisito.datasource  := objeto.dsRequisito;
   dbgDocumento.DataSource  := objeto.dsDocumento;
   dbnDocumento.DataSource  := objeto.dsDocumento;

   Objeto.FPanelRequisito:= PanelRequisito;		{Revision de los paneles}
	Objeto.FPanelDocumento:= PanelDocumento;
{	If Objeto.QRequisito = nil then
   	PanelRequisito.Visible := True
   else If Objeto.QRequisito.FieldByName('CVE_REQUISITO').asString = 'R016' Then
			PanelRequisito.Visible := True;}
  Objeto.UseTimer := True;
  PostMessage(Handle,WM_DESPUESSHOW,0,0);
end;

procedure TWDocCtte.FormDestroy(Sender: TObject);
begin
   Objeto.Id_Persona.Control:= nil;
   Objeto.Id_Contrato.Control:= nil;
   Objeto.cve_Documento.Control:= nil;
   Objeto.F_Prox_Rev_Doc.Control:= nil;
   Objeto.F_Ult_Rev_Doc.Control:= nil;
//   Objeto.Num_esc_Publica.Control:= nil;
   Objeto.Sit_Doc_Ctte.Control:= nil;
   Objeto.Cve_Requisito.Control:= nil;
   Objeto.F_alta_doc.Control:= nil;
   Objeto.cve_usuar_modif.Control:= nil;
   Objeto.fh_modificacion.Control:= nil;
   Objeto.B_Cotejado.Control:= nil;
   Objeto.B_Revisado.Control:= nil;
   Objeto.Persona.Nombre.Control:=nil;
   Objeto.Requisito.Desc_Requisito.Control:=nil;
   Objeto.Escritura.Num_esc_Publica.Control:=nil;
   Objeto.Escritura.Nombre.Control := nil;
   Objeto.Escritura.Ciudad.Control := nil;
   Objeto.Documento.Desc_documento.Control:=nil;
   Objeto.Persona.MasterSourceEditControl := nil;
   Objeto.Requisito.MasterSourceEditControl := nil;
   Objeto.Escritura.MasterSourceEditControl:=nil;
   Objeto.Documento.MasterSourceEditControl:=nil;
   Objeto.FPanelRequisito:= nil;
   Objeto.FPanelDocumento:= nil;
   Objeto.UseTimer := False;
end;

procedure TWDocCtte.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TWDocCtte.InterForma1Buscar(Sender: TObject);
begin
  Objeto.Busca;
  If Objeto.QDocumento <> nil Then
     Objeto.QDocumento.Locate('ID_PERSONA;CVE_DOCUMENTO;CVE_REQUISITO', VarArrayOf([Objeto.dsCtte.DataSet.fieldbyname('ID_PERSONA').asString, Objeto.cve_Documento.AsString,objeto.Cve_Requisito.AsString]), [loCaseInsensitive]);
end;

procedure TWDocCtte.BitBtn1Click(Sender: TObject);
begin
  If objeto.Contrato <> nil then
     Objeto.Reporte
  else
     Raise EInterFrame.Create('No hay un contrato asignado que reportar');
end;

procedure TWDocCtte.sbNumEscPublicaClick(Sender: TObject);
begin
  Objeto.Escritura.Busca;
end;

procedure TWDocCtte.sbCveDocumentoClick(Sender: TObject);
begin
  Objeto.Documento.Busca;
end;

procedure TWDocCtte.Catalogo1Click(Sender: TObject);
begin
  Objeto.Documento.Catalogo;
end;

procedure TWDocCtte.Catalogo5Click(Sender: TObject);
begin
  Objeto.Escritura.catalogo;
end;

procedure TWDocCtte.InterForma1DespuesNuevo(Sender: TObject);
begin
  edFhModificacion.text := DateTimeToStr(Now);
  edFaltaDoc.text := DateTimeToStr(Now);
  edFProxRevDoc.text := DateTimeToStr(Now);
  edFUltRevDoc.text := DateTimeToStr(Now);
  rgSitDocCtte.ItemIndex := 0;
  If Objeto.Contrato <> nil then Begin
     edIdContrato.Text:= Objeto.contrato.FieldByName('ID_CONTRATO').asString;
     Objeto.Persona.MasterSourceEditControl.Enabled := True;
     Objeto.Persona.FindKey([Objeto.dsCtte.DataSet.fieldbyname('ID_PERSONA').asString]);
     Objeto.Persona.MasterSourceEditControl.Enabled := False;
  End;
//   If Objeto.Req <> nil then
  Objeto.Requisito.MasterSourceEditControl.Enabled := True;
  Objeto.Requisito.FindKey([Objeto.Req.Cve_Requisito.AsString]);
  Objeto.Requisito.MasterSourceEditControl.Enabled := False;
{   If (Objeto.Contratante.QContratante <> nil) and (Objeto.Contratante.QContratante.fieldByName('CVE_PER_JURIDICA').asString ='PF') then
      sbNumEscPublica.Enabled := False;}
  If(objeto.apli <> nil) and (Objeto.Apli.Usuario <> '') then
    edCveUsuarModif.Text:= Objeto.Apli.Usuario
  else
    edCveUsuarModif.Text := ObtenUsuario;
  Objeto.Documento.Busca;
end;

procedure TWDocCtte.InterForma1DespuesModificar(Sender: TObject);
begin
  edNombrePersona.SetFocus;
  edFhModificacion.text := DateTimeToStr(Now);
  If(objeto.apli <> nil)  and (Objeto.Apli.Usuario <> '') then
    edCveUsuarModif.Text:= Objeto.Apli.Usuario
  else
    edCveUsuarModif.Text := ObtenUsuario;
  If Objeto.Documento.Requisito <> nil then
    Objeto.Documento.Requisito.FindKey([objeto.Cve_Requisito.AsString]);
{   If (Objeto.Contratante.QContratante <> nil) and (Objeto.Contratante.QContratante.fieldByName('CVE_PER_JURIDICA').asString ='PF') then
      sbNumEscPublica.Enabled := False;}
end;

procedure TWDocCtte.InterForma1DespuesAceptar(Sender: TObject);
begin
   Objeto.RefrescaQRequisito;
   Objeto.RefrescaQDocumento;
end;

procedure TWDocCtte.InterForma1DespuesEliminar(Sender: TObject);
begin
   Objeto.RefrescaQRequisito;
   Objeto.RefrescaQDocumento;
end;

procedure TWDocCtte.InterForma1DespuesCancelar(Sender: TObject);
begin
  If Objeto.dsRequisito.DataSet <> nil then
     Objeto.Documento.Requisito.FindKey([Objeto.dsRequisito.DataSet.FieldByName('CVE_REQUISITO').asString]);
end;

procedure TWDocCtte.Nuevo1Click(Sender: TObject);
begin
  InterForma1.BtnNuevoClick(self);
end;

procedure TWDocCtte.CatalogoPersonaClick(Sender: TObject);
begin
  Objeto.Persona.Catalogo;
end;

procedure TWDocCtte.MenuItem2Click(Sender: TObject);
begin
  Objeto.Requisito.Catalogo;
end;

procedure TWDocCtte.InterForma1CanEdit(Sender: TObject; CanEdit: Boolean);
begin
  if(Interforma1.F <> nil) and (CanEdit) then begin
    if GetSQL('SELECT CVE_OPER_ACC FROM SECU_OPER_ACC WHERE (CVE_FUNCION=''CLASE_'+UpperCase(Objeto.ClassName)+''') AND (CVE_USUARIO='''+Objeto.DameUsuario+''') and (CVE_OPER_ACC=''MB'')',
       Objeto.SeguDataBaseName,Objeto.SeguSessionName,True)then begin
       chbBRevisado.Enabled := True;
       chbBCotejado.Enabled := True;
    end
    else begin
       chbBRevisado.Enabled := False;
       chbBCotejado.Enabled := False;
    end;
  end;
end;

procedure TWDocCtte.InterForma1AntesNuevo(Sender: TObject; var Realizado: Boolean);
begin
  if(objeto <> nil) Then begin
    While Objeto.IsMoving do
      application.ProcessMessages;
  end;
  Realizado := False;
  InterForma1.ShowError := False;
  If Objeto.Req <> nil Then Begin
    If Objeto.Req.Cve_Requisito.AsString = 'R016' Then
      raise EInterFrame.Create('El contratante no tiene requisitos que cumplir');
   end;
   If Objeto.dsRequisito.DataSet = nil then
     raise EInterFrame.Create('El contratante ya cumplió con todos los requisitos');
   Realizado := True;
end;

procedure TWDocCtte.InterForma1AntesModificar(Sender: TObject; var Realizado: Boolean);
begin
  if(objeto <> nil) Then begin
    While Objeto.IsMoving do
      application.ProcessMessages;
  end;
end;

procedure TWDocCtte.InterForma1AntesEliminar(Sender: TObject; var Realizado: Boolean);
begin
  if(objeto <> nil) Then begin
    While Objeto.IsMoving do
      application.ProcessMessages;
  end;
end;

procedure TWDocCtte.FormHide(Sender: TObject);
begin
	Try
      StoredProc1.DatabaseName := Objeto.DataBaseName;
      StoredProc1.ParamByName('PIDCONTRATO').asInteger := Objeto.Contrato.FieldByName('ID_CONTRATO').asInteger;
      StoredProc1.ParamByName('PIDEMPRESA').asInteger := Objeto.Contrato.FieldByName('ID_EMPRESA').asInteger;
      StoredProc1.ParamByName('PCVEPRODUCTO').asString := Objeto.Contrato.FieldByName('CVE_PRODUCTO').asString;
      StoredProc1.ParamByName('PCVECONCEPCTO').asString := Objeto.Contrato.FieldByName('CVE_CONCEP_CTO').asString;
      StoredProc1.Prepare;
      StoredProc1.ExecProc;
   Except
   	Messagedlg('Error al tratar de actualizar la situación de la documentación del contrato',mtError,[mbOK],0);
   end;
end;

end.



