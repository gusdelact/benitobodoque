// Sistema         : Clase de CRCOMISEV
// Fecha de Inicio : 21/01/2005
// Función forma   : Clase de CRCOMISEV
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Ana Lilia Escalona Sosa
// Comentarios     :
Unit IntCrComisEv;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Grids, Aligrid, IntLinkit,

//unidades adicionales
  IntParamCre,
  IntGenCre,
  IntCrCatComi,
  IntCrCredito, InterEdit, Menus,
  //UNIDAD DE CALCULO DEL IVA
  UnTasaimp
  ; //Clase Credito
Const
   COL_PER = 0; //Period de la comisión
   COL_COM = 1; //Clave de Comisión
   COL_FVT = 2; //Fecha de Vencimiento
   COL_PCT = 3; //Porcentaje
   COL_IMP = 4; //Importe
   COL_IVA = 5; //Importe iva
   COL_TOT = 6; //Importe total
   COL_SIT = 7; //Situación

Type
 TCrComisEv= class; 

  TWCrComisEv=Class(TForm)
    InterForma1             : TInterForma;
    lbID_CREDITO: TLabel;
    edID_CREDITO: TEdit;
    btCREDITO: TBitBtn;
    edDESC_CREDITO: TEdit;
    lbCVE_COMISION: TLabel;
    edCVE_COMISION: TEdit;
    btCOMISION: TBitBtn;
    edDESC_COMISION: TEdit;
    lbCVE_DIA_APLICA: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    Label30: TLabel;
    Label1: TLabel;
    sgDATOS: TStringAlignGrid;
    Label26: TLabel;
    edF_VENCIMIENTO: TEdit;
    dtpF_VENCIMIENTO: TInterDateTimePicker;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    Label2: TLabel;
    MErrores: TMemo;
    ilCREDITO: TInterLinkit;
    ilCOMISION: TInterLinkit;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edIMP_COMISION: TInterEdit;
    edIMP_IVA: TInterEdit;
    edPCT_COMIS: TInterEdit;
    chB_APLICA_COM: TCheckBox;
    pmCOMEVENT: TPopupMenu;
    Disposicin1: TMenuItem;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure btCREDITOClick(Sender: TObject);
    procedure ilCREDITOEjecuta(Sender: TObject);
    procedure edID_CREDITOExit(Sender: TObject);
    procedure btCOMISIONClick(Sender: TObject);
    procedure ilCOMISIONEjecuta(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure edCVE_COMISIONExit(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    procedure edIMP_COMISIONExit(Sender: TObject);
    procedure Disposicin1Click(Sender: TObject);
    procedure btCOMISIONExit(Sender: TObject);
    private 
    { Private declarations }
           Procedure LlenaGrid;
           Function  StpGeneraComision(pIdCredito, pNumPeriodo, pPlazo: Integer; pCveComision,pAfectaImpCR: String;
                                       pFVencimiento: TDateTime;
                                       pPctComision, pImpComision, pImpIVA: Double): Boolean;
           Function  StpEliminaPer(pIdCredito: Integer; pNumPeriodo, pCveComision: String): Boolean;
    public
    { Public declarations } 
    Objeto : TCrComisEv;
end;
 TCrComisEv= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        //Calses Adicionales
        vgCredito                : String;
        vgComision               : String;
        Comisiones               : TCrCatComi;
        ParamCre                 : TParamCre;
        Credito                  : TCrCredito;

        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;

      published 
      end;

// ASTECI HERJA 16/12/2009  cambio de IVA de 15 a 16
var
  kTasaIVA : double;
//Fin HERJA IVA

implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrComisEv.Create( AOwner : TComponent ); 
begin Inherited;

      // ASTECI HERJA 16/12/2009  cambio de IVA de 15 a 16
      kTasaIVA :=  StrtoFloat(fDameIVA(Apli))/100;
      //Fin HERJA IVA

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrComisEv.Hlp';
      ShowMenuReporte:=True;

      Comisiones := TCrCatComi.Create(Self);
      Comisiones.MasterSource := self;
      Comisiones.BuscaWhereString := 'CR_CAT_COMISION.CVE_TIPO_COM = ''EV''';
      Comisiones.FilterString := Comisiones.BuscaWhereString;

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
      Credito.BuscaWhereString := 'CR_CREDITO.SIT_CREDITO NOT IN ( ''LQ'',''CA'')';
      Credito.FilterString := Credito.BuscaWhereString;
end;

Destructor TCrComisEv.Destroy;
begin
    if Comisiones <> nil then
       Comisiones.Free;
    //end if

    If Credito <> nil then
       Credito.free;
    //end if;

    inherited;
end;


function TCrComisEv.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrComisEv;
begin
   W:=TWCrComisEv.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftConsulta; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;

(***********************************************FORMA CRCOMISEV********************)
(*                                                                              *)
(*  FORMA DE CRCOMISEV                                                            *)
(*                                                                              *)
(***********************************************FORMA CRCOMISEV********************)

function TWCrComisEv.StpGeneraComision(pIdCredito, pNumPeriodo, pPlazo: Integer; pCveComision,pAfectaImpCR: String;
                                       pFVencimiento: TDateTime;
                                       pPctComision, pImpComision, pImpIVA: Double): Boolean;
var StpGenPerCom :  TStoredProc;
    vlResult : Boolean;
begin
    vlResult := True;
    // LOLS 30 ENE 2007. Valida que la comision exista en cr_comis_prog
    valComisProg( pIdCredito, pCveComision, Objeto.Apli );
    //
    StpGenPerCom := TStoredProc.Create(Self);
    try
       with StpGenPerCom do
       begin
          StpGenPerCom.DatabaseName:= Objeto.Apli.DatabaseName;
          StpGenPerCom.SessionName:= Objeto.Apli.SessionName;
          StpGenPerCom.StoredProcName:='PKGCRCOMISIONES.STPGENERACOMISION';
          Params.Clear;
          Params.CreateParam(ftInteger,'PEIDCREDITO',ptInput);
          Params.CreateParam(ftString,'PECVECOMISION',ptInput);
          Params.CreateParam(ftFloat,'PENUMPERIODO',ptInput);
          Params.CreateParam(ftString,'PEBCOBAUT',ptInput);
          Params.CreateParam(ftDateTime,'PEFVENCIMIENTO',ptInput);
          Params.CreateParam(ftFloat,'PEPCTCOMISION',ptInput);
          Params.CreateParam(ftFloat,'PEIMPCOMISION',ptInput);
          Params.CreateParam(ftFloat,'PEIMPIVA',ptInput);
          Params.CreateParam(ftInteger,'PEPLAZO',ptInput);
          Params.CreateParam(ftString,'PECVEUSUALTA',ptInput);
          Params.CreateParam(ftString,'PEBAFECTAIMPCR',ptInput);
          Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
          Prepare;
          ParamByName('peIdCredito').AsInteger := pIdcredito;
          ParamByName('peCveComision').AsString := pCveComision;
          ParamByName('peNumPeriodo').AsFloat := pNumPeriodo;
          ParamByName('peBCobAut').AsString := CVERDAD;
          ParamByName('peFVencimiento').AsDateTime := pFVencimiento;
          ParamByName('pePctComision').AsFloat := pPctComision;
          ParamByName('peImpComision').AsFloat := pImpComision;
          ParamByName('peImpIVA').AsFloat := pImpIVA;
          ParamByName('pePlazo').AsInteger := pPlazo;
          ParamByName('peCveUsuAlta').AsString := Objeto.Apli.Usuario;
          ParamByName('peBAfectaImpCR').AsString := pAfectaImpCR;
          ParamByName('peBCommit').AsString := CVERDAD;
          ExecProc;

          if ParamByName('psResultado').AsInteger <> 0 then
          Begin
             AddLine( MErrores, ParamByName('psRESULTADO'  ).AsString +
                                ParamByName('psTxResultado').AsString);
             vlResult := False;
          end;
       end;
    finally
       StpGenPerCom.Free;
    end;
    StpGeneraComision := vlResult;
end;

function TWCrComisEv.StpEliminaPer(pIdCredito: Integer; pNumPeriodo, pCveComision: String): Boolean;
var StpElimPer :  TStoredProc;
    vlResult : Boolean;
begin
    vlResult := True;
    StpElimPer := TStoredProc.Create(Self);
    try
       with StpElimPer do
       begin
          StpElimPer.DatabaseName:= Objeto.Apli.DatabaseName;
          StpElimPer.SessionName:= Objeto.Apli.SessionName;
          StpElimPer.StoredProcName:='PKGCRCOMISIONES.STPELIMINAPERCOMIS';
          Params.Clear;
          Params.CreateParam(ftInteger,'PEIDCREDITO',ptInput);
          Params.CreateParam(ftString,'PECVECOMISION',ptInput);
          Params.CreateParam(ftFloat,'PENUMPERIODO',ptInput);
          Params.CreateParam(ftString,'PECVEUSUMOD',ptInput);
          Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
          Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
          Prepare;
          ParamByName('peIdCredito').AsInteger := pIdcredito;
          ParamByName('peCveComision').AsString := pCveComision;
          ParamByName('peNumPeriodo').AsString := pNumPeriodo;
          ParamByName('peCveUsuMod').AsString := Objeto.Apli.Usuario;
          ParamByName('peBCommit').AsString := CVERDAD;
          ExecProc;

          if ParamByName('psResultado').AsInteger <> 0 then
          Begin
             AddLine( MErrores, ParamByName('psRESULTADO'  ).AsString +
                                ParamByName('psTxResultado').AsString);
             vlResult := False;
          end;
       end;
    finally
       StpElimPer.Free;
    end;
    StpEliminaPer := vlResult;
end;

procedure TWCrComisEv.FormShow(Sender: TObject);
begin
      lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := objeto.ParamCre.FECHA.AsString;
      lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

      dtpF_VENCIMIENTO.DateTime:= Objeto.Apli.DameFechaEmpresa;
      edF_VENCIMIENTO.text:=FormatDateTime('dd/mm/yyyy',dtpF_VENCIMIENTO.DateTime);

      Objeto.Credito.ID_CREDITO.Control := edID_CREDITO;
      Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := edDESC_CREDITO;
      Objeto.Credito.GetParams(Objeto);

      Objeto.Comisiones.CVE_COMISION.Control := edCVE_COMISION;
      Objeto.Comisiones.DESC_COMISION.Control := edDESC_COMISION;
      Objeto.Comisiones.GetParams(Objeto);
end;

procedure TWCrComisEv.FormDestroy(Sender: TObject);
begin
      Objeto.Credito.ID_CREDITO.Control := nil;
      Objeto.Credito.ContratoCre.Contrato.TITNombre.Control := nil;
      Objeto.Comisiones.CVE_COMISION.Control := nil;
      Objeto.Comisiones.DESC_COMISION.Control := nil;
end;

procedure TWCrComisEv.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrComisEv.btCREDITOClick(Sender: TObject);
begin
   Objeto.Credito.ShowAll := True;
   if Objeto.Credito.Busca then
      InterForma1.NextTab(edID_CREDITO);
   //end; if
end;

procedure TWCrComisEv.ilCREDITOEjecuta(Sender: TObject);
begin
   if Objeto.Credito.FindKey([ilCREDITO.Buffer]) then
      InterForma1.NextTab(edID_CREDITO);
   //Eend if
end;

procedure TWCrComisEv.edID_CREDITOExit(Sender: TObject);
var     VLSalida : Boolean;
        VlMsg    : String;
begin
   if edID_CREDITO.Text <> CNULL then
   Begin
      Objeto.Comisiones.BuscaWhereString := ' CR_CAT_COMISION.CVE_COMISION IN ' +
                                            ' (SELECT CVE_COMISION FROM CR_PRODUCTO_COM WHERE CVE_PRODUCTO_CRE = ' +
                                            SQLStr( Objeto.Credito.ContratoCre.CVE_PRODUCTO_CRE.AsString ) + ')' +
                                            ' AND CR_CAT_COMISION.CVE_TIPO_COM = ''EV''';
      Objeto.Comisiones.FilterString := Objeto.Comisiones.BuscaWhereString;
      LlenaGrid;
   end;
end;

procedure TWCrComisEv.btCOMISIONClick(Sender: TObject);
begin
   Objeto.Comisiones.ShowAll := True;
   if Objeto.Comisiones.Busca then
      InterForma1.NextTab(edCVE_COMISION);
   //end if
end;

procedure TWCrComisEv.ilCOMISIONEjecuta(Sender: TObject);
begin
   if Objeto.Comisiones.FindKey([ilCOMISION.Buffer]) then
      InterForma1.NextTab(edCVE_COMISION);
   //end if
end;

procedure TWCrComisEv.LlenaGrid;
Var Qry         : TQuery;
    i,nRowCount : Integer;
    vlSql       : String;
begin
  with sgDATOS do
  begin
     ClearGrid(sgDATOS);
     Application.ProcessMessages;
     for i:= 0 to RowCount-1 do
        RemoveRow(Row);
     //end for
  end;
  Application.ProcessMessages;

  vlSql :=  ' SELECT  CC.NUM_PERIODO,   ' + coCRLF +
            '         CCC.CVE_COMISION,   ' + coCRLF +
            '         CC.F_VENCIMIENTO,   ' + coCRLF +
            '         CC.PCT_COMISION,   ' + coCRLF +
            '         CC.IMP_COMISION,   ' + coCRLF +
            '         CC.IMP_IVA,   ' + coCRLF +
            '         ( CC.IMP_COMISION + CC.IMP_IVA ) IMP_COM_TOTAL,   ' + coCRLF +
            '         CC.SIT_COMISION   ' + coCRLF +

            ' FROM CR_COMISION     CC,    ' + coCRLF +
            '      CR_CAT_COMISION CCC    ' + coCRLF +

            ' WHERE CC.ID_CREDITO    = ' + edID_CREDITO.Text + coCRLF +
            '   AND CCC.CVE_TIPO_COM = ''EV'' ' + coCRLF + 
            '   AND CCC.CVE_COMISION = CC.CVE_COMISION' + coCRLF;

  nRowCount := 0;
  with Objeto do
  Begin
    Qry := GetSQLQueryNoNil( vlSql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, False );
    if Assigned(Qry) and NOT( Qry.IsEmpty ) THEN
    begin
       while Not Qry.Eof Do
       begin
          with sgDATOS do
          begin
             //LLENA EL RENGLON
             Cells[COL_PER,nRowCount] := Qry.FieldByName('NUM_PERIODO').AsString;
             Cells[COL_COM,nRowCount] := Qry.FieldByName('CVE_COMISION').AsString;
             Cells[COL_FVT,nRowCount] := Qry.FieldByName('F_VENCIMIENTO').AsString;
             Cells[COL_PCT,nRowCount] := Format(CFORMAT_TASA,[ Qry.FieldByName('PCT_COMISION').AsFloat ] );
             Cells[COL_IMP,nRowCount] := Format(CFORMAT_DINERO,[ Qry.FieldByName('IMP_COMISION').AsFloat ] );
             Cells[COL_IVA,nRowCount] := Format(CFORMAT_TASA,[ Qry.FieldByName('IMP_IVA').AsFloat ] );
             Cells[COL_TOT,nRowCount] := Format(CFORMAT_DINERO,[ Qry.FieldByName('IMP_COM_TOTAL').AsFloat ] );
             Cells[COL_SIT,nRowCount] := Qry.FieldByName('SIT_COMISION').AsString;

             nRowCount := nRowCount + 1;     //Incrementa un reglon
          end;
          Qry.Next;
          sgDATOS.RowCount := nRowCount + 1;
          Application.ProcessMessages;
       end; //end While
    end;
  end;
  if Assigned(Qry) then
  begin
    Qry.Close;
    Qry.Free;
  end;
end;

procedure TWCrComisEv.BitBtn2Click(Sender: TObject);
var vlAfectaImpCR : String;
begin
   MErrores.Lines.Clear;
   if ( edID_CREDITO.Text <> CNULL ) AND (edCVE_COMISION.Text <> CNULL) then
   Begin
     if MessageDlg('¿Desea Generar la comisión ?. ', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
     Begin
        if chB_APLICA_COM.Checked then
           vlAfectaImpCR := 'V'
        else vlAfectaImpCR := 'F';

        MessageIniFinProceso( MErrores, cInicio );
        IF StpGeneraComision(Objeto.Credito.ID_CREDITO.AsInteger, 0, 0,
                             Objeto.Comisiones.CVE_COMISION.AsString,vlAfectaImpCR,
                             StrToDateTime(edF_VENCIMIENTO.Text), StrToFloat(edPCT_COMIS.Text),
                             StrToFloat(edIMP_COMISION.Text), StrToFloat(edIMP_IVA.Text)) THEN
           ShowMessage('La comisión se ha generado correctamente')
        ELSE ShowMessage('Err. al generar la comisión');
        MessageIniFinProceso( MErrores, cFinal );
        LlenaGrid;
     end;
   end
   else
        AddLine( MErrores, 'Favor de indicar la disposición o la clave de comisión');

end;

procedure TWCrComisEv.edCVE_COMISIONExit(Sender: TObject);
var vlImpIVA : Double;
begin
   //<LOLS 14 JUN 2006.CREDITO EN LINEA>
   //IF Objeto.Comisiones.B_PORCENTAJE.AsString = 'V' THEN Begin
   IF Objeto.Comisiones.CVE_TIPO_COBRO.AsString = C_TCOB_COM_PC THEN Begin
   //</LOLS>
      edPCT_COMIS.Text := Objeto.Comisiones.PCT_COMISION.AsString;
      edIMP_COMISION.Enabled := False;
      edIMP_COMISION.Color := clBtnFace;
      edIMP_COMISION.Text := '0';
      edIMP_IVA.Enabled := False;
      edIMP_IVA.Color := clBtnFace;
      edIMP_IVA.Text :='0';
      //<LOLS 14 JUN 2006.CREDITO EN LINEA>
      //if Objeto.Comisiones.B_MODIFICA_PCT.AsString = 'V' THEN BEGIN
      if Objeto.Comisiones.B_MODIFICA_CAT.AsString = 'V' THEN BEGIN
      //</LOLS>
        edPCT_COMIS.Enabled := True;
        edPCT_COMIS.Color := clWindow;
      END
      else
      Begin
         edPCT_COMIS.Enabled := False;
         edPCT_COMIS.Color := clBtnFace;
      end;
   end
   ELSE BEGIN
      edIMP_COMISION.Text := Objeto.Comisiones.IMP_COMISION.AsString;
      //CORRECCION DE IVA DE 15 A 16
      //ASTECI HERJA 16/12/2009
      //vlImpIVA := Objeto.Comisiones.IMP_COMISION.AsFloat * 0.15;
      vlImpIVA := Objeto.Comisiones.IMP_COMISION.AsFloat * kTasaIVA;
      //FIN DE CORRECCION
      edIMP_COMISION.Text := FloatToStr(vlImpIVA);
      edPCT_COMIS.Enabled := False;
      edPCT_COMIS.Color := clBtnFace;
      edPCT_COMIS.Text  := '0';
      //<LOLS 14 JUN 2006.CREDITO EN LINEA>
      //if Objeto.Comisiones.B_MODIFICA_IMP.AsString = 'V' THEN BEGIN
      if Objeto.Comisiones.B_MODIFICA_CAT.AsString = 'V' THEN BEGIN
      //</LOLS>
        edIMP_COMISION.Enabled := True;
        edIMP_COMISION.Color := clWindow;
        edIMP_IVA.Enabled := True;
        edIMP_IVA.Color := clWindow;
      end
      else
      Begin
        edIMP_COMISION.Enabled := False;
        edIMP_COMISION.Color := clBtnFace;
        edIMP_IVA.Enabled := False;
        edIMP_IVA.Color := clBtnFace;
      end;
   END;
end;

procedure TWCrComisEv.InterForma1DespuesShow(Sender: TObject);
begin
    if Objeto.vgCredito <> '' then
       Objeto.Credito.FindKey([Objeto.vgCredito]);
    //end if;
    if Objeto.vgComision  <> '' then
       Objeto.Comisiones.FindKey([Objeto.vgComision]);
    //end if;
end;

procedure TWCrComisEv.edIMP_COMISIONExit(Sender: TObject);
var vlPctIVA : Double;
begin
   vlPctIVA:= StpPctIVA( Objeto.Credito.ID_CONTRATO.AsInteger,
                         Objeto.Credito.ID_CREDITO.AsInteger,
                         StrToFloat(edIMP_COMISION.Text),
                         Objeto.Apli)/ 100;
   edIMP_IVA.Text := FloatToStr( StrToFloat(edIMP_COMISION.Text) * vlPctIVA );
end;

procedure TWCrComisEv.Disposicin1Click(Sender: TObject);
begin

   if MessageDlg('¿Está seguro de eliminar el periodo <<' + sgDATOS.Cells[0,sgDATOS.Row] + '>>' +
      ' de la comisión <<'+sgDATOS.Cells[1,sgDATOS.Row]+'>>',
       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   Begin
      MessageIniFinProceso( MErrores, cInicio );
      IF StpEliminaPer( Objeto.Credito.ID_CREDITO.AsInteger,
                        sgDATOS.Cells[0,sgDATOS.Row], sgDATOS.Cells[1,sgDATOS.Row]) THEN
               MessageIniFinProceso( MErrores, cFinal )
            ELSE
               ShowMessage('Err. al Eliminar el periodo de comisión');
   end;
   LlenaGrid;
end;


procedure TWCrComisEv.btCOMISIONExit(Sender: TObject);
var vlImpIVA : Double;
begin
   //<LOLS 14 JUN 2006.CREDITO EN LINEA>
   //IF Objeto.Comisiones.B_PORCENTAJE.AsString = 'V' THEN Begin
   IF Objeto.Comisiones.CVE_TIPO_COBRO.AsString = C_TCOB_COM_PC THEN Begin
   //</LOLS>
      edPCT_COMIS.Text := Objeto.Comisiones.PCT_COMISION.AsString;
      edIMP_COMISION.Enabled := False;
      edIMP_COMISION.Color := clBtnFace;
      edIMP_COMISION.Text := '0';
      edIMP_IVA.Enabled := False;
      edIMP_IVA.Color := clBtnFace;
      edIMP_IVA.Text :='0';
      //<LOLS 14 JUN 2006.CREDITO EN LINEA>
      //if Objeto.Comisiones.B_MODIFICA_PCT.AsString = 'V' THEN BEGIN
      if Objeto.Comisiones.B_MODIFICA_CAT.AsString = 'V' THEN BEGIN
      //</LOLS>
        edPCT_COMIS.Enabled := True;
        edPCT_COMIS.Color := clWindow;
      END
      else
      Begin
         edPCT_COMIS.Enabled := False;
         edPCT_COMIS.Color := clBtnFace;
      end;
   end
   ELSE BEGIN
      edIMP_COMISION.Text := Objeto.Comisiones.IMP_COMISION.AsString;
      //CORRECCION DE IVA DE 15 A 16
      //ASTECI HERJA 16/12/2009
      //vlImpIVA := Objeto.Comisiones.IMP_COMISION.AsFloat * 0.15;
      vlImpIVA := Objeto.Comisiones.IMP_COMISION.AsFloat * kTasaIVA;
      //FIN DE CORRECCION
      edIMP_COMISION.Text := FloatToStr(vlImpIVA);
      edPCT_COMIS.Enabled := False;
      edPCT_COMIS.Color := clBtnFace;
      edPCT_COMIS.Text  := '0';
      //<LOLS 14 JUN 2006.CREDITO EN LINEA>
      //if Objeto.Comisiones.B_MODIFICA_IMP.AsString = 'V' THEN BEGIN
      if Objeto.Comisiones.B_MODIFICA_CAT.AsString = 'V' THEN BEGIN
      //</LOLS>
        edIMP_COMISION.Enabled := True;
        edIMP_COMISION.Color := clWindow;
        edIMP_IVA.Enabled := True;
        edIMP_IVA.Color := clWindow;
      end
      else
      Begin
        edIMP_COMISION.Enabled := False;
        edIMP_COMISION.Color := clBtnFace;
        edIMP_IVA.Enabled := False;
        edIMP_IVA.Color := clBtnFace;
      end;
   END;
end;

end.
