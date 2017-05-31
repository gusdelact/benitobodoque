// Sistema         : Clase de CrNotFact
// Fecha de Inicio : 14/08/2012
// Función forma   : Clase de CrNotFact
// Desarrollo por  : MACV. Class Maker.
// Diseñado por    :
// Comentarios     :
Unit IntCrnotfact;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
IntFrm,DB, DbTables, Mask, StdCtrls, Buttons, ExtCtrls, InterFor,
IntFind,UnSQL2, InterFun, ComCtrls, IntDtPk, Grids,

IntParamCre, IntLinkit, IntGenCre, IntCrEmaEmi, IntCrEmaDat,
ImgList, DBCtrls, InterApl, IntQRPreview, QRPrntr, Printers, Tabs;

const
  C_CARGO = 'Cargo';
  C_TITULO = 'Notificación de Documentos';
  C_TIT_ENVIA  = 'Enviar Mail';
  C_TIT_REPR   = 'Nombre de los Representantes';
  C_TIT_EMAIL  = 'Correo Electrónico (email)';
  C_TIT_NOMBRE = 'Nombre del Destinatario';
  C_TIT_PERSONA = 'Id. Persona';
  C_TIT_SIT    = 'Situación';

  CO_TIT_EPO1 = 'Cve_Epo';
  CO_TIT_DOC1 = 'Documento';
  CO_TIT_ACU1 = 'Folio Acuse';
  CO_TIT_RFC1 = 'RFC Pyme';
  CO_TIT_NOM1 = 'Nombre Pyme';
  CO_TIT_SIT1 = 'Sit.';

  CO_COL_EPO1 = 0;
  CO_COL_DOC1 = 1;
  CO_COL_ACU1 = 2;
  CO_COL_RFC1 = 3;
  CO_COL_NOM1 = 4;
  CO_COL_SIT1 = 5;
  CO_COL_MOD1 = 6;  
                          
  C_COL_ENVIA  = 0;
  C_COL_EMAIL  = 1;
  C_COL_NOMBRE = 2;
  C_COL_SIT    = 3;
  C_COL_PERSONA = 0;
  C_COL_NOM_DAT = 1;
  C_COL_CARGO = 2;
  C_APLICA = '1';
  C_NOAPLICA = '0';

  CO_COL_EPO = 0;
  CO_COL_DOC = CO_COL_EPO + 1;
  CO_COL_ACU = CO_COL_DOC + 1;
  CO_COL_RFC = CO_COL_ACU + 1;
  CO_COL_NOM = CO_COL_RFC + 1;
  CO_COL_SIT = CO_COL_NOM + 1;


