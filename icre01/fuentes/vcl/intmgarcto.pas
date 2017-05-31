// Sistema         : Clase de Garantía por Contrato
// Fecha de Inicio : 29/07/2004
// Función forma   : Clase de Garantía por Contrato
// Desarrollo por  :
// Diseñado por    :
// Comentarios     :
Unit IntMGarCto;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,InterEdit,
Grids, DBGrids, Menus, IntParamCre, IntLinkit,IntSGCtrl,
IntMRegistro, IntCrCto;

Type
 TMGarCto= class;

  TwMGarCto=Class(TForm)
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
    edID_SOLICITUD: TEdit;
    edDESC_ID_SOLICITUD: TEdit;
    btID_SOLICITUD: TBitBtn;
    ilID_SOLICITUD: TInterLinkit;
    Shape4: TShape;
    Label6: TLabel;
    Shape7: TShape;
    Label8: TLabel;
    Shape9: TShape;
    Label11: TLabel;
    edCVE_GARANTIA: TEdit;
    edNOM_CVE_GARANTIA: TEdit;
    edID_CONTRATO: TInterEdit;
    edF_ALTA: TEdit;
    edCVE_USU_ALTA: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    btEliminar: TBitBtn;
    Shape1: TShape;
    Label2: TLabel;
    Label3: TLabel;
    btContrato: TBitBtn;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btID_SOLICITUDClick(Sender: TObject);
    procedure ilID_SOLICITUDCapture(Sender: TObject; var Show: Boolean);
    procedure ilID_SOLICITUDEjecuta(Sender: TObject);
    procedure btContratoClick(Sender: TObject);
    procedure sgcDATAMoveRow(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure btEliminarClick(Sender: TObject);

    private
    { Private declarations }
       Function  CadenaSql : String;
       Procedure MuestraDatos;
       Procedure InsertaDato;
    public
    { Public declarations }
    Objeto : TMGarCto;

end;
 TMGarCto= class(TInterFrame)
      private
      public
        { Public declarations }

        ID_SOLICITUD   : TInterCampo;
        ID_CONTRATO    : TInterCampo;
        SIT_GAR_CTO    : TInterCampo;
        F_ALTA         : TInterCampo;
        CVE_USU_ALTA   : TInterCampo;
        ID_ACREDITADO  : TInterCampo;


        ParamCre       : TParamCre;
        MRegistro      : TMRegistro;
//        ContratoCre    : TCrCto;

        function BuscaContrato : string;

        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
      published
      end;


implementation
{$R *.DFM}

// RUCJ4248: Se genero la función para no depender de la clase de contrato
function TMGarCto.BuscaContrato: string;
var
  strResultado : string;
  T            : TInterFindit;
begin
  strResultado := '';
      T := CreaBuscador('ICrCto.it','F,F');
      try
          if T.Execute then
          Begin
             strResultado := T.DameCampo(0);
          end;
      finally
        T.Free;
      end;
   Result := strResultado;
end;

constructor TMGarCto.Create( AOwner : TComponent );
begin Inherited;
   ID_SOLICITUD :=CreaCampo('ID_SOLICITUD',ftFloat,tsNinguno,tsNinguno,True);
      ID_SOLICITUD.Caption:='Folio de solicitud de garantía';
   ID_CONTRATO :=CreaCampo('ID_CONTRATO',ftFloat,tsNinguno,tsNinguno,True);
      ID_CONTRATO.Caption:='Folio de contrato';
   SIT_GAR_CTO :=CreaCampo('SIT_GAR_CTO',ftString,tsNinguno,tsNinguno,True);
      SIT_GAR_CTO.Caption:='Situación';
   F_ALTA :=CreaCampo('F_ALTA',ftDate,tsNinguno,tsNinguno,True);
      F_ALTA.Caption:='Fecha de alta';
   CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
      CVE_USU_ALTA.Caption:='Clave de usuario de alta';
   ID_ACREDITADO :=CreaCampo('ID_ACREDITADO',ftFloat,tsNinguno,tsNinguno,True);
      ID_ACREDITADO.Caption:='Folio de Acreditado';

   MRegistro := TMRegistro.Create(Self);
   MRegistro.MasterSource := Self;
   MRegistro.FieldByName('ID_SOLICITUD').MasterField := 'ID_SOLICITUD';

   TableName := '';
   UseQuery := True;
   HelpFile := 'IntMGarCto.Hlp';
   ShowMenuReporte:=True;

end;

Destructor TMGarCto.Destroy;
Begin
   inherited;
End;

function TMGarCto.ShowWindow(FormaTipo:TFormaTipo):Integer;
var
   W : TwMGarCto;
begin
   W:=TwMGarCto.Create(Self);
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

Function TwMGarCto.CadenaSql : String;
var
   vlsql : String;
Begin
   If Objeto.MRegistro.ID_SOLICITUD.AsInteger <> 0 Then Begin
      vlSql:='SELECT CR_GA_GAR_CTO.ID_CONTRATO, '+
             '       CR_CONTRATO.FOL_CONTRATO, '+
             '       CR_CONTRATO.CVE_PRODUCTO_CRE, '+
             '       CR_PRODUCTO.DESC_C_PRODUCTO, '+
             '       CR_CONTRATO.F_VENCIMIENTO, '+
             '       CR_CONTRATO.SIT_LINEA, '+
             '       CR_GA_GAR_CTO.F_ALTA, '+
             '       CR_GA_GAR_CTO.CVE_USU_ALTA '+
             '  FROM CR_GA_GAR_CTO, CR_CONTRATO, CR_PRODUCTO '+
             ' WHERE CR_GA_GAR_CTO.ID_CONTRATO = CR_CONTRATO.ID_CONTRATO '+
             '   AND CR_CONTRATO.CVE_PRODUCTO_CRE = CR_PRODUCTO.CVE_PRODUCTO_CRE '+
             '   AND CR_GA_GAR_CTO.ID_SOLICITUD ='+ Objeto.MRegistro.ID_SOLICITUD.AsSQL +
             ' ORDER BY CR_CONTRATO.ID_CONTRATO';
   End;
   CadenaSql := vlSql;
end;

Procedure TwMGarCto.MuestraDatos;
var
   vlQry : TQuery;
   sSQL :String;
begin
   sSQL:= CadenaSql;
   If Trim(sSQL) <> '' Then Begin
      vlQry := GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
      try
         if vlQry <> nil then Begin

            vlQry.FieldByName('ID_CONTRATO').DisplayLabel := 'ID_CONTRATO' + #30 +'>C';
            vlQry.FieldByName('FOL_CONTRATO').DisplayLabel := 'FOL_CONTRATO' + #30 +'>C';
            vlQry.FieldByName('CVE_PRODUCTO_CRE').DisplayLabel := 'CVE_PRODUCTO_CRE' + #30 +'>C';
            vlQry.FieldByName('DESC_C_PRODUCTO').DisplayLabel := 'DESC_C_PRODUCTO' + #30 +'>C';
            vlQry.FieldByName('F_VENCIMIENTO').DisplayLabel := 'F_VENCIMIENTO' + #30 +'>C';
            vlQry.FieldByName('SIT_LINEA').DisplayLabel := 'SIT_LINEA' + #30 +'>C';
            vlQry.FieldByName('F_ALTA').Visible := False;
            vlQry.FieldByName('CVE_USU_ALTA').Visible := False;

            vlQry.FieldByName('ID_CONTRATO').DisplayWidth := 12;
            vlQry.FieldByName('FOL_CONTRATO').DisplayWidth := 8;
            vlQry.FieldByName('CVE_PRODUCTO_CRE').DisplayWidth := 12;
            vlQry.FieldByName('DESC_C_PRODUCTO').DisplayWidth := 28;
            vlQry.FieldByName('F_VENCIMIENTO').DisplayWidth := 12;
            vlQry.FieldByName('SIT_LINEA').DisplayWidth := 5;

            sgcDATA.AddQry( vlQry, True,True,-1,-1,-1,False);
         End Else Begin
            sgcDATA.Clear('NO SE ENCONTRARON DATOS'#30'>C');
         End;
      Finally
         If vlQry <> Nil Then
            vlQry.free;
      End;
   End;
end;

procedure TwMGarCto.FormShow(Sender: TObject);
begin
   InterForma1.BtnPreview.Visible := False;
   InterForma1.BtnImprimir.Visible := False;
   InterForma1.BtnAyuda.Visible := False;

   lbDempresa.Caption := Objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := Objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := Objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := Objeto.ParamCre.PERFIL.AsString;

   With Objeto Do Begin
      ID_SOLICITUD.Control     := edID_SOLICITUD;
      ID_CONTRATO.Control      := edID_CONTRATO;
      F_ALTA.Control           := edF_ALTA;
      CVE_USU_ALTA.Control     := edCVE_USU_ALTA;

      MRegistro.ID_SOLICITUD.Control := edID_SOLICITUD;
      MRegistro.Acreditado.Persona.Nombre.Control := edDESC_ID_SOLICITUD;
      MRegistro.CVE_GARANTIA.Control := edCVE_GARANTIA;
      MRegistro.Garantia.DESC_GARANTIA.Control := edNOM_CVE_GARANTIA;
      MRegistro.GetParams(Objeto);

   End;
end;

procedure TwMGarCto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TwMGarCto.InterForma1Buscar(Sender : TObject);
begin
  Self.Objeto.Busca;
end;

procedure TwMGarCto.InterForma1DespuesShow(Sender: TObject);
begin
   If Objeto.MRegistro.ID_SOLICITUD.AsInteger<> 0 Then Begin
      Objeto.ID_SOLICITUD.AsInteger:= Objeto.MRegistro.ID_SOLICITUD.AsInteger;
      Objeto.ID_ACREDITADO.AsInteger:= Objeto.MRegistro.ID_ACREDITADO.AsInteger;      
   End;
   MuestraDatos;
   edF_ALTA.Text:= sgcDATA.CellStr['F_ALTA',sgcDATA.SG.Row];
   edCVE_USU_ALTA.Text:= sgcDATA.CellStr['CVE_USU_ALTA',sgcDATA.SG.Row];
   edID_CONTRATO.Text:= sgcDATA.CellStr['ID_CONTRATO',sgcDATA.SG.Row];
end;

procedure TwMGarCto.FormDestroy(Sender: TObject);
begin
   With Objeto Do Begin
      ID_SOLICITUD.Control := Nil;
      ID_CONTRATO.Control  := Nil;
      F_ALTA.Control       := Nil;
      CVE_USU_ALTA.Control := Nil;

      MRegistro.ID_SOLICITUD.Control  := Nil;
      MRegistro.Acreditado.Persona.Nombre.Control := Nil;
      MRegistro.CVE_GARANTIA.Control := Nil;
      MRegistro.Garantia.DESC_GARANTIA.Control := Nil;
   End;
end;

procedure TwMGarCto.btID_SOLICITUDClick(Sender: TObject);
begin
   Objeto.MRegistro.ShowAll := True;
   If Objeto.MRegistro.Busca Then Begin
      Objeto.ID_SOLICITUD.AsInteger:= Objeto.MRegistro.ID_SOLICITUD.AsInteger;
      Objeto.ID_ACREDITADO.AsInteger:= Objeto.MRegistro.ID_ACREDITADO.AsInteger;
      MuestraDatos;
      InterForma1.NextTab(edID_SOLICITUD);
   End;
end;

procedure TwMGarCto.ilID_SOLICITUDCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=True;
end;

procedure TwMGarCto.ilID_SOLICITUDEjecuta(Sender: TObject);
Var
   sSQL: String;
   qyQuery: TQuery;
begin
   Objeto.ID_SOLICITUD.GetFromControl;
   sSQL:=' SELECT ID_ACREDITADO FROM CR_GA_REGISTRO WHERE ID_SOLICITUD='+ ilID_SOLICITUD.Buffer ;
   qyQuery:= GetSQLQueryNoNil(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
   If qyQuery <> Nil Then Begin
      If qyQuery.FieldByName('ID_ACREDITADO').AsInteger <> 0 Then Begin
         Objeto.MRegistro.FindKey([ilID_SOLICITUD.Buffer,qyQuery.FieldByName('ID_ACREDITADO').AsInteger]);
         MuestraDatos;
      End;
      qyQuery.Free;
   End;
   InterForma1.NextTab(edID_SOLICITUD);
end;

procedure TwMGarCto.btContratoClick(Sender: TObject);
begin
  Objeto.ID_CONTRATO.AsString := Objeto.BuscaContrato;
  InsertaDato;
  InterForma1.NextTab(btContrato);
end;

procedure TwMGarCto.sgcDATAMoveRow(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
   edF_ALTA.Text:= sgcDATA.CellStr['F_ALTA',ToIndex];
   edCVE_USU_ALTA.Text:= sgcDATA.CellStr['CVE_USU_ALTA',ToIndex];
   Objeto.ID_CONTRATO.AsString := sgcDATA.CellStr['ID_CONTRATO',ToIndex];
   edID_CONTRATO.Text:= sgcDATA.CellStr['ID_CONTRATO',ToIndex];
end;

Procedure TwMGarCto.InsertaDato;
Var
   STPInserta   : TStoredProc;
   vlError, sSQL, vlCve : String;
   qyQuery : TQuery;
Begin
   Objeto.ID_SOLICITUD.GetFromControl;
   sSQL:='SELECT ID_SOLICITUD, ID_CONTRATO FROM CR_GA_GAR_CTO '+
         ' WHERE ID_SOLICITUD='+ Objeto.ID_SOLICITUD.AsSQL +
         '   AND ID_CONTRATO='+  Objeto.ID_CONTRATO.AsSQL;
   GetSQLStr(sSQL,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName,'ID_CONTRATO',vlCve,False);
   If (vlCve = '' ) Then Begin
      STPInserta := TStoredProc.Create(Self);
      Try
         With STPInserta Do Begin
            STPInserta.DatabaseName:= Objeto.Apli.DatabaseName;
            STPInserta.SessionName:= Objeto.Apli.SessionName;
            STPInserta.StoredProcName:='PKGCRDOCUMENTACION.STP_INSERTA_GARCTO';
            Params.Clear;
            Params.CreateParam(ftFloat,'PE_ID_SOLICITUD',ptInput);
            Params.CreateParam(ftFloat,'PE_ID_CONTRATO',ptInput);
            Params.CreateParam(ftString,'PE_SIT_GAR_CTO',ptInput);
            Params.CreateParam(ftDateTime,'PE_F_ALTA',ptInput);
            Params.CreateParam(ftString,'PE_CVE_USU_ALTA',ptInput);
            Params.CreateParam(ftString,'PE_INSERTA',ptInput);
            Params.CreateParam(ftFloat,'PS_RESULTADO',ptOutput);
            Params.CreateParam(ftString,'PS_TX_RESULTADO',ptOutput);

            ParamByName('PE_ID_SOLICITUD').AsFloat := Objeto.ID_SOLICITUD.AsFloat;
            ParamByName('PE_ID_CONTRATO').AsFloat := Objeto.ID_CONTRATO.AsFloat;
            ParamByName('PE_SIT_GAR_CTO').AsString := 'AC';
            ParamByName('PE_F_ALTA').AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
            ParamByName('PE_CVE_USU_ALTA').AsString := Objeto.Apli.Usuario;
            ParamByName('PE_INSERTA').AsString := 'AC';
            Prepare;
            ExecProc;

            If (STPInserta.ParamByName('PS_RESULTADO').AsInteger <>0) Then Begin
               ShowMessage( 'PROBLEMAS AL OBTENER INSERTAR DATOS: '+ STPInserta.ParamByName('PS_RESULTADO').AsString +
                          ' : '+  STPInserta.ParamByName('PS_TX_RESULTADO').AsString);
            End;
         End;
      Finally
         STPInserta.Free;
      End;
      MuestraDatos;
   End Else Begin
      ShowMessage('La relación Garantía - Contrato ya existe');
   End;
End;

procedure TwMGarCto.btEliminarClick(Sender: TObject);
Var
   STPInserta   : TStoredProc;
   vlError, sSQL : String;
   qyQuery : TQuery;
Begin
   Objeto.ID_SOLICITUD.GetFromControl;
   Objeto.ID_CONTRATO.GetFromControl;
   If Objeto.ID_CONTRATO.AsFloat <> 0 Then Begin
      If MessageDlg('¿Está seguro de eliminar el registro?',
         mtConfirmation,[mbYes, mbNo], 0) = mrYes Then Begin
         STPInserta := TStoredProc.Create(Self);
         Try
            With STPInserta Do Begin
               STPInserta.DatabaseName:= Objeto.Apli.DatabaseName;
               STPInserta.SessionName:= Objeto.Apli.SessionName;
               STPInserta.StoredProcName:='PKGCRDOCUMENTACION.STP_INSERTA_GARCTO';
               Params.Clear;
               Params.CreateParam(ftFloat,'PE_ID_SOLICITUD',ptInput);
               Params.CreateParam(ftFloat,'PE_ID_CONTRATO',ptInput);
               Params.CreateParam(ftString,'PE_SIT_GAR_CTO',ptInput);
               Params.CreateParam(ftDateTime,'PE_F_ALTA',ptInput);
               Params.CreateParam(ftString,'PE_CVE_USU_ALTA',ptInput);
               Params.CreateParam(ftString,'PE_INSERTA',ptInput);
               Params.CreateParam(ftFloat,'PS_RESULTADO',ptOutput);
               Params.CreateParam(ftString,'PS_TX_RESULTADO',ptOutput);

               ParamByName('PE_ID_SOLICITUD').AsFloat := Objeto.ID_SOLICITUD.AsFloat;
               ParamByName('PE_ID_CONTRATO').AsFloat := Objeto.ID_CONTRATO.AsFloat;
               ParamByName('PE_SIT_GAR_CTO').AsString := 'AC';
               ParamByName('PE_F_ALTA').AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
               ParamByName('PE_CVE_USU_ALTA').AsString := Objeto.Apli.Usuario;
               ParamByName('PE_INSERTA').AsString := 'IN';
               ExecProc;

               If (STPInserta.ParamByName('PS_RESULTADO').AsInteger <>0) Then Begin
                  vlError := 'PROBLEMAS AL OBTENER INSERTAR DATOS: '+ STPInserta.ParamByName('PS_RESULTADO').AsString +
                             ' : '+  STPInserta.ParamByName('PS_TX_RESULTADO').AsString;
               End;
            End;
         Finally
            STPInserta.Free;
         End;
         MuestraDatos;
      End;
   End;
End;

end.

