// Sistema         : Clase de CrRelProd
// Fecha de Inicio : 08/07/2013
// Función forma   : Clase de CrRelProd
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Qfzmuizmxrhxlligvtzuolivh
// Comentarios     :
Unit IntCrrelprod;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
IntParamCre, CheckLst, InterEdit, Grids, IntLinkit,IntGencre,
IntCrProduct, ImgList
;

const
   CO_COL_CVEPRCR  = 0;
   CO_COL_DESCPRD  = CO_COL_CVEPRCR + 1;
   CO_COL_SIT      = CO_COL_DESCPRD + 1;
   CO_COL_CVEPRB   = CO_COL_SIT + 1;
   CO_COL_ROEOB    = CO_COL_CVEPRB + 1;
   CO_COL_USUALTA  = CO_COL_ROEOB + 1;
   CO_COL_FALTA    = CO_COL_USUALTA + 1;
   CO_COL_USUMODIF = CO_COL_FALTA + 1;
   CO_COL_FMODIF   = CO_COL_USUMODIF + 1;
   CO_COL_USUBAJA  = CO_COL_FMODIF + 1;
   CO_COL_FBAJA    = CO_COL_USUBAJA + 1;

   //grid 2
   CO_COL_CHECK    = 0;
   CO_COL_CVEPROD = CO_COL_CHECK + 1;
   CO_COL_DESCPROD = CO_COL_CVEPROD + 1;

   CO_CHECKED   = 'V';
   CO_UNCHECKED = 'F';
   CO_NOTCHECK  = '-';

