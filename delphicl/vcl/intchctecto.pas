// Sistema         : Clase de Documentos Contratante
// Fecha de Inicio : Noviembre de 1997
// Función forma   : Clase de Documentos Contratante
// Desarrollo por  : Victor Martinez
// Comentarios     :
unit IntChCteCto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor, RepCheCteCto,
  IntFind,UnSQL2, InterFun, ComCtrls, DBCtrls, Menus, Ungene,
  IntCtto, IntCtte, IntDtPk, Grids, DBGrids, IntChCte, IntPzaCo, IntPzaBan, IntChCteCtoSol;

Const WM_DESPUESSHOW=WM_USER+1;

type
  TCheCteCto= Class;
  TwCheCteCto = class(TForm)
    BitBtn1: TBitBtn;
    edIdContrato: TEdit;
    Label8: TLabel;
    Label11: TLabel;
    dbgCheq: TDBGrid;
    dbnCheq: TDBNavigator;
    dbnContratante: TDBNavigator;
    PanelCheqCto: TPanel;
    edCuentaBanco: TEdit;
    PopupChequera: TPopupMenu;
    CatalogoPersona: TMenuItem;
    bbCheq: TBitBtn;
    Label3: TLabel;
    Label5: TLabel;
    edAba: TEdit;
    edFfc: TEdit;
    edIdPersona: TEdit;
    edNombrePersona: TEdit;
    edIdBancoChqra: TEdit;
    edNombreIntermediario: TEdit;
    Label13: TLabel;
    Label15: TLabel;
    dbgContratante: TDBGrid;
    InterForma1: TInterForma;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label10: TLabel;
    edIdPlaza: TEdit;
    Label12: TLabel;
    edNombrePlaza: TEdit;
    edNomPlazaExt: TEdit;
    Label6: TLabel;
    Label9: TLabel;
    edNomPlazaBanco: TEdit;
    edCveSucBanco: TEdit;
    edNomSucBanco: TEdit;
    PopupPlaza: TPopupMenu;
    CatalogoPlaza: TMenuItem;
    Panel1: TPanel;
    lbColonia: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Label7: TLabel;
    Label14: TLabel;
    edNombreBeneficiario: TEdit;
    Label16: TLabel;
    edRFCBeneficiario: TEdit;

    function  Elimina_SolicitudCheqCteCto : Integer; // CZR 18-Abril-2011

    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1Buscar(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    procedure InterForma1AntesNuevo(Sender: TObject; var Realizado: Boolean);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure CatalogoPersonaClick(Sender: TObject);
    procedure bbCheqClick(Sender: TObject);
    procedure CatalogoPlazaClick(Sender: TObject);
    procedure InterForma1CanEdit(Sender: TObject; CanEdit: Boolean);
    procedure CatalogoPlazaBanClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure dbgCheqDblClick(Sender: TObject);
    procedure InterForma1Eliminar(Sender: TObject; var Realizado: Boolean);
  private
  public
    Objeto: TCheCteCto;
    Procedure DespuesShow(Var Msg:TMessage); message WM_DESPUESSHOW;
  end;

  TCheCteCto= class(TInterFrame)
  private
		FContrato :TContrato;
		FPanelCheqCto: TPanel;
  protected
    Procedure SetContrato(Cto:TContrato);
  public
      //easa4011  28/11/2006
      vgSalida      : Boolean;
      //off_easa4011 28/11/2006
      Id_Contrato   : TInterCampo;
      Id_Persona    : TInterCampo;
      Id_Banco_Chqra: TInterCampo;
      Cuenta_Banco  : TInterCampo;
      Cheq 	    : TCheqCte;
      Contratante   : TCtte;
      QCheqCto	    : TQuery;
      dsCtte	    : TDataSource;
      dsCheqCto	    : TDataSource;
    function InternalPost:Boolean; override;
    function InternalBusca : Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor Destroy; override;
    function ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
    function Reporte:Boolean; override;
    procedure dsCtteDataChange(Sender: TObject; Field: TField);
    procedure dsCheqCtoDataChange(Sender: TObject; Field: TField);
    Procedure RefrescaQCheqCto;
    Procedure DataBaseChange; override;
  published
    Property Contrato: TContrato Read FContrato Write SetContrato;
  end;

var
  vgIdContrato : Integer;

implementation

uses RepChCte;

{$R *.DFM}

constructor TCheCteCto.Create( AOwner : TComponent );
begin
   Inherited;
   Id_Contrato		:= CreaCampo('ID_CONTRATO',ftInteger,tsNinguno,tsNinguno,True);
   Id_Persona		:= CreaCampo('ID_PERSONA',ftInteger,tsNinguno,tsNinguno,True);
   Id_Banco_Chqra := CreaCampo('ID_BANCO_CHQRA',ftInteger,tsNinguno,tsNinguno,True);
   Cuenta_Banco	:= CreaCampo('CUENTA_BANCO',ftString,tsNinguno,tsNinguno,True);
   Cuenta_Banco.Size := 20;

   Cheq:= TCheqCte.Create(self);
   Cheq.ShowAll := True;
   Cheq.MasterSource := Self;
   Cheq.FieldByName('ID_PERSONA').MasterField:= 'ID_PERSONA';
   Cheq.FieldByName('ID_BANCO_CHQRA').MasterField:= 'ID_BANCO_CHQRA';
   Cheq.FieldByName('CUENTA_BANCO').MasterField:= 'CUENTA_BANCO';

   Contratante:=TCtte.Create(Self);
   FContrato := Nil;
   FPanelCheqCto:= Nil;

   dsCtte   :=TDataSource.Create(Self);
   dsCheqCto:=TDataSource.Create(Self);
   dsCtte.OnDataChange   := dsCtteDataChange;
   dsCheqCto.OnDataChange:= dsCheqCtoDataChange;

   FActive := False;
   TableName := 'CHEQUERA_CTE_CTO';
   UseQuery := True;
   HelpFile := 'IntChCteCto.hlp';
   ShowMenuReporte:=True;
   IsCorp:=True;
   FKeyFields.Add('ID_CONTRATO');
   FKeyFields.Add('ID_PERSONA');
   FKeyFields.Add('ID_BANCO_CHQRA');
   FKeyFields.Add('CUENTA_BANCO');
   qCheqCto:=nil;
end;

Procedure TCheCteCto.DataBaseChange;
begin
  inherited;
  Contratante.GetParams(Self);
end;

destructor TCheCteCto.Destroy;
begin
  if qCheqCto<>nil then qCheqCto.Free;
     if Contratante<>nil then Contratante.Free;
 	if Cheq<>nil then cheq.Free;
  inherited;
end;

Function TCheCteCto.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W:TwCheCteCto;
begin W:=TwCheCteCto.Create(Self);
      try W.Objeto:= Self;
          W.InterForma1.InterFrame:=Self;
          W.InterForma1.FormaTipo := FormaTipo;
          W.InterForma1.ShowGrid := False;
          W.InterForma1.ShowNavigator := False;
          W.InterForma1.Funcion := FInterFun;
          W.InterForma1.ShowBtnNuevo     := False;  // CZR 18-Abril-2011   Solo se permite el Alta, con solicitud en cheq_cte_cto_sol.
          W.InterForma1.ShowBtnModificar := False;
          W.InterForma1.ShowModal;
          ShowWindow := W.InterForma1.ModalResult;
      finally W.Free;
      end;
end;


function TCheCteCto.InternalPost:Boolean;
begin	inherited InternalPost;
end;

Function TCheCteCto.InternalBusca:Boolean;
Var
  T : TInterFindit;
  S : String;
begin
 InternalBusca := False;
  T:=CreaBuscador('IntCCCto.it','I,I,I,S,S,S');
  T.CamposResultado:='';
  If Contrato <> nil Then begin
    AddSql(S,'Id_Contrato = '+ Contrato.ID_Contrato.asstring);
     AddSql(S,'CHEQUERA_CTE.ID_PERSONA = '+ self.dsCtte.DataSet.fieldbyname('ID_PERSONA').asString);
    T.WhereString := S;
  end;
  try
    if T.Execute then begin
       InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),T.DameCampo(2),T.DameCampo(4)]);
       If(QCheqCto <> nil) then begin
          QCheqCto.locate('Id_Contrato; Id_Persona; Id_Banco_Chqra; Cuenta_Banco',
                                  VarArrayOf([Id_Contrato.AsInteger,
                                              Id_Persona.AsInteger,
                                              Id_Banco_Chqra.AsInteger,
                                              Cuenta_Banco.AsString]),
                                              [loCaseInsensitive]);
            end;
      end;
  finally
    T.Free;
  end; //end-try
