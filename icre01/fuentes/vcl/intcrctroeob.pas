// Sistema         : Clase de CrCtRoeOb
// Fecha de Inicio : 10/07/2013
// Función forma   : Clase de CrCtRoeOb
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Qfzmuizmxrhxlligvtzuolivh
// Comentarios     :
Unit IntCrctroeob;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
IntParamCre, InterEdit, Grids, IntGenCre
;

const
   CO_COL_RANGO  = 0;
   CO_COL_MINPZO = CO_COL_RANGO + 1;
   CO_COL_MAXPZO = CO_COL_MINPZO + 1;
   CO_COL_MINMTO = CO_COL_MAXPZO + 1;
   CO_COL_MAXMTO = CO_COL_MINMTO + 1;
   CO_COL_ROEOBJ = CO_COL_MAXMTO + 1;
   CO_COL_PRODBC = CO_COL_ROEOBJ + 1;
                                                        

Type
 TCrctroeob= class; 

  TWCrctroeob=Class(TForm)
    InterForma1             : TInterForma;
    GroupBox1: TGroupBox;
    strgrdDatos: TStringGrid;
    edCveProd: TInterEdit;
    edDescProd: TInterEdit;
    Label6: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    lbCVE_GRUPO_ECO: TLabel;
    Label1: TLabel;
    Panel1: TPanel;
    Panel3: TPanel;
    Shape4: TShape;
    Label4: TLabel;
    Shape1: TShape;
    Label5: TLabel;
    Label9: TLabel;
    Shape2: TShape;
    Shape3: TShape;
    Label10: TLabel;
    Shape5: TShape;
    Label11: TLabel;
    Shape6: TShape;
    Label12: TLabel;
    edIdRango: TInterEdit;
    edPlazoMin: TInterEdit;
    edPlazoMax: TInterEdit;
    edRoeObj: TInterEdit;
    edImpMin: TInterEdit;
    edImpMax: TInterEdit;
    procedure ConfGrid( SGrid : TStringGrid );
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure strgrdDatosDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure strgrdDatosMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure InterForma1Buscar(Sender: TObject);
    procedure InterForma1AntesNuevo(Sender: TObject;
      var Realizado: Boolean);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    procedure InterForma1AntesEliminar(Sender: TObject;
      var Realizado: Boolean);
    procedure edPlazoMinExit(Sender: TObject);
    procedure edPlazoMaxExit(Sender: TObject);
    procedure edImpMaxExit(Sender: TObject);
    private 
    { Private declarations }
    procedure MuestraDatos;
    Function QuitaComas(PPCadena : String):String;

    public 
    { Public declarations } 
    Objeto : TCrctroeob;
    Function  CargaDatos : boolean;
    Function  ActualizaDatos : boolean;
    Function  ActualizaElimina : boolean;
end; 
 TCrctroeob= class(TInterFrame) 
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ParamCre       : TParamCre;

        CVE_PRODUCTO_BCA  : TInterCampo;
        DESC_PROD_BCA     : TInterCampo;
        ID_RANGO          : TInterCampo;
        MIN_PLAZO         : TInterCampo;
        MAX_PLAZO         : TInterCampo;
        MIN_MONTO         : TInterCampo;
        MAX_MONTO         : TInterCampo;
        ROE_OBJETIVO      : TInterCampo;


        function    InternalBusca : Boolean; override; 
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override; 
        function    Reporte:Boolean; override; 
      published 
      end;

  var
     nRow   : word;
     vlsql  : String;
     Query1 : TQuery;

     vgprodbca : String;
     vgdescprod : String;

     vgminplazo : String;
     vgminmonto : String;

     vgprimerreg : Boolean;
     vgplazomax : String;
     vgmontomax : String;

     vgsalidaplazo, vgsalidamonto : Boolean;


implementation
//Uses RepMon;

{$R *.DFM}   