Type
 TCrrelprod= class; 

  TWCrrelprod=Class(TForm)
    InterForma1             : TInterForma;
    ilPRODUCTO: TInterLinkit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox4: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    edF_Alta: TInterEdit;
    edUsu_Modifica: TInterEdit;
    edUsuAlta: TInterEdit;
    edF_Modifica: TInterEdit;
    edF_Baja: TInterEdit;
    edUsu_Baja: TInterEdit;
    GroupBox1: TGroupBox;
    Shape4: TShape;
    Label3: TLabel;
    Shape2: TShape;
    Shape1: TShape;
    Label1: TLabel;
    Label2: TLabel;
    strgrdDatos: TStringGrid;
    rgSITUACION: TRadioGroup;
    GroupBox2: TGroupBox;
    Label22: TLabel;
    Label4: TLabel;
    edDescCorta2: TInterEdit;
    edProdiCRE: TInterEdit;
    btPRODUCTO: TBitBtn;
    edDESC_PRODUCTO1: TEdit;
    edCveProd: TEdit;
    TabSheet2: TTabSheet;
    strgrdDatos2: TStringGrid;
    Shape3: TShape;
    Label7: TLabel;
    Label8: TLabel;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    edCvePrBca: TEdit;
    edDescCveBca: TInterEdit;
    Shape5: TShape;
    btCarga: TBitBtn;
    ImageList: TImageList;
    CBtodos: TCheckBox;
    pbRegistros: TProgressBar;
    Label5: TLabel;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure strgrdDatosDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure strgrdDatosMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ConfGrid( SGrid : TStringGrid );
    procedure ConfGrid2( SGrid : TStringGrid );
    procedure btPRODUCTOClick(Sender: TObject);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1AntesNuevo(Sender: TObject;
      var Realizado: Boolean);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    procedure InterForma1AntesEliminar(Sender: TObject;
      var Realizado: Boolean);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1AntesModificar(Sender: TObject;
      var Realizado: Boolean);
    procedure TabSheet2Show(Sender: TObject);
    procedure strgrdDatos2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure InvertCheck(StrinGrid : TStringGrid; nCol, nRow : Integer);      
    procedure CBtodosClick(Sender: TObject);
    procedure strgrdDatos2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure btCargaClick(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    private
    { Private declarations }
    procedure MuestraDatos;
    procedure MuestraDatos2;

    public
    { Public declarations }
    Objeto : TCrrelprod;
    Function  CargaDatos(var pPrdIcre,PPrdBca:string):boolean;
end; 
 TCrrelprod= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 
        ParamCre           : TParamCre;
        Producto           : TCrProduct;

        CVE_PRODUCTO_CRE   : TInterCampo;
        CVE_PRODUCTO_BCA   : TInterCampo;
        DESC_PROD_BCA      : TInterCampo;
        SIT_REL_PRODUCTO   : TInterCampo;
        ROE_OBJETIVO       : TInterCampo;
        CVE_USU_ALTA       : TInterCampo;
        F_ALTA             : TInterCampo;
        CVE_USU_MODIFICA   : TInterCampo;
        F_MODIFICA         : TInterCampo;
        CVE_USU_BAJA       : TInterCampo;
        F_BAJA             : TInterCampo;

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
     nRow2   : word;
     vlsql2  : String;
     Query2  : TQuery;
     vgprodbca : String;
     vgdescprod : String;
     vlroeobj : Integer;


implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrrelprod.Create( AOwner : TComponent ); 
begin Inherited;

      Producto :=  TCrProduct.Create(Self);
      Producto.MasterSource:=Self;
      Producto.FieldByName('CVE_PRODUCTO_CRE').MasterField      :='CVE_PRODUCTO_CRE';

      CVE_PRODUCTO_CRE := CreaCampo('CVE_PRODUCTO_CRE',ftString,tsNinguno,tsNinguno,True);
                          CVE_PRODUCTO_CRE.Caption := 'Clave Área Negocio';

      CVE_PRODUCTO_BCA := CreaCampo('CVE_PRODUCTO_BCA',ftString,tsNinguno,tsNinguno,True);
                          CVE_PRODUCTO_BCA.Caption := 'Clave Área Negocio';

      DESC_PROD_BCA := CreaCampo('DESC_PROD_BCA',ftString,tsNinguno,tsNinguno,False);
                          DESC_PROD_BCA.Caption := 'Desc. Prod Banca';

      SIT_REL_PRODUCTO := CreaCampo('SIT_REL_PRODUCTO',ftString,tsNinguno,tsNinguno,True);
                          SIT_REL_PRODUCTO.Caption := 'Clave Área Negocio';

            With SIT_REL_PRODUCTO do
            begin Size:=2;
                  UseCombo:=True;
                  ComboLista.Add('0'); ComboDatos.Add('AC');
                  ComboLista.Add('1'); ComboDatos.Add('IN');
            end;


      CVE_USU_ALTA := CreaCampo('CVE_USU_ALTA',ftString,tsNinguno,tsNinguno,True);
                          CVE_USU_ALTA.Caption := 'Clave Área Negocio';

      F_ALTA := CreaCampo('F_ALTA',ftDateTime,tsNinguno,tsNinguno,True);
                          F_ALTA.Caption := 'Clave Área Negocio';

      CVE_USU_MODIFICA := CreaCampo('CVE_USU_MODIFICA',ftString,tsNinguno,tsNinguno,True);
                          CVE_USU_MODIFICA.Caption := 'Clave Área Negocio';

      F_MODIFICA := CreaCampo('F_MODIFICA',ftDateTime,tsNinguno,tsNinguno,True);
                          F_MODIFICA.Caption := 'Clave Área Negocio';

      CVE_USU_BAJA := CreaCampo('CVE_USU_BAJA',ftString,tsNinguno,tsNinguno,True);
                          CVE_USU_BAJA.Caption := 'Clave Área Negocio';

      F_BAJA := CreaCampo('F_BAJA',ftDateTime,tsNinguno,tsNinguno,True);
                          F_BAJA.Caption := 'Clave Área Negocio';

      vlroeobj := 1;

      FKeyFields.Add('CVE_PRODUCTO_CRE');
      FKeyFields.Add('CVE_PRODUCTO_BCA');
      TableName := 'CR_REL_PROD_BCA';
//      StpName  := ' ';
      UseQuery := True;
      HelpFile := 'IntCrrelprod.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrrelprod.Destroy;
begin
   if Producto <> nil then
      Producto.Free;
inherited;
end;


function TCrrelprod.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrrelprod;
begin
   W:=TWCrrelprod.Create(Self);
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


Function TCrrelprod.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrrelpr.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TCrrelprod.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CrRelProd********************)
(*                                                                              *)
(*  FORMA DE CrRelProd                                                            *)
(*                                                                              *)
(***********************************************FORMA CrRelProd********************)

