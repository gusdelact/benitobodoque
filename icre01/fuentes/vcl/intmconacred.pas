// Sistema         : Clase de Garantía por Acreditado
// Fecha de Inicio : 22/07/2004
// Función forma   : Clase de Garantía por Acreditado
// Desarrollo por  :
// Diseñado por    :
// Comentarios     :
Unit IntMConAcred;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,InterEdit,
Grids, DBGrids, Menus, IntParamCre, IntLinkit,IntSGCtrl, 
IntCrAcredit;

Type
 TMConAcred= class;

  TwMConAcred=Class(TForm)
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
    Shape5: TShape;
    Label1: TLabel;
    Label7: TLabel;
    Shape6: TShape;
    Label9: TLabel;
    Label5: TLabel;
    edID_ACREDITADO: TEdit;
    edNOM_ACREDITADO: TEdit;
    Shape2: TShape;
    Shape3: TShape;
    Label2: TLabel;
    Label4: TLabel;
    Shape12: TShape;
    Shape13: TShape;
    Label22: TLabel;
    Label23: TLabel;
    btACREDITADO: TBitBtn;
    ilACREDITADO: TInterLinkit;
    BitBtn1: TBitBtn;
    Shape4: TShape;
    Label6: TLabel;
    Shape7: TShape;
    Label8: TLabel;
    Shape1: TShape;
    Shape8: TShape;
    Label3: TLabel;
    Label10: TLabel;
    Shape9: TShape;
    Label11: TLabel;
    rgSitDis: TRadioGroup;
    rgSitGar: TRadioGroup;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sgcDATADblClick(Sender: TObject);
    procedure btACREDITADOClick(Sender: TObject);
    procedure ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure rgSitDisClick(Sender: TObject);
    procedure rgSitGarClick(Sender: TObject);

    private
    { Private declarations }
       Function  CadenaSql : String;
       Procedure MuestraDatos;
    public
    { Public declarations }
    Objeto : TMConAcred;

end;
 TMConAcred= class(TInterFrame)
      private
      public
        { Public declarations }

        ID_ACREDITADO  : TInterCampo;
        ParamCre       : TParamCre;
        Acreditado     : TCrAcredit;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;


implementation
Uses IntMRegistro;
{$R *.DFM}

constructor TMConAcred.Create( AOwner : TComponent );
begin Inherited;
   ID_ACREDITADO :=CreaCampo('ID_ACREDITADO',ftFloat,tsNinguno,tsNinguno,True);
      ID_ACREDITADO.Caption:='Folio de acreditado';

   Acreditado := TCrAcredit.Create(Self);
   Acreditado.MasterSource := Self;
   Acreditado.FieldByName('ID_ACREDITADO').MasterField := 'ID_ACREDITADO';

   TableName := '';
   UseQuery := True;
   HelpFile := 'IntMConAcred.Hlp';
   ShowMenuReporte:=True;

end;

Destructor TMConAcred.Destroy;
Begin
   If Assigned(Acreditado) Then
    Acreditado.Free;
   inherited;
End;

function TMConAcred.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TwMConAcred;
begin
   W:=TwMConAcred.Create(Self);
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

Function TwMConAcred.CadenaSql : String;
var
   vlsql : String;
