// Sistema         : Clase de CrVencAnt
// Fecha de Inicio : 08/02/2011
// Función forma   : Clase de CrVencAnt
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : 
// Comentarios     :

Unit IntCrVencAnt;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Excel97, OleServer, IntSGCtrl,
//Clases Adicionales
IntParamCre,IntCrActPa, Gauges, Grids, Aligrid,IntGenCre, ImgList,
IntCrCredito,     //Disposición
IntCrAcredit,     //Acreditado
IntLinkit;

Const
   coCRLF      = #13#10;
   CO_COL_IDCREDITO  = 0;

   CO_COL_CAP        = CO_COL_IDCREDITO + 1;
   CO_COL_FA         = CO_COL_CAP + 1;
   CO_COL_INT        = CO_COL_FA  + 1;

   CO_COL_SITPROCESO = CO_COL_INT + 1;
   CO_COL_SITCRE     = CO_COL_SITPROCESO + 1;
   CO_COL_CHECK      = CO_COL_SITCRE + 1;

   CO_ERROR     = 'ERR';  // Mensaje de Error
   CO_CHECKED   = 'V';
   CO_UNCHECKED = 'F';
   CO_NOTCHECK  = '-';

Type
 TCrVencAnt= class; 

  TWCrVencAnt=Class(TForm)
    InterForma1             : TInterForma; 
    edCAMPO1 : TEdit;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    GBVenc: TGroupBox;
    lbArchivoEntrada: TLabel;
    sbArchivoEntrada: TSpeedButton;
    edArchivoEntrada: TEdit;
    bbImportar: TBitBtn;
    pAniBar: TPanel;
    ExcelWorksheetI: TExcelWorksheet;
    ExcelApplicationI: TExcelApplication;
    ExcelWorkbookI: TExcelWorkbook;
    btPROC_INFO: TBitBtn;
    GBAutorizacion: TGroupBox;
    MemoMessages: TMemo;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    Shape10: TShape;
    Label14: TLabel;
    Label10: TLabel;
    Label15: TLabel;
    Label12: TLabel;
    Label4: TLabel;
    Shape11: TShape;
    Label9: TLabel;
    strgrdVenc: TStringGrid;
    Label1: TLabel;
    Ropcion: TRadioGroup;
    GBreversa: TGroupBox;
    BnMostrar: TBitBtn;
    odArchivoEntrada: TOpenDialog;
    ImageList: TImageList;
    Lcreditos: TListBox;
    Label16: TLabel;
    edID_ACREDITADO: TEdit;
    btID_ACREDITADO: TBitBtn;
    edNOMBRE_ACRED: TEdit;
    cbAcreditado: TCheckBox;
    Label17: TLabel;
    edID_CESION: TEdit;
    btID_CESION: TBitBtn;
    edCESION: TEdit;
    chbxCESION: TCheckBox;
    ilCesion: TInterLinkit;
    ilACREDITADO: TInterLinkit;
    BBBusca: TBitBtn;
    lbLiqF_INICIO: TLabel;
    dtpF_Aplicacion: TInterDateTimePicker;
    edF_Aplicacion: TEdit;


    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure bbImportarClick(Sender: TObject);
    procedure bnMostrarClick(Sender: TObject);

    Procedure ReQueryVA(peID_CREDITO : String; nfila:boolean; var irow:word);
    procedure sbArchivoEntradaClick(Sender: TObject);
    procedure btPROC_INFOClick(Sender: TObject);
    procedure strgrdVencDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure RopcionClick(Sender: TObject);
    procedure strgrdVencMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edID_CESIONChange(Sender: TObject);
    procedure ilCesionCapture(Sender: TObject; var Show: Boolean);
    procedure ilCesionEjecuta(Sender: TObject);
    procedure ilACREDITADOEjecuta(Sender: TObject);
    procedure edID_ACREDITADOChange(Sender: TObject);
    procedure chbxCESIONClick(Sender: TObject);
    procedure cbAcreditadoClick(Sender: TObject);
    procedure btID_ACREDITADOClick(Sender: TObject);
    procedure btID_CESIONClick(Sender: TObject);
    procedure ilACREDITADOCapture(Sender: TObject; var Show: Boolean);
    procedure BBBuscaClick(Sender: TObject);
    procedure edF_AplicacionChange(Sender: TObject);


    private 
    { Private declarations }
    procedure InvertCheck(StrinGrid : TStringGrid; nCol, nRow : Integer);

    public 
    { Public declarations } 
    Objeto : TCrVencAnt;

    Procedure ValidaPagos(PPID_Credito : Integer);
    Procedure ValidaCredito(PPID_Credito :Integer);
    Procedure Traspaso(PPID_Credito : Integer);
    Procedure Reversa_Traspaso(PPID_Credito : Integer);
    procedure ConfGrid( SGrid : TStringGrid );
    Procedure BarridoCadena(PPID_Credito, PPCadena : String);
    procedure EnableCheckBox(var CheckBox : TCheckBox; var obID, obDESC : Tedit);
    procedure Buscanombre(vlID_CREDITO : String);
end;
 TCrVencAnt= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        CAMPO1                   : TInterCampo;

        //Clases Adicionales
        ParamCre                 : TParamCre;
        Credito                  : TCrCredito;//Disposición
        Acreditado               : TCrAcredit;

        VGCredito                : Integer;
        CadenaSql                : String;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override; 
 ///       function    Reporte:Boolean; override;

      published 
      end;


var
    vlIMP_CAP_ANT, vlIMP_INT_ANT, vlIMP_FA_ANT : single;
    vlSIT_PROCESO, vlSIT_CREDITO, vlTXT_DESCRIPCION, vlF_VENC_ANT:string;

    vlID_CREDITO, vlF_APLICACION:STRING;

    nRow : word;
    vlError : String;        

    vlQry: TQuery;
    vlSql: string;

implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrVencAnt.Create( AOwner : TComponent ); 
begin Inherited; 
      CAMPO1 :=CreaCampo('CAMPO1',ftString,tsNinguno,tsNinguno,False);
                CAMPO1.Caption:='Campo1';
                CAMPO1.Parametro:='CAMPO1';

      Credito := TCrCredito.Create(Self);
      Credito.MasterSource:=Self;
      Credito.FieldByName('ID_CREDITO').MasterField:='ID_CREDITO';

      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource := Self;

      StpName  := ' '; 
      UseQuery := False; 
      HelpFile := 'IntCrVencAnt.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrVencAnt.Destroy;
