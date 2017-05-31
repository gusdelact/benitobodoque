// Sistema         : Clase de NINGUNO
// Fecha de Inicio : 10/08/2005
// Función forma   : Clase de NINGUNO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     : CR_ECC_COM_DET
Unit IntMImpECC;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit,IntParamCre,
IntCrAcredit, IntCrCredito, IntSGCtrl,  IntMQrEdoCtaCert;

Type
 TMImpECC= class;

  TWMImpECC=Class(TForm)
    ilID_CREDITO: TInterLinkit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    GroupBox3: TGroupBox;
    InterForma1: TInterForma;
    lbID_ACREDITADO: TLabel;
    edID_ACREDITADO: TEdit;
    btID_ACREDITADO: TBitBtn;
    edNOM_ACREDITADO: TEdit;
    ilID_ACREDITADO: TInterLinkit;
    edDESC_CREDITO: TEdit;
    btID_CREDITO: TBitBtn;
    edID_CREDITO: TEdit;
    Label1: TLabel;
    cbxID_ACREDITADO: TCheckBox;
    cbxID_CREDITO: TCheckBox;
    BitBtn1: TBitBtn;
    sgcDATA: TSGCtrl;
    shp4: TShape;
    Shape1: TShape;
    Shape6: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape10: TShape;
    Label2: TLabel;
    Label3: TLabel;
    Label9: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label11: TLabel;
    Shape4: TShape;
    Label6: TLabel;
    Shape5: TShape;
    Label7: TLabel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure btID_ACREDITADOClick(Sender: TObject);
    procedure ilID_ACREDITADOEjecuta(Sender: TObject);
    procedure btID_CREDITOClick(Sender: TObject);
    procedure ilID_CREDITOEjecuta(Sender: TObject);
    procedure cbxID_ACREDITADOClick(Sender: TObject);
    procedure cbxID_CREDITOClick(Sender: TObject);
    procedure sgcDATADblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    private 
    { Private declarations } 
      Procedure EnableCheckBox(var CheckBox : TCheckBox);
      Procedure MuestraDatos;
      Function  CadenaSql : String;
      Procedure Selecciona(sColum: string; nColum : Integer);
      Procedure MarcaGrupo (col, pGpoLiq : String);
      Procedure Imprime(bPreview:Boolean);
    public
    { Public declarations }
    Objeto : TMImpECC;
end;
 TMImpECC= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ID_ACREDITADO            : TInterCampo;
        ID_CREDITO               : TInterCampo;
        ID_FOLIO_SOL             : TInterCampo;
        NUM_IMPRESION            : TInterCampo;

        Acreditado               : TCrAcredit;
        CrCredito                : TCrCredito;
        ParamCre                 : TParamCre;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override; 
      published 
      end;



implementation
//Uses RepMon;


{$R *.DFM}


constructor TMImpECC.Create( AOwner : TComponent );
begin Inherited;
      ID_ACREDITADO :=CreaCampo('ID_ACREDITADO',ftInteger,tsNinguno,tsNinguno,False);
                ID_ACREDITADO.Caption:='ID_ACREDITADO';
                ID_ACREDITADO.Parametro:='ID_ACREDITADO';
      ID_CREDITO :=CreaCampo('ID_CREDITO',ftInteger,tsNinguno,tsNinguno,False);
                ID_ACREDITADO.Caption:='ID_CREDITO';
                ID_ACREDITADO.Parametro:='ID_CREDITO';
      ID_FOLIO_SOL :=CreaCampo('ID_FOLIO_SOL',ftInteger,tsNinguno,tsNinguno,False);
                ID_FOLIO_SOL.Caption:='ID_FOLIO_SOL';
                ID_FOLIO_SOL.Parametro:='ID_FOLIO_SOL';
      NUM_IMPRESION :=CreaCampo('NUM_IMPRESION',ftInteger,tsNinguno,tsNinguno,False);
                NUM_IMPRESION.Caption:='NUM_IMPRESION';
                NUM_IMPRESION.Parametro:='NUM_IMPRESION';

      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource:=Self;
      CrCredito := TCrCredito.Create(Self);
      CrCredito.MasterSource:=Self;

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntMImpECC.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TMImpECC.Destroy;
begin
   If Acreditado<> nil Then
      Acreditado.Free;
   If CrCredito <> nil Then
      CrCredito.Free;
   inherited;
end;


function TMImpECC.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWMImpECC;
begin
   W:=TWMImpECC.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftImprimir; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TMImpECC.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('IMImpECC.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;

function TMImpECC.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA NINGUNO********************)
(*                                                                              *)
(*  FORMA DE NINGUNO                                                            *)
(*                                                                              *)
(***********************************************FORMA NINGUNO********************)

