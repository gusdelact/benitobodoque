// Sistema         : Clase de Empresas
// Fecha de Inicio : Noviembre de 1997
// Función forma   : Clase de Requisito
// Desarrollo por  : Victor Martinez
// Comentarios     :
unit IntDCtto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, RepDCtto,
  IntFind,UnSQL2, InterFun, ComCtrls, DBCtrls, Menus,  IntEsc, IntDtPk,
  Grids, DBGrids, IntCtto, Ungene;

Const WM_DESPUESSHOW=WM_USER+1;

type
  TDocCtto= Class;
  TWDCtto = class(TForm)
    InterForma1    : TInterForma;
    BitBtn1: TBitBtn;
    dbgDocReq: TDBGrid;
    dbgDocumento: TDBGrid;
    edIdContrato: TEdit;
    Label1: TLabel;
    PopupEscritura: TPopupMenu;
    Catalogo: TMenuItem;
    Label4: TLabel;
    Label5: TLabel;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    edNumEscPublica: TEdit;
    sbNumEscPublica: TSpeedButton;
    Label2: TLabel;
    edDescPoblacion: TEdit;
    Label3: TLabel;
    edNombreNotario: TEdit;
    PanelDocumentoReq: TPanel;
    PanelDocumento: TPanel;
    StoredProc1: TStoredProc;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1Buscar(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure catalogoClick(Sender: TObject);
    procedure sbNumEscPublicaClick(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    procedure InterForma1AntesNuevo(Sender: TObject;
      var Realizado: Boolean);
    procedure dbgDocumentoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbgDocReqDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgDocumentoDblClick(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dbgDocReqDblClick(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure FormHide(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Objeto: TDocCtto;
    PosX: Integer;
    PosY: Integer;
    DocMarcado: String;
    Procedure DespuesShow(Var Msg:TMessage); message WM_DESPUESSHOW;
  end;

  TDocCtto= class(TInterFrame)
  private
    FContrato:TContrato;
    FPanelDocumentoReq: TPanel;
    FPanelDocumento: TPanel;
  protected
//  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
  Procedure SetContrato(Cto:TContrato);
  public
    { Public declarations }
    Id_contrato    : TInterCampo;
    Cve_Documento  : TInterCampo;
    Documento_NA   : TInterCampo;
    Num_Esc_Publica: TInterCampo;
    Id_Pers_Notario: TInterCampo;
    Escritura	    : TEscritura;
    QDocReq	    : TQuery;
    QDocumento  : TQuery;
    dsDocReq	 : TDataSource;
    dsDocumento : TDataSource;
    Function 	 InternalEdit:Boolean; override;
    function    InternalBusca: Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor  Destroy; override;
    function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    {Procedure DataBaseChange; override}
    function    Reporte:Boolean; override;
    procedure   dsDocumentoDataChange(Sender: TObject; Field: TField);
    procedure   dsDocReqDataChange(Sender: TObject; Field: TField);
    Procedure 	 RefrescaQDocumento;
    Procedure 	 RefrescaQDocReq;
    procedure   NoAplicaGetText(Sender: TField; var Text: String; DisplayText: Boolean);
  published
    Property    Contrato:TContrato Read FContrato Write SetContrato;
  end;

implementation

{$R *.DFM}

constructor TDocCtto.Create( AOwner : TComponent );
begin
   Inherited;
   Id_contrato:= CreaCampo('ID_CONTRATO',ftInteger,tsNinguno,tsNinguno,True);
   Cve_Documento:= CreaCampo('CVE_DOCUMENTO',ftString,tsNinguno,tsNinguno,True);
   Documento_NA:= CreaCampo('DOCUMENTO_NA',ftString,tsNinguno,tsNinguno,True);
   Num_Esc_Publica:= CreaCampo('NUM_ESC_PUBLICA',ftString,tsNinguno,tsNinguno,True);
   Id_Pers_Notario:= CreaCampo('ID_PERS_NOTARIO',ftInteger,tsNinguno,tsNinguno,True);
   FActive := False;
   FKeyFields.Add('ID_CONTRATO');
   FKeyFields.Add('CVE_DOCUMENTO');
   TableName := 'DOC_CONTRATO';
   UseQuery := True;
   HelpFile := 'IntDCtto.hlp';        
//   ShowMenuReporte:=True;
   Escritura:=TEscritura.Create(Self);
   Escritura.MasterSource:=Self;
   Escritura.FieldByName('NUM_ESC_PUBLICA').MasterField:='NUM_ESC_PUBLICA';
   Escritura.FieldByName('ID_PERS_NOTARIO').MasterField:='ID_PERS_NOTARIO';

   dsDocumento := TDataSource.Create(Self);
   dsDocReq := TDataSource.Create(Self);
   dsDocumento.OnDataChange := dsDocumentoDataChange;
   dsDocReq.OnDataChange := dsDocReqDataChange;

   FPanelDocumentoReq:= nil;
   FPanelDocumento:= nil;
   IsCorp:=True;
end;

destructor TDocCtto.Destroy;
begin if Escritura  <> nil then Escritura.Free;
		If QDocumento <> nil then QDocumento.Free;
      If QDocReq    <> nil then QDocReq.Free;
      if dsDocumento <> nil then dsDocumento.Free;
      if dsDocReq <> nil then dsDocReq.Free;
      inherited;
end;

Procedure TDocCtto.SetContrato(Cto:TContrato);
begin
	FContrato:=Cto;
   RefrescaQDocReq;
   RefrescaQDocumento;
end;

(*
Procedure TDocCtto.DataBaseChange;
begin Escritura.GetParams(Self);
end;
*)

Function TDocCtto.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W:TWDCtto;
begin W:=TWDCtto.Create(Self);
      try W.Objeto:= Self;
          W.InterForma1.InterFrame:=Self;
          W.InterForma1.FormaTipo := FormaTipo;
          W.InterForma1.ShowBtnModificar := false;
          W.InterForma1.ShowBtnAceptar := false;
          W.InterForma1.ShowBtnCancelar := false;
          W.InterForma1.ShowGrid := False;
          W.InterForma1.ShowNavigator := False;
          W.InterForma1.Funcion := FInterFun;
          W.InterForma1.ShowModal;
          ShowWindow := W.InterForma1.ModalResult;
      finally W.Free;
      end;
end;

Function TDocCtto.InternalEdit:Boolean;
var S:String;
begin if GetSQL('SELECT CVE_OPER_ACC FROM SECU_OPER_ACC WHERE (CVE_FUNCION=''CLASE_'+UpperCase(ClassName)+''') AND (CVE_USUARIO='''+DameUsuario+''') and (CVE_OPER_ACC=''MM'')',
               SeguDataBaseName,SeguSessionName,True)
      then begin if (contrato<>nil) and (Trunc(Contrato.FH_Modificacion.AsDateTime)<>Trunc(Apli.SysDateTime))
                 then Raise EInterFrame.Create('Este Documento fue Creado otro Dia. No tiene Derecho para Modificarlo, Solo el Mismo día de Creación. Verifique con su Administrador');
           end;
      Result:=Inherited InternalEdit;
end;


Function TDocCtto.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T:=CreaBuscador('IntDCtto.it','S');
      T.CamposResultado:='';

      If Contrato <> nil then
      	T.WhereString := '(Id_Contrato = '+ Contrato.ID_Contrato.asstring + ')';

      try if T.Execute then
          begin InternalBusca:=FindKey([T.DameCampo(0),T.DameCampo(1)]);
          end;
      finally T.Free;
      end; {end-try}
end;

function TDocCtto.Reporte:Boolean;
begin
	If Contrato <> nil then
   	Execute_RepDCtto(True,Self, Contrato.ID_Contrato.AsInteger)
   else
   	Raise EInterFrame.Create('El contrato no ha sido asignado');
end;

procedure TDocCtto.dsDocReqDataChange(Sender: TObject; Field: TField);
begin
end;

procedure TDocCtto.dsDocumentoDataChange(Sender: TObject; Field: TField);
begin
   If (Field = nil) then					//NO HAY DATOS EXTRAS QUE CALCULAR
   Begin
   	If (Not dsDocumento.DataSet.IsEmpty) then
      Begin
         FindKey([Contrato.Id_Contrato.asString,
               dsDocumento.DataSet.FieldByName('CVE_DOCUMENTO').asString]);
         DrawControl;
      End
      else
			FActive := False;
   End;
end;

procedure TDocCtto.NoAplicaGetText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
{	if (QDocumento <> nil) and (Sender = qDocumento.FieldByName('DOCUMENTO_NA')) then
   begin
   	if QDocumento.fieldByName('DOCUMENTO_NA').asString = 'V' then
      	Text := 'X'
      else Text := '';
   end;}
   Text := '';
end;


Procedure TDocCtto.RefrescaQDocumento;
Begin
	if qDocumento <> nil then QDocumento.DisableControls;
	Try
      QDocumento := nil;

      If (Contrato <> nil) then
      Begin
      	QDocumento:= GetSQLQuery(
              ' SELECT Doc_Contrato.Id_Contrato, ' +
              '        Doc_Contrato.Cve_Documento, ' +
              '        Documento.Desc_Documento, ' +
              '        Doc_Contrato.Documento_NA, ' +
              '        DECODE(Doc_Prod_Cto.B_Bloquea_Cto, ''V'', ''SI'', ''F'', ''NO'', ''NO'') as B_BLOQUEA_CTO, ' +
              '        Doc_Prod_Cto.F_Vigencia ' +
              ' FROM Doc_Contrato, Documento, Doc_Prod_Cto ' +
              ' WHERE Doc_Contrato.Id_Contrato = ' + Contrato.Id_Contrato.AsSQL +
              '  and Doc_Contrato.Cve_Documento = Documento.Cve_Documento ' +
              '  and Doc_Contrato.Cve_Documento = Doc_Prod_Cto.Cve_Documento ' +
              '  and Doc_Prod_Cto.Id_Empresa = ' + Contrato.Id_Empresa.AsSQl +
              '  and Doc_Prod_Cto.Cve_Producto = ' + Contrato.Cve_Producto.AsSql,
               DataBaseName, SessionName, False);

{RAPA 13Ago2004
         	  ' SELECT'+
            '   DOC_CONTRATO.ID_CONTRATO,'+
            '   DOC_CONTRATO.CVE_DOCUMENTO,'+
            '   DOCUMENTO.DESC_DOCUMENTO,'+
            '   DOC_CONTRATO.DOCUMENTO_NA'+
            ' FROM'+
            '   DOC_CONTRATO,'+
            '   DOCUMENTO'+
            ' WHERE'+
            '   DOC_CONTRATO.CVE_DOCUMENTO   = DOCUMENTO.CVE_DOCUMENTO'+
            '   AND DOC_CONTRATO.ID_CONTRATO = '+ Contrato.id_contrato.asstring,
}
		end;

		if QDocumento<> nil then
      begin
         QDocumento.fieldByName('DESC_DOCUMENTO').DisplayLabel := 'Documento';
         QDocumento.fieldByName('DOCUMENTO_NA').DisplayLabel := 'No Aplica';
         QDocumento.fieldByName('B_BLOQUEA_CTO').DisplayLabel := 'Bloqueo';
         QDocumento.fieldByName('F_VIGENCIA').DisplayLabel := 'Vigencia';
         QDocumento.fieldByName('DESC_DOCUMENTO').DisplayWidth := 48;
         QDocumento.fieldByName('DOCUMENTO_NA').DisplayWidth := 8;
         QDocumento.fieldByName('B_BLOQUEA_CTO').DisplayWidth := 7;
         QDocumento.fieldByName('F_VIGENCIA').DisplayWidth := 12;
         QDocumento.fieldByName('DOCUMENTO_NA').Alignment:= taCenter;
         QDocumento.fieldByName('B_BLOQUEA_CTO').Alignment:= taCenter;
         QDocumento.fieldByName('F_VIGENCIA').Alignment:= taCenter;
         QDocumento.fieldByName('ID_CONTRATO').Visible := False;
         QDocumento.fieldByName('CVE_DOCUMENTO').Visible := False;
         QDocumento.fieldByName('DOCUMENTO_NA').OnGetText := NoAplicaGetText;

         If FPanelDocumento <> nil then FPanelDocumento.Visible := False;

         QDocumento.EnableControls;
      end
      else If FPanelDocumento <> nil then
      		FPanelDocumento.Visible := True;
      dsDocumento.DataSet := QDocumento;
   Finally
   end;
end;


Procedure TDocCtto.RefrescaQDocReq;
Begin
	if QDocReq<> nil then QDocReq.DisableControls;
	Try
      QDocReq := nil;

      If (Contrato <> nil) then
      Begin
      	QDocReq:= GetSQLQuery(
          ' SELECT DocCto.Cve_Documento, ' +
          '       Documento.Desc_Documento, ' +
          '       ''V'' as Documento_NA, ' +
          '       DECODE(Doc_Prod_Cto.B_Bloquea_Cto, ''V'', ''SI'', ''F'', ''NO'', ''NO'') as B_BLOQUEA_CTO, ' +
          '       Doc_Prod_Cto.F_Vigencia ' +
          ' FROM Documento, Doc_Prod_Cto, ' +
          '  ( ' +
          '    SELECT Cve_Documento ' +
          '    FROM Doc_Prod_Cto ' +
          '    WHERE Id_Empresa = ' + Contrato.Id_Empresa.AsSQL +
          '      and Cve_Producto = ' + Contrato.Cve_Producto.AsSQL +
          '    MINUS ' +
          '    SELECT Cve_Documento ' +
          '    FROM Doc_Contrato ' +
          '    WHERE Id_Contrato = ' + Contrato.ID_Contrato.AsSQL +
          '  ) DocCto ' +
          ' WHERE Documento.Cve_Documento = DocCto.Cve_Documento ' +
          '  and Doc_Prod_Cto.Cve_Documento = DocCto.Cve_Documento ' +
          '  and Doc_Prod_Cto.Id_Empresa = ' + Contrato.Id_Empresa.AsSql +
          '  and Doc_Prod_Cto.Cve_Producto = ' + Contrato.Cve_Producto.AsSql,
          DataBaseName, SessionName, False);

{RAPA 13Ago2004
            ' SELECT'+
            '   DOCUMENTO.CVE_DOCUMENTO,'+
            '   DOCUMENTO.DESC_DOCUMENTO,'+
            '   ''V'' as DOCUMENTO_NA'+
            ' FROM'+
            '   DOC_PROD_CTO,'+
            '   DOCUMENTO'+
            ' WHERE'+
            '   DOCUMENTO.CVE_DOCUMENTO      = DOC_PROD_CTO.CVE_DOCUMENTO'+
            '   AND DOC_PROD_CTO.ID_EMPRESA  = '+Contrato.Id_Empresa.asString +
            '   AND DOC_PROD_CTO.CVE_PRODUCTO= '''+Contrato.cve_Producto.asString+''''+
            ' MINUS'+
            ' SELECT'+
            '   DOCUMENTO.CVE_DOCUMENTO,'+
            '   DOCUMENTO.DESC_DOCUMENTO,'+
            '   ''V'' as DOCUMENTO_NA'+
            ' FROM'+
            '   CONTRATO,'+
            '   DOC_CONTRATO,'+
            '   DOCUMENTO'+
            ' WHERE'+
            '   DOC_CONTRATO.ID_CONTRATO    = CONTRATO.ID_CONTRATO'+
            '   AND DOCUMENTO.CVE_DOCUMENTO = DOC_CONTRATO.CVE_DOCUMENTO'+
            '   AND CONTRATO.ID_CONTRATO    = '+Contrato.Id_contrato.asString,
               DataBaseName, SessionName, False);
}
		end;

		if QDocReq<> nil then
      begin
         QDocReq.fieldByName('DESC_DOCUMENTO').DisplayLabel := 'Documento';
         QDocReq.fieldByName('DOCUMENTO_NA').DisplayLabel := 'No Aplica';
         QDocReq.fieldByName('B_BLOQUEA_CTO').DisplayLabel := 'Bloqueo';
         QDocReq.fieldByName('F_VIGENCIA').DisplayLabel := 'Vigencia';
         QDocReq.fieldByName('DESC_DOCUMENTO').DisplayWidth := 48;
         QDocReq.fieldByName('DOCUMENTO_NA').DisplayWidth := 8;
         QDocReq.fieldByName('B_BLOQUEA_CTO').DisplayWidth := 7;
         QDocReq.fieldByName('F_VIGENCIA').DisplayWidth := 12;
         QDocReq.fieldByName('DOCUMENTO_NA').Alignment:= taCenter;
         QDocReq.fieldByName('B_BLOQUEA_CTO').Alignment:= taCenter;
         QDocReq.fieldByName('F_VIGENCIA').Alignment:= taCenter;
         QDocReq.fieldByName('CVE_DOCUMENTO').Visible := False;
         QDocReq.fieldByName('DOCUMENTO_NA').OnGetText := NoAplicaGetText;

         If FPanelDocumentoReq <> nil then
      		FPanelDocumentoReq.Visible := False;

         QDocReq.EnableControls;
      end
      else If FPanelDocumento <> nil then
      		FPanelDocumentoReq.Visible := True;


      dsDocReq.DataSet := QDocReq;
   Finally
   end;

end;



(***********************************************FORMA DE Requisito***************)
(*                                                                              *)
(*  FORMA DE Requisito                                                          *)
(*                                                                              *)
(***********************************************FORMA DE Requisito***************)
Procedure TWDCtto.DespuesShow(Var Msg:TMessage);
begin
   If Objeto.QDocumento <> nil then
   	PanelDocumento.Visible := False;

   If Objeto.QDocReq <> nil then
   	PanelDocumentoReq.Visible := False;
end;


procedure TWDCtto.FormShow(Sender: TObject);
begin
   Objeto.Id_contrato.Control    := edIdContrato;
//   Objeto.Cve_Documento.Control  := edCveDocumento;
   Objeto.Num_Esc_Publica.Control:= edNumEscPublica;
//   Objeto.Id_Pers_Notario.Control:= edIdPersNotario;

   Objeto.Escritura.MasterSourceEditControl:=sbNumEscPublica;
   Objeto.Escritura.Num_esc_Publica.Control:=edNumEscPublica;
   Objeto.Escritura.Nombre.Control:=edNombreNotario;
   Objeto.Escritura.Ciudad.Control:=edDescPoblacion;

   dbgDocumento.datasource := Objeto.dsDocumento;
   dbgDocReq.datasource := Objeto.dsDocReq;

   Objeto.FPanelDocumentoReq := PanelDocumentoReq;
   Objeto.FPanelDocumento:= PanelDocumento;

   DocMarcado:= '';
   PostMessage(Handle,WM_DESPUESSHOW,0,0);
end;


procedure TWDCtto.FormDestroy(Sender: TObject);
begin
   Objeto.Id_contrato.Control    := nil;
//   Objeto.Cve_Documento.Control  := nil;
   Objeto.Num_Esc_Publica.Control:= nil;
//   Objeto.Id_Pers_Notario.Control:= nil;

   Objeto.Escritura.MasterSourceEditControl:=nil;
   Objeto.Escritura.Num_esc_Publica.Control:=nil;
   Objeto.Escritura.Nombre.Control:=nil;
   Objeto.Escritura.Ciudad.Control:=nil;

   Objeto.FPanelDocumentoReq := nil;
   Objeto.FPanelDocumento:= nil;
end;

procedure TWDCtto.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWDCtto.InterForma1Buscar(Sender: TObject);
begin
	Objeto.Busca;
   Objeto.QDocumento.Locate('ID_CONTRATO;CVE_DOCUMENTO;',
		VarArrayOf([Objeto.Id_contrato.asString, Objeto.cve_Documento.AsString]),
      [loCaseInsensitive]);
end;

procedure TWDCtto.BitBtn1Click(Sender: TObject);
begin Objeto.Reporte;
end;

procedure TWDCtto.sbNumEscPublicaClick(Sender: TObject);
begin Objeto.Escritura.Busca;
end;

procedure TWDCtto.CatalogoClick(Sender: TObject);
begin	Objeto.Escritura.catalogo;
end;

procedure TWDCtto.InterForma1DespuesNuevo(Sender: TObject);
begin
   If Objeto.Contrato <> nil then
   	edIdContrato.Text := Objeto.contrato.id_contrato.asString;

   Objeto.Cve_Documento.AsString := objeto.dsDocReq.DataSet.FieldByName('CVE_DOCUMENTO').asString;

	self.InterForma1.BtnAceptarClick(self);
end;

procedure TWDCtto.InterForma1DespuesAceptar(Sender: TObject);
begin
	Objeto.RefrescaQDocumento;
	Objeto.RefrescaQDocReq;
end;

procedure TWDCtto.InterForma1DespuesEliminar(Sender: TObject);
begin
	Objeto.RefrescaQDocumento;
	Objeto.RefrescaQDocReq;
end;

procedure TWDCtto.InterForma1AntesNuevo(Sender: TObject;
  var Realizado: Boolean);
begin
	Realizado := False;

	If objeto.dsDocReq.DataSet = nil Then
   	Raise EInterFrame.Create('El contrato ya cumplió con los documentos requiridos');

   Realizado := True;
end;

procedure TWDCtto.dbgDocumentoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var long: Integer;
begin
	if (DataCol = 1) and (Objeto.QDocumento <> nil) Then
   begin
      dbgDocumento.Canvas.Font.Name := 'Wingdings';
      dbgDocumento.Canvas.Font.Size := 10;

   	if  (Objeto.QDocumento.FieldByName('DOCUMENTO_NA').asString = 'V') Then
      Begin
         long := dbgDocumento.Canvas.TextWidth('þ');
         dbgDocumento.Canvas.TextOut(Trunc(((Rect.Right - Rect.Left)/2) - (long/2)) + Rect.Left, Rect.Top + 2, 'þ');
      end
      else
      begin
         long := dbgDocumento.Canvas.TextWidth('¨');
         dbgDocumento.Canvas.TextOut(Trunc(((Rect.Right - Rect.Left)/2) - (long/2)) + Rect.Left, Rect.Top + 2, '¨');
      end;
   end;
//   else dbgDocumento.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TWDCtto.dbgDocReqDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var long: Integer;
begin
	if (DataCol = 1) and (Objeto.QDocReq <> nil) Then
   begin
      dbgDocReq.Canvas.Font.Name := 'Wingdings';
      dbgDocReq.Canvas.Font.Size := 10;

   	if Pos(Objeto.QDocReq.FieldByName('CVE_DOCUMENTO').asString, DocMarcado) > 0 Then
      begin
         long := dbgDocReq.Canvas.TextWidth('þ');
         dbgDocReq.Canvas.TextOut(Trunc(((Rect.Right - Rect.Left)/2) - (long/2)) + Rect.Left, Rect.Top + 2, 'þ');
      end
      else
      Begin
         long := dbgDocReq.Canvas.TextWidth('¨');
         dbgDocReq.Canvas.TextOut(Trunc(((Rect.Right - Rect.Left)/2) - (long/2)) + Rect.Left, Rect.Top + 2, '¨');
      end;
   end;
//   else dbgDocumento.DefaultDrawColumnCell(Rect,DataCol,Column,State);

end;

procedure TWDCtto.dbgDocumentoDblClick(Sender: TObject);
var coord: TGridCoord;
begin
   Objeto.Edit;
   if Objeto.qDocumento.FieldByName('DOCUMENTO_NA').asString = 'V' Then
      Objeto.Documento_NA.AsString := 'F'
   else Objeto.Documento_NA.AsString := 'V';
   Objeto.Post;
   Objeto.RefrescaQDocumento;
end;

procedure TWDCtto.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   PosX:= X;
   PosY:= Y;
end;

procedure TWDCtto.dbgDocReqDblClick(Sender: TObject);
var Posicion: Integer;
	 Longitud: Integer;
begin
	if objeto.QDocReq <> nil then
   begin
   	Posicion := Pos(objeto.QDocReq.FieldByName('CVE_DOCUMENTO').asString, DocMarcado);
      if Posicion > 0 Then
      begin
         Longitud := length(Trim(Objeto.QDocReq.FieldByName('CVE_DOCUMENTO').asString));
         If Posicion > 1 Then
            begin
               Dec(Posicion);
               Inc(Longitud);
            end;
			Delete(DocMarcado, Posicion, Longitud);
         Posicion := pos(',',DocMarcado);
         If Posicion = 1 Then Delete(DocMarcado, 1, 1);
      end
      else
      begin
      	if Trim(DocMarcado) = '' Then DocMarcado := Objeto.QDocReq.FieldByName('CVE_DOCUMENTO').asString
         else DocMarcado := DocMarcado + ',' + Objeto.QDocReq.FieldByName('CVE_DOCUMENTO').asString;
      end;

      dbgDocReq.Repaint;
   end;
end;

procedure TWDCtto.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
	Realizado := False;
	if (IsNewData) and (Objeto.QDocReq <> nil) then
   begin
   	if Pos(objeto.QDocReq.FieldByName('CVE_DOCUMENTO').asString, DocMarcado) > 0 Then
      	Objeto.Documento_NA.AsString := 'V'
      else
      	Objeto.Documento_NA.AsString := 'F';
   end;
   Realizado := True;
end;

procedure TWDCtto.FormHide(Sender: TObject);
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
   End;
end;


end.




