unit IntDocto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
  IntFind, IntReq, UnSQL2, InterFun, ComCtrls, IntDtPk;

type

  TDocumento=Class;
  TWDocto = class(TForm)
    InterForma1: TInterForma;
    EdCveDocumento: TEdit;
    EdDescDocumento: TEdit;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    edFVigencia: TEdit;
    MacvDatePicker1: MacvDatePicker;
    chbBOpcional: TCheckBox;
    Label3: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Docto: TDocumento;
  end;


  TDocumento= class(TInterFrame)
  private
    FContrato :TInterFrame;
    FRequisito:Trequisito;
    FCve_Per_Juridica: String;
    FCve_Nacionalidad: String;
    FCve_Concepto_Co: String;
  protected
		Procedure SetContrato(Cto:TInterFrame);
      Procedure SetRequisito(Req:TRequisito);
  public
    { Public declarations }
    Cve_documento :TInterCampo;
    Desc_documento:TInterCampo;
    B_Opcional		:TInterCampo;
    F_Vigencia		:TInterCampo;

    Function InternalBusca:Boolean; override;
    constructor Create( AOwner : TComponent ); override;
    destructor Destroy; override;
    Function ShowWindow(FormaTipo:TFormaTipo):Integer; override;
    Function Reporte: Boolean; override;
    Function DocCompruebanRequisito(pReq, pPer, pNac, pCon: String): String;

    property Cve_Per_Juridica: String Read FCve_Per_Juridica write FCve_Per_Juridica;
    property Cve_Nacionalidad: String Read FCve_Nacionalidad write FCve_Nacionalidad;
    property Cve_Concepto_Co: String Read FCve_Concepto_Co write FCve_Concepto_Co;
  published
      Property Contrato :TInterFrame Read FContrato Write SetContrato;
      Property Requisito:Trequisito Read FRequisito Write SetRequisito;
  end;


implementation
{$R *.DFM}

uses RepDocto;

constructor TDocumento.Create( AOwner : TComponent );
begin Inherited Create(AOwner);
    Cve_documento	:= CreaCampo('CVE_DOCUMENTO',ftString,tsNinguno,tsNinguno,True);
    Cve_documento.Size := 4;
    Desc_documento:= CreaCampo('DESC_DOCUMENTO',ftString,tsNinguno,tsNinguno,True);
    B_Opcional		:=CreaCampo('B_OPCIONAL',ftString,tsNinguno,tsNinguno,True);
    B_Opcional.Size := 1;
    F_Vigencia		:=CreaCampo('F_VIGENCIA',ftDate,tsNinguno,tsNinguno,True);

    FActive:=False;
    FKeyFields.Add('CVE_DOCUMENTO');
    TableName:='DOCUMENTO';
    UseQuery:=True;
    HelpFile := 'IntDocto.hlp';
    ShowMenuReporte := True;
    Contrato:=nil;
    Requisito:=nil;
    IsCorp:=True;
end;

destructor TDocumento.Destroy;
begin inherited;
end;

Function TDocumento.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W:TWDocto;
begin W:=TWDocto.Create(Self);
      Try
      W.Docto:=Self;
      W.InterForma1.InterFrame:=Self;
      W.InterForma1.FormaTipo:=FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow:=W.InterForma1.ModalResult;
      Finally W.Free;
      end;
end;


Function TDocumento.DocCompruebanRequisito(pReq, pPer, pNac, pCon: String): String;
var q: TQuery;
	 Cont: Integer;
