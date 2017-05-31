// Sistema         : Clase de Operativas por Autorización
// Fecha de Inicio : 01/09/2004
// Función forma   : Clase de Operativas por Autorización
// Desarrollo por  :
// Diseñado por    :
// Comentarios     :
Unit IntMExpOper;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,InterEdit,
Grids, DBGrids, Menus, IntParamCre, IntLinkit,IntSGCtrl,
IntCrCto, IntCtoPanel;

Type
 TMExpOper= class;

  TwMExpOper=Class(TForm)
    InterForma1             : TInterForma;
    sgcDATA: TSGCtrl;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    shp4: TShape;
    Label1: TLabel;
    Shape6: TShape;
    Label9: TLabel;
    Label5: TLabel;
    edID_CONTRATO: TEdit;
    edDESC_ID_CONTRATO: TEdit;
    btID_CONTRATO: TBitBtn;
    ilID_CONTRATO: TInterLinkit;
    Shape7: TShape;
    Label8: TLabel;
    Shape9: TShape;
    Label11: TLabel;
    edNUM_DIAS_SOL_GLI: TInterEdit;
    edNUM_DIAS_PRO_JUD: TEdit;
    edNUM_DIAS_SOL_GFE: TEdit;
    btEliminar: TBitBtn;
    Shape1: TShape;
    Label2: TLabel;
    btContrato: TBitBtn;
    icpCONTRATO: TInterCtoPanel;
    Label7: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btID_CONTRATOClick(Sender: TObject);
    procedure ilID_CONTRATOCapture(Sender: TObject; var Show: Boolean);
    procedure ilID_CONTRATOEjecuta(Sender: TObject);
    procedure sgcDATAMoveRow(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure sgcDATADblClick(Sender: TObject);
    procedure btContratoClick(Sender: TObject);
    procedure btEliminarClick(Sender: TObject);

    private
    { Private declarations }
       Function  CadenaSql : String;
       Procedure MuestraDatos;
    public
    { Public declarations }
    Objeto : TMExpOper;

end;
 TMExpOper= class(TInterFrame)
      private
      public
        { Public declarations }

        ID_SOLICITUD        : TInterCampo;
        ID_CONTRATO         : TInterCampo;
        CVE_OPERATIVA       : TInterCampo;
        PCT_GTIA_LIQ        : TInterCampo;
        NUM_DIAS_SOL_GLI    : TInterCampo;
        NUM_DIAS_SOL_GFE    : TInterCampo;
        NUM_DIAS_PRO_JUD    : TInterCampo;
        FOL_CONTRATO        : TInterCampo;

        ParamCre       : TParamCre;
        CrCto          : TCrCto;

        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;


implementation
uses IntMFiraCto;
{$R *.DFM}

constructor TMExpOper.Create( AOwner : TComponent );
begin Inherited;
   ID_SOLICITUD :=CreaCampo('ID_SOLICITUD',ftFloat,tsNinguno,tsNinguno,False);
      ID_SOLICITUD.Caption:='Identificador único';
   ID_CONTRATO :=CreaCampo('ID_CONTRATO',ftFloat,tsNinguno,tsNinguno,False);
      ID_CONTRATO.Caption:='Identificador de Contratos';
   CVE_OPERATIVA :=CreaCampo('CVE_OPERATIVA',ftString,tsNinguno,tsNinguno,False);
      CVE_OPERATIVA.Caption:='Clave de Operativa';
   PCT_GTIA_LIQ :=CreaCampo('PCT_GTIA_LIQ',ftFloat,tsNinguno,tsNinguno,False);
      PCT_GTIA_LIQ.Caption:='Porcentaje de garantía líquida';
   NUM_DIAS_SOL_GLI :=CreaCampo('NUM_DIAS_SOL_GLI',ftFloat,tsNinguno,tsNinguno,False);
      NUM_DIAS_SOL_GLI.Caption:='Días para requerir garantía líquida';
   NUM_DIAS_SOL_GFE :=CreaCampo('NUM_DIAS_SOL_GFE',ftFloat,tsNinguno,tsNinguno,False);
      NUM_DIAS_SOL_GFE.Caption:='Días para requerir garantía FEGA';
   NUM_DIAS_PRO_JUD :=CreaCampo('NUM_DIAS_PRO_JUD',ftFloat,tsNinguno,tsNinguno,False);
      NUM_DIAS_PRO_JUD.Caption:='Días para iniciar proceso judicial';
   FOL_CONTRATO :=CreaCampo('FOL_CONTRATO',ftFloat,tsNinguno,tsNinguno,False);
      FOL_CONTRATO.Caption:='Folio';

   CrCto:= TCrCto.Create(Self);
   CrCto.MasterSource := Self;
   CrCto.FieldByName('ID_CONTRATO').MasterField := 'ID_CONTRATO';

   TableName := '';
   UseQuery := True;
   HelpFile := 'IntMExpOper.Hlp';
   ShowMenuReporte:=True;

end;

Destructor TMExpOper.Destroy;
Begin
   inherited;
End;

function TMExpOper.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TwMExpOper;
begin
   W:=TwMExpOper.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftImprimir;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

Function TwMExpOper.CadenaSql : String;
var
   vlsql : String;
Begin
   If Objeto.ID_CONTRATO.AsInteger <> 0 Then Begin
      vlSql:='  SELECT CR_GA_FIRA_CTO.ID_SOLICITUD, '+
             '         CR_GA_FIRA_CTO.ID_CONTRATO, '+
             '         CR_GA_FIRA_CTO.CVE_OPERATIVA, '+
             '         CR_FIRA_EQUIV.CVE_MONEDA, '+
             '         MONEDA.DESC_MONEDA, '+
             '         CR_FIRA_OPERA.DESC_OPERATIVA, '+
             '         CR_GA_FIRA_CTO.PCT_GTIA_LIQ, '+
             '         CR_FIRA_EQUIV.PCT_GTIA_LIQ PCT_GTIA_LIQ_IM, '+
             '         CR_FIRA_EQUIV.PCT_GTIA_FEGA_EF, '+
             '         CR_FIRA_EQUIV.PCT_GTIA_FEGA_NO, '+
             '         CR_GA_FIRA_CTO.NUM_DIAS_SOL_GLI, '+
             '         CR_GA_FIRA_CTO.NUM_DIAS_SOL_GFE, '+
             '         CR_GA_FIRA_CTO.NUM_DIAS_PRO_JUD '+

             '    FROM CR_GA_FIRA_CTO, CR_CONTRATO CONTRATO, CR_FIRA_EQUIV, MONEDA, CR_FIRA_OPERA '+
             '   WHERE CR_GA_FIRA_CTO.ID_CONTRATO = '+ Objeto.ID_CONTRATO.AsSQL+
             '     AND CR_GA_FIRA_CTO.ID_CONTRATO = CONTRATO.ID_CONTRATO '+
             '     AND CR_GA_FIRA_CTO.CVE_OPERATIVA = CR_FIRA_EQUIV.CVE_OPERATIVA '+
             '     AND CR_FIRA_EQUIV.PCT_GTIA_LIQ = PKGCRDOCUMENTACION.OBTEQUIVALENCIA( 1, '+
             '                     CONTRATO.CVE_MONEDA, '+
             '                     CR_GA_FIRA_CTO.CVE_OPERATIVA, '+
             '                     CR_GA_FIRA_CTO.PCT_GTIA_LIQ) '+
             '     AND CR_FIRA_EQUIV.CVE_MONEDA = MONEDA.CVE_MONEDA '+
             '     AND CR_FIRA_EQUIV.CVE_MONEDA = CONTRATO.CVE_MONEDA '+
             '     AND CR_GA_FIRA_CTO.CVE_OPERATIVA = CR_FIRA_OPERA.CVE_OPERATIVA '+
             ' ORDER BY CR_FIRA_OPERA.DESC_OPERATIVA, CR_GA_FIRA_CTO.PCT_GTIA_LIQ';
   End;
   CadenaSql := vlSql;
end;

Procedure TwMExpOper.MuestraDatos;
var
   vlQry : TQuery;
   sSQL :String;
begin
   sSQL:= CadenaSql;
   If Trim(sSQL) <> '' Then Begin
      vlQry := GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
      try
         if vlQry <> nil then Begin

            vlQry.FieldByName('ID_SOLICITUD').Visible := False;
            vlQry.FieldByName('ID_CONTRATO').Visible := False;
            vlQry.FieldByName('CVE_OPERATIVA').Visible := False;
            vlQry.FieldByName('CVE_MONEDA').Visible := False;
            vlQry.FieldByName('DESC_MONEDA').DisplayLabel := 'DESC_MONEDA' + #30 +'>C';
            vlQry.FieldByName('DESC_OPERATIVA').DisplayLabel := 'DESC_OPERATIVA' + #30 +'>C';
            vlQry.FieldByName('PCT_GTIA_LIQ').DisplayLabel := 'PCT_GTIA_LIQ' + #30 +'>C';
            vlQry.FieldByName('PCT_GTIA_LIQ_IM').Visible := False;
            vlQry.FieldByName('PCT_GTIA_FEGA_EF').DisplayLabel := 'PCT_GTIA_FEGA_EF' + #30 +'>C';
            vlQry.FieldByName('PCT_GTIA_FEGA_NO').DisplayLabel := 'PCT_GTIA_FEGA_NO' + #30 +'>C';
            vlQry.FieldByName('NUM_DIAS_SOL_GLI').Visible := False;
            vlQry.FieldByName('NUM_DIAS_SOL_GFE').Visible := False;
            vlQry.FieldByName('NUM_DIAS_PRO_JUD').Visible := False;

            vlQry.FieldByName('DESC_MONEDA').DisplayWidth := 28;
            vlQry.FieldByName('DESC_OPERATIVA').DisplayWidth := 28;
            vlQry.FieldByName('PCT_GTIA_LIQ').DisplayWidth := 14;
            vlQry.FieldByName('PCT_GTIA_FEGA_EF').DisplayWidth := 14;
            vlQry.FieldByName('PCT_GTIA_FEGA_NO').DisplayWidth := 14;
            sgcDATA.AddQry( vlQry, True,True,-1,-1,-1,False);

            Objeto.NUM_DIAS_SOL_GLI.AsString:= sgcDATA.CellStr['NUM_DIAS_SOL_GLI',sgcDATA.SG.Row];
            Objeto.NUM_DIAS_SOL_GFE.AsString:= sgcDATA.CellStr['NUM_DIAS_SOL_GFE',sgcDATA.SG.Row];
            Objeto.NUM_DIAS_PRO_JUD.AsString:= sgcDATA.CellStr['NUM_DIAS_PRO_JUD',sgcDATA.SG.Row];
         End Else Begin
            sgcDATA.Clear('NO SE ENCONTRARON DATOS'#30'>C');
            Objeto.NUM_DIAS_SOL_GLI.AsFloat:= 0;
            Objeto.NUM_DIAS_SOL_GFE.AsFloat:= 0;
            Objeto.NUM_DIAS_PRO_JUD.AsFloat:= 0;
         End;
      Finally
         If vlQry <> Nil Then
            vlQry.free;
      End;
   End;
end;

procedure TwMExpOper.FormShow(Sender: TObject);
begin
   InterForma1.BtnPreview.Visible := False;
   InterForma1.BtnImprimir.Visible := False;
   InterForma1.BtnAyuda.Visible := False;

   lbDempresa.Caption := Objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := Objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := Objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := Objeto.ParamCre.PERFIL.AsString;

   With Objeto Do Begin
      ID_CONTRATO.Control      := icpCONTRATO;
      NUM_DIAS_SOL_GLI.Control := edNUM_DIAS_SOL_GLI;
      NUM_DIAS_SOL_GFE.Control := edNUM_DIAS_SOL_GFE;
      NUM_DIAS_PRO_JUD.Control := edNUM_DIAS_PRO_JUD;

      CrCto.ID_CONTRATO.Control:= edID_CONTRATO;
      CrCto.Contrato.TITNombre.Control:= edDESC_ID_CONTRATO;
      CrCto.GetParams(Objeto);

      icpCONTRATO.Frame := CrCto.Contrato;
      icpCONTRATO.RefrescaInfo;
   End;
end;

procedure TwMExpOper.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TwMExpOper.InterForma1Buscar(Sender : TObject);
begin
  Self.Objeto.Busca;
end;

procedure TwMExpOper.InterForma1DespuesShow(Sender: TObject);
begin
   If Objeto.CrCto.ID_CONTRATO.AsInteger<> 0 Then Begin
      Objeto.ID_CONTRATO.AsInteger:= Objeto.CrCto.ID_CONTRATO.AsInteger;
   End;
   MuestraDatos;
end;

procedure TwMExpOper.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      ID_CONTRATO.Control      := Nil;
      NUM_DIAS_SOL_GLI.Control := Nil;
      NUM_DIAS_SOL_GFE.Control := Nil;
      NUM_DIAS_PRO_JUD.Control := Nil;
      CrCto.ID_CONTRATO.Control:= Nil;
   End;
end;

procedure TwMExpOper.btID_CONTRATOClick(Sender: TObject);
begin
   Objeto.CrCto.ShowAll := True;
   If Objeto.CrCto.Busca Then Begin
      Objeto.ID_CONTRATO.AsInteger:= Objeto.CrCto.ID_CONTRATO.AsInteger;
      Objeto.FOL_CONTRATO.AsFloat :=  Objeto.CrCto.FOL_CONTRATO.AsFloat;
      icpCONTRATO.RefrescaInfo;
      MuestraDatos;
      InterForma1.NextTab(edID_CONTRATO);
   End;
end;

procedure TwMExpOper.ilID_CONTRATOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMExpOper.ilID_CONTRATOEjecuta(Sender: TObject);
Var
   sSQL: String;
   qyQuery: TQuery;
begin
   If Objeto.CrCto.FindKey([ilID_CONTRATO.Buffer,Objeto.FOL_CONTRATO.AsString]) Then Begin
      Objeto.ID_CONTRATO.AsInteger:= Objeto.CrCto.ID_CONTRATO.AsInteger;
      Objeto.FOL_CONTRATO.AsFloat := Objeto.CrCto.FOL_CONTRATO.AsFloat;
      icpCONTRATO.RefrescaInfo;
      MuestraDatos;
      InterForma1.NextTab(edID_CONTRATO);
   End;
end;

procedure TwMExpOper.sgcDATAMoveRow(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
   Objeto.NUM_DIAS_SOL_GLI.AsString:= sgcDATA.CellStr['NUM_DIAS_SOL_GLI',ToIndex];
   Objeto.NUM_DIAS_SOL_GFE.AsString:= sgcDATA.CellStr['NUM_DIAS_SOL_GFE',ToIndex];
   Objeto.NUM_DIAS_PRO_JUD.AsString:= sgcDATA.CellStr['NUM_DIAS_PRO_JUD',ToIndex];
end;

procedure TwMExpOper.sgcDATADblClick(Sender: TObject);
Var
   MFiraCto : TMFiraCto;
begin
   If Trim(sgcDATA.CellStr['ID_SOLICITUD',sgcDATA.SG.Row]) <> '' Then Begin
      MFiraCto := TMFiraCto.Create(self);
      Try
         MFiraCto.Apli:=Objeto.Apli;
         MFiraCto.ParamCre:=Objeto.ParamCre;
         MFiraCto.Autorizacion:=Objeto.CrCto;
         MFiraCto.FindKey([sgcDATA.CellStr['ID_SOLICITUD',sgcDATA.SG.Row],
                           sgcDATA.CellStr['ID_CONTRATO',sgcDATA.SG.Row],
                           sgcDATA.CellStr['CVE_OPERATIVA',sgcDATA.SG.Row],
                           sgcDATA.CellStr['PCT_GTIA_LIQ',sgcDATA.SG.Row]]);
         MFiraCto.Catalogo;
      Finally
         MFiraCto.Free;
      End;
      MuestraDatos;
   End;
end;

procedure TwMExpOper.btContratoClick(Sender: TObject);
Var
   MFiraCto : TMFiraCto;
begin
   MFiraCto := TMFiraCto.Create(self);
   Try
      MFiraCto.Apli:=Objeto.Apli;
      MFiraCto.ParamCre:=Objeto.ParamCre;
      MFiraCto.Autorizacion:=Objeto.CrCto;
      MFiraCto.ID_CONTRATO.AsInteger := Objeto.ID_CONTRATO.AsInteger;
      MFiraCto.FOL_CONTRATO.AsInteger := Objeto.FOL_CONTRATO.AsInteger;
      MFiraCto.Nuevo;
   Finally
      MFiraCto.Free;
   End;
   MuestraDatos;
end;

procedure TwMExpOper.btEliminarClick(Sender: TObject);
Var
   MFiraCto : TMFiraCto;
begin
   MFiraCto := TMFiraCto.Create(self);
   Try
      MFiraCto.Apli:=Objeto.Apli;
      MFiraCto.ParamCre:=Objeto.ParamCre;
      MFiraCto.FindKey([sgcDATA.CellStr['ID_SOLICITUD',sgcDATA.SG.Row],
                        sgcDATA.CellStr['ID_CONTRATO',sgcDATA.SG.Row],
                        sgcDATA.CellStr['CVE_OPERATIVA',sgcDATA.SG.Row],
                        sgcDATA.CellStr['PCT_GTIA_LIQ',sgcDATA.SG.Row]]);
      MFiraCto.Elimina;
   Finally
      MFiraCto.Free;
   End;
   MuestraDatos;
end;

end.