end;

function TCheCteCto.Reporte:Boolean;
begin Execute_RepChCteCto(True,Self, Contrato.ID_Contrato.AsInteger);
end;

Procedure TCheCteCto.SetContrato(Cto:TContrato);
begin
  FContrato:=Cto;
  If(Cto<>nil) and (Cto.Producto.Cve_Per_Jur_Prod.AsString = 'PM') Then
     Contratante.FilterBy := fbTCtteTitular
  else
     Contratante.FilterBy := fbTCtteCtteCtto;
   Contratante.Contrato:=Cto;
   If Cto <> nil Then Begin
      dsCtte.DataSet := Contratante.QContratante;
//         Contratante.RefrescaQContratante;            {No necesario}
//         RefrescaQCheqCto;                          {No necesario}
//         RefrescaQDocumento;                          {No necesario}
   end
   else begin
      Active := False;
   end;
end;

procedure TCheCteCto.dsCheqCtoDataChange(Sender: TObject; Field: TField);
begin
  If(Field = nil)and(QCheqCto <> nil)then begin
     FindKey([QCheqCto.FieldByName('Id_Contrato').asString,
              QCheqCto.FieldByName('Id_Persona').asString,
              QCheqCto.FieldByName('Id_Banco_Chqra').asString,
              QCheqCto.FieldByName('Cuenta_Banco').asString]);
   end
   else
      Active := False;
{   If (Field = nil) then
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
   End;}
