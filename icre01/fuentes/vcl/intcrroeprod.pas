// Sistema         : Clase de CrRoeProd
// Fecha de Inicio : 06/06/2012
// Función forma   : Clase de CrRoeProd
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Juan Francisco Ortega Flores
// Comentarios     :
Unit IntCrroeprod;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
InterEdit,
Grids,
IntGenCre,
IntParamCre,
IntCrProduct, //Producto
IntLinkit
;

Const
   coCRLF    = #13#10;
   CO_COL_CVEPROD = 0;
   CO_COL_DESCPRD = CO_COL_CVEPROD + 1;
   CO_COL_ROEMIN  = CO_COL_DESCPRD + 1;
   

   Type
 TCrroeprod= class; 

  TWCrroeprod=Class(TForm)
    InterForma1             : TInterForma;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDEmpresa: TLabel;
    edCVE_PRODUCTO_CRE: TEdit;
    btPRODUCTO: TBitBtn;
    edDESC_PRODUCTO1: TEdit;
    chbxProducto: TCheckBox;
    ilPRODUCTO: TInterLinkit;
    GroupBox1: TGroupBox;
    lbCVE_PRODUCTO_CRE: TLabel;
    GroupBox2: TGroupBox;
    lbCVE_GRUPO_ECO: TLabel;
    edCveProd: TInterEdit;
    Label2: TLabel;
    edRoeMin: TInterEdit;
    Shape4: TShape;
    Label3: TLabel;
    Shape1: TShape;
    Label1: TLabel;
    Shape2: TShape;
    Label4: TLabel;
    strgrdDatos: TStringGrid;
    btACTUALIZA: TBitBtn;
    Bbusqueda: TBitBtn;
    procedure ConfGrid( SGrid : TStringGrid );    
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btACTUALIZAClick(Sender: TObject);
    procedure ilPRODUCTOCapture(Sender: TObject; var Show: Boolean);
    procedure ilPRODUCTOEjecuta(Sender: TObject);
    procedure btPRODUCTOClick(Sender: TObject);
    procedure chbxProductoClick(Sender: TObject);
    procedure BbusquedaClick(Sender: TObject);
    procedure strgrdDatosMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure strgrdDatosDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    private 
    { Private declarations }
    procedure MuestraDatos;
    public 
    { Public declarations } 
    Objeto : TCrroeprod;
end; 
 TCrroeprod= class(TInterFrame)
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }

        CVE_PRODUCTO_CRE : TInterCampo;
        ROE_MINIMA       : TInterCampo;

        Producto      : TCrProduct;
//        Empresa       : TEmpresa;   // Empresa
//        UnidadNegocio : TUnNegocio; //Sucursal

        ParamCre    : TParamCre;
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
//Uses RepMon;

{$R *.DFM}


constructor TCrroeprod.Create( AOwner : TComponent ); 
begin Inherited;

      CVE_PRODUCTO_CRE :=CreaCampo('CVE_PRODUCTO_CRE',ftString,tsNinguno,tsNinguno,True);
                CVE_PRODUCTO_CRE.Caption:='Clave de Producto';
      ROE_MINIMA := CreaCampo('ROE_MINIMA',ftInteger,tsNinguno,tsNinguno,True);
                ROE_MINIMA.Caption:='Roe Mínima';

      Producto :=  TCrProduct.Create(Self);
      Producto.MasterSource:=Self;

      FKeyFields.Add('CVE_PRODUCTO_CRE');
      TableName := 'CR_ROE_PRODUCTO';
      UseQuery := True;
      HelpFile := 'IntCrroefond.Hlp';
      ShowMenuReporte:=True;      
end;

Destructor TCrroeprod.Destroy;
begin


inherited;
end;


function TCrroeprod.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrroeprod;
begin
   W:=TWCrroeprod.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := FormaTipo; //FIJA EL TIPO DE FORMA
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


Function TCrroeprod.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrroepr.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TCrroeprod.Reporte:Boolean; 
begin //Execute_Reporte();
end;


(***********************************************FORMA CrRoeProd********************)
(*                                                                              *)
(*  FORMA DE CrRoeProd                                                            *)
(*                                                                              *)
(***********************************************FORMA CrRoeProd********************)
procedure TWCrroeprod.FormShow(Sender: TObject);
begin
     lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
     lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
     lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

     objeto.CVE_PRODUCTO_CRE.Control := edCveProd;
     objeto.ROE_MINIMA.Control := edRoeMin;

     Objeto.Producto.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO_CRE;
     Objeto.Producto.DESC_C_PRODUCTO.Control := edDESC_PRODUCTO1;

     Objeto.Producto.GetParams(Objeto);

     MuestraDatos;

end;