constructor TCrctroeob.Create( AOwner : TComponent );
begin Inherited; 

     CVE_PRODUCTO_BCA :=CreaCampo('CVE_PRODUCTO_BCA',ftString,tsNinguno,tsNinguno,True);
                    CVE_PRODUCTO_BCA.Caption:='Clave Producto Bca';

     DESC_PROD_BCA := CreaCampo('DESC_PROD_BCA',ftString,tsNinguno,tsNinguno,False);
                          DESC_PROD_BCA.Caption := 'Desc. Prod Banca';

     ID_RANGO :=CreaCampo('ID_RANGO',ftInteger,tsNinguno,tsNinguno,True);
                    ID_RANGO.Caption:='Id Rango';

     MIN_PLAZO :=CreaCampo('MIN_PLAZO',ftInteger,tsNinguno,tsNinguno,True);
                    MIN_PLAZO.Caption:='Plazo Mínimo';

     MAX_PLAZO :=CreaCampo('MAX_PLAZO',ftInteger,tsNinguno,tsNinguno,True);
                    MAX_PLAZO.Caption:='Plazo Máximo';

     MIN_MONTO :=CreaCampo('MIN_MONTO',ftFloat,tsNinguno,tsNinguno,True);
                    MIN_MONTO.Caption:='Monto Mínimo';

     MAX_MONTO :=CreaCampo('MAX_MONTO',ftFloat,tsNinguno,tsNinguno,True);
                    MAX_MONTO.Caption:='Monto Máximo';

     ROE_OBJETIVO :=CreaCampo('ROE_OBJETIVO',ftInteger,tsNinguno,tsNinguno,True);
                    ROE_OBJETIVO.Caption:='ROE Objetivo';


      FKeyFields.Add('CVE_PRODUCTO_BCA');
      FKeyFields.Add('ID_RANGO');
      TableName := 'CR_PRODBCA_ROE';
//      StpName  := ' ';
      UseQuery := True; 
      HelpFile := 'IntCrctroeob.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrctroeob.Destroy;
begin inherited;
end;


function TCrctroeob.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrctroeob;
begin
   W:=TWCrctroeob.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowBtnModificar := False;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrctroeob.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrctroe.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TCrctroeob.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CrCtRoeOb********************)
(*                                                                              *)
(*  FORMA DE CrCtRoeOb                                                            *)
(*                                                                              *)
(***********************************************FORMA CrCtRoeOb********************)

procedure TWCrctroeob.FormShow(Sender: TObject);
begin
      Objeto.CVE_PRODUCTO_BCA.Control := edCveProd;
      Objeto.DESC_PROD_BCA.Control := edDescProd;
      Objeto.ID_RANGO.Control := edIdRango;
      Objeto.ROE_OBJETIVO.Control := edRoeObj;
      Objeto.MIN_PLAZO.Control := edPlazoMin;
      Objeto.MAX_PLAZO.Control := edPlazoMax;
      Objeto.MIN_MONTO.Control := edImpMin;
      Objeto.MAX_MONTO.Control := edImpMax;
      MuestraDatos;

      edImpMin.Enabled := True;
      edPlazoMax.Enabled := True;
      edImpMin.Enabled := True;
      edImpMax.Enabled := True;

      vgprodbca :=  edCveProd.Text;
      vgdescprod := edDescProd.Text;
      vgprimerreg := False;
end;

procedure TWCrctroeob.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_PRODUCTO_BCA.Control := nil;
      Objeto.DESC_PROD_BCA.Control := nil;      
      Objeto.ID_RANGO.Control := nil;
      Objeto.ROE_OBJETIVO.Control := nil;
      Objeto.MIN_PLAZO.Control := nil;
      Objeto.MAX_PLAZO.Control := nil;
      Objeto.MIN_MONTO.Control := nil;
      Objeto.MAX_MONTO.Control := nil;
end;

procedure TWCrctroeob.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrctroeob.InterForma1DespuesNuevo(Sender: TObject);
var vlsql,vlsql2  : String;
    Query1,Query2 : TQuery;