procedure TWMImpECC.FormShow(Sender: TObject);
begin
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      Objeto.ID_ACREDITADO.Control:=edID_ACREDITADO;
      Objeto.ID_CREDITO.Control:=edID_CREDITO;

      Objeto.Acreditado.ID_ACREDITADO.Control:=edID_ACREDITADO;
      Objeto.Acreditado.Persona.Nombre.Control:=edNOM_ACREDITADO;
      Objeto.Acreditado.GetParams(Objeto);
      Objeto.CrCredito.ID_CREDITO.Control := edID_CREDITO;
      Objeto.CrCredito.ContratoCre.Producto.DESC_C_PRODUCTO.Control := edDESC_CREDITO;
      Objeto.CrCredito.GetParams(Objeto);
end;

procedure TWMImpECC.FormDestroy(Sender: TObject);
begin
      Objeto.ID_ACREDITADO.Control:=nil;
      Objeto.ID_CREDITO.Control:=nil;

      Objeto.Acreditado.ID_ACREDITADO.Control:=nil;
      Objeto.Acreditado.Persona.Nombre.Control:=nil;
      Objeto.CrCredito.ID_CREDITO.Control := nil;
      Objeto.CrCredito.ContratoCre.Producto.DESC_C_PRODUCTO.Control := nil;
end;

procedure TWMImpECC.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWMImpECC.btID_ACREDITADOClick(Sender: TObject);
begin
   Objeto.Acreditado.ShowAll := True;
   If Objeto.Acreditado.Busca Then Begin
      cbxID_CREDITO.Checked:= False;
      cbxID_ACREDITADO.Checked:= True;
      cbxID_ACREDITADO.Enabled:= True;
      InterForma1.NextTab(edID_ACREDITADO);
   End;
end;

procedure TWMImpECC.ilID_ACREDITADOEjecuta(Sender: TObject);
begin
   If Objeto.Acreditado.FindKey([ilID_ACREDITADO.Buffer])Then Begin
      cbxID_CREDITO.Checked:= False;
      cbxID_ACREDITADO.Checked:= True;
      cbxID_ACREDITADO.Enabled:= True;
      InterForma1.NextTab(edID_ACREDITADO);
   End;
end;

procedure TWMImpECC.btID_CREDITOClick(Sender: TObject);
begin
   Objeto.CrCredito.ShowAll := True;
   If Objeto.CrCredito.Busca Then Begin
      cbxID_ACREDITADO.Checked:= False;
      cbxID_CREDITO.Checked:= True;
      cbxID_CREDITO.Enabled:= True;
      InterForma1.NextTab(edID_CREDITO);
   End;
end;

procedure TWMImpECC.ilID_CREDITOEjecuta(Sender: TObject);
begin
   If Objeto.CrCredito.FindKey([ilID_CREDITO.Buffer]) Then Begin
      cbxID_ACREDITADO.Checked:= False;
      cbxID_CREDITO.Checked:= True;
      cbxID_CREDITO.Enabled:= True;
      InterForma1.NextTab(edID_CREDITO);
   End;
end;

procedure TWMImpECC.cbxID_ACREDITADOClick(Sender: TObject);
begin
   EnableCheckBox(cbxID_ACREDITADO);
   Objeto.Acreditado.Active := cbxID_ACREDITADO.Checked;
end;

procedure TWMImpECC.EnableCheckBox(var CheckBox : TCheckBox);
begin
    If Not CheckBox.Checked Then Begin
        CheckBox.Checked:=False;
        CheckBox.Enabled:=False;
    End Else Begin
        CheckBox.Checked:=True;
        CheckBox.Enabled:=True;
    End;
end;

procedure TWMImpECC.cbxID_CREDITOClick(Sender: TObject);
begin
   EnableCheckBox(cbxID_CREDITO);
   Objeto.CrCredito.Active := cbxID_CREDITO.Checked;
end;

Function TWMImpECC.CadenaSql : String;
Var
   vlsql : String;
Begin
   vlSql:='';
   Objeto.GetFromControl;
   vlsql := ' SELECT SOL.FOLIO_SOLICITUD AS NUM_FOLIO, '+
            '        CTO.ID_TITULAR AS ID_ACREDITADO, PER.NOMBRE,'+
            '        SOL.ID_CREDITO, SOL.F_ALTA, SOL.F_IMPRESION,'+
            '        '' '' AS IMPRIMIR, SOL.NUM_IMPRESION '+
            '   FROM CR_ECC_COM_SOLI SOL, CR_CREDITO CC,'+
            '        CONTRATO CTO, PERSONA PER'+
            '  WHERE CC.ID_CREDITO = SOL.ID_CREDITO'+
            '    AND CTO.ID_CONTRATO = CC.ID_CONTRATO'+
            '    AND PER.ID_PERSONA = CTO.ID_TITULAR';
   If Objeto.ID_ACREDITADO.AsInteger <> 0 Then
      vlsql := vlsql + '    AND CTO.ID_TITULAR ='+ Objeto.ID_ACREDITADO.AsString;
   If Objeto.ID_CREDITO.AsInteger <> 0 Then
      vlsql := vlsql + '    AND SOL.ID_CREDITO ='+ Objeto.ID_CREDITO.AsString;

   vlsql := vlsql + '  ORDER BY SOL.FOLIO_SOLICITUD, CTO.ID_TITULAR,SOL.ID_CREDITO,SOL.F_ALTA';
   CadenaSql := vlSql;