procedure TWCrroeprod.FormDestroy(Sender: TObject);
begin

     Objeto.Producto.CVE_PRODUCTO_CRE.Control := nil;
     Objeto.Producto.DESC_C_PRODUCTO.Control := nil;
     objeto.CVE_PRODUCTO_CRE.Control := nil;
     objeto.ROE_MINIMA.Control := nil;
end;

procedure TWCrroeprod.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrroeprod.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
   edCveProd.SetFocus;
end;

procedure TWCrroeprod.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrroeprod.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;

procedure TWCrroeprod.MuestraDatos;
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

 vlsql :=  'SELECT crp.cve_producto_cre, pr.desc_c_producto, crp.roe_minima' + coCRLF +
           '  FROM cr_roe_producto crp, cr_producto pr' + coCRLF +
           '  WHERE pr.cve_producto_cre = crp.cve_producto_cre'+ coCRLF;

       If (edCVE_PRODUCTO_CRE.Text <>'') Then
      vlsql := vlsql + ' AND crp.cve_producto_cre (+) = '''+ edCVE_PRODUCTO_CRE.Text+''''+  coCRLF;

      vlsql := vlsql+ ' ORDER BY 1';

        Query1 := GetSQLQuery(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );

      if Query1 = nil then
         begin
         ShowMessage('  ¡ No se encontró Información!');
         end
      else
      begin
   fila := 2;
   try
    while not Query1.EOF do
      begin
         try
          with strgrdDatos do  begin
           Cells[CO_COL_CVEPROD, nRow] := Query1.FieldByName('CVE_PRODUCTO_CRE').AsString;
           Cells[CO_COL_DESCPRD, nRow]  := Query1.FieldByName('DESC_C_PRODUCTO').AsString;
           Cells[CO_COL_ROEMIN, nRow]  := Query1.FieldByName('ROE_MINIMA').AsString;
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


procedure TWCrroeprod.btACTUALIZAClick(Sender: TObject);
begin
chbxProducto.Checked := False;
MuestraDatos;
end;

procedure TWCrroeprod.ConfGrid(SGrid: TStringGrid);
begin
 With SGrid Do
   Begin
      ColCount := 3;
      RowHeights[0] := DefaultRowHeight;
      RowCount := 1;
      ColWidths[CO_COL_CVEPROD] := 65;
      ColWidths[CO_COL_DESCPRD]  := 228;
      ColWidths[CO_COL_ROEMIN]  := 76;
    End;
end;

procedure TWCrroeprod.ilPRODUCTOCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TWCrroeprod.ilPRODUCTOEjecuta(Sender: TObject);
begin
    If Objeto.Producto.FindKey([ilPRODUCTO.Buffer])Then Begin
        chbxProducto.Checked:=True;
        chbxProducto.Enabled:=True;
        InterForma1.NextTab(edCVE_PRODUCTO_CRE);
    End;
end;

procedure TWCrroeprod.btPRODUCTOClick(Sender: TObject);
begin
       Objeto.Producto.ShowAll := True;
    if Objeto.Producto.Busca Then Begin
        chbxProducto.Checked:= True;
        chbxProducto.Enabled:= True;
        InterForma1.NextTab(edCVE_PRODUCTO_CRE);
    end;
end;

procedure TWCrroeprod.chbxProductoClick(Sender: TObject);
begin
    If not chbxProducto.Checked Then Begin
        Objeto.Producto.Active:=False;
        chbxProducto.Checked:=False;
        chbxProducto.Enabled:=False;
    End Else Begin
        chbxProducto.Checked:=True;
        chbxProducto.Enabled:=True;
    End;
end;

procedure TWCrroeprod.BbusquedaClick(Sender: TObject);
begin
Muestradatos;
end;

procedure TWCrroeprod.strgrdDatosMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
 var
  nCol, nRow : Integer;
  cveprod, roemin : String;
 begin
   strgrdDatos.MouseToCell(X, Y, nCol, nRow);
   if trim(strgrdDatos.Cells[CO_COL_CVEPROD, nRow]) <> '' then
      begin
      cveprod := strgrdDatos.Cells[CO_COL_CVEPROD, nRow];
      roemin := strgrdDatos.Cells[CO_COL_ROEMIN, nRow];
      Objeto.FindKey([cveprod]);

      edCveProd.Text := cveprod;
      edRoeMin.Text := roemin;
      end;
 end;

procedure TWCrroeprod.InterForma1AntesAceptar(Sender: TObject;
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
   // end if
end;

procedure TWCrroeprod.InterForma1DespuesAceptar(Sender: TObject);
begin
MuestraDatos;
end;

procedure TWCrroeprod.strgrdDatosDrawCell(Sender: TObject; ACol,
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
      if (ACol = CO_COL_CVEPROD) or(ACol = CO_COL_DESCPRD) then
         Alineacion := taLeftJustify;

      if (ACol = CO_COL_ROEMIN) THEN
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