end;

procedure TCheCteCto.dsCtteDataChange(Sender: TObject; Field: TField);
begin
  If(Field = nil) then Begin
     if Not dsCtte.DataSet.IsEmpty Then Begin
            //Contratante.dsContratanteDataChange(Sender, Field);
        Contratante.QContratante.FieldByName('CONTRATANTE').DisplayWidth := 55;
        Contratante.QContratante.FieldByName('TIPO_CONTRATANTE').DisplayWidth := 35;
        RefrescaQCheqCto;
        Cheq.BuscaWhereString := ' CHEQUERA_CTE.ID_PERSONA = ' + Contratante.Id_Persona.AsString;
        Cheq.Persona.BuscaWhereString := ' PERSONA.ID_PERSONA = ' + Contratante.Id_Persona.AsString;
     end
     else
        Active := False;
  end;
end;

Procedure TCheCteCto.RefrescaQCheqCto;
Begin
  Try
    if qCheqCto<>nil then
       qCheqCto.Free;
    qCheqCto := nil;
    If(Contrato <> nil) then Begin
       qCheqCto:= GetSQLQuery(
            ' SELECT'+
            '	chequera_cte.Tipo_Cuenta,'+
            '	Chequera_Cte_Cto.Id_Contrato,'+
            '	Chequera_Cte_Cto.Cuenta_Banco,'+
            '   Intermediario.Nombre,'+
            '   Chequera_Cte.Nom_suc_Banco,'+
            '   Pza_compensacion.nom_plaza,'+
            '	Chequera_Cte_Cto.Id_persona,'+
            '	Chequera_Cte_Cto.Id_Banco_Chqra'+
            ' FROM'+
            '	Chequera_Cte_Cto,'+
            '	Persona Intermediario,'+
            '   chequera_cte,'+
            '   Pza_Compensacion'+
            ' WHERE'+
            '	Chequera_Cte_Cto.Id_Contrato= '+ Contrato.Id_contrato.asString +
	    '   and Chequera_Cte_Cto.Id_Persona = '+ dsCtte.DataSet.FieldByName('ID_PERSONA').asString +
            '   and Chequera_Cte_Cto.Id_Banco_Chqra = Intermediario.id_persona'+
            '   and Chequera_cte_cto.id_persona = Chequera_cte.id_persona'+
            '   and Chequera_cte_cto.id_banco_chqra = Chequera_cte.id_banco_chqra'+
            '   and Chequera_cte_cto.cuenta_banco = Chequera_cte.Cuenta_banco'+
            '   and chequera_Cte.Id_Plaza = Pza_Compensacion.Id_Plaza (+)',
            DataBaseName, SessionName, False);
      end;

      If qCheqCto<>nil then Begin
         qCheqCto.fieldByName('Tipo_Cuenta').DisplayLabel := 'TIPO';
         qCheqCto.fieldByName('Id_Contrato').DisplayLabel := 'CONTRATO';
         qCheqCto.fieldByName('Cuenta_Banco').DisplayLabel := 'CUENTA';
         qCheqCto.fieldByName('Nombre').DisplayLabel := 'INTERMEDIARIO';
         qCheqCto.fieldByName('nom_plaza').DisplayLabel := 'PLAZA';
         qCheqCto.fieldByName('Id_Contrato').Visible := False;
         qCheqCto.fieldByName('Id_Banco_Chqra').Visible:= False;
         qCheqCto.fieldByName('Id_Persona').Visible:= False;

         If FPanelCheqCto <> nil Then begin
         	FPanelCheqCto.Visible := False;
         	{If qCheqCto.fieldByName('CVE_REQUISITO').asString = 'R016' Then
         		FPanelRequisito.Visible := True
            else
            	FPanelRequisito.Visible := False;}
         end;
      end
      else if FPanelCheqCto <> nil Then
      		FPanelCheqCto.Visible := True;

      dsCheqCto.DataSet := qCheqCto;
      If qCheqCto = nil then
      	dsCheqCtoDataChange(Self, nil);
   Finally
   end;
