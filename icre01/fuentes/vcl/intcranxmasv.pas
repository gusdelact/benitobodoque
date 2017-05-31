// Sistema         : Clase de NINGUNO
// Fecha de Inicio : 12/04/2013
// Función forma   : Clase de NINGUNO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Qforlxvhziifraxzhgil
// Comentarios     :
Unit IntCrAnxMasv;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Grids, Aligrid,
IntParamCre, Ungene, comObj, IntSGCtrl, DBGrids, ShellAPI;

const
  coEsquema = 'SISTEMAS';
  coPaquete = 'PKGCRADMINCOMERCIAL';
  ALTO_COL = 19;
  ALTO_DOBLE = 25;


Type
 TVarTipoDato       = (vtdNumber, vtdVarchar, vtdDate, vtdDateTime);

 TCrAnxMasv= class;

  TWCrAnxMasv=Class(TForm)
    InterForma1             : TInterForma;
    Panel1: TPanel;
    Label40: TLabel;
    lblModelo: TLabel;
    edArchivoExcel: TEdit;
    bBuscarArchivo: TBitBtn;
    btCargaExcel: TBitBtn;
    btCancelar: TBitBtn;
    edModelo: TEdit;
    btnModelo: TBitBtn;
    edModeloDesc: TEdit;
    SagDatos: TStringAlignGrid;
    OpenXLS: TOpenDialog;
    SaveXLS: TSaveDialog;
    Proc: TStoredProc;
    Log: TMemo;
    qryAnexos: TQuery;
    ProcValor: TStoredProc;
    ProcModelo: TStoredProc;
    qryNumber: TQuery;
    qryRAnexo21: TQuery;
    qryRAnexo20: TQuery;
    qryRAnexo22: TQuery;
    qryRAnexoGn: TQuery;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure bBuscarArchivoClick(Sender: TObject);
    procedure btCargaExcelClick(Sender: TObject);
    procedure btnModeloClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SagDatosKeyPress(Sender: TObject; var Key: Char);
    private
    { Private declarations }

      function obtNumeroColumnas(strModelo : string) : integer;
      function obtTipoDatoVar(strNombreVar : String) : Smallint;
      function obtMetPersona(strPersona : string) : integer;

      procedure GuardaInformacion;
      procedure AbrirXLS (FileName: string);

      procedure generaConsutla(aQuery : TQuery);
      procedure exportaExcel(FileName: string);


    public
    { Public declarations } 
    Objeto : TCrAnxMasv;
end; 
 TCrAnxMasv= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }

        ParamCre                  : TParamCre;

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


constructor TCrAnxMasv.Create( AOwner : TComponent ); 
begin Inherited; 

      StpName  := ' '; 
      UseQuery := False; 
      HelpFile := 'IntCrAnxMasv.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrAnxMasv.Destroy;
begin inherited;
end;


function TCrAnxMasv.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrAnxMasv;
begin
   W:=TWCrAnxMasv.Create(Self);
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