End;

Procedure TWMImpECC.MuestraDatos;
Var
   vlQry : TQuery;
   sSQL :String;
Begin
   sSQL:= CadenaSql;
   If Trim(sSQL) <> '' Then Begin
      vlQry := GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
      Try
         If vlQry <> Nil Then Begin
            vlQry.FieldByName('NUM_FOLIO').DisplayLabel  := 'NUM_FOLIO' + #30 +'>C';
            vlQry.FieldByName('ID_ACREDITADO').DisplayLabel  := 'ID_ACREDITADO' + #30 +'>C';
            vlQry.FieldByName('NOMBRE').DisplayLabel  := 'NOMBRE' + #30 +'>C';
            vlQry.FieldByName('ID_CREDITO').DisplayLabel := 'ID_CREDITO' + #30 +'>C';
            vlQry.FieldByName('F_ALTA').DisplayLabel  := 'F_ALTA' + #30 +'>C';
            vlQry.FieldByName('F_IMPRESION').DisplayLabel  := 'F_IMPRESION' + #30 +'>C';
            vlQry.FieldByName('IMPRIMIR').DisplayLabel:= 'IMPRIMIR' + #30 +'>C';
            vlQry.FieldByName('NUM_IMPRESION').Visible:= False;

            vlQry.FieldByName('NUM_FOLIO').DisplayWidth  :=12;
            vlQry.FieldByName('ID_ACREDITADO').DisplayWidth :=12;
            vlQry.FieldByName('NOMBRE').DisplayWidth  :=48;
            vlQry.FieldByName('ID_CREDITO').DisplayWidth:=12;
            vlQry.FieldByName('F_ALTA').DisplayWidth  :=12;
            vlQry.FieldByName('F_IMPRESION').DisplayWidth  :=12;
            vlQry.FieldByName('IMPRIMIR').DisplayWidth  :=6;

            sgcDATA.AddQry( vlQry, True,True,-1,-1,-1,False);
            sgcDATA.ColumnByName('IMPRIMIR').IsCheck := True;
         End Else Begin
           sgcDATA.Clear('NO SE ENCONTRARON DATOS'#30'>C');
         End;
      Finally
         If vlQry <> Nil Then
            vlQry.free;
      End;
   End;
End;

procedure TWMImpECC.Selecciona(sColum: string; nColum : Integer);
Begin
   if sgcDATA.CellStr[sColum,nColum] = 'SI' + #30 + '>C' then
      sgcDATA.CellStr[sColum,nColum]:= ''
   else
      sgcDATA.CellStr[sColum,nColum]:= 'SI' + #30 + '>C';
end;

procedure TWMImpECC.MarcaGrupo(col, pGpoLiq : String);
var nRow : Integer;
Begin
   For nRow := 0 To sgcDATA.SG.RowCount - 1 Do
      If sgcDATA.CellStr['NUM_FOLIO',nRow] = pGpoLiq Then
         selecciona(col,nRow);
end;

procedure TWMImpECC.sgcDATADblClick(Sender: TObject);
var Y : integer; vlIdGpoLiq : String;
begin
   Y := sgcDATA.SG.Row;
   vlIdGpoLiq := sgcDATA.CellStr['NUM_FOLIO',Y];
   Objeto.ID_FOLIO_SOL.AsInteger:= StrToInt(sgcDATA.CellStr['NUM_FOLIO',Y]);
   MarcaGrupo('IMPRIMIR',vlIdGpoLiq);
end;

procedure TWMImpECC.BitBtn1Click(Sender: TObject);
begin
   Objeto.ID_ACREDITADO.GetFromControl;
   Objeto.ID_CREDITO.GetFromControl;
   If (Objeto.ID_ACREDITADO.AsInteger > 0)Or(Objeto.ID_CREDITO.AsInteger > 0) Then
      MuestraDatos;
end;

procedure TWMImpECC.InterForma1BtnImprimirClick(Sender: TObject);
begin
   Imprime(True);
end;

Procedure TWMImpECC.Imprime(bPreview:Boolean);
Var
   sSQL:String; qyQuery:TQuery;
   stpInserta : TStoredProc; bContinua: Boolean;
   sDetalle: WideString; nRow, iFolio, iNumImp, iCredito:Integer;
begin
   iFolio:= 0;
   iNumImp:= 0;
   bContinua:= True;
   iCredito:= 0;

   For nRow := 0 To sgcDATA.SG.RowCount - 1 Do Begin
      If sgcDATA.CellStr['IMPRIMIR',nRow]= ('SI' + #30 + '>C') Then Begin
         If iFolio <> StrToInt(sgcDATA.CellStr['NUM_FOLIO',nRow]) Then Begin
            iFolio:= StrToInt(sgcDATA.CellStr['NUM_FOLIO',nRow]);
            If Trim(sgcDATA.CellStr['NUM_IMPRESION',nRow]) ='' Then
               iNumImp:= 0
            Else iNumImp:= StrToInt(sgcDATA.CellStr['NUM_IMPRESION',nRow]);

            sSQL:='SELECT (NVL(Max(NUM_IMPRESION),0)+1)NUM FROM CR_ECC_COM_SOLI ' +
                  ' WHERE FOLIO_SOLICITUD ='+ sgcDATA.CellStr['NUM_FOLIO',nRow];
            qyQuery:= GetSQLQuery(sSQL,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
            If qyQuery<> Nil Then Begin
               Objeto.NUM_IMPRESION.AsString:=qyQuery.FieldByName('NUM').AsString;
               qyQuery.Free;
            End Else Objeto.NUM_IMPRESION.AsString:='1';
            Try
               stpInserta:=TStoredProc.Create(Nil);
               stpInserta.DatabaseName:=Objeto.Apli.DataBaseName;
               stpInserta.SessionName:=Objeto.Apli.SessionName;
               stpInserta.StoredProcName:='PKGCRPRUEBA.STPIMPRIMEREPORTE';
               stpInserta.Params.Clear;

               stpInserta.Params.CreateParam(ftFloat,'PEID_FOLIO_SOL',ptInput);
               stpInserta.Params.CreateParam(ftDateTime,'PEF_IMPRESION',ptInput);
               stpInserta.Params.CreateParam(ftFloat,'PENUM_IMPRESION',ptInput);
               stpInserta.Params.CreateParam(ftFloat,'PEID_ACREDITADO',ptInput);
               stpInserta.Params.CreateParam(ftFloat,'PEID_CREDITO',ptInput);
               stpInserta.Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
               stpInserta.Params.CreateParam(ftString,'PSTX_RESULTADO',ptOutput);
               stpInserta.Prepare;
               stpInserta.ParamByName('PEID_FOLIO_SOL').AsFloat := Objeto.ID_FOLIO_SOL.AsFloat;
               stpInserta.ParamByName('PEF_IMPRESION').AsDate := Objeto.Apli.DameFechaEmpresaDia('D000');
               stpInserta.ParamByName('PENUM_IMPRESION').AsFloat := Objeto.NUM_IMPRESION.AsFloat;
               stpInserta.ParamByName('PEID_ACREDITADO').AsFloat := Objeto.ID_ACREDITADO.AsFloat;
               stpInserta.ParamByName('PEID_CREDITO').AsFloat := Objeto.ID_CREDITO.AsFloat;
               stpInserta.ExecProc;

               If stpInserta.ParamByName('PSRESULTADO').AsInteger <> 0 Then Begin
                  bContinua:= False;
                   ShowMessage('PROBLEMAS AL MODIFICAR EL NÚMERO DE IMPRESIÓN: ' +
                       IntToStr(stpInserta.ParamByName('PSRESULTADO').AsInteger)+
                               stpInserta.ParamByName('PSTX_RESULTADO').AsString);
               End;
            Finally
               If stpInserta <> Nil Then Begin
                 stpInserta.UnPrepare;
                 stpInserta.Free;
               End;
            End;
         End;
         If bContinua Then
            If iCredito <> StrToInt(sgcDATA.CellStr['ID_CREDITO',nRow]) Then Begin
               iCredito:= StrToInt(sgcDATA.CellStr['ID_CREDITO',nRow]);
               RepEdoCtaCert(sgcDATA.CellStr['NUM_FOLIO',nRow],
                             sgcDATA.CellStr['ID_CREDITO',nRow],
                             Objeto.ID_ACREDITADO.AsString,
                             Objeto.ID_CREDITO.AsString,
                             Objeto.Apli,bPreview);
            End;
      End;
   End;
   MuestraDatos;
End;
procedure TWMImpECC.InterForma1BtnPreviewClick(Sender: TObject);
begin
   Imprime(True);
end;

end.