Type
 TCrnotfact= class;

  TWCrnotfact = Class(TForm)
    InterForma1 : TInterForma;
    grbxData: TGroupBox;
    Label6: TLabel;
    edAtencion: TEdit;
    strGrdDestinatarios: TStringGrid;
    ImgList: TImageList;
    strGrdRepresentantes: TStringGrid;
    lblRepresentantes: TLabel;
    Bevel2: TBevel;
    lblDestinatarios: TLabel;
    Bevel1: TBevel;
    Bevel4: TBevel;
    lblEmisorDestinatarios: TLabel;
    StringGridDat: TStringGrid;
    Label1: TLabel;
    Bevel3: TBevel;
    bntEnviaEmails: TButton;
    procedure FormShow(Sender : TObject);
    procedure ConfGrid( SGrid : TStringGrid );
    procedure FormClose(Sender : TObject; var Action : TCloseAction);
    procedure FormDestroy(Sender : TObject);
    procedure strGrdDestinatariosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strGrdDestinatariosMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure bntEnviaEmailsClick(Sender: TObject); 
    procedure strGrdDestinatariosDrawCell(Sender: TObject; ACol,
      ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure InterForma1BtnImprimirClick(Sender: TObject);
    procedure InterForma1BtnPreviewClick(Sender: TObject);

    procedure EjecutaProceso(pApli : TInterApli; PFechaCierre : TDate);    

    private
    { Private declarations }
     m_bMuestraCesionNotificada  : Boolean;
     vgSIT_REPRESENTANTES : String;


     procedure ShowData;
     procedure ClearData;
     procedure FillDataGrid_RepTest(StrGrd : TStringGrid; strSITUACION, strID_TIPO_PERSONA, strTitleCol1, strTitleCol2 : String; pApli : TInterApli);
     procedure FillDataDestinatarios(StrGrd: TStringGrid; strCveUsuM : String; pApli : TInterApli);
     procedure FillDataDatos(StrGrd: TStringGrid; strCveUsu : String; pApli : TInterApli);
     procedure EnableGroupBox(bEnabled : Boolean);
     procedure InvertCheck(StrGrd: TStringGrid; nCol, nRow: Integer);
     procedure RefreshData;
     procedure MuestraModificaEmailDatos(nID_PERSONA : Integer; strID_TIPO_PERSONA : String);
     procedure MuestraAgregarEmailDatos(strID_TIPO_PERSONA : String);
     function  Make_Body_Email_Documentos(nID_CESION : Integer; strCveUsuMo :String; pApli : TInterApli) : String;
     function  EnviarEmails(pApli : TInterApli) : Boolean;
     function  ALaAtencionDe: String ;
     procedure ImpresionNotificacion(bPreview : Boolean);


    public
    { Public declarations }
    Objeto : TCrnotfact;
    end;
 TCrnotfact= class(TInterFrame)
      private
      protected

      public
        { Public declarations }
        ParamCre    : TParamCre;
        function    Envio (TipoFormato: Integer): Boolean;
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
     vlCVE_USU_MODIFICA : String;


implementation

uses IntRpNoti;
{$R *.DFM}

constructor TCrnotfact.Create( AOwner : TComponent );
begin Inherited;
      StpName  := ' ';
      UseQuery := False;
      HelpFile := 'InTCrnotfact.Hlp';
      ShowMenuReporte:=True;

end;

Destructor TCrnotfact.Destroy;
begin inherited;
end;


function TCrnotfact.ShowWindow(FormaTipo:TFormaTipo):Integer;
var W : TWCrnotfact;
begin
   W:=TWCrnotfact.Create(Self);
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


Function TCrnotfact.InternalBusca:Boolean;
Var T:TInterFindit;
begin InternalBusca := False;
      T := CreaBuscador('ICrNotif.it','');
      Try if Active then begin end;
          if T.Execute then InternalBusca:= FindKey([]);
      finally  T.Free;
      end;
end;

function TCrnotfact.Reporte:Boolean;
begin Result := False;
end;

function TCrnotfact.Envio(TipoFormato: Integer): Boolean;
var W : TWCrnotfact;

begin
   W:=TWCrnotfact.Create(Self);
   try
      W.Objeto:= Self;
      W.ShowData ;
      W.EnableGroupBox(true);
      //W.bntEnviaEmailsClick(Self);
      Result:= W.EnviarEmails(Apli);
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

Function TWCrnotfact.ALaAtencionDe: String ;
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


procedure TWCrnotfact.FormShow(Sender: TObject);
begin
 With Objeto Do
  Begin
  vgSIT_REPRESENTANTES := CSIT_AC;
  End;
end;

procedure TWCrnotfact.FormDestroy(Sender: TObject);
begin
 With Objeto Do
  Begin

  End;
end;

procedure TWCrnotfact.FormClose(Sender: TObject; var Action: TCloseAction);
begin Action := caFree;
end;

// Implementation Of Procedures

procedure TWCrnotfact.FillDataGrid_RepTest(StrGrd : TStringGrid;
          strSITUACION, strID_TIPO_PERSONA, strTitleCol1, strTitleCol2 : String; pApli : TInterApli);
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
     DataBaseName := pApli.DataBaseName;
     SessionName := pApli.SessionName;

     SQL.Clear;
     SQL.Add(
             ' SELECT'+coCRLF+
             '       CED.ID_PERSONA,'+coCRLF+
             '       ( PF.NOMBRE_PERSONA || '' '' || PF.APELLIDO_PATERNO || '' '' || PF.APELLIDO_MATERNO ) AS NOMBRE,'+coCRLF+
             '       P.NOMBRE_PUESTO AS CARGO'+coCRLF+
             '  FROM CR_EMAIL_DATOS CED,'+coCRLF+
             '       PERSONA_FISICA PF,'+coCRLF+
             '       EMPLEADO E,'+coCRLF+
             '       PUESTO P'+coCRLF+
             ' WHERE CED.ID_TIPO_EMAIL = ''NOTFAC'''+coCRLF+
             '   AND CED.ID_TIPO_PERSONA = ''RE'''+coCRLF+ 
             '   AND CED.SIT_EMAIL_DATOS = '+SQLStr(strSITUACION)+coCRLF+
             '   AND PF.ID_PERSONA = CED.ID_PERSONA'+coCRLF+
             '   AND E.ID_PERSONA = PF.ID_PERSONA'+coCRLF+
             '   AND P.CVE_PUESTO = E.CVE_PUESTO'+coCRLF+
             ' ORDER BY NOMBRE'+coCRLF
             );
     Open;
     SQL.SaveToFile('C:\Represent.SQL');
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
   Finally
     Close; Free;
   End;
end;

procedure TWCrnotfact.FillDataDestinatarios(StrGrd: TStringGrid; strCveUsuM : String; pApli : TInterApli);
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
     DataBaseName := pApli.DataBaseName;
     SessionName := pApli.SessionName;

     SQL.Clear;

     if strCveUsuM = '' then
     begin
     SQL.Add(
            ' SELECT e_mail, nombre, sit_contrato'#13#10+
            '    FROM net_contrato'#13#10+
            '   WHERE cve_usuario IN (SELECT DISTINCT (cve_usu_modifica)'#13#10+
            '                           FROM cr_fe_documento)'#13#10
             );
     end
     else
          SQL.Add(
            ' SELECT e_mail, nombre, sit_contrato'#13#10+
            '    FROM net_contrato'#13#10+
            '   WHERE cve_usuario IN (SELECT DISTINCT (cve_usu_modifica)'#13#10+
            '                           FROM cr_fe_documento'#13#10+
            '                          where cve_usu_modifica ='''+strCveUsuM+''')'#13#10
             );

     Open;
     SQL.SaveTofile('c:\destinatarios.sql') ;
     ClearGrid(StrGrd);
     StrGrd.RowCount := 255;
     nRow := 1;
     While Not Eof Do
      Begin
      If (FieldByName('SIT_CONTRATO').AsString = CSIT_AC) Then StrGrd.Cells[C_COL_ENVIA ,nRow] := C_APLICA
      Else StrGrd.Cells[C_COL_ENVIA ,nRow] := C_NOAPLICA;
      StrGrd.Cells[C_COL_EMAIL ,nRow] := FieldByName('e_mail').AsString;
      StrGrd.Cells[C_COL_NOMBRE,nRow] := FieldByName('nombre').AsString;
      Application.ProcessMessages;
      Next;
      Inc(nRow);
      End;

     If (nRow < 2) Then StrGrd.RowCount := 2
     Else StrGrd.RowCount := nRow;

     edAtencion.Text:= ALaAtencionDe;
   Finally
     Close; Free;
   End;
end;

procedure TWCrnotfact.FillDataDatos(StrGrd: TStringGrid; strCveUsu : String; pApli : TInterApli);
var Qry : TQuery;
    nRow : Integer;
begin
  StrGrd.Cells[CO_COL_EPO1 ,0] :=  CO_TIT_EPO1;
  StrGrd.Cells[CO_COL_DOC1 ,0] :=  CO_TIT_DOC1;
  StrGrd.Cells[CO_COL_ACU1 ,0] :=  CO_TIT_ACU1;
  StrGrd.Cells[CO_COL_RFC1 ,0] :=  CO_TIT_RFC1;
  StrGrd.Cells[CO_COL_NOM1 ,0] :=  CO_TIT_NOM1;
  StrGrd.Cells[CO_COL_SIT1 ,0] :=  CO_TIT_SIT1;

 Qry := TQuery.Create(Self);
 If Assigned(Qry) Then
  With Qry Do
   Try
     DataBaseName := pApli.DataBaseName;
     SessionName := pApli.SessionName;

     SQL.Clear;

     if strCveUsu = '' then
     begin
     SQL.Add(
            ' SELECT ID_EPO, CVE_FND_ENT_DES, ID_DOCUMENTO, FOL_ACUSE, RFC_PYME, NOMBRE_PYME, SIT_DOCUMENTO, CVE_USU_MODIFICA'#13#10+
            '   FROM CR_FE_DOCUMENTO'#13#10+
            '  WHERE 1 = 1'#13#10+
            '  ORDER BY ID_DOCUMENTO'#13#10
             );
     end
     else
     SQL.Add(
            ' SELECT ID_EPO, CVE_FND_ENT_DES, ID_DOCUMENTO, FOL_ACUSE, RFC_PYME, NOMBRE_PYME, SIT_DOCUMENTO, CVE_USU_MODIFICA'#13#10+
            '   FROM CR_FE_DOCUMENTO'#13#10+
            '  WHERE 1 = 1'#13#10+
            '    AND CVE_USU_MODIFICA ='''+strCveUsu+''''#13#10+
            '  ORDER BY ID_DOCUMENTO'#13#10
             );

     Open;
     SQL.SaveTofile('c:\Datos.sql') ;
     ClearGrid(StrGrd);
     StrGrd.RowCount := 255;
     nRow := 1;
     While Not Eof Do
      Begin
      StrGrd.Cells[CO_COL_EPO1 ,nRow] := FieldByName('ID_EPO').AsString;
      StrGrd.Cells[CO_COL_DOC1 ,nRow] := FieldByName('ID_DOCUMENTO').AsString;
      StrGrd.Cells[CO_COL_ACU1 ,nRow] := FieldByName('FOL_ACUSE').AsString;
      StrGrd.Cells[CO_COL_RFC1 ,nRow] := FieldByName('RFC_PYME').AsString;
      StrGrd.Cells[CO_COL_NOM1 ,nRow] := FieldByName('NOMBRE_PYME').AsString;
      StrGrd.Cells[CO_COL_SIT1 ,nRow] := FieldByName('SIT_DOCUMENTO').AsString;
      StrGrd.Cells[CO_COL_MOD1 ,nRow] := FieldByName('CVE_USU_MODIFICA').AsString;
      Application.ProcessMessages;
      Next;
      Inc(nRow);
      End;

     If (nRow < 2) Then StrGrd.RowCount := 2
     Else StrGrd.RowCount := nRow;

   Finally
     Close; Free;
   End;
end;

procedure TWCrnotfact.InvertCheck(StrGrd: TStringGrid; nCol, nRow: Integer);
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

procedure TWCrnotfact.EnableGroupBox(bEnabled: Boolean);
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

procedure TWCrnotfact.MuestraAgregarEmaildatos(strID_TIPO_PERSONA : String);
var CrEmaDat : TCrEmaDat;
begin
 CrEmaDat := TCrEmaDat.Create(Self);
 If Assigned(CrEmaDat) Then
   Try
    CrEmaDat.GetParams(Objeto);
    CrEmaDat.ParamCre := Objeto.ParamCre;

    CrEmaDat.m_strDefaultID_TIPO_PERSONA := strID_TIPO_PERSONA;
    CrEmaDat.m_strDefaultID_TIPO_EMAIL := 'NOTFAC';
    CrEmaDat.m_strTituloAplicacion := C_TITULO;

    CrEmaDat.ShowWindow(ftCaptura);
   Finally
    If Assigned(CrEmaDat) Then CrEmaDat.Free;
    RefreshData;
   End;
end;

procedure TWCrnotfact.MuestraModificaEmailDatos(nID_PERSONA : Integer; strID_TIPO_PERSONA : String);
var CrEmaDat : TCrEmaDat;
begin
 CrEmaDat := TCrEmaDat.Create(Self);
 If Assigned(CrEmaDat) Then
  Try
   CrEmaDat.GetParams(Objeto);
   CrEmaDat.ParamCre := Objeto.ParamCre;
   CrEmaDat.m_strTituloAplicacion := C_TITULO;
   CrEmaDat.Catalogo;
  Finally
   CrEmaDat.Free;
   RefreshData;
  End;
end;

function TWCrnotfact.Make_Body_Email_Documentos(nID_CESION : Integer ; strCveUsuMo :String; pApli : TInterApli) : String;
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
   DataBaseName := pApli.DataBaseName;
   SessionName  := pApli.SessionName;

   SQL.Clear;


   if strCveUsuMo = '' then
   begin
   SQL.Add(
           ' SELECT ID_EPO, ID_DOCUMENTO, FOL_ACUSE, NOMBRE_PYME,'#13#10+
 	   '	    SUBSTR((SELECT PKGCRCONSOLIDADO.FUN_NOM_TIT_CRED(ID_EPO) FROM DUAL),1,40) AS EMISOR,'#13#10+
           '        IMP_DOCUMENTO, CVE_USU_MODIFICA'#13#10+
           '   FROM CR_FE_DOCUMENTO'#13#10+
           '  WHERE 1 = 1'#13#10+
           '    AND SIT_DOCUMENTO = ''XD'''#13#10+
           '  ORDER BY ID_DOCUMENTO'#13#10
           );
   end
   else
   SQL.Add(
           ' SELECT ID_EPO, ID_DOCUMENTO, FOL_ACUSE, NOMBRE_PYME,'#13#10+
           '        SUBSTR( (SELECT PKGCRCONSOLIDADO.FUN_NOM_TIT_CRED(ID_EPO)||''                            ''  FROM DUAL),1,40) AS EMISOR,'#13#10+
           '        IMP_DOCUMENTO, CVE_USU_MODIFICA'#13#10+
           '   FROM CR_FE_DOCUMENTO'#13#10+
           '  WHERE 1 = 1'#13#10+
           '    AND SIT_DOCUMENTO = ''NG'''#13#10+
           '    AND CVE_USU_MODIFICA = '''+strCveUsuMo+''''#13#10+
           '  ORDER BY ID_DOCUMENTO'#13#10
           );
  Open;

  // Crea el Header del Cuerpo del Email
  HeredaValorString(FieldByName('NOMBRE_PYME').AsString);


  strHeader :=  #13#10#13#10+
                'EMISOR                                  DOCUMENTO            FOLIO ACUSE            IMPORTE DOCTO.';
  // Inicia las variables
  strBuf :='';  dTOT_IMP_NOMINAL := 0; nCountDocs := 0;
  While Not Eof Do
   Begin
   strBuf := strBuf + format('%0s  %4s  %26s  %20s',
                              [
                               FieldByName('EMISOR').AsString,
                               FieldByName('ID_DOCUMENTO').AsString,
                               FieldByName('FOL_ACUSE').AsString,
                               FormatFloat('###,###,##0.00',StrToFloat(FieldByName('IMP_DOCUMENTO').AsString))
                              ]
                             )+#13#10;
   Inc(nCountDocs);
   Next;
   End;

   If (nCountDocs > 0) Then
    Result := strHeader + #13#10#13#10 + strBuf + #13#10+#13#10+
              'Documento(s): '+IntToStr(nCountDocs)+#32;
 Finally
  Close; Free;
 End;
end;

function TWCrnotfact.EnviarEmails(pApli : TInterApli) : Boolean;

 procedure CreateStpRegistraEmailEnvio(var StoredProc : TStoredProc; pApli : TInterApli);
 begin
  StoredProc := TStoredProc.Create(Self);
  If Assigned(StoredProc) Then
  With StoredProc Do
   Begin
    DataBaseName := pApli.DataBaseName;
    SessionName  := pApli.SessionName;

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
    bCesEnviada, bEnviaMailInternet : Boolean;
    FRpNoti : TFRpNoti;
    TextoMail, V: String ;
begin
  CreateStpRegistraEmailEnvio(StpRegistraEmailEnvio, pApli);
  bCesEnviada := False;
  Result := False;

  If Assigned(StpRegistraEmailEnvio) Then
  Try
     strEmailDestinatarios := ObtenEmailDestinatarios;
     strEmailDocumentos := Make_Body_Email_Documentos(1,vlCVE_USU_MODIFICA, pApli);
     strSit_Envio_Email := CSIT_EN;
            // Inicializa el StoreProcedure con los Datos más comunes de llenado
    With StpRegistraEmailEnvio Do
     Begin
     ParamByName('PEID_CREDITO').AsInteger    := 0;
     ParamByName('PEDESTINATARIO').AsMemo     := strEmailDestinatarios;
     ParamByName('PECVE_USU_ENVIO').AsString  := pApli.Usuario;
     ParamByName('PEBCOMMIT').AsString        := 'V';
     End;

    V:= Copy(V, 2, Length(V)-1) ;

    // Nota ArmaMail se encuentra definido en la unidad de IntGenCre
    If (ArmaMail(pApli,
                 2,// id_emisor
                 'NOTFAC',
                 edAtencion.Text,
                 strEmailDocumentos,
                 strTitulo,
                 strEmail,
                 strError) <> 0) Then
    Begin
//    ShowMessage(strError);
    Exit;
    End;

//    bEnviaMailInternet := EnviaMailInternet(Objeto.Apli, strTitulo, strEmail, strEmailDestinatarios);
    bEnviaMailInternet := EnviaMailInternet(pApli, strTitulo, strEmail, strEmailDestinatarios);
    If Not bEnviaMailInternet Then
     Begin
     strSit_Envio_Email  := CSIT_ER;
     ShowMessage('ERROR en la comunicación, para el envío de Correo'#13#10+
                 'Intente  Nuevamente...'); 
     End;

    // Guarda el Registro de que el EMAIL de Notificacion de Cesiones fué enviado
    With StpRegistraEmailEnvio Do
     Begin
     ParamByName('PEID_TIPO_EMAIL').AsString   := 'NOTFAC';
     ParamByName('PETITULO_FINAL').AsString    := strTitulo;
     ParamByName('PETEXTO_FINAL').AsMemo       := strEMail;
     ParamByName('PESIT_ENVIO_EMAIL').AsString := strSit_Envio_Email;
     ExecProc;
     If (ParamByName('PSRESULTADO').AsFloat <> 0) Then //ShowMessage(ParamByName('PSTXRESULTADO').AsString)
     Else bCesEnviada := True;
     End;

    ///////////////////////////////////////////////////
    // Si no fué enviado el Mensaje entonces termina...
    If Not bEnviaMailInternet Then Exit;

    V:= Copy(V, 2, Length(V)-1) ;

      ///////////////////////////////////////////////////
      // Si no fué enviado el Mensaje entonces termina...
      If Not bEnviaMailInternet Then Exit;

     If bCesEnviada Then
      Begin
{        strMessage := 'El Mail de "Notificación de Cesiones" ';
        strMessage := strMessage+' fué enviado'#13#10;
        ShowMessage(strMessage+' a los siguientes destinatarios...'#13#10+strEmailDestinatarios);
        Result := True;}
      End
     Else
//      ShowMessage('¡ Error al enviar mails... !');

  Finally
    StpRegistraEmailEnvio.Params.Clear;
    StpRegistraEmailEnvio.Free;
  End;
end;

// Implementation of Events

procedure TWCrnotfact.ShowData;
begin
 With Objeto Do
  Begin
  lblEmisorDestinatarios.Caption := 'CORREGIR';
  RefreshData;
  End;
end;

procedure TWCrnotfact.ClearData;
begin
  lblEmisorDestinatarios.Caption := '';
  ClearGrid(strGrdRepresentantes);
  ClearGrid(strGrdDestinatarios);
  ClearGrid(StringGridDat);
  strGrdRepresentantes.RowCount := 2;
  strGrdDestinatarios.RowCount := 2;
  edAtencion.Text:= '';
end;

procedure TWCrnotfact.RefreshData;
begin
 If vgSIT_REPRESENTANTES = '' Then
    vgSIT_REPRESENTANTES := CSIT_AC ;
    FillDataGrid_RepTest(strGrdRepresentantes, vgSIT_REPRESENTANTES, C_REPRESENTANTE, C_TIT_REPR, C_CARGO, Objeto.Apli);
    FillDataDestinatarios(strGrdDestinatarios, '', Objeto.Apli);
    FillDataDatos(StringGridDat, '',Objeto.Apli);
end;

procedure TWCrnotfact.strGrdDestinatariosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 Case Key Of
  32 : InvertCheck((Sender As TStringGrid),0,(Sender As TStringGrid).Row);
 End;
 EdAtencion.Text := ALaAtencionDe ;
end;

procedure TWCrnotfact.strGrdDestinatariosMouseDown(Sender: TObject;
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

procedure TWCrnotfact.bntEnviaEmailsClick(Sender: TObject);
var I, nCount : Integer;
begin
//   EjecutaProceso(Objeto.Apli,Strtodate('07/09/2012'));
end;

procedure TWCrnotfact.strGrdDestinatariosDrawCell(Sender: TObject;
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

procedure TWCrnotfact.InterForma1BtnImprimirClick(Sender: TObject);
begin
 ImpresionNotificacion(False);
end;

procedure TWCrnotfact.InterForma1BtnPreviewClick(Sender: TObject);
begin
 ImpresionNotificacion(True);
end;


procedure TWCrnotfact.ConfGrid(SGrid: TStringGrid);
begin
 With SGrid Do
   Begin
      ColCount := 6;
      RowHeights[0] := DefaultRowHeight;
      RowCount := 1;
      ColWidths[CO_COL_EPO] := 53;
      ColWidths[CO_COL_DOC] := 101;
      ColWidths[CO_COL_ACU] := 144;
      ColWidths[CO_COL_RFC] := 91;
      ColWidths[CO_COL_NOM] := 186;
      ColWidths[CO_COL_SIT] := 30;
    End;
end;  


procedure TWCrnotfact.EjecutaProceso(pApli : TInterApli; PFechaCierre : TDate);
var I, nCount : Integer;
    vlcveusum, vlcveusumact, vlcveusumant : String;
    vlcveusum01, con : Integer;
begin
    nCount := 0;

    try
    If Not pApli.Database.InTransaction Then
           pApli.DataBase.StartTransaction;
     // Query para cambiar a operado (OR) estando XD en CR_FE_DOCUMENTO y (AC) activo en CR_DOCUMENTO.
 RunSQL( ' UPDATE CR_FE_DOCUMENTO' +
         '    SET SIT_DOCUMENTO = ''OR'''+
         '  WHERE FOL_ACUSE IN (' +
         '                      SELECT CFD.FOL_ACUSE' +
         '                        FROM CR_CESION CC,' +
         '                             CR_FE_DOCUMENTO CFD,' +
         '                             RFC  R,' +
         '                             CR_DOCUMENTO CD' +
         '                       WHERE 1=1' +
         '                         AND CC.ID_EMISOR  = CFD.ID_EPO' +
         '                         AND CC.F_AUTORIZA = to_date('''+DateToStr(PFechaCierre)+''',''dd/mm/yyyy'') '+
         '    AND CONCAT(CONCAT(R.SIGLAS_RFC,R.F_RFC),R.HOMOCLAVE_RFC) = CFD.RFC_PYME' +
         '    AND CFD.SIT_DOCUMENTO = ''XD''' +
         '    AND CC.ID_PROVEEDOR   = R.ID_PERSONA' +
         '    AND CD.ID_CESION      = CC.ID_CESION' +
         '    AND CD.ID_DOCUMENTO   = CFD.ID_DOCUMENTO' +
         '    AND CD.SIT_DOCUMENTO  = ''AC'')'
         , pApli.DataBaseName, pApli.SessionName, False);

          If pApli.DataBase.InTransaction Then
             pApli.DataBase.commit;
    except
          If pApli.DataBase.InTransaction Then
             pApli.DataBase.Rollback;
    end;

    try
    If Not pApli.Database.InTransaction Then
           pApli.DataBase.StartTransaction;
     //Query para cambiar a cancelado (CA) estando XD en CR_FE_DOCUMENTO y (CA) cancelado en CR_DOCUMENTO.  Este evento no emite ningún tipo de mensaje.
 RunSQL( ' UPDATE CR_FE_DOCUMENTO' +
         '    SET SIT_DOCUMENTO = ''CA''' +
         '    WHERE FOL_ACUSE IN (' +
         '           SELECT CFD.FOL_ACUSE' +
         '            FROM  CR_CESION CC,' +
         '                  CR_FE_DOCUMENTO CFD,' +
         '                  RFC  R,' +
         '                  CR_DOCUMENTO CD' +
         '            WHERE 1 = 1' +
         '              AND CC.ID_EMISOR  = CFD.ID_EPO' +
//         '              AND CC.F_AUTORIZA = to_date('''+DateToStr(PFechaCierre)+''',''dd/mm/yyyy'') '+
         '              AND CONCAT(CONCAT(R.SIGLAS_RFC,R.F_RFC),R.HOMOCLAVE_RFC) = CFD.RFC_PYME' +
         '              AND CFD.SIT_DOCUMENTO = ''XD''' +
         '              AND CC.ID_PROVEEDOR   = R.ID_PERSONA' +
         '              AND CD.ID_CESION      = CC.ID_CESION' +
         '              AND CD.ID_DOCUMENTO   = CFD.ID_DOCUMENTO' +
         '              AND CD.SIT_DOCUMENTO  in (''CA'',''NA''))'
          , pApli.DataBaseName, pApli.SessionName, False);

          If pApli.DataBase.InTransaction Then
             pApli.DataBase.commit;
    except
          If pApli.DataBase.InTransaction Then
             pApli.DataBase.Rollback;

    end;

    vlcveusum01 := 1;
          vlsql := ' SELECT ID_EPO, CVE_FND_ENT_DES, ID_DOCUMENTO, FOL_ACUSE, RFC_PYME, NOMBRE_PYME, SIT_DOCUMENTO, CVE_USU_MODIFICA'+
                   '   FROM CR_FE_DOCUMENTO'+
                   '  WHERE 1 = 1'+
                   '    AND SIT_DOCUMENTO = ''XD'''+
                   '  ORDER BY CVE_USU_MODIFICA';
      Query1 := GetSQLQuery(vlsql, pApli.DataBaseName, pApli.SessionName, True );

   if Query1 <> nil then
   begin
     while not Query1.EOF do
       begin
          try
             con := 1;
             vlcveusumact := Query1.FieldByName('CVE_USU_MODIFICA').AsString;
             if  (vlcveusumact <> '') AND (vlcveusumact <>  vlcveusumant) AND (vlcveusumant <> '') then
               begin
                  FillDataGrid_RepTest(strGrdRepresentantes, vgSIT_REPRESENTANTES, C_REPRESENTANTE, C_TIT_REPR, C_CARGO, pApli);
                  FillDataDestinatarios(strGrdDestinatarios, vlcveusumant, pApli);
                  FillDataDatos(StringGridDat, vlcveusumant, pApli);
                  EnviarEmails(pApli);
                  vlcveusum01 := 1;
               end;

             IF (vlcveusum01 =1) then
             begin
                if Query1.FieldByName('CVE_USU_MODIFICA').AsString <> '' then
               try
                If Not pApli.Database.InTransaction Then
                       pApli.DataBase.StartTransaction;
                 RunSQL( ' UPDATE CR_FE_DOCUMENTO CFD' +
                         '    SET SIT_DOCUMENTO = ''NG''' +
                         '  WHERE 1 = 1'+
                         '    AND CFD.SIT_DOCUMENTO = ''XD'''+
                         '    AND CVE_USU_MODIFICA  = '''+Query1.FieldByName('CVE_USU_MODIFICA').AsString+''''
                        , pApli.DataBaseName, pApli.SessionName, False);
                       vlCVE_USU_MODIFICA :=  Query1.FieldByName('CVE_USU_MODIFICA').AsString;
                       If pApli.DataBase.InTransaction Then
                     pApli.DataBase.commit;
               except
                  If pApli.DataBase.InTransaction Then
                     pApli.DataBase.Rollback;
               end;


              end;
               vlcveusumant  := vlcveusumact;
               Query1.Next;
               Inc(vlcveusum01);

          finally
        end;
      end;
   end;
//     Query1.Close;
//     Query1.Free;

   IF (con > 0) and (vlcveusumact <> '')  then
     begin
     FillDataGrid_RepTest(strGrdRepresentantes, vgSIT_REPRESENTANTES, C_REPRESENTANTE, C_TIT_REPR, C_CARGO, pApli);
     FillDataDestinatarios(strGrdDestinatarios, vlcveusumant, pApli);
     FillDataDatos(StringGridDat, vlcveusumant, pApli);
     EnviarEmails(pApli);
     end;


     try
     If Not pApli.Database.InTransaction Then
            pApli.DataBase.StartTransaction;
 //Query para cambiar a negociable (NG) estando CR_FE_DOCUMENTO.f_efec_descto = a la fecha de cierre mas un día y con situación 'CS'
 RunSQL( ' UPDATE cr_fe_documento'+
         '    SET sit_documento = ''NG'''+
         '  WHERE 1=1'+
         '    AND sit_documento = ''CS'''+
         '    AND f_efec_descto = to_date('''+DateToStr(PFechaCierre)+''',''dd/mm/yyyy'') + 1'
           , pApli.DataBaseName, pApli.SessionName, False);

          If pApli.DataBase.InTransaction Then
             pApli.DataBase.commit;
     except
          If pApli.DataBase.InTransaction Then
             pApli.DataBase.Rollback;
     end;


     try
     If Not pApli.Database.InTransaction Then
            pApli.DataBase.StartTransaction;
 //Query para cambiar a baja (BA) estando CR_FE_DOCUMENTO.F_VENCIMIENTO_DO < 5 días hábiles y negociable (NG).
 RunSQL( ' UPDATE cr_fe_documento cfd'+
         '     SET sit_documento = ''VS'''+
         '        WHERE 1 = 1'+
         '    AND cfd.sit_documento = ''NG'''+
         '    AND cfd.f_vencimiento_do - to_date('''+DateToStr(PFechaCierre)+''',''dd/mm/yyyy'') < 5 '
           , pApli.DataBaseName, pApli.SessionName, False);

          If pApli.DataBase.InTransaction Then
             pApli.DataBase.commit;
     except
          If pApli.DataBase.InTransaction Then
             pApli.DataBase.Rollback;
     end;
end;


procedure TWCrnotfact.ImpresionNotificacion(bPreview: Boolean);
var strEmailDocumentos, strTitulo,
    strEmailNotificacion, strEmailValidacion, strError, V  : String;
    ReportPreview : TIntQRPreview;
    FRpNoti : TFRpNoti;
begin
 // Genera Correo de Notificación
    strEmailDocumentos := Make_Body_Email_Documentos(1,vlCVE_USU_MODIFICA, Objeto.Apli);
    V:= Copy(V, 2, Length(V)-1) ;

  If (ArmaMail(Objeto.Apli,
               2,
               'NOTFAC',
               edAtencion.Text,
               strEmailDocumentos,
               strTitulo,
               strEmailNotificacion,
               strError) <> 0) Then
  Begin
  Exit;
  End;

  // Despliega el Reporte para Impresión
  ReportPreview := Nil;
  Application.CreateForm(TFRpNoti, FRpNoti);
  If Assigned(FRpNoti) Then
   With (FRpNoti) Do
    Try
     ReportPreview := TIntQRPreview.CreatePreview(Application, FRpNoti.qFRpNoti);
     qFRpNoti.PrinterSettings.OutputBin := Auto;
     qFRpNoti.Page.Orientation := poPortrait;
     qFRpNoti.PrinterSettings.Orientation := poPortrait;

     FillDataToMemo(strEmailNotificacion);
     If bPreview Then qFRpNoti.Preview
     Else qFRpNoti.Print;

    Finally
     If Assigned(ReportPreview) Then ReportPreview.Free;
     FRpNoti.Free;
    End;
end;

end.

