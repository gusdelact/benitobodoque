// Sistema         : Clase de CrBcaTipC
// Fecha de Inicio : 15/07/2013
// Función forma   : Clase de CrBcaTipC
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Qfzmuizmxrhxlligvtzuolivh
// Comentarios     :
Unit IntCrbcatipc;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Grids, InterEdit,
IntParamCre, IntGencre, IntLinkit,
IntCrreltcre, ImgList   //tipos de Crédito
;

const
    CO_COL_CVETIPCR  = 0;
    CO_COL_DESCPROD  = CO_COL_CVETIPCR + 1;
    CO_COL_SITUA     = CO_COL_DESCPROD + 1;
    CO_COL_PRODBCA   =  CO_COL_SITUA + 1;
    CO_COL_USUALTA   = CO_COL_PRODBCA + 1;
    CO_COL_FALTA     = CO_COL_USUALTA + 1;
    CO_COL_USUMODIF  = CO_COL_FALTA + 1;
    CO_COL_FMODIF    = CO_COL_USUMODIF + 1;
    CO_COL_USUBAJA   = CO_COL_FMODIF + 1;
    CO_COL_FBAJA     = CO_COL_USUBAJA + 1;

      //grid 2
    CO_COL_CHECK    = 0;
    CO_COL_TIPOPROD = CO_COL_CHECK + 1;
    CO_COL_DESPRODD = CO_COL_TIPOPROD + 1;

    CO_CHECKED   = 'V';
    CO_UNCHECKED = 'F';
    CO_NOTCHECK  = '-';

Type
 TCrbcatipc= class; 

  TWCrbcatipc=Class(TForm)
    InterForma1             : TInterForma;
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
    GroupBox2: TGroupBox;
    Label22: TLabel;
    Label4: TLabel;
    edDescCorta2: TInterEdit;
    edTipoCred: TInterEdit;
    btPRODUCTO: TBitBtn;
    edDESC_tipocred: TEdit;
    edCveProd: TEdit;
    TabSheet2: TTabSheet;
    Shape5: TShape;
    Shape3: TShape;
    Label7: TLabel;
    Label8: TLabel;
    Label5: TLabel;
    strgrdDatos2: TStringGrid;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    edCvePrBca: TEdit;
    edDescCveBca: TInterEdit;
    btCarga: TBitBtn;
    CBtodos: TCheckBox;
    pbRegistros: TProgressBar;
    ilTIPOCRED: TInterLinkit;
    ImageList: TImageList;
    procedure ConfGrid( SGrid : TStringGrid );
    procedure ConfGrid2( SGrid : TStringGrid );    
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure strgrdDatosDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure strgrdDatosMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ilTIPOCREDCapture(Sender: TObject; var Show: Boolean);
    procedure ilTIPOCREDEjecuta(Sender: TObject);
    procedure btPRODUCTOClick(Sender: TObject);
    procedure InterForma1AntesNuevo(Sender: TObject;
      var Realizado: Boolean);
    procedure InterForma1AntesAceptar(Sender: TObject; IsNewData: Boolean;
      var Realizado: Boolean);
    procedure InterForma1AntesEliminar(Sender: TObject;
      var Realizado: Boolean);
    procedure InterForma1AntesModificar(Sender: TObject;
      var Realizado: Boolean);
    procedure InterForma1DespuesAceptar(Sender: TObject);
    procedure InterForma1DespuesCancelar(Sender: TObject);
    procedure InterForma1DespuesEliminar(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure strgrdDatos2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure strgrdDatos2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure InvertCheck(StrinGrid : TStringGrid; nCol, nRow : Integer);
    procedure CBtodosClick(Sender: TObject);
    procedure btCargaClick(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);

    private

    procedure MuestraDatos;
    procedure MuestraDatos2;
    { Private declarations } 
    public 
    { Public declarations } 
    Objeto : TCrbcatipc;
    Function  CargaDatos(var pTipCred,PPrdBca:string):boolean;

end; 
 TCrbcatipc= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }

        ParamCre          : TParamCre;
        Crreltcre         : TCrreltcre;

        CVE_TIPO_CREDITO  : TInterCampo;
        DESC_TIPO_CRED    : TInterCampo;
        CVE_PRODUCTO_BCA  : TInterCampo;
        DESC_PROD_BCA     : TINterCampo;
        CVE_USU_ALTA      : TInterCampo;
        F_ALTA            : TInterCampo;
        CVE_USU_MODIFICA  : TInterCampo;
        F_MODIFICA        : TInterCampo;
        CVE_USU_BAJA      : TInterCampo;
        F_BAJA            : TInterCampo;


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

implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrbcatipc.Create( AOwner : TComponent ); 
begin Inherited;

      Crreltcre := TCrreltcre.Create(Self);
            Crreltcre.MasterSource := Self;
            Crreltcre.FieldByName('CVE_TIPO_CREDITO').MasterField := 'CVE_TIPO_CREDITO';

      CVE_TIPO_CREDITO := CreaCampo('CVE_TIPO_CREDITO',ftInteger,tsNinguno,tsNinguno,True);
                          CVE_TIPO_CREDITO.Caption := 'Clave Área Negocio';


   {   DESC_TIPO_CRED := CreaCampo('DESC_TIPO_CRED',ftString,tsNinguno,tsNinguno,False);
                          DESC_TIPO_CRED.Caption := 'Desc. Tipo Cred';    }


      CVE_PRODUCTO_BCA := CreaCampo('CVE_PRODUCTO_BCA',ftString,tsNinguno,tsNinguno,True);
                          CVE_PRODUCTO_BCA.Caption := 'Clave Área Negocio';


      DESC_PROD_BCA := CreaCampo('DESC_PROD_BCA',ftString,tsNinguno,tsNinguno,False);
                          DESC_PROD_BCA.Caption := 'Desc. Prod Banca';


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



      FKeyFields.Add('CVE_TIPO_CREDITO');
      FKeyFields.Add('CVE_PRODUCTO_BCA');
      TableName := 'CR_REL_PRODBCA_TIPO_CRED';
      StpName  := ' '; 
      UseQuery := True; 
      HelpFile := 'IntCrbcatipc.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrbcatipc.Destroy;
begin
    If Crreltcre <> Nil Then
       Crreltcre.Free;
inherited;
end;


function TCrbcatipc.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrbcatipc;
begin
   W:=TWCrbcatipc.Create(Self);
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


Function TCrbcatipc.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrbcati.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end; 
end;

function TCrbcatipc.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CrBcaTipC********************)
(*                                                                              *)
(*  FORMA DE CrBcaTipC                                                            *)
(*                                                                              *)
(***********************************************FORMA CrBcaTipC********************)

procedure TWCrbcatipc.FormShow(Sender: TObject);
begin

   Objeto.CVE_TIPO_CREDITO.Control := edTipoCred;
   Objeto.DESC_PROD_BCA.Control := edDescCorta2;
   Objeto.CVE_PRODUCTO_BCA.Control := edCveProd;
   Objeto.CVE_USU_ALTA.Control := edUsuAlta;
   Objeto.F_ALTA.Control := edF_Alta;
   Objeto.CVE_USU_MODIFICA.Control := edUsu_Modifica;
   Objeto.F_MODIFICA.Control := edF_Modifica;
   Objeto.CVE_USU_BAJA.Control := edUsu_Baja;
   Objeto.F_BAJA.Control := edF_Baja;
   Objeto.Crreltcre.DESC_TIPO_CRED.Control := edDESC_tipocred;

   MuestraDatos;

end;

procedure TWCrbcatipc.FormDestroy(Sender: TObject);
begin
   Objeto.CVE_TIPO_CREDITO.Control := nil;
   Objeto.DESC_PROD_BCA.Control := nil;
   Objeto.CVE_PRODUCTO_BCA.Control := nil;
   Objeto.CVE_USU_ALTA.Control := nil;
   Objeto.F_ALTA.Control := nil;
   Objeto.CVE_USU_MODIFICA.Control := nil;
   Objeto.F_MODIFICA.Control := nil;
   Objeto.CVE_USU_BAJA.Control := nil;
   Objeto.F_BAJA.Control := nil;
   Objeto.Crreltcre.DESC_TIPO_CRED.Control := nil;
end;

procedure TWCrbcatipc.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrbcatipc.InterForma1DespuesNuevo(Sender: TObject);
var   vlsql  : String;
      Query1 : TQuery;
