// Sistema         : Clase de CrAcrReCM
// Fecha de Inicio : 06/04/2011
// Función forma   : Clase de CrAcrReCM
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCracrrecm;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Gauges,
IntParamCre, Excel97, OleServer, Grids,
IntCrActPa,  Aligrid,IntGenCre, ImgList,
IntCrCredito,     //Disposición
IntCrAcredit,     //Acreditado
IntLinkit, IntSGCtrl;

Const
   coCRLF      = #13#10;
   CO_COL_ID  = 0;
   CO_COL_NOMBRE  = CO_COL_ID + 1;
   CO_COL_CHECK = CO_COL_NOMBRE + 1;
   CO_ERROR     = 'ERR';  // Mensaje de Error
   CO_CHECKED   = 'V';
   CO_UNCHECKED = 'F';
   CO_NOTCHECK  = '-';

Type
 TCracrrecm= class; 

  TWCracrrecm=Class(TForm)
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
    ExcelApplicationI: TExcelApplication;
    ExcelWorksheetI: TExcelWorksheet;
    ExcelWorkbookI: TExcelWorkbook;
    odArchivoEntrada: TOpenDialog;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GBVenc: TGroupBox;
    lbArchivoEntrada: TLabel;
    sbArchivoEntrada: TSpeedButton;
    edArchivoEntrada: TEdit;
    bbImportar: TBitBtn;
    pAniBar: TPanel;
    GBAutorizacion: TGroupBox;
    Shape6: TShape;
    Shape7: TShape;
    Label14: TLabel;
    strgrdAcRe: TStringGrid;
    SGDatos: TSGCtrl;
    ImageList: TImageList;
    strgrdAcReNO: TStringGrid;
    rgAcreRecu: TRadioGroup;
    Label1: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Baceptar: TButton;
    vgQryAcreRe: TQuery;
    vgQryAcreReX: TQuery;
    MemoMessage: TRichEdit;
    Rtipobusq: TRadioGroup;
    Label6: TLabel;
    TotRegVal: TLabel;
    TotRegNoVal: TLabel;
    Label7: TLabel;
    LtotalReg: TLabel;
    Label9: TLabel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure bbImportarClick(Sender: TObject);
    procedure sbArchivoEntradaClick(Sender: TObject);
    procedure strgrdAcReDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure strgrdAcReMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BaceptarClick(Sender: TObject);
    procedure rgAcreRecuClick(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);

    private
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCracrrecm;
end;
 TCracrrecm= class(TInterFrame)
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        CAMPO1                   : TInterCampo;

        //Clases Adicionales
        ParamCre                 : TParamCre;

        function    InternalBusca : Boolean; override; 
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published 
      end;
var
nRow, vlRegTot : word;
vlID_CREDITO, vlF_APLICACION:STRING;
vlQry: TQuery;
vlSql: string;

RegistrosBD : TStringList;
RegistrosEX : TStringList;

implementation

Function ExisteAcreditado( var IDAcreditado, NomAcreditado:String; TipBusqueda:String;  Consulta:Tquery; Objeto:TCracrrecm): Boolean;
begin
{   Consulta :=   GetSQLQuery('SELECT count(ID_TITULAR) count FROM CONTRATO WHERE ID_TITULAR ='+QuotedStr(IDAcreditado),Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );

   if Consulta.FieldValues['count'] <> 0 then result := true
   else result := false;
}

   result := true;

   if (TipBusqueda='0') then
   begin
      if (IDAcreditado<>'') then
          vlSql :=' SELECT ID_PERSONA, NOMBRE FROM PERSONA WHERE ID_PERSONA='+IDAcreditado
      else result := false;
   end;

   if (TipBusqueda='1') then
   begin
      if(NomAcreditado<>'') then