begin
   if Credito <> nil then
      Credito.Free;

   if Acreditado <> nil then
      Acreditado.Free;
            
   inherited;      
end;


function TCrVencAnt.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrVencAnt;
begin
   W:=TWCrVencAnt.Create(Self);
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


Function TCrVencAnt.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrvenca.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

{
function TCrVencAnt.Reporte:Boolean;
begin //Execute_Reporte();
end;
 }


(***********************************************FORMA CrVencAnt********************)
(*                                                                              *)
(*  FORMA DE CrVencAnt                                                            *)
(*                                                                              *)
(***********************************************FORMA CrVencAnt********************)

procedure TWCrVencAnt.Buscanombre(vlID_CREDITO : String);
begin
   edCESION.Text:='';
 vlSql :='SELECT NOMBRE FROM PERSONA ' +
         ' WHERE ID_PERSONA IN (SELECT ID_TITULAR FROM CONTRATO ' +
         '                       WHERE ID_CONTRATO IN (SELECT ID_CONTRATO FROM CR_CREDITO ' +
         '      		                       WHERE ID_CREDITO = '+vlID_CREDITO+
	 '	       		                      ) ' +
         '                     ) ';

    vlQry := GetSQLQuery(vlSql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );

    try
      if vlQry <> nil then
      begin
         edCESION.Text :=  vlQry.FieldByName('NOMBRE').asString;
      end;
   finally
        if vlQry <> nil then vlQry.free;
    end;
end;

procedure TWCrVencAnt.EnableCheckBox(var CheckBox : TCheckBox; var obID, obDESC : Tedit);
begin
    If Not CheckBox.Checked Then
    Begin
        CheckBox.Checked:=False;
        CheckBox.Enabled:=False;

        obID.Text:='';
        obDESC.Text:='';
    End
    Else
    Begin
        CheckBox.Checked:=True;
        CheckBox.Enabled:=True;
    End;
end;

procedure TWCrVencAnt.ConfGrid( SGrid : TStringGrid );
begin
 With SGrid Do
   Begin
      ColCount := 7;

      RowHeights[0] := DefaultRowHeight;
      RowCount := 1;

      ColWidths[CO_COL_IDCREDITO] := 79;
      ColWidths[CO_COL_CAP] := 110;
      ColWidths[CO_COL_INT] := 110;
      ColWidths[CO_COL_FA] := 110;
      ColWidths[CO_COL_SITPROCESO] := 115;
      ColWidths[CO_COL_SITCRE] := 120;

      ColWidths[CO_COL_CHECK] := 30;
    End;
end;

procedure TWCrVencAnt.InvertCheck(StrinGrid : TStringGrid; nCol, nRow : Integer);
begin
 With (StrinGrid) Do
  If (Cells[nCol, nRow] <>  CO_NOTCHECK) Then
   Begin
     If (Cells[nCol, nRow] = CO_CHECKED) Then
        Cells[nCol, nRow] := CO_UNCHECKED
     Else
        Cells[nCol, nRow] := CO_CHECKED;
   End;
end;

Procedure TWCrVencAnt.BarridoCadena(PPID_Credito, PPCadena : String);
var
   vlIndex, vlTotal, vlCiclo: Integer;
   vlCar,vlRenglon: String;
begin
   vlTotal:= Length (Trim(PPCadena));
   vlRenglon:='';
   vlCiclo:=1;

   for vlIndex := 1 to vlTotal do
   begin
      vlCar:= Copy(PPCadena, vlIndex, 1);
      if  vlCar = ';' then
      begin
         if vlCiclo=1 then
         begin
            MemoMessages.Lines.Add(PPID_Credito+'. . .'+Trim(vlRenglon));
            vlCiclo:=2;
         end
         else
            MemoMessages.Lines.Add('                '+Trim(vlRenglon));
         vlRenglon:='';
      end
      else
         vlRenglon:=vlRenglon+vlCar;
   end;
   if Length(vlRenglon)>0 then
        if vlCiclo=1 then
           MemoMessages.Lines.Add(PPID_Credito+'. . .'+Trim(vlRenglon))
        else
           MemoMessages.Lines.Add('                '+Trim(vlRenglon));

end;


Procedure  TWCrVencAnt.ValidaPagos(PPID_Credito : Integer);
var STPVencant  : TStoredProc;
 vlResultado: String;
begin
     try
        STPVencant:=TStoredProc.Create(Nil);
        STPVencant.DatabaseName:=Objeto.Apli.DatabaseName;
        STPVencant.SessionName:=Objeto.Apli.SessionName;

        STPVencant.StoredProcName:='PKGCR_VENCIMIENTO_ANTICIPADO.STP_VALIDA_PAGOS';
        STPVencant.Params.CreateParam(ftInteger,'PEID_CREDITO',ptInput);
        STPVencant.Params.CreateParam(ftString,'PECVEFNDENTDES',ptInput);
        STPVencant.Params.CreateParam(ftString,'PECVEFNDPROGRAMA',ptInput);
        STPVencant.Params.CreateParam(ftString,'PETIPO_CRED',ptInput);
        STPVencant.Params.CreateParam(ftString,'PSSIT_PROCESO',ptOutput);
        STPVencant.Params.CreateParam(ftString,'PSSIT_CREDITO',ptOutput);
        STPVencant.Params.CreateParam(ftString,'PSTXT_DESCRIPCION',ptOutput);
        STPVencant.Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
        STPVencant.Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);

        STPVencant.Prepare;

        STPVencant.ParamByName('PEID_CREDITO').AsInteger := PPID_Credito;
        STPVencant.ParamByName('PECVEFNDENTDES').AsString := '';
        STPVencant.ParamByName('PECVEFNDPROGRAMA').AsString := '';
        STPVencant.ParamByName('PETIPO_CRED').AsString := 'AC';
        STPVencant.ExecProc;

        vlSIT_PROCESO := STPVencant.ParamByName('psSIT_PROCESO').AsString;
        vlSIT_CREDITO := STPVencant.ParamByName('psSIT_CREDITO').AsString;
        vlTXT_DESCRIPCION := STPVencant.ParamByName('psTXT_DESCRIPCION').AsString;

        if (STPVencant.ParamByName('PSRESULTADO').AsInteger <> 0) then
        begin
                vlResultado := 'PROBLEMAS AL VALIDAR CRÉDITO ';
                vlTXT_DESCRIPCION:=IntToStr(STPVencant.ParamByName('PSRESULTADO').AsInteger) + STPVencant.ParamByName('PSTXRESULTADO').AsString + ';' + vlTXT_DESCRIPCION;
                ShowMessage(vlResultado);
        end;
   finally
          STPVencant.Free;
   end;