begin
      vlsql  :=  'select sysdate from dual ';
      Query1 := GetSQLQuery(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
      Objeto.F_ALTA.AsDateTime := Query1.FieldByName('SYSDATE').AsDateTime;
      Objeto.CVE_USU_ALTA.AsString := Objeto.Apli.Usuario;
      edTipoCred.SetFocus;
      edCveProd.text := vgprodbca;
      edCvePrBca.Text := vgprodbca;
      edDescCorta2.text := vgdescprod;
      edDescCveBca.text := vgdescprod;
end;

procedure TWCrbcatipc.InterForma1DespuesModificar(Sender: TObject);
var   vlsql  : String;
      Query1 : TQuery;
begin
      edCveProd.text := vgprodbca;
      edCvePrBca.Text := vgprodbca;
      edDescCorta2.text := vgdescprod;
      edDescCveBca.text := vgdescprod;
      vlsql  :=  'select sysdate from dual ';
      Query1 := GetSQLQuery(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
      Objeto.F_MODIFICA.AsDateTime := Query1.FieldByName('SYSDATE').AsDateTime;
      Objeto.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
      edTipoCred.SetFocus;
      edCveProd.text := vgprodbca;
      edDescCorta2.text := vgdescprod;
end;

//procedure TWCrbcatipc.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCrbcatipc.MuestraDatos;
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

        vlsql :=  '  SELECT crp.cve_tipo_credito, crd.desc_tipo_cred, crd.SIT_TIPO_CRED, crp.cve_producto_bca, crp.CVE_USU_ALTA,'+
                  '         crp.F_ALTA, crp.CVE_USU_MODIFICA, crp.F_MODIFICA, crp.CVE_USU_BAJA, crp.F_BAJA'+
                  '    FROM cr_rel_prodbca_tipo_cred crp, cr_tipo_credito crd'+
                  '   WHERE crd.cve_tipo_credito = crp.cve_tipo_credito'+
                  '     and crp.CVE_PRODUCTO_BCA = '''+edCveProd.Text+''''+
                  '   order by crp.cve_tipo_credito';

  Query1 := GetSQLQuery(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );

      if Query1 = nil then
         begin
         ShowMessage('  ¡ No se encontraron tipos de Crédito Asociados !');
         end
      else
      begin
   fila := 2;
   try
    while not Query1.EOF do
      begin
         try
          with strgrdDatos do  begin
           Cells[CO_COL_CVETIPCR, nRow] := Query1.FieldByName('CVE_TIPO_CREDITO').AsString;
           Cells[CO_COL_DESCPROD, nRow]  := Query1.FieldByName('DESC_TIPO_CRED').AsString;
           Cells[CO_COL_SITUA, nRow]  := Query1.FieldByName('SIT_TIPO_CRED').AsString;
           Cells[CO_COL_PRODBCA, nRow]  := Query1.FieldByName('CVE_PRODUCTO_BCA').AsString;
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

procedure TWCrbcatipc.strgrdDatosDrawCell(Sender: TObject; ACol,
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
      if (ACol = CO_COL_DESCPROD) then
         Alineacion := taLeftJustify;

      if (ACol = CO_COL_CVETIPCR) or (ACol = CO_COL_SITUA) then
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

procedure TWCrbcatipc.strgrdDatosMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
 var
  nCol, nRow : Integer;
  cvetipocre, desctipo, situa, cveprodbca, usualta, falta, usumodif, fmodif, usubaja, fbaja : String;
begin
   strgrdDatos.MouseToCell(X, Y, nCol, nRow);
   if trim(strgrdDatos.Cells[CO_COL_CVETIPCR, nRow]) <> '' then
      begin
      cvetipocre := strgrdDatos.Cells[CO_COL_CVETIPCR, nRow];
      desctipo := strgrdDatos.Cells[CO_COL_DESCPROD, nRow];
      situa := strgrdDatos.Cells[CO_COL_SITUA, nRow];
      cveprodbca := strgrdDatos.Cells[CO_COL_PRODBCA, nRow];
      usualta := strgrdDatos.Cells[CO_COL_USUALTA, nRow];
      falta := strgrdDatos.Cells[CO_COL_FALTA, nRow];
      usumodif := strgrdDatos.Cells[CO_COL_USUMODIF, nRow];
      fmodif := strgrdDatos.Cells[CO_COL_FMODIF, nRow];
      usubaja := strgrdDatos.Cells[CO_COL_USUBAJA, nRow];
      fbaja := strgrdDatos.Cells[CO_COL_FBAJA, nRow];
      Objeto.FindKey([cvetipocre,cveprodbca]);

      edTipoCred.Text := cvetipocre;
      edDESC_tipocred.Text := desctipo;

//      edCveProd.text := vgprodbca;
//      edCvePrBca.Text := vgprodbca;
      edDescCorta2.text := vgdescprod;
      edDescCveBca.text := vgdescprod;
      
 {     if situa = 'AC' then
      rgSITUACION.ItemIndex := 0
      else
      rgSITUACION.ItemIndex := 1;}

      edF_Alta.Text := falta;
      edF_Modifica.Text := fmodif;
      edF_Baja.Text := fbaja;
      edUsuAlta.Text := usualta;
      edUsu_Modifica.Text := usumodif;
      edUsu_Baja.Text := usubaja;
      end;
end;

procedure TWCrbcatipc.ConfGrid(SGrid: TStringGrid);
begin
 With SGrid Do
   Begin
      ColCount := 10;
      RowHeights[0] := DefaultRowHeight;
      RowCount := 1;
      ColWidths[CO_COL_CVETIPCR] := 78;
      ColWidths[CO_COL_DESCPROD]  := 247;
      ColWidths[CO_COL_SITUA]  := 55;
      ColWidths[CO_COL_PRODBCA]  := 0;
      ColWidths[CO_COL_USUALTA]  := 0;
      ColWidths[CO_COL_FALTA]  := 0;
      ColWidths[CO_COL_USUMODIF]  := 0;
      ColWidths[CO_COL_FMODIF]  := 0;
      ColWidths[CO_COL_USUBAJA]  := 0;
      ColWidths[CO_COL_FBAJA]  := 0;
    End;
end;

procedure TWCrbcatipc.ilTIPOCREDCapture(Sender: TObject;
  var Show: Boolean);
begin
   Show := True;
end;

procedure TWCrbcatipc.ilTIPOCREDEjecuta(Sender: TObject);
begin
    If Objeto.Crreltcre.FindKey([ilTIPOCRED.Buffer]) Then Begin
       InterForma1.NextTab(edTipoCred);
    End;
end;

procedure TWCrbcatipc.btPRODUCTOClick(Sender: TObject);
begin
      Objeto.Crreltcre.ShowAll := True;
   if Objeto.Crreltcre.Busca then
      InterForma1.NextTab(edTipoCred);
end;

procedure TWCrbcatipc.InterForma1AntesNuevo(Sender: TObject;
  var Realizado: Boolean);
begin
    vgprodbca :=  edCveProd.Text;
    vgdescprod := edDescCorta2.Text;
end;

procedure TWCrbcatipc.InterForma1AntesAceptar(Sender: TObject;
  IsNewData: Boolean; var Realizado: Boolean);
begin
      vgprodbca := edCveProd.text;
      vgdescprod := edDescCorta2.text;
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

procedure TWCrbcatipc.InterForma1AntesEliminar(Sender: TObject;
  var Realizado: Boolean);
begin
    vgprodbca :=  edCveProd.Text;
    vgdescprod := edDescCorta2.Text;
end;

procedure TWCrbcatipc.InterForma1AntesModificar(Sender: TObject;
  var Realizado: Boolean);
begin
if edTipoCred.text = '' then
   Showmessage('¡ Para modificar, debe seleccionar un producto !');
   vgprodbca :=  edCveProd.Text;
   vgdescprod := edDescCorta2.Text;
end;

procedure TWCrbcatipc.InterForma1DespuesAceptar(Sender: TObject);
begin
     edCveProd.text := vgprodbca;
     edCvePrBca.Text := vgprodbca;
     edDescCorta2.text := vgdescprod;
     edDescCveBca.text := vgdescprod;
     MuestraDatos;
end;

procedure TWCrbcatipc.InterForma1DespuesCancelar(Sender: TObject);
begin
     edCveProd.text := vgprodbca;
     edCvePrBca.Text := vgprodbca;
     edDescCorta2.text := vgdescprod;
     edDescCveBca.text := vgdescprod;
     MuestraDatos;
end;

procedure TWCrbcatipc.InterForma1DespuesEliminar(Sender: TObject);
begin
     edCveProd.text := vgprodbca;
     edCvePrBca.Text := vgprodbca;
     edDescCorta2.text := vgdescprod;
     edDescCveBca.text := vgdescprod;
     MuestraDatos;
end;

procedure TWCrbcatipc.TabSheet2Show(Sender: TObject);
begin
  edCvePrBca.Text := vgprodbca;//objeto.CVE_PRODUCTO_BCA.AsString;
  edDescCveBca.Text := vgdescprod;//Objeto.DESC_PROD_BCA.AsString;
  MuestraDatos2;
end;

procedure TWCrbcatipc.MuestraDatos2;
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

        vlsql :=  '  SELECT cve_tipo_credito, desc_tipo_cred'+
                  '    FROM cr_tipo_credito'+
                  '   WHERE 1 = 1'+
                  '     AND sit_tipo_cred = ''AC'''+
                  'ORDER BY cve_tipo_credito';

  Query1 := GetSQLQuery(vlsql, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );

      if Query1 = nil then
         begin
         ShowMessage('  ¡ No se encontó Información !');
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
           Cells[CO_COL_TIPOPROD, nRow] := Query1.FieldByName('CVE_TIPO_CREDITO').AsString;
           Cells[CO_COL_DESPRODD, nRow]  := Query1.FieldByName('DESC_TIPO_CRED').AsString;
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

procedure TWCrbcatipc.strgrdDatos2DrawCell(Sender: TObject; ACol,
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
      if (ACol = CO_COL_DESPRODD) then
         Alineacion := taLeftJustify;

      if (ACol = CO_COL_TIPOPROD) then
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
         Else ImageList.GetBitmap(0,Bmp);
         Canvas.Draw(Rect.Left,Rect.Top,Bmp);
         Bmp.FreeImage;
         Bmp.Free;
      End;

   End;
end;

procedure TWCrbcatipc.strgrdDatos2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var nCol, nRow : Integer;
begin
   strgrdDatos2.MouseToCell(X, Y, nCol, nRow);
   if nCol = CO_COL_CHECK then
   begin
    InvertCheck(strgrdDatos2, CO_COL_CHECK, nRow);
   end;
end;

procedure TWCrbcatipc.InvertCheck(StrinGrid: TStringGrid; nCol,
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

procedure TWCrbcatipc.ConfGrid2(SGrid: TStringGrid);
begin
 With SGrid Do
   Begin
      ColCount := 3;
      RowHeights[0] := DefaultRowHeight;
      RowCount := 1;
      ColWidths[CO_COL_CHECK] := 26;
      ColWidths[CO_COL_TIPOPROD] := 80;
      ColWidths[CO_COL_DESPRODD]  := 332;
    End;
end;

procedure TWCrbcatipc.CBtodosClick(Sender: TObject);
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

procedure TWCrbcatipc.btCargaClick(Sender: TObject);
var VLCtdorLine : Integer;
    VLcvetipcre, VLpordbca  : String;
    vlTermina         : Boolean;
begin
 if MessageDlg('¿Desea dar de alta la información marcada?',
     mtConfirmation,[mbYes, mbNo], 0) = mrYes then
     begin
        For VLCtdorLine := 0 to (strgrdDatos2.RowCount-1) do //INICIALIZA INDICADOR DE PROGRESO
       begin
       if strgrdDatos2.Cells[CO_COL_CHECK, VLCtdorLine] = CO_CHECKED  then
         begin
          VLcvetipcre := UpperCase(strgrdDatos2.Cells[1,VLCtdorLine]);
          VLpordbca := vgprodbca;//Objeto.CVE_PRODUCTO_BCA.AsString;

          If not(CargaDatos(VLcvetipcre, VLpordbca)) then //Carga los datos del grid a la tabla
          Showmessage('Error al cargar el tipo de Crédito: '+ VLcvetipcre);
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

function TWCrbcatipc.CargaDatos(var pTipCred, PPrdBca: string): boolean;
var VLSalida: Boolean;
    vlsql   : String;
Begin
   vlsql := ' INSERT INTO CR_REL_PRODBCA_TIPO_CRED (CVE_TIPO_CREDITO, CVE_PRODUCTO_BCA, CVE_USU_ALTA, F_ALTA)'+
            ' VALUES ('+#39+pTipCred+#39+','+#39+PPrdBca+#39+','+#39+Objeto.Apli.Usuario+#39+','+SQLFecha(Objeto.Apli.DameFechaEmpresa)+')';
   VLSalida := RunSQL(vlsql,objeto.Apli.DataBaseName,objeto.Apli.SessionName,False);
   CargaDatos := VLSalida;
end;

procedure TWCrbcatipc.InterForma1DespuesShow(Sender: TObject);
begin
   vgprodbca :=  edCveProd.Text;
   vgdescprod := edDescCorta2.Text;
end;

end.


