// Sistema         : Clase de CR_NOTIFICACION
// Fecha de Inicio : 21/08/2003
// Función forma   : Clase de CR_NOTIFICACION
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    : Victor Hugo Santillan Trejo
// Comentarios     :
Unit IntCrNotific;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Grids,

IntParamCre, IntCrCesion, IntLinkit, IntGenCre, IntCrEmaEmi, IntCrEmaDat,
ImgList, DBCtrls, InterApl, IntQRPreview, QRPrntr, Printers, Tabs;

const
  C_CARGO = 'Cargo';
  C_TITULO = 'Notificación de Cesiones';
  C_TIT_ENVIA  = 'Envíar Mail';
  C_TIT_TEST   = 'Nombre de los Testigos';
  C_TIT_REPR   = 'Nombre de los Representantes';
  C_TIT_EMAIL  = 'Correo Electrónico (email)';
  C_TIT_NOMBRE = 'Nombre del Destinatario';
  C_TIT_PERSONA = 'Id. Persona';
  C_TIT_SIT    = 'Situación';
  C_HINT = 'Si desea editar o eliminar un registro, de Doble Click sobre él.';
  C_COL_ENVIA  = 0;
  C_COL_EMAIL  = 1;
  C_COL_NOMBRE = 2;
  C_COL_SIT    = 3;
  C_COL_PERSONA = 0;
  C_COL_NOM_DAT = 1;
  C_COL_CARGO = 2;
  C_APLICA = '1';
  C_NOAPLICA = '0';

Type
 TCrNotific= class;

  TWCrNotificacion=Class(TForm)
    InterForma1             : TInterForma;
    grbxCesion: TGroupBox;
    lblID_CESION: TLabel;
    edID_CESION: TEdit;
    lblID_EMISOR: TLabel;
    edNom_Emisor: TEdit;
    edID_EMISOR: TEdit;
    lblCALVE: TLabel;
    lblNOMBRE: TLabel;
    edID_PROVEEDOR: TEdit;
    lblID_PROVEEDOR: TLabel;
    edNom_Proveedor: TEdit;
    grbxData: TGroupBox;
    Label6: TLabel;
    chkGenValidacion: TCheckBox;
    edAtencion: TEdit;
    strGrdDestinatarios: TStringGrid;
    bntEnviaEmails: TButton;
    btnID_PERSONA: TBitBtn;
    lblNAFIN: TLabel;
    ILID_CESION: TInterLinkit;
    edID_PROV_NAFINSA: TEdit;
    edCVE_EMISOR_NAFIN: TEdit;
    ImgList: TImageList;
    strGrdTestigos: TStringGrid;
    strGrdRepresentantes: TStringGrid;
    lblRepresentantes: TLabel;
    Bevel2: TBevel;
    lblTestigos: TLabel;
    Bevel3: TBevel;
    lblDestinatarios: TLabel;
    Bevel1: TBevel;
    btnAddRepresentantes: TButton;
    btnAddDestinatarios: TButton;
    btnAddTestigos: TButton;
    Bevel4: TBevel;
    lblEmisorDestinatarios: TLabel;
    lblCesionNotificada: TLabel;
    lblAlimentaImpresion: TLabel;
    opManual: TRadioButton;
    opAutomatica: TRadioButton;
    tbstRepresentantes: TTabSet;
    tbStGrdTestigos: TTabSet;
    rgFormato: TRadioGroup;
    procedure FormShow(Sender : TObject);
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure btnAddDestinatariosClick(Sender: TObject);
    procedure btnID_PERSONAClick(Sender: TObject);
    procedure strGrdDestinatariosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strGrdDestinatariosMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure strGrdDestinatariosDblClick(Sender: TObject);
    procedure btnAddRepresentantesClick(Sender: TObject);
    procedure btnAddTestigosClick(Sender: TObject);
    procedure ILID_CESIONEjecuta(Sender: TObject);
    procedure strGrdRepresentantesDblClick(Sender: TObject);
    procedure strGrdTestigosDblClick(Sender: TObject);
    procedure bntEnviaEmailsClick(Sender: TObject);
    procedure strGrdDestinatariosDrawCell(Sender: TObject; ACol,
      ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);
    procedure tbstRepresentantesChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure tbStGrdTestigosChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure rgFormatoClick(Sender: TObject);
     //FJR 24.07.2012 funcion para determinar chequera del emisor
     function  ObtenChequeraEmisor: String;
     function  CLABE(Chequera: String) : String; 
    private
    { Private declarations }
     m_bMuestraCesionNotificada  : Boolean;
     vgSIT_REPRESENTANTES : String;
     vgSIT_TESTIGOS : String;

     function ObtenNombrePersona(nID_PERSONA : Integer) : String;
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
//     function ObtenIdProveedorNAFIN(nID_PROVEEDOR : Integer) : Integer;
     function ObtenIdProveedorNAFIN(nID_PROVEEDOR : Integer; PPCVE_FND_ENT_DES : String) : Integer;
{/ROIM}
     //FJR 24.07.2012 funcion para determinar chequera del emisor
//     function  ObtenChequeraEmisor: String;
     procedure ShowData;
     procedure ClearData;
     procedure FillDataGrid_RepTest(StrGrd : TStringGrid; strSITUACION, strID_TIPO_PERSONA, strTitleCol1, strTitleCol2 : String);
     procedure FillDataDestinatarios(StrGrd: TStringGrid);
     procedure EnableGroupBox(bEnabled : Boolean);
     procedure InvertCheck(StrGrd: TStringGrid; nCol, nRow: Integer);
     procedure RefreshData;
     procedure MuestraModificaEmailEmisor;
     procedure MuestraModificaEmailDatos(nID_PERSONA : Integer; strID_TIPO_PERSONA : String);
     procedure MuestraAgregarEmailDatos(strID_TIPO_PERSONA : String);
     function  CesionNotificada : Boolean;
     function  Make_Body_Email_Documentos(nID_CESION : Integer) : String;
     function  EnviarEmails : Boolean;
     function  ALaAtencionDe: String ;
     // FJR 20.07.2012
     Function  Determina_TipoMail(p: Integer): String ;

     procedure Set_MuestraCesionNotificada(bValue : Boolean);
     procedure ImpresionNotificacion(bPreview : Boolean);
    public
    { Public declarations }
    Objeto : TCrNotific;

    property MuestraCesionNotificada : Boolean Read m_bMuestraCesionNotificada Write Set_MuestraCesionNotificada;
end;
 TCrNotific= class(TInterFrame)
      private
      protected
    //  procedure Notification( AComponent : TComponent; Operation : TOperation); override;
      public
        { Public declarations }
        ParamCre                 : TParamCre;
        Cesion                   : TCrCesion;

        function    Envio (TipoFormato: Integer): Boolean;
        function    InternalBusca : Boolean; override;
        constructor Create( AOwner : TComponent ); override;
        destructor  Destroy; override;
        function    ShowWindow(FormaTipo : TFormaTipo) : Integer; override;
        function    Reporte:Boolean; override;
      published
      end;

implementation

uses IntRpNoti;
{$R *.DFM}

constructor TCrNotific.Create( AOwner : TComponent );
begin Inherited;
      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'IntCrNotific.Hlp';
      ShowMenuReporte:=True;

      Cesion := TCrCesion.Create(Self);
      Cesion.MasterSource := Self;
      Cesion.ID_CESION.MasterField := 'ID_CESION';
      // FJR 25.07.2012
      Cesion.BuscaWhereString:= 'CR_CESION.SIT_CESION IN (''NA'', ''AU'') '; // FJR 25.07.2012 ''AU''
      Cesion.FilterString:=Cesion.BuscaWhereString;
