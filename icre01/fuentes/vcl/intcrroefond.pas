// Sistema         : Clase de ROEFND
// Fecha de Inicio : 11/06/2012
// Función forma   : Clase de ROEFND
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Juan Francisco Ortega Flores
// Comentarios     :
Unit IntCrroefond;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk,
IntParamCre, Grids, InterEdit, IntGenCre;

const
   CO_COL_CVEFOND  = 0;
   CO_COL_DIAMIN   = CO_COL_CVEFOND + 1;
   CO_COL_DIAMAX   = CO_COL_DIAMIN + 1;
   CO_COL_COSTFON  = CO_COL_DIAMAX + 1;


Type
 TCrroefond= class; 

  TWCrroefond=Class(TForm)
    InterForma1             : TInterForma;
    lbCVE_GRUPO_ECO: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Shape4: TShape;
    Label3: TLabel;
    Shape2: TShape;
    Label5: TLabel;
    Shape1: TShape;
    Label1: TLabel;
    Shape3: TShape;
    Label4: TLabel;
    edCveCostoFondeo: TInterEdit;
    edDiaMin: TInterEdit;
    edDiaMax: TInterEdit;
    edCostoFondeo: TInterEdit;
    strgrdDatos: TStringGrid;
    btACTUALIZA: TBitBtn;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDEmpresa: TLabel;
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
    Objeto : TCrroefond;
end; 
 TCrroefond= class(TInterFrame) 
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations } 

        CVE_COSTO_FONDEO : TInterCampo;
        DIA_MIN          : TInterCampo;
        DIA_MAX          : TInterCampo;
        COSTO_DE_FONDEO  : TInterCampo;
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


constructor TCrroefond.Create( AOwner : TComponent ); 
begin Inherited; 
      {CAMPO1 :=CreaCampo('CAMPO1',ftString,tsNinguno,tsNinguno,False);
                CAMPO1.Caption:='Campo1';
                CAMPO1.Parametro:='CAMPO1';}
      CVE_COSTO_FONDEO :=CreaCampo('CVE_COSTO_FONDEO',ftInteger,tsNinguno,tsNinguno,True);
                CVE_COSTO_FONDEO.Caption := 'Clave costo Fondeo';
      DIA_MIN := CreaCampo('DIA_MIN',ftInteger,tsNinguno,tsNinguno,True);
                DIA_MIN.Caption := 'Día Mínimo';
      DIA_MAX := CreaCampo('DIA_MAX',ftInteger,tsNinguno,tsNinguno,True);
                DIA_MAX.Caption := 'Día Máximo';
      COSTO_DE_FONDEO := CreaCampo('COSTO_DE_FONDEO',ftFloat,tsNinguno,tsNinguno,True);
                COSTO_DE_FONDEO.Caption := 'Costo de Fondeo';


      FKeyFields.Add('CVE_COSTO_FONDEO');
      TableName := 'CR_ROE_COSTO_FONDEO';
      UseQuery := True;
      HelpFile := 'IntCrroefond.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrroefond.Destroy;
begin inherited;
end;


function TCrroefond.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrroefond;
begin
   W:=TWCrroefond.Create(Self);
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


Function TCrroefond.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrroefo.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TCrroefond.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA CrRoeFond********************)
(*                                                                                *)
(*  FORMA DE CrRoeFond                                                            *)
(*                                                                                *)
(***********************************************FORMA CrRoeFond********************)

procedure TWCrroefond.FormShow(Sender: TObject);
begin
     lbDempresa.Caption := objeto.ParamCre.EMPRESA.AsString;
     lbDUsuario.Caption := objeto.ParamCre.USUARIO.AsString;
     lbDPerfil.Caption  := objeto.ParamCre.PERFIL.AsString;

     objeto.CVE_COSTO_FONDEO.Control := edCveCostoFondeo;
     objeto.DIA_MIN.Control := edDiaMin;
     objeto.DIA_MAX.Control := edDiaMax;
     objeto.COSTO_DE_FONDEO.Control := edCostoFondeo;

     MuestraDatos;
