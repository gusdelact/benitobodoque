unit IntCtoHeader;
//-------------------------------------------------------------
// Sistema         :   InterHeader de Contrato
// Date            :   Julio de 1997
// Fecha de Inicio :   Julio de 1997
// Función forma   :   Control de Frame
// Desarrollo por  :   Víctor Martínez Castro
// Comentarios     :   Forma Estandar
// Modificacion    :   15 Julio 1997. 1:05 pm inicio
// ------------------------------------------------------------


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Mask, DBCtrls, StdCtrls, ExtCtrls, InterApl, UnSQL2,
  IntFind, IntFrm, InterEdit; // IntCtto IntLinkIt

type
  TInterWinCtrlCto= class;
  TWHeadCto = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label8: TLabel;
    Edit1: TEdit;
    DataSource1: TDataSource;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    DataSource2: TDataSource;
    CB1: TComboBox;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Panel3: TPanel;
    Panel4: TPanel;
    Button1: TButton;
    Button3: TButton;
    InterFindit1: TInterFindit;
    Button4: TButton;
    Edit11: TEdit;
    procedure Query1ID_CONTRATOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure Query1DESC_GPO_CONTRATGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  protected
    { Protected declarations }
     procedure Notification( AComponent : TComponent; Operation : TOperation ); override;
  private
    { Private declarations }
  public
    { Public declarations }
    VentanaModal:Boolean;
    Padre:TInterWinCtrlCto;
  end;

  TCtrlCto=class(TInterFrame)
  private
    { Private declarations }
    FCheckContrato:String;
    FEmpresa      :String;
    Controles:TList;
    FContratoFiltrado:Boolean;
    FContratoValido:Boolean;
    FContratoExiste:Boolean;
    FFiltroTipoContrato:String;
    FOnCambioContrato:TNotifyEvent;
  protected
    { Protected declarations }
   procedure Notification( AComponent : TComponent; Operation : TOperation ); override;
   Procedure SetContrato(C:LongInt);
   Procedure SetCheckContrato(C:String);
   Function  GetTipoCto:String;
   //Procedure SetFApli(S:String);
  public
    { Public declarations }
    ID_CONTRATO          : TInterCampo;
    Cve_Moneda           : TInterCampo;
    Cve_Segmento         : TInterCampo;
    Cve_Tip_Contrato     : TInterCampo;
    Id_Pers_Asociad      : TInterCampo;
    Id_Domicilio         : TInterCampo;
    Id_Grupo             : TInterCampo;
    Id_Empresa           : TInterCampo;
    Cve_Producto         : TInterCampo;
    ID_Titular           : TInterCampo;
    Sit_Contrato         : TInterCampo;
    Id_Cto_Liq           : TInterCampo;
    TITNombre            : TInterCampo;
    EMPNOMBRE            : TInterCampo;
    DESC_MONEDA          : TInterCampo;
    TITCVE_PER_JURIDICA  : TInterCampo;
    Desc_Producto        : TInterCampo;
    Des_Tip_Contrato     : TInterCampo;

    DESC_GPO_CONTRAT     : TInterCampo;
    DESC_SEGMENTO        : TInterCampo;
    PROMNOMBRE           : TInterCampo;
    constructor Create( AOwner : TComponent ); override;
    destructor Destroy; override;
    Function   ReQueryContrato(Llave:String):TQuery; virtual;
    Function   ContratoCaptura(eTipoContrato:String):Boolean;
    Property   CheckContrato:String Read FCheckContrato Write SetCheckContrato;
    Property   Empresa:String Read FEmpresa Write FEmpresa;
    Procedure  AddControl(Ctrl:TInterWinCtrlCto);
    Procedure  RemoveControl(Ctrl:TInterWinCtrlCto);
    Procedure  RefreshControl;
    Property   ContratoValido:Boolean Read FContratoValido Write FContratoValido;
    Property   ContratoExiste:Boolean Read FContratoExiste Write FContratoExiste;
    Property   ContratoFiltrado:Boolean Read FContratoFiltrado Write FContratofiltrado;
    Property   TipoCto:String Read GetTipoCto;
    Function   ContratoOK:Boolean;
    Procedure  CambioContrato;
    function   Localiza:Boolean; override;
    Function   InternalBusca:Boolean; override;
    function   EsClienteAAA : boolean;
  published
    Property  FiltroTipoContrato:String Read FFiltroTipoContrato Write FFiltroTipoContrato;
    Property  OnCambioContrato:TNotifyEvent Read FOnCambioContrato Write FOnCambioContrato;
end;

  TInterWinCtrlCto= class(TCustomPanel)
  private
    { Private declarations }
    FInterCtrlCto:TCtrlCto;
    FNomIndicador:String;
  protected
    { Protected declarations }
   procedure Notification( AComponent : TComponent; Operation : TOperation ); override;
   Function GetTipoCto:String;
   //Procedure SetFApli(S:String);
  public
    { Public declarations }
    Win:TWHeadCto;
    AutoDestroy:Boolean;
    Destroying:Boolean;
    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    Procedure   SeTCtrlCto(Ctrl:TCtrlCto);
    Property    NomIndicador:String Read FNomIndicador Write FNomIndicador;
    Procedure   RefreshControl;
    Procedure   FocusEdit;
    Property    TipoCto:String Read GetTipoCto;
    Procedure   SetBounds(X,Y,Ancho,Alto:Integer); override;
    Procedure   SetParent(AParent: TWinControl); override;
  published
    Property    InterCtrlCto:TCtrlCto Read FInterCtrlCto Write SeTCtrlCto;
    Property Align;
end;

Function   DocCompReq(pApli: TInterApli; pEmpresa:Integer; pReq, pPer, pNac, pConCtte, pConCtto: String): String;
Function   ReqProdCtte(pApli: TInterApli; pEmpresa: Integer; pCveContratante, pProducto, pConcepto: String): String;
Function   DocCompReq_Campo(pApli: TInterApli; Campo: String; pEmpresa:Integer; pReq, pPer, pNac, pConCtte, pConCtto, pProd, pCtte: String): String;
Function   IsComplete(pApli: TInterApli; pContrato, pEmpresa: Integer; pProducto, pConcepto: String): Boolean;
Function   IsDoctosComplete(pApli: TInterApli; pContrato, pEmpresa: Integer; pProducto: String): Boolean;
procedure Register;

implementation

uses UnGene;

{$R *.DFM}

procedure Register;
begin //RegisterComponents('Inter', [TCtrlCto]);
      //RegisterComponents('Inter', [TInterWinCtrlCto]);
end;

Function   DocCompReq(pApli: TInterApli; pEmpresa:Integer; pReq, pPer, pNac, pConCtte, pConCtto: String): String;
var q: TQuery;
	 Cont: Integer;