//      vlSql :=' SELECT ID_PERSONA, NOMBRE FROM PERSONA WHERE NOMBRE ='+QuotedStr(NomAcreditado)
         vlSql :=' SELECT ID_PERSONA, NOMBRE FROM PERSONA WHERE NOMBRE LIKE '''+NomAcreditado+'%'''
      else result := false;
   end;

   if result then
   begin
      vlQry := GetSQLQuery(vlSql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
      try
        if vlQry <> nil then
        begin
           IDAcreditado :=  vlQry.FieldByName('ID_PERSONA').asString;
           NomAcreditado :=  vlQry.FieldByName('NOMBRE').asString;
           result := true;
        end
        else
           result := false;
      finally
          if vlQry <> nil then vlQry.free;
      end;
   end;   
end;

{$R *.DFM}
procedure InvertCheck(StrinGrid : TStringGrid; nCol, nRow : Integer);
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


procedure ShowData(vgQryAcreRe:TQuery;SGDatos:TSGCtrl;Objeto:TCracrrecm);
var  vConsulta:String;
     i:integer;
begin
   vgQryAcreRe.Close;
   {vConsulta :=  'SELECT DISTINCT ID_ACREDITADO, NOMB_CONTRATO FROM CR_ACRE_RE RE ' +
                 'INNER JOIN CONTRATO CO ON(RE.ID_ACREDITADO = CO.ID_TITULAR)';// WHERE F_BAJA_RECU IS NULL ORDER BY ID_ACREDITADO';

   vgQryAcreRe :=   GetSQLQuery(vConsulta,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );}

   vConsulta :=  'SELECT ID_ACREDITADO, F_ALTA_RECU, (SELECT NOMBRE FROM PERSONA WHERE ID_PERSONA = ID_ACREDITADO) AS NOMBRE '+
                 '  FROM CR_ACRE_RE RE ' +
                 ' WHERE ((F_ALTA_RECU IS NOT NULL)AND(F_BAJA_RECU IS NULL)) '+
                 ' ORDER BY ID_ACREDITADO';


   vgQryAcreRe.SQL.Clear;
   vgQryAcreRe.SQL.Add(vConsulta);
   vgQryAcreRe.Open;
   vgQryAcreRe.FieldByName('ID_ACREDITADO').DisplayLabel := 'ID Acredit.';
   vgQryAcreRe.FieldByName('ID_ACREDITADO').DisplayWidth := 10;

   vgQryAcreRe.FieldByName('F_ALTA_RECU').DisplayLabel := 'F. Alta';
   vgQryAcreRe.FieldByName('F_ALTA_RECU').DisplayWidth := 15;

   vgQryAcreRe.FieldByName('NOMBRE').DisplayLabel := 'Nombre';
   vgQryAcreRe.FieldByName('NOMBRE').DisplayWidth := 80;

   SGDatos.AddQry(vgQryAcreRe,True,True,20,20,20,True);

   RegistrosBD := TStringList.Create;

   vgQryAcreRe.First;
   for i := 1 to vgQryAcreRe.RecordCount do
   begin
      RegistrosBD.Add(vgQryAcreRe.FieldValues['ID_ACREDITADO']);
      vgQryAcreRe.Next;
   end;
   vgQryAcreRe.First;

   vlRegTot:=vgQryAcreRe.RecordCount;
end;

procedure ConfGrid( SGrid : TStringGrid );
begin
 With SGrid Do
   Begin
      ColCount := 3;
      RowHeights[0] := DefaultRowHeight;
      RowCount := 1;
      ColWidths[CO_COL_ID] := 60;
      ColWidths[CO_COL_NOMBRE] := 280;
      ColWidths[CO_COL_CHECK] := 25;
    End;
end;

procedure ConfGrid2( SGrid : TStringGrid );
begin
 With SGrid Do
   Begin
      ColCount := 2;
      RowHeights[0] := DefaultRowHeight;
      RowCount := 1;
      ColWidths[CO_COL_ID] := 60;
      ColWidths[CO_COL_NOMBRE] := 280;
    End;
end;


constructor TCracrrecm.Create( AOwner : TComponent );
begin Inherited; 
      CAMPO1 :=CreaCampo('CAMPO1',ftString,tsNinguno,tsNinguno,False);
                CAMPO1.Caption:='Campo1';
                CAMPO1.Parametro:='CAMPO1';

      StpName  := ' '; 
      UseQuery := False; 
      HelpFile := 'IntCracrrecm.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCracrrecm.Destroy;
begin inherited;
end;


function TCracrrecm.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCracrrecm;
begin
   W:=TWCracrrecm.Create(Self);
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


Function TCracrrecm.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICracrre.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TCracrrecm.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CrAcrReCM********************)
(*                                                                              *)
(*  FORMA DE CrAcrReCM                                                            *)
(*                                                                              *)
(***********************************************FORMA CrAcrReCM********************)

