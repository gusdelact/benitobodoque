// Sistema         : Clase de CreSelEmp
// Fecha de Inicio : 08/02/2011
// Función forma   : Clase de CrVencAnt
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : 
// Comentarios     :                                     
                         
Unit IntCreSelEmp;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Excel97, OleServer, IntSGCtrl,
//Clases Adicionales
 IntParamCre,IntCrActPa, Gauges, Grids, Aligrid,IntGenCre, ImgList;

Const
   coCRLF      = #13#10;
   CO_COL_IDEMPRESA  = 0;
   CO_COL_EMPRESA    = CO_COL_IDEMPRESA + 1;
   CO_COL_CHECK      = CO_COL_EMPRESA + 1;

   CO_ERROR     = 'ERR';  // Mensaje de Error
   CO_CHECKED   = 'V';
   CO_UNCHECKED = 'F';
   CO_NOTCHECK  = '-';

Type
 TCreSelEmp= class;

  TWCreSelEmp=Class(TForm)
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
    btPROC_INFO: TBitBtn;
    GBAutorizacion: TGroupBox;
    Shape6: TShape;
    Shape7: TShape;
    Label14: TLabel;
    Label10: TLabel;
    strgrdSelEmp: TStringGrid;
    ImageList: TImageList;
    Ropcion: TRadioGroup;
    Shape1: TShape;
    Label1: TLabel;
    Rempresas: TRadioGroup;


    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);

    Procedure ReQueryVA(peID_EMPRESA : String; nfila:boolean; var irow:word);
    Procedure Llenatabla;
    procedure Check_Table(Sender: TObject);
    procedure descheck(Sender: TObject);
    procedure btPROC_INFOClick(Sender: TObject);
    procedure strgrdSelEmpDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure strgrdSelEmpMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RopcionClick(Sender: TObject);
    procedure RempresasClick(Sender: TObject);



    private
    { Private declarations }
    procedure InvertCheck(StrinGrid : TStringGrid; nCol, nRow : Integer);

    public 
    { Public declarations }
    Objeto : TCreSelEmp;

   // Procedure LimpiaTabla( var  vlError : String );
    procedure ConfGrid( SGrid : TStringGrid );

end;
 TCreSelEmp= class(TInterFrame)
      private 
      protected 
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override; 
      public 
        { Public declarations }
        CAMPO1                   : TInterCampo;

        //Clases Adicionales
        ParamCre                 : TParamCre;

        CadenaSql                : String;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override; 
        destructor  Destroy; override; 
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
 ///       function    Reporte:Boolean; override;

      published 
      end;


var

    vlTotal, vlFila : word;
    wCreSelEmp : TwCreSelEmp;
    vlID_EMPRESA, vlEMPRESA:STRING;

    vlQry: TQuery;
    vlSql: string;
    nRow : word;
    vlError : String;        

implementation
//Uses RepMon;

{$R *.DFM}


constructor TCreSelEmp.Create( AOwner : TComponent );
begin Inherited; 
      CAMPO1 :=CreaCampo('CAMPO1',ftString,tsNinguno,tsNinguno,False);
                CAMPO1.Caption:='Campo1';
                CAMPO1.Parametro:='CAMPO1';

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrVencAnt.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCreSelEmp.Destroy;
begin inherited;
end;


function TCreSelEmp.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCreSelEmp;
begin
   W:=TWCreSelEmp.Create(Self);
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


