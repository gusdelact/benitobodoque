// Sistema         : Clase de CR_LOCAL_CNBV
// Fecha de Inicio : 29/01/2004
// Función forma   : Clase de CR_LOCAL_CNBV
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrEdoMun;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm, DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit, Menus,
IntParamCre, Grids, Aligrid, IntDmMain, comObj, IntGenCre, Excel97,
OleServer;


const
  C_COLCVE  = 0;
  C_COLDESC = 1;

Type
 TCrEdoMun= class;

  TWCrEdoMun=Class(TForm)
    InterForma1             : TInterForma;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    pgAltaDatos: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Lbtotal: TLabel;
    lbTotalReg: TLabel;
    RGinformacion: TRadioGroup;
    btCarga: TBitBtn;
    pbRegistros: TProgressBar;
    MErrores: TMemo;
    SAGta: TStringAlignGrid;
    lbCVE_EDO_MPIO: TLabel;
    edCVE_EDO_MPIO: TEdit;
    lbDESC_EDO_MPIO: TLabel;
    edDESC_EDO_MPIO: TEdit;
    btCargaDatosExcel: TBitBtn;
    odArchivoCarga: TOpenDialog;
    Excel_Application: TExcelApplication;
    Excel_Worksheet: TExcelWorksheet;
    Excel_Workbook: TExcelWorkbook;
    btnGenerarEstruc: TBitBtn;
    SaveXLS: TSaveDialog;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btCargaClick(Sender: TObject);
    procedure SAGtaExit(Sender: TObject);
    procedure SAGtaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RGinformacionClick(Sender: TObject);
    procedure edCVE_EDO_MPIOExit(Sender: TObject);
    procedure edDESC_EDO_MPIOExit(Sender: TObject);
    Procedure MuestraHints;
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure Pegar1Click(Sender: TObject);
    procedure btCargaDatosExcelClick(Sender: TObject);
    procedure btnGenerarEstrucClick(Sender: TObject);
    private 
    { Private declarations }
      procedure PegaInformacion (pLong : Integer);
      function CargaDatos (var peCVE_EDO_MPIO, peDESC_EDO_MPIO : string):boolean;
      function ReemplazaDatos (var peCVE_EDO_MPIO, peDESC_EDO_MPIO : string): boolean;
    public 
    { Public declarations } 
    Objeto : TCrEdoMun;
end; 
 TCrEdoMun= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        
        ParamCre               : TParamCre;
        CVE_EDO_MPIO           : TInterCampo;
        DESC_EDO_MPIO          : TInterCampo;
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


constructor TCrEdoMun.Create( AOwner : TComponent ); 
begin Inherited; 
      CVE_EDO_MPIO          := CreaCampo('CVE_EDO_MPIO',ftString,tsNinguno,tsNinguno,True);
      CVE_EDO_MPIO.Caption  := 'Clave de Estado y Mpio.';
      DESC_EDO_MPIO         := CreaCampo('DESC_EDO_MPIO',ftString,tsNinguno,tsNinguno,True);
      DESC_EDO_MPIO.Caption :='Descripción de Estado y Municipio';
      FKeyFields.Add('CVE_EDO_MPIO');

      TableName       := 'CR_Edos_Mpios_Buro';
      UseQuery        := True;
      HelpFile        := 'InTCrEdoMun.Hlp';
      ShowMenuReporte := True;
end;

Destructor TCrEdoMun.Destroy;
begin inherited;
end;


function TCrEdoMun.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrEdoMun;
begin
   W := TWCrEdoMun.Create(Self);
   try
      W.Objeto                    := Self;
      W.InterForma1.InterFrame    := Self;
      W.InterForma1.FormaTipo     := FormaTipo;
      W.InterForma1.ShowGrid      := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion       := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


function TCrEdoMun.InternalBusca:Boolean;
var T:TInterFindit;
begin
  InternalBusca := False;
  T := CreaBuscador('IEdosMpiosBuro.it','S');
  Try
    if Active then
    begin
      T.Param(0, CVE_EDO_MPIO.AsString);
    end;

    if T.Execute then
      InternalBusca := FindKey([T.DameCampo(0)]);
  finally  T.Free;
  end;
end;

function TCrEdoMun.Reporte:Boolean; 
begin Result := True; 
end;


(***********************************************FORMA CR_LOCAL_CNBV********************)
(*                                                                              *)
(*  FORMA DE CR_LOCAL_CNBV                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_EDOS_MPIOS_BURO********************)