begin
	Result := '';

   If (contrato <> nil) and (Requisito<>nil) Then
   Begin
      if pNac = 'PAMEXI' Then pNac := 'ME'
   	else pNac := 'EX';

      Q := GetSqlQuery(
         ' select'+
         '    Doc_Comp_Req.cve_documento'+				{Condiciones de Filtrado de Documentos}
         ' from'+
         '    Doc_Comp_Req,'+
         '    Documento'+
         ' where '+
         '    Doc_Comp_Req.id_empresa = '+ Contrato.FieldByName('ID_EMPRESA').asString +
         '    and Doc_Comp_Req.Cve_Requisito = '''+ pReq +''''+
         '    and Doc_Comp_Req.Cve_Documento = Documento.Cve_Documento'+
         '    and Doc_Comp_Req.Cve_Concepto_Ti = ''' + Contrato.FieldByName('CVE_CONCEP_CTO').asString + '''' +
         '    and Doc_Comp_Req.Cve_Per_Juridica = ''' + pPer + '''' +
         '    and Doc_Comp_Req.Cve_Tip_Nacional = ''' + pNac + '''' +
         '    and Doc_Comp_Req.Cve_Concepto_Co  = ''' + pCon + '''' +
         '    and ( Documento.F_Vigencia >= to_date('''+ FormatDateTime('dd/mm/yyyy',Now) + ''', ''dd/mm/yyyy'')'+
         '     	  or Documento.F_Vigencia is null)',
         Contrato.DataBaseName, Contrato.SessionName, False);
      Try

      If Q = nil then
      begin
         Q := GetSqlQuery(
            ' select'+
            '    Doc_Comp_Req.cve_documento'+		{si no hay documentos para el concepto del titular y el cotitular se buscan para el concepto titular y el A001 del cotitular}
            ' from'+
            '    Doc_Comp_Req,'+
            '    Documento'+
            ' where '+
            '    Doc_Comp_Req.id_empresa = '+ Contrato.FieldByName('ID_EMPRESA').asString +
            '    and Doc_Comp_Req.Cve_Requisito = '''+ pReq +''''+
            '    and Doc_Comp_Req.Cve_Documento = Documento.Cve_Documento'+
            '    and Doc_Comp_Req.Cve_Concepto_Ti = ''' + Contrato.FieldByName('CVE_CONCEP_CTO').asString + '''' +
            '    and Doc_Comp_Req.Cve_Per_Juridica = ''' + pPer + '''' +
            '    and Doc_Comp_Req.Cve_Tip_Nacional = ''' + pNac + '''' +
            '    and Doc_Comp_Req.Cve_Concepto_Co  = ''A001''' +
            '    and ( Documento.F_Vigencia >= to_date('''+ FormatDateTime('dd/mm/yyyy',Now) + ''', ''dd/mm/yyyy'')'+
            '     	  or Documento.F_Vigencia is null)',
            Contrato.DataBaseName, Contrato.SessionName, False);
      end;


      If Q = nil then
      begin
         Q := GetSqlQuery(
            ' select'+
            '    Doc_Comp_Req.cve_documento'+		{si no hay documentos para el concepto del titular se buscan para el concepto ''T001''}
            ' from'+
            '    Doc_Comp_Req,'+
            '    Documento'+
            ' where '+
            '    Doc_Comp_Req.id_empresa = '+ Contrato.FieldByName('ID_EMPRESA').asString +
            '    and Doc_Comp_Req.Cve_Requisito = '''+ pReq +''''+
            '    and Doc_Comp_Req.Cve_Documento = Documento.Cve_Documento'+
            '    and Doc_Comp_Req.Cve_Concepto_Ti = ''T001''' +
            '    and Doc_Comp_Req.Cve_Per_Juridica = ''' + pPer + '''' +
            '    and Doc_Comp_Req.Cve_Tip_Nacional = ''' + pNac + '''' +
            '    and Doc_Comp_Req.Cve_Concepto_Co  = ''' + pCon + '''' +
            '    and ( Documento.F_Vigencia >= to_date('''+ FormatDateTime('dd/mm/yyyy',Now) + ''', ''dd/mm/yyyy'')'+
            '     	  or Documento.F_Vigencia is null)',
            Contrato.DataBaseName, Contrato.SessionName, False);
      end;

      If Q = nil then
      begin
         Q := GetSqlQuery(
            ' select'+
            '    Doc_Comp_Req.cve_documento'+		{si no hay documentos para el concepto del titular se buscan para el concepto T001 y A001}
            ' from'+
            '    Doc_Comp_Req,'+
            '    Documento'+
            ' where '+
            '    Doc_Comp_Req.id_empresa = '+ Contrato.FieldByName('ID_EMPRESA').asString +
            '    and Doc_Comp_Req.Cve_Requisito = '''+ pReq +''''+
            '    and Doc_Comp_Req.Cve_Documento = Documento.Cve_Documento'+
            '    and Doc_Comp_Req.Cve_Concepto_Ti = ''T001''' +
            '    and Doc_Comp_Req.Cve_Per_Juridica = ''' + pPer + '''' +
            '    and Doc_Comp_Req.Cve_Tip_Nacional = ''' + pNac + '''' +
            '    and Doc_Comp_Req.Cve_Concepto_Co  = ''A001''' +
            '    and ( Documento.F_Vigencia >= to_date('''+ FormatDateTime('dd/mm/yyyy',Now) + ''', ''dd/mm/yyyy'')'+
            '     	  or Documento.F_Vigencia is null)',
            Contrato.DataBaseName, Contrato.SessionName, False);
      end;


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
     Finally if Q<>nil then Q.Free;
     end;

   end
end;




Function TDocumento.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca:=False;
      T:=CreaBuscador('IntDocto.it','S,S');
      If (contrato <> nil) and (Requisito<>nil) Then
      Begin
			T.WhereString := DocCompruebanRequisito(Requisito.Cve_Requisito.AsString,
                                                 Cve_Per_Juridica,
                                                 Cve_Nacionalidad,
                                                 Cve_Concepto_Co);

         If T.WhereString = '' then T.WhereString := '(cve_documento = '''')'
      	else T.WhereString := '(cve_documento in(' + T.WhereString + '))';

{      	Q := GetSqlQuery(
            ' select'+
            '    Doc_Comp_Req.cve_documento'+				//Condiciones de Filtrado de Documentos
            ' from'+
            '    Doc_Comp_Req,'+
            '    Documento'+
            ' where '+
            '    Doc_Comp_Req.id_empresa = '+ Contrato.FieldByName('ID_EMPRESA').asString +
            '    and Doc_Comp_Req.Cve_Requisito = '''+Requisito.Cve_Requisito.AsString+''''+
            '    and Doc_Comp_Req.Cve_Documento = Documento.Cve_Documento'+
            '    and Doc_Comp_Req.Cve_Concepto_Ti = ''' + Contrato.FieldByName('CVE_CONCEP_CTO').asString + '''' +
            '    and Doc_Comp_Req.Cve_Per_Juridica = ''' + Cve_Per_Juridica + '''' +
            '    and Doc_Comp_Req.Cve_Nacionalidad = ''' + Cve_Nacionalidad + '''' +
            '    and Doc_Comp_Req.Cve_Concepto_Co  = ''' + Cve_Concepto_Co + '''' +
            '    and ( Documento.F_Vigencia >= to_date('''+ FormatDateTime('dd/mm/yyyy',Now) + ''', ''dd/mm/yyyy'')'+
            '     	  or Documento.F_Vigencia is null)',
            Contrato.DataBaseName, Contrato.SessionName, False);

         If Q = nil then
         begin
            Q := GetSqlQuery(
               ' select'+
               '    Doc_Comp_Req.cve_documento'+		//si no hay documentos para el concepto del titular se buscan para el concepto ''T001''
               ' from'+
               '    Doc_Comp_Req,'+
               '    Documento'+
               ' where '+
               '    Doc_Comp_Req.id_empresa = '+ Contrato.FieldByName('ID_EMPRESA').asString +
               '    and Doc_Comp_Req.Cve_Requisito = '''+Requisito.Cve_Requisito.AsString+''''+
               '    and Doc_Comp_Req.Cve_Documento = Documento.Cve_Documento'+
               '    and Doc_Comp_Req.Cve_Concepto_Ti = ''T001''' +
               '    and Doc_Comp_Req.Cve_Per_Juridica = ''' + Cve_Per_Juridica + '''' +
               '    and Doc_Comp_Req.Cve_Nacionalidad = ''' + Cve_Nacionalidad + '''' +
               '    and Doc_Comp_Req.Cve_Concepto_Co  = ''' + Cve_Concepto_Co + '''' +
               '    and ( Documento.F_Vigencia >= to_date('''+ FormatDateTime('dd/mm/yyyy',Now) + ''', ''dd/mm/yyyy'')'+
               '     	  or Documento.F_Vigencia is null)',
               Contrato.DataBaseName, Contrato.SessionName, False);
         end;

			If Q <> nil then
         begin                                        //Armado de los documentos posibles
            Q.First;
            For Cont := 1 to q.RecordCount do
            begin
            	If Cont = 1 then T.WhereString := '''' + q.FieldByName('CVE_DOCUMENTO').asString + ''''
            	else T.WhereString := T.WhereString + ',''' + q.FieldByName('CVE_DOCUMENTO').asString + '''';
               Q.Next;
            end;
         end;
}
      end
      else if (contrato <> nil) then
         Begin
         	T.WhereString := '(cve_documento in('+
               'select cve_documento'+
               ' from Doc_Prod_Cto'+
               ' where id_empresa = '+ Contrato.FieldByName('ID_EMPRESA').asString+
               ' and cve_producto = '''+ Contrato.FieldByName('CVE_PRODUCTO').AsString +'''))';
         end;

      Try  if T.Execute then InternalBusca:=FindKey([T.DameCampo(0)]);
      Finally T.Free;
     end;
end;


Function TDocumento.Reporte: Boolean;
Begin Execute_RepDocto(True,self);
End;

Procedure TDocumento.SetContrato(Cto:TInterFrame);
Begin FContrato := Cto;
End;

Procedure TDocumento.SetRequisito(Req:TRequisito);
Begin FRequisito:= Req;
End;



(***********************************************FORMA DE DOCUMENTO***************)
(*                                                                              *)
(*  FORMA DE DOCUMENTO                                                          *)
(*                                                                              *)
(***********************************************FORMA DE DOCUMENTO***************)

procedure TWDocto.FormShow(Sender: TObject);
begin Docto.Cve_Documento.Control := EdCveDocumento;
      Docto.Desc_Documento.Control:= EdDescDocumento;
    	Docto.B_Opcional.Control	 := chbBOpcional;
    	Docto.F_Vigencia.Control 	 := edFVigencia;
end;

procedure TWDocto.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWDocto.FormDestroy(Sender: TObject);
begin Docto.Cve_Documento.Control := nil;
      Docto.Desc_Documento.Control:= nil;
    	Docto.B_Opcional.Control	 := nil;
    	Docto.F_Vigencia.Control 	 := nil;
end;

procedure TWDocto.InterForma1DespuesNuevo(Sender: TObject);
begin EdCveDocumento.SetFocus;
end;

procedure TWDocto.InterForma1DespuesModificar(Sender: TObject);
begin EdDescDocumento.SetFocus;
end;

procedure TWDocto.BitBtn1Click(Sender: TObject);
begin Docto.Reporte;
end;

end.