begin
	Result := '';

	if pNac = 'PAMEXI' Then pNac := 'ME'
   else pNac := 'EX';

   Q := GetSqlQuery(
      ' select'+
      '    Doc_Comp_Req.cve_documento'+				{Condiciones de Filtrado de Documentos}
      ' from'+
      '    Doc_Comp_Req,'+
      '    Documento'+
      ' where '+
      '    Doc_Comp_Req.id_empresa = '+ IntToStr(pEmpresa) +
      '    and Doc_Comp_Req.Cve_Requisito = '''+ pReq +''''+
      '    and Doc_Comp_Req.Cve_Documento = Documento.Cve_Documento'+
      '    and Doc_Comp_Req.Cve_Concepto_Ti = ''' + pConCtto + '''' +
      '    and Doc_Comp_Req.Cve_Per_Juridica = ''' + pPer + '''' +
      '    and Doc_Comp_Req.Cve_Tip_Nacional = ''' + pNac + '''' +
      '    and Doc_Comp_Req.Cve_Concepto_Co  = ''' + pConCtte + '''' +
      '    and ( Documento.F_Vigencia >= to_date('''+ FormatDateTime('dd/mm/yyyy',Now) + ''', ''dd/mm/yyyy'')'+
      '     	  or Documento.F_Vigencia is null)',
      pApli.DataBaseName, pApli.SessionName, False);

      If Q = nil then
      begin
         Q := GetSqlQuery(
            ' select'+
            '    Doc_Comp_Req.cve_documento'+		{si no hay documentos para el concepto del titular se buscan para el concepto ''T001''}
            ' from'+
            '    Doc_Comp_Req,'+
            '    Documento'+
            ' where '+
            '    Doc_Comp_Req.id_empresa = '+ IntToStr(pEmpresa) +
            '    and Doc_Comp_Req.Cve_Requisito = '''+ pReq +''''+
            '    and Doc_Comp_Req.Cve_Documento = Documento.Cve_Documento'+
            '    and Doc_Comp_Req.Cve_Concepto_Ti = ''T001''' +
            '    and Doc_Comp_Req.Cve_Per_Juridica = ''' + pPer + '''' +
            '    and Doc_Comp_Req.Cve_Tip_Nacional = ''' + pNac + '''' +
            '    and Doc_Comp_Req.Cve_Concepto_Co  = ''' + pConCtte + '''' +
            '    and ( Documento.F_Vigencia >= to_date('''+ FormatDateTime('dd/mm/yyyy',Now) + ''', ''dd/mm/yyyy'')'+
            '     	  or Documento.F_Vigencia is null)',
            pApli.DataBaseName, pApli.SessionName, False);
      end;

   Try
      If Q <> nil then
      begin                                        {Armado de los documentos posibles}
         Q.First;
         For Cont := 1 to q.RecordCount do
         begin
            If Cont = 1 then Result := '''' + q.FieldByName('CVE_DOCUMENTO').asString + ''''
            else Result := Result + ',''' + q.FieldByName('CVE_DOCUMENTO').asString + '''';
            Q.Next;
         end;
      end;
	Finally
   	if Q<>nil then Q.Free;
	end;
end;



Function   ReqProdCtte(pApli: TInterApli; pEmpresa: Integer; pCveContratante, pProducto, pConcepto: String): String;
var
	Cont: Integer;
	qRequisito  : TQuery;
begin
	Result := '';
   qRequisito := GetSQLQuery(
        '    select cve_requisito'+
        '    from req_prod_ctte'+
        '    where id_empresa = '+ IntToStr(pEmpresa) +
        '       and cve_producto = '''+ pProducto + '''' +
        '       and cve_contratante = '''+ pCveContratante + '''' +
        '       and Cve_concep_ctte = '''+ pConcepto + '''',
         pApli.DataBaseName, pApli.SessionName, False);

   If qRequisito = nil then
      qRequisito := GetSQLQuery(
        '    select cve_requisito'+
        '    from req_prod_ctte'+
        '    where id_empresa = '+ IntToStr(pEmpresa) +
        '       and cve_producto = '''+ pProducto + '''' +
        '       and cve_contratante = '''+ pCveContratante + '''' +
        '       and Cve_concep_ctte = ''T001''',
         pApli.DataBaseName, pApli.SessionName, False);

   Try
      If qRequisito <> nil then
      begin
      	qRequisito.First;
         for Cont := 1 to qRequisito.RecordCount do
         begin
         	If Cont = 1 then Result:= '''' + qRequisito.FieldByName('CVE_REQUISITO').asString + ''''
            else Result:= Result + ', ''' + qRequisito.FieldByName('CVE_REQUISITO').asString + '''';
            qRequisito.Next;
         end;
      End;
   finally
      if qRequisito <> nil then qRequisito.Free; qRequisito:= nil;
   end;
end;


Function DocCompReq_Campo(pApli: TInterApli; Campo: String; pEmpresa:Integer; pReq, pPer, pNac, pConCtte, pConCtto, pProd, pCtte: String): String;
var q: TQuery;
	 NumReq, Cont, indice, NumRequisitos: Integer;
    SQL, Requisitos: String;
    lConcepto,lPerJuridica,lNacionalidad: TStringList;
    UltimoRequisito, FiltroExtra, DatoOK: Boolean;
    ListaReq: TStringList;

begin
	Result := '';
   FiltroExtra := False;

   ListaReq:= TStringList.Create;
	lConcepto:= TStringList.Create;
   lPerJuridica:= TStringList.Create;
   lNacionalidad:= TStringList.Create;


try
   if (pConCtto = 'T017') and (pCtte <> 'C001') Then
   begin
      lconcepto.Add('T017');		lPerJuridica.Add('PF');		lNacionalidad.Add('EX');
      lconcepto.Add('T017');		lPerJuridica.Add('PF');		lNacionalidad.Add('ME');
   end;
   lconcepto.Add('T017');		lPerJuridica.Add('PM');		lNacionalidad.Add('EX');

   lconcepto.Add('T014');		lPerJuridica.Add('PF');		lNacionalidad.Add('ME');
   lconcepto.Add('T013');		lPerJuridica.Add('PF');		lNacionalidad.Add('EX');
   lconcepto.Add('T015');		lPerJuridica.Add('PF');		lNacionalidad.Add('ME');
   lconcepto.Add('T016');		lPerJuridica.Add('PM');		lNacionalidad.Add('ME');
   lconcepto.Add('T016');		lPerJuridica.Add('PF');		lNacionalidad.Add('ME');
   lconcepto.Add('T016');		lPerJuridica.Add('PF');		lNacionalidad.Add('EX');
   lconcepto.Add('T002');		lPerJuridica.Add('PM');		lNacionalidad.Add('ME');
   lconcepto.Add('T002');		lPerJuridica.Add('PF');		lNacionalidad.Add('ME');
   lconcepto.Add('T002');		lPerJuridica.Add('PF');		lNacionalidad.Add('EX');
   lconcepto.Add('T003');		lPerJuridica.Add('PM');		lNacionalidad.Add('ME');
   lconcepto.Add('T003');		lPerJuridica.Add('PF');		lNacionalidad.Add('ME');
   lconcepto.Add('T003');		lPerJuridica.Add('PF');		lNacionalidad.Add('EX');
   lconcepto.Add('T004');		lPerJuridica.Add('PM');		lNacionalidad.Add('ME');
   lconcepto.Add('T004');		lPerJuridica.Add('PF');		lNacionalidad.Add('ME');
   lconcepto.Add('T004');		lPerJuridica.Add('PF');		lNacionalidad.Add('EX');
   lconcepto.Add('T005');		lPerJuridica.Add('PM');		lNacionalidad.Add('ME');
   lconcepto.Add('T005');		lPerJuridica.Add('PF');		lNacionalidad.Add('ME');
   lconcepto.Add('T005');		lPerJuridica.Add('PF');		lNacionalidad.Add('EX');
   lconcepto.Add('T006');		lPerJuridica.Add('PM');		lNacionalidad.Add('ME');
   lconcepto.Add('T006');		lPerJuridica.Add('PF');		lNacionalidad.Add('ME');
   lconcepto.Add('T006');		lPerJuridica.Add('PF');		lNacionalidad.Add('EX');
   lconcepto.Add('T007');		lPerJuridica.Add('PM');		lNacionalidad.Add('ME');
   lconcepto.Add('T007');		lPerJuridica.Add('PF');		lNacionalidad.Add('ME');
   lconcepto.Add('T007');		lPerJuridica.Add('PF');		lNacionalidad.Add('EX');
   lconcepto.Add('T008');		lPerJuridica.Add('PM');		lNacionalidad.Add('ME');
   lconcepto.Add('T008');		lPerJuridica.Add('PF');		lNacionalidad.Add('ME');
   lconcepto.Add('T008');		lPerJuridica.Add('PF');		lNacionalidad.Add('EX');
   lconcepto.Add('T009');		lPerJuridica.Add('PM');		lNacionalidad.Add('ME');
   lconcepto.Add('T009');		lPerJuridica.Add('PF');		lNacionalidad.Add('ME');
   lconcepto.Add('T009');		lPerJuridica.Add('PF');		lNacionalidad.Add('EX');
   lconcepto.Add('T010');		lPerJuridica.Add('PM');		lNacionalidad.Add('ME');
   lconcepto.Add('T010');		lPerJuridica.Add('PF');		lNacionalidad.Add('ME');
   lconcepto.Add('T010');		lPerJuridica.Add('PF');		lNacionalidad.Add('EX');
   lconcepto.Add('T011');		lPerJuridica.Add('PM');		lNacionalidad.Add('ME');
   lconcepto.Add('T011');		lPerJuridica.Add('PF');		lNacionalidad.Add('ME');
   lconcepto.Add('T011');		lPerJuridica.Add('PF');		lNacionalidad.Add('EX');
   lconcepto.Add('T012');		lPerJuridica.Add('PM');		lNacionalidad.Add('ME');
   lconcepto.Add('T012');		lPerJuridica.Add('PF');		lNacionalidad.Add('ME');
   lconcepto.Add('T012');		lPerJuridica.Add('PF');		lNacionalidad.Add('EX');
   lconcepto.Add('T019');		lPerJuridica.Add('PM');		lNacionalidad.Add('ME');
   lconcepto.Add('T019');		lPerJuridica.Add('PF');		lNacionalidad.Add('ME');
   lconcepto.Add('T019');		lPerJuridica.Add('PF');		lNacionalidad.Add('EX');
   lconcepto.Add('T020');		lPerJuridica.Add('PM');		lNacionalidad.Add('ME');
   lconcepto.Add('T020');		lPerJuridica.Add('PF');		lNacionalidad.Add('ME');
   lconcepto.Add('T020');		lPerJuridica.Add('PF');		lNacionalidad.Add('EX');

   if (lConcepto.IndexOf(pConCtto) > -1) and ((Campo = 'CVE_PER_JURIDICA') or (Campo = 'CVE_TIP_NACIONAL'))
    Then FiltroExtra:= True;							//Validar el filtro del concepto titular

	if pNac = 'PAMEXI' Then pNac := 'ME'
   else if Trim(pNac) = '' Then pNac:= ''
   else pNac := 'EX';


{   NumRequisitos := 0;
   UltimoRequisito := False;
   if (Trim(pReq) <> '') Then
   begin
         Requisitos := pReq;
         while not UltimoRequisito do
         begin
            Cont := Pos(',',Requisitos);
            If Cont > 0 Then
            begin
               ListaReq.Add(Copy(Requisitos,1,Cont-1));
               Inc(NumRequisitos);
               delete(Requisitos,1,Cont+1);
            end
            else
            begin
               ListaReq.Add(Requisitos);
               Inc(NumRequisitos);
               UltimoRequisito := True;
            end;
         end;
   end
   else
   	NumRequisitos := 1;


   For NumReq:=0 to NumRequisitos -1 do
   begin}

         SQL :=
            '    Doc_Comp_Req.Cve_Documento = Documento.Cve_Documento'+
            '    and ( Documento.F_Vigencia >= to_date('''+ FormatDateTime('dd/mm/yyyy',Now) + ''', ''dd/mm/yyyy'')'+
            '     	  or Documento.F_Vigencia is null)';

         if pEmpresa 	   <> 0  Then AddSQL(SQL, ' Doc_Comp_Req.id_empresa = '+ IntToStr(pEmpresa));
         if Trim(pReq) 	   <> '' Then AddSQL(SQL, ' Doc_Comp_Req.Cve_Requisito in ('+ pReq +')');
         //if Trim(pReq) 	   <> '' Then AddSQL(SQL, ' Doc_Comp_Req.Cve_Requisito in ('+ ListaReq.Strings[NumReq] +')');
         if Trim(pConCtto) <> '' Then AddSQL(SQL, ' Doc_Comp_Req.Cve_Concepto_Ti = ''' + pConCtto + '''');
         if Trim(pPer) 	   <> '' Then AddSQL(SQL, ' Doc_Comp_Req.Cve_Per_Juridica = ''' + pPer + '''');
         if Trim(pNac) 	   <> '' Then AddSQL(SQL, ' Doc_Comp_Req.Cve_Tip_Nacional = ''' + pNac + '''');
         if Trim(pConCtte) <> '' Then AddSQL(SQL, ' Doc_Comp_Req.Cve_Concepto_Co  = ''' + pConCtte + '''');


         Q := GetSqlQuery(
            ' Select distinct Doc_Comp_Req.' + Campo +
            ' From Doc_Comp_Req, Documento'+
            ' Where ' + SQL,
            pApli.DataBaseName, pApli.SessionName, False);


         If Q = nil then
         begin
               SQL :=
                  '    Doc_Comp_Req.Cve_Documento = Documento.Cve_Documento'+
                  '    and ( Documento.F_Vigencia >= to_date('''+ FormatDateTime('dd/mm/yyyy',Now) + ''', ''dd/mm/yyyy'')'+
                  '     	  or Documento.F_Vigencia is null)';

               if pEmpresa 	   <> 0  Then AddSQL(SQL, ' Doc_Comp_Req.id_empresa = '+ IntToStr(pEmpresa));
               if Trim(pReq) 	   <> '' Then AddSQL(SQL, ' Doc_Comp_Req.Cve_Requisito in ('+ pReq +')');
               //if Trim(pReq) 	   <> '' Then AddSQL(SQL, ' Doc_Comp_Req.Cve_Requisito in ('+ ListaReq.Strings[NumReq] +')');
               if Trim(pConCtto) <> '' Then AddSQL(SQL, ' Doc_Comp_Req.Cve_Concepto_Ti = ''T001''');
               if Trim(pPer) 	   <> '' Then AddSQL(SQL, ' Doc_Comp_Req.Cve_Per_Juridica = ''' + pPer + '''');
               if Trim(pNac) 	   <> '' Then AddSQL(SQL, ' Doc_Comp_Req.Cve_Tip_Nacional = ''' + pNac + '''');
               if Trim(pConCtte) <> '' Then AddSQL(SQL, ' Doc_Comp_Req.Cve_Concepto_Co  = ''' + pConCtte + '''');

               Q := GetSqlQuery(
                  ' select distinct Doc_Comp_Req.' + Campo +
                  ' from Doc_Comp_Req, Documento'+
                  ' where ' + SQL,
                  pApli.DataBaseName, pApli.SessionName, False);
         end;


         If Q = nil then
         begin
               SQL :=
                  '    Doc_Comp_Req.Cve_Documento = Documento.Cve_Documento'+
                  '    and ( Documento.F_Vigencia >= to_date('''+ FormatDateTime('dd/mm/yyyy',Now) + ''', ''dd/mm/yyyy'')'+
                  '     	  or Documento.F_Vigencia is null)';

               if pEmpresa 	   <> 0  Then AddSQL(SQL, ' Doc_Comp_Req.id_empresa = '+ IntToStr(pEmpresa));
               if Trim(pReq) 	   <> '' Then AddSQL(SQL, ' Doc_Comp_Req.Cve_Requisito in ('+ pReq +')');
               //if Trim(pReq) 	   <> '' Then AddSQL(SQL, ' Doc_Comp_Req.Cve_Requisito in ('+ ListaReq.Strings[NumReq] +')');
               if Trim(pConCtto) <> '' Then AddSQL(SQL, ' Doc_Comp_Req.Cve_Concepto_Ti = ''T001''');
               if Trim(pPer) 	   <> '' Then AddSQL(SQL, ' Doc_Comp_Req.Cve_Per_Juridica = ''' + pPer + '''');
               if Trim(pNac) 	   <> '' Then AddSQL(SQL, ' Doc_Comp_Req.Cve_Tip_Nacional = ''' + pNac + '''');
               if Trim(pConCtte) <> '' Then AddSQL(SQL, ' Doc_Comp_Req.Cve_Concepto_Co  = ''A001''');


               Q := GetSqlQuery(
                  ' select distinct Doc_Comp_Req.' + Campo +
                  ' from Doc_Comp_Req, Documento'+
                  ' where ' + SQL,
                  pApli.DataBaseName, pApli.SessionName, False);
         end;


            Try
               If Q <> nil then
               begin                                        {Armado de los documentos posibles}
                  Q.First;
                  For Cont := 1 to q.RecordCount do
                  begin
                     DatoOK := True;
                     if FiltroExtra Then
                     begin
                        DatoOK := False;

                        indice := 0;
                        While (Not DatoOK) and (indice <= lConcepto.Count-1) do
                        begin
                           if (lConcepto[Indice] = pConCtto) and (Campo = 'CVE_PER_JURIDICA') and (lPerJuridica[indice] = q.FieldByName(CAMPO).asString)
                                 Then	DatoOK := True
                           else if (lConcepto[Indice] = pConCtto) and (Campo = 'CVE_TIP_NACIONAL') and (lNacionalidad[indice] = q.FieldByName(CAMPO).asString)
                                 Then	DatoOK := True;

                           Inc(indice);
                        end;
                     end;

                     if (DatoOK) and (pProd = 'I002') and (pCtte <> 'C001') and (pCtte <> 'C002') and (Campo = 'CVE_PER_JURIDICA') and (q.FieldByName(CAMPO).asString = 'PM') Then
                        DatoOK := False;

                     if DatoOK Then
                     begin
{                     	if Pos(q.FieldByName(CAMPO).asString, Result) = 0 Then
                        begin}
                           If Trim(Result) = ''  then Result := '''' + q.FieldByName(CAMPO).asString + ''''
                           else Result := Result + ',''' + q.FieldByName(CAMPO).asString + '''';
                        {end;}
                     end;

                     Q.Next;
                  end;
               end;
            Finally
               if Q<>nil then Q.Free;
            end;
{   end;}

finally
	ListaReq.Free;
	lConcepto.Free;
   lPerJuridica.Free;
   lNacionalidad.Free;
end;
end;



Function IsComplete(pApli: TInterApli; pContrato, pEmpresa: Integer; pProducto, pConcepto: String): Boolean;
var qContratante: TQuery;
	 qRequisito  : TQuery;
    Resultado   : Boolean;
begin
	Result := False;
   Resultado := True;

	qContratante := GetSQLQuery(
   		' select Id_Contrato, Id_Persona, Cve_Contratante'+
         ' from contratante'+
         ' where id_contrato = '+ IntToStr(pContrato) +
         ' and sit_contratante = ''AC''',
   		pApli.DataBaseName, pApli.SessionName, False);

   Try
      If qContratante <> nil then
      begin
      	qContratante.First;
         While (Not qContratante.EOF) and (Resultado) do
         begin
         	qRequisito := GetSQLQuery(
                 ' select'+
                 '    Requisitos.Cve_Requisito,'+
                 '    doc_contratante.cve_documento'+
                 ' from'+
                 '    doc_contratante,'+
                 '    ('+
                 '    select cve_requisito'+
                 '    from req_prod_ctte'+
                 '    where id_empresa = '+ IntToStr(pEmpresa) +
                 '       and cve_producto = '''+ pProducto + '''' +
                 '       and cve_contratante = '''+ qContratante.FieldByName('CVE_CONTRATANTE').asString + '''' +
                 '       and Cve_concep_ctte = '''+ pConcepto + ''''+
                 '       and Cve_requisito <> ''R016'''+
                 '    ) Requisitos'+
                 ' where doc_contratante.id_contrato (+) = '+ IntToStr(pContrato) +
                 '    and doc_contratante.id_persona (+) = '+ qContratante.FieldByName('ID_PERSONA').asString +
                 '    and doc_contratante.cve_requisito (+) = Requisitos.cve_requisito',
	               pApli.DataBaseName, pApli.SessionName, False);

            If qRequisito = nil then
               qRequisito := GetSQLQuery(
                    ' select'+
                    '    Requisitos.Cve_Requisito,'+
                    '    doc_contratante.cve_documento'+
                    ' from'+
                    '    doc_contratante,'+
                    '    ('+
                    '    select cve_requisito'+
                    '    from req_prod_ctte'+
                    '    where id_empresa = '+ IntToStr(pEmpresa) +
                    '       and cve_producto = '''+ pProducto + '''' +
                    '       and cve_contratante = '''+ qContratante.FieldByName('CVE_CONTRATANTE').asString + '''' +
                    '       and Cve_concep_ctte = ''T001'''+
                    '       and Cve_requisito <> ''R016'''+
                    '    ) Requisitos'+
                    ' where doc_contratante.id_contrato (+) = '+ IntToStr(pContrato) +
                    '    and doc_contratante.id_persona (+) = '+ qContratante.FieldByName('ID_PERSONA').asString +
                    '    and doc_contratante.cve_requisito (+) = Requisitos.cve_requisito',
                     pApli.DataBaseName, pApli.SessionName, False);

            Try
            	If qRequisito <> nil then
               begin
						qRequisito.Filtered := True;
                  qRequisito.Filter := 'CVE_DOCUMENTO = null';
                  if (Not qRequisito.IsEmpty) Then Resultado := False;
               End;
            finally
             	if qRequisito <> nil then qRequisito.Free; qRequisito:= nil;
            end;

            qContratante.Next;
         end;
      end;
   finally
   	If qContratante <> nil then qContratante.Free; qContratante:=nil;
   end;

   If Resultado Then Result := True;
