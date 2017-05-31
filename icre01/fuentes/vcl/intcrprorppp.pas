// Sistema         : Clase de NINGUNO
// Fecha de Inicio : 14/03/2012
// Función forma   : Clase de NINGUNO
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCrProrPPP;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, InterEdit,
IntCtoPanel,

IntGenCre,
IntParamCre,    //Parametros
IntCrCto,       //Contrato
IntCrCredito,   //Disposición;
ImgList, Grids;

Const
  C_ENTRE = 'Entre';
  C_ESPACIO_EN_BLANCO = ' ';

  C_COL_B_REPARTIR          = 0;
  C_COL_B_PRORRAT           = 1;
  C_COL_ID_CREDITO          = 2;
  C_COL_IMP_CREDITO         = 3;
  C_COL_SIT_CREDITO         = 4;
  C_COL_IMP_PPP_ACTUAL      = 5;
  C_COL_IMP_IVA_ACTUAL      = 6;
  C_COL_IMP_PPP_FUTURO      = 7;
  C_COL_IMP_IVA_FUTURO      = 8;

  CO_CHECKED   = 'V';
  CO_UNCHECKED = 'F';
  CO_NOTCHECK  = '-';

Type
 TCrProrPPP= class;

  TWCrProrPPP=Class(TForm)
    InterForma1             : TInterForma;
    icpCONTRATO: TInterCtoPanel;
    lbID_CONTRATO: TLabel;
    iedID_CONTRATO: TInterEdit;
    btCONTRATO: TBitBtn;
    edCVE_PRODUCTO: TEdit;
    edDESC_PRODUCTO: TEdit;
    ilIDCONTRATO: TInterLinkit;
    Label1: TLabel;
    edIMP_COMIS_PREM: TInterEdit;
    shpBREPARTIR: TShape;
    lblBDESBLOQUEO1: TLabel;
    shpIMP_CREDITO: TShape;
    lbNOM_ACREDITADO1: TLabel;
    shpBPRORRAT: TShape;
    lblCVE_ORIGEN1: TLabel;
    shpID_CREDITO: TShape;
    lbID_CONTRATO1: TLabel;
    shpSIT_CREDITO: TShape;
    lbID_CREDITO1: TLabel;
    shpTitulo: TShape;
    lbTitulo: TLabel;
    shpIMP_PPP_ACTUAL: TShape;
    Label5: TLabel;
    Label6: TLabel;
    shpIMP_IVA_ACTUAL: TShape;
    StrGrd1: TStringGrid;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    ImageList: TImageList;
    bbVisualiza: TBitBtn;
    edImpCreditos: TInterEdit;
    edFactor: TInterEdit;
    Label7: TLabel;
    Label8: TLabel;
    shpIMP_FUTURO: TShape;
    Label9: TLabel;
    Label10: TLabel;
    shpIMP_IVA_FUTURO: TShape;
    bbAplica: TBitBtn;
    edImpProrrateado: TInterEdit;
    edImpIvaProrrateado: TInterEdit;
    procedure FormShow(Sender : TObject); 
    procedure FormClose(Sender : TObject; var Action : TCloseAction);  
    procedure FormDestroy(Sender : TObject);  
    procedure InterForma1DespuesNuevo(Sender: TObject);  
    procedure InterForma1DespuesModificar(Sender: TObject);
    procedure btCONTRATOClick(Sender: TObject);
    procedure ilIDCONTRATOEjecuta(Sender: TObject);
    procedure StrGrd1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StrGrd1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure bbVisualizaClick(Sender: TObject);
    procedure bbAplicaClick(Sender: TObject);
    procedure iedID_CONTRATOExit(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    Objeto : TCrProrPPP;

    procedure DespliegaDatos;
    procedure ColocaDatos(peQry : TQuery);
    function  QuitaComas(PPCadena : String):String;
    function  SumImpCredito:Double;
    Procedure LimpiaControles;
    Procedure LimpiaProrrateo;
end;
 TCrProrPPP= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ID_CONTRATO            : TInterCampo;
        IMP_COMIS_PPPPRO       : TInterCampo;
        SUM_IMP_CRED           : TInterCampo;
        SUM_IMP_IVAS           : TInterCampo;
        FACTOR                 : TInterCampo;
        FACTORIVA              : TInterCampo;

        //Clases Adicionales
        ParamCre               : TParamCre;
        ContratoCre            : TCrCto;    //Contrato Crédito

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;

        function    ArmaSQL : String;
        function    StpLimpiaTablaPror : Boolean;
        function    StpAgregaElemento(pIdCredito:Integer; pImpActualPPP,  pImpProrrateo,
                             pImpIVAActual, pImpIVAProrra:Double): boolean;
        function    StpProrrateo: boolean;

      published
      end;

implementation
//Uses RepMon;

{$R *.DFM}

constructor TCrProrPPP.Create( AOwner : TComponent ); 
begin Inherited;
      ID_CONTRATO :=CreaCampo('ID_CONTRATO',ftInteger,tsNinguno,tsNinguno,False);
                ID_CONTRATO.Caption:='No. Autorización';

      IMP_COMIS_PPPPRO :=CreaCampo('IMP_COMIS_PPPPRO',ftFloat,tsNinguno,tsNinguno,False);
                IMP_COMIS_PPPPRO.Caption:='Imp Prorratear';

      SUM_IMP_CRED :=CreaCampo('SUM_IMP_CRED',ftFloat,tsNinguno,tsNinguno,False);
                SUM_IMP_CRED.Caption:='Suma Imp Créditos';

      SUM_IMP_IVAS :=CreaCampo('SUM_IMP_IVAS',ftFloat,tsNinguno,tsNinguno,False);
                SUM_IMP_IVAS.Caption:='Suma Imp IVA';

      FACTOR :=CreaCampo('FACTOR',ftFloat,tsNinguno,tsNinguno,False);
                FACTOR.Caption:='Factor';

      FACTORIVA :=CreaCampo('FACTORIVA',ftFloat,tsNinguno,tsNinguno,False);
                FACTOR.Caption:='Factor IVA';

      ContratoCre := TCrCto.Create(Self);
      ContratoCre.MasterSource:= Self;
      ContratoCre.FieldByName('ID_CONTRATO').MasterField:= 'ID_CONTRATO';
      ContratoCre.FieldByName('FOL_CONTRATO').MasterField:= 'FOL_CONTRATO';

      StpName  := ' ';
      UseQuery := False; 
      HelpFile := 'IntCrProrPPP.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TCrProrPPP.Destroy;
begin
   if ContratoCre <> nil then
      ContratoCre.Free;

   inherited;
end;


function TCrProrPPP.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrProrPPP;
begin
   W:=TWCrProrPPP.Create(Self);
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


Function TCrProrPPP.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('INinguno.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TCrProrPPP.Reporte:Boolean; 
begin //Execute_Reporte(); 
end;


(***********************************************FORMA NINGUNO********************)
(*                                                                              *)
(*  FORMA DE NINGUNO                                                            *)
(*                                                                              *)
(***********************************************FORMA NINGUNO********************)

procedure TWCrProrPPP.FormShow(Sender: TObject);
begin
  With Objeto Do
    Begin
    icpCONTRATO.Frame := ContratoCre.Contrato;
    icpCONTRATO.RefrescaInfo; //REFRESCA LA INFORMACIÓN DEL CREDITO

    lbDempresa.Caption := ParamCre.EMPRESA.AsString;
    lbDfecha.Caption   := ParamCre.FECHA.AsString;
    lbDUsuario.Caption := ParamCre.USUARIO.AsString;
    lbDPerfil.Caption  := ParamCre.PERFIL.AsString;
    

    ID_CONTRATO.Control := iedID_CONTRATO;
    ContratoCre.ID_CONTRATO.Control := iedID_CONTRATO;
    ContratoCre.CVE_PRODUCTO_CRE.Control := edCVE_PRODUCTO;
    ContratoCre.Producto.DESC_C_PRODUCTO.Control := edDESC_PRODUCTO;

    IMP_COMIS_PPPPRO.Control := edIMP_COMIS_PREM;
    IMP_COMIS_PPPPRO.AsFloat := 0;

    SUM_IMP_CRED.Control := edImpCreditos;
    SUM_IMP_CRED.AsFloat := 0;
    SUM_IMP_IVAS.AsFloat := 0;

    FACTOR.Control := edFactor;
    FACTOR.AsFloat := 0;
    FACTORIVA.AsFloat := 0;

    // Coloca el ancho de las columnas
    StrGrd1.ColWidths[C_COL_B_REPARTIR]     := shpBREPARTIR.Width - 2;
    StrGrd1.ColWidths[C_COL_B_PRORRAT]      := shpBPRORRAT.Width - 2;
    StrGrd1.ColWidths[C_COL_ID_CREDITO]     := shpID_CREDITO.Width - 2;
    StrGrd1.ColWidths[C_COL_IMP_CREDITO]    := shpIMP_CREDITO.Width - 2;
    StrGrd1.ColWidths[C_COL_SIT_CREDITO]    := shpSIT_CREDITO.Width - 2;
    StrGrd1.ColWidths[C_COL_IMP_PPP_ACTUAL] := shpIMP_PPP_ACTUAL.Width - 2;
    StrGrd1.ColWidths[C_COL_IMP_IVA_ACTUAL] := shpIMP_IVA_ACTUAL.Width - 2;
    StrGrd1.ColWidths[C_COL_IMP_PPP_FUTURO] := shpIMP_FUTURO.Width - 2;
    StrGrd1.ColWidths[C_COL_IMP_IVA_FUTURO] := shpIMP_IVA_FUTURO.Width - 2;
    end;
end;

procedure TWCrProrPPP.FormDestroy(Sender: TObject);
begin
  With Objeto Do
  Begin
    ID_CONTRATO.Control := Nil;
    ContratoCre.CVE_PRODUCTO_CRE.Control := Nil;
    ContratoCre.Producto.DESC_C_PRODUCTO.Control := Nil;

    IMP_COMIS_PPPPRO.Control := Nil;
    SUM_IMP_CRED.Control := Nil;
    FACTOR.Control := Nil;
  End;
end;

procedure TWCrProrPPP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure TWCrProrPPP.InterForma1DespuesNuevo(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

procedure TWCrProrPPP.InterForma1DespuesModificar(Sender: TObject);
begin //<<Control>>.SetFocus;
end;

//procedure TWCrProrPPP.BitBtn1Click(Sender: TObject); 
//begin // Objeto.Reporte; 
//end;


procedure TWCrProrPPP.btCONTRATOClick(Sender: TObject);
begin
if Objeto.ValidaAccesoEsp('TCRPRORPPP_AUTO',True,True) then  // JFOF 13/03/2013 FUNCION DE SEGURIDADES
  begin
     //BUSCADOR DE LA CLASE CONTRATO CREDITO
     Objeto.ContratoCre.ShowAll := True;
     if Objeto.ContratoCre.Busca then
     begin
        LimpiaControles;
        icpCONTRATO.RefrescaInfo;//Refresca la informacion del Contrato
        DespliegaDatos;
        InterForma1.NextTab(btCONTRATO);
     end;
  end;
end;

procedure TWCrProrPPP.ilIDCONTRATOEjecuta(Sender: TObject);
begin
   if Objeto.ContratoCre.FindKey([ilIDCONTRATO.Buffer,'1']) then
   begin
      LimpiaControles;
      icpCONTRATO.RefrescaInfo;
      DespliegaDatos;
      InterForma1.NextTab(iedID_CONTRATO);
   end;
end;

procedure TWCrProrPPP.DespliegaDatos;
var vlQry : TQuery;
begin
  ClearGrid(StrGrd1, 0);
  Objeto.ID_CONTRATO.GetFromControl;
  With Objeto Do
    Begin
       vlQry := GetSQLQueryNoNil(ArmaSQL, Apli.DataBaseName, Apli.SessionName, True);

    If Not Assigned(vlQry) Then
       MessageDlg('No se encontraron datos para la consulta solicitada', mtWarning, [mbOk], 0)
    Else
       ColocaDatos(vlQry);
    End;

end;

function TCrProrPPP.ArmaSQL: String;
var
  vlSQL, FechaEmpresa :String;
begin
  FechaEmpresa:= FormatDateTime('dd/mm/yyyy',Apli.DameFechaEmpresa-1); //FJR 29.01.2013 Fecha a considerar para saldo insoluto
  vlSQL := 'SELECT * '+coCRLF+
           'FROM('+coCRLF+
           '     SELECT CR.ID_CREDITO, '+coCRLF+
           '            (CASE WHEN CR.F_AUTORIZA = ' + SQLFecha(Apli.DameFechaEmpresa) +' THEN CR.IMP_CREDITO '+coCRLF+
           '                  ELSE PKGCRPPO.FUNOBTSDO(CR.ID_CREDITO, '''+ FechaEmpresa +''', ''INSOLUTO'', '''') '+coCRLF+
           '                  END) AS IMP_CREDITO, '+coCRLF+
           '      CR.SIT_CREDITO, '+coCRLF+
           '      NVL(PP.IMP_PREMIO,0) IMPPREMIO, '+coCRLF+
           '      NVL(PP.IMP_IVA_PREMIO,0) IMPIVAPREMIO '+coCRLF+
           '      FROM CR_CREDITO CR, '+coCRLF+
           '     	  (SELECT ID_CREDITO, IMP_PREMIO, IMP_IVA_PREMIO '+coCRLF+
           '               FROM CR_PPO_PREMIO '+coCRLF+
           '               WHERE ID_CREDITO IN (SELECT CR.ID_CREDITO FROM CR_CREDITO CR WHERE CR.ID_CONTRATO='+ID_CONTRATO.AsString +coCRLF+
           '                                  AND CR.SIT_CREDITO IN (''AC'', ''LQ'')) '+coCRLF+
           '               AND SIT_PPO_PREMIO = ''AC'') PP '+coCRLF+
           '      WHERE 1 = 1 '+coCRLF+
           '       AND PP.ID_CREDITO(+) = CR.ID_CREDITO '+coCRLF+
           '       AND CR.ID_CONTRATO = ' + ID_CONTRATO.AsString + coCRLF+
           '       AND CR.SIT_CREDITO IN (''AC'', ''LQ'') '+coCRLF+
           '	 ) '+coCRLF+
           'ORDER BY ID_CREDITO ';
  Result := vlSQL;
end;

procedure TWCrProrPPP.ColocaDatos(peQry: TQuery);
var
  vlnRow : Integer;
begin
  With (peQry) Do
    Try
      vlnRow := 0;
      while Not Eof do
      begin
        StrGrd1.Cells[C_COL_B_REPARTIR,     vlnRow] := CFALSO;
        StrGrd1.Cells[C_COL_B_PRORRAT,      vlnRow] := CFALSO;
        StrGrd1.Cells[C_COL_ID_CREDITO,     vlnRow] := FieldByName('ID_CREDITO').AsString;
        StrGrd1.Cells[C_COL_IMP_CREDITO,    vlnRow] := FormatFloat('####,####,####,###,##0.00',FieldByName('IMP_CREDITO').AsFloat);
        StrGrd1.Cells[C_COL_SIT_CREDITO,    vlnRow] := FieldByName('SIT_CREDITO').AsString;
        StrGrd1.Cells[C_COL_IMP_PPP_ACTUAL, vlnRow] := FormatFloat('####,####,####,###,##0.00',FieldByName('IMPPREMIO').AsFloat);
        StrGrd1.Cells[C_COL_IMP_IVA_ACTUAL, vlnRow] := FormatFloat('####,####,####,###,##0.00',FieldByName('IMPIVAPREMIO').AsFloat);
        StrGrd1.Cells[C_COL_IMP_PPP_FUTURO, vlnRow] := C_ESPACIO_EN_BLANCO;
        StrGrd1.Cells[C_COL_IMP_IVA_FUTURO, vlnRow] := C_ESPACIO_EN_BLANCO;        

        Inc(vlnRow);
        peQry.Next;
      end;
      StrGrd1.RowCount := vlnRow;
    Finally
      peQry.Free;
    End;

end;

procedure TWCrProrPPP.StrGrd1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
    Bmp : TBitmap;            // Imagen para COL_CHECK
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

     if (ACol = C_COL_SIT_CREDITO)  then
        Alineacion := taCenter;

     if (ACol = C_COL_IMP_CREDITO)
         or (ACol = C_COL_IMP_PPP_ACTUAL)
         or (ACol = C_COL_IMP_IVA_ACTUAL)or (ACol = C_COL_IMP_PPP_FUTURO)
         or (ACol = C_COL_IMP_IVA_FUTURO)  then
        Alineacion := taRightJustify;

     if (ACol = C_COL_ID_CREDITO) then
        Alineacion := taLeftJustify;

     sTexto := Cells[ACol,ARow];
     Canvas.FillRect( Rect );
     iAnchoTexto := Canvas.TextWidth( sTexto );

     case Alineacion of
       taLeftJustify:  Canvas.TextOut( Rect.Left + 5, Rect.Top + 2, sTexto );
       taCenter:       Canvas.TextOut( Rect.Left + ( ( Rect.Right - Rect.Left ) - iAnchoTexto ) div 2, Rect.Top + 2, sTexto );
       taRightJustify: Canvas.TextOut( Rect.Right - iAnchoTexto - 2, Rect.Top + 2, sTexto );
     end;

     If (ACol = C_COL_B_REPARTIR) Then
     Begin
        Bmp := TBitmap.Create;
        If (Cells[C_COL_B_REPARTIR,ARow] = CO_CHECKED) Then ImageList.GetBitmap(1,Bmp)
        Else ImageList.GetBitmap(0,Bmp);
        Canvas.Draw(Rect.Left,Rect.Top,Bmp);
        Bmp.FreeImage;
        Bmp.Free;
     End;

     If (ACol = C_COL_B_PRORRAT) Then
     Begin
        Bmp := TBitmap.Create;
        If (Cells[C_COL_B_PRORRAT,ARow] = CO_CHECKED) Then ImageList.GetBitmap(1,Bmp)
        Else ImageList.GetBitmap(0,Bmp);
        Canvas.Draw(Rect.Left,Rect.Top,Bmp);
        Bmp.FreeImage;
        Bmp.Free;
     End;

   End;
end;

procedure TWCrProrPPP.StrGrd1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
   nCol, nRow : Integer;
begin
   if bbAplica.Enabled then
   begin
     LimpiaProrrateo;
   end;

   Objeto.IMP_COMIS_PPPPRO.GetFromControl;
   StrGrd1.MouseToCell(X, Y, nCol, nRow);
   if nCol = C_COL_B_REPARTIR then
   begin
     With (StrGrd1) Do
       If (Cells[C_COL_B_REPARTIR, nRow] <>  CO_NOTCHECK) Then
       Begin
         If (Cells[C_COL_B_REPARTIR, nRow] = CO_CHECKED) Then
         begin
           Cells[C_COL_B_REPARTIR, nRow] := CO_UNCHECKED;
           Objeto.IMP_COMIS_PPPPRO.AsFloat := Objeto.IMP_COMIS_PPPPRO.AsFloat - StrToFloat(quitacomas(trim(StrGrd1.Cells[C_COL_IMP_PPP_ACTUAL, nRow])));
           Objeto.SUM_IMP_IVAS.AsFloat := Objeto.SUM_IMP_IVAS.AsFloat - StrToFloat(quitacomas(trim(StrGrd1.Cells[C_COL_IMP_IVA_ACTUAL, nRow])));
         end
         Else
         begin
           IF (StrToFloat(quitacomas(trim(StrGrd1.Cells[C_COL_IMP_PPP_ACTUAL, nRow]))) > 0) and
              (StrToFloat(quitacomas(trim(StrGrd1.Cells[C_COL_IMP_CREDITO, nRow]))) > 0)  THEN
           begin
             Cells[C_COL_B_REPARTIR, nRow] := CO_CHECKED;
             Objeto.IMP_COMIS_PPPPRO.AsFloat := Objeto.IMP_COMIS_PPPPRO.AsFloat + StrToFloat(quitacomas(trim(StrGrd1.Cells[C_COL_IMP_PPP_ACTUAL, nRow])));
             Objeto.SUM_IMP_IVAS.AsFloat := Objeto.SUM_IMP_IVAS.AsFloat + StrToFloat(quitacomas(trim(StrGrd1.Cells[C_COL_IMP_IVA_ACTUAL, nRow])));             
           end;
         end;
       End;
   end;

   if nCol = C_COL_B_PRORRAT then
   begin
     With (StrGrd1) Do
       If (Cells[C_COL_B_PRORRAT, nRow] <>  CO_NOTCHECK) Then
       Begin
         If (Cells[C_COL_B_PRORRAT, nRow] = CO_CHECKED) Then
         begin
           Cells[C_COL_B_PRORRAT, nRow] := CO_UNCHECKED;
           Objeto.SUM_IMP_CRED.AsFloat := Objeto.SUM_IMP_CRED.AsFloat - StrToFloat(quitacomas(trim(StrGrd1.Cells[C_COL_IMP_CREDITO, nRow])));
         end
         Else
         begin
           IF (StrToFloat(quitacomas(trim(StrGrd1.Cells[C_COL_IMP_CREDITO, nRow]))) > 0)  THEN
           begin
             Cells[C_COL_B_PRORRAT, nRow] := CO_CHECKED;
             Objeto.SUM_IMP_CRED.AsFloat := Objeto.SUM_IMP_CRED.AsFloat + StrToFloat(quitacomas(trim(StrGrd1.Cells[C_COL_IMP_CREDITO, nRow])));
           end;
         end;
       End;
   end;

end;

function TWCrProrPPP.QuitaComas(PPCadena: String): String;
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

function TWCrProrPPP.SumImpCredito: Double;
var
  nRow : Integer;
  TotCred : Double;
begin
  TotCred       := 0;
  SumImpCredito := 0;

  With StrGrd1 do
    for nRow := 0 to RowCount-1 do
    begin
      If (Cells[C_COL_B_PRORRAT, nRow] = CO_CHECKED) then
         TotCred := TotCred + StrToFloat(quitacomas(trim(Cells[C_COL_IMP_CREDITO, nRow])));
    end;

  SumImpCredito := TotCred;
end;


procedure TWCrProrPPP.bbVisualizaClick(Sender: TObject);
var
  nRow : Integer;
  nRowUltimo : Integer;
  vlSumaImpPPP : Double;
  vlSumaIvaPPP : Double;
  vlDif :Double;
begin
if Objeto.ValidaAccesoEsp('TCRPRORPPP_VISP',True,True) then  // JFOF 13/03/2013 FUNCION DE SEGURIDADES
  begin
    if Objeto.IMP_COMIS_PPPPRO.AsFloat > 0 then
    begin
      If Objeto.SUM_IMP_CRED.AsFloat > 0 then
      begin
         Objeto.FACTOR.AsFloat := StrToFloat(FormatFloat('#0.0000000000',Objeto.IMP_COMIS_PPPPRO.AsFloat/Objeto.SUM_IMP_CRED.AsFloat));
         Objeto.FACTORIVA.AsFloat := StrToFloat(FormatFloat('#0.0000000000',Objeto.SUM_IMP_IVAS.AsFloat/Objeto.IMP_COMIS_PPPPRO.AsFloat));
      end;

      With StrGrd1 do
        for nRow := 0 to RowCount-1 do
        begin
          If (Cells[C_COL_B_PRORRAT, nRow] = CO_CHECKED) then
          begin
               Cells[C_COL_IMP_PPP_FUTURO, nRow] := FormatFloat('####,####,####,###,##0.00', StrToFloat(quitacomas(trim(Cells[C_COL_IMP_CREDITO, nRow])))*Objeto.FACTOR.AsFloat );
               vlSumaImpPPP := vlSumaImpPPP +  StrToFloat(quitacomas(trim(Cells[C_COL_IMP_PPP_FUTURO, nRow])));

               Cells[C_COL_IMP_IVA_FUTURO, nRow] := FormatFloat('####,####,####,###,##0.00', StrToFloat(quitacomas(trim(Cells[C_COL_IMP_PPP_FUTURO, nRow])))*Objeto.FACTORIVA.AsFloat);
               vlSumaIvaPPP := vlSumaIvaPPP + StrToFloat(quitacomas(trim(Cells[C_COL_IMP_IVA_FUTURO, nRow])));
            nRowUltimo := nRow;
          end
          else
             if (Cells[C_COL_B_REPARTIR, nRow] = CO_CHECKED) then
             begin
                Cells[C_COL_IMP_PPP_FUTURO, nRow] := FormatFloat('####,####,####,###,##0.00', 0);
                Cells[C_COL_IMP_IVA_FUTURO, nRow] := FormatFloat('####,####,####,###,##0.00', 0);
             end;
        end;
      // redondea importes
      If (vlSumaImpPPP - Objeto.IMP_COMIS_PPPPRO.AsFloat <> 0 ) then
      begin
        If vlSumaImpPPP > Objeto.IMP_COMIS_PPPPRO.AsFloat then
        begin
          vlDif := vlSumaImpPPP -  Objeto.IMP_COMIS_PPPPRO.AsFloat;
          vlSumaImpPPP := vlSumaImpPPP - vlDif;
          StrGrd1.Cells[C_COL_IMP_PPP_FUTURO, nRowUltimo] := FormatFloat('####,####,####,###,##0.00', StrToFloat(quitacomas(trim(StrGrd1.Cells[C_COL_IMP_PPP_FUTURO, nRowUltimo]))) - vlDif);
        end
        else
        begin
          vlDif := Objeto.IMP_COMIS_PPPPRO.AsFloat - vlSumaImpPPP;
          vlSumaImpPPP := vlSumaImpPPP + vlDif;
          StrGrd1.Cells[C_COL_IMP_PPP_FUTURO, nRowUltimo] := FormatFloat('####,####,####,###,##0.00', StrToFloat(quitacomas(trim(StrGrd1.Cells[C_COL_IMP_PPP_FUTURO, nRowUltimo]))) + vlDif);
        end;
      end;
      If (vlSumaIvaPPP - Objeto.SUM_IMP_IVAS.AsFloat <> 0 ) then
      begin
        if vlSumaIvaPPP > Objeto.SUM_IMP_IVAS.AsFloat then
        begin
          vlDif := vlSumaIvaPPP - Objeto.SUM_IMP_IVAS.AsFloat;
          vlSumaIvaPPP := vlSumaIvaPPP - vlDif;
          StrGrd1.Cells[C_COL_IMP_IVA_FUTURO, nRowUltimo] := FormatFloat('####,####,####,###,##0.00', StrToFloat(quitacomas(trim(StrGrd1.Cells[C_COL_IMP_IVA_FUTURO, nRowUltimo]))) - vlDif);
        end
        else
        begin
          vlDif := Objeto.SUM_IMP_IVAS.AsFloat - vlSumaIvaPPP;
          vlSumaIvaPPP := vlSumaIvaPPP + vlDif;
          StrGrd1.Cells[C_COL_IMP_IVA_FUTURO, nRowUltimo] := FormatFloat('####,####,####,###,##0.00', StrToFloat(quitacomas(trim(StrGrd1.Cells[C_COL_IMP_IVA_FUTURO, nRowUltimo]))) + vlDif);
        end;
      end;

      edImpProrrateado.Text := FloattoStr(vlSumaImpPPP);
      edImpIvaProrrateado.Text := FloatToStr(vlSumaIvaPPP);

      If Objeto.FACTOR.AsFloat > 0 then
         bbAplica.Enabled := True;
    end
    else
      ShowMessage('No hay importe a Prorratear.');
  end;
end;

function TCrProrPPP.StpLimpiaTablaPror: Boolean;
var   StpLimpiaTabla : TStoredProc;
      vlResultado    : Boolean;
Begin
   vlResultado := True;
   try
     StpLimpiaTabla := TStoredProc.Create(Self);
     with StpLimpiaTabla do
     begin
        //Inicia el SPT
        StpLimpiaTabla.DatabaseName:= Apli.DatabaseName;
        StpLimpiaTabla.SessionName:= Apli.SessionName;
        StpLimpiaTabla.StoredProcName:= 'PKGCRPPO.STPLIMPIATABLAPROR';
        Params.Clear;
        Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
        Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
        Prepare;
        ExecProc;

        if (ParamByName('PSResultado').AsInteger <> 0) then
        Begin
           vlResultado := False;
           ShowMessage( IntToStr(ParamByName('psRESULTADO').AsInteger)  + ' : ' +
                        ParamByName('psTxResultado').AsString );
           GenMsg('Línea ' + IntToStr(ContratoCre.ID_CONTRATO.AsInteger) +
                  'Desc: [' + IntToStr(ParamByName('psRESULTADO').AsInteger)+'] '+
                  ParamByName('psTxResultado').AsString,Apli);
        end;
        //end if;
     end;
   finally
      StpLimpiaTabla.Free;
   end;
   StpLimpiaTablaPror := vlResultado;
end;

function TCrProrPPP.StpAgregaElemento(pIdCredito:Integer; pImpActualPPP,  pImpProrrateo,
                             pImpIVAActual, pImpIVAProrra:Double): boolean;
var   sptAgregaElem : TStoredProc;
      vlResultado   : Boolean;
Begin
   vlResultado := True;
   try
     sptAgregaElem := TStoredProc.Create(Self);
     with sptAgregaElem do
     begin
        //Inicia el SPT
        sptAgregaElem.DatabaseName:= Apli.DatabaseName;
        sptAgregaElem.SessionName:= Apli.SessionName;
        sptAgregaElem.StoredProcName:= 'PKGCRPPO.STPAGREGAELEMENTO';
        Params.Clear;
        Params.CreateParam(ftInteger,'PEIDCREDITO',ptInput);
        Params.CreateParam(ftFloat,'PEIMPACTUALPPP',ptInput);
        Params.CreateParam(ftFloat,'PEIMPPRORRATEO',ptInput);
        Params.CreateParam(ftFloat,'PEIMPIVAACTUAL',ptInput);
        Params.CreateParam(ftFloat,'PEIMPIVAPRORRA',ptInput);
        Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
        Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
        Prepare;
        ParamByName('peIdCredito').AsInteger  := pIdCredito;
        ParamByName('peImpActualPPP').AsFloat := pImpActualPPP;
        ParamByName('peImpProrrateo').AsFloat := pImpProrrateo;
        ParamByName('peImpIvaActual').AsFloat := pImpIvaActual;
        ParamByName('peImpIVAProrra').AsFloat := pImpIVAProrra;
        ExecProc;

        if (ParamByName('PSResultado').AsInteger <> 0) then
        Begin
           vlResultado := False;
           ShowMessage( IntToStr(ParamByName('psRESULTADO').AsInteger)  + ' : ' +
                        ParamByName('psTxResultado').AsString );
           GenMsg('Línea ' + IntToStr(ContratoCre.ID_CONTRATO.AsInteger) +
                  'Desc: [' + IntToStr(ParamByName('psRESULTADO').AsInteger)+'] '+
                  ParamByName('psTxResultado').AsString,Apli);
        end;
        //end if;
     end;
   finally
      sptAgregaElem.Free;
   end;
   StpAgregaElemento := vlResultado;
end;

function TCrProrPPP.StpProrrateo: boolean;
var   StpProrrateoPPP : TStoredProc;
      vlResultado   : Boolean;
Begin
   vlResultado := True;
   try
     StpProrrateoPPP := TStoredProc.Create(Self);
     with StpProrrateoPPP do
     begin
        //Inicia el SPT
        StpProrrateoPPP.DatabaseName:= Apli.DatabaseName;
        StpProrrateoPPP.SessionName:= Apli.SessionName;
        StpProrrateoPPP.StoredProcName:= 'PKGCRPPO.STPPRORRATEO';
        Params.Clear;
        Params.CreateParam(ftInteger,'PEIDCONTRATO',ptInput);
        Params.CreateParam(ftString,'PECVEUSUARIO',ptInput);
        Params.CreateParam(ftDate,'PEFPRORRATEO',ptInput);
        Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
        Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
        Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
        Prepare;
        ParamByName('peIdContrato').AsInteger  := ContratoCre.ID_CONTRATO.AsInteger;
        ParamByName('peCveUsuario').AsString := Apli.Usuario;
        ParamByName('peFProrrateo').AsDate := Apli.DameFechaEmpresa;
        ParamByName('peBCommit').AsString := 'V';
        ExecProc;

        if (ParamByName('PSResultado').AsInteger <> 0) then
        Begin
           vlResultado := False;
           ShowMessage( IntToStr(ParamByName('psRESULTADO').AsInteger)  + ' : ' +
                        ParamByName('psTxResultado').AsString );
           GenMsg('Línea ' + IntToStr(ContratoCre.ID_CONTRATO.AsInteger) +
                  'Desc: [' + IntToStr(ParamByName('psRESULTADO').AsInteger)+'] '+
                  ParamByName('psTxResultado').AsString,Apli);
        end;
        //end if;
     end;
   finally
      StpProrrateoPPP.Free;
   end;
   StpProrrateo := vlResultado;
end;


procedure TWCrProrPPP.bbAplicaClick(Sender: TObject);
var
  nRow : Integer;
  bContinua :Boolean;
  vlImpPPPFuturo : Double;
  vlImpIvaFuturo : Double;
begin
if Objeto.ValidaAccesoEsp('TCRPRORPPP_APLI',True,True) then  // JFOF 13/03/2013 FUNCION DE SEGURIDADES
  begin
    // 1o. SE LIMPIA LA TABLA TEMPORAL
    bContinua := Objeto.StpLimpiaTablaPror;
    // 2o. SE AGREGAN LOS ELEMENTOS A LA TABLA TEMPORAL
    If bContinua then
      With StrGrd1 do
        for nRow := 0 to RowCount-1 do
        begin
          If (Cells[C_COL_B_PRORRAT, nRow] = CO_CHECKED) and (bContinua) then
          begin
            if (StrToFloat(quitacomas(trim(Cells[C_COL_IMP_PPP_ACTUAL, nRow]))) <> 0) and (Cells[C_COL_B_REPARTIR, nRow] = CO_UNCHECKED) then
            begin
              vlImpPPPFuturo := StrToFloat(quitacomas(trim(Cells[C_COL_IMP_PPP_ACTUAL, nRow]))) + StrToFloat(quitacomas(trim(Cells[C_COL_IMP_PPP_FUTURO, nRow])));
              vlImpIvaFuturo := StrToFloat(quitacomas(trim(Cells[C_COL_IMP_IVA_ACTUAL, nRow]))) + StrToFloat(quitacomas(trim(Cells[C_COL_IMP_IVA_FUTURO, nRow])));
            end
            else
            begin
              vlImpPPPFuturo := StrToFloat(quitacomas(trim(Cells[C_COL_IMP_PPP_FUTURO, nRow])));
              vlImpIvaFuturo := StrToFloat(quitacomas(trim(Cells[C_COL_IMP_IVA_FUTURO, nRow])));
            end;

            bContinua := Objeto.StpAgregaElemento(StrToInt(trim(Cells[C_COL_ID_CREDITO, nRow])),
                                      StrToFloat(quitacomas(trim(Cells[C_COL_IMP_PPP_ACTUAL, nRow]))),
                                      vlImpPPPFuturo,
                                      StrToFloat(quitacomas(trim(Cells[C_COL_IMP_IVA_ACTUAL, nRow]))),
                                      vlImpIvaFuturo
                                      );
          end
          else
          begin
            If (Cells[C_COL_B_REPARTIR, nRow] = CO_CHECKED) AND (Cells[C_COL_B_PRORRAT, nRow] = CO_UNCHECKED) AND (bContinua) then
            begin
              vlImpPPPFuturo := 0;
              vlImpIvaFuturo := 0;
              bContinua := Objeto.StpAgregaElemento(StrToInt(trim(Cells[C_COL_ID_CREDITO, nRow])),
                                      StrToFloat(quitacomas(trim(Cells[C_COL_IMP_PPP_ACTUAL, nRow]))),
                                      vlImpPPPFuturo,
                                      StrToFloat(quitacomas(trim(Cells[C_COL_IMP_IVA_ACTUAL, nRow]))),
                                      vlImpIvaFuturo
                                      );
            end;
          end;
        end;

    // 3o. SE INSERTAN LAS TRANSACCIONES
    If bContinua then
    Begin
      If not Objeto.StpProrrateo then
        ShowMessage ('No se pudo realizar el prorrateo')
      Else
      begin
        LimpiaControles;
        DespliegaDatos;
      end;
    End;
  end;
end;

procedure TWCrProrPPP.LimpiaControles;
begin
  Objeto.IMP_COMIS_PPPPRO.AsFloat := 0;
  Objeto.SUM_IMP_CRED.AsFloat     := 0;
  Objeto.SUM_IMP_IVAS.AsFloat     := 0;
  Objeto.FACTOR.AsFloat           := 0;
  Objeto.FACTORIVA.AsFloat        := 0;
  edImpProrrateado.Text           := '0';
  edImpIvaProrrateado.Text        := '0';
  bbAplica.Enabled := False;
end;

procedure TWCrProrPPP.LimpiaProrrateo;
var
  nRow : Integer;
begin
  if bbAplica.Enabled then
  begin
    With StrGrd1 do
      for nRow := 0 to RowCount-1 do
      begin
        Cells[C_COL_IMP_PPP_FUTURO, nRow] := '';
        Cells[C_COL_IMP_IVA_FUTURO, nRow] := '';
      end;
    edImpProrrateado.Text    := '0';
    edImpIvaProrrateado.Text := '0';
    bbAplica.Enabled         := False;
  end;
end;

procedure TWCrProrPPP.iedID_CONTRATOExit(Sender: TObject);
begin
  InterForma1.ValidaExit(iedID_CONTRATO,True,'',True);
end;

end.


