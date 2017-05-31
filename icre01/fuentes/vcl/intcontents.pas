{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
// Sistema         : Clase de CONTENTS
// Fecha de Inicio : 12/06/2003
// Función forma   : Clase de CONTENTS
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntContents;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, IntLinkit, Tabs,

IntGenCre,     // Funciones Genéricas
IntPers,       // Clase de Persona
IntCtoHeader,  // Contrato Header
IntCrCredito,  // Clase de la Disposición
IntCrCto,      // Clase de la Línea
IntCrAcredit,  // Clase del Acreditado
IntCrProduct,  // Clase del Producto
IntParamCre,   // Clase de Parametros
IntCrDocto,    // Clase de Documentos
IntCrCesion,   // Clase de Cesion
IntCrConsult,  // Clase de Consulta
IntCrGaFeApl   // Consulta de Garantía FEGA
;

CONST
      CLEVEL_ACREDITADO = 0;
      CLEVEL_PRODUCTO   = 1;
      CLEVEL_CONTRATO   = 3;
      CLEVEL_CREDITO    = 4;
      CLEVEL_DOCUMENTO  = 5;
      C_FILEINTERACCIONES = 'O:\Delphide\ICre01\Bmp\Interacciones.bmp';
      C_FILTER : Array[0..4] of String = (' ',CSIT_AC,CSIT_NA,CSIT_LQ,CSIT_CA);

Type  TValorModificado = (tpID_PERSONA, tpID_CONTRATO, tpID_CREDITO, tpNONE);

Type PData = ^Data;
     Data = record
     nId_Titular,
     nId_Contrato,
     nFol_Contrato,
     nId_Credito : Integer;
     strCve_Producto,
     strId_Documento,
     strSit_Contrato,
     strSit_Credito,
     strSit_Documento : String;
     eImp_Credito,
     eSdo_Insoluto,
     eSdo_Vigente,
     eFin_Adicional : Extended;
     end;

Type
 TContents= class;

  TWContents=Class(TForm)
    InterForma1             : TInterForma;
    pnlTop: TPanel;
    edID_PERSONA: TEdit;
    edID_CONTRATO: TEdit;
    edID_CREDITO: TEdit;
    ilID_PERSONA: TInterLinkit;
    ilID_CONTRATO: TInterLinkit;
    ilID_CREDITO: TInterLinkit;
    btnID_PERSONA: TBitBtn;
    btnId_Contrato: TBitBtn;
    edNOMBRE: TEdit;
    edDESC_CONTRATO: TEdit;
    edDesc_Credito: TEdit;
    btnID_CREDITO: TBitBtn;
    PnlRight: TPanel;
    lstbxOptions: TListBox;
    pnlLeft: TPanel;
    TrVwData: TTreeView;
    tbstSituacion: TTabSet;
    Edit1: TEdit;
    lblImpCredito: TLabel;
    lblSdo_Insoluto: TLabel;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    Pnl: TPanel;
    btnRefresh: TBitBtn;
    btnAcreditadp: TButton;
    btnContrato: TButton;
    bntCredito: TButton;
    lblTot_Imp_Credito: TLabel;
    lblTotSdo_Insoluto: TLabel;
    shpLiquidados: TShape;
    lblLiquidados: TLabel;
    lblActivos: TLabel;
    shpActivos: TShape;
    lblNoAutorizados: TLabel;
    shpNoAutorizados: TShape;
    lblCancelados: TLabel;
    shpCancelados: TShape;
    Edit2: TEdit;
    Edit3: TEdit;
    ImgInteracciones: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    lblTotFin_Adicional: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure ilID_PERSONACapture(Sender: TObject; var Show: Boolean);
    procedure ilID_PERSONAEjecuta(Sender: TObject);
    procedure btnID_PERSONAClick(Sender: TObject);
    procedure btnId_ContratoClick(Sender: TObject);
    procedure ilID_CONTRATOEjecuta(Sender: TObject);
    procedure TrVwDataCustomDrawItem(Sender: TCustomTreeView;
      Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lstbxOptionsDblClick(Sender: TObject);
    procedure tbstSituacionChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure edID_PERSONAEnter(Sender: TObject);
    procedure edID_CONTRATOEnter(Sender: TObject);
    procedure edID_CREDITOEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TrVwDataChange(Sender: TObject; Node: TTreeNode);
    procedure btnID_CREDITOClick(Sender: TObject);
    procedure ilID_CREDITOEjecuta(Sender: TObject);
    procedure lstbxOptionsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnRefreshClick(Sender: TObject);
    procedure TrVwDataKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAcreditadpClick(Sender: TObject);
    procedure btnContratoClick(Sender: TObject);
    procedure bntCreditoClick(Sender: TObject);
    procedure InterForma1DespuesShow(Sender: TObject);
    private
    { Private declarations }
     m_ValorModificado : TValorModificado;
     function Get_Situacion : String;
     procedure Set_Situacion(strValue : String);
    public
    { Public declarations }
     Objeto : TContents;

     procedure Agrega_Opciones_a_LstBox;
     procedure MuestraDatos(strSituacion : String);
     procedure MuestraAcreditado(nId_Titular : Integer);
     procedure MuestraProducto(strCve_Producto_Cre : String);
     procedure MuestraContrato(nId_Contrato, nFolContrato : Integer);
     procedure MuestraCredito(nId_Credito : Integer);
     procedure MuestraPeriodosCapital(nId_Credito : Integer);
     procedure MuestraPeriodosInteres(nId_Credito : Integer);
     procedure MuestraPeriodosComsion(nId_Credito : Integer);
     procedure MuestraPeriodosFinAdic(nId_Credito : Integer);
     procedure MuestraConsultaFEGA(nId_Credito : Integer);
     procedure MuestraCesion(nId_Cesion : Integer);
     procedure MuestraDocumentosCesion(nId_Cesion : Integer);
     procedure MuestraDetalleDocumento(nId_Cesion : Integer; strId_Documento : String);
     procedure LimpiaDatos(Edit1 : TEdit; Edit2 : TEdit);

     procedure DrawButton(ARect: TRect; Node: TTreeNode; nButtonSize : Integer);
     procedure SelectOption;
    published
     property Situacion : String Read Get_Situacion Write Set_Situacion;
     property ValorModificado : TValorModificado Read m_ValorModificado Write m_ValorModificado;
    end;
 TContents= class(TInterFrame)
      private
        { Private declarations }
      public
        { Public declarations }
        Acreditado : TCrAcredit;
        Contrato   : TCtrlCto;
        Credito    : TCrCredito;
        ParamCre   : TParamCre;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

implementation
//Uses RepMon;

{$R *.DFM}


constructor TContents.Create( AOwner : TComponent );
begin Inherited;
      Acreditado := TCrAcredit.Create(Self);
      Acreditado.MasterSource := Self;
      Acreditado.ID_ACREDITADO.MasterField := 'ID_ACREDITADO';

      Contrato := TCtrlCto.Create(Self);
      Contrato.MasterSource := Self;
      Contrato.ID_CONTRATO.MasterField := 'ID_CONTRATO';

      Credito  := TCrCredito.Create(Self);
      Credito.MasterSource := Self;
      Credito.ID_CREDITO.MasterField := 'ID_CREDITO';

      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntContents.Hlp';
      ShowMenuReporte:=True;
end;

Destructor TContents.Destroy;
begin inherited;
end;


function TContents.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWContents;
begin
   W:=TWContents.Create(Self);
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


Function TContents.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False; 
      T := CreaBuscador('IContent.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end; 
end;

function TContents.Reporte:Boolean; 
begin Result := False; 
end;


(***********************************************FORMA CONTENTS********************)
(*                                                                              *)
(*  FORMA DE CONTENTS                                                            *)
(*                                                                              *)
(***********************************************FORMA CONTENTS********************)

procedure TWContents.Agrega_Opciones_a_LstBox;
begin
 With lstbxOptions Do
  Begin
   Items.Clear;
   Items.Add('');
   Case TrVwData.Selected.Level Of
    CLEVEL_PRODUCTO   : Begin
                        Items.Add('- Detalle del Producto');
                        End;

    CLEVEL_ACREDITADO : Begin
                        Items.Add('- Detalle del Acreditado');
                        End;

    CLEVEL_CONTRATO   : Begin
                        Items.Add('- Detalle de la Autorización');
                        End;

    CLEVEL_CREDITO    : Begin
                        If (Trim(PData(TrVwData.Selected.Data).strId_Documento) = '') Then
                         Begin
                         Items.Add('- Detalle de la Disposición');
                         Items.Add('- Periodos de Capital');
                         Items.Add('- Periodos de Interés');
                         Items.Add('- Periodos de Comisión');
                         Items.Add('- Periodos de Finan. Adic.');
                         Items.Add('- Consulta FEGA');
                         End
                        Else
                         Begin
                         Items.Add('- Detalle de la Cesión');
                         Items.Add('- Detalle de la Disposición');
                         Items.Add('- Documentos de Cesión');
                         End;
                        End;

    CLEVEL_DOCUMENTO :  Begin
                          Items.Add('- Detalle del Documento');
                        End;
   End;
  End;
end;

procedure TWContents.FormShow(Sender: TObject);
begin
 With Objeto Do
  Begin
  lbDempresa.Caption := ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := ParamCre.FECHA.AsString;
  lbDUsuario.Caption := ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

  Acreditado.ID_ACREDITADO.Control := edID_PERSONA;
  Acreditado.PERSONA.NOMBRE.Control := edNOMBRE;

  Contrato.ID_CONTRATO.Control := edID_CONTRATO;
  Contrato.TITNOMBRE.Control := edDESC_CONTRATO;

  Credito.ID_CREDITO.Control := edID_CREDITO;

  If FileExists(C_FILEINTERACCIONES) Then
   ImgInteracciones.Picture.LoadFromFile(C_FILEINTERACCIONES);
  End;
end;

procedure TWContents.FormDestroy(Sender: TObject);
var I : Integer;
    Nodo : TTreeNode;
begin
 With Objeto Do
  Begin
  Acreditado.ID_ACREDITADO.Control := Nil;
  Acreditado.PERSONA.NOMBRE.Control := Nil;

  Contrato.ID_CONTRATO.Control := Nil;
  Contrato.TITNOMBRE.Control := Nil;

  Credito.ID_CREDITO.Control := Nil;
  End;

 With TrVwData Do
  For I := 0 To Items.Count - 1 Do
   Begin
   Nodo := Items[0];
   If Assigned(Nodo) Then
    If Nodo.Data <> Nil Then
     Dispose(Nodo.Data);
   End;
end;

function TWContents.Get_Situacion : String;
begin
 Result := C_FILTER[tbstSituacion.TabIndex];
end;

procedure TWContents.Set_Situacion(strValue : String);
var I : Integer;
begin
 For I := 0 To High(C_FILTER) Do
  If (strValue = C_FILTER[I])Then
   Begin
   tbstSituacion.TabIndex := I;
   Break;
   End;
end;

procedure TWContents.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

procedure TWContents.ilID_PERSONACapture(Sender: TObject;
  var Show: Boolean);
begin
 Show := True;
end;

procedure TWContents.ilID_PERSONAEjecuta(Sender: TObject);
begin
 ValorModificado := tpNone;
 If Objeto.Acreditado.FindKey([ILID_PERSONA.Buffer]) Then
  ValorModificado := tpID_PERSONA;
 MuestraDatos(Situacion);
end;

procedure TWContents.btnID_PERSONAClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCONTENTS_ACRED',True,True) then
   begin
     If Objeto.Acreditado.Busca Then
      Begin
      ValorModificado := tpID_PERSONA;
      LimpiaDatos(edID_PERSONA, edNOMBRE);
      MuestraDatos(Situacion);
      End;
   end;
end;

procedure TWContents.btnId_ContratoClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCONTENTS_AUTORI',True,True) then
   begin
     If Objeto.Contrato.Busca Then
      Begin
      ValorModificado := tpID_CONTRATO;
      LimpiaDatos(edID_CONTRATO, edDESC_CONTRATO);
      MuestraDatos(Situacion);
      End;
   end;      
end;

procedure TWContents.btnID_CREDITOClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCONTENTS_DISP',True,True) then
   begin
     ValorModificado := tpNONE;
     With Objeto Do
      If Credito.Busca Then
        Begin
        ValorModificado := tpID_CREDITO;
        LimpiaDatos(edID_CREDITO, edDesc_Credito);
        edDesc_Credito.Text := Obten_NombreAcreditado(Credito.ID_CREDITO.AsInteger,Apli);
        If (Situacion <> Credito.SIT_CREDITO.AsString) Then
         // Cuando se cambia la situación se muestrand los datos en automático ver "tbstSituacionChange"
         Situacion := Credito.SIT_CREDITO.AsString
        Else
         MuestraDatos(Situacion);
        End;
   end;     
end;

procedure TWContents.ilID_CONTRATOEjecuta(Sender: TObject);
begin
 ValorModificado := tpNone;
 If Objeto.Contrato.FindKey([ilID_CONTRATO.Buffer]) Then
  ValorModificado := tpID_CONTRATO;
 MuestraDatos(Situacion);
end;

procedure TWContents.DrawButton(ARect: TRect; Node: TTreeNode; nButtonSize : Integer);
var
  cx, cy : Integer;
begin
  cx := ARect.Left + TrVwData.Indent div 2;
  cy := ARect.Top + (ARect.Bottom - ARect.Top) div 2;
  with TrVwData.Canvas do
  begin
    //dibuja la línea horizontal
    Pen.Color := clLtGray;
    if Node.HasChildren then
    begin
      PenPos := Point(cx+nButtonSize, cy);
      LineTo(ARect.Left + TrVwData.Indent + nButtonSize, cy);
    end else
    begin
      PenPos := Point(cx, cy);
      LineTo(ARect.Left + TrVwData.Indent + nButtonSize, cy);
    end;

    //dibuja la mitad de la línea vertical, de la parte de arriba
    PenPos := Point(cx, cy);
    LineTo(cx, ARect.Top-1);

    if ((Node.GetNextVisible <> nil) and (Node.GetNextVisible.Level = Node.Level))
    or (Node.GetNextSibling <> nil) then
    //dibuja la porción media de la línea vertical
    begin
      PenPos := Point(cx, cy);
      LineTo(cx, ARect.Bottom+1);
    end;  

    if Node.HasChildren then
    begin
      Brush.Style := bsSolid;
      Brush.Color := clWindow;
      Pen.Color := clBlack;
      Rectangle(cx-nButtonSize, cy-nButtonSize, cx+nButtonSize+1, cy+nButtonSize+1);

      //Dibuja el indicador Horizontal
      PenPos := Point(cx-nButtonSize+2, cy);
      LineTo(cx+nButtonSize-1, cy);
      //Dibuja el indicador vertical usando el nodo que esta contraido 
      if not Node.Expanded then
      begin
        PenPos := Point(cx, cy-nButtonSize+2);
        LineTo(cx, cy+nButtonSize-1);
      end;
    end;
        //Ahora  conecta las lineas verticales con los nodos Superiores
    Node := Node.Parent;
    While Node <> nil do
    Begin
      cx := cx - TrVwData.Indent;
      If Node.GetNextSibling <> Nil Then
      Begin
       PenPos := Point(cx, ARect.Top);
       LineTo(cx, ARect.Bottom);
      End;
      Node := Node.Parent;
    End;
  End;
end;

procedure TWContents.LimpiaDatos(Edit1 : TEdit; Edit2 : TEdit);
begin
  If (edID_PERSONA <> Edit1)    Then edID_PERSONA.Text := '';
  If (edID_CONTRATO <> Edit1)   Then edID_CONTRATO.Text := '';
  If (edID_CREDITO <> Edit1)    Then edID_CREDITO.Text := '';

  If (edNOMBRE <> Edit2)        Then edNOMBRE.Text := '';
  If (edDESC_CONTRATO <> Edit2) Then edDESC_CONTRATO.Text := '';
  If (edDesc_Credito <> Edit2)  Then edDesc_Credito.Text := '';
end;


procedure TWContents.TrVwDataCustomDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
 const LIGHT_YELLOW = $00CCFFFF;
       DARK_GREEN = clGreen; //$00004000;

 var R, NodeRect : TRect;
     str, strSituacion : String;
     nButtonSize : Integer;
     P : PData;
begin
 nButtonSize := 4;
 With TrVwData.Canvas Do
  Begin
  DefaultDraw := False;
  NodeRect := Node.DisplayRect(False);

  If (Node = TrVwData.Selected) Then
   Begin
   Brush.Color := clDkGray;
   Font.Color := clWhite;
   End;

  If (cdsSelected In State) Then
   Begin
   Brush.Color := clNavy;
   Font.Color := clWhite;
   End;

  NodeRect.Left := NodeRect.Left + (Node.Level * TrVwData.Indent);
  DrawButton(NodeRect, Node, nButtonSize);
  NodeRect.Left := NodeRect.Left + TrVwData.Indent + nButtonSize;

  If (Node.Level = 0) Then Font.Style := [fsBold]
  Else If (Node.Data <> Nil) Then
   Begin
   strSituacion := PData(Node.Data)^.strSit_Credito;
   If (strSituacion = CSIT_AC) Then Font.Color := shpActivos.Brush.Color;
   If (strSituacion = CSIT_NA) Then Font.Color := shpNoAutorizados.Brush.Color;
   If (strSituacion = CSIT_LQ) Then Font.Color := shpLiquidados.Brush.Color;
   If (strSituacion = CSIT_CA) Then Font.Color := shpCancelados.Brush.Color;
   If (Node = TrVwData.Selected) Then Font.Color := clWhite;
   End;

  Brush.Color := clWhite;
  FillRect(Rect(NodeRect.Left,NodeRect.Top,Width,NodeRect.Bottom));

  TextOut(NodeRect.Left, NodeRect.Top, Node.Text);
  If (Node.Level = CLEVEL_CREDITO) And (Node.Data <> Nil) Then
   Begin
   P := Node.Data;

   str := Format(CFORMAT_DINERO,[P.eImp_Credito]);
   R := Rect(TrVwData.Width - 350, NodeRect.Top, TrVwData.Width - 250,NodeRect.Bottom);
   FillRect(R); TextOut(R.Right - TextWidth(str), NodeRect.Top, str);

   str := Format(CFORMAT_DINERO,[P.eSdo_Insoluto]);
   R := Rect(TrVwData.Width - 250, NodeRect.Top, TrVwData.Width - 150,NodeRect.Bottom);
   FillRect(R); TextOut(R.Right - TextWidth(str), NodeRect.Top, str);

   str := Format(CFORMAT_DINERO,[P.eFin_Adicional]);
   R := Rect(TrVwData.Width - 150, NodeRect.Top, TrVwData.Width - 50,NodeRect.Bottom);
   FillRect(R); TextOut(R.Right - TextWidth(str), NodeRect.Top, str);   
   End;
  End;
end;

procedure TWContents.MuestraDatos(strSituacion : String);

 function Get_TitularByCredito(nId_Credito : Integer) : Integer;
 var QryTmp : TQuery;
 begin
  Result := 0;
  QryTmp := TQuery.Create(Self);
  If Assigned(QryTmp) Then
   With QryTmp Do
    Try
     SessionName := Objeto.SessionName;
     DataBaseName := Objeto.DataBaseName;
     SQL.Clear;
     SQL.Add(
             ' SELECT CTO.ID_TITULAR'#13#10+
             ' FROM  CR_CREDITO CC,'#13#10+
             '       CR_CONTRATO CO,'#13#10+
             '       CONTRATO CTO'#13#10+
             ' WHERE CC.ID_CREDITO = '+IntToStr(nId_Credito)+#13#10+
             '   AND CO.ID_CONTRATO = CC.ID_CONTRATO'#13#10+
             '   AND CTO.ID_CONTRATO = CO.ID_CONTRATO'#13#10
            );
     Open;
     Result := FieldByName('ID_TITULAR').AsInteger;
    Finally
     Close; Free;
    End;
 end;

 function Get_TitularByContrato(nId_Contrato : Integer) : Integer;
 var QryTmp : TQuery;
 begin
  Result := 0;
  QryTmp := TQuery.Create(Self);
  If Assigned(QryTmp) Then
   With QryTmp Do
    Try
     SessionName := Objeto.SessionName;
     DataBaseName := Objeto.DataBaseName;
     SQL.Clear;
     SQL.Add(
            'SELECT ID_TITULAR'#13#10+
            'FROM CONTRATO'#13#10+
            'WHERE ID_CONTRATO = '+IntToStr(nId_Contrato)+#13#10
            );
     Open;
     Result := FieldByName('ID_TITULAR').AsInteger;
    Finally
     Close; Free;
    End;
 end;

 procedure Limpia_Arbol;
 begin
   { Limpia los Datos }
   TrVwData.Items.Clear;
   lblTot_Imp_Credito.Caption := '';
   lblTotSdo_Insoluto.Caption := '';
 end;

var Qry : TQuery;
    strTitulo, strTopicCve_Producto : String;
    I, nId_Titular : Integer;
    Nodo_Raiz, Nodo_Producto, Nodo_Moneda, Nodo_Contrato, Nodo_Credito : TTreeNode;
    nTopicCve_Moneda, nTopicId_Contrato, nTopicId_Credito : Integer;
    eImp_Credito, eImpSdo_Insoluto, eImpFin_Adicional : Extended;
    T, C, P, D, PR : PData;
begin
 { Obtiene El Titular dependiendo de que dato lleno el Usuario }
 nId_Titular := 0;
 Case ValorModificado Of
   tpID_PERSONA  : Begin
                   If IsInteger(edID_PERSONA.Text) Then
                    Begin
                    nId_Titular        := StrToInt(edID_PERSONA.Text);
                    edID_CONTRATO.Text := ''; edDESC_CONTRATO.Text := '';
                    edID_CREDITO.Text  := '';  edDESC_CREDITO.Text := '';
                    End;
                   End;
   tpID_CONTRATO : Begin
                   If IsInteger(edID_CONTRATO.Text) Then
                    Begin
                    edID_PERSONA.Text  := '';  edNOMBRE.Text       := '';
                    nId_Titular        := Get_TitularByContrato(StrToInt(edID_CONTRATO.Text));
                    edID_CREDITO.Text  := '';  edDESC_CREDITO.Text := '';
                    End;
                   End;
   tpID_CREDITO  : Begin
                   If IsInteger(edID_CREDITO.Text) Then
                    Begin
                    edID_PERSONA.Text  := '';  edNOMBRE.Text       := '';
                    edID_CONTRATO.Text := ''; edDESC_CONTRATO.Text := '';
                    nId_Titular := Get_TitularByCredito(StrToInt(edID_CREDITO.Text));
                    End;
                   End;
    tpNONE       : Begin
                    edID_PERSONA.Text  := '';  edNOMBRE.Text       := '';
                    edID_CONTRATO.Text := ''; edDESC_CONTRATO.Text := '';
                    edID_CREDITO.Text  := '';  edDESC_CREDITO.Text := '';
                    Limpia_Arbol;
                    Exit;
                   End;
 End;
 If (nId_Titular = 0) Then Exit;

 Limpia_Arbol;

 { Inicia el Query para mostrar los Datos... }
 Qry := TQuery.Create(Self);
 If Assigned(Qry) Then
  With (Qry) Do
   Try
   SessionName := Objeto.SessionName;
   DataBaseName := Objeto.DataBaseName;
   SQL.Clear;
   SQL.Add(
           ' SELECT'#13#10+
           ' P.ID_PERSONA,'#13#10+
           ' (PF.APELLIDO_PATERNO || '' '' || PF.APELLIDO_MATERNO || '' '' || PF.NOMBRE_PERSONA || PM.NOM_RAZON_SOCIAL) AS NOMBRE,'#13#10+
           ' CTO.ID_CONTRATO,'#13#10+
           ' CO.FOL_CONTRATO,'#13#10+
           ' CP.DESC_C_PRODUCTO,'#13#10+
           ' CO.CVE_PRODUCTO_CRE,'#13#10+
           ' CTO.CVE_MONEDA,'#13#10+
           ' CTO.SIT_CONTRATO,'#13#10+
           ' CC.ID_CREDITO,'#13#10+
           ' CTO.ID_TITULAR,'#13#10+
           ' CC.SIT_CREDITO,'#13#10+
           ' CC.IMP_CREDITO,'#13#10+
           ' CC.SDO_INSOLUTO,'#13#10+
           ' CC.SDO_FINAN_ADIC,'#13#10+
           ' CC.SDO_VIG_TOTAL,'#13#10+
           ' CD.ID_DOCUMENTO,'#13#10+
           ' CD.SIT_DOCUMENTO,'#13#10+
           ' NVL(MO.DESC_MONEDA,''Falta Moneda'') AS DESC_MONEDA'#13#10+
           'FROM'#13#10+
           '  PERSONA P,'#13#10+
           '  PERSONA_MORAL PM,'#13#10+
           '  PERSONA_FISICA PF,'#13#10+
           '  CONTRATO CTO,'#13#10+
           '  CR_CONTRATO CO,'#13#10+
           '  CR_CREDITO CC,'#13#10+
           '  CR_DOCUMENTO CD,'#13#10+
           '  CR_PRODUCTO CP,'#13#10+
           '  MONEDA MO'#13#10+
           'WHERE 1 = 1');

   If (Trim(strSituacion) <> '') Then
    SQL.Add(' AND CC.SIT_CREDITO = '#39+strSituacion+#39);

   Case ValorModificado Of
    tpID_CREDITO  : SQL.Add('AND CC.ID_CREDITO = '+edId_Credito.Text);
    tpID_CONTRATO : SQL.Add('AND CTO.ID_CONTRATO = '+edId_Contrato.Text);
   End;

   SQL.Add('  AND P.ID_PERSONA = '+IntToStr(nId_Titular)+#13#10+
           '  AND PF.ID_PERSONA (+)= P.ID_PERSONA'#13#10+
           '  AND PM.ID_PERSONA (+)= P.ID_PERSONA'#13#10+
           '  AND CTO.ID_TITULAR = P.ID_PERSONA'#13#10+
           '  AND CO.SIT_LINEA = '#39'AU'#39+
           '  AND CO.ID_CONTRATO (+)= CTO.ID_CONTRATO'#13#10+
           '  AND CC.ID_CONTRATO (+)= CO.ID_CONTRATO'#13#10+
           '  AND MO.CVE_MONEDA (+)= CTO.CVE_MONEDA'#13#10+
           '  AND CD.ID_CESION (+)= CC.ID_CREDITO'#13#10+
           '  AND CP.CVE_PRODUCTO_CRE = CO.CVE_PRODUCTO_CRE'#13#10+
           '  ORDER BY CO.CVE_PRODUCTO_CRE, CC.ID_CONTRATO, CTO.CVE_MONEDA, CC.ID_CREDITO, ID_DOCUMENTO'#13#10);

   Edit1.Text := SQL.Text;

   Open;

   If Qry.RecordCount = 0 Then
    Begin
    TrVwData.Items.AddFirst(Nil,CERROR_NOEXISTEN);
    Exit;
    End;

   eImp_Credito := 0; eImpSdo_Insoluto := 0; eImpFin_Adicional := 0;
   Nodo_Moneda := Nil; Nodo_Contrato := Nil; Nodo_Credito := Nil;
   strTopicCve_Producto := ''; nTopicCve_Moneda := 0;
   nTopicId_Contrato := 0; nTopicId_Credito := 0;

   New(T);
   T^.nId_Titular := FieldByName('ID_TITULAR').AsInteger;
   Nodo_Raiz := TrVwData.Items.AddObjectFirst(Nil,'Cliente '+FieldByName('ID_PERSONA').AsString+#32+FieldByName('NOMBRE').AsString,T);

   While Not Eof dO
    Begin
     If (strTopicCve_Producto <> FieldByName('CVE_PRODUCTO_CRE').AsString) Then
      Begin
      strTopicCve_Producto := FieldByName('CVE_PRODUCTO_CRE').AsString;
      New(PR);
      PR^.strCve_Producto := FieldByName('CVE_PRODUCTO_CRE').AsString;
      Nodo_Producto := TrVwData.Items.AddChildObject(Nodo_Raiz,'Producto '+FieldByName('DESC_C_PRODUCTO').AsString,PR);

      nTopicCve_Moneda := 0;
      nTopicId_Contrato := 0;
      nTopicId_Credito := 0;
      End;

     If (nTopicCve_Moneda <> FieldByName('CVE_MONEDA').AsInteger) Then
      Begin
      nTopicCve_Moneda := FieldByName('CVE_MONEDA').AsInteger;
      Nodo_Moneda := TrVwData.Items.AddChild(Nodo_Producto,FieldByName('DESC_MONEDA').AsString);

      nTopicId_Contrato := 0;
      nTopicId_Credito := 0;
      End;

     If (nTopicId_Contrato <> FieldByName('ID_CONTRATO').AsInteger) Then
      Begin
      New(C);
      C^.nId_Titular := FieldByName('ID_CONTRATO').AsInteger;
      C^.nId_Contrato :=  FieldByName('ID_CONTRATO').AsInteger;
      C^.nFol_Contrato := FieldByName('FOL_CONTRATO').AsInteger;

      nTopicId_Contrato := FieldByName('ID_CONTRATO').AsInteger;
      Nodo_Contrato := TrVwData.Items.AddChildObject(Nodo_Moneda,
                                                     IntToStr(nTopicId_Contrato)+#32+FieldByName('NOMBRE').AsString,C);

      nTopicId_Credito := 0;
      End;

     // Si tiene Crédito (Disposición) Entonces...
     If (FieldByName('ID_CREDITO').AsInteger > 0) And (nTopicId_Credito <> FieldByName('ID_CREDITO').AsInteger) Then
      Begin
      New(P);
      P^.nId_Credito     := FieldByName('ID_CREDITO').AsInteger;
      P^.strId_Documento := FieldByName('ID_DOCUMENTO').AsString;
      P^.nId_Contrato    := FieldByName('ID_CONTRATO').AsInteger;
      P^.nId_Titular     := FieldByName('ID_TITULAR').AsInteger;
      P^.strSit_Contrato := FieldByName('SIT_CONTRATO').AsString;
      P^.strSit_Credito  := FieldByName('SIT_CREDITO').AsString;
      P^.eImp_Credito    := FieldByName('IMP_CREDITO').AsFloat;
      P^.eSdo_Insoluto   := FieldByName('SDO_INSOLUTO').AsFloat;
      P^.eSdo_Vigente    := FieldByName('SDO_VIG_TOTAL').AsFloat;
      P^.eFin_Adicional  := FieldByName('SDO_FINAN_ADIC').AsFloat;

      eImp_Credito     := eImp_Credito + FieldByName('IMP_CREDITO').AsFloat;
      eImpSdo_Insoluto := eImpSdo_Insoluto + FieldByName('SDO_INSOLUTO').AsFloat;
      eImpFin_Adicional  :=  eImpFin_Adicional + FieldByName('SDO_FINAN_ADIC').AsFloat;

      nTopicId_Credito := FieldByName('ID_CREDITO').AsInteger;

      If (Trim(FieldByName('ID_DOCUMENTO').AsString) <> '') Then strTitulo := 'Cesión '
      Else strTitulo := 'Disposición ';

      Nodo_Credito := TrVwData.Items.AddChildObject(Nodo_Contrato,strTitulo+IntToStr(FieldByName('ID_CREDITO').AsInteger),P);
      End;

     // Si tiene Documento Entonces...
     If (Trim(FieldByName('ID_DOCUMENTO').AsString) <> '') Then
      Begin
      New(D);
      D^.nId_Credito      := FieldByName('ID_CREDITO').AsInteger;
      D^.nId_Contrato     := FieldByName('ID_CONTRATO').AsInteger;
      D^.nId_Titular      := FieldByName('ID_TITULAR').AsInteger;
      D^.strId_Documento  := FieldByName('ID_DOCUMENTO').AsString;
      D^.strSit_Contrato  := FieldByName('SIT_CONTRATO').AsString;
      D^.strSit_Credito   := FieldByName('SIT_CREDITO').AsString;
      D^.strSit_Documento := FieldByName('SIT_DOCUMENTO').AsString;
      D^.eImp_Credito     := FieldByName('IMP_CREDITO').AsFloat;
      D^.eSdo_Insoluto    := 0;
      D^.eSdo_Vigente     := 0;
      D^.eFin_Adicional   := 0;

      TrVwData.Items.AddChildObject(Nodo_Credito,'Documento '+FieldByName('ID_DOCUMENTO').AsString,D);
      End;

    Next;
    End;

   For I := 0 To TrVwData.Items.Count - 1 Do
    TTreeNode(TrVwData.Items[I]).Expanded := True;

   TrVwData.Selected := TrVwData.Items[0];
   lblTot_Imp_Credito.Caption := Format(CFORMAT_DINERO,[eImp_Credito]);
   lblTotSdo_Insoluto.Caption := Format(CFORMAT_DINERO,[eImpSdo_Insoluto]);
   lblTotFin_Adicional.Caption := Format(CFORMAT_DINERO,[eImpFin_Adicional]);
  Finally
   Close;
  End;
end;

procedure TWContents.MuestraCredito(nId_Credito : Integer);
var CrCredito : TCrCredito;
begin
 CrCredito := TCrCredito.Create(Self);
 Try
  CrCredito.GetParams(Objeto);
  CrCredito.ID_CREDITO.AsInteger := nId_Credito;
  CrCredito.ParamCre := Objeto.ParamCre;
  CrCredito.FindKey([nId_Credito]);  
  CrCredito.Catalogo;
 Finally
  If Assigned(CrCredito) Then CrCredito.Free;
 End;
end;

procedure TWContents.MuestraPeriodosCapital(nId_Credito : Integer);
begin
 Consulta_Credito(ftCapital, nId_Credito, StrToInt(edit2.Text),
                  '', '', Objeto.Apli, Objeto.ParamCre);
end;

procedure TWContents.MuestraPeriodosInteres(nId_Credito : Integer);
begin
 Consulta_Credito(ftInteres, nId_Credito, StrToInt(edit2.Text),
                  '', '', Objeto.Apli, Objeto.ParamCre);
end;

procedure TWContents.MuestraPeriodosComsion(nId_Credito : Integer);
begin
 Consulta_Credito(ftComision, nId_Credito, StrToInt(edit2.Text),
                  '', edit3.Text, Objeto.Apli, Objeto.ParamCre);
end;

procedure TWContents.MuestraPeriodosFinAdic(nId_Credito : Integer);
begin
 Consulta_Credito(ftFinanciamiento, nId_Credito, StrToInt(edit2.Text),
                  '', '', Objeto.Apli, Objeto.ParamCre);
end;

procedure TWContents.MuestraConsultaFEGA(nId_Credito : Integer);
begin
 ConsultaFEGA(nId_Credito, Objeto.Apli, Objeto.ParamCre);
end;

procedure TWContents.MuestraDocumentosCesion(nId_Cesion : Integer);
begin
 Consulta_Credito(ftDocumentos, nId_Cesion, 0,
                  '', '', Objeto.Apli, Objeto.ParamCre);
end;

procedure TWContents.MuestraAcreditado(nId_Titular : Integer);
var CrAcredit : TCrAcredit;
begin
 CrAcredit := TCrAcredit.Create(Self);
 Try
  CrAcredit.GetParams(Objeto);
  CrAcredit.ID_ACREDITADO.AsInteger := nId_Titular;
  CrAcredit.FindKey([nId_Titular]);
  CrAcredit.ParamCre := Objeto.ParamCre;
  CrAcredit.Catalogo;
 Finally
  If Assigned(CrAcredit) Then CrAcredit.Free;
 End;
end;

procedure TWContents.MuestraProducto(strCve_Producto_Cre : String);
var CrProduct : TCrProduct;
begin
 CrProduct := TCrProduct.Create(Self);
 Try
  CrProduct.GetParams(Objeto);
  CrProduct.CVE_PRODUCTO_CRE.AsString := strCve_Producto_Cre;
  CrProduct.FindKey([strCve_Producto_Cre]);
  CrProduct.ParamCre := Objeto.ParamCre;
  CrProduct.Catalogo;
 Finally
  If Assigned(CrProduct) Then CrProduct.Free;
 End;
end;


procedure TWContents.MuestraContrato(nId_Contrato, nFolContrato : Integer);
var CrCto : TCrCto;
begin
 CrCto := TCrCto.Create(Self);
 Try
  CrCto.GetParams(Objeto);
  CrCto.ID_CONTRATO.AsInteger := nId_Contrato;
  CrCto.FindKey([nId_Contrato, nFolContrato]);
  CrCto.ParamCre := Objeto.ParamCre;
  CrCto.Catalogo;
 Finally
  If Assigned(CrCto) Then CrCto.Free;
 End;
end;

procedure TWContents.MuestraCesion(nId_Cesion : Integer);
var CrCesion : TCrCesion;
begin
 CrCesion := TCrCesion.Create(Self);
 Try
  CrCesion.GetParams(Objeto);
  CrCesion.FindKey([nId_Cesion]);
  CrCesion.ParamCre := Objeto.ParamCre;
  CrCesion.Catalogo;
 Finally
  If Assigned(CrCesion) Then CrCesion.Free;
 End;
end;

procedure TWContents.MuestraDetalleDocumento(nId_Cesion : Integer; strId_Documento : String);
var CrDocto : TCrDocto;
begin
 CrDocto := TCrDocto.Create(Self);
 Try
  CrDocto.GetParams(Objeto);
  CrDocto.FindKey([nId_Cesion, strId_Documento]);
  CrDocto.ParamCre := Objeto.ParamCre;
  CrDocto.Catalogo;
 Finally
  If Assigned(CrDocto) Then CrDocto.Free;
 End;
end;

procedure TWContents.SelectOption;
var nTopicId_Titular,
    nTopicCredito,
    nTopicCesion : Integer;
    strTopicId_Documento,
    strTopicCve_Producto : String;
    Nodo : TTreeNode;
begin
 Nodo := TrVwData.Selected;
 If (Nodo <> Nil) Then
  If (Nodo.Data <> Nil) Then
   Begin
     If (Nodo.Level = CLEVEL_ACREDITADO) Then
      Begin
      nTopicId_Titular := PData(Nodo.Data).nId_Titular;
      If lstbxOptions.ItemIndex = 1 Then MuestraAcreditado(nTopicId_Titular);
      End
     Else If (Nodo.Level = CLEVEL_PRODUCTO) Then
      Begin
      strTopicCve_Producto := PData(Nodo.Data).strCve_Producto;
      If lstbxOptions.ItemIndex = 1 Then MuestraProducto(strTopicCve_Producto);
      End
     Else If (Nodo.Level = CLEVEL_CONTRATO) Then
      Begin
      If lstbxOptions.ItemIndex = 1 Then
       MuestraContrato(PData(Nodo.Data).nId_Contrato, PData(Nodo.Data).nFol_Contrato);
      End
     Else If (Nodo.Level = CLEVEL_CREDITO) And (Trim(PData(Nodo.Data).strId_Documento) = '') Then
      Begin
       nTopicCredito := PData(Nodo.Data).nId_Credito;
       Case lstbxOptions.ItemIndex Of
        1 : MuestraCredito(nTopicCredito);
        2 : MuestraPeriodosCapital(nTopicCredito);
        3 : MuestraPeriodosInteres(nTopicCredito);
        4 : MuestraPeriodosComsion(nTopicCredito);
        5 : MuestraPeriodosFinAdic(nTopicCredito);
        6 : MuestraConsultaFEGA(nTopicCredito);
       End;
      End
     Else If (Nodo.Level = CLEVEL_CREDITO) And (Trim(PData(Nodo.Data).strId_Documento) <> '') Then
      Begin
       nTopicCesion := PData(Nodo.Data).nId_Credito;
       Case lstbxOptions.ItemIndex Of
        1 : MuestraCesion(nTopicCesion);
        2 : MuestraCredito(nTopicCesion);
        3 : MuestraDocumentosCesion(nTopicCesion);
        End;
      End
     Else If (Nodo.Level = CLEVEL_DOCUMENTO) Then
      Begin
       nTopicCesion       := PData(Nodo.Data).nId_Credito;
       strTopicId_Documento := PData(Nodo.Data).strId_Documento;
       MuestraDetalleDocumento(nTopicCesion,strTopicId_Documento);
      End;
  End;
end;

procedure TWContents.lstbxOptionsDblClick(Sender: TObject);
begin
 SelectOption;
end;

procedure TWContents.tbstSituacionChange(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
  MuestraDatos(C_FILTER[NewTab]);
end;

procedure TWContents.edID_PERSONAEnter(Sender: TObject);
begin
  ValorModificado := tpID_PERSONA;
end;

procedure TWContents.edID_CONTRATOEnter(Sender: TObject);
begin
  ValorModificado := tpID_CONTRATO;
end;

procedure TWContents.edID_CREDITOEnter(Sender: TObject);
begin
  ValorModificado := tpID_CREDITO;
end;

procedure TWContents.FormCreate(Sender: TObject);
begin
 ValorModificado := tpNONE;
end;

procedure TWContents.TrVwDataChange(Sender: TObject; Node: TTreeNode);
begin
 Agrega_Opciones_a_LstBox;
end;


procedure TWContents.ilID_CREDITOEjecuta(Sender: TObject);
begin
 ValorModificado := tpNONE;
 With Objeto Do
  Begin
  If Credito.FindKey([ILId_Credito.Buffer]) Then
   Begin
   edDesc_Credito.Text := Obten_NombreAcreditado(Credito.ID_CREDITO.AsInteger,Apli);
   ValorModificado := tpID_CREDITO;   
   If (Situacion <> Credito.SIT_CREDITO.AsString) Then
    // Cuando se cambia la situación se muestrand los datos en automático ver "tbstSituacionChange"
    Situacion := Credito.SIT_CREDITO.AsString
   Else
    MuestraDatos(Situacion);
   End;
  End;
end;

procedure TWContents.lstbxOptionsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 If Key = VK_RETURN Then SelectOption;
end;

procedure TWContents.btnRefreshClick(Sender: TObject);
begin
   if Objeto.ValidaAccesoEsp('TCONTENTS_REFRES',True,True) then
   begin
      MuestraDatos(Situacion);
   end;
end;

procedure TWContents.TrVwDataKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 If (lstbxOptions.Items.Count > 1) And (Key = VK_RETURN) Then
  Begin
  lstbxOptions.ItemIndex := 1;
  SelectOption;
  End;
end;

procedure TWContents.btnAcreditadpClick(Sender: TObject);
begin
 If IsInteger(edID_PERSONA.Text) Then
  MuestraAcreditado(StrToInt(edID_PERSONA.Text));
end;

procedure TWContents.btnContratoClick(Sender: TObject);

  function ObtenFolio(nId_Contrato : Integer) : Integer;
   var Qry : TQuery;
  begin
   Qry := TQuery.Create(Self);
   With Qry Do
    Try
     DataBaseName := Objeto.DataBaseName;
     SessionName  := Objeto.SessionName;
     SQL.Clear;
     SQL.Add(' SELECT FOL_CONTRATO '#13#10+
             ' FROM CR_CONTRATO '#13#10+
             ' WHERE ID_CONTRATO = '+IntToStr(nId_Contrato));
     Open;
     Result := FieldByName('FOL_CONTRATO').AsInteger;
    Finally
     Close;
     If Assigned(Qry) Then Qry.Free;
    End;
  end;

var nId_Contrato : Integer;
begin
 If IsInteger(edId_Contrato.Text) Then
  Begin
  nId_Contrato := StrToInt(edId_Contrato.Text);
  MuestraContrato(nId_Contrato, ObtenFolio(nId_Contrato));
  End;
end;

procedure TWContents.bntCreditoClick(Sender: TObject);
begin
 If IsInteger(edId_Credito.Text) Then
  MuestraCredito(StrToInt(edId_Credito.Text));
end;

// LOLS 09 SEP 2005
procedure TWContents.InterForma1DespuesShow(Sender: TObject);
begin
  //
  Objeto.Credito.BuscaWhereString := 'PKGCRACTUALIZA.STPOBTEMPCTTO(CR_CREDITO.ID_CONTRATO)= ' + // LOLS 09 SEP 2005
                                     IntToStr(Objeto.Apli.IdEmpresa);                           // LOLS 09 SEP 2005
  Objeto.Credito.FilterString := Objeto.Credito.BuscaWhereString;
  //
  Objeto.Contrato.BuscaWhereString :=
    ' CONTRATO.ID_EMPRESA = ' + IntToStr(Objeto.Apli.IdEmpresa) +
    ' AND CONTRATO.ID_CONTRATO IN (SELECT ID_CONTRATO FROM CR_CONTRATO ) ';
  Objeto.Contrato.FilterString := Objeto.Contrato.BuscaWhereString ;
  //
end;

end.