procedure TWCrEdoMun.FormShow(Sender: TObject);
begin
  Objeto.CVE_EDO_MPIO.Control  := edCVE_EDO_MPIO;
  Objeto.DESC_EDO_MPIO.Control := edDESC_EDO_MPIO;

  //Despliega datos del panel inferior de la forma Obtenidos de ParamCre
  with Objeto do
  begin
    lbDEmpresa.Caption := ParamCre.EMPRESA.AsString;
    lbDFecha  .Caption := ParamCre.FECHA.AsString;
    lbDUsuario.Caption := ParamCre.USUARIO.AsString;
    lbDPerfil .Caption := ParamCre.PERFIL.AsString;
  end;
end;

procedure TWCrEdoMun.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_EDO_MPIO.Control  := nil;
      Objeto.DESC_EDO_MPIO.Control := nil;
   //Objeto
end;

procedure TWCrEdoMun.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrEdoMun.InterForma1DespuesNuevo(Sender: TObject);
begin    MuestraHints;
   edCVE_EDO_MPIO.SetFocus;
end;

procedure TWCrEdoMun.InterForma1DespuesModificar(Sender: TObject);
begin edCVE_EDO_MPIO.SetFocus;
end;

procedure TWCrEdoMun.Pegar1Click(Sender: TObject);
begin
   //PegaInformacion(3);
end;


procedure TWCrEdoMun.SAGtaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     {if ((Shift = [ssCtrl] ) and (Key = 86)) then
          PegaInformacion(3); CLVA - 28112012}
     // if end;
end;

procedure TWCrEdoMun.SAGtaExit(Sender: TObject);
begin
  InterForma1.ValidaExit(SAGta,True,'',True);
end;

(*********************COPIA DE DATOS DE EXCEL AL CATÁLOGO***********************)
Procedure TWCrEdoMun.PegaInformacion(pLong : Integer);

var l_Tempo, l_Ciclo :Integer;

   procedure limpiaRow(pRow : Integer);
   Begin
      AddLine(MErrores,'Error en Cve: '+ SAGta.Cells[C_COLCVE,  pRow] +
                       '         Desc.: '+ SAGta.Cells[C_COLDESC, pRow] + ' es nula. ');
      SAGta.RemoveRow(pRow);
   end;

   //Depura Lineas
   Procedure DepuraLineas;
   var nRow, nRowCountAnt : Integer;
   Begin
     nRow := 0;
     With SAGta Do
      While (nRow < RowCount) Do
       Begin
         If (Trim(Cells[C_COLCVE,nRow]) = '') Or
            (Trim(Cells[C_COLDESC,nRow]) = '') Then
             Begin
             nRowCountAnt := RowCount;
             LimpiaRow(nRow);
             If (nRowCountAnt = 1) Then
              Begin
              ClearGrid(SAGta,0);
              Break;
              End;
             nRow := 0;
             End
         Else
          Inc(nRow);
       End;
   end;

//Inicio Pega Informacion
Begin
   lbTotalReg.Caption := '';
   pbRegistros.Max := 0;
   Try
      For l_Ciclo:= 1 to (SAGta.RowCount-1) do
      Begin
         For l_Tempo:= 2 to (SAGta.ColCount-1) do
         begin
              SAGta.Cells[l_Tempo,l_Ciclo] := '';
         end;
      end;
   //Pega el archivo desde la memoria
   if SAGta.ColCount = 2 then
      SAGta.RemoveCol(0);
   //end if
   SAGta.CopyFromClipboard;
   except
         ShowMessage('Problemas con la carga en BLOQUE!!!!');
         EXIT;
   end;
   if SAGta.ColCount < 2 then
       SAGta.InsertCol(0)
   else if SAGta.ColCount > 2 then
         SAGta.ColCount := 2;
   //end if

   SAGta.ColWidths[0] := 80;
   SAGta.ColWidths[1] := 415;

   //Pega Datos
   Depuralineas; //Depura líneas
   if (SAGta.Cells[0,0] <> '') and ( SAGta.RowCount >= 1 ) then
   Begin
     lbTotalReg.Caption := IntToStr(SAGta.RowCount);
     pbRegistros.Max := SAGta.RowCount - 1;
   end;
end;

(******************** CARGA DE DATOS EN BLOQUE *********************************)
function TWCrEdoMun.CargaDatos(var peCVE_EDO_MPIO, peDESC_EDO_MPIO : string):boolean;
var
  Qry : TQuery;
