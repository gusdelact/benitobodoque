//------------------------------------------------------------------------------
// Función    : Catálogo de Contratantes
// Desarrollo : Alberto Ramirez
// Modifico   : Cesar Zamora Ramirez
// Fecha      : 08 de Noviembre de 1997
//------------------------------------------------------------------------------
unit IntCtte;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm, DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, RepCtte,
  IntFind, UnSQL2, InterFun, ComCtrls, DBCtrls, Menus, IntMPers, IntTCtte,
  IntEsc2, IntDtPk, Grids, DBGrids, Ungene, IntPers, IntDom, IntConceCtte,
  IntImpCtte, UnFunProcICB;

Const
     fbTCtteTitular = 1;
     fbTCtteCoTitular = 2;
     fbTCtteRepresentante = 3;
     fbTCtteCtteCtto = 4;
     C_Intervalo = 200;

type
  TCtte= Class;
  TWCtte = class(TForm)
    InterForma1    : TInterForma;
    PopupEmpresa:TPopupMenu;
    catalogo: TMenuItem;
    lbICveRequisito:TLabel;
    edIdPersona:TEdit;
    sbIdPersona:TSpeedButton;
    edNombrePersona:TEdit;
    BitBtn1: TBitBtn;
    Label7: TLabel;
    edIdContrato: TEdit;
    Label8: TLabel;
    edCveContratante:TEdit;
    EdSitContratante:TEdit;
    rgSitContratante:TRadioGroup;
    GroupBox4: TGroupBox;
    Label5: TLabel;
    edFhModificacion: TEdit;
    Label12: TLabel;
    edCveUsuarModif: TEdit;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    edPctBeneficio: TEdit;
    Label11: TLabel;
    cbCveTipoFirma: TComboBox;
    sbCveContratante: TSpeedButton;
    edDescContratante: TEdit;
    PopupContratante: TPopupMenu;
    Catalogo1: TMenuItem;
    PopupEscritura: TPopupMenu;
    Catalogo2: TMenuItem;
    MacvDatePicker1: MacvDatePicker;
    dbgContratante: TDBGrid;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    chBBDoctosVerif: TCheckBox;
    edNumCotitular: TEdit;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edDescPoblacion: TEdit;
    edNombreNotario: TEdit;
    edNumEscPublica: TEdit;
    sbNumEscPublica: TSpeedButton;
    GroupBox5: TGroupBox;
    edTxComentario: TMemo;
    Label9: TLabel;
    sbIdDomicilio: TSpeedButton;
    edIdDomicilio: TEdit;
    edCalleNumero: TEdit;
    PopupDomicilio: TPopupMenu;
    CatalogoDomicilio: TMenuItem;
    sbCveConcepCtte: TSpeedButton;
    Label10: TLabel;
    edCveConcepCtte: TEdit;
    edDescConcepto: TEdit;
    PopupConcepto: TPopupMenu;
    MenuItem1: TMenuItem;
    dbnContratante: TDBNavigator;
    EliminaDomicilio: TMenuItem;
    edModifica: TEdit;
    edRelConTitular: TEdit;
    Label13: TLabel;
    bImpuestos: TBitBtn;
    lNoInscripcion: TLabel;
    mNoInscripcion: TMemo;
    lModificacion: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1Buscar(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure sbIdPersonaClick(Sender: TObject);
    procedure catalogoClick(Sender: TObject);
    procedure EdSitContratanteChange(Sender: TObject);
    procedure rgSitContratanteClick(Sender: TObject);
    procedure Catalogo1Click(Sender: TObject);
    procedure Catalogo2Click(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure sbCveContratanteClick(Sender: TObject);
    procedure sbNumEscPublicaClick(Sender: TObject);
    procedure edCveContratanteChange(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    procedure InterForma1Salir(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CatalogoDomicilioClick(Sender: TObject);
    procedure sbIdDomicilioClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure sbCveConcepCtteClick(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1AntesEliminar(Sender: TObject;
      var Realizado: Boolean);
    procedure InterForma1AntesModificar(Sender: TObject;
      var Realizado: Boolean);
    procedure InterForma1AntesNuevo(Sender: TObject;
      var Realizado: Boolean);
    procedure EliminaDomicilioClick(Sender: TObject);
    procedure PopupDomicilioPopup(Sender: TObject);
    procedure bImpuestosClick(Sender: TObject);
  private
  public
    Objeto: TCtte;
  end;

  TCtte= class(TInterFrame)
  private
    FContrato:TInterFrame;
    FReq_Titular: Boolean;
    FId_Titular: Integer;
    Repeticion: Integer;
    Tiempo: TTimer;
    FUseTimer: Boolean;
    FIsMoving: Boolean;

    procedure      Configura_Impuestos(pId_Contrato : Integer; pActualizaCtte : String);    // CZR 10-JUNIO-2009
  protected
  Procedure SetContrato(Cto:TInterFrame);
  procedure TiempoTimer(Sender: TObject);
  Function GetReq_Titular: Boolean;
  public
    Id_contrato	   : TInterCampo;
    Id_Persona	      : TInterCampo;
    Cve_Contratante  : TInterCampo;
    Num_Esc_Publica  : TInterCampo;
    Cve_Tipo_Firma   : TInterCampo;
    Num_Cotitular    : TInterCampo;
    Pct_Beneficio    : TInterCampo;
    Sit_Contratante  : TInterCampo;
    B_Doctos_Verif   : TInterCampo;
    Cve_Usuar_Modif  : TInterCampo;
    Fh_Modificacion  : TInterCampo;
    Id_Pers_Notario  : TInterCampo;
    Tx_Comentario    : TInterCampo;
    Cve_Concep_Ctte  : TInterCampo;
    Rel_Con_Titular  : TInterCampo;
    Pct_Contrato     : TInterCampo;
    Domicilio	     : TDomicilio;
    Persona	     : TMPersona;
    Ctte	     : TTipoCtte;
    Escritura	     : TEscritura;
    Concepto 	     : TConcCtte;
    QContratante     : TQuery;
    dsContratante    : TDataSource;
    Entrada          : Boolean;
    Function 	 InternalEdit:Boolean; override;
    Function    InternalBusca: Boolean; override;
    Function  	 InternalLocaliza: Boolean; override;
    Function    InternalPost:Boolean; override;
    Function    InternalDelete:Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    function    Reporte:Boolean; override;
    Procedure   DataBaseChange; Override;
    procedure   dsContratanteDataChange(Sender: TObject; Field: TField);
    Procedure 	 RefrescaQContratante;
  published
    Property Contrato: TInterFrame Read FContrato Write SetContrato;
    Property Req_Titular: Boolean Read GetReq_Titular Write FReq_Titular;
    Property UseTimer: Boolean Read FUseTimer Write FUseTimer;
    Property IsMoving: Boolean Read FIsMoving Write FIsMoving;
  end;
var
   vAntModSit     : String;
   vAntModTipCtte : String;
   vIdPersonaAnt  : Integer;   // CZR 06-Abril-2010
implementation
uses IntCtto;
  {$R *.DFM}

constructor TCtte.Create( AOwner : TComponent );
begin
   Inherited;
   Id_contrato:= CreaCampo('ID_CONTRATO',ftInteger,tsNinguno,tsNinguno,True);
   Id_Persona:= CreaCampo('ID_PERSONA',ftInteger,tsNinguno,tsNinguno,True);
   Cve_Contratante:= CreaCampo('CVE_CONTRATANTE',ftString,tsNinguno,tsNinguno,True);
   Num_Esc_Publica:= CreaCampo('NUM_ESC_PUBLICA',ftInteger,tsNinguno,tsNinguno,True);
   Num_Cotitular:= CreaCampo('NUM_COTITULAR',ftInteger,tsNinguno,tsNinguno,True);
   Num_Cotitular.IsRequiered := True;
   Num_Cotitular.Caption := 'Cotitular';
   Pct_Beneficio:= CreaCampo('PCT_BENEFICIO',ftInteger,tsNinguno,tsNinguno,True);
   Sit_Contratante:= CreaCampo('SIT_CONTRATANTE',ftString,tsNinguno,tsNinguno,True);
   B_Doctos_Verif:= CreaCampo('B_DOCTOS_VERIF',ftString,tsNinguno,tsNinguno,True);
   Cve_Usuar_Modif:= CreaCampo('CVE_USUAR_MODIF',ftString,tsNinguno,tsNinguno,True);
   Fh_Modificacion:= CreaCampo('FH_MODIFICACION',ftDate,tsNinguno,tsNinguno,True);
   Id_Pers_Notario:= CreaCampo('ID_PERS_NOTARIO',ftInteger,tsNinguno,tsNinguno,True);
   Tx_Comentario	:= CreaCampo('TX_COMENTARIO',ftString,tsNinguno,tsNinguno,True);
   Cve_Concep_Ctte   := CreaCampo('CVE_CONCEP_CTTE',ftString,tsNinguno,tsNinguno,True);
   Rel_Con_Titular:= CreaCampo('REL_CON_TITULAR',ftString,tsNinguno,tsNinguno,True);
   Pct_Contrato:= CreaCampo('PCT_CONTRATO', ftFloat, tsNinguno, tsNinguno, True);
   Cve_Contratante.Size:= 4;
   Sit_Contratante.Size:= 2;
   B_Doctos_Verif.Size:= 1;
   Cve_Usuar_Modif.Size:= 8;
   Rel_Con_Titular.Size:= 50;
   Cve_Tipo_Firma:= CreaCampo('CVE_TIPO_FIRMA',ftString,tsNinguno,tsNinguno,True);

   With Cve_Tipo_Firma do
   begin
   	Size:=1;
      NoCompare := True;
   	//IsRequiered := True;
      Caption := 'Tipo Firma';
      IsRequiered := True;
      UseCombo:=True;
      ComboLista.Add('A');         ComboDatos.Add('A');
      ComboLista.Add('B');         ComboDatos.Add('B');
      ComboLista.Add('C');	        ComboDatos.Add('C');
      ComboLista.Add('D');	        ComboDatos.Add('D');
      ComboLista.Add('(Ninguno)'); ComboDatos.Add('N');
   end;

{   Id_Domicilio:= CreaCampo('ID_DOMICILIO',ftInteger,tsNinguno,tsNinguno,False);
   Calle_Numero:= CreaCampo('CALLE_NUMERO',ftString,tsNinguno,tsNinguno,False);}
   Domicilio:= TDomicilio.Create(self);


   Persona:=TMPersona.Create(Self);
   Persona.FilterBy:=fbNinguno;
   Persona.MasterSource:=Self;
   Persona.FieldByName('ID_PERSONA').MasterField:='ID_PERSONA';

   Ctte:=TTipoCTTE.Create(Self);
   Ctte.ShowAll := True;
   Ctte.MasterSource:=Self;
   Ctte.FieldByName('CVE_CONTRATANTE').MasterField:='CVE_CONTRATANTE';

   Escritura:=TEscritura.Create(Self);
   Escritura.MasterSource:=Self;
   Escritura.FieldByName('NUM_ESC_PUBLICA').MasterField:='NUM_ESC_PUBLICA';
   Escritura.FieldByName('ID_PERS_NOTARIO').MasterField:='ID_PERS_NOTARIO';

   Concepto:= TConcCtte.Create(self);
   Concepto.MasterSource:=Self;
   Concepto.FieldByName('CVE_CONCEP_CTTE').MasterField:='CVE_CONCEP_CTTE';
   Concepto.BuscaWhereString := 'CVE_CTTE = ''CO''';

   FActive := False;
   FKeyFields.Add('ID_CONTRATO');
   FKeyFields.Add('ID_PERSONA');
   FKeyFields.Add('CVE_CONTRATANTE');
   TableName := 'CONTRATANTE';
   UseQuery := True;
   HelpFile := 'IntCtte.hlp';
   ShowMenuReporte:=True;

   FReq_Titular := False;
   FId_Titular := -1;
   dsContratante := TDataSource.Create(Self);
   dsContratante.OnDataChange := dsContratanteDataChange;

   Repeticion := 0;
   Tiempo := TTimer.Create(self);
   Tiempo.Enabled := False;
   Tiempo.OnTimer := TiempoTimer;
   Tiempo.Interval := C_Intervalo;
   Entrada:= True;

   IsCorp:=True;
   UseTimer:= False;
   IsMoving:= False;
end;

destructor TCtte.Destroy;
begin if Domicilio<>nil then domicilio.free;
		if Persona<>nil then Persona.Free;
      if Ctte<>nil then Ctte.Free;
      if Escritura<>nil then Escritura.Free;
      if Concepto <> nil then Concepto.Free;

      If QContratante <> nil then QContratante.Free;
      if dsContratante <> nil then dsContratante.Free;
      if Tiempo <> nil then Tiempo.Free;
      inherited;
end;

Procedure TCtte.DataBaseChange;
begin
	inherited;
	Domicilio.GetParams(self);
end;

Procedure TCtte.SetContrato(Cto:TInterFrame);
begin
   FContrato:=Cto;
   Ctte.Contrato:=Cto;
   RefrescaQContratante;
   If Cto <> nil Then
//   	RefrescaQContratante
	else
   	Active := False;

   Entrada := True;
end;

Function TCtte.GetReq_Titular: Boolean;
Var
	NumEscritura: Integer;
   Resultado: Boolean;
   Q: TQuery;
begin
   if (Active) and (Contrato <> nil) Then
	begin
      NumEscritura := -1;
    Q := GetSQLQuery(
            ' SELECT'+
            '   CONTRATANTE.ID_PERSONA,'+
            '   NUM_ESC_PUBLICA,'+
            '   ID_PERS_NOTARIO'+
            ' FROM'+
            '   CONTRATANTE,'+
            '   PERSONA'+
            ' WHERE'+
            '   ID_CONTRATO = '+ Contrato.FieldByName('ID_CONTRATO').asstring +
            '   AND CVE_CONTRATANTE = ''C001'''+
            '   AND Cve_per_Juridica = ''PM'''+
            '   AND CONTRATANTE.ID_PERSONA = PERSONA.ID_PERSONA',
         DataBaseName, SessionName, False);
    Try


      If Q <> nil Then
      begin
         FId_Titular := Q.FieldByName('ID_PERSONA').asInteger;
         If Q.FieldByName('NUM_ESC_PUBLICA').isNull Then
            FReq_Titular := False
         else
            FReq_Titular := True;
      end
      else
         FReq_Titular := True;

    Finally if Q<>nil then Q.Free;
    end;

      GetReq_Titular := FReq_Titular;
   end;
end;

function TCtte.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TWCtte;
begin
   W := TWCtte.Create(Self);
   try
      W.Objeto := Self;
      W.InterForma1.InterFrame    := Self;
      W.InterForma1.FormaTipo     := FormaTipo;
      W.InterForma1.ShowBtnAyuda  := False;
      W.InterForma1.ShowGrid      := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion       := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

Function TCtte.InternalEdit:Boolean;
var S:String;
begin if GetSQL('SELECT CVE_OPER_ACC FROM SECU_OPER_ACC WHERE (CVE_FUNCION=''CLASE_'+UpperCase(ClassName)+''') AND (CVE_USUARIO='''+DameUsuario+''') and (CVE_OPER_ACC=''MM'')',
               SeguDataBaseName,SeguSessionName,True)
      then begin if Trunc(fh_modificacion.AsDateTime)<>Trunc(Apli.SysDateTime)
                 then Raise EInterFrame.Create('Este Documento fue Creado otro Dia. No tiene Derecho para Modificarlo, Solo el Mismo día de Creación. Verifique con su Administrador');
           end;
      Result:=Inherited InternalEdit;
end;


Function TCtte.InternalBusca:Boolean;
Var
	T:TInterFindit;
   SQL: String;
begin
	InternalBusca := False;
   T:=CreaBuscador('IntCtte.it','I,I,S');
   T.CamposResultado:='';
   SQL:= BuscaWhereString;

   //      	T.WhereString := '(Id_Contrato = '+ Contrato.FieldByName('ID_CONTRATO').asstring + ')';
   If Contrato <> nil then AddSQL(SQL,'(Id_Contrato = '+ Contrato.FieldByName('ID_CONTRATO').asstring + ')');

	Case FilterBy of
   	fbTCtteTitular:    	AddSQL(SQL, '(CTTE.CVE_CONTRATANTE in(''C001'',''C005''))');
		fbTCtteCoTitular:    AddSQL(SQL, '(CTTE.CVE_CONTRATANTE in(''C003''))');
      fbTCtteRepresentante:AddSQL(SQL, '(CTTE.CVE_CONTRATANTE in(''C008'',''C004'',''C006'',''C007''))');
      fbTCtteCtteCtto:     AddSQL(SQL, '(CTTE.CVE_CONTRATANTE <> ''C021'')');				{Excluye al Destinatario Correo}
   end;

   T.WhereString := SQL;

      try if T.Execute then
          begin InternalBusca:=FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2)]);
          end;
      finally T.Free;
      end; {end-try}
end;

Function TCtte.InternalLocaliza: Boolean;
var	vlId_Dom: Integer;
begin
	If Active Then
   begin
      If GetSqlInt(
               ' Select id_domicilio'+
               ' From   Dom_cte_cto'+
               ' where  id_contrato = '+ Id_contrato.asString +
               '    and id_persona = '+ Id_Persona.AsString,
               DataBaseName, SessionName, 'ID_DOMICILIO', vlId_Dom, False) then
         Domicilio.FindKey([IntToStr(vlId_Dom)])
      else
         Domicilio.Active := False;
   end
   else Domicilio.Active := False;

   Result := True;
end;

Function TCtte.InternalPost:Boolean;
var NumRec : Integer;
begin
	Result := Inherited InternalPost;
   if (Result) and (Trim(Domicilio.IdDomicilio.AsString) <> '') Then
   begin
      Try
{      	case modo of
         moAppend:
         	Begin
               RunSQL(	' Insert Into Dom_Cte_Cto(Id_Contrato, Id_persona, Id_domicilio)'+
                      	' values('+Id_contrato.asString+','+Id_persona.AsString+','+Domicilio.IdDomicilio.AsString+')',
                        DataBaseName, SessionName, False);
            End;

         moEdit:
         	Begin}

         if modo in ([moEdit, moAppend]) Then
         begin
               GetSQLInt(
               	'Select count(*) as contador from dom_cte_cto'+
                  ' where  id_contrato = '+ Id_contrato.asString +
                  '        and id_persona = '+ Id_Persona.AsString,
               DataBaseName, SessionName, 'CONTADOR', NumRec, False);

               if NumRec = 0 then
                     RunSQL(	' Insert Into Dom_Cte_Cto(Id_Contrato, Id_persona, Id_domicilio)'+
                              ' values('+Id_contrato.asString+','+Id_persona.AsString+','+Domicilio.IdDomicilio.AsString+')',
                              DataBaseName, SessionName, False)
               else
            			RunSQL(  ' Update Dom_Cte_Cto'+
                           ' Set Id_domicilio = '+ Domicilio.IdDomicilio.AsString+
                           ' Where  id_contrato = '+ Id_contrato.asString +
                           '    and id_persona = '+ Id_Persona.AsString,
                           DataBaseName, SessionName, False);
         end;

{            end;
         end;}
      except
      end;
   end;
end;

Function TCtte.InternalDelete:Boolean;
var
  v_IdContrato, v_IdPersona: String;
  Q         : Tquery;
  SQL       : string;
  vFolio    : Integer;
begin
	v_IdContrato:= Id_contrato.asString;
   v_IdPersona := Id_Persona.asString;
	Result := Inherited InternalDelete;
   if Result Then
   begin
      Try
       SQL:=' SELECT NUM_FOLIO as FOLIO '
           +' FROM FOLIO_CORP '
           +' WHERE ID_EMPRESA   = 2 '
           +'  AND  CVE_FOLIO    = ''BITCTTE'' ';
       Q := GetSqlQuery(SQL,DataBaseName,SessionName,True);
        if Q<>nil then
           begin
            try
              vFolio := Q.FieldByName('FOLIO').AsInteger + 1;
            Finally
              Q.Free;
            end;
        end;
        if Q=nil then
           Q.Free;

               RunSQL('INSERT INTO CONTRATANTE_BITACORA ( '+
                      'ID_CONTRATO, ID_PERSONA, CONSECUTIVO, CVE_USUARIO, FH_REGISTRO, DESC_MODIF )' +
                      'VALUES ( ' + Id_Contrato.asString                          + ','
                                  + Id_Persona.asString                           + ','
                                  + InttoStr(vFolio + 1)                          + ','
                                  + chr(39) + cve_usuar_modif.AsString + chr(39)      + ','
                                  +' to_date(to_char(sysdate,''dd/mm/yyyy hh:mi:ss AM''),''dd/mm/yyyy hh:mi:ss AM'') ' + ','
                                  + chr(39) + ' Registro Eliminado, Id Contratante : '     + Id_Persona.asString  +
                                              ' Id Domicilio : '         + domicilio.IdDomicilio.AsString  +
                                              ' Tipo Contratante : '     + Cve_Contratante.AsString +
                                              ' Tipo de Firma : '        + CVE_TIPO_FIRMA.AsString +
                                              ' Concepto : '             + CVE_CONCEP_CTTE.AsString +
                                              ' Sit. Contratante : '     + SIT_CONTRATANTE.AsString +
                                              ' Relación con Titular : ' + REL_CON_TITULAR.AsString +
                                    chr(39) + ')', DataBaseName, SessionName, True);

       RunSQL('UPDATE FOLIO_CORP '+
              'SET NUM_FOLIO    = '+ InttoStr(vFolio) +
              'WHERE ID_EMPRESA = 2 '  +
              'AND   CVE_FOLIO = ''BITCTTE'' ', DataBaseName, SessionName, True);


      {RunSQL(' Delete Dom_Cte_Cto'+
              ' Where  Id_Contrato = '+ v_IdContrato +
              '    and Id_Persona  = '+ v_IdPersona,
              DataBaseName, SessionName, False);

       if RunSQL(' Delete Doc_Contratante'+
                 ' Where  Id_Contrato = '+ v_IdContrato +
                 '    and Id_Persona  = '+ v_IdPersona,
                 DataBaseName, SessionName, False) Then
       MessageDlg('Los documento presentados por el contratante han sido eliminados', mtInformation,[mbOK],0);}
      except
      end;
   end;
end;

function TCtte.Reporte:Boolean;
begin
   If Contrato <> nil Then
		Execute_RepCtte(True,Self,Contrato.FieldByName('ID_CONTRATO').asInteger)
   else
   	Raise EInterFrame.Create('El contrato no ha sido asignado');
end;

procedure TCtte.TiempoTimer(Sender: TObject);
begin
	if Repeticion = 3 Then
   begin
      Repeticion := 0;
      Tiempo.Enabled := False;
      IsMoving:= False;

      If Not dsContratante.DataSet.IsEmpty then
      Begin
         FindKey([Contrato.FieldByName('ID_CONTRATO').asString,
               dsContratante.DataSet.FieldByName('ID_PERSONA').asString,
               dsContratante.DataSet.FieldByName('CVE_CONTRATANTE').asString]);
         DrawControl;
      End
      else
         FActive := False;
   end
   else Inc(Repeticion);
end;


procedure TCtte.dsContratanteDataChange(Sender: TObject; Field: TField);
begin
   If (Field = nil) then
   Begin
   	//if (Entrada) or (Not UseTimer) Then
      if (Not UseTimer) Then
      begin
         If Not dsContratante.DataSet.IsEmpty then
         Begin
            FindKey([Contrato.FieldByName('ID_CONTRATO').asString,
                  dsContratante.DataSet.FieldByName('ID_PERSONA').asString,
                  dsContratante.DataSet.FieldByName('CVE_CONTRATANTE').asString]);
            DrawControl;
         End
         else
            FActive := False;

         Entrada := False;
      end
      else
      begin
         Tiempo.Enabled := True;
         Repeticion := 0;
         IsMoving:= True;
      end;
   End;
end;

{procedure TCtte.dsContratanteDataChange(Sender: TObject; Field: TField);
begin
   If (Field = nil) then
   Begin
   	If Not dsContratante.DataSet.IsEmpty then
      Begin
         FindKey([Contrato.FieldByName('ID_CONTRATO').asString,
               dsContratante.DataSet.FieldByName('ID_PERSONA').asString,
               dsContratante.DataSet.FieldByName('CVE_CONTRATANTE').asString]);
         DrawControl;
      End
      else
         FActive := False;
   End;
end;}

Procedure TCtte.RefrescaQContratante;
Var SQL: STring;
Begin
	Try
      if QContratante <> nil then QContratante.Free;

      If (Contrato <> nil) then
      Begin
      	SQL :=
            ' SELECT'+
            '  P.ID_PERSONA,'+
            '  P.NOMBRE CONTRATANTE,'+
            '  P.CVE_PER_JURIDICA,'+
            '  P.CVE_NACIONALIDAD,'+
            '  TCTTE.CVE_CONTRATANTE,'+
            '  TCTTE.DESC_CONTRATANTE TIPO_CONTRATANTE,'+
            '  CTTE.PCT_BENEFICIO BENEFICIO, '+
            '  CVE_TIPO_FIRMA FIRMA,'+
            '  SIT_CONTRATANTE SITUACION,'+
            '  NUM_ESC_PUBLICA,'+
            '  ID_PERS_NOTARIO,'+
            '  Ctte.Cve_Concep_Ctte,'+
            '  Concepto_Ctte.Desc_Concepto'+
            ' FROM'+
            '  CONTRATANTE CTTE,'+
            '  PERSONA P,'+
            '  TIPO_CONTRATANTE TCTTE,'+
            '  CONCEPTO_CTTE'+
            ' WHERE'+
            '  CTTE.ID_CONTRATO = '+ Contrato.FieldByName('ID_CONTRATO').asstring +
            '  AND TCTTE.CVE_CONTRATANTE = CTTE.CVE_CONTRATANTE'+
            '  AND CTTE.ID_PERSONA = P.ID_PERSONA'+
            '  AND Ctte.Cve_Concep_Ctte = Concepto_ctte.Cve_concep_ctte (+) ';

         Case FilterBy of
            fbTCtteTitular:    	AddSQL(SQL, '(CTTE.CVE_CONTRATANTE in(''C001'',''C005''))');
            fbTCtteCoTitular:    AddSQL(SQL, '(CTTE.CVE_CONTRATANTE in(''C003''))');
            fbTCtteRepresentante:AddSQL(SQL, '(CTTE.CVE_CONTRATANTE in(''C008'',''C004'',''C006'',''C007''))');
            fbTCtteCtteCtto:     AddSQL(SQL, '(CTTE.CVE_CONTRATANTE <> ''C021'')');				{Excluye al Destinatario Correo}
         end;

         QContratante:= GetSQLQuery(SQL, DataBaseName, SessionName, False);
		end;

		if QContratante <> nil then
      begin
         QContratante.fieldByName('CVE_CONTRATANTE').Visible := False;
         QContratante.fieldByName('ID_PERSONA').Visible := False;
         QContratante.FieldByName('NUM_ESC_PUBLICA').Visible := False;
         QContratante.FieldByName('ID_PERS_NOTARIO').Visible := False;
         QContratante.FieldByName('CVE_PER_JURIDICA').Visible := False;
         QContratante.FieldByName('CVE_NACIONALIDAD').Visible := False;
         QContratante.FieldByName('CVE_CONCEP_CTTE').Visible := False;
//         QContratante.FieldByName('DESC_CONCEPTO').Visible := False;
         QContratante.FieldByName('CONTRATANTE').DisplayWidth := 45;
         QContratante.FieldByName('TIPO_CONTRATANTE').DisplayWidth := 33;
         QContratante.FieldByName('TIPO_CONTRATANTE').DisplayLabel := 'TIPO CONTRATANTE';
         QContratante.FieldByName('DESC_CONCEPTO').DisplayLabel := 'CONCEPTO';
      end
      else
         begin
            Active := False;
            Domicilio.Active := False;
         end;

      dsContratante.DataSet := QContratante;
   Finally
   end;
end;

(***********************************************FORMA DE Requisito***************)
(*                                                                              *)
(*  FORMA DE Requisito                                                          *)
(*                                                                              *)
(***********************************************FORMA DE Requisito***************)

procedure TWCtte.FormShow(Sender: TObject);
var
   Qry : TQuery;
begin
   Objeto.Id_Contrato.Control		:= edIdContrato;
   Objeto.Id_Persona.Control		:= edIdPersona;
   Objeto.Cve_Contratante.Control:= edCveContratante;
   Objeto.Num_Esc_Publica.Control:= edNumEscPublica;
   Objeto.Cve_Tipo_Firma.Control	:= cbCveTipoFirma;
   Objeto.Num_Cotitular.Control	:= edNumCotitular;
   Objeto.Pct_Beneficio.Control	:= edPctBeneficio;
   Objeto.Sit_Contratante.Control:= edSitContratante;
   Objeto.B_Doctos_Verif.Control	:= chbBDoctosVerif;
   Objeto.Cve_Usuar_Modif.Control:= edCveUsuarModif;
   Objeto.Fh_Modificacion.Control:= edFhModificacion;
   Objeto.Tx_Comentario.Control	:= edTxComentario;
   Objeto.Cve_Concep_Ctte.Control 	:= edCveConcepCtte;
   Objeto.Rel_Con_Titular.Control	:= edRelConTitular;

   Objeto.Domicilio.IdDomicilio.Control   := edIdDomicilio;
   Objeto.Domicilio.CalleNumero.Control   := edCalleNumero;
   Objeto.Domicilio.MasterSourceEditControl := sbIdDomicilio;
   Objeto.Persona.Nombre.Control := edNombrePersona;
   Objeto.Persona.MasterSourceEditControl:=sbIdPersona;
   Objeto.Ctte.Desc_Contratante.Control:=edDescContratante;
   Objeto.Ctte.MasterSourceEditControl:=sbCveContratante;
   Objeto.Escritura.MasterSourceEditControl:=sbNumEscPublica;
   Objeto.Escritura.Nombre.Control :=edNombreNotario;
   Objeto.Escritura.Ciudad.Control := edDescPoblacion;
   Objeto.Escritura.TX_INSCRIPCION.Control := mNoInscripcion; // CZR 27-nov-2014
   Objeto.Concepto.MasterSourceEditControl := sbCveConcepCtte;
   Objeto.Concepto.DESC_CONCEPTO.Control := edDescConcepto;

   dbgContratante.datasource := Objeto.dsContratante;
   dbnContratante.datasource := Objeto.dsContratante;
   InterForma1.F.OnCloseQuery := FormCloseQuery;

   If (Objeto.QContratante <> nil) and (not Objeto.Req_Titular) Then
   Begin
      Objeto.QContratante.Locate('ID_PERSONA;CVE_CONTRATANTE',VarArrayOf([IntToStr(Objeto.FId_Titular), 'C001']),
               [loCaseInsensitive]);
      MessageDlg('El Titular del contrato requiere una escritura pública por ser Persona Moral',
            mtWarning,[mbOK], 0);
      //Objeto.Edit;
   end;

   Objeto.Entrada := True;
   Objeto.UseTimer := True;

   // CZR 06-JUNIO-2009     Configurar el boton de Impuestos
   {try
      Qry := GetSqlQuery( ' SELECT ID_CONTRATO '
                        + ' FROM CONTRATO '
                        + ' WHERE ID_CONTRATO = ' + IntToStr(Objeto.Contrato.FieldByName('ID_CONTRATO').AsInteger)
                        + '   AND CONTRATO.CVE_TIP_CONTRATO IN(''CIBC'', ''IFON'', ''OMSC'') '
                        + '   AND EXISTS(SELECT ID_TITULAR FROM PERSONA_FISICA WHERE ID_PERSONA = CONTRATO.ID_TITULAR) '
                        + '   AND PKGFUNPROCCORP.BDOCTOCONTRATO(ID_CONTRATO, ID_TITULAR, ''D187'') = ''V''',
                         Objeto.DataBaseName, Objeto.SessionName, True);
      if Qry = nil then
         bImpuestos.Enabled := False
   {  else}
         bImpuestos.Enabled := True;
   {finally
      if Qry <> nil then
      begin
         Qry.close;     Qry.free;
      end;
   end;}
end;

procedure TWCtte.FormDestroy(Sender: TObject);
begin
   Objeto.Id_Contrato.Control		:= nil;
   Objeto.Id_Persona.Control		:= nil;
   Objeto.Cve_Contratante.Control:= nil;
   Objeto.Num_Esc_Publica.Control:= nil;
   Objeto.Cve_Tipo_Firma.Control	:= nil;
   Objeto.Num_Cotitular.Control	:= nil;
   Objeto.Pct_Beneficio.Control	:= nil;
   Objeto.Sit_Contratante.Control:= nil;
   Objeto.B_Doctos_Verif.Control	:= nil;
   Objeto.Cve_Usuar_Modif.Control:= nil;
   Objeto.Fh_Modificacion.Control:= nil;
   Objeto.Tx_Comentario.Control	:= nil;
   Objeto.Cve_Concep_Ctte.Control 	:= nil;
   Objeto.Rel_Con_Titular.Control 	:= nil;

   Objeto.Domicilio.IdDomicilio.Control:= nil;
   Objeto.Domicilio.CalleNumero.Control:= nil;
   Objeto.Domicilio.MasterSourceEditControl:= nil;
   Objeto.Persona.Nombre.Control := nil;
   Objeto.Persona.MasterSourceEditControl:= nil;
   Objeto.Ctte.Desc_Contratante.Control:= nil;
   Objeto.Ctte.MasterSourceEditControl :=  nil;
   Objeto.Escritura.MasterSourceEditControl:= nil;
//   Objeto.Escritura.Num_esc_Publica.Control:= nil;
   Objeto.Escritura.Nombre.Control := nil;
   Objeto.Escritura.Ciudad.Control := nil;
   Objeto.Escritura.TX_INSCRIPCION.Control := nil; // CZR 27-nov-2014
   Objeto.Concepto.MasterSourceEditControl := nil;
   Objeto.Concepto.DESC_CONCEPTO.Control := nil;

   Objeto.UseTimer := False;
end;

procedure TWCtte.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCtte.InterForma1Buscar(Sender: TObject);
begin Objeto.Busca;
		If Objeto.qContratante <> nil then
	      Objeto.QContratante.Locate('ID_PERSONA;CVE_CONTRATANTE',VarArrayOf([objeto.Id_Persona.AsString, Objeto.Cve_Contratante.AsString]),
               [loCaseInsensitive]);
end;

procedure TWCtte.BitBtn1Click(Sender: TObject);
begin Objeto.Reporte;
end;

procedure TWCtte.sbIdPersonaClick(Sender: TObject);
var 	FindIt:TInterFindIt;
      vl_id_persona, vl_CvePerJuridica: String;
begin
{	If Objeto.Modo = moAppend Then
   begin
   	if (Objeto.Contrato.Active) and (Objeto.Contrato.FieldByName('CVE_TIP_CONTRATO').asString = 'FIDE') Then
      	Objeto.Persona.FilterBy := fbNinguno
      else
			Objeto.Persona.FilterBy := fbTMPersonaFisica;
   end
   else if (Objeto.Modo = moEdit) Then
   	begin
			GetSqlStr('Select cve_per_juridica from persona where id_persona='+Objeto.Persona.ID_Persona.AsString,
   			Objeto.DataBaseName,Objeto.SessionName,'CVE_PER_JURIDICA',vl_CvePerJuridica, False);
         If (vl_CvePerJuridica = 'PM') Then
            Objeto.Persona.FilterBy := fbTMPersonaMoral
         else
            Objeto.Persona.FilterBy := fbTMPersonaFisica;
      end;}

   Objeto.Persona.FilterBy := fbNinguno;
   Objeto.Persona.BuscaWhereString := Objeto.Persona.BuscaWhereString + ' (PERSONA.SIT_PERSONA = ''AC'')' ;

   if Objeto.Persona.Busca then
   begin
   	vl_id_persona:= Objeto.Persona.id_persona.asstring;

      if (GetSqlStr('Select Sit_Persona from persona where id_persona='+Objeto.Persona.ID_Persona.AsString,
      		Objeto.DataBaseName,Objeto.SessionName,'SIT_PERSONA',vl_CvePerJuridica, False))
	   	and (vl_CvePerJuridica <> 'AC') Then messagedlg('La persona seleccionada no esta activa',mtInformation,[mbOK],0);
   end
   else
   	vl_id_persona:= Objeto.id_persona.asstring;

   Objeto.Persona.FilterBy := fbNinguno;
   Objeto.Persona.findkey([vl_id_persona]);
end;

procedure TWCtte.sbCveContratanteClick(Sender: TObject);
var	Sit_Titular: String;
begin
	if (Objeto.Ctte.Busca) and (Objeto.Modo = moAppend) and (Objeto.Ctte.Cve_Contratante.AsString = 'C001') and (Objeto.Contrato <> nil) Then
   begin
{   	Sit_Titular := '';
      if GetSqlStr(
         ' Select Sit_Contratante'+
         ' From Contratante'+
         ' Where Id_contrato = ' + Objeto.Contrato.FieldByName('ID_CONTRATO').AsSQL +
         '   and Cve_Contratante = ''C001''',
         Objeto.DataBaseName,Objeto.SessionName,'SIT_CONTRATANTE',Sit_Titular,False)
         and (Sit_Titular = 'AC') Then
      begin
      	messagedlg('Ya existe un titular activo para el contrato',mtError,[mbOK],0);
         Objeto.Ctte.Active := False;
      end;}
   end;
end;


procedure TWCtte.sbNumEscPublicaClick(Sender: TObject);
begin Objeto.Escritura.Busca;
end;

procedure TWCtte.catalogoClick(Sender: TObject);
var	v_id_persona, vl_CvePerJuridica: String;
begin
  If Objeto.Modo = moAppend Then begin
     Objeto.Persona.FilterBy := fbNinguno;
  end
  else begin
      GetSqlStr('Select cve_per_juridica from persona where id_persona='+Objeto.Persona.ID_Persona.AsString,
         Objeto.DataBaseName,Objeto.SessionName,'CVE_PER_JURIDICA',vl_CvePerJuridica, False);
      If (vl_CvePerJuridica = 'PM') Then
         Objeto.Persona.FilterBy := fbTMPersonaMoral
      else
         Objeto.Persona.FilterBy := fbTMPersonaFisica;
   end;

   if Objeto.Persona.Catalogo then
   Begin
   	v_id_persona:= Objeto.Persona.id_persona.asstring;

      if (GetSqlStr('Select Sit_Persona from persona where id_persona='+Objeto.Persona.ID_Persona.AsString,
      		Objeto.DataBaseName,Objeto.SessionName,'SIT_PERSONA',vl_CvePerJuridica, False))
	   	and (vl_CvePerJuridica <> 'AC') Then messagedlg('La persona seleccionada no esta activa',mtInformation,[mbOK],0);
   end
   else
   	v_id_persona:= Objeto.id_persona.asstring;

   Objeto.Persona.FilterBy := fbNinguno;
   Objeto.Persona.findkey([v_id_persona]);
end;

procedure TWCtte.Catalogo1Click(Sender: TObject);
begin Objeto.Ctte.catalogo;
end;

procedure TWCtte.Catalogo2Click(Sender: TObject);
begin Objeto.Escritura.catalogo;
end;

procedure TWCtte.EdSitContratanteChange(Sender: TObject);
Const ValX:Array[-1..2] of String=('','AC','IN','BL');
begin
 	If Trim(edSitContratante.Text)='BL' then
   	rgSitContratante.ItemIndex:=2
   else
		rgSitContratante.ItemIndex:=Byte(Trim(edSitContratante.Text)='IN');
end;

procedure TWCtte.rgSitContratanteClick(Sender: TObject);
Const ValX:Array[-1..2] of String=('','AC','IN','BL');
begin
	edSitContratante.Text:=ValX[rgSitContratante.ItemIndex];;
end;


procedure TWCtte.InterForma1DespuesNuevo(Sender: TObject);
begin
  edModifica.Text := 'N';
  objeto.Pct_Contrato.AsFloat:= 0;
  Objeto.Domicilio.Active := false;
  chBBDoctosVerif.Checked := False;
  edSitContratante.Text := 'AC';
  edFhModificacion.text := DateTimeToStr(Now);
  Objeto.Concepto.FindKey(['A001']);
  If Objeto.Contrato <> nil then
       edIdContrato.Text := Objeto.contrato.FieldByName('ID_CONTRATO').asString;
  If (objeto.apli <> nil) and (Objeto.Apli.Usuario <> '') then
       edCveUsuarModif.Text:= Objeto.Apli.Usuario
  else
       edCveUsuarModif.Text := ObtenUsuario;
end;

procedure TWCtte.InterForma1DespuesModificar(Sender: TObject);
begin
   edModifica.Text := 'M';
   chBBDoctosVerif.Checked := False;
   edFhModificacion.text := DateTimeToStr(Now);
   If (objeto.apli <> nil) and (objeto.Apli.Usuario<>'') then
   	edCveUsuarModif.Text:= Objeto.Apli.Usuario
   else
   	edCveUsuarModif.Text := ObtenUsuario;

   // CZR 15-JUNIO-2009     Obtener Situacion y Tipo de Contratante antes de modificar
   vAntModSit     := Trim(Objeto.Sit_Contratante.AsString);
   vAntModTipCtte := Trim(Objeto.Cve_Contratante.AsString);

   vIdPersonaAnt  := Objeto.Id_Persona.AsInteger; // CZR 06-Abril-2010
end;

procedure TWCtte.edCveContratanteChange(Sender: TObject);
var vlTCto, vlTTit:String;
begin
      //MARA4356 SEP 2008 PARA VALIDACIONES GENERALES
      GetSqlStr(' SELECT ID_CONTRATO FROM CONTRATO '+
                ' WHERE ((CVE_TIP_CONTRATO IN(SELECT DS_PARAMETRO FROM DV_IB_PARAM WHERE CVE_GPO_PARAM=''CTOVIS'' AND CVE_PARAMETRO LIKE ''CTO%'') '+
                '       AND CVE_PRODUCTO IN(SELECT CVE_PRODUCTO FROM DV_PRODUCTO WHERE CVE_PROD_IPAB IS NOT NULL) ) '+
                ' OR CVE_TIP_CONTRATO IN(SELECT DS_PARAMETRO FROM DV_IB_PARAM WHERE CVE_GPO_PARAM=''CTOPAG'' AND CVE_PARAMETRO LIKE ''CTO%'') ) '+
                ' AND ID_CONTRATO='+ Objeto.Contrato.FieldByName('ID_CONTRATO').AsString,
         Objeto.DataBaseName,Objeto.SessionName,'ID_CONTRATO',vlTCto, False);
      GetSqlStr(' SELECT CVE_GPO_PARAM FROM DV_IB_PARAM '+
                ' WHERE cve_gpo_param=''TIT'' AND CVE_PARAMETRO LIKE ''BEN%'' AND DS_PARAMETRO='''+Objeto.Cve_Contratante.asString+''' ',
         Objeto.DataBaseName,Objeto.SessionName,'CVE_GPO_PARAM',vlTTit, False);
                        {
      If (Objeto.Cve_Contratante.asString = 'C011' ) or
         ( (vlTCto=Objeto.Contrato.FieldByName('ID_CONTRATO').AsString) AND (vlTTit='TIT') ) //MARA4356 SEP 2008 NUEVA VALIDACIÓN PARA PORCENTAJE DE TITULARIDAD DE LOS CONTRATOS DE CHEQUES Y DE INVERSIONES
      Then
      Begin            }
      	edPctBeneficio.Enabled := True;
{      End
      Else
      Begin
      	edPctBeneficio.Enabled := False;
         edPctBeneficio.Text := '0';
      End}
end;

// CZR 10-JUNIO-2009     Configura el Impuesto en Cotratante y Constancias
procedure TCtte.Configura_Impuestos(pId_Contrato : Integer; pActualizaCtte : String);
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

procedure TWCtte.InterForma1DespuesAceptar(Sender: TObject);
var
   Q          : TQuery;
   SQL        : String;
   vFolio     : Integer;
   vD187      : String;
   frmImpCtte : TImpCtte;
begin
   Objeto.RefrescaQContratante;

   SQL:=' SELECT NUM_FOLIO as FOLIO '
     +' FROM FOLIO_CORP '
     +' WHERE ID_EMPRESA   = 2 '
     +'  AND  CVE_FOLIO    = ''BITCTTE'' ';
   Q := GetSqlQuery(SQL,Objeto.DataBaseName,Objeto.SessionName,True);
   if Q<>nil then
     begin
      try
        vFolio := Q.FieldByName('FOLIO').AsInteger + 1;
      Finally
        Q.Free;
      end;
   end;
   if Q=nil then
     Q.Free;


   // CZR 15-JUNIO-2009     Verificar si el Titular cuenta con el documento D187
   GetSqlStr(' SELECT PKGFUNPROCCORP.BDOCTOCONTRATO(ID_CONTRATO, ID_TITULAR, ''D187'') AS D187 '
           + ' FROM CONTRATO '
           + ' WHERE ID_CONTRATO = ' + IntToStr(Objeto.Contrato.FieldByName('ID_CONTRATO').AsInteger),
            Objeto.DataBaseName, Objeto.SessionName, 'D187', vD187, False);

   If edModifica.Text = 'N' Then
   begin
      RunSQL('INSERT INTO CONTRATANTE_BITACORA ( '+
             'ID_CONTRATO, ID_PERSONA, CONSECUTIVO, CVE_USUARIO, FH_REGISTRO, DESC_MODIF )' +
             'VALUES ( ' + edIDContrato.text                             + ','
                         + edIdPersona.text                              + ','
                         + InttoStr(vFolio + 1)                          + ','
                         + chr(39) + edCveUsuarModif.Text + chr(39)      + ','
                         +' to_date(to_char(sysdate,''dd/mm/yyyy hh:mi:ss AM''),''dd/mm/yyyy hh:mi:ss AM'') ' + ','
                         + chr(39) + ' Registro Nuevo, Id Contratante : '     + edIdPersona.Text      +
                                     ' Contratante : '          + edNombrePersona.Text  +
                                     ' Id Domicilio : '         + edIdDomicilio.Text    +
                                     ' Tipo Contratante : '     + edCveContratante.Text +
                                     ' - '                      + edDescContratante.Text +
                                     ' Tipo de Firma : '        + cbCveTipoFirma.Text +
                                     ' Concepto : '             + edCveConcepCtte.Text +
                                     ' - '                      + edDescConcepto.Text +
                                     ' Sit. Contratante : '     + edSitContratante.Text +
                                     ' Relación con Titular : ' + edRelConTitular.Text +
                           chr(39) + ')', Objeto.DataBaseName, Objeto.SessionName, True);

      RunSQL('UPDATE FOLIO_CORP '+
             'SET NUM_FOLIO    = '+ InttoStr(vFolio) +
             'WHERE ID_EMPRESA = 2 '  +
             'AND   CVE_FOLIO = ''BITCTTE'' ', Objeto.DataBaseName, Objeto.SessionName, True);

      // CZR 01-JUNIO-2009     Se asigna cero a Contratantes y se Prorratea Constancias
      if trim(vD187) = 'F' then
         Objeto.Configura_Impuestos(Objeto.Contrato.FieldByName('ID_CONTRATO').AsInteger, 'V');
   end;
   If edModifica.Text = 'M' Then
   begin
      RunSQL('INSERT INTO CONTRATANTE_BITACORA ( '+
             'ID_CONTRATO, ID_PERSONA, CONSECUTIVO, CVE_USUARIO, FH_REGISTRO, DESC_MODIF )' +
             'VALUES ( ' + edIDContrato.text                             + ','
                         + edIdPersona.text                              + ','
                         + InttoStr(vFolio + 1)                          + ','
                         + chr(39) + edCveUsuarModif.Text + chr(39)      + ','
                         +' to_date(to_char(sysdate,''dd/mm/yyyy hh:mi:ss AM''),''dd/mm/yyyy hh:mi:ss AM'') ' + ','
                         + chr(39) + ' Registro Modificado, Id Contratante : '     + edIdPersona.Text      +
                                     ' Contratante : '          + edNombrePersona.Text  +
                                     ' Id Domicilio : '         + edIdDomicilio.Text    +
                                     ' Tipo Contratante : '     + edCveContratante.Text +
                                     ' - '                      + edDescContratante.Text +
                                     ' Tipo de Firma : '        + cbCveTipoFirma.Text +
                                     ' Concepto : '             + edCveConcepCtte.Text +
                                     ' - '                      + edDescConcepto.Text +
                                     ' Sit. Contratante : '     + edSitContratante.Text +
                                     ' Relación con Titular : ' + edRelConTitular.Text +
                           chr(39) + ')', Objeto.DataBaseName, Objeto.SessionName, True);

       RunSQL('UPDATE FOLIO_CORP '+
              'SET NUM_FOLIO    = '+ InttoStr(vFolio) +
              'WHERE ID_EMPRESA = 2 '  +
              'AND   CVE_FOLIO = ''BITCTTE'' ', Objeto.DataBaseName, Objeto.SessionName, True);

      if trim(vD187) = 'V' then
      begin
         { Verificar si la modificacion afecta la configuracion de impuesto del contrato
              1. El contratante tiene un porcentaje de impuesto configurado
              2. Se modifica la situacion del contratante o el tipo de contratante
              3. El tipo de contratante se considera para la configuracion de impuesto }

         if (objeto.Pct_Contrato.AsFloat > 0) and
            (
              (vAntModSit <> Objeto.Sit_Contratante.AsString) or
              ( (vAntModTipCtte <> Objeto.Cve_Contratante.AsString) and
                (
                  (vAntModTipCtte = 'C001') or
                  (vAntModTipCtte = 'C002') or
                  (vAntModTipCtte = 'C003') or
                  (Objeto.Cve_Contratante.AsString = 'C001') or
                  (Objeto.Cve_Contratante.AsString = 'C002') or
                  (Objeto.Cve_Contratante.AsString = 'C003')
                )
              )
            ) then
         begin
            // Prorratea Contratantes y Constancias
            if MessageDlg('La modificación realizada al contratante afecta la configuración de impuestos del Contrato.' + chr(13) +
                          'El porcentaje de impuesto del contrato se reprorrateará.', mtWarning, [mbYes], 0) = mrYes then
            begin
               Objeto.Configura_Impuestos(Objeto.Contrato.FieldByName('ID_CONTRATO').AsInteger, 'V');

               frmImpCtte    := TImpCtte.Create(self);
               with frmImpCtte do
                  try
                     GetParams(Objeto);
                     iContrato  := Objeto.Contrato;
                     Catalogo;
                  finally
                     Free;
                  end
            end;
         end;
      end
      else
         // Se asigna cero a Contratantes y se Prorratea Constancias
         Objeto.Configura_Impuestos(Objeto.Contrato.FieldByName('ID_CONTRATO').AsInteger, 'V');

      // CZR 06-Abril-2009   Conservar los documentos del Contratante, aunque halla cambiado el IdPersona en este.
      if vIdPersonaAnt <> Objeto.Id_Persona.AsInteger then
      begin
         RunSQL(' UPDATE DOC_CONTRATANTE '
              + ' SET ID_PERSONA      = '   + Objeto.Id_Persona.AsSql
              + '   , CVE_USUAR_MODIF = ''' + Objeto.DameUsuario + ''''
              + '   , FH_MODIFICACION = TRUNC(SYSDATE) '
              + ' WHERE ID_PERSONA  = ' + IntToStr(vIdPersonaAnt)
              + '   AND ID_CONTRATO = ' + Objeto.Id_Contrato.AsSql,
                Objeto.DataBaseName, Objeto.SessionName, True);

         RunSQL(' UPDATE DOC_ADIC_PERSONA '
              + ' SET ID_PERSONA    = ' + Objeto.Id_Persona.AsSql
              + ' WHERE ID_CONTRATO = ' + Objeto.Id_Contrato.AsSql
              + '   AND ID_PERSONA  = ' + IntToStr(vIdPersonaAnt),
                Objeto.DataBaseName, Objeto.SessionName, True);

         RunSQL(' UPDATE DOM_CTE_CTO '
              + ' SET ID_PERSONA    = ' + Objeto.Id_Persona.AsSql
              + ' WHERE ID_CONTRATO = ' + Objeto.Id_Contrato.AsSql
              + '   AND ID_PERSONA  = ' + IntToStr(vIdPersonaAnt),
                Objeto.DataBaseName, Objeto.SessionName, True);
      end;
   end;
end;

procedure TWCtte.InterForma1DespuesEliminar(Sender: TObject);
begin
   // CZR 08-JUNIO-2009     Igualar Constancias a Contratantes
   if Objeto.Id_Persona.AsInteger = 0 then
      Objeto.Configura_Impuestos(Objeto.Contrato.FieldByName('ID_CONTRATO').AsInteger, 'F');

   edModifica.Text := 'E';
   Objeto.RefrescaQContratante;
end;

procedure TWCtte.InterForma1Salir(Sender: TObject);
begin
{	If not Objeto.Req_Titular Then
   begin
   	Raise EInterFrame.Create('El Titular del contrato requiere una escritura pública por ser Persona moral');
   end
   else
      InterForma1.Cierra;}
end;

procedure TWCtte.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
	If not Objeto.Req_Titular Then
   begin
		If MessageDlg('El Titular del contrato requiere una escritura pública por ser Persona Moral, ¿Desea salir?',
      		mtWarning,[mbYes, mbNo], 0) = mrNo then
      	CanClose  := False;
   end;
end;

procedure TWCtte.CatalogoDomicilioClick(Sender: TObject);
begin
	Objeto.Domicilio.Catalogo;
end;

procedure TWCtte.sbIdDomicilioClick(Sender: TObject);
begin	Objeto.Domicilio.Busca;
end;

procedure TWCtte.MenuItem1Click(Sender: TObject);
begin Objeto.Concepto.Catalogo;
end;

procedure TWCtte.sbCveConcepCtteClick(Sender: TObject);
begin	Objeto.Concepto.Busca;
end;

procedure TWCtte.InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean; var Realizado: Boolean);
var
   q             : TQuery;
   Sit_Titular   : String;
   // CZR 11-sep-2013
   vCodRespuesta : Integer;
   vMsjRespuesta : String;
begin
	Realizado := True;

   If IsNewData Then
   begin
   	Realizado   := False;
      Sit_Titular := '';

      if (Objeto.Cve_Contratante.AsString = 'C001')
         and (GetSqlStr(
           ' Select Sit_Contratante'+
           ' From Contratante'+
           ' Where Id_contrato = ' + Objeto.Contrato.FieldByName('ID_CONTRATO').AsSQL +
           '   and Cve_Contratante = ''C001''',
           Objeto.DataBaseName,Objeto.SessionName,'SIT_CONTRATANTE',Sit_Titular,False))
         {and (Sit_Titular = 'AC')} Then
            messagedlg('Ya existe un titular activo para el contrato',mtError,[mbOK],0)
      else
      begin
         q:= GetSQLQuery(
               ' Select Contratante.cve_contratante, Tipo_contratante.Desc_Contratante'+
               ' From Contratante, Tipo_Contratante'+
               ' Where Id_Contrato = ' + Objeto.contrato.FieldByName('ID_CONTRATO').asString +
               '   and Id_Persona = ' + Objeto.Id_Persona.AsSQL +
               '   and Sit_Contratante = ''AC''' +
               '   and Contratante.Cve_Contratante = Tipo_contratante.Cve_Contratante'+
               '',Objeto.DataBaseName, Objeto.SessionName,False);

         Try
            If q <> nil then
            begin
               {while not q.EOF do
               begin
                  If TipoCtte = '' Then TipoCtte := '''' + q.FieldByName('CVE_CONTRATANTE').asString + ''''
                  else TipoCtte := TipoCtte + ', ''' + q.FieldByName('CVE_CONTRATANTE').asString + '''';
                  q.next;
               end;}

               If q.RecordCount < 2 Then
               begin
                  if ((Objeto.Cve_Contratante.AsString =  'C021') and (q.FieldByName('CVE_CONTRATANTE').asString <> 'C021')) or
                     ((Objeto.Cve_Contratante.AsString <> 'C021') and (q.FieldByName('CVE_CONTRATANTE').asString =  'C021')) Then
                     Realizado := True
                  else
                     messagedlg('El Contratante no puede darse de alta dos veces',mtError,[mbOK],0);
               end
               else messagedlg('El Contratante no puede darse de alta mas de dos veces',mtError,[mbOK],0);
            end
            else Realizado := True;
         finally
            if q<>nil Then q.Free;
         end;
      end;
      // CZR 11-sep-2013   Valida Puesto en Contratantes
      if Realizado then
      begin
         PuestoValidoCtte(Objeto, Objeto.Contrato.FieldByName('ID_CONTRATO').AsInteger, Objeto.Persona.ID_Persona.AsInteger,
                          Objeto.Ctte.Cve_Contratante.AsString, vCodRespuesta, vMsjRespuesta);
         if vCodRespuesta in [1,2,3] then
         begin
            InterForma1.ShowError := False;
            messageDlg(vMsjRespuesta, mtInformation, [mbOk], 0);
         end;
         if vCodRespuesta in [2,3] then
            Realizado := False;
      end;
   end;

   // CZR 13-ene-2015   Cambio de ultimo momento, autorizado por Juan Carlos Sanches y Victor Hugo Garcia(PLD).
   //                   Se valida que el Tipo de Contratante Titular, Cotitular y Representante o Apoderado Legal, tenga configurado
   //                   Numero de Identificacion Fiscal Extranjero.
   // Nota: Falta parametrizar el tipo de contratante que realiza esta validacion
   { // Ya no se requiere realizar esta validación a partir de que se validan las identificaciones fiscales
     // para cierto tipos de contratantes
   Objeto.GetFromControl;
   if (trim(Objeto.Cve_Contratante.AsString) = 'C001') or (trim(Objeto.Cve_Contratante.AsString) = 'C003') or (trim(Objeto.Cve_Contratante.AsString) = 'C004') then
   begin
      if GetSQL('select *'
              + '  from persona'
              + ' where id_persona = ' + IntToStr(Objeto.Id_Persona.AsInteger)
              + '   and cve_residencia   not in(' + QuotedStr(cPaisEUA) + ')'
              + '   and cve_nacionalidad not in(' + QuotedStr(cPaisEUA) + ', ' + QuotedStr(cPaisMexico) + ')'
              + '   and no_id_fiscal_ext is null',
                objeto.SeguDataBaseName, objeto.SeguSessionName, False) then
      begin
         Realizado := False;
         MessageDlg('Para guardar el contratante es necesario capturar el Número de Identificación Fiscal Extranjero en la Persona', mtInformation, [mbOK], 0);
      end;
   end;
   }

   If Not Realizado Then self.InterForma1.ShowError := False;
end;

procedure TWCtte.InterForma1AntesEliminar(Sender: TObject; var Realizado: Boolean);
begin
	if (objeto <> nil) Then
   begin
   	While Objeto.IsMoving do application.ProcessMessages;
   end;

   if Objeto.Pct_Contrato.AsFloat > 0 then
   begin
      InterForma1.ShowError := False;
      Realizado := False;
      MessageDlg('Para poder eliminar este Contratante, debe quitarle el impuesto asignado en el Contrato', mtError, [mbYes], 0);
   end
   else
      Realizado := True;
      
{
   // CZR 29-MAYO-2009     Validar que no borre el Contratante si cuenta con impuesto asignado
   try
      Qry := GetSqlQuery(' SELECT PCT_CONTRATO '
                       + ' FROM CONTRATANTE '
                       + '  WHERE ID_CONTRATO     = ' + IntToStr(Objeto.Contrato.FieldByName('ID_CONTRATO').AsInteger)
                       + '    AND ID_PERSONA      = ' + Objeto.Id_Persona.AsSQL
                       + '    AND CVE_CONTRATANTE = ' + Objeto.Cve_Contratante.AsSQL,
                       Objeto.DataBaseName, Objeto.SessionName, False);
      if Qry <> nil then
      begin
         if Qry.FieldByName('PCT_CONTRATO').AsFloat > 0 then
         begin
            InterForma1.ShowError := False;
            MessageDlg('Para poder eliminar este Contratante, debe quitarle el impuesto asignado en el Contrato', mtError, [mbYes], 0);
            Realizado := False;
         end
         else
            Realizado := True;
      end
      else
         Realizado := False;
   finally
      if Qry <> nil then
      begin
         Qry.Close;     Qry.Free;
      end;
   end;
}
end;

procedure TWCtte.InterForma1AntesModificar(Sender: TObject; var Realizado: Boolean);
begin
	if (objeto <> nil) Then
   begin
   	While Objeto.IsMoving do application.ProcessMessages;
   end;

{	If (Objeto <> nil) and (Not Objeto.IsMoving) Then Realizado := True
   else
   begin
   	Interforma1.ShowError:= False;
   	Realizado := False;
   end;}
end;

procedure TWCtte.InterForma1AntesNuevo(Sender: TObject;
  var Realizado: Boolean);
begin
	if (objeto <> nil) Then
   begin
   	While Objeto.IsMoving do application.ProcessMessages;
   end;

{	If (Objeto <> nil) and (Not Objeto.IsMoving) Then Realizado := True
   else
   begin
   	Interforma1.ShowError:= False;
   	Realizado := False;
   end;}
end;

procedure TWCtte.EliminaDomicilioClick(Sender: TObject);
begin
	if Not GetSQL('SELECT CVE_OPER_ACC FROM SECU_OPER_ACC WHERE (CVE_FUNCION=''CLASE_'+UpperCase(Objeto.ClassName)+''') AND (CVE_USUARIO='''+Objeto.DameUsuario+''') and (CVE_OPER_ACC=''DA'')',
   	Objeto.SeguDataBaseName,Objeto.SeguSessionName,True) Then
   Begin
   	MessageDlg('No tiene acceso a eliminar domicilios adicionales [SECU_OPER_ACC]. '+ #13 + 'Consulte a su administrador', mtError, [mbOK], 0);
      Exit;
   end;

	Try
   	If (Objeto.Active) and (Objeto.Domicilio.Active) and (Objeto.Modo in[moAppend, moEdit]) Then
      Begin
         RunSQL(
            ' DELETE Dom_Cte_Cto '+
            ' WHERE id_contrato = '+ Objeto.Id_contrato.asString +
            '   and id_persona = '+ Objeto.Id_Persona.AsString,
         Objeto.DataBaseName, Objeto.SessionName, True);
         Objeto.Domicilio.Active:= False;
		end;
   Except
   end;
end;

procedure TWCtte.PopupDomicilioPopup(Sender: TObject);
begin
   PopupDomicilio.Items.Items[1].Enabled :=
		(GetSQL('SELECT CVE_OPER_ACC FROM SECU_OPER_ACC WHERE (CVE_FUNCION=''CLASE_'+UpperCase(Objeto.ClassName)+''') AND (CVE_USUARIO='''+Objeto.DameUsuario+''') and (CVE_OPER_ACC=''DA'')',
   	Objeto.SeguDataBaseName,Objeto.SeguSessionName,True)) and
   	(Objeto.Active) and
      (Objeto.Domicilio.Active)
      and (Objeto.Modo in[moAppend, moEdit]);
end;

// CZR 29-MAYO-2009
procedure TWCtte.bImpuestosClick(Sender: TObject);
var
   ImpCtte : TImpCtte;
begin
   if Objeto.Active then
      with ImpCtte do
         try
            ImpCtte    := TImpCtte.Create(self);
            GetParams(Objeto);
            iContrato  := Objeto.Contrato;
            Catalogo;
         finally
            Free;
         end
   else
      raise EInterFrame.Create('No existe un Contratante Activo');
end;

end.
