// Sistema         : Clase de ROEFND
// Fecha de Inicio : 11/06/2012
// Función forma   : Clase de ROEFND
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Juan Francisco Ortega Flores
// Comentarios     :
Unit IntCrroepneg;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
IntParamCre, Grids, InterEdit, IntGenCre;

const
   CO_COL_CVEPRD = 0;
   CO_COL_CVELIN = CO_COL_CVEPRD + 1;
   CO_COL_DESC   = CO_COL_CVELIN + 1;
   CO_COL_ROMIN  = CO_COL_DESC + 1;

Type
 TCrroepneg= class; 

  TWCrroepneg=Class(TForm)
    InterForma1             : TInterForma;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbDUsuario: TLabel;
    lbDEmpresa: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    strgrdDatos: TStringGrid;
    btACTUALIZA: TBitBtn;
    Shape4: TShape;
    Label3: TLabel;
    Shape2: TShape;
    Label5: TLabel;
    Shape1: TShape;
    Label1: TLabel;
    Shape3: TShape;
    Label4: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lbCVE_GRUPO_ECO: TLabel;
    edCveProd: TInterEdit;
    Label6: TLabel;
    edCveLineaNeg: TInterEdit;
    Label7: TLabel;
    Label2: TLabel;
    edDescripcion: TInterEdit;
    edRoeMin: TInterEdit;
    procedure ConfGrid( SGrid : TStringGrid );    
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure strgrdDatosMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btACTUALIZAClick(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1AntesModificar(Sender: TObject;
      var Realizado: Boolean);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    procedure strgrdDatosDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    private 
    { Private declarations }
    procedure MuestraDatos;     
    public 
    { Public declarations } 
    Objeto : TCrroepneg;
end; 
 TCrroepneg= class(TInterFrame) 
      private 
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        cve_lin2      : String;
        CVE_PRODUCTO  : TInterCampo;
        CVE_LINEA_NEG : TInterCampo;
        DESCRIPCION   : TInterCampo;
        ROE_MINIMA    : TInterCampo;
        ParamCre      : TParamCre;
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

implementation
//Uses
//IntCrroelneg
//;

{$R *.DFM}


constructor TCrroepneg.Create( AOwner : TComponent ); 
begin Inherited; 
      {CAMPO1 :=CreaCampo('CAMPO1',ftString,tsNinguno,tsNinguno,False);
                CAMPO1.Caption:='Campo1';
                CAMPO1.Parametro:='CAMPO1';}
      CVE_PRODUCTO :=CreaCampo('CVE_PRODUCTO',ftString,tsNinguno,tsNinguno,True);
                CVE_PRODUCTO.Caption := 'Clave Producto';
      CVE_LINEA_NEG := CreaCampo('CVE_LINEA_NEGOCIO',ftString,tsNinguno,tsNinguno,True);
                CVE_LINEA_NEG.Caption := 'Clave Linea Neg';
      DESCRIPCION :=CreaCampo('DESC_PRODUCTO_NEGOCIO',ftString,tsNinguno,tsNinguno,True);
                DESCRIPCION.Caption := 'Descripción Prod';
      ROE_MINIMA := CreaCampo('ROE_MINIMA',ftInteger,tsNinguno,tsNinguno,True);
                ROE_MINIMA.Caption := 'Roe Mínima';


      FKeyFields.Add('CVE_LINEA_NEGOCIO');
      TableName := 'PRODUCTO_NEGOCIO';
      UseQuery := True;
      HelpFile := 'IntCrroepneg.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrroepneg.Destroy;
begin inherited;
end;


function TCrroepneg.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrroepneg;
begin
   W:=TWCrroepneg.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo;
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowBtnBuscar := False;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrroepneg.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrroefo.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TCrroepneg.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA Crroepneg********************)
(*                                                                                *)
(*  FORMA DE Crroepneg                                                            *)
(*                                                                                *)
(***********************************************FORMA Crroepneg********************)

procedure TWCrroepneg.FormShow(Sender: TObject);
begin
     lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
     lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
//     lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

     Objeto.CVE_LINEA_NEG.AsString := Objeto.cve_lin2;
     objeto.CVE_PRODUCTO.Control := edCveProd;
     objeto.CVE_LINEA_NEG.Control := edCveLineaNeg;
     objeto.DESCRIPCION.Control := edDescripcion;
     objeto.ROE_MINIMA.Control := edRoeMin;

     MuestraDatos;
end;

procedure TWCrroepneg.FormDestroy(Sender: TObject);
begin
     objeto.CVE_PRODUCTO.Control := NIL;
     objeto.CVE_LINEA_NEG.Control := NIL;
     objeto.DESCRIPCION.Control := NIL;
     objeto.ROE_MINIMA.Control := NIL;
   //Objeto
