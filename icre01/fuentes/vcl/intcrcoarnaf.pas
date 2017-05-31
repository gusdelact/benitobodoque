// Sistema         : Clase de CR_CONF_ARC_NAF
// Fecha de Inicio : 19/01/2004
// Función forma   : Clase de CR_CONF_ARC_NAF
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrCoArNaf;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Grids, ImgList,

IntGenCre, 
IntParamCre,
IntCrConfigAr,
IntCrFrmtNaf,
InterEdit, IntLinkit;

const
 C_COLNOMBRE_CAM_ARC  = 0;
 C_COLSIT_CONF_ARCNAF = 1;
 C_COLB_OBLIGATORIO   = 2;
 C_COLMODIFICADO      = 3;

Type
 TCrCoArNaf= class;

  TWCrConfArcNaf=Class(TForm)
    InterForma1             : TInterForma;
    strgrdCR_CONF_ARC_NAF: TStringGrid;
    ImgList: TImageList;
    ImageList1: TImageList;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    PnDatos: TPanel;
    lbEmpresa: TLabel;
    lbUsuario: TLabel;
    lbFecha: TLabel;
    lbPerfil: TLabel;
    lbDUsuario: TLabel;
    lbDPerfil: TLabel;
    lbDFecha: TLabel;
    lbDEmpresa: TLabel;
    lbDIAS_MAX_DD_NAFIN: TLabel;
    edDIAS_MAX_DD_NAFIN: TInterEdit;
    lbFiltro: TLabel;
    edCVE_FORMATO_NAF: TEdit;
    btnCVE_FORMATO_NAF: TBitBtn;
    edDESC_C_FORMATO: TEdit;
    ikCVE_FORMATO_NAF: TInterLinkit;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure strgrdCR_CONF_ARC_NAFDrawCell(Sender: TObject; ACol,
      ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure strgrdCR_CONF_ARC_NAFMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure strgrdCR_CONF_ARC_NAFKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edDIAS_MAX_DD_NAFINChange(Sender: TObject);
    procedure btnCVE_FORMATO_NAFClick(Sender: TObject);
    procedure ikCVE_FORMATO_NAFEjecuta(Sender: TObject);
  private
    { Private declarations }
     procedure LLena_Datos;
     procedure InvertCheck(StrGrd: TStringGrid; nCol,  nRow: Integer);
     procedure ActualizaCambios;
     procedure HabilitaBotonesBtns(pebEnabled : Boolean);
     function  Habilitados : Boolean;
  public
    { Public declarations }
     Objeto : TCrCoArNaf;
  end;
  //
  TCrCoArNaf = class(TInterFrame)
  private
  protected
  //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
  public
        { Public declarations }
        ParamCre                 : TParamCre;
        CrConfigAr               : TCrConfigAr;
        CrFrmtoNaf               : TCrFrmtNaf;

        DIAS_MAX_DD_NAFIN        : TInterCampo;

        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    FiltroFmt:Boolean;
  published
  end;

implementation
//Uses RepMon;

{$R *.DFM}


constructor TCrCoArNaf.Create( AOwner : TComponent );
begin
  Inherited;
  DIAS_MAX_DD_NAFIN := CreaCampo('DIAS_MAX_DD_NAFIN', ftInteger, tsNinguno, tsNinguno, False);

  StpName  := ' ';
  UseQuery := False;
  HelpFile := 'InTCrCoArNaf.Hlp';
  ShowMenuReporte:=True;

  CrConfigAr := TCrConfigAr.Create(Self);
  CrConfigAr.MasterSource := Self;
  //CrConfigAr.CVE_FORMATO_NAF.MasterField := 'CVE_FORMATO_NAF';
  //CrConfigAr.NOMBRE_CAM_ARC.MasterField  := 'NOMBRE_CAM_ARC';
  //
  CrFrmtoNaf := TCrFrmtNaf.Create(Self);
  CrFrmtoNaf.MasterSource := Self;
  //CrFrmtoNaf.CVE_FORMATO_NAF.MasterField := 'CVE_FORMATO_NAF';
end;

Destructor TCrCoArNaf.Destroy;
begin
  if CrConfigAr <> nil then
    CrConfigAr.Free;
  //
  if CrFrmtoNaf <> nil then
    CrFrmtoNaf.Free;
  //
  inherited;
end;


function TCrCoArNaf.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrConfArcNaf;
begin
   W:=TWCrConfArcNaf.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      // W.InterForma1.FormaTipo := ftConsulta; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrCoArNaf.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrCoAN.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca := FindKey([]);
      finally  T.Free;
      end;
end;


function TCrCoArNaf.FiltroFmt: Boolean;
begin
  result := ( CrFrmtoNaf.Active) and ( CrFrmtoNaf.CVE_FORMATO_NAF.AsString <> '' );
end;

(***********************************************FORMA CR_CONF_ARC_NAF********************)
(*                                                                              *)
(*  FORMA DE CR_CONF_ARC_NAF                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_CONF_ARC_NAF********************)
function TWCrConfArcNaf.Habilitados: Boolean;
begin
  result := ( btnAceptar.Enabled ) or ( btnCancelar.Enabled );
end;

procedure TWCrConfArcNaf.FormShow(Sender: TObject);
begin
 With Objeto Do
 Begin
  lbDempresa.Caption := ParamCre.EMPRESA.AsString;
  lbDfecha.Caption   := ParamCre.FECHA.AsString;
  lbDUsuario.Caption := ParamCre.USUARIO.AsString;
  lbDPerfil.Caption  := ParamCre.PERFIL.AsString;

  CrFrmtoNaf.CVE_FORMATO_NAF.Control := edCVE_FORMATO_NAF;
  CrFrmtoNaf.DESC_L_FORMATO.Control  := edDESC_C_FORMATO;

  DIAS_MAX_DD_NAFIN.Control := edDIAS_MAX_DD_NAFIN;
 End;
 // LLena_Datos;
 HabilitaBotonesBtns(False);
end;

procedure TWCrConfArcNaf.FormDestroy(Sender: TObject);
begin
 With Objeto Do
  Begin
    CrFrmtoNaf.CVE_FORMATO_NAF.Control := Nil;
    CrFrmtoNaf.DESC_L_FORMATO.Control  := Nil;
    //
    DIAS_MAX_DD_NAFIN.Control := Nil;
  End;
end;

procedure TWCrConfArcNaf.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TWCrConfArcNaf.ActualizaCambios;
var I : Integer;
    vlQry : TQuery;
    vlstrMsg : String;
begin
 if not Objeto.FiltroFmt then
 begin
   MessageDlg('Debe seleccionar un formato de archivo', mtWarning, [mbOk], 0);
   Exit;
 end;
 //
 vlstrMsg := '';
 Objeto.DIAS_MAX_DD_NAFIN.GetFromControl;
 If (Trim(edDIAS_MAX_DD_NAFIN.Text) = '') Then
  vlstrMsg := 'Favor de indicar el '+lbDIAS_MAX_DD_NAFIN.Caption
 Else If (Objeto.DIAS_MAX_DD_NAFIN.AsInteger = 0) Then
  vlstrMsg := 'El '+lbDIAS_MAX_DD_NAFIN.Caption+' no puede ser 0 (Cero). Verifique.';

 If (vlstrMsg <> '') Then
   Begin
   If edDIAS_MAX_DD_NAFIN.CanFocus Then edDIAS_MAX_DD_NAFIN.SetFocus;
   MessageDlg(vlstrMsg, mtWarning, [mbOk], 0);
   Exit;
   End;

 // Actualiza los cambios realizados en El Archivo NAFIN
 With strgrdCR_CONF_ARC_NAF Do
  For I := 1 To RowCount-1 Do
     If (Cells[C_COLMODIFICADO,I] <> '') Then
      If Objeto.CrConfigAr.FindKey([ Objeto.CrFrmtoNaf.CVE_FORMATO_NAF.AsString,
                                     Cells[C_COLNOMBRE_CAM_ARC,I]]) Then
       Begin
       Objeto.CrConfigAr.Edit;
       Objeto.CrConfigAr.SIT_CONF_ARCNAF.AsString  := Cells[C_COLSIT_CONF_ARCNAF,I];
       Objeto.CrConfigAr.CVE_USU_MODIFICA.AsString := Objeto.Apli.Usuario;
       Objeto.CrConfigAr.F_MODIFICA.AsDateTime     := Objeto.Apli.DameFechaEmpresa;
       Objeto.CrConfigAr.Post;
       End;
  // Actualiza el Plazo Máximo de Documentos NAFIN
  If Not RunSQL('UPDATE CR_PARAMETRO SET DIAS_MAX_DD_NAFIN = '+Objeto.DIAS_MAX_DD_NAFIN.AsString+' WHERE CVE_PARAMETRO = '+SQLStr(C_CRE),
          Objeto.Apli.DatabaseName, Objeto.Apli.SessionName, True) Then
     MessageDlg('Problemas al actualizar la configuración. Intente nuevamente ó Avise a Sistemas',
                mtError, [mbOk], 0)
  Else
     MessageDlg('Configuración Actualizada.',mtInformation, [mbOk], 0)
end;

procedure TWCrConfArcNaf.InvertCheck(StrGrd: TStringGrid; nCol,
  nRow: Integer);
var strBool : String;
begin
 With StrGrd Do
  Begin
   If (Cells[C_COLB_OBLIGATORIO, nRow] = 'V') Then
    Begin
    ShowMessage('El dato  de "'+Cells[C_COLNOMBRE_CAM_ARC, nRow]+'" es obligatorio, no se puede eliminar de la Carga');
    Exit;
    End;

   If (Cells[nCol,nRow] = CSIT_AC) Then strBool := CSIT_CA
   Else strBool := CSIT_AC;
   Cells[nCol,nRow] := strBool;
   Cells[C_COLMODIFICADO,nRow] := 'V';
   HabilitaBotonesBtns(True);   
  End;
end;

procedure TWCrConfArcNaf.LLena_Datos;
var Query : TQuery;
    I, nTotalRows, vlDIAS_MAX_DD_NAFIN : Integer;
begin
 if not Objeto.FiltroFmt then
 begin
   ShowMessage('Debe seleccionar un formato');
   Exit;
 end;
 // LLena los campos utilizados para la carga de NAFIN
 With Objeto Do
   Begin
   ClearGrid(strgrdCR_CONF_ARC_NAF);
   Query := TQuery.Create(Nil);
   If Assigned(Query) Then
    With (Query) Do
     Try
      SQL.Clear;
      SQL.Add( 'SELECT * FROM CR_CONF_ARC_NAF WHERE CVE_FORMATO_NAF = ' +
               SQLStr(Objeto.CrFrmtoNaf.CVE_FORMATO_NAF.AsString) +
               ' ORDER BY NOMBRE_CAM_ARC');
      DataBaseName := Apli.DataBaseName;
      SessionName := Apli.SessionName;
      Open; Last;

      nTotalRows := RecordCount;
      If (nTotalRows > 1) Then strgrdCR_CONF_ARC_NAF.RowCount := nTotalRows
      Else strgrdCR_CONF_ARC_NAF.RowCount  := 2;
      strgrdCR_CONF_ARC_NAF.FixedRows := 1;

      First;
      { Coloca los Titulos }
      strgrdCR_CONF_ARC_NAF.Cells[C_COLNOMBRE_CAM_ARC ,0] := 'Campo de Archivo';
      strgrdCR_CONF_ARC_NAF.Cells[C_COLSIT_CONF_ARCNAF,0] := 'Cargar';
      strgrdCR_CONF_ARC_NAF.Cells[C_COLB_OBLIGATORIO  ,0] := 'Dato Obligatorio';

      strgrdCR_CONF_ARC_NAF.ColWidths[C_COLSIT_CONF_ARCNAF] := 49;
      strgrdCR_CONF_ARC_NAF.ColWidths[C_COLB_OBLIGATORIO] := 106;
      strgrdCR_CONF_ARC_NAF.ColWidths[C_COLMODIFICADO] := 0;

      I := 1;
      While Not Eof Do
       Begin
       strgrdCR_CONF_ARC_NAF.Cells[C_COLNOMBRE_CAM_ARC ,I] := FieldByName('NOMBRE_CAM_ARC').AsString;
       strgrdCR_CONF_ARC_NAF.Cells[C_COLSIT_CONF_ARCNAF,I] := FieldByName('SIT_CONF_ARCNAF').AsString;
       strgrdCR_CONF_ARC_NAF.Cells[C_COLB_OBLIGATORIO  ,I] := FieldByName('B_OBLIGATORIO').AsString;
       strgrdCR_CONF_ARC_NAF.Cells[C_COLMODIFICADO     ,I] := '';
       Next; Inc(I);
       End;
     Finally
       Close;
       Free;
     End;
     // Obtiene el Plazo Máximo de Documentos NAFIN
     DIAS_MAX_DD_NAFIN.AsInteger := 0;
     If GetSQLInt('SELECT DIAS_MAX_DD_NAFIN FROM CR_PARAMETRO WHERE CVE_PARAMETRO = '+SQLStr(C_CRE),
                 Apli.DatabaseName, Apli.SessionName, 'DIAS_MAX_DD_NAFIN', vlDIAS_MAX_DD_NAFIN, True
                 ) Then
        DIAS_MAX_DD_NAFIN.AsInteger := vlDIAS_MAX_DD_NAFIN;
   End;
end;

{
                  +      EVENTOS DEL GRID      +
}
procedure TWCrConfArcNaf.strgrdCR_CONF_ARC_NAFDrawCell(Sender: TObject;
  ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var strSIT_CONF_ARCNAF, strB_OBLIGATORIO : String;
    Bmp : TBitmap;
    nIndex  : Integer;
begin
 If ARow > 0 Then
  With strgrdCR_CONF_ARC_NAF Do
   Begin
   Bmp := TBitmap.Create;

   If (ACol = C_COLSIT_CONF_ARCNAF) Then
    Begin
    strSIT_CONF_ARCNAF := Cells[C_COLSIT_CONF_ARCNAF, ARow];
    If (strSIT_CONF_ARCNAF = CSIT_AC) Then nIndex := 1
    Else nIndex := 0;
    ImgList.GetBitmap(nIndex, Bmp);
    Canvas.Draw(Rect.Left,Rect.Top,Bmp);
    End;

   strB_OBLIGATORIO := CELLS[C_COLB_OBLIGATORIO, ARow];
   If (ACol = C_COLB_OBLIGATORIO)  Then
    Begin
    If (strB_OBLIGATORIO = 'V') Then nIndex := 1
    Else nIndex := 0;
    ImageList1.GetBitmap(nIndex, Bmp);
    Canvas.Draw(Rect.Left,Rect.Top,Bmp);
    End;

   If Assigned(Bmp) Then Begin Bmp.FreeImage; Bmp.Free End;
   End;
end;
//
procedure TWCrConfArcNaf.strgrdCR_CONF_ARC_NAFKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Objeto.FiltroFmt then
  begin
    If (Sender Is TStringGrid) Then
      Case Key Of
       32 : InvertCheck(Sender As TStringGrid,C_COLSIT_CONF_ARCNAF,(Sender As TStringGrid).Row);
      end;
  end;
end;
//
procedure TWCrConfArcNaf.strgrdCR_CONF_ARC_NAFMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var nCol, nRow : LongInt;
begin
  if Objeto.FiltroFmt then
  begin
    If (Sender Is TStringGrid) Then
      With (Sender As TStringGrid) Do
      begin
        MouseToCell(X,Y,nCol, nRow);
        If (nCol = C_COLSIT_CONF_ARCNAF) And (nRow > 0) Then
          InvertCheck((Sender As TStringGrid),C_COLSIT_CONF_ARCNAF,nRow);
      end;
  end;
end;
//
procedure TWCrConfArcNaf.btnAceptarClick(Sender: TObject);
begin
 ActualizaCambios;
 HabilitaBotonesBtns(False);
end;

procedure TWCrConfArcNaf.btnCancelarClick(Sender: TObject);
begin
 LLena_Datos;
 HabilitaBotonesBtns(False);
end;

procedure TWCrConfArcNaf.edDIAS_MAX_DD_NAFINChange(Sender: TObject);
begin
 HabilitaBotonesBtns(True);
end;

procedure TWCrConfArcNaf.HabilitaBotonesBtns(pebEnabled : Boolean);
begin
 btnAceptar.Enabled := pebEnabled;
 btnCancelar.Enabled := pebEnabled;
end;
//
procedure TWCrConfArcNaf.btnCVE_FORMATO_NAFClick(Sender: TObject);
begin
  if not Habilitados then
  begin
    if Objeto.CrFrmtoNaf.Busca then
    begin
      LLena_Datos;
      HabilitaBotonesBtns(False);
    end;
  end else
    ShowMessage('Debe aceptar o cancelar los cambios realizados anteriormente');
  //
end;
//
procedure TWCrConfArcNaf.ikCVE_FORMATO_NAFEjecuta(Sender: TObject);
begin
  if not Habilitados then
  begin
    if Objeto.CrFrmtoNaf.FindKey( [ ikCVE_FORMATO_NAF.Buffer ] ) then
    begin
      LLena_Datos;
      HabilitaBotonesBtns(False);
    end;
  end else
    ShowMessage('Debe aceptar o cancelar los cambios realizados anteriormente');
  //
end;



end.
