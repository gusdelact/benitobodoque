// Sistema         : Clase de ROEFND
// Fecha de Inicio : 11/06/2012
// Función forma   : Clase de ROEFND
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Juan Francisco Ortega Flores
// Comentarios     :
Unit IntCrroelneg;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
IntParamCre, Grids, InterEdit, IntGenCre;

const
   CO_COL_CVELIN = 0;
   CO_COL_DESC   = CO_COL_CVELIN + 1;


Type
 TCrroelneg= class; 

  TWCrroelneg=Class(TForm)
    InterForma1             : TInterForma;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbDUsuario: TLabel;
    lbDEmpresa: TLabel;
    GroupBox1: TGroupBox;
    lbCVE_GRUPO_ECO: TLabel;
    Label2: TLabel;
    edCveLineaNegocio: TInterEdit;
    edDescripcion: TInterEdit;
    GroupBox2: TGroupBox;
    strgrdDatos: TStringGrid;
    btACTUALIZA: TBitBtn;
    Shape4: TShape;
    Label3: TLabel;
    Shape2: TShape;
    Label5: TLabel;
    btALTA_PROD: TBitBtn;
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
    procedure InterForma1AntesEliminar(Sender: TObject;
      var Realizado: Boolean);
    procedure btALTA_PRODClick(Sender: TObject);
    procedure InterForma1ErrorEliminar(Sender: TObject);
    private 
    { Private declarations }
    procedure MuestraDatos;     
    public 
    { Public declarations } 
    Objeto : TCrroelneg;
end; 
 TCrroelneg= class(TInterFrame) 
      private 
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 

        CVE_LINEA_NEG    : TInterCampo;
        DESCRIPCION      : TInterCampo;
        ParamCre    : TParamCre;
        cve_lin1    : String;
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
     cve_lin1 : String;

implementation
Uses
IntCrRoePneg;

{$R *.DFM}


constructor TCrroelneg.Create( AOwner : TComponent ); 
begin Inherited; 
      {CAMPO1 :=CreaCampo('CAMPO1',ftString,tsNinguno,tsNinguno,False);
                CAMPO1.Caption:='Campo1';
                CAMPO1.Parametro:='CAMPO1';}
      CVE_LINEA_NEG :=CreaCampo('CVE_LINEA_NEGOCIO',ftString,tsNinguno,tsNinguno,True);
                CVE_LINEA_NEG.Caption := 'Clave línea negocio';
      DESCRIPCION := CreaCampo('DESC_LINEA_NEGOCIO',ftString,tsNinguno,tsNinguno,True);
                DESCRIPCION.Caption := 'Descripción';


      FKeyFields.Add('CVE_LINEA_NEGOCIO');
      TableName := 'LINEA_NEGOCIO';
      UseQuery := True;
      HelpFile := 'IntCrroelneg.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrroelneg.Destroy;
begin inherited;
end;


function TCrroelneg.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrroelneg;
begin
   W:=TWCrroelneg.Create(Self);
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


Function TCrroelneg.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrroefo.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TCrroelneg.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA Crroelneg********************)
(*                                                                                *)
(*  FORMA DE Crroelneg                                                            *)
(*                                                                                *)
(***********************************************FORMA Crroelneg********************)

procedure TWCrroelneg.FormShow(Sender: TObject);
begin
     lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
     lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
//     lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

     objeto.CVE_LINEA_NEG.Control := edCveLineaNegocio;
     objeto.DESCRIPCION.Control := edDescripcion;

     MuestraDatos;
end;

procedure TWCrroelneg.FormDestroy(Sender: TObject);
begin
     objeto.CVE_LINEA_NEG.Control := NIL;
     objeto.DESCRIPCION.Control := NIL;
   //Objeto
end;

procedure TWCrroelneg.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrroelneg.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
   edCveLineaNegocio.SetFocus;
end;