end;


(***************************************FORMA DE Requisitos de Contratantes******)
(*                                                                              *)
(*  FORMA DE Documentos de contratantes                                         *)
(*                                                                              *)
(***************************************FORMA DE Requisitos de Contratantes******)


Procedure TwCheCteCto.DespuesShow(Var Msg:TMessage);
begin
        Objeto.vgSalida := False;
	If (Objeto.qCheqCto <> nil) {and (Objeto.qCheqCto.FieldByName('CVE_REQUISITO').asString<>'R016')} then
   	Objeto.FPanelCheqCto.Visible := False;
end;

procedure TwCheCteCto.FormShow(Sender: TObject);
begin
	Objeto.Id_Contrato.control 	:= edIdContrato;
   Objeto.ID_PERSONA.Control		:= edIdPersona;
   Objeto.ID_BANCO_CHQRA.Control := edIdBancoChqra;
   Objeto.CUENTA_BANCO.Control   := edCuentaBanco;

   Objeto.Cheq.Persona.Nombre.Control   				:= edNombrePersona;
	Objeto.Cheq.Intermediario.Persona.Nombre.Control:= edNombreIntermediario;
   Objeto.Cheq.Nom_Suc_Banco.Control   				:= edNomSucBanco;
   Objeto.Cheq.ABA.Control									:= edABA;
   Objeto.Cheq.FFC.Control									:= edFFC;
   Objeto.Cheq.Id_Plaza.Control							:= edIdPlaza;
   Objeto.Cheq.Nom_Plaza_Ext.Control					:= edNomPlazaExt;
//   Objeto.Cheq.B_Linea_Bancaria
   Objeto.Cheq.Nom_Plaza_Banco.Control					:= edNomPlazaBanco;
   Objeto.Cheq.Plaza.NOM_PLAZA.Control					:= edNombrePlaza;
   Objeto.Cheq.Cve_Suc_Banco.Control					:= edCveSucBanco;
   Objeto.Cheq.NOM_BENEFI.Control					:= edNombreBeneficiario;
   Objeto.Cheq.RFC_BENEFICIARIO.Control					:= edRFCBeneficiario;

   dbgContratante.datasource:= objeto.dsCtte;     {Asignacion de Data Source}
   dbnContratante.datasource:= objeto.dsCtte;
   dbgCheq.datasource  := objeto.dsCheqCto;
   dbnCheq.datasource  := objeto.dsCheqCto;

   Objeto.FPanelCheqCto:= PanelCheqCto;		{Revision de los paneles}

	PostMessage(Handle,WM_DESPUESSHOW,0,0);

   vgIdContrato := Objeto.Contrato.ID_Contrato.AsInteger;
end;