procedure TWCrrelprod.FormShow(Sender: TObject);
begin
      Objeto.CVE_PRODUCTO_CRE.Control := edProdiCRE;
      Objeto.CVE_PRODUCTO_BCA.Control := edCveProd;
      Objeto.DESC_PROD_BCA.Control := edDescCorta2;
      Objeto.SIT_REL_PRODUCTO.Control := rgSITUACION;
      Objeto.CVE_USU_ALTA.Control :=  edUsuAlta;
      Objeto.F_ALTA.Control := edF_Alta;
      Objeto.CVE_USU_MODIFICA.Control := edUsu_Modifica;
      Objeto.F_MODIFICA.Control := edF_Modifica;
      Objeto.CVE_USU_BAJA.Control := edUsu_Baja;
      Objeto.F_BAJA.Control := edF_Baja;

      Objeto.Producto.DESC_C_PRODUCTO.Control := edDESC_PRODUCTO1;
      MuestraDatos;

end;

procedure TWCrrelprod.FormDestroy(Sender: TObject);
begin
      Objeto.CVE_PRODUCTO_CRE.Control := nil;
      Objeto.CVE_PRODUCTO_BCA.Control := nil;
      Objeto.DESC_PROD_BCA.Control := nil;
      Objeto.SIT_REL_PRODUCTO.Control := nil;
      Objeto.CVE_USU_ALTA.Control :=  nil;
      Objeto.F_ALTA.Control := nil;
      Objeto.CVE_USU_MODIFICA.Control := nil;
      Objeto.F_MODIFICA.Control := nil;
      Objeto.CVE_USU_BAJA.Control := nil;
      Objeto.F_BAJA.Control := nil;

      Objeto.Producto.DESC_C_PRODUCTO.Control := nil;
end;

procedure TWCrrelprod.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrrelprod.InterForma1DespuesNuevo(Sender: TObject);
var   vlsql  : String;
      Query1 : TQuery;