Function TCreSelEmp.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('ICrselemp.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

{
function TCrVencAnt.Reporte:Boolean;
begin //Execute_Reporte();
end;
 }


(***********************************************FORMA CrVencAnt********************)
(*                                                                              *)
(*  FORMA DE CrVencAnt                                                            *)
(*                                                                              *)
(***********************************************FORMA CrVencAnt********************)

procedure TWCreSelEmp.descheck(Sender: TObject);
begin
       vlTotal := strgrdSelEmp.RowCount;
       vlFila  := 0;
       vlID_EMPRESA := strgrdSelEmp.Cells[CO_COL_IDEMPRESA, vlFila];
       while vlFila < vlTotal do
       begin
          strgrdSelEmp.Cells[CO_COL_CHECK, vlFila]  := CO_UNCHECKED;
          vlFila := vlFila + 1;
       end;
end;

procedure TWCreSelEmp.Check_Table(Sender: TObject);
var
   vlCheck, vlSqle : string;
   vlQrye   : TQuery;

begin
      vlTotal := strgrdSelEmp.RowCount;
      vlSqle :=' SELECT ID_EMPRESA, EMPRESA ' +
              ' FROM TMP_EMPRESAS';

      vlQrye := GetSQLQuery(vlSqle,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );

      try
        if vlQrye <> nil then
        begin
           while not vlQrye.Eof do
           begin
             vlCheck := vlQrye.FieldByName('ID_EMPRESA').AsString;
             vlFila  := 0;

             while vlFila < vlTotal do
             begin
                 vlID_EMPRESA := strgrdSelEmp.Cells[CO_COL_IDEMPRESA, vlFila];
                 if trim(vlID_EMPRESA) = trim(vlCheck) then
                 begin
                      strgrdSelEmp.Cells[CO_COL_CHECK, vlFila]  := CO_CHECKED;
                      Break;
                 end;
                 vlFila := vlFila + 1;
             end;
             vlQrye.Next;
           end;
        end;
      finally
        if vlQrye <> nil then
          vlQrye.free;
      end;
end;

procedure TWCreSelEmp.ConfGrid( SGrid : TStringGrid );
begin
 With SGrid Do
   Begin
      ColCount := 3;

      RowHeights[0] := DefaultRowHeight;
      RowCount := 1;

      ColWidths[CO_COL_IDEMPRESA] := 79;
      ColWidths[CO_COL_EMPRESA]   := 481;
      ColWidths[CO_COL_CHECK]     := 50;
    End;
end;

procedure TWCreSelEmp.InvertCheck(StrinGrid : TStringGrid; nCol, nRow : Integer);
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

Procedure  TWCreSelEmp.ReQueryVA(peID_EMPRESA : String; nfila:boolean; var irow:word);
begin
  With strgrdSelEmp Do
   Begin

      Cells[CO_COL_IDEMPRESA, irow] := peID_EMPRESA;
      Cells[CO_COL_EMPRESA, irow]   := vlEMPRESA;
      Cells[CO_COL_CHECK, irow]     := CO_UNCHECKED;

      Inc(irow);
   End;
end;

Procedure  TWCreSelEmp.Llenatabla;
begin
 With Objeto Do
   Begin
      ClearGrid(strgrdSelEmp,0);
      if Rempresas.ItemIndex=0 then
      begin
         vlSql :=' SELECT ID_PERSONA, NOMBRE ' +coCRLF+
                 ' FROM PERSONA' +coCRLF+
                 ' WHERE ID_PERSONA IN (SELECT DISTINCT ID_EMPRESA '+coCRLF+
                 '                        FROM EMPLEADO WHERE ID_PERSONA IN ( '+coCRLF+
            ' SELECT C.ID_TITULAR '+coCRLF+
            '       FROM ( '+coCRLF+
            '              SELECT CVE_CLAVE AS CVE_PRODUCTO_CRE'+coCRLF+
            '                FROM CR_CON_CAT_DATA '+coCRLF+
            '               WHERE CVE_CON_GPO_CAT = ''CAT_PROD_ABCD'''+coCRLF+
            '              ) CPROD_ICRE,'+coCRLF+
            '              CR_CREDITO CC, '+coCRLF+
            '              CR_CONTRATO CO, '+coCRLF+
            '              CONTRATO C '+coCRLF+
            '         WHERE CO.CVE_PRODUCTO_CRE = CPROD_ICRE.CVE_PRODUCTO_CRE'+coCRLF+
            '          AND CC.ID_CONTRATO = CO.ID_CONTRATO'+coCRLF+
            '          AND C.ID_CONTRATO = CO.ID_CONTRATO'+coCRLF+
            '          AND C.ID_CONTRATO = CC.ID_CONTRATO'+coCRLF+
            '          AND CC.SIT_CREDITO = ''AC'''+coCRLF+
                                     ' )'+coCRLF+
                                     ' )';                                     
      end;

      if Rempresas.ItemIndex=1 then
      begin
         vlSql :=' SELECT ID_PERSONA, NOMBRE ' +
                 ' FROM PERSONA' +
                 ' WHERE ID_PERSONA IN (SELECT ID_EMPRESA FROM EMPRESA)' ;
      end;

      vlQry := GetSQLQuery(vlSql,Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True );
      try
        ConfGrid(strgrdSelEmp);
        nRow := 0;
        if vlQry <> nil then
        begin
              while not vlQry.Eof do
              begin
                vlID_EMPRESA := vlQry.FieldByName('ID_PERSONA').AsString;
                vlEMPRESA:= vlQry.FieldByName('NOMBRE').AsString;

                ReQueryVA(vlID_EMPRESA, True, nrow);
                vlQry.Next;
              end;
        end
        else
           ShowMessage ('No se encontraron registros en la tabla de Empresas');
      finally
        if vlQry <> nil then
             vlQry.free;
      end;
      strgrdSelEmp. RowCount := nRow;
   end;
end;


procedure TWCreSelEmp.FormShow(Sender: TObject);
begin

 With Objeto Do
   Begin
      CAMPO1.Control:=edCAMPO1;
   end;
   Llenatabla;
   Check_table (Sender);
end;

procedure TWCreSelEmp.FormDestroy(Sender: TObject);
begin
      Objeto.CAMPO1.Control:=nil;
   //Objeto
end;

procedure TWCreSelEmp.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWCreSelEmp.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCreSelEmp.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//////////////////////////

procedure TWCreSelEmp.btPROC_INFOClick(Sender: TObject);
begin

   //Elimina la información de la tabla temporal de empresas
   vlSQL := ' delete from TMP_EMPRESAS ';
   RunSQL (vlSQL, Objeto.Apli.DataBaseName, Objeto.Apli.SessionName, True);

   vlTotal := strgrdSelEmp.RowCount;
   vlFila  := 0;
   while vlFila < vlTotal do
   begin
        if strgrdSelEmp.Cells[CO_COL_CHECK, vlFila] = CO_CHECKED then
        begin
             vlSQL := 'INSERT INTO TMP_EMPRESAS '+
                      '    (ID_EMPRESA, EMPRESA)'+
                      'VALUES'+
                      '    (' + strgrdSelEmp.Cells[CO_COL_IDEMPRESA, vlFila]+
                      ', ''' + strgrdSelEmp.Cells[CO_COL_EMPRESA, vlFila] + ''' )';
             RunSQL(vlsql,Objeto.Apli.DataBaseName,Objeto.Apli.SessionName, False);
        end;
        vlFila := vlFila + 1;
   end;

end;

procedure TWCreSelEmp.strgrdSelEmpDrawCell(Sender: TObject; ACol,
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
      If (gdSelected In State) Then Canvas.Brush.Color := clWhite;

      Canvas.Font.Color := clBlack;

      Canvas.TextRect(Rect,Rect.Left,Rect.Top,Cells[ACol, ARow]);

      if (ACol = CO_COL_IDEMPRESA)or(ACol = CO_COL_CHECK) then
         Alineacion := taCenter;

      if (ACol = CO_COL_EMPRESA)  then
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


procedure TWCreSelEmp.strgrdSelEmpMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var nCol, nRow : Integer;
begin
   strgrdSelEmp.MouseToCell(X, Y, nCol, nRow);
   if nCol = CO_COL_CHECK then
      InvertCheck(strgrdSelEmp, CO_COL_CHECK, nRow);
end;



procedure TWCreSelEmp.RopcionClick(Sender: TObject);
begin
   if Ropcion.Itemindex = 0 then // seleccionados anteriormente
   begin
        descheck (Sender);
        Check_table (Sender);
   end;

   if Ropcion.Itemindex = 1 then // selecciona todos
   begin
      vlTotal := strgrdSelEmp.RowCount;
       vlFila  := 0;
       vlID_EMPRESA := strgrdSelEmp.Cells[CO_COL_IDEMPRESA, vlFila];
       while vlFila < vlTotal do
       begin
          strgrdSelEmp.Cells[CO_COL_CHECK, vlFila]  := CO_CHECKED;
          vlFila := vlFila + 1;
       end;
   end;
   if Ropcion.Itemindex = 2 then // no selecciona nada
   begin
      descheck (Sender);
   end;
end;

procedure TWCreSelEmp.RempresasClick(Sender: TObject);
begin
   Llenatabla;
   Check_table (Sender);   
end;

end.