end;

Destructor TCrNotific.Destroy;
begin inherited;
end;


function TCrNotific.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrNotificacion;
begin
   W:=TWCrNotificacion.Create(Self);
   try
      W.Objeto:= Self;
      W.InterForma1.InterFrame:= Self;
      W.InterForma1.FormaTipo := ftImprimir; //FIJA EL TIPO DE FORMA
      W.InterForma1.ShowGrid := False;
      W.InterForma1.ShowNavigator := False;
      W.InterForma1.Funcion := FInterFun;
      W.InterForma1.ShowModal;
      ShowWindow := W.InterForma1.ModalResult;
   finally
      W.Free;
   end;
end;


Function TCrNotific.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrNotif.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca:= Cesion.FindKey([T.DameCampo(0)]);
      finally  T.Free;
      end;
end;

function TCrNotific.Reporte:Boolean;
begin Result := False;
end;

function TCrNotific.Envio(TipoFormato: Integer): Boolean;
var W : TWCrNotificacion;

begin
   W:=TWCrNotificacion.Create(Self);
   try
      W.Objeto:= Self;
      W.edID_CESION.Text := W.Objeto.Cesion.ID_CESION.AsString ;
      W.rgFormato.ItemIndex := TipoFormato ;
      W.Objeto.Cesion.FindKey([W.edID_CESION.Text]) ;
      W.ShowData ;
      W.EnableGroupBox(true);
      W.CesionNotificada;
      //W.bntEnviaEmailsClick(Self);
      Result:= W.EnviarEmails ;
      //Result:= True ;
   except
      Result:= False;
   end;

end ;

(***********************************************FORMA CR_NOTIFICACION********************)
(*                                                                              *)
(*  FORMA DE CR_NOTIFICACION                                                            *)
(*                                                                              *)
(***********************************************FORMA CR_NOTIFICACION********************)

// FJR 20.07.2012
Function TWCrNotificacion.Determina_TipoMail(p: Integer): String ;
var k: String ;
begin
    Case p of
      1: k:= C_CVE_NOTIFICACION_FACTELEC ;
    Else
         k:= C_CVE_NOTIFICACION_CESIONES ;
    End ;

    Result:= k ;
end ;

Function TWCrNotificacion.ALaAtencionDe: String ;
var i: Integer;
    texto: String;
begin
   texto:= '' ;
   For i:=0 to strGrdDestinatarios.RowCount - 1 do
   begin
      If strGrdDestinatarios.Cells[0,i] = C_APLICA then
         texto:= texto + ' '+strGrdDestinatarios.Cells[2, i] + ','  ;
   end ;
   Texto:= Copy(Texto, 1, Length(Texto)-1) ;
   Texto:= Trim(Texto) ;

   Result:= Texto;
end ;

procedure TWCrNotificacion.Set_MuestraCesionNotificada(bValue : Boolean);
begin
 If (bValue <> m_bMuestraCesionNotificada) Then
  Begin
  m_bMuestraCesionNotificada := bValue;
  lblCesionNotificada.Visible := m_bMuestraCesionNotificada;
  End;
end;

procedure TWCrNotificacion.FormShow(Sender: TObject);
begin
 EnableGroupBox(False);
 With Objeto Do
  Begin
  Cesion.ID_CESION.Control := edID_CESION;
  Cesion.ID_EMISOR.Control := edID_EMISOR;
  Cesion.CVE_EMISOR_NAFIN.Control := edCVE_EMISOR_NAFIN;
  Cesion.ID_PROVEEDOR.Control := edID_PROVEEDOR;

  vgSIT_REPRESENTANTES := CSIT_AC;
  vgSIT_TESTIGOS       := CSIT_AC;
  End;
end;

procedure TWCrNotificacion.FormDestroy(Sender: TObject);
begin
 With Objeto Do
  Begin
  Cesion.ID_CESION.Control := Nil;
  Cesion.ID_EMISOR.Control := Nil;
  Cesion.CVE_EMISOR_NAFIN.Control := Nil;
  Cesion.ID_PROVEEDOR.Control := Nil;
  End;
end;

procedure TWCrNotificacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

// Implementation Of Procedures

function TWCrNotificacion.ObtenNombrePersona(nID_PERSONA : Integer) : String;
var Qry : TQuery;
    strNombre : String;
begin
 strNombre := '';
 Qry := TQuery.Create(Self);
 If Assigned(Qry) Then
  With Qry Do
   Try
     DataBaseName := Objeto.DataBaseName;
     SessionName := Objeto.SessionName;
     SQL.Clear;
     SQL.Add(
             ' SELECT'#13#10+
             // < EASA4011      14.FEB.2007     Req. 2007 - 01 / 010
//             '      (PF.APELLIDO_PATERNO || '' '' || PF.APELLIDO_MATERNO || '' '' || PF.NOMBRE_PERSONA || PM.NOM_RAZON_SOCIAL) AS NOMBRE'#13#10+
             '      ( PF.NOMBRE_PERSONA || PM.NOM_RAZON_SOCIAL || '' '' || PF.APELLIDO_PATERNO || '' '' || PF.APELLIDO_MATERNO) AS NOMBRE'#13#10+
             //   EASA4011 >/
             ' FROM PERSONA P,'#13#10+
             '      PERSONA_FISICA PF,'#13#10+
             '      PERSONA_MORAL PM'#13#10+
             ' WHERE P.ID_PERSONA = '+IntToStr(nID_PERSONA)+#13#10+
             '   AND PF.ID_PERSONA (+)= P.ID_PERSONA'#13#10+
             '   AND PM.ID_PERSONA (+)= P.ID_PERSONA'#13#10
             );
    Open;
    strNombre := FieldByName('NOMBRE').AsString;
   Finally
    Close;  Free;
   End;       
 Result := strNombre;
end;

