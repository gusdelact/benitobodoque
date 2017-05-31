// Sistema         : Clase de TMEXPACRED
// Fecha de Inicio : 03/05/2004
// Función forma   : Clase de TMEXPACRED
// Desarrollo por  :
// Diseñado por    :
// Comentarios     :
Unit IntMExpAcreD;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,InterEdit,
Grids, DBGrids, Menus, IntParamCre, IntLinkit,IntCrAcredit,
IntMCteDoc, IntSGCtrl,IntMDoctos;

Type
 TMExpAcreD= class;

  TwMExpAcreD=Class(TForm)
    InterForma1             : TInterForma;
    pmDocumentos: TPopupMenu;
    Nuevo1: TMenuItem;
    Consultar1: TMenuItem;
    Label2: TLabel;
    edACREDITADO: TEdit;
    btACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    ilACREDITADO: TInterLinkit;
    sgcDATA: TSGCtrl;
    btAUTORIZA: TBitBtn;
    btElimina: TBitBtn;
    btModifica: TBitBtn;
    Catlogo1: TMenuItem;
    edCVE_DOCUMENTO: TEdit;
    edNomCveDocumento: TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    rgSituacion: TRadioGroup;
    shp4: TShape;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape5: TShape;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Shape6: TShape;
    Label9: TLabel;
    Shape10: TShape;
    Label11: TLabel;
    Shape11: TShape;
    Label12: TLabel;
    Shape4: TShape;
    Label6: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure InterForma1Buscar(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btAUTORIZAClick(Sender: TObject);
    procedure btEliminaClick(Sender: TObject);
    procedure btModificaClick(Sender: TObject);
    procedure sgcDATADblClick(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure sgcDATAMoveRow(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure rgSituacionClick(Sender: TObject);

    private
    { Private declarations }
       Function  CadenaSql : String;
       Function  VerificaElim : Boolean;
       Procedure MuestraDatos;
    public
    { Public declarations }
    Objeto : TMExpAcreD;

end;
 TMExpAcreD= class(TInterFrame)
      private
      public
        { Public declarations }

        ID_ACREDITADO  : TInterCampo;
        CVE_DOCUMENTO  : TInterCampo;

        ParamCre       : TParamCre;
        Acreditado     : TCrAcredit;
        Doctos         : TMDoctos;

        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;


implementation
{$R *.DFM}

constructor TMExpAcreD.Create( AOwner : TComponent );
begin Inherited;

   ID_ACREDITADO :=CreaCampo('ID_ACREDITADO',ftFloat,tsNinguno,tsNinguno,False);
      ID_ACREDITADO.Caption:='Identificador de Acreditado';
   CVE_DOCUMENTO :=CreaCampo('CVE_DOCUMENTO',ftString,tsNinguno,tsNinguno,False);
      CVE_DOCUMENTO.Caption:='Clave del documento';

   Acreditado := TCrAcredit.Create(Self);
   Acreditado.MasterSource := Self;
   Acreditado.FieldByName('ID_ACREDITADO').MasterField := 'ID_ACREDITADO';

   Doctos:= TMDoctos.Create(Self);
   Doctos.MasterSource := Self;
   Doctos.FieldByName('CVE_DOCUMENTO').MasterField := 'CVE_DOCUMENTO';

end;

Destructor TMExpAcreD.Destroy;
Begin
   If Acreditado <> Nil Then
      Acreditado.Free;
   If Doctos <> Nil Then
      Doctos.Free;
inherited;
End;

function TMExpAcreD.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TwMExpAcreD;
begin
   W:=TwMExpAcreD.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

Function TwMExpAcreD.CadenaSql : String;
var
   vlsql : String;
Begin
   vlSql:='';
   Objeto.ID_ACREDITADO.GetFromControl;
   If Trim(Objeto.ID_ACREDITADO.AsString) <> '' Then Begin
      vlsql := 'SELECT CTE.CVE_DOCUMENTO, '+
                  '       DOC.DESC_DOCUMENTO, '+
                  '       CTE.FOL_DOCUMENTO, '+
                  '       DECODE(CTE.B_ORIGIN_ENTREG,''V'',''Si'',''F'',''No'','''')B_ORIGIN_ENTREG, '+
                  '       DECODE(CTE.B_COPIAS_ENTREG,''V'',''Si'',''F'',''No'','''')B_COPIAS_ENTREG, '+
                  '       CTE.F_EXPIRA, CTE.NUM_EXPEDIENTE, CTE.AREA_RESG_ORI, '+
                  '       DECODE(CTE.SIT_DOCUMENTO,''AC'',''Activo'',''VE'',''Vencido'',''RN'',''Renovado'',''DV'',''Devuelto'','''')SIT_DOCUMENTO, '+
                  '       CTE.ID_DOCUMENTO '+
                  '  FROM DO_CLIENTE_DOC CTE, DO_DOCUMENTO DOC '+
                  ' WHERE CTE.ID_ACREDITADO = '+ Objeto.ID_ACREDITADO.AsSQL +
                  '   AND CTE.CVE_DOCUMENTO = DOC.CVE_DOCUMENTO '+
                  '   AND DOC.ID_EMPRESA = '+ IntToStr(Objeto.Apli.IdEmpresa);

      If rgSituacion.ItemIndex = 2 Then
         vlsql := vlsql + ' AND CTE.SIT_DOCUMENTO = ''RN'''
      Else If rgSituacion.ItemIndex = 3 Then
         vlsql := vlsql + ' AND CTE.SIT_DOCUMENTO = ''VE'''
      Else If rgSituacion.ItemIndex = 4 Then
         vlsql := vlsql + ' AND CTE.SIT_DOCUMENTO = ''DV'''
      Else If rgSituacion.ItemIndex = 1 Then
         vlsql := vlsql + ' AND CTE.SIT_DOCUMENTO = ''AC''';

      vlsql := vlsql + ' ORDER BY  CTE.CVE_DOCUMENTO ,CTE.ID_DOCUMENTO';
   End;
   CadenaSql := vlSql;
end;

Procedure TwMExpAcreD.MuestraDatos;
var
   vlQry : TQuery;
   sSQL :String;
begin
   sSQL:= CadenaSql;
   If Trim(sSQL) <> '' Then Begin
      vlQry := GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
      try
         if vlQry <> nil then Begin
            vlQry.FieldByName('ID_DOCUMENTO').Visible  := False;
            vlQry.FieldByName('CVE_DOCUMENTO').DisplayLabel  := 'CLAVE' + #30 +'>C';
            vlQry.FieldByName('DESC_DOCUMENTO').DisplayLabel := 'DOCUMENTO' + #30 +'>C';
            vlQry.FieldByName('FOL_DOCUMENTO').DisplayLabel  := 'FOLIO' + #30 +'>C';
            vlQry.FieldByName('B_ORIGIN_ENTREG').DisplayLabel:= 'ORIGINAL' + #30 +'>C';
            vlQry.FieldByName('B_COPIAS_ENTREG').DisplayLabel:= 'COPIAS' + #30 +'>C';
            vlQry.FieldByName('F_EXPIRA').DisplayLabel       := 'F_EXPIRA' + #30 +'>C';
            vlQry.FieldByName('NUM_EXPEDIENTE').DisplayLabel := 'EXPEDIENTE' + #30 +'>C';
            vlQry.FieldByName('AREA_RESG_ORI').DisplayLabel  := 'AREA' + #30 +'>C';
            vlQry.FieldByName('SIT_DOCUMENTO').DisplayLabel  := 'SITUACION' + #30 +'>C';

            vlQry.FieldByName('CVE_DOCUMENTO').DisplayWidth  := 8;
            vlQry.FieldByName('DESC_DOCUMENTO').DisplayWidth := 25;
            vlQry.FieldByName('FOL_DOCUMENTO').DisplayWidth  := 12;
            vlQry.FieldByName('B_ORIGIN_ENTREG').DisplayWidth:= 9;
            vlQry.FieldByName('B_COPIAS_ENTREG').DisplayWidth:= 9;
            vlQry.FieldByName('F_EXPIRA').DisplayWidth       := 12;
            vlQry.FieldByName('NUM_EXPEDIENTE').DisplayWidth := 12;
            vlQry.FieldByName('AREA_RESG_ORI').DisplayWidth  := 9;
            vlQry.FieldByName('SIT_DOCUMENTO').DisplayWidth  := 8;

            TNumericField(vlQry.FieldByName('NUM_EXPEDIENTE')).DisplayFormat := '###,###';
            sgcDATA.AddQry( vlQry, True,True,-1,-1,-1,False);

            Objeto.CVE_DOCUMENTO.AsString:=sgcDATA.CellStr['CVE_DOCUMENTO',sgcDATA.SG.Row];
            Objeto.Doctos.FindKey([IntToStr(Objeto.Apli.IdEmpresa),sgcDATA.CellStr['CVE_DOCUMENTO',sgcDATA.SG.Row]]);
         End Else Begin
            sgcDATA.Clear('NO SE ENCONTRARON DATOS'#30'>C');
         end;
      finally
         if vlQry <> nil then
            vlQry.free;
      end;
   End;
end;

procedure TwMExpAcreD.FormShow(Sender: TObject);
begin
   InterForma1.BtnNuevo.Visible := False;
   InterForma1.BtnModificar.Visible := False;
   InterForma1.BtnEliminar.Visible := False;
   InterForma1.BtnAceptar.Visible := False;
   InterForma1.BtnCancelar.Visible := False;
   InterForma1.BtnAyuda.Visible := False;
   InterForma1.BtnBuscar.Visible := False;

   lbDempresa.Caption := Objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := Objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := Objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := Objeto.ParamCre.PERFIL.AsString;

   Objeto.CVE_DOCUMENTO.Control:= edCVE_DOCUMENTO;
   Objeto.Doctos.CVE_DOCUMENTO.Control:= edCVE_DOCUMENTO;
   Objeto.Doctos.DESC_DOCUMENTO.Control:=edNomCveDocumento;
   Objeto.Doctos.GetParams(Objeto);
   edCVE_DOCUMENTO.Hint := Objeto.Doctos.DESC_DOCUMENTO.AsString;
   edCVE_DOCUMENTO.ShowHint := True;

   Objeto.ID_ACREDITADO.Control := edACREDITADO;
   Objeto.Acreditado.ID_ACREDITADO.Control := edACREDITADO;
   Objeto.Acreditado.Persona.Nombre.Control := edNOMBRE_ACRED;
   Objeto.Acreditado.GetParams(Objeto);
   edNOMBRE_ACRED.Hint := Objeto.Acreditado.Persona.Nombre.AsString;
   edNOMBRE_ACRED.ShowHint := True;
   edACREDITADO.SetFocus;

   If Objeto.ID_ACREDITADO.AsInteger <>0 Then
      Objeto.Acreditado.FindKey([Objeto.ID_ACREDITADO.AsInteger]);

   MuestraDatos;
   If sgcDATA.SG.Row >=0 Then Begin
      Objeto.CVE_DOCUMENTO.AsString:=sgcDATA.CellStr['CVE_DOCUMENTO',sgcDATA.SG.Row];
      Objeto.Doctos.FindKey([IntToStr(Objeto.Apli.IdEmpresa),sgcDATA.CellStr['CVE_DOCUMENTO',sgcDATA.SG.Row]]);
   End;
end;

procedure TwMExpAcreD.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TwMExpAcreD.InterForma1Buscar(Sender : TObject);
begin
  Self.Objeto.Busca;
end;

procedure TwMExpAcreD.btACREDITADOClick(Sender: TObject);
begin
   Objeto.Acreditado.ShowAll := True;
   If Objeto.Acreditado.Busca Then Begin
      MuestraDatos;
      If sgcDATA.SG.Row >=0 Then Begin
         Objeto.CVE_DOCUMENTO.AsString:=sgcDATA.CellStr['CVE_DOCUMENTO',sgcDATA.SG.Row];
         Objeto.Doctos.FindKey([IntToStr(Objeto.Apli.IdEmpresa),sgcDATA.CellStr['CVE_DOCUMENTO',sgcDATA.SG.Row]]);
      End;
      InterForma1.NextTab(edACREDITADO);
   End;
end;

procedure TwMExpAcreD.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMExpAcreD.ilACREDITADOEjecuta(Sender: TObject);
begin
    If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
        MuestraDatos;
        If sgcDATA.SG.Row >=0 Then Begin
           Objeto.CVE_DOCUMENTO.AsString:=sgcDATA.CellStr['CVE_DOCUMENTO',sgcDATA.SG.Row];
           Objeto.Doctos.FindKey([IntToStr(Objeto.Apli.IdEmpresa),sgcDATA.CellStr['CVE_DOCUMENTO',sgcDATA.SG.Row]]);
        End;
        InterForma1.NextTab(edACREDITADO);
    End;
end;

procedure TwMExpAcreD.FormDestroy(Sender: TObject);
begin
   Objeto.ID_ACREDITADO.Control             := Nil;
   Objeto.CVE_DOCUMENTO.Control             := Nil;
   Objeto.Doctos.CVE_DOCUMENTO.Control      := Nil;
   Objeto.Doctos.DESC_DOCUMENTO.Control     := Nil;
   Objeto.Acreditado.ID_ACREDITADO.Control  := Nil;
   Objeto.Acreditado.Persona.Nombre.Control := Nil;
end;

procedure TwMExpAcreD.btAUTORIZAClick(Sender: TObject);
Var
   MCteDoc: TMCteDoc;
begin
   Objeto.ID_ACREDITADO.GetFromControl;
   If Objeto.ID_ACREDITADO.AsInteger <> 0 Then Begin
      MCteDoc:=TMCteDoc.create(Nil);
      Try
         MCteDoc.Apli:= Objeto.Apli;
         MCteDoc.ParamCre:= Objeto.ParamCre;
         MCteDoc.Acreditado:= Objeto.Acreditado;
         MCteDoc.Nuevo;
      Finally
         MCteDoc.Free;
      End;
      MuestraDatos;
   End;
end;

procedure TwMExpAcreD.btEliminaClick(Sender: TObject);
Var
   MCteDoc: TMCteDoc;
begin
   Objeto.ID_ACREDITADO.GetFromControl;
   If Objeto.ID_ACREDITADO.AsInteger <> 0 Then Begin
      If VerificaElim Then Begin
         MCteDoc:=TMCteDoc.create(Nil);
         Try
            MCteDoc.Apli:= Objeto.Apli;
            MCteDoc.ParamCre:= Objeto.ParamCre;
            MCteDoc.Acreditado:= Objeto.Acreditado;
            MCteDoc.Doctos:= Objeto.Doctos;
            MCteDoc.FindKey([Objeto.ID_ACREDITADO.AsString,
                             sgcDATA.CellStr['ID_DOCUMENTO',sgcDATA.SG.Row],
                             sgcDATA.CellStr['CVE_DOCUMENTO',sgcDATA.SG.Row]]);
            MCteDoc.Elimina;
         Finally
            MCteDoc.Free;
         End;
         MuestraDatos;
      End Else Begin
         ShowMessage('El Documento no puede ser eliminado'#13#10'ya que está dentro de un trámite autorizado');
      End;
   End;
end;

procedure TwMExpAcreD.btModificaClick(Sender: TObject);
Var
   MCteDoc: TMCteDoc;
begin
   Objeto.ID_ACREDITADO.GetFromControl;
   If Objeto.ID_ACREDITADO.AsInteger <> 0 Then Begin
      MCteDoc:=TMCteDoc.create(Nil);
      Try
         MCteDoc.Apli:= Objeto.Apli;
         MCteDoc.ParamCre:= Objeto.ParamCre;
         MCteDoc.Acreditado:= Objeto.Acreditado;
         MCteDoc.Doctos:= Objeto.Doctos;
         MCteDoc.FindKey([Objeto.ID_ACREDITADO.AsString,
                          sgcDATA.CellStr['ID_DOCUMENTO',sgcDATA.SG.Row],
                          Objeto.Doctos.CVE_DOCUMENTO.AsString]);
         MCteDoc.Modifica;
      Finally
         MCteDoc.Free;
      End;
      MuestraDatos;
   End;
end;

procedure TwMExpAcreD.sgcDATADblClick(Sender: TObject);
Var
   MCteDoc: TMCteDoc;
begin
   Objeto.ID_ACREDITADO.GetFromControl;
   If Objeto.ID_ACREDITADO.AsInteger <> 0 Then Begin
      MCteDoc:=TMCteDoc.create(Nil);
      Try
         MCteDoc.Apli:= Objeto.Apli;
         MCteDoc.ParamCre:= Objeto.ParamCre;
         MCteDoc.Acreditado:= Objeto.Acreditado;
         MCteDoc.Doctos:= Objeto.Doctos;
         MCteDoc.FindKey([Objeto.ID_ACREDITADO.AsString,
                          sgcDATA.CellStr['ID_DOCUMENTO',sgcDATA.SG.Row],
                          Objeto.Doctos.CVE_DOCUMENTO.AsString]);
         MCteDoc.Catalogo;
      Finally
         MCteDoc.Free;
      End;
      MuestraDatos;
   End;
end;

procedure TwMExpAcreD.InterForma1DespuesShow(Sender: TObject);
begin
   If Objeto.Acreditado.ID_ACREDITADO.AsInteger <> 0 Then Begin
      Objeto.ID_ACREDITADO.AsInteger := Objeto.Acreditado.ID_ACREDITADO.AsInteger;
   End;
   MuestraDatos;
end;

procedure TwMExpAcreD.sgcDATAMoveRow(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
   Objeto.CVE_DOCUMENTO.AsString:=sgcDATA.CellStr['CVE_DOCUMENTO',ToIndex];
   Objeto.Doctos.FindKey([IntToStr(Objeto.Apli.IdEmpresa),sgcDATA.CellStr['CVE_DOCUMENTO',ToIndex]]);
end;

procedure TwMExpAcreD.rgSituacionClick(Sender: TObject);
begin
   MuestraDatos;
end;

Function  TwMExpAcreD.VerificaElim: Boolean;
Var
   sSQL:String;
   qyQuery: TQuery;
   bRes :Boolean;
Begin
   bRes:= True;
   If Trim(sgcDATA.CellStr['ID_DOCUMENTO',sgcDATA.SG.Row])<>'' Then Begin
      sSQL:='SELECT DO_RECEP_TRAM.ID_TRAMITE, '+
            '       DO_RECEP_TRAM.CVE_TRAMITE, '+
            '       TABLA.* '+
            '  FROM '+
            '( '+
            'SELECT DO_CLIENTE_DOC.ID_ACREDITADO, '+
            '       DO_CLIENTE_DOC.ID_DOCUMENTO, '+
            '       DO_CLIENTE_DOC.CVE_DOCUMENTO, '+
            '       DO_REL_TRAM_DOC.CVE_TRAMITE, '+
            '       DO_REL_TRAM_DOC.ID_EMPRESA '+
            '  FROM DO_CLIENTE_DOC, DO_REL_TRAM_DOC '+
            ' WHERE DO_CLIENTE_DOC.CVE_DOCUMENTO = DO_REL_TRAM_DOC.CVE_DOCUMENTO '+
            '   AND DO_REL_TRAM_DOC.SIT_REL_TRAM_DO = ''AC'' '+
            '   AND DO_CLIENTE_DOC.ID_ACREDITADO = '+ Objeto.ID_ACREDITADO.AsString +
            '   AND DO_CLIENTE_DOC.ID_DOCUMENTO = '+ sgcDATA.CellStr['ID_DOCUMENTO',sgcDATA.SG.Row]+
            '   AND DO_CLIENTE_DOC.CVE_DOCUMENTO = '''+ sgcDATA.CellStr['CVE_DOCUMENTO',sgcDATA.SG.Row] +''''+
            '       ) TABLA, DO_RECEP_TRAM '+
            ' WHERE TABLA.ID_ACREDITADO = DO_RECEP_TRAM.ID_ACREDITADO '+
            '   AND TABLA.CVE_TRAMITE = DO_RECEP_TRAM.CVE_TRAMITE '+
            '   AND TABLA.ID_EMPRESA = DO_RECEP_TRAM.ID_EMPRESA '+
            '   AND DO_RECEP_TRAM.SIT_RECEP_TRAM = ''AU''';
      qyQuery:= GetSQLQueryNoNil(sSQL,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName,False);
      If qyQuery <> Nil Then Begin
         While not qyQuery.Eof Do Begin
            If Trim(qyQuery.FieldByName('ID_TRAMITE').AsString)<>'' Then
               bRes:= False;
            qyQuery.Next;
         End;
         qyQuery.Free;
      End Else
         bRes:= True;
   End;
   VerificaElim:= bRes;
End;
end.