Function TCrAnxMasv.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('INinguno.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TCrAnxMasv.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA NINGUNO********************)
(*                                                                              *)
(*  FORMA DE NINGUNO                                                            *)
(*                                                                              *)
(***********************************************FORMA NINGUNO********************)

procedure TWCrAnxMasv.FormShow(Sender: TObject);
begin

  /// Asignando las BD a los Objetos
  Proc.DatabaseName := Objeto.DatabaseName;
  Proc.SessionName  := Objeto.SessionName;
  ProcValor.DatabaseName := Objeto.DatabaseName;
  ProcValor.SessionName  := Objeto.SessionName;
  ProcModelo.DatabaseName := Objeto.DatabaseName;
  ProcModelo.SessionName  := Objeto.SessionName;
  qryAnexos.DatabaseName := Objeto.DatabaseName;
  qryAnexos.SessionName  := Objeto.SessionName;
  qryNumber.DatabaseName := Objeto.DatabaseName;
  qryNumber.SessionName  := Objeto.SessionName;

  qryRAnexo20.DatabaseName := Objeto.DatabaseName;
  qryRAnexo20.SessionName  := Objeto.SessionName;
  qryRAnexo21.DatabaseName := Objeto.DatabaseName;
  qryRAnexo21.SessionName  := Objeto.SessionName;
  qryRAnexo22.DatabaseName := Objeto.DatabaseName;
  qryRAnexo22.SessionName  := Objeto.SessionName;
  qryRAnexoGn.DatabaseName := Objeto.DatabaseName;
  qryRAnexoGn.SessionName  := Objeto.SessionName;


end;

procedure TWCrAnxMasv.FormDestroy(Sender: TObject);
begin
      //Objeto.CAMPO1.Control:=nil;
   //Objeto
end;

procedure TWCrAnxMasv.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrAnxMasv.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrAnxMasv.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrAnxMasv.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCrAnxMasv.AbrirXLS(FileName: string);
var
  XLApp, Range, Sheet: Variant;
  r, c, Rows, Cols: integer;
  Query: TQuery;
begin
  edArchivoExcel.Text := FileName;

  //Crea un objeto de Excel y abre el archivo
  XLApp  := CreateOleObject('Excel.Application');
  try
    XLApp.WorkBooks.Open(FileName);

    //Determina el número total de registros que vienen en el archivo Excel
    Range := XLApp.WorkBooks[1].Worksheets[1].UsedRange;
    Sheet := XLApp.WorkBooks[1].Worksheets[1];
    Rows  := Range.Rows.Count;
    Cols  := Range.Columns.Count;

    //Determina el tamaño del Grid que se presenta
    sagDatos.RowCount := Rows;
    sagDatos.ColCount := Cols + 1;
    SagDatos.Visible  := true;

   //Recorre el archivo en excel para insertar los datos en el Grid
   for r := 1 to Rows do
     for c := 1 to Cols do
       sagDatos.Cells [c, r - 1] := Sheet.Cells [r, c];

  finally
    XLApp.Quit;

    //Desasignar las variables del Archivo Excel
    XLApp := Unassigned;
    Range := Unassigned;
    Sheet := Unassigned;

  end;

end;

function TWCrAnxMasv.obtNumeroColumnas(strModelo: string): integer;
var
  strSQL : string;
  intCol : integer;
begin
  strSQL := '' +
	' select  count(*) Columnas ' +
	' from CR_MET_VAR_BLOQUE vbl ' +
	' 		inner join CR_MET_VARIABLE var on (var.id_variable = vbl.id_variable) ' +
	' where vbl.id_modelo = ' + trim(strModelo);

  GetSQLInt(strSQL,Objeto.DataBaseName,objeto.SessionName,'Columnas',intCol,false);

  Result := intCol;

end;

procedure TWCrAnxMasv.bBuscarArchivoClick(Sender: TObject);
begin

  if trim(edModelo.Text) = '' then
  begin
    MessageDlg(''+#13+#10+'Debe seleccionar un modelo de datos para poder cargar la información', mtInformation, [mbOK], 0);
    exit;
  end;

  if OpenXLS.Execute then
  begin
    Cursor := crHourGlass;
    try
      AbrirXLS (OpenXLS.FileName);
      btCargaExcel.Enabled := true;
      btCancelar.Enabled := true;
      Cursor := crDefault;
    finally
      Cursor := crDefault;
    end;
  end;
end;

function TWCrAnxMasv.obtTipoDatoVar(strNombreVar: String): Smallint;
var
  strSQL : string;
  resultado : Smallint;
begin
  strSQL := '';
  Result := 0;
end;

procedure TWCrAnxMasv.GuardaInformacion;
  //---
  procedure SalvaColumna (id1 : String; BloqueID, VariableID, No_Padre : integer; TipoDato : String; Valor : String);
  begin

    ProcValor.Close;
    ProcValor.StoredProcName := coEsquema + '.' + coPaquete + '.STPNVOVALOR';

    ProcValor.Params.Clear;
    ProcValor.Params.CreateParam (ftFloat,    'peID_Nodo',           ptInput);
    ProcValor.Params.CreateParam (ftFloat,    'peID_Variable',       ptInput);
    ProcValor.Params.CreateParam (ftFloat,    'peNo_Repeticion',     ptInput);
    ProcValor.Params.CreateParam (ftFloat,    'peNo_Rep_Nodo_Padre', ptInput);
    ProcValor.Params.CreateParam (ftFloat,    'peValor_Numerico',    ptInput);
    ProcValor.Params.CreateParam (ftDateTime, 'peValor_Fecha',       ptInput);
    ProcValor.Params.CreateParam (ftString,   'peValor_Cadena',      ptInput);

    ProcValor.ParamByName ('peID_Nodo').Clear;
    ProcValor.ParamByName ('peID_Variable').Clear;
    ProcValor.ParamByName ('peNo_Repeticion').Clear;
    ProcValor.ParamByName ('peNo_Rep_Nodo_Padre').Clear;
    ProcValor.ParamByName ('peValor_Numerico').Clear;
    ProcValor.ParamByName ('peValor_Fecha').Clear;
    ProcValor.ParamByName ('peValor_Cadena').Clear;

    ProcValor.ParamByName ('peID_Nodo'      ).AsInteger := BloqueID;
    ProcValor.ParamByName ('peID_Variable'  ).AsInteger := VariableID;
    ProcValor.ParamByName ('peNo_Repeticion').AsInteger := No_Padre; //Debido a que en el alta masiva no hay elementos maestro-detalle   /// 13-Mayo/2013
    //ProcValor.ParamByName ('peNo_Rep_Nodo_Padre').AsInteger := No_Padre;

    if TipoDato = 'NUMBER' then
    begin
      if Valor <> '' then
        ProcValor.ParamByName ('peValor_Numerico').AsFloat := StrToFloat(Valor)
    end
    else if TipoDato = 'VARCHAR2' then
      ProcValor.ParamByName ('peValor_Cadena').AsString := trim(Valor)
    else begin
      if Valor <> '' then
        ProcValor.ParamByName ('peValor_Fecha').AsDate := StrToDate(Valor)
    end;

    ProcValor.ExecProc;

  end;
  //---
var
  Error : integer;
  r, c : integer;
  iPersona, iModelo : integer;
  iDetalle : integer;   /// 13-Mayo/2013
begin

  Log.Lines.Add ('---------------------------------------------------------------');
  Log.Lines.Add ('Inicia proceso de Carga');

  iDetalle := 1;
  if qryAnexos.Active then
    qryAnexos.Close;
  for r := 1 to sagDatos.RowCount - 1 do
  begin

  //Limpia la tabla de valores
    Proc.Close;
    Proc.StoredProcName := coEsquema + '.' + coPaquete + '.STPCLRMODELVAL';

    Proc.Params.Clear;
    Proc.Params.CreateParam (ftFloat,  'peDummy', ptInput);
    Proc.ExecProc;

    iPersona := 0;
    iModelo := 0;
    for c := 1 to sagDatos.ColCount - 1 do
    begin
      if c > 1 then
      begin

        with qryAnexos do
        begin
          Close;
          ParamByName('peModelo').Clear;
          ParamByName('peNombre').Clear;
          ParamByName('peModelo').AsString := trim(edModelo.Text);
          ParamByName('peNombre').AsString := sagDatos.Cells [c, 0];
          Prepare;
          Open;


          // RUCJ4248 : En base al Modelo requerimos actualizar la variable antes de la integrar el dato
          if trim(FieldByName('tipo_dato').AsString) = 'NUMBER' then
          begin
            with qryNumber do
            begin
              Close;
              ParamByName('peModelo').Clear;
              ParamByName('peNombre').Clear;
              ParamByName('pePersona').Clear;
              ParamByName('peModelo').AsString := trim(edModelo.Text);
              ParamByName('peNombre').AsString := sagDatos.Cells [c, 0];
              ParamByName('pePersona').AsString := IntToStr(obtMetPersona(sagDatos.Cells [1, r]));
              Prepare;
              ExecSQL;
            end
          end;


          if sagDatos.Cells [c, r] <> '' then
          begin
            SalvaColumna(sagDatos.Cells [1, r], FieldByName('id_nodo').AsInteger, FieldByName('id_variable').AsInteger,
                iDetalle, trim(FieldByName('tipo_dato').AsString), sagDatos.Cells [c, r]);
            Log.Lines.Add (' ' + sagDatos.Cells [1, r] + ' ' + FieldByName('id_nodo').AsString +
                           ' ' + FieldByName('id_variable').AsString + ' ' + IntToStr(iDetalle) +
                           ' ' + trim(FieldByName('tipo_dato').AsString) + ' ' + sagDatos.Cells [c, r])
          end
          //else
            {Log.Lines.Add ('Persona -> ' + sagDatos.Cells [1, r] +
                           ' iDetalle -> ' + IntToStr(iDetalle) +
                           ' ID Variable -> ' + sagDatos.Cells [c, 0] +
                           ' Tipo de dato esperado -> ' + trim(FieldByName('tipo_dato').AsString) +
                           ' Se intenta ingresar -> ' + 'NULL');}

        end; // Termina With qryAnexos do

      end // Termina if

    end; // Termina for c := 1

    iPersona := obtMetPersona(sagDatos.Cells [1, r]);
    iModelo := StrToInt(trim(edModelo.Text));

    //Salva la información en la tabla
    ProcModelo.Close;
    ProcModelo.StoredProcName := coEsquema + '.' + coPaquete + '.STPALTAMODELOAPP';

    ProcModelo.Params.Clear;
    ProcModelo.Params.CreateParam (ftFloat,    'peID_Persona',        ptInput);
    ProcModelo.Params.CreateParam (ftFloat,    'peID_Modelo',         ptInput);
    ProcModelo.Params.CreateParam (ftDateTime, 'pePeriodo',           ptInput);
    ProcModelo.Params.CreateParam (ftDateTime, 'peF_Vigente_Desde',   ptInput);
    ProcModelo.Params.CreateParam (ftString,   'peCve_Usu_Alta',      ptInput);
    ProcModelo.Params.CreateParam (ftFloat,    'psError',             ptOutput);
    ProcModelo.Params.CreateParam (ftString,   'psMsgError',          ptOutput);

    ProcModelo.ParamByName ('peID_Persona').Clear;
    ProcModelo.ParamByName ('peID_Modelo').Clear;
    ProcModelo.ParamByName ('pePeriodo').Clear;
    ProcModelo.ParamByName ('peF_Vigente_Desde').Clear;
    ProcModelo.ParamByName ('peCve_Usu_Alta').Clear;

    ProcModelo.ParamByName ('peID_Persona'     ).AsInteger  := iPersona;
    ProcModelo.ParamByName ('peID_Modelo'      ).AsInteger  := iModelo;
    ProcModelo.ParamByName ('pePeriodo'        ).AsDate     := Now;
    ProcModelo.ParamByName ('peF_Vigente_Desde').AsDate     := Now;
    ProcModelo.ParamByName ('peCve_Usu_Alta'   ).AsString   := Objeto.Apli.Usuario;
    ProcModelo.ExecProc;

    if ProcModelo.ParamByName ('psError').AsInteger <> 0 then
      Log.Lines.Add ('Persona -> ' + sagDatos.Cells [1, r]);

  end; // Termina for r := 1

  Log.Lines.Add ('---------------------------------------------------------------');
  Log.Lines.Add ('Termina proceso de Carga');
  
end;

procedure TWCrAnxMasv.btCargaExcelClick(Sender: TObject);
begin

  if Objeto.ValidaAccesoEsp('TCRANXMASV_DWNL',True,True) then
    GuardaInformacion;

end;


function TWCrAnxMasv.obtMetPersona(strPersona: string): integer;
var
  strSQL : string;
  intMetPersona : integer;
begin
  strSQL := 'select ID_PERSONA from CR_MET_PERSONA where 2 = 2 and ID1 = ' + trim(strPersona);
  GetSQLInt(strSQL,Objeto.DataBaseName,objeto.SessionName,'ID_PERSONA',intMetPersona,false);
  Result := intMetPersona;

end;

procedure TWCrAnxMasv.btnModeloClick(Sender: TObject);
var
  T: TInterFindit;
begin

  With Objeto Do
  begin
    T := CreaBuscador('ICrMeMo.it','I');
    T.ShowAll := True;
    Try
      If T.Execute Then
         Begin
           edModelo.Text     := T.DameCampo (0);
           edModeloDesc.Text := T.DameCampo (1);
         end;
    finally
      T.Free;
    end;
  end;

end;

procedure TWCrAnxMasv.btCancelarClick(Sender: TObject);
var
  r, c : integer;
begin

  // Limpiando los datos del Grid
  for r := 0 to sagDatos.RowCount - 1 do
  begin

    for c := 0 to sagDatos.ColCount - 1 do
    begin
      sagDatos.Cells [c, r] := '';
    end;

  end;

  // Reseteando los valores de la pantall
  sagDatos.FixedCols := 1;
  sagDatos.FixedRows := 1;
  sagDatos.FixedColor := clBtnFace;
  sagDatos.RowCount := 2;
  sagDatos.ColCount := 3;
  edModelo.Text     := '';
  edModeloDesc.Text := '';
  edArchivoExcel.Text := '';
  btCargaExcel.Enabled := false;
  btCancelar.Enabled := false;

end;

procedure TWCrAnxMasv.generaConsutla(aQuery: TQuery);
var
  c, r : Integer;
begin

  r := 0;
  c := 0;

  DataSource1.DataSet := aQuery;
  DataSource1.DataSet.First;
  SagDatos.RowCount := DataSource1.DataSet.RecordCount + 1;
  SagDatos.ColCount := DataSource1.DataSet.FieldCount + 1;
  for r := 0 to DataSource1.DataSet.RecordCount -1 do
  begin

    for c := 0 to DataSource1.DataSet.FieldCount -1 do
    begin
      if r = 0 then
        sagDatos.Cells [c+1, 0] := DataSource1.DataSet.Fields[c].FieldName;

      sagDatos.Cells [c+1, r+1] := DataSource1.DataSet.Fields[c].AsString;
    end;
    DataSource1.DataSet.Next;

  end;

  btCancelar.Enabled := true;
end;

procedure TWCrAnxMasv.BitBtn1Click(Sender: TObject);
begin

  if Objeto.ValidaAccesoEsp('TCRANXMASV_BAK',True,True) then
  begin
    if trim(edModelo.Text) = '1' then
    begin
      qryRAnexoGn.Open;
      generaConsutla(qryRAnexoGn);
    end
    else if trim(edModelo.Text) = '2' then
    begin
      qryRAnexo20.Open;
      generaConsutla(qryRAnexo20);
    end
    else if trim(edModelo.Text) = '3' then
    begin
      qryRAnexo21.Open;
      generaConsutla(qryRAnexo21);
    end
    else if trim(edModelo.Text) = '4' then
    begin
      qryRAnexo22.Open;
      generaConsutla(qryRAnexo22);
    end
  end;

end;

procedure TWCrAnxMasv.SagDatosKeyPress(Sender: TObject; var Key: Char);
var
  XLApp: Variant;
begin
  if key = ^C then
  begin

    if SaveXLS.Execute then
    begin
      Cursor := crHourGlass;
      try
        exportaExcel(SaveXLS.FileName);
        Cursor := crDefault;
        if MessageDlg ('Exportación exitosa. Deseas abrir el archivo?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          XLApp         := CreateOleObject('Excel.Application');
          XLApp.Visible := False;
          XLApp.Workbooks.Open (SaveXLS.FileName);
          XLApp.Visible := True;
        end;
      finally
        Cursor := crDefault;
      end;
    end;

  end;
end;

procedure TWCrAnxMasv.exportaExcel(FileName: string);
const
{ XlFileFormat }
  xlAddIn               =    18;
  xlCSV                 =     6;
  xlCSVMac              =    22;
  xlCSVMSDOS            =    24;
  xlCSVWindows          =    23;
  xlDBF2                =     7;
  xlDBF3                =     8;
  xlDBF4                =    11;
  xlDIF                 =     9;
  xlExcel2              =    16;
  xlExcel2FarEast       =    27;
  xlExcel3              =    29;
  xlExcel4              =    33;
  xlExcel5              =    39;
  xlExcel7              =    39;
  xlExcel9795           =    43;
  xlExcel4Workbook      =    35;
  xlIntlAddIn           =    26;
  xlIntlMacro           =    25;
  xlWorkbookNormal      = -4143;
  xlSYLK                =     2;
  xlTemplate            =    17;
  xlCurrentPlatformText = -4158;
  xlTextMac             =    19;
  xlTextMSDOS           =    21;
  xlTextPrinter         =    36;
  xlTextWindows         =    20;
  xlWJ2WD1              =    14;
  xlWK1                 =     5;
  xlWK1ALL              =    31;
  xlWK1FMT              =    30;
  xlWK3                 =    15;
  xlWK4                 =    38;
  xlWK3FM3              =    32;
  xlWKS                 =     4;
  xlWorks2FarEast       =    28;
  xlWQ1                 =    34;
  xlWJ3                 =    40;
  xlWJ3FJ3              =    41;
  xlWBatWorkSheet       = -4167;

{ XlBorderWeight }

  xlHairline =     1;
  xlMedium   = -4138;
  xlThick    =     4;
  xlThin     =     2;

{ xlHorizontalAlignment}
  xlHAlignCenter = -4108;
  xlHAlignLeft   = -4131;
  xlHAlignRight  = -4152;

{xlBorderIndex}
  xlEdgeLeft         =     7;
  xlEdgeTop          =     8;
  xlEdgeBottom       =     9;
  xlEdgeRight        =    10;
  xlDiagonalDown     =     5;
  xlDiagonalUp       =     6;
  xlNone             = -4142;
  xlInsideVertical   =    11;
  xlInsideHorizontal =    12;

{xlCalculationMode}
  xlCalculationManual        = -4135;
  xlCalculationAutomatic     = -4105;
  xlCalculationSemiautomatic =     2;

{xlLineStyle}
  xlContinuous             =     1;
  xlDash                   = -4115;
  xlDashDot                =     4;
  xlDashDotDot             =     5;
  xlDot                    = -4118;
  xlDouble                 = -4119;
  xlSlantDashDot           =    13;
  xlLineStyleNone          = -4142;
  xlSolid                  =     1;
  xlAutomatic              = -4105;
  xlThemeColorAccent1      =     5;
  xlThemeColorAccent3      =     7;
  xlThemeColorAccent6      =    10;
  xlThemeColorLight1       =     2;
  xlThemeColorLight2       =     4;
  xlThemeColorDark1        =     1;
  msoThemeColorAccent1     =     5;
  msoThemeColorAccent3     =     7;
  msoThemeColorAccent6     =    10;
  msoThemeColorText2       =    15;
  msoThemeColorBackground1 =    14;
  msoLineDash              =     4;

{Chart Enummeration}
  xlBarClustered      =    57;
  xlColumns           =     2;
  xlColumnClustered   =    51;
  xl3DColumnClustered =    54;
  xlLine              =     4;
  xl3DLine            = -4101;
  msoTrue             =     1;

{Fill Pattern}
  msoPattern5Percent        = 1;
  msoPatternOutlinedDiamond = 41;
  
var
  XLApp, XLSheet: Variant;
  Range, Chart, Serie: Variant;
  Row, RowIni, CurrTipo: integer;
  c, r : Integer;
begin

  if not DataSource1.DataSet.IsEmpty then
  begin

    XLApp := CreateOleObject('Excel.Application');
    try
      Cursor              := crHourGlass;
      XLApp.Visible       := False;
      XLApp.DisplayAlerts := False;
      XLApp.Workbooks.Add(xlWBatWorkSheet);

      {Inicia la generación de la tabla}
      XLSheet      := XLApp.Workbooks[1].WorkSheets[1];
      XLSheet.Name := 'Tabla';


      DataSource1.DataSet.First;
      SagDatos.RowCount := DataSource1.DataSet.RecordCount + 1;
      SagDatos.ColCount := DataSource1.DataSet.FieldCount + 1;
      for r := 0 to DataSource1.DataSet.RecordCount -1 do
      begin

        for c := 0 to DataSource1.DataSet.FieldCount -1 do
        begin
          if r = 0 then
            XLSheet.Cells [r+1,  c+1].Formula := DataSource1.DataSet.Fields[c].FieldName;

          XLSheet.Cells [r+2,  c+2].Formula := DataSource1.DataSet.Fields[c].AsString;
        end;
        DataSource1.DataSet.Next;

      end;

    finally
      Cursor := crArrow;
      XLApp.Workbooks[1].SaveAs (FileName);
      XLApp.Quit;
      XLSheet  := Unassigned;
      Range    := Unassigned;
      XLApp    := Unassigned;
    end;

  end // Terina :: if not DataSource1.DataSet.IsEmpty then

end;

end.