{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
//function TWCrNotificacion.ObtenIdProveedorNAFIN(nID_PROVEEDOR : Integer) : Integer;
function TWCrNotificacion.ObtenIdProveedorNAFIN(nID_PROVEEDOR : Integer; PPCVE_FND_ENT_DES : String) : Integer;
{/ROIM}
var Qry : TQuery;
    nID_PROV_NAFINSA : Integer;
begin
 nID_PROV_NAFINSA := 0;
 Qry := TQuery.Create(Self);
 If Assigned(Qry) Then
  With Qry Do
   Try
     DataBaseName := Objeto.DataBaseName;
     SessionName := Objeto.SessionName;
     SQL.Clear;
     SQL.Add(
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
//             ' SELECT ID_PROV_NAFINSA'#13#10+
             ' SELECT ID_PROV_EXTERNO'#13#10+
{/ROIM}
             ' FROM CR_PROVEEDOR'#13#10+
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
             ' WHERE CVE_FND_ENT_DES = ' + #39 + PPCVE_FND_ENT_DES + #39 +
{/ROIM}
             ' AND   ID_ACREDITADO  = '+IntToStr(nID_PROVEEDOR)
             );
     Open;
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
//     nID_PROV_NAFINSA := FieldByName('ID_PROV_NAFINSA').AsInteger;
     nID_PROV_NAFINSA := FieldByName('ID_PROV_EXTERNO').AsInteger;
{/ROIM}
   Finally
     Close; Free;
   End;
 Result := nID_PROV_NAFINSA;
end;

// FJR 24.07.2012 Funcion de obtencion de chequera de emisor
function TWCrNotificacion.ObtenChequeraEmisor: String ;
var Q : TQuery;
    xCHEQUERA: String;
begin
   xCHEQUERA := '' ;
   Q:= TQuery.Create(Self);
   If Assigned(Q) then
      With Q do
        try
           DataBaseName := Objeto.DataBaseName;
           SessionName := Objeto.SessionName;
           Close;
           SQL.Clear;
           SQL.Add( 'SELECT PKGCRPERIODO.STPObtChqCte('+Objeto.Cesion.ID_EMISOR.AsString+',  '+
                    '                                 '+Objeto.Cesion.CVE_EMISOR_NAFIN.AsString+',  '+
                    '                                 '+Objeto.Cesion.ID_CESION.AsString+', ''AC'', ''AD'', ''CR'') '+
                    'FROM DUAL ');
{           SQL.Add( 'SELECT PKGCRPERIODO.STPObtChqCte('+IntToStr(IdAcreditado)+', '+IntToStr(EmisorNafin)+', '+IntToStr(Cesion)+', ''AC'', ''AD'', ''AB'') '+
                    'FROM DUAL '); }
           Open;
           xCHEQUERA:= Fields[0].AsString;
        finally
           Close; Free;
        end ;

   Result:= '/'+xCHEQUERA ;
end ;

procedure TWCrNotificacion.FillDataGrid_RepTest(StrGrd : TStringGrid;
          strSITUACION, strID_TIPO_PERSONA, strTitleCol1, strTitleCol2 : String);
var Qry : TQuery;
    nRow : Integer;
begin
 StrGrd.Cells[C_COL_PERSONA,0] := C_TIT_PERSONA;
 StrGrd.Cells[C_COL_NOM_DAT,0] := strTitleCol1;
 StrGrd.Cells[C_COL_CARGO  ,0] := strTitleCol2;

 Qry := TQuery.Create(Self);
 If Assigned(Qry) Then
  With Qry Do
   Try
     DataBaseName := Objeto.DataBaseName;
     SessionName := Objeto.SessionName;
     SQL.Clear;
     SQL.Add(
             ' SELECT'+coCRLF+
             '      CED.ID_PERSONA,'+coCRLF+
             // < EASA4011      14.FEB.2007     Req. 2007 - 01 / 010
//             '      (PF.APELLIDO_PATERNO || '' '' || PF.APELLIDO_MATERNO || '' '' || PF.NOMBRE_PERSONA) AS NOMBRE,'+coCRLF+
             '      ( PF.NOMBRE_PERSONA || '' '' || PF.APELLIDO_PATERNO || '' '' || PF.APELLIDO_MATERNO ) AS NOMBRE,'+coCRLF+
             //   EASA4011 >/
             '      P.NOMBRE_PUESTO AS CARGO'+coCRLF+
             ' FROM CR_EMAIL_DATOS CED,'+coCRLF+
             '      PERSONA_FISICA PF,'+coCRLF+
             '      EMPLEADO E,'+coCRLF+
             '      PUESTO P'+coCRLF+
            // FJR 20.07.2012 ' WHERE CED.ID_TIPO_EMAIL = '+SQLStr(C_CVE_NOTIFICACION_CESIONES)+coCRLF+
             ' WHERE CED.ID_TIPO_EMAIL = '+SQLStr(Determina_TipoMail(rgFormato.ItemIndex))+coCRLF+
             '   AND CED.ID_TIPO_PERSONA = '+SQLStr(strID_TIPO_PERSONA)+coCRLF+
             '   AND CED.SIT_EMAIL_DATOS = '+SQLStr(strSITUACION)+coCRLF+
             '   AND PF.ID_PERSONA = CED.ID_PERSONA'+coCRLF+
             '   AND E.ID_PERSONA = PF.ID_PERSONA'+coCRLF+
             '   AND P.CVE_PUESTO = E.CVE_PUESTO'+coCRLF+
             ' ORDER BY NOMBRE'+coCRLF
             );
     Open;
     SQL.SaveToFile('C:\Testigos.SQL');
     ClearGrid(StrGrd);
     StrGrd.RowCount := 255;
     nRow := 1;
     While Not Eof Do
      Begin
      StrGrd.Cells[C_COL_PERSONA,nRow] := FieldByName('ID_PERSONA').AsString;
      StrGrd.Cells[C_COL_NOM_DAT,nRow] := FieldByName('NOMBRE').AsString;
      StrGrd.Cells[C_COL_CARGO,nRow] := FieldByName('CARGO').AsString;
      Application.ProcessMessages;
      Next;
      Inc(nRow);
      End;

     If (nRow < 2) Then StrGrd.RowCount := 2
     Else StrGrd.RowCount := nRow;

     StrGrd.ShowHINT := True;
     StrGrd.Hint := C_HINT;
   Finally
     Close; Free;
   End;
end;

procedure TWCrNotificacion.FillDataDestinatarios(StrGrd: TStringGrid);
var Qry : TQuery;
    nRow : Integer;
begin
 StrGrd.Cells[C_COL_ENVIA ,0] := C_TIT_ENVIA;
 StrGrd.Cells[C_COL_EMAIL ,0] := C_TIT_EMAIL;
 StrGrd.Cells[C_COL_NOMBRE,0] := C_TIT_NOMBRE;
 StrGrd.Cells[C_COL_SIT,0]    := C_TIT_SIT;

 Qry := TQuery.Create(Self);
 If Assigned(Qry) Then
  With Qry Do
   Try
     DataBaseName := Objeto.DataBaseName;
     SessionName := Objeto.SessionName;
     SQL.Clear;
     SQL.Add(
             'SELECT'#13#10+
             '       EMAIL,'#13#10+
             '       NOMBRE,'#13#10+
             '       SIT_MAIL_EMISOR'#13#10+
             'FROM CR_EMAIL_EMISOR'#13#10+
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
//             'WHERE ID_EMISOR = '+edID_EMISOR.Text+#13#10+
//             '  AND CVE_EMISOR_NAFIN = '#39+edCVE_EMISOR_NAFIN.Text+#39#13#10
             'WHERE CVE_FND_ENT_DES = ' + Objeto.Cesion.CVE_FND_ENT_DES.AsSQL +
             //'  AND ID_EMISOR = '+edID_EMISOR.Text+#13#10+
               '  AND ID_EMISOR = '+Objeto.Cesion.ID_EMISOR.AsString+#13#10+
             //'  AND CVE_EMISOR_EXT = '#39+edCVE_EMISOR_NAFIN.Text+#39#13#10
               '  AND CVE_EMISOR_EXT = '#39+Objeto.Cesion.CVE_EMISOR_NAFIN.AsString+#39#13#10

{/ROIM}

             );
     Open;
     SQL.SaveTofile('c:\destinatarios.sql') ;
     ClearGrid(StrGrd);
     StrGrd.RowCount := 255;
     nRow := 1;
     While Not Eof Do
      Begin
      If (FieldByName('SIT_MAIL_EMISOR').AsString = CSIT_AC) Then StrGrd.Cells[C_COL_ENVIA ,nRow] := C_APLICA
      Else StrGrd.Cells[C_COL_ENVIA ,nRow] := C_NOAPLICA;
      StrGrd.Cells[C_COL_EMAIL ,nRow] := FieldByName('EMAIL').AsString;
      StrGrd.Cells[C_COL_NOMBRE,nRow] := FieldByName('NOMBRE').AsString;
      StrGrd.Cells[C_COL_SIT   ,nRow] := FieldByName('SIT_MAIL_EMISOR').AsString;
      Application.ProcessMessages;
      Next;
      Inc(nRow);
      End;

     If (nRow < 2) Then StrGrd.RowCount := 2
     Else StrGrd.RowCount := nRow;

     edAtencion.Text:= ALaAtencionDe;
     StrGrd.Hint := C_HINT;
   Finally
     Close; Free;
   End;
end;

procedure TWCrNotificacion.InvertCheck(StrGrd: TStringGrid; nCol, nRow: Integer);
var strBool : String;
begin
 With StrGrd Do
  Begin
   If (Cells[C_COL_SIT,nRow] = CSIT_AC) Then
    Begin
     If (Cells[nCol,nRow] = C_APLICA) Then strBool := C_NOAPLICA
     Else strBool := C_APLICA;
     Cells[nCol,nRow] := strBool;
    End;
  End;
end;

procedure TWCrNotificacion.EnableGroupBox(bEnabled: Boolean);
var I : Integer;
begin
 With grbxData Do
  For I := 0 To ControlCount - 1 Do
   Begin
   Controls[I].Enabled := bEnabled;

   If (Controls[I] Is TStringGrid) Then
    If Not bEnabled Then (Controls[I] As TStringGrid).Color := clBtnFace
    Else (Controls[I] As TStringGrid).Color := clWindow;

   If (Controls[I] Is TEdit) Then
    If Not bEnabled Then (Controls[I] As TEdit).Color := clBtnFace
    Else (Controls[I] As TEdit).Color := clWindow;
   End;
end;

procedure TWCrNotificacion.MuestraModificaEmailEmisor;
var CrEmaEmi : TCrEmaEmi;
    nID_EMISOR : Integer;
    strCVE_EMISOR_NAFIN, strEMAIL : String;
begin
 With (strGrdDestinatarios) Do
  If (Trim(Cells[C_COL_EMAIL,Row]) <> '') Then
   Begin
      If IsInteger(edId_Emisor.Text) Then
       Begin
       CrEmaEmi := TCrEmaEmi.Create(Self);

       If Assigned(CrEmaEmi) Then
          Try
           nID_EMISOR := StrToInt(edID_EMISOR.Text);
           strCVE_EMISOR_NAFIN := edCVE_EMISOR_NAFIN.Text;
           strEMAIL := Cells[C_COL_EMAIL,Row];
           CrEmaEmi.GetParams(Objeto);
           CrEmaEmi.ParamCre := Objeto.ParamCre;
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
//           CrEmaEmi.FindKey([nID_EMISOR,strCVE_EMISOR_NAFIN,strEMAIL]);
           CrEmaEmi.FindKey([Objeto.Cesion.CVE_FND_ENT_DES.AsString,nID_EMISOR,strCVE_EMISOR_NAFIN,strEMAIL]);
{/ROIM}
           CrEmaEmi.ShowWindow(ftGrid);
          Finally
           CrEmaEmi.Free;
           RefreshData;
          End;
       End;
   End;
end;

procedure TWCrNotificacion.MuestraAgregarEmaildatos(strID_TIPO_PERSONA : String);
var CrEmaDat : TCrEmaDat;
begin
 CrEmaDat := TCrEmaDat.Create(Self);
 If Assigned(CrEmaDat) Then
   Try
    CrEmaDat.GetParams(Objeto);
    CrEmaDat.ParamCre := Objeto.ParamCre;

    CrEmaDat.m_strDefaultID_TIPO_PERSONA := strID_TIPO_PERSONA;
    // FJR 20.07.2012 CrEmaDat.m_strDefaultID_TIPO_EMAIL := C_CVE_NOTIFICACION_CESIONES;
    CrEmaDat.m_strDefaultID_TIPO_EMAIL := Determina_TipoMail(rgFormato.ItemIndex);
    // Es HARDCODE esta línea debido a que no se tiene un catalogo de Aplicaciones
    CrEmaDat.m_strTituloAplicacion := C_TITULO;

    CrEmaDat.ShowWindow(ftCaptura);
   Finally
    If Assigned(CrEmaDat) Then CrEmaDat.Free;
    RefreshData;
   End;
end;

procedure TWCrNotificacion.MuestraModificaEmailDatos(nID_PERSONA : Integer; strID_TIPO_PERSONA : String);
var CrEmaDat : TCrEmaDat;
begin
 CrEmaDat := TCrEmaDat.Create(Self);
 If Assigned(CrEmaDat) Then
  Try
   CrEmaDat.GetParams(Objeto);
   CrEmaDat.ParamCre := Objeto.ParamCre;
   // FJR 20.07.2012 CrEmaDat.FindKey([C_CVE_NOTIFICACION_CESIONES, nID_PERSONA, strID_TIPO_PERSONA]);
   CrEmaDat.FindKey([Determina_TipoMail(rgFormato.ItemIndex), nID_PERSONA, strID_TIPO_PERSONA]);
   CrEmaDat.m_strTituloAplicacion := C_TITULO;
   CrEmaDat.Catalogo;
  Finally
   CrEmaDat.Free;
   RefreshData;
  End;
end;

function TWCrNotificacion.CesionNotificada : Boolean;

 procedure CreateStpCesionNotificada(var StoredProc : TStoredProc);
 begin
  StoredProc := TStoredProc.Create(Self);
  If Assigned(StoredProc) Then
  With StoredProc Do
   Begin
    DataBaseName := Objeto.DataBaseName;
    SessionName  := Objeto.SessionName;
    StoredProcName := 'PKGCRPERIODO.STPCESIONNOTIFICADA';
    Params.Clear;
    Params.CreateParam(ftFloat,'PEID_CREDITO',ptInput);
    Params.CreateParam(ftDateTime,'PEF_ENVIO',ptInput);
    Params.CreateParam(ftString,'PSENVIADO',ptOutput);
    Params.CreateParam(ftDateTime,'PSFH_ENVIO',ptOutput);
    Params.CreateParam(ftString,'PSDESTINATARIO',ptOutput);
   End;
 end;

var StpCesionNotificada : TStoredProc;
begin
 Result := False;
 CreateStpCesionNotificada(StpCesionNotificada);
 If Assigned(StpCesionNotificada) Then
  With StpCesionNotificada Do
   Try
    ParamByName('PEID_CREDITO').AsFloat := Objeto.CESION.ID_CESION.AsInteger;
    ParamByName('PEF_ENVIO').AsDateTime := Objeto.Apli.DameFechaEmpresaDia('D000');
    ExecProc;

    If (ParamByName('PSENVIADO').AsString = CVERDAD) Then
     Begin
     ShowMessage('La Cesión '+IntToStr(Objeto.CESION.ID_CESION.AsInteger)+' ya fué notificada '+
                 FormatDateTime('"el día "dddd dd" de "mmmm " del " yyyy" a las "hh:nn:ss" hrs."',ParamByName('PSFH_ENVIO').AsDateTime)+#13#10+
                 'Y fué notificada a los siguiente(s) correo(s): '#13#10+ParamByName('PSDESTINATARIO').AsString);
     End;
    MuestraCesionNotificada := (ParamByName('PSENVIADO').AsString = CVERDAD);
    Result := MuestraCesionNotificada;
   Finally
    Params.Clear;
    Free;
   End;
end;

function TWCrNotificacion.Make_Body_Email_Documentos(nID_CESION : Integer) : String;
var Qry : TQuery;
   strBuf, strHeader : String;
   dIMP_NOMINAL, dTOT_IMP_NOMINAL : Extended;
   nCountDocs : Integer;
begin
Result := '';
Qry := TQuery.Create(Self);
If Assigned(Qry) Then
 With Qry Do
  Try
   DataBaseName := Objeto.DataBaseName;
   SessionName  := Objeto.SessionName;
   SQL.Clear;
   SQL.Add(
             // < EASA4011      14.FEB.2007     Req. 2007 - 01 / 010
//           ' SELECT (PF.APELLIDO_PATERNO || '' '' || PF.APELLIDO_MATERNO || '' '' || PF.NOMBRE_PERSONA || PM.NOM_RAZON_SOCIAL) AS NOMBRE,'#13#10+
           ' SELECT (PF.NOMBRE_PERSONA || PM.NOM_RAZON_SOCIAL || '' '' || PF.APELLIDO_PATERNO || '' '' || PF.APELLIDO_MATERNO ) AS NOMBRE,'#13#10+
             //   EASA4011 >/
           '        D.DESC_DOCUMENTO,'#13#10+
           '        CD.ID_DOCUMENTO,'#13#10+
           '        TO_CHAR(CD.F_EMISION,''DD/MM/YYYY'') AS F_EMISION,'#13#10+
           '        TO_CHAR(CCAP.F_VENCIMIENTO,''DD/MM/YYYY'') AS F_VENCIMIENTO,'#13#10+
           '        NVL(CD.IMP_NOMINAL,0) AS IMP_NOMINAL,'#13#10+
           '        M.DESC_MONEDA'#13#10+
           ' FROM CR_CREDITO CC,'#13#10+
           '      CR_CESION CCES,'#13#10+
           '      CR_DOCUMENTO CD,'#13#10+
           '      CR_CAPITAL CCAP,'#13#10+
           '      DOCUMENTO D,'#13#10+
           '      CONTRATO CO,'#13#10+
           '      PERSONA_FISICA PF,'#13#10+
           '      PERSONA_MORAL PM,'#13#10+
           '      MONEDA M'#13#10+
           ' WHERE CC.ID_CREDITO = '+IntToStr(nID_CESION)+#13#10+
           '   AND CD.ID_CESION = CC.ID_CREDITO'#13#10+
           '   AND CD.SIT_DOCUMENTO <> ''CA'' '+
           '   AND CCES.ID_CESION = CC.ID_CREDITO'#13#10+
           '   AND CCAP.ID_CREDITO = CC.ID_CREDITO'#13#10+
           '   AND CCAP.NUM_PERIODO = CD.NUM_PERIODO_DOC'#13#10+
           '   AND CO.ID_CONTRATO = CC.ID_CONTRATO'#13#10+
           '   AND D.CVE_DOCUMENTO (+)= CD.CVE_DOCUMENTO'#13#10+
           '   AND PF.ID_PERSONA (+)= CCES.ID_PROVEEDOR'#13#10+
           '   AND PM.ID_PERSONA (+)= CCES.ID_PROVEEDOR'#13#10+
           '   AND M.CVE_MONEDA = CO.CVE_MONEDA'#13#10
           );
  Open;

  // Crea el Header del Cuerpo del Email
  HeredaValorString(FieldByName('NOMBRE').AsString);

  strHeader :=  {'Empresa Proveedora '+FieldByName('NOMBRE').AsString+}#13#10#13#10+
                'DOCUMENTO DESCONTADO    FOLIO     FECHA EMISIÓN   FECHA VTO.            MONTO        MONEDA';
  // Inicia las variables
  strBuf :='';  dTOT_IMP_NOMINAL := 0; nCountDocs := 0;
  While Not Eof Do
   Begin
   dIMP_NOMINAL := FieldByName('IMP_NOMINAL').AsFloat;
   strBuf := strBuf + format('%17s  %13s  %12s %12s %s %s',
                              [
                               FieldByName('DESC_DOCUMENTO').AsString,
                               FieldByName('ID_DOCUMENTO').AsString,
                               FieldByName('F_EMISION').AsString,
                               FieldByName('F_VENCIMIENTO').AsString,
                               Format(CFORMAT_DINERO,[dIMP_NOMINAL]),
                               FieldByName('DESC_MONEDA').AsString
                              ]
                             )+#13#10;
   dTOT_IMP_NOMINAL := dTOT_IMP_NOMINAL + dIMP_NOMINAL;
   Inc(nCountDocs);
   Next;
   End;

   If (nCountDocs > 0) Then
    Result := strHeader + #13#10#13#10 + strBuf + #13#10+
              'Totales por Disposición '+IntToStr(nID_CESION)+#13#10+
              'Documento(s) Cedido(s) = '+IntToStr(nCountDocs)+#32+
              'Importe Total = ' + Format(CFORMAT_DINERO,[dTOT_IMP_NOMINAL]) + #13#10;
 Finally
  Close; Free;
 End;
end;

function TWCrNotificacion.CLABE(Chequera: String) : String;

 procedure CreateStpDigVerificador(var StoredProc : TStoredProc);
 begin
  StoredProc := TStoredProc.Create(Self);
  If Assigned(StoredProc) Then
  With StoredProc Do
   Begin
    DataBaseName := Objeto.DataBaseName;
    SessionName  := Objeto.SessionName;
    StoredProcName := 'PKGDIGVRF.STPDIGVERIFICADOR';
    Params.Clear;
    Params.CreateParam(ftFloat,'PERefNumerica',ptInput);
    Params.CreateParam(ftString,'PERefAlfNumerica',ptInput);
    Params.CreateParam(ftFloat,'PEIdMetodo',ptInput);
    Params.CreateParam(ftFloat,'PSDigVerificadorN',ptOutput);
    Params.CreateParam(ftString,'PSDigVerificadorV',ptOutput);
    Params.CreateParam(ftFloat,'PSRefDigVrfNum',ptOutput);
    Params.CreateParam(ftString,'PSRefDigVrfVCh',ptOutput);
    Params.CreateParam(ftFloat,'PSResultado',ptOutput);
   End;
 end;
 
var StpDigVerificador: TStoredProc;
    T: String ;
begin
    CreateStpDigVerificador(StpDigVerificador) ;
    With StpDigVerificador Do
     Begin
     ParamByName('PERefNumerica').AsFloat      := StrToFloat('03718000'+Chequera);
     ParamByName('PERefAlfNumerica').AsString  := '03718000'+Chequera;
     ParamByName('PEIdMetodo').AsFloat         := 9 ;
     ExecProc;
     If (ParamByName('PSResultado').AsFloat <> 0) Then
        t:= ''
     Else
        t:= ParamByName('PSRefDigVrfVCh').AsString ;
     end ;

     Result:= '{'+t ;
end ;

function TWCrNotificacion.EnviarEmails : Boolean;

 procedure CreateStpRegistraEmailEnvio(var StoredProc : TStoredProc);
 begin
  StoredProc := TStoredProc.Create(Self);
  If Assigned(StoredProc) Then
  With StoredProc Do
   Begin
    DataBaseName := Objeto.DataBaseName;
    SessionName  := Objeto.SessionName;
    StoredProcName := 'PKGCRPERIODO.STPREGISTRAEMAILENVIO';
    Params.Clear;
    Params.CreateParam(ftFloat,'PEID_CREDITO',ptInput);
    Params.CreateParam(ftString,'PEID_TIPO_EMAIL',ptInput);
    Params.CreateParam(ftString,'PETITULO_FINAL',ptInput);
    Params.CreateParam(ftMemo,'PETEXTO_FINAL',ptInput);
    Params.CreateParam(ftMemo,'PEDESTINATARIO',ptInput);
    Params.CreateParam(ftString,'PECVE_USU_ENVIO',ptInput);
    Params.CreateParam(ftString,'PESIT_ENVIO_EMAIL',ptInput);
    Params.CreateParam(ftString,'PEBCOMMIT',ptInput);
    Params.CreateParam(ftString,'PSTXRESULTADO',ptOutput);
    Params.CreateParam(ftFloat,'PSRESULTADO',ptOutput);
   End;
 end;

 function ObtenEmailDestinatarios : String;
 var I : Integer;
     str, strSep_Email : String;
 begin
  str := ''; strSep_Email := '';
  For I := 1 To strGrdDestinatarios.RowCount-1 Do
   If (strGrdDestinatarios.Cells[C_COL_ENVIA,I] = C_APLICA) Then
    Begin
    str := str + strSep_Email + strGrdDestinatarios.Cells[C_COL_EMAIL,I];
    strSep_Email := C_SEPARATOR_MAIL;
    End;
  Result := str;
 end;



var StpRegistraEmailEnvio : TStoredProc;
    strSit_Envio_Email, strEmailDestinatarios, strEmailDocumentos,
    strTitulo, strEmail, strError, strMessage, strFileName : String;
    bCesEnviada, bValEnviada, bEnviaMailInternet : Boolean;
    FRpNoti : TFRpNoti;
    TextoMail, V: String ;
begin
 CreateStpRegistraEmailEnvio(StpRegistraEmailEnvio);
 bCesEnviada := False; bValEnviada := False;
 Result := False;

 If Assigned(StpRegistraEmailEnvio) Then
  Try
    strEmailDestinatarios := ObtenEmailDestinatarios;
    strEmailDocumentos := Make_Body_Email_Documentos(Objeto.Cesion.ID_CESION.AsInteger);
    strSit_Envio_Email := CSIT_EN;
    If (strEmailDocumentos = '') Then
     Begin
     ShowMessage('ERROR GRAVE... La Cesión no tiene Documentos... Comunicarse con el Área de Sistemas');
     strSit_Envio_Email := CSIT_ER;
     Exit;
     End;

    // Inicializa el StoreProcedure con los Datos más comunes de llenado
    With StpRegistraEmailEnvio Do
     Begin
     ParamByName('PEID_CREDITO').AsInteger     := Objeto.Cesion.ID_CESION.AsInteger;
     ParamByName('PEDESTINATARIO').AsMemo      := strEmailDestinatarios;
     ParamByName('PECVE_USU_ENVIO').AsString   := Objeto.DameUsuario;
     ParamByName('PEBCOMMIT').AsString         := 'V';
     End;

    HeredaValorString(ObtenChequeraEmisor);
    V:= ObtenChequeraEmisor ;
    V:= Copy(V, 2, Length(V)-1) ;
    HeredaValorString(CLABE(V));

    //////////////////////////////////
    // Genera el Mail de Notificación de Cesiones
    // Nota ArmaMail se encuentra definido en la unidad de IntGenCre
    If (ArmaMail(Objeto.Apli,
                 Objeto.Cesion.ID_EMISOR.AsInteger,
                 // FJR 20.07.2012 C_CVE_NOTIFICACION_CESIONES,
                 Determina_TipoMail(rgFormato.ItemIndex) ,
                 edAtencion.Text,
                 strEmailDocumentos,
                 strTitulo,
                 strEmail,
                 strError) <> 0) Then
    Begin
    ShowMessage(strError);
    Exit;
    End;

    // Digitaliza el Documento
    {
    Application.CreateForm(TFRpNoti, FRpNoti);
    If Assigned(FRpNoti) Then
     With (FRpNoti) Do
      Try
       strFileName := ExtractFileDir(Application.ExeName) + '\'+strTitulo+'.pdf';
       qFRpNoti.Page.Orientation := poPortrait;
       qFRpNoti.PrinterSettings.PrinterIndex := InterDigDoc1.SetPrinter;
       qFRpNoti.PrinterSettings.Orientation  := poPortrait;
       InterDigDoc1.FileName := strFileName;
       FillDataToMemo(strEmail);
       qFRpNoti.Print;
      Finally
       FRpNoti.Free;
      End; }

    // Envia el Mail de Notificación
//    bEnviaMailInternet := EnviaMailInternet(Objeto.Apli, strTitulo, '', strEmailDestinatarios, strFileName);
    bEnviaMailInternet := EnviaMailInternet(Objeto.Apli, strTitulo, strEmail, strEmailDestinatarios);
    If Not bEnviaMailInternet Then
     Begin
     strSit_Envio_Email  := CSIT_ER;
     ShowMessage('ERROR en la comunicación, para poder enviar el Email de Notificación de Cesiones'#13#10+
                 'Vuelva a intentarlo otra vez ó mas tarde...');
     End;

    // Guarda el Registro de que el EMAIL de Notificacion de Cesiones fué enviado
    With StpRegistraEmailEnvio Do
     Begin
     // FJR 20.07.2012 ParamByName('PEID_TIPO_EMAIL').AsString   := C_CVE_NOTIFICACION_CESIONES;
     ParamByName('PEID_TIPO_EMAIL').AsString   := Determina_TipoMail(rgFormato.ItemIndex);
     ParamByName('PETITULO_FINAL').AsString    := strTitulo;
     ParamByName('PETEXTO_FINAL').AsMemo       := strEMail;
     ParamByName('PESIT_ENVIO_EMAIL').AsString := strSit_Envio_Email;
     ExecProc;
     If (ParamByName('PSRESULTADO').AsFloat <> 0) Then ShowMessage(ParamByName('PSTXRESULTADO').AsString)
     Else bCesEnviada := True;
     End;

    ///////////////////////////////////////////////////
    // Si no fué enviado el Mensaje entonces termina...
    If Not bEnviaMailInternet Then Exit;

    HeredaValorString(ObtenChequeraEmisor);
    V:= ObtenChequeraEmisor ;
    V:= Copy(V, 2, Length(V)-1) ;
    HeredaValorString(CLABE(V));

     If chkGenValidacion.Checked Then
      Begin
        //////////////////////////////////
        // Genera el Mail de Validacion
        // Nota ArmaMail se encuentra definido en la unidad de IntGenCre
        If (ArmaMail(Objeto.Apli,
                     Objeto.Cesion.ID_EMISOR.AsInteger,
                     C_CVE_NOTIFICACION_VALIDACION,
                     edAtencion.Text,
                     strEmailDocumentos,
                     strTitulo,
                     strEmail,
                     strError) <> 0) Then
        Begin
        ShowMessage(strError);
        Exit;
        End;

        // Digitaliza el Documento
        {
        Application.CreateForm(TFRpNoti, FRpNoti);
        If Assigned(FRpNoti) Then
         With (FRpNoti) Do
          Try
           strFileName := ExtractFileDir(Application.ExeName) + '\'+strTitulo+'.pdf';
           qFRpNoti.Page.Orientation := poPortrait;
           qFRpNoti.PrinterSettings.PrinterIndex := InterDigDoc1.SetPrinter;
           qFRpNoti.PrinterSettings.Orientation  := poPortrait;
           InterDigDoc1.FileName := strFileName;
           FillDataToMemo(strEmail);
           qFRpNoti.Print;
          Finally
           FRpNoti.Free;
          End;
        }  
          
        // Envia el Mail de Validación
        // bEnviaMailInternet := EnviaMailInternet(Objeto.Apli, strTitulo, '', strEmailDestinatarios, strFileName);
        bEnviaMailInternet := EnviaMailInternet(Objeto.Apli, strTitulo, strEmail, strEmailDestinatarios);

        If Not bEnviaMailInternet Then
         Begin
         strSit_Envio_Email  := CSIT_ER;
         ShowMessage('ERROR en la comunicación, para poder enviar el Email de Validación de Cesiones'#13#10+
                     'Vuelva a intentarlo de una vez o más tarde...');
         End;

        // Guarda el Registro de que el EMAIL de Validacion de Cesiones fué enviado
        With StpRegistraEmailEnvio Do
         Begin
         ParamByName('PEID_TIPO_EMAIL').AsString   := C_CVE_NOTIFICACION_VALIDACION;
         ParamByName('PETITULO_FINAL').AsString    := strTitulo;
         ParamByName('PETEXTO_FINAL').AsMemo       := strEMail ;
         ParamByName('PESIT_ENVIO_EMAIL').AsString := strSit_Envio_Email;
         ExecProc;
         If (ParamByName('PSRESULTADO').AsFloat <> 0) Then ShowMessage(ParamByName('PSTXRESULTADO').AsString)
         Else bValEnviada := True;
         End;
      End;

      ///////////////////////////////////////////////////
      // Si no fué enviado el Mensaje entonces termina...
      If Not bEnviaMailInternet Then Exit;

     If (bCesEnviada And bValEnviada And chkGenValidacion.Checked)
        Or (bCesEnviada And Not chkGenValidacion.Checked) Then
      Begin
        strMessage := 'El Mail de "Notificación de Cesiones" ';
        If bCesEnviada And bValEnviada Then
         strMessage := strMessage+' y el Mail de "Validación" fueron enviados'#13#10
        Else
         strMessage := strMessage+' fué enviado'#13#10;
        ShowMessage(strMessage+' a los siguientes destinatarios...'#13#10+strEmailDestinatarios);
        Result := True;
      End
     Else
      ShowMessage('ERROR al enviar los emails...');

  Finally
    StpRegistraEmailEnvio.Params.Clear;
    StpRegistraEmailEnvio.Free;
  End;
end;

// Implementation of Events

procedure TWCrNotificacion.btnAddDestinatariosClick(Sender: TObject);
var CrEmaEmi : TCrEmaEmi;
begin
 CrEmaEmi := TCrEmaEmi.Create(Self);
 If Assigned(CrEmaEmi) Then
   Try
    CrEmaEmi.GetParams(Objeto);
    If IsInteger(edId_Emisor.Text) Then
      Begin
      CrEmaEmi.m_nDefaultID_EMISOR := StrToInt(edId_Emisor.Text);
{ROIM 17/01/2007  SE ACTUALIZA CAMBIO DE LLAVE A TABLA DE EMISOR}
//      CrEmaEmi.m_StrDefaultCVE_EMISOR_NAFIN := edCVE_EMISOR_NAFIN.Text;
      CrEmaEmi.m_StrDefaultCVE_EMISOR_EXT := edCVE_EMISOR_NAFIN.Text;
      CrEmaEmi.m_CVE_FND_ENT_DES := Objeto.Cesion.CVE_FND_ENT_DES.AsString;
{/ROIM}
      End;
    CrEmaEmi.ParamCre := Objeto.ParamCre;
    CrEmaEmi.ShowWindow(ftCaptura);
   Finally
    If Assigned(CrEmaEmi) Then CrEmaEmi.Free;
    RefreshData;    
   End;
end;

procedure TWCrNotificacion.ShowData;
begin
 With Objeto Do
  Begin
  edNom_Emisor.Text := ObtenNombrePersona(Cesion.ID_EMISOR.AsInteger);
  edNom_Proveedor.Text := ObtenNombrePersona(Cesion.ID_PROVEEDOR.AsInteger);
{ROIM 10042007 CAMBIO ENTIDAD DESCONTADORA}
//  edID_PROV_NAFINSA.Text := IntToStr(ObtenIdProveedorNAFIN(Cesion.ID_PROVEEDOR.AsInteger));
  edID_PROV_NAFINSA.Text := IntToStr(ObtenIdProveedorNAFIN(Cesion.ID_PROVEEDOR.AsInteger,Cesion.CVE_FND_ENT_DES.AsString));
{/ROIM}
  lblEmisorDestinatarios.Caption := edNom_Emisor.Text;
  RefreshData;
  End;
end;

procedure TWCrNotificacion.ClearData;
begin
  edNom_Emisor.Text    := '';
  edNom_Proveedor.Text := '';
  edID_PROV_NAFINSA.Text := '';
  lblEmisorDestinatarios.Caption := '';
  ClearGrid(strGrdRepresentantes);
  ClearGrid(strGrdTestigos);
  ClearGrid(strGrdDestinatarios);
  strGrdRepresentantes.RowCount := 2;
  strGrdTestigos.RowCount := 2;
  strGrdDestinatarios.RowCount := 2;
  edAtencion.Text:= '';
end;

procedure TWCrNotificacion.btnID_PERSONAClick(Sender: TObject);
var bEncontrado : Boolean;
begin
With Objeto Do
  Begin
  //bEncontrado := Cesion.Busca;
  bEncontrado := Busca;
  If bEncontrado Then
  begin
     edID_CESION.Text:=Objeto.Cesion.ID_CESION.AsString;
     ShowData;
  end
  Else ClearData;
  EnableGroupBox(bEncontrado);
  CesionNotificada;
  End;
end;

procedure TWCrNotificacion.RefreshData;
begin
 If vgSIT_REPRESENTANTES = '' Then
    vgSIT_REPRESENTANTES := CSIT_AC ;
 If vgSIT_TESTIGOS = '' Then
    vgSIT_TESTIGOS := CSIT_AC ;
 FillDataGrid_RepTest(strGrdRepresentantes, vgSIT_REPRESENTANTES, C_REPRESENTANTE,C_TIT_REPR,C_CARGO);
 FillDataGrid_RepTest(strGrdTestigos, vgSIT_TESTIGOS, C_TESTIGO,C_TIT_TEST,C_CARGO);
 FillDataDestinatarios(strGrdDestinatarios);
end;

procedure TWCrNotificacion.strGrdDestinatariosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 Case Key Of
  32 : InvertCheck((Sender As TStringGrid),0,(Sender As TStringGrid).Row);
 End;
 EdAtencion.Text := ALaAtencionDe ;
end;

procedure TWCrNotificacion.strGrdDestinatariosMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var nCol, nRow : LongInt;
begin
 With (Sender As TStringGrid) Do
  Begin
  MouseToCell(X,Y,nCol, nRow);
  If (nCol = 0) And (nRow > 0) Then
   InvertCheck((Sender As TStringGrid),0,nRow);
  End;
  EdAtencion.Text := ALaAtencionDe ;
end;

procedure TWCrNotificacion.strGrdDestinatariosDblClick(Sender: TObject);
begin
 MuestraModificaEmailEmisor;
 EdAtencion.Text := ALaAtencionDe ;
end;

procedure TWCrNotificacion.btnAddRepresentantesClick(Sender: TObject);
begin
 MuestraAgregarEmailDatos(C_REPRESENTANTE);
end;

procedure TWCrNotificacion.btnAddTestigosClick(Sender: TObject);
begin
 MuestraAgregarEmailDatos(C_TESTIGO);
end;

procedure TWCrNotificacion.ILID_CESIONEjecuta(Sender: TObject);
var bEncontrado : Boolean;
begin
 With Objeto Do
  Begin
  bEncontrado := Cesion.FindKey([ILID_CESION.Buffer]);
  If bEncontrado Then ShowData
  Else ClearData;
  EnableGroupBox(bEncontrado);
  CesionNotificada;
  End;
end;


procedure TWCrNotificacion.strGrdRepresentantesDblClick(Sender: TObject);
var str : String;
begin
 str := strGrdRepresentantes.Cells[C_COL_PERSONA, strGrdRepresentantes.Row];
 If IsInteger(str) Then
  MuestraModificaEmailDatos(StrToInt(str),C_REPRESENTANTE);
end;

procedure TWCrNotificacion.strGrdTestigosDblClick(Sender: TObject);
var str : String;
begin
 str := strGrdTestigos.Cells[C_COL_PERSONA, strGrdTestigos.Row];
 If IsInteger(str) Then
  MuestraModificaEmailDatos(StrToInt(str),C_TESTIGO);
end;

procedure TWCrNotificacion.bntEnviaEmailsClick(Sender: TObject);
var I, nCount : Integer;
begin
 // FJR 20.07.2012 Valida que se elija el formato de envio, aunque por default es el antiguo
 // Verifica que el campo de Atención haya sido llenado previamente
 If (rgFormato.ItemIndex = -1) Then
  If MessageDlg('No se ha elegido el formato del correo... ¿Desea enviarlo con formato default (anterior)...?',
     mtConfirmation,[mbYes,mbNo],0) = mrNo Then Exit;

 // Verifica que el campo de Atención haya sido llenado previamente
 If (Trim(edAtencion.Text) = '') Then
  If MessageDlg('No se ha llenado el Campo de Atención... ¿Desea enviarlo sin la Atención...?',
     mtConfirmation,[mbYes,mbNo],0) = mrNo Then Exit;

 //  Si la Cesión ya fué Notificada entonces...
 If CesionNotificada Then
  If MessageDlg('¿Desea Notificarla la Cesión '+IntToStr(Objeto.Cesion.ID_CESION.AsInteger)+' de todas formas?',
                mtConfirmation,[mbYes,mbNo],0) = mrNo Then Exit;

 // Verifica que por lo menos haya un destinatario para poder envíar la Notificación
 nCount := 0;
 With strGrdDestinatarios Do
  For I := 0 To RowCount-1 Do
   If (Cells[C_COL_ENVIA,I] = C_APLICA) Then
    Inc(nCount);

 // Existe por lo menos un destinatario para envíar
 If (nCount > 0) Then
  Begin
  // Envia los correos a sus repectivos destinatarios
  If EnviarEmails Then
   MuestraCesionNotificada := True;
  End
 Else
  Begin
  ShowMessage('Para poder enviar la "Notificación de Cesiones" debe de Indicar por lo menos un Destinatario...');
  If strGrdDestinatarios.CanFocus Then strGrdDestinatarios.SetFocus;
  End;
end;

procedure TWCrNotificacion.strGrdDestinatariosDrawCell(Sender: TObject;
  ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var Bmp : TBitmap;
begin
 With (Sender As TStringGrid) Do
 If (ACol = 0) And (ARow > 0) Then
   Begin
   Bmp := TBitmap.Create;
   If Assigned(Bmp) Then
    Begin

    If (Cells[0,ARow] = C_APLICA) Then ImgList.GetBitmap(1,Bmp)
    Else ImgList.GetBitmap(0,Bmp);
    Canvas.Draw(Rect.Left,Rect.Top,Bmp);

    Bmp.FreeImage;
    Bmp.Free;
    End;
   End;
end;


procedure TWCrNotificacion.ImpresionNotificacion(bPreview : Boolean);
var strEmailDocumentos, strTitulo,
    strEmailNotificacion, strEmailValidacion, strError, V  : String;
    ReportPreview : TIntQRPreview;
    FRpNoti : TFRpNoti;
begin
 // Genera Correo de Notificación
  strEmailDocumentos := Make_Body_Email_Documentos(Objeto.Cesion.ID_CESION.AsInteger);
    HeredaValorString(ObtenChequeraEmisor);
    V:= ObtenChequeraEmisor ;
    V:= Copy(V, 2, Length(V)-1) ;
    HeredaValorString(CLABE(V));
  If (ArmaMail(Objeto.Apli,
               Objeto.Cesion.ID_EMISOR.AsInteger,
               // FJR 20.07.2012 C_CVE_NOTIFICACION_CESIONES,
               Determina_TipoMail(rgFormato.ItemIndex),
               edAtencion.Text,
               strEmailDocumentos,
               strTitulo,
               strEmailNotificacion,
               strError) <> 0) Then
  Begin
  ShowMessage(strError);
  Exit;
  End;

 // Genera Correo de Validación
  If chkGenValidacion.Checked Then
     Begin
      strEmailDocumentos := Make_Body_Email_Documentos(Objeto.Cesion.ID_CESION.AsInteger);
    HeredaValorString(ObtenChequeraEmisor);
    V:= ObtenChequeraEmisor ;
    V:= Copy(V, 2, Length(V)-1) ;
    HeredaValorString(CLABE(V));
      If (ArmaMail(Objeto.Apli,
                   Objeto.Cesion.ID_EMISOR.AsInteger,
                   C_CVE_NOTIFICACION_VALIDACION,
                   edAtencion.Text,
                   strEmailDocumentos,
                   strTitulo,
                   strEmailValidacion,
                   strError) <> 0) Then
      Begin
      ShowMessage(strError);
      Exit;
      End;
     End;

  // Despliega el Reporte para Impresión
  ReportPreview := Nil;
  Application.CreateForm(TFRpNoti, FRpNoti);
  If Assigned(FRpNoti) Then
   With (FRpNoti) Do
    Try
     ReportPreview := TIntQRPreview.CreatePreview(Application, FRpNoti.qFRpNoti);
     If opManual.Checked Then qFRpNoti.PrinterSettings.OutputBin := Manual
     Else qFRpNoti.PrinterSettings.OutputBin := Auto;
     qFRpNoti.Page.Orientation := poPortrait;
     qFRpNoti.PrinterSettings.Orientation := poPortrait;

     FillDataToMemo(strEmailNotificacion);
     If bPreview Then qFRpNoti.Preview
     Else qFRpNoti.Print;

     If chkGenValidacion.Checked Then
      Begin
      FillDataToMemo(strEmailValidacion);
      If bPreview Then qFRpNoti.Preview
      Else qFRpNoti.Print;
      End;

    Finally
     If Assigned(ReportPreview) Then ReportPreview.Free;
     FRpNoti.Free;
    End;
end;

procedure TWCrNotificacion.InterForma1BtnImprimirClick(Sender: TObject);
begin
 ImpresionNotificacion(False);
end;

procedure TWCrNotificacion.InterForma1BtnPreviewClick(Sender: TObject);
begin
 ImpresionNotificacion(True);
end;

procedure TWCrNotificacion.tbstRepresentantesChange(Sender: TObject;
  NewTab: Integer; var AllowChange: Boolean);
begin
  If (NewTab = 0) Then
   vgSIT_REPRESENTANTES := CSIT_AC
  Else
   vgSIT_REPRESENTANTES := CSIT_CA;
  FillDataGrid_RepTest(strGrdRepresentantes, vgSIT_REPRESENTANTES, C_REPRESENTANTE,C_TIT_REPR,C_CARGO);
end;

procedure TWCrNotificacion.tbStGrdTestigosChange(Sender: TObject;
  NewTab: Integer; var AllowChange: Boolean);
begin
  If (NewTab = 0) Then
   vgSIT_TESTIGOS := CSIT_AC
  Else
   vgSIT_TESTIGOS := CSIT_CA;
  FillDataGrid_RepTest(strGrdTestigos, vgSIT_TESTIGOS, C_TESTIGO,C_TIT_TEST,C_CARGO);
end;

procedure TWCrNotificacion.rgFormatoClick(Sender: TObject);
begin
   RefreshData ;  //FJR 20.07.2012
end;

end.

