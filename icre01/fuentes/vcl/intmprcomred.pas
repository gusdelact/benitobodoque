// Sistema         : Clase de CR_FND_COM_PROG
// Fecha de Inicio : 29/12/2004
// Función forma   : Clase de CR_FND_COM_PROG
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntMPrComRed;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntCrCatComi, IntParamCre,
IntLinkit,  Grids, Aligrid, IntGenCre, IntCrCredito, IntBasicCred,
IntMInstDesc, IntMPrgApoyo;

Const
   COL_CVE = 0; //Descripción de Comisión
   COL_COM = 1; //Descripción de Comisión
   COL_PCT = 2; //Porcentaje
   COL_IMP = 3; //Importe
   COL_SIT = 4; //Situación
   COL_CRE = 5;
   COL_ENT = 6;
   COL_PRO = 7;
Type
 TMPrComRed= class;

  TwMPrComRed=Class(TForm)
    InterForma1             : TInterForma;
    lbID_CREDITO : TLabel;
    edID_CREDITO : TEdit;
    lbCVE_COMISION : TLabel;
    edCVE_COMISION : TEdit;
    rgCVE_TIPO_APLICA : TRadioGroup;
    rgSIT_COMIS_PROG : TRadioGroup;
    Label16: TLabel;
    Label18: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    edF_ALTA: TEdit;
    edF_MODIFICA: TEdit;
    edCVE_USU_MODIFICA: TEdit;
    edCVE_USU_ALTA: TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    btCREDITO: TBitBtn;
    edDESC_CREDITO: TEdit;
    btCOMISION: TBitBtn;
    edDESC_COMISION: TEdit;
    ilCREDITO: TInterLinkit;
    ilCOMISION: TInterLinkit;
    PnlMsg: TPanel;
    Bevel1: TBevel;
    Label23: TLabel;
    Label25: TLabel;
    Label30: TLabel;
    sgDATOS: TStringAlignGrid;
    Label1: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    edCVE_FND_ENT_DES: TEdit;
    btCVE_FND_ENT_DES: TBitBtn;
    edNOM_FND_ENT_DES: TEdit;
    edNOM_FND_PROGRAMA: TEdit;
    btCVE_FND_PROGRAMA: TBitBtn;
    edCVE_FND_PROGRAMA: TEdit;
    ilCVE_FND_ENT_DES: TInterLinkit;
    ilCVE_FND_PROGRAMA: TInterLinkit;
    cbxB_GEN_COM_DISP: TCheckBox;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure edID_CREDITOExit(Sender: TObject);
    procedure btCOMISIONExit(Sender: TObject);
    procedure rgCVE_TIPO_APLICAExit(Sender: TObject);
    procedure rgSIT_COMIS_PROGExit(Sender: TObject);
    procedure ilCOMISIONEjecuta(Sender: TObject);
    procedure ilCOMISIONCapture(Sender: TObject; var Show: Boolean);
    procedure btCOMISIONClick(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure ilCREDITOCapture(Sender: TObject; var Show: Boolean);
    procedure ilCREDITOEjecuta(Sender: TObject);
    procedure btCREDITOClick(Sender: TObject);
    Procedure MuestraHints;
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure sgDATOSClick(Sender: TObject);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    procedure ilCVE_FND_ENT_DESCapture(Sender: TObject; var Show: Boolean);
    procedure ilCVE_FND_PROGRAMACapture(Sender: TObject; var Show: Boolean);
    procedure btCVE_FND_ENT_DESClick(Sender: TObject);
    procedure edCVE_FND_ENT_DESExit(Sender: TObject);
    procedure ilCVE_FND_ENT_DESEjecuta(Sender: TObject);
    procedure edCVE_FND_PROGRAMAExit(Sender: TObject);
    procedure btCVE_FND_PROGRAMAClick(Sender: TObject);
    procedure ilCVE_FND_PROGRAMAEjecuta(Sender: TObject);
    procedure cbxB_GEN_COM_DISPExit(Sender: TObject);
    procedure InterForma1AntesEliminar(Sender: TObject; var Realizado: Boolean);
    procedure rgCVE_TIPO_APLICAEnter(Sender: TObject);
  private
    Procedure LlenaGrid;
    //Procedure InsertaComision;
  public
    Objeto : TMPrComRed;
  end;



  TMPrComRed= class(TInterFrame)
  private
  protected
  public
        function    ObtTipoAplica: String;
  public
        ID_CREDITO               : TInterCampo;
        CVE_FND_ENT_DES          : TInterCampo;
        CVE_FND_PROGRAMA         : TInterCampo;
        CVE_COMISION             : TInterCampo;
        CVE_TIPO_APLICA          : TInterCampo;
        CVE_DIA_APLICA           : TInterCampo;
        B_GEN_COM_DISP           : TInterCampo;
        SIT_COMIS_PROG           : TInterCampo;
        F_ALTA                   : TInterCampo;
        CVE_USU_ALTA             : TInterCampo;
        F_MODIFICA               : TInterCampo;
        CVE_USU_MODIFICA         : TInterCampo;

        vgIdCredito              : Integer;
        vgCveEntidad             : String;
        vgCvePrograma            : String;

        Comisiones               : TCrCatComi;
        ParamCre                 : TParamCre;
        Credito                  : TCrCredito;
        BasicCred                : TBasicCred;
        MInstDesc                : TMInstDesc;
        MPrgApoyo                : TMPrgApoyo;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;



  published
  end;
  

implementation
{$R *.DFM}
constructor TMPrComRed.Create( AOwner : TComponent );
begin
  Inherited;
  ID_CREDITO :=CreaCampo('ID_CREDITO',ftFloat,tsNinguno,tsNinguno,True);
  ID_CREDITO.Caption:='Disposición';
  //
  CVE_FND_ENT_DES :=CreaCampo('CVE_FND_ENT_DES',ftString,tsNinguno,tsNinguno,True);
  CVE_FND_ENT_DES.Caption:='Entidad Descontadora';
  //
  CVE_FND_PROGRAMA :=CreaCampo('CVE_FND_PROGRAMA',ftString,tsNinguno,tsNinguno,True);
  CVE_FND_PROGRAMA.Caption:='Programa';
  //
  CVE_COMISION :=CreaCampo('CVE_COMISION',ftString,tsNinguno,tsNinguno,True);
  CVE_COMISION.Caption:='Clave de Comisión';
  //
  CVE_TIPO_APLICA :=CreaCampo('CVE_TIPO_APLICA',ftString,tsNinguno,tsNinguno,True);
  with CVE_TIPO_APLICA do
  begin
    Size:=2;
    UseCombo:=True;
    ComboLista.Add('0'); ComboDatos.Add('PC');
    ComboLista.Add('1'); ComboDatos.Add('MN');
    ComboLista.Add('2'); ComboDatos.Add('AN');
  end;
  CVE_TIPO_APLICA.Caption:='Tipo de Aplicación';
  //
  CVE_DIA_APLICA := CreaCampo('CVE_DIA_APLICA',ftString,tsNinguno,tsNinguno,True);
  CVE_DIA_APLICA.Caption:='Día de Aplicación';
  //
  B_GEN_COM_DISP :=CreaCampo('B_GEN_COM_DISP',ftString,tsNinguno,tsNinguno,True);
  B_GEN_COM_DISP.Caption:='Genera Comisión en Disposición';
  //
  SIT_COMIS_PROG :=CreaCampo('SIT_COMIS_PROG',ftString,tsNinguno,tsNinguno,True);
  with SIT_COMIS_PROG do
  begin Size:=2;
      UseCombo:=True;
      ComboLista.Add('0'); ComboDatos.Add('AC');
      ComboLista.Add('1'); ComboDatos.Add('CA');
  end;
  SIT_COMIS_PROG.Caption:='Situación de la Comisión';
  //
  F_ALTA :=CreaCampo('F_ALTA',ftDateTime,tsNinguno,tsNinguno,True);
  F_ALTA.Caption:='Fecha Alta';
  //
  CVE_USU_ALTA :=CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
  CVE_USU_ALTA.Caption:='Clave de Usu Alta';
  //
  F_MODIFICA :=CreaCampo('F_MODIFICA',ftDateTime,tsNinguno,tsNinguno,True);
  F_MODIFICA.Caption:='Fecha Modifica';
  //
  CVE_USU_MODIFICA :=CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
  CVE_USU_MODIFICA.Caption:='Clave de Usu Modifica';
  //
  VGIDCredito   := 0;
  vgCveEntidad  := '';
  vgCvePrograma := '';
  //
  FKeyFields.Add('ID_CREDITO');
  FKeyFields.Add('CVE_FND_ENT_DES');
  FKeyFields.Add('CVE_FND_PROGRAMA');
  FKeyFields.Add('CVE_COMISION');

  TableName := 'CR_FND_COM_PROG';
  UseQuery := True;
  HelpFile := 'IntMPrComRed.Hlp';
  ShowMenuReporte:=True;

  Comisiones := TCrCatComi.Create(Self);
  Comisiones.MasterSource := self;
  Comisiones.FieldByName('CVE_COMISION').MasterField := 'CVE_COMISION';

  Credito := TCrCredito.Create(Self);
  Credito.MasterSource:=Self;
  Credito.FieldByName('ID_CREDITO').MasterField := 'ID_CREDITO';

  MInstDesc := TMInstDesc.Create(Self);
  MInstDesc.MasterSource:=Self;
  MInstDesc.FieldByName('CVE_FND_ENT_DES').MasterField:='CVE_FND_ENT_DES';

  MPrgApoyo := TMPrgApoyo.Create(Self);
  MPrgApoyo.MasterSource:=Self;
  MPrgApoyo.FieldByName('CVE_FND_ENT_DES').MasterField:='CVE_FND_ENT_DES';
  MPrgApoyo.FieldByName('CVE_FND_PROGRAMA').MasterField:='CVE_FND_PROGRAMA';
end;

//
Destructor TMPrComRed.Destroy;
begin
   If Comisiones <> Nil Then
      Comisiones.Free;
   If Credito <> Nil Then
      Credito.free;
   If MInstDesc <> Nil Then
      MInstDesc.Free;
   If MPrgApoyo <> Nil Then
      MPrgApoyo.Free;
    inherited;
end;

function TMPrComRed.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TwMPrComRed;
begin
   W:=TwMPrComRed.Create(Self);
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

Function TMPrComRed.InternalBusca:Boolean;
Var
   T:TInterFindit;
begin
   InternalBusca := False;
   T := CreaBuscador('IMPrComRed.it','F,S,S,S');
   Try
      If Active Then Begin
         T.Param(0,ID_CREDITO.AsString);
         T.Param(1,CVE_FND_ENT_DES.AsString);
         T.Param(2,CVE_FND_PROGRAMA.AsString);
         T.Param(3,CVE_COMISION.AsString);
      End;
      If T.Execute Then
         InternalBusca := FindKey([T.DameCampo(0),T.DameCampo(1),
                                   T.DameCampo(2),T.DameCampo(3)]);
   Finally
      T.Free;
   End;
end;

function TMPrComRed.Reporte:Boolean;
begin
end;


function TMPrComRed.ObtTipoAplica: String;
var vlStrSql     : String;
    vlTipoAplica : String;
begin
  vlStrSql := 'SELECT CVE_TIPO_APLICA FROM CR_CAT_COMISION WHERE CVE_COMISION = ' + SQLStr(CVE_COMISION.AsString);
  GetSQLStr( vlStrSql, Apli.DataBaseName, Apli.SessionName, 'CVE_TIPO_APLICA' ,
             vlTipoAplica,  False );

  Result := vlTipoAplica;
end;


(***********************************************FORMA CR_FND_COM_PROG********************)
(*                                                                              *)
(*  FORMA DE CR_FND_COM_PROG                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_FND_COM_PROG********************)
{
Procedure TwMPrComRed.InsertaComision;
Var
   STP: TStoredProc;
Begin
   STP := TStoredProc.Create(Self);
   Try
      With STP Do Begin
         STP.DatabaseName:= Objeto.Apli.DatabaseName;
         STP.SessionName:= Objeto.Apli.SessionName;
         STP.StoredProcName:='PKGCRREDESCTO.STPGENCOMISFOND';

         Params.Clear;
         Params.CreateParam(ftFloat,'PEIDCREDITO',ptInput);
         Params.CreateParam(ftString,'PECVEENTIDAD',ptInput);
         Params.CreateParam(ftString,'PECVEPROGRAMA',ptInput);
         Params.CreateParam(ftString,'PECVECOMISION',ptInput);
         Params.CreateParam(ftString,'PECVEUSUALTA',ptInput);
         Params.CreateParam(ftString,'PEGENCOMDISP',ptInput);
         Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
         Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
         Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);

         ParamByName('PEIDCREDITO').AsFloat := Objeto.ID_CREDITO.AsFloat;
         ParamByName('PECVEENTIDAD').AsString := Objeto.CVE_FND_ENT_DES.AsString;
         ParamByName('PECVEPROGRAMA').AsString := Objeto.CVE_FND_PROGRAMA.AsString;
         ParamByName('PECVECOMISION').AsString := Objeto.CVE_COMISION.AsString;
         ParamByName('PECVEUSUALTA').AsString := Objeto.Apli.Usuario;
         If cbxB_GEN_COM_DISP.Checked Then
               ParamByName('PEGENCOMDISP').AsString := 'V'
         Else
               ParamByName('PEGENCOMDISP').AsString := 'F';

         ParamByName('PEBCOMMIT').AsString := 'V';
         ExecProc;
         If ParamByName('PSRESULTADO').AsInteger <> 0 Then Begin
            ShowMessage('Alta de Periodos, Error [ ' +
                        ParamByName('PSRESULTADO').AsString + '] ' +
                        ParamByName('PSTXRESULTADO').AsString);
         End;
         UnPrepare;
      End;
   Finally
      STP.Free;
   End;
End;
}