end;


// Crea el proceso de llamado al paquete de validación
Procedure  TWCrVencAnt.ValidaCredito(PPID_Credito : Integer);
var STPVencant  : TStoredProc;
 vlResultado: String;
begin
     try
        STPVencant:=TStoredProc.Create(Nil);
        STPVencant.DatabaseName:=Objeto.Apli.DatabaseName;
        STPVencant.SessionName:=Objeto.Apli.SessionName;
        STPVencant.StoredProcName:='PKGCR_VENCIMIENTO_ANTICIPADO.STP_VALIDA_CREDITO';
        STPVencant.Params.CreateParam(ftInteger,'peID_CREDITO',ptInput);
        STPVencant.Params.CreateParam(ftString,'peFALTA',ptInput);
        STPVencant.Params.CreateParam(ftString,'peCveUsuario',ptInput);
        STPVencant.Params.CreateParam(ftString,'peB_COMMIT',ptInput);

        STPVencant.Params.CreateParam(ftFloat,'psIMP_CAP_ANT',ptOutput);
        STPVencant.Params.CreateParam(ftFloat,'psIMP_INT_ANT',ptOutput);
        STPVencant.Params.CreateParam(ftFloat,'psIMP_FA_ANT',ptOutput);
        STPVencant.Params.CreateParam(ftString,'psSIT_PROCESO',ptOutput);
        STPVencant.Params.CreateParam(ftString,'psSIT_CREDITO',ptOutput);
        STPVencant.Params.CreateParam(ftString,'psTXT_DESCRIPCION',ptOutput);

        STPVencant.Params.CreateParam(ftFloat,'psResultado',ptOutput);
        STPVencant.Params.CreateParam(ftString,'psTxResultado',ptOutput);

        STPVencant.Prepare;

        STPVencant.ParamByName('peID_CREDITO').AsInteger := PPID_Credito;
        STPVencant.ParamByName('peFALTA').AsDatetime := StrToDateTime(vlF_APLICACION); //Objeto.Apli.DameFechaEmpresa;
        STPVencant.ParamByName('peCveUsuario').AsString := Objeto.Apli.Usuario;
        STPVencant.ParamByName('peB_COMMIT').AsString := 'V';
        STPVencant.ExecProc;

        if (STPVencant.ParamByName('psResultado').AsInteger = 0) then
        begin
           vlIMP_CAP_ANT := STPVencant.ParamByName('psIMP_CAP_ANT').AsFloat;
           vlIMP_INT_ANT := STPVencant.ParamByName('psIMP_INT_ANT').AsFloat;
           vlIMP_FA_ANT := STPVencant.ParamByName('psIMP_FA_ANT').AsFloat;

        end;

        vlSIT_PROCESO := STPVencant.ParamByName('psSIT_PROCESO').AsString;
        vlSIT_CREDITO := STPVencant.ParamByName('psSIT_CREDITO').AsString;
        vlTXT_DESCRIPCION := STPVencant.ParamByName('psTXT_DESCRIPCION').AsString;

        if (STPVencant.ParamByName('psResultado').AsInteger <> 0) then
        begin
                vlResultado := 'PROBLEMAS AL VALIDAR CRÉDITO ';
                vlTXT_DESCRIPCION:=IntToStr(STPVencant.ParamByName('psResultado').AsInteger) + STPVencant.ParamByName('psTxResultado').AsString + ';' + vlTXT_DESCRIPCION;
                ShowMessage(vlResultado);
        end;
   finally
          STPVencant.Free;
   end;
end;


Procedure  TWCrVencAnt.Traspaso(PPID_Credito : Integer);
var STPTraspaso  : TStoredProc;
vlResultado: String;
begin
     try
          STPTraspaso:=TStoredProc.Create(Nil);
          STPTraspaso.DatabaseName:=Objeto.Apli.DatabaseName;
          STPTraspaso.SessionName:=Objeto.Apli.SessionName;
          STPTraspaso.StoredProcName:='PKGCR_VENCIMIENTO_ANTICIPADO.STP_TRASPASO_PA2IMP';

          STPTraspaso.Params.CreateParam(ftInteger,'peID_CREDITO',ptInput);
          STPTraspaso.Params.CreateParam(ftString,'peFPeriodoIns',ptInput);
          STPTraspaso.Params.CreateParam(ftString,'peCveUsuario',ptInput);
          STPTraspaso.Params.CreateParam(ftString,'peB_COMMIT',ptInput);

          STPTraspaso.Params.CreateParam(ftFloat,'psIMP_CAP_ANT',ptOutput);
          STPTraspaso.Params.CreateParam(ftFloat,'psIMP_INT_ANT',ptOutput);
          STPTraspaso.Params.CreateParam(ftFloat,'psIMP_FA_ANT',ptOutput);
          STPTraspaso.Params.CreateParam(ftString,'psSIT_PROCESO',ptOutput);
          STPTraspaso.Params.CreateParam(ftString,'psSIT_CREDITO',ptOutput);
          STPTraspaso.Params.CreateParam(ftString,'psTXT_DESCRIPCION',ptOutput);

          STPTraspaso.Params.CreateParam(ftFloat,'psResultado',ptOutput);
          STPTraspaso.Params.CreateParam(ftString,'psTX_RESULTADO',ptOutput);

          STPTraspaso.Prepare;

          STPTraspaso.ParamByName('peID_CREDITO').AsInteger := PPID_Credito;
          STPTraspaso.ParamByName('peFPeriodoIns').AsDatetime := StrToDateTime(vlF_APLICACION); //Objeto.Apli.DameFechaEmpresa;
          STPTraspaso.ParamByName('peCveUsuario').AsString := Objeto.Apli.Usuario;
          STPTraspaso.ParamByName('peB_COMMIT').AsString := 'V';
          STPTraspaso.ExecProc;

          if (STPTraspaso.ParamByName('psResultado').AsInteger = 0) then
          begin
             vlIMP_CAP_ANT := STPTraspaso.ParamByName('psIMP_CAP_ANT').AsFloat;
             vlIMP_INT_ANT := STPTraspaso.ParamByName('psIMP_INT_ANT').AsFloat;
             vlIMP_FA_ANT := STPTraspaso.ParamByName('psIMP_FA_ANT').AsFloat;
          end;

          vlSIT_PROCESO := STPTraspaso.ParamByName('psSIT_PROCESO').AsString;
          vlSIT_CREDITO := STPTraspaso.ParamByName('psSIT_CREDITO').AsString;
          vlTXT_DESCRIPCION := STPTraspaso.ParamByName('psTXT_DESCRIPCION').AsString;

          if (STPTraspaso.ParamByName('psResultado').AsInteger <> 0) then
          begin
                vlResultado := 'PROBLEMAS AL TRASPASAR CRÉDITO ';
                vlTXT_DESCRIPCION:=IntToStr(STPTraspaso.ParamByName('psResultado').AsInteger) + STPTraspaso.ParamByName('psTX_RESULTADO').AsString + ';' + vlTXT_DESCRIPCION;
                ShowMessage(vlResultado);
          end;
     finally
            STPTraspaso.Free;
     end;