procedure TWCracrrecm.FormShow(Sender: TObject);
var i:integer;
begin
 With Objeto Do
   Begin
      CAMPO1.Control:=edCAMPO1;

      lbDempresa.Caption := ParamCre.EMPRESA.AsString;
      lbDfecha.Caption   := ParamCre.FECHA.AsString;
      lbDUsuario.Caption := ParamCre.USUARIO.AsString;
      lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

      InterForma1.BtnAyuda.Visible:=False;
      InterForma1.BtnSalir.Visible:=False;
   end;
end;

procedure TWCracrrecm.FormDestroy(Sender: TObject);
begin
      Objeto.CAMPO1.Control:=nil;
   //Objeto
end;

procedure TWCracrrecm.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCracrrecm.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCracrrecm.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;


Function Cortacomilla(PPCadena : String):String;
var
   vlIndex, vlTotal: Integer;
   vlCar: String;
begin
   vlTotal:= Length (Trim(PPCadena));

   vlCar:='';
   for vlIndex := 1 to vlTotal do
   begin
      if PPCadena[vlIndex] <> '''' then
         vlCar:= vlCar + Copy(PPCadena, vlIndex, 1)
      else exit;
   end;
   result:=vlCar;
end;

procedure TWCracrrecm.bbImportarClick(Sender: TObject);
var
  LCID: integer;
  fila: integer;
  valida: String;

  //Para la barra de progreso
  ani: TAniBarThread;
  r: TRect;
  i:integer;

  vlMesg:string;

  vlidpersona, vlnombre:string;
  vlCountRegVal, vlCountRegNoVal: Double;

  vlQryCAR: TQuery;
  vlSqlCAR: string;
  vlQryCAR2: TQuery;
  vlSqlCAR2: string;
begin
   if Objeto.ValidaAccesoEsp('TCRACRRECM_IMPOR',True,True) then
   begin
       if Trim(edArchivoEntrada.Text) = '' then
       begin
          ShowMessage('Seleccione un archivo');
          Exit;
       end;

       RegistrosEX := TStringList.Create;
       ClearGrid(strgrdAcRe,0);
       ClearGrid(strgrdAcReNO,0);
       ConfGrid(strgrdAcRe);
       ConfGrid2(strgrdAcReNO);
       MemoMessage.Clear;
       nRow := 0;

       TotRegNoVal.Caption:='0';
       TotRegVal.Caption:='0';

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

          valida := trim(ExcelWorksheetI.Cells.Item[fila, 'A'])+trim(ExcelWorksheetI.Cells.Item[fila, 'B']);
          while (valida <> '') do
          begin
            // Extrae la información

             //Añadimos si exsite en la BD a la lista a actualizar
             vlidpersona:=Trim(ExcelWorksheetI.Cells.Item[fila, 'A']);
             vlnombre:=Trim(ExcelWorksheetI.Cells.Item[fila, 'B']);

             if vlnombre<>'' then vlnombre:=Cortacomilla(vlnombre);

             if ExisteAcreditado(vlidpersona,vlnombre,IntToSTr(Rtipobusq.ItemIndex),vgQryAcreReX,Objeto) then
             Begin
                if Rtipobusq.ItemIndex = 0 then
                begin
                   strgrdAcRe.Cells[CO_COL_ID,strgrdAcRe.RowCount-1] := vlidpersona;
                   strgrdAcRe.Cells[CO_COL_NOMBRE,strgrdAcRe.RowCount-1] := vlnombre;
                   strgrdAcRe.Cells[CO_COL_CHECK,strgrdAcRe.RowCount-1] := CO_CHECKED;
                   RegistrosEX.Add(strgrdAcRe.Cells[0,strgrdAcRe.RowCount-1]);
                   strgrdAcRe.RowCount := strgrdAcRe.RowCount +1;
                   vlCountRegVal:= vlCountRegVal + 1;
                end
                else
                begin
                   vlSqlCAR:='SELECT ID_PERSONA, NOMBRE FROM PERSONA WHERE NOMBRE ='+QuotedStr(vlnombre);
                   vlQryCAR := GetSQLQuery(vlSqlCAR,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
                   try
                      while not vlQryCAR.Eof do
                      begin
                         vlSqlCAR2:='SELECT ID_ACREDITADO FROM CR_ACREDITADO WHERE ID_ACREDITADO ='+vlQryCAR.FieldByName('ID_PERSONA').asString;
                         vlQryCAR2 := GetSQLQuery(vlSqlCAR2,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
                         try
                           if vlQryCAR2 <> nil then
                           begin
                              strgrdAcRe.Cells[CO_COL_ID,strgrdAcRe.RowCount-1] := vlQryCAR2.FieldByName('ID_ACREDITADO').asString;
                              strgrdAcRe.Cells[CO_COL_NOMBRE,strgrdAcRe.RowCount-1] := vlnombre;
                              strgrdAcRe.Cells[CO_COL_CHECK,strgrdAcRe.RowCount-1] := CO_CHECKED;
                              RegistrosEX.Add(strgrdAcRe.Cells[0,strgrdAcRe.RowCount-1]);
                              strgrdAcRe.RowCount := strgrdAcRe.RowCount +1;
                              vlCountRegVal:= vlCountRegVal + 1;
                           end;
                         finally
                           if vlQryCAR2 <> nil then vlQryCAR2.free;
                         end;
                         vlQryCAR.Next;
                      end;
                   finally
                      if vlQryCAR <> nil then vlQryCAR.free;
                   end;
                end;
             end
             else
             Begin
                strgrdAcReNO.Cells[CO_COL_ID,strgrdAcReNO.RowCount-1] := Trim(ExcelWorksheetI.Cells.Item[fila, 'A']);
                strgrdAcReNO.Cells[CO_COL_NOMBRE,strgrdAcReNO.RowCount-1] := Trim(ExcelWorksheetI.Cells.Item[fila, 'B']);
                strgrdAcReNO.RowCount := strgrdAcReNO.RowCount +1;
                vlCountRegNoVal:= vlCountRegNoVal + 1;
             end;

            inc(fila);
            valida := trim(ExcelWorksheetI.Cells.Item[fila, 'A'])+trim(ExcelWorksheetI.Cells.Item[fila, 'B']);
          end;

        finally
          //detiene la barra de progreso
          TotRegNoVal.Caption:=FormatFloat('###,##0',vlCountRegNoVal);
          TotRegVal.Caption:=FormatFloat('###,##0',vlCountRegVal);

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

      except
        on e: Exception do
        begin
          MessageDlg('No se importó completo el archivo.' +
            IntToStr(Fila) + e.Message, mtError, [mbOK], 0);
        end;
      end;
   end;
end;

  strgrdAcRe.RowCount := strgrdAcRe.RowCount -1;
  strgrdAcReNO.RowCount := strgrdAcReNO.RowCount -1;

End;

procedure TWCracrrecm.sbArchivoEntradaClick(Sender: TObject);
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

procedure TWCracrrecm.strgrdAcReDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var str : String;
    Bmp : TBitmap;
    sTexto: String;           // Texto que va a imprimir en la celda actual
    Alineacion: TAlignment;   // Alineación que le vamos a dar al texto
    iAnchoTexto: Integer;     // Ancho del texto a imprimir en pixels
    Coordenadas : Trect;
begin
 If (Sender Is TStringGrid) Then
  With (Sender As TStringGrid) Do
   Begin
      If (gdSelected In State) Then Canvas.Brush.Color := clWhite;

      Canvas.Font.Color := clBlack;
      {
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
      end;                       {
      If (Cells[CO_COL_SITPROCESO,ARow] = 'Procesado') then
      begin
         Canvas.Font.Color := clGreen;
         Canvas.Font.Style := [fsBold];
      end;
      Canvas.TextRect(Rect,Rect.Left,Rect.Top,Cells[ACol, ARow]);
      }

      if (ACol = CO_COL_ID)or(ACol = CO_COL_CHECK) then
         Alineacion := taCenter;

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
         Else
         ImageList.GetBitmap(0,Bmp);

         Canvas.Draw(Rect.Left,Rect.Top,Bmp);
         Bmp.FreeImage;
         Bmp.Free;
      End;

  End;
end;


procedure TWCracrrecm.strgrdAcReMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  var nCol, nRow : Integer;
begin
   strgrdAcRe.MouseToCell(X, Y, nCol, nRow);
   if nCol = CO_COL_CHECK then
   begin
      //if strgrdAcRe.Cells[CO_COL_SITCRE, nRow] <> 'Error en Validacion' then
         InvertCheck(strgrdAcRe, CO_COL_CHECK, nRow);
   end;
end;

function ExistenPeriodosAbiertos(IDAcreditado:String; Consulta:TQuery; Objeto:TCracrrecm): Boolean;
begin
   Consulta := GetSQLQuery('SELECT count(ID_ACREDITADO) count FROM CR_ACRE_RE WHERE ' +
                'F_ALTA_RECU IS NOT NULL AND F_BAJA_RECU IS NULL AND ID_ACREDITADO ='+QuotedStr(IDAcreditado),
                Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );

   if Consulta.FieldValues['count'] <> 0 then result := true
   else result := false;

   if Consulta <> nil then Consulta.free;   
end;


procedure TWCracrrecm.BaceptarClick(Sender: TObject);
var
   i:integer;
   vlIDAcreditado,vlAcreditado,vlcheck:String;
   PeriodosAbiertos:Boolean;
   vlconsulta, vlinsert, vlupdate, vlacreditados:String;
   vgQryAcreReAux :TQuery;
   B_procesar, B_numAcre:boolean;
   len:integer;

   vlcountUpdAcre:byte;

begin
   if Objeto.ValidaAccesoEsp('TCRACRRECM_PROC',True,True) then
   begin
       B_procesar:= false;
       vlconsulta := 'BEGIN ' + #13;
       vlacreditados := '';
       vlcountUpdAcre:=0;

       vlinsert := 'INSERT INTO CR_ACRE_RE VALUES(P_ID_ACREDITADO,'+
                  ' NVL((SELECT MAX(ID_REC) +1 FROM CR_ACRE_RE WHERE ID_ACREDITADO = P_ID_ACREDITADO),1),'+
                  'TO_DATE('+QuotedStr(DatetoStr(Objeto.Apli.DameFechaEmpresa))+','+QuotedStr('DD/MM/YYYY')+'),null,' +  //mm/dd/yyyy HERJA LOS MESES ESTABAN INCORRECTOS
                  'TO_DATE('+QuotedStr(DatetoStr(Objeto.Apli.DameFechaEmpresa))+','+QuotedStr('DD/MM/YYYY')+'),' +
                  'null,'+ //'TO_DATE('+QuotedStr(DatetoStr(now))+','+QuotedStr('mm/dd/yyyy')+'),' +
                  QuotedStr(Objeto.Apli.Usuario) + ','+
                  'null'+ //QuotedStr(Objeto.Apli.Usuario) +
                  ');'+#13;

       vlupdate := 'UPDATE CR_ACRE_RE SET F_BAJA_RECU = TO_DATE('+QuotedStr(DatetoStr(Objeto.Apli.DameFechaEmpresa))+','+QuotedStr('DD/MM/YYYY')+'), '+
                   'F_BAJA = TO_DATE('+QuotedStr(DatetoStr(Objeto.Apli.DameFechaEmpresa))+','+QuotedStr('DD/MM/YYYY')+'), '+
                   'CVE_USU_BAJA = '+QuotedStr(Objeto.Apli.Usuario) +
                   ' WHERE ID_ACREDITADO in (P_ID_ACREDITADO);' + #13;

       Memomessage.Lines.Clear;
       Memomessage.SelStart :=0;
       for i := 0 to  strgrdAcRe.RowCount -1 do
       begin
          vlIDAcreditado:=strgrdAcRe.cells[CO_COL_ID,i];
          vlAcreditado:=strgrdAcRe.cells[CO_COL_NOMBRE,i];
          vlcheck:=strgrdAcRe.cells[CO_COL_CHECK,i];
          if vlcheck <> CO_CHECKED then continue;

          PeriodosAbiertos:=ExistenPeriodosAbiertos(vlIDAcreditado,vgQryAcreReAux,Objeto);

          if rgAcreRecu.ItemIndex = 0 then
          begin
             If PeriodosAbiertos then
             Begin
                Memomessage.SelAttributes.Color := clRed;
                Memomessage.SelText := 'Acreditado '+ vlIDAcreditado+': '+vlAcreditado+': Ya está en recuperación...' + #13;
                continue;
             end;
             Memomessage.SelAttributes.Color := clBlack;
             Memomessage.SelText := 'Acreditado '+ vlIDAcreditado+': Ok...' + #13;

             vlconsulta := vlconsulta + StringReplace(vlinsert,'P_ID_ACREDITADO',QuotedStr(vlIDAcreditado), [rfReplaceAll, rfIgnoreCase]);
             B_procesar := true;
          end
          else
          begin
             If not(PeriodosAbiertos) then
             Begin
                Memomessage.SelAttributes.Color := clRed;
                Memomessage.SelLength := length(Memomessage.lines.Strings[Memomessage.Lines.count -1]);
                continue;
             end;
             Memomessage.SelAttributes.Color := clBlack;
             Memomessage.SelText := 'Acreditado '+ vlIDAcreditado+': Ok...' + #13;
             vlAcreditados := vlAcreditados  + QuotedStr(vlIDAcreditado) + ', ';
             B_numAcre:=true;

             vlcountUpdAcre:=vlcountUpdAcre+1;
             if vlcountUpdAcre=50 then
             begin
                vlconsulta := vlconsulta + StringReplace(vlupdate,'P_ID_ACREDITADO',copy(vlAcreditados,1,length(vlAcreditados)-2), [rfReplaceAll, rfIgnoreCase]);
                vlcountUpdAcre:=0;
                vlAcreditados:='';
                B_numAcre:=false;
             end;

             B_procesar := true;
          end;
       end;

       if B_numAcre=true then
          vlconsulta := vlconsulta + StringReplace(vlupdate,'P_ID_ACREDITADO',copy(vlAcreditados,1,length(vlAcreditados)-2), [rfReplaceAll, rfIgnoreCase]);

    {   if rgAcreRecu.ItemIndex = 1 then
          vlconsulta := vlconsulta + StringReplace(vlupdate,'P_ID_ACREDITADO',copy(vlAcreditados,1,length(vlAcreditados)-2), [rfReplaceAll, rfIgnoreCase]);
     }

       vlConsulta := vlconsulta + 'COMMIT;' + #13 + 'END;';
       Memomessage.SelAttributes.Color := clBlack;
       if Not B_procesar then ShowMEssage('No existen registros a procesar...');;
       Memomessage.SelText := '<<<Fin de archivo...>>>';

       //Memomessages.Lines.Clear;
       //Memomessages.Lines.Add(consulta);
       if B_procesar then
       begin
          try
            vgQryAcreReAux := TQuery.Create(Self);
            vgQryAcreReAux.DatabaseName  := Objeto.Apli.DataBaseName;
            vgQryAcreReAux.SessionName   := Objeto.Apli.SessionName;
            vgQryAcreReAux.SQL.Add(vlconsulta);
            vgQryAcreReAux.SQL.SaveToFile('c:\CMacrere.txt');
            vgQryAcreReAux.ExecSQL;
            ShowMEssage('Archivo procesado...');
          finally
            vgQryAcreReAux.close;
          end;
       end;
   end;
end;

procedure TWCracrrecm.rgAcreRecuClick(Sender: TObject);
begin
   ClearGrid(strgrdAcRe,0);
   ClearGrid(strgrdAcReNO,0);
   TotRegNoVal.Caption:='0';
   TotRegVal.Caption:='0';
   edArchivoEntrada.Text:='';
   MemoMessage.Clear;
end;

procedure TWCracrrecm.TabSheet1Show(Sender: TObject);
begin
   if vgQryAcreRe.Active=false then
   begin
      vgQryAcreRe.DatabaseName := Objeto.Apli.DataBaseName;
      vgQryAcreRe.SessionName  := Objeto.Apli.SessionName;
   end;

   if vgQryAcreReX.Active=false then
   begin
      vgQryAcreReX.DatabaseName := Objeto.Apli.DataBaseName;
      vgQryAcreReX.SessionName  := Objeto.Apli.SessionName;
   end;

   ShowData(vgQryAcreRe,SGDatos,Objeto);
   LtotalReg.Caption:=FormatFloat('###,##0',vlRegTot);
end;

procedure TWCracrrecm.TabSheet2Show(Sender: TObject);
begin
   ClearGrid(strgrdAcRe,0);
   ClearGrid(strgrdAcReNO,0);
   TotRegNoVal.Caption:='0';
   TotRegVal.Caption:='0';
   edArchivoEntrada.Text:='';
   MemoMessage.Clear;
   rgAcreRecu.ItemIndex:=0;
   Rtipobusq.ItemIndex:=0;
end;


end.