procedure TwCheCteCto.FormDestroy(Sender: TObject);
begin
	Objeto.Id_Contrato.control 	:= nil;
   Objeto.ID_PERSONA.Control		:= nil;
   Objeto.ID_BANCO_CHQRA.Control := nil;
   Objeto.CUENTA_BANCO.Control   := nil;

   Objeto.Cheq.Persona.Nombre.Control   				:= nil;
	Objeto.Cheq.Intermediario.Persona.Nombre.Control:= nil;
   Objeto.Cheq.Nom_Suc_Banco.Control   				:= nil;
   Objeto.Cheq.ABA.Control									:= nil;
   Objeto.Cheq.FFC.Control									:= nil;
   Objeto.Cheq.Id_Plaza.Control							:= nil;
   Objeto.Cheq.Nom_Plaza_Ext.Control					:= nil;
//   Objeto.Cheq.B_Linea_Bancaria
   Objeto.Cheq.Nom_Plaza_Banco.Control					:= nil;
   Objeto.Cheq.Plaza.NOM_PLAZA.Control					:= nil;
   Objeto.Cheq.Cve_Suc_Banco.Control					:= nil;
   Objeto.Cheq.NOM_BENEFI.Control					:= nil;
   Objeto.Cheq.RFC_BENEFICIARIO.Control					:= nil;

   dbgContratante.datasource:= nil;     {Asignacion de Data Source}
   dbnContratante.datasource:= nil;
   dbgCheq.datasource  := nil;
   dbnCheq.datasource  := nil;

   Objeto.FPanelCheqCto:= nil;		{Revision de los paneles}
end;

procedure TwCheCteCto.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwCheCteCto.InterForma1Buscar(Sender: TObject);
begin
	If (Objeto.Busca) and (Objeto.QCheqCto <> nil) then
   begin
      Objeto.QCheqCto.locate('Id_Contrato; Id_Persona; Id_Banco_Chqra; Cuenta_Banco',
                              VarArrayOf([Objeto.Id_Contrato.AsInteger,
                                          Objeto.Id_Persona.AsInteger,
                                          Objeto.Id_Banco_Chqra.AsInteger,
                                          Objeto.Cuenta_Banco.AsString]),
                              [loCaseInsensitive]);
   end;