Begin
   vlSql:='';
   If Objeto.Acreditado.ID_ACREDITADO.AsInteger <> 0 Then Begin
      vlsql := ' SELECT '+
               '        CR_GA_REGISTRO.ID_ACREDITADO,'+
               '        PERSONA.NOMBRE,'+
               '        CR_GA_REGISTRO.ID_SOLICITUD,'+
               '        CR_GA_REGISTRO.CVE_GARANTIA,'+
               '        CR_GA_GARANTIA.DESC_GARANTIA,'+
               '        CR_CREDITO.ID_CRED_EXTERNO,'+
               '        NVL(CR_GA_REGISTRO.VALOR_GARANTIA,0)VALOR_GARANTIA,'+
               '        NVL((CR_GA_REGISTRO.VALOR_PONDERADO - IMPORTES.SUMA),0) DISPONIBLE,'+
               '        CR_CREDITO.F_VENCIMIENTO F_VEN_DIS,'+
               '        CR_GA_DIS_GAR.ID_DISPOSICION,'+
               '        CR_CREDITO.IMP_CREDITO,'+
               '        CR_GA_DIS_GAR.IMP_GARANTIA,'+
               '        CR_GA_GARANTIA.SIT_GARANTIA'+

               '   FROM CR_GA_REGISTRO  ,CR_GA_GARANTIA, '+
               '        (SELECT ID_REG_SOL_GAR, SUM(IMP_GARANTIA) SUMA '+
               '           FROM CR_GA_DIS_GAR '+
               '          WHERE SIT_REL_DIS_GAR =''AC'' '+
               '          GROUP BY ID_REG_SOL_GAR) IMPORTES, PERSONA, '+
               '        CR_GA_DIS_GAR, CR_GA_SEGURO, CR_CREDITO '+

               '  WHERE CR_GA_REGISTRO.CVE_GARANTIA = CR_GA_GARANTIA.CVE_GARANTIA '+
               '    AND CR_GA_REGISTRO.ID_SOLICITUD = IMPORTES.ID_REG_SOL_GAR(+) '+
               '    AND CR_GA_REGISTRO.ID_ACREDITADO = PERSONA.ID_PERSONA '+
               '    AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_DIS_GAR.ID_REG_SOL_GAR(+) '+
               '    AND CR_GA_REGISTRO.ID_SOLICITUD = CR_GA_SEGURO.ID_REFERENCIA(+) '+
               '    AND CR_GA_SEGURO.CVE_TIPO_SEG_ORIG(+)=''GA'''+
               '    AND CR_GA_DIS_GAR.ID_DISPOSICION = CR_CREDITO.ID_CREDITO(+) '+
               '    AND CR_GA_REGISTRO.ID_ACREDITADO ='+ Objeto.Acreditado.ID_ACREDITADO.AsSQL;
      If rgSitGar.ItemIndex = 0 Then
         vlSql:= vlSql + '    AND CR_GA_REGISTRO.SIT_REG_GARANTIA=''AC'' '
      Else
         vlSql:= vlSql + '    AND CR_GA_REGISTRO.SIT_REG_GARANTIA=''IN'' ';

      If rgSitDis.ItemIndex = 0 Then
         vlSql:= vlSql + '    AND CR_GA_DIS_GAR.SIT_REL_DIS_GAR(+) =''AC'' '
      Else
         vlSql:= vlSql + '    AND CR_GA_DIS_GAR.SIT_REL_DIS_GAR(+) =''IN'' ';

      vlSql:= vlSql + '  ORDER BY CR_GA_REGISTRO.ID_SOLICITUD';
   End;
   CadenaSql := vlSql;
end;

Procedure TwMConAcred.MuestraDatos;
var
   vlQry : TQuery;
   sSQL :String;