procedure TwMPrComRed.LlenaGrid;
Var
   Qry         : TQuery;
   i,nRowCount : Integer;
   vlSql       : String;
begin
   With sgDATOS Do Begin
      ClearGrid(sgDATOS);
      Application.ProcessMessages;
      For i:= 0 To RowCount-1 Do
         RemoveRow(Row);
   End;
   Application.ProcessMessages;

   vlSql := ' SELECT CR_CAT_COMISION.CVE_COMISION ,   ' + coCRLF +
            '        CR_CAT_COMISION.DESC_COMISION,   ' + coCRLF +
            '        CR_CAT_COMISION.PCT_COMISION,   ' + coCRLF +
            '        CR_CAT_COMISION.IMP_COMISION ,   ' + coCRLF +
            '        CR_FND_COM_PROG.SIT_COMIS_PROG, ' + coCRLF +
            '        CR_FND_COM_PROG.ID_CREDITO, ' + coCRLF +
            '        CR_FND_COM_PROG.CVE_FND_ENT_DES, ' + coCRLF +
            '        CR_FND_COM_PROG.CVE_FND_PROGRAMA ' + coCRLF +
            '   FROM CR_CAT_COMISION,' + coCRLF +
            '        CR_FND_COM_PROG ' + coCRLF +
            '  WHERE CR_CAT_COMISION.CVE_COMISION = CR_FND_COM_PROG.CVE_COMISION' + coCRLF +
            '    AND CR_FND_COM_PROG.ID_CREDITO   ='+ IntToStr(Objeto.vgIdCredito) + coCRLF +
            '    AND CR_FND_COM_PROG.CVE_FND_ENT_DES ='''+ Objeto.vgCveEntidad +''''+ coCRLF +
            '    AND CR_FND_COM_PROG.CVE_FND_PROGRAMA ='''+ Objeto.vgCvePrograma +''''+ coCRLF;

   nRowCount := 0;
   With Objeto Do Begin
      Qry := GetSQLQueryNoNil( vlSql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False );
      If Qry.RecordCount <> 0 Then Begin
         If Assigned(Qry) And NOT( Qry.IsEmpty ) Then Begin
            While Not Qry.Eof Do Begin
               With sgDATOS Do Begin
                  Cells[COL_CVE,nRowCount] := Qry.FieldByName('CVE_COMISION').AsString;
                  Cells[COL_COM,nRowCount] := Qry.FieldByName('DESC_COMISION').AsString;
                  Cells[COL_PCT,nRowCount] := Format(CFORMAT_TASA,[ Qry.FieldByName('PCT_COMISION').AsFloat ] );
                  Cells[COL_IMP,nRowCount] := Format(CFORMAT_DINERO,[ Qry.FieldByName('IMP_COMISION').AsFloat ] );
                  Cells[COL_SIT,nRowCount] := Qry.FieldByName('SIT_COMIS_PROG').AsString;
                  Cells[COL_CRE,nRowCount] := Qry.FieldByName('ID_CREDITO').AsString;
                  Cells[COL_ENT,nRowCount] := Qry.FieldByName('CVE_FND_ENT_DES').AsString;
                  Cells[COL_PRO,nRowCount] := Qry.FieldByName('CVE_FND_PROGRAMA').AsString;
                  nRowCount := nRowCount + 1;
               End;
               Qry.Next;
               sgDATOS.RowCount := nRowCount + 1;
               Application.ProcessMessages;
            End;
         End;
      End Else Begin
         ClearGrid(sgDATOS);
         Application.ProcessMessages;
      End;
   End;
   If Assigned(Qry) Then Begin
      Qry.Close;
      Qry.Free;
   End;
end;



Procedure TwMPrComRed.MuestraHints;
Begin
   edDESC_CREDITO.Hint := Objeto.Credito.ContratoCre.Contrato.TITNombre.AsString;
   edDESC_CREDITO.ShowHint := True;
   edDESC_COMISION.Hint := Objeto.Comisiones.DESC_COMISION.AsString;
   edDESC_COMISION.ShowHint := True;
End;


procedure TwMPrComRed.FormShow(Sender: TObject);
begin
   lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
   lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
   lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
   lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

   Objeto.ID_CREDITO.Control:=edID_CREDITO;
   Objeto.CVE_FND_ENT_DES.Control:=edCVE_FND_ENT_DES;
   Objeto.CVE_FND_PROGRAMA.Control:=edCVE_FND_PROGRAMA;
   Objeto.CVE_COMISION.Control:=edCVE_COMISION;
   Objeto.CVE_TIPO_APLICA.Control:=rgCVE_TIPO_APLICA;
   //Objeto.CVE_DIA_APLICA.Control:=edCVE_DIA_APLICA;
   Objeto.B_GEN_COM_DISP.Control:=cbxB_GEN_COM_DISP;
   Objeto.SIT_COMIS_PROG.Control:=rgSIT_COMIS_PROG;
   Objeto.F_ALTA.Control:=edF_ALTA;
   Objeto.CVE_USU_ALTA.Control:=edCVE_USU_ALTA;
   Objeto.F_MODIFICA.Control:=edF_MODIFICA;
   Objeto.CVE_USU_MODIFICA.Control:=edCVE_USU_MODIFICA;

   Objeto.Comisiones.CVE_COMISION.Control := edCVE_COMISION;
   Objeto.Comisiones.DESC_COMISION.Control := edDESC_COMISION;
   Objeto.Comisiones.GetParams(Objeto);

   Objeto.ID_CREDITO.Control:=edID_CREDITO;

   Objeto.Credito.ID_CREDITO.Control := edID_CREDITO;
   Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := edDESC_CREDITO;
   Objeto.Credito.GetParams(Objeto);

   Objeto.MInstDesc.CVE_FND_ENT_DES.Control := edCVE_FND_ENT_DES;
   Objeto.MInstDesc.DESC_ENT_DES.Control    := edNOM_FND_ENT_DES;
   Objeto.MInstDesc.GetParams(Objeto);

   Objeto.MPrgApoyo.CVE_FND_PROGRAMA.Control:= edCVE_FND_PROGRAMA;
   Objeto.MPrgApoyo.DESC_PROGRAMA.Control   := edNOM_FND_PROGRAMA;
   Objeto.MPrgApoyo.GetParams(Objeto);

   InterForma1.MsgPanel := PnlMsg;

   LlenaGrid;
end;

procedure TwMPrComRed.FormDestroy(Sender: TObject);
begin
   Objeto.ID_CREDITO.Control:=nil;
   Objeto.CVE_FND_ENT_DES.Control:=nil;
   Objeto.CVE_FND_PROGRAMA.Control:=nil;
   Objeto.CVE_COMISION.Control:=nil;
   Objeto.CVE_TIPO_APLICA.Control:=nil;
   //Objeto.CVE_DIA_APLICA.Control:=nil;
   Objeto.B_GEN_COM_DISP.Control:=nil;
   Objeto.SIT_COMIS_PROG.Control:=nil;
   Objeto.F_ALTA.Control:=nil;
   Objeto.CVE_USU_ALTA.Control:=nil;
   Objeto.F_MODIFICA.Control:=nil;
   Objeto.CVE_USU_MODIFICA.Control:=nil;

   Objeto.Comisiones.CVE_COMISION.Control := nil;
   Objeto.Comisiones.DESC_COMISION.Control :=nil;
   Objeto.Credito.ID_CREDITO.Control := Nil;
   Objeto.Credito.ContratoCre.Contrato.TITNombre.Control :=nil;
   Objeto.MInstDesc.CVE_FND_ENT_DES.Control  := Nil;
   Objeto.MInstDesc.DESC_ENT_DES.Control     := Nil;
   Objeto.MPrgApoyo.CVE_FND_PROGRAMA.Control := Nil;
   Objeto.MPrgApoyo.DESC_PROGRAMA.Control    := Nil;
end;

procedure TwMPrComRed.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TwMPrComRed.InterForma1DespuesNuevo(Sender: TObject);
begin
   rgCVE_TIPO_APLICA.ItemIndex    := 0;
   rgSIT_COMIS_PROG.ItemIndex     := -1;
   Objeto.CVE_DIA_APLICA.AsString := '';
   Objeto.B_GEN_COM_DISP.AsString := 'V';
   Objeto.SIT_COMIS_PROG.AsString := 'AC';
   Objeto.F_ALTA.AsDateTime       := Now;;
   Objeto.CVE_USU_ALTA.AsString   := Objeto.Apli.Usuario;
   MuestraHints;
   edID_CREDITO.SetFocus;

   If Objeto.VGIDCredito <> 0 Then Begin
      Objeto.BasicCred := CreaTBCredito(Objeto.VGIDCredito, Objeto.Apli);
      Objeto.Credito.FindKey([IntToStr(Objeto.VGIDCredito)]);
      edID_CREDITO.Color := clBtnFace;
      edID_CREDITO.ReadOnly := True;
      edID_CREDITO.TabStop := False;
      edCVE_FND_ENT_DES.SetFocus;

      If Objeto.vgCveEntidad  <> '' Then Begin
         Objeto.MInstDesc.FindKey([Objeto.vgCveEntidad]);
         edCVE_FND_ENT_DES.Color := clBtnFace;
         edCVE_FND_ENT_DES.ReadOnly := True;
         edCVE_FND_ENT_DES.TabStop := False;
         edCVE_FND_PROGRAMA.SetFocus;

         If Objeto.vgCvePrograma  <> '' Then Begin
            Objeto.MPrgApoyo.FindKey([Objeto.vgCveEntidad,Objeto.vgCvePrograma]);
            edCVE_FND_PROGRAMA.Color := clBtnFace;
            edCVE_FND_PROGRAMA.ReadOnly := True;
            edCVE_FND_PROGRAMA.TabStop := False;
            edCVE_COMISION.SetFocus;
         End;
      End;
   End;
end;

procedure TwMPrComRed.InterForma1DespuesModificar(Sender: TObject);
begin
   Objeto.F_MODIFICA.AsDateTime       := Now;;
   Objeto.CVE_USU_MODIFICA.AsString   := Objeto.Apli.Usuario;
   rgCVE_TIPO_APLICA.SetFocus;
end;


procedure TwMPrComRed.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   //nuevo
   If IsNewData Then Begin
      If MessageDlg('¿Desea almacenar los datos capturados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes Then Begin
         Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
         Objeto.F_ALTA.AsDateTime     := Objeto.Apli.DameFechaEmpresaDia('D000');
         Realizado := True;
      End Else
         Realizado := False;
   End Else Begin
      If MessageDlg('¿Desea guardar los datos modificados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes Then Begin
         Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
         Objeto.F_ALTA.AsDateTime     := Objeto.Apli.DameFechaEmpresaDia('D000');
         Realizado := True;
      End Else
         Realizado := False;
   End;
end;



procedure TwMPrComRed.InterForma1Buscar(Sender: TObject);
begin
   If (Objeto.vgIdCredito <> 0)And (Objeto.vgCveEntidad <> '') And
      (Objeto.vgCvePrograma <> '') Then Begin
      Objeto.BuscaWhereString :=
         ' CR_FND_COM_PROG.ID_CREDITO =' + IntToStr(Objeto.VGIDCredito) +
         ' AND CR_FND_COM_PROG.CVE_FND_ENT_DES =''' + Objeto.vgCveEntidad +''''+
         ' AND CR_FND_COM_PROG.CVE_FND_PROGRAMA =''' + Objeto.vgCvePrograma + '''';
      Objeto.FilterString := Objeto.BuscaWhereString;
   End Else Begin
      Objeto.BuscaWhereString :='';
      Objeto.FilterString := Objeto.BuscaWhereString;
   End;
   If Objeto.Busca Then Begin
      MuestraHints;
      LlenaGrid;
   End;
end;

procedure TwMPrComRed.InterForma1DespuesAceptar(Sender: TObject);
begin
   LlenaGrid;
   MuestraHints;
   //If InterForma1.IsNewData Then      InsertaComision;
end;


procedure TwMPrComRed.InterForma1DespuesShow(Sender: TObject);
begin
   Objeto.Credito.FindKey([Objeto.VGIDCredito]);
   Objeto.ID_CREDITO.AsInteger:= Objeto.Credito.ID_CREDITO.AsInteger;
   Objeto.MInstDesc.FindKey([Objeto.vgCveEntidad]);
   Objeto.CVE_FND_ENT_DES.AsString:= Objeto.MInstDesc.CVE_FND_ENT_DES.AsString;
   Objeto.MPrgApoyo.FindKey([Objeto.vgCveEntidad,Objeto.vgCvePrograma]);
   Objeto.CVE_FND_PROGRAMA.AsString:= Objeto.MPrgApoyo.CVE_FND_PROGRAMA.AsString;
   LlenaGrid;
end;


procedure TwMPrComRed.InterForma1DespuesEliminar(Sender: TObject);
begin
   LlenaGrid;
end;


procedure TwMPrComRed.InterForma1AntesEliminar(Sender: TObject;
  var Realizado: Boolean);
Var
   sSQL : String;
   qyQuery: TQuery;
begin
   sSQL:='SELECT * FROM CR_FND_COMISION '+
         ' WHERE ID_CREDITO = '+ Objeto.ID_CREDITO.AsSQL +
         '   AND CVE_FND_ENT_DES = '+ Objeto.CVE_FND_ENT_DES.AsSQL +
         '   AND CVE_FND_PROGRAMA = '+ Objeto.CVE_FND_PROGRAMA.AsSQL +
         '   AND CVE_COMISION = '+  Objeto.CVE_COMISION.AsSQL;
   qyQuery:= GetSQLQueryNoNil(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
   If qyQuery.RecordCount <> 0 Then Begin
      If (MessageDlg('¿Existen registros de periodos relacionados a éste, desea continuar?',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes) Then Begin
         sSQL:= 'Delete CR_FND_COMISION '+
                ' WHERE ID_CREDITO = '+ Objeto.ID_CREDITO.AsSQL +
                '   AND CVE_FND_ENT_DES = '+ Objeto.CVE_FND_ENT_DES.AsSQL +
                '   AND CVE_FND_PROGRAMA = '+ Objeto.CVE_FND_PROGRAMA.AsSQL +
                '   AND CVE_COMISION = '+  Objeto.CVE_COMISION.AsSQL;
         RunSQL(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
         Realizado:= True;
      End Else Begin
         Realizado:= False;
      End;
   End;
end;
// ///////////////////////////////////////////////////////////////////////////



procedure TwMPrComRed.ilCREDITOEjecuta(Sender: TObject);
begin
   If Objeto.Credito.FindKey([ilCREDITO.Buffer]) Then
      InterForma1.NextTab(edID_CREDITO);
end;


procedure TwMPrComRed.ilCREDITOCapture(Sender: TObject;
  var Show: Boolean);
begin
   If Objeto.vgIdCredito <> 0 Then
      Show := False
   Else
      Show := (InterForma1.CanEdit)and(InterForma1.IsNewData);
end;


procedure TwMPrComRed.btCREDITOClick(Sender: TObject);
begin
   Objeto.Credito.ShowAll := True;
   If Objeto.Credito.Busca Then Begin
      edDESC_CREDITO.Text := Objeto.Credito.ContratoCre.Contrato.TITNombre.AsString;
      InterForma1.NextTab(edID_CREDITO);
   End;
end;


procedure TwMPrComRed.edID_CREDITOExit(Sender: TObject);
var
   VLSalida : Boolean;
   VlMsg    : String;
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      VLSalida := True;
      VLMsg := '';
      Objeto.ID_CREDITO.GetFromControl;
      If Objeto.ID_CREDITO.AsString = '' Then Begin
         VLSalida := False;
         VLMsg := 'Favor de Indicar la disposición';
      End;
      InterForma1.ValidaExit(edID_CREDITO,VlSalida,VlMsg,True);
   End;
end;



procedure TwMPrComRed.ilCVE_FND_ENT_DESEjecuta(Sender: TObject);
begin
   If Objeto.MInstDesc.FindKey([ilCVE_FND_ENT_DES.Buffer]) Then
      InterForma1.NextTab(edCVE_FND_ENT_DES);
end;


procedure TwMPrComRed.ilCVE_FND_ENT_DESCapture(Sender: TObject;
  var Show: Boolean);
begin
   If Objeto.vgCveEntidad <> '' Then
      Show := False
   Else
      Show := (InterForma1.CanEdit)and(InterForma1.IsNewData);
end;


procedure TwMPrComRed.btCVE_FND_ENT_DESClick(Sender: TObject);
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      Objeto.MInstDesc.ShowAll := True;
      If Objeto.MInstDesc.Busca Then
         InterForma1.NextTab(edCVE_FND_ENT_DES);
   End;
end;



procedure TwMPrComRed.edCVE_FND_ENT_DESExit(Sender: TObject);
Var
   VLSalida  :  boolean;
   VLMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppend)) Then Begin
      VLMsg     := '';
      VlSalida  := True;
      Objeto.CVE_FND_ENT_DES.GetFromControl;
      If Objeto.CVE_FND_ENT_DES.AsString = '' Then Begin
         VLMsg := 'Favor de Indicar la Institución o Entidad descontadora';
         VlSalida   := False;
      End;
      InterForma1.ValidaExit(edCVE_FND_ENT_DES,VLSalida,VLMsg,True);
   End;
end;




procedure TwMPrComRed.ilCVE_FND_PROGRAMAEjecuta(Sender: TObject);
begin
   If Objeto.MPrgApoyo.FindKey([Objeto.CVE_FND_ENT_DES.AsString,
                                ilCVE_FND_PROGRAMA.Buffer]) Then
      InterForma1.NextTab(edCVE_FND_PROGRAMA);
end;


procedure TwMPrComRed.ilCVE_FND_PROGRAMACapture(Sender: TObject;
  var Show: Boolean);
begin
   If Objeto.vgCvePrograma <> '' Then
      Show := False
   Else
      Show := (InterForma1.CanEdit)and(InterForma1.IsNewData);
end;


procedure TwMPrComRed.btCVE_FND_PROGRAMAClick(Sender: TObject);
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      Objeto.CVE_FND_ENT_DES.GetFromControl;
      Objeto.MPrgApoyo.BuscaWhereString :=
            'CR_FND_PROGRAMA.CVE_FND_ENT_DES =' + #39 + Objeto.CVE_FND_ENT_DES.AsString+ #39;
      Objeto.MPrgApoyo.FilterString := Objeto.MPrgApoyo.BuscaWhereString;
      Objeto.MPrgApoyo.ShowAll := True;
      If Objeto.MPrgApoyo.Busca Then
         InterForma1.NextTab(edCVE_FND_PROGRAMA);
   End;
end;



procedure TwMPrComRed.edCVE_FND_PROGRAMAExit(Sender: TObject);
Var
   VLSalida  :  boolean;
   VLMsg     :  String;
Begin
   If ((Objeto.Modo = moEdit) Or (Objeto.Modo=moAppend)) Then Begin
      VLMsg     := '';
      VlSalida  := True;
      Objeto.CVE_FND_PROGRAMA.GetFromControl;
      If Objeto.CVE_FND_PROGRAMA.AsString = '' Then Begin
         VLMsg := 'Favor de Indicar el Programa de Apoyo';
         VlSalida   := False;
      End;
      InterForma1.ValidaExit(edCVE_FND_PROGRAMA,VLSalida,VLMsg,True);
   End;
end;






procedure TwMPrComRed.ilCOMISIONEjecuta(Sender: TObject);
begin
   If Objeto.Comisiones.FindKey([ilCOMISION.Buffer]) Then
      InterForma1.NextTab(edCVE_COMISION);
end;


procedure TwMPrComRed.ilCOMISIONCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show:=(InterForma1.CanEdit)And(InterForma1.IsNewData);
end;


procedure TwMPrComRed.btCOMISIONClick(Sender: TObject);
begin
   Objeto.Comisiones.ShowAll := True;
   If Objeto.Comisiones.Busca Then
      InterForma1.NextTab(edCVE_COMISION);
end;

{}
procedure TwMPrComRed.btCOMISIONExit(Sender: TObject);
var
   VLSalida : Boolean;
   VlMsg, sSQL : String;
   qyQuery : TQuery;
begin
   If ((Objeto.Modo = moEdit) or (Objeto.Modo=moAppend)) Then Begin
      VLSalida := True;
      VLMsg := '';
      Objeto.CVE_COMISION.GetFromControl;
      If Objeto.CVE_COMISION.AsString = '' Then Begin
         VLSalida := False;
         VLMsg := 'Favor de Indicar la Comisión';
      End Else Begin
         If InterForma1.IsNewData Then Begin
            sSQL:= 'SELECT * FROM CR_FND_COM_PROG '+
                   ' WHERE ID_CREDITO ='+ Objeto.ID_CREDITO.AsSQL +
                   '   AND CVE_FND_ENT_DES ='+ SQLStr(Objeto.CVE_FND_ENT_DES.AsString) +
                   '   AND CVE_FND_PROGRAMA ='+ SQLStr(Objeto.CVE_FND_PROGRAMA.AsString) +
                   '   AND CVE_COMISION ='+ SQLStr(Objeto.CVE_COMISION.AsString);
            qyQuery:= GetSQLQuery(sSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False);
            If qyQuery <> Nil Then Begin
               If qyQuery.FieldByName('ID_CREDITO').AsInteger = Objeto.ID_CREDITO.AsInteger Then Begin
                  VLSalida := False;
                  VLMsg := 'El registro ya existe con estos datos';
               End;
               qyQuery.Free;
            End;
         End;
      End;





      InterForma1.ValidaExit(edCVE_COMISION,VlSalida,VlMsg,True);
   End;
end;
{}

procedure TwMPrComRed.rgCVE_TIPO_APLICAEnter(Sender: TObject);
begin
  if (InterForma1.CanEdit)And(InterForma1.IsNewData) then
    if rgCVE_TIPO_APLICA.ItemIndex = -1 then
      Objeto.CVE_TIPO_APLICA.AsString := Objeto.ObtTipoAplica;
end;

procedure TwMPrComRed.rgCVE_TIPO_APLICAExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgCVE_TIPO_APLICA,True,'',True);
end;
{}
{}
procedure TwMPrComRed.cbxB_GEN_COM_DISPExit(Sender: TObject);
begin
   InterForma1.ValidaExit(cbxB_GEN_COM_DISP,True,'',True);
end;
{}
procedure TwMPrComRed.rgSIT_COMIS_PROGExit(Sender: TObject);
begin
   InterForma1.ValidaExit(rgSIT_COMIS_PROG,True,'',True);
end;




procedure TwMPrComRed.sgDATOSClick(Sender: TObject);
begin
   If (sgDATOS.Cells[COL_CVE,sgDATOS.Row]<> '')Then
      Objeto.FindKey([sgDATOS.Cells[COL_CRE,sgDATOS.Row],
                      sgDATOS.Cells[COL_ENT,sgDATOS.Row],
                      sgDATOS.Cells[COL_PRO,sgDATOS.Row],
                      sgDATOS.Cells[COL_CVE,sgDATOS.Row]]);
end;





end.