{   If Objeto.QDocumento <> nil Then								{LOCATE PARA CAMPOS MULTIPLES}
{   	Objeto.QDocumento.Locate('ID_PERSONA;CVE_DOCUMENTO;CVE_REQUISITO',
		VarArrayOf([Objeto.dsCtte.DataSet.fieldbyname('ID_PERSONA').asString, Objeto.cve_Documento.AsString,objeto.Cve_Requisito.AsString]),
      [loCaseInsensitive]);}
end;

procedure TwCheCteCto.BitBtn1Click(Sender: TObject);
begin
  Execute_RepCheqPer(TRUE,Objeto,Objeto.Id_Persona.AsString);
end;

procedure TwCheCteCto.InterForma1DespuesNuevo(Sender: TObject);
begin
  If Objeto.Contrato <> nil then Begin
     edIdContrato.Text:= Objeto.contrato.id_contrato.asString;
     bbCheqClick(self);
  End;
end;

procedure TwCheCteCto.InterForma1DespuesModificar(Sender: TObject);
begin
  edNombrePersona.SetFocus;
end;

procedure TwCheCteCto.InterForma1DespuesAceptar(Sender: TObject);
var
  Qry        : Tquery;
  vCtv       : Integer;
  vLinBan    : String;
  vSituacion : String;
begin
   // --> CZR 19-MAR-09     Guardar Bitacora al dar de Alta o Modificar una Chequera Cliente-Contrato
   Objeto.RefrescaQCheqCto;
{
   try
      Qry := GetSqlQuery('SELECT (NUM_FOLIO+1) AS CONSECUTIVO FROM FOLIO_CORP WHERE ID_EMPRESA = 2 AND CVE_FOLIO = ''BITCHQ''',
                         Objeto.DataBaseName,Objeto.SessionName,True);
      if Qry <> nil then
         vCtv := Qry.FieldByName('CONSECUTIVO').AsInteger;
   finally
      Qry.Free;
   end;

   if trim(Objeto.Cheq.B_Linea_Bancaria.AsString) = 'V' then
      vLinBan := 'SI'
   else
      vLinBan := 'NO';
   if trim(Objeto.Cheq.Sit_Chequera.AsString) = 'AC' then
      vSituacion := 'Activa'
   else
      vSituacion := 'Inactiva';

   RunSQL(' INSERT INTO CHEQUERA_BIT (' +
          ' ID_PERSONA, ID_BANCO_CHQRA, CUENTA_BANCO, CONSECUTIVO, CVE_USUARIO, FH_REGISTRO, DESC_MODIF, ID_CONTRATO)' +
          ' VALUES (' + InttoStr(Objeto.Cheq.Id_Persona.AsInteger) + ', '
                      + InttoStr(Objeto.Cheq.Id_Banco_Chqra.AsInteger) + ', '
                      + chr(39) + trim(Objeto.Cheq.Cuenta_Banco.AsString) + chr(39) + ', '
                      + InttoStr(vCtv) + ', '
                      + chr(39) + trim(Objeto.Apli.Usuario) + chr(39) + ', '
                      + 'to_date(to_char(sysdate,''dd/mm/yyyy hh:mi:ss AM''),''dd/mm/yyyy hh:mi:ss AM'')' + ', '
                      + 'substr(' + chr(39) + ' LinBancaria[' + trim(vLinBan) + ']'
                                            + ' ClaSucursal[' + trim(Objeto.Cheq.Cve_Suc_Banco.AsString) + ']'
                                            + ' NomSucursal[' + trim(Objeto.Cheq.Nom_Suc_Banco.AsString) + ']'
                                            + ' PlaBanco[' + trim(Objeto.Cheq.Id_Plaza.AsString) + ']'
                                            + ' PlaBanxico[' + InttoStr(Objeto.Cheq.Id_Pza_Banxico.AsInteger) + ']'
                                            + ' Situacion[' + trim(vSituacion) + ']'
                                  + chr(39) + ', 0, 2000)' + ', '
                      + InttoStr(Objeto.Id_Contrato.AsInteger) + ')', Objeto.DataBaseName, Objeto.SessionName, True);
   RunSQL('UPDATE FOLIO_CORP SET NUM_FOLIO = '+ InttoStr(vCtv) + ' WHERE ID_EMPRESA = 2 AND CVE_FOLIO = ''BITCHQ''',
          Objeto.DataBaseName, Objeto.SessionName, True);
}          
   // <-- CZR 19-MAR-09
end;

procedure TwCheCteCto.InterForma1DespuesEliminar(Sender: TObject);
begin
   Objeto.RefrescaQCheqCto;
end;

procedure TwCheCteCto.InterForma1AntesNuevo(Sender: TObject;
var Realizado: Boolean);
begin
  Realizado := False;
{   InterForma1.ShowError := False;
	If Objeto.Req <> nil Then
   Begin
   	If Objeto.Req.Cve_Requisito.AsString = 'R016' Then
      	Raise EInterFrame.Create('El contratante no tiene requisitos que cumplir');
   end;

   If Objeto.dsRequisito.DataSet = nil then
   	Raise EInterFrame.Create('El contratante ya cumplió con todos los requisitos');}

  Realizado := True;
end;

procedure TwCheCteCto.InterForma1DespuesCancelar(Sender: TObject);
begin
  If Objeto.dsCheqCto.DataSet <> nil then begin
     Objeto.Cheq.FindKey([objeto.Id_Persona.AsString,objeto.Id_Banco_Chqra.AsString,objeto.Cuenta_Banco.AsString]);
    {Objeto.Documento.Requisito.FindKey([Objeto.dsRequisito.DataSet.FieldByName('CVE_REQUISITO').asString]);}
  end;
end;

procedure TwCheCteCto.CatalogoPersonaClick(Sender: TObject);
begin
  Objeto.cheq.vgIdPersona := objeto.Contratante.Id_Persona.AsInteger;
  Objeto.cheq.Catalogo;
  If Not(Objeto.Modo in [moAppend, moEdit]) Then
     Objeto.RefrescaQCheqCto;
end;

procedure TwCheCteCto.bbCheqClick(Sender: TObject);
begin
  If(Objeto.Contratante.Active) and (Objeto.Contratante.QContratante <> nil) then begin
     If Objeto.Contratante.QContratante.FieldByName('CVE_PER_JURIDICA').asString = 'PF' Then
        Objeto.Cheq.FilterBy:= fbTCheqCteFisica
     else
     If Objeto.Contratante.QContratante.FieldByName('CVE_PER_JURIDICA').asString = 'PM' Then
        Objeto.Cheq.FilterBy:= fbTCheqCteMoral
     else
        Objeto.Cheq.FilterBy:= fbNinguno;
     Objeto.Cheq.BuscaWhereString := '(CHEQUERA_CTE.SIT_CHEQUERA = ''AC'' AND CHEQUERA_CTE.ID_PERSONA = '+ Objeto.Contratante.QContratante.FieldByName('ID_PERSONA').asString +')';

     //EASA4011 28/11/2006 ADMINISTRACION MEDIOS DE PAGOS
     if Objeto.Contrato.Cve_Tip_Contrato.AsString = 'CDVI' then
        Objeto.Cheq.BuscaWhereString := Objeto.Cheq.BuscaWhereString  +  ' AND CUENTA_BANCO <> ' + SQLSTR( Objeto.Contrato.Id_Contrato.AsString );
     //end if
     //OFF_ESAS_28/11/2006
  end;
  Objeto.Cheq.Busca;
end;

procedure TwCheCteCto.CatalogoPlazaClick(Sender: TObject);
var
  Plaza: TPzaComp;
begin
	Plaza:= TPzaComp.Create(self);
   Try
      Plaza.Apli := Objeto.Apli;
   	Plaza.Catalogo;
   Finally
   	Plaza.Free;
   end;
end;

procedure TwCheCteCto.InterForma1CanEdit(Sender: TObject;
  CanEdit: Boolean);
begin
//	if (Objeto <> nil) and (Objeto.Contratante <> nil) then Objeto.Contratante.Entrada := True;
end;

procedure TwCheCteCto.CatalogoPlazaBanClick(Sender: TObject);
var	PlazaBan: TPzaBanx;
begin
	PlazaBan:= TPzaBanx.Create(self);
   Try
      PlazaBan.Apli := Objeto.Apli;
   	PlazaBan.Catalogo;
   Finally
   	PlazaBan.Free;
   end;
end;

procedure TwCheCteCto.BitBtn2Click(Sender: TObject);
var	PlazaBan: TPzaBanx;
begin
   PlazaBan.Busca;
end;

procedure TwCheCteCto.dbgCheqDblClick(Sender: TObject);
begin
   //EASA4011      15/11/2006
   Objeto.vgSalida := True;
   InterForma1.Salir;
end;

function TwCheCteCto.Elimina_SolicitudCheqCteCto : Integer;
var
   Stp : TStoredProc;
begin
   Stp := TStoredProc.Create(nil);
   try
      with Stp do
      begin
         DatabaseName   := Objeto.DataBaseName;
         SessionName    := Objeto.SessionName;
         StoredProcName := 'PKGCORPORATIVO.ELI_SOLICITUDCHEQCTECTO';
         Params.CreateParam(ftInteger, 'p_Id_Contrato',    ptInput);
         Params.CreateParam(ftInteger, 'p_Id_Persona',     ptInput);
         Params.CreateParam(ftInteger, 'p_Id_Banco_Chqra', ptInput);
         Params.CreateParam(ftString,  'p_Cuenta_Banco',   ptInput);
         Params.CreateParam(ftString,  'p_EliCheCteCto',   ptInput);
         Params.CreateParam(ftInteger, 'p_Resultado',      ptOutput);

         if Objeto.Id_Contrato.AsInteger = 0 then  Objeto.Id_Contrato.AsInteger := vgIdContrato;

         ParamByName('p_Id_Contrato').AsInteger    := Objeto.Id_Contrato.AsInteger;
         ParamByName('p_Id_Persona').AsInteger     := Objeto.Id_Persona.AsInteger;
         ParamByName('p_Id_Banco_Chqra').AsInteger := Objeto.Id_Banco_Chqra.AsInteger;
         ParamByName('p_Cuenta_Banco').AsString    := Objeto.Cuenta_Banco.AsString;
         ParamByName('p_EliCheCteCto').AsString    := 'V';

         ExecProc;
         result := ParamByName('p_Resultado').AsInteger;
      end;
   finally
      Stp.Free;
      Stp := nil;
   end;
end;

procedure TwCheCteCto.InterForma1Eliminar(Sender: TObject; var Realizado: Boolean);
begin
   // CZR 18-Abril-2011   Eliminar solicitud en cheq_cte_cto_sol.
   if MessageDlg('¿ Esta seguro de eliminar la Chequera Cliente Contrato ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      if Elimina_SolicitudCheqCteCto = 0 then
         Realizado := True
      else
         Realizado := False;
   end;
end;
end.