end;



Procedure  TWCrVencAnt.Reversa_Traspaso(PPID_Credito : Integer);
var STPReverso  : TStoredProc;
vlResultado: String;
begin
     try
          STPReverso:=TStoredProc.Create(Nil);
          STPReverso.DatabaseName:=Objeto.Apli.DatabaseName;
          STPReverso.SessionName:=Objeto.Apli.SessionName;
          STPReverso.StoredProcName:='PKGCR_VENCIMIENTO_ANTICIPADO.STP_RESTAURA_TRASPASOPA2IMP';

          STPReverso.Params.CreateParam(ftString,'PEFAPLICACION',ptInput);
          STPReverso.Params.CreateParam(ftInteger,'PEID_CREDITO',ptInput);
          STPReverso.Params.CreateParam(ftString,'PECVE_USUARIO',ptInput);
          STPReverso.Params.CreateParam(ftInteger,'PEBCOMMIT',ptInput);
          STPReverso.Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
          STPReverso.Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);

          STPReverso.Prepare;

          STPReverso.ParamByName('PEFAPLICACION').AsDatetime := Objeto.Apli.DameFechaEmpresa;
          STPReverso.ParamByName('PEID_CREDITO').AsInteger := PPID_Credito;
          STPReverso.ParamByName('PECVE_USUARIO').AsString := Objeto.Apli.Usuario;
          STPReverso.ParamByName('PEBCOMMIT').AsString := 'V';
          STPReverso.ExecProc;

          if (STPReverso.ParamByName('PSRESULTADO').AsInteger = 0) then
          begin
             vlIMP_CAP_ANT := 0;
             vlIMP_INT_ANT := 0;
             vlIMP_FA_ANT := 0;

             vlSIT_PROCESO := 'RV';
             vlSIT_CREDITO := 'RV';
             vlTXT_DESCRIPCION := ' ';
          end;

          if (STPReverso.ParamByName('PSRESULTADO').AsInteger <> 0) then
          begin
                vlResultado := 'PROBLEMAS AL REVERSAR CRÉDITO ';
                vlTXT_DESCRIPCION:=IntToStr(STPReverso.ParamByName('psResultado').AsInteger) + STPReverso.ParamByName('PSTXRESULTADO').AsString + ';' + vlTXT_DESCRIPCION;
                ShowMessage(vlResultado);
          end;
     finally
            STPReverso.Free;
     end;
end;

Procedure  TWCrVencAnt.ReQueryVA(peID_CREDITO : String; nfila:boolean; var irow:word);
var vlMemo_Leyenda: string;
begin

  With strgrdVenc Do
   Begin
      Cells[CO_COL_CHECK, irow] := CO_UNCHECKED;

      Cells[CO_COL_IDCREDITO, irow] := peID_CREDITO;
      Cells[CO_COL_CAP, irow] := FormatFloat('###,##0.00',vlIMP_CAP_ANT);
      Cells[CO_COL_INT, irow] := FormatFloat('###,##0.00',vlIMP_INT_ANT);
      Cells[CO_COL_FA, irow] := FormatFloat('###,##0.00',vlIMP_FA_ANT);

      if vlSIT_PROCESO='XP' then  Cells[CO_COL_SITPROCESO, irow] := 'Por Procesar';
      if vlSIT_PROCESO='PR' then  Cells[CO_COL_SITPROCESO, irow] := 'Procesado';
      if vlSIT_PROCESO='RV' then  Cells[CO_COL_SITPROCESO, irow] := 'Procesado';

      if vlSIT_CREDITO='ER' then
      begin
         Cells[CO_COL_SITCRE, irow] := 'Error en Validacion';
         vlMemo_Leyenda:=vlTXT_DESCRIPCION;
      end;

      if vlSIT_CREDITO='OK' then
      begin
         Cells[CO_COL_CHECK, irow] := CO_CHECKED;
         Cells[CO_COL_SITCRE, irow] := 'Validacion Correcta';
         vlMemo_Leyenda:='Validado Correctamente';
      end;

      if vlSIT_CREDITO='OK2' then
      begin
         Cells[CO_COL_CHECK, irow] := CO_UNCHECKED;
         Cells[CO_COL_SITCRE, irow] := vlF_VENC_ANT;
         vlMemo_Leyenda:='Validado Correctamente';
      end;

      if vlSIT_CREDITO='PR' then
      begin
         Cells[CO_COL_SITCRE, irow] := 'Procesado';
         vlMemo_Leyenda:='Procesado Correctamente';
      end;

      if vlSIT_CREDITO='RV' then
      begin
         Cells[CO_COL_SITCRE, irow] := 'Reversa Correcta';
         vlMemo_Leyenda:='Reversa Procesada Correctamente';
      end;

      BarridoCadena (peID_CREDITO, vlMemo_Leyenda);
      if nfila then Inc(irow);
   End;