begin
   sSQL:= CadenaSql;
   If Trim(sSQL) <> '' Then Begin
      vlQry := GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
      try
         if vlQry <> nil then Begin

            vlQry.FieldByName('ID_ACREDITADO').Visible := False;
            vlQry.FieldByName('NOMBRE').Visible := False;
            vlQry.FieldByName('ID_SOLICITUD').DisplayLabel := 'ID_SOLICITUD' + #30 +'>C';
            vlQry.FieldByName('CVE_GARANTIA').DisplayLabel := 'CVE_GARANTIA' + #30 +'>C';
            vlQry.FieldByName('DESC_GARANTIA').DisplayLabel := 'DESC_GARANTIA' + #30 +'>C';
            vlQry.FieldByName('ID_CRED_EXTERNO').DisplayLabel := 'ID_CRED_EXTERNO' + #30 +'>C';
            //vlQry.FieldByName('F_VEN_SEG').DisplayLabel := 'F_VEN_SEG' + #30 +'>C';
            vlQry.FieldByName('VALOR_GARANTIA').DisplayLabel := 'VALOR_GARANTIA' + #30 +'>C';
            vlQry.FieldByName('DISPONIBLE').DisplayLabel := 'DISPONIBLE' + #30 +'>C';
            vlQry.FieldByName('F_VEN_DIS').DisplayLabel := 'F_VEN_DIS' + #30 +'>C';
            vlQry.FieldByName('ID_DISPOSICION').DisplayLabel := 'ID_DISPOSICION' + #30 +'>C';
            vlQry.FieldByName('IMP_CREDITO').DisplayLabel := 'IMP_CREDITO' + #30 +'>C';
            vlQry.FieldByName('IMP_GARANTIA').DisplayLabel := 'IMP_GARANTIA' + #30 +'>C';
            vlQry.FieldByName('SIT_GARANTIA').DisplayLabel := 'SIT_GARANTIA' + #30 +'>C';

            vlQry.FieldByName('ID_SOLICITUD').DisplayWidth := 8;
            vlQry.FieldByName('CVE_GARANTIA').DisplayWidth := 8;
            vlQry.FieldByName('DESC_GARANTIA').DisplayWidth := 20;
            vlQry.FieldByName('ID_CRED_EXTERNO').DisplayWidth := 12;
            //vlQry.FieldByName('F_VEN_SEG').DisplayWidth := 12;
            vlQry.FieldByName('VALOR_GARANTIA').DisplayWidth := 12;
            vlQry.FieldByName('DISPONIBLE').DisplayWidth := 12;
            vlQry.FieldByName('F_VEN_DIS').DisplayWidth := 10;
            vlQry.FieldByName('ID_DISPOSICION').DisplayWidth := 10;
            vlQry.FieldByName('IMP_CREDITO').DisplayWidth := 12;
            vlQry.FieldByName('IMP_GARANTIA').DisplayWidth := 12;
            vlQry.FieldByName('SIT_GARANTIA').DisplayWidth := 5;


            TNumericField(vlQry.FieldByName('VALOR_GARANTIA')).DisplayFormat := '###,###,###,###,###,##0.00';
            TNumericField(vlQry.FieldByName('DISPONIBLE')).DisplayFormat := '###,###,###,###,###,##0.00';
            TNumericField(vlQry.FieldByName('IMP_CREDITO')).DisplayFormat := '###,###,###,###,###,##0.00';
            TNumericField(vlQry.FieldByName('IMP_GARANTIA')).DisplayFormat := '###,###,###,###,###,##0.00';
            sgcDATA.AddQry( vlQry, True,True,-1,-1,-1,False);
         End Else Begin
            sgcDATA.Clear('NO SE ENCONTRARON DATOS'#30'>C');
         end;
      finally
         if vlQry <> nil then
            vlQry.free;
      end;
   End;
end;

procedure TwMConAcred.FormShow(Sender: TObject);
begin
   InterForma1.BtnPreview.Visible := False;
   InterForma1.BtnImprimir.Visible := False;
   InterForma1.BtnAyuda.Visible := False;

   lbDempresa.Caption := Objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := Objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := Objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := Objeto.ParamCre.PERFIL.AsString;

   With Objeto Do Begin
      ID_ACREDITADO.Control     := edID_ACREDITADO;
      Acreditado.ID_ACREDITADO.Control := edID_ACREDITADO;
      Acreditado.Persona.Nombre.Control := edNOM_ACREDITADO;
      Acreditado.GetParams(Objeto);
   End;
end;

procedure TwMConAcred.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TwMConAcred.InterForma1Buscar(Sender : TObject);
begin
  Self.Objeto.Busca;
end;

procedure TwMConAcred.InterForma1DespuesShow(Sender: TObject);
begin
   MuestraDatos;
   edID_ACREDITADO.SetFocus;
end;

procedure TwMConAcred.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      ID_ACREDITADO.Control := Nil;
      Acreditado.ID_ACREDITADO.Control  := Nil;
      Acreditado.Persona.Nombre.Control := Nil;
   End;
end;

procedure TwMConAcred.sgcDATADblClick(Sender: TObject);
Var
   MRegistro : TMRegistro;
   Y :Integer;
begin

   Y:= sgcDATA.SG.Row;
   If sgcDATA.CellStr['ID_SOLICITUD',Y] <> '0' Then Begin
      MRegistro := TMRegistro.Create(self);
      Try
         MRegistro.Apli :=Objeto.Apli;
         MRegistro.ParamCre:=Objeto.ParamCre;
         MRegistro.FindKey([sgcDATA.CellStr['ID_SOLICITUD',Y] ,
                            sgcDATA.CellStr['ID_ACREDITADO',Y] ]);
         MRegistro.Catalogo;
      Finally
         MRegistro.Free;
      End;
   End;
   MuestraDatos;
end;

procedure TwMConAcred.btACREDITADOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMCONACRED_ACRED',True,True) then
   begin
       Objeto.Acreditado.ShowAll := True;
       If Objeto.Acreditado.Busca Then Begin
          MuestraDatos;
          InterForma1.NextTab(edID_ACREDITADO);
       End;
   end;
end;

procedure TwMConAcred.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMConAcred.ilACREDITADOEjecuta(Sender: TObject);
begin
   If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
      MuestraDatos;
      InterForma1.NextTab(edID_ACREDITADO);
   End;
end;

procedure TwMConAcred.BitBtn1Click(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TMCONACRED_BUSCA',True,True) then
      MuestraDatos;
end;

procedure TwMConAcred.rgSitDisClick(Sender: TObject);
begin
   MuestraDatos;
end;

procedure TwMConAcred.rgSitGarClick(Sender: TObject);
begin
   MuestraDatos;
end;

end.