begin
      vlsql  :=  'select sysdate from dual ';
      Query1 := GetSQLQuery(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
      Objeto.F_ALTA.AsDateTime := Query1.FieldByName('SYSDATE').AsDateTime;
      Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
      edProdiCRE.SetFocus;
      rgSITUACION.ItemIndex := 0;
      edCveProd.Text := vgprodbca;
      edDescCorta2.text := vgdescprod;
end;

procedure TWCrrelprod.InterForma1DespuesModificar(Sender: TObject);
var   vlsql  : String;
      Query1 : TQuery;
begin
      vlsql  :=  'select sysdate from dual ';
      Query1 := GetSQLQuery(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
      Objeto.F_MODIFICA.AsDateTime := Query1.FieldByName('SYSDATE').AsDateTime;
      Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
      edProdiCRE.SetFocus;
      edCveProd.Text := vgprodbca;
      edDescCorta2.Text := vgdescprod;
end;

//procedure TWCrrelprod.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCrrelprod.MuestraDatos;
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

        vlsql :=  '  SELECT  cpb.cve_producto_cre, crp.desc_c_producto, cpb.sit_rel_producto, cpb.cve_producto_bca,'+
                  '          cpb.roe_objetivo, cpb.cve_usu_alta, cpb.f_alta, cpb.cve_usu_modifica,'+
                  '          cpb.f_modifica, cpb.cve_usu_baja, cpb.f_baja'+
                  '     FROM cr_rel_prod_bca cpb, cr_producto crp'+
                  '    WHERE 1 = 1'+
                  '      AND crp.cve_producto_cre = cpb.cve_producto_cre'+
                  '      AND cve_producto_bca = '''+edCveProd.Text+''''+
                  '    ORDER BY cve_producto_cre';

  Query1 := GetSQLQuery(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );

      if Query1 = nil then
         begin
         ShowMessage('  ¡ No se encontraron productos Asociados !');
         end
      else
      begin
   fila := 2;
   try
    while not Query1.EOF do
      begin
         try
          with strgrdDatos do  begin
           Cells[CO_COL_CVEPRCR, nRow] := Query1.FieldByName('CVE_PRODUCTO_CRE').AsString;
           Cells[CO_COL_DESCPRD, nRow]  := Query1.FieldByName('DESC_C_PRODUCTO').AsString;
           Cells[CO_COL_SIT, nRow]  := Query1.FieldByName('SIT_REL_PRODUCTO').AsString;
           Cells[CO_COL_CVEPRB, nRow]  := Query1.FieldByName('CVE_PRODUCTO_BCA').AsString;
           Cells[CO_COL_ROEOB, nRow]  := Query1.FieldByName('ROE_OBJETIVO').AsString;
           Cells[CO_COL_USUALTA, nRow]  := Query1.FieldByName('CVE_USU_ALTA').AsString;
           Cells[CO_COL_FALTA, nRow]  := Query1.FieldByName('F_ALTA').AsString;
           Cells[CO_COL_USUMODIF, nRow]  := Query1.FieldByName('CVE_USU_MODIFICA').AsString;
           Cells[CO_COL_FMODIF, nRow]  := Query1.FieldByName('F_MODIFICA').AsString;
           Cells[CO_COL_USUBAJA, nRow]  := Query1.FieldByName('CVE_USU_BAJA').AsString;
           Cells[CO_COL_FBAJA, nRow]  := Query1.FieldByName('F_BAJA').AsString;
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

procedure TWCrrelprod.strgrdDatosDrawCell(Sender: TObject; ACol,
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
      if (ACol = CO_COL_CVEPRCR) or(ACol = CO_COL_DESCPRD) then
         Alineacion := taLeftJustify;

{      if (ACol = CO_COL_ROEOB)  then
         Alineacion := taRightJustify; }

      if (ACol = CO_COL_SIT) then
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

procedure TWCrrelprod.strgrdDatosMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
 var
  nCol, nRow : Integer;
  cveprodcre, descprod, situa, cveprodbca, roeob, usualta, falta, usumodif, fmodif, usubaja, fbaja : String;
begin
   strgrdDatos.MouseToCell(X, Y, nCol, nRow);
   if trim(strgrdDatos.Cells[CO_COL_CVEPRCR, nRow]) <> '' then
      begin
      cveprodcre := strgrdDatos.Cells[CO_COL_CVEPRCR, nRow];
      descprod := strgrdDatos.Cells[CO_COL_DESCPRD, nRow];
      situa := strgrdDatos.Cells[CO_COL_SIT, nRow];
      cveprodbca := strgrdDatos.Cells[CO_COL_CVEPRB, nRow];
      roeob := strgrdDatos.Cells[CO_COL_ROEOB, nRow];
      usualta := strgrdDatos.Cells[CO_COL_USUALTA, nRow];
      falta := strgrdDatos.Cells[CO_COL_FALTA, nRow];
      usumodif := strgrdDatos.Cells[CO_COL_USUMODIF, nRow];
      fmodif := strgrdDatos.Cells[CO_COL_FMODIF, nRow];
      usubaja := strgrdDatos.Cells[CO_COL_USUBAJA, nRow];
      fbaja := strgrdDatos.Cells[CO_COL_FBAJA, nRow];
      Objeto.FindKey([cveprodcre,cveprodbca]);

      edProdiCRE.Text := cveprodcre;
      edDESC_PRODUCTO1.Text := descprod;

      edDescCorta2.Text :=  vgdescprod;
      edDescCveBca.Text :=  vgdescprod;

      if situa = 'AC' then
      rgSITUACION.ItemIndex := 0
      else
      rgSITUACION.ItemIndex := 1;

      edF_Alta.Text := falta;
      edF_Modifica.Text := fmodif;
      edF_Baja.Text := fbaja;
      edUsuAlta.Text := usualta;
      edUsu_Modifica.Text := usumodif;
      edUsu_Baja.Text := usubaja;
      end;
end;

procedure TWCrrelprod.ConfGrid(SGrid: TStringGrid);
begin
 With SGrid Do
   Begin
      ColCount := 11;
      RowHeights[0] := DefaultRowHeight;
      RowCount := 1;
      ColWidths[CO_COL_CVEPRCR] := 78;
      ColWidths[CO_COL_DESCPRD]  := 247;
      ColWidths[CO_COL_SIT]  := 55;
      ColWidths[CO_COL_CVEPRB]  := 0;
      ColWidths[CO_COL_ROEOB]  := 0;
      ColWidths[CO_COL_USUALTA]  := 0;
      ColWidths[CO_COL_FALTA]  := 0;
      ColWidths[CO_COL_USUMODIF]  := 0;
      ColWidths[CO_COL_FMODIF]  := 0;
      ColWidths[CO_COL_USUBAJA]  := 0;
      ColWidths[CO_COL_FBAJA]  := 0;
    End;
end;

procedure TWCrrelprod.btPRODUCTOClick(Sender: TObject);
begin
       Objeto.Producto.ShowAll := True;
    if Objeto.Producto.Busca Then Begin
       InterForma1.NextTab(edProdiCRE);
    end;
end;

procedure TWCrrelprod.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
var vlsql : String;
    query1 : TQuery;
begin
      vlsql  :=  'select sysdate from dual ';
      Query1 := GetSQLQuery(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
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
           begin
             if rgSITUACION.ItemIndex = 1 then
             begin
             edF_Baja.Text := Query1.FieldByName('SYSDATE').AsString;
             edUsu_Baja.Text := Objeto.Apli.Usuario;
             end;
             Realizado := True;
           end
      else Realizado := False;
   end
end;

procedure TWCrrelprod.InterForma1AntesNuevo(Sender: TObject;
  var Realizado: Boolean);
begin
//    vgprodbca :=  edCveProd.Text;
//    vgdescprod := edDescCorta2.Text;
end;

procedure TWCrrelprod.InterForma1DespuesCancelar(Sender: TObject);
begin
    edCveProd.Text := vgprodbca;
    edCvePrBca.Text := vgprodbca;
    edDescCorta2.Text :=  vgdescprod;
    edDescCveBca.Text :=  vgdescprod;
    MuestraDatos;
end;

procedure TWCrrelprod.InterForma1DespuesEliminar(Sender: TObject);
begin
    edCveProd.Text := vgprodbca;
    edCvePrBca.Text := vgprodbca;
    edDescCorta2.Text :=  vgdescprod;
    edDescCveBca.Text :=  vgdescprod;
    MuestraDatos;
end;

procedure TWCrrelprod.InterForma1AntesEliminar(Sender: TObject;
  var Realizado: Boolean);
begin
//    vgprodbca :=  edCveProd.Text;
//    vgdescprod := edDescCorta2.Text;
end;

procedure TWCrrelprod.InterForma1DespuesAceptar(Sender: TObject);
begin
    edCveProd.Text := vgprodbca;
    edCvePrBca.Text := vgprodbca;
    edDescCorta2.Text :=  vgdescprod;
    edDescCveBca.Text :=  vgdescprod;
    MuestraDatos;
end;

procedure TWCrrelprod.InterForma1AntesModificar(Sender: TObject;
  var Realizado: Boolean);
begin
if edProdiCRE.text = '' then
   Showmessage('¡ Para modificar, debe seleccionar un producto !');
//   vgprodbca :=  edCveProd.Text;
//   vgdescprod := edDescCorta2.Text;
end;

procedure TWCrrelprod.MuestraDatos2;
var
  LCID   : integer;
  fila   : integer;
  valida : String;


  bResult : Boolean;
  vlmesant:string;
begin
    ClearGrid(strgrdDatos2,0);
    ConfGrid2(strgrdDatos2);
    nRow := 0;

        vlsql :=  '  SELECT cve_producto_cre, desc_c_producto' +
                  '    FROM cr_producto' +
                  '   WHERE sit_producto = ''AC''' +
                  '   ORDER BY cve_producto_cre';

  Query1 := GetSQLQuery(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );

      if Query1 = nil then
         begin
         ShowMessage('  ¡ No se encontró Información !');
         end
      else
      begin
   fila := 2;
   try
    while not Query1.EOF do
      begin
         try
          with strgrdDatos2 do  begin
           Cells[CO_COL_CHECK, nRow]  := CO_UNCHECKED;
           Cells[CO_COL_CVEPROD, nRow] := Query1.FieldByName('CVE_PRODUCTO_CRE').AsString;
           Cells[CO_COL_DESCPROD, nRow]  := Query1.FieldByName('DESC_C_PRODUCTO').AsString;
         end;
         finally
         end;
         Query1.Next;
         nRow:=nRow+1;
         inc(fila);
         strgrdDatos2.RowCount   := fila-2;
      end;
      Query1.Close;
     finally
       if Query1 <> nil then
          Query1.free;
     end;
   end;
End;

procedure TWCrrelprod.ConfGrid2(SGrid: TStringGrid);
begin
 With SGrid Do
   Begin
      ColCount := 3;
      RowHeights[0] := DefaultRowHeight;
      RowCount := 1;
      ColWidths[CO_COL_CHECK] := 27;
      ColWidths[CO_COL_CVEPROD] := 79;
      ColWidths[CO_COL_DESCPROD]  := 328;
    End;
end;


procedure TWCrrelprod.TabSheet2Show(Sender: TObject);
begin
  edCvePrBca.Text := vgprodbca;//objeto.CVE_PRODUCTO_BCA.AsString;
  edDescCveBca.Text := vgdescprod;//Objeto.DESC_PROD_BCA.AsString;
  MuestraDatos2;
end;

procedure TWCrrelprod.strgrdDatos2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var nCol, nRow : Integer;
begin
   strgrdDatos2.MouseToCell(X, Y, nCol, nRow);
   if nCol = CO_COL_CHECK then
   begin
    InvertCheck(strgrdDatos2, CO_COL_CHECK, nRow);
   end;
end;


procedure TWCrrelprod.CBtodosClick(Sender: TObject);
var vlRow  : Integer;
begin
   for vlRow := 0 to (strgrdDatos2.RowCount-1) do
   begin
      if (CBtodos.Checked = true) then // Marcar todos
      begin
         if strgrdDatos2.Cells[CO_COL_CHECK, vlRow]  = CO_UNCHECKED  then
            strgrdDatos2.Cells[CO_COL_CHECK, vlRow] := CO_CHECKED;
      end;

      if CBtodos.Checked = false then // Desmarcar todos
      begin
         if strgrdDatos2.Cells[CO_COL_CHECK, vlRow]  = CO_CHECKED  then
            strgrdDatos2.Cells[CO_COL_CHECK, vlRow] := CO_UNCHECKED;
      end;

   end;
end;

procedure TWCrrelprod.strgrdDatos2DrawCell(Sender: TObject; ACol,
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
      if (ACol = CO_COL_CVEPROD) or(ACol = CO_COL_DESCPROD) then
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

procedure TWCrrelprod.InvertCheck(StrinGrid: TStringGrid; nCol,
  nRow: Integer);
begin
 With (StrinGrid) Do
  If (Cells[nCol, nRow] <>  CO_NOTCHECK) Then
   Begin
     If (Cells[nCol, nRow]  = CO_CHECKED) Then
         Cells[nCol, nRow] := CO_UNCHECKED
     Else
         Cells[nCol, nRow] := CO_CHECKED;
   End;
end;

function TWCrrelprod.CargaDatos(var pPrdIcre,PPrdBca:string): boolean;
var VLSalida: Boolean;
    vlsql   : String;
    vlsitua : String;
Begin
   vlsitua := 'AC';
   vlsql := ' INSERT INTO CR_REL_PROD_BCA (CVE_PRODUCTO_CRE, CVE_PRODUCTO_BCA, SIT_REL_PRODUCTO, ROE_OBJETIVO, CVE_USU_ALTA, F_ALTA)'+
            ' VALUES ('+#39+pPrdIcre+ #39 +','+#39+PPrdBca+#39+','+#39+vlsitua+#39+', 1, '+#39+Objeto.Apli.Usuario+#39+','+SQLFecha(Objeto.Apli.DameFechaEmpresa)+')';

   VLSalida := RunSQL(vlsql,objeto.Apli.DataBaseName,objeto.Apli.SessionName,False);
   CargaDatos := VLSalida;
end;

procedure TWCrrelprod.btCargaClick(Sender: TObject);
var VLCtdorLine : Integer;
    VLpordicre, VLpordbca  : String;
    vlTermina         : Boolean;
begin
  if MessageDlg('¿Desea relacionar los productos señalados?',
     mtConfirmation,[mbYes, mbNo], 0) = mrYes then
     begin
        For VLCtdorLine := 0 to (strgrdDatos2.RowCount-1) do //INICIALIZA INDICADOR DE PROGRESO
       begin
       if strgrdDatos2.Cells[CO_COL_CHECK, VLCtdorLine] = CO_CHECKED  then
         begin
          VLpordicre := UpperCase(strgrdDatos2.Cells[1,VLCtdorLine]);
          VLpordbca := vgprodbca;//Objeto.CVE_PRODUCTO_BCA.AsString;

          If not(CargaDatos(VLpordicre, VLpordbca)) then //Carga los datos del grid a la tabla
          Showmessage('Error al Cargar el Producto: '+ VLpordicre);
         end;
          pbRegistros.Position :=VLCtdorLine;
          vlTermina := True;
       end;
      if vlTermina then
      ShowMessage('   ¡ Proceso Concluido !');
      pbRegistros.Position := 0;
      MuestraDatos;
     end;
end;

procedure TWCrrelprod.InterForma1DespuesShow(Sender: TObject);
begin
      vgprodbca :=  edCveProd.Text;
      vgdescprod := edDescCorta2.Text;
end;

end.