begin
     edCveProd.Text := vgprodbca;
     edDescProd.Text := vgdescprod;
     vgplazomax := '';
     vgmontomax := '';

     vlsql := ' SELECT COUNT (*) contador '+
              '   FROM cr_prodbca_roe '+
              '  WHERE cve_producto_bca = '''+edCveProd.text+'''';
     Query1 := GetSQLQuery(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
     //determina primer registro
     if Query1.FieldByName('CONTADOR').AsString = '0' then
     begin
     edIdRango.Text := '1';
     edIdRango.ReadOnly := True;

     edPlazoMin.Text := '0';
     edPlazoMin.Enabled := False;

     edImpMin.text := '0';
     edImpMin.Enabled := False;

     edPlazoMax.Text := '99999';
     edPlazoMax.Enabled := False;
     edImpMax.Text := '99999999999999.00';
     edImpMax.Enabled := False;
     vgprimerreg := True;
     edRoeObj.SetFocus;
     end
     else
      //determina a partir del segundo registro
     begin
     edIdRango.Text := IntToStr(StrToinT(Query1.FieldByName('CONTADOR').AsString) + 1);
     edIdRango.ReadOnly := True;
     vlsql2 := ' SELECT max(min_plazo) PLAZO_MIN, max(min_monto) MIN_MONTO'+
               '   FROM cr_prodbca_roe'+
               '  WHERE cve_producto_bca = '''+edCveProd.text+'''';
     Query2 := GetSQLQuery(vlsql2, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
     edPlazoMin.Text := Query2.FieldByName('PLAZO_MIN').AsString;
     edPlazoMin.Enabled := False;
     edImpMin.Text := Query2.FieldByName('MIN_MONTO').AsString;
     edImpMin.Enabled := False;
     //asigna variables plazo y monto
     vgminplazo := Query2.FieldByName('PLAZO_MIN').AsString;
     vgminmonto := Query2.FieldByName('MIN_MONTO').AsString;

     edPlazoMax.Text := '';
     edPlazoMax.Enabled := True;

     edImpMax.Text := '';
     edImpMax.Enabled := True;
     vgprimerreg := False;
     edPlazoMax.SetFocus;
     end;
end;

procedure TWCrctroeob.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrctroeob.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte;
//end;


procedure TWCrctroeob.MuestraDatos;
var
  LCID   : integer;
  fila   : integer;
  valida : String;

  bResult : Boolean;
  vlmesant:string;
begin
    ClearGrid(strgrdDatos,0);
    ConfGrid(strgrdDatos);
    nRow := 0;

        vlsql :=  '  SELECT ID_RANGO, MIN_PLAZO, MAX_PLAZO, MIN_MONTO, MAX_MONTO, ROE_OBJETIVO, CVE_PRODUCTO_BCA' +
                  '    FROM CR_PRODBCA_ROE' +
                  '   WHERE 1 = 1' +
                  '     AND CVE_PRODUCTO_BCA =  '''+edCveProd.Text+''''+
                  '   ORDER BY ID_RANGO, MIN_PLAZO, MAX_PLAZO, MIN_MONTO, MAX_MONTO';

  Query1 := GetSQLQuery(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );

      if Query1 = nil then
         begin
         ShowMessage('  ¡ No se encontró información !');
         end
      else
      begin
   fila := 2;
   try
    while not Query1.EOF do
      begin
         try
          with strgrdDatos do  begin
           Cells[CO_COL_RANGO, nRow] := Query1.FieldByName('ID_RANGO').AsString;
           Cells[CO_COL_MINPZO, nRow]  := Query1.FieldByName('MIN_PLAZO').AsString;
           Cells[CO_COL_MAXPZO, nRow]  := Query1.FieldByName('MAX_PLAZO').AsString;
           Cells[CO_COL_MINMTO, nRow]  := FormatFloat('###,###,##0.00', StrToFloat(Query1.FieldByName('MIN_MONTO').AsString));//Query1.FieldByName('MIN_MONTO').AsString;
           Cells[CO_COL_MAXMTO, nRow]  := FormatFloat('###,###,##0.00', StrToFloat(Query1.FieldByName('MAX_MONTO').AsString));//Query1.FieldByName('MAX_MONTO').AsString;
           Cells[CO_COL_ROEOBJ, nRow]  := Query1.FieldByName('ROE_OBJETIVO').AsString;
           Cells[CO_COL_PRODBC, nRow]  := Query1.FieldByName('CVE_PRODUCTO_BCA').AsString;
         end;
         finally
         end;
         Query1.Next;
         nRow:=nRow+1;
         inc(fila);
         strgrdDatos.RowCount   := fila-2;
      end;
      Query1.Close;
     finally
       if Query1 <> nil then
          Query1.free;
     end;
   end;
End;

procedure TWCrctroeob.strgrdDatosDrawCell(Sender: TObject; ACol,
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
         Canvas.TextRect(Rect,Rect.Left,Rect.Top,Cells[ACol, ARow]);
      if (ACol = CO_COL_MINPZO) or(ACol = CO_COL_MAXPZO) or(ACol = CO_COL_MINMTO) or
         (ACol = CO_COL_MAXMTO) or(ACol = CO_COL_ROEOBJ) then
         Alineacion := taRightJustify;

      if (ACol = CO_COL_RANGO)  then
         Alineacion := taCenter;

      sTexto := Cells[ACol,ARow];
      Canvas.FillRect( Rect );
      iAnchoTexto := Canvas.TextWidth( sTexto );

      case Alineacion of
        taLeftJustify:  Canvas.TextOut( Rect.Left + 5, Rect.Top + 2, sTexto );
        taCenter:       Canvas.TextOut( Rect.Left + ( ( Rect.Right - Rect.Left ) - iAnchoTexto ) div 2, Rect.Top + 2, sTexto );
        taRightJustify: Canvas.TextOut( Rect.Right - iAnchoTexto - 2, Rect.Top + 2, sTexto );
      end;
   End;
end;

procedure TWCrctroeob.strgrdDatosMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
 var
  nCol, nRow : Integer;
  vlrango, vlminpzo, vlmaxpzo, vlminmto, vlmaxmto, vlroeob, vlprodbca : String;
begin
   strgrdDatos.MouseToCell(X, Y, nCol, nRow);
   if trim(strgrdDatos.Cells[CO_COL_RANGO, nRow]) <> '' then
      begin
      vlrango := strgrdDatos.Cells[CO_COL_RANGO, nRow];
      vlminpzo := strgrdDatos.Cells[CO_COL_MINPZO, nRow];
      vlmaxpzo := strgrdDatos.Cells[CO_COL_MAXPZO, nRow];
      vlminmto := strgrdDatos.Cells[CO_COL_MINMTO, nRow];
      vlmaxmto := strgrdDatos.Cells[CO_COL_MAXMTO, nRow];
      vlroeob := strgrdDatos.Cells[CO_COL_ROEOBJ, nRow];
      vlprodbca := strgrdDatos.Cells[CO_COL_PRODBC, nRow];
      Objeto.FindKey([vlprodbca,vlrango]);

      edIdRango.Text := vlrango;
      edPlazoMin.Text := vlminpzo;
      edPlazoMax.Text := vlmaxpzo;
      edImpMin.Text := vlminmto;
      edImpMax.Text := vlmaxmto;
      edRoeObj.Text := vlroeob;
      edDescProd.Text := vgdescprod;
      end;
end;

procedure TWCrctroeob.ConfGrid(SGrid: TStringGrid);
begin
 With SGrid Do
   Begin
      ColCount := 7;
      RowHeights[0] := DefaultRowHeight;
      RowCount := 1;
      ColWidths[CO_COL_RANGO] := 57;
      ColWidths[CO_COL_MINPZO] := 55;
      ColWidths[CO_COL_MAXPZO] := 55;
      ColWidths[CO_COL_MINMTO] := 120;
      ColWidths[CO_COL_MAXMTO] := 120;
      ColWidths[CO_COL_ROEOBJ] := 53;
      ColWidths[CO_COL_PRODBC] := 0;
    End;
end;

procedure TWCrctroeob.InterForma1Buscar(Sender: TObject);
begin
MuestraDatos;
end;

procedure TWCrctroeob.InterForma1AntesNuevo(Sender: TObject;
  var Realizado: Boolean);
begin
    vgprodbca :=  edCveProd.Text;
    vgdescprod := edDescProd.Text;
end;

procedure TWCrctroeob.InterForma1DespuesCancelar(Sender: TObject);
begin
    edCveProd.Text := vgprodbca;
    edDescProd.Text := vgdescprod;
    MuestraDatos;
end;

procedure TWCrctroeob.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   //nuevo
   if IsNewData then
   Begin
      if MessageDlg('¿Desea almacenar los datos capturados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
          begin
            if vgprimerreg = False then
               CargaDatos;
            Realizado := True
          end
      else  Realizado := False;
   end
   else
   Begin
      if MessageDlg('¿Desea guardar los datos modificados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
           Realizado := True
      else Realizado := False;
   end
end;

function TWCrctroeob.QuitaComas(PPCadena: String): String;
var
   vlIndex, vlTotal : Integer;
   vlCar,vlRenglon: String;
begin
   vlTotal:= Length (Trim(PPCadena));
   vlRenglon:='';

   for vlIndex := 1 to vlTotal do
   begin
      vlCar:= Copy(PPCadena, vlIndex, 1);
      if  vlCar <> ',' then vlRenglon:=vlRenglon+vlCar;
   end;
   QuitaComas:=vlRenglon;
end;

procedure TWCrctroeob.InterForma1DespuesAceptar(Sender: TObject);
begin
   if vgprimerreg = False then
      ActualizaDatos;
      edCveProd.Text := vgprodbca;
      edDescProd.Text := vgdescprod;
      MuestraDatos;
end;

procedure TWCrctroeob.InterForma1DespuesEliminar(Sender: TObject);
begin
 if vgprimerreg = False then
    ActualizaElimina;
    edCveProd.Text :=  vgprodbca;
    edDescProd.text := vgdescprod;
    MuestraDatos;
end;

procedure TWCrctroeob.InterForma1AntesEliminar(Sender: TObject;
  var Realizado: Boolean);
begin
  if (edPlazoMax.Text <> '99999') and (edImpMax.Text <> '99999999999999.00') then
    begin
    ShowMessage('  ERROR: El registro que intenta eliminar, no corresponde al último.');
    Realizado := False;
    end;
end;

procedure TWCrctroeob.edPlazoMinExit(Sender: TObject);
var vlsql  : String;
    Query1 : TQuery;
begin
{      vlsql  :=  'select count(*) REG from cr_prodbca_roe where cve_producto_bca = '''+edCveProd.Text+'''';
      Query1 := GetSQLQuery(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
      if Query1.FieldByName('REG').AsString >= '1' then
      begin
      if edPlazoMin.Text = '0' then
        begin
        Showmessage('   ERROR: El Plazo Mínimo debe ser mayor a Cero');
        edPlazoMin.Text := '';
        edPlazoMin.SetFocus;
        end
      else if edPlazoMin.Text <= vgminplazo then
      begin
        Showmessage('   ERROR: El Plazo Debe ser Mayor a '+ vgminplazo);
          edPlazoMin.Text := '';
          edPlazoMin.SetFocus;
      end;

      end;  }
end;


function TWCrctroeob.CargaDatos: boolean;
var VLSalida: Boolean;
    vlsql   : String;
Begin
   vlsql :=  ' update cr_prodbca_roe '+
             '    set max_plazo = '+edPlazoMax.Text+','+
             '        max_monto = '+edImpMax.Text+
             '  where cve_producto_bca = '+#39+edCveProd.text+#39+
             '    and id_rango = (select max(id_rango) from cr_prodbca_roe where cve_producto_bca = '+#39+edCveProd.text+#39+')'+
             '    and min_plazo = (select max(min_plazo) from cr_prodbca_roe where cve_producto_bca = '+#39+edCveProd.text+#39+')';
   VLSalida := RunSQL(vlsql,objeto.Apli.DataBaseName,objeto.Apli.SessionName,False);
   CargaDatos := VLSalida;
end;


function TWCrctroeob.ActualizaDatos: boolean;
var VLSalida: Boolean;
    vlsql   : String;
Begin
   vlsql :=  ' update cr_prodbca_roe '+
             '    set max_plazo = 99999,'+
             '        max_monto = 99999999999999.00,'+
             '        min_plazo = '+vgplazomax+
             '       ,min_monto = '+vgmontomax+
             '  where cve_producto_bca = '+#39+edCveProd.text+#39+
             '    and id_rango = (select max(id_rango) from cr_prodbca_roe where cve_producto_bca = '+#39+edCveProd.text+#39+')'+
             '    and min_plazo = (select max(min_plazo) from cr_prodbca_roe where cve_producto_bca = '+#39+edCveProd.text+#39+')';
   VLSalida := RunSQL(vlsql,objeto.Apli.DataBaseName,objeto.Apli.SessionName,False);
   ActualizaDatos := VLSalida;
end;


function TWCrctroeob.ActualizaElimina: boolean;
var VLSalida: Boolean;
    vlsql   : String;
Begin
   vlsql :=  ' update cr_prodbca_roe '+
             '    set max_plazo = 99999,'+
             '        max_monto = 99999999999999.00'+
             '  where cve_producto_bca = '+#39+vgprodbca+#39+
             '    and id_rango = (select max(id_rango) from cr_prodbca_roe where cve_producto_bca = '+#39+vgprodbca+#39+')'+
             '    and min_plazo = (select max(min_plazo) from cr_prodbca_roe where cve_producto_bca = '+#39+vgprodbca+#39+')';
   VLSalida := RunSQL(vlsql,objeto.Apli.DataBaseName,objeto.Apli.SessionName,False);
   ActualizaElimina := VLSalida;
end;

procedure TWCrctroeob.edPlazoMaxExit(Sender: TObject);
begin
if edPlazoMax.Text <> '' then
  begin
    if vgprimerreg then
    begin
      if edPlazoMax.Text = '0' then
      begin
      Showmessage('ATENCIÓN: ¡ El Plazo Máximo debe ser mayor a Cero ! ');
      edPlazoMax.Text := '';
      edPlazoMax.SetFocus;
      end
      else if edPlazoMax.Text >= '99999' then
      begin
      Showmessage('ATENCIÓN: ¡ El Plazo Máximo debe ser menor a 99999 ! ');
      edPlazoMax.Text := '';
      edPlazoMax.SetFocus;
      end;
    end
    else
    begin
      if StrToInt(edPlazoMax.text) <= StrToInt(vgminplazo) then
      begin
      Showmessage('ATENCIÓN: El Plazo Máximo debe ser mayor a '+vgminplazo);
      edPlazoMax.SetFocus;
      end
      else if edPlazoMax.Text >= '99999' then
      begin
      Showmessage('ATENCIÓN: ¡ El Plazo Máximo debe ser menor a 99999 ! ');
      edPlazoMax.Text := '';
      edPlazoMax.SetFocus;
      end
      else
      vgsalidaplazo := True;
    end;
    vgplazomax := edPlazoMax.Text;
  end;
end;

procedure TWCrctroeob.edImpMaxExit(Sender: TObject);
begin
if edImpMax.Text <> '' then
  begin
   if vgprimerreg then
   begin
      if strToInt(edImpMax.Text) = 0 then
      begin
      Showmessage('ATENCIÓN: ¡ El Monto Máximo debe ser mayor a Cero ! ');
      edImpMax.Text := '';
      edImpMax.SetFocus;
      end
      else if edImpMax.Text >= '99999999999999' then
      begin
      Showmessage('ATENCIÓN: ¡ El Monto Máximo debe ser menor a 99,999,999,999,999.00 ! ');
      edImpMax.Text := '';
      edImpMax.SetFocus;
      end;
   end
   else
     begin
     if StrToInt(edImpMax.text) < strToInt(vgminmonto) then
       begin
       Showmessage('ATENCIÓN: El Monto Máximo debe ser mayor a '+vgminmonto);
       edImpMax.SetFocus;
      end
      else if edImpMax.Text >= '99999999999999' then
      begin
      Showmessage('ATENCIÓN: ¡ El Monto Máximo debe ser menor a 99,999,999,999,999.00 ! ');
      edImpMax.Text := '';
      edImpMax.SetFocus;
      end
      else
      vgsalidamonto := True;
    end;
      vgmontomax := edImpMax.Text;
  end;
end;


end.