begin
  Result := False;
  Qry := TQuery.Create(Nil);

  If Assigned(Qry) Then
    With Qry Do
    Try
      DataBaseName := Objeto.Apli.DataBaseName;
      SessionName := Objeto.Apli.SessionName;
      SQL.Clear;
      SQL.Add('INSERT INTO CR_EDOS_MPIOS_BURO (CVE_EDO_MPIO, DESC_EDO_MPIO) ' +
              'VALUES (:peCVE_EDO_MPIO, :peDESC_EDO_MPIO) ');
      Params.Clear;

      Params.CreateParam(ftString, 'peCVE_EDO_MPIO',  ptInput);
      Params.CreateParam(ftString, 'peDESC_EDO_MPIO', ptInput);

      ParamByName('peCVE_EDO_MPIO') .AsString := peCVE_EDO_MPIO;
      ParamByName('peDESC_EDO_MPIO').AsString := peDESC_EDO_MPIO;
      ExecSQL;

      SQL.Clear;
      Params.Clear;
      SQL.Add('COMMIT');
      ExecSQL;

      Result := True;
    Finally
      Close;
      Free;
    End;
end;

function TWCrEdoMun.ReemplazaDatos (var peCVE_EDO_MPIO, peDESC_EDO_MPIO : string): boolean;
var
  vlQry: TQuery;
  prueba: string;
begin
  Result := False;
  vlQry  := TQuery.Create(Nil);

  if Assigned (vlQry) then
    with vlQry do
    try
      DataBaseName := Objeto.Apli.DataBaseName;
      SessionName  := Objeto.Apli.SessionName;
      SQL.Clear;

      SQL.Add('Update CR_EDOS_MPIOS_BURO');
      SQL.Add('   Set Cve_Edo_Mpio  = :peCVE_EDO_MPIO,');
      SQL.Add('       Desc_Edo_Mpio = :peDESC_EDO_MPIO');
      SQL.Add(' Where Cve_Edo_Mpio  = :peCVE_EDO_MPIO');
      Params.Clear;

      Params.CreateParam(ftString, 'peCVE_EDO_MPIO',  ptInput);
      Params.CreateParam(ftString, 'peDESC_EDO_MPIO', ptInput);

      ParamByName('peCVE_EDO_MPIO') .AsString := peCVE_EDO_MPIO;
      ParamByName('peDESC_EDO_MPIO').AsString := peDESC_EDO_MPIO;
      ExecSQL;

      SQL.Clear;
      Params.Clear;
      SQL.Add('COMMIT');
      ExecSQL;

      Result := True;
    finally
      Close;
      Free;
    end;
end;

procedure TWCrEdoMun.btCargaClick(Sender: TObject);
var
  vlCtdorLine     : Integer;
  vlCVE_EDO_MPIO  : String;
  vlDESC_EDO_MPIO : String;
  vlMsg           : String;
  vlTermina       : Boolean;