end;


procedure TWCrVencAnt.FormShow(Sender: TObject);
begin

 With Objeto Do
   Begin
      CAMPO1.Control:=edCAMPO1;

      Credito.ID_CREDITO.Control := edID_CESION;
      Credito.ContratoCre.Contrato.TITNombre.Control := edCESION;
      Credito.GetParams(Objeto);
      edCESION.Hint := Credito.ContratoCre.Contrato.TITNombre.AsString;
      edCESION.ShowHint := True;

      Acreditado.ID_ACREDITADO.Control := edID_ACREDITADO;
      Acreditado.Persona.Nombre.Control := edNOMBRE_ACRED;
      GetParams(Objeto);
      edNOMBRE_ACRED.Hint := Acreditado.Persona.Nombre.AsString;
      edNOMBRE_ACRED.ShowHint := True;      

      lbDempresa.Caption := ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := ParamCre.FECHA.AsString;
      lbDUsuario.Caption := ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

      dtpF_Aplicacion.DateTime:= Objeto.Apli.DameFechaEmpresa;
      edF_Aplicacion.text:=FormatDateTime('dd/mm/yyyy',dtpF_Aplicacion.DateTime);

      vlF_APLICACION:=edF_Aplicacion.Text;      

      //InterForma1.BtnEliminar.Visible:=false;
   end;
end;

procedure TWCrVencAnt.FormDestroy(Sender: TObject);
begin
      Objeto.CAMPO1.Control:=nil;
   //Objeto
end;

procedure TWCrVencAnt.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrVencAnt.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrVencAnt.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrVencAnt.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCrVencAnt.bbImportarClick(Sender: TObject);
var
  LCID: integer;
  fila: integer;
  valida: String;

  //Para la barra de progreso
  ani: TAniBarThread;
  r: TRect;

  vlMesg:string;
  vlclave: String; //