end;

procedure TWCrroefond.FormDestroy(Sender: TObject);
begin
     objeto.CVE_COSTO_FONDEO.Control := NIL;
     objeto.DIA_MIN.Control := NIL;
     objeto.DIA_MAX.Control := NIL;
     objeto.COSTO_DE_FONDEO.Control := NIL;
   //Objeto
end;

procedure TWCrroefond.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCrroefond.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
   edCveCostoFondeo.SetFocus;
end;

procedure TWCrroefond.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrroefond.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCrroefond.MuestraDatos;
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

        vlsql :=  'SELECT CVE_COSTO_FONDEO,DIA_MIN,DIA_MAX,COSTO_DE_FONDEO  FROM CR_ROE_COSTO_FONDEO ORDER BY 1';

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
           Cells[CO_COL_CVEFOND, nRow] := Query1.FieldByName('CVE_COSTO_FONDEO').AsString;
           Cells[CO_COL_DIAMIN, nRow]  := Query1.FieldByName('DIA_MIN').AsString;
           Cells[CO_COL_DIAMAX, nRow]  := Query1.FieldByName('DIA_MAX').AsString;
           Cells[CO_COL_COSTFON, nRow] := Query1.FieldByName('COSTO_DE_FONDEO').AsString;
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

procedure TWCrroefond.ConfGrid(SGrid: TStringGrid);
begin
 With SGrid Do
   Begin
      ColCount := 4;
      RowHeights[0] := DefaultRowHeight;
      RowCount := 1;
      ColWidths[CO_COL_CVEFOND] := 65;
      ColWidths[CO_COL_DIAMIN]  := 64;
      ColWidths[CO_COL_DIAMAX]  := 64;
      ColWidths[CO_COL_COSTFON] := 96;
    End;
end;

procedure TWCrroefond.strgrdDatosMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
 var
  nCol, nRow : Integer;
  cve_costo, diamin, diamax, costof : String;
begin
   strgrdDatos.MouseToCell(X, Y, nCol, nRow);
   if trim(strgrdDatos.Cells[CO_COL_CVEFOND, nRow]) <> '' then
      begin
      cve_costo := strgrdDatos.Cells[CO_COL_CVEFOND, nRow];
      diamin := strgrdDatos.Cells[CO_COL_DIAMIN, nRow];
      diamax := strgrdDatos.Cells[CO_COL_DIAMAX, nRow];
      costof := strgrdDatos.Cells[CO_COL_COSTFON, nRow];
      Objeto.FindKey([cve_costo]);

      edCveCostoFondeo.Text := cve_costo;
      edDiaMin.Text := diamin;
      edDiaMax.Text := diamax;
      edCostoFondeo.Text := costof;
      end;
end;

procedure TWCrroefond.btACTUALIZAClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCRROEFOND_ACTUL',True,True) then
      Muestradatos;
end;

procedure TWCrroefond.InterForma1AntesAceptar(Sender: TObject;
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

procedure TWCrroefond.InterForma1AntesModificar(Sender: TObject;
  var Realizado: Boolean);
begin
   edCveCostoFondeo.SetFocus;
end;

procedure TWCrroefond.InterForma1DespuesAceptar(Sender: TObject);
begin
MuestraDatos;
end;

procedure TWCrroefond.InterForma1DespuesEliminar(Sender: TObject);
begin
MuestraDatos;
end;

procedure TWCrroefond.strgrdDatosDrawCell(Sender: TObject; ACol,
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
      if (ACol = CO_COL_CVEFOND) or(ACol = CO_COL_DIAMIN) or(ACol = CO_COL_DIAMAX) then
         Alineacion := taLeftJustify;

      if (ACol = CO_COL_COSTFON) THEN
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