begin
 if Trim(SAGta.Cells[0,0]) <> CNULL then
   if Trim(SAGta.Cells[1,0]) <> CNULL then
   begin
     vlTermina       := False;
     vlCVE_EDO_MPIO  := '';
     vlDESC_EDO_MPIO := '';

     if RGinformacion.ItemIndex = 0 then //Reemplaza la información
     begin
        MErrores.Clear;
        if MessageDlg (MSG_PREGUNTA_ADVERTENCIA, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          //Borra datos existentes de la tabla en caso de reemplazar (tabla CR_Edos_Mpios_Buro)
          RunSQL('DELETE CR_Edos_Mpios_Buro', objeto.Apli.DataBaseName, objeto.Apli.SessionName, True);
          //Envia mensaje de inicio proceso
          messageIniFinProceso (MErrores, CINICIO);
          for VLCtdorLine := 1 to (SAGta.RowCount-1) do //INICIALIZA INDICADOR DE PROGRESO
          begin
            vlCVE_EDO_MPIO  := UpperCase(SAGta.Cells[C_COLCVE,  VLCtdorLine]);
            vlDESC_EDO_MPIO := UpperCase(SAGta.Cells[C_COLDESC, VLCtdorLine]);

            if not (CargaDatos (vlCVE_EDO_MPIO, vlDESC_EDO_MPIO)) then //Carga los datos del grid a la tabla
            begin
              //Muestra errores que se tienen en la carga
              AddLine(MErrores,'Error Clave : '+ vlCVE_EDO_MPIO + '    Desc. : '+ vlDESC_EDO_MPIO);
              if MessageDlg('¿Error en reemplazo de datos. Clave : ' + vlCVE_EDO_MPIO + MSG_PREG_CONTINUA_PROCES, mtConfirmation, [mbYes, mbNo], 0) = mrNo then
              begin
                messageIniFinProceso(MErrores,CFINAL);//envia mensaje de Fin proceso
                exit;
              end;
            end;
            pbRegistros.Position :=VLCtdorLine;
            vlTermina := True;
          end;
          if vlTermina then
            ShowMessage(MSG_PROCESO_CARGA_OK);

          messageIniFinProceso(MErrores,CFINAL);//envia mensaje de Fin proceso
        end
        else
        begin
          vlMsg := 'No se realizó el Proceso de reemplazo';
          messageIniFinProceso (MErrores, CINICIO);//envia mensaje de inicia proceso
          AddLine (MErrores, vlMsg);
          messageIniFinProceso (MErrores, CFINAL);//envia mensaje de Fin proceso
          ShowMessage (vlMsg);
          exit;
        end;
     end
     else if RGinformacion.ItemIndex = 1 then //Adiciona datos no existentes en la base, no reemplaza
     begin
       MErrores.Clear;
       messageIniFinProceso(MErrores, CINICIO);//envia mensaje de inicio proceso

       for VLCtdorLine := 1 to (SAGta.RowCount-1) do //INICIALIZA INDICADOR DE PROGRESO
       begin
         vlCVE_EDO_MPIO  := UpperCase(SAGta.Cells[C_COLCVE,  VLCtdorLine]);
         vlDESC_EDO_MPIO := UpperCase(SAGta.Cells[C_COLDESC, VLCtdorLine]);

         if not (CargaDatos (vlCVE_EDO_MPIO, vlDESC_EDO_MPIO)) then
         begin
           AddLine(MErrores,'Error Clave : '+ vlCVE_EDO_MPIO +'    Desc. : '+ vlDESC_EDO_MPIO);
           if MessageDlg('¿Error en carga de datos. Clave : ' + vlCVE_EDO_MPIO + MSG_PREG_CONTINUA_PROCES, mtConfirmation, [mbYes, mbNo], 0) = mrNo then
           begin
             messageIniFinProceso (MErrores, CFINAL);//envia mensaje de Fin proceso
             exit;
           end;
         end;

         pbRegistros.Position := vlCtdorLine;
         vlTermina := True;
       end; //end for

       if vlTermina then
         ShowMessage (MSG_PROCESO_CARGA_OK);

       messageIniFinProceso (MErrores, CFINAL);//envia mensaje de Fin proceso
     end;
   END;
end;

procedure TWCrEdoMun.RGinformacionClick(Sender: TObject);
begin
  MErrores.Clear;
end;

procedure TWCrEdoMun.edCVE_EDO_MPIOExit(Sender: TObject);
var
  vlSalida : boolean;
  vlMsg    : string;
begin
  if ((Objeto.Modo = moEdit) or (Objeto.Modo = moAppend)) then
  begin
    vlMsg := '';
    Objeto.CVE_EDO_MPIO.GetFromControl;
    if Objeto.CVE_EDO_MPIO.AsString = '' then
      vlSalida   := False;

    InterForma1.ValidaExit (edCVE_EDO_MPIO, vlSalida, vlMsg, True);
   end;
end;

procedure TWCrEdoMun.edDESC_EDO_MPIOExit(Sender: TObject);
begin
  InterForma1.ValidaExit (edDESC_EDO_MPIO, True, '', True);
end;

Procedure TWCrEdoMun.MuestraHints;
begin
  edDESC_EDO_MPIO.Hint     := Objeto.DESC_EDO_MPIO.AsString;
  edDESC_EDO_MPIO.ShowHint := True;
end;

procedure TWCrEdoMun.InterForma1Buscar(Sender: TObject);
begin
  if Objeto.Busca then
    MuestraHints;
end;

procedure TWCrEdoMun.InterForma1DespuesAceptar(Sender: TObject);
begin
   MuestraHints;
end;

procedure TWCrEdoMun.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
  //nuevo
  if IsNewData then
  begin
    if MessageDlg('¿Desea almacenar los datos capturados?',
       mtConfirmation,[mbYes, mbNo], 0) = mrYes then
    begin
      Realizado := True;
    end
    else
      Realizado := False;
  end
  else
  begin
    if MessageDlg('¿Desea guardar los datos modificados?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      Realizado := True
    else
      Realizado := False;
  end
end;


procedure TWCrEdoMun.btCargaDatosExcelClick(Sender: TObject);
var
  correcto      : boolean;
  valida        : string;
  fila          : integer;
  SAGta_Row     : integer;
  LCID          : integer;
  PI_Str        : string;
  PI_Float      : double;
  error         : integer;
  Cve_Edo_Mpio  : string;
  Desc_Edo_Mpio : string;
  vlQry         : TQuery;
  vlQry_F       : TQuery;
  n             : integer;
  vlConsulta    : string;
  banErrPI      : boolean;
  ban_Datos     : boolean;
begin
  correcto  := False;
  ban_Datos := False;

  while not correcto and odArchivoCarga.Execute do
  begin
    if FileExists (odArchivoCarga.FileName) then
      correcto := True
    else
      ShowMessage ('Archivo inexistente. Por favor seleccione un archivo existente.');
  end;

  if correcto then
  begin
    LCID := GetUserDefaultLCID;

    Excel_Application.Connect;
    //Hace a excel invisible
    Excel_Application.Visible [LCID]       := False;
    Excel_Application.DisplayAlerts [LCID] := False;

    // Abre el archivo
    Excel_Application.Workbooks.Open (odArchivoCarga.FileName,
                                      EmptyParam, //UpdateLinks: OleVariant
                                      EmptyParam, //ReadOnly: OleVariant
                                      EmptyParam, //Format: OleVariant
                                      EmptyParam, //PASSWORD: OleVariant
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
    Excel_Workbook.ConnectTo  (Excel_Application.ActiveWorkbook);
    Excel_Worksheet.ConnectTo (Excel_Application.ActiveSheet AS _Worksheet);

    // Extrae la información de Excel y la inserta en el Grid
    fila            := 2;
    SAGta.RowCount  := 2;
    SAGta.FixedRows := 1;

    valida := Excel_Worksheet.Cells.Item [fila, 'A']; //Cve Estado Mpio.

    while valida <> '' do
    begin
      ban_Datos := True;
      // Limpia las celdas de la fila actual del Grid
      For n:= 0 to SAGta.ColCount - 1 do
        SAGta.Cells [n, SAGta.RowCount - 1] := '';

      Cve_Edo_Mpio  := Excel_Worksheet.Cells.Item [fila, 'A'];
      Desc_Edo_Mpio := Excel_Worksheet.Cells.Item [fila, 'B'];

      SAGta.Cells [0, SAGta.RowCount - 1] := Cve_Edo_Mpio;
      SAGta.Cells [1, SAGta.RowCount - 1] := Desc_Edo_Mpio;

      fila           := fila + 1;
      SAGta.RowCount := SAGta.RowCount + 1;

      valida := Excel_Worksheet.Cells.Item [fila, 'A']; //Cve Estado Mpio.
    end;

    SAGta.RowCount     := SAGta.RowCount - 1;
    lbTotalReg.Caption := IntToStr (SAGta.RowCount - 1);

    Excel_Application.Quit;
    Excel_Worksheet  .DISCONNECT;
    Excel_Workbook   .DISCONNECT;
    Excel_Application.DISCONNECT;
  end;

  if ban_Datos then
    btCarga.Enabled := True;
end;

procedure TWCrEdoMun.btnGenerarEstrucClick(Sender: TObject);
const
  xlWBatWorkSheet       = -4167;

var
  XLApp, XLSheet: Variant;
  i: integer;
  prueba: string;
begin
  if SaveXLS.Execute then
  begin
    XLApp := CreateOleObject('Excel.Application');
    try
      Cursor              := crHourGlass;
      XLApp.Visible       := False;
      XLApp.DisplayAlerts := False;
      XLApp.Workbooks.Add(xlWBatWorkSheet);

      XLSheet := XLApp.Workbooks[1].WorkSheets[1];
      for i := 0 to SAGta.ColCount - 1 do
      begin
          prueba := SAGta.Cells [0, i];
          XLSheet.Cells [1, i + 1].Formula := SAGta.Cells [i, 0];
      end;
      XLSheet.Columns.Autofit;
    finally
      Cursor := crArrow;
      XLApp.Workbooks[1].SaveAs (SaveXLS.FileName);
      if MessageDlg ('Exportación exitosa. Deseas abrir el archivo?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        XLApp.Visible := True
      else
        XLApp.Quit;

      XLSheet  := Unassigned;
      XLApp    := Unassigned;
    end;
  end;
end;

end.