end;


Function IsDoctosComplete(pApli: TInterApli; pContrato, pEmpresa: Integer; pProducto:String): Boolean;
Var NumDoctos: Integer;
Begin
	NumDoctos := -1;
	GetSqlInt(
      ' Select count(*) as NUM from ('+
      '   Select cve_documento from doc_prod_cto where id_empresa = '+ IntToStr(pEmpresa) +
      '    and Cve_Producto = '''+ pProducto + '''' +
      '   MINUS'+
      '   (Select Cve_Documento from doc_contrato where id_contrato = '+ IntToStr(pContrato) + ' UNION Select ''D083'' Cve_Documento from dual))',
//      '   Select Cve_Documento from doc_contrato where id_contrato = '+ IntToStr(pContrato) + ')',
      pApli.DataBaseName,pApli.SessionName,'NUM',NumDoctos,False);

   if NumDoctos > 0 Then Result := False
   else Result := True;
end;










{*****************************************************************************}
{                                                 CONTRATO LIGERO             }
{*****************************************************************************}

constructor TCtrlCto.Create( AOwner : TComponent );
begin Inherited;
      Controles:=Tlist.Create;
      Controles.Clear;
      Empresa:='1';
      FCheckContrato:='';
      ContratoValido:=False;
      ContratoExiste:=False;
      ContratoFiltrado:=False;
      UseQuery:=True;
      Active:=False;
      ID_CONTRATO   :=CreaCampo('ID_CONTRATO',ftFloat,tsNinguno,tsNinguno,True);
//      ID_CONTRATO.TipoReader:=TrContrato;
      Cve_Moneda    :=CreaCampo('CVE_MONEDA',ftInteger,tsNinguno,tsNinguno,True);
      Cve_Segmento    :=CreaCampo('CVE_SEGMENTO',ftString,tsNinguno,tsNinguno,True);
      Cve_Segmento.Size:=4;
      Cve_TiP_Contrato:=CreaCampo('CVE_TIP_CONTRATO',ftString,tsNinguno,tsNinguno,True);
      Cve_TiP_Contrato.Size:=4;
      Id_Pers_Asociad :=CreaCampo('ID_PERS_ASOCIAD',ftFloat,tsNinguno,tsNinguno,True);
      Id_Grupo        :=CreaCampo('ID_GRUPO',ftInteger,tsNinguno,tsNinguno,True);
      Id_Domicilio    :=CreaCampo('ID_DOMICILIO',ftFloat,tsNinguno,tsNinguno,True);
      Id_Empresa      :=CreaCampo('ID_EMPRESA',ftFloat,tsNinguno,tsNinguno,True);
      Cve_Producto    :=CreaCampo('CVE_PRODUCTO',ftString,tsNinguno,tsNinguno,True);
      Id_Cto_Liq      :=CreaCampo('ID_CTO_LIQ',ftFloat,tsNinguno,tsNinguno,True);
      Cve_Producto.Size:=4;
      ID_Titular      :=CreaCampo('ID_TITULAR',ftInteger,tsNinguno,tsNinguno,True);
      Sit_Contrato    :=CreaCampo('SIT_CONTRATO',ftString,tsNinguno,tsNinguno,True);
      TITNombre       :=CreaCampo('TITNOMBRE',ftString,tsNinguno,tsNinguno,True);
      TITCVE_PER_JURIDICA:=CreaCampo('TITCVE_PER_JURIDICA',ftString,tsNinguno,tsNinguno,True);

      DESC_GPO_CONTRAT:=CreaCampo('DESC_GPO_CONTRAT',ftString,tsNinguno,tsNinguno,True);
      DESC_SEGMENTO   :=CreaCampo('DESC_SEGMENTO',ftString,tsNinguno,tsNinguno,True);
      PROMNOMBRE      :=CreaCampo('PROMNOMBRE',ftString,tsNinguno,tsNinguno,True);

      EMPNOMBRE       :=CreaCampo('EMPNOMBRE',ftString,tsNinguno,tsNinguno,True);
      DESC_MONEDA     :=CreaCampo('DESC_MONEDA',ftString,tsNinguno,tsNinguno,True);
      Desc_Producto:=CreaCampo('DESC_PRODUCTO',ftString,tsNinguno,tsNinguno,True);
      Des_Tip_Contrato:=CreaCampo('DESC_TIPO_CONTRA',ftString,tsNinguno,tsNinguno,True);

      With Sit_Contrato do
      begin Size:=2;
            UseCombo:=True;
            ComboLista.Add('Activo');     ComboDatos.Add('AC');
            ComboLista.Add('Inactivo');   ComboDatos.Add('IN');
            ComboLista.Add('Cancelado');  ComboDatos.Add('CA');
      end;
    FKeyFields.ADD('ID_CONTRATO');
end;

Destructor TCtrlCto.Destroy;
begin if FQuery<>nil then FQuery.Free; FQuery:=nil;
      if Controles<>nil then Controles.Free;
      Inherited;
end;

Function TCtrlCto.InternalBusca:Boolean;
Var T:TInterFindit;
    s,sSQL:String;
    Q1:TQuery;
begin InternalBusca := False;
      T:=CreaBuscador('IntCtto.it','S,S');
      S:=T.WhereString;
      if True then //SeguCto then
      begin
      sSQL:='SELECT B_EMPRESA,B_CONTRATO,B_UNID_NEG,B_USR_USR,USUARIO.ID_PERSONA, USUARIO.ID_EMPRESA, EMPLEADO.ID_EMPRESA AS EMPRESA_EMPLEADO,EMPLEADO.ID_ENTIDAD, USUARIO.CVE_TIPO_USUARIO FROM USUARIO,EMPLEADO WHERE (USUARIO.CVE_USUARIO='''+DameUsuario+''') and (Empleado.Id_Persona=Usuario.Id_Persona)';
      Q1:=GetSQLQuery(sSQL,DataBaseName,SessionName,True);
            if Q1=nil then BEGIN Raise EInterFrame.Create('Posiblemente el Usuario y el Empleado tiene Id_Personas Diferentes o no Existe el Usuario');
                                 Exit;
                           END;
            Try
            T.GroupQuery:=True;
            T.HavingString:='(PKG_ACCECONTRATO.TIENEACCESO('+
                            ''''+Apli.Usuario+''''+
                            ',ID_CONTRATO'+
                            ','+DameEmpresa+
                            ',ID_ENTIDAD'+
                            ',ID_EMPRESA'+
                            ',B_RESTRINGIDO'+
                            ',ID_PERS_ASOCIAD'+
                            ',CVE_SEGMENTO'+
                            ',ID_GRUPO'+
                            ','''+Q1.FieldByName('CVE_TIPO_USUARIO').AsString+''''+
                            ','''+Q1.FieldByName('B_EMPRESA').AsString+''''+
                            ','''+Q1.FieldByName('B_CONTRATO').AsString+''''+
                            ','''+Q1.FieldByName('B_UNID_NEG').AsString+''''+
                            ','''+Q1.FieldByName('B_USR_USR').AsString+''''+
                            ','+Q1.FieldByName('ID_PERSONA').AsString+
                            ','+Q1.FieldByName('ID_EMPRESA').AsString+
                            ','+Q1.FieldByName('EMPRESA_EMPLEADO').AsString+
                            ','+Q1.FieldByName('ID_ENTIDAD').AsString+')=1)';
            Finally Q1.Free;
            end;
      end;
      T.WhereString:=S;
      T.CamposResultado:='';
      try if Active then T.Param(0,ID_Contrato.AsString);
          if T.Execute then
          begin InternalBusca:=FindKey([T.DameCampo(0)]);
          end;
      finally T.Free;
      end; {end-try}
      InternalBusca := True;
end;

function TCtrlCto.Localiza:Boolean;
Const VL:Array[0..1] of String=('False','True');
var I:Integer;
    S,SQL:String;
    T:TinterCampo;
    Q:TQuery;
    LLaveNula:Boolean;
begin Try
      Localiza:=False;
      if State=0 then raise EInterFrame.Create('Imposible Iniciar un Proceso de Localización en '+ClassName);
      Try
      Try
      SQL:='';
      LlaveNula:=True;
      for I:=0 to FKeyFields.Count -1 do
      begin S:='';
            T:=FieldByName(FKeyFields.Strings[i]);
            LlaveNula:=(LlaveNula and (Trim(T.AsString)=''));
            Case T.Tipo of
            ftString  :S:=FKeyFields.Strings[i]+'='+#39+T.AsString+#39;
            ftInteger :S:=FKeyFields.Strings[i]+'='+T.AsString;
            ftFloat   :S:=FKeyFields.Strings[i]+'='+T.AsString;
            ftDateTime:S:=FKeyFields.Strings[i]+'='+#39+FormatDateTime('DD/MM/YYYY HH:NN:SS',T.AsDateTime)+#39;
            ftDate    :S:=FKeyFields.Strings[i]+'='+#39+FormatDateTime('DD/MM/YYYY',T.AsDateTime)+#39;
            ftBoolean :S:=FKeyFields.Strings[i]+'='+#39+Vl[Byte(T.AsBoolean)]+#39;
            end;
            if S<>'' then S:='('+S+')';
            AddSQL(SQL,S);
      end;
      AddSQL(SQL,FilterString);
      if LLaveNula
         then begin Active:=False;
                    DrawControl;
                    Application.ProcessMessages;
                    //InternalLocaliza; POSIBLEMENTE SE REQUIERA EJECUTAR.
                    Exit;
              end;
     State:=0;
     Try
     Q:=ReQueryContrato(SQL);
     if (Q<>nil) and (Not Q.IsEmpty)
     then begin if FQuery<>nil then FQuery.Free; FQuery:=nil;
                FQuery:=Q;
                Active:=True;
                Modo := moBrowse;
                Localiza:=InternalLocaliza;
          end
          else BEGIN if Q<>nil then begin Q.Free; END;
                     Active:=False;
               END
     Finally RefreshControl;
             CambioContrato;
     end;
     Except
     // SE COME LOS ERRORES
     end;
     Finally State:=0;
     end;
     Finally LocalizaChange;
     end;
end;


Function   TCtrlCto.ContratoOK:Boolean;
begin ContratoOK:=( (ContratoExiste) and (ContratoValido) );
end;

Procedure  TCtrlCto.RefreshControl;
var i:Integer;
begin for i:=0 to Controles.Count-1 do
      begin TInterWinCtrlCto(Controles.Items[i]).RefreshControl;
      end;
end;

Function TCtrlCto.ContratoCaptura(eTipoContrato:String):Boolean;
Var W:TCtrlCto;
    WC:TInterWinCtrlCto;
    LastFiltro:String;
begin
 W:=TCtrlCto.Create(nil);
 W.DataBaseName:=DataBaseName;
 W.SessionName:=SessionName;
 W.ID_Contrato.AsString:=Id_Contrato.AsString;
 W.FiltroTipoContrato:=eTipoContrato;
 Try
      ContratoCaptura:=False;
      WC:=TInterWinCtrlCto.Create(nil);
      LastFiltro:=FiltroTipoContrato;
      FiltroTipoContrato:=eTipoContrato;
      Try
         WC.InterCtrlCto:=W;
         //WC.AutoDestroy:=True;
         WC.Win.Height:=129;
         WC.Win.BorderStyle:=bsDialog;
         //WC.Win.FormStyle:=fsStayOnTop;
         WC.Win.Panel3.Visible:=True;
         WC.Win.VentanaModal:=True;
         WC.RefreshControl;
         Result:=WC.Win.ShowModal=mrOK;
         if Result then FindKey([W.Id_Contrato.AsString]);
      Finally WC.Free;
              FiltroTipoContrato:=LastFiltro;
      end;
 Finally  W.Free;
 end;
end;

Procedure  TCtrlCto.AddControl(Ctrl:TInterWinCtrlCto);
begin Controles.Add(Ctrl);
end;

Procedure  TCtrlCto.RemoveControl(Ctrl:TInterWinCtrlCto);
var I:Integer;
begin I:=Controles.IndexOf(Ctrl);
      if (I>=0) then Controles.Delete(I);
end;

procedure TCtrlCto.Notification( AComponent : TComponent; Operation : TOperation );
begin inherited;
end;

Function TCtrlCto.GetTipoCto:String;
begin GetTipoCto:='';
      if (FQuery=nil)or(FQuery.BOF and FQuery.EOF) then exit;
      GetTipoCto:=FQuery.FieldByName('CVE_TIP_CONTRATO').AsString;
end;

Procedure  TCtrlCto.CambioContrato;
begin if Assigned(FOnCambioContrato) then FOnCambioContrato(Self);
end;


Procedure TCtrlCto.SetContrato(C:LongInt);
//var i:Integer;
begin FindKey([C]);
      (*
      Id_Contrato.AsString:=C;
      ReQueryContrato;
      {for i:=0 to Controles.Count-1 do
      begin TInterWinCtrlCto(Controles.Items[i]).CambioContrato;
      end;}
      CambioContrato;
      *)
end;

Procedure TCtrlCto.SetCheckContrato(C:String);
var N,Inicio,Falta,Err:Integer;
    L1,L2,L3:String;
    L:LongInt;
begin FContratoValido:=True;
      FCheckContrato:=C;
      N:=Pos('-',C);
      if N>0
         then begin L1:=Copy(C,1,N-1);
                    Falta:=9-Length(L1);
                    L2:='000000000'+Copy(C,N+1,Length(C));
                    Inicio:=(Length(L2)+1)-Falta;
                    Val(L1,L,Err);
                    if Err<>0 then begin FContratoValido:=False; exit; end;
                    Val(L2,L,Err);
                    if Err<>0 then begin FContratoValido:=False; exit; end;
                    L3:=L1+Copy(L2,Inicio,Falta);
                    Empresa:=L1;
                    FindKey([StrToInt(L3)]);
                    if ContratoExiste=False
                       then FCheckContrato:=L3
                       else FCheckContrato:='';
              end
         else begin Val(C,L,Err);
                    if Err<>0 then begin FContratoValido:=False; exit; end;
                    if Length(C)>=9
                    then begin Empresa:=Copy(C,1,1);
                               FindKey([StrToInt(C)]);
                               FCheckContrato:=C;
                               FCheckContrato:='';
                               if ContratoExiste=False
                                  then FCheckContrato:=L3
                                  else FCheckContrato:='';
                         end
                    else begin L1:=Empresa;
                               Falta:=9-Length(L1);
                               L2:='000000000'+C;
                               Inicio:=(Length(L2)+1)-Falta;
                               L3:=L1+Copy(L2,Inicio,Falta);
                               Empresa:=L1;
                               Val(L3,L,Err);
                               if Err<>0 then begin FContratoValido:=False; exit; end;
//                               Contrato:=StrToInt(L3);
                               FindKey([StrToInt(L3)]);
                               if ContratoExiste=False
                                  then FCheckContrato:=L3
                                  else FCheckContrato:='';
                         end;
              end;
end;

function TCtrlCto.EsClienteAAA : boolean;
var
   STP : TStoredProc;
begin
  Result := FALSE;
  STP := TStoredProc.Create(Self);
  try
    with STP do begin
      UnPrepare;
      StoredProcName := 'STPVERIFICACTEAAA';
      DatabaseName   := Apli.DataBaseName;
      SessionName    := Apli.SessionName;
      Params.CreateParam(ftInteger,'PIDENTIFICADOR',ptInput);
      Params.CreateParam(ftString,'PTIPOIDENTIFICADOR',ptInput);
      Params.CreateParam(ftString,'PESCTEAAA', ptOutput);
      Params.ParamByName('PIDENTIFICADOR').AsInteger    := ID_CONTRATO.AsInteger;
      Params.ParamByName('PTIPOIDENTIFICADOR').AsString := 'C';
      Prepare;
      ExecProc;
      if trim(Params.ParamByName('PESCTEAAA').AsString) = 'V' then
         Result := TRUE
      else
         Result := FALSE;
      Close;
    end;//with
  Finally
    STP.Free;
  end;//Finally
end;//function

Function TCtrlCto.ReQueryContrato(Llave:String):TQuery;
Var S:String;
    T:TQuery;
    Q1:TQuery;
    HavingStr,sSQL:String;
begin

ReQueryContrato:=nil;

Try
            HavingStr:='';
            sSQL:='SELECT B_EMPRESA,B_CONTRATO,B_UNID_NEG,B_USR_USR,USUARIO.ID_PERSONA, USUARIO.ID_EMPRESA, EMPLEADO.ID_EMPRESA AS EMPRESA_EMPLEADO,EMPLEADO.ID_ENTIDAD, USUARIO.CVE_TIPO_USUARIO FROM USUARIO,EMPLEADO WHERE (USUARIO.CVE_USUARIO='''+ DameUsuario+''') and (Empleado.Id_Persona=Usuario.Id_Persona)';
            Q1:=GetSQLQuery(sSQL,DataBaseName,SessionName,True);
            if Q1=nil then BEGIN Raise EInterFrame.Create('Posiblemente el Usuario y el Empleado tiene Id_Personas Diferentes o no Existe el Usuario');
                                 Exit;
                           END;
            Try
               HavingStr:='(PKG_ACCECONTRATO.TIENEACCESO('+
                            ''''+DameUsuario+''''+ 
                            ',CONTRATO.ID_CONTRATO'+
                            ','+DameEmpresa+
                            ',CONTRATO.ID_ENTIDAD'+
                            ',CONTRATO.ID_EMPRESA'+
                            ',CONTRATO.B_RESTRINGIDO'+
                            ',CONTRATO.ID_PERS_ASOCIAD'+
                            ',CONTRATO.CVE_SEGMENTO'+
                            ',CONTRATO.ID_GRUPO'+
                            ','''+Q1.FieldByName('CVE_TIPO_USUARIO').AsString+''''+
                            ','''+Q1.FieldByName('B_EMPRESA').AsString+''''+
                            ','''+Q1.FieldByName('B_CONTRATO').AsString+''''+
                            ','''+Q1.FieldByName('B_UNID_NEG').AsString+''''+
                            ','''+Q1.FieldByName('B_USR_USR').AsString+''''+
                            ','+Q1.FieldByName('ID_PERSONA').AsString+
                            ','+Q1.FieldByName('ID_EMPRESA').AsString+
                            ','+Q1.FieldByName('EMPRESA_EMPLEADO').AsString+
                            ','+Q1.FieldByName('ID_ENTIDAD').AsString+')=1)';
            Finally Q1.Free;
            end;


S:='SELECT CONTRATO.ID_CONTRATO,'+
           'CONTRATO.ID_EMPRESA, '+
           'CONTRATO.CVE_SEGMENTO,'+
           'CONTRATO.CVE_MONEDA,'+
           'CONTRATO.ID_PERS_ASOCIAD,'+
           'CONTRATO.ID_ENTIDAD,'+
           'CONTRATO.B_RESTRINGIDO,'+
           'CONTRATO.CVE_PRODUCTO,'+
           'CONTRATO.ID_TITULAR,'+
           'CONTRATO.CVE_TIP_CONTRATO,'+
           'CONTRATO.ID_GRUPO,'+
           'CONTRATO.SIT_CONTRATO,'+
           'CONTRATO.ID_CTO_LIQ,'+
           'CONTRATO.ID_DOMICILIO,'+
           'EMP.NOMBRE AS EMPNOMBRE, '+
           'TIPO_CONTRATO.DESC_TIPO_CONTRA,'+
           'DESC_MONEDA,'+
           'DESC_SEGMENTO,'+
           'PROM.NOMBRE AS PROMNOMBRE,'+
           'SPF_NOMBRE_CTTE(CONTRATO.ID_CONTRATO,CONTRATO.ID_TITULAR) AS TITNOMBRE,'+
           'TIT.CVE_PER_JURIDICA AS TITCVE_PER_JURIDICA,'+
           'PRODUCTO.DESC_PRODUCTO,'+
           'GPO_CONTRATO.DESC_GPO_CONTRAT '+
//         'CONTRATO.COMB_FIRMAS'+
           ' FROM CONTRATO,PERSONA EMP,PERSONA PROM,PERSONA TIT,TIPO_CONTRATO,MONEDA,SEGMENTO,PRODUCTO,GPO_CONTRATO '+
           'WHERE  (CONTRATO.ID_EMPRESA=EMP.ID_PERSONA)';
if Llave<>'' then S:=S+' AND '+Llave+' ';
S:=S+      'AND    (CONTRATO.CVE_TIP_CONTRATO=TIPO_CONTRATO.CVE_TIP_CONTRATO) '+
           'AND    (CONTRATO.CVE_MONEDA=MONEDA.CVE_MONEDA) '+
           'AND    (CONTRATO.CVE_SEGMENTO=SEGMENTO.CVE_SEGMENTO) '+
           'AND    (CONTRATO.ID_PERS_ASOCIAD=PROM.ID_PERSONA) '+
           'AND    (CONTRATO.ID_TITULAR=TIT.ID_PERSONA) '+
           'AND    (CONTRATO.CVE_PRODUCTO=PRODUCTO.CVE_PRODUCTO) '+
           'AND    (CONTRATO.ID_PERS_ASOCIAD=GPO_CONTRATO.ID_PERS_ASOCIAD) '+
           'AND    (CONTRATO.ID_GRUPO=GPO_CONTRATO.ID_GRUPO) '+
           ' GROUP BY '+
           'CONTRATO.ID_CONTRATO,'+
           'CONTRATO.ID_EMPRESA, '+
           'CONTRATO.CVE_SEGMENTO,'+
           'CONTRATO.CVE_MONEDA,'+
           'CONTRATO.ID_PERS_ASOCIAD,'+
           'CONTRATO.ID_ENTIDAD,'+
           'CONTRATO.B_RESTRINGIDO,'+
           'CONTRATO.CVE_PRODUCTO,'+
           'CONTRATO.ID_TITULAR,'+
           'CONTRATO.CVE_TIP_CONTRATO,'+
           'CONTRATO.ID_GRUPO,'+
           'CONTRATO.SIT_CONTRATO,'+
           'CONTRATO.ID_CTO_LIQ,'+
           'CONTRATO.ID_DOMICILIO,'+
           'EMP.NOMBRE, '+
           'TIPO_CONTRATO.DESC_TIPO_CONTRA,'+
           'DESC_MONEDA,'+
           'DESC_SEGMENTO,'+
           'PROM.NOMBRE ,'+
           'TIT.NOMBRE ,'+
           'TIT.CVE_PER_JURIDICA ,'+
           'PRODUCTO.DESC_PRODUCTO,'+
           'GPO_CONTRATO.DESC_GPO_CONTRAT '+
           ' HAVING '+HavingStr;
         ContratoFiltrado:=True;
         Q1:=GetSQLQuery(S,DataBaseName,SessionName,True);
         if Q1=nil then ContratoExiste:=False else ContratoExiste:=True;
         if (Q1<>nil) then
            begin if (Trim(UpperCase(FiltroTipoContrato))<>'') and
                     (Trim(UpperCase(FiltroTipoContrato))<>Trim(Q1.FieldByName('CVE_TIP_CONTRATO').AsString))
                  then begin MessageDlg('El Contrato Seleccionado no Corresponde al Tipo de Contrato Requerido.',
                                        mtError,[mbOK],0);
                             Q1.Free;
                             Q1:=nil;
                             ContratoFiltrado:=False;
                        end;
                   ReQueryContrato:=Q1;
            end;
 Finally
 end;
end;


(************************************************************************)
(*                                                                      *)
(* CLASE DE VENTANA DE CTO                                              *)
(************************************************************************)



Procedure   TInterWinCtrlCto.SetParent(AParent: TWinControl);
begin Inherited;
      if ComponentState<>[csDesigning] then if (Win<>nil) then Win.Show;
end;

constructor TInterWinCtrlCto.Create( AOwner : TComponent );
begin Inherited;
      FInterCtrlCto:=nil;
      Win:=TWHeadCto.Create(nil);
      Win.Left:=0; Win.Top:=0;
      Win.Parent:=Self;
      Win.Padre:=Self;
      AutoDestroy:=False;
      Caption:='Encabezado de Contrato';
      Align:=alTop;
      Height:=78;
      BevelOuter:=BvNone;
      Destroying:=False;
end;


destructor TInterWinCtrlCto.Destroy;
begin if FInterCtrlCto<>nil then FInterCtrlCto.RemoveControl(Self);
      FInterCtrlCto:=nil;
      if Win<>nil then Win.Padre:=nil;
      if Win<>nil then Win.Free; Win:=nil;
      if Not Destroying
      then begin Destroying:=True;
                 inherited;
           end;
end;

Procedure TInterWinCtrlCto.SetBounds(X,Y,Ancho,Alto:Integer);
begin Inherited SetBounds(X,Y,Ancho,78);
end;

Function TInterWinCtrlCto.GetTipoCto:String;
begin GetTipoCto:=FInterCtrlCto.GetTipoCto;
end;


Procedure  TInterWinCtrlCto.FocusEdit;
begin if win=nil then exit;
      Win.Button1.SetFocus;
      Win.Edit1.SetFocus;
end;

Procedure TInterWinCtrlCto.RefreshControl;
Var S:String;
begin if (Win=nil)or(InterCtrlCto.FQuery=nil)
      then begin
      if Win<>nil then
         begin S:='';
               if Not InterCtrlCto.ContratoExiste
                  then begin if Win.Edit1.Text ='' 
                                then S:=''
                                else S:='<<No Existe el Contrato>>';
                       end
                  else begin if InterCtrlCto.ContratoValido
                             then S:='<<Contrato Invalido>>'
                             else S:='<<No Existe el Contrato>>';
                       end;
               Win.Edit2.Text:=S;
               Win.Edit3.Text:='';
               Win.Edit4.Text:='';
               Win.Edit5.Text:='';
               Win.Edit6.Text:='';
               Win.Edit7.Text:='';
               Win.Edit8.Text:='';
               Win.Edit9.Text:='';
               Win.Edit10.Text:='';
               Win.Edit11.Text:='';
          end;
      end
      else begin
      Win.Edit2.Text:=BonitoStr(InterCtrlCto.FQuery.FieldByName('TITNOMBRE').AsString);
      Win.Edit3.Text:=BonitoStr(InterCtrlCto.FQuery.FieldByName('DESC_PRODUCTO').AsString);
      Win.Edit4.Text:=BonitoStr(InterCtrlCto.FQuery.FieldByName('DESC_TIPO_CONTRA').AsString);
      Win.Edit5.Text:=BonitoStr(InterCtrlCto.FQuery.FieldByName('EMPNOMBRE').AsString);
      Win.Edit6.Text:=BonitoStr(InterCtrlCto.FQuery.FieldByName('PROMNOMBRE').AsString);
      Win.Edit7.Text:=BonitoStr(InterCtrlCto.FQuery.FieldByName('DESC_MONEDA').AsString);
      Win.Edit8.Text:=BonitoStr(InterCtrlCto.FQuery.FieldByName('DESC_SEGMENTO').AsString);
      Win.Edit9.Text:=BonitoStr(InterCtrlCto.FQuery.FieldByName('DESC_GPO_CONTRAT').AsString);
      Win.Edit10.Text:=BonitoStr(InterCtrlCto.FQuery.FieldByName('ID_CONTRATO').AsString);
      Win.Edit11.Text:=BonitoStr(InterCtrlCto.SIT_CONTRATO.AsCombo);
      end;
end;


procedure TInterWinCtrlCto.Notification( AComponent : TComponent; Operation : TOperation );
begin Inherited;
      if (Operation=opRemove)and(Acomponent=FInterCtrlCto) then FInterCtrlCto:=nil;
end;


Procedure TInterWinCtrlCto.SeTCtrlCto(Ctrl:TCtrlCto);
begin if Ctrl<>nil then Ctrl.RemoveControl(Self);
      if Ctrl<>nil then Ctrl.AddControl(Self);
      FInterCtrlCto:=Ctrl;
end;


(************************************************************************)
(*                                                                      *)
(* CLASE DE HEADER VISUAL                                               *)
(************************************************************************)


procedure TWHeadCto.Query1ID_CONTRATOGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin Text:=BonitoStr(Sender.AsString);
end;

procedure TWHeadCto.Button1Click(Sender: TObject);
begin if Edit1.Text='' then begin MessageBeep(0); exit; end;
      Padre.InterCtrlCto.CheckContrato:=Edit1.Text;
      Edit1.Text:=Padre.InterCtrlCto.CheckContrato;
      Edit1.SelStart:=0;
      Edit1.SelLength:=Length(Edit1.Text);
      if (Padre.InterCtrlCto.ContratoValido) and (Padre.InterCtrlCto.ContratoExiste) and (Padre.InterCtrlCto.ContratoFiltrado)
      then
         begin if VentanaModal then
               begin ModalResult:=mrOK;
               end;
         end;
end;

procedure TWHeadCto.Query1DESC_GPO_CONTRATGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin Text:=BonitoStr(Sender.AsString);
end;


procedure TWHeadCto.Edit1Enter(Sender: TObject);
begin Button1.Default:=True;
end;

procedure TWHeadCto.Edit1Exit(Sender: TObject);
begin Button1.Default:=False;
end;


procedure TWHeadCto.Button2Click(Sender: TObject);
begin ModalResult:=mrCancel;
      if Not VentanaModal then Close;
end;

procedure TWHeadCto.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action:=caFree;
end;

procedure TWHeadCto.FormDestroy(Sender: TObject);
begin if Padre<>nil then
      begin Padre.Win:=nil;
            if Padre.AutoDestroy then Padre.Free;
      end;
end;

procedure TWHeadCto.FormShow(Sender: TObject);
begin Edit1.SetFocus;
end;


procedure TWHeadCto.Button3Click(Sender: TObject);
var Q1:TQuery;
begin if True then //SeguCto then
      begin Q1:=GetSQLQuery('SELECT B_EMPRESA,B_CONTRATO,B_UNID_NEG,B_USR_USR,USUARIO.ID_PERSONA, USUARIO.ID_EMPRESA, EMPLEADO.ID_EMPRESA AS EMPRESA_EMPLEADO,EMPLEADO.ID_ENTIDAD, USUARIO.CVE_TIPO_USUARIO FROM USUARIO,EMPLEADO WHERE (USUARIO.CVE_USUARIO='''+Padre.InterCtrlCto.DameUsuario+''') and (Empleado.Id_Persona=Usuario.Id_Persona)',
                      Padre.InterCtrlCto.DataBaseName,Padre.InterCtrlCto.SessionName,True);
            if Q1=nil then BEGIN Raise EInterFrame.Create('Posiblemente el Usuario y el Empleado tiene Id_Personas Diferentes o no Existe el Usuario');
                                 Exit;
                           END;
            Try
            InterFindit1.GroupQuery:=True;
            InterFindit1.HavingString:='(PKG_ACCECONTRATO.TIENEACCESO('+
                            ''''+Padre.InterCtrlCto.DameUsuario+''''+
                            ',ID_CONTRATO'+
                            ','+Padre.InterCtrlCto.DameEmpresa+
                            ',ID_ENTIDAD'+
                            ',ID_EMPRESA'+
                            ',B_RESTRINGIDO'+
                            ',ID_PERS_ASOCIAD'+
                            ',CVE_SEGMENTO'+
                            ',ID_GRUPO'+
                            ','''+Q1.FieldByName('CVE_TIPO_USUARIO').AsString+''''+
                            ','''+Q1.FieldByName('B_EMPRESA').AsString+''''+
                            ','''+Q1.FieldByName('B_CONTRATO').AsString+''''+
                            ','''+Q1.FieldByName('B_UNID_NEG').AsString+''''+
                            ','''+Q1.FieldByName('B_USR_USR').AsString+''''+
                            ','+Q1.FieldByName('ID_PERSONA').AsString+
                            ','+Q1.FieldByName('ID_EMPRESA').AsString+
                            ','+Q1.FieldByName('EMPRESA_EMPLEADO').AsString+
                            ','+Q1.FieldByName('ID_ENTIDAD').AsString+')=1)';
            Finally
            Q1.Free;
            end;
      end;


      InterFindit1.DataBaseName:=Padre.InterCtrlCto.DataBaseName;
      InterFindit1.SessionName:=Padre.InterCtrlCto.SessionName;
      if InterFindit1.Execute then
         begin Edit1.Text:=InterFindIt1.DameCampo(0);
               Button1Click(Sender);
         end;
end;



procedure TWHeadCto.FormCreate(Sender: TObject);
begin VentanaModal:=False;
end;

{ Protected declarations }
procedure TWHeadCto.Notification( AComponent : TComponent; Operation : TOperation );
begin if (Operation=opRemove)and(Acomponent=Padre) then Padre:=nil;
      Inherited;
end;

end.