procedure TWCrroelneg.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrroelneg.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCrroelneg.MuestraDatos;
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

        vlsql :=  'SELECT CVE_LINEA_NEGOCIO, DESC_LINEA_NEGOCIO FROM LINEA_NEGOCIO ORDER BY 1';

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
           Cells[CO_COL_CVELIN, nRow] := Query1.FieldByName('CVE_LINEA_NEGOCIO').AsString;
           Cells[CO_COL_DESC, nRow]  := Query1.FieldByName('DESC_LINEA_NEGOCIO').AsString;
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

procedure TWCrroelneg.ConfGrid(SGrid: TStringGrid);
begin
 With SGrid Do
   Begin
      ColCount := 2;
      RowHeights[0] := DefaultRowHeight;
      RowCount := 1;
      ColWidths[CO_COL_CVELIN] := 65;
      ColWidths[CO_COL_DESC]  := 177;
    End;
end;

procedure TWCrroelneg.strgrdDatosMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
 var
  nCol, nRow : Integer;
  cve_lin, desc : String;
begin
   strgrdDatos.MouseToCell(X, Y, nCol, nRow);
   if trim(strgrdDatos.Cells[CO_COL_CVELIN, nRow]) <> '' then
      begin
      cve_lin := strgrdDatos.Cells[CO_COL_CVELIN, nRow];
      desc := strgrdDatos.Cells[CO_COL_DESC, nRow];
      Objeto.FindKey([cve_lin]);

      edCveLineaNegocio.Text := cve_lin;
      edDescripcion.Text := desc;

      cve_lin1 := strgrdDatos.Cells[CO_COL_CVELIN, nRow];
      end;
end;

procedure TWCrroelneg.btACTUALIZAClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRROELNEG_ACTUA',True,True) then
      Muestradatos;
end;

procedure TWCrroelneg.InterForma1AntesAceptar(Sender: TObject;
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

procedure TWCrroelneg.InterForma1AntesModificar(Sender: TObject;
  var Realizado: Boolean);
begin
   edCveLineaNegocio.SetFocus;
end;

procedure TWCrroelneg.InterForma1DespuesAceptar(Sender: TObject);
begin
MuestraDatos;
end;

procedure TWCrroelneg.InterForma1DespuesEliminar(Sender: TObject);
begin
MuestraDatos;
end;

procedure TWCrroelneg.strgrdDatosDrawCell(Sender: TObject; ACol,
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
      if (ACol = CO_COL_CVELIN) or(ACol = CO_COL_DESC) then
         Alineacion := taLeftJustify;

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

procedure TWCrroelneg.InterForma1AntesEliminar(Sender: TObject;
  var Realizado: Boolean);
begin
//if GetSql('SELECT CVE_LINEA_NEGOCIO FROM PRODUCTO_NEGOCIO WHERE CVE_LINEA_NEGOCIO = '''+ cve_lin1+'''',
//                Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True)
//      then Showmessage('ERROR:   ¡Existe Registro en Catálogo de Producto!');
end;

procedure TWCrroelneg.btALTA_PRODClick(Sender: TObject);
var
   Roepneg : TCrroepneg;           
begin
   if Objeto.ValidaAccesoEsp('TCRROELNEG_PRDNG',True,True) then
   begin
     if edCveLineaNegocio.Text <> '' then
       begin
       Roepneg := TCrroepneg.Create(self);
            try
               Roepneg.apli     := Objeto.Apli;
               Roepneg.ParamCre := Objeto.ParamCre;
               Objeto.cve_lin1  := Objeto.CVE_LINEA_NEG.AsString;
               Roepneg.cve_lin2 := Objeto.cve_lin1;
               Roepneg.Catalogo;
            finally
               Roepneg.Free;
            end;
       end
       else ShowMessage('  ¡Favor de Seleccionar un Registro!');
   end;
end;

procedure TWCrroelneg.InterForma1ErrorEliminar(Sender: TObject);
begin
if GetSql('SELECT CVE_LINEA_NEGOCIO FROM PRODUCTO_NEGOCIO WHERE CVE_LINEA_NEGOCIO = '''+ cve_lin1+'''',
                Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True)
      then Showmessage('ERROR:   ¡ Existe Registro en Catálogo de Producto !');
end;

end.