begin
//      vlclave := '07';
  // if ValidaUsuario(Objeto.Apli,vlclave) then begin
   if Objeto.ValidaAccesoEsp('TCRVENCANT_IMPOR',True,True) then
   begin
       MemoMessages.Clear;
       ClearGrid(strgrdVenc,0);
       ConfGrid(strgrdVenc);
       nRow := 0;

       if Trim(edArchivoEntrada.Text) = '' then
       begin
          ShowMessage('Seleccione un archivo');
          Exit;
       end;

       vlMesg:='¿Está seguro de cargar el archivo seleccionado?';
       if MessageDlg(vlMesg, mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      Begin

        {* Inicia las variables para actualizar el medidor *}
        r := pAniBar.ClientRect;
        InflateRect(r, -pAniBar.BevelWidth, -pAniBar.BevelWidth);
        ani := TAniBarThread.Create(pAniBar, r, pAniBar.color, clBlue, 100);
        bbImportar.Enabled := False;
        Application.ProcessMessages;

        LCID := GetUserDefaultLCID;
        //Si el campo con el nombre del reporte está vacio lee la información de
        //de la base de datos y utiliza el reporte
        if edArchivoEntrada.Text <> '' then
        begin
          {* Instrucciones para el archivo excel de entrada
           *}
          ExcelApplicationI.Connect;
          // Hace a Excel invisible
          ExcelApplicationI.Visible[LCID] := False;
          ExcelApplicationI.DisplayAlerts[LCID] := False;

          // Abre el archivo
          ExcelApplicationI.Workbooks.Open(edArchivoEntrada.Text,
            EmptyParam, //UpdateLinks: OleVariant
            EmptyParam, //ReadOnly: OleVariant
            EmptyParam, //Format: OleVariant
            EmptyParam, //Password: OleVariant
            EmptyParam, //WriteResPassword: OleVariant
            EmptyParam, //IgnoreReadOnlyRecommended: OleVariant
            EmptyParam, //Orign: OleVariant
            EmptyParam, //Delimiter: OleVariant
            EmptyParam, //Editable: OleVariant
            EmptyParam, //Notify: OleVariant
            EmptyParam, //Converter: OleVariant
            EmptyParam, //AddToMru: OleVariant
            LCID
            );
          ExcelWorkbookI.ConnectTo(ExcelApplicationI.ActiveWorkbook);
          ExcelWorksheetI.ConnectTo(ExcelApplicationI.ActiveSheet as _Worksheet);
        end;

        {* Extrae la información del archivo Excel *}
        fila := 2;
        try
          try
            //Para cada renglón con información

            valida := trim(ExcelWorksheetI.Cells.Item[fila, 'A']); //PERIODO
            while (valida <> '') do
            begin
              // Extrae la información
              vlID_CREDITO := trim(ExcelWorksheetI.Cells.Item[fila, 'A']);

              //Realiza validaciones
              ValidaCredito(StrToInt(vlID_CREDITO));
              ReQueryVA(vlID_CREDITO, True, nrow);

              inc(fila);
              valida := Trim(ExcelWorksheetI.Cells.Item[fila, 'A']);
            end;

          finally
            //detiene la barra de progreso
            bbImportar.Enabled := True;
            ani.Terminate;

            ExcelApplicationI.Visible[LCID] := True;
            ExcelWorksheetI.Disconnect;
            ExcelWorkbookI.Disconnect;
            ExcelApplicationI.Disconnect;
          end;

          //Si no existe error notifica al usuario que se generó el reporte
          //ShowMessage('Informacion leida con Exito');
          edArchivoEntrada.Text:='';
          strgrdVenc.RowCount:=fila-2;

        except
          on e: Exception do
          begin
            MessageDlg('No se importó completo el archivo.' +
              IntToStr(Fila) + e.Message, mtError, [mbOK], 0);
          end;
         end;
      end;
   end;
   //else begin
   //ShowMessage('    No tiene suficientes permisos para esta Acción');
   //end;
end;


//////////////////////////
procedure TWCrVencAnt.bnMostrarClick(Sender: TObject);
begin

   ClearGrid(strgrdVenc,0);

    vlSql :=' SELECT C.ID_CREDITO ID_CREDITO, C.F_VENC_ANT, ' +
            '        NVL(CA.IMP_CAPITAL, 0) IMP_CAPITAL,' +
  	    '	     NVL(I.IMP_INTERES, 0) IMP_INTERES,' +
       	    '	     NVL(FA.IMP_FINAN_ADIC, 0) IMP_FINAN_ADIC' +
            '   FROM CR_CREDITO C ' +
	    '	     INNER JOIN CR_CAPITAL CA ' +
	    '	        ON C.ID_CREDITO = CA.ID_CREDITO ' +
//	    '	     	AND CA.SIT_CAPITAL IN (''AC'') ' +
            '           AND CA.F_VENCIMIENTO = C.F_VENC_ANT ' +
	    '	     INNER JOIN CR_INTERES I ' +
	    '	        ON C.ID_CREDITO = I.ID_CREDITO ' +
//	    '	     	AND I.SIT_INTERES IN (''AC'') ' +
            '           AND I.F_VENCIMIENTO = C.F_VENC_ANT ' +
 	    '	     LEFT OUTER JOIN CR_FINAN_ADIC FA ' +
 	    '	        ON C.ID_CREDITO = FA.ID_CREDITO ' +
// 	    '	        AND FA.SIT_FINAN_ADIC =''AC'' ' +
            '           AND FA.F_VENCIMIENTO = C.F_VENC_ANT ' +
            ' WHERE C.F_VENC_ANT = TO_DATE('''+DateTimeToStr(Objeto.Apli.DameFechaEmpresa)+''',''DD/MM/YYYY'')' +
            ' ORDER BY C.ID_CREDITO ';
            
//            ' WHERE (C.F_VENC_ANT >= TO_DATE( (SELECT ''01''||TO_CHAR(TO_DATE('''+DateTimeToStr(Objeto.Apli.DameFechaEmpresa)+''',''DD/MM/YYYY''),''MM/YYYY'') AS MES_ANIO FROM DUAL) , ''DD/MM/YYYY'') ) '+
//            '   AND (C.F_VENC_ANT <= LAST_DAY(TO_DATE('''+DateTimeToStr(Objeto.Apli.DameFechaEmpresa)+''',''MM/DD/YYYY''))) ' +
//            ' ORDER BY C.F_VENC_ANT ';

    vlQry := GetSQLQuery(vlSql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
    try
        ConfGrid(strgrdVenc);
        nRow := 0;
        if vlQry <> nil then
        begin
              while not vlQry.Eof do
              begin
                vlid_credito := vlQry.FieldByName('ID_CREDITO').AsString;
                vlIMP_CAP_ANT:= vlQry.FieldByName('IMP_CAPITAL').AsFloat;
                vlIMP_INT_ANT:= vlQry.FieldByName('IMP_INTERES').AsFloat;
                vlIMP_FA_ANT := vlQry.FieldByName('IMP_FINAN_ADIC').AsFloat;
                vlSIT_PROCESO:= 'PR';
                vlSIT_CREDITO:= 'OK2';
                vlF_VENC_ANT := DateTimeToStr(vlQry.FieldByName('F_VENC_ANT').asDateTime);

                ValidaPagos(StrToInt(vlID_CREDITO));
                ReQueryVA(vlID_CREDITO, True, nrow);
                vlQry.Next;
              end;
        end
        else
           ShowMessage ('No se Encontraron Registros a Reversar');
    finally
        if vlQry <> nil then
             vlQry.free;
    end;
    strgrdVenc. RowCount := nRow;
end;

//////////////////////////

procedure TWCrVencAnt.sbArchivoEntradaClick(Sender: TObject);
var
  correcto: boolean;
begin
  correcto := False;
  while not correcto and odArchivoEntrada.Execute do
  begin
    edArchivoEntrada.Text := odArchivoEntrada.FileName;
    if FileExists(odArchivoEntrada.FileName) then
      correcto := True
    else
    begin
      edArchivoEntrada.Text := '';
      ShowMessage('Reporte inexistente. Por favor seleccione un reporte existente');
    end;
  end;
end;

procedure TWCrVencAnt.btPROC_INFOClick(Sender: TObject);
var
   cont1, RegTot  : word;
   vlclave : String;
begin
//    vlclave := '26';
// if ValidaUsuario(Objeto.Apli,vlclave) then
   if Objeto.ValidaAccesoEsp('TCRVENCANT_PROCE',True,True) then
   begin

     MemoMessages.Clear;
     Lcreditos.Clear;
     cont1:=0;
     RegTot:=strgrdVenc.RowCount;

     if Ropcion.Itemindex = 0 then //vencimiento ancitipado
     begin
        while (cont1 <= RegTot) do
        begin
           if (trim(strgrdVenc.Cells[CO_COL_SITPROCESO, cont1])='Por Procesar') AND (trim(strgrdVenc.Cells[CO_COL_SITCRE, cont1])='Validacion Correcta')AND
              (trim(strgrdVenc.Cells[CO_COL_CHECK, cont1])=CO_CHECKED) then
              Lcreditos.Items.Add(strgrdVenc.Cells[CO_COL_IDCREDITO, cont1]);
           cont1:=cont1+1;
        end;

        ClearGrid(strgrdVenc,0);
        cont1:=0;
        while (cont1 <= Lcreditos.Items.Count-1) do
        begin
           vlID_CREDITO:=Lcreditos.Items.Strings[cont1];
           Traspaso(StrToInt(vlid_credito));
           ReQueryVA(vlID_CREDITO, False, cont1);
           cont1:=cont1+1;
        end;
     end;

     if Ropcion.Itemindex = 1 then //vencimiento ancitipado
     begin
        while (cont1 <= RegTot) do
        begin
           if (trim(strgrdVenc.Cells[CO_COL_CHECK, cont1])=CO_CHECKED) then
              Lcreditos.Items.Add(strgrdVenc.Cells[CO_COL_IDCREDITO, cont1]);
           cont1:=cont1+1;
        end;

        ClearGrid(strgrdVenc,0);
        cont1:=0;
        while (cont1 <= Lcreditos.Items.Count-1) do
        begin
           vlID_CREDITO:=Lcreditos.Items.Strings[cont1];
           Reversa_Traspaso(StrToInt(vlid_credito));
           ReQueryVA(vlID_CREDITO, False, cont1);
           cont1:=cont1+1;
        end;
     end;

     If (cont1 = 0) Then strgrdVenc.RowCount := 1
     else  strgrdVenc.RowCount := cont1;

     ShowMessage('Información Procesada con Éxito');
   end;

   //else begin
   //ShowMessage('    No tiene suficientes permisos para esta Acción');
   //end;
end;

procedure TWCrVencAnt.strgrdVencDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var str : String;
    Bmp : TBitmap;
    sTexto: String;           // Texto que va a imprimir en la celda actual
    Alineacion: TAlignment;   // Alineación que le vamos a dar al texto
    iAnchoTexto: Integer;     // Ancho del texto a imprimir en pixels
begin
 If (Sender Is TStringGrid) Then
  With (Sender As TStringGrid) Do
   Begin
      If (gdSelected In State) Then Canvas.Brush.Color := clWhite;

      Canvas.Font.Color := clBlack;

      str := Cells[CO_COL_SITCRE,ARow];
      If (str = 'Error en Validacion') Then
      begin
         Canvas.Font.Color := clRed;
         Canvas.Font.Style := [fsBold];
      end;
      If (str = 'Validacion Correcta')or(str = 'Procesado')or(str = 'Reversa Correcta') Then      
      begin
         Canvas.Font.Color := clGreen;
         Canvas.Font.Style := [fsBold];
      end;
      If (Cells[CO_COL_SITPROCESO,ARow] = 'Procesado') then
      begin
         Canvas.Font.Color := clGreen;
         Canvas.Font.Style := [fsBold];
      end;      
      Canvas.TextRect(Rect,Rect.Left,Rect.Top,Cells[ACol, ARow]);

      if (ACol = CO_COL_IDCREDITO)or(ACol = CO_COL_CHECK) then
         Alineacion := taCenter;

      if (ACol = CO_COL_CAP)or(ACol = CO_COL_INT)or(ACol = CO_COL_FA) then
         Alineacion := taRightJustify;

      if (ACol = CO_COL_SITPROCESO)or(ACol = CO_COL_SITPROCESO) then
         Alineacion := taLeftJustify;

      sTexto := Cells[ACol,ARow];
      Canvas.FillRect( Rect );
      iAnchoTexto := Canvas.TextWidth( sTexto );

      case Alineacion of
        taLeftJustify:  Canvas.TextOut( Rect.Left + 5, Rect.Top + 2, sTexto );
        taCenter:       Canvas.TextOut( Rect.Left + ( ( Rect.Right - Rect.Left ) - iAnchoTexto ) div 2, Rect.Top + 2, sTexto );
        taRightJustify: Canvas.TextOut( Rect.Right - iAnchoTexto - 2, Rect.Top + 2, sTexto );
      end;


      If (ACol = CO_COL_CHECK) Then
      Begin
         Bmp := TBitmap.Create;
         If (Cells[CO_COL_CHECK,ARow] = CO_CHECKED) Then ImageList.GetBitmap(1,Bmp)
         Else ImageList.GetBitmap(0,Bmp);
         Canvas.Draw(Rect.Left,Rect.Top,Bmp);
         Bmp.FreeImage;
         Bmp.Free;
      End;

  End;
end;

procedure TWCrVencAnt.RopcionClick(Sender: TObject);
begin
   MemoMessages.Clear;
   ClearGrid(strgrdVenc,0);
   ConfGrid(strgrdVenc);
   nRow := 0;

   cbAcreditado.Checked:=false;
   chbxCESION.Checked:=false;

   if Ropcion.ItemIndex=0 then
   begin
      GBVenc.Visible:=true;
      GBreversa.Visible:=false;

      edID_ACREDITADO.Enabled:=true;
      edID_CESION.Enabled:=true;

      btID_ACREDITADO.Enabled:=true;
      btID_CESION.Enabled:=true;

      edID_ACREDITADO.Color:=clWindow;
      edID_CESION.Color:=clWindow;

      //edF_Aplicacion.Enabled:=true;
      //dtpF_Aplicacion.Enabled:=true;

      //edF_Aplicacion.Color:=clWindow;

      BBBusca.Enabled:=true;

      Label9.Caption:='Status Proceso';
   end;

   if Ropcion.ItemIndex=1 then
   begin
      GBVenc.Visible:=false;
      GBreversa.Visible:=true;

      edID_ACREDITADO.Enabled:=false;
      edID_CESION.Enabled:=false;

      btID_ACREDITADO.Enabled:=false;
      btID_CESION.Enabled:=false;

      edID_ACREDITADO.Color:=clBtnFace;
      edID_CESION.Color:=clBtnFace;

      //edF_Aplicacion.Enabled:=false;
      //dtpF_Aplicacion.Enabled:=false;

      //edF_Aplicacion.Color:=clBtnFace;

      BBBusca.Enabled:=false;

      Label9.Caption:='Fecha Proceso';      
   end;
end;

procedure TWCrVencAnt.strgrdVencMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var nCol, nRow : Integer;
begin
   strgrdVenc.MouseToCell(X, Y, nCol, nRow);
   if nCol = CO_COL_CHECK then
   begin
      if strgrdVenc.Cells[CO_COL_SITCRE, nRow] <> 'Error en Validacion' then
         InvertCheck(strgrdVenc, CO_COL_CHECK, nRow);
   end;      
end;

procedure TWCrVencAnt.edID_CESIONChange(Sender: TObject);
begin
    If Trim(edID_CESION.Text)<>'' Then Begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
    End Else Begin
        chbxCESION.Checked:=False;
        chbxCESION.Enabled:=False;
    End;
end;

procedure TWCrVencAnt.ilCesionCapture(Sender: TObject; var Show: Boolean);
begin
   Show:=True;
end;

procedure TWCrVencAnt.ilCesionEjecuta(Sender: TObject);
begin
    If Objeto.Credito.FindKey([ilCesion.Buffer]) Then Begin
        chbxCESION.Checked:=True;
        chbxCESION.Enabled:=True;
        InterForma1.NextTab(edID_CESION);

        Buscanombre(edID_CESION.Text);
        cbAcreditado.Checked:=False;
        EnableCheckBox(cbAcreditado, edID_ACREDITADO, edNOMBRE_ACRED);
    End;
end;

procedure TWCrVencAnt.ilACREDITADOEjecuta(Sender: TObject);
begin
    If Objeto.Acreditado.FindKey([ilACREDITADO.Buffer]) Then Begin
        cbAcreditado.Checked:=True;
        cbAcreditado.Enabled:=True;
        InterForma1.NextTab(edID_ACREDITADO);

        chbxCesion.Checked:=False;
        EnableCheckBox(chbxCESION, edID_CESION, edCESION);
    End;
end;

procedure TWCrVencAnt.edID_ACREDITADOChange(Sender: TObject);
begin
    If Trim(edID_ACREDITADO.Text)<>'' Then Begin
        cbAcreditado.Checked:=True;
        cbAcreditado.Enabled:=True;
    End Else Begin
        cbAcreditado.Checked:=False;
        cbAcreditado.Enabled:=False;
    End;
end;

procedure TWCrVencAnt.chbxCESIONClick(Sender: TObject);
begin
   EnableCheckBox(chbxCESION, edID_CESION, edCESION);

   cbAcreditado.Checked:=False;
   EnableCheckBox(cbAcreditado, edID_ACREDITADO, edNOMBRE_ACRED);

   MemoMessages.Clear;
   ClearGrid(strgrdVenc,0);
   ConfGrid(strgrdVenc);   
end;

procedure TWCrVencAnt.cbAcreditadoClick(Sender: TObject);
begin
   EnableCheckBox(cbAcreditado, edID_ACREDITADO, edNOMBRE_ACRED);

   chbxCesion.Checked:=False;   
   EnableCheckBox(chbxCESION, edID_CESION, edCESION);
   Objeto.Acreditado.Active := cbAcreditado.Checked;

   MemoMessages.Clear;
   ClearGrid(strgrdVenc,0);
   ConfGrid(strgrdVenc);
end;

procedure TWCrVencAnt.btID_ACREDITADOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRVENCANT_ACRED',True,True) then
   begin
     Objeto.Acreditado.ShowAll := True;
     If Objeto.Acreditado.Busca Then Begin
          cbAcreditado.Checked:=True;
          cbAcreditado.Enabled:=True;
          InterForma1.NextTab(edID_ACREDITADO);

          chbxCesion.Checked:=False;
          EnableCheckBox(chbxCESION, edID_CESION, edCESION);
     End;
   end;
end;

procedure TWCrVencAnt.btID_CESIONClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRVENCANT_DISPO',True,True) then
   begin
     Objeto.Credito.BuscaWhereString:= ' CONTRATO.ID_EMPRESA ='+ IntToStr(Objeto.Apli.IdEmpresa);
     Objeto.Credito.ShowAll := True;
     if Objeto.Credito.Busca then begin
          chbxCESION.Checked:=True;
          chbxCESION.Enabled:=True;
          InterForma1.NextTab(edID_CESION);

          Buscanombre(edID_CESION.Text);
          cbAcreditado.Checked:=False;
          EnableCheckBox(cbAcreditado, edID_ACREDITADO, edNOMBRE_ACRED);
     End;
   end;
end;

procedure TWCrVencAnt.ilACREDITADOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TWCrVencAnt.BBBuscaClick(Sender: TObject);
var vlclave : String;
begin
//    vlclave := '25';
// if ValidaUsuario(Objeto.Apli,vlclave) then
   if Objeto.ValidaAccesoEsp('TCRVENCANT_BUSCA',True,True) then
   begin
     if (cbAcreditado.Checked)or(chbxCESION.Checked) then
     begin
        MemoMessages.Clear;
        ClearGrid(strgrdVenc,0);
        ConfGrid(strgrdVenc);
        nRow := 0;

        if (cbAcreditado.Checked) then
           vlSql :=  ' SELECT ID_CREDITO FROM CR_CREDITO '+
                     '  WHERE ID_CONTRATO IN ( SELECT ID_CONTRATO FROM CONTRATO '+
                     '                          WHERE ID_TITULAR = '+edID_ACREDITADO.Text+
                     '                       )' +
                     '    AND SIT_CREDITO IN (''AC'')';

        if (chbxCESION.Checked) then
           vlSql :=  'SELECT ID_CREDITO FROM CR_CREDITO WHERE ID_CREDITO = '+edID_CESION.Text +
                     '    AND SIT_CREDITO IN (''AC'')';

        vlQry := GetSQLQuery(vlSql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );

        try
          if vlQry <> nil then
          begin
             while not vlQry.Eof do
             begin
                vlID_CREDITO :=  vlQry.FieldByName('ID_CREDITO').asString;
                ValidaCredito(StrToInt(vlID_CREDITO));
                ReQueryVA(vlID_CREDITO, True, nrow);

                vlQry.Next;
             end;
          end;
        finally
          if vlQry <> nil then vlQry.free;
        end;
        strgrdVenc. RowCount := nRow;
       end;
   end;
   //else begin
   //ShowMessage('    No tiene suficientes permisos para esta Acción');
   //end;
end;

procedure TWCrVencAnt.edF_AplicacionChange(Sender: TObject);
begin
   if Trim(edF_Aplicacion.Text)<>'' then
   begin
      if StrToDate(edF_Aplicacion.Text) > Objeto.Apli.DameFechaEmpresa then
      begin
         ShowMessage('La fecha no puede ser mayor al dia de HOY');
         dtpF_Aplicacion.DateTime:= Objeto.Apli.DameFechaEmpresa;
         edF_Aplicacion.text:=FormatDateTime('dd/mm/yyyy',dtpF_Aplicacion.DateTime);
      end
      else
         vlF_APLICACION:=edF_Aplicacion.Text;

      MemoMessages.Clear;
      ClearGrid(strgrdVenc,0);
      ConfGrid(strgrdVenc);
   end;

end;

end.