end;

procedure TWCrroepneg.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrroepneg.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
   edCveProd.SetFocus;
   if objeto.cve_lin2 <> '' then
   begin
   edCveLineaNeg.Text := Objeto.cve_lin2;
   edCveLineaNeg.Enabled := False;
   end;

end;

procedure TWCrroepneg.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrroepneg.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCrroepneg.MuestraDatos;
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

        if objeto.cve_lin2 <> '' then begin
        vlsql :=  'SELECT CVE_PRODUCTO, CVE_LINEA_NEGOCIO, DESC_PRODUCTO_NEGOCIO, ROE_MINIMA FROM PRODUCTO_NEGOCIO WHERE CVE_LINEA_NEGOCIO = '''+Objeto.cve_lin2+''' ORDER BY 1';
        end
        else begin
        vlsql :=  'SELECT CVE_PRODUCTO, CVE_LINEA_NEGOCIO, DESC_PRODUCTO_NEGOCIO, ROE_MINIMA FROM PRODUCTO_NEGOCIO ORDER BY 1';
        end;

  Query1 := GetSQLQuery(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );

      if Query1 = nil then
         begin
         ShowMessage('  ¡ No se encontraron Registros !');
         end
      else
      begin
   fila := 2;
   try
    while not Query1.EOF do
      begin
         try
          with strgrdDatos do  begin
           Cells[CO_COL_CVEPRD, nRow] := Query1.FieldByName('CVE_PRODUCTO').AsString;
           Cells[CO_COL_CVELIN, nRow]  := Query1.FieldByName('CVE_LINEA_NEGOCIO').AsString;
           Cells[CO_COL_DESC, nRow] := Query1.FieldByName('DESC_PRODUCTO_NEGOCIO').AsString;
           Cells[CO_COL_ROMIN, nRow]  := Query1.FieldByName('ROE_MINIMA').AsString;
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

procedure TWCrroepneg.ConfGrid(SGrid: TStringGrid);
begin
 With SGrid Do
   Begin
      ColCount := 4;
      RowHeights[0] := DefaultRowHeight;
      RowCount := 1;
      ColWidths[CO_COL_CVEPRD] := 68;
      ColWidths[CO_COL_CVELIN]  := 68;
      ColWidths[CO_COL_DESC] := 166;
      ColWidths[CO_COL_ROMIN]  := 73;
    End;
end;

procedure TWCrroepneg.strgrdDatosMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
 var
  nCol, nRow : Integer;
  cve_prod, cve_lin, desc, roe_mini : String;
begin
   strgrdDatos.MouseToCell(X, Y, nCol, nRow);
   if trim(strgrdDatos.Cells[CO_COL_CVEPRD, nRow]) <> '' then
      begin
      cve_prod := strgrdDatos.Cells[CO_COL_CVEPRD, nRow];
      cve_lin := strgrdDatos.Cells[CO_COL_CVELIN, nRow];
      desc := strgrdDatos.Cells[CO_COL_DESC, nRow];
      roe_mini := strgrdDatos.Cells[CO_COL_ROMIN, nRow];
      Objeto.FindKey([cve_lin]);

      edCveProd.Text := cve_prod;
      edCveLineaNeg.Text := cve_lin;
      edDescripcion.Text := desc;
      edRoeMin.Text := roe_mini;
      end;
end;

procedure TWCrroepneg.btACTUALIZAClick(Sender: TObject);
begin
Muestradatos;
end;

procedure TWCrroepneg.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
   //nuevo
   if IsNewData then
   Begin
      if MessageDlg('¿Desea almacenar los datos capturados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
           Realizado := True
      else Realizado := False;
   end
   else
   Begin
      if MessageDlg('¿Desea guardar los datos modificados?',
           mtConfirmation,[mbYes, mbNo], 0) = mrYes then
           Realizado := True
      else Realizado := False;
   end
end;

procedure TWCrroepneg.InterForma1AntesModificar(Sender: TObject;
  var Realizado: Boolean);
begin
   edCveProd.SetFocus;
end;

procedure TWCrroepneg.InterForma1DespuesAceptar(Sender: TObject);
begin
MuestraDatos;
end;

procedure TWCrroepneg.InterForma1DespuesEliminar(Sender: TObject);
begin
MuestraDatos;
end;

procedure TWCrroepneg.strgrdDatosDrawCell(Sender: TObject; ACol,
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
      if (ACol = CO_COL_CVEPRD) or(ACol = CO_COL_CVELIN) or (ACol = CO_COL_DESC) then
         Alineacion := taLeftJustify;

      if (ACol = CO_COL_ROMIN) then
         Alineacion := taRightJustify;

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

end.
